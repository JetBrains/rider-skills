# UE Builder — Compile and Clean

Build (compile) and clean Unreal Engine projects using UnrealBuildTool (UBT). For packaging and cooking, use **console.md** / RunUAT.

## Checklist

1. **Determine operation** — build vs clean, platform, config, target; check if editor is running
2. **Build** — run the appropriate script
3. **Check result** — verify success; fix errors and rebuild if failed

## Build pipeline

| Scenario | Pipeline | Notes |
|----------|----------|-------|
| Editor running (any changes) | **Live Coding** (auto-detected) | Script calls `/ue:console --build --wait` |
| Editor NOT running | **Full UBT** | Script falls back automatically |
| Live Coding fails (CDO mismatch, SIGSEGV) | **UBT + restart** | `--force-ubt` + restart editor |
| Corrupted state / persistent crashes | **Clean rebuild** | `ue-clean` → `--force-ubt` → restart |

> Do NOT use `--force-ubt` preemptively. Only escalate when Live Coding actually fails.

## Commands

Scripts are in `../ue-builder/scripts/`.

**Build:**
```bash
bash ../ue-builder/scripts/ue-build.sh \
  --project "/path/to/Game.uproject" \
  --platform Win64 --config Development --target Editor
```
```powershell
powershell -ExecutionPolicy Bypass -File "..\ue-builder\scripts\ue-build.ps1" `
  --project "C:\Path\Game.uproject" --platform Win64 --config Development --target Editor
```

**Clean:**
```bash
bash ../ue-builder/scripts/ue-clean.sh --project "/path/to/Game.uproject"
```
```powershell
powershell -ExecutionPolicy Bypass -File "..\ue-builder\scripts\ue-clean.ps1" --project "C:\Path\Game.uproject"
```

## Environment variables

| Variable | Default | Description |
|----------|---------|-------------|
| `UE_ROOT` | auto-detect | Unreal Engine root directory |
| `UE_PROJECT` | auto-detect | Path to `.uproject` file |

## Error recovery

| Error | Fix |
|-------|-----|
| "UE_ROOT not found" | `export UE_ROOT="/path/to/UE_5.x"` (or `$env:UE_ROOT=...` on Windows) |
| "No .uproject found" | Provide `--project` or cd into project directory |
| Build errors in new code | Fix errors and rebuild |
| Build failed with pre-existing errors | Report to user — do NOT proceed to editor launch |
| `Trying to recreate changed class` | Escalate to `--force-ubt` + restart editor |
| Persistent crashes after full rebuild | `ue-clean` → `--force-ubt` → restart |
| `Module not found` after adding plugin | Check `.uplugin` lists the module, then `--force-ubt` + restart |

## Rules

- **Check build result before any downstream step.** A failed build means the editor binary was NOT updated.
- Default timeout: 30 min for build.
- **`clean` is safe** — removes generated artifacts only, not source code.

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `build_solution_start` | Trigger a UBT or Hot Reload compile via Rider | Replaces `ue-build.sh` when Rider + RiderLink are connected; returns `sessionId` |
| `build_solution_state` | Poll build progress and collect errors | Loop until `state != "Running"`; require `buildIsSuccess == true` before launching the editor |
| `get_file_problems` | IDE diagnostics for a single source file | Run on edited `.h`/`.cpp` before committing to a full build |
| `get_project_problems` | Solution-wide problems panel | Check for pre-existing errors that would prevent a successful compile |
| `execute_run_configuration` | Launch the Unreal Editor | Use `get_run_configurations` to find the editor run config; only call after a successful build |
| `ue_get_logs` | Verify Live Coding / UBT compile outcome | `ue_get_logs(category="LogLiveCoding", pattern="patched\|failed", count=20)` — "Code successfully patched" = Hot Reload success |
| `xdebug_start_debugger_session` | Start a debug session against the launched editor | After the editor launches via `execute_run_configuration`, attach for crash investigation |
