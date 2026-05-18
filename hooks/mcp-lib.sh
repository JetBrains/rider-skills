#!/bin/sh
# Shared MCP helpers for quality-check.cmd and pre-read-check.cmd.
# Sourced from within the extracted sh sections of those scripts.
# Requires: QC_FP, QC_CW, QC_HOOKS_DIR exported by the caller.
# Provides: base, sse, sse_pid, msg; functions rpc(), extract_problems(), _jesc(), output_result().
# Exits 0 silently if the IDE MCP server is not reachable.

# ── Rider MCP discovery ────────────────────────────────────────────────────────
# Iterate candidate ports (cached → Rider's mcpServer.xml → known port range),
# open SSE + initialize, and keep the first session whose serverInfo identifies
# Rider. Cache the chosen port to skip the scan next time.

QC_PORT_CACHE="/tmp/.qc_rider_port"
cached_port=""
[ -f "$QC_PORT_CACHE" ] && cached_port=$(cat "$QC_PORT_CACHE" 2>/dev/null)

rider_xml_port=$(awk -F'"' '/mcpServerPort/{print $4;exit}' \
  "$HOME/Library/Application Support/JetBrains/Rider"*/options/mcpServer.xml \
  "$HOME/.config/JetBrains/Rider"*/options/mcpServer.xml \
  2>/dev/null | head -1)

candidates="$cached_port $rider_xml_port 64343 64344 64342 64345 64346"

sse=$(mktemp /tmp/mcp_sse.XXXXXX)
sse_pid=""
msg=""
base=""
port=""
tried=""

for cand in $candidates; do
  [ -z "$cand" ] && continue
  case " $tried " in *" $cand "*) continue;; esac
  tried="$tried $cand"

  : > "$sse"
  /usr/bin/curl -s --no-buffer --max-time 90 -N "http://localhost:${cand}/sse" >> "$sse" 2>/dev/null &
  cur_pid=$!

  sess=""
  for _i in 1 2 3 4 5 6 7 8 9 10; do
    sess=$(grep -o 'sessionId=[^ "]*' "$sse" 2>/dev/null | head -1 | sed 's/sessionId=//' | tr -d '\r')
    [ -n "$sess" ] && break
    sleep 0.1
  done
  if [ -z "$sess" ]; then
    kill "$cur_pid" 2>/dev/null; wait "$cur_pid" 2>/dev/null
    continue
  fi

  cur_msg="http://localhost:${cand}/message?sessionId=${sess}"
  /usr/bin/curl -s --max-time 2 -X POST "$cur_msg" \
    -H "Content-Type: application/json" \
    -d '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"mcp-hook","version":"1"}}}' \
    >/dev/null 2>&1

  is_rider=""
  for _i in 1 2 3 4 5 6 7 8 9 10; do
    grep -q '"name":"JetBrains Rider' "$sse" 2>/dev/null && { is_rider=1; break; }
    sleep 0.1
  done

  if [ -n "$is_rider" ]; then
    port="$cand"
    sse_pid="$cur_pid"
    msg="$cur_msg"
    base="http://localhost:${port}"
    printf '%s' "$port" > "$QC_PORT_CACHE"
    /usr/bin/curl -s -X POST "$msg" -H "Content-Type: application/json" \
      -d '{"jsonrpc":"2.0","method":"notifications/initialized"}' >/dev/null 2>&1
    break
  fi
  kill "$cur_pid" 2>/dev/null; wait "$cur_pid" 2>/dev/null
done

if [ -z "$port" ]; then
  rm -f "$sse"
  exit 0   # No Rider MCP server reachable — skip silently
fi

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
