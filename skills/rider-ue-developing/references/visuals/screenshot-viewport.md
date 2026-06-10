# rider-ue-developing:visuals — Screenshots & Viewport Camera

Requires editor connected (`ue_health.connected = true`).

## Screenshot — `take_screenshot`

### File paths

Files land under:
```
<Project>/Saved/Screenshots/<Platform>/RiderMCP/<YYYYMMDD-HHMMSS>_<kind>[_<asset-basename>].png
```

`<Platform>` follows `FPaths::ScreenShotDir()` convention — `WindowsEditor`, `MacEditor`, `LinuxEditor`. Always use the `path` field the tool returns; don't hard-code the platform.

| `kind` | When |
|--------|------|
| `editor_window` | Active top-level editor window (chrome + panels) |
| `viewport` | Active level-editor viewport only (no chrome) |
| `asset_preview` | Content Browser thumbnail for an asset |

### Tool reference

| Tool | Purpose | When to use |
|------|---------|-------------|
| `take_screenshot` | Capture editor window, level viewport, or asset preview thumbnail | Primary visual capture; always read the returned `path` — never hard-code the platform subfolder |
| `search_assets` | Find asset by name or base class | Resolve the `/Game/...` package path for `asset_preview` screenshots |
| `spawn_actor` | Place an actor in the level | Populate the scene before taking a `viewport` screenshot |
| `viewport_camera` | Position and frame the editor camera | Frame the scene or actor of interest before screenshotting |
| `ue_execute_python` | Cleanup spawned actors between screenshot runs | Remove test actors by label prefix; see `scene.md` cleanup script |
| `ue_status` | Confirm editor connected | Required; screenshot calls the game thread — editor must be connected |

`take_screenshot { kind, assetPath?, width?, height?, forceLive? }`

- `asset_preview` needs `assetPath` as a long package path (`/Game/Foo/BP_Hero`), not a disk path. Use `search_assets` to discover, then convert.
- `forceLive=true` forces a live render instead of the cached thumbnail — **dangerous for skeletal mesh / AnimBP assets** (can hang the render thread in an unkillable driver call). Only use when `"no cached thumbnail"` error appears and the asset is safe to render.

### Workflow

1. `ue_status` — require `connected = true`.
2. Pick kind: "what the editor looks like now" → `editor_window`; "what's on screen in the level viewport" → `viewport`; "what does asset X look like" → `asset_preview`.
3. Read the file at the returned `path` (absolute, PNG BGRA8-sRGB).

### Critical rules

- **The MCP call blocks on the game thread** — screenshot needs `FlushRenderingCommands`. Never call `ue_execute_python` inside a screenshot-driven workflow expecting them to interleave.
- **`asset_preview` defaults to cache-only** — returns a clean error in <1 s rather than risk a render-thread hang. Materials / Textures almost always have cached thumbnails. AnimBPs / ControlRigs often don't — open the asset in the editor once to generate.
- **UE 5.x render-thread `ensure()` in `VirtualShadowMapCacheManager`** can pause execution when "Break on C++ Exception" is enabled during a screenshot. Non-fatal — resume the session; the PNG is already on disk.
- **`viewport_camera` → `take_screenshot` stale frame**: After `viewport_camera --action set/move/focus_on_actor`, the viewport may not have re-rendered yet. Calling `take_screenshot` immediately often returns the previous frame. Workaround: call `take_screenshot` a second time — the second call reliably gets the updated frame. `focus_on_actor` triggers a viewport update more reliably than `set`.
- **No spaces inside array literals**: `[x,y,z]` not `[x, y, z]`. The MCP CLI JSON parser splits on whitespace — a space after a comma inside `--location`, `--rotation`, or `--delta` produces a *"Trailing comma before end of array"* parse error. Always write arrays without interior spaces.

---

## Viewport Camera — `viewport_camera`

Single action-dispatched tool for the **active level-editor viewport camera**. Backed by `UUnrealEditorSubsystem::Get/SetLevelViewportCameraInfo`. Editor-only; does not touch the PIE camera.

### Tool reference

