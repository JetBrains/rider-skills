---
name: ue:editor
description: "Use when user asks to spawn/move/delete actors, find/manage assets, control the viewport, set editor object properties, take screenshots, control PIE, or load/save levels via simple Python automation. DO NOT TRIGGER for complex multi-step sequences with iteration (use ue:task), writing game code (use ue:coder), or building/compiling (use ue:builder)."
allowed-tools: Bash, Read, Write
argument-hint: "[editor automation task]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions, fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# UE Editor

Orchestrate editor automation by writing Python scripts and executing them via the AgentBridge HTTP plugin.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Health check** — verify editor is running via `ue:console --health`; launch or restart if needed
2. **Write script** — compose the Python automation script for the task
3. **Execute** — run via `ue:console --script` or `--file`
4. **Save assets** — save all created/modified assets via AgentBridge or editor Save All; confirm on disk
5. **Verify** — confirm result visually; stop PIE if running
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## IMPORTANT — How to Execute Scripts

All editor communication goes through **/ue:console**. See the ue:console skill for the full transport API (flags, response format, shell quoting rules, error recovery, platform-specific commands).

Key modes used by this skill: `--script`, `--file`, `--health`, `--play`, `--stop`, `--isolated`.

**Editor must be running**: ue:console does NOT auto-launch the editor. Before executing any script, you MUST follow these steps **automatically, without asking the user or pausing for confirmation**:

1. **Check** if the editor is reachable via `/ue:console --health`
2. If health check **fails**:
   a. Check if editor process is running: invoke `/ue:console` (will say "already running" or launch)
   b. If editor was "already running" but health failed → the editor is in a bad state (stale process, AgentBridge not loaded, or needs restart after C++ rebuild). **Restart it**: invoke `/ue:console --restart`
   c. If editor was just launched → wait for AgentBridge (poll `--health` every 5s, up to 120s)
3. If health check still fails after restart + wait → report to user (plugin may not be enabled)

Only after the health check passes should you execute your script. Do NOT ask the user whether to launch the editor — just do it. The entire check → launch → wait → execute flow must happen seamlessly as a single uninterrupted sequence.

**Temp file paths**: Use platform-neutral paths. On macOS/Linux use `/tmp/`. On Windows use `$env:TEMP` (PowerShell) or `%TEMP%` (cmd). In Python scripts, use `import tempfile; tempfile.gettempdir()`.

## AgentBridge HTTP Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/agent/health` | Health check |
| POST | `/agent/execute` | Execute Python: `{"script":"..."}` |
| POST | `/agent/play` | PIE control: `{"mode":"pie\|simulate\|stop"}` |
| GET | `/agent/logs` | Log stream: `?lines=100&filter=pattern&severity=error` |
| POST | `/agent/build` | Hot reload / live coding: `{"wait":true}` |
| GET | `/agent/devices` | List target devices |
| GET | `/agent/configs` | Build configurations |
| POST | `/agent/batch` | Batch execute: `{"scripts":[...]}` |

## CRITICAL — Niagara Particle Systems (see knowledge/niagara.md)

**Python cannot configure Niagara emitter internals** (spawn rate, velocity, lifetime, forces). Only user parameter overrides work (`set_float_parameter`, `set_vector_parameter` on `NiagaraComponent`).

**Correct approach**: Search the project for existing effects (`/Game/Effects/`, `/Game/FX/`, `/Game/VFX/`), duplicate, reposition. Tell user to tweak behavior in Niagara Editor UI.

**NEVER**: instantiate `NiagaraPythonEmitter` (SIGSEGV crash), explore Niagara API via `help()`/`dir()`, or iterate >3 times on Niagara property names.

## UE Coordinate System (Left-Handed)

All positions in Unreal Engine use **centimeters** in a **left-handed** coordinate system:

| Axis | Direction | Editor Color |
|------|-----------|-------------|
| **X** | Forward | Red |
| **Y** | Right | Green |
| **Z** | Up | Blue |

