# UE Python API — MeshModelingToolsExp Module

**2 types** from the `MeshModelingToolsExp` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BakeMultiTexture2DProperties`, `BakeScaleMethod`

---

## Classes

### `unreal.BakeMultiTexture2DProperties`
Inherits: `InteractiveToolPropertySet` | Header: `BakeMeshAttributeToolCommon.h`

Bake Multi Texture 2DProperties

**Properties** (1):
  - `all_source_textures`: `None` [Read-Only] — [Read-Only] The set of all source textures from all input materials (Array[Texture2D])

### `unreal.BakeScaleMethod`
Inherits: `EnumBase` | Header: `BakeTransformTool.h`

EBake Scale Method

**Properties** (3):
  - `BAKE_FULL_SCALE`: `BakeScaleMethod = Ellipsis` — bake all scale information, so the component has scale of 1 on all axes 0
  - `BAKE_NONUNIFORM_SCALE`: `BakeScaleMethod = Ellipsis` — bake the non-uniform scale, so the component has a uniform scale 1
  - `DO_NOT_BAKE_SCALE`: `BakeScaleMethod = Ellipsis` — do not bake any scaling 2
