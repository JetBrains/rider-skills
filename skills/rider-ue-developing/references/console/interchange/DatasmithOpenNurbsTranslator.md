# UE Python API — DatasmithOpenNurbsTranslator Module

**3 types** from the `DatasmithOpenNurbsTranslator` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DatasmithOpenNurbsOptions`, `DatasmithOpenNurbsImportOptions`, `DatasmithOpenNurbsBrepTessellatedSource`

---

## Classes

### `unreal.DatasmithOpenNurbsOptions`
Inherits: `DatasmithTessellationOptions` | Header: `DatasmithOpenNurbsImportOptions.h`

Datasmith Open Nurbs Options

**Properties** (1):
  - `geometry`: `DatasmithOpenNurbsBrepTessellatedSource` — [Read-Write] (DatasmithOpenNurbsBrepTessellatedSource)

### `unreal.DatasmithOpenNurbsImportOptions`
Inherits: `DatasmithOptionsBase` | Header: `DatasmithOpenNurbsImportOptions.h`

Datasmith Open Nurbs Import Options

**Properties** (1):
  - `options`: `DatasmithOpenNurbsOptions` — [Read-Write] (DatasmithOpenNurbsOptions)

### `unreal.DatasmithOpenNurbsBrepTessellatedSource`
Inherits: `EnumBase` | Header: `DatasmithOpenNurbsImportOptions.h`

EDatasmith Open Nurbs Brep Tessellated Source

**Properties** (2):
  - `USE_RENDER_MESHES`: `DatasmithOpenNurbsBrepTessellatedSource = Ellipsis` — Use render meshes stored in the scene file 1
  - `USE_UNREAL_NURBS_TESSELLATION`: `DatasmithOpenNurbsBrepTessellatedSource = Ellipsis` — Tessellate all Breps on import 0
