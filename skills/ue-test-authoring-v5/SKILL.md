---
name: ue-test-authoring-v5
description: Use when writing or modifying Unreal Engine automated tests in Codex, including Automation, CQTest, Functional, Gauntlet, and LowLevel tests. Prefer normal source edits plus Rider diagnostics invoked through execute_tool to catch test registration errors, wrong RunTest return types, missing includes, module dependency issues, and API-under-test mistakes. Do not use for Blueprint-only testing or debugging existing test failures without authoring or modifying test code.
allowed-tools: execute_tool
metadata:
  author: JetBrains
---

# UE Test Authoring v5

Author Unreal Engine automated tests in the project style. Use normal Codex file inspection and edits for test source changes, and invoke Rider only through `execute_tool(command="<tool> --flag value ...")` for IDE search, API inspection, diagnostics, formatting, and builds.

## Gate

1. Verify the workspace is a UE project:

   ```bash
   find . -maxdepth 1 -name "*.uproject" | head -1
   ```

   If no `.uproject` exists, stop and say the task must run from the UE project root.
2. Confirm the request requires writing or modifying test code. If it is only a runtime bug, build request, or non-test source change, clarify scope before proceeding.
3. Inspect only what is needed: `.uproject`, relevant test module `Build.cs`, nearby test files, and the API under test.

Use `rg --files`, `rg`, and narrow `sed -n` windows for source inspection. Do not read broad directories or whole files when a symbol search or narrow range is enough.

## Invoke Rider

Call Rider tools directly through `execute_tool`. Do not call underlying `mcp__...` handles and do not use `tool_search` for routine tool lookup; the command table below is the contract. If `execute_tool` is unavailable, continue with source-level work and state that Rider diagnostics were skipped.

```
execute_tool(command="search_text --q IMPLEMENT_SIMPLE_AUTOMATION_TEST")
execute_tool(command="search_symbol --q ULyraHealthComponent")
execute_tool(command="get_file_problems --filePath Source/LyraGameTests/Private/LyraHealthTests.cpp")
```

| Need | Command |
|---|---|
| Find existing test macros or patterns | `search_text --q <macro-or-feature-name>` |
| Find test files | `search_file --q "*Tests*.cpp"` |
| Find the API under test | `search_symbol --q <name>` |
| Confirm symbol details after reading the file | `get_symbol_info --filePath <path> --line <line> --column <column>` |
| Check one changed test file | `get_file_problems --filePath <path>` |
| Check several changed files | `lint_files --files '["Source/Tests/FooTests.cpp","Source/Tests/FooTests.h"]'` |
| Build through Rider only for broad changes | `build_solution_start`, then poll `build_solution_state` until not `Running` |
| Reformat changed files | `reformat_file --files '["Source/Tests/FooTests.cpp"]'` |
| Read project-wide problems after a successful build | `get_project_problems` |

- Paths may be relative if the tool accepts them; when in doubt, pass the path exactly as used in the project tree.
- Quote values containing spaces. For JSON arguments, wrap the JSON in single quotes.
- Parameters named `files` or `paths` are JSON arrays, even for one file: `--files '["Source/LyraGame/Tests/FooTest.cpp"]'`.
- `Missing required parameters`, `Tool '<x>' not found`, or similar input errors are fixable; change the command and retry once with the corrected flag. Fall back only if `execute_tool` is missing or a real tool execution fails in a way input changes cannot fix.
- Trust successful Rider results. Do not re-read, re-grep, diff, or build only to confirm a successful diagnostic, lint, format, or build result.
- In containerized UE eval workspaces, do not run `build_solution_start` for a source-only single-test-file change when no `.Build.cs`, module, plugin, target, or framework dependency changed. The verifier performs the authoritative clean build and test run; use Rider diagnostics, lint, reformat, and focused source checks instead.

## Framework Selection

Pick the minimal framework that covers the requested test. Read `reference/ue-test-patterns.md` when choosing a framework or writing framework-specific boilerplate.

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

## Implementation Path

For most Codex test-authoring tasks:

1. Locate existing test module and framework patterns.
2. Locate the API under test and read its declaration.
3. Edit or create test files with Codex file tools.
4. Run focused source checks that match the requested behavior.
5. Run `execute_tool(command="get_file_problems --filePath <changed-file>")` for each changed test file when `execute_tool` is available.
6. Stop with a concise summary and note any unavailable diagnostics.

Use the full Rider quality path only when creating a new test module, adding a new test framework, changing `Build.cs`, changing module/plugin/target files, or modifying multiple test/source files:

1. `get_file_problems` for each changed file; fix all errors and relevant warnings.
2. `lint_files` for multi-file or new-framework changes; fix issues.
3. `build_solution_start`; poll `build_solution_state` until complete; fix build errors.
4. `get_project_problems` after a successful build, filtered to changed files.
5. `reformat_file --files '["<changed-file>"]'` on changed files.

In containerized eval workspaces, do not hunt for Unreal engine scripts, shell-build with UBT, or start Rider full builds for source-only test additions. The verifier will perform the authoritative clean build and automation run; spend the agent turn on correct test source, `get_file_problems`, `lint_files`, `reformat_file`, and focused source checks.

## Test Authoring Rules

1. Match the project’s existing test framework and naming style unless the user asks for a new framework.
2. Keep test modules as editor/test modules when the framework requires it; avoid registering editor tests in runtime modules.
3. Use the exact test registration macros and flags required by the framework. Automation tests need a valid context flag and product/engine filter.
4. `RunTest` must return `bool`; return `true` only after assertions and setup have completed successfully.
5. Add only the module dependencies required by included headers and framework use.
6. For CQTest async work, queue commands up front and assert after `.Until()` or equivalent completion.
7. For replication tests, use the existing project’s PIE/network test helpers when present before inventing new harness code.
8. For protected UE hooks that are intentionally the unit under test, such as attribute-set clamp methods, prefer a source-only Automation test and expose the hook narrowly with `#define protected public` around only the tested header include; avoid maps, PIE, Functional Tests, Blueprint tests, or Gauntlet unless behavior truly needs them.
9. `lint_files` weak warnings for the narrow `#define protected public` test shim are acceptable when the protected hook is the API under test; do not rewrite the test into an indirect path that stops exercising the hook.
10. For `UAttributeSet` tests, inspect whether the accessors under test route through `GetOwningAbilitySystemComponent()`. If the test creates the attribute set directly, initialize backing values with `InitXxx` or raw attribute data before invoking the hook under test; do not call `SetXxx` accessors unless the test also creates a minimal owning actor plus `UAbilitySystemComponent`, initializes actor info, and registers the attribute set with that component.

## References

- `reference/ue-test-patterns.md` — read for framework selection, boilerplate, new module setup, and framework pitfalls.
- `reference/rider-tools.md` — read when using the full Rider quality loop.
- `reference/rider-mcp-tools.md` — read for less common Rider tools or execute_tool troubleshooting.
