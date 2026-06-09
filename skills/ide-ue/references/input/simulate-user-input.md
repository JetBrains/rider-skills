# Recipe — Simulating User Input in PIE

Drive the player pawn via the `simulate_input` MCP tool while a PIE session is running. Three modes: `actions` (sequenced), `primitive` (one sustained call), `enhanced` (Enhanced Input via C++).

Validated against UE 5.8 + RiderLink, MyProject58Preview (third-person template).

---

## TL;DR

Move forward 3 s, then jump:

```
simulate_input --mode actions --actions [{"type":"move","direction":"forward","scale":1.0,"duration":3.0},{"type":"jump","duration":0.3}]
```

Or sustain forward for 2 s:

```
simulate_input --mode primitive --primitiveCall add_movement_input --primitiveDirection forward --primitiveScale 1.0 --primitiveDuration 2.0
```

Response: `{ armed, startLocation, startVelocity, nActions }`. Use `startLocation`/`startVelocity` as the pre-fire baseline; read the pawn after the drive to confirm movement (see [Observing pawn state](#observing-pawn-state)).

---

## Tool contract

| mode | Sustain semantics | Required params |
|---|---|---|
| `actions` | per-tick driver walks list, advances on `elapsed >= duration` | `actions: [{type,direction?,scale?,yaw?,pitch?,duration}]` (non-empty) |
| `primitive` | sustained for `primitiveDuration` s; `jump` is one-shot | `primitiveCall: add_movement_input \| add_yaw_input \| add_pitch_input \| jump` |
| `enhanced` | persists until `enhancedClear=true` on same asset | `enhancedAssetPath` (long IA asset path) |

Every call cancels any in-flight ticker — at most one simulation is active at a time.

> **Prerequisite — TArray marshaller fix.** `mode=actions` hard-faults older bundled-RiderLink builds. Fix: change `value.Reserve(size)` → `value.SetNum(size)` in `UE4TypesMarshallers.h:23-25`, then full-rebuild (header-only — Live Coding can't apply it). `mode=primitive` is safe against un-patched builds.

---

## Mode 1 — Action sequence

Walk a list of actions in order. Useful for scripted gameplay sequences:

```
simulate_input --mode actions --actions [
  {"type":"move",  "direction":"forward", "scale":1.0, "duration":1.0},
  {"type":"jump",  "duration":0.3},
  {"type":"move",  "direction":"forward", "scale":1.0, "duration":0.5},
  {"type":"look",  "yaw":45.0, "duration":0.5},
  {"type":"wait",  "duration":0.5}
]
```

Empirical: 1 s forward → pawn moves ~91 units. Jump → `MOVE_FALLING`, z rises ~110 units then settles.

---

## Mode 2 — Single sustained primitive

One input held for N seconds — like holding a key:

```
simulate_input --mode primitive --primitiveCall add_movement_input --primitiveDirection forward --primitiveScale 1.0 --primitiveDuration 1.5
simulate_input --mode primitive --primitiveCall add_yaw_input --primitiveValue 90 --primitiveDuration 0.5
simulate_input --mode primitive --primitiveCall jump
```

Directions for `add_movement_input`: `forward` / `back` / `left` / `right` / `world_vec` (pass `--primitiveWorldVec [x,y,z]` when using `world_vec`).

Empirical: `add_movement_input` forward 1.5 s → pawn delta ~123 units.

---

## Mode 3 — Enhanced Input injection

Goes through the project's IA assets so modifiers, triggers, and action consumption run normally. The Python-only path is not viable in UE 5.8 (`ULocalPlayer` is not accessible via reflection). The MCP tool resolves the subsystem in C++ via `UEnhancedInputLocalPlayerSubsystem`.

```
simulate_input --mode enhanced --enhancedAssetPath /Game/Input/Actions/IA_Move --enhancedValueKind axis2d --enhancedAxis2d [0,1]
# release:
simulate_input --mode enhanced --enhancedAssetPath /Game/Input/Actions/IA_Move --enhancedClear true
```

IA asset paths (MyProject58Preview): `/Game/Input/Actions/IA_Move`, `IA_Jump`, `IA_Look`, `IA_MouseLook`.

| `enhancedValueKind` | Wire field | UE type |
|---|---|---|
| `axis2d` (default) | `--enhancedAxis2d [x,y]` | `FInputActionValue(FVector2D)` |
| `axis1d` | `--enhancedAxis1d <v>` | `FInputActionValue(float)` |
| `bool` | `--enhancedBool true\|false` | `FInputActionValue(bool)` |

---

## Observing pawn state

`simulate_input` returns `startLocation`/`startVelocity` (pre-fire snapshot). For mid-drive or post-drive sampling, use `ue_execute_python` — these fields have no MCP equivalent:

```python
import unreal, json
pie_world = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_game_world()
pawn = unreal.GameplayStatics.get_player_pawn(pie_world, 0)
l = pawn.get_actor_location()
v = pawn.get_velocity()
mc = pawn.get_component_by_class(unreal.CharacterMovementComponent)
print(json.dumps({
    'loc':  {'x': l.x, 'y': l.y, 'z': l.z},
    'vel':  {'x': v.x, 'y': v.y, 'z': v.z},
    'mode': str(mc.movement_mode)
}))
```

`movement_mode` cycles `MOVE_Walking → MOVE_Falling → MOVE_Walking` on a jump. A clean before/after of `get_actor_location()` proves the drive moved the pawn.

### PIE world and pawn refs

```python
ues      = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)
pie_world = ues.get_game_world()    # None when PIE not running
pawn     = unreal.GameplayStatics.get_player_pawn(pie_world, 0)
pc       = unreal.GameplayStatics.get_player_controller(pie_world, 0)
```

Sanity check: `pawn.is_player_controlled()` — confirms the pawn is possessed. Do **not** use `pc.get_editor_property('pawn')` — the Pawn property is protected and raises an error.

### Console events

```python
unreal.SystemLibrary.execute_console_command(pie_world, 'ce MyCustomEvent', pc)
```

Only fires `UFUNCTION(Exec)` events. Does not cover Enhanced Input flow.

---

## Quick reference

| Need | Call |
|---|---|
| PIE world | `unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_game_world()` |
| Player pawn | `unreal.GameplayStatics.get_player_pawn(pie_world, 0)` |
| Player controller | `unreal.GameplayStatics.get_player_controller(pie_world, 0)` |
| Is possessed | `pawn.is_player_controlled()` |
| Walk forward | `simulate_input --mode primitive --primitiveCall add_movement_input --primitiveDirection forward --primitiveScale 1.0 --primitiveDuration 2.0` |
| Walk back / strafe | change `--primitiveDirection` to `back` / `left` / `right` |
| Jump | `simulate_input --mode primitive --primitiveCall jump` |
| Look (yaw) | `simulate_input --mode primitive --primitiveCall add_yaw_input --primitiveValue 45 --primitiveDuration 0.5` |
| Action sequence | `simulate_input --mode actions --actions [{"type":"move","direction":"forward","scale":1.0,"duration":1.0},...]` |
| Velocity | `pawn.get_velocity()` |
| Acceleration | `pawn.get_component_by_class(unreal.CharacterMovementComponent).get_current_acceleration()` |
| Mode (Walking/Falling) | `mc.movement_mode` |
