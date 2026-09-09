# xdebug_set_breakpoints
Breakpoint configuration does not require an active debug session.<br/><br/>Batch behavior:<br/>- Each item is processed in request order.<br/>- A validation or targeting failure does not stop the remaining items.<br/><br/>Per-item targeting modes:<br/>- Location mode: provide `filePath` + 1-based `line`, and omit `breakpointId`.<br/>- ID mode: provide an opaque `breakpointId` returned by this tool or `xdebug_list_breakpoints`.<br/>  Optional `filePath`/`line` relocate a line breakpoint; they are ignored for non-line breakpoints.<br/><br/>Apply semantics:<br/>- Each item describes the complete target state. An ID update replaces the state instead of patching it.<br/>- Omitted settings use their defaults. Pass all settings that you must preserve.<br/>- The tool ignores relocation fields for other breakpoint types and reports this in `message`.<br/>- A new breakpoint has `agent` ownership. An update keeps the current ownership.

## Parameters
| Name | Type | Description |
| --- | --- | --- |
| breakpoints* | array[object] | Ordered breakpoint create/update requests. Pass 1..50 items, or an empty array only for a breakpointsMuted operation. |
| &nbsp;&nbsp;[].breakpointId | string? | Canonical breakpoint ID returned by `xdebug_set_breakpoints` or `xdebug_list_breakpoints`. Provide this for ID mode; omit it for location mode. |
| &nbsp;&nbsp;[].filePath | string? | Path to the file. Required with `line` in location mode; optional in ID mode to relocate a line breakpoint. |
| &nbsp;&nbsp;[].line | integer? | 1-based line number. Required with `filePath` in location mode; optional in ID mode to relocate a line breakpoint. |
| &nbsp;&nbsp;[].condition | string? | Condition expression; the breakpoint triggers only when it evaluates to true. Null clears an existing condition. |
| &nbsp;&nbsp;[].logExpression | string? | Expression that the debugger evaluates and logs when the breakpoint triggers. Null clears an existing expression. |
| &nbsp;&nbsp;[].isLogMessage | boolean? | Whether to log the breakpoint source position when hit. Default: false. |
| &nbsp;&nbsp;[].isLogStack | boolean? | Whether to log the current stack trace when hit. Default: false. |
| &nbsp;&nbsp;[].temporary | boolean? | Whether this is a temporary breakpoint removed after its first hit. Default: false. |
| &nbsp;&nbsp;[].suspendPolicy | string? | Suspend policy: ALL suspends all threads, THREAD suspends only the thread that hits the breakpoint, and NONE suspends no threads. Default: ALL. |
| &nbsp;&nbsp;[].enabled | boolean? | Whether the breakpoint is enabled. Default: true. |
| sessionId | string | Active debug session ID used only to report or change its breakpoint mute state. If null, the tool reports the mute state only when exactly one active session exists. Default: null. |
| breakpointsMuted | boolean | Session-wide breakpoint mute flag. When provided, `breakpoints` must be empty and an active session must be selected. The flag does not change the `enabled` setting of a breakpoint. Default: null. |
| rootFolder | string | The path to the root folder of the Rider solution or project. Pass this value ALWAYS if you are aware of it. It reduces numbers of ambiguous calls.<br/>In the case you know only the current working directory you can use it as the root folder path.<br/>If you're not aware about the root folder path you can ask user about it. |

## Output
| Name | Type | Description |
| --- | --- | --- |
| results* | array[object] | Per-breakpoint results in the same order as the request's breakpoints array. |
| &nbsp;&nbsp;[].index* | integer | Zero-based index of the corresponding item in the request's breakpoints array. |
| &nbsp;&nbsp;[].success* | boolean | Whether the breakpoint settings were applied. Success does not validate expressions or confirm that execution reached the breakpoint. |
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
| totalBreakpoints* | integer | Current total number of project breakpoints after all operations. |
| breakpointsMuted | boolean | Whether breakpoints are muted for the selected session. False when no session is selected. |

