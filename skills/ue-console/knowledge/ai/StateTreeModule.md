# UE Python API — StateTreeModule Module

**40 types** from the `StateTreeModule` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `StateTreeActiveStates`, `StateTreeBlueprintPropertyRef`, `StateTreeDataHandle`, `StateTreeDelegateDispatcher`, `StateTreeDelegateListener`, `StateTreeEvent`, `StateTreeExecutionFrame`, `StateTreeIndex16`, `StateTreeIndex8`, `StateTreePropertyRef`, `StateTreeReference`, `StateTreeReferenceOverrideItem`, `StateTreeReferenceOverrides`, `StateTreeStateHandle`, `StateTreeStateLink`, `StateTreeStructRef`, `StateTreeTransitionRequest`, `StateTreeTransitionResult`, `StateTree`, `StateTreeConditionBlueprintBase`, ... (40 total)

---

## Classes

### `unreal.StateTreeActiveStates`
Inherits: `StructBase` | Header: `StateTreeExecutionTypes.h`

Describes an array of active states in a State Tree.

### `unreal.StateTreeBlueprintPropertyRef`
Inherits: `StateTreePropertyRef` | Header: `StateTreePropertyRef.h`

FStateTreeBlueprintPropertyRef is a PropertyRef intended to be used in State Tree Blueprint nodes like tasks, conditions or evaluators, but also as a StateTree parameter.

### `unreal.StateTreeDataHandle`
Inherits: `StructBase` | Header: `StateTreeTypes.h`

Handle to a StateTree data

### `unreal.StateTreeDelegateDispatcher`
Inherits: `StructBase` | Header: `StateTreeDelegate.h`

StateTreeâs delegate dispatcher.

### `unreal.StateTreeDelegateListener`
Inherits: `StructBase` | Header: `StateTreeDelegate.h`

The receiver of a delegate binding. Can be bound in the editor to a delegate dispatcher.

### `unreal.StateTreeEvent`
Inherits: `StructBase` | Header: `StateTreeEvents.h`

StateTree event with payload.

**Properties** (3):
  - `origin`: `Name` — [Read-Write] Optional info to describe who sent the event. (Name)
  - `payload`: `InstancedStruct` — [Read-Write] Optional payload for the event. (InstancedStruct)
  - `tag`: `GameplayTag` — [Read-Write] Tag describing the event (GameplayTag)

### `unreal.StateTreeExecutionFrame`
Inherits: `StructBase` | Header: `StateTreeExecutionTypes.h`

Describes an active branch of a State Tree.

### `unreal.StateTreeIndex16`
Inherits: `StructBase` | Header: `StateTreeIndexTypes.h`

uint16 index that can be invalid.

### `unreal.StateTreeIndex8`
Inherits: `StructBase` | Header: `StateTreeIndexTypes.h`

uint8 index that can be invalid.

### `unreal.StateTreePropertyRef`
Inherits: `StructBase` | Header: `StateTreePropertyRef.h`

Property ref allows to get a pointer to selected property in StateTree. The expected type of the reference should be set in âRefTypeâ meta specifier.

### `unreal.StateTreeReference`
Inherits: `StructBase` | Header: `StateTreeReference.h`

Struct to hold reference to a StateTree asset along with values to parameterized it.

### `unreal.StateTreeReferenceOverrideItem`
Inherits: `StructBase` | Header: `StateTreeReference.h`

Item describing a state tree override for a state with a specific tag.

### `unreal.StateTreeReferenceOverrides`
Inherits: `StructBase` | Header: `StateTreeReference.h`

Overrides for linked State Trees. This table is used to override State Tree references on linked states. If a linked stateâs tag is exact match of the tag specified on the table, the reference from ...

### `unreal.StateTreeStateHandle`
Inherits: `StructBase` | Header: `StateTreeTypes.h`

Handle to a StateTree state

### `unreal.StateTreeStateLink`
Inherits: `StructBase` | Header: `StateTreeTypes.h`

Link to another state in StateTree

### `unreal.StateTreeStructRef`
Inherits: `StructBase` | Header: `StateTreeTypes.h`

StateTree struct ref allows to get a reference/pointer to a specified type via property binding. It is useful for referencing larger properties to avoid copies of the data, or to be able to write to a...

### `unreal.StateTreeTransitionRequest`
Inherits: `StructBase` | Header: `StateTreeExecutionTypes.h`

Transition request

