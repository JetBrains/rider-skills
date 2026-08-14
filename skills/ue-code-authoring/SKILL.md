---
name: ue-code-authoring
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

## What "done" means

A change is done when two independent things hold, and they fail for different reasons:

1. **Declared shape** — the source carries the requested declarations, metadata, and guards.
2. **Observed behaviour** — the feature does the requested thing when something drives it.

A green C++ build and Blueprint compile prove neither. Most of the risk sits in (2), because gameplay
code is exercised not only by the running game but by callers that construct objects programmatically
with none of the game's setup around them — see **Programmatic-use invariants** below. Shape is cheap
to check and cheap to fix; behaviour under minimal construction is where working-looking code breaks.

If the task exposes existing test sources for the surface you are changing, read them the way you'd
read any other caller: they show the shapes and entry points that must keep working.

### Requested-surface audit

Before the first build, turn the requested surface into a short literal checklist and point at the
exact declaration or branch that satisfies each item. Do not substitute an equivalent-looking
abstraction for a named mechanism. In particular:

- put every requested virtual override and public API declaration in the header, in the requested
  access section, with the requested metadata on that same declaration;
- keep requested enum visibility, underlying type, and enumerator names exact;
- expose requested Blueprint-readable runtime **state** as a reflected `BlueprintReadOnly` property,
  not only through a getter;
- make each requested state transition explicit in the `.cpp`, including the inactive/no-op path;
- put the duplicate/valid-handle early return immediately before resource or effect creation;
- write direct null guards at every boundary where a requested dependency is read, rather than burying
  them in a helper.

Only after this audit may a build be treated as validation evidence.

### Programmatic-use invariants

Gameplay code gets driven from contexts far barer than a running match: automated tests, editor
commandlets, and tools routinely build the **minimum** they need — a bare world, a plain actor, a
component made with `NewObject` — and nothing else. No avatar or skeletal mesh, no player controller,
no network authority, no loaded content, no initialised gameplay framework. Code that works in the
running game routinely fails there, and it fails hard: a failed checked cast takes down the whole
process rather than returning an error.

Write for that environment — it is also what makes the feature testable at all:

1. **Concrete types.** Anything a caller constructs directly must be instantiable. Never mark a requested
   type abstract unless the request makes it a base class.
2. **Apply a resource cost as a direct additive modification to the attribute** on the ability system
   component — an explicit negative delta, applied exactly once. Do **not** implement the cost by
   assigning a cost-effect class. An effect-based cost runs the full effect-execution pipeline, which
   invokes the attribute set's post-effect hooks; those hooks commonly resolve the owning actor or
   avatar. When that setup is absent the resulting checked cast is fatal to the process.
3. **A cooldown must outlive the ability instance.** It has to stay observable on the ability system
   component after the activating instance ends, and expire on world time (a timer or a duration).
   Do **not** remove it in the ability's end/cleanup path — this is a deliberate exception to
   lifecycle symmetry, because the ability often ends in the same call that started it (see 4).
4. **Commit cost and cooldown before any animation, montage, or latent task.** Without an avatar mesh
   such a task cannot play; it may cancel or complete immediately and end the ability inside the
   activation call. Anything you apply after it may never be applied at all.
5. **Never resolve a content asset in a constructor.** A CDO constructor runs before content is
   loadable, so a hard lookup there logs an error and yields nothing. Declare the asset as a reflected
   property carrying the requested default path and resolve it at activation.
6. **Do not gate observable effects behind an authority or network check** — a bare context has no
   authority.
7. **Keep requested state logic callable without a world or an ability system** when the request asks
   for isolated testability.

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
| Build through Rider | `build_solution_start`, then poll `build_solution_state` on a ~60s cadence until `state` is not `Running` |
| Build only the changed files | `build_solution_start --filesToRebuild '["Source/Module/Foo.cpp"]'`, then poll |
| Project-wide problems after a successful build | `get_project_problems` |
| Read a file the shell cannot reach (engine, SDK, external module) | `read_file --file_path <path> --offset <line> --limit <n>` |

Command syntax:

- Every `--flag` takes a value — bare flags are not supported. Booleans need an explicit `true`/`false`.
- List parameters are JSON arrays, even for one element, wrapped in single quotes: `--files '["Source/Module/Foo.cpp"]'`.
- Paths are relative to the solution root, with forward slashes; `../` reaches outside it, which is how you read engine sources.
- `search_text`, `search_regex`, `search_file`, and `search_symbol` all take `--q` — not `--query`.
- **Flag casing is per-tool.** Path flags are camelCase (`--filePath`) *except* `read_file`, which takes snake_case `--file_path`. Do not carry a flag name over from a neighbouring tool; that mistake costs a full round trip.
- **Bound every `read_file` on a large or unfamiliar file.** The default window is 2000 lines (max 5000), which for a big engine header exceeds the per-result token budget and returns `Error: result (… characters …) exceeds maximum allowed tokens` — the call is spent for nothing. Locate the symbol first, then read a narrow window around it (`--offset <hit line> --limit 60`).
- Never read the agent's own session or transcript files to recover a result that was too large. Re-read the source with a tighter `--offset`/`--limit`.
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

