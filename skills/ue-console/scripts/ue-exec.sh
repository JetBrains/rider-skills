#!/usr/bin/env bash
# Universal AgentBridge client for Unreal Editor.
# All communication with a running editor goes through this single script.
#
# Usage: ./ue-exec.sh --health
#        ./ue-exec.sh --script 'import unreal; print("hello")'
#        ./ue-exec.sh --file /path/to/script.py
#        ./ue-exec.sh --logs --severity error --lines 50
#        ./ue-exec.sh --play | --stop | --simulate
#        ./ue-exec.sh --build [--wait]

set -euo pipefail

# Resolve symlinks so relative paths work when skill is installed via symlink.
# cd -P follows physical path (not logical/symlink path).
SCRIPT_DIR="$(cd -P "$(dirname "$0")" && pwd)"
TOOLKIT_ROOT="$(cd -P "${SCRIPT_DIR}/../../.." && pwd)"
# shellcheck source=/dev/null
source "${TOOLKIT_ROOT}/scripts/common/ue-env.sh"

# Allow python fallback on environments where `python3` is not present (common on Windows).
if ! command -v python3 >/dev/null 2>&1; then
  if command -v python >/dev/null 2>&1; then
    python3() { python "$@"; }
  fi
fi
if ! command -v python3 >/dev/null 2>&1; then
  echo "ERROR: python3 (or python) is required but was not found." >&2
  exit 1
fi

BATCH_RESPONSE_FILE="$(ue_tmp_file)"
trap 'rm -f "$BATCH_RESPONSE_FILE"' EXIT

# ─── defaults ────
HOST="${AGENT_BRIDGE_HOST:-localhost}"
PORT="${AGENT_BRIDGE_PORT:-}"
TIMEOUT=30
MODE=""
SCRIPT=""
SCRIPT_FILE=""
BATCH_FILE=""
STOP_ON_ERROR=false
ISOLATED=false
MAX_LINES=""
JQ_FILTER=""
OUTPUT_FIELD=""

# logs mode defaults
LOG_LINES=100
LOG_FILTER=""
LOG_SEVERITY="all"
LOG_FORMAT="text"
LOG_CATEGORIES=false

# build mode defaults
BUILD_WAIT=false

# ─── auto-detect port ──
# Searches for AgentBridge.port file in Saved/ directories of .uproject locations
auto_detect_port() {
  # 1. Check AGENT_BRIDGE_PORT env var (already handled above)
  if [[ -n "$PORT" ]]; then
    return 0
  fi

  # 2. Search for AgentBridge.port file near .uproject files
  local search_dir="${PWD}"
  while [[ "$search_dir" != "/" ]]; do
    local port_file="${search_dir}/Saved/AgentBridge.port"
    if [[ -f "$port_file" ]]; then
      PORT=$(cat "$port_file" 2>/dev/null | tr -d '[:space:]')
      if [[ -n "$PORT" && "$PORT" =~ ^[0-9]+$ ]]; then
        return 0
      fi
    fi
    # Check if this dir has a .uproject
    if compgen -G "${search_dir}/*.uproject" > /dev/null 2>&1; then
      break
    fi
    search_dir=$(dirname "$search_dir")
  done

  # 3. No port file found — error out with actionable message
  echo "ERROR: AgentBridge port file not found. Unreal Editor is not running or AgentBridge plugin is not enabled." >&2
  echo "  To fix:" >&2
  echo "    1. Launch the editor:  /ue-runner" >&2
  echo "    2. Wait for AgentBridge to be ready:  ue-exec.sh --health" >&2
  echo "    3. Then re-run your command." >&2
  exit 1
}

# ─── check for --help before port detection ──
for arg in "$@"; do
  if [[ "$arg" == "-h" || "$arg" == "--help" ]]; then
    NEED_HELP=true
    break
  fi
done

if [[ "${NEED_HELP:-}" != "true" ]]; then
  auto_detect_port
fi
BASE_URL="http://${HOST}:${PORT}"

