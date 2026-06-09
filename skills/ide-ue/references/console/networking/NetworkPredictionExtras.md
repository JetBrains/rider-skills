# UE Python API — NetworkPredictionExtras Module

**38 types** from the `NetworkPredictionExtras` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MockPhysicsInputCmd`, `SimpleParametricMotion`, `Spring`, `BaseMovementComponent`, `CharacterMotionComponent`, `FlyingMovementComponent`, `MockCharacterAbilityComponent`, `MockFlyingAbilityComponent`, `MockNetworkSimulationComponent`, `MockPhysicsComponent`, `MockPhysicsGrenadeComponent`, `MockRootMotionComponent`, `MockRootMotionSource`, `MockRootMotionSource_Curve`, `MockRootMotionSource_Montage`, `MockRootMotionSource_MoveToLocation`, `NetworkPredictionExtrasCharacter`, `NetworkPredictionExtrasCharacter_MockAbility`, `NetworkPredictionExtrasFlyingPawn`, `NetworkPredictionExtrasFlyingPawn_MockAbility`, ... (38 total)

---

## Classes

### `unreal.MockPhysicsInputCmd`
Inherits: `StructBase` | Header: `MockPhysicsSimulation.h`

Making this a blueprint type to that it can be filled out by BPs.

**Properties** (3):
  - `charge_pressed`: `bool` — [Read-Write] (bool)
  - `jumped_pressed`: `bool` — [Read-Write] (bool)
  - `movement_input`: `Vector` — [Read-Write] (Vector)

### `unreal.SimpleParametricMotion`
Inherits: `StructBase` | Header: `ParametricMovement.h`

Extremely simple struct for defining parametric motion. This is editable in UParametricMovementComponentâs defaults, and also used by the simulation code.

**Properties** (3):
  - `max_time`: `float` — [Read-Write] (float)
  - `min_time`: `float` — [Read-Write] (float)
  - `parametric_delta`: `Vector` — [Read-Write] (Vector)

### `unreal.Spring`
Inherits: `StructBase` | Header: `Springs.h`

**Properties** (7):
  - `damping_strength`: `float` — [Read-Write] Strength of damping term. (float)
  - `local_direction`: `Vector` — [Read-Write] Direction of spring force applied to body. (Vector)
  - `local_position`: `Vector` — [Read-Write] Position of spring relative to actor, raycast starts here and force is applied at this ...
  - `natural_length`: `float` — [Read-Write] Natural length of spring when it is not stretched/compressed. (float)
  - `raycast_length`: `float` — [Read-Write] Lenght of raycast. (float)
  - `stiffness`: `float` — [Read-Write] Strength of spring force. (float)
  - `trace_channel`: `CollisionChannel` — [Read-Write] Trace channel of raycast (CollisionChannel)

### `unreal.BaseMovementComponent`
Inherits: `NetworkPredictionComponent` | Header: `BaseMovementComponent.h`

Base component for movement. This essentially has the generic glue for selecting an UpdatedComponent and moving it along the world It is abstract in that you still need to define which simulation the ...

### `unreal.CharacterMotionComponent`
Inherits: `BaseMovementComponent` | Header: `CharacterMotionComponent.h`

ActorComponent for running CharacterMotion

### `unreal.FlyingMovementComponent`
Inherits: `BaseMovementComponent` | Header: `FlyingMovementComponent.h`

ActorComponent for running FlyingMovement

### `unreal.MockCharacterAbilityComponent`
Inherits: `CharacterMotionComponent` | Header: `MockCharacterAbilitySimulation.h`

ActorComponent for running Mock Ability Simulation for CharacterMotion example

**Methods** (7):
  - `get_blink_warmup_time_seconds()` -> `float` — Get Blink Warmup Time Seconds
  - `get_max_stamina()` -> `float` — Get Max Stamina
  - `get_stamina()` -> `float` — Get Stamina
  - `is_blinking()` -> `bool` — Are we currently in the blinking (startup) state
  - `is_dashing()` -> `bool` — Are we currently in the dashing state
  - `is_jumping()` -> `bool` — Are we currently in the jumping state
  - `is_sprinting()` -> `bool` — Are we currently in the sprinting state

**Properties** (6):
  - `on_blink_activate_event`: `MockCharacterAbilityBlinkCueEvent` — [Read-Write] (MockCharacterAbilityBlinkCueEvent)
  - `on_blink_activate_event_rollback`: `MockCharacterAbilityBlinkCueRollback` — [Read-Write] (MockCharacterAbilityBlinkCueRollback)
  - `on_blink_state_change`: `MockCharacterAbilityNotifyStateChange` — [Read-Write] Notifies when Blink Changes (MockCharacterAbilityNotifyStateChange)
  - `on_dash_state_change`: `MockCharacterAbilityNotifyStateChange` — [Read-Write] Notifies when Dash state changes (MockCharacterAbilityNotifyStateChange)
  - `on_jump_state_change`: `MockCharacterAbilityNotifyStateChange` — [Read-Write] Notifies when Jump Changes (MockCharacterAbilityNotifyStateChange)
  - `on_sprint_state_change`: `MockCharacterAbilityNotifyStateChange` — [Read-Write] Notifies when Sprint state changes (MockCharacterAbilityNotifyStateChange)

### `unreal.MockFlyingAbilityComponent`
Inherits: `FlyingMovementComponent` | Header: `MockAbilitySimulation.h`

ActorComponent for running Mock Ability Simulation

**Methods** (6):
  - `get_blink_warmup_time_seconds()` -> `float` — Get Blink Warmup Time Seconds
  - `get_max_stamina()` -> `float` — Get Max Stamina
  - `get_stamina()` -> `float` — Get Stamina
  - `is_blinking()` -> `bool` — Are we currently in the blinking (startup) state
  - `is_dashing()` -> `bool` — Are we currently in the dashing state
  - `is_sprinting()` -> `bool` — Are we currently in the sprinting state

**Properties** (6):
  - `on_blink_activate_event`: `MockAbilityBlinkCueEvent` — [Read-Write] (MockAbilityBlinkCueEvent)
  - `on_blink_activate_event_rollback`: `MockAbilityBlinkCueRollback` — [Read-Write] (MockAbilityBlinkCueRollback)
  - `on_blink_state_change`: `MockAbilityNotifyStateChange` — [Read-Write] Notifies when Blink Changes (MockAbilityNotifyStateChange)
  - `on_dash_state_change`: `MockAbilityNotifyStateChange` — [Read-Write] Notifies when Dash state changes (MockAbilityNotifyStateChange)
  - `on_physics_gun_fir_event`: `MockAbilityPhysicsGunFireEvent` — [Read-Write] (MockAbilityPhysicsGunFireEvent)
  - `on_sprint_state_change`: `MockAbilityNotifyStateChange` — [Read-Write] Notifies when Sprint state changes (MockAbilityNotifyStateChange)

### `unreal.MockNetworkSimulationComponent`
Inherits: `NetworkPredictionComponent` | Header: `MockNetworkSimulation.h`

ActorComponent for running a MockNetworkSimulation (implements Driver for the mock simulation)

### `unreal.MockPhysicsComponent`
Inherits: `BaseMovementComponent` | Header: `MockPhysicsComponent.h`

ActorComponent for running MockPhysicsSimulation

**Properties** (5):
  - `is_charging`: `bool` [Read-Only] — [Read-Only] Currently charging up charge attack (bool)
  - `on_charge_activated_event`: `PhysicsChargeCueEvent` — [Read-Write] (PhysicsChargeCueEvent)
  - `on_charge_state_change`: `MockPhysicsNotifyStateChange` — [Read-Write] (MockPhysicsNotifyStateChange)
  - `on_jump_activated_event`: `PhysicsJumpCueEvent` — [Read-Write] (PhysicsJumpCueEvent)
  - `pending_input_cmd`: `MockPhysicsInputCmd` — [Read-Write] Next local InputCmd that will be submitted. This is just one way to do it. (MockPhysics...

### `unreal.MockPhysicsGrenadeComponent`
Inherits: `NetworkPredictionPhysicsComponent` | Header: `MockPhysicsGrenade.h`

Mock Physics Grenade Component

**Properties** (1):
  - `on_explode`: `MockGrenadeOnExplode` — [Read-Write] (MockGrenadeOnExplode)

### `unreal.MockRootMotionComponent`
Inherits: `BaseMovementComponent` | Header: `MockRootMotionComponent.h`

This component acts as the Driver for the FMockRootMotionSimulation It is essentially a standin for the movement component, and would be replaced by ânew movement systemâ component. If we support ...

**Methods** (5):
  - `create_root_motion_source(source)` -> `MockRootMotionSource` — Create Root Motion Source
  - `input_play_root_motion_source(source)` -> `None` — Input Play Root Motion Source
  - `input_play_root_motion_source_by_class(source)` -> `None` — Input Play Root Motion Source by Class
  - `play_root_motion_source(source)` -> `None` — Callable by authority. Plays âout of bandâ animation: e.g, directly sets the RootMotionSourceID on the sync state, r...
  - `play_root_motion_source_by_class(source)` -> `None` — Play Root Motion Source by Class

### `unreal.MockRootMotionSource`
Inherits: `Object` | Header: `MockRootMotionSourceObject.h`

Mock Root Motion Source

### `unreal.MockRootMotionSource_Curve`
Inherits: `MockRootMotionSource` | Header: `MockRootMotionSourceObject.h`

Mock Root Motion Source Curve

### `unreal.MockRootMotionSource_Montage`
Inherits: `MockRootMotionSource` | Header: `MockRootMotionSourceObject.h`

Mock Root Motion Source Montage

### `unreal.MockRootMotionSource_MoveToLocation`
Inherits: `MockRootMotionSource` | Header: `MockRootMotionSourceObject.h`

Mock Root Motion Source Move to Location

**Methods** (1):
  - `set_destination(destination)` -> `None` — Set Destination

### `unreal.NetworkPredictionExtrasCharacter`
Inherits: `Pawn` | Header: `NetworkPredictionExtrasCharacter.h`

Sample pawn that uses UCharacterMotionComponent. The main thing this provides is actually producing user input for the component/simulation to consume.

**Methods** (4):
  - `add_max_move_speed(additive_max_move_speed)` -> `None` — Add Max Move Speed
  - `get_max_move_speed()` -> `float` — Get Max Move Speed
  - `print_debug()` -> `None` — Print Debug
  - `set_max_move_speed(new_max_move_speed)` -> `None` — Set Max Move Speed

**Properties** (2):
  - `fake_autonomous_proxy`: `bool` [Read-Only] — [Read-Only] Actor will behave like autonomous proxy even though not posessed by an APlayercontroller...
  - `input_preset`: `NetworkPredictionExtrasCharacterInputPreset` — [Read-Write] For bFakeAutonomousProxy only (NetworkPredictionExtrasCharacterInputPreset)

### `unreal.NetworkPredictionExtrasCharacter_MockAbility`
Inherits: `NetworkPredictionExtrasCharacter` | Header: `NetworkPredictionExtrasCharacter.h`

Example subclass of ANetworkPredictionExtrasCharacter that uses the MockAbility simulation

**Methods** (3):
  - `get_max_stamina()` -> `float` — Get Max Stamina
  - `get_mock_character_ability_component()` -> `MockCharacterAbilityComponent` — Get Mock Character Ability Component
  - `get_stamina()` -> `float` — Get Stamina

**Properties** (1):
  - `ability_input_preset`: `NetworkPredictionExtrasMockCharacterAbilityInputPreset` — [Read-Write] (NetworkPredictionExtrasMockCharacterAbilityInputPreset)

### `unreal.NetworkPredictionExtrasFlyingPawn`
Inherits: `Pawn` | Header: `NetworkPredictionExtrasFlyingPawn.h`

Sample pawn that uses UFlyingMovementComponent. The main thing this provides is actually producing user input for the component/simulation to consume.

**Methods** (4):
  - `add_max_move_speed(additive_max_move_speed)` -> `None` — Add Max Move Speed
  - `get_max_move_speed()` -> `float` — Get Max Move Speed
  - `print_debug()` -> `None` — Print Debug
  - `set_max_move_speed(new_max_move_speed)` -> `None` — Set Max Move Speed

**Properties** (2):
  - `fake_autonomous_proxy`: `bool` [Read-Only] — [Read-Only] Actor will behave like autonomous proxy even though not posessed by an APlayercontroller...
  - `input_preset`: `NetworkPredictionExtrasFlyingInputPreset` — [Read-Write] For bFakeAutonomousProxy only (NetworkPredictionExtrasFlyingInputPreset)

### `unreal.NetworkPredictionExtrasFlyingPawn_MockAbility`
Inherits: `NetworkPredictionExtrasFlyingPawn` | Header: `NetworkPredictionExtrasFlyingPawn.h`

Example subclass of ANetworkPredictionExtrasFlyingPawn that uses the MockAbility simulation

**Methods** (3):
  - `get_max_stamina()` -> `float` — Get Max Stamina
  - `get_mock_flying_ability_component()` -> `MockFlyingAbilityComponent` — Get Mock Flying Ability Component
  - `get_stamina()` -> `float` — Get Stamina

**Properties** (1):
  - `ability_input_preset`: `NetworkPredictionExtrasMockAbilityInputPreset` — [Read-Write] (NetworkPredictionExtrasMockAbilityInputPreset)

### `unreal.NetworkPredictionExtrasGameMode`
Inherits: `GameMode` | Header: `NetworkPredictionExtrasGameMode.h`

Network Prediction Extras Game Mode

### `unreal.NetworkPredictionExtrasGameState`
Inherits: `GameState` | Header: `NetworkPredictionExtrasGameState.h`

Network Prediction Extras Game State

### `unreal.ParametricMovementComponent`
Inherits: `BaseMovementComponent` | Header: `ParametricMovement.h`

ActorComponent for running basic Parametric movement. Parametric movement could be anything that takes a Time and returns an FTransform.

**Methods** (1):
  - `enable_interpolation_mode(value)` -> `None` — Enable Interpolation Mode

**Properties** (6):
  - `disable_parametric_movement_simulation`: `bool` [Read-Only] — [Read-Only] Disables starting the simulation. For development/testing ease of use (bool)
  - `enable_dependent_simulation`: `bool` [Read-Only] — [Read-Only] (bool)
  - `enable_force_net_update`: `bool` [Read-Only] — [Read-Only] Calls ForceNetUpdate every frame. Has slightly different behavior than a very high NetUp...
  - `enable_interpolation`: `bool` [Read-Only] — [Read-Only] (bool)
  - `parametric_motion`: `SimpleParametricMotion` — [Read-Write] (SimpleParametricMotion)
  - `parent_net_update_frequency`: `float` [Read-Only] — [Read-Only] Sets NetUpdateFrequency on parent. This is editable on the component and really just mea...

### `unreal.NetworkPredictionExtrasCharacterInputPreset`
Inherits: `EnumBase` | Header: `NetworkPredictionExtrasCharacter.h`

ANetworkPredictionExtrasCharacter

**Properties** (2):
  - `FORWARD`: `NetworkPredictionExtrasCharacterInputPreset = Ellipsis` — Just moves forward 1
  - `NONE`: `NetworkPredictionExtrasCharacterInputPreset = Ellipsis` — No input 0

### `unreal.NetworkPredictionExtrasFlyingInputPreset`
Inherits: `EnumBase` | Header: `NetworkPredictionExtrasFlyingPawn.h`

ANetworkPredictionExtrasFlyingPawn

**Properties** (2):
  - `FORWARD`: `NetworkPredictionExtrasFlyingInputPreset = Ellipsis` — Just moves forward 1
  - `NONE`: `NetworkPredictionExtrasFlyingInputPreset = Ellipsis` — No input 0

### `unreal.NetworkPredictionExtrasMockAbilityInputPreset`
Inherits: `EnumBase` | Header: `NetworkPredictionExtrasFlyingPawn.h`

ENetwork Prediction Extras Mock Ability Input Preset

**Properties** (4):
  - `BLINK`: `NetworkPredictionExtrasMockAbilityInputPreset = Ellipsis` — 3
  - `DASH`: `NetworkPredictionExtrasMockAbilityInputPreset = Ellipsis` — 2
  - `NONE`: `NetworkPredictionExtrasMockAbilityInputPreset = Ellipsis` — No input 0
  - `SPRINT`: `NetworkPredictionExtrasMockAbilityInputPreset = Ellipsis` — 1

### `unreal.NetworkPredictionExtrasMockCharacterAbilityInputPreset`
Inherits: `EnumBase` | Header: `NetworkPredictionExtrasCharacter.h`

ENetwork Prediction Extras Mock Character Ability Input Preset

**Properties** (5):
  - `BLINK`: `NetworkPredictionExtrasMockCharacterAbilityInputPreset = Ellipsis` — 3
  - `DASH`: `NetworkPredictionExtrasMockCharacterAbilityInputPreset = Ellipsis` — 2
  - `JUMP`: `NetworkPredictionExtrasMockCharacterAbilityInputPreset = Ellipsis` — 4
  - `NONE`: `NetworkPredictionExtrasMockCharacterAbilityInputPreset = Ellipsis` — No input 0
  - `SPRINT`: `NetworkPredictionExtrasMockCharacterAbilityInputPreset = Ellipsis` — 1

### `unreal.MockCharacterAbilityComponent_MockCharacterAbilityBlinkCueEvent`
Inherits: `MulticastDelegateBase` | Header: `MockCharacterAbilitySimulation.h`

Blueprint assignable events for blinking. This allows the user/blueprint to implement rollback-able events

### `unreal.MockCharacterAbilityComponent_MockCharacterAbilityBlinkCueRollback`
Inherits: `MulticastDelegateBase` | Header: `MockCharacterAbilitySimulation.h`

Mock Character Ability Blink Cue Rollback Delegate Signature

### `unreal.MockCharacterAbilityComponent_MockCharacterAbilityNotifyStateChange`
Inherits: `MulticastDelegateBase` | Header: `MockCharacterAbilitySimulation.h`

// NetSimCues void HandleCue(const FMockCharacterAbilityBlinkActivateCue& BlinkCue, const FNetSimCueSystemParamemters& SystemParameters); void HandleCue(const FMockCharacterAbilityBlinkCue& BlinkCue, ...

### `unreal.MockFlyingAbilityComponent_MockAbilityBlinkCueEvent`
Inherits: `MulticastDelegateBase` | Header: `MockAbilitySimulation.h`

Blueprint assignable events for blinking. THis allows the user/blueprint to implement rollback-able events

### `unreal.MockFlyingAbilityComponent_MockAbilityBlinkCueRollback`
Inherits: `MulticastDelegateBase` | Header: `MockAbilitySimulation.h`

Mock Ability Blink Cue Rollback Delegate Signature

### `unreal.MockFlyingAbilityComponent_MockAbilityNotifyStateChange`
Inherits: `MulticastDelegateBase` | Header: `MockAbilitySimulation.h`

### `unreal.MockFlyingAbilityComponent_MockAbilityPhysicsGunFireEvent`
Inherits: `MulticastDelegateBase` | Header: `MockAbilitySimulation.h`

Mock Ability Physics Gun Fire Event Delegate Signature

### `unreal.MockPhysicsComponent_MockPhysicsNotifyStateChange`
Inherits: `MulticastDelegateBase` | Header: `MockPhysicsComponent.h`

Charge (not a Cue event, just state)

### `unreal.MockPhysicsComponent_PhysicsChargeCueEvent`
Inherits: `MulticastDelegateBase` | Header: `MockPhysicsComponent.h`

Physics Charge Cue Event Delegate Signature

### `unreal.MockPhysicsComponent_PhysicsJumpCueEvent`
Inherits: `MulticastDelegateBase` | Header: `MockPhysicsComponent.h`

Assignable delegates chosen so that owning actor can implement in BPs. May not be the best choice for all cases.

### `unreal.MockPhysicsGrenadeComponent_MockGrenadeOnExplode`
Inherits: `MulticastDelegateBase` | Header: `MockPhysicsGrenade.h`

Mock Grenade on Explode Delegate Signature
