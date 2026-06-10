# UE Editor Recipes

Common Python recipes for editor automation. Execute via ue-scripter:
```bash
bash ${CLAUDE_SKILL_DIR}/../ue-scripter/scripts/ue-exec.sh --script '...'
```

## Coordinate system and units

**Axes** — left-handed, Z-up:
| Axis | Color | Direction | Positive |
|------|-------|-----------|----------|
| X | Red | Forward/back | Forward |
| Y | Green | Left/right | Right |
| Z | Blue | Up/down | Up |

**Units** — 1 Unreal Unit = 1 centimeter. Angles in degrees.

**Default mesh sizes** (before scaling):
| Shape | Size |
|-------|------|
| Sphere (`/Engine/BasicShapes/Sphere`) | 100 cm diameter (50 cm radius) |
| Cube (`/Engine/BasicShapes/Cube`) | 100 × 100 × 100 cm |
| Cylinder | 100 cm diameter, 100 cm tall |
| Plane | 100 × 100 cm |

To get a 5-meter diameter sphere: `set_actor_scale3d(Vector(50, 50, 50))` — scale × 100 cm = size.

**FRotator** — `(Pitch, Yaw, Roll)` as properties, but the **Python constructor order is `(roll, pitch, yaw)`**:
| Property | Axis | Positive direction |
|----------|------|--------------------|
| Pitch | Around Y | Looking up |
| Yaw | Around Z | Turning right (clockwise from above) |
| Roll | Around X | Tilting right |

```python
# WRONG — constructor is NOT (pitch, yaw, roll):
rot = unreal.Rotator(pitch, yaw, 0)

# RIGHT — constructor is (roll, pitch, yaw):
rot = unreal.Rotator(0, -20, 180)  # roll=0, pitch=-20 (look down 20°), yaw=180 (face -X)
print(rot.pitch, rot.yaw, rot.roll)  # -20.0  180.0  0.0
```

**Yaw reference**: 0° = +X, 90° = +Y, 180°/-180° = −X, −90° = −Y.

## Camera look-at

NEVER compute pitch/yaw with `math.atan2` — UE's left-handed conventions make manual math error-prone.
ALWAYS use `MathLibrary.find_look_at_rotation`:
```python
import unreal
cam_pos = unreal.Vector(500, 300, 400)
target  = unreal.Vector(0, 0, 200)
look_rot = unreal.MathLibrary.find_look_at_rotation(cam_pos, target)

subsys = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)
subsys.set_level_viewport_camera_info(cam_pos, look_rot)
```

**Camera distance**: ensure the camera is far enough from the target to see it. For a sphere
of radius R, place the camera at least `R * 2.5` away. Example: sphere at scale 5 (radius
250 cm) → camera at least 625 cm from center.

## Screenshots

`take_high_res_screenshot` is **async** and captures a **stale frame**. Follow this protocol:

1. **Script 1** — make all changes (camera, material, actors)
2. **Wait** — the editor must render at least 1-2 frames with the new state
3. **Script 2** (separate execution) — take the screenshot
4. **Wait ~5-10 seconds** before reading the file from disk (it writes asynchronously)

Always use absolute paths for the output file:
```python
import unreal, os
saved = unreal.Paths.convert_relative_path_to_full(unreal.Paths.project_saved_dir())
out = os.path.join(saved, "Screenshots", "my_shot.png")
os.makedirs(os.path.dirname(out), exist_ok=True)
unreal.AutomationLibrary.take_high_res_screenshot(1280, 720, out)
```

## Custom material expressions (HLSL)

Custom HLSL nodes compile across **all shader permutations** (base pass, depth pass,
debug view, etc.). Inputs may not be available in every permutation, causing errors like
`undeclared identifier 'UV'`.

**Rules for Custom nodes:**
- NEVER reference input names directly in the code body without testing all permutations
- Input variables become available as function-scope parameters, but some permutations
  (like `FDebugViewModePS`) may not pass them
- Prefer **standard material expression nodes** over Custom HLSL when possible — they
  compile correctly in all permutations
- If Custom HLSL is required, **test compilation** by checking editor logs after
  `recompile_material()` — look for `Failed to compile Material` warnings
