# UE Python API — AIModule Module

**122 types** from the `AIModule` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ActorPerceptionBlueprintInfo`, `ActorPerceptionUpdateInfo`, `AIDamageEvent`, `AIDynamicParam`, `AINoiseEvent`, `AIRequestID`, `AISenseAffiliationFilter`, `AIStimulus`, `BlackboardEntry`, `BlackboardKeySelector`, `EnvNamedValue`, `EnvQueryResult`, `EQSParametrizedQueryExecutionRequest`, `GenericTeamId`, `IntervalCountdown`, `ValueOrBBKey_Bool`, `ValueOrBBKey_Class`, `ValueOrBBKey_Enum`, `ValueOrBBKey_Float`, `ValueOrBBKey_Int32`, ... (122 total)

---

## Classes

### `unreal.ActorPerceptionBlueprintInfo`
Inherits: `StructBase` | Header: `AIPerceptionComponent.h`

Actor Perception Blueprint Info

**Properties** (4):
  - `is_friendly`: `bool` — [Read-Write] (bool)
  - `is_hostile`: `bool` — [Read-Write] (bool)
  - `last_sensed_stimuli`: `None` — [Read-Write] (Array[AIStimulus])
  - `target`: `Actor` — [Read-Write] (Actor)

### `unreal.ActorPerceptionUpdateInfo`
Inherits: `StructBase` | Header: `AIPerceptionComponent.h`

Actor Perception Update Info

**Properties** (3):
  - `stimulus`: `AIStimulus` — [Read-Write] Updated stimulus (AIStimulus)
  - `target`: `Actor` — [Read-Write] Actor associated to the stimulus (can be null) (Actor)
  - `target_id`: `int` — [Read-Write] Id of to the stimulus source (int32)

### `unreal.AIDamageEvent`
Inherits: `StructBase` | Header: `AISense_Damage.h`

AIDamage Event

**Properties** (6):
  - `amount`: `float` — [Read-Write] Damage taken by DamagedActor.
Note: 0-damage events do not get ignored (float)
  - `damaged_actor`: `Actor` — [Read-Write] Damaged actor (Actor)
  - `hit_location`: `Vector` — [Read-Write] Eventâs additional spatial information
TODO: document (Vector)
  - `instigator`: `Actor` — [Read-Write] Actor that instigated damage. Can be None (Actor)
  - `location`: `Vector` — [Read-Write] Eventâs âLocationâ, or what will be later treated as the perceived location for t...
  - `tag`: `Name` — [Read-Write] Optional named identifier for the damage. (Name)

### `unreal.AIDynamicParam`
Inherits: `StructBase` | Header: `EnvQueryTypes.h`

AIDynamic Param

**Properties** (5):
  - `allow_bb_key`: `bool` — [Read-Write] (bool)
  - `bb_key`: `BlackboardKeySelector` — [Read-Write] (BlackboardKeySelector)
  - `param_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `param_type`: `AIParamType` [Read-Only] — [Read-Only] (AIParamType)
  - `value`: `float` — [Read-Write] (float)

### `unreal.AINoiseEvent`
Inherits: `StructBase` | Header: `AISense_Hearing.h`

AINoise Event

**Properties** (5):
  - `instigator`: `Actor` — [Read-Write] Actor triggering the sound. (Actor)
  - `loudness`: `float` — [Read-Write] Loudness modifier of the sound.
