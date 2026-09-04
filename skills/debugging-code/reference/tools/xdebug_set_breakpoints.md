# xdebug_set_breakpoints
Use this tool to install a batch of hypothesis-driven logpoints before one reproduction, set ordinary line breakpoints,<br/>or update existing breakpoints by ID.<br/><br/>Logpoints are the preferred, low-disturbance probe. In a `breakpoints` item, set `logExpression` together with<br/>`suspendPolicy=NONE` to evaluate and log a side-effect-free expression whenever the line is reached without stopping execution.<br/>Read logged output via `xdebug_control_session(action=DRAIN_EVENTS).tracepointOutputsTail`.<br/><br/>Batch behavior:<br/>- Provide 1..50 items in `breakpoints`; items are processed in order.<br/>- Results have matching zero-based `index` values and preserve request order.<br/>- An expected validation/targeting failure sets `success=false` and `error` for that item; remaining items are still processed.<br/>- Successful line-breakpoint results include `lineText`, a truncated excerpt of the actual resolved source line.<br/>- To only mute or unmute all breakpoints in a session, pass an empty `breakpoints` array plus `sessionId` and `breakpointsMuted`.<br/><br/>Per-item targeting modes:<br/>- Location mode: provide `filePath` + 1-based `line`, and omit `breakpointId`.<br/>- ID mode: provide an opaque `breakpointId` returned by this tool or `xdebug_list_breakpoints`.<br/>  Optional `filePath`/`line` relocate a line breakpoint; they are ignored for non-line breakpoints.<br/><br/>Apply semantics:<br/>- Each item describes the complete target state. An ID update replaces the state instead of patching it.<br/>- Omitted settings use their defaults. Pass all settings that you must preserve.<br/>- `condition=null` and `logExpression=null` clear those expressions.<br/>- `isLogMessage=true` logs breakpoint hit position.<br/>- `isLogStack=true` logs current stack trace.<br/>- If both flags are true, both position and stack are logged.<br/>- `suspendPolicy=NONE` makes expression/position/stack logging non-suspending.<br/>- An ID item can relocate a line breakpoint with `filePath` or `line`.<br/>- The tool ignores relocation fields for other breakpoint types and reports this in `message`.<br/>- Use `breakpointsMuted` in a separate call with an empty `breakpoints` array.<br/>- The mute flag does not change the `enabled` setting of a breakpoint.<br/>- A new breakpoint has `agent` ownership. An update keeps the current ownership.<br/>- Expression validation happens asynchronously; inspect `breakpointErrorsTail` after execution.<br/><br/>Next call:<br/>- Verify every successful item's `lineText`, then start/continue execution.<br/>- After execution, drain events and inspect both `tracepointOutputsTail` and `breakpointErrorsTail`.

## Parameters
| Name | Type | Description |
| --- | --- | --- |
| breakpoints* | array[object] | Ordered breakpoint create/update requests. Pass 1..50 items, or an empty array only for a breakpointsMuted operation. |
| &nbsp;&nbsp;[].breakpointId | string? | Canonical breakpoint ID returned by `xdebug_set_breakpoints` or `xdebug_list_breakpoints`. Provide this for ID mode; omit it for location mode. |
| &nbsp;&nbsp;[].filePath | string? | Path to the file. Required with `line` in location mode; optional in ID mode to relocate a line breakpoint. |
| &nbsp;&nbsp;[].line | integer? | 1-based line number. Required with `filePath` in location mode; optional in ID mode to relocate a line breakpoint. |
| &nbsp;&nbsp;[].condition | string? | Condition expression; the breakpoint triggers only when it evaluates to true. Null clears an existing condition. |
| &nbsp;&nbsp;[].logExpression | string? | Side-effect-free Evaluate-and-log expression. Combine with suspendPolicy=NONE for a non-suspending logpoint. Null clears it. |
| &nbsp;&nbsp;[].isLogMessage | boolean? | Whether to log the breakpoint source position when hit. Default: false. |
| &nbsp;&nbsp;[].isLogStack | boolean? | Whether to log the current stack trace when hit. Default: false. |
| &nbsp;&nbsp;[].temporary | boolean? | Whether this is a temporary breakpoint removed after its first hit. Default: false. |
| &nbsp;&nbsp;[].suspendPolicy | string? | Suspend policy: ALL, THREAD, or NONE. Default: ALL. |
| &nbsp;&nbsp;[].enabled | boolean? | Whether the breakpoint is enabled. Default: true. |
| sessionId | string | Debug session ID. Use the current ID returned by `xdebug_get_debugger_status` or `xdebug_start_debugger_session`. The ID remains stable after the session stops. Active-only operations return `SESSION_NOT_ACTIVE` for retained stopped sessions. If null and exactly one active session exists, it is selected automatically. If multiple sessions are active and sessionId is omitted, the call fails. Default: null. Used only to report or change the session-wide breakpoint mute state. |
| breakpointsMuted | boolean | Session-wide breakpoint mute flag. When provided, `breakpoints` must be empty. Default: null. |
| rootFolder | string | The path to the root folder of the Rider solution or project. Pass this value ALWAYS if you are aware of it. It reduces numbers of ambiguous calls.<br/>In the case you know only the current working directory you can use it as the root folder path.<br/>If you're not aware about the root folder path you can ask user about it. |

