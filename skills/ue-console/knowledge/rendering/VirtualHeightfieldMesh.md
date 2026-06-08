# UE Python API — VirtualHeightfieldMesh Module

**4 types** from the `VirtualHeightfieldMesh` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `HeightfieldMinMaxTexture`, `MaterialExpressionHeightfieldMinMaxTexture`, `VirtualHeightfieldMesh`, `VirtualHeightfieldMeshComponent`

---

## Classes

### `unreal.HeightfieldMinMaxTexture`
Inherits: `Object` | Header: `HeightfieldMinMaxTexture.h`

Container for a UTexture2D that can be built from a FHeightfieldMinMaxTextureBuildDesc description.

**Properties** (4):
  - `lod_bias_min_max_texture`: `Texture2D` [Read-Only] — [Read-Only] A LodBias MinMax texture derived from the LodBias texture (Texture2D)
  - `lod_bias_texture`: `Texture2D` [Read-Only] — [Read-Only] A LodBias texture derived from the Height MinMax texture (Texture2D)
  - `max_cpu_levels`: `int` [Read-Only] — [Read-Only] The number of mip levels to clone for CPU access. (int32)
  - `texture`: `Texture2D` [Read-Only] — [Read-Only] The Height MinMax texture. (Texture2D)

### `unreal.MaterialExpressionHeightfieldMinMaxTexture`
Inherits: `MaterialExpression` | Header: `HeightfieldMinMaxTextureMaterialExpression.h`

Node which outputs a texture object contained in a UHeightfieldMinMaxTexture.

**Properties** (2):
  - `min_max_texture`: `HeightfieldMinMaxTexture` — [Read-Write] (HeightfieldMinMaxTexture)
  - `sampler_type`: `MaterialSamplerType` — [Read-Write] (MaterialSamplerType)

### `unreal.VirtualHeightfieldMesh`
Inherits: `Actor` | Header: `VirtualHeightfieldMeshActor.h`

Virtual Heightfield Mesh

**Properties** (1):
  - `virtual_heightfield_mesh_component`: `VirtualHeightfieldMeshComponent` [Read-Only] — [Read-Only] Component for rendering the big mesh. (VirtualHeightfieldMeshComponent)

### `unreal.VirtualHeightfieldMeshComponent`
Inherits: `PrimitiveComponent` | Header: `VirtualHeightfieldMeshComponent.h`

Component to render a heightfield mesh using a virtual texture heightmap.

**Properties** (2):
  - `min_max_texture`: `HeightfieldMinMaxTexture` [Read-Only] — [Read-Only] Texture object containing minimum and maximum height values. (HeightfieldMinMaxTexture)
  - `num_min_max_texture_build_levels`: `int` [Read-Only] — [Read-Only] Number of levels to build in the MinMax Texture. A default value of 0 will build all lev...
