---
name: ue:console
description: "Use when user wants to launch/restart the editor, run Python in the editor, read/filter output logs, execute console commands via AgentBridge, check editor health, control PIE, look up UE Python API types, or inspect runtime state. DO NOT TRIGGER for writing new game code (use ue:coder), building/compiling C++ (use ue:builder), debugging a specific crash (use ue:debugger), or deciding what to automate (use ue:editor)."
allowed-tools: Bash, Read
argument-hint: "[--launch|--restart|--health|--errors|--logs|--script '<python>'|--file <path>]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Knowledge Retrieval

Before answering:
1. Resolve the `unrealengine` library in Context7 (see `../_shared/context7-protocol.md`)
2. Fetch the section relevant to this query
3. Merge with local knowledge files — Context7 wins on version-specific details, local knowledge wins on workflow/patterns

# UE Console

Single skill for all editor interaction: launching the editor, executing Python via AgentBridge, reading logs, and inspecting runtime state.

All communication with a running Unreal Editor goes through `ue-exec.sh`. Never use raw `curl`. The script handles port auto-detection, JSON encoding, and error parsing.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Health check** — verify editor is reachable; launch or restart if needed
2. **Execute** — run Python script, console command, or log query via `ue-exec.sh`
3. **Read output** — parse and report results; surface errors to user

---

## 1. Launch / Restart Editor

Choose the script for the platform:

| Platform | Script | Command |
|----------|--------|---------|
| macOS/Linux | `run-editor.sh` | `bash ${CLAUDE_SKILL_DIR}/scripts/run-editor.sh` |
| Windows (PowerShell) | `run-editor.ps1` | `powershell -ExecutionPolicy Bypass -File "${CLAUDE_SKILL_DIR}\scripts\run-editor.ps1"` |
| Windows (Git Bash) | `run-editor.sh` | `bash ${CLAUDE_SKILL_DIR}/scripts/run-editor.sh` |
| Windows (cmd) | `run-editor.bat` | `${CLAUDE_SKILL_DIR}\scripts\run-editor.bat` |

```bash
bash ${CLAUDE_SKILL_DIR}/scripts/run-editor.sh                        # launch
bash ${CLAUDE_SKILL_DIR}/scripts/run-editor.sh --restart              # kill + relaunch
bash ${CLAUDE_SKILL_DIR}/scripts/run-editor.sh --project /path/to/Game.uproject
```

The script auto-detects the `.uproject` file, reads `EngineAssociation`, finds the engine, and prevents duplicate instances.

**CRITICAL:** Only launch after a successful build. If the preceding build failed, fix errors first.

### Error Recovery

| Error | Fix |
|-------|-----|
| "No .uproject found" | Provide `--project <path>` or cd into the project |
| "Could not determine EngineAssociation" | Check `.uproject` contains `"EngineAssociation": "X.Y"` |
| "Unreal Engine root not found" | Set `UE_ROOT`, e.g. `export UE_ROOT="/Users/Shared/Epic Games/UE_5.6"` |
| "Editor is already running" | Use `--restart` |

---

## 2. Execute Python / AgentBridge

```bash
UE_EXEC="bash ${CLAUDE_SKILL_DIR}/scripts/ue-exec.sh"

# Connectivity
$UE_EXEC --health

# Execute Python
$UE_EXEC --script 'import unreal; print("Hello UE")'
$UE_EXEC --file /path/to/script.py
$UE_EXEC --batch /tmp/batch.json [--stop-on-error]

# PIE control
$UE_EXEC --play                                         # Play in Selected Viewport
$UE_EXEC --stop                                         # Stop game
$UE_EXEC --file ${CLAUDE_SKILL_DIR}/scripts/simulate.py # Simulate In Editor

# Build
$UE_EXEC --build                   # hot reload (async)
$UE_EXEC --build --wait            # wait for completion

# Info
$UE_EXEC --devices                 # list target devices
$UE_EXEC --configs                 # list build configurations
```

**All AgentBridge endpoints are under `/agent/` prefix** (e.g., `/agent/health`, `/agent/execute`). There is NO `/health` or `/api/v1/...` endpoint.

---

## 3. Read / Filter Logs

```bash
$UE_EXEC --logs                              # last 100, all severities
$UE_EXEC --errors                            # errors only
$UE_EXEC --warnings                          # warnings + errors
$UE_EXEC --logs --lines 200 --filter "Material" --severity warning
$UE_EXEC --logs --json                       # raw JSON output
$UE_EXEC --logs --categories                 # show [LogCategory] column
```

### Log Parameters

| Flag | Description | Default |
|------|-------------|---------|
| `--logs` | Fetch logs (all severities) | |
| `--errors` | Shortcut for `--logs --severity error` | |
| `--warnings` | Shortcut for `--logs --severity warning` | |
| `--lines N` | Max entries to return | 100 |
| `--filter PATTERN` | Substring match in log messages | *(none)* |
| `--severity LEVEL` | Min severity: `error`, `warning`, `log`, `all` | `all` |
| `--json` | Output raw JSON | |
| `--categories` | Show `[LogCategory]` column | |

### Analysis Workflow

1. **Start with errors**: `--errors`
2. **Widen to warnings**: `--warnings`
3. **Filter by subsystem**: `--filter "ShaderCompiler"`, `--filter "LogPython"`, `--filter "LogNet"`
4. **Increase window**: `--lines 200` for older events

### Common Diagnostic Patterns

| Question | Command |
|----------|---------|
| "Why did PIE crash?" | `--errors --lines 50` |
| "Any warnings about my asset?" | `--warnings --filter "BP_MyActor"` |
| "Did the shader compile?" | `--logs --filter "ShaderCompiler" --lines 20` |
| "Python script exceptions?" | `--errors --filter "LogPython"` |
| "What's going on with networking?" | `--logs --filter "LogNet" --lines 100` |

**Note:** Logs come from an in-memory ring buffer (last ~2000 entries). For logs before editor started, read the file directly: `Saved/Logs/*.log`

---

## Knowledge Files

All knowledge files are in `${CLAUDE_SKILL_DIR}/knowledge/`. The UE Python API reference covers 746 modules, 14584 types across 21 domains (AI, animation, audio, core, data, editor, effects, geometry, interchange, landscape, mass, materials, media, metahuman, misc, networking, PCG, physics, rendering, RigVM, UI, virtual production).

| File/Dir | Contents |
|----------|----------|
| `knowledge/_index.md` | Master API index across all 21 domains |
| `knowledge/<domain>/` | Per-domain type and function reference |
