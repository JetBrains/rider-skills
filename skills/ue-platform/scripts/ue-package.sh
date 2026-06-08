#!/usr/bin/env bash
# Package an Unreal Engine project using RunUAT BuildCookRun.
# Full pipeline: build -> cook -> pak -> stage -> archive.
# Enhanced version with iostore, compression, distribution, patching support.
#
# Usage: ./ue-package.sh --project <path.uproject> [options]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"
# shellcheck source=/dev/null
source "${TOOLKIT_ROOT}/scripts/common/ue-env.sh"

# ─── defaults ────────────────────────────────────────────────────────
PLATFORM=""
CONFIG="Development"
PROJECT=""
ARCHIVE_DIR=""
STAGING_DIR=""
SERVER=false
NO_BUILD=false
ITERATE=false
CLEAN=false
MAP=""
ALLMAPS=false
IOSTORE=false
COMPRESSED=false
DISTRIBUTION=false
NODEBUGINFO=false
PATCH_VER=""
RELEASE_VER=""
ENCRYPT=false
EXTRA_ARGS=""
TIMEOUT=3600  # 60 minutes
DRY_RUN=false

# ─── parse args ──────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --project)       PROJECT="$2";       shift 2 ;;
    --platform)      PLATFORM="$2";      shift 2 ;;
    --config)        CONFIG="$2";        shift 2 ;;
    --archive)       ARCHIVE_DIR="$2";   shift 2 ;;
    --staging)       STAGING_DIR="$2";   shift 2 ;;
    --server)        SERVER=true;        shift ;;
    --no-build)      NO_BUILD=true;      shift ;;
    --iterate)       ITERATE=true;       shift ;;
    --clean)         CLEAN=true;         shift ;;
    --map)           MAP="$2";           shift 2 ;;
    --allmaps)        ALLMAPS=true;       shift ;;
    --iostore)       IOSTORE=true;       shift ;;
    --compressed)    COMPRESSED=true;    shift ;;
    --distribution)  DISTRIBUTION=true;  shift ;;
    --nodebuginfo)   NODEBUGINFO=true;   shift ;;
    --patch)         PATCH_VER="$2";     shift 2 ;;
    --release)       RELEASE_VER="$2";   shift 2 ;;
    --encrypt)       ENCRYPT=true;       shift ;;
    --extra)         EXTRA_ARGS="$2";    shift 2 ;;
    --timeout)       TIMEOUT="$2";       shift 2 ;;
    --dry-run)       DRY_RUN=true;       shift ;;
    -h|--help)
      cat <<'HELP'
Usage: ue-package.sh --project <path.uproject> [options]

Core Options:
  --project PATH       Path to .uproject file (auto-detected if omitted)
  --platform NAME      Win64 | Linux | LinuxArm64 | Mac | Android | IOS
  --config NAME        Development | Shipping | DebugGame | Test (default: Development)
  --archive DIR        Archive output directory
  --staging DIR        Staging directory override

Build Control:
  --no-build           Skip compile step (use existing binaries)
  --clean              Clean before building

Cook Options:
  --iterate            Iterative cooking (only re-cook changed assets)
  --map MAPS           Cook specific map(s), '+' separated (e.g. Map1+Map2)
  --allmaps             Cook all maps

Packaging Options:
  --iostore            Use IoStore format (.ucas/.utoc) — modern UE5, faster I/O
  --compressed         Compress pak files (smaller size, slower load)
  --distribution       Mark as store-ready distribution build
  --nodebuginfo        Exclude debug symbols (.pdb) from staging
  --encrypt            Encrypt .ini files in pak

Server:
  --server             Build dedicated server (no client)

Patching:
  --release VER        Create release version baseline (e.g. --release 1.0)
  --patch VER          Generate patch based on release version (e.g. --patch 1.0)

Misc:
  --extra ARGS         Additional UAT arguments (pass-through)
  --timeout SECS       Timeout in seconds (default: 3600)
  --dry-run            Print the command without executing

Environment:
  UE_ROOT              Unreal Engine root directory (auto-detected)
  UE_PROJECT           Alternative to --project
HELP
      exit 0
      ;;
    *) echo "ERROR: Unknown argument: $1"; exit 1 ;;
  esac
done

if [[ -z "$PLATFORM" ]]; then
  PLATFORM=$(ue_detect_platform)
  echo "Auto-detected platform: ${PLATFORM}"
fi

if [[ -z "$PROJECT" ]]; then
  PROJECT="${UE_PROJECT:-}"
fi

if [[ -z "$PROJECT" ]]; then
  PROJECT=$(ue_find_uproject "$(pwd)") || true
fi

