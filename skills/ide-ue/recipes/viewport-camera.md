# Recipe — Driving the Level Viewport Camera from Python

Get and set the active level editor's viewport camera from the MCP Python executor. Validated against UE 5.8 + RiderLink, MyProject58Preview (third-person template).

This recipe drives the **design-time editor viewport**, not the PIE in-game camera. To control a PIE camera, possess the player controller and drive its rotation (see `simulate-user-input.md` for input on the gameplay side).

---

## TL;DR — read + write

```python
import unreal, json
ues = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)

# Read
loc, rot = ues.get_level_viewport_camera_info()
print(json.dumps({'loc':{'x':loc.x,'y':loc.y,'z':loc.z},
                  'rot':{'p':rot.pitch,'y':rot.yaw,'r':rot.roll}}))

# Write — IMPORTANT: pass Rotator args by keyword.
ues.set_level_viewport_camera_info(
    unreal.Vector(500, 500, 800),
    unreal.Rotator(pitch=-20.0, yaw=45.0, roll=0.0))
```

---

## API surface

| Operation | Call |
|---|---|
| Get current pose | `ues.get_level_viewport_camera_info()` → `(Vector, Rotator)` |
| Set absolute pose | `ues.set_level_viewport_camera_info(Vector, Rotator)` |
| Compute "face this point" | `unreal.MathLibrary.find_look_at_rotation(from, to)` → `Rotator` |
| Forward / right / up vectors | `rot.get_forward_vector()` / `get_right_vector()` / `get_up_vector()` |
| Actor bounds (for framing) | `actor.get_actor_bounds(only_colliding_components=False)` → `(origin, extent)` |
| All level actors (for label lookup) | `unreal.get_editor_subsystem(unreal.EditorActorSubsystem).get_all_level_actors()` |

`ues` ≡ `unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)`.

---

## ⚠️ Rotator positional args are NOT `(pitch, yaw, roll)`

In this UE Python binding, `unreal.Rotator(a, b, c)` interprets args as **`(roll, pitch, yaw)`** — surprising because the textbook Rotator order is `(pitch, yaw, roll)`. Empirical:

```python
r = unreal.Rotator(-20, 45, 0)
# observed: r.roll == -20, r.pitch == 45, r.yaw == 0  (NOT pitch=-20)
```

**Always pass by keyword**: `unreal.Rotator(pitch=p, yaw=y, roll=r)`. Same for arithmetic — never construct a Rotator positionally inside delta math.

---

## Recipes

### 1. Read pose

```python
loc, rot = ues.get_level_viewport_camera_info()
```

### 2. Absolute set (location, rotation, or both)

```python
loc, rot = ues.get_level_viewport_camera_info()   # keep what we don't change
new_loc = unreal.Vector(500, 500, 800)
new_rot = unreal.Rotator(pitch=-20.0, yaw=45.0, roll=0.0)
ues.set_level_viewport_camera_info(new_loc, new_rot)
```

### 3. Relative move (camera-local axes)

Useful for "fly forward 200 units" without thinking about world space:

```python
loc, rot = ues.get_level_viewport_camera_info()
forward = rot.get_forward_vector()
right   = rot.get_right_vector()
up      = rot.get_up_vector()
loc = loc + forward * 200.0 + right * 0.0 + up * 0.0
ues.set_level_viewport_camera_info(loc, rot)
```

### 4. Look at a world point

```python
loc, _ = ues.get_level_viewport_camera_info()
target = unreal.Vector(0, 0, 0)
rot = unreal.MathLibrary.find_look_at_rotation(loc, target)
ues.set_level_viewport_camera_info(loc, rot)
```

### 5. Frame an actor (focus by label)

The label is the editable name shown in the Outliner (e.g. `SM_Cube8`). `get_name()` returns the FName-style internal name and is a fallback.

```python
eas = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
target = next((a for a in eas.get_all_level_actors()
               if a.get_actor_label() == 'SM_Cube8'), None)
assert target is not None, 'actor not found'

origin, extent = target.get_actor_bounds(only_colliding_components=False)
radius = max(extent.x, extent.y, extent.z, 50.0)
distance = max(radius * 3.0, 200.0)
new_loc = unreal.Vector(origin.x - distance, origin.y - distance, origin.z + distance * 0.6)
new_rot = unreal.MathLibrary.find_look_at_rotation(new_loc, origin)
ues.set_level_viewport_camera_info(new_loc, new_rot)
```

`get_actor_bounds` returns `(origin, extent)` where extent is the half-size; the framing distance scales with `max(extent)` so big actors get more breathing room. The offset places the camera behind-and-above (negative X/Y, positive Z) relative to the actor; tweak to match your project's "front" if it differs.

---

## Planned MCP shape (single tool, action dispatch)

Maps to a single `ue_viewport_camera` MCP tool with `action` ∈ `{get, set, move, look_at, focus_on_actor}` — mirrors the `ue_play(action=...)` style already in the toolset. Action contract:

| action | Required args | Behaviour |
|---|---|---|
| `get` | — | Returns `{location, rotation}` (each a `{x,y,z}` / `{pitch,yaw,roll}` dict). |
| `set` | one or both of `location`, `rotation` (both as `{x,y,z}` / `{pitch,yaw,roll}`) | Replaces the supplied fields, leaves the others untouched. |
| `move` | `delta` (`{x,y,z}` world or `{forward,right,up}` local), `relative` (bool), optional `rotation_delta` (`{pitch,yaw,roll}`) | Additive. `relative=true` interprets `delta` in camera-local axes. |
| `look_at` | `target` (`{x,y,z}`) | Computes look-at rotation from current location; location unchanged. |
| `focus_on_actor` | `actor` (label or FName), optional `min_distance` | Frames the actor using `get_actor_bounds`; chooses a sensible distance and offset. |

The reference prototype that exercises every branch lives at `D:/Projects/ultimate2/.ai/scratch/ue-prototypes/camera_prototype.py`.

---

## Pitfalls

- **Rotator positional order** — see above. Use keyword args. Always.
- **`UnrealEditorSubsystem()` constructor form is deprecated** since UE 5.2 — use `get_editor_subsystem(UnrealEditorSubsystem)`.
- **Multiple viewports**: the API operates on the *active* level viewport. If the user has split-view or multiple level editors, the call targets whichever is currently active. There's no per-viewport selector in this API.
- **Game-mode camera**: during PIE the level editor's viewport camera and the gameplay camera are independent. Setting the level viewport camera does NOT affect the PIE player camera. To move the player view in PIE, drive the player controller's rotation (see `simulate-user-input.md`).
- **No interpolation built in**: these are instant snaps. For a cinematic glide, write a slate-post-tick callback that lerps `loc`/`rot` over N frames — same pattern as the input recipe.
- **`actor.get_actor_label()`** is editor-only; on a cooked / standalone target this fails. Fine for editor scripting.

---

## Quick reference

| Need | Call |
|---|---|
| Editor subsystem | `unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)` |
| Read camera | `ues.get_level_viewport_camera_info()` |
| Set camera | `ues.set_level_viewport_camera_info(loc, rot)` |
| Build Rotator (safe) | `unreal.Rotator(pitch=p, yaw=y, roll=r)` |
| Look-at math | `unreal.MathLibrary.find_look_at_rotation(from_vec, to_vec)` |
| Forward vector | `rot.get_forward_vector()` |
| Actor framing | `actor.get_actor_bounds(only_colliding_components=False)` |
| Find actor by label | iterate `EditorActorSubsystem.get_all_level_actors()` |
