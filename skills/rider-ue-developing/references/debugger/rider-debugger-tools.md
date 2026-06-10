# Rider MCP Debugger Tools — Complete Reference

Source of truth: `.claude/rider-mcp-tools.json`. All input schemas verified from that file.

---

## Tool Index

| Tool | Purpose |
|------|---------|
| `xdebug_get_debugger_status` | List all active sessions and their state |
| `xdebug_start_debugger_session` | Launch a debug session by config name or file+line |
| `xdebug_control_session` | Step, resume, pause, stop, wait, drain events |
| `xdebug_set_breakpoint` | Create or update a breakpoint |
| `xdebug_list_breakpoints` | List breakpoints (all or per-file) |
| `xdebug_remove_breakpoint` | Remove breakpoints by ID, location, or owner |
| `xdebug_run_to_line` | Run to a specific line without a permanent breakpoint |
| `xdebug_get_threads` | List threads (paginated) |
| `xdebug_get_stack` | Call stack for a thread |
| `xdebug_get_frame_values` | Locals / params / fields for a frame |
| `xdebug_get_value_by_path` | Drill into nested value by path |
| `xdebug_evaluate_expression` | Evaluate raw expression in current frame |
| `xdebug_set_variable` | Mutate a value in current frame |
| `xdebug_attach_to_process` | Attach to a running process by PID |
| `xdebug_start_mixed_mode_debug` | Attach in mixed managed+native mode by PID |
| `xdebug_memory_dump` | Load a .dmp / core file for post-mortem debugging |
| `attach_to_process` | Rider-native attach (managed .NET only) |
| `ignore_exception` | Stop breaking on a specific .NET exception type |

---

## Session Lifecycle

### `xdebug_get_debugger_status`

**No required params.** Always call this first to detect orphan sessions.

```
IN:  rootFolder
OUT: sessions[]{id, name, state, runConfigurationName, breakpointsMuted, currentPosition?}
     activeSessionId?
```

`state` values: `running` | `paused` | `stopped`

**Rules:**
- Always call before starting a new session to detect orphans.
- If an orphan exists for the same config, call `xdebug_control_session(STOP)` before launching.

---

### `xdebug_start_debugger_session`

Launch by **config name** OR **filePath + line** (mutually exclusive).

```
IN:  configurationName             (config mode)
     filePath + line               (code-location mode — must be a runnable entry point)
     timeout          ms, default 60000
     graceWaitMs      ms, default 2000
     programArguments override (only if supportsDynamicLaunchOverrides=true)
     workingDirectory override (only if supportsDynamicLaunchOverrides=true)
     envs             object override (only if supportsDynamicLaunchOverrides=true)
     rootFolder

OUT: sessionId, name, state, runConfigurationName, breakpointsMuted, exitCode?, output, fullOutputPath?
```

**Rules:**
- **Set at least one breakpoint before starting.** Without a breakpoint the process runs to completion.
- Do NOT pass launch overrides unless `get_run_configurations` reports `supportsDynamicLaunchOverrides=true`.
- After start, call `xdebug_control_session(WAIT_FOR_PAUSE)` to land at first suspension.

---

### `xdebug_control_session`

```
IN:  action (required): STEP_INTO | STEP_OVER | STEP_OUT | RESUME | PAUSE | STOP | WAIT_FOR_PAUSE | DRAIN_EVENTS
     sessionId
     timeout      ms — STEP_*/PAUSE: 5000-15000; WAIT_FOR_PAUSE: 30000-120000
     eventsLimit  default 100
     rootFolder

OUT: status (running|paused|stopped)
     newPosition?{filePath, line, column?}
     frameValues?   (same format as xdebug_get_frame_values depth=0, only when paused)
     breakpointsMuted
     breakpointErrorsTail   (JVM only)
     tracepointOutputsTail  (JVM only, DRAIN_EVENTS only)
     message?
```

