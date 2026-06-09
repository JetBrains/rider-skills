# UE Python API — AnimGraph Module

**96 types** from the `AnimGraph` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimBlueprintFunctionPinInfo`, `AnimationBlendSpaceSampleGraph`, `AnimationCustomTransitionGraph`, `AnimationGraph`, `AnimationStateGraph`, `AnimationTransitionGraph`, `AnimGraphNode_AimOffsetLookAt`, `AnimGraphNode_AnimDynamics`, `AnimGraphNode_ApplyAdditive`, `AnimGraphNode_ApplyLimits`, `AnimGraphNode_ApplyMeshSpaceAdditive`, `AnimGraphNode_AssetPlayerBase`, `AnimGraphNode_Base`, `AnimGraphNode_BlendBoneByChannel`, `AnimGraphNode_BlendListBase`, `AnimGraphNode_BlendListByBool`, `AnimGraphNode_BlendListByEnum`, `AnimGraphNode_BlendListByInt`, `AnimGraphNode_BlendSpaceBase`, `AnimGraphNode_BlendSpaceEvaluator`, ... (96 total)

---

## Classes

### `unreal.AnimBlueprintFunctionPinInfo`
Inherits: `StructBase` | Header: `AnimGraphNode_LinkedInputPose.h`

Required info for reconstructing a manually specified pin

### `unreal.AnimationBlendSpaceSampleGraph`
Inherits: `AnimationGraph` | Header: `AnimationBlendSpaceSampleGraph.h`

Animation Blend Space Sample Graph

### `unreal.AnimationCustomTransitionGraph`
Inherits: `AnimationGraph` | Header: `AnimationCustomTransitionGraph.h`

Animation Custom Transition Graph

### `unreal.AnimationGraph`
Inherits: `EdGraph` | Header: `AnimationGraph.h`

Animation Graph

**Methods** (1):
  - `get_graph_nodes_of_class(node_class, include_child_classes = True)` -> `Array [ AnimGraphNode_Base ]` — Returns contained graph nodes of the specified (or child) class

### `unreal.AnimationStateGraph`
Inherits: `AnimationGraph` | Header: `AnimationStateGraph.h`

Animation State Graph

### `unreal.AnimationTransitionGraph`
Inherits: `AnimationGraph` | Header: `AnimationTransitionGraph.h`

Animation Transition Graph

### `unreal.AnimGraphNode_AimOffsetLookAt`
Inherits: `AnimGraphNode_BlendSpaceBase` | Header: `AnimGraphNode_AimOffsetLookAt.h`

Anim Graph Node Aim Offset Look At

### `unreal.AnimGraphNode_AnimDynamics`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_AnimDynamics.h`

Anim Graph Node Anim Dynamics

### `unreal.AnimGraphNode_ApplyAdditive`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_ApplyAdditive.h`

Anim Graph Node Apply Additive

### `unreal.AnimGraphNode_ApplyLimits`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_ApplyLimits.h`

Anim Graph Node Apply Limits

### `unreal.AnimGraphNode_ApplyMeshSpaceAdditive`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_ApplyMeshSpaceAdditive.h`

Anim Graph Node Apply Mesh Space Additive

### `unreal.AnimGraphNode_AssetPlayerBase`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_AssetPlayerBase.h`

Helper / intermediate for asset player graphical nodes

### `unreal.AnimGraphNode_Base`
Inherits: `K2Node` | Header: `AnimGraphNode_Base.h`

This is the base class for any animation graph nodes that generate or consume an animation pose in the animation blend graph.

### `unreal.AnimGraphNode_BlendBoneByChannel`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_BlendBoneByChannel.h`

Anim Graph Node Blend Bone by Channel

### `unreal.AnimGraphNode_BlendListBase`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_BlendListBase.h`

Anim Graph Node Blend List Base