# ─── parse args ──
while [[ $# -gt 0 ]]; do
  case "$1" in
    --health)    MODE="health";  shift ;;
    --script)    MODE="exec";    SCRIPT="$2";      shift 2 ;;
    --file)      MODE="file";    SCRIPT_FILE="$2";  shift 2 ;;
    --host)      HOST="$2";      BASE_URL="http://${HOST}:${PORT}"; shift 2 ;;
    --port)      PORT="$2";      BASE_URL="http://${HOST}:${PORT}"; shift 2 ;;
    --timeout)       TIMEOUT="$2";      shift 2 ;;
    --batch)         MODE="batch";      BATCH_FILE="$2";   shift 2 ;;
    --stop-on-error) STOP_ON_ERROR=true; shift ;;
    --isolated)      ISOLATED=true;     shift ;;
    --max-lines)     MAX_LINES="$2";    shift 2 ;;
    --jq)            JQ_FILTER="$2";    shift 2 ;;
    --output-field)  OUTPUT_FIELD="$2"; shift 2 ;;
    # ─── logs mode ──
    --logs)          MODE="logs";       shift ;;
    --errors)        MODE="logs"; LOG_SEVERITY="error";   shift ;;
    --warnings)      MODE="logs"; LOG_SEVERITY="warning"; shift ;;
    --lines)         LOG_LINES="$2";    shift 2 ;;
    --filter)        LOG_FILTER="$2";   shift 2 ;;
    --severity)      LOG_SEVERITY="$2"; shift 2 ;;
    --json)          LOG_FORMAT="json"; shift ;;
    --categories)    LOG_CATEGORIES=true; shift ;;
    # ─── Play control ──
    --play)          MODE="play";      shift ;;  # Play in Selected Viewport (default)
    --play-pie)      MODE="play-pie";  shift ;;  # Play in separate PIE window
    --stop)          MODE="stop";      shift ;;
    --simulate)      MODE="simulate";  shift ;;
    # ─── build (hot reload) ──
    --build)         MODE="build";     shift ;;
    --wait)          BUILD_WAIT=true;  shift ;;
    # ─── info ──
    --devices)       MODE="devices";   shift ;;
    --configs)       MODE="configs";   shift ;;
    -h|--help)
      echo "Usage: $0 [options]"
      echo ""
      echo "Modes:"
      echo "  --health              Check if editor is reachable"
      echo "  --script 'code'       Execute inline Python script"
      echo "  --file /path/to.py    Execute Python script from file"
      echo "  --batch FILE          Execute batch of scripts from JSON file"
      echo "  --logs                Fetch editor logs (default: last 100, all severities)"
      echo "  --errors              Shortcut: --logs --severity error"
      echo "  --warnings            Shortcut: --logs --severity warning"
      echo "  --play                Start Play In Editor (PIE)"
      echo "  --stop                Stop active play session"
      echo "  --simulate            Start Simulate In Editor"
      echo "  --build               Trigger hot reload / live coding"
      echo "  --devices             List target devices"
      echo "  --configs             List build configurations"
      echo ""
      echo "Log options (with --logs/--errors/--warnings):"
      echo "  --lines N             Max log entries (default: 100)"
      echo "  --filter PATTERN      Substring match in log messages"
      echo "  --severity LEVEL      Min severity: error, warning, log, all (default: all)"
      echo "  --json                Output raw JSON instead of formatted text"
      echo "  --categories          Show log category column"
      echo ""
      echo "Script options:"
      echo "  --timeout SECONDS     Request timeout (default: 30)"
      echo "  --stop-on-error       Stop batch on first error"
      echo "  --isolated            Run in private scope (fresh dict, no __main__ pollution)."
      echo "                        REQUIRED for scripts that call new_level() or load maps."
      echo ""
      echo "Build options:"
      echo "  --wait                Wait for build to complete (default: async)"
      echo ""
      echo "Output filtering:"
      echo "  --max-lines N         Truncate output to first N lines"
      echo "  --jq FILTER           Pipe JSON response through jq (falls back to raw)"
      echo "  --output-field FIELD  Extract a top-level JSON field (no jq needed)"
      echo ""
      echo "Environment:"
      echo "  AGENT_BRIDGE_HOST    default localhost"
      echo "  AGENT_BRIDGE_PORT    auto-detected from Saved/AgentBridge.port (no fallback)"
      exit 0
      ;;
    *) echo "Unknown argument: $1"; exit 1 ;;
  esac
done

if [[ -z "$MODE" ]]; then
  echo "ERROR: Specify a mode (--health, --script, --file, --batch, --logs, --play, --stop, --simulate, --build, --devices, --configs)"
  echo "Run $0 --help for usage"
  exit 1
