# UE Python API — PCGEditor Module

**7 types** from the `PCGEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PCGBuilderSettingsFactory`, `PCGComputeSourceFactory`, `PCGGraphFactory`, `PCGGraphInstanceFactory`, `PCGLevelToAsset`, `PCGWorldPartitionBuilderHelper`, `PCGEditorDoubleClickAction`

---

## Classes

### `unreal.PCGBuilderSettingsFactory`
Inherits: `Factory` | Header: `PCGBuilderSettingsFactory.h`

PCGBuilder Settings Factory

### `unreal.PCGComputeSourceFactory`
Inherits: `Factory` | Header: `PCGComputeSourceFactory.h`

PCGCompute Source Factory

### `unreal.PCGGraphFactory`
Inherits: `Factory` | Header: `PCGGraphFactory.h`

PCGGraph Factory

### `unreal.PCGGraphInstanceFactory`
Inherits: `Factory` | Header: `PCGGraphFactory.h`

PCGGraph Instance Factory

### `unreal.PCGLevelToAsset`
Inherits: `PCGAssetExporter` | Header: `PCGLevelToAsset.h`

PCGLevel to Asset

**Methods** (3):
  - `bp_export_world(world, package_name, asset)` -> `bool` — Parses the world and fills in the provided data asset. Implement this in BP to drive the generation in a custom manner.
  - `get_world()` -> `World` — Get World
  - `set_world(world)` -> `None` — Set World

### `unreal.PCGWorldPartitionBuilderHelper`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGWorldPartitionBuilder.h`

PCGWorld Partition Builder Helper

**Methods** (1):
  - `add_asset_to_submit_allow_list(path)` -> `None` [classmethod] — Notify the running PCG Builder that this asset can be saved/submitted as part of the builder execution if it is dirty

### `unreal.PCGEditorDoubleClickAction`
Inherits: `EnumBase` | Header: `PCGEditorSettings.h`

EPCGEditor Double Click Action

**Properties** (4):
  - `DO_NOTHING`: `PCGEditorDoubleClickAction = Ellipsis` — 0
  - `JUMP_TO_SOURCE_FILE`: `PCGEditorDoubleClickAction = Ellipsis` — 3
  - `TOGGLE_DEBUG_NODE`: `PCGEditorDoubleClickAction = Ellipsis` — 2
  - `TOGGLE_INSPECT_NODE`: `PCGEditorDoubleClickAction = Ellipsis` — 1
