---
name: ide
description: "Generic IDE MCP driver. Single entry point for all IDE interactions. MANDATORY for: code quality — inspect, lint, find problems, apply quick-fix, rename, reformat (ide:quality); building — non-blocking build_solution_start + state polling for .NET/CMake/UE/Godot solutions (ide:build); running configurations — execute tests, capture output, override launch args, stop processes (ide:runner); codebase search — find symbols, files, text, regex (ide:search); debugging — start sessions, breakpoints, step, inspect variables, evaluate expressions (ide:debugger); long-running operations — background protocol for builds/cooks/packages with Monitor + ScheduleWakeup (ide:long-ops). Use `mcp__<ide_mcp_name>__*` tools instead of CLI fallbacks, print statements, manual IDE actions, or guessing."
---

# Generic IDE Skill

One skill for all IDE MCP interactions. Pick your domain below, share the GATE and universal rules above it.

## Domain Routing

| Domain | Trigger | Key tools |
|--------|---------|-----------|
| **ide:quality** | inspect, lint, problems, quick-fix, rename, reformat | `lint_files`, `get_file_problems`, `get_inspections`, `apply_quick_fix`, `rename_refactoring`, `reformat_file`, `run_inspection_kts`, `generate_psi_tree` |
| **ide:build** | start a non-blocking solution build, poll state, surface problems incrementally; works for .NET, C++ (CMake), Unreal (UBT / Live Coding), Godot | `build_solution_start`, `build_solution_state`, `get_solution_projects`, `get_project_dependencies` |
| **ide:runner** | run config, execute test/Main, capture output, launch override, **stop a running process** via terminal kill | `get_run_configurations`, `execute_run_configuration`, `execute_terminal_command` |
| **ide:search** | find symbol/class/method, file by name/glob, text/regex in code | `search_symbol`, `search_file`, `search_text`, `search_regex` |
| **ide:debugger** | debug, breakpoint, step, inspect variable, evaluate, mutate | `xdebug_start_debugger_session`, `xdebug_get_debugger_status`, `xdebug_control_session`, `xdebug_set_breakpoint`, `xdebug_list_breakpoints`, `xdebug_remove_breakpoint`, `xdebug_run_to_line`, `xdebug_get_threads`, `xdebug_get_stack`, `xdebug_get_frame_values`, `xdebug_get_value_by_path`, `xdebug_evaluate_expression`, `xdebug_set_variable` |
| **ide:long-ops** | builds / cooks / packages / any IDE-spawned command running for minutes-to-hours | `Bash run_in_background`, `Monitor`, `ScheduleWakeup`, plus polling whichever MCP tool started the job |

---

## GATE — Resolve the IDE MCP server name first

Before calling **any** tool, resolve `<ide_mcp_name>` — the actual MCP server prefix. The string `mcp__<ide_mcp_name>__` is a placeholder; the real prefix varies per install (`ide`, `jetbrains`, `intellij`, `ide-mcp`, `jetbrains-ide`, etc.).

**Detection (in order):**
1. Scan the deferred tool list in `<system-reminder>` for any clearly IDE-flavored tool (e.g. `lint_files`, `get_file_problems`, `xdebug_*`, `execute_run_configuration`, `search_symbol`, `reformat_file`). Take the prefix between `mcp__` and the second `__`. Example: `mcp__jetbrains__lint_files` → `<ide_mcp_name>` = `jetbrains`.
2. Prefer the prefix that owns the broadest family of matching tools.
3. **If nothing found** — STOP and tell the user: *"I can't find the IDE MCP server. Please make sure the IDE is running with the MCP server enabled and the client is connected, then ask me again."*
4. **Cache the resolved name for the rest of the session.** Never re-resolve on every step.

## Universal Rules

- **Always pass `rootFolder`** on every call — solution root (or current working directory). Ask once if unknown; reuse for every subsequent call.
- These tools are the **only** way to interact with the IDE — do not fall back to CLI runners, shell grep, print statements, or "please right-click in the IDE."
- If a tool is missing, tell the user which MCP module is needed rather than simulating the action manually.

