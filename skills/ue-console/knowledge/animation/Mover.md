# UE Python API — Mover Module

**148 types** from the `Mover` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ApplyVelocityEffect`, `ApplyVelocityPhysicsEffect`, `AsyncTeleportEffect`, `CharacterDefaultInputs`, `ComputeCombinedVelocityParams`, `ComputeVelocityParams`, `FloorCheckResult`, `FreeMoveParams`, `GroundMoveParams`, `InstantMovementEffect`, `JumpImpulseEffect`, `LayeredMove_AnimRootMotion`, `LayeredMove_JumpImpulseOverDuration`, `LayeredMove_JumpTo`, `LayeredMove_Launch`, `LayeredMove_LinearVelocity`, `LayeredMove_MoveTo`, `LayeredMove_MoveToDynamic`, `LayeredMove_MultiJump`, `LayeredMove_RadialImpulse`, ... (148 total)

---

## Classes

### `unreal.ApplyVelocityEffect`
Inherits: `InstantMovementEffect` | Header: `BasicInstantMovementEffects.h`

Apply Velocity: provides an impulse velocity to the actor after (optionally) forcing them into a particular movement mode Note: this only applies the impulse for one tick!

**Properties** (3):
  - `additive_velocity`: `bool` — [Read-Write] If true VelocityToApply will be added to current velocity on this actor. If false veloc...
  - `force_movement_mode`: `Name` — [Read-Write] Optional movement mode name to force the actor into before applying the impulse velocit...
  - `velocity_to_apply`: `Vector` — [Read-Write] Velocity to apply to the actor. (Vector)

### `unreal.ApplyVelocityPhysicsEffect`
Inherits: `InstantMovementEffect` | Header: `ApplyVelocityPhysicsMovementEffect.h`

Apply Velocity: provides a velocity to the actor after (optionally) forcing them into a particular movement mode Note: this only applies the velocity for one tick!

**Properties** (3):
  - `additive_velocity`: `bool` — [Read-Write] If true VelocityToApply will be added to current velocity on this actor. If false veloc...
  - `force_movement_mode`: `Name` — [Read-Write] Optional movement mode name to force the actor into before applying the impulse velocit...
  - `velocity_to_apply`: `Vector` — [Read-Write] Velocity to apply to the actor. (Vector)

### `unreal.AsyncTeleportEffect`
Inherits: `TeleportEffect` | Header: `BasicInstantMovementEffects.h`

Async Teleport: instantly moves an actor to a new location and rotation (compatible with async movement simulation)

### `unreal.CharacterDefaultInputs`
Inherits: `MoverDataStructBase` | Header: `MoverDataModelTypes.h`

Data block containing all inputs that need to be authored and consumed for the default Mover character simulation

**Properties** (10):
  - `control_rotation`: `Rotator` [Read-Only] — [Read-Only] World space orientation that the controls were based on. This is commonly a playerâs c...
  - `is_jump_just_pressed`: `bool` [Read-Only] — [Read-Only] (bool)
  - `is_jump_pressed`: `bool` [Read-Only] — [Read-Only] (bool)
  - `move_input`: `Vector` [Read-Only] — [Read-Only] Representing the directional move input for this frame. Must be interpreted according to...
  - `move_input_type`: `MoveInputType` [Read-Only] — [Read-Only] (MoveInputType)
  - `movement_base`: `PrimitiveComponent` — when moving on a base, input may be relative to this object (PrimitiveComponent) [Read-Write] Option...
  - `movement_base_bone_name`: `Name` [Read-Only] — for movement bases that are skeletal meshes, this is the bone weâre based on. Only valid if Moveme...
  - `orientation_intent`: `Vector` [Read-Only] — [Read-Only] Facing direction intent, as a normalized forward-facing direction. A zero vector indicat...
  - `suggested_movement_mode`: `Name` [Read-Only] — [Read-Only] Used to force the Mover actor into a different movement mode (Name)
  - `using_movement_base`: `bool` [Read-Only] — [Read-Only] Specifies whether we are using a movement base, which will affect how move inputs are in...

### `unreal.ComputeCombinedVelocityParams`
Inherits: `StructBase` | Header: `MovementUtils.h`

Input parameters for ComputeCombinedVelocity()

**Properties** (10):
  - `acceleration`: `float` — [Read-Write] (float)
  - `deceleration`: `float` — [Read-Write] (float)
  - `delta_seconds`: `float` — [Read-Write] (float)
  - `external_acceleration`: `Vector` — [Read-Write] (Vector)
  - `friction`: `float` — [Read-Write] (float)
  - `initial_velocity`: `Vector` — [Read-Write] (Vector)
  - `max_speed`: `float` — [Read-Write] AuxState variables (float)
  - `move_direction_intent`: `Vector` — [Read-Write] (Vector)
  - `overall_max_speed`: `float` — [Read-Write] (float)
  - `turning_boost`: `float` — [Read-Write] (float)

### `unreal.ComputeVelocityParams`
Inherits: `StructBase` | Header: `MovementUtils.h`

Input parameters for compute velocity function

**Properties** (11):
  - `acceleration`: `float` — [Read-Write] (float)
  - `deceleration`: `float` — [Read-Write] (float)
  - `delta_seconds`: `float` — [Read-Write] (float)
  - `friction`: `float` — [Read-Write] (float)
  - `initial_velocity`: `Vector` — [Read-Write] (Vector)
  - `max_speed`: `float` — [Read-Write] AuxState variables (float)
  - `move_direction_intent`: `Vector` — [Read-Write] (Vector)
  - `move_input`: `Vector` — [Read-Write] (Vector)
  - `move_input_type`: `MoveInputType` — [Read-Write] (MoveInputType)
  - `turning_boost`: `float` — [Read-Write] (float)
  - `use_acceleration_for_velocity_move`: `bool` — [Read-Write] (bool)

### `unreal.FloorCheckResult`
Inherits: `StructBase` | Header: `FloorQueryUtils.h`

Data about the floor for walking movement, used by Mover simulations

**Properties** (6):
  - `blocking_hit`: `bool` [Read-Only] — [Read-Only] True if there was a blocking hit in the floor test that was NOT in initial penetration.
...
  - `floor_dist`: `float` [Read-Only] — [Read-Only] The distance to the floor, computed from the swept capsule trace. (float)
  - `hit_result`: `HitResult` [Read-Only] — [Read-Only] Hit result of the test that found a floor. Includes more specific data about the point o...
  - `line_dist`: `float` [Read-Only] — [Read-Only] The distance to the floor, computed from the trace. Only valid if bLineTrace is true. (f...
  - `line_trace`: `bool` [Read-Only] — [Read-Only] True if the hit found a valid walkable floor using a line trace (rather than a sweep tes...
  - `walkable_floor`: `bool` [Read-Only] — [Read-Only] True if the hit found a valid walkable floor. (bool)

### `unreal.FreeMoveParams`
Inherits: `StructBase` | Header: `AirMovementUtils.h`

Input parameters for controlled free movement function

**Properties** (13):
  - `acceleration`: `float` — [Read-Write] (float)
  - `deceleration`: `float` — [Read-Write] (float)
  - `delta_seconds`: `float` — [Read-Write] (float)
  - `max_speed`: `float` — [Read-Write] (float)
  - `move_input`: `Vector` — [Read-Write] (Vector)
  - `move_input_type`: `MoveInputType` — [Read-Write] (MoveInputType)
  - `orientation_intent`: `Rotator` — [Read-Write] (Rotator)
  - `prior_orientation`: `Rotator` — [Read-Write] (Rotator)
  - `prior_velocity`: `Vector` — [Read-Write] (Vector)
  - `turning_boost`: `float` — [Read-Write] (float)
  - `turning_rate`: `float` — [Read-Write] (float)
  - `use_acceleration_for_velocity_move`: `bool` — [Read-Write] (bool)
  - `world_to_gravity_quat`: `Quat` — [Read-Write] (Quat)

### `unreal.GroundMoveParams`
Inherits: `StructBase` | Header: `GroundMovementUtils.h`

Input parameters for controlled ground movement function

**Properties** (16):
  - `acceleration`: `float` — [Read-Write] (float)
  - `deceleration`: `float` — [Read-Write] (float)
  - `delta_seconds`: `float` — [Read-Write] (float)
  - `friction`: `float` — [Read-Write] (float)
  - `ground_normal`: `Vector` — [Read-Write] (Vector)
  - `max_speed`: `float` — [Read-Write] (float)
  - `move_input`: `Vector` — [Read-Write] (Vector)
  - `move_input_type`: `MoveInputType` — [Read-Write] (MoveInputType)
  - `orientation_intent`: `Rotator` — [Read-Write] (Rotator)
  - `prior_orientation`: `Rotator` — [Read-Write] (Rotator)
  - `prior_velocity`: `Vector` — [Read-Write] (Vector)
  - `turning_boost`: `float` — [Read-Write] (float)
  - `turning_rate`: `float` — [Read-Write] (float)
  - `up_direction`: `Vector` — [Read-Write] (Vector)
  - `use_acceleration_for_velocity_move`: `bool` — [Read-Write] (bool)
  - `world_to_gravity_quat`: `Quat` — [Read-Write] (Quat)

### `unreal.InstantMovementEffect`
Inherits: `StructBase` | Header: `InstantMovementEffect.h`

Instant Movement Effects are methods of affecting movement state directly on a Mover-based actor for one tick. Note: This is only applied one tick and then removed Common uses would be for Teleporting...

### `unreal.JumpImpulseEffect`
Inherits: `InstantMovementEffect` | Header: `BasicInstantMovementEffects.h`

Jump Impulse: introduces an instantaneous upwards change in velocity. This overrides the existing âupâ component of the actorâs current velocity Note: this only applies the impulse for one tick!

**Properties** (1):
  - `upwards_speed`: `float` — [Read-Write] Units per second, in whatever direction the target actor considers âupâ (float)

### `unreal.LayeredMove_AnimRootMotion`
Inherits: `LayeredMoveBase` | Header: `AnimRootMotionLayeredMove.h`

Anim Root Motion Move: handles root motion from a montage played on the primary visual component (skeletal mesh). In this method, root motion is extracted independently from anim playback. The move wi...

**Properties** (3):
  - `montage`: `AnimMontage` — [Read-Write] (AnimMontage)
  - `play_rate`: `float` — [Read-Write] Rate at which this montage is intended to play (float)
  - `starting_montage_position`: `float` — [Read-Write] Montage position when started (in unscaled seconds). (float)

### `unreal.LayeredMove_JumpImpulseOverDuration`
Inherits: `LayeredMoveBase` | Header: `BasicLayeredMoves.h`

Jump Impulse Over Duration: introduces an instantaneous upwards change in velocity over a duration(ms). This overrides the existing âupâ component of the actorâs current velocity Note: For a one...

**Properties** (1):
  - `upwards_speed`: `float` — [Read-Write] Units per second, in whatever direction the target actor considers âupâ (float)

### `unreal.LayeredMove_JumpTo`
Inherits: `LayeredMoveBase` | Header: `BasicLayeredMoves.h`

JumpTo: Moves this actor in a more jump-like manner - specifying height and distance of jump rather than just upwards speed Note: this layered move is only intended for Mover actors using Z as itâs ...

**Properties** (6):
  - `jump_distance`: `float` — [Read-Write] Distance this jump impulse is supposed to reach (float)
  - `jump_height`: `float` — [Read-Write] Height this jump impulse is supposed to reach (float)
  - `jump_rotation`: `Rotator` — [Read-Write] Direction to jump in. Only used if bUseActorRotation is false (Rotator)
  - `path_offset_curve`: `CurveVector` — [Read-Write] Optional CurveVector used to offset the actor from the path (CurveVector)
  - `time_mapping_curve`: `CurveFloat` — [Read-Write] Optional CurveFloat to modify jump impulse over the duration of the impulse (CurveFloat...
  - `use_actor_rotation`: `bool` — [Read-Write] If true this jump will use the actorâs rotation for jump direction instead of the Jum...

### `unreal.LayeredMove_Launch`
Inherits: `LayeredMoveBase` | Header: `LaunchMove.h`

Launch Move: provides an impulse velocity to the actor after (optionally) forcing them into a particular movement mode

**Properties** (2):
  - `force_movement_mode`: `Name` — [Read-Write] Optional movement mode name to force the actor into before applying the impulse velocit...
  - `launch_velocity`: `Vector` — [Read-Write] Velocity to apply to the actor. Could be additive or overriding depending on MixMode se...

### `unreal.LayeredMove_LinearVelocity`
Inherits: `LayeredMoveBase` | Header: `BasicLayeredMoves.h`

Linear Velocity: A method of inducing a straight-line velocity on an actor over time

**Properties** (3):
  - `magnitude_over_time`: `CurveFloat` — [Read-Write] Optional curve float for controlling the magnitude of the velocity applied to the actor...
  - `settings_flags`: `int` — [Read-Write]
see: ELayeredMove_ConstantVelocitySettingsFlags (uint8)
  - `velocity`: `Vector` — [Read-Write] Units per second, could be worldspace vs relative depending on Flags (Vector)

### `unreal.LayeredMove_MoveTo`
Inherits: `LayeredMoveBase` | Header: `BasicLayeredMoves.h`

MoveTo: Move Actor from the starting location to the target location over a duration of time.

**Properties** (5):
  - `path_offset_curve`: `CurveVector` — [Read-Write] Optional CurveVector used to offset the actor from the path (CurveVector)
  - `restrict_speed_to_expected`: `bool` — [Read-Write] if true, will restrict speed to where the actor is expected to be (in regard to start, ...
  - `start_location`: `Vector` — [Read-Write] Location to Start the MoveTo move from (Vector)
  - `target_location`: `Vector` — [Read-Write] Location to move towards (Vector)
  - `time_mapping_curve`: `CurveFloat` — [Read-Write] Optional CurveFloat to apply to how fast the actor moves as they get closer to the targ...

### `unreal.LayeredMove_MoveToDynamic`
Inherits: `LayeredMove_MoveTo` | Header: `BasicLayeredMoves.h`

MoveToDynamic: Move Actor from the starting location to the target location over a duration of time with a moving target location You can either update TargetLocation manually to update the location t...

**Properties** (1):
  - `location_actor`: `Actor` — this overrides the TargetLocation Property (Actor) [Read-Write] Optional actor to move to. Note

### `unreal.LayeredMove_MultiJump`
Inherits: `LayeredMoveBase` | Header: `MultiJumpLayeredMove.h`

MultiJump: layered move for handling multiple jumps without touching the ground i.e. a double jump. Note: This layered move ends automatically when the actor hits a valid floor so duration is expected...

**Properties** (4):
  - `jumps_in_air_remaining`: `int` [Read-Only] — [Read-Only] (int32)
  - `maximum_in_air_jumps`: `int` — [Read-Write] Maximum Jumps an actor could perform while in the air (int32)
  - `time_of_last_jump_ms`: `float` [Read-Only] — [Read-Only] (float)
  - `upwards_speed`: `float` — [Read-Write] Units per second, in whatever direction the target actor considers âupâ (float)

### `unreal.LayeredMove_RadialImpulse`
Inherits: `LayeredMoveBase` | Header: `BasicLayeredMoves.h`

RadialImpulse applies a velocity pulling or pushing away from a given world location to the target actor

**Properties** (10):
  - `distance_falloff`: `CurveFloat` — [Read-Write] Optional Curvefloat to dictate falloff of velocity as you get further from the velocity...
  - `fixed_world_direction`: `Rotator` — [Read-Write] Direction to apply velocity from the radial impulse in. This is only taken into account...
  - `is_push`: `bool` — [Read-Write] If true the velocity applied will push actor away from location, otherwise this layered...
  - `location`: `Vector` — [Read-Write] Location to pull or push actor from (Vector)
  - `location_actor`: `Actor` — this overrides the Location Property (Actor) [Read-Write] Optional Actor to pull or push this actor ...
  - `magnitude`: `float` — [Read-Write] Magnitude of velocity applied to actors in range (float)
  - `magnitude_over_time`: `CurveFloat` — [Read-Write] Optional Curvefloat to dictate magnitude of velocity applied over time (CurveFloat)
  - `no_vertical_velocity`: `bool` — [Read-Write] Whether to apply vertical velocity (based off mover components up direction) to the act...
  - `radius`: `float` — [Read-Write] Radius from the location to apply radial velocity (float)
  - `use_fixed_world_direction`: `bool` — [Read-Write] If true velocity added to the actor will be in the direction of FixedWorldDirection, ot...

### `unreal.LayeredMove_RootMotionAttribute`
Inherits: `LayeredMoveBase` | Header: `RootMotionAttributeLayeredMove.h`

Root Motion Attribute Move: handles root motion from a meshâs custom attribute, ignoring scaling. Currently only supports Independent ticking mode, and allows controlled movement while jumping/falli...

**Properties** (1):
  - `constrain_world_rot_to_movement_plane`: `bool` — [Read-Write] If true, any root motion rotations will be projected onto the movement plane (in worlds...

### `unreal.LayeredMoveBase`
Inherits: `StructBase` | Header: `LayeredMove.h`

Layered Moves are methods of affecting motion on a Mover-based actor, typically for a limited time. Common uses would be for jumping, dashing, blast forces, etc. They are ticked as part of the Mover s...

**Properties** (5):
  - `duration_ms`: `float` — [Read-Write] This move will expire after a set amount of time if > 0. If 0, it will be ticked only o...
  - `finish_velocity_settings`: `LayeredMoveFinishVelocitySettings` — [Read-Write] Settings related to velocity applied to the actor after a layered move has finished (La...
  - `mix_mode`: `MoveMixMode` — [Read-Write] Determines how this objectâs movement contribution should be mixed with others (MoveM...
  - `priority`: `int` — [Read-Write] Determines if this layered move should take priority over other layered moves when diff...
  - `start_sim_time_ms`: `float` [Read-Only] — [Read-Only] The simulation time this move first ticked (< 0 means it hasnât started yet) (float)

### `unreal.LayeredMoveFinishVelocitySettings`
Inherits: `StructBase` | Header: `LayeredMove.h`

Struct for LayeredMove Finish Velocity options.

**Properties** (3):
  - `clamp_velocity`: `float` — [Read-Write] Actorâs Velocity will be clamped to this value if Mode == ClampVelocity (float)
  - `finish_velocity_mode`: `LayeredMoveFinishVelocityMode` — [Read-Write] What mode we want to happen when a Layered Move ends, see
ELayeredMoveFinishVelocityMod...
  - `set_velocity`: `Vector` — [Read-Write] Velocity that the actor will use if Mode == SetVelocity (Vector)

### `unreal.LayeredMoveGroup`
Inherits: `StructBase` | Header: `LayeredMove.h`

A collection of layered moves affecting a movable actor

**Properties** (3):
  - `apply_residual_velocity`: `bool` [Read-Only] — [Read-Only] If true ResidualVelocity will be the next velocity used for this actor
Note: This is set...
  - `residual_clamping`: `float` [Read-Only] — [Read-Only] Clamps an actors velocity to this value when a layered move ends. This expects Value >= ...
  - `residual_velocity`: `Vector` [Read-Only] — [Read-Only] If bApplyResidualVelocity is true this actors velocity will be set to this.
Note: This i...

### `unreal.MovementModeTickEndState`
Inherits: `StructBase` | Header: `MoverSimulationTypes.h`

Filled out by a MovementMode during simulation tick to indicate its ending state, allowing for a residual time step and switching modes mid-tick

**Properties** (2):
  - `next_mode_name`: `Name` — [Read-Write] (Name)
  - `remaining_ms`: `float` — [Read-Write] Any unused tick time (float)

### `unreal.MovementModifierBase`
Inherits: `StructBase` | Header: `MovementModifier.h`

Movement Modifier: Used to apply changes that indirectly influence the movement simulation, without proposing or executing any movement, but still in sync with the sim. Example usages: changing groups...

**Properties** (2):
  - `duration_ms`: `float` — [Read-Write] This modifier will expire after a set amount of time if > 0. If 0, it will be ticked on...
  - `start_sim_time_ms`: `float` [Read-Only] — [Read-Only] The simulation time this move first ticked (< 0 means it hasnât started yet) (float)

### `unreal.MovementModifierGroup`
Inherits: `StructBase` | Header: `MovementModifier.h`

A collection of movement modifiers affecting a movable actor

### `unreal.MovementModifierHandle`
Inherits: `StructBase` | Header: `MovementModifier.h`

Handle to identify movement modifiers.

### `unreal.MovementRecord`
Inherits: `StructBase` | Header: `MovementRecord.h`

Accounting record of a move as it is processed. Moves are composed of substeps, and these can be marked to indicate how they influence the final collapsed move. Relevancy means the substep (or part th...

### `unreal.MovementSettingsInputs`
Inherits: `MoverDataStructBase` | Header: `PhysicsMoverSimulationTypes.h`

Data block containing movement settings inputs that are networked from client to server. This is useful if settings changes need to be predicted on the client and synced on the server. Also supports r...

**Properties** (2):
  - `acceleration`: `float` — [Read-Write] Maximum acceleration in cm/s^2 (float)
  - `max_speed`: `float` — [Read-Write] Maximum speed in cm/s (float)

### `unreal.MovementSubstep`
Inherits: `StructBase` | Header: `MovementRecord.h`

A part of movement accounting, representing a single piece of a move operation, such as a slide, floor adjustment, etc.

### `unreal.MoverAIInputs`
Inherits: `MoverDataStructBase` | Header: `PhysicsMoverSimulationTypes.h`

Data block containing ROV Velocity that is networked from server to clients. Also supports rewind/resimulation of the data.

**Properties** (1):
  - `rvo_velocity_delta`: `Vector` — [Read-Write] ROV Velocity calculated on the Server (Vector)

### `unreal.MoverAuxStateContext`
Inherits: `StructBase` | Header: `MoverSimulationTypes.h`

Auxiliary state that is input into the simulation (changes rarely)

**Properties** (1):
  - `aux_state_collection`: `MoverDataCollection` — [Read-Write] (MoverDataCollection)

### `unreal.MoverDataCollection`
Inherits: `StructBase` | Header: `MoverTypes.h`

### `unreal.MoverDataPersistence`
Inherits: `StructBase` | Header: `MoverTypes.h`

Info about data collection types that should always be present, and how they should propagate from one frame to the next

**Properties** (2):
  - `copy_from_prior_frame`: `bool` — [Read-Write] If true, values will be copied from the prior frame. Otherwise, they will be default-in...
  - `required_type`: `ScriptStruct` — [Read-Write] The type that should propagate between frames (ScriptStruct)

### `unreal.MoverDataStructBase`
Inherits: `StructBase` | Header: `MoverTypes.h`

Base type for all data structs used to compose Mover simulation model definition dynamically (input cmd, sync state, aux state) NOTE: for simulation state data (sync/aux), derive from FMoverStateData ...

### `unreal.MoverDefaultSyncState`
Inherits: `MoverDataStructBase` | Header: `MoverDataModelTypes.h`

Data block containing basic sync state information

**Properties** (8):
  - `location`: `Vector` — [Read-Write] Position relative to MovementBase if set, world space otherwise (Vector)
  - `move_direction_intent`: `Vector` — [Read-Write] Movement intent direction relative to MovementBase if set, world space otherwise. Magni...
  - `movement_base`: `PrimitiveComponent` [Read-Only] — when moving on a base, input may be relative to this object (PrimitiveComponent) [Read-Only] Optiona...
  - `movement_base_bone_name`: `Name` [Read-Only] — for movement bases that are skeletal meshes, this is the bone weâre based on. Only valid if Moveme...
  - `movement_base_pos`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `movement_base_quat`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `orientation`: `Rotator` — [Read-Write] Forward-facing rotation relative to MovementBase if set, world space otherwise. (Rotato...
  - `velocity`: `Vector` — [Read-Write] Linear velocity, units per second, relative to MovementBase if set, world space otherwi...

### `unreal.MoverInputCmdContext`
Inherits: `StructBase` | Header: `MoverSimulationTypes.h`

The client generates this representation of âinputâ to the simulated actor for one simulation frame. This can be direct mapping of controls, or more abstract data. It is composed of a collection o...

**Properties** (1):
  - `input_collection`: `MoverDataCollection` — [Read-Write] (MoverDataCollection)

### `unreal.MoverLaunchInputs`
Inherits: `MoverDataStructBase` | Header: `PhysicsMoverSimulationTypes.h`

Mover Launch Inputs

**Properties** (2):
  - `launch_velocity`: `Vector` — [Read-Write] Launch velocity in cm/s (Vector)
  - `mode`: `MoverLaunchVelocityMode` — [Read-Write] (MoverLaunchVelocityMode)

### `unreal.MoverOnImpactParams`
Inherits: `StructBase` | Header: `MoverTypes.h`

Struct to hold params for when an impact happens. This contains all of the data for impacts including what gets passed to the FMover_OnImpact delegate

**Properties** (3):
  - `attempted_move_delta`: `Vector` — [Read-Write] The original move that was being performed when the impact happened (Vector)
  - `hit_result`: `HitResult` — [Read-Write] The hit result of the impact (HitResult)
  - `movement_mode_name`: `Name` — [Read-Write] Name of the movement mode this actor is currently in at the time of the impact (Name)

### `unreal.MoverPredictTrajectoryParams`
Inherits: `StructBase` | Header: `MoverSimulationTypes.h`

FMoverPredictTrajectoryParams: parameter block for querying future trajectory samples based on a starting state See UMoverComponent::GetPredictedTrajectory

**Properties** (7):
  - `disable_gravity`: `bool` — [Read-Write] If true, gravity will not taken into account during prediction (bool)
  - `num_prediction_samples`: `int` — [Read-Write] How many samples to predict into the future, including the first sample, which is alway...
  - `optional_input_cmds`: `None` — [Read-Write] Optional input cmds to use, one per sample. If none are specified, prediction will begi...
  - `optional_start_aux_state`: `type` — [Read-Write] Optional starting aux state. If not set, prediction will begin from the current state. ...
  - `optional_start_sync_state`: `type` — [Read-Write] Optional starting sync state. If not set, prediction will begin from the current state....
  - `seconds_per_sample`: `float` — [Read-Write] How much time between predicted samples (float)
  - `use_visual_component_root`: `bool` — [Read-Write] If true, samples are based on the visual component transform, rather than the âupdate...

### `unreal.MoverSyncState`
Inherits: `StructBase` | Header: `MoverSimulationTypes.h`

State we are evolving frame to frame and keeping in sync (frequently changing). It is composed of a collection of typed structs that can be customized per project. Mover actors are required to have FM...

**Properties** (4):
  - `layered_moves`: `LayeredMoveGroup` [Read-Only] — [Read-Only] Additional moves influencing our proposed motion (LayeredMoveGroup)
  - `movement_mode`: `Name` [Read-Only] — [Read-Only] The mode we ended up in from the prior frame, and which weâll start in during the next...
  - `movement_modifiers`: `MovementModifierGroup` [Read-Only] — [Read-Only] Additional modifiers influencing our simulation (MovementModifierGroup)
  - `sync_state_collection`: `MoverDataCollection` — [Read-Write] (MoverDataCollection)

### `unreal.MoverTickEndData`
Inherits: `StructBase` | Header: `MoverSimulationTypes.h`

Contains all state data produced by a simulation tick, including new simulation state

**Properties** (3):
  - `aux_state`: `MoverAuxStateContext` — [Read-Write] (MoverAuxStateContext)
  - `movement_end_state`: `MovementModeTickEndState` — [Read-Write] (MovementModeTickEndState)
  - `sync_state`: `MoverSyncState` — [Read-Write] (MoverSyncState)

### `unreal.MoverTickStartData`
Inherits: `StructBase` | Header: `MoverSimulationTypes.h`

Contains all state data for the start of a simulation tick

**Properties** (3):
  - `aux_state`: `MoverAuxStateContext` [Read-Only] — [Read-Only] (MoverAuxStateContext)
  - `input_cmd`: `MoverInputCmdContext` [Read-Only] — [Read-Only] (MoverInputCmdContext)
  - `sync_state`: `MoverSyncState` [Read-Only] — [Read-Only] (MoverSyncState)

### `unreal.MoverTimeStep`
Inherits: `StructBase` | Header: `MoverTypes.h`

Mover Time Step

**Properties** (3):
  - `base_sim_time_ms`: `float` — [Read-Write] Starting simulation time (in server simulation timespace) (float)
  - `server_frame`: `int` — [Read-Write] The server simulation frame this timestep is associated with (int32)
  - `step_ms`: `float` — [Read-Write] The delta time step for this tick (float)

### `unreal.MovingComponentSet`
Inherits: `StructBase` | Header: `MovementUtilsTypes.h`

Encapsulates components involved in movement. Used by many library functions. Only a scene component is required for movement, but this is typically a primitive component so we provide a pre-cast ptr ...

**Properties** (3):
  - `mover_component`: `MoverComponent` — [Read-Write] (MoverComponent)
  - `updated_component`: `SceneComponent` — [Read-Write] (SceneComponent)
  - `updated_primitive`: `PrimitiveComponent` — [Read-Write] (PrimitiveComponent)

### `unreal.PathedPhysicsMovementInputs`
Inherits: `MoverDataStructBase` | Header: `PathedMovementTypes.h`

Frame inputs for all pathed movement Any property that can change during game time must be delivered in this way, only immutable properties can be safely referenced directly on the object they come fr...

### `unreal.PathedPhysicsMovementState`
Inherits: `MoverDataStructBase` | Header: `PathedMovementTypes.h`

State about the pathed movement that persists from frame to frame

### `unreal.PhysicsStanceModifier`
Inherits: `StanceModifier` | Header: `PhysicsStanceModifier.h`

Physics specialized version of FStanceModifier

### `unreal.PlanarConstraint`
Inherits: `StructBase` | Header: `ConstrainedMoveUtils.h`

Encapsulates info about constraining movement to a plane, such as in a side-scroller

**Properties** (3):
  - `constrain_to_plane`: `bool` — [Read-Write] If true, movement will be constrained to a plane. (bool)
  - `plane_constraint_normal`: `Vector` — [Read-Write] The normal or axis of the plane that constrains movement, if bConstrainToPlane is enabl...
  - `plane_constraint_origin`: `Vector` — [Read-Write] The origin of the plane that constrains movement, if plane constraint is enabled. (Vect...

### `unreal.PointMovementPathPoint`
Inherits: `StructBase` | Header: `PointMovementPathPattern.h`

Point Movement Path Point

**Properties** (2):
  - `basis`: `PointMovementLocationBasis` [Read-Only] — [Read-Only] Basis that the location of this point is relative to (PointMovementLocationBasis)
  - `location`: `Vector` [Read-Only] — [Read-Only] The location to move toward, relative to the path origin (i.e. root component location b...

### `unreal.ProposedMove`
Inherits: `StructBase` | Header: `MovementUtilsTypes.h`

Encapsulates info about an intended move that hasnât happened yet

**Properties** (6):
  - `angular_velocity`: `Rotator` — [Read-Write] Degrees per second, local space (Rotator)
  - `direction_intent`: `Vector` — [Read-Write] Directional, per-axis magnitude [-1, 1] in world space (length of 1 indicates max speed...
  - `has_dir_intent`: `bool` — [Read-Write] Signals whether there was any directional intent specified (bool)
  - `linear_velocity`: `Vector` — [Read-Write] Units per second, world space, possibly mapped onto walking surface (Vector)
  - `mix_mode`: `MoveMixMode` — [Read-Write] Determines how this move should resolve with other moves (MoveMixMode)
  - `preferred_mode`: `Name` — [Read-Write] Indicates that we should switch to a particular movement mode before the next simulatio...

### `unreal.RelativeBaseInfo`
Inherits: `StructBase` | Header: `BasedMovementUtils.h`

Data about the object a Mover actor is basing its movement on, such as when standing on a moving platform

**Properties** (5):
  - `bone_name`: `Name` [Read-Only] — [Read-Only] Bone name on component, for skeletal meshes. NAME_None if not a skeletal mesh or if bone...
  - `contact_local_position`: `Vector` [Read-Only] — [Read-Only] Last captured location of the tethering point where the Mover actor is âattachedâ, r...
  - `location`: `Vector` [Read-Only] — [Read-Only] Last captured worldspace location of MovementBase / Bone (Vector)
  - `movement_base`: `PrimitiveComponent` [Read-Only] — [Read-Only] Component we are moving relative to (PrimitiveComponent)
  - `rotation`: `Quat` [Read-Only] — [Read-Only] Last captured worldspace orientation of MovementBase / Bone (Quat)

### `unreal.SimulationTickParams`
Inherits: `StructBase` | Header: `MoverSimulationTypes.h`

Input parameters to provide context for SimulationTick functions

**Properties** (5):
  - `moving_comps`: `MovingComponentSet` [Read-Only] — [Read-Only] Components involved in movement by the simulation
This will be empty when the simulation...
  - `proposed_move`: `ProposedMove` [Read-Only] — [Read-Only] Proposed movement for this tick (ProposedMove)
  - `sim_blackboard`: `MoverBlackboard` [Read-Only] — [Read-Only] Blackboard (MoverBlackboard)
  - `start_state`: `MoverTickStartData` [Read-Only] — [Read-Only] Simulation state data at the start of the tick, including Input Cmd (MoverTickStartData)
  - `time_step`: `MoverTimeStep` [Read-Only] — [Read-Only] Time and frame information for this tick (MoverTimeStep)

### `unreal.StanceModifier`
Inherits: `MovementModifierBase` | Header: `StanceModifier.h`

Stances: Applies settings to the actor to make them go into different stances like crouch or prone(not implemented), affects actor maxacceleration and capsule height Note: This modifier currently uses...

### `unreal.SwimmingControlSettings`
Inherits: `StructBase` | Header: `SwimmingMode.h`

Controls for the Swimming Movement

**Properties** (42):
  - `angled_speed_cos_angle`: `float` — [Read-Write] Angled multiplier is applied when dot product of velocity and acceleration is < this. (...
  - `angled_speed_multiplier`: `float` — [Read-Write] Speed multiplier when moving off angle (velocity and acceleration divergent) (float)
  - `backwards_speed_cos_angle`: `float` — [Read-Write] Directional multiplier is applied when dot product of velocity and player facing direct...
  - `backwards_speed_multiplier`: `float` — [Read-Write] Directional multiplier when moving mostly backwards (float)
  - `bobbing_exp_drag_down`: `float` — friction/drag opposed to downward velocity, squared with velocity per second. Ramps up faster with h...
  - `bobbing_exp_drag_down_submerged`: `float` — friction/drag opposed to upward velocity, squared with velocity per second. Ramps up faster with hig...
  - `bobbing_exp_drag_multiplier`: `float` — multiplier for the exponential drag. (float) [Read-Write] Bobbing
  - `bobbing_exp_drag_up`: `float` — friction/drag opposed to upward velocity, squared with velocity per second. Ramps up faster with hig...
  - `bobbing_friction_down`: `float` — friction/drag opposed to downward velocity, linear multiplier per second (float) [Read-Write] Bobbin...
  - `bobbing_friction_down_submerged`: `float` — friction/drag opposed to downward velocity, linear multiplier per second. Only used when fully subme...
  - `bobbing_friction_multiplier`: `float` — friction multiplier, multiplies the fluid friction value. (float) [Read-Write] Bobbing
  - `bobbing_friction_up`: `float` — friction/drag opposed to upward velocity, linear multiplier per second (float) [Read-Write] Bobbing
  - `bobbing_ideal_depth_tolerance`: `float` — Slow down strongly when within this tolerance of the ideal immersion depth. Normally we apply drag o...
  - `bobbing_max_force`: `float` — [Read-Write] Bobbing: (float)
  - `boost_drag_multiplier`: `float` — multiplier when in sprint boost to keep from popping up and out as much. (float) [Read-Write] Bobbin...
  - `braking_deceleration`: `float` — [Read-Write] Braking deceleration (decel when letting go of input) (float)
  - `cancel_crouch_immersion_depth`: `float` — [Read-Write] At or below this depth, cancel and disallow crouching. (float)
  - `dbno_swim_immersion_depth`: `float` — [Read-Write] At or below this depth, start swimming in DBNO (float)
  - `friction`: `float` — [Read-Write] Friction, ie how floaty or snappy is changing direction. (float)
  - `friction_direction_change_dot`: `float` — [Read-Write] If Dot(Velocity, Acceleration) < this value, apply FrictionDirectionChangeMultiplier to...
  - `friction_direction_change_multiplier`: `float` — [Read-Write] Friction multiplier (usually < 1) when changing direction. (float)
  - `friction_sprinting`: `float` — [Read-Write] Friction, ie how floaty or snappy is changing direction. (float)
  - `jump_multiplier`: `float` — [Read-Write] Multiplies groundâs jump speed (float)
  - `max_acceleration`: `float` — [Read-Write] Max acceleration. (float)
  - `max_acceleration_sprinting`: `float` — [Read-Write] Max acceleration while sprinting. (float)
  - `max_horizontal_entry_speed`: `float` — [Read-Write] (float)
  - `max_normal_speed`: `float` — [Read-Write] Max speed when not sprinting and moving normally (before water velocity is applied) (fl...
  - `max_speed_down`: `float` — [Read-Write] (float)
  - `max_speed_up`: `float` — [Read-Write] (float)
  - `max_sprint_speed`: `float` — [Read-Write] Max sprint speed (before water velocity is applied) (float)
  - `max_targeting_speed`: `float` — [Read-Write] Max speed when targeting (before water velocity is applied) (float)
  - `max_water_force`: `float` — [Read-Write] Max water force, after WaterVelocity * (WaterForceMultiplier * WaterForceSecondMultipli...
  - `min_sprint_jump_speed`: `float` — [Read-Write] Min speed required (relative to water) to maintain sprint while jumping, otherwise will...
  - `sprint_delay_after_firing`: `float` — [Read-Write] (float)
  - `sprint_jump_air_accel_angle_limit`: `float` — [Read-Write] If accel deviates from velocity by this angle while sprint jumping in air, stop sprint ...
  - `sprint_retrigger_delay`: `float` — [Read-Write] (float)
  - `water_force_multiplier`: `float` — [Read-Write] Multiplier to water force acceleration in direction of current. (float)
  - `water_force_second_multiplier`: `float` — [Read-Write] Multiplier applied on the top of WaterForceMultiplier, to water force acceleration in d...
  - `water_sim_max_time_step`: `float` — [Read-Write] Max time step allowed, to prevent huge forces on hitches. (float)
  - `water_sim_sub_step_time`: `float` — [Read-Write] Simulation sub-step time allowed for higher quality movement (local player and server)....
  - `water_velocity_depth_for_max`: `float` — [Read-Write] At or above this depth, use max velocity. Interps down to WaterVelocityMinMultiplier at...
  - `water_velocity_min_multiplier`: `float` — [Read-Write] Min velocity multiplier applied when depth equals min swimming depth (where they transi...

### `unreal.TeleportEffect`
Inherits: `InstantMovementEffect` | Header: `BasicInstantMovementEffects.h`

Teleport: instantly moves an actor to a new location and rotation For async-compatible teleportation, use AsyncTeleportEffect instead.

**Properties** (3):
  - `target_location`: `Vector` — [Read-Write] Location to teleport to, in world space (Vector)
  - `target_rotation`: `Rotator` — [Read-Write] Actor rotation is set to this value on teleport if bUseActorRotation is false (Rotator)
  - `use_actor_rotation`: `bool` — [Read-Write] Whether this teleport effect should keep the actorâs current rotation or use a specif...

### `unreal.TrajectorySampleInfo`
Inherits: `StructBase` | Header: `MovementUtils.h`

Encapsulates detailed trajectory sample info, from a move that has already occurred or one projected into the future

**Properties** (5):
  - `angular_velocity`: `Rotator` — [Read-Write] Rotational velocity (world space, degrees/sec) (Rotator)
  - `instantaneous_acceleration`: `Vector` — [Read-Write] Acceleration at the time of this sample (world space, units/sec^2) (Vector)
  - `linear_velocity`: `Vector` — [Read-Write] Velocity at the time of this sample (world space, units/sec) (Vector)
  - `sim_time_ms`: `float` — [Read-Write] Time stamp of this sample, in server simulation time (float)
  - `transform`: `Transform` — [Read-Write] Position and orientation (world space) (Transform)

### `unreal.TransitionEvalResult`
Inherits: `StructBase` | Header: `MovementModeTransition.h`

Results from a movement mode transition evaluation

**Properties** (1):
  - `next_mode`: `Name` — [Read-Write] Mode name that should be transitioned to. NAME_None indicates no transition. (Name)

### `unreal.UpdateWaterSplineDataParams`
Inherits: `StructBase` | Header: `WaterMovementUtils.h`

Input parameters for Updating WaterSplineData

**Properties** (6):
  - `capsule_half_height`: `float` — [Read-Write] (float)
  - `player_location`: `Vector` — [Read-Write] (Vector)
  - `player_velocity`: `Vector` — [Read-Write] (Vector)
  - `target_immersion_depth`: `float` — [Read-Write] (float)
  - `water_velocity_depth_for_max`: `float` — [Read-Write] (float)
  - `water_velocity_min_multiplier`: `float` — [Read-Write] (float)

### `unreal.WaterCheckResult`
Inherits: `StructBase` | Header: `WaterMovementUtils.h`

Data about the overlapping volume typically used for swimming

**Properties** (3):
  - `hit_result`: `HitResult` [Read-Only] — [Read-Only] Hit result of the test that found a volume. Includes more specific data about the point ...
  - `swimmable_volume`: `bool` [Read-Only] — [Read-Only] True if the hit found a valid swimmable volume. (bool)
  - `water_spline_data`: `WaterFlowSplineData` [Read-Only] — [Read-Only] Water Spline data to be used in calculating swimming movement, FX, etc. (WaterFlowSpline...

### `unreal.WaterFlowSplineData`
Inherits: `StructBase` | Header: `WaterMovementUtils.h`

Data about the water volume and its interaction with the pawn used in calculating swimming movement

### `unreal.WaterMoveParams`
Inherits: `StructBase` | Header: `WaterMovementUtils.h`

Input parameters for ComputeControlledWaterMove()

**Properties** (15):
  - `acceleration`: `float` — [Read-Write] (float)
  - `deceleration`: `float` — [Read-Write] (float)
  - `delta_seconds`: `float` — [Read-Write] (float)
  - `friction`: `float` — [Read-Write] (float)
  - `max_speed`: `float` — [Read-Write] (float)
  - `move_acceleration`: `Vector` — [Read-Write] (Vector)
  - `move_input`: `Vector` — [Read-Write] (Vector)
  - `move_input_type`: `MoveInputType` — [Read-Write] (MoveInputType)
  - `move_speed`: `float` — [Read-Write] (float)
  - `orientation_intent`: `Rotator` — [Read-Write] (Rotator)
  - `prior_orientation`: `Rotator` — [Read-Write] (Rotator)
  - `prior_velocity`: `Vector` — [Read-Write] (Vector)
  - `turning_boost`: `float` — [Read-Write] (float)
  - `turning_rate`: `float` — [Read-Write] (float)
  - `world_to_gravity_quat`: `Quat` — [Read-Write] (Quat)

### `unreal.AirMovementUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `AirMovementUtils.h`