### `unreal.AnimGraphNode_BlendListByBool`
Inherits: `AnimGraphNode_BlendListBase` | Header: `AnimGraphNode_BlendListByBool.h`

Anim Graph Node Blend List by Bool

### `unreal.AnimGraphNode_BlendListByEnum`
Inherits: `AnimGraphNode_BlendListBase` | Header: `AnimGraphNode_BlendListByEnum.h`

Anim Graph Node Blend List by Enum

### `unreal.AnimGraphNode_BlendListByInt`
Inherits: `AnimGraphNode_BlendListBase` | Header: `AnimGraphNode_BlendListByInt.h`

Anim Graph Node Blend List by Int

### `unreal.AnimGraphNode_BlendSpaceBase`
Inherits: `AnimGraphNode_AssetPlayerBase` | Header: `AnimGraphNode_BlendSpaceBase.h`

Anim Graph Node Blend Space Base

### `unreal.AnimGraphNode_BlendSpaceEvaluator`
Inherits: `AnimGraphNode_BlendSpaceBase` | Header: `AnimGraphNode_BlendSpaceEvaluator.h`

Anim Graph Node Blend Space Evaluator

### `unreal.AnimGraphNode_BlendSpaceGraph`
Inherits: `AnimGraphNode_BlendSpaceGraphBase` | Header: `AnimGraphNode_BlendSpaceGraph.h`

Anim Graph Node Blend Space Graph

### `unreal.AnimGraphNode_BlendSpaceGraphBase`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_BlendSpaceGraphBase.h`

Anim Graph Node Blend Space Graph Base

### `unreal.AnimGraphNode_BlendSpacePlayer`
Inherits: `AnimGraphNode_BlendSpaceBase` | Header: `AnimGraphNode_BlendSpacePlayer.h`

Anim Graph Node Blend Space Player

### `unreal.AnimGraphNode_BlendSpaceSampleResult`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_BlendSpaceSampleResult.h`

Anim Graph Node Blend Space Sample Result

### `unreal.AnimGraphNode_BoneDrivenController`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_BoneDrivenController.h`

This is the âsource versionâ of a bone driven controller, which maps part of the state from one bone to another (e.g., 2 * source.x -> target.z)

### `unreal.AnimGraphNode_CallFunction`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_CallFunction.h`

Anim Graph Node Call Function

### `unreal.AnimGraphNode_CCDIK`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_CCDIK.h`

Editor node for CCDIK IK skeletal controller

### `unreal.AnimGraphNode_ComponentToLocalSpace`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_ComponentToLocalSpace.h`

Anim Graph Node Component to Local Space

### `unreal.AnimGraphNode_Constraint`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_Constraint.h`

Anim Graph Node Constraint

### `unreal.AnimGraphNode_CopyBone`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_CopyBone.h`

Anim Graph Node Copy Bone

### `unreal.AnimGraphNode_CopyBoneDelta`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_CopyBoneDelta.h`

Anim Graph Node Copy Bone Delta

### `unreal.AnimGraphNode_CopyPoseFromMesh`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_CopyPoseFromMesh.h`

Anim Graph Node Copy Pose from Mesh

### `unreal.AnimGraphNode_CurveSource`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_CurveSource.h`

Supply curves from some external source (e.g. audio)

### `unreal.AnimGraphNode_CustomProperty`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_CustomProperty.h`

Anim Graph Node Custom Property

### `unreal.AnimGraphNode_CustomTransitionResult`
Inherits: `AnimGraphNode_StateResult` | Header: `AnimGraphNode_CustomTransitionResult.h`

Anim Graph Node Custom Transition Result

### `unreal.AnimGraphNode_DeadBlending`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_DeadBlending.h`

Anim Graph Node Dead Blending

### `unreal.AnimGraphNode_Fabrik`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_Fabrik.h`

Editor node for FABRIK IK skeletal controller

### `unreal.AnimGraphNode_HandIKRetargeting`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_HandIKRetargeting.h`

