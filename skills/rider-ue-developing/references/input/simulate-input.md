# rider-ue-developing:input — Simulate Player Input in PIE

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

Empirical (DemoPro57 / FirstPerson corridor): max walk speed 600 UU/s; 5 s `mode=actions` forward → ~2450 UU horizontal (24.5 m). Effective horizontal rate is ~490 UU/s because the level has ramps — forward input converts partially to vertical. Target 30 m → use ~6.1 s forward duration to compensate.

## Pitfalls

| # | Mistake | Fix |
|---|---------|-----|
| 1 | **Polling right after `simulate_input`** — the call returns immediately; the player has not moved yet. | Use the Slate tick-driver callback (see **Python tick-driver fallback**) to sample state inside the running tick, not after the call returns. |
| 2 | **`primitiveDuration` not calculated** — e.g. 3 s at 490 UU/s = 1470 units; overshoots the bot's follow radius and the bot stops chasing before you can measure anything. | Compute: `duration = units_to_cover / effective_speed`. For DemoPro57 (490 UU/s): 200 units → 0.41 s. |
| 3 | **Moving the player with Python teleportation instead of `simulate_input`** — `actor.set_actor_location(...)` bypasses physics, may clip through geometry, and produces unreliable AI reactions. | Always use `simulate_input` (or the Slate tick-driver `add_movement_input` form) when testing gameplay mechanics that depend on player movement. |
| 4 | **Not checking AI distances before expecting a chase** — if `player_dist > follow_radius` the AI will never move, regardless of how correctly the tick is written. | Before arming input, read `bot.get_actor_location()` and `player.get_actor_location()`, compute 2D distance, and confirm it is between `AcceptanceRadius` and `FollowRadius`. |
| 5 | **`mode=actions` TArray marshaller crash** (older bundled RiderLink) — STATUS_BREAKPOINT 0x80000003 hard fault on `TArray Reserve`. | Use `mode=primitive` for movement; reserve `mode=actions` for sequences that need jump + look. See known-issue note in **Critical rules**. |

## Verify result

Sample the pawn after the drive completes via `ue_execute_python`.

> **`mcp__rider__execute_tool --script` pitfall**: `\n` in the arg string is passed as a literal backslash-n, causing `SyntaxError: unexpected character after line continuation character`. Use semicolons for a single-line script — never rely on `\n` newlines in the `--script` value.

Single-line form (safe for `mcp__rider__execute_tool --script`):

```
ue_execute_python --script "import unreal,json,math; pie_world=unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_game_world(); pawn=unreal.GameplayStatics.get_player_pawn(pie_world,0); l=pawn.get_actor_location(); v=pawn.get_velocity(); sx,sy=START_X,START_Y; dist=math.sqrt((l.x-sx)**2+(l.y-sy)**2); print(json.dumps({'loc':{'x':round(l.x,1),'y':round(l.y,1),'z':round(l.z,1)},'vel_z':round(v.z,1),'dist_cm':round(dist,1),'dist_m':round(dist/100,2)}))"
```

Multi-line form (for use inside `ue_execute_python` API calls, not execute_tool CLI):

```python
import unreal, json
pie_world = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_game_world()
pawn = unreal.GameplayStatics.get_player_pawn(pie_world, 0)
l = pawn.get_actor_location()
v = pawn.get_velocity()
print(json.dumps({'loc': {'x': l.x, 'y': l.y, 'z': l.z}, 'vel': {'x': v.x, 'y': v.y, 'z': v.z}}))
```

Check movement state (single-line form):

```
ue_execute_python --script "import unreal; pawn=unreal.GameplayStatics.get_player_pawn(unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_game_world(),0); mc=pawn.get_component_by_class(unreal.CharacterMovementComponent); print(mc.movement_mode)"
```

### PIE refs & possession (observation only)

```python
ues       = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)
pie_world = ues.get_game_world()                                  # None when PIE not running
pawn      = unreal.GameplayStatics.get_player_pawn(pie_world, 0)
pc        = unreal.GameplayStatics.get_player_controller(pie_world, 0)
accel     = pawn.get_component_by_class(unreal.CharacterMovementComponent).get_current_acceleration()
```

- **Confirm possession** with `pawn.is_player_controlled()` before expecting input to land.
- **Do NOT** use `pc.get_editor_property('pawn')` — the Pawn property is protected and raises.
- **Console events**: `unreal.SystemLibrary.execute_console_command(pie_world, 'ce MyEvent', pc)` fires `UFUNCTION(Exec)` events only — it does **not** drive Enhanced Input. Use `simulate_input` for real input.
- `movement_mode` cycles `MOVE_Walking → MOVE_Falling → MOVE_Walking` on a jump; a clean before/after of `get_actor_location()` proves the drive moved the pawn.

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