`viewport_camera { action, location?, rotation?, delta?, relative?, rotationDelta?, target?, actor?, minDistance? }`

All vectors/rotators are **3-element JSON arrays of doubles**.

| action | Effect | Args |
|--------|--------|------|
| `get` | Read current pose | — |
| `set` | Replace location and/or rotation | `location`, `rotation` (at least one) |
| `move` | Additive: `delta` shifts location (world-space or camera-local with `relative=true`), `rotationDelta` adds degrees | `delta` and/or `rotationDelta`, `relative` |
| `look_at` | Keep location; rotate to face a world point | `target` (required) |
| `focus_on_actor` | Frame an actor by Outliner label or FName | `actor` (required), `minDistance` |

Field formats:

| Field | Shape | Example |
|-------|-------|---------|
| `location` | `[x, y, z]` cm | `[500, 500, 800]` |
| `rotation` / `rotationDelta` | `[pitch, yaw, roll]` degrees | `[-20, 45, 0]` |
| `delta` | `[x, y, z]`; with `relative=true` → `[forward, right, up]` | `[-300, 0, 0]` |
| `target` | `[x, y, z]` world point | `[0, 0, 0]` |
| `actor` | Outliner label (falls back to FName) | `"SM_Cube8"` |

Returned shape (all actions): `{ location: {x,y,z}, rotation: {pitch,yaw,roll}, actorResolved?: "..." }`

### Recipes

| Goal | Call |
|------|------|
| Read current pose | `viewport_camera --action get` |
| Snap to known pose | `viewport_camera --action set --location [500,500,800] --rotation [-20,45,0]` |
| Only change rotation | `viewport_camera --action set --rotation [0,90,0]` |
| Fly 3 m forward (camera-local) | `viewport_camera --action move --delta [300,0,0] --relative true` |
| Add 30° yaw | `viewport_camera --action move --rotationDelta [0,30,0]` |
| Look at world origin | `viewport_camera --action look_at --target [0,0,0]` |
| Frame actor by label | `viewport_camera --action focus_on_actor --actor "BP_Hero"` |

### Critical rules

- **JSON-array form is mandatory** for every vector — `[500,500,800]`, NOT `500,500,800`.
- **All values in UE units** — location in cm, rotation in degrees.
- **`relative=true`** reinterprets `delta` as `(forward, right, up)` in camera-local frame.
- **`set` requires at least one of `location` / `rotation`.** Neither = error.
- **`focus_on_actor` resolution:** Outliner label first, FName fallback. Chosen label echoed in `actorResolved`.
- **No interpolation** — instant snaps. For cinematic glides, drive per-tick interpolation from `ue_execute_python` with `register_slate_post_tick_callback`.
- **`UUnrealEditorSubsystem()` constructor form deprecated since UE 5.2** — use `unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)` in any Python you write.

### Python fallback (when MCP unavailable)

```python
import unreal, json
ues = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)

# Read
loc, rot = ues.get_level_viewport_camera_info()
print(json.dumps({'loc': {'x': loc.x, 'y': loc.y, 'z': loc.z},
                  'rot': {'p': rot.pitch, 'y': rot.yaw, 'r': rot.roll}}))

# Write — always pass Rotator args by keyword
ues.set_level_viewport_camera_info(
    unreal.Vector(500, 500, 800),
    unreal.Rotator(pitch=-20.0, yaw=45.0, roll=0.0))
```

`unreal.Rotator(a, b, c)` positional order is `(roll, pitch, yaw)` — always use keyword args.

Frame an actor in Python:

```python
eas = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
target = next((a for a in eas.get_all_level_actors()
               if a.get_actor_label() == 'SM_Cube8'), None)
origin, extent = target.get_actor_bounds(only_colliding_components=False)
radius = max(extent.x, extent.y, extent.z, 50.0)
distance = max(radius * 3.0, 200.0)
new_loc = unreal.Vector(origin.x - distance, origin.y - distance, origin.z + distance * 0.6)
new_rot = unreal.MathLibrary.find_look_at_rotation(new_loc, origin)
ues.set_level_viewport_camera_info(new_loc, new_rot)
```
