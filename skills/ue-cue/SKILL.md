---
name: ue:cue
description: "Use when the user asks to create GameplayCueNotify actors/statics/bursts, set up GameplayCueManager, configure cue pooling/preloading, implement hit impact effects, set up VFX/SFX feedback for abilities, or architect cue systems for multiplayer. DO NOT TRIGGER for single property changes, general C++ unrelated to cues, material/shader work, or GAS ability/effect logic without cue focus."
context: fork
agent: general-purpose
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[Gameplay Cue task description]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Knowledge Retrieval

Before answering:
1. Resolve the `unrealengine` library in Context7 (see `../_shared/context7-protocol.md`)
2. Fetch the section relevant to this query
3. Merge with local knowledge files — Context7 wins on version-specific details, local knowledge wins on workflow/patterns

# UE Cue Agent — Specialized Subagent

Spawn a focused subagent for Unreal Engine Gameplay Cue tasks: creating cue notify classes (Actor, Static, Burst, Looping), configuring the GameplayCueManager, setting up object pooling, implementing VFX/SFX/camera shake feedback, and architecting cue systems for multiplayer games.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — cue type (Actor/Static/Burst), multiplayer batching needs, VFX/SFX assets ready
2. **Create cue class** — `UGameplayCueNotify_*` subclass with correct C++ parent
3. **Configure manager** — register tags, set up preloading, configure routing
4. **Save and compile** — compile GameplayCue Blueprint; save cue assets; confirm zero compile errors
5. **Verify** — trigger cue in PIE; confirm VFX/SFX fire on both server and client
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## CRITICAL — Mistakes That Waste Hours

### 1. GameplayCues Are Cosmetic ONLY
- **NEVER** put gameplay logic in GameplayCues — they use unreliable multicast RPCs
- Clients may miss cue events entirely; use cues only for particles, sounds, camera shakes, UI animations
- All gameplay state changes must go through GameplayEffects or ability logic

### 2. Tag MUST Start with "GameplayCue." Prefix
- Every cue tag MUST begin with `GameplayCue.` — the manager uses this prefix for routing
- Wrong: `Damage.Fire.Impact` — Right: `GameplayCue.Damage.Fire.Impact`
- Without the prefix, cues silently fail to dispatch

### 3. ALWAYS Implement WhileActive Alongside OnActive
- `WhileActive` (UE 5.5: `OnBecomeRelevant`) handles late-joining clients
- If only `OnActive` is overridden, late joiners never see ongoing effects
- If only `OnActive` + `OnRemove`, late joiners see effects stuck permanently
- UE 5.5+ raises asset validation warning for this mistake

### 4. Configure GameplayCueNotifyPaths — NEVER Scan All of /Game/
- Without explicit paths, the engine scans ALL of `/Game/` at startup
- This loads every GCN Blueprint AND all referenced particles/sounds into memory
- Causes 10-30+ second startup hitches and massive memory spikes
- Always set: `+GameplayCueNotifyPaths=/Game/Effects/GameplayCues` in DefaultGame.ini

### 5. Choose the Right Cue Type
- `_Static` / `_Burst` — no actor spawned, lowest overhead, use for one-shot impacts
- `_Actor` / `_Looping` — spawns actor, use only when effects need state/persistence
- Using `_Actor` for fire-and-forget effects wastes performance (actor spawn/destroy per hit)

### 6. Set bAutoDestroyOnRemove for Actor Cues
- Default is false — actor instances accumulate and leak memory
- Always set `bAutoDestroyOnRemove = true` in the constructor
- Set `AutoDestroyDelay` to allow particle fade-out before recycling

### 7. Location/Normal Not Auto-Populated
- `FGameplayCueParameters::Location` and `Normal` default to zero vector
- NOT auto-extracted from EffectContext — must be set explicitly or extracted from HitResult in the cue
- Without this, impact effects spawn at world origin (0,0,0)

### 8. Listen Server Double-Fire (Mixed/Minimal Replication)
- OnActive/OnRemove fire TWICE on listen server host player
- Once from local GE application, once from NetMulticast RPC
- Guard with state flags or make effects idempotent

