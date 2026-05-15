---
name: ue:expert
description: "Universal Unreal Engine domain expert. Use for ANY UE work: C++ code (ue:coder), GAS abilities (ue:gas), Enhanced Input (ue:input), animation, networking/replication, physics/collision, AI/BT, debugging crashes, build/compile, graphics/rendering (Nanite/Lumen/shaders), PCG, level design, plugins, cinematics/Sequencer, GameplayCues, profiling, and testing. The *what*: domain rules, pitfalls, patterns, knowledge files. For the *how* — driving the Unreal Editor through the JetBrains Rider MCP server (`ue_*`, asset/tag index, Live Coding, PIE, Python automation, long-running build/cook/package) — use the `ide-ue` skill."
---

# Unreal Engine Expert

One skill for all UE domain knowledge. Use the routing table to find your domain, read the relevant knowledge files, then implement.

All Rider / Unreal Editor MCP driving — `ue_health`, `ue_trigger_build`, `ue_get_logs`, `ue_play_control`, `search_assets`, `get_class_hierarchy`, `ue_execute_python`, the MCP-first pipelines, long-running build/cook/package protocols — lives in the **`ide-ue`** skill. Consult that skill any time you need to actually drive the editor. This skill is the *what* (UE patterns, pitfalls, domain rules); `ide-ue` is the *how* (MCP plumbing).

## Checklist

1. **Route** — identify domain, find knowledge files in the table below
2. **MCP probe** (via `ide-ue:editor`) — call `ue_health` to confirm the editor is connected; pick MCP tools over CLI when both exist
3. **Read** — read domain guide + reference files before writing anything
4. **Pre-flight** — grep existing source for patterns; read Build.cs and 1-2 nearby files
5. **Implement** — write code matching project conventions
6. **Build** (via `ide-ue:build`) — `ue_trigger_build` (Live Coding) when editor is up; fall back to `scripts/ue-build.sh` for headless / structural changes
7. **Verify** (via `ide-ue:editor`) — `ue_play_control("play")` to enter PIE; `ue_get_logs` to inspect Output Log for warnings/errors

---

## Universal Rules (apply to ALL UE work)

1. **NEVER call `GetWorld()` in constructors** — returns nullptr during CDO construction; use `BeginPlay()` or `PostInitializeComponents()`
2. **NEVER store raw `UObject*` without `UPROPERTY()`** — GC collects it, leaving a dangling pointer; use `UPROPERTY()`, `TWeakObjectPtr<>`, or `TStrongObjectPtr<>`
3. **NEVER add visual assets in C++** — no `ConstructorHelpers::FObjectFinder`, no mesh/material assignment; all visual configuration belongs in Blueprints
4. **ALWAYS read existing code first** — match the project's naming, include style, and macro conventions before writing
5. **ALWAYS build after C++ changes** — never proceed to BP creation or editor work on a failed build
6. **NEVER hot-reload after structural changes** — restart editor after adding `UPROPERTY`, changing class hierarchy, or adding virtual functions
7. **Use `TObjectPtr<>`** for `UPROPERTY` object pointers (UE5 convention); forward-declare in headers, include in `.cpp`
8. **UE units are centimeters** — velocity = cm/s, distance = cm; 100 UU = 1 meter; `LaunchVelocity.Z = √(2 × 980 × HeightCM)`

---

## Rider MCP — see the `ide-ue` skill

All Unreal-aware MCP plumbing lives in the **`ide-ue`** skill. Consult it whenever you need to actually drive the editor. It covers:

