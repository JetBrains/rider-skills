# UE Python API — DataprepLibraries Module

**50 types** from the `DataprepLibraries` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataprepSetLODsReductionSettings`, `LODGroupName`, `MaterialSubstitutionDataTable`, `MeshReductionArray`, `MeshReductionOptions`, `DataprepActorComponentsSelectionTransform`, `DataprepAddTagsOperation`, `DataprepAddToLayerOperation`, `DataprepCompactSceneGraphOperation`, `DataprepConsolidateObjectsOperation`, `DataprepCreateProxyMeshOperation`, `DataprepDeleteObjectsOperation`, `DataprepDeleteUnusedAssetsOperation`, `DataprepFilterLibrary`, `DataprepFlipFacesOperation`, `DataprepFloatBoundingVolumeFetcher`, `DataprepHierarchySelectionTransform`, `DataprepIsClassOfFetcher`, `DataprepMergeActorsOperation`, `DataprepOperationsLibrary`, ... (50 total)

---

## Classes

### `unreal.DataprepSetLODsReductionSettings`
Inherits: `StructBase` | Header: `DataprepOperations.h`

Local struct used by UDataprepSetLODsOperation to better control UX

**Properties** (2):
  - `percent_triangles`: `float` — 1.0 = no reduction, 0.0 = no triangles. (float) [Read-Write] Percentage of triangles to keep. Ranges...
  - `screen_size`: `float` — [Read-Write] ScreenSize to display this LOD. Ranges from 0.0 to 1.0. (float)

### `unreal.LODGroupName`
Inherits: `StructBase` | Header: `DataprepOperationsLibrary.h`

Simple struct to set up LODGroup name on static meshes This is for internal purpose only to allow users to select the name of the LODGroup to apply on static meshes in UDataprepOperationsLibrary::SetL...

### `unreal.MaterialSubstitutionDataTable`
Inherits: `TableRowBase` | Header: `DataprepOperationsLibrary.h`

Simple struct for the table row used for UDataprepOperationsLibrary::SubstituteMaterials

**Properties** (3):
  - `material_replacement`: `MaterialInterface` [Read-Only] — [Read-Only] Material to use for the substitution (MaterialInterface)
  - `search_string`: `str` [Read-Only] — [Read-Only] Name of the material(s) to search for. Wildcard is supported (str)
  - `string_match`: `EditorScriptingStringMatchType` [Read-Only] — [Read-Only] Type of matching to perform with SearchString string (EditorScriptingStringMatchType)

### `unreal.MeshReductionArray`
Inherits: `StructBase` | Header: `DataprepOperationsLibrary.h`

Simple struct to set up LODGroup name on static meshes This is for internal purpose only to allow users to select the name of the LODGroup to apply on static meshes in UDataprepOperationsLibrary::SetL...

### `unreal.MeshReductionOptions`
Inherits: `StructBase` | Header: `DataprepOperationsLibrary.h`

Simple struct to set up LODGroup name on static meshes This is for internal purpose only to allow users to select the name of the LODGroup to apply on static meshes in UDataprepOperationsLibrary::SetL...

### `unreal.DataprepActorComponentsSelectionTransform`
Inherits: `DataprepSelectionTransform` | Header: `DataprepSelectionTransforms.h`

Return components of the selected actors

### `unreal.DataprepAddTagsOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

On each actor to process, add specified tags

**Properties** (1):
  - `tags`: `None` — [Read-Write] Array of tags to add (Array[Name])

### `unreal.DataprepAddToLayerOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

On each actor to process, add the actor to the layer

**Properties** (1):
  - `layer_name`: `Name` — [Read-Write] Name of the layer to add the actors to (Name)

### `unreal.DataprepCompactSceneGraphOperation`
Inherits: `DataprepEditingOperation` | Header: `DataprepEditingOperations.h`

Delete actors that do not have visuals, but keep those needed to preserve hierarchy

### `unreal.DataprepConsolidateObjectsOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

Replace references to each asset with the first asset in the list

### `unreal.DataprepCreateProxyMeshOperation`
Inherits: `DataprepEditingOperation` | Header: `DataprepEditingOperations.h`

Collect geometry from selected actors and merge them into single mesh with reduction.

### `unreal.DataprepDeleteObjectsOperation`
Inherits: `DataprepEditingOperation` | Header: `DataprepEditingOperations.h`

Delete any asset or actor to process

### `unreal.DataprepDeleteUnusedAssetsOperation`
Inherits: `DataprepEditingOperation` | Header: `DataprepEditingOperations.h`

Delete assets that are not referenced by any objects

### `unreal.DataprepFilterLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DataprepFilterLibrary.h`

Dataprep Filter Library

