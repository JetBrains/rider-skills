# UE Python API — USDClasses Module

**30 types** from the `USDClasses` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `UsdCombinedPrimMetadata`, `UsdMetadataImportOptions`, `UsdMetadataValue`, `UsdPrimMetadata`, `UsdPrimPathList`, `UsdStageOptions`, `UsdUnrealAssetInfo`, `UsdAnimSequenceAssetImportData`, `UsdAnimSequenceAssetUserData`, `UsdAssetCache`, `UsdAssetCache2`, `UsdAssetImportData`, `UsdAssetUserData`, `UsdDrawModeComponent`, `UsdGeometryCacheAssetUserData`, `UsdLevelSequenceAssetUserData`, `UsdMaterialAssetUserData`, `UsdMeshAssetImportData`, `UsdMeshAssetUserData`, `UsdProjectSettings`, ... (30 total)

---

## Classes

### `unreal.UsdCombinedPrimMetadata`
Inherits: `StructBase` | Header: `USDMetadata.h`

Tracks metadata collected from multiple prim paths. This is useful because often multiple prims will be read to generate an asset, like when collapsing or collecting skinned Mesh prims for a SkeletalM...

**Properties** (1):
  - `prim_path_to_metadata`: `None` — [Read-Write] (Map[str,UsdPrimMetadata])

### `unreal.UsdMetadataImportOptions`
Inherits: `StructBase` | Header: `USDMetadataImportOptions.h`

Usd Metadata Import Options

**Properties** (5):
  - `blocked_prefix_filters`: `None` — [Read-Write] When collecting metadata, we will ignore all entries that start with these prefixes.
No...
  - `collect_from_entire_subtrees`: `bool` — [Read-Write] Whether to collect USD metadata from not only a particular prim, but its entire subtree...
  - `collect_metadata`: `bool` — [Read-Write] Whether to collect USD prim metadata into AssetUserData objects at all (bool)
  - `collect_on_components`: `bool` — [Read-Write] We will always add the collected metadata to AssetUserData objects assigned to all gene...
  - `invert_filters`: `bool` — [Read-Write] When this is false (default), the âBlockedPrefixFiltersâ property describe prefixes...

### `unreal.UsdMetadataValue`
Inherits: `StructBase` | Header: `USDMetadata.h`

Describes a single metadata value collected from USD

