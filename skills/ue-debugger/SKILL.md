---
name: ue:debugger
description: "Use when user reports crashes, bugs, unexpected behavior, nullptr errors, GC issues, assertion failures, performance problems, or asks to investigate/diagnose issues in UE projects. DO NOT TRIGGER for building (use ue:builder), log viewing only (use ue:console), writing new code (use ue:coder), or architecture questions (use ue:architect)."
allowed-tools: Bash, Read, Glob, Grep
argument-hint: "[bug description or crash info]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions (GC behavior, UPROPERTY semantics, assertion macros, crash dump format, Live Coding behavior), fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# UE Debugger — Structured Debugging Workflow

A systematic debugging skill for diagnosing and fixing crashes, bugs, performance issues, and unexpected behavior in Unreal Engine projects. Follows a disciplined Reproduce-Gather-Isolate-Diagnose-Fix-Verify cycle.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Reproduce** — gather crash info, call stack, logs, reproduction steps
2. **Diagnose** — isolate the root cause; read knowledge files for known patterns
3. **Fix** — apply the fix; make targeted changes only
4. **Verify** — confirm fix resolves the issue; build and test in PIE

## CRITICAL — Mistakes That Waste Hours

These rules were learned from production debugging sessions. Violating them leads to chasing phantom bugs, corrupting project state, or missing the real root cause entirely.

### 1. Don't Guess — Reproduce First
- NEVER start changing code based on a hypothesis alone
- Get a reliable reproduction case BEFORE investigating
- If it's intermittent, note frequency, timing, and conditions — these ARE the clues
- "I think it might be X" is not a diagnosis; a stack trace or log entry is

### 2. Check the OUTPUT LOG Before Anything Else
- The answer is almost always already in the log — `LogPython`, `LogBlueprintUserMessages`, `LogTemp`, `LogScript`
- Filter for `Error`, `Warning`, `Fatal` first
- Use `/ue:console --errors` to pull recent errors immediately
- Read log entries AROUND the error — context lines above often reveal the trigger

### 3. GC Crashes: Don't Store Raw Pointers to UObjects
- Raw `UObject*` members NOT marked `UPROPERTY()` are invisible to the garbage collector
- The GC WILL collect the object, leaving a dangling pointer that crashes on next access
- Fix: use `UPROPERTY()`, `TWeakObjectPtr<>`, or `TStrongObjectPtr<>` depending on ownership
- Symptom: crash in `FGCArrayPool`, `UObject::IsValidLowLevel()`, or access violation at 0xDDDDDDDD-ish addresses

### 4. Nullptr from GetWorld() in Constructors
- `GetWorld()` returns nullptr during CDO (Class Default Object) construction
- NEVER call `GetWorld()`, `GetGameInstance()`, or `GetOwner()` in constructors
- Move world-dependent initialization to `BeginPlay()`, `InitializeComponent()`, or `PostInitializeComponents()`
- Same applies to `UGameInstanceSubsystem::Initialize()` — the world may not be ready

### 5. Ensure() vs check() vs verify() — Know Which Crashes in Shipping
- `check(expr)` — fatal crash in Development/Debug, REMOVED in Shipping (code inside is stripped)
- `verify(expr)` — fatal crash in Development/Debug, expression STILL EXECUTES in Shipping but failure is silent
- `ensure(expr)` — logs callstack in Development/Debug, expression still executes in Shipping
- `checkSlow(expr)` — only active in Debug builds, stripped in Development AND Shipping
- NEVER put side effects inside `check()` — they vanish in Shipping builds

### 6. Hot Reload Corrupts Blueprint State
- Hot reload (Ctrl+Shift+B or Live Coding) is unreliable for structural changes (new UPROPERTY, new UFUNCTION, changed class hierarchy)
- Symptoms: Blueprint pins disconnected, default values reset, "accessed none" on valid references, phantom properties
- ALWAYS restart the editor after structural C++ changes
- Hot reload is acceptable ONLY for function body changes with no signature modifications

### 7. Packaging Crashes != Editor Crashes
- The editor uses uncooked assets; packaged builds use cooked assets — entirely different code paths
- `FSoftObjectPath` / `TSoftObjectPtr` references that work in-editor may fail in packages if the asset isn't in cook list
- Check the cook log (`Saved/Logs/<Project>-<Platform>.log`) for "failed to load" or "not found" errors
- Editor has more forgiving error recovery; packaged builds crash hard on the same issues

