# UE Python API — MetaHumanDefaultEditorPipeline Module

**2 types** from the `MetaHumanDefaultEditorPipeline` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LODBakingUtility`, `MetaHumanDefaultEditorPipelineActor`

---

## Classes

### `unreal.LODBakingUtility`
Inherits: `EditorUtilityObject` | Header: `MetaHumanDefaultEditorPipelineBase.h`

Base class for an Editor Utility Object that is capable of baking the Normals of a skeletal mesh into a texture

**Methods** (1):
  - `bake_tangent_normals(target, debug)` -> `Array [ Texture2D ]` — Bake Tangent Normals

### `unreal.MetaHumanDefaultEditorPipelineActor`
Inherits: `MetaHumanCharacterEditorActor` | Header: `MetaHumanDefaultEditorPipelineActor.h`

A preview actor that supports all features of the MetaHuman Default Character Pipeline

**Properties** (9):
  - `beard_component`: `GroomComponent` [Read-Only] — [Read-Only] (GroomComponent)
  - `cloth_components`: `None` [Read-Only] — [Read-Only] (Array[ChaosClothComponent])
  - `eyebrows_component`: `GroomComponent` [Read-Only] — [Read-Only] (GroomComponent)
  - `eyelashes_component`: `GroomComponent` [Read-Only] — [Read-Only] (GroomComponent)
  - `hair_component`: `GroomComponent` [Read-Only] — [Read-Only] (GroomComponent)
  - `mustache_component`: `GroomComponent` [Read-Only] — [Read-Only] (GroomComponent)
  - `outfit_mesh_components`: `None` [Read-Only] — [Read-Only] (Array[SkeletalMeshComponent])
  - `peachfuzz_component`: `GroomComponent` [Read-Only] — [Read-Only] (GroomComponent)
  - `skeletal_mesh_components`: `None` [Read-Only] — [Read-Only] (Array[SkeletalMeshComponent])
