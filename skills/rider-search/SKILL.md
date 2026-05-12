---
name: rider-search
description: Rider MCP search driver. MANDATORY when the user asks to find a symbol (class/method/field/property) by identifier fragment, locate files by name or glob pattern, or search file contents by text/regex inside the current Rider/IntelliJ solution. Use these `mcp__<rider_mcp_name>__search_symbol` / `search_file` / `search_text` / `search_regex` tools instead of running `rg`/`grep`/`find` through Bash, walking the directory tree manually, or guessing where a symbol lives.
---

# Rider Search Skill

This skill drives JetBrains Rider (and other IntelliJ-family IDEs) project search through MCP. It is the **preferred** way to search inside the solution because it uses the IDE's indexes — meaning:
- `search_symbol` is **semantic** (knows about classes/methods/fields), not regex on identifiers.
- All searches respect IDE project scope (`.csproj` / module membership, excluded folders) by default.
- Results return precise 1-based `startLine`/`startColumn`/`endLine`/`endColumn` coordinates.

Use these tools instead of `rg` / `grep` / `find` / directory walks unless the user explicitly asks for a filesystem-level search outside the indexed project.

## GATE — Resolve the Rider MCP server name first

Before calling **any** search tool, you MUST resolve `<rider_mcp_name>` — the actual MCP server prefix for the Rider/JetBrains MCP on this machine. The literal string `mcp__<rider_mcp_name>__` is a placeholder; the real prefix varies per install (`rider`, `jetbrains`, `intellij`, `rider-mcp`, `jetbrains-ide`, etc.).

**Detection steps (in order):**

1. **Scan the available tool list / deferred tools** (the `<system-reminder>` listing `mcp__*__search_symbol`, `mcp__*__search_file`, `mcp__*__search_text`, `mcp__*__search_regex`, or any other clearly Rider/IntelliJ-flavored MCP tools — e.g. `build_solution`, `execute_sql_query`, `git_status`, `get_solution_projects`, `apply_patch`, `xdebug_*`). Take the prefix between `mcp__` and the second `__`. Example: a tool named `mcp__jetbrains__search_symbol` → `<rider_mcp_name>` = `jetbrains`.
2. **Prefer the prefix that owns the full `search_*` family together.** If multiple MCP servers are registered, the correct one is the one exposing `search_symbol`, `search_file`, `search_text`, and `search_regex` under the same prefix.
3. **If no `search_symbol` (or other `search_*`) tool is visible under any `mcp__*__` prefix**, the Rider MCP is not registered or not connected. **STOP**, do not attempt fallbacks, and tell the user:
   > "I can't find the Rider/JetBrains MCP server (no `mcp__*__search_*` tools are exposed). Please make sure Rider is running with the MCP server enabled and the client is connected, then ask me again."
4. **Cache the resolved name for the rest of the session.** Substitute it for `<rider_mcp_name>` in every tool call. Do not re-resolve on every step.

Do not proceed past this gate until `<rider_mcp_name>` is known. Calling `mcp__<rider_mcp_name>__search_symbol` literally (without substitution) will fail with `InputValidationError` if the actual prefix is different.

## When this skill is mandatory

Activate (and stay active) whenever the user asks you to:
- Find where a class, method, property, field, interface, or enum is **declared** by its name or a fragment of the identifier ("where is `OrderProcessor`?", "find any method called `*Validate*`")
- Locate files by name or glob pattern ("find all `*.csproj`", "where is `appsettings.Development.json`?")
- Search file contents for a literal substring ("find `TODO`", "where do we mention `legacyAuth`?")
- Search file contents by regex ("find any line matching `new\s+Foo\(`")
- Narrow any of the above to specific paths or exclude test folders, build outputs, etc.

## Tool selection — pick the right `search_*`

| Goal | Tool |
|---|---|
| Find a **symbol** (class, method, field, property…) by identifier fragment | `search_symbol` |
| Find **files** by **name / glob pattern** (`**/*.kt`, `appsettings.*.json`) | `search_file` |
| Find a **literal substring** anywhere in file contents | `search_text` |
| Find a **regex** pattern in file contents (with match coordinates) | `search_regex` |

