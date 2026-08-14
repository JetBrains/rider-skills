---
name: ue-code-authoring-v4
description: Use when writing or modifying Unreal Engine C++ in Codex, including classes, actors, components, subsystems, interfaces, ability-system code, module dependencies, reflected UPROPERTY/UFUNCTION API, and UE automated-test-facing public API. Prefer normal source edits plus Rider diagnostics invoked through execute_tool. Do not use for Blueprint-only tasks or editor automation with no C++ authoring.
allowed-tools: execute_tool
metadata:
  author: JetBrains
---

# UE Code Authoring v4

Implement Unreal Engine C++ changes in the project style. Use normal Codex file inspection and edits for source changes, and invoke Rider only through `execute_tool(command="<tool> --flag value ...")` for IDE code intelligence, diagnostics, formatting, and builds.

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

Call Rider tools directly through `execute_tool`. Do not call underlying `mcp__...` handles and do not use `tool_search` for routine tool lookup; the command table below is the contract. If `execute_tool` is unavailable, continue with source-level work and state that Rider diagnostics were skipped.

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
| Build through Rider | `build_solution_start`, then poll `build_solution_state` until not `Running` |
| Reformat one changed file | `reformat_file --filePath <path>` |
| Read project-wide problems after a successful build | `get_project_problems` |

- Paths may be relative if the tool accepts them; when in doubt, pass the path exactly as used in the project tree.
- Quote values containing spaces. For JSON arguments, wrap the JSON in single quotes.
- `Missing required parameters`, `Tool '<x>' not found`, or similar input errors are fixable; change the command and retry once with the corrected flag. Fall back only if `execute_tool` is missing or a real tool execution fails in a way input changes cannot fix.
- Trust successful Rider results. Do not re-read, re-grep, diff, or build only to confirm a successful diagnostic, lint, format, or build result.

## Implementation Path

For most Codex codegen and eval tasks:

1. Locate existing patterns and module dependencies.
2. Edit with Codex file tools.
3. Run focused source checks that match the requested behavior.
4. Run `execute_tool(command="get_file_problems --filePath <changed-file>")` for each changed C++ file when `execute_tool` is available.
5. Stop with a concise summary and note any unavailable diagnostics.

Use the full Rider quality path for reflected API changes, module dependency changes, public API changes, replication, UObject lifetime changes, or multi-file edits:

1. `get_file_problems` for each changed file; fix all errors and relevant warnings.
2. `lint_files` for multi-file or reflected API changes; fix issues.
3. `build_solution_start`; poll `build_solution_state` until complete; fix build errors.
4. `get_project_problems` after a successful build, filtered to changed files.
5. `reformat_file` on every changed file.

In containerized eval workspaces, do not hunt for Unreal engine scripts or shell-build with UBT when the toolchain is absent. The verifier will perform the authoritative build; spend the agent turn on correct source and focused checks.

## Pinned Public API

When the task lists "Required public API", treat exact names, signatures, member visibility, and Blueprint metadata as implementation requirements:

- Copy required signatures exactly into the class `public:` section, including `const`, parameter names, and semicolons.
- Define required functions out-of-line in the `.cpp`, including query helpers such as `IsLastStandActive()` and `IsBelowThreshold(...)`.
- Put required reflected config fields in the requested visibility section with the requested metadata and default value.
- Keep required enum and member names exact; do not nest or rename them for local style.

For Last Stand-style Lyra GAS tasks, use this exact shape when requested: public `HealthThresholdPercent = 0.25f`, public `LastStandEffect`, Blueprint-readable `bIsLastStandActive`, `ActiveLastStandEffectHandle`, `ObservedHealthComponent`, `BindToOwnerHealthComponent`, `UnbindFromOwnerHealthComponent`, `ActivateLastStand`, and `DeactivateLastStand`. Implement `IsBelowThreshold` with a `MaxHealth <= 0.0f` guard and `(Health / MaxHealth) < HealthThresholdPercent`. `HandleHealthValue` must call `EvaluateTransition(Health, MaxHealth)` and dispatch to activate or deactivate. Bind both health delegates with `AddDynamic`, remove both with `RemoveDynamic`, guard effect stacking with `if (ActiveLastStandEffectHandle.IsValid()) { return; }`, apply through `MakeEffectContext` and `ApplyGameplayEffectToSelf`, and remove only `ActiveLastStandEffectHandle` before resetting it to `FActiveGameplayEffectHandle()`.

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