AirMovementUtils: a collection of stateless static BP-accessible functions for a variety of air movement-related operations

**Methods** (4):
  - `compute_controlled_free_move(params)` -> `ProposedMove` [classmethod] — Generate a new movement based on move/orientation intents and the prior state, unconstrained like when flying
  - `is_valid_landing_spot(moving_comps, location, hit, floor_sweep_distance, max_walk_slope_cosine, out_floor_result)` -> `FloorCheckResult or None` [classmethod] — Checks if a hit result represents a walkable location that an actor can land on
  - `test_falling_move_along_hit_surface(moving_comps, original_move_delta, location_at_hit, target_rotation, handle_impact, floor_sweep_distance, max_walk_slope_cosine, out_hit, out_floor_result, out_hit=HitResult, out_floor_result=FloorCheckResult, out_move_record=MovementRecord)` [classmethod] — Tests potential movement of a component falling/sliding along a surface, while checking for landing on a walkable surfac...
  - `try_move_to_fall_along_surface(moving_comps, delta, pct_of_delta_to_move, rotation, normal, hit, handle_impact, floor_sweep_distance, max_walk_slope_cosine, out_floor_result, hit=HitResult, out_floor_result=FloorCheckResult, move_record=MovementRecord)` [classmethod] — Attempts to move a component along a surface, while checking for landing on a walkable surface. Intended for use while f...