- **`ide-ue:editor`** — `ue_health`, `ue_get_play_state`, `ue_set_play_mode`, `ue_play_control`, `ue_get_logs`.
- **`ide-ue:build`** — `ue_trigger_build` (Live Coding), `build` / `build_solution`, target discovery, `get_file_problems` / `lint_files`.
- **`ide-ue:assets`** — `search_assets`, `get_class_hierarchy`, `get_asset_properties`, `search_tags`.
- **`ide-ue:blueprint`** — `ue_find_blueprint_usages`, `ue_open_blueprint`.
- **`ide-ue:python`** — `ue_execute_python`, `ue_execute_python_batch`.
- **`ide-ue:pipelines`** — canonical P1 (C++ → Live Coding → PIE), P2 (BP discovery), P3 (tag refactor), P4 (crash debug), P5/P6 (Python automation), P7 (PIE networking repro), P8 (CDO inspection).
- **`ide-ue:long-ops`** — helper scripts, build / clean / package wrappers, and the mandatory background protocol for builds / cooks / packages (`run_in_background`, `Monitor`, `ScheduleWakeup`).

For non-UE IDE concerns — symbol search, refactors, debugger (xdebug), run configurations — see the **`ide`** skill.

This skill keeps only the UE *domain knowledge*: the routing table, per-domain critical rules, and the knowledge file index.

## Domain Routing Table

| Domain | When to use | Knowledge files |
|--------|-------------|-----------------|
| **Architecture** | System design, class hierarchy, pattern selection, module structure, anti-patterns | `arch-architecture-principles.md`, `arch-decision-frameworks.md`, `arch-anti-patterns.md`, `arch-module-design.md` |
| **C++ / Blueprint** | New classes, actors, components, subsystems, BP assets from C++ parents | `code-cpp-patterns.md`, `code-ue5-patterns.md`, `code-blueprints.md`, `code-linting.md` |
| **GAS** | AbilitySystemComponent, AttributeSets, GameplayAbilities, GameplayEffects, ExecCalcs | `gas-reference.md`, `gas-patterns.md`, `gas-pitfalls.md`, `gas-damage-pipeline.md`, `net-gas-networking.md` |
| **GameplayCues** | GameplayCueNotify classes, VFX/SFX feedback, cue pooling, cue manager | `cue-reference.md`, `cue-patterns.md`, `cue-pitfalls.md`, `cue-advanced.md` |
| **Enhanced Input** | Input Actions, Mapping Contexts, custom modifiers/triggers, combos, key remapping | `input-reference.md`, `input-patterns.md`, `input-pitfalls.md`, `input-crossplatform.md` |
| **Animation** | AnimBP, state machines, montages, blend spaces, IK, Control Rig, AnimDynamics | `anim-blueprints.md`, `anim-montages.md`, `anim-blend-spaces.md`, `anim-ik-physics.md` |
| **Networking** | Replication, RPCs, prediction, relevancy, authority, bandwidth optimization | `net-replication.md`, `net-rpcs.md`, `net-prediction.md`, `net-relevancy.md`, `net-pitfalls.md`, `net-replication-patterns.md` |
| **Physics** | Collision profiles, constraints, Chaos physics, ragdoll, traces/sweeps | `physics-collision.md`, `physics-collision-setup.md`, `physics-simulation.md`, `physics-traces-queries.md` |
| **AI** | Behavior Trees, EQS, AI perception, NavMesh, AIController, StateTree | `ai-behavior-trees.md`, `ai-eqs.md`, `ai-perception.md`, `ai-navigation.md` |
| **Graphics / Rendering** | Nanite, Lumen, VSM, TSR, custom shaders/HLSL, RDG passes, post-processing, GPU VFX | `graphics-nanite.md`, `graphics-lumen.md`, `graphics-vsm-tsr.md`, `graphics-shader-development.md`, `graphics-rendering-pipeline.md`, `graphics-rdg-passes.md` |
| **Debugging** | Crashes, nullptr errors, GC issues, assertion failures, Blueprint errors | `debug-crash-patterns.md`, `debug-console-commands.md`, `debug-diagnostic-workflows.md` |
| **Build** | Compile, clean, Live Coding, UBT | `build-plugin-reload.md` — use `scripts/ue-build.sh` |
| **Profiling** | Frame drops, GPU/CPU bottlenecks, memory, Unreal Insights, stat commands | `profile-cpu.md`, `profile-gpu.md`, `profile-memory.md` |
| **Testing** | Automation tests, CQTest, functional tests, Gauntlet, CI pipelines | `test-automation-framework.md`, `test-cqtest.md`, `test-functional-tests.md`, `test-gauntlet.md` |
| **PCG** | PCG graphs, foliage scatter, biome systems, custom C++ nodes | `pcg-reference.md`, `pcg-patterns.md`, `pcg-custom-nodes.md`, `pcg-pitfalls.md`, `pcg-performance.md` |
| **Level Design** | World Partition, landscapes, lighting/atmosphere, streaming levels | `level-world-partition.md`, `level-landscape.md`, `level-lighting-atmosphere.md`, `level-organization.md` |
| **Plugin** | Create plugin, .uplugin descriptor, Runtime/Editor module split | `plugin-structure.md`, `plugin-module-types.md`, `plugin-marketplace.md` |
| **Cinematics** | Level Sequences, Sequencer, Movie Render Queue, camera rigs | `cine-sequencer.md`, `cine-camera-system.md`, `cine-rendering.md` |