- Use `ue_get_logs(filter="ShaderCompiler", severity="warning")` to detect shader compile failures

**Bad — Custom HLSL with raw input reference:**
```python
custom = mel.create_material_expression(mat, unreal.MaterialExpressionCustom, 0, 0)
custom.set_editor_property("code", "float2 uv = UV; ...")  # UV may be undeclared!
```

**Good — standard nodes that compile everywhere:**
```python
# Use built-in expressions: Fresnel, OneMinus, Add, Multiply, Sine, Time, etc.
fresnel = mel.create_material_expression(mat, unreal.MaterialExpressionFresnel, 0, 0)
fresnel.set_editor_property("exponent", 3.0)
```

## Materials — translucent/emissive

- Set `blend_mode = BLEND_TRANSLUCENT`, `shading_model = MSM_UNLIT`, `two_sided = True`
- **Emissive brightness**: keep multiplier at **2-5×** max. Higher values (10×+) cause
  post-process bloom to wash out the material to solid white in screenshots
- **Opacity**: use `Clamp` node to keep values in [0, 1]. For a visible-but-transparent
  shield, set hex lines to 0.6-0.8 opacity and cell interiors to 0.0
- **Verify compilation**: after `recompile_material()`, check logs for shader errors before
  proceeding — a silently failed material renders as default gray

## Line traces and HitResult (UE 5.7)

`line_trace_single` returns a `HitResult` or `None`. In UE 5.7, **all HitResult properties are protected** — direct attribute access (`hit.location`, `hit.impact_point`) and `get_editor_property('location')` both raise errors. Parse `export_text()` instead:

```python
import unreal, re

def parse_hit_vector(hit_result, field="ImpactPoint"):
    """Extract a named vector from HitResult.export_text()."""
    txt = hit_result.export_text()
    m = re.search(r"{}=\(X=([-\d.]+),Y=([-\d.]+),Z=([-\d.]+)\)".format(field), txt)
    if m:
        return unreal.Vector(float(m.group(1)), float(m.group(2)), float(m.group(3)))
    return None

# Forward trace from camera
cam_loc = unreal.RiderAgentBridgeLibrary.get_viewport_camera_location()
cam_rot = unreal.RiderAgentBridgeLibrary.get_viewport_camera_rotation()
fwd = cam_rot.get_forward_vector()
max_dist = 5000.0

world = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_editor_world()
hit = unreal.SystemLibrary.line_trace_single(
    world, cam_loc, cam_loc + fwd * max_dist,
    unreal.TraceTypeQuery.TRACE_TYPE_QUERY1,
    False, [], unreal.DrawDebugTrace.NONE,
    ignore_self=True
)
if hit is not None:
    loc = parse_hit_vector(hit, "ImpactPoint")
    normal = parse_hit_vector(hit, "ImpactNormal")
```

Available fields in `export_text()`: `Location`, `ImpactPoint`, `Normal`, `ImpactNormal`, `TraceStart`, `TraceEnd`. Scalar fields: `Time`, `Distance`, `FaceIndex`.

## Spawning actors

Before spawning, **check the scene** for existing actors at the target location:
```python
import unreal
subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
actors = subsys.get_all_level_actors()
target_loc = unreal.Vector(0, 0, 200)
for a in actors:
    loc = a.get_actor_location()
    dist = ((loc.x - target_loc.x)**2 + (loc.y - target_loc.y)**2 + (loc.z - target_loc.z)**2)**0.5
    if dist < 100:
        print(f"WARNING: {a.get_actor_label()} already at ({loc.x:.0f},{loc.y:.0f},{loc.z:.0f})")
```

## Query editor world and actors
```python
import unreal
actors = unreal.get_editor_subsystem(unreal.EditorActorSubsystem).get_all_level_actors()
for a in actors:
    print(f"{a.get_name()} ({a.get_class().get_name()})")
```

## Get/set actor properties
Use `set_editor_property` / `get_editor_property` — direct attribute access does NOT work:
```python
# WRONG: obj.speed_x = 0.1
# RIGHT:
obj.set_editor_property("speed_x", 0.1)
val = obj.get_editor_property("speed_x")
```

