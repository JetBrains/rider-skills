---
name: rider-debugger
description: Rider MCP debugger driver. MANDATORY when the user asks to debug, step through code, hit a breakpoint, inspect variables/stack/threads, evaluate an expression at runtime, set/remove/list breakpoints, mutate a variable, or run a configuration under the debugger. Use these `mcp__<rider_mcp_name>__xdebug_*` tools instead of writing print statements, suggesting manual IDE actions, or guessing runtime values.
---

# Rider Debugger Skill

This skill drives the JetBrains Rider debugger through the `mcp__<rider_mcp_name>__xdebug_*` MCP tools. Use these tools as the **only** way to interact with a live debug session — do not ask the user to click around the IDE, and do not invent runtime values from static reading of the code.

## GATE — Resolve the Rider MCP server name first

Before calling **any** debugger tool, you MUST resolve `<rider_mcp_name>` — the actual MCP server prefix for the Rider/JetBrains MCP on this machine. The literal string `mcp__<rider_mcp_name>__` is a placeholder; the real prefix varies per install (`rider`, `jetbrains`, `intellij`, `rider-mcp`, `jetbrains-ide`, etc.).

**Detection steps (in order):**

1. **Scan the available tool list / deferred tools** (the `<system-reminder>` listing `mcp__*__xdebug_*` or any other clearly Rider/IntelliJ-flavored MCP tools — e.g. `build_solution`, `execute_sql_query`, `git_status`, `get_solution_projects`, `apply_patch`, `xdebug_*`). Take the prefix between `mcp__` and the second `__`. Example: a tool named `mcp__jetbrains__xdebug_get_debugger_status` → `<rider_mcp_name>` = `jetbrains`.
2. **Prefer the prefix that owns `xdebug_*` tools.** If multiple MCP servers are registered, the correct one is the one exposing the full `xdebug_*` family documented below.
3. **If no `xdebug_*` tool is visible under any `mcp__*__` prefix**, the Rider MCP is not registered or not connected. **STOP**, do not attempt fallbacks, and tell the user:
   > "I can't find the Rider/JetBrains MCP server (no `mcp__*__xdebug_*` tools are exposed). Please make sure Rider is running with the MCP server enabled and the client is connected, then ask me again."
4. **Cache the resolved name for the rest of the session.** Substitute it for `<rider_mcp_name>` in every tool call. Do not re-resolve on every step.

Do not proceed past this gate until `<rider_mcp_name>` is known. Calling `mcp__<rider_mcp_name>__xdebug_*` literally (without substitution) will fail with `InputValidationError` if the actual prefix is different.

## When this skill is mandatory

Activate (and stay active) whenever the user asks you to:
- Start, stop, pause, resume, or step a debug session
- Set, list, update, relocate, or remove a breakpoint (line, conditional, tracepoint)
- Inspect call stack, threads, locals, fields, or nested object state
- Evaluate an expression or mutate a variable while paused
- Diagnose a runtime bug, NRE, exception, or unexpected value at a specific point in code
- Run a method/test/run-config under the debugger to observe behavior

If you find yourself proposing `Console.WriteLine`, logging, or "please put a breakpoint and tell me what you see" — stop and use these tools instead.

## Always pass `rootFolder`

Every tool accepts `rootFolder`. **Always pass it** with the .NET solution root (or current working directory if that is all you know). It disambiguates project resolution and avoids extra round-trips. Ask the user once if unknown, then reuse for every subsequent call.

## Tool reference (short)

### Session lifecycle
- **`mcp__<rider_mcp_name>__xdebug_start_debugger_session`** — Start a session by `configurationName` **or** by `filePath` + `line` (runnable entry like `Main`, a test, etc.). Set at least one breakpoint first or the program may run to completion. Use launch overrides (`programArguments`, `workingDirectory`, `envs`) only when the run config reports `supportsDynamicLaunchOverrides=true` (check via `get_run_configurations`).
- **`mcp__<rider_mcp_name>__xdebug_get_debugger_status`** — List all active sessions and their state. Call this first if you don't have a current `sessionId`, or to refresh after a session may have stopped/timed out.
- **`mcp__<rider_mcp_name>__xdebug_control_session`** — The execution remote. Actions: `STEP_INTO`, `STEP_OVER`, `STEP_OUT`, `RESUME`, `PAUSE`, `STOP`, `WAIT_FOR_PAUSE`, `DRAIN_EVENTS`. After `RESUME` **always** follow with `WAIT_FOR_PAUSE` (timeout 30000–120000 ms). Step/pause use 5000–15000 ms. Event tails (`breakpointErrorsTail`, `tracepointOutputsTail`) are JVM-only — empty on .NET is normal.

