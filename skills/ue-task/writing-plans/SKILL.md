---
name: ue:task:writing-plans
description: "Use when ue:task has an approved design spec and needs to write a plan for a UE project. DO NOT TRIGGER directly — only ue:task should invoke this. DO NOT TRIGGER if design spec is missing or architecture is not yet approved. Use ue:task:subagent-driven-development to execute an existing plan."
argument-hint: "[task description + approved architecture approach]"
effort: medium
---

# UE Task — Writing Plans

You write a detailed implementation plan for an Unreal Engine task. `ue:task` has already completed research and approved an architecture approach — your job is to decompose into executable stages, review the plan with a subagent reviewer, get user approval, and hand off to execution.

**Announce at start:** "I'm using ue:task:writing-plans to decompose and write the implementation plan."

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Read inputs** — read the design spec at `docs/specs/<filename>.md` (sole input)
2. **Stage presentation** (5+ stages only) — present Architecture Decisions → Stages list for approval
3. **Write plan** — decompose into executable stages with full detail (no placeholders)
4. **Plan review** — dispatch plan-document-reviewer subagent; fix any issues found
5. **User approval** — present plan, process annotations, wait for explicit go-ahead
6. **Pre-flight** — verify editor is running (if task has editor stages)
7. **Hand off** — invoke `ue:task:subagent-driven-development`

## CRITICAL — NO CODE CHANGES BEFORE PLAN APPROVAL

Do NOT edit any project files (Build.cs, .uproject, C++ headers, etc.) until the user has reviewed and approved the plan. Everything waits for approval.

## Inputs Expected

Before writing, confirm you have:
- Design spec at `docs/specs/<filename>.md` (approved in ue:task)
- Approved architecture approach (from approach selection gate)
- Task description

Re-read the design spec completely before writing the plan. The design spec is the source of truth for all architecture decisions — plan stages must implement what was designed, not re-invent it.

## Staged Presentation for Large Plans

**For plans with 5+ stages:** Present in two approval gates before writing the plan:
1. Present the **Architecture Decisions** section in chat → wait for user approval
2. Present the **Stages** list in chat → wait for user approval
3. Only after both gates pass: write the plan file

**For plans with ≤4 stages:** Write the plan file directly, then present it.

## Plan File Structure

Write the plan to `docs/plans/YYYY-MM-DD-<feature>.md`. Create the `docs/plans/` directory if it doesn't exist. **Every plan MUST start with this header:**

```markdown
# Task: [task description]

> **For agentic workers:** Use `ue:task:subagent-driven-development` to execute this plan stage-by-stage. Stages use `- [ ]` checkbox syntax for tracking.

**Goal:** [One sentence describing what this builds]

**Architecture:** [2–3 sentences about the approved approach]

---

## Architecture Decisions
- [decision 1 — brief rationale]
- [decision 2 — brief rationale]

## File Manifest
Source/Module/Subsystem/
  - ClassName.h/.cpp
  - [every file this task creates or modifies — exact paths]

## Stages
Each stage MUST name the exact skill to invoke and contain enough detail that the worker needs no additional context.
- [ ] 1. **Build.cs** → `/ue:coder` — Add GAS + EnhancedInput dependencies to PublicDependencyModuleNames
- [ ] 2. **Core framework** → `/ue:coder` — GameMode (AMyGameMode), PlayerController (AMyPlayerController), PlayerState (AMyPlayerState) — file paths, base classes, key properties listed
- [ ] 3. **GAS foundation** → `/ue:coder` — UAbilitySystemComponent on PlayerState, UMyAttributeSet with Health/MaxHealth, tag registration
- [ ] 4. **HUD C++ widgets** → `/ue:ui-cpp` — UUserWidget subclasses with BindWidget declarations
- [ ] 5. **HUD Blueprint layout** → `/ue:ui` — WBP_ widgets, anchoring, colors, fonts

## Execution Order
- Stage 1 first (all others depend on it)
- Stages 2–4 in parallel (no interdependencies)
- Stage 5: build (depends on all C++ stages)
- Stage 6+: editor stages (depend on successful build)
```

