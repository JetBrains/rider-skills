# UE Python API — GameplayTasks Module

**14 types** from the `GameplayTasks` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GameplayResourceSet`, `GameplayTask`, `GameplayTask_ClaimResource`, `GameplayTask_SpawnActor`, `GameplayTask_TimeLimitedExecution`, `GameplayTask_WaitDelay`, `GameplayTaskResource`, `GameplayTasksComponent`, `GameplayTaskRunResult`, `GameplayTask_GenericGameplayTaskDelegate`, `GameplayTask_TimeLimitedExecution_TaskFinishDelegate`, `GameplayTask_WaitDelay_TaskDelayDelegate`, `GameplayTaskSpawnActorDelegate`, `OnClaimedResourcesChangeSignature`

---

## Classes

### `unreal.GameplayResourceSet`
Inherits: `StructBase` | Header: `GameplayTask.h`

Gameplay Resource Set

### `unreal.GameplayTask`
Inherits: `Object` | Header: `GameplayTask.h`

Gameplay Task

**Methods** (1):
  - `end_task()` -> `None` — Called explicitly to end the task (usually by the task itself). Calls OnDestroy. NOTE:: you need to call EndTask before ...

### `unreal.GameplayTask_ClaimResource`
Inherits: `GameplayTask` | Header: `GameplayTask_ClaimResource.h`

Gameplay Task Claim Resource

**Methods** (2):
  - `claim_resource(task_owner, resource_class, priority = 192, task_instance_name = 'None')` -> `GameplayTask_ClaimResource` [classmethod] — Claim Resource
  - `claim_resources(task_owner, resource_classes, priority = 192, task_instance_name = 'None')` -> `GameplayTask_ClaimResource` [classmethod] — Claim Resources

### `unreal.GameplayTask_SpawnActor`
Inherits: `GameplayTask` | Header: `GameplayTask_SpawnActor.h`

Convenience task for spawning actors (optionally limiting the spawning to the network authority). If not the net authority, we will not spawn and Success will not be called. The nice thing this adds i...

**Properties** (2):
  - `did_not_spawn`: `GameplayTaskSpawnActorDelegate` — on clients or potentially on server if they fail to spawn (rare) (GameplayTaskSpawnActorDelegate) [R...
  - `success`: `GameplayTaskSpawnActorDelegate` — [Read-Write] (GameplayTaskSpawnActorDelegate)

### `unreal.GameplayTask_TimeLimitedExecution`
Inherits: `GameplayTask` | Header: `GameplayTask_TimeLimitedExecution.h`

Adds time limit for running a child task - child task needs to be created with UGameplayTask_TimeLimitedExecution passed as TaskOwner - activations are tied together and when either UGameplayTask_Time...

**Properties** (2):
  - `on_finished`: `TaskFinishDelegate` — [Read-Write] called when child task finishes execution before time runs out (TaskFinishDelegate)
  - `on_time_expired`: `TaskFinishDelegate` — [Read-Write] called when time runs out (TaskFinishDelegate)

### `unreal.GameplayTask_WaitDelay`
Inherits: `GameplayTask` | Header: `GameplayTask_WaitDelay.h`

Gameplay Task Wait Delay

**Properties** (1):
  - `on_finish`: `TaskDelayDelegate` — [Read-Write] (TaskDelayDelegate)

### `unreal.GameplayTaskResource`
Inherits: `Object` | Header: `GameplayTaskResource.h`

Gameplay Task Resource

**Properties** (1):
  - `manual_resource_id`: `int` [Read-Only] — [Read-Only] Overrides AutoResourceID. -1 means auto ID will be applied (int32)

### `unreal.GameplayTasksComponent`
Inherits: `ActorComponent` | Header: `GameplayTasksComponent.h`

The core ActorComponent for interfacing with the GameplayAbilities System

**Methods** (1):
  - `run_gameplay_task(task_owner, task, priority, additional_required_resources, additional_claimed_resources)` -> `GameplayTaskRunResult` [classmethod] — K2 Run Gameplay Task

**Properties** (1):
  - `on_claimed_resources_change`: `OnClaimedResourcesChangeSignature` — [Read-Write] (OnClaimedResourcesChangeSignature)

### `unreal.GameplayTaskRunResult`
Inherits: `EnumBase` | Header: `GameplayTasksComponent.h`

EGameplay Task Run Result

**Properties** (5):
  - `ERROR`: `GameplayTaskRunResult = Ellipsis` — When tried running a null-task 0
  - `FAILED`: `GameplayTaskRunResult = Ellipsis` — 1
  - `SUCCESS_ACTIVE`: `GameplayTaskRunResult = Ellipsis` — Successfully activated 3
  - `SUCCESS_FINISHED`: `GameplayTaskRunResult = Ellipsis` — Successfully activated, but finished instantly 4
  - `SUCCESS_PAUSED`: `GameplayTaskRunResult = Ellipsis` — Successfully registered for running, but currently paused due to higher priority tasks running 2

### `unreal.GameplayTask_GenericGameplayTaskDelegate`
Inherits: `MulticastDelegateBase` | Header: `GameplayTask.h`

Generic Gameplay Task Delegate Delegate Signature

### `unreal.GameplayTask_TimeLimitedExecution_TaskFinishDelegate`
Inherits: `MulticastDelegateBase` | Header: `GameplayTask_TimeLimitedExecution.h`

Task Finish Delegate Delegate Signature

### `unreal.GameplayTask_WaitDelay_TaskDelayDelegate`
Inherits: `MulticastDelegateBase` | Header: `GameplayTask_WaitDelay.h`

Task Delay Delegate Delegate Signature

### `unreal.GameplayTaskSpawnActorDelegate`
Inherits: `MulticastDelegateBase` | Header: `GameplayTask_SpawnActor.h`

Gameplay Task Spawn Actor Delegate Delegate Signature

### `unreal.OnClaimedResourcesChangeSignature`
Inherits: `MulticastDelegateBase` | Header: `GameplayTasksComponent.h`

On Claimed Resources Change Signature Delegate Signature
