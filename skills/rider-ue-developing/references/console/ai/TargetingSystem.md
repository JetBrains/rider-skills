# UE Python API — TargetingSystem Module

**25 types** from the `TargetingSystem` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CollisionQueryTaskData`, `TargetingDefaultResultData`, `TargetingRequestHandle`, `TargetingSourceContext`, `TargetingTaskSet`, `AbilityTask_PerformTargeting`, `AsyncAction_PerformTargeting`, `SimpleTargetingFilterTask`, `SimpleTargetingSelectionTask`, `SimpleTargetingSortTask`, `TargetingFilterTask_ActorClass`, `TargetingFilterTask_BasicFilterTemplate`, `TargetingFilterTask_SortByDistance`, `TargetingPreset`, `TargetingSelectionTask_AOE`, `TargetingSelectionTask_SourceActor`, `TargetingSelectionTask_Trace`, `TargetingSortTask_Base`, `TargetingSubsystem`, `TargetingTask`, ... (25 total)

---

## Classes

### `unreal.CollisionQueryTaskData`
Inherits: `StructBase` | Header: `CollisionQueryTaskData.h`

Data Store struct used to extend collision-based targeting tasks providing extra data from outside

**Properties** (1):
  - `ignored_actors`: `None` — Given that this is a globally-managed struct, weâre manually adding refs to it in UTargetingSubsys...

### `unreal.TargetingDefaultResultData`
Inherits: `StructBase` | Header: `TargetingSystemTypes.h`

struct: FTargetingDefaultResultData

**Properties** (2):
  - `hit_result`: `HitResult` [Read-Only] — [Read-Only] The hit result for this target (HitResult)
  - `score`: `float` [Read-Only] — [Read-Only] The score associated w/ this target (float)

### `unreal.TargetingRequestHandle`
Inherits: `StructBase` | Header: `TargetingSystemTypes.h`

struct: FTargetingRequestHandle The handle that is created when a user wants to make a targeting request.

### `unreal.TargetingSourceContext`
Inherits: `StructBase` | Header: `TargetingSystemTypes.h`

struct: FTargetingSourceContext Stores context information about a targeting request.

**Properties** (5):
  - `instigator_actor`: `Actor` — [Read-Write] The optional instigator the targeting request is owned by (i.e. owner of a projectile) ...
  - `source_actor`: `Actor` — [Read-Write] The optional actor the targeting request sources from (i.e. player/projectile/etc) (Act...
  - `source_location`: `Vector` — [Read-Write] The optional location the targeting request will source from (i.e. do AOE targeting at ...
  - `source_object`: `Object` — [Read-Write] The optional reference to a source uobject to use in the context (Object)
  - `source_socket_name`: `Name` — [Read-Write] The optional socket name to use on the source actor (if an actor is defined) (Name)

### `unreal.TargetingTaskSet`
Inherits: `StructBase` | Header: `TargetingSystemTypes.h`

struct: FTargetingTaskSet A set of tasks to be used by targeting requests to find/processes targets

**Properties** (1):
  - `tasks`: `None` — [Read-Write] The set of tasks that will be used to satisfy a targeting request (Array[TargetingTask]...

### `unreal.AbilityTask_PerformTargeting`
Inherits: `AbilityTask` | Header: `AbilityTask_PerformTargeting.h`

Ability Task Perform Targeting

**Properties** (1):
  - `on_target_ready`: `TargetReadyDelegate` — [Read-Write] Called when the targeting request has been completed and results are ready (TargetReady...

### `unreal.AsyncAction_PerformTargeting`
Inherits: `BlueprintAsyncActionBase` | Header: `AsyncAction_PerformTargeting.h`

class: UAsyncAction_PerformTargeting

**Methods** (1):
  - `get_targeting_handle()` -> `TargetingRequestHandle` — Get Targeting Handle

**Properties** (1):
  - `targeted`: `PerformTargetingReady` — [Read-Write] (PerformTargetingReady)

### `unreal.SimpleTargetingFilterTask`
Inherits: `TargetingFilterTask_BasicFilterTemplate` | Header: `SimpleTargetingFilterTask.h`

class: USimpleTargetingSelectionTask This is a blueprintable TargetingTask class made for filtering out Targets from the results list. Override the ShouldRemoveTarget Blueprint Function to define the ...

**Methods** (1):
  - `bp_should_filter_target(targeting_handle, target_data)` -> `bool` — Returns true if a Target should be removed from the results of this TargetingRequest

### `unreal.SimpleTargetingSelectionTask`
Inherits: `TargetingTask` | Header: `SimpleTargetingSelectionTask.h`

class: USimpleTargetingSelectionTask This is a blueprintable TargetingTask class made for adding new Targets to the results list. Override the SelectTargets function and call AddTargetHitResult or Add...

**Methods** (3):
  - `add_hit_result(targeting_handle, hit_result)` -> `bool` — Adds a HitResult to the Targeting Results for a given TargetingRequestHandle. Returns False when the Actor that was hit ...
  - `add_target_actor(targeting_handle, actor)` -> `bool` — Adds a single Actor to the Targeting Results for a given TargetingRequestHandle. Returns false when the Actor was alread...
  - `select_targets(targeting_handle, source_context)` -> `None` — Select Targets

### `unreal.SimpleTargetingSortTask`
Inherits: `TargetingSortTask_Base` | Header: `SimpleTargetingSortTask.h`

class: USimpleTargetingSortTask This is a blueprintable TargetingTask class made for reordering Targets in the results list. Override the GetScoreForTarget Blueprint Function to provide a score for ea...

**Methods** (1):
  - `bp_get_score_for_target(targeting_handle, target_data)` -> `float` — Called on every target to get a Score for sorting. This score will be added to the Score float in FTargetingDefaultResul...

### `unreal.TargetingFilterTask_ActorClass`
Inherits: `TargetingFilterTask_BasicFilterTemplate` | Header: `TargetingFilterTask_ActorClass.h`

class: UTargetingFilterTask_ActorClass Simple filtering task where we check the targets class type against the required and ignored class types.

### `unreal.TargetingFilterTask_BasicFilterTemplate`
Inherits: `TargetingTask` | Header: `TargetingFilterTask_BasicFilterTemplate.h`

class: UTargetingFilterTask_BasicFilterTemplate A base class that has a basic setup struct that a majority of filtering tasks will find convenient.

### `unreal.TargetingFilterTask_SortByDistance`
Inherits: `TargetingSortTask_Base` | Header: `TargetingFilterTask_SortByDistance.h`

class: UTargetingFilterTask_SortByDistance Simple sorting filter based on the distance to the source actor. Note: This filter will use the FTargetingDefaultResultsSet and use the Score factor defined ...

### `unreal.TargetingPreset`
Inherits: `DataAsset` | Header: `TargetingPreset.h`

class: UTargetingPreset This object is used when a data asset is preferred for task setup. Tasks will be processed in the order they are setup in the task set. It is recommended that selection tasks h...

**Properties** (1):
  - `targeting_task_set`: `TargetingTaskSet` — [Read-Write] The tasks that make up this targeting preset (TargetingTaskSet)

### `unreal.TargetingSelectionTask_AOE`
Inherits: `TargetingTask` | Header: `TargetingSelectionTask_AOE.h`

class: UTargetingSelectionTask_AOE Basic AOE based selection task. There are 4 shape types to choose from + a custom option. Box - Defined by a given half extent Cylinder - Defined by the half extent ...

**Methods** (3):
  - `get_source_location(targeting_handle)` -> `Vector` — Native Event to get the source location for the AOE
  - `get_source_offset(targeting_handle)` -> `Vector` — Native Event to get a source location offset for the AOE
  - `get_source_rotation(targeting_handle)` -> `Quat` — Native event to get the source rotation for the AOE

### `unreal.TargetingSelectionTask_SourceActor`
Inherits: `TargetingTask` | Header: `TargetingSelectionTask_SourceActor.h`

class: UTargetingSelectionTask_SourceActor Simple targeting selection task that gets the source actor defined in the targeting source context.

### `unreal.TargetingSelectionTask_Trace`
Inherits: `TargetingTask` | Header: `TargetingSelectionTask_Trace.h`

class: UTargetingSelectionTask_Trace Selection task that can perform a synchronous or asynchronous trace (line/sweep) to find all targets up to the first blocking hit (or its end point).

**Methods** (9):
  - `get_additional_actors_to_ignore(targeting_handle)` -> `Array [ Actor ]` — Native Event to get additional actors the Trace should ignore
  - `get_source_location(targeting_handle)` -> `Vector` — Native Event to get the source location for the Trace
  - `get_source_offset(targeting_handle)` -> `Vector` — Native Event to get a source location offset for the Trace
  - `get_swept_trace_box_half_extents(targeting_handle)` -> `Vector` — Native Event to get the swept box trace half extents (only called if TraceType = ETargetingTraceType::Box)
  - `get_swept_trace_capsule_half_height(targeting_handle)` -> `float` — Native Event to get the swept trace capsuleâs half height (only called if TraceType = ETargetingTraceType::Capsule)
  - `get_swept_trace_radius(targeting_handle)` -> `float` — Native Event to get the swept trace radius (only called if TraceType = ETargetingTraceType::Sphere or TraceType = ETarge...
  - `get_swept_trace_rotation(targeting_handle)` -> `Rotator`
  - `get_trace_direction(targeting_handle)` -> `Vector` — Native Event to get the direction for the Trace
  - `get_trace_length(targeting_handle)` -> `float` — Native Event to get the length for the Trace

### `unreal.TargetingSortTask_Base`
Inherits: `TargetingTask` | Header: `TargetingSortTask_Base.h`

class: TargetingSortTask_Base A base class that has the basic setup for a sort task.

### `unreal.TargetingSubsystem`
Inherits: `GameInstanceSubsystem` | Header: `TargetingSubsystem.h`

class: UTargetingSubsystem The Targeting Subsystem is the entry point for users to initiate targeting requests. The entry point to the system is the target request handle. The handle is used to interf...

**Methods** (7):
  - `execute_targeting_request(targeting_preset, source_context, completion_dynamic_delegate)` -> `None` — Method to execute an immediate targeting request based on a gameplay targeting preset.
  - `get_targeting_results(targeting_handle)` -> `Array [ HitResult ]` — Helper method to get the set of hit results for a given targeting handle
  - `get_targeting_results_actors(targeting_handle)` -> `Array [ Actor ]` — Method to get the actor targets from a given targeting request handle
  - `get_targeting_source_context(targeting_handle)` -> `TargetingSourceContext` — Returns the targeting source context for the targeting request handle
  - `override_collision_query_task_data(targeting_handle, collision_query_data_override)` -> `None` [classmethod] — Function that lets you set a data store from a certain Targeting Handle to add some Collision Query Param Overrides
  - `remove_async_targeting_request_with_handle(targeting_handle)` -> `TargetingRequestHandle` — Method to remove an async targeting request with a given targeting handle
  - `start_async_targeting_request(targeting_preset, source_context, completion_dynamic_delegate)` -> `TargetingRequestHandle` — Method to queue an async targeting request based on a gameplay targeting preset.

### `unreal.TargetingTask`
Inherits: `Object` | Header: `TargetingTask.h`

class: UTargetingTask The base object type that all Targeting Tasks will derive from. The idea is the targeting system will take target requests that are collections of target tasks that will potentia...

**Methods** (1):
  - `get_targeting_subsystem(targeting_handle)` -> `TargetingSubsystem` — Helper method to get the Targeting Subsystem in TargetingTask Blueprint Types

### `unreal.TargetingAOEShape`
Inherits: `EnumBase` | Header: `TargetingSelectionTask_AOE.h`

enum: ETargetingAOEShape

**Properties** (5):
  - `BOX`: `TargetingAOEShape = Ellipsis` — 0
  - `CAPSULE`: `TargetingAOEShape = Ellipsis` — 3
  - `CYLINDER`: `TargetingAOEShape = Ellipsis` — 1
  - `SOURCE_COMPONENT`: `TargetingAOEShape = Ellipsis` — 4
  - `SPHERE`: `TargetingAOEShape = Ellipsis` — 2

### `unreal.TargetingTraceType`
Inherits: `EnumBase` | Header: `TargetingSelectionTask_Trace.h`

enum: ETargetingTraceType determines the shape of the trace used.

**Properties** (4):
  - `BOX`: `TargetingTraceType = Ellipsis` — 3
  - `CAPSULE`: `TargetingTraceType = Ellipsis` — With zero rotation, the capsule length runs along the traceâs up vector (the cross product of the ...
  - `LINE`: `TargetingTraceType = Ellipsis` — 0
  - `SPHERE`: `TargetingTraceType = Ellipsis` — 1

### `unreal.PerformTargetingReady`
Inherits: `MulticastDelegateBase` | Header: `AsyncAction_PerformTargeting.h`

Perform Targeting Ready Delegate Signature

### `unreal.TargetingRequestDynamicDelegate`
Inherits: `DelegateBase` | Header: `TargetingSystemTypes.h`

Targeting Request Dynamic Delegate Delegate Signature

### `unreal.TargetReadyDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_PerformTargeting.h`

Target Ready Delegate Delegate Signature
