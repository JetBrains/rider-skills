# UE Python API — UnrealEd Module

**260 types** from the `UnrealEd` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `Collection`, `CollectionContainerSource`, `CSVImportSettings`, `EditorParameterGroup`, `EditorUserSceneTextureOverride`, `FbxMaterialBakeSize`, `ImportMeshLodSectionsData`, `IniStringValue`, `LightmassBooleanParameterValue`, `LightmassParameterizedMaterialSettings`, `LightmassParameterValue`, `LightmassScalarParameterValue`, `MaterialEditorPostProcessOverrides`, `PropertyEditorTestBasicStruct`, `PropertyEditorTestEditCondition`, `PropertyEditorTestInstancedStruct`, `PropertyEditorTestSubStruct`, `PropertyEditTestTextStruct`, `ActorElementsCopy`, `ActorElementsExporterT3D`, ... (260 total)

---

## Classes

### `unreal.Collection`
Inherits: `StructBase` | Header: `CollectionManagerScriptingSubsystem.h`

Collection Scripting Ref

**Properties** (3):
  - `container`: `Name` — [Read-Write] The name (not title) of the container that owns this collection. Defaults to the base g...
  - `name`: `Name` — [Read-Write] Friendly name of the collection. (Name)
  - `share_type`: `CollectionShareType` — [Read-Write] Share type of this collection, which controls its visibility. (CollectionShareType)

### `unreal.CollectionContainerSource`
Inherits: `StructBase` | Header: `CollectionManagerScriptingSubsystem.h`

Collection Scripting Container Source

**Properties** (2):
  - `name`: `Name` [Read-Only] — [Read-Only] The name of the container. Defaults to the base gameâs container. (Name)
  - `title`: `Text` [Read-Only] — [Read-Only] Friendly title of the container. (Text)

### `unreal.CSVImportSettings`
Inherits: `StructBase` | Header: `CSVImportFactory.h`

CSVImport Settings

**Properties** (3):
  - `import_curve_interp_mode`: `RichCurveInterpMode` — [Read-Write] (RichCurveInterpMode)
  - `import_row_struct`: `ScriptStruct` — [Read-Write] (ScriptStruct)
  - `import_type`: `CSVImportType` — [Read-Write] (CSVImportType)

### `unreal.EditorParameterGroup`
Inherits: `StructBase` | Header: `MaterialEditorInstanceConstant.h`

Editor Parameter Group

### `unreal.EditorUserSceneTextureOverride`
Inherits: `StructBase` | Header: `MaterialEditorInstanceConstant.h`

Editor User Scene Texture Override

### `unreal.FbxMaterialBakeSize`
Inherits: `StructBase` | Header: `FbxExportOption.h`

Fbx Material Bake Size

**Properties** (2):
  - `auto_detect`: `bool` — [Read-Write] If enabled, bake size is based on the largest texture used in the material inputâs ex...
  - `size`: `IntPoint` — [Read-Write] (IntPoint)

### `unreal.ImportMeshLodSectionsData`
Inherits: `StructBase` | Header: `FbxMeshImportData.h`

Action to add nodes to the graph based on selected objects

### `unreal.IniStringValue`
Inherits: `StructBase` | Header: `AssetGuideline.h`

Helper struct for setting string console ini values.

### `unreal.LightmassBooleanParameterValue`
Inherits: `LightmassParameterValue` | Header: `UnrealEdTypes.h`

Boolean parameter value

### `unreal.LightmassParameterizedMaterialSettings`
Inherits: `StructBase` | Header: `UnrealEdTypes.h`

Structure for âparameterizedâ Lightmass settings

### `unreal.LightmassParameterValue`
Inherits: `StructBase` | Header: `UnrealEdTypes.h`

Base LightmassParameterValue class

### `unreal.LightmassScalarParameterValue`
Inherits: `LightmassParameterValue` | Header: `UnrealEdTypes.h`

Scalar parameter value

### `unreal.MaterialEditorPostProcessOverrides`
Inherits: `StructBase` | Header: `MaterialEditorInstanceConstant.h`

Material Editor Post Process Overrides

### `unreal.PropertyEditorTestBasicStruct`
Inherits: `StructBase` | Header: `PropertyEditorTestObject.h`

This structs properties should be pushed out to categories inside its parent category unless it is in an array

### `unreal.PropertyEditorTestEditCondition`
Inherits: `StructBase` | Header: `PropertyEditorTestObject.h`

Property Editor Test Edit Condition

### `unreal.PropertyEditorTestInstancedStruct`
Inherits: `StructBase` | Header: `PropertyEditorTestObject.h`

Property Editor Test Instanced Struct

### `unreal.PropertyEditorTestSubStruct`
Inherits: `StructBase` | Header: `PropertyEditorTestObject.h`

Property Editor Test Sub Struct

### `unreal.PropertyEditTestTextStruct`
Inherits: `StructBase` | Header: `PropertyEditorTestObject.h`

Property Edit Test Text Struct

### `unreal.ActorElementsCopy`
Inherits: `Object` | Header: `ActorElementEditorCopyAndPaste.h`

Actor Elements Copy

**Properties** (1):
  - `actors_to_copy`: `None` — [Read-Write] (Array[Actor])

### `unreal.ActorElementsExporterT3D`
Inherits: `Exporter` | Header: `ActorElementEditorCopyAndPaste.h`

Actor Elements Exporter T3D

### `unreal.ActorExporterT3D`
Inherits: `Exporter` | Header: `ActorExporterT3D.h`

Actor Exporter T3D

### `unreal.ActorGroupingUtils`
Inherits: `Object` | Header: `ActorGroupingUtils.h`

Helper class for grouping actors in the level editor

**Methods** (13):
  - `add_selected_to_group()` -> `None` — Activates âAdd to Groupâ mode which allows the user to select a group to append current selection
  - `can_group_actors(actors_to_group)` -> `bool` — Check if the provided list of actors can be grouped together
  - `can_group_selected_actors()` -> `bool`
  - `get()` -> `ActorGroupingUtils` [classmethod] — Convenience method for accessing grouping utils in a blueprint or script
  - `group_actors(actors_to_group)` -> `GroupActor` — Creates a new group from the provided list of actors removing the actors from any existing groups they are already in
  - `group_selected()` -> `GroupActor` — Creates a new group from the current selection removing the actors from any existing groups they are already in
  - `is_grouping_active()` -> `bool` [classmethod] — Is Grouping Active
  - `lock_selected_groups()` -> `None` — Locks any groups in the current selection
  - `remove_selected_from_group()` -> `None` — Removes any groups or actors in the current selection from their immediate parent. If all actors/subgroups are removed, ...
  - `set_grouping_active(grouping_active)` -> `None` [classmethod] — Set Grouping Active
  - `ungroup_actors(actors_to_ungroup)` -> `None` — Disbands any groups that the provided actors belong to, does not attempt to maintain any hierarchy
  - `ungroup_selected()` -> `None` — Disbands any groups in the current selection, does not attempt to maintain any hierarchy
  - `unlock_selected_groups()` -> `None` — Unlocks any groups in the current selection

### `unreal.AimOffsetBlendSpaceFactory1D`
Inherits: `BlendSpaceFactory1D` | Header: `AimOffsetBlendSpaceFactory1D.h`

Aim Offset Blend Space Factory 1D

### `unreal.AimOffsetBlendSpaceFactoryNew`
Inherits: `BlendSpaceFactoryNew` | Header: `AimOffsetBlendSpaceFactoryNew.h`

Aim Offset Blend Space Factory New

### `unreal.AnimationThumbnailSkeletalMeshActor`
Inherits: `SkeletalMeshActor` | Header: `ThumbnailHelpers.h`

Animation Thumbnail Skeletal Mesh Actor

### `unreal.AnimBankFactory`
Inherits: `Factory` | Header: `AnimBankFactory.h`

Anim Bank Factory

**Properties** (2):
  - `preview_skeletal_mesh`: `SkeletalMesh` — [Read-Write] The preview mesh to use with this animation bank (SkeletalMesh)
  - `target_skeleton`: `Skeleton` — [Read-Write] (Skeleton)

### `unreal.AnimBlueprintFactory`
Inherits: `Factory` | Header: `AnimBlueprintFactory.h`

Anim Blueprint Factory

### `unreal.AnimBoneCompressionSettingsFactory`
Inherits: `Factory` | Header: `AnimBoneCompressionSettingsFactory.h`

Anim Bone Compression Settings Factory

### `unreal.AnimCompositeFactory`
Inherits: `Factory` | Header: `AnimCompositeFactory.h`

Anim Composite Factory

### `unreal.AnimCurveCompressionSettingsFactory`
Inherits: `Factory` | Header: `AnimCurveCompressionSettingsFactory.h`

Anim Curve Compression Settings Factory

### `unreal.AnimLayerInterfaceFactory`
Inherits: `AnimBlueprintFactory` | Header: `AnimBlueprintFactory.h`

Anim Layer Interface Factory

### `unreal.AnimMontageFactory`
Inherits: `Factory` | Header: `AnimMontageFactory.h`

Anim Montage Factory

**Properties** (2):
  - `source_animation`: `AnimSequence` — [Read-Write] Used when creating a montage from an AnimSequence, becomes the only AnimSequence contai...
  - `target_skeleton`: `Skeleton` — [Read-Write] (Skeleton)

### `unreal.AnimSeqExportOption`
Inherits: `Object` | Header: `AnimSeqExportOption.h`

Anim Seq Export Option

