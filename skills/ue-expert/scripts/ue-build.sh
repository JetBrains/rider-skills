#!/usr/bin/env bash
# Build (compile) an Unreal Engine project using UnrealBuildTool.
# Usage: ./ue-build.sh --project <path.uproject> [--platform Win64] [--config Development] [--target Editor] [--extra-args "..."]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"
# shellcheck source=/dev/null
source "${TOOLKIT_ROOT}/scripts/common/ue-env.sh"

# ─── defaults ────────────────────────────────────────────────────────
PLATFORM=""
CONFIG="Development"
TARGET="Editor"
PROJECT=""
EXTRA_ARGS=""
TIMEOUT=1800  # 30 minutes
FORCE_UBT=false

# ─── parse args ──────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --project)   PROJECT="$2";     shift 2 ;;
    --platform)  PLATFORM="$2";    shift 2 ;;
    --config)    CONFIG="$2";      shift 2 ;;
    --target)    TARGET="$2";      shift 2 ;;
    --extra)     EXTRA_ARGS="$2";  shift 2 ;;
    --timeout)   TIMEOUT="$2";     shift 2 ;;
    --force-ubt) FORCE_UBT=true;   shift ;;
    -h|--help)
      echo "Usage: $0 --project <path.uproject> [options]"
      echo ""
      echo "Options:"
      echo "  --project PATH   Path to .uproject file (auto-detected if omitted)"
      echo "  --platform NAME  Win64 | Linux | LinuxArm64 | Mac (auto-detected)"
      echo "  --config NAME    Debug | DebugGame | Development | Test | Shipping"
      echo "  --target NAME    Game | Editor | Server | Client (default: Editor)"
      echo "  --extra ARGS     Additional UBT arguments"
      echo "  --timeout SECS   Build timeout in seconds (default: 1800)"
      echo ""
      echo "Environment:"
      echo "  UE_ROOT          Unreal Engine root directory (auto-detected)"
      echo "  UE_PROJECT       Alternative to --project"
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
echo "Project name: ${PROJECT_NAME}"

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

