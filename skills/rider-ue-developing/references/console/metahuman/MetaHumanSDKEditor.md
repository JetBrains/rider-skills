# UE Python API — MetaHumanSDKEditor Module

**22 types** from the `MetaHumanSDKEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaHumanAggregateDetails`, `MetaHumanArchiveContents`, `MetaHumanArchiveEntry`, `MetaHumanAssetDescription`, `MetaHumanAssetDetailsEntry`, `MetaHumanAssetReportItem`, `MetaHumanImportOptions`, `MetaHumanMultiArchiveDescription`, `MetaHumansVerificationOptions`, `MetaHumanAssetManager`, `MetaHumanAssetReport`, `MetaHumanPackageFactory`, `MetaHumanVerificationRuleBase`, `MetaHumanVerificationRuleCollection`, `VerifyMetaHumanCharacter`, `VerifyMetaHumanGroom`, `VerifyMetaHumanOutfitClothing`, `VerifyMetaHumanPackageSource`, `VerifyMetaHumanSkeletalClothing`, `VerifyObjectValid`, ... (22 total)

---

## Classes

### `unreal.MetaHumanAggregateDetails`
Inherits: `StructBase` | Header: `MetaHumanAssetManager.h`

Details about the assets contained in a MetaHuman Package

**Properties** (22):
  - `card_mesh_count`: `int` [Read-Only] — [Read-Only] Number of card assets (int32)
  - `card_mesh_texture_resolution`: `IntVector2` [Read-Only] — [Read-Only] Texture Atlas resolution (IntVector2)
  - `card_mesh_vertices`: `int` [Read-Only] — [Read-Only] Number of verts (int32)
  - `contains_clothing`: `bool` [Read-Only] — [Read-Only] Does this character come with clothing (bool)
  - `contains_grooms`: `bool` [Read-Only] — [Read-Only] Does this character contain one or more grooms (bool)
  - `engine_version`: `str` [Read-Only] — [Read-Only] UE Version asset was packaged with (str)
  - `has_lods`: `bool` [Read-Only] — [Read-Only] LODs available (bool)
  - `included_lods`: `int` [Read-Only] — [Read-Only] Which LODs are included for this item (int32)
  - `is_editable_character`: `bool` [Read-Only] — [Read-Only] Is this a character a user can open up in UEMHC and edit? (bool)
  - `lod0_vert_count`: `int` [Read-Only] — [Read-Only] Vert Count for LOD0 (if single item in listing) (int32)
  - `num_materials`: `int` [Read-Only] — [Read-Only] Number of material or material instances (int32)
  - `num_unique_characters`: `int` [Read-Only] — [Read-Only] How many Characters are included in this listing (int32)
  - `num_unique_clothing_items`: `int` [Read-Only] — [Read-Only] Number of clothing items (int32)
  - `num_unique_grooms`: `int` [Read-Only] — [Read-Only] Number of grooms (int32)
  - `physics`: `bool` [Read-Only] — [Read-Only] Simulation enabled (bool)
  - `platforms_included`: `None` [Read-Only] — [Read-Only] Cinematic and/or Optimized (Array[MetaHumanQualityLevel])
  - `resizes_with_blendable_bodies`: `bool` [Read-Only] — [Read-Only] Clothing will resize to blendable bodies in UEMHC (bool)
  - `strands_count`: `int` [Read-Only] — [Read-Only] Number of curves (int32)
  - `strands_point_count`: `int` [Read-Only] — [Read-Only] Number of CVs (int32)
  - `volume_mesh_count`: `int` [Read-Only] — [Read-Only] Number of meshes (int32)
  - `volume_mesh_texture_resolution`: `IntVector2` [Read-Only] — [Read-Only] Textures resolution (IntVector2)
  - `volume_mesh_vertices`: `int` [Read-Only] — [Read-Only] Number of verts (int32)

### `unreal.MetaHumanArchiveContents`
Inherits: `StructBase` | Header: `MetaHumanAssetManager.h`

Description of the contents of a MetaHuman Archive

**Properties** (1):
  - `files`: `None` — [Read-Write] (Array[MetaHumanArchiveEntry])

### `unreal.MetaHumanArchiveEntry`
Inherits: `StructBase` | Header: `MetaHumanAssetManager.h`

A single item in a MetaHuman Archive

**Properties** (2):
  - `path`: `str` — [Read-Write] The path to this file relative to the root of the archive (str)
  - `version`: `str` — [Read-Write] The version of the file in format Major.Minor. If no version is available the version s...

### `unreal.MetaHumanAssetDescription`
Inherits: `StructBase` | Header: `MetaHumanAssetManager.h`

Description of a MetaHuman asset including verification status

