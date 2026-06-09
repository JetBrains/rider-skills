---
name: ide-ue
description: "Rider MCP driver + full UE knowledge. Invoke for ANY Unreal Engine task: editor/PIE control, asset queries, Python scripting, player input simulation, visuals, scene/spawn, C++/Blueprint code, architecture, AI/BT/EQS, animation, GAS, networking, graphics, materials, UI, packaging, profiling, testing. DO NOT invoke for generic IDE-only tasks with no UE context (build .NET solutions, debug C# code, refactor non-UE files) — use ide skill for those."
---

# Unreal Engine — Rider MCP + Full Skill Suite


## GATE — Resolve the IDE MCP server name first

Before calling **any** tool, resolve `<ide_mcp_name>` — the actual MCP server prefix. The string `mcp__<ide_mcp_name>__` is a placeholder; the real prefix varies per install ( e.g. `rider`).

**Detection (in order):**
1. Scan the deferred tool list in `<system-reminder>` for any clearly IDE-flavored tool (e.g.`ue_health`, `ue_play`, `xdebug_*`, `execute_run_configuration`, `search_symbol`, `reformat_file`). Take the prefix between `mcp__` and the second `__`. Example: `mcp__rider__lint_files` → `<ide_mcp_name>` = `rider`.
2. Prefer the prefix that owns the broadest family of matching tools.
3. **If nothing is found**, STOP and tell the user: *"I can't find the IDE MCP server. Please make sure the IDE is running with the MCP server enabled and the client is connected, then ask me again."*
4. **Cache the resolved name for the rest of the session.** Never re-resolve on every step.

## Universal Rules


- **Always pass `rootFolder`** on every call — solution root (or current working directory). Ask once if unknown; reuse for every subsequent call.
 **`ue_health` or `ue_status` first, every session.** If `connected = false`, switch to filesystem + script mode.
- These tools are the **only** way to interact with the IDE — do not fall back to CLI runners, shell grep, print statements, or "please right-click in the IDE."
- If a tool is missing, tell the user which MCP module is needed rather than simulating the action manually.
- **MCP tools are the only way to drive the editor** — no CLI fallbacks, no log-file tailing when a MCP tool exists.
- **PIE state transitions are async** — always re-query `ue_status` after 5–10 s to confirm.
- **`ue_play` settings are sticky** — always pass `mode`, `players`, `netMode`, `runUnderOneProcess` explicitly; never rely on inherited values from a previous session.
- **Asset/tag index tools work without the editor** (`search_assets`, `search_tags`, `get_class_hierarchy`, `get_asset_properties`).
- **`get_inspections` and `apply_quick_fix` do not exist in this Rider MCP version.** For problems use `get_file_problems`/`lint_files`/`get_project_problems`. For fixes, edit the file directly using the Edit tool.
- IF MCP tools exist, use `read_file` to read file contents.
 

---
## Non-UE IDE actions

For solution build, run configurations, debugging, code search, file editing, rename/refactor — use others Rider skills and MCP. Both skills target the same Rider MCP server; reuse the resolved `<rider_mcp_name>` prefix and `rootFolder` across both.


## Universal Rules


## Quick Start

1. **Health check** — `ue_health` or `ue_status` first. If disconnected, switch to filesystem + script mode.
2. **Identify domain** — find the matching row in the routing table below.
3. **Read reference first** — load the listed file(s) before generating code or calling tools.
4. **MCP-driven task** — use `ue_*` tools; always pass `rootFolder`; re-query state after PIE transitions.
5. **Code / architecture task** — generate or review against the loaded reference; lint after edits.

## Domain Routing

Read the reference file for the domain before acting. All paths are relative to `references/`.

### Editor Automation (requires editor connected — uses MCP tools)

