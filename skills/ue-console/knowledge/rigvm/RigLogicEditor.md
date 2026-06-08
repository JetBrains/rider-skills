# UE Python API — RigLogicEditor Module

**3 types** from the `RigLogicEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DNAAssetImportFactory`, `DNAAssetImportUI`, `DNAImporterLibrary`

---

## Classes

### `unreal.DNAAssetImportFactory`
Inherits: `Factory` | Header: `DNAAssetImportFactory.h`

### `unreal.DNAAssetImportUI`
Inherits: `Object` | Header: `DNAAssetImportUI.h`

DNAAsset Import UI

**Methods** (1):
  - `reset_to_default()` -> `None` — Reset to Default

**Properties** (1):
  - `skeletal_mesh`: `SkeletalMesh` — [Read-Write] Skeletal mesh to use for imported DNA asset. When importing DNA, leaving this as âNon...

### `unreal.DNAImporterLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DNAImporterLibrary.h`

DNAImporter Library

**Methods** (1):
  - `import_skeletal_mesh_dna(file_name, mesh)` -> `None` [classmethod] — Import a DNA file onto the specified mesh asset.