**Key rules:**
- `FVector(X, Y, Z)` = `FVector(Forward, Right, Up)`
- Rotations: **Pitch** = around Y (look up/down), **Yaw** = around Z (turn left/right), **Roll** = around X
- A camera at `(500, 0, 300)` looking at origin is 500 cm forward, 0 right, 300 cm above ground
- **NEVER compute look-at rotations manually** — always use `unreal.MathLibrary.find_look_at_rotation(from, to)`
- **NEVER use `AgentBridgeLibrary.set_viewport_camera()`** for viewport positioning — it does not reliably refresh the viewport. Use `UnrealEditorSubsystem.set_level_viewport_camera_info(location, rotation)` instead
- **ALWAYS use `camera-look-at.py`** for positioning the viewport camera — it handles coordinate math, actor lookup, and the correct API calls

## Writing Python Scripts

- `import unreal` — always first
- `unreal.get_editor_subsystem(unreal.SubsystemClass)` — access subsystems
- Common: `UnrealEditorSubsystem`, `EditorActorSubsystem`, `EditorAssetSubsystem`, `EditorLevelSubsystem`, `LevelEditorSubsystem`
- `print()` — only way to return data through the bridge
- `set_editor_property()` / `get_editor_property()` — NOT direct attribute access
- Use `dir(unreal)` and `help(unreal.ClassName)` inside scripts to discover API types

## Static Scripts

All scripts accept parameters via `globals()`. Use `--file` for defaults or `--script` with variable overrides:
```bash
# Default usage:
/ue:console --file ${CLAUDE_SKILL_DIR}/scripts/camera-look-at.py

# Parameterized:
/ue:console --script '__target_actor__="MyActor"; exec(open("'$HOME'/.claude/skills/ue:editor/scripts/camera-look-at.py").read())'
```

| Script | Purpose | Params |
|--------|---------|--------|
| `screenshot.py` | Viewport screenshot → PNG | `__screenshot_width__`, `__screenshot_height__`, `__screenshot_path__` |
| `scene-tree.py` | Print scene hierarchy | (none) |
| `camera-look-at.py` | Position camera to face target | `__target_actor__` or `__target_x/y/z__`; orbit: `__distance__`, `__azimuth__`, `__elevation__`; explicit: `__cam_x/y/z__`; optional: `__fov__` |
| `search-assets.py` | **Fast** asset search via Asset Registry | `__query__`, `__class__`, `__path__`, `__blueprints__`, `__show_refs__` |
| `find-assets.py` | Legacy asset search (loads assets) | `__asset_type__`, `__keyword__`, `__search_dirs__` |
| `spawn-mesh-actor.py` | Spawn static mesh actor | `__mesh_path__`, `__label__`, `__x/y/z__`, `__scale__`, `__material__` |
| `spawn-niagara-ring.py` | Spawn Niagara FX in a ring | `__system_path__`, `__center_x/y/z__`, `__radius__`, `__count__`, `__label_prefix__` |
| `cleanup-actors.py` | Remove actors by label pattern | `__label_contains__`, `__dry_run__` |
| `save.py` | Save level, assets, or all dirty packages | `__save_mode__` (`level`/`asset`/`directory`/`all`), `__asset_path__` |
| `resize-image.sh` | Resize/crop images (shell) | CLI args |

## Asset Search

**Prefer `search-assets.py` over `find-assets.py`** — it uses the Asset Registry (in-memory index) instead of loading each asset, making it orders of magnitude faster on large projects.