| Domain | When to use | Reference |
|--------|-------------|-----------|
| **Editor / PIE / Logs** | health, play/pause/stop/frame_skip, log streaming, PIE networking, editor scripting | editor/pie-tools.md, editor/docs_editor_utilities.md, editor/docs_python_scripting.md, editor/docs_remote_control.md, editor/docs_scriptable_tools.md, editor/docs_subsystems.md, editor/niagara.md, editor/recipes.md, editor/world-partition-operations.md |
| **Visuals** | screenshot editor or viewport, drive viewport camera | visuals/screenshot-viewport.md, editor/viewport-camera.md |
| **Scene** | place / spawn an actor on the design-time level | scene/spawn-actor.md |
| **Input** | PIE input simulation, Enhanced Input Actions, Mapping Contexts | input/simulate-input.md, input/simulate-user-input.md, input/eis-reference.md, input/eis-patterns.md, input/eis-pitfalls.md, input/crossplatform-input.md |
| **Editor Python** | run Python in the editor game thread | python/ue-execute-python.md |
| **Pipelines** | canonical end-to-end workflows (P1–P10) | pipelines/p1-p10.md |
| **Build / Long-ops** | Live Coding, full UBT rebuild, RunUAT cook/package | build/live-coding-ubt.md |

### Asset & Tag Index (editor not required — Rider index only)

| Domain | When to use | Reference |
|--------|-------------|-----------|
| **Assets** | find `.uasset`/`.umap` by name or base class, enumerate BP hierarchies, inspect CDO defaults, audit GameplayTags — works even when editor is disconnected | assets/asset-tools.md |

### Knowledge Domains (editor not required — reads references, generates / reviews code)

