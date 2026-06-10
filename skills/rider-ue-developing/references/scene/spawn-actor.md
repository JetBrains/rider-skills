# rider-ue-developing:scene — Placing Actors on the Level-Editor Scene

`spawn_actor` places / creates an object on the **active design-time level** from an asset. Editor-only — not the PIE world. For runtime spawning during play, use `ue_execute_python`.

## Tool reference

**`spawn_actor` is the primary tool for placing actors.** Use it first — fall back to `ue_execute_python` only when you need to mutate component properties on an existing actor or access APIs that `spawn_actor` doesn't expose.

| Tool | Purpose | When to use |
|------|---------|-------------|
| `spawn_actor` | Place an asset on the active design-time level | **Primary choice** for all new actor placement — use the long object path form |
| `search_assets` | Find `.uasset` by name or base class | Resolve the `assetPath` before calling `spawn_actor` |
| `viewport_camera` | Position and frame the editor camera | Frame spawned actors with `focus_on_actor` after placing them |
| `take_screenshot` | Capture the viewport after spawning | Visual verification that the actor landed at the right location |
| `ue_execute_python` | Mutate component properties, set CDO fields, sweep/destroy by label | Fallback when `spawn_actor` can't do the job (e.g. setting skeletal mesh on existing actor) |
| `ue_status` | Confirm editor connected | Always check before spawning |

`spawn_actor { assetPath, location, rotation?, scale?, label? }`

| Field | Shape | Default | Example |
|-------|-------|---------|---------|
| `assetPath` | Long object path (`PackageName.ObjectName`) | required | `/Engine/BasicShapes/Cube.Cube` |
| `location` | `[x, y, z]` cm | required | `[0, 0, 100]` |
| `rotation` | `[pitch, yaw, roll]` degrees | `[0,0,0]` | `[0, 45, 0]` |
| `scale` | `[x, y, z]` per-axis | `[1,1,1]` | `[2, 2, 2]` |
| `label` | Outliner label | engine-assigned | `"HeroSpawn"` |

Returned: `{ spawned, actorLabel?, actorName?, location: {x,y,z} }`

## Workflow

1. `ue_status` — require `connected = true`.
2. Resolve asset path: long object path form `PackageName.ObjectName` (e.g. `/Game/Foo/BP_Hero.BP_Hero`). Use `search_assets` to discover, then convert: strip `Content/` prefix + `.uasset` suffix, prepend `/Game/`, append `.<basename>`.
3. `spawn_actor { assetPath, location, rotation?, scale?, label? }`.
4. Verify: `viewport_camera --action focus_on_actor --actor "<actorLabel>"`, or take a screenshot.

## Recipes

| Goal | Call |
|------|------|
| Engine cube at origin | `spawn_actor --assetPath "/Engine/BasicShapes/Cube.Cube" --location [0,0,100]` |
| Blueprint with label | `spawn_actor --assetPath "/Game/Heroes/BP_Hero.BP_Hero" --location [500,0,0] --label "Hero1"` |
| Rotated + scaled | `spawn_actor --assetPath "/Engine/BasicShapes/Cone.Cone" --location [0,0,200] --rotation [0,90,0] --scale [2,2,2]` |
| Spawn then frame | `spawn_actor ... --label "Probe"` → `viewport_camera --action focus_on_actor --actor "Probe"` |

## Correct Z placement — always trace to floor first

Never use an arbitrary Z value. The floor surface height varies per XY position and must be measured.

### Step 1 — trace to find floor Z

```python
import unreal
w = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_editor_world()
kw = dict(
    trace_channel=unreal.TraceTypeQuery.TRACE_TYPE_QUERY1,  # WorldStatic
    trace_complex=True, actors_to_ignore=[],
    draw_debug_type=unreal.DrawDebugTrace.NONE, ignore_self=True,
    trace_color=unreal.LinearColor(1,0,0,1),
    trace_hit_color=unreal.LinearColor(0,1,0,1), draw_time=0.0
)
h = unreal.SystemLibrary.line_trace_single(
    w, unreal.Vector(x, y, 5000), unreal.Vector(x, y, -1000), **kw)
t = h.to_tuple()
# t[0] = blocking_hit (bool), t[5] = impact_point (Vector)
floor_z = t[5].z if t[0] else 0.0
```

`HitResult` has no `.blocking_hit` attribute — use `.to_tuple()`: index 0 = hit bool, index 5 = impact_point Vector.

