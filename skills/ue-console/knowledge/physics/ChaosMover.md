# UE Python API — ChaosMover Module

**19 types** from the `ChaosMover` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ChaosCharacterApplyVelocityEffect`, `ChaosMoverCharacterSimState`, `ChaosMoverSimulationDefaultInputs`, `ChaosCharacterFallingCheck`, `ChaosCharacterJumpCheck`, `ChaosCharacterLandingCheck`, `ChaosCharacterMovementMode`, `ChaosCharacterMovementModeInterface`, `ChaosFallingMode`, `ChaosFlyingMode`, `ChaosGroundMovementUtils`, `ChaosMovementMode`, `ChaosMovementModeTransition`, `ChaosMoverBackendComponent`, `ChaosMoverSimulation`, `ChaosWalkingMode`, `SharedChaosCharacterMovementSettings`, `ChaosMoverIgnoredCollisionMode`, `ChaosMoverVelocityEffectMode`

---

## Classes

### `unreal.ChaosCharacterApplyVelocityEffect`
Inherits: `InstantMovementEffect` | Header: `ChaosCharacterApplyVelocityEffect.h`

Applies a velocity or impulse for a single tick

**Properties** (2):
  - `mode`: `ChaosMoverVelocityEffectMode` — [Read-Write] Controls whether to apply velocity or impulse and if the velocity will be additive (Cha...
  - `velocity_or_impulse_to_apply`: `Vector` — [Read-Write] Velocity or impulse to apply to the actor. (Vector)

### `unreal.ChaosMoverCharacterSimState`
Inherits: `MoverDataStructBase` | Header: `ChaosMoverSimulationTypes.h`

Default chaos mover character simulation state, contains state basic for character simulation

**Properties** (2):
  - `target_delta_facing`: `float` [Read-Only] — [Read-Only] (float)
  - `target_delta_position`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.ChaosMoverSimulationDefaultInputs`
Inherits: `MoverDataStructBase` | Header: `ChaosMoverSimulationTypes.h`

Data block containing all default inputs required by the Chaos Mover simulation

