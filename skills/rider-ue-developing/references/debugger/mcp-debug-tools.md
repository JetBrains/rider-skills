# rider-ue-developing:debugger — Rider MCP Debug Tools

Use these tools when the UE5 editor or game is running in **Debug Editor** (or any debug-attached process). They drive the Rider C++ debugger — breakpoints, stepping, variable inspection — without leaving the chat.

## Tool reference

| Tool | Purpose | When to use |
|------|---------|-------------|
| `get_run_configurations` | List all Rider run configs | Find the "Debug Editor" config name before launching |
| `execute_run_configuration` | Launch a run config (with optional debugger attach) | Start UE editor in Debug mode via Rider |
| `attach_to_process` | Attach Rider debugger to a running process | UE editor already running; attach without restarting |
| `xdebug_start_debugger_session` | Start a debug session on a process | Begin interactive debugging |
| `xdebug_start_mixed_mode_debug` | Start session for mixed managed+native | Rarely needed for UE5 C++ |
| `xdebug_get_debugger_status` | Query session state | Check if session is paused / running / stopped |
| `xdebug_control_session` | Pause / resume / step / terminate | Drive execution after a breakpoint hits |
| `xdebug_set_breakpoint` | Set breakpoint (with optional condition/hit-count) | Stop at specific C++ line |
| `xdebug_remove_breakpoint` | Remove a breakpoint by ID | Clean up after diagnosis |
| `xdebug_list_breakpoints` | List all active breakpoints | Audit what's set |
| `xdebug_run_to_line` | Run until a specific line (one-shot, no persistent BP) | Jump to a known point without cluttering breakpoints |
| `xdebug_get_stack` | Get current call stack | Identify crash site or call chain |
| `xdebug_get_threads` | List all threads | Find game thread vs render thread during a hang |
| `xdebug_get_frame_values` | Get all locals/params in current frame | Inspect state when paused at a breakpoint |
| `xdebug_get_value_by_path` | Inspect a specific variable or nested member | Deep-dive into a UObject field |
| `xdebug_set_variable` | Modify a variable at runtime | Test a fix without recompiling |
| `xdebug_evaluate_expression` | Evaluate arbitrary C++ expression in current context | Call functions, compute values while paused |
| `xdebug_memory_dump` | Dump raw memory at address | Low-level corruption diagnosis |

All tools are called via:
```
mcp__rider__execute_tool --command "<tool> --param value ..."
```

---

## When to use debug tools vs plain PIE

| Scenario | Approach |
|----------|----------|
| AI logic not behaving (movement, states) | Set breakpoint in the C++ logic (`Think()`, `OnPossess`, etc.), inspect at runtime |
| Animation not playing | Check CharacterMovementComponent velocity at breakpoint; verify `bOrientRotationToMovement` live |
| Crash / assert | `xdebug_get_stack` immediately to find the callsite |
| Wrong property value at runtime | `xdebug_evaluate_expression` to query CDO or actor property while paused |
| Want to test a fix without recompiling | `xdebug_set_variable` to override a value mid-session |
| Pure log / behavioral check — no crash | `ue_get_logs` + `LogBotAI` category filter is enough; no debugger needed |

---

## Standard UE5 C++ debug workflow

### 1 — Launch in Debug Editor

```
get_run_configurations
```
Find the config named `DemoPro57 (Debug Editor)` (or similar). Then:

```
execute_run_configuration --configName "DemoPro57 (Debug Editor)" --debug true
```

Or if the editor is already running:
```
attach_to_process --processId <pid>
```
Get PID from `ue_status` → `processId`.

### 2 — Set a breakpoint

```
xdebug_set_breakpoint --filePath "Source/DemoPro57/AI/BotAIController.cpp" --lineNumber 42
```

Conditional (only when bot is close):
```
xdebug_set_breakpoint --filePath "Source/DemoPro57/AI/BotAIController.cpp" --lineNumber 42 --condition "DistSq <= 90000.f"
```

### 3 — Start PIE and trigger the code path

```
ue_play --action play --mode viewport --players 1 --netMode standalone --runUnderOneProcess true --spawnAtPlayerStart true
```

Walk toward the bot to trigger `Think()`.

### 4 — When the breakpoint hits: inspect state