| Domain | When to use | Reference |
|--------|-------------|-----------|
| **C++ Code** | new classes, components, subsystems, code review | coder/cpp-workflow.md, coder/cpp_patterns.md, coder/ue5-cpp-patterns.md, coder/blueprints.md, coder/linting.md |
| **Blueprint** | BP assets, graph editing, widget trees | blueprint/graph-api.md, blueprint/bp-api.md, blueprint/gotchas.md, blueprint/recipes.md, blueprint/node-types.md, blueprint/pin-wiring.md |
| **Architecture** | system design, patterns, module/plugin layout | architect/architecture-principles.md, architect/module-design.md, architect/component-architecture.md, architect/gas-architecture.md, architect/networking.md, architect/data-driven-design.md, architect/messaging-events.md, architect/anti-patterns.md, architect/experience-system.md, architect/subsystems.md, architect/ai-architecture.md, architect/testing.md, architect/performance.md, architect/scalability.md, architect/asset-management.md, architect/decision-frameworks.md, architect/equipment-inventory.md, architect/team-player-systems.md, architect/camera-input.md, architect/ui-architecture.md, architect/content-organization.md, architect/game-algorithms.md, architect/game-design-vocabulary.md |
| **AI / BT / EQS** | BT tasks/decorators, EQS, NavMesh, perception | ai/behavior-trees.md, ai/eqs.md, ai/navigation.md, ai/perception.md, ai/game-ai-behavior-trees.md, ai/game-ai-pathfinding.md, ai/game-ai-decision-making.md |
| **Animation** | AnimBP, montages, blend spaces, IK, ragdoll | animation/anim-blueprints.md, animation/montages.md, animation/blend-spaces.md, animation/ik-and-physics.md |
| **Builder / UBT** | compile or clean the UE project | builder/build-commands.md, builder/plugin-reload.md |
| **Cinematics** | Sequencer, camera cuts, Movie Render Queue | cinematics/overview.md, cinematics/sequencer.md, cinematics/camera-system.md, cinematics/rendering.md |
| **Console / UE Python API** | launch/restart editor, AgentBridge, per-module console vars | console/launch-exec.md, console/_index.md, console/ai/ console/animation/ console/audio/ console/core/ console/data/ console/editor/ console/effects/ console/geometry/ console/interchange/ console/landscape/ console/mass/ console/materials/ console/media/ console/metahuman/ console/misc/ console/networking/ console/pcg/ console/physics/ console/rendering/ console/rigvm/ console/ui/ console/virtualproduction/ |
| **GAS** | attributes, gameplay effects, ability activation, ability sets | gas/gas-reference.md, gas/gas-patterns.md, gas/gas-advanced-patterns.md, gas/gas-damage-pipeline.md, gas/gas-networking.md, gas/gas-pitfalls.md |
| **GameplayCues** | VFX/SFX feedback, impact effects, cue notifies | cue/cue-reference.md, cue/cue-patterns.md, cue/cue-advanced.md, cue/cue-pitfalls.md |
| **Networking** | replication, RPCs, prediction, authority, multiplayer | networking/replication.md, networking/replication-patterns.md, networking/rpcs.md, networking/prediction.md, networking/relevancy.md, networking/gas-networking.md, networking/game-networking-fundamentals.md, networking/network-profiling.md, networking/debugging.md, networking/pitfalls.md |
| **Physics** | collision, constraints, Chaos, ragdoll, traces/sweeps | physics/collision.md, physics/collision-setup.md, physics/physics-simulation.md, physics/traces-queries.md, physics/game-math-physics-simulation.md |
| **Graphics / Rendering** | Nanite, Lumen, VSM, TSR, shaders, RDG, GPU profiling | graphics/rendering-pipeline.md, graphics/nanite.md, graphics/lumen.md, graphics/vsm-tsr.md, graphics/megalights.md, graphics/shader-development.md, graphics/shader-math.md, graphics/rdg-passes.md, graphics/mesh-drawing-pipeline.md, graphics/post-processing.md, graphics/screen-space-effects.md, graphics/lighting-theory.md, graphics/atmosphere-fog.md, graphics/niagara-gpu.md, graphics/substrate.md, graphics/gpu-profiling.md, graphics/cvars-reference.md, graphics/python-automation.md, graphics/game-math-transforms.md, graphics/game-math-vectors-matrices.md, graphics/issues-workarounds.md, graphics/pixel-art-3d-rendering.md |
| **Materials** | material graphs, instances, shaders, Substrate, UVs | material/workflow.md, material/material-recipes.md, material/effect-patterns.md, material/effect-decomposition.md, material/node-gotchas.md, material/texture-workflow.md, material/uv-techniques.md, material/procedural-texturing.md, material/substrate-automotive.md, material/npr-techniques.md, material/python-api.md |
| **Level Design** | landscapes, World Partition, streaming, lighting | level-design/world-partition.md, level-design/landscape.md, level-design/lighting-atmosphere.md, level-design/level-organization.md |
| **Data** | DataTables, DataAssets, Asset Manager, CurveTables | data/data-reference.md, data/data-driven-gameplay.md, data/data-recipes.md, data/dataasset-patterns.md, data/data-pitfalls.md |
| **PCG** | procedural content generation, foliage scatter, biomes | pcg/pcg-reference.md, pcg/pcg-patterns.md, pcg/pcg-custom-nodes.md, pcg/pcg-performance.md, pcg/pcg-pitfalls.md, pcg/baked-generated-mesh.md |
| **Debugger** | crash sessions, breakpoints, UE crash anatomy, **debug editor attach, xdebug MCP stepping/inspection, expression evaluation, variable hotpatch** | debugger/mcp-debug-tools.md, debugger/diagnostic-workflows.md, debugger/crash-patterns.md, debugger/console-commands.md |
| **Platform / Packaging** | INI configs, packaging, device deploy, mobile signing | platform/platform-guide.md, platform/config-hierarchy.md, platform/common-configs.md, platform/device-profiles.md, platform/packaging-best-practices.md, platform/buildcookrun-reference.md, platform/local-deployment.md, platform/remote-deployment.md, platform/mobile-deployment.md, platform/mobile-platform-config.md, platform/deployment-automation.md, platform/project-settings.md, platform/turnkey-and-sdks.md |
| **Plugin** | creating plugins, .uplugin, module setup | plugin/plugin-structure.md, plugin/module-types.md, plugin/marketplace.md |
| **Profiler** | frame drops, GPU bottlenecks, Unreal Insights | profiler/cpu-profiling.md, profiler/gpu-profiling.md, profiler/memory-profiling.md |
| **Testing** | automation tests, functional tests, Gauntlet, CI | testing/automation-framework.md, testing/functional-tests.md, testing/gauntlet.md, testing/cqtest.md, testing/lowlevel-chaos-tests.md |
| **UI (UMG / Blueprint)** | UMG widgets, CommonUI, HUD systems, menus, focus | ui/umg-fundamentals.md, ui/commonui.md, ui/patterns.md, ui/ui-patterns.md, ui/input-and-focus.md, ui/ui-platform.md, ui/ui-organization.md, ui/ui-reference.md, ui/ui-pitfalls.md |
| **UI C++** | widget base classes, BindWidget, MVVM ViewModels | ui-cpp/widget-cpp-patterns.md, ui-cpp/cpp-ui-patterns.md, ui-cpp/cpp-ui-pitfalls.md |
