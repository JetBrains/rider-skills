# xdebug_attach_to_process
Use this when the target process was started outside the IDE or by another tool and must not be restarted.<br/><br/>Selection behavior:<br/>- If `debuggerKind` is omitted or blank and exactly one debugger is available, that debugger is selected.<br/>- If `debuggerKind` is omitted or blank and several debuggers are available, returns `selection_required`<br/>  with their display names without attaching. Repeat the call with the same PID and a returned name as `debuggerKind`.<br/>- Otherwise, an exact display-name match is preferred (case-insensitive).<br/>- Without an exact match, a unique debugger whose display name contains `debuggerKind` (case-insensitive) is selected.<br/>- If several debuggers match the substring, returns `selection_required` with their display names without attaching.<br/>- If no debugger matches, the error lists the available debugger display names.<br/><br/>Behavior:<br/>- Waits up to `timeout` for the attached process to become an active debug session.<br/>- A successful `attached` result contains `sessionId` for all other `xdebug_*` tools.<br/>- If waiting times out after the attach request was submitted, refresh `xdebug_get_debugger_status` before retrying.<br/><br/>Preconditions:<br/>- `pid` must identify a running process on the same machine as the IDE backend.<br/>- Set required breakpoints before attaching when the target may finish quickly.<br/><br/>Next call:<br/>- After attach, use `xdebug_control_session(action=WAIT_FOR_PAUSE)` or inspect the returned session.

## Parameters
| Name | Type | Description |
| --- | --- | --- |
| pid* | integer | Process ID (PID) of the running process on the local machine. |
| debuggerKind | string | Optional debugger display name or unique case-insensitive substring. Omit to auto-select only when exactly one debugger is available. |
| timeout | integer | Timeout in milliseconds to wait for the attached debug session to appear. Default: 60000. |
| rootFolder | string | The path to the root folder of the Rider solution or project. Pass this value ALWAYS if you are aware of it. It reduces numbers of ambiguous calls.<br/>In the case you know only the current working directory you can use it as the root folder path.<br/>If you're not aware about the root folder path you can ask user about it. |

## Output
| Name | Type | Description |
| --- | --- | --- |
| outcome* | attached \\| selection_required | Attach outcome. |
| pid* | integer | Process identifier on the local machine. |
| executable* | string | Process executable display name. |
| availableDebuggers* | array[string] | Human-readable names of all debuggers available for this process. |
| debuggerName | string? | Human-readable name of the selected debugger. Present when outcome is `attached`. |
| sessionId | string? | Session identifier to use as `sessionId` in subsequent debugger calls. |
| name | string? | Human-readable session name. |
| state | string? | Current session state. |
| breakpointsMuted | boolean? | Whether breakpoints are globally muted for this debugger session. |