# ─── locate bundled .NET runtime ─────────────────────────────────────
# UE ships a bundled .NET runtime under Engine/Binaries/ThirdParty/DotNet/.
# Use it when available so we don't depend on the system-installed .NET version
# (e.g., system has .NET 10 but UBT needs .NET 8).
BUNDLED_DOTNET=""
find_bundled_dotnet() {
  local dotnet_base="${UE_ROOT}/Engine/Binaries/ThirdParty/DotNet"
  if [[ ! -d "$dotnet_base" ]]; then
    return 1
  fi
  # Find the latest version directory
  local version_dir
  version_dir=$(ls -d "$dotnet_base"/*/ 2>/dev/null | sort -V | tail -1)
  if [[ -z "$version_dir" ]]; then
    return 1
  fi
  # Pick the right architecture subdirectory
  local arch_dir=""
  case "$(ue_host_os)-$(uname -m)" in
    mac-arm64)      arch_dir="${version_dir}mac-arm64" ;;
    mac-x86_64)     arch_dir="${version_dir}mac-x64" ;;
    linux-aarch64)  arch_dir="${version_dir}linux-arm64" ;;
    linux-x86_64)   arch_dir="${version_dir}linux-x64" ;;
    wsl-aarch64)    arch_dir="${version_dir}linux-arm64" ;;
    wsl-x86_64)     arch_dir="${version_dir}linux-x64" ;;
  esac
  if [[ -n "$arch_dir" && -x "${arch_dir}/dotnet" ]]; then
    echo "$arch_dir"
    return 0
  fi
  return 1
}

# ─── locate UBT binary ──────────────────────────────────────────────
# UBT_CMD is an array to correctly handle paths with spaces (e.g.,
# "/Users/Shared/Epic Games/UE_5.7/..."). Using a plain string and
# unquoted $UBT would word-split on spaces in the path.
UBT_CMD=()
UBT_DLL="${UE_ROOT}/Engine/Binaries/DotNET/UnrealBuildTool/UnrealBuildTool.dll"

case "$(ue_host_os)" in
  mac|linux|wsl)
    if [[ -f "$UBT_DLL" ]]; then
      # Prefer bundled dotnet to avoid system .NET version mismatches
      BUNDLED_DOTNET=$(find_bundled_dotnet) || true
      if [[ -n "$BUNDLED_DOTNET" ]]; then
        export DOTNET_ROOT="$BUNDLED_DOTNET"
        UBT_CMD=("${BUNDLED_DOTNET}/dotnet" "$UBT_DLL")
      elif [[ -f "${UE_ROOT}/Engine/Binaries/DotNET/UnrealBuildTool/UnrealBuildTool" ]]; then
        UBT_CMD=("${UE_ROOT}/Engine/Binaries/DotNET/UnrealBuildTool/UnrealBuildTool")
      else
        UBT_CMD=(dotnet "$UBT_DLL")
      fi
    elif [[ -f "${UE_ROOT}/Engine/Binaries/DotNET/UnrealBuildTool/UnrealBuildTool" ]]; then
      UBT_CMD=("${UE_ROOT}/Engine/Binaries/DotNET/UnrealBuildTool/UnrealBuildTool")
    # Legacy UE4 path
    elif [[ -f "${UE_ROOT}/Engine/Binaries/DotNET/UnrealBuildTool.exe" ]]; then
      UBT_CMD=(mono "${UE_ROOT}/Engine/Binaries/DotNET/UnrealBuildTool.exe")
    fi
    ;;
  windows)
    if [[ -f "${UE_ROOT}/Engine/Binaries/DotNET/UnrealBuildTool/UnrealBuildTool.exe" ]]; then
      UBT_CMD=("${UE_ROOT}/Engine/Binaries/DotNET/UnrealBuildTool/UnrealBuildTool.exe")
    elif [[ -f "${UE_ROOT}/Engine/Binaries/DotNET/UnrealBuildTool.exe" ]]; then
      UBT_CMD=("${UE_ROOT}/Engine/Binaries/DotNET/UnrealBuildTool.exe")
    fi
    ;;
esac

if [[ ${#UBT_CMD[@]} -eq 0 ]]; then
  echo "ERROR: UnrealBuildTool not found in ${UE_ROOT}"
  echo "  Expected at: Engine/Binaries/DotNET/UnrealBuildTool/"
  exit 1
fi

echo "UBT: ${UBT_CMD[*]}"
if [[ -n "$BUNDLED_DOTNET" ]]; then
  echo "Using bundled .NET: ${BUNDLED_DOTNET}"
fi

# ─── build target name ──────────────────────────────────────────────
# UBT target format: <ProjectName><TargetSuffix>
# Editor target = <ProjectName>Editor, Game target = <ProjectName>, etc.
BUILD_TARGET="${PROJECT_NAME}"
case "$TARGET" in
  Editor)  BUILD_TARGET="${PROJECT_NAME}Editor" ;;
  Game)    BUILD_TARGET="${PROJECT_NAME}" ;;
  Server)  BUILD_TARGET="${PROJECT_NAME}Server" ;;
  Client)  BUILD_TARGET="${PROJECT_NAME}Client" ;;
  *)       BUILD_TARGET="$TARGET" ;;  # allow custom target names
esac

# ─── resolve ue-exec.sh path ─────────────────────────────────────────
EXEC_SCRIPT="${SCRIPT_DIR}/../../ue-scripter/scripts/ue-exec.sh"
if [[ ! -f "$EXEC_SCRIPT" ]]; then
  EXEC_SCRIPT="$HOME/.claude/skills/ue-scripter/scripts/ue-exec.sh"
fi

# ─── check if editor is running (Live Coding) ───────────────────────
# For Editor targets, check if the editor is already running via AgentBridge.
# If so, use Live Coding (hot reload) instead of a full UBT rebuild.
USE_LIVE_CODING=false
if [[ "$TARGET" == "Editor" && -f "$EXEC_SCRIPT" && "$FORCE_UBT" != "true" ]]; then
  if bash "$EXEC_SCRIPT" --health &>/dev/null; then
    USE_LIVE_CODING=true
  fi
fi

if [[ "$USE_LIVE_CODING" == "true" ]]; then
  echo ""
  echo "═══════════════════════════════════════════════════════════════"
  echo "  Live Coding: Editor is running"
  echo "  Building: ${BUILD_TARGET} | ${PLATFORM} | ${CONFIG}"
  echo "═══════════════════════════════════════════════════════════════"
  echo ""

  START_TIME=$(date +%s)

  bash "$EXEC_SCRIPT" --build --wait 2>&1
  BUILD_EXIT=$?

  END_TIME=$(date +%s)
  ELAPSED=$(( END_TIME - START_TIME ))
  MINUTES=$(( ELAPSED / 60 ))
  SECONDS_REM=$(( ELAPSED % 60 ))

  echo ""
  if [[ $BUILD_EXIT -eq 0 ]]; then
    echo "LIVE CODING BUILD SUCCEEDED in ${MINUTES}m ${SECONDS_REM}s"
  else
    echo "LIVE CODING BUILD FAILED (exit code: ${BUILD_EXIT}) after ${MINUTES}m ${SECONDS_REM}s"
    exit $BUILD_EXIT
  fi
else
  # ─── run UBT ─────────────────────────────────────────────────────────
  echo ""
  echo "═══════════════════════════════════════════════════════════════"
  echo "  Building: ${BUILD_TARGET} | ${PLATFORM} | ${CONFIG}"
  echo "═══════════════════════════════════════════════════════════════"
  echo ""

  START_TIME=$(date +%s)

  # UBT_CMD is an array — "${UBT_CMD[@]}" correctly preserves spaces in paths.
  # EXTRA_ARGS is intentionally unquoted to allow word-splitting of user flags.
  # shellcheck disable=SC2086
  "${UBT_CMD[@]}" \
    "$BUILD_TARGET" \
    "$PLATFORM" \
    "$CONFIG" \
    -Project="$PROJECT" \
    -WaitMutex \
    -FromMsBuild \
    $EXTRA_ARGS \
    2>&1

  BUILD_EXIT=$?
  END_TIME=$(date +%s)
  ELAPSED=$(( END_TIME - START_TIME ))
  MINUTES=$(( ELAPSED / 60 ))
  SECONDS_REM=$(( ELAPSED % 60 ))

  echo ""
  if [[ $BUILD_EXIT -eq 0 ]]; then
    echo "BUILD SUCCEEDED in ${MINUTES}m ${SECONDS_REM}s"
  else
    echo "BUILD FAILED (exit code: ${BUILD_EXIT}) after ${MINUTES}m ${SECONDS_REM}s"
    exit $BUILD_EXIT
  fi
fi
