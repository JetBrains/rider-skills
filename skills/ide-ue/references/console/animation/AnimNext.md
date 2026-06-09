# UE Python API — AnimNext Module

**37 types** from the `AnimNext` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNextEntryPoint`, `AnimNextExecuteContext`, `AnimNextGraphLODPose`, `AnimNextGraphReferencePose`, `AnimNextModuleHandle`, `AnimNextNativeDataInterface`, `AnimNextParamType`, `AnimNextScope`, `AnimNextTag`, `AnimNextTraitEvent`, `RigUnit_AnimNextBase`, `RigUnit_AnimNextBeginExecution`, `RigUnit_AnimNextExecuteBindings_GT`, `RigUnit_AnimNextExecuteBindings_WT`, `RigUnit_AnimNextInitializeEvent`, `RigUnit_AnimNextModuleAddDependencies`, `RigUnit_AnimNextModuleDependenciesBase`, `RigUnit_AnimNextModuleEventBase`, `RigUnit_AnimNextModuleRemoveDependencies`, `RigUnit_AnimNextParameterBase`, ... (37 total)

---

## Classes

### `unreal.AnimNextEntryPoint`
Inherits: `AnimNextTag` | Header: `AnimNextTag.h`

Empty struct to tag named entry points

### `unreal.AnimNextExecuteContext`
Inherits: `RigVMExecuteContext` | Header: `AnimNextExecuteContext.h`

Anim Next Execute Context

### `unreal.AnimNextGraphLODPose`
Inherits: `StructBase` | Header: `AnimNext_LODPose.h`

Anim Next Graph LODPose

### `unreal.AnimNextGraphReferencePose`
Inherits: `StructBase` | Header: `AnimNext_LODPose.h`

Anim Next Graph Reference Pose

### `unreal.AnimNextModuleHandle`
Inherits: `StructBase` | Header: `ModuleHandle.h`

Anim Next Module Handle

### `unreal.AnimNextNativeDataInterface`
Inherits: `StructBase` | Header: `AnimNextNativeDataInterface.h`

Base structure used to implement a native interface into AnimNext assets

### `unreal.AnimNextParamType`
Inherits: `StructBase` | Header: `ParamType.h`

Representation of a parameterâs type. Serializable, but fairly heavyweight to pass around and compare. Faster comparisons and other operations can be performed on UE::AnimNext::FParamTypeHandle, but...

### `unreal.AnimNextScope`
Inherits: `AnimNextTag` | Header: `AnimNextTag.h`

Empty struct to tag named scopes

### `unreal.AnimNextTag`
Inherits: `StructBase` | Header: `AnimNextTag.h`

Empty struct to act as a named tag for parameters

### `unreal.AnimNextTraitEvent`
Inherits: `StructBase` | Header: `TraitEvent.h`

Trait Event

### `unreal.RigUnit_AnimNextBase`
Inherits: `RigVMStruct` | Header: `RigUnit_AnimNextBase.h`

Rig Unit Anim Next Base

### `unreal.RigUnit_AnimNextBeginExecution`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextBeginExecution.h`

Event for driving the skeleton hierarchy with variables and rig elements

**Properties** (1):
  - `execute_context`: `AnimNextExecuteContext` [Read-Only] — [Read-Only] The execution result (AnimNextExecuteContext)

### `unreal.RigUnit_AnimNextExecuteBindings_GT`
Inherits: `RigUnit_AnimNextModuleEventBase` | Header: `RigUnit_AnimNextModuleEvents.h`

Synthetic event injected by the compiler to process any variable bindings on the game thread, not user instantiated

### `unreal.RigUnit_AnimNextExecuteBindings_WT`
Inherits: `RigUnit_AnimNextModuleEventBase` | Header: `RigUnit_AnimNextModuleEvents.h`

Synthetic event injected by the compiler to process any variable bindings on a worker thread, not user instantiated

### `unreal.RigUnit_AnimNextInitializeEvent`
Inherits: `RigUnit_AnimNextModuleEventBase` | Header: `RigUnit_AnimNextModuleEvents.h`

Schedule event called to set up a module

### `unreal.RigUnit_AnimNextModuleAddDependencies`
Inherits: `RigUnit_AnimNextModuleDependenciesBase` | Header: `RigUnit_AnimNextModuleEventDependencies.h`

Adds execution dependencies between module events and other systems

### `unreal.RigUnit_AnimNextModuleDependenciesBase`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextModuleEventDependencies.h`

Rig Unit Anim Next Module Dependencies Base

**Properties** (1):
  - `execute_context`: `AnimNextExecuteContext` — [Read-Write] The execution result (AnimNextExecuteContext)

### `unreal.RigUnit_AnimNextModuleEventBase`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextModuleEvents.h`

Base schedule-level event, never instantiated

**Properties** (1):
  - `execute_context`: `AnimNextExecuteContext` [Read-Only] — [Read-Only] The execution result (AnimNextExecuteContext)