**Properties** (7):
  - `asset_data`: `AssetData` [Read-Only] — [Read-Only] The FAssetData describing the Root Asset (AssetData)
  - `asset_type`: `MetaHumanAssetType` [Read-Only] — [Read-Only] The asset type, i.e. Groom, Clothing, etc. (MetaHumanAssetType)
  - `dependent_packages`: `None` [Read-Only] — [Read-Only] A list of all the packages included in the asset (Array[Name])
  - `details`: `MetaHumanAggregateDetails` [Read-Only] — [Read-Only] (MetaHumanAggregateDetails)
  - `name`: `Name` [Read-Only] — [Read-Only] The display name for the Asset. Normally the name of the Root Asset. (Name)
  - `total_size`: `int` [Read-Only] — [Read-Only] The total size of all assets (int32)
  - `verification_report`: `MetaHumanAssetReport` [Read-Only] — [Read-Only] If present, the verification report for this Asset (MetaHumanAssetReport)

### `unreal.MetaHumanAssetDetailsEntry`
Inherits: `StructBase` | Header: `MetaHumanAssetManager.h`

Description of a sub-asset

**Properties** (2):
  - `name`: `Text` [Read-Only] — [Read-Only] (Text)
  - `size`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.MetaHumanAssetReportItem`
Inherits: `StructBase` | Header: `MetaHumanAssetReport.h`

A line in a report representing some Info, a Warning or an Error. Can optionally reference a specific item or file. *

**Properties** (3):
  - `message`: `Text` — [Read-Write] The message to display to the user (Text)
  - `project_item`: `Object` — [Read-Write] The relevant object (if any) in the project to which this message relates (Object)
  - `source_item`: `str` — [Read-Write] The file path (if any) to which this message relates (str)

### `unreal.MetaHumanImportOptions`
Inherits: `StructBase` | Header: `MetaHumanAssetManager.h`

Options to apply during the import of a MetaHuman Asset Archive

**Properties** (2):
  - `force_update`: `bool` — [Read-Write] Ignores version information and always replaces files in the project with files in the ...
  - `verbose`: `bool` — [Read-Write] (bool)

### `unreal.MetaHumanMultiArchiveDescription`
Inherits: `StructBase` | Header: `MetaHumanAssetManager.h`

Description of the contents of a multi-item archive

**Properties** (1):
  - `contained_archives`: `None` [Read-Only] — [Read-Only] A list of all the sub-archives included in the archive (Array[str])

### `unreal.MetaHumansVerificationOptions`
Inherits: `StructBase` | Header: `MetaHumanVerificationRuleCollection.h`

Options for the Verification process

**Properties** (2):
  - `treat_warnings_as_errors`: `bool` — [Read-Write] (bool)
  - `verbose`: `bool` — [Read-Write] (bool)

### `unreal.MetaHumanAssetManager`
Inherits: `BlueprintFunctionLibrary` | Header: `MetaHumanAssetManager.h`

Manages MetaHuman characters and compatible assets in the project

**Methods** (7):
  - `create_archive(assets, archive_path)` -> `bool` [classmethod] — Packages up the described MetaHuman Asset (including dependencies) into a zip file
  - `find_assets_for_packaging(asset_type)` -> `Array [ MetaHumanAssetDescription ]` [classmethod] — Finds all assets in the project that ore of the correct type and in the correct location to be packaged
  - `get_asset_details(asset)` -> `Array [ MetaHumanAssetDetailsEntry ]` [classmethod] — Describes all the packages (files) that make up a MetaHuman Asset
  - `inspect_archive(archive_file_path)` -> `MetaHumanAssetDescription` [classmethod] — Opens a MetaHuman archive file and reads a description of the contents
  - `is_asset_of_type(root_package, asset_type)` -> `bool` [classmethod] — Performs some simple tests to see if an asset is of the correct type and in the correct location to be a Root Asset of t...
  - `update_asset_dependencies(asset=MetaHumanAssetDescription)` [classmethod] — Updates the stored package dependencies for a MetaHuman Asset
  - `update_asset_details(asset=MetaHumanAssetDescription)` [classmethod] — Updates the stored asset details for a MetaHuman Asset

### `unreal.MetaHumanAssetReport`
Inherits: `Object` | Header: `MetaHumanAssetReport.h`

A report generated when an asset is imported or tested for MetaHuman compatibility

**Methods** (13):
  - `add_error(message)` -> `None` — Adds a user-facing message to appear in the report. This will flag the report as containing warnings and as having faile...
  - `add_info(message)` -> `None` — Adds a user-facing message to appear in the report. This will not flag the report as containing warnings or as having fa...
  - `add_verbose(message)` -> `None` — Adds a user-facing message to appear in the report. This will not flag the report as containing warnings or as having fa...
  - `add_warning(message)` -> `None` — Adds a user-facing message to appear in the report. This will flag the report as containing warnings but will not flag i...
  - `generate_html_report()` -> `str` — Generates an HTML representation of the report
  - `generate_json_report()` -> `str` — Generates a JSON representation of the report
  - `generate_raw_report()` -> `str` — Generates a plain text representation of the report
  - `generate_rich_text_report()` -> `Text` — Generates a representation of the report suitable for use in an SRichText control
  - `get_report_result()` -> `MetaHumanOperationResult` — Determine whether the report represents a successful operation or not
  - `has_warnings()` -> `bool` — Determine whether the report contains non-informational messages
  - `set_subject(subject)` -> `None` — Set the subject for the report, typically the name of the asset being tested or imported
  - `set_verbose(value)` -> `None` — Set whether to include verbose items in the report
  - `set_warnings_as_errors(value)` -> `None` — Set whether warnings should be reported as errors

### `unreal.MetaHumanPackageFactory`
Inherits: `Factory` | Header: `MetaHumanPackageFactory.h`

Allow import of MetaHuman asset group packages

### `unreal.MetaHumanVerificationRuleBase`
Inherits: `Object` | Header: `MetaHumanVerificationRuleCollection.h`

A Rule which can be part of a MetaHuman verification test suite

**Methods** (1):
  - `verify(to_verify, report, options)` -> `None` — Applies the rule to the asset and updates the verification report

### `unreal.MetaHumanVerificationRuleCollection`
Inherits: `Object` | Header: `MetaHumanVerificationRuleCollection.h`

A collection of Rules which make up a verification test for a class of MetaHuman asset compatibility, for example groom compatibility, clothing compatibility, animation compatibility etc.

**Methods** (2):
  - `add_verification_rule(rule)` -> `None` — Adds a rule to this collection
  - `apply_all_rules(target, report, options)` -> `MetaHumanAssetReport` — Runs all registered rules against the Target. Compiles the results in OutReport.

### `unreal.VerifyMetaHumanCharacter`
Inherits: `MetaHumanVerificationRuleBase` | Header: `VerifyMetaHumanCharacter.h`

A verification rule that tests that a MetaHuman character is valid. Currently only handles âLegacyâ MetaHuman Characters.

### `unreal.VerifyMetaHumanGroom`
Inherits: `MetaHumanVerificationRuleBase` | Header: `VerifyMetaHumanGroom.h`

A rule to test if a UObject complies with the MetaHuman Groom standard

### `unreal.VerifyMetaHumanOutfitClothing`
Inherits: `MetaHumanVerificationRuleBase` | Header: `VerifyMetaHumanOutfitClothing.h`

Verifies that a piece of clothing conforms to the standard for outfit-based clothing packages

### `unreal.VerifyMetaHumanPackageSource`
Inherits: `MetaHumanVerificationRuleBase` | Header: `VerifyMetaHumanPackageSource.h`

A generic rule for MetaHuman Asset Groups that tests that they are valid for the generation of a MetaHuman Package. Only works for ânormalâ Asset Groups like grooms and clothing, not legacy charac...

### `unreal.VerifyMetaHumanSkeletalClothing`
Inherits: `MetaHumanVerificationRuleBase` | Header: `VerifyMetaHumanSkeletalClothing.h`

Verifies that a piece of clothing conforms to the standard for skeletal mesh-based clothing packages

### `unreal.VerifyObjectValid`
Inherits: `MetaHumanVerificationRuleBase` | Header: `VerifyObjectValid.h`

A simple rule to test if a UObject is a valid asset

### `unreal.MetaHumanAssetType`
Inherits: `EnumBase` | Header: `MetaHumanAssetManager.h`

Describes the types of MetaHuman Assets that can be managed and packaged

**Properties** (5):
  - `CHARACTER`: `MetaHumanAssetType = Ellipsis` — 0
  - `CHARACTER_ASSEMBLY`: `MetaHumanAssetType = Ellipsis` — 1
  - `GROOM`: `MetaHumanAssetType = Ellipsis` — 4
  - `OUTFIT_CLOTHING`: `MetaHumanAssetType = Ellipsis` — 3
  - `SKELETAL_CLOTHING`: `MetaHumanAssetType = Ellipsis` — 2

### `unreal.MetaHumanOperationResult`
Inherits: `EnumBase` | Header: `MetaHumanAssetReport.h`

The status of an operation represented by a report

**Properties** (2):
  - `FAILURE`: `MetaHumanOperationResult = Ellipsis` — 1
  - `SUCCESS`: `MetaHumanOperationResult = Ellipsis` — 0