### 8. Timer Delegates to Destroyed Objects
- `FTimerManager::SetTimer` with a delegate bound to an object that gets destroyed = crash
- The timer fires, calls into freed memory
- Fix: clear timers in `EndPlay()` or `BeginDestroy()`, or use `IsValid()` / `IsValidLowLevel()` guards
- Same applies to `FTSTicker::AddTicker`, async task callbacks, and latent action callbacks

### 9. Order-of-Initialization — Don't Depend on Other Subsystems in Initialize()
- Subsystem `Initialize()` order is not guaranteed across different subsystem types
- `UGameInstanceSubsystem` initializes before `UWorldSubsystem`, but order WITHIN a type is undefined
- NEVER call `GetSubsystem<OtherSubsystem>()` in your `Initialize()` expecting it to be ready
- Defer cross-subsystem wiring to `PostInitialize()` or first-use lazy initialization

### 10. "Works in Editor, Crashes in Package"
- Uncooked references: assets referenced by path string but not in any cooked package
- Missing Primary Asset rules: `UPrimaryDataAsset` subclasses need `AssetManager` configuration
- `WITH_EDITOR` / `WITH_EDITORONLY_DATA` guards: code or data that only exists in editor builds
- Blueprint nativization differences (if enabled): nativized code may behave differently
- Always test packaged builds regularly — don't leave packaging validation to the end

## Debugging Workflow

Follow this cycle strictly. Do NOT skip steps.

### Step 1: Reproduce

```
Goal: Get a reliable way to trigger the issue.
```

1. Ask the user for exact reproduction steps if not provided
2. Check if the issue is deterministic or intermittent
3. Note the build configuration (Development/Debug/Shipping, Editor/Standalone/Package)
4. Try to reproduce with a minimal scenario — fewer actors, simpler level, no plugins
5. If intermittent, increase logging verbosity FIRST, then reproduce while capturing logs

### Step 2: Gather Information

```
Goal: Collect all available evidence before forming hypotheses.
```

**Logs — always check first via /ue:console:**
```
/ue:console --errors
/ue:console --warnings --filter "NullPtr"
/ue:console --warnings --filter "GarbageCollect"
/ue:console --script 'import unreal; unreal.log("Diagnostic ping")'
```

**Crash dumps:**
- Editor crashes: `Saved/Crashes/` directory — look for `.dmp` and `.log` files
- Packaged crashes: `AppData/Local/<Project>/Saved/Crashes/` on Windows
- The `Diagnostics.txt` or crash `.log` beside the minidump contains the callstack

**Runtime state inspection:**
```bash
# Check if an actor exists and its state
/ue:console --script '
import unreal
actors = unreal.EditorLevelLibrary.get_all_level_actors()
for a in actors:
    if "MyActor" in a.get_name():
        unreal.log(f"{a.get_name()} valid={a.is_valid()} class={a.get_class().get_name()}")
'

# Inspect a specific object's properties
/ue:console --script '
import unreal
obj = unreal.EditorAssetLibrary.load_asset("/Game/Path/To/Asset")
if obj:
    unreal.log(f"Class: {obj.get_class().get_name()}")
    for prop in dir(obj):
        if not prop.startswith("_"):
            try:
                val = getattr(obj, prop)
                if not callable(val):
                    unreal.log(f"  {prop} = {val}")
            except:
                pass
'
```

### Step 3: Isolate

```
Goal: Narrow down to the smallest code/data change that triggers the issue.
```

1. **Binary search through recent changes** — use `git log` and `git bisect` if the issue is a regression
2. **Disable systems one at a time** — comment out subsystem initialization, disable plugins
3. **Simplify the repro** — fewer actors, empty level, default GameMode
4. **Check if it's data or code** — does a fresh Blueprint work? Does a C++ equivalent work?
5. **Check if it's timing** — add delays, change tick groups, disable async loading

### Step 4: Diagnose

```
Goal: Identify the root cause with evidence.
```

- **Nullptr crash**: trace the pointer's lifecycle — where allocated, where invalidated, where accessed
- **GC crash**: check `UPROPERTY()` marking, weak pointer usage, ensure no raw UObject* in containers
- **Assertion**: read the assert message — it usually says exactly what's wrong
- **Performance**: use `stat` console commands (see knowledge/console-commands.md)
- **Blueprint error**: check the compiler results, look for "accessed none" in the log
- **Replication bug**: check `NetMode`, `HasAuthority()`, RPC execution context

### Step 5: Fix

```
Goal: Apply the minimal correct fix.
```

