# UE Python API — InterchangePipelines Module

**22 types** from the `InterchangePipelines` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `InterchangeLodSceneNodeContainer`, `InterchangeMeshGeometry`, `InterchangeMeshInstance`, `InterchangePipelineMeshesUtilitiesContext`, `InterchangeGenericAnimationPipeline`, `InterchangeGenericAssetsPipeline`, `InterchangeGenericCommonMeshesProperties`, `InterchangeGenericCommonSkeletalMeshesAndAnimationsProperties`, `InterchangeGenericLevelPipeline`, `InterchangeGenericMaterialPipeline`, `InterchangeGenericMeshPipeline`, `InterchangeGenericTexturePipeline`, `InterchangeGLTFPipeline`, `InterchangeMaterialXPipeline`, `InterchangePipelineMeshesUtilities`, `InterchangeSparseVolumeTexturePipeline`, `InterchangeAnimationRange`, `InterchangeForceMeshType`, `InterchangeMaterialImportOption`, `InterchangeMaterialSearchLocation`, ... (22 total)

---

## Classes

### `unreal.InterchangeLodSceneNodeContainer`
Inherits: `StructBase` | Header: `InterchangePipelineMeshesUtilities.h`

This container exists only because UPROPERTY cannot support nested container. See FInterchangeMeshInstance.

### `unreal.InterchangeMeshGeometry`
Inherits: `StructBase` | Header: `InterchangePipelineMeshesUtilities.h`

A mesh geometry is a description of a translated mesh asset node that defines a geometry.

### `unreal.InterchangeMeshInstance`
Inherits: `StructBase` | Header: `InterchangePipelineMeshesUtilities.h`

A mesh instance is a description of a translated scene node that points to a translated mesh asset. A mesh instance that points to an LOD group can have many LODs and many scene mesh nodes per LOD ind...

### `unreal.InterchangePipelineMeshesUtilitiesContext`
Inherits: `StructBase` | Header: `InterchangePipelineMeshesUtilities.h`

Represents the context UInterchangePipelineMeshesUtilities will use when the client queries data.

**Properties** (7):
  - `convert_skeletal_mesh_to_static_mesh`: `bool` — [Read-Write] If enabled, all skeletal meshes are converted to static meshes. (bool)
  - `convert_static_mesh_to_skeletal_mesh`: `bool` — [Read-Write] If enabled, all static meshes are converted to skeletal meshes. (bool)
  - `convert_statics_with_morph_targets_to_skeletals`: `bool` — [Read-Write] If enabled, all static meshes that have morph targets will be imported as skeletal mesh...
  - `ignore_geometry_caches`: `bool` — [Read-Write] If enabled, all geometry caches will be ignored. The mesh utility will not return any g...
  - `ignore_static_meshes`: `bool` — [Read-Write] If enabled, all static meshes will be ignored. The mesh utility will not return any sta...
  - `import_meshes_in_bone_hierarchy`: `bool` — [Read-Write] If enabled, meshes nested in bone hierarchies are imported as meshes instead of being c...
  - `query_geometry_only_if_no_instance`: `bool` — [Read-Write] When querying geometry, this flag will not add MeshGeometry if there is a scene node th...

### `unreal.InterchangeGenericAnimationPipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeGenericAnimationPipeline.h`

Interchange Generic Animation Pipeline

