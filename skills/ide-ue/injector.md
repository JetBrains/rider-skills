# Unreal Engine project — use `ide-ue`

This is an Unreal Engine codebase. The `ide-ue` skill is the **UE-specific** surface layered on top of `ide`:

- **Editor lifecycle, PIE control, log streaming** (`ide-ue:editor`)
- **Asset & GameplayTag index** (`ide-ue:assets`)
- **Editor Python** (`ide-ue:python`)
- **Canonical UE pipelines** (`ide-ue:pipelines`)
- **UE build addenda** on top of generic `ide:build` (`ide-ue:build`)
- **Long-running cook/package jobs** (`ide-ue:long-ops`)

**Rules:**

1. For UE-specific work (editor, assets, tags, Python, cook/package, PIE), invoke `ide-ue` via the Skill tool.
2. For solution build, run configurations, debugging, search, and file editing, keep using the generic `ide` skill — `ide-ue` only adds UE-specific addenda.
3. Use `mcp__<rider_mcp_name>__ue_*` tools rather than tailing UE log files, running `UnrealBuildTool` directly, or triggering editor actions in the GUI.
