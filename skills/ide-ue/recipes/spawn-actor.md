# Recipe — Placing Actors on the Level-Editor Scene

Spawn an object onto the active **design-time** level from an asset, via the `spawn_actor` MCP tool. Backed by native C++ (`RiderAgentTools/Private/SceneActorSpawner.cpp`), not Python — no `compile(..., 'single')` gymnastics, no per-spawn script. Validated against UE 5.7 + RiderLink.

This drives the **editor world**, not the PIE world. To spawn at runtime during play, drive gameplay code through `ue_execute_python` instead (see `simulate-user-input.md` for the gameplay side).

---

## TL;DR

```
spawn_actor --assetPath "/Engine/BasicShapes/Cube.Cube" --location [0,0,100]
spawn_actor --assetPath "/Game/Heroes/BP_Hero.BP_Hero" --location [500,0,0] --rotation [0,90,0] --scale [2,2,2] --label "Hero1"
```

Returns `{ spawned, actorLabel?, actorName?, location:{x,y,z} }`.

---

## Tool contract

| Arg | Shape | Default | Notes |
|---|---|---|---|
| `assetPath` | long *object* path `PackageName.ObjectName` | required | `/Engine/BasicShapes/Cube.Cube`, `/Game/Foo/BP_Hero.BP_Hero`. Not a disk path. |
| `location` | `[x, y, z]` cm | required | World-space. |
| `rotation` | `[pitch, yaw, roll]` deg | `[0,0,0]` | |
| `scale` | `[x, y, z]` | `[1,1,1]` | Zero is ignored C++-side. |
| `label` | string | engine-assigned | Outliner label; assigned post-spawn. |

`spawned=false` + a diagnostic comes back when the asset can't be loaded or isn't placeable (e.g. a Material).

### Asset-kind dispatch (C++ side)

| Loaded object | Spawn call |
|---|---|
| `UClass` (e.g. a `..._C` generated class path) | `UEditorActorSubsystem::SpawnActorFromClass` (gated by `IsChildOf(AActor)`) |
| `UBlueprint` | `SpawnActorFromClass(blueprint->GeneratedClass)` (gated by `IsChildOf(AActor)`) |
| anything else (StaticMesh, template object) | `SpawnActorFromObject` |

`UBlueprint::GeneratedClass` is a `TSubclassOf<UObject>`; the handler funnels it through a `UClass*` and checks `IsChildOf(AActor::StaticClass())` before spawning, so a non-actor asset returns a clean error instead of a null actor.

---

## Equivalent editor Python (when you need to script it directly)

The MCP tool is the first-class path. The hand-Python equivalent (what the tool replaces) is:

```python
import unreal
eas  = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
mesh = unreal.EditorAssetLibrary.load_asset('/Engine/BasicShapes/Cube.Cube')
actor = eas.spawn_actor_from_object(mesh, unreal.Vector(0, 0, 100),
                                    unreal.Rotator(pitch=0.0, yaw=0.0, roll=0.0))
actor.set_actor_scale3d(unreal.Vector(1, 1, 1))
actor.set_actor_label('Probe')
```

For a Blueprint, load the asset and spawn from its generated class:

```python
bp = unreal.EditorAssetLibrary.load_asset('/Game/Heroes/BP_Hero.BP_Hero')
gen = bp.generated_class()
actor = eas.spawn_actor_from_class(gen, unreal.Vector(500, 0, 0), unreal.Rotator())
```

Note the same `unreal.Rotator` positional-arg trap documented in `viewport-camera.md` — always pass `pitch=`, `yaw=`, `roll=` by keyword.

---

## Worked example — spawn-and-frame loop

Compose `spawn_actor` with `viewport_camera` to populate the level and keep each new actor in frame:

```text
viewport_camera --action set --location [0,0,300] --rotation [-20,0,0]   # baseline pose
for i in 1..N:
    r = spawn_actor --assetPath "/Engine/BasicShapes/Cube.Cube" \
                    --location [ (i*200), 0, 100 ] --label ("Cube_%02d" % i)
    viewport_camera --action focus_on_actor --actor r.actorLabel
    take_screenshot --kind viewport
```

The full camera+spawn scenario (and a runnable Python driver, pre-tool) lives at
`D:/Projects/ultimate2/.ai/scratch/ue-prototypes/scenario_spawn_and_retreat.py`. The
SKILL pipeline **P10** documents the loop with cleanup.

### Cleanup (label-prefix sweep)

Spawned actors persist in the level until destroyed. Sweep by a stable label prefix:

```python
import unreal, json
eas = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
removed = []
for a in list(eas.get_all_level_actors()):
    try:
        if a.get_actor_label().startswith("Cube_"):
            removed.append(a.get_actor_label()); eas.destroy_actor(a)
    except Exception: pass
print(json.dumps({"removed": len(removed)}))
```

---

## Pitfalls

- **Object path, not package path or disk path.** Use `/Game/Foo/BP_Hero.BP_Hero` (dotted object form). The bare `/Game/Foo/BP_Hero` usually resolves too, but the dotted form is unambiguous. A filesystem `.uasset` path is **not** accepted here (it is for `get_asset_properties`).
- **Editor-only.** Spawns into the design-time level. Has no effect on a running PIE world, and fails on a cooked/standalone target (`SetActorLabel` is editor-only).
- **Non-actor assets fail cleanly.** A Material / Texture / DataAsset path returns `spawned=false` with a diagnostic — the handler checks `IsChildOf(AActor)` for class/Blueprint assets and relies on `SpawnActorFromObject` returning null otherwise.
- **Labels collide.** Two spawns with the same `label` both get it; use a counter suffix for loops so cleanup is precise.
- **Game thread.** Each call runs on the editor game thread; a tight spawn loop serialises against other game-thread MCP work in that editor.

---

## Quick reference

| Need | Call |
|---|---|
| Spawn a mesh | `spawn_actor --assetPath "/Engine/BasicShapes/Cube.Cube" --location [0,0,100]` |
| Spawn a Blueprint, labelled | `spawn_actor --assetPath "/Game/X/BP_Y.BP_Y" --location [0,0,0] --label "Y1"` |
| Rotated + scaled | `--rotation [0,90,0] --scale [2,2,2]` |
| Then frame it | `viewport_camera --action focus_on_actor --actor "<actorLabel>"` |
| Find an asset path | `search_assets { query: "BP_Y" }` → convert disk path to `/Game/...` object path |
