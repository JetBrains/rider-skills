# Rider MCP Tools — Reference

Every tool below is invoked through the router: `execute_tool(command="<tool> --flag value ...")`. The first token is the exact tool name; the rest are `--flag value` pairs.

Tool names in this file are always the **bare** names. In Claude Code each one is namespaced by the MCP server key from the environment's config — `mcp__<key>__<tool>` — and that key varies per environment: `rider` in a local IDE, `ide-headless-mcp` in a headless eval container, `jetbrains` or `ide` elsewhere. It may contain hyphens. Never type a prefix from memory. Resolve it once with a bare-name search, which matches on the name and ignores the prefix:

```
ToolSearch(query="+execute_tool", max_results=5)
```

The result carries the exact namespaced name and its schema; reuse that prefix for every later call. Where a configuration exposes the individual tools directly, `+lint_files`, `+get_file_problems`, and friends resolve them the same way — prefer a direct typed call over serializing flags into the router.

Rider disables the generic platform `search_symbol`, `lint_files`, `get_file_problems`, `build_project`, and `reformat_file` and replaces them with Rider-specific implementations, so the contracts here are the Rider ones.

---

## Argument rules

- Every `--flag` needs a value. Bare flags are rejected.
- Booleans are explicit: `--errorsOnly false`, `--preview true`. Only the literal `true` (any case) is true.
- Numbers pass through directly: `--limit 25`, `--timeout 60000`.
- Objects and arrays are JSON, single-quoted, always an array even for one element: `--files '["Source/Module/Foo.cpp"]'`, `--paths '["Source/**"]'`.
- Quote any value containing spaces.
- Paths are relative to the solution/project root, with forward slashes.
- Omit an optional parameter rather than passing an empty string.
- `Missing required parameters: <names>` and `Tool '<x>' not found` are input errors — fix the flag or the name and retry.

```
execute_tool(command="search_symbol --q UMyGameplayComponent")
execute_tool(command="get_file_problems --filePath Source/LyraGame/Character/LyraHealthComponent.cpp --errorsOnly false")
execute_tool(command="lint_files --files '[\"Source/LyraGame/Foo.h\",\"Source/LyraGame/Foo.cpp\"]' --min_severity error")
execute_tool(command="reformat_file --files '[\"Source/LyraGame/Foo.h\",\"Source/LyraGame/Foo.cpp\"]'")
execute_tool(command="build_solution_start --filesToRebuild '[\"Source/LyraGame/Foo.cpp\"]'")
```

Rider refreshes each file from disk before analyzing, formatting, or refactoring it, so files written with `Edit`/`Write` need no save or sync step first.

---

## Search

### `search_symbol`
Semantic lookup — classes, methods, fields by name or identifier fragment. The entry point when you know a name but not the file.

`--q <text>`, optional `--paths '["glob"]'` (project-root-relative globs), optional `--include_external true`, optional `--limit <n>` (default 1000). Project symbols only by default; retry with `--include_external true` when you need an SDK, engine, or library symbol.

### `search_text`
IDE-indexed literal text search. `--q <text>`, optional `--paths`, optional `--limit`. Prefer it over `Grep` when the IDE index matters — generated/reflected UE code or unsaved editor state.

### `search_regex`
Same contract as `search_text`, with `--q` as the regex.

### `search_file`
Find files by glob. `--q '<glob>'`, optional `--paths`, optional `--includeExcluded true`, optional `--limit`. A pattern without `/` is treated as `**/pattern`.

Note: all four take `--q`. There is no `--query`.

---

## Code intelligence

### `get_symbol_info`
**Position-based**: `--filePath <path> --line <1-based> --column <1-based>`. `Read` the file first to get the coordinates. Use it to confirm a contract — nullable return, editor-only, threading guarantees.

### `analyze_calls`
Call hierarchy. `--symbolFqn <FullyQualifiedCallable> --analysisKind INCOMING_CALLS|OUTGOING_CALLS`, optional `--depth <n>` (default 5), `--maxChildren <n>`, `--maxNodes <n>`, `--treePath`/`--childOffset` for paging into a subtree. Pass a fully qualified name, never a path/line/column. An ambiguity error returns exact signatures — resubmit with one. "No call hierarchy provider found" → fall back to `Grep`.

---

## Diagnostics

### `get_file_problems`
`--filePath <path>`, optional `--errorsOnly true|false` (default `true`), optional `--timeout <ms>`. Returns problems with severity, description, line content, and 1-based line/column. `timedOut: true` means the budget ran out, not that the file is clean.