### 9. Async Load Race Condition
- AddGameplayCue → RemoveGameplayCue while class is still async loading
- Load completes, OnActive fires, OnRemove never does → stuck effect
- Preload critical cues or use sync loading for important effects

### 10. Custom EffectContext Requires AbilitySystemGlobals Registration
- Custom `FGameplayEffectContext` subclass needs custom `UAbilitySystemGlobals`
- Override `AllocGameplayEffectContext()` to return custom type
- Register in DefaultGame.ini: `AbilitySystemGlobalsClassName=/Script/MyProject.MyAbilitySystemGlobals`
- AND call `InitGlobalData()` early in game startup

## When to Delegate

- **Cue class creation** — Actor, Static, Burst, or Looping GameplayCueNotify classes
- **Hit impact systems** — physical material-based VFX/SFX selection per surface type
- **Custom GameplayCueManager** — on-demand loading, cue suppression, path configuration
- **Object pooling** — Recycle/ReuseAfterRecycle, NumPreallocatedInstances setup
- **VFX/SFX feedback** — Niagara spawning, sound, camera shakes from cue parameters
- **Cue architecture** — tag taxonomy, cue type selection, multiplayer cue strategy
- **Magnitude-scaled effects** — scaling particles/sounds by NormalizedMagnitude from GE
- **Custom EffectContext** — passing extra data through to cues (damage type, crit hit, etc.)
- **Network optimization** — FScopedGameplayCueSendContext batching, local-only cues
- **IGameplayCueInterface** — direct actor handler setup, tag-matched functions
- **Cue forwarding** — pawn to weapon, actor to component cue dispatch

## When NOT to Delegate

- **GAS ability/effect logic** — use **ue:gas** skill
- **General C++ unrelated to cues** — use **ue:coder** skill
- **Material/shader work** — use **ue:material** skill
- **Niagara system creation** — creating Niagara assets is editor work, not cue logic
- **Simple property change** — just setting one value on an existing cue doesn't need a subagent
- **Architecture without cue focus** — use **ue:architect** skill

## How to Spawn

Use the **Agent** tool with `subagent_type: "general-purpose"`. Include the prompt template below with the specific task filled in.

### Prompt Template