## Get viewport camera info
Returns a tuple `(location, rotation)` — no arguments:
```python
import unreal
subsys = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)
loc, rot = subsys.get_level_viewport_camera_info()
```

## Batch execution
Execute multiple scripts in a single round-trip:
```bash
cat > /tmp/batch.json << 'EOF'
[
  {"id": "step1", "script": "import unreal\nprint(unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_editor_world().get_name())"},
  {"id": "step2", "script": "import unreal\nactors = unreal.get_editor_subsystem(unreal.EditorActorSubsystem).get_all_level_actors()\nprint(len(actors))"}
]
EOF
bash ${CLAUDE_SKILL_DIR}/../ue-scripter/scripts/ue-exec.sh --batch /tmp/batch.json --stop-on-error
```

## Screenshot and resize
```bash
# Take screenshot
bash ${CLAUDE_SKILL_DIR}/../ue-scripter/scripts/ue-exec.sh --file ${CLAUDE_SKILL_DIR}/scripts/screenshot.py

# Scale down to reduce tokens
bash ${CLAUDE_SKILL_DIR}/scripts/resize-image.sh /path/to/image.png --max-width 400

# Resize to exact dimensions
bash ${CLAUDE_SKILL_DIR}/scripts/resize-image.sh /path/to/image.png --resize 640x480

# Crop a region (left, top, right, bottom)
bash ${CLAUDE_SKILL_DIR}/scripts/resize-image.sh /path/to/image.png --crop 100,50,700,500
```

## Fog, atmosphere, and lighting property gotchas

Several lighting/atmosphere components have **non-obvious property names** or require setter methods instead of `set_editor_property()`.

### ExponentialHeightFogComponent
```python
fog_comp = actor.get_component_by_class(unreal.ExponentialHeightFogComponent)

# These work with set_editor_property():
fog_comp.set_editor_property("fog_density", 0.03)
fog_comp.set_editor_property("fog_height_falloff", 0.5)
fog_comp.set_editor_property("fog_max_opacity", 0.9)
fog_comp.set_editor_property("start_distance", 100.0)
fog_comp.set_editor_property("enable_volumetric_fog", True)  # NOT "volumetric_fog"

# These MUST use setter methods (set_editor_property will fail):
fog_comp.set_fog_inscattering_color(unreal.LinearColor(0.1, 0.15, 0.25, 1.0))
fog_comp.set_fog_density(0.03)
fog_comp.set_fog_max_opacity(0.9)
fog_comp.set_volumetric_fog(True)
```