**Properties** (22):
  - `bake_timecode`: `bool` — [Read-Write] Set to true if sequence timecode should be baked into the sequence. Timecode rate will ...
  - `curve_interpolation`: `RichCurveInterpMode` — [Read-Write] This defines how values between keys are calculated for curves (RichCurveInterpMode)
  - `custom_display_rate`: `FrameRate` — [Read-Write] Custom display rate for use when specifying custom start and end frame, should be set f...
  - `custom_end_frame`: `FrameNumber` — [Read-Write] Custom end frame in custom display rate (FrameNumber)
  - `custom_frame_rate`: `FrameRate` — [Read-Write] Custom frame rate that the anim sequence will be recorded at (FrameRate)
  - `custom_start_frame`: `FrameNumber` — [Read-Write] Custom start frame in custom display rate (FrameNumber)
  - `delay_before_start`: `FrameNumber` — [Read-Write] Number of Display Rate frames to delay at the same frame before doing the export. It wi...
  - `evaluate_all_skeletal_mesh_components`: `bool` — [Read-Write] If true we evaluate all other skeletal mesh components under the same actor, this may b...
  - `exclude_animation_names`: `None` — [Read-Write] Exclude all animation bones/curves that match this list (Array[str])
  - `export_attribute_curves`: `bool` — [Read-Write] If enabled, export the attribute curves from the animation (bool)
  - `export_material_curves`: `bool` — [Read-Write] If enabled, export the material curves from the animation (bool)
  - `export_morph_targets`: `bool` — [Read-Write] If enabled, export the morph targets from the animation (bool)
  - `export_transforms`: `bool` — [Read-Write] If enabled, export the transforms from the animation (bool)
  - `include_animation_names`: `None` — [Read-Write] Include only the animation bones/curves that match this list (Array[str])
  - `interpolation`: `AnimInterpolationType` — [Read-Write] This defines how values between keys are calculated for transforms (AnimInterpolationTy...
  - `override_timecode_rate`: `FrameRate` — [Read-Write] Overriding timecode rate to be used when baking. (FrameRate)
  - `record_in_world_space`: `bool` — [Read-Write] If enabled we record in World Space otherwise we record from 0,0,0 (bool)
  - `timecode_rate_override`: `bool` — [Read-Write] Set to true if the timecode rate should be overridden with the specified value. (bool)
  - `transact_recording`: `bool` — [Read-Write] Whether or not to transact the animation sequence data recording (bool)
  - `use_custom_frame_rate`: `bool` — [Read-Write] Whether or not to use custom frame rate when recording the anim sequence, if false will...
  - `use_custom_time_range`: `bool` — [Read-Write] Whether or not to use custom time range (bool)
  - `warm_up_frames`: `FrameNumber` — [Read-Write] Number of Display Rate frames to evaluate before doing the export. It will evaluate aft...

### `unreal.AnimSequenceExporterFBX`
Inherits: `ExporterFBX` | Header: `AnimSequenceExporterFBX.h`

Anim Sequence Exporter FBX

### `unreal.AnimSequenceFactory`
Inherits: `Factory` | Header: `AnimSequenceFactory.h`

Anim Sequence Factory

**Properties** (2):
  - `preview_skeletal_mesh`: `SkeletalMesh` — [Read-Write] The preview mesh to use with this animation (SkeletalMesh)
  - `target_skeleton`: `Skeleton` — [Read-Write] (Skeleton)

### `unreal.AnimStreamableFactory`
Inherits: `Factory` | Header: `AnimStreamableFactory.h`

Anim Streamable Factory

### `unreal.AssetEditorSubsystem`
Inherits: `EditorSubsystem` | Header: `AssetEditorSubsystem.h`

UAssetEditorSubsystem

**Methods** (2):
  - `close_all_editors_for_asset(asset)` -> `int32` — Close all active editors for the supplied asset and return the number of asset editors that were closed
  - `open_editor_for_assets(assets, opened_method = AssetTypeActivationOpenedMethod.EDIT)` -> `bool` — Tries to open an editor for all of the specified assets. If any of the assets are already open, it will not create a new...

### `unreal.AssetEditorToolkitMenuContext`
Inherits: `Object` | Header: `AssetEditorToolkitMenuContext.h`

Asset Editor Toolkit Menu Context

**Methods** (1):
  - `get_editing_objects()` -> `Array [ Object ]` — Get Editing Objects

### `unreal.AssetGuideline`
Inherits: `AssetUserData` | Header: `AssetGuideline.h`

User data that can be attached to assets to check on load for guidlelines (plugins, project settings, etc).

### `unreal.AssetImportTask`
Inherits: `Object` | Header: `AssetImportTask.h`

Contains data for a group of assets to import

**Methods** (2):
  - `get_objects()` -> `Array [ Object ]` — Get the list of imported objects. Note that if the import was asynchronous, this will block until the results are ready....
  - `is_async_import_complete()` -> `bool` — Query whether this asynchronous import task is complete, and the results are ready to read. This will always return true...

**Properties** (12):
  - `async_`: `bool` — [Read-Write] Perform the import asynchronously for file formats where async import is available (boo...
  - `automated`: `bool` — [Read-Write] Avoid dialogs (bool)
  - `destination_name`: `str` — [Read-Write] Optional custom name to import as (if you are using interchange the name must be set in...
  - `destination_path`: `str` — [Read-Write] Path where asset will be imported to (str)
  - `factory`: `Factory` — [Read-Write] Optional factory to use (Factory)
  - `filename`: `str` — [Read-Write] Filename to import (str)
  - `imported_object_paths`: `None` — [Read-Write] Paths to objects created or updated after import (Array[str])
  - `options`: `Object` — [Read-Write] Import options specific to the type of asset (Object)
  - `replace_existing`: `bool` — [Read-Write] Overwrite existing assets (bool)
  - `replace_existing_settings`: `bool` — [Read-Write] Replace existing settings when overwriting existing assets (bool)
  - `result`: `None` — [Read-Write]
deprecated: Please use the GetObjects function instead. (Array[Object])
  - `save`: `bool` — [Read-Write] Save after importing (bool)

### `unreal.AutomatedAssetImportData`
Inherits: `Object` | Header: `AutomatedAssetImportData.h`

Contains data for a group of assets to import

**Properties** (8):
  - `destination_path`: `str` — [Read-Write] Content path in the projects content directory where assets will be imported (str)
  - `factory`: `Factory` — [Read-Write] Pointer to the factory currently being used (Factory)
  - `factory_name`: `str` — [Read-Write] Name of the factory to use when importing these assets. If not specified the factory ty...
  - `filenames`: `None` — [Read-Write] Filenames to import (Array[str])
  - `group_name`: `str` — [Read-Write] Display name of the group. This is for logging purposes only. (str)
  - `level_to_load`: `str` — [Read-Write] Full path to level to load before importing this group (only matters if importing asset...
  - `replace_existing`: `bool` — [Read-Write] Whether or not to replace existing assets (bool)
  - `skip_read_only`: `bool` — [Read-Write] Whether or not to skip importing over read only assets that could not be checked out (b...

### `unreal.BaseWidgetBlueprint`
Inherits: `UserWidgetBlueprint` | Header: `BaseWidgetBlueprint.h`

Base Widget Blueprint

### `unreal.BlendSpaceFactory1D`
Inherits: `Factory` | Header: `BlendSpaceFactory1D.h`

Blend Space Factory 1D

**Properties** (2):
  - `preview_skeletal_mesh`: `SkeletalMesh` — [Read-Write] The preview mesh to use for the created blendspace (SkeletalMesh)
  - `target_skeleton`: `Skeleton` — [Read-Write] Target skeleton for the created blendspace (Skeleton)

### `unreal.BlendSpaceFactoryNew`
Inherits: `Factory` | Header: `BlendSpaceFactoryNew.h`

Blend Space Factory New

**Properties** (2):
  - `preview_skeletal_mesh`: `SkeletalMesh` — [Read-Write] The preview mesh to use for the created blendspace (SkeletalMesh)
  - `target_skeleton`: `Skeleton` — [Read-Write] Target skeleton for the created blendspace (Skeleton)

### `unreal.BlueprintFactory`
Inherits: `Factory` | Header: `BlueprintFactory.h`

Blueprint Factory

### `unreal.BlueprintFunctionLibraryFactory`
Inherits: `BlueprintFactory` | Header: `BlueprintFunctionLibraryFactory.h`

Blueprint Function Library Factory

### `unreal.BlueprintInterfaceFactory`
Inherits: `BlueprintFactory` | Header: `BlueprintInterfaceFactory.h`

Blueprint Interface Factory

### `unreal.BlueprintMacroFactory`
Inherits: `BlueprintFactory` | Header: `BlueprintMacroFactory.h`

Blueprint Macro Factory

### `unreal.BlueprintPropertyContainerTestObject`
Inherits: `Object` | Header: `PropertyEditorTestObject.h`

Blueprint Property Container Test Object

### `unreal.BlueprintPropertyTestObject`
Inherits: `Object` | Header: `PropertyEditorTestObject.h`

Blueprint Property Test Object

### `unreal.CanvasRenderTarget2DFactoryNew`
Inherits: `Factory` | Header: `CanvasRenderTarget2DFactoryNew.h`

Canvas Render Target 2DFactory New

### `unreal.CollectionManagerSubsystem`
Inherits: `EditorSubsystem` | Header: `CollectionManagerScriptingSubsystem.h`

Collection Manager Scripting Subsystem

**Methods** (27):
  - `add_asset_data_to_collection(collection, asset_data)` -> `bool` — Add the given asset to the given collection.
  - `add_asset_datas_to_collection(collection, asset_datas)` -> `bool` — Add the given assets to the given collection.
  - `add_asset_ptr_to_collection(collection, asset_ptr)` -> `bool` — Add the given asset to the given collection.
  - `add_asset_ptrs_to_collection(collection, asset_ptrs)` -> `bool` — Add the given assets to the given collection.
  - `add_asset_to_collection(collection, asset_path)` -> `bool` — Add the given asset to the given collection.
  - `add_assets_to_collection(collection, asset_paths)` -> `bool` — Add the given assets to the given collection.
  - `collection_exists(container, collection, share_type)` -> `bool` — Check whether the given collection exists in the given container (matching both name and share type).
  - `create_collection(container, collection, share_type)` -> `Collection or None` — Create a new collection with the given name and share type in the provided collection container.
  - `create_or_empty_collection(container, collection, share_type)` -> `Collection or None` — Create a new collection with the given name and share type in the provided collection container if it doesnât already ...
  - `destroy_collection(collection)` -> `bool` — Destroy the given collection.
  - `empty_collection(collection)` -> `bool` — Remove all assets from the given collection.
  - `get_assets_in_collection(collection)` -> `Array[AssetData] or None` — Get the assets in the given collection.
  - `get_base_game_collection_container()` -> `CollectionContainerSource` — Get the collection container for the base game.
  - `get_collection_containers()` -> `Array [ CollectionContainerSource ]` — Gets all available collection containers.
  - `get_collections(container)` -> `Array[Collection] or None` — Get all available collections in the specified container.
  - `get_collections_by_name(container, collection)` -> `Array[Collection] or None` — Gets the given collections in the given container (matching only by name).
  - `get_collections_containing_asset(container, asset_path)` -> `Array[Collection] or None` — Get the collections in the specified container that contain the given asset.
  - `get_collections_containing_asset_data(container, asset_data)` -> `Array[Collection] or None` — Get the collections in the specified container that contain the given asset.
  - `get_collections_containing_asset_ptr(container, asset_ptr)` -> `Array[Collection] or None` — Get the collections in the specified container that contain the given asset.
  - `remove_asset_data_from_collection(collection, asset_data)` -> `bool` — Remove the given asset from the given collection.
  - `remove_asset_datas_from_collection(collection, asset_datas)` -> `bool` — Remove the given assets from the given collection.
  - `remove_asset_from_collection(collection, asset_path)` -> `bool` — Remove the given asset from the given collection.
  - `remove_asset_ptr_from_collection(collection, asset_ptr)` -> `bool` — Remove the given asset from the given collection.
  - `remove_asset_ptrs_from_collection(collection, asset_ptrs)` -> `bool` — Remove the given assets from the given collection.
  - `remove_assets_from_collection(collection, asset_paths)` -> `bool` — Remove the given assets from the given collection.
  - `rename_collection(collection, new_name, new_share_type)` -> `bool` — Rename the given collection.
  - `reparent_collection(collection, new_parent_collection)` -> `bool` — Re-parent the given collection.

### `unreal.CommonResolutionMenuContext`
Inherits: `ToolMenuContextBase` | Header: `LevelEditorPlaySettings.h`

Common Resolution Menu Context

### `unreal.ComponentElementsCopy`
Inherits: `Object` | Header: `ComponentElementEditorCopyAndPaste.h`

Component Elements Copy

**Properties** (1):
  - `components_to_copy`: `None` — [Read-Write] (Array[ActorComponent])

### `unreal.ComponentElementsExporterT3D`
Inherits: `Exporter` | Header: `ComponentElementEditorCopyAndPaste.h`

Component Elements Exporter T3D

### `unreal.CompositeCurveTableFactory`
Inherits: `Factory` | Header: `CompositeCurveTableFactory.h`

Composite Curve Table Factory

### `unreal.CompositeDataTableFactory`
Inherits: `DataTableFactory` | Header: `CompositeDataTableFactory.h`

Composite Data Table Factory

### `unreal.CookFunctionLibrary`
Inherits: `Object` | Header: `CookFunctionLibrary.h`

Cook Function Library

**Methods** (1):
  - `cook_asset(object, for_platform, destination_subfolder, cook_commandline_args = '')` -> `None` [classmethod] — Writes the cooked version of the provided objectâs package into the Saved folder, in the subfolder defined by Destinat...

### `unreal.CSVImportFactory`
Inherits: `Factory` | Header: `CSVImportFactory.h`

CSVImport Factory

**Properties** (1):
  - `automated_import_settings`: `CSVImportSettings` — [Read-Write] (CSVImportSettings)

### `unreal.CurveFactory`
Inherits: `Factory` | Header: `CurveFactory.h`

Factory that creates curve assets, prompting to pick the kind of curve at creation time

### `unreal.CurveFloatFactory`
Inherits: `CurveFactory` | Header: `CurveFactory.h`

Factory that creates float curve assets

### `unreal.CurveImportFactory`
Inherits: `Factory` | Header: `CurveImportFactory.h`

Curve Import Factory

### `unreal.CurveLinearColorAtlasFactory`
Inherits: `Factory` | Header: `CurveLinearColorAtlasFactory.h`

Curve Linear Color Atlas Factory

### `unreal.CurveLinearColorFactory`
Inherits: `CurveFactory` | Header: `CurveFactory.h`

Factory that creates linear color curve assets

### `unreal.CurveTableFactory`
Inherits: `Factory` | Header: `CurveTableFactory.h`

Creates a CurveTable with Rich Curves

### `unreal.CurveVectorFactory`
Inherits: `CurveFactory` | Header: `CurveFactory.h`

Factory that creates vector curve assets

### `unreal.DataAssetFactory`
Inherits: `Factory` | Header: `DataAssetFactory.h`

Data Asset Factory

### `unreal.DataTableFactory`
Inherits: `Factory` | Header: `DataTableFactory.h`

Data Table Factory

**Properties** (1):
  - `struct`: `ScriptStruct` — [Read-Write] (ScriptStruct)

### `unreal.DebugSkelMeshComponent`
Inherits: `SkeletalMeshComponent` | Header: `DebugSkelMeshComponent.h`

Debug Skel Mesh Component

### `unreal.DEditorParameterValue`
Inherits: `Object` | Header: `DEditorParameterValue.h`

DEditor Parameter Value

### `unreal.EditorActorSubsystem`
Inherits: `EditorSubsystem` | Header: `EditorActorSubsystem.h`

UEditorActorUtilitiesSubsystem Subsystem for exposing actor related utilities to scripts,

**Methods** (22):
  - `clear_actor_selection_set()` -> `None` — Remove all actors from the selection set
  - `convert_actors(actors, actor_class, static_mesh_package_path)` -> `Array [ Actor ]` — Replace in the level all Actors provided with a new actor of type ActorClass. Destroy all Actors provided.
  - `delete_selected_actors(world)` -> `None` — Delete all the selected actors in the given world
  - `destroy_actor(actor_to_destroy)` -> `bool` — Destroy the actor from the world editor. Notify the Editor that the actor got destroyed.
  - `destroy_actors(actors_to_destroy)` -> `bool` — Destroy the actors from the world editor. Notify the Editor that the actor got destroyed.
  - `duplicate_actor(actor_to_duplicate, to_world = None, offset = [0.000000,0.000000,0.000000])` -> `Actor` — Duplicate an actor from the world editor.
  - `duplicate_actors(actors_to_duplicate, to_world = None, offset = [0.000000,0.000000,0.000000])` -> `Array [ Actor ]` — Duplicate actors from the world editor.
  - `duplicate_selected_actors(world)` -> `None` — Duplicate all the selected actors in the given world
  - `get_actor_reference(path_to_actor)` -> `Actor` — Attempts to find the actor specified by PathToActor in the current editor world
  - `get_all_level_actors()` -> `Array [ Actor ]` — Find all loaded Actors in the world editor. Exclude actor that are pending kill, in PIE, PreviewEditor, â¦
  - `get_all_level_actors_components()` -> `Array [ ActorComponent ]` — Find all loaded ActorComponent own by an actor in the world editor. Exclude actor that are pending kill, in PIE, Preview...
  - `get_selected_level_actors()` -> `Array [ Actor ]` — Find all loaded Actors that are selected in the world editor. Exclude actor that are pending kill, in PIE, PreviewEditor...
  - `invert_selection(world)` -> `None` — Invert the selection in the given world
  - `select_all(world)` -> `None` — Select all actors and BSP models in the given world, except those which are hidden
  - `select_all_children(recurse_children)` -> `None` — Select all children actors of the current selection.
  - `select_nothing()` -> `None` — Selects nothing in the editor (another way to clear the selection)
  - `set_actor_selection_state(actor, should_be_selected)` -> `None` — Set the selection state for the selected actor
  - `set_actor_transform(actor, world_transform)` -> `bool` — Sets the world transform of the given actor, if possible.
  - `set_component_transform(scene_component, world_transform)` -> `bool` — Sets the world transform of the given component, if possible.
  - `set_selected_level_actors(actors_to_select)` -> `None` — Clear the current world editor selection and select the provided actors. Exclude actor that are pending kill, in PIE, Pr...
  - `spawn_actor_from_class(actor_class, location, rotation = [0.000000,0.000000,0.000000], transient = False)` -> `Actor` — Create an actor and place it in the world editor. Can be created from a Blueprint or a Class. The actor will be created ...
  - `spawn_actor_from_object(object_to_use, location, rotation = [0.000000,0.000000,0.000000], transient = False)` -> `Actor` — Create an actor and place it in the world editor. The Actor can be created from a Factory, Archetype, Blueprint, Class o...

**Properties** (13):
  - `on_actor_label_changed`: `OnActorLabelChanged` — [Read-Write] (OnActorLabelChanged)
  - `on_delete_actors_begin`: `OnDeleteActorsBegin` — [Read-Write] (OnDeleteActorsBegin)
  - `on_delete_actors_end`: `OnDeleteActorsEnd` — [Read-Write] (OnDeleteActorsEnd)
  - `on_duplicate_actors_begin`: `OnEditCutActorsBegin` — [Read-Write] (OnEditCutActorsBegin)
  - `on_duplicate_actors_end`: `OnDuplicateActorsEnd` — [Read-Write] (OnDuplicateActorsEnd)
  - `on_edit_copy_actors_begin`: `OnEditCopyActorsBegin` — [Read-Write] (OnEditCopyActorsBegin)
  - `on_edit_copy_actors_end`: `OnEditCopyActorsEnd` — [Read-Write] (OnEditCopyActorsEnd)
  - `on_edit_cut_actors_begin`: `OnEditCutActorsBegin` — [Read-Write] (OnEditCutActorsBegin)
  - `on_edit_cut_actors_end`: `OnEditCutActorsEnd` — [Read-Write] (OnEditCutActorsEnd)
  - `on_edit_paste_actors_begin`: `OnEditPasteActorsBegin` — [Read-Write] (OnEditPasteActorsBegin)
  - `on_edit_paste_actors_end`: `OnEditPasteActorsEnd` — [Read-Write] (OnEditPasteActorsEnd)
  - `on_new_actors_dropped`: `OnEditNewActorsDropped` — [Read-Write] (OnEditNewActorsDropped)
  - `on_new_actors_placed`: `OnEditNewActorsPlaced` — [Read-Write] (OnEditNewActorsPlaced)

### `unreal.EditorAnimBaseObj`
Inherits: `Object` | Header: `EditorAnimBaseObj.h`

Editor Anim Base Obj

### `unreal.EditorAnimCompositeSegment`
Inherits: `EditorAnimBaseObj` | Header: `EditorAnimCompositeSegment.h`

Editor Anim Composite Segment

### `unreal.EditorAnimSegment`
Inherits: `EditorAnimBaseObj` | Header: `EditorAnimSegment.h`

Editor Anim Segment

### `unreal.EditorAssetSubsystem`
Inherits: `EditorSubsystem` | Header: `EditorAssetSubsystem.h`

UEditorAssetSubsystem Subsystem for exposing asset related utilities to scripts. Asset Paths can be represented in the following ways:

**Methods** (43):
  - `add_on_extract_asset_from_file(delegate)` -> `None` — Call this to add a callback to extract an asset from a file, for example from a drag and drop operation.
  - `checkout_asset(asset_to_checkout)` -> `bool` — Checkout an asset.
  - `checkout_directory(directory_path, recursive = True)` -> `bool` — Checkout all assets in a directory. It will load the assets if needed. All objects that are in the directory will be che...
  - `checkout_loaded_asset(asset_to_checkout)` -> `bool` — Checkout the asset corresponding to an object.
  - `checkout_loaded_assets(assets_to_checkout)` -> `bool` — Checkout the assets.
  - `consolidate_assets(asset_to_consolidate_to, assets_to_consolidate)` -> `bool` — Consolidates assets by replacing all references/uses of the provided AssetsToConsolidate with references to AssetToConso...
  - `delete_asset(asset_path_to_delete)` -> `bool` — Delete the package an asset is in. All objects in the package will be deleted. This is a Force Delete. It does not check...
  - `delete_directory(directory_path)` -> `bool` — Delete the packages inside a directory. If the directory is then empty, delete the directory. This is a Force Delete. It...
  - `delete_loaded_asset(asset_to_delete)` -> `bool` — Delete an asset that is already loaded. This is a Force Delete. It does not check if the asset has references in other L...
  - `delete_loaded_assets(assets_to_delete)` -> `bool` — Delete assets that are already loaded. This is a Force Delete. It does not check if the assets have references in other ...
  - `do_assets_exist(asset_paths)` -> `bool` — Check if assets exist in the Asset Registry.
  - `does_asset_exist(asset_path)` -> `bool` — Check if an asset exists in the Asset Registry.
  - `does_directory_contain_assets(directory_path, recursive = True)` -> `bool` — Check if a directory contains any assets.
  - `does_directory_exist(directory_path)` -> `bool` — Check if a directory exists.
  - `duplicate_asset(source_asset_path, destination_asset_path)` -> `Object` — Duplicate an asset. Will try to checkout the file. The Asset will be loaded before being duplicated.
  - `duplicate_directory(source_directory_path, destination_directory_path)` -> `bool` — Duplicate a directory and the assets in it. Will try to checkout the files. The Assets will be loaded before being dupli...
  - `duplicate_loaded_asset(source_asset, destination_asset_path)` -> `Object` — Duplicate an asset that is already loaded. Will try to checkout the file.
  - `find_asset_data(asset_path)` -> `AssetData` — Return the AssetData for the Asset that can then be used with AssetRegistryHelpers.
  - `find_package_referencers_for_asset(asset_path, load_assets_to_confirm = False)` -> `Array [ str ]` — Find Package Referencers for an asset. Only Soft and Hard dependencies will be looked for. Soft are dependencies which d...
  - `get_all_assets_by_meta_data_tags(required_tags, allowed_classes)` -> `Array [ AssetData ]` — Gets all assets which have the given tags. params: RequiredTags The tags the assets should have params: AllowedClasses T...
  - `get_asset_filename_length_for_cooking(asset_path)` -> `int32` — Returns the length of the computed cooked package name and path
  - `get_loaded_asset_filename_length_for_cooking(asset)` -> `int32` — Returns the length of the computed cooked package name and path
  - `get_metadata_tag(object, tag)` -> `str` — Get the value associated with the given tag of a loaded assetâs metadata.
  - `get_metadata_tag_values(object)` -> `Map [ Name , str ]` — Get all tags/values of a loaded assetâs metadata.
  - `get_path_name_for_loaded_asset(loaded_asset)` -> `str` — Return a valid AssetPath for a loaded asset. Similar to GetPathName(). The format will be: /Game/MyFolder/MyAsset.MyAsse...
  - `get_tag_values(asset_path)` -> `Map [ Name , str ]` — Gets all TagValues (from Asset Registry) associated with an (unloaded) asset as strings value.
  - `list_assets(directory_path, recursive = True, include_folder = False)` -> `Array [ str ]` — Return the list of all the assets found in the DirectoryPath.
  - `list_assets_by_tag_value(tag_name, tag_value)` -> `Array [ str ]` — Return the list of all the assets that have the pair of Tag/Value.
  - `load_asset(asset_path)` -> `Object` — Load an asset. It will verify if the object is already loaded and only load it if itâs necessary.
  - `load_blueprint_class(asset_path)` — Load a Blueprint asset and return its generated class. It will verify if the object is already loaded and only load it i...
  - `make_directory(directory_path)` -> `bool` — Create a directory on disk.
  - `remove_metadata_tag(object, tag)` -> `None` — Remove the given tag from a loaded assetâs metadata.
  - `remove_on_extract_asset_from_file(delegate)` -> `None` — Call this to remove a callback added with AddOnExtractAssetFromFile.
  - `rename_asset(source_asset_path, destination_asset_path)` -> `bool` — Rename an asset. Equivalent to a Move operation. Will try to checkout the file. The Asset will be loaded before being re...
  - `rename_directory(source_directory_path, destination_directory_path)` -> `bool` — Rename a directory. Equivalent to a Move operation moving all contained assets. Will try to checkout the files. The Asse...
  - `rename_loaded_asset(source_asset, destination_asset_path)` -> `bool` — Rename an asset that is already loaded. Equivalent to a Move operation. Will try to checkout the file.
  - `save_asset(asset_to_save, only_if_is_dirty = True)` -> `bool` — Save the packages the assets live in. All objects that live in the package will be saved. Will try to checkout the file ...
  - `save_directory(directory_path, only_if_is_dirty = True, recursive = True)` -> `bool` — Save the packages the assets live in inside the directory. All objects that are in the directory will be saved. Will try...
  - `save_loaded_asset(asset_to_save, only_if_is_dirty = True)` -> `bool` — Save the package the asset lives in. All objects that live in the package will be saved. Will try to checkout the file.
  - `save_loaded_assets(assets_to_save, only_if_is_dirty = True)` -> `bool` — Save the packages the assets live in. All objects that live in the packages will be saved. Will try to checkout the file...
  - `set_dirty_flag(object, dirty_state)` -> `bool` — Set the package dirty flag for an asset
  - `set_metadata_tag(object, tag, value)` -> `None` — Set the value associated with a given tag of a loaded assetâs metadata.
  - `sort_by_meta_data(assets, meta_data_tag, meta_data_type, sort_order)` -> `Array[AssetData] or None` — Sorts the assets based on their meta dataâs type. Supported types: FString, int, float, FDateTime.

### `unreal.EditorCompositeSection`
Inherits: `EditorAnimBaseObj` | Header: `EditorCompositeSection.h`

Editor Composite Section

### `unreal.EditorLevelUtils`
Inherits: `Object` | Header: `EditorLevelUtils.h`

Editor Level Utils

**Methods** (10):
  - `add_level_to_world(world, level_package_name, level_streaming_class)` -> `LevelStreaming` [classmethod] — Adds the named level package to the world. Does nothing if the level already exists in the world. Levels are not saved w...
  - `add_level_to_world_with_transform(world, level_package_name, level_streaming_class, level_transform)` -> `LevelStreaming` [classmethod] — Adds the named level package to the world at the given position. Does nothing if the level already exists in the world.
  - `create_new_streaming_level(level_streaming_class, new_level_path = '', move_selected_actors_into_new_level = False)` -> `LevelStreaming` [classmethod] — Creates a new streaming level in the current world
  - `get_levels(world)` -> `Array [ Level ]` [classmethod] — Returns all levels for a world.
  - `make_level_current(streaming_level)` -> `None` [classmethod] — Makes the specified streaming level the current level for editing. The current level is where actors are spawned to when...
  - `move_actors_to_level(actors_to_move, dest_streaming_level, warn_about_references = True, warn_about_renaming = True)` -> `int32` [classmethod] — Moves the specified list of actors to the specified streaming level. The new actors will be selected
  - `move_selected_actors_to_level(dest_level, warn_about_references = True)` -> `int32` [classmethod] — Moves the currently selected actors to the specified streaming level. The new actors will be selected
  - `remove_level_from_world(level, clear_selection = True, reset_transaction_buffer = True)` -> `bool` [classmethod] — Removes given level from the world. Note, this will only work for sub-levels in the main level. Levels are not saved whe...
  - `set_level_visibility(level, should_be_visible, force_layers_visible, modify_mode = LevelVisibilityDirtyMode.MODIFY_ON_CHANGE)` -> `None` [classmethod] — Sets a levelâs visibility in the editor. Less efficient than SetLevelsVisibility when changing the visibility of multi...
  - `set_levels_visibility(levels, should_be_visible, force_layers_visible, modify_mode = LevelVisibilityDirtyMode.MODIFY_ON_CHANGE)` -> `None` [classmethod] — Sets a levelâs visibility in the editor. More efficient than SetLevelsVisibility when changing the visibility of multi...

### `unreal.EditorLoadingAndSavingUtils`
Inherits: `Object` | Header: `FileHelpers.h`

This class is a wrapper for editor loading and saving functionality It is meant to contain only functions that can be executed in script (but are also allowed in C++). It is separated from FEditorFile...

**Methods** (16):
  - `export_scene(export_selected_actors_only)` -> `None` [classmethod] — Exports the current scene
  - `get_dirty_content_packages()` -> `Array [ Package ]` [classmethod] — Appends array with all currently dirty content packages.
  - `get_dirty_map_packages()` -> `Array [ Package ]` [classmethod] — Appends array with all currently dirty map packages.
  - `import_scene(filename)` -> `None` [classmethod] — Imports a file such as (FBX or obj) and spawns actors f into the current level
  - `load_map(filename)` -> `World` [classmethod] — Loads the specified map. Does not prompt the user to save the current map.
  - `load_map_with_dialog()` -> `World` [classmethod] — Prompts the user to save the current map if necessary, the presents a load dialog and loads a new map if selected by the...
  - `new_blank_map(save_existing_map)` -> `World` [classmethod] — New Blank Map
  - `new_map_from_template(path_to_template_level, save_existing_map)` -> `World` [classmethod] — New Map from Template
  - `reload_packages(packages_to_reload, out_error_message=Text)` [classmethod] — Helper function that attempts to reload the specified top-level packages.
  - `save_current_level()` -> `bool` [classmethod] — Saves the active level, prompting the use for checkout if necessary.
  - `save_dirty_packages(save_map_packages, save_content_packages)` -> `bool` [classmethod] — Looks at all currently loaded packages and saves them if their âbDirtyâ flag is set. Assume all dirty packages shoul...
  - `save_dirty_packages_with_dialog(save_map_packages, save_content_packages)` -> `bool` [classmethod] — Looks at all currently loaded packages and saves them if their âbDirtyâ flag is set. Prompt the user to select which...
  - `save_map(world, asset_path)` -> `bool` [classmethod] — Saves the specified map, returning true on success.
  - `save_packages(packages_to_save, only_dirty)` -> `bool` [classmethod] — Save all packages. Assume all dirty packages should be saved and check out from source control (if enabled).
  - `save_packages_with_dialog(packages_to_save, only_dirty)` -> `bool` [classmethod] — Save all packages. Optionally prompting the user to select which packages to save. Prompt the user to select which dirty...
  - `unload_packages(out_error_message=Text)` [classmethod] — Unloads a list of packages

### `unreal.EditorPerProjectUserSettings`
Inherits: `Object` | Header: `EditorPerProjectUserSettings.h`

Editor Per Project User Settings

### `unreal.EditorWorldExtension`
Inherits: `Object` | Header: `EditorWorldExtension.h`

Editor World Extension

### `unreal.EnumFactory`
Inherits: `Factory` | Header: `EnumFactory.h`

Enum Factory

### `unreal.ExporterFBX`
Inherits: `Exporter` | Header: `ExporterFbx.h`

Exporter FBX

### `unreal.Factory`
Inherits: `Object` | Header: `Factory.h`

Base class for all factories An object responsible for creating and importing new objects.

**Methods** (2):
  - `script_factory_can_import(filename)` -> `bool` — Whether the specified file can be imported by this factory. (Implemented in script)
  - `script_factory_create_file(task)` -> `bool` — Import object(s) using a task via script

**Properties** (9):
  - `asset_import_task`: `AssetImportTask` — [Read-Write] Task for importing file via script interfaces (AssetImportTask)
  - `automated_import_data`: `AutomatedAssetImportData` — [Read-Write] Data for how to import files via the automated command line importing interface (Automa...
  - `context_class`: `Class` — [Read-Write] Class of the context object used to help create the object. (type(Class))
  - `create_new`: `bool` — [Read-Write] The default value to return from CanCreateNew() (bool)
  - `edit_after_new`: `bool` — [Read-Write] true if the associated editor should be opened after creating a new object. (bool)
  - `editor_import`: `bool` — [Read-Write] true if the factory imports objects from files. (bool)
  - `formats`: `None` — [Read-Write] List of formats supported by the factory. Each entry is of the form âext;Descriptionâ...
  - `supported_class`: `Class` — [Read-Write] The class manufactured by this factory. (type(Class))
  - `text`: `bool` — [Read-Write] true if the factory imports objects from text. (bool)

### `unreal.FbxAnimSequenceImportData`
Inherits: `FbxAssetImportData` | Header: `FbxAnimSequenceImportData.h`

Import data and options used when importing any mesh from FBX

### `unreal.FbxAssetImportData`
Inherits: `AssetImportData` | Header: `FbxAssetImportData.h`

Base class for import data and options used when importing any asset from FBX

**Properties** (6):
  - `convert_scene`: `bool` — [Read-Write] Convert the scene from FBX coordinate system to UE coordinate system (bool)
  - `convert_scene_unit`: `bool` — [Read-Write] Convert the scene from FBX unit to UE unit (centimeter). (bool)
  - `force_front_x_axis`: `bool` — [Read-Write] Convert the scene from FBX coordinate system to UE coordinate system with front X axis ...
  - `import_rotation`: `Rotator` — [Read-Write] (Rotator)
  - `import_translation`: `Vector` — [Read-Write] (Vector)
  - `import_uniform_scale`: `float` — [Read-Write] (float)

### `unreal.FbxExportOption`
Inherits: `Object` | Header: `FbxExportOption.h`

Fbx Export Option

**Properties** (15):
  - `ascii`: `bool` — [Read-Write] If enabled, save as ascii instead of binary (bool)
  - `bake_actor_animation`: `MovieSceneBakeType` — [Read-Write] Bake settings for exported non-camera, non-light object animation (MovieSceneBakeType)
  - `bake_camera_and_light_animation`: `MovieSceneBakeType` — [Read-Write] Bake settings for camera and light animation curves. Camera Scale not exported. (MovieS...
  - `bake_material_inputs`: `FbxMaterialBakeMode` — [Read-Write] Bake mode determining if and how a material input is baked out to a texture. Baking is ...
  - `collision`: `bool` — [Read-Write] If enabled, export collision (bool)
  - `default_material_bake_size`: `FbxMaterialBakeSize` — [Read-Write] Default size of the baked out texture (containing the material input). (FbxMaterialBake...
  - `export_local_time`: `bool` — [Read-Write] If enabled, export sequencer animation in its local time, relative to its sequence. (bo...
  - `export_morph_targets`: `bool` — [Read-Write] If enabled, export the morph targets (bool)
  - `export_preview_mesh`: `bool` — [Read-Write] If enable, the preview mesh link to the exported animations will be also exported. (boo...
  - `export_source_mesh`: `bool` — [Read-Write] * If enabled, export the highest LOD source data instead of the render data.
* Note:
* ...
  - `fbx_export_compatibility`: `FbxExportCompatibility` — [Read-Write] This will set the fbx sdk compatibility when exporting to fbx file. The default value i...
  - `force_front_x_axis`: `bool` — [Read-Write] If enabled, export with X axis as the front axis instead of default -Y (bool)
  - `level_of_detail`: `bool` — [Read-Write] If enabled, export the level of detail (bool)
  - `map_skeletal_motion_to_root`: `bool` — [Read-Write] If enable, Map skeletal actor motion to the root bone of the skeleton. (bool)
  - `vertex_color`: `bool` — [Read-Write] If enabled, export vertex color (bool)

### `unreal.FbxFactory`
Inherits: `Factory` | Header: `FbxFactory.h`

Fbx Factory

### `unreal.FbxImportUI`
Inherits: `Object` | Header: `FbxImportUI.h`

Fbx Import UI

**Methods** (1):
  - `reset_to_default()` -> `None` — Reset to Default

**Properties** (31):
  - `anim_sequence_import_data`: `FbxAnimSequenceImportData` — [Read-Write] Import data used when importing animations (FbxAnimSequenceImportData)
  - `auto_compute_lod_distances`: `bool` — [Read-Write] If checked, the editor will automatically compute screen size values for the static mes...
  - `automated_import_should_detect_type`: `bool` — [Read-Write] If true the automated import path should detect the import type.  If false the import t...
  - `create_physics_asset`: `bool` — [Read-Write] If checked, create new PhysicsAsset if it doesnât have it (bool)
  - `import_animations`: `bool` — [Read-Write] True to import animations from the FBX File (bool)
  - `import_as_skeletal`: `bool` — [Read-Write] Whether to import the incoming FBX as a skeletal object (bool)
  - `import_materials`: `bool` — [Read-Write] If no existing materials are found, whether to automatically create Unreal materials fo...
  - `import_mesh`: `bool` — [Read-Write] Whether to import the mesh. Allows animation only import when importing a skeletal mesh...
  - `import_rigid_mesh`: `bool` — [Read-Write] Enables importing of ârigid skeletalmeshâ (unskinned, hierarchy-based animation) fr...
  - `import_textures`: `bool` — [Read-Write] Whether or not we should import textures. This option is disabled when we are importing...
  - `is_obj_import`: `bool` — [Read-Write] Whether or not the imported file is in OBJ format (bool)
  - `lod_distance0`: `float` — [Read-Write] Set a screen size value for LOD 0 (float)
  - `lod_distance1`: `float` — [Read-Write] Set a screen size value for LOD 1 (float)
  - `lod_distance2`: `float` — [Read-Write] Set a screen size value for LOD 2 (float)
  - `lod_distance3`: `float` — [Read-Write] Set a screen size value for LOD 3 (float)
  - `lod_distance4`: `float` — [Read-Write] Set a screen size value for LOD 4 (float)
  - `lod_distance5`: `float` — [Read-Write] Set a screen size value for LOD 5 (float)
  - `lod_distance6`: `float` — [Read-Write] Set a screen size value for LOD 6 (float)
  - `lod_distance7`: `float` — [Read-Write] Set a screen size value for LOD 7 (float)
  - `lod_number`: `int` — [Read-Write] Set the number of LODs for the editor to import. Setting the value to 0 imports the num...
  - `mesh_type_to_import`: `FBXImportType` — [Read-Write] Type of asset to import from the FBX file (FBXImportType)
  - `minimum_lod_number`: `int` — [Read-Write] Set the minimum LOD used for rendering. Setting the value to 0 will use the default val...
  - `original_import_type`: `FBXImportType` — [Read-Write] The original detected type of this import (FBXImportType)
  - `override_animation_name`: `str` — [Read-Write] Override for the name of the animation to import. By default, it will be the name of FB...
  - `override_full_name`: `bool` — [Read-Write] Use the string in âNameâ field as full name of mesh. The option only works when the...
  - `physics_asset`: `PhysicsAsset` — [Read-Write] If this is set, use this PhysicsAsset. It is possible bCreatePhysicsAsset == false, and...
  - `reset_to_fbx_on_material_conflict`: `bool` — [Read-Write] If true, the imported material sections will automatically be reset to the imported dat...
  - `skeletal_mesh_import_data`: `FbxSkeletalMeshImportData` — [Read-Write] Import data used when importing skeletal meshes (FbxSkeletalMeshImportData)
  - `skeleton`: `Skeleton` — [Read-Write] Skeleton to use for imported asset. When importing a mesh, leaving this as âNoneâ w...
  - `static_mesh_import_data`: `FbxStaticMeshImportData` — [Read-Write] Import data used when importing static meshes (FbxStaticMeshImportData)
  - `texture_import_data`: `FbxTextureImportData` — [Read-Write] Import data used when importing textures (FbxTextureImportData)

### `unreal.FbxMeshImportData`
Inherits: `FbxAssetImportData` | Header: `FbxMeshImportData.h`

Import data and options used when importing any mesh from FBX

**Properties** (8):
  - `bake_pivot_in_vertex`: `bool` — âTransformVertexToAbsoluteâ must be false. (bool) [Read-Write] - Experimental - If this option i...
  - `compute_weighted_normals`: `bool` — [Read-Write] Enabling this option will use weighted normals algorithm (area and angle) when computin...
  - `import_mesh_lo_ds`: `bool` — âimport_mesh_lo_dsâ was renamed to âimport_mesh_lodsâ. deprecated
  - `import_mesh_lods`: `bool` — [Read-Write] If enabled, creates LOD models for Unreal meshes from LODs in the import file; If not e...
  - `normal_generation_method`: `FBXNormalGenerationMethod` — [Read-Write] Use the MikkTSpace tangent space generator for generating normals and tangents on the m...
  - `normal_import_method`: `FBXNormalImportMethod` — [Read-Write] Enabling this option will read the tangents(tangent,binormal,normal) from FBX file inst...
  - `reorder_material_to_fbx_order`: `bool` — [Read-Write] If checked, The material list will be reorder to the same order has the FBX file. (bool...
  - `transform_vertex_to_absolute`: `bool` — [Read-Write] If this option is true the node absolute transform (transform, offset and pivot) will b...

### `unreal.FbxSceneImportFactory`
Inherits: `SceneImportFactory` | Header: `FbxSceneImportFactory.h`

Fbx Scene Import Factory

**Properties** (3):
  - `scene_import_options`: `FbxSceneImportOptions` — [Read-Write] Import options UI detail when importing fbx scene (FbxSceneImportOptions)
  - `scene_import_options_skeletal_mesh`: `FbxSceneImportOptionsSkeletalMesh` — [Read-Write] Import options UI detail when importing fbx scene skeletal mesh (FbxSceneImportOptionsS...
  - `scene_import_options_static_mesh`: `FbxSceneImportOptionsStaticMesh` — [Read-Write] Import options UI detail when importing fbx scene static mesh (FbxSceneImportOptionsSta...

### `unreal.FbxSceneImportOptions`
Inherits: `Object` | Header: `FbxSceneImportOptions.h`

Fbx_AddToBlueprint UMETA(DisplayName = âAdd to an existing Blueprint assetâ),

### `unreal.FbxSceneImportOptionsSkeletalMesh`
Inherits: `Object` | Header: `FbxSceneImportOptionsSkeletalMesh.h`

Fbx Scene Import Options Skeletal Mesh

### `unreal.FbxSceneImportOptionsStaticMesh`
Inherits: `Object` | Header: `FbxSceneImportOptionsStaticMesh.h`

Fbx Scene Import Options Static Mesh

### `unreal.FbxSkeletalMeshImportData`
Inherits: `FbxMeshImportData` | Header: `FbxSkeletalMeshImportData.h`

Import data and options used when importing a static mesh from fbx Notes: - Meta data ImportType i.e. meta = (ImportType = âSkeletalMesh|GeoOnlyâ)

**Properties** (2):
  - `vertex_color_import_option`: `VertexColorImportOption` — [Read-Write] Specify how vertex colors should be imported (VertexColorImportOption)
  - `vertex_override_color`: `Color` — [Read-Write] Specify override color in the case that VertexColorImportOption is set to Override (Col...

### `unreal.FbxStaticMeshImportData`
Inherits: `FbxMeshImportData` | Header: `FbxStaticMeshImportData.h`

Fbx Static Mesh Import Data

**Properties** (11):
  - `auto_generate_collision`: `bool` — [Read-Write] If checked, collision will automatically be generated (ignored if custom collision is i...
  - `build_nanite`: `bool` — [Read-Write] If enabled, allows to render objects with Nanite (bool)
  - `build_reversed_index_buffer`: `bool` — [Read-Write] (bool)
  - `combine_meshes`: `bool` — [Read-Write] If enabled, combines all meshes into a single mesh (bool)
  - `distance_field_resolution_scale`: `float` — [Read-Write] Scale to apply to the mesh when allocating the distance field volume texture.
The defau...
  - `generate_lightmap_u_vs`: `bool` — [Read-Write] (bool)
  - `one_convex_hull_per_ucx`: `bool` — [Read-Write] If checked, one convex hull perUCX_prefixed collision mesh will be generated instead of...
  - `remove_degenerates`: `bool` — [Read-Write] Disabling this option will keep degenerate triangles found.  In general you should leav...
  - `static_mesh_lod_group`: `Name` — [Read-Write] The LODGroup to associate with this mesh when it is imported (Name)
  - `vertex_color_import_option`: `VertexColorImportOption` — [Read-Write] Specify how vertex colors should be imported (VertexColorImportOption)
  - `vertex_override_color`: `Color` — [Read-Write] Specify override color in the case that VertexColorImportOption is set to Override (Col...

### `unreal.FbxTextureImportData`
Inherits: `FbxAssetImportData` | Header: `FbxTextureImportData.h`

Import data and options used when importing any mesh from FBX

**Properties** (10):
  - `base_color_name`: `str` — [Read-Write] (str)
  - `base_diffuse_texture_name`: `str` — [Read-Write] (str)
  - `base_emissive_color_name`: `str` — [Read-Write] (str)
  - `base_emmisive_texture_name`: `str` — [Read-Write] (str)
  - `base_material_name`: `SoftObjectPath` — [Read-Write] Base material to instance from when importing materials. (SoftObjectPath)
  - `base_normal_texture_name`: `str` — [Read-Write] (str)
  - `base_opacity_texture_name`: `str` — [Read-Write] (str)
  - `base_specular_texture_name`: `str` — [Read-Write] (str)
  - `invert_normal_maps`: `bool` — [Read-Write] If importing textures is enabled, this option will cause normal map Y (Green) values to...
  - `material_search_location`: `MaterialSearchLocation` — [Read-Write] Specify where we should search for matching materials when importing (MaterialSearchLoc...

### `unreal.FontFactory`
Inherits: `Factory` | Header: `FontFactory.h`

Font Factory

### `unreal.FontFileImportFactory`
Inherits: `Factory` | Header: `FontFileImportFactory.h`

Font File Import Factory

### `unreal.ForceFeedbackAttenuationFactory`
Inherits: `Factory` | Header: `ForceFeedbackAttenuationFactory.h`

Force Feedback Attenuation Factory

### `unreal.ForceFeedbackEffectFactory`
Inherits: `Factory` | Header: `ForceFeedbackEffectFactory.h`

Force Feedback Effect Factory

### `unreal.GroupActor`
Inherits: `Actor` | Header: `GroupActor.h`

Group Actor

### `unreal.GroupActorExporterT3D`
Inherits: `ActorExporterT3D` | Header: `ActorExporterT3D.h`

Group Actor Exporter T3D

### `unreal.HapticFeedbackEffectBufferFactory`
Inherits: `Factory` | Header: `HapticFeedbackEffectBufferFactory.h`

Haptic Feedback Effect Buffer Factory

### `unreal.HapticFeedbackEffectCurveFactory`
Inherits: `Factory` | Header: `HapticFeedbackEffectCurveFactory.h`

Haptic Feedback Effect Curve Factory

### `unreal.HapticFeedbackEffectSoundWaveFactory`
Inherits: `Factory` | Header: `HapticFeedbackEffectSoundWaveFactory.h`

Haptic Feedback Effect Sound Wave Factory

### `unreal.HierarchicalLODVolume`
Inherits: `Volume` | Header: `HierarchicalLODVolume.h`

An invisible volume used to manually define/create an HLOD cluster.

### `unreal.ImportSubsystem`
Inherits: `EditorSubsystem` | Header: `ImportSubsystem.h`

UImportSubsystem Subsystem for importing assets in the editor, Contains utility functions and callbacks for hooking into importing.

**Properties** (4):
  - `on_asset_post_import`: `OnAssetPostImport_Dyn` — [Read-Write] (OnAssetPostImport_Dyn)
  - `on_asset_post_lod_import`: `OnAssetPostLODImport_Dyn` — [Read-Write] (OnAssetPostLODImport_Dyn)
  - `on_asset_pre_import`: `OnAssetPreImport_Dyn` — [Read-Write] (OnAssetPreImport_Dyn)
  - `on_asset_reimport`: `OnAssetReimport_Dyn` — [Read-Write] (OnAssetReimport_Dyn)

### `unreal.LayersSubsystem`
Inherits: `EditorSubsystem` | Header: `LayersSubsystem.h`

Layers Subsystem

**Methods** (46):
  - `add_actor_to_layer(actor, layer_name)` -> `bool` — Adds the actor to the named layer.
  - `add_actor_to_layers(actor, layer_names)` -> `bool` — Adds the provided actor to the named layers.
  - `add_actors_to_layer(actors, layer_name)` -> `bool` — Add the actors to the named layer
  - `add_actors_to_layers(actors, layer_names)` -> `bool` — Add the actors to the named layers
  - `add_all_layer_names_to()` -> `Array [ Name ]` — Gets all known layers and appends their names to the provide array
  - `add_all_layers_to()` -> `Array [ Layer ]` — Gets all known layers and appends them to the provided array
  - `add_level_layer_information(level)` -> `None` — Aggregates any information regarding layers associated with the level and it contents
  - `add_selected_actors_to_layer(layer_name)` -> `bool` — Adds selected actors to the named layer.
  - `add_selected_actors_to_layers(layer_names)` -> `bool` — Adds selected actors to the named layers.
  - `append_actors_from_layer(layer_name)` -> `Array [ Actor ]` — Appends all the actors associated with the specified layer.
  - `append_actors_from_layers(layer_names)` -> `Array [ Actor ]` — Appends all the actors associated with ANY of the specified layers.
  - `create_layer(layer_name)` -> `Layer` — Creates a ULayer Object for the named layer
  - `delete_layer(layer_to_delete)` -> `None` — Deletes the provided layer, disassociating all actors from them
  - `delete_layers(layers_to_delete)` -> `None` — Deletes all of the provided layers, disassociating all actors from them
  - `disassociate_actor_from_layers(actor)` -> `bool` — Disassociates an Actorâs layers from the layer system, general used before deleting the Actor
  - `disassociate_actors_from_layers(actors)` -> `bool` — Disassociates actors from the layer system, generally used before deleting the Actors
  - `editor_map_change()` -> `None` — Delegate handler for FEditorDelegates::MapChange. It internally calls LayersChanged.Broadcast.
  - `editor_refresh_layer_browser()` -> `None` — Delegate handler for FEditorDelegates::RefreshLayerBrowser. It internally calls UpdateAllActorsVisibility to refresh the...
  - `get_actors_from_layer(layer_name)` -> `Array [ Actor ]` — Gets all the actors associated with the specified layer. Analog to AppendActorsFromLayer but it returns rather than appe...
  - `get_actors_from_layers(layer_names)` -> `Array [ Actor ]` — Gets all the actors associated with ANY of the specified layers. Analog to AppendActorsFromLayers but it returns rather ...
  - `get_layer(layer_name)` -> `Layer` — Gets the ULayer Object of the named layer
  - `get_selected_actors()` -> `Array [ Actor ]` — Find and return the selected actors.
  - `get_world()` -> `World` — Get the current UWorld object.
  - `initialize_new_actor_layers(actor)` -> `bool` — Synchronizes an newly created Actorâs layers with the layer system
  - `is_actor_valid_for_layer(actor)` -> `bool` — Checks to see if the specified actor is in an appropriate state to interact with layers
  - `is_layer(layer_name)` -> `bool` — Checks whether the ULayer Object of the provided layer name exists.
  - `make_all_layers_visible()` -> `None` — Set the visibility of all layers to true
  - `remove_actor_from_layer(actor, layer_to_remove, update_stats = True)` -> `bool` — Removes an actor from the specified layer.
  - `remove_actor_from_layers(actor, layer_names, update_stats = True)` -> `bool` — Removes the provided actor from the named layers.
  - `remove_actors_from_layer(actors, layer_name, update_stats = True)` -> `bool` — Removes the actors from the specified layer.
  - `remove_actors_from_layers(actors, layer_names, update_stats = True)` -> `bool` — Remove the actors to the named layers
  - `remove_level_layer_information(level)` -> `None` — Purges any information regarding layers associated with the level and it contents
  - `remove_selected_actors_from_layer(layer_name)` -> `bool` — Removes the selected actors from the named layer.
  - `remove_selected_actors_from_layers(layer_names)` -> `bool` — Removes selected actors from the named layers.
  - `rename_layer(original_layer_name, new_layer_name)` -> `bool` — Renames the provided originally named layer to the provided new name
  - `select_actors_in_layer(layer_name, select, notify, select_even_if_hidden = False)` -> `bool` — Selects/de-selects actors belonging to the named layer.
  - `select_actors_in_layers(layer_names, select, notify, select_even_if_hidden = False)` -> `bool` — Selects/de-selects actors belonging to the named layers.
  - `set_layer_visibility(layer_name, is_visible)` -> `None` — Changes the named layerâs visibility to the provided state
  - `set_layers_visibility(layer_names, is_visible)` -> `None` — Changes visibility of the named layers to the provided state
  - `toggle_layer_visibility(layer_name)` -> `None` — Toggles the named layerâs visibility
  - `toggle_layers_visibility(layer_names)` -> `None` — Toggles the visibility of all of the named layers
  - `try_get_layer(layer_name)` -> `Layer or None` — Attempts to get the ULayer Object of the provided layer name.
  - `update_actor_all_views_visibility(actor)` -> `None` — Updates per-view visibility for the given actor for all views
  - `update_actor_visibility(actor, notify_selection_change, redraw_viewports)` -> `(out_selection_changed=bool, out_actor_modified=bool) or None` — Updates the provided actors visibility in the viewports
  - `update_all_actors_visibility(notify_selection_change, redraw_viewports)` -> `bool` — Updates the visibility of all actors in the viewports
  - `update_all_view_visibility(layer_that_changed)` -> `None` — Updates the visibility for all actors for all views.

### `unreal.LevelExporterFBX`
Inherits: `ExporterFBX` | Header: `LevelExporterFBX.h`

Level Exporter FBX

### `unreal.LevelExporterLOD`
Inherits: `Exporter` | Header: `LevelExporterLOD.h`

Level Exporter LOD

### `unreal.LevelExporterOBJ`
Inherits: `Exporter` | Header: `LevelExporterOBJ.h`

Level Exporter OBJ

### `unreal.LevelExporterSTL`
Inherits: `Exporter` | Header: `LevelExporterSTL.h`

Level Exporter STL

### `unreal.LevelExporterT3D`
Inherits: `Exporter` | Header: `LevelExporterT3D.h`

Level Exporter T3D

### `unreal.LevelFactory`
Inherits: `Factory` | Header: `LevelFactory.h`

Level Factory

### `unreal.LightWeightInstanceFactory`
Inherits: `Factory` | Header: `LightWeightInstanceFactory.h`

Light Weight Instance Factory

### `unreal.MaterialEditorInstanceConstant`
Inherits: `MaterialEditorParameters` | Header: `MaterialEditorInstanceConstant.h`

Material Editor Instance Constant

**Properties** (2):
  - `specular_profile`: `SpecularProfile` [Read-Only] — [Read-Only] Specular profile (SpecularProfile)
  - `subsurface_profile`: `SubsurfaceProfile` [Read-Only] — [Read-Only] SubsurfaceProfile, for Screen Space Subsurface Scattering (SubsurfaceProfile)

### `unreal.MaterialEditorMeshComponent`
Inherits: `StaticMeshComponent` | Header: `MaterialEditorMeshComponent.h`

Material Editor Mesh Component

### `unreal.MaterialEditorParameters`
Inherits: `Object` | Header: `MaterialEditorInstanceConstant.h`

Common Interface for material parameter containers

### `unreal.MaterialFactoryNew`
Inherits: `Factory` | Header: `MaterialFactoryNew.h`

Material Factory New

### `unreal.MaterialFunctionFactoryNew`
Inherits: `Factory` | Header: `MaterialFunctionFactoryNew.h`

Material Function Factory New

### `unreal.MaterialFunctionInstanceFactory`
Inherits: `Factory` | Header: `MaterialFunctionInstanceFactory.h`

Material Function Instance Factory

### `unreal.MaterialFunctionMaterialLayerBlendFactory`
Inherits: `Factory` | Header: `MaterialFunctionMaterialLayerBlendFactory.h`

Material Function Material Layer Blend Factory

### `unreal.MaterialFunctionMaterialLayerBlendInstanceFactory`
Inherits: `MaterialFunctionInstanceFactory` | Header: `MaterialFunctionInstanceFactory.h`

Material Function Material Layer Blend Instance Factory

### `unreal.MaterialFunctionMaterialLayerFactory`
Inherits: `Factory` | Header: `MaterialFunctionMaterialLayerFactory.h`

Material Function Material Layer Factory

### `unreal.MaterialFunctionMaterialLayerInstanceFactory`
Inherits: `MaterialFunctionInstanceFactory` | Header: `MaterialFunctionInstanceFactory.h`

Material Function Material Layer Instance Factory

### `unreal.MaterialImportHelpers`
Inherits: `Object` | Header: `MaterialImportHelpers.h`

Material Import Helpers

**Methods** (2):
  - `find_existing_material(base_path, material_full_name, out_error=Text)` [classmethod] — Find Existing Material
  - `find_existing_material_from_search_location(material_full_name, base_package_path, out_error=Text)` [classmethod] — Find Existing Material from Search Location

### `unreal.MaterialInstanceConstantFactoryNew`
Inherits: `Factory` | Header: `MaterialInstanceConstantFactoryNew.h`

Material Instance Constant Factory New

### `unreal.MaterialParameterCollectionFactoryNew`
Inherits: `Factory` | Header: `MaterialParameterCollectionFactoryNew.h`

Material Parameter Collection Factory New

### `unreal.MeshDeformerCollectionFactory`
Inherits: `Factory` | Header: `MeshDeformerCollectionFactory.h`

Mesh Deformer Collection Factory

### `unreal.MirrorDataTableFactory`
Inherits: `Factory` | Header: `MirrorDataTableFactory.h`

Mirror Data Table Factory

### `unreal.ModelExporterT3D`
Inherits: `Exporter` | Header: `ModelExporterT3D.h`

Model Exporter T3D

### `unreal.ModelFactory`
Inherits: `Factory` | Header: `ModelFactory.h`

Model Factory

### `unreal.NeuralProfileFactory`
Inherits: `Factory` | Header: `NeuralProfileFactory.h`

Neural Profile Factory

### `unreal.ObjectExporterT3D`
Inherits: `Exporter` | Header: `ObjectExporterT3D.h`

Object Exporter T3D

### `unreal.ObjectLibraryFactory`
Inherits: `Factory` | Header: `ObjectLibraryFactory.h`

Object Library Factory

### `unreal.PackageFactory`
Inherits: `Factory` | Header: `PackageFactory.h`

Package Factory

### `unreal.PackageTools`
Inherits: `Object` | Header: `PackageTools.h`

Package Tools

**Methods** (3):
  - `filename_to_package_name(filename)` -> `str` [classmethod] — Tries to convert a given relative or absolute filename to a long package name or path starting with a root like /Game Th...
  - `package_name_to_filename(package_name, extension = '')` -> `str` [classmethod] — Converts a long package name to a file name. This can be called on package paths as well, provide no extension in that c...
  - `sanitize_package_name(package_name)` -> `str` [classmethod] — Replaces all invalid package name characters with _

### `unreal.PackFactory`
Inherits: `Factory` | Header: `PackFactory.h`

Factory for unpacking upack files

### `unreal.ParticleSystemFactoryNew`
Inherits: `Factory` | Header: `ParticleSystemFactoryNew.h`

Particle System Factory New

### `unreal.PhysicalMaterialFactoryNew`
Inherits: `Factory` | Header: `PhysicalMaterialFactoryNew.h`

Physical Material Factory New

### `unreal.PhysicalMaterialMaskFactory`
Inherits: `Factory` | Header: `PhysicalMaterialMaskFactory.h`

Physical Material Mask Factory

### `unreal.PhysicsAssetFactory`
Inherits: `Factory` | Header: `PhysicsAssetFactory.h`

Physics Asset Factory

### `unreal.PhysicsVolumeExporterT3D`
Inherits: `ActorExporterT3D` | Header: `ActorExporterT3D.h`

Physics Volume Exporter T3D

### `unreal.PolysExporterOBJ`
Inherits: `Exporter` | Header: `PolysExporterOBJ.h`

Polys Exporter OBJ

### `unreal.PolysExporterT3D`
Inherits: `Exporter` | Header: `PolysExporterT3D.h`

Polys Exporter T3D

### `unreal.PolysFactory`
Inherits: `Factory` | Header: `PolysFactory.h`

Polys Factory

### `unreal.PoseAssetFactory`
Inherits: `Factory` | Header: `PoseAssetFactory.h`

Pose Asset Factory

**Properties** (2):
  - `pose_names`: `None` — [Read-Write] Optional. If specified the poses will be named according to this array.
If you donât ...
  - `source_animation`: `AnimSequence` — [Read-Write] Used when creating a composite from an AnimSequence, becomes the only AnimSequence cont...

### `unreal.PreviewMaterial`
Inherits: `Material` | Header: `PreviewMaterial.h`

Preview Material

### `unreal.PreviewMeshCollectionFactory`
Inherits: `Factory` | Header: `PreviewMeshCollectionFactory.h`

Preview Mesh Collection Factory

### `unreal.PropertyEditorTestActor`
Inherits: `Actor` | Header: `PropertyEditorTestObject.h`

Property Editor Test Actor

### `unreal.PropertyEditorTestInstancedObject`
Inherits: `Object` | Header: `PropertyEditorTestObject.h`

Property Editor Test Instanced Object

### `unreal.PropertyEditorTestObject`
Inherits: `Object` | Header: `PropertyEditorTestObject.h`

Property Editor Test Object

### `unreal.ReimportCurveFactory`
Inherits: `CSVImportFactory` | Header: `ReimportCurveFactory.h`

Reimport Curve Factory

### `unreal.ReimportCurveTableFactory`
Inherits: `CSVImportFactory` | Header: `ReimportCurveTableFactory.h`

Reimport Curve Table Factory

### `unreal.ReimportDataTableFactory`
Inherits: `CSVImportFactory` | Header: `ReimportDataTableFactory.h`

Reimport Data Table Factory

### `unreal.ReimportFbxAnimSequenceFactory`
Inherits: `FbxFactory` | Header: `ReimportFbxAnimSequenceFactory.h`

Reimport Fbx Anim Sequence Factory

### `unreal.ReimportFbxSceneFactory`
Inherits: `FbxSceneImportFactory` | Header: `ReimportFbxSceneFactory.h`

Reimport Fbx Scene Factory

**Methods** (1):
  - `script_reimport_helper(obj)` -> `None`

### `unreal.ReimportFbxSkeletalMeshFactory`
Inherits: `FbxFactory` | Header: `ReimportFbxSkeletalMeshFactory.h`

Reimport Fbx Skeletal Mesh Factory

### `unreal.ReimportFbxStaticMeshFactory`
Inherits: `FbxFactory` | Header: `ReimportFbxStaticMeshFactory.h`

Reimport Fbx Static Mesh Factory

### `unreal.ReimportTextureFactory`
Inherits: `TextureFactory` | Header: `ReimportTextureFactory.h`

Reimport Texture Factory

### `unreal.ReimportVectorFieldStaticFactory`
Inherits: `VectorFieldStaticFactory` | Header: `ReimportVectorFieldStaticFactory.h`

Reimport Vector Field Static Factory

### `unreal.RenderTargetCubeExporterHDR`
Inherits: `TextureCubeExporterHDR` | Header: `TextureCubeExporterHDR.h`

Render Target Cube Exporter HDR

### `unreal.RenderTargetExporterEXR`
Inherits: `Exporter` | Header: `RenderTargetExporterHDR.h`

Render Target Exporter EXR

### `unreal.RenderTargetExporterPNG`
Inherits: `Exporter` | Header: `RenderTargetExporterHDR.h`

### `unreal.SceneImportFactory`
Inherits: `Factory` | Header: `SceneImportFactory.h`

Base class for all factories that import objects into a scene (e.g in a level)

### `unreal.SequenceExporterT3D`
Inherits: `Exporter` | Header: `SequenceExporterT3D.h`

Sequence Exporter T3D

### `unreal.SkeletalMeshExporterFBX`
Inherits: `ExporterFBX` | Header: `SkeletalMeshExporterFBX.h`

Skeletal Mesh Exporter FBX

### `unreal.SkeletonFactory`
Inherits: `Factory` | Header: `SkeletonFactory.h`

Skeleton Factory

### `unreal.SlateBrushAssetFactory`
Inherits: `Factory` | Header: `SlateBrushAssetFactory.h`

Factory for creating SlateBrushAssets

### `unreal.SlateWidgetStyleAssetFactory`
Inherits: `Factory` | Header: `SlateWidgetStyleAssetFactory.h`

Factory for creating SlateStyles

### `unreal.SoundExporterOGG`
Inherits: `Exporter` | Header: `SoundExporterOGG.h`

Sound Exporter OGG

### `unreal.SoundExporterWAV`
Inherits: `Exporter` | Header: `SoundExporterWAV.h`

Sound Exporter WAV

### `unreal.SoundSurroundExporterWAV`
Inherits: `Exporter` | Header: `SoundSurroundExporterWAV.h`

Sound Surround Exporter WAV

### `unreal.SparseVolumeTextureMaterialFactoryNew`
Inherits: `Factory` | Header: `SparseVolumeTextureMaterialFactory.h`

Sparse Volume Texture Material Factory New

### `unreal.SparseVolumeTextureMaterialInstanceFactoryNew`
Inherits: `MaterialInstanceConstantFactoryNew` | Header: `SparseVolumeTextureMaterialFactory.h`

Sparse Volume Texture Material Instance Factory New

### `unreal.SpecularProfileFactory`
Inherits: `Factory` | Header: `SpecularProfileFactory.h`

Specular Profile Factory

### `unreal.StaticMeshExporterFBX`
Inherits: `ExporterFBX` | Header: `StaticMeshExporterFBX.h`

Static Mesh Exporter FBX

### `unreal.StaticMeshExporterOBJ`
Inherits: `Exporter` | Header: `StaticMeshExporterOBJ.h`

Static Mesh Exporter OBJ

### `unreal.StringTableFactory`
Inherits: `Factory` | Header: `StringTableFactory.h`

String Table Factory

### `unreal.StructureFactory`
Inherits: `Factory` | Header: `StructureFactory.h`

Structure Factory

### `unreal.SubsurfaceProfileFactory`
Inherits: `Factory` | Header: `SubsurfaceProfileFactory.h`

Subsurface Profile Factory

### `unreal.SubUVAnimationFactory`
Inherits: `Factory` | Header: `SubUVAnimationFactory.h`

Sub UVAnimation Factory

### `unreal.TestSparseClassData`
Inherits: `TestSparseClassDataBase` | Header: `PropertyEditorTestObject.h`

Test Sparse Class Data

### `unreal.TestSparseClassDataBase`
Inherits: `Object` | Header: `PropertyEditorTestObject.h`

Test Sparse Class Data Base

### `unreal.TextBufferExporterTXT`
Inherits: `Exporter` | Header: `TextBufferExporterTXT.h`

Text Buffer Exporter TXT

### `unreal.Texture2DArrayFactory`
Inherits: `Factory` | Header: `Texture2DArrayFactory.h`

Factory for creating volume texture

### `unreal.Texture2DFactoryNew`
Inherits: `Factory` | Header: `Texture2dFactoryNew.h`

Texture 2DFactory New

### `unreal.TextureCubeArrayFactory`
Inherits: `Factory` | Header: `TextureCubeArrayFactory.h`

Factory for creating volume texture

### `unreal.TextureCubeExporterHDR`
Inherits: `Exporter` | Header: `TextureCubeExporterHDR.h`

Texture Cube Exporter HDR

### `unreal.TextureExporterBMP`
Inherits: `TextureExporterGeneric` | Header: `TextureExporterBMP.h`

Texture Exporter BMP

### `unreal.TextureExporterDDS`
Inherits: `TextureExporterGeneric` | Header: `TextureExporterDDS.h`

Texture Exporter DDS

### `unreal.TextureExporterEXR`
Inherits: `TextureExporterGeneric` | Header: `TextureExporterEXR.h`

Texture Exporter EXR

### `unreal.TextureExporterGeneric`
Inherits: `Exporter` | Header: `TextureExporterGeneric.h`

Texture Exporter Generic

### `unreal.TextureExporterHDR`
Inherits: `TextureExporterGeneric` | Header: `TextureExporterHDR.h`

Texture Exporter HDR

### `unreal.TextureExporterJPEG`
Inherits: `Exporter` | Header: `TextureExporterPNG.h`

JPEG is not UTextureExporterGeneric JPEG exporter writes stored JPEG bits in TextureSource compressed payloads

### `unreal.TextureExporterPNG`
Inherits: `TextureExporterGeneric` | Header: `TextureExporterPNG.h`

Texture Exporter PNG

### `unreal.TextureExporterTGA`
Inherits: `TextureExporterGeneric` | Header: `TextureExporterTGA.h`

Texture Exporter TGA

### `unreal.TextureExporterUEJPEG`
Inherits: `Exporter` | Header: `TextureExporterPNG.h`

Texture Exporter UEJPEG

### `unreal.TextureFactory`
Inherits: `Factory` | Header: `TextureFactory.h`

Texture Factory

### `unreal.TextureRenderTarget2DArrayFactoryNew`
Inherits: `Factory` | Header: `TextureRenderTarget2DArrayFactoryNew.h`

Texture Render Target 2DArray Factory New

### `unreal.TextureRenderTargetCubeFactoryNew`
Inherits: `Factory` | Header: `TextureRenderTargetCubeFactoryNew.h`

Texture Render Target Cube Factory New

### `unreal.TextureRenderTargetFactoryNew`
Inherits: `Factory` | Header: `TextureRenderTargetFactoryNew.h`

Texture Render Target Factory New

### `unreal.TextureRenderTargetVolumeFactoryNew`
Inherits: `Factory` | Header: `TextureRenderTargetVolumeFactoryNew.h`

Texture Render Target Volume Factory New

### `unreal.TouchInterfaceFactory`
Inherits: `Factory` | Header: `TouchInterfaceFactory.h`

Touch Interface Factory

### `unreal.TrueTypeFontFactory`
Inherits: `TextureFactory` | Header: `TrueTypeFontFactory.h`

True Type Font Factory

### `unreal.UDIMTextureFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `TextureFactory.h`

UDIMTexture Function Library

**Methods** (1):
  - `make_udim_virtual_texture_from_texture2_ds(output_path_name, source_textures, block_coords, keep_existing_settings = False, check_out_and_save = False)` -> `Texture2D` [classmethod] — Make a UDIM virtual texture from a list of regular 2D textures

### `unreal.UnrealEditorSubsystem`
Inherits: `EditorSubsystem` | Header: `UnrealEditorSubsystem.h`

UUnrealEditorSubsystem Subsystem for exposing editor functionality to scripts

**Methods** (4):
  - `get_editor_world()` -> `World` — Find the World in the world editor. It can then be used as WorldContext by other libraries like GameplayStatics.
  - `get_game_world()` -> `World` — Get Game World
  - `get_level_viewport_camera_info()` -> `(camera_location=Vector, camera_rotation=Rotator) or None` — Gets information about the camera position for the primary level editor viewport. In non-editor builds, these will be ze...
  - `set_level_viewport_camera_info(camera_location, camera_rotation)` -> `None` — Sets information about the camera position for the primary level editor viewport. In the UnrealEd module instead of Leve...

### `unreal.VariableFrameStrippingSettingsFactory`
Inherits: `Factory` | Header: `VariableFrameStrippingSettingsFactory.h`

Variable Frame Stripping Settings Factory

### `unreal.VectorFieldExporter`
Inherits: `Exporter` | Header: `VectorFieldExporter.h`

Vector Field Exporter

### `unreal.VectorFieldStaticFactory`
Inherits: `Factory` | Header: `VectorFieldStaticFactory.h`

Vector Field Static Factory

### `unreal.VirtualTextureBuilderExporterBMP`
Inherits: `TextureExporterBMP` | Header: `TextureExporterBMP.h`

Virtual Texture Builder Exporter BMP

### `unreal.VirtualTextureBuilderExporterDDS`
Inherits: `TextureExporterDDS` | Header: `TextureExporterDDS.h`

Virtual Texture Builder Exporter DDS

### `unreal.VirtualTextureBuilderExporterEXR`
Inherits: `TextureExporterEXR` | Header: `TextureExporterEXR.h`

Virtual Texture Builder Exporter EXR

### `unreal.VirtualTextureBuilderExporterHDR`
Inherits: `TextureExporterHDR` | Header: `TextureExporterHDR.h`

Virtual Texture Builder Exporter HDR

### `unreal.VirtualTextureBuilderExporterPNG`
Inherits: `TextureExporterPNG` | Header: `TextureExporterPNG.h`

Virtual Texture Builder Exporter PNG

### `unreal.VolumeTextureFactory`
Inherits: `Factory` | Header: `VolumeTextureFactory.h`

Factory for creating volume texture

### `unreal.WorldFactory`
Inherits: `Factory` | Header: `WorldFactory.h`

World Factory

### `unreal.AssetEditorOpenLocation`
Inherits: `EnumBase` | Header: `EditorStyleSettings.h`

EAsset Editor Open Location

**Properties** (7):
  - `CONTENT_BROWSER`: `AssetEditorOpenLocation = Ellipsis` — Docks tabs into the content browserâs window. 3
  - `DEFAULT`: `AssetEditorOpenLocation = Ellipsis` — Attempts to dock asset editors into either a new window, or the main window if they were docked ther...
  - `LAST_DOCKED_WINDOW_OR_CONTENT_BROWSER`: `AssetEditorOpenLocation = Ellipsis` — Docks tabs into the last window that was docked into, or the content browser window if there is no l...
  - `LAST_DOCKED_WINDOW_OR_MAIN_WINDOW`: `AssetEditorOpenLocation = Ellipsis` — Docks tabs into the last window that was docked into, or the main window if there is no last docked ...
  - `LAST_DOCKED_WINDOW_OR_NEW_WINDOW`: `AssetEditorOpenLocation = Ellipsis` — Docks tabs into the last window that was docked into, or a new window if there is no last docked win...
  - `MAIN_WINDOW`: `AssetEditorOpenLocation = Ellipsis` — Docks tabs into the main window. 2
  - `NEW_WINDOW`: `AssetEditorOpenLocation = Ellipsis` — Docks tabs into new windows. 1

### `unreal.CSVImportType`
Inherits: `EnumBase` | Header: `CSVImportFactory.h`

Enum to indicate what to import CSV as

**Properties** (5):
  - `ECSV_CURVE_FLOAT`: `CSVImportType = Ellipsis` — Import as a UCurveFloat 2
  - `ECSV_CURVE_LINEAR_COLOR`: `CSVImportType = Ellipsis` — Import as a UCurveLinearColor 4
  - `ECSV_CURVE_TABLE`: `CSVImportType = Ellipsis` — Import as UCurveTable 1
  - `ECSV_CURVE_VECTOR`: `CSVImportType = Ellipsis` — Import as a UCurveVector 3
  - `ECSV_DATA_TABLE`: `CSVImportType = Ellipsis` — Import as UDataTable 0

### `unreal.EditorAssetMetaDataSortType`
Inherits: `EnumBase` | Header: `EditorAssetSubsystem.h`

EEditor Asset Meta Data Sort Type

**Properties** (3):
  - `DATE_TIME`: `EditorAssetMetaDataSortType = Ellipsis` — 2
  - `NUMERIC`: `EditorAssetMetaDataSortType = Ellipsis` — 1
  - `STRING`: `EditorAssetMetaDataSortType = Ellipsis` — 0

### `unreal.EditorAssetSortOrder`
Inherits: `EnumBase` | Header: `EditorAssetSubsystem.h`

EEditor Asset Sort Order

**Properties** (2):
  - `ASCENDING`: `EditorAssetSortOrder = Ellipsis` — 0
  - `DESCENDING`: `EditorAssetSortOrder = Ellipsis` — 1

### `unreal.FBXAnimationLengthImportType`
Inherits: `EnumBase` | Header: `FbxAnimSequenceImportData.h`

Animation length type when importing

**Properties** (3):
  - `FBXALIT_ANIMATED_KEY`: `FBXAnimationLengthImportType = Ellipsis` — Will import the range of frames that have animation. Can be useful if the exported range is longer t...
  - `FBXALIT_EXPORTED_TIME`: `FBXAnimationLengthImportType = Ellipsis` — This option imports animation frames based on what is defined at the time of export 0
  - `FBXALIT_SET_RANGE`: `FBXAnimationLengthImportType = Ellipsis` — This will enable the Start Frame and End Frame properties for you to define the frames of animation ...

### `unreal.FbxExportCompatibility`
Inherits: `EnumBase` | Header: `FbxExportOption.h`

Fbx export compatibility

**Properties** (8):
  - `FBX_2011`: `FbxExportCompatibility = Ellipsis` — 0
  - `FBX_2012`: `FbxExportCompatibility = Ellipsis` — 1
  - `FBX_2013`: `FbxExportCompatibility = Ellipsis` — 2
  - `FBX_2014`: `FbxExportCompatibility = Ellipsis` — 3
  - `FBX_2016`: `FbxExportCompatibility = Ellipsis` — 4
  - `FBX_2018`: `FbxExportCompatibility = Ellipsis` — 5
  - `FBX_2019`: `FbxExportCompatibility = Ellipsis` — 6
  - `FBX_2020`: `FbxExportCompatibility = Ellipsis` — 7

### `unreal.FBXImportContentType`
Inherits: `EnumBase` | Header: `FbxSkeletalMeshImportData.h`

EFBXImport Content Type

**Properties** (3):
  - `FBXICT_ALL`: `FBXImportContentType = Ellipsis` — geometry, skinning and weights. 0 Import all fbx content
  - `FBXICT_GEOMETRY`: `FBXImportContentType = Ellipsis` — Import the skeletal mesh geometry only (will create a default skeleton, or map the geometry to the e...
  - `FBXICT_SKINNING_WEIGHTS`: `FBXImportContentType = Ellipsis` — Import the skeletal mesh skinning and weights only (no geometry will be imported). Morph and LOD wil...

### `unreal.FBXImportType`
Inherits: `EnumBase` | Header: `FbxImportUI.h`

Import mesh type

**Properties** (3):
  - `FBXIT_ANIMATION`: `FBXImportType = Ellipsis` — Select Animation if youâd like to import only animation. 2
  - `FBXIT_SKELETAL_MESH`: `FBXImportType = Ellipsis` — Select Skeletal Mesh if youâd like to import skeletal mesh. 1
  - `FBXIT_STATIC_MESH`: `FBXImportType = Ellipsis` — Select Static Mesh if youâd like to import static mesh. 0

### `unreal.FbxMaterialBakeMode`
Inherits: `EnumBase` | Header: `FbxExportOption.h`

EFbx Material Bake Mode

**Properties** (3):
  - `DISABLED`: `FbxMaterialBakeMode = Ellipsis` — Never bake material inputs. 0
  - `SIMPLE`: `FbxMaterialBakeMode = Ellipsis` — Only use a simple quad if a material input needs to be baked out. 1
  - `USE_MESH_DATA`: `FbxMaterialBakeMode = Ellipsis` — Allow usage of the mesh data if a material input needs to be baked out with vertex data. 2

### `unreal.FBXNormalGenerationMethod`
Inherits: `EnumBase` | Header: `FbxMeshImportData.h`

EFBXNormal Generation Method

**Properties** (2):
  - `BUILT_IN`: `FBXNormalGenerationMethod = Ellipsis` — Use the legacy built in method to generate normals (faster in some cases) 0
  - `MIKK_T_SPACE`: `FBXNormalGenerationMethod = Ellipsis` — Use MikkTSpace to generate normals and tangents 1

### `unreal.FBXNormalImportMethod`
Inherits: `EnumBase` | Header: `FbxMeshImportData.h`

EFBXNormal Import Method

**Properties** (3):
  - `FBXNIM_COMPUTE_NORMALS`: `FBXNormalImportMethod = Ellipsis` — 0
  - `FBXNIM_IMPORT_NORMALS`: `FBXNormalImportMethod = Ellipsis` — 1
  - `FBXNIM_IMPORT_NORMALS_AND_TANGENTS`: `FBXNormalImportMethod = Ellipsis` — 2

### `unreal.FBXSceneNormalGenerationMethod`
Inherits: `EnumBase` | Header: `FbxSceneImportOptionsStaticMesh.h`

EFBXScene Normal Generation Method

**Properties** (2):
  - `BUILT_IN`: `FBXSceneNormalGenerationMethod = Ellipsis` — Use the legacy built in method to generate normals (faster in some cases) 0
  - `MIKK_T_SPACE`: `FBXSceneNormalGenerationMethod = Ellipsis` — Use MikkTSpace to generate normals and tangents 1

### `unreal.FBXSceneNormalImportMethod`
Inherits: `EnumBase` | Header: `FbxSceneImportOptionsStaticMesh.h`

EFBXScene Normal Import Method

**Properties** (3):
  - `FBX_SCENE_NIM_COMPUTE_NORMALS`: `FBXSceneNormalImportMethod = Ellipsis` — 0
  - `FBX_SCENE_NIM_IMPORT_NORMALS`: `FBXSceneNormalImportMethod = Ellipsis` — 1
  - `FBX_SCENE_NIM_IMPORT_NORMALS_AND_TANGENTS`: `FBXSceneNormalImportMethod = Ellipsis` — 2

### `unreal.FBXSceneOptionsCreateHierarchyType`
Inherits: `EnumBase` | Header: `FbxSceneImportOptions.h`

EFBXScene Options Create Hierarchy Type

**Properties** (3):
  - `FBXSOCHT_CREATE_ACTOR_COMPONENTS`: `FBXSceneOptionsCreateHierarchyType = Ellipsis` — Create one actor and a component for every node in the fbx hierarchy. No reimport of the hierarchy. ...
  - `FBXSOCHT_CREATE_BLUEPRINT`: `FBXSceneOptionsCreateHierarchyType = Ellipsis` — Create one blueprint and a component for every node in the fbx hierarchy. Hierarchy can be reimport....
  - `FBXSOCHT_CREATE_LEVEL_ACTORS`: `FBXSceneOptionsCreateHierarchyType = Ellipsis` — Create an actor for every node in the fbx hierarchy. No reimport of the hierarchy. 0

### `unreal.FbxSceneVertexColorImportOption`
Inherits: `EnumBase` | Header: `FbxSceneImportOptionsStaticMesh.h`

EFbx Scene Vertex Color Import Option

**Properties** (3):
  - `IGNORE`: `FbxSceneVertexColorImportOption = Ellipsis` — Ignore vertex colors from the FBX file, and keep the existing mesh vertex colors. 1
  - `OVERRIDE`: `FbxSceneVertexColorImportOption = Ellipsis` — Override all vertex colors with the specified color. 2
  - `REPLACE`: `FbxSceneVertexColorImportOption = Ellipsis` — Import the static mesh using the vertex colors from the FBX file. 0

### `unreal.LevelViewportType`
Inherits: `EnumBase` | Header: `UnrealEdTypes.h`

ELevelViewportType

**Properties** (15):
  - `LVT_MAX`: `LevelViewportType = Ellipsis` — 8
  - `LVT_ORTHO_BACK`: `LevelViewportType = Ellipsis` — Back 2
  - `LVT_ORTHO_BOTTOM`: `LevelViewportType = Ellipsis` — Bottom 5
  - `LVT_ORTHO_FREELOOK`: `LevelViewportType = Ellipsis` — 4
  - `LVT_ORTHO_FRONT`: `LevelViewportType = Ellipsis` — Front 7
  - `LVT_ORTHO_LEFT`: `LevelViewportType = Ellipsis` — Left 1
  - `LVT_ORTHO_NEGATIVE_XY`: `LevelViewportType = Ellipsis` — Bottom 5
  - `LVT_ORTHO_NEGATIVE_XZ`: `LevelViewportType = Ellipsis` — Left 6
  - `LVT_ORTHO_NEGATIVE_YZ`: `LevelViewportType = Ellipsis` — Front 7
  - `LVT_ORTHO_RIGHT`: `LevelViewportType = Ellipsis` — Right 6
  - `LVT_ORTHO_TOP`: `LevelViewportType = Ellipsis` — Top 0
  - `LVT_ORTHO_XY`: `LevelViewportType = Ellipsis` — Top 0
  - `LVT_ORTHO_XZ`: `LevelViewportType = Ellipsis` — Right 1
  - `LVT_ORTHO_YZ`: `LevelViewportType = Ellipsis` — Back 2
  - `LVT_PERSPECTIVE`: `LevelViewportType = Ellipsis` — 3

### `unreal.LevelVisibilityDirtyMode`
Inherits: `EnumBase` | Header: `EditorLevelUtils.h`

ELevel Visibility Dirty Mode

**Properties** (2):
  - `DONT_MODIFY`: `LevelVisibilityDirtyMode = Ellipsis` — Use when code is causing the visibility change. 1
  - `MODIFY_ON_CHANGE`: `LevelVisibilityDirtyMode = Ellipsis` — Use when the user is causing the visibility change.  Will update transaction state and mark the pack...

### `unreal.MaterialSearchLocation`
Inherits: `EnumBase` | Header: `MaterialImportHelpers.h`

EMaterial Search Location

**Properties** (5):
  - `ALL_ASSETS`: `MaterialSearchLocation = Ellipsis` — Search for matching material in all assets folders. 3
  - `DO_NOT_SEARCH`: `MaterialSearchLocation = Ellipsis` — Do not search for existing matching materials 4
  - `LOCAL`: `MaterialSearchLocation = Ellipsis` — Search for matching material in local import folder only. 0
  - `UNDER_PARENT`: `MaterialSearchLocation = Ellipsis` — Search for matching material recursively from parent folder. 1
  - `UNDER_ROOT`: `MaterialSearchLocation = Ellipsis` — Search for matching material recursively from root folder. 2

### `unreal.MovieSceneBakeType`
Inherits: `EnumBase` | Header: `FbxExportOption.h`

Bake options for animated properties of exported objects

**Properties** (4):
  - `BAKE_ALL`: `MovieSceneBakeType = Ellipsis` — 3
  - `BAKE_CHANNELS`: `MovieSceneBakeType = Ellipsis` — 1
  - `BAKE_TRANSFORMS`: `MovieSceneBakeType = Ellipsis` — 2
  - `NONE`: `MovieSceneBakeType = Ellipsis` — 0

### `unreal.PropertyEditorTestEditColor`
Inherits: `EnumBase` | Header: `PropertyEditorTestObject.h`

EProperty Editor Test Edit Color

**Properties** (9):
  - `BLUE`: `PropertyEditorTestEditColor = Ellipsis` — 4
  - `CYAN`: `PropertyEditorTestEditColor = Ellipsis` — 9
  - `GREEN`: `PropertyEditorTestEditColor = Ellipsis` — 3
  - `MAGENTA`: `PropertyEditorTestEditColor = Ellipsis` — 8
  - `ORANGE`: `PropertyEditorTestEditColor = Ellipsis` — 1
  - `PINK`: `PropertyEditorTestEditColor = Ellipsis` — 7
  - `RED`: `PropertyEditorTestEditColor = Ellipsis` — 0
  - `VIOLET`: `PropertyEditorTestEditColor = Ellipsis` — 6
  - `YELLOW`: `PropertyEditorTestEditColor = Ellipsis` — 2

### `unreal.PropertyEditorTestEnum`
Inherits: `EnumBase` | Header: `PropertyEditorTestObject.h`

EProperty Editor Test Enum

**Properties** (3):
  - `PROPERTY_EDITOR_TEST_ENUM2`: `PropertyEditorTestEnum = Ellipsis` — This comment should appear above enum 2 1
  - `PROPERTY_EDITOR_TEST_ENUM4`: `PropertyEditorTestEnum = Ellipsis` — This comment should appear above enum 4 3
  - `PROPERTY_EDITOR_TEST_ENUM6`: `PropertyEditorTestEnum = Ellipsis` — This comment should appear above enum 6 5

### `unreal.PropertyEditorTestUnderscores`
Inherits: `EnumBase` | Header: `PropertyEditorTestObject.h`

EProperty Editor Test Underscores

**Properties** (4):
  - `NOT_UNDERSCORE`: `PropertyEditorTestUnderscores = Ellipsis` — 3
  - `ONE`: `PropertyEditorTestUnderscores = Ellipsis` — 0
  - `THREE`: `PropertyEditorTestUnderscores = Ellipsis` — 2
  - `TWO`: `PropertyEditorTestUnderscores = Ellipsis` — 1

### `unreal.ReloadPackagesInteractionMode`
Inherits: `EnumBase` | Header: `PackageTools.h`

EReload Packages Interaction Mode

**Properties** (3):
  - `ASSUME_NEGATIVE`: `ReloadPackagesInteractionMode = Ellipsis` — Non-interactive, assume a negative response 2
  - `ASSUME_POSITIVE`: `ReloadPackagesInteractionMode = Ellipsis` — Non-interactive, assume a positive response 1
  - `INTERACTIVE`: `ReloadPackagesInteractionMode = Ellipsis` — Interactive, ask the user what to do 0

### `unreal.TestEnumFlags`
Inherits: `EnumBase` | Header: `PropertyEditorTestObject.h`

ETest Enum Flags

**Properties** (4):
  - `FOUR`: `TestEnumFlags = Ellipsis` — 4
  - `NONE`: `TestEnumFlags = Ellipsis` — 0
  - `ONE`: `TestEnumFlags = Ellipsis` — 1
  - `TWO`: `TestEnumFlags = Ellipsis` — 2

### `unreal.VertexColorImportOption`
Inherits: `EnumBase` | Header: `FbxMeshImportData.h`

EVertex Color Import Option

**Properties** (3):
  - `IGNORE`: `VertexColorImportOption = Ellipsis` — Ignore vertex colors from the FBX file, and keep the existing mesh vertex colors. 1
  - `OVERRIDE`: `VertexColorImportOption = Ellipsis` — Override all vertex colors with the specified color. 2
  - `REPLACE`: `VertexColorImportOption = Ellipsis` — Import the static mesh using the vertex colors from the FBX file. 0

### `unreal.EditorAssetSubsystem_OnExtractAssetFromFileDynamic`
Inherits: `DelegateBase` | Header: `EditorAssetSubsystem.h`

Dynamic version of FOnExtractAssetFromFile.

### `unreal.ImportSubsystem_OnAssetPostImport_Dyn`
Inherits: `MulticastDelegateBase` | Header: `ImportSubsystem.h`

delegate type fired when new assets have been (re-)imported. Note: InCreatedObject can be NULL if import failed. Params: UFactory* InFactory, UObject* InCreatedObject

### `unreal.ImportSubsystem_OnAssetPostLODImport_Dyn`
Inherits: `MulticastDelegateBase` | Header: `ImportSubsystem.h`

delegate type fired when new LOD have been imported to an asset.

### `unreal.ImportSubsystem_OnAssetPreImport_Dyn`
Inherits: `MulticastDelegateBase` | Header: `ImportSubsystem.h`

delegate type fired when new assets are being (re-)imported. Params: UFactory* InFactory, UClass* InClass, UObject* InParent, const FName& Name, const TCHAR* Type

### `unreal.ImportSubsystem_OnAssetReimport_Dyn`
Inherits: `MulticastDelegateBase` | Header: `ImportSubsystem.h`

delegate type fired when new assets have been reimported. Note: InCreatedObject can be NULL if import failed. Params: UObject* InCreatedObject

### `unreal.OnActorLabelChanged`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for when an actor changes its label.

### `unreal.OnDeleteActorsBegin`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for before delete actors is handled

### `unreal.OnDeleteActorsEnd`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for after delete actors is handled

### `unreal.OnDuplicateActorsBegin`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for before edit duplicate actors is handled

### `unreal.OnDuplicateActorsEnd`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for after edit duplicate actors is handled

### `unreal.OnEditCopyActorsBegin`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for before edit copy actors is handled

### `unreal.OnEditCopyActorsEnd`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for after edit copy actors is handled

### `unreal.OnEditCutActorsBegin`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for before edit cut actors is handled

### `unreal.OnEditCutActorsEnd`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for after edit cut actors is handled

### `unreal.OnEditNewActorsDropped`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for triggering when new actors are dropped on to the viewport via drag and drop

### `unreal.OnEditNewActorsPlaced`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for triggering when new actors are placed on to the viewport. Triggers before NewActorsDropped if placement is caused by a drop action

### `unreal.OnEditPasteActorsBegin`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for before edit paste actors is handled

### `unreal.OnEditPasteActorsEnd`
Inherits: `MulticastDelegateBase` | Header: `EditorActorSubsystem.h`

delegate type for after edit paste actors is handled