---

## ide:quality

### Tool selection

| Goal | Tool |
|------|------|
| Problems in one or more files | `lint_files` |
| Problems in one file with severity filter | `get_file_problems` |
| Problems + quick-fix list for a file | `get_inspections(filePath=...)` |
| List available inspections | `get_inspections()` (no filePath) |
| Apply a quick-fix or intention action | `apply_quick_fix` |
| Rename a symbol across the solution | `rename_refactoring` |
| Reformat a file or region | `reformat_file` |
| Custom `.inspection.kts` script | `run_inspection_kts` |
| Dump PSI tree for debugging custom inspection | `generate_psi_tree` |

### Workflow

1. **Get problems.** `lint_files` (multiple files) or `get_file_problems` (single). For fix list alongside problems use `get_inspections(filePath=...)`.
2. **Triage.** Report by severity: ERROR → WARNING → lower. Format: `(filePath:line:col): message`.
3. **Apply fixes.** Note `line`, `column`, `fixName` from `get_inspections`. Call `apply_quick_fix`. Fix one problem at a time — coordinates shift after each write.
4. **Verify.** Re-run `get_file_problems`/`lint_files` to confirm problem count dropped.

**Renaming:** locate the declaration with `search_symbol` (ide:search), then call `rename_refactoring` with declaration coordinates + `newName`. Verify with another `search_symbol` that the old name is gone.

**Reformatting:** call `reformat_file`; pass `startLine`/`endLine` to scope to a region.

### Hook feedback → mandatory auto-fix

When a `PostToolUse` hook returns `additionalContext` containing IDE quality issues, **act immediately — never ask the user first**:

- **Errors present** (hook blocks the edit): fix every listed error now. Use `apply_quick_fix` when a fix name is known; otherwise edit the file directly at the indicated line. After all errors are resolved, summarize: *"Fixed N error(s): • L{line}: {what you did}..."* If warnings were also listed, mention them and ask whether to fix those too.
- **Warnings listed** (hook does not block): apply `apply_quick_fix` for each warning. Summarize what was fixed.
- **Pre-existing issues** (existed before your edit): treat them identically — add an explicit step to your plan and fix them. Never dismiss an issue as "pre-existing / not part of this task" and stop. Every issue the hook reports must be resolved.
- **Pre-existing errors** (errors that existed before your edit, not introduced by you): do not ignore them. Add an explicit step to your plan to fix them — treat them the same as errors you introduced.

### Critical rules

- `apply_quick_fix` coordinates must come from a **fresh** inspection call — any prior write shifts line numbers.
- `fixName` must be the **exact** string from `get_inspections` — never paraphrase or guess.
- `rename_refactoring` is atomic across all usages — never edit identifier text manually.
- `apply_quick_fix`, `run_inspection_kts`, `generate_psi_tree` may not be exposed by every IDE MCP server. If unavailable, tell the user which MCP module is needed.
- No MCP tools exist for move / safe-delete / extract / change-signature — tell the user to do these in the IDE.

---

## ide:build

The IDE exposes a two-step build API: `build_solution_start` kicks off the build (non-blocking) and `build_solution_state` polls the result. There is **no** blocking single-call `build_solution` form. The same API drives any solution kind Rider supports — .NET (MSBuild), C++ (CMake / RdJson), Unreal (UBT or Live Coding, depending on whether the editor is connected), and Godot.

### Tool reference

| Tool | Purpose | Notes |
|------|---------|-------|
| `build_solution_start(rebuild?, filesToRebuild?)` | Kick off a build. Returns `{ sessionId }`. | Hard errors come back as `isError: true` with `errorMessage`: `Solution builder is not ready`, `Another build is already running`, `No projects found for the specified files`. |
| `build_solution_state(sessionId?)` | Poll the most recent build (or a specific one). | Returns `{ sessionId, state, buildIsSuccess?, problems[], errorMessage? }`. Terminal states: `Completed`, `Cancelled`, `NotFound`. `problems` is the **accumulated** snapshot — it grows mid-flight. |
| `get_solution_projects` / `get_project_dependencies` | Discover targets / module wiring before editing build files. | Solution-agnostic. |

