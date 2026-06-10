# UE Python API — AnimNextAnimGraph Module

**29 types** from the `AnimNextAnimGraph` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNextAnimGraph`, `AnimNextEntryPointHandle`, `AnimNextGraphInjectionData`, `AnimNextInertializationRequestEvent`, `AnimNextInjectionBlendSettings`, `AnimNextNativeDataInterface_AnimSequencePlayer`, `AnimNextNativeDataInterface_BlendSpacePlayer`, `AnimNextNativeDataInterface_SynchronizeUsingGroups`, `AnimNextTraitHandle`, `AnimNextTraitSharedData`, `AnimNode_AnimNextGraph`, `RigDecorator_AnimNextCppDecorator`, `RigUnit_AnimNextGraphEvaluator`, `RigUnit_AnimNextGraphRoot`, `RigUnit_AnimNextRunAnimationGraph_v1`, `RigUnit_AnimNextRunAnimationGraph_v2`, `RigUnit_AnimNextSetNotifyContext`, `RigUnit_AnimNextShimRoot`, `RigUnit_AnimNextTraitStack`, `RigUnit_GetPostProcessAnimation`, ... (29 total)

---

## Classes

### `unreal.AnimNextAnimGraph`
Inherits: `StructBase` | Header: `AnimNextAnimGraph.h`

Represents an instance of an AnimNext graph, either an asset or some externally-provided graph instance. The asset can be set to refer directly to a graph asset, or it can be used via a âfactoryâ ...

**Properties** (3):
  - `asset`: `Object` — [Read-Write] The asset to run as an animation graph (Object)
  - `host_graph`: `AnimNextAnimationGraph` — [Read-Write] The host graph to use to run the asset. Applies only to top-level graphs being run in m...
  - `injection_data`: `AnimNextGraphInjectionData` [Read-Only] — [Read-Only] Injection data used to override the supplied graph (AnimNextGraphInjectionData)

### `unreal.AnimNextEntryPointHandle`
Inherits: `StructBase` | Header: `EntryPointHandle.h`

Entry Point Handle An entry point handle is equivalent to a trait handle but it will not resolve automatically on load. As such, it is safe to use outside of an AnimNext graph. They must be manually r...

### `unreal.AnimNextGraphInjectionData`
Inherits: `StructBase` | Header: `AnimNextAnimGraph.h`

Injection data for an AnimNext Graph

### `unreal.AnimNextInertializationRequestEvent`
Inherits: `AnimNextTraitEvent` | Header: `Inertialization.h`

FAnimNextInertializationRequestEvent

### `unreal.AnimNextInjectionBlendSettings`
Inherits: `StructBase` | Header: `InjectionRequest.h`

Injection Blend Settings

**Properties** (2):
  - `blend`: `AlphaBlendArgs` — [Read-Write] AlphaBlend options (time, curve, etc.) (AlphaBlendArgs)
  - `blend_mode`: `AnimNextInjectionBlendMode` — [Read-Write] Type of blend mode (Standard vs Inertial) (AnimNextInjectionBlendMode)

### `unreal.AnimNextNativeDataInterface_AnimSequencePlayer`
Inherits: `AnimNextNativeDataInterface` | Header: `AnimNextNativeDataInterface_AnimSequencePlayer.h`

Native interface to built-in AnimSequence player graph at: /AnimNextAnimGraph/FactoryGraphs/AG_AnimSequencePlayer

**Properties** (4):
  - `anim_sequence`: `AnimSequence` — [Read-Write] The animation object to play
Not editable to hide it in cases where we would end up dup...
  - `loop`: `bool` — [Read-Write] Whether to loop the animation (bool)
  - `play_rate`: `float` — [Read-Write] The play rate to use (double)
  - `start_position`: `float` — [Read-Write] The timelineâs start position (double)

### `unreal.AnimNextNativeDataInterface_BlendSpacePlayer`
Inherits: `AnimNextNativeDataInterface` | Header: `AnimNextNativeDataInterface_BlendSpacePlayer.h`

Native interface to built-in BlendSpace player graph at: /AnimNextAnimGraph/FactoryGraphs/AG_BlendSpacePlayer

**Properties** (6):
  - `blend_space`: `BlendSpace` — [Read-Write] The animation object to play
Not editable to hide it in cases where we would end up dup...
  - `loop`: `bool` — [Read-Write] Whether to loop the animation (bool)
  - `play_rate`: `float` — [Read-Write] The play rate to use (double)
  - `start_position`: `float` — [Read-Write] The timelineâs start position. This is normalized in the [0,1] range. (double)
  - `x_axis_sample_point`: `float` — [Read-Write] The location on the x-axis to sample. (double)
  - `y_axis_sample_point`: `float` — [Read-Write] The location on the y-axis to sample. (double)

### `unreal.AnimNextNativeDataInterface_SynchronizeUsingGroups`
Inherits: `AnimNextNativeDataInterface` | Header: `AnimNextNativeDataInterface_SynchronizeUsingGroups.h`

Native interface to built-in SynchronizeUsingGroups trait

**Properties** (4):
  - `group_name`: `Name` — [Read-Write] The group name
If no name is provided, no synchronization occurs (Name)
  - `group_role`: `AnimGroupSynchronizationRole` — [Read-Write] The role this player can assume within the group (AnimGroupSynchronizationRole)
  - `match_sync_point`: `bool` — [Read-Write] Whether or not to match the group sync point when joining as leader
When disabled, the ...
  - `sync_mode`: `AnimGroupSynchronizationMode` — [Read-Write] The synchronization mode (AnimGroupSynchronizationMode)

### `unreal.AnimNextTraitHandle`
Inherits: `StructBase` | Header: `TraitHandle.h`

Trait Handle A trait handle represents a reference to a specific trait instance in the shared/read-only portion of a sub-graph. It points to a FNodeDescription when resolved.

### `unreal.AnimNextTraitSharedData`
Inherits: `StructBase` | Header: `TraitSharedData.h`

FAnimNextTraitSharedData Trait shared data represents a unique instance in the authored static graph. Each instance of a graph will share instances of the read-only shared data. Shared data typically ...

### `unreal.AnimNode_AnimNextGraph`
Inherits: `AnimNode_CustomProperty` | Header: `AnimNode_AnimNextGraph.h`

Animation node that allows a AnimNextGraph output to be used in an animation graph

### `unreal.RigDecorator_AnimNextCppDecorator`
Inherits: `RigVMTrait` | Header: `RigDecorator_AnimNextCppTrait.h`

AnimNext RigDecorator for all C++ traits. The trait shared data UScriptStruct determines which properties are exposed.

### `unreal.RigUnit_AnimNextGraphEvaluator`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextGraphEvaluator.h`

