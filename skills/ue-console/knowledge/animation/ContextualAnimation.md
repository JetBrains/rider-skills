# UE Python API — ContextualAnimation Module

**48 types** from the `ContextualAnimation` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ContextualAnimActorPreviewData`, `ContextualAnimAttachmentParams`, `ContextualAnimIgnoreChannelsParam`, `ContextualAnimIKTarget`, `ContextualAnimIKTargetDefContainer`, `ContextualAnimIKTargetDefinition`, `ContextualAnimIKTargetParams`, `ContextualAnimPoint`, `ContextualAnimQueryParams`, `ContextualAnimQueryResult`, `ContextualAnimRoleDefinition`, `ContextualAnimSceneBinding`, `ContextualAnimSceneBindingContext`, `ContextualAnimSceneBindings`, `ContextualAnimSceneSection`, `ContextualAnimSet`, `ContextualAnimStartSceneParams`, `ContextualAnimTrack`, `ContextualAnimWarpPoint`, `ContextualAnimWarpPointCustomParams`, ... (48 total)

---

## Classes

### `unreal.ContextualAnimActorPreviewData`
Inherits: `StructBase` | Header: `ContextualAnimSceneAsset.h`

Contextual Anim Actor Preview Data

### `unreal.ContextualAnimAttachmentParams`
Inherits: `StructBase` | Header: `ContextualAnimSceneAsset.h`

Contextual Anim Attachment Params

### `unreal.ContextualAnimIgnoreChannelsParam`
Inherits: `StructBase` | Header: `ContextualAnimSceneAsset.h`

Contextual Anim Ignore Channels Param

### `unreal.ContextualAnimIKTarget`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

Contextual Anim IKTarget

**Properties** (4):
  - `alpha`: `float` — [Read-Write] (float)
  - `bone_name`: `Name` — [Read-Write] (Name)
  - `goal_name`: `Name` — [Read-Write] (Name)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ContextualAnimIKTargetDefContainer`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

Contextual Anim IKTarget Def Container

**Properties** (2):
  - `ik_target_defs`: `None` — [Read-Write] List of IK Target definitions (Array[ContextualAnimIKTargetDefinition])
  - `role`: `Name` — [Read-Write] Role this IK Target definitions are for (Name)

### `unreal.ContextualAnimIKTargetDefinition`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

Contextual Anim IKTarget Definition

**Properties** (5):
  - `bone_name`: `Name` — [Read-Write] (Name)
  - `goal_name`: `Name` — [Read-Write] (Name)
  - `provider`: `ContextualAnimIKTargetProvider` — [Read-Write] (ContextualAnimIKTargetProvider)
  - `target_bone_name`: `Name` — [Read-Write] (Name)
  - `target_role_name`: `Name` — [Read-Write] (Name)

### `unreal.ContextualAnimIKTargetParams`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

Contextual Anim IKTarget Params

### `unreal.ContextualAnimPoint`
Inherits: `StructBase` | Header: `ContextualAnimSceneAsset.h`

Contextual Anim Point