Anim Graph Node Hand IKRetargeting

### `unreal.AnimGraphNode_IdentityPose`
Inherits: `AnimGraphNode_RefPoseBase` | Header: `AnimGraphNode_IdentityPose.h`

Anim Graph Node Identity Pose

### `unreal.AnimGraphNode_Inertialization`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_Inertialization.h`

Anim Graph Node Inertialization

### `unreal.AnimGraphNode_LayeredBoneBlend`
Inherits: `AnimGraphNode_BlendListBase` | Header: `AnimGraphNode_LayeredBoneBlend.h`

Anim Graph Node Layered Bone Blend

### `unreal.AnimGraphNode_LegIK`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_LegIK.h`

Anim Graph Node Leg IK

### `unreal.AnimGraphNode_LinkedAnimGraph`
Inherits: `AnimGraphNode_LinkedAnimGraphBase` | Header: `AnimGraphNode_LinkedAnimGraph.h`

Anim Graph Node Linked Anim Graph

### `unreal.AnimGraphNode_LinkedAnimGraphBase`
Inherits: `AnimGraphNode_CustomProperty` | Header: `AnimGraphNode_LinkedAnimGraphBase.h`

Anim Graph Node Linked Anim Graph Base

### `unreal.AnimGraphNode_LinkedAnimLayer`
Inherits: `AnimGraphNode_LinkedAnimGraphBase` | Header: `AnimGraphNode_LinkedAnimLayer.h`

Anim Graph Node Linked Anim Layer

### `unreal.AnimGraphNode_LinkedInputPose`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_LinkedInputPose.h`

Anim Graph Node Linked Input Pose

### `unreal.AnimGraphNode_LocalRefPose`
Inherits: `AnimGraphNode_RefPoseBase` | Header: `AnimGraphNode_LocalRefPose.h`

Anim Graph Node Local Ref Pose

### `unreal.AnimGraphNode_LocalToComponentSpace`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_LocalToComponentSpace.h`

Anim Graph Node Local to Component Space

### `unreal.AnimGraphNode_LookAt`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_LookAt.h`

Anim Graph Node Look At

### `unreal.AnimGraphNode_MakeDynamicAdditive`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_MakeDynamicAdditive.h`

Anim Graph Node Make Dynamic Additive

### `unreal.AnimGraphNode_MeshRefPose`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_MeshRefPose.h`

Anim Graph Node Mesh Ref Pose

### `unreal.AnimGraphNode_Mirror`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_Mirror.h`

Anim Graph Node Mirror

### `unreal.AnimGraphNode_ModifyBone`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_ModifyBone.h`

Anim Graph Node Modify Bone

### `unreal.AnimGraphNode_ModifyCurve`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_ModifyCurve.h`

Easy way to modify curve values on a pose

### `unreal.AnimGraphNode_MultiWayBlend`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_MultiWayBlend.h`

Anim Graph Node Multi Way Blend

### `unreal.AnimGraphNode_ObserveBone`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_ObserveBone.h`

This allows you to observe the state of a bone at a particular point in the graph, showing it in any space and optionally relative to the reference pose

### `unreal.AnimGraphNode_PoseBlendNode`
Inherits: `AnimGraphNode_PoseHandler` | Header: `AnimGraphNode_PoseBlendNode.h`

Anim Graph Node Pose Blend Node

### `unreal.AnimGraphNode_PoseByName`
Inherits: `AnimGraphNode_AssetPlayerBase` | Header: `AnimGraphNode_PoseByName.h`

Anim Graph Node Pose by Name

### `unreal.AnimGraphNode_PoseDriver`
Inherits: `AnimGraphNode_PoseHandler` | Header: `AnimGraphNode_PoseDriver.h`

Anim Graph Node Pose Driver

