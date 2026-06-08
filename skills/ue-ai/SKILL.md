---
name: ue:ai
description: "Use when user asks to create behavior trees, set up EQS queries, configure AI perception, tune navigation mesh, build state trees, implement AI controllers, create smart objects, or architect AI systems. DO NOT TRIGGER for GAS ability AI integration (use ue:gas), C++ code unrelated to AI (use ue:coder), Blueprint graphs unrelated to AI (use ue:blueprint), or general architecture (use ue:architect)."
context: fork
agent: general-purpose
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[AI system task description]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Knowledge Retrieval

Before answering:
1. Resolve the `unrealengine` library in Context7 (see `../_shared/context7-protocol.md`)
2. Fetch the section relevant to this query
3. Merge with local knowledge files — Context7 wins on version-specific details, local knowledge wins on workflow/patterns

# Unreal Engine AI Skill

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — AI type, BehaviorTree vs StateTree, perception needs, nav mesh status
2. **Pre-flight** — check existing AIController, Blackboard, navigation setup
3. **Implement** — AIController, BehaviorTree tasks, Blackboard keys, EQS queries, perception config
4. **Save and compile** — compile AIController Blueprint (if any); save BehaviorTree, Blackboard, EQS assets; confirm zero compile errors
5. **Verify** — test AI behavior in PIE; confirm navigation, perception, and task execution
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## CRITICAL -- Mistakes That Waste Hours

1. **AIController must be set on the Pawn.** No controller = no behavior tree, no perception, nothing. Set `AIControllerClass` on the Pawn's class defaults or in the Character Blueprint. If the pawn spawns without an AIController, every AI subsystem is dead on arrival.

2. **Behavior tree requires a Blackboard.** Set the Blackboard asset on the AIController (via `UseBlackboard()` or the controller's defaults), NOT on the Pawn. The BT editor will show "No Blackboard" warnings but still let you save -- the tree will silently do nothing at runtime.

3. **RunBehaviorTree() must be called AFTER Possess.** Calling it in `BeginPlay` races with possession. Override `OnPossess()` in the AIController and call `RunBehaviorTree()` there, or use `ReceivePossess` in Blueprint. If possession hasn't happened, the controller has no pawn and the tree cannot execute tasks.

4. **EQS: test items are filtered THEN scored.** An item that gets filtered out can never score high regardless of other tests. If your query returns zero results, check filter tests first. A single over-aggressive filter kills the entire query.

5. **NavMesh: RecastNavMesh agent settings must match the pawn's capsule.** Wrong agent radius or height = no valid path. The default agent profile works for standard characters but custom pawns with larger capsules need a matching nav agent profile in Project Settings > Navigation System.

6. **AI Perception: sensing components need at least one sense configured.** An AIPerceptionComponent with no sense configs added is valid at compile time but senses absolutely nothing at runtime. Always add at least one `UAISenseConfig_*` subobject.

7. **Blackboard keys are TYPE-CHECKED.** Setting an Object key with a Vector (or vice versa) silently fails. No error, no warning, just a no-op. Always verify key types match what your tasks and decorators expect.

8. **Task nodes MUST call FinishExecute/FinishAbort.** Forgetting to call `FinishExecute()` (C++) or `FinishExecute(true/false)` (Blueprint) hangs the entire behavior tree. The tree waits forever for the task to report completion.

9. **Decorators with Observer Aborts can cause infinite loops.** A decorator that aborts Self and immediately re-evaluates to true restarts the same branch, which re-aborts, ad infinitum. Watch for abort-restart cycles, especially with Blackboard-based decorators that toggle rapidly.

10. **NavMesh doesn't auto-update at runtime for static geometry changes.** Spawning or moving blocking volumes at runtime won't update the navmesh unless you use `NavigationInvoker`, a `NavMeshBoundsVolume` with dynamic generation, or manually trigger `UNavigationSystemV1::Build()`.

## Subagent Delegation Template

When delegating to the ue:ai subagent, provide:

```
## Task
[Describe the AI task clearly]

## Context
- Project: [UE version, project type]
- Existing AI setup: [current controllers, BTs, etc.]
- Target behavior: [what the AI should do]

## Knowledge References
- @knowledge/behavior-trees.md — BT architecture, tasks, decorators, abort types
- @knowledge/eqs.md — Environment queries, generators, tests, contexts
- @knowledge/perception.md — Sense configuration, stimulus sources, delegates
- @knowledge/navigation.md — NavMesh setup, pathfinding, nav areas, crowd manager

## Constraints
- [Performance budget, target platform, etc.]
```

## When to Delegate

- Creating or modifying behavior trees (composites, tasks, decorators, services)
- Setting up EQS queries (generators, tests, custom contexts)
- Configuring AI perception (sight, hearing, damage, custom senses)
- Tuning navigation mesh (agent profiles, nav areas, nav links)
- Implementing AIController subclasses
- Building AI state machines or state trees
- Creating smart object interactions for AI
- Debugging AI systems (BT debugger, EQS debugger, perception debugger)
- Setting up crowd avoidance and group AI behavior
- Designing patrol routes, combat AI, or companion AI

## When NOT to Delegate

- **GAS ability integration with AI** -- use `ue:gas` skill; it understands ability activation, targeting, and prediction
- **General C++ code** that happens to be in an AI class but isn't about AI logic -- use `ue:coder`
- **Blueprint visual scripting** for non-AI graphs -- use `ue:blueprint`
- **High-level system architecture** decisions -- use `ue:architect`; consult ue:ai only for AI-specific subsystem design
- **Animation logic** even if driven by AI state -- use `ue:animation` or `ue:coder`
- **Networking/replication** of AI state -- this is a networking concern first, AI second

See [Post-Task Requirements](../_shared/post-task.md) for save/compile and code review protocols.
