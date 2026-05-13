# World Partition System

Complete reference for Unreal Engine's World Partition system, covering setup, configuration, runtime streaming, HLODs, data layers, and migration from legacy World Composition.

---

## Overview

World Partition replaces the legacy World Composition and streaming level systems with a single persistent level that automatically partitions actors into a grid-based streaming system. It mandates One File Per Actor (OFPA) for version control friendliness and uses data layers to control conditional loading.

Key benefits over legacy streaming:
- No manual sub-level management
- Automatic spatial streaming based on grid cells
- Built-in HLOD pipeline
- Per-actor version control (no level-lock contention)
- Data layers for gameplay-conditional loading

---

## Enabling World Partition

### On New Levels

```python
import unreal

# Create a new level with World Partition enabled
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
factory = unreal.WorldFactory()
factory.world_type = unreal.WorldType.EDITOR
# After creation, enable WP in World Settings
new_world = asset_tools.create_asset("WP_Level", "/Game/Maps", unreal.World, factory)

# Open the level and configure
unreal.EditorLevelLibrary.load_level("/Game/Maps/WP_Level")
```

After creation, enable World Partition in World Settings:
- Open World Settings
- Check "Enable World Partition"
- This automatically enables One File Per Actor

### On Existing Levels (Migration)

Use the commandlet for safe migration:

```bash
UnrealEditor-Cmd.exe ProjectName -run=WorldPartitionConvertCommandlet MapName.umap
```

**WARNING:** This is a destructive, one-way operation. Back up the level first. The commandlet:
1. Converts all actors to external actor files (OFPA)
2. Creates the World Partition grid
3. Removes streaming level references
4. Adjusts level bounds

---

## One File Per Actor (OFPA)

OFPA stores each actor as a separate `.uasset` file under `__ExternalActors__/`. This is mandatory with World Partition and provides:
- Per-actor checkout in version control (no level lock contention)
- Reduced merge conflicts
- Faster save times (only dirty actors written)

### File Structure

```
Content/
  Maps/
    MyLevel.umap
  __ExternalActors__/
    Maps/
      MyLevel/
        A/B/C/ActorHash1.uasset
        D/E/F/ActorHash2.uasset
```

Actor files are organized in hash-based subdirectories. Never manually move or rename these files.

### Version Control Best Practices

- Check out only the actor files you modify, not the entire level
- The `.umap` file only needs checkout when changing World Settings or partition config
- Use `Revision Control` > `Sync` to get latest actor files before editing
- Deleted actors leave behind tombstone files that should be submitted to VCS

---

## Runtime Grid Configuration

The runtime grid controls how actors stream in and out during gameplay.

### Grid Properties

| Property | Default | Description |
|----------|---------|-------------|
| `Cell Size` | 12800 | Size of each streaming cell in Unreal units (cm) |
| `Loading Range` | 25600 | Distance from camera at which cells begin loading |
| `Block on Slow Streaming` | false | Whether to pause the game when streaming cannot keep up |
| `Priority` | 0 | Loading priority relative to other grids |

### Choosing Cell Size

- **Small cells (6400-12800):** Fine-grained streaming, more overhead, better memory. Use for dense urban environments.
- **Medium cells (12800-25600):** Good default for most open-world games.
- **Large cells (25600-51200):** Less overhead, higher memory peaks. Use for sparse wilderness.

Rule of thumb: cell size should be roughly 1/4 to 1/2 of loading range.

### Configuring via Python

```python
import unreal

world = unreal.EditorLevelLibrary.get_editor_world()
partition = world.world_partition
if partition:
    runtime_hash = partition.runtime_hash
    # Configuration is typically done through World Settings in editor
    # or via project settings for defaults
    print(f"World Partition enabled: {partition is not None}")
```

### Multiple Runtime Grids

You can create multiple grids for different actor types:
- A dense grid for small props and foliage
- A sparse grid for large landmarks visible from far away
- A separate grid for gameplay actors with different loading priorities

Assign actors to grids via the `Runtime Grid` property in the actor's details panel.

---

## HLOD Setup and Generation

Hierarchical Level of Detail replaces distant actors with simplified proxy meshes.

### HLOD Layers

1. **Create HLOD Layer assets** in Content Browser: right-click > World Partition > HLOD Layer
2. **Configure layer type:**
   - `Mesh Merge` -- merges static meshes into combined mesh (good for buildings)
   - `Mesh Simplify` -- creates simplified proxy mesh (good for complex geometry)
   - `Mesh Approximate` -- generates approximation mesh (fastest, lowest quality)
   - `Custom` -- user-defined HLOD generation
3. **Assign layers to actors** via the `HLOD Layer` property

### HLOD Generation

