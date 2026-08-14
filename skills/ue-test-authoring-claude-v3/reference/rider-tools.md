# Rider MCP — Test Authoring Workflow Patterns

Tool contracts live in [rider-mcp-tools.md](rider-mcp-tools.md). This file is the shape of the loops.

Examples below use the bare tool names through the router. Resolve the router's real namespaced name once with `ToolSearch(query="+execute_tool", max_results=5)`, and pass `rootFolder` when the solution root is not the working directory. Where the individual tools are exposed directly, call them directly instead.

---

## Fix-loop for a single test file

1. `Edit` / `Write` the file.
2. `execute_tool(command="get_file_problems --filePath <path>")` → errors? `Edit` to fix → back to 2.
3. Clean → move on. Do not re-`Read` the file to confirm.

## Fix-loop for several files

1. Make all the edits first.
2. One `execute_tool(command="lint_files --files '[\"<path1>\",\"<path2>\"]'")` instead of N `get_file_problems` calls.
3. Fix everything the batch reports, then re-run the same `lint_files` call once.

Two files is the break-even point: at one or two, issue `get_file_problems` per file as parallel calls in a single message; at three or more, `lint_files` is one round trip and one result to read.

## Full quality pass

Only for a new test module, a new framework, a `Build.cs` / plugin / target change, or several changed files.

1. Make all the edits.
2. `get_file_problems` / `lint_files` on the changed files → fix errors and relevant warnings.
3. `execute_tool(command="build_solution_start")` → poll `execute_tool(command="build_solution_state")` until `state` is not `Running`, then check `buildIsSuccess`.
   - Never start the build while changed-file diagnostics still report errors.
   - `build_solution_start --filesToRebuild '["<path>"]'` compiles just the changed files.
   - For Unreal, Rider triggers a Hot Reload compile when the editor is connected and Live Coding is available; otherwise UBT compiles the primary Editor target.
4. Succeeded → `execute_tool(command="get_project_problems")` → fix issues on the changed files. This is also where a newly created test module shows up as registered or not.
5. `execute_tool(command="reformat_file --files '[\"<path1>\",\"<path2>\"]'")` — **last**, because it rewrites the files on disk. If you must edit afterwards, `Read` the file again first so your edit does not race a stale copy.

In a containerized eval workspace, a source-only single-test-file addition stops after diagnostics, lint, reformat, and focused source checks. The verifier runs the authoritative clean build and automation pass.

## Common lookups

**"Does a test module already exist?"**
`Glob` for `**/*Tests/**` and `**/*Tests.Build.cs`. Read the `Build.cs` and check for `Type=Editor`. `execute_tool(command="search_text --q IMPLEMENT_MODULE")` finds the module stubs.

**"Which framework does this project use?"**
`execute_tool(command="search_text --q IMPLEMENT_SIMPLE_AUTOMATION_TEST")`, `--q TEST_CLASS`, `--q DEFINE_SPEC`. Whichever comes back with real hits is the house style — match it.

**"Find the existing tests for this feature"**
`execute_tool(command="search_file --q '*Tests*.cpp'")`, then `Grep` inside the hits for the feature name.

**"What is the correct API to test?"**
`execute_tool(command="search_symbol --q <Name>")` to find the declaring file — add `--include_external true` when the API is engine-side. `Read` the header for the public interface. For a contract detail (nullable return, editor-only, preconditions), `Read` the file to get the line/column and pass them to `get_symbol_info` — that tool is position-based, not name-based.

**"What state does the method under test need?"**
`execute_tool(command="analyze_calls --symbolFqn <FullyQualifiedCallable> --analysisKind OUTGOING_CALLS")` traces what it reaches for — the world, the owning component, an initialized attribute — which is exactly the setup the test has to provide. Name-based: locate the symbol with `search_symbol` first and pass the fully qualified callable. "No call hierarchy provider found" → fall back to `Grep`.

**"Who else calls this?"**
Same tool with `--analysisKind INCOMING_CALLS`. Existing call sites show the real usage the test should mirror.

## Anti-patterns

- Re-reading a file, re-`Grep`ping, or running `git diff` to verify a Rider result that already came back successful.
- Starting or polling a build while changed-file errors remain — the build cannot tell you anything new yet.
- Building at all for a source-only single-test-file change in an eval workspace.
- Dismissing an include, registration, or generated-code diagnostic as an indexing artifact. Only a clean re-run after `reformat_file`, or a build that already compiled that file, earns that conclusion.
- Reformatting in the middle of the loop and then editing from a stale `Read`.
- Asserting against an API signature inferred from a nearby call site instead of read from the declaration.
- Hunting for engine scripts or hand-running UBT when the toolchain is absent — say the build was not run and move on.
