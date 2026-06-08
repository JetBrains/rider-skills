# UE Python API — AnimGraphRuntime Module

**148 types** from the `AnimGraphRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AngularRangeLimit`, `AnimationStateMachineReference`, `AnimationStateResultReference`, `AnimLegIKDefinition`, `AnimNode_AimOffsetLookAt`, `AnimNode_AnimDynamics`, `AnimNode_ApplyAdditive`, `AnimNode_ApplyLimits`, `AnimNode_BlendBoneByChannel`, `AnimNode_BlendListBase`, `AnimNode_BlendListByBool`, `AnimNode_BlendListByEnum`, `AnimNode_BlendListByInt`, `AnimNode_BlendSpaceEvaluator`, `AnimNode_BlendSpaceGraph`, `AnimNode_BlendSpaceGraphBase`, `AnimNode_BlendSpacePlayer`, `AnimNode_BlendSpacePlayer_Standalone`, `AnimNode_BlendSpacePlayerBase`, `AnimNode_BlendSpaceSampleResult`, ... (148 total)

---

## Classes

### `unreal.AngularRangeLimit`
Inherits: `StructBase` | Header: `AnimNode_ApplyLimits.h`

Angular Range Limit

### `unreal.AnimationStateMachineReference`
Inherits: `AnimNodeReference` | Header: `AnimationStateMachineLibrary.h`

Animation State Machine Reference

### `unreal.AnimationStateResultReference`
Inherits: `AnimNodeReference` | Header: `AnimationStateMachineLibrary.h`

Animation State Result Reference

### `unreal.AnimLegIKDefinition`
Inherits: `StructBase` | Header: `AnimNode_LegIK.h`

Per foot definitions

### `unreal.AnimNode_AimOffsetLookAt`
Inherits: `AnimNode_BlendSpacePlayer` | Header: `AnimNode_AimOffsetLookAt.h`

This node uses a source transform of a socket on the skeletal mesh to automatically calculate Yaw and Pitch directions for a referenced aim offset given a point in the world to look at.

**Properties** (7):
  - `alpha`: `float` — [Read-Write] Amount of this node to blend into the output pose (float)
  - `base_pose`: `PoseLink` — [Read-Write] (PoseLink)
  - `lod_threshold`: `int` — [Read-Write] * Max LOD that this node is allowed to run
