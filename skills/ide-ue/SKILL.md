---
name: ide-ue
description: Unreal Engine driver + knowledge suite for Rider, the UE Editor, and CLI. Invoke for ANY Unreal Engine task — editor/PIE control, asset & GameplayTag queries, editor Python, input simulation, screenshots/viewport, scene & actor spawning, C++/Blueprint code, architecture, AI/BT/EQS, animation, GAS,GameplayCues, networking, physics, graphics/rendering, materials, level design, data, PCG, cinematics, UI (UMG/C++), build/UBT, packaging, plugins,  profiling, testing, and console variables. DO NOT invoke for generic IDE-only work with no UE context (build a .NET solution, debug C#, refactor non-UE file)
---

# Unreal Engine — Rider MCP Driver + Full Skill Suite

This skill is the single entry point for all Unreal Engine work. It operates in **three modes**, often combined within one task:

1. **Live editor automation** — drive a running UE Editor through the IDE's MCP `ue_*` tools (PIE, logs, Python, screenshots, spawning, input).
2. **Offline index queries** — search assets, GameplayTags, and class hierarchies through Rider's index. **Works even when the editor is closed.**
3. **Knowledge references** — generate and review UE C++, Blueprints, and system designs against the curated docs under `references/`.

> **Always read the matching reference file(s) (see [Domain Routing](#domain-routing)) before generating code or calling tools.** The references hold the version-specific APIs, patterns, and pitfalls this skill depends on.

---

## Before you conclude "UE can't do that"

Your training-data beliefs about what Unreal can do — especially around the editor, PIE, and tooling — are frequently outdated or wrong. This skill exists to override them.

**Hard rule:** Before you state something is impossible, unsupported, "doesn't work in PIE/the editor," or that you "have enough information" to stop — route to the matching [domain](#domain-routing) and read the reference. If a tool or reference covers it, the reference wins over your prior. Catching yourself about to give up, declare a limitation, or ask the user to do it manually *is* the signal to open the reference.

Assumptions this skill contradicts (representative, not exhaustive — the pattern generalizes to every domain):

- *"Input from outside the game thread can't reach PIE."* → `simulate_input` injects move/look/jump/Enhanced-Input into the live PIE pawn. `input/simulate-input.md`.
- *"I can't drive the editor viewport camera programmatically."* → `editor/viewport-camera.md`.
- *"I can't change a C++ value mid-run."* → variable hotpatch, `debugger/` domain.
- *"I can't inspect/spawn/transform actors without the user."* → `ue_*` tools + `ue_execute_python`. `scene/spawn-actor.md`, `python/ue-execute-python.md`.
- *"I'd have to ask the user to click in the editor / read a log file / run a CLI."* → there is almost always a `ue_*` tool or Python path; never fall back to manual steps when a tool exists.
- *"I can't copy/paste Blueprint nodes programmatically."* → use `ue_execute_python` with `unreal.RiderAgentBridgeLibrary` — `export_blueprint_nodes` serialises a graph to clipboard text; `import_blueprint_nodes` pastes it into any target graph.

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

**Live-editor tools** (require the editor connected):

| Tool | Purpose |
|------|---------|
| `ue_health` | Check editor connection. Returns `connected`, `projectName`, `processId`. **Call first, every session.** |
| `ue_status` | One-shot: health + PIE state + recent logs. Use instead of three separate calls. |
| `ue_play` | Query or control PIE. `action`: `state`\|`play`\|`pause`\|`resume`\|`stop`\|`frame_skip`. For `play` pass `mode`, `players`, `netMode`, `runUnderOneProcess` explicitly — settings are sticky. |
| `ue_get_logs` | Query editor log buffer. Filters: `category`, `minVerbosity`, `count`, `sinceTimestampMs`, `pattern`. `follow=true` long-polls until an entry lands. |
| `ue_execute_python` | Run Python on the editor game thread. `script` (single) or `scripts` (sequential batch with `startFrom` resume). Returns `results[].{success, output, result, error}`. **Always check `LogPython` logs after — Python errors print silently, they do not raise.** |
| `spawn_actor` | Place a StaticMesh or Blueprint actor on the level. Required: `assetPath` (long object path, e.g. `/Game/BP_Hero.BP_Hero`), `location` `[x,y,z]`. Optional: `rotation` `[pitch,yaw,roll]`, `scale` `[x,y,z]`, `label`. Returns `spawned`, `actorLabel`, `actorName`, `location`. |
| `simulate_input` | Drive PIE player input. `mode`: `actions` (sequence of move/jump/look/wait objects), `primitive` (`add_movement_input`\|`add_yaw_input`\|`add_pitch_input`\|`jump`), `enhanced` (inject Enhanced Input Action by asset path + valueKind). Requires PIE running with a possessed pawn. |
| `take_screenshot` | Capture a PNG. `kind`: `editor_window`\|`viewport`\|`asset_preview`. For `asset_preview` pass `assetPath`. Optional `width`/`height` (0 = native). Returns disk `path` — image bytes are NOT returned over MCP; read the file. |
| `viewport_camera` | Drive the active level-editor camera. `action`: `get`\|`set`\|`move`\|`look_at`\|`focus_on_actor`. Vectors are `[x,y,z]`, rotators `[pitch,yaw,roll]` in degrees. `focus_on_actor` takes actor Outliner label + optional `minDistance`. |

**Index tools** (Rider index — **work with the editor closed**): `search_assets`, `search_tags`, `get_class_hierarchy`, `get_asset_properties`, `find_default_value_overrides`.

| Index tool | Key params | Notes |
|------------|-----------|-------|
| `search_assets` | `query`, `baseClass`, `packagePath`, `source` (cache\|editor\|auto), `limit` | Find `.uasset`/`.umap` by name or C++ base class |
| `search_tags` | `prefix`, `limit` | GameplayTag definitions |
| `get_class_hierarchy` | `baseClass`, `limit` | All BP descendants of a C++ class |
| `get_asset_properties` | `assetPath` (absolute disk path) | Read CDO UPROPERTY values without opening the editor |
| `find_default_value_overrides` | `className` (bare C++ name, no U/A prefix), `fieldName`, `limit` | Every BP asset that overrides a specific UPROPERTY |

**Build tools:**

| Build tool | Purpose |
|------------|---------|
| `build_solution_start` | Start build (Live Coding hot-reload when editor connected, else UBT). Returns `sessionId`. Optional: `rebuild` (full rebuild), `filesToRebuild` (list of relative paths). |
| `build_solution_state` | Poll build progress by `sessionId`. Returns `state` (Running\|Completed\|Cancelled\|NotFound), `buildIsSuccess`, `problems[]` with file/line. |

**Code/problem tools:** `read_file`, `apply_patch`, `create_new_file`, `search_file`, `search_regex`, `search_symbol`, `search_text`, `get_symbol_info`, `analyze_calls`, `get_file_problems`, `get_project_problems`, `lint_files`, `reformat_file`, `rename_refactoring`, `open_file_in_editor`, `list_directory_tree`, `execute_terminal_command`, and the `xdebug_*` family (see the Debugger domain).

**Debugger tools** (`xdebug_*` — for C++ UE sessions):

| Debugger tool | Purpose |
|--------------|---------|
| `xdebug_attach_to_process` | Attach Rider debugger to a running process by `pid`. `debuggerKind` filter: `"Native"` for UE C++. |
| `xdebug_start_mixed_mode_debug` | Attach in mixed managed+native mode by `pid`. |
| `xdebug_start_debugger_session` | Start a new debug session from a run configuration. |
| `xdebug_control_session` | Step over/into/out, continue, pause, stop. |
| `xdebug_get_debugger_status` | Check session state. |
| `xdebug_get_stack` | Current call stack. |
| `xdebug_get_frame_values` | Variables in a specific frame. |
| `xdebug_get_threads` | Thread list. |
| `xdebug_evaluate_expression` | Eval an expression in the current frame. |
| `xdebug_get_value_by_path` | Navigate nested variable by path. |
| `xdebug_list_breakpoints` | List all breakpoints. |
| `xdebug_set_breakpoint` | Set a breakpoint. |
| `xdebug_remove_breakpoint` | Remove a breakpoint. |
| `xdebug_run_to_line` | Run to a specific file+line. |
| `xdebug_set_variable` | Hotpatch a variable value mid-session. |
| `xdebug_memory_dump` | Load a `.dmp`/`.core` for post-mortem debugging. |

> `get_inspections` and `apply_quick_fix` **do not exist** in this Rider MCP. For problems use `get_file_problems` / `lint_files` / `get_project_problems`; to fix, edit the file directly with the `Edit` tool. If any needed tool is missing, tell the user which MCP module to enable — don't simulate it manually.

---

## Universal Rules

- **Pass `rootFolder` on every call** — the solution root (or cwd). Ask once if unknown, then reuse it everywhere.
- **`ue_health` / `ue_status` first, every session.** If `connected = false`, do NOT stop — follow the **Editor Launch** mandatory scenario below.
- **PIE transitions are async** — re-query `ue_status` after ~5–10 s to confirm a state change took effect.
- **`ue_play` settings are sticky** — always pass `mode`, `players`, `netMode`, and `runUnderOneProcess` explicitly; never inherit from a prior session.
- **Index tools don't need the editor** — asset/tag/hierarchy/CDO queries work offline.

---

## Mandatory Scenarios

These three scenarios are **always executed in sequence** when editor automation is needed. Never ask the user to open the editor manually.

### Path variables (resolve once, reuse everywhere)

Before running any scenario, resolve these four variables from the current session context:

| Variable | How to resolve |
|----------|---------------|
| `<PROJECT_ROOT>` | The `rootFolder` already known from the session (working directory of the project). |
| `<PROJECT_NAME>` | Glob `<PROJECT_ROOT>/*.uproject` → filename without `.uproject` extension. |
| `<PROJECT_UPROJECT>` | `<PROJECT_ROOT>/<PROJECT_NAME>.uproject` |
| `<UE_VERSION>` | `(Get-Content '<PROJECT_UPROJECT>' \| ConvertFrom-Json).EngineAssociation` → e.g. `"5.4"` |
| `<UE_ROOT>` | Search common install bases for `UE_<UE_VERSION>`: `C:/Program Files/Epic Games/UE_<UE_VERSION>`, sibling of `<PROJECT_ROOT>` parent, or any drive root. Glob `*/UE_<UE_VERSION>` if unsure. |
| `<UE_EDITOR_EXE>` | `<UE_ROOT>/Engine/Binaries/Win64/UnrealEditor.exe` (Windows) or `<UE_ROOT>/Engine/Binaries/Mac/UnrealEditor` (Mac) |
| `<PROJECT_LOG>` | `<PROJECT_ROOT>/Saved/Logs/<PROJECT_NAME>.log` |

---

### SCENARIO 1 — Launch Editor (when `connected: false`)

**Trigger:** `ue_health` returns `{"connected": false}`.

**Never stop here.** Always attempt to launch the editor automatically.

**Step 1 — Check if already running:**
```bash
powershell.exe -Command "Get-Process UnrealEditor -ErrorAction SilentlyContinue | Select-Object Id, CPU, WorkingSet"
# macOS/Linux: pgrep -a UnrealEditor
```
If a process is listed → editor is running but MCP not yet connected (still loading). Skip to Scenario 2.

**Step 2 — Resolve `<UE_VERSION>` and `<UE_EDITOR_EXE>`:**
```bash
# Windows — read EngineAssociation from .uproject
powershell.exe -Command "(Get-Content '<PROJECT_UPROJECT>' | ConvertFrom-Json).EngineAssociation"

# Then find the engine binary (try common locations):
#   C:/Program Files/Epic Games/UE_<UE_VERSION>/Engine/Binaries/Win64/UnrealEditor.exe
#   <any_drive>/EpicGames/UE_<UE_VERSION>/Engine/Binaries/Win64/UnrealEditor.exe
# Glob fallback:
powershell.exe -Command "Get-ChildItem -Path 'C:/','D:/','E:/' -Filter 'UnrealEditor.exe' -Recurse -ErrorAction SilentlyContinue | Where-Object { \$_.FullName -like '*UE_<UE_VERSION>*' } | Select-Object -First 1 -ExpandProperty FullName"
```

**Step 3 — Launch:**
```bash
# Windows
powershell.exe -Command "Start-Process '<UE_EDITOR_EXE>' -ArgumentList '<PROJECT_UPROJECT>' -WindowStyle Normal"

# macOS/Linux
open -a '<UE_EDITOR_EXE>' --args '<PROJECT_UPROJECT>'
# or: '<UE_EDITOR_EXE>' '<PROJECT_UPROJECT>' &
```
Empty output = success. Proceed immediately to Scenario 2.

**Step 4 — Immediately proceed to Scenario 2 (connection polling).**

> **Prerequisite:** Rider IDE must be open with this project loaded and the RiderLink plugin enabled (`Edit → Plugins → RiderLink`). The MCP connection routes through Rider — the editor process alone is not enough.

---

### SCENARIO 2 — Poll for MCP Connection

**Trigger:** After launching the editor, or after any `ue_health` → `connected: false`.

**Rule:** Never declare "editor not connected" and stop. Always poll with Monitor + direct MCP checks.

**Step 1 — Arm a Monitor (polls every 15 s, 3-minute window):**
```bash
for i in $(seq 1 12); do
  sleep 15
  result=$(powershell.exe -Command "& {
    Add-Type -AssemblyName System.Net.Http
    \$c = New-Object System.Net.Http.HttpClient
    try {
      \$r = \$c.GetAsync('http://localhost:8080/agent/health').Result
      if (\$r.IsSuccessStatusCode) { echo 'CONNECTED' } else { echo \"HTTP_\$(\$r.StatusCode)\" }
    } catch { echo 'NOT_READY' }
  }" 2>/dev/null)
  echo "Attempt $i: $result"
  if echo "$result" | grep -q "CONNECTED"; then break; fi
done
```

**Step 2 — On each Monitor notification, also call the MCP tool directly:**
```
ue_health  (rootFolder: <PROJECT_ROOT>)
```
The MCP tool is authoritative — use its `connected` field to confirm before proceeding.

**Step 3 — When `connected: true`, proceed to Scenario 3, then run the original task.**

**Timeout handling:** If 12 attempts (~3 min) elapse without connection:
1. Confirm Rider is open and the project solution is loaded.
2. Confirm RiderLink plugin is enabled in the editor (`Edit → Plugins → RiderLink`).
3. Check for crash: if `Get-Process UnrealEditor` returns nothing, the editor crashed — check `<PROJECT_LOG>` for the cause.
4. Re-run Scenario 1 (relaunch) if the process is gone.

---

### SCENARIO 3 — Monitor Editor Logs

**Trigger:** Immediately after connecting. Also after any suspected error or silent failure.

**Step 1 — Fetch recent logs via MCP (preferred, always available when connected):**
```
ue_get_logs  (rootFolder: <PROJECT_ROOT>, severity: warning, lines: 50)
```
Look for errors in: `LogPython`, `LogBlueprint`, `LogUObjectGlobals`, `LogInit`.

**Step 2 — For persistent streaming (long operations, PIE sessions), arm a Monitor:**
```bash
tail -f "<PROJECT_LOG>" \
  | grep -E --line-buffered "Error|Warning|LogPython|LogBlueprint|PIE|Crash|Fatal"
```

**Step 3 — After every `ue_execute_python` call, fetch Python logs:**
```
ue_get_logs  (rootFolder: <PROJECT_ROOT>, filter: "LogPython", lines: 20)
```
Python errors in UE **do not raise exceptions** — they print to log and execution continues silently. Always check logs after Python calls.

**Key log categories:**
| Category | Significance |
|----------|-------------|
| `LogPython` | All Python script output and errors |
| `LogBlueprint` | Blueprint compile errors/warnings |
| `LogUObjectGlobals` | Asset load failures, CDO errors |
| `PIE` | Play-in-Editor start/stop/errors |
| `LogInit` | Startup errors, plugin load failures |
| `LogRiderLink` | MCP connection status |

---

## Quick Start

1. **Health check** — `ue_health`. If `connected: false` → **Scenario 1** (launch) → **Scenario 2** (poll) → **Scenario 3** (logs).
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
| **Editor / PIE / Logs** | health, play/pause/stop/frame-skip, log streaming, PIE networking, editor scripting. **Symptoms:** PIE won't start/stop, "nothing happens on Play", need editor/PIE logs (never tail a log file), any editor action with no dedicated tool | `editor/pie-tools.md`, `editor/docs_editor_utilities.md`, `editor/docs_python_scripting.md`, `editor/docs_remote_control.md`, `editor/docs_scriptable_tools.md`, `editor/docs_subsystems.md`, `editor/niagara.md`, `editor/recipes.md`, `editor/world-partition-operations.md` |
| **Visuals** | screenshot editor/viewport, drive viewport camera. **Symptoms:** "I can't see what's on screen", need a screenshot to verify, camera won't move/frame an actor | `visuals/screenshot-viewport.md`, `editor/viewport-camera.md` |
| **Scene** | place / spawn an actor on the design-time level. **Symptoms:** need an actor in the level, add/move/delete objects without asking the user | `scene/spawn-actor.md` |
| **Input** | PIE input simulation, Enhanced Input Actions, Mapping Contexts. **Symptoms:** character/pawn won't move in PIE, "input doesn't reach the pawn", input "doesn't propagate to PIE", need to press keys / move axes / jump to test gameplay | `input/simulate-input.md`, `input/simulate-user-input.md`, `input/eis-reference.md`, `input/eis-patterns.md`, `input/eis-pitfalls.md`, `input/crossplatform-input.md` |
| **Editor Python** | run Python on the editor game thread. **Symptoms:** no dedicated `ue_*` tool exists for the editor action you need — script it instead of asking the user | `python/ue-execute-python.md` |
| **Pipelines** | canonical end-to-end workflows (P1–P10). **Symptoms:** a multi-step task ("spawn → play → simulate input → screenshot → verify") that should follow a proven recipe | `pipelines/p1-p10.md` |
| **Build / Long-ops** | Live Coding, full UBT rebuild, RunUAT cook/package. **Symptoms:** C++ changes "aren't taking effect", need to recompile/hot-reload, cook or package the project | `build/live-coding-ubt.md` |

### Asset & tag index — *editor not required (Rider index only)*

| Domain | When to use | Reference |
|--------|-------------|-----------|
| **Assets** | find `.uasset`/`.umap` by name or base class, enumerate BP hierarchies, inspect CDO defaults, audit GameplayTags. **Symptoms:** "where is asset X", "what derives from class Y", need a property/default without opening the editor (never shell `grep` for assets) | `assets/asset-tools.md` |

### Knowledge domains — *editor not required (reads references, generates / reviews code)*

| Domain | When to use | Reference |
|--------|-------------|-----------|
| **C++ Code** | new classes, components, subsystems, code review. **Symptoms:** writing/reviewing UE C++, UPROPERTY/UFUNCTION macros, reflection, GC, lint after edits | `coder/cpp-workflow.md`, `coder/cpp_patterns.md`, `coder/ue5-cpp-patterns.md`, `coder/blueprints.md`, `coder/linting.md` |
| **Blueprint** | BP assets, graph editing, widget trees. **Symptoms:** create/edit a BP graph, wire pins/nodes, copy/paste nodes between graphs (→ `ue_export_blueprint_nodes` / `ue_import_blueprint_nodes`), "I can only do this in the editor by hand" (you can script it) | `blueprint/graph-api.md`, `blueprint/bp-api.md`, `blueprint/gotchas.md`, `blueprint/recipes.md`, `blueprint/node-types.md`, `blueprint/pin-wiring.md` |
| **Architecture** | system design, patterns, module/plugin layout. **Symptoms:** "how should I structure this", picking a system/pattern, module/plugin boundaries, design review | `architect/architecture-principles.md`, `architect/module-design.md`, `architect/component-architecture.md`, `architect/gas-architecture.md`, `architect/networking.md`, `architect/data-driven-design.md`, `architect/messaging-events.md`, `architect/anti-patterns.md`, `architect/experience-system.md`, `architect/subsystems.md`, `architect/ai-architecture.md`, `architect/testing.md`, `architect/performance.md`, `architect/scalability.md`, `architect/asset-management.md`, `architect/decision-frameworks.md`, `architect/equipment-inventory.md`, `architect/team-player-systems.md`, `architect/camera-input.md`, `architect/ui-architecture.md`, `architect/content-organization.md`, `architect/game-algorithms.md`, `architect/game-design-vocabulary.md` |
| **AI / BT / State Tree / EQS** | BT tasks/decorators, State Tree states/tasks/transitions, EQS, NavMesh, perception. **Symptoms:** NPC "won't move/sense the player", AI not running its logic, pathfinding/nav gaps, choosing BT vs State Tree | `ai/behavior-trees.md`, `ai/state-tree.md`, `ai/eqs.md`, `ai/navigation.md`, `ai/perception.md`, `ai/game-ai-behavior-trees.md`, `ai/game-ai-pathfinding.md`, `ai/game-ai-decision-making.md` |
| **Animation** | AnimBP, montages, blend spaces, IK, ragdoll. **Symptoms:** character won't animate, montage/blend not playing, ShouldMove/state-machine logic, IK/physics-blend issues | `animation/anim-blueprints.md`, `animation/montages.md`, `animation/blend-spaces.md`, `animation/ik-and-physics.md` |
| **Builder / UBT** | compile or clean the UE project. **Symptoms:** build/compile failures, stale binaries, clean rebuild, plugin reload | `builder/build-commands.md`, `builder/plugin-reload.md` |
| **Cinematics** | Sequencer, camera cuts, Movie Render Queue. **Symptoms:** building a sequence/cutscene, camera cuts, rendering out video frames | `cinematics/overview.md`, `cinematics/sequencer.md`, `cinematics/camera-system.md`, `cinematics/rendering.md` |
| **Console / UE Python API** | launch/restart editor, AgentBridge, per-module console vars. **Symptoms:** need a console command/cvar, editor not running and must be launched, per-module Python API lookup | `console/launch-exec.md`, `console/_index.md`, and per-module subfolders under `console/` (`ai/`, `animation/`, `audio/`, `core/`, `data/`, `editor/`, `effects/`, `geometry/`, `interchange/`, `landscape/`, `mass/`, `materials/`, `media/`, `metahuman/`, `misc/`, `networking/`, `pcg/`, `physics/`, `rendering/`, `rigvm/`, `ui/`, `virtualproduction/`) |
| **GAS** | attributes, gameplay effects, ability activation, ability sets. **Symptoms:** ability won't activate, attribute/effect not applying, damage pipeline, GAS replication | `gas/gas-reference.md`, `gas/gas-patterns.md`, `gas/gas-advanced-patterns.md`, `gas/gas-damage-pipeline.md`, `gas/gas-networking.md`, `gas/gas-pitfalls.md` |
| **GameplayCues** | VFX/SFX feedback, impact effects, cue notifies. **Symptoms:** effect/sound not firing on ability/hit, cue not triggering or not replicating | `cue/cue-reference.md`, `cue/cue-patterns.md`, `cue/cue-advanced.md`, `cue/cue-pitfalls.md` |
| **Networking** | replication, RPCs, prediction, authority, multiplayer. **Symptoms:** "works on server not client" (or vice versa), value won't replicate, RPC not called, authority/ownership bugs, desync | `networking/replication.md`, `networking/replication-patterns.md`, `networking/rpcs.md`, `networking/prediction.md`, `networking/relevancy.md`, `networking/gas-networking.md`, `networking/game-networking-fundamentals.md`, `networking/network-profiling.md`, `networking/debugging.md`, `networking/pitfalls.md` |
| **Physics** | collision, constraints, Chaos, ragdoll, traces/sweeps. **Symptoms:** trace/overlap returns nothing, objects clip or won't collide, ragdoll/constraint misbehaves, collision channel setup | `physics/collision.md`, `physics/collision-setup.md`, `physics/physics-simulation.md`, `physics/traces-queries.md`, `physics/game-math-physics-simulation.md` |
| **Graphics / Rendering** | Nanite, Lumen, VSM, TSR, shaders, RDG, GPU profiling. **Symptoms:** visual artifacts, lighting/shadow wrong, low GPU framerate, custom shader/RDG pass, rendering cvars | `graphics/rendering-pipeline.md`, `graphics/nanite.md`, `graphics/lumen.md`, `graphics/vsm-tsr.md`, `graphics/megalights.md`, `graphics/shader-development.md`, `graphics/shader-math.md`, `graphics/rdg-passes.md`, `graphics/mesh-drawing-pipeline.md`, `graphics/post-processing.md`, `graphics/screen-space-effects.md`, `graphics/lighting-theory.md`, `graphics/atmosphere-fog.md`, `graphics/niagara-gpu.md`, `graphics/substrate.md`, `graphics/gpu-profiling.md`, `graphics/cvars-reference.md`, `graphics/python-automation.md`, `graphics/game-math-transforms.md`, `graphics/game-math-vectors-matrices.md`, `graphics/issues-workarounds.md`, `graphics/pixel-art-3d-rendering.md` |
| **Materials** | material graphs, instances, shaders, Substrate, UVs. **Symptoms:** material looks wrong, building a shader effect, material instance/param setup, UV/texture issues | `material/workflow.md`, `material/material-recipes.md`, `material/effect-patterns.md`, `material/effect-decomposition.md`, `material/node-gotchas.md`, `material/texture-workflow.md`, `material/uv-techniques.md`, `material/procedural-texturing.md`, `material/substrate-automotive.md`, `material/npr-techniques.md`, `material/python-api.md` |
| **Level Design** | landscapes, World Partition, streaming, lighting. **Symptoms:** level streaming/partition issues, landscape edit, lighting/atmosphere setup, level organization | `level-design/world-partition.md`, `level-design/landscape.md`, `level-design/lighting-atmosphere.md`, `level-design/level-organization.md` |
| **Data** | DataTables, DataAssets, Asset Manager, CurveTables. **Symptoms:** data-driven config, row/asset lookup, Asset Manager registration, curve evaluation | `data/data-reference.md`, `data/data-driven-gameplay.md`, `data/data-recipes.md`, `data/dataasset-patterns.md`, `data/data-pitfalls.md` |
| **PCG** | procedural content generation, foliage scatter, biomes. **Symptoms:** building a PCG graph, scatter/biome generation, custom PCG node, PCG performance | `pcg/pcg-reference.md`, `pcg/pcg-patterns.md`, `pcg/pcg-custom-nodes.md`, `pcg/pcg-performance.md`, `pcg/pcg-pitfalls.md`, `pcg/baked-generated-mesh.md` |
| **Debugger** | crash sessions, breakpoints, UE crash anatomy, debug-editor attach, `xdebug` stepping/inspection, expression evaluation, variable hotpatch. **Symptoms:** crash/assert to diagnose, need to step through code or inspect a live value, want to change a variable mid-run | `debugger/mcp-debug-tools.md`, `debugger/rider-debugger-tools.md`, `debugger/diagnostic-workflows.md`, `debugger/crash-patterns.md`, `debugger/console-commands.md` |
| **Platform / Packaging** | INI configs, packaging, device deploy, mobile signing. **Symptoms:** packaging/cook fails, INI/config questions, deploy to device, platform-specific settings | `platform/platform-guide.md`, `platform/config-hierarchy.md`, `platform/common-configs.md`, `platform/device-profiles.md`, `platform/packaging-best-practices.md`, `platform/buildcookrun-reference.md`, `platform/local-deployment.md`, `platform/remote-deployment.md`, `platform/mobile-deployment.md`, `platform/mobile-platform-config.md`, `platform/deployment-automation.md`, `platform/project-settings.md`, `platform/turnkey-and-sdks.md` |
| **Plugin** | creating plugins, `.uplugin`, module setup. **Symptoms:** new plugin scaffolding, module won't load, `.uplugin`/dependency setup | `plugin/plugin-structure.md`, `plugin/module-types.md`, `plugin/marketplace.md` |
| **Profiler** | frame drops, GPU bottlenecks, Unreal Insights. **Symptoms:** "the game is slow", hitches/stalls, finding a CPU/GPU/memory bottleneck | `profiler/cpu-profiling.md`, `profiler/gpu-profiling.md`, `profiler/memory-profiling.md` |
| **Testing** | automation tests, functional tests, Gauntlet, CI. **Symptoms:** writing/running a test, "how do I verify this automatically", CI test setup | `testing/automation-framework.md`, `testing/functional-tests.md`, `testing/gauntlet.md`, `testing/cqtest.md`, `testing/lowlevel-chaos-tests.md` |
| **UI (UMG / Blueprint)** | UMG widgets, CommonUI, HUD systems, menus, focus. **Symptoms:** widget won't show/update, menu/HUD layout, input focus/navigation issues | `ui/umg-fundamentals.md`, `ui/commonui.md`, `ui/patterns.md`, `ui/ui-patterns.md`, `ui/input-and-focus.md`, `ui/ui-platform.md`, `ui/ui-organization.md`, `ui/ui-reference.md`, `ui/ui-pitfalls.md` |
| **UI C++** | widget base classes, BindWidget, MVVM ViewModels. **Symptoms:** C++ widget class, BindWidget not binding, MVVM/ViewModel wiring | `ui-cpp/widget-cpp-patterns.md`, `ui-cpp/cpp-ui-patterns.md`, `ui-cpp/cpp-ui-pitfalls.md` |
