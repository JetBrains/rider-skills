# Diagnostic Workflows

Step-by-step procedures for diagnosing common Unreal Engine issues. Each workflow follows the Reproduce-Gather-Isolate-Diagnose-Fix pattern.

## Workflow 1: Editor Crashes on Startup

**Symptom:** Editor closes immediately after splash screen, or crashes during project load.

### Step 1 — Find the crash log
```
Saved/Logs/<ProjectName>.log          — Main editor log (even if editor crashed)
Saved/Crashes/<CrashGUID>/            — Crash dump + diagnostics
%LOCALAPPDATA%/UnrealEngine/          — Engine-level crash data (Windows)
```

Read the log file from the END — the last 50-100 lines usually contain the fatal error.

### Step 2 — Common causes and checks

| Log Pattern | Cause | Fix |
|-------------|-------|-----|
| `Failed to load module` | Missing plugin DLL / incompatible plugin | Remove offending plugin from .uproject, rebuild |
| `Assertion failed` in `FPackageName::` | Corrupted or circular asset reference | Delete `Saved/` and `Intermediate/`, rebuild |
| `Out of memory` | Project too large for available RAM | Close other apps, increase virtual memory |
| `D3D device lost` / `GPU crash` | GPU driver issue | Update GPU drivers, disable ray tracing in config |
| `ShaderCompileWorker` crash | Corrupted shader cache | Delete `Saved/ShaderCache/` and `DerivedDataCache/` |

### Step 3 — Safe-mode launch
```bash
# Launch with minimal plugins
UnrealEditor.exe MyProject.uproject -NoPlugins

# Launch without loading last level
UnrealEditor.exe MyProject.uproject -NoLoadStartupPackages

# Launch with verbose logging
UnrealEditor.exe MyProject.uproject -LogCmds="Global Verbose" -Verbose
```

### Step 4 — Nuclear option (if nothing else works)
1. Delete `Saved/`, `Intermediate/`, `DerivedDataCache/` (NOT `Content/` or `Source/`)
2. Regenerate project files
3. Full rebuild from clean state
4. If still crashing: bisect plugins by disabling half at a time in `.uproject`

---

## Workflow 2: PIE Crashes After N Seconds

**Symptom:** Play-In-Editor starts fine but crashes consistently after some time (10s, 30s, 1min).

### Step 1 — Enable full logging before reproducing
Increase log verbosity for common crash sources via `ue_execute_python` tool:

```python
import unreal
unreal.SystemLibrary.execute_console_command(None, "log LogGarbage Verbose")
unreal.SystemLibrary.execute_console_command(None, "log LogScript Verbose")
unreal.SystemLibrary.execute_console_command(None, "log LogTemp Verbose")
```

### Step 2 — Reproduce and immediately check logs

ue_get_logs(minVerbosity="Error")                                                                                                                                              
ue_get_logs(minVerbosity="Warning", pattern="nullptr")                                                                                                                         
ue_get_logs(minVerbosity="Warning", pattern="accessed none")

### Step 3 — Common time-based crash causes

| Timing | Likely Cause | Investigation |
|--------|-------------|---------------|
| ~5-10s | Timer callback to destroyed object | Search for `SetTimer` calls, check if owner can be destroyed before timer fires |
| ~30s | GC pass collects dangling reference | Run `obj gc` at console — if it crashes immediately, it's GC-related |
| ~60s | Memory leak accumulation | Run `stat memory` and watch it grow, then `memreport -full` |
| Random | Race condition / async callback | Enable `LogGarbage Verbose`, look for "Destroying" entries before crash |
| After specific action | Logic error in event response | Add breakpoint or `UE_LOG` in the suspected handler |

### Step 4 — GC-specific diagnosis
```
# Force GC and see if it crashes
obj gc

# If it crashes, check for non-UPROPERTY UObject pointers:
# - Search C++ for UObject* members without UPROPERTY()
# - Search for TArray<UObject*> without UPROPERTY()
# - Search for raw pointers in lambda captures
```

