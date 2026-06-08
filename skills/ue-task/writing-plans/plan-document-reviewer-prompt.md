# Plan Document Reviewer Prompt Template

Use this template when dispatching a plan reviewer subagent after writing `plan.md`.

**Purpose:** Verify the plan is complete, UE-correct, and ready for subagent execution.

**Dispatch after:** The complete `plan.md` is written.

```
Agent tool (general-purpose):
  description: "Review UE plan document"
  prompt: |
    You are a UE plan document reviewer. Verify this plan is complete and ready for execution by ue:task:subagent-driven-development.

    **Plan to review:** [PLAN_FILE_PATH]
    **Research / spec for reference:** [SPEC_OR_RESEARCH_FILE_PATH]

    ## What to Check

    | Category | What to Look For |
    |----------|------------------|
    | Completeness | TODOs, placeholders, incomplete stages, missing steps |
    | Spec alignment | Plan covers all requirements from the design spec; no major scope creep |
    | Skill accuracy | Each stage names the correct worker skill (`/ue:coder` for C++, `/ue:ui` for UMG, `/ue:blueprint` for BP graphs, NOT mixed up) |
    | Stage granularity | Each stage is implementable by one worker in one pass — not too broad, not trivially small |
    | No ambiguity | Could any stage be interpreted two ways? Flag it. |
    | Type consistency | Class names, file paths, method names consistent across all stages? A class named `AMyActor` in Stage 2 but `AMyCharacter` in Stage 4 is a bug. |
    | Execution order | Dependencies listed correctly? C++ before Blueprint, build before editor stages? |

    ## Calibration

    **Only flag issues that would cause a worker to fail or build the wrong thing.**
    Minor wording preferences, stylistic suggestions, and "nice to have" additions are not issues.

    Approve unless there are: missing requirements, contradictory stages, placeholder content, wrong skill assignments, or stages so vague a worker would need to ask for more context.

    ## Output Format

    ### Plan Review

    **Status:** Approved | Issues Found

    **Issues (if any):**
    - [Stage N]: [specific issue] — [why it would cause the worker to fail or go wrong]

    **Recommendations (advisory, do not block approval):**
    - [suggestions for improvement]
```

**Reviewer returns:** Status, Issues (if any), Recommendations

**On Issues Found:** fix inline in `plan.md`, then re-read to confirm, then proceed to user approval.
**On Approved:** proceed directly to user approval gate.