* For example if you have LODThreshold to be...
  - `look_at_location`: `Vector` — [Read-Write] Location, in world space to look at (Vector)
  - `pivot_socket_name`: `Name` — [Read-Write] Socket or bone to treat as the look at pivot (optional). This will overwrite the transl...
  - `socket_axis`: `Vector` — [Read-Write] Direction in the socket transform to consider the âforwardâ or look at axis (Vector...
  - `source_socket_name`: `Name` — [Read-Write] Socket or bone to treat as the look at source. This will then be pointed at LookAtLocat...

### `unreal.AnimNode_AnimDynamics`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_AnimDynamics.h`

Anim Node Anim Dynamics

**Properties** (9):
  - `angular_bias_override`: `float` — [Read-Write] Overridden angular bias value
Angular bias is essentially a twist reduction for chain f...
  - `angular_damping_override`: `float` — [Read-Write] Overridden angular damping value. The default is 0.7. Values below 0.7 wonât have an ...
  - `angular_spring_constant`: `float` — [Read-Write] Spring constant to use when calculating angular springs, higher values mean a stronger ...
  - `gravity_override`: `Vector` — [Read-Write] Gravity Override Value (Vector)
  - `gravity_scale`: `float` — [Read-Write] Scale for gravity, higher values increase forces due to gravity (float)
  - `linear_damping_override`: `float` — [Read-Write] Overridden linear damping value. The default is 0.7. Values below 0.7 wonât have an e...
  - `linear_spring_constant`: `float` — [Read-Write] Spring constant to use when calculating linear springs, higher values mean a stronger s...
  - `simulation_space`: `AnimPhysSimSpaceType` — [Read-Write] The space used to run the simulation (AnimPhysSimSpaceType)
  - `use_gravity_override`: `bool` — [Read-Write] Use gravity override value vs gravity scale (bool)

### `unreal.AnimNode_ApplyAdditive`
Inherits: `AnimNode_Base` | Header: `AnimNode_ApplyAdditive.h`

Anim Node Apply Additive

**Properties** (10):
  - `additive`: `PoseLink` — [Read-Write] (PoseLink)
  - `alpha`: `float` — [Read-Write] (float)
  - `alpha_bool_blend`: `InputAlphaBoolBlend` — [Read-Write] (InputAlphaBoolBlend)
  - `alpha_bool_enabled`: `bool` — [Read-Write] (bool)
  - `alpha_curve_name`: `Name` — [Read-Write] (Name)
  - `alpha_input_type`: `AnimAlphaInputType` — [Read-Write] (AnimAlphaInputType)
  - `alpha_scale_bias`: `InputScaleBias` — [Read-Write] (InputScaleBias)
  - `alpha_scale_bias_clamp`: `InputScaleBiasClamp` — [Read-Write] (InputScaleBiasClamp)
  - `base`: `PoseLink` — [Read-Write] (PoseLink)
  - `lod_threshold`: `int` — [Read-Write] * Max LOD that this node is allowed to run
* For example if you have LODThreshold to be...

### `unreal.AnimNode_ApplyLimits`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_ApplyLimits.h`

Anim Node Apply Limits

**Properties** (1):
  - `angular_offsets`: `None` — [Read-Write] (Array[Vector])

### `unreal.AnimNode_BlendBoneByChannel`
Inherits: `AnimNode_Base` | Header: `AnimNode_BlendBoneByChannel.h`

Anim Node Blend Bone by Channel

**Properties** (4):
  - `a`: `PoseLink` — [Read-Write] (PoseLink)
  - `alpha`: `float` — [Read-Write] (float)
  - `alpha_scale_bias`: `InputScaleBias` — [Read-Write] (InputScaleBias)
  - `b`: `PoseLink` — [Read-Write] (PoseLink)

### `unreal.AnimNode_BlendListBase`
Inherits: `AnimNode_Base` | Header: `AnimNode_BlendListBase.h`

Blend list node; has many children

**Properties** (1):
  - `reset_child_on_activation`: `bool` — [Read-Write]
deprecated: Use the ChildUpateMode instead (bool)

### `unreal.AnimNode_BlendListByBool`
Inherits: `AnimNode_BlendListBase` | Header: `AnimNode_BlendListByBool.h`

This node is effectively a âbranchâ, picking one of two input poses based on an input Boolean value

### `unreal.AnimNode_BlendListByEnum`
Inherits: `AnimNode_BlendListBase` | Header: `AnimNode_BlendListByEnum.h`

Blend List by Enum, it changes based on enum input that enters

### `unreal.AnimNode_BlendListByInt`
Inherits: `AnimNode_BlendListBase` | Header: `AnimNode_BlendListByInt.h`

Blend list node; has many children

### `unreal.AnimNode_BlendSpaceEvaluator`
Inherits: `AnimNode_BlendSpacePlayer` | Header: `AnimNode_BlendSpaceEvaluator.h`

Evaluates a BlendSpace at a specific using a specific time input rather than advancing time internally. Typically the playback position of the animation for this node will represent something other th...

**Properties** (1):
  - `normalized_time`: `float` — [Read-Write] Normalized time between [0,1]. The actual length of a blendspace is dynamic based on th...

### `unreal.AnimNode_BlendSpaceGraph`
Inherits: `AnimNode_BlendSpaceGraphBase` | Header: `AnimNode_BlendSpaceGraph.h`

Allows multiple animations to be blended between based on input parameters

### `unreal.AnimNode_BlendSpaceGraphBase`
Inherits: `AnimNode_Base` | Header: `AnimNode_BlendSpaceGraphBase.h`

Allows multiple animations to be blended between based on input parameters

**Properties** (4):
  - `group_name`: `Name` — [Read-Write] The group name that we synchronize with (NAME_None if it is not part of any group). Not...
  - `group_role`: `AnimGroupRole` — [Read-Write] The role this Blend Space can assume within the group (ignored if GroupName is not set)...
  - `x`: `float` — [Read-Write] The X coordinate to sample in the blendspace (float)
  - `y`: `float` — [Read-Write] The Y coordinate to sample in the blendspace (float)

### `unreal.AnimNode_BlendSpacePlayer`
Inherits: `AnimNode_BlendSpacePlayerBase` | Header: `AnimNode_BlendSpacePlayer.h`

TODO:: Comment

### `unreal.AnimNode_BlendSpacePlayer_Standalone`
Inherits: `AnimNode_BlendSpacePlayerBase` | Header: `AnimNode_BlendSpacePlayer.h`

TODO:: Comment

### `unreal.AnimNode_BlendSpacePlayerBase`
Inherits: `AnimNode_AssetPlayerBase` | Header: `AnimNode_BlendSpacePlayer.h`

TODO:: Comment

### `unreal.AnimNode_BlendSpaceSampleResult`
Inherits: `AnimNode_Root` | Header: `AnimNode_BlendSpaceSampleResult.h`

Root node of a blend space sample (sink node). We dont use AnimNode_Root to let us distinguish these nodes in the property list at link time.

### `unreal.AnimNode_BoneDrivenController`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_BoneDrivenController.h`

This is the runtime version of a bone driven controller, which maps part of the state from one bone to another (e.g., 2 * source.x -> target.z)

### `unreal.AnimNode_CallFunction`
Inherits: `AnimNode_Base` | Header: `AnimNode_CallFunction.h`

Calls specified user-defined events/functions during anim graph execution

### `unreal.AnimNode_CCDIK`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_CCDIK.h`

Controller which implements the CCDIK IK approximation algorithm

### `unreal.AnimNode_Constraint`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_Constraint.h`

Constraint node to parent or world transform for rotation/translation

### `unreal.AnimNode_CopyBone`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_CopyBone.h`

Simple controller to copy a boneâs transform to another one.

**Properties** (3):
  - `copy_rotation`: `bool` — [Read-Write] If Rotation should be copied (bool)
  - `copy_scale`: `bool` — [Read-Write] If Scale should be copied (bool)
  - `copy_translation`: `bool` — [Read-Write] If Translation should be copied (bool)

### `unreal.AnimNode_CopyBoneDelta`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_CopyBoneDelta.h`

Simple controller to copy a transform relative to the ref pose to the target bone, instead of the copy bone node which copies the absolute transform

**Properties** (6):
  - `copy_rotation`: `bool` — [Read-Write] (bool)
  - `copy_scale`: `bool` — [Read-Write] (bool)
  - `copy_translation`: `bool` — [Read-Write] (bool)
  - `rotation_multiplier`: `float` — [Read-Write] (float)
  - `scale_multiplier`: `float` — [Read-Write] (float)
  - `translation_multiplier`: `float` — [Read-Write] (float)

### `unreal.AnimNode_CopyPoseFromMesh`
Inherits: `AnimNode_Base` | Header: `AnimNode_CopyPoseFromMesh.h`

Simple controller to copy a boneâs transform to another one.

**Properties** (6):
  - `copy_curves`: `bool` — [Read-Write] Copy curves also from SouceMeshComponent. This will copy the curves if this instance al...
  - `copy_custom_attributes`: `bool` — [Read-Write] Copy custom attributes (animation attributes) from SourceMeshComponent (bool)
  - `root_bone_to_copy`: `Name` — [Read-Write] If you want to specify copy root, use this - this will ensure copy only below of this j...
  - `source_mesh_component`: `SkeletalMeshComponent` — [Read-Write] This is used by default if itâs valid (SkeletalMeshComponent)
  - `use_attached_parent`: `bool` — [Read-Write] If SourceMeshComponent is not valid, and if this is true, it will look for attahced par...
  - `use_mesh_pose`: `bool` — [Read-Write] Use root space transform to copy to the target pose. By default, it copies their relati...

### `unreal.AnimNode_CurveSource`
Inherits: `AnimNode_Base` | Header: `AnimNode_CurveSource.h`

Supply curves from some external source (e.g. audio)

**Properties** (3):
  - `alpha`: `float` — [Read-Write] How much we wan to blend the curve in by (float)
  - `source_binding`: `Name` — [Read-Write] The binding of the curve source we want to bind to.
We will bind to an object that impl...
  - `source_pose`: `PoseLink` — [Read-Write] (PoseLink)

### `unreal.AnimNode_Fabrik`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_Fabrik.h`

Controller which implements the FABRIK IK approximation algorithm - see http://www.academia.edu/9165835/FABRIK_A_fast_iterative_solver_for_the_Inverse_Kinematics_problem for details

**Properties** (1):
  - `effector_transform`: `Transform` — [Read-Write] Coordinates for target location of tip bone - if EffectorLocationSpace is bone, this is...

### `unreal.AnimNode_HandIKRetargeting`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_HandIKRetargeting.h`

Node to handle re-targeting of Hand IK bone chain. It looks at position in Mesh Space of Left and Right FK bones, and moves Left and Right IK bones to those. based on HandFKWeight. (0 = favor left han...

**Properties** (2):
  - `hand_fk_weight`: `float` — [Read-Write] Which hand to favor. 0.5 is equal weight for both, 1 = right hand, 0 = left hand. (floa...
  - `per_axis_alpha`: `Vector` — [Read-Write] Alpha values per axis to apply on the resulting retargeting translation (Vector)

### `unreal.AnimNode_LayeredBoneBlend`
Inherits: `AnimNode_Base` | Header: `AnimNode_LayeredBoneBlend.h`

Layered blend (per bone); has dynamic number of blendposes that can blend per different bone sets

**Properties** (8):
  - `base_pose`: `PoseLink` — [Read-Write] The source pose (PoseLink)
  - `blend_poses`: `None` — [Read-Write] Each layerâs blended pose (Array[PoseLink])
  - `blend_weights`: `None` — [Read-Write] The weights of each layer (Array[float])
  - `curve_blend_option`: `CurveBlendOption` — [Read-Write] How to blend the layers together (CurveBlendOption)
  - `lod_threshold`: `int` — [Read-Write] * Max LOD that this node is allowed to run
* For example if you have LODThreshold to be...
  - `mesh_space_rotation_blend`: `bool` — [Read-Write] Whether to blend bone rotations in mesh space or in local space (bool)
  - `mesh_space_scale_blend`: `bool` — [Read-Write] Whether to blend bone scales in mesh space or in local space (bool)
  - `root_space_rotation_blend`: `bool` — [Read-Write] Whether to blend bone rotations in root space or in mesh space (bool)

### `unreal.AnimNode_LegIK`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_LegIK.h`

Anim Node Leg IK

### `unreal.AnimNode_LookAt`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_LookAt.h`

Simple controller that make a bone to look at the point or another bone

**Properties** (5):
  - `interpolation_time`: `float` — [Read-Write] (float)
  - `interpolation_trigger_threashold`: `float` — [Read-Write] (float)
  - `interpolation_type`: `InterpolationBlend` — [Read-Write] (InterpolationBlend)
  - `look_at_clamp`: `float` — [Read-Write] Look at Clamp value in degrees - if your look at axis is Z, only X, Y degree of clamp w...
  - `look_at_location`: `Vector` — [Read-Write] Target Offset. Itâs in world space if LookAtBone is empty or it is based on LookAtBon...

### `unreal.AnimNode_MakeDynamicAdditive`
Inherits: `AnimNode_Base` | Header: `AnimNode_MakeDynamicAdditive.h`

Anim Node Make Dynamic Additive

**Properties** (3):
  - `additive`: `PoseLink` — [Read-Write] Pose to make additive (PoseLink)
  - `base`: `PoseLink` — [Read-Write] Reference pose for additive delta calculation (PoseLink)
  - `mesh_space_additive`: `bool` — [Read-Write] Do additive delta calculation in mesh space (bool)

### `unreal.AnimNode_MeshSpaceRefPose`
Inherits: `AnimNode_Base` | Header: `AnimNode_RefPose.h`

Anim Node Mesh Space Ref Pose

### `unreal.AnimNode_Mirror`
Inherits: `AnimNode_MirrorBase` | Header: `AnimNode_Mirror.h`

Anim Node Mirror

### `unreal.AnimNode_Mirror_Standalone`
Inherits: `AnimNode_MirrorBase` | Header: `AnimNode_Mirror.h`

Anim Node Mirror Standalone

### `unreal.AnimNode_MirrorBase`
Inherits: `AnimNode_Base` | Header: `AnimNode_Mirror.h`

Anim Node Mirror Base

### `unreal.AnimNode_ModifyBone`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_ModifyBone.h`

Simple controller that replaces or adds to the translation/rotation of a single bone.

**Properties** (3):
  - `rotation`: `Rotator` — [Read-Write] New rotation of bone to apply. (Rotator)
  - `scale`: `Vector` — [Read-Write] New Scale of bone to apply. This is only worldspace. (Vector)
  - `translation`: `Vector` — [Read-Write] New translation of bone to apply. (Vector)

### `unreal.AnimNode_ModifyCurve`
Inherits: `AnimNode_Base` | Header: `AnimNode_ModifyCurve.h`

Easy way to modify curve values on a pose

**Properties** (5):
  - `alpha`: `float` — [Read-Write] (float)
  - `apply_mode`: `ModifyCurveApplyMode` — [Read-Write] (ModifyCurveApplyMode)
  - `curve_map`: `None` — [Read-Write] (Map[Name,float])
  - `curve_values`: `None` — [Read-Write] (Array[float])
  - `source_pose`: `PoseLink` — [Read-Write] (PoseLink)

### `unreal.AnimNode_MultiWayBlend`
Inherits: `AnimNode_Base` | Header: `AnimNode_MultiWayBlend.h`

This represents a baked transition

**Properties** (5):
  - `additive_node`: `bool` — [Read-Write] (bool)
  - `alpha_scale_bias`: `InputScaleBias` — [Read-Write] (InputScaleBias)
  - `desired_alphas`: `None` — [Read-Write] (Array[float])
  - `normalize_alpha`: `bool` — [Read-Write] (bool)
  - `poses`: `None` — [Read-Write] (Array[PoseLink])

### `unreal.AnimNode_ObserveBone`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_ObserveBone.h`

Debugging node that displays the current value of a bone in a specific space.

### `unreal.AnimNode_PoseBlendNode`
Inherits: `AnimNode_PoseHandler` | Header: `AnimNode_PoseBlendNode.h`

Evaluates a point in an anim sequence, using a specific time input rather than advancing time internally. Typically the playback position of the animation for this node will represent something other ...

**Properties** (1):
  - `source_pose`: `PoseLink` — [Read-Write] (PoseLink)

### `unreal.AnimNode_PoseByName`
Inherits: `AnimNode_PoseHandler` | Header: `AnimNode_PoseByName.h`

Evaluates a point in an anim sequence, using a specific time input rather than advancing time internally. Typically the playback position of the animation for this node will represent something other ...

**Properties** (2):
  - `pose_name`: `Name` — [Read-Write] (Name)
  - `pose_weight`: `float` — [Read-Write] (float)

### `unreal.AnimNode_PoseDriver`
Inherits: `AnimNode_PoseHandler` | Header: `AnimNode_PoseDriver.h`

RBF based orientation driver

**Properties** (1):
  - `source_pose`: `PoseLink` — [Read-Write] Bones to use for driving parameters based on their transform (PoseLink)

### `unreal.AnimNode_PoseHandler`
Inherits: `AnimNode_AssetPlayerBase` | Header: `AnimNode_PoseHandler.h`

Evaluates a point in an anim sequence, using a specific time input rather than advancing time internally. Typically the playback position of the animation for this node will represent something other ...

**Properties** (1):
  - `pose_asset`: `PoseAsset` — [Read-Write] The animation sequence asset to evaluate (PoseAsset)

### `unreal.AnimNode_PoseSnapshot`
Inherits: `AnimNode_Base` | Header: `AnimNode_PoseSnapshot.h`

Provide a snapshot pose, either from the internal named pose cache or via a supplied snapshot

**Properties** (3):
  - `mode`: `SnapshotSourceMode` — [Read-Write] How to access the snapshot (SnapshotSourceMode)
  - `snapshot`: `PoseSnapshot` — [Read-Write] Snapshot to use. This should be populated at first by calling SnapshotPose (PoseSnapsho...
  - `snapshot_name`: `Name` — [Read-Write] The name of the snapshot previously stored with SavePoseSnapshot (Name)

### `unreal.AnimNode_RandomPlayer`
Inherits: `AnimNode_AssetPlayerRelevancyBase` | Header: `AnimNode_RandomPlayer.h`

Anim Node Random Player

**Properties** (3):
  - `blend_weight`: `float` — [Read-Write] Last encountered blend weight for this node (float)
  - `entries`: `None` — [Read-Write] List of sequences to randomly step through (Array[RandomPlayerSequenceEntry])
  - `shuffle_mode`: `bool` — [Read-Write] When shuffle mode is active we will never loop a sequence beyond MaxLoopCount
without v...

### `unreal.AnimNode_RefPose`
Inherits: `AnimNode_Base` | Header: `AnimNode_RefPose.h`

RefPose pose nodes - ref pose or additive RefPose pose

### `unreal.AnimNode_ResetRoot`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_ResetRoot.h`

Anim Node Reset Root

### `unreal.AnimNode_RigidBody`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_RigidBody.h`

Controller that simulates physics based on the physics asset of the skeletal mesh component

**Properties** (1):
  - `use_local_lod_threshold_only`: `bool` — [Read-Write] Enable if you want to ignore the p.RigidBodyLODThreshold CVAR and force the node to sol...

### `unreal.AnimNode_RotateRootBone`
Inherits: `AnimNode_Base` | Header: `AnimNode_RotateRootBone.h`

TODO:: Comment

**Properties** (7):
  - `base_pose`: `PoseLink` — [Read-Write] (PoseLink)
  - `mesh_to_component`: `Rotator` — [Read-Write] (Rotator)
  - `pitch`: `float` — [Read-Write] (float)
  - `pitch_scale_bias_clamp`: `InputScaleBiasClamp` — [Read-Write] (InputScaleBiasClamp)
  - `rotate_root_motion_attribute`: `bool` — [Read-Write] If enabled, rotating the root bone using this node will also rotate the direction of th...
  - `yaw`: `float` — [Read-Write] (float)
  - `yaw_scale_bias_clamp`: `InputScaleBiasClamp` — [Read-Write] (InputScaleBiasClamp)

### `unreal.AnimNode_RotationMultiplier`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_RotationMultiplier.h`

Simple controller that multiplies scalar value to the translation/rotation/scale of a single bone.

**Properties** (1):
  - `multiplier`: `float` — [Read-Write] To make these to be easily pin-hookable, Iâm not making it struct, but each variable
...

### `unreal.AnimNode_RotationOffsetBlendSpace`
Inherits: `AnimNode_BlendSpacePlayer` | Header: `AnimNode_RotationOffsetBlendSpace.h`

TODO:: Comment

**Properties** (9):
  - `alpha`: `float` — [Read-Write] Current strength of the AimOffset (float)
  - `alpha_bool_blend`: `InputAlphaBoolBlend` — [Read-Write] (InputAlphaBoolBlend)
  - `alpha_bool_enabled`: `bool` — [Read-Write] (bool)
  - `alpha_curve_name`: `Name` — [Read-Write] (Name)
  - `alpha_input_type`: `AnimAlphaInputType` — [Read-Write] (AnimAlphaInputType)
  - `alpha_scale_bias`: `InputScaleBias` — [Read-Write] (InputScaleBias)
  - `alpha_scale_bias_clamp`: `InputScaleBiasClamp` — [Read-Write] (InputScaleBiasClamp)
  - `base_pose`: `PoseLink` — [Read-Write] (PoseLink)
  - `lod_threshold`: `int` — [Read-Write] * Max LOD that this node is allowed to run
* For example if you have LODThreshold to be...

### `unreal.AnimNode_RotationOffsetBlendSpaceGraph`
Inherits: `AnimNode_BlendSpaceGraphBase` | Header: `AnimNode_RotationOffsetBlendSpaceGraph.h`

Allows multiple animations to be blended between based on input parameters

**Properties** (9):
  - `alpha`: `float` — [Read-Write] Current strength of the AimOffset (float)
  - `alpha_bool_blend`: `InputAlphaBoolBlend` — [Read-Write] (InputAlphaBoolBlend)
  - `alpha_bool_enabled`: `bool` — [Read-Write] (bool)
  - `alpha_curve_name`: `Name` — [Read-Write] (Name)
  - `alpha_input_type`: `AnimAlphaInputType` — [Read-Write] (AnimAlphaInputType)
  - `alpha_scale_bias`: `InputScaleBias` — [Read-Write] (InputScaleBias)
  - `alpha_scale_bias_clamp`: `InputScaleBiasClamp` — [Read-Write] (InputScaleBiasClamp)
  - `base_pose`: `PoseLink` — [Read-Write] (PoseLink)
  - `lod_threshold`: `int` — [Read-Write] * Max LOD that this node is allowed to run
* For example if you have LODThreshold to be...

### `unreal.AnimNode_ScaleChainLength`
Inherits: `AnimNode_Base` | Header: `AnimNode_ScaleChainLength.h`

Scale the length of a chain of bones.

**Properties** (3):
  - `alpha`: `float` — [Read-Write] (float)
  - `default_chain_length`: `float` — [Read-Write] Default chain length, as animated. (float)
  - `target_location`: `Vector` — [Read-Write] (Vector)

### `unreal.AnimNode_SequenceEvaluator`
Inherits: `AnimNode_SequenceEvaluatorBase` | Header: `AnimNode_SequenceEvaluator.h`

Sequence evaluator node that can be used with constant folding

### `unreal.AnimNode_SequenceEvaluator_Standalone`
Inherits: `AnimNode_SequenceEvaluatorBase` | Header: `AnimNode_SequenceEvaluator.h`

Sequence evaluator node that can be used standalone (without constant folding)

### `unreal.AnimNode_SequenceEvaluatorBase`
Inherits: `AnimNode_AssetPlayerBase` | Header: `AnimNode_SequenceEvaluator.h`

Abstract base class. Evaluates a point in an anim sequence, using a specific time input rather than advancing time internally. Typically the playback position of the animation for this node will repre...

### `unreal.AnimNode_SkeletalControlBase`
Inherits: `AnimNode_Base` | Header: `AnimNode_SkeletalControlBase.h`

Anim Node Skeletal Control Base

**Properties** (9):
  - `alpha`: `float` — [Read-Write] Current strength of the skeletal control (float)
  - `alpha_bool_blend`: `InputAlphaBoolBlend` — [Read-Write] (InputAlphaBoolBlend)
  - `alpha_bool_enabled`: `bool` — [Read-Write] (bool)
  - `alpha_curve_name`: `Name` — [Read-Write] (Name)
  - `alpha_input_type`: `AnimAlphaInputType` — [Read-Write] (AnimAlphaInputType)
  - `alpha_scale_bias`: `InputScaleBias` — [Read-Write] (InputScaleBias)
  - `alpha_scale_bias_clamp`: `InputScaleBiasClamp` — [Read-Write] (InputScaleBiasClamp)
  - `component_pose`: `ComponentSpacePoseLink` — [Read-Write] Input link (ComponentSpacePoseLink)
  - `lod_threshold`: `int` — [Read-Write] * Max LOD that this node is allowed to run
* For example if you have LODThreshold to be...

### `unreal.AnimNode_Slot`
Inherits: `AnimNode_Base` | Header: `AnimNode_Slot.h`

An animation slot node normally acts as a passthru, but a montage or PlaySlotAnimation call from game code can cause an animation to blend in and be played on the slot temporarily, overriding the Sour...

**Properties** (3):
  - `always_update_source_pose`: `bool` — [Read-Write] Whether we should continue to update the source pose regardless of whether it would be ...
  - `slot_name`: `Name` — [Read-Write] The name of this slot, exposed to gameplay code, etcâ¦ (Name)
  - `source`: `PoseLink` — [Read-Write] The source input, passed thru to the output unless a montage or slot animation is curre...

### `unreal.AnimNode_SplineIK`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_SplineIK.h`

Anim Node Spline IK

**Properties** (6):
  - `control_points`: `None` — [Read-Write] Transforms applied to spline points * (Array[Transform])
  - `offset`: `float` — [Read-Write] The distance along the spline from the start from which bones are constrained (float)
  - `roll`: `float` — [Read-Write] Overall roll of the spline, applied on top of other rotations along the direction of th...
  - `stretch`: `float` — [Read-Write] The maximum stretch allowed when fitting bones to the spline. 0.0 means bones do not st...
  - `twist_end`: `float` — [Read-Write] The twist of the end bone. Twist is interpolated along the spline according to Twist Bl...
  - `twist_start`: `float` — [Read-Write] The twist of the start bone. Twist is interpolated along the spline according to Twist ...

### `unreal.AnimNode_SpringBone`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_SpringBone.h`

Simple controller that replaces or adds to the translation/rotation of a single bone.

**Properties** (1):
  - `max_displacement`: `float` — [Read-Write] If bLimitDisplacement is true, this indicates how long a bone can stretch beyond its le...

### `unreal.AnimNode_Sync`
Inherits: `AnimNode_Base` | Header: `AnimNode_Sync.h`

Anim Node Sync

### `unreal.AnimNode_Trail`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_Trail.h`

Trail Controller

**Properties** (3):
  - `relaxation_speed_scale`: `float` — [Read-Write] (float)
  - `relaxation_speed_scale_input_processor`: `InputScaleBiasClamp` — [Read-Write] (InputScaleBiasClamp)
  - `rotation_offsets`: `None` — [Read-Write] (Array[Vector])

### `unreal.AnimNode_TwistCorrectiveNode`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_TwistCorrectiveNode.h`

This is the node that apply corrective morphtarget for twist Good example is that if you twist your neck too far right or left, youâre going to see odd stretch shape of neck, This node can detect th...

### `unreal.AnimNode_TwoBoneIK`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_TwoBoneIK.h`

Simple 2 Bone IK Controller.

**Properties** (2):
  - `effector_location`: `Vector` — [Read-Write] Effector Location. Target Location to reach. (Vector)
  - `joint_target_location`: `Vector` — [Read-Write] Joint Target Location. Location used to orient Joint bone. * (Vector)

### `unreal.AnimNode_TwoWayBlend`
Inherits: `AnimNode_Base` | Header: `AnimNode_TwoWayBlend.h`

This represents a baked transition

**Properties** (9):
  - `a`: `PoseLink` — [Read-Write] (PoseLink)
  - `alpha`: `float` — [Read-Write] The float value that controls the alpha blending when the alpha input type is set to â...
  - `alpha_bool_blend`: `InputAlphaBoolBlend` — [Read-Write] (InputAlphaBoolBlend)
  - `alpha_bool_enabled`: `bool` — [Read-Write] The boolean value that controls the alpha blending when the alpha input type is set to ...
  - `alpha_curve_name`: `Name` — [Read-Write] The animation curve that controls the alpha blending when the alpha input type is set t...
  - `alpha_input_type`: `AnimAlphaInputType` — [Read-Write] The data type used to control the alpha blending between the A and B poses.
Note: Chang...
  - `alpha_scale_bias`: `InputScaleBias` — [Read-Write] (InputScaleBias)
  - `alpha_scale_bias_clamp`: `InputScaleBiasClamp` — [Read-Write] (InputScaleBiasClamp)
  - `b`: `PoseLink` — [Read-Write] (PoseLink)

### `unreal.AnimPhysBodyDefinition`
Inherits: `StructBase` | Header: `AnimNode_AnimDynamics.h`

Anim Phys Body Definition

### `unreal.AnimPhysConstraintSetup`
Inherits: `StructBase` | Header: `AnimNode_AnimDynamics.h`

Constraint setup struct, holds data required to build a physics constraint

### `unreal.AnimPhysPlanarLimit`
Inherits: `StructBase` | Header: `AnimNode_AnimDynamics.h`

Anim Phys Planar Limit

### `unreal.AnimPhysSphericalLimit`
Inherits: `StructBase` | Header: `AnimNode_AnimDynamics.h`

Anim Phys Spherical Limit

### `unreal.BlendBoneByChannelEntry`
Inherits: `StructBase` | Header: `AnimNode_BlendBoneByChannel.h`

Blend Bone by Channel Entry

### `unreal.BlendListBaseReference`
Inherits: `AnimNodeReference` | Header: `BlendListBaseLibrary.h`

Blend List Base Reference

### `unreal.BlendSpacePlayerReference`
Inherits: `AnimNodeReference` | Header: `BlendSpacePlayerLibrary.h`

Blend Space Player Reference

### `unreal.BlendSpaceReference`
Inherits: `AnimNodeReference` | Header: `BlendSpaceLibrary.h`

Blend Space Reference

### `unreal.Constraint`
Inherits: `StructBase` | Header: `AnimNode_Constraint.h`

Constraint Set up

### `unreal.IKFootPelvisPullDownSolver`
Inherits: `StructBase` | Header: `BoneControllerSolvers.h`

IKFoot Pelvis Pull Down Solver

### `unreal.LayeredBoneBlendReference`
Inherits: `AnimNodeReference` | Header: `LayeredBoneBlendLibrary.h`

Layered Bone Blend Reference

### `unreal.LinkedAnimGraphReference`
Inherits: `AnimNodeReference` | Header: `LinkedAnimGraphLibrary.h`

Linked Anim Graph Reference

### `unreal.MirrorAnimNodeReference`
Inherits: `AnimNodeReference` | Header: `MirrorAnimLibrary.h`

Mirror Anim Node Reference

### `unreal.ModifyCurveAnimNodeReference`
Inherits: `AnimNodeReference` | Header: `ModifyCurveLibrary.h`

Modify Curve Anim Node Reference

### `unreal.PoseDriverTarget`
Inherits: `StructBase` | Header: `AnimNode_PoseDriver.h`

Information about each target in the PoseDriver

### `unreal.PoseDriverTransform`
Inherits: `StructBase` | Header: `AnimNode_PoseDriver.h`

Translation and rotation for a particular bone at a particular target

### `unreal.PositionHistory`
Inherits: `StructBase` | Header: `KismetAnimationTypes.h`

An easing type defining how to ease float values. The FPositionHistory is a container to record position changes over time. This is used to calculate velocity of a bone, for example. The FPositionArra...

### `unreal.RandomPlayerSequenceEntry`
Inherits: `StructBase` | Header: `AnimNode_RandomPlayer.h`

The random player node holds a list of sequences and parameter ranges which will be played continuously In a random order. If shuffle mode is enabled then each entry will be played once before repeati...

**Properties** (6):
  - `chance_to_play`: `float` — [Read-Write] When not in shuffle mode, this is the chance this entry will play (normalized against a...
  - `max_loop_count`: `int` — [Read-Write] Maximum number of times this entry will loop before ending (int32)
  - `max_play_rate`: `float` — [Read-Write] Maximum playrate for this entry (float)
  - `min_loop_count`: `int` — [Read-Write] Minimum number of times this entry will loop before ending (int32)
  - `min_play_rate`: `float` — [Read-Write] Minimum playrate for this entry (float)
  - `sequence`: `AnimSequenceBase` — [Read-Write] Sequence to play when this entry is picked (AnimSequenceBase)

### `unreal.RBFParams`
Inherits: `StructBase` | Header: `RBFSolver.h`

Parameters used by RBF solver

**Properties** (11):
  - `automatic_radius`: `bool` — [Read-Write] Automatically pick the radius based on the average distance between targets (bool)
  - `distance_method`: `RBFDistanceMethod` — [Read-Write] (RBFDistanceMethod)
  - `function`: `RBFFunctionType` — [Read-Write] (RBFFunctionType)
  - `median_max`: `float` — [Read-Write] Maximum distance used for median (float)
  - `median_min`: `float` — [Read-Write] Minimum distance used for median (float)
  - `median_reference`: `Vector` — [Read-Write] Rotation or position of median (used for normalization) (Vector)
  - `normalize_method`: `RBFNormalizeMethod` — [Read-Write] Method to use for normalizing the weight (RBFNormalizeMethod)
  - `radius`: `float` — [Read-Write] Default radius for each target. (float)
  - `solver_type`: `RBFSolverType` — [Read-Write] Specifies the type of solver to use. The additive solver requires normalization, for th...
  - `twist_axis`: `BoneAxis` — [Read-Write] Axis to use when DistanceMethod is SwingAngle (BoneAxis)
  - `weight_threshold`: `float` — [Read-Write] Weight below which we shouldnât bother returning a contribution from a target (float)

### `unreal.ReferenceBoneFrame`
Inherits: `StructBase` | Header: `AnimNode_TwistCorrectiveNode.h`

Reference Bone Frame

### `unreal.RigidBodyAnimNodeReference`
Inherits: `AnimNodeReference` | Header: `AnimNode_RigidBody_Library.h`

Rigid Body Anim Node Reference

### `unreal.RotationLimit`
Inherits: `StructBase` | Header: `AnimNode_Trail.h`

Rotation Limit

### `unreal.RotationRetargetingInfo`
Inherits: `StructBase` | Header: `CommonAnimationTypes.h`

The FRotationRetargetingInfo is used to provide all of the settings required to perform rotational retargeting on a single transform.

### `unreal.SequenceEvaluatorReference`
Inherits: `AnimNodeReference` | Header: `SequenceEvaluatorLibrary.h`

Sequence Evaluator Reference

### `unreal.SequencePlayerReference`
Inherits: `AnimNodeReference` | Header: `SequencePlayerLibrary.h`

Sequence Player Reference

### `unreal.SimSpaceSettings`
Inherits: `StructBase` | Header: `AnimNode_RigidBody.h`

Sim Space Settings

**Properties** (12):
  - `damping_alpha`: `float` — [Read-Write] A muliplier to control how much of the simulation space movement is used to calculate t...
  - `external_angular_velocity`: `Vector` — [Read-Write] Additional angular velocity that is added to the component angular velocity. This can b...
  - `external_linear_drag`: `float` — [Read-Write]
deprecated: ExternalLinearDrag is deprecated. Please use ExternalLinearDragV instead. (...
  - `external_linear_drag_v`: `Vector` — [Read-Write] Additional linear drag applied to each body based on total body velocity. This is in ad...
  - `external_linear_velocity`: `Vector` — [Read-Write] Additional velocity that is added to the component velocity so the simulation acts as i...
  - `master_alpha`: `float` — âmaster_alphaâ was renamed to âworld_alphaâ. deprecated
  - `max_angular_acceleration`: `float` — [Read-Write] A clamp on the effective world-space angular accleration that is passed to the simulati...
  - `max_angular_velocity`: `float` — [Read-Write] A clamp on the effective world-space angular velocity that is passed to the simulation....
  - `max_linear_acceleration`: `float` — [Read-Write] A clamp on the effective world-space acceleration that is passed to the simulation. Uni...
  - `max_linear_velocity`: `float` — [Read-Write] A clamp on the effective world-space velocity that is passed to the simulation. Units a...
  - `velocity_scale_z`: `float` — [Read-Write] Multiplier on the Z-component of velocity and acceleration that is passed to the simula...
  - `world_alpha`: `float` — [Read-Write] Global multipler on the effects of simulation space movement. Must be in range [0, 1]. ...

### `unreal.SkeletalControlReference`
Inherits: `AnimNodeReference` | Header: `SkeletalControlLibrary.h`

Skeletal Control Reference

### `unreal.WarpingVectorValue`
Inherits: `StructBase` | Header: `BoneControllerTypes.h`

Vector values which may be specified in a configured space

**Properties** (2):
  - `mode`: `WarpingVectorMode` — [Read-Write] Space of the corresponding Vector value (WarpingVectorMode)
  - `value`: `Vector` — [Read-Write] Specifies a vector relative to the space defined by Mode (Vector)

### `unreal.AnimationStateMachineLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimationStateMachineLibrary.h`

Exposes operations to be performed on anim state machine node contexts

**Methods** (10):
  - `convert_to_animation_state_machine(result=AnimNodeReferenceConversionResult)` [classmethod] — Get an anim state machine from an anim node reference
  - `convert_to_animation_state_machine_pure(result=bool)` [classmethod] — Get an anim state machine from an anim node reference (pure)
  - `convert_to_animation_state_result(result=AnimNodeReferenceConversionResult)` [classmethod] — Get an anim state reference from an anim node reference
  - `convert_to_animation_state_result_pure(result=bool)` [classmethod] — Get an anim state reference from an anim node reference (pure)
  - `get_relevant_anim_time_remaining(update_context, node)` -> `float` [classmethod] — Returns the remaining animation time of the stateâs most relevant asset player
  - `get_relevant_anim_time_remaining_fraction(update_context, node)` -> `float` [classmethod] — Returns the remaining animation time as a fraction of the duration for the stateâs most relevant asset player
  - `get_state(update_context, node)` -> `Name` [classmethod] — Returns the name of the current state of this state machine
  - `is_state_blending_in(update_context, node)` -> `bool` [classmethod] — Returns whether the state the node belongs to is blending in
  - `is_state_blending_out(update_context, node)` -> `bool` [classmethod] — Returns whether the state the node belongs to is blending out
  - `set_state(update_context, node, target_state, duration, blend_type, blend_profile, alpha_blend_option, custom_blend_curve)` -> `None` [classmethod]

### `unreal.AnimExecutionContextLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimExecutionContextLibrary.h`

Exposes operations to be performed on anim node contexts

**Methods** (8):
  - `convert_to_component_space_pose_context(result=AnimExecutionContextConversionResult)` [classmethod] — Convert to a component space pose context
  - `convert_to_initialization_context(result=AnimExecutionContextConversionResult)` [classmethod] — Convert to an initialization context
  - `convert_to_pose_context(result=AnimExecutionContextConversionResult)` [classmethod] — Convert to a pose context
  - `convert_to_update_context(result=AnimExecutionContextConversionResult)` [classmethod] — Convert to an update context
  - `get_anim_instance(context)` -> `AnimInstance` [classmethod] — Get the anim instance that hosts this context
  - `get_current_weight(context)` -> `float` [classmethod] — Get the current weight of this branch of the graph
  - `get_delta_time(context)` -> `float` [classmethod] — Get the current delta time in seconds
  - `is_active(context)` -> `bool` [classmethod] — Get whether this branch of the graph is active (i.e. NOT blending out).

### `unreal.AnimGraphLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `KismetAnimationLibrary.h`

A library of the most common animation blueprint functions.

**Methods** (11):
  - `calculate_direction(velocity, base_rotation)` -> `float` [classmethod] — Returns degree of the angle between Velocity and Rotation forward vector The range of return will be from [-180, 180]. U...
  - `calculate_velocity_from_position_history(delta_seconds, position, history, number_of_samples=16, velocity_min=0.000000, history=PositionHistory)` [classmethod] — This function calculates the velocity of a position changing over time. You need to hook up a valid PositionHistory vari...
  - `calculate_velocity_from_sockets(delta_seconds, component, socket_or_bone_name, reference_socket_or_bone, socket_space, offset_in_bone_space, history, number_of_samples=16, velocity_min=0.000000, velocity_max=128.000000, easing_type, history=PositionHistory)` [classmethod] — This function calculates the velocity of an offset position on a bone / socket over time. The boneâs / socketâs moti...
  - `direction_between_sockets(component, socket_or_bone_name_from, socket_or_bone_name_to)` -> `Vector` [classmethod] — Computes the direction between two bones / sockets.
  - `distance_between_sockets(component, socket_or_bone_name_a, socket_space_a, socket_or_bone_name_b, socket_space_b, remap_range=False, range_min, range_max, out_range_min, out_range_max)` -> `float` [classmethod] — Computes the distance between two bones / sockets and can remap the range.
  - `k2_end_profiling_timer(log = True, log_prefix = '')` -> `float` [classmethod] — This function ends measuring a profiling bracket and optionally logs the result result: The time spent in milliseconds
  - `k2_start_profiling_timer()` -> `None` [classmethod] — This function starts measuring the time for a profiling bracket
  - `look_at(current_transform, target_position, look_at_vector, use_up_vector=False, up_vector, clamp_cone_in_degree)` -> `Transform` [classmethod] — Computes the transform which is âlookingâ at target position with a local axis.
  - `make_float_from_perlin_noise(value, range_out_min, range_out_max)` -> `float` [classmethod] — This function creates perlin noise for a single float and then range map to RangeOut
  - `make_vector_from_perlin_noise(x, y, z, range_out_min_x = -1.000000, range_out_max_x = 1.000000, range_out_min_y = -1.000000, range_out_max_y = 1.000000, range_out_min_z = -1.000000, range_out_max_z = 1.000000)` -> `Vector` [classmethod] — This function creates perlin noise from input X, Y, Z, and then range map to RangeOut, and out put to OutX, OutY, OutZ
  - `two_bone_ik(root_pos, joint_pos, end_pos, joint_target, effector, allow_stretching=False, start_stretch_ratio=1.000000, out_end_pos=Vector)` [classmethod] — Computes the transform for two bones using inverse kinematics.

### `unreal.AnimNodeRigidBodyLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimNode_RigidBody_Library.h`

Exposes operations to be performed on a rigid body anim node

**Methods** (3):
  - `convert_to_rigid_body_anim_node(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a rigid body anim node context from an anim node context
  - `convert_to_rigid_body_anim_node_pure(result=bool)` [classmethod] — Get a rigid body anim node context from an anim node context (pure)
  - `set_override_physics_asset(node, physics_asset)` -> `RigidBodyAnimNodeReference` [classmethod] — Set the physics asset on the rigid body anim graph node (RBAN).

### `unreal.AnimNotify_PlayMontageNotify`
Inherits: `AnimNotify` | Header: `AnimNotify_PlayMontageNotify.h`

UAnimNotify_PlayMontageNotify

**Properties** (1):
  - `notify_name`: `Name` [Read-Only] — [Read-Only] Name of notify that is passed to the PlayMontage K2Node. (Name)

### `unreal.AnimNotify_PlayMontageNotifyWindow`
Inherits: `AnimNotifyState` | Header: `AnimNotify_PlayMontageNotify.h`

UAnimNotify_PlayMontageNotifyWindow

**Properties** (1):
  - `notify_name`: `Name` [Read-Only] — [Read-Only] Name of notify that is passed to ability. (Name)

### `unreal.AnimSequencerInstance`
Inherits: `AnimInstance` | Header: `AnimSequencerInstance.h`

Anim Sequencer Instance

### `unreal.BlendListBaseLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlendListBaseLibrary.h`

Exposes operations to be performed on anim state machine node contexts

**Methods** (2):
  - `convert_to_blend_list_base(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a blend list base context from an anim node context.
  - `reset_node(blend_list_base)` -> `None` [classmethod] — Reset target blend list node to that the next blend is executed from a blank state

### `unreal.BlendSpaceLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlendSpaceLibrary.h`

Exposes operations to be performed on a blend space anim node.

**Methods** (5):
  - `convert_to_blend_space(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a blend space context from an anim node context.
  - `convert_to_blend_space_pure(result=bool)` [classmethod] — Get a blend space context from an anim node context (pure).
  - `get_filtered_position(blend_space)` -> `Vector` [classmethod] — Get the current sample coordinates after going through the filtering.
  - `get_position(blend_space)` -> `Vector` [classmethod] — Get the current position of the blend space.
  - `snap_to_position(blend_space, new_position)` -> `None` [classmethod] — Forces the Position to the specified value

### `unreal.BlendSpacePlayerLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlendSpacePlayerLibrary.h`

Exposes operations to be performed on a blend space player anim node.

**Methods** (14):
  - `convert_to_blend_space_player(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a blend space player context from an anim node context.
  - `convert_to_blend_space_player_pure(result=bool)` [classmethod] — Get a blend space player context from an anim node context (pure).
  - `get_blend_space(blend_space_player)` -> `BlendSpace` [classmethod] — Get the current BlendSpace of the blend space player.
  - `get_loop(blend_space_player)` -> `bool` [classmethod] — Get the current loop of the blend space player.
  - `get_play_rate(blend_space_player)` -> `float` [classmethod] — Get the current play rate of the blend space player.
  - `get_position(blend_space_player)` -> `Vector` [classmethod] — Get the current position of the blend space player.
  - `get_start_position(blend_space_player)` -> `float` [classmethod] — Get the current start position of the blend space player.
  - `set_blend_space(blend_space_player, blend_space)` -> `BlendSpacePlayerReference` [classmethod] — Set the current BlendSpace of the blend space player.
  - `set_blend_space_with_inertial_blending(update_context, blend_space_player, blend_space, blend_time = 0.200000)` -> `BlendSpacePlayerReference` [classmethod] — Set the current BlendSpace of the blend space player with an interial blend time.
  - `set_loop(blend_space_player, loop)` -> `BlendSpacePlayerReference` [classmethod] — Set the loop of the blend space player.
  - `set_play_rate(blend_space_player, play_rate)` -> `BlendSpacePlayerReference` [classmethod] — Set the play rate of the blend space player.
  - `set_reset_play_time_when_blend_space_changes(blend_space_player, reset)` -> `BlendSpacePlayerReference` [classmethod] — Set whether the current play time should reset when BlendSpace changes of the blend space player.
  - `should_reset_play_time_when_blend_space_changes(blend_space_player)` -> `bool` [classmethod] — Get the current value of whether the current play time should reset when BlendSpace changes of the blend space player.
  - `snap_to_position(blend_space_player, new_position)` -> `None` [classmethod] — Forces the Position to the specified value

### `unreal.LayeredBoneBlendLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LayeredBoneBlendLibrary.h`

Exposes operations to be performed on a layered bone blend anim node.

**Methods** (4):
  - `convert_to_layered_blend_per_bone_pure(result=bool)` [classmethod] — Get a layered bone blend context from an anim node context (pure).
  - `convert_to_layered_bone_blend(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a layered bone blend context from an anim node context.
  - `get_num_poses(layered_bone_blend)` -> `int32` [classmethod] — Get the number of poses that a layered bone blend node has (this does not include the base pose)
  - `set_blend_mask(update_context, layered_bone_blend, pose_index, blend_mask_name)` -> `LayeredBoneBlendReference` [classmethod] — Sets the currently-used blend mask for a blended input pose by name.

### `unreal.LinkedAnimGraphLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LinkedAnimGraphLibrary.h`

Exposes operations to be performed on anim node contexts

**Methods** (4):
  - `convert_to_linked_anim_graph(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a linked anim graph reference from an anim node reference
  - `convert_to_linked_anim_graph_pure(result=bool)` [classmethod] — Get a linked anim graph reference from an anim node reference (pure)
  - `get_linked_anim_instance(node)` -> `AnimInstance` [classmethod] — Get the linked instance is hosted by this node. If the node does not host an instance then HasLinkedAnimInstance will re...
  - `has_linked_anim_instance(node)` -> `bool` [classmethod] — Returns whether the node hosts an instance (e.g. linked anim graph or layer)

### `unreal.MirrorAnimLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MirrorAnimLibrary.h`

Exposes operations that can be run on a Mirror node via Anim Node Functions such as âOn Become Relevantâ and âOn Updateâ.

**Methods** (7):
  - `convert_to_mirror_node(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a mirror node context from an anim node context
  - `convert_to_mirror_node_pure(result=bool)` [classmethod] — Get a mirror context from an anim node context (pure)
  - `get_mirror(mirror_node)` -> `bool` [classmethod] — Get the mirror state
  - `get_mirror_data_table(mirror_node)` -> `MirrorDataTable` [classmethod] — Get MirrorDataTable used to perform mirroring
  - `get_mirror_transition_blend_time(mirror_node)` -> `float` [classmethod] — Get how long to blend using inertialization when switching mirrored state
  - `set_mirror(mirror_node, mirror)` -> `MirrorAnimNodeReference` [classmethod] — Set the mirror state
  - `set_mirror_transition_blend_time(mirror_node, blend_time)` -> `MirrorAnimNodeReference` [classmethod] — Set how long to blend using inertialization when switching mirrored state

### `unreal.ModifyCurveAnimLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ModifyCurveLibrary.h`

Exposes operations that can be run on a Modify Curve Node via Anim Node Functions such as âOn Become Relevantâ and âOn Updateâ.

**Methods** (7):
  - `convert_to_modify_curve_node(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a modify curve node context from an anim node context
  - `convert_to_modify_curve_node_pure(result=bool)` [classmethod] — Get a modify curve context from an anim node context (pure)
  - `get_alpha(modify_curve_node)` -> `float` [classmethod] — Get Alpha
  - `get_apply_mode(modify_curve_node)` -> `ModifyCurveApplyMode` [classmethod] — Get Apply Mode
  - `set_alpha(modify_curve_node, alpha)` -> `ModifyCurveAnimNodeReference` [classmethod] — Set Alpha
  - `set_apply_mode(modify_curve_node, mode)` -> `ModifyCurveAnimNodeReference` [classmethod] — Set Apply Mode
  - `set_curve_map(modify_curve_node, curve_map)` -> `ModifyCurveAnimNodeReference` [classmethod] — Set Curve Map

### `unreal.PlayMontageCallbackProxy`
Inherits: `Object` | Header: `PlayMontageCallbackProxy.h`

Play Montage Callback Proxy

**Properties** (5):
  - `on_blend_out`: `OnMontagePlayDelegate` — [Read-Write] Called when Montage starts blending out and is not interrupted (OnMontagePlayDelegate)
  - `on_completed`: `OnMontagePlayDelegate` — [Read-Write] Called when Montage finished playing and wasnât interrupted (OnMontagePlayDelegate)
  - `on_interrupted`: `OnMontagePlayDelegate` — [Read-Write] Called when Montage has been interrupted (or failed to play) (OnMontagePlayDelegate)
  - `on_notify_begin`: `OnMontagePlayDelegate` — [Read-Write] (OnMontagePlayDelegate)
  - `on_notify_end`: `OnMontagePlayDelegate` — [Read-Write] (OnMontagePlayDelegate)

### `unreal.SequenceEvaluatorLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SequenceEvaluatorLibrary.h`

Exposes operations to be performed on a sequence evaluator anim node Note: Experimental and subject to change!

**Methods** (9):
  - `advance_time(update_context, sequence_evaluator, play_rate = 1.000000)` -> `SequenceEvaluatorReference` [classmethod] — Advance the current accumulated time of the sequence evaluator
  - `convert_to_sequence_evaluator(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a sequence evaluator context from an anim node context
  - `convert_to_sequence_evaluator_pure(result=bool)` [classmethod] — Get a sequence evaluator context from an anim node context (pure)
  - `get_accumulated_time(sequence_evaluator)` -> `float` [classmethod] — Gets the current accumulated time of the sequence evaluator
  - `get_sequence(sequence_evaluator)` -> `AnimSequenceBase` [classmethod] — Gets the current sequence of the sequence evaluator
  - `set_explicit_frame(sequence_evaluator, frame)` -> `SequenceEvaluatorReference` [classmethod] — Set the current accumulated time, using a frame number, of the sequence evaluator
  - `set_explicit_time(sequence_evaluator, time)` -> `SequenceEvaluatorReference` [classmethod] — Set the current accumulated time of the sequence evaluator
  - `set_sequence(sequence_evaluator, sequence)` -> `SequenceEvaluatorReference` [classmethod] — Set the current sequence of the sequence evaluator
  - `set_sequence_with_inertial_blending(update_context, sequence_evaluator, sequence, blend_time = 0.200000)` -> `SequenceEvaluatorReference` [classmethod] — Set the current sequence of the sequence evaluator with an inertial blend time

### `unreal.SequencePlayerLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SequencePlayerLibrary.h`

Exposes operations to be performed on a sequence player anim node Note: Experimental and subject to change!

**Methods** (14):
  - `compute_play_rate_from_duration(sequence_player, duration = 1.000000)` -> `float` [classmethod] — Returns the Play Rate to provide when playing this animation if a specific animation duration is desired
  - `convert_to_sequence_player(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a sequence player context from an anim node context
  - `convert_to_sequence_player_pure(result=bool)` [classmethod] — Get a sequence player context from an anim node context (pure)
  - `get_accumulated_time(sequence_player)` -> `float` [classmethod] — Gets the current accumulated time of the sequence player
  - `get_loop_animation(sequence_player)` -> `bool` [classmethod] — Get the looping state of the sequence player
  - `get_play_rate(sequence_player)` -> `float` [classmethod] — Get the play rate of the sequence player
  - `get_sequence(sequence_player, sequence_base=AnimSequenceBase)` [classmethod] — Get the current sequence of the sequence player - DEPRECATED, please use pure version deprecated: Function âGetSequenc...
  - `get_sequence_pure(sequence_player)` -> `AnimSequenceBase` [classmethod] — Get the current sequence of the sequence player
  - `get_start_position(sequence_player)` -> `float` [classmethod] — Get the start position of the sequence player
  - `set_accumulated_time(sequence_player, time)` -> `SequencePlayerReference` [classmethod] — Set the current accumulated time of the sequence player
  - `set_play_rate(sequence_player, play_rate)` -> `SequencePlayerReference` [classmethod] — Set the play rate of the sequence player
  - `set_sequence(sequence_player, sequence)` -> `SequencePlayerReference` [classmethod] — Set the current sequence of the sequence player
  - `set_sequence_with_inertial_blending(update_context, sequence_player, sequence, blend_time = 0.200000)` -> `SequencePlayerReference` [classmethod] — Set the current sequence of the sequence player with an inertial blend time
  - `set_start_position(sequence_player, start_position)` -> `SequencePlayerReference` [classmethod] — Set the start position of the sequence player. If this is called from On Become Relevant or On Initial Update then it sh...

### `unreal.SequencerAnimationOverride`
Inherits: `Interface` | Header: `SequencerAnimationOverride.h`

Sequencer Animation Override

**Methods** (2):
  - `allows_cinematic_override()` -> `bool` — Whether this animation blueprint allows Sequencer to nuke this anim instance and replace it during Sequencer playback.
  - `get_sequencer_anim_slot_names()` -> `Array [ Name ]` — Should return a list of valid slot names for Sequencer to output to in the case that Sequencer is not permitted to nuke ...

### `unreal.SkeletalControlLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SkeletalControlLibrary.h`

Exposes operations to be performed on a skeletal control anim node Note: Experimental and subject to change!

**Methods** (4):
  - `convert_to_skeletal_control(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a skeletal control from an anim node
  - `convert_to_skeletal_control_pure(result=bool)` [classmethod] — Get a skeletal control from an anim node (pure)
  - `get_alpha(skeletal_control)` -> `float` [classmethod] — Get the alpha value of this skeletal control
  - `set_alpha(skeletal_control, alpha)` -> `SkeletalControlReference` [classmethod] — Set the alpha value of this skeletal control

### `unreal.AnimFunctionCallSite`
Inherits: `EnumBase` | Header: `AnimNode_CallFunction.h`

When to call the function during the execution of the animation graph

**Properties** (11):
  - `ON_BECOME_RELEVANT`: `AnimFunctionCallSite = Ellipsis` — Called when the node is updated for the first time with a valid weight 2
  - `ON_BECOME_RELEVANT_POST_RECURSION`: `AnimFunctionCallSite = Ellipsis` — Called when the node is updated for the first time with a valid weight (after child nodes are update...
  - `ON_EVALUATE`: `AnimFunctionCallSite = Ellipsis` — Called when the node is evaluated (before child nodes are evaluated) 3
  - `ON_EVALUATE_POST_RECURSION`: `AnimFunctionCallSite = Ellipsis` — Called when the node is evaluated (after child nodes are evaluated) 7
  - `ON_FINISHED_BLENDING_IN`: `AnimFunctionCallSite = Ellipsis` — Called when the node is updated, was at non-zero weight and becomes full weight. Called before child...
  - `ON_INITIALIZE`: `AnimFunctionCallSite = Ellipsis` — Called when the node is initialized - i.e. it becomes weighted/relevant in the graph (before child n...
  - `ON_INITIALIZE_POST_RECURSION`: `AnimFunctionCallSite = Ellipsis` — Called when the node is initialized - i.e. it becomes weighted/relevant in the graph (after child no...
  - `ON_STARTED_BLENDING_IN`: `AnimFunctionCallSite = Ellipsis` — Called when the node is updated, was at zero weight and beings to blend in. Called before child node...
  - `ON_STARTED_BLENDING_OUT`: `AnimFunctionCallSite = Ellipsis` — Called when the node is updated, was at full weight and beings to blend out. Called before child nod...
  - `ON_UPDATE`: `AnimFunctionCallSite = Ellipsis` — Called when the node is updated (before child nodes are updated) 1
  - `ON_UPDATE_POST_RECURSION`: `AnimFunctionCallSite = Ellipsis` — Called when the node is updated (after child nodes are updated) 5

### `unreal.AnimPhysAngularConstraintType`
Inherits: `EnumBase` | Header: `AnimNode_AnimDynamics.h`

Supported angular constraint types

**Properties** (2):
  - `ANGULAR`: `AnimPhysAngularConstraintType = Ellipsis` — 0
  - `CONE`: `AnimPhysAngularConstraintType = Ellipsis` — 1

### `unreal.AnimPhysLinearConstraintType`
Inherits: `EnumBase` | Header: `AnimNode_AnimDynamics.h`

Supported linear axis constraints

**Properties** (2):
  - `FREE`: `AnimPhysLinearConstraintType = Ellipsis` — 0
  - `LIMITED`: `AnimPhysLinearConstraintType = Ellipsis` — 1

### `unreal.AnimPhysSimSpaceType`
Inherits: `EnumBase` | Header: `AnimNode_AnimDynamics.h`

Anim Phys Sim Space Type

**Properties** (5):
  - `ACTOR`: `AnimPhysSimSpaceType = Ellipsis` — Sim origin is the location/orientation of the actor containing the skeletal mesh component. 1
  - `BONE_RELATIVE`: `AnimPhysSimSpaceType = Ellipsis` — Sim origin is the location/orientation of the bone specified in RelativeSpaceBone 4
  - `COMPONENT`: `AnimPhysSimSpaceType = Ellipsis` — Sim origin is the location/orientation of the skeletal mesh component. 0
  - `ROOT_RELATIVE`: `AnimPhysSimSpaceType = Ellipsis` — Sim origin is the location/orientation of the root bone. 3
  - `WORLD`: `AnimPhysSimSpaceType = Ellipsis` — Sim origin is the world origin. Teleporting characters is not recommended in this mode. 2

### `unreal.BlendListChildUpdateMode`
Inherits: `EnumBase` | Header: `AnimNode_BlendListBase.h`

EBlend List Child Update Mode

**Properties** (3):
  - `ALWAYS_TICK_CHILDREN`: `BlendListChildUpdateMode = Ellipsis` — Always tick children even if they are not active 2
  - `DEFAULT`: `BlendListChildUpdateMode = Ellipsis` — Do not tick inactive children, do not reset on activate 0
  - `RESET_CHILD_ON_ACTIVATE`: `BlendListChildUpdateMode = Ellipsis` — This reinitializes the re-activated child 1

### `unreal.BlendListTransitionType`
Inherits: `EnumBase` | Header: `AnimNode_BlendListBase.h`

EBlend List Transition Type

**Properties** (2):
  - `INERTIALIZATION`: `BlendListTransitionType = Ellipsis` — 1
  - `STANDARD_BLEND`: `BlendListTransitionType = Ellipsis` — 0

### `unreal.BoneModificationMode`
Inherits: `EnumBase` | Header: `AnimNode_ModifyBone.h`

EBone Modification Mode

**Properties** (3):
  - `BMM_ADDITIVE`: `BoneModificationMode = Ellipsis` — The modifier adds to the existing translation, rotation, or scale. 2
  - `BMM_IGNORE`: `BoneModificationMode = Ellipsis` — The modifier ignores this channel (keeps the existing bone translation, rotation, or scale). 0
  - `BMM_REPLACE`: `BoneModificationMode = Ellipsis` — The modifier replaces the existing translation, rotation, or scale. 1

### `unreal.ConstraintOffsetOption`
Inherits: `EnumBase` | Header: `AnimNode_Constraint.h`

Enum value to describe how youâd like to maintain offset

**Properties** (2):
  - `NONE`: `ConstraintOffsetOption = Ellipsis` — 0
  - `OFFSET_REF_POSE`: `ConstraintOffsetOption = Ellipsis` — no offset 1

### `unreal.CopyBoneDeltaMode`
Inherits: `EnumBase` | Header: `AnimNode_CopyBoneDelta.h`

Copy Bone Delta Mode

**Properties** (2):
  - `ACCUMULATE`: `CopyBoneDeltaMode = Ellipsis` — 0
  - `COPY`: `CopyBoneDeltaMode = Ellipsis` — 1

### `unreal.DrivenBoneModificationMode`
Inherits: `EnumBase` | Header: `AnimNode_BoneDrivenController.h`

The type of modification to make to the destination component(s)

**Properties** (3):
  - `ADD_TO_INPUT`: `DrivenBoneModificationMode = Ellipsis` — Add the driven value to the input component value(s) 0
  - `ADD_TO_REF_POSE`: `DrivenBoneModificationMode = Ellipsis` — Add the driven value to the reference pose value 2
  - `REPLACE_COMPONENT`: `DrivenBoneModificationMode = Ellipsis` — Replace the input component value(s) with the driven value 1

### `unreal.DrivenDestinationMode`
Inherits: `EnumBase` | Header: `AnimNode_BoneDrivenController.h`

Type of destination value to drive

**Properties** (3):
  - `BONE`: `DrivenDestinationMode = Ellipsis` — 0
  - `MATERIAL_PARAMETER`: `DrivenDestinationMode = Ellipsis` — 2
  - `MORPH_TARGET`: `DrivenDestinationMode = Ellipsis` — 1

### `unreal.EasingFuncType`
Inherits: `EnumBase` | Header: `CommonAnimationTypes.h`

An easing type defining how to ease float values.

**Properties** (15):
  - `CIRCULAR_IN`: `EasingFuncType = Ellipsis` — Circular easing (only in) 8
  - `CIRCULAR_IN_OUT`: `EasingFuncType = Ellipsis` — Circular easing (in and out) 10
  - `CIRCULAR_OUT`: `EasingFuncType = Ellipsis` — Circular easing (only out) 9
  - `CUBIC`: `EasingFuncType = Ellipsis` — Cubic version of the value (only in) 2
  - `CUBIC_IN_OUT`: `EasingFuncType = Ellipsis` — Cubic version of the value (in and out) 4
  - `CUSTOM_CURVE`: `EasingFuncType = Ellipsis` — Custom - based on an optional Curve 14
  - `EXP_IN`: `EasingFuncType = Ellipsis` — Exponential easing (only in) 11
  - `EXP_IN_OUT`: `EasingFuncType = Ellipsis` — Exponential easing (in and out) 13
  - `EXP_OUT`: `EasingFuncType = Ellipsis` — Exponential easing (only out) 12
  - `HERMITE_CUBIC`: `EasingFuncType = Ellipsis` — Easing using a cubic hermite function 5
  - `LINEAR`: `EasingFuncType = Ellipsis` — Linear easing (no change to the value) 0
  - `QUADRATIC_IN_OUT`: `EasingFuncType = Ellipsis` — Quadratic version of the value (in and out) 3
  - `QUARTIC_IN_OUT`: `EasingFuncType = Ellipsis` — Quartic version of the value (in and out) 6
  - `QUINTIC_IN_OUT`: `EasingFuncType = Ellipsis` — Quintic version of the value (in and out) 7
  - `SINUSOIDAL`: `EasingFuncType = Ellipsis` — Easing using a sinus function 1

### `unreal.InterpolationBlend`
Inherits: `EnumBase` | Header: `AnimNode_LookAt.h`

Various ways to interpolate TAlphaBlend.

**Properties** (7):
  - `CUBIC`: `InterpolationBlend = Ellipsis` — 1
  - `EASE_IN_OUT_EXPONENT2`: `InterpolationBlend = Ellipsis` — 3
  - `EASE_IN_OUT_EXPONENT3`: `InterpolationBlend = Ellipsis` — 4
  - `EASE_IN_OUT_EXPONENT4`: `InterpolationBlend = Ellipsis` — 5
  - `EASE_IN_OUT_EXPONENT5`: `InterpolationBlend = Ellipsis` — 6
  - `LINEAR`: `InterpolationBlend = Ellipsis` — 0
  - `SINUSOIDAL`: `InterpolationBlend = Ellipsis` — 2

### `unreal.LayeredBoneBlendMode`
Inherits: `EnumBase` | Header: `AnimNode_LayeredBoneBlend.h`

ELayered Bone Blend Mode

**Properties** (2):
  - `BLEND_MASK`: `LayeredBoneBlendMode = Ellipsis` — 1
  - `BRANCH_FILTER`: `LayeredBoneBlendMode = Ellipsis` — 0

### `unreal.ModifyCurveApplyMode`
Inherits: `EnumBase` | Header: `AnimNode_ModifyCurve.h`

EModify Curve Apply Mode

**Properties** (5):
  - `ADD`: `ModifyCurveApplyMode = Ellipsis` — Add new value to input curve value 0
  - `BLEND`: `ModifyCurveApplyMode = Ellipsis` — Blend input with new curve value, using Alpha setting on the node 2
  - `REMAP_CURVE`: `ModifyCurveApplyMode = Ellipsis` — Remaps the new curve value between the CurveValues entry and 1.0 (.5 in CurveValues makes 0.51 map t...
  - `SCALE`: `ModifyCurveApplyMode = Ellipsis` — Scale input value by new value 1
  - `WEIGHTED_MOVING_AVERAGE`: `ModifyCurveApplyMode = Ellipsis` — Blend the new curve value with the last curve value using Alpha to determine the weighting (.5 is a ...

### `unreal.PoseDriverOutput`
Inherits: `EnumBase` | Header: `AnimNode_PoseDriver.h`

Options for what PoseDriver should be driving

**Properties** (2):
  - `DRIVE_CURVES`: `PoseDriverOutput = Ellipsis` — Use the targetâs DrivenName to drive curves 1
  - `DRIVE_POSES`: `PoseDriverOutput = Ellipsis` — Use targetâs DrivenName to drive poses from the assigned PoseAsset 0

### `unreal.PoseDriverSource`
Inherits: `EnumBase` | Header: `AnimNode_PoseDriver.h`

Transform aspect used to drive interpolation

**Properties** (2):
  - `ROTATION`: `PoseDriverSource = Ellipsis` — Drive using rotation 0
  - `TRANSLATION`: `PoseDriverSource = Ellipsis` — Driver using translation 1

### `unreal.RBFDistanceMethod`
Inherits: `EnumBase` | Header: `RBFSolver.h`

Method for determining distance from input to targets

**Properties** (5):
  - `DEFAULT_METHOD`: `RBFDistanceMethod = Ellipsis` — Uses the setting of the parent container 4
  - `EUCLIDEAN`: `RBFDistanceMethod = Ellipsis` — Standard n-dimensional distance measure 0
  - `QUATERNION`: `RBFDistanceMethod = Ellipsis` — Treat inputs as quaternion 1
  - `SWING_ANGLE`: `RBFDistanceMethod = Ellipsis` — Treat inputs as quaternion, and find distance between rotated TwistAxis direction 2
  - `TWIST_ANGLE`: `RBFDistanceMethod = Ellipsis` — Treat inputs as quaternion, and find distance between rotations around the TwistAxis direction 3

### `unreal.RBFFunctionType`
Inherits: `EnumBase` | Header: `RBFSolver.h`

Function to use for each target falloff

**Properties** (6):
  - `CUBIC`: `RBFFunctionType = Ellipsis` — 3
  - `DEFAULT_FUNCTION`: `RBFFunctionType = Ellipsis` — Uses the setting of the parent container 5
  - `EXPONENTIAL`: `RBFFunctionType = Ellipsis` — 1
  - `GAUSSIAN`: `RBFFunctionType = Ellipsis` — 0
  - `LINEAR`: `RBFFunctionType = Ellipsis` — 2
  - `QUINTIC`: `RBFFunctionType = Ellipsis` — 4

### `unreal.RBFNormalizeMethod`
Inherits: `EnumBase` | Header: `RBFSolver.h`

Method to normalize weights

**Properties** (4):
  - `ALWAYS_NORMALIZE`: `RBFNormalizeMethod = Ellipsis` — Always normalize.
Zero distribution weights stay zero. 1
  - `NORMALIZE_WITHIN_MEDIAN`: `RBFNormalizeMethod = Ellipsis` — Normalize only within reference median. The median
is a cone with a minimum and maximum angle within...
  - `NO_NORMALIZATION`: `RBFNormalizeMethod = Ellipsis` — Donât normalize at all. This should only be used with
the interpolative method, if it is known tha...
  - `ONLY_NORMALIZE_ABOVE_ONE`: `RBFNormalizeMethod = Ellipsis` — Only normalize above one 0

### `unreal.RBFSolverType`
Inherits: `EnumBase` | Header: `RBFSolver.h`

The solver type to use. The two solvers have different requirements.

**Properties** (2):
  - `ADDITIVE`: `RBFSolverType = Ellipsis` — The additive solver sums up contributions from each target. Itâs faster
but may require more targe...
  - `INTERPOLATIVE`: `RBFSolverType = Ellipsis` — The interpolative solver interpolates the values from each target based
on distance. As long as the ...

### `unreal.RotationComponent`
Inherits: `EnumBase` | Header: `CommonAnimationTypes.h`

A rotational component. This is used for retargeting, for example.

**Properties** (6):
  - `EULER_X`: `RotationComponent = Ellipsis` — Using the X component of the Euler rotation 0
  - `EULER_Y`: `RotationComponent = Ellipsis` — Using the Y component of the Euler rotation 1
  - `EULER_Z`: `RotationComponent = Ellipsis` — Using the Z component of the Euler rotation 2
  - `QUATERNION_ANGLE`: `RotationComponent = Ellipsis` — Using the angle of the quaternion 3
  - `SWING_ANGLE`: `RotationComponent = Ellipsis` — Using the angle of the swing quaternion 4
  - `TWIST_ANGLE`: `RotationComponent = Ellipsis` — Using the angle of the twist quaternion 5

### `unreal.ScaleChainInitialLength`
Inherits: `EnumBase` | Header: `AnimNode_ScaleChainLength.h`

EScale Chain Initial Length

**Properties** (3):
  - `CHAIN_LENGTH`: `ScaleChainInitialLength = Ellipsis` — Use animated chain length (length in local space of every bone from âChainStartBoneâ to âChain...
  - `DISTANCE`: `ScaleChainInitialLength = Ellipsis` — Use distance between âChainStartBoneâ and âChainEndBoneâ (in Component Space) 1
  - `FIXED_DEFAULT_LENGTH_VALUE`: `ScaleChainInitialLength = Ellipsis` — Use the âDefaultChainLengthâ input value. 0

### `unreal.SequenceEvalReinit`
Inherits: `EnumBase` | Header: `AnimNode_SequenceEvaluator.h`

ESequence Eval Reinit

**Properties** (3):
  - `EXPLICIT_TIME`: `SequenceEvalReinit = Ellipsis` — Reset InternalTimeAccumulator to ExplicitTime 2
  - `NO_RESET`: `SequenceEvalReinit = Ellipsis` — Do not reset InternalTimeAccumulator 0
  - `START_POSITION`: `SequenceEvalReinit = Ellipsis` — Reset InternalTimeAccumulator to StartPosition 1

### `unreal.SimulationSpace`
Inherits: `EnumBase` | Header: `AnimNode_RigidBody.h`

Determines in what space the simulation should run

**Properties** (3):
  - `BASE_BONE_SPACE`: `SimulationSpace = Ellipsis` — Simulate in another bone space. Moving the entire skeletal mesh and individually modifying the base ...
  - `COMPONENT_SPACE`: `SimulationSpace = Ellipsis` — Simulate in component space. Moving the entire skeletal mesh will have no affect on velocities 0
  - `WORLD_SPACE`: `SimulationSpace = Ellipsis` — Simulate in world space. Moving the skeletal mesh will generate velocity changes 1

### `unreal.SimulationTiming`
Inherits: `EnumBase` | Header: `AnimNode_RigidBody.h`

Determines behaviour regarding deferral of simulation tasks.

**Properties** (3):
  - `DEFAULT`: `SimulationTiming = Ellipsis` — Use the default project setting as defined by p.RigidBodyNode.DeferredSimulationDefault. 0
  - `DEFERRED`: `SimulationTiming = Ellipsis` — Always run the simulation in the background and retrieve the result on the next animation evaluation...
  - `SYNCHRONOUS`: `SimulationTiming = Ellipsis` — Always run the simulation to completion during animation evaluation. 1

### `unreal.SnapshotSourceMode`
Inherits: `EnumBase` | Header: `AnimNode_PoseSnapshot.h`

How to access the snapshot

**Properties** (2):
  - `NAMED_SNAPSHOT`: `SnapshotSourceMode = Ellipsis` — Refer to an internal snapshot by name (previously stored with SavePoseSnapshot).
This can be more ef...
  - `SNAPSHOT_PIN`: `SnapshotSourceMode = Ellipsis` — Use a snapshot variable (previously populated using SnapshotPose).
This is more flexible and allows ...

### `unreal.SphericalLimitType`
Inherits: `EnumBase` | Header: `AnimNode_AnimDynamics.h`

Whether spheres keep bodies inside, or outside of their shape

**Properties** (2):
  - `INNER`: `SphericalLimitType = Ellipsis` — 0
  - `OUTER`: `SphericalLimitType = Ellipsis` — 1

### `unreal.SplineBoneAxis`
Inherits: `EnumBase` | Header: `AnimNode_SplineIK.h`

The different axes we can align our bones to. Note that the values are set to match up with EAxis (but without âNoneâ)

**Properties** (3):
  - `X`: `SplineBoneAxis = Ellipsis` — 1
  - `Y`: `SplineBoneAxis = Ellipsis` — 2
  - `Z`: `SplineBoneAxis = Ellipsis` — 3

### `unreal.SwapRootBone`
Inherits: `EnumBase` | Header: `AnimSequencerInstanceProxy.h`

ESwap Root Bone

**Properties** (3):
  - `SWAP_ROOT_BONE_ACTOR`: `SwapRootBone = Ellipsis` — Swap root bone to the actor root component 1
  - `SWAP_ROOT_BONE_COMPONENT`: `SwapRootBone = Ellipsis` — Swap the root bone to the component 0
  - `SWAP_ROOT_BONE_NONE`: `SwapRootBone = Ellipsis` — Do not swap the root bone 2

### `unreal.WarpingEvaluationMode`
Inherits: `EnumBase` | Header: `BoneControllerTypes.h`

Specifies the evaluation mode of an animation warping node

**Properties** (2):
  - `GRAPH`: `WarpingEvaluationMode = Ellipsis` — Animation warping evaluation parameters are graph-driven. This means some
properties of the node are...
  - `MANUAL`: `WarpingEvaluationMode = Ellipsis` — Animation warping evaluation parameters are driven by user settings. 0

### `unreal.WarpingVectorMode`
Inherits: `EnumBase` | Header: `BoneControllerTypes.h`

The supported spaces of a corresponding input vector value

**Properties** (4):
  - `ACTOR_SPACE_VECTOR`: `WarpingVectorMode = Ellipsis` — Actor-space input vector 1
  - `COMPONENT_SPACE_VECTOR`: `WarpingVectorMode = Ellipsis` — Component-space input vector 0
  - `IK_FOOT_ROOT_LOCAL_SPACE_VECTOR`: `WarpingVectorMode = Ellipsis` — IK Foot Root relative local-space input vector 3
  - `WORLD_SPACE_VECTOR`: `WarpingVectorMode = Ellipsis` — World-space input vector 2

### `unreal.OnMontagePlayDelegate`
Inherits: `MulticastDelegateBase` | Header: `PlayMontageCallbackProxy.h`

On Montage Play Delegate Delegate Signature