**Properties** (2):
  - `stringified_value`: `str` — [Read-Write] A stringified value that should match the type in TypeName (e.g. â[(1.0, 1.0, 0.5), (...
  - `type_name`: `str` — [Read-Write] USD typename. Anything from the âValue type tokenâ column on the Basic data types t...

### `unreal.UsdPrimMetadata`
Inherits: `StructBase` | Header: `USDMetadata.h`

Describes all the metadata values collected from a particular USD prim

**Properties** (1):
  - `metadata`: `None` — [Read-Write] (Map[str,UsdMetadataValue])

### `unreal.UsdPrimPathList`
Inherits: `StructBase` | Header: `USDAssetUserData.h`

Simple wrapper because weâre not allowed to have TMap properties with TArray<FString> as values

**Properties** (1):
  - `prim_paths`: `None` — [Read-Write] (Array[str])

### `unreal.UsdStageOptions`
Inherits: `StructBase` | Header: `USDStageOptions.h`

Usd Stage Options

**Properties** (2):
  - `meters_per_unit`: `float` — [Read-Write] MetersPerUnit to use for the stage. Defaults to 0.01 (i.e. 1cm per unit, which equals U...
  - `up_axis`: `UsdUpAxis` — [Read-Write] UpAxis to use for the stage. Defaults to ZAxis, which equals the UE convention (UsdUpAx...

### `unreal.UsdUnrealAssetInfo`
Inherits: `StructBase` | Header: `USDUnrealAssetInfo.h`

Metadata added to a prim to indicate it was exported from a particular Unreal asset

**Properties** (7):
  - `identifier`: `str` — [Read-Write] Filepath to the layer where the asset was exported to (str)
  - `name`: `str` — [Read-Write] Name of the Unreal asset (str)
  - `unreal_asset_type`: `str` — [Read-Write] Class name of the exported asset (e.g. âStaticMeshâ) (str)
  - `unreal_content_path`: `str` — [Read-Write] Path to the exported asset (e.g. â/Game/MyMaterials/Red.Redâ) (str)
  - `unreal_engine_version`: `str` — [Read-Write] Engine version string describing the engine that exported this asset (e.g. â5.1.0-210...
  - `unreal_export_time`: `str` — [Read-Write] DateTime string of the moment of export (e.g. â2022.06.17-14.19.54â) (str)
  - `version`: `str` — [Read-Write] Identifier string for the current asset version. Whenever the asset is updated inside U...

### `unreal.UsdAnimSequenceAssetImportData`
Inherits: `UsdAssetImportData` | Header: `USDAssetImportData.h`

Usd Anim Sequence Asset Import Data

### `unreal.UsdAnimSequenceAssetUserData`
Inherits: `UsdAssetUserData` | Header: `USDAssetUserData.h`

Usd Anim Sequence Asset User Data

### `unreal.UsdAssetCache`
Inherits: `Object` | Header: `USDAssetCache3.h`

This class is an asset that can be created via the Content Browser and assigned to AUsdStageActors.

**Methods** (20):
  - `add_asset_referencer(asset, referencer)` -> `bool` — Adds a new UObject referencer to a particular asset, returning true if the operation succeeded. Assets will not be delet...
  - `cache_asset(hash, asset_path, referencer = None)` -> `None` — Adds an existing asset to the cache attached to a particular hash, and optionally registering a referencer
  - `delete_unreferenced_assets(show_confirmation = False)` -> `None` — If bShowConfirmation is true, this will fallback to using engine code for deleting the assets, showing a confirmation di...
  - `delete_unreferenced_assets_with_confirmation()` -> `None` — This is the same as calling DeleteUnreferencedAssets and providing true for bShowConfirmation. It is just exposed in thi...
  - `get_all_tracked_assets()` -> `Map [ str , SoftObjectPath ]` — Returns a copy of the internal mapping between hashes and asset paths
  - `get_cached_asset(hash)` -> `Object` — Returns the asset associated with a particular Hash, if any. Returns nullptr if there isnât any associated path to thi...
  - `get_cached_asset_path(hash)` -> `SoftObjectPath` — Returns the internal FSoftObjectPath associated with Hash, without trying to load the asset. If there is no asset associ...
  - `get_hash_for_asset(asset_path)` -> `str` — Returns the hash associated with a particular asset, or the empty string if there isnât any. Note: The asset cache kee...
  - `get_num_assets()` -> `int32` — Returns the total number of cached asset paths, whether these resolve to assets or not
  - `get_or_create_cached_asset(hash, class_, desired_name, desired_flags, out_created_asset=bool)` — Returns the cached UObject of the provided Class for the provided Hash if one exists. Otherwise, finds a new package for...
  - `is_asset_deletable(asset)` -> `bool` — Returns whether a particular asset is currently marked as deletable or not
  - `is_asset_tracked_by_cache(asset_path)` -> `bool` — Returns true if this asset is currently tracked by the asset cacheâs main hash to asset maps
  - `load_and_get_all_tracked_assets()` -> `Map [ str , Object ]` — The same as GetAllTrackedAssets, except that it will automatically try loading all the asset paths before returning, whi...
  - `remove_all_asset_referencers()` -> `bool` — Removes all UObject referencer from all tracked assets, returning true if anything was removed.
  - `remove_all_referencer_assets(referencer)` -> `bool` — Removes a particular UObject referencer from all tracked assets, returning true if anything was removed. Will do nothing...
  - `remove_all_referencers_for_asset(asset)` -> `bool` — Removes all UObject referencers from a particular asset, returning true if anything was removed. Will do nothing in case...
  - `remove_asset_referencer(asset, referencer)` -> `bool` — Removes an UObject referencer from a particular asset, returning true if anything was removed. Will do nothing in case A...
  - `rescan_asset_directory()` -> `None` — Checks the current AssetDirectory for any new assets that were generated from USD, and automatically caches them if poss...
  - `set_asset_deletable(asset, is_deletable)` -> `None` — Sets a particular asset as deletable or not. Assets not flagged as deletable will never be deleted by the asset cache wh...
  - `stop_tracking_asset(hash)` -> `SoftObjectPath` — Removes all info about the asset associated with Hash from this cache, if there is any. Note: This will not delete the a...

**Properties** (4):
  - `asset_directory`: `DirectoryPath` — [Read-Write] Content directory where the asset cache will place newly created assets. Changing this ...
  - `clean_up_unreferenced_assets`: `bool` — [Read-Write] If this is true, every time a UsdStageActor using this asset cache closes a stage or sw...
  - `hash_to_asset_paths`: `None` — [Read-Write] This is the main internal property that maps hashes to asset paths. Add entries to this...
  - `only_handle_assets_within_asset_directory`: `bool` — [Read-Write] When true, it means the asset cache will only ever return assets that are currently ins...

### `unreal.UsdAssetCache2`
Inherits: `Object` | Header: `USDAssetCache2.h`

Owns the assets generated and reused by USD Stages, allowing thread-safe retrieval/storage.

**Methods** (16):
  - `add_asset_reference(asset, referencer)` -> `bool` — Adds a new UObject referencer to a particular asset, returning true if the operation succeeded. Assets will not be evict...
  - `cache_asset(hash, asset, referencer = None)` -> `None` — Adds an asset to the cache attached to a particular hash, and optionally registering a referencer
  - `can_remove_asset(hash)` -> `bool` — Returns true if the asset with the given hash can be removed from the cache. It will return false in case the asset is s...
  - `get_all_asset_hashes()` -> `Array [ str ]` — Returns all asset hashes tracked by the asset cache, for all storage types. This includes unloaded persistent assets
  - `get_all_cached_asset_paths()` -> `Array [ str ]` — Returns all asset paths tracked by the asset cache, for all storage types. (e.g. â/Game/MyTextures/RedBrick.RedBrickâ...
  - `get_all_loaded_assets()` -> `Array [ Object ]` — Returns all assets that are currently loaded in the asset cache. This will not include persistent assets that havenât ...
  - `get_cached_asset(hash)` -> `Object` — Returns an asset associated with a particular Hash . If the asset is persistent, unloaded and the âUSD.OnDemandCachedA...
  - `get_hash_for_asset(asset)` -> `str` — Returns the hash associated with an asset, in case we own it. Returns the empty string otherwise. Note: This has O(1) ti...
  - `get_num_assets()` -> `int32` — Returns how many assets are tracked by the asset cache in total (summing up persistent, referenced and unreferenced stor...
  - `is_asset_owned_by_cache(asset_path)` -> `bool` — Returns true in case the asset at AssetPath is tracked by the cache in any way (persistent asset, unreferenced or refere...
  - `refresh_storage()` -> `None` — Updates which assets belong to each storage type. You must call this in case you perform direct operations on the asset ...
  - `remove_all_asset_references(referencer)` -> `bool` — Removes the particular referencer to all assets tracked by the cache, if it was a referencer to any of them. Returns tru...
  - `remove_asset(hash)` -> `Object` — If an asset is associated with Hash , it will be returned and the asset cache will stop tracking this asset entirely. Re...
  - `remove_asset_reference(asset, referencer = None)` -> `bool` — Removes an UObject referencer from a particular asset, returning true if the operation succeeded. If no specific Referen...
  - `reset()` -> `None` — Discards all tracked assets across all storage types
  - `touch_asset(asset, referencer = None)` -> `bool` — Marks the provided asset as being used at this point, optionally adding a specific referencer. This is useful because th...

**Properties** (2):
  - `persistent_asset_storage_size_mb`: `float` — [Read-Write] This limit specifies how much size is allocated to storing all persistent assets (i.e. ...
  - `unreferenced_asset_storage_size_mb`: `float` — [Read-Write] The asset cache will always retain all currently used assets.
In addition to that, this...

### `unreal.UsdAssetImportData`
Inherits: `AssetImportData` | Header: `USDAssetImportData.h`

Usd Asset Import Data

### `unreal.UsdAssetUserData`
Inherits: `AssetUserData` | Header: `USDAssetUserData.h`

Usd Asset User Data

**Properties** (3):
  - `original_hash`: `str` [Read-Only] — [Read-Only] Hash of the prim data that was used to generate this asset (str)
  - `prim_paths`: `None` — [Read-Write] Paths to prims that generated the asset that owns this AssetUserData (Array[str])
  - `stage_identifier_to_metadata`: `None` — [Read-Write] Holds metadata collected for this asset, from all relevant Source prims.
The asset that...

### `unreal.UsdDrawModeComponent`
Inherits: `PrimitiveComponent` | Header: `USDDrawModeComponent.h`

Component type that is used to draw bounds, cards and origin axes when translating a prim that has the UsdGeomModelAPI schema applied.

**Methods** (2):
  - `get_texture_for_face(face)` -> `Texture2D` — Get Texture for Face
  - `set_texture_for_face(face, texture)` -> `None` — Set Texture for Face

**Properties** (11):
  - `bounds_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `bounds_max`: `Vector` — [Read-Write] (Vector)
  - `bounds_min`: `Vector` — [Read-Write] Separate vectors instead of an FBox so we can get Sequencer tracks for these as is (Vec...
  - `card_geometry`: `UsdModelCardGeometry` — [Read-Write] (UsdModelCardGeometry)
  - `card_texture_x_neg`: `Texture2D` — [Read-Write] (Texture2D)
  - `card_texture_x_pos`: `Texture2D` — [Read-Write] (Texture2D)
  - `card_texture_y_neg`: `Texture2D` — [Read-Write] (Texture2D)
  - `card_texture_y_pos`: `Texture2D` — [Read-Write] (Texture2D)
  - `card_texture_z_neg`: `Texture2D` — [Read-Write] (Texture2D)
  - `card_texture_z_pos`: `Texture2D` — [Read-Write] (Texture2D)
  - `draw_mode`: `UsdDrawMode` — [Read-Write] (UsdDrawMode)

### `unreal.UsdGeometryCacheAssetUserData`
Inherits: `UsdMeshAssetUserData` | Header: `USDAssetUserData.h`

We assign these to UGeometryCaches generated from USD

**Properties** (1):
  - `layer_start_offset_seconds`: `float` — [Read-Write] Check analogous comment on UUsdAnimSequenceAssetUserData (float)

### `unreal.UsdLevelSequenceAssetUserData`
Inherits: `AssetUserData` | Header: `USDAssetUserData.h`

We assign these to persistent LevelSequences that bind to one of the actors/components that the stage actor spawns. We need this as part of a mechanism to automatically repair those bindings when they...

**Properties** (2):
  - `handled_binding_guids`: `None` — [Read-Write] Set of binding GUIDs that we already handled in the past.
We use this so that we wonâ...
  - `last_checked_signature`: `Guid` — [Read-Write] The LevelSequence has a Guid that is changed every time its state is modified.
We pay a...

### `unreal.UsdMaterialAssetUserData`
Inherits: `UsdAssetUserData` | Header: `USDAssetUserData.h`

AssetImportData assigned to Unreal materials that are generated when parsing USD Material prims

**Properties** (2):
  - `parameter_to_primvar`: `None` — [Read-Write] In the context of our reference materials that just read a single texture for each mate...
  - `primvar_to_uv_index`: `None` — [Read-Write] In the context of our reference materials that just read a single texture for each mate...

### `unreal.UsdMeshAssetImportData`
Inherits: `UsdAssetImportData` | Header: `USDAssetImportData.h`

We assign these to UStaticMeshes or USkeletalMeshes generated from USD

### `unreal.UsdMeshAssetUserData`
Inherits: `UsdAssetUserData` | Header: `USDAssetUserData.h`

We assign these to UStaticMeshes or USkeletalMeshes generated from USD

**Properties** (2):
  - `material_slot_to_prim_paths`: `None` — [Read-Write] Maps from a material slot index of an UStaticMesh or USkeletalMesh to a list of source ...
  - `primvar_to_uv_index`: `None` — [Read-Write] Describes which primvars should be assigned to each UV index. (Map[str, int32])

### `unreal.UsdProjectSettings`
Inherits: `DeveloperSettings` | Header: `USDProjectSettings.h`

USDCore and defaultconfig here so this ends up at DefaultUSDCore.ini in the editor, and is sent to the packaged game as well

### `unreal.UsdReferenceOptions`
Inherits: `Object` | Header: `USDReferenceOptions.h`

Options to display when adding a reference or a payload for a prim

**Properties** (6):
  - `internal_reference`: `bool` — [Read-Write] When enabled, the reference/payload will target a prim on this stage (bool)
  - `target_file`: `FilePath` — [Read-Write] File to use as the reference (FilePath)
  - `target_prim_path`: `str` — [Read-Write] Use a specific prim of the target stage as the referenced/payload prim (str)
  - `time_code_offset`: `float` — [Read-Write] Offset to apply to the referenced/payload primâs time sampled attributes (float)
  - `time_code_scale`: `float` — [Read-Write] TimeCode scaling factor to apply to the referenced/payload primâs time sampled attrib...
  - `use_default_prim`: `bool` — [Read-Write] Use the default prim of the target stage as the referenced/payload prim (bool)

### `unreal.UsdSparseVolumeTextureAssetUserData`
Inherits: `UsdAssetUserData` | Header: `USDAssetUserData.h`

We use this mainly to help in mapping between stage timeCode and the FrameIndex for animated SVTs

**Properties** (4):
  - `source_open_vdb_asset_prim_paths`: `None` — [Read-Write] Paths to all the OpenVDBAsset prims that led to the generation of this SVT asset (Array...
  - `time_sample_path_indices`: `None` — [Read-Write] Corresponding indices of the frame of the SVT that should be played at a particular tim...
  - `time_sample_path_time_codes`: `None` — [Read-Write] TimeCodes of all the filePath attribute time samples as seen on the OpenVDBAsset prim i...
  - `time_sample_paths`: `None` — [Read-Write] File paths that originated each of the SVT frames, in order.
The SVT should have as man...

### `unreal.ReferencerTypeHandling`
Inherits: `EnumBase` | Header: `USDProjectSettings.h`

EReferencer Type Handling

**Properties** (4):
  - `CLEAR_REFERENCER_TYPE`: `ReferencerTypeHandling = Ellipsis` — 2
  - `IGNORE`: `ReferencerTypeHandling = Ellipsis` — 0
  - `MATCH_REFERENCED_TYPE`: `ReferencerTypeHandling = Ellipsis` — 1
  - `SHOW_PROMPT`: `ReferencerTypeHandling = Ellipsis` — 3

### `unreal.UsdDrawMode`
Inherits: `EnumBase` | Header: `USDDrawModeComponent.h`

EUsd Draw Mode

**Properties** (3):
  - `BOUNDS`: `UsdDrawMode = Ellipsis` — 1
  - `CARDS`: `UsdDrawMode = Ellipsis` — 2
  - `ORIGIN`: `UsdDrawMode = Ellipsis` — 0

### `unreal.UsdDuplicateType`
Inherits: `EnumBase` | Header: `USDDuplicateType.h`

Describes the different types of âprim duplicationâ operations we support with UsdUtils::DuplicatePrims

**Properties** (3):
  - `ALL_LOCAL_LAYER_SPECS`: `UsdDuplicateType = Ellipsis` — Duplicate each of the primâs specs across the entire stage 2
  - `FLATTEN_COMPOSED_PRIM`: `UsdDuplicateType = Ellipsis` — Generate a flattened duplicate of the composed prim onto the current edit target 0
  - `SINGLE_LAYER_SPECS`: `UsdDuplicateType = Ellipsis` — Duplicate the primâs specs on the current edit target only 1

### `unreal.UsdEditInInstanceBehavior`
Inherits: `EnumBase` | Header: `USDProjectSettings.h`

EUsd Edit in Instance Behavior

**Properties** (3):
  - `IGNORE`: `UsdEditInInstanceBehavior = Ellipsis` — 0
  - `REMOVE_INSTANCEABLE`: `UsdEditInInstanceBehavior = Ellipsis` — 1
  - `SHOW_PROMPT`: `UsdEditInInstanceBehavior = Ellipsis` — 2

### `unreal.UsdModelCardFace`
Inherits: `EnumBase` | Header: `USDDrawModeComponent.h`

EUsd Model Card Face

**Properties** (6):
  - `X_NEG`: `UsdModelCardFace = Ellipsis` — 8
  - `X_POS`: `UsdModelCardFace = Ellipsis` — 1
  - `Y_NEG`: `UsdModelCardFace = Ellipsis` — 16
  - `Y_POS`: `UsdModelCardFace = Ellipsis` — 2
  - `Z_NEG`: `UsdModelCardFace = Ellipsis` — 32
  - `Z_POS`: `UsdModelCardFace = Ellipsis` — 4

### `unreal.UsdModelCardGeometry`
Inherits: `EnumBase` | Header: `USDDrawModeComponent.h`

When weâre on EUsdDrawMode::Cards, describes how to draw our cards

**Properties** (2):
  - `BOX`: `UsdModelCardGeometry = Ellipsis` — 1
  - `CROSS`: `UsdModelCardGeometry = Ellipsis` — 0

### `unreal.UsdSaveDialogBehavior`
Inherits: `EnumBase` | Header: `USDProjectSettings.h`

EUsd Save Dialog Behavior

**Properties** (3):
  - `ALWAYS_SAVE`: `UsdSaveDialogBehavior = Ellipsis` — 1
  - `NEVER_SAVE`: `UsdSaveDialogBehavior = Ellipsis` — 0
  - `SHOW_PROMPT`: `UsdSaveDialogBehavior = Ellipsis` — 2

### `unreal.UsdUpAxis`
Inherits: `EnumBase` | Header: `USDStageOptions.h`

EUsd Up Axis

**Properties** (2):
  - `Y_AXIS`: `UsdUpAxis = Ellipsis` — 0
  - `Z_AXIS`: `UsdUpAxis = Ellipsis` — 1
