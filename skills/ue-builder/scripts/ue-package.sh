#!/usr/bin/env bash
# Package an Unreal Engine project using RunUAT BuildCookRun.
# Full pipeline: build → cook → pak → stage → archive.
# Usage: ./ue-package.sh --project <path.uproject> [--platform Win64] [--config Shipping] [--archive <dir>] ...

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
EXTRA_ARGS=""
TIMEOUT=3600  # 60 minutes

# ─── parse args ──────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --project)    PROJECT="$2";      shift 2 ;;
    --platform)   PLATFORM="$2";     shift 2 ;;
    --config)     CONFIG="$2";       shift 2 ;;
    --archive)    ARCHIVE_DIR="$2";  shift 2 ;;
    --staging)    STAGING_DIR="$2";  shift 2 ;;
    --server)     SERVER=true;       shift ;;
    --no-build)   NO_BUILD=true;     shift ;;
    --iterate)    ITERATE=true;      shift ;;
    --clean)      CLEAN=true;        shift ;;
    --map)        MAP="$2";          shift 2 ;;
    --extra)      EXTRA_ARGS="$2";   shift 2 ;;
    --timeout)    TIMEOUT="$2";      shift 2 ;;
    -h|--help)
      echo "Usage: $0 --project <path.uproject> [options]"
      echo ""
      echo "Options:"
      echo "  --project PATH    Path to .uproject file (auto-detected if omitted)"
      echo "  --platform NAME   Win64 | Linux | LinuxArm64 | Mac (auto-detected)"
      echo "  --config NAME     Development | Shipping | DebugGame | Test"
      echo "  --archive DIR     Archive output directory"
      echo "  --staging DIR     Staging directory override"
      echo "  --server          Build dedicated server"
      echo "  --no-build        Skip compile step (use existing binaries)"
      echo "  --iterate         Iterative cooking (faster for incremental changes)"
      echo "  --clean           Clean before building"
      echo "  --map NAME        Cook/run specific map(s), comma-separated"
      echo "  --extra ARGS      Additional UAT arguments"
      echo "  --timeout SECS    Timeout in seconds (default: 3600)"
      echo ""
      echo "Environment:"
      echo "  UE_ROOT           Unreal Engine root directory (auto-detected)"
      echo "  UE_PROJECT        Alternative to --project"
      exit 0
      ;;
    *) echo "Unknown argument: $1"; exit 1 ;;
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

# ─── assemble command ────────────────────────────────────────────────
CMD_ARGS=(
  BuildCookRun
  -project="$PROJECT"
  -targetplatform="$PLATFORM"
  -clientconfig="$CONFIG"
  -cook
  -pak
  -stage
  -prereqs
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

# Server
if [[ "$SERVER" == true ]]; then
  CMD_ARGS+=( -dedicatedserver -server -noclient )
fi

# Specific maps
if [[ -n "$MAP" ]]; then
  CMD_ARGS+=( -map="$MAP" )
fi

# Archive
if [[ -n "$ARCHIVE_DIR" ]]; then
  CMD_ARGS+=( -archive -archivedirectory="$ARCHIVE_DIR" )
fi

# Staging
if [[ -n "$STAGING_DIR" ]]; then
  CMD_ARGS+=( -stagingdirectory="$STAGING_DIR" )
fi

# ─── run BuildCookRun ────────────────────────────────────────────────
echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "  Packaging: ${PROJECT_NAME} | ${PLATFORM} | ${CONFIG}"
echo "  Pipeline:  build → cook → pak → stage"
if [[ -n "$ARCHIVE_DIR" ]]; then
  echo "  Archive:   ${ARCHIVE_DIR}"
fi
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "Command: ${RUNUAT} ${CMD_ARGS[*]} ${EXTRA_ARGS}"
echo ""

START_TIME=$(date +%s)

# shellcheck disable=SC2086
timeout "$TIMEOUT" "$RUNUAT" \
  "${CMD_ARGS[@]}" \
  $EXTRA_ARGS \
  2>&1

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
  fi
else
  echo "PACKAGE FAILED (exit code: ${BUILD_EXIT}) after ${MINUTES}m ${SECONDS_REM}s"
  exit $BUILD_EXIT
fi