### `unreal.ArcRotationPattern`
Inherits: `PathedMovementPatternBase` | Header: `ArcRotationPathPattern.h`

Arc Rotation Pattern

### `unreal.AsyncFallingMode`
Inherits: `BaseMovementMode` | Header: `AsyncFallingMode.h`

AsyncFallingMode: a default movement mode for moving through the air and jumping, typically influenced by gravity and air control This mode simulates movement without actually modifying any scene comp...

**Methods** (1):
  - `process_landed(base_info=RelativeBaseInfo, tick_end_data=MoverTickEndData)` — Is called at the end of the tick in falling mode. Handles checking any landings that should occur and switching to speci...

**Properties** (9):
  - `air_control_percentage`: `float` — [Read-Write] When falling, amount of movement control available to the actor.
0 = no control, 1 = fu...
  - `cancel_vertical_speed_on_landing`: `bool` — [Read-Write] If true, actor will land and lose all speed in the vertical direction upon landing. If ...
  - `falling_deceleration`: `float` — [Read-Write] Deceleration to apply to air movement when falling slower than terminal velocity.
Note:...
  - `on_landed`: `Mover_OnLanded` — [Read-Write] Broadcast when this actor lands on a valid surface. (Mover_OnLanded)
  - `over_terminal_speed_falling_deceleration`: `float` — [Read-Write] Deceleration to apply to air movement when falling faster than terminal velocity
