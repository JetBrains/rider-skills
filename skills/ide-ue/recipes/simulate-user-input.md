# Recipe — Simulating User Input in PIE from Python

Drive the player pawn from the MCP Python executor while a PIE session is running. Three viable paths; this recipe uses the **slate-tick + direct-pawn** approach because it works on the third-person template out of the box and is easy to verify.

All snippets are validated against UE 5.8 + RiderLink, MyProject58Preview (third-person template).

---

## TL;DR — minimal drive script

```python
import unreal, time, json

# Cleanup any prior drive callbacks from earlier calls — see "Pitfall: callback lifetime"
for k in ['_drive_handle', '_drive_state']:
    h = globals().get(k)
    if k.endswith('handle') and h is not None:
        try: unreal.unregister_slate_post_tick_callback(h)
        except Exception: pass
    globals().pop(k, None)

pie_world = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_game_world()
assert pie_world is not None, 'PIE must be running'
pawn = unreal.GameplayStatics.get_player_pawn(pie_world, 0)
assert pawn is not None, 'no player pawn'

state = {'start': time.time(), 'jumped': False, 'handle': None}

def tick(delta):
    el = time.time() - state['start']
    if el >= 3.0:
        if state['handle'] is not None:
            unreal.unregister_slate_post_tick_callback(state['handle'])
            state['handle'] = None
        return
    if not pawn.is_valid_lowlevel():
        return
    pawn.add_movement_input(pawn.get_actor_forward_vector(), 1.0)
    if not state['jumped'] and el >= 1.5:
        state['jumped'] = True
        try: pawn.call_method('Jump')
        except Exception: pass

state['handle'] = unreal.register_slate_post_tick_callback(tick)
globals()['_drive_state'] = state
globals()['_drive_handle'] = state['handle']
print(json.dumps({'armed': True}))
```

Then wait ~3.5 s and sample the result:

```python
import unreal, json
pie_world = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_game_world()
pawn = unreal.GameplayStatics.get_player_pawn(pie_world, 0)
l = pawn.get_actor_location(); v = pawn.get_velocity()
print(json.dumps({'loc': {'x': l.x, 'y': l.y, 'z': l.z}, 'vel': {'x': v.x, 'y': v.y, 'z': v.z}}))
```

---

## Why a tick callback?

`pawn.add_movement_input(direction, scale)` only adds a movement input **for one frame** — the next tick the input is gone. To sustain motion you need one of:

1. **A per-tick driver** (this recipe): `register_slate_post_tick_callback` fires every editor tick; we call `add_movement_input` from there.
2. **Direct velocity manipulation**: doesn't last — `UCharacterMovementComponent` overwrites velocity each tick from inputs.
3. **Enhanced Input injection**: `UEnhancedInputLocalPlayerSubsystem.inject_input_for_action(...)` persists until cleared. Closer to real input but needs the IA_Move/IA_Jump asset paths and the local player subsystem; more setup than this recipe needs.

`time.sleep()` inside the script does **not** help: the Python executor runs on the game thread, so sleeping pauses the game tick too — the pawn won't move during the sleep.

---

## Anatomy

### 1. Find the PIE world

```python
ues = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)
pie_world = ues.get_game_world()    # PIE world during play; None when not in PIE
editor_world = ues.get_editor_world()  # design-time editor world (different UWorld instance)
```

`get_editor_world()` is **not** the PIE world. During PIE, both exist as separate `UWorld` instances — pawns/actors with input are in the PIE world. Path looks like `/Game/<Map>/UEDPIE_0_<Map>.<Map>`.

`unreal.UnrealEditorSubsystem()` (constructor form) is deprecated since UE 5.2 — use `get_editor_subsystem` instead.

### 2. Find the player pawn

```python
pawn = unreal.GameplayStatics.get_player_pawn(pie_world, 0)
pc   = unreal.GameplayStatics.get_player_controller(pie_world, 0)
```

