---
name: ue-code-authoring-claude-v9
description: Use for Unreal Engine C++ authoring in a Rider project, including reflected API, Gameplay Ability System, gameplay tags, and C++ gameplay behavior. Prefer Rider MCP for discovery, diagnostics, formatting, and builds. Do not use for Blueprint-only or editor-automation tasks.
metadata:
  author: JetBrains
---

# UE Code Authoring

Use Rider MCP first. Keep the path short: discover only the symbols and project pattern needed for
the requested change, make the implementation, then validate it once.

## Resolve the Router Once

In a headless eval, call `mcp__ide-headless-mcp__execute_tool` when it is available. Otherwise,
resolve the namespaced router once and reuse the exact returned tool name for the whole task:

```
ToolSearch(query="+execute_tool", max_results=5)
```

All Rider commands use:

```
execute_tool(command="<command> --flag value")
```

Use project-relative, forward-slash paths. Every flag has a value. List-valued flags use a JSON
array literal, for example `--files '["Source/Module/Foo.h","Source/Module/Foo.cpp"]'`.

## MCP-First Path

1. Before the first edit, make at most two focused discovery calls. Use `search_symbol` for a
   type, member, or UE API, and `search_text` for one exact in-project pattern. Issue independent
   calls together.

   ```
   execute_tool(command="search_symbol --q UMyGameplayAbility")
   execute_tool(command="search_text --q UE_DEFINE_GAMEPLAY_TAG")
   ```

2. Make the requested C++ implementation in the project style. For an existing symbol rename,
   move, or signature change, use the corresponding Rider refactoring command; do not use a
   refactoring command for new freeform implementation.

3. Validate changed files once. For one or two files, request their problems in parallel; for
   three or more files, use one lint call. Fix request-relevant errors before building.

   ```
   execute_tool(command="get_file_problems --filePath Source/Module/Foo.cpp --errorsOnly false")
   execute_tool(command="lint_files --files '[\"Source/Module/Foo.h\",\"Source/Module/Foo.cpp\"]' --min_severity warning")
   ```

4. Only when the request requires build or test validation, start one incremental build and reuse
   its returned session ID when polling. Do not start a second build for the same change.

   ```
   execute_tool(command="build_solution_start --rebuild false")
   execute_tool(command="build_solution_state --sessionId <returned-session-id>")
   ```

5. Reformat changed files last.

   ```
   execute_tool(command="reformat_file --files '[\"Source/Module/Foo.h\",\"Source/Module/Foo.cpp\"]'")
   ```

## Stop Rules

- Do not probe for tools, repeat equivalent searches, or perform discovery after the needed
  pattern has been found.
- Trust a successful Rider result. Do not repeat diagnostics, formatting, or a build merely to
  confirm success.
- Poll the same build session only until its state is terminal. If it reports unrelated project or
  environment failures, report the blocker rather than expanding the investigation.
- If a command reports a missing parameter or unknown command, correct the command once using the
  documented forms above; do not switch to an exploratory sequence.

## UE Focus

- Preserve requested reflection metadata, generated-header ordering, public API spelling, and
  Blueprint exposure.
- For GAS work, use the located project pattern for attributes, abilities, costs, cooldowns, and
  native gameplay tags; keep boundary and lifecycle behavior explicit.
- A green diagnostic or build result does not replace the requested gameplay behavior. Check the
  implementation against the user request before the final response.