Note: ...
  - `should_clamp_terminal_vertical_speed`: `bool` — [Read-Write] When exceeding maximum vertical speed, should it be enforced via a hard clamp? If false...
  - `terminal_movement_plane_speed`: `float` — [Read-Write] If the actorâs movement plane velocity is greater than this speed falling will start ...
  - `terminal_vertical_speed`: `float` — [Read-Write] If the actors vertical velocity is greater than this speed VerticalFallingDeceleration ...
  - `vertical_falling_deceleration`: `float` — [Read-Write] Deceleration to apply to vertical velocity when itâs greater than TerminalVerticalSpe...

### `unreal.AsyncFlyingMode`
Inherits: `BaseMovementMode` | Header: `AsyncFlyingMode.h`

AsyncFlyingMode: a default movement mode for moving through the air freely, but still interacting with blocking geometry. The moving actor will remain upright vs the movement plane. This mode is threa...

**Properties** (1):
  - `respect_distance_over_walkable_surfaces`: `bool` — [Read-Write] If true, the actor will âfloatâ above any walkable surfaces to maintain the same he...

### `unreal.AsyncMovementUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `AsyncMovementUtils.h`

AsyncMovementUtils: a collection of stateless static BP-accessible functions focused on testing potential movements in a threadsafe manner without actually causing immediate changes.

**Methods** (2):
  - `test_depenetrating_move(moving_comps, start_location, target_location, start_rotation, target_rotation, should_sweep, out_move_record)` -> `(out_hit=HitResult, out_move_record=MovementRecord) or None` [classmethod] — Tests potential movement of a component without actually moving it, taking penetration resolution issues into account fi...
  - `test_sliding_move_along_hit_surface(moving_comps, original_move_delta, location_at_hit, target_rotation, out_hit, out_hit=HitResult, out_move_record=MovementRecord)` [classmethod] — Tests potential movement of a component sliding along a surface, without actually moving it. Returns the percent of time...

### `unreal.AsyncNavWalkingMode`
Inherits: `BaseMovementMode` | Header: `AsyncNavWalkingMode.h`

AsyncNavWalkingMode: a default movement mode for traversing surfaces and movement bases by using an active navmesh when moving the actor rather than collision checks. Note: This movement mode requires...

**Methods** (2):
  - `get_turn_generator()` -> `Object` — Returns the active turn generator. Note: you will need to cast the return value to the generator you expect to get, it c...
  - `set_turn_generator_class(turn_generator_class)` -> `None` — Sets the active turn generator to use the class provided. Note: To set it back to the default implementation pass in non...

