#!/bin/sh
# Shared MCP helpers for quality-check.cmd and pre-read-check.cmd.
# Sourced from within the extracted sh sections of those scripts.
# Requires: QC_FP, QC_CW, QC_HOOKS_DIR exported by the caller.
# Provides: base, sse, sse_pid, msg; functions rpc(), extract_problems(), _jesc(), output_result().
# Exits 0 silently if the IDE MCP server is not reachable.

# ── Port discovery ─────────────────────────────────────────────────────────────

_ide_prefix_from_idea() {
  local d="$1" sub f root
  [ -d "$d" ] || return
  root=$(dirname "$d")
  for sub in "$d"/.idea.*.dir; do [ -d "$sub" ] && { printf 'Rider'; return; }; done
  for f in "$d"/*.sln.iml; do [ -f "$f" ] && { printf 'Rider'; return; }; done
  for f in "$d/projectSettingsUpdater.xml" "$d"/.idea.*.dir/.idea/projectSettingsUpdater.xml; do
    grep -q "RiderProjectSettingsUpdater" "$f" 2>/dev/null && { printf 'Rider'; return; }
  done
  for f in "$root"/*.uproject; do [ -f "$f" ] && { printf 'Rider'; return; }; done
  for f in "$root"/*.sln; do [ -f "$f" ] && { printf 'Rider'; return; }; done
  grep -q "languageLevel" "$d/misc.xml" 2>/dev/null && { printf 'IntelliJIdea'; return; }
  for f in "$d"/*.iml; do
    [ -f "$f" ] && grep -q "PYTHON_MODULE" "$f" 2>/dev/null && { printf 'PyCharm'; return; }
  done
  for f in "$d"/*.iml; do
    [ -f "$f" ] && grep -q "WEB_MODULE" "$f" 2>/dev/null && { printf 'WebStorm'; return; }
  done
  [ -f "$root/CMakeLists.txt" ] && { printf 'CLion'; return; }
}

idea_prefix=$(_ide_prefix_from_idea "$QC_CW/.idea")

# Source jbr.cmd to detect the running IDE installation; sets IDE_JAVA
. "$QC_HOOKS_DIR/jbr.cmd" 2>/dev/null

port=""
# Derive exact config path from IDE_JAVA (most precise — specific version)
if [ -n "$IDE_JAVA" ]; then
  case "$(uname -s)" in
    Darwin)
      bundle=$(printf '%s' "$IDE_JAVA" | sed 's|/Contents/jbr/.*||')
      if [ -d "$bundle" ]; then
        ide_name=$(basename "$bundle" .app)
        ide_ver=$(defaults read "$bundle/Contents/Info" CFBundleShortVersionString 2>/dev/null \
          | awk -F. '{printf "%s.%s",$1,$2}')
        xml="$HOME/Library/Application Support/JetBrains/${ide_name}${ide_ver}/options/mcpServer.xml"
        [ -f "$xml" ] && port=$(awk -F'"' '/mcpServerPort/{print $4;exit}' "$xml")
      fi
      ;;
    Linux)
      ide_root=$(printf '%s' "$IDE_JAVA" | sed 's|/jbr/bin/java||')
      if [ -f "$ide_root/product-info.json" ]; then
        data_dir=$(awk -F'"dataDirectoryName":"' 'NF>1{split($2,a,"\"");print a[1];exit}' \
          "$ide_root/product-info.json")
        xml="$HOME/.config/JetBrains/${data_dir}/options/mcpServer.xml"
        [ -f "$xml" ] && port=$(awk -F'"' '/mcpServerPort/{print $4;exit}' "$xml")
      fi
      ;;
  esac
fi

# .idea prefix → targeted glob (narrows to the right IDE when multiple are installed)
if [ -z "$port" ] && [ -n "$idea_prefix" ]; then
  port=$(awk -F'"' '/mcpServerPort/{print $4;exit}' \
    "$HOME/Library/Application Support/JetBrains/${idea_prefix}"*/options/mcpServer.xml \
    "$HOME/.config/JetBrains/${idea_prefix}"*/options/mcpServer.xml \
    2>/dev/null | head -1)
fi

# Broad fallback — any JetBrains IDE config dir
if [ -z "$port" ]; then
  port=$(awk -F'"' '/mcpServerPort/{print $4;exit}' \
    "$HOME/Library/Application Support/JetBrains/"*/options/mcpServer.xml \
    "$HOME/.config/JetBrains/"*/options/mcpServer.xml \
    2>/dev/null | head -1)
fi
port=${port:-64343}

