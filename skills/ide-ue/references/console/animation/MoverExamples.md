# UE Python API — MoverExamples Module

**19 types** from the `MoverExamples` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FollowPathState`, `FollowSplineState`, `MoverExampleAbilityInputs`, `SplineOffsetRangeInput`, `ZipliningState`, `FollowPathMode`, `FollowSplineMode`, `MoverExampleAbilityInputsLibrary`, `MoverExamplesCharacter`, `MoverExamplesGameMode`, `MoverExamplesGameState`, `MoverExamplesPhysicsCharacterMoverComponent`, `Zipline`, `ZiplineEndTransition`, `ZiplineStartTransition`, `ZipliningMode`, `FollowPathRotationType`, `FollowSplineRotationType`, `SplineOffsetUnit`

---

## Classes

### `unreal.FollowPathState`
Inherits: `MoverDataStructBase` | Header: `FollowPathMode.h`

Data block containing path-following state info

### `unreal.FollowSplineState`
Inherits: `MoverDataStructBase` | Header: `FollowSplineMode.h`

Data block containing path-following state info

### `unreal.MoverExampleAbilityInputs`
Inherits: `MoverDataStructBase` | Header: `AbilityInputs.h`

Data block containing extended ability inputs used by MoverExamples characters

**Properties** (5):
  - `is_aim_pressed`: `bool` [Read-Only] — [Read-Only] (bool)
  - `is_dash_just_pressed`: `bool` [Read-Only] — [Read-Only] (bool)
  - `is_vault_just_pressed`: `bool` [Read-Only] — [Read-Only] (bool)
  - `wants_to_be_crouched`: `bool` [Read-Only] — [Read-Only] (bool)
  - `wants_to_start_ziplining`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.SplineOffsetRangeInput`
Inherits: `StructBase` | Header: `FollowSplineMode.h`

Represents an input for Range based follow behavior

**Properties** (2):
  - `offset_unit`: `SplineOffsetUnit` — [Read-Write] (SplineOffsetUnit)
  - `value`: `float` — [Read-Write] (float)

### `unreal.ZipliningState`
Inherits: `MoverDataStructBase` | Header: `ZipliningMode.h`

Data block containing ziplining state info, used while ZipliningMode is active

### `unreal.FollowPathMode`
Inherits: `BaseMovementMode` | Header: `FollowPathMode.h`

FollowPathMode: This mode performs simple movement of the associated actor, attempting to interpolate through a series of locations. There are variety of settings that affect behavior, such as speed a...

