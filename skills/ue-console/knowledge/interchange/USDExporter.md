# UE Python API — USDExporter Module

**20 types** from the `USDExporter` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LevelExporterUSDOptionsInner`, `UsdMaterialBakingOptions`, `UsdMeshAssetOptions`, `UsdMetadataExportOptions`, `AnimSequenceExporterUSD`, `AnimSequenceExporterUSDOptions`, `GeometryCacheExporterUSD`, `GeometryCacheExporterUSDOptions`, `LevelExporterUSD`, `LevelExporterUSDOptions`, `LevelSequenceExporterUsd`, `LevelSequenceExporterUsdOptions`, `MaterialExporterUsd`, `MaterialExporterUSDOptions`, `SkeletalMeshExporterUsd`, `SkeletalMeshExporterUSDOptions`, `StaticMeshExporterUsd`, `StaticMeshExporterUSDOptions`, `UsdConversionContext`, `UsdConversionLibrary`

---

## Classes

### `unreal.LevelExporterUSDOptionsInner`
Inherits: `StructBase` | Header: `LevelExporterUSDOptions.h`

Level Exporter USDOptions Inner

**Properties** (13):
  - `asset_folder`: `DirectoryPath` — [Read-Write] Where to place all the generated asset files (DirectoryPath)
  - `asset_options`: `UsdMeshAssetOptions` — [Read-Write] Options to use for all exported assets when appropriate (e.g. static and skeletal meshe...
  - `export_actor_folders`: `bool` — [Read-Write] Whether to use UE actor folders as empty prims (bool)
  - `export_foliage_on_actors_layer`: `bool` — [Read-Write] By default foliage instances will be exported to the same layer as the component they w...
  - `export_sublayers`: `bool` — [Read-Write] If true, will export sub-levels as separate layers (referenced as sublayers). If false,...
  - `highest_landscape_lod`: `int` — [Read-Write] Highest of the LOD indices to export landscapes with. Each value above 0 halves resolut...
  - `ignore_sequencer_animations`: `bool` — [Read-Write] If true, and if we have a level sequence animating the level during export, it will rev...
  - `landscape_bake_resolution`: `IntPoint` — [Read-Write] Resolution to use when baking landscape materials into textures (IntPoint)
  - `levels_to_ignore`: `None` — [Read-Write] Names of levels that should be ignored when collecting actors to export (e.g. âPersis...
  - `lowest_landscape_lod`: `int` — [Read-Write] Lowest of the LOD indices to export landscapes with (use 0 for full resolution) (int32)
  - `metadata_options`: `UsdMetadataExportOptions` — [Read-Write] Options to use when exporting UsdAssetUserData metadata to USD for all assets (includin...
  - `root_prim_name`: `str` — [Read-Write] Name of the single top-level prim that is emitted when exporting Levels and LevelSequen...
  - `selection_only`: `bool` — [Read-Write] Whether to export only the selected actors, and assets used by them (bool)

### `unreal.UsdMaterialBakingOptions`
Inherits: `StructBase` | Header: `USDAssetOptions.h`

Usd Material Baking Options

**Properties** (4):
  - `constant_color_as_single_value`: `bool` — [Read-Write] When this is true and a baked texture contains a single flat color we will write out th...
  - `default_texture_size`: `IntPoint` — [Read-Write] Size of the baked texture for all properties that donât have a CustomSize set (IntPoi...
  - `properties`: `None` — [Read-Write] Properties which are supposed to be baked out for the material (Array[PropertyEntry])
  - `textures_dir`: `DirectoryPath` — [Read-Write] Where baked textures are placed. Intentionally not a config as itâs heavily dependent...

### `unreal.UsdMeshAssetOptions`
Inherits: `StructBase` | Header: `USDAssetOptions.h`

Usd Mesh Asset Options

**Properties** (8):
  - `bake_materials`: `bool` — [Read-Write] Whether to bake the meshâs assigned material and export these as separate UsdPreviewS...
  - `convert_skeletal_to_non_skeletal`: `bool` — [Read-Write] Whether to convert skeletal data to non-skeletal, ie. skeletal mesh to static mesh, ani...
  - `export_static_mesh_source_data`: `bool` — [Read-Write] If true it means weâll try exporting the source data when exporting static meshes.
No...
  - `highest_mesh_lod`: `int` — [Read-Write] Highest of the LOD indices to export static and skeletal meshes with (int32)
  - `lowest_mesh_lod`: `int` — [Read-Write] Lowest of the LOD indices to export static and skeletal meshes with (use 0 for full det...
  - `material_baking_options`: `UsdMaterialBakingOptions` — [Read-Write] (UsdMaterialBakingOptions)
  - `payload_format`: `str` — [Read-Write] USD format to use for exported payload files (str)
  - `use_payload`: `bool` — [Read-Write] If true, the mesh data is exported to yet another âpayloadâ file, and referenced vi...

### `unreal.UsdMetadataExportOptions`
Inherits: `StructBase` | Header: `USDMetadataExportOptions.h`

Usd Metadata Export Options

**Properties** (5):
  - `blocked_prefix_filters`: `None` — [Read-Write] When exporting metadata, we will ignore all entries that start with these prefixes.
Not...
  - `export_asset_info`: `bool` — [Read-Write] Export generic assetInfo when exporting assets (such as export time, engine version, et...
  - `export_asset_metadata`: `bool` — [Read-Write] Export metadata held on assetsâ UsdAssetUserData to the output prim.
Note that metada...
  - `export_component_metadata`: `bool` — [Read-Write] Export metadata held on componentsâ UsdAssetUserData to the output prims.
This only h...
  - `invert_filters`: `bool` — [Read-Write] When this is false (default), the âBlockedPrefixFiltersâ property describe prefixes...

### `unreal.AnimSequenceExporterUSD`
Inherits: `Exporter` | Header: `AnimSequenceExporterUSD.h`

Anim Sequence Exporter USD

### `unreal.AnimSequenceExporterUSDOptions`
Inherits: `Object` | Header: `AnimSequenceExporterUSDOptions.h`

Options for exporting skeletal mesh animations to USD format.

**Properties** (5):
  - `export_preview_mesh`: `bool` — [Read-Write] Whether to also export the skeletal mesh data of the preview mesh (bool)
  - `metadata_options`: `UsdMetadataExportOptions` — [Read-Write] Options to use when exporting UsdAssetUserData metadata to USD for all assets (includin...
  - `preview_mesh_options`: `UsdMeshAssetOptions` — [Read-Write] Export options to use for the preview mesh, if enabled (UsdMeshAssetOptions)
  - `re_export_identical_assets`: `bool` — [Read-Write] Whether to export any asset (StaticMesh, Material, etc.) even if the existing file alre...
  - `stage_options`: `UsdStageOptions` — [Read-Write] Export options to use for the layer where the animation is emitted (UsdStageOptions)

### `unreal.GeometryCacheExporterUSD`
Inherits: `Exporter` | Header: `GeometryCacheExporterUSD.h`

Geometry Cache Exporter USD

### `unreal.GeometryCacheExporterUSDOptions`
Inherits: `Object` | Header: `GeometryCacheExporterUSDOptions.h`

Options for exporting geometry caches to USD format.

**Properties** (4):
  - `mesh_asset_options`: `UsdMeshAssetOptions` — [Read-Write] (UsdMeshAssetOptions)
  - `metadata_options`: `UsdMetadataExportOptions` — [Read-Write] (UsdMetadataExportOptions)
  - `re_export_identical_assets`: `bool` — [Read-Write] Whether to export any asset (StaticMesh, Material, etc.) even if the existing file alre...
  - `stage_options`: `UsdStageOptions` — [Read-Write] (UsdStageOptions)

### `unreal.LevelExporterUSD`
Inherits: `Exporter` | Header: `LevelExporterUSD.h`

Level Exporter USD

### `unreal.LevelExporterUSDOptions`
Inherits: `Object` | Header: `LevelExporterUSDOptions.h`

Options for exporting levels to USD format.

**Properties** (7):
  - `current_task`: `AssetExportTask` [Read-Only] — [Read-Only] We temporarily stash our export task here as a way of passing our options down to
the Py...
  - `end_time_code`: `float` — [Read-Write] EndTimeCode to be used for all exported layers (float)
  - `inner`: `LevelExporterUSDOptionsInner` — [Read-Write] Inner struct that actually contains most of the export options (LevelExporterUSDOptions...
  - `re_export_identical_assets`: `bool` — [Read-Write] Whether to export any asset (StaticMesh, Material, etc.) even if the existing file alre...
  - `re_export_identical_levels_and_sequences`: `bool` — [Read-Write] Whether to export levels and LevelSequences even if the existing files already describe...
  - `stage_options`: `UsdStageOptions` — [Read-Write] Basic options about the stage to export (UsdStageOptions)
  - `start_time_code`: `float` — [Read-Write] StartTimeCode to be used for all exported layers (float)

### `unreal.LevelSequenceExporterUsd`
Inherits: `Exporter` | Header: `LevelSequenceExporterUSD.h`

Level Sequence Exporter Usd

### `unreal.LevelSequenceExporterUsdOptions`
Inherits: `Object` | Header: `LevelSequenceExporterUSDOptions.h`

Options for level sequences to the USD format.

**Properties** (14):
  - `end_frame`: `int` — [Read-Write] Final frame of the level sequence to bake out to USD (inclusive) (int32)
  - `export_level`: `bool` — [Read-Write] Exports the provided level alongside the layer that represents the exported Level Seque...
  - `export_separate_prims_per_spawnable_instance`: `bool` — [Read-Write] If you have multiple instances of a same LevelSequence subsection with spawnables, sett...
  - `export_subsequences_as_layers`: `bool` — [Read-Write] The effect of subsequences is always included on the main exported layer, but if this o...
  - `level`: `World` — [Read-Write] (World)
  - `level_export_options`: `LevelExporterUSDOptionsInner` — [Read-Write] (LevelExporterUSDOptionsInner)
  - `override_export_range`: `bool` — [Read-Write] If checked will cause StartFrame and EndFrame to be used as the frame range for the lev...
  - `re_export_identical_assets`: `bool` — [Read-Write] Whether to export any asset (StaticMesh, Material, etc.) even if the existing file alre...
  - `re_export_identical_levels_and_sequences`: `bool` — [Read-Write] Whether to export levels and LevelSequences even if the existing files already describe...
  - `selection_only`: `bool` — [Read-Write] Whether to export animations exclusively from selected actors or components (bool)
  - `stage_options`: `UsdStageOptions` — [Read-Write] Export options to use for the layer where the animation is emitted (UsdStageOptions)
  - `start_frame`: `int` — [Read-Write] Initial frame of the level sequence to bake out to USD (inclusive) (int32)
  - `time_codes_per_second`: `float` — [Read-Write] Value to bake all generated USD layers with (float)
  - `use_exported_level_as_sublayer`: `bool` — [Read-Write] If checked this will also add the exported level as a sublayer to the USD files emitted...

### `unreal.MaterialExporterUsd`
Inherits: `Exporter` | Header: `MaterialExporterUSD.h`

Material Exporter Usd

### `unreal.MaterialExporterUSDOptions`
Inherits: `Object` | Header: `MaterialExporterUSDOptions.h`

Options for exporting materials to USD format. We use a dedicated object instead of reusing the MaterialBaking module as automated export tasks can only have one options object, and we need to also pr...

**Properties** (3):
  - `material_baking_options`: `UsdMaterialBakingOptions` — [Read-Write] (UsdMaterialBakingOptions)
  - `metadata_options`: `UsdMetadataExportOptions` — [Read-Write] (UsdMetadataExportOptions)
  - `re_export_identical_assets`: `bool` — [Read-Write] Whether to export any asset (StaticMesh, Material, etc.) even if the existing file alre...

### `unreal.SkeletalMeshExporterUsd`
Inherits: `Exporter` | Header: `SkeletalMeshExporterUSD.h`

Skeletal Mesh Exporter Usd

### `unreal.SkeletalMeshExporterUSDOptions`
Inherits: `Object` | Header: `SkeletalMeshExporterUSDOptions.h`

Options for exporting skeletal meshes to USD format.

**Properties** (4):
  - `mesh_asset_options`: `UsdMeshAssetOptions` — [Read-Write] (UsdMeshAssetOptions)
  - `metadata_options`: `UsdMetadataExportOptions` — [Read-Write] (UsdMetadataExportOptions)
  - `re_export_identical_assets`: `bool` — [Read-Write] Whether to export any asset (StaticMesh, Material, etc.) even if the existing file alre...
  - `stage_options`: `UsdStageOptions` — [Read-Write] (UsdStageOptions)

### `unreal.StaticMeshExporterUsd`
Inherits: `Exporter` | Header: `StaticMeshExporterUSD.h`

Static Mesh Exporter Usd

**Methods** (1):
  - `is_usd_available()` -> `bool` [classmethod] — Is Usd Available

### `unreal.StaticMeshExporterUSDOptions`
Inherits: `Object` | Header: `StaticMeshExporterUSDOptions.h`

Options for exporting static meshes to USD format.

**Properties** (4):
  - `mesh_asset_options`: `UsdMeshAssetOptions` — [Read-Write] (UsdMeshAssetOptions)
  - `metadata_options`: `UsdMetadataExportOptions` — [Read-Write] (UsdMetadataExportOptions)
  - `re_export_identical_assets`: `bool` — [Read-Write] Whether to export any asset (StaticMesh, Material, etc.) even if the existing file alre...
  - `stage_options`: `UsdStageOptions` — [Read-Write] (UsdStageOptions)

### `unreal.UsdConversionContext`
Inherits: `Object` | Header: `USDConversionBlueprintContext.h`

Wraps the UnrealToUsd component conversion functions from the USDUtilities module so that they can be used by scripting languages.

**Methods** (30):
  - `cleanup()` -> `None` — Discards the currently opened stage. This is critical when using this class via scripting: The C++ destructor will not b...
  - `convert_audio_component(component, prim_path, time_code = 340282346638528859811704183484516925440.000000, file_path_only = False)` -> `bool` — Convert Audio Component
  - `convert_cine_camera_component(component, prim_path, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Cine Camera Component
  - `convert_directional_light_component(component, prim_path, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Directional Light Component
  - `convert_draw_mode_component(component, prim_path, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Draw Mode Component
  - `convert_hism_component(component, prim_path, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Hism Component
  - `convert_instanced_foliage_actor(actor, prim_path, instances_level = None, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Instanced Foliage Actor
  - `convert_ism_component(component, prim_path, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Ism Component
  - `convert_landscape_proxy_actor_material(actor, prim_path, properties_to_bake, default_texture_size, textures_dir, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Landscape Proxy Actor Material
  - `convert_landscape_proxy_actor_mesh(actor, prim_path, lowest_lod, highest_lod, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Landscape Proxy Actor Mesh
  - `convert_light_component(component, prim_path, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Note: We use FLT_MAX on these functions because Usd.TimeCode.Default().GetValue() is actually a nan, and nan arguments a...
  - `convert_material_overrides(mesh_asset, material_overrides, prim_path, lowest_lod, highest_lod)` -> `bool` — Convert Material Overrides
  - `convert_mesh_component(component, prim_path)` -> `bool` — Convert Mesh Component
  - `convert_point_light_component(component, prim_path, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Point Light Component
  - `convert_rect_light_component(component, prim_path, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Rect Light Component
  - `convert_scene_component(component, prim_path)` -> `bool` — Convert Scene Component
  - `convert_sky_light_component(component, prim_path, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Sky Light Component
  - `convert_spot_light_component(component, prim_path, time_code = 340282346638528859811704183484516925440.000000)` -> `bool` — Convert Spot Light Component
  - `get_edit_target()` -> `FilePath` — Gets the filepath of the current edit target layer of our internal stage
  - `get_prim_asset_info(prim_path)` -> `UsdUnrealAssetInfo` — Retrieves from Prim the assetInfo metadata values that we use as export metadata, when exporting Unreal assets
  - `get_prim_metadata(prim_path, blocked_prefix_filter, invert_filter, collect_from_entire_subtrees)` -> `UsdCombinedPrimMetadata` — Extracts metadata from the prim at PrimPath using the provided filters and returns it
  - `get_stage_root_layer()` -> `FilePath` — Gets the file path of the root layer of our current stage
  - `get_usd_stage_num_frames()` -> `int32` — Returns how many frames of animation the stage would generate if imported
  - `remove_unreal_surface_output(prim_path, layer_to_author_in)` -> `bool` — Remove Unreal Surface Output
  - `replace_unreal_materials_with_baked(layer_to_author_in, baked_materials, is_asset_layer, use_payload, remove_unreal_materials = False)` -> `None` — Traverses the contextâs stage and authors material binding attributes for all unrealMaterials that were baked into USD...
  - `set_edit_target(edit_target_layer_path)` -> `None` — Sets the current edit target of our internal stage. When calling the conversion functions, prims and attributes will be ...
  - `set_prim_asset_info(prim_path, info)` -> `None` — Adds to Prim the assetInfo metadata the values described in Info
  - `set_prim_metadata(prim_path, metadata, blocked_prefix_filter, invert_filter)` -> `None` — Applies Metadata to the prim specified at PrimPath, using the provided filters
  - `set_prim_metadata_from_user_data(prim_path, user_data, blocked_prefix_filter, invert_filter)` -> `None` — Applies all the metadata contained in UserData to the prim specified at PrimPath, using the provided filters
  - `set_stage_root_layer(stage_root_layer_path)` -> `None` — Opens or creates a USD stage using StageRootLayerPath as root layer, creating the root layer if needed. All future conve...

### `unreal.UsdConversionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `USDConversionBlueprintLibrary.h`

Wrapped static conversion functions from the UsdUtilities module, so that they can be used via scripting

**Methods** (166):
  - `add_payload(referencing_stage_path, referencing_prim_path, target_stage_path, target_prim_path = '', time_code_offset = 0.000000, time_code_scale = 1.000000, use_project_default_type_handling = False, referencer_type_handling = ReferencerTypeHandling.MATCH_REFERENCED_TYPE)` -> `None` [classmethod] — Adds a payload to the layer at AbsoluteFilePath, optionally specifying a target prim inside that layer.
  - `add_reference(referencing_stage_path, referencing_prim_path, target_stage_path, target_prim_path = '', time_code_offset = 0.000000, time_code_scale = 1.000000, use_project_default_type_handling = False, referencer_type_handling = ReferencerTypeHandling.MATCH_REFERENCED_TYPE)` -> `None` [classmethod] — Adds a reference to the layer at AbsoluteFilePath, optionally specifying a target prim inside that layer.
  - `begin_unique_path_scope()` -> `None` [classmethod] — Begins a UniquePathScope, incrementing the internal scope counter. During a UniquePathScope, all paths returned by GetUn...
  - `block_analytics_events()` -> `None` [classmethod] — Block Analytics Events
  - `can_export_to_layer(target_file_path)` -> `bool` [classmethod] — Checks whether we can create a USD Layer with âTargetFilePathâ as identifier and export to it
  - `can_paste_prims()` -> `bool` [classmethod] — Returns true if we have prims that we can paste within our clipboard stage
  - `clear_metadata_field(asset_user_data, key, stage_identifier = '', prim_path = '', trigger_property_change_events = True)` -> `bool` [classmethod] — Clear Metadata Field
  - `clear_prim_clipboard()` -> `None` [classmethod] — Clears all prims from our clipboard stage
  - `copy_prims(stage_root_layer, prim_paths)` -> `bool` [classmethod] — Copies flattened versions of the input prims onto the clipboard stage. These copied prims can then be pasted with PasteP...
  - `cut_prims(stage_root_layer, prim_paths)` -> `bool` [classmethod] — Copies flattened versions of the input prims onto the clipboard stage and removes all the prim specs for Prims from thei...
  - `duplicate_prims(stage_root_layer, prim_paths, duplicate_type, target_layer)` -> `Array [ str ]` [classmethod] — Duplicates all provided Prims one-by-one, performing the requested DuplicateType. See the documentation on EUsdDuplicate...
  - `end_unique_path_scope()` -> `None` [classmethod] — Ends a UniquePathScope, decrementing the internal scope counter. If the internal scope counter reaches zero (i.e. all pr...
  - `generate_object_version_string(object_to_export, export_options)` -> `str` [classmethod] — Generates a unique identifier string that involves ObjectToExportâs packageâs persistent guid, the corresponding fil...
  - `get_actors_to_convert(world)` -> `Set [ Actor ]` [classmethod] — Get Actors to Convert
  - `get_analytics_attributes(options)` -> `Array [ AnalyticsEventAttr ]` [classmethod] — Retrieves the analytics attributes to send for the provided options object
  - `get_instance_transforms(actor, foliage_type, instances_level = None)` -> `Array [ Transform ]` [classmethod] — Returns the transforms of all instances of a particular UFoliageType on a given level. If no level is provided all insta...
  - `get_instanced_foliage_actor_for_level(create_if_none = False, level = None)` -> `InstancedFoliageActor` [classmethod] — Wraps AInstancedFoliageActor::GetInstancedFoliageActorForLevel, and allows retrieving the current AInstancedFoliageActor...
  - `get_loaded_level_names(world)` -> `Array [ str ]` [classmethod] — Returns the path name (e.g. â/Game/Maps/MyLevelâ) of levels that are loaded on World . We use these to revert the Wo...
  - `get_metadata_field(asset_user_data, key, stage_identifier = '', prim_path = '')` -> `UsdMetadataValue` [classmethod] — Get Metadata Field
  - `get_num_levels_to_export(world, levels_to_ignore)` -> `int32` [classmethod] — Returns how many total Unreal levels (persistent + all sublevels) will be exported if we consider LevelsToIgnore
  - `get_prim_path_for_object(actor_or_component, parent_prim_path = '', use_actor_folders = False, root_prim_name = 'Root')` -> `str` [classmethod] — Get Prim Path for Object
  - `get_schema_name_for_component(component)` -> `str` [classmethod] — Get Schema Name for Component
  - `get_source(foliage_type)` -> `Object` [classmethod] — Returns the source asset for a UFoliageType. It can be a UStaticMesh in case weâre dealing with a UFoliageType_Instanc...
  - `get_unique_file_path_for_export(desired_path_with_extension)` -> `str` [classmethod] — If weâre inside of a UniquePathScope, returns a sanitized (and potentially suffixed) path that is guaranteed to not co...
  - `get_usd_asset_user_data(object)` -> `UsdAssetUserData` [classmethod] — Retrieve the first instance of UUsdAssetUserData contained on the Object, if any
  - `get_used_foliage_types(actor)` -> `Array [ FoliageType ]` [classmethod] — Returns all the different types of UFoliageType assets that a particular AInstancedFoliageActor uses. This function exis...
  - `get_visible_in_editor_level_names(world)` -> `Array [ str ]` [classmethod] — Returns the path name (e.g. â/Game/Maps/MyLevelâ) of levels that checked to be visible in the editor within World . ...
  - `has_metadata_field(asset_user_data, key, stage_identifier = '', prim_path = '')` -> `bool` [classmethod] — Has Metadata Field
  - `insert_sub_layer(parent_layer_path, sub_layer_path, index = -1)` -> `None` [classmethod] — Insert Sub Layer
  - `make_path_relative_to_layer(anchor_layer_path, path_to_make_relative)` -> `str` [classmethod] — Make Path Relative to Layer
  - `paste_prims(stage_root_layer, parent_prim_path)` -> `Array [ str ]` [classmethod] — Pastes the prims from the clipboard stage as children of ParentPrim. The pasted prims may be renamed in order to have va...
  - `reapply_sequencer_animations()` -> `None` [classmethod] — If we used ReverseSequencerAnimations to undo the effect of an opened sequencer before export, this function can be used...
  - `remove_all_prim_specs(stage_root_layer, prim_path, target_layer)` -> `None` [classmethod] — Removes all the prim specs for Prim on the given Layer. This function is useful in case the prim is inside a variant set...
  - `resume_analytics_events()` -> `None` [classmethod] — Resume Analytics Events
  - `revert_sequencer_animations()` -> `None` [classmethod] — If we have the Sequencer open with a level sequence animating the level before export, this function can revert any acto...
  - `send_analytics(attrs, event_name, automated, elapsed_seconds, number_of_frames, extension)` -> `None` [classmethod] — Defer to the USDClasses module to actually send analytics information
  - `set_metadata_field(asset_user_data, key, value, value_type_name, stage_identifier = '', prim_path = '', trigger_property_change_events = True)` -> `bool` [classmethod]
  - `set_usd_asset_user_data(object, asset_user_data)` -> `bool` [classmethod]
  - `stream_in_required_levels(world, levels_to_ignore)` -> `None` [classmethod] — Fully streams in and displays all levels whose names are not in LevelsToIgnore
  - `stream_out_levels(owning_world, level_names_to_stream_out, level_names_to_hide)` -> `None` [classmethod] — Streams out/hides sublevels that were streamed in before export
  - `stringify_as_asset_path(value)` -> `str` [classmethod] — Stringify as Asset Path
  - `stringify_as_asset_path_array(value)` -> `str` [classmethod] — Stringify as Asset Path Array
  - `stringify_as_bool(value)` -> `str` [classmethod] — Stringify functions
  - `stringify_as_bool_array(value)` -> `str` [classmethod] — Stringify array functions
  - `stringify_as_double(value)` -> `str` [classmethod] — Stringify as Double
  - `stringify_as_double2(value)` -> `str` [classmethod] — Stringify as Double 2
  - `stringify_as_double2_array(value)` -> `str` [classmethod] — Stringify as Double 2Array
  - `stringify_as_double3(value)` -> `str` [classmethod] — Stringify as Double 3
  - `stringify_as_double3_array(value)` -> `str` [classmethod] — Stringify as Double 3Array
  - `stringify_as_double4(value)` -> `str` [classmethod] — Stringify as Double 4
  - `stringify_as_double4_array(value)` -> `str` [classmethod] — Stringify as Double 4Array
  - `stringify_as_double_array(value)` -> `str` [classmethod] — Stringify as Double Array
  - `stringify_as_float(value)` -> `str` [classmethod] — Stringify as Float
  - `stringify_as_float2(value)` -> `str` [classmethod] — Stringify as Float 2
  - `stringify_as_float2_array(value)` -> `str` [classmethod] — Stringify as Float 2Array
  - `stringify_as_float3(value)` -> `str` [classmethod] — Stringify as Float 3
  - `stringify_as_float3_array(value)` -> `str` [classmethod] — Stringify as Float 3Array
  - `stringify_as_float4(value)` -> `str` [classmethod] — Stringify as Float 4
  - `stringify_as_float4_array(value)` -> `str` [classmethod] — Stringify as Float 4Array
  - `stringify_as_float_array(value)` -> `str` [classmethod] — Stringify as Float Array
  - `stringify_as_half(value)` -> `str` [classmethod] — Stringify as Half
  - `stringify_as_half2(value)` -> `str` [classmethod] — Stringify as Half 2
  - `stringify_as_half2_array(value)` -> `str` [classmethod] — Stringify as Half 2Array
  - `stringify_as_half3(value)` -> `str` [classmethod] — Stringify as Half 3
  - `stringify_as_half3_array(value)` -> `str` [classmethod] — Stringify as Half 3Array
  - `stringify_as_half4(value)` -> `str` [classmethod] — Stringify as Half 4
  - `stringify_as_half4_array(value)` -> `str` [classmethod] — Stringify as Half 4Array
  - `stringify_as_half_array(value)` -> `str` [classmethod] — Stringify as Half Array
  - `stringify_as_int(value)` -> `str` [classmethod] — Stringify as Int
  - `stringify_as_int2(value)` -> `str` [classmethod] — Stringify as Int 2
  - `stringify_as_int2_array(value)` -> `str` [classmethod] — Stringify as Int 2Array
  - `stringify_as_int3(value)` -> `str` [classmethod] — Stringify as Int 3
  - `stringify_as_int3_array(value)` -> `str` [classmethod] — Stringify as Int 3Array
  - `stringify_as_int4(value)` -> `str` [classmethod] — Stringify as Int 4
  - `stringify_as_int4_array(value)` -> `str` [classmethod] — Stringify as Int 4Array
  - `stringify_as_int64(value)` -> `str` [classmethod] — Stringify as Int 64
  - `stringify_as_int64_array(value)` -> `str` [classmethod] — Stringify as Int 64Array
  - `stringify_as_int_array(value)` -> `str` [classmethod] — Stringify as Int Array
  - `stringify_as_list_op_tokens(value)` -> `str` [classmethod] — Stringify as List Op Tokens
  - `stringify_as_matrix2d(value)` -> `str` [classmethod] — Stringify as Matrix 2d
  - `stringify_as_matrix2d_array(value)` -> `str` [classmethod] — Stringify as Matrix 2d Array
  - `stringify_as_matrix3d(value)` -> `str` [classmethod] — Stringify as Matrix 3d
  - `stringify_as_matrix3d_array(value)` -> `str` [classmethod] — Stringify as Matrix 3d Array
  - `stringify_as_matrix4d(value)` -> `str` [classmethod] — Stringify as Matrix 4d
  - `stringify_as_matrix4d_array(value)` -> `str` [classmethod] — Stringify as Matrix 4d Array
  - `stringify_as_quatd(value)` -> `str` [classmethod] — Stringify as Quatd
  - `stringify_as_quatd_array(value)` -> `str` [classmethod] — Stringify as Quatd Array
  - `stringify_as_quatf(value)` -> `str` [classmethod] — Stringify as Quatf
  - `stringify_as_quatf_array(value)` -> `str` [classmethod] — Stringify as Quatf Array
  - `stringify_as_quath(value)` -> `str` [classmethod] — Stringify as Quath
  - `stringify_as_quath_array(value)` -> `str` [classmethod] — Stringify as Quath Array
  - `stringify_as_string(value)` -> `str` [classmethod] — Stringify as String
  - `stringify_as_string_array(value)` -> `str` [classmethod] — Stringify as String Array
  - `stringify_as_timecode(value)` -> `str` [classmethod] — Stringify as Time Code
  - `stringify_as_timecode_array(value)` -> `str` [classmethod] — Stringify as Time Code Array
  - `stringify_as_token(value)` -> `str` [classmethod] — Stringify as Token
  - `stringify_as_token_array(value)` -> `str` [classmethod] — Stringify as Token Array
  - `stringify_as_uchar(value)` -> `str` [classmethod] — Stringify as UChar
  - `stringify_as_uchar_array(value)` -> `str` [classmethod] — Stringify as UChar Array
  - `stringify_as_uint(value)` -> `str` [classmethod] — Stringify as UInt
  - `stringify_as_uint64(value)` -> `str` [classmethod] — Stringify as UInt 64
  - `stringify_as_uint64_array(value)` -> `str` [classmethod] — Stringify as UInt 64Array
  - `stringify_as_uint_array(value)` -> `str` [classmethod] — Stringify as UInt Array
  - `unstringify_as_asset_path(string)` -> `str` [classmethod] — Unstringify as Asset Path
  - `unstringify_as_asset_path_array(string)` -> `Array [ str ]` [classmethod] — Unstringify as Asset Path Array
  - `unstringify_as_bool(string)` -> `bool` [classmethod] — Unstringify functions
  - `unstringify_as_bool_array(string)` -> `Array [ bool ]` [classmethod] — Unstringify array functions
  - `unstringify_as_double(string)` -> `double` [classmethod] — Unstringify as Double
  - `unstringify_as_double2(string)` -> `Vector2D` [classmethod] — Unstringify as Double 2
  - `unstringify_as_double2_array(string)` -> `Array [ Vector2D ]` [classmethod] — Unstringify as Double 2Array
  - `unstringify_as_double3(string)` -> `Vector` [classmethod] — Unstringify as Double 3
  - `unstringify_as_double3_array(string)` -> `Array [ Vector ]` [classmethod] — Unstringify as Double 3Array
  - `unstringify_as_double4(string)` -> `Vector4` [classmethod] — Unstringify as Double 4
  - `unstringify_as_double4_array(string)` -> `Array [ Vector4 ]` [classmethod] — Unstringify as Double 4Array
  - `unstringify_as_double_array(string)` -> `Array [ double ]` [classmethod] — Unstringify as Double Array
  - `unstringify_as_float(string)` -> `float` [classmethod] — Unstringify as Float
  - `unstringify_as_float2(string)` -> `Vector2D` [classmethod] — Unstringify as Float 2
  - `unstringify_as_float2_array(string)` -> `Array [ Vector2D ]` [classmethod] — Unstringify as Float 2Array
  - `unstringify_as_float3(string)` -> `Vector` [classmethod] — Unstringify as Float 3
  - `unstringify_as_float3_array(string)` -> `Array [ Vector ]` [classmethod] — Unstringify as Float 3Array
  - `unstringify_as_float4(string)` -> `Vector4` [classmethod] — Unstringify as Float 4
  - `unstringify_as_float4_array(string)` -> `Array [ Vector4 ]` [classmethod] — Unstringify as Float 4Array
  - `unstringify_as_float_array(string)` -> `Array [ float ]` [classmethod] — Unstringify as Float Array
  - `unstringify_as_half(string)` -> `float` [classmethod] — Unstringify as Half
  - `unstringify_as_half2(string)` -> `Vector2D` [classmethod] — Unstringify as Half 2
  - `unstringify_as_half2_array(string)` -> `Array [ Vector2D ]` [classmethod] — Unstringify as Half 2Array
  - `unstringify_as_half3(string)` -> `Vector` [classmethod] — Unstringify as Half 3
  - `unstringify_as_half3_array(string)` -> `Array [ Vector ]` [classmethod] — Unstringify as Half 3Array
  - `unstringify_as_half4(string)` -> `Vector4` [classmethod] — Unstringify as Half 4
  - `unstringify_as_half4_array(string)` -> `Array [ Vector4 ]` [classmethod] — Unstringify as Half 4Array
  - `unstringify_as_half_array(string)` -> `Array [ float ]` [classmethod] — Unstringify as Half Array
  - `unstringify_as_int(string)` -> `int32` [classmethod] — Unstringify as Int
  - `unstringify_as_int2(string)` -> `IntPoint` [classmethod] — Unstringify as Int 2
  - `unstringify_as_int2_array(string)` -> `Array [ IntPoint ]` [classmethod] — Unstringify as Int 2Array
  - `unstringify_as_int3(string)` -> `IntVector` [classmethod] — Unstringify as Int 3
  - `unstringify_as_int3_array(string)` -> `Array [ IntVector ]` [classmethod] — Unstringify as Int 3Array
  - `unstringify_as_int4(string)` -> `IntVector4` [classmethod] — Unstringify as Int 4
  - `unstringify_as_int4_array(string)` -> `Array [ IntVector4 ]` [classmethod] — Unstringify as Int 4Array
  - `unstringify_as_int64(string)` -> `int64` [classmethod] — Unstringify as Int 64
  - `unstringify_as_int64_array(string)` -> `Array [ int64 ]` [classmethod] — Unstringify as Int 64Array
  - `unstringify_as_int_array(string)` -> `Array [ int32 ]` [classmethod] — Unstringify as Int Array
  - `unstringify_as_list_op_tokens(string)` -> `Array [ str ]` [classmethod] — Unstringify as List Op Tokens
  - `unstringify_as_matrix2d(string)` -> `Matrix2D` [classmethod] — Unstringify as Matrix 2d
  - `unstringify_as_matrix2d_array(string)` -> `Array [ Matrix2D ]` [classmethod] — Unstringify as Matrix 2d Array
  - `unstringify_as_matrix3d(string)` -> `Matrix3D` [classmethod] — Unstringify as Matrix 3d
  - `unstringify_as_matrix3d_array(string)` -> `Array [ Matrix3D ]` [classmethod] — Unstringify as Matrix 3d Array
  - `unstringify_as_matrix4d(string)` -> `Matrix` [classmethod] — Unstringify as Matrix 4d
  - `unstringify_as_matrix4d_array(string)` -> `Array [ Matrix ]` [classmethod] — Unstringify as Matrix 4d Array
  - `unstringify_as_quatd(string)` -> `Quat` [classmethod] — Unstringify as Quatd
  - `unstringify_as_quatd_array(string)` -> `Array [ Quat ]` [classmethod] — Unstringify as Quatd Array
  - `unstringify_as_quatf(string)` -> `Quat` [classmethod] — Unstringify as Quatf
  - `unstringify_as_quatf_array(string)` -> `Array [ Quat ]` [classmethod] — Unstringify as Quatf Array
  - `unstringify_as_quath(string)` -> `Quat` [classmethod] — Unstringify as Quath
  - `unstringify_as_quath_array(string)` -> `Array [ Quat ]` [classmethod] — Unstringify as Quath Array
  - `unstringify_as_string(string)` -> `str` [classmethod] — Unstringify as String
  - `unstringify_as_string_array(string)` -> `Array [ str ]` [classmethod] — Unstringify as String Array
  - `unstringify_as_timecode(string)` -> `double` [classmethod] — Unstringify as Time Code
  - `unstringify_as_timecode_array(string)` -> `Array [ double ]` [classmethod] — Unstringify as Time Code Array
  - `unstringify_as_token(string)` -> `str` [classmethod] — Unstringify as Token
  - `unstringify_as_token_array(string)` -> `Array [ str ]` [classmethod] — Unstringify as Token Array
  - `unstringify_as_uchar(string)` -> `uint8` [classmethod] — Unstringify as UChar
  - `unstringify_as_uchar_array(string)` -> `Array [ uint8 ]` [classmethod] — Unstringify as UChar Array
  - `unstringify_as_uint(string)` -> `int32` [classmethod] — Unstringify as UInt
  - `unstringify_as_uint64(string)` -> `int64` [classmethod] — Unstringify as UInt 64
  - `unstringify_as_uint64_array(string)` -> `Array [ int64 ]` [classmethod] — Unstringify as UInt 64Array
  - `unstringify_as_uint_array(string)` -> `Array [ int32 ]` [classmethod] — Unstringify as UInt Array