**Properties** (9):
  - `behavior_off_nav_mesh`: `OffNavMeshBehavior` — [Read-Write] What should we do if we stray off the nav mesh? (OffNavMeshBehavior)
  - `nav_mesh_projection_height_scale_down`: `float` — [Read-Write] Scale of the total capsule height to use for projection from navmesh to underlying geom...
  - `nav_mesh_projection_height_scale_up`: `float` — [Read-Write] Scale of the total capsule height to use for projection from navmesh to underlying geom...
  - `nav_mesh_projection_interp_speed`: `float` — Instant (no interp) > 0: Interp speedâ) (float) [Read-Write] Speed at which to interpolate agent n...
  - `nav_mesh_projection_interval`: `float` — [Read-Write] How often we should raycast to project from navmesh to underlying geometry (float)
  - `project_nav_mesh_on_both_world_channels`: `bool` [Read-Only] — [Read-Only] Use both WorldStatic and WorldDynamic channels for NavWalking geometry conforming (bool)
  - `project_nav_mesh_walking`: `bool` — [Read-Write] Whether to raycast to underlying geometry to better conform navmesh-walking actors (boo...
  - `slide_along_nav_mesh_edge`: `bool` — [Read-Write] If attempting to stray off the nav mesh, should we slide along the edge instead? See
Be...
  - `sweep_while_nav_walking`: `bool` — [Read-Write] Whether or not the actor should sweep for collision geometry while walking. (bool)

### `unreal.AsyncWalkingMode`
Inherits: `BaseMovementMode` | Header: `AsyncWalkingMode.h`

AsyncWalkingMode: a default movement mode for traversing surfaces and movement bases (walking, running, sneaking, etc.) This mode simulates movement without actually modifying any scene component(s).

**Methods** (2):
  - `get_turn_generator()` -> `Object` — Returns the active turn generator. Note: you will need to cast the return value to the generator you expect to get, it c...
  - `set_turn_generator_class(turn_generator_class)` -> `None` — Sets the active turn generator to use the class provided. Note: To set it back to the default implementation pass in non...

**Properties** (1):
  - `floor_check_policy`: `StaticFloorCheckPolicy` — [Read-Write] Choice of behavior for floor checks while not moving. (StaticFloorCheckPolicy)

### `unreal.BasedMovementUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `BasedMovementUtils.h`

MovementBaseUtils: a collection of stateless static BP-accessible functions for based movement

**Methods** (15):
  - `get_movement_base_transform(movement_base, bone_name)` -> `(out_location=Vector, out_quat=Quat) or None` [classmethod] — Get the transform (local-to-world) for the given MovementBase, optionally at the location of a bone. Returns false if Mo...
  - `is_a_dynamic_base(movement_base)` -> `bool` [classmethod] — Determine whether MovementBase can possibly move.
  - `is_base_simulating_physics(movement_base)` -> `bool` [classmethod] — Determine whether MovementBaseâs movement is performed via physics.
  - `transform_based_direction_to_world(movement_base, bone_name, local_direction)` -> `Vector or None` [classmethod] — Convert a local direction to a world direction for a given MovementBase. Returns false if MovementBase is nullptr, or if...
  - `transform_based_location_to_world(movement_base, bone_name, local_location)` -> `Vector or None` [classmethod] — Convert a local location to a world location for a given MovementBase. Returns false if MovementBase is nullptr, or if B...
  - `transform_based_rotator_to_world(movement_base, bone_name, local_rotator)` -> `Rotator or None` [classmethod] — Convert a local rotator to world space for a given MovementBase. Returns false if MovementBase is nullptr, or if BoneNam...
  - `transform_direction_to_local(base_quat, world_space_direction)` -> `Vector` [classmethod] — Convert a world direction to a local direction for a given MovementBase, optionally relative to the orientation of a bon...
  - `transform_direction_to_world(base_quat, local_direction)` -> `Vector` [classmethod] — Convert a local direction to a world direction for a given MovementBase. Returns false if MovementBase is nullptr, or if...
  - `transform_location_to_local(base_pos, base_quat, world_space_location)` -> `Vector` [classmethod] — Convert a world location to a local location for a given MovementBase, optionally at the location of a bone. Returns fal...
  - `transform_location_to_world(base_pos, base_quat, local_location)` -> `Vector` [classmethod] — Convert a local location to a world location for a given MovementBase. Returns false if MovementBase is nullptr, or if B...
  - `transform_rotator_to_local(base_quat, world_space_rotator)` -> `Rotator` [classmethod] — Convert a world space rotator to a local rotator for a given MovementBase, optionally relative to the orientation of a b...
  - `transform_rotator_to_world(base_quat, local_rotator)` -> `Rotator` [classmethod] — Convert a local rotator to world space for a given MovementBase. Returns false if MovementBase is nullptr, or if BoneNam...
  - `transform_world_direction_to_based(movement_base, bone_name, world_space_direction)` -> `Vector or None` [classmethod] — Convert a world direction to a local direction for a given MovementBase, optionally relative to the orientation of a bon...
  - `transform_world_location_to_based(movement_base, bone_name, world_space_location)` -> `Vector or None` [classmethod] — Convert a world location to a local location for a given MovementBase, optionally at the location of a bone. Returns fal...
  - `transform_world_rotator_to_based(movement_base, bone_name, world_space_rotator)` -> `Rotator or None` [classmethod] — Convert a world space rotator to a local rotator for a given MovementBase, optionally relative to the orientation of a b...

### `unreal.BaseMovementMode`
Inherits: `Object` | Header: `MovementMode.h`

Base class for all movement modes, exposing simulation update methods for both C++ and blueprint extension

**Methods** (9):
  - `generate_move(start_state, time_step)` -> `ProposedMove` — Generate Move
  - `get_mover_component()` -> `MoverComponent` — Gets the MoverComponent that owns this movement mode
  - `k2_on_generate_move(start_state: MoverTickStartData, time_step: MoverTimeStep)` -> `ProposedMove` — deprecated: âk2_on_generate_moveâ was renamed to âgenerate_moveâ.
  - `k2_on_simulation_tick(params: SimulationTickParams)` -> `MoverTickEndData` — deprecated: âk2_on_simulation_tickâ was renamed to âsimulation_tickâ.
  - `on_activated()` -> `None` — K2 on Activated
  - `on_deactivated()` -> `None` — K2 on Deactivated
  - `on_registered(mode_name)` -> `None` — K2 on Registered
  - `on_unregistered()` -> `None` — K2 on Unregistered
  - `simulation_tick(params)` -> `MoverTickEndData` — Simulation Tick

**Properties** (2):
  - `supports_async`: `bool` [Read-Only] — [Read-Only] Whether this movement mode supports being part of an asynchronous movement simulation (r...
  - `transitions`: `None` [Read-Only] — [Read-Only] Transition checks for the current mode. Evaluated in order, stopping at the first succes...

### `unreal.BaseMovementModeTransition`
Inherits: `Object` | Header: `MovementModeTransition.h`

Base class for all transitions

**Methods** (8):
  - `evaluate(params)` -> `TransitionEvalResult` — Evaluate
  - `get_mover_component()` -> `MoverComponent` — deprecated: âget_mover_componentâ was renamed to âk2_get_mover_componentâ.
  - `k2_get_mover_component()` -> `MoverComponent` — Gets the MoverComponent that ultimately owns this transition
  - `k2_on_evaluate(params: SimulationTickParams)` -> `TransitionEvalResult` — deprecated: âk2_on_evaluateâ was renamed to âevaluateâ.
  - `k2_on_trigger(params: SimulationTickParams)` -> `None` — deprecated: âk2_on_triggerâ was renamed to âtriggerâ.
  - `on_registered()` -> `None` — K2 on Registered
  - `on_unregistered()` -> `None` — K2 on Unregistered
  - `trigger(params)` -> `None` — Trigger

**Properties** (3):
  - `allow_mode_reentry`: `bool` — [Read-Write] Whether this transition should reenter a mode if it evaluates true and wants to transit...
  - `first_sub_step_only`: `bool` — [Read-Write] Whether this transition should only apply to the first step of the update. If true, mod...
  - `supports_async`: `bool` [Read-Only] — [Read-Only] Whether this movement mode transition supports being part of an asynchronous movement si...

### `unreal.BlueprintableTurnGenerator`
Inherits: `Object` | Header: `ModularMovement.h`

Base class for blueprint-implemented turn generators. This is necessary due to the lack of support for specifying EditInlineNew on a BP class, so it has to inherit the flag from a native parent.

**Methods** (1):
  - `get_turn(target_orientation, full_start_state, mover_state, time_step, proposed_move, sim_blackboard)` -> `Rotator` — Returns an additive angular velocity (per-axis degrees/second) based on the starting state and timestep

### `unreal.CharacterMoverComponent`
Inherits: `MoverComponent` | Header: `CharacterMoverComponent.h`

Character Mover Component

**Methods** (12):
  - `can_actor_jump()` -> `bool` — Can this Actor jump?
  - `can_crouch()` -> `bool` — Whether this actor can currently crouch or not
  - `crouch()` -> `None` — Perform crouch on actor
  - `is_airborne()` -> `bool` — Is this actor in a airborne state? (e.g. Flying, Falling)
  - `is_crouching()` -> `bool` — Returns true if currently crouching
  - `is_falling()` -> `bool` — Is this actor in a falling state? Note that this includes upwards motion induced by jumping.
  - `is_flying()` -> `bool` — Returns true if currently flying (moving through a non-fluid volume without resting on the ground)
  - `is_on_ground()` -> `bool` — Is this actor in a grounded state? (e.g. Walking)
  - `is_slope_sliding()` -> `bool` — Is this actor sliding on an unwalkable slope
  - `is_swimming()` -> `bool` — Is this actor in a Swimming state? (e.g. Swimming)
  - `jump()` -> `bool` — Perform jump on actor
  - `un_crouch()` -> `None` — Perform uncrouch on actor

**Properties** (4):
  - `handle_jump`: `bool` — [Read-Write] Whether this component should directly handle jumping or not (bool)
  - `handle_stance_changes`: `bool` — [Read-Write] Whether this component should directly handle stance changes, including crouching input...
  - `on_stance_changed`: `Mover_OnStanceChanged` — [Read-Write] Broadcast when this actor changes stances. (Mover_OnStanceChanged)
  - `wants_to_crouch`: `bool` [Read-Only] — [Read-Only] If true, try to crouch (or keep crouching) on next update. If false, try to stop crouchi...

### `unreal.CommonLegacyMovementSettings`
Inherits: `Object` | Header: `CommonLegacyMovementSettings.h`

CommonLegacyMovementSettings: collection of settings that are shared between several of the legacy movement modes

**Properties** (22):
  - `acceleration`: `float` — [Read-Write] Default max linear rate of acceleration for controlled input. May be scaled based on ma...
  - `air_movement_mode_name`: `Name` — [Read-Write] What movement mode to use when airborne. (Name)
  - `braking_friction`: `float` — [Read-Write] Friction (drag) coefficient applied when braking (whenever Acceleration = 0, or if char...
  - `braking_friction_factor`: `float` — [Read-Write] Factor used to multiply actual value of friction used when braking.
This applies to any...
  - `deceleration`: `float` — [Read-Write] Default max linear rate of deceleration when there is no controlled input (float)
  - `floor_sweep_distance`: `float` — [Read-Write] Max distance to scan for floor surfaces under a Mover actor (float)
  - `ground_friction`: `float` — [Read-Write] Setting that affects movement control. Higher values allow faster changes in direction....
  - `ground_movement_mode_name`: `Name` — [Read-Write] What movement mode to use when on the ground. (Name)
  - `ignore_base_rotation`: `bool` — [Read-Write] Whether the actor ignores changes in rotation of the base it is standing on when using ...
  - `jump_upwards_speed`: `float` — [Read-Write] Instantaneous speed induced in an actor upon jumping (float)
  - `max_speed`: `float` — [Read-Write] Maximum speed in the movement plane (float)
  - `max_step_height`: `float` — [Read-Write] Mover actors will be able to step up onto or over obstacles shorter than this (float)
  - `max_walk_slope_cosine`: `float` — for max slope angle of 30 degrees, value is cosine(30 deg) = 0.866 (float) [Read-Write] Walkable slo...
  - `should_remain_vertical`: `bool` — [Read-Write] If true, the actor will remain upright with gravity despite any rotation applied to the...
  - `swimming_ideal_immersion_depth`: `float` — [Read-Write] Depth at which the pawn will float when in water (float)
  - `swimming_movement_mode_name`: `Name` — [Read-Write] What movement mode to use when airborne. (Name)
  - `swimming_start_immersion_depth`: `float` — [Read-Write] Depth at which the pawn starts swimming (float)
  - `swimming_stop_immersion_depth`: `float` — [Read-Write] Depth at which the pawn stops swimming (float)
  - `turning_boost`: `float` — [Read-Write] Speeds velocity direction changes while turning, to reduce sliding (float)
  - `turning_rate`: `float` — [Read-Write] Maximum rate of turning rotation (degrees per second). Negative numbers indicate instan...
  - `use_acceleration_for_velocity_move`: `bool` — [Read-Write] Should use acceleration for velocity based movement intent?
If true, acceleration is ap...
  - `use_separate_braking_friction`: `bool` — [Read-Write] If true, BrakingFriction will be used to slow the character to a stop (when there is no...

### `unreal.EllipticalMovementPathPattern`
Inherits: `PathedMovementPatternBase` | Header: `EllipticalMovementPathPattern.h`

Elliptical Movement Path Pattern

### `unreal.ExactDampedTurnGenerator`
Inherits: `Object` | Header: `ModularMovement.h`

Modular mechanism for turning a Mover actor in place using an exact damped spring

**Methods** (1):
  - `get_turn(target_orientation, full_start_state, mover_state, time_step, proposed_move, sim_blackboard)` -> `Rotator` — Returns an additive angular velocity (per-axis degrees/second) based on the starting state and timestep

**Properties** (1):
  - `half_life_seconds`: `float` — [Read-Write] Time required to reach halfway to the target orientation (smaller = quicker) (float)

### `unreal.FallingMode`
Inherits: `BaseMovementMode` | Header: `FallingMode.h`

FallingMode: a default movement mode for moving through the air and jumping, typically influenced by gravity and air control

**Methods** (1):
  - `process_landed(base_info=RelativeBaseInfo, tick_end_data=MoverTickEndData)` — Is called at the end of the tick in falling mode. Handles checking any landings that should occur and switching to speci...

**Properties** (9):
  - `air_control_percentage`: `float` — [Read-Write] When falling, amount of movement control available to the actor.
0 = no control, 1 = fu...
  - `cancel_vertical_speed_on_landing`: `bool` — [Read-Write] If true, actor will land and lose all speed in the vertical direction upon landing. If ...
  - `falling_deceleration`: `float` — [Read-Write] Deceleration to apply to air movement when falling slower than terminal velocity.
Note:...
  - `on_landed`: `Mover_OnLanded` — [Read-Write] Broadcast when this actor lands on a valid surface. (Mover_OnLanded)
  - `over_terminal_speed_falling_deceleration`: `float` — [Read-Write] Deceleration to apply to air movement when falling faster than terminal velocity
Note: ...
  - `should_clamp_terminal_vertical_speed`: `bool` — [Read-Write] When exceeding maximum vertical speed, should it be enforced via a hard clamp? If false...
  - `terminal_movement_plane_speed`: `float` — [Read-Write] If the actorâs movement plane velocity is greater than this speed falling will start ...
  - `terminal_vertical_speed`: `float` — [Read-Write] If the actors vertical velocity is greater than this speed VerticalFallingDeceleration ...
  - `vertical_falling_deceleration`: `float` — [Read-Write] Deceleration to apply to vertical velocity when itâs greater than TerminalVerticalSpe...

### `unreal.FloorQueryUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `FloorQueryUtils.h`

FloorQueryUtils: a collection of stateless static BP-accessible functions for a variety of operations involving floor checks

**Methods** (1):
  - `is_hit_surface_walkable(hit, up_direction, max_walk_slope_cosine)` -> `bool` [classmethod] — Is Hit Surface Walkable

### `unreal.FlyingMode`
Inherits: `BaseMovementMode` | Header: `FlyingMode.h`

FlyingMode: a default movement mode for moving through the air freely, but still interacting with blocking geometry. The moving actor will remain upright vs the movement plane.

**Properties** (1):
  - `respect_distance_over_walkable_surfaces`: `bool` — [Read-Write] If true, the actor will âfloatâ above any walkable surfaces to maintain the same he...

### `unreal.GroundMovementUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `GroundMovementUtils.h`

GroundMovementUtils: a collection of stateless static BP-accessible functions for a variety of ground movement-related operations

**Methods** (6):
  - `can_step_up_on_hit_surface(hit)` -> `bool` [classmethod] — Can Step Up on Hit Surface
  - `compute_controlled_ground_move(params)` -> `ProposedMove` [classmethod] — Generate a new movement based on move/orientation intents and the prior state, constrained to the ground movement plane....
  - `compute_deflected_move_onto_ramp(orig_move_delta, up_direction, ramp_hit_result, max_walk_slope_cosine, hit_from_line_trace)` -> `Vector` [classmethod] — Used to change a movement to be along a rampâs surface, typically to prevent slow movement when running up/down a ramp
  - `test_grounded_move_along_hit_surface(moving_comps, original_move_delta, location_at_hit, target_rotation, handle_impact, max_step_height, max_walk_slope_cosine, out_hit, out_hit=HitResult, out_move_record=MovementRecord)` [classmethod] — Tests a potential movement along a walkable surface. Modifies InOutHit with final movement hit data Appends to InOutMove...
  - `test_move_to_adjust_to_floor(moving_comps, location, rotation, max_walk_slope_cosine, out_current_floor, out_current_floor=FloorCheckResult, out_move_record=MovementRecord)` [classmethod] — Tests potential movement of a component up/down to adjust to a walkable floor. Intended for use while performing ground ...
  - `try_walk_to_slide_along_surface(moving_comps, delta, pct_of_delta_to_move, rotation, normal, hit, handle_impact, move_record, max_walk_slope_cosine, hit=HitResult, move_record=MovementRecord)` [classmethod] — Attempts to move a component along a surface in the walking mode. Returns the percent of time applied, with 0.0 meaning ...

### `unreal.ImmediateMovementModeTransition`
Inherits: `BaseMovementModeTransition` | Header: `MovementModeTransition.h`

Simple transition that evaluates true if a ânext modeâ is set. Used internally only by the Mover plugin.

### `unreal.LinearTurnGenerator`
Inherits: `Object` | Header: `ModularMovement.h`

Modular mechanism for turning a Mover actor in place using linear angular velocity.

**Methods** (1):
  - `get_turn(target_orientation, full_start_state, mover_state, time_step, proposed_move, sim_blackboard)` -> `Rotator` — Returns an additive angular velocity (per-axis degrees/second) based on the starting state and timestep

**Properties** (3):
  - `heading_rate`: `float` — [Read-Write] Maximum angular velocity of heading changes (degrees per second). AKA Yaw, AKA Z. Negat...
  - `pitch_rate`: `float` — [Read-Write] Maximum angular velocity of pitch changes (degrees per second). Negative numbers will c...
  - `roll_rate`: `float` — [Read-Write] Maximum angular velocity of roll changes (degrees per second). Negative numbers will ca...

### `unreal.LookAtRotationPattern`
Inherits: `PathedMovementPatternBase` | Header: `LookAtRotationPathPattern.h`

Stare at a single fixed point at all times (pairs nicely with ellipse if you want to always look at the center)

**Methods** (2):
  - `set_look_at_location(look_at)` -> `None` — Set Look at Location
  - `set_relative_look_at_location(relative_look_at)` -> `None` — Set Relative Look at Location

### `unreal.MovementMixer`
Inherits: `Object` | Header: `MovementMixer.h`

Class in charge of Mixing various moves when evaluating/combining moves. The mixer used can be set on the MoverComponent itself.

### `unreal.MovementRecordUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `MovementRecordUtils.h`

MovementRecordUtils: a collection of stateless static BP-accessible functions for movement record related operations

**Methods** (4):
  - `k2_get_relevant_move_delta(movement_record)` -> `Vector` [classmethod] — Get relevant move delta applied to the actor/record
  - `k2_get_relevant_velocity(movement_record)` -> `Vector` [classmethod] — Get relevant velocity applied to the actor/record
  - `k2_get_total_move_delta(movement_record)` -> `Vector` [classmethod] — Get all the move delta applied to the actor/record
  - `k2_set_delta_seconds(out_movement_record, delta_seconds)` -> `MovementRecord` [classmethod] — Sets the delta time these moves took place over

### `unreal.MovementSettingsInterface`
Inherits: `Interface` | Header: `MovementMode.h`

Movement Settings Interface

### `unreal.MovementUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `MovementUtils.h`

MovementUtils: a collection of stateless static BP-accessible functions for a variety of movement-related operations

**Methods** (24):
  - `apply_gravity_to_orientation_intent(intended_orientation, world_to_gravity, stay_vertical = True)` -> `Rotator` [classmethod] — Converts intended orientation into orientation rotated by out current gravity
  - `can_escape_gravity(prior_velocity, new_velocity, gravity_accel, delta_seconds)` -> `bool` [classmethod] — Checks whether a given velocity is strong enough to lift off against gravity
  - `compute_angular_velocity(from_, to, world_to_gravity, delta_seconds, turning_rate_limit = -1.000000)` -> `Rotator` [classmethod] — Computes the angular velocity needed to change from one orientation to another within a time frame. Use the optional Tur...
  - `compute_combined_velocity(params)` -> `Vector` [classmethod] — Returns new velocity based on previous state, movement intent, movement modeâs influence and movement settings
  - `compute_direction_intent(move_input, move_input_type, max_speed)` -> `Vector` [classmethod] — Computes the directional movement intent based on input vector and associated type
  - `compute_slide_delta(moving_comps, delta, pct_of_delta_to_move, normal, hit)` -> `Vector` [classmethod] — Returns an alternative move delta to slide along a surface, based on parameters describing a blocked attempted move
  - `compute_velocity(params)` -> `Vector` [classmethod] — Returns new ground-based velocity (worldspace) based on previous state, movement intent (worldspace), and movement setti...
  - `compute_velocity_from_gravity(gravity_accel, delta_seconds)` -> `Vector` [classmethod] — Returns velocity (units per second) contributed by gravitational acceleration over a given time
  - `compute_velocity_from_positions(from_pos, to_pos, delta_seconds)` -> `Vector` [classmethod] — Computes velocity based on start and end positions over time
  - `constrain_to_plane(vector, movement_plane, maintain_magnitude = True)` -> `Vector` [classmethod] — Ensures input Vector (typically a velocity, acceleration, or move delta) is limited to a movement plane.
  - `deduce_up_direction_from_gravity(gravity_acceleration)` -> `Vector` [classmethod] — Returns the up direction deduced from gravity acceleration, but defaults to mover constants up direction if zero
  - `find_teleport_spot(mover_comp, test_location, test_rotation)` -> `Vector or None` [classmethod] — Try to find an acceptable non-colliding location to place TestActor as close to possible to TestLocation. Expects TestLo...
  - `get_gravity_vertical_component(vector, up_direction)` -> `Vector` [classmethod] — Returns the component of the vector in the gravity-space vertical direction.
  - `is_angular_velocity_zero(angular_velocity)` -> `bool` [classmethod] — Returns whether this rotator representing angular velocity has any non-zero values. This function exists due to FRotator...
  - `is_exceeding_max_speed(velocity, max_speed)` -> `bool` [classmethod] — Checks whether a given velocity is exceeding a maximum speed, with some leeway to account for numeric imprecision
  - `project_to_gravity_floor(vector, up_direction)` -> `Vector` [classmethod] — Project a vector onto the floor defined by the gravity direction.
  - `test_encroachment(mover_comp, test_location, test_rotation)` -> `bool` [classmethod] — Returns whether MoverCompâs Actor would encroach at TestLocation on something that blocks it.
  - `test_encroachment_and_adjust(mover_comp, test_location, test_rotation)` -> `Vector or None` [classmethod] — Returns whether MoverCompâs Actor would encroach at TestLocation on something that blocks it. If blocked, weâll atte...
  - `try_move_to_slide_along_surface(moving_comps, delta, pct_of_delta_to_move, rotation, normal, hit, handle_impact, hit=HitResult, move_record=MovementRecord)` [classmethod] — Attempts to move a component along a surface. Returns the percent of time applied, with 0.0 meaning no movement occurred...
  - `try_move_to_slide_along_surface_no_movement_record(moving_comps, delta, pct_of_delta_to_move, rotation, normal, hit, hit=HitResult)` [classmethod] — Attempts to move a component along a surface. Returns the percent of time applied, with 0.0 meaning no movement occurred...
  - `try_safe_move_and_slide_updated_component(moving_comps, delta, new_rotation, sweep, out_hit, teleport, move_record, out_hit=HitResult, move_record=MovementRecord)` [classmethod] — Attempts to move a component and resolve any penetration issues with the proposed move Delta. This function handles bloc...
  - `try_safe_move_and_slide_updated_component_no_movement_record(moving_comps, delta, new_rotation, sweep, out_hit, teleport, out_hit=HitResult)` [classmethod] — Attempts to move a component and resolve any penetration issues with the proposed move Delta. This function handles bloc...
  - `try_safe_move_updated_component(moving_comps, delta, new_rotation, sweep, out_hit, teleport, move_record)` -> `(out_hit=HitResult, move_record=MovementRecord) or None` [classmethod] — Attempts to move a component and resolve any penetration issues with the proposed move Delta Note: This function takes a...
  - `try_safe_move_updated_component_no_movement_record(moving_comps, delta, new_rotation, sweep, out_hit, teleport)` -> `HitResult or None` [classmethod] — Attempts to move a component and resolve any penetration issues with the proposed move Delta Note: This function doesnâ...

### `unreal.MoverBlackboard`
Inherits: `Object` | Header: `MoverBlackboard.h`

MoverBlackboard: this is a simple generic map that can store any type, used as a way for decoupled systems to store calculations or transient state data that isnât necessary to reconstitute the move...

### `unreal.MoverComponent`
Inherits: `ActorComponent` | Header: `MoverComponent.h`

Mover Component

**Methods** (47):
  - `add_gameplay_tag(tag_to_add)` -> `None` — Adds a gameplay tag to this Mover Component. Note: Duplicate tags will not be added
  - `add_gameplay_tags(tags_to_add)` -> `None` — Adds a series of gameplay tags to this Mover Component Note: Duplicate tags will not be added
  - `add_movement_mode_from_class(mode_name, movement_mode)` -> `BaseMovementMode` — Add a movement mode to available movement modes. Returns true if the movement mode was added successfully. Returns the m...
  - `add_movement_mode_from_object(mode_name, movement_mode)` -> `bool` — Add a movement mode to available movement modes. Returns true if the movement mode was added successfully
  - `bind_process_generated_movement(process_generated_movement_event)` -> `None` — Binds event for processing movement after it has been generated. Allows for final modifications to proposed movement bef...
  - `cancel_modifier_from_handle(modifier_handle)` -> `None` — Cancel any active or queued Modifiers with the handle passed in.
  - `find_movement_mode(movement_mode)` -> `BaseMovementMode` — Find Movement Mode
  - `find_movement_mode_by_name(movement_mode_name)` -> `BaseMovementMode` — Find Movement Mode by Name
  - `find_shared_settings_bp(shared_setting)` -> `Object` — Find settings object by type. Returns null if there is none of that type
  - `find_shared_settings_mutable_bp(shared_setting)` -> `Object` — Find mutable settings object by type. Returns null if there is none of that type
  - `get_base_visual_component_transform()` -> `Transform` — Gets BaseVisualComponentTransform used for cases where we want to move the visual component away from the root component...
  - `get_future_trajectory(future_seconds, samples_per_second)` -> `Array [ TrajectorySampleInfo ]` — Get Future Trajectory
  - `get_gravity_acceleration()` -> `Vector` — Get the current acceleration due to gravity (cm/s^2) in worldspace
  - `get_last_input_cmd()` -> `MoverInputCmdContext` — Access the most recently-used inputs.
  - `get_last_time_step()` -> `MoverTimeStep` — Get the most recent TimeStep
  - `get_movement_base()` -> `PrimitiveComponent` — Get the current movement base. Null if there isnât one.
  - `get_movement_base_bone_name()` -> `Name` — Get the current movement base bone, NAME_None if there isnât one.
  - `get_movement_intent()` -> `Vector` — Get the intended movement direction in worldspace with magnitude (range 0-1)
  - `get_movement_mode()` -> `BaseMovementMode` — Get the current movement mode
  - `get_movement_mode_name()` -> `Name` — Get the current movement mode name
  - `get_planar_constraint()` -> `PlanarConstraint` — Access the planar constraint that may be limiting movement direction
  - `get_predicted_trajectory(prediction_params)` -> `Array [ TrajectorySampleInfo ]` — Get a sampling of where the actor is projected to be in the future, based on a current state. Note that this is projecti...
  - `get_primary_visual_component()` -> `SceneComponent` — Access the primary visual component of the actor
  - `get_sim_blackboard()` -> `MoverBlackboard` — Access the read-only version of the Moverâs Blackboard
  - `get_sync_state()` -> `MoverSyncState` — Access the most recent captured sync state.
  - `get_target_orientation()` -> `Rotator` — Get the orientation that the actor is moving towards
  - `get_up_direction()` -> `Vector` — Get the normalized direction considered âupâ in worldspace. Typically aligned with gravity, and typically determines...
  - `get_updated_component()` -> `SceneComponent` — Access the root component of the actor that our Mover simulation is moving
  - `get_velocity()` -> `Vector` — Get the current velocity (units per second, worldspace)
  - `handle_impact()` -> `MoverOnImpactParams` — Handle a blocking impact.
  - `has_gameplay_tag(tag_to_find, exact_match)` -> `bool` — Check Mover systems for a gameplay tag.
  - `has_valid_cached_input_cmd()` -> `bool` — Has Valid Cached Input Cmd deprecated: HasValidCachedInputCmd has been deprecated, and is not needed since we no longer ...
  - `has_valid_cached_state()` -> `bool` — Has Valid Cached State deprecated: HasValidCachedState has been deprecated, and is not needed since we no longer wait un...
  - `is_modifier_active_or_queued(modifier_handle)` -> `bool` — Checks if the modifier handle passed in is active or queued on this mover component
  - `is_using_deferred_group_movement()` -> `bool` — Returns true if this component is actually using grouped movement updates, which checks the flag and any global settings
  - `queue_next_mode(desired_mode_name, should_reenter = False)` -> `None` — Queue a movement mode change to occur during the next simulation frame. If bShouldReenter is true, then a mode change wi...
  - `remove_gameplay_tag(tag_to_remove)` -> `None` — Removes a gameplay tag from this Mover Component
  - `remove_gameplay_tags(tags_to_remove)` -> `None` — Removes gameplay tags from this Mover Component
  - `remove_movement_mode(mode_name)` -> `bool` — Removes a movement mode from available movement modes. Returns number of modes removed from the available movement modes...
  - `set_base_visual_component_transform(component_transform)` -> `None` — Sets BaseVisualComponentTransform used for cases where we want to move the visual component away from the root component...
  - `set_gravity_override(override_gravity, gravity_acceleration = [0.000000,0.000000,0.000000])` -> `None` — Set gravity override, as a directional acceleration in worldspace. Gravity on Earth would be {x=0,y=0,z=-980}
  - `set_planar_constraint(constraint)` -> `None` — Sets planar constraint that can limit movement direction
  - `set_primary_visual_component(scene_component)` -> `None` — Sets this Mover actorâs primary visual component. Must be a descendant of the updated component that acts as our movem...
  - `set_updated_component(new_updated_component)` -> `None` — Sets which component weâre using as the root of our movement
  - `set_use_deferred_group_movement(enable)` -> `None` — Sets whether this mover component can use grouped movement updates, which improve performance but can cause attachments ...
  - `try_get_floor_check_hit_result()` -> `HitResult or None` — Access the most recent floor check hit result.
  - `unbind_process_generated_movement()` -> `None` — Clears current bound event for processing movement after it has been generated.

**Properties** (15):
  - `gravity_to_world_transform`: `Quat` [Read-Only] — [Read-Only] A cached quaternion representing the inverse rotation from world space to gravity relati...
  - `input_producer`: `Object` — [Read-Write] Optional object for producing input cmds. Typically set at BeginPlay time. If not speci...
  - `movement_mixer`: `MovementMixer` — [Read-Write] Optional object for mixing proposed moves.Typically set at BeginPlay time. If not speci...
  - `movement_modes`: `None` [Read-Only] — [Read-Only] (Map[Name,BaseMovementMode])
  - `on_movement_mode_changed`: `Mover_OnMovementModeChanged` — [Read-Write] Broadcast when a MovementMode has changed. Happens during a simulation tick if the mode...
  - `on_post_finalize`: `Mover_OnPostFinalize` — [Read-Write] Broadcast after each finalized simulation frame, after the state is finalized. (Game th...
  - `on_post_simulation_rollback`: `Mover_OnPostSimRollback` — [Read-Write] Broadcast when a rollback has occurred, just before the next simulation tick occurs (Mo...
  - `on_post_simulation_tick`: `Mover_OnPostSimTick` — [Read-Write] Broadcast after each simulation tick and the state is finalized (Mover_OnPostSimTick)
  - `on_pre_movement`: `Mover_OnPreMovement` — [Read-Write] Broadcast during the simulation tick after inputs have been processed, but before the a...
  - `on_pre_simulation_tick`: `Mover_OnPreSimTick` — [Read-Write] Broadcast before each simulation tick.
Note - Guaranteed to run on the game thread (eve...
  - `persistent_sync_state_data_types`: `None` — [Read-Write] List of types that should always be present in this actorâs sync state (Array[MoverDa...
  - `smoothing_mode`: `MoverSmoothingMode` — [Read-Write] If enabled, the movement of the primary visual component will be smoothed via an offset...
  - `starting_movement_mode`: `Name` [Read-Only] — [Read-Only] Name of the first mode to start in when simulation begins. Must have a mapping in Moveme...
  - `transitions`: `None` — [Read-Write] Transition checks that are always evaluated regardless of mode. Evaluated in order, sto...
  - `world_to_gravity_transform`: `Quat` [Read-Only] — [Read-Only] A cached quaternion representing the rotation from world space to gravity relative space...

### `unreal.MoverDataCollectionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MoverTypes.h`

Blueprint helper functions for working with a Mover data collection

**Methods** (1):
  - `clear_data_from_collection(collection)` -> `MoverDataCollection` [classmethod] — Clears all data from a collection

### `unreal.MoverDataModelBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MoverDataModelTypes.h`

Blueprint function library to make it easier to work with Mover data structs, since we canât add UFUNCTIONs to structs

**Methods** (6):
  - `get_location_from_sync_state(sync_state)` -> `Vector` [classmethod] — Returns the location in world space
  - `get_move_direction_intent_from_inputs(inputs)` -> `Vector` [classmethod] — Returns the move direction intent, if any, in world space
  - `get_move_direction_intent_from_sync_state(sync_state)` -> `Vector` [classmethod] — Returns the move direction intent, if any, in world space
  - `get_orientation_from_sync_state(sync_state)` -> `Rotator` [classmethod] — Returns the orientation in world space
  - `get_velocity_from_sync_state(sync_state)` -> `Vector` [classmethod] — Returns the velocity in world space
  - `set_move_intent(inputs, world_direction_intent)` -> `CharacterDefaultInputs` [classmethod] — Sets move inputs from worldspace intent, as a per-axis magnitude in the range [-1,1] Zero vector indicates intent to sto...

### `unreal.MoverDebugComponent`
Inherits: `ActorComponent` | Header: `MoverDebugComponent.h`

Component to help display debug information for actors using the Mover Component. Is expected to be attached to the actor that has the mover component. Currently supports trajectory functionality and ...

**Methods** (2):
  - `get_past_trajectory()` -> `Array [ TrajectorySampleInfo ]` — Get a read-only sampling of where the actor has recently been, ordered by ascending age. Will be empty unless history tr...
  - `set_history_tracking(seconds_to_track, samples_per_second)` -> `None` — Change history tracking feature settings. Anything <= 0 for SecondsToTrack will disable the feature.

**Properties** (7):
  - `history_samples_per_second`: `int` [Read-Only] — [Read-Only] Target sampling rate for history tracking. Note that sampling rate is variable and may b...
  - `history_tracking_seconds`: `float` [Read-Only] — [Read-Only] Begin Motion history tracking
Max age of tracked samples. Feature is disabled for values...
  - `lookahead_samples_per_second`: `int` — [Read-Write] Number of times trajectory will be sampled each second (int32)
  - `lookahead_seconds`: `float` — [Read-Write] Number of seconds to lookahead and show the current trajectory (float)
  - `show_corrections`: `bool` — [Read-Write] Whether this component should show the corrections and rollbacks applied to the Actor i...
  - `show_trail`: `bool` — [Read-Write] Whether this component should show the trail of the movement component of the Actor itâ...
  - `show_trajectory`: `bool` — [Read-Write] Whether this component should show the trajectory of the movement component of the Acto...

### `unreal.MoverInputProducerInterface`
Inherits: `Interface` | Header: `MoverSimulationTypes.h`

Mover Input Producer Interface

**Methods** (1):
  - `produce_input(sim_time_ms)` -> `MoverInputCmdContext` — Contributes additions to the input cmd for this simulation frame. Typically this is translating accumulated user input (...

### `unreal.MoverNetworkPhysicsLiaisonComponent`
Inherits: `MoverNetworkPhysicsLiaisonComponentBase` | Header: `MoverNetworkPhysicsLiaison.h`

MoverNetworkPhysicsLiaisonComponent: This component acts as a middleman between an actorâs Mover component and the chaos physics network prediction system. This class is set on a Mover component as ...

### `unreal.MoverNetworkPhysicsLiaisonComponentBase`
Inherits: `ActorComponent` | Header: `MoverNetworkPhysicsLiaisonBase.h`

Base class for liaison components to act as a middleman between an actorâs Mover component and the Chaos physics network prediction system to move the Moverâs updated component on the physics thre...

### `unreal.MoverNetworkPredictionLiaisonComponent`
Inherits: `NetworkPredictionComponent` | Header: `MoverNetworkPredictionLiaison.h`

MoverNetworkPredictionLiaisonComponent: this component acts as a middleman between an actorâs Mover component and the Network Prediction plugin. This class is set on a Mover component as the âback...

### `unreal.MoverPathedPhysicsLiaisonComponent`
Inherits: `MoverNetworkPhysicsLiaisonComponentBase` | Header: `MoverPathedPhysicsLiaison.h`

Liaison that works with path-following movement modes. Establishes a joint constraint between the actual component to update and wherever it should be along the path. This allows the platformâs velo...

### `unreal.MoverSimulation`
Inherits: `Object` | Header: `MoverSimulation.h`

WIP Base class for a Mover simulation. The simulation is intended to be the thing that updates the Mover state and should be safe to run on an async thread

**Methods** (2):
  - `get_blackboard()` -> `MoverBlackboard` — Get Blackboard
  - `get_blackboard_mutable()` -> `MoverBlackboard` — Get Blackboard Mutable

### `unreal.MoverStandaloneLiaisonComponent`
Inherits: `ActorComponent` | Header: `MoverStandaloneLiaison.h`

MoverStandaloneLiaison: this component acts as a backend driver for an actorâs Mover component, for use in Standalone (non-networked) games. This class is set on a Mover component as the âback end...

**Methods** (7):
  - `add_tick_dependency(other_component, tick_order, tick_phase)` -> `None` — Adds a tick dependency between another component and one of moverâs tick functions.
  - `get_enable_produce_input()` -> `bool` — Whether this instance will have its produce-input tick called.
  - `get_use_async_movement_simulation_tick()` -> `bool` — Get Use Async Movement Simulation Tick
  - `get_use_async_produce_input()` -> `bool` — Get Use Async Produce Input
  - `set_enable_produce_input(enable_input_production)` -> `None` — Sets whether this instanceâs produce-input tick will run at all. It may be useful to disable on actors that donât re...
  - `set_use_async_movement_simulation_tick(use_async_movement_sim)` -> `None` — Sets whether this instanceâs movement simulation tick can run on worker threads or not. See bUseAsyncMovementSimulatio...
  - `set_use_async_produce_input(use_async_input_production)` -> `None` — Sets whether this instanceâs produce input can run on worker threads or not. See bUseAsyncProduceInput: and SetEnableP...

### `unreal.MoverTrajectoryPredictor`
Inherits: `Object` | Header: `MoverPoseSearchTrajectoryPredictor.h`

Trajectory predictor that can query from a Mover-driven actor, for use with Pose Search

**Methods** (5):
  - `get_current_state(out_facing=Quat, out_velocity=Vector)` — Get Current State
  - `get_gravity()` -> `Vector` — Get Gravity
  - `get_velocity()` -> `Vector` — Get Velocity
  - `predict(num_prediction_samples, seconds_per_prediction_sample, num_history_samples)` -> `TransformTrajectory` — Predict
  - `setup(mover_component)` -> `None` — Setup

### `unreal.NavMoverComponent`
Inherits: `ActorComponent` | Header: `NavMoverComponent.h`

NavMoverComponent: Responsible for implementing INavMoveInterface with UMoverComponent so pathfinding and other forms of navigation movement work. This component also caches the input given to it that...

**Methods** (12):
  - `consume_nav_movement_data()` -> `(out_move_input_intent=Vector, out_move_input_velocity=Vector) or None` — Writes internal cached requested velocities to the MoveInput passed in. Returns true if it had move input to write.
  - `get_max_speed_for_nav_movement()` -> `float` — Get the max speed of the movement component
  - `get_velocity_for_nav_movement()` -> `Vector` — Get the current velocity of the movement component
  - `is_crouching()` -> `bool` — Returns true if currently crouching
  - `is_falling()` -> `bool` — Returns true if currently falling (not flying, in a non-fluid volume, and not on the ground)
  - `is_flying()` -> `bool` — Returns true if currently flying (moving through a non-fluid volume without resting on the ground)
  - `is_moving_on_ground()` -> `bool` — Returns true if currently moving on the ground (e.g. walking or driving)
  - `is_swimming()` -> `bool` — Returns true if currently swimming (moving through a fluid volume)
  - `request_direct_move(move_velocity, force_max_speed)` -> `None` — path following: request movement through a velocity directly
  - `request_path_move(move_input)` -> `None` — path following: request movement through a new move input (normal vector = full strength)
  - `stop_active_movement()` -> `None` — Stops applying further movement (usually zeros acceleration).
  - `stop_movement_keep_pathing()` -> `None` — Stops movement immediately (reset velocity) but keeps following current path

**Properties** (1):
  - `nav_movement_properties`: `NavMovementProperties` — [Read-Write] associated properties for nav movement (NavMovementProperties)

### `unreal.NavWalkingMode`
Inherits: `BaseMovementMode` | Header: `NavWalkingMode.h`

NavWalkingMode: a default movement mode for traversing surfaces and movement bases by using an active navmesh when moving the actor rather than collision checks. Note: This movement mode requires a Na...

**Methods** (2):
  - `get_turn_generator()` -> `Object` — Returns the active turn generator. Note: you will need to cast the return value to the generator you expect to get, it c...
  - `set_turn_generator_class(turn_generator_class)` -> `None` — Sets the active turn generator to use the class provided. Note: To set it back to the default implementation pass in non...

**Properties** (10):
  - `behavior_off_nav_mesh`: `OffNavMeshBehavior` — [Read-Write] What should we do if we stray off the nav mesh? (OffNavMeshBehavior)
  - `nav_mesh_projection_height_scale_down`: `float` — [Read-Write] Scale of the total capsule height to use for projection from navmesh to underlying geom...
  - `nav_mesh_projection_height_scale_up`: `float` — [Read-Write] Scale of the total capsule height to use for projection from navmesh to underlying geom...
  - `nav_mesh_projection_interp_speed`: `float` — Instant (no interp) > 0: Interp speedâ) (float) [Read-Write] Speed at which to interpolate agent n...
  - `nav_mesh_projection_interval`: `float` — [Read-Write] How often we should raycast to project from navmesh to underlying geometry (float)
  - `nav_mover_component`: `NavMoverComponent` [Read-Only] — [Read-Only] Associated Movement component that will actually move the actor (NavMoverComponent)
  - `project_nav_mesh_on_both_world_channels`: `bool` [Read-Only] — [Read-Only] Use both WorldStatic and WorldDynamic channels for NavWalking geometry conforming (bool)
  - `project_nav_mesh_walking`: `bool` [Read-Only] — [Read-Only] Whether to raycast to underlying geometry to better conform navmesh-walking actors (bool...
  - `slide_along_nav_mesh_edge`: `bool` — [Read-Write] If attempting to stray off the nav mesh, should we attempt to slide along the edge inst...
  - `sweep_while_nav_walking`: `bool` — [Read-Write] Whether or not the actor should sweep for collision geometry while walking. (bool)

### `unreal.NullMovementMode`
Inherits: `BaseMovementMode` | Header: `MovementMode.h`

NullMovementMode: a default do-nothing mode used as a placeholder when no other mode is active

### `unreal.PathedMovementPatternBase`
Inherits: `Object` | Header: `PathedMovementPatternBase.h`

Pathed Movement Pattern Base

### `unreal.PathedPhysicsDebugDrawComponent`
Inherits: `DebugDrawComponent` | Header: `PathedPhysicsDebugDrawComponent.h`

todo: DanH: Ideally clicking anything drawn by this would select the mover comp in the editor. I think I need a whole FComponentVisualizer set up for that though?

### `unreal.PathedPhysicsMovementMode`
Inherits: `BaseMovementMode` | Header: `PathedMovementMode.h`

Base for any movement mode that proceeds along a defined path within a specified amount of time Only functional when used in concert with a PathedPhysicsMoverComponent and MoverPathedPhysicsLiaisonCom...

**Methods** (3):
  - `bp_find_pattern(pattern_type)` -> `PathedMovementPatternBase` — Finds the first path pattern on this mode of the given type, if there is one
  - `set_path_duration_begin_play_only(new_duration)` -> `None` — Set the time it takes to travel one way along this path from start to end. Only valid to call in BeginPlay or the Constr...
  - `set_use_joint_constraint(use_joint)` -> `None` — Set Use Joint Constraint

**Properties** (6):
  - `custom_easing_curve`: `CurveFloat` [Read-Only] — [Read-Only] If using a custom ease, this is the curve that will be used. If blank, will fall back to...
  - `easing`: `AlphaBlendOption` [Read-Only] — [Read-Only] The kind of easing to apply when traveling along the path (AlphaBlendOption)
  - `one_way_trip_duration`: `float` [Read-Only] — [Read-Only] Total duration in seconds of a one-way trip from start to end. (float)
  - `path_patterns`: `None` [Read-Only] — [Read-Only] The set of patterns to follow that combine to form the path the component will follow Ea...
  - `playback_behavior_override`: `type` [Read-Only] — [Read-Only] Optional playback behavior override for this mode specifically (âundefinedâ)
  - `use_joint_constraint`: `bool` [Read-Only] — [Read-Only] True to have the updated component be able to respond to physics inputs by being âpull...

### `unreal.PathedPhysicsMoverComponent`
Inherits: `MoverComponent` | Header: `PathedPhysicsMoverComponent.h`

Pathed Physics Mover Component

**Methods** (9):
  - `get_default_playback_behavior()` -> `PathedPhysicsPlaybackBehavior` — Get Default Playback Behavior
  - `get_path_origin_transform()` -> `Transform` — Get Path Origin Transform
  - `is_in_reverse()` -> `bool` — Is in Reverse
  - `is_joint_enabled()` -> `bool` — Is Joint Enabled
  - `is_moving()` -> `bool` — Is Moving
  - `set_default_playback_behavior(playback_behavior)` -> `None` — Set Default Playback Behavior
  - `set_is_moving(should_move)` -> `None` — Set Is Moving
  - `set_path_origin_transform(new_path_origin)` -> `None` — Changes path origin (i.e. the transform at the very beginning), causing the whole path to shift accordlingly. The update...
  - `set_playback_direction(play_forward)` -> `None` — Set Playback Direction

**Properties** (2):
  - `default_playback_behavior`: `PathedPhysicsPlaybackBehavior` — [Read-Write] Default follow behavior for the path as a whole (PathedPhysicsPlaybackBehavior)
  - `movement_start_delay`: `float` [Read-Only] — [Read-Only] How long after being told to StartMoving() to delay before actually moving. Generally us...

### `unreal.PhysicsCharacterMoverComponent`
Inherits: `CharacterMoverComponent` | Header: `PhysicsCharacterMoverComponent.h`

Physics Character Mover Component

### `unreal.PhysicsDrivenFallingMode`
Inherits: `FallingMode` | Header: `PhysicsDrivenFallingMode.h`

PhysicsDrivenFallingMode: Override base kinematic falling mode for physics based motion.

### `unreal.PhysicsDrivenFlyingMode`
Inherits: `FlyingMode` | Header: `PhysicsDrivenFlyingMode.h`

PhysicsDrivenFlyingMode: Override base kinematic flying mode for physics based motion.

### `unreal.PhysicsDrivenSwimmingMode`
Inherits: `SwimmingMode` | Header: `PhysicsDrivenSwimmingMode.h`

PhysicsDrivenSwimmingMode: Override base kinematic Swimming mode for physics based motion.

### `unreal.PhysicsDrivenWalkingMode`
Inherits: `WalkingMode` | Header: `PhysicsDrivenWalkingMode.h`

PhysicsDrivenWalkingMode: Override base kinematic walking mode for physics based motion.

### `unreal.PhysicsJumpCheck`
Inherits: `BaseMovementModeTransition` | Header: `PhysicsJumpCheck.h`

Transition that handles jumping based on input for a physics-based character

**Properties** (3):
  - `fractional_ground_reaction_impulse`: `float` — [Read-Write] Controls how much of the jump impulse the character will apply to the ground.
A value o...
  - `jump_upwards_speed`: `float` — [Read-Write] Instantaneous speed induced in an actor upon jumping (float)
  - `transition_to_mode`: `Name` — [Read-Write] Name of movement mode to transition to when jumping is activated (Name)

### `unreal.PhysicsLaunchCheck`
Inherits: `BaseMovementModeTransition` | Header: `PhysicsLaunchCheck.h`

Transition that handles launching based on input for a physics-based character

**Properties** (1):
  - `transition_to_mode`: `Name` — Name of movement mode to transition to when launch is activated.
If set to None launching will not c...

### `unreal.PlanarConstraintUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `ConstrainedMoveUtils.h`

PlanarConstraintUtils: a collection of stateless static BP-accessible functions for working with planar constraints

**Methods** (6):
  - `constrain_direction_to_plane(constraint, direction, maintain_magnitude = False)` -> `Vector` [classmethod] — Constrains a direction to be on the plane, if enabled
  - `constrain_location_to_plane(constraint, location)` -> `Vector` [classmethod] — Constrains a location to be on the plane, if enabled
  - `constrain_normal_to_plane(constraint, normal)` -> `Vector` [classmethod] — Constrains a normal to be on the plane, if enabled. Result will be re-normalized.
  - `set_planar_constraint_enabled(constraint, enabled)` -> `PlanarConstraint` [classmethod] — Sets whether or not the constraint is enabled
  - `set_planar_constraint_normal(constraint, plane_normal)` -> `PlanarConstraint` [classmethod] — Sets the normal of the plane that constrains movement, enforced if the plane constraint is enabled.
  - `set_plane_constraint_origin(constraint, plane_origin)` -> `PlanarConstraint` [classmethod] — Sets the origin of the plane that constrains movement, enforced if the plane constraint is enabled.

### `unreal.PlayMoverMontageCallbackProxy`
Inherits: `PlayMontageCallbackProxy` | Header: `PlayMoverMontageCallbackProxy.h`

Runtime object used as a proxy to an async blueprint task node that runs animation montages on Mover actors. This leverages parent UPlayMontageCallbackProxy to perform animation, while adding an accom...

### `unreal.PointMovementPathPattern`
Inherits: `PathedMovementPatternBase` | Header: `PointMovementPathPattern.h`

Movement pattern that moves between explicitly defined points

**Properties** (1):
  - `path_points`: `None` — [Read-Write] Relative point locations to move toward, in sequence from first to last (Array[PointMov...

### `unreal.SplineMovementPathPattern`
Inherits: `PathedMovementPatternBase` | Header: `SplineMovementPathPattern.h`

Spline Movement Path Pattern

### `unreal.StanceSettings`
Inherits: `Object` | Header: `StanceSettings.h`

StanceSettings: collection of settings that are shared through the mover component and contain stance related settings.

**Properties** (4):
  - `crouch_half_height`: `float` — [Read-Write] New capsule half height while crouching (float)
  - `crouched_eye_height`: `float` — [Read-Write] New eye height while crouching (float)
  - `crouching_max_acceleration`: `float` — [Read-Write] New max acceleration while in crouching (float)
  - `crouching_max_speed`: `float` — [Read-Write] New max speed while in crouching (float)

### `unreal.SwimmingMode`
Inherits: `BaseMovementMode` | Header: `SwimmingMode.h`

SwimmingMode: a default movement mode for traversing water volumes

**Properties** (1):
  - `surface_swimming_water_control_settings`: `SwimmingControlSettings` [Read-Only] — [Read-Only] (SwimmingControlSettings)

### `unreal.TurnGeneratorInterface`
Inherits: `Interface` | Header: `ModularMovement.h`

Turn Generator Interface

**Methods** (1):
  - `get_turn(target_orientation, full_start_state, mover_state, time_step, proposed_move, sim_blackboard)` -> `Rotator` — Returns an additive angular velocity (per-axis degrees/second) based on the starting state and timestep

### `unreal.WalkingMode`
Inherits: `BaseMovementMode` | Header: `WalkingMode.h`

WalkingMode: a default movement mode for traversing surfaces and movement bases (walking, running, sneaking, etc.)

**Methods** (2):
  - `get_turn_generator()` -> `Object` — Returns the active turn generator. Note: you will need to cast the return value to the generator you expect to get, it c...
  - `set_turn_generator_class(turn_generator_class)` -> `None` — Sets the active turn generator to use the class provided. Note: To set it back to the default implementation pass in non...

**Properties** (1):
  - `floor_check_policy`: `StaticFloorCheckPolicy` — [Read-Write] Choice of behavior for floor checks while not moving. (StaticFloorCheckPolicy)

### `unreal.WaterMovementUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `WaterMovementUtils.h`

WaterMovementUtils: a collection of stateless static BP-accessible functions for a variety of water movement-related operations

**Methods** (2):
  - `compute_controlled_water_move(params)` -> `ProposedMove` [classmethod] — Generate a new movement based on move/orientation intents and the prior state for the swimming move
  - `update_water_spline_data(update_water_spline_data_params, water_check_result)` -> `WaterCheckResult` [classmethod] — Updates the water spline data used in calculated swimming movement

### `unreal.LayeredMove_ConstantVelocitySettingsFlags`
Inherits: `EnumBase` | Header: `BasicLayeredMoves.h`

ELayered Move Constant Velocity Settings Flags

**Properties** (3):
  - `NO_FLAGS`: `LayeredMove_ConstantVelocitySettingsFlags = Ellipsis` — 0
  - `VELOCITY_ALWAYS_RELATIVE`: `LayeredMove_ConstantVelocitySettingsFlags = Ellipsis` — Velocity direction is always relative to the target actor, even if its orientation changes. This fla...
  - `VELOCITY_START_RELATIVE`: `LayeredMove_ConstantVelocitySettingsFlags = Ellipsis` — Velocity direction is determined when this move starts, relative to the target actor. This flag is i...

### `unreal.LayeredMoveFinishVelocityMode`
Inherits: `EnumBase` | Header: `LayeredMove.h`

ELayered Move Finish Velocity Mode

**Properties** (3):
  - `CLAMP_VELOCITY`: `LayeredMoveFinishVelocityMode = Ellipsis` — Clamp velocity magnitude to the specified value. Note that it will not clamp Z if negative (falling)...
  - `MAINTAIN_LAST_ROOT_MOTION_VELOCITY`: `LayeredMoveFinishVelocityMode = Ellipsis` — Maintain the last velocity root motion gave to the character 0
  - `SET_VELOCITY`: `LayeredMoveFinishVelocityMode = Ellipsis` — Set Velocity to the specified value (for example, 0,0,0 to stop the character) 1

### `unreal.MoveInputType`
Inherits: `EnumBase` | Header: `MoverDataModelTypes.h`

Used to identify how to interpret a movement input vectorâs values

**Properties** (4):
  - `DIRECTIONAL_INTENT`: `MoveInputType = Ellipsis` — Move with intent, as a per-axis magnitude [-1,1] (E.g., âmove straight forward as fast as possible...
  - `INVALID`: `MoveInputType = Ellipsis` — 0
  - `NONE`: `MoveInputType = Ellipsis` — No move input of any type 3
  - `VELOCITY`: `MoveInputType = Ellipsis` — Move with a given velocity (units per second) 2

### `unreal.MoveMixMode`
Inherits: `EnumBase` | Header: `MovementUtilsTypes.h`

EMove Mix Mode

**Properties** (3):
  - `ADDITIVE_VELOCITY`: `MoveMixMode = Ellipsis` — Velocity (linear and angular) is intended to be added with other sources 0
  - `OVERRIDE_ALL`: `MoveMixMode = Ellipsis` — All move parameters should override others 2
  - `OVERRIDE_VELOCITY`: `MoveMixMode = Ellipsis` — Velocity (linear and angular) should override others 1

### `unreal.MoverLaunchVelocityMode`
Inherits: `EnumBase` | Header: `PhysicsMoverSimulationTypes.h`

EMover Launch Velocity Mode

**Properties** (2):
  - `ADDITIVE`: `MoverLaunchVelocityMode = Ellipsis` — 0
  - `OVERRIDE`: `MoverLaunchVelocityMode = Ellipsis` — 1

### `unreal.MoverSmoothingMode`
Inherits: `EnumBase` | Header: `MoverTypes.h`

Options for how to handle smoothing frame data from the backend. Typically this is for advancing the simulation at a lower or fixed rate versus the game thread/render rate.

**Properties** (2):
  - `NONE`: `MoverSmoothingMode = Ellipsis` — Smoothed frames will be ignored 0
  - `VISUAL_COMPONENT_OFFSET`: `MoverSmoothingMode = Ellipsis` — Use the smoothed state data to offset the visual root component only, without smoothing the root mov...

### `unreal.MoverTickDependencyOrder`
Inherits: `EnumBase` | Header: `MoverTypes.h`

List of tick dependency order of execution relative to the Mover tick function.

**Properties** (2):
  - `AFTER`: `MoverTickDependencyOrder = Ellipsis` — 1
  - `BEFORE`: `MoverTickDependencyOrder = Ellipsis` — 0

### `unreal.MoverTickPhase`
Inherits: `EnumBase` | Header: `MoverTypes.h`

List of Mover tick phases where different parts of work are being performed

**Properties** (3):
  - `APPLY_STATE`: `MoverTickPhase = Ellipsis` — This tick is where the newest simulation state is applied to the actor and its components 3
  - `PRODUCE_INPUT`: `MoverTickPhase = Ellipsis` — This tick is where an input for the next movement step is authored 1
  - `SIMULATE_MOVEMENT`: `MoverTickPhase = Ellipsis` — This tick is where movement based on {input, state} is simulated, to produce a new state 2

### `unreal.OffNavMeshBehavior`
Inherits: `EnumBase` | Header: `NavWalkingMode.h`

Options for what to do when we find ourselves off the nav mesh

**Properties** (4):
  - `DO_NOT_MOVE`: `OffNavMeshBehavior = Ellipsis` — We do not move. Movement will continue once instructed to move over nav mesh again. 2
  - `MOVE_WITHOUT_NAV_MESH`: `OffNavMeshBehavior = Ellipsis` — We proceed to move as directed, but height may diverge from the floor until we return to a valid nav...
  - `ROTATE_ONLY`: `OffNavMeshBehavior = Ellipsis` — We do not move, but will allow rotation in place. Movement will continue once instructed to move ove...
  - `SWITCH_TO_WALKING`: `OffNavMeshBehavior = Ellipsis` — We change to normal walking mode and re-attempt the move. Typically this is more expensive than nav ...

### `unreal.PathedPhysicsPlaybackBehavior`
Inherits: `EnumBase` | Header: `PathedMovementTypes.h`

EPathed Physics Playback Behavior

**Properties** (4):
  - `LOOPING`: `PathedPhysicsPlaybackBehavior = Ellipsis` — Progresses from 0 -> 1, then resetting to 0, repeating infinitely 2
  - `ONE_SHOT`: `PathedPhysicsPlaybackBehavior = Ellipsis` — Progresses from 0 -> 1 and then stops 0
  - `PING_PONG`: `PathedPhysicsPlaybackBehavior = Ellipsis` — Progresses from 0 -> 1 -> 0 -> 1 (and so on) infinitely 3
  - `THERE_AND_BACK`: `PathedPhysicsPlaybackBehavior = Ellipsis` — Progresses from 0 -> 1 -> 0 and then stops (basically a one-shot ping-pong) 1

### `unreal.PointMovementLocationBasis`
Inherits: `EnumBase` | Header: `PointMovementPathPattern.h`

EPoint Movement Location Basis

**Properties** (3):
  - `PATH_ORIGIN`: `PointMovementLocationBasis = Ellipsis` — The location is relative to the origin of the path 1
  - `PREVIOUS_POINT`: `PointMovementLocationBasis = Ellipsis` — The location is relative to the previous point in the path 0
  - `WORLD`: `PointMovementLocationBasis = Ellipsis` — The location is relative to the world origin 2

### `unreal.StanceMode`
Inherits: `EnumBase` | Header: `StanceModifier.h`

EStance Mode

**Properties** (3):
  - `CROUCH`: `StanceMode = Ellipsis` — Actor goes into crouch 1
  - `INVALID`: `StanceMode = Ellipsis` — Invalid default stance 0
  - `PRONE`: `StanceMode = Ellipsis` — Actor goes into prone - not currently implemented 2

### `unreal.StaticFloorCheckPolicy`
Inherits: `EnumBase` | Header: `WalkingMode.h`

Behavior policy for performing floor checks in walking mode when no movement is occurring.

**Properties** (2):
  - `ALWAYS`: `StaticFloorCheckPolicy = Ellipsis` — Always perform floor checks, even when not moving. You may want this if static bases may disappear f...
  - `ON_DYNAMIC_BASE_ONLY`: `StaticFloorCheckPolicy = Ellipsis` — Only perform floor checks when not moving IF weâre on a dynamic movement base 1

### `unreal.Mover_OnLanded`
Inherits: `MulticastDelegateBase` | Header: `FallingMode.h`

Fired after the actor lands on a valid surface. First param is the name of the mode this actor is in after landing. Second param is the hit result from hitting the floor.

### `unreal.Mover_OnMovementModeChanged`
Inherits: `MulticastDelegateBase` | Header: `MoverComponent.h`

Fired after changing movement modes. First param is the name of the previous movement mode. Second is the name of the new movement mode.

### `unreal.Mover_OnPostFinalize`
Inherits: `MulticastDelegateBase` | Header: `MoverComponent.h`

Fired after a frame has been finalized. This may be a resimulation or not. No changes to state are possible. Guaranteed to be on the game thread.

### `unreal.Mover_OnPostMovement`
Inherits: `MulticastDelegateBase` | Header: `MoverComponent.h`

Fired during a simulation tick, after movement has occurred but before the state is finalized, allowing changes to the output state.

### `unreal.Mover_OnPostSimRollback`
Inherits: `MulticastDelegateBase` | Header: `MoverComponent.h`

Fired after a rollback. First param is the time step weâve rolled back to. Second param is when we rolled back from, and represents a later frame that is no longer valid.

### `unreal.Mover_OnPostSimTick`
Inherits: `MulticastDelegateBase` | Header: `MoverComponent.h`

Fired after a simulation tick, regardless of being a re-simulated frame or not.

### `unreal.Mover_OnPreMovement`
Inherits: `MulticastDelegateBase` | Header: `MoverComponent.h`

Fired during a simulation tick, after the input is processed but before the actual move calculation.

### `unreal.Mover_OnPreSimTick`
Inherits: `MulticastDelegateBase` | Header: `MoverComponent.h`

Fired just before a simulation tick, regardless of being a re-simulated frame or not.

### `unreal.Mover_OnStanceChanged`
Inherits: `MulticastDelegateBase` | Header: `CharacterMoverComponent.h`

Fires when a stance is changed, if stance handling is enabled (see SetHandleStanceChanges): Note: If a stance was just Activated it will fire with an invalid OldStance If a stance was just Deactivated...

### `unreal.Mover_ProcessGeneratedMovement`
Inherits: `DelegateBase` | Header: `MoverComponent.h`

Fired after proposed movement has been generated (i.e. after movement modes and layered moves have generated movement and mixed together).