### Breakpoints
- **`mcp__<rider_mcp_name>__xdebug_set_breakpoint`** — Create or update. Two modes: **location** (`filePath` + `line`, omit `breakpointId`) or **ID** (`breakpointId` from a previous call/list; optional `filePath`+`line` relocates a line breakpoint). Supports `condition`, `isLogMessage`, `isLogStack`, `temporary`, `suspendPolicy` (ALL/THREAD/NONE), `enabled`. For tracepoints: set `isLogMessage`/`isLogStack` + `suspendPolicy=NONE`. **Mute-only mode**: pass only `sessionId` + `breakpointsMuted` — do not mix with target/settings params. Always inspect returned `lineText` to confirm placement.
- **`mcp__<rider_mcp_name>__xdebug_list_breakpoints`** — List breakpoints (optionally filter by `filePath`). **Call this before `RESUME`** to confirm there is an enabled breakpoint that will actually be hit. Reports `owner` (`agent` for breakpoints this skill created, `user` for IDE-set).
- **`mcp__<rider_mcp_name>__xdebug_remove_breakpoint`** — Remove by `breakpointId`, by `filePath`+`line`, or all of a given `owner` (defaults to `agent`). Idempotent. To wipe everything, call twice with `owner=user` then `owner=agent`.
- **`mcp__<rider_mcp_name>__xdebug_run_to_line`** — From a suspended state, run to `filePath` + `line` without setting a permanent breakpoint. Outcomes: `paused` / `stopped` / `timeout`.

### Inspection (session must be suspended)
- **`mcp__<rider_mcp_name>__xdebug_get_threads`** — Paginated thread list. Active thread first, then by descending stack depth. Use the returned `id` as `threadId` for `xdebug_get_stack`.
- **`mcp__<rider_mcp_name>__xdebug_get_stack`** — Call stack for a thread (defaults to active). Returns frames with `index`, `file`, `line`, `presentation`, `isCurrent`. Use `index` as `frameIndex` for value/eval tools.
- **`mcp__<rider_mcp_name>__xdebug_get_frame_values`** — Locals/parameters/fields in a frame as a tree. `depth=0` shows variable names, `depth=1+` expands children. Nodes marked `+` have children.
- **`mcp__<rider_mcp_name>__xdebug_get_value_by_path`** — Drill into nested values: `path=["obj","field","subField"]`. Array/list index tokens use the **exact** node name from the previous output (often `"[0]"`, sometimes `"0"`). Refresh path tokens after any resume/step.
- **`mcp__<rider_mcp_name>__xdebug_evaluate_expression`** — Evaluate a raw expression in the language of the current frame. Pass expression text **literally** — no JSON escaping, no `\"` quoting. `depth>0` expands children of the result.
- **`mcp__<rider_mcp_name>__xdebug_set_variable`** — Mutate a value at `path`. `newValue` is a raw assignable expression in the frame's language. Re-read the path afterwards to confirm.

## Mandatory workflow

Follow this loop. Do not skip steps.

