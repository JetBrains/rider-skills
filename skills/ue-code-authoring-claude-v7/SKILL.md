---
name: ue-code-authoring-claude-v7
description: Use when writing or modifying Unreal Engine C++ — classes, actors, components, subsystems, interfaces, ability-system (GAS) code, module dependencies, reflected UPROPERTY/UFUNCTION API, native gameplay tags, and testable gameplay behavior — in a project open in JetBrains Rider. Source changes go through Read/Grep/Glob/Edit/Write; Rider supplies symbol search, code analysis, formatting, and builds through its MCP execute_tool. Do not use for Blueprint-only tasks or editor automation with no C++ authoring.
metadata:
  author: JetBrains
---

# UE Code Authoring

Implement Unreal Engine C++ changes in the project's own style. Write the code with your own file tools, audit the result against what the user actually asked for, and use Rider only for what an IDE knows and grep does not: resolved symbols, reflection/UHT diagnostics, solution code style, and builds.

Rider is reached through a single MCP tool — `execute_tool(command="<tool> --flag value ...")`.

## Gate

1. Confirm the workspace is a UE project: `Glob` for `*.uproject` at the root. If there is none, stop and say the task must run from the UE project root.
2. Confirm the request needs C++ source changes. Blueprint-only or editor-only automation → stop.
3. Read only what the change needs: the `.uproject`, the relevant `Source/<Module>/<Module>.Build.cs`, and one or two nearby `.h`/`.cpp` files that already do the same kind of thing.

## MCP-first implementation

Use Rider to discover the project pattern before writing the implementation. Search for the relevant
class, API, delegate, gameplay effect, or ability with `search_symbol`; use `search_text` to find one
working use in the project. Read only the returned declaration and a nearby implementation.

After editing, use Rider to validate the changed source:

1. Search the changed code for every public API, reflected declaration, named asset, gameplay action,
   lifecycle callback, and state transition required by the request.
2. Run `get_file_problems` on one or two changed files, or `lint_files` for a wider change.
3. Fix request-relevant diagnostics before building. A build is evidence that the code compiles; it
   does not replace checking that the requested behavior is present.

For gameplay costs, effects, cooldowns, delegates, and lifecycle cleanup, follow the closest
project-owned example discovered through Rider rather than inventing a parallel pattern.

### Gameplay-operation checklist

For a gameplay ability, trace the full operation through the project APIs: guard activation, mutate
the owned state, start the requested gameplay action, then clean up the temporary state. A cost is
not complete until the ability applies the matching negative attribute modifier. A cooldown is not
complete until the same ability both blocks re-entry and clears its own temporary tag or effect.

For a designer-facing component, derive from the project component base used by nearby gameplay
components. Keep requested `UCLASS`/`UPROPERTY` metadata, defaults, and public configuration on the
component declaration. Track only the effect created by this component and use the tracked handle to
make repeated transitions idempotent.

## Tool split

| Job | Use |
|---|---|
| Find files by name or glob | `Glob` |
| Find text on disk (identifiers, macros, tag strings) | `Grep` |
| Read a file, or a range of it | `Read` (with `offset`/`limit`) |
| Create or change source | `Write` / `Edit` |
| Resolve a symbol the IDE index knows (engine headers, generated/reflected code, external modules) | Rider `search_symbol` |
| Code analysis, solution formatting, build | Rider `get_file_problems`, `lint_files`, `reformat_file`, `build_solution_*` |
| Refactor existing code (rename, move, change signature, safe delete, extract) | Rider refactoring tools |

Do not shell out through `Bash` for `rg`, `find`, `sed`, `cat`, `head`, or `tail` — the dedicated tools are cheaper and give clickable results. Keep `Bash` for git and for toolchain commands the task genuinely requires.

Use `TodoWrite` only when the change spans three or more files or has ordered dependencies; a single-file edit does not need a checklist. For wide pattern discovery in a large UE codebase ("how does this project register native gameplay tags", "where are attribute sets defined"), one `Explore` subagent is worth it — but keep the edits, the compliance audit, and the diagnostics in the main thread where you can see the source.

## Invoke Rider

```
execute_tool(command="search_symbol --q UMyGameplayComponent")
execute_tool(command="get_file_problems --filePath Source/MyModule/MyGameplayComponent.cpp")
```

In Claude Code the tool name is namespaced by the MCP server key from the environment's config — `mcp__<key>__execute_tool`. The key is not knowable in advance: `rider` in a local IDE, `ide-headless-mcp` in a headless eval container, `jetbrains` or `ide` elsewhere, and it may contain hyphens. The same skill run therefore sees a different name in each environment. Never type a prefix from memory. Resolve it once, by bare name:

```
ToolSearch(query="+execute_tool", max_results=5)
```

`+<bare_name>` requires that substring in the tool name and ignores the prefix, so one call returns the exact namespaced name *and* its schema. Call that name back verbatim and reuse the same prefix for the rest of the session. If several servers match, take the one whose description names the IDE. The same search resolves any other tool in this skill — `+lint_files`, `+get_file_problems` — which matters because some configurations expose the individual Rider tools directly alongside the router; a direct typed call beats hand-serializing flags into `execute_tool`. If nothing matches at all, there is no Rider: keep doing source-level work and state plainly that Rider diagnostics were skipped.

