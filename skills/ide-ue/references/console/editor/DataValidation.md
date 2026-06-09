# UE Python API — DataValidation Module

**13 types** from the `DataValidation` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ValidateAssetsDetails`, `ValidateAssetsResults`, `ValidateAssetsSettings`, `DataValidationChangelist`, `DataValidationTestActor`, `DirtyFilesChangelistValidator`, `EditorValidator_Localization`, `EditorValidator_Material`, `EditorValidatorBase`, `EditorValidatorSubsystem`, `PackageFileValidator`, `ValidationMaterial`, `WorldPartitionChangelistValidator`

---

## Classes

### `unreal.ValidateAssetsDetails`
Inherits: `StructBase` | Header: `EditorValidatorSubsystem.h`

Validate Assets Details

### `unreal.ValidateAssetsResults`
Inherits: `StructBase` | Header: `EditorValidatorSubsystem.h`

Validate Assets Results

**Properties** (9):
  - `asset_limit_reached`: `bool` [Read-Only] — [Read-Only] True if FValidateAssetSettings::MaxAssetsToValidation was reached (bool)
  - `assets_details`: `None` [Read-Only] — [Read-Only] Per asset details
Indexed by object path
Only returned if FValidateAssetsSettings::bColl...
  - `num_checked`: `int` [Read-Only] — [Read-Only] Amount of tested assets (int32)
  - `num_invalid`: `int` [Read-Only] — [Read-Only] Amount of assets with errors (int32)
  - `num_requested`: `int` [Read-Only] — [Read-Only] Total amount of assets that were gathered to validate. (int32)
  - `num_skipped`: `int` [Read-Only] — [Read-Only] Amount of assets skipped (int32)
  - `num_unable_to_validate`: `int` [Read-Only] — [Read-Only] Amount of assets that could not be validated (int32)
  - `num_valid`: `int` [Read-Only] — [Read-Only] Amount of assets without errors or warnings (int32)
  - `num_warnings`: `int` [Read-Only] — [Read-Only] Amount of assets with warnings (int32)

### `unreal.ValidateAssetsSettings`
Inherits: `StructBase` | Header: `EditorValidatorSubsystem.h`

Validate Assets Settings

**Properties** (12):
  - `capture_asset_load_logs`: `bool` — [Read-Write] If true, captures log warnings and errors from loading assets for validation and report...
  - `capture_logs_during_validation`: `bool` — [Read-Write] If true, captures log warnings and errors from other operations that happen during vali...
  - `capture_warnings_during_validation_as_errors`: `bool` — [Read-Write] If true, captured log warnings during validation are added to the validation results as...
  - `collect_per_asset_details`: `bool` — [Read-Write] If true, will add an FValidateAssetsDetails for each asset to the results (bool)
  - `load_assets_for_validation`: `bool` — [Read-Write] If false, unloaded assets will get skipped from validation. (bool)
  - `load_external_objects_for_validation`: `bool` — [Read-Write] If false, external objects (e.g. actors stored separately from maps) will not be loaded...
  - `max_assets_to_validate`: `int` — [Read-Write] Maximum number of assets to attempt to validate (int32)
  - `show_if_no_failures`: `bool` — [Read-Write] If true, will add notifications for files with no validation and display even if everyt...
  - `skip_excluded_directories`: `bool` — [Read-Write] If true, will not validate files in excluded directories (bool)
  - `unload_assets_loaded_for_validation`: `bool` — [Read-Write] If true, will attempt to unload assets which were previously unloaded, and loaded for v...
  - `validate_referencers_of_deleted_assets`: `bool` — [Read-Write] Should we validate referencers of deleted assets in changelists (bool)
  - `validation_usecase`: `DataValidationUsecase` — [Read-Write] The usecase requiring datavalidation (DataValidationUsecase)

### `unreal.DataValidationChangelist`
Inherits: `Object` | Header: `DataValidationChangelist.h`

Changelist abstraction to allow changelist-level data validation

### `unreal.DataValidationTestActor`
Inherits: `Actor` | Header: `DataValidationTestActor.h`

Data Validation Test Actor

**Properties** (1):
  - `pass_validation`: `bool` — [Read-Write] (bool)

### `unreal.DirtyFilesChangelistValidator`
Inherits: `EditorValidatorBase` | Header: `DirtyFilesChangelistValidator.h`

Validates there is no unsaved files in the changelist about to be submitted.

### `unreal.EditorValidator_Localization`
Inherits: `EditorValidatorBase` | Header: `EditorValidator_Localization.h`

Validates that localized assets (within the L10N folder) conform to a corresponding source asset of the correct type. Localized assets that fail this validation will never be loaded as localized varia...

### `unreal.EditorValidator_Material`
Inherits: `EditorValidatorBase` | Header: `EditorValidator_Material.h`

Checks if UMaterial and UMaterialInstance are compiling on all validation shader platforms

### `unreal.EditorValidatorBase`
Inherits: `Object` | Header: `EditorValidatorBase.h`

The EditorValidatorBase is a class which verifies that an asset meets a specific ruleset. It should be used when checking engine-level classes, as UObject::IsDataValid requires overriding the base cla...

**Methods** (10):
  - `asset_fails(asset, message)` -> `None` — Marks the validation as failed and adds an error message.
  - `asset_passes(asset)` -> `None` — Marks the validation as successful. Failure to call this will report the validator as not having checked the asset.
  - `asset_warning(asset, message)` -> `None` — Adds a message to this validation but doesnât mark it as failed.
  - `can_validate(usecase: DataValidationUsecase)` -> `bool` — deprecated: âcan_validateâ was renamed to âk2_can_validateâ.
  - `can_validate_asset(asset: Object)` -> `bool` — deprecated: âcan_validate_assetâ was renamed to âk2_can_validate_assetâ.
  - `get_validation_result()` -> `DataValidationResult` — Get Validation Result
  - `k2_can_validate(usecase)` -> `bool` — Override this to determine whether or not you can use this validator given this usecase
  - `k2_can_validate_asset(asset)` -> `bool` — Override this to determine whether or not you can validate a given asset with this validator
  - `k2_validate_loaded_asset(asset)` -> `DataValidationResult` — Override this in blueprint to validate assets
  - `validate_loaded_asset(asset: Object)` -> `DataValidationResult` — deprecated: âvalidate_loaded_assetâ was renamed to âk2_validate_loaded_assetâ.

### `unreal.EditorValidatorSubsystem`
Inherits: `EditorSubsystem` | Header: `EditorValidatorSubsystem.h`

UEditorValidatorSubsystem manages all the asset validation in the engine.

**Methods** (7):
  - `add_validator(validator)` -> `None`
  - `is_asset_valid()` — Loads the object referred to by the provided AssetData and runs registered validators on it. Does not add anything to an...
  - `is_object_valid()` — Runs registered validators on the provided object. Does not add anything to any FMessageLog tabs.
  - `remove_validator(validator)` -> `None`
  - `validate_assets_with_settings(asset_data_list, out_results=ValidateAssetsResults)` — Called to validate assets from either the UI or a commandlet. Loads the specified assets and runs all registered validat...
  - `validate_changelist(changelist, out_results=ValidateAssetsResults)` — Called to validate assets from either the UI or a commandlet. Loads the specified assets and runs all registered validat...
  - `validate_changelists(changelists, out_results=ValidateAssetsResults)` — Validate Changelists

**Properties** (1):
  - `validate_on_save`: `bool` — [Read-Write] Whether it should validate assets on save inside the editor
deprecated: Use bValidateOn...

### `unreal.PackageFileValidator`
Inherits: `EditorValidatorBase` | Header: `PackageFileValidator.h`

This validator checks the format of the package on disk to make sure that is has not become corrupted since it was last saved.

### `unreal.ValidationMaterial`
Inherits: `Material` | Header: `EditorValidator_Material.h`

Validation Material

### `unreal.WorldPartitionChangelistValidator`
Inherits: `EditorValidatorBase` | Header: `WorldPartitionChangelistValidator.h`

World Partition Changelist Validator