### Step 5 — Timer-specific diagnosis
```cpp
// Search project for SetTimer calls
// Verify each one: is the bound object guaranteed alive when timer fires?
// Fix: Clear timer in EndPlay()
void AMyActor::EndPlay(EEndPlayReason::Type Reason)
{
    Super::EndPlay(Reason);
    GetWorldTimerManager().ClearAllTimersForObject(this);
}
```

---

## Workflow 3: Blueprint Function Doesn't Fire

**Symptom:** A Blueprint event or function is wired up but never executes.

### Step 1 — Add diagnostic output
In the Blueprint graph, add a `Print String` node as the FIRST node after the event. If it doesn't print, the event itself isn't firing.

### Step 2 — Check event binding
```bash
$UE_EXEC --script '
import unreal
# Check if the actor exists in the level
actors = unreal.EditorLevelLibrary.get_all_level_actors()
for a in actors:
    if "MyBlueprintActor" in str(a.get_class().get_name()):
        unreal.log(f"Found: {a.get_name()} at {a.get_actor_location()}")
'
```

### Step 3 — Common causes

| Symptom | Cause | Fix |
|---------|-------|-----|
| Event never fires | Event dispatcher not bound / wrong delegate | Check binding in Construction Script or BeginPlay |
| Event fires on server but not client | Missing `Multicast` or `RunOnClient` RPC | Set correct replication mode on the Custom Event |
| Event fires but does nothing | Branch condition always false | Add Print String before AND after the branch |
| Overlap/Hit event never fires | Collision settings wrong | Check "Generate Overlap Events" is true on BOTH actors; check collision channel responses |
| Tick event not firing | "Start with Tick Enabled" is false | Enable in class defaults or call `SetActorTickEnabled(true)` |
| Timer event not firing | Timer handle not stored / cleared prematurely | Store the `FTimerHandle` as a member and ensure nothing clears it |
| Input event not firing | Input mode is "UI Only" or wrong player controller | Check `GetPlayerController()->GetInputMode()`, set to "Game" or "GameAndUI" |

### Step 4 — Collision/overlap specifically
```
1. Select both actors in the level
2. Check Details panel > Collision section:
   - "Generate Overlap Events" = true (on BOTH actors)
   - Collision Presets: one must Query or QueryAndPhysics
   - Object channels: verify they can interact (Overlap, not Ignore)
3. Check that at least one has physics simulation or "SimulatePhysics"
4. Verify one has the overlap event bound (OnActorBeginOverlap or OnComponentBeginOverlap)
```

---

## Workflow 4: Asset Not Found at Runtime

**Symptom:** `nullptr` when loading an asset by path, or "Failed to find" / "Can't find file" in logs.

### Step 1 — Verify the asset exists
```bash
$UE_EXEC --script '
import unreal
path = "/Game/Path/To/MyAsset"
asset = unreal.EditorAssetLibrary.does_asset_exist(path)
unreal.log(f"Asset exists: {asset}")
if asset:
    obj = unreal.EditorAssetLibrary.load_asset(path)
    unreal.log(f"Loaded: {obj}, Class: {obj.get_class().get_name() if obj else None}")
'
```

### Step 2 — Common causes

| Context | Cause | Fix |
|---------|-------|-----|
| **Editor works, package fails** | Asset not in cook list | Add to "Additional Asset Directories to Cook" in Project Settings, or reference from a cooked asset |
| **Path has _C suffix** | Loading Blueprint class, not instance | Append `_C` to path for Blueprint classes: `/Game/BP/MyBP.MyBP_C` |
| **Path changed** | Asset was moved/renamed | Use `FSoftObjectPath` which gets redirected, or update the path string |
| **Streaming level** | Asset is in unloaded level | Check `ULevelStreaming::IsLevelLoaded()` before accessing |
| **Async load** | Accessed before async load completes | Use `RequestAsyncLoad` callback, don't access immediately |
| **Plugin content** | Plugin content not mounted | Verify plugin is enabled in `.uproject`, content path is `/PluginName/...` |