**Methods** (11):
  - `copy_targets_from_pose_asset()` -> `None` — Util to replace current contents of PoseTargets with info from assigned PoseAsset
  - `get_driving_bone_names()` -> `Array [ Name ]` — Returns the pose-driver its driven bones by name
  - `get_pose_driver_output()` -> `PoseDriverOutput` — Get Pose Driver Output
  - `get_pose_driver_source()` -> `PoseDriverSource` — Get Pose Driver Source
  - `get_rbf_parameters()` -> `RBFParams` — Get RBFParameters
  - `get_source_bone_names()` -> `Array [ Name ]` — Returns the pose-driver its source bones by name
  - `set_driving_bones(bone_names)` -> `None` — Set the pose-driver its driven bones by name
  - `set_pose_driver_output(driver_output)` -> `None` — Set Pose Driver Output
  - `set_pose_driver_source(driver_source)` -> `None` — Set Pose Driver Source
  - `set_rbf_parameters(parameters)` -> `None` — Set RBFParameters
  - `set_source_bones(bone_names)` -> `None` — Sets the pose-driver its source bones by name

**Properties** (1):
  - `node`: `AnimNode_PoseDriver` — [Read-Write] (AnimNode_PoseDriver)

### `unreal.AnimGraphNode_PoseHandler`
Inherits: `AnimGraphNode_AssetPlayerBase` | Header: `AnimGraphNode_PoseHandler.h`

Anim Graph Node Pose Handler

### `unreal.AnimGraphNode_PoseSnapshot`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_PoseSnapshot.h`

Anim Graph Node Pose Snapshot

### `unreal.AnimGraphNode_RandomPlayer`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_RandomPlayer.h`

Anim Graph Node Random Player

### `unreal.AnimGraphNode_RefPoseBase`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_RefPoseBase.h`

Anim Graph Node Ref Pose Base

### `unreal.AnimGraphNode_ResetRoot`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_ResetRoot.h`

Anim Graph Node Reset Root

### `unreal.AnimGraphNode_RigidBody`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_RigidBody.h`

Anim Graph Node Rigid Body

### `unreal.AnimGraphNode_Root`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_Root.h`

Anim Graph Node Root

### `unreal.AnimGraphNode_RotateRootBone`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_RotateRootBone.h`

Anim Graph Node Rotate Root Bone

### `unreal.AnimGraphNode_RotationMultiplier`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_RotationMultiplier.h`

Anim Graph Node Rotation Multiplier

### `unreal.AnimGraphNode_RotationOffsetBlendSpace`
Inherits: `AnimGraphNode_BlendSpaceBase` | Header: `AnimGraphNode_RotationOffsetBlendSpace.h`

Anim Graph Node Rotation Offset Blend Space

### `unreal.AnimGraphNode_RotationOffsetBlendSpaceGraph`
Inherits: `AnimGraphNode_BlendSpaceGraphBase` | Header: `AnimGraphNode_RotationOffsetBlendSpaceGraph.h`

Anim Graph Node Rotation Offset Blend Space Graph

### `unreal.AnimGraphNode_SaveCachedPose`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_SaveCachedPose.h`

Anim Graph Node Save Cached Pose

### `unreal.AnimGraphNode_ScaleChainLength`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_ScaleChainLength.h`

Anim Graph Node Scale Chain Length

### `unreal.AnimGraphNode_SequenceEvaluator`
Inherits: `AnimGraphNode_AssetPlayerBase` | Header: `AnimGraphNode_SequenceEvaluator.h`

Anim Graph Node Sequence Evaluator

### `unreal.AnimGraphNode_SequencePlayer`
Inherits: `AnimGraphNode_AssetPlayerBase` | Header: `AnimGraphNode_SequencePlayer.h`

Anim Graph Node Sequence Player

### `unreal.AnimGraphNode_SkeletalControlBase`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_SkeletalControlBase.h`

