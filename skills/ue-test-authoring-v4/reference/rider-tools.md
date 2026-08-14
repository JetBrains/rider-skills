# Rider MCP — Test Authoring Workflow Patterns

For full tool parameter reference see `reference/rider-mcp-tools.md`.

---

## Fix-loop for a test file

1. Write or edit the file with Codex file tools
2. `execute_tool(command="get_file_problems --filePath <path>")` → errors? → edit to fix → back to 2
3. No errors → `execute_tool(command="lint_files --files '[\"<path>\"]'")` → fix remaining issues
4. `execute_tool(command="reformat_file --files '[\"<path>\"]'")`

Run `build_solution_start` only for broad changes: new modules, new framework dependencies, `Build.cs`, plugin/target files, or multiple source/test files. In containerized UE eval workspaces, source-only single-test-file additions should stop after diagnostics, lint, reformat, and focused source checks; the verifier performs the clean build and automation run.

## Common lookups

### "Does a test module already exist?"
Use `rg --files` or `find` to look for `*Tests` dirs. Use `execute_tool(command="search_file --q Build.cs")` to find `Build.cs` files and check `Type=Editor`. Use `execute_tool(command="search_text --q IMPLEMENT_MODULE")`.

### "What is the correct API to test?"
Use `execute_tool(command="search_symbol --q <Name>")` to find the declaration file. Read the `.h` with Codex file tools. Use `execute_tool(command="get_symbol_info --filePath <path> --line <line> --column <column>")` to confirm the contract.

### "Find existing tests for this feature"
Use `execute_tool(command="search_text --q IMPLEMENT_SIMPLE_AUTOMATION_TEST")`, `execute_tool(command="search_text --q TEST_CLASS")`, or `execute_tool(command="search_text --q DEFINE_SPEC")`. Use `execute_tool(command="search_file --q '*Tests*.cpp'")` for test files.

### "Who calls the function I'm testing?"
Use `execute_tool(command="analyze_calls --filePath <path> --line <line> --column <column>")` to find callers. Or fall back to `rg`.