# Verify port responds; probe alternates when the IDE grabbed a different port at startup
_probe_mcp() {
  /usr/bin/curl -s --max-time 0.6 -N "http://localhost:$1/sse" 2>/dev/null | head -c 200 | grep -q 'sessionId='
}
if ! _probe_mcp "$port"; then
  for cand in 64342 64343 64344 64345 64346 $(awk -F'"' '/mcpServerPort/{print $4}' \
       "$HOME/Library/Application Support/JetBrains/"*/options/mcpServer.xml \
       "$HOME/.config/JetBrains/"*/options/mcpServer.xml 2>/dev/null); do
    [ "$cand" = "$port" ] && continue
    _probe_mcp "$cand" && { port="$cand"; break; }
  done
fi
base="http://localhost:${port}"

# ── SSE connection ─────────────────────────────────────────────────────────────

sse=$(mktemp /tmp/mcp_sse.XXXXXX)
/usr/bin/curl -s --no-buffer --max-time 90 -N "${base}/sse" >> "$sse" 2>/dev/null &
sse_pid=$!

sess=""
for _i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
  sess=$(grep -o 'sessionId=[^ "]*' "$sse" 2>/dev/null | head -1 | sed 's/sessionId=//' | tr -d '\r')
  [ -n "$sess" ] && break
  sleep 0.2
done
if [ -z "$sess" ]; then
  kill "$sse_pid" 2>/dev/null; wait "$sse_pid" 2>/dev/null; rm -f "$sse"
  exit 0   # IDE not running or MCP unavailable — skip silently
fi
msg="${base}/message?sessionId=${sess}"

# ── MCP helpers ────────────────────────────────────────────────────────────────

# rpc <id> <method> <params_json>  →  prints raw SSE response line, returns 1 on timeout
rpc() {
  /usr/bin/curl -s --max-time 5 -X POST "$msg" \
    -H "Content-Type: application/json" \
    -d "{\"jsonrpc\":\"2.0\",\"id\":$1,\"method\":\"$2\",\"params\":$3}" \
    >/dev/null 2>&1
  local deadline=$(( $(date +%s) + 25 ))
  while [ "$(date +%s)" -lt "$deadline" ]; do
    local line
    line=$(grep "^data:.*\"id\":${1}[^0-9]" "$sse" 2>/dev/null | tail -1 | sed 's/^data: //' | tr -d '\r')
    [ -n "$line" ] && { printf '%s' "$line"; return 0; }
    sleep 0.2
  done
  return 1
}

# Initialize MCP session
rpc 1 "initialize" \
  '{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"mcp-hook","version":"1"}}' \
  >/dev/null
/usr/bin/curl -s -X POST "$msg" -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","method":"notifications/initialized"}' >/dev/null 2>&1

# extract_problems <severity> <resp> <basename>
# Replaces JSON-escaped quotes \" with \x01 before splitting so awk field split on " is safe.
extract_problems() {
  local label="$1" resp="$2" file="$3"
  printf '%s' "$resp" | sed 's/\\"/\x01/g' | awk -v lbl="$label" -v f="$file" -F'"severity":"' '
    NF>1{
      for(i=2;i<=NF;i++){
        split($i,sv,"\""); if(sv[1]!=lbl) continue
        desc=""; split($i,dd,"\"description\":\"")
        if(length(dd)>1){split(dd[2],de,"\""); desc=de[1]; gsub(/\x01/,"\"",desc)}
        ln=0; split($i,ll,"\"line\":")
        if(length(ll)>1){split(ll[2],le,","); ln=le[1]+0}
        if(desc!="")printf "[%s] %s:%d: %s\n", lbl, f, ln, desc
      }
    }'
}

# _jesc <string>  →  JSON-escaped string on stdout
_jesc() {
  printf '%s' "$1" | awk 'BEGIN{ORS=""} {
    gsub(/\\/, "\\\\"); gsub(/"/, "\\\""); gsub(/\t/, "\\t")
    if(NR>1) printf "\\n"
    printf "%s",$0
  }'
}

# output_result <decision|""> <reason|""> <message>
# Always exits 0; decision="block" tells Claude Code to block the edit.
output_result() {
  local decision="$1" reason="$2" _out_msg="$3"
  local esc_msg esc_reason
  esc_msg=$(_jesc "$_out_msg")
  if [ -n "$decision" ]; then
    esc_reason=$(_jesc "$reason")
    printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"%s","decision":"%s"},"reason":"%s"}\n' \
      "$esc_msg" "$decision" "$esc_reason"
  else
    printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"%s"}}\n' "$esc_msg"
  fi
}