**WRONG** (these property names don't exist):
- `fog_inscattering_color` — use `set_fog_inscattering_color()` method
- `volumetric_fog` — use `enable_volumetric_fog` property or `set_volumetric_fog()` method

### SkyLightComponent
```python
sky_comp = actor.get_component_by_class(unreal.SkyLightComponent)
sky_comp.set_editor_property("intensity", 5.0)
sky_comp.set_editor_property("source_type", unreal.SkyLightSourceType.SLS_CAPTURED_SCENE)
```

**WRONG** (these don't exist):
- `recapture_scene` — no such method; use `recapture_sky()` or just re-save
- `lower_hemisphere_is_solid_color` — not exposed to Python

### PostProcessVolume — safe exposure defaults
When setting up a dark/moody scene, **start with exposure bias 1.0–3.0** and darken from there. Starting too dark (-1.5 or lower) makes the scene appear completely black, requiring multiple adjustment iterations.
```python
settings = ppv.get_editor_property("settings")
settings.set_editor_property("auto_exposure_method", unreal.AutoExposureMethod.AEM_MANUAL)
settings.set_editor_property("override_auto_exposure_method", True)
settings.set_editor_property("auto_exposure_bias", 2.0)  # Start visible, darken later
settings.set_editor_property("override_auto_exposure_bias", True)
```

### Saving levels (non-deprecated)
```python
# WRONG (deprecated):
unreal.EditorLevelLibrary.save_current_level()

# RIGHT:
unreal.get_editor_subsystem(unreal.LevelEditorSubsystem).save_current_level()
```

## Asset search (Asset Registry)
Fast search without loading assets into memory:
```python
import unreal
registry = unreal.AssetRegistryHelpers.get_asset_registry()

# Search by path + class
ar_filter = unreal.ARFilter()
ar_filter.package_paths = ['/Game/']
ar_filter.recursive_paths = True
ar_filter.class_paths = [unreal.TopLevelAssetPath('/Script/Engine', 'StaticMesh')]
ar_filter.recursive_classes = True
assets = registry.get_assets(ar_filter)
for ad in assets[:20]:
    print(f'{ad.package_name} [{ad.asset_name}]')

# Search Blueprints by parent class
ar_filter = unreal.ARFilter()
ar_filter.package_paths = ['/Game/']
ar_filter.recursive_paths = True
ar_filter.class_paths = [unreal.TopLevelAssetPath('/Script/Engine', 'Character')]
bp_assets = unreal.AssetRegistryHelpers.get_blueprint_assets(ar_filter)

# Get dependencies
dep_opts = unreal.AssetRegistryDependencyOptions()
dep_opts.include_hard_package_references = True
deps = registry.get_dependencies(ad.package_name, dep_opts)

# Get referencers (what references this asset)
refs = registry.get_referencers(ad.package_name, dep_opts)
```

## Scene tree
```bash
bash ${CLAUDE_SKILL_DIR}/../ue-scripter/scripts/ue-exec.sh --file ${CLAUDE_SKILL_DIR}/scripts/scene-tree.py
```
Output format:
```
Level: LevelName
Actors: 20
---
ActorLabel [ClassName] (x, y, z)
  ChildActor [ClassName] (x, y, z)
```

## Blueprint generated class access

`get_editor_property("generated_class")` does NOT work on Blueprint assets. Use the `_C` suffix convention instead:
```python
# WRONG — raises "Failed to find property 'generated_class'"
bp = unreal.load_asset("/Game/Blueprints/BP_MyGameMode")
gen_class = bp.get_editor_property("generated_class")

# RIGHT — append _C to the inner path
gen_class = unreal.load_object(None, "/Game/Blueprints/BP_MyGameMode.BP_MyGameMode_C")
cdo = unreal.get_default_object(gen_class)
cdo.set_editor_property("my_property", some_value)
```

## Blueprint `status` property is protected
```python
# WRONG — raises "Property 'Status' is protected and cannot be read"
status = bp.get_editor_property("status")

# RIGHT — just compile and save, skip status check
unreal.BlueprintEditorLibrary.compile_blueprint(bp)
unreal.EditorAssetLibrary.save_asset(bp_path)
```

## WorldSettings game mode property
```python
# WRONG — property name does not exist
ws.get_editor_property("game_mode_override")

# RIGHT — use snake_case of DefaultGameMode
ws.get_editor_property("default_game_mode")
```

## PIE in Selected Viewport mode
`LevelEditorPlaySettings` is not exposed to Python. Use a console command:
```python
# Set PIE to Selected Viewport (required for take_screenshot_with_ui during PIE)
unreal.SystemLibrary.execute_console_command(None, "PlayInEditor.PlayInSelectedViewport")
unreal.get_editor_subsystem(unreal.LevelEditorSubsystem).editor_request_begin_play()
```

## RiderAgentBridgeLibrary availability after restart
After editor restart, the health endpoint may respond before Python bindings are registered. Retry if `RiderAgentBridgeLibrary` is not found:
```python
import unreal, time
for _ in range(5):
    if hasattr(unreal, 'RiderAgentBridgeLibrary'):
        break
    time.sleep(1)
else:
    raise RuntimeError("RiderAgentBridgeLibrary not available")
```

## Safe asset deletion (stop PIE first)
```python
import unreal, time
sub = unreal.get_editor_subsystem(unreal.LevelEditorSubsystem)
if sub.is_in_play_in_editor():
    sub.editor_request_end_play()
    time.sleep(0.5)
# Now safe to delete
unreal.RiderAgentBridgeLibrary.force_delete_asset("/Game/Path/Asset")
```