**Properties** (4):
  - `behaviour_type`: `InterpToBehaviourType` — [Read-Write] Method of path-following (InterpToBehaviourType)
  - `control_points`: `None` — [Read-Write] List of ordered path locations to visit (Array[InterpControlPoint])
  - `duration`: `float` — [Read-Write] Time (in seconds) required to move from the first point to the last (or vice versa) (fl...
  - `rotation_type`: `FollowPathRotationType` — [Read-Write] Method of rotating the actor during path-following (FollowPathRotationType)

### `unreal.FollowSplineMode`
Inherits: `BaseMovementMode` | Header: `FollowSplineMode.h`

FollowSplineMode: This mode performs movement of the associated actor, along a spline. Default settings will provide a follow from start to end of the Spline. However, the start and end offsets could ...

**Methods** (1):
  - `set_control_spline(spline_provider_actor, offset = [0.000000,SplineOffsetUnit.PERCENTAGE])` -> `None` — Set Control Spline

**Properties** (10):
  - `behaviour_type`: `InterpToBehaviourType` — [Read-Write] Follow Mode for Path Following (InterpToBehaviourType)
  - `constant_follow_velocity`: `bool` — [Read-Write] Should Mover follow spline with constant velocity (bool)
  - `control_spline`: `SplineComponent` [Read-Only] — [Read-Only] (SplineComponent)
  - `custom_duration_seconds_override`: `float` — [Read-Write] If greater than zero, the follow motion would map the spline time to this duration. (fl...
  - `end_offset`: `SplineOffsetRangeInput` — [Read-Write] Optional end offset to define ranged follow (SplineOffsetRangeInput)
  - `interpolation_curve`: `CurveFloat` — [Read-Write] Optional Interpolation curve to dictate the speed and position for follow (CurveFloat)
  - `orient_mover_to_movement`: `bool` — [Read-Write] Should Mover face in the direction of movement at all times (bool)
  - `rotation_type`: `FollowSplineRotationType` — [Read-Write] Rotation Mode for Path Following (FollowSplineRotationType)
  - `start_offset`: `SplineOffsetRangeInput` — [Read-Write] Optional starting offset to define ranged follow (SplineOffsetRangeInput)
  - `start_reveresed`: `bool` — [Read-Write] Should the mover start following from the End (bool)

### `unreal.MoverExampleAbilityInputsLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AbilityInputs.h`

Mover Example Ability Inputs Library

**Methods** (1):
  - `get_mover_example_ability_inputs(from_collection)` -> `MoverExampleAbilityInputs` [classmethod] — Get Mover Example Ability Inputs

### `unreal.MoverExamplesCharacter`
Inherits: `Pawn` | Header: `MoverExamplesCharacter.h`

MoverExamplesCharacter: the base pawn class used by the MoverExamples plugin. Handles coalescing of input events. Cannot be instantiated on its own.

**Methods** (5):
  - `get_mover_component()` -> `CharacterMoverComponent` — Accessor for the actorâs movement component
  - `on_produce_input(delta_ms, input_cmd)` -> `MoverInputCmdContext` — Implement this event in Blueprints to author input for the next simulation frame. Consider also calling Parent event.
  - `produce_input(sim_time_ms)` -> `MoverInputCmdContext` — Contributes additions to the input cmd for this simulation frame. Typically this is translating accumulated user input (...
  - `request_move_by_intent(desired_intent)` -> `None` — Request the character starts moving with an intended directional magnitude. A length of 1 indicates maximum acceleration...
  - `request_move_by_velocity(desired_velocity)` -> `None` — Request the character starts moving with a desired velocity. This will be used in lieu of any other input.

**Properties** (9):
  - `character_motion_component`: `CharacterMoverComponent` [Read-Only] — [Read-Only] (CharacterMoverComponent)
  - `fly_input_action`: `InputAction` [Read-Only] — [Read-Only] Fly Input Action (InputAction)
  - `jump_input_action`: `InputAction` [Read-Only] — [Read-Only] Jump Input Action (InputAction)
  - `look_input_action`: `InputAction` [Read-Only] — [Read-Only] Look Input Action (InputAction)
  - `maintain_last_input_orientation`: `bool` — [Read-Write] If true, the actor will continue orienting towards the last intended orientation (from ...
  - `move_input_action`: `InputAction` [Read-Only] — [Read-Only] Move Input Action (InputAction)
  - `nav_mover_component`: `NavMoverComponent` [Read-Only] — [Read-Only] Holds functionality for nav movement data and functions (NavMoverComponent)
  - `orient_rotation_to_movement`: `bool` — [Read-Write] If true, rotate the Character toward the direction the actor is moving (bool)
  - `use_base_relative_movement`: `bool` — [Read-Write] Whether or not we author our movement inputs relative to whatever base weâre standing...

### `unreal.MoverExamplesGameMode`
Inherits: `GameMode` | Header: `MoverExamplesGameMode.h`

Mover Examples Game Mode

### `unreal.MoverExamplesGameState`
Inherits: `GameState` | Header: `MoverExamplesGameState.h`

Mover Examples Game State

### `unreal.MoverExamplesPhysicsCharacterMoverComponent`
Inherits: `PhysicsCharacterMoverComponent` | Header: `MoverExamplesPhysicsCharacterMoverComponent.h`

Mover Examples Physics Character Mover Component

### `unreal.Zipline`
Inherits: `Interface` | Header: `ZiplineInterface.h`

**Methods** (2):
  - `get_end_component()` -> `SceneComponent` — Get End Component
  - `get_start_component()` -> `SceneComponent` — Get Start Component

### `unreal.ZiplineEndTransition`
Inherits: `BaseMovementModeTransition` | Header: `ZipliningTransitions.h`

Transition that handles exiting ziplining based on input

### `unreal.ZiplineStartTransition`
Inherits: `BaseMovementModeTransition` | Header: `ZipliningTransitions.h`

Transition that handles starting ziplining based on input. Character must be airborne to catch the zipline, regardless of input.

### `unreal.ZipliningMode`
Inherits: `BaseMovementMode` | Header: `ZipliningMode.h`

ZipliningMode: movement mode that traverses an actor implementing the IZipline interface

### `unreal.FollowPathRotationType`
Inherits: `EnumBase` | Header: `FollowPathMode.h`

Controls how rotation is handled during pathing

**Properties** (3):
  - `ALIGN_WITH_PATH`: `FollowPathRotationType = Ellipsis` — Orient moving actor to the path 2
  - `ALIGN_WITH_PATH_TANGENTS`: `FollowPathRotationType = Ellipsis` — Orient moving actor by intepolating between path tangents 1
  - `FIXED`: `FollowPathRotationType = Ellipsis` — Maintain original actor orientation 0

### `unreal.FollowSplineRotationType`
Inherits: `EnumBase` | Header: `FollowSplineMode.h`

EFollow Spline Rotation Type

**Properties** (2):
  - `FOLLOW_SPLINE_TANGENT`: `FollowSplineRotationType = Ellipsis` — 0
  - `NO_ROTATION`: `FollowSplineRotationType = Ellipsis` — 1

### `unreal.SplineOffsetUnit`
Inherits: `EnumBase` | Header: `FollowSplineMode.h`

ESpline Offset Unit

**Properties** (3):
  - `DISTANCE_ABSOLUTE`: `SplineOffsetUnit = Ellipsis` — 2
  - `DURATION_ABSOLUTE_SECONDS`: `SplineOffsetUnit = Ellipsis` — 1
  - `PERCENTAGE`: `SplineOffsetUnit = Ellipsis` — 0
