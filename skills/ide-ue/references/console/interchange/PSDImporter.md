# UE Python API — PSDImporter Module

**8 types** from the `PSDImporter` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PSDFileDocument`, `PSDFileLayer`, `PSDFileLayerId`, `PSDDocument`, `PSDQuadActor`, `PSDQuadMeshActor`, `PSDFileLayerImportOperation`, `PSDFileLayerType`

---

## Classes

### `unreal.PSDFileDocument`
Inherits: `StructBase` | Header: `PSDFile.h`

Representation of a PSD file document.

### `unreal.PSDFileLayer`
Inherits: `StructBase` | Header: `PSDFile.h`

PSDFile Layer

**Properties** (12):
  - `blend_mode`: `PSDBlendMode` [Read-Only] — [Read-Only] The blending mode applied to the layer. (PSDBlendMode)
  - `bounds`: `IntRect` [Read-Only] — [Read-Only] Bounds of the layer. (IntRect)
  - `clipping`: `int` [Read-Only] — [Read-Only] Whether this is a clipping layer. (uint8)
  - `id`: `PSDFileLayerId` [Read-Only] — [Read-Only] Index, Name tuple. (PSDFileLayerId)
  - `import_operation`: `PSDFileLayerImportOperation` [Read-Only] — [Read-Only] User specified import operation/option. (PSDFileLayerImportOperation)
  - `is_supported_layer_type`: `bool` [Read-Only] — [Read-Only] A flag indicating whether the layerâs type is supported. (bool)
  - `is_visible`: `bool` [Read-Only] — [Read-Only] Visibility state of the layer. (bool)
  - `mask_bounds`: `IntRect` [Read-Only] — [Read-Only] Bounds of the mask. (IntRect)
  - `mask_default_value`: `float` [Read-Only] — [Read-Only] Value of the mask outside the bounds. (float)
  - `opacity`: `float` [Read-Only] — [Read-Only] Opacity level of the layer, value ranging from 0.0 (fully transparent) to 1.0 (fully opa...
  - `parent_id`: `type` [Read-Only] — [Read-Only] (âundefinedâ)
  - `type`: `PSDFileLayerType` [Read-Only] — [Read-Only] (PSDFileLayerType)

### `unreal.PSDFileLayerId`
Inherits: `StructBase` | Header: `PSDFile.h`

PSDFile Layer Id

**Properties** (2):
  - `index`: `int` [Read-Only] — [Read-Only] Maps to the layer index in the PSD file. (int32)
  - `name`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.PSDDocument`
Inherits: `Object` | Header: `PSDDocument.h`

class: UPSDDocument brief: Represents a PSD document in Unreal Engine. This class is used to store information about a PSD document, such as its name, size, and layers. It is intended to be used as pa...

**Methods** (4):
  - `get_document_name()` -> `str` — Get Document Name
  - `get_layers()` -> `Array [ PSDFileLayer ]` — Get Layers
  - `get_size()` -> `IntPoint` — Get Size
  - `were_layers_resized_on_import()` -> `bool` — Were Layers Resized on Import

**Properties** (5):
  - `document_name`: `str` [Read-Only] — [Read-Only] Original document name, the asset may differ (if the user renamed it). (str)
  - `import_invisible_layers`: `bool` — [Read-Write] (bool)
  - `layers`: `None` [Read-Only] — [Read-Only] (Array[PSDFileLayer])
  - `resize_layers_to_document`: `bool` — [Read-Write] (bool)
  - `size`: `IntPoint` [Read-Only] — [Read-Only] Resolution (in pixels); (IntPoint)

### `unreal.PSDQuadActor`
Inherits: `Actor` | Header: `PSDQuadActor.h`

PSDQuad Actor

### `unreal.PSDQuadMeshActor`
Inherits: `Actor` | Header: `PSDQuadMeshActor.h`

PSDQuad Mesh Actor

### `unreal.PSDFileLayerImportOperation`
Inherits: `EnumBase` | Header: `PSDFile.h`

EPSDFile Layer Import Operation

**Properties** (4):
  - `IGNORE`: `PSDFileLayerImportOperation = Ellipsis` — 0
  - `IMPORT`: `PSDFileLayerImportOperation = Ellipsis` — 1
  - `IMPORT_MERGED`: `PSDFileLayerImportOperation = Ellipsis` — 2
  - `RASTERIZE`: `PSDFileLayerImportOperation = Ellipsis` — 4

### `unreal.PSDFileLayerType`
Inherits: `EnumBase` | Header: `PSDFile.h`

EPSDFile Layer Type

**Properties** (2):
  - `ANY`: `PSDFileLayerType = Ellipsis` — 0
  - `GROUP`: `PSDFileLayerType = Ellipsis` — 1
