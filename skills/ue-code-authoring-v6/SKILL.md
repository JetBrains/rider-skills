---
name: ue-code-authoring-v6
description: Use when writing or modifying Unreal Engine C++ in Codex, including classes, actors, components, subsystems, interfaces, ability-system code, module dependencies, reflected UPROPERTY/UFUNCTION API, and testable gameplay behavior. Prefer normal source edits, prompt-compliance source audits, and Rider diagnostics invoked through execute_tool. Do not use for Blueprint-only tasks or editor automation with no C++ authoring.
allowed-tools: execute_tool
metadata:
  author: JetBrains
---

# UE Code Authoring v6

Implement Unreal Engine C++ changes in the project style. Use normal Codex file inspection and edits for source changes, audit the changed source against the user's requested behavior, and invoke Rider only through `execute_tool(command="<tool> --flag value ...")` for IDE code intelligence, diagnostics, formatting, and builds.

## Gate

1. Verify the workspace is a UE project:

   ```bash
   find . -maxdepth 1 -name "*.uproject" | head -1
   ```

   If no `.uproject` exists, stop and say the task must run from the UE project root.
2. Confirm the request requires C++ source changes. If it is Blueprint-only or editor-only automation, stop.
3. Inspect only the files needed to implement the change: `.uproject`, relevant `Source/<Module>/<Module>.Build.cs`, and 1-2 nearby `.h`/`.cpp` examples.

Use `rg --files`, `rg`, and narrow `sed -n` windows for source inspection. Do not read broad directories or whole files when a symbol search or narrow range is enough.

## Invoke Rider

Call Rider tools directly through `execute_tool`. Do not call underlying `mcp__...` handles and do not use `tool_search` for routine tool lookup; the command table below is the Rider appender MCP contract. If `execute_tool` is unavailable, continue with source-level work and state that Rider diagnostics were skipped.

```
execute_tool(command="search_symbol --q ULyraHealthComponent")
execute_tool(command="get_file_problems --filePath Source/LyraGame/Character/LyraHealthComponent.cpp")
```

| Need | Command |
|---|---|
| Find a class, method, field, enum, or UE type | `search_symbol --q <name>` |
| IDE text search when generated/reflected code or compact results matter | `search_text --query <text>` |
| Check one changed file | `get_file_problems --filePath <path>` |
| Check several changed files | `lint_files --files '["Source/Module/Foo.h","Source/Module/Foo.cpp"]'` |
| Build through Rider | `build_solution_start`, then poll `build_solution_state` until state is not `Running` |
| Build specific changed files through Rider | `build_solution_start --filesToRebuild '["Source/Module/Foo.cpp"]'`, then poll `build_solution_state` |
| Reformat changed files | `reformat_file --files '["Source/Module/Foo.h","Source/Module/Foo.cpp"]'` |
| Read project-wide problems after a successful build | `get_project_problems` |

- Paths may be relative if the tool accepts them; when in doubt, pass the path exactly as used in the project tree.
- Quote values containing spaces. For JSON arguments, wrap the JSON in single quotes.
- List-valued Rider arguments must be JSON arrays, even for one file: `--files '["Source/Module/Foo.cpp"]'`, `--filesToRebuild '["Source/Module/Foo.cpp"]'`, `--paths '["Source/**"]'`.
- `get_file_problems` returns only errors by default. Use `--errorsOnly false` only when warnings or suggestions are relevant to the requested change.
- `lint_files` uses `--min_severity warning` by default; use `--min_severity error` when the task only needs an error gate.
- `Missing required parameters`, `Tool '<x>' not found`, or similar input errors are fixable; change the command and retry once with the corrected flag. Fall back only if `execute_tool` is missing or a real tool execution fails in a way input changes cannot fix.
- Trust successful Rider results. Do not re-read, re-grep, diff, or build only to confirm a successful diagnostic, lint, format, or build result.

## Implementation Path

