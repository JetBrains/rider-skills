# Rider Skills

A set of [Agent Skills](https://docs.claude.com/en/docs/claude-code/skills) that give coding agents **IDE-grade code intelligence inside JetBrains Rider**. Instead of falling back to text edits, `grep`, and print debugging, these skills drive Rider's refactoring engine, debugger, and static analysis through the **Rider MCP server** — so a rename updates every resolved reference, a breakpoint inspects real runtime state, and diagnostics catch errors before a full build.

## What's included

Two skills work across every Rider-supported language; three are focused on Unreal Engine C++.

### General — any Rider solution

| Skill | Purpose |
| --- | --- |
| [`refactoring-code`](skills/refactoring-code/SKILL.md) | Semantic refactoring — rename, move types/namespaces, safe-delete, extract interface/base class/method, change signatures — resolved through the IDE's reference index instead of grep + text replace. |
| [`debugging-code`](skills/debugging-code/SKILL.md) | Debugger-driven runtime root-cause analysis — set breakpoints and tracepoints, step, inspect frame values, and evaluate expressions to answer questions static reading can't. |

Both cover .NET/C#, F#, VB, C++, Unity, Unreal Engine, XAML, Razor, and other mixed-language projects.

### Unreal Engine C++ — requires a `.uproject`

| Skill | Purpose |
| --- | --- |
| [`ue-code-authoring`](skills/ue-code-authoring/SKILL.md) | Write and modify UE C++ (classes, actors, components, subsystems, interfaces, function libraries) with IDE diagnostics catching UHT/reflection errors and missing module deps before a build. |
| [`ue-live-debugging`](skills/ue-live-debugging/SKILL.md) | Root-cause UE C++ crashes, runtime bugs, and unexpected behavior — call-hierarchy tracing, live breakpoints, crash-log triage, and live PIE state inspection via Python. |
| [`ue-test-authoring`](skills/ue-test-authoring/SKILL.md) | Author UE automated tests (Automation, CQTest, Functional, Gauntlet, LowLevel) with IDE checks for registration errors, wrong `RunTest` return types, and missing includes. |

## How it works

Each skill's `SKILL.md` teaches the workflow, decision points, and guardrails; the paired `reference/` files hold the detailed tool contracts and patterns. At runtime a skill:

1. **Checks for the Rider MCP tools** in the session's deferred-tool list and loads their live schemas — the schemas are authoritative for parameter names, never guessed.
2. **Uses Rider's semantic engine** (ReSharper / IDE index) for anything grep can't resolve: cross-language usages, generated/reflected UE code, `nameof`, XAML `x:Name`, `<see cref>`, and more.
3. **Degrades gracefully.** When the Rider MCP server isn't connected, the skill states the blocker and falls back to standard file/`grep` tools, documenting which IDE-backed quality steps were skipped.

## Requirements

- **JetBrains Rider** with its MCP server enabled and the target solution open.
- **A coding agent that supports Agent Skills and MCP** (e.g. Claude Code).
- **For the UE skills:** an Unreal Engine C++ project — a `.uproject` must be in the working directory.

## Install

### 1. Connect the Rider MCP server

In Rider, open **Settings → Tools → MCP Server**, enable the server, and click **Auto-Configure** for your client (Claude Code, Codex, etc.) — Rider registers itself with the agent, no commands needed. Then run the agent from inside the solution folder Rider has open.

### 2. Install the skills

**Claude Code**

```text
/plugin marketplace add JetBrains/rider-skills
/plugin install rider-skills@rider-skills
/reload-plugins
```

**Codex**

```bash
codex plugin marketplace add JetBrains/rider-skills
```

Then run `/plugins` inside Codex and install **Rider Skills** from the browser.

**Manual**

For agents without plugin support, copy or symlink individual skill folders from `skills/` into `~/.claude/skills/` (all projects) or `<project>/.claude/skills/` (one project).

## Repository layout

| Path | Contents |
| --- | --- |
| `skills/` | All five skills, one folder each. |
| `skills/<skill>/SKILL.md` | Skill definition — frontmatter (name, description, allowed tools) and workflow. |
| `skills/<skill>/reference/` | Progressive-disclosure reference: tool contracts, patterns, conventions loaded on demand. |
| `.claude-plugin/` | Claude Code plugin (`plugin.json`) and marketplace (`marketplace.json`) metadata. |
| `.codex-plugin/` | Codex plugin metadata (`plugin.json`). |

## Contributing

Issues and pull requests are welcome — improvements to workflows, reference contracts, and coverage of additional Rider languages and UE frameworks.

## License

Licensed under the [Apache License 2.0](LICENSE).
