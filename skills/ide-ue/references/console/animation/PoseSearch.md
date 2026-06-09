# UE Python API — PoseSearch Module

**83 types** from the `PoseSearch` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_MotionMatching`, `AnimNode_MotionMatchingInteraction`, `AnimNode_PoseSearchComponentSpaceHistoryCollector`, `AnimNode_PoseSearchHistoryCollector`, `AnimNode_PoseSearchHistoryCollector_Base`, `MotionMatchingAnimNodeReference`, `MotionMatchingBlueprintBlendSettings`, `MotionMatchingInteractionAnimNodeReference`, `PoseHistoryReference`, `PoseSearchAssetSamplerInput`, `PoseSearchAssetSamplerPose`, `PoseSearchBlueprintResult`, `PoseSearchBone`, `PoseSearchContinuingProperties`, `PoseSearchDatabaseAnimationAssetBase`, `PoseSearchDatabaseAnimComposite`, `PoseSearchDatabaseAnimMontage`, `PoseSearchDatabaseBlendSpace`, `PoseSearchDatabaseMultiAnimAsset`, `PoseSearchDatabaseSequence`, ... (83 total)

---

## Classes

### `unreal.AnimNode_MotionMatching`
Inherits: `AnimNode_BlendStack_Standalone` | Header: `AnimNode_MotionMatching.h`

Anim Node Motion Matching

### `unreal.AnimNode_MotionMatchingInteraction`
Inherits: `AnimNode_BlendStack_Standalone` | Header: `AnimNode_MotionMatchingInteraction.h`

Anim Node Motion Matching Interaction

**Properties** (3):
  - `blend_option`: `AlphaBlendOption` — [Read-Write] (AlphaBlendOption)
  - `blend_profile`: `BlendProfile` — [Read-Write] (BlendProfile)
  - `blend_time`: `float` — [Read-Write] tunable animation transition blend time (float)

### `unreal.AnimNode_PoseSearchComponentSpaceHistoryCollector`
Inherits: `AnimNode_PoseSearchHistoryCollector_Base` | Header: `AnimNode_PoseSearchHistoryCollector.h`

Anim Node Pose Search Component Space History Collector

**Properties** (1):
  - `source`: `ComponentSpacePoseLink` — [Read-Write] (ComponentSpacePoseLink)

### `unreal.AnimNode_PoseSearchHistoryCollector`
Inherits: `AnimNode_PoseSearchHistoryCollector_Base` | Header: `AnimNode_PoseSearchHistoryCollector.h`

Anim Node Pose Search History Collector

**Properties** (1):
  - `source`: `PoseLink` — [Read-Write] (PoseLink)

### `unreal.AnimNode_PoseSearchHistoryCollector_Base`
Inherits: `AnimNode_Base` | Header: `AnimNode_PoseSearchHistoryCollector.h`

Anim Node Pose Search History Collector Base

**Properties** (8):
  - `pose_count`: `int` — [Read-Write] The maximum amount of poses that can be stored (int32)
  - `prediction_sampling_interval`: `float` — [Read-Write] if bGenerateTrajectory is true, this is the sampling interval between trajectory future...
  - `root_bone_recovery_time`: `float` — [Read-Write] time in seconds to recover to the reference skeleton root bone transform by RootBoneTra...
  - `root_bone_rotation_recovery_ratio`: `float` — [Read-Write] ratio to recover to the reference skeleton root bone rotation from any eventual root bo...
  - `root_bone_translation_recovery_ratio`: `float` — [Read-Write] ratio to recover to the reference skeleton root bone translation from any eventual root...
  - `sampling_interval`: `float` — [Read-Write] how often in seconds poses are collected (if 0, it will collect every update) (float)
  - `trajectory_history_count`: `int` — [Read-Write] if bGenerateTrajectory is true, this is the number of trajectory past (collected) sampl...
  - `trajectory_prediction_count`: `int` — [Read-Write] if bGenerateTrajectory is true, this is the number of trajectory future (prediction) sa...

### `unreal.MotionMatchingAnimNodeReference`
Inherits: `AnimNodeReference` | Header: `MotionMatchingAnimNodeLibrary.h`

Motion Matching Anim Node Reference

### `unreal.MotionMatchingBlueprintBlendSettings`
Inherits: `StructBase` | Header: `MotionMatchingAnimNodeLibrary.h`

Motion Matching Blueprint Blend Settings

**Properties** (4):
  - `blend_option`: `AlphaBlendOption` — [Read-Write] (AlphaBlendOption)
  - `blend_profile`: `BlendProfile` — [Read-Write] (BlendProfile)
  - `blend_time`: `float` — [Read-Write] (float)
  - `use_inertial_blend`: `bool` — [Read-Write] (bool)

### `unreal.MotionMatchingInteractionAnimNodeReference`
Inherits: `AnimNodeReference` | Header: `MotionMatchingInteractionAnimNodeLibrary.h`

Motion Matching Interaction Anim Node Reference

### `unreal.PoseHistoryReference`
Inherits: `StructBase` | Header: `PoseSearchHistory.h`

namespace UE::PoseSearch

### `unreal.PoseSearchAssetSamplerInput`
Inherits: `StructBase` | Header: `PoseSearchAssetSamplerLibrary.h`

Pose Search Asset Sampler Input

**Properties** (7):
  - `animation`: `AnimationAsset` — [Read-Write] Animation to sample (AnimationAsset)
  - `animation_time`: `float` — [Read-Write] Sampling time for Animation (float)
  - `blend_parameters`: `Vector` — [Read-Write] blend parameters if Animation is a blend space (Vector)
  - `mirror_data_table`: `MirrorDataTable` — [Read-Write] (MirrorDataTable)
  - `mirrored`: `bool` — [Read-Write] (bool)
  - `root_transform_origin`: `Transform` — [Read-Write] origin used to start sampling Animation at time of zero (Transform)
  - `root_transform_sampling_rate`: `int` — [Read-Write] frequency of sampling while sampling the root transform of blend spaces (int32)

### `unreal.PoseSearchAssetSamplerPose`
Inherits: `StructBase` | Header: `PoseSearchAssetSamplerLibrary.h`

Pose Search Asset Sampler Pose

### `unreal.PoseSearchBlueprintResult`
Inherits: `StructBase` | Header: `PoseSearchResult.h`

namespace UE::PoseSearch

**Properties** (14):
  - `actor_root_bone_transforms`: `None` [Read-Only] — [Read-Only] cached actors root bone transforms for all the roles in SelectedAnim (as UMultiAnimAsset...
  - `actor_root_transforms`: `None` [Read-Only] — [Read-Only] cached actors root transforms for all the roles in SelectedAnim (as UMultiAnimAsset). Fo...
  - `blend_parameters`: `Vector` [Read-Only] — [Read-Only] SelectedAnim associated BlendParameters (if SelectedAnim is a UBlendSpace) (Vector)
  - `is_continuing_pose_search`: `bool` [Read-Only] — [Read-Only] SelectedAnim at SelectedTime is from the motion matching continuing pose search (bool)
  - `is_interaction`: `bool` [Read-Only] — [Read-Only] bIsInteraction is true if this is a result from a motion matching interaction search (bo...
  - `is_mirrored`: `bool` [Read-Only] — [Read-Only] SelectedAnim associated mirror state (bool)
  - `loop`: `bool` [Read-Only] — [Read-Only] SelectedAnim associated looping state (bool)
  - `role`: `Name` [Read-Only] — [Read-Only] assigned role to this character. If this result is from a motion matched interaction, ev...
  - `search_cost`: `float` [Read-Only] — [Read-Only] associated motion matching search cost for this result (how bad the SelectedAnim at Sele...
  - `selected_anim`: `Object` [Read-Only] — [Read-Only] selected animation selected by the motion matching alghoritm that matches the query (tra...
  - `selected_animation`: `Object` — [Read-Write] Deprecated in 5.6. Use âSelectedAnimâ property instead
deprecated: Use SelectedAnim...
  - `selected_database`: `PoseSearchDatabase` [Read-Only] — [Read-Only] database containig the SelectedAnim (PoseSearchDatabase)
  - `selected_time`: `float` [Read-Only] — [Read-Only] SelectedAnim associated time (to have the best result out of the motion matchign selecti...
  - `wanted_play_rate`: `float` [Read-Only] — [Read-Only] SelectedAnim suggested play rate (itâs usually calculated by estimating the ratio betw...

### `unreal.PoseSearchBone`
Inherits: `StructBase` | Header: `PoseSearchFeatureChannel_Pose.h`

Pose Search Bone

### `unreal.PoseSearchContinuingProperties`
Inherits: `StructBase` | Header: `PoseSearchLibrary.h`

Pose Search Continuing Properties

**Properties** (6):
  - `interrupt_mode`: `PoseSearchInterruptMode` — [Read-Write] (PoseSearchInterruptMode)
  - `is_continuing_interaction`: `bool` — [Read-Write] (bool)
  - `is_playing_asset_mirrored`: `bool` — [Read-Write] (bool)
  - `playing_asset`: `Object` — [Read-Write] Currently playing animation (Object)
  - `playing_asset_accumulated_time`: `float` — [Read-Write] Currently playing animation accumulated time (float)
  - `playing_asset_blend_parameters`: `Vector` [Read-Only] — [Read-Only] PlayingAsset associated BlendParameters (if PlayingAsset is a UBlendSpace) (Vector)

### `unreal.PoseSearchDatabaseAnimationAssetBase`
Inherits: `StructBase` | Header: `PoseSearchDatabase.h`

Pose Search Database Animation Asset Base

### `unreal.PoseSearchDatabaseAnimComposite`
Inherits: `PoseSearchDatabaseAnimationAssetBase` | Header: `PoseSearchDatabase.h`

An entry in a UPoseSearchDatabase.

### `unreal.PoseSearchDatabaseAnimMontage`
Inherits: `PoseSearchDatabaseAnimationAssetBase` | Header: `PoseSearchDatabase.h`

An anim montage entry in a UPoseSearchDatabase.

### `unreal.PoseSearchDatabaseBlendSpace`
Inherits: `PoseSearchDatabaseAnimationAssetBase` | Header: `PoseSearchDatabase.h`

An blend space entry in a UPoseSearchDatabase.

### `unreal.PoseSearchDatabaseMultiAnimAsset`
Inherits: `PoseSearchDatabaseAnimationAssetBase` | Header: `PoseSearchDatabase.h`

Pose Search Database Multi Anim Asset

### `unreal.PoseSearchDatabaseSequence`
Inherits: `PoseSearchDatabaseAnimationAssetBase` | Header: `PoseSearchDatabase.h`

A sequence entry in a UPoseSearchDatabase.

### `unreal.PoseSearchEvent`
Inherits: `StructBase` | Header: `PoseSearchEvent.h`

Pose Search Event

**Properties** (5):
  - `enable_pose_filters`: `bool` — [Read-Write] if true pose candidates will be filtered by MotionMatching node âPoseJumpThresholdTim...
  - `event_tag`: `GameplayTag` — [Read-Write] Tag identifying this event (GameplayTag)
  - `play_rate_range_override`: `FloatInterval` — [Read-Write]
todo:: support the concept of time to event channel weight, as wey of scoring better po...
  - `time_to_event`: `float` — [Read-Write] Time in seconds until this event occurs (float)
  - `use_play_rate_range_override`: `bool` — [Read-Write]
todo:: add PlayRate / PlayRateRangeOverride concept to UPoseSearchLibrary::MotionMatch ...

### `unreal.PoseSearchFutureProperties`
Inherits: `StructBase` | Header: `PoseSearchLibrary.h`

Pose Search Future Properties

**Properties** (3):
  - `animation`: `Object` — [Read-Write] Animation to play (itâll start at AnimationTime seconds) (Object)
  - `animation_time`: `float` — [Read-Write] Start time for Animation (float)
  - `interval_time`: `float` — [Read-Write] Interval time before playing Animation (float)

### `unreal.PoseSearchHistoryCollectorAnimNodeReference`
Inherits: `AnimNodeReference` | Header: `PoseSearchHistoryCollectorAnimNodeLibrary.h`

Pose Search History Collector Anim Node Reference

### `unreal.PoseSearchIKWindowConstraint`
Inherits: `StructBase` | Header: `PoseSearchAnimNotifies.h`

multi character interaction notifies

### `unreal.PoseSearchInteractionAssetItem`
Inherits: `StructBase` | Header: `PoseSearchInteractionAsset.h`

Pose Search Interaction Asset Item

### `unreal.PoseSearchInteractionAvailability`
Inherits: `StructBase` | Header: `PoseSearchInteractionAvailability.h`

input for MotionMatchInteraction_Pure: it declares that the associated character (âAnimContextâ that could be an AnimInstance or an AnimNextCharacterComponent) is willing to partecipate in an inte...

**Properties** (7):
  - `broad_phase_radius`: `float` — [Read-Write] the associated character to this FPoseSearchInteractionAvailability will partecipate in...
  - `broad_phase_radius_increment_on_interaction`: `float` — [Read-Write] during interaction the BroadPhaseRadius will be incremented by BroadPhaseRadiusIncremen...
  - `database`: `PoseSearchDatabase` — [Read-Write] Database describing the interaction. Itâll contains multi character UMultiAnimAsset a...
  - `disable_collisions`: `bool` — [Read-Write] if true, the system will disable collsions between interacting characters (bool)
  - `roles_filter`: `None` — [Read-Write] roles the character is willing to take to partecipate in this interaction. If empty ANY...
  - `tag`: `Name` — [Read-Write] in case this availability Database is valid (not null), Tag (if IsTagValid()) is used t...
  - `tick_priority`: `int` — [Read-Write] the Actor with the higher TickPriority of any Availability request will be elected as t...

### `unreal.PoseSearchInteractionAvailabilityEx`
Inherits: `PoseSearchInteractionAvailability` | Header: `PoseSearchInteractionAvailability.h`

Experimental, this feature might be removed without warning, not for production use

### `unreal.PoseSearchQueryTrajectory`
Inherits: `StructBase` | Header: `PoseSearchTrajectoryTypes.h`

Pose Search Query Trajectory

**Properties** (1):
  - `samples`: `None` — [Read-Write]
deprecated: Use FTransfromTrajectory instead. See FTransfromTrajectory:Samples. (Array[...

### `unreal.PoseSearchQueryTrajectorySample`
Inherits: `StructBase` | Header: `PoseSearchTrajectoryTypes.h`

Pose Search Query Trajectory Sample

**Properties** (3):
  - `accumulated_seconds`: `float` — [Read-Write]
deprecated: Use FTransfromTrajectorySample instead. See FTransfromTrajectorySample::Acc...
  - `facing`: `Quat` — [Read-Write]
deprecated: Use FTransfromTrajectorySample instead. See FTransfromTrajectorySample::Fac...
  - `position`: `Vector` — [Read-Write]
deprecated: Use FTransfromTrajectorySample instead. See FTransfromTrajectorySample::Pos...

### `unreal.PoseSearchRoledSkeleton`
Inherits: `StructBase` | Header: `PoseSearchSchema.h`

Pose Search Roled Skeleton

### `unreal.PoseSearchTrajectory_WorldCollisionResults`
Inherits: `StructBase` | Header: `PoseSearchTrajectoryLibrary.h`

Pose Search Trajectory World Collision Results

**Properties** (2):
  - `land_speed`: `float` [Read-Only] — [Read-Only] (float)
  - `time_to_land`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.PoseSearchTrajectoryData`
