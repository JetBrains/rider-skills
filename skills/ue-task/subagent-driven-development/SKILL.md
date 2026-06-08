---
name: ue:task:subagent-driven-development
description: "Use when an approved UE plan file exists at docs/plans/ and is ready for stage-by-stage execution in the current session. DO NOT TRIGGER without an approved plan (use ue:task to create one first)."
argument-hint: "[plan file path, e.g. docs/plans/YYYY-MM-DD-<feature>.md]"
effort: high
---

# UE Task — Subagent-Driven Development

You execute an approved plan file for a UE project. You dispatch one fresh worker Agent per stage, inject precise context, enforce the status protocol, and run ue:task:code-reviewer after each stage completes.

**Announce at start:** "I'm using ue:task:subagent-driven-development to execute the plan."

**Core principle:** Fresh subagent per stage + curated context injection + two-stage review (spec then quality) = high quality, fast iteration.

## CRITICAL — NEVER YIELD MID-PLAN

Once started, execute ALL stages as one continuous operation. Do NOT stop between stages to summarize, ask questions, or wait for input. The only reasons to pause:
1. A stage status is BLOCKED and cannot be resolved
2. The plan explicitly marks a stage as "needs user input"

## CRITICAL — DELEGATE, NEVER IMPLEMENT DIRECTLY

The orchestrator MUST NOT use Write, Edit, or Bash to create or modify source files (C++, Python, configs). ALL implementation work is delegated to worker skills via Agent tool.

## Pre-Read

Before executing, re-read the plan file completely and extract:
- All stages with full text (verbatim — do not summarize)
- Architecture decisions
- File manifest
- Execution order (parallel groups and sequential gates)

## Execution Pipeline

### 6a: Create task list

Call `TaskCreate` for every stage before executing any work:
- Title format: `Stage N — /skill-name: brief description`
- This gives the user live progress visibility

### 6b: Pre-work question handling

Before dispatching a worker, send a lightweight pre-work prompt:

> "Before implementing [stage N — description]: do you have any questions about scope, file locations, or class names? Reply with questions or say READY."

- Questions returned → answer from plan file architecture + design spec → repeat until READY
- READY → proceed to 6c
- **Skip for mechanical stages** (Build.cs edit, single property change, tag registration) — dispatch directly

### 6c: Context injection

Craft each worker Agent prompt with curated context — never let workers explore the project themselves:

```
## Task
[Full stage text from the plan file, verbatim]

## Architecture context
[Relevant architecture decisions from the plan file — only what applies to this stage]

## File manifest
[Files this stage must create or modify]

## Project patterns
[Key conventions from design spec: naming, module layout, base classes to extend]

## Dependencies from prior stages
[Class names, asset paths, compile results from completed stages]

## Response format
End your response with exactly one status line:
STATUS: DONE | DONE_WITH_CONCERNS | NEEDS_CONTEXT | BLOCKED
If not DONE, explain why on the next line.
```

### 6d: Status protocol

Handle each worker response:

| Status | Meaning | Action |
|---|---|---|
| `DONE` | Complete | → 6e spec compliance review |
| `DONE_WITH_CONCERNS` | Done but flagged doubts | Read concerns; if correctness/scope issue address first; if observation only, note and → 6e |
| `NEEDS_CONTEXT` | Missing info | Provide missing context, re-dispatch same agent |
| `BLOCKED` | Cannot complete | (1) provide more context + re-dispatch, (2) re-dispatch with more capable model, (3) split the stage, (4) escalate to user |

**Never** ignore a non-DONE status. **Never** retry without changing something.

### Worker skill routing

| Work type | Skill |
|---|---|
| C++ gameplay classes, Build.cs | `/ue:coder` |
| C++ UI widget classes (UUserWidget, BindWidget, MVVM) | `/ue:ui-cpp` |
| UMG Blueprint widgets, HUD, menus | `/ue:ui` |
| Blueprint assets and graphs | `/ue:blueprint` |
| Materials | `/ue:material` |
| Level creation | `/ue:level-design` |
| Building | `/ue:builder` |
| GAS abilities, AttributeSets | `/ue:gas` |
| GameplayCues | `/ue:cue` |
| Editor automation | `/ue:editor` |

### Stage sequencing

Analyze dependencies from the plan file and split into parallel groups and sequential gates:

1. **Independent stages** — dispatch in parallel via multiple Agent calls in one message
2. **Sequential gates** — wait for prior stage outputs before dispatching (e.g., Blueprint needs compiled C++)
3. **NEVER `run_in_background: true`** — always foreground so you block and wait for results

### 6e: Quality review (dispatch ue:task:code-reviewer)

Only after DONE or DONE_WITH_CONCERNS resolved — two passes, spec first:

**Pass 1 — Spec compliance:**
Get git SHAs, fill `skills/ue:task/code-reviewer/review-prompt.md`, dispatch ue:task:code-reviewer in Mode: Spec Compliance.
- ❌ Issues found → same worker Agent fixes them → re-dispatch spec reviewer
- ✅ Approved → proceed to Pass 2