fi

# ─── GC wrapper helper ──
# Wraps any Python script with try/finally GC to prevent FPyReferenceCollector leaks.
# Uses base64 encoding so the inner script needs no escaping.
wrap_with_gc() {
  local raw_script="$1"
  local b64
  b64=$(printf '%s' "$raw_script" | python3 -c "import sys,base64; print(base64.b64encode(sys.stdin.buffer.read()).decode())")
  printf 'import base64 as _b64, gc as _gc\ntry:\n    exec(compile(_b64.b64decode('"'"'%s'"'"').decode('"'"'utf-8'"'"'), '"'"'<script>'"'"', '"'"'exec'"'"'))\nfinally:\n    _gc.collect()\n    try:\n        import unreal as _u\n        _u.SystemLibrary.collect_garbage()\n    except Exception:\n        pass' "$b64"
}

# ─── output filtering helper ──
apply_output_filters() {
  local raw="$1"

  # Apply --output-field (extract a top-level JSON field via python3)
  if [[ -n "$OUTPUT_FIELD" ]]; then
    local extracted
    extracted=$(echo "$raw" | python3 -c "
import json, sys
try:
    data = json.load(sys.stdin)
    val = data.get('$OUTPUT_FIELD')
    if isinstance(val, (dict, list)):
        print(json.dumps(val, indent=2))
    elif val is not None:
        print(val)
except Exception:
    sys.stdout.write(sys.stdin.read())
" 2>/dev/null) && raw="$extracted" || true
  fi

  # Apply --jq (try jq, fall back to python3, fall back to raw)
  if [[ -n "$JQ_FILTER" ]]; then
    local filtered
    if command -v jq &>/dev/null; then
      filtered=$(echo "$raw" | jq -r "$JQ_FILTER" 2>/dev/null) && raw="$filtered" || true
    else
      filtered=$(echo "$raw" | python3 -c "
import json, sys, subprocess
data = json.load(sys.stdin)
# Simple field extraction for common jq patterns like '.field'
filt = '''$JQ_FILTER'''.strip()
if filt.startswith('.') and filt[1:].isidentifier():
    val = data.get(filt[1:])
    if isinstance(val, (dict, list)):
        print(json.dumps(val, indent=2))
    elif val is not None:
        print(val)
else:
    print(json.dumps(data, indent=2))
" 2>/dev/null) && raw="$filtered" || true
    fi
  fi

  # Apply --max-lines (truncate output)
  if [[ -n "$MAX_LINES" ]]; then
    local total
    total=$(echo "$raw" | wc -l)
    if (( total > MAX_LINES )); then
      local truncated
      truncated=$(echo "$raw" | head -n "$MAX_LINES")
      raw="${truncated}
[...truncated $((total - MAX_LINES)) more lines]"
    fi
  fi

  echo "$raw"
}

# ─── health check ──
if [[ "$MODE" == "health" ]]; then
  RESPONSE=$(curl -s --max-time 5 "${BASE_URL}/agent/health" 2>/dev/null) || true
  if [[ -z "$RESPONSE" ]]; then
    echo "ERROR: Cannot reach editor at ${BASE_URL}"
    echo "  Make sure the Unreal Editor is running with AgentBridge plugin enabled."
    # Show port detection info for debugging
    if [[ -n "${AGENT_BRIDGE_PORT:-}" ]]; then
      echo "  Port source: AGENT_BRIDGE_PORT env var (${AGENT_BRIDGE_PORT})"
    else
      # Check if port file exists anywhere nearby
      local_search="${PWD}"
      while [[ "$local_search" != "/" ]]; do
        if [[ -f "${local_search}/Saved/AgentBridge.port" ]]; then
          echo "  Port source: ${local_search}/Saved/AgentBridge.port"
          break
        fi
        if compgen -G "${local_search}/*.uproject" > /dev/null 2>&1; then
          echo "  Port file not found: ${local_search}/Saved/AgentBridge.port"
          break
        fi
        local_search=$(dirname "$local_search")
      done
    fi
    exit 1
  fi
  apply_output_filters "$RESPONSE"
  exit 0
fi

# ─── batch mode ──
if [[ "$MODE" == "batch" ]]; then
  if [[ ! -f "$BATCH_FILE" ]]; then
    echo "ERROR: Batch file not found: ${BATCH_FILE}"
    exit 1
  fi

  # Build batch payload (GC handled server-side by AgentBridge after each script)
  BATCH_PAYLOAD=$(python3 -c "
import json, sys
batch = json.load(open('$BATCH_FILE'))
scripts = batch if isinstance(batch, list) else batch.get('scripts', [])
payload = {
    'scripts': scripts,
    'stop_on_error': $([[ "$STOP_ON_ERROR" == "true" ]] && echo "True" || echo "False"),
    'isolated': $([[ "$ISOLATED" == "true" ]] && echo "True" || echo "False"),
}
print(json.dumps(payload))
" 2>/dev/null)

  if [[ -z "$BATCH_PAYLOAD" ]]; then
    echo "ERROR: Failed to parse batch file"
    exit 1
  fi

  # Try /agent/batch endpoint
  HTTP_CODE=$(curl -s -o "$BATCH_RESPONSE_FILE" -w '%{http_code}' \
    --max-time "$TIMEOUT" \
    -X POST "${BASE_URL}/agent/batch" \
    -H "Content-Type: application/json" \
    -d "$BATCH_PAYLOAD" 2>/dev/null) || HTTP_CODE="000"

  if [[ "$HTTP_CODE" == "200" ]]; then
    RESPONSE=$(cat "$BATCH_RESPONSE_FILE")
    apply_output_filters "$RESPONSE"
    SUCCESS=$(echo "$RESPONSE" | python3 -c "import json,sys; print(json.load(sys.stdin).get('success', False))" 2>/dev/null || echo "False")
    [[ "$SUCCESS" != "True" ]] && exit 1
    exit 0
  fi

  # Fallback: sequential /agent/execute calls
  RESPONSE=$(python3 -c "
import json, sys, subprocess

batch = json.load(open('$BATCH_FILE'))
scripts = batch if isinstance(batch, list) else batch.get('scripts', [])
stop_on_error = $([[ "$STOP_ON_ERROR" == "true" ]] && echo "True" || echo "False")

results = []
all_success = True
skip_rest = False

for item in scripts:
    sid = item.get('id', str(len(results)))
    script = item.get('script', '')

    if skip_rest:
        results.append({'id': sid, 'success': False, 'output': '', 'result': '', 'skipped': True})
        continue

    payload = json.dumps({'script': script})
    try:
        proc = subprocess.run(
            ['curl', '-s', '--max-time', '$TIMEOUT',
             '-X', 'POST', '${BASE_URL}/agent/execute',
             '-H', 'Content-Type: application/json',
             '-d', payload],
            capture_output=True, text=True, timeout=int('$TIMEOUT') + 5
        )
        resp = json.loads(proc.stdout) if proc.stdout else {}
    except Exception as e:
        resp = {'success': False, 'output': '', 'result': str(e)}

    success = resp.get('success', False)
    results.append({
        'id': sid,
        'success': success,
        'output': resp.get('output', ''),
        'result': resp.get('result', '')
    })

    if not success:
        all_success = False
        if stop_on_error:
            skip_rest = True

print(json.dumps({'success': all_success, 'results': results}, indent=2))
" 2>/dev/null)

  if [[ -z "$RESPONSE" ]]; then
    echo "ERROR: Batch fallback failed"
    exit 1
  fi

  apply_output_filters "$RESPONSE"
  SUCCESS=$(echo "$RESPONSE" | python3 -c "import json,sys; print(json.load(sys.stdin).get('success', False))" 2>/dev/null || echo "False")
  [[ "$SUCCESS" != "True" ]] && exit 1
  exit 0
fi

# ─── logs mode ──
if [[ "$MODE" == "logs" ]]; then
  QUERY="lines=${LOG_LINES}"
  if [[ -n "$LOG_FILTER" ]]; then
    ENCODED_FILTER=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$LOG_FILTER'))")
    QUERY="${QUERY}&filter=${ENCODED_FILTER}"
  fi
  if [[ "$LOG_SEVERITY" != "all" ]]; then
    QUERY="${QUERY}&severity=${LOG_SEVERITY}"
  fi

  RESPONSE=$(curl -s --max-time 10 "${BASE_URL}/agent/logs?${QUERY}" 2>/dev/null) || true
  if [[ -z "$RESPONSE" ]]; then
    echo "ERROR: Cannot reach editor at ${BASE_URL}"
    exit 1
  fi

  SUCCESS=$(echo "$RESPONSE" | python3 -c "import json,sys; print(json.load(sys.stdin).get('success', False))" 2>/dev/null || echo "False")
  if [[ "$SUCCESS" != "True" ]]; then
    echo "ERROR: Log fetch failed"
    echo "$RESPONSE"
    exit 1
  fi

  if [[ "$LOG_FORMAT" == "json" ]]; then
    apply_output_filters "$RESPONSE"
    exit 0
  fi

  # Format as human-readable lines
  python3 -c "
import json, sys

data = json.load(sys.stdin)
entries = data.get('entries', [])
count = data.get('count', 0)
show_cats = $([[ "$LOG_CATEGORIES" == "true" ]] && echo "True" || echo "False")

if not entries:
    print('(no log entries found)')
    sys.exit(0)

severity_colors = {
    'fatal':        '\033[1;31m',
    'error':        '\033[31m',
    'warning':      '\033[33m',
    'display':      '\033[0m',
    'log':          '\033[0m',
    'verbose':      '\033[90m',
    'very_verbose': '\033[90m',
}
reset = '\033[0m'

severity_labels = {
    'fatal':        'FATAL  ',
    'error':        'ERROR  ',
    'warning':      'WARN   ',
    'display':      'LOG    ',
    'log':          'LOG    ',
    'verbose':      'VERBOSE',
    'very_verbose': 'VVERB  ',
}

for entry in entries:
    ts = entry.get('timestamp', '')
    time_part = ts[11:19] if len(ts) >= 19 else ts
    sev = entry.get('severity', 'log').lower()
    cat = entry.get('category', '')
    msg = entry.get('message', '')
    color = severity_colors.get(sev, '')
    label = severity_labels.get(sev, sev.upper().ljust(7))

    if show_cats:
        print(f'{color}{time_part} {label} [{cat}] {msg}{reset}')
    else:
        print(f'{color}{time_part} {label} {msg}{reset}')

print(f'\n--- {count} entries ---')
" <<< "$RESPONSE"
  exit 0
fi

# ─── Play/Stop/Simulate control ──
# --play: runs in Selected Viewport (not a separate PIE window)
# --play-pie: runs in a separate PIE window (legacy behavior)
# --stop: stops any active play session
# --simulate: starts Simulate In Editor
if [[ "$MODE" == "play" || "$MODE" == "stop" || "$MODE" == "simulate" || "$MODE" == "play-pie" ]]; then
  if [[ "$MODE" == "play" ]]; then
    # Play in Selected Viewport via inline Python
    PLAY_SCRIPT_RAW="import unreal; les = unreal.get_editor_subsystem(unreal.LevelEditorSubsystem); playing = les.is_in_play_in_editor(); les.editor_request_begin_play() if not playing else None; print('playing_in_viewport' if not playing else 'already_playing')"
    PLAY_SCRIPT=$(wrap_with_gc "$PLAY_SCRIPT_RAW")
    PAYLOAD=$(python3 -c "import json,sys; print(json.dumps({'script': sys.stdin.read()}))" <<< "$PLAY_SCRIPT")
    RESPONSE=$(curl -s --max-time "$TIMEOUT" \
      -X POST "${BASE_URL}/agent/execute" \
      -H "Content-Type: application/json" \
      -d "$PAYLOAD" 2>/dev/null) || true
    if [[ -z "$RESPONSE" ]]; then
      echo "ERROR: Cannot reach editor at ${BASE_URL}"
      exit 1
    fi
    # Output clean JSON
    STATE=$(echo "$RESPONSE" | python3 -c "import json,sys; d=json.load(sys.stdin); print(d.get('output','').strip())" 2>/dev/null || echo "unknown")
    echo "{\"success\": true, \"state\": \"${STATE}\"}"
    exit 0
  elif [[ "$MODE" == "stop" ]]; then
    # Stop via inline Python (works for both viewport play and PIE)
    STOP_SCRIPT_RAW="import unreal; les = unreal.get_editor_subsystem(unreal.LevelEditorSubsystem); les.editor_request_end_play(); print('stopped')"
    STOP_SCRIPT=$(wrap_with_gc "$STOP_SCRIPT_RAW")
    PAYLOAD=$(python3 -c "import json,sys; print(json.dumps({'script': sys.stdin.read()}))" <<< "$STOP_SCRIPT")
    RESPONSE=$(curl -s --max-time "$TIMEOUT" \
      -X POST "${BASE_URL}/agent/execute" \
      -H "Content-Type: application/json" \
      -d "$PAYLOAD" 2>/dev/null) || true
    if [[ -z "$RESPONSE" ]]; then
      echo "ERROR: Cannot reach editor at ${BASE_URL}"
      exit 1
    fi
    echo '{"success": true, "state": "stopped"}'
    exit 0
  else
    # simulate or play-pie: use the HTTP endpoint
    PIE_MODE="$MODE"
    [[ "$PIE_MODE" == "play-pie" ]] && PIE_MODE="pie"
    RESPONSE=$(curl -s --max-time 10 \
      -X POST "${BASE_URL}/agent/play" \
      -H "Content-Type: application/json" \
      -d "{\"mode\":\"${PIE_MODE}\"}" 2>/dev/null) || true
    if [[ -z "$RESPONSE" ]]; then
      echo "ERROR: Cannot reach editor at ${BASE_URL}"
      exit 1
    fi
    apply_output_filters "$RESPONSE"
    SUCCESS=$(echo "$RESPONSE" | python3 -c "import json,sys; print(json.load(sys.stdin).get('success', False))" 2>/dev/null || echo "False")
    [[ "$SUCCESS" != "True" ]] && exit 1
    exit 0
  fi
fi

# ─── build (hot reload) ──
if [[ "$MODE" == "build" ]]; then
  WAIT_VAL=$([[ "$BUILD_WAIT" == "true" ]] && echo "true" || echo "false")
  RESPONSE=$(curl -s --max-time 120 \
    -X POST "${BASE_URL}/agent/build" \
    -H "Content-Type: application/json" \
    -d "{\"wait\":${WAIT_VAL}}" 2>/dev/null) || true
  if [[ -z "$RESPONSE" ]]; then
    echo "ERROR: Cannot reach editor at ${BASE_URL}"
    exit 1
  fi
  apply_output_filters "$RESPONSE"
  exit 0
fi

# ─── devices / configs (GET endpoints) ──
if [[ "$MODE" == "devices" || "$MODE" == "configs" ]]; then
  RESPONSE=$(curl -s --max-time 10 "${BASE_URL}/agent/${MODE}" 2>/dev/null) || true
  if [[ -z "$RESPONSE" ]]; then
    echo "ERROR: Cannot reach editor at ${BASE_URL}"
    exit 1
  fi
  apply_output_filters "$RESPONSE"
  exit 0
fi

# ─── load script from file ──
if [[ "$MODE" == "file" ]]; then
  if [[ ! -f "$SCRIPT_FILE" ]]; then
    echo "ERROR: File not found: ${SCRIPT_FILE}"
    exit 1
  fi
  SCRIPT=$(cat "$SCRIPT_FILE")
fi

if [[ -z "$SCRIPT" ]]; then
  echo "ERROR: Empty script"
  exit 1
fi

# ─── append GC epilogue to every script execution ──
# Prevents GCObjectReferencer buildup from load_object/load_asset calls
# that block subsequent asset deletion. Uses the wrap_with_gc helper.
SCRIPT=$(wrap_with_gc "$SCRIPT")

# ─── build JSON payload ──
# Use python3 for safe JSON encoding of arbitrary script content
PAYLOAD=$(python3 -c "
import json, sys
payload = {'script': sys.stdin.read()}
if '$ISOLATED' == 'true':
    payload['isolated'] = True
print(json.dumps(payload))
" <<< "$SCRIPT")

# ─── execute ──
RESPONSE=$(curl -s --max-time "$TIMEOUT" \
  -X POST "${BASE_URL}/agent/execute" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD" 2>/dev/null) || true

if [[ -z "$RESPONSE" ]]; then
  echo "ERROR: No response from editor at ${BASE_URL}"
  echo "  Editor may have frozen or the request timed out (${TIMEOUT}s)."
  exit 1
fi

apply_output_filters "$RESPONSE"

# ─── check success ──
SUCCESS=$(echo "$RESPONSE" | python3 -c "import json,sys; print(json.load(sys.stdin).get('success', False))" 2>/dev/null || echo "False")
if [[ "$SUCCESS" != "True" ]]; then
  exit 1
fi
