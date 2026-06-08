#!/usr/bin/env bash
# Deploy and run packaged Unreal Engine builds on local machine, devices, or remote targets.
# Wraps UAT BuildCookRun deploy/run pipeline with device management.
#
# Usage: ./ue-deploy.sh [list|check] --platform <Platform> [options]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"
# shellcheck source=/dev/null
source "${TOOLKIT_ROOT}/scripts/common/ue-env.sh"

# ─── defaults ────────────────────────────────────────────────────────
ACTION=""
PLATFORM=""
CONFIG="Development"
PROJECT=""
DEVICE=""
DEPLOY_ONLY=false
RUN_ONLY=false
COOK_ON_THE_FLY=false
LOCAL=false
STAGE_DIR=""
CMDLINE_ARGS=""
SERVER=false
NO_BUILD=false
ITERATE=false
EXTRA_ARGS=""
TIMEOUT=1800  # 30 minutes
DRY_RUN=false
COOK_FLAVOR=""

# ─── parse args ──────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    list|check)        ACTION="$1";             shift ;;
    --project)         PROJECT="$2";            shift 2 ;;
    --platform)        PLATFORM="$2";           shift 2 ;;
    --config)          CONFIG="$2";             shift 2 ;;
    --device)          DEVICE="$2";             shift 2 ;;
    --deploy-only)     DEPLOY_ONLY=true;        shift ;;
    --run-only)        RUN_ONLY=true;           shift ;;
    --cook-on-the-fly) COOK_ON_THE_FLY=true;    shift ;;
    --local)           LOCAL=true;              shift ;;
    --stage-dir)       STAGE_DIR="$2";          shift 2 ;;
    --cmdline)         CMDLINE_ARGS="$2";       shift 2 ;;
    --server)          SERVER=true;             shift ;;
    --no-build)        NO_BUILD=true;           shift ;;
    --iterate)         ITERATE=true;            shift ;;
    --cook-flavor)     COOK_FLAVOR="$2";        shift 2 ;;
    --extra)           EXTRA_ARGS="$2";         shift 2 ;;
    --timeout)         TIMEOUT="$2";            shift 2 ;;
    --dry-run)         DRY_RUN=true;            shift ;;
    -h|--help)
      cat <<'HELP'
Usage: ue-deploy.sh [list|check] --platform <Platform> [options]

Actions:
  list                 List connected devices for the given platform
  check                Verify deployment prerequisites
  (no action)          Deploy and run (default)

Core Options:
  --project PATH       Path to .uproject file (auto-detected if omitted)
  --platform NAME      Win64 | Linux | LinuxArm64 | Mac | Android | IOS
  --config NAME        Development | Shipping | DebugGame | Test (default: Development)
  --device ID          Target device (IP, serial, user@host)
  --local              Deploy and run on local machine

Deploy Control:
  --deploy-only        Deploy without launching
  --run-only           Launch without redeploying (use existing install)
  --cook-on-the-fly    Stream content from host (no full cook)
  --iterate            Iterative cook for faster turnaround

Build Control:
  --no-build           Skip compilation (use existing binaries)
  --server             Deploy as dedicated server
  --cook-flavor NAME   Texture format for mobile (ETC2, ASTC, Multi)

Output:
  --stage-dir DIR      Custom staging directory
  --cmdline ARGS       Extra args passed to the game executable

Misc:
  --extra ARGS         Additional UAT arguments (pass-through)
  --timeout SECS       Timeout in seconds (default: 1800)
  --dry-run            Print the command without executing

Environment:
  UE_ROOT              Unreal Engine root directory (auto-detected)
  UE_PROJECT           Alternative to --project
  ANDROID_HOME         Android SDK root (for Android)
  NDKROOT              Android NDK root (for Android)
  JAVA_HOME            Java JDK for Android
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