**Properties** (15):
  - `animation_range`: `InterchangeAnimationRange` — the range defined at export, the range of frames with animation, or a manually defined range. (Inter...
  - `custom_bone_animation_sample_rate`: `int` — [Read-Write] Sample fbx animation data at the specified sample rate, 0 find automaticaly the best sa...
  - `delete_existing_custom_attribute_curves`: `bool` — [Read-Write] If enabled, all previous node attributes imported as Animation Curves will be deleted w...
  - `delete_existing_morph_target_curves`: `bool` — [Read-Write] If enabled, all previous morph target curves will be deleted when doing a reimport. (bo...
  - `delete_existing_non_curve_custom_attributes`: `bool` — [Read-Write] If enabled, all previous node attributes imported as Animation Attributes will be delet...
  - `do_not_import_curve_with_zero`: `bool` — [Read-Write] When importing a custom attribute or morph target as a curve, only import if it has a v...
  - `frame_import_range`: `Int32Interval` — [Read-Write] The frame range used when the Animation Length setting is set to Set Range. (Int32Inter...
  - `import_animations`: `bool` — [Read-Write] If enabled, import all animation assets found in the source. (bool)
  - `import_bone_tracks`: `bool` — [Read-Write] Import bone transform tracks. If false, this will discard any bone transform tracks. (b...
  - `import_custom_attribute`: `bool` — [Read-Write] If enabled, import node attributes as either Animation Curves or Animation Attributes. ...
  - `material_curve_suffixes`: `None` — [Read-Write] Set the Material Curve Type for custom attributes that have the specified suffixes. Thi...
  - `remove_curve_redundant_keys`: `bool` — [Read-Write] When importing custom attributes as curves, remove redundant keys. (bool)
  - `set_material_drive_parameter_on_custom_attribute`: `bool` — [Read-Write] Set the material curve type for all custom attributes. (bool)
  - `snap_to_closest_frame_boundary`: `bool` — [Read-Write] If enabled, snaps the animation to the closest frame boundary using the import sampling...
  - `use30_hz_to_bake_bone_animation`: `bool` — [Read-Write] If enabled, samples all animation curves to 30 FPS (bool)

### `unreal.InterchangeGenericAssetsPipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeGenericAssetsPipeline.h`

This pipeline is the generic option for all types of meshes. It should be called before specialized mesh pipelines like the generic static mesh or skeletal mesh pipelines. All import options that are ...

**Properties** (14):
  - `animation_pipeline`: `InterchangeGenericAnimationPipeline` [Read-Only] — [Read-Only] ANIMATIONS_CATEGORY Properties (InterchangeGenericAnimationPipeline)
  - `asset_name`: `str` — [Read-Write] If set, and there is only one asset and one source, the imported asset is given this na...
  - `asset_type_sub_folders`: `bool` — [Read-Write] Group the assets according to their type into additional Content folders created on the...
  - `common_meshes_properties`: `InterchangeGenericCommonMeshesProperties` [Read-Only] — [Read-Only] COMMON_MESHES_CATEGORY Properties (InterchangeGenericCommonMeshesProperties)
  - `common_skeletal_meshes_and_animations_properties`: `InterchangeGenericCommonSkeletalMeshesAndAnimationsProperties` [Read-Only] — [Read-Only] COMMON_SKELETAL_ANIMATIONS_CATEGORY (InterchangeGenericCommonSkeletalMeshesAndAnimations...
  - `import_offset_rotation`: `Rotator` — [Read-Write] Rotation offset applied to meshes and animations. (Rotator)
  - `import_offset_translation`: `Vector` — [Read-Write] Translation offset applied to meshes and animations. (Vector)
  - `import_offset_uniform_scale`: `float` — [Read-Write] Uniform scale offset applied to meshes and animations. (float)
  - `material_pipeline`: `InterchangeGenericMaterialPipeline` [Read-Only] — [Read-Only] MATERIALS_CATEGORY Properties (InterchangeGenericMaterialPipeline)
  - `mesh_pipeline`: `InterchangeGenericMeshPipeline` [Read-Only] — [Read-Only] MESHES_CATEGORY Properties (InterchangeGenericMeshPipeline)
  - `pipeline_display_name`: `str` — [Read-Write] The name of the pipeline that will be display in the import dialog. (str)
  - `reimport_strategy`: `ReimportStrategyFlags` — [Read-Write] Set the reimport strategy. (ReimportStrategyFlags)
  - `scene_name_sub_folder`: `bool` — [Read-Write] Create an additional Content folder inside of the chosen import directory, and name it ...
  - `use_source_name_for_asset`: `bool` — [Read-Write] If enabled, and the Asset Name setting is empty, and there is only one asset and one so...

### `unreal.InterchangeGenericCommonMeshesProperties`
Inherits: `InterchangePipelineBase` | Header: `InterchangeGenericAssetsPipelineSharedSettings.h`

Interchange Generic Common Meshes Properties

**Properties** (17):
  - `auto_detect_mesh_type`: `bool` — [Read-Write] If enabled, and some static mesh transforms are animated, the pipeline will convert the...
  - `bake_meshes`: `bool` — [Read-Write] If enabled, meshes are baked with the scene instance hierarchy transform. (bool)
  - `bake_pivot_meshes`: `bool` — [Read-Write] If enabled, the inverse node rotation pivot will be apply to the mesh vertices. The piv...
  - `compute_weighted_normals`: `bool` — [Read-Write] If enabled, normals are computed using the surface area and the corner angle of the tri...
  - `force_all_mesh_as_type`: `InterchangeForceMeshType` — [Read-Write] If set, imports all meshes in the source as either static meshes or skeletal meshes.
Fo...
  - `import_lods`: `bool` — [Read-Write] If enabled, any existing LODs for meshes are imported. This setting is only used if the...
  - `import_sockets`: `bool` — [Read-Write] If checked, import sockets
StaticMesh, naming convention, SOCKET_MeshName_xx where âM...
  - `keep_sections_separate`: `bool` — [Read-Write] If checked, sections with matching materials are kept separate and will not get combine...
  - `recompute_normals`: `bool` — [Read-Write] If enabled, normals in the imported mesh are ignored and recomputed. (bool)
  - `recompute_tangents`: `bool` — [Read-Write] If enabled, tangents in the imported mesh are ignored and recomputed. (bool)
  - `remove_degenerates`: `bool` — [Read-Write] If true, degenerate triangles are removed. (bool)
  - `use_backwards_compatible_f16_trunc_u_vs`: `bool` — [Read-Write] If enabled, UVs are converted to 16-bit by a legacy truncation process instead of the d...
  - `use_full_precision_u_vs`: `bool` — [Read-Write] If true, UVs are stored at full floating-point precision. (bool)
  - `use_high_precision_tangent_basis`: `bool` — [Read-Write] If true, tangents are stored at 16-bit vs 8-bit precision. (bool)
  - `use_mikk_t_space`: `bool` — [Read-Write] If enabled, tangents are recomputed using MikkTSpace. (bool)
  - `vertex_color_import_option`: `InterchangeVertexColorImportOption` — [Read-Write] Specify how vertex colors should be imported. (InterchangeVertexColorImportOption)
  - `vertex_override_color`: `Color` — [Read-Write] Specify an override color for use when the Vertex Color Import Option setting is set to...

### `unreal.InterchangeGenericCommonSkeletalMeshesAndAnimationsProperties`
Inherits: `InterchangePipelineBase` | Header: `InterchangeGenericAssetsPipelineSharedSettings.h`

Interchange Generic Common Skeletal Meshes and Animations Properties

**Properties** (6):
  - `add_curve_metadata_to_skeleton`: `bool` — [Read-Write] Determines whether to automatically add curve metadata to a skeleton. If this setting i...
  - `convert_statics_with_morph_targets_to_skeletals`: `bool` — [Read-Write] If enabled, all static meshes that have morph targets will be imported as skeletal mesh...
  - `import_meshes_in_bone_hierarchy`: `bool` — [Read-Write] If enabled, meshes nested in bone hierarchies will be imported as meshes instead of bei...
  - `import_only_animations`: `bool` — [Read-Write] If enabled, only animations are imported from the source. You must also set a valid ske...
  - `skeleton`: `Skeleton` — [Read-Write] Skeleton to use for imported asset. When importing a skeletal mesh, leaving this as â...
  - `use_t0_as_ref_pose`: `bool` — [Read-Write] If enabled, skinned meshes will be rebind using the joints transform pose at frame 0 in...

### `unreal.InterchangeGenericLevelPipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeGenericScenesPipeline.h`

Interchange Generic Level Pipeline

**Properties** (8):
  - `delete_missing_actors`: `bool` — [Read-Write] If enabled, deletes actors that were not part of the translation when reimporting into ...
  - `delete_missing_assets`: `bool` — [Read-Write] If enabled, deletes assets that were not part of the translation when reimporting into ...
  - `force_reimport_deleted_actors`: `bool` — [Read-Write] If enabled, respawns actors that were deleted in the editor prior to a reimport. (bool)
  - `force_reimport_deleted_assets`: `bool` — [Read-Write] If enabled, recreates assets that were deleted in the editor prior to reimporting into ...
  - `pipeline_display_name`: `str` — [Read-Write] The name of the pipeline that will be display in the import dialog. (str)
  - `reimport_property_strategy`: `ReimportStrategyFlags` — [Read-Write] Set the reimport strategy when reimporting into the level. (ReimportStrategyFlags)
  - `scene_hierarchy_type`: `InterchangeSceneHierarchyType` — [Read-Write] Choose how you want to import the hierarchy. (InterchangeSceneHierarchyType)
  - `use_physical_instead_of_standard_perspective_camera`: `bool` — [Read-Write] Disable this option to not convert Standard(Perspective) to Physical Cameras (bool)

### `unreal.InterchangeGenericMaterialPipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeGenericMaterialPipeline.h`

Interchange Generic Material Pipeline

**Properties** (10):
  - `asset_name`: `str` — [Read-Write] If set, and there is only one asset and one source, the imported asset will be given th...
  - `create_material_instance_for_parent`: `bool` — [Read-Write] If set, additional material instances are created for reference/parent materials. (bool...
  - `identify_duplicate_materials`: `bool` — [Read-Write] If set, reference materials along with respective material instances are created. (bool...
  - `import_materials`: `bool` — [Read-Write] If enabled, imports the material assets found in the sources. (bool)
  - `material_import`: `InterchangeMaterialImportOption` — [Read-Write] Determines what kind of material assets should be created for the imported materials. (...
  - `parent_material`: `SoftObjectPath` — [Read-Write] Optional material used as the parent when importing materials as instances. If no paren...
  - `pipeline_display_name`: `str` — [Read-Write] The name of the pipeline that will be display in the import dialog. (str)
  - `search_location`: `InterchangeMaterialSearchLocation` — [Read-Write] Specify where we should search for existing materials when importing. (InterchangeMater...
  - `sparse_volume_texture_pipeline`: `InterchangeSparseVolumeTexturePipeline` [Read-Only] — [Read-Only] (InterchangeSparseVolumeTexturePipeline)
  - `texture_pipeline`: `InterchangeGenericTexturePipeline` [Read-Only] — [Read-Only] (InterchangeGenericTexturePipeline)

### `unreal.InterchangeGenericMeshPipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeGenericMeshPipeline.h`

Hide drop down will make sure the class is not showing in the class picker

**Properties** (48):
  - `apply_constant_topology_optimizations`: `bool` — [Read-Write] Force the preprocessor to only do optimization once instead of when the preprocessor de...
  - `auto_compute_lod_screen_sizes`: `bool` — [Read-Write] If enabled, LOD Screen Sizes would be auto-computed. (bool)
  - `bone_influence_limit`: `int` — [Read-Write] The maximum number of bone influences to allow each vertex in this mesh to use.
If set ...
  - `build_nanite`: `bool` — [Read-Write] If enabled, imported meshes will be rendered by Nanite at runtime. Make sure your meshe...
  - `build_reversed_index_buffer`: `bool` — [Read-Write] If enabled, builds a reversed index buffer for each static mesh. (bool)
  - `build_scale3d`: `Vector` — [Read-Write] The local scale applied when building the mesh. (Vector)
  - `collision`: `bool` — [Read-Write] If enabled, custom collision will be imported. If enabled and there is no custom collis...
  - `combine_skeletal_meshes`: `bool` — [Read-Write] (bool)
  - `combine_static_meshes`: `bool` — [Read-Write] If enabled, all translated static mesh nodes will be imported as a single static mesh. ...
  - `compressed_position_precision`: `float` — [Read-Write] Precision used for compressing vertex positions (lower = better result but less compres...
  - `compressed_texture_coordinates_number_of_bits`: `int` — [Read-Write] Bit-precision used for compressing texture coordinates (hight = better result but less ...
  - `create_physics_asset`: `bool` — [Read-Write] If enabled, create new PhysicsAsset if one doesnât exist. (bool)
  - `distance_field_replacement_mesh`: `StaticMesh` — [Read-Write] If set, replaces the distance field for all imported meshes with the distance field of ...
  - `distance_field_resolution_scale`: `float` — [Read-Write] Scale to apply to the mesh when allocating the distance field volume texture.
The defau...
  - `dst_lightmap_index`: `int` — [Read-Write] Specifies the index of the UV channel that will store generated lightmap UVs. (int32)
  - `fallback_collision_type`: `InterchangeMeshCollision` — [Read-Write] Type used to generate a collision when no custom collisions are present in the file. (I...
  - `flatten_tracks`: `bool` — [Read-Write] Whether or not to merge all vertex animation into one track (bool)
  - `frame_end`: `int` — [Read-Write] (int32)
  - `frame_start`: `int` — [Read-Write] (int32)
  - `generate_distance_field_as_if_two_sided`: `bool` — [Read-Write] Determines whether to generate the distance field treating every triangle hit as a fron...
  - `generate_lightmap_u_vs`: `bool` — [Read-Write] If enabled, generates lightmap UVs for each static mesh. (bool)
  - `import_collision`: `bool` — [Read-Write]
deprecated: Use Collision instead. (bool)
  - `import_collision_according_to_mesh_name`: `bool` — [Read-Write] If enabled, meshes with certain prefixes will be imported as collision primitives for t...
  - `import_geometry_caches`: `bool` — [Read-Write] If enabled, imports all geometry cache assets found in the sources. (bool)
  - `import_morph_targets`: `bool` — [Read-Write] If enabled, imports all morph target shapes found in the source. (bool)
  - `import_skeletal_meshes`: `bool` — [Read-Write] If enabled, imports all skeletal mesh assets found in the sources. (bool)
  - `import_static_meshes`: `bool` — [Read-Write] If enabled, imports all static mesh assets found in the sources. (bool)
  - `import_vertex_attributes`: `bool` — [Read-Write] If enabled, creates named vertex attributes for secondary vertex color data. (bool)
  - `lod_group`: `Name` — [Read-Write] The LOD group that will be assigned to this mesh. (Name)
  - `lod_screen_sizes`: `None` — [Read-Write] This setting is only used if the Auto Compute LOD Screen Sizes setting is disabled. (Ar...
  - `max_lumen_mesh_cards`: `int` — [Read-Write] The maximum number of Lumen mesh cards to generate for this mesh.
More cards means that...
  - `merge_morph_targets_with_same_name`: `bool` — [Read-Write] If enabled, all morph target shapes with the same name will be merge together. Turn it ...
  - `min_lightmap_resolution`: `int` — [Read-Write] When generating lightmaps, determines the amount of padding used to pack UVs. Set this ...
  - `morph_threshold_position`: `float` — [Read-Write] Threshold to compare vertex position equality when computing morph target deltas. (floa...
  - `motion_vectors`: `InterchangeMotionVectorsHandling` — [Read-Write] (InterchangeMotionVectorsHandling)
  - `one_convex_hull_per_ucx`: `bool` — [Read-Write] If enabled, each UCX collision mesh will be imported as a single convex hull. If disabl...
  - `optimize_index_buffers`: `bool` — [Read-Write] Optimizes index buffers for each unique frame, to allow better cache coherency on the G...
  - `override_time_range`: `bool` — [Read-Write] If enabled, override the imported animation range. Otherwise, the imported range is aut...
  - `physics_asset`: `PhysicsAsset` — [Read-Write] If set, use the specified PhysicsAsset. If not set and the Create Physics Asset setting...
  - `skeletal_mesh_import_content_type`: `InterchangeSkeletalMeshContentType` — [Read-Write] Determines what types of information are imported for skeletal meshes. (InterchangeSkel...
  - `src_lightmap_index`: `int` — [Read-Write] Specifies the index of the UV channel that will be used as the source when generating l...
  - `store_imported_vertex_numbers`: `bool` — [Read-Write] Store the imported vertex numbers. This lets you know the vertex numbers inside the DCC...
  - `support_face_remap`: `bool` — [Read-Write] If enabled, imported static meshes are set up for use with physical material masks. (bo...
  - `threshold_position`: `float` — [Read-Write] Threshold value that is used to decide whether two vertex positions are equal. (float)
  - `threshold_tangent_normal`: `float` — [Read-Write] Threshold value that is used to decide whether two normals, tangents, or bi-normals are...
  - `threshold_uv`: `float` — [Read-Write] Threshold value that is used to decide whether two UVs are equal. (float)
  - `update_skeleton_reference_pose`: `bool` — [Read-Write] Enable this option to update the reference pose of the Skeleton (of the mesh). The refe...
  - `use_high_precision_skin_weights`: `bool` — [Read-Write] If enabled, imported skin weights use 16 bits instead of 8 bits. (bool)

### `unreal.InterchangeGenericTexturePipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeGenericTexturePipeline.h`

Interchange Generic Texture Pipeline

**Properties** (9):
  - `allow_non_power_of_two`: `bool` — [Read-Write] If enabled, textures that have a non-power-of-two resolution are imported. (bool)
  - `asset_name`: `str` — [Read-Write] If set, and there is only one asset and one source, the imported asset will be given th...
  - `detect_normal_map_texture`: `bool` — [Read-Write] If enabled, tests each newly imported texture to see if it is a normal map.
If it is, t...
  - `file_extensions_to_import_as_long_lat_cubemap`: `None` — [Read-Write] Specify the file types that should be imported as long/lat cubemaps. (Set[str])
  - `flip_normal_map_green_channel`: `bool` — [Read-Write] If enabled, the textureâs green channel will be inverted for normal maps. This settin...
  - `import_textures`: `bool` — [Read-Write] If enabled, imports all texture assets found in the source. (bool)
  - `import_udi_ms`: `bool` — [Read-Write] If enabled, imports textures as UDIMs if they are named using a UDIM naming pattern. (b...
  - `pipeline_display_name`: `str` — [Read-Write] The name of the pipeline that will be display in the import dialog. (str)
  - `prefer_compressed_source_data`: `bool` — [Read-Write] If enabled, the translator compresses the source data payload whenever possible. This g...

### `unreal.InterchangeGLTFPipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeglTFPipeline.h`

Interchange GLTFPipeline

**Properties** (1):
  - `pipeline_display_name`: `str` — [Read-Write] The name of the pipeline that will be display in the import dialog. (str)

### `unreal.InterchangeMaterialXPipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeMaterialXPipeline.h`

Interchange Material XPipeline

### `unreal.InterchangePipelineMeshesUtilities`
Inherits: `Object` | Header: `InterchangePipelineMeshesUtilities.h`

Interchange Pipeline Meshes Utilities

**Methods** (18):
  - `create_interchange_pipeline_meshes_utilities(base_node_container)` -> `InterchangePipelineMeshesUtilities` [classmethod] — Create an instance of UInterchangePipelineMeshesUtilities.
  - `get_all_geometry_cache_geometry()` -> `Array [ str ]` — Get the unique IDs of all geometry cache geometry.
  - `get_all_geometry_cache_instance()` -> `Array [ str ]` — Get the unique IDs of all geometry cache instances.
  - `get_all_mesh_geometry()` -> `Array [ str ]` — Get the unique IDs of all mesh geometry.
  - `get_all_mesh_geometry_not_instanced()` -> `Array [ str ]` — Get the unique IDs of all non-instanced mesh geometry.
  - `get_all_mesh_instance_uids()` -> `Array [ str ]` — Get the unique IDs of all mesh instances.
  - `get_all_mesh_instance_uids_using_mesh_geometry_uid(mesh_geometry_uid)` -> `Array [ str ]` — Get all instanced mesh UIDs that use the mesh geometry unique ID.
  - `get_all_skinned_mesh_geometry()` -> `Array [ str ]` — Get the unique IDs of all skinned mesh geometry.
  - `get_all_skinned_mesh_instance()` -> `Array [ str ]` — Get the unique IDs of all skinned mesh instances.
  - `get_all_static_mesh_geometry()` -> `Array [ str ]` — Get the unique IDs of all static mesh geometry.
  - `get_all_static_mesh_instance()` -> `Array [ str ]` — Get the unique IDs of all static mesh instances.
  - `get_mesh_geometry_by_uid(mesh_geometry_uid)` -> `InterchangeMeshGeometry` — Get the geometry mesh from the unique ID.
  - `get_mesh_geometry_skeleton_root_uid(mesh_geometry_uid)` -> `str` — Return the skeleton root node UID. This is the UID for a UInterchangeSceneNode that has a âJointâ specialized type. ...
  - `get_mesh_instance_by_uid(mesh_instance_uid)` -> `InterchangeMeshInstance` — Get the instanced mesh from the unique ID.
  - `get_mesh_instance_skeleton_root_uid(mesh_instance_uid)` -> `str` — Return the skeleton root node UID. This is the UID for a UInterchangeSceneNode that has a âJointâ specialized type. ...
  - `is_valid_mesh_geometry_uid(mesh_geometry_uid)` -> `bool` — Return true if there is an existing FInterchangeMeshGeometry that matches the MeshInstanceUid key.
  - `is_valid_mesh_instance_uid(mesh_instance_uid)` -> `bool` — Return true if there is an existing FInterchangeMeshInstance that matches the MeshInstanceUid key.
  - `set_context(context)` -> `None` — Set Context

### `unreal.InterchangeSparseVolumeTexturePipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeSparseVolumeTexturePipeline.h`

Interchange Sparse Volume Texture Pipeline

**Properties** (4):
  - `asset_name`: `str` — [Read-Write] If set, and there is only one asset and one source, the imported asset will be given th...
  - `import_animated_sparse_volume_textures`: `bool` — [Read-Write] If enabled, will attempt to import volume nodes corresponding to numbered files in the ...
  - `import_sparse_volume_textures`: `bool` — [Read-Write] If enabled, imports all sparse volume texture assets found in the source. (bool)
  - `pipeline_display_name`: `str` — [Read-Write] (str)

### `unreal.InterchangeAnimationRange`
Inherits: `EnumBase` | Header: `InterchangeGenericAnimationPipeline.h`

Animation length type when importing.

**Properties** (3):
  - `ANIMATED`: `InterchangeAnimationRange = Ellipsis` — This option imports the range of frames that have animation. 1
  - `SET_RANGE`: `InterchangeAnimationRange = Ellipsis` — This option imports the range of frames specified by âFrameImportRangeâ. 2
  - `TIMELINE`: `InterchangeAnimationRange = Ellipsis` — This option imports the range of frames based on timeline definition in the source. 0

### `unreal.InterchangeForceMeshType`
Inherits: `EnumBase` | Header: `InterchangeGenericAssetsPipelineSharedSettings.h`

Enumerates the options for importing all meshes as one type.

**Properties** (3):
  - `IFMT_NONE`: `InterchangeForceMeshType = Ellipsis` — Import both static meshes and skeletal meshes from the source without converting them. 0
  - `IFMT_SKELETAL_MESH`: `InterchangeForceMeshType = Ellipsis` — Import all meshes from the source as skeletal meshes. 2
  - `IFMT_STATIC_MESH`: `InterchangeForceMeshType = Ellipsis` — Import all meshes from the source as static meshes. 1

### `unreal.InterchangeMaterialImportOption`
Inherits: `EnumBase` | Header: `InterchangeGenericMaterialPipeline.h`

EInterchange Material Import Option

**Properties** (2):
  - `IMPORT_AS_MATERIALS`: `InterchangeMaterialImportOption = Ellipsis` — Import all materials from the source as material assets. 0
  - `IMPORT_AS_MATERIAL_INSTANCES`: `InterchangeMaterialImportOption = Ellipsis` — Import all materials from the source as material instance assets. 1

### `unreal.InterchangeMaterialSearchLocation`
Inherits: `EnumBase` | Header: `InterchangeGenericMaterialPipeline.h`

EInterchange Material Search Location

**Properties** (5):
  - `ALL_ASSETS`: `InterchangeMaterialSearchLocation = Ellipsis` — Search for existing material in all assets folders. 3
  - `DO_NOT_SEARCH`: `InterchangeMaterialSearchLocation = Ellipsis` — Do not search for existing existing materials 4
  - `LOCAL`: `InterchangeMaterialSearchLocation = Ellipsis` — Search for existing material in local import folder only. 0
  - `UNDER_PARENT`: `InterchangeMaterialSearchLocation = Ellipsis` — Search for existing material recursively from parent folder. 1
  - `UNDER_ROOT`: `InterchangeMaterialSearchLocation = Ellipsis` — Search for existing material recursively from root folder. 2

### `unreal.InterchangeSceneHierarchyType`
Inherits: `EnumBase` | Header: `InterchangeGenericScenesPipeline.h`

EInterchange Scene Hierarchy Type

**Properties** (3):
  - `CREATE_LEVEL_ACTORS`: `InterchangeSceneHierarchyType = Ellipsis` — Create actors in the current editor world for all scene nodes in the source hierarchy. 0
  - `CREATE_LEVEL_INSTANCE_ACTOR`: `InterchangeSceneHierarchyType = Ellipsis` — Create a level instance actor referencing a new/existing world containing all scene nodes in the sou...
  - `CREATE_PACKED_ACTOR`: `InterchangeSceneHierarchyType = Ellipsis` — Create a packed level actor blueprint which packed all meshes from a new/existing world containing a...

### `unreal.InterchangeVertexColorImportOption`
Inherits: `EnumBase` | Header: `InterchangeGenericAssetsPipelineSharedSettings.h`

EInterchange Vertex Color Import Option

**Properties** (3):
  - `IVCIO_IGNORE`: `InterchangeVertexColorImportOption = Ellipsis` — Ignore vertex colors from the translated source. In case of a reimport, keep the existing mesh verte...
  - `IVCIO_OVERRIDE`: `InterchangeVertexColorImportOption = Ellipsis` — Override all vertex colors with the specified color. 2
  - `IVCIO_REPLACE`: `InterchangeVertexColorImportOption = Ellipsis` — Import the mesh using the vertex colors from the translated source. 0