Rules of thumb:
- "Find class/method/property X" → `search_symbol`, **not** `search_text` on the identifier. The symbol search is semantic, ignores comments/strings/imports, and is dramatically more precise.
- "Find file named X" → `search_file`, **not** `search_text` on the filename.
- Plain literal string → `search_text`. Patterns with metacharacters/alternation → `search_regex`.
- If `search_symbol` returns nothing for a name you expected to exist, retry with `include_external=true` to include SDK/library symbols.

## Always pass `rootFolder`

Every tool accepts `rootFolder`. **Always pass it** with the .NET solution root (or current working directory if that is all you know). It disambiguates project resolution and avoids extra round-trips. Ask the user once if unknown, then reuse for every subsequent call.

## Path / glob filtering — `paths` (text/regex/symbol) and `paths` (file)

All four tools accept a `paths` array of project-relative glob patterns:
- `"src/**"` — restrict to `src/`.
- `"!**/test/**"` — **exclude** matches under any `test/` folder (`!` prefix).
- `"**/*.cs"` — restrict to C# files.
- `"foo/"` — trailing `/` expands to `foo/**`.
- `"Foo*.cs"` — no `/` in the pattern is treated as `**/Foo*.cs`.
- Empty strings are ignored.

Combine filters and excludes liberally to keep result sets small.

## Tool reference (short)

### `mcp__<rider_mcp_name>__search_symbol` — semantic symbol search
- `q` (required) — symbol query text; identifier fragments are matched (e.g. `OrderProc`, `*Validate*`).
- `paths` (optional) — project-relative globs, supports `!` excludes.
- `include_external` (default `false`) — include SDK / library symbols. Disabled by default for speed; flip to `true` only if a project-only search returned nothing.
- `limit` (optional) — cap results.
- Returns `items[]` with `filePath`, `startLine`, `startColumn`, `endLine`, `endColumn`, plus `more` (boolean — true if more matches existed beyond `limit`).
- **Note**: for call-graph questions ("who calls X?"), use `search_symbol` only to locate the target symbol, then prefer `analyze_calls` over a text search.

### `mcp__<rider_mcp_name>__search_file` — file by name/glob
- `q` (required) — glob pattern for the path (`**/*.kt`, `src/**/Foo*.java`, `build.gradle.kts`). Patterns without `/` are treated as `**/pattern`.
- `paths` (optional) — extra project-relative glob filters.
- `includeExcluded` (default `false`) — include excluded/ignored files (e.g. `bin/`, `obj/`, `.idea/`). Enable only when the user explicitly wants build artifacts or generated files.
- `limit` (optional) — cap results.
- Returns `items[]` with `filePath` (and usually `null` coordinates — file matches have no in-file position), plus `more`.

### `mcp__<rider_mcp_name>__search_text` — literal substring in file contents
- `q` (required) — text to search for; treated literally (no regex). Use this for plain phrases, identifiers, and string literals.
- `paths` (optional) — project-relative globs, supports `!` excludes.
- `limit` (optional) — cap results.
- Returns `items[]` with `filePath`, `startLine`, `startColumn`, `endLine`, `endColumn`, plus `more`.

### `mcp__<rider_mcp_name>__search_regex` — regex in file contents
- `q` (required) — regex pattern. Use this when you need character classes, anchors, alternation, capture-group context, or non-literal matches.
- `paths` (optional) — project-relative globs, supports `!` excludes.
- `limit` (optional) — cap results.
- Returns `items[]` with match coordinates (1-based `startLine`/`startColumn`, end exclusive), plus `more`.

## Mandatory workflow

