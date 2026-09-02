# xdebug_set_variable
Use this tool to change state during debugging.<br/><br/>Preconditions:<br/>- Session must be suspended.<br/>- Value must be modifiable.<br/>- `path` should come from the current paused `xdebug_get_frame_values` / `xdebug_get_value_by_path` output.<br/><br/>Path format is the same as in `xdebug_get_value_by_path`.<br/>`newValue` must be a raw expression in the language of the current frame, and it must be assignable to the target value by the debugger/evaluator.<br/>Do not pass JSON-escaped payloads or literal escape sequences such as `\\"text\\"`.<br/><br/>Result:<br/>- Returns oldValue/newValue/applied.<br/>- Unsupported mutation returns an error with a textual message.<br/><br/>Next call:<br/>- Re-read value via `xdebug_get_value_by_path` or `xdebug_get_frame_values` to confirm.

## Parameters
| Name | Type | Description |
| --- | --- | --- |
| sessionId | string | Debug session ID. Use the current ID returned by `xdebug_get_debugger_status` or `xdebug_start_debugger_session`. The ID remains stable after the session stops. Active-only operations return `SESSION_NOT_ACTIVE` for retained stopped sessions. If null and exactly one active session exists, it is selected automatically. If multiple sessions are active and sessionId is omitted, the call fails. Default: null. |
| frameIndex | integer | Stack frame index counted from the top of the stack, the same `index` `xdebug_get_stack` reports: 0 is the frame execution is in, 1 its caller, and so on. Obtain this from the current paused `xdebug_get_stack` result; do not reuse a cached frame index after `RESUME`, `STEP_*`, `xdebug_run_to_line`, or any change in paused location. If null, uses the frame currently selected in the debugger, the one `xdebug_get_stack` marks `isCurrent`. Default: null. |
| path* | array[string] | Path to target value, same format as `xdebug_get_value_by_path`. Use exact node names from the current paused `xdebug_get_frame_values` / `xdebug_get_value_by_path` output and refresh stale path tokens after the paused location changes. |
| newValue* | string | New value expression to assign. Pass raw expression text in the language of the current frame; it must be assignable to the target value by the debugger/evaluator. Do not pass JSON-escaped payloads or literal backslash-escaped quoted text. |
| rootFolder | string | The path to the root folder of the Rider solution or project. Pass this value ALWAYS if you are aware of it. It reduces numbers of ambiguous calls.<br/>In the case you know only the current working directory you can use it as the root folder path.<br/>If you're not aware about the root folder path you can ask user about it. |

## Output
| Name | Type | Description |
| --- | --- | --- |
| path* | array[string] | Variable path used for mutation. |
| oldValue* | string | Value before mutation. |
| newValue* | string | Value after mutation. |
| applied* | boolean | Whether mutation was applied. |

