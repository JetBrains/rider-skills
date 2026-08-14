---
name: ue-test-authoring
description: Use when writing or modifying Unreal Engine automated tests — Automation (IMPLEMENT_SIMPLE_AUTOMATION_TEST, DEFINE_SPEC), CQTest, Functional, Gauntlet, LowLevel/Catch2 — along with test modules and the Build.cs dependencies they need, in a project open in JetBrains Rider. Test source goes through Read/Grep/Glob/Edit/Write; Rider supplies symbol lookup for the API under test, registration and include diagnostics, formatting, and builds through its MCP tools. Do not use for Blueprint-only testing, or for diagnosing an existing test failure that needs no test code change.
metadata:
  author: JetBrains
---

# UE Test Authoring

Write Unreal Engine automated tests in the project's own style. Author the test with your own file tools, audit it against the behavior the user actually asked to be covered, and use Rider for what an IDE knows and grep does not: the resolved API under test, registration and include diagnostics, solution code style, and builds.

## Gate

1. Confirm the workspace is a UE project: `Glob` for `*.uproject` at the root. If there is none, stop and say the task must run from the UE project root.
2. Confirm the request needs test code written or changed. A runtime bug, a plain build request, or a non-test source change → clarify scope first.
3. Read only what the test needs: the `.uproject`, the test module's `Build.cs`, one nearby test that already uses the same framework, and the declaration of the API under test.

## Tool split

| Job | Use |
|---|---|
| Find test files or modules by name or glob | `Glob` |
| Find text on disk (test macros, helper names, tag strings) | `Grep` |
| Read a file, or a range of it | `Read` (with `offset`/`limit`) |
| Create or change test source | `Write` / `Edit` |
| Resolve the API under test when the IDE index knows it (engine headers, generated/reflected code, other modules) | Rider `search_symbol` |
| Confirm a contract at a known position (nullable return, editor-only, preconditions) | Rider `get_symbol_info` |
| Registration, include, and reflection diagnostics; formatting; build | Rider `get_file_problems`, `lint_files`, `reformat_file`, `build_solution_*` |

Do not shell out through `Bash` for `rg`, `find`, `sed`, `cat`, `head`, or `tail` — the dedicated tools are cheaper and give clickable results. Keep `Bash` for git and for toolchain commands the task genuinely requires.

Use `TodoWrite` only when the work spans three or more files or has ordered dependencies; a single new test file does not need a checklist. For wide discovery in an unfamiliar test suite ("which framework does this project use", "where do PIE network tests live"), one `Explore` subagent is worth it — but keep the test authoring, the coverage audit, and the diagnostics in the main thread where you can see the source.

## Reach Rider

Rider is reached through a router tool — `execute_tool(command="<tool> --flag value ...")` — and, on configurations that expose them, through the individual tools directly.

In Claude Code the tool name is namespaced by the MCP server key from the environment's config: `mcp__<key>__execute_tool`. The key is not knowable in advance — `rider` in a local IDE, `ide-headless-mcp` in a headless eval container, `jetbrains` or `ide` elsewhere, and it may contain hyphens. Never type a prefix from memory. Resolve it once, by bare name:

```
ToolSearch(query="+execute_tool", max_results=5)
```

`+<bare_name>` requires that substring in the tool name and ignores the prefix, so one call returns the exact namespaced name *and* its schema. Call that name back verbatim and reuse the prefix for the rest of the session. If several servers match, take the one whose description names the IDE. The same search resolves anything else in this skill — `+lint_files`, `+get_file_problems`, `+search_symbol` — and where the individual tools are exposed, a direct typed call beats hand-serializing flags into the router. If nothing matches at all, there is no Rider: keep writing correct test source and state plainly that Rider diagnostics were skipped.

Every Rider tool also takes `rootFolder`. Pass the solution root whenever it is not the current working directory — otherwise the call fails with `doesn't correspond to any open project` and lists the projects that are actually open. Take the path from that list and reuse it.