---

## Domain Critical Rules

### GAS
1. **ALWAYS call `EndAbility()`** on every code path in `ActivateAbility()` — forgetting leaves the ability permanently "active"
2. **ASC on PlayerState** for multiplayer (attributes persist through respawn); on Character for single-player only
3. **`InitAbilityActorInfo()` on BOTH server AND client** — server in `PossessedBy()`, client in `OnRep_PlayerState()`
4. **NEVER replicate meta attributes** — `IncomingDamage` etc. are temporary; `ReplicatedUsing` on them causes race conditions
5. **`PreAttributeChange()` is for clamping ONLY** — game reactions (death, XP) go in `PostGameplayEffectExecute()`
6. **Build.cs needs all three modules**: `"GameplayAbilities"`, `"GameplayTags"`, `"GameplayTasks"`
7. **SetByCaller must be set before applying** — missing values silently return 0.0
8. **GameplayCues are cosmetic ONLY** — unreliable replication; NEVER put gameplay logic in them

### GameplayCues
1. **Tag MUST start with `GameplayCue.`** — without prefix, cues silently fail to dispatch
2. **ALWAYS implement `WhileActive` alongside `OnActive`** — late-joining clients need it to see ongoing effects
3. **ALWAYS configure `+GameplayCueNotifyPaths`** in DefaultGame.ini — never let it scan all of `/Game/` (causes 30s startup hitches)
4. **`bAutoDestroyOnRemove = true`** on Actor cues — instances accumulate and leak without it
5. **`Location`/`Normal` not auto-populated** — set explicitly; defaults to world origin (0,0,0)
6. **Guard listen server double-fire** — `OnActive` fires twice on listen server host: once local, once from multicast RPC
7. **Use Static/Burst for one-shots, Actor/Looping for persistent** — wrong type wastes actor spawn/destroy per hit

### Enhanced Input
1. **NEVER add IMC in Pawn `BeginPlay()`** — Pawn not yet possessed; add in `OnPossessed()` or `PossessedBy()`
2. **`FlushPressedKeys()` before switching to UIOnly** — prevents permanently stuck input when opening menus
3. **Project Settings**: Default Player Input Class = `EnhancedPlayerInput`, Default Input Component Class = `EnhancedInputComponent`
4. **Build.cs needs `"EnhancedInput"` and `"InputCore"`** — missing either causes linker errors
5. **NEVER use `SetInputMode()` with CommonUI** — use `GetDesiredInputConfig()` override instead
6. **Default trigger is Down (continuous)** — no triggers = fires every tick while held; add `Pressed` for one-shot
7. **`ETriggerEvent::Started` has zero value in UE 5.5+** — use `Triggered` + `Pressed` trigger for single-fire-with-value
8. **Higher priority number = higher priority** — priority 2 beats priority 0

