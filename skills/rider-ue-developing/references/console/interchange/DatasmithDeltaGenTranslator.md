# UE Python API — DatasmithDeltaGenTranslator Module

**2 types** from the `DatasmithDeltaGenTranslator` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DatasmithDeltaGenImportOptions`, `ShadowTextureMode`

---

## Classes

### `unreal.DatasmithDeltaGenImportOptions`
Inherits: `DatasmithFBXImportOptions` | Header: `DatasmithDeltaGenImportOptions.h`

Datasmith Delta Gen Import Options

**Properties** (9):
  - `import_pos`: `bool` — [Read-Write] import POS files (bool)
  - `import_tml`: `bool` — [Read-Write] import TML files (bool)
  - `import_var`: `bool` — [Read-Write] import VAR files (bool)
  - `pos_path`: `FilePath` — [Read-Write] Path to the*.pos file. By default it will search for a*.pos file in the same folder as ...
  - `remove_invisible_nodes`: `bool` — [Read-Write] Donât keep nodes that marked invisible in FBX(an din the original scene), except swit...
  - `shadow_texture_mode`: `ShadowTextureMode` — [Read-Write] How to handle shadow textures (ShadowTextureMode)
  - `simplify_node_hierarchy`: `bool` — [Read-Write] Collapse nodes that have identity transform, have no mesh and not used in animation/var...
  - `tml_path`: `FilePath` — [Read-Write] Path to the*.tml file. By default it will search for a*.tml file in the same folder as ...
  - `var_path`: `FilePath` — [Read-Write] Path to the*.var file. By default it will search for a*.var file in the same folder as ...

### `unreal.ShadowTextureMode`
Inherits: `EnumBase` | Header: `DatasmithDeltaGenImportOptions.h`

EShadow Texture Mode

**Properties** (4):
  - `AMBIENT_OCCLUSION`: `ShadowTextureMode = Ellipsis` — Use shadow textures as ambient occlusion maps 1
  - `AMBIENT_OCCLUSION_AND_MULTIPLIER`: `ShadowTextureMode = Ellipsis` — Use shadow textures as ambient occlusion maps as well as multipliers for base color and specular 3
  - `IGNORE`: `ShadowTextureMode = Ellipsis` — Ignore exported shadow textures 0
  - `MULTIPLIER`: `ShadowTextureMode = Ellipsis` — Use shadow textures as multipliers for base color and specular 2
