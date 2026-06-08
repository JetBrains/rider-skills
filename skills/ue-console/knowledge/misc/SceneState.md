# UE Python API — SceneState Module

**6 types** from the `SceneState` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SceneStateTransitionResult`, `SceneStateBlueprintableTask`, `SceneStateObject`, `SceneStatePlayer`, `SceneStateTaskResult`, `SceneStateTaskStopReason`

---

## Classes

### `unreal.SceneStateTransitionResult`
Inherits: `StructBase` | Header: `SceneStateTransitionResult.h`

Scene State Transition Result

**Properties** (1):
  - `can_transition`: `bool` — [Read-Write] (bool)

### `unreal.SceneStateBlueprintableTask`
Inherits: `Object` | Header: `SceneStateBlueprintableTask.h`

Scene State Blueprintable Task

**Methods** (9):
  - `finish_task(task_result = SceneStateTaskResult.SUCCEEDED)` -> `None` — Finish Task
  - `get_context_object()` -> `Object` — Get Context Object
  - `get_event_stream()` -> `SceneStateEventStream` — Get Event Stream
  - `get_root_state()` -> `SceneStateObject` — Get Root State
  - `get_task_elapsed_time()` -> `float` — Get Task Elapsed Time
  - `get_task_result()` -> `SceneStateTaskResult` — Get Task Result
  - `receive_start()` -> `None` — Called once when the Task starts
  - `receive_stop(stop_reason)` -> `None` — Called once when the Task ends
  - `receive_tick(delta_seconds)` -> `None` — Called every frame after the Task has started Must have bCanTick set to true See: USceneStateTask::CanTick

### `unreal.SceneStateObject`
Inherits: `Object` | Header: `SceneStateObject.h`

Scene State Object

**Methods** (6):
  - `get_context_object()` -> `Object` — Get Context Object
  - `get_event_stream()` -> `SceneStateEventStream` — Get Event Stream
  - `is_active()` -> `bool` — Returns true if the object has an active root state
  - `receive_enter()` -> `None` — Receive Enter
  - `receive_exit()` -> `None` — Receive Exit
  - `receive_tick(delta_seconds)` -> `None` — Receive Tick

### `unreal.SceneStatePlayer`
Inherits: `Object` | Header: `SceneStatePlayer.h`

Scene State Players is the layer between the Context Object and the rest of Scene State It instances a Scene State Object from a given class. These players exist to keep shared logic re-usable across ...

### `unreal.SceneStateTaskResult`
Inherits: `EnumBase` | Header: `SceneStateEnums.h`

Defines the possible outcomes of a task

**Properties** (3):
  - `FAILED`: `SceneStateTaskResult = Ellipsis` — 2
  - `SUCCEEDED`: `SceneStateTaskResult = Ellipsis` — 1
  - `UNDETERMINED`: `SceneStateTaskResult = Ellipsis` — 0

### `unreal.SceneStateTaskStopReason`
Inherits: `EnumBase` | Header: `SceneStateEnums.h`

Defines the reasons why a task has stopped

**Properties** (2):
  - `FINISHED`: `SceneStateTaskStopReason = Ellipsis` — Task was marked as finished 1
  - `STATE`: `SceneStateTaskStopReason = Ellipsis` — State ended (transitioning, or end play) so itâs forcing all its Active States to stop 0
