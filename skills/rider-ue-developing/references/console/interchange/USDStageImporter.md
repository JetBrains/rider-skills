# UE Python API — USDStageImporter Module

**5 types** from the `USDStageImporter` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `UsdStageAssetImportFactory`, `UsdStageImportFactory`, `UsdStageImportOptions`, `ReplaceActorPolicy`, `ReplaceAssetPolicy`

---

## Classes

### `unreal.UsdStageAssetImportFactory`
Inherits: `Factory` | Header: `USDStageAssetImportFactory.h`

Factory to import USD files that gets called when we hit Import in the Content Browser, as well as during reimport

### `unreal.UsdStageImportFactory`
Inherits: `SceneImportFactory` | Header: `USDStageImportFactory.h`

Factory to import USD files that gets called when we hit File -> Import into levelâ¦

### `unreal.UsdStageImportOptions`
Inherits: `Object` | Header: `USDStageImportOptions.h`

Usd Stage Import Options

**Properties** (34):
  - `existing_actor_policy`: `ReplaceActorPolicy` — [Read-Write] What should happen when imported actors and components try to overwrite existing actors...
  - `existing_asset_cache`: `SoftObjectPath` — [Read-Write] Copy assets from an existing UsdAsset cache instead of generating them from scratch, if...
  - `existing_asset_policy`: `ReplaceAssetPolicy` — [Read-Write] What should happen when imported assets try to overwrite existing assets (ReplaceAssetP...
  - `fallback_collision_type`: `UsdCollisionType` — [Read-Write] What type of collision to use for static meshes generated from Prims that donât have ...
  - `groom_interpolation_settings`: `None` — [Read-Write] Groom group interpolation settings (Array[HairGroupsInterpolation])
  - `import_actors`: `bool` — [Read-Write] (bool)
  - `import_at_specific_time_code`: `bool` — [Read-Write] When true the stage will be evaluated at ImportTimeCode for the import.
When false, the...
  - `import_geometry`: `bool` — [Read-Write] (bool)
  - `import_groom_assets`: `bool` — [Read-Write] Whether to import GroomAssets, GroomCaches and GroomBindings (bool)
  - `import_level_sequences`: `bool` — [Read-Write] (bool)
  - `import_materials`: `bool` — [Read-Write] (bool)
  - `import_only_used_materials`: `bool` — [Read-Write] If this is checked, only materials actively used by the stage and import settings will ...
  - `import_skeletal_animations`: `bool` — [Read-Write] Whether to try importing UAnimSequence skeletal animation assets for each encountered U...
  - `import_sounds`: `bool` — [Read-Write] Whether to import audio files referenced by UsdMediaSpatialAudio schemas as Unreal soun...
  - `import_sparse_volume_textures`: `bool` — [Read-Write] Whether to import OpenVDB volumes as Sparse Volume Textures (bool)
  - `import_time_code`: `float` — [Read-Write] TimeCode to evaluate the stage for import, in case bImportAtSpecificTimeCode is enabled...
  - `interpret_lo_ds`: `bool` — âinterpret_lo_dsâ was renamed to âinterpret_lodsâ. deprecated
  - `interpret_lods`: `bool` — [Read-Write] When true, if a prim has a âLODâ variant set with variants named âLOD0â, âLOD...
  - `kinds_to_collapse`: `int` — [Read-Write] Whether to try to combine individual assets and components of the same type on a kind-p...
  - `material_purpose`: `Name` — [Read-Write] Specifies which material purpose to use when parsing USD material bindings, in addition...
  - `merge_identical_material_slots`: `bool` — [Read-Write] Identical material slots will be combined into a single slot if this is enabled. This i...
  - `metadata_options`: `UsdMetadataImportOptions` — [Read-Write] Describes if/how we should collect metadata from USD prims onto the assets and componen...
  - `nanite_triangle_threshold`: `int` — [Read-Write] Try enabling Nanite for static meshes that are generated with at least this many triang...
  - `override_stage_options`: `bool` — [Read-Write] Whether to use the specified StageOptions instead of the stageâs own settings (bool)
  - `prim_path_folder_structure`: `bool` — [Read-Write] When enabled, assets will be imported into a content folder structure according to thei...
  - `prims_to_import`: `None` — [Read-Write] List of paths of prims to import (e.g. [â/Root/MyBoxâ, â/Root/OtherPrimâ]).
Imp...
  - `purposes_to_import`: `int` — [Read-Write] Only import prims with these specific purposes from the USD file (int32)
  - `render_context_to_import`: `Name` — [Read-Write] Specifies which set of shaders to use when parsing USD materials, in addition to the un...
  - `root_motion_handling`: `UsdRootMotionHandling` — [Read-Write] Describes what to add to the root bone animation within generated AnimSequences, if any...
  - `share_assets_for_identical_prims`: `bool` — [Read-Write] If true, whenever two prims would have generated identical UAssets (like identical Stat...
  - `stage_options`: `UsdStageOptions` — [Read-Write] Custom StageOptions to use for the stage (UsdStageOptions)
  - `subdivision_level`: `int` — [Read-Write] Subdivision level to use for all subdivision meshes on the opened stage. 0 means âdon...
  - `use_existing_asset_cache`: `bool` — [Read-Write] (bool)
  - `use_prim_kinds_for_collapsing`: `bool` — [Read-Write] Use KindsToCollapse to determine when to collapse prim subtrees or not (defaults to ena...

### `unreal.ReplaceActorPolicy`
Inherits: `EnumBase` | Header: `USDStageImportOptions.h`

EReplace Actor Policy

**Properties** (4):
  - `APPEND`: `ReplaceActorPolicy = Ellipsis` — Spawn new actors and components alongside the existing ones 0
  - `IGNORE`: `ReplaceActorPolicy = Ellipsis` — Ignore any conflicting new assets and components, keeping the old ones 3
  - `REPLACE`: `ReplaceActorPolicy = Ellipsis` — Replaces existing actors and components with new ones 1
  - `UPDATE_TRANSFORM`: `ReplaceActorPolicy = Ellipsis` — Update transforms on existing actors but do not replace actors or components 2

### `unreal.ReplaceAssetPolicy`
Inherits: `EnumBase` | Header: `USDStageImportOptions.h`

EReplace Asset Policy

**Properties** (3):
  - `APPEND`: `ReplaceAssetPolicy = Ellipsis` — Create new assets with numbered suffixes 0
  - `IGNORE`: `ReplaceAssetPolicy = Ellipsis` — Ignores the new asset and keeps the existing asset 2
  - `REPLACE`: `ReplaceAssetPolicy = Ellipsis` — Replaces existing asset with new asset 1
