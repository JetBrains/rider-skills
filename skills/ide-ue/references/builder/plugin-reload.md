# Plugin Live Build-Reload Pipelines

## Change Detection

Before building, detect **what changed** to pick the right pipeline.

**How to get the changed file list:**
- **Git repo**: `git diff --name-only HEAD` (unstaged + staged) against the project root
- **No git**: Review which files were edited/created in the current conversation, or ask the user what they changed
- **Fallback**: If you cannot determine what changed, inspect the files the agent modified in this session — those are the changed files

### Classification Rules

**Always try Live Coding first when the editor is running**, regardless of what changed. Only escalate to Full UBT + Restart if Live Coding fails with a crash.

| Changed files | Classification | Default Pipeline |
|---|---|---|
| Any `.cpp` or `.h` changes (game or plugin) | **Code change** | Live Coding (if editor running) |
| New `.h` or `.cpp` files added | **New files** | Live Coding (if editor running) |
| `.uplugin` descriptor changed | **Plugin descriptor** | Live Coding (if editor running) |
| `Build.cs` changed | **Module dependency** | Live Coding (if editor running) |
| Editor NOT running | **Any change** | Full UBT (auto-detected) |

**Escalation (only after Live Coding fails):**

| Crash symptom after Live Coding | Escalate to |
|---|---|
| `Trying to recreate changed class` / CDO mismatch | Full UBT + Restart |
| SIGSEGV / access violation | Full UBT + Restart |
| Persistent crash after UBT rebuild | Clean Rebuild |

### What Live Coding Can Patch

- Function body changes in `.cpp` files
- Local variable additions
- New `#include` in `.cpp` (if the header doesn't change class layout)
- Logging / debug output changes

### What Live Coding May Struggle With (escalate only on failure)

The following changes may cause Live Coding issues. **Always try Live Coding first** — only escalate to Full UBT + Restart if it crashes:

- Changes to `.h` files that alter class layout (size, vtable, CDO)
- Adding/removing `UPROPERTY`, `UFUNCTION`, `USTRUCT`, `UCLASS`, `UENUM`
- Adding/removing/renaming `.h` or `.cpp` files
- Changing constructor logic (CDO is already baked)
- Changing `Build.cs` module dependencies
- Changing `.uplugin` module descriptors or loading phases

## Pipelines

### Pipeline A: Live Coding (DEFAULT — editor running, any changes)

```
1. ue-build.sh  (auto-detects editor → triggers Live Coding)
2. Changes patched in ~5-15 seconds
3. Test immediately — no restart needed
```

### Pipeline B: Full UBT Rebuild + Editor Restart (ESCALATION — only after Live Coding crash)

```
1. ue-build.sh --force-ubt    (skip Live Coding, full UBT compile)
2. ue-runner --restart         (kill + relaunch editor to load new binary)
3. Wait for editor ready
4. Test
```

### Pipeline C: Clean Rebuild (persistent crashes even after Pipeline B)

```
1. ue-clean.sh                (wipe Intermediate/ and Binaries/)
2. ue-build.sh --force-ubt    (full rebuild from scratch)
3. ue-runner --restart
```

## Crash Signals → Pipeline Escalation

| Symptom | Likely cause | Escalate to |
|---|---|---|
| `Trying to recreate changed class` | Header change couldn't hot-patch | Pipeline B |
| `CDO mismatch` or `default subobject` errors | Constructor/UPROPERTY change couldn't hot-patch | Pipeline B |
| SIGSEGV / access violation after Live Coding | Stale vtable | Pipeline B |
| Persistent crash even after Pipeline B | Corrupted Intermediate files | Pipeline C |
| `Module not found` after adding new plugin module | .uplugin not listing the module | Fix `.uplugin`, then Pipeline B |

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `build_solution_start` | Trigger Hot Reload or full UBT compile | Pipeline A (Live Coding via Rider) — replaces `ue-build.sh` when IDE is connected |
| `build_solution_state` | Poll build progress and collect errors | Loop until `state != "Running"`; on failure read `problems` to identify the escalation trigger |
| `get_file_problems` | IDE diagnostics for a changed file | Run after edits to catch redefinition errors or missing includes before building |
| `get_project_problems` | Solution-wide problem panel | Check for pre-existing errors that would mask the plugin's build failure |
| `execute_run_configuration` | Launch or restart the editor | Pipeline B/C: after full UBT, launch via Rider's run config instead of the shell script |
| `ue_get_logs` | Verify Hot Reload / Live Coding outcome | `category="LogLiveCoding"`, `pattern="patched\|failed"` — "Code successfully patched" = success; any error = escalate |
| `ue_health` | Confirm editor is connected and running | Before any build decision: if `connected = false`, always go UBT + restart |