Inherits: `StructBase` | Header: `PoseSearchTrajectoryLibrary.h`

Pose Search Trajectory Data

### `unreal.PoseSearchTrajectorySample`
Inherits: `StructBase` | Header: `PoseSearchFeatureChannel_Trajectory.h`

Pose Search Trajectory Sample

### `unreal.AnimNotify_PoseSearchBase`
Inherits: `AnimNotify` | Header: `PoseSearchAnimNotifies.h`

Base class for ALL pose search anim notifies

### `unreal.AnimNotify_PoseSearchEvent`
Inherits: `AnimNotify_PoseSearchBase` | Header: `PoseSearchAnimNotifies.h`

Anim Notify Pose Search Event

### `unreal.AnimNotifyState_PoseSearchBase`
Inherits: `AnimNotifyState` | Header: `PoseSearchAnimNotifies.h`

Base class for ALL pose search anim notify states

### `unreal.AnimNotifyState_PoseSearchBlockTransition`
Inherits: `AnimNotifyState_PoseSearchBase` | Header: `PoseSearchAnimNotifies.h`

A pose search search will not return results that overlap this notify, but the animation segment can still play if a previous search result advances into it.

### `unreal.AnimNotifyState_PoseSearchBranchIn`
Inherits: `AnimNotifyState_PoseSearchBase` | Header: `PoseSearchAnimNotifies.h`