## Output
| Name | Type | Description |
| --- | --- | --- |
| results* | array[object] | Per-breakpoint results in the same order as the request's breakpoints array. |
| &nbsp;&nbsp;[].index* | integer | Zero-based index of the corresponding item in the request's breakpoints array. |
| &nbsp;&nbsp;[].success* | boolean | Whether this breakpoint operation succeeded. |
| &nbsp;&nbsp;[].breakpointId | string? | Canonical breakpoint ID. Absent when the operation failed. |
| &nbsp;&nbsp;[].previousBreakpointId | string? | Previous canonical breakpoint ID when operation relocated an existing line breakpoint. |
| &nbsp;&nbsp;[].added | object? | Details of the newly added or updated breakpoint. Absent when the operation failed. |
| &nbsp;&nbsp;&nbsp;&nbsp;id* | string | Canonical breakpoint ID (stable across list/remove). |
| &nbsp;&nbsp;&nbsp;&nbsp;type* | string | Breakpoint type (line/exception/other). |
| &nbsp;&nbsp;&nbsp;&nbsp;file | string? | File path of the breakpoint as provided by the debugger (usually file URL). |
| &nbsp;&nbsp;&nbsp;&nbsp;line | integer? | 1-based breakpoint line when available. |
| &nbsp;&nbsp;&nbsp;&nbsp;enabled* | boolean | Whether breakpoint is enabled. |
| &nbsp;&nbsp;&nbsp;&nbsp;owner* | user \\| agent | Breakpoint ownership marker: `agent` if created by an MCP toolset, otherwise `user`. Updating a user breakpoint does not transfer ownership. |
| &nbsp;&nbsp;&nbsp;&nbsp;condition | string? | Conditional expression for triggering breakpoint, if set. |
| &nbsp;&nbsp;&nbsp;&nbsp;logExpression | string? | Evaluate-and-log expression of the logpoint, if set (the value logged when the line is reached). |
| &nbsp;&nbsp;&nbsp;&nbsp;isLogMessage* | boolean | Whether breakpoint logs source position when hit. |
| &nbsp;&nbsp;&nbsp;&nbsp;isLogStack* | boolean | Whether breakpoint logs stack trace when hit. |
| &nbsp;&nbsp;&nbsp;&nbsp;temporary* | boolean | Whether breakpoint is temporary. |
| &nbsp;&nbsp;&nbsp;&nbsp;suspendPolicy* | string | Breakpoint suspend policy (all/thread/none). |
| &nbsp;&nbsp;&nbsp;&nbsp;hitCount* | integer | Breakpoint hit count, 0 when unavailable. |
| &nbsp;&nbsp;[].lineText | string? | Short excerpt of the actual source line where the breakpoint resides, truncated when needed. Present for line breakpoints only. |
| &nbsp;&nbsp;[].message | string? | Additional note about the completed operation. |
| &nbsp;&nbsp;[].error | string? | Expected validation or targeting error for this operation. Present only when success=false. |
| totalBreakpoints* | integer | Current total number of breakpoints after all operations. |
| breakpointsMuted | boolean | Whether breakpoints are globally muted for the resolved debugger session. |