```
xdebug_get_stack --sessionId <id>
xdebug_get_frame_values --sessionId <id> --frameId 0
xdebug_get_value_by_path --sessionId <id> --variablePath "locals.DistSq"
xdebug_evaluate_expression --sessionId <id> --expression "GetPawn()->GetActorLocation().ToString()"
```

### 5 — Step through

```
xdebug_control_session --sessionId <id> --command step_over
xdebug_control_session --sessionId <id> --command step_into
xdebug_control_session --sessionId <id> --command step_out
xdebug_control_session --sessionId <id> --command resume
```

### 6 — Hot-patch a value and resume

```
xdebug_set_variable --sessionId <id> --variablePath "locals.FollowRadius" --newValue "600.0"
xdebug_control_session --sessionId <id> --command resume
```

---

## UE5-specific debug recipes

### Verify CharacterMovementComponent orientation at runtime

After breakpoint in `Think()`:
```
xdebug_evaluate_expression --expression "Cast<ACharacter>(GetPawn())->GetCharacterMovement()->bOrientRotationToMovement"
xdebug_evaluate_expression --expression "Cast<ACharacter>(GetPawn())->bUseControllerRotationYaw"
```

### Check animation state

```
xdebug_evaluate_expression --expression "Cast<ACharacter>(GetPawn())->GetMesh()->GetAnimInstance()->IsAnyMontagePlaying()"
xdebug_evaluate_expression --expression "Cast<ACharacter>(GetPawn())->GetVelocity().Size()"
```

### Inspect AI blackboard / move request

```
xdebug_evaluate_expression --expression "GetMoveStatus()"
xdebug_evaluate_expression --expression "GetCurrentMoveInput().ToString()"
```

---

## Critical rules

- **Always check `ue_status` → `processId` before `attach_to_process`** — the PID changes each editor restart.
- **Debug Editor runs ~3× slower than Development** — only use it when you need interactive stepping. For log-only diagnosis, stay in Development and use `ue_get_logs`.
- **`xdebug_evaluate_expression` blocks the game thread** — keep expressions short; avoid calling functions with side effects.
- **Clear breakpoints after diagnosis** — `xdebug_remove_breakpoint` or `xdebug_list_breakpoints` + bulk remove. Stale breakpoints in hot paths (like `Think()` at 10 Hz) will freeze the editor every 100 ms.
- **PIE-only bugs**: If the bug only appears in PIE (not in editor), the debugger is the right tool — log statements may not survive the timing difference.

---

## Pitfalls

| # | Mistake | What happens | Fix |
|---|---------|--------------|-----|
| 1 | **Breakpoint on a per-frame function (`Tick`, `Update`, timer at 10+ Hz)** | The game pauses on every frame resume — appears frozen. Each `xdebug_control_session resume` immediately hits the next frame's breakpoint. | Disable the breakpoint after the first hit: `xdebug_set_breakpoint --breakpointId <id> --enabled false`. Better: use a conditional breakpoint so it only fires when the interesting state is true (e.g. `Speed > 0.f`). |
| 2 | **`evaluate_expression` reports `'this' is not available, possibly due to compiler optimizations`** | Development-build compiler inlines or elides short-lived local variables. The variable exists in source but has no debug info. | Run `xdebug_control_session step_over` once — that materialises local variables in the frame. Then use `xdebug_get_frame_values` to read them. For persistent full visibility, rebuild the target in **Debug Editor** configuration. |
| 3 | **Treating `0x80000003 STATUS_BREAKPOINT` + `IsEnsure:true` as a fatal crash** | An `ensure()` failure with a debugger attached calls `__debugbreak()`, which pauses execution at the ensure site. The process is NOT crashed; it is paused and fully resumable. | Check `CrashContext.runtime-xml → IsEnsure`. If `true`, resume with `xdebug_control_session --action resume` (or dismiss the crash reporter dialog and resume). Do not terminate the session. See **Workflow 8** in `diagnostic-workflows.md` for the full disambiguation procedure. |
| 4 | **Assuming a crash dump is from the current editor session** | The crash reporter can show dumps from previous sessions. Acting on a stale dump wastes time debugging a problem that no longer exists (or never existed in the current run). | Read `Saved/Crashes/<GUID>/CrashContext.runtime-xml → ProcessId`. Compare to `ue_status → processId`. If they differ, the dump is from a previous session — dismiss the reporter and continue. |
