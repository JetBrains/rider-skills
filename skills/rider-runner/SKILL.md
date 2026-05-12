---
name: rider-runner
description: Rider MCP run-configuration driver. MANDATORY when the user asks to list, run, or execute a Rider/IntelliJ run configuration, run a test or `Main`/entry point from a file (by `filePath`+`line`), discover run points (gutter Run icons) in a file, capture run output, or override `programArguments` / `workingDirectory` / `envs` for a one-off launch. Use these `mcp__<rider_mcp_name>__execute_run_configuration` / `get_run_configurations` tools instead of asking the user to click Run in the IDE or invoking `dotnet`/`gradle`/CLI runners manually.
---

# Rider Runner Skill

This skill drives JetBrains Rider (and other IntelliJ-family IDEs) run configurations through the `mcp__<rider_mcp_name>__execute_run_configuration` and `mcp__<rider_mcp_name>__get_run_configurations` MCP tools. Use these tools as the **only** way to start a run from the IDE's configured environment — do not ask the user to click around the IDE, and do not invoke `dotnet run`, `dotnet test`, `gradle`, `npm`, etc. directly when a run configuration already encodes the right launch.

For running under the **debugger** instead of plain run, use the `rider-debugger` skill (`xdebug_start_debugger_session`).

## GATE — Resolve the Rider MCP server name first

Before calling **any** runner tool, you MUST resolve `<rider_mcp_name>` — the actual MCP server prefix for the Rider/JetBrains MCP on this machine. The literal string `mcp__<rider_mcp_name>__` is a placeholder; the real prefix varies per install (`rider`, `jetbrains`, `intellij`, `rider-mcp`, `jetbrains-ide`, etc.).

**Detection steps (in order):**

1. **Scan the available tool list / deferred tools** (the `<system-reminder>` listing `mcp__*__execute_run_configuration`, `mcp__*__get_run_configurations`, or any other clearly Rider/IntelliJ-flavored MCP tools — e.g. `build_solution`, `execute_sql_query`, `git_status`, `get_solution_projects`, `apply_patch`, `xdebug_*`). Take the prefix between `mcp__` and the second `__`. Example: a tool named `mcp__jetbrains__execute_run_configuration` → `<rider_mcp_name>` = `jetbrains`.
2. **Prefer the prefix that owns `execute_run_configuration` + `get_run_configurations` together.** If multiple MCP servers are registered, the correct one is the one exposing both runner tools (and typically the `xdebug_*` family too).
3. **If no `execute_run_configuration` tool is visible under any `mcp__*__` prefix**, the Rider MCP is not registered or not connected. **STOP**, do not attempt fallbacks, and tell the user:
   > "I can't find the Rider/JetBrains MCP server (no `mcp__*__execute_run_configuration` tool is exposed). Please make sure Rider is running with the MCP server enabled and the client is connected, then ask me again."
4. **Cache the resolved name for the rest of the session.** Substitute it for `<rider_mcp_name>` in every tool call. Do not re-resolve on every step.

Do not proceed past this gate until `<rider_mcp_name>` is known. Calling `mcp__<rider_mcp_name>__execute_run_configuration` literally (without substitution) will fail with `InputValidationError` if the actual prefix is different.

## When this skill is mandatory

Activate (and stay active) whenever the user asks you to:
- Run a specific named run configuration ("run the API config", "execute the integration tests config")
- Run a test method, `Main` method, or other executable entry point from a file (by line number)
- Capture stdout/stderr from a run so you can analyze the output
- Override `programArguments`, `workingDirectory`, or environment variables for a single launch without persisting changes
- List which run configurations exist in the solution, or discover which gutter-runnable entries exist in a given file
- Wait for a long-running process to finish (or fire-and-forget a server-style process)

If you find yourself proposing `dotnet run …`, `dotnet test …`, `npm run …`, `python …`, or "please click the Run button" — stop and use these tools instead.

## Always pass `rootFolder`

Every tool accepts `rootFolder`. **Always pass it** with the .NET solution root (or current working directory if that is all you know). It disambiguates project resolution and avoids extra round-trips. Ask the user once if unknown, then reuse for every subsequent call.

## Tool reference (short)

