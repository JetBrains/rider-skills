# UE Console — Launch Editor, AgentBridge, Logs

All communication with a running Unreal Editor goes through `ue-exec.sh` / `ue-exec.ps1`. Never use raw `curl`. The script handles port auto-detection, JSON encoding, and error parsing.

Scripts are in `../ue-console/scripts/`.

## Checklist

1. **Health check** — verify editor reachable; launch or restart if needed
2. **Execute** — run Python script, console command, or log query via `ue-exec`
3. **Read output** — parse results; surface errors to user

## 1. Launch / restart editor

| Platform | Script | Command |
|----------|--------|---------|
| macOS/Linux | `run-editor.sh` | `bash ../ue-console/scripts/run-editor.sh` |
| Windows (PowerShell) | `run-editor.ps1` | `powershell -ExecutionPolicy Bypass -File "..\ue-console\scripts\run-editor.ps1"` |
| Windows (Git Bash) | `run-editor.sh` | same as macOS/Linux |
| Windows (cmd) | `run-editor.bat` | `..\ue-console\scripts\run-editor.bat` |

```bash
bash ../ue-console/scripts/run-editor.sh                        # launch
bash ../ue-console/scripts/run-editor.sh --restart              # kill + relaunch
bash ../ue-console/scripts/run-editor.sh --project /path/Game.uproject
```

Auto-detects `.uproject`, reads `EngineAssociation`, prevents duplicate instances. **Only launch after a successful build.**

| Error | Fix |
|-------|-----|
| "No .uproject found" | Provide `--project <path>` or cd into project |
| "Could not determine EngineAssociation" | Check `.uproject` has `"EngineAssociation": "X.Y"` |
| "Unreal Engine root not found" | Set `UE_ROOT` env var |
| "Editor is already running" | Use `--restart` |

## 2. Execute Python / AgentBridge

```bash
UE_EXEC="bash ../ue-console/scripts/ue-exec.sh"

# Connectivity
$UE_EXEC --health

# Execute Python
$UE_EXEC --script 'import unreal; print("Hello UE")'
$UE_EXEC --file /path/to/script.py
$UE_EXEC --batch /tmp/batch.json [--stop-on-error]

# PIE control
$UE_EXEC --play      # Play in Selected Viewport
$UE_EXEC --stop      # Stop game

# Build
$UE_EXEC --build           # hot reload (async)
$UE_EXEC --build --wait    # wait for completion
```

**All AgentBridge endpoints are under `/agent/` prefix** (`/agent/health`, `/agent/execute`). There is NO `/health` or `/api/v1/...` endpoint.

## 3. Read / filter logs

```bash
$UE_EXEC --logs                                      # last 100, all severities
$UE_EXEC --errors                                    # errors only
$UE_EXEC --warnings                                  # warnings + errors
$UE_EXEC --logs --lines 200 --filter "Material" --severity warning
$UE_EXEC --logs --json                               # raw JSON
$UE_EXEC --logs --categories                         # show [LogCategory] column
```

### Analysis workflow

1. Start with `--errors`
2. Widen to `--warnings`
3. Filter by subsystem: `--filter "ShaderCompiler"`, `--filter "LogPython"`
4. Increase window: `--lines 200`

## Knowledge files (in `../ue-console/knowledge/`)

Extensive console command references per AI module, rendering, gameplay tags, and more are organized in subdirectories under `../ue-console/knowledge/`.

---

## MCP tools (preferred over ue-exec scripts)

When Rider + RiderLink are connected, use MCP tools instead of `ue-exec.sh` — no port detection, no shell dependency, structured results.

| Tool | Purpose | Equivalent `ue-exec` flag |
|------|---------|--------------------------|
| `ue_health` | Check RiderLink connection status | `--health` |
| `ue_status` | One-stop health + PIE state + recent logs (preferred) | `--health` + log query |
| `ue_execute_python` | Execute Python in the editor game thread | `--script` / `--file` / `--batch` |
| `ue_get_logs` | Stream logs with category / verbosity / pattern filters | `--logs` / `--errors` / `--warnings` / `--filter` |
| `ue_play` | Control PIE: `play` / `pause` / `resume` / `stop` | `--play` / `--stop` |

### When `ue-exec` is still needed

- Editor not connected to Rider (RiderLink not installed or disconnected).
- Running headless / CI where the IDE process is absent.
- Batch file execution with `--batch` and `--stop-on-error` semantics for long migration scripts (prefer `ue_execute_python { scripts: [...] }` instead when possible).