1. **Pick the right tool.** Use the selection table above. Don't fall back to `search_text` for symbol/file lookups.
2. **Constrain the search.** Pass `paths` to narrow scope (e.g. `["src/**", "!**/test/**", "!**/bin/**", "!**/obj/**"]`) before falling back to a global search. Use a sensible `limit` (e.g. 50) for exploratory queries.
3. **Run the search.** Always pass `rootFolder`.
4. **Inspect coordinates.** Results are 1-based, end exclusive. Use `filePath` + `startLine` (and `startColumn` when relevant) when reporting locations to the user — the `file_path:line_number` pattern.
5. **If results are empty:**
   - `search_symbol` — retry with `include_external=true` to include SDK/library symbols.
   - `search_file` — retry with `includeExcluded=true` if you suspect the file is in a build/excluded folder; also broaden the glob (e.g. `**/Foo*` instead of `Foo.cs`).
   - `search_text` / `search_regex` — broaden `paths` (drop excludes), check casing, or switch between literal/regex as appropriate.
6. **If `more=true`,** the result set was truncated by `limit`. Either raise `limit` or tighten `paths` to get a complete picture before drawing conclusions.

## Critical rules

- **Always pass `rootFolder`** on every call.
- **Don't use `search_text` for symbol lookups.** `search_symbol` is the semantic, declaration-aware tool — text matches will also hit comments, strings, imports, and unrelated identifiers that contain the substring.
- **Don't use `search_text` to find files by name.** `search_file` with a glob is correct and dramatically cheaper.
- **`search_regex` patterns are regex, `search_text` patterns are literal.** Don't mix them; if your `q` contains `[`, `(`, `.`, `\`, `*`, etc. and you want them treated literally, use `search_text`.
- **`paths` exclusions use `!` prefix** (e.g. `"!**/obj/**"`), not negative lookarounds. Multiple excludes are fine.
- **Coordinates are 1-based and `endColumn` is exclusive.** Don't off-by-one when slicing.
- **`more=true` means truncated.** Don't report "no other matches" without confirming `more=false`.
- **For shell-level / filesystem-level search outside the solution** (e.g. searching outside the project root, or in untracked build artifacts the IDE doesn't index), fall back to the host `Grep` / `Glob` tools — but only after confirming the IDE search won't see the target.
- **Prefer evidence from these tools over reasoning from memory.** If you need to know where something lives, search — don't guess.

## Invocation pitfalls (learned the hard way)

These tools may be reached through a universal `execute_tool` dispatcher that takes a command-line string. In that case:

- **Use `--paramName value` format**, not `paramName=value`. `search_file pattern=**/*.cpp` is rejected with *"Expected '--paramName value' format"*.
- **The parameter is named `q`, not `pattern`, `query`, or `name`.** `search_file --pattern **/*.cpp` is rejected with *"Missing required parameters: q"*. This applies to **all four** `search_*` tools.
- **`q` must contain real glob wildcards.** A bare extension like `.cpp` does **not** mean "files ending in .cpp" — per the skill above, patterns without `/` are rewritten to `**/<pattern>`, so `.cpp` becomes `**/.cpp` and matches only a file literally named `.cpp`. Use `*.cpp` (rewrites to `**/*.cpp`) or `**/*.cpp` directly.
- **Empty `items[]` ≠ "the IDE doesn't index these files".** Before falling back to host `Glob`/`Grep`, retry with a broader/correct glob. Common rescues: replace bare extension with `*.ext`, drop a too-narrow `paths` filter, or set `includeExcluded=true` on `search_file` if you suspect the target is in `bin/`, `obj/`, or `.idea/`.
- **Brace expansion (`{a,b,c}`) is not portable across glob dialects** — even if your shell supports `**/*.{c,cpp,h}`, the IDE matcher may not. Issue one call per extension, or use a less-restrictive glob and filter results.

### Quick reference — known-good invocations through a CLI dispatcher

```
search_file --q **/*.cpp --rootFolder <solution-root>
search_symbol --q OrderProcessor --rootFolder <solution-root>
search_text --q "TODO(security)" --rootFolder <solution-root>
search_regex --q "new\s+Foo\(" --rootFolder <solution-root>
```