1. Fix the root cause, not the symptom
2. Add defensive checks only if the root cause genuinely allows nullptr (optional components, etc.)
3. If adding null checks as a band-aid, add a `UE_LOG` or `ensure()` so you catch it in dev builds
4. For GC fixes: add `UPROPERTY()` or switch to `TWeakObjectPtr<>` / `TStrongObjectPtr<>`
5. For timing fixes: move code to the correct lifecycle event (BeginPlay, PostInitialize, etc.)

### Step 6: Verify

```
Goal: Confirm the fix resolves the issue without introducing new problems.
```

```bash
# Rebuild and check for compile errors
/ue:console --build --wait
/ue:console --errors

# Re-run the reproduction steps
# Check that the original error/crash no longer occurs
# Test adjacent functionality that might be affected
```

1. Reproduce the original issue — confirm it no longer occurs
2. Check for new warnings/errors in the log
3. If the fix was for a packaged build issue, verify in a packaged build
4. If the fix was for multiplayer, test with both server and client

## Console Commands for Debugging

Use console commands via the editor console or `/ue:console --script` for automated diagnostics. See **knowledge/console-commands.md** for the full reference.

Quick reference for the most common debugging commands:

| Command | Purpose |
|---------|---------|
| `stat unit` | Frame time breakdown (Game, Draw, GPU, RHIT) |
| `stat fps` | Framerate display |
| `stat memory` | Memory usage overview |
| `stat game` | Gameplay thread timing |
| `stat scenerendering` | Render pass timing |
| `obj list` | List loaded UObjects by class |
| `obj gc` | Force garbage collection |
| `memreport -full` | Detailed memory report to file |
| `log LogCategory Verbose` | Set log category verbosity at runtime |
| `ShowDebug` | Toggle debug HUD categories |

## Crash Dump Analysis

When the editor or game crashes:

1. **Find the crash artifacts:**
   - `Saved/Crashes/` — organized by date
   - Each crash folder contains: `.dmp` (minidump), `.log` (crash log), `Diagnostics.txt`

2. **Read the crash log first** (not the minidump):
   - Look for `Fatal error` or `Assertion failed` lines
   - The callstack below the error shows the execution path
   - Module names in the callstack tell you if it's engine, project, or plugin code

3. **Common crash signatures:**
   - `EXCEPTION_ACCESS_VIOLATION reading address 0x00000000` — nullptr dereference
   - `EXCEPTION_ACCESS_VIOLATION reading address 0xDDDDDD..` — use-after-free (GC'd object)
   - `EXCEPTION_STACK_OVERFLOW` — infinite recursion
   - `Pure virtual function call` — calling a function on a partially-destroyed object
   - `Assertion failed: IsValid()` — operating on an invalid/pending-kill object

4. **For minidump analysis** — open `.dmp` in Visual Studio with project symbols, or use WinDbg

## Runtime Inspection via ue:console

Use **/ue:console** for runtime inspection. See the ue:console skill for the full transport API. Common modes:

```
/ue:console --health
/ue:console --errors
/ue:console --warnings --filter "GarbageCollect"
/ue:console --script 'import unreal; unreal.log("hello from debugger")'
/ue:console --file /tmp/diagnose.py
/ue:console --build --wait
```

## When to Delegate to Other Skills

| Situation | Delegate to |
|-----------|-------------|
| Need to read/analyze full log output | **ue:console** |
| Network replication issues, desync, RPCs | **ue:networking** |
| Build failures, compile errors, packaging | **ue:builder** |
| Need to write new code as part of the fix | **ue:coder** |
| Blueprint visual scripting issues | **ue:blueprint** |
| Material/shader debugging | **ue:material** |
| GAS-specific ability/effect bugs | **ue:gas** |
| Need to run editor automation scripts | **ue:console** |
| Architecture redesign needed as fix | **ue:architect** |

## Knowledge File Reference

| File | Contents |
|------|----------|
| knowledge/crash-patterns.md | Common crash signatures, GC issues, nullptr patterns, assertion failures, async loading crashes |
| knowledge/console-commands.md | Full console command reference: stat, show, log, memory, debug drawing, network, profiling |
| knowledge/diagnostic-workflows.md | Step-by-step procedures for 7 common issue types: startup crash, PIE crash, BP not firing, missing asset, package crash, performance drop, multiplayer desync |

see: knowledge/crash-patterns.md — Common crash patterns: nullptr, GC, stack overflow, assertions, Blueprint compilation, Slate/UMG, async loading
see: knowledge/console-commands.md — Console command reference: stat, show, log, memory, debug drawing, network debugging, profiling
see: knowledge/diagnostic-workflows.md — Step-by-step diagnostic procedures for 7 common issue categories
