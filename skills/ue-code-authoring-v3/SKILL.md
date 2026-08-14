---
name: ue-code-authoring-v3
description: "Use when writing or modifying Unreal Engine C++ in Codex: classes, actors, components, subsystems, interfaces, ability-system code, module deps, and reflected UPROPERTY/UFUNCTION API. Prefer source-level implementation first, then focused Rider MCP diagnostics when available. Do not use for Blueprint-only/editor automation tasks with no C++ authoring."
---

# UE Code Authoring

Implement Unreal Engine C++ changes in the project style. Keep the default workflow source-first and compact; use Rider MCP only for targeted code intelligence and diagnostics when those tools are available.

## First Steps

1. Verify the workspace is a UE project:
   ```bash
   find . -maxdepth 1 -name "*.uproject" | head -1
   ```
   If no `.uproject` exists, stop and say the task must run from the UE project root.
2. Confirm the request requires C++ source changes. If it is Blueprint-only or editor-only automation, stop.
3. Inspect only the files needed to implement the change:
   - `.uproject`
   - `Source/<Module>/<Module>.Build.cs`
   - 1-2 nearby `.h`/`.cpp` examples with the same pattern

Use `rg --files`, `rg`, and narrow `sed -n` windows for source inspection. Do not read broad directories or whole files when a symbol search or narrow range is enough.

## Pinned Public API

When the task lists "Required public API", treat exact names, signatures, member visibility, and
Blueprint metadata as part of the implementation, not style guidance:

- Copy required signatures exactly into the class `public:` section, including `const`, parameter names, and semicolons.
- Define required functions out-of-line in the `.cpp`, including simple query helpers such as `IsLastStandActive()` and `IsBelowThreshold(...)`.
- Put required reflected config fields in the requested visibility section with the requested metadata and default value.
- Keep required enum and member names exact; do not nest or rename them for local style.

For Last Stand-style Lyra GAS tasks, use this exact shape when requested by the prompt: public
`HealthThresholdPercent = 0.25f`, public `LastStandEffect`, Blueprint-readable `bIsLastStandActive`,
`ActiveLastStandEffectHandle`, `ObservedHealthComponent`, `BindToOwnerHealthComponent`,
`UnbindFromOwnerHealthComponent`, `ActivateLastStand`, and `DeactivateLastStand`. Implement
`IsBelowThreshold` with a `MaxHealth <= 0.0f` guard and `(Health / MaxHealth) < HealthThresholdPercent`.
`HandleHealthValue` must call `EvaluateTransition(Health, MaxHealth)` and dispatch to activate or
deactivate. Bind both health delegates with `AddDynamic`, remove both with `RemoveDynamic`, guard
effect stacking with `if (ActiveLastStandEffectHandle.IsValid()) { return; }`, apply through
`MakeEffectContext` and `ApplyGameplayEffectToSelf`, and remove only
`ActiveLastStandEffectHandle` before resetting it to `FActiveGameplayEffectHandle()`.

## Rider MCP Use

Use `tool_search` once to discover Rider tools when IDE help would materially reduce work. If no Rider MCP tools are available, continue with normal file tools and say IDE diagnostics were skipped.

When direct Rider tools are available, use these contracts:

| Need | Tool | Required args |
|---|---|---|
| Find class/method/field | `search_symbol` | `q` |
| IDE text search | `search_text` | live schema |
| Check one changed file | `get_file_problems` | `filePath` |
| Check several files | `lint_files` | `files` as a JSON array literal, e.g. `["Source/LyraGame/Foo.cpp"]` |
| Build through Rider | `build_solution_start` then `build_solution_state` | `sessionId` from start when returned |
| Reformat changed files | `reformat_file` | `files` as a JSON array literal |

If only `execute_tool` is exposed, read `reference/rider-mcp-tools.md` once for execute-tool mode before calling it. Live schemas are authoritative for parameter names.

## Implementation Path

For most eval-style codegen tasks:

1. Locate existing patterns and module deps.
2. Edit with `apply_patch`.
3. Run focused source checks that match the requested behavior.
4. Use Rider `get_file_problems` on changed files if MCP is available.
5. Stop with a concise summary and note any unavailable diagnostics.

Use the full quality path only when Rider MCP is available and the task or repository context makes it useful:

1. `get_file_problems` for each changed file; fix errors.
2. `lint_files` for multi-file or reflected API changes; fix errors and relevant warnings.
3. `build_solution_start`; poll `build_solution_state` until not `Running`; fix build errors.
4. `get_project_problems` only after a successful build, filtered to changed files.
5. `reformat_file` on changed files.

In containerized eval workspaces, do not hunt for Unreal engine scripts or shell-build with UBT when the toolchain is absent. The verifier will perform the authoritative build; spend the agent turn on correct source and focused checks.

## Rules

1. Preserve UE reflection requirements: generated header last, correct `UCLASS`/`UPROPERTY` metadata, exported public API where tests or designers inspect it.
2. For GAS/gameplay effects, track and remove only handles created by the new code; avoid leaking or removing effects owned by other systems.
3. Bind and unbind delegates symmetrically during component lifecycle.
4. Keep state-machine logic callable without a world or ability system when the prompt asks for isolated testability.
5. Do not run `git diff`, `git status`, or `git diff --check` unless a `.git` directory exists in or above the workspace.
6. Do not re-read, re-grep, build, or diff just to confirm a successful Rider diagnostic or build result. The tool result is the confirmation.

## References

- `reference/ue-cpp-conventions.md` — read when adding reflected API, modules, GAS, replication, or new UE types.
- `reference/rider-tools.md` — read when using the full Rider quality loop.
- `reference/rider-mcp-tools.md` — read only for execute-tool mode or less common Rider tools.