**Methods** (4):
  - `filter_by_class(target_array, object_class)` -> `Array [ Object ]` [classmethod] — Filter the array based on the Objectâs class.
  - `filter_by_name(target_array, name_sub_string, string_match = EditorScriptingStringMatchType.CONTAINS)` -> `Array [ Object ]` [classmethod] — Filter the array based on the Object name.
  - `filter_by_size(target_array, size_source, filter_mode, threshold)` -> `Array [ Object ]` [classmethod] — Filter the array based on the geometry size.
  - `filter_by_tag(target_array, tag)` -> `Array [ Actor ]` [classmethod] — Filter the array based on a tag.

### `unreal.DataprepFlipFacesOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

On each actor to process, flip faces of each mesh

### `unreal.DataprepFloatBoundingVolumeFetcher`
Inherits: `DataprepFloatFetcher` | Header: `DataprepFloatFetcherLibrary.h`

### `unreal.DataprepHierarchySelectionTransform`
Inherits: `DataprepSelectionTransform` | Header: `DataprepSelectionTransforms.h`

Return immediate children or all the descendants of the selected objects

### `unreal.DataprepIsClassOfFetcher`
Inherits: `DataprepBoolFetcher` | Header: `DataprepBoolFetcherLibrary.h`

Filter objects based of their selected class.

**Properties** (2):
  - `class_`: `Class` — [Read-Write] The key for the for the string (type(Class))
  - `should_include_child_class`: `bool` — [Read-Write] (bool)

### `unreal.DataprepMergeActorsOperation`
Inherits: `DataprepEditingOperation` | Header: `DataprepEditingOperations.h`

Collect geometry from selected actors and merge them into single mesh.

**Properties** (1):
  - `pivot_point_at_zero`: `bool` — [Read-Write] Whether merged mesh should have pivot at world origin, or at first merged component oth...

### `unreal.DataprepOperationsLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DataprepOperationsLibrary.h`

Dataprep Operations Library