Anim Notify State Pose Search Branch In

### `unreal.AnimNotifyState_PoseSearchExcludeFromDatabase`
Inherits: `AnimNotifyState_PoseSearchBase` | Header: `PoseSearchAnimNotifies.h`

Use this notify state to remove animation segments from the database completely, they will never play or return from a search result

### `unreal.AnimNotifyState_PoseSearchIKWindow`
Inherits: `AnimNotifyState_PoseSearchBase` | Header: `PoseSearchAnimNotifies.h`

Anim Notify State Pose Search IKWindow

### `unreal.AnimNotifyState_PoseSearchModifyCost`
Inherits: `AnimNotifyState_PoseSearchBase` | Header: `PoseSearchAnimNotifies.h`

Pose search cost will be affected by this, making the animation segment more or less likely to be selected based on the notify parameters

### `unreal.AnimNotifyState_PoseSearchOverrideContinuingPoseCostBias`
Inherits: `AnimNotifyState_PoseSearchBase` | Header: `PoseSearchAnimNotifies.h`

Pose search cost for the continuing pose will be affected by this, making the animation segment more or less likely to be continuing playing based on the notify parameters

### `unreal.AnimNotifyState_PoseSearchSamplingAttribute`
Inherits: `AnimNotifyState_PoseSearchSamplingEvent` | Header: `PoseSearchAnimNotifies.h`