| Need | Command |
|---|---|
| Find existing tests for a framework or feature | `search_text --q IMPLEMENT_SIMPLE_AUTOMATION_TEST` (or `TEST_CLASS`, `DEFINE_SPEC`) |
| Find test files | `search_file --q '*Tests*.cpp'` |
| Find the API under test | `search_symbol --q <name>` |
| Confirm a contract after reading the file | `get_symbol_info --filePath <path> --line <n> --column <n>` |
| Trace what the method under test calls or needs | `analyze_calls --symbolFqn <FullyQualifiedCallable> --analysisKind OUTGOING_CALLS` |
| Check one changed test file | `get_file_problems --filePath <path>` |
| Check several changed files | `lint_files --files '["Source/FooTests/Private/FooTests.cpp"]'` |
| Build through Rider, for broad changes only | `build_solution_start`, then poll `build_solution_state` until `state` is not `Running` |
| Project-wide problems after a successful build | `get_project_problems` |
| Reformat changed files | `reformat_file --files '["Source/FooTests/Private/FooTests.cpp"]'` |

Command syntax:

- Every `--flag` takes a value — bare flags are not supported. Booleans need an explicit `true`/`false`.
- List parameters are JSON arrays, even for one element, wrapped in single quotes: `--files '["Source/FooTests/Private/FooTests.cpp"]'`.
- Paths are relative to the solution root, with forward slashes.
- `search_text`, `search_regex`, `search_file`, and `search_symbol` all take `--q` — not `--query`. `search_symbol` finds project symbols only; add `--include_external true` for an engine or SDK symbol, which is common when the API under test is engine-side.
- `analyze_calls` is name-based: `--symbolFqn` plus `--analysisKind`, never a path/line/column. `get_symbol_info` is the position-based one.
- `get_file_problems` returns errors only by default; add `--errorsOnly false` when warnings or style suggestions matter.
- `lint_files` defaults to `--min_severity warning` (includes suggestions and hints); `--min_severity error` is the strict gate.
- `Missing required parameters: …` and `Tool '<x>' not found` are input mistakes, not tool failures — correct the flag or the name and retry once. Fall back to source-only work only if no router or tool is available at all, or a call actually ran and failed in a way no input change fixes.
- Trust a successful Rider result. Do not re-read the file, re-`Grep`, `git diff`, or build just to confirm a clean diagnostic, lint, format, or build.

Independent calls belong in one message — `get_file_problems` for two changed files, or a `search_symbol` plus a `search_text`, as parallel calls rather than one round trip each.

## Framework selection

Pick the minimal framework that covers the requested test. Read [reference/ue-test-patterns.md](reference/ue-test-patterns.md) when choosing a framework or writing its boilerplate.

| Need | Preferred framework |
|---|---|
| Pure C++ logic, no UObject | LowLevelTestsRunner / Catch2 |
| Simple one-off C++ assertion | Automation `IMPLEMENT_SIMPLE_AUTOMATION_TEST` or CQTest `TEST` |
| C++ class or subsystem with setup/teardown | CQTest `TEST_CLASS` |
| Grouped BDD-style behavior | Automation `DEFINE_SPEC` |
| Multi-frame async behavior | CQTest `TestCommandBuilder` |
| Server/client replication in PIE | CQTest `PIENetworkComponent` |
| Actor behavior in a real level | Functional Test |
| Full game startup, stability, or performance CI | Gauntlet |

Match the framework the project already uses unless the user asks for a different one. A heavier framework than the behavior needs — a map, PIE, or Gauntlet for logic that is testable in-process — is a defect, not thoroughness.

## Implementation path

1. Locate the existing test module and the framework pattern its neighbors use.
2. Locate the API under test and read its declaration *from source* — the real signature, access level, return type, and any preconditions. Do not assert against an API you inferred from a call site.
3. Write or edit the test with `Edit`/`Write`.
4. Audit the test against the requested coverage (next section) *before* reaching for a build.
5. Run the changed-file diagnostics:
   - one or two files → `get_file_problems` per file, in parallel;
   - three or more, or any new module/framework/`Build.cs` change → a single `lint_files` call.
6. Fix every error and every warning that bears on the test, then stop with a short summary naming any diagnostics you could not run.

After `Edit`/`Write` there is nothing to save: Rider refreshes each file from disk before it analyzes, formats, or refactors it. Two consequences — `reformat_file` rewrites files on disk, so run it last and `Read` a file again before editing it further; and if this project installs Rider's PostToolUse quality-check hook, the hook output you already got after an edit *is* the analysis (it blocks on errors, reports warnings, and skips reformatting for C/C++ while still inspecting it) — fix what it reports instead of re-running the same check.

