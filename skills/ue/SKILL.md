---
name: ue
description: "UE toolkit entry point — automatically loaded in Unreal Engine projects. Establishes the full ue:* skill system: which skills exist, when to invoke them, and how to sequence them. Injected via SessionStart hook when a .uproject file is detected."
---

<EXTREMELY-IMPORTANT>
You are working in an **Unreal Engine project**. You have a full suite of UE-specialized skills available. These skills contain deep domain knowledge, established patterns, and critical pitfall warnings that prevent hours of wasted work.

IF A UE SKILL APPLIES TO YOUR TASK, YOU DO NOT HAVE A CHOICE. YOU MUST USE IT.

This is not negotiable. This is not optional. You cannot rationalize your way out of this.
</EXTREMELY-IMPORTANT>

## The Rule

**Invoke the relevant `ue:*` skill BEFORE any response or action involving Unreal Engine work.**

Even a 1% chance a skill might apply means you must invoke it to check.

```
User message about UE → Check skill list below → Invoke ue:* skill → Follow it → Respond
```

If no UE skill applies, proceed normally. But check first.

## Red Flags — You Are Rationalizing

| Thought | Reality |
|---------|---------|
| "I already know UE well enough" | Skills contain version-specific patterns and gotchas you don't have memorized. Use them. |
| "This is just a simple UE question" | Simple questions hide complex pitfalls. Check for a skill. |
| "Let me look at the code first" | Skills tell you HOW to look at the code. Check first. |
| "I don't need a skill for one-liners" | One-liners in UE often have silent failure modes. Check. |
| "I remember what to do" | Skill content evolves. Read the current version. |
| "The user just wants a quick answer" | Wrong quick answers waste hours. Use the skill. |

## Skill Priority

1. **`ue:task`** — Multi-step features, architectural planning, cross-skill work
2. **`ue:architect`** — System design questions, pattern selection, before writing code
3. **Domain skills** — The specific area (C++, Blueprint, GAS, UI, etc.)
4. **`ue:debugger`** — Any crash, bug, or unexpected behavior before proposing fixes

## `ue:task` Is REQUIRED When

**Do NOT jump to a domain skill if any of these are true:**

- The request spans **more than one skill domain** — e.g., GAS + UI, C++ + Blueprint, abilities + networking
- The request involves **creating or substantially extending** a system (not just editing one file)
- There are **architecture decisions** to make — class hierarchy, where to put logic, which pattern to use
- The user wants a **feature visible in UI** that is backed by gameplay code — cooldowns, health bars, ability icons, status effects
- You would need to invoke **two or more worker skills** to complete the work

`ue:task` runs a full design-first workflow (research → clarify → design → approval → plan → execute). It does NOT jump straight to implementation. Invoke it and let it drive.

**Quick test:** If you catch yourself thinking "I'll just use `ue:gas` and also do some UI work" — stop. That's `ue:task`.

## Available Skills

### Orchestration
| Skill | Invoke when... |
|-------|----------------|
| `ue:task` | Any multi-step feature, or any work spanning 2+ skill domains (GAS + UI, C++ + Blueprint, abilities + networking, etc.) |
| `ue:architect` | Designing systems, choosing patterns, class hierarchies, module structure |

### Code
| Skill | Invoke when... |
|-------|----------------|
| `ue:coder` | Creating C++ classes, actors, components, subsystems; code review; naming checks |
| `ue:blueprint` | Creating Blueprint assets, wiring nodes, setting defaults, compiling |

### UI
| Skill | Invoke when... |
|-------|----------------|
| `ue:ui` | UMG widgets, CommonUI, HUD systems, menus, focus navigation |
| `ue:ui-cpp` | C++ widget base classes, BindWidget, MVVM ViewModels, UI subsystems |

### Gameplay Systems
| Skill | Invoke when... |
|-------|----------------|
| `ue:gas` | Ability System, AttributeSets, GameplayEffects, ExecCalcs, GAS setup |
| `ue:cue` | GameplayCues, VFX/SFX feedback, impact effects |
| `ue:input` | Enhanced Input, Input Actions, Mapping Contexts, combos, key remapping |
| `ue:networking` | Replication, RPCs, prediction, authority, multiplayer debugging |
| `ue:physics` | Collision, constraints, Chaos physics, ragdoll, traces/sweeps |
| `ue:ai` | Behavior Trees, EQS, AI perception, NavMesh, AIController |
| `ue:animation` | Animation Blueprints, montages, blend spaces, IK, state machines |

### Content & Editor
| Skill | Invoke when... |
|-------|----------------|
| `ue:editor` | Spawning/moving actors, managing assets, viewport, Python automation |
| `ue:material` | Material graphs (3+ nodes), material instances, shaders, Substrate |
| `ue:graphics` | Nanite, Lumen, VSM, TSR, custom shaders, RDG, GPU profiling |
| `ue:level-design` | Levels, landscapes, World Partition, streaming, lighting, sky |
| `ue:data` | DataTables, DataAssets, CurveTables, Asset Manager, data-driven systems |
| `ue:pcg` | PCG graphs, foliage scatter, biome generation, procedural placement |
| `ue:cinematics` | Level sequences, Sequencer, camera cuts, movie render queue |
| `ue:plugin` | Creating plugins, .uplugin descriptors, module setup, Marketplace prep |

### Build & Deploy
| Skill | Invoke when... |
|-------|----------------|
| `ue:builder` | Building, compiling, or cleaning the UE project |
| `ue:console` | Launching the editor, running Python, logs, console commands, PIE control |
| `ue:platform` | INI configs, packaging, deploying to device, mobile signing |
| `ue:testing` | Automation tests, functional tests, Gauntlet, CI test pipelines |

### Review
| Skill | Invoke when... |
|-------|----------------|
| `ue:code-review` | After any implementation — covers spec compliance, C++, Blueprint, materials, data assets, Enhanced Input, GAS, networking |

### Diagnosis
| Skill | Invoke when... |
|-------|----------------|
| `ue:debugger` | Crashes, bugs, nullptr errors, GC issues, unexpected behavior |
| `ue:profiler` | Frame drops, GPU bottlenecks, CPU optimization, Unreal Insights |

## Invoking Skills

Use the Skill tool:
```
Skill("ue:coder")       — for a C++ task
Skill("ue:gas")         — for GAS work
Skill("ue:task")        — for multi-step features
Skill("ue:debugger")    — for any bug or crash
```

For complex multi-step work, always start with `ue:task`. It handles research, architecture, planning, and execution sequencing.

## Working Directory Guard

If the current working directory does NOT contain a `.uproject` file, you are likely not in a UE project (e.g., you may be in a skill/tools repository). In that case:
- Do NOT invoke `ue:*` worker skills for gameplay/editor automation
- Do NOT attempt to connect to editor bridges or run UE Python
- Treat it as a normal software engineering task