1. **Resolve session.** Call `xdebug_get_debugger_status`. If no session, call `xdebug_start_debugger_session` (after ensuring at least one breakpoint exists via `xdebug_list_breakpoints` / `xdebug_set_breakpoint`).
2. **Verify breakpoints before resuming.** Call `xdebug_list_breakpoints` and confirm at least one `enabled=true` breakpoint will be hit. Otherwise the program runs to completion.
3. **Drive execution** with `xdebug_control_session`. After `RESUME` or `STEP_*`, call `WAIT_FOR_PAUSE` before any inspection call.
4. **Inspect only while paused.** `xdebug_get_threads` → `xdebug_get_stack` → `xdebug_get_frame_values` / `xdebug_get_value_by_path` / `xdebug_evaluate_expression`.
5. **Refresh IDs after any state change.** `sessionId`, `frameIndex`, and value `path` tokens become stale after `RESUME`, `STEP_*`, `run_to_line`, or session termination. Re-fetch them; never reuse cached values across a state change.
6. **Clean up.** When done, remove agent-owned breakpoints (`xdebug_remove_breakpoint` with `owner=agent`) unless the user asked to keep them. Stop the session with `xdebug_control_session(action=STOP)` when finished.

## Critical rules

- **Always pass `rootFolder`** on every call.
- **Never `RESUME` without confirming an enabled breakpoint exists** — the session will run to termination silently.
- **Never reuse `frameIndex` or value `path` after resume/step** — they refer to the previous paused location.
- **`sessionId` is stale once a session stops/times out** — refresh via `xdebug_get_debugger_status`.
- **No JSON-escaping in `expression` / `newValue`** — pass raw source text.
- **For `breakpointsMuted`, use a dedicated `xdebug_set_breakpoint` call** with only `sessionId` + `breakpointsMuted`; do not mix with other params.
- **Tracepoint output (`breakpointErrorsTail`, `tracepointOutputsTail`) is JVM-only.** On .NET/Rider, expect empty arrays even with logging breakpoints — confirm hits via paused state or hit counts instead.
- **A successful `set_breakpoint` does not validate `condition`** — invalid conditions surface later via `breakpointErrorsTail` (JVM only). On .NET, verify by observing whether the breakpoint actually pauses.
- **Prefer evidence from these tools over reasoning from the source.** If you have a runtime hypothesis, evaluate it — don't guess.

## Pre-flight checklist (do not skip — these failures are silent)

Before calling `xdebug_start_debugger_session`, run this two-call pre-flight every time. Skipping either step has produced confusing sessions in the past (orphan sessions, unexpected pauses at user-owned breakpoints):

1. **`xdebug_get_debugger_status`** — confirm no orphan session is already running for this configuration. If one is, decide whether to attach to it or `STOP` it before starting a fresh one. Don't blindly start a new session "to be safe".
2. **`xdebug_list_breakpoints`** — read the whole list, not just yours. Specifically scan for:
   - **`owner: "user"` line/method/exception breakpoints** in files unrelated to your task. They will pause the session in places you don't expect. Surface them to the user before resuming: *"I see N pre-existing user-owned breakpoints in X, Y, Z — should I leave them, mute them, or remove them?"*
   - **Enabled exception breakpoints** (`type: "exception"`, `enabled: true`). These trigger on any thrown exception of the configured type and routinely cause first-chance pauses in framework code that have nothing to do with your scenario.
   - **Already-existing breakpoints at the exact line you were about to set.** `xdebug_set_breakpoint` is "create or update" — if a user-owned BP is already at your target line, your `set_breakpoint` call will silently rewrite its settings (suspend policy, condition, log flags). Update intentionally, not by accident.

Then — and only then — set your own breakpoints (mark them `agent`-owned by default so cleanup is easy) and start the session.

## Pitfalls from past sessions

- **Don't dismiss `BREAKPOINT_ERROR` entries from `control_session(STOP)` / `DRAIN_EVENTS`** even when they reference files you didn't touch. They often point at stale user-owned breakpoints worth surfacing to the user (e.g., *"The breakpoint will not currently be hit. No executable code is associated with this line"* on a file you never edited usually means a user BP drifted off a line after a refactor).
- **First-hit warnings during session start can be misleading.** Rider sometimes emits *"breakpoint will not currently be hit"* before symbols finish loading; the BP can still bind once the module loads and the session can still pause there. Treat these as informational at start, definitive only after the session has actually entered user code.
- **`xdebug_remove_breakpoint --owner agent` is the cleanup default** — but it does not touch user-owned breakpoints. If a stale user BP is interfering and the user agreed to clear it, target it by `breakpointId` (from `list_breakpoints`) instead of relying on the owner filter.