UPoseSearchFeatureChannel(s) can use this UAnimNotifyState_PoseSearchSamplingAttribute as animation space position, rotation, and linear velocity provider during database indexing by specifying their ...

### `unreal.AnimNotifyState_PoseSearchSamplingEvent`
Inherits: `AnimNotifyState_PoseSearchBase` | Header: `PoseSearchAnimNotifies.h`

UPoseSearchFeatureChannel(s) can use this UAnimNotifyState_PoseSearchSamplingEvent to demarcate events identified by SamplingAttributeId during database indexing by specifying their SamplingAttributeI...

### `unreal.MotionMatchingAnimNodeLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MotionMatchingAnimNodeLibrary.h`

Exposes operations that can be run on a Motion Matching node via Anim Node Functions such as âOn Become Relevantâ and âOn Updateâ.

**Methods** (9):
  - `convert_to_motion_matching_node(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a motion matching node context from an anim node context
  - `convert_to_motion_matching_node_pure(result=bool)` [classmethod] — Get a motion matching node context from an anim node context (pure)
  - `get_motion_matching_blend_settings(is_result_valid=bool)` [classmethod] — Get current blend settings used when blending into a new asset
  - `get_motion_matching_search_result(is_result_valid=bool)` [classmethod] — Get Motion Matching Search Result
  - `override_motion_matching_blend_settings(motion_matching_node, blend_settings)` -> `bool` [classmethod] — Override current blend settings for motion matching. Note that any pinned parameters will stomp this override on the nex...
  - `reset_databases_to_search(motion_matching_node, interrupt_mode)` -> `None` [classmethod] — Clear the effects of SetDatabaseToSearch/SetDatabasesToSearch and resume searching the Database property on the motion m...
  - `set_database_to_search(motion_matching_node, database, interrupt_mode)` -> `None` [classmethod] — Set the database to search on the motion matching node. This overrides the Database property on the motion matching node...
  - `set_databases_to_search(motion_matching_node, databases, interrupt_mode)` -> `None` [classmethod] — Set the database to search on the motion matching node. This overrides the Database property on the motion matching node...
  - `set_interrupt_mode(motion_matching_node, interrupt_mode)` -> `None` [classmethod] — Ignore the continuing pose (the current clip thatâs playing) and force a new search.

### `unreal.MotionMatchingInteractionAnimNodeLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MotionMatchingInteractionAnimNodeLibrary.h`

Motion Matching Interaction Anim Node Library

**Methods** (4):
  - `convert_to_motion_matching_interaction_node(result=AnimNodeReferenceConversionResult)` [classmethod] — Convert to Motion Matching Interaction Node
  - `convert_to_motion_matching_interaction_node_pure(result=bool)` [classmethod] — Convert to Motion Matching Interaction Node Pure
  - `is_interacting(motion_matching_interaction_node)` -> `bool` [classmethod] — Is Interacting
  - `set_availabilities(motion_matching_interaction_node, availabilities)` -> `None` [classmethod] — Set Availabilities

### `unreal.MultiAnimAsset`
Inherits: `Object` | Header: `MultiAnimAsset.h`

UObject defining tuples of UAnimationAsset(s) with associated Role(s) and relative transforms from a shared reference system via GetOrigin

**Methods** (2):
  - `bp_get_animation_asset(role)` -> `AnimationAsset` — BP Get Animation Asset
  - `bp_get_origin(role)` -> `Transform` — BP Get Origin

### `unreal.PoseSearchAssetSamplerLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PoseSearchAssetSamplerLibrary.h`

Pose Search Asset Sampler Library

**Methods** (3):
  - `draw(anim_instance, asset_sampler_pose)` -> `PoseSearchAssetSamplerPose` [classmethod] — todo:: itâd be nice if it was threadsafeâ¦
  - `get_transform_by_name(asset_sampler_pose, bone_name, asset_sampler_pose=PoseSearchAssetSamplerPose)` [classmethod] — Get Transform by Name
  - `sample_pose(anim_instance, input)` -> `PoseSearchAssetSamplerPose` [classmethod] — Sample Pose

### `unreal.PoseSearchDatabase`
Inherits: `DataAsset` | Header: `PoseSearchDatabase.h`

A data asset for indexing a collection of animation sequences.

**Methods** (2):
  - `get_animation_asset(index)` -> `Object` — Get Animation Asset
  - `get_num_animation_assets()` -> `int32` — Get Num Animation Assets

**Properties** (3):
  - `normalization_set`: `PoseSearchNormalizationSet` [Read-Only] — [Read-Only] This optional asset defines a list of databases you want to normalize together. Without ...
  - `schema`: `PoseSearchSchema` [Read-Only] — [Read-Only] The Schema sets what channels this database will use to match against (bones, trajectory...
  - `tags`: `None` [Read-Only] — [Read-Only] Array of tags that can be used as metadata. (Array[Name])

### `unreal.PoseSearchEventLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PoseSearchEvent.h`

Pose Search Event Library

**Methods** (1):
  - `update_pose_search_event(new_event, is_new_event_valid, delta_seconds, out_current_event)` -> `PoseSearchEvent` [classmethod] — Update Pose Search Event

### `unreal.PoseSearchFeatureChannel`
Inherits: `Object` | Header: `PoseSearchFeatureChannel.h`

Feature channels interface

### `unreal.PoseSearchFeatureChannel_Curve`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_Curve.h`