```
You are a UE Gameplay Cue automation agent. Complete the following Gameplay Cue task for an Unreal Engine project.

**Task:** [describe what to implement — cue classes, manager setup, pooling, etc.]

**How to communicate with the editor:**
All editor communication goes through **/ue:console**. See the ue:console skill for the full transport API.

DO NOT use raw `curl`. DO NOT use MCP tools (not available to subagents).

**C++ File Workflow:**
Cue code is primarily C++. Use Read/Write/Edit tools to create and modify .h/.cpp files directly in the project Source directory. After writing files:
1. Check existing files with Glob/Grep to understand project structure
2. Write .h and .cpp files using Write tool
3. Trigger hot-reload via `/ue:console --build --wait`
4. Verify compilation via `/ue:console --errors --filter "CompilerResultsLog"`

## Gameplay Cue Workflow Paths

### Path 1: Actor Cue (Persistent Effect — Aura, Shield, Buff)
1. Create `AGameplayCueNotify_Actor` subclass
2. Set `GameplayCueTag` in constructor (MUST start with `GameplayCue.`)
3. Set `bAutoDestroyOnRemove = true`, `AutoDestroyDelay` for particle fade
4. Override `OnActive_Implementation` — spawn Niagara/sound effects
5. Override `WhileActive_Implementation` — restart effects for late joiners
6. Override `OnRemove_Implementation` — deactivate/stop effects
7. Set `NumPreallocatedInstances` for pooling if high-frequency
8. Optionally override `Recycle()` / `ReuseAfterRecycle()` for custom pool behavior

### Path 2: Static Cue (Instant Impact — Hit, Flash, Explosion)
1. Create `UGameplayCueNotify_Static` subclass
2. Set `GameplayCueTag` in constructor
3. Override `OnExecute_Implementation` (const method)
4. Use `Parameters.Location` / `Parameters.Normal` for spawn transform
5. Use `Parameters.PhysicalMaterial` for surface-specific effects
6. Spawn particles with `UNiagaraFunctionLibrary::SpawnSystemAtLocation`
7. Play sound with `UGameplayStatics::PlaySoundAtLocation`
8. Add camera shake with `UGameplayStatics::PlayWorldCameraShake`

### Path 3: Burst Cue (Lightweight One-Off — UE5+)
1. Create `UGameplayCueNotify_Burst` subclass
2. Set `GameplayCueTag` in constructor
3. Configure built-in `BurstEffects` (particle + sound refs) in Blueprint defaults
4. Override `OnBurst_Implementation` for custom logic (magnitude scaling, etc.)
5. NEVER add looping effects — use `_Looping` or `_Actor` instead

### Path 4: Custom GameplayCueManager
1. Create `UGameplayCueManager` subclass
2. Override `ShouldAsyncLoadRuntimeObjectLibraries()` → false for on-demand loading
3. Override `ShouldAsyncLoadMissingGameplayCues()` → true for deferred execution
4. Override `ShouldSuppressGameplayCues(AActor*)` for dead/hidden actor filtering
5. Register in DefaultGame.ini: `GlobalGameplayCueManagerClass=/Script/YourProject.YourManager`
6. Configure `+GameplayCueNotifyPaths` for scan directories

### Path 5: Local-Only Cues (UI Feedback, Damage Numbers)
1. Use `ASC->ExecuteGameplayCueLocal(Tag, Params)` — no replication
2. Or `ASC->AddGameplayCueLocal(Tag, Params)` for persistent local cues
3. Set `Params.RawMagnitude` for damage amount
4. Set `Params.Location` for world position
5. Handle in cue: create widget, show floating text, trigger UI animation

### Path 6: Network-Optimized Cue Batching
1. Wrap multi-cue code in `FScopedGameplayCueSendContext`
2. All `ExecuteGameplayCue` / `AddGameplayCue` calls within scope are batched
3. Single network flush when scope exits
4. Critical for AoE abilities hitting many targets

### Path 7: Custom EffectContext for Extra Cue Data
1. Subclass `FGameplayEffectContext` with custom fields (damage type, crit, etc.)
2. Override `GetScriptStruct()`, `Duplicate()`, `NetSerialize()`
3. Subclass `UAbilitySystemGlobals`, override `AllocGameplayEffectContext()`
4. Register in DefaultGame.ini
5. Cast to custom type in cue handler

## Critical Rules

1. **GameplayCues are cosmetic ONLY** — NEVER gameplay logic
2. **Tag MUST start with `GameplayCue.`** — routing depends on this prefix
3. **ALWAYS implement WhileActive alongside OnActive** — late joiners need it
4. **ALWAYS configure GameplayCueNotifyPaths** — never let it scan all of /Game/
5. **ALWAYS set bAutoDestroyOnRemove = true** on Actor cues — prevents memory leaks
6. **Use Static/Burst for one-shots, Actor/Looping for persistent** — right type for right job
7. **Set Location/Normal explicitly** — not auto-populated from EffectContext
8. **Use FScopedGameplayCueSendContext for AoE** — batch RPCs for performance
9. **Use local cues for UI-only effects** — no network cost for damage numbers
10. **Guard against listen server double-fire** — state flags or idempotent effects
11. **Preload critical cues** — NumPreallocatedInstances or AlwaysLoadedPaths
12. **Include all three GAS modules in Build.cs** — GameplayAbilities, GameplayTags, GameplayTasks

## Verification Steps

After completing Gameplay Cue implementation, the subagent MUST:
1. Verify all .h/.cpp files compile: check `/ue:console --errors --filter "CompilerResultsLog"` or inform user to build
2. Confirm Build.cs includes GameplayAbilities, GameplayTags, GameplayTasks
3. Verify all cue tags start with `GameplayCue.` prefix
4. Check that Actor cues implement WhileActive alongside OnActive
5. Confirm bAutoDestroyOnRemove is set on Actor cues
6. Verify GameplayCueNotifyPaths is configured (warn if not)
7. Report structured summary of what was created

**Output format:**
Return a structured summary:
- What was done (steps taken)
- Files created/modified (full paths)
- Cue classes created (names, parent classes, tags)
- Cue types used (Actor/Static/Burst/Looping) and why
- Configuration changes (DefaultGame.ini, Build.cs)
- Network considerations (replication mode, batching)
- Any compilation warnings or issues
```

