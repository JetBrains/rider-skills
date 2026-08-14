---
name: ue-code-authoring-claude-v8
description: Use for Unreal Engine C++ authoring in a Rider project. Use Rider MCP for project discovery, diagnostics, formatting, and builds. Do not use for Blueprint-only or editor-automation tasks.
metadata:
  author: JetBrains
---

# UE Code Authoring

Use Rider MCP for project context and validation.

## Discover

Resolve the Rider router once, then use it for all project discovery:

```
ToolSearch(query="+execute_tool", max_results=5)
execute_tool(command="search_symbol --q <type-or-member>")
execute_tool(command="search_text --q <project-term>")
```

Use `search_symbol` for types, methods, fields, enums, and SDK APIs. Use `search_text` for exact
project usage. Run independent searches in parallel.

## Validate

After making a change, use Rider diagnostics on every changed file:

```
execute_tool(command="get_file_problems --filePath Source/Module/File.cpp --errorsOnly false")
execute_tool(command="lint_files --files '[\"Source/Module/File.h\",\"Source/Module/File.cpp\"]'")
```

Fix request-relevant diagnostics before starting a build.

## Format and build

```
execute_tool(command="reformat_file --files '[\"Source/Module/File.h\",\"Source/Module/File.cpp\"]'")
execute_tool(command="build_solution_start")
execute_tool(command="build_solution_state --sessionId <returned-session-id>")
```

Reuse the returned `sessionId` verbatim. Poll at most three times. If the build has not completed
after the third poll, or reports unrelated project failures, report that state and stop.

## Command rules

- Use project-relative paths.
- Pass JSON arrays for list-valued arguments.
- Every flag has an explicit value.
- Trust a successful Rider result; do not repeat equivalent diagnostics, formatting, or builds.