```bash
# Find all materials matching "wood"
/ue:console --script '__query__="wood"; __class__="Material"; exec(open("'${CLAUDE_SKILL_DIR}'/scripts/search-assets.py").read())'

# Find all static meshes under /Game/Environment/
/ue:console --script '__class__="StaticMesh"; __path__="/Game/Environment/"; exec(open("'${CLAUDE_SKILL_DIR}'/scripts/search-assets.py").read())'

# Find any asset with "hero" in the name, show dependency counts
/ue:console --script '__query__="hero"; __show_refs__="true"; exec(open("'${CLAUDE_SKILL_DIR}'/scripts/search-assets.py").read())'

# Find Blueprints whose parent class is Character
/ue:console --script '__class__="Character"; __blueprints__="true"; exec(open("'${CLAUDE_SKILL_DIR}'/scripts/search-assets.py").read())'

# Search Engine content (e.g., basic shapes)
/ue:console --script '__query__="sphere"; __path__="/Engine/"; exec(open("'${CLAUDE_SKILL_DIR}'/scripts/search-assets.py").read())'
```

Common `__class__` values: `StaticMesh`, `SkeletalMesh`, `Material`, `MaterialInstance`, `MaterialInstanceConstant`, `Texture2D`, `Blueprint`, `NiagaraSystem`, `SoundWave`, `SoundCue`, `AnimSequence`, `AnimMontage`, `AnimBlueprint`, `WidgetBlueprint`, `DataTable`, `CurveTable`, `World` (maps).

**Note**: The `__class__` filter uses `TopLevelAssetPath('/Script/Engine', ClassName)`. For classes in other modules (e.g., Niagara, Paper2D), the class may not match — use `__query__` text search as fallback.

## Guidelines

- Prefer `unreal.get_editor_subsystem()` over deprecated `unreal.EditorLevelLibrary`. In particular, use `unreal.get_editor_subsystem(unreal.LevelEditorSubsystem).save_current_level()` instead of `unreal.EditorLevelLibrary.save_current_level()`.
- Combine multi-step operations into a single script to minimize round-trips.
- Scripts execute on the game thread — avoid long-running loops.
- Use `print()` for all output.
- Timeout 30s default; use the `timeout` parameter for heavy operations.
- **Collision properties are METHODS, not editor properties (UE 5.7).** On any `PrimitiveComponent` (`StaticMeshComponent`, `SphereComponent`, `CapsuleComponent`, etc.), `set_editor_property('collision_enabled', ...)` will fail. Use method calls instead:
  ```python
  comp.set_collision_enabled(unreal.CollisionEnabled.QUERY_AND_PHYSICS)
  comp.set_collision_object_type(unreal.CollisionChannel.WORLD_DYNAMIC)
  comp.set_collision_response_to_all_channels(unreal.CollisionResponse.IGNORE)
  comp.set_collision_response_to_channel(unreal.CollisionChannel.PAWN, unreal.CollisionResponse.OVERLAP)
  comp.set_collision_profile_name('OverlapAllDynamic')
  ```
  Properties that DO work via `set_editor_property`: `sphere_radius`, `generate_overlap_events`, `cast_shadow`, `relative_scale3d`, `static_mesh`.
- **NEVER hardcode actor spawn coordinates. Default placement: camera-forward trace.** When spawning actors without explicit coordinates, ALWAYS:
  1. Get the viewport camera location and forward vector
  2. Line-trace **forward** from the camera (up to a max distance, e.g. 5000 cm) to find the first surface in view
  3. If the forward trace hits, **offset the spawn location along the ImpactNormal** by half the actor's bounding box extent so it sits ON TOP of the surface (not inside it). For example, a default cube (100cm) should be offset 50cm along the normal from the impact point. Parse both `ImpactPoint` and `ImpactNormal` from `hit.export_text()`.
  4. If no forward hit, project a point at max distance and line-trace **downward** to find the floor (same normal-offset rule applies)
  5. If no geometry is found at all, place at max distance in front of camera
  Use `unreal.AgentBridgeLibrary.get_viewport_camera_location()` / `get_viewport_camera_rotation()` for the camera, and `unreal.SystemLibrary.line_trace_single()` for traces. Only skip this when the user provides explicit x/y/z coordinates.
