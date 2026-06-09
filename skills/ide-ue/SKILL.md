---
name: ide-ue
description: >-
  Unreal Engine driver + knowledge suite for Rider, the UE Editor, and CLI.
  Invoke for ANY Unreal Engine task — editor/PIE control, asset & GameplayTag
  queries, editor Python, input simulation, screenshots/viewport, scene & actor
  spawning, C++/Blueprint code, architecture, AI/BT/EQS, animation, GAS,
  GameplayCues, networking, physics, graphics/rendering, materials, level
  design, data, PCG, cinematics, UI (UMG/C++), build/UBT, packaging, plugins,
  profiling, testing, and console variables. DO NOT invoke for generic IDE-only
  work with no UE context (build a .NET solution, debug C#, refactor non-UE
  files)
---

# Unreal Engine — Rider MCP Driver + Full Skill Suite

This skill is the single entry point for all Unreal Engine work. It operates in **three modes**, often combined within one task:

1. **Live editor automation** — drive a running UE Editor through the IDE's MCP `ue_*` tools (PIE, logs, Python, screenshots, spawning, input).
2. **Offline index queries** — search assets, GameplayTags, and class hierarchies through Rider's index. **Works even when the editor is closed.**
3. **Knowledge references** — generate and review UE C++, Blueprints, and system designs against the curated docs under `references/`.