Sanity check `pawn.is_player_controlled()` returns `True` — confirms the pawn is possessed by the player controller. **Do not** try `pc.get_editor_property('pawn')`: the `Pawn` property is protected and Python raises `Property 'Pawn' ... is protected and cannot be read`. Use `is_player_controlled` on the pawn side instead.

### 3. Apply movement & jump

```python
pawn.add_movement_input(pawn.get_actor_forward_vector(), 1.0)  # 1.0 = full input
try:
    pawn.call_method('Jump')   # works on UCharacter; safer than pawn.jump() if the type isn't known
except Exception:
    pass
```

Forward direction comes from the pawn's current facing — turning the pawn first changes which way `add_movement_input(forward, 1.0)` sends them.

For other actions:
- Back: `pawn.add_movement_input(-pawn.get_actor_forward_vector(), 1.0)`
- Strafe right: `pawn.add_movement_input(pawn.get_actor_right_vector(), 1.0)`
- Look (rotate yaw): the player controller has `add_yaw_input(value)` / `add_pitch_input(value)` — same per-tick semantics.

### 4. Register the tick driver

```python
handle = unreal.register_slate_post_tick_callback(tick_func)
# ... tick_func is called every editor tick ...
unreal.unregister_slate_post_tick_callback(handle)
```

Observed tick rate during PIE-in-viewport: **~14 fps** (the editor tick rate, not the full PIE render rate). 28 callbacks fired in 2 s in the validation run. Plenty for movement input; if you need higher precision (e.g. precise frame-based events), this is the wrong tool.

### 5. Verify it worked

Sample velocity / location during the drive **or** before/after:

```python
mc = pawn.get_component_by_class(unreal.CharacterMovementComponent)
print(pawn.get_velocity())          # nonzero while moving
print(mc.get_current_acceleration())  # nonzero while add_movement_input is being called each tick
print(mc.movement_mode)             # MOVE_Walking on ground, MOVE_Falling mid-jump
```

A clean before/after of `pawn.get_actor_location()` proves the drive moved the pawn. A jump shows up as `z` rising significantly above floor `z`, then returning to ground; `movement_mode` transitions Walking → Falling → Walking.

---

## Pitfall: callback lifetime

> **Always cleanup prior `_drive_*` globals at the top of the script.**

