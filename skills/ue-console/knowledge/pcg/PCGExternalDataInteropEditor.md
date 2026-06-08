# UE Python API — PCGExternalDataInteropEditor Module

**3 types** from the `PCGExternalDataInteropEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PCGLoadAlembicBPData`, `PCGAlembicToPCGAssetExporter`, `PCGLoadAlembicFunctionLibrary`

---

## Classes

### `unreal.PCGLoadAlembicBPData`
Inherits: `StructBase` | Header: `PCGLoadAlembic.h`

PCGLoad Alembic BPData

**Methods** (1):
  - `setup_from_standard(setup)` -> `None` — Setup from Standard

**Properties** (3):
  - `attribute_mapping`: `None` — [Read-Write] (Map[str,PCGAttributePropertyInputSelector])
  - `conversion_flip_handedness`: `bool` — [Read-Write] Flips rotation direction (W), useful together with swizzling (bool)
  - `conversion_settings`: `AbcConversionSettings` — [Read-Write] Conversion settings that will be applied on the transform only (AbcConversionSettings)

### `unreal.PCGAlembicToPCGAssetExporter`
Inherits: `PCGAssetExporter` | Header: `PCGLoadAlembic.h`

PCGAlembic to PCGAsset Exporter

### `unreal.PCGLoadAlembicFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGLoadAlembic.h`

PCGLoad Alembic Function Library

**Methods** (3):
  - `export_alembic_file_to_pcg(settings, parameters = [True,'','',True])` -> `None` [classmethod] — Export Alembic File to PCG
  - `load_alembic_file_to_pcg(settings, target_outer)` -> `PCGDataCollection` [classmethod] — Load Alembic File to PCG deprecated: The LoadAlembicFileToPCG function has been replaced by ExportAlembicFileToPCG
  - `setup_from_standard(data, setup)` -> `PCGLoadAlembicBPData` [classmethod] — Setup from Standard
