# UE Python API — RigMapper Module

**12 types** from the `RigMapper` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_RigMapper`, `RigMapperFeature`, `RigMapperFeatureDefinitions`, `RigMapperFeatureRange`, `RigMapperMultiplyFeature`, `RigMapperSdkFeature`, `RigMapperSdkKey`, `RigMapperWsFeature`, `RigMapperDefinition`, `RigMapperDefinitionUserData`, `RigMapperLinkedDefinitions`, `RigMapperFeatureType`

---

## Classes

### `unreal.AnimNode_RigMapper`
Inherits: `AnimNode_Base` | Header: `AnimNode_RigMapper.h`

Anim Node Rig Mapper

**Properties** (4):
  - `alpha`: `float` — [Read-Write] (float)
  - `definitions`: `None` — [Read-Write] (Array[RigMapperDefinition])
  - `lod_threshold`: `int` — [Read-Write] * Max LOD that this node is allowed to run
* For example if you have LODThreshold to be...
  - `source_pose`: `PoseLink` — [Read-Write] (PoseLink)

### `unreal.RigMapperFeature`
Inherits: `StructBase` | Header: `RigMapperDefinition.h`

Rig Mapper Feature

**Properties** (1):
  - `name`: `str` — [Read-Write] (str)

### `unreal.RigMapperFeatureDefinitions`
Inherits: `StructBase` | Header: `RigMapperDefinition.h`

Rig Mapper Feature Definitions

**Properties** (3):
  - `multiply`: `None` — [Read-Write] (Array[RigMapperMultiplyFeature])
  - `sd_ks`: `None` — [Read-Write] (Array[RigMapperSdkFeature])
  - `weighted_sums`: `None` — [Read-Write] (Array[RigMapperWsFeature])

### `unreal.RigMapperFeatureRange`
Inherits: `StructBase` | Header: `RigMapperDefinition.h`

Rig Mapper Feature Range

**Properties** (4):
  - `has_lower_bound`: `bool` — [Read-Write] (bool)
  - `has_upper_bound`: `bool` — [Read-Write] (bool)
  - `lower_bound`: `float` — [Read-Write] (double)
  - `upper_bound`: `float` — [Read-Write] (double)

### `unreal.RigMapperMultiplyFeature`
Inherits: `RigMapperFeature` | Header: `RigMapperDefinition.h`

Rig Mapper Multiply Feature

**Properties** (1):
  - `inputs`: `None` — [Read-Write] (Array[str])

### `unreal.RigMapperSdkFeature`
Inherits: `RigMapperFeature` | Header: `RigMapperDefinition.h`

Rig Mapper Sdk Feature

**Properties** (2):
  - `input`: `str` — [Read-Write] (str)
  - `keys`: `None` — [Read-Write] (Array[RigMapperSdkKey])

### `unreal.RigMapperSdkKey`
Inherits: `StructBase` | Header: `RigMapperDefinition.h`

Rig Mapper Sdk Key

**Properties** (2):
  - `in_`: `float` — [Read-Write] (double)
  - `out`: `float` — [Read-Write] (double)

### `unreal.RigMapperWsFeature`
Inherits: `RigMapperFeature` | Header: `RigMapperDefinition.h`

Rig Mapper Ws Feature

**Properties** (2):
  - `inputs`: `None` — [Read-Write] (Map[str, double])
  - `range`: `RigMapperFeatureRange` — [Read-Write] (RigMapperFeatureRange)

### `unreal.RigMapperDefinition`
Inherits: `DataAsset` | Header: `RigMapperDefinition.h`

Rig Mapper Definition

**Methods** (8):
  - `empty()` -> `None` — Empty
  - `export_as_json_file(json_file_path)` -> `bool` — Export as Json File
  - `export_as_json_string()` -> `str or None` — Export as Json String
  - `is_definition_valid(warn = False, force = False)` -> `bool` — Is Definition Valid
  - `load_from_json_file(json_file_path)` -> `bool` — Load from Json File
  - `load_from_json_string(json_string)` -> `bool` — Load from Json String
  - `validate()` -> `bool` — Validate
  - `was_definition_validated()` -> `bool` — Was Definition Validated

**Properties** (5):
  - `features`: `RigMapperFeatureDefinitions` — [Read-Write] (RigMapperFeatureDefinitions)
  - `inputs`: `None` — [Read-Write] (Array[str])
  - `null_outputs`: `None` — [Read-Write] (Array[str])
  - `outputs`: `None` — [Read-Write] (Map[str,str])
  - `validated`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigMapperDefinitionUserData`
Inherits: `AssetUserData` | Header: `RigMapperDefinition.h`

Rig Mapper Definition User Data

**Properties** (1):
  - `definitions`: `None` — [Read-Write] (Array[RigMapperDefinition])

### `unreal.RigMapperLinkedDefinitions`
Inherits: `DataAsset` | Header: `RigMapperDefinition.h`

Rig Mapper Linked Definitions

**Methods** (3):
  - `are_linked_definitions_valid()` -> `bool` — Are Linked Definitions Valid
  - `bake_definitions()` -> `bool` — todo: bake to new todo: invalidate on property or source definition changed
  - `validate()` -> `bool` — Validate

**Properties** (2):
  - `baked_definition`: `RigMapperDefinition` — [Read-Write] (RigMapperDefinition)
  - `source_definitions`: `None` — [Read-Write] (Array[RigMapperDefinition])

### `unreal.RigMapperFeatureType`
Inherits: `EnumBase` | Header: `RigMapperDefinition.h`

ERig Mapper Feature Type

**Properties** (4):
  - `INPUT`: `RigMapperFeatureType = Ellipsis` — 0
  - `MULTIPLY`: `RigMapperFeatureType = Ellipsis` — 3
  - `SDK`: `RigMapperFeatureType = Ellipsis` — 2
  - `WEIGHTED_SUM`: `RigMapperFeatureType = Ellipsis` — 1
