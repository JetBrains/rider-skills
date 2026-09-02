# xdebug_get_debugger_status
Pass `sessionId` to query one active or retained session directly.<br/><br/>Preconditions:<br/>- None.<br/><br/>Without `sessionId`, returns active sessions followed by the five most recent stopped sessions.<br/><br/>Next call:<br/>- If no sessions are running, call `xdebug_start_debugger_session`.<br/>- If multiple sessions are active, use the returned `sessionId` in subsequent calls.

## Parameters
| Name | Type | Description |
| --- | --- | --- |
| sessionId | string | Optional stable session ID. When specified, returns exactly that active or retained session. |
| rootFolder | string | The path to the root folder of the Rider solution or project. Pass this value ALWAYS if you are aware of it. It reduces numbers of ambiguous calls.<br/>In the case you know only the current working directory you can use it as the root folder path.<br/>If you're not aware about the root folder path you can ask user about it. |

## Output
| Name | Type | Description |
| --- | --- | --- |
| sessions* | array[object] | All currently known debug sessions. |
| &nbsp;&nbsp;[].sessionId* | string | Stable session identifier to use as `sessionId` in debugger calls. |
| &nbsp;&nbsp;[].name* | string | Session display name. |
| &nbsp;&nbsp;[].state* | running \\| paused \\| stopped \\| failed_to_start | Current session state. |
| &nbsp;&nbsp;[].runConfigurationName | string? | Associated run configuration name when available. |
| &nbsp;&nbsp;[].breakpointsMuted | boolean | Whether breakpoints are globally muted for this debugger session. |
| &nbsp;&nbsp;[].currentPosition | object? | Current source position for paused sessions, if available. |
| &nbsp;&nbsp;&nbsp;&nbsp;filePath* | string | File path as provided by the debugger (usually VirtualFile.url). |
| &nbsp;&nbsp;&nbsp;&nbsp;line* | integer | 1-based line number. |
| &nbsp;&nbsp;&nbsp;&nbsp;column | integer? | 1-based column number when available. |
| &nbsp;&nbsp;[].exitCode | integer? | Process exit code when termination has been observed. |
| activeSessionId | string? | Identifier of the active session, if any. |