Pose Search Feature Channel Curve

**Methods** (1):
  - `bp_get_curve_value(anim_instance)` -> `float` — BP Get Curve Value

**Properties** (1):
  - `curve_name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.PoseSearchFeatureChannel_Distance`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_Distance.h`

Pose Search Feature Channel Distance

**Methods** (1):
  - `bp_get_distance(anim_instance)` -> `float` — BP Get Distance

### `unreal.PoseSearchFeatureChannel_FilterCrashingLegs`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_FilterCrashingLegs.h`

the idea is to calculate the angle between the direction from LeftThigh position to RightThigh position and the direction from LeftFoot position to RightFoot position, and divide it by PI to have valu...

### `unreal.PoseSearchFeatureChannel_Group`
Inherits: `PoseSearchFeatureChannel_GroupBase` | Header: `PoseSearchFeatureChannel_Group.h`

Pose Search Feature Channel Group

**Properties** (1):
  - `sub_channels`: `None` — [Read-Write] (Array[PoseSearchFeatureChannel])

### `unreal.PoseSearchFeatureChannel_GroupBase`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_Group.h`

Feature channels interface

### `unreal.PoseSearchFeatureChannel_Heading`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_Heading.h`

Pose Search Feature Channel Heading

**Methods** (1):
  - `bp_get_world_rotation(anim_instance)` -> `Quat` — BP Get World Rotation

### `unreal.PoseSearchFeatureChannel_Padding`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_Padding.h`

Pose Search Feature Channel Padding

### `unreal.PoseSearchFeatureChannel_PermutationTime`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_PermutationTime.h`

Pose Search Feature Channel Permutation Time

### `unreal.PoseSearchFeatureChannel_Phase`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_Phase.h`

Pose Search Feature Channel Phase

### `unreal.PoseSearchFeatureChannel_Pose`
Inherits: `PoseSearchFeatureChannel_GroupBase` | Header: `PoseSearchFeatureChannel_Pose.h`

UPoseSearchFeatureChannel_Pose

### `unreal.PoseSearchFeatureChannel_Position`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_Position.h`

Pose Search Feature Channel Position

**Methods** (1):
  - `bp_get_world_position(anim_instance)` -> `Vector` — BP Get World Position

### `unreal.PoseSearchFeatureChannel_SamplingTime`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_SamplingTime.h`

this channel is mainly for debug purposes to augment the features data with the sampling time (default weight is set to zero to be irrelevant during searches)

### `unreal.PoseSearchFeatureChannel_TimeToEvent`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_TimeToEvent.h`

Pose Search Feature Channel Time to Event

**Methods** (1):
  - `bp_get_time_to_event(anim_instance)` -> `float` — BP Get Time to Event

### `unreal.PoseSearchFeatureChannel_Trajectory`
Inherits: `PoseSearchFeatureChannel_GroupBase` | Header: `PoseSearchFeatureChannel_Trajectory.h`

Pose Search Feature Channel Trajectory

### `unreal.PoseSearchFeatureChannel_Velocity`
Inherits: `PoseSearchFeatureChannel` | Header: `PoseSearchFeatureChannel_Velocity.h`

Pose Search Feature Channel Velocity

**Methods** (1):
  - `bp_get_world_velocity(anim_instance)` -> `Vector` — BP Get World Velocity

### `unreal.PoseSearchHistoryCollectorAnimNodeLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PoseSearchHistoryCollectorAnimNodeLibrary.h`

Exposes operations that can be run on a Pose History node via Anim Node Functions such as âOn Become Relevantâ and âOn Updateâ.

