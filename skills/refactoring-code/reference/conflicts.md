# Conflicts, ambiguity, and known limitations

Detailed handling for the cases SKILL.md summarizes. Read this only when a tool actually returns a `conflicts` or `ambiguous` list, an error, or when you hit one of the known limitations below.

A conflict is never a reason to stop and ask: the request already authorizes the change. Fix the input and retry once; if the tool still refuses, make that part of the change with a regular text edit, then report what you decided in the final message.

## Conflicts

Tools that rewrite or remove use sites (rename, safe-delete, the extract family) can refuse and report **conflicts**. A non-empty `conflicts` list always means **no files were touched**.

Each entry is `{kind, file, context}`: `kind` mirrors ReSharper's `ConflictType` (snake_case); `context` is the engine's localized description; `file` is the first occurrence's path, or `null` for a textual-only conflict or a clash with a compiled-only symbol.

| Kind | Meaning | Action |
|------|---------|--------|
| `same_name_conflict` | New name collides with an existing member in the same scope. | If the request fixed the name, the collision is the request's to accept: make that part by a text edit. Otherwise pick a different name and retry. |
| `default_element_conflict` | Generic element-level conflict without a more specific category. | Read `context`; if it names a colliding member, treat like `same_name_conflict`. |
| `not_accessible` | A moved or extracted member uses something that stays behind and is private (typically a field or helper of the original type). | Add the private members it names to `--members` and retry. If that still refuses, finish the extract by a text edit: create the base type, move the members, make the fields they need `protected`. |
| `will_be_made_public` | Access widens as a side-effect (e.g. promoted from private). | Accept it when the request needs the change; mention the widened member in the summary. |
| `cannot_update_usage_conflict` | A call site can't be rewritten safely. | Apply the rest, then fix the named call site by a text edit. |
| `cannot_remove`, `cannot_delete_safely`, `cannot_inline_usage_conflict`, `will_be_removed` | For `safe_delete`: something still refers to the symbol; `file` says where. For other tools: a use site can't be removed or rewritten. | `safe_delete`: open the named `file` and read the use. Only a comment or `///` doc comment (`<see cref>`): remove that text and retry. Another symbol you were asked to delete (a derived type, a caller): delete that one first, then retry. Real code: keep the symbol and list it as kept (when the request said "only if unused", that is the correct outcome). Other tools: finish that site by a text edit. |
| `hierarchy_conflict` | Override/implementation hierarchy clashes with the result. | Include the base or interface member in the same change (one call per hierarchy level), or finish by a text edit across the hierarchy. |
| `text_only`, `default_conflict`, `invalid` | Generic textual conflict the engine couldn't categorise structurally. | Read `context`; decide from the message. |

For a rename, `affects.callSites == 0` on a public/protected symbol usually means the wrong target resolved — check `--filePath` is the declaring file and narrow `--symbolName` to `Type.Member`.

## Ambiguity

A `--symbolName` can match more than one candidate; each carries `name`, `kind`, `fqn`, `file`, and `line`. Re-issue with a more specific `--symbolName` — use `TypeName.MemberName` rather than a bare short name (a bare name prioritises type-level entries and can miss the member you meant). The candidate list is capped at 5; if you see 5, the name is too broad — narrow it rather than expecting the full set.

For `change_api_signature`, overload ambiguity comes back as `{ok:false, candidates:[...], error:{kind:"ambiguous_method"}}` — disambiguate with `--currentSignature` (the current parameter types, e.g. `'["int","string"]'`) and/or `--declaringType`.

## Errors that no retry fixes

| Message | Cause | Action |
|---|---|---|
| `error.kind = "no_renamable_symbol"` on a namespace or a parameter | `rename_refactoring` renames types and members only. | Namespace: `move_type_to_namespace` per type. Parameter: text edit (SKILL.md), then build. |
| `Refactoring did not complete (see ReSharper Engine logs at <NULL>)` from `extract_base_class` | Engine failure; seen when nested types were among `--members`. | Retry once **without** the nested types (leave them in the derived type). If it fails again, do the extract by a text edit — never repeat the identical call. |
| `Refused: these members cannot be extracted or do not exist: X` | `X` is not a member of the type — often the type's own name (its constructor). | Drop `X` from `--members` and retry. |
| `The line range does not cover a complete sequence of statements inside one member.` | `extract_method` range starts or ends inside a statement. | Move `--startLine`/`--endLine` to statement boundaries (include the whole `if`/`using`/`foreach` block) and retry. |
| `Expected JsonObject, but had JsonLiteral … ParameterSpec` | A `--parameters` element was a bare string. | Make every element an object: `{"name":"x"}`. |

## Known limitations

Not reported in tool output:

- **String and comment occurrences** of an old name or namespace are not updated. Fix them with a regular edit pass afterward.
- **XML-doc `<see cref>` references**: a method rename rewrites `<see cref="Type.Method(int, int)"/>` to `<see cref="NewName"/>`, dropping the containing type and parameter list. Fix the cref by a text edit after method renames.
- **Moving a type does not move its file** — only the namespace declaration and references change. If the user also wants the file relocated, do that as a separate file operation.
- **`change_api_signature` may reflow rewritten call sites onto long single lines.** This is cosmetic; do not spend a verification pass on it unless the user asked for formatting.