If MaxRange is non-zero, this modifies the range (by mu...
  - `max_range`: `float` — [Read-Write] Max range at which the sound can be heard. Multiplied by Loudness.
A value of 0 indicat...
  - `noise_location`: `Vector` — [Read-Write] if not set Instigatorâs location will be used (Vector)
  - `tag`: `Name` — [Read-Write] Named identifier for the noise. (Name)

### `unreal.AIRequestID`
Inherits: `StructBase` | Header: `AITypes.h`

AIRequest ID

### `unreal.AISenseAffiliationFilter`
Inherits: `StructBase` | Header: `AIPerceptionTypes.h`

AISense Affiliation Filter

**Properties** (3):
  - `detect_enemies`: `bool` [Read-Only] — [Read-Only] (bool)
  - `detect_friendlies`: `bool` [Read-Only] — [Read-Only] (bool)
  - `detect_neutrals`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.AIStimulus`
Inherits: `StructBase` | Header: `AIPerceptionTypes.h`

**Properties** (7):
  - `age`: `float` — [Read-Write] (float)
  - `expiration_age`: `float` — [Read-Write] (float)
  - `receiver_location`: `Vector` — [Read-Write] (Vector)
  - `stimulus_location`: `Vector` — [Read-Write] (Vector)
  - `strength`: `float` — [Read-Write] (float)
  - `successfully_sensed`: `bool` — [Read-Write] (bool)
  - `tag`: `Name` — [Read-Write] (Name)

### `unreal.BlackboardEntry`
Inherits: `StructBase` | Header: `BlackboardData.h`

blackboard entry definition

### `unreal.BlackboardKeySelector`
Inherits: `StructBase` | Header: `BehaviorTreeTypes.h`

helper struct for defining types of allowed blackboard entries (e.g. only entries holding points and objects derived form actor class)

**Properties** (5):
  - `allowed_types`: `None` — [Read-Write] array of allowed types with additional properties (e.g. uobjectâs base class)
EditAny...
  - `none_is_allowed_value`: `bool` — [Read-Write] (bool)
  - `selected_key_id`: `int` — [Read-Write] ID of selected key (int32)
  - `selected_key_name`: `Name` — [Read-Write] name of selected key (Name)
  - `selected_key_type`: `Class` — [Read-Write] class of selected key (type(Class))

### `unreal.EnvNamedValue`
Inherits: `StructBase` | Header: `EnvQueryTypes.h`

Env Named Value

**Properties** (3):
  - `param_name`: `Name` — [Read-Write] (Name)
  - `param_type`: `AIParamType` — [Read-Write] (AIParamType)
  - `value`: `float` — [Read-Write] (float)

### `unreal.EnvQueryResult`
Inherits: `StructBase` | Header: `EnvQueryTypes.h`

Env Query Result

**Properties** (3):
  - `item_type`: `Class` [Read-Only] — [Read-Only] type of generated items (type(Class))
  - `option_index`: `int` [Read-Only] — [Read-Only] index of query option, that generated items (int32)
  - `query_id`: `int` [Read-Only] — [Read-Only] instance ID (int32)

### `unreal.EQSParametrizedQueryExecutionRequest`
Inherits: `StructBase` | Header: `EnvQueryTypes.h`

EQSParametrized Query Execution Request

### `unreal.GenericTeamId`
Inherits: `StructBase` | Header: `GenericTeamAgentInterface.h`

Generic Team Id

**Properties** (1):
  - `team_id`: `int` — [Read-Write] (uint8)

### `unreal.IntervalCountdown`
Inherits: `StructBase` | Header: `AITypes.h`

Interval Countdown

### `unreal.ValueOrBBKey_Bool`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey.h`

Value or BBKey Bool

### `unreal.ValueOrBBKey_Class`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey.h`

Value or BBKey Class

### `unreal.ValueOrBBKey_Enum`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey.h`

Value or BBKey Enum

### `unreal.ValueOrBBKey_Float`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey.h`

Value or BBKey Float

### `unreal.ValueOrBBKey_Int32`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey.h`

Value or BBKey Int 32

### `unreal.ValueOrBBKey_Name`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey.h`

Value or BBKey Name

### `unreal.ValueOrBBKey_Object`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey.h`

Value or BBKey Object

### `unreal.ValueOrBBKey_Rotator`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey.h`

Value or BBKey Rotator

### `unreal.ValueOrBBKey_String`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey.h`

Value or BBKey String

### `unreal.ValueOrBBKey_Struct`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey.h`

Value or BBKey Struct

### `unreal.ValueOrBBKey_Vector`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey.h`

Value or BBKey Vector

### `unreal.ValueOrBlackboardKeyBase`
Inherits: `StructBase` | Header: `ValueOrBBKey.h`

Base struct to simplify edition in the editor, shouldnât be used elsewhere

**Properties** (1):
  - `key`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.AIAsyncTaskBlueprintProxy`
Inherits: `Object` | Header: `AIAsyncTaskBlueprintProxy.h`

AIAsync Task Blueprint Proxy

**Properties** (2):
  - `on_fail`: `OAISimpleDelegate` — [Read-Write] (OAISimpleDelegate)
  - `on_success`: `OAISimpleDelegate` — [Read-Write] (OAISimpleDelegate)

### `unreal.AIController`
Inherits: `Controller` | Header: `AIController.h`

AIController is the base class of controllers for AI-controlled Pawns.

**Methods** (20):
  - `claim_task_resource(resource_class)` -> `None` — Claim Task Resource
  - `clear_focus()` -> `None` — Clears Focus, will also clear FocalPoint as a result
  - `get_ai_perception_component()` -> `AIPerceptionComponent` — Get AIPerception Component
  - `get_focal_point()` -> `Vector` — Retrieve the final position that controller should be looking at.
  - `get_focal_point_on_actor(actor)` -> `Vector` — Retrieve the focal point this controller should focus to on given actor.
  - `get_focus_actor()` -> `Actor` — Get the focused actor.
  - `get_immediate_move_destination()` -> `Vector` — Returns position of current path segmentâs end.
  - `get_move_status()` -> `PathFollowingStatus` — Returns status of path following
  - `get_path_following_component()` -> `PathFollowingComponent` — Returns PathFollowingComponent subobject *
  - `has_partial_path()` -> `bool` — Returns true if the current PathFollowingComponentâs path is partial (does not reach desired destination).
  - `move_to_actor(goal, acceptance_radius = -1.000000, stop_on_overlap = True, use_pathfinding = True, can_strafe = True, filter_class = None, allow_partial_path = True)` -> `PathFollowingRequestResult` — Makes AI go toward specified Goal actor (destination will be continuously updated), aborts any active path following not...
  - `move_to_location(dest, acceptance_radius = -1.000000, stop_on_overlap = True, use_pathfinding = True, project_destination_to_navigation = False, can_strafe = True, filter_class = None, allow_partial_path = True)` -> `PathFollowingRequestResult` — Makes AI go toward specified Dest location, aborts any active path following note: AcceptanceRadius has default value or...
  - `on_using_black_board(blackboard_comp, blackboard_asset)` -> `None` — On Using Black Board
  - `run_behavior_tree(bt_asset)` -> `bool` — Starts executing behavior tree.
  - `set_focal_point(fp)` -> `None` — Set the position that controller should be looking at.
  - `set_focus(new_focus)` -> `None` — Set Focus for actor, will set FocalPoint as a result.
  - `set_move_block_detection(enable)` -> `None` — Updates state of movement block detection.
  - `set_path_following_component(new_pf_component)` -> `None`
  - `unclaim_task_resource(resource_class)` -> `None` — Unclaim Task Resource
  - `use_blackboard(blackboard_asset)` -> `BlackboardComponent or None` — Makes AI use the specified Blackboard asset & creates a Blackboard Component if one does not already exist.

**Properties** (10):
  - `allow_strafe`: `bool` — [Read-Write] Is strafing allowed during movement? (bool)
  - `blackboard`: `BlackboardComponent` [Read-Only] — [Read-Only] blackboard (BlackboardComponent)
  - `brain_component`: `BrainComponent` — [Read-Write] Component responsible for behaviors. (BrainComponent)
  - `default_navigation_filter_class`: `Class` — [Read-Write] (type(Class))
  - `receive_move_completed`: `AIMoveCompletedSignature` — [Read-Write] Blueprint notification that weâve completed the current movement request (AIMoveCompl...
  - `set_control_rotation_from_pawn_orientation`: `bool` — [Read-Write] Copy Pawn rotation to ControlRotation, if there is no focus point. (bool)
  - `skip_extra_los_checks`: `bool` — [Read-Write] Skip extra line of sight traces to extremities of target being checked. (bool)
  - `start_ai_logic_on_possess`: `bool` — [Read-Write] By default AIâs logic does not start when controlled Pawn is possessed. Setting this ...
  - `stop_ai_logic_on_unposses`: `bool` — [Read-Write] By default AIâs logic gets stopped when controlled Pawn is unpossessed. Setting this ...
  - `wants_player_state`: `bool` — [Read-Write] Specifies if this AI wants its own PlayerState. (bool)

### `unreal.AIHelperLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AIBlueprintHelperLibrary.h`

AIBlueprint Helper Library

**Methods** (15):
  - `get_ai_controller(controlled_actor)` -> `AIController` [classmethod]
  - `get_blackboard(target)` -> `BlackboardComponent` [classmethod] — Get Blackboard
  - `get_current_path(controller)` -> `NavigationPath` [classmethod]
  - `get_current_path_index(controller)` -> `int32` [classmethod] — Return the path index the given controller is currently at. Returns INDEX_NONE if no path.
  - `get_current_path_points(controller)` -> `Array [ Vector ]` [classmethod] — Returns an array of navigation path points given controller is currently using.
  - `get_next_nav_link_index(controller)` -> `int32` [classmethod] — Return the path index of the next nav link for the current path of the given controller. Returns INDEX_NONE if no path o...
  - `is_valid_ai_direction(direction_vector)` -> `bool` [classmethod] — Is Valid AIDirection
  - `is_valid_ai_location(location)` -> `bool` [classmethod] — Is Valid AILocation
  - `is_valid_ai_rotation(rotation)` -> `bool` [classmethod] — Is Valid AIRotation
  - `lock_ai_resources_with_animation(anim_instance, lock_movement, lock_ai_logic)` -> `None` [classmethod] — locks indicated AI resources of animated pawn
  - `send_ai_message(target, message, message_source, success = True)` -> `None` [classmethod] — Send AIMessage
  - `simple_move_to_actor(controller, goal)` -> `None` [classmethod] — Simple Move to Actor
  - `simple_move_to_location(controller, goal)` -> `None` [classmethod] — Simple Move to Location
  - `spawn_ai_from_class(world_context_object, pawn_class, behavior_tree, location, rotation = [0.000000,0.000000,0.000000], no_collision_fail = False, owner = None)` -> `Pawn` [classmethod] — Spawns AI agent of a given class. The PawnClass needs to have AIController set for the function to spawn a controller as...
  - `unlock_ai_resources_with_animation(anim_instance, unlock_movement, unlock_ai_logic)` -> `None` [classmethod] — unlocks indicated AI resources of animated pawn. Will unlock only animation-locked resources

### `unreal.AIPerceptionComponent`
Inherits: `ActorComponent` | Header: `AIPerceptionComponent.h`

AIPerceptionComponent is used to register as stimuli listener in AIPerceptionSystem and gathers registered stimuli. UpdatePerception is called when component gets new stimuli (batched)

**Methods** (9):
  - `forget_all()` -> `None` — basically cleans up PerceptualData, resulting in loss of all previous perception
  - `get_actors_perception(actor)` -> `ActorPerceptionBlueprintInfo or None` — Retrieves whatever has been sensed about given actor
  - `get_currently_perceived_actors(sense_to_use)` -> `Array [ Actor ]` — If SenseToUse is none all actors currently perceived in any way will get fetched
  - `get_known_perceived_actors(sense_to_use)` -> `Array [ Actor ]` — If SenseToUse is none all actors ever perceived in any way (and not forgotten yet) will get fetched
  - `get_perceived_hostile_actors()` -> `Array [ Actor ]` — blueprint interface
  - `get_perceived_hostile_actors_by_sense(sense_to_use)` -> `Array [ Actor ]` — Get Perceived Hostile Actors by Sense
  - `is_sense_enabled(sense_class)` -> `bool`
  - `request_stimuli_listener_update()` -> `None` — Notifies AIPerceptionSystem to update properties for this âstimuli listenerâ
  - `set_sense_enabled(sense_class, enable)` -> `None`

**Properties** (4):
  - `on_perception_updated`: `PerceptionUpdatedDelegate` — [Read-Write] Might want to move these to special âBP_AIPerceptionComponentâ (PerceptionUpdatedDe...
  - `on_target_perception_forgotten`: `ActorPerceptionForgetUpdatedDelegate` — [Read-Write] Notifies all bound delegates that the perception info has been forgotten for a given ta...
  - `on_target_perception_info_updated`: `ActorPerceptionInfoUpdatedDelegate` — [Read-Write] Notifies all bound objects that perception info has been updated for a given target.
Th...
  - `on_target_perception_updated`: `ActorPerceptionUpdatedDelegate` — [Read-Write] Notifies all bound objects that perception info has been updated for a given target.
Th...

### `unreal.AIPerceptionStimuliSourceComponent`
Inherits: `ActorComponent` | Header: `AIPerceptionStimuliSourceComponent.h`

Gives owning actor a way to auto-register as perception systemâs sense stimuli source

**Methods** (4):
  - `register_for_sense(sense_class)` -> `None` — Registers owning actor as source for specified sense class
  - `register_with_perception_system()` -> `None` — Registers owning actor as source of stimuli for senses specified in RegisterAsSourceForSenses. Note that you donât hav...
  - `unregister_from_perception_system()` -> `None` — Unregister owning actor from being a source of sense stimuli
  - `unregister_from_sense(sense_class)` -> `None` — Unregisters owning actor from sources list of a specified sense class

**Properties** (2):
  - `auto_register_as_source`: `bool` [Read-Only] — [Read-Only] (bool)
  - `register_as_source_for_senses`: `None` [Read-Only] — [Read-Only] (Array[type(Class)])

### `unreal.AIPerceptionSystem`
Inherits: `AISubsystem` | Header: `AIPerceptionSystem.h`

AI Subsystem managing AI Perception through registered AI Senses between Listeners and Stimuli Sources

**Methods** (4):
  - `get_sense_class_for_stimulus(world_context_object, stimulus)` [classmethod] — Get Sense Class for Stimulus
  - `register_perception_stimuli_source(world_context_object, sense, target)` -> `bool` [classmethod] — Register Perception Stimuli Source
  - `report_event(perception_event)` -> `None` — Report Event
  - `report_perception_event(world_context_object, perception_event)` -> `None` [classmethod] — Report Perception Event

### `unreal.AIResource_Logic`
Inherits: `GameplayTaskResource` | Header: `AIResources.h`

AIResource Logic

### `unreal.AIResource_Movement`
Inherits: `GameplayTaskResource` | Header: `AIResources.h`

AIResource Movement

### `unreal.AISense`
Inherits: `Object` | Header: `AISense.h`

**Properties** (3):
  - `auto_register_all_pawns_as_sources`: `bool` [Read-Only] — [Read-Only] If true all newly spawned pawns will get auto registered as source for this sense. (bool...
  - `notify_type`: `AISenseNotifyType` [Read-Only] — [Read-Only] (AISenseNotifyType)
  - `wants_new_pawn_notification`: `bool` [Read-Only] — [Read-Only] whether this sense is interested in getting notified about new Pawns being spawned
this ...

### `unreal.AISense_Blueprint`
Inherits: `AISense` | Header: `AISense_Blueprint.h`

AISense Blueprint

**Methods** (7):
  - `get_all_listener_actors()` -> `Array [ Actor ]` — Get All Listener Actors
  - `get_all_listener_components()` -> `Array [ AIPerceptionComponent ]` — Get All Listener Components
  - `on_listener_registered(actor_listener, perception_component)` -> `None`
  - `on_listener_unregistered(actor_listener, perception_component)` -> `None` — called when a listener unregistered from this sense. Most often this is called due to actorâs death
  - `on_listener_updated(actor_listener, perception_component)` -> `None`
  - `on_new_pawn(new_pawn)` -> `None` — called when senseâs instance gets notified about new pawn that has just been spawned
  - `on_update(events_to_process)` -> `float`

**Properties** (2):
  - `listener_container`: `None` [Read-Only] — [Read-Only] (Array[AIPerceptionComponent])
  - `listener_data_type`: `Class` — [Read-Write] (type(Class))

### `unreal.AISense_Damage`
Inherits: `AISense` | Header: `AISense_Damage.h`

AISense Damage

**Methods** (1):
  - `report_damage_event(world_context_object, damaged_actor, instigator, damage_amount, event_location, hit_location, tag = 'None')` -> `None` [classmethod] — EventLocation will be reported as Instigatorâs location at the moment of event happening

### `unreal.AISense_Hearing`
Inherits: `AISense` | Header: `AISense_Hearing.h`

AISense Hearing

**Methods** (1):
  - `report_noise_event(world_context_object, noise_location, loudness = 1.000000, instigator = None, max_range = 0.000000, tag = 'None')` -> `None` [classmethod] — Report a noise event.

### `unreal.AISense_Prediction`
Inherits: `AISense` | Header: `AISense_Prediction.h`

AISense Prediction

**Methods** (2):
  - `request_controller_prediction_event(requestor, predicted_actor, prediction_time)` -> `None` [classmethod]
  - `request_pawn_prediction_event(requestor, predicted_actor, prediction_time)` -> `None` [classmethod]

### `unreal.AISense_Sight`
Inherits: `AISense` | Header: `AISense_Sight.h`

AISense Sight

### `unreal.AISense_Team`
Inherits: `AISense` | Header: `AISense_Team.h`

AISense Team

### `unreal.AISense_Touch`
Inherits: `AISense` | Header: `AISense_Touch.h`

AISense Touch

**Methods** (1):
  - `report_touch_event(world_context_object, touch_receiver, other_actor, location)` -> `None` [classmethod] — Report Touch Event

### `unreal.AISenseConfig`
Inherits: `Object` | Header: `AISenseConfig.h`

AISense Config

**Properties** (3):
  - `debug_color`: `Color` [Read-Only] — [Read-Only] (Color)
  - `max_age`: `float` [Read-Only] — [Read-Only] Specifies age limit after stimuli generated by this sense become expired. 0 means ânev...
  - `starts_enabled`: `bool` [Read-Only] — [Read-Only] determines whether given sense starts in an enabled state (bool)

### `unreal.AISenseConfig_Blueprint`
Inherits: `AISenseConfig` | Header: `AISenseConfig_Blueprint.h`

AISense Config Blueprint

**Properties** (1):
  - `implementation`: `Class` [Read-Only] — [Read-Only] (type(Class))

### `unreal.AISenseConfig_Damage`
Inherits: `AISenseConfig` | Header: `AISenseConfig_Damage.h`

AISense Config Damage

**Properties** (1):
  - `implementation`: `Class` [Read-Only] — [Read-Only] (type(Class))

### `unreal.AISenseConfig_Hearing`
Inherits: `AISenseConfig` | Header: `AISenseConfig_Hearing.h`

AISense Config Hearing

**Properties** (4):
  - `detection_by_affiliation`: `AISenseAffiliationFilter` [Read-Only] — [Read-Only] (AISenseAffiliationFilter)
  - `hearing_range`: `float` [Read-Only] — [Read-Only] (float)
  - `implementation`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `lo_s_hearing_range`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.AISenseConfig_Prediction`
Inherits: `AISenseConfig` | Header: `AISenseConfig_Prediction.h`

AISense Config Prediction

### `unreal.AISenseConfig_Sight`
Inherits: `AISenseConfig` | Header: `AISenseConfig_Sight.h`

AISense Config Sight

**Properties** (8):
  - `auto_success_range_from_last_seen_location`: `float` [Read-Only] — [Read-Only] If not an InvalidRange (which is the default), we will always be able to see the target ...
  - `detection_by_affiliation`: `AISenseAffiliationFilter` [Read-Only] — [Read-Only] (AISenseAffiliationFilter)
  - `implementation`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `lose_sight_radius`: `float` [Read-Only] — [Read-Only] Maximum sight distance to see target that has been already seen. (float)
  - `near_clipping_radius`: `float` [Read-Only] — [Read-Only] Near clipping distance, to be used with point of view backward offset. Will act as a clo...
  - `peripheral_vision_angle_degrees`: `float` [Read-Only] — [Read-Only] How far to the side AI can see, in degrees. Use SetPeripheralVisionAngle to change the v...
  - `point_of_view_backward_offset`: `float` [Read-Only] — [Read-Only] Point of view move back distance for cone calculation. In conjunction with near clipping...
  - `sight_radius`: `float` [Read-Only] — [Read-Only] Maximum sight distance to notice a target. (float)

### `unreal.AISenseConfig_Team`
Inherits: `AISenseConfig` | Header: `AISenseConfig_Team.h`

AISense Config Team

### `unreal.AISenseConfig_Touch`
Inherits: `AISenseConfig` | Header: `AISenseConfig_Touch.h`

AISense Config Touch

**Properties** (1):
  - `detection_by_affiliation`: `AISenseAffiliationFilter` [Read-Only] — [Read-Only] (AISenseAffiliationFilter)

### `unreal.AISenseEvent`
Inherits: `Object` | Header: `AISenseEvent.h`

AISense Event

### `unreal.AISenseEvent_Damage`
Inherits: `AISenseEvent` | Header: `AISenseEvent_Damage.h`

AISense Event Damage

**Properties** (1):
  - `event`: `AIDamageEvent` — [Read-Write] (AIDamageEvent)

### `unreal.AISenseEvent_Hearing`
Inherits: `AISenseEvent` | Header: `AISenseEvent_Hearing.h`

AISense Event Hearing

**Properties** (1):
  - `event`: `AINoiseEvent` — [Read-Write] (AINoiseEvent)

### `unreal.AISubsystem`
Inherits: `Object` | Header: `AISubsystem.h`

A class representing a common interface and behavior for AI subsystems

### `unreal.AITask`
Inherits: `GameplayTask` | Header: `AITask.h`

**Properties** (1):
  - `owner_controller`: `AIController` [Read-Only] — [Read-Only] (AIController)

### `unreal.AITask_LockLogic`
Inherits: `AITask` | Header: `AITask_LockLogic.h`

Locks AI logic until removed by external trigger

### `unreal.AITask_MoveTo`
Inherits: `AITask` | Header: `AITask_MoveTo.h`

AITask Move To

**Properties** (2):
  - `on_move_finished`: `MoveTaskCompletedSignature` — [Read-Write] (MoveTaskCompletedSignature)
  - `on_request_failed`: `GenericGameplayTaskDelegate` — [Read-Write] (GenericGameplayTaskDelegate)

### `unreal.AITask_RunEQS`
Inherits: `AITask` | Header: `AITask_RunEQS.h`

AITask Run EQS

### `unreal.BehaviorTree`
Inherits: `Object` | Header: `BehaviorTree.h`

Behavior Tree

**Methods** (1):
  - `get_blackboard_asset()` -> `BlackboardData` — Returns BlackboardData referenced by the owner object.

### `unreal.BehaviorTreeComponent`
Inherits: `BrainComponent` | Header: `BehaviorTreeComponent.h`

Behavior Tree Component

**Methods** (3):
  - `add_cooldown_tag_duration(cooldown_tag, cooldown_duration, add_to_existing_duration)` -> `None` — add to the cooldown tagâs duration
  - `get_tag_cooldown_end_time(cooldown_tag)` -> `double`
  - `set_dynamic_subtree(inject_tag, behavior_asset)` -> `None` — assign subtree to RunBehaviorDynamic task specified by tag.

**Properties** (1):
  - `default_behavior_tree_asset`: `BehaviorTree` — [Read-Write] data asset defining the tree (BehaviorTree)

### `unreal.BlackboardAssetProvider`
Inherits: `Interface` | Header: `BlackboardAssetProvider.h`

Blackboard Asset Provider

**Methods** (1):
  - `get_blackboard_asset()` -> `BlackboardData` — Returns BlackboardData referenced by the owner object.

### `unreal.BlackboardComponent`
Inherits: `ActorComponent` | Header: `BlackboardComponent.h`

Blackboard Component

**Methods** (24):
  - `clear_value(key_name)` -> `None` — Clear Value
  - `get_location_from_entry(key_name)` -> `Vector or None` — return false if call failed (most probably no such entry in BB)
  - `get_rotation_from_entry(key_name)` -> `Rotator or None` — return false if call failed (most probably no such entry in BB)
  - `get_value_as_bool(key_name)` -> `bool` — Get Value as Bool
  - `get_value_as_class(key_name)` — Get Value as Class
  - `get_value_as_enum(key_name)` -> `uint8` — Get Value as Enum
  - `get_value_as_float(key_name)` -> `float` — Get Value as Float
  - `get_value_as_int(key_name)` -> `int32` — Get Value as Int
  - `get_value_as_name(key_name)` -> `Name` — Get Value as Name
  - `get_value_as_object(key_name)` -> `Object` — Get Value as Object
  - `get_value_as_rotator(key_name)` -> `Rotator` — Get Value as Rotator
  - `get_value_as_string(key_name)` -> `str` — Get Value as String
  - `get_value_as_vector(key_name)` -> `Vector` — Get Value as Vector
  - `is_vector_value_set(key_name)` -> `bool` — If the vector value has been set (and not cleared), this function returns true (indicating that the value should be vali...
  - `set_value_as_bool(key_name, bool_value)` -> `None` — Set Value as Bool
  - `set_value_as_class(key_name, class_value)` -> `None` — Set Value as Class
  - `set_value_as_enum(key_name, enum_value)` -> `None` — Set Value as Enum
  - `set_value_as_float(key_name, float_value)` -> `None` — Set Value as Float
  - `set_value_as_int(key_name, int_value)` -> `None` — Set Value as Int
  - `set_value_as_name(key_name, name_value)` -> `None` — Set Value as Name
  - `set_value_as_object(key_name, object_value)` -> `None` — Set Value as Object
  - `set_value_as_rotator(key_name, vector_value)` -> `None` — Set Value as Rotator
  - `set_value_as_string(key_name, string_value)` -> `None` — Set Value as String
  - `set_value_as_vector(key_name, vector_value)` -> `None` — Set Value as Vector

### `unreal.BlackboardData`
Inherits: `DataAsset` | Header: `BlackboardData.h`

Blackboard Data

### `unreal.BlackboardKeyType`
Inherits: `Object` | Header: `BlackboardKeyType.h`

Blackboard Key Type

### `unreal.BrainComponent`
Inherits: `ActorComponent` | Header: `BrainComponent.h`

Brain Component

**Methods** (5):
  - `is_paused()` -> `bool` — Is Paused
  - `is_running()` -> `bool` — Is Running
  - `restart_logic()` -> `None` — Restarts currently running or previously ran brain logic.
  - `start_logic()` -> `None` — Starts brain logic. If brain is already running, will not do anything.
  - `stop_logic(reason)` -> `None` — Stops currently running brain logic.

### `unreal.BTAuxiliaryNode`
Inherits: `BTNode` | Header: `BTAuxiliaryNode.h`

Auxiliary nodes are supporting nodes, that receive notification about execution flow and can be ticked

### `unreal.BTDecorator`
Inherits: `BTAuxiliaryNode` | Header: `BTDecorator.h`

Decorators are supporting nodes placed on parent-child connection, that receive notification about execution flow and can be ticked

### `unreal.BTDecorator_BlueprintBase`
Inherits: `BTDecorator` | Header: `BTDecorator_BlueprintBase.h`

Base class for blueprint based decorator nodes. Do NOT use it for creating native c++ classes!

**Methods** (14):
  - `is_decorator_execution_active()` -> `bool` — check if decorator is part of currently active branch
  - `is_decorator_observer_active()` -> `bool` — check if decoratorâs observer is currently active
  - `perform_condition_check(owner_actor)` -> `bool` — called when testing if underlying node can be executed, must call FinishConditionCheck Note: that if both generic and AI...
  - `perform_condition_check_ai(owner_controller, controlled_pawn)` -> `bool` — Alternative AI version of ReceiveConditionCheck see: ReceiveConditionCheck for more details Note: that if both generic a...
  - `receive_execution_finish(owner_actor, node_result)` -> `None` — called when execution of underlying node is finished Note: that if both generic and AI event versions are implemented on...
  - `receive_execution_finish_ai(owner_controller, controlled_pawn, node_result)` -> `None` — Alternative AI version of ReceiveExecutionFinish see: ReceiveExecutionFinish for more details Note: that if both generic...
  - `receive_execution_start(owner_actor)` -> `None` — called on execution of underlying node Note: that if both generic and AI event versions are implemented only the more su...
  - `receive_execution_start_ai(owner_controller, controlled_pawn)` -> `None` — Alternative AI version of ReceiveExecutionStart see: ReceiveExecutionStart for more details Note: that if both generic a...
  - `receive_observer_activated(owner_actor)` -> `None` — called when observer is activated (flow controller) Note: that if both generic and AI event versions are implemented onl...
  - `receive_observer_activated_ai(owner_controller, controlled_pawn)` -> `None` — Alternative AI version of ReceiveObserverActivated see: ReceiveObserverActivated for more details Note: that if both gen...
  - `receive_observer_deactivated(owner_actor)` -> `None` — called when observer is deactivated (flow controller) Note: that if both generic and AI event versions are implemented o...
  - `receive_observer_deactivated_ai(owner_controller, controlled_pawn)` -> `None` — Alternative AI version of ReceiveObserverDeactivated see: ReceiveObserverDeactivated for more details Note: that if both...
  - `receive_tick(owner_actor, delta_seconds)` -> `None` — tick function Note: that if both generic and AI event versions are implemented only the more suitable one will be called...
  - `receive_tick_ai(owner_controller, controlled_pawn, delta_seconds)` -> `None` — Alternative AI version of ReceiveTick see: ReceiveTick for more details Note: that if both generic and AI event versions...

**Properties** (1):
  - `custom_description`: `str` — [Read-Write] (str)

### `unreal.BTFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BTFunctionLibrary.h`

BTFunction Library

**Methods** (28):
  - `clear_blackboard_value(node_owner, key)` -> `None` [classmethod] — Resets indicated value to ânot setâ value, based on values type
  - `clear_blackboard_value_as_vector(node_owner, key)` -> `None` [classmethod] — (DEPRECATED) Use ClearBlackboardValue instead deprecated: Use ClearBlackboardValue instead.
  - `get_blackboard(node_owner: BTNode)` -> `BlackboardComponent` [classmethod] — deprecated: âget_blackboardâ was renamed to âget_owners_blackboardâ.
  - `get_blackboard_value_as_actor(node_owner, key)` -> `Actor` [classmethod] — Get Blackboard Value as Actor
  - `get_blackboard_value_as_bool(node_owner, key)` -> `bool` [classmethod] — Get Blackboard Value as Bool
  - `get_blackboard_value_as_class(node_owner, key)` [classmethod] — Get Blackboard Value as Class
  - `get_blackboard_value_as_enum(node_owner, key)` -> `uint8` [classmethod] — Get Blackboard Value as Enum
  - `get_blackboard_value_as_float(node_owner, key)` -> `float` [classmethod] — Get Blackboard Value as Float
  - `get_blackboard_value_as_int(node_owner, key)` -> `int32` [classmethod] — Get Blackboard Value as Int
  - `get_blackboard_value_as_name(node_owner, key)` -> `Name` [classmethod] — Get Blackboard Value as Name
  - `get_blackboard_value_as_object(node_owner, key)` -> `Object` [classmethod] — Get Blackboard Value as Object
  - `get_blackboard_value_as_rotator(node_owner, key)` -> `Rotator` [classmethod] — Get Blackboard Value as Rotator
  - `get_blackboard_value_as_string(node_owner, key)` -> `str` [classmethod] — Get Blackboard Value as String
  - `get_blackboard_value_as_vector(node_owner, key)` -> `Vector` [classmethod] — Get Blackboard Value as Vector
  - `get_owner_component(node_owner)` -> `BehaviorTreeComponent` [classmethod] — Get Owner Component
  - `get_owners_blackboard(node_owner)` -> `BlackboardComponent` [classmethod] — Get Owners Blackboard
  - `set_blackboard_value_as_bool(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as Bool
  - `set_blackboard_value_as_class(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as Class
  - `set_blackboard_value_as_enum(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as Enum
  - `set_blackboard_value_as_float(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as Float
  - `set_blackboard_value_as_int(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as Int
  - `set_blackboard_value_as_name(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as Name
  - `set_blackboard_value_as_object(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as Object
  - `set_blackboard_value_as_rotator(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as Rotator
  - `set_blackboard_value_as_string(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as String
  - `set_blackboard_value_as_vector(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as Vector
  - `start_using_external_event(node_owner, owning_actor)` -> `None` [classmethod] — Initialize variables marked as âinstance memoryâ and set owning actor for blackboard operations deprecated: No longe...
  - `stop_using_external_event(node_owner)` -> `None` [classmethod] — Save variables marked as âinstance memoryâ and clear owning actor deprecated: No longer needed

### `unreal.BTNode`
Inherits: `Object` | Header: `BTNode.h`

### `unreal.BTService`
Inherits: `BTAuxiliaryNode` | Header: `BTService.h`

Behavior Tree service nodes is designed to perform âbackgroundâ tasks that update AIâs knowledge.

### `unreal.BTService_BlueprintBase`
Inherits: `BTService` | Header: `BTService_BlueprintBase.h`

Base class for blueprint based service nodes. Do NOT use it for creating native c++ classes!

**Methods** (9):
  - `is_service_active()` -> `bool` — check if service is currently being active
  - `receive_activation(owner_actor)` -> `None` — service became active Note: that if both generic and AI event versions are implemented only the more suitable one will b...
  - `receive_activation_ai(owner_controller, controlled_pawn)` -> `None` — Alternative AI version of ReceiveActivation function. see: ReceiveActivation for more details Note: that if both generic...
  - `receive_deactivation(owner_actor)` -> `None` — service became inactive Note: that if both generic and AI event versions are implemented only the more suitable one will...
  - `receive_deactivation_ai(owner_controller, controlled_pawn)` -> `None` — Alternative AI version of ReceiveDeactivation function. see: ReceiveDeactivation for more details Note: that if both gen...
  - `receive_search_start(owner_actor)` -> `None` — task search enters branch of tree Note: that if both generic and AI event versions are implemented only the more suitabl...
  - `receive_search_start_ai(owner_controller, controlled_pawn)` -> `None` — Alternative AI version of ReceiveSearchStart function. see: ReceiveSearchStart for more details Note: that if both gener...
  - `receive_tick(owner_actor, delta_seconds)` -> `None` — tick function Note: that if both generic and AI event versions are implemented only the more suitable one will be called...
  - `receive_tick_ai(owner_controller, controlled_pawn, delta_seconds)` -> `None` — Alternative AI version of ReceiveTick function. see: ReceiveTick for more details Note: that if both generic and AI even...

**Properties** (1):
  - `custom_description`: `str` — [Read-Write] (str)

### `unreal.BTTask_BlueprintBase`
Inherits: `BTTaskNode` | Header: `BTTask_BlueprintBase.h`

Base class for blueprint based task nodes. Do NOT use it for creating native c++ classes!

**Methods** (12):
  - `finish_abort()` -> `None` — aborts task execution
  - `finish_execute(success)` -> `None` — finishes task execution with Success or Fail result
  - `is_task_aborting()` -> `bool` — check if task is currently being aborted
  - `is_task_executing()` -> `bool` — check if task is currently being executed
  - `receive_abort(owner_actor)` -> `None` — if blueprint graph contains this event, task will stay active until FinishAbort is called Note: that if both generic and...
  - `receive_abort_ai(owner_controller, controlled_pawn)` -> `None` — Alternative AI version of ReceiveAbort see: ReceiveAbort for more details Note: that if both generic and AI event versio...
  - `receive_execute(owner_actor)` -> `None` — entry point, task will stay active until FinishExecute is called. Note: that if both generic and AI event versions are i...
  - `receive_execute_ai(owner_controller, controlled_pawn)` -> `None` — Alternative AI version of ReceiveExecute see: ReceiveExecute for more details Note: that if both generic and AI event ve...
  - `receive_tick(owner_actor, delta_seconds)` -> `None` — tick function Note: that if both generic and AI event versions are implemented only the more suitable one will be called...
  - `receive_tick_ai(owner_controller, controlled_pawn, delta_seconds)` -> `None` — Alternative AI version of tick function. see: ReceiveTick for more details Note: that if both generic and AI event versi...
  - `set_finish_on_message(message_name)` -> `None` — task execution will be finished (with result âSuccessâ) after receiving specified message
  - `set_finish_on_message_with_id(message_name, request_id = -1)` -> `None` — task execution will be finished (with result âSuccessâ) after receiving specified message with indicated ID

**Properties** (1):
  - `custom_description`: `str` — [Read-Write] (str)

### `unreal.BTTaskNode`
Inherits: `BTNode` | Header: `BTTaskNode.h`

Task are leaf nodes of behavior tree, which perform actual actions

### `unreal.CrowdFollowingComponent`
Inherits: `PathFollowingComponent` | Header: `CrowdFollowingComponent.h`

Crowd Following Component

**Methods** (1):
  - `suspend_crowd_steering(suspend)` -> `None` — main switch for crowd steering & avoidance

### `unreal.DetourCrowdAIController`
Inherits: `AIController` | Header: `DetourCrowdAIController.h`

Detour Crowd AIController

### `unreal.EnvQuery`
Inherits: `DataAsset` | Header: `EnvQuery.h`

Env Query

### `unreal.EnvQueryContext`
Inherits: `Object` | Header: `EnvQueryContext.h`

Env Query Context

### `unreal.EnvQueryContext_BlueprintBase`
Inherits: `EnvQueryContext` | Header: `EnvQueryContext_BlueprintBase.h`

Env Query Context Blueprint Base

**Methods** (4):
  - `provide_actors_set(querier_object, querier_actor)` -> `Array [ Actor ]` — Provide Actors Set
  - `provide_locations_set(querier_object, querier_actor)` -> `Array [ Vector ]` — Provide Locations Set
  - `provide_single_actor(querier_object, querier_actor)` -> `Actor` — Provide Single Actor
  - `provide_single_location(querier_object, querier_actor)` -> `Vector` — Provide Single Location

### `unreal.EnvQueryContext_NavigationData`
Inherits: `EnvQueryContext` | Header: `EnvQueryContext_NavigationData.h`

Env Query Context Navigation Data

### `unreal.EnvQueryGenerator`
Inherits: `EnvQueryNode` | Header: `EnvQueryGenerator.h`

Env Query Generator

### `unreal.EnvQueryGenerator_BlueprintBase`
Inherits: `EnvQueryGenerator` | Header: `EnvQueryGenerator_BlueprintBase.h`

Env Query Generator Blueprint Base

**Methods** (5):
  - `add_generated_actor(generated_actor)` -> `None` — Add Generated Actor
  - `add_generated_vector(generated_vector)` -> `None` — Add Generated Vector
  - `do_item_generation(context_locations)` -> `None` — Do Item Generation
  - `do_item_generation_from_actors(context_actors)` -> `None` — Do Item Generation from Actors
  - `get_querier()` -> `Object` — Get Querier

### `unreal.EnvQueryInstanceBlueprintWrapper`
Inherits: `Object` | Header: `EnvQueryInstanceBlueprintWrapper.h`

Env Query Instance Blueprint Wrapper

**Methods** (6):
  - `get_item_score(item_index)` -> `float` — Get Item Score
  - `get_query_results_as_actors()` -> `Array[Actor] or None` — Outputs an array filled with resulting actors. Note that it makes sense only if ItemType is a EnvQueryItemType_ActorBase...
  - `get_query_results_as_locations()` -> `Array[Vector] or None` — Outputs an array of locations generated by the query. If the query generated Actors the the array is filled with their l...
  - `get_results_as_actors()` -> `Array [ Actor ]` — DEPRECATED! Use GetQueryResultsAsActors instead. Returns an array filled with resulting actors. Note that it makes sense...
  - `get_results_as_locations()` -> `Array [ Vector ]` — DEPRECATED! Use GetQueryResultsAsLocations instead. Returns an array of locations generated by the query. If the query g...
  - `set_named_param(param_name, value)` -> `None` — Set Named Param

**Properties** (4):
  - `item_type`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `on_query_finished_event`: `EQSQueryDoneSignature` — [Read-Write] (EQSQueryDoneSignature)
  - `option_index`: `int` [Read-Only] — [Read-Only] index of query option, that generated items (int32)
  - `query_id`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.EnvQueryManager`
Inherits: `AISubsystem` | Header: `EnvQueryManager.h`

Env Query Manager

**Methods** (1):
  - `run_eqs_query(world_context_object, query_template, querier, run_mode, wrapper_class)` -> `EnvQueryInstanceBlueprintWrapper` [classmethod] — Run EQSQuery

### `unreal.EnvQueryNode`
Inherits: `Object` | Header: `EnvQueryNode.h`

Env Query Node

### `unreal.EQSRenderingComponent`
Inherits: `DebugDrawComponent` | Header: `EQSRenderingComponent.h`

EQSRendering Component

### `unreal.EQSTestingPawn`
Inherits: `Character` | Header: `EQSTestingPawn.h`

EQSTesting Pawn

### `unreal.GeneratedNavLinksProxy`
Inherits: `BaseGeneratedNavLinksProxy` | Header: `GeneratedNavLinksProxy.h`

Experimental Blueprintable class used to handle generated links as custom links.

**Methods** (1):
  - `receive_smart_link_reached(agent, destination)` -> `None` — Called when agent reaches smart link during path following.

**Properties** (1):
  - `on_smart_link_reached`: `LinkReachedSignature` — [Read-Write] (LinkReachedSignature)

### `unreal.GridPathAIController`
Inherits: `AIController` | Header: `GridPathAIController.h`

Grid Path AIController

### `unreal.GridPathFollowingComponent`
Inherits: `PathFollowingComponent` | Header: `GridPathFollowingComponent.h`

Path following augmented with local navigation grids

### `unreal.NavFilter_AIControllerDefault`
Inherits: `NavigationQueryFilter` | Header: `NavFilter_AIControllerDefault.h`

Nav Filter AIController Default

### `unreal.NavLinkProxy`
Inherits: `Actor` | Header: `NavLinkProxy.h`

ANavLinkProxy connects areas of Navmesh that donât have a direct navigation path. It directly supports Simple Links (see PointLinks array). There can be multiple Simple links per ANavLinkProxy insta...

**Methods** (5):
  - `has_moving_agents()` -> `bool` — check if any agent is moving through smart link right now
  - `is_smart_link_enabled()` -> `bool` — check if smart link is enabled
  - `receive_smart_link_reached(agent, destination)` -> `None` — called when agent reaches smart link during path following, use ResumePathFollowing() to give control back
  - `resume_path_following(agent)` -> `None` — resume normal path following
  - `set_smart_link_enabled(enabled)` -> `None` — change state of smart link

**Properties** (3):
  - `nav_links`: `None` — ânav_linksâ was renamed to âpoint_linksâ. deprecated
  - `on_smart_link_reached`: `SmartLinkReachedSignature` — [Read-Write] (SmartLinkReachedSignature)
  - `point_links`: `None` [Read-Only] — [Read-Only] Navigation links (point to point) added to navigation data (Array[NavigationLink])

### `unreal.NavLocalGridManager`
Inherits: `Object` | Header: `NavLocalGridManager.h`

Manager for local navigation grids

**Methods** (7):
  - `add_local_navigation_grid_for_box(world_context_object, location, extent = [1.000000,1.000000,1.000000], rotation = [0.000000,0.000000,0.000000], radius2d = 5, height = 100.000000, rebuild_grids = True)` -> `int32` [classmethod] — Add Local Navigation Grid for Box
  - `add_local_navigation_grid_for_capsule(world_context_object, location, capsule_radius, capsule_half_height, radius2d = 5, height = 100.000000, rebuild_grids = True)` -> `int32` [classmethod] — Add Local Navigation Grid for Capsule
  - `add_local_navigation_grid_for_point(world_context_object, location, radius2d = 5, height = 100.000000, rebuild_grids = True)` -> `int32` [classmethod] — creates new grid data for single point
  - `add_local_navigation_grid_for_points(world_context_object, locations, radius2d = 5, height = 100.000000, rebuild_grids = True)` -> `int32` [classmethod] — creates single grid data for set of points
  - `find_local_navigation_grid_path(world_context_object, start, end)` -> `Array[Vector] or None` [classmethod] — Find Local Navigation Grid Path
  - `remove_local_navigation_grid(world_context_object, grid_id, rebuild_grids = True)` -> `None` [classmethod] — Remove Local Navigation Grid
  - `set_local_navigation_grid_density(world_context_object, cell_size)` -> `bool` [classmethod] — Set Local Navigation Grid Density

### `unreal.PathFollowingComponent`
Inherits: `ActorComponent` | Header: `PathFollowingComponent.h`

Path Following Component

**Methods** (2):
  - `get_path_action_type()` -> `PathFollowingAction` — Get Path Action Type deprecated: This function is now deprecated, please use AIController.GetMoveStatus instead
  - `get_path_destination()` -> `Vector` — Get Path Destination deprecated: This function is now deprecated, please use AIController.GetImmediateMoveDestination in...

**Properties** (1):
  - `movement_comp`: `NavMovementComponent` — [Read-Write]
deprecated: MovementComp is deprecated, please use NavMovementInterface and the INavMov...

### `unreal.PawnSensingComponent`
Inherits: `ActorComponent` | Header: `PawnSensingComponent.h`

Pawn Sensing Component

**Methods** (5):
  - `get_peripheral_vision_angle()` -> `float` — Get Peripheral Vision Angle
  - `get_peripheral_vision_cosine()` -> `float` — Get Peripheral Vision Cosine
  - `set_peripheral_vision_angle(new_peripheral_vision_angle)` -> `None` — Sets PeripheralVisionAngle. Calculates PeripheralVisionCosine from PeripheralVisionAngle
  - `set_sensing_interval(new_sensing_interval)` -> `None` — Changes the SensingInterval. If we are currently waiting for an interval, this can either extend or shorten that interva...
  - `set_sensing_updates_enabled(enabled)` -> `None` — Enables or disables sensing updates. The timer is reset in either case.

**Properties** (14):
  - `b_wants_see_player_notify`: `bool` — âb_wants_see_player_notifyâ was renamed to âsee_pawnsâ. deprecated
  - `enable_sensing_updates`: `bool` [Read-Only] — [Read-Only] If true, component will perform sensing updates. At runtime change this using SetSensing...
  - `hear_noises`: `bool` — true
IMPORTANT NOTE: If we can see pawns (bSeePawns is true), and the pawn is visible, noise notific...
  - `hearing_max_sound_age`: `float` — [Read-Write] Max age of sounds we can hear. Should be greater than SensingInterval, or you might mis...
  - `hearing_threshold`: `float` — [Read-Write] Max distance at which a makenoise(1.0) loudness sound can be heard, regardless of occlu...
  - `los_hearing_threshold`: `float` — [Read-Write] Max distance at which a makenoise(1.0) loudness sound can be heard if unoccluded (LOSHe...
  - `on_hear_noise`: `HearNoiseDelegate` — [Read-Write] Delegate to execute when we hear a noise from a Pawnâs PawnNoiseEmitterComponent. (He...
  - `on_see_pawn`: `SeePawnDelegate` — [Read-Write] Delegate to execute when we see a Pawn. (SeePawnDelegate)
  - `only_sense_players`: `bool` — true (bool) [Read-Write] If true, will only sense player-controlled pawns in the world. Default
  - `peripheral_vision_angle`: `float` [Read-Only] — [Read-Only] How far to the side AI can see, in degrees. Use SetPeripheralVisionAngle to change the v...
  - `see_pawns`: `bool` — true (bool) [Read-Write] If true, we will perform visibility tests and will trigger notifications wh...
  - `sensing_interval`: `float` [Read-Only] — [Read-Only] Amount of time between pawn sensing updates. Use SetSensingInterval() to adjust this at ...
  - `sight_counter_interval`: `float` — âsight_counter_intervalâ was renamed to âsensing_intervalâ. deprecated
  - `sight_radius`: `float` — [Read-Write] Maximum sight distance. (float)

### `unreal.ValueOrBBKeyBlueprintUtility`
Inherits: `BlueprintFunctionLibrary` | Header: `ValueOrBBKeyBlueprintUtility.h`

Value or BBKey Blueprint Utility

**Methods** (11):
  - `get_bool(value, behavior_tree_comp)` -> `bool` [classmethod] — Get Bool
  - `get_class(value, behavior_tree_comp)` [classmethod] — Get Class
  - `get_enum(value, behavior_tree_comp)` -> `uint8` [classmethod] — Get Enum
  - `get_float(value, behavior_tree_comp)` -> `float` [classmethod] — Get Float
  - `get_int32(value, behavior_tree_comp)` -> `int32` [classmethod] — Get Int 32
  - `get_name(value, behavior_tree_comp)` -> `Name` [classmethod] — Get Name
  - `get_object(value, behavior_tree_comp)` -> `Object` [classmethod] — Get Object
  - `get_rotator(value, behavior_tree_comp)` -> `Rotator` [classmethod] — Get Rotator
  - `get_string(value, behavior_tree_comp)` -> `str` [classmethod] — Get String
  - `get_struct(value, behavior_tree_comp)` -> `InstancedStruct` [classmethod] — Get Struct
  - `get_vector(value, behavior_tree_comp)` -> `Vector` [classmethod] — Get Vector

### `unreal.AIParamType`
Inherits: `EnumBase` | Header: `EnvQueryTypes.h`

EAIParam Type

**Properties** (3):
  - `BOOL`: `AIParamType = Ellipsis` — 2
  - `FLOAT`: `AIParamType = Ellipsis` — 0
  - `INT`: `AIParamType = Ellipsis` — 1

### `unreal.AISenseNotifyType`
Inherits: `EnumBase` | Header: `AIPerceptionTypes.h`

EAISense Notify Type

**Properties** (2):
  - `ON_EVERY_PERCEPTION`: `AISenseNotifyType = Ellipsis` — Continuous update whenever target is perceived. 0
  - `ON_PERCEPTION_CHANGE`: `AISenseNotifyType = Ellipsis` — From âvisibleâ to ânot visibleâ or vice versa. 1

### `unreal.BTFlowAbortMode`
Inherits: `EnumBase` | Header: `BehaviorTreeTypes.h`

keep in sync with DescribeFlowAbortMode()

**Properties** (4):
  - `BOTH`: `BTFlowAbortMode = Ellipsis` — 3
  - `LOWER_PRIORITY`: `BTFlowAbortMode = Ellipsis` — 1
  - `NONE`: `BTFlowAbortMode = Ellipsis` — 0
  - `SELF`: `BTFlowAbortMode = Ellipsis` — 2

### `unreal.BTNodeResult`
Inherits: `EnumBase` | Header: `BehaviorTreeTypes.h`

keep in sync with DescribeNodeResult()

**Properties** (4):
  - `ABORTED`: `BTNodeResult = Ellipsis` — finished aborting = failure 2
  - `FAILED`: `BTNodeResult = Ellipsis` — finished as failure 1
  - `IN_PROGRESS`: `BTNodeResult = Ellipsis` — not finished yet 3
  - `SUCCEEDED`: `BTNodeResult = Ellipsis` — finished as success 0

### `unreal.EnvQueryHightlightMode`
Inherits: `EnumBase` | Header: `EQSTestingPawn.h`

EEnv Query Hightlight Mode

**Properties** (3):
  - `ALL`: `EnvQueryHightlightMode = Ellipsis` — 0
  - `BEST25_PCT`: `EnvQueryHightlightMode = Ellipsis` — 2
  - `BEST5_PCT`: `EnvQueryHightlightMode = Ellipsis` — 1

### `unreal.EnvQueryRunMode`
Inherits: `EnumBase` | Header: `EnvQueryTypes.h`

EEnv Query Run Mode

**Properties** (4):
  - `ALL_MATCHING`: `EnvQueryRunMode = Ellipsis` — Get all items that match conditions 3
  - `RANDOM_BEST25_PCT`: `EnvQueryRunMode = Ellipsis` — Pick random item with score 75% .. 100% of max 2
  - `RANDOM_BEST5_PCT`: `EnvQueryRunMode = Ellipsis` — Pick random item with score 95% .. 100% of max 1
  - `SINGLE_RESULT`: `EnvQueryRunMode = Ellipsis` — Pick first item with the best score 0

### `unreal.EnvQueryStatus`
Inherits: `EnumBase` | Header: `EnvQueryTypes.h`

EEnv Query Status

**Properties** (6):
  - `ABORTED`: `EnvQueryStatus = Ellipsis` — 3
  - `FAILED`: `EnvQueryStatus = Ellipsis` — 2
  - `MISSING_PARAM`: `EnvQueryStatus = Ellipsis` — 5
  - `OWNER_LOST`: `EnvQueryStatus = Ellipsis` — 4
  - `PROCESSING`: `EnvQueryStatus = Ellipsis` — 0
  - `SUCCESS`: `EnvQueryStatus = Ellipsis` — 1

### `unreal.EnvTestDot`
Inherits: `EnumBase` | Header: `EnvQueryTest_Dot.h`

EEnv Test Dot

**Properties** (2):
  - `DOT2D`: `EnvTestDot = Ellipsis` — Dot Product in the XY-plane, which is equivalent to the cosine of the heading or yaw angle. 1
  - `DOT3D`: `EnvTestDot = Ellipsis` — Fully 3D dot-product 0

### `unreal.PathFollowingAction`
Inherits: `EnumBase` | Header: `PathFollowingComponent.h`

DEPRECATED, will be removed with GetPathActionType function

**Properties** (5):
  - `DIRECT_MOVE`: `PathFollowingAction = Ellipsis` — 2
  - `ERROR`: `PathFollowingAction = Ellipsis` — 0
  - `NO_MOVE`: `PathFollowingAction = Ellipsis` — 1
  - `PARTIAL_PATH`: `PathFollowingAction = Ellipsis` — 3
  - `PATH_TO_GOAL`: `PathFollowingAction = Ellipsis` — 4

### `unreal.PathFollowingRequestResult`
Inherits: `EnumBase` | Header: `PathFollowingComponent.h`

EPath Following Request Result

**Properties** (3):
  - `ALREADY_AT_GOAL`: `PathFollowingRequestResult = Ellipsis` — 1
  - `FAILED`: `PathFollowingRequestResult = Ellipsis` — 0
  - `REQUEST_SUCCESSFUL`: `PathFollowingRequestResult = Ellipsis` — 2

### `unreal.PathFollowingResult`
Inherits: `EnumBase` | Header: `PathFollowingComponent.h`

EPath Following Result

**Properties** (5):
  - `ABORTED`: `PathFollowingResult = Ellipsis` — Aborted and stopped (failure) 3
  - `BLOCKED`: `PathFollowingResult = Ellipsis` — Movement was blocked 1
  - `INVALID`: `PathFollowingResult = Ellipsis` — Request was invalid 5
  - `OFF_PATH`: `PathFollowingResult = Ellipsis` — Agent is not on path 2
  - `SUCCESS`: `PathFollowingResult = Ellipsis` — Reached destination 0

### `unreal.PathFollowingStatus`
Inherits: `EnumBase` | Header: `PathFollowingComponent.h`

EPath Following Status

**Properties** (4):
  - `IDLE`: `PathFollowingStatus = Ellipsis` — No requests 0
  - `MOVING`: `PathFollowingStatus = Ellipsis` — Following path 3
  - `PAUSED`: `PathFollowingStatus = Ellipsis` — Request paused, will continue after ResumeMove() 2
  - `WAITING`: `PathFollowingStatus = Ellipsis` — Request with incomplete path, will start after UpdateMove() 1

### `unreal.TeamAttitude`
Inherits: `EnumBase` | Header: `GenericTeamAgentInterface.h`

ETeam Attitude

**Properties** (3):
  - `FRIENDLY`: `TeamAttitude = Ellipsis` — 0
  - `HOSTILE`: `TeamAttitude = Ellipsis` — 2
  - `NEUTRAL`: `TeamAttitude = Ellipsis` — 1

### `unreal.ActorPerceptionForgetUpdatedDelegate`
Inherits: `MulticastDelegateBase` | Header: `AIPerceptionComponent.h`

Actor Perception Forget Updated Delegate Delegate Signature

### `unreal.ActorPerceptionInfoUpdatedDelegate`
Inherits: `MulticastDelegateBase` | Header: `AIPerceptionComponent.h`

Actor Perception Info Updated Delegate Delegate Signature

### `unreal.ActorPerceptionUpdatedDelegate`
Inherits: `MulticastDelegateBase` | Header: `AIPerceptionComponent.h`

Actor Perception Updated Delegate Delegate Signature

### `unreal.AIMoveCompletedSignature`
Inherits: `MulticastDelegateBase` | Header: `AIController.h`

AIMove Completed Signature Delegate Signature

### `unreal.EnvQueryInstanceBlueprintWrapper_EQSQueryDoneSignature`
Inherits: `MulticastDelegateBase` | Header: `EnvQueryInstanceBlueprintWrapper.h`

EQSQuery Done Signature Delegate Signature

### `unreal.LinkReachedSignature`
Inherits: `MulticastDelegateBase` | Header: `GeneratedNavLinksProxy.h`

Link Reached Signature Delegate Signature

### `unreal.MoveTaskCompletedSignature`
Inherits: `MulticastDelegateBase` | Header: `AITask_MoveTo.h`

Move Task Completed Signature Delegate Signature

### `unreal.OAISimpleDelegate`
Inherits: `MulticastDelegateBase` | Header: `AIAsyncTaskBlueprintProxy.h`

OAISimple Delegate Delegate Signature

### `unreal.PawnSensingComponent_HearNoiseDelegate`
Inherits: `MulticastDelegateBase` | Header: `PawnSensingComponent.h`

Hear Noise Delegate Delegate Signature

### `unreal.PawnSensingComponent_SeePawnDelegate`
Inherits: `MulticastDelegateBase` | Header: `PawnSensingComponent.h`

See Pawn Delegate Delegate Signature

### `unreal.PerceptionUpdatedDelegate`
Inherits: `MulticastDelegateBase` | Header: `AIPerceptionComponent.h`

Perception Updated Delegate Delegate Signature

### `unreal.SmartLinkReachedSignature`
Inherits: `MulticastDelegateBase` | Header: `NavLinkProxy.h`

Smart Link Reached Signature Delegate Signature
