# UE Python API — AssetTools Module

**8 types** from the `AssetTools` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AssetRenameData`, `MigrationOptions`, `AssetTools`, `AssetToolsHelpers`, `AssetMigrationConflict`, `AssetRenameResult`, `AssetTypeActivationOpenedMethod`, `AdvancedCopyCompletedEvent`

---

## Classes

### `unreal.AssetRenameData`
Inherits: `StructBase` | Header: `IAssetTools.h`

Asset Rename Data

**Properties** (3):
  - `asset`: `Object` — [Read-Write] Object being renamed (Object)
  - `new_name`: `str` — [Read-Write] New package and asset name, new object path will be PackagePath/NewName.NewName (str)
  - `new_package_path`: `str` — [Read-Write] New path to package without package name, ie /Game/SubDirectory (str)

### `unreal.MigrationOptions`
Inherits: `StructBase` | Header: `IAssetTools.h`

Migration Options

**Properties** (4):
  - `asset_conflict`: `AssetMigrationConflict` — [Read-Write] What to do when Assets are conflicting on the destination (AssetMigrationConflict)
  - `ignore_dependencies`: `bool` — [Read-Write] Ignore dependencies of assets, only migrate the given assets. usefull for automation. T...
  - `orphan_folder`: `str` — [Read-Write] Destination for assets that donât have a corresponding content folder. If left empty ...
  - `prompt`: `bool` — [Read-Write] Prompt user for confirmation (always false through scripting) (bool)

### `unreal.AssetTools`
Inherits: `Interface` | Header: `IAssetTools.h`

Asset Tools

**Methods** (21):
  - `begin_advanced_copy_packages(input_names_to_copy, target_path, on_copy_complete)` -> `None` — Begin Advanced Copy Packages
  - `create_asset(asset_name, package_path, asset_class, factory, calling_context = 'None')` -> `Object` — Creates an asset with the specified name, path, and factory
  - `create_asset_with_dialog(asset_name, package_path, asset_class, factory, calling_context = 'None', call_configure_properties = True)` -> `Object` — Opens an asset picker dialog and creates an asset with the specified name and path
  - `create_unique_asset_name(base_package_name, out_asset_name=str)` — Creates a unique package and asset name taking the form InBasePackageName+InSuffix
  - `diff_against_depot(object, package_path, package_name)` -> `None` — Try to diff the local version of an asset against the latest one from the depot
  - `diff_assets(old_asset, new_asset, old_revision, new_revision)` -> `None` — Try and diff two assets using class-specific tool. Will do nothing if either asset is NULL, or they are not the same cla...
  - `duplicate_asset(asset_name, package_path, original_object)` -> `Object` — Creates an asset with the specified name and path. Uses OriginalObject as the duplication source.
  - `duplicate_asset_with_dialog(asset_name, package_path, original_object)` -> `Object` — Opens an asset picker dialog and creates an asset with the specified name and path. Uses OriginalObject as the duplicati...
  - `duplicate_asset_with_dialog_and_title(asset_name, package_path, original_object, dialog_title)` -> `Object` — Opens an asset picker dialog and creates an asset with the specified name and path. Uses OriginalObject as the duplicati...
  - `export_assets(assets_to_export, export_path)` -> `None` — Exports the specified objects to file.
  - `export_assets_with_dialog(assets_to_export, prompt_for_individual_filenames)` -> `None` — Exports the specified objects to file. First prompting the user to pick an export directory and optionally prompting the...
  - `find_soft_references_to_object(target_object)` -> `Array [ Object ]` — Returns list of objects that soft reference the given soft object path. This will load assets into memory to verify
  - `import_asset_tasks(import_tasks)` -> `None` — Imports assets using tasks specified.
  - `import_assets_automated(import_data)` -> `Array [ Object ]` — Imports assets using data specified completely up front. Does not ever ask any questions of the user or show any modal e...
  - `import_assets_with_dialog(destination_path)` -> `Array [ Object ]` — Opens a file open dialog to choose files to import to the destination path.
  - `is_asset_read_only(asset_data)` -> `bool` — Determines whether an asset is considered read-only for editing, based on its flags and the current permissions ( see: G...
  - `migrate_packages(package_names_to_migrate, destination_path, options = [False,False,AssetMigrationConflict.SKIP,''])` -> `None` — Migrate packages and dependencies to another folder
  - `open_editor_for_assets(assets)` -> `None` — Opens editor for assets deprecated: Please use UAssetEditorSubsystem::OpenEditorForAssets instead.
  - `rename_assets(assets_and_names)` -> `bool` — Renames assets using the specified names.
  - `rename_assets_with_dialog(assets_and_names, auto_checkout = False)` -> `AssetRenameResult` — Renames assets using the specified names.
  - `rename_referencing_soft_object_paths(packages_to_check, asset_redirector_map)` -> `None` — Function that renames all FSoftObjectPath object with the old asset path to the new one.

### `unreal.AssetToolsHelpers`
Inherits: `Object` | Header: `IAssetTools.h`

Asset Tools Helpers

**Methods** (1):
  - `get_asset_tools()` -> `AssetTools` [classmethod] — Get Asset Tools

### `unreal.AssetMigrationConflict`
Inherits: `EnumBase` | Header: `IAssetTools.h`

EAsset Migration Conflict

**Properties** (3):
  - `CANCEL`: `AssetMigrationConflict = Ellipsis` — Cancel the whole Migration 2
  - `OVERWRITE`: `AssetMigrationConflict = Ellipsis` — Overwrite Assets 1
  - `SKIP`: `AssetMigrationConflict = Ellipsis` — Skip Assets 0

### `unreal.AssetRenameResult`
Inherits: `EnumBase` | Header: `IAssetTools.h`

EAsset Rename Result

**Properties** (3):
  - `FAILURE`: `AssetRenameResult = Ellipsis` — The asset rename failed 0
  - `PENDING`: `AssetRenameResult = Ellipsis` — The asset rename is still pending, likely due to outstanding asset discovery 2
  - `SUCCESS`: `AssetRenameResult = Ellipsis` — The asset rename succeeded 1

### `unreal.AssetTypeActivationOpenedMethod`
Inherits: `EnumBase` | Header: `AssetTypeActivationOpenedMethod.h`

(jcotton) This enum has been extracted into a separate header as it would ideally live in IAssetTypeActions.h or AssetTypeActions_Base.h, however these files are included without module linking (Inclu...

**Properties** (2):
  - `EDIT`: `AssetTypeActivationOpenedMethod = Ellipsis` — 0
  - `VIEW`: `AssetTypeActivationOpenedMethod = Ellipsis` — 1

### `unreal.AdvancedCopyCompletedEvent`
Inherits: `DelegateBase` | Header: `IAssetTools.h`

Advanced Copy Completed Event Delegate Signature