### Workflow

1. **Pre-flight analysis.** `get_file_problems` / `lint_files` on the edited file(s). Fix every error before requesting a build — the build will surface the same problems but slower.
2. **Start.** `build_solution_start(rebuild=false)` (or `rebuild=true` for a full rebuild). For per-file compile pass `filesToRebuild: ["path/relative/to/solution.cs", ...]`; relative paths resolve against the solution dir.
3. **Poll until terminal.** Loop `build_solution_state(sessionId)` with a 1-3 s `sleep` between polls. Display incremental `problems` as they arrive — the agent doesn't need to wait for completion to surface the first errors.
4. **Verdict.** On terminal state, **`state == "Completed"` is not enough** — check `buildIsSuccess`. The combinations:
   - `state=Completed, buildIsSuccess=true` → success.
   - `state=Completed, buildIsSuccess=false, problems non-empty` → ordinary build failure; report problems.
   - `state=Completed, buildIsSuccess=false, problems empty, errorMessage="Build failed without diagnostic output…"` → **silent-failure guard**. The runner exited non-zero with nothing captured; read the IDE's build log (Run tool window output or `out/dev-data/.../ij_run__*.log`) for the real reason.
   - `state=Cancelled` → user / lifetime interruption; not a real failure.
   - `state=NotFound` → caller passed a `sessionId` that doesn't match the most recent build.

### Critical rules

- **Status check is non-optional.** Don't treat `Completed` as success. `buildIsSuccess` is the real verdict.
- **Long builds → switch to ide:long-ops.** If your build runs for many minutes (UE editor target, large monorepo), see the background protocol below — don't sit on a blocking poll loop in the foreground.
- **Per-build session IDs are not stable across IDE restarts.** Don't persist them; treat each build as a fresh session.
- **`build_solution_start` will reject a second concurrent call.** Wait for the previous build to terminate (or call `build_solution_state(sessionId=null)` to see whether one is still `Running`) before starting another.

### UE-specific dispatch (informational)

For `.uproject` solutions the runner picks itself: editor connected + Live Coding available → `UnrealLiveCodingBuildRunner` (Hot Reload via `triggerHotReload`); otherwise → `CppUE4UbtBuildRunner` (UBT compile of the primary game target). See **ide-ue** for confirming which path ran (`ps … UnrealBuildTool`).

---

## ide:runner

### Tool reference

- **`get_run_configurations`** — Two modes:
  - Without `filePath`: list named configurations. Each has `name`, `supportsDynamicLaunchOverrides`, `commandLine`, `workingDirectory`, `environment`.
  - With `filePath`: return `runPoints` — 1-based lines with gutter Run icons (test methods, `Main`, etc.).
- **`execute_run_configuration`** — Two mutually exclusive modes:
  - By name: `configurationName` (from `get_run_configurations`).
  - By code location: `filePath` + `line` (from run points).
  - One-shot overrides (only when `supportsDynamicLaunchOverrides=true`): `programArguments`, `workingDirectory`, `envs`. `""` keeps existing; `" "` (whitespace) clears. `envs` merges over existing.
  - `waitForExit=true` (default): wait up to `timeout` ms. `waitForExit=false`: fire-and-forget (servers). Returns `output`, optional `exitCode`, `fullOutputPath`, `sessionId`.

### Workflow

1. **Discover.** `get_run_configurations()` to learn available configurations. For a file-specific run, `get_run_configurations(filePath=X)`.
2. **Pick mode.** `configurationName` **or** `filePath`+`line` — never both.
3. **Overrides** only when `supportsDynamicLaunchOverrides=true` and the user explicitly asked.
4. **Wait.** Finite jobs → `waitForExit=true` + realistic `timeout`. Servers → `waitForExit=false`.
5. **Execute.** Check `output`; `<truncated>` → use `fullOutputPath`. Absent `exitCode` under `waitForExit=true` = timed out (still running).