| Need | Command |
|---|---|
| Find a class, method, field, enum, or UE type | `search_symbol --q <name>` |
| IDE text search when generated/reflected code or compact results matter | `search_text --q <text>` |
| Check one changed file | `get_file_problems --filePath <path>` |
| Check several changed files | `lint_files --files '["Source/Module/Foo.h","Source/Module/Foo.cpp"]'` |
| Rename, move, or re-sign an existing symbol | `rename_refactoring`, `move_type_to_namespace`, `change_api_signature` — `--preview true` first for public API |
| Reformat changed files | `reformat_file --files '["Source/Module/Foo.h","Source/Module/Foo.cpp"]'` |
| Build through Rider | `build_solution_start`, then poll `build_solution_state` until `state` is not `Running` |
| Build only the changed files | `build_solution_start --filesToRebuild '["Source/Module/Foo.cpp"]'`, then poll |
| Project-wide problems after a successful build | `get_project_problems` |

Command syntax:

- Every `--flag` takes a value — bare flags are not supported. Booleans need an explicit `true`/`false`.
- List parameters are JSON arrays, even for one element, wrapped in single quotes: `--files '["Source/Module/Foo.cpp"]'`.
- Paths are relative to the solution root, with forward slashes.
- `search_text`, `search_regex`, `search_file`, and `search_symbol` all take `--q` — not `--query`.
- `get_file_problems` returns errors only by default; add `--errorsOnly false` when warnings or style suggestions matter to the change.
- `lint_files` defaults to `--min_severity warning` (includes suggestions and hints); `--min_severity error` is the strict gate.
- `Missing required parameters: …` and `Tool '<x>' not found` are input mistakes, not tool failures — correct the flag or the name and retry once. Fall back to source-only work only if `execute_tool` is absent or a call actually ran and failed in a way no input change fixes.
- Rider's semantic edit tools are for refactoring code that already exists. Freeform new implementation goes through `Edit`/`Write`, then Rider diagnostics.
- Trust a successful Rider result. Do not re-read the file, re-`Grep`, `git diff`, or build just to confirm a clean diagnostic, lint, format, or build.

Independent `execute_tool` calls belong in one message — issue `get_file_problems` for two changed files, or a `search_symbol` plus a `search_text`, as parallel calls rather than one round trip each.

## Implementation path

1. Locate the existing pattern and the module dependencies it relies on.
   - When wiring callbacks, delegates, events, virtual overrides, or message/listener APIs, read the exact declaration of the member you are using **and** one real bind/broadcast/remove site for that same member type. Do not copy a nearby binding style unless it is the same declared type.
2. Refactor with the Rider tool when the edit is exactly a supported refactor; otherwise `Edit`/`Write` the source.
3. Audit the changed source against the explicit request (next section) *before* reaching for a build.
4. Run the changed-file diagnostics:
   - one or two files → `get_file_problems` per file, in parallel;
   - three or more, or any reflected-API change → a single `lint_files` call.
5. Fix every error and every warning that bears on the request, then stop with a short summary that names any diagnostics you could not run.

After `Edit`/`Write` there is nothing to save: Rider refreshes each file from disk before it analyzes, formats, or refactors it. Two consequences worth remembering — `reformat_file` rewrites files on disk, so run it last and `Read` a file again before editing it further; and if this project installs Rider's PostToolUse quality-check hook, the hook output you already got after an edit *is* the analysis (it blocks on errors, reports warnings, and skips reformatting for C/C++ while still inspecting it) — fix what it reports instead of re-running the same check.

Use the full quality path only when a local IDE build is the requested or necessary validation. If CI or an external verifier is authoritative, stop after the source audit plus changed-file diagnostics.

1. `get_file_problems` / `lint_files` on changed files → fix errors and relevant warnings.
2. Start a build only once changed-file diagnostics are clean. Do not start or keep polling a build while errors remain in changed files. Do not write off include, reflection, or generated-code diagnostics as indexing noise unless a re-run after `reformat_file` is clean, or a build has already compiled that same file successfully.
3. `build_solution_start`; poll `build_solution_state` only with its returned `sessionId`. Make at most three polls. If it is still `Running` after the third poll, report that the build did not finish; do not restart it, rebuild, or continue polling.
4. `get_project_problems` after a successful build, filtered to changed files.
5. `reformat_file` on the changed files.

When the Unreal toolchain is absent or the build is intentionally left to CI, do not go hunting for engine scripts or hand-run UBT. Spend the turn on correct source, focused checks, and an honest report of what could not be verified.

### Build stop rule

The terminal `build_solution_state` result is the build evidence. If any poll reports errors only in
unrelated files, report that blocker and stop the build loop immediately. If it fails because of an
unrelated project or environment error, report that blocker and stop the build loop. Do not use
`Bash` to inspect `Intermediate`, `Binaries`, generated/UHT files, object files, or unrelated
source in an attempt to prove the changed file compiled; those checks cannot turn a failed build
into valid evidence. Poll Rider directly (no `sleep` commands) and only investigate diagnostics
that name a changed file.