**Rules:**
- `STEP_*` and `RESUME` require a **suspended** session.
- After `RESUME`, always follow with `WAIT_FOR_PAUSE`.
- `DRAIN_EVENTS` tracepoint output is **JVM only** — empty on C++/native.
- `breakpointErrorsTail` also empty on non-JVM runtimes — invalid conditions surface as silent misses.

---

## Breakpoints

### `xdebug_set_breakpoint`

**Two mutually exclusive modes:**

**Location mode** — create new breakpoint:
```
IN:  filePath + line   (required, relative to project root, 1-based line)
     condition         string expression evaluated in target language — null clears it
     isLogMessage      log hit position (JVM only, tracepoint)
     isLogStack        log stack trace (JVM only, tracepoint)
     temporary         auto-remove after first hit, default false
     suspendPolicy     ALL (default) | THREAD | NONE
     enabled           default true
     sessionId
     rootFolder
```

**ID mode** — update existing breakpoint:
```
IN:  breakpointId      (from prior set_breakpoint or list_breakpoints response)
     filePath + line   optional — relocates the breakpoint if provided
     + same optional fields as location mode
```

**Mute-only mode** — dedicated call, do not mix with other params:
```
IN:  sessionId + breakpointsMuted (boolean)
```

```
OUT: breakpointId
     added{id, type, file, line, enabled, owner, condition, isLogMessage, isLogStack,
           temporary, suspendPolicy, hitCount}
     lineText       (excerpt of actual source line — confirm placement before resuming)
     totalBreakpoints
     breakpointsMuted
     message?
```

### CRITICAL: `hitCount` is OUTPUT ONLY

**`xdebug_set_breakpoint` has NO `hitCount` or `hitCountCondition` input parameter.**
- The `hitCount` field in the response is **read-only** — it reports how many times the breakpoint has been hit so far (starts at 0).
- Parameters like `--hitCount 3` or `--hitCountCondition EQUAL` are **silently ignored** — the breakpoint is created without any hit-count filter.
- Rider's hit-count condition UI is not exposed through this MCP tool.

### Tracepoint pattern (`isLogMessage`/`isLogStack` + `suspendPolicy=NONE`)

Logs hit position or stack without pausing. **JVM only** — output available via `DRAIN_EVENTS`. On C++/native these flags are accepted but produce no output.

---

### `xdebug_list_breakpoints`

```
IN:  filePath?     filter to one file
     sessionId?
     rootFolder

OUT: breakpoints[]{id, type, file, line, enabled, owner, condition,
                   isLogMessage, isLogStack, temporary, suspendPolicy, hitCount}
     totalCount, enabledCount
     breakpointsMuted?
```

`owner`: `agent` = set by MCP toolset | `user` = set manually in Rider.
`hitCount`: current hit count (read-only, 0 when unavailable).

**Call this before every `RESUME`** to confirm at least one enabled breakpoint will be reached.

---

### `xdebug_remove_breakpoint`

```
IN:  breakpointId?    remove specific breakpoint
     filePath + line? remove by location
     owner            agent (default) | user
     rootFolder

OUT: removed (bool), removedCount, breakpointId?, totalBreakpoints, message?
```

**Rules:**
- `owner` defaults to `agent` — never touches user breakpoints unless explicitly passed `owner=user`.
- To clear everything: call twice — once `owner=agent`, once `owner=user`.
- Idempotent: removing a non-existent BP returns `removed=false`.

---

### `xdebug_run_to_line`

One-shot cursor-to-line without a permanent breakpoint. Session must be suspended.

```
IN:  filePath + line (required)
     sessionId
     timeout          ms, default 30000
     rootFolder

OUT: sessionId, outcome (paused|stopped|timeout), currentPosition?{filePath, line, column?}
```

---

## Inspection (session must be paused)

### `xdebug_get_threads`

```
IN:  sessionId, limit?, offset?, rootFolder
OUT: threads[]{id, name, state, ...}, totalCount, hasMore
```

`id` here is the **display name**, not a numeric ID — pass it as `threadId` in other tools.

---

### `xdebug_get_stack`