### Step 3 — Check redirectors
```bash
$UE_EXEC --script '
import unreal
# Look for redirectors that might indicate moved assets
registry = unreal.AssetRegistryHelpers.get_asset_registry()
# List all redirectors in the project
redirectors = registry.get_assets_by_class(unreal.TopLevelAssetPath("/Script/CoreUObject", "ObjectRedirector"))
for r in redirectors:
    unreal.log(f"Redirector: {r.package_name}")
'
```

### Step 4 — For packaged builds
```
1. Check cook log: Saved/Logs/<Project>-<Platform>.log
2. Search for "LogCook:" entries mentioning the missing asset
3. Search for "Warning: Failed to load" entries
4. Verify asset path case sensitivity (Linux packages are case-sensitive)
5. Check "Additional Asset Directories to Cook" in Project Settings > Packaging
6. Check Primary Asset Type rules in Asset Manager settings
```

---

## Workflow 5: Packaged Game Crashes but Editor Works

**Symptom:** Everything works in PIE but the packaged build crashes.

### Step 1 — Get the packaged crash log
```
Windows:  %LOCALAPPDATA%/<ProjectName>/Saved/Logs/<ProjectName>.log
          %LOCALAPPDATA%/<ProjectName>/Saved/Crashes/
Linux:    ~/.config/<ProjectName>/Saved/Logs/
Mac:      ~/Library/Logs/<ProjectName>/
```

### Step 2 — Build Development (not Shipping) for better diagnostics
Package with `Development` configuration first — includes `check()`, `ensure()`, symbols, and logging. Shipping strips all of these.

### Step 3 — Common editor-vs-package differences

| Symptom in Package | Cause | Fix |
|--------------------|-------|-----|
| Crash on asset load | Asset not cooked | Add to cook list or reference from a cooked chain |
| `check()` fires (Development) | Bug hidden by editor's error recovery | Fix the root cause — editor was masking it |
| Missing functionality | `WITH_EDITOR` guarded code | Move logic out of `#if WITH_EDITOR` blocks |
| Missing Blueprint class | BP not referenced by anything cooked | Add to "Additional Assets to Cook" or Primary Asset rules |
| "LogPakFile: Warning" | File not in pak | Check cook log for exclusion reasons |
| Nullptr on subsystem | Different initialization order | Don't assume subsystem order; use lazy init |
| Network features broken | `WITH_SERVER_CODE` / `UE_SERVER` guards | Check build target type (Client vs Game) |
| Crash in optimized code | Compiler optimization exposing UB | Fix undefined behavior (uninitialized vars, signed overflow) |

### Step 4 — Quick validation checklist
```
[ ] All referenced assets cook without errors (check cook log)
[ ] No `WITH_EDITOR`-only code in gameplay paths
[ ] No `check()` with side effects (stripped in Shipping)
[ ] All soft references resolve (FSoftObjectPath points to cooked assets)
[ ] Blueprint nativization (if enabled) compiles cleanly
[ ] Config files don't reference editor-only settings
[ ] Input bindings work without editor input mode
```

### Step 5 — Reproduce in standalone from editor
Before full packaging, try: **Play > Standalone Game** — this catches many cooked-vs-uncooked issues without a full cook cycle.

---

## Workflow 6: Performance Drop in Specific Area

**Symptom:** FPS drops significantly when the player enters a certain area of the level.

### Step 1 — Identify the bottleneck
```bash
$UE_EXEC --script '
import unreal
# Enable stat unit to see which thread is the bottleneck
unreal.SystemLibrary.execute_console_command(None, "stat unit")
# Enable GPU stats
unreal.SystemLibrary.execute_console_command(None, "stat gpu")
'
```