```python
import unreal

# Build HLODs from Python
unreal.WorldPartitionEditorLibrary.build_hlods()
```

Or use the commandlet:

```bash
UnrealEditor-Cmd.exe ProjectName -run=WorldPartitionHLODsBuilder MapName
```

### HLOD Configuration Tips

- Set `Cell Size` on HLOD layers to control how many actors merge per HLOD actor
- Use `Mesh Simplify` with target triangle percentage for best quality/performance tradeoff
- HLOD actors are stored as external actors under `__ExternalActors__/` alongside regular actors
- Rebuild HLODs after significant geometry changes

---

## Level Instances and Level Instance Actors

Level Instances allow reusable level chunks inside a World Partition level.

### Creating Level Instances

```python
import unreal
el = unreal.EditorLevelLibrary

# Spawn a level instance that references another level
level_instance = el.spawn_actor_from_class(
    unreal.LevelInstance,
    unreal.Vector(5000, 5000, 0)
)
# Set the level asset to load
# level_instance.set_editor_property("world_asset", "/Game/Maps/BuildingInterior")
```

### Use Cases

- Repeated structures (buildings, dungeons, arenas)
- Modular level chunks that can be edited independently
- Prefab-like workflows for level designers

### Packed Level Instances

`PackedLevelActor` is a baked version of a Level Instance that merges all actors into a single streaming unit. Use for instances that do not need individual actor streaming.

---

## Minimap Setup

World Partition includes built-in minimap support for editor visualization.

### Enabling the Minimap

1. Open Window > World Partition to see the partition grid
2. The minimap shows cell boundaries, loaded/unloaded states, and actor distribution
3. Color coding: green = loaded in editor, gray = unloaded, blue = selected

### Minimap in Runtime

For runtime minimaps, use the World Partition grid data to render a map:
- Query `UWorldPartitionSubsystem` for loaded cells
- Use data layers to show/hide map regions
- Combine with `MapBuildDataRegistry` for static minimap textures

---

## Data Layers for Conditional Loading

Data layers control which actors load based on gameplay conditions rather than proximity.

### Creating Data Layers

```python
import unreal

# Data layers are created through the editor's data layer outliner
# or via World Settings configuration
# They appear in the World Partition outliner as toggleable groups
```

### Data Layer Types

| Type | Behavior |
|------|----------|
| `Runtime` | Can be activated/deactivated at runtime via Blueprint or C++ |
| `Editor` | Only affects editor loading, not runtime |

### Runtime Activation

```cpp
// In C++ or Blueprint
UDataLayerManager* DLM = UDataLayerManager::GetDataLayerManager(GetWorld());
UDataLayerInstance* Layer = DLM->GetDataLayerInstanceFromName(FName("NightTimeActors"));
DLM->SetDataLayerInstanceRuntimeState(Layer, EDataLayerRuntimeState::Activated);
```

### Use Cases

- Day/night variants (activate different lighting setups)
- Quest stages (load quest-specific actors when active)
- Difficulty modes (load additional enemies on harder difficulties)
- Seasonal events (swap decoration sets)
- Destructible environments (swap intact/destroyed versions)

---

## Migration from World Composition

### Key Differences

| Feature | World Composition | World Partition |
|---------|------------------|-----------------|
| Level structure | Multiple sub-levels | Single persistent level |
| Actor storage | Per-level files | Per-actor files (OFPA) |
| Streaming control | Manual / distance-based | Automatic grid-based |
| LOD system | Level LODs | HLODs |
| Landscape | One per sub-level | Single landscape, partitioned |
| VCS workflow | Lock entire sub-level | Lock individual actors |

### Migration Steps

1. **Back up the entire project**
2. Run `WorldPartitionConvertCommandlet` on the persistent level
3. Verify actor placement and references
4. Reconfigure streaming distances via runtime grid settings
5. Set up HLOD layers to replace level LODs
6. Update any Blueprint or C++ code that references streaming levels
7. Replace `ULevelStreaming` API calls with `UWorldPartitionSubsystem` queries
8. Rebuild navigation mesh
9. Rebuild lighting
10. Test thoroughly -- streaming behavior will differ from World Composition

### Common Migration Issues

- **Landscape tiles:** World Composition landscapes split across sub-levels are merged into a single partitioned landscape. Verify seams.
- **Level Blueprints:** All sub-level Blueprint logic must move to actors or GameMode. Level Blueprints do not survive conversion.
- **Streaming volumes:** Replace with World Partition grid configuration and data layers.
- **Level bounds:** World Partition calculates bounds automatically. Remove manual bounds configuration.
- **References to sub-levels:** Any hard references to streaming level paths will break. Use soft object references to actors instead.
