# UE Python API — FoliageEdit Module

**5 types** from the `FoliageEdit` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FoliageType_ActorFactory`, `FoliageType_InstancedStaticMeshFactory`, `LandscapeGrassTypeFactory`, `ProceduralFoliageEditorLibrary`, `ProceduralFoliageSpawnerFactory`

---

## Classes

### `unreal.FoliageType_ActorFactory`
Inherits: `Factory` | Header: `FoliageTypeFactory.h`

Foliage Type Actor Factory

### `unreal.FoliageType_InstancedStaticMeshFactory`
Inherits: `Factory` | Header: `FoliageTypeFactory.h`

Foliage Type Instanced Static Mesh Factory

### `unreal.LandscapeGrassTypeFactory`
Inherits: `Factory` | Header: `LandscapeGrassTypeFactory.h`

Landscape Grass Type Factory

### `unreal.ProceduralFoliageEditorLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ProceduralFoliageEditorLibrary.h`

Procedural Foliage Editor Library

**Methods** (4):
  - `clear_procedural_foliage_components(procedural_foliage_components)` -> `None` [classmethod] — Clear Procedural Foliage Components
  - `clear_procedural_foliage_volumes(procedural_foliage_volumes)` -> `None` [classmethod] — Clear Procedural Foliage Volumes
  - `resimulate_procedural_foliage_components(procedural_foliage_components)` -> `None` [classmethod] — Resimulate Procedural Foliage Components
  - `resimulate_procedural_foliage_volumes(procedural_foliage_volumes)` -> `None` [classmethod] — Resimulate Procedural Foliage Volumes

### `unreal.ProceduralFoliageSpawnerFactory`
Inherits: `Factory` | Header: `ProceduralFoliageSpawnerFactory.h`

Procedural Foliage Spawner Factory
