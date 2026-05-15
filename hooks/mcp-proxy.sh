#!/bin/sh
# MCP proxy — forwards a single tools/call to the IDE's MCP server.
#
# Usage:
#   mcp-proxy.sh <tool_name> [json_args]
#     json_args defaults to {}
#     CWD is taken from PWD (or $MCP_CWD if set) for .idea-based IDE discovery.
#
# Output: raw JSON-RPC response line from the IDE on stdout.
# Exit:   0 on success or when the IDE/MCP is unreachable (silent),
#         2 on usage error, 3 on RPC timeout.

tool="$1"
args="${2:-{\}}"

if [ -z "$tool" ]; then
  printf 'usage: %s <tool_name> [json_args]\n' "$0" >&2
  exit 2
fi

# mcp-lib.sh requirements
QC_HOOKS_DIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"
QC_CW="${MCP_CWD:-$PWD}"
QC_FP=""
export QC_HOOKS_DIR QC_CW QC_FP

. "$QC_HOOKS_DIR/mcp-lib.sh"

# Escape embedded quotes/backslashes in tool name for safe interpolation
esc_tool=$(printf '%s' "$tool" | sed 's/\\/\\\\/g; s/"/\\"/g')

resp=$(rpc 2 "tools/call" "{\"name\":\"$esc_tool\",\"arguments\":$args}")
rc=$?

kill "$sse_pid" 2>/dev/null
wait "$sse_pid" 2>/dev/null
rm -f "$sse"

if [ $rc -ne 0 ] || [ -z "$resp" ]; then
  exit 3
fi

printf '%s\n' "$resp"