`unreal.register_slate_post_tick_callback(func)` hands the callable to C++. The C++ side keeps `func` alive even after the Python script that defined it exits. So when a second script registers a fresh callback, the old one **also keeps firing** until either:
- It self-unregisters (the recipe's `if el >= 3.0` branch), or
- You explicitly call `unregister_slate_post_tick_callback(old_handle)`.

In practice this manifests as a re-run of the same drive script appearing to **do nothing** — the new callback fires, but it shares the pawn reference with a stale closure that may have already passed its `elapsed >= 3.0` check and bailed early, or there's interference between the two closures' state. The cleanup block at the top eliminates the failure mode.

```python
for k in ['_drive_handle', '_drive_state']:
    h = globals().get(k)
    if k.endswith('handle') and h is not None:
        try: unreal.unregister_slate_post_tick_callback(h)
        except Exception: pass
    globals().pop(k, None)
```

This works because `PythonExecutor.cpp` runs non-isolated scripts with `EPythonCommandExecutionMode::ExecuteFile` + `EPythonFileExecutionScope::Public` — `__main__` globals persist across calls. (Older builds that used `ExecuteStatement` won't preserve globals; see `Plugins/Developer/RiderLink/Source/RiderAgentTools/Private/PythonExecutor.cpp`.)

---

## Three modes side by side

These are the three paths the MCP toolset will expose. Modes 1 and 2 work fully from Python; mode 3 (Enhanced Input) needs a UE-version dependent path or — preferably — a C++ implementation, because the current UE 5.8 Python binding does not expose `ULocalPlayer`.

### Mode 1 — High-level actions with durations

The composed pattern from the TL;DR, lifted into a sequencer that walks a list of `{type, ...}` action records on a single tick driver:

```python
actions = [
    {"type":"move",  "direction":"forward", "duration":1.0},
    {"type":"jump",  "duration":0.3},
    {"type":"move",  "direction":"forward", "duration":0.5},
    {"type":"look",  "yaw":45.0, "duration":0.5},
    {"type":"wait",  "duration":0.5},
]
```

Per-tick: read the current action, run the matching primitive (move = add_movement_input, jump = call_method('Jump'), look = add_yaw/pitch_input scaled by `delta / duration`, wait = no-op). When `elapsed >= duration`, advance `i`.

The reference implementation is `_mode_actions` in `D:/Projects/ultimate2/.ai/scratch/ue-prototypes/input_prototype.py`. Validated empirically:

- 1 s forward move → pawn moves ~91 units along forward.
- jump → `mode` transitions `MOVE_WALKING → MOVE_FALLING`, `z` rises (~+110 units) then settles back.

### Mode 2 — Low-level per-tick primitives

When the caller wants one knob held for N seconds (no sequencing). One MCP call, one tick driver, single primitive per frame:

```python
# Sustain forward input for 1.5 s — like holding "W".
def apply():
    pawn.add_movement_input(pawn.get_actor_forward_vector(), 1.0)
handle = unreal.register_slate_post_tick_callback(lambda d: apply())
# … after duration, unregister.
```

The reference implementation is `_mode_primitives`. Verified: pawn delta ≈ +123 units for `add_movement_input` forward, duration 1.5 s.

### Mode 3 — Enhanced Input injection (C++ path, live)

Goes through the project's IA_Move / IA_Jump assets so modifiers, triggers, and action consumption all run normally — the "most realistic" path. **Driven from C++**, surfaced via `simulate_input mode="enhanced"`. The Python-only path is not viable in UE 5.8 because:

- `PlayerController.player` UPROPERTY is protected (`Property 'Player' for attribute 'player' on '<PC>' is protected and cannot be read`).
- `GetLocalPlayer()` and `GetLocalPlayers()` aren't `UFUNCTION`s — reflection (`pc.call_method('GetLocalPlayer')`) returns "Failed to find function".
- `unreal.find_object(None, 'LocalPlayer_0')` returns `None` (the LP isn't reachable by name from any outer we tried).

The MCP tool resolves the subsystem in C++:

```cpp
ULocalPlayer* LP = PC->GetLocalPlayer();
auto* EIS = LP->GetSubsystem<UEnhancedInputLocalPlayerSubsystem>();
EIS->StartContinuousInputInjectionForAction(IA, Value,
    TArray<UInputModifier*>(), TArray<UInputTrigger*>());
```

— see `RiderAgentTools/Private/InputSimulator.cpp` (`HandleEnhanced`). Injection persists until the caller releases it with `simulate_input { mode: "enhanced", enhancedAssetPath: "...", enhancedClear: true }`, which maps to `StopContinuousInputInjectionForAction(IA)`.

The IA asset paths for the validation project (`MyProject58Preview`):

```
/Game/Input/Actions/IA_Move
/Game/Input/Actions/IA_Jump
/Game/Input/Actions/IA_Look
/Game/Input/Actions/IA_MouseLook
```

Value-kind mapping (`enhancedValueKind`):

| Kind | Wire fields | Built as |
|---|---|---|
| `axis2d` (default) | `enhancedAxis2dX`, `enhancedAxis2dY` | `FInputActionValue(FVector2D(x, y))` |
| `axis1d` | `enhancedAxis1d` | `FInputActionValue(static_cast<float>(v))` |
| `bool` | `enhancedBool` | `FInputActionValue(bool)` |

The Python prototype's `_mode_enhanced` is kept as a structured stub — it documents the Python-side limitation and points at the `simulate_input mode="enhanced"` MCP call as the real entry point.

### Console events

```python
unreal.SystemLibrary.execute_console_command(pie_world, 'ce MyCustomEvent', pc)
```

Only fires events that the gameplay code exposes via `UFUNCTION(Exec)` or custom event reflection. The third-person template's Enhanced Input flow doesn't expose these, so this path doesn't help with movement here.

### Console events

```python
unreal.SystemLibrary.execute_console_command(pie_world, 'ce MyCustomEvent', pc)
```

Only fires events that the gameplay code exposes via `UFUNCTION(Exec)` or custom event reflection. The third-person template's Enhanced Input flow doesn't expose these, so this path doesn't help with movement here.

---

## Live MCP shape

All three modes ship behind a **single action-dispatched MCP tool**, `simulate_input { mode, ... }` (see `ide-ue:input` in SKILL.md for the full table). The dispatcher in `RiderAgentTools/Private/InputSimulator.cpp` (`Dispatch`) routes on `mode` and arms an `FTSTicker` on the game thread; at most one ticker is active at a time (every call starts with `CancelActiveTicker()`).

| mode | Maps to | Sustain semantics | Required params |
|---|---|---|---|
| `actions` | Mode 1 above | per-tick driver walks the list, advancing on `Elapsed >= duration` | `actions: [{type: "move"|"jump"|"look"|"wait", direction?, duration?, yaw?, pitch?, scale?}]` (non-empty) |
| `primitive` | Mode 2 above | sustained for `primitiveDuration`, one knob per tick (jump is one-shot) | `primitiveCall: "add_movement_input"|"add_yaw_input"|"add_pitch_input"|"jump"` (+ optional `primitiveDirection`, `primitiveScale`, `primitiveValue`, `primitiveWorldVec`, `primitiveDuration`) |
| `enhanced` | Mode 3 above | persists in `UEnhancedInputLocalPlayerSubsystem` until released by a paired `enhancedClear=true` call | `enhancedAssetPath` (+ optional `enhancedValueKind`, `enhancedAxis2dX/Y`, `enhancedAxis1d`, `enhancedBool`, `enhancedClear`) |

Response shape is the same for every mode: `{ success, armed, startLocation, startVelocity, nActions, error }`. `startLocation` / `startVelocity` are the **pre-fire** pawn pose at the moment the call landed — pair them with a `ue_execute_python` read later to verify the drive actually moved the pawn.

The reference prototype that exercises modes 1 and 2 (and stubs mode 3 with a structured error) lives at `D:/Projects/ultimate2/.ai/scratch/ue-prototypes/input_prototype.py` and remains useful as a Python-side driver when the MCP layer isn't available; the C++ implementation in `InputSimulator.cpp` mirrors it record-for-record.

> **Prerequisite — TArray marshaller fix.** `mode=actions` (any non-empty `actions[]`) and `ue_execute_python { scripts: [...] }` are wire-formatted as TArrays on the Rider→UE leg. Older bundled-RiderLink builds defined `resize(TArray<T,A>&, int32_t)` as `value.Reserve(size)` in `UE4TypesMarshallers.h:23-25`, which only grows capacity — the next-line indexed assignment in `Buffer::read_array` then trips `TArray::RangeCheck` and hard-faults the editor (STATUS_BREAKPOINT 0x80000003). Fix: change the body to `value.SetNum(size);` and full-rebuild the editor (header-only template — touches many TUs, so Live Coding can't apply it). `mode=primitive` carries `actions=[]` and is the only safe shape against an un-patched build.

## Quick reference

| Need | Call |
|---|---|
| PIE world | `unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_game_world()` |
| Player pawn | `unreal.GameplayStatics.get_player_pawn(pie_world, 0)` |
| Player controller | `unreal.GameplayStatics.get_player_controller(pie_world, 0)` |
| Is possessed | `pawn.is_player_controlled()` |
| Walk forward (per tick) | `pawn.add_movement_input(pawn.get_actor_forward_vector(), 1.0)` |
| Jump | `pawn.call_method('Jump')` |
| Look (per tick) | `pc.add_yaw_input(v)` / `pc.add_pitch_input(v)` |
| Per-tick driver | `unreal.register_slate_post_tick_callback(fn)` → handle |
| Stop driver | `unreal.unregister_slate_post_tick_callback(handle)` |
| Velocity | `pawn.get_velocity()` |
| Acceleration | `pawn.get_component_by_class(unreal.CharacterMovementComponent).get_current_acceleration()` |
| Mode (Walking/Falling) | `mc.movement_mode` |