Animation graph evaluator This node is only used at runtime. It performs the animation graph update and evaluation through the data provided in the execution context. It also holds all latent/lazy pin...

**Properties** (1):
  - `execute_context`: `AnimNextExecuteContext` — [Read-Write] (AnimNextExecuteContext)

### `unreal.RigUnit_AnimNextGraphRoot`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextGraphRoot.h`

Animation graph output This is a synthetic node that represents the entry point for an animation graph for RigVM. The graph editor will see this as the graph output in which to hook up the first anima...

**Properties** (1):
  - `result`: `AnimNextTraitHandle` — [Read-Write] The execution result (AnimNextTraitHandle)

### `unreal.RigUnit_AnimNextRunAnimationGraph_v1`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextRunAnimationGraph_v1.h`

Runs an animation graph

**Properties** (6):
  - `execute_context`: `AnimNextExecuteContext` — [Read-Write] The execution result (AnimNextExecuteContext)
  - `graph`: `AnimNextAnimationGraph` — [Read-Write] Graph to run (AnimNextAnimationGraph)
  - `instance`: `AnimNextAnimGraph` — [Read-Write] Instance used to hold graph state (AnimNextAnimGraph)
  - `lod`: `int` — [Read-Write] LOD to run the graph at. If this is -1 then the reference poseâs source LOD will be u...
  - `reference_pose`: `AnimNextGraphReferencePose` — [Read-Write] Reference pose for the graph (AnimNextGraphReferencePose)
  - `result`: `AnimNextGraphLODPose` [Read-Only] — [Read-Only] Pose result (AnimNextGraphLODPose)

