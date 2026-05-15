#!/usr/bin/env bash
# Build a Unity project headlessly by invoking an editor method via -executeMethod.
# Usage: ./unity-build.sh --project <path> --method <Type.Method> [--target <BuildTarget>] [--log <path>] [--unity <path>] [--extra "args"]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# ─── defaults ────────────────────────────────────────────────────────
PROJECT=""
METHOD=""
TARGET=""           # optional Unity BuildTarget hint (StandaloneOSX, StandaloneWindows64, Android, iOS, ...)
LOG=""
UNITY=""            # Unity executable
EXTRA_ARGS=""
TIMEOUT=3600        # 60 minutes default; Unity batch builds can be long
NO_GRAPHICS=false   # default OFF: leaving graphics enabled is safer for shader-touching builds

# ─── parse args ──────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --project)      PROJECT="$2";    shift 2 ;;
    --method)       METHOD="$2";     shift 2 ;;
    --target)       TARGET="$2";     shift 2 ;;
    --log)          LOG="$2";        shift 2 ;;
    --unity)        UNITY="$2";      shift 2 ;;
    --extra)        EXTRA_ARGS="$2"; shift 2 ;;
    --timeout)      TIMEOUT="$2";    shift 2 ;;
    --no-graphics)  NO_GRAPHICS=true; shift ;;
    -h|--help)
      cat <<EOF
Usage: $0 --project <UnityProjectPath> --method <Static.Method> [options]

Required:
  --project PATH       Path to Unity project (the dir containing Assets/, ProjectSettings/)
  --method  NAME       Fully qualified static method to invoke via -executeMethod
                       (must live under an Editor/ asmdef or be guarded by UNITY_EDITOR)

Options:
  --target NAME        Unity BuildTarget passed to -buildTarget
                       (StandaloneOSX | StandaloneWindows64 | StandaloneLinux64 |
                        Android | iOS | WebGL | ...)
  --log PATH           Path for -logFile (default: /tmp/unity-build.log)
  --unity PATH         Unity executable (auto-detected from ProjectVersion.txt)
  --extra ARGS         Extra args appended to the Unity command line
  --timeout SECS       Build timeout in seconds (default: 3600)
  --no-graphics        Pass -nographics (skip graphics device init; breaks shader-touching imports)

Environment:
  UNITY_HUB_PATH       Override Unity Hub Editor install root
                       (default: ~/Applications/Unity/Hub/Editor on macOS,
                        /Applications/Unity/Hub/Editor on macOS Hub install,
                        C:\\Program Files\\Unity\\Hub\\Editor on Windows,
                        ~/Unity/Hub/Editor on Linux)
  UNITY_PROJECT        Alternative to --project
  UNITY_BIN            Explicit Unity executable; takes precedence over auto-detection
EOF
      exit 0
      ;;
    *) echo "Unknown argument: $1"; exit 1 ;;
  esac
done

# ─── resolve project path ───────────────────────────────────────────
if [[ -z "$PROJECT" ]]; then PROJECT="${UNITY_PROJECT:-}"; fi
if [[ -z "$PROJECT" ]]; then PROJECT="$(pwd)"; fi
PROJECT="$(cd "$PROJECT" && pwd)"

if [[ ! -d "$PROJECT/Assets" || ! -d "$PROJECT/ProjectSettings" ]]; then
  echo "ERROR: $PROJECT does not look like a Unity project (missing Assets/ or ProjectSettings/)"
  exit 1
fi

VERSION_FILE="$PROJECT/ProjectSettings/ProjectVersion.txt"
if [[ ! -f "$VERSION_FILE" ]]; then
  echo "ERROR: ProjectVersion.txt missing — cannot auto-detect Unity version."
  exit 1
fi
UNITY_VERSION="$(awk '/^m_EditorVersion: /{print $2; exit}' "$VERSION_FILE")"
echo "Project:        $PROJECT"
echo "Unity version:  $UNITY_VERSION"

# ─── locate Unity executable ────────────────────────────────────────
host_os() {
  case "$(uname -s)" in
    Darwin*) echo mac ;;
    Linux*)  if grep -qiE "(microsoft|wsl)" /proc/version 2>/dev/null; then echo wsl; else echo linux; fi ;;
    MINGW*|MSYS*|CYGWIN*) echo windows ;;
    *) echo unknown ;;
  esac
}

