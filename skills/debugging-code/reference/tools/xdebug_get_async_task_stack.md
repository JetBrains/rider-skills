# xdebug_get_async_task_stack
Preconditions:<br/>- Session must be suspended in the .NET debugger, at the same pause as the `xdebug_get_async_tasks` call that returned `nodeId`.<br/><br/>Behavior:<br/>- Frames are ordered from the entry method (index 0) to the current `await` or wait point (the last index). For a `task` node this is the chain of `async` methods that awaits, directly or through other tasks, the completion of this task. For a `thread` node this is the physical stack of the blocked thread.<br/>- A frame is a method, not an evaluation frame: `index` is not a `frameIndex` for `xdebug_get_frame_values` or `xdebug_evaluate_expression`.<br/>- Each frame carries the debugger presentation and, when symbols exist, `file` and `line`.<br/>- Fails with an unknown node id when the graph was recomputed after a resume. Call `xdebug_get_async_tasks` again.<br/><br/>Pagination:<br/>- `offset`/`limit` are applied to the frame list. `totalFrames` is the full count.<br/><br/>Next call:<br/>- To evaluate values, find the thread that runs the node (`threadId` in `xdebug_get_async_tasks`) and use `xdebug_get_stack` on it.

## Parameters
| Name | Type | Description |
| --- | --- | --- |
| nodeId* | integer | Node `id` from `xdebug_get_async_tasks`. |
| sessionId | string | Debug session ID. Use the current ID returned by `xdebug_get_debugger_status` or `xdebug_start_debugger_session`. The ID remains stable after the session stops. Active-only operations return `SESSION_NOT_ACTIVE` for retained stopped sessions. If null and exactly one active session exists, it is selected automatically. If multiple sessions are active and sessionId is omitted, the call fails. Default: null. |
| limit | integer | Page size. Default: 100, max: 500. |
| offset | integer | Page offset. Default: 0. |
| rootFolder | string | The path to the root folder of the Rider solution or project. Pass this value ALWAYS if you are aware of it. It reduces numbers of ambiguous calls.<br/>In the case you know only the current working directory you can use it as the root folder path.<br/>If you're not aware about the root folder path you can ask user about it. |

## Output
| Name | Type | Description |
| --- | --- | --- |
| nodeId* | integer | Node id the frames belong to. |
| frames* | array[object] | Frames of the requested page, ordered from the entry method (index 0) to the current `await` or wait point (the last index). Empty when the debugger could not resolve any method. |
| &nbsp;&nbsp;[].index* | integer | 0-based position in the node's logical chain: 0 is the entry method, `totalFrames - 1` is the current `await` or wait point. It is not a `frameIndex` for `xdebug_get_frame_values` or `xdebug_evaluate_expression`. |
| &nbsp;&nbsp;[].presentation* | string | Rendered function/method frame label from debugger UI. |
| &nbsp;&nbsp;[].file | string? | Source file path as provided by the debugger when available. |
| &nbsp;&nbsp;[].line | integer? | 1-based source line when available. |
| totalFrames* | integer | Total frame count for the node. |