### Stopping a non-debug run

**There is no native MCP "stop run configuration" tool.** Three workarounds, in preference order:

1. **`execute_terminal_command kill <pid>`** — simplest, works for every process. Get the PID from the `execute_run_configuration` result, from `BashOutput`, or from `pgrep -f`. UE / .NET / Node handle SIGTERM cleanly; for stubborn processes escalate to `kill -9 <pid>`.
2. **`xdebug_control_session(action=STOP)`** — only if the run was started via `xdebug_start_debugger_session`. Doesn't apply to non-debug `execute_run_configuration` launches.
3. **Rider UI** — the Stop button. Reserve for cases where MCP control is unavailable.

### Critical rules

- `configurationName` and (`filePath`+`line`) are mutually exclusive.
- Never pass overrides unless `supportsDynamicLaunchOverrides=true`.
- `waitForExit=false` ignores `timeout`; do not increase `timeout` to keep a server alive.
- For debugging, use **ide:debugger** (`xdebug_start_debugger_session`) instead.
- **Long runs → switch to ide:long-ops** for the background protocol.

---

## ide:search

### Tool selection

| Goal | Tool |
|------|------|
| Symbol (class/method/field/property) by identifier fragment | `search_symbol` |
| File by name or glob pattern | `search_file` |
| Literal substring in file contents | `search_text` |
| Regex pattern in file contents | `search_regex` |

Do not use `search_text` for symbol or file lookups — `search_symbol` is semantic (declaration-aware, ignores comments/strings); `search_file` is far cheaper for name searches.

### Glob filtering (`paths`)

All tools accept `paths` — project-relative globs. `!` prefix excludes (e.g. `"!**/test/**"`). Patterns without `/` expand to `**/<pattern>`. Combine filters and excludes to keep result sets small.

### Workflow

1. Pick the right tool (table above).
2. Constrain with `paths` (e.g. `["src/**", "!**/bin/**", "!**/obj/**"]`). Use `limit` for exploratory queries.
3. Always pass `rootFolder`.
4. If empty results: `search_symbol` → retry with `include_external=true`; `search_file` → retry with `includeExcluded=true` or broader glob; `search_text`/`search_regex` → drop excludes, check casing, switch literal↔regex.
5. If `more=true` → result truncated; raise `limit` or tighten `paths`.

### Pitfalls (CLI dispatcher)

When tools are reached through a CLI dispatcher using `--paramName value` format:
- Parameter is `q` not `pattern`/`query`/`name` — all four tools use `q`.
- Bare extension `.cpp` ≠ "files ending in .cpp" — use `*.cpp` (`**/*.cpp`).
- Brace expansion `{a,b}` may not be portable — issue one call per extension.

### Critical rules

- Coordinates are 1-based; `endColumn` is exclusive.
- `more=true` means truncated — never report "no other matches" without confirming `more=false`.
- For filesystem-level search outside the indexed project, fall back to host Grep/Glob — but confirm the IDE search won't cover it first.

---

## ide:debugger

### Tool reference

**Session lifecycle**
- `xdebug_start_debugger_session` — start by `configurationName` or `filePath`+`line`. Use launch overrides only when `supportsDynamicLaunchOverrides=true`.
- `xdebug_get_debugger_status` — list active sessions and state. Call first when `sessionId` is unknown.
- `xdebug_control_session` — actions: `STEP_INTO`, `STEP_OVER`, `STEP_OUT`, `RESUME`, `PAUSE`, `STOP`, `WAIT_FOR_PAUSE`, `DRAIN_EVENTS`. After `RESUME`, always follow with `WAIT_FOR_PAUSE` (timeout 30000–120000 ms). Steps/pause: 5000–15000 ms.

