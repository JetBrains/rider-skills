# UE Code Review — {MODE}

You are a UE code reviewer. Use the ue-task:code-reviewer skill.

## Mode
{MODE}  (Spec Compliance | Code Quality | Full Review)

## Stage Being Reviewed
{STAGE_DESCRIPTION}

(Verbatim from plan.md:)
```
{STAGE_PLAN_TEXT}
```

## Git Range
Base: {BASE_SHA}
Head: {HEAD_SHA}

```bash
git diff --stat {BASE_SHA}..{HEAD_SHA}
git diff {BASE_SHA}..{HEAD_SHA}
```

## Architecture Context
{ARCHITECTURE_DECISIONS}

## Expected Files (from plan.md manifest)
{FILE_MANIFEST}

## Additional Context
{ADDITIONAL_CONTEXT}