# ─── list devices ────────────────────────────────────────────────────
if [[ "$ACTION" == "list" ]]; then
  echo "Connected devices for ${PLATFORM}:"
  echo ""
  case "$PLATFORM" in
    Android)
      if command -v adb &>/dev/null; then
        adb devices -l
      else
        echo "ERROR: adb not found. Install Android SDK platform-tools."
        echo "  Or set ANDROID_HOME and add \$ANDROID_HOME/platform-tools to PATH."
        exit 1
      fi
      ;;
    IOS)
      if command -v xcrun &>/dev/null; then
        echo "--- Xcode Devices ---"
        xcrun xctrace list devices 2>/dev/null || xcrun instruments -s devices 2>/dev/null || echo "(xcrun failed)"
      elif command -v idevice_id &>/dev/null; then
        echo "--- libimobiledevice ---"
        idevice_id -l
      else
        echo "ERROR: Neither xcrun (Xcode) nor idevice_id found."
        echo "  Install Xcode (macOS) or libimobiledevice."
        exit 1
      fi
      ;;
    Win64|Linux|LinuxArm64|Mac)
      echo "(Local platform — no device listing needed.)"
      echo "Use --local to deploy on this machine, or --device <IP> for remote."
      ;;
    *)
      echo "Platform ${PLATFORM} may require platform-specific device manager."
      echo "Try: RunUAT Turnkey -command=ListDevices -platform=${PLATFORM}"
      ;;
  esac
  exit 0
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