### `unreal.RigUnit_AnimNextModuleRemoveDependencies`
Inherits: `RigUnit_AnimNextModuleDependenciesBase` | Header: `RigUnit_AnimNextModuleEventDependencies.h`

Removes execution dependencies between module events and some systems

### `unreal.RigUnit_AnimNextParameterBase`
Inherits: `RigVMStruct` | Header: `RigUnit_AnimNextParameterBase.h`

### `unreal.RigUnit_AnimNextParameterBeginExecution`
Inherits: `RigUnit_AnimNextParameterBase` | Header: `RigUnit_AnimNextParameterBeginExecution.h`

**Properties** (1):
  - `execute_context`: `AnimNextExecuteContext` [Read-Only] — [Read-Only] The execution result (AnimNextExecuteContext)

### `unreal.RigUnit_AnimNextPostPhysicsEvent`
Inherits: `RigUnit_AnimNextUserEvent` | Header: `RigUnit_AnimNextModuleEvents.h`

Schedule event called after world physics is updated

### `unreal.RigUnit_AnimNextPrePhysicsEvent`
Inherits: `RigUnit_AnimNextUserEvent` | Header: `RigUnit_AnimNextModuleEvents.h`

Schedule event called before world physics is updated

### `unreal.RigUnit_AnimNextRemapPose`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextRemapPose.h`

Remaps an anim graph pose from to another skeletal mesh component.

**Properties** (4):
  - `execute_context`: `AnimNextExecuteContext` — [Read-Write] The execution result (AnimNextExecuteContext)
  - `pose`: `AnimNextGraphLODPose` — [Read-Write] Pose to read (AnimNextGraphLODPose)
  - `result`: `AnimNextGraphLODPose` [Read-Only] — [Read-Only] (AnimNextGraphLODPose)
  - `target_anim_graph_ref_pose`: `AnimNextGraphReferencePose` — [Read-Write] (AnimNextGraphReferencePose)

### `unreal.RigUnit_AnimNextUserEvent`
Inherits: `RigUnit_AnimNextModuleEventBase` | Header: `RigUnit_AnimNextModuleEvents.h`

Base event for all user-authored events. Can execute in a particular tick group (e.g. TG_PrePhysics)

**Properties** (2):
  - `name`: `Name` [Read-Only] — [Read-Only] The name of the event (Name)
  - `sort_order`: `int` [Read-Only] — [Read-Only] Sort index for ordering with other events in this tick group - smaller values get sorted...

### `unreal.RigUnit_AnimNextWriteSkeletalMeshComponentPose`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_AnimNextWriteSkeletalMeshComponentPose.h`

Writes a pose to a skeletal mesh component

**Properties** (3):
  - `execute_context`: `AnimNextExecuteContext` — [Read-Write] The execution result (AnimNextExecuteContext)
  - `pose`: `AnimNextGraphLODPose` — [Read-Write] Pose to write (AnimNextGraphLODPose)
  - `skeletal_mesh_component`: `SkeletalMeshComponent` — [Read-Write] Mesh to write to. If this is not supplied, then the first skeletal mesh component of th...

### `unreal.RigUnit_CopyModuleProxyVariables`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_CopyModuleProxyVariables.h`

Synthetic node injected by the compiler to copy proxy variables to a module instance, not user instantiated

**Properties** (1):
  - `execute_context`: `AnimNextExecuteContext` — [Read-Write] The execution result (AnimNextExecuteContext)

### `unreal.RigUnit_GetActorTransform`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_GetActorTransform.h`

Gets the transform of the actor hosting this AnimNext module

**Properties** (1):
  - `transform`: `Transform` [Read-Only] — [Read-Only] The transform of our host actor (Transform)

### `unreal.RigUnit_IsRecentlyRendered`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_IsRecentlyRendered.h`

Gets recently rendered flag from the input skinned mesh component

**Properties** (2):
  - `mesh_component`: `SkinnedMeshComponent` — [Read-Write] Mesh to query (SkinnedMeshComponent)
  - `result`: `bool` [Read-Only] — [Read-Only] The recently rendered flag of the input mesh (bool)

### `unreal.RigUnit_MakeReferencePoseFromSkeletalMeshComponent`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_MakeReferencePoseFromSkeletalMeshComponent.h`

Makes a reference pose from a skeletal mesh component

**Properties** (3):
  - `execute_context`: `AnimNextExecuteContext` — [Read-Write] The execution result (AnimNextExecuteContext)
  - `reference_pose`: `AnimNextGraphReferencePose` — [Read-Write] Reference pose to write (AnimNextGraphReferencePose)
  - `skeletal_mesh_component`: `SkeletalMeshComponent` — [Read-Write] Mesh to use to generate the reference pose. If this is not supplied, then the first ske...

### `unreal.RigUnit_ResolveUniversalObjectLocator`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_ResolveUniversalObjectLocator.h`

Synthetic node injected by the compiler to resolve a UOL to an object, not user instantiated