### `unreal.RigUnit_AnimNextRunAnimationGraph_v2`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextRunAnimationGraph_v2.h`

Runs an animation graph

**Properties** (5):
  - `execute_context`: `AnimNextExecuteContext` — [Read-Write] The execution result (AnimNextExecuteContext)
  - `graph`: `AnimNextAnimGraph` — [Read-Write] The graph to run (AnimNextAnimGraph)
  - `lod`: `int` — [Read-Write] LOD to run the graph at. If this is -1 then the reference poseâs source LOD will be u...
  - `reference_pose`: `AnimNextGraphReferencePose` — [Read-Write] Reference pose for the graph (AnimNextGraphReferencePose)
  - `result`: `AnimNextGraphLODPose` [Read-Only] — [Read-Only] Pose result (AnimNextGraphLODPose)

### `unreal.RigUnit_AnimNextSetNotifyContext`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextSetNotifyContext.h`

Sets up the context in which notifies are called

**Properties** (2):
  - `execute_context`: `AnimNextExecuteContext` — [Read-Write] (AnimNextExecuteContext)
  - `skeletal_mesh_component`: `SkeletalMeshComponent` — [Read-Write] The mesh component to supply to any notify dispatches (SkeletalMeshComponent)

### `unreal.RigUnit_AnimNextShimRoot`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextShimRoot.h`

Animation graph output This is a synthetic node that represents the entry point for an animation graph for RigVM. The graph editor will not see this node. It is added during compilation as a shim to s...

**Properties** (1):
  - `execute_context`: `AnimNextExecuteContext` [Read-Only] — [Read-Only] In order for this node to be considered an executable RigUnit, it needs a pin to derive ...

### `unreal.RigUnit_AnimNextTraitStack`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextTraitStack.h`

Animation graph trait container It contains a stack of traits which are used during compilation to output a cooked graph This node is synthetic and only present in the editor. During compilation, it i...

**Properties** (1):
  - `result`: `AnimNextTraitHandle` [Read-Only] — [Read-Only] The execution result (AnimNextTraitHandle)

### `unreal.RigUnit_GetPostProcessAnimation`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_GetPostProcessAnimation.h`

Get post process animation data for a given skeletal mesh.

