# UE Python API — PFMExporter Module

**3 types** from the `PFMExporter` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PFMExporterAPIImpl`, `PFMExporterBlueprintAPI`, `PFMExporterBlueprintLib`

---

## Classes

### `unreal.PFMExporterAPIImpl`
Inherits: `Object` | Header: `PFMExporterBlueprintAPIImpl.h`

Blueprint API interface implementation

**Methods** (1):
  - `export_pfm(src_mesh, origin, width, height, file_name)` -> `bool` — Generate PFM file from static mesh. The UV channel must be defined, assigned range 0..1 used as screen surface. Origin a...

### `unreal.PFMExporterBlueprintAPI`
Inherits: `Interface` | Header: `IPFMExporterBlueprintAPI.h`

PFMExporter Blueprint API

**Methods** (1):
  - `export_pfm(src_mesh, origin, width, height, file_name)` -> `bool` — Generate PFM file from static mesh. The UV channel must be defined, assigned range 0..1 used as screen surface. Origin a...

### `unreal.PFMExporterBlueprintLib`
Inherits: `BlueprintFunctionLibrary` | Header: `PFMExporterBlueprintLib.h`

Blueprint API function library

**Methods** (1):
  - `get_api()` -> `PFMExporterBlueprintAPI` [classmethod] — Return Display Cluster API interface.
