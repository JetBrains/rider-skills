---
name: ue-code-authoring
description: "Use when writing or modifying Unreal Engine C++ (classes, actors, components, subsystems, interfaces, function libraries) in Codex, especially when Rider MCP is available. Use Rider diagnostics to catch UHT/reflection errors and missing module dependencies without a full build, and lint_files for cross-file consistency. Do not use for Blueprint-only tasks or editor automation with no C++ authoring. When Rider MCP is unavailable, run in reduced mode with Codex file tools only and document skipped IDE diagnostics."
---

# Code Author

Unreal Engine C++ authoring workflow backed by **Rider MCP** for IDE-grade code quality.
Three additions over a plain editor approach: (1) Rider diagnostics catch issues before a full build, (2) `lint_files` enforces project-wide consistency, (3) `get_project_problems` surfaces cross-file issues invisible to grep.

---

## GATE — mandatory checks before any code is written

### 1. UE Project Check

Verify the current working directory contains a `.uproject` file:

```bash
find . -maxdepth 1 -name "*.uproject" | head -1
```

If **no `.uproject` found** → STOP.

> "This skill requires an Unreal Engine project (a `.uproject` file must be in the working directory). The current directory does not appear to be a UE project. Navigate to the project root and retry."

### 2. Task Is Coding-Related Check

The task must involve **writing or modifying C++ code**. If the request has no C++ authoring component → STOP and inform the user this skill only handles C++ source authoring.

### 3. Rider MCP Availability Check

Use `tool_search` to discover Rider MCP tools before calling any tool. Load live schemas with `tool_search` before calling Rider MCP; schemas are **authoritative for parameter names**. If `execute_tool` is the only tool returned, use CLI mode (see `reference/rider-mcp-tools.md — execute_tool mode`).

If **no Rider MCP tools appear in the deferred list**:

> "Rider MCP tools are unavailable. Open Rider with this project loaded and the MCP server enabled, then retry. Falling back to standard file tools — IDE diagnostics will not run."

Proceed with Codex standard tools only: inspect files with shell commands such as `rg`, `find`, and `sed`, and edit with `apply_patch`. Skip all `mcp__<prefix>__*` steps and document that IDE-backed quality checks were skipped.

---

## Path Selection

**Fast path** for small, scoped edits — one file, no reflection macro, module dependency, public API, replication, or UObject lifetime changes:
1. Verify `.uproject` (Gate 1)
2. Locate files with `rg` or Rider `search_symbol`/`search_text`
3. Read the nearest existing pattern (1–2 files)
4. Edit the minimum files
5. Run `get_file_problems` on changed files if Rider MCP is available
6. Show git diff

**Full workflow** when changing reflection macros, module dependencies, public APIs, replication, UObject lifetime, or multiple files → continue to Checklist below.

## Checklist

Use Codex `update_plan` when the change is complex enough to benefit from an explicit checklist. For simple one-file tasks, keep the plan implicit and proceed directly. For complex changes, track:

1. **GATE** — UE project check + task check + Rider prefix resolution
2. **Clarify** — ask targeted questions if the request is ambiguous (skip if clear)
3. **Pre-flight** — read `.uproject`, `Build.cs`, existing patterns via Rider symbol search
4. **Write code** — create or modify `.h`/`.cpp` with `apply_patch`
5. **Rider diagnostics** — `get_file_problems` per changed file; fix all errors and warnings
6. **Batch lint** *(if multiple files changed or new patterns introduced)* — `lint_files`; fix remaining issues
7. **Build** — `build_solution_start`; poll `build_solution_state` until done; fix errors
8. **Post-build quality** *(for non-trivial changes)* — `get_project_problems`; address Critical/Important
9. **Reformat** — `reformat_file` on each changed file

---

## Workflow

**Search routing:** use `rg` for portable text discovery; use Rider `search_text`/`search_file` when IDE index, generated/reflected UE code, unsaved editor state, or result compactness is likely to help. Use Rider semantic tools (`search_symbol`, `get_file_problems`, `lint_files`, build, `get_project_problems`) for code intelligence.

### Step 0 — Clarify (if ambiguous)

Skip if the request names a specific class, system, or file change.

Ask **one question at a time**, max two questions total:

- **"Is this for a multiplayer game?"** — affects `Replicated` properties, `GetLifetimeReplicatedProps`, authority guards
- **"Should this integrate with GAS?"** — affects `UAbilitySystemComponent`, `FGameplayTag` parameters, attribute access
- **"Is there an existing base class I should extend?"** — check with `search_symbol` before asking

### Step 1 — Pre-flight

Read project context before writing anything: `.uproject` file and `Source/<Module>/<Module>.Build.cs` using Codex file inspection tools.

Search for existing patterns using `search_symbol`. Browse the directory layout using `rg --files`, `find`, or Rider `list_directory_tree` when available.

Read 1–2 existing files of the same type to match conventions.

**Determine from pre-flight:** `EngineAssociation` (for `BuildSettingsVersion`), module name and `Build.cs` deps, and the project's naming/include/UPROPERTY patterns.

### Step 2 — Write Code

**Create new files** with `apply_patch`.

**Modify existing files** with `apply_patch`.

Follow conventions from pre-flight. See `reference/ue-cpp-conventions.md` for UE5 rules, naming prefixes, file placement, and module deps.

### Step 3 — Rider Diagnostics (per file)

After writing each file, run `get_file_problems` on it immediately.

**Act on every result:**
- **Error** → fix before proceeding; re-run `get_file_problems` to confirm clear
- **Warning** → fix unless it's a known intentional pattern (document why if skipping)
- **Hint / Info** → note for later; don't block on these

Iterate: edit → diagnose → edit until zero errors and zero warnings on all changed files.

### Step 4 — Batch Lint *(skip for isolated single-file fixes)*

If multiple files changed or new patterns were introduced, run `lint_files`.

Fix any issues surfaced here that `get_file_problems` missed (cross-file include violations, project-level style rules).

### Step 5 — Build

Compile via Rider using `build_solution_start` — do NOT shell-build or ask the user to rebuild manually.

Poll using `build_solution_state` until `state != "Running"`.

**On build failure:**
- Read the error output from `build_solution_state`
- Identify which file/line caused the error
- Fix with `apply_patch`, re-run `get_file_problems` on the fixed file, then rebuild
- **Do NOT proceed to Step 6 with build errors outstanding**

### Step 6 — Post-Build Quality Gate

After a successful build, run `get_project_problems`. Filter results to files you changed. For each issue:
- **Error** → fix immediately (build would have caught these; if new, something is wrong)
- **Warning on your files** → fix unless intentionally deferred

### Step 7 — Reformat

Use `reformat_file` on every file you created or modified.

---

see: reference/rider-mcp-tools.md — ALL Rider MCP tools: complete parameter reference, execute_tool mode table, UE editor/asset/debugger tools
see: reference/rider-tools.md — Code authoring workflow patterns: fix-loop, quality pass, common lookups
see: reference/ue-cpp-conventions.md — UE5 C++ rules, naming prefixes, file placement, module dependencies, BuildSettingsVersion, generated header errors