**Properties** (6):
  - `anim_set_idx`: `int` — [Read-Write] (int32)
  - `anim_track_idx`: `int` — [Read-Write] (int32)
  - `role`: `Name` — [Read-Write] (Name)
  - `section_idx`: `int` — [Read-Write] (int32)
  - `speed`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ContextualAnimQueryParams`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

Stores the parameters passed into query function TODO:: Only used by UContextualAnimSceneAsset::Query. Kept around only to do not break existing content. It will go away in the future.

**Properties** (4):
  - `complex_query`: `bool` — [Read-Write] (bool)
  - `find_anim_start_time`: `bool` — [Read-Write] (bool)
  - `querier`: `Actor` — [Read-Write] (Actor)
  - `query_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ContextualAnimQueryResult`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

Stores the result of a query function TODO:: Only used by UContextualAnimSceneAsset::Query. Kept around only to do not break existing content. It will go away in the future.

**Properties** (5):
  - `anim_set_idx`: `int` — [Read-Write] (int32)
  - `anim_start_time`: `float` — [Read-Write] (float)
  - `animation`: `AnimMontage` — [Read-Write] (AnimMontage)
  - `entry_transform`: `Transform` — [Read-Write] (Transform)
  - `sync_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ContextualAnimRoleDefinition`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

FContextualAnimRoleDefinition

**Properties** (5):
  - `is_character`: `bool` — [Read-Write] (bool)
  - `mesh_to_component`: `Transform` — [Read-Write] (Transform)
  - `name`: `Name` — [Read-Write] (Name)
  - `preview_capsule_half_height`: `float` — [Read-Write] (float)
  - `preview_capsule_radius`: `float` — [Read-Write] (float)

### `unreal.ContextualAnimSceneBinding`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

Represent an actor bound to a role in the scene

### `unreal.ContextualAnimSceneBindingContext`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

FContextualAnimSceneBindingContext

### `unreal.ContextualAnimSceneBindings`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

Contextual Anim Scene Bindings

### `unreal.ContextualAnimSceneSection`
Inherits: `StructBase` | Header: `ContextualAnimSceneAsset.h`

Named container with one or more ContextualAnimSet

### `unreal.ContextualAnimSet`
Inherits: `StructBase` | Header: `ContextualAnimSceneAsset.h`

Contains AnimTracks for each role in the interaction. Example: An specific set for a interaction with a car would have two tracks, one with the animation for the character and another one with the ani...

### `unreal.ContextualAnimStartSceneParams`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

DEPRECATED: Kept around only to do not break existing content. It will go away in the future.

**Properties** (3):
  - `anim_set_idx`: `int` — [Read-Write] Desired set. If INDEX_NONE the Manager will attempt to find the best set to use by runn...
  - `role_to_actor_map`: `None` — [Read-Write] Map with actors to bind to each role in the scene (Map[Name,ContextualAnimSceneBindingC...
  - `section_idx`: `int` — [Read-Write] Desired section. If INDEX_NONE the Manager will use or find best set in the first secti...

### `unreal.ContextualAnimTrack`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

Contextual Anim Track

**Properties** (12):
  - `anim_max_start_time`: `float` — [Read-Write] (float)
  - `anim_set_idx`: `int` [Read-Only] — [Read-Only] (int32)
  - `anim_track_idx`: `int` [Read-Only] — [Read-Only] (int32)
  - `animation`: `AnimSequenceBase` — [Read-Write] (AnimSequenceBase)
  - `change_movement_mode`: `bool` — [Read-Write] If true, will set the movement mode of the character using CAS, to âMovementModeâ, ...
  - `control_character_rotation`: `bool` — disable orientation of the character towards movement, controllerâs rotation and physics driven ro...
  - `custom_movement_mode`: `int` — [Read-Write] If âbChangeMovementModeâ is true, and the âMovementModeâ is Custom, itâll set...
  - `mesh_to_scene`: `Transform` — [Read-Write] (Transform)
  - `movement_mode`: `MovementMode` — [Read-Write] If âbChangeMovementModeâ is true, will set the movement mode of the character using...
  - `optional`: `bool` — [Read-Write] Whether the actor that should play this animation is optional (bool)
  - `role`: `Name` [Read-Only] — [Read-Only] (Name)
  - `section_idx`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.ContextualAnimWarpPoint`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

FContextualAnimWarpPoint