```
IN:  sessionId, threadId? (defaults to active thread), limit? (default 200), offset?, rootFolder
OUT: frames[]{index, presentation, file?, line?, isCurrent}, totalCount
```

Use `index` as `frameIndex` in subsequent inspection calls. **Never reuse frameIndex after RESUME/STEP_*.**

---

### `xdebug_get_frame_values`

```
IN:  sessionId, frameIndex? (default 0 = top), depth? (default 0), rootFolder
OUT: text tree — nodes with children marked with +
```

`depth=0` → variable names and values only.
`depth=1+` → expand children N levels deep.

---

### `xdebug_get_value_by_path`

```
IN:  sessionId, frameIndex?, path[] (e.g. ["myObj","field","subField"] or ["items","[0]","name"]), rootFolder
OUT: value text tree
```

Use exact node names from the current `get_frame_values` output. Array elements are typically `"[0]"`, `"[1]"`, etc.

---

### `xdebug_evaluate_expression`

```
IN:  sessionId, frameIndex?, expression (raw source text — no JSON escaping), depth? (default 0), rootFolder
OUT: evaluated value tree
```

Pass the expression **exactly as you would type it in the debugger watch window** — no escaping.

---

### `xdebug_set_variable`

```
IN:  sessionId, frameIndex?, path[], newValue (raw assignable expression), rootFolder
OUT: result, message?
```

Re-read via `get_value_by_path` after mutation to confirm.

---

## Attach & Dump

### `xdebug_attach_to_process`

Attach to an already-running local process. Auto-detects runtime (managed .NET, native C++/UE, Mono).

```
IN:  pid (required)
     debuggerKind?   case-insensitive substring: "Native", ".NET", "Mono", "Core", "Mixed"
     rootFolder

OUT: attached (bool), pid, executable, debuggerDisplayName, availableDebuggers?[]
```

When `debuggerKind` doesn't match exactly one debugger, `availableDebuggers` lists choices — re-call with a narrower `debuggerKind`.

**UE use case:** attach to a running `UnrealEditor-Win64-DebugGame.exe` PID with `debuggerKind="Native"`.

---

### `xdebug_start_mixed_mode_debug`

Attach in **managed + native** mixed mode. Targets the debugger whose name contains `"Mixed"`.

```
IN:  pid (required), rootFolder
OUT: attached, pid, executable, debuggerDisplayName, availableDebuggers?[]
```

Falls back with `availableDebuggers` if no mixed-mode debugger found. Use `xdebug_attach_to_process` with explicit `debuggerKind` as fallback.

---

### `xdebug_memory_dump`

Post-mortem debugging from a crash dump.

```
IN:  dumpFilePath (absolute path, required)
     providerHint?   case-insensitive substring of dump-provider description
     rootFolder

OUT: started (bool), dumpFilePath, configurationName, configurationType
```

Does **not** capture a dump from a live session — for that, use OS tools (`ProcDump`, WER, etc.).

---

## Platform / Backend Limitations

| Feature | JVM (Java/Kotlin) | C++ / Native UE | .NET / C# |
|---------|------------------|-----------------|-----------|
| `condition` breakpoints | ✓ (errors via `breakpointErrorsTail`) | ✓ (errors silent) | ✓ |
| `isLogMessage` / `isLogStack` tracepoints | ✓ (via `DRAIN_EVENTS`) | accepted, no output | ✓ |
| `hitCount` input filter | ✗ not in schema | ✗ not in schema | ✗ not in schema |
| `breakpointErrorsTail` | ✓ | empty | ✓ |
| `tracepointOutputsTail` | ✓ (`DRAIN_EVENTS`) | empty | empty |

---

## Use Cases

### UC-1: Basic breakpoint and inspect

```
1. xdebug_get_debugger_status          → check for orphan sessions
2. xdebug_list_breakpoints             → surface user breakpoints that will interfere
3. xdebug_set_breakpoint filePath+line → create breakpoint, confirm lineText
4. xdebug_start_debugger_session configurationName
5. xdebug_control_session WAIT_FOR_PAUSE timeout=60000
6. xdebug_get_stack
7. xdebug_get_frame_values frameIndex=0 depth=1
8. xdebug_evaluate_expression "someVar->field"
9. xdebug_control_session RESUME → xdebug_control_session WAIT_FOR_PAUSE
10. xdebug_remove_breakpoint owner=agent
11. xdebug_control_session STOP
```

