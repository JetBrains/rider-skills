# ide-ue:scene — Placing Actors on the Level-Editor Scene

`spawn_actor` places / creates an object on the **active design-time level** from an asset. Editor-only — not the PIE world. For runtime spawning during play, use `ue_execute_python`.

## Tool reference

| Tool | Purpose | When to use |
|------|---------|-------------|
| `spawn_actor` | Place an asset on the active design-time level | Any time you need an actor in the scene — use the long object path form |
| `search_assets` | Find `.uasset` by name or base class | Resolve the `assetPath` before calling `spawn_actor` |
| `viewport_camera` | Position and frame the editor camera | Frame spawned actors with `focus_on_actor` after placing them |
| `take_screenshot` | Capture the viewport after spawning | Visual verification that the actor landed at the right location |
| `ue_execute_python` | Sweep and destroy actors by label prefix | Cleanup between test runs; see cleanup script below |
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

## Critical rules

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

## Python equivalent (when MCP unavailable)

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
