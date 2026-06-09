# UE Python API — DatasmithContent Module

**38 types** from the `DatasmithContent` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DatasmithAssetImportOptions`, `DatasmithImportBaseOptions`, `DatasmithImportInfo`, `DatasmithReimportOptions`, `DatasmithRetessellationOptions`, `DatasmithStaticMeshImportOptions`, `DatasmithTessellationOptions`, `DatasmithAdditionalData`, `DatasmithAreaLightActor`, `DatasmithAssetImportData`, `DatasmithCADImportSceneData`, `DatasmithCommonTessellationOptions`, `DatasmithContentLibrary`, `DatasmithDeltaGenAssetImportData`, `DatasmithDeltaGenSceneImportData`, `DatasmithFBXSceneImportData`, `DatasmithGLTFSceneImportData`, `DatasmithImportedSequencesActor`, `DatasmithImportOptions`, `DatasmithMDLSceneImportData`, ... (38 total)

---

## Classes

### `unreal.DatasmithAssetImportOptions`
Inherits: `StructBase` | Header: `DatasmithImportOptions.h`

Datasmith Asset Import Options

### `unreal.DatasmithImportBaseOptions`
Inherits: `StructBase` | Header: `DatasmithImportOptions.h`

Datasmith Import Base Options

**Properties** (8):
  - `asset_options`: `DatasmithAssetImportOptions` — [Read-Write] (DatasmithAssetImportOptions)
  - `include_animation`: `bool` — [Read-Write] Specifies whether or not to import animations (bool)
  - `include_camera`: `bool` — [Read-Write] Specifies whether or not to import cameras (bool)
  - `include_geometry`: `bool` — [Read-Write] Specifies whether or not to import geometry (bool)
  - `include_light`: `bool` — [Read-Write] Specifies whether or not to import lights (bool)
  - `include_material`: `bool` — [Read-Write] Specifies whether or not to import materials and textures (bool)
  - `scene_handling`: `DatasmithImportScene` — [Read-Write] Specifies where to put the content (DatasmithImportScene)
  - `static_mesh_options`: `DatasmithStaticMeshImportOptions` — [Read-Write] (DatasmithStaticMeshImportOptions)

### `unreal.DatasmithImportInfo`
Inherits: `StructBase` | Header: `DatasmithAssetImportData.h`

Structure that fill the same role as FAssetImportInfo, but for SourceUri. Eventually, the SourceUri should be directly added to FAssetImportInfo and replace the âRelativeFilenameâ.

### `unreal.DatasmithReimportOptions`
Inherits: `StructBase` | Header: `DatasmithImportOptions.h`

Datasmith Reimport Options

**Properties** (2):
  - `respawn_deleted_actors`: `bool` — [Read-Write] Specifies whether or not to add back Actors youâve deleted from the current Level (bo...
  - `update_actors`: `bool` — [Read-Write] Specifies whether or not to update Datasmith Scene Actors in the current Level (bool)

### `unreal.DatasmithRetessellationOptions`
Inherits: `DatasmithTessellationOptions` | Header: `DatasmithImportOptions.h`

Datasmith Retessellation Options

**Properties** (1):
  - `retessellation_rule`: `DatasmithCADRetessellationRule` — [Read-Write] Regenerate deleted surfaces during retesselate or ignore them (DatasmithCADRetessellati...

### `unreal.DatasmithStaticMeshImportOptions`
Inherits: `StructBase` | Header: `DatasmithImportOptions.h`

Datasmith Static Mesh Import Options

**Properties** (4):
  - `generate_lightmap_u_vs`: `bool` — [Read-Write] (bool)
  - `max_lightmap_resolution`: `DatasmithImportLightmapMax` — [Read-Write] Maximum resolution for auto-generated lightmap UVs (DatasmithImportLightmapMax)
  - `min_lightmap_resolution`: `DatasmithImportLightmapMin` — [Read-Write] Minimum resolution for auto-generated lightmap UVs (DatasmithImportLightmapMin)
  - `remove_degenerates`: `bool` — [Read-Write] (bool)

### `unreal.DatasmithTessellationOptions`
Inherits: `StructBase` | Header: `DatasmithImportOptions.h`

Datasmith Tessellation Options

**Properties** (6):
  - `chord_tolerance`: `float` — [Read-Write] Maximum distance between any generated triangle and the original surface. Smaller value...
  - `geometric_tolerance`: `float` — [Read-Write] Tolerance used to determine if a surface should be tessellated or not. (double)
  - `max_edge_length`: `float` — [Read-Write] Maximum length of any edge in the generated triangles. Smaller values make more triangl...
  - `normal_tolerance`: `float` — [Read-Write] Maximum angle between adjacent triangles. Smaller values make more triangles. (float)
  - `stitching_technique`: `DatasmithCADStitchingTechnique` — [Read-Write] Stitching technique applied on model before tessellation. Sewing could impact number of...
  - `stitching_tolerance`: `float` — [Read-Write] Tolerance used to determine if two surfaces should be stitched. (double)

### `unreal.DatasmithAdditionalData`
Inherits: `Object` | Header: `DatasmithAdditionalData.h`

Base class for all additional data storable on datasmith assets. usage:: Translator can push custom data on assets in order to exploit that data latter ( see: UDatasmithCustomActionBase)

### `unreal.DatasmithAreaLightActor`
Inherits: `Actor` | Header: `DatasmithAreaLightActor.h`

Datasmith Area Light Actor

**Properties** (17):
  - `attenuation_radius`: `float` — [Read-Write] (float)
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `dimensions`: `Vector2D` — [Read-Write] (Vector2D)
  - `ies_brightness_scale`: `float` — [Read-Write] (float)
  - `ies_texture`: `TextureLightProfile` — [Read-Write] (TextureLightProfile)
  - `intensity`: `float` — [Read-Write] (float)
  - `intensity_units`: `LightUnits` — [Read-Write] (LightUnits)
  - `light_shape`: `DatasmithAreaLightActorShape` — [Read-Write] (DatasmithAreaLightActorShape)
  - `light_type`: `DatasmithAreaLightActorType` — [Read-Write] (DatasmithAreaLightActorType)
  - `mobility`: `ComponentMobility` [Read-Only] — [Read-Only] (ComponentMobility)
  - `rotation`: `Rotator` — [Read-Write] (Rotator)
  - `source_length`: `float` — [Read-Write] (float)
  - `source_radius`: `float` — [Read-Write] (float)
  - `spotlight_inner_angle`: `float` — [Read-Write] (float)
  - `spotlight_outer_angle`: `float` — [Read-Write] (float)
  - `temperature`: `float` — [Read-Write] (float)
  - `use_ies_brightness`: `bool` — [Read-Write] (bool)

### `unreal.DatasmithAssetImportData`
Inherits: `AssetImportData` | Header: `DatasmithAssetImportData.h`

Datasmith Asset Import Data

**Properties** (1):
  - `asset_import_options`: `DatasmithAssetImportOptions` — [Read-Write] (DatasmithAssetImportOptions)

### `unreal.DatasmithCADImportSceneData`
Inherits: `DatasmithSceneImportData` | Header: `DatasmithAssetImportData.h`

Import data and options specific to tessellated Datasmith scenes

### `unreal.DatasmithCommonTessellationOptions`
Inherits: `DatasmithOptionsBase` | Header: `DatasmithImportOptions.h`

Datasmith Common Tessellation Options

**Properties** (1):
  - `options`: `DatasmithTessellationOptions` — [Read-Write] (DatasmithTessellationOptions)

### `unreal.DatasmithContentLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DatasmithContentBlueprintLibrary.h`

Datasmith Content Blueprint Library

**Methods** (6):
  - `get_all_datasmith_user_data(object_class)` -> `Array [ DatasmithUserData ]` [classmethod] — Find all Datasmith User Data of loaded objects of the given type. This is a slow operation, so editor only.
  - `get_all_objects_and_values_for_key()` [classmethod] — Find all loaded objects of the given type that have a Datasmith User Data that contains the given key and their associat...
  - `get_datasmith_user_data(object)` -> `DatasmithUserData` [classmethod] — Get the Datasmith User Data of a given object
  - `get_datasmith_user_data_keys_and_values_for_value()` [classmethod] — Get the keys and values for which the associated value contains the string to match for the Datasmith User Data of the g...
  - `get_datasmith_user_data_value_for_key(object, key, partial_match_key = False)` -> `str` [classmethod] — Get the value of the given key for the Datasmith User Data of the given object.
  - `get_datasmith_user_data_values_for_key(object, key, partial_match_key = False)` -> `Array [ str ]` [classmethod] — Get the values of the given key for the Datasmith User Data of the given object.

### `unreal.DatasmithDeltaGenAssetImportData`
Inherits: `DatasmithAssetImportData` | Header: `DatasmithAssetImportData.h`

Datasmith Delta Gen Asset Import Data

### `unreal.DatasmithDeltaGenSceneImportData`
Inherits: `DatasmithFBXSceneImportData` | Header: `DatasmithAssetImportData.h`

Datasmith Delta Gen Scene Import Data

### `unreal.DatasmithFBXSceneImportData`
Inherits: `DatasmithSceneImportData` | Header: `DatasmithAssetImportData.h`

Datasmith FBXScene Import Data

### `unreal.DatasmithGLTFSceneImportData`
Inherits: `DatasmithSceneImportData` | Header: `DatasmithAssetImportData.h`

Datasmith GLTFScene Import Data

### `unreal.DatasmithImportedSequencesActor`
Inherits: `Actor` | Header: `DatasmithImportedSequencesActor.h`

Datasmith Imported Sequences Actor

**Methods** (1):
  - `play_level_sequence(sequence_to_play)` -> `None` — Play Level Sequence

**Properties** (1):
  - `imported_sequences`: `None` — [Read-Write] (Array[LevelSequence])

### `unreal.DatasmithImportOptions`
Inherits: `DatasmithOptionsBase` | Header: `DatasmithImportOptions.h`

Datasmith Import Options

**Properties** (5):
  - `base_options`: `DatasmithImportBaseOptions` — [Read-Write] Not displayed. Kept for future use (DatasmithImportBaseOptions)
  - `file_name`: `str` — [Read-Write] Name of the imported file without its path (str)
  - `file_path`: `str` — [Read-Write] Full path of the imported file (str)
  - `reimport_options`: `DatasmithReimportOptions` — [Read-Write] Options specific to the reimport process (DatasmithReimportOptions)
  - `source_uri`: `str` — [Read-Write] (str)

### `unreal.DatasmithMDLSceneImportData`
Inherits: `DatasmithSceneImportData` | Header: `DatasmithAssetImportData.h`

Datasmith MDLScene Import Data

### `unreal.DatasmithOptionsBase`
Inherits: `Object` | Header: `DatasmithImportOptions.h`

Base class for all import options in datasmith.

### `unreal.DatasmithScene`
Inherits: `Object` | Header: `DatasmithScene.h`

Datasmith Scene

**Methods** (3):
  - `add_asset_user_data_of_class(user_data_class)` -> `bool` — Creates and adds an instance of the provided AssetUserData class to the target asset.
  - `get_asset_user_data_of_class(user_data_class)` -> `AssetUserData` — Returns an instance of the provided AssetUserData class if itâs contained in the target asset.
  - `has_asset_user_data_of_class(user_data_class)` -> `bool` — Checks whether or not an instance of the provided AssetUserData class is contained.

### `unreal.DatasmithSceneActor`
Inherits: `Actor` | Header: `DatasmithSceneActor.h`

Datasmith Scene Actor

### `unreal.DatasmithSceneImportData`
Inherits: `AssetImportData` | Header: `DatasmithAssetImportData.h`

Base class for import data and options used when importing any asset from Datasmith

### `unreal.DatasmithStaticMeshCADImportData`
Inherits: `DatasmithStaticMeshImportData` | Header: `DatasmithAssetImportData.h`

Datasmith Static Mesh CADImport Data

### `unreal.DatasmithStaticMeshGLTFImportData`
Inherits: `DatasmithStaticMeshImportData` | Header: `DatasmithAssetImportData.h`

Datasmith Static Mesh GLTFImport Data

### `unreal.DatasmithStaticMeshImportData`
Inherits: `DatasmithAssetImportData` | Header: `DatasmithAssetImportData.h`

Datasmith Static Mesh Import Data

### `unreal.DatasmithTranslatedSceneImportData`
Inherits: `DatasmithSceneImportData` | Header: `DatasmithAssetImportData.h`

Import data and options specific to Datasmith scenes imported through the translator system

### `unreal.DatasmithUserData`
Inherits: `AssetUserData` | Header: `DatasmithAssetUserData.h`

Asset user data that can be used with Datasmith on Actors and other objects

**Properties** (1):
  - `metadata`: `None` [Read-Only] — [Read-Only] (Map[Name,str])

### `unreal.DatasmithVREDAssetImportData`
Inherits: `DatasmithAssetImportData` | Header: `DatasmithAssetImportData.h`

Datasmith VREDAsset Import Data

### `unreal.DatasmithVREDSceneImportData`
Inherits: `DatasmithFBXSceneImportData` | Header: `DatasmithAssetImportData.h`

Datasmith VREDScene Import Data

### `unreal.DatasmithAreaLightActorShape`
Inherits: `EnumBase` | Header: `DatasmithAreaLightActor.h`

Keep in sync with EDatasmithLightShape from DatasmithDefinitions

**Properties** (5):
  - `CYLINDER`: `DatasmithAreaLightActorShape = Ellipsis` — 3
  - `DISC`: `DatasmithAreaLightActorShape = Ellipsis` — 1
  - `NONE`: `DatasmithAreaLightActorShape = Ellipsis` — 4
  - `RECTANGLE`: `DatasmithAreaLightActorShape = Ellipsis` — 0
  - `SPHERE`: `DatasmithAreaLightActorShape = Ellipsis` — 2

### `unreal.DatasmithAreaLightActorType`
Inherits: `EnumBase` | Header: `DatasmithAreaLightActor.h`

EDatasmith Area Light Actor Type

**Properties** (4):
  - `IES_DEPRECATED`: `DatasmithAreaLightActorType = Ellipsis` — 2
  - `POINT`: `DatasmithAreaLightActorType = Ellipsis` — 0
  - `RECT`: `DatasmithAreaLightActorType = Ellipsis` — Added for consistency with type EDatasmithAreaLightType.
Removing this will result in âEDatasmithA...
  - `SPOT`: `DatasmithAreaLightActorType = Ellipsis` — 1

### `unreal.DatasmithCADRetessellationRule`
Inherits: `EnumBase` | Header: `DatasmithImportOptions.h`

EDatasmith CADRetessellation Rule

**Properties** (2):
  - `ALL`: `DatasmithCADRetessellationRule = Ellipsis` — 0
  - `SKIP_DELETED_SURFACES`: `DatasmithCADRetessellationRule = Ellipsis` — 1

### `unreal.DatasmithCADStitchingTechnique`
Inherits: `EnumBase` | Header: `DatasmithImportOptions.h`

EDatasmith CADStitching Technique

**Properties** (3):
  - `STITCHING_HEAL`: `DatasmithCADStitchingTechnique = Ellipsis` — 1
  - `STITCHING_NONE`: `DatasmithCADStitchingTechnique = Ellipsis` — 0
  - `STITCHING_SEW`: `DatasmithCADStitchingTechnique = Ellipsis` — 2

### `unreal.DatasmithImportLightmapMax`
Inherits: `EnumBase` | Header: `DatasmithImportOptions.h`

EDatasmith Import Lightmap Max

**Properties** (7):
  - `LIGHTMAP_1024`: `DatasmithImportLightmapMax = Ellipsis` — 4
  - `LIGHTMAP_128`: `DatasmithImportLightmapMax = Ellipsis` — 1
  - `LIGHTMAP_2048`: `DatasmithImportLightmapMax = Ellipsis` — 5
  - `LIGHTMAP_256`: `DatasmithImportLightmapMax = Ellipsis` — 2
  - `LIGHTMAP_4096`: `DatasmithImportLightmapMax = Ellipsis` — 6
  - `LIGHTMAP_512`: `DatasmithImportLightmapMax = Ellipsis` — 3
  - `LIGHTMAP_64`: `DatasmithImportLightmapMax = Ellipsis` — 0

### `unreal.DatasmithImportLightmapMin`
Inherits: `EnumBase` | Header: `DatasmithImportOptions.h`

EDatasmith Import Lightmap Min

**Properties** (6):
  - `LIGHTMAP_128`: `DatasmithImportLightmapMin = Ellipsis` — 3
  - `LIGHTMAP_16`: `DatasmithImportLightmapMin = Ellipsis` — 0
  - `LIGHTMAP_256`: `DatasmithImportLightmapMin = Ellipsis` — 4
  - `LIGHTMAP_32`: `DatasmithImportLightmapMin = Ellipsis` — 1
  - `LIGHTMAP_512`: `DatasmithImportLightmapMin = Ellipsis` — 5
  - `LIGHTMAP_64`: `DatasmithImportLightmapMin = Ellipsis` — 2

### `unreal.DatasmithImportScene`
Inherits: `EnumBase` | Header: `DatasmithImportOptions.h`

EDatasmith Import Scene

**Properties** (3):
  - `ASSETS_ONLY`: `DatasmithImportScene = Ellipsis` — Do not modify the Level after import. No actor will be created (including the Blueprint if requested...
  - `CURRENT_LEVEL`: `DatasmithImportScene = Ellipsis` — Use the current Level to spawn the actors after the import. 1
  - `NEW_LEVEL`: `DatasmithImportScene = Ellipsis` — Create a new Level and spawn the actors after the import. 0
