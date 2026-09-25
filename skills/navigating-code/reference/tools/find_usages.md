# find_usages
Unlike text search, it skips same-name symbols, comments and strings, and it finds usages through aliases, overloads,<br/>interfaces, generated code and C++ macros.<br/>Identify the symbol by filePath plus symbolName (the file that declares it), or by filePath plus line (and column) of any occurrence.<br/>To get the declaring file and line of a symbol, call search_symbol first.<br/>Response: {symbol, declarations, files: [{file, usages: [{line, column, text, kinds, member}]}], total, more, note}.<br/>`text` is the trimmed source line, `kinds` tells how the symbol is used (for example Invocation, Read, Write),<br/>`member` is the type and member that hold the usage. Paths are solution-relative with '/' separators.<br/>`total` counts the usages after the paths filter, and more=true means that the limit cut the list.<br/>A `note` warns that loading, indexing, or project model problems can make the list incomplete.<br/>An unresolved file or symbol is an MCP error.<br/>A search that does not finish in 60 seconds is an MCP error.

## Parameters
| Name | Type | Description |
| --- | --- | --- |
| filePath* | string | Path to a file that holds the symbol, absolute or solution-relative. With symbolName only, this must be the file that declares the symbol. With line, this can be any file with a declaration or a usage of the symbol. |
| symbolName | string | Symbol name as written in the file: "TypeName", "MemberName" or "TypeName.MemberName". Together with line and without column, it picks the symbol on that line: one whose type has the given qualifier, and a declaration before a usage. For a C++ member, pass line together with symbolName as "Type::Member", because a qualified C++ name does not resolve without line. |
| line | integer | 1-based line of a declaration or a usage of the symbol. Use it to pick one overload, or a symbol that is only used in this file. |
| column | integer | 1-based column of the symbol on the given line. If omitted, symbolName gives the column. |
| paths | array[string] | Optional list of solution-relative glob patterns to filter the results. Supports '!' excludes. Trailing '/' expands to '**'. Patterns without '/' are treated as '**/pattern'. Empty strings are ignored. |
| limit | integer | Maximum number of usages to return. |
| rootFolder | string | The path to the root folder of the Rider solution or project. Pass this value ALWAYS if you are aware of it. It reduces numbers of ambiguous calls.<br/>In the case you know only the current working directory you can use it as the root folder path.<br/>If you're not aware about the root folder path you can ask user about it. |

## Output
| Name | Type | Description |
| --- | --- | --- |
| symbol | string? |  |
| declarations* | array[object] |  |
| &nbsp;&nbsp;[].file* | string |  |
| &nbsp;&nbsp;[].line | integer? |  |
| &nbsp;&nbsp;[].column | integer? |  |
| files* | array[object] |  |
| &nbsp;&nbsp;[].file* | string |  |
| &nbsp;&nbsp;[].usages* | array[object] |  |
| &nbsp;&nbsp;&nbsp;&nbsp;[].line | integer? |  |
| &nbsp;&nbsp;&nbsp;&nbsp;[].column | integer? |  |
| &nbsp;&nbsp;&nbsp;&nbsp;[].text | string? |  |
| &nbsp;&nbsp;&nbsp;&nbsp;[].kinds | array[string] |  |
| &nbsp;&nbsp;&nbsp;&nbsp;[].member | string? |  |
| total* | integer |  |
| more | boolean |  |
| note | string? |  |