**Methods** (6):
  - `convert_to_pose_history_node(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a Pose History node context from an anim node context
  - `convert_to_pose_history_node_pure(result=bool)` [classmethod] — Get a Pose History node context from an anim node context (pure)
  - `get_pose_history_node_trajectory(pose_search_history_collector_node: PoseSearchHistoryCollectorAnimNodeReference)` -> `TransformTrajectory` [classmethod] — deprecated: âget_pose_history_node_trajectoryâ was renamed to âget_pose_history_node_transform_trajectoryâ.
  - `get_pose_history_node_transform_trajectory(pose_search_history_collector_node)` -> `TransformTrajectory` [classmethod] — Get Pose History Node Transform Trajectory
  - `set_pose_history_node_trajectory(pose_search_history_collector_node: PoseSearchHistoryCollectorAnimNodeReference, trajectory: TransformTrajectory)` -> `None` [classmethod] — deprecated: âset_pose_history_node_trajectoryâ was renamed to âset_pose_history_node_transform_trajectoryâ.
  - `set_pose_history_node_transform_trajectory(pose_search_history_collector_node, trajectory)` -> `None` [classmethod] — Set Pose History Node Transform Trajectory

### `unreal.PoseSearchInteractionAsset`
Inherits: `MultiAnimAsset` | Header: `PoseSearchInteractionAsset.h`

Pose Search Interaction Asset

### `unreal.PoseSearchInteractionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PoseSearchInteractionLibrary.h`

Experimental, this feature might be removed without warning, not for production use

**Methods** (3):
  - `get_montage_continuing_properties(anim_instance)` -> `PoseSearchContinuingProperties` [classmethod] — Get Montage Continuing Properties
  - `motion_match_interaction(availabilities, anim_context, pose_history_name, validate_result_against_availabilities = True)` -> `PoseSearchBlueprintResult` [classmethod] — BlueprintCallable version of MotionMatchInteraction_Pure
  - `motion_match_interaction_pure(availabilities, anim_context, pose_history_name, validate_result_against_availabilities = True)` -> `PoseSearchBlueprintResult` [classmethod] — function publishing this character (via its AnimInstance) FPoseSearchInteractionAvailability to the UPoseSearchInteracti...

### `unreal.PoseSearchLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PoseSearchLibrary.h`

Pose Search Library

**Methods** (3):
  - `get_database_tags(database)` -> `Array [ Name ]` [classmethod] — Get Database Tags
  - `is_animation_asset_looping(asset)` -> `bool` [classmethod] — Is Animation Asset Looping
  - `motion_match(anim_instance, assets_to_search, pose_history_name, continuing_properties, future)` -> `PoseSearchBlueprintResult` [classmethod] — Implementation of the core motion matching algorithm

### `unreal.PoseSearchNormalizationSet`
Inherits: `DataAsset` | Header: `PoseSearchNormalizationSet.h`

Data asset used to allow multiple Pose Search Databases to be normalized together.

**Properties** (1):
  - `databases`: `None` [Read-Only] — [Read-Only] (Array[PoseSearchDatabase])

### `unreal.PoseSearchSchema`
Inherits: `DataAsset` | Header: `PoseSearchSchema.h`

Specifies the format of a pose search index. At runtime, queries are built according to the schema for searching.

### `unreal.PoseSearchTrajectoryLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PoseSearchTrajectoryLibrary.h`

Set of functions to help populate a FPoseSearchQueryTrajectory for motion matching.

**Methods** (20):
  - `draw_trajectory(world_context_object: Object, trajectory: TransformTrajectory, debug_thickness: float, height_offset: float)` -> `None` [classmethod] — deprecated: âdraw_trajectoryâ was renamed to âdraw_transform_trajectoryâ.
  - `draw_transform_trajectory(world_context_object, trajectory, debug_thickness, height_offset)` -> `None` [classmethod] — Draw Transform Trajectory
  - `get_trajectory_angular_velocity(trajectory: TransformTrajectory, time1: float, time2: float, extrapolate: bool = False)` -> `Vector` [classmethod] — deprecated: âget_trajectory_angular_velocityâ was renamed to âget_transform_trajectory_angular_velocityâ.
  - `get_trajectory_sample_at_time(trajectory: TransformTrajectory, time: float, extrapolate: bool = False)` -> `TransformTrajectorySample` [classmethod] — deprecated: âget_trajectory_sample_at_timeâ was renamed to âget_transform_trajectory_sample_at_timeâ.
  - `get_trajectory_velocity(trajectory: TransformTrajectory, time1: float, time2: float, extrapolate: bool = False)` -> `Vector` [classmethod] — deprecated: âget_trajectory_velocityâ was renamed to âget_transform_trajectory_velocityâ.
  - `get_transform(trajectory_sample: TransformTrajectorySample)` -> `Transform` [classmethod] — deprecated: âget_transformâ was renamed to âget_transform_trajectory_sample_transformâ.
  - `get_transform_trajectory_angular_velocity(trajectory, time1, time2, extrapolate = False)` -> `Vector` [classmethod] — Get Transform Trajectory Angular Velocity
  - `get_transform_trajectory_sample_at_time(trajectory, time, extrapolate = False)` -> `TransformTrajectorySample` [classmethod] — Get Transform Trajectory Sample at Time
  - `get_transform_trajectory_sample_transform(trajectory_sample)` -> `Transform` [classmethod] — Get Transform Trajectory Sample Transform
  - `get_transform_trajectory_velocity(trajectory, time1, time2, extrapolate = False)` -> `Vector` [classmethod] — Get Transform Trajectory Velocity
  - `handle_trajectory_world_collisions(world_context_object: Object, anim_instance: AnimInstance, trajectory: TransformTrajectory, apply_gravity: bool, floor_collisions_offset: float, trace_channel: TraceTypeQuery, trace_complex: bool, actors_to_ignore: None, draw_debug_type: DrawDebugTrace, ignore_self: bool = True, max_obstacle_height: float = 10000.0, trace_color: LinearColor = Ellipsis, trace_hit_color: LinearColor = Ellipsis, draw_time: float = 5.0)` -> `Tuple [ TransformTrajectory , PoseSearchTrajectory_WorldCollisionResults ]` [classmethod] — deprecated: âhandle_trajectory_world_collisionsâ was renamed to âhandle_transform_trajectory_world_collisionsâ.
  - `handle_trajectory_world_collisions_with_gravity(world_context_object: Object, trajectory: TransformTrajectory, starting_velocity: Vector, apply_gravity: bool, gravity_accel: Vector, floor_collisions_offset: float, trace_channel: TraceTypeQuery, trace_complex: bool, actors_to_ignore: None, draw_debug_type: DrawDebugTrace, ignore_self: bool = True, max_obstacle_height: float = 10000.0, trace_color: LinearColor = Ellipsis, trace_hit_color: LinearColor = Ellipsis, draw_time: float = 5.0)` -> `Tuple [ TransformTrajectory , PoseSearchTrajectory_WorldCollisionResults ]` [classmethod] — deprecated: âhandle_trajectory_world_collisions_with_gravityâ was renamed to âhandle_transform_trajectory_world_co...
  - `handle_transform_trajectory_world_collisions()` [classmethod] — Handle Transform Trajectory World Collisions
  - `handle_transform_trajectory_world_collisions_with_gravity()` [classmethod] — Handle Transform Trajectory World Collisions with Gravity
  - `pose_search_generate_predictor_trajectory(predictor: Object, trajectory_data: PoseSearchTrajectoryData, delta_time: float, out_trajectory: TransformTrajectory, out_desired_controller_yaw_last_update: float, history_sampling_interval: float = 0.04, trajectory_history_count: int = 10, prediction_sampling_interval: float = 0.2, trajectory_prediction_count: int = 8)` -> `Tuple [ TransformTrajectory , float , TransformTrajectory ]` [classmethod] — deprecated: âpose_search_generate_predictor_trajectoryâ was renamed to âpose_search_generate_predictor_transform_t...
  - `pose_search_generate_predictor_transform_trajectory(predictor, trajectory_data, delta_time, out_trajectory, out_desired_controller_yaw_last_update, history_sampling_interval=0.040000, trajectory_history_count=10, prediction_sampling_interval=0.200000, out_desired_controller_yaw_last_update=float, out_trajectory=TransformTrajectory)` [classmethod] — Generates a prediction trajectory based of the current movement intent. For use with predictors. InPredictor must implem...
  - `pose_search_generate_trajectory(anim_instance: Object, trajectory_data: PoseSearchTrajectoryData, delta_time: float, out_trajectory: TransformTrajectory, out_desired_controller_yaw_last_update: float, history_sampling_interval: float = 0.04, trajectory_history_count: int = 10, prediction_sampling_interval: float = 0.2, trajectory_prediction_count: int = 8)` -> `Tuple [ TransformTrajectory , float , TransformTrajectory ]` [classmethod] — deprecated: âpose_search_generate_trajectoryâ was renamed to âpose_search_generate_transform_trajectoryâ.
  - `pose_search_generate_trajectory_with_predictor(predictor: PoseSearchTrajectoryPredictorInterface, delta_time: float, out_trajectory: TransformTrajectory, out_desired_controller_yaw_last_update: float, history_sampling_interval: float = 0.04, trajectory_history_count: int = 10, prediction_sampling_interval: float = 0.2, trajectory_prediction_count: int = 8)` -> `Tuple [ TransformTrajectory , float , TransformTrajectory ]` [classmethod] — deprecated: âpose_search_generate_trajectory_with_predictorâ was renamed to âpose_search_generate_transform_trajec...
  - `pose_search_generate_transform_trajectory(anim_instance, trajectory_data, delta_time, out_trajectory, out_desired_controller_yaw_last_update, history_sampling_interval=0.040000, trajectory_history_count=10, prediction_sampling_interval=0.200000, out_desired_controller_yaw_last_update=float, out_trajectory=TransformTrajectory)` [classmethod] — Generates a prediction trajectory based of the current character intent. For use with Character actors.
  - `pose_search_generate_transform_trajectory_with_predictor(predictor, delta_time, out_trajectory, out_desired_controller_yaw_last_update, history_sampling_interval=0.040000, trajectory_history_count=10, prediction_sampling_interval=0.200000, out_desired_controller_yaw_last_update=float, out_trajectory=TransformTrajectory)` [classmethod] — Generates a prediction trajectory based of the current movement intent. For use with predictors. InPredictor must implem...

### `unreal.PoseSearchTrajectoryPredictorInterface`
Inherits: `Interface` | Header: `PoseSearchTrajectoryPredictor.h`

Pose Search Trajectory Predictor Interface

**Methods** (4):
  - `get_current_state(out_facing=Quat, out_velocity=Vector)` — Get Current State
  - `get_gravity()` -> `Vector` — Get Gravity
  - `get_velocity()` -> `Vector` — Get Velocity
  - `predict(num_prediction_samples, seconds_per_prediction_sample, num_history_samples)` -> `TransformTrajectory` — Predict

### `unreal.ComponentStrippingVector`
Inherits: `EnumBase` | Header: `PoseSearchFeatureChannel.h`

EComponent Stripping Vector

**Properties** (3):
  - `NONE`: `ComponentStrippingVector = Ellipsis` — No component stripping. 0
  - `STRIP_XY`: `ComponentStrippingVector = Ellipsis` — Stripping X and Y components (matching only on the horizontal plane). 1
  - `STRIP_Z`: `ComponentStrippingVector = Ellipsis` — Stripping Z (matching only vertically - caring only about the height of the feature). 2

### `unreal.HeadingAxis`
Inherits: `EnumBase` | Header: `PoseSearchFeatureChannel_Heading.h`

EHeading Axis

**Properties** (3):
  - `X`: `HeadingAxis = Ellipsis` — 0
  - `Y`: `HeadingAxis = Ellipsis` — 1
  - `Z`: `HeadingAxis = Ellipsis` — 2

### `unreal.InputQueryPose`
Inherits: `EnumBase` | Header: `PoseSearchFeatureChannel.h`

EInput Query Pose

**Properties** (2):
  - `USE_CHARACTER_POSE`: `InputQueryPose = Ellipsis` — Use character pose to compose the query. 0
  - `USE_CONTINUING_POSE`: `InputQueryPose = Ellipsis` — If available reuse continuing pose from the database to compose the query, or else UseCharacterPose....

### `unreal.PermutationTimeType`
Inherits: `EnumBase` | Header: `PoseSearchFeatureChannel.h`

this enumeration controls the channel sampling time: for example if a channel specifies a bone and an origin bone (used to generate the reference system of the features associated to the bone), bone a...

**Properties** (3):
  - `USE_PERMUTATION_TIME`: `PermutationTimeType = Ellipsis` — Bone and origin bone are sampled at the same permutation time (plus eventual SampleTimeOffset for th...
  - `USE_SAMPLE_TIME`: `PermutationTimeType = Ellipsis` — Bone and origin bone are sampled at the same sample time (plus eventual SampleTimeOffset for the bon...
  - `USE_SAMPLE_TO_PERMUTATION_TIME`: `PermutationTimeType = Ellipsis` — Bone is evaluated at sample time (and plus eventual SampleTimeOffset) and origin bone is evaluated a...

### `unreal.PoseSearchAssetSamplerSpace`
Inherits: `EnumBase` | Header: `PoseSearchAssetSamplerLibrary.h`

EPose Search Asset Sampler Space

**Properties** (3):
  - `COMPONENT`: `PoseSearchAssetSamplerSpace = Ellipsis` — 1
  - `LOCAL`: `PoseSearchAssetSamplerSpace = Ellipsis` — 0
  - `WORLD`: `PoseSearchAssetSamplerSpace = Ellipsis` — 2

### `unreal.PoseSearchDataPreprocessor`
Inherits: `EnumBase` | Header: `PoseSearchSchema.h`

EPose Search Data Preprocessor

**Properties** (4):
  - `NONE`: `PoseSearchDataPreprocessor = Ellipsis` — The data will be left untouched. 0
  - `NORMALIZE`: `PoseSearchDataPreprocessor = Ellipsis` — The data will be normalized against its deviation, and the user weights will be normalized to be a u...
  - `NORMALIZE_ONLY_BY_DEVIATION`: `PoseSearchDataPreprocessor = Ellipsis` — The data will be normalized against its deviation
Experimental, this feature might be removed withou...
  - `NORMALIZE_WITH_COMMON_SCHEMA`: `PoseSearchDataPreprocessor = Ellipsis` — same behavior as Normalize, but itâll index all the databases in the normalization set with the sa...

### `unreal.PoseSearchInterruptMode`
Inherits: `EnumBase` | Header: `PoseSearchLibrary.h`

EPose Search Interrupt Mode

**Properties** (5):
  - `DO_NOT_INTERRUPT`: `PoseSearchInterruptMode = Ellipsis` — continuing pose search will be performed if valid 0
  - `FORCE_INTERRUPT`: `PoseSearchInterruptMode = Ellipsis` — continuing pose search will always be interrupted 3
  - `FORCE_INTERRUPT_AND_INVALIDATE_CONTINUING_POSE`: `PoseSearchInterruptMode = Ellipsis` — continuing pose search will always be interrupted
and continuing pose will be invalidated (forcing t...
  - `INTERRUPT_ON_DATABASE_CHANGE`: `PoseSearchInterruptMode = Ellipsis` — continuing pose search will be interrupted if its database is not listed in the searchable databases...
  - `INTERRUPT_ON_DATABASE_CHANGE_AND_INVALIDATE_CONTINUING_POSE`: `PoseSearchInterruptMode = Ellipsis` — continuing pose search will be interrupted if its database is not listed in the searchable databases...

### `unreal.PoseSearchMirrorOption`
Inherits: `EnumBase` | Header: `PoseSearchDatabase.h`

EPose Search Mirror Option

**Properties** (3):
  - `MIRRORED_ONLY`: `PoseSearchMirrorOption = Ellipsis` — 1
  - `UNMIRRORED_AND_MIRRORED`: `PoseSearchMirrorOption = Ellipsis` — 2
  - `UNMIRRORED_ONLY`: `PoseSearchMirrorOption = Ellipsis` — 0

### `unreal.PoseSearchMode`
Inherits: `EnumBase` | Header: `PoseSearchDatabase.h`

namespace UE::PoseSearch

**Properties** (4):
  - `BRUTE_FORCE`: `PoseSearchMode = Ellipsis` — Database searches will be evaluated extensively. the system will evaluate all the indexed poses to s...
  - `EVENT_ONLY`: `PoseSearchMode = Ellipsis` — Experimental, this feature might be removed without warning, not for production use
search will only...
  - `PCAKD_TREE`: `PoseSearchMode = Ellipsis` — the database projects the poses into a PCA space using only the most significant âNumberOfPrincipa...
  - `VP_TREE`: `PoseSearchMode = Ellipsis` — Experimental, this feature might be removed without warning, not for production use
Optimized search...