**Properties** (5):
  - `gravity`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `pawn_collision_half_height`: `float` [Read-Only] — [Read-Only] (float)
  - `pawn_collision_radius`: `float` [Read-Only] — [Read-Only] (float)
  - `physics_object_gravity`: `float` [Read-Only] — [Read-Only] (float)
  - `up_dir`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.ChaosCharacterFallingCheck`
Inherits: `ChaosMovementModeTransition` | Header: `ChaosCharacterFallingCheck.h`

Chaos Character Falling Check

**Properties** (1):
  - `transition_to_falling_mode`: `Name` — [Read-Write] Name of movement mode to transition to when landing on ground (Name)

### `unreal.ChaosCharacterJumpCheck`
Inherits: `ChaosMovementModeTransition` | Header: `ChaosCharacterJumpCheck.h`

Chaos Character Jump Check

**Properties** (3):
  - `fractional_ground_reaction_impulse`: `float` — [Read-Write] Controls how much of the jump impulse the character will apply to the ground.
A value o...
  - `jump_upwards_speed`: `float` — [Read-Write] Instantaneous speed induced in an actor upon jumping (float)
  - `transition_to_mode`: `Name` — [Read-Write] Name of movement mode to transition to when jumping (Name)

### `unreal.ChaosCharacterLandingCheck`
Inherits: `ChaosMovementModeTransition` | Header: `ChaosCharacterLandingCheck.h`

Chaos Character Landing Check

**Properties** (4):
  - `floor_distance_tolerance`: `float` — [Read-Write] Height at which we consider the character to be on the ground (float)
  - `swimming_start_immersion_depth`: `float` — [Read-Write] Depth at which the pawn starts swimming (float)
  - `transition_to_ground_mode`: `Name` — [Read-Write] Name of movement mode to transition to when landing on ground (Name)
  - `transition_to_water_mode`: `Name` — [Read-Write] Name of movement mode to transition to when landing on water (Name)

### `unreal.ChaosCharacterMovementMode`
Inherits: `ChaosMovementMode` | Header: `ChaosCharacterMovementMode.h`

Base class for all Chaos character movement modes

**Methods** (4):
  - `get_ground_query_radius()` -> `float` — Get Ground Query Radius
  - `get_max_walk_slope_cosine()` -> `float` — Get Max Walk Slope Cosine
  - `get_target_height()` -> `float` — Get Target Height
  - `should_character_remain_upright()` -> `bool` — Should Character Remain Upright

### `unreal.ChaosCharacterMovementModeInterface`
Inherits: `Interface` | Header: `ChaosMoverSimulationTypes.h`

Chaos Character Movement Mode Interface

**Methods** (4):
  - `get_ground_query_radius()` -> `float` — Get Ground Query Radius
  - `get_max_walk_slope_cosine()` -> `float` — Get Max Walk Slope Cosine
  - `get_target_height()` -> `float` — Get Target Height
  - `should_character_remain_upright()` -> `bool` — Should Character Remain Upright

### `unreal.ChaosFallingMode`
Inherits: `ChaosCharacterMovementMode` | Header: `ChaosFallingMode.h`

Chaos character falling mode

**Properties** (8):
  - `air_control_percentage`: `float` — [Read-Write] When falling, amount of movement control available to the actor.
0 = no control, 1 = fu...
  - `cancel_vertical_speed_on_landing`: `bool` — [Read-Write] If true, actor will land and lose all speed in the vertical direction upon landing. If ...
  - `falling_deceleration`: `float` — [Read-Write] Deceleration to apply to air movement when falling slower than terminal velocity.
Note:...
  - `over_terminal_speed_falling_deceleration`: `float` — [Read-Write] Deceleration to apply to air movement when falling faster than terminal velocity
Note: ...
  - `should_clamp_terminal_vertical_speed`: `bool` — [Read-Write] When exceeding maximum vertical speed, should it be enforced via a hard clamp? If false...
  - `terminal_movement_plane_speed`: `float` — [Read-Write] If the actorâs movement plane velocity is greater than this speed falling will start ...
  - `terminal_vertical_speed`: `float` — [Read-Write] If the actors vertical velocity is greater than this speed VerticalFallingDeceleration ...
  - `vertical_falling_deceleration`: `float` — [Read-Write] Deceleration to apply to vertical velocity when itâs greater than TerminalVerticalSpe...

### `unreal.ChaosFlyingMode`
Inherits: `ChaosCharacterMovementMode` | Header: `ChaosFlyingMode.h`

Chaos character flying mode

### `unreal.ChaosGroundMovementUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `ChaosGroundMovementUtils.h`

Chaos Ground Movement Utils

**Methods** (1):
  - `compute_local_ground_velocity_internal(position, floor_result)` -> `Vector` [classmethod] — Computes the local velocity at the supplied position of the hit object in floor result

### `unreal.ChaosMovementMode`
Inherits: `BaseMovementMode` | Header: `ChaosMovementMode.h`

Base class for all Chaos movement modes

**Methods** (1):
  - `get_simulation()` -> `ChaosMoverSimulation` — Get Simulation

### `unreal.ChaosMovementModeTransition`
Inherits: `BaseMovementModeTransition` | Header: `ChaosMovementModeTransition.h`

Base class for all Chaos movement mode transitions

**Methods** (1):
  - `get_simulation()` -> `ChaosMoverSimulation` — Get Simulation

### `unreal.ChaosMoverBackendComponent`
Inherits: `ActorComponent` | Header: `ChaosMoverBackend.h`

Chaos Mover Backend Component

### `unreal.ChaosMoverSimulation`
Inherits: `MoverSimulation` | Header: `ChaosMoverSimulation.h`

Chaos Mover Simulation

