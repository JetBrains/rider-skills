# UE Python API — MetaHumanDefaultPipeline Module

**16 types** from the `MetaHumanDefaultPipeline` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaHumanDefaultAssemblyOutput`, `MetaHumanGroomPipelineAssemblyOutput`, `MetaHumanMaterialParameter`, `MetaHumanMeshPartOutput`, `MetaHumanOutfitPipelineAssemblyOutput`, `MetaHumanSkeletalMeshPipelineAssemblyOutput`, `MetaHumanDefaultGroomPipeline`, `MetaHumanDefaultPipeline`, `MetaHumanDefaultPipelineBase`, `MetaHumanDefaultPipelineLegacy`, `MetaHumanDefaultPipelineUEFN`, `MetaHumanDefaultSkeletalMeshPipeline`, `MetaHumanGroomPipeline`, `MetaHumanOutfitPipeline`, `MetaHumanSkeletalMeshPipeline`, `MetaHumanRuntimeMaterialParameterType`

---

## Classes

### `unreal.MetaHumanDefaultAssemblyOutput`
Inherits: `StructBase` | Header: `MetaHumanDefaultPipelineBase.h`

MetaHuman Default Assembly Output

**Properties** (13):
  - `beard`: `MetaHumanGroomPipelineAssemblyOutput` [Read-Only] — [Read-Only] (MetaHumanGroomPipelineAssemblyOutput)
  - `body_mesh`: `SkeletalMesh` [Read-Only] — [Read-Only] (SkeletalMesh)
  - `bottom`: `MetaHumanSkeletalMeshPipelineAssemblyOutput` [Read-Only] — [Read-Only] (MetaHumanSkeletalMeshPipelineAssemblyOutput)
  - `cloth_data`: `None` [Read-Only] — [Read-Only] (Array[MetaHumanOutfitPipelineAssemblyOutput])
  - `eyebrows`: `MetaHumanGroomPipelineAssemblyOutput` [Read-Only] — [Read-Only] (MetaHumanGroomPipelineAssemblyOutput)
  - `eyelashes`: `MetaHumanGroomPipelineAssemblyOutput` [Read-Only] — [Read-Only] (MetaHumanGroomPipelineAssemblyOutput)
  - `face_mesh`: `SkeletalMesh` [Read-Only] — [Read-Only] (SkeletalMesh)
  - `hair`: `MetaHumanGroomPipelineAssemblyOutput` [Read-Only] — [Read-Only] (MetaHumanGroomPipelineAssemblyOutput)
  - `mustache`: `MetaHumanGroomPipelineAssemblyOutput` [Read-Only] — [Read-Only] (MetaHumanGroomPipelineAssemblyOutput)
  - `peachfuzz`: `MetaHumanGroomPipelineAssemblyOutput` [Read-Only] — [Read-Only] (MetaHumanGroomPipelineAssemblyOutput)
  - `shoes`: `MetaHumanSkeletalMeshPipelineAssemblyOutput` [Read-Only] — [Read-Only] (MetaHumanSkeletalMeshPipelineAssemblyOutput)
  - `skeletal_mesh_data`: `None` [Read-Only] — [Read-Only] (Array[MetaHumanSkeletalMeshPipelineAssemblyOutput])
  - `top`: `MetaHumanSkeletalMeshPipelineAssemblyOutput` [Read-Only] — [Read-Only] (MetaHumanSkeletalMeshPipelineAssemblyOutput)

### `unreal.MetaHumanGroomPipelineAssemblyOutput`
Inherits: `StructBase` | Header: `MetaHumanGroomPipeline.h`

MetaHuman Groom Pipeline Assembly Output

### `unreal.MetaHumanMaterialParameter`
Inherits: `StructBase` | Header: `MetaHumanMaterialPipelineCommon.h`

Used to describe material parameter that we can modify on the material obtained from the slot name or index.

### `unreal.MetaHumanMeshPartOutput`
Inherits: `StructBase` | Header: `MetaHumanDefaultPipelineBase.h`

MetaHuman Mesh Part Output

**Properties** (3):
  - `baked_materials`: `None` [Read-Only] — [Read-Only] (Array[MaterialInterface])
  - `mesh`: `SkeletalMesh` [Read-Only] — [Read-Only] (SkeletalMesh)
  - `override_materials`: `None` [Read-Only] — For now these additional materials are not used.
Theyâre here as an example of additional data tha...

### `unreal.MetaHumanOutfitPipelineAssemblyOutput`
Inherits: `StructBase` | Header: `MetaHumanOutfitPipeline.h`

MetaHuman Outfit Pipeline Assembly Output

### `unreal.MetaHumanSkeletalMeshPipelineAssemblyOutput`
Inherits: `StructBase` | Header: `MetaHumanSkeletalMeshPipeline.h`

MetaHuman Skeletal Mesh Pipeline Assembly Output

### `unreal.MetaHumanDefaultGroomPipeline`
Inherits: `MetaHumanGroomPipeline` | Header: `MetaHumanDefaultGroomPipeline.h`

Groom pipeline used for compatibility with the original MetaHumanCreator.

### `unreal.MetaHumanDefaultPipeline`
Inherits: `MetaHumanDefaultPipelineBase` | Header: `MetaHumanDefaultPipeline.h`

The default pipeline for building MetaHumans.

### `unreal.MetaHumanDefaultPipelineBase`
Inherits: `MetaHumanCollectionPipeline` | Header: `MetaHumanDefaultPipelineBase.h`

The common base class for the current and legacy default MetaHuman pipelines.

### `unreal.MetaHumanDefaultPipelineLegacy`
Inherits: `MetaHumanDefaultPipelineBase` | Header: `MetaHumanDefaultPipelineLegacy.h`

Pipeline for building legacy actor-based MetaHumans.

### `unreal.MetaHumanDefaultPipelineUEFN`
Inherits: `MetaHumanDefaultPipelineLegacy` | Header: `MetaHumanDefaultPipelineUEFN.h`

Pipeline for building UEFN actor-based MetaHumans.

### `unreal.MetaHumanDefaultSkeletalMeshPipeline`
Inherits: `MetaHumanSkeletalMeshPipeline` | Header: `MetaHumanDefaultSkeletalMeshPipeline.h`

Skeletal Mesh pipeline used for compatibility with the original MetaHumanCreator.

### `unreal.MetaHumanGroomPipeline`
Inherits: `MetaHumanItemPipeline` | Header: `MetaHumanGroomPipeline.h`

MetaHuman Groom Pipeline

**Methods** (1):
  - `apply_groom_assembly_output_to_groom_component(groom_assembly_output, groom_component)` -> `None` [classmethod] — Apply Groom Assembly Output to Groom Component

### `unreal.MetaHumanOutfitPipeline`
Inherits: `MetaHumanItemPipeline` | Header: `MetaHumanOutfitPipeline.h`

MetaHuman Outfit Pipeline

**Methods** (2):
  - `apply_outfit_assembly_output_to_cloth_component(outfit_assembly_output, cloth_component)` -> `None` [classmethod] — Apply Outfit Assembly Output to Cloth Component
  - `apply_outfit_assembly_output_to_mesh_component(outfit_assembly_output, mesh_component)` -> `None` [classmethod] — Apply Outfit Assembly Output to Mesh Component

### `unreal.MetaHumanSkeletalMeshPipeline`
Inherits: `MetaHumanItemPipeline` | Header: `MetaHumanSkeletalMeshPipeline.h`

MetaHuman Skeletal Mesh Pipeline

**Methods** (1):
  - `apply_skeletal_mesh_assembly_output_to_skeletal_mesh_component(assembly_output, component, leader_component)` -> `None` [classmethod] — Apply Skeletal Mesh Assembly Output to Skeletal Mesh Component

### `unreal.MetaHumanRuntimeMaterialParameterType`
Inherits: `EnumBase` | Header: `MetaHumanMaterialPipelineCommon.h`

Material parameters that can be changed at runtime

**Properties** (9):
  - `DOUBLE_VECTOR`: `MetaHumanRuntimeMaterialParameterType = Ellipsis` — 3
  - `FONT`: `MetaHumanRuntimeMaterialParameterType = Ellipsis` — 6
  - `RUNTIME_VIRTUAL_TEXTURE`: `MetaHumanRuntimeMaterialParameterType = Ellipsis` — 7
  - `SCALAR`: `MetaHumanRuntimeMaterialParameterType = Ellipsis` — 1
  - `SPARSE_VOLUME_TEXTURE`: `MetaHumanRuntimeMaterialParameterType = Ellipsis` — 8
  - `TEXTURE`: `MetaHumanRuntimeMaterialParameterType = Ellipsis` — 4
  - `TEXTURE_COLLECTION`: `MetaHumanRuntimeMaterialParameterType = Ellipsis` — 5
  - `TOGGLE`: `MetaHumanRuntimeMaterialParameterType = Ellipsis` — 0
  - `VECTOR`: `MetaHumanRuntimeMaterialParameterType = Ellipsis` — 2