**Breakpoints**
- `xdebug_set_breakpoint` — create or update. Modes: **location** (`filePath`+`line`, no `breakpointId`) or **ID** (`breakpointId`; optional relocation). Supports `condition`, `isLogMessage`, `isLogStack`, `temporary`, `suspendPolicy` (ALL/THREAD/NONE), `enabled`. Mute-all mode: pass only `sessionId`+`breakpointsMuted`. Inspect returned `lineText` to confirm placement.
- `xdebug_list_breakpoints` — list; filter by `filePath`. **Call before `RESUME`** to confirm enabled breakpoint exists. Reports `owner` (`agent` or `user`).
- `xdebug_remove_breakpoint` — by `breakpointId`, `filePath`+`line`, or `owner` (defaults `agent`). Idempotent.
- `xdebug_run_to_line` — run to `filePath`+`line` from suspended state without a permanent breakpoint.

**Inspection (session must be suspended)**
- `xdebug_get_threads` — paginated thread list; use returned `id` as `threadId`.
- `xdebug_get_stack` — call stack for a thread. Use `index` as `frameIndex`.
- `xdebug_get_frame_values` — locals/params/fields as a tree. `depth=0` = names; `depth=1+` = children.
- `xdebug_get_value_by_path` — drill into nested values via `path=["obj","field"]`. Use exact node names from previous output; array tokens are often `"[0]"`.
- `xdebug_evaluate_expression` — evaluate raw expression in current frame. Pass text **literally** — no JSON escaping.
- `xdebug_set_variable` — mutate at `path`. `newValue` is raw assignable expression. Re-read path after to confirm.

### Pre-flight checklist (run every time before starting a session)

1. **`xdebug_get_debugger_status`** — confirm no orphan session for this configuration. Attach or `STOP` before starting fresh.
2. **`xdebug_list_breakpoints`** — read the whole list. Surface to the user:
   - `owner: "user"` breakpoints in unrelated files — they will pause unexpectedly.
   - Enabled exception breakpoints (`type: "exception"`, `enabled: true`) — trigger on first-chance framework exceptions.
   - Existing breakpoint at the exact line you were about to set — `set_breakpoint` is "create or update"; it silently rewrites settings.

### Workflow

1. **Resolve session.** `xdebug_get_debugger_status`. If none, run pre-flight, then `xdebug_start_debugger_session`.
2. **Verify breakpoints before resuming.** `xdebug_list_breakpoints` — confirm ≥1 enabled breakpoint will be hit.
3. **Drive.** `xdebug_control_session`. After `RESUME`/`STEP_*`, call `WAIT_FOR_PAUSE` before inspecting.
4. **Inspect while paused.** `xdebug_get_threads` → `xdebug_get_stack` → `xdebug_get_frame_values` / `xdebug_get_value_by_path` / `xdebug_evaluate_expression`.
5. **Refresh IDs after any state change.** `sessionId`, `frameIndex`, value `path` tokens are stale after `RESUME`/`STEP_*`/session end — never reuse across a state change.
6. **Clean up.** Remove agent breakpoints (`xdebug_remove_breakpoint owner=agent`). Stop session with `xdebug_control_session(action=STOP)`.

### Critical rules

- **Never `RESUME` without confirming an enabled breakpoint** — session runs to termination silently.
- **Never reuse `frameIndex` or `path` after resume/step** — refers to previous paused location.
- **`sessionId` is stale once a session stops** — refresh via `xdebug_get_debugger_status`.
- **No JSON-escaping in `expression`/`newValue`** — pass raw source text.
- **`breakpointsMuted` requires a dedicated call** with only `sessionId`+`breakpointsMuted` — do not mix with other params.
- **Tracepoint output (`breakpointErrorsTail`, `tracepointOutputsTail`) is JVM-only.** On non-JVM runtimes expect empty arrays — confirm hits via paused state or hit counts.
- `xdebug_set_breakpoint` does not validate `condition` — invalid conditions surface later. On non-JVM runtimes, verify by observing whether the session actually pauses.
- **Prefer evidence from these tools over reasoning from source.** Evaluate, don't guess.

### Pitfalls from past sessions