## Prompt compliance audit

Before any build-only validation and before your final message, turn the explicit request into a short acceptance checklist and compare it to the changed source. Clean diagnostics and a green build prove the C++ is valid; they prove nothing about whether the reflected API, metadata, lifecycle behavior, or boundary rules match what was asked.

Check every item that applies:

- **Exact public API** — names, signatures, `const`, parameter names, enum values, visibility, and out-of-line definitions match the request. If the request names a function and its parameters, call it with those names in implementation paths unless there is a clear reason not to.
- **Requested surface** — when the prompt says "public API", or tests inspect it, or designers read defaults/state, the named declarations go in the C++ `public:` section. Do not demote them to `protected:`/`private:` or hide them behind a differently named backing field.
- **Reflected API** — requested `UCLASS`, `USTRUCT`, `UENUM`, `UPROPERTY`, `UFUNCTION` metadata sits on the declaration callers and designers will actually use. Keep standard UE metadata spelling and generated-header include order. If designers must read a state or value from Blueprint, expose that state itself as `BlueprintReadOnly` — not only a C++ getter.
- **Defaults** — requested default values are visible where tests, designers, or the CDO can see them. Prefer an in-class initializer for simple reflected defaults, and re-check that the declaration still lives in the requested access section.
- **Blueprint/editor access** — `BlueprintReadOnly` for readable state/config unless mutation was requested; `EditAnywhere` (or the requested scope) for designer-configurable values; `BlueprintAssignable` for Blueprint-bindable events.
- **Boundary behavior** — strict comparisons, equality cases, zero/null guards, and "with no world/owner/component" behavior are written out explicitly when the request names them. An explicit guard branch beats a compressed boolean here.
- **Callback contracts** — for every delegate/event/listener bind, verify the delegate macro or type, the supported bind/remove methods, the handler signature, and the broadcast parameter order *from source* before writing the handler. `AddDynamic` only for dynamic multicast delegates with `UFUNCTION` handlers; `AddUObject` only for native multicast delegates that support it; cleanup matched to the exact bind method or the handle it returned.
- **Lifecycle symmetry** — every registration, delegate bind, timer, callback, spawned object, and gameplay effect has matching cleanup in the teardown path named by the lifecycle.
- **Ownership** — track and remove only what this code created; guard idempotent apply/start paths against duplicates or stacking before creating the resource.
- **Module and include impact** — new headers are backed by the narrowest module dependencies that satisfy them.

If an item is uncertain, `Read` the relevant declaration or a narrow range around it. Do not infer prompt compliance from build success. Do not run `git diff`/`git status` unless a `.git` directory exists in or above the workspace.

## UE rules

1. Preserve reflection requirements: generated header last, correct `UCLASS`/`UPROPERTY` metadata, `GENERATED_BODY()`, and a `<MODULE>_API` export where other modules, tests, or designers reach the type.
2. Prefer `TObjectPtr` for reflected UObject references in UE5. Never `new` or `delete` a UObject.
3. Add only the module dependencies the included headers actually require.
4. For gameplay effects, track and remove only the handles this code created; never leak or strip effects owned by another system.
5. Bind and unbind delegates symmetrically across the component lifecycle.
6. Keep state-machine logic callable without a world or an ability system when the request asks for isolated testability.
7. For a new native gameplay tag, find the project's shared tag registry and declare and define the tag there. Consume the shared symbol from gameplay code; do not create a local tag declaration beside one ability or component.
8. When a gameplay type must be extended, configured, or instantiated by designers, declare the requested `UCLASS` Blueprint metadata explicitly on that type rather than relying on inherited defaults.

## GAS rules

When adding Gameplay Ability System code, read the nearest existing attribute set, gameplay ability, native tag registration, and cost/cooldown pattern first, and match the project's exact macros and lifecycle hooks.

- **Attribute sets** — expose requested attributes with the project's accessor macros and Blueprint-readable getters/events. Clamp both in the value-change path and when the maximum changes, so callers never observe an out-of-range value.
- **Gameplay abilities** — implement activation failure, cost, cooldown, montage playback, and tag grants through the project's existing ability APIs. A named cost or cooldown must be encoded in ability logic, not only mentioned in a comment or a default.
- **Gameplay tags** — register new native tags in the same source location and style as their neighbors, using the exact requested tag string.
- **Effects and handles** — track handles created here, prevent duplicate application on repeated activation or transition, and remove only those handles on teardown/deactivation.

## References

- [reference/ue-cpp-conventions.md](reference/ue-cpp-conventions.md) — read when adding reflected API, modules, GAS, replication, or new UE types.
- [reference/rider-tools.md](reference/rider-tools.md) — read for the fix-loop and full quality-pass patterns.
- [reference/rider-mcp-tools.md](reference/rider-mcp-tools.md) — read for a less common Rider tool or an `execute_tool` argument you are unsure of.