---

### UC-2: Conditional breakpoint (C++ expression)

```
xdebug_set_breakpoint
  filePath="Source/DemoPro57/DemoPro57Character.cpp"
  line=113
  condition="JumpCount > 5"    ← valid C++ expression in the frame
```

Condition errors are **silent on C++** — if the session never pauses, use `xdebug_evaluate_expression` while paused to test the expression manually.

---

### UC-3: Hit-count "stop on Nth call" — MCP workaround

`xdebug_set_breakpoint` has **no hitCount input**. The MCP-only workaround for "break on 3rd invocation":

**Option A — Resume-through (recommended for small N):**
```
1. Set breakpoint normally (no condition)
2. RESUME → WAIT_FOR_PAUSE   (hit 1 — resume immediately)
3. RESUME → WAIT_FOR_PAUSE   (hit 2 — resume immediately)
4. Inspect normally on hit 3
```

**Option B — Temporary + re-set:**
```
1. Set breakpoint with suspendPolicy=NONE, isLogMessage=true (tracepoint)
   Note: tracepoint output only on JVM — on C++ this is a silent no-op pass-through
2. For C++: use Option A instead
```

**Option C — Set hit-count condition in Rider UI:**
Right-click breakpoint dot → More → Edit breakpoint → Hit count = 3, Equal to.
This is outside MCP scope but is the only way to get a real hit-count filter on C++.

---

### UC-4: Attach to running UE Editor

```
1. Get PID: ps or Task Manager — find UnrealEditor-Win64-DebugGame.exe
2. xdebug_attach_to_process pid=<PID> debuggerKind="Native"
3. xdebug_set_breakpoint filePath+line
4. xdebug_control_session WAIT_FOR_PAUSE timeout=120000
```

---

### UC-5: Tracepoint (log without pausing) — JVM only

```
xdebug_set_breakpoint
  filePath+line
  isLogMessage=true
  isLogStack=false
  suspendPolicy=NONE

→ xdebug_control_session RESUME
→ ... (game runs, tracepoints fire) ...
→ xdebug_control_session DRAIN_EVENTS
  → tracepointOutputsTail contains log lines
```

**C++ note:** `suspendPolicy=NONE` accepted but tracepoint output will be empty. Use `UE_LOG` statements in code instead.

---

### UC-6: Post-mortem crash dump

```
xdebug_memory_dump dumpFilePath="D:/Saved/Crashes/MyGame_2026.dmp"
→ opens dump in Rider debugger
→ xdebug_get_stack          (see crash callstack)
→ xdebug_get_frame_values   (inspect locals at crash site)
```

---

## Critical Rules (summary)

1. **Always call `xdebug_get_debugger_status` first** — detect orphans before starting.
2. **Always set a breakpoint before `xdebug_start_debugger_session`** — no BP = runs to completion silently.
3. **After `RESUME`, always call `WAIT_FOR_PAUSE`** before inspecting.
4. **Never reuse `frameIndex` or `path` after RESUME/STEP_*** — always re-query `get_stack`.
5. **`hitCount` is output-only** — passing `hitCount`/`hitCountCondition` as inputs is silently ignored.
6. **`breakpointsMuted` requires a dedicated call** — do not combine with filePath/line/condition.
7. **`condition` errors are silent on C++/native** — test expressions with `evaluate_expression` while paused.
8. **Tracepoints (`isLogMessage`/`isLogStack`) work only on JVM** — on C++ use `UE_LOG` in code.
9. **`xdebug_remove_breakpoint` only removes `agent` breakpoints by default** — pass `owner=user` explicitly to touch user breakpoints.
10. **`DRAIN_EVENTS` tracepoint output is JVM only** — `tracepointOutputsTail` empty on C++.