### Step 2 — add pivot-to-floor offset

| Actor type | Pivot location | Correct Z formula |
|------------|---------------|-------------------|
| `PlayerStart` | Foot level (bottom) | `Z = floor_z` |
| `Character` / `Pawn` | Capsule center | `Z = floor_z + capsule_half_height` |
| Static Mesh (pivot at bottom) | Bottom of mesh | `Z = floor_z` |
| Static Mesh (pivot at center) | Bounding box center | `Z = floor_z + bounds_extent.z` |

Get capsule half-height: `actor.get_component_by_class(unreal.CapsuleComponent).get_scaled_capsule_half_height()` (typically 88 cm for standard Characters).

Get bounds for any actor: `origin, extent = actor.get_actor_bounds(True)` — then `extent.z` = half the bounding box height from center.

### Editor "End" key equivalent

The editor's **End** key snaps selected actors down to the nearest floor surface automatically. In Python there is no direct API binding for this — use the line-trace pattern above instead. When using the UE Editor manually, select the actor and press **End** to snap it to the floor; this eliminates guessing Z entirely.

### Worked example — place PlayerStart and Character bot

```python
import unreal
w = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_editor_world()
actors = unreal.EditorLevelLibrary.get_all_level_actors()
ps  = next(a for a in actors if 'PlayerStart' in a.get_name())
bot = next(a for a in actors if 'bot' in a.get_name().lower())

kw = dict(trace_channel=unreal.TraceTypeQuery.TRACE_TYPE_QUERY1, trace_complex=True,
          actors_to_ignore=[], draw_debug_type=unreal.DrawDebugTrace.NONE,
          ignore_self=True, trace_color=unreal.LinearColor(1,0,0,1),
          trace_hit_color=unreal.LinearColor(0,1,0,1), draw_time=0.0)

def floor_at(x, y):
    h = unreal.SystemLibrary.line_trace_single(
            w, unreal.Vector(x, y, 5000), unreal.Vector(x, y, -1000), **kw)
    t = h.to_tuple()
    return t[5].z if t[0] else 100.0

caps = bot.get_component_by_class(unreal.CapsuleComponent)
hh   = caps.get_scaled_capsule_half_height() if caps else 88.0

ps .set_actor_location(unreal.Vector(0,   0, floor_at(0,   0)     ), False, False)
bot.set_actor_location(unreal.Vector(220, 0, floor_at(220, 0) + hh), False, False)
unreal.get_editor_subsystem(unreal.LevelEditorSubsystem).save_current_level()
```

## Character / Pawn mesh CDO setup

Set up CDO mesh properties **before** spawning, then place with `spawn_actor`. Fresh instances inherit the CDO.

### Step 1 — set mesh offset, rotation, and AnimBP on the CDO

```
ue_execute_python --script "import unreal; bp = unreal.load_asset('/Game/AI/Bot/BP_Bot'); cdo = unreal.get_default_object(bp.generated_class()); mc = cdo.get_component_by_class(unreal.SkeletalMeshComponent); caps = cdo.get_component_by_class(unreal.CapsuleComponent); hh = caps.get_scaled_capsule_half_height(); mc.set_editor_property('relative_location', unreal.Vector(0,0,-hh)); mc.set_editor_property('relative_rotation', unreal.Rotator(pitch=0,yaw=-90,roll=0)); abp = unreal.load_asset('/Game/Characters/Mannequins/Anims/Unarmed/ABP_Unarmed'); mc.set_editor_property('anim_class', abp.generated_class()); unreal.EditorAssetLibrary.save_asset('/Game/AI/Bot/BP_Bot', False); print('loc:', mc.get_editor_property('relative_location')); print('rot:', mc.get_editor_property('relative_rotation')); print('anim:', mc.get_editor_property('anim_class'))"
```

**Rules:**
- `relative_location` = `(0, 0, -capsule_half_height)` — places mesh root at capsule bottom (floor level).
- `relative_rotation` — always use **keyword args**: `Rotator(pitch=0, yaw=-90, roll=0)`. Positional `Rotator(0,-90,0)` silently produces `pitch=-90` (wrong axis). See positional order in ue-execute-python.md.
- If mesh faces **backward** (180° off): try `yaw=90` instead of `yaw=-90`.
- If mesh is **upside down**: ensure `roll=0`. Adding `roll=180` flips the mesh down, not up.