This is the base class for the âsource versionâ of all skeletal control animation graph nodes (nodes that manipulate the pose rather than playing animations to create a pose or blending between po...

### `unreal.AnimGraphNode_Slot`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_Slot.h`

Anim Graph Node Slot

### `unreal.AnimGraphNode_SplineIK`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_SplineIK.h`

Anim Graph Node Spline IK

### `unreal.AnimGraphNode_SpringBone`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_SpringBone.h`

Anim Graph Node Spring Bone

### `unreal.AnimGraphNode_StateMachine`
Inherits: `AnimGraphNode_StateMachineBase` | Header: `AnimGraphNode_StateMachine.h`

Anim Graph Node State Machine

### `unreal.AnimGraphNode_StateMachineBase`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_StateMachineBase.h`

Anim Graph Node State Machine Base

### `unreal.AnimGraphNode_StateResult`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_StateResult.h`

Anim Graph Node State Result

### `unreal.AnimGraphNode_Sync`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_Sync.h`

Anim Graph Node Sync

### `unreal.AnimGraphNode_Trail`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_Trail.h`

Anim Graph Node Trail

### `unreal.AnimGraphNode_TransitionPoseEvaluator`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_TransitionPoseEvaluator.h`

Anim Graph Node Transition Pose Evaluator

**Properties** (1):
  - `node`: `AnimNode_TransitionPoseEvaluator` — [Read-Write] (AnimNode_TransitionPoseEvaluator)

### `unreal.AnimGraphNode_TransitionResult`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_TransitionResult.h`

Anim Graph Node Transition Result

### `unreal.AnimGraphNode_TwistCorrectiveNode`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_TwistCorrectiveNode.h`

This is the âsource versionâ of a bone driven controller, which maps part of the state from one bone to another (e.g., 2 * source.x -> target.z)

### `unreal.AnimGraphNode_TwoBoneIK`
Inherits: `AnimGraphNode_SkeletalControlBase` | Header: `AnimGraphNode_TwoBoneIK.h`

Anim Graph Node Two Bone IK

### `unreal.AnimGraphNode_TwoWayBlend`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_TwoWayBlend.h`

Anim Graph Node Two Way Blend

### `unreal.AnimGraphNode_UseCachedPose`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_UseCachedPose.h`

Anim Graph Node Use Cached Pose

### `unreal.AnimGraphNodeBinding`
Inherits: `Object` | Header: `AnimGraphNodeBinding.h`

Anim Graph Node Binding

### `unreal.AnimGraphNodeCustomizationInterface`
Inherits: `Interface` | Header: `AnimGraphNodeCustomizationInterface.h`

Anim Graph Node Customization Interface

**Methods** (1):
  - `get_title_color()` -> `LinearColor` — Get the custom color for this node

### `unreal.AnimPreviewAttacheInstance`
Inherits: `AnimInstance` | Header: `AnimPreviewAttacheInstance.h`

This Instance only contains one AnimationAsset, and produce poses Used by Preview in AnimGraph, Playing single animation in Kismet2 and etc

### `unreal.AnimPreviewInstance`
Inherits: `AnimSingleNodeInstance` | Header: `AnimPreviewInstance.h`

This Instance only contains one AnimationAsset, and produce poses Used by Preview in AnimGraph, Playing single animation in Kismet2 and etc

### `unreal.AnimStateAliasNode`
Inherits: `AnimStateNodeBase` | Header: `AnimStateAliasNode.h`

Anim State Alias Node

**Properties** (1):
  - `global_alias`: `bool` — [Read-Write] (bool)

### `unreal.AnimStateNodeBase`
Inherits: `EdGraphNode` | Header: `AnimStateNodeBase.h`

Anim State Node Base

### `unreal.AnimStateTransitionNode`
Inherits: `AnimStateNodeBase` | Header: `AnimStateTransitionNode.h`

Anim State Transition Node

**Properties** (1):
  - `logic_type`: `TransitionLogicType` — [Read-Write] What transition logic to use (TransitionLogicType)
