# UE Python API — Locomotor Module

**10 types** from the `Locomotor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FootSet`, `FootSettings`, `HeadSettings`, `LocomotorDebugSettings`, `MovementSettings`, `PelvisSettings`, `RigUnit_Locomotor`, `SpineSettings`, `StepSettings`, `LocomotorMovementStyle`

---

## Classes

### `unreal.FootSet`
Inherits: `StructBase` | Header: `RigUnit_Locomotor.h`

Foot Set

**Properties** (2):
  - `feet`: `None` — [Read-Write] All the feet belonging to this set. Feet in this set alternate phases (ie Left/Right/Le...
  - `phase_offset`: `float` — [Read-Write] the 0-1 phase offset for this set of feet (relative to the global phase) (float)

### `unreal.FootSettings`
Inherits: `StructBase` | Header: `RigUnit_Locomotor.h`

Foot Settings

**Properties** (4):
  - `ankle_bone`: `RigElementKey` — [Read-Write] The bone at the END of the limb (typically the BALL of the foot). This is where the out...
  - `collision_radius`: `float` — [Read-Write] (float)
  - `max_heel_peel`: `Vector` — [Read-Write] Default is (0, 0, 50). The max rotation to peel the heel before lift off. This is in th...
  - `static_local_offset`: `Vector` — [Read-Write] applies a static offset that shifts feet in the local space of the foot bone in the ref...

### `unreal.HeadSettings`
Inherits: `StructBase` | Header: `RigUnit_Locomotor.h`

Head Settings

**Properties** (4):
  - `angle_max`: `float` — [Read-Write] Default is 30. The maximum angle (in degrees) to rotate the head to look at the goal. (...
  - `damping`: `float` — [Read-Write] Default is 0.9. Typical range is 0-2. Higher values cause spine leaning to dampen quick...
  - `head_bone`: `RigElementKey` — [Read-Write] The base spine bone. Usually directly below the Pelvis bone. The bone that rotates to l...
  - `stiffness`: `float` — [Read-Write] Default is 150.0. Typical range is 1-200. Higher values cause spine to lean more rapidl...

### `unreal.LocomotorDebugSettings`
Inherits: `StructBase` | Header: `RigUnit_Locomotor.h`

Locomotor Debug Settings

**Properties** (11):
  - `draw_body`: `bool` — [Read-Write] (bool)
  - `draw_current_feet`: `bool` — [Read-Write] (bool)
  - `draw_current_feet_flat`: `bool` — [Read-Write] (bool)
  - `draw_current_feet_target`: `bool` — [Read-Write] (bool)
  - `draw_debug`: `bool` — [Read-Write] (bool)
  - `draw_feet_collision`: `bool` — [Read-Write] (bool)
  - `draw_final_feet_target`: `bool` — [Read-Write] (bool)
  - `draw_phase_circle`: `bool` — [Read-Write] (bool)
  - `draw_prev_feet_target`: `bool` — [Read-Write] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)

### `unreal.MovementSettings`
Inherits: `StructBase` | Header: `RigUnit_Locomotor.h`

Movement Settings

**Properties** (9):
  - `acceleration`: `float` — [Read-Write] the acceleration in cm/s/s (ie, how quickly the movement speed increases to reach the g...
  - `deceleration`: `float` — [Read-Write] the acceleration in cm/s/s (ie, how quickly the movement speed decreases when approachi...
  - `global_time_scale`: `float` — [Read-Write] adjust global speed of the simulation (float)
  - `minimum_step_length`: `float` — [Read-Write] the length of the smallest step to take in cm (float)
  - `phase_speed_max`: `float` — [Read-Write] the maximum phase speed in cycles/s (float)
  - `phase_speed_min`: `float` — [Read-Write] the minimum phase speed in cycles/s (float)
  - `speed_max`: `float` — [Read-Write] the maximum movement speed in cm/s (float)
  - `speed_min`: `float` — [Read-Write] the minimum movement speed in cm/s (float)
  - `styles`: `None` — [Read-Write] The the movement styles to cycle through based on speed (Array[LocomotorMovementStyle])

### `unreal.PelvisSettings`
Inherits: `StructBase` | Header: `RigUnit_Locomotor.h`

Pelvis Settings

**Properties** (11):
  - `bob_damping`: `float` — [Read-Write] Default is 0.9. Typical range is 0-2. Higher values cause pelvis bob to dampen quickly....
  - `bob_offset`: `float` — [Read-Write] Default is 10.f. Range is 0-inf. The amount to lower the pelvis at the minimum height i...
  - `bob_stiffness`: `float` — [Read-Write] Default is 40.0. Typical range is 1-100. Higher values cause pelvis to bob more rapidly...
  - `lead_amount`: `float` — [Read-Write] Default is 2.0. Typical range is 1-3. Higher values cause pelvis to move further ahead ...
  - `lead_damping_half_life`: `float` — [Read-Write] Default is 0.1. Typical range is 0.1-1. The time (in seconds) it takes for the Pelvis t...
  - `orient_to_ground_pitch`: `float` — [Read-Write] Default is -0.3. Typical range is -1 to 1. Pitch the pelvis up/down with ground. 0 is n...
  - `orient_to_ground_roll`: `float` — [Read-Write] Default is -0.3. Typical range is -1 to 1. Roll the pelvis side-to-side with ground. 0 ...
  - `pelvis_bone`: `RigElementKey` — [Read-Write] Usually the Pelvis or Hip bone. The bone that translates the whole body (not necessaril...
  - `position_damping_half_life`: `float` — [Read-Write] Default is 0.1. Typical range is 0.1-1. The time (in seconds) it takes for the Pelvis t...
  - `rotation_damping`: `float` — [Read-Write] Default is 2.0. Typical range is 0-2. Higher values cause pelvis rotation to dampen qui...
  - `rotation_stiffness`: `float` — [Read-Write] Default is 40.0. Typical range is 1-100. Higher values cause pelvis to rotate more rapi...

### `unreal.RigUnit_Locomotor`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_Locomotor.h`

Rig Unit Locomotor

**Properties** (7):
  - `debug`: `LocomotorDebugSettings` — [Read-Write] adjust debug drawing. (LocomotorDebugSettings)
  - `feet_transforms`: `None` [Read-Only] — [Read-Only] list of limbs to walk on. (Array[Transform])
  - `foot_sets`: `None` [Read-Only] — [Read-Only] the set of feet belonging to the creature (Array[FootSet])
  - `movement`: `MovementSettings` — [Read-Write] the movement settings (MovementSettings)
  - `pelvis`: `PelvisSettings` — [Read-Write] the Pelvis or Hip bone to move with the feet (PelvisSettings)
  - `root_control`: `Name` — [Read-Write] the target location and rotation, in world space
the locomotor will generate steps to p...
  - `stepping`: `StepSettings` — [Read-Write] the global step settings (StepSettings)

### `unreal.SpineSettings`
Inherits: `StructBase` | Header: `RigUnit_Locomotor.h`

Spine Settings

**Properties** (4):
  - `pitch_angle_max`: `float` — [Read-Write] Default is 30. The maximum angle (in degrees) to lean the spine in the direction of tra...
  - `pitch_damping`: `float` — [Read-Write] Default is 0.9. Typical range is 0-2. Higher values cause spine leaning to dampen quick...
  - `pitch_stiffness`: `float` — [Read-Write] Default is 150.0. Typical range is 1-200. Higher values cause spine to lean more rapidl...
  - `spine_bone`: `RigElementKey` — [Read-Write] The base spine bone. Usually directly below the Pelvis bone. The bone that rotates to l...

### `unreal.StepSettings`
Inherits: `StructBase` | Header: `RigUnit_Locomotor.h`

Step Settings

**Properties** (12):
  - `air_extension_at_max_speed`: `float` — [Read-Write] Default is 0.2. Range is 0.0 - 0.9. This value is added to the âPercentOfStrideInAirâ...
  - `enable_foot_collision`: `bool` — [Read-Write] Default is true. When true, feet are treated as non-overlapping circles and will not ov...
  - `enable_ground_collision`: `bool` — [Read-Write] Default is true. When true, foot height is adjusted using sphere-casting against the wo...
  - `foot_collision_global_scale`: `float` — [Read-Write] Default is 1.0. Range is 0-inf. Global scale multiplier for all foot collision radii. (...
  - `max_collision_height`: `float` — [Read-Write] Default is 30. Range is 0-inf. The maximum height in cm to place foot on-top of collisi...
  - `orient_foot_to_ground_pitch`: `float` — [Read-Write] Default is 0.8. Range is 0-1. When Ground Collision is enabled, this will orient the pi...
  - `orient_foot_to_ground_roll`: `float` — [Read-Write] Default is 0.8. Range is 0-1. When Ground Collision is enabled, this will orient the ro...
  - `percent_of_stride_in_air`: `float` — [Read-Write] Default is 0.35. Range is 0.1 - 0.9. The percentage amount of the 0-1 stride phase wher...
  - `step_ease_in`: `float` — [Read-Write] Default is 0.5. Range is 0-1. How quickly the foot accelerates when lifting off the gro...
  - `step_ease_out`: `float` — [Read-Write] Default is 0.2. Range is 0-1. How quickly the foot decelerates when planting. At 0, it ...
  - `step_height`: `float` — [Read-Write] Default is 6. Range is 0-inf. The height to raise foot (in cm) at the peak of the large...
  - `trace_channel`: `TraceTypeQuery` — [Read-Write] The âchannelâ used to trace spheres into the physics world for collision detection....

### `unreal.LocomotorMovementStyle`
Inherits: `EnumBase` | Header: `RigUnit_Locomotor.h`

ELocomotor Movement Style

**Properties** (3):
  - `GALLOP`: `LocomotorMovementStyle = Ellipsis` — 2
  - `TROT`: `LocomotorMovementStyle = Ellipsis` — 1
  - `WALK`: `LocomotorMovementStyle = Ellipsis` — 0