# ─── check prerequisites ────────────────────────────────────────────
if [[ "$ACTION" == "check" ]]; then
  echo ""
  echo "Checking deployment prerequisites for ${PLATFORM}..."
  echo ""
  CHECKS_OK=true

  # Common checks
  echo "[✓] UE_ROOT: ${UE_ROOT}"
  echo "[✓] Project: ${PROJECT}"
  echo "[✓] RunUAT: ${RUNUAT}"

  # Check for existing packaged build
  STAGE_PATH="${PROJECT_DIR}/Saved/StagedBuilds"
  if [[ -d "$STAGE_PATH" ]]; then
    echo "[✓] Staged builds directory exists: ${STAGE_PATH}"
    ls -d "$STAGE_PATH"/*/ 2>/dev/null | while read -r d; do
      echo "    - $(basename "$d")"
    done
  else
    echo "[!] No staged builds found. Run /ue-package first."
    CHECKS_OK=false
  fi

  # Platform-specific checks
  case "$PLATFORM" in
    Android)
      if [[ -n "${ANDROID_HOME:-}" && -d "${ANDROID_HOME:-}" ]]; then
        echo "[✓] ANDROID_HOME: $ANDROID_HOME"
      else
        echo "[✗] ANDROID_HOME not set or not found"
        CHECKS_OK=false
      fi
      if [[ -n "${NDKROOT:-}" && -d "${NDKROOT:-}" ]]; then
        echo "[✓] NDKROOT: $NDKROOT"
      else
        echo "[!] NDKROOT not set (may be auto-detected)"
      fi
      if [[ -n "${JAVA_HOME:-}" && -d "${JAVA_HOME:-}" ]]; then
        echo "[✓] JAVA_HOME: $JAVA_HOME"
      else
        echo "[!] JAVA_HOME not set (may use system Java)"
      fi
      if command -v adb &>/dev/null; then
        DEVICE_COUNT=$(adb devices 2>/dev/null | grep -c "device$" || true)
        echo "[✓] adb found — ${DEVICE_COUNT} device(s) connected"
      else
        echo "[✗] adb not found"
        CHECKS_OK=false
      fi
      ;;
    IOS)
      if [[ "$(ue_host_os)" != "mac" ]]; then
        echo "[✗] iOS deployment requires macOS"
        CHECKS_OK=false
      else
        if command -v xcodebuild &>/dev/null; then
          XCODE_VER=$(xcodebuild -version 2>/dev/null | head -1 || echo "unknown")
          echo "[✓] Xcode: $XCODE_VER"
        else
          echo "[✗] Xcode not installed"
          CHECKS_OK=false
        fi
        PROFILE_COUNT=$(ls ~/Library/MobileDevice/Provisioning\ Profiles/*.mobileprovision 2>/dev/null | wc -l || echo "0")
        echo "[i] Provisioning profiles: ${PROFILE_COUNT}"
      fi
      ;;
    Win64)
      echo "[✓] Windows platform — no special SDK required beyond VS2022"
      ;;
    Linux|LinuxArm64)
      echo "[✓] Linux platform"
      if [[ "$(ue_host_os)" != "linux" ]]; then
        echo "[!] Cross-compiling from $(ue_host_os) — ensure cross-compile toolchain is installed"
      fi
      ;;
    Mac)
      if [[ "$(ue_host_os)" != "mac" ]]; then
        echo "[✗] macOS deployment requires macOS"
        CHECKS_OK=false
      else
        echo "[✓] macOS platform — native build"
      fi
      ;;
  esac

  # Disk space
  FREE_KB=$(df -k "$PROJECT_DIR" 2>/dev/null | tail -1 | awk '{print $4}')
  if [[ -n "$FREE_KB" ]]; then
    FREE_GB=$(( FREE_KB / 1048576 ))
    if [[ "$FREE_GB" -lt 10 ]]; then
      echo "[!] Low disk space: ${FREE_GB} GB free"
    else
      echo "[✓] Disk space: ${FREE_GB} GB free"
    fi
  fi

  echo ""
  if [[ "$CHECKS_OK" == true ]]; then
    echo "All prerequisites OK."
  else
    echo "Some checks failed. Fix the issues above before deploying."
    exit 1
  fi
  exit 0
fi

# ─── pre-flight ──────────────────────────────────────────────────────
echo ""
echo "Pre-flight checks..."

# Validate device for mobile/console
case "$PLATFORM" in
  Android)
    if [[ -z "$DEVICE" && "$LOCAL" != true ]]; then
      # Auto-detect first Android device
      if command -v adb &>/dev/null; then
        DEVICE=$(adb devices 2>/dev/null | sed -n '2p' | cut -f1 || true)
        if [[ -n "$DEVICE" ]]; then
          echo "Auto-detected Android device: ${DEVICE}"
        else
          echo "WARNING: No Android device connected. Deploy may fail."
        fi
      fi
    fi
    ;;
  IOS)
    if [[ "$(ue_host_os)" != "mac" ]]; then
      echo "ERROR: iOS deployment requires macOS."
      exit 1
    fi
    ;;
esac

echo "Pre-flight OK."

# ─── assemble command ────────────────────────────────────────────────
CMD_ARGS=(
  BuildCookRun
  -project="$PROJECT"
  -targetplatform="$PLATFORM"
  -clientconfig="$CONFIG"
  -noP4
  -utf8output
)

# Build step
if [[ "$NO_BUILD" == true || "$RUN_ONLY" == true ]]; then
  CMD_ARGS+=( -skipbuild )
else
  CMD_ARGS+=( -build )
fi

# Cook control
if [[ "$RUN_ONLY" == true ]]; then
  CMD_ARGS+=( -skipcook -skipstage )
elif [[ "$COOK_ON_THE_FLY" == true ]]; then
  CMD_ARGS+=( -cookonthefly )
else
  CMD_ARGS+=( -cook -pak -stage )
  if [[ "$ITERATE" == true ]]; then
    CMD_ARGS+=( -iterativecooking )
  fi
fi

# Cook flavor (mobile texture format)
if [[ -n "$COOK_FLAVOR" ]]; then
  CMD_ARGS+=( -cookflavor="$COOK_FLAVOR" )
elif [[ "$PLATFORM" == "Android" ]]; then
  CMD_ARGS+=( -cookflavor=Multi )
fi

# Deploy and/or run
if [[ "$DEPLOY_ONLY" == true ]]; then
  CMD_ARGS+=( -deploy )
elif [[ "$RUN_ONLY" == true ]]; then
  CMD_ARGS+=( -run )
else
  CMD_ARGS+=( -deploy -run )
fi

# Device
if [[ -n "$DEVICE" ]]; then
  CMD_ARGS+=( -device="$DEVICE" )
fi

# Server mode
if [[ "$SERVER" == true ]]; then
  CMD_ARGS+=( -dedicatedserver -server -noclient )
fi

# Staging directory
if [[ -n "$STAGE_DIR" ]]; then
  CMD_ARGS+=( -stagingdirectory="$STAGE_DIR" )
fi

# Command line args for the game
if [[ -n "$CMDLINE_ARGS" ]]; then
  CMD_ARGS+=( -cmdline="$CMDLINE_ARGS" )
fi

# ─── describe deployment ─────────────────────────────────────────────
DEPLOY_DESC="deploy + run"
if [[ "$DEPLOY_ONLY" == true ]]; then
  DEPLOY_DESC="deploy only"
elif [[ "$RUN_ONLY" == true ]]; then
  DEPLOY_DESC="run only (existing install)"
fi
if [[ "$COOK_ON_THE_FLY" == true ]]; then
  DEPLOY_DESC="${DEPLOY_DESC} (cook-on-the-fly)"
fi
if [[ "$SERVER" == true ]]; then
  DEPLOY_DESC="${DEPLOY_DESC} [server]"
fi

TARGET_DESC="local"
if [[ -n "$DEVICE" ]]; then
  TARGET_DESC="device: ${DEVICE}"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "  Deploy: ${PROJECT_NAME} | ${PLATFORM} | ${CONFIG}"
echo "  Mode:   ${DEPLOY_DESC}"
echo "  Target: ${TARGET_DESC}"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "Command: ${RUNUAT} ${CMD_ARGS[*]} ${EXTRA_ARGS}"
echo ""

if [[ "$DRY_RUN" == true ]]; then
  echo "DRY RUN — command not executed."
  exit 0
fi

START_TIME=$(date +%s)

# macOS does not have `timeout` by default (it's a GNU coreutils command).
# Use timeout if available, otherwise run without wrapper (RunUAT has internal timeouts).
# shellcheck disable=SC2086
if command -v timeout &>/dev/null; then
  timeout "$TIMEOUT" "$RUNUAT" \
    "${CMD_ARGS[@]}" \
    $EXTRA_ARGS \
    2>&1
else
  # On macOS, run without timeout wrapper
  "$RUNUAT" \
    "${CMD_ARGS[@]}" \
    $EXTRA_ARGS \
    2>&1
fi

DEPLOY_EXIT=$?
END_TIME=$(date +%s)
ELAPSED=$(( END_TIME - START_TIME ))
MINUTES=$(( ELAPSED / 60 ))
SECONDS_REM=$(( ELAPSED % 60 ))

echo ""
if [[ $DEPLOY_EXIT -eq 0 ]]; then
  echo "DEPLOY SUCCEEDED in ${MINUTES}m ${SECONDS_REM}s"
  if [[ -n "$DEVICE" ]]; then
    echo "Target: ${DEVICE}"
  fi
else
  echo "DEPLOY FAILED (exit code: ${DEPLOY_EXIT}) after ${MINUTES}m ${SECONDS_REM}s"
  echo ""
  echo "Troubleshooting:"
  case "$PLATFORM" in
    Android)
      echo "  1. Check device connection: adb devices"
      echo "  2. Check logs: adb logcat -s UE:*"
      echo "  3. Try uninstalling first: adb uninstall com.yourcompany.${PROJECT_NAME,,}"
      echo "  4. Verify USB debugging is enabled"
      ;;
    IOS)
      echo "  1. Check provisioning profile and certificate"
      echo "  2. Verify device is registered in Apple Developer Portal"
      echo "  3. Check Xcode > Devices for device status"
      echo "  4. View Console.app for device logs"
      ;;
    *)
      echo "  1. Check the output above for 'ERROR:' lines"
      echo "  2. Verify the packaged build exists (run /ue-package first)"
      echo "  3. Check network connectivity for remote targets"
      ;;
  esac
  exit $DEPLOY_EXIT
fi