## Stage Granularity

Each stage is ONE worker skill invocation — it must be completable in a single pass:

- **Too broad:** "Create the full inventory system" — split into C++ classes, Blueprint wiring, UI, data tables
- **Right size:** "Create UInventoryComponent with AddItem/RemoveItem/HasItem API, replicated Items array, OnInventoryChanged delegate" — one ue:coder pass
- **Too narrow:** "Add one UPROPERTY" — combine with related work into one stage

Every stage must include enough detail that the worker needs **zero additional context** — exact class names, file paths, base classes, key methods, dependencies from prior stages.

## No Placeholders

These are **plan failures** — never write them:
- "TBD", "TODO", "implement later", "fill in details"
- "Add appropriate error handling" / "handle edge cases" (without specifics)
- "Similar to Stage N" (repeat the detail — workers may execute out of order)
- Class or method names referenced in later stages but not defined in earlier ones
- Stage descriptions that say what to do without saying how (exact class names, method signatures, file paths required)

## Worker Skill Routing Reference

| Work type | Skill |
|---|---|
| C++ gameplay classes, Build.cs | `/ue:coder` |
| C++ UI widget classes (UUserWidget, BindWidget, MVVM) | `/ue:ui-cpp` |
| UMG Blueprint widgets, HUD, menus | `/ue:ui` |
| Blueprint assets and graphs | `/ue:blueprint` |
| Materials and shaders | `/ue:material` |
| Level creation and placement | `/ue:level-design` |
| Building (compile C++) | `/ue:builder` |
| GAS abilities, AttributeSets, GameplayEffects | `/ue:gas` |
| GameplayCues, VFX/SFX feedback | `/ue:cue` |
| Editor automation (Python/AgentBridge) | `/ue:editor` |

## Plan Review (dispatch subagent — mandatory before showing user)

After writing the plan file, dispatch a plan reviewer subagent using `plan-document-reviewer-prompt.md`. Do not self-review inline — the subagent catches issues you miss.

Fill the template:
- `[PLAN_FILE_PATH]` → `docs/plans/<filename>.md`
- `[SPEC_FILE_PATH]` → `docs/specs/<design-filename>.md`

**If reviewer returns Issues Found:** fix all flagged issues inline, then re-read the plan file to confirm fixes before showing the user.

**If reviewer returns Approved:** proceed to user approval gate.

## User Approval Gate

After plan review passes, present the plan to the user:

> **Plan written to `docs/plans/<filename>.md` and reviewed.** Take a look and approve before I proceed. You can edit the file directly to add inline annotations (e.g., `<!-- NOTE: use existing FooComponent instead -->`) — I'll re-read it before executing.

**Annotation cycle:** The user may edit the plan file and say "updated" or "check the plan". When this happens:
1. Re-read the plan file completely
2. Incorporate all user annotations and edits
3. Re-dispatch plan reviewer subagent
4. Re-present changes and wait for approval again

Only proceed after explicit "go", "approved", "do it", or equivalent.

## Pre-Flight: Ensure Editor is Running

Before handing off to execution, verify editor is reachable for any stage requiring it (level-design, editor, ui, blueprint, material):

1. Run `/ue:console --launch` to ensure the editor is launched
2. Wait for AgentBridge health check to pass (`/ue:console --health`)

If the task includes a build stage before editor stages, Live Coding will hot-reload new C++ classes automatically — no restart needed.

## Handoff to Execution

After plan approval:
> "Plan approved. Invoking `ue:task:subagent-driven-development` to execute."

Invoke the **`ue:task:subagent-driven-development`** skill — use the Skill tool with `skill: "ue:task:subagent-driven-development"`. Pass the approved plan file path.