Use the full quality path only when a local IDE build is the requested or necessary validation. If the build is owned elsewhere, stop after the source audit plus changed-file diagnostics.

1. `get_file_problems` / `lint_files` on changed files → fix errors and relevant warnings.
2. Start a build only once changed-file diagnostics are clean of *real* errors. Do not start or keep polling a build while real errors remain in changed files. On UE sources the C++ resolver reports macro-expansion false positives at `ERROR` severity (attribute-accessor macros, `check(...)` / `PLATFORM_BREAK`, generated-header symbols). Separate them with **one** comparison: run the same check on a single untouched neighbour file of the same kind. Identical diagnostic there → resolver noise for the whole project; note the signature once and ignore it for the rest of the session. Do not confirm it against a third and fourth file, and never edit working code to silence it. Anything that does *not* reproduce on an untouched file is yours to fix.
3. `build_solution_start`; poll `build_solution_state` on a ~60s cadence (see *Build stop rule*); fix build errors in changed files.
4. `get_project_problems` after a successful build, filtered to changed files.
5. `reformat_file` on the changed files.

When the Unreal toolchain is absent or the build is intentionally left to CI, do not go hunting for engine scripts or hand-run UBT. Spend the turn on correct source, focused checks, and an honest report of what could not be verified.

### Build stop rule

The terminal `build_solution_state` result is the build evidence. If it fails because of an
unrelated project or environment error, report that blocker and stop the build loop. Do not use
`Bash` to inspect `Intermediate`, `Binaries`, generated/UHT files, object files, or unrelated
source in an attempt to prove the changed file compiled; those checks cannot turn a failed build
into valid evidence. Only investigate diagnostics that name a changed file.

**Poll a build on a slow cadence, not in a tight loop.** A UE module build takes **minutes**.
`build_solution_state` is safe to call repeatedly and accumulates `problems` while `state` is
`Running`, but every poll is a full turn that re-sends the whole conversation — so a tight poll loop
costs far more context than the same build watched a handful of times. Budget roughly:

1. Poll once right after `build_solution_start` to confirm it took.
2. While `state` is `Running`, wait ~60s between polls — a single `Bash` `sleep 60` is the correct
   tool for that wait, and is cheaper than a burst of empty polls.
3. Expect **under ~10 polls for a normal build**. If you pass ~20 on a single build, stop *watching
   that build* — but see the next rule: stopping the poll loop is never the same as stopping work.

The `sessionId` is optional — an argument-free call reads the most recent build. Stop as soon as
`state` is no longer `Running`. Ignore `-Werror` problems in files you did not change; a
`buildIsSuccess: false` caused only by pre-existing unrelated problems is a blocker to report, not to
fix. Start a new build only after you have actually changed source since the last one.

**Build until it compiles.** A compile error in a file you touched is never an acceptable end state.
When the build reports an error in your changed source: fix it, rebuild, and poll again — as many
cycles as it takes. Several build-fix cycles is the normal shape of this work, not a sign something
has gone wrong; the poll-cadence rule above exists to make each cycle cheap, never to cut the number
of cycles short. Do not summarize, hand back, or claim the change is complete while any changed file
still fails to compile. The only acceptable stop with a red build is one whose errors are all in files
you did not touch — say so explicitly and name them.

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
- **Lifecycle symmetry** — every registration, delegate bind, timer, callback, spawned object, and gameplay effect has matching cleanup in the teardown path named by the lifecycle. **Exception:** state whose whole purpose is to persist past the current activation — a cooldown above all — expires on its own timer or duration and must not be torn down when the ability ends (*Programmatic-use invariants* 3).
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
- **Instantiability and costs** — a gameplay ability created for a task must be instantiable; do not mark it abstract unless the request explicitly makes it a base class. Apply a resource cost **exactly once, as a direct additive negative modification to the resource attribute on the ability system component** — not by assigning a cost-effect class, and not by computing and overwriting a new balance (see *Programmatic-use invariants* 2 for why the effect route breaks under bare construction). Check affordability in the activation-gate path and report the standard cost-failure tag. Do not gate a locally predicted spend behind an authority-only check. A balance exactly equal to the requested cost must activate and reach zero; a failed activation must neither spend the resource nor add a cooldown.
- **Gameplay tags** — register new native tags in the same source location and style as their neighbors, using the exact requested tag string.
- **Effects and handles** — track handles created here, prevent duplicate application on repeated activation or transition, and remove only those handles on teardown/deactivation.

## References

- [reference/ue-cpp-conventions.md](reference/ue-cpp-conventions.md) — read when adding reflected API, modules, GAS, replication, or new UE types.
- [reference/rider-tools.md](reference/rider-tools.md) — read for the fix-loop and full quality-pass patterns.
- [reference/rider-mcp-tools.md](reference/rider-mcp-tools.md) — read for a less common Rider tool or an `execute_tool` argument you are unsure of.
