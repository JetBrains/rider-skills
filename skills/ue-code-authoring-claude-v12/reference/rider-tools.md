# Rider MCP — Code Authoring Workflow Patterns

Tool contracts live in [rider-mcp-tools.md](rider-mcp-tools.md). This file is the shape of the loops.

---

## Fix-loop for a single file

1. `Edit` / `Write` the file.
2. `execute_tool(command="get_file_problems --filePath <path>")` → errors? `Edit` to fix → back to 2.
3. Clean → move on. Do not re-`Read` the file to confirm.

## Fix-loop for several files

1. Make all the edits first.
2. One `execute_tool(command="lint_files --files '[\"<path1>\",\"<path2>\"]'")` instead of N `get_file_problems` calls.
3. Fix everything the batch reports, then re-run the same `lint_files` call once.

Two files is the break-even point: at one or two files, issue `get_file_problems` per file as parallel calls in a single message; at three or more, `lint_files` is one round trip and one result to read.

## Full quality pass

Only when a local IDE build is the requested or necessary validation.

1. Make all the edits.
2. `get_file_problems` / `lint_files` on the changed files → fix errors and relevant warnings.
3. `execute_tool(command="build_solution_start")` → poll `execute_tool(command="build_solution_state")` until `state` is not `Running`, then check `buildIsSuccess`. A UE build takes minutes: wait ~60s between polls (`sleep 60`) and expect under ~10 polls — every poll is a full turn that re-sends the context.
   - Never start the build while changed-file diagnostics still report errors.
   - `build_solution_start --filesToRebuild '["<path>"]'` compiles just the changed files.
   - For Unreal, Rider triggers a Hot Reload compile when the editor is connected and Live Coding is available; otherwise UBT compiles the primary Editor target.
4. Succeeded → `execute_tool(command="get_project_problems")` → fix issues on the changed files.
5. `execute_tool(command="reformat_file --files '[\"<path1>\",\"<path2>\"]'")` — **last**, because it rewrites the files on disk. If you must edit afterwards, `Read` the file again first so your edit does not race a stale copy.

## Common lookups

**"Does this class already exist?"**
`execute_tool(command="search_symbol --q <ClassName>")`. `Glob` for the file layout.

**"What module does X belong to?"**
`search_symbol --q <Name>` → the returned path gives `Source/<Module>/...` → `Read` that module's `Build.cs` for its dependencies.

**"Where is this UPROPERTY / native tag string used?"**
`Grep` is enough for plain source. Use `execute_tool(command="search_text --q <text>")` when the IDE index matters — generated `.generated.h` code, reflected members, or files open with unsaved changes in Rider.

**"Is there a base class I should extend?"**
`search_symbol --q <BaseName>`, then `Read` the header. For a contract detail (nullable return, editor-only, threading), `Read` the file to get the line/column and pass them to `get_symbol_info` — that tool is position-based, not name-based.

**"Who calls this?"**
`analyze_calls --symbolFqn <FullyQualifiedName> --analysisKind INCOMING_CALLS`. Locate the symbol with `search_symbol` first and pass the fully qualified callable name. If it answers "No call hierarchy provider found", fall back to `Grep`.

## Anti-patterns

- Re-reading a file, re-`Grep`ping, or running `git diff` to verify a Rider result that already came back successful.
- Starting or polling a build while changed-file errors remain — the build cannot tell you anything new yet.
- Dismissing an include, reflection, or generated-code diagnostic as an indexing artifact. Only a clean re-run after `reformat_file`, or a build that already compiled that file, earns that conclusion.
- Reformatting in the middle of the loop and then editing from a stale `Read`.
- Hunting for engine scripts or hand-running UBT when the toolchain is absent — say the build was not run and move on.