### Example Invocations

**Hit impact system with physical material selection:**
```python
Agent(
    subagent_type="general-purpose",
    description="Create hit impact cue system",
    prompt="""You are a UE Gameplay Cue automation agent...

    **Task:** Create a hit impact system using GameplayCueNotify_Static:
    1. UGCN_WeaponImpact : UGameplayCueNotify_Static
    2. Tag: GameplayCue.Weapon.Impact
    3. Select different Niagara particles based on PhysicalMaterial surface type
    4. Metal: sparks + metallic clang, Wood: splinters + thud, Flesh: blood + squelch
    5. Play camera shake scaled by distance from impact
    6. Use sound pitch randomization (0.9-1.1) for variety

    Project source directory: [path to Source/]

    [include full tool list and workflow paths from template above]
    """
)
```

**Persistent buff aura with Niagara:**
```python
Agent(
    subagent_type="general-purpose",
    description="Create shield aura cue",
    prompt="""You are a UE Gameplay Cue automation agent...

    **Task:** Create a shield buff aura using GameplayCueNotify_Actor:
    1. AGCN_ShieldAura : AGameplayCueNotify_Actor
    2. Tag: GameplayCue.Buff.Shield
    3. Spawn looping Niagara shield bubble effect on OnActive
    4. WhileActive restarts effect for late joiners
    5. OnRemove fades out Niagara and sound over 0.5s
    6. Set up object pooling: NumPreallocatedInstances = 8
    7. Override Recycle/ReuseAfterRecycle for clean pool behavior
    8. Scale effect opacity by NormalizedMagnitude

    [include full tool list and workflow paths from template above]
    """
)
```

**Custom GameplayCueManager with on-demand loading:**
```python
Agent(
    subagent_type="general-purpose",
    description="Set up custom cue manager",
    prompt="""You are a UE Gameplay Cue automation agent...

    **Task:** Create a custom GameplayCueManager (Lyra pattern):
    1. UMyGameplayCueManager : UGameplayCueManager
    2. Skip preloading: ShouldAsyncLoadRuntimeObjectLibraries → false
    3. Async load missing cues on-demand: ShouldAsyncLoadMissingGameplayCues → true
    4. Suppress cues for dead/hidden actors
    5. Register in DefaultGame.ini
    6. Configure GameplayCueNotifyPaths for /Game/Effects/GameplayCues and /Game/Characters/GameplayCues

    [include full tool list and workflow paths from template above]
    """
)
```

## Tips

- Keep subagent prompts focused on ONE cue subsystem (don't mix "create 10 cue classes" with "set up custom manager")
- Include the full tool list — the subagent does not inherit skill context
- For full cue systems, break into sequential calls: Manager setup → Static cues → Actor cues → Pooling
- The subagent's output is returned to you — summarize it for the user
- When in doubt about cue type: Static for one-shots, Actor for persistent, Burst for lightweight one-shots

see: knowledge/cue-reference.md — Complete Gameplay Cue reference: notify types, FGameplayCueParameters, GameplayCueManager, replication, events, tag conventions, debugging
see: knowledge/cue-patterns.md — Copy-paste C++ recipes: Actor cue with Niagara, Static impact cue, Burst cue, custom manager, pooling, batching, local cues, camera shake, EffectContext
see: knowledge/cue-pitfalls.md — 15+ pitfalls with symptoms, causes, and fixes: double-fire, stuck cues, missing effects, performance, async loading races
see: knowledge/cue-advanced.md — Production-grade patterns: on-demand loading manager with reference tracking, GameFeature plugin cue registration, cartridge-grouped EffectContext, asset organization, tag taxonomy, Asset Manager integration

See [Post-Task Requirements](../_shared/post-task.md) for save/compile and code review protocols.
