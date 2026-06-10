# UE Python API — IKRig Module

**113 types** from the `IKRig` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_IKRig`, `AnimNode_RetargetPoseFromMesh`, `BoneChain`, `CurveRemapPair`, `IKRetargetAlignPoleVectorOp`, `IKRetargetAlignPoleVectorOpSettings`, `IKRetargetCopyBasePoseOp`, `IKRetargetCopyBasePoseOpSettings`, `IKRetargetCurveRemapOp`, `IKRetargetCurveRemapOpSettings`, `IKRetargetFKChainsOp`, `IKRetargetFKChainsOpSettings`, `IKRetargetIKChainsOp`, `IKRetargetIKChainsOpSettings`, `IKRetargetOpBase`, `IKRetargetOpSettingsBase`, `IKRetargetPelvisMotionOp`, `IKRetargetPelvisMotionOpSettings`, `IKRetargetPinBoneOp`, `IKRetargetPinBoneOpSettings`, ... (113 total)

---

## Classes

### `unreal.AnimNode_IKRig`
Inherits: `AnimNode_CustomProperty` | Header: `AnimNode_IKRig.h`

Anim Node IKRig

**Properties** (8):
  - `alpha`: `float` — [Read-Write] Current strength of the skeletal control (float)
  - `alpha_bool_blend`: `InputAlphaBoolBlend` — [Read-Write] (InputAlphaBoolBlend)
  - `alpha_bool_enabled`: `bool` — [Read-Write] (bool)
  - `alpha_curve_name`: `Name` — [Read-Write] (Name)
  - `alpha_input_type`: `AnimAlphaInputType` — [Read-Write] alpha value handler * (AnimAlphaInputType)
  - `alpha_scale_bias`: `InputScaleBias` — [Read-Write] (InputScaleBias)
  - `alpha_scale_bias_clamp`: `InputScaleBiasClamp` — [Read-Write] (InputScaleBiasClamp)
  - `goals`: `None` — [Read-Write] The input goal transforms used by the IK Rig solvers. (Array[IKRigGoal])

### `unreal.AnimNode_RetargetPoseFromMesh`
Inherits: `AnimNode_Base` | Header: `AnimNode_RetargetPoseFromMesh.h`

Anim Node Retarget Pose from Mesh

**Properties** (7):
  - `custom_retarget_profile`: `RetargetProfile` — [Read-Write] Connect a custom retarget profile to modify the retargeterâs settings at runtime. (Re...
  - `ik_retargeter_asset`: `IKRetargeter` — [Read-Write] Retarget asset to use. Must define a Source and Target IK Rig compatible with the Sourc...
  - `lod_threshold`: `int` — [Read-Write] Max LOD that this node is allowed to run.
For example if you have LODThreshold at 2, it...
  - `lod_threshold_for_ik`: `int` — [Read-Write] Max LOD that IK is allowed to run.
For example if you have LODThresholdForIK at 2, it w...
  - `retarget_from`: `RetargetSourceMode` — [Read-Write] Specify where to get the source pose to retarget from. Can be from the anim graph, or a...
  - `source_mesh_component`: `SkeletalMeshComponent` — [Read-Write] The Skeletal Mesh Component to retarget animation from. Assumed to be animated and tick...
  - `suppress_warnings`: `bool` — [Read-Write] Toggle whether to print warnings about missing or incorrectly configured retarget confi...

### `unreal.BoneChain`
Inherits: `StructBase` | Header: `IKRigDefinition.h`

Bone Chain

**Properties** (2):
  - `chain_name`: `Name` — [Read-Write] (Name)
  - `ik_goal_name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.CurveRemapPair`
Inherits: `StructBase` | Header: `CurveRemapOp.h`

Curve Remap Pair

**Properties** (2):
  - `source_curve`: `Name` — [Read-Write] The curve name on the SOURCE skeletal mesh to copy animation data from. (Name)
  - `target_curve`: `Name` — [Read-Write] The curve name on the TARGET skeletal mesh to receive animation data. (Name)

### `unreal.IKRetargetAlignPoleVectorOp`
Inherits: `IKRetargetOpBase` | Header: `AlignPoleVectorOp.h`

IKRetarget Align Pole Vector Op

### `unreal.IKRetargetAlignPoleVectorOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `AlignPoleVectorOp.h`

IKRetarget Align Pole Vector Op Settings

