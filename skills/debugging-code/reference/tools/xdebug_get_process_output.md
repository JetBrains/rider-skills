# xdebug_get_process_output
Output is captured for every debug process started inside the IDE, including sessions not started through MCP.<br/>An explicit `sessionId` can read output retained for one of the five most recent stopped sessions.<br/><br/>Behavior:<br/>- `startLine` is a zero-based line index.<br/>- Omit `startLine` to begin at `availableStartLine`, the earliest currently retained line.<br/>- At most `maxLines` complete lines are requested. Fewer available lines are returned normally.<br/>- `endLine` is the exclusive end of the returned range. Use it as `startLine` to read the next range.<br/>- `availableStartLine` and `availableEndLine` describe the half-open range of currently retained lines.<br/>  To read the latest N lines, use `startLine=max(availableStartLine, availableEndLine-N)` in a follow-up call.<br/>- Up to 1,000,000 characters are retained per session. `availableStartLine` advances when older lines are discarded.<br/>- IDE-generated system messages are excluded; stdout and stderr are returned in their observed order.

## Parameters
| Name | Type | Description |
| --- | --- | --- |
| sessionId | string | Debug session ID. Use an ID returned by `xdebug_get_debugger_status` or `xdebug_start_debugger_session`. The ID remains valid for retained output after the session stops. If null and exactly one active session exists, it is selected automatically. Default: null. |
| startLine | integer | Zero-based line index to start reading from. Defaults to the earliest currently retained line. |
| maxLines | integer | Maximum number of lines to return. Range: 1..10000. Default: 100. |
| rootFolder | string | The path to the root folder of the Rider solution or project. Pass this value ALWAYS if you are aware of it. It reduces numbers of ambiguous calls.<br/>In the case you know only the current working directory you can use it as the root folder path.<br/>If you're not aware about the root folder path you can ask user about it. |

## Output
| Name | Type | Description |
| --- | --- | --- |
| sessionId* | string | Session identifier whose process output was read. |
| output* | string | Captured stdout and stderr in the requested line range. |
| startLine* | integer | Zero-based index of the first requested line. |
| endLine* | integer | Zero-based exclusive end of the returned complete-line range. Pass this as startLine to read the next range. |
| availableStartLine* | integer | Index of the earliest line currently retained in the process output. |
| availableEndLine* | integer | Exclusive end of the line range currently retained in the process output. |
| isRunning* | boolean | Whether the debug process is still running. |
| exitCode | integer? | Process exit code when termination has been observed. |