Read `stat unit`:
- **Game >** Draw/GPU: CPU game-thread bound (tick, physics, AI, blueprints)
- **Draw >** Game/GPU: CPU render-thread bound (draw calls, occlusion)
- **GPU >** Game/Draw: GPU bound (shaders, overdraw, resolution)

### Step 2 — Drill down based on bottleneck

**GPU bound:**
```
stat gpu                    — Which render pass is expensive?
stat scenerendering         — Detailed pass breakdown
profilegpu                  — One-frame GPU profile dump
r.ScreenPercentage 50       — Halve resolution: if FPS doubles, it's fill-rate/shader
show dynamicshadows          — Toggle shadows: big improvement = shadow cost
show translucency            — Toggle translucency: fix overdraw
stat rhi                    — Check draw call count (target <2000-3000)
```

**CPU game-thread bound:**
```
stat game                   — Overall game thread
stat physics                — Physics simulation cost
stat ai                     — AI/behavior tree/perception cost
stat anim                   — Animation evaluation cost
stat character              — CharacterMovementComponent cost
stat niagara                — Particle system cost
```

**CPU render-thread bound:**
```
stat initviews              — Visibility/culling cost (too many actors?)
stat scenerendering         — Draw call submission
stat rhi                    — Draw calls, state changes
```

### Step 3 — Common area-specific performance killers

| Culprit | Diagnosis | Fix |
|---------|-----------|-----|
| Too many draw calls | `stat rhi` > 3000 draws | Merge meshes, use instancing, LODs, HISMs |
| Shadow-casting lights | Disable shadows, FPS improves | Reduce shadow-casting lights, use distance-based culling |
| Overlapping translucency | `stat gpu` shows high translucency | Reduce particle overdraw, optimize material complexity |
| Dense foliage | `stat initviews` high | Use LODs, cull distance volumes, reduce density |
| Complex materials | `viewmode shadercomplexity` shows red | Simplify materials, reduce texture samples, use LOD materials |
| Many skeletal meshes | `stat anim` high | Reduce bone count, use LODs, enable URO (Update Rate Optimization) |
| Physics simulation | `stat physics` high | Simplify collision, reduce simulated bodies, use sleeping |
| Tick-heavy Blueprints | `stat game` high | Move tick logic to timers, use event-driven patterns |

### Step 4 — Profile for specific data
```
stat startfile              — Start recording profile
<play through problem area>
stat stopfile               — Stop recording
```
Open the resulting `.ue4stats` file in Session Frontend for detailed per-function breakdown.

---

## Workflow 7: Multiplayer Desync

**Symptom:** Clients see different game state than the server, or actions don't replicate.

> **Note:** For deep networking issues, delegate to **ue-networking** skill. This workflow covers initial diagnosis only.

### Step 1 — Confirm it's a replication issue
```
# Enable network debug stats
stat net                     — Check basic connectivity
ShowDebug NET                — Show net debug HUD
log LogNet Verbose           — Verbose network logging
log LogRep Verbose           — Verbose replication logging
```

### Step 2 — Classify the desync

| Symptom | Likely Category | Check |
|---------|----------------|-------|
| Property never updates on client | Property replication missing | Verify `UPROPERTY(Replicated)` and `GetLifetimeReplicatedProps` |
| RPC never arrives | RPC not called on correct side | `HasAuthority()` check: Server RPCs from client, Client RPCs from server |
| Movement jitter | CMC prediction mismatch | Check `CharacterMovementComponent` net settings |
| Spawn not visible to clients | Actor not replicated | `bReplicates = true` in constructor, `SetReplicates(true)` |
| State correct briefly then reverts | Client-side prediction overridden | Server authority correction — this is expected; adjust smoothing |
| Subobject changes not replicating | Subobject not registered | Override `ReplicateSubobjects()` or use `AddReplicatedSubObject()` (UE5.4+) |