find_unity() {
  local v="$1"
  if [[ -n "${UNITY_BIN:-}" && -x "${UNITY_BIN}" ]]; then echo "${UNITY_BIN}"; return 0; fi

  local hub_roots=()
  if [[ -n "${UNITY_HUB_PATH:-}" ]]; then hub_roots+=("$UNITY_HUB_PATH"); fi

  case "$(host_os)" in
    mac)
      hub_roots+=("/Applications/Unity/Hub/Editor" "$HOME/Applications/Unity/Hub/Editor")
      for root in "${hub_roots[@]}"; do
        local bin="$root/$v/Unity.app/Contents/MacOS/Unity"
        [[ -x "$bin" ]] && echo "$bin" && return 0
      done
      ;;
    linux)
      hub_roots+=("$HOME/Unity/Hub/Editor")
      for root in "${hub_roots[@]}"; do
        local bin="$root/$v/Editor/Unity"
        [[ -x "$bin" ]] && echo "$bin" && return 0
      done
      ;;
    windows|wsl)
      hub_roots+=("/c/Program Files/Unity/Hub/Editor" "C:/Program Files/Unity/Hub/Editor")
      for root in "${hub_roots[@]}"; do
        local bin="$root/$v/Editor/Unity.exe"
        [[ -x "$bin" || -f "$bin" ]] && echo "$bin" && return 0
      done
      ;;
  esac
  return 1
}

if [[ -z "$UNITY" ]]; then
  UNITY="$(find_unity "$UNITY_VERSION")" || true
fi

if [[ -z "$UNITY" || ! -e "$UNITY" ]]; then
  echo "ERROR: Could not locate Unity $UNITY_VERSION."
  echo "  Set UNITY_BIN, --unity, or install via Unity Hub. Searched standard Hub paths."
  exit 1
fi
echo "Unity binary:   $UNITY"

# ─── validate method ────────────────────────────────────────────────
if [[ -z "$METHOD" ]]; then
  echo "ERROR: --method is required (e.g., --method BuildScripts.CI.BuildMac)"
  echo "  The method must be a public static method in an Editor/ asmdef."
  exit 1
fi

# ─── prepare log ────────────────────────────────────────────────────
if [[ -z "$LOG" ]]; then LOG="/tmp/unity-build.log"; fi
mkdir -p "$(dirname "$LOG")"
: > "$LOG"
echo "Log file:       $LOG"

# ─── assemble command ───────────────────────────────────────────────
CMD=("$UNITY" -batchmode -quit
     -projectPath "$PROJECT"
     -executeMethod "$METHOD"
     -logFile "$LOG")

if [[ "$NO_GRAPHICS" == "true" ]]; then CMD+=(-nographics); fi
if [[ -n "$TARGET" ]]; then CMD+=(-buildTarget "$TARGET"); fi
# EXTRA_ARGS intentionally word-split to allow user-supplied flags.
# shellcheck disable=SC2206
EXTRA_SPLIT=($EXTRA_ARGS)
CMD+=("${EXTRA_SPLIT[@]}")

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "  Unity Build"
echo "  Method:   $METHOD"
echo "  Target:   ${TARGET:-<from method>}"
echo "  Timeout:  ${TIMEOUT}s"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "Command: ${CMD[*]}"

START_TIME=$(date +%s)

# Unity writes its own log via -logFile; capture stderr too.
set +e
if command -v timeout >/dev/null 2>&1; then
  timeout "$TIMEOUT" "${CMD[@]}"
  EXIT=$?
else
  "${CMD[@]}"
  EXIT=$?
fi
set -e

END_TIME=$(date +%s)
ELAPSED=$(( END_TIME - START_TIME ))
MIN=$(( ELAPSED / 60 ))
SEC=$(( ELAPSED % 60 ))

echo ""
if [[ $EXIT -eq 0 ]]; then
  echo "BUILD SUCCEEDED in ${MIN}m ${SEC}s"
  echo "Log: $LOG"
else
  echo "BUILD FAILED (exit code: $EXIT) after ${MIN}m ${SEC}s"
  echo "Log tail:"
  tail -n 80 "$LOG" || true
  exit $EXIT
fi
