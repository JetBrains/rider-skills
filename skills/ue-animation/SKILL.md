---
name: ue:animation
description: "Use when user asks to set up Animation Blueprints, create montages, configure blend spaces, build state machines, add anim notifications, set up IK, create anim layers, or architect animation systems. DO NOT TRIGGER for skeletal mesh import (use ue:editor), C++ actor code unrelated to animation (use ue:coder), material/VFX (use ue:material), or Blueprint logic graphs (use ue:blueprint)."
context: fork
agent: general-purpose
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[animation task description]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Knowledge Retrieval

Before answering:
1. Resolve the `unrealengine` library in Context7 (see `../_shared/context7-protocol.md`)
2. Fetch the section relevant to this query
3. Merge with local knowledge files — Context7 wins on version-specific details, local knowledge wins on workflow/patterns

# UE Animation Skill

Specialized subagent for Unreal Engine animation systems: Animation Blueprints, montages, blend spaces, state machines, IK, physics animation, and locomotion architecture.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — skeleton, montage slots, root motion requirements, IK needs
2. **Pre-flight** — check existing Animation Blueprint, montage setup, blend spaces
3. **Implement** — create/modify ABP state machines, montages, blend spaces, anim notifies
4. **Save and compile** — compile Animation Blueprint; save ABP, montage, and blend space assets; confirm zero compile errors
5. **Verify** — test animation in PIE; check transitions, root motion, notify timing
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

---

## CRITICAL -- Mistakes That Waste Hours

These are the most common errors when working with UE animation. Violating any of them leads to silent failures or hours of debugging.

1. **Always set Skeleton on AnimBP.** Creating an Animation Blueprint without assigning the correct Skeleton asset means all animation data is silently ignored. The AnimBP compiles fine but produces a T-pose at runtime.

2. **Montage slots must match.** Playing a montage on `DefaultSlot` when the AnimBP's Slot node uses `UpperBody` means nothing visually happens. The montage plays internally but the slot node never picks it up. Always verify the slot name in both the montage asset AND the AnimGraph Slot node.

3. **RootMotion requires BOTH flags.** Enabling Root Motion on the AnimSequence alone is not enough. You must also enable it on the Character Movement Component (`bAllowPhysicsRotationDuringAnimRootMotion`, `RootMotionMode`) AND the AnimBP (`bForceRefPoseForRootMotion`). Missing either side = character slides or stays in place.

4. **Blend space axis ranges must match actual parameter ranges.** If your locomotion variable outputs 0-600 for speed but the blend space X-axis is 0-1, all animations collapse to a single sample. Always verify min/max on both the variable source and the blend space axis.

5. **Notify timing is frame-dependent -- use NotifyState for duration-based logic.** A single-frame AnimNotify can be skipped entirely if the frame rate drops or animation playback rate changes. For anything that needs a window (damage frames, trail FX, sound fadeout), use AnimNotifyState with Begin/Tick/End.

6. **LinkedAnimGraphs need matching skeletons AND bone mappings.** Linking an AnimBP with a different skeleton requires explicit bone remapping. Without it, bones resolve by name and any mismatch produces garbage poses on those bones.

7. **AnimBP variables must be thread-safe for Property Access.** The Property Access system (Fast Path) runs on worker threads. Any variable read through Property Access that is not marked `BlueprintThreadSafe` causes race conditions -- typically manifested as flickering poses or intermittent crashes.

8. **Don't tick AnimBP on hidden/culled meshes.** By default, AnimBPs tick even when off-screen. Set `VisibilityBasedAnimTickOption` on the SkeletalMeshComponent to `OnlyTickPoseWhenRendered` or use significance-based optimization. Failing to do this tanks performance with many animated characters.

9. **State machine transitions need proper blend logic.** Setting cross-fade duration to 0 causes a hard pop/snap between states. Always use at least 0.1-0.2s blend time, and choose the correct blend profile (linear, ease-in, ease-out, custom curve).

10. **IK bone chain must be continuous.** If you specify a root bone and tip bone for a Two-Bone IK or FABRIK solver, every bone between them must form an unbroken parent-child chain. Gaps (skipped bones, branching hierarchies) cause the solver to produce wildly incorrect results with no error message.

---

## When to Delegate to This Skill

TRIGGER this skill when the user asks to:
- Create or modify an Animation Blueprint (AnimBP)
- Build state machines or transition rules
- Set up montages (attack combos, abilities, cinematics)
- Configure blend spaces (1D, 2D, aim offsets)
- Implement IK (foot placement, hand IK, Control Rig)
- Set up ragdoll, physical animation, or AnimDynamics
- Architect a locomotion system
- Add or debug Anim Notifications / Notify States
- Configure Linked Anim Graphs or Anim Layers
- Optimize animation performance (LOD, significance, Fast Path)
- Implement networked animation replication
- Set up Sync Groups or animation synchronization

## When NOT to Delegate

DO NOT trigger for:
- **Skeletal mesh import/retargeting** -- use `ue:editor`
- **C++ actor or component code** unrelated to animation -- use `ue:coder`
- **Materials, Niagara, VFX** -- use `ue:material`
- **Blueprint visual scripting** (non-anim graphs) -- use `ue:blueprint`
- **Audio** that happens to play during animations -- use `ue-audio`
- **AI/Behavior Trees** that merely trigger animations -- use `ue:ai`

---

## How to Spawn

When delegating to this skill, use the following subagent prompt template:

```
You are a UE Animation specialist. You have deep knowledge of Unreal Engine's animation systems.

CONTEXT:
- UE version: {version, e.g. 5.4}
- Target: {what the user wants to build}
- Skeleton/Character: {skeleton asset or character class if known}
- Existing AnimBP: {path if modifying existing, "none" if new}

TASK:
{Describe the specific animation task}

KNOWLEDGE FILES (read before responding):
- ~/.claude/skills/ue:animation/knowledge/anim-blueprints.md -- AnimBP architecture, state machines, Fast Path
- ~/.claude/skills/ue:animation/knowledge/montages.md -- Montage system, slots, replication
- ~/.claude/skills/ue:animation/knowledge/blend-spaces.md -- Blend spaces, locomotion, additive anims
- ~/.claude/skills/ue:animation/knowledge/ik-and-physics.md -- IK solvers, Control Rig, ragdoll, AnimDynamics

RULES:
- Always reference the "CRITICAL -- Mistakes That Waste Hours" in SKILL.md before generating any setup steps.
- Provide complete node graphs or C++ snippets, not fragments.
- When creating AnimBPs, always specify the target Skeleton.
- When using montages, always verify slot name consistency.
- Prefer Property Access (Fast Path) over EventGraph variable copies where possible.
- For multiplayer, always address replication.
```

---

## Knowledge File Reference

| File | Covers |
|---|---|
| `knowledge/anim-blueprints.md` | AnimBP architecture, Event Graph vs Anim Graph, state machines, transitions, Fast Path, Sync Groups, Linked Anim Graphs, Anim Layers, Lyra patterns |
| `knowledge/montages.md` | Montage structure, sections, slots, C++ and BP playback, notifications, blending, networked montages, root motion |
| `knowledge/blend-spaces.md` | 1D/2D blend spaces, axis config, locomotion patterns, aim offsets, additive animations, per-bone and layered blending |
| `knowledge/ik-and-physics.md` | Control Rig, FABRIK, Two-Bone IK, CCDIK, foot/hand IK, physical animation, ragdoll, AnimDynamics |

See [Post-Task Requirements](../_shared/post-task.md) for save/compile and code review protocols.