**Methods** (5):
  - `find_movement_mode_by_name(name)` -> `BaseMovementMode` — Find Movement Mode by Name
  - `get_current_movement_mode()` -> `BaseMovementMode` — Get Current Movement Mode
  - `get_debug_sim_data()` -> `MoverDataCollection` — Collection for holding extra debug data, that will be sent to the Chaos Visual Debugger for debugging
  - `get_local_sim_input()` -> `MoverDataCollection` — Returns the local simulation input MoverDataCollection, to read local non networked data passed to the simulation by the...
  - `get_local_sim_input_mutable()` -> `MoverDataCollection` — Returns the local simulation input MoverDataCollection, to pass local non networked data to the simulation Only availabl...

### `unreal.ChaosWalkingMode`
Inherits: `ChaosCharacterMovementMode` | Header: `ChaosWalkingMode.h`

Chaos character walking mode

### `unreal.SharedChaosCharacterMovementSettings`
Inherits: `Object` | Header: `SharedChaosCharacterMovementSettings.h`

SharedChaosCharacterMovementSettings: collection of settings that are shared between the chaos character movement modes

**Properties** (13):
  - `acceleration`: `float` — [Read-Write] Default max linear rate of acceleration for controlled input. May be scaled based on ma...
  - `braking_friction`: `float` — [Read-Write] Friction (drag) coefficient applied when braking (whenever Acceleration = 0, or if char...
  - `braking_friction_factor`: `float` — [Read-Write] Factor used to multiply actual value of friction used when braking.
This applies to any...
  - `deceleration`: `float` — [Read-Write] Default max linear rate of deceleration when there is no controlled input (float)
  - `default_falling_mode`: `Name` — [Read-Write] Default movement mode to use when falling. (Name)
  - `ground_friction`: `float` — [Read-Write] Setting that affects movement control. Higher values allow faster changes in direction....
  - `max_speed`: `float` — [Read-Write] Maximum speed in the movement plane (float)
  - `max_step_height`: `float` — [Read-Write] Mover actors will be able to step up onto or over obstacles shorter than this (float)
  - `max_walkable_slope_angle`: `float` — for max slope angle of 30 degrees, value is cosine(30 deg) = 0.866 (float) [Read-Write] Walkable slo...
  - `turning_boost`: `float` — [Read-Write] Speeds velocity direction changes while turning, to reduce sliding (float)
  - `turning_rate`: `float` — [Read-Write] Maximum rate of turning rotation (degrees per second). Negative numbers indicate instan...
  - `use_acceleration_for_velocity_move`: `bool` — [Read-Write] Should use acceleration for velocity based movement intent?
If true, acceleration is ap...
  - `use_separate_braking_friction`: `bool` — [Read-Write] If true, BrakingFriction will be used to slow the character to a stop (when there is no...

### `unreal.ChaosMoverIgnoredCollisionMode`
Inherits: `EnumBase` | Header: `ChaosMovementMode.h`

EChaos Mover Ignored Collision Mode

**Properties** (2):
  - `DISABLE_COLLISIONS_WITH_IGNORED`: `ChaosMoverIgnoredCollisionMode = Ellipsis` — 1
  - `ENABLE_COLLISIONS_WITH_IGNORED`: `ChaosMoverIgnoredCollisionMode = Ellipsis` — 0

### `unreal.ChaosMoverVelocityEffectMode`
Inherits: `EnumBase` | Header: `ChaosCharacterApplyVelocityEffect.h`

EChaos Mover Velocity Effect Mode

**Properties** (3):
  - `ADDITIVE_VELOCITY`: `ChaosMoverVelocityEffectMode = Ellipsis` — Apply as an additive velocity 1
  - `IMPULSE`: `ChaosMoverVelocityEffectMode = Ellipsis` — Apply as an additive impulse 0
  - `OVERRIDE_VELOCITY`: `ChaosMoverVelocityEffectMode = Ellipsis` — Apply as an override velocity 2