For most Unreal C++ changes:

1. Locate existing patterns and module dependencies.
2. Edit with Codex file tools.
3. Audit the changed source against the explicit user request before build-only validation.
4. Run focused source checks that match the requested behavior.
5. Run `execute_tool(command="get_file_problems --filePath <changed-file>")` for each changed C++ file when `execute_tool` is available.
6. Stop with a concise summary and note any unavailable diagnostics.

Use the full Rider quality path only when a local IDE build is the requested or necessary validation step. If CI, a verifier, or another external build will be authoritative, stop after the source audit plus focused changed-file diagnostics unless changed-file errors remain.

1. `get_file_problems` for each changed file; fix all errors and relevant warnings.
2. `lint_files` for multi-file or reflected API changes; fix issues.
3. `build_solution_start`; poll `build_solution_state` until complete; fix build errors in changed files.
4. `get_project_problems` after a successful build, filtered to changed files.
5. `reformat_file --files '["<path1>","<path2>"]'` on changed files.

When the Unreal toolchain is absent or intentionally delegated to CI, do not hunt for engine scripts or shell-build with UBT. Spend the agent turn on correct source, focused checks, and clear reporting of unavailable diagnostics.

## Prompt Compliance Audit

Before Rider build-only validation or final response, read the explicit request back into a short acceptance checklist and compare it to the changed source. Rider diagnostics and successful builds prove C++ validity; they do not prove that reflected API, metadata, lifecycle behavior, or boundary rules match the request.

Check every requested item that applies:

- Exact public API: names, signatures, `const`, parameter names, enum values, visibility, and out-of-line definitions match the request. If a requested function name and parameter names are given, call that function with those same parameter names in implementation paths unless there is a clear reason not to.
- Reflected API: requested `UCLASS`, `USTRUCT`, `UENUM`, `UPROPERTY`, and `UFUNCTION` metadata is present on the declaration that callers or designers will use. Preserve standard UE metadata spelling and generated-header include order.
- Defaults: requested default values are visible where tests, designers, or default objects can inspect them.
- Blueprint/editor access: use `BlueprintReadOnly` for readable state/config unless mutation is requested; use `EditAnywhere` or the requested edit scope for designer-configurable values.
- Boundary behavior: encode strict comparisons, equality cases, zero/null guards, and "without world/owner/component" behavior explicitly when requested. Prefer an explicit guard branch over a compressed boolean when the request names the boundary.
- Lifecycle symmetry: every registration, delegate bind, timer, callback, spawned object, or gameplay effect has matching cleanup in teardown paths named by the lifecycle.
- Ownership: track and remove only resources created by this code; guard idempotent apply/start paths against duplicates or stacking before creating the resource.
- Module and include impact: added headers are backed by the narrowest required module dependencies.

If an item is uncertain, inspect the relevant changed declaration or narrow source range before building. Do not rely on build success to infer prompt compliance. Do not run `git diff`, `git status`, or `git diff --check` unless a `.git` directory exists in or above the workspace.

## UE Rules

1. Preserve reflection requirements: generated header last, correct `UCLASS`/`UPROPERTY` metadata, `GENERATED_BODY()`, and exported public API where tests or designers inspect it.
2. Prefer `TObjectPtr` for reflected UObject references in UE5. Never `new` or `delete` UObjects.
3. Add only the module dependencies required by included headers.
4. For GAS/gameplay effects, track and remove only handles created by the new code; avoid leaking or removing effects owned by other systems.
5. Bind and unbind delegates symmetrically during component lifecycle.
6. Keep state-machine logic callable without a world or ability system when the prompt asks for isolated testability.

## References

- `reference/ue-cpp-conventions.md` — read when adding reflected API, modules, GAS, replication, or new UE types.
- `reference/rider-tools.md` — read when using the full Rider quality loop.
- `reference/rider-mcp-tools.md` — read for less common Rider tools or execute_tool troubleshooting.