### Animation
1. **ALWAYS set Skeleton on AnimBP** — without it, AnimBP compiles fine but produces T-pose at runtime
2. **Montage slot names must match** — slot in montage asset AND Slot node in AnimGraph must be identical
3. **Root motion requires BOTH flags** — on AnimSequence AND on CharacterMovementComponent
4. **Blend space axis ranges must match parameter ranges** — mismatch collapses all animations to one sample
5. **Use `AnimNotifyState` for duration-based logic** — single-frame `AnimNotify` can be skipped at low frame rates
6. **AnimBP variables must be thread-safe for Property Access** — `BlueprintThreadSafe` required for Fast Path
7. **IK bone chain must be continuous** — gaps in parent-child chain produce wildly incorrect solver results

### Networking
1. **`HasAuthority()` before ANY state change** — clients request changes via RPCs; server is source of truth
2. **`UPROPERTY(Replicated)` requires `GetLifetimeReplicatedProps`** — `DOREPLIFETIME(...)` or property never replicates
3. **`RepNotify` fires on client ONLY** — server must apply effects directly via `SetFoo()`; call shared logic from both
4. **NEVER send Reliable RPCs every tick** — saturates reliable buffer, causes disconnects; use Unreliable for frequent updates
5. **`bReplicates = true` in constructor** — without this, NOTHING replicates
6. **Components replicate separately** — `SetIsReplicatedByDefault(true)` in component constructor
7. **Owner chain required for Server RPCs** — actor must have owner path to PlayerController connection

### Physics
1. **Both sides must agree on Block/Overlap** — response is resolved as minimum; one-sided config = no collision
2. **`bGenerateOverlapEvents = true` on BOTH components** — missing on either side = `OnOverlap` never fires
3. **`SetSimulatePhysics(true)` only works on root component** — child components silently ignore it
4. **Collision presets override per-channel settings** — use `SetCollisionProfileName("Custom")` before `SetCollisionResponseToChannel()`
5. **Chaos destructibles need Geometry Collection** — regular static meshes cannot destruct; use Fracture Editor workflow

### AI
1. **`AIControllerClass` must be set on the Pawn** — no controller = no BT, no perception, nothing
2. **`RunBehaviorTree()` AFTER `OnPossess()`** — calling in `BeginPlay` races with possession
3. **Task nodes MUST call `FinishExecute()`** — forgetting hangs the entire behavior tree forever
4. **Blackboard keys are TYPE-CHECKED** — setting Object key with Vector silently fails with no error
5. **AI Perception needs at least one sense configured** — empty `AIPerceptionComponent` senses nothing
6. **NavMesh doesn't auto-update for runtime static geometry** — use `NavigationInvoker` for dynamic obstacles
7. **EQS filters first, then scores** — overly aggressive filter returns zero results; check filters first

### Debugging
1. **Check Output Log FIRST** — answer is almost always in `LogPython`, `LogTemp`, `LogScript`; use `ue_get_logs { minVerbosity: "Warning" }` rather than tailing `Saved/Logs/*.log` — it's already structured
2. **GC crash = missing `UPROPERTY()`** — crash at `0xDDDDDD..` address = use-after-free; add `UPROPERTY()` or `TWeakObjectPtr<>`
3. **`check()` is stripped in Shipping** — side effects inside `check()` vanish; use `ensure()` for non-fatal checks
4. **Hot reload corrupts BP state** — structural C++ changes (new UPROPERTY, changed hierarchy) require full editor restart
5. **Package crash ≠ editor crash** — `FSoftObjectPath` references that work in-editor may fail in cooked builds

### Build
1. **Prefer Live Coding when editor is running** — `ue_trigger_build` (MCP) is the fastest path; `ue-build.sh` is the shell fallback. Only escalate to `--force-ubt` when Live Coding rejects the change
2. **CDO mismatch / `Trying to recreate changed class`** — escalate to `--force-ubt` + editor restart (Live Coding cannot recover)
3. **Build failed = stale binary** — NEVER launch editor or proceed when build reports failure
4. **MCP build poll, not block** — `ue_trigger_build` returns immediately. Poll `ue_get_logs { category: "LogLiveCoding" }` until `Code successfully patched` or `Patch failed`; do not assume completion

