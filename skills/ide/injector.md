# IDE skill is mandatory

You are working inside an IDE-managed project. The `ide` skill is the single entry point for **all** IDE interactions:

- **Code quality** — inspect, lint, find problems, apply quick-fix, rename, reformat (`ide:quality`)
- **Build** — non-blocking solution builds with state polling (`ide:build`)
- **Run configurations** — execute tests, capture output, override launch args, stop processes (`ide:runner`)
- **Search** — find symbols, files, text, regex (`ide:search`)
- **Debugging** — sessions, breakpoints, stepping, variable/expression evaluation (`ide:debugger`)
- **Long-running operations** — Monitor + ScheduleWakeup protocol for builds, cooks, packages (`ide:long-ops`)

**Rules:**

1. Invoke the `ide` Skill **before** reaching for CLI fallbacks, manual file inspection, or `print` debugging.
2. Prefer `mcp__<ide_mcp_name>__*` tools over `Bash` whenever an MCP equivalent exists.
3. Never guess IDE state — query it. Never trigger IDE actions through the GUI on the user's behalf when an MCP tool exists.