**Properties** (2):
  - `locator`: `UniversalObjectLocator` — [Read-Write] (UniversalObjectLocator)
  - `object`: `Object` [Read-Only] — [Read-Only] (Object)

### `unreal.RigVMTrait_AnimNextPublicVariables`
Inherits: `RigVMTrait` | Header: `RigVMTrait_AnimNextPublicVariables.h`

Represents public variables of an asset via a trait

### `unreal.AnimNextComponent`
Inherits: `ActorComponent` | Header: `AnimNextComponent.h`

Anim Next Component

**Methods** (12):
  - `add_component_prerequisite(component, event_name)` -> `None` — Add a prerequisite dependency on the componentâs primary tick function to the specified event The component will tick ...
  - `add_component_subsequent(component, event_name)` -> `None` — Add a subsequent dependency on the componentâs primary tick function to the specified event The component will tick af...
  - `add_module_event_prerequisite(event_name, other_anim_next_component, other_event_name)` -> `None` — Add a prerequisite anim next event dependency to the specified event
  - `add_module_event_subsequent(event_name, other_anim_next_component, other_event_name)` -> `None` — Add a subsequent anim next event dependency to the specified event
  - `blueprint_get_module_handle()` -> `AnimNextModuleHandle` — Blueprint Get Module Handle
  - `is_enabled()` -> `bool` — Whether this component is currently updating
  - `remove_component_prerequisite(component, event_name)` -> `None` — Remove a prerequisite on the componentâs primary tick function from the specified event
  - `remove_component_subsequent(component, event_name)` -> `None` — Remove a subsequent dependency on the componentâs primary tick function from the specified event
  - `remove_module_event_prerequisite(event_name, other_anim_next_component, other_event_name)` -> `None` — Remove a prerequisite anim next event dependency from the specified event
  - `remove_module_event_subsequent(event_name, other_anim_next_component, other_event_name)` -> `None` — Remove a subsequent anim next event dependency from the specified event
  - `set_enabled(enabled)` -> `None` — Enable or disable this componentâs update
  - `show_debug_drawing(show_debug_drawing)` -> `None` — Enable or disable debug drawing. Note only works in builds with UE_ENABLE_DEBUG_DRAWING enabled

### `unreal.AnimNextDataInterface`
Inherits: `AnimNextRigVMAsset` | Header: `AnimNextDataInterface.h`

Data interfaces provide a set of named data that is shared between AnimNext assets and used for communication between assets and functional units

### `unreal.AnimNextModule`
Inherits: `AnimNextDataInterface` | Header: `AnimNextModule.h`

Root asset represented by a component when instantiated

### `unreal.AnimNextRigVMAsset`
Inherits: `RigVMHost` | Header: `AnimNextRigVMAsset.h`

Base class for all AnimNext assets that can host RigVM logic

**Methods** (8):
  - `add_data_interface(data_interface, setup_undo_redo = True, print_python_command = True)` -> `AnimNextDataInterfaceEntry` — Adds a data interface to an AnimNext asset
  - `add_event_graph(name, event_struct, setup_undo_redo = True, print_python_command = True)` -> `AnimNextEventGraphEntry` — Adds an event graph to an AnimNext asset
  - `add_function(function_name, mutable, setup_undo_redo = True, print_python_command = True)` -> `RigVMLibraryNode` — Adds a function to an AnimNext asset
  - `add_variable(name, value_type, container_type = PropertyBagContainerType.NONE, value_type_object = None, default_value = '', setup_undo_redo = True, print_python_command = True)` -> `AnimNextVariableEntry` — Adds a parameter to an AnimNext asset
  - `find_entry(name)` -> `AnimNextRigVMAssetEntry` — Finds an entry in an AnimNext asset
  - `remove_all_entries(setup_undo_redo = True, print_python_command = True)` -> `bool` — Removes all entries from an AnimNext asset
  - `remove_entries(entries, setup_undo_redo = True, print_python_command = True)` -> `bool` — Removes multiple entries from an AnimNext asset
  - `remove_entry(entry, setup_undo_redo = True, print_python_command = True)` -> `bool` — Removes an entry from an AnimNext asset

### `unreal.AnimNextModuleInitMethod`
Inherits: `EnumBase` | Header: `AnimNextModuleInitMethod.h`

EAnim Next Module Init Method

**Properties** (4):
  - `INITIALIZE_AND_PAUSE`: `AnimNextModuleInitMethod = Ellipsis` — Set up data structures, perform an initial update and then pause 1
  - `INITIALIZE_AND_PAUSE_IN_EDITOR`: `AnimNextModuleInitMethod = Ellipsis` — Set up data structures, perform an initial update and then pause in editor only, otherwise act like ...
  - `INITIALIZE_AND_RUN`: `AnimNextModuleInitMethod = Ellipsis` — Set up data structures then continue updating 3
  - `NONE`: `AnimNextModuleInitMethod = Ellipsis` — Do not perform any initial update, set up data structures only 0