if [[ -z "$PROJECT" || ! -f "$PROJECT" ]]; then
  echo "ERROR: No .uproject file found."
  echo "  Provide --project <path> or set UE_PROJECT, or run from within a UE project directory."
  exit 1
fi

PROJECT=$(cd "$(dirname "$PROJECT")" && pwd)/$(basename "$PROJECT")
PROJECT_NAME=$(basename "$PROJECT" .uproject)
PROJECT_DIR=$(dirname "$PROJECT")
echo "Project: ${PROJECT}"

if [[ -z "${UE_ROOT:-}" ]]; then
  ENGINE_VERSION=$(grep -o '"EngineAssociation"[[:space:]]*:[[:space:]]*"[^"]*"' "$PROJECT" | sed -E 's/.*"([^"]+)"$/\1/' || true)
  UE_ROOT=$(ue_find_root "${ENGINE_VERSION:-}") || true
fi

if [[ -z "${UE_ROOT:-}" || ! -d "${UE_ROOT:-}" ]]; then
  echo "ERROR: Unreal Engine root not found."
  echo "  Set UE_ROOT explicitly."
  echo "  macOS:   export UE_ROOT=\"/Users/Shared/Epic Games/UE_5.6\""
  echo "  Linux:   export UE_ROOT=\"$HOME/UnrealEngine/UE_5.6\""
  echo "  Windows: set UE_ROOT=C:\\Program Files\\Epic Games\\UE_5.6"
  exit 1
fi

echo "UE_ROOT: ${UE_ROOT}"

# ─── locate RunUAT ──────────────────────────────────────────────────
RUNUAT=""
case "$(ue_host_os)" in
  mac|linux|wsl)
    if [[ -f "${UE_ROOT}/Engine/Build/BatchFiles/RunUAT.sh" ]]; then
      RUNUAT="${UE_ROOT}/Engine/Build/BatchFiles/RunUAT.sh"
    fi
    ;;
  windows)
    if [[ -f "${UE_ROOT}/Engine/Build/BatchFiles/RunUAT.bat" ]]; then
      RUNUAT="${UE_ROOT}/Engine/Build/BatchFiles/RunUAT.bat"
    fi
    ;;
esac

if [[ -z "$RUNUAT" ]]; then
  echo "ERROR: RunUAT not found in ${UE_ROOT}"
  echo "  Expected at: Engine/Build/BatchFiles/RunUAT.sh (or .bat on Windows)"
  exit 1
fi

echo "RunUAT: ${RUNUAT}"

# ─── pre-flight checks ──────────────────────────────────────────────
echo ""
echo "Pre-flight checks..."

# Check disk space (warn if < 20 GB free)
FREE_KB=$(df -k "$PROJECT_DIR" 2>/dev/null | tail -1 | awk '{print $4}')
if [[ -n "$FREE_KB" && "$FREE_KB" -lt 20971520 ]]; then
  FREE_GB=$(( FREE_KB / 1048576 ))
  echo "WARNING: Low disk space — ${FREE_GB} GB free. Packaging may need 20+ GB."
fi

# Check for Shipping-specific concerns
if [[ "$CONFIG" == "Shipping" ]]; then
  if [[ "$NODEBUGINFO" != true ]]; then
    echo "HINT: Consider --nodebuginfo for Shipping to reduce package size."
  fi
  if [[ "$COMPRESSED" != true ]]; then
    echo "HINT: Consider --compressed for Shipping to reduce download size."
  fi
fi

echo "Pre-flight OK."

# ─── assemble command ────────────────────────────────────────────────
CMD_ARGS=(
  BuildCookRun
  -project="$PROJECT"
  -targetplatform="$PLATFORM"
  -clientconfig="$CONFIG"
  -noP4
  -cook
  -pak
  -stage
  -prereqs
  -utf8output
)

# Build step
if [[ "$NO_BUILD" == true ]]; then
  CMD_ARGS+=( -skipbuild )
else
  CMD_ARGS+=( -build )
fi

# Clean
if [[ "$CLEAN" == true ]]; then
  CMD_ARGS+=( -clean )
fi

# Iterative cooking
if [[ "$ITERATE" == true ]]; then
  CMD_ARGS+=( -iterativecooking )
fi

# Map selection
if [[ "$ALLMAPS" == true ]]; then
  CMD_ARGS+=( -allmaps )
elif [[ -n "$MAP" ]]; then
  CMD_ARGS+=( -map="$MAP" )
fi

# IoStore
if [[ "$IOSTORE" == true ]]; then
  CMD_ARGS+=( -iostore )
fi

# Compression
if [[ "$COMPRESSED" == true ]]; then
  CMD_ARGS+=( -compressed )
fi

# Distribution
if [[ "$DISTRIBUTION" == true ]]; then
  CMD_ARGS+=( -distribution )