> **Always read the matching reference file(s) (see [Domain Routing](#domain-routing)) before generating code or calling tools.** The references hold the version-specific APIs, patterns, and pitfalls this skill depends on.

---

## GATE — Resolve the IDE MCP prefix first

Before calling **any** tool, resolve `<ide_mcp>` — the real MCP server prefix for this install. In this document `mcp__<ide_mcp>__` is a placeholder; the actual prefix varies (commonly `rider`).

**Detection (in order):**
1. Scan the deferred tool list in `<system-reminder>` for any clearly IDE-flavored tool (e.g. `ue_status`, `ue_play`, `xdebug_*`, `execute_run_configuration`, `search_symbol`, `reformat_file`). Take the prefix between `mcp__` and the second `__` — e.g. `mcp__rider__lint_files` → `<ide_mcp>` = `rider`.
2. Prefer the prefix owning the broadest family of matching tools.
3. **If nothing matches**, STOP and tell the user: *"I can't find the IDE MCP server. Make sure the IDE is running with the MCP server enabled and the client connected, then ask me again."*
4. **Cache the resolved prefix for the whole session.** Never re-resolve per step.

The same MCP server backs both UE automation and plain IDE actions — reuse the resolved `<ide_mcp>` prefix and `rootFolder` across this skill and the `ide` skill.

---

## Tool Surface

These are the only ways to interact with the editor and index — **never** fall back to CLI runners, shell `grep`, log-file tailing, print statements, or "please click in the editor" when a tool exists.

**Live-editor `ue_*` tools** (require the editor connected):

| Tool | Purpose |
|------|---------|
| `ue_health` / `ue_status` | Connection + PIE state. **Call one first, every session.** |
| `ue_play` | Start/stop/pause/frame-skip PIE; sets mode, players, netMode. |
| `ue_get_logs` | Stream / fetch editor + PIE logs. |
| `ue_execute_python` | Run Python on the editor game thread (the workhorse for everything without a dedicated tool). |
| `ue_screenshot` | Capture editor or viewport. |
| `ue_transform` | Move/rotate/scale an actor. |
| `ue_overrides` | Inspect/apply sticky PIE override settings. |

**Index tools** (Rider index — **work with the editor closed**): `search_assets`, `search_tags`, `get_class_hierarchy`, `get_asset_properties`.

**Code/problem tools:** `read_file`, `search_symbol`, `lint_files`, `get_file_problems`, `get_project_problems`, `reformat_file`, and the `xdebug_*` family (see the Debugger domain).

> `get_inspections` and `apply_quick_fix` **do not exist** in this Rider MCP. For problems use `get_file_problems` / `lint_files` / `get_project_problems`; to fix, edit the file directly with the `Edit` tool. If any needed tool is missing, tell the user which MCP module to enable — don't simulate it manually.

---

## Universal Rules

- **Pass `rootFolder` on every call** — the solution root (or cwd). Ask once if unknown, then reuse it everywhere.
- **`ue_health` / `ue_status` first, every session.** If `connected = false`, drop to offline mode: index tools + filesystem + Python scripting only.
- **PIE transitions are async** — re-query `ue_status` after ~5–10 s to confirm a state change took effect.
- **`ue_play` settings are sticky** — always pass `mode`, `players`, `netMode`, and `runUnderOneProcess` explicitly; never inherit from a prior session.
- **Index tools don't need the editor** — asset/tag/hierarchy/CDO queries work offline.

---

## Quick Start

1. **Health check** — `ue_health` or `ue_status`. If disconnected, switch to offline mode.
2. **Identify the domain** — find the matching row in [Domain Routing](#domain-routing).
3. **Read the reference first** — load the listed file(s) before generating code or calling tools.
4. **Automation task** — use `ue_*` tools; always pass `rootFolder`; re-query state after PIE transitions.
5. **Code / architecture task** — generate or review against the loaded reference, then `lint_files` after edits.

---

## Domain Routing

All paths are relative to `references/`. **Read the listed file(s) before acting.**

### Editor automation — *editor must be connected*

| Domain | When to use | Reference |
|--------|-------------|-----------|
| **Editor / PIE / Logs** | health, play/pause/stop/frame-skip, log streaming, PIE networking, editor scripting | `editor/pie-tools.md`, `editor/docs_editor_utilities.md`, `editor/docs_python_scripting.md`, `editor/docs_remote_control.md`, `editor/docs_scriptable_tools.md`, `editor/docs_subsystems.md`, `editor/niagara.md`, `editor/recipes.md`, `editor/world-partition-operations.md` |
| **Visuals** | screenshot editor/viewport, drive viewport camera | `visuals/screenshot-viewport.md`, `editor/viewport-camera.md` |
| **Scene** | place / spawn an actor on the design-time level | `scene/spawn-actor.md` |
| **Input** | PIE input simulation, Enhanced Input Actions, Mapping Contexts | `input/simulate-input.md`, `input/simulate-user-input.md`, `input/eis-reference.md`, `input/eis-patterns.md`, `input/eis-pitfalls.md`, `input/crossplatform-input.md` |
| **Editor Python** | run Python on the editor game thread | `python/ue-execute-python.md` |
| **Pipelines** | canonical end-to-end workflows (P1–P10) | `pipelines/p1-p10.md` |
| **Build / Long-ops** | Live Coding, full UBT rebuild, RunUAT cook/package | `build/live-coding-ubt.md` |

### Asset & tag index — *editor not required (Rider index only)*

| Domain | When to use | Reference |
|--------|-------------|-----------|
| **Assets** | find `.uasset`/`.umap` by name or base class, enumerate BP hierarchies, inspect CDO defaults, audit GameplayTags | `assets/asset-tools.md` |

### Knowledge domains — *editor not required (reads references, generates / reviews code)*

| Domain | When to use | Reference |
|--------|-------------|-----------|
| **C++ Code** | new classes, components, subsystems, code review | `coder/cpp-workflow.md`, `coder/cpp_patterns.md`, `coder/ue5-cpp-patterns.md`, `coder/blueprints.md`, `coder/linting.md` |
| **Blueprint** | BP assets, graph editing, widget trees | `blueprint/graph-api.md`, `blueprint/bp-api.md`, `blueprint/gotchas.md`, `blueprint/recipes.md`, `blueprint/node-types.md`, `blueprint/pin-wiring.md` |
| **Architecture** | system design, patterns, module/plugin layout | `architect/architecture-principles.md`, `architect/module-design.md`, `architect/component-architecture.md`, `architect/gas-architecture.md`, `architect/networking.md`, `architect/data-driven-design.md`, `architect/messaging-events.md`, `architect/anti-patterns.md`, `architect/experience-system.md`, `architect/subsystems.md`, `architect/ai-architecture.md`, `architect/testing.md`, `architect/performance.md`, `architect/scalability.md`, `architect/asset-management.md`, `architect/decision-frameworks.md`, `architect/equipment-inventory.md`, `architect/team-player-systems.md`, `architect/camera-input.md`, `architect/ui-architecture.md`, `architect/content-organization.md`, `architect/game-algorithms.md`, `architect/game-design-vocabulary.md` |
| **AI / BT / State Tree / EQS** | BT tasks/decorators, State Tree states/tasks/transitions, EQS, NavMesh, perception | `ai/behavior-trees.md`, `ai/state-tree.md`, `ai/eqs.md`, `ai/navigation.md`, `ai/perception.md`, `ai/game-ai-behavior-trees.md`, `ai/game-ai-pathfinding.md`, `ai/game-ai-decision-making.md` |
| **Animation** | AnimBP, montages, blend spaces, IK, ragdoll | `animation/anim-blueprints.md`, `animation/montages.md`, `animation/blend-spaces.md`, `animation/ik-and-physics.md` |
| **Builder / UBT** | compile or clean the UE project | `builder/build-commands.md`, `builder/plugin-reload.md` |
| **Cinematics** | Sequencer, camera cuts, Movie Render Queue | `cinematics/overview.md`, `cinematics/sequencer.md`, `cinematics/camera-system.md`, `cinematics/rendering.md` |
| **Console / UE Python API** | launch/restart editor, AgentBridge, per-module console vars | `console/launch-exec.md`, `console/_index.md`, and per-module subfolders under `console/` (`ai/`, `animation/`, `audio/`, `core/`, `data/`, `editor/`, `effects/`, `geometry/`, `interchange/`, `landscape/`, `mass/`, `materials/`, `media/`, `metahuman/`, `misc/`, `networking/`, `pcg/`, `physics/`, `rendering/`, `rigvm/`, `ui/`, `virtualproduction/`) |
| **GAS** | attributes, gameplay effects, ability activation, ability sets | `gas/gas-reference.md`, `gas/gas-patterns.md`, `gas/gas-advanced-patterns.md`, `gas/gas-damage-pipeline.md`, `gas/gas-networking.md`, `gas/gas-pitfalls.md` |
| **GameplayCues** | VFX/SFX feedback, impact effects, cue notifies | `cue/cue-reference.md`, `cue/cue-patterns.md`, `cue/cue-advanced.md`, `cue/cue-pitfalls.md` |
| **Networking** | replication, RPCs, prediction, authority, multiplayer | `networking/replication.md`, `networking/replication-patterns.md`, `networking/rpcs.md`, `networking/prediction.md`, `networking/relevancy.md`, `networking/gas-networking.md`, `networking/game-networking-fundamentals.md`, `networking/network-profiling.md`, `networking/debugging.md`, `networking/pitfalls.md` |
| **Physics** | collision, constraints, Chaos, ragdoll, traces/sweeps | `physics/collision.md`, `physics/collision-setup.md`, `physics/physics-simulation.md`, `physics/traces-queries.md`, `physics/game-math-physics-simulation.md` |
| **Graphics / Rendering** | Nanite, Lumen, VSM, TSR, shaders, RDG, GPU profiling | `graphics/rendering-pipeline.md`, `graphics/nanite.md`, `graphics/lumen.md`, `graphics/vsm-tsr.md`, `graphics/megalights.md`, `graphics/shader-development.md`, `graphics/shader-math.md`, `graphics/rdg-passes.md`, `graphics/mesh-drawing-pipeline.md`, `graphics/post-processing.md`, `graphics/screen-space-effects.md`, `graphics/lighting-theory.md`, `graphics/atmosphere-fog.md`, `graphics/niagara-gpu.md`, `graphics/substrate.md`, `graphics/gpu-profiling.md`, `graphics/cvars-reference.md`, `graphics/python-automation.md`, `graphics/game-math-transforms.md`, `graphics/game-math-vectors-matrices.md`, `graphics/issues-workarounds.md`, `graphics/pixel-art-3d-rendering.md` |
| **Materials** | material graphs, instances, shaders, Substrate, UVs | `material/workflow.md`, `material/material-recipes.md`, `material/effect-patterns.md`, `material/effect-decomposition.md`, `material/node-gotchas.md`, `material/texture-workflow.md`, `material/uv-techniques.md`, `material/procedural-texturing.md`, `material/substrate-automotive.md`, `material/npr-techniques.md`, `material/python-api.md` |
| **Level Design** | landscapes, World Partition, streaming, lighting | `level-design/world-partition.md`, `level-design/landscape.md`, `level-design/lighting-atmosphere.md`, `level-design/level-organization.md` |
| **Data** | DataTables, DataAssets, Asset Manager, CurveTables | `data/data-reference.md`, `data/data-driven-gameplay.md`, `data/data-recipes.md`, `data/dataasset-patterns.md`, `data/data-pitfalls.md` |
| **PCG** | procedural content generation, foliage scatter, biomes | `pcg/pcg-reference.md`, `pcg/pcg-patterns.md`, `pcg/pcg-custom-nodes.md`, `pcg/pcg-performance.md`, `pcg/pcg-pitfalls.md`, `pcg/baked-generated-mesh.md` |
| **Debugger** | crash sessions, breakpoints, UE crash anatomy, debug-editor attach, `xdebug` stepping/inspection, expression evaluation, variable hotpatch | `debugger/mcp-debug-tools.md`, `debugger/rider-debugger-tools.md`, `debugger/diagnostic-workflows.md`, `debugger/crash-patterns.md`, `debugger/console-commands.md` |
| **Platform / Packaging** | INI configs, packaging, device deploy, mobile signing | `platform/platform-guide.md`, `platform/config-hierarchy.md`, `platform/common-configs.md`, `platform/device-profiles.md`, `platform/packaging-best-practices.md`, `platform/buildcookrun-reference.md`, `platform/local-deployment.md`, `platform/remote-deployment.md`, `platform/mobile-deployment.md`, `platform/mobile-platform-config.md`, `platform/deployment-automation.md`, `platform/project-settings.md`, `platform/turnkey-and-sdks.md` |
| **Plugin** | creating plugins, `.uplugin`, module setup | `plugin/plugin-structure.md`, `plugin/module-types.md`, `plugin/marketplace.md` |
| **Profiler** | frame drops, GPU bottlenecks, Unreal Insights | `profiler/cpu-profiling.md`, `profiler/gpu-profiling.md`, `profiler/memory-profiling.md` |
| **Testing** | automation tests, functional tests, Gauntlet, CI | `testing/automation-framework.md`, `testing/functional-tests.md`, `testing/gauntlet.md`, `testing/cqtest.md`, `testing/lowlevel-chaos-tests.md` |
| **UI (UMG / Blueprint)** | UMG widgets, CommonUI, HUD systems, menus, focus | `ui/umg-fundamentals.md`, `ui/commonui.md`, `ui/patterns.md`, `ui/ui-patterns.md`, `ui/input-and-focus.md`, `ui/ui-platform.md`, `ui/ui-organization.md`, `ui/ui-reference.md`, `ui/ui-pitfalls.md` |
| **UI C++** | widget base classes, BindWidget, MVVM ViewModels | `ui-cpp/widget-cpp-patterns.md`, `ui-cpp/cpp-ui-patterns.md`, `ui-cpp/cpp-ui-pitfalls.md` |