### `lint_files`
`--files '["path", ...]'`, optional `--min_severity warning|error` (default `warning`, which also includes code-style suggestions and hints), optional `--timeout <ms>`. Per-file results; a file entry may carry `timedOut: true` with empty problems, or a `notAnalyzedReason` (unsupported type, or not part of any project). Top-level `more: true` means the batch is incomplete.

### `get_project_problems`
Reads the IDE Problems View — it does not trigger new analysis. Optional `--severity Error|Warning|Info|All` (default `All`), optional `--subsystem <id>` (e.g. `Solution`, `Roslyn`, `NuGet`). Run a build first if you need current build diagnostics.

### `post_edit_quality_check`
Reformat + analysis in one call, returning Claude Code hook-protocol JSON. It exists for a PostToolUse hook, not for direct use — call `reformat_file` and `lint_files` instead. Worth knowing because if the project installs Rider's bundled quality-check hook, its output after each `Edit`/`Write` already carries the analysis: `{"decision":"block", ...}` on errors, `additionalContext` for warnings or a clean run. The hook skips reformatting for C/C++ files but still inspects them.

---

## Build

### `build_solution_start`
Optional `--rebuild true|false` (default `false`), optional `--filesToRebuild '["path"]'`. Returns a `sessionId` immediately; fails if a build is already running. For Unreal: Hot Reload when the editor is connected and Live Coding is available, otherwise UBT compiles the primary Editor target.

### `build_solution_state`
Optional `--sessionId <id>` (omit for the most recent build). Returns `state` — `Running`, `Completed`, `Cancelled`, `NotFound` — plus problems accumulated so far, and `buildIsSuccess` once `Completed`. Safe to poll.

---

## Refactoring

Semantic edits to code that already exists. For new implementation, use `Edit`/`Write`.

### `rename_refactoring`
`--filePath --symbolName --newName`. `--symbolName` accepts `Name` or `Type.Member`.

### `change_api_signature`
`--filePath --methodName --parameters`. Pass a **bare** `--methodName` plus `--declaringType <FullyQualifiedType>`; `--parameters` is a single-quoted JSON array holding the **complete** new parameter list in order. Disambiguate overloads with `--currentSignature '["int","string"]'` (the current types).

### `move_type_to_namespace`
`--filePath --typeName --targetNamespace`.

### `safe_delete`
`--filePath --symbolName`. Deletes only when there are no remaining usages.

### `extract_method`
`--filePath --startLine --endLine --methodName` (C# only).

### `extract_interface` / `extract_base_class`
`--filePath --typeName --interfaceName|--baseClassName --members '["Name", ...]'`.

Every refactoring tool also takes `--preview true` — analysis only, no writes. Run it first for public API or many-call-site changes, then re-issue without it. A non-empty `conflicts` list means nothing was written.

---

## UE editor connection

Only useful with the UE editor running and RiderLink loaded.

- `ue_status` — editor health + PIE state + recent logs. Call this before any other live-state tool.
- `ue_health` — minimal connection check, no logs.
- `ue_get_logs` — editor logs, filterable by category/pattern/verbosity.
- `ue_play` — drive PIE (play/pause/resume/stop/frame/state).
- `ue_execute_python` — run Python inside the live editor. **Single line only** — no `\n`; use `;` and comprehensions. `unreal.GameplayTag("Tag.Name")` takes its argument positionally.

## UE assets and tags

- `search_assets` — find assets by name, base class, or package path.
- `search_tags` — find gameplay tags by prefix.
- `get_class_hierarchy` — Blueprint assets inheriting from a C++ class.
- `get_asset_properties` — read UPROPERTY values from a `.uasset`. Needs the editor running.
- `find_default_value_overrides` — every asset overriding a reflected field's default. Works **without** the editor.

## Other

- `simulate_input` — simulate player input; each mode has its own named params.
- `take_screenshot`, `viewport_camera`, `spawn_actor` — editor/game viewport control.
- `get_run_configurations`, `execute_run_configuration` — list and launch run configurations.
- `get_solution_projects`, `get_project_dependencies` — solution structure; `--projectName` must be exactly as `get_solution_projects` returned it.
- `xdebug_*` — debugger session control (breakpoints, stack, frame values, expression evaluation, stepping). For runtime investigation rather than authoring; see the `ue-live-debugging` skill.
