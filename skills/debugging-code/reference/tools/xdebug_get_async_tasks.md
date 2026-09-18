# xdebug_get_async_tasks
Use it when an `await` never completes, a `.Wait()`/`.Result` call hangs, or the caller of the paused code is hidden behind an `await` that `xdebug_get_stack` cannot cross.<br/><br/>Preconditions:<br/>- Session must be suspended in the .NET debugger (.NET or .NET Framework). Mono and Unity are not supported.<br/><br/>Behavior:<br/>- Scans the heap for every incomplete `Task` (including `Task<TResult>` and promises such as `Task.Delay`, `Task.WhenAll`, `ContinueWith`) and parses the stacks of all threads. Completed tasks are omitted.<br/>- `task` nodes are Task objects. `thread` nodes are threads blocked in a synchronous wait (`Wait`, `Result`, `WaitAll`, `RunSynchronously`); other threads are not nodes.<br/>- `waitsForNodeIds`: node A lists B when A waits for B, asynchronously (`await`, `ContinueWith`, parent waiting for attached children) or synchronously (`Wait`/`Result`). Waiters of A are the nodes whose `waitsForNodeIds` contain A's `id`.<br/>- Each node carries `initialLocation` (entry method) and `currentLocation` (current `await` or wait point). The full chain is in `xdebug_get_async_task_stack`.<br/>- `threadId` is set for `thread` nodes and for `task` nodes that currently run on a thread.<br/>- The graph is a snapshot of the current pause, computed once per pause. Node ids stay valid until the session resumes.<br/><br/>Pagination:<br/>- `offset`/`limit` are applied after collecting the whole graph. `totalCount` is the full node count.<br/><br/>Ordering:<br/>- By node id.<br/><br/>Next call:<br/>- Use `xdebug_get_async_task_stack` with the node `id` when `initialLocation` and `currentLocation` are not enough, for example to find the caller of a shared helper.<br/>- To inspect values, find the thread in `xdebug_get_threads` (a node's `threadId` matches the `@<id>` suffix of the thread name) and use `xdebug_get_stack` frame indexes.<br/>- If the tool reports unsupported or unavailable task data, fall back to `xdebug_get_threads` and `xdebug_get_stack`.

## Parameters
| Name | Type | Description |
| --- | --- | --- |
| sessionId | string | Debug session ID. Use the current ID returned by `xdebug_get_debugger_status` or `xdebug_start_debugger_session`. The ID remains stable after the session stops. Active-only operations return `SESSION_NOT_ACTIVE` for retained stopped sessions. If null and exactly one active session exists, it is selected automatically. If multiple sessions are active and sessionId is omitted, the call fails. Default: null. |
| limit | integer | Page size. Default: 50, max: 200. |
| offset | integer | Page offset. Default: 0. |
| rootFolder | string | The path to the root folder of the Rider solution or project. Pass this value ALWAYS if you are aware of it. It reduces numbers of ambiguous calls.<br/>In the case you know only the current working directory you can use it as the root folder path.<br/>If you're not aware about the root folder path you can ask user about it. |

## Output
| Name | Type | Description |
| --- | --- | --- |
| sessionName* | string | Human-readable session name. |
| nodes* | array[object] | Task and thread nodes of the async graph on the requested page. Empty when the paused process has no incomplete tasks. |
| &nbsp;&nbsp;[].id* | integer | Node id. Pass it as `nodeId` to `xdebug_get_async_task_stack` and use it to resolve `waitsForNodeIds`. Stable within one pause; |
| &nbsp;&nbsp;[].kind* | task \\| thread | `task`: an incomplete `System.Threading.Tasks.Task` object. `thread`: a thread blocked in a synchronous wait on a task (`Wait`, `Result`, `WaitAll`, `RunSynchronously`). |
| &nbsp;&nbsp;[].status* | active \\| blocked \\| deadlocked \\| scheduled \\| awaiting | `active`: runs on a thread now. `blocked`: waits synchronously, or its thread is in WaitSleepJoin; `awaiting`: suspended at an `await` with a known dependency in `waitsForNodeIds`. `scheduled`: not running and no known dependency: not started yet, or waits on something the graph does not model. `deadlocked`: its thread is in a mutual lock wait with another thread. |
| &nbsp;&nbsp;[].taskId | integer? | Runtime `Task.Id`. Stable while the task lives. `task` nodes only; absent when the ID could not be read. |
| &nbsp;&nbsp;[].parentTaskId | integer? | `Task.Id` of the parent task when this task is attached to a parent. `task` nodes only. |
| &nbsp;&nbsp;[].threadId | integer? | Debugger thread ID of the thread that runs this node. Always present for `thread` nodes. Present for a `task` node only while the task runs on a thread (`active`, or `blocked` inside a synchronous wait); absent for `awaiting` and `scheduled` tasks. Matches the `@<id>` suffix of the thread name returned by `xdebug_get_threads`. |
| &nbsp;&nbsp;[].initialLocation | object? | Entry method of the node: frame 0 of `xdebug_get_async_task_stack`. Absent when the debugger could not resolve any method. |
| &nbsp;&nbsp;&nbsp;&nbsp;presentation* | string | Rendered function/method frame label from debugger UI. |
| &nbsp;&nbsp;&nbsp;&nbsp;file | string? | Source file path as provided by the debugger when available. |
| &nbsp;&nbsp;&nbsp;&nbsp;line | integer? | 1-based source line when available. |
| &nbsp;&nbsp;[].currentLocation | object? | Current `await` or wait point of the node: the last frame of `xdebug_get_async_task_stack`. Absent for `scheduled` nodes, which have not started, and when the debugger could not resolve any method. |
| &nbsp;&nbsp;&nbsp;&nbsp;presentation* | string | Rendered function/method frame label from debugger UI. |
| &nbsp;&nbsp;&nbsp;&nbsp;file | string? | Source file path as provided by the debugger when available. |
| &nbsp;&nbsp;&nbsp;&nbsp;line | integer? | 1-based source line when available. |
| &nbsp;&nbsp;[].frameCount* | integer | Number of frames `xdebug_get_async_task_stack` returns for this node. 0 when the debugger could not resolve any method. |
| &nbsp;&nbsp;[].waitsForNodeIds* | array[integer] | `id` values of the nodes this node waits for, ascending. Empty for a leaf. Nodes whose list contains this node's `id` are its waiters. A referenced node can be on another page. |
| offset* | integer | Requested page offset. |
| limit* | integer | Requested page limit. |
| totalCount* | integer | Total node count in the graph. |