- `BREAKPOINT_ERROR` entries from `control_session(STOP)`/`DRAIN_EVENTS` — even in files you didn't touch — often indicate stale user-owned breakpoints worth surfacing.
- The IDE may emit *"breakpoint will not currently be hit"* before symbols finish loading at session start. Treat as informational; the BP can still bind once the module loads.
- `xdebug_remove_breakpoint owner=agent` does not touch user-owned breakpoints. Target user BPs by `breakpointId` when the user agreed to clear them.

---

## ide:long-ops

Builds, cooks, packages, large test runs — anything that takes longer than a couple of minutes — must never run in the foreground. A blocking shell call fills the context with thousands of compile/cook lines and locks the agent until completion. Follow this protocol every time.

### When this applies

- **Foreground-blocking shell commands** (`bash …` without `run_in_background`). The classic mistake.
- **`build_solution_state` polling loops** that run for more than ~2 minutes. Switch to a background-polling pattern.
- **`execute_run_configuration` with `waitForExit=true`** on a job that may exceed a minute. Either set `waitForExit=false` and poll, or background the call.

### Background protocol

1. **Launch in background.** Whether via `Bash run_in_background: true` (for raw shell commands) or `execute_run_configuration` + `waitForExit=false`. Capture either the shell ID + log path, or the `fullOutputPath` returned by `execute_run_configuration`. Always redirect stdout+stderr to a single log file when using shell.

2. **Pick exactly ONE monitor mechanism** — do not skip:

   **Option A — `Monitor` tool, persistent**, tailing the log with a multi-category filter so the user gets steady visibility instead of a silent wait. The filter MUST cover three categories:

   - **Terminal markers** (success + every failure signature you can think of). Example: `BUILD SUCCESSFUL|BUILD FAILED|PACKAGE SUCCEEDED|PACKAGE FAILED|AutomationTool exiting|ERROR:|Exception:|fatal error|Killed|OOM`
   - **Phase transitions** so the user sees the pipeline advancing. Example for a UE cook+package: `Running: .*-run=Cook|Cook complete|Running: .*UnrealPak|Stage commandlet|Copying to staging directory|Archiving to|All done`
   - **Periodic heartbeats** — pick patterns that fire every few seconds during the long phases, throttled so notification volume stays sane. Example: `\[[0-9]+0/[0-9]+\] Compile` (every 10th compile line), `Cooked packages [0-9]+00 ` (every 100th cooked package), `Archiving [0-9]+ shaders`, `Adding file to pak`.

   Use `--line-buffered` in any `grep` inside the pipeline to defeat block buffering. Do **not** pipe raw logs into Monitor — event volume autostops it.

   **Option B — `ScheduleWakeup`** at 270 s (cache-warm) or 1200 s+ (cache-miss) intervals. On wake, tail the log and `ps` the PID. Use this when the log is too quiet for line-driven monitoring, or as a safety net alongside Monitor (Monitor gives real-time; ScheduleWakeup catches silent stalls).

3. **Report only what is true.** Do not claim "a monitor is armed" unless you actually called `Monitor`. Do not claim "running in background" if `run_in_background` was false. The honest status report after launch lists: PID, log path, exactly which monitor / wakeup is registered (and what its filter watches for).

4. **On completion**, tail the last ~100 lines of the log, confirm the success marker, and report whatever the deliverable is (archive path, .dylib path, test summary, elapsed time).

5. **On failure**, grep the log for `error:|ERROR:|Exception|fatal error|LogInit: Warning` near the tail. Show the user the **relevant excerpt**, not the whole log.

### `build_solution_*` specifically

For builds started through `build_solution_start` you have two ways to background:

- **Foreground-poll until known-long, then background.** Poll for 30-60 s; if state is still `Running` and you have no reason to expect immediate completion, drop into the protocol above. The poll itself can keep running as a background `Bash` script that calls the MCP tool and writes results to a log.
- **Read the IDE's run log directly.** UBT / dotnet build invocations driven by the IDE write structured output to `out/dev-data/<ide-system>/tmp/ij_run__*.log` (path varies per IDE). Tail that file with Monitor while the build runs.