### Step 2 — destroy any stale level instance and respawn

CDO changes don't propagate to already-placed actors. Destroy first, then `spawn_actor`:

```
ue_execute_python --script "import unreal; eas = unreal.get_editor_subsystem(unreal.EditorActorSubsystem); actors = eas.get_all_level_actors(); bot = next((a for a in actors if 'Bot_AI' in a.get_actor_label()), None); eas.destroy_actor(bot) if bot else None; print('destroyed:', bot.get_actor_label() if bot else 'none')"
```

```
spawn_actor --assetPath "/Game/AI/Bot/BP_Bot.BP_Bot" --location [220,0,298] --label "Bot_AI"
```

### Step 3 — verify orientation in Blueprint editor, not level viewport

The level viewport can show a **stale cached actor** that doesn't reflect CDO changes. Open the Blueprint asset in the editor and inspect the **component viewport** there — it shows true CDO property values in real time. Only trust the level viewport after a destroy + respawn cycle.

## Critical rules

- **Always trace to floor before setting Z.** Never use an arbitrary constant — floor height varies per XY.
- **JSON-array form is mandatory** — `[0,0,100]`, NOT `0,0,100`.
- **`assetPath` is a long object path** (`PackageName.ObjectName`). Disk `.uasset` paths are NOT accepted.
- **Asset kind decides the spawn path** (C++-side): `UClass` / `_C` → `SpawnActorFromClass`; anything else → `SpawnActorFromObject`. Non-placeable assets return `spawned=false` with a diagnostic.
- **Labels are not unique by default.** Use a stable prefix (e.g. `ScenarioCube_03`) for cleanup loops.
- **Runs on the game thread** — don't expect a long spawn loop to interleave with other game-thread MCP work.
- **Cleanup between runs** — actors persist across runs. Sweep by label prefix via `ue_execute_python`:
  ```python
  import unreal, json
  eas = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
  removed = []
  for a in list(eas.get_all_level_actors()):
      try:
          lbl = a.get_actor_label()
          if lbl.startswith("ScenarioCube_"):
              removed.append(lbl); eas.destroy_actor(a)
      except Exception: pass
  print(json.dumps({"removed": len(removed)}))
  ```

## Asset-kind dispatch (C++ side)

| Loaded object | Spawn call |
|---|---|
| `UClass` (`_C` generated class path) | `SpawnActorFromClass` (gated by `IsChildOf(AActor)`) |
| `UBlueprint` | `SpawnActorFromClass(blueprint->GeneratedClass)` (gated by `IsChildOf(AActor)`) |
| Anything else (StaticMesh, template object) | `SpawnActorFromObject` |

`UBlueprint::GeneratedClass` is a `TSubclassOf<UObject>`; the handler checks `IsChildOf(AActor::StaticClass())` before spawning — non-actor assets return a clean error.

## Python equivalent — fallback only

Use `ue_execute_python` **only** when `spawn_actor` is not sufficient (e.g. you need to mutate component properties on an existing actor, or set CDO fields after spawn). For all new actor placement, prefer `spawn_actor`.

```python
import unreal
eas  = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
mesh = unreal.EditorAssetLibrary.load_asset('/Engine/BasicShapes/Cube.Cube')
actor = eas.spawn_actor_from_object(mesh, unreal.Vector(0, 0, 100),
                                    unreal.Rotator(pitch=0.0, yaw=0.0, roll=0.0))
actor.set_actor_scale3d(unreal.Vector(1, 1, 1))
actor.set_actor_label('Probe')
```

For a Blueprint (always pass `Rotator` args by keyword — positional order is `roll, pitch, yaw` not `pitch, yaw, roll`):

```python
bp = unreal.EditorAssetLibrary.load_asset('/Game/Heroes/BP_Hero.BP_Hero')
actor = eas.spawn_actor_from_class(bp.generated_class(), unreal.Vector(500, 0, 0), unreal.Rotator())
```

## Worked example — spawn-and-frame loop

```text
viewport_camera --action set --location [0,0,300] --rotation [-20,0,0]
for i in 1..N:
    r = spawn_actor --assetPath "/Engine/BasicShapes/Cube.Cube" --location [(i*200),0,100] --label "Cube_{i:02d}"
    viewport_camera --action focus_on_actor --actor r.actorLabel
    take_screenshot --kind viewport
```
