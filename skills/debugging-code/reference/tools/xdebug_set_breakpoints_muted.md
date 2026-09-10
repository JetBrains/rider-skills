# xdebug_set_breakpoints_muted

## Parameters
| Name | Type | Description |
| --- | --- | --- |
| sessionId | string | Debug session ID. Use the current ID returned by `xdebug_get_debugger_status` or `xdebug_start_debugger_session`. The ID remains stable after the session stops. Active-only operations return `SESSION_NOT_ACTIVE` for retained stopped sessions. If null and exactly one active session exists, it is selected automatically. If multiple sessions are active and sessionId is omitted, the call fails. Default: null. |
| muted* | boolean | Whether to mute all breakpoints in the session. |
| rootFolder | string | The path to the root folder of the Rider solution or project. Pass this value ALWAYS if you are aware of it. It reduces numbers of ambiguous calls.<br/>In the case you know only the current working directory you can use it as the root folder path.<br/>If you're not aware about the root folder path you can ask user about it. |

## Output
| Name | Type | Description |
| --- | --- | --- |
| sessionId* | string | The resolved debug session ID. |
| breakpointsMuted* | boolean | Whether all breakpoints are muted for the session. |

