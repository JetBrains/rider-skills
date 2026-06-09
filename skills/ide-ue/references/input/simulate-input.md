# ide-ue:input — Simulate Player Input in PIE

`simulate_input` drives the **player pawn / controller in the active PIE world**. Three modes; one tool. Requires PIE running (`ue_status.playState == "Play"`).

## Tool reference

| Tool | Purpose | When to use |
|------|---------|-------------|
| `simulate_input` | Drive the player pawn / controller in the active PIE world | Primary input tool: scripted sequences, sustained hold, or Enhanced Input injection |
| `ue_status` | Confirm editor connected and PIE state | Pre-check: must be `playState == "Play"` before any `simulate_input` call |
| `ue_play` | Start / stop PIE | Bring PIE into Play state so the pawn is possessed and ready for input |
| `ue_execute_python` | Read pawn location, velocity, or animation state after input | Verify the pawn actually moved: `pawn.get_actor_location()` vs `startLocation` |
| `ue_get_logs` | Watch for input-related warnings | `category="LogInput"` or `category="LogEnhancedInput"` for Enhanced Input misconfigurations |

`simulate_input { mode, ... }`

Each call **cancels the previous in-flight ticker** — at most one input driver runs at a time.

| Mode | Effect | Required params |
|------|--------|-----------------|
| `actions` | Walk a list of `{type,...}` records via `FTSTicker`, one at a time, wall-clock duration | `actions: [...]` (non-empty) |
| `primitive` | Hold one knob for `primitiveDuration` seconds | `primitiveCall` |
| `enhanced` | Inject via `UEnhancedInputLocalPlayerSubsystem` so project modifiers / triggers run | `enhancedAssetPath` |

## `mode=actions` record types

| `type` | Per-tick effect | Key fields | Advance condition |
|--------|-----------------|------------|-------------------|
| `move` | `Pawn->AddMovementInput(direction, scale)` | `direction` (forward/back/left/right), `scale`, `duration` | `Elapsed >= duration` |
| `jump` | `Cast<ACharacter>(Pawn)->Jump()` once | `duration` | `duration <= 0` or `Elapsed >= duration` |
| `look` | `AddYawInput(yaw)` + `AddPitchInput(pitch)`, proportional | `yaw`, `pitch`, `duration` | `Elapsed >= duration` |
| `wait` | No-op | `duration` | `Elapsed >= duration` |

## `mode=primitive` — `primitiveCall` values

| `primitiveCall` | Effect | Extra params |
|-----------------|--------|--------------|
| `add_movement_input` | `Pawn->AddMovementInput(dir, scale)` per tick | `primitiveDirection`, `primitiveScale`, `primitiveWorldVec` |
| `add_yaw_input` | `PC->AddYawInput(primitiveValue)` per tick | `primitiveValue` |
| `add_pitch_input` | `PC->AddPitchInput(primitiveValue)` per tick | `primitiveValue` |
| `jump` | `ACharacter->Jump()` once, no ticker | — |

`primitiveDuration <= 0` → one-shot. `primitiveDirection == "world_vec"` drives movement along `primitiveWorldVec` instead of pawn-relative direction.

## `mode=enhanced` params

| Param | Meaning |
|-------|---------|
| `enhancedAssetPath` | Package path to `UInputAction` (e.g. `/Game/Input/Actions/IA_Move`) |
| `enhancedValueKind` | `axis2d` (default), `axis1d`, `bool` |
| `enhancedAxis2dX/Y` / `enhancedAxis1d` / `enhancedBool` | Value to inject |
| `enhancedClear` | `true` → stop continuous injection for this action |

**Always clear enhanced holds** with `enhanced + enhancedClear=true` — UE keeps the value alive until told to stop, even across PIE stops within the same editor session.

## Response shape

```jsonc
{
  "armed": true,           // false for one-shot or error
  "startLocation": {...},  // pre-fire pawn location (null if pawn not found)
  "startVelocity": {...},  // pre-fire pawn velocity (null if pawn not found)
  "nActions": 5            // actions mode only
}
```

## Workflow

1. `ue_status` — require `connected = true` and `playState == "Play"`.
2. Pick mode: scripted sequence → `actions`; single sustained input → `primitive`; project's IA asset → `enhanced`.
3. Fire — call returns immediately with the pre-fire snapshot.
4. Verify: wait `sum(duration)` or `primitiveDuration`; re-read pawn state via `ue_execute_python`.
5. Release any enhanced holds when done.

## Critical rules