**Properties** (2):
  - `chains_to_align`: `None` — [Read-Write] (Array[RetargetPoleVectorSettings])
  - `ik_rig_asset`: `IKRigDefinition` — [Read-Write] The target IK Rig asset that contains the bones chains to retarget in this op. (IKRigDe...

### `unreal.IKRetargetCopyBasePoseOp`
Inherits: `IKRetargetOpBase` | Header: `CopyBasePoseOp.h`

IKRetarget Copy Base Pose Op

### `unreal.IKRetargetCopyBasePoseOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `CopyBasePoseOp.h`

IKRetarget Copy Base Pose Op Settings

**Properties** (2):
  - `copy_base_pose`: `bool` — [Read-Write] When true, will copy all the source bone transforms with matching names to use as a bas...
  - `copy_base_pose_root`: `Name` — [Read-Write] Filters the bones to copy when using âCopy Base Poseâ. If specified, will only copy...

### `unreal.IKRetargetCurveRemapOp`
Inherits: `IKRetargetOpBase` | Header: `CurveRemapOp.h`

IKRetarget Curve Remap Op

### `unreal.IKRetargetCurveRemapOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `CurveRemapOp.h`

IKRetarget Curve Remap Op Settings

**Properties** (3):
  - `copy_all_source_curves`: `bool` — [Read-Write] Whether to copy all curves over to the target animation instance
NOTE: This setting als...
  - `curves_to_remap`: `None` — [Read-Write] Add pairs of Source/Target curve names to remap. While retargeting, the animation from ...
  - `remap_curves`: `bool` — [Read-Write] Toggle curve remapping on/off (bool)

### `unreal.IKRetargetFKChainsOp`
Inherits: `IKRetargetOpBase` | Header: `FKChainsOp.h`

IKRetarget FKChains Op

### `unreal.IKRetargetFKChainsOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `FKChainsOp.h`

IKRetarget FKChains Op Settings

**Properties** (2):
  - `chains_to_retarget`: `None` — [Read-Write] The setting for each chain to retarget (Array[RetargetFKChainSettings])
  - `ik_rig_asset`: `IKRigDefinition` — [Read-Write] The target IK Rig asset that contains the bones chains to retarget in this op. (IKRigDe...

### `unreal.IKRetargetIKChainsOp`
Inherits: `IKRetargetOpBase` | Header: `IKChainsOp.h`

IKRetarget IKChains Op

### `unreal.IKRetargetIKChainsOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `IKChainsOp.h`

IKRetarget IKChains Op Settings

**Properties** (1):
  - `chains_to_retarget`: `None` — [Read-Write] (Array[RetargetIKChainSettings])

### `unreal.IKRetargetOpBase`
Inherits: `StructBase` | Header: `IKRetargetOps.h`

This is the base class for defining operations that live in the retargeter âopâ stack. These operations are executed in order by calling the virtual Run() function on each one in order. The Run() ...

### `unreal.IKRetargetOpSettingsBase`
Inherits: `StructBase` | Header: `IKRetargetOps.h`

This is the base class for defining editable settings for your custom retargeting operation. All user-configurable properties for your âopâ should be stored in a subclass of this. These settings w...

### `unreal.IKRetargetPelvisMotionOp`
Inherits: `IKRetargetOpBase` | Header: `PelvisMotionOp.h`

IKRetarget Pelvis Motion Op

### `unreal.IKRetargetPelvisMotionOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `PelvisMotionOp.h`

IKRetarget Pelvis Motion Op Settings

**Properties** (10):
  - `affect_ik_horizontal`: `float` — [Read-Write] Range 0 to 1. Default 1. Control whether modifications made to the pelvis will affect t...
  - `affect_ik_vertical`: `float` — [Read-Write] Range 0 to 1. Default 0. Control whether modifications made to the pelvis will affect t...
  - `blend_to_source_translation`: `float` — [Read-Write] Range 0 to 1. Default 0. Blends the retarget pelvisâ translation to the exact source ...
  - `blend_to_source_translation_weights`: `Vector` — [Read-Write] Per-axis weights for the Blend to Source. (Vector)
  - `rotation_alpha`: `float` — [Read-Write] Range 0 to 1. Default 1. Blends the amount of retargeted pelvis rotation to apply.
At 0...
  - `rotation_offset`: `Rotator` — [Read-Write] Applies a static local-space rotation offset to the retarget pelvis. (Rotator)
  - `scale_horizontal`: `float` — [Read-Write] Default 1. Scales the translation of the pelvis in the horizontal plane (X,Y). (double)
  - `scale_vertical`: `float` — [Read-Write] Default 1. Scales the translation of the pelvis in the vertical direction (Z). (double)
  - `translation_alpha`: `float` — [Read-Write] Range 0 to 1. Default 1. Blends the amount of retargeted pelvis translation to apply.
A...
  - `translation_offset`: `Vector` — [Read-Write] Applies a static component-space translation offset to the pelvis. (Vector)

### `unreal.IKRetargetPinBoneOp`
Inherits: `IKRetargetOpBase` | Header: `PinBoneOp.h`

IKRetarget Pin Bone Op

### `unreal.IKRetargetPinBoneOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `PinBoneOp.h`

IKRetarget Pin Bone Op Settings

**Properties** (9):
  - `bones_to_pin`: `None` — [Read-Write] A list of bone-pairs to copy transforms between (Array[PinBoneData])
  - `copy_rotation`: `bool` — [Read-Write] Copy the rotation of the bone. (bool)
  - `copy_scale`: `bool` — [Read-Write] Copy the scale of the bone. (bool)
  - `copy_translation`: `bool` — [Read-Write] Copy the translation of the bone. (bool)
  - `global_offset`: `Transform` — [Read-Write] A manual offset to apply in global space (Transform)
  - `local_offset`: `Transform` — [Read-Write] A manual offset to apply in local space (Transform)
  - `rotation_mode`: `PinBoneRotationMode` — [Read-Write] The method used to calculate the rotation of the bone. (PinBoneRotationMode)
  - `skeleton_to_copy_from`: `RetargetSourceOrTarget` — [Read-Write] Which skeleton to copy animation from. (RetargetSourceOrTarget)
  - `translation_mode`: `PinBoneTranslationMode` — [Read-Write] The method used to calculate the translation of the bone. (PinBoneTranslationMode)

### `unreal.IKRetargetPose`
Inherits: `StructBase` | Header: `IKRetargeter.h`

IKRetarget Pose

### `unreal.IKRetargetRootMotionOp`
Inherits: `IKRetargetOpBase` | Header: `RootMotionGeneratorOp.h`

IKRetarget Root Motion Op

### `unreal.IKRetargetRootMotionOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `RootMotionGeneratorOp.h`

IKRetarget Root Motion Op Settings

**Properties** (9):
  - `global_offset`: `Transform` — [Read-Write] A manual offset to apply in global space to the root bone. (Transform)
  - `maintain_offset_from_pelvis`: `bool` — [Read-Write] Applies only when generating root motion from the Pelvis.
Maintains the offset between ...
  - `propagate_to_non_retargeted_children`: `bool` — [Read-Write] Will transform all children of the target root that are not themselves part of a retarg...
  - `root_height_source`: `RootMotionHeightSource` — [Read-Write] How to set the height of the root bone.
Copy Height From Source: copies the height of t...
  - `root_motion_source`: `RootMotionSource` — [Read-Write] Where to copy the root motion from.
Copy From Source Root: copies the motion from the s...
  - `rotate_with_pelvis`: `bool` — [Read-Write] Applies only when generating root motion from the Pelvis.
When true, the applied offset...
  - `source_root_bone`: `Name` — [Read-Write] Changed to FBoneReference to support bone selector UI
deprecated: Property âSourceRoo...
  - `target_pelvis_bone`: `Name` — [Read-Write]
deprecated: Property âTargetPelvisBoneâ is deprecated. (Name)
  - `target_root_bone`: `Name` — [Read-Write]
deprecated: Property âTargetRootBoneâ is deprecated. (Name)

### `unreal.IKRetargetRunIKRigOp`
Inherits: `IKRetargetOpBase` | Header: `RunIKRigOp.h`

IKRetarget Run IKRig Op

### `unreal.IKRetargetRunIKRigOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `RunIKRigOp.h`

IKRetarget Run IKRig Op Settings

**Properties** (2):
  - `excluded_goals`: `None` — [Read-Write] Goals in this list will be excluded from the rig (Array[Name])
  - `ik_rig_asset`: `IKRigDefinition` — [Read-Write] The IK Rig asset to run when this op is executed. (IKRigDefinition)

### `unreal.IKRetargetScaleSourceOp`
Inherits: `IKRetargetOpBase` | Header: `ScaleSourceOp.h`

IKRetarget Scale Source Op

### `unreal.IKRetargetScaleSourceOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `ScaleSourceOp.h`

IKRetarget Scale Source Op Settings

**Properties** (1):
  - `source_scale_factor`: `float` — [Read-Write] Range 0.01 to +inf. Default 1. Scales the incoming source pose. Affects entire skeleton...

### `unreal.IKRetargetSpeedPlantingOp`
Inherits: `IKRetargetOpBase` | Header: `SpeedPlantingOp.h`

IKRetarget Speed Planting Op

### `unreal.IKRetargetSpeedPlantingOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `SpeedPlantingOp.h`

IKRetarget Speed Planting Op Settings

**Properties** (4):
  - `chains_to_speed_plant`: `None` — [Read-Write] (Array[RetargetSpeedPlantingSettings])
  - `critical_damping`: `float` — [Read-Write] How much damping to apply to the spring (0 means no damping, 1 means critically damped ...
  - `speed_threshold`: `float` — [Read-Write] Range 0 to 100. Default 15. The maximum speed a source bone can be moving while being c...
  - `stiffness`: `float` — [Read-Write] How stiff the spring model is that smoothly pulls the IK position after unplanting (mor...

### `unreal.IKRetargetStrideWarpingOp`
Inherits: `IKRetargetOpBase` | Header: `StrideWarpingOp.h`

IKRetarget Stride Warping Op

### `unreal.IKRetargetStrideWarpingOpSettings`
Inherits: `IKRetargetOpSettingsBase` | Header: `StrideWarpingOp.h`

IKRetarget Stride Warping Op Settings

**Properties** (10):
  - `chain_settings`: `None` — [Read-Write] The chains to apply stride warping to (Array[RetargetStrideWarpChainSettings])
  - `debug_draw_size`: `float` — [Read-Write] Adjust the size of the debug drawing (double)
  - `debug_draw_thickness`: `float` — [Read-Write] Adjust the thickness of the debug drawing (double)
  - `direction_chain`: `Name` — [Read-Write] When using the âChainâ option as a Direction Source, this defines the chain to use ...
  - `direction_source`: `WarpingDirectionSource` — [Read-Write] Defines the source used to determine the forward direction as the character animates in...
  - `enable_debug_draw`: `bool` — [Read-Write] Enable debug drawing for this op. (bool)
  - `forward_direction`: `BasicAxis` — [Read-Write] The world space axis that represents the forward facing direction for your character. B...
  - `sideways_offset`: `float` — [Read-Write] Range -+Inf. Default is 0. A static offset in world units to move the IK goals perpendi...
  - `warp_forwards`: `float` — [Read-Write] Range 0 to Inf. Default 1. Warps IK goal positions in the forward direction. Useful for...
  - `warp_splay`: `float` — [Read-Write] Range 0 to +Inf. Default is 1.0f.
Values below 1 pull all the goals towards the average...

### `unreal.IKRigBodyMoverGoalSettings`
Inherits: `IKRigGoalSettingsBase` | Header: `IKRigBodyMoverSolver.h`

IKRig Body Mover Goal Settings

**Properties** (2):
  - `bone_name`: `Name` [Read-Only] — [Read-Only] The bone associated with this goal. (Name)
  - `influence_multiplier`: `float` — [Read-Write] Scale the influence this goal has on the body. Range is 0-10. Default is 1.0. (float)

### `unreal.IKRigBodyMoverSettings`
Inherits: `IKRigSolverSettingsBase` | Header: `IKRigBodyMoverSolver.h`

IKRig Body Mover Settings

**Properties** (12):
  - `position_alpha`: `float` — [Read-Write] Blend the translational effect of this solver on/off. Range is 0-1. Default is 1.0. (fl...
  - `position_negative_x`: `float` — [Read-Write] Multiply the NEGATIVE X translation. Range is 0-1. Default is 1.0. (float)
  - `position_negative_y`: `float` — [Read-Write] Multiply the NEGATIVE Y translation. Range is 0-1. Default is 1.0. (float)
  - `position_negative_z`: `float` — [Read-Write] / Multiply the NEGATIVE Z translation. Range is 0-1. Default is 1.0. (float)
  - `position_positive_x`: `float` — [Read-Write] Multiply the POSITIVE X translation. Range is 0-1. Default is 1.0. (float)
  - `position_positive_y`: `float` — [Read-Write] Multiply the POSITIVE Y translation. Range is 0-1. Default is 1.0. (float)
  - `position_positive_z`: `float` — [Read-Write] Multiply the POSITIVE Z translation. Range is 0-1. Default is 1.0. (float)
  - `rotate_x_alpha`: `float` — [Read-Write] Blend the X-axis rotational effect on/off. Range is 0-1. Default is 1.0. (float)
  - `rotate_y_alpha`: `float` — [Read-Write] Blend the Y-axis rotational effect on/off. Range is 0-1. Default is 1.0. (float)
  - `rotate_z_alpha`: `float` — [Read-Write] Blend the Z-axis rotational effect on/off. Range is 0-1. Default is 1.0. (float)
  - `rotation_alpha`: `float` — [Read-Write] Blend the total rotational effect on/off. Range is 0-1. Default is 1.0. (float)
  - `start_bone`: `Name` [Read-Only] — [Read-Only] The target bone to move with the effectors. (Name)

### `unreal.IKRigBodyMoverSolver`
Inherits: `IKRigSolverBase` | Header: `IKRigBodyMoverSolver.h`

IKRig Body Mover Solver

### `unreal.IKRigBoneSettingsBase`
Inherits: `IKRigSettingsBase` | Header: `IKRigSolverBase.h`

This is the base class for defining editable per-bone settings for your custom IKRig solver. For example, your solver may have rotation limits per-bone which can be stored here. NOTE: the derived type...

**Properties** (1):
  - `bone`: `Name` [Read-Only] — [Read-Only] The bone these settings are applied to. (Name)

### `unreal.IKRigFBIKBoneSettings`
Inherits: `IKRigBoneSettingsBase` | Header: `IKRigFullBodyIK.h`

IKRig FBIKBone Settings

**Properties** (13):
  - `max_x`: `float` — [Read-Write] Range is 0 to 180 (Default is 0). Degrees of rotation in the positive X direction to al...
  - `max_y`: `float` — [Read-Write] Range is 0 to 180 (Default is 0). Degrees of rotation in the positive Y direction to al...
  - `max_z`: `float` — [Read-Write] Range is 0 to 180 (Default is 0). Degrees of rotation in the positive Z direction to al...
  - `min_x`: `float` — [Read-Write] Range is -180 to 0 (Default is 0). Degrees of rotation in the negative X direction to a...
  - `min_y`: `float` — [Read-Write] Range is -180 to 0 (Default is 0). Degrees of rotation in the negative Y direction to a...
  - `min_z`: `float` — [Read-Write] Range is -180 to 0 (Default is 0). Degrees of rotation in the negative Z direction to a...
  - `position_stiffness`: `float` — [Read-Write] Range is 0 to 1 (Default is 0). At higher values, the bone will resist translational mo...
  - `preferred_angles`: `Vector` — [Read-Write] The local Euler angles (in degrees) used to rotate this bone when the chain it belongs ...
  - `rotation_stiffness`: `float` — [Read-Write] Range is 0 to 1 (Default is 0). At higher values, the bone will resist rotating (forcin...
  - `use_preferred_angles`: `bool` — [Read-Write] When true, this bone will âpreferâ to rotate in the direction specified by the Pref...
  - `x`: `PBIKLimitType` — [Read-Write] Limit the rotation angle of the bone on the X axis.
Free: can rotate freely in this axi...
  - `y`: `PBIKLimitType` — [Read-Write] Limit the rotation angle of the bone on the Y axis.
Free: can rotate freely in this axi...
  - `z`: `PBIKLimitType` — [Read-Write] Limit the rotation angle of the bone on the Z axis.
Free: can rotate freely in this axi...

### `unreal.IKRigFBIKGoalSettings`
Inherits: `IKRigGoalSettingsBase` | Header: `IKRigFullBodyIK.h`

IKRig FBIKGoal Settings

**Properties** (5):
  - `bone_name`: `Name` [Read-Only] — [Read-Only] The bone that this effector will pull on. (Name)
  - `chain_depth`: `int` — [Read-Write] Range 0-inf (default is 0). Explicitly set the number of bones up the hierarchy to cons...
  - `pin_rotation`: `float` — [Read-Write] Range 0-1 (default is 1.0).
Blends the effector bone rotation between the rotation of t...
  - `pull_chain_alpha`: `float` — [Read-Write] Range 0-1 (default is 1.0). When enabled (greater than 0.0), the solver internally part...
  - `strength_alpha`: `float` — [Read-Write] Range 0-1 (default is 1.0). The strength of the effector when pulling the bone towards ...

### `unreal.IKRigFBIKSettings`
Inherits: `IKRigSolverSettingsBase` | Header: `IKRigFullBodyIK.h`

IKRig FBIKSettings

**Properties** (10):
  - `allow_stretch`: `bool` — [Read-Write] If true, joints will translate to reach the effectors; causing bones to lengthen if nec...
  - `global_pull_chain_alpha`: `float` — [Read-Write] A global multiplier for all Pull Chain Alpha values on all effectors. Range is 0.0 to 1...
  - `iterations`: `int` — [Read-Write] High iteration counts can help solve complex joint configurations with competing constr...
  - `mass_multiplier`: `float` — [Read-Write] A global mass multiplier; higher values will make the joints more stiff, but require mo...
  - `max_angle`: `float` — [Read-Write] Maximum angle that a joint can be rotated per constraint iteration. Lower this value if...
  - `over_relaxation`: `float` — [Read-Write] Pushes constraints beyond their normal amount to speed up convergence. Increasing this ...
  - `pre_pull_root_settings`: `RootPrePullSettings` — [Read-Write] Settings only applicable when Root Behavior is set to âPrePullâ. Use these values t...
  - `root_behavior`: `PBIKRootBehavior` — [Read-Write] (Default is PrePull) Set the behavior of the solver root.
Pre Pull: translates and rota...
  - `root_bone`: `Name` [Read-Only] — [Read-Only] All bones above this bone in the hierarchy will be completely ignored by the solver. Typ...
  - `sub_iterations`: `int` — [Read-Write] Iterations used for sub-chains defined by the Chain Depth of the effectors. These are s...

### `unreal.IKRigFullBodyIKSolver`
Inherits: `IKRigSolverBase` | Header: `IKRigFullBodyIK.h`

IKRig Full Body IKSolver

### `unreal.IKRigGoal`
Inherits: `StructBase` | Header: `IKRigDataTypes.h`

IKRig Goal

**Properties** (9):
  - `bone_name`: `Name` — [Read-Write] Name of the bone associate with this goal. (Name)
  - `name`: `Name` — [Read-Write] Name of the IK Goal. Must correspond to the name of a Goal in the target IKRig asset. (...
  - `position`: `Vector` — [Read-Write] Position of the IK goal in Component Space of target actor component. (Vector)
  - `position_alpha`: `float` — [Read-Write] Range 0-1, default is 1.0. Smoothly blends the Goal position from the input pose (0.0) ...
  - `position_space`: `IKRigGoalSpace` — [Read-Write] The space that the goal position is in.
âAdditiveâ treats the goal transform as an ...
  - `rotation`: `Rotator` — [Read-Write] Rotation of the IK goal in Component Space of target actor component. (Rotator)
  - `rotation_alpha`: `float` — [Read-Write] Range 0-1, default is 1.0. Smoothly blends the Goal rotation from the input pose (0.0) ...
  - `rotation_space`: `IKRigGoalSpace` — [Read-Write] The space that the goal rotation is in.
âAdditiveâ treats the goal transform as an ...
  - `transform_source`: `IKRigGoalTransformSource` — [Read-Write] Set the source of the transform data for the Goal.
âManual Inputâ uses the values p...

### `unreal.IKRigGoalSettingsBase`
Inherits: `IKRigSettingsBase` | Header: `IKRigSolverBase.h`

This is the base class for defining editable per-goal settings for your custom IKRig solver. For example, your solver could have a âStrengthâ value for goals, which can go here. NOTE: the derived ...

**Properties** (1):
  - `goal`: `Name` [Read-Only] — [Read-Only] The IKRig Goal that these settings are applied to. (Name)

### `unreal.IKRigLimbSolver`
Inherits: `IKRigSolverBase` | Header: `IKRigLimbSolver.h`

IKRig Limb Solver

### `unreal.IKRigLimbSolverSettings`
Inherits: `LimbSolverSettings` | Header: `IKRigLimbSolver.h`

IKRig Limb Solver Settings

**Properties** (3):
  - `end_bone`: `Name` [Read-Only] — [Read-Only] The name of the last bone in the IK chain. This is the bone you want to reach the goal. ...
  - `goal_name`: `Name` [Read-Only] — [Read-Only] The name of the IK goal to drive the end bone towards (Name)
  - `start_bone`: `Name` [Read-Only] — [Read-Only] The first bone in the IK chain, for example the âhipâ in a leg, or the âshoulderâ...

### `unreal.IKRigPoleSolver`
Inherits: `IKRigSolverBase` | Header: `IKRigPoleSolver.h`

IKRig Pole Solver

### `unreal.IKRigPoleSolverSettings`
Inherits: `IKRigSolverSettingsBase` | Header: `IKRigPoleSolver.h`

IKRig Pole Solver Settings

**Properties** (4):
  - `aim_at_goal`: `Name` [Read-Only] — [Read-Only] (Name)
  - `alpha`: `float` — [Read-Write] Blend the effect on/off. Range is 0-1. Default is 1.0. (float)
  - `end_bone`: `Name` [Read-Only] — [Read-Only] (Name)
  - `start_bone`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.IKRigSettingsBase`
Inherits: `StructBase` | Header: `IKRigSolverBase.h`

This is the base class for all types of settings used by IKRig

### `unreal.IKRigSetTransform`
Inherits: `IKRigSolverBase` | Header: `IKRigSetTransform.h`

IKRig Set Transform

### `unreal.IKRigSetTransformSettings`
Inherits: `IKRigSolverSettingsBase` | Header: `IKRigSetTransform.h`

IKRig Set Transform Settings

**Properties** (5):
  - `alpha`: `float` — [Read-Write] Blend the total effect on/off. Range is 0-1. Default is 1.0. (float)
  - `bone_to_affect`: `Name` [Read-Only] — [Read-Only] The bone to affect (Name)
  - `goal`: `Name` [Read-Only] — [Read-Only] The goal used to affect the bone transform (Name)
  - `position_alpha`: `float` — [Read-Write] Blend the translation on/off. Range is 0-1. Default is 1.0. (float)
  - `rotation_alpha`: `float` — [Read-Write] Blend the rotation on/off. Range is 0-1. Default is 1.0. (float)

### `unreal.IKRigSolverBase`
Inherits: `StructBase` | Header: `IKRigSolverBase.h`

this is the base class for creating your own solver type that integrates into the IK Rig framework/editor.

### `unreal.IKRigSolverSettingsBase`
Inherits: `IKRigSettingsBase` | Header: `IKRigSolverBase.h`

This is the base class for defining editable settings for your custom IKRig solver. All user-configurable properties for your solver should be stored in a subclass of this NOTE: the derived type must ...

### `unreal.LimbSolverSettings`
Inherits: `IKRigSolverSettingsBase` | Header: `LimbSolver.h`

Limb Solver Settings

### `unreal.PinBoneData`
Inherits: `StructBase` | Header: `PinBoneOp.h`

Pin Bone Data

**Properties** (2):
  - `bone_to_pin`: `Name` — [Read-Write] deprecated properties
deprecated: Property âBoneToPinâ is deprecated. (Name)
  - `bone_to_pin_to`: `Name` — [Read-Write]
deprecated: Property âBoneToPinToâ is deprecated. (Name)

### `unreal.RetargetChainMapping`
Inherits: `StructBase` | Header: `IKRetargetChainMapping.h`

Retarget Chain Mapping

### `unreal.RetargetDefinition`
Inherits: `StructBase` | Header: `IKRigDefinition.h`

Retarget Definition

**Properties** (2):
  - `bone_chains`: `None` — [Read-Write] (Array[BoneChain])
  - `root_bone`: `Name` — [Read-Write] (Name)

### `unreal.RetargetFKChainSettings`
Inherits: `StructBase` | Header: `FKChainsOp.h`

Retarget FKChain Settings

**Properties** (6):
  - `enable_fk`: `bool` — [Read-Write] Whether to copy the shape of the chain from the source skeleton using the Rotation and ...
  - `rotation_alpha`: `float` — [Read-Write] Range +/- infinity. Default 1. Scales the amount of rotation that is applied.
If Rotati...
  - `rotation_mode`: `FKChainRotationMode` — [Read-Write] Determines how rotation is copied from the source chain to the target chain. Default is...
  - `target_chain_name`: `Name` — [Read-Write] The name of the TARGET chain to transfer animation onto. (Name)
  - `translation_alpha`: `float` — [Read-Write] Range +/- infinity. Default 1. Scales the amount of translation that is applied. Exact ...
  - `translation_mode`: `FKChainTranslationMode` — [Read-Write] Determines how translation is copied from the source chain to the target chain. Default...

### `unreal.RetargetGlobalSettings`
Inherits: `StructBase` | Header: `IKRetargetDeprecated.h`

NOTE: Replaced IK/FK/Post toggle flags with Op-enabled flags. Warping settings now in Stride Warp Op.

**Properties** (14):
  - `copy_base_pose`: `bool` — [Read-Write]
deprecated: Property âbCopyBasePoseâ is deprecated. (bool)
  - `copy_base_pose_root`: `Name` — [Read-Write]
deprecated: Property âCopyBasePoseRootâ is deprecated. (Name)
  - `direction_chain`: `Name` — [Read-Write]
deprecated: Property âDirectionChainâ is deprecated. (Name)
  - `direction_source`: `WarpingDirectionSource` — [Read-Write]
deprecated: Property âDirectionSourceâ is deprecated. (WarpingDirectionSource)
  - `enable_fk`: `bool` — [Read-Write]
deprecated: Property âbEnableFKâ is deprecated. (bool)
  - `enable_ik`: `bool` — [Read-Write]
deprecated: Property âbEnableIKâ is deprecated. (bool)
  - `enable_post`: `bool` — [Read-Write]
deprecated: Property âbEnablePostâ is deprecated. (bool)
  - `enable_root`: `bool` — [Read-Write]
deprecated: Property âbEnableRootâ is deprecated. (bool)
  - `forward_direction`: `BasicAxis` — [Read-Write]
deprecated: Property âForwardDirectionâ is deprecated. (BasicAxis)
  - `sideways_offset`: `float` — [Read-Write]
deprecated: Property âSidewaysOffsetâ is deprecated. (float)
  - `source_scale_factor`: `float` — [Read-Write]
deprecated: Property âSourceScaleFactorâ is deprecated. (float)
  - `warp_forwards`: `float` — [Read-Write]
deprecated: Property âWarpForwardsâ is deprecated. (float)
  - `warp_splay`: `float` — [Read-Write]
deprecated: Property âWarpSplayâ is deprecated. (float)
  - `warping`: `bool` — [Read-Write]
deprecated: Property âbWarpingâ is deprecated. (bool)

### `unreal.RetargetIKChainSettings`
Inherits: `StructBase` | Header: `IKChainsOp.h`

Retarget IKChain Settings

**Properties** (11):
  - `blend_to_source`: `float` — [Read-Write] Range 0 to 1. Default 0. Blends IK goal transform from retargeted transform (0) to sour...
  - `blend_to_source_rotation`: `float` — [Read-Write] Range 0 to 1. Default 0. Blends the rotational component of BlendToSource on/off.
At 0 ...
  - `blend_to_source_translation`: `float` — [Read-Write] Range 0 to 1. Default 1. Blends the translational component of BlendToSource on/off.
At...
  - `blend_to_source_weights`: `Vector` — [Read-Write] Range 0 to 1. Default 1. Weight each axis separately when using Blend To Source.
At 0 t...
  - `enable_ik`: `bool` — [Read-Write] Whether to modify the location of the IK goal on this chain. Default is true.
NOTE: Thi...
  - `extension`: `float` — [Read-Write] Range 0 to 5. Default 1. Brings IK goal closer (0) or further (1+) from origin of chain...
  - `scale_vertical`: `float` — [Read-Write] Range 0 to infinity. Default 1. Scales the vertical component of the IK goalâs positi...
  - `static_local_offset`: `Vector` — [Read-Write] Default 0, 0, 0. Apply a static local-space offset to IK goal position. (Vector)
  - `static_offset`: `Vector` — [Read-Write] Default 0, 0, 0. Apply a static global-space offset to IK goal position. (Vector)
  - `static_rotation_offset`: `Rotator` — [Read-Write] Default 0, 0, 0. Apply a static local-space offset to IK goal rotation. (Rotator)
  - `target_chain_name`: `Name` — [Read-Write] The name of the TARGET chain to transfer animation onto. (Name)

### `unreal.RetargetOpProfile`
Inherits: `StructBase` | Header: `IKRetargetProfile.h`

Retarget Op Profile

**Properties** (2):
  - `op_to_apply_settings_to`: `Name` — [Read-Write] The name of the op these settings should be applied to.
If left at None, will apply to ...
  - `settings_to_apply`: `InstancedStruct` — [Read-Write] The settings to override for a specific op in the retargeterâs op stack.
NOTE: all se...

### `unreal.RetargetPoleVectorSettings`
Inherits: `StructBase` | Header: `AlignPoleVectorOp.h`

Retarget Pole Vector Settings

**Properties** (5):
  - `align_alpha`: `float` — [Read-Write] Range 0 to 1. Default 1. Matches the twist angle of this chain (along the Pole directio...
  - `enabled`: `bool` — [Read-Write] Enable pole vector alignment on this chain. (bool)
  - `maintain_offset`: `bool` — [Read-Write] Default is False. When true, the original angular offset between the source/target pole...
  - `static_angular_offset`: `float` — [Read-Write] Range +/- 180. Default 0. An angular offset, in degrees, for the pole direction of the ...
  - `target_chain_name`: `Name` — [Read-Write] The name of the target chain to align pole vectors on. (Name)

### `unreal.RetargetProfile`
Inherits: `StructBase` | Header: `IKRetargetProfile.h`

Retarget Profile

**Properties** (12):
  - `apply_chain_settings`: `bool` — [Read-Write] (bool)
  - `apply_global_settings`: `bool` — [Read-Write] (bool)
  - `apply_root_settings`: `bool` — [Read-Write] (bool)
  - `apply_source_retarget_pose`: `bool` — [Read-Write] If true, the Source Retarget Pose specified in this profile will be applied to the Reta...
  - `apply_target_retarget_pose`: `bool` — [Read-Write] If true, the TARGET Retarget Pose specified in this profile will be applied to the Reta...
  - `chain_settings`: `None` — [Read-Write] (Map[Name,TargetChainSettings])
  - `force_all_ik_off`: `bool` — [Read-Write] Globally forces all IK solving off (bool)
  - `global_settings`: `RetargetGlobalSettings` — [Read-Write] (RetargetGlobalSettings)
  - `retarget_op_profiles`: `None` — [Read-Write] A polymorphic list of override settings to apply to retargeting operations in the stack...
  - `root_settings`: `TargetRootSettings` — [Read-Write] (TargetRootSettings)
  - `source_retarget_pose_name`: `Name` — [Read-Write] Override the SOURCE Retarget Pose to use when this profile is active.
The pose must be ...
  - `target_retarget_pose_name`: `Name` — [Read-Write] Override the TARGET Retarget Pose to use when this profile is active.
The pose must be ...

### `unreal.RetargetSpeedPlantingSettings`
Inherits: `StructBase` | Header: `SpeedPlantingOp.h`

Retarget Speed Planting Settings

**Properties** (2):
  - `speed_curve_name`: `Name` — [Read-Write] The name of the curve on the source animation that contains the speed of the end effect...
  - `target_chain_name`: `Name` — [Read-Write] The name of the target chain to plant the IK on.
NOTE: this chain must have an IK Goal ...

### `unreal.RetargetStrideWarpChainSettings`
Inherits: `StructBase` | Header: `StrideWarpingOp.h`

Retarget Stride Warp Chain Settings

**Properties** (2):
  - `enable_stride_warping`: `bool` — [Read-Write] Whether to warp the location of the IK goal on this chain. Default is true. (bool)
  - `target_chain_name`: `Name` — [Read-Write] The name of the TARGET chain with an IK goal to warp. (Name)

### `unreal.TargetChainFKSettings`
Inherits: `StructBase` | Header: `IKRetargetDeprecated.h`

NOTE: Replaced by FK Chain Op

**Properties** (8):
  - `enable_fk`: `bool` — [Read-Write]
deprecated: Property âEnableFKâ is deprecated. (bool)
  - `pole_vector_maintain_offset`: `bool` — [Read-Write]
deprecated: Property âPoleVectorMaintainOffsetâ is deprecated. (bool)
  - `pole_vector_matching`: `float` — [Read-Write]
deprecated: Property âPoleVectorMatchingâ is deprecated. (float)
  - `pole_vector_offset`: `float` — [Read-Write]
deprecated: Property âPoleVectorOffsetâ is deprecated. (float)
  - `rotation_alpha`: `float` — [Read-Write]
deprecated: Property âRotationAlphaâ is deprecated. (float)
  - `rotation_mode`: `RetargetRotationMode` — [Read-Write]
deprecated: Property âRotationModeâ is deprecated. (RetargetRotationMode)
  - `translation_alpha`: `float` — [Read-Write]
deprecated: Property âTranslationAlphaâ is deprecated. (float)
  - `translation_mode`: `RetargetTranslationMode` — [Read-Write]
deprecated: Property âTranslationModeâ is deprecated. (RetargetTranslationMode)

### `unreal.TargetChainIKSettings`
Inherits: `StructBase` | Header: `IKRetargetDeprecated.h`

NOTE: Replaced by IK Chain Op

**Properties** (11):
  - `affected_by_ik_warping`: `bool` — [Read-Write]
deprecated: Property âbAffectedByIKWarpingâ is deprecated. (bool)
  - `blend_to_source`: `float` — [Read-Write]
deprecated: Property âBlendToSourceâ is deprecated. (float)
  - `blend_to_source_rotation`: `float` — [Read-Write]
deprecated: Property âBlendToSourceRotationâ is deprecated. (float)
  - `blend_to_source_translation`: `float` — [Read-Write]
deprecated: Property âBlendToSourceTranslationâ is deprecated. (float)
  - `blend_to_source_weights`: `Vector` — [Read-Write]
deprecated: Property âBlendToSourceWeightsâ is deprecated. (Vector)
  - `enable_ik`: `bool` — [Read-Write]
deprecated: Property âEnableIKâ is deprecated. (bool)
  - `extension`: `float` — [Read-Write]
deprecated: Property âExtensionâ is deprecated. (float)
  - `scale_vertical`: `float` — [Read-Write]
deprecated: Property âScaleVerticalâ is deprecated. (float)
  - `static_local_offset`: `Vector` — [Read-Write]
deprecated: Property âStaticLocalOffsetâ is deprecated. (Vector)
  - `static_offset`: `Vector` — [Read-Write]
deprecated: Property âStaticOffsetâ is deprecated. (Vector)
  - `static_rotation_offset`: `Rotator` — [Read-Write]
deprecated: Property âStaticRotationOffsetâ is deprecated. (Rotator)

### `unreal.TargetChainSettings`
Inherits: `StructBase` | Header: `IKRetargetDeprecated.h`

NOTE: Replaced by FK/IK Chain Ops and Speed Planting Op

**Properties** (3):
  - `fk`: `TargetChainFKSettings` — [Read-Write]
deprecated: Property âFKâ is deprecated. (TargetChainFKSettings)
  - `ik`: `TargetChainIKSettings` — [Read-Write]
deprecated: Property âIKâ is deprecated. (TargetChainIKSettings)
  - `speed_planting`: `TargetChainSpeedPlantSettings` — [Read-Write]
deprecated: Property âSpeedPlantingâ is deprecated. (TargetChainSpeedPlantSettings)

### `unreal.TargetChainSpeedPlantSettings`
Inherits: `StructBase` | Header: `IKRetargetDeprecated.h`

NOTE: Replaced by Speed Planting Op

**Properties** (5):
  - `enable_speed_planting`: `bool` — [Read-Write]
deprecated: Property âEnableSpeedPlantingâ is deprecated. (bool)
  - `speed_curve_name`: `Name` — [Read-Write]
deprecated: Property âSpeedCurveNameâ is deprecated. (Name)
  - `speed_threshold`: `float` — [Read-Write]
deprecated: Property âSpeedThresholdâ is deprecated. (float)
  - `unplant_critical_damping`: `float` — [Read-Write]
deprecated: Property âUnplantCriticalDampingâ is deprecated. (float)
  - `unplant_stiffness`: `float` — [Read-Write]
deprecated: Property âUnplantStiffnessâ is deprecated. (float)

### `unreal.TargetRootSettings`
Inherits: `StructBase` | Header: `IKRetargetDeprecated.h`

NOTE: Replaced by Pelvis Motion Op

**Properties** (10):
  - `affect_ik_horizontal`: `float` — [Read-Write]
deprecated: Property âAffectIKHorizontalâ is deprecated. (float)
  - `affect_ik_vertical`: `float` — [Read-Write]
deprecated: Property âAffectIKVerticalâ is deprecated. (float)
  - `blend_to_source`: `float` — [Read-Write]
deprecated: Property âBlendToSourceâ is deprecated. (float)
  - `blend_to_source_weights`: `Vector` — [Read-Write]
deprecated: Property âBlendToSourceWeightsâ is deprecated. (Vector)
  - `rotation_alpha`: `float` — [Read-Write]
deprecated: Property âRotationAlphaâ is deprecated. (float)
  - `rotation_offset`: `Rotator` — [Read-Write]
deprecated: Property âRotationOffsetâ is deprecated. (Rotator)
  - `scale_horizontal`: `float` — [Read-Write]
deprecated: Property âScaleHorizontalâ is deprecated. (float)
  - `scale_vertical`: `float` — [Read-Write]
deprecated: Property âScaleVerticalâ is deprecated. (float)
  - `translation_alpha`: `float` — [Read-Write]
deprecated: Property âTranslationAlphaâ is deprecated. (float)
  - `translation_offset`: `Vector` — [Read-Write]
deprecated: Property âTranslationOffsetâ is deprecated. (Vector)

### `unreal.IKGoalCreatorInterface`
Inherits: `Interface` | Header: `IKRigInterface.h`

IKGoal Creator Interface

**Methods** (1):
  - `add_ik_goals()` -> `Map [ Name , IKRigGoal ]` — Add your own goals to the OutGoals map (careful not to remove existing goals in the map!)

### `unreal.IKRetargetAlignPoleVectorController`
Inherits: `IKRetargetOpControllerBase` | Header: `AlignPoleVectorOp.h`

The blueprint/python API for editing an Align Pole Vector Op

**Methods** (2):
  - `get_settings()` -> `IKRetargetAlignPoleVectorOpSettings`
  - `set_settings(settings)` -> `None`

### `unreal.IKRetargetCopyBasePoseController`
Inherits: `IKRetargetOpControllerBase` | Header: `CopyBasePoseOp.h`

The blueprint/python API for editing a Copy Base Pose Op

**Methods** (2):
  - `get_settings()` -> `IKRetargetCopyBasePoseOpSettings`
  - `set_settings(settings)` -> `None`

### `unreal.IKRetargetCurveRemapController`
Inherits: `IKRetargetOpControllerBase` | Header: `CurveRemapOp.h`

The blueprint/python API for editing a Curve Remap Op

**Methods** (2):
  - `get_settings()` -> `IKRetargetCurveRemapOpSettings`
  - `set_settings(settings)` -> `None`

### `unreal.IKRetargeter`
Inherits: `Object` | Header: `IKRetargeter.h`

**Methods** (15):
  - `get_chain_settings_from_retarget_asset(retarget_asset, target_chain_name, optional_profile_name)` -> `TargetChainSettings` [classmethod] — Get Chain Settings from Retarget Asset deprecated: Use op profiles to get/set chain settings.
  - `get_chain_settings_from_retarget_profile(retarget_profile, retarget_profile=RetargetProfile)` [classmethod] — Get Chain Settings from Retarget Profile deprecated: Use op profiles to get/set chain settings.
  - `get_chain_using_goal_from_retarget_asset(retarget_asset, ik_goal_name)` -> `TargetChainSettings` [classmethod] — Get Chain Using Goal from Retarget Asset deprecated: Use IK Chain Op controller to get chains with goals.
  - `get_global_settings_from_retarget_asset(retarget_asset, optional_profile_name)` -> `RetargetGlobalSettings` [classmethod] — Get Global Settings from Retarget Asset deprecated: Use op profiles to get/set settings that previously used global sett...
  - `get_global_settings_from_retarget_profile(retarget_profile=RetargetProfile)` [classmethod] — Get Global Settings from Retarget Profile deprecated: Use op profiles to get/set settings that previously used global se...
  - `get_root_settings_from_retarget_asset(retarget_asset, optional_profile_name)` -> `TargetRootSettings` [classmethod] — Get Root Settings from Retarget Asset deprecated: Use op profiles to get/set pelvis settings.
  - `get_root_settings_from_retarget_profile(retarget_profile=RetargetProfile)` [classmethod] — Get Root Settings from Retarget Profile deprecated: Use op profiles to get/set pelvis settings.
  - `has_source_ik_rig()` -> `bool` — Returns true if the source IK Rig has been assigned
  - `has_target_ik_rig()` -> `bool` — Returns true if the target IK Rig has been assigned
  - `set_chain_fk_settings_in_retarget_profile(retarget_profile, fk_settings, target_chain_name)` -> `RetargetProfile` [classmethod] — Set Chain FKSettings in Retarget Profile deprecated: Use FK Chain Op profiles to get/set FK chain settings.
  - `set_chain_ik_settings_in_retarget_profile(retarget_profile, ik_settings, target_chain_name)` -> `RetargetProfile` [classmethod] — Set Chain IKSettings in Retarget Profile deprecated: Use IK Chain Op profiles to get/set IK chain settings.
  - `set_chain_settings_in_retarget_profile(retarget_profile, chain_settings, target_chain_name)` -> `RetargetProfile` [classmethod] — Set Chain Settings in Retarget Profile deprecated: Use op profiles to get/set chain settings.
  - `set_chain_speed_plant_settings_in_retarget_profile(retarget_profile, speed_plant_settings, target_chain_name)` -> `RetargetProfile` [classmethod] — Set Chain Speed Plant Settings in Retarget Profile deprecated: Use Speed Plant Op profiles to get/set speed plant settin...
  - `set_global_settings_in_retarget_profile(retarget_profile, global_settings)` -> `RetargetProfile` [classmethod] — Set the global settings in a retarget profile (will set bApplyGlobalSettings to true). deprecated: Use op profiles to ge...
  - `set_root_settings_in_retarget_profile(retarget_profile, root_settings)` -> `RetargetProfile` [classmethod] — Set Root Settings in Retarget Profile deprecated: Use op profiles to get/set settings that previously used root settings...

**Properties** (12):
  - `chain_map`: `RetargetChainMapping` — [Read-Write] BEGIN deprecated data from 5.6 refactor
deprecated: Property âChainMapâ is deprecat...
  - `chain_settings`: `None` — [Read-Write] Settings for how to map source chains to target chains.
deprecated: Use FK Chain and IK...
  - `current_retarget_pose`: `Name` — [Read-Write]
deprecated: Property âCurrentRetargetPoseâ is deprecated. (Name)
  - `global_settings`: `IKRetargetGlobalSettings` — [Read-Write] the retarget global settings
deprecated: Toggled âphasesâ is now done by enable/dis...
  - `op_stack`: `RetargetOpStack` — [Read-Write] the stack of UObject-based ops
deprecated: The pre 5.6 stack of UObject based solvers. ...
  - `retarget_fk`: `bool` — [Read-Write]
deprecated: Property âbRetargetFKâ is deprecated. (bool)
  - `retarget_ik`: `bool` — [Read-Write]
deprecated: Property âbRetargetIKâ is deprecated. (bool)
  - `retarget_poses`: `None` — [Read-Write] (OLD VERSION) Before retarget poses were stored for target AND source.
deprecated: Prop...
  - `retarget_root`: `bool` — [Read-Write]
deprecated: Property âbRetargetRootâ is deprecated. (bool)
  - `root_settings`: `RetargetRootSettings` — [Read-Write] the retarget root settings
deprecated: Use Pelvis Op settings to affect the pelvis moti...
  - `target_actor_offset`: `float` — [Read-Write]
deprecated: Property âTargetActorOffsetâ is deprecated. (float)
  - `target_actor_scale`: `float` — [Read-Write]
deprecated: Property âTargetActorScaleâ is deprecated. (float)

### `unreal.IKRetargetFKChainsController`
Inherits: `IKRetargetOpControllerBase` | Header: `FKChainsOp.h`

The blueprint/python API for editing a FK Chains Op

**Methods** (2):
  - `get_settings()` -> `IKRetargetFKChainsOpSettings`
  - `set_settings(settings)` -> `None`

### `unreal.IKRetargetGlobalSettings`
Inherits: `Object` | Header: `IKRetargetDeprecated.h`

NOTE: Phase toggles replaced by op enabled flags. Stride warp settings replaced by Stride Warp op.

**Properties** (1):
  - `settings`: `RetargetGlobalSettings` — [Read-Write]
deprecated: Property âSettingsâ is deprecated. (RetargetGlobalSettings)

### `unreal.IKRetargetIKChainsController`
Inherits: `IKRetargetOpControllerBase` | Header: `IKChainsOp.h`

The blueprint/python API for editing a IK Chains Op

**Methods** (2):
  - `get_settings()` -> `IKRetargetIKChainsOpSettings`
  - `set_settings(settings)` -> `None`

### `unreal.IKRetargetOpControllerBase`
Inherits: `Object` | Header: `IKRetargetOps.h`

This is the base class for defining a custom controller for a given retarget op type. Controllers provide an API for editing ops from blueprint or python.

### `unreal.IKRetargetPelvisMotionController`
Inherits: `IKRetargetOpControllerBase` | Header: `PelvisMotionOp.h`

The blueprint/python API for editing a Pelvis Motion Op

**Methods** (6):
  - `get_settings()` -> `IKRetargetPelvisMotionOpSettings`
  - `get_source_pelvis_bone()` -> `Name`
  - `get_target_pelvis_bone()` -> `Name`
  - `set_settings(settings)` -> `None`
  - `set_source_pelvis_bone(source_pelvis_bone)` -> `None`
  - `set_target_pelvis_bone(target_pelvis_bone)` -> `None`

### `unreal.IKRetargetPinBoneController`
Inherits: `IKRetargetOpControllerBase` | Header: `PinBoneOp.h`

The blueprint/python API for editing a Pin Bone Op

**Methods** (5):
  - `clear_all_bone_pairs()` -> `None` — Clear all the bone pairs
  - `get_all_bone_pairs()` -> `Map [ Name , Name ]`
  - `get_settings()` -> `IKRetargetPinBoneOpSettings`
  - `set_bone_pair(bone_to_copy_from, bone_to_copy_to)` -> `None`
  - `set_settings(settings)` -> `None`

### `unreal.IKRetargetRootMotionController`
Inherits: `IKRetargetOpControllerBase` | Header: `RootMotionGeneratorOp.h`

The blueprint/python API for editing a Root Motion Op

**Methods** (8):
  - `get_settings()` -> `IKRetargetRootMotionOpSettings`
  - `get_source_root_bone()` -> `Name`
  - `get_target_pelvis_bone()` -> `Name`
  - `get_target_root_bone()` -> `Name`
  - `set_settings(settings)` -> `None`
  - `set_source_root_bone(source_root_bone)` -> `None`
  - `set_target_pelvis_bone(target_pelvis_bone)` -> `None`
  - `set_target_root_bone(target_root_bone)` -> `None`

### `unreal.IKRetargetRunIKRigController`
Inherits: `IKRetargetOpControllerBase` | Header: `RunIKRigOp.h`

The blueprint/python API for editing a Run IK Rig Op

**Methods** (2):
  - `get_settings()` -> `IKRetargetRunIKRigOpSettings`
  - `set_settings(settings)` -> `None`

### `unreal.IKRetargetScaleSourceController`
Inherits: `IKRetargetOpControllerBase` | Header: `ScaleSourceOp.h`

The blueprint/python API for editing a Scale Source Op

**Methods** (2):
  - `get_settings()` -> `IKRetargetScaleSourceOpSettings`
  - `set_settings(settings)` -> `None`

### `unreal.IKRetargetSpeedPlantingController`
Inherits: `IKRetargetOpControllerBase` | Header: `SpeedPlantingOp.h`

The blueprint/python API for editing a Speed Planting Op

**Methods** (2):
  - `get_settings()` -> `IKRetargetSpeedPlantingOpSettings`
  - `set_settings(settings)` -> `None`

### `unreal.IKRetargetStrideWarpingController`
Inherits: `IKRetargetOpControllerBase` | Header: `StrideWarpingOp.h`

The blueprint/python API for editing a Stride Warping Op

**Methods** (2):
  - `get_settings()` -> `IKRetargetStrideWarpingOpSettings`
  - `set_settings(settings)` -> `None`

### `unreal.IKRigBodyMoverController`
Inherits: `IKRigSolverControllerBase` | Header: `IKRigBodyMoverSolver.h`

The blueprint/python API for modifying a Body Mover solverâs settings in an IK Rig. * Can adjust Solver and Goal settings.

**Methods** (4):
  - `get_goal_settings(goal_name)` -> `IKRigBodyMoverGoalSettings`
  - `get_solver_settings()` -> `IKRigBodyMoverSettings`
  - `set_goal_settings(goal_name, settings)` -> `None`
  - `set_solver_settings(settings)` -> `None`

### `unreal.IKRigComponent`
Inherits: `ActorComponent` | Header: `IKRigComponent.h`

IKRig Component

**Methods** (5):
  - `add_ik_goals()` -> `Map [ Name , IKRigGoal ]` — Add your own goals to the OutGoals map (careful not to remove existing goals in the map!)
  - `clear_all_goals()` -> `None` — Remove all stored goals in this component.
  - `set_ik_rig_goal(goal)` -> `None` — Apply a IKRigGoal and store it on this rig. Goal transform assumed in Component Space of Skeletal Mesh.
  - `set_ik_rig_goal_position_and_rotation(goal_name, position, rotation, position_alpha, rotation_alpha)` -> `None` — Set an IK Rig Goal position and rotation (assumed in Component Space of Skeletal Mesh) with separate alpha values.
  - `set_ik_rig_goal_transform(goal_name, transform, position_alpha, rotation_alpha)` -> `None` — Set an IK Rig Goal transform (assumed in Component Space of Skeletal Mesh) with separate alpha values.

### `unreal.IKRigDefinition`
Inherits: `Object` | Header: `IKRigDefinition.h`

IKRig Definition

**Properties** (1):
  - `solvers`: `None` — [Read-Write]
deprecated: The pre 5.6 stack of UObject based solvers. Use SolverStack instead. (Array...

### `unreal.IKRigEffectorGoal`
Inherits: `Object` | Header: `IKRigDefinition.h`

IKRig Effector Goal

**Properties** (11):
  - `bone_name`: `Name` [Read-Only] — [Read-Only] The name of the bone that this Goal is located at. (Name)
  - `current_transform`: `Transform` — [Read-Write] The current transform of this Goal, in the Global Space of the character. (Transform)
  - `expose_position`: `bool` — [Read-Write] Should position data be exposed in Blueprint (bool)
  - `expose_rotation`: `bool` — [Read-Write] Should rotation data be exposed in Blueprint (bool)
  - `goal_name`: `Name` [Read-Only] — [Read-Only] The name used to refer to this goal from outside systems.
This is the name to use when r...
  - `initial_transform`: `Transform` [Read-Only] — [Read-Only] The initial transform of this Goal, as defined by the initial transform of the Goalâs ...
  - `position_alpha`: `float` — [Read-Write] Range 0-1, default is 1. Blend between the input bone position (0.0) and the current go...
  - `preview_mode`: `IKRigGoalPreviewMode` — [Read-Write] Effects how this Goal transform is previewed in the IK Rig editor.
âAdditiveâ inter...
  - `rotation_alpha`: `float` — [Read-Write] Range 0-1, default is 1. Blend between the input bone rotation (0.0) and the current go...
  - `size_multiplier`: `float` — [Read-Write] The size of the Goal gizmo drawing in the editor viewport. (float)
  - `thickness_multiplier`: `float` — [Read-Write] The thickness of the Goal gizmo drawing in the editor viewport. (float)

### `unreal.IKRigFBIKController`
Inherits: `IKRigSolverControllerBase` | Header: `IKRigFullBodyIK.h`

The blueprint/python API for modifying an Full-Body IK solverâs settings in an IK Rig. * Can adjust Solver, Goal and Bone settings.

**Methods** (6):
  - `get_bone_settings(bone_name)` -> `IKRigFBIKBoneSettings`
  - `get_goal_settings(goal_name)` -> `IKRigFBIKGoalSettings`
  - `get_solver_settings()` -> `IKRigFBIKSettings`
  - `set_bone_settings(bone_name, settings)` -> `None`
  - `set_goal_settings(goal_name, settings)` -> `None`
  - `set_solver_settings(settings)` -> `None`

### `unreal.IKRigLimbSolverController`
Inherits: `IKRigSolverControllerBase` | Header: `IKRigLimbSolver.h`

The blueprint/python API for modifying an Full-Body IK solverâs settings in an IK Rig. * Can adjust Solver, Goal and Bone settings.

**Methods** (2):
  - `get_solver_settings()` -> `IKRigLimbSolverSettings`
  - `set_solver_settings(settings)` -> `None`

### `unreal.IKRigPoleSolverController`
Inherits: `IKRigSolverControllerBase` | Header: `IKRigPoleSolver.h`

The blueprint/python API for modifying a Pole solverâs settings in an IK Rig.

**Methods** (2):
  - `get_solver_settings()` -> `IKRigPoleSolverSettings`
  - `set_solver_settings(settings)` -> `None`

### `unreal.IKRigSetTransformController`
Inherits: `IKRigSolverControllerBase` | Header: `IKRigSetTransform.h`

The blueprint/python API for modifying Set Transform settings in an IK Rig.

**Methods** (2):
  - `get_solver_settings()` -> `IKRigSetTransformSettings`
  - `set_solver_settings(settings)` -> `None`

### `unreal.IKRigSolver`
Inherits: `Object` | Header: `IKRigSolverBase.h`

NOTE on UIKRigSolver upgrade path: In 5.6 the UObjectâs in IK Rig have been replaced with runtime-friendly UStruct based data structures As part of this change, solvers based on UIKRigSolver will no...

### `unreal.IKRigSolverControllerBase`
Inherits: `Object` | Header: `IKRigSolverBase.h`

IKRig Solver Controller Base

**Methods** (2):
  - `get_enabled()` -> `bool`
  - `set_enabled(is_enabled)` -> `None`

### `unreal.RetargetChainSettings`
Inherits: `Object` | Header: `IKRetargetDeprecated.h`

NOTE: Replaced with IK/FK Chains Op and new mapping data.

**Properties** (20):
  - `blend_to_source`: `float` — [Read-Write]
deprecated: Property âBlendToSourceâ is deprecated. (float)
  - `blend_to_source_weights`: `Vector` — [Read-Write]
deprecated: Property âBlendToSourceWeightsâ is deprecated. (Vector)
  - `copy_pose_using_fk`: `bool` — [Read-Write] Deprecated properties from before FTargetChainSettings / profile refactor  (July 2022)
...
  - `drive_ik_goal`: `bool` — [Read-Write]
deprecated: Property âDriveIKGoalâ is deprecated. (bool)
  - `extension`: `float` — [Read-Write]
deprecated: Property âExtensionâ is deprecated. (float)
  - `rotation_alpha`: `float` — [Read-Write]
deprecated: Property âRotationAlphaâ is deprecated. (float)
  - `rotation_mode`: `RetargetRotationMode` — [Read-Write]
deprecated: Property âRotationModeâ is deprecated. (RetargetRotationMode)
  - `settings`: `TargetChainSettings` — [Read-Write]
deprecated: Property âSettingsâ is deprecated. (TargetChainSettings)
  - `source_chain`: `Name` — [Read-Write] Deprecated properties from 5.6 Op-stack refactor
deprecated: Property âSourceChainâ...
  - `speed_curve_name`: `Name` — [Read-Write]
deprecated: Property âSpeedCurveNameâ is deprecated. (Name)
  - `static_local_offset`: `Vector` — [Read-Write]
deprecated: Property âStaticLocalOffsetâ is deprecated. (Vector)
  - `static_offset`: `Vector` — [Read-Write]
deprecated: Property âStaticOffsetâ is deprecated. (Vector)
  - `static_rotation_offset`: `Rotator` — [Read-Write]
deprecated: Property âStaticRotationOffsetâ is deprecated. (Rotator)
  - `target_chain`: `Name` — [Read-Write]
deprecated: Property âTargetChainâ is deprecated. (Name)
  - `translation_alpha`: `float` — [Read-Write]
deprecated: Property âTranslationAlphaâ is deprecated. (float)
  - `translation_mode`: `RetargetTranslationMode` — [Read-Write]
deprecated: Property âTranslationModeâ is deprecated. (RetargetTranslationMode)
  - `unplant_critical_damping`: `float` — [Read-Write]
deprecated: Property âUnplantCriticalDampingâ is deprecated. (float)
  - `unplant_stiffness`: `float` — [Read-Write]
deprecated: Property âUnplantStiffnessâ is deprecated. (float)
  - `use_speed_curve_to_plant_ik`: `bool` — [Read-Write]
deprecated: Property âUseSpeedCurveToPlantIKâ is deprecated. (bool)
  - `velocity_threshold`: `float` — [Read-Write]
deprecated: Property âVelocityThresholdâ is deprecated. (float)

### `unreal.RetargetOpStack`
Inherits: `Object` | Header: `IKRetargetOps.h`

NOTE: This type is no longer in use except to load old stacks of UObject-based ops.

### `unreal.RetargetProfileLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `IKRetargetProfile.h`

Retarget Profile Library

**Methods** (2):
  - `copy_retarget_profile_from_retarget_asset(retarget_asset)` -> `RetargetProfile` [classmethod] — Copy Retarget Profile from Retarget Asset
  - `get_op_controller_from_retarget_profile(retarget_profile, retarget_profile=RetargetProfile)` [classmethod] — Get Op Controller from Retarget Profile

### `unreal.RetargetRootSettings`
Inherits: `Object` | Header: `IKRetargetDeprecated.h`

NOTE: Replaced by Pelvis Op and itâs settings.

**Properties** (7):
  - `blend_to_source`: `Vector` — [Read-Write]
deprecated: Property âBlendToSourceâ is deprecated. (Vector)
  - `global_scale_horizontal`: `float` — [Read-Write]
deprecated: Property âGlobalScaleHorizontalâ is deprecated. (float)
  - `global_scale_vertical`: `float` — [Read-Write]
deprecated: Property âGlobalScaleVerticalâ is deprecated. (float)
  - `retarget_root_translation`: `bool` — [Read-Write] Deprecated properties from before FTargetRootSettings / profile refactor
deprecated: Pr...
  - `settings`: `TargetRootSettings` — [Read-Write] deprecated in 5.6 op refactor
deprecated: Property âSettingsâ is deprecated. (Targe...
  - `static_offset`: `Vector` — [Read-Write]
deprecated: Property âStaticOffsetâ is deprecated. (Vector)
  - `static_rotation_offset`: `Rotator` — [Read-Write]
deprecated: Property âStaticRotationOffsetâ is deprecated. (Rotator)

### `unreal.AutoMapChainType`
Inherits: `EnumBase` | Header: `IKRetargetChainMapping.h`

EAuto Map Chain Type

**Properties** (3):
  - `CLEAR`: `AutoMapChainType = Ellipsis` — map chains to the chain with the closest name (levenshtein distance) 2
  - `EXACT`: `AutoMapChainType = Ellipsis` — 0
  - `FUZZY`: `AutoMapChainType = Ellipsis` — map chains that have exactly the same name (case insensitive) 1

### `unreal.BasicAxis`
Inherits: `EnumBase` | Header: `IKRetargetSettings.h`

EBasic Axis

**Properties** (6):
  - `NEG_X`: `BasicAxis = Ellipsis` — 3
  - `NEG_Y`: `BasicAxis = Ellipsis` — 4
  - `NEG_Z`: `BasicAxis = Ellipsis` — 5
  - `X`: `BasicAxis = Ellipsis` — 0
  - `Y`: `BasicAxis = Ellipsis` — 1
  - `Z`: `BasicAxis = Ellipsis` — 2

### `unreal.FKChainRotationMode`
Inherits: `EnumBase` | Header: `FKChainsOp.h`

EFKChain Rotation Mode

**Properties** (6):
  - `INTERPOLATED`: `FKChainRotationMode = Ellipsis` — 0
  - `MATCH_CHAIN`: `FKChainRotationMode = Ellipsis` — 3
  - `MATCH_SCALED_CHAIN`: `FKChainRotationMode = Ellipsis` — 4
  - `NONE`: `FKChainRotationMode = Ellipsis` — 5
  - `ONE_TO_ONE`: `FKChainRotationMode = Ellipsis` — 1
  - `ONE_TO_ONE_REVERSED`: `FKChainRotationMode = Ellipsis` — 2

### `unreal.FKChainTranslationMode`
Inherits: `EnumBase` | Header: `FKChainsOp.h`

EFKChain Translation Mode

**Properties** (5):
  - `ABSOLUTE`: `FKChainTranslationMode = Ellipsis` — 2
  - `GLOBALLY_SCALED`: `FKChainTranslationMode = Ellipsis` — 1
  - `NONE`: `FKChainTranslationMode = Ellipsis` — 0
  - `STRETCH_BONE_LENGTH_NON_UNIFORMLY`: `FKChainTranslationMode = Ellipsis` — 4
  - `STRETCH_BONE_LENGTH_UNIFORMLY`: `FKChainTranslationMode = Ellipsis` — 3

### `unreal.IKRigGoalPreviewMode`
Inherits: `EnumBase` | Header: `IKRigDefinition.h`

EIKRig Goal Preview Mode

**Properties** (2):
  - `ABSOLUTE`: `IKRigGoalPreviewMode = Ellipsis` — 1
  - `ADDITIVE`: `IKRigGoalPreviewMode = Ellipsis` — 0

### `unreal.IKRigGoalSpace`
Inherits: `EnumBase` | Header: `IKRigDataTypes.h`

EIKRig Goal Space

**Properties** (3):
  - `ADDITIVE`: `IKRigGoalSpace = Ellipsis` — 1
  - `COMPONENT`: `IKRigGoalSpace = Ellipsis` — 0
  - `WORLD`: `IKRigGoalSpace = Ellipsis` — 2

### `unreal.IKRigGoalTransformSource`
Inherits: `EnumBase` | Header: `IKRigDataTypes.h`

EIKRig Goal Transform Source

**Properties** (3):
  - `ACTOR_COMPONENT`: `IKRigGoalTransformSource = Ellipsis` — 2
  - `BONE`: `IKRigGoalTransformSource = Ellipsis` — 1
  - `MANUAL`: `IKRigGoalTransformSource = Ellipsis` — 0

### `unreal.PinBoneRotationMode`
Inherits: `EnumBase` | Header: `PinBoneOp.h`

EPin Bone Rotation Mode

**Properties** (2):
  - `COPY_GLOBAL_ROTATION`: `PinBoneRotationMode = Ellipsis` — no offset is maintained 0
  - `MAINTAIN_OFFSET_FROM_BONE_TO_COPY_FROM`: `PinBoneRotationMode = Ellipsis` — maintains rotation offset between BoneToCopyTo and BoneToCopyFrom in the reference pose 1

### `unreal.PinBoneTranslationMode`
Inherits: `EnumBase` | Header: `PinBoneOp.h`

EPin Bone Translation Mode

**Properties** (5):
  - `COPY_GLOBAL_POSITION`: `PinBoneTranslationMode = Ellipsis` — Copy the global position of BoneToCopyFrom 0
  - `COPY_GLOBAL_POSITION_AND_MAINTAIN_OFFSET`: `PinBoneTranslationMode = Ellipsis` — Copy the global position of BoneToCopyFrom, and add the local offset between BoneToCopyFrom and Bone...
  - `COPY_LOCAL_POSITION`: `PinBoneTranslationMode = Ellipsis` — Copy the local translation (relative to parent), in global space, from BoneToCopyFrom to BoneToCopyT...
  - `COPY_LOCAL_POSITION_RELATIVE_OFFSET`: `PinBoneTranslationMode = Ellipsis` — Copy the local translation, in global space, from BoneToCopyFrom to BoneToCopyTo and add the differe...
  - `COPY_LOCAL_POSITION_RELATIVE_SCALED`: `PinBoneTranslationMode = Ellipsis` — Copy the local translation, in global space, from BoneToCopyFrom to BoneToCopyTo and scale by the re...

### `unreal.RetargetRotationMode`
Inherits: `EnumBase` | Header: `IKRetargetDeprecated.h`

NOTE: Replaced by FK Chain Op

**Properties** (6):
  - `INTERPOLATED`: `RetargetRotationMode = Ellipsis` — 0
  - `MATCH_CHAIN`: `RetargetRotationMode = Ellipsis` — 3
  - `MATCH_SCALED_CHAIN`: `RetargetRotationMode = Ellipsis` — 4
  - `NONE`: `RetargetRotationMode = Ellipsis` — 5
  - `ONE_TO_ONE`: `RetargetRotationMode = Ellipsis` — 1
  - `ONE_TO_ONE_REVERSED`: `RetargetRotationMode = Ellipsis` — 2

### `unreal.RetargetSourceMode`
Inherits: `EnumBase` | Header: `AnimNode_RetargetPoseFromMesh.h`

ERetarget Source Mode

**Properties** (3):
  - `CUSTOM_SKELETAL_MESH_COMPONENT`: `RetargetSourceMode = Ellipsis` — 1
  - `PARENT_SKELETAL_MESH_COMPONENT`: `RetargetSourceMode = Ellipsis` — 0
  - `SOURCE_POSE_PIN`: `RetargetSourceMode = Ellipsis` — 2

### `unreal.RetargetSourceOrTarget`
Inherits: `EnumBase` | Header: `IKRetargetSettings.h`

which skeleton are we referring to?

**Properties** (2):
  - `SOURCE`: `RetargetSourceOrTarget = Ellipsis` — the SOURCE skeleton (to copy FROM) 0
  - `TARGET`: `RetargetSourceOrTarget = Ellipsis` — the TARGET skeleton (to copy TO) 1

### `unreal.RetargetTranslationMode`
Inherits: `EnumBase` | Header: `IKRetargetDeprecated.h`

NOTE: Replaced by FK Chain Op

**Properties** (5):
  - `ABSOLUTE`: `RetargetTranslationMode = Ellipsis` — 2
  - `GLOBALLY_SCALED`: `RetargetTranslationMode = Ellipsis` — 1
  - `NONE`: `RetargetTranslationMode = Ellipsis` — 0
  - `STRETCH_BONE_LENGTH_NON_UNIFORMLY`: `RetargetTranslationMode = Ellipsis` — 4
  - `STRETCH_BONE_LENGTH_UNIFORMLY`: `RetargetTranslationMode = Ellipsis` — 3

### `unreal.RootMotionHeightSource`
Inherits: `EnumBase` | Header: `RootMotionGeneratorOp.h`

where to copy the height of the root from

**Properties** (2):
  - `COPY_HEIGHT_FROM_SOURCE`: `RootMotionHeightSource = Ellipsis` — 0
  - `SNAP_TO_GROUND`: `RootMotionHeightSource = Ellipsis` — 1

### `unreal.RootMotionSource`
Inherits: `EnumBase` | Header: `RootMotionGeneratorOp.h`

where to copy the motion of the root from

**Properties** (2):
  - `COPY_FROM_SOURCE_ROOT`: `RootMotionSource = Ellipsis` — 0
  - `GENERATE_FROM_TARGET_PELVIS`: `RootMotionSource = Ellipsis` — 1

### `unreal.WarpingDirectionSource`
Inherits: `EnumBase` | Header: `StrideWarpingOp.h`

EWarping Direction Source

**Properties** (3):
  - `CHAIN`: `WarpingDirectionSource = Ellipsis` — 1
  - `GOALS`: `WarpingDirectionSource = Ellipsis` — 0
  - `ROOT_BONE`: `WarpingDirectionSource = Ellipsis` — 2