### C++ Coding
1. **`#include "ClassName.generated.h"` last in `.h`; `#include "ClassName.h"` first in `.cpp`**
2. **API macro on every cross-module class** — `MYMODULE_API` required; missing it = linker error on other modules
3. **`#include UE_INLINE_GENERATED_CPP_BY_NAME(ClassName)`** in `.cpp` (UE5 faster compile convention)
4. **C++ for logic, Blueprint for configuration** — declare component pointers in C++, assign assets in BP
5. **`BuildSettingsVersion` must match engine** — UE 5.5 → `V5`/`Unreal5_5`; stale versions break builds

### Graphics / Rendering
1. **Nanite is NOT free** — has GPU memory budget; check `NaniteStats primary` overlay; exceeding budget causes pop-in
2. **Lumen requires thick geometry (≥20cm)** — thin walls leak light through inaccurate SDFs; use HWRT for thin geometry
3. **WPO invalidates VSM shadow cache every frame** — massive perf cost; use Nanite Skinning (UE 5.7+) for foliage wind
4. **RDG resources must be in pass parameters** — missing declaration = incorrect barriers, GPU crash
5. **PSO compilation hitches are preventable** — enable PSO Precaching in Project Settings; bundle recorded caches

### Profiling
1. **Profile in Shipping/Test config** — Development adds debug checks that inflate timings 5-10x
2. **`stat unit` first, always** — identifies Game/Draw/GPU/RHIT bottleneck before drilling deeper
3. **`ProfileGPU` for per-pass breakdown** — never guess which pass is slow; the breakdown tells you exactly

### Testing
1. **Test module must be `Type = Editor`** — Runtime modules are never discovered by Automation framework
2. **`IMPLEMENT_SIMPLE_AUTOMATION_TEST` flags control visibility** — wrong `EditorContext` flag = test never appears
3. **Latent commands don't block** — they queue; use `FDoneDelegate` or chain commands; asserting after queuing hits nothing
4. **Functional tests need a test level** — `AFunctionalTest` actors must be placed in a map; class alone never executes

### PCG
1. **NEVER mutate input data in custom nodes** — always create output copies with `NewObject<UPCGPointData>()`
2. **ALWAYS set cull distances on spawned meshes** — unbounded generation without culling destroys FPS
3. **ALWAYS Union after Attribute Partition** — partitioned points process orders of magnitude slower without reconsolidation
4. **ALWAYS Project points to landscape** after Transform Points — prevents floating/clipping meshes
5. **Build.cs must include `"PCG"`** for C++ custom nodes — missing it causes cryptic linker errors

### Level Design
1. **Level switching scripts need `--isolated` flag** — stale `UWorld` refs after level switch crash the editor
2. **World Partition requires OFPA (One File Per Actor)** — enabling WP on existing level needs migration; one-way operation
3. **Landscape resolution must match component formula** — `(ComponentSizeQuads × NumComponents + 1)²`; mismatch silently corrupts terrain
4. **Streaming level load is async** — check `IsLevelLoaded()` or poll; never assume instant availability
5. **`WorldSettings.default_game_mode`** (Python) — NOT `game_mode_override` or `GameModeOverride`

### Plugin Creation
1. **Module type must match usage** — Runtime module with Editor-only headers (`UnrealEd`) fails at package time
2. **Loading phase matters** — wrong phase = dependencies not initialized when `StartupModule()` runs
3. **Plugin name must match directory name exactly** — case mismatch on Linux causes silent discovery failure
4. **Content-only plugins still need `.uplugin`** — without it, Content directory is not mounted

### Cinematics
1. **Sequencer bindings are by label** — renaming actor after binding breaks the track; finalize names first
2. **Camera Cuts track must be TOPMOST** — rendering order is top-to-bottom; out-of-order = wrong camera at render
3. **Use Movie Render Queue, not Sequencer "Render Movie"** — MRQ is production pipeline with proper AA and tiling
4. **Audio assets must be imported first** — Sequencer cannot reference external files; import as `USoundWave` first

