# UE Python API — InterchangeOpenUSDImport Module

**4 types** from the `InterchangeOpenUSDImport` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `InterchangeUsdContext`, `InterchangeUsdPipeline`, `InterchangeUSDTranslator`, `InterchangeUsdTranslatorSettings`

---

## Classes

### `unreal.InterchangeUsdContext`
Inherits: `Object` | Header: `InterchangeUsdContext.h`

Interchange Usd Context

**Methods** (2):
  - `get_stage_id()` -> `int64` — Returns the ID the provided stage has within the USDUtilsâ singleton StageCache.
  - `set_stage_id(stage_id)` -> `None` — Sets the ID of a particular stage from the UsdUtilsâ singleton StageCache. If this corresponds to a valid USD Stage, t...

### `unreal.InterchangeUsdPipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeUSDPipeline.h`

Interchange Usd Pipeline

**Properties** (5):
  - `generate_primvar_compatible_materials`: `bool` — [Read-Write] Imported meshes will place their primvars on arbitrary UV set indices (e.g. âst2â o...
  - `geometry_purpose`: `int` — [Read-Write] Only import translated nodes from imageable prims (Xforms, Meshes, etc.) with these spe...
  - `import_primvars`: `InterchangeUsdPrimvar` — [Read-Write] Setting to tell what primvars have to be attached to the MeshDescription (InterchangeUs...
  - `import_pseudo_root`: `bool` — [Read-Write] The translator always emits a scene node for the stage pseudoroot. Setting this option ...
  - `pipeline_display_name`: `str` — [Read-Write] (str)

### `unreal.InterchangeUSDTranslator`
Inherits: `InterchangeTranslatorBase` | Header: `InterchangeUsdTranslator.h`

For now, USD Interchange (FBX parity) translator supports textures, materials and static meshes

### `unreal.InterchangeUsdTranslatorSettings`
Inherits: `InterchangeTranslatorSettings` | Header: `InterchangeUsdTranslator.h`

Interchange Usd Translator Settings
