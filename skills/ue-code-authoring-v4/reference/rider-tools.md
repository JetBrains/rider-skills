# Rider MCP — Code Authoring Workflow Patterns

For full tool parameter reference see `reference/rider-mcp-tools.md`.

---

## Fix-loop for a single file

1. Write or edit the file with Codex file tools
2. `execute_tool(command="get_file_problems --filePath <path>")` → errors? → edit to fix → back to 2
3. No errors → move on

## Full quality pass

1. Write all files with Codex file tools
2. `execute_tool(command="get_file_problems --filePath <path>")` on each file → fix all errors + warnings
3. `execute_tool(command="lint_files --files '[\"<path1>\",\"<path2>\"]'")` on all changed files → fix remaining issues
4. `execute_tool(command="build_solution_start")` → poll `execute_tool(command="build_solution_state")`
5. Succeeded? → `execute_tool(command="get_project_problems")` → fix issues on changed files
6. `execute_tool(command="reformat_file --filePath <path>")` on each changed file

## Common lookups

### "Does this class already exist?"
Use `execute_tool(command="search_symbol --q <ClassName>")` to check. Use `rg --files` or `find` to check file layout.

### "What module does X belong to?"
Use `execute_tool(command="search_symbol --q <Name>")` to find the file path → derive module from `Source/<Module>/...`. Read the `Build.cs` to check dependencies.

### "Where is this UPROPERTY used?"
Use `execute_tool(command="search_text --query <PropertyName>")`.

### "Is there an existing base class I should extend?"
Use `execute_tool(command="search_symbol --q <BaseName>")`. Then use `get_symbol_info` through `execute_tool` if symbol details are needed; read the file first to find line/column.