---

## Knowledge Files by Domain

**Architecture:** `arch-architecture-principles.md`, `arch-decision-frameworks.md`, `arch-anti-patterns.md`, `arch-module-design.md`, `arch-component.md`, `arch-subsystems.md`, `arch-gas.md`, `arch-ui-architecture.md`, `arch-networking.md`, `arch-data-driven.md`, `arch-experience-system.md`, `arch-asset-management.md`, `arch-scalability.md`, `arch-messaging.md`, `arch-performance.md`, `arch-equipment-inventory.md`, `arch-team-player.md`, `arch-camera-input.md`, `arch-content-organization.md`, `arch-testing.md`, `arch-ai.md`
**C++/Blueprint:** `code-cpp-patterns.md`, `code-ue5-patterns.md`, `code-blueprints.md`, `code-linting.md`
**GAS:** `gas-reference.md`, `gas-patterns.md`, `gas-pitfalls.md`, `gas-damage-pipeline.md`, `net-gas-networking.md`
**Cues:** `cue-reference.md`, `cue-patterns.md`, `cue-pitfalls.md`, `cue-advanced.md`
**Input:** `input-reference.md`, `input-patterns.md`, `input-pitfalls.md`, `input-crossplatform.md`
**Animation:** `anim-blueprints.md`, `anim-montages.md`, `anim-blend-spaces.md`, `anim-ik-physics.md`
**Networking:** `net-replication.md`, `net-replication-patterns.md`, `net-rpcs.md`, `net-prediction.md`, `net-relevancy.md`, `net-pitfalls.md`, `net-debugging.md`, `net-profiling.md`, `net-fundamentals.md`
**Physics:** `physics-collision.md`, `physics-collision-setup.md`, `physics-simulation.md`, `physics-traces-queries.md`, `physics-math-simulation.md`
**AI:** `ai-behavior-trees.md`, `ai-eqs.md`, `ai-perception.md`, `ai-navigation.md`, `ai-game-behavior-trees.md`, `ai-decision-making.md`, `ai-pathfinding.md`
**Graphics:** `graphics-rendering-pipeline.md`, `graphics-nanite.md`, `graphics-lumen.md`, `graphics-vsm-tsr.md`, `graphics-shader-development.md`, `graphics-rdg-passes.md`, `graphics-mesh-drawing-pipeline.md`, `graphics-post-processing.md`, `graphics-substrate.md`, `graphics-megalights.md`, `graphics-gpu-profiling.md`, `graphics-niagara-gpu.md`, `graphics-cvars-reference.md`, `graphics-issues-workarounds.md`, `graphics-lighting-theory.md`, `graphics-atmosphere-fog.md`, `graphics-screen-space-effects.md`, `graphics-shader-math.md`, `graphics-math-transforms.md`, `graphics-math-vectors-matrices.md`, `graphics-python-automation.md`, `graphics-pixel-art-3d-rendering.md`
**Debugging:** `debug-crash-patterns.md`, `debug-console-commands.md`, `debug-diagnostic-workflows.md`
**Build:** `build-plugin-reload.md`
**Profiling:** `profile-cpu.md`, `profile-gpu.md`, `profile-memory.md`
**Testing:** `test-automation-framework.md`, `test-cqtest.md`, `test-functional-tests.md`, `test-gauntlet.md`, `test-lowlevel-chaos.md`
**PCG:** `pcg-reference.md`, `pcg-patterns.md`, `pcg-custom-nodes.md`, `pcg-pitfalls.md`, `pcg-performance.md`
**Level Design:** `level-world-partition.md`, `level-landscape.md`, `level-lighting-atmosphere.md`, `level-organization.md`
**Plugin:** `plugin-structure.md`, `plugin-module-types.md`, `plugin-marketplace.md`
**Cinematics:** `cine-sequencer.md`, `cine-camera-system.md`, `cine-rendering.md`