- **HitResult properties are protected in UE 5.7.** `hit_result.location`, `hit_result.impact_point`, and `get_editor_property('location')` all raise errors. Parse `hit_result.export_text()` with regex instead:
  ```python
  import re
  world = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_editor_world()
  hit = unreal.SystemLibrary.line_trace_single(world, start, end, ...)
  if hit is not None:
      txt = hit.export_text()
      m = re.search(r"ImpactPoint=\(X=([-\d.]+),Y=([-\d.]+),Z=([-\d.]+)\)", txt)
      if m:
          loc = unreal.Vector(float(m.group(1)), float(m.group(2)), float(m.group(3)))
  ```
- **Always save assets after changes.** Call `unreal.EditorAssetLibrary.save_asset('/Game/Path/AssetName')` for each modified/created asset, or `unreal.EditorAssetLibrary.save_directory('/Game/Path/')` to save all assets in a directory. Unsaved assets are lost on editor restart and texture/material references may break.
- **Asset deletion**: Use `unreal.AgentBridgeLibrary.force_delete_asset('/Game/Path/Asset')` instead of `EditorAssetLibrary.delete_asset()` which opens a modal dialog that freezes AgentBridge. For batch deletes: `unreal.AgentBridgeLibrary.force_delete_assets(['/Game/A', '/Game/B'])`.
- **CRITICAL — NEVER delete assets during PIE.** Calling `force_delete_asset` while Play-In-Editor is active causes a SIGSEGV crash in `ULevelInstanceSubsystem::OnAssetsPreDelete`. Always stop PIE first, wait briefly, then delete.
- **Blueprint deletion — GCObjectReferencer blocks**: `force_delete_asset` will FAIL on Blueprints when `GCObjectReferencer` holds a reference. This happens when: (1) the BP editor is open, (2) the generated class was loaded via `load_object("Path_C")`, or (3) level instances exist. **Full safe-delete procedure**:
  ```python
  import unreal, gc
  BP_PATH = "/Game/Path/BP_Name"
  bp_name = BP_PATH.split("/")[-1]
  eal = unreal.EditorAssetLibrary
  # 1. Stop PIE
  lsub = unreal.get_editor_subsystem(unreal.LevelEditorSubsystem)
  if lsub.is_in_play_in_editor():
      lsub.editor_request_end_play()
      import time; time.sleep(0.5)
  # 2. Close BP editor
  ae = unreal.get_editor_subsystem(unreal.AssetEditorSubsystem)
  asset = eal.load_asset(BP_PATH)
  if asset: ae.close_all_editors_for_asset(asset)
  # 3. Destroy level instances
  asub = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
  gen = unreal.load_object(None, "{}.{}_C".format(BP_PATH, bp_name))
  if gen:
      for a in asub.get_all_level_actors():
          if a.get_class() == gen: a.destroy_actor()
  # 4. Unload package (KEY — releases GCObjectReferencer)
  if asset:
      pkg = asset.get_outermost()
      if pkg: unreal.EditorLoadingAndSavingUtils.unload_packages([pkg])
  # 5. Release Python refs + aggressive GC
  asset = None; gen = None; pkg = None; gc.collect()
  unreal.SystemLibrary.execute_console_command(None, 'obj gc')
  unreal.SystemLibrary.collect_garbage()
  # 6. Delete (force-delete path, no cross-ref check)
  eal.delete_asset(BP_PATH)
  ```
- **Screenshots — ALWAYS use viewport screenshot**: Use `unreal.AgentBridgeLibrary.take_viewport_screenshot('/tmp/viewport.png')` for all screenshots. For full editor window including UMG widget overlays: `unreal.AgentBridgeLibrary.take_screenshot_with_ui('/tmp/screenshot.png')`. Supports .png, .jpg, .bmp, .exr.
- **NEVER use system screencapture** (`screencapture`, `osascript`). Always use AgentBridge viewport screenshot methods.
- **Screenshot limitations during PIE**: `take_viewport_screenshot` captures the 3D scene but NOT UMG widget overlays. `take_screenshot_with_ui` captures the full editor window WITH UMG, but returns `False` if PIE runs in a **New Window** (the game window is separate from the editor). To capture UMG during PIE, ensure PIE runs in **Selected Viewport** mode:
  ```python
  unreal.SystemLibrary.execute_console_command(None, "PlayInEditor.PlayInSelectedViewport")
  sub.editor_request_begin_play()
  # Now take_screenshot_with_ui() will capture game + UMG in the editor viewport
  ```