- **Only one ticker active at a time.** A second call replaces the first. Build long sequences as a single `actions` list.
- **`actions` requires at least one entry.** Empty array fails cleanly.
- **Pawn must be `ACharacter` for `jump`.** Non-Character pawns silently skip jump records.
- **`look.duration <= 0`** applies the full yaw/pitch in one tick — instant snap.
- **`enhanced` clear is per-action.** Stopping `IA_Move` does not stop `IA_Jump`.
- **Pre-fire snapshot.** `startLocation` / `startVelocity` are values *before* the ticker armed.
- **Known issue — TArray marshaller crash** in older bundled-RiderLink: if `mode=actions` or `ue_execute_python { scripts:[...] }` causes a `STATUS_BREAKPOINT 0x80000003` hard fault, the fix is changing `Reserve(size)` → `SetNum(size)` in `UE4TypesMarshallers.h` and full-rebuilding. Until patched, prefer `mode=primitive` for movement.

## Recipes

| Goal | Call |
|------|------|
| Walk forward 1 s, jump, walk 0.5 s, look 45° right | `simulate_input { mode:"actions", actions:[{type:"move",direction:"forward",duration:1},{type:"jump",duration:0.3},{type:"move",direction:"forward",duration:0.5},{type:"look",yaw:45,duration:0.5}] }` |
| Hold W for 1.5 s | `simulate_input { mode:"primitive", primitiveCall:"add_movement_input", primitiveDirection:"forward", primitiveScale:1.0, primitiveDuration:1.5 }` |
| Continuous yaw 30°/s for 2 s | `simulate_input { mode:"primitive", primitiveCall:"add_yaw_input", primitiveValue:30, primitiveDuration:2.0 }` |
| One-shot jump | `simulate_input { mode:"primitive", primitiveCall:"jump" }` |
| Drive IA_Move (0,1) until released | `simulate_input { mode:"enhanced", enhancedAssetPath:"/Game/Input/Actions/IA_Move", enhancedValueKind:"axis2d", enhancedAxis2dX:0, enhancedAxis2dY:1 }` |
| Release IA_Move hold | `simulate_input { mode:"enhanced", enhancedAssetPath:"/Game/Input/Actions/IA_Move", enhancedClear:true }` |

## CLI flag form (alternative syntax)

```
simulate_input --mode actions --actions [{"type":"move","direction":"forward","scale":1.0,"yaw":0,"pitch":0,"duration":1.5},{"type":"jump","scale":0,"yaw":0,"pitch":0,"duration":0.3}]
simulate_input --mode primitive --primitiveCall add_movement_input --primitiveDirection forward --primitiveScale 1.0 --primitiveDuration 1.5
simulate_input --mode enhanced --enhancedAssetPath /Game/Input/Actions/IA_Move --enhancedValueKind axis2d --enhancedAxis2d [1.0,0.0]
simulate_input --mode enhanced --enhancedAssetPath /Game/Input/Actions/IA_Move --enhancedClear true
```

Empirical (third-person template): 1 s forward scale 1.0 → ~91 units delta; jump z → +110 units then settles; 1.5 s `primitive` → ~123 units.

## Verify result

Sample the pawn after the drive completes via `ue_execute_python`:

```python
import unreal, json
pie_world = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_game_world()
pawn = unreal.GameplayStatics.get_player_pawn(pie_world, 0)
l = pawn.get_actor_location()
v = pawn.get_velocity()
print(json.dumps({'loc': {'x': l.x, 'y': l.y, 'z': l.z}, 'vel': {'x': v.x, 'y': v.y, 'z': v.z}}))
```

Check movement state:

```python
mc = pawn.get_component_by_class(unreal.CharacterMovementComponent)
print(mc.movement_mode)               # MOVE_Walking / MOVE_Falling
print(mc.get_current_acceleration())  # nonzero while add_movement_input fires each tick
```

## Python tick-driver fallback

Use when `simulate_input` is unavailable. Run via `ue_execute_python`. Cleanup block at the top prevents double-arming on re-run.

```python
import unreal, time

for k in ['_drive_handle', '_drive_state']:
    h = globals().get(k)
    if k.endswith('handle') and h is not None:
        try: unreal.unregister_slate_post_tick_callback(h)
        except Exception: pass
    globals().pop(k, None)

pie_world = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_game_world()
pawn = unreal.GameplayStatics.get_player_pawn(pie_world, 0)
state = {'start': time.time(), 'jumped': False, 'handle': None}

def tick(delta):
    el = time.time() - state['start']
    if el >= 3.0:
        if state['handle']:
            unreal.unregister_slate_post_tick_callback(state['handle'])
            state['handle'] = None
        return
    pawn.add_movement_input(pawn.get_actor_forward_vector(), 1.0)
    if not state['jumped'] and el >= 1.5:
        state['jumped'] = True
        try: pawn.call_method('Jump')
        except Exception: pass

state['handle'] = unreal.register_slate_post_tick_callback(tick)
globals()['_drive_state'] = state
globals()['_drive_handle'] = state['handle']
```

`add_movement_input` applies for one frame only — re-apply every tick. `time.sleep()` pauses the game thread and must never be used here. Editor tick rate during PIE-in-viewport is ~14 fps.
