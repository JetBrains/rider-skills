# World Partition Python API

## WorldPartitionBlueprintLibrary

```python
import unreal
wpbl = unreal.WorldPartitionBlueprintLibrary
```

### Discovery (works on unloaded actors)
```python
descs = wpbl.get_actor_descs()                    # All actors
area = wpbl.get_intersecting_actor_descs(box)      # Within bounding box
bounds = wpbl.get_editor_world_bounds()             # World extent
```

### Loading / Pinning
```python
guids = [d.guid for d in descs]
wpbl.pin_actors(guids)      # Force-load (array of FGuid)
wpbl.unpin_actors(guids)    # Allow unload
wpbl.load_actors(descs)     # Request load (may defer)
wpbl.unload_actors(descs)   # Explicit unload
```

### ActorDesc Fields
| Field | Type | Notes |
|-------|------|-------|
| `label` | FName | `str()` for string ops |
| `guid` | FGuid | For pin/unpin |
| `native_class` | UClass | Actor class |
| `actor_package` | str | External file path |
| `is_spatially_loaded` | bool | Distance streaming |
| `data_layer_assets` | array | Data layers |

### Key Rules
- `pin_actors` takes **FGuid array**, NOT ActorDesc
- `get_all_level_actors()` only sees loaded actors
- `get_actor_descs()` sees ALL actors including unloaded
- `.label` is FName — use `str(d.label)` before `.startswith()`