### `unreal.StateTreeTransitionResult`
Inherits: `StructBase` | Header: `StateTreeExecutionTypes.h`

Describes a state tree transition. Source is the state where the transition started, Target describes the state where the transition pointed at, and Next describes the selected state. The reason Trans...

**Properties** (9):
  - `change_type`: `StateTreeStateChangeType` [Read-Only] — [Read-Only] If the change type is Sustained, then the CurrentState was reselected, or if Changed the...
  - `current_run_status`: `StateTreeRunStatus` [Read-Only] — [Read-Only] Current Run status. (StateTreeRunStatus)
  - `current_state`: `StateTreeStateHandle` [Read-Only] — [Read-Only] The current state being executed. On enter/exit callbacks this is the state of the task....
  - `next_active_frames`: `None` [Read-Only] — [Read-Only] States selected as result of the transition. (Array[StateTreeExecutionFrame])
  - `priority`: `StateTreeTransitionPriority` [Read-Only] — [Read-Only] Priority of the transition that caused the state change. (StateTreeTransitionPriority)
  - `source_root_state`: `StateTreeStateHandle` [Read-Only] — [Read-Only] Root state the execution frame where the transition was requested. (StateTreeStateHandle...
  - `source_state`: `StateTreeStateHandle` [Read-Only] — [Read-Only] Transition source state. (StateTreeStateHandle)
  - `source_state_tree`: `StateTree` [Read-Only] — [Read-Only] StateTree asset that was active when the transition was requested. (StateTree)
  - `target_state`: `StateTreeStateHandle` [Read-Only] — [Read-Only] Transition target state. It can be a completion state. (StateTreeStateHandle)

### `unreal.StateTree`
Inherits: `DataAsset` | Header: `StateTree.h`

StateTree asset. Contains the StateTree definition in both editor and runtime (baked) formats.

### `unreal.StateTreeConditionBlueprintBase`
Inherits: `StateTreeNodeBlueprintBase` | Header: `StateTreeConditionBlueprintBase.h`

Base class for Blueprint based Conditions.

**Methods** (1):
  - `receive_test_condition()` -> `bool` — Receive Test Condition

### `unreal.StateTreeConsiderationBlueprintBase`
Inherits: `StateTreeNodeBlueprintBase` | Header: `StateTreeConsiderationBlueprintBase.h`

Base class for Blueprint based Considerations.

**Methods** (1):
  - `receive_get_score()` -> `float` — Receive Get Score

### `unreal.StateTreeEvaluatorBlueprintBase`
Inherits: `StateTreeNodeBlueprintBase` | Header: `StateTreeEvaluatorBlueprintBase.h`

Base class for Blueprint based evaluators.

**Methods** (3):
  - `receive_tick(delta_time)` -> `None` — Receive Tick
  - `receive_tree_start()` -> `None` — Receive Tree Start
  - `receive_tree_stop()` -> `None` — Receive Tree Stop

### `unreal.StateTreeFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `StateTreeFunctionLibrary.h`

A collection of blueprint functions for state tree.

**Methods** (1):
  - `set_state_tree(reference, state_tree)` -> `StateTreeReference` [classmethod] — Set State Tree

### `unreal.StateTreeNodeBlueprintBase`
Inherits: `Object` | Header: `StateTreeNodeBlueprintBase.h`

State Tree Node Blueprint Base

**Methods** (3):
  - `receive_get_description(formatting)` -> `Text` — Event to implement to get node description.
  - `request_transition(target_state, priority = StateTreeTransitionPriority.NORMAL)` -> `None` — Request state transition.
  - `send_event(event)` -> `None` — Sends event to the StateTree.

### `unreal.StateTreeSchema`
Inherits: `Object` | Header: `StateTreeSchema.h`

Schema describing which inputs, evaluators, and tasks a StateTree can contain. Each StateTree asset saves the schema class name in asset data tags, which can be used to limit which StatTree assets can...

### `unreal.StateTreeTaskBlueprintBase`
Inherits: `StateTreeNodeBlueprintBase` | Header: `StateTreeTaskBlueprintBase.h`

Base class for Blueprint based Tasks.

**Methods** (10):
  - `bind_delegate(listener, delegate)` -> `None` — Registers the callback to the listener. If the listener was previously registered, then unregister it first before regis...
  - `broadcast_delegate(dispatcher)` -> `None` — Broadcasts the dispatcher. It will triggers bound callback (bound with BindDelegate) and bound transitions.
  - `finish_task(succeeded = True)` -> `None` — Finish the task and sets itâs status.
  - `receive_enter_state(transition)` -> `StateTreeRunStatus` — Receive Enter State deprecated: Use the new EnterState event without without return value instead. Task status is now co...
  - `receive_exit_state(transition)` -> `None` — Called when a current state is exited and task is part of active states.
  - `receive_latent_enter_state(transition)` -> `None` — Called when a new state is entered and task is part of active states. Use FinishTask() to set the task execution complet...
  - `receive_latent_tick(delta_time)` -> `None` — Called during state tree tick when the task is on active state. Use FinishTask() to set the task execution completed. St...
  - `receive_state_completed(completion_status, completed_active_states)` -> `None` — Called right after a state has been completed, but before new state has been selected. StateCompleted is called in rever...
  - `receive_tick(delta_time)` -> `StateTreeRunStatus` — Receive Tick deprecated: Use the new Tick event without without return value instead. Task status is now controlled via ...
  - `unbind_delegate(listener)` -> `None` — Unregisters the callback bound to the listener.

### `unreal.StateTreeDataSourceType`
Inherits: `EnumBase` | Header: `StateTreeTypes.h`

Data type the FStateTreeDataHandle is pointing at.

**Properties** (14):
  - `ACTIVE_INSTANCE_DATA`: `StateTreeDataSourceType = Ellipsis` — Active State Tasks 3
  - `ACTIVE_INSTANCE_DATA_OBJECT`: `StateTreeDataSourceType = Ellipsis` — Active State Tasks 4
  - `CONTEXT_DATA`: `StateTreeDataSourceType = Ellipsis` — Context Data, Tree Parameters 7
  - `EXTERNAL_DATA`: `StateTreeDataSourceType = Ellipsis` — External Data required by the nodes. 8
  - `EXTERNAL_GLOBAL_PARAMETER_DATA`: `StateTreeDataSourceType = Ellipsis` — Global parameters provided externally 14
  - `GLOBAL_INSTANCE_DATA`: `StateTreeDataSourceType = Ellipsis` — Global Tasks, Evaluators 1
  - `GLOBAL_INSTANCE_DATA_OBJECT`: `StateTreeDataSourceType = Ellipsis` — Global Tasks, Evaluators 2
  - `GLOBAL_PARAMETER_DATA`: `StateTreeDataSourceType = Ellipsis` — Global parameters 9
  - `SHARED_INSTANCE_DATA`: `StateTreeDataSourceType = Ellipsis` — Conditions and Considerations 5
  - `SHARED_INSTANCE_DATA_OBJECT`: `StateTreeDataSourceType = Ellipsis` — Conditions and Considerations 6
  - `STATE_EVENT`: `StateTreeDataSourceType = Ellipsis` — Event used in state selection. 13
  - `STATE_PARAMETER_DATA`: `StateTreeDataSourceType = Ellipsis` — Parameters for regular and linked states 11
  - `SUBTREE_PARAMETER_DATA`: `StateTreeDataSourceType = Ellipsis` — Parameters for subtree (may resolve to a linked stateâs parameters or default params) 10
  - `TRANSITION_EVENT`: `StateTreeDataSourceType = Ellipsis` — Event used in transition. 12

### `unreal.StateTreeExpressionOperand`
Inherits: `EnumBase` | Header: `StateTreeTypes.h`

Operand in an expression

**Properties** (2):
  - `AND`: `StateTreeExpressionOperand = Ellipsis` — Combine results with AND. 1
  - `OR`: `StateTreeExpressionOperand = Ellipsis` — Combine results with OR. 2

### `unreal.StateTreeNodeFormatting`
Inherits: `EnumBase` | Header: `StateTreeNodeBase.h`

Enum describing in what format a text is expected to be returned.

**Properties** (2):
  - `RICH_TEXT`: `StateTreeNodeFormatting = Ellipsis` — The returned text can contain following right text formatting (no nesting)
- <b>Bold</> (bolder font...
  - `TEXT`: `StateTreeNodeFormatting = Ellipsis` — The text should be unformatted 1

### `unreal.StateTreePropertyRefType`
Inherits: `EnumBase` | Header: `StateTreePropertyRef.h`

EState Tree Property Ref Type

**Properties** (16):
  - `BOOL`: `StateTreePropertyRefType = Ellipsis` — 1
  - `BYTE`: `StateTreePropertyRefType = Ellipsis` — 2
  - `CLASS`: `StateTreePropertyRefType = Ellipsis` — 14
  - `DOUBLE`: `StateTreePropertyRefType = Ellipsis` — 6
  - `ENUM`: `StateTreePropertyRefType = Ellipsis` — 10
  - `FLOAT`: `StateTreePropertyRefType = Ellipsis` — 5
  - `INT32`: `StateTreePropertyRefType = Ellipsis` — 3
  - `INT64`: `StateTreePropertyRefType = Ellipsis` — 4
  - `NAME`: `StateTreePropertyRefType = Ellipsis` — 7
  - `NONE`: `StateTreePropertyRefType = Ellipsis` — 0
  - `OBJECT`: `StateTreePropertyRefType = Ellipsis` — 12
  - `SOFT_CLASS`: `StateTreePropertyRefType = Ellipsis` — 15
  - `SOFT_OBJECT`: `StateTreePropertyRefType = Ellipsis` — 13
  - `STRING`: `StateTreePropertyRefType = Ellipsis` — 8
  - `STRUCT`: `StateTreePropertyRefType = Ellipsis` — 11
  - `TEXT`: `StateTreePropertyRefType = Ellipsis` — 9

### `unreal.StateTreeRunStatus`
Inherits: `EnumBase` | Header: `StateTreeExecutionTypes.h`

Status describing current run status of a State Tree.

**Properties** (5):
  - `FAILED`: `StateTreeRunStatus = Ellipsis` — Tree execution has stopped on failure. 3
  - `RUNNING`: `StateTreeRunStatus = Ellipsis` — Tree is still running. 0
  - `STOPPED`: `StateTreeRunStatus = Ellipsis` — The State Tree was requested to stop without a particular success or failure state. 1
  - `SUCCEEDED`: `StateTreeRunStatus = Ellipsis` — Tree execution has stopped on success. 2
  - `UNSET`: `StateTreeRunStatus = Ellipsis` — Status not set. 4

### `unreal.StateTreeSelectionFallback`
Inherits: `EnumBase` | Header: `StateTreeTypes.h`

Fallback behavior indicating what to do after failing to select a state

**Properties** (2):
  - `NEXT_SELECTABLE_SIBLING`: `StateTreeSelectionFallback = Ellipsis` — Find next selectable sibling, if any, and select it 1
  - `NONE`: `StateTreeSelectionFallback = Ellipsis` — No fallback 0

### `unreal.StateTreeStateChangeType`
Inherits: `EnumBase` | Header: `StateTreeExecutionTypes.h`

State change type. Passed to EnterState() and ExitState() to indicate how the state change affects the state and Evaluator or Task is on.

**Properties** (3):
  - `CHANGED`: `StateTreeStateChangeType = Ellipsis` — The state became activated or deactivated. 1
  - `NONE`: `StateTreeStateChangeType = Ellipsis` — Not an activation 0
  - `SUSTAINED`: `StateTreeStateChangeType = Ellipsis` — The state is parent of new active state and sustained previous active state. 2

### `unreal.StateTreeStateSelectionBehavior`
Inherits: `EnumBase` | Header: `StateTreeTypes.h`

EState Tree State Selection Behavior

**Properties** (7):
  - `NONE`: `StateTreeStateSelectionBehavior = Ellipsis` — The State cannot be directly selected. 0
  - `TRY_ENTER_STATE`: `StateTreeStateSelectionBehavior = Ellipsis` — When state is considered for selection, it is selected even if it has child states. 1
  - `TRY_FOLLOW_TRANSITIONS`: `StateTreeStateSelectionBehavior = Ellipsis` — When state is considered for selection, try to trigger the transitions instead. 6
  - `TRY_SELECT_CHILDREN_AT_RANDOM`: `StateTreeStateSelectionBehavior = Ellipsis` — When state is considered for selection, shuffle the order of child states and try to select the firs...
  - `TRY_SELECT_CHILDREN_AT_RANDOM_WEIGHTED_BY_UTILITY`: `StateTreeStateSelectionBehavior = Ellipsis` — When state is considered for selection, randomly pick one of its child states. The probability of se...
  - `TRY_SELECT_CHILDREN_IN_ORDER`: `StateTreeStateSelectionBehavior = Ellipsis` — When state is considered for selection, try to select the first child state (in order they appear in...
  - `TRY_SELECT_CHILDREN_WITH_HIGHEST_UTILITY`: `StateTreeStateSelectionBehavior = Ellipsis` — When state is considered for selection, try to select the child state with highest utility score. If...

### `unreal.StateTreeStateType`
Inherits: `EnumBase` | Header: `StateTreeTypes.h`

EState Tree State Type

**Properties** (5):
  - `GROUP`: `StateTreeStateType = Ellipsis` — A State containing just child states. 1
  - `LINKED`: `StateTreeStateType = Ellipsis` — A State that is linked to another state in the tree (the execution continues on the linked state). 2
  - `LINKED_ASSET`: `StateTreeStateType = Ellipsis` — A State that is linked to another StateTree asset (the execution continues on the Root state of the ...
  - `STATE`: `StateTreeStateType = Ellipsis` — A State containing tasks and child states. 0
  - `SUBTREE`: `StateTreeStateType = Ellipsis` — A subtree that can be linked to. 4

### `unreal.StateTreeTaskCompletionType`
Inherits: `EnumBase` | Header: `StateTreeTasksStatus.h`

EState Tree Task Completion Type

**Properties** (2):
  - `ALL`: `StateTreeTaskCompletionType = Ellipsis` — All tasks need to complete for the group to completes. 0
  - `ANY`: `StateTreeTaskCompletionType = Ellipsis` — Any task completes the group. 1

### `unreal.StateTreeTransitionPriority`
Inherits: `EnumBase` | Header: `StateTreeTypes.h`

Transition priority. When multiple transitions trigger at the same time, the first transition of highest priority is selected.

**Properties** (5):
  - `CRITICAL`: `StateTreeTransitionPriority = Ellipsis` — Critical priority. 5
  - `HIGH`: `StateTreeTransitionPriority = Ellipsis` — High priority. 4
  - `LOW`: `StateTreeTransitionPriority = Ellipsis` — Low priority. 1
  - `MEDIUM`: `StateTreeTransitionPriority = Ellipsis` — Medium priority. 3
  - `NORMAL`: `StateTreeTransitionPriority = Ellipsis` — Normal priority. 2

### `unreal.StateTreeTransitionTrigger`
Inherits: `EnumBase` | Header: `StateTreeTypes.h`

Transitions trigger.

**Properties** (6):
  - `ON_DELEGATE`: `StateTreeTransitionTrigger = Ellipsis` — Try trigger transition on specific State Tree delegate. 16
  - `ON_EVENT`: `StateTreeTransitionTrigger = Ellipsis` — Try trigger transition on specific State Tree event. 8
  - `ON_STATE_COMPLETED`: `StateTreeTransitionTrigger = Ellipsis` — Try trigger transition when a state succeeded or failed. 3
  - `ON_STATE_FAILED`: `StateTreeTransitionTrigger = Ellipsis` — Try trigger transition when a state failed. 2
  - `ON_STATE_SUCCEEDED`: `StateTreeTransitionTrigger = Ellipsis` — Try trigger transition when a state succeeded. 1
  - `ON_TICK`: `StateTreeTransitionTrigger = Ellipsis` — Try trigger transition each State Tree tick. 4

### `unreal.StateTreeTransitionType`
Inherits: `EnumBase` | Header: `StateTreeTypes.h`

Transitions behavior.

**Properties** (7):
  - `FAILED`: `StateTreeTransitionType = Ellipsis` — Stop State Tree or sub-tree and mark execution failed. 2
  - `GOTO_STATE`: `StateTreeTransitionType = Ellipsis` — Transition to the specified state. 3
  - `NEXT_SELECTABLE_STATE`: `StateTreeTransitionType = Ellipsis` — Transition to the next selectable sibling state 5
  - `NEXT_STATE`: `StateTreeTransitionType = Ellipsis` — Transition to the next sibling state. 4
  - `NONE`: `StateTreeTransitionType = Ellipsis` — No transition will take place. 0
  - `NOT_SET`: `StateTreeTransitionType = Ellipsis` — 6
  - `SUCCEEDED`: `StateTreeTransitionType = Ellipsis` — Stop State Tree or sub-tree and mark execution succeeded. 1

### `unreal.StateTreeDynamicDelegate`
Inherits: `DelegateBase` | Header: `StateTreeTaskBlueprintBase.h`

State Tree Dynamic Delegate Delegate Signature