**Properties** (6):
  - `execute_context`: `AnimNextExecuteContext` — [Read-Write] (AnimNextExecuteContext)
  - `graph`: `AnimNextAnimGraph` [Read-Only] — [Read-Only] Post-process animation graph to run, read from the given skeletal mesh. (AnimNextAnimGra...
  - `lod_level`: `int` — [Read-Write] Current LOD we run animation with on the given skeletal mesh component. (int32)
  - `lod_threshold`: `int` [Read-Only] — [Read-Only] Raw post-process animation LOD threshold read from the given skeletal mesh. This can be ...
  - `should_evaluate`: `bool` [Read-Only] — [Read-Only] Can we skip or should we run the output animation graph based on the given input LOD and...
  - `skeletal_mesh_component`: `SkeletalMeshComponent` — [Read-Write] Skeletal mesh component to be used to read the post-process animation from the assigned...

### `unreal.AnimNextAnimationGraph`
Inherits: `AnimNextDataInterface` | Header: `AnimNextAnimationGraph.h`

A user-created collection of animation logic & data

**Methods** (1):
  - `add_animation_graph(name, setup_undo_redo = True, print_python_command = True)` -> `AnimNextAnimationGraphEntry` — Adds an animation graph to an AnimNext asset

### `unreal.InjectionCallbackProxy`
Inherits: `CancellableAsyncAction` | Header: `InjectionCallbackProxy.h`

Injection Callback Proxy

**Methods** (1):
  - `uninject()` -> `UninjectionResult` — Un-inject a previously injected object. Cancelling this async tasks will also un-inject.

**Properties** (3):
  - `on_blend_out`: `OnInjectionDelegate` — [Read-Write] Called when the provided animation object starts blending out and hasnât been interru...
  - `on_completed`: `OnInjectionDelegate` — [Read-Write] Called when the provided animation object finished playing and hasnât been interrupte...
  - `on_interrupted`: `OnInjectionDelegate` — [Read-Write] Called when the provided animation object has been interrupted (or failed to play) (OnI...

### `unreal.PlayAnimCallbackProxy`
Inherits: `Object` | Header: `PlayAnimCallbackProxy.h`

Play Anim Callback Proxy

**Properties** (3):
  - `on_blend_out`: `OnPlayAnimPlayDelegate` — [Read-Write] Called when the provided animation object starts blending out and hasnât been interru...
  - `on_completed`: `OnPlayAnimPlayDelegate` — [Read-Write] Called when the provided animation object finished playing and hasnât been interrupte...
  - `on_interrupted`: `OnPlayAnimPlayDelegate` — [Read-Write] Called when the provided animation object has been interrupted (or failed to play) (OnP...

### `unreal.AnimGroupSynchronizationMode`
Inherits: `EnumBase` | Header: `IGroupSynchronization.h`

Synchronization Mode

**Properties** (3):
  - `NO_SYNCHRONIZATION`: `AnimGroupSynchronizationMode = Ellipsis` — This timeline host will not synchronize. 0
  - `SYNCHRONIZE_USING_GROUP_NAME`: `AnimGroupSynchronizationMode = Ellipsis` — This timeline host will synchronize and use the provided group name. 1
  - `SYNCHRONIZE_USING_UNIQUE_GROUP_NAME`: `AnimGroupSynchronizationMode = Ellipsis` — This timeline host will synchronize and use a uniquely generated group name. 2

### `unreal.AnimGroupSynchronizationRole`
Inherits: `EnumBase` | Header: `IGroupSynchronization.h`

Synchronization Role

**Properties** (6):
  - `ALWAYS_FOLLOWER`: `AnimGroupSynchronizationRole = Ellipsis` — This timeline host will always be a follower (unless there are only followers, in which case the fir...
  - `ALWAYS_LEADER`: `AnimGroupSynchronizationRole = Ellipsis` — This timeline host will always be a leader (if more than one timeline host is AlwaysLeader, the last...
  - `CAN_BE_LEADER`: `AnimGroupSynchronizationRole = Ellipsis` — This timeline host can be the leader, as long as it has a higher blend weight than the previous best...
  - `EXCLUSIVE_ALWAYS_LEADER`: `AnimGroupSynchronizationRole = Ellipsis` — This timeline host will always be a leader. If it fails to be ticked as a leader it will be run as u...
  - `TRANSITION_FOLLOWER`: `AnimGroupSynchronizationRole = Ellipsis` — This timeline host will be excluded from the sync group while blending in. Once blended in it will b...
  - `TRANSITION_LEADER`: `AnimGroupSynchronizationRole = Ellipsis` — This timeline host will be excluded from the sync group while blending in. Once blended in it will b...

### `unreal.AnimNextInjectionBlendMode`
Inherits: `EnumBase` | Header: `InjectionRequest.h`

EAnim Next Injection Blend Mode

**Properties** (2):
  - `INERTIALIZATION`: `AnimNextInjectionBlendMode = Ellipsis` — Uses inertialization. Requires an inertialization trait somewhere earlier in the graph. 1
  - `STANDARD`: `AnimNextInjectionBlendMode = Ellipsis` — Uses standard weight based blend 0

### `unreal.UninjectionResult`
Inherits: `EnumBase` | Header: `InjectionCallbackProxy.h`

EUninjection Result

**Properties** (2):
  - `FAILED`: `UninjectionResult = Ellipsis` — 1
  - `SUCCEEDED`: `UninjectionResult = Ellipsis` — 0

### `unreal.OnInjectionDelegate`
Inherits: `MulticastDelegateBase` | Header: `InjectionCallbackProxy.h`

On Injection Delegate Delegate Signature

### `unreal.OnPlayAnimPlayDelegate`
Inherits: `MulticastDelegateBase` | Header: `PlayAnimCallbackProxy.h`

On Play Anim Play Delegate Delegate Signature
