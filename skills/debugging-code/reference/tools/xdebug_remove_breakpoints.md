# xdebug_remove_breakpoints
Use this tool to remove arbitrary breakpoint IDs or locations in one call.<br/><br/>Batch behavior:<br/>- Provide 1..50 items in `breakpoints`; items are processed in order.<br/>- Results have matching zero-based `index` values and preserve request order.<br/>- An expected validation or targeting failure sets `success=false` and `error` for that item.<br/>- A failed item does not stop the remaining items.<br/>- Removing a breakpoint that does not exist succeeds with `removed=false`.<br/><br/>Per-item targeting modes:<br/>- ID mode: provide a `breakpointId` from a set or list tool.<br/>- Location mode: provide `filePath` and a 1-based `line`.<br/>- Owner mode: provide only `owner` to remove all breakpoints for that owner.<br/>- `owner` defaults to `agent` in every mode.<br/>- If an item has multiple selectors, the tool combines them with logical AND.<br/>- Use two owner-mode items to remove all user and agent breakpoints in one call.<br/>- A default breakpoint cannot be deleted. The tool disables it and reports this action in `message`.<br/><br/>Next call:<br/>- Use `xdebug_list_breakpoints` to verify the remaining set.

## Parameters
| Name | Type | Description |
| --- | --- | --- |
| breakpoints* | array[object] | Ordered breakpoint removal requests. Pass 1..50 items. |
| &nbsp;&nbsp;[].breakpointId | string? | Canonical breakpoint ID returned by a set or list tool. Provide this for ID mode; omit it for location or owner mode. |
| &nbsp;&nbsp;[].filePath | string? | Path to the file. Provide it with `line` for location mode. |
| &nbsp;&nbsp;[].line | integer? | 1-based line number. Provide it with `filePath` for location mode. |
| &nbsp;&nbsp;[].owner | string? | Breakpoint owner filter. An item with only `owner` removes all breakpoints for that owner. Default: agent. |
| rootFolder | string | The path to the root folder of the Rider solution or project. Pass this value ALWAYS if you are aware of it. It reduces numbers of ambiguous calls.<br/>In the case you know only the current working directory you can use it as the root folder path.<br/>If you're not aware about the root folder path you can ask user about it. |

## Output
| Name | Type | Description |
| --- | --- | --- |
| results* | array[object] | Per-breakpoint results in the same order as the request's breakpoints array. |
| &nbsp;&nbsp;[].index* | integer | Zero-based index of the corresponding item in the request's breakpoints array. |
| &nbsp;&nbsp;[].success* | boolean | Whether this breakpoint removal operation succeeded. |
| &nbsp;&nbsp;[].removed* | boolean | Whether at least one breakpoint was removed. |
| &nbsp;&nbsp;[].removedCount* | integer | Number of breakpoints removed by this operation. |
| &nbsp;&nbsp;[].breakpointId | string? | Breakpoint ID when the operation targeted one ID. |
| &nbsp;&nbsp;[].message | string? | Additional note about the completed operation. |
| &nbsp;&nbsp;[].error | string? | Expected validation or targeting error. Present only when success=false. |
| totalBreakpoints* | integer | Current total number of breakpoints after all operations. |

