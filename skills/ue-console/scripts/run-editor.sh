#!/usr/bin/env bash
# Launch Unreal Editor for a project, preventing duplicate instances.
# Usage: ./run-editor.sh [--project <path.uproject>] [--restart]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"
# shellcheck source=/dev/null
source "${TOOLKIT_ROOT}/scripts/common/ue-env.sh"

PROJECT=""
RESTART=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) PROJECT="$2"; shift 2 ;;
    --restart) RESTART=true; shift ;;
    -h|--help)
      cat <<'HELP'
Usage: run-editor.sh [--project <path.uproject>] [--restart]

Options:
  --project PATH   Path to .uproject file (auto-detected if omitted)
  --restart        Kill running editor for this project and relaunch

Environment:
  UE_ROOT          Unreal Engine root directory (auto-detected)
  UE_PROJECT       Alternative to --project

Platform notes:
  macOS/Linux      Uses this .sh script directly
  Windows          Use this script in Git Bash/MSYS/WSL, or use run-editor.bat
HELP
      exit 0
      ;;
    *) echo "Unknown argument: $1"; exit 1 ;;
  esac
done

if [[ -z "$PROJECT" ]]; then
  PROJECT="${UE_PROJECT:-}"
fi

if [[ -z "$PROJECT" ]]; then
  PROJECT=$(ue_find_uproject "$(pwd)") || true
fi

if [[ -z "$PROJECT" || ! -f "$PROJECT" ]]; then
  echo "ERROR: No .uproject file found."
  echo "  Provide --project <path>, set UE_PROJECT, or run from inside a UE project directory."
  exit 1
fi

PROJECT="$(cd "$(dirname "$PROJECT")" && pwd)/$(basename "$PROJECT")"
PROJECT_NAME="$(basename "$PROJECT" .uproject)"
ENGINE_VERSION=$(grep -o '"EngineAssociation"[[:space:]]*:[[:space:]]*"[^"]*"' "$PROJECT" | sed -E 's/.*"([^"]+)"$/\1/' || true)
HOST_OS="$(ue_host_os)"

editor_running() {
  case "$HOST_OS" in
    windows)
      # Check for UnrealEditor with THIS project's .uproject on the command line.
      # Use PowerShell CimInstance — wmic is removed in Windows 11 build 22621+.
      powershell.exe -ExecutionPolicy Bypass -Command \
        "(Get-CimInstance Win32_Process -Filter \"name='UnrealEditor.exe'\").CommandLine" \
        2>/dev/null | grep -qi "${PROJECT_NAME}" || return 1
      ;;
    *)
      # Match UnrealEditor binary (not UnrealEditorServices) with this project name
      pgrep -f "UnrealEditor[^S].*${PROJECT_NAME}" >/dev/null 2>&1
      ;;
  esac
}

kill_editor() {
  case "$HOST_OS" in
    windows)
      # Kill only the editor instance running THIS project.
      # Use PowerShell CimInstance — wmic is removed in Windows 11 build 22621+.
      local PIDS
      PIDS=$(powershell.exe -ExecutionPolicy Bypass -Command \
        "Get-CimInstance Win32_Process -Filter \"name='UnrealEditor.exe'\" | Where-Object { \$_.CommandLine -like '*${PROJECT_NAME}*' } | Select-Object -Expand ProcessId" \
        2>/dev/null | grep -oE '[0-9]+' || true)
      for PID in $PIDS; do
        taskkill.exe /F /PID "$PID" >/dev/null 2>&1 || true
      done
      ;;
    *)
      # Kill only the editor instance running THIS project (not other projects)
      pkill -f "UnrealEditor[^S].*${PROJECT_NAME}" >/dev/null 2>&1 || true
      ;;
  esac
}

if editor_running; then
  if [[ "$RESTART" == true ]]; then
    echo "Stopping running Unreal Editor for ${PROJECT_NAME}..."
    kill_editor
    WAIT_SECONDS=0
    while editor_running; do
      sleep 1
      WAIT_SECONDS=$((WAIT_SECONDS + 1))
      if [[ $WAIT_SECONDS -ge 30 ]]; then
        echo "WARNING: Editor did not exit after 30s, forcing termination..."
        kill_editor
        sleep 2
        break
      fi
    done
    echo "Editor stopped."
  else
    echo "Unreal Editor is already running for ${PROJECT_NAME}."
    exit 0
  fi
fi

if [[ -z "${UE_ROOT:-}" ]]; then
  UE_ROOT=$(ue_find_root "${ENGINE_VERSION:-}") || true
fi

if [[ -z "${UE_ROOT:-}" || ! -d "${UE_ROOT:-}" ]]; then
  echo "ERROR: Unreal Engine root not found."
  echo "  Set UE_ROOT explicitly for your platform."
  echo "  macOS:   export UE_ROOT=\"/Users/Shared/Epic Games/UE_5.6\""
  echo "  Linux:   export UE_ROOT=\"$HOME/UnrealEngine/UE_5.6\""
  echo "  Windows: set UE_ROOT=C:\\Program Files\\Epic Games\\UE_5.6"
  exit 1
fi

EDITOR=""
EDITOR_APP=""
case "$HOST_OS" in
  mac)
    EDITOR_APP="${UE_ROOT}/Engine/Binaries/Mac/UnrealEditor.app"
    EDITOR="${EDITOR_APP}/Contents/MacOS/UnrealEditor"
    ;;
  linux|wsl)
    EDITOR="${UE_ROOT}/Engine/Binaries/Linux/UnrealEditor"
    ;;
  windows)
    EDITOR="${UE_ROOT}/Engine/Binaries/Win64/UnrealEditor.exe"
    ;;
  *)
    echo "ERROR: Unsupported host OS: ${HOST_OS}"
    exit 1
    ;;
esac

if [[ -z "$EDITOR" || ! -e "$EDITOR" ]]; then
  echo "ERROR: UnrealEditor binary not found."
  echo "  UE_ROOT: ${UE_ROOT}"
  echo "  Expected: ${EDITOR:-<unknown>}"
  exit 1
fi

echo "Project: ${PROJECT}"
echo "Engine:  ${UE_ROOT}"
echo "Version: ${ENGINE_VERSION:-unknown}"
echo ""
echo "Starting Unreal Editor..."

case "$HOST_OS" in
  mac)
    # Use the binary directly instead of `open -a`.
    # `open -a` reuses the running .app bundle and silently refuses to
    # launch a second instance for a different project.
    nohup "$EDITOR" "$PROJECT" >/dev/null 2>&1 &
    LAUNCH_PID=$!
    sleep 3
    REAL_PID=$(pgrep -f "UnrealEditor.*${PROJECT_NAME}" 2>/dev/null | head -1 || true)
    echo "Editor launched (PID: ${REAL_PID:-$LAUNCH_PID})"
    ;;
  linux|wsl)
    nohup "$EDITOR" "$PROJECT" >/dev/null 2>&1 &
    echo "Editor launched (PID: $!)"
    ;;
  windows)
    WIN_EDITOR=$(ue_windows_path "$EDITOR")
    WIN_PROJECT=$(ue_windows_path "$PROJECT")
    cmd.exe /c start "" "$WIN_EDITOR" "$WIN_PROJECT" >/dev/null 2>&1
    echo "Editor launch requested via Windows shell."
    ;;
esac