### Discovery
- **`mcp__<rider_mcp_name>__get_run_configurations`** — Two modes, controlled by `filePath`:
  - **Without `filePath`** — lists the solution's existing run configurations. Each entry has `name` (pass to `execute_run_configuration` as `configurationName`), optional `description`, `commandLine`, `workingDirectory`, `environment`, and the **`supportsDynamicLaunchOverrides`** capability flag.
  - **With `filePath`** — returns `runPoints`: 1-based line numbers in that file where the IDE shows a Run gutter icon (test methods, `Main`, etc.), each with `description` / `elementText`. Pass `filePath`+`line` back to `execute_run_configuration` to run from code without creating a permanent configuration.

  `supportsDynamicLaunchOverrides` is the **source-of-truth** capability flag for one-time launch overrides. Only pass `programArguments` / `workingDirectory` / `envs` to `execute_run_configuration` when this flag is `true` for the selected configuration.

### Execution
- **`mcp__<rider_mcp_name>__execute_run_configuration`** — Run a configuration and (optionally) wait for it to finish. Two **mutually exclusive** modes:
  - **By name**: pass `configurationName` (from `get_run_configurations`).
  - **By code location**: pass `filePath` + `line` (from `get_run_configurations(filePath=...)` run points). This creates a temporary run configuration from that code context.

  Optional one-shot launch overrides (only when `supportsDynamicLaunchOverrides=true`):
  - `programArguments` — missing/null/`""` keeps existing; whitespace-only (`" "`) **clears** it.
  - `workingDirectory` — same rules.
  - `envs` — missing/null keeps existing env; provided values are **merged over** existing env.

  Wait behavior:
  - `waitForExit=true` (default usage): wait up to `timeout` ms for termination. If timeout expires, the process keeps running in the background and `exitCode` is omitted. Pick a `timeout` that matches the expected run length: short tests `30000–60000`, full test suites `120000–600000`, servers/long jobs use `waitForExit=false` instead.
  - `waitForExit=false`: return as soon as the process starts; `timeout` is ignored. Use this for servers or anything you want to keep alive in the background.

  Returns: `output` (snapshot, first ~10 000 chars; `<truncated>` appended if more), optional `exitCode`, optional `fullOutputPath` (path to a temp file with the full raw output — keeps growing while the process lives, valid while the IDE runs), and `sessionId`.

## Mandatory workflow

Follow this loop. Do not skip steps.

1. **Discover.** Call `get_run_configurations` (no `filePath`) at least once per session to know the available named configurations. If the user said "run the test at line N of file X", call `get_run_configurations(filePath=X)` to confirm there is a run point at or near line N.
2. **Pick the mode.** Either `configurationName` **or** `filePath`+`line` — never both in the same call.
3. **Decide on overrides.** Only pass `programArguments` / `workingDirectory` / `envs` when (a) the user explicitly asked for that override **and** (b) the target configuration reports `supportsDynamicLaunchOverrides=true`. Otherwise omit them entirely so the configured values are used.
4. **Decide on waiting.** For finite jobs (builds, tests, scripts), use `waitForExit=true` with a realistic `timeout`. For servers / interactive processes / anything you don't intend to block on, use `waitForExit=false`.
5. **Execute** `execute_run_configuration`.
6. **Read the result.** Inspect `output`; if it ends with `<truncated>` and you need more, ask the user to share `fullOutputPath` or call again with `waitForExit=false` and follow up. Use `exitCode` (when present) to decide pass/fail. If `exitCode` is absent under `waitForExit=true`, the run timed out — extend `timeout` or switch to `waitForExit=false`.

## Critical rules

- **Always pass `rootFolder`** on every call.
- **`configurationName` and (`filePath`+`line`) are mutually exclusive.** Pick one mode per call; supplying both is an error.
- **Never pass launch overrides** (`programArguments`, `workingDirectory`, `envs`) unless `supportsDynamicLaunchOverrides=true` for the target configuration and the user actually asked for a change. Overrides are a one-shot diff, not a persistent edit of the run configuration.
- **`""` (empty string) keeps the existing value; `" "` (whitespace) clears it.** This applies to `programArguments` and `workingDirectory`. Do not pass `""` thinking it will blank the field.
- **`envs` is a merge, not a replace.** Existing env vars not mentioned in the override are preserved.
- **`waitForExit=false` ignores `timeout`** — use it for servers and fire-and-forget runs. Do not increase `timeout` to keep a server alive.
- **`exitCode` absent under `waitForExit=true` means the wait timed out**, not that the process succeeded. The process is still alive in the background; the IDE will keep producing output to `fullOutputPath`.
- **For running under the debugger, use the `rider-debugger` skill instead** (`xdebug_start_debugger_session`). This skill is for plain Run, not Debug.
- **Prefer named configurations over `filePath`+`line` when one already exists for the same target** — it captures the user's intended args/env/working-dir.