fi

# Debug info
if [[ "$NODEBUGINFO" == true ]]; then
  CMD_ARGS+=( -nodebuginfo )
fi

# Encryption
if [[ "$ENCRYPT" == true ]]; then
  CMD_ARGS+=( -encryptinifiles )
fi

# Server
if [[ "$SERVER" == true ]]; then
  CMD_ARGS+=( -dedicatedserver -server -noclient )
fi

# Release version baseline
if [[ -n "$RELEASE_VER" ]]; then
  CMD_ARGS+=( -createreleaseversion="$RELEASE_VER" )
fi

# Patch generation
if [[ -n "$PATCH_VER" ]]; then
  CMD_ARGS+=( -basedonreleaseversion="$PATCH_VER" -generatepatch )
fi

# Archive
if [[ -n "$ARCHIVE_DIR" ]]; then
  CMD_ARGS+=( -archive -archivedirectory="$ARCHIVE_DIR" )
fi

# Staging
if [[ -n "$STAGING_DIR" ]]; then
  CMD_ARGS+=( -stagingdirectory="$STAGING_DIR" )
fi

# ─── build pipeline description ──────────────────────────────────────
PIPELINE="cook -> pak -> stage"
if [[ "$NO_BUILD" != true ]]; then
  PIPELINE="build -> ${PIPELINE}"
fi
if [[ "$IOSTORE" == true ]]; then
  PIPELINE="${PIPELINE} (iostore)"
fi
if [[ -n "$ARCHIVE_DIR" ]]; then
  PIPELINE="${PIPELINE} -> archive"
fi
if [[ -n "$PATCH_VER" ]]; then
  PIPELINE="${PIPELINE} (patch from ${PATCH_VER})"
fi

# ─── run BuildCookRun ────────────────────────────────────────────────
echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "  Packaging: ${PROJECT_NAME} | ${PLATFORM} | ${CONFIG}"
echo "  Pipeline:  ${PIPELINE}"
if [[ -n "$ARCHIVE_DIR" ]]; then
  echo "  Archive:   ${ARCHIVE_DIR}"
fi
if [[ "$DISTRIBUTION" == true ]]; then
  echo "  Mode:      DISTRIBUTION (store-ready)"
fi
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "Command: ${RUNUAT} ${CMD_ARGS[*]} ${EXTRA_ARGS}"
echo ""

if [[ "$DRY_RUN" == true ]]; then
  echo "DRY RUN — command not executed."
  exit 0
fi

START_TIME=$(date +%s)

# shellcheck disable=SC2086
# macOS does not have `timeout` by default (it's a GNU coreutils command).
# Use perl-based timeout on macOS, or run without timeout if neither is available.
if command -v timeout &>/dev/null; then
  timeout "$TIMEOUT" "$RUNUAT" \
    "${CMD_ARGS[@]}" \
    $EXTRA_ARGS \
    2>&1
elif [[ "$(uname)" == "Darwin" ]]; then
  # On macOS, run without timeout wrapper (RunUAT has its own internal timeouts)
  "$RUNUAT" \
    "${CMD_ARGS[@]}" \
    $EXTRA_ARGS \
    2>&1
else
  "$RUNUAT" \
    "${CMD_ARGS[@]}" \
    $EXTRA_ARGS \
    2>&1
fi

BUILD_EXIT=$?
END_TIME=$(date +%s)
ELAPSED=$(( END_TIME - START_TIME ))
MINUTES=$(( ELAPSED / 60 ))
SECONDS_REM=$(( ELAPSED % 60 ))

echo ""
if [[ $BUILD_EXIT -eq 0 ]]; then
  echo "PACKAGE SUCCEEDED in ${MINUTES}m ${SECONDS_REM}s"
  if [[ -n "$ARCHIVE_DIR" ]]; then
    echo "Output: ${ARCHIVE_DIR}"
    # Show package size
    if [[ -d "$ARCHIVE_DIR" ]]; then
      SIZE=$(du -sh "$ARCHIVE_DIR" 2>/dev/null | cut -f1 || echo "unknown")
      echo "Size:   ${SIZE}"
    fi
  fi
else
  echo "PACKAGE FAILED (exit code: ${BUILD_EXIT}) after ${MINUTES}m ${SECONDS_REM}s"
  echo ""
  echo "Troubleshooting:"
  echo "  1. Check for 'LogCook: Error:' or 'ERROR:' in the output above"
  echo "  2. Try --clean for a fresh cook if iterative cook was used"
  echo "  3. Verify all assets load in the editor without errors"
  echo "  4. Check disk space: df -h $(dirname "$PROJECT")"
  exit $BUILD_EXIT
fi