**Methods** (21):
  - `add_metadata(selected_objects, metadata)` -> `None` [classmethod] — Adds metadata to selected objects that implement the UInterface_AssetUserData interface.
  - `add_tags(selected_objects, tags)` -> `None` [classmethod] — Add tags to a set of actors
  - `add_to_layer(selected_objects, layer_name)` -> `None` [classmethod] — Add all Actors to a given layer. note: This operation only applies on assets
  - `consolidate_objects(selected_objects)` -> `None` [classmethod] — Replace all references to the assets in the array, except the first, with the first asset of the array.
  - `flip_faces(static_meshes)` -> `None` [classmethod] — Flip the faces of all elements of a set of Static Meshes or Static Mesh Actors
  - `randomize_transform(selected_objects, transform_type, reference_frame, min, max)` -> `None` [classmethod] — Alters transform of selected objects by appling randomly generated offset to one of the transform components (rotation, ...
  - `resize_textures(textures, max_size)` -> `None` [classmethod] — Resize textures to max width/height and optionally ensure power of two size. note: This operation only applies on assets
  - `set_collision_complexity(selected_objects, collision_trace_flag)` -> `Array [ Object ]` [classmethod] — Set collision complexity for selected meshes
  - `set_convex_decomposition_collision(selected_objects, hull_count, max_hull_verts, hull_precision)` -> `Array [ Object ]` [classmethod] — Add complex collision on the static meshes contained in the input array by the actors contained in the input array remar...
  - `set_lod_group()` [classmethod] — Remove inputs content remark:: Static meshes are not re-built after the new LOD groups are set
  - `set_lods(selected_objects, reduction_options)` -> `Array [ Object ]` [classmethod] — Generate LODs on the static meshes contained in the input array by the actors contained in the input array remark:: Stat...
  - `set_material(selected_objects, material_substitute)` -> `None` [classmethod] — Set the material to all elements of a set of Static Meshes or Static Mesh Actors
  - `set_mesh(selected_objects, mesh_substitute)` -> `None` [classmethod] — Set the mesh to all elements of a set of Actors containing StaticMeshComponents
  - `set_mobility(selected_objects, mobility_type)` -> `None` [classmethod] — Set mobility on a set of static mesh actors remark:: Only objects of class AStaticMeshActor will be considered
  - `set_nanite_settings(selected_objects, enabled, position_precision, percent_triangles)` -> `Array [ Object ]` [classmethod] — Set Nanite settings for selected meshes
  - `set_simple_collision(selected_objects, shape_type)` -> `Array [ Object ]` [classmethod] — Set one simple collision of the given shape type on the static meshes contained in the input array or referred to by the...
  - `set_sub_ouput_folder(selected_objects, sub_folder_name)` -> `None` [classmethod] — Add/Edit UDataprepConsumerUserData with the requested name for the sub-folder note: This operation only applies on asset...
  - `set_sub_ouput_level(selected_objects, sub_level_name)` -> `None` [classmethod] — Add/Edit UDataprepConsumerUserData with the requested name for the sub-level note: This operation only applies on actors
  - `substitute_material(selected_objects, material_search, string_match, material_substitute)` -> `None` [classmethod] — Replaces designated materials in all or specific content folders with specific ones remark:: A material override will be...
  - `substitute_materials_by_table(selected_objects, data_table)` -> `None` [classmethod] — Replaces designated materials in all or specific content folders with requested ones remark:: SubstituteMaterial is call...
  - `substitute_mesh(selected_objects, mesh_search, string_match, mesh_substitute)` -> `None` [classmethod] — Replaces designated meshes in all or specific content folders with specific ones

### `unreal.DataprepOwningActorSelectionTransform`
Inherits: `DataprepSelectionTransform` | Header: `DataprepSelectionTransforms.h`

Return the owning actors of selected components

### `unreal.DataprepRandomizeTransformOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

For each actor in the input set, offset its position/rotation/scale with random vector generated from X/Y/Z Min-Max.

### `unreal.DataprepReferencedSelectionTransform`
Inherits: `DataprepSelectionTransform` | Header: `DataprepSelectionTransforms.h`

Return assets directly using/referencing the objects from previous filtering

### `unreal.DataprepReferenceSelectionTransform`
Inherits: `DataprepSelectionTransform` | Header: `DataprepSelectionTransforms.h`

Return assets directly used/referenced by the selected objects.

### `unreal.DataprepSetCollisionComplexityOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

For each static mesh to process, set its collision complexity

**Properties** (1):
  - `collision_trace_flag`: `CollisionTraceFlag` — [Read-Write] Collision complexity (CollisionTraceFlag)

### `unreal.DataprepSetConvexDecompositionCollisionOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

For each static mesh to process, replace the existing static meshâs collision setup with a convex decomposition one computed using the Hull settings

**Properties** (3):
  - `hull_count`: `int` — [Read-Write] Maximum number of convex pieces that will be created (int32)
  - `hull_precision`: `int` — [Read-Write] Number of voxels to use when generating collision (int32)
  - `max_hull_verts`: `int` — [Read-Write] Maximum number of vertices allowed for any generated convex hulls (int32)

### `unreal.DataprepSetLODGroupOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

For each static mesh to process, replace the existing static meshâs LODs with new ones based on selected group

### `unreal.DataprepSetLODsOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

For each static mesh to process, replace the existing static meshâs LODs with new ones based on the set of reduction settings

**Properties** (2):
  - `auto_compute_lod_screen_size`: `bool` — [Read-Write] If true, the screen sizes at which LODs swap are automatically computed (bool)
  - `reduction_settings`: `None` — [Read-Write] Array of LOD reduction settings (Array[DataprepSetLODsReductionSettings])

### `unreal.DataprepSetMaterialOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

On each static mesh or actor to process, replace any materials used with the specified one

**Properties** (2):
  - `material`: `MaterialInterface` — [Read-Write] Material to use as a substitute (MaterialInterface)
  - `material_substitute`: `MaterialInterface` — âmaterial_substituteâ was renamed to âmaterialâ. deprecated

### `unreal.DataprepSetMaxTextureSizeOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

Set max size (width or height) each input texture

**Properties** (2):
  - `allow_padding`: `bool` — [Read-Write] If true, original texture size will be enforced to power of two before resizing (if itâ...
  - `max_texture_size`: `int` — [Read-Write] (int32)

### `unreal.DataprepSetMeshOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

On each actor to process, replace any meshes used with the specified one

**Properties** (2):
  - `mesh_substitute`: `StaticMesh` — âmesh_substituteâ was renamed to âstatic_meshâ. deprecated
  - `static_mesh`: `StaticMesh` — [Read-Write] Mesh to use as a substitute (StaticMesh)

### `unreal.DataprepSetMetadataOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

On each actor to process set metadata value

### `unreal.DataprepSetMobilityOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

For each actor to process, update its mobilty with the selected value

**Properties** (1):
  - `mobility_type`: `ComponentMobility` — [Read-Write] Type of mobility to set on actors (ComponentMobility)

### `unreal.DataprepSetNaniteSettingsOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

For each static mesh to process, enables/disables Nanite build and if enabled update settings.

**Properties** (3):
  - `nanite_enabled`: `bool` — [Read-Write] If checked, Nanite data will be generated (bool)
  - `percent_triangles`: `float` — [Read-Write] Percentage of triangles to keep from LOD0. 100.0 = no reduction, 0.0 = no triangles (fl...
  - `position_precision`: `int` — [Read-Write] Step size is 2^(-PositionPrecision) cm. MIN_int32 is auto (int32)

### `unreal.DataprepSetOutputFolder`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

For each asset to process, set the sub-folder to save it to. The sub-folder is relative to the folder specified to the Dataprep consumer.

**Properties** (1):
  - `folder_name`: `str` — [Read-Write] Name of the sub folder the assets to be saved to (str)

### `unreal.DataprepSetSimpleCollisionOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

For each static mesh to process, replace the existing static meshâs collision setup with a simple one based on selected shape

**Properties** (1):
  - `shape_type`: `ScriptCollisionShapeType` — [Read-Write] Shapeâs of the collision geometry encompassing the static mesh (ScriptCollisionShapeT...

### `unreal.DataprepSpawnActorsAtLocation`
Inherits: `DataprepEditingOperation` | Header: `DataprepEditingOperations.h`

For each actor in the input set, spawn an actor from the specified Asset at the same position and orientation than the reference

**Properties** (1):
  - `selected_asset`: `Object` — [Read-Write] (Object)

### `unreal.DataprepStringActorLabelFetcher`
Inherits: `DataprepStringFetcher` | Header: `DataprepStringFetcherLibrary.h`

Filter actors based on their label.

### `unreal.DataprepStringActorLayersFetcher`
Inherits: `DataprepStringsArrayFetcher` | Header: `DataprepStringsArrayFetcherLibrary.h`

Filter actors based on their layers.

### `unreal.DataprepStringActorTagsFetcher`
Inherits: `DataprepStringsArrayFetcher` | Header: `DataprepStringsArrayFetcherLibrary.h`

Filter actors based on the key values of their tags.

### `unreal.DataprepStringObjectNameFetcher`
Inherits: `DataprepStringFetcher` | Header: `DataprepStringFetcherLibrary.h`

Filter objects based on their names.

### `unreal.DataprepSubstituteMaterialByTableOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

On each static mesh or actor to process, replace the material found in the first column of the table with the one from the second column in the same row

**Properties** (1):
  - `material_data_table`: `DataTable` — [Read-Write] Data table to use for the substitution (DataTable)

### `unreal.DataprepSubstituteMaterialOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperations.h`

On each static mesh or actor to process, replace the material matching the criteria with the specified one

**Properties** (3):
  - `material_search`: `str` — [Read-Write] Name of the material(s) to search for. Wildcard is supported (str)
  - `material_substitute`: `MaterialInterface` — [Read-Write] Material to use as a substitute (MaterialInterface)
  - `string_match`: `EditorScriptingStringMatchType` — [Read-Write] Type of matching to perform with MaterialSearch string (EditorScriptingStringMatchType)

### `unreal.DataprepTriangleCountFetcher`
Inherits: `DataprepIntegerFetcher` | Header: `DataprepIntegerFetcherLibrary.h`

Filter objects based on their triangle count.

### `unreal.DataprepVertexCountFetcher`
Inherits: `DataprepIntegerFetcher` | Header: `DataprepIntegerFetcherLibrary.h`

Filter objects based on their vertex count.

### `unreal.DataprepHierarchySelectionPolicy`
Inherits: `EnumBase` | Header: `DataprepSelectionTransforms.h`

EDataprep Hierarchy Selection Policy

**Properties** (2):
  - `ALL_DESCENDANTS`: `DataprepHierarchySelectionPolicy = Ellipsis` — Select all descendants of the selected objects 1
  - `IMMEDIATE_CHILDREN`: `DataprepHierarchySelectionPolicy = Ellipsis` — Select immediate children of the selected objects 0

### `unreal.DataprepSizeFilterMode`
Inherits: `EnumBase` | Header: `DataprepFilterLibrary.h`

EDataprep Size Filter Mode

**Properties** (2):
  - `BIGGER_THAN`: `DataprepSizeFilterMode = Ellipsis` — 1
  - `SMALLER_THAN`: `DataprepSizeFilterMode = Ellipsis` — 0

### `unreal.DataprepSizeSource`
Inherits: `EnumBase` | Header: `DataprepFilterLibrary.h`

EDataprep Size Source

**Properties** (1):
  - `BOUNDING_BOX_VOLUME`: `DataprepSizeSource = Ellipsis` — 0

### `unreal.RandomizeTransformReferenceFrame`
Inherits: `EnumBase` | Header: `DataprepOperationsLibrary.h`

ERandomize Transform Reference Frame

**Properties** (2):
  - `RELATIVE`: `RandomizeTransformReferenceFrame = Ellipsis` — 1
  - `WORLD`: `RandomizeTransformReferenceFrame = Ellipsis` — 0

### `unreal.RandomizeTransformType`
Inherits: `EnumBase` | Header: `DataprepOperationsLibrary.h`

ERandomize Transform Type

**Properties** (3):
  - `LOCATION`: `RandomizeTransformType = Ellipsis` — 1
  - `ROTATION`: `RandomizeTransformType = Ellipsis` — 0
  - `SCALE`: `RandomizeTransformType = Ellipsis` — 2