**Properties** (2):
  - `name`: `Name` — [Read-Write] (Name)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ContextualAnimWarpPointCustomParams`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

Parameters used to calculate a warp point when using âCustomâ mode

**Properties** (4):
  - `along_closest_distance`: `bool` — [Read-Write] (bool)
  - `origin`: `Name` — [Read-Write] (Name)
  - `other_role`: `Name` — [Read-Write] (Name)
  - `weight`: `float` — [Read-Write] (float)

### `unreal.ContextualAnimWarpPointDefinition`
Inherits: `StructBase` | Header: `ContextualAnimTypes.h`

Contain the params necessary to calculate a warp point for the scene. A warp point is a transform in the scene that can be used as reference to calculate alignment between actors

### `unreal.ContextualAnimWarpTarget`
Inherits: `StructBase` | Header: `ContextualAnimSceneActorComponent.h`

Contextual Anim Warp Target

### `unreal.AnimNotifyState_EarlyOutContextualAnimWindow`
Inherits: `AnimNotifyState` | Header: `AnimNotifyState_EarlyOutContextualAnimWindow.h`

Notify used to allow player to early out from a contextual anim. Usually used at the end of the animations to improve responsivess

### `unreal.AnimNotifyState_IKWindow`
Inherits: `AnimNotifyState` | Header: `AnimNotifyState_IKWindow.h`

AnimNotifyState used to define areas in an animation where IK should be enable

### `unreal.ContextualAnimActorInterface`
Inherits: `Interface` | Header: `ContextualAnimActorInterface.h`

Contextual Anim Actor Interface

**Methods** (1):
  - `get_mesh()` -> `SkeletalMeshComponent` — Get Mesh

### `unreal.ContextualAnimRolesAsset`
Inherits: `DataAsset` | Header: `ContextualAnimSceneAsset.h`

Contextual Anim Roles Asset

**Properties** (1):
  - `roles`: `None` — [Read-Write] (Array[ContextualAnimRoleDefinition])

### `unreal.ContextualAnimSceneActorComponent`
Inherits: `SceneComponent` | Header: `ContextualAnimSceneActorComponent.h`

Contextual Anim Scene Actor Component

**Methods** (13):
  - `add_ik_goals()` -> `Map [ Name , IKRigGoal ]` — Add your own goals to the OutGoals map (careful not to remove existing goals in the map!)
  - `early_out_contextual_anim_scene(stop_everyone = False)` -> `None` — Early Out Contextual Anim Scene
  - `get_bindings()` -> `ContextualAnimSceneBindings` — Get Bindings
  - `get_ik_target_by_goal_name(goal_name)` -> `ContextualAnimIKTarget` — Get IKTarget by Goal Name
  - `get_ik_targets()` -> `Array [ ContextualAnimIKTarget ]` — Get IKTargets
  - `is_in_active_scene()` -> `bool` — Is in Active Scene
  - `late_join_contextual_anim_scene(actor, role)` -> `bool` — Late Join Contextual Anim Scene
  - `on_joined_scene(bindings)` -> `None` — Called when the actor owner of this component joins an scene
  - `on_left_scene()` -> `None` — Called from the scene instance when the actor owner of this component leave an scene
  - `start_contextual_anim_scene(bindings)` -> `bool` — Start Contextual Anim Scene
  - `transition_contextual_anim_scene(section_name)` -> `bool` — Transition Contextual Anim Scene
  - `transition_contextual_anim_scene_to_specific_set(section_name, anim_set_idx)` -> `bool` — Transition Contextual Anim Scene to Specific Set
  - `transition_single_actor(section_idx, anim_set_idx)` -> `bool` — Transition Single Actor

**Properties** (5):
  - `on_joined_scene_delegate`: `ContextualAnimSceneActorCompDelegate` — [Read-Write] Event that happens when the actor owner of this component joins an scene (ContextualAni...
  - `on_left_scene_delegate`: `ContextualAnimSceneActorCompDelegate` — [Read-Write] Event that happens when the actor owner of this component leave an scene (ContextualAni...
  - `on_montage_blending_out_delegate`: `ContextualAnimOnMontageBlendingOutDelegate` — [Read-Write] (ContextualAnimOnMontageBlendingOutDelegate)
  - `on_play_montage_notify_begin_delegate`: `ContextualAnimPlayMontageNotifyBeginDelegate` — [Read-Write] (ContextualAnimPlayMontageNotifyBeginDelegate)
  - `scene_asset`: `ContextualAnimSceneAsset` — [Read-Write] (ContextualAnimSceneAsset)

### `unreal.ContextualAnimSceneAsset`
Inherits: `DataAsset` | Header: `ContextualAnimSceneAsset.h`

Contextual Anim Scene Asset

**Methods** (8):
  - `bp_find_anim_set_index_by_animation(section_idx, animation)` -> `int32` — BP Find Anim Set Index by Animation
  - `bp_find_animation_for_role(section_idx, anim_set_idx, role)` -> `AnimSequenceBase` — Blueprint Interface
  - `bp_get_alignment_transform_for_role_relative_to_warp_point(section_idx, anim_set_idx, role, time)` -> `Transform` — BP Get Alignment Transform for Role Relative to Warp Point
  - `bp_get_ik_target_transform_for_role_at_time(section_idx, anim_set_idx, role, track_name, time)` -> `Transform` — BP Get IKTarget Transform for Role at Time
  - `bp_get_start_and_end_time_for_warp_section(section_idx, anim_set_idx, role, out_end_time=float)` — BP Get Start and End Time for Warp Section
  - `get_alignment_points_for_secondary_role(type, section_idx, primary)` -> `Array [ ContextualAnimPoint ]` — Get Alignment Points for Secondary Role
  - `get_alignment_points_for_secondary_role_considering_selection_criteria(type, section_idx, primary, querier, criterion_to_consider)` -> `Array [ ContextualAnimPoint ]` — Get Alignment Points for Secondary Role Considering Selection Criteria
  - `query(role, query_params, to_world_transform)` -> `ContextualAnimQueryResult or None` — TODO:: Kept around only to do not break existing content. It will go away in the future.

### `unreal.ContextualAnimSelectionCriterion`
Inherits: `Object` | Header: `ContextualAnimSelectionCriterion.h`

UContextualAnimSelectionCriterion

**Properties** (1):
  - `type`: `ContextualAnimCriterionType` [Read-Only] — [Read-Only] (ContextualAnimCriterionType)

### `unreal.ContextualAnimSelectionCriterion_Blueprint`
Inherits: `ContextualAnimSelectionCriterion` | Header: `ContextualAnimSelectionCriterion.h`

UContextualAnimSelectionCriterion_Blueprint

**Methods** (2):
  - `bp_does_querier_pass_condition(primary, querier)` -> `bool` — BP Does Querier Pass Condition
  - `get_scene_asset()` -> `ContextualAnimSceneAsset` — Get Scene Asset

### `unreal.ContextualAnimSelectionCriterion_Cone`
Inherits: `ContextualAnimSelectionCriterion` | Header: `ContextualAnimSelectionCriterion.h`

Contextual Anim Selection Criterion Cone

**Properties** (4):
  - `distance`: `float` — [Read-Write] (float)
  - `half_angle`: `float` — [Read-Write] (float)
  - `mode`: `ContextualAnimCriterionConeMode` — [Read-Write] (ContextualAnimCriterionConeMode)
  - `offset`: `float` — [Read-Write] (float)

### `unreal.ContextualAnimSelectionCriterion_Distance`
Inherits: `ContextualAnimSelectionCriterion` | Header: `ContextualAnimSelectionCriterion.h`

Contextual Anim Selection Criterion Distance

**Properties** (3):
  - `max_distance`: `float` — [Read-Write] (float)
  - `min_distance`: `float` — [Read-Write] (float)
  - `mode`: `ContextualAnimCriterionDistanceMode` — [Read-Write] (ContextualAnimCriterionDistanceMode)

### `unreal.ContextualAnimSelectionCriterion_TriggerArea`
Inherits: `ContextualAnimSelectionCriterion` | Header: `ContextualAnimSelectionCriterion.h`

UContextualAnimSelectionCriterion_TriggerArea

**Properties** (2):
  - `height`: `float` — [Read-Write] (float)
  - `polygon_points`: `None` — [Read-Write] (Array[Vector])

### `unreal.ContextualAnimUtilities`
Inherits: `BlueprintFunctionLibrary` | Header: `ContextualAnimUtilities.h`

Contextual Anim Utilities

**Methods** (31):
  - `bp_create_contextual_anim_scene_bindings(scene_asset, params)` -> `ContextualAnimSceneBindings or None` [classmethod] — BP Create Contextual Anim Scene Bindings
  - `bp_create_contextual_anim_scene_bindings_for_two_actors(scene_asset, primary, secondary)` -> `ContextualAnimSceneBindings or None` [classmethod] — BP Create Contextual Anim Scene Bindings for Two Actors
  - `bp_draw_debug_pose(world_context_object, animation, time, local_to_world_transform, color, life_time, thickness)` -> `None` [classmethod] — BP Draw Debug Pose
  - `bp_montage_get_section_length(montage, section_index)` -> `float` [classmethod] — BP Montage Get Section Length
  - `bp_montage_get_section_start_and_end_time(montage, out_end_time=float)` [classmethod] — Montage Blueprint Interface
  - `bp_montage_get_section_time_left_from_pos(montage, position)` -> `float` [classmethod] — BP Montage Get Section Time Left from Pos
  - `bp_scene_binding_context_get_actor(binding_context)` -> `Actor` [classmethod] — BP Scene Binding Context Get Actor
  - `bp_scene_binding_context_get_current_section_and_anim_set_names(anim_set_name=Name)` [classmethod] — BP Scene Binding Context Get Current Section and Anim Set Names
  - `bp_scene_binding_context_get_gameplay_tags(binding_context)` -> `GameplayTagContainer` [classmethod] — BP Scene Binding Context Get Gameplay Tags
  - `bp_scene_binding_context_get_transform(binding_context)` -> `Transform` [classmethod] — BP Scene Binding Context Get Transform
  - `bp_scene_binding_context_get_velocity(binding_context)` -> `Vector` [classmethod] — BP Scene Binding Context Get Velocity
  - `bp_scene_binding_context_has_all_matching_gameplay_tags(binding_context, tag_container)` -> `bool` [classmethod] — BP Scene Binding Context Has All Matching Gameplay Tags
  - `bp_scene_binding_context_has_any_matching_gameplay_tags(binding_context, tag_container)` -> `bool` [classmethod] — BP Scene Binding Context Has Any Matching Gameplay Tags
  - `bp_scene_binding_context_has_matching_gameplay_tag(binding_context, tag_to_check)` -> `bool` [classmethod] — BP Scene Binding Context Has Matching Gameplay Tag
  - `bp_scene_binding_context_make_from_actor_with_external_transform(actor, external_transform)` -> `ContextualAnimSceneBindingContext` [classmethod] — BP Scene Binding Context Make from Actor with External Transform
  - `bp_scene_binding_get_actor(binding)` -> `Actor` [classmethod] — FContextualAnimSceneBinding Blueprint Interface
  - `bp_scene_binding_get_animation_from_binding(bindings, binding)` -> `AnimSequenceBase` [classmethod] — BP Scene Binding Get Animation from Binding
  - `bp_scene_binding_get_role_from_binding(bindings, binding)` -> `Name` [classmethod] — BP Scene Binding Get Role from Binding
  - `bp_scene_binding_get_skeletal_mesh(binding)` -> `SkeletalMeshComponent` [classmethod] — BP Scene Binding Get Skeletal Mesh
  - `bp_scene_bindings_add_or_update_warp_targets_for_bindings(bindings)` -> `None` [classmethod] — BP Scene Bindings Add or Update Warp Targets for Bindings
  - `bp_scene_bindings_calculate_warp_points(bindings)` -> `Array [ ContextualAnimWarpPoint ]` [classmethod] — SceneBindings Blueprint Interface
  - `bp_scene_bindings_get_alignment_transform_for_role_relative_to_other_role(bindings, role, relative_to_role, time)` -> `Transform` [classmethod] — BP Scene Bindings Get Alignment Transform for Role Relative to Other Role
  - `bp_scene_bindings_get_alignment_transform_for_role_relative_to_warp_point(bindings, role, warp_point, time)` -> `Transform` [classmethod] — BP Scene Bindings Get Alignment Transform for Role Relative to Warp Point
  - `bp_scene_bindings_get_alignment_transform_from_binding(bindings, binding, warp_point)` -> `Transform` [classmethod] — BP Scene Bindings Get Alignment Transform from Binding
  - `bp_scene_bindings_get_binding_by_actor(bindings, actor)` -> `ContextualAnimSceneBinding` [classmethod] — BP Scene Bindings Get Binding by Actor
  - `bp_scene_bindings_get_binding_by_role(bindings, role)` -> `ContextualAnimSceneBinding` [classmethod] — BP Scene Bindings Get Binding by Role
  - `bp_scene_bindings_get_bindings(bindings)` -> `Array [ ContextualAnimSceneBinding ]` [classmethod] — BP Scene Bindings Get Bindings
  - `bp_scene_bindings_get_primary_binding(bindings)` -> `ContextualAnimSceneBinding` [classmethod] — BP Scene Bindings Get Primary Binding
  - `bp_scene_bindings_get_scene_asset(bindings)` -> `ContextualAnimSceneAsset` [classmethod] — BP Scene Bindings Get Scene Asset
  - `bp_scene_bindings_get_section_and_anim_set_indices(anim_set_idx=int32)` [classmethod] — BP Scene Bindings Get Section and Anim Set Indices
  - `bp_scene_bindings_get_section_and_anim_set_names(anim_set_name=Name)` [classmethod] — BP Scene Bindings Get Section and Anim Set Names

### `unreal.ContextualAnimActorPreviewType`
Inherits: `EnumBase` | Header: `ContextualAnimSceneAsset.h`

EContextual Anim Actor Preview Type

**Properties** (4):
  - `ACTOR`: `ContextualAnimActorPreviewType = Ellipsis` — 2
  - `NONE`: `ContextualAnimActorPreviewType = Ellipsis` — 3
  - `SKELETAL_MESH`: `ContextualAnimActorPreviewType = Ellipsis` — 0
  - `STATIC_MESH`: `ContextualAnimActorPreviewType = Ellipsis` — 1

### `unreal.ContextualAnimCollisionBehavior`
Inherits: `EnumBase` | Header: `ContextualAnimSceneAsset.h`

EContextual Anim Collision Behavior

**Properties** (3):
  - `IGNORE_ACTOR_WHEN_MOVING`: `ContextualAnimCollisionBehavior = Ellipsis` — 1
  - `IGNORE_CHANNELS`: `ContextualAnimCollisionBehavior = Ellipsis` — 2
  - `NONE`: `ContextualAnimCollisionBehavior = Ellipsis` — 0

### `unreal.ContextualAnimCriterionConeMode`
Inherits: `EnumBase` | Header: `ContextualAnimSelectionCriterion.h`

UContextualAnimSelectionCriterion_Cone

**Properties** (2):
  - `FROM_PRIMARY`: `ContextualAnimCriterionConeMode = Ellipsis` — Uses the angle between the vector from primary to querier and primary forward vector rotated by offs...
  - `TO_PRIMARY`: `ContextualAnimCriterionConeMode = Ellipsis` — Uses the angle between the vector from querier to primary and querier forward vector rotated by offs...

### `unreal.ContextualAnimCriterionDistanceMode`
Inherits: `EnumBase` | Header: `ContextualAnimSelectionCriterion.h`

UContextualAnimSelectionCriterion_Distance

**Properties** (2):
  - `DISTANCE_2D`: `ContextualAnimCriterionDistanceMode = Ellipsis` — 1
  - `DISTANCE_3D`: `ContextualAnimCriterionDistanceMode = Ellipsis` — 0

### `unreal.ContextualAnimCriterionToConsider`
Inherits: `EnumBase` | Header: `ContextualAnimSceneAsset.h`

EContextual Anim Criterion to Consider

**Properties** (3):
  - `ALL`: `ContextualAnimCriterionToConsider = Ellipsis` — 0
  - `OTHER`: `ContextualAnimCriterionToConsider = Ellipsis` — 2
  - `SPATIAL`: `ContextualAnimCriterionToConsider = Ellipsis` — 1

### `unreal.ContextualAnimCriterionType`
Inherits: `EnumBase` | Header: `ContextualAnimSelectionCriterion.h`

EContextual Anim Criterion Type

**Properties** (2):
  - `OTHER`: `ContextualAnimCriterionType = Ellipsis` — 1
  - `SPATIAL`: `ContextualAnimCriterionType = Ellipsis` — 0

### `unreal.ContextualAnimIKTargetAlphaProvider`
Inherits: `EnumBase` | Header: `ContextualAnimTypes.h`

EContextual Anim IKTarget Alpha Provider

**Properties** (3):
  - `ANIM_NOTIFY_STATE`: `ContextualAnimIKTargetAlphaProvider = Ellipsis` — Alpha value is determine by an IK Window in the animation.
IK Target transform will only be calculat...
  - `CURVE`: `ContextualAnimIKTargetAlphaProvider = Ellipsis` — Alpha value is determined by a curve in the animation with the same name as the IK Target
IK Target ...
  - `NONE`: `ContextualAnimIKTargetAlphaProvider = Ellipsis` — IK Target transform will be calculated during the entire interaction. Alpha value will be always 1 2

### `unreal.ContextualAnimIKTargetProvider`
Inherits: `EnumBase` | Header: `ContextualAnimTypes.h`

EContextual Anim IKTarget Provider

**Properties** (2):
  - `AUTOGENERATED`: `ContextualAnimIKTargetProvider = Ellipsis` — IK Targets are auto generated from the animations
see:: UContextualAnimSceneAssetBase::GenerateIKTar...
  - `BONE`: `ContextualAnimIKTargetProvider = Ellipsis` — IK Target defined by a bone or a socket in the animation 1

### `unreal.ContextualAnimJoinRule`
Inherits: `EnumBase` | Header: `ContextualAnimTypes.h`

Defines when the actor should start playing the animation

**Properties** (2):
  - `DEFAULT`: `ContextualAnimJoinRule = Ellipsis` — 0
  - `LATE`: `ContextualAnimJoinRule = Ellipsis` — 1

### `unreal.ContextualAnimPointType`
Inherits: `EnumBase` | Header: `ContextualAnimSceneAsset.h`

EContextual Anim Point Type

**Properties** (3):
  - `FIRST_FRAME`: `ContextualAnimPointType = Ellipsis` — 0
  - `LAST_FRAME`: `ContextualAnimPointType = Ellipsis` — 2
  - `SYNC_FRAME`: `ContextualAnimPointType = Ellipsis` — 1

### `unreal.ContextualAnimWarpPointDefinitionMode`
Inherits: `EnumBase` | Header: `ContextualAnimTypes.h`

Different modes for defining warp points

**Properties** (3):
  - `CUSTOM`: `ContextualAnimWarpPointDefinitionMode = Ellipsis` — Warp point will be calculated based on a set of rules.
Commonly used when we want actors to align at...
  - `PRIMARY_ACTOR`: `ContextualAnimWarpPointDefinitionMode = Ellipsis` — Warp point will be at the location/rotation of the primary actor.
Commonly used when interacting wit...
  - `SOCKET`: `ContextualAnimWarpPointDefinitionMode = Ellipsis` — Warp point will be at the location/rotation of a socket on the primary actor.
Commonly used when re-...

### `unreal.ContextualAnimOnMontageBlendingOutDelegate`
Inherits: `MulticastDelegateBase` | Header: `ContextualAnimSceneActorComponent.h`

Contextual Anim on Montage Blending Out Delegate Delegate Signature

### `unreal.ContextualAnimPlayMontageNotifyBeginDelegate`
Inherits: `MulticastDelegateBase` | Header: `ContextualAnimSceneActorComponent.h`

Contextual Anim Play Montage Notify Begin Delegate Delegate Signature

### `unreal.ContextualAnimSceneActorCompDelegate`
Inherits: `MulticastDelegateBase` | Header: `ContextualAnimSceneActorComponent.h`

Contextual Anim Scene Actor Comp Delegate Delegate Signature