### Step 3 — Quick replication checklist
```
[ ] Actor: bReplicates = true in constructor
[ ] Properties: UPROPERTY(Replicated) or UPROPERTY(ReplicatedUsing=OnRep_X)
[ ] GetLifetimeReplicatedProps: all replicated properties registered
[ ] RPCs: correct specifier (Server, Client, NetMulticast)
[ ] RPCs: called on correct authority side
[ ] Net roles: ROLE_Authority (server), ROLE_AutonomousProxy (owning client), ROLE_SimulatedProxy (other clients)
[ ] Component replication: component has SetIsReplicatedByDefault(true)
[ ] Relevancy: actor is net-relevant to the client (check net relevancy settings)
```

### Step 4 — Simulate bad network conditions
```
net PktLag=100 PktLoss=5        — Mild lag + loss
net PktLag=200 PktLoss=10       — Severe conditions
net PktOrder=1                  — Out-of-order packets
```

This often exposes race conditions that work on localhost but fail on real networks.

### Step 5 — Delegate to ue-networking
If the issue requires deep investigation into prediction, relevancy, dormancy, or custom replication, delegate to the **ue-networking** skill which has specialized knowledge of the networking subsystem.

---

## Workflow 8: Ensure vs Fatal Crash — How to Distinguish

**Symptom:** The crash reporter dialog appears, or the debugger pauses unexpectedly mid-session. You need to know whether the process is dead (fatal) or alive and resumable (ensure).

### Step 1 — Check whether this is an ensure

Open the most recent crash dump directory:
```
Saved/Crashes/<CrashGUID>/CrashContext.runtime-xml
```
Look for the `IsEnsure` field:
```xml
<IsEnsure>true</IsEnsure>
```

| `IsEnsure` value | Meaning | Action |
|-----------------|---------|--------|
| `true` | `ensure()` / `ensureMsgf()` — process is alive, execution paused at the assert site | Resume — see Step 2 |
| `false` (or absent) | `check()` / `checkf()` / AV — process is dead | Full restart required |

### Step 2 — Verify the crash is from the *current* session

```
ue_status → processId                         (current editor PID)
CrashContext.runtime-xml → <ProcessId>        (PID that produced the dump)
```

If they **differ**: the dump is from a previous editor session. The current session is unaffected.
- Dismiss the crash reporter dialog.
- Resume work; no debugger action needed.

If they **match**: the ensure fired in the live process.
- The process is paused, not dead.
- Resume with `xdebug_control_session --action resume` (or click Continue in the crash reporter).

### Step 3 — Read the ensure message

When the process is paused, `xdebug_get_stack` shows the ensure site. Key lines in the stack:

```
FDebug::EnsureFailed(...)          — UE ensure dispatcher
<YourCode>::SomeFunction(...)      — YOUR code that triggered the ensure
```

`xdebug_get_frame_values` on the failing frame reveals the local state at the time of the assert.

### Step 4 — Common ensure categories

| Ensure message pattern | Typical cause | Fix direction |
|------------------------|---------------|---------------|
| `!HasAnyFlags(RF_ClassDefaultObject)` | A CDO was passed as a world context (e.g. from `get_default_object()`) | Use a live world object; never pass a CDO to gameplay functions |
| `IsInGameThread()` | UObject access from a background thread / TaskGraph | Wrap in `AsyncTask(ENamedThreads::GameThread, ...)` |
| `Failed to unload all packages during ForceDeleteObjects` | `CollectGarbage()` called while PIE holds package references | Use `GEngine->ForceGarbageCollection(false)` (deferred) during PIE |
| `!IsGarbageCollecting()` | Nested GC call — GC invoked from inside a GC pass | Guard with `if (!IsGarbageCollecting())` |
| `IsValid(Object)` / `Object != nullptr` | Stale pointer to a GC-collected UObject | Add `UPROPERTY()` or use `TWeakObjectPtr` + validity check before access |

### Step 5 — After resuming

Monitor for recurrence with:
```
ue_get_logs(minVerbosity="Warning", pattern="Ensure condition failed", count=20)
```

Ensure failures are logged even when the debugger catches the `__debugbreak()` first — the log entry confirms what fired.
