# UE Python API — DatasmithVREDTranslator Module

**14 types** from the `DatasmithVREDTranslator` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VREDCppVariant`, `VREDCppVariantCamera`, `VREDCppVariantCameraOption`, `VREDCppVariantGeometry`, `VREDCppVariantGeometryOption`, `VREDCppVariantLight`, `VREDCppVariantLightOption`, `VREDCppVariantMaterial`, `VREDCppVariantMaterialOption`, `VREDCppVariantSet`, `VREDCppVariantTransform`, `VREDCppVariantTransformOption`, `DatasmithVREDImportOptions`, `VREDCppVariantType`

---

## Classes

### `unreal.VREDCppVariant`
Inherits: `TableRowBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant

**Properties** (8):
  - `camera`: `VREDCppVariantCamera` — [Read-Write] (VREDCppVariantCamera)
  - `geometry`: `VREDCppVariantGeometry` — [Read-Write] (VREDCppVariantGeometry)
  - `light`: `VREDCppVariantLight` — [Read-Write] (VREDCppVariantLight)
  - `material`: `VREDCppVariantMaterial` — [Read-Write] (VREDCppVariantMaterial)
  - `name`: `str` — [Read-Write] (str)
  - `transform`: `VREDCppVariantTransform` — [Read-Write] (VREDCppVariantTransform)
  - `type`: `VREDCppVariantType` — [Read-Write] (VREDCppVariantType)
  - `variant_set`: `VREDCppVariantSet` — [Read-Write] (VREDCppVariantSet)

### `unreal.VREDCppVariantCamera`
Inherits: `StructBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant Camera

**Properties** (1):
  - `options`: `None` — [Read-Write] (Array[VREDCppVariantCameraOption])

### `unreal.VREDCppVariantCameraOption`
Inherits: `StructBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant Camera Option

**Properties** (3):
  - `location`: `Vector` — [Read-Write] (Vector)
  - `name`: `str` — [Read-Write] (str)
  - `rotation`: `Rotator` — [Read-Write] (Rotator)

### `unreal.VREDCppVariantGeometry`
Inherits: `StructBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant Geometry

**Properties** (2):
  - `options`: `None` — [Read-Write] (Array[VREDCppVariantGeometryOption])
  - `target_nodes`: `None` — [Read-Write] (Array[str])

### `unreal.VREDCppVariantGeometryOption`
Inherits: `StructBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant Geometry Option

**Properties** (3):
  - `hidden_meshes`: `None` — [Read-Write] (Array[str])
  - `name`: `str` — [Read-Write] (str)
  - `visible_meshes`: `None` — [Read-Write] (Array[str])

### `unreal.VREDCppVariantLight`
Inherits: `StructBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant Light

**Properties** (2):
  - `options`: `None` — [Read-Write] (Array[VREDCppVariantLightOption])
  - `target_nodes`: `None` — [Read-Write] (Array[str])

### `unreal.VREDCppVariantLightOption`
Inherits: `StructBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant Light Option

**Properties** (1):
  - `name`: `str` — [Read-Write] (str)

### `unreal.VREDCppVariantMaterial`
Inherits: `StructBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant Material

**Properties** (2):
  - `options`: `None` — [Read-Write] (Array[VREDCppVariantMaterialOption])
  - `target_nodes`: `None` — [Read-Write] (Array[str])

### `unreal.VREDCppVariantMaterialOption`
Inherits: `StructBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant Material Option

**Properties** (1):
  - `name`: `str` — [Read-Write] (str)

### `unreal.VREDCppVariantSet`
Inherits: `StructBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant Set

**Properties** (5):
  - `anim_clips`: `None` — [Read-Write] (Array[str])
  - `chosen_options`: `None` — [Read-Write] (Array[str])
  - `sequential_animation`: `bool` — [Read-Write] (bool)
  - `target_variant_names`: `None` — [Read-Write] (Array[str])
  - `variant_set_group_name`: `str` — [Read-Write] (str)

### `unreal.VREDCppVariantTransform`
Inherits: `StructBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant Transform

**Properties** (2):
  - `options`: `None` — [Read-Write] (Array[VREDCppVariantTransformOption])
  - `target_nodes`: `None` — [Read-Write] (Array[str])

### `unreal.VREDCppVariantTransformOption`
Inherits: `StructBase` | Header: `DatasmithVREDImportData.h`

VREDCpp Variant Transform Option

**Properties** (2):
  - `name`: `str` — [Read-Write] (str)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.DatasmithVREDImportOptions`
Inherits: `DatasmithFBXImportOptions` | Header: `DatasmithVREDImportOptions.h`

Datasmith VREDImport Options

**Properties** (9):
  - `clean_var`: `bool` — [Read-Write] Removes empty variants, variant sets and invalid options. All discarded items will be l...
  - `clip_info_path`: `FilePath` — [Read-Write] Path to the*.clips file. By default it will search for a*.clips file in the same folder...
  - `import_clip_info`: `bool` — [Read-Write] Uses the*.clips file saved alongside the exported FBX to import information about anima...
  - `import_light_info`: `bool` — [Read-Write] Uses the*.lights file saved alongside the exported FBX to import extra information abou...
  - `import_mats`: `bool` — [Read-Write] Uses the*.mats file saved alongside the exported FBX for a more accurate material repro...
  - `import_var`: `bool` — [Read-Write] Uses the*.var file saved alongside the exported FBX (bool)
  - `light_info_path`: `FilePath` — [Read-Write] Path to the*.lights file. By default it will search for a*.light file in the same folde...
  - `mats_path`: `FilePath` — [Read-Write] Path to the*.mats file. By default it will search for a*.mats file in the same folder a...
  - `var_path`: `FilePath` — [Read-Write] Path to the*.var file. By default it will search for a*.var file in the same folder as ...

### `unreal.VREDCppVariantType`
Inherits: `EnumBase` | Header: `DatasmithVREDImportData.h`

EVREDCpp Variant Type

**Properties** (7):
  - `CAMERA`: `VREDCppVariantType = Ellipsis` — 1
  - `GEOMETRY`: `VREDCppVariantType = Ellipsis` — 2
  - `LIGHT`: `VREDCppVariantType = Ellipsis` — 6
  - `MATERIAL`: `VREDCppVariantType = Ellipsis` — 4
  - `TRANSFORM`: `VREDCppVariantType = Ellipsis` — 5
  - `UNSUPPORTED`: `VREDCppVariantType = Ellipsis` — 0
  - `VARIANT_SET`: `VREDCppVariantType = Ellipsis` — 3
