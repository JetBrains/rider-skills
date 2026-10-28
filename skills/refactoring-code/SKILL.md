---
name: refactoring-code
description: Use for any refactoring in a solution open in Rider (.NET/C#, F#, VB, C++, Unity, Unreal Engine, XAML, Razor, GameDev and mixed-language projects) — rename a type, member or namespace (including fixing a typo in one), rename a property together with related parameters, change a method signature, move a type to another namespace, delete unused or obsolete types and members (dead-code cleanup, even whole files), extract an interface, base class or method, or reorganize namespaces. Use it even when the change looks like a one-file edit: the IDE tool applies it, and every reference, in one call. Read this SKILL.md in a command of its own (nothing chained after it) before the first `execute_tool` call: it holds the command syntax. Do not use for file-only moves, config keys, string literals, comment text, generated output, or logic changes with unchanged names/signatures.
allowed-tools: execute_tool
metadata:
  author: JetBrains
---

# Code Refactoring

Rider/ReSharper semantic refactorings on a solution open in Rider. Each tool rewrites **every** reference — `nameof`, `<see cref>`, XAML/Razor bindings, C++/Unreal — in one call. A grep-and-replace *looks* done but silently misses these, so prefer the tool over a text edit.

## Invoke a tool

One MCP tool, `execute_tool`, on the IDE's MCP server (your client can show it as `mcp__<server>__execute_tool`). The first token of `command` is the tool name, then `--flag value` pairs. Always pass `rootFolder`, the directory that holds the `.sln` (usually your working directory); without it the IDE can refuse the call with `Unable to determine the target project`.

```
execute_tool(rootFolder="/path/to/solution", command="rename_refactoring --filePath API/Services/OrderService.cs --symbolName OrderService --newName OrderProcessor")
```

If your client calls tools from code, take the function from the tool list in the first cell. Do not list, print or filter the tools:

```js
const ide = tools[ALL_TOOLS.find(t => t.name.endsWith("__execute_tool")).name];
const r = await ide({rootFolder: "/path/to/solution", command: "safe_delete --filePath src/A.cs --symbolName Foo"});
```

A refactoring on a large solution can run for 1 to 3 minutes. If a code cell returns `Script running with cell ID <n>`, wait for it once, with a long wait: `wait` with `yield_time_ms: 180000`. Each short poll is another turn. Several independent calls (for example one `safe_delete` per symbol) can go in one cell, awaited one after another.

| Refactor | Tool | Required flags |
|---|---|---|
| Rename a type or member + all usages | `rename_refactoring` | `--filePath --symbolName --newName` |
| Rename a namespace | `move_type_to_namespace`, once per type in it | `--filePath --typeName --targetNamespace` |
| Change a method signature (add/remove/reorder params) | `change_api_signature` | `--filePath --methodName --parameters` |
| Move a type to another namespace | `move_type_to_namespace` | `--filePath --typeName --targetNamespace` |
| Sync namespaces to folders | `reorganize_namespaces` | `--scope` |
| Delete a symbol only if unused | `safe_delete` | `--filePath --symbolName` |
| Extract an interface | `extract_interface` | `--filePath --typeName --interfaceName --members` |
| Extract a base class | `extract_base_class` | `--filePath --typeName --baseClassName --members` |
| Extract a method (C# only) | `extract_method` | `--filePath --startLine --endLine --methodName` |

- `--filePath` is the file that **declares** the symbol, never `.` or a folder. `--symbolName`/`--typeName` take `Name` or `Type.Member`, written plainly: no `<T>`, no `(args)`.
- **Apply directly; do not preview.** A refused apply changes nothing and returns the same conflicts a preview would. Preview only a `change_api_signature` that **removes** a parameter, to read its `warnings`.
- `change_api_signature`: pass a **bare** `--methodName` **and** `--declaringType <FullyQualifiedType>` on the first call. `--parameters` is a single-quoted JSON array of **objects**, the **complete** new list in order: `'[{"name":"count"},{"name":"id"}]'` swaps two; `{"name":"limit","type":"int","defaultValue":"10"}` adds one.
- `rename_refactoring` renames types and members only. For a namespace, move each type in it; for a parameter, use a text edit, never `change_api_signature`.
- `safe_delete`: `cannot_delete_safely` names the `file` that holds the use. A use only in a comment or `<see cref>` is not a code use: remove it and retry. A use by another symbol you were asked to delete means delete that one first. It cannot pick an overload: check that `deleted` names the one you meant.
- A multi-part request ("rename `X` **and** move it to `Y`") is one tool call per step, in sequence.
- Details and edge cases per tool are in `reference/tools/<tool>.md` (index: `reference/tools.md`). Read it once before the first call of `extract_interface`, `extract_base_class`, `extract_method`, a namespace rename or a parameter rename, and otherwise only when a call is refused. There is no `--describe`.

## Rules

1. **Use the tool first; never hand-edit before a real call has run.** Never report that Rider or `execute_tool` is unavailable without having made a call. `Missing required parameters`, `Tool '<x>' not found`, conflicts and `ambiguous` are fixable input mistakes: correct the argument and retry once. If the tool cannot do the change, finish that part with a text edit and say so.
2. **Finish the task; never stop to ask.** The request authorizes the change: decide, complete it, and report each trade-off in the final message.
3. **Done means `"applied":true`.** A preview, `ok:false`, a conflict or an error wrote nothing.
4. **Trust an applied result.** `touched`/`affects`/`files` are the confirmation: do not re-read files, grep or diff to check it. Surface a count of **1** (declaration only, no callers). **Exception:** when the request covers several places (a namespace, a list of symbols, "all X"), run **one** search for the old name(s) after the last call.
5. **Build only when the request asks for it** ("must still build", "tests must pass"): once, at the end, in one call, e.g. `dotnet build <solution> -v q -clp:ErrorsOnly`. Fix errors from your change and build again; if the whole solution fails for an unrelated reason, build the projects you touched.
6. **Don't retry blindly**: change an argument between calls. **`The operation timed out` does not mean nothing changed**: the IDE can still finish. Before you call again or edit by hand, check once (one search for the new name, or for the deleted symbol). Never run the same refactoring twice. Flags are camelCase; pass real values or omit optional ones, and copy paths and names verbatim.
7. **Library / external symbols can't be refactored**: say so in the summary.

## Conflicts, ambiguity, limits

A non-empty `conflicts` list means **no files changed** (except `reorganize_namespaces`, whose conflicts are advisory). An `ambiguous`/`candidates` list means the name matched several symbols: narrow it (`Type.Member`, or the current overload types). What to do per conflict kind and the known gaps are in [reference/conflicts.md](reference/conflicts.md); read it only when a response contains conflicts or an error.