Use the full quality path only when creating a new test module, adding a framework, changing `Build.cs`, changing module/plugin/target files, or touching several files:

1. `get_file_problems` / `lint_files` on changed files → fix errors and relevant warnings.
2. Start a build only once changed-file diagnostics are clean. Do not start or keep polling a build while errors remain. Do not write off include, registration, or generated-code diagnostics as indexing noise unless a re-run after `reformat_file` is clean, or a build has already compiled that file successfully.
3. `build_solution_start`; poll `build_solution_state`; fix build errors.
4. `get_project_problems` after a successful build, filtered to changed files.
5. `reformat_file` on the changed files.

In a containerized eval workspace, do not run `build_solution_start` for a source-only single-test-file change when no `.Build.cs`, module, plugin, target, or framework dependency changed. The verifier performs the authoritative clean build and automation run. Do not go hunting for engine scripts or hand-run UBT either — spend the turn on correct test source, focused diagnostics, and an honest report of what could not be verified.

## Coverage audit

Before any build-only validation and before your final message, turn the requested behavior into a short list of what the test must actually prove, and compare it to the test you wrote. Clean diagnostics and a green build show the test compiles and registers; they show nothing about whether it exercises the requested behavior.

Check every item that applies:

- **The named behavior is asserted** — every case the request names has an assertion that fails when the behavior regresses. A test that passes against a deliberately broken implementation proves nothing; if you cannot see that it would fail, it is not covering the case.
- **Boundary cases** — the strict comparisons, equality cases, zero/negative/null inputs, and empty-collection cases the request names each have their own assertion, not one combined happy-path check.
- **Real API** — the test calls the actual declared names, signatures, and access levels of the unit under test. Do not assert on a helper you wish existed, or route around the requested entry point.
- **Registration** — the test class sits in an `Editor` or `Test` module, uses the framework's exact registration macro, and carries a valid context flag plus a product/engine filter. A test that never registers silently passes CI.
- **Required state** — anything the unit reads (world, owner, component, subsystem, initialized attributes) is set up in the test, or the test is written to the no-world/no-owner path deliberately.
- **Isolation and teardown** — the test does not depend on another test's state or ordering; spawned actors, worlds, delegates, and effects created by the test are torn down in the matching hook.
- **Module dependencies** — new includes are backed by the narrowest `Build.cs` dependencies that satisfy them, added to the *test* module.
- **Async correctness** — assertions on multi-frame behavior run after completion (`.Until()`, `FDoneDelegate`, the latent command's done callback), never immediately after queuing.

If an item is uncertain, `Read` the relevant declaration or a narrow range around it. Do not infer coverage from a green build. Do not run `git diff`/`git status` unless a `.git` directory exists in or above the workspace.

## Test authoring rules

1. Match the project's existing framework, file layout, and naming style unless a new framework was requested.
2. Keep test modules as editor/test modules when the framework requires it; never register editor tests in a runtime module.
3. `RunTest` returns `bool` — return `true` only after setup and assertions have actually completed.
4. Add only the module dependencies the included headers and framework use require.
5. For CQTest async work, queue commands up front and assert after `.Until()` or the equivalent completion hook.
6. For replication tests, use the project's existing PIE/network helpers before inventing harness code.
7. When a protected UE hook is deliberately the unit under test, prefer a source-only Automation test and widen access narrowly with `#define protected public` around only the tested header include. Do not escalate to maps, PIE, Functional Tests, Blueprint tests, or Gauntlet unless the behavior truly needs them.
8. `lint_files` weak warnings about that narrow `#define protected public` shim are acceptable when the protected hook is the API under test. Do not rewrite the test into an indirect path that stops exercising the hook just to silence them.
9. For a domain-specific test pattern, read the matching reference only when needed; keep the core workflow focused on the requested behavior, real API, required state, and observable boundaries.

## References

- [reference/ue-test-patterns.md](reference/ue-test-patterns.md) — read for framework selection, boilerplate, new test module setup, and framework pitfalls.
- [reference/attribute-set-tests.md](reference/attribute-set-tests.md) — read only when testing an Unreal `UAttributeSet` or its attribute-change hooks.
- [reference/rider-tools.md](reference/rider-tools.md) — read for the fix-loop and full quality-pass patterns.
- [reference/rider-mcp-tools.md](reference/rider-mcp-tools.md) — read for a less common Rider tool or an argument you are unsure of.
