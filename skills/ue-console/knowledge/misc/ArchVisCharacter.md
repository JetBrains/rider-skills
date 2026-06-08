# UE Python API — ArchVisCharacter Module

**2 types** from the `ArchVisCharacter` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ArchVisCharacter`, `ArchVisCharMovementComponent`

---

## Classes

### `unreal.ArchVisCharacter`
Inherits: `Character` | Header: `ArchVisCharacter.h`

Arch Vis Character

**Properties** (8):
  - `look_up_at_rate_axis_name`: `str` [Read-Only] — [Read-Only] Axis name for rate-based look up/down inputs (e.g. joystick). This should match an Axis ...
  - `look_up_axis_name`: `str` [Read-Only] — [Read-Only] Axis name for direct look up/down inputs (e.g. mouse). This should match an Axis Binding...
  - `mouse_sensitivity_scale_pitch`: `float` [Read-Only] — [Read-Only] Controls how aggressively mouse motion translates to character rotation in the pitch axi...
  - `mouse_sensitivity_scale_yaw`: `float` [Read-Only] — [Read-Only] Controls how aggressively mouse motion translates to character rotation in the yaw axis....
  - `move_forward_axis_name`: `str` [Read-Only] — [Read-Only] Axis name for âmove forward/backâ control. This should match an Axis Binding in your...
  - `move_right_axis_name`: `str` [Read-Only] — [Read-Only] Axis name for âmove left/rightâ control. This should match an Axis Binding in your i...
  - `turn_at_rate_axis_name`: `str` [Read-Only] — [Read-Only] Axis name for rate-based turn left/right inputs (e.g. joystick). This should match an Ax...
  - `turn_axis_name`: `str` [Read-Only] — [Read-Only] Axis name for direct turn left/right inputs (e.g. mouse). This should match an Axis Bind...

### `unreal.ArchVisCharMovementComponent`
Inherits: `CharacterMovementComponent` | Header: `ArchVisCharMovementComponent.h`

Arch Vis Char Movement Component

**Properties** (8):
  - `max_pitch`: `float` [Read-Only] — [Read-Only] Controls how far up you can look (float)
  - `max_rotational_velocity`: `Rotator` [Read-Only] — [Read-Only] Fastest possible turn rate (Rotator)
  - `min_pitch`: `float` [Read-Only] — [Read-Only] Controls how far down you can look (float)
  - `rotational_acceleration`: `Rotator` [Read-Only] — [Read-Only] Controls how fast the characterâs turn rate accelerates when rotating and looking up/d...
  - `rotational_deceleration`: `Rotator` [Read-Only] — [Read-Only] Controls how fast the characterâs turn rate decelerates to 0 when user stops turning (...
  - `walking_acceleration`: `float` [Read-Only] — [Read-Only] How fast the character accelerates. (float)
  - `walking_friction`: `float` [Read-Only] — [Read-Only] Controls walking deceleration. (float)
  - `walking_speed`: `float` [Read-Only] — [Read-Only] How fast the character can walk. (float)