- For temporary script files, use platform-neutral temp locations (`$TMPDIR`, `$TEMP`, or `/tmp`) instead of hardcoding OS-specific paths.
- **Viewport camera**: **ALWAYS use `camera-look-at.py`** for positioning the viewport camera. It uses `UnrealEditorSubsystem.set_level_viewport_camera_info()` and `MathLibrary.find_look_at_rotation()` which reliably update the viewport. For reading camera state: `unreal.AgentBridgeLibrary.get_viewport_camera_location()`, `get_viewport_camera_rotation()`, `get_viewport_camera_fov()`. For FOV override: `set_viewport_camera_fov(fov)`. **Do NOT use `AgentBridgeLibrary.set_viewport_camera()`** — it does not reliably refresh the viewport.
- **Editor notifications**: Use `unreal.AgentBridgeLibrary.show_notification('text', 'success', 3.0)` to show toast messages. Types: "info", "success", "warning", "error".
- **Port auto-detection**: Never hardcode port 13090. Read `Saved/AgentBridge.port` for the actual port: `PORT=$(cat Saved/AgentBridge.port)`
- **Play/Stop — ALWAYS use Selected Viewport**:
  - **Start**: Force Selected Viewport mode, then begin play:
    ```python
    unreal.SystemLibrary.execute_console_command(None, "PlayInEditor.PlayInSelectedViewport")
    unreal.get_editor_subsystem(unreal.LevelEditorSubsystem).editor_request_begin_play()
    ```
  - **Stop**: `unreal.get_editor_subsystem(unreal.LevelEditorSubsystem).editor_request_end_play()`
  - After completing a task, run the game to let the user verify, take a screenshot if needed, then **always stop** before returning to the user. Do NOT leave the game running.
  - **Note**: `LevelEditorPlaySettings` is NOT exposed to Python. Use the console command `PlayInEditor.PlayInSelectedViewport` to set the PIE mode instead.
  - **NEVER** use standalone PIE window, `is_playing_world()`, `editor_end_play()`, `end_play()`, or leave PIE running when deleting assets.
- **Health check after risky operations**: After any Blueprint/asset manipulation, check editor health. If unreachable, the editor crashed — rebuild with `--force-ubt` and restart.
- **NEVER use `rename_asset` + `create_asset` at the same path** — causes fatal ObjectRedirector crash. Modify in-place or use a new path.
- **WorldSettings.default_game_mode** — NOT `game_mode_override`. When setting a level's GameMode: `world.get_world_settings().set_editor_property('default_game_mode', gm_class)`.
- **LevelEditorSubsystem.get_world() may return None after level switch.** In `--isolated` mode, use `unreal.EditorLevelLibrary.get_editor_world()` instead — it reliably returns the current world even immediately after `load_level()` or `new_level()`.
- **PIE world is NOT accessible from Python scripts.** `GameplayStatics.get_player_controller(editor_world, 0)` returns `None` during PIE. The PIE world is a separate transient world. To verify runtime behavior, use `take_screenshot_with_ui()` or check editor logs.

see: knowledge/recipes.md — Common recipes: query actors, spawn, get/set properties, list assets, load level, viewport camera
see: knowledge/docs_python_scripting.md — Python scripting guide: execution methods, API patterns, best practices, transactions
see: knowledge/docs_editor_utilities.md — Editor Utility Widgets, Scripted Actions, Blueprint editor scripting patterns
see: knowledge/docs_subsystems.md — Programming Subsystems: Engine, Editor, GameInstance, LocalPlayer lifecycles
see: knowledge/docs_scriptable_tools.md — Scriptable Tools: custom interactive tools via Blueprint/Python
