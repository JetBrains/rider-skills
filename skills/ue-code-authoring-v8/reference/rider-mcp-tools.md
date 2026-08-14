# Rider MCP Tools — Reference

All tools are invoked through `execute_tool(command="<tool> --flag value ...")`. Do not call underlying `mcp__<prefix>__<tool>` handles directly.

These contracts are for the Rider appender MCP toolsets. Rider disables the generic platform `search_symbol`, `lint_files`, `get_file_problems`, `build_project`, and `reformat_file` tools and replaces them with Rider-specific implementations.

---

## execute_tool mode

Use `execute_tool` mode by default. The first token is the exact tool name, followed by `--flag value` pairs.

Examples:

```
execute_tool(command="search_symbol --q ULyraHealthComponent")
execute_tool(command="get_file_problems --filePath Source/LyraGame/Character/LyraHealthComponent.cpp")
execute_tool(command="lint_files --files '[\"Source/LyraGame/Foo.h\",\"Source/LyraGame/Foo.cpp\"]'")
execute_tool(command="reformat_file --files '[\"Source/LyraGame/Foo.h\",\"Source/LyraGame/Foo.cpp\"]'")
execute_tool(command="build_solution_start --filesToRebuild '[\"Source/LyraGame/Foo.cpp\"]'")
```

List-valued Rider arguments must be JSON arrays: `--files`, `--filesToRebuild`, and `--paths`.

---

## Search

### `search_symbol`
Semantic lookup — finds classes, methods, fields by name. Entry point when you know a symbol name but not its file.

Contract: `--q <text>`, optional `--paths '["glob"]'`, optional `--include_external true`, optional `--limit <n>`. Paths are project-relative glob patterns. Search project symbols first; retry with `--include_external true` only when a dependency or SDK symbol is needed.

### `search_text`
IDE-indexed full-text search. Prefer over rg/grep when IDE index, generated/reflected UE code, or unsaved state matters.

### `search_file`
Find files by glob pattern.

### `skill_search`
Unified search with explicit mode: file (glob), text (literal), or regex.

---

## Code Intelligence

### `get_symbol_info`
**Position-based** — read the file first to find the symbol's line/column. Use to confirm: nullable return, editor-only, threading guarantees, API contract.

### `analyze_calls`
Call hierarchy analysis. Supports C++, Java, Kotlin, Python, C#. If overloads match, returns disambiguation list — resubmit with full signature. If "No call hierarchy provider found" → fall back to `rg`.

---

## Diagnostics

### `get_file_problems`
File-level diagnostics. Contract: `--filePath <path>`, optional `--errorsOnly true|false`, optional `--timeout <milliseconds>`. It returns only errors by default; set `--errorsOnly false` when warnings or suggestions are relevant.

### `lint_files`
Batch lint across multiple files. Contract: `--files '["path"]'`, optional `--min_severity warning|error`, optional `--timeout <milliseconds>`. `warning` is the default and includes suggestions/hints; use `error` for a strict error gate.

### `get_project_problems`
Project-level issues. Run after a successful build, filter to changed files.

### `post_edit_quality_check`
Post-edit gate. Runs reformat + lint in one call.

---

## Build

### `build_solution_start`
Start a build. Contract: optional `--rebuild true|false`, optional `--filesToRebuild '["path"]'`. For Unreal Engine, Rider triggers Hot Reload when the editor is connected and Live Coding is available; otherwise it compiles the primary Editor target through UBT.

### `build_solution_state`
Poll build status until complete. Contract: optional `--sessionId <id>`. States are `Running`, `Completed`, `Cancelled`, and `NotFound`; once completed, check `buildIsSuccess` and returned problems.

---

## Run Configurations

### `get_run_configurations`
List available run configurations.

### `execute_run_configuration`
Launch a run configuration.

---

## UE Editor Connection

### `ue_status`
One-stop check: editor health + PIE state + recent logs. **Call this first** before any UE live-state tool. If not connected → RiderLink not loaded or editor not running.

### `ue_health`
Minimal connection check (no log fetch).

### `ue_get_logs`
Fetch UE editor logs with optional category/pattern/verbosity filter.

### `ue_play`
Control PIE (play/pause/resume/stop/frame/state).

---

## UE Python Runtime Inspection

### `ue_execute_python`
Run Python inside the live UE editor. PIE must be running for game-state queries.  
**Critical: single-line constraint** — no `\n`, use `;` and comprehensions.  
`GameplayTag` constructor: positional only — `unreal.GameplayTag("Tag.Name")`, not keyword arg.

---

## UE Asset & Tag Tools

### `search_assets`
Search UE assets by name, base class, or package path.

### `search_tags`
Search gameplay tags by prefix.

### `get_class_hierarchy`
Get all Blueprint assets inheriting from a C++ class.

### `get_asset_properties`
Read UPROPERTY values from a `.uasset` file. Requires editor running.

### `find_default_value_overrides`
Find every asset that overrides a reflected field's default. Works **without** the editor running.

---

## UE Input Simulation

### `simulate_input`
Simulate player input. Each mode has its own set of named params.

---

## Debugger (xdebug)

### `xdebug_set_breakpoint`
Set standard, conditional, or logpoint breakpoints.

### `xdebug_get_debugger_status`
Get current debugger state.

### `xdebug_get_stack`
Get current call stack.

### `xdebug_get_frame_values`
Get local variable values for a stack frame.

### `xdebug_evaluate_expression`
Evaluate an expression in the current debug context.

### `xdebug_control_session`
Step over/into/out, resume, pause, or stop the debug session.

### `xdebug_run_to_line`
Run execution to a specific file/line.

### `xdebug_start_debugger_session`
Start a debug session from a run configuration.

---

## Refactoring

### `rename_refactoring`
Rename a symbol project-wide.

Use for renaming an existing symbol, not for freeform implementation. Run with `--preview true` first for public APIs or broad changes.

### `extract_method`
Extract a code range into a new method.

### `safe_delete`
Delete a symbol only if it has no remaining usages.

### `move_type_to_namespace`
Move an existing type and update references. Run with `--preview true` first.

### `change_api_signature`
Change an existing method signature and update call sites. `--parameters` is a JSON array of the complete desired parameter list.

---

## Viewport & Screenshot

### `take_screenshot`
Capture editor, game, or asset screenshot.

### `viewport_camera`
Get, set, move, or focus the viewport camera.

### `spawn_actor`
Spawn an actor in the editor.