**Pass 2 — Code quality:**
Dispatch ue:task:code-reviewer in Mode: Code Quality.
- ❌ Issues found → same worker Agent fixes them → re-dispatch quality reviewer
- ✅ Approved → mark stage complete

**Spec compliance MUST pass before code quality review starts.**

For parallel groups: after all workers finish, run spec reviews in parallel (read-only), then quality reviews in parallel.

### 6f: Model selection

Choose model before each worker dispatch:

| Stage signal | Model |
|---|---|
| 1–2 files, mechanical, complete spec (Build.cs edit, tag reg, single property) | `haiku` |
| Multi-file, integration concerns, existing patterns to match | `sonnet` |
| Design judgment, broad codebase, debugging, architecture-sensitive | `opus` |

## Mark Stage Complete

After both reviews pass:
- `TaskUpdate` stage → completed
- Edit the plan file: check off stage checkbox (`- [ ]` → `- [x]`)
- Pass outputs (class names, file paths, build results) as context to next stage

## Execution Pattern

```
# 6a: Create all tasks upfront
TaskCreate("Stage 1 — /ue:coder: Build.cs")
TaskCreate("Stage 2 — /ue:coder: PlayerState + ASC")
TaskCreate("Stage 3 — /ue:material: M_Shield")
...

# Parallel group 1 (independent stages)
# 6b: pre-work (skip Build.cs — mechanical)
# 6c: inject context, 6f: haiku for Build.cs, sonnet for PlayerState
Agent("/ue:coder[haiku]: [injected] Build.cs — add GAS deps")    ← parallel
Agent("/ue:coder[sonnet]: [injected] PlayerState + ASC")          ← parallel
Agent("/ue:material[sonnet]: [injected] M_Shield material")       ← parallel
# 6d: all respond STATUS: DONE

# 6e: spec reviews in parallel
Agent("ue:task:code-reviewer — Spec Compliance — Stage 1")   ← parallel
Agent("ue:task:code-reviewer — Spec Compliance — Stage 2")   ← parallel
Agent("ue:task:code-reviewer — Spec Compliance — Stage 3")   ← parallel
# fix any gaps → re-review until ✅ on all

# 6e: quality reviews in parallel
Agent("ue:task:code-reviewer — Code Quality — Stage 1")   ← parallel
Agent("ue:task:code-reviewer — Code Quality — Stage 2")   ← parallel
Agent("ue:task:code-reviewer — Code Quality — Stage 3")   ← parallel
# fix any issues → re-review until ✅ on all

TaskUpdate(1, completed) + plan.md stage 1 ✅
TaskUpdate(2, completed) + plan.md stage 2 ✅
TaskUpdate(3, completed) + plan.md stage 3 ✅

# Sequential gate: build (depends on C++ stages)
# 6c: inject which modules changed, 6f: sonnet
Agent("/ue:builder[sonnet]: [injected] Build project") → STATUS: DONE
# 6e: spec review (did build succeed? output match?) → quality review (build artifacts correct?)
TaskUpdate(build, completed) + plan.md build ✅

# Parallel group 2 (needs build output)
# 6b: ask Blueprint worker if READY (provide ForceShieldActor class name)
# 6c: inject class names from Stage 2 as dependency
Agent("/ue:blueprint[sonnet]: [injected] BP_Shield...")   ← parallel
Agent("/ue:ui[sonnet]: [injected] WBP_HUD...")            ← parallel
# → 6d → 6e → mark complete
```

## Rules

- Launch independent stages in a **single message** (multiple Agent calls) — never sequentially when no dependency
- Wait for ALL parallel agents before reviewing or moving to next gate
- Reviews for finished parallel groups can themselves run in parallel (read-only)
- If a stage fails: debug within that skill before proceeding. Never skip.
- Never stop early — all stages must complete. Partial completion is failure.
- Spec compliance before code quality — always in this order
- Do NOT summarize between stages — chain tool calls. Full summary only after ALL stages done.

## Anti-pattern vs Correct Pattern

```
# BAD: skipped reviews, yielded control
[Worker completes stage 1]
"Stage 1 done! Created the C++ class. Proceeding to stage 2..."
← WRONG: no review, user must press Enter

# GOOD: full pipeline, continuous
[Worker agent: STATUS: DONE]
[ue:task:code-reviewer spec compliance: ✅]
[ue:task:code-reviewer code quality: ✅]
[TaskUpdate stage 1 → completed] [plan.md stage 1 ✅]
[Dispatch next stage immediately]
```

## Adversarial Review (after all stages)

After all stages complete, before declaring done:

1. **Re-read the plan file** — every stage checked off? Any skipped?
2. **Integration gaps** — do pieces connect? (C++ compiled but Blueprint not created, widget bound but not added to viewport)
3. **Build verified** — if any C++ written, did final build succeed?
4. **Spot-check 2–3 critical files** — read them, confirm they match the plan
5. **Report to user** — what was done, any concerns, suggested manual verification steps (e.g., "open PIE and test the ability")
