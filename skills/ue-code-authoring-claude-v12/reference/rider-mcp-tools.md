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
- Paths are relative to the solution/project root, with forward slashes. A path outside the root is
  reachable with `../` (engine and SDK sources resolve this way).
- Omit an optional parameter rather than passing an empty string.
- `Missing required parameters: <names>` and `Tool '<x>' not found` are input errors — fix the flag or the name and retry.

**Flag casing is per-tool, not global.** Most path flags are camelCase (`--filePath`), but `read_file`
takes **snake_case `--file_path`**. Copy the spelling from this file's entry for the tool you are
calling; do not carry a flag name over from a neighbouring tool. Guessing here costs a full
`Missing required parameters: file_path` round trip.

```
execute_tool(command="search_symbol --q UMyGameplayComponent")
execute_tool(command="get_file_problems --filePath Source/MyModule/MyGameplayComponent.cpp --errorsOnly false")
execute_tool(command="lint_files --files '[\"Source/MyModule/Foo.h\",\"Source/MyModule/Foo.cpp\"]' --min_severity error")
execute_tool(command="reformat_file --files '[\"Source/MyModule/Foo.h\",\"Source/MyModule/Foo.cpp\"]'")
execute_tool(command="build_solution_start --filesToRebuild '[\"Source/MyModule/Foo.cpp\"]'")
execute_tool(command="read_file --file_path ../<engine>/Plugins/Runtime/SomeModule/Public/SomeHeader.h --offset 120 --limit 80")
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

## Reading

### `read_file`
`--file_path <path>` — **snake_case, unlike every other path flag here**. Optional `--offset <1-based
line>` (default `1`) and `--limit <lines>` (default `2000`, max `5000`). Returns 1-indexed numbered
lines. Reads anything in the project or in any dependency/SDK/engine source root, so it is the way to
read an engine header the shell cannot reach.

**Always bound a read of a large or unfamiliar header.** The default 2000-line window is far larger
than the client's per-result token budget: a big engine header (1000–2000 lines) comes back as
`Error: result (… characters across … lines) exceeds maximum allowed tokens. Output has been saved to
…` — the call is spent and you get nothing usable. Locate the symbol first (`search_symbol` /
`search_text`), then read a window around the hit:

```
execute_tool(command="search_symbol --q SomeSymbol --include_external true")
execute_tool(command="read_file --file_path ../<engine>/…/SomeHeader.h --offset 940 --limit 60")
```

Never try to recover a spilled result by reading the agent's own session/transcript files — re-read
the source with a narrower window instead.

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

**Expect index-level false positives on UE sources.** The C++ resolver does not expand every UE macro,
so it reports `severity: ERROR` on code that compiles cleanly. Recurring shapes: a
`Cannot resolve user-defined 'operator ""_…'` on an attribute-accessor macro line, and
`Cannot resolve symbol 'PLATFORM_BREAK'` on a `check(...)` line. **Calibrate with exactly one
comparison** — run the same call on a single untouched neighbour file of the same kind. If the
identical diagnostic appears there too, it is resolver noise for the whole project: record that once
and ignore that signature for the rest of the session. Do not sweep further files to re-confirm it,
and do not edit working code to satisfy it.

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
Optional `--sessionId <id>` (omit for the most recent build). Returns `state` — `Running`, `Completed`, `Cancelled`, `NotFound` — plus problems accumulated so far, and `buildIsSuccess` once `Completed`. Safe to poll, but each poll is a full turn — space polls ~60s apart on a UE build rather than looping tightly.

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
