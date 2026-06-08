# UE Python API — InterchangeEngine Module

**17 types** from the `InterchangeEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ImportAssetParameters`, `InterchangeFilePickerParameters`, `InterchangeStackInfo`, `InterchangeAssetImportData`, `InterchangeBlueprintPipelineBase`, `InterchangeEditorSettings`, `InterchangeFilePickerBase`, `InterchangeManager`, `InterchangeMeshUtilities`, `InterchangePipelineConfigurationBase`, `InterchangePipelineStackOverride`, `InterchangePythonPipelineAsset`, `InterchangePythonPipelineBase`, `InterchangeSceneImportAsset`, `InterchangePipelineConfigurationDialogResult`, `OnImportDoneDynamic`, `OnObjectImportDoneDynamic`

---

## Classes

### `unreal.ImportAssetParameters`
Inherits: `StructBase` | Header: `InterchangeManager.h`

Import Asset Parameters

**Properties** (13):
  - `destination_name`: `str` — [Read-Write] Optional custom name for the import. (str)
  - `follow_redirectors`: `bool` — [Read-Write] Tell Interchange to follow redirectors when determining the location an asset will be i...
  - `force_show_dialog`: `bool` — [Read-Write] If true this import must show the import dialog and ignore the show dialog settings. (b...
  - `import_level`: `Level` — [Read-Write] Level to import into when doing a scene import. (Level)
  - `is_automated`: `bool` — [Read-Write] Tell Interchange that import is automated and it shouldnât present a modal window. (b...
  - `on_asset_done`: `OnObjectImportDoneDynamic` — [Read-Write] Delegates used to track the imported objects. // This is called each time an asset is i...
  - `on_assets_import_done`: `OnImportDoneDynamic` — [Read-Write] This is called when all the assets were imported from the source data. (OnImportDoneDyn...
  - `on_scene_import_done`: `OnImportDoneDynamic` — [Read-Write] This is called when all the scene objects were imported from the source data. (OnImport...
  - `on_scene_object_done`: `OnObjectImportDoneDynamic` — [Read-Write] This is called each time an object in the scene is imported or reimported from the impo...
  - `override_pipelines`: `None` — [Read-Write] Adding overrides tells Interchange to use the specific custom set of pipelines instead ...
  - `reimport_asset`: `Object` — [Read-Write] If the import is a reimport for a specific asset, set the asset to reimport here. (Obje...
  - `reimport_source_index`: `int` — [Read-Write] If we are doing a reimport, set the source index here. Some assets have more then one s...
  - `replace_existing`: `bool` — [Read-Write] Determies whether to overwrite existing assets. (bool)

### `unreal.InterchangeFilePickerParameters`
Inherits: `StructBase` | Header: `InterchangeFilePickerBase.h`

Interchange File Picker Parameters

### `unreal.InterchangeStackInfo`
Inherits: `StructBase` | Header: `InterchangePipelineConfigurationBase.h`

Interchange Stack Info

**Properties** (2):
  - `pipelines`: `None` — [Read-Write] (Array[InterchangePipelineBase])
  - `stack_name`: `Name` — [Read-Write] (Name)

### `unreal.InterchangeAssetImportData`
Inherits: `AssetImportData` | Header: `InterchangeAssetImportData.h`

Interchange Asset Import Data

**Methods** (12):
  - `get_node_container()` -> `InterchangeBaseNodeContainer` — Get Node Container
  - `get_number_of_pipelines()` -> `int32` — Get Number Of Pipelines
  - `get_pipelines()` -> `Array [ Object ]` — Returns Array of non-null pipelines
  - `get_stored_factory_node(node_unique_id)` -> `InterchangeFactoryBaseNode` — Get Stored Factory Node
  - `get_stored_node(node_unique_id)` -> `InterchangeBaseNode` — Get Stored Node
  - `get_translator_settings()` -> `InterchangeTranslatorSettings` — Get Translator Settings
  - `script_extract_display_labels()` -> `Array [ str ]` — Extract all the filename labels.
  - `script_extract_filenames()` -> `Array [ str ]` — Extract all the (resolved) filenames.
  - `script_get_first_filename()` -> `str` — Return the first filename stored in this data. The resulting filename will be absolute (that is, not relative to the ass...
  - `set_node_container(node_container)` -> `None` — Set Node Container
  - `set_pipelines(pipelines)` -> `None` — Set Pipelines
  - `set_translator_settings(translator_settings)` -> `None` — Set Translator Settings

**Properties** (2):
  - `node_container`: `InterchangeBaseNodeContainer` — [Read-Write]
deprecated: Use GetNodeContainer/SetNodeContainer instead. (InterchangeBaseNodeContaine...
  - `pipelines`: `None` — [Read-Write]
deprecated: Use GetPipelines/SetPipelines instead. (Array[Object])

### `unreal.InterchangeBlueprintPipelineBase`
Inherits: `Blueprint` | Header: `InterchangeBlueprintPipelineBase.h`

Interchange Blueprint Pipeline Base

### `unreal.InterchangeEditorSettings`
Inherits: `DeveloperSettings` | Header: `InterchangeProjectSettings.h`

Interchange Editor Settings

**Methods** (2):
  - `get_used_group_name()` -> `Name` — Get Used Group Name
  - `set_used_group_name(used_group_name)` -> `None` — Set Used Group Name

### `unreal.InterchangeFilePickerBase`
Inherits: `Object` | Header: `InterchangeFilePickerBase.h`

Interchange File Picker Base

**Methods** (2):
  - `scripted_file_picker_for_translator_asset_type(translator_asset_type)` -> `(parameters=InterchangeFilePickerParameters, out_filenames=Array[str]) or None` — Non-virtual helper that allows Blueprint to implement an event-based function to implement FilePickerForTranslatorAssetT...
  - `scripted_file_picker_for_translator_type(translator_type)` -> `(parameters=InterchangeFilePickerParameters, out_filenames=Array[str]) or None` — Non-virtual helper that allows Blueprint to implement an event-based function to implement FilePickerForTranslatorType()...

### `unreal.InterchangeManager`
Inherits: `Object` | Header: `InterchangeManager.h`

Interchange Manager

**Methods** (23):
  - `can_reimport(object)` -> `Array[str] or None` — Returns true if Interchange can create this type of asset and is able to translate its source files.
  - `can_translate_source_data(source_data, scene_import_only = False)` -> `bool` — Check whether there is a registered translator for this source data. This allows us to bypass the original asset tools s...
  - `cancel_all_tasks()` -> `None` — This function cancels all tasks and finishes them as fast as possible. We use this if the user cancels the work or if th...
  - `create_source_data(file_name)` -> `InterchangeSourceData` [classmethod] — return:: A new UInterchangeSourceData.
  - `export_asset(asset, is_automated = False)` -> `bool` — Call this to start an asset export process. The caller must specify a source data.
  - `export_scene(world, is_automated = False)` -> `bool` — Call this to start a scene export process. The caller must specify a source data.
  - `get_asset_import_data(asset)` -> `InterchangeAssetImportData` — Returns the list of supported formats for a given translator type.
  - `get_interchange_manager_scripted()` -> `InterchangeManager` [classmethod] — Return the pointer to the Interchange Manager singleton. note: We need to return a pointer to have a valid Blueprint-cal...
  - `get_registered_factory_class(class_to_make)` — Script helper to get a registered factory for a specified class. return:: The registered factory class if found, or NULL...
  - `get_supported_asset_type_formats(for_translator_asset_type, for_translator_type = InterchangeTranslatorType.INVALID, strict_match_translator_type = False)` -> `Array [ str ]` — Returns the list of formats supporting the specified translator asset type.
  - `get_supported_formats(for_translator_type)` -> `Array [ str ]` — Returns the list of supported formats for a given translator type.
  - `get_supported_formats_for_object(object, source_file_index)` -> `Array [ str ]` — Returns the list of supported formats for a given Object.
  - `get_translator_for_source_data(source_data)` -> `InterchangeTranslatorBase`
  - `import_asset(content_path, source_data, import_asset_parameters)` -> `Array[Object] or None` — Call this to start a synchronous asset import process. This process can import many different assets into the game conte...
  - `import_scene(content_path, source_data, import_asset_parameters)` -> `bool` — Call this to start a synchronous scene import process. This process can import many different assets and their transform...
  - `is_interchange_active()` -> `bool` — Return true if Interchange is actively importing or exporting, or false otherwise.
  - `is_object_being_imported(object)` -> `bool` — Return true if the object is being imported, or false otherwise. If the user imports multiple file in the same folder, i...
  - `reimport_asset(object_to_reimport, import_asset_parameters)` -> `Array[Object] or None` — Call this to start a synchronous asset re-import process. This process can re-import many different assets into the game...
  - `scripted_import_asset_async(content_path, source_data, import_asset_parameters)` -> `bool` — Call this from blueprint or python to start an asynchronous asset import process. This process can import many different...
  - `scripted_import_scene_async(content_path, source_data, import_asset_parameters)` -> `bool` — Call this to start a asynchronous scene import process. This process can import many different assets and their transfor...
  - `scripted_reimport_asset_async(object_to_reimport, import_asset_parameters)` -> `bool` — Call this from blueprint or python to start an asynchronous asset import process. This process can import many different...
  - `wait_until_all_tasks_done(cancel)` -> `None` — Wait synchronously until all tasks are done.
  - `warn_if_interchange_is_active()` -> `bool` — Return false if Interchange is not actively importing or exporting. If Interchange is active, it will display a notifica...

### `unreal.InterchangeMeshUtilities`
Inherits: `Object` | Header: `InterchangeMeshUtilities.h`

Interchange Mesh Utilities

**Methods** (1):
  - `scripted_import_morph_target(skeletal_mesh, lod_index, source_data, morph_target_name)` -> `bool` — This function import a morph target from the source data and add/replace the skeletal mesh morph target.

### `unreal.InterchangePipelineConfigurationBase`
Inherits: `Object` | Header: `InterchangePipelineConfigurationBase.h`

Interchange Pipeline Configuration Base

**Methods** (4):
  - `scripted_show_pipeline_configuration_dialog()` — Non-virtual helper that allows Blueprint to implement an event-based function to implement ShowPipelineConfigurationDial...
  - `scripted_show_reimport_pipeline_configuration_dialog()` — Non-virtual helper that allows Blueprint to implement an event-based function to implement ShowReimportPipelineConfigura...
  - `scripted_show_scene_pipeline_configuration_dialog()` — Non-virtual helper that allows Blueprint to implement an event-based function to implement ShowScenePipelineConfiguratio...
  - `scripted_show_test_plan_configuration_dialog()` — Non-virtual helper that allows Blueprint to implement an event-based function to implement ShowTestPlanPipelineConfigura...

### `unreal.InterchangePipelineStackOverride`
Inherits: `Object` | Header: `InterchangeManager.h`

This class is used to pass override pipelines in the ImportAssetTask Options member.

**Methods** (3):
  - `add_blueprint_pipeline(pipeline_base)` -> `None` — Add Blueprint Pipeline
  - `add_pipeline(pipeline_base)` -> `None` — Add Pipeline
  - `add_python_pipeline(pipeline_base)` -> `None` — Add Python Pipeline

**Properties** (1):
  - `override_pipelines`: `None` — [Read-Write] (Array[SoftObjectPath])

### `unreal.InterchangePythonPipelineAsset`
Inherits: `Object` | Header: `InterchangePythonPipelineBase.h`

This class is a helper class for Python pipelines. It allows the class picker to filter the Content Browser instance we want to support in the pipeline stack. Use this class factory to be able to crea...

### `unreal.InterchangePythonPipelineBase`
Inherits: `InterchangePipelineBase` | Header: `InterchangePythonPipelineBase.h`

This class represents a Python pipeline. It is used by the TSoftClassPtr of the PythonPipeline asset.

### `unreal.InterchangeSceneImportAsset`
Inherits: `Object` | Header: `InterchangeSceneImportAsset.h`

Class to hold all the data required to properly re-import a level

**Methods** (3):
  - `add_asset_user_data_of_class(user_data_class)` -> `bool` — Creates and adds an instance of the provided AssetUserData class to the target asset.
  - `get_asset_user_data_of_class(user_data_class)` -> `AssetUserData` — Returns an instance of the provided AssetUserData class if itâs contained in the target asset.
  - `has_asset_user_data_of_class(user_data_class)` -> `bool` — Checks whether or not an instance of the provided AssetUserData class is contained.

### `unreal.InterchangePipelineConfigurationDialogResult`
Inherits: `EnumBase` | Header: `InterchangePipelineConfigurationBase.h`

EInterchange Pipeline Configuration Dialog Result

**Properties** (4):
  - `CANCEL`: `InterchangePipelineConfigurationDialogResult = Ellipsis` — 0
  - `IMPORT`: `InterchangePipelineConfigurationDialogResult = Ellipsis` — 1
  - `IMPORT_ALL`: `InterchangePipelineConfigurationDialogResult = Ellipsis` — 2
  - `SAVE_CONFIG`: `InterchangePipelineConfigurationDialogResult = Ellipsis` — 3

### `unreal.OnImportDoneDynamic`
Inherits: `DelegateBase` | Header: `InterchangeManager.h`

On Import Done Dynamic Delegate Signature

### `unreal.OnObjectImportDoneDynamic`
Inherits: `DelegateBase` | Header: `InterchangeManager.h`

Some utility delegates for automating Interchange.
