# UE Python API — GeometryScriptingCore Module

**260 types** from the `GeometryScriptingCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ComputeDistanceFieldSettings`, `ComputeNegativeSpaceOptions`, `DistanceFieldToTextureSettings`, `GeometryScript3DGridParameters`, `GeometryScriptAppendMeshOptions`, `GeometryScriptBakeOutputType`, `GeometryScriptBakeRenderCaptureOptions`, `GeometryScriptBakeSourceMeshOptions`, `GeometryScriptBakeTargetMeshOptions`, `GeometryScriptBakeTextureOptions`, `GeometryScriptBakeTypeOptions`, `GeometryScriptBakeVertexOptions`, `GeometryScriptBendWarpOptions`, `GeometryScriptBlurMeshVertexColorsOptions`, `GeometryScriptBoneInfo`, `GeometryScriptBoneWeight`, `GeometryScriptBoneWeightProfile`, `GeometryScriptCalculateNormalsOptions`, `GeometryScriptCollisionFromMeshOptions`, `GeometryScriptColorFlags`, ... (260 total)

---

## Classes

### `unreal.ComputeDistanceFieldSettings`
Inherits: `StructBase` | Header: `VolumeTextureBakeFunctions.h`

Settings for computing distance fields

**Properties** (5):
  - `compute_mode`: `DistanceFieldComputeMode` — [Read-Write] Whether to compute distances only in a band around the surface (faster) or compute the ...
  - `narrow_band_units`: `DistanceFieldUnits` — [Read-Write] Whether Narrow Band Width is expressed as a number of voxels (rounded up to nearest int...
  - `narrow_band_width`: `float` — [Read-Write] Width of the narrow band where distances are computed accurately (float)
  - `require_power2`: `bool` — [Read-Write] Whether to round voxel count on each dimension up to the nearest power of two (bool)
  - `voxels_per_dimensions`: `IntVector` — [Read-Write] Number of voxels to use along each axis (IntVector)

### `unreal.ComputeNegativeSpaceOptions`
Inherits: `StructBase` | Header: `CollisionFunctions.h`

Options controlling how to sample the negative space of shapes, e.g. to define a region that must be avoided when merging collision shapes

**Properties** (9):
  - `max_voxels_per_dim`: `int` — [Read-Write] When performing Voxel Search, maximum number of voxels to use along each dimension (int...
  - `min_radius`: `float` — [Read-Write] Spheres smaller than this are not included in the negative space (double)
  - `min_sample_spacing`: `float` — [Read-Write] Minimum desired spacing between sphere centers; if > 0, will attempt not to place spher...
  - `negative_space_tolerance`: `float` — [Read-Write] Amount of space to leave between convex hulls and protected negative space (double)
  - `only_connected_to_hull`: `bool` — [Read-Write] When performing Voxel Search, only look for negative space that is connected out to the...
  - `require_search_sample_coverage`: `bool` — [Read-Write] Whether to require that all candidate locations identified by Voxel Search are covered ...
  - `sample_method`: `NegativeSpaceSampleMethod` — [Read-Write] Method to use to find and sample negative space (NegativeSpaceSampleMethod)
  - `target_num_samples`: `int` — [Read-Write] Approximate number of spheres to consider when covering negative space (int32)
  - `tolerance_directional_scales`: `None` — [Read-Write] Optionally scale the negative space tolerances in custom directions (Array[NegativeSpac...

### `unreal.DistanceFieldToTextureSettings`
Inherits: `StructBase` | Header: `VolumeTextureBakeFunctions.h`

Distance Field to Texture Settings

**Properties** (2):
  - `offset`: `float` — [Read-Write] Offset values by this amount before writing them to the texture (after applying Scale) ...
  - `scale`: `float` — [Read-Write] Scale values by this amount before writing them to the texture (float)

### `unreal.GeometryScript3DGridParameters`
Inherits: `StructBase` | Header: `MeshVoxelFunctions.h`

Parameters for 3D grids, eg grids used for sampling, SDFs, voxelization, etc

**Properties** (3):
  - `grid_cell_size`: `float` — [Read-Write] Use a specific grid cell size, and construct a grid with dimensions large enough to con...
  - `grid_resolution`: `int` — [Read-Write] Use a specific grid resolution, with the grid cell size derived form the target object ...
  - `size_method`: `GeometryScriptGridSizingMethod` — [Read-Write] SizeMethod determines how the parameters below will be interpreted to define the size o...

### `unreal.GeometryScriptAppendMeshOptions`
Inherits: `StructBase` | Header: `MeshBasicEditFunctions.h`

Control how details like mesh attributes are handled when one mesh is appended to another

**Properties** (1):
  - `combine_mode`: `GeometryScriptCombineAttributesMode` — [Read-Write] How attributes from each mesh are combined into the result (GeometryScriptCombineAttrib...

### `unreal.GeometryScriptBakeOutputType`
Inherits: `StructBase` | Header: `MeshBakeFunctions.h`

Geometry Script Bake Output Type

**Properties** (6):
  - `a`: `GeometryScriptBakeTypeOptions` — [Read-Write] (GeometryScriptBakeTypeOptions)
  - `b`: `GeometryScriptBakeTypeOptions` — [Read-Write] (GeometryScriptBakeTypeOptions)
  - `g`: `GeometryScriptBakeTypeOptions` — [Read-Write] (GeometryScriptBakeTypeOptions)
  - `output_mode`: `GeometryScriptBakeOutputMode` — [Read-Write] The bake output mode (GeometryScriptBakeOutputMode)
  - `r`: `GeometryScriptBakeTypeOptions` — [Read-Write] (GeometryScriptBakeTypeOptions)
  - `rgba`: `GeometryScriptBakeTypeOptions` — [Read-Write] (GeometryScriptBakeTypeOptions)

### `unreal.GeometryScriptBakeRenderCaptureOptions`
Inherits: `StructBase` | Header: `MeshBakeFunctions.h`

Geometry Script Bake Render Capture Options

**Properties** (15):
  - `base_color_map`: `bool` — [Read-Write] (bool)
  - `cameras`: `None` — [Read-Write] If not empty the given Render Capture Cameras are used to create the photos from which ...
  - `cleanup_tolerance`: `float` — [Read-Write] This threshold is used to detect occlusion artefacts (e.g., silhouettes/blotches in the...
  - `emissive_map`: `bool` — [Read-Write] (bool)
  - `metallic_map`: `bool` — [Read-Write] (bool)
  - `normal_map`: `bool` — [Read-Write] World space normal map (bool)
  - `opacity_map`: `bool` — [Read-Write] (bool)
  - `packed_mrs_map`: `bool` — [Read-Write] Packed Metallic/Roughness/Specular Map. If this is true the separated channel booleans ...
  - `render_capture_anti_aliasing`: `bool` — [Read-Write] Whether to use anti-aliasing in the render captures, this may introduce artefacts if pi...
  - `render_capture_resolution`: `GeometryScriptBakeResolution` — [Read-Write] The pixel resolution of the default render capture camera photo sets.
Only used if Came...
  - `resolution`: `GeometryScriptBakeResolution` — [Read-Write] The pixel resolution of the generated textures (GeometryScriptBakeResolution)
  - `roughness_map`: `bool` — [Read-Write] (bool)
  - `samples_per_pixel`: `GeometryScriptBakeSamplesPerPixel` — [Read-Write] Number of samples per pixel (GeometryScriptBakeSamplesPerPixel)
  - `specular_map`: `bool` — [Read-Write] (bool)
  - `subsurface_color_map`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptBakeSourceMeshOptions`
Inherits: `StructBase` | Header: `MeshBakeFunctions.h`

Geometry Script Bake Source Mesh Options

**Properties** (3):
  - `source_normal_map`: `Texture2D` — [Read-Write] (Texture2D)
  - `source_normal_space`: `GeometryScriptBakeNormalSpace` — [Read-Write] (GeometryScriptBakeNormalSpace)
  - `source_normal_uv_layer`: `int` — [Read-Write] (int32)

### `unreal.GeometryScriptBakeTargetMeshOptions`
Inherits: `StructBase` | Header: `MeshBakeFunctions.h`

Geometry Script Bake Target Mesh Options

**Properties** (1):
  - `target_uv_layer`: `int` — [Read-Write] (int32)

### `unreal.GeometryScriptBakeTextureOptions`
Inherits: `StructBase` | Header: `MeshBakeFunctions.h`

Geometry Script Bake Texture Options

**Properties** (8):
  - `bit_depth`: `GeometryScriptBakeBitDepth` — [Read-Write] The bit depth for each channel of the generated textures (GeometryScriptBakeBitDepth)
  - `filtering_type`: `GeometryScriptBakeFilteringType` — [Read-Write] Filtering Type to perform on samples (GeometryScriptBakeFilteringType)
  - `gutter_size`: `int` — [Read-Write] The pixel distance to pad baked content past the UV borders. (int32)
  - `projection_distance`: `float` — [Read-Write] Maximum allowed distance for the projection from target mesh to source mesh for the sam...
  - `projection_in_world_space`: `bool` — [Read-Write] If true, uses the world space positions for the projection from target mesh to source m...
  - `resolution`: `GeometryScriptBakeResolution` — [Read-Write] The pixel resolution of the generated textures (GeometryScriptBakeResolution)
  - `sample_filter_mask`: `Texture2D` — [Read-Write] Mask texture for filtering out samples/pixels from the output texture (Texture2D)
  - `samples_per_pixel`: `GeometryScriptBakeSamplesPerPixel` — [Read-Write] Number of samples per pixel (GeometryScriptBakeSamplesPerPixel)

### `unreal.GeometryScriptBakeTypeOptions`
Inherits: `StructBase` | Header: `MeshBakeFunctions.h`

Opaque struct for storing bake type options.

**Properties** (1):
  - `bake_type`: `GeometryScriptBakeTypes` [Read-Only] — [Read-Only] The bake output type to generate (GeometryScriptBakeTypes)

### `unreal.GeometryScriptBakeVertexOptions`
Inherits: `StructBase` | Header: `MeshBakeFunctions.h`

Geometry Script Bake Vertex Options

**Properties** (5):
  - `projection_distance`: `float` — [Read-Write] Maximum allowed distance for the projection from target mesh to source mesh for the sam...
  - `projection_in_world_space`: `bool` — [Read-Write] If true, uses the world space positions for the projection from target mesh to source m...
  - `split_at_normal_seams`: `bool` — [Read-Write] If true, compute a separate vertex color for each unique normal on a vertex (bool)
  - `split_at_uv_seams`: `bool` — [Read-Write] If true, compute a separate vertex color for each unique UV on a vertex. (bool)
  - `topology_mode`: `GeometryScriptBakeVertexTopology` — [Read-Write] Option to generate new vertex color topology or reuse existing vertex color topology. (...

### `unreal.GeometryScriptBendWarpOptions`
Inherits: `StructBase` | Header: `MeshDeformFunctions.h`

Geometry Script Bend Warp Options

**Properties** (3):
  - `bidirectional`: `bool` — [Read-Write] If true, the Bend is âcenteredâ at the Origin, ie the regions on either side of the...
  - `lower_extent`: `float` — [Read-Write] Lower extent used when bSymmetricExtents = false (float)
  - `symmetric_extents`: `bool` — [Read-Write] Symmetric extents are [-BendExtent,BendExtent], if disabled, then [-LowerExtent,BendExt...

### `unreal.GeometryScriptBlurMeshVertexColorsOptions`
Inherits: `StructBase` | Header: `MeshVertexColorFunctions.h`

Geometry Script Blur Mesh Vertex Colors Options

**Properties** (4):
  - `alpha`: `bool` — [Read-Write] Blur alpha channel. (bool)
  - `blue`: `bool` — [Read-Write] Blur blue channel. (bool)
  - `green`: `bool` — [Read-Write] Blur green channel. (bool)
  - `red`: `bool` — [Read-Write] Blur red channel. (bool)

### `unreal.GeometryScriptBoneInfo`
Inherits: `StructBase` | Header: `MeshBoneWeightFunctions.h`

Geometry Script Bone Info

**Properties** (6):
  - `color`: `LinearColor` — [Read-Write] Bone color. (LinearColor)
  - `index`: `int` — [Read-Write] Index of the bone in the skeletal hierarchy. (int32)
  - `local_transform`: `Transform` — [Read-Write] Local/bone space reference transform. (Transform)
  - `name`: `Name` — [Read-Write] Bone name. (Name)
  - `parent_index`: `int` — [Read-Write] Parent bone index. (int32)
  - `world_transform`: `Transform` — [Read-Write] Global/world space reference transform. (Transform)

### `unreal.GeometryScriptBoneWeight`
Inherits: `StructBase` | Header: `MeshBoneWeightFunctions.h`

Geometry Script Bone Weight

**Properties** (2):
  - `bone_index`: `int` — [Read-Write] (int32)
  - `weight`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptBoneWeightProfile`
Inherits: `StructBase` | Header: `MeshBoneWeightFunctions.h`

Geometry Script Bone Weight Profile

**Properties** (1):
  - `profile_name`: `Name` — [Read-Write] (Name)

### `unreal.GeometryScriptCalculateNormalsOptions`
Inherits: `StructBase` | Header: `MeshNormalsFunctions.h`

Geometry Script Calculate Normals Options

**Properties** (2):
  - `angle_weighted`: `bool` — [Read-Write] (bool)
  - `area_weighted`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptCollisionFromMeshOptions`
Inherits: `StructBase` | Header: `CollisionFunctions.h`

Geometry Script Collision from Mesh Options

**Properties** (16):
  - `auto_detect_boxes`: `bool` — [Read-Write] (bool)
  - `auto_detect_capsules`: `bool` — [Read-Write] (bool)
  - `auto_detect_spheres`: `bool` — [Read-Write] (bool)
  - `convex_decomposition_error_tolerance`: `float` — [Read-Write] (float)
  - `convex_decomposition_min_part_thickness`: `float` — [Read-Write] (float)
  - `convex_decomposition_search_factor`: `float` — [Read-Write] (float)
  - `convex_hull_target_face_count`: `int` — [Read-Write] (int32)
  - `emit_transaction`: `bool` — [Read-Write] (bool)
  - `max_convex_hulls_per_mesh`: `int` — [Read-Write] (int32)
  - `max_shape_count`: `int` — [Read-Write] (int32)
  - `method`: `GeometryScriptCollisionGenerationMethod` — [Read-Write] (GeometryScriptCollisionGenerationMethod)
  - `min_thickness`: `float` — [Read-Write] (float)
  - `remove_fully_contained_shapes`: `bool` — [Read-Write] (bool)
  - `simplify_hulls`: `bool` — [Read-Write] (bool)
  - `swept_hull_axis`: `GeometryScriptSweptHullAxis` — [Read-Write] (GeometryScriptSweptHullAxis)
  - `swept_hull_simplify_tolerance`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptColorFlags`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Colors

**Properties** (4):
  - `alpha`: `bool` — [Read-Write] (bool)
  - `blue`: `bool` — [Read-Write] (bool)
  - `green`: `bool` — [Read-Write] (bool)
  - `red`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptColorList`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script Color List

**Methods** (9):
  - `clear_color_list(clear_color)` -> `None` — Resets all the items in the Color List to the specified Clear Color.
  - `convert_color_list_to_array()` -> `Array [ LinearColor ]` — Converts the Color List to an array of FLinearColor (Color Array).
  - `duplicate_color_list()` -> `GeometryScriptColorList` — Duplicates the contents of Color List into Duplicate List.
  - `extract_color_list_channel(channel_index = 0)` -> `GeometryScriptScalarList` — Populates a Scalar List with values that corresponds to the 0, 1, 2, or 3 channel of a Color List.
  - `extract_color_list_channels(x_channel_index = 0, y_channel_index = 1, z_channel_index = 2)` -> `GeometryScriptVectorList` — Populates a Vector List from a Color List. The channels in the Color List are mapped to vector components by means of X ...
  - `get_color_list_item(is_valid_index=bool)` — Returns the FLinearColor stored in the Color List at the specified location. If the Index is not valid for this Color Li...
  - `get_color_list_last_index()` -> `int32` — Returns the index of the last item in the Color List. If Color List is empty or invalid, the value -1 will be returned.
  - `get_color_list_length()` -> `int32` — Returns the number of items in the Color List.
  - `set_color_list_item(index, new_color)` -> `bool` — Updates the value of the FLinearColor stored in the Color List at the specified location. If the Index is invalid, the o...

### `unreal.GeometryScriptConstrainedDelaunayTriangulationOptions`
Inherits: `StructBase` | Header: `MeshPrimitiveFunctions.h`

Geometry Script Constrained Delaunay Triangulation Options

**Properties** (3):
  - `constrained_edges_fill_mode`: `GeometryScriptPolygonFillMode` — [Read-Write] How to decide which parts of the shape defined by constrained edges should be filled wi...
  - `remove_duplicate_vertices`: `bool` — [Read-Write] Whether to remove duplicate vertices from the output.  If false, duplicate vertices wil...
  - `validate_edges_in_result`: `bool` — [Read-Write] Whether the triangulation should be considered a failure if it doesnât include the re...

### `unreal.GeometryScriptConvexDecompositionOptions`
Inherits: `StructBase` | Header: `ContainmentFunctions.h`

Geometry Script Convex Decomposition Options

**Properties** (5):
  - `error_tolerance`: `float` — [Read-Write] Error tolerance to guide convex decomposition (in cm); we stop adding new parts if the ...
  - `min_part_thickness`: `float` — [Read-Write] Minimum part thickness for convex decomposition (in cm); hulls thinner than this will b...
  - `num_hulls`: `int` — [Read-Write] How many convex pieces to target per mesh when creating convex decompositions.  If Erro...
  - `search_factor`: `float` — [Read-Write] How much additional decomposition decomposition + merging to do, as a fraction of max p...
  - `simplify_to_face_count`: `int` — [Read-Write] Try to simplify each convex hull to this triangle count. If 0, no simplification (int32...

### `unreal.GeometryScriptConvexHullApproximationOptions`
Inherits: `StructBase` | Header: `CollisionFunctions.h`

Geometry Script Convex Hull Approximation Options

**Properties** (5):
  - `distance_threshold`: `float` — [Read-Write] Approximating shape should be at least this close to the original shape (float)
  - `fit_boxes`: `bool` — [Read-Write] Whether to attempt to replace convex hulls with boxes (bool)
  - `fit_capsules`: `bool` — [Read-Write] Whether to attempt to replace convex hulls with capsules (bool)
  - `fit_spheres`: `bool` — [Read-Write] Whether to attempt to replace convex hulls with spheres (bool)
  - `volume_diff_threshold_fraction`: `float` — [Read-Write] Acceptable difference between approximating shape volume and convex hull volume, as a f...

### `unreal.GeometryScriptConvexHullOptions`
Inherits: `StructBase` | Header: `ContainmentFunctions.h`

Geometry Script Convex Hull Options

**Properties** (3):
  - `prefilter_grid_resolution`: `int` — [Read-Write] (int32)
  - `prefilter_vertices`: `bool` — [Read-Write] (bool)
  - `simplify_to_face_count`: `int` — [Read-Write] Try to simplify each convex hull to this triangle count. If 0, no simplification (int32...

### `unreal.GeometryScriptConvexHullSimplificationOptions`
Inherits: `StructBase` | Header: `CollisionFunctions.h`

Geometry Script Convex Hull Simplification Options

**Properties** (4):
  - `min_target_face_count`: `int` — [Read-Write] The minimum number of faces to use for the convex hull.
Note that for the MeshQSlim met...
  - `simplification_angle_threshold`: `float` — [Read-Write] Simplified hull should preserve angles larger than this (in degrees). Used by the Angle...
  - `simplification_distance_threshold`: `float` — [Read-Write] Simplified hull should stay within this distance of the initial convex hull. Used by th...
  - `simplification_method`: `GeometryScriptConvexHullSimplifyMethod` — [Read-Write] Method to use to simplify convex hulls (GeometryScriptConvexHullSimplifyMethod)

### `unreal.GeometryScriptCopyBonesFromMeshOptions`
Inherits: `StructBase` | Header: `MeshBoneWeightFunctions.h`

Geometry Script Copy Bones from Mesh Options

**Properties** (2):
  - `bones_to_copy_from_source`: `BonesToCopyFromSource` — [Read-Write] Specify which bones are copied from the source mesh to the target. (BonesToCopyFromSour...
  - `reindex_weights`: `bool` — [Read-Write] If the target Dynamic mesh has bone weights and a skeleton, re-index (re-bind) target w...

### `unreal.GeometryScriptCopyMeshFromAssetOptions`
Inherits: `StructBase` | Header: `MeshAssetFunctions.h`

Geometry Script Copy Mesh from Asset Options

**Properties** (4):
  - `apply_build_settings`: `bool` — [Read-Write] Whether to apply Build Settings during the mesh copy. (bool)
  - `ignore_remove_degenerates`: `bool` — Only applies if âApply Build Settingsâ is enabled. (bool) [Read-Write] Whether to ignore the â...
  - `request_tangents`: `bool` — [Read-Write] Whether to request tangents on the copied mesh. If tangents are not requested, tangent-...
  - `use_build_scale`: `bool` — This is considered separately from the âApply Build Settingsâ option. (bool) [Read-Write] Whethe...

### `unreal.GeometryScriptCopyMeshFromComponentOptions`
Inherits: `StructBase` | Header: `SceneUtilityFunctions.h`

Geometry Script Copy Mesh from Component Options

**Properties** (4):
  - `requested_lod`: `GeometryScriptMeshReadLOD` — [Read-Write] (GeometryScriptMeshReadLOD)
  - `want_instance_colors`: `bool` — [Read-Write] Whether to request per-instance vertex colors (where applicable; applies to RenderData ...
  - `want_normals`: `bool` — [Read-Write] (bool)
  - `want_tangents`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptCopyMeshToAssetOptions`
Inherits: `StructBase` | Header: `MeshAssetFunctions.h`

Geometry Script Copy Mesh to Asset Options

**Properties** (16):
  - `apply_nanite_settings`: `bool` — [Read-Write] If enabled, NaniteSettings will be applied to the target Asset if possible (bool)
  - `bone_hierarchy_mismatch_handling`: `GeometryScriptBoneHierarchyMismatchHandling` — [Read-Write] An option that specifies, for skeletal mesh assets, how mismatches between the existing...
  - `defer_mesh_post_edit_change`: `bool` — [Read-Write] (bool)
  - `emit_transaction`: `bool` — [Read-Write] (bool)
  - `enable_recompute_normals`: `bool` — [Read-Write] (bool)
  - `enable_recompute_tangents`: `bool` — [Read-Write] (bool)
  - `enable_remove_degenerates`: `bool` — [Read-Write] (bool)
  - `generate_lightmap_u_vs`: `GeometryScriptGenerateLightmapUVOptions` — [Read-Write] Whether to generate lightmap UVs (GeometryScriptGenerateLightmapUVOptions)
  - `nanite_settings`: `GeometryScriptNaniteOptions` — [Read-Write] Replaced FGeometryScriptNaniteOptions with usage of Engine FMeshNaniteSettings (Geometr...
  - `new_material_slot_names`: `None` — [Read-Write] Optional slot names for the New Materials. Ignored if not the same length as the New Ma...
  - `new_materials`: `None` — [Read-Write] New materials to set if Replace Materials is enabled. Ignored otherwise. (Array[Materia...
  - `new_nanite_settings`: `MeshNaniteSettings` — [Read-Write] Nanite Settings applied to the target Asset, if bApplyNaniteSettings = true (MeshNanite...
  - `remap_bone_indices_to_match_asset`: `bool` — [Read-Write] Deprecated. Use BoneHierarchyMismatchHandling instead.
// UE_DEPRECATED(5.6, âDepreca...
  - `replace_materials`: `bool` — [Read-Write] Whether to replace the materials on the asset with those in the New Materials array (bo...
  - `use_build_scale`: `bool` — [Read-Write] Whether to use the build scale on the target asset. If enabled, the inverse scale will ...
  - `use_original_vertex_order`: `bool` — [Read-Write] Use the original vertex order found in the source data. This is useful if the inbound m...

### `unreal.GeometryScriptCopyMorphTargetToAssetOptions`
Inherits: `StructBase` | Header: `MeshAssetFunctions.h`

Geometry Script Copy Morph Target to Asset Options

**Properties** (4):
  - `copy_normals`: `bool` — [Read-Write] (bool)
  - `defer_mesh_post_edit_change`: `bool` — [Read-Write] (bool)
  - `emit_transaction`: `bool` — [Read-Write] (bool)
  - `overwrite_existing_target`: `bool` — [Read-Write] If true and the morph target with the given name exists, it will be overwritten. If fal...

### `unreal.GeometryScriptCopySkinWeightProfileToAssetOptions`
Inherits: `StructBase` | Header: `MeshAssetFunctions.h`

Geometry Script Copy Skin Weight Profile to Asset Options

**Properties** (3):
  - `defer_mesh_post_edit_change`: `bool` — [Read-Write] (bool)
  - `emit_transaction`: `bool` — [Read-Write] (bool)
  - `overwrite_existing_profile`: `bool` — [Read-Write] If true and a skin weight profile with the given name exists, it will be overwritten.
I...

### `unreal.GeometryScriptDebugMessage`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script Debug Message

**Properties** (3):
  - `error_type`: `GeometryScriptErrorType` — [Read-Write] (GeometryScriptErrorType)
  - `message`: `Text` — [Read-Write] (Text)
  - `message_type`: `GeometryScriptDebugMessageType` — [Read-Write] (GeometryScriptDebugMessageType)

### `unreal.GeometryScriptDegenerateTriangleOptions`
Inherits: `StructBase` | Header: `MeshRepairFunctions.h`

Geometry Script Degenerate Triangle Options

**Properties** (4):
  - `compact_on_completion`: `bool` — [Read-Write] (bool)
  - `min_edge_length`: `float` — [Read-Write] (double)
  - `min_triangle_area`: `float` — [Read-Write] (double)
  - `mode`: `GeometryScriptRepairMeshMode` — [Read-Write] (GeometryScriptRepairMeshMode)

### `unreal.GeometryScriptDetermineMeshOcclusionOptions`
Inherits: `StructBase` | Header: `SceneUtilityFunctions.h`

Geometry Script Determine Mesh Occlusion Options

**Properties** (3):
  - `double_sided`: `bool` — [Read-Write] Whether to treat faces as double-sided when determining visibility (bool)
  - `num_search_directions`: `int` — [Read-Write] Number of directions to test for visibility (int32)
  - `sampling_density`: `float` — [Read-Write] Approximate spacing between samples on triangle faces used for determining visibility (...

### `unreal.GeometryScriptDisplaceFromTextureOptions`
Inherits: `StructBase` | Header: `MeshDeformFunctions.h`

Geometry Script Displace from Texture Options

**Properties** (6):
  - `center`: `float` — [Read-Write] (float)
  - `empty_behavior`: `GeometryScriptEmptySelectionBehavior` — [Read-Write] EmptyBehavior Defines how an empty input selection should be interpreted (GeometryScrip...
  - `image_channel`: `int` — [Read-Write] (int32)
  - `magnitude`: `float` — [Read-Write] (float)
  - `uv_offset`: `Vector2D` — [Read-Write] (Vector2D)
  - `uv_scale`: `Vector2D` — [Read-Write] (Vector2D)

### `unreal.GeometryScriptDynamicMeshBVH`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Spatial data structures

**Methods** (1):
  - `reset_bvh()` -> `None` — Reset the Bounding Volume Hierarchy (BVH) by clearing all the internal data.

### `unreal.GeometryScriptExpMapUVOptions`
Inherits: `StructBase` | Header: `MeshUVFunctions.h`

Geometry Script Exp Map UVOptions

**Properties** (2):
  - `normal_smoothing_alpha`: `float` — [Read-Write] (float)
  - `normal_smoothing_rounds`: `int` — [Read-Write] (int32)

### `unreal.GeometryScriptFillHolesOptions`
Inherits: `StructBase` | Header: `MeshRepairFunctions.h`

Geometry Script Fill Holes Options

**Properties** (2):
  - `delete_isolated_triangles`: `bool` — [Read-Write] Delete floating, disconnected triangles, as they produce a âholeâ that cannot be fi...
  - `fill_method`: `GeometryScriptFillHolesMethod` — [Read-Write] (GeometryScriptFillHolesMethod)

### `unreal.GeometryScriptFlareWarpOptions`
Inherits: `StructBase` | Header: `MeshDeformFunctions.h`

Geometry Script Flare Warp Options

**Properties** (3):
  - `flare_type`: `GeometryScriptFlareType` — [Read-Write] Determines the profile used as a displacement (GeometryScriptFlareType)
  - `lower_extent`: `float` — [Read-Write] Lower extent used when bSymmetricExtents = false (float)
  - `symmetric_extents`: `bool` — [Read-Write] Symmetric extents are [-BendExtent,BendExtent], if disabled, then [-LowerExtent,BendExt...

### `unreal.GeometryScriptGeneralPolygonList`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

A list of general polygons, which may have holes.

**Methods** (20):
  - `add_polygon_to_list(outer_polygon, hole_polygons, fix_hole_orientations = True)` -> `int32` — Add Polygon to a Polygon List, with optional holes. Returns index of the added polygon.
  - `append_polygon_list(polygons_to_append)` -> `None` — Append the polygons in âPolygons to Appendâ to Polygon List
  - `get_polygon_area(valid_index=bool)` — Returns the area enclosed by a specified Polygon in a Polygon List. Returns zero for an invalid PolygonIndex.
  - `get_polygon_bounds(valid_index=bool)` — Returns the bounding box of a Polygon. Returns an empty, invalid box for an invalid PolygonIndex.
  - `get_polygon_count()` -> `int32` — Returns the number of polygons in the Polygon List
  - `get_polygon_hole_count(valid_index=bool)` — Returns the number of holes in a Polygon. Returns zero for an invalid PolygonIndex.
  - `get_polygon_list_area()` -> `double` — Returns the area enclosed by a Polygon List
  - `get_polygon_list_bounds()` -> `Box2D` — Returns the bounding box of a Polygon List
  - `get_polygon_vertex(vertex_index, polygon_index, is_valid_vertex=bool)` — Returns the specified vertex of a Polygon â either of the outer polygon, if HoleIndex is -1, or specified inner hole. ...
  - `get_polygon_vertex_count(polygon_index, valid_indices=bool)` — Returns the number of vertices in a Polygonâs outer shape, if HoleIndex is -1, or in the specified inner hole. Returns...
  - `get_polygon_vertices()` — Returns the vertices of a Polygon â either of the outer polygon, if HoleIndex is -1, or specified inner hole. OutVerti...
  - `get_simple_polygon(polygon_index, valid_indices=bool)` — Returns a specified Simple Polygon from a Polygon List â either the outer polygon, if HoleIndex is -1, or specified in...
  - `polygons_difference(polygons_to_subtract)` -> `GeometryScriptGeneralPolygonList` — Compute difference of Polygon List and Polygons to Subtract
  - `polygons_exclusive_or(polygons_to_exclusive_or)` -> `GeometryScriptGeneralPolygonList` — Compute exclusive or of Polygon List and Polygons to Exclusive Or
  - `polygons_intersection(polygons_to_intersect)` -> `GeometryScriptGeneralPolygonList` — Compute intersection of Polygon List and Polygons to Intersect
  - `polygons_morphology_close(offset_options, offset, operation_success=bool)` — Apply a morphological âcloseâ operator to a list of closed polygons â first offsetting by +Offset, then by -Offset...
  - `polygons_morphology_open(offset_options, offset, operation_success=bool)` — Apply a morphological âopenâ operator to a list of closed polygons â first offsetting by -Offset, then by +Offset....
  - `polygons_offset(offset_options, offset, operation_success=bool)` — Apply a single offset to a list of closed polygons
  - `polygons_offsets(offset_options, first_offset, second_offset, operation_success=bool)` — Apply two offsets in sequence to a list of closed polygons
  - `polygons_union(copy_input_on_failure = True)` -> `GeometryScriptGeneralPolygonList` — Compute union of all polygons in Polygon List. Also resolves self-intersections within each polygon.

### `unreal.GeometryScriptGroupLayer`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

FGeometryScriptGroupLayer identifies a PolyGroup Layer of a Mesh. The Default Layer always exists, Extended layers may or may not exist.

**Properties** (2):
  - `default_layer`: `bool` — [Read-Write] If true,the default/standard PolyGroup Layer is used (bool)
  - `extended_layer_index`: `int` — [Read-Write] Index of an extended PolyGroup Layer (which may or may not exist on any given Mesh) (in...

### `unreal.GeometryScriptIndexList`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script Index List

**Methods** (7):
  - `clear_index_list(clear_value = 0)` -> `None` — Set each value in Index List to the given Clear Value.
  - `convert_index_list_to_array()` -> `Array [ int32 ]` — Populates Index Array with the integer values stored in the Index List.
  - `duplicate_index_list()` -> `GeometryScriptIndexList` — Updates Duplicate List to be identical to Index List.
  - `get_index_list_item(is_valid_index=bool)` — Returns the item associated with Index in the Index List. If Index is not valid for this Index List the value -1 will be...
  - `get_index_list_last_index()` -> `int32` — Returns the index of the last element in the Index List. Note, the value -1 will be returned if the list is empty or inv...
  - `get_index_list_length()` -> `int32` — Returns the number of Items in Index List.
  - `set_index_list_item(index, new_value)` -> `bool` — Updates the value associated with Index in the Index List. If the Index is invalid, the operation will fail and in this ...

**Properties** (1):
  - `index_type`: `GeometryScriptIndexType` — [Read-Write] (GeometryScriptIndexType)

### `unreal.GeometryScriptIsSameMeshOptions`
Inherits: `StructBase` | Header: `MeshComparisonFunctions.h`

Geometry Script Is Same Mesh Options

**Properties** (8):
  - `check_attributes`: `bool` — [Read-Write] (bool)
  - `check_colors`: `bool` — [Read-Write] (bool)
  - `check_connectivity`: `bool` — [Read-Write] (bool)
  - `check_edge_i_ds`: `bool` — [Read-Write] (bool)
  - `check_groups`: `bool` — [Read-Write] (bool)
  - `check_normals`: `bool` — [Read-Write] (bool)
  - `check_u_vs`: `bool` — [Read-Write] (bool)
  - `epsilon`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptIterativeMeshSmoothingOptions`
Inherits: `StructBase` | Header: `MeshDeformFunctions.h`

Geometry Script Iterative Mesh Smoothing Options

**Properties** (3):
  - `alpha`: `float` — [Read-Write] (float)
  - `empty_behavior`: `GeometryScriptEmptySelectionBehavior` — [Read-Write] EmptyBehavior Defines how an empty input selection should be interpreted (GeometryScrip...
  - `num_iterations`: `int` — [Read-Write] (int32)

### `unreal.GeometryScriptLayoutUVsOptions`
Inherits: `StructBase` | Header: `MeshUVFunctions.h`

Geometry Script Layout UVs Options

**Properties** (9):
  - `allow_flips`: `bool` — [Read-Write] Allow the Repack layout type to flip the orientation when rotating UV islands to save s...
  - `enable_udim_layout`: `bool` — [Read-Write] Enable UDIM aware layout and keep islands within their originating UDIM tiles when layi...
  - `layout_type`: `GeometryScriptUVLayoutType` — [Read-Write] Type of layout applied to input UVs (GeometryScriptUVLayoutType)
  - `preserve_rotation`: `bool` — [Read-Write] Force the Repack layout type to preserve existing rotation of UV islands. Note, this mi...
  - `preserve_scale`: `bool` — [Read-Write] Force the Repack layout type to preserve existing scaling of UV islands. Note, this mig...
  - `scale`: `float` — [Read-Write] Uniform scale applied to UVs after packing (float)
  - `texture_resolution`: `int` — [Read-Write] Expected resolution of the output textures; this controls spacing left between UV islan...
  - `translation`: `Vector2D` — [Read-Write] Translation applied to UVs after packing, and after scaling (Vector2D)
  - `udim_resolutions`: `None` — [Read-Write] (Map[int32, int32])

### `unreal.GeometryScriptMathWarpOptions`
Inherits: `StructBase` | Header: `MeshDeformFunctions.h`

Geometry Script Math Warp Options

**Properties** (3):
  - `frequency`: `float` — [Read-Write] (float)
  - `frequency_shift`: `float` — [Read-Write] (float)
  - `magnitude`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptMeasureMeshDistanceOptions`
Inherits: `StructBase` | Header: `MeshComparisonFunctions.h`

Geometry Script Measure Mesh Distance Options

**Properties** (1):
  - `symmetric`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptMergeSimpleCollisionOptions`
Inherits: `StructBase` | Header: `CollisionFunctions.h`

Options controlling how collision shapes can be merged together

**Properties** (8):
  - `compute_negative_space`: `bool` — [Read-Write] Whether to compute a new sphere covering representing the negative space of the input s...
  - `compute_negative_space_options`: `ComputeNegativeSpaceOptions` — [Read-Write] Options controlling how the negative space is computed, if ComputeNegativeSpace is true...
  - `consider_all_possible_merges`: `bool` — [Read-Write] Whether to consider merges between every shape. If false, will only merge shapes that h...
  - `error_tolerance`: `float` — [Read-Write] Error tolerance to use to decide to convex hulls together, in cm.
If merging two hulls ...
  - `max_shape_count`: `int` — [Read-Write] If > 0, merge down to at most this many simple shapes. (If <= 0, this value is ignored....
  - `min_thickness_tolerance`: `float` — [Read-Write] Always attempt to merge parts thicker than this, ignoring ErrorTolerance and MaxShapeCo...
  - `precomputed_negative_space`: `GeometryScriptSphereCovering` — [Read-Write] Negative space that must be preserved during merging (GeometryScriptSphereCovering)
  - `shape_to_hull_triangulation`: `GeometryScriptSimpleCollisionTriangulationOptions` — [Read-Write] Controls for how smooth shapes can be triangulated when/if converted to a convex hull f...

### `unreal.GeometryScriptMergeVertexOptions`
Inherits: `StructBase` | Header: `MeshBasicEditFunctions.h`

Options for merging vertex pairs

**Properties** (2):
  - `allow_non_boundary_bowties`: `bool` — [Read-Write] Whether to allow the merge to introduce a non-boundary bowtie vertex (has no effect if ...
  - `only_boundary`: `bool` — [Read-Write] Whether to restrict merges to boundary vertices (bool)

### `unreal.GeometryScriptMeshBevelOptions`
Inherits: `StructBase` | Header: `MeshModelingFunctions.h`

Geometry Script Mesh Bevel Options

**Properties** (9):
  - `apply_filter_box`: `bool` — [Read-Write] If true the set of beveled PolyGroup edges is limited to those that
are fully or partia...
  - `bevel_distance`: `float` — [Read-Write] Distance that each beveled mesh edge is inset from itâs initial position (float)
  - `filter_box`: `Box` — [Read-Write] Bounding Box used for edge filtering (Box)
  - `filter_box_transform`: `Transform` — [Read-Write] Transform applied to the FilterBox (Transform)
  - `fully_contained`: `bool` — [Read-Write] If true, then only PolyGroup edges that are fully contained within the filter box will ...
  - `infer_material_id`: `bool` — [Read-Write] If true, when faces on either side of a beveled mesh edges have the same Material ID, b...
  - `round_weight`: `float` — [Read-Write] Roundness of the bevel. Ignored if Subdivisions = 0. (float)
  - `set_material_id`: `int` — [Read-Write] Material ID to set on the new faces introduced by bevel operation, unless bInferMateria...
  - `subdivisions`: `int` — [Read-Write] Number of edge loops added along the bevel faces (int32)

### `unreal.GeometryScriptMeshBevelSelectionOptions`
Inherits: `StructBase` | Header: `MeshModelingFunctions.h`

Geometry Script Mesh Bevel Selection Options

**Properties** (5):
  - `bevel_distance`: `float` — [Read-Write] Distance that each beveled mesh edge is inset from itâs initial position (float)
  - `infer_material_id`: `bool` — [Read-Write] If true, when faces on either side of a beveled mesh edges have the same Material ID, b...
  - `round_weight`: `float` — [Read-Write] Roundness of the bevel. Ignored if Subdivisions = 0. (float)
  - `set_material_id`: `int` — [Read-Write] Material ID to set on the new faces introduced by bevel operation, unless bInferMateria...
  - `subdivisions`: `int` — [Read-Write] Number of edge loops added along the bevel faces (int32)

### `unreal.GeometryScriptMeshBooleanOptions`
Inherits: `StructBase` | Header: `MeshBooleanFunctions.h`

Geometry Script Mesh Boolean Options

**Properties** (5):
  - `allow_empty_result`: `bool` — [Read-Write] Whether to allow the Mesh Boolean operation to generate an empty mesh as its result (bo...
  - `fill_holes`: `bool` — [Read-Write] (bool)
  - `output_transform_space`: `GeometryScriptBooleanOutputSpace` — [Read-Write] The coordinate space to use for the result mesh (GeometryScriptBooleanOutputSpace)
  - `simplify_output`: `bool` — [Read-Write] (bool)
  - `simplify_planar_tolerance`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptMeshDifferenceInfo`
Inherits: `StructBase` | Header: `MeshComparisonFunctions.h`

Geometry Script Mesh Difference Info

**Properties** (5):
  - `detail`: `str` — [Read-Write] String that may contain additional detail on the difference (str)
  - `element_id_type`: `GeometryScriptIndexType` — [Read-Write] Indicates the type of element that TargetMeshElementID and OtherMeshElementID reference...
  - `other_mesh_element_id`: `int` — [Read-Write] (int32)
  - `reason`: `GeometryScriptMeshDifferenceReason` — [Read-Write] (GeometryScriptMeshDifferenceReason)
  - `target_mesh_element_id`: `int` — [Read-Write] (int32)

### `unreal.GeometryScriptMeshEditPolygroupOptions`
Inherits: `StructBase` | Header: `MeshModelingFunctions.h`

Geometry Script Mesh Edit Polygroup Options

**Properties** (2):
  - `constant_group`: `int` — [Read-Write] (int32)
  - `group_mode`: `GeometryScriptMeshEditPolygroupMode` — [Read-Write] (GeometryScriptMeshEditPolygroupMode)

### `unreal.GeometryScriptMeshExtrudeOptions`
Inherits: `StructBase` | Header: `MeshModelingFunctions.h`

Geometry Script Mesh Extrude Options

**Properties** (4):
  - `extrude_direction`: `Vector` — [Read-Write] (Vector)
  - `extrude_distance`: `float` — [Read-Write] (float)
  - `solids_to_shells`: `bool` — [Read-Write] (bool)
  - `uv_scale`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptMeshInsetOutsetFacesOptions`
Inherits: `StructBase` | Header: `MeshModelingFunctions.h`

Geometry Script Mesh Inset Outset Faces Options

**Properties** (8):
  - `area_mode`: `GeometryScriptPolyOperationArea` — [Read-Write] (GeometryScriptPolyOperationArea)
  - `area_scale`: `float` — [Read-Write] (float)
  - `boundary_only`: `bool` — [Read-Write] (bool)
  - `distance`: `float` — [Read-Write] (float)
  - `group_options`: `GeometryScriptMeshEditPolygroupOptions` — [Read-Write] (GeometryScriptMeshEditPolygroupOptions)
  - `reproject`: `bool` — [Read-Write] (bool)
  - `softness`: `float` — [Read-Write] (float)
  - `uv_scale`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptMeshIsoCurveOptions`
Inherits: `StructBase` | Header: `MeshBooleanFunctions.h`

Geometry Script Mesh Iso Curve Options

**Properties** (2):
  - `curve_iso_value_snap_tolerance`: `float` — [Read-Write] (float)
  - `snap_to_existing_vertex_tolerance`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptMeshLinearExtrudeOptions`
Inherits: `StructBase` | Header: `MeshModelingFunctions.h`

Geometry Script Mesh Linear Extrude Options

**Properties** (7):
  - `area_mode`: `GeometryScriptPolyOperationArea` — [Read-Write] (GeometryScriptPolyOperationArea)
  - `direction`: `Vector` — [Read-Write] (Vector)
  - `direction_mode`: `GeometryScriptLinearExtrudeDirection` — [Read-Write] (GeometryScriptLinearExtrudeDirection)
  - `distance`: `float` — [Read-Write] (float)
  - `group_options`: `GeometryScriptMeshEditPolygroupOptions` — [Read-Write] (GeometryScriptMeshEditPolygroupOptions)
  - `solids_to_shells`: `bool` — [Read-Write] (bool)
  - `uv_scale`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptMeshMirrorOptions`
Inherits: `StructBase` | Header: `MeshBooleanFunctions.h`

Geometry Script Mesh Mirror Options

**Properties** (3):
  - `apply_plane_cut`: `bool` — [Read-Write] (bool)
  - `flip_cut_side`: `bool` — [Read-Write] (bool)
  - `weld_along_plane`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptMeshOffsetFacesOptions`
Inherits: `StructBase` | Header: `MeshModelingFunctions.h`

Geometry Script Mesh Offset Faces Options

**Properties** (6):
  - `area_mode`: `GeometryScriptPolyOperationArea` — [Read-Write] (GeometryScriptPolyOperationArea)
  - `distance`: `float` — [Read-Write] (float)
  - `group_options`: `GeometryScriptMeshEditPolygroupOptions` — [Read-Write] (GeometryScriptMeshEditPolygroupOptions)
  - `offset_type`: `GeometryScriptOffsetFacesType` — [Read-Write] (GeometryScriptOffsetFacesType)
  - `solids_to_shells`: `bool` — [Read-Write] (bool)
  - `uv_scale`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptMeshOffsetOptions`
Inherits: `StructBase` | Header: `MeshModelingFunctions.h`

Geometry Script Mesh Offset Options

**Properties** (6):
  - `boundary_alpha`: `float` — [Read-Write] should not be > 0.9 (float)
  - `fixed_boundary`: `bool` — [Read-Write] (bool)
  - `offset_distance`: `float` — [Read-Write] (float)
  - `reproject_during_smoothing`: `bool` — [Read-Write] (bool)
  - `smooth_alpha`: `float` — [Read-Write] (float)
  - `solve_steps`: `int` — [Read-Write] (int32)

### `unreal.GeometryScriptMeshPlaneCutOptions`
Inherits: `StructBase` | Header: `MeshBooleanFunctions.h`

Geometry Script Mesh Plane Cut Options

**Properties** (5):
  - `fill_holes`: `bool` — [Read-Write] (bool)
  - `fill_spans`: `bool` — [Read-Write] (bool)
  - `flip_cut_side`: `bool` — [Read-Write] (bool)
  - `hole_fill_material_id`: `int` — [Read-Write] If non-negative and bFillHoles is true, specify the material ID to set on hole fill tri...
  - `uv_world_dimension`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptMeshPlaneSliceOptions`
Inherits: `StructBase` | Header: `MeshBooleanFunctions.h`

Geometry Script Mesh Plane Slice Options

**Properties** (5):
  - `fill_holes`: `bool` — [Read-Write] (bool)
  - `fill_spans`: `bool` — [Read-Write] (bool)
  - `gap_width`: `float` — [Read-Write] (float)
  - `hole_fill_material_id`: `int` — [Read-Write] If non-negative and bFillHoles is true, specify the material ID to set on hole fill tri...
  - `uv_world_dimension`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptMeshPointSamplingOptions`
Inherits: `StructBase` | Header: `MeshSamplingFunctions.h`

Geometry Script Mesh Point Sampling Options

**Properties** (5):
  - `max_num_samples`: `int` — [Read-Write] Maximum number of samples requested. If 0 or default value, mesh will be maximally samp...
  - `random_seed`: `int` — [Read-Write] Random Seed used to initialize sampling strategies (int32)
  - `sampling_method_version`: `int` — [Read-Write] If < 0, the latest, recommended sampling methods will be used. Otherwise, requests a sp...
  - `sampling_radius`: `float` — [Read-Write] Desired âradiusâ of sample points. Spacing between samples is at least 2x this valu...
  - `sub_sample_density`: `float` — [Read-Write] Density of subsampling used in Poisson strategy. Larger numbers mean âmore accurateâ...

### `unreal.GeometryScriptMeshProjectionSettings`
Inherits: `StructBase` | Header: `MeshUVFunctions.h`

Geometry Script Mesh Projection Settings

**Properties** (4):
  - `process_all_if_empty_selection`: `bool` — [Read-Write] If selection contains no triangles, project all triangles (for both source and target) ...
  - `projection_range_max`: `float` — [Read-Write] Maximum projection distance (float)
  - `projection_range_min`: `float` — [Read-Write] Minimum projection distance. If negative, will also consider projection backwards, and ...
  - `reset_u_vs_for_unmatched`: `bool` — [Read-Write] Whether to reset UVs for triangles where projection failed. Otherwise UVs are left as-i...

### `unreal.GeometryScriptMeshReadLOD`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script Mesh Read LOD

**Properties** (2):
  - `lod_index`: `int` — [Read-Write] (int32)
  - `lod_type`: `GeometryScriptLODType` — [Read-Write] (GeometryScriptLODType)

### `unreal.GeometryScriptMeshSelection`
Inherits: `StructBase` | Header: `GeometryScriptSelectionTypes.h`

FGeometryScriptMeshSelection is a container for a Mesh Selection used in Geometry Script. The actual selection representation is not exposed to BP, use functions in MeshSelectionFunctions/etc to manip...

**Methods** (3):
  - `combine_mesh_selections(selection_b, combine_mode = GeometryScriptCombineSelectionMode.ADD)` -> `GeometryScriptMeshSelection` — Combine two Mesh Selections into a new Mesh Selection. The two inputs SelectionA and SelectionB must have the same Type.
  - `debug_print_mesh_selection(disable = False)` -> `None` — Print information about the Mesh Selection to the Output Log
  - `get_mesh_selection_info(num_selected=int32)` — Query information about a Mesh Selection Note that NumSelected may double count some polygroups and (non-border) edges d...

### `unreal.GeometryScriptMeshSelfUnionOptions`
Inherits: `StructBase` | Header: `MeshBooleanFunctions.h`

Geometry Script Mesh Self Union Options

**Properties** (5):
  - `fill_holes`: `bool` — [Read-Write] (bool)
  - `simplify_output`: `bool` — [Read-Write] (bool)
  - `simplify_planar_tolerance`: `float` — [Read-Write] (float)
  - `trim_flaps`: `bool` — [Read-Write] (bool)
  - `winding_threshold`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptMeshWriteLOD`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script Mesh Write LOD

**Properties** (2):
  - `lod_index`: `int` — [Read-Write] (int32)
  - `write_hi_res_source`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptMorphologyOptions`
Inherits: `StructBase` | Header: `MeshVoxelFunctions.h`

Geometry Script Morphology Options

**Properties** (6):
  - `custom_bounds`: `Box` — [Read-Write] If valid, will be used to define the region of space to operate on.
Otherwise, standard...
  - `distance`: `float` — [Read-Write] (float)
  - `mesh_grid_parameters`: `GeometryScript3DGridParameters` — [Read-Write] (GeometryScript3DGridParameters)
  - `operation`: `GeometryScriptMorphologicalOpType` — [Read-Write] (GeometryScriptMorphologicalOpType)
  - `sdf_grid_parameters`: `GeometryScript3DGridParameters` — [Read-Write] (GeometryScript3DGridParameters)
  - `use_separate_mesh_grid`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptNaniteOptions`
Inherits: `StructBase` | Header: `MeshAssetFunctions.h`

Configuration settings for Nanite Rendering on StaticMesh Assets

**Properties** (3):
  - `enabled`: `bool` — [Read-Write] Set Nanite to Enabled/Disabled (bool)
  - `fallback_percent_triangles`: `float` — [Read-Write] Percentage of triangles to maintain in Fallback Mesh used when Nanite is unavailable (f...
  - `fallback_relative_error`: `float` — [Read-Write] Relative Error to maintain in Fallback Mesh used when Nanite is unavailable. Overrides ...

### `unreal.GeometryScriptNonUniformPointSamplingOptions`
Inherits: `StructBase` | Header: `MeshSamplingFunctions.h`

Geometry Script Non Uniform Point Sampling Options

**Properties** (5):
  - `invert_weights`: `bool` — [Read-Write] If true, weight values are inverted (bool)
  - `max_sampling_radius`: `float` — [Read-Write] If MaxSampleRadius > SampleRadius, then output sample radius will be in range [SampleRa...
  - `size_distribution`: `GeometryScriptSamplingDistributionMode` — [Read-Write] SizeDistribution setting controls the distribution of sample radii (GeometryScriptSampl...
  - `size_distribution_power`: `float` — [Read-Write] SizeDistributionPower is used to control how extreme the Size Distribution shift is. Va...
  - `weight_mode`: `GeometryScriptSamplingWeightMode` — [Read-Write] WeightMode controls how any active Weight scheme is used to affect sample radius (Geome...

### `unreal.GeometryScriptOpenPathOffsetOptions`
Inherits: `StructBase` | Header: `PolygonFunctions.h`

Geometry Script Open Path Offset Options

**Properties** (5):
  - `end_type`: `GeometryScriptPathOffsetEndType` — [Read-Write] How the ends of a path should be closed off (GeometryScriptPathOffsetEndType)
  - `join_type`: `GeometryScriptPolyOffsetJoinType` — [Read-Write] How to join / extend corners between two edges (GeometryScriptPolyOffsetJoinType)
  - `maximum_steps_per_radian`: `float` — [Read-Write] Maximum vertices per radian for round joins and ends. Only applied if > 0. (double)
  - `miter_limit`: `float` — [Read-Write] if JoinType is Miter, limits how far the miter can extend (double)
  - `steps_per_radian_scale`: `float` — [Read-Write] Scales the default number of vertices (per radian) used for round joins and ends. (doub...

### `unreal.GeometryScriptPatchBuilderOptions`
Inherits: `StructBase` | Header: `MeshUVFunctions.h`

Geometry Script Patch Builder Options

**Properties** (10):
  - `auto_pack`: `bool` — [Read-Write] (bool)
  - `exp_map_options`: `GeometryScriptExpMapUVOptions` — [Read-Write] (GeometryScriptExpMapUVOptions)
  - `group_layer`: `GeometryScriptGroupLayer` — [Read-Write] (GeometryScriptGroupLayer)
  - `initial_patch_count`: `int` — [Read-Write] (int32)
  - `min_patch_size`: `int` — [Read-Write] (int32)
  - `packing_options`: `GeometryScriptRepackUVsOptions` — [Read-Write] (GeometryScriptRepackUVsOptions)
  - `patch_curvature_alignment_weight`: `float` — [Read-Write] (float)
  - `patch_merging_angle_thresh`: `float` — [Read-Write] (float)
  - `patch_merging_metric_thresh`: `float` — [Read-Write] (float)
  - `respect_input_groups`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptPerlinNoiseLayerOptions`
Inherits: `StructBase` | Header: `MeshDeformFunctions.h`

Geometry Script Perlin Noise Layer Options

**Properties** (4):
  - `frequency`: `float` — [Read-Write] (float)
  - `frequency_shift`: `Vector` — [Read-Write] (Vector)
  - `magnitude`: `float` — [Read-Write] (float)
  - `random_seed`: `int` — [Read-Write] (int32)

### `unreal.GeometryScriptPerlinNoiseOptions`
Inherits: `StructBase` | Header: `MeshDeformFunctions.h`

Geometry Script Perlin Noise Options

**Properties** (3):
  - `apply_along_normal`: `bool` — [Read-Write] (bool)
  - `base_layer`: `GeometryScriptPerlinNoiseLayerOptions` — [Read-Write] (GeometryScriptPerlinNoiseLayerOptions)
  - `empty_behavior`: `GeometryScriptEmptySelectionBehavior` — [Read-Write] EmptyBehavior Defines how an empty input selection should be interpreted (GeometryScrip...

### `unreal.GeometryScriptPlanarSimplifyOptions`
Inherits: `StructBase` | Header: `MeshSimplifyFunctions.h`

Geometry Script Planar Simplify Options

**Properties** (2):
  - `angle_threshold`: `float` — [Read-Write] (float)
  - `auto_compact`: `bool` — [Read-Write] If enabled, the simplified mesh is automatically compacted to remove gaps in the index ...

### `unreal.GeometryScriptPNTessellateOptions`
Inherits: `StructBase` | Header: `MeshSubdivideFunctions.h`

PN Tessellate options

**Properties** (1):
  - `recompute_normals`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptPointClusteringOptions`
Inherits: `StructBase` | Header: `PointSetFunctions.h`

Geometry Script Point Clustering Options

**Properties** (5):
  - `initial_cluster_centers`: `None` — [Read-Write] If not empty, will be used instead of Target Num Clusters. Specifies the initial cluste...
  - `initialize_method`: `GeometryScriptInitKMeansMethod` — [Read-Write] Method to initialize the cluster centers, if Initial Cluster Centers is empty (Geometry...
  - `max_iterations`: `int` — [Read-Write] Maximum iterations to run the clustering process. Will stop earlier if/when clustering ...
  - `random_seed`: `int` — [Read-Write] Random Seed used to initialize clustering, if the Random cluster initialization is chos...
  - `target_num_clusters`: `int` — [Read-Write] Number of clusters requested, if Initial Cluster Centers is empty. Actual clusters gene...

### `unreal.GeometryScriptPointFlatteningOptions`
Inherits: `StructBase` | Header: `PointSetFunctions.h`

Geometry Script Point Flattening Options

**Properties** (2):
  - `drop_axis`: `GeometryScriptAxis` — [Read-Write] Which axis to drop when flattening (GeometryScriptAxis)
  - `frame`: `Transform` — [Read-Write] Relative transform to use as a frame of reference. When flattening, the inverse transfo...

### `unreal.GeometryScriptPointPriorityOptions`
Inherits: `StructBase` | Header: `PointSetFunctions.h`

Geometry Script Point Priority Options

**Properties** (2):
  - `optional_priority_weights`: `None` — [Read-Write] If not empty, will be used to order the points so that higher-priority points are kept....
  - `uniform_spacing`: `bool` — [Read-Write] Whether to ensure the kept points are approximately uniformly spaced (bool)

### `unreal.GeometryScriptPolygonOffsetOptions`
Inherits: `StructBase` | Header: `PolygonFunctions.h`

Geometry Script Polygon Offset Options

**Properties** (5):
  - `join_type`: `GeometryScriptPolyOffsetJoinType` — [Read-Write] How to join / extend corners between two edges (GeometryScriptPolyOffsetJoinType)
  - `maximum_steps_per_radian`: `float` — [Read-Write] Maximum vertices per radian for round joins. Only applied if > 0. (double)
  - `miter_limit`: `float` — [Read-Write] if JoinType is Miter, limits how far the miter can extend (double)
  - `offset_both_sides`: `bool` — [Read-Write] Whether to apply the offset to both sides of the polygon, i.e. adding an inner hole to ...
  - `steps_per_radian_scale`: `float` — [Read-Write] Scales the default number of vertices (per radian) used for round joins. (double)

### `unreal.GeometryScriptPolygonsTriangulationOptions`
Inherits: `StructBase` | Header: `MeshPrimitiveFunctions.h`

Geometry Script Polygons Triangulation Options

**Properties** (1):
  - `still_append_on_triangulation_error`: `bool` — [Read-Write] Whether to still append the triangulation in error cases â typically, cases where the...

### `unreal.GeometryScriptPolygroupSimplifyOptions`
Inherits: `StructBase` | Header: `MeshSimplifyFunctions.h`

Geometry Script Polygroup Simplify Options

**Properties** (2):
  - `angle_threshold`: `float` — [Read-Write] (float)
  - `auto_compact`: `bool` — [Read-Write] If enabled, the simplified mesh is automatically compacted to remove gaps in the index ...

### `unreal.GeometryScriptPolyPath`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script Poly Path

**Methods** (9):
  - `convert_poly_path_to_array()` -> `Array [ Vector ]` — Populates an array of 3D vectors with the PolyPath vertex locations.
  - `convert_poly_path_to_array_of_vector2d()` -> `Array [ Vector2D ]` — Creates an array of 2D Vectors with the PolyPath vertex locations projected onto the XY plane.
  - `flatten_to2d_on_axis(drop_axis = GeometryScriptAxis.Z)` -> `GeometryScriptPolyPath` — Create a 2D, flattened copy of the path by dropping the given axis, and using the other two coordinates as the new X, Y ...
  - `get_nearest_vertex_index(point)` -> `int32` — Find the index of the vertex closest to a given point. Returns -1 if the PolyPath has no vertices.
  - `get_poly_path_arc_length()` -> `double` — Returns the length of the PolyPath.
  - `get_poly_path_last_index()` -> `int32` — Returns the index of the last vertex in the PolyPath.
  - `get_poly_path_num_vertices()` -> `int32` — Returns the number of vertices in the the PolyPath.
  - `get_poly_path_tangent(is_valid_index=bool)` — Returns the local tangent vector of the PolyPath at the specified vertex index. If the Index does not correspond to a ve...
  - `get_poly_path_vertex(is_valid_index=bool)` — Returns the 3D position of the requested vertex in the PolyPath. If the Index does not correspond to a vertex in the Pol...

### `unreal.GeometryScriptPrimitiveOptions`
Inherits: `StructBase` | Header: `MeshPrimitiveFunctions.h`

Geometry Script Primitive Options

**Properties** (4):
  - `flip_orientation`: `bool` — [Read-Write] (bool)
  - `material_id`: `int` — [Read-Write] Material ID to set on primitive mesh triangles (int32)
  - `polygroup_mode`: `GeometryScriptPrimitivePolygroupMode` — [Read-Write] (GeometryScriptPrimitivePolygroupMode)
  - `uv_mode`: `GeometryScriptPrimitiveUVMode` — [Read-Write] (GeometryScriptPrimitiveUVMode)

### `unreal.GeometryScriptPruneBoneWeightsOptions`
Inherits: `StructBase` | Header: `MeshBoneWeightFunctions.h`

Geometry Script Prune Bone Weights Options

**Properties** (2):
  - `ignored_invalid_bones`: `bool` — [Read-Write] Ignore invalid bones. Otherwise, if invalid bones are given, the operation terminates w...
  - `reassignment_type`: `GeometryScriptPruneBoneWeightsAssignmentType` — [Read-Write] Specifies how the weight of the removed bone from a vertexâs bone weights list gets r...

### `unreal.GeometryScriptRayHitResult`
Inherits: `StructBase` | Header: `MeshSpatialFunctions.h`

Geometry Script Ray Hit Result

**Properties** (5):
  - `hit`: `bool` — [Read-Write] (bool)
  - `hit_bary_coords`: `Vector` — [Read-Write] (Vector)
  - `hit_position`: `Vector` — [Read-Write] (Vector)
  - `hit_triangle_id`: `int` — [Read-Write] (int32)
  - `ray_parameter`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptRecomputeUVsOptions`
Inherits: `StructBase` | Header: `MeshUVFunctions.h`

Geometry Script Recompute UVs Options

**Properties** (6):
  - `auto_align_islands_with_axes`: `bool` — [Read-Write] (bool)
  - `exp_map_options`: `GeometryScriptExpMapUVOptions` — [Read-Write] (GeometryScriptExpMapUVOptions)
  - `group_layer`: `GeometryScriptGroupLayer` — [Read-Write] (GeometryScriptGroupLayer)
  - `island_source`: `GeometryScriptUVIslandSource` — [Read-Write] (GeometryScriptUVIslandSource)
  - `method`: `GeometryScriptUVFlattenMethod` — [Read-Write] (GeometryScriptUVFlattenMethod)
  - `spectral_conformal_options`: `GeometryScriptSpectralConformalUVOptions` — [Read-Write] (GeometryScriptSpectralConformalUVOptions)

### `unreal.GeometryScriptRemeshOptions`
Inherits: `StructBase` | Header: `MeshRemeshFunctions.h`

Standard Remeshing Options

**Properties** (15):
  - `allow_collapses`: `bool` — [Read-Write] Enable/Disable Edge Collapses during Remeshing. Disabling Collapses will prevent the me...
  - `allow_flips`: `bool` — [Read-Write] Enable/Disable Edge Flips during Remeshing. Disabling flips will significantly reduce t...
  - `allow_splits`: `bool` — [Read-Write] Enable/Disable Edge Splits during Remeshing. Disabling Splits will prevent the mesh den...
  - `auto_compact`: `bool` — [Read-Write] If enabled, the output mesh is automatically compacted to remove gaps in the index spac...
  - `discard_attributes`: `bool` — [Read-Write] When enabled, all mesh attributes are discarded, so UV and Normal Seams can be ignored....
  - `group_boundary_constraint`: `GeometryScriptRemeshEdgeConstraintType` — [Read-Write] Constraints on the mesh boundary/border edges between different PolyGroups of the Mesh ...
  - `material_boundary_constraint`: `GeometryScriptRemeshEdgeConstraintType` — [Read-Write] Constraints on the mesh boundary/border edges between different Material Results of the...
  - `mesh_boundary_constraint`: `GeometryScriptRemeshEdgeConstraintType` — [Read-Write] Constraints on the open mesh boundary/border edges (GeometryScriptRemeshEdgeConstraintT...
  - `prevent_normal_flips`: `bool` — [Read-Write] When Enabled, Flips and Collapses will be skipped if they would flip any triangle face ...
  - `prevent_tiny_triangles`: `bool` — [Read-Write] When Enabled, Flips and Collapses will be skipped if they would create tiny degenerate ...
  - `remesh_iterations`: `int` — [Read-Write] Maximum Number of iterations of the Remeshing Strategy to apply to the Mesh. More itera...
  - `reproject_to_input_mesh`: `bool` — [Read-Write] When enabled, mesh vertices are projected back onto the input mesh surface during Remes...
  - `smoothing_rate`: `float` — [Read-Write] Smoothing Rate/Speed. Faster Smoothing results in a more regular mesh, but also more po...
  - `smoothing_type`: `GeometryScriptRemeshSmoothingType` — [Read-Write] Type of 3D Mesh Smoothing to apply during Remeshing. Disable by setting SmoothingRate =...
  - `use_full_remesh_passes`: `bool` — [Read-Write] By default, remeshing is accelerated by tracking a queue of edges that need to be proce...

### `unreal.GeometryScriptRemoveHiddenTrianglesOptions`
Inherits: `StructBase` | Header: `MeshRepairFunctions.h`

Geometry Script Remove Hidden Triangles Options

**Properties** (7):
  - `compact_result`: `bool` — [Read-Write] (bool)
  - `method`: `GeometryScriptRemoveHiddenTrianglesMethod` — [Read-Write] (GeometryScriptRemoveHiddenTrianglesMethod)
  - `normal_offset`: `float` — [Read-Write] Nudge sample points out by this amount to try to counteract numerical issues (float)
  - `rays_per_sample`: `int` — [Read-Write] random rays to add beyond +/- major axes, for raycast sampling (int32)
  - `samples_per_triangle`: `int` — [Read-Write] add triangle samples per triangle (in addition to TriangleSamplingMethod) (int32)
  - `shrink_selection`: `int` — [Read-Write] once triangles to remove are identified, do iterations of boundary erosion, ie contract...
  - `winding_iso_value`: `float` — [Read-Write] use this as winding isovalue for WindingNumber mode (float)

### `unreal.GeometryScriptRemoveSmallComponentOptions`
Inherits: `StructBase` | Header: `MeshRepairFunctions.h`

Geometry Script Remove Small Component Options

**Properties** (3):
  - `min_area`: `float` — [Read-Write] (float)
  - `min_triangle_count`: `int` — [Read-Write] (int32)
  - `min_volume`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptRenderCaptureCamera`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Render Capture data structures

**Properties** (5):
  - `field_of_view_degrees`: `float` — [Read-Write] (double)
  - `near_plane_dist`: `float` — [Read-Write] (double)
  - `resolution`: `int` — [Read-Write] The pixel resolution of render capture photo set, this value is used for width and heig...
  - `view_direction`: `Vector` — [Read-Write] (Vector)
  - `view_position`: `Vector` — [Read-Write] (Vector)

### `unreal.GeometryScriptRenderCaptureCamerasForBoxOptions`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script Render Capture Cameras for Box Options

**Properties** (9):
  - `extra_view_from_positions`: `None` — [Read-Write] Extra positions from which to deduce view directions on the box center (located at (0,0...
  - `field_of_view_degrees`: `float` — [Read-Write] (double)
  - `resolution`: `int` — [Read-Write] The pixel resolution of render capture photos, this value is used for width and height ...
  - `view_from_box_faces`: `bool` — [Read-Write] Enable 6 directions corresponding to views from box face centers to the box center (boo...
  - `view_from_lower_corners`: `bool` — [Read-Write] Enable 4 directions corresponding to views from box lower corners to the box center (bo...
  - `view_from_lower_edges`: `bool` — [Read-Write] Enable 4 directions corresponding to views from box lower edges centers to the box cent...
  - `view_from_side_edges`: `bool` — [Read-Write] Enable 4 directions corresponding to views from box side edges centers to the box cente...
  - `view_from_upper_corners`: `bool` — [Read-Write] Enable 4 directions corresponding to views from box upper corners to the box center (bo...
  - `view_from_upper_edges`: `bool` — [Read-Write] Enable 4 directions corresponding to views from box upper edges centers to the box cent...

### `unreal.GeometryScriptRenderCaptureTextures`
Inherits: `StructBase` | Header: `MeshBakeFunctions.h`

Geometry Script Render Capture Textures

**Properties** (18):
  - `base_color_map`: `Texture2D` — [Read-Write] (Texture2D)
  - `emissive_map`: `Texture2D` — [Read-Write] (Texture2D)
  - `has_base_color_map`: `bool` — [Read-Write] (bool)
  - `has_emissive_map`: `bool` — [Read-Write] (bool)
  - `has_metallic_map`: `bool` — [Read-Write] (bool)
  - `has_normal_map`: `bool` — [Read-Write] (bool)
  - `has_opacity_map`: `bool` — [Read-Write] (bool)
  - `has_packed_mrs_map`: `bool` — [Read-Write] (bool)
  - `has_roughness_map`: `bool` — [Read-Write] (bool)
  - `has_specular_map`: `bool` — [Read-Write] (bool)
  - `has_subsurface_color_map`: `bool` — [Read-Write] (bool)
  - `metallic_map`: `Texture2D` — [Read-Write] (Texture2D)
  - `normal_map`: `Texture2D` — [Read-Write] (Texture2D)
  - `opacity_map`: `Texture2D` — [Read-Write] (Texture2D)
  - `packed_mrs_map`: `Texture2D` — [Read-Write] (Texture2D)
  - `roughness_map`: `Texture2D` — [Read-Write] (Texture2D)
  - `specular_map`: `Texture2D` — [Read-Write] (Texture2D)
  - `subsurface_color_map`: `Texture2D` — [Read-Write] (Texture2D)

### `unreal.GeometryScriptRepackUVsOptions`
Inherits: `StructBase` | Header: `MeshUVFunctions.h`

Geometry Script Repack UVs Options

**Properties** (2):
  - `optimize_island_rotation`: `bool` — [Read-Write] (bool)
  - `target_image_width`: `int` — [Read-Write] (int32)

### `unreal.GeometryScriptResolveTJunctionOptions`
Inherits: `StructBase` | Header: `MeshRepairFunctions.h`

Geometry Script Resolve TJunction Options

**Properties** (1):
  - `tolerance`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptRevolveOptions`
Inherits: `StructBase` | Header: `MeshPrimitiveFunctions.h`

Geometry Script Revolve Options

**Properties** (7):
  - `degree_offset`: `float` — [Read-Write] (float)
  - `fill_partial_revolve_endcaps`: `bool` — [Read-Write] (bool)
  - `hard_normal_angle`: `float` — [Read-Write] (float)
  - `hard_normals`: `bool` — [Read-Write] (bool)
  - `profile_at_midpoint`: `bool` — [Read-Write] (bool)
  - `reverse_direction`: `bool` — [Read-Write] (bool)
  - `revolve_degrees`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptSampleTextureOptions`
Inherits: `StructBase` | Header: `TextureMapFunctions.h`

Geometry Script Sample Texture Options

**Properties** (4):
  - `sampling_method`: `GeometryScriptPixelSamplingMethod` — [Read-Write] (GeometryScriptPixelSamplingMethod)
  - `uv_offset`: `Vector2D` — [Read-Write] (Vector2D)
  - `uv_scale`: `Vector2D` — [Read-Write] (Vector2D)
  - `wrap`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptScalarList`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script Scalar List

**Methods** (15):
  - `clear_scalar_list(clear_value = 0.000000)` -> `None` — Resets all the items in the Scalar List to the Clear Value.
  - `convert_scalar_list_to_array()` -> `Array [ double ]` — Converts a Scalar List to an Scalar Array (an array of doubles).
  - `duplicate_scalar_list()` -> `GeometryScriptScalarList` — Copies the contents of Scalar List into Duplicate List.
  - `get_scalar_list_item(is_valid_index=bool)` — Returns the Scalar value associated with Index in Scalar List. If the Index is not valid for this Scalar List, the value...
  - `get_scalar_list_last_index()` -> `int32` — Returns the index of the last Scalar in Scalar List. If Scalar List is empty or invalid, the value -1 will be returned
  - `get_scalar_list_length()` -> `int32` — Returns the number of items in the Scalar List.
  - `scalar_blend(scalar_list_b, constant_a = 1.000000, constant_b = 1.000000)` -> `GeometryScriptScalarList` — Compute (ConstantA * A) + (ConstantB * B) for each pair of values in ScalarListA and ScalarListB and return in new Scala...
  - `scalar_blend_in_place(scalar_list_b, constant_a = 1.000000, constant_b = 1.000000)` -> `GeometryScriptScalarList` — Compute (ConstantA * A) + (ConstantB * B) for each pair of values in ScalarListA and ScalarListB and return in ScalarLis...
  - `scalar_invert(numerator = 1.000000, set_on_failure = 0.000000, epsilon = 0.000000)` -> `GeometryScriptScalarList` — Compute (Numerator / Scalar) for each element of ScalarList and return in a new ScalarList. If Abs(Scalar) < Epsilon, se...
  - `scalar_invert_in_place(numerator = 1.000000, set_on_failure = 0.000000, epsilon = 0.000000)` -> `None` — Compute (Numerator / Scalar) for each element of ScalarList and store in input ScalarList If Abs(Scalar) < Epsilon, set ...
  - `scalar_multiply(scalar_list_b, constant_multiplier = 1.000000)` -> `GeometryScriptScalarList` — Returns a Scalar List constructed with each element is the product (ConstantMultiplier * A * B) where A and B are the co...
  - `scalar_multiply_in_place(scalar_list_b, constant_multiplier = 1.000000)` -> `GeometryScriptScalarList` — Compute (ConstantMultiplier * A * B) where A and B are the corresponding elements from ScalarListA and ScalarListB accor...
  - `scalar_vector_multiply(vector_list, scalar_multiplier = 1.000000)` -> `GeometryScriptVectorList` — Compute (ScalarMultiplier * Scalar * Vector) for each scalar/vector pair in the two input lists, and return in a new Vec...
  - `scalar_vector_multiply_in_place(vector_list, scalar_multiplier = 1.000000)` -> `GeometryScriptVectorList` — Compute (ScalarMultiplier * Scalar * Vector) for each scalar/vector pair in the two input lists, and store in the input ...
  - `set_scalar_list_item(index, new_value)` -> `bool` — Updates the value associated with Index in the Scalar List. If the Index is invalid, the operation will fail and bValidI...

### `unreal.GeometryScriptSculptLayerUpdateOptions`
Inherits: `StructBase` | Header: `MeshSculptLayersFunctions.h`

Geometry Script Sculpt Layer Update Options

**Properties** (1):
  - `recompute_normals`: `bool` — [Read-Write] Whether to recompute normals when changes to sculpt layers may have changed the mesh ve...

### `unreal.GeometryScriptSelectiveTessellateOptions`
Inherits: `StructBase` | Header: `MeshSubdivideFunctions.h`

Geometry Script Selective Tessellate Options

**Properties** (2):
  - `empty_behavior`: `GeometryScriptEmptySelectionBehavior` — [Read-Write] EmptyBehavior Defines how an empty input selection should be interpreted (GeometryScrip...
  - `enable_multithreading`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptSetSimpleCollisionOptions`
Inherits: `StructBase` | Header: `CollisionFunctions.h`

Geometry Script Set Simple Collision Options

**Properties** (1):
  - `emit_transaction`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptSetStaticMeshCollisionOptions`
Inherits: `StructBase` | Header: `CollisionFunctions.h`

Geometry Script Set Static Mesh Collision Options

**Properties** (1):
  - `mark_as_customized`: `bool` — [Read-Write] Whether to mark the static mesh collision as customized when it is set, so that it will...

### `unreal.GeometryScriptSimpleCollision`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Holds simple shapes that can be used for collision

**Methods** (4):
  - `approximate_convex_hulls_with_simpler_collision_shapes(approximate_options, debug = None)` -> `bool` — Attempt to approximate any convex hulls in the given simple collision representation. Updates the passed-in Simple Colli...
  - `combine_simple_collision(append_collision, debug = None)` -> `None`
  - `get_simple_collision_shape_count()` -> `int32`
  - `simplify_convex_hulls(simplify_options, debug = None)` -> `bool` — Simplify any convex hulls in the given simple collision representation. Updates the passed-in Simple Collision.

### `unreal.GeometryScriptSimpleCollisionTriangulationOptions`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Settings to control the triangulation of simple collision primitives â used for conversion to mesh or convex hull geometry

**Properties** (4):
  - `approximate_level_sets_with_cubes`: `bool` — [Read-Write] Whether to cheaply approximate level sets with cubes. Otherwise, will use marching cube...
  - `capsule_circle_steps`: `int` — [Read-Write] When triangulating a capsule, number of vertices to use for the circular cross-sections...
  - `capsule_hemisphere_steps`: `int` — [Read-Write] When triangulating a capsuleâs spherical endcaps, number of vertices to use on the ar...
  - `sphere_steps_per_side`: `int` — [Read-Write] When triangulating a sphere by deforming a cube to the sphere, number of vertices to us...

### `unreal.GeometryScriptSimpleMeshBuffers`
Inherits: `StructBase` | Header: `MeshBasicEditFunctions.h`

Geometry Script Simple Mesh Buffers

**Properties** (13):
  - `normals`: `None` — [Read-Write] (Array[Vector])
  - `tri_group_i_ds`: `None` — [Read-Write] (Array[int32])
  - `triangles`: `None` — [Read-Write] (Array[IntVector])
  - `uv0`: `None` — [Read-Write] (Array[Vector2D])
  - `uv1`: `None` — [Read-Write] (Array[Vector2D])
  - `uv2`: `None` — [Read-Write] (Array[Vector2D])
  - `uv3`: `None` — [Read-Write] (Array[Vector2D])
  - `uv4`: `None` — [Read-Write] (Array[Vector2D])
  - `uv5`: `None` — [Read-Write] (Array[Vector2D])
  - `uv6`: `None` — [Read-Write] (Array[Vector2D])
  - `uv7`: `None` — [Read-Write] (Array[Vector2D])
  - `vertex_colors`: `None` — [Read-Write] (Array[LinearColor])
  - `vertices`: `None` — [Read-Write] (Array[Vector])

### `unreal.GeometryScriptSimplePolygon`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

A simple 2D Polygon with no holes

**Methods** (9):
  - `add_polygon_vertex(position)` -> `int32` — Set the specified vertex of a Simple Polygon. Returns the index of the added vertex.
  - `create_polygon_list_from_single_polygon(hole_polygons, fix_hole_orientations = True)` -> `GeometryScriptGeneralPolygonList` — Create a Polygon List of a single Polygon, with optional holes
  - `get_polygon_arc_length()` -> `double` — Returns the arc length of a Simple Polygon
  - `get_polygon_area()` -> `double` — Returns the area enclosed by a Simple Polygon
  - `get_polygon_bounds()` -> `Box2D` — Returns the bounding box of a Simple Polygon
  - `get_polygon_tangent(polygon_is_empty=bool)` — Returns a vertexâs tangent of a Simple Polygon. VertexIndex loops around, so e.g., -1 gives the tangent of the last ve...
  - `get_polygon_vertex(polygon_is_empty=bool)` — Returns the specified vertex of a Simple Polygon. VertexIndex loops around, so e.g., -1 gives the last vertex in the pol...
  - `get_polygon_vertex_count()` -> `int32` — Returns the number of vertices in a Simple Polygon
  - `set_polygon_vertex(vertex_index, position)` -> `bool` — Set the specified vertex of a Simple Polygon. VertexIndex loops around, so e.g., -1 gives the last vertex in the polygon...

### `unreal.GeometryScriptSimplifyMeshOptions`
Inherits: `StructBase` | Header: `MeshSimplifyFunctions.h`

Geometry Script Simplify Mesh Options

**Properties** (7):
  - `allow_seam_collapse`: `bool` — [Read-Write] (bool)
  - `allow_seam_smoothing`: `bool` — [Read-Write] (bool)
  - `allow_seam_splits`: `bool` — [Read-Write] (bool)
  - `auto_compact`: `bool` — [Read-Write] If enabled, the simplified mesh is automatically compacted to remove gaps in the index ...
  - `method`: `GeometryScriptRemoveMeshSimplificationType` — [Read-Write] (GeometryScriptRemoveMeshSimplificationType)
  - `preserve_vertex_positions`: `bool` — [Read-Write] (bool)
  - `retain_quadric_memory`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptSmoothBoneWeightsOptions`
Inherits: `StructBase` | Header: `MeshBoneWeightFunctions.h`

Geometry Script Smooth Bone Weights Options

**Properties** (4):
  - `distance_weighing_type`: `GeometryScriptSmoothBoneWeightsType` — [Read-Write] The type of algorithm to use for computing the bone weight for each vertex (GeometryScr...
  - `max_influences`: `int` — [Read-Write] Maximum number of bones that contribute to each weight. Set to 1 for a completely rigid...
  - `stiffness`: `float` — [Read-Write] How rigid the binding should be. Higher values result in a more rigid binding (greater ...
  - `voxel_resolution`: `int` — [Read-Write] The resolution to build the voxelized representation of the mesh, for computing geodesi...

### `unreal.GeometryScriptSnapBoundariesOptions`
Inherits: `StructBase` | Header: `MeshRepairFunctions.h`

Geometry Script Snap Boundaries Options

**Properties** (3):
  - `max_iterations`: `int` — [Read-Write] Maximum number of iterations of boundary snapping to apply. Will stop earlier if an ite...
  - `snap_to_edges`: `bool` — [Read-Write] Whether to snap vertices to open edges. If false, will only snap together vertices (boo...
  - `tolerance`: `float` — [Read-Write] Snapping tolerance (float)

### `unreal.GeometryScriptSolidifyOptions`
Inherits: `StructBase` | Header: `MeshVoxelFunctions.h`

Geometry Script Solidify Options

**Properties** (8):
  - `custom_bounds`: `Box` — [Read-Write] If valid, will be used to define the region of space to operate on.
Otherwise, standard...
  - `extend_bounds`: `float` — [Read-Write] Amount to extend bounds, applied to both min and max extents. Only applied to default i...
  - `grid_parameters`: `GeometryScript3DGridParameters` — [Read-Write] (GeometryScript3DGridParameters)
  - `shell_thickness`: `float` — [Read-Write] Open Shells are Thickened by offsetting vertices along their averaged vertex normals by...
  - `solid_at_boundaries`: `bool` — [Read-Write] If the solid surface extends beyond the bounds provided, whether to close off the surfa...
  - `surface_search_steps`: `int` — [Read-Write] Number of search steps to take when finding the marching cubes surface vertex positions...
  - `thicken_shells`: `bool` — [Read-Write] When enabled, regions of the input mesh that have open boundaries (ie âshellsâ) are...
  - `winding_threshold`: `float` — [Read-Write] Space with generalized winding number higher than this threshold is considered to be in...

### `unreal.GeometryScriptSpatialQueryOptions`
Inherits: `StructBase` | Header: `MeshSpatialFunctions.h`

Geometry Script Spatial Query Options

**Properties** (3):
  - `allow_unsafe_modified_queries`: `bool` — [Read-Write] When true, allows the provided BHV to be used even if the mesh has been updated (bool)
  - `max_distance`: `float` — [Read-Write] (float)
  - `winding_iso_threshold`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptSpectralConformalUVOptions`
Inherits: `StructBase` | Header: `MeshUVFunctions.h`

Geometry Script Spectral Conformal UVOptions

**Properties** (1):
  - `preserve_irregularity`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptSphereCovering`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

A set of spheres used to represent a volume

### `unreal.GeometryScriptSplineSamplingOptions`
Inherits: `StructBase` | Header: `PolyPathFunctions.h`

Geometry Script Spline Sampling Options

**Properties** (7):
  - `coordinate_space`: `SplineCoordinateSpace` — [Read-Write] (SplineCoordinateSpace)
  - `error_tolerance`: `float` — [Read-Write] (float)
  - `num_samples`: `int` — [Read-Write] (int32)
  - `range_end`: `float` — [Read-Write] If not evaluating the full spline, where to stop sampling. Expressed in units based on ...
  - `range_method`: `GeometryScriptEvaluateSplineRange` — [Read-Write] How the RangeStart and RangeEnd parameters will be interpreted (GeometryScriptEvaluateS...
  - `range_start`: `float` — [Read-Write] If not evaluating the full spline, where to start sampling. Expressed in units based on...
  - `sample_spacing`: `GeometryScriptSampleSpacing` — [Read-Write] (GeometryScriptSampleSpacing)

### `unreal.GeometryScriptSplitNormalsOptions`
Inherits: `StructBase` | Header: `MeshNormalsFunctions.h`

Geometry Script Split Normals Options

**Properties** (4):
  - `group_layer`: `GeometryScriptGroupLayer` — [Read-Write] (GeometryScriptGroupLayer)
  - `opening_angle_deg`: `float` — [Read-Write] (float)
  - `split_by_face_group`: `bool` — [Read-Write] (bool)
  - `split_by_opening_angle`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptSweptHullOptions`
Inherits: `StructBase` | Header: `ContainmentFunctions.h`

Geometry Script Swept Hull Options

**Properties** (6):
  - `min_edge_length`: `float` — [Read-Write] (float)
  - `min_thickness`: `float` — [Read-Write] (float)
  - `prefilter_grid_resolution`: `int` — [Read-Write] (int32)
  - `prefilter_vertices`: `bool` — [Read-Write] (bool)
  - `simplify`: `bool` — [Read-Write] (bool)
  - `simplify_tolerance`: `float` — [Read-Write] (float)

### `unreal.GeometryScriptTangentsOptions`
Inherits: `StructBase` | Header: `MeshNormalsFunctions.h`

Geometry Script Tangents Options

**Properties** (2):
  - `type`: `GeometryScriptTangentTypes` — [Read-Write] (GeometryScriptTangentTypes)
  - `uv_layer`: `int` — [Read-Write] (int32)

### `unreal.GeometryScriptTransferBoneWeightsOptions`
Inherits: `StructBase` | Header: `MeshBoneWeightFunctions.h`

Geometry Script Transfer Bone Weights Options

**Properties** (10):
  - `inpaint_mask`: `Name` — [Read-Write] Optional weight attribute name where a non-zero value indicates that we want the skinni...
  - `layered_mesh_support`: `bool` — [Read-Write] If true, when the closest point doesnât pass the normal threshold test, will try agai...
  - `normal_threshold`: `float` — [Read-Write] Maximum angle (in degrees) difference between the target and the source point normals t...
  - `num_smoothing_iterations`: `int` — [Read-Write] The number of optional post-processing smoothing iterations applied to the vertices wit...
  - `output_target_mesh_bones`: `OutputTargetMeshBones` — [Read-Write] Chooses which bone attributes to use for transferring weights to the TargetMesh. (Outpu...
  - `radius_percentage`: `float` — [Read-Write] Defines the search radius as the RadiusPercentage * (input mesh bounding box diagonal)....
  - `smoothing_strength`: `float` — [Read-Write] The strength of each post-processing smoothing iteration. (float)
  - `source_profile`: `GeometryScriptBoneWeightProfile` — [Read-Write] The identifier for the source bone/skin weight profile used to transfer the weights fro...
  - `target_profile`: `GeometryScriptBoneWeightProfile` — [Read-Write] The identifier for the source bone/skin weight profile used to transfer the weights to....
  - `transfer_method`: `TransferBoneWeightsMethod` — [Read-Write] The type of algorithm to use for transferring the bone weights. (TransferBoneWeightsMet...

### `unreal.GeometryScriptTransferMeshVertexColorsOptions`
Inherits: `StructBase` | Header: `MeshVertexColorFunctions.h`

Geometry Script Transfer Mesh Vertex Colors Options

**Properties** (8):
  - `bias_ratio`: `float` — [Read-Write] Ratio used to blend a vertex between its position and the center of the face (0 = verte...
  - `hard_edges`: `bool` — [Read-Write] Creates vertex instances per triangle to be able to have per-face vertex colors. (bool)
  - `layered_mesh_support`: `bool` — [Read-Write] If true, when the closest point doesnât pass the normal threshold test, will try agai...
  - `normal_threshold`: `float` — [Read-Write] Maximum angle (in degrees) difference between the target and the source point normals t...
  - `num_smoothing_iterations`: `int` — [Read-Write] The number of optional post-processing smoothing iterations applied to the vertices wit...
  - `radius_percentage`: `float` — [Read-Write] Defines the search radius as the RadiusPercentage * (input mesh bounding box diagonal)....
  - `smoothing_strength`: `float` — [Read-Write] The strength of each post-processing smoothing iteration. (float)
  - `transfer_method`: `TransferVertexColorMethod` — [Read-Write] The type of algorithm to use for transferring the colors. (TransferVertexColorMethod)

### `unreal.GeometryScriptTransformCollisionOptions`
Inherits: `StructBase` | Header: `CollisionFunctions.h`

Geometry Script Transform Collision Options

**Properties** (2):
  - `center_transform_pivot_per_shape`: `bool` — [Read-Write] If true, we apply the Transform to each collision shape separately, and pivot the Trans...
  - `warn_on_invalid_transforms`: `bool` — [Read-Write] Whether to log a warning when a requested transform is not compatible with the simple c...

### `unreal.GeometryScriptTriangle`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Triangles

**Properties** (3):
  - `vector0`: `Vector` — [Read-Write] (Vector)
  - `vector1`: `Vector` — [Read-Write] (Vector)
  - `vector2`: `Vector` — [Read-Write] (Vector)

### `unreal.GeometryScriptTriangleList`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script Triangle List

**Methods** (4):
  - `convert_triangle_list_to_array()` -> `Array [ IntVector ]` — Converts Triangle List to Triangle Array by populating with the appropriate integer triplets.
  - `get_triangle_list_item(is_valid_triangle=bool)` — Returns the integer triplet associated with the index Triangle in the Triangle List. If Triangle is not valid for this T...
  - `get_triangle_list_last_triangle()` -> `int32` — Returns the index of the last element in the Triangle List. If the Triangle List is empty or invalid, the value 0 will b...
  - `get_triangle_list_length()` -> `int32` — Returns the number of Triangles in the Triangle list.

### `unreal.GeometryScriptTrianglePoint`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script Triangle Point

**Properties** (4):
  - `bary_coords`: `Vector` — [Read-Write] (Vector)
  - `position`: `Vector` — [Read-Write] (Vector)
  - `triangle_id`: `int` — [Read-Write] (int32)
  - `valid`: `bool` — [Read-Write] (bool)

### `unreal.GeometryScriptTwistWarpOptions`
Inherits: `StructBase` | Header: `MeshDeformFunctions.h`

Geometry Script Twist Warp Options

**Properties** (3):
  - `bidirectional`: `bool` — [Read-Write] If true, the Twist is âcenteredâ at the Origin, ie the regions on either side of th...
  - `lower_extent`: `float` — [Read-Write] Lower extent used when bSymmetricExtents = false (float)
  - `symmetric_extents`: `bool` — [Read-Write] Symmetric extents are [-BendExtent,BendExtent], if disabled, then [-LowerExtent,BendExt...

### `unreal.GeometryScriptUniformRemeshOptions`
Inherits: `StructBase` | Header: `MeshRemeshFunctions.h`

Uniform Remeshing Options

**Properties** (3):
  - `target_edge_length`: `float` — [Read-Write] Explicit Target Edge Length that is desired in the output uniform mesh (float)
  - `target_triangle_count`: `int` — [Read-Write] Approximate Target Triangle Count, combined with mesh surface area to derive a TargetEd...
  - `target_type`: `GeometryScriptUniformRemeshTargetType` — [Read-Write] Method used to define target/goal of Uniform Remeshing (GeometryScriptUniformRemeshTarg...

### `unreal.GeometryScriptUVList`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script UVList

**Methods** (7):
  - `clear_uv_list(clear_uv)` -> `None` — Resets all the items in the Vector List to the given Clear UV value.
  - `convert_uv_list_to_array()` -> `Array [ Vector2D ]` — Converts a UV List to an array of FVector2Ds (UV Array).
  - `duplicate_uv_list()` -> `GeometryScriptUVList` — Duplicates the contents of UV List into Duplicate List.
  - `get_uv_list_item(is_valid_index=bool)` — Returns the FVector2D stored in the UV List at the specified location. If the Index is not valid for this UV List, the Z...
  - `get_uv_list_last_index()` -> `int32` — Returns the index of the last item in the UV List. If UV List is empty or invalid, the value -1 will be returned.
  - `get_uv_list_length()` -> `int32` — Returns the number of items in the UV List.
  - `set_uv_list_item(index, new_uv)` -> `bool` — Updates the value of the FVector2D stored in the UV List at the specified location. If the Index is invalid, the operati...

### `unreal.GeometryScriptUVTexelDensityOptions`
Inherits: `StructBase` | Header: `MeshUVFunctions.h`

Geometry Script UVTexel Density Options

**Properties** (6):
  - `enable_udim_layout`: `bool` — [Read-Write] (bool)
  - `target_pixel_count`: `float` — [Read-Write] (float)
  - `target_world_units`: `float` — [Read-Write] (float)
  - `texel_density_mode`: `GeometryScriptTexelDensityMode` — [Read-Write] (GeometryScriptTexelDensityMode)
  - `texture_resolution`: `float` — [Read-Write] (float)
  - `udim_resolutions`: `None` — [Read-Write] (Map[int32, int32])

### `unreal.GeometryScriptUVTriangle`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script UVTriangle

**Properties** (3):
  - `uv0`: `Vector2D` — [Read-Write] (Vector2D)
  - `uv1`: `Vector2D` — [Read-Write] (Vector2D)
  - `uv2`: `Vector2D` — [Read-Write] (Vector2D)

### `unreal.GeometryScriptVectorList`
Inherits: `StructBase` | Header: `GeometryScriptTypes.h`

Geometry Script Vector List

**Methods** (17):
  - `clear_vector_list(clear_value = [0.000000,0.000000,0.000000])` -> `None` — Resets all the items in the Vector List to the Clear Value.
  - `convert_vector_list_to_array()` -> `Array [ Vector ]` — Converts Vector List to an array of FVectors (Vector Array).
  - `duplicate_vector_list()` -> `GeometryScriptVectorList` — Copies the contents of Vector List into Duplicate Vector List.
  - `get_vector_list_item(is_valid_index=bool)` — Returns the FVector stored in the VectorList at the specified location. if the Index is not valid for this Vector List, ...
  - `get_vector_list_last_index()` -> `int32` — Returns the index of the last item in the Vector List. If Vector List is empty or invalid, the value -1 will be returned...
  - `get_vector_list_length()` -> `int32` — Returns the number of items in the Vector List.
  - `set_vector_list_item(index, new_value)` -> `bool` — Updates the value of the FVector stored in the Vector List at the specified location. If the Index is invalid, the opera...
  - `vector_blend(vector_list_b, constant_a = 1.000000, constant_b = 1.000000)` -> `GeometryScriptVectorList` — Compute (ConstantA * A) + (ConstantB * B) for each pair of vectors in VectorListA and VectorListB and return in new Vect...
  - `vector_blend_in_place(vector_list_b, constant_a = 1.000000, constant_b = 1.000000)` -> `GeometryScriptVectorList` — Compute (ConstantA * A) + (ConstantB * B) for each pair of vectors in VectorListA and VectorListB, and store in VectorLi...
  - `vector_cross(vector_list_b)` -> `GeometryScriptVectorList` — Compute the cross-product between each pair of vectors in VectorListA and VectorListB and return in new VectorList
  - `vector_dot(vector_list_b)` -> `GeometryScriptScalarList` — Compute the dot-product between each pair of vectors in VectorListA and VectorListB and return in new ScalarList
  - `vector_inverse_transform_in_place(transform, as_position = True)` -> `None` — Inverse transform each vector in VectorList, and store in VectorList.
  - `vector_length()` -> `GeometryScriptScalarList` — Compute the length/magnitude of each vector in VectorListA and return in new ScalarList. Note that SquaredLength can be ...
  - `vector_normalize_in_place(set_on_failure = [0.000000,0.000000,0.000000])` -> `None` — Normalize each vector in VectorList, and store in VectorList. If a vector is degenerate, set the normal to the SetOnFail...
  - `vector_plane_project_in_place(plane)` -> `None` — Project each vector in VectorList to the given Plane, and store in VectorList.
  - `vector_to_scalar(constant_x = 1.000000, constant_y = 0.000000, constant_z = 0.000000)` -> `GeometryScriptScalarList` — Convert each Vector in VectorList to a Scalar by computing (ConstantX*Vector.X + ConstantY*Vector.Y + ConstantZ*Vector.Z...
  - `vector_transform_in_place(transform, as_position = True)` -> `None` — Transform each vector in VectorList, and store in VectorList.

### `unreal.GeometryScriptVoronoiOptions`
Inherits: `StructBase` | Header: `MeshPrimitiveFunctions.h`

Geometry Script Voronoi Options

**Properties** (4):
  - `bounds`: `Box` — [Read-Write] (Box)
  - `bounds_expand`: `float` — [Read-Write] (float)
  - `create_cells`: `None` — [Read-Write] Optional list of cells to create meshes for.  If empty, create all cells. (Array[int32]...
  - `include_boundary`: `bool` — [Read-Write] Whether to include the bordering Voronoi cells (which extend âinfinitelyâ to any bo...

### `unreal.GeometryScriptWeldEdgesOptions`
Inherits: `StructBase` | Header: `MeshRepairFunctions.h`

Geometry Script Weld Edges Options

**Properties** (2):
  - `only_unique_pairs`: `bool` — [Read-Write] Only merge unambiguous pairs that have unique duplicate-edge matches (bool)
  - `tolerance`: `float` — [Read-Write] Edges are coincident if both pairs of endpoint vertices, and their midpoint, are closer...

### `unreal.GeometryScriptXAtlasOptions`
Inherits: `StructBase` | Header: `MeshUVFunctions.h`

Geometry Script XAtlas Options

**Properties** (1):
  - `max_iterations`: `int` — [Read-Write] (int32)

### `unreal.NavigableConvexDecompositionOptions`
Inherits: `StructBase` | Header: `CollisionFunctions.h`

Settings to define the important regions for a convex decomposition to preserve for a given input shape.

**Properties** (6):
  - `custom_navigable_positions`: `None` — [Read-Write] Optional list of locations that we expect to be navigable (Array[Vector])
  - `ignore_unreachable_internal_space`: `bool` — [Read-Write] Whether to only consider navigable space that is accessible from outside the shape. (No...
  - `min_radius`: `float` — [Read-Write] Minimum radius of characters/manipulators that should be able to navigate an input shap...
  - `tolerance`: `float` — convex decomposition should be no further than this from an input shape, in the navigable regions (d...
  - `tolerance_directional_scales`: `None` — [Read-Write] Optionally scale the tolerance in custom directions (Array[NegativeSpaceDirectionalTole...
  - `unreachable_planes`: `None` — [Read-Write] Optional list of planes defining unreachable space (on their negative side)
Use this fo...

### `unreal.NegativeSpaceDirectionalToleranceScale`
Inherits: `StructBase` | Header: `CollisionFunctions.h`

Defines direction-specific custom scaling to apply to the FComputeNegativeSpaceOptions::NegativeSpaceTolerance value, based on the direction to the surface For example, this can be used to more closel...

**Properties** (3):
  - `angle_range`: `float` — [Read-Write] Angle range around direction within which the scale will be applied, in degrees (double...
  - `direction`: `Vector` — [Read-Write] Direction to apply custom tolerance scale (Vector)
  - `scale_factor`: `float` — [Read-Write] Scale factor to apply to tolerance. Should be in the (0, 1] range (double)

### `unreal.GeometryScript_AssetUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshAssetFunctions.h`

Although the class name indicates StaticMeshFunctions, that was a naming mistake that is difficult to correct. This class is intended to serve as a generic asset utils function library. The naming iss...

**Methods** (16):
  - `check_static_mesh_has_available_lod(static_mesh_asset, requested_lod, debug = None)` -> `GeometryScriptSearchOutcomePins or None` [classmethod] — Check if a Static Mesh Asset has the RequestedLOD available, ie if CopyMeshFromStaticMesh will be able to succeed for th...
  - `convert_material_list_to_material_map(material_list, material_slot_names)` -> `Map [ Name , MaterialInterface ]` [classmethod] — Converts material list and slot names list to material map, which is the format expected by CreateNewSkeletalMeshAssetFr...
  - `convert_material_map_to_material_list()` [classmethod] — Converts material map to a material list and a slot names list. Null materials will be kept in the list, and the list wi...
  - `copy_mesh_from_skeletal_mesh(from_skeletal_mesh_asset, to_dynamic_mesh, asset_options, requested_lod, outcome=GeometryScriptOutcomePins)` [classmethod] — Extracts a Dynamic Mesh from a Skeletal Mesh Asset.
  - `copy_mesh_from_static_mesh(from_static_mesh_asset, to_dynamic_mesh, asset_options, requested_lod, outcome=GeometryScriptOutcomePins)` [classmethod] — Extracts a Dynamic Mesh from a Static Mesh Asset, using section indices for the material IDs â use GetSectionMaterialL...
  - `copy_mesh_from_static_mesh_v2(from_static_mesh_asset, to_dynamic_mesh, asset_options, requested_lod, use_section_materials=True, outcome=GeometryScriptOutcomePins)` [classmethod] — Extracts a Dynamic Mesh from a Static Mesh Asset. Note that the LOD Index in RequestedLOD will be silently clamped to th...
  - `copy_mesh_to_skeletal_mesh(from_dynamic_mesh, to_skeletal_mesh_asset, options, target_lod, outcome=GeometryScriptOutcomePins)` [classmethod] — Updates a Skeletal Mesh Asset with new geometry and bone weights data from a Dynamic Mesh.
  - `copy_mesh_to_static_mesh(from_dynamic_mesh, to_static_mesh_asset, options, target_lod, use_section_materials=True, outcome=GeometryScriptOutcomePins)` [classmethod] — Updates a Static Mesh Asset with new geometry converted from a Dynamic Mesh
  - `copy_morph_target_to_skeletal_mesh(from_morph_target, to_skeletal_mesh_asset, morph_target_name, options, target_lod, outcome=GeometryScriptOutcomePins)` [classmethod] — Add a Dynamic Mesh morph target to a Skeletal Mesh Asset.
  - `copy_skin_weight_profile_to_skeletal_mesh(from_dynamic_mesh, to_skeletal_mesh_asset, target_profile_name, source_profile_name, options, target_lod, outcome=GeometryScriptOutcomePins)` [classmethod] — Add a Dynamic Mesh skin weight profile to a Skeletal Mesh Asset.
  - `get_lod_material_list_from_skeletal_mesh()` [classmethod] — Extracts the Material List and corresponding Material Indices from the specified LOD of the Skeletal Mesh Asset. If Copy...
  - `get_material_list_from_skeletal_mesh()` [classmethod] — Get the asset materials from the skeletal mesh asset. Note: For LOD-specific materials, use GetLODMaterialListFromSkelet...
  - `get_material_list_from_static_mesh()` [classmethod] — Get the asset materials from the static mesh asset. These will match the DynamicMesh material if CopyMeshFromStaticMesh ...
  - `get_num_static_mesh_lo_ds_of_type(static_mesh_asset: StaticMesh, lod_type: GeometryScriptLODType = Ellipsis)` -> `int` [classmethod] — deprecated: âget_num_static_mesh_lo_ds_of_typeâ was renamed to âget_num_static_mesh_lods_of_typeâ.
  - `get_num_static_mesh_lods_of_type(static_mesh_asset, lod_type = GeometryScriptLODType.SOURCE_MODEL)` -> `int32` [classmethod] — Determine the number of available LODs of the requested LODType in a Static Mesh Asset
  - `get_section_material_list_from_static_mesh()` [classmethod] — Extracts the Material List and corresponding Material Indices from the specified LOD of the Static Mesh Asset. The Mater...

### `unreal.GeometryScript_Bake`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshBakeFunctions.h`

Geometry Script Library Mesh Bake Functions

**Methods** (18):
  - `bake_texture(target_mesh, target_transform, target_options, source_mesh, source_transform, source_options, bake_types, bake_options, debug = None)` -> `Array [ Texture2D ]` [classmethod] — Bake Texture
  - `bake_texture_from_render_captures(target_mesh, target_local_to_world, target_options, source_actors, bake_options, debug = None)` -> `GeometryScriptRenderCaptureTextures` [classmethod] — Bake Texture from Render Captures
  - `bake_vertex(target_mesh, target_transform, target_options, source_mesh, source_transform, source_options, bake_types, bake_options, debug = None)` -> `DynamicMesh` [classmethod] — Bake Vertex
  - `convert_bake_resolution_to_int(bake_resolution)` -> `int32` [classmethod] — Convert Bake Resolution to Int
  - `make_bake_type_ambient_occlusion(occlusion_rays = 16, max_distance = 0.000000, spread_angle = 180.000000, bias_angle = 15.000000)` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Ambient Occlusion
  - `make_bake_type_bent_normal(occlusion_rays = 16, max_distance = 0.000000, spread_angle = 180.000000, normal_space = GeometryScriptBakeNormalSpace.TANGENT)` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Bent Normal
  - `make_bake_type_constant(value = 0.000000)` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Constant
  - `make_bake_type_curvature(curvature_type = GeometryScriptBakeCurvatureTypeMode.MEAN, color_mapping = GeometryScriptBakeCurvatureColorMode.GRAYSCALE, color_range_multiplier = 1.000000, min_range_multiplier = 0.000000, clamping = GeometryScriptBakeCurvatureClampMode.NONE)` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Curvature
  - `make_bake_type_face_normal()` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Face Normal
  - `make_bake_type_height(range_mode = GeometryScriptBakeHeightRangeMode.ABSOLUTE, inner_distance = -1.000000, outer_distance = 1.000000)` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Height
  - `make_bake_type_material_id()` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Material ID
  - `make_bake_type_multi_texture(material_id_source_textures, source_uv_layer = 0)` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Multi Texture
  - `make_bake_type_object_normal()` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Object Normal
  - `make_bake_type_position()` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Position
  - `make_bake_type_tangent_normal()` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Tangent Normal
  - `make_bake_type_texture(source_texture = None, source_uv_layer = 0)` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Texture
  - `make_bake_type_uv_shell(source_uv_layer = 0, wireframe_thickness = 1.000000, wireframe_color = [0.000000,0.000000,1.000000,1.000000], shell_color = [0.500000,0.500000,0.500000,1.000000], background_color = [0.000000,0.000000,0.000000,0.000000])` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type UVShell
  - `make_bake_type_vertex_color()` -> `GeometryScriptBakeTypeOptions` [classmethod] — Make Bake Type Vertex Color

### `unreal.GeometryScript_BoneWeights`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshBoneWeightFunctions.h`

Geometry Script Library Mesh Bone Weight Functions

**Methods** (20):
  - `blend_bone_weights(bone_weights_a, bone_weights_b, alpha, debug = None)` -> `Array [ GeometryScriptBoneWeight ]` [classmethod] — Blends two bone weights using an Alpha value that ranges from 0 to 1, inclusive. If Alpha is 0, then only weights from B...
  - `compute_smooth_bone_weights(target_mesh, skeleton, options, profile = ['Default'], debug = None)` -> `DynamicMesh` [classmethod] — Computes a smooth skin binding for the given mesh to the skeleton provided.
  - `copy_bones_from_mesh(source_mesh, target_mesh, options = [False,BonesToCopyFromSource.ALL_BONES], debug = None)` -> `DynamicMesh` [classmethod] — Copy the bone attributes (skeleton) from the SourceMesh to the TargetMesh.
  - `copy_bones_from_skeleton(source_skeleton, target_mesh, options = [False,BonesToCopyFromSource.ALL_BONES], debug = None)` -> `DynamicMesh` [classmethod] — Copy the bone attributes (skeleton) from the SourceSkeleton to the TargetMesh.
  - `discard_bones_from_mesh(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Discard the bone attributes (skeleton) from the TargetMesh.
  - `get_all_bones_info()` [classmethod] — Get an array of bones representing the skeleton. Each entry contains information about the bone.
  - `get_bone_children()` [classmethod] — Get the information about the children of the bone.
  - `get_bone_index(target_mesh, bone_name, is_valid_bone_name=bool, bone_index=int32)` [classmethod] — Get Bone Index
  - `get_bone_info(target_mesh, bone_name, is_valid_bone_name=bool, bone_info=GeometryScriptBoneInfo)` [classmethod] — Get the bone information.
  - `get_largest_vertex_bone_weight(target_mesh, vertex_id, bone_weight=GeometryScriptBoneWeight, has_valid_bone_weights=bool)` [classmethod] — Return the Bone/Skin Weight with the maximum weight at a given vertex of TargetMesh
  - `get_max_bone_weight_index(target_mesh, has_bone_weights=bool, max_bone_index=int32)` [classmethod] — Determine the largest bone weight index that exists on the Mesh
  - `get_root_bone_name(target_mesh, bone_name=Name)` [classmethod] — Get the name of the root bone.
  - `get_vertex_bone_weights()` [classmethod] — Return an array of Bone/Skin Weights at a given vertex of TargetMesh
  - `mesh_copy_bone_weights(target_mesh, target_profile, profile_existed=bool)` [classmethod] — Copies all bone weights from a source profile onto a target profile, on the same mesh, replacing all weights that existe...
  - `mesh_create_bone_weights(target_mesh, replace_existing_profile=False, profile_existed=bool)` [classmethod] — Create a new BoneWeights attribute on the TargetMesh, if it does not already exist. If it does exist, and bReplaceExisti...
  - `mesh_has_bone_weights(target_mesh, has_bone_weights=bool)` [classmethod] — Check whether the TargetMesh has a per-vertex Bone/Skin Weight Attribute set
  - `prune_bone_weights(target_mesh, bones_to_prune, options, profile = ['Default'], debug = None)` -> `DynamicMesh` [classmethod] — Prunes the given bones from any bone weight assignment on the given profile. The bone weights are re-assigned based on t...
  - `set_all_vertex_bone_weights(target_mesh, bone_weights, profile = ['Default'], debug = None)` -> `DynamicMesh` [classmethod] — Set all vertices of the TargetMesh to the given Bone/Skin Weights
  - `set_vertex_bone_weights()` [classmethod] — Set the Bone/Skin Weights at a given vertex of TargetMesh
  - `transfer_bone_weights_from_mesh(source_mesh, target_mesh, options = [TransferBoneWeightsMethod.CLOSEST_POINT_ON_SURFACE,OutputTargetMeshBones.SOURCE_BONES,['Default'],['Default'],-1.000000,-1.000000,True,0,0.000000,'None'], selection = [], debug = None)` -> `DynamicMesh` [classmethod] — Transfer the bone weights from the SourceMesh to the TargetMesh. Assumes that the meshes are aligned. Otherwise, use the...

### `unreal.GeometryScript_Box`
Inherits: `BlueprintFunctionLibrary` | Header: `ShapeFunctions.h`

Geometry Script Library Box Functions

**Methods** (15):
  - `find_box_box_intersection(box1, is_intersecting=bool)` [classmethod] — Find the Box formed by the intersection of Box1 and Box2
  - `find_closest_point_on_box(box, is_inside=bool)` [classmethod] — Find the point on the faces of the Box that is closest to the input Point. If the Point is inside the Box, it is returne...
  - `get_box_box_distance(box1, box2)` -> `double` [classmethod] — Calculate the minimum distance between Box1 and Box2
  - `get_box_center_size(dimensions=Vector)` [classmethod] — Get the Center point and X/Y/Z Dimensions of a Box (full dimensions, not Extents)
  - `get_box_corner(box, corner_index)` -> `Vector` [classmethod] — Get the position of a corner of the Box. Corners are indexed from 0 to 7, using an ordering where 0 is the Min corner, 1...
  - `get_box_face_center(box, face_normal=Vector)` [classmethod] — Get the position of the center of a face of the Box. Faces are indexed from 0 to 5, using an ordering where 0/1 are the ...
  - `get_box_point_distance(box, point)` -> `double` [classmethod] — Calculate the minimum distance between the Box and the Point
  - `get_box_volume_area(surface_area=double)` [classmethod] — Get the Volume and Surface Area of a Box
  - `get_expanded_box(box, expand_by)` -> `Box` [classmethod] — Get the input Box expanded by adding the ExpandBy parameter to both the Min and Max. Dimensions will be clamped to the c...
  - `get_transformed_box(box, transform)` -> `Box` [classmethod] — Apply the input Transform to the corners of the input Box, and return the new Box containing those points
  - `make_box_from_center_extents(center, extents)` -> `Box` [classmethod] — Create a Box from a Center point and X/Y/Z Extents (Extents are half-dimensions)
  - `make_box_from_center_size(center, dimensions)` -> `Box` [classmethod] — Create a Box from a Center point and X/Y/Z Dimensions ( not Extents, which are half-dimensions)
  - `test_box_box_intersection(box1, box2)` -> `bool` [classmethod] — Test if Box1 and Box2 intersect
  - `test_box_sphere_intersection(box, sphere_center, sphere_radius)` -> `bool` [classmethod] — Check if the Box intersects a Sphere defined by the SphereCenter and SphereRadius
  - `test_point_inside_box(box, point, consider_on_box_as_inside = True)` -> `bool` [classmethod] — Test if a Point is inside the Box, returning true if so, otherwise false

### `unreal.GeometryScript_Collision`
Inherits: `BlueprintFunctionLibrary` | Header: `CollisionFunctions.h`

Geometry Script Library Collision Functions

**Methods** (23):
  - `approximate_convex_hulls_with_simpler_collision_shapes(simple_collision, approximate_options, has_approximated=bool)` [classmethod] — Attempt to approximate any convex hulls in the given simple collision representation. Updates the passed-in Simple Colli...
  - `combine_simple_collision(collision_to_update, append_collision, debug = None)` -> `GeometryScriptSimpleCollision` [classmethod]
  - `combine_simple_collision_array(simple_collision_array, debug = None)` -> `GeometryScriptSimpleCollision` [classmethod]
  - `compute_navigable_convex_decomposition(target_mesh, options, debug = None)` -> `GeometryScriptSimpleCollision` [classmethod] — Compute the ânavigableâ convex decomposition of an input mesh surface, i.e. a convex decomposition appropriate for a...
  - `compute_negative_space(mesh_bvh, negative_space_options, debug = None)` -> `GeometryScriptSphereCovering` [classmethod] — Compute the negative space of an input mesh surface that should be protected when merging simple collision shapes
  - `conv_geometry_script_sphere_covering_to_sphere_array(sphere_covering)` -> `Array [ Sphere ]` [classmethod]
  - `conv_sphere_array_to_geometry_script_sphere_covering(spheres)` -> `GeometryScriptSphereCovering` [classmethod]
  - `generate_collision_from_mesh(from_dynamic_mesh, options, debug = None)` -> `GeometryScriptSimpleCollision` [classmethod] — Generate Simple Collision shapes for an input Dynamic Mesh shape
  - `get_simple_collision_from_component(component, debug = None)` -> `GeometryScriptSimpleCollision` [classmethod]
  - `get_simple_collision_from_static_mesh(static_mesh, debug = None)` -> `GeometryScriptSimpleCollision` [classmethod]
  - `get_simple_collision_shape_count(simple_collision)` -> `int32` [classmethod]
  - `merge_simple_collision_shapes(simple_collision, merge_options, has_merged=bool)` [classmethod] — Attempt to merge collision shapes to create a representation with fewer overall shapes.
  - `reset_dynamic_mesh_collision(component, emit_transaction = False, debug = None)` -> `None` [classmethod] — Clears Simple Collisions from the Dynamic Mesh Component.
  - `reset_simple_collision(simple_collision)` -> `GeometryScriptSimpleCollision` [classmethod] — Clears the Simple Collision shapes
  - `set_dynamic_mesh_collision_from_mesh(from_dynamic_mesh, to_dynamic_mesh_component, options, debug = None)` -> `DynamicMesh` [classmethod] — Generate Simple Collision shapes for a Dynamic Mesh Component based on the input Dynamic Mesh.
  - `set_simple_collision_of_dynamic_mesh_component(simple_collision, dynamic_mesh_component, options, debug = None)` -> `None` [classmethod]
  - `set_simple_collision_of_static_mesh(simple_collision, static_mesh, options, static_mesh_collision_options = [True], debug = None)` -> `None` [classmethod]
  - `set_static_mesh_collision_from_component(static_mesh_asset, source_component, options = [True], static_mesh_collision_options = [True], debug = None)` -> `None` [classmethod] — Copy the Simple Collision Geometry from the Source Component to the Static Mesh Asset.
  - `set_static_mesh_collision_from_mesh(from_dynamic_mesh, to_static_mesh_asset, options, static_mesh_collision_options = [True], debug = None)` -> `DynamicMesh` [classmethod] — Generates Simple Collision shapes for a Static Mesh Asset based on the input Dynamic Mesh.
  - `set_static_mesh_custom_complex_collision(static_mesh_asset, static_mesh_collision_asset, emit_transaction, mark_collision_as_customized = True, debug = None)` -> `bool` [classmethod] — Set a static mesh as the custom collision for another static mesh to use. Note: Only works if editor-only data is availa...
  - `simplify_convex_hulls(simple_collision, simplify_options, has_simplified=bool)` [classmethod] — Simplify any convex hulls in the given simple collision representation. Updates the passed-in Simple Collision.
  - `static_mesh_has_customized_collision(static_mesh_asset)` -> `bool` [classmethod]
  - `transform_simple_collision_shapes(simple_collision, transform, transform_options, success=bool)` [classmethod]

### `unreal.GeometryScript_Containment`
Inherits: `BlueprintFunctionLibrary` | Header: `ContainmentFunctions.h`

Geometry Script Library Containment Functions

**Methods** (3):
  - `compute_mesh_convex_decomposition(target_mesh, copy_to_mesh, options, copy_to_mesh=DynamicMesh, copy_to_mesh_out=DynamicMesh)` [classmethod] — Compute a Convex Hull Decomposition of the given TargetMesh. Assuming more than one hull is requested, multiple hulls wi...
  - `compute_mesh_convex_hull(target_mesh, copy_to_mesh, selection, options, copy_to_mesh=DynamicMesh, copy_to_mesh_out=DynamicMesh)` [classmethod] — Compute the Convex Hull of a given Target Mesh, or part of the mesh if an optional Selection is provided, and put the re...
  - `compute_mesh_swept_hull(target_mesh, copy_to_mesh, projection_frame, options, copy_to_mesh=DynamicMesh, copy_to_mesh_out=DynamicMesh)` [classmethod] — Compute the Swept Hull of a given Target Mesh for a given 3D Plane defined by ProjectionFrame, and put the result in Hul...

### `unreal.GeometryScript_List`
Inherits: `BlueprintFunctionLibrary` | Header: `ListUtilityFunctions.h`

Geometry Script Library List Utility Functions

**Methods** (47):
  - `clear_color_list(color_list, clear_color)` -> `GeometryScriptColorList` [classmethod] — Resets all the items in the Color List to the specified Clear Color.
  - `clear_index_list(index_list, clear_value = 0)` -> `GeometryScriptIndexList` [classmethod] — Set each value in Index List to the given Clear Value.
  - `clear_scalar_list(scalar_list, clear_value = 0.000000)` -> `GeometryScriptScalarList` [classmethod] — Resets all the items in the Scalar List to the Clear Value.
  - `clear_uv_list(uv_list, clear_uv)` -> `GeometryScriptUVList` [classmethod] — Resets all the items in the Vector List to the given Clear UV value.
  - `clear_vector_list(vector_list, clear_value = [0.000000,0.000000,0.000000])` -> `GeometryScriptVectorList` [classmethod] — Resets all the items in the Vector List to the Clear Value.
  - `convert_array_to_color_list(color_array)` -> `GeometryScriptColorList` [classmethod] — Converts an array of FLinearColor (Color Array) to a Color List.
  - `convert_array_to_index_list(index_array, index_type = GeometryScriptIndexType.ANY)` -> `GeometryScriptIndexList` [classmethod] — Populates Index List of the specified Index Type from the integer values stored in the Index Array.
  - `convert_array_to_scalar_list(vector_array)` -> `GeometryScriptScalarList` [classmethod] — Converts an array of doubles (Scalar Array) to Scalar List.
  - `convert_array_to_triangle_list(triangle_array)` -> `GeometryScriptTriangleList` [classmethod] — Converts a Triangle Array of integer triplets to a Triangle List.
  - `convert_array_to_uv_list(uv_array)` -> `GeometryScriptUVList` [classmethod] — Converts an array of FVector2D (UV Array) to UV List.
  - `convert_array_to_vector_list(vector_array)` -> `GeometryScriptVectorList` [classmethod] — Converts an Array of FVectors (Vector Array) to Vector List.
  - `convert_color_list_to_array(color_list)` -> `Array [ LinearColor ]` [classmethod] — Converts the Color List to an array of FLinearColor (Color Array).
  - `convert_index_list_to_array(index_list)` -> `Array [ int32 ]` [classmethod] — Populates Index Array with the integer values stored in the Index List.
  - `convert_scalar_list_to_array(scalar_list)` -> `Array [ double ]` [classmethod] — Converts a Scalar List to an Scalar Array (an array of doubles).
  - `convert_triangle_list_to_array(triangle_list)` -> `Array [ IntVector ]` [classmethod] — Converts Triangle List to Triangle Array by populating with the appropriate integer triplets.
  - `convert_uv_list_to_array(uv_list)` -> `Array [ Vector2D ]` [classmethod] — Converts a UV List to an array of FVector2Ds (UV Array).
  - `convert_vector_list_to_array(vector_list)` -> `Array [ Vector ]` [classmethod] — Converts Vector List to an array of FVectors (Vector Array).
  - `duplicate_color_list(color_list)` -> `GeometryScriptColorList` [classmethod] — Duplicates the contents of Color List into Duplicate List.
  - `duplicate_index_list(index_list)` -> `GeometryScriptIndexList` [classmethod] — Updates Duplicate List to be identical to Index List.
  - `duplicate_scalar_list(scalar_list)` -> `GeometryScriptScalarList` [classmethod] — Copies the contents of Scalar List into Duplicate List.
  - `duplicate_uv_list(uv_list)` -> `GeometryScriptUVList` [classmethod] — Duplicates the contents of UV List into Duplicate List.
  - `duplicate_vector_list(vector_list)` -> `GeometryScriptVectorList` [classmethod] — Copies the contents of Vector List into Duplicate Vector List.
  - `extract_color_list_channel(color_list, channel_index = 0)` -> `GeometryScriptScalarList` [classmethod] — Populates a Scalar List with values that corresponds to the 0, 1, 2, or 3 channel of a Color List.
  - `extract_color_list_channels(color_list, x_channel_index = 0, y_channel_index = 1, z_channel_index = 2)` -> `GeometryScriptVectorList` [classmethod] — Populates a Vector List from a Color List. The channels in the Color List are mapped to vector components by means of X ...
  - `get_color_list_item(color_list, is_valid_index=bool)` [classmethod] — Returns the FLinearColor stored in the Color List at the specified location. If the Index is not valid for this Color Li...
  - `get_color_list_last_index(color_list)` -> `int32` [classmethod] — Returns the index of the last item in the Color List. If Color List is empty or invalid, the value -1 will be returned.
  - `get_color_list_length(color_list)` -> `int32` [classmethod] — Returns the number of items in the Color List.
  - `get_index_list_item(index_list, is_valid_index=bool)` [classmethod] — Returns the item associated with Index in the Index List. If Index is not valid for this Index List the value -1 will be...
  - `get_index_list_last_index(index_list)` -> `int32` [classmethod] — Returns the index of the last element in the Index List. Note, the value -1 will be returned if the list is empty or inv...
  - `get_index_list_length(index_list)` -> `int32` [classmethod] — Returns the number of Items in Index List.
  - `get_scalar_list_item(scalar_list, is_valid_index=bool)` [classmethod] — Returns the Scalar value associated with Index in Scalar List. If the Index is not valid for this Scalar List, the value...
  - `get_scalar_list_last_index(scalar_list)` -> `int32` [classmethod] — Returns the index of the last Scalar in Scalar List. If Scalar List is empty or invalid, the value -1 will be returned
  - `get_scalar_list_length(scalar_list)` -> `int32` [classmethod] — Returns the number of items in the Scalar List.
  - `get_triangle_list_item(triangle_list, is_valid_triangle=bool)` [classmethod] — Returns the integer triplet associated with the index Triangle in the Triangle List. If Triangle is not valid for this T...
  - `get_triangle_list_last_triangle(triangle_list)` -> `int32` [classmethod] — Returns the index of the last element in the Triangle List. If the Triangle List is empty or invalid, the value 0 will b...
  - `get_triangle_list_length(triangle_list)` -> `int32` [classmethod] — Returns the number of Triangles in the Triangle list.
  - `get_uv_list_item(uv_list, is_valid_index=bool)` [classmethod] — Returns the FVector2D stored in the UV List at the specified location. If the Index is not valid for this UV List, the Z...
  - `get_uv_list_last_index(uv_list)` -> `int32` [classmethod] — Returns the index of the last item in the UV List. If UV List is empty or invalid, the value -1 will be returned.
  - `get_uv_list_length(uv_list)` -> `int32` [classmethod] — Returns the number of items in the UV List.
  - `get_vector_list_item(vector_list, is_valid_index=bool)` [classmethod] — Returns the FVector stored in the VectorList at the specified location. if the Index is not valid for this Vector List, ...
  - `get_vector_list_last_index(vector_list)` -> `int32` [classmethod] — Returns the index of the last item in the Vector List. If Vector List is empty or invalid, the value -1 will be returned...
  - `get_vector_list_length(vector_list)` -> `int32` [classmethod] — Returns the number of items in the Vector List.
  - `set_color_list_item(color_list, index, is_valid_index=bool)` [classmethod] — Updates the value of the FLinearColor stored in the Color List at the specified location. If the Index is invalid, the o...
  - `set_index_list_item(index_list, index, is_valid_index=bool)` [classmethod] — Updates the value associated with Index in the Index List. If the Index is invalid, the operation will fail and in this ...
  - `set_scalar_list_item(scalar_list, index, is_valid_index=bool)` [classmethod] — Updates the value associated with Index in the Scalar List. If the Index is invalid, the operation will fail and bValidI...
  - `set_uv_list_item(uv_list, index, is_valid_index=bool)` [classmethod] — Updates the value of the FVector2D stored in the UV List at the specified location. If the Index is invalid, the operati...
  - `set_vector_list_item(vector_list, index, is_valid_index=bool)` [classmethod] — Updates the value of the FVector stored in the Vector List at the specified location. If the Index is invalid, the opera...

### `unreal.GeometryScript_Materials`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshMaterialFunctions.h`

Geometry Script Library Mesh Material Functions

**Methods** (17):
  - `clear_material_i_ds(target_mesh, clear_value = 0, debug = None)` -> `DynamicMesh` [classmethod] — Resets all Material IDs on a mesh to the given ClearValue, or 0 if no ClearValue is provided. If Material IDs are not al...
  - `compact_material_i_ds()` [classmethod] — Compact the MaterialIDs of the TargetMesh, ie remove any un-used MaterialIDs and remap the remaining N in-use MaterialID...
  - `delete_triangles_by_material_id(target_mesh, material_id, defer_change_notifications=False, num_deleted=int32)` [classmethod] — Delete all triangles in TargetMesh with the given MaterialID
  - `enable_material_i_ds(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Enables per-triangle Material IDs on a mesh and initializes the values to 0. If Target Mesh already has Material IDs, th...
  - `get_all_triangle_material_i_ds(material_id_list=GeometryScriptIndexList, has_material_i_ds=bool)` [classmethod] — Returns an Index List of all triangle Material IDs, constructed with one entry for each consecutive Triangle ID. If Mate...
  - `get_material_i_ds_of_triangles(target_mesh, triangle_id_list, material_id_list=GeometryScriptIndexList)` [classmethod] — This populates the MaterialIDList with Material IDs for each triangle in the TriangleIDList. If a triangle is not presen...
  - `get_max_material_id(has_material_i_ds=bool)` [classmethod] — Get Max Material ID
  - `get_triangle_material_id(target_mesh, is_valid_triangle=bool)` [classmethod] — Returns the current Material ID for a Triangle. If the mesh does not have Material IDs enabled or if the Triangle ID is ...
  - `get_triangles_by_material_id(target_mesh, material_id, triangle_id_list=GeometryScriptIndexList)` [classmethod] — Populates Triangle ID List with the Triangle IDs of triangles that share the specified Material ID in the Target Mesh.
  - `remap_and_combine_materials()` [classmethod] — Remap material IDs to be consistent with a Required Materials list. The Target Mesh material IDs will be remapped to ref...
  - `remap_material_i_ds(target_mesh, from_material_id, to_material_id, debug = None)` -> `DynamicMesh` [classmethod] — For all triangles with a Material ID matching the given value (From Material ID), update the Material ID to the new valu...
  - `remap_to_new_material_i_ds_by_material(target_mesh, from_material_list, to_material_list, missing_material_id = -1, debug = None)` -> `DynamicMesh` [classmethod] — Remap the Material IDs of the TargetMesh to a new set of Material IDs based on a âFromâ/Current Material List, and a...
  - `set_all_triangle_material_i_ds(target_mesh, triangle_material_id_list, defer_change_notifications = False, debug = None)` -> `DynamicMesh` [classmethod] — Sets the Material ID of all triangles in a mesh to the values in an input Index List.
  - `set_material_id_for_mesh_selection(target_mesh, selection, material_id, defer_change_notifications = False, debug = None)` -> `DynamicMesh` [classmethod] — Set a new MaterialID on all the triangles of the given Selection.
  - `set_material_id_on_triangles(target_mesh, triangle_id_list, material_id, defer_change_notifications = False, debug = None)` -> `DynamicMesh` [classmethod] — Assigns the Material ID to all the triangles specified by the Triangle ID List.
  - `set_polygroup_material_id(target_mesh, group_layer, polygroup_id, material_id, defer_change_notifications=False, is_valid_polygroup_id=bool)` [classmethod] — Set a new MaterialID on all the triangles of TargetMesh with the given PolyGroup.
  - `set_triangle_material_id(target_mesh, triangle_id, material_id, is_valid_triangle=bool)` [classmethod] — Assigns the specified triangle the given Material ID. If the Target Mesh does not have Material IDs enabled, or if the T...

### `unreal.GeometryScript_MeshBooleans`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshBooleanFunctions.h`

Geometry Script Library Mesh Boolean Functions

**Methods** (6):
  - `apply_mesh_boolean(target_mesh, target_transform, tool_mesh, tool_transform, operation, options, debug = None)` -> `DynamicMesh` [classmethod] — Applies a Boolean operation (such as, Union, Intersect, and Subtract) to the Target Dynamic Mesh based on a Tool Dynamic...
  - `apply_mesh_iso_curves(target_mesh, options, per_vertex_value, iso_value = 0.500000, debug = None)` -> `DynamicMesh` [classmethod] — Insert edges along the curve where the interpolated per-vertex values match a given isovalue
  - `apply_mesh_mirror(target_mesh, mirror_frame, options, debug = None)` -> `DynamicMesh` [classmethod] — Mirrors a mesh across a plane, with optional cutting and welding of triangles.
  - `apply_mesh_plane_cut(target_mesh, cut_frame, options, debug = None)` -> `DynamicMesh` [classmethod] — Applies a plane cut to a mesh, optionally filling any holes created.
  - `apply_mesh_plane_slice(target_mesh, cut_frame, options, debug = None)` -> `DynamicMesh` [classmethod] — Slices a mesh into two halves, with optional hole filling.
  - `apply_mesh_self_union(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod] — Mesh-Boolean-Union an object with itself to repair self-intersections, remove floating geometry, etc.

### `unreal.GeometryScript_MeshComparison`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshComparisonFunctions.h`

Geometry Script Library Mesh Comparison Functions

**Methods** (3):
  - `is_intersecting_mesh(target_mesh, target_transform, other_mesh, other_transform, is_intersecting=bool)` [classmethod] — Returns true if the two input meshes (with optional transforms) are geometrically intersecting.
  - `is_same_mesh_as(target_mesh, other_mesh, options, is_same_mesh=bool, difference_info=GeometryScriptMeshDifferenceInfo)` [classmethod] — Returns true if the two input meshes are equivalent under the comparisons defined by the input options. If false, Differ...
  - `measure_distances_between_meshes(target_mesh, other_mesh, options, max_distance=double, min_distance=double, average_distance=double, root_mean_sqr_deviation=double)` [classmethod] — Measures the min/max and average closest-point distances between two meshes.

### `unreal.GeometryScript_MeshDecomposition`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshDecompositionFunctions.h`

Geometry Script Library Mesh Decomposition Functions

**Methods** (11):
  - `copy_mesh_selection_to_mesh(target_mesh, store_to_submesh, selection, append_to_existing=False, preserve_group_i_ds=False, store_to_submesh=DynamicMesh, store_to_submesh_out=DynamicMesh)` [classmethod] — Extract the triangles identified by Selection from TargetMesh and copy/add them to StoreToSubmesh
  - `copy_mesh_to_mesh(copy_from_mesh, copy_to_mesh, copy_to_mesh=DynamicMesh, copy_to_mesh_out=DynamicMesh)` [classmethod] — Set CopyToMesh to be the same mesh as CopyFromMesh
  - `get_sub_mesh_from_mesh(target_mesh, store_to_submesh, triangle_list, store_to_submesh=DynamicMesh, store_to_submesh_out=DynamicMesh)` [classmethod] — CopyMeshSelectionToMesh should be used instead of this function
  - `sort_meshes_by_area(meshes, stable_sort = False, sort_order = ArraySortOrder.ASCENDING)` -> `Array [ DynamicMesh ]` [classmethod] — Sort meshes by their surface area
  - `sort_meshes_by_bounds_volume(meshes, stable_sort = False, sort_order = ArraySortOrder.ASCENDING)` -> `Array [ DynamicMesh ]` [classmethod] — Sort meshes by their axis-aligned bounding box volume
  - `sort_meshes_by_custom_values(meshes, values_to_sort_by, stable_sort = False, sort_order = ArraySortOrder.ASCENDING)` -> `Array [ DynamicMesh ]` [classmethod] — Sort meshes according to the values in a second array, which must have the same length as the Meshes array For example, ...
  - `sort_meshes_by_volume(meshes, stable_sort = False, sort_order = ArraySortOrder.ASCENDING)` -> `Array [ DynamicMesh ]` [classmethod] — Sort meshes by their volume Note: For meshes with open boundary, volume is computed with respect to the average vertex p...
  - `split_mesh_by_components()` [classmethod] — Create a new Mesh for each Connected Component of TargetMesh. New meshes are drawn from MeshPool if it is provided, othe...
  - `split_mesh_by_material_i_ds()` [classmethod] — Create a new Mesh for each MaterialID of TargetMesh. New meshes are drawn from MeshPool if it is provided, otherwise new...
  - `split_mesh_by_polygroups()` [classmethod] — Create a new Mesh for each Polygroup of TargetMesh. Note that this may be a large number of meshes! New meshes are drawn...
  - `split_mesh_by_vertex_overlap()` [classmethod] — Create a new Mesh for each vertex-connected or vertex-overlapping part of TargetMesh. New meshes are drawn from MeshPool...

### `unreal.GeometryScript_MeshDeformers`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshDeformFunctions.h`

Geometry Script Library Mesh Deform Functions

**Methods** (8):
  - `apply_bend_warp_to_mesh(target_mesh, options, bend_orientation, bend_angle = 45.000000, bend_extent = 50.000000, debug = None)` -> `DynamicMesh` [classmethod] — Applies a Bend Warp around an axis defined by the Bend Orientation transform. The extents of the affected region can be ...
  - `apply_displace_from_per_vertex_vectors(target_mesh, selection, vector_list, magnitude = 5.000000, debug = None)` -> `DynamicMesh` [classmethod] — Add the vectors in VectorList, scaled by Magnitude, to the vertex positions in Target Mesh. VectorList Length must be >=...
  - `apply_displace_from_texture_map(target_mesh, texture, selection, options, uv_layer = 0, debug = None)` -> `DynamicMesh` [classmethod] — Applies a displacement to a Dynamic Mesh based on a Texture2D and a UV Channel.
  - `apply_flare_warp_to_mesh(target_mesh, options, flare_orientation, flare_percent_x = 0.000000, flare_percent_y = 0.000000, flare_extent = 50.000000, debug = None)` -> `DynamicMesh` [classmethod] — Applies a Flare/Bulge warp around an axis defined by the Flare Orientation transform. The amount of flare in the perpend...
  - `apply_iterative_smoothing_to_mesh(target_mesh, selection, options, debug = None)` -> `DynamicMesh` [classmethod] — Applies a number of iterations of mesh smoothing to a Dynamic Mesh.
  - `apply_math_warp_to_mesh(target_mesh, warp_orientation, warp_type, options, debug = None)` -> `DynamicMesh` [classmethod] — Applies various simple math-function-based warps around an axis defined by the Warp Orientation transform, currently a 1...
  - `apply_perlin_noise_to_mesh(target_mesh, selection, options, debug = None)` -> `DynamicMesh` [classmethod] — Applies 3D Perlin noise displacement to the Target Mesh.
  - `apply_twist_warp_to_mesh(target_mesh, options, twist_orientation, twist_angle = 45.000000, twist_extent = 50.000000, debug = None)` -> `DynamicMesh` [classmethod] — Applies a twist warp around an axis defined by the Twist Orientation transform. The extents of the affected region can b...

### `unreal.GeometryScript_MeshEdits`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshBasicEditFunctions.h`

Geometry Script Library Mesh Basic Edit Functions

**Methods** (21):
  - `add_triangle_to_mesh(target_mesh, new_triangle, new_triangle_group_id=0, defer_change_notifications=False, new_triangle_index=int32)` [classmethod] — Adds a triangle (Vertex ID triplet) to the mesh and updates New Triangle Index with the resulting Triangle ID.
  - `add_triangles_to_mesh(target_mesh, new_triangles_list, new_triangle_group_id=0, defer_change_notifications=False, new_indices_list=GeometryScriptIndexList)` [classmethod] — Adds a list of triangles to the mesh and populates the New Indices List with the corresponding new Triangle IDs.
  - `add_vertex_to_mesh(target_mesh, new_position, new_vertex_index=int32)` [classmethod] — Adds a new vertex to the mesh and returns a new Vertex ID (NewVertexIndex).
  - `add_vertices_to_mesh(target_mesh, new_positions_list, new_indices_list=GeometryScriptIndexList)` [classmethod] — Adds a list of vertices to the mesh, and populates the NewIndicesList with the corresponding new Vertex IDs.
  - `append_buffers_to_mesh(target_mesh, buffers, material_id=0, defer_change_notifications=False, new_triangle_indices_list=GeometryScriptIndexList)` [classmethod] — Adds a set of vertices/triangles to the mesh, with Normals, UVs, and Colors; returning the new triangles indices
  - `append_mesh(target_mesh, append_mesh, append_transform, defer_change_notifications = False, append_options = [GeometryScriptCombineAttributesMode.ENABLE_ALL_MATCHING], debug = None)` -> `DynamicMesh` [classmethod] — Apply Append Transform to Append Mesh and then add its geometry to the Target Mesh.
  - `append_mesh_repeated(target_mesh, append_mesh, append_transform, repeat_count = 1, apply_transform_to_first_instance = True, defer_change_notifications = False, append_options = [GeometryScriptCombineAttributesMode.ENABLE_ALL_MATCHING], debug = None)` -> `DynamicMesh` [classmethod] — Repeatedly apply AppendTransform to the AppendMesh, each time adding the geometry to TargetMesh.
  - `append_mesh_repeated_with_materials()` [classmethod] — Repeatedly apply AppendTransform to the AppendMesh, each time adding the geometry to TargetMesh. Also combines materials...
  - `append_mesh_transformed(target_mesh, append_mesh, append_transforms, constant_transform, constant_transform_is_relative = True, defer_change_notifications = False, append_options = [GeometryScriptCombineAttributesMode.ENABLE_ALL_MATCHING], debug = None)` -> `DynamicMesh` [classmethod] — For each transform in AppendTransforms, apply the transform to AppendMesh and then add its geometry to the TargetMesh.
  - `append_mesh_transformed_with_materials()` [classmethod] — For each transform in AppendTransforms, apply the transform to AppendMesh and then add its geometry to the TargetMesh. A...
  - `append_mesh_with_materials()` [classmethod] — Apply Append Transform to Append Mesh and then add its geometry to the Target Mesh. Also combines materials lists of the...
  - `delete_selected_triangles_from_mesh(target_mesh, selection, num_deleted=int32)` [classmethod] — Removes specified triangles, identified by mesh selection, from the mesh. On return, NumDeleted will contain the actual ...
  - `delete_triangle_from_mesh(target_mesh, triangle_id, was_triangle_deleted=bool)` [classmethod] — Removes a triangle from the mesh as indicated by the Triangle ID. Should the delete fail, e.g. if the specified triangle...
  - `delete_triangles_from_mesh(target_mesh, triangle_list, num_deleted=int32)` [classmethod] — Removes a list of triangles from the mesh. On return, NumDeleted will contain the actual number of triangles removed.
  - `delete_vertex_from_mesh(target_mesh, vertex_id, was_vertex_deleted=bool)` [classmethod] — Removes a vertex from the mesh as indicated by the VertexID. Should the delete fail, e.g. if the specified vertex was no...
  - `delete_vertices_from_mesh(target_mesh, vertex_list, num_deleted=int32)` [classmethod] — Removes a list of vertices from the mesh. On return, NumDeleted will contain the actual number of vertices removed.
  - `discard_mesh_attributes(target_mesh, defer_change_notifications = False)` -> `DynamicMesh` [classmethod] — Discard Mesh Attributes
  - `merge_mesh_vertex_pair(target_mesh, vertex_keep, vertex_discard, options, interp_param=0.500000, defer_change_notifications=False, success=bool)` [classmethod] — Attempt to merge together two vertices, and report whether they were merged. Note that some merges may be prevented beca...
  - `merge_mesh_vertices_in_selections(target_mesh, selection_keep, selection_discard, options, interp_param=0.500000, distance_threshold=1.000000, defer_change_notifications=False, num_merged=int32)` [classmethod] — Attempt to merge together vertices in one selection to their closest vertices in the second selection, within a distance...
  - `set_all_mesh_vertex_positions(target_mesh, position_list, debug = None)` -> `DynamicMesh` [classmethod] — Set all vertex positions in the TargetMesh to the specified Positions.
  - `set_vertex_position(target_mesh, vertex_id, new_position, is_valid_vertex=bool)` [classmethod] — Set Vertex Position

### `unreal.GeometryScript_MeshGeodesic`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshGeodesicFunctions.h`

Geometry Script Library Mesh Geodesic Functions

**Methods** (3):
  - `create_surface_path(target_mesh, direction, start_triangle_id, start_bary_coords, max_path_length, surface_path=GeometryScriptPolyPath, found_errors=bool)` [classmethod] — Computes a PolyPath that represents a âstraightâ surface path starting at the prescribed point on the mesh, and cont...
  - `get_shortest_surface_path(target_mesh, start_triangle_id, start_bary_coords, end_triangle_id, end_bary_coords, shortest_path=GeometryScriptPolyPath, found_errors=bool)` [classmethod] — Computes a PolyPath that represents the shortest mesh surface path between two prescribed points on the provided mesh. T...
  - `get_shortest_vertex_path(target_mesh, start_vertex_id, end_vertex_id, vertex_id_list=GeometryScriptIndexList, found_errors=bool)` [classmethod] — Computes a vertex list that represents the shortest path constrained to travel along mesh triangle edges between the pre...

### `unreal.GeometryScript_MeshModeling`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshModelingFunctions.h`

Geometry Script Library Mesh Modeling Functions

**Methods** (13):
  - `apply_mesh_bevel_edge_selection(target_mesh, selection, bevel_options, debug = None)` -> `DynamicMesh` [classmethod] — Apply a Mesh Bevel operation to parts of TargetMesh using the BevelOptions settings.
  - `apply_mesh_bevel_selection(target_mesh, selection, bevel_mode, bevel_options, debug = None)` -> `DynamicMesh` [classmethod] — Apply a Mesh Bevel operation to parts of TargetMesh using the BevelOptions settings, with additional options to handle r...
  - `apply_mesh_disconnect_faces(target_mesh, selection, allow_bowties_in_output = True, debug = None)` -> `DynamicMesh` [classmethod] — Disconnect the triangles of TargetMesh identified by the Selection. The input Selection will still identify the same geo...
  - `apply_mesh_disconnect_faces_along_edges(target_mesh, selection, debug = None)` -> `DynamicMesh` [classmethod] — Disconnect triangles of TargetMesh along the edges of the Selection. The input Selection will still identify the same ge...
  - `apply_mesh_duplicate_faces()` [classmethod] — Duplicate the triangles of TargetMesh identified by the Selection
  - `apply_mesh_extrude(target_mesh: DynamicMesh, options: GeometryScriptMeshExtrudeOptions, debug: GeometryScriptDebug = Ellipsis)` -> `DynamicMesh` [classmethod] — deprecated: âapply_mesh_extrudeâ was renamed to âapply_mesh_extrude_compatibility_5p0â.
  - `apply_mesh_extrude_compatibility_5p0(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod]
  - `apply_mesh_inset_outset_faces(target_mesh, options, selection, debug = None)` -> `DynamicMesh` [classmethod] — Apply an Inset or Outset to the faces of TargetMesh identified by the Selection, or all faces if the Selection is empty.
  - `apply_mesh_linear_extrude_faces(target_mesh, options, selection, debug = None)` -> `DynamicMesh` [classmethod] — Apply Linear Extrusion (ie extrusion in a single direction) to the triangles of TargetMesh identified by the Selection. ...
  - `apply_mesh_offset(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod] — Offset the vertices of TargetMesh from their initial positions based on averaged vertex normals. This function is intend...
  - `apply_mesh_offset_faces(target_mesh, options, selection, debug = None)` -> `DynamicMesh` [classmethod] — Apply an Offset to the faces of TargetMesh identified by the Selection, or all faces if the Selection is empty. The Offs...
  - `apply_mesh_polygroup_bevel(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod] — Apply a Mesh Bevel operation to all PolyGroup Edges.
  - `apply_mesh_shell(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod] — Create a thickened shell from TargetMesh by offsetting the vertex positions along averaged vertex normals, inwards or ou...

### `unreal.GeometryScript_MeshPoolUtility`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshPoolFunctions.h`

Geometry Script Library Mesh Pool Functions

**Methods** (2):
  - `discard_global_mesh_pool()` -> `None` [classmethod] — Fully clear/destroy the current global mesh pool, allowing it and all its meshes to be garbage collected
  - `get_global_mesh_pool()` -> `DynamicMeshPool` [classmethod] — Access a global compute mesh pool (created on first access)

### `unreal.GeometryScript_MeshQueries`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshQueryFunctions.h`

Geometry Script Library Mesh Query Functions

**Methods** (49):
  - `compute_triangle_barycentric_coords(target_mesh, triangle_id, is_valid_triangle=bool, vertex1=Vector, vertex2=Vector, vertex3=Vector, barycentric_coords=Vector)` [classmethod] — Compute the barycentric coordinates (A,B,C) of the Point relative to the specified TriangleID of the TargetMesh. The pro...
  - `get_all_split_u_vs_at_vertex()` [classmethod] — Returns the unique UV element IDs and values associated with the mesh vertex, in the specified UV Channel. If the Vertex...
  - `get_all_triangle_i_ds(triangle_id_list=GeometryScriptIndexList, has_triangle_id_gaps=bool)` [classmethod] — Returns an Index List of all Triangle IDs in a mesh.
  - `get_all_triangle_indices(target_mesh, triangle_list=GeometryScriptTriangleList, has_triangle_id_gaps=bool)` [classmethod]
  - `get_all_uv_seam_edges(target_mesh, have_valid_u_vs=bool, element_i_ds=GeometryScriptIndexList)` [classmethod] — Returns all edge element IDs that are UV seam edges for a given UV channel.
  - `get_all_vertex_i_ds(vertex_id_list=GeometryScriptIndexList, has_vertex_id_gaps=bool)` [classmethod] — Returns an IndexList of all Vertex IDs in mesh.
  - `get_all_vertex_positions(target_mesh, position_list=GeometryScriptVectorList, has_vertex_id_gaps=bool)` [classmethod] — Returns a Vector List of all the mesh vertex 3D positions (possibly large!).
  - `get_all_vertex_positions_at_edges(target_mesh, start=GeometryScriptVectorList, end=GeometryScriptVectorList)` [classmethod] — Returns the vertex positions for each edge in the given index list.
  - `get_has_material_i_ds(target_mesh)` -> `bool` [classmethod] — Returns true if the mesh has Material IDs available/enabled.
  - `get_has_polygroups(target_mesh)` -> `bool` [classmethod] — Returns true if the mesh has a standard PolyGroup Layer.
  - `get_has_triangle_id_gaps(target_mesh)` -> `bool` [classmethod] — Returns true if there are gaps in the Triangle ID list, such that Get Num Triangle IDs is greater than Get Triangle Coun...
  - `get_has_triangle_normals(target_mesh)` -> `bool` [classmethod]
  - `get_has_vertex_colors(target_mesh)` -> `bool` [classmethod]
  - `get_has_vertex_id_gaps(target_mesh)` -> `bool` [classmethod] — Returns true if there are gaps in the Vertex ID list. For example, Get Number of Vertex IDs is greater than Get Vertex C...
  - `get_interpolated_triangle_normal(target_mesh, triangle_id, tri_has_valid_normals=bool, interpolated_normal=Vector)` [classmethod] — Compute the interpolated Normal (A*Normal1 + B*Normal2 + C*Normal3), where (A,B,C)=BarycentricCoords and the Normals are...
  - `get_interpolated_triangle_normal_tangents(target_mesh, triangle_id, tri_has_valid_elements=bool, interpolated_normal=Vector, interpolated_tangent=Vector, interpolated_bi_tangent=Vector)` [classmethod] — Compute the interpolated Normal and Tangents for the specified specified TriangleID in the Normal and Tangent attributes...
  - `get_interpolated_triangle_position(target_mesh, triangle_id, is_valid_triangle=bool, interpolated_position=Vector)` [classmethod] — Compute the interpolated Position (A*Vertex1 + B*Vertex2 + C*Vertex3), where (A,B,C)=BarycentricCoords and the Vertex po...
  - `get_interpolated_triangle_uv(target_mesh, uv_set_index, triangle_id, tri_has_valid_u_vs=bool, interpolated_uv=Vector2D)` [classmethod] — Compute the interpolated UV (A*UV1+ B*UV2+ C*UV3), where (A,B,C)=BarycentricCoords and the UV positions are taken from t...
  - `get_interpolated_triangle_vertex_color(target_mesh, triangle_id, barycentric_coords, tri_has_valid_vertex_colors=bool, interpolated_color=LinearColor)` [classmethod] — Compute the interpolated Vertex Color (A*Color1 + B*Color2 + C*Color3), where (A,B,C)=BarycentricCoords and the Colors a...
  - `get_is_closed_mesh(target_mesh)` -> `bool` [classmethod] — Returns true if the mesh is closed, such as no topological boundary edges.
  - `get_is_dense_mesh(target_mesh)` -> `bool` [classmethod] — Returns true if the mesh is dense. For example, no gaps in Vertex IDs or Triangle IDs. Note if a mesh is not dense, the ...
  - `get_mesh_bounding_box(target_mesh)` -> `Box` [classmethod] — Computes the bounding box of the mesh vertices in the local space of the mesh.
  - `get_mesh_has_attribute_set(target_mesh)` -> `bool` [classmethod] — Returns true if the Target Mesh has attributes enabled.
  - `get_mesh_info_string(target_mesh)` -> `str` [classmethod] — Returns information about the Target Mesh, such as the vertex and triangle count as well as some attribute information.
  - `get_mesh_uv_area(target_mesh, is_valid_uv_channel=bool)` [classmethod] — Gets the area of triangles in UV space for the given UV Channel.
  - `get_mesh_volume_area(volume=float)` [classmethod] — Computes the volume and area of the mesh.
  - `get_mesh_volume_area_center(volume=float, center_of_mass=Vector)` [classmethod] — Computes the volume, area and center-of-mass of the mesh.
  - `get_num_connected_components(target_mesh)` -> `int32` [classmethod] — Returns the number of separate connected components in the mesh, such as âtriangle patchesâ internally connected by ...
  - `get_num_extended_polygroup_layers(target_mesh)` -> `int32` [classmethod] — Returns the count of extended PolyGroup Layers.
  - `get_num_open_border_edges(target_mesh)` -> `int32` [classmethod] — Returns the number of topological boundary edges in the mesh, i.e counts edges that only have one adjacent triangle.
  - `get_num_open_border_loops(ambiguous_topology_found=bool)` [classmethod] — Returns the number of open border loops, such as âholesâ in the mesh.
  - `get_num_triangle_i_ds(target_mesh)` -> `int32` [classmethod] — Gets the number of Triangle IDs in the mesh. This may be larger than the Triangle Count if the mesh is not dense, even a...
  - `get_num_uv_islands(target_mesh, is_valid_uv_channel=bool)` [classmethod] — Returns the number of UV islands in a given UV channel.
  - `get_num_uv_sets(target_mesh)` -> `int32` [classmethod] — Gets the number of UV Channels on the Target Mesh.
  - `get_num_vertex_i_ds(target_mesh)` -> `int32` [classmethod] — Gets the number of Vertex IDs in the mesh, which may be larger than the Vertex Count, if the mesh is not dense (e.g. aft...
  - `get_triangle_face_normal(target_mesh, is_valid_triangle=bool)` [classmethod] — Get Triangle Face Normal
  - `get_triangle_indices(target_mesh, is_valid_triangle=bool)` [classmethod] — Returns the Vertex ID triplet for the specified Triangle.
  - `get_triangle_normal_tangents(target_mesh, tri_has_valid_elements=bool, normals=GeometryScriptTriangle, tangents=GeometryScriptTriangle, bi_tangents=GeometryScriptTriangle)` [classmethod] — For the specified Triangle ID of the TargetMesh, get the Normal and Tangent vectors at each vertex of the Triangle. Thes...
  - `get_triangle_normals(target_mesh, normal1=Vector, normal2=Vector, normal3=Vector, tri_has_valid_normals=bool)` [classmethod] — For the specified TriangleID of the Target Mesh, get the Normal vectors at each vertex of the Triangle. These Normals wi...
  - `get_triangle_positions(target_mesh, vertex1=Vector, vertex2=Vector, vertex3=Vector)` [classmethod]
  - `get_triangle_u_vs(target_mesh, uv_set_index, uv2=Vector2D, uv3=Vector2D, have_valid_u_vs=bool)` [classmethod] — Returns the UV values associated with the three vertices of the triangle in the specified UV Channel. If the Triangle do...
  - `get_triangle_vertex_colors(target_mesh, color1=LinearColor, color2=LinearColor, color3=LinearColor, tri_has_valid_vertex_colors=bool)` [classmethod] — For the specified TriangleID of the TargetMesh, get the Vertex Colors at each vertex of the Triangle. These Colors will ...
  - `get_uv_set_bounding_box(target_mesh, is_valid_uv_set=bool, uv_set_is_empty=bool)` [classmethod] — Gets the 2D bounding box of all UVs in the UV Channel. If the UV Channel does not exist, or if the UV Channel is empty, ...
  - `get_vertex_connected_triangles()` [classmethod] — Return array of Triangle IDs connected to the given VertexID, ie the triangle one-ring
  - `get_vertex_connected_vertices()` [classmethod] — Return array of Vertex IDs connected via a mesh edge to the given VertexID, ie the vertex one-ring
  - `get_vertex_count(target_mesh)` -> `int32` [classmethod] — Gets the number of vertices in the mesh. Note this may be less than the number of Vertex IDs used as some vertices may h...
  - `get_vertex_position(target_mesh, is_valid_vertex=bool)` [classmethod] — Gets the 3D position of a mesh vertex in the mesh local space, by Vertex ID.
  - `is_valid_triangle_id(target_mesh, triangle_id)` -> `bool` [classmethod] — Returns true if Triangle ID refers to a valid Triangle in the Target Mesh.
  - `is_valid_vertex_id(target_mesh, vertex_id)` -> `bool` [classmethod] — Returns true if Vertex ID refers to a valid vertex in the Target Mesh.

### `unreal.GeometryScript_MeshRepair`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshRepairFunctions.h`

Geometry Script Library Mesh Repair Functions

**Methods** (10):
  - `compact_mesh(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Compacts the meshâs vertices and triangles to remove any âholesâ in the Vertex ID or Triangle ID lists.
  - `fill_all_mesh_holes(target_mesh, fill_options, num_filled_holes=int32, num_failed_hole_fills=int32)` [classmethod] — Tries to fill all open boundary loops (such as holes in the geometry surface) of a mesh.
  - `remove_hidden_triangles(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod] — Removes any triangles in the mesh that are not visible from the exterior view, under various definitions of âvisibleâ...
  - `remove_small_components(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod]
  - `remove_unused_vertices(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Remove vertices that are not used by any triangles. Note: Does not update the IDs of any remaining vertices; use Compact...
  - `repair_mesh_degenerate_geometry(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod] — Removes triangles that have area or edge length below specified amounts depending on the Options requested.
  - `resolve_mesh_t_junctions(target_mesh, resolve_options, debug = None)` -> `DynamicMesh` [classmethod] — Attempts to resolve T-Junctions in the mesh by addition of vertices and welding.
  - `snap_mesh_open_boundaries(target_mesh, snap_options, debug = None)` -> `DynamicMesh` [classmethod] — Snap vertices on open edges to the closest compatible open boundary, if found within the tolerance distance Unlike Resol...
  - `split_mesh_bowties(target_mesh, mesh_bowties = True, attribute_bowties = True, debug = None)` -> `DynamicMesh` [classmethod] — Splits Bowties in the mesh and/or the attributes. A Bowtie is formed when a single vertex is connected to more than two ...
  - `weld_mesh_edges(target_mesh, weld_options, debug = None)` -> `DynamicMesh` [classmethod] — Welds any open boundary edges of the mesh together if possible in order to remove âcracks.â

### `unreal.GeometryScript_MeshSampling`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshSamplingFunctions.h`

Geometry Script Library Mesh Sampling Functions

**Methods** (6):
  - `compute_non_uniform_point_sampling()` [classmethod] — Compute a set of sample points lying on the surface of TargetMesh based on the provided sampling Options and NonUniformO...
  - `compute_point_sampling()` [classmethod] — Compute a set of sample points lying on the surface of TargetMesh based on the provided sampling Options. Samples are ap...
  - `compute_render_capture_cameras_for_box(box, options, debug = None)` -> `Array [ GeometryScriptRenderCaptureCamera ]` [classmethod] — Compute a set of Render Capture Cameras to capture a scene within the given Box
  - `compute_render_capture_point_sampling(actors, cameras, debug = None)` -> `Array [ Transform ]` [classmethod] — Compute oriented sample points on the visible surfaces of the given Actors The Samples are computed using Render Capture...
  - `compute_uniform_random_point_sampling()` [classmethod] — Compute a âuniform randomâ (not âuniform spacingâ) point sampling over the mesh surface
  - `compute_vertex_weighted_point_sampling()` [classmethod] — Compute a set of sample points lying on the surface of TargetMesh based on the provided sampling Options and NonUniformO...

### `unreal.GeometryScript_MeshSculptLayers`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshSculptLayersFunctions.h`

Geometry Script Library Mesh Sculpt Layers Functions

**Methods** (9):
  - `discard_sculpt_layers(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Discard all sculpt layer data, leaving current vertex positions unchanged
  - `enable_sculpt_layers(target_mesh, num_layers, debug = None)` -> `DynamicMesh` [classmethod] — Enable Sculpt Layers on the Target Mesh, if not already enabled, with at least the requested number of layers. Note: Wil...
  - `get_active_sculpt_layer(target_mesh)` -> `int32` [classmethod] — Get the current sculpting layers active on the mesh, or -1 if the mesh does not have sculpting layers
  - `get_num_sculpt_layers(target_mesh)` -> `int32` [classmethod] — Get the number of sculpting layers active on the mesh
  - `get_sculpt_layer_weights_array(target_mesh)` -> `Array [ double ]` [classmethod] — Get the weights of all sculpt layers on the mesh
  - `merge_sculpt_layers(target_mesh, merge_layer_start, merge_layer_num, use_weights=True, out_active_layer=int32)` [classmethod] — Merge a range of sculpt layers together. May change the Active Sculpt Layer.
  - `set_active_sculpt_layer(target_mesh, layer_index, debug = None)` -> `DynamicMesh` [classmethod] — Set the requested LayerIndex as the current active sculpt layer, if possible.
  - `set_sculpt_layer_weight(target_mesh, layer_index, weight, options = [True], debug = None)` -> `DynamicMesh` [classmethod] — Set the weight of the layer at LayerIndex to the requested Weight
  - `set_sculpt_layer_weights_array(target_mesh, weights, options = [True], debug = None)` -> `DynamicMesh` [classmethod] — Set the weights of multiple layers to match the given Weights array. Note: If the Weights array length is larger than th...

### `unreal.GeometryScript_MeshSelection`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshSelectionFunctions.h`

Geometry Script Library Mesh Selection Functions

**Methods** (27):
  - `combine_mesh_selections(selection_a, selection_b, combine_mode = GeometryScriptCombineSelectionMode.ADD)` -> `GeometryScriptMeshSelection` [classmethod] — Combine two Mesh Selections into a new Mesh Selection. The two inputs SelectionA and SelectionB must have the same Type.
  - `convert_index_array_to_mesh_selection(target_mesh, index_array, selection=GeometryScriptMeshSelection)` [classmethod] — Create a Mesh Selection from the IndexArray.
  - `convert_index_list_to_mesh_selection(target_mesh, index_list, selection=GeometryScriptMeshSelection)` [classmethod] — Create a Mesh Selection from the Index List. For cases where the IndexList Type does not match the SelectionType, Conver...
  - `convert_index_set_to_mesh_selection(target_mesh, index_set, selection=GeometryScriptMeshSelection)` [classmethod] — Create a Mesh Selection from the IndexSet.
  - `convert_mesh_selection(target_mesh, from_selection, new_type=GeometryScriptMeshSelectionType.TRIANGLES, to_selection=GeometryScriptMeshSelection)` [classmethod] — Convert a Mesh Selection to a different Type (eg Vertices to Triangles, etc) By default, Vertices map to Triangle one-ri...
  - `convert_mesh_selection_to_index_array()` [classmethod] — Convert a Mesh Selection to an Index Array
  - `convert_mesh_selection_to_index_list(target_mesh, selection, index_list=GeometryScriptIndexList, result_list_type=GeometryScriptIndexType)` [classmethod] — Convert a Mesh Selection to an Index List
  - `create_select_all_mesh_selection(target_mesh, selection=GeometryScriptMeshSelection)` [classmethod] — Create a Selection of the given SelectionType that contains all the mesh elements of TargetMesh
  - `debug_print_mesh_selection(selection, disable = False)` -> `None` [classmethod] — Print information about the Mesh Selection to the Output Log
  - `expand_contract_mesh_selection(target_mesh, selection, iterations=1, contract=False, new_selection=GeometryScriptMeshSelection)` [classmethod] — Grow or Shrink the Selection on the TargetMesh to connected neighbours. For Vertex selections, Expand includes vertices ...
  - `expand_mesh_selection_to_connected(target_mesh, selection, new_selection=GeometryScriptMeshSelection)` [classmethod] — Expand the Selection on the TargetMesh to connected regions and return the NewSelection
  - `get_mesh_selection_info(num_selected=int32)` [classmethod] — Query information about a Mesh Selection Note that NumSelected may double count some polygroups and (non-border) edges d...
  - `get_mesh_unique_selection_info(target_mesh, num_selected=int32)` [classmethod] — Query information about a Mesh Selection, and get a count of unique selected elements
  - `invert_mesh_selection(target_mesh, selection, new_selection=GeometryScriptMeshSelection)` [classmethod] — Invert the Selection on the TargetMesh, ie select what is not currently selected
  - `select_mesh_boundary_edges(selection=GeometryScriptMeshSelection)` [classmethod] — Create a new Selection, for the TargetMesh, of all mesh boundary edges
  - `select_mesh_elements_by_material_id(target_mesh, material_id, selection=GeometryScriptMeshSelection)` [classmethod] — Create a Selection of the SelectionType that contains all mesh elements referencing triangles with the given Material ID
  - `select_mesh_elements_by_normal_angle()` [classmethod] — Create a new Mesh Selection of the SelectionType for the TargetMesh by finding all elements that have a normal vector th...
  - `select_mesh_elements_by_polygroup(target_mesh, group_layer, polygroup_id, selection=GeometryScriptMeshSelection)` [classmethod] — Create a Selection of the SelectionType that contains all mesh elements referencing triangles with the given PolyGroup I...
  - `select_mesh_elements_in_box(target_mesh, box, selection_type=GeometryScriptMeshSelectionType.TRIANGLES, invert=False, selection=GeometryScriptMeshSelection)` [classmethod] — Create a new Mesh Selection of the SelectionType for the TargetMesh by finding all elements contained in the Box.
  - `select_mesh_elements_in_sphere()` [classmethod] — Create a new Mesh Selection of the SelectionType for the TargetMesh by finding all elements contained in the Sphere.
  - `select_mesh_elements_inside_mesh(target_mesh, selection_mesh, selection_mesh_transform, selection_type=GeometryScriptMeshSelectionType.TRIANGLES, invert=False, shell_distance=0.000000, winding_threshold=0.500000, selection=GeometryScriptMeshSelection)` [classmethod] — Create a new Mesh Selection of the SelectionType for the TargetMesh by finding all elements inside a second SelectionMes...
  - `select_mesh_elements_with_plane()` [classmethod] — Create a new Mesh Selection of the SelectionType for the TargetMesh by finding all elements on the âpositiveâ side o...
  - `select_mesh_poly_group_boundary_edges(target_mesh, group_layer, selection=GeometryScriptMeshSelection)` [classmethod] — Create a new Mesh Selection of PolyGroup boundary edges for the TargetMesh
  - `select_mesh_sharp_edges(target_mesh, selection=GeometryScriptMeshSelection)` [classmethod] — Create a new Selection, for the TargetMesh, of all âsharpâ edges where the edgeâs adjacent triangle normals differ...
  - `select_mesh_split_normal_edges(selection=GeometryScriptMeshSelection)` [classmethod] — Create a new Selection, for the TargetMesh, of all edges seams in the mesh normal topology â i.e., where normals can b...
  - `select_mesh_uv_seam_edges(target_mesh, uv_channel, selection=GeometryScriptMeshSelection, have_valid_u_vs=bool)` [classmethod] — Create a new Mesh Selection of UV seam edges for the TargetMesh
  - `select_selection_boundary_edges(target_mesh, selection, boundary_selection=GeometryScriptMeshSelection)` [classmethod] — Create a new BoundarySelection, for the TargetMesh, of the edges on the boundary of another Selection

### `unreal.GeometryScript_MeshSelectionQueries`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshSelectionQueryFunctions.h`

Geometry Script Library Mesh Selection Query Functions

**Methods** (2):
  - `get_mesh_selection_boundary_loops()` [classmethod] — Compute the set of Vertex Loops bordering a Mesh Selection. Both the 3D polylines and lists of vertex indices are return...
  - `get_mesh_selection_bounding_box(target_mesh, selection, selection_bounds=Box, is_empty=bool)` [classmethod] — Get the 3D Bounding Box of a Mesh Selection, ie bounding box of vertices contained in the Selection

### `unreal.GeometryScript_MeshSimplification`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshSimplifyFunctions.h`

Geometry Script Library Mesh Simplify Functions

**Methods** (7):
  - `apply_editor_simplify_to_triangle_count(target_mesh, triangle_count, debug = None)` -> `DynamicMesh` [classmethod] — Simplifies the mesh until a target triangle count is reached, using the UE Editorâs standard mesh simplifier. Editor o...
  - `apply_editor_simplify_to_vertex_count(target_mesh, vertex_count, debug = None)` -> `DynamicMesh` [classmethod] — Simplifies the mesh until a target vertex count is reached, using the UE Editorâs standard mesh simplifier. Editor onl...
  - `apply_simplify_to_planar(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod] — Simplifies planar areas of the mesh that have more triangles than necessary. Note that it does not change the 3D shape o...
  - `apply_simplify_to_polygroup_topology(target_mesh, options, group_layer, debug = None)` -> `DynamicMesh` [classmethod] — Simplifies the mesh down to the PolyGroup Topology. For example, the high-level faces of the mesh PolyGroups. Another ex...
  - `apply_simplify_to_tolerance(target_mesh, tolerance, options, debug = None)` -> `DynamicMesh` [classmethod] — Simplifies the mesh to a target geometric tolerance. Stops when any further simplification would result in a deviation f...
  - `apply_simplify_to_triangle_count(target_mesh, triangle_count, options, debug = None)` -> `DynamicMesh` [classmethod] — Simplifies the mesh until a target triangle count is reached. Behavior can be additionally controlled with the Options.
  - `apply_simplify_to_vertex_count(target_mesh, vertex_count, options, debug = None)` -> `DynamicMesh` [classmethod] — Simplifies the mesh until a target vertex count is reached. Behavior can be additionally controlled with the Options.

### `unreal.GeometryScript_MeshSpatial`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshSpatialFunctions.h`

Geometry Script Library Mesh Spatial

**Methods** (8):
  - `build_bvh_for_mesh(target_mesh, output_bvh=GeometryScriptDynamicMeshBVH)` [classmethod] — Builds a Bounding Volume Hierarchy (BVH) object for a mesh that can be used with multiple spatial queries.
  - `find_nearest_point_on_mesh(target_mesh, query_bvh, query_point, options, nearest_result=GeometryScriptTrianglePoint, outcome=GeometryScriptSearchOutcomePins)` [classmethod] — Finds the nearest point (Nearest Result) on the Target Mesh to a given 3D point (Query Point) by using the Query BVH.
  - `find_nearest_ray_intersection_with_mesh(target_mesh, query_bvh, ray_origin, ray_direction, options, hit_result=GeometryScriptRayHitResult, outcome=GeometryScriptSearchOutcomePins)` [classmethod] — Finds the nearest intersection of a 3D ray with the mesh by using the Query BVH. Note, depending on the Ray Origin and R...
  - `is_bvh_valid_for_mesh(target_mesh, test_bvh, is_valid=bool)` [classmethod] — Checks if the provided Bounding Volume Hierarchy (BVH) can still be used with the Mesh â it generally returns false if...
  - `is_point_inside_mesh(target_mesh, query_bvh, query_point, options, is_inside=bool, outcome=GeometryScriptContainmentOutcomePins)` [classmethod] — Tests if a point is inside the mesh using the Fast Winding Number query and data stored in the BVH.
  - `rebuild_bvh_for_mesh(target_mesh, update_bvh, only_if_invalid=True, update_bvh=GeometryScriptDynamicMeshBVH)` [classmethod] — Rebuilds the Bounding Volume Hierarchy (BVH) for the mesh in-place, which can reduce memory allocations, compared to bui...
  - `reset_bvh(reset_bvh)` -> `GeometryScriptDynamicMeshBVH` [classmethod] — Reset the Bounding Volume Hierarchy (BVH) by clearing all the internal data.
  - `select_mesh_elements_in_box_with_bvh(target_mesh, query_bvh, query_box, options, selection_type=GeometryScriptMeshSelectionType.VERTICES, min_num_triangle_points=3, selection=GeometryScriptMeshSelection)` [classmethod] — Create Mesh Selection of mesh elements in TargetMesh contained by QueryBox, using QueryBVH to accellerate the computatio...

### `unreal.GeometryScript_MeshSubdivide`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshSubdivideFunctions.h`

Geometry Script Library Mesh Subdivide Functions

**Methods** (3):
  - `apply_pn_tessellation(target_mesh, options, tessellation_level = 3, debug = None)` -> `DynamicMesh` [classmethod] — Apply PN Tessellation to the Target Mesh as controlled by the Tessellation Level and the Options.
  - `apply_selective_tessellation(target_mesh, selection, options, tessellation_level = 1, pattern_type = SelectiveTessellatePatternType.CONCENTRIC_RINGS, debug = None)` -> `DynamicMesh` [classmethod] — Selectively Tessellate a Selection of the Target Mesh or possibly the entire mesh as controlled by the Options.
  - `apply_uniform_tessellation(target_mesh, tessellation_level = 3, debug = None)` -> `DynamicMesh` [classmethod] — Apply Uniform Tessellation to the Target Mesh as controlled by the Tessellation Level and the Options.

### `unreal.GeometryScript_MeshTransforms`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshTransformFunctions.h`

Geometry Script Library Mesh Transform Functions

**Methods** (11):
  - `inverse_transform_mesh(target_mesh, transform, fix_orientation_for_negative_scale = True, debug = None)` -> `DynamicMesh` [classmethod] — Applies the inverse of the provided Transform to the TargetMesh
  - `inverse_transform_mesh_selection(target_mesh, selection, transform, debug = None)` -> `DynamicMesh` [classmethod] — Applies the inverse of the given Transform to the vertices identified by the Selection of the TargetMesh.
  - `rotate_mesh(target_mesh, rotation, rotation_origin = [0.000000,0.000000,0.000000], debug = None)` -> `DynamicMesh` [classmethod] — Rotates the mesh relative to the specified Rotation Origin.
  - `rotate_mesh_selection(target_mesh, selection, rotation, rotation_origin = [0.000000,0.000000,0.000000], debug = None)` -> `DynamicMesh` [classmethod] — Rotates the selected part of the mesh relative to the specified Rotation Origin.
  - `scale_mesh(target_mesh, scale = [1.000000,1.000000,1.000000], scale_origin = [0.000000,0.000000,0.000000], fix_orientation_for_negative_scale = True, debug = None)` -> `DynamicMesh` [classmethod] — Applies the provided Scale transformation relative to the Scale Origin to the vertices of a Mesh.
  - `scale_mesh_selection(target_mesh, selection, scale = [1.000000,1.000000,1.000000], scale_origin = [0.000000,0.000000,0.000000], debug = None)` -> `DynamicMesh` [classmethod] — Applies the given Scale transform relative to the Scale Origin to the selection part of the mesh.
  - `transform_mesh(target_mesh, transform, fix_orientation_for_negative_scale = True, debug = None)` -> `DynamicMesh` [classmethod] — Applies the provided Transform to the vertices of a Mesh.
  - `transform_mesh_selection(target_mesh, selection, transform, debug = None)` -> `DynamicMesh` [classmethod] — Applies the given Transform to the vertices identified by the Selection of the mesh.
  - `translate_mesh(target_mesh, translation, debug = None)` -> `DynamicMesh` [classmethod] — Applies the provided Translation to the vertices of a Mesh.
  - `translate_mesh_selection(target_mesh, selection, translation, debug = None)` -> `DynamicMesh` [classmethod] — Applies the given Translation to the vertices identified by the Selection of the mesh.
  - `translate_pivot_to_location(target_mesh, pivot_location, debug = None)` -> `DynamicMesh` [classmethod] — Set the Pivot Location for the Mesh. Since the Pivot of a Mesh object is always the point at (0,0,0), this function simp...

### `unreal.GeometryScript_MeshVoxelProcessing`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshVoxelFunctions.h`

Geometry Script Library Mesh Voxel Functions

**Methods** (2):
  - `apply_mesh_morphology(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod] — Replaces the mesh with an SDF-based offset mesh approximation (VoxOffset operation).
  - `apply_mesh_solidify(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod] — Replaces the mesh with a voxelized-and-meshed approximation (VoxWrap operation).

### `unreal.GeometryScript_Normals`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshNormalsFunctions.h`

Geometry Script Library Mesh Normals Functions

**Methods** (18):
  - `auto_repair_normals(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Attempt to repair inconsistent normals in TargetMesh. Currently this is done in two passes. In the first pass, triangles...
  - `compute_split_normals(target_mesh, split_options, calculate_options, debug = None)` -> `DynamicMesh` [classmethod] — Recompute hard edges / split-normals for TargetMesh based on the provided SplitOptions, and then recompute the new share...
  - `compute_tangents(target_mesh, options, debug = None)` -> `DynamicMesh` [classmethod] — Recompute Tangents for the TargetMesh, using the method and settings specified by FGeometryScriptTangentsOptions note: I...
  - `discard_tangents(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Remove any existing Tangents Attribute Layer from the TargetMesh
  - `flip_normals(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Flip/Invert the normal vectors of TargetMesh by multiplying them by -1, as well as reversing the mesh triangle orientati...
  - `flip_triangle_selection_normals(target_mesh, selection, flip_triangle_orientation = True, flip_normal_direction = True, debug = None)` -> `DynamicMesh` [classmethod] — Flip/Invert the normal vectors of the triangles in a given selection of TargetMesh. For edge or vertex selections, norma...
  - `get_mesh_has_tangents(target_mesh, has_tangents=bool)` [classmethod] — Check if the TargetMesh has a Tangents Attribute Layer enabled
  - `get_mesh_per_vertex_normals(target_mesh, normal_list=GeometryScriptVectorList, is_valid_normal_set=bool, has_vertex_id_gaps=bool)` [classmethod] — Get a list of single normal vectors for each mesh vertex in the TargetMesh, derived from the Normals Overlay. The Normal...
  - `get_mesh_per_vertex_tangents(target_mesh, tangent_x_list=GeometryScriptVectorList, tangent_y_list=GeometryScriptVectorList, is_valid_tangent_set=bool, has_vertex_id_gaps=bool)` [classmethod] — Get a list of single tangent vectors for each mesh vertex in the TargetMesh, derived from the Tangents Overlays. The Tan...
  - `recompute_normals(target_mesh, calculate_options, defer_change_notifications = False, debug = None)` -> `DynamicMesh` [classmethod] — Recompute the normals of TargetMesh using the given CalculateOptions. This method will preserve any existing hard edges,...
  - `recompute_normals_for_mesh_selection(target_mesh, selection, calculate_options, defer_change_notifications = False, debug = None)` -> `DynamicMesh` [classmethod] — Recompute the normals of TargetMesh on all the triangles/vertices of the given Selection using the given CalculateOption...
  - `set_mesh_per_vertex_normals(target_mesh, vertex_normal_list, debug = None)` -> `DynamicMesh` [classmethod] — Set all normals in the TargetMesh Normals Overlay to the specified per-vertex normals
  - `set_mesh_per_vertex_tangents(target_mesh, tangent_x_list, tangent_y_list, debug = None)` -> `DynamicMesh` [classmethod] — Set all tangents in the TargetMesh Tangents Overlays to the specified per-vertex tangents note: If setting Tangents for ...
  - `set_mesh_triangle_normals(target_mesh, triangle_id, normals, is_valid_triangle=bool)` [classmethod] — Set the triangle-vertex normals for the given TriangleID on the TargetMesh. This will create unique triangle-vertex norm...
  - `set_per_face_normals(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Recompute the normals of TargetMesh by setting the normals of each triangle vertex to the triangle/face normal. Each ver...
  - `set_per_vertex_normals(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Recompute the normals of TargetMesh by averaging the triangle/face normals around each vertex, using combined area and a...
  - `set_split_normals_along_selected_edges(target_mesh, selection, split = True, recalculate_normals = True, calculate_options = [True,True], defer_change_notifications = False, debug = None)` -> `DynamicMesh` [classmethod] — Set or remove split normals (aka sharp normals) for all edges in the Selection
  - `update_vertex_normal(target_mesh, vertex_id, update_normal=True, new_normal, update_tangents, new_tangent_x, new_tangent_y, merge_split_values, is_valid_vertex=bool)` [classmethod] — Update the Normals and/or Tangents at VertexID of TargetMesh. Note that the specified vertex may have âsplit normalsâ...

### `unreal.GeometryScript_PointSetSampling`
Inherits: `BlueprintFunctionLibrary` | Header: `PointSetFunctions.h`

Geometry Script Library Point Set Sampling Functions

**Methods** (9):
  - `downsample_points(points, options, keep_num_points = 100, debug = None)` -> `GeometryScriptIndexList` [classmethod] — Find a subset of the given Points of a specified size. Can optionally specify a priorty weighting and/or request uniform...
  - `flatten_points(points_in3d, options)` -> `Array [ Vector2D ]` [classmethod] — Convert an array of points from 3D to 2D, by transforming into the given ReferenceFrame and taking the X,Y coordinates N...
  - `get_points_from_index_list(all_points, indices)` -> `Array [ Vector ]` [classmethod] — Create an array of the subset of AllPoints indicated by the Indices list
  - `k_means_cluster_to_arrays(points, options)` -> `Array [ GeometryScriptIndexList ]` [classmethod] — Use K-Means clustering to cluster the given points into a target number of clusters, and return the clusters as an array...
  - `k_means_cluster_to_i_ds(points, options)` -> `Array [ int32 ]` [classmethod] — Use K-Means clustering to cluster the given points into a target number of clusters, and return an array with a cluster ...
  - `make_bounding_box_from_points(points, expand_by = 0.000000)` -> `Box` [classmethod] — Make a Axis Aligned Bounding Box that bounds the given Points, optionally expanded by some additional amount on each sid...
  - `offset_transforms(transforms, offset, direction = [0.000000,0.000000,1.000000], space = GeometryScriptCoordinateSpace.LOCAL)` -> `Array [ Transform ]` [classmethod] — Offset the location of all Transforms by Offset in the given Direction, either locally in the space of the transform or ...
  - `transforms_to_points(transforms)` -> `Array [ Vector ]` [classmethod] — Create an array of the positions of the input Transforms
  - `unflatten_points(points_in2d, options, height = 0.000000)` -> `Array [ Vector ]` [classmethod] — Convert an array of points from 2D to 3D, by transforming out of the given ReferenceFrame, with the given Height for the...

### `unreal.GeometryScript_PolygonList`
Inherits: `BlueprintFunctionLibrary` | Header: `PolygonFunctions.h`

Geometry Script Library Polygon List Functions

**Methods** (24):
  - `add_polygon_to_list(polygon_list, outer_polygon, hole_polygons, polygon_list=GeometryScriptGeneralPolygonList)` [classmethod] — Add Polygon to a Polygon List, with optional holes. Returns index of the added polygon.
  - `append_polygon_list(polygon_list, polygons_to_append)` -> `GeometryScriptGeneralPolygonList` [classmethod] — Append the polygons in âPolygons to Appendâ to Polygon List
  - `create_polygon_list_from_simple_polygons(outer_polygons)` -> `GeometryScriptGeneralPolygonList` [classmethod] — Create a Polygon List from an array of Simple Polygons
  - `create_polygon_list_from_single_polygon(outer_polygon, hole_polygons, fix_hole_orientations = True)` -> `GeometryScriptGeneralPolygonList` [classmethod] — Create a Polygon List of a single Polygon, with optional holes
  - `create_polygons_from_open_poly_paths_offset(poly_paths, offset_options, offset, operation_success=bool)` [classmethod] — Apply an offset to a set of open 2D PolyPaths, generating closed polygons as a result
  - `create_polygons_from_path_offset(path, offset_options, offset, operation_success=bool)` [classmethod] — Apply an offset to a single open 2D path, generating closed polygons as a result
  - `get_polygon_area(polygon_list, valid_index=bool)` [classmethod] — Returns the area enclosed by a specified Polygon in a Polygon List. Returns zero for an invalid PolygonIndex.
  - `get_polygon_bounds(polygon_list, valid_index=bool)` [classmethod] — Returns the bounding box of a Polygon. Returns an empty, invalid box for an invalid PolygonIndex.
  - `get_polygon_count(polygon_list)` -> `int32` [classmethod] — Returns the number of polygons in the Polygon List
  - `get_polygon_hole_count(polygon_list, valid_index=bool)` [classmethod] — Returns the number of holes in a Polygon. Returns zero for an invalid PolygonIndex.
  - `get_polygon_list_area(polygon_list)` -> `double` [classmethod] — Returns the area enclosed by a Polygon List
  - `get_polygon_list_bounds(polygon_list)` -> `Box2D` [classmethod] — Returns the bounding box of a Polygon List
  - `get_polygon_vertex(polygon_list, vertex_index, polygon_index, is_valid_vertex=bool)` [classmethod] — Returns the specified vertex of a Polygon â either of the outer polygon, if HoleIndex is -1, or specified inner hole. ...
  - `get_polygon_vertex_count(polygon_list, polygon_index, valid_indices=bool)` [classmethod] — Returns the number of vertices in a Polygonâs outer shape, if HoleIndex is -1, or in the specified inner hole. Returns...
  - `get_polygon_vertices()` [classmethod] — Returns the vertices of a Polygon â either of the outer polygon, if HoleIndex is -1, or specified inner hole. OutVerti...
  - `get_simple_polygon(polygon_list, polygon_index, valid_indices=bool)` [classmethod] — Returns a specified Simple Polygon from a Polygon List â either the outer polygon, if HoleIndex is -1, or specified in...
  - `polygons_difference(polygon_list, polygons_to_subtract)` -> `GeometryScriptGeneralPolygonList` [classmethod] — Compute difference of Polygon List and Polygons to Subtract
  - `polygons_exclusive_or(polygon_list, polygons_to_exclusive_or)` -> `GeometryScriptGeneralPolygonList` [classmethod] — Compute exclusive or of Polygon List and Polygons to Exclusive Or
  - `polygons_intersection(polygon_list, polygons_to_intersect)` -> `GeometryScriptGeneralPolygonList` [classmethod] — Compute intersection of Polygon List and Polygons to Intersect
  - `polygons_morphology_close(polygon_list, offset_options, offset, operation_success=bool)` [classmethod] — Apply a morphological âcloseâ operator to a list of closed polygons â first offsetting by +Offset, then by -Offset...
  - `polygons_morphology_open(polygon_list, offset_options, offset, operation_success=bool)` [classmethod] — Apply a morphological âopenâ operator to a list of closed polygons â first offsetting by -Offset, then by +Offset....
  - `polygons_offset(polygon_list, offset_options, offset, operation_success=bool)` [classmethod] — Apply a single offset to a list of closed polygons
  - `polygons_offsets(polygon_list, offset_options, first_offset, second_offset, operation_success=bool)` [classmethod] — Apply two offsets in sequence to a list of closed polygons
  - `polygons_union(polygon_list, copy_input_on_failure = True)` -> `GeometryScriptGeneralPolygonList` [classmethod] — Compute union of all polygons in Polygon List. Also resolves self-intersections within each polygon.

### `unreal.GeometryScript_PolyGroups`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshPolygroupFunctions.h`

Geometry Script Library Mesh Polygroup Functions

**Methods** (19):
  - `add_named_polygroup_layer(target_mesh, layer_name, group_layer=GeometryScriptGroupLayer, already_existed=bool)` [classmethod] — Add an extended polygroup layer with the given name. If a layer with that name is already on the mesh, that existing lay...
  - `clear_polygroups(target_mesh, group_layer, clear_value = 0, debug = None)` -> `DynamicMesh` [classmethod] — Resets the triangle PolyGroup assignments within a PolyGroup Layer to the given Clear Value (or 0 if no Clear Value is s...
  - `compute_polygroups_from_angle_threshold(target_mesh, group_layer, crease_angle = 15.000000, min_group_size = 2, debug = None)` -> `DynamicMesh` [classmethod] — Sets PolyGroups by partitioning the mesh based on an edge crease/opening-angle. Note, this will have no effect if the Gr...
  - `compute_polygroups_from_polygon_detection(target_mesh, group_layer, respect_uv_seams = True, respect_hard_normals = False, quad_adjacency_weight = 1.000000, quad_metric_clamp = 1.000000, max_search_rounds = 1, debug = None)` -> `DynamicMesh` [classmethod] — Sets PolyGroups by identifying adjacent triangles that form reasonable quads. Note any triangles that do not neatly pair...
  - `convert_components_to_polygroups(target_mesh, group_layer, debug = None)` -> `DynamicMesh` [classmethod] — Creates and assigns a new PolyGroup for each disconnected component of a Mesh. Regions of a mesh are disconnected they d...
  - `convert_uv_islands_to_polygroups(target_mesh, group_layer, uv_layer = 0, debug = None)` -> `DynamicMesh` [classmethod] — Creates and assigns a new PolyGroup for each disconnected UV island of a Mesh. Note, this will have no effect if either ...
  - `copy_polygroups_layer(target_mesh, from_group_layer, to_group_layer, debug = None)` -> `DynamicMesh` [classmethod] — Copies the triangle PolyGroup assignments from one layer on the Target Mesh to another. Note, this will have no effect i...
  - `delete_triangles_in_polygroup(target_mesh, group_layer, polygroup_id, defer_change_notifications=False, num_deleted=int32)` [classmethod] — Deletes all triangles from the Target Mesh that have a particular PolyGroup ID, in the specific Group Layer.
  - `enable_polygroups(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Enables the standard PolyGroup Layer on the Target Mesh.
  - `find_extended_polygroup_layer_by_name(target_mesh, layer_name, group_layer=GeometryScriptGroupLayer, outcome=GeometryScriptSearchOutcomePins)` [classmethod] — Find an extended PolyGroup layer by its name. If there are multiple layers with the same name, returns the first such la...
  - `get_all_triangle_polygroup_i_ds(target_mesh, group_layer, polygroup_i_ds_out=GeometryScriptIndexList)` [classmethod] — Create list of per-triangle PolyGroup IDs for the PolyGroup in the Mesh warning: if the mesh is not Triangle-Compact (eg...
  - `get_poly_group_bounding_box(target_mesh, group_layer, bounds=Box)` [classmethod] — Compute the bounds of a PolyGroup
  - `get_poly_group_uv_bounding_box(target_mesh, group_layer, group_id, uv_bounds=Box2D)` [classmethod] — Compute the UV bounds of a PolyGroup
  - `get_poly_group_uv_centroid(target_mesh, group_layer, group_id, centroid=Vector2D, is_valid=bool)` [classmethod] — Compute the UV centroid of a PolyGroup
  - `get_polygroup_i_ds_in_mesh(target_mesh, group_layer, polygroup_i_ds_out=GeometryScriptIndexList)` [classmethod] — Create list of all unique PolyGroup IDs that exist in the PolyGroup Layer in the Mesh
  - `get_triangle_polygroup_id(target_mesh, group_layer, is_valid_triangle=bool)` [classmethod] — Gets the PolyGroup ID associated with the specified Triangle ID and stored in the Group Layer. If the Group Layer or the...
  - `get_triangles_in_polygroup(target_mesh, group_layer, polygroup_id, triangle_i_ds_out=GeometryScriptIndexList)` [classmethod] — Create list of all triangles with the given PolyGroup ID in the given GroupLayer (not necessarily a single connected-com...
  - `set_num_extended_polygroup_layers(target_mesh, num_layers, debug = None)` -> `DynamicMesh` [classmethod] — Sets the number of extended PolyGroup Layers on a Mesh.
  - `set_polygroup_for_mesh_selection(target_mesh, group_layer, selection, set_polygroup_id=0, generate_new_polygroup=False, set_polygroup_id_out=int32)` [classmethod] — Set a new PolyGroup on all the triangles of the given Selection, for the given GroupLayer.

### `unreal.GeometryScript_PolyPath`
Inherits: `BlueprintFunctionLibrary` | Header: `PolyPathFunctions.h`

Geometry Script Library Poly Path Functions

**Methods** (21):
  - `conv_array_of_vector2d_to_geometry_script_poly_path(path_vertices)` -> `GeometryScriptPolyPath` [classmethod] — Returns a PolyPath created from an array of 2D position vectors. The Z-coordinate of the corresponding PolyPath vertices...
  - `conv_array_to_geometry_script_poly_path(path_vertices)` -> `GeometryScriptPolyPath` [classmethod] — Returns a PolyPath created from an array of 3D position vectors.
  - `conv_geometry_script_poly_path_to_array(poly_path)` -> `Array [ Vector ]` [classmethod] — Returns an array of 3D vectors with the PolyPath vertex locations.
  - `conv_geometry_script_poly_path_to_array_of_vector2d(poly_path)` -> `Array [ Vector2D ]` [classmethod] — Returns an array of 2D Vectors with the PolyPath vertex locations projected onto the XY plane.
  - `convert_array_of_vector2d_to_poly_path(vertex_array)` -> `GeometryScriptPolyPath` [classmethod] — Creates a PolyPath from an array of 2D position vectors. The Z-coordinate of the corresponding PolyPath vertices will be...
  - `convert_array_to_poly_path(vertex_array)` -> `GeometryScriptPolyPath` [classmethod] — Creates a PolyPath from an array of 3D position vectors.
  - `convert_poly_path_to_array(poly_path)` -> `Array [ Vector ]` [classmethod] — Populates an array of 3D vectors with the PolyPath vertex locations.
  - `convert_poly_path_to_array_of_vector2d(poly_path)` -> `Array [ Vector2D ]` [classmethod] — Creates an array of 2D Vectors with the PolyPath vertex locations projected onto the XY plane.
  - `convert_spline_to_poly_path(spline, sampling_options)` -> `GeometryScriptPolyPath` [classmethod] — Sample positions from a USplineComponent into a PolyPath, based on the given SamplingOptions
  - `create_arc_path2d(center = [0.000000,0.000000], radius = 10.000000, num_points = 10, start_angle = 0.000000, end_angle = 90.000000)` -> `GeometryScriptPolyPath` [classmethod] — Create an open arc on the XY plane around the given Center. As it is an open path, the end vertex exactly hits the targe...
  - `create_arc_path3d(transform, radius = 10.000000, num_points = 10, start_angle = 0.000000, end_angle = 90.000000)` -> `GeometryScriptPolyPath` [classmethod] — Create an open arc around the origin on the XY plane, then transformed by Transform. As it is an open path, the end vert...
  - `create_circle_path2d(center = [0.000000,0.000000], radius = 10.000000, num_points = 10)` -> `GeometryScriptPolyPath` [classmethod] — Create a closed circle on the XY plane around the given Center. By our convention for closed paths, the end vertex is no...
  - `create_circle_path3d(transform, radius = 10.000000, num_points = 10)` -> `GeometryScriptPolyPath` [classmethod] — Create a closed circle around the origin on the XY plane, then transformed by Transform. By our convention for closed pa...
  - `flatten_to2d_on_axis(poly_path, drop_axis = GeometryScriptAxis.Z)` -> `GeometryScriptPolyPath` [classmethod] — Create a 2D, flattened copy of the path by dropping the given axis, and using the other two coordinates as the new X, Y ...
  - `get_nearest_vertex_index(poly_path, point)` -> `int32` [classmethod] — Find the index of the vertex closest to a given point. Returns -1 if the PolyPath has no vertices.
  - `get_poly_path_arc_length(poly_path)` -> `double` [classmethod] — Returns the length of the PolyPath.
  - `get_poly_path_last_index(poly_path)` -> `int32` [classmethod] — Returns the index of the last vertex in the PolyPath.
  - `get_poly_path_num_vertices(poly_path)` -> `int32` [classmethod] — Returns the number of vertices in the the PolyPath.
  - `get_poly_path_tangent(poly_path, is_valid_index=bool)` [classmethod] — Returns the local tangent vector of the PolyPath at the specified vertex index. If the Index does not correspond to a ve...
  - `get_poly_path_vertex(poly_path, is_valid_index=bool)` [classmethod] — Returns the 3D position of the requested vertex in the PolyPath. If the Index does not correspond to a vertex in the Pol...
  - `sample_spline_to_transforms(spline, sampling_options, relative_transform, include_scale = True)` -> `(frames=Array[Transform], frame_times=Array[double]) or None` [classmethod] — Sample a USplineComponent into a list of FTransforms, based on the given SamplingOptions.

### `unreal.GeometryScript_Primitives`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshPrimitiveFunctions.h`

Geometry Script Library Mesh Primitive Functions

**Methods** (38):
  - `append_bounding_box(target_mesh, primitive_options, transform, box, steps_x = 0, steps_y = 0, steps_z = 0, debug = None)` -> `DynamicMesh` [classmethod] — Appends a 3D box to the Target Mesh with dimensions and origin taken from the input Box
  - `append_bounding_box_with_collision(target_mesh, primitive_options, transform, box, steps_x=0, steps_y=0, steps_z=0, simple_collision=GeometryScriptSimpleCollision)` [classmethod] — Appends a 3D box to the Target Mesh with dimensions and origin taken from the input Box Also creates matching simple col...
  - `append_box(target_mesh, primitive_options, transform, dimension_x = 100.000000, dimension_y = 100.000000, dimension_z = 100.000000, steps_x = 0, steps_y = 0, steps_z = 0, origin = GeometryScriptPrimitiveOriginMode.BASE, debug = None)` -> `DynamicMesh` [classmethod] — Appends a 3D box to the Target Mesh.
  - `append_box_with_collision(target_mesh, primitive_options, transform, dimension_x=100.000000, dimension_y=100.000000, dimension_z=100.000000, steps_x=0, steps_y=0, steps_z=0, origin=GeometryScriptPrimitiveOriginMode.BASE, simple_collision=GeometryScriptSimpleCollision)` [classmethod] — Appends a 3D box to the Target Mesh Also creates matching simple collision
  - `append_capsule(target_mesh, primitive_options, transform, radius = 30.000000, line_length = 75.000000, hemisphere_steps = 5, circle_steps = 8, segment_steps = 0, origin = GeometryScriptPrimitiveOriginMode.BASE, debug = None)` -> `DynamicMesh` [classmethod] — Appends a 3D Capsule to the Target Mesh.
  - `append_capsule_with_collision(target_mesh, primitive_options, transform, radius=30.000000, line_length=75.000000, hemisphere_steps=5, circle_steps=8, segment_steps=0, origin=GeometryScriptPrimitiveOriginMode.BASE, simple_collision=GeometryScriptSimpleCollision)` [classmethod] — Appends a 3D Capsule to the Target Mesh. Also creates matching simple collision. Note: If transform has non-uniform scal...
  - `append_cone(target_mesh, primitive_options, transform, base_radius = 50.000000, top_radius = 5.000000, height = 100.000000, radial_steps = 12, height_steps = 4, capped = True, origin = GeometryScriptPrimitiveOriginMode.BASE, debug = None)` -> `DynamicMesh` [classmethod] — Appends a 3D cone to the Target Mesh.
  - `append_curved_stairs(target_mesh, primitive_options, transform, step_width = 100.000000, step_height = 20.000000, inner_radius = 150.000000, curve_angle = 90.000000, num_steps = 8, floating = False, debug = None)` -> `DynamicMesh` [classmethod] — Appends a rising circular staircase to the Target Mesh.
  - `append_cylinder(target_mesh, primitive_options, transform, radius = 50.000000, height = 100.000000, radial_steps = 12, height_steps = 0, capped = True, origin = GeometryScriptPrimitiveOriginMode.BASE, debug = None)` -> `DynamicMesh` [classmethod] — Appends a 3D Cylinder (with optional end caps) to the Target Mesh.
  - `append_delaunay_triangulation2d()` [classmethod] — Generates a Delaunay Triangulation of the provided vertices, and appends it to the Target Mesh. If optional Constrained ...
  - `append_disc(target_mesh, primitive_options, transform, radius = 50.000000, angle_steps = 16, spoke_steps = 0, start_angle = 0.000000, end_angle = 360.000000, hole_radius = 0.000000, debug = None)` -> `DynamicMesh` [classmethod] — Appends a planar disc to the Target Mesh.
  - `append_linear_stairs(target_mesh, primitive_options, transform, step_width = 100.000000, step_height = 20.000000, step_depth = 30.000000, num_steps = 8, floating = False, debug = None)` -> `DynamicMesh` [classmethod] — Appends a linear staircase to the Target Mesh.
  - `append_polygon_list_triangulation(target_mesh, primitive_options, transform, polygon_list, triangulation_options, triangulation_error=bool)` [classmethod] — Generates a Delaunay Triangulation of the provided Polygon List, and appends it to the Target Mesh.
  - `append_rectangle(target_mesh: DynamicMesh, primitive_options: GeometryScriptPrimitiveOptions, transform: Transform, dimension_x: float = 100.0, dimension_y: float = 100.0, steps_width: int = 0, steps_height: int = 0, debug: GeometryScriptDebug = Ellipsis)` -> `DynamicMesh` [classmethod] — deprecated: âappend_rectangleâ was renamed to âappend_rectangle_compatibility_5_0â.
  - `append_rectangle_compatibility_5_0(target_mesh, primitive_options, transform, dimension_x = 100.000000, dimension_y = 100.000000, steps_width = 0, steps_height = 0, debug = None)` -> `DynamicMesh` [classmethod] — 5.0 Preview 1 Compatibility version of AppendRectangleXY. Incorrectly interprets the input dimensions. Incorrectly divid...
  - `append_rectangle_xy(target_mesh, primitive_options, transform, dimension_x = 100.000000, dimension_y = 100.000000, steps_width = 0, steps_height = 0, debug = None)` -> `DynamicMesh` [classmethod] — Appends a planar Rectangle to a Dynamic Mesh.
  - `append_revolve_path(target_mesh, primitive_options, transform, path_vertices, revolve_options, steps = 8, capped = True, debug = None)` -> `DynamicMesh` [classmethod] — Revolves an open 2D path, with optional top and bottom end caps, appending the result to the Target Mesh.
  - `append_revolve_polygon(target_mesh, primitive_options, transform, polygon_vertices, revolve_options, radius = 100.000000, steps = 8, debug = None)` -> `DynamicMesh` [classmethod] — In the coordinate system of the revolve polygon, +X is towards the âoutsideâ of the revolve donut, and +Y is âupâ...
  - `append_round_rectangle(target_mesh: DynamicMesh, primitive_options: GeometryScriptPrimitiveOptions, transform: Transform, dimension_x: float = 100.0, dimension_y: float = 100.0, corner_radius: float = 5.0, steps_width: int = 0, steps_height: int = 0, steps_round: int = 4, debug: GeometryScriptDebug = Ellipsis)` -> `DynamicMesh` [classmethod] — deprecated: âappend_round_rectangleâ was renamed to âappend_round_rectangle_compatibility_5_0â.
  - `append_round_rectangle_compatibility_5_0(target_mesh, primitive_options, transform, dimension_x = 100.000000, dimension_y = 100.000000, corner_radius = 5.000000, steps_width = 0, steps_height = 0, steps_round = 4, debug = None)` -> `DynamicMesh` [classmethod] — 5.0 Preview 1 Compatibility version of AppendRoundRectangleXY. Incorrectly divides the input DimensionX and DimensionY b...
  - `append_round_rectangle_xy(target_mesh, primitive_options, transform, dimension_x = 100.000000, dimension_y = 100.000000, corner_radius = 5.000000, steps_width = 0, steps_height = 0, steps_round = 4, debug = None)` -> `DynamicMesh` [classmethod] — Appends a planar Rectangle with Rounded Corners (RoundRect) to the Target Mesh.
  - `append_simple_collision_shapes(target_mesh, primitive_options, transform, simple_collision, triangulation_options, debug = None)` -> `DynamicMesh` [classmethod] — Appends Simple Collision shapes to the Target Mesh, triangulated as specified by Triangulation Options
  - `append_simple_extrude_polygon(target_mesh, primitive_options, transform, polygon_vertices, height = 100.000000, height_steps = 0, capped = True, origin = GeometryScriptPrimitiveOriginMode.BASE, debug = None)` -> `DynamicMesh` [classmethod] — Polygon should be oriented counter-clockwise to produce a correctly-oriented shape, otherwise it will be inside-out Poly...
  - `append_simple_swept_polygon(target_mesh, primitive_options, transform, polygon_vertices, sweep_path, loop = False, capped = True, start_scale = 1.000000, end_scale = 1.000000, rotation_angle_deg = 0.000000, miter_limit = 1.000000, debug = None)` -> `DynamicMesh` [classmethod] — Sweeps a 2D polygon along an arbitrary 3D path, appending the result to the Target Mesh.
  - `append_sphere_box(target_mesh, primitive_options, transform, radius = 50.000000, steps_x = 6, steps_y = 6, steps_z = 6, origin = GeometryScriptPrimitiveOriginMode.CENTER, debug = None)` -> `DynamicMesh` [classmethod] — Appends a 3D sphere triangulated using box topology to the Target Mesh.
  - `append_sphere_box_with_collision(target_mesh, primitive_options, transform, radius=50.000000, steps_x=6, steps_y=6, steps_z=6, origin=GeometryScriptPrimitiveOriginMode.CENTER, simple_collision=GeometryScriptSimpleCollision)` [classmethod] — Appends a 3D sphere triangulated using box topology to the Target Mesh. Also creates matching simple collision. Note: If...
  - `append_sphere_covering(target_mesh, primitive_options, transform, sphere_covering, steps_x = 6, steps_y = 6, steps_z = 6, debug = None)` -> `DynamicMesh` [classmethod] — Appends the spheres in the Sphere Covering to the Target Mesh
  - `append_sphere_lat_long(target_mesh, primitive_options, transform, radius = 50.000000, steps_phi = 10, steps_theta = 16, origin = GeometryScriptPrimitiveOriginMode.CENTER, debug = None)` -> `DynamicMesh` [classmethod] — Appends a 3D Sphere triangulated using latitude/longitude topology to the Target Mesh.
  - `append_sphere_lat_long_with_collision(target_mesh, primitive_options, transform, radius=50.000000, steps_phi=10, steps_theta=16, origin=GeometryScriptPrimitiveOriginMode.CENTER, simple_collision=GeometryScriptSimpleCollision)` [classmethod] — Appends a 3D Sphere triangulated using latitude/longitude topology to the Target Mesh. Also creates matching simple coll...
  - `append_spiral_revolve_polygon(target_mesh, primitive_options, transform, polygon_vertices, revolve_options, radius = 100.000000, steps = 18, rise_per_revolution = 50.000000, debug = None)` -> `DynamicMesh` [classmethod] — Revolves a 2D polygon on a helical path, like one used to create a vertical spiral, appending the result to the Target M...
  - `append_sweep_polygon(target_mesh, primitive_options, transform, polygon_vertices, sweep_path, loop = False, capped = True, start_scale = 1.000000, end_scale = 1.000000, rotation_angle_deg = 0.000000, miter_limit = 1.000000, debug = None)` -> `DynamicMesh` [classmethod] — Sweep the given 2D PolygonVertices along the SweepPath specified as a set of FTransforms If the 2D vertices are (U,V), t...
  - `append_sweep_polyline(target_mesh, primitive_options, transform, polyline_vertices, sweep_path, polyline_tex_param_u, sweep_path_tex_param_v, loop = False, start_scale = 1.000000, end_scale = 1.000000, rotation_angle_deg = 0.000000, miter_limit = 1.000000, debug = None)` -> `DynamicMesh` [classmethod] — Sweep the given 2D PolylineVertices along the SweepPath specified as a set of FTransforms If the 2D vertices are (U,V), ...
  - `append_torus(target_mesh, primitive_options, transform, revolve_options, major_radius = 50.000000, minor_radius = 25.000000, major_steps = 16, minor_steps = 8, origin = GeometryScriptPrimitiveOriginMode.BASE, debug = None)` -> `DynamicMesh` [classmethod] — Appends a 3D torus (donut) or partial torus to the Target Mesh.
  - `append_triangulated_polygon(target_mesh, primitive_options, transform, polygon_vertices, allow_self_intersections = True, debug = None)` -> `DynamicMesh` [classmethod] — Appends a Triangulated Polygon to the Target Mesh. Polygon should be oriented counter-clockwise to produce a correctly-o...
  - `append_triangulated_polygon3d(target_mesh, primitive_options, transform, polygon_vertices3d, debug = None)` -> `DynamicMesh` [classmethod] — Appends a Triangulated Polygon (with vertices specified in 3D) to the Target Mesh. Uses Ear Clipping-based triangulation...
  - `append_voronoi_diagram2d(target_mesh, primitive_options, transform, voronoi_sites, voronoi_options, debug = None)` -> `DynamicMesh` [classmethod] — Generates triangulated Voronoi Cells from the provided Voronoi Sites, identifying each with PolyGroups, and appends to t...
  - `create_constrained_edges_chain(num_vertices, start = 0)` -> `Array [ IntPoint ]` [classmethod] — Intended for use with AppendDelaunayTriangulation2D: Create a chain of edges through sequential vertices e.g., a Chain(3...
  - `create_constrained_edges_loop(num_vertices, start = 0)` -> `Array [ IntPoint ]` [classmethod] — Intended for use with AppendDelaunayTriangulation2D: Create a loop of edges through sequential vertices e.g., a Loop(3,0...

### `unreal.GeometryScript_Ray`
Inherits: `BlueprintFunctionLibrary` | Header: `ShapeFunctions.h`

Geometry Script Library Ray Functions

**Methods** (13):
  - `get_ray_box_intersection(ray, box)` -> `double or None` [classmethod] — Find the intersection of a Ray and a Box
  - `get_ray_closest_point(ray, point)` -> `Vector` [classmethod] — Get the closest point on the Ray to the given Point
  - `get_ray_line_closest_point(ray, line_origin, ray_parameter=double, ray_point=Vector, line_parameter=double, line_point=Vector)` [classmethod] — Compute the pair of closest points on a 3D Ray and Line. The Line is defined by an Origin and Direction (ie same as a Ra...
  - `get_ray_parameter(ray, point)` -> `double` [classmethod] — Project the given Point onto the closest point along the Ray, and return the Ray Parameter/Distance at that Point
  - `get_ray_plane_intersection(ray, plane)` -> `double or None` [classmethod] — Find the intersection of a Ray and a Plane
  - `get_ray_point(ray, distance)` -> `Vector` [classmethod] — Get a Point at the given Distance along the Ray (Origin + Distance*Direction)
  - `get_ray_point_distance(ray, point)` -> `double` [classmethod] — Get the distance from Point to the closest point on the Ray
  - `get_ray_segment_closest_point(ray, seg_start_point, ray_parameter=double, ray_point=Vector, seg_point=Vector)` [classmethod] — Compute the pair of closest points on a 3D Ray and Line Segment The Line Segment is defined by its two Endpoints.
  - `get_ray_sphere_intersection(ray, sphere_center, sphere_radius)` -> `(distance1=double, distance2=double) or None` [classmethod] — Check if the Ray intersects a Sphere defined by the SphereCenter and SphereRadius. This function returns two intersectio...
  - `get_ray_start_end(ray, start_distance=0.000000, end_point=Vector)` [classmethod] — Get two points along the ray.
  - `get_transformed_ray(ray, transform, invert = False)` -> `Ray` [classmethod] — Apply the given Transform to the given Ray, or optionally the Transform Inverse, and return the new transformed Ray
  - `make_ray_from_point_direction(origin, direction, direction_is_normalized = True)` -> `Ray` [classmethod] — Create a Ray from an Origin and Direction, with optionally non-normalized Direction
  - `make_ray_from_points(a, b)` -> `Ray` [classmethod] — Create a Ray from two points, placing the Origin at A and the Direction as Normalize(B-A)

### `unreal.GeometryScript_Remeshing`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshRemeshFunctions.h`

Geometry Script Library Remeshing Functions

**Methods** (1):
  - `apply_uniform_remesh(target_mesh, remesh_options, uniform_options, debug = None)` -> `DynamicMesh` [classmethod] — Apply Uniform Remeshing to the TargetMesh. warning: this function can be quite expensive. The results may be non-determi...

### `unreal.GeometryScript_SceneUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `SceneUtilityFunctions.h`

Geometry Script Library Scene Utility Functions

**Methods** (5):
  - `copy_collision_meshes_from_object(from_object, to_dynamic_mesh, transform_to_world, use_complex_collision=False, sphere_resolution=16, local_to_world=Transform, outcome=GeometryScriptOutcomePins)` [classmethod] — Extract the Collision Geometry from FromObject and copy/approximate it with meshes stored in ToDynamicMesh. For Simple C...
  - `copy_mesh_from_component(component, to_dynamic_mesh, options, transform_to_world, local_to_world=Transform, outcome=GeometryScriptOutcomePins)` [classmethod] — Copy the mesh from a given Component to a Dynamic Mesh. Supported Component types are: StaticMeshComponent, SkinnedMeshC...
  - `create_dynamic_mesh_pool()` -> `DynamicMeshPool` [classmethod] — Create a new UDynamicMeshPool object. Caller needs to create a UProperty reference to the returned object, or it will be...
  - `determine_mesh_occlusion()` [classmethod] — Determine which meshes are entirely hidden by other meshes in the set, when viewed from outside.
  - `set_component_material_list(component, material_list, debug = None)` -> `None` [classmethod] — Configure the Material set on a PrimitiveComponent, by repeatedly calling SetMaterial. This is a simple utility function...

### `unreal.GeometryScript_SimplePolygon`
Inherits: `BlueprintFunctionLibrary` | Header: `PolygonFunctions.h`

Geometry Script Library Simple Polygon Functions

**Methods** (13):
  - `add_polygon_vertex(polygon, polygon=GeometryScriptSimplePolygon)` [classmethod] — Set the specified vertex of a Simple Polygon. Returns the index of the added vertex.
  - `conv_array_of_vector2d_to_geometry_script_simple_polygon(path_vertices)` -> `GeometryScriptSimplePolygon` [classmethod] — Returns a Polygon created from an array of 2D position vectors.
  - `conv_array_to_geometry_script_simple_polygon(path_vertices)` -> `GeometryScriptSimplePolygon` [classmethod] — Returns a Polygon created from an array of 3D position vectors, ignoring the Z coordinate.
  - `conv_geometry_script_simple_polygon_to_array(polygon)` -> `Array [ Vector ]` [classmethod] — Returns an array of 3D vectors with the Polygon vertex locations, with Z coordinate set to zero.
  - `conv_geometry_script_simple_polygon_to_array_of_vector2d(polygon)` -> `Array [ Vector2D ]` [classmethod] — Returns an array of 2D Vectors with the Polygon vertex locations.
  - `convert_spline_to_polygon(spline, sampling_options, drop_axis = GeometryScriptAxis.Z)` -> `GeometryScriptSimplePolygon` [classmethod] — Sample positions from a USplineComponent into a Simple Polyon, based on the given SamplingOptions
  - `get_polygon_arc_length(polygon)` -> `double` [classmethod] — Returns the arc length of a Simple Polygon
  - `get_polygon_area(polygon)` -> `double` [classmethod] — Returns the area enclosed by a Simple Polygon
  - `get_polygon_bounds(polygon)` -> `Box2D` [classmethod] — Returns the bounding box of a Simple Polygon
  - `get_polygon_tangent(polygon, polygon_is_empty=bool)` [classmethod] — Returns a vertexâs tangent of a Simple Polygon. VertexIndex loops around, so e.g., -1 gives the tangent of the last ve...
  - `get_polygon_vertex(polygon, polygon_is_empty=bool)` [classmethod] — Returns the specified vertex of a Simple Polygon. VertexIndex loops around, so e.g., -1 gives the last vertex in the pol...
  - `get_polygon_vertex_count(polygon)` -> `int32` [classmethod] — Returns the number of vertices in a Simple Polygon
  - `set_polygon_vertex(polygon, vertex_index, polygon_is_empty=bool)` [classmethod] — Set the specified vertex of a Simple Polygon. VertexIndex loops around, so e.g., -1 gives the last vertex in the polygon...

### `unreal.GeometryScript_TextureUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `TextureMapFunctions.h`

Geometry Script Library Texture Map Functions

**Methods** (2):
  - `sample_texture2d_at_uv_positions(uv_list, texture, sample_options, debug = None)` -> `GeometryScriptColorList` [classmethod] — Samples the given TextureMap at the list of UV positions and returns the color at each position in ColorList output.
  - `sample_texture_render_target2d_at_uv_positions(uv_list, texture, sample_options, debug = None)` -> `GeometryScriptColorList` [classmethod] — Sample the the given TextureMap at the list of UV positions and return the color at each position in ColorList output. T...

### `unreal.GeometryScript_Transform`
Inherits: `BlueprintFunctionLibrary` | Header: `ShapeFunctions.h`

Geometry Script Library Transform Functions

**Methods** (5):
  - `get_transform_axis_plane(transform, axis = GeometryScriptAxis.X)` -> `Plane` [classmethod] — Get the Plane at the Transform Location with the Plane Normal aligned with the direction of the X/Y/Z axis of the Transf...
  - `get_transform_axis_ray(transform, axis = GeometryScriptAxis.X)` -> `Ray` [classmethod] — Get the Ray at the Transform Location aligned with the direction of the X/Y/Z axis of the Transform, ie the Direction Ve...
  - `get_transform_axis_vector(transform, axis = GeometryScriptAxis.X)` -> `Vector` [classmethod] — Get the Vector for the direction of the X/Y/Z axis of the Transform, ie the Vector resulting from transforming the unit ...
  - `make_transform_from_axes(location, z_axis, tangent_axis, tangent_is_x = True)` -> `Transform` [classmethod] — Create a Transform at the given Location, with the ZAxis vector as the Z axis of the Transform, and the X or Y axis orie...
  - `make_transform_from_z_axis(location, z_axis)` -> `Transform` [classmethod] — Create a Transform at the given Location, with the ZAxis vector as the Z axis of the Transform.

### `unreal.GeometryScript_UVs`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshUVFunctions.h`

Geometry Script Library Mesh UVFunctions

**Methods** (29):
  - `add_uv_element_to_mesh(target_mesh, uv_set_index, new_uv_position, new_uv_element_id=int32, is_valid_uv_set=bool)` [classmethod] — Adds a new UV Element to the specified UV Channel of the Mesh and returns a new UV Element ID.
  - `apply_texel_density_uv_scaling(target_mesh, uv_set_index, options, selection, debug = None)` -> `DynamicMesh` [classmethod] — Rescales UVs in the UV Channel for a Mesh to match a specified texel density, described by the options passed in. Suppor...
  - `auto_generate_patch_builder_mesh_u_vs(target_mesh, uv_set_index, options, debug = None)` -> `DynamicMesh` [classmethod] — Computes new UVs for the specified UV Channel using PatchBuilder method in the Options, and optionally packs.
  - `auto_generate_x_atlas_mesh_u_vs(target_mesh, uv_set_index, options, debug = None)` -> `DynamicMesh` [classmethod] — Computes new UVs for the specified UV Channel using XAtlas, and optionally packs.
  - `clear_uv_channel(target_mesh, uv_channel, debug = None)` -> `DynamicMesh` [classmethod] — Clear UVChannel
  - `compute_mesh_local_uv_param()` [classmethod] — Compute local UV parameterization on TargetMesh vertices around the given CenterPoint / Triangle. This method uses a Dis...
  - `copy_mesh_to_mesh_uv_layer(copy_from_uv_mesh, to_uv_set_index, copy_to_mesh, only_uv_positions=True, copy_to_mesh=DynamicMesh, copy_to_mesh_out=DynamicMesh, found_topology_errors=bool, is_valid_uv_set=bool)` [classmethod] — Transfer the 3D vertex positions and triangles of CopyFromUVMesh to the given UV Channel identified by ToUVChannel of Co...
  - `copy_mesh_uv_layer_to_mesh(copy_from_mesh, uv_set_index, copy_to_uv_mesh, copy_to_uv_mesh=DynamicMesh, copy_to_uv_mesh_out=DynamicMesh, invalid_topology=bool, is_valid_uv_set=bool)` [classmethod] — Copy the 2D UVs from the given UV Channel in CopyFromMesh to the 3D vertex positions in CopyToUVMesh, with the triangle ...
  - `copy_uv_set(target_mesh, from_uv_set, to_uv_set, debug = None)` -> `DynamicMesh` [classmethod] — Copy the data in one UV Channel to another UV Channel on the same Target Mesh.
  - `get_mesh_per_vertex_u_vs(target_mesh, uv_set_index, uv_list=GeometryScriptUVList, is_valid_uv_set=bool, has_vertex_id_gaps=bool, has_split_u_vs=bool)` [classmethod] — Get a list of single vertex UVs for each mesh vertex in the TargetMesh, derived from the specified UV Channel. The UV Ch...
  - `get_mesh_triangle_uv_element_i_ds(target_mesh, uv_set_index, triangle_uv_elements=IntVector, have_valid_u_vs=bool)` [classmethod] — Returns the UV Element IDs associated with the three vertices of the triangle in the specified UV Channel. If the Triang...
  - `get_mesh_uv_element_position(target_mesh, uv_set_index, uv_position=Vector2D, is_valid_element_id=bool)` [classmethod] — Returns the UV Position for a given UV Element ID in the specified UV Channel. If the UV Set or Element ID does not exis...
  - `get_mesh_uv_size_info(target_mesh, uv_set_index, selection, only_include_valid_uv_tris=True, mesh_area=double, uv_area=double, mesh_bounds=Box, uv_bounds=Box2D, is_valid_uv_set=bool, found_unset_u_vs=bool)` [classmethod] — Compute information about dimensions and areas for a UV Set of a Mesh, with an optional Mesh Selection
  - `intersects_uv_box2d(a, b, wrapped_to_unit_range = False)` -> `bool` [classmethod] — Test two Box2D bounds for intersection, with optional support for working in a wrapped space
  - `layout_mesh_u_vs(target_mesh, uv_set_index, layout_options, selection, debug = None)` -> `DynamicMesh` [classmethod] — Packs the existing UV islands in the specified UV Channel into standard UV space based on the Repack Options.
  - `recompute_mesh_u_vs(target_mesh, uv_set_index, options, selection, debug = None)` -> `DynamicMesh` [classmethod] — Recomputes UVs in the UV Channel for a Mesh based on different types of well-defined UV islands, such as existing UV isl...
  - `repack_mesh_u_vs(target_mesh, uv_set_index, repack_options, debug = None)` -> `DynamicMesh` [classmethod] — Packs the existing UV islands in the specified UV Channel into standard UV space based on the Repack Options.
  - `rotate_mesh_u_vs(target_mesh, uv_set_index, rotation_angle, rotation_origin, selection, debug = None)` -> `DynamicMesh` [classmethod] — Update all the selected UV values in the specified UV Channel by a rotation of Rotation Angle (in degrees) relative to t...
  - `scale_mesh_u_vs(target_mesh, uv_set_index, scale, scale_origin, selection, debug = None)` -> `DynamicMesh` [classmethod] — Update all selected UV values in the specified UV Channel by Scale, mathematically the new value is given by (UV - Scale...
  - `set_mesh_triangle_u_vs(target_mesh, uv_set_index, triangle_id, u_vs, is_valid_triangle=bool)` [classmethod] — Sets the UVs of a mesh triangle in the given UV Channel. This function will create new UV elements for each vertex of th...
  - `set_mesh_triangle_uv_element_i_ds(target_mesh, uv_set_index, triangle_id, triangle_uv_elements, is_valid_triangle=bool)` [classmethod] — Sets the UV Element IDs for a given Triangle in the specified UV Channel, ie the âUV Triangleâ indices. This functio...
  - `set_mesh_u_vs_from_box_projection(target_mesh, uv_set_index, box_transform, selection, min_island_tri_count = 2, debug = None)` -> `DynamicMesh` [classmethod] — Using Box Projection, update the UVs in the UV Channel for an entire mesh or a subset defined by a non-empty Selection.
  - `set_mesh_u_vs_from_cylinder_projection(target_mesh, uv_set_index, cylinder_transform, selection, split_angle = 45.000000, debug = None)` -> `DynamicMesh` [classmethod] — Using Cylinder Projection, update the UVs in the UV Channel for an entire mesh or a subset defined by a non-empty Select...
  - `set_mesh_u_vs_from_planar_projection(target_mesh, uv_set_index, plane_transform, selection, debug = None)` -> `DynamicMesh` [classmethod] — Scale of PlaneTransform defines world-space dimension that maps to 1 UV dimension
  - `set_mesh_uv_element_position(target_mesh, uv_set_index, element_id, new_uv_position, is_valid_element_id=bool)` [classmethod] — Sets the UV position of a specific ElementID in the given UV Set/Channel If the UV Set or Element ID does not exist, bIs...
  - `set_num_uv_sets(target_mesh, num_uv_sets, debug = None)` -> `DynamicMesh` [classmethod] — Set the number of UV Channels on the Target Mesh. If not already enabled, this will enable the mesh attributes.
  - `set_uv_seams_along_selected_edges(target_mesh, uv_channel, selection, insert_seams = True, defer_change_notifications = False, debug = None)` -> `DynamicMesh` [classmethod] — Convert Selection to an Edge selection, and set or remove UV seams along all of the selected edges
  - `transfer_mesh_u_vs_by_projection(target_mesh, target_uv_channel, target_selection, target_transform, source_mesh, source_mesh_optional_bvh, source_uv_channel, source_selection, source_transform, settings, projection_direction = [0.000000,0.000000,-1.000000], projection_offset = 0.000000, debug = None)` -> `DynamicMesh` [classmethod] — Copy UVs from one mesh to another, by projecting along the requested direction. Note: This does not transfer UV seams; i...
  - `translate_mesh_u_vs(target_mesh, uv_set_index, translation, selection, debug = None)` -> `DynamicMesh` [classmethod] — Update all selected UV values in the specified UV Channel by adding the Translation value to each. If the provided Selec...

### `unreal.GeometryScript_VectorMath`
Inherits: `BlueprintFunctionLibrary` | Header: `VectorMathFunctions.h`

Geometry Script Library Vector Math Functions

**Methods** (22):
  - `constant_scalar_multiply(constant, scalar_list)` -> `GeometryScriptScalarList` [classmethod] — Returns a Scalar List of the same length as the input Scalar List, with the elements computed as (Constant * A) where A ...
  - `constant_scalar_multiply_in_place(constant, scalar_list)` -> `GeometryScriptScalarList` [classmethod] — Compute (Constant * A) for each element A is the Scalar List, and the result is stored in the original Scalar List.
  - `constant_vector_multiply(constant, vector_list)` -> `GeometryScriptVectorList` [classmethod] — Compute (Constant * Vector) for each element in VectorList, and return in a new list
  - `constant_vector_multiply_in_place(constant, vector_list)` -> `GeometryScriptVectorList` [classmethod] — Compute (Constant * Vector) for each element in VectorList, and store in VectorList
  - `scalar_blend(scalar_list_a, scalar_list_b, constant_a = 1.000000, constant_b = 1.000000)` -> `GeometryScriptScalarList` [classmethod] — Compute (ConstantA * A) + (ConstantB * B) for each pair of values in ScalarListA and ScalarListB and return in new Scala...
  - `scalar_blend_in_place(scalar_list_a, scalar_list_b, constant_a = 1.000000, constant_b = 1.000000)` -> `GeometryScriptScalarList` [classmethod] — Compute (ConstantA * A) + (ConstantB * B) for each pair of values in ScalarListA and ScalarListB and return in ScalarLis...
  - `scalar_invert(scalar_list, numerator = 1.000000, set_on_failure = 0.000000, epsilon = 0.000000)` -> `GeometryScriptScalarList` [classmethod] — Compute (Numerator / Scalar) for each element of ScalarList and return in a new ScalarList. If Abs(Scalar) < Epsilon, se...
  - `scalar_invert_in_place(scalar_list, numerator = 1.000000, set_on_failure = 0.000000, epsilon = 0.000000)` -> `GeometryScriptScalarList` [classmethod] — Compute (Numerator / Scalar) for each element of ScalarList and store in input ScalarList If Abs(Scalar) < Epsilon, set ...
  - `scalar_multiply(scalar_list_a, scalar_list_b, constant_multiplier = 1.000000)` -> `GeometryScriptScalarList` [classmethod] — Returns a Scalar List constructed with each element is the product (ConstantMultiplier * A * B) where A and B are the co...
  - `scalar_multiply_in_place(scalar_list_a, scalar_list_b, constant_multiplier = 1.000000)` -> `GeometryScriptScalarList` [classmethod] — Compute (ConstantMultiplier * A * B) where A and B are the corresponding elements from ScalarListA and ScalarListB accor...
  - `scalar_vector_multiply(scalar_list, vector_list, scalar_multiplier = 1.000000)` -> `GeometryScriptVectorList` [classmethod] — Compute (ScalarMultiplier * Scalar * Vector) for each scalar/vector pair in the two input lists, and return in a new Vec...
  - `scalar_vector_multiply_in_place(scalar_list, vector_list, scalar_multiplier = 1.000000)` -> `GeometryScriptVectorList` [classmethod] — Compute (ScalarMultiplier * Scalar * Vector) for each scalar/vector pair in the two input lists, and store in the input ...
  - `vector_blend(vector_list_a, vector_list_b, constant_a = 1.000000, constant_b = 1.000000)` -> `GeometryScriptVectorList` [classmethod] — Compute (ConstantA * A) + (ConstantB * B) for each pair of vectors in VectorListA and VectorListB and return in new Vect...
  - `vector_blend_in_place(vector_list_a, vector_list_b, constant_a = 1.000000, constant_b = 1.000000)` -> `GeometryScriptVectorList` [classmethod] — Compute (ConstantA * A) + (ConstantB * B) for each pair of vectors in VectorListA and VectorListB, and store in VectorLi...
  - `vector_cross(vector_list_a, vector_list_b)` -> `GeometryScriptVectorList` [classmethod] — Compute the cross-product between each pair of vectors in VectorListA and VectorListB and return in new VectorList
  - `vector_dot(vector_list_a, vector_list_b)` -> `GeometryScriptScalarList` [classmethod] — Compute the dot-product between each pair of vectors in VectorListA and VectorListB and return in new ScalarList
  - `vector_inverse_transform_in_place(vector_list, transform, as_position = True)` -> `GeometryScriptVectorList` [classmethod] — Inverse transform each vector in VectorList, and store in VectorList.
  - `vector_length(vector_list)` -> `GeometryScriptScalarList` [classmethod] — Compute the length/magnitude of each vector in VectorListA and return in new ScalarList. Note that SquaredLength can be ...
  - `vector_normalize_in_place(vector_list, set_on_failure = [0.000000,0.000000,0.000000])` -> `GeometryScriptVectorList` [classmethod] — Normalize each vector in VectorList, and store in VectorList. If a vector is degenerate, set the normal to the SetOnFail...
  - `vector_plane_project_in_place(vector_list, plane)` -> `GeometryScriptVectorList` [classmethod] — Project each vector in VectorList to the given Plane, and store in VectorList.
  - `vector_to_scalar(vector_list, constant_x = 1.000000, constant_y = 0.000000, constant_z = 0.000000)` -> `GeometryScriptScalarList` [classmethod] — Convert each Vector in VectorList to a Scalar by computing (ConstantX*Vector.X + ConstantY*Vector.Y + ConstantZ*Vector.Z...
  - `vector_transform_in_place(vector_list, transform, as_position = True)` -> `GeometryScriptVectorList` [classmethod] — Transform each vector in VectorList, and store in VectorList.

### `unreal.GeometryScript_VertexColors`
Inherits: `BlueprintFunctionLibrary` | Header: `MeshVertexColorFunctions.h`

Geometry Script Library Mesh Vertex Color Functions

**Methods** (8):
  - `blur_mesh_vertex_colors(target_mesh, selection, num_iterations = 1, strength = 0.500000, blur_mode = GeometryScriptBlurColorMode.UNIFORM, options = [True,True,True,True], debug = None)` -> `DynamicMesh` [classmethod] — Blur the color attribute of the mesh. If the mesh has no color attribute, the function returns the mesh unchanged.
  - `convert_mesh_vertex_colors_linear_to_srgb(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Apply a Linear to SRGB color transformation on all vertex colors on the mesh.
  - `convert_mesh_vertex_colors_srgb_to_linear(target_mesh, debug = None)` -> `DynamicMesh` [classmethod] — Apply a SRGB to Linear color transformation on all vertex colors on the mesh.
  - `get_mesh_per_vertex_colors(target_mesh, color_list=GeometryScriptColorList, is_valid_color_set=bool, has_vertex_id_gaps=bool)` [classmethod] — Get a list of single vertex colors for each mesh vertex in the TargetMesh, derived from the VertexColor Overlay. The Ver...
  - `set_mesh_constant_vertex_color(target_mesh, color, flags, clear_existing = False, debug = None)` -> `DynamicMesh` [classmethod] — Set all vertex colors (optionally specific channels) in the TargetMesh VertexColor Overlay to a constant value
  - `set_mesh_per_vertex_colors(target_mesh, vertex_color_list, debug = None)` -> `DynamicMesh` [classmethod] — Set all vertex colors in the TargetMesh VertexColor Overlay to the specified per-vertex colors
  - `set_mesh_selection_vertex_color(target_mesh, selection, color, flags, create_color_seam = False, debug = None)` -> `DynamicMesh` [classmethod] — Set the colors in the TargetMesh VertexColor Overlay identified by the Selection to a constant value. For a Vertex Selec...
  - `transfer_vertex_colors_from_mesh(source_mesh, target_mesh, options = [TransferVertexColorMethod.CLOSEST_POINT_ON_SURFACE,-1.000000,-1.000000,True,0,0.000000,False,0.000100], selection = [], debug = None)` -> `DynamicMesh` [classmethod] — Transfer the vertex colors from the SourceMesh to the TargetMesh. Assumes that the meshes are aligned. Otherwise, use th...

### `unreal.GeometryScript_VolumeBake`
Inherits: `BlueprintFunctionLibrary` | Header: `VolumeTextureBakeFunctions.h`

Geometry Script Library Volume Texture Bake Functions

**Methods** (1):
  - `bake_signed_distance_to_volume_texture(target_mesh, volume_texture, distance_settings, texture_settings)` -> `bool` [classmethod] — Write a distance field to the given existing volume texture

### `unreal.GeometryScriptDebug`
Inherits: `Object` | Header: `GeometryScriptTypes.h`

Geometry Script Debug

**Properties** (1):
  - `messages`: `None` — [Read-Write] (Array[GeometryScriptDebugMessage])

### `unreal.BonesToCopyFromSource`
Inherits: `EnumBase` | Header: `MeshBoneWeightFunctions.h`

EBones to Copy from Source

**Properties** (3):
  - `ALL_BONES`: `BonesToCopyFromSource = Ellipsis` — Copy all bones from the source mesh to the target, regardless of whether theyâre bound or not. 0
  - `ONLY_BOUND_AND_PARENTS`: `BonesToCopyFromSource = Ellipsis` — Keep only bones that are actually bound to the target mesh, including all parent bones up to the roo...
  - `ONLY_BOUND_AND_ROOT`: `BonesToCopyFromSource = Ellipsis` — Keep only bones that are actually bound to the target mesh and the root bone. Any existing bones bet...

### `unreal.DistanceFieldComputeMode`
Inherits: `EnumBase` | Header: `VolumeTextureBakeFunctions.h`

EDistance Field Compute Mode

**Properties** (2):
  - `FULL_GRID`: `DistanceFieldComputeMode = Ellipsis` — Compute distances in the full grid 1
  - `NARROW_BAND`: `DistanceFieldComputeMode = Ellipsis` — Compute distances in a narrow band around the input. Outside of this band, field will have large, co...

### `unreal.DistanceFieldUnits`
Inherits: `EnumBase` | Header: `VolumeTextureBakeFunctions.h`

EDistance Field Units

**Properties** (2):
  - `DISTANCE`: `DistanceFieldUnits = Ellipsis` — Directly specify distances 1
  - `NUMBER_OF_VOXELS`: `DistanceFieldUnits = Ellipsis` — Express distance as a number of voxels 0

### `unreal.GeometryScriptAxis`
Inherits: `EnumBase` | Header: `GeometryScriptTypes.h`

EGeometry Script Axis

**Properties** (3):
  - `X`: `GeometryScriptAxis = Ellipsis` — 0
  - `Y`: `GeometryScriptAxis = Ellipsis` — 1
  - `Z`: `GeometryScriptAxis = Ellipsis` — 2

### `unreal.GeometryScriptBakeBitDepth`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Bit Depth

**Properties** (2):
  - `CHANNEL_BITS16`: `GeometryScriptBakeBitDepth = Ellipsis` — 1
  - `CHANNEL_BITS8`: `GeometryScriptBakeBitDepth = Ellipsis` — 0

### `unreal.GeometryScriptBakeCurvatureClampMode`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Curvature Clamp Mode

**Properties** (3):
  - `NONE`: `GeometryScriptBakeCurvatureClampMode = Ellipsis` — Include both negative and positive curvatures 0
  - `ONLY_NEGATIVE`: `GeometryScriptBakeCurvatureClampMode = Ellipsis` — Clamp positive curvatures to zero 2
  - `ONLY_POSITIVE`: `GeometryScriptBakeCurvatureClampMode = Ellipsis` — Clamp negative curvatures to zero 1

### `unreal.GeometryScriptBakeCurvatureColorMode`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Curvature Color Mode

**Properties** (3):
  - `GRAYSCALE`: `GeometryScriptBakeCurvatureColorMode = Ellipsis` — Map curvature values to grayscale such that black is negative, grey is zero, and white is positive 0
  - `RED_BLUE`: `GeometryScriptBakeCurvatureColorMode = Ellipsis` — Map curvature values to red and blue such that red is negative, black is zero, and blue is positive ...
  - `RED_GREEN_BLUE`: `GeometryScriptBakeCurvatureColorMode = Ellipsis` — Map curvature values to red, green, blue such that red is negative, green is zero, and blue is posit...

### `unreal.GeometryScriptBakeCurvatureTypeMode`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Curvature Type Mode

**Properties** (4):
  - `GAUSSIAN`: `GeometryScriptBakeCurvatureTypeMode = Ellipsis` — Product of the minimum and maximum principal curvatures 3
  - `MAX`: `GeometryScriptBakeCurvatureTypeMode = Ellipsis` — Maximum principal curvature 1
  - `MEAN`: `GeometryScriptBakeCurvatureTypeMode = Ellipsis` — Average of the minimum and maximum principal curvatures 0
  - `MIN`: `GeometryScriptBakeCurvatureTypeMode = Ellipsis` — Minimum principal curvature 2

### `unreal.GeometryScriptBakeFilteringType`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Filtering Type

**Properties** (2):
  - `BOX`: `GeometryScriptBakeFilteringType = Ellipsis` — 1
  - `B_SPLINE`: `GeometryScriptBakeFilteringType = Ellipsis` — 0

### `unreal.GeometryScriptBakeHeightRangeMode`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Height Range Mode

**Properties** (2):
  - `ABSOLUTE`: `GeometryScriptBakeHeightRangeMode = Ellipsis` — Height range defined in absolute units in object space 0
  - `RELATIVE_BOUNDS`: `GeometryScriptBakeHeightRangeMode = Ellipsis` — Height range defined as a ratio of the maximal bounding box axis 1

### `unreal.GeometryScriptBakeNormalSpace`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Normal Space

**Properties** (2):
  - `OBJECT`: `GeometryScriptBakeNormalSpace = Ellipsis` — Object space 1
  - `TANGENT`: `GeometryScriptBakeNormalSpace = Ellipsis` — Tangent space 0

### `unreal.GeometryScriptBakeOutputMode`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Output Mode

**Properties** (2):
  - `PER_CHANNEL`: `GeometryScriptBakeOutputMode = Ellipsis` — 1
  - `RGBA`: `GeometryScriptBakeOutputMode = Ellipsis` — 0

### `unreal.GeometryScriptBakeResolution`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Resolution

**Properties** (10):
  - `RESOLUTION1024`: `GeometryScriptBakeResolution = Ellipsis` — 6
  - `RESOLUTION128`: `GeometryScriptBakeResolution = Ellipsis` — 3
  - `RESOLUTION16`: `GeometryScriptBakeResolution = Ellipsis` — 0
  - `RESOLUTION2048`: `GeometryScriptBakeResolution = Ellipsis` — 7
  - `RESOLUTION256`: `GeometryScriptBakeResolution = Ellipsis` — 4
  - `RESOLUTION32`: `GeometryScriptBakeResolution = Ellipsis` — 1
  - `RESOLUTION4096`: `GeometryScriptBakeResolution = Ellipsis` — 8
  - `RESOLUTION512`: `GeometryScriptBakeResolution = Ellipsis` — 5
  - `RESOLUTION64`: `GeometryScriptBakeResolution = Ellipsis` — 2
  - `RESOLUTION8192`: `GeometryScriptBakeResolution = Ellipsis` — 9

### `unreal.GeometryScriptBakeSamplesPerPixel`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Samples Per Pixel

**Properties** (5):
  - `SAMPLE1`: `GeometryScriptBakeSamplesPerPixel = Ellipsis` — 0
  - `SAMPLE16`: `GeometryScriptBakeSamplesPerPixel = Ellipsis` — 2
  - `SAMPLE4`: `GeometryScriptBakeSamplesPerPixel = Ellipsis` — 1
  - `SAMPLE64`: `GeometryScriptBakeSamplesPerPixel = Ellipsis` — 3
  - `SAMPLES256`: `GeometryScriptBakeSamplesPerPixel = Ellipsis` — 4

### `unreal.GeometryScriptBakeTypes`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Types

**Properties** (15):
  - `AMBIENT_OCCLUSION`: `GeometryScriptBakeTypes = Ellipsis` — Ambient occlusion sampled across the hemisphere 7
  - `BENT_NORMAL`: `GeometryScriptBakeTypes = Ellipsis` — Normals skewed towards the least occluded direction 4
  - `CONSTANT`: `GeometryScriptBakeTypes = Ellipsis` — Constant value 12
  - `CURVATURE`: `GeometryScriptBakeTypes = Ellipsis` — Local curvature of the mesh surface 6
  - `FACE_NORMAL`: `GeometryScriptBakeTypes = Ellipsis` — Geometric face normals in object space 3
  - `HEIGHT`: `GeometryScriptBakeTypes = Ellipsis` — Height 14
  - `MATERIAL_ID`: `GeometryScriptBakeTypes = Ellipsis` — Material IDs as unique colors 11
  - `MULTI_TEXTURE`: `GeometryScriptBakeTypes = Ellipsis` — Transfer a texture per material ID 9
  - `NONE`: `GeometryScriptBakeTypes = Ellipsis` — 0
  - `OBJECT_SPACE_NORMAL`: `GeometryScriptBakeTypes = Ellipsis` — Interpolated normals in object space 2
  - `POSITION`: `GeometryScriptBakeTypes = Ellipsis` — Positions in object space 5
  - `TANGENT_SPACE_NORMAL`: `GeometryScriptBakeTypes = Ellipsis` — Normals in tangent space 1
  - `TEXTURE`: `GeometryScriptBakeTypes = Ellipsis` — Transfer a given texture 8
  - `UV_SHELL`: `GeometryScriptBakeTypes = Ellipsis` — UV Shell 13
  - `VERTEX_COLOR`: `GeometryScriptBakeTypes = Ellipsis` — Interpolated vertex colors 10

### `unreal.GeometryScriptBakeVertexTopology`
Inherits: `EnumBase` | Header: `MeshBakeFunctions.h`

EGeometry Script Bake Vertex Topology

**Properties** (2):
  - `CREATE_NEW`: `GeometryScriptBakeVertexTopology = Ellipsis` — Create new vertex color topology 0
  - `USE_EXISTING`: `GeometryScriptBakeVertexTopology = Ellipsis` — Use existing vertex color topology 1

### `unreal.GeometryScriptBlurColorMode`
Inherits: `EnumBase` | Header: `MeshVertexColorFunctions.h`

EGeometry Script Blur Color Mode

**Properties** (3):
  - `COTAN_WEIGHTS`: `GeometryScriptBlurColorMode = Ellipsis` — Blur the attributes where each neighbor is weighted proportionally to the cotangent weight of the sh...
  - `EDGE_LENGTH`: `GeometryScriptBlurColorMode = Ellipsis` — Blur the attributes where each neighbor is weighted proportionally to the shared edge length. 1
  - `UNIFORM`: `GeometryScriptBlurColorMode = Ellipsis` — Blur the attributes where each neighbor is weighted equally. 0

### `unreal.GeometryScriptBoneHierarchyMismatchHandling`
Inherits: `EnumBase` | Header: `MeshAssetFunctions.h`

A set of options on how to handle the situation where the bone hierarchy on a skeletal geometry does not match the reference skeleton on the skeletal asset being copied to. Does not apply when copying...

**Properties** (3):
  - `CREATE_NEW_REFERENCE_SKELETON`: `GeometryScriptBoneHierarchyMismatchHandling = Ellipsis` — Generate a new reference skeleton on the skeletal mesh asset that matches the bone hierarchy of the ...
  - `DO_NOTHING`: `GeometryScriptBoneHierarchyMismatchHandling = Ellipsis` — Do nothing to fix the mismatch. This is dangerous and should not be used lightly. The reference skel...
  - `REMAP_GEOMETRY_TO_REFERENCE_SKELETON`: `GeometryScriptBoneHierarchyMismatchHandling = Ellipsis` — Remap the bone bindings and bone hierarchy on the geometry to match the reference skeleton. If no bo...

### `unreal.GeometryScriptBooleanOperation`
Inherits: `EnumBase` | Header: `MeshBooleanFunctions.h`

EGeometry Script Boolean Operation

**Properties** (7):
  - `INTERSECTION`: `GeometryScriptBooleanOperation = Ellipsis` — 1
  - `NEW_POLY_GROUP_INSIDE`: `GeometryScriptBooleanOperation = Ellipsis` — 5
  - `NEW_POLY_GROUP_OUTSIDE`: `GeometryScriptBooleanOperation = Ellipsis` — 6
  - `SUBTRACT`: `GeometryScriptBooleanOperation = Ellipsis` — 2
  - `TRIM_INSIDE`: `GeometryScriptBooleanOperation = Ellipsis` — 3
  - `TRIM_OUTSIDE`: `GeometryScriptBooleanOperation = Ellipsis` — 4
  - `UNION`: `GeometryScriptBooleanOperation = Ellipsis` — 0

### `unreal.GeometryScriptBooleanOutputSpace`
Inherits: `EnumBase` | Header: `MeshBooleanFunctions.h`

Options for the output coordinate space for the mesh boolean result

**Properties** (3):
  - `SHARED_TRANSFORM_SPACE`: `GeometryScriptBooleanOutputSpace = Ellipsis` — Keep the boolean result in the shared space where the boolean was computed 2
  - `TARGET_TRANSFORM_SPACE`: `GeometryScriptBooleanOutputSpace = Ellipsis` — Transform the boolean result into the local space of the target mesh 0
  - `TOOL_TRANSFORM_SPACE`: `GeometryScriptBooleanOutputSpace = Ellipsis` — Transform the boolean result into the local space of the tool mesh 1

### `unreal.GeometryScriptCollisionGenerationMethod`
Inherits: `EnumBase` | Header: `CollisionFunctions.h`

EGeometry Script Collision Generation Method

**Properties** (8):
  - `ALIGNED_BOXES`: `GeometryScriptCollisionGenerationMethod = Ellipsis` — 0
  - `CAPSULES`: `GeometryScriptCollisionGenerationMethod = Ellipsis` — 3
  - `CONVEX_HULLS`: `GeometryScriptCollisionGenerationMethod = Ellipsis` — 4
  - `LEVEL_SETS`: `GeometryScriptCollisionGenerationMethod = Ellipsis` — 7
  - `MINIMAL_SPHERES`: `GeometryScriptCollisionGenerationMethod = Ellipsis` — 2
  - `MIN_VOLUME_SHAPES`: `GeometryScriptCollisionGenerationMethod = Ellipsis` — 6
  - `ORIENTED_BOXES`: `GeometryScriptCollisionGenerationMethod = Ellipsis` — 1
  - `SWEPT_HULLS`: `GeometryScriptCollisionGenerationMethod = Ellipsis` — 5

### `unreal.GeometryScriptCombineAttributesMode`
Inherits: `EnumBase` | Header: `MeshBasicEditFunctions.h`

Options for how attributes from a source and target mesh are combined into the target mesh

**Properties** (3):
  - `ENABLE_ALL_MATCHING`: `GeometryScriptCombineAttributesMode = Ellipsis` — Include attributes enabled on either the source or target mesh 0
  - `USE_SOURCE`: `GeometryScriptCombineAttributesMode = Ellipsis` — Make the target mesh have only the attributes that are enabled on the source mesh 2
  - `USE_TARGET`: `GeometryScriptCombineAttributesMode = Ellipsis` — Only include attributes that are already enabled on the target mesh 1

### `unreal.GeometryScriptCombineSelectionMode`
Inherits: `EnumBase` | Header: `GeometryScriptSelectionTypes.h`

Type of Combine operation to use when combining multiple FGeometryScriptMeshSelection

**Properties** (3):
  - `ADD`: `GeometryScriptCombineSelectionMode = Ellipsis` — 0
  - `INTERSECTION`: `GeometryScriptCombineSelectionMode = Ellipsis` — 2
  - `SUBTRACT`: `GeometryScriptCombineSelectionMode = Ellipsis` — 1

### `unreal.GeometryScriptContainmentOutcomePins`
Inherits: `EnumBase` | Header: `GeometryScriptTypes.h`

EGeometry Script Containment Outcome Pins

**Properties** (2):
  - `INSIDE`: `GeometryScriptContainmentOutcomePins = Ellipsis` — 0
  - `OUTSIDE`: `GeometryScriptContainmentOutcomePins = Ellipsis` — 1

### `unreal.GeometryScriptConvexHullSimplifyMethod`
Inherits: `EnumBase` | Header: `CollisionFunctions.h`

Methods to simplify convex hulls, used by FGeometryScriptConvexHullSimplificationOptions

**Properties** (2):
  - `ANGLE_TOLERANCE`: `GeometryScriptConvexHullSimplifyMethod = Ellipsis` — Simplify convex hulls by merging hull faces that have similar normals 1
  - `MESH_Q_SLIM`: `GeometryScriptConvexHullSimplifyMethod = Ellipsis` — Simplify convex hulls using a general mesh-based simplifier, and taking the convex hull of the simpl...

### `unreal.GeometryScriptCoordinateSpace`
Inherits: `EnumBase` | Header: `GeometryScriptTypes.h`

EGeometry Script Coordinate Space

**Properties** (2):
  - `LOCAL`: `GeometryScriptCoordinateSpace = Ellipsis` — 0
  - `WORLD`: `GeometryScriptCoordinateSpace = Ellipsis` — 1

### `unreal.GeometryScriptDebugMessageType`
Inherits: `EnumBase` | Header: `GeometryScriptTypes.h`

Errors/Debugging

**Properties** (2):
  - `ERROR_MESSAGE`: `GeometryScriptDebugMessageType = Ellipsis` — 0
  - `WARNING_MESSAGE`: `GeometryScriptDebugMessageType = Ellipsis` — 1

### `unreal.GeometryScriptEmptySelectionBehavior`
Inherits: `EnumBase` | Header: `GeometryScriptSelectionTypes.h`

Behavior of operations when a MeshSelection is empty

**Properties** (2):
  - `EMPTY_SELECTION`: `GeometryScriptEmptySelectionBehavior = Ellipsis` — 1
  - `FULL_MESH_SELECTION`: `GeometryScriptEmptySelectionBehavior = Ellipsis` — 0

### `unreal.GeometryScriptErrorType`
Inherits: `EnumBase` | Header: `GeometryScriptTypes.h`

EGeometry Script Error Type

**Properties** (4):
  - `INVALID_INPUTS`: `GeometryScriptErrorType = Ellipsis` — 2
  - `NO_ERROR`: `GeometryScriptErrorType = Ellipsis` — must only append members! 0 warning
  - `OPERATION_FAILED`: `GeometryScriptErrorType = Ellipsis` — 3
  - `UNKNOWN_ERROR`: `GeometryScriptErrorType = Ellipsis` — 1

### `unreal.GeometryScriptEvaluateSplineRange`
Inherits: `EnumBase` | Header: `PolyPathFunctions.h`

EGeometry Script Evaluate Spline Range

**Properties** (4):
  - `DISTANCE_RANGE`: `GeometryScriptEvaluateSplineRange = Ellipsis` — Evaluate a range specified by distances along the spline 1
  - `FULL_SPLINE`: `GeometryScriptEvaluateSplineRange = Ellipsis` — Evaluate the full spline, ignoring any specified range 0
  - `TIME_RANGE_CONSTANT_SPEED`: `GeometryScriptEvaluateSplineRange = Ellipsis` — Evaluate a range specified by times, based on travelling at constant speed along the spline 2
  - `TIME_RANGE_VARIABLE_SPEED`: `GeometryScriptEvaluateSplineRange = Ellipsis` — Evaluate a range specified by times, based on travelling at a constant rate of spline segments/secon...

### `unreal.GeometryScriptFillHolesMethod`
Inherits: `EnumBase` | Header: `MeshRepairFunctions.h`

EGeometry Script Fill Holes Method

**Properties** (5):
  - `AUTOMATIC`: `GeometryScriptFillHolesMethod = Ellipsis` — 0
  - `MINIMAL_FILL`: `GeometryScriptFillHolesMethod = Ellipsis` — 1
  - `PLANAR_PROJECTION`: `GeometryScriptFillHolesMethod = Ellipsis` — 4
  - `POLYGON_TRIANGULATION`: `GeometryScriptFillHolesMethod = Ellipsis` — 2
  - `TRIANGLE_FAN`: `GeometryScriptFillHolesMethod = Ellipsis` — 3

### `unreal.GeometryScriptFlareType`
Inherits: `EnumBase` | Header: `MeshDeformFunctions.h`

EGeometry Script Flare Type

**Properties** (3):
  - `SIN_MODE`: `GeometryScriptFlareType = Ellipsis` — Displaced by sin(pi x) with x in 0 to 1 0
  - `SIN_SQUARED_MODE`: `GeometryScriptFlareType = Ellipsis` — Displaced by sin(pi x)*sin(pi x) with x in 0 to 1. This provides a smooth normal transition. 1
  - `TRIANGLE_MODE`: `GeometryScriptFlareType = Ellipsis` — Displaced by piecewise-linear trianglular mode 2

### `unreal.GeometryScriptGenerateLightmapUVOptions`
Inherits: `EnumBase` | Header: `MeshAssetFunctions.h`

Options to control whether lightmap UVs are generated

**Properties** (3):
  - `DO_NOT_GENERATE_LIGHTMAP_U_VS`: `GeometryScriptGenerateLightmapUVOptions = Ellipsis` — Do not generate lightmap UVs 2
  - `GENERATE_LIGHTMAP_U_VS`: `GeometryScriptGenerateLightmapUVOptions = Ellipsis` — Generate lightmap UVs 1
  - `MATCH_TARGET_LOD_SETTING`: `GeometryScriptGenerateLightmapUVOptions = Ellipsis` — Match the lightmap UV generation setting of the target LOD, if it exists. For a new LOD, match LOD 0...

### `unreal.GeometryScriptGridSizingMethod`
Inherits: `EnumBase` | Header: `MeshVoxelFunctions.h`

EGeometry Script Grid Sizing Method

**Properties** (2):
  - `GRID_CELL_SIZE`: `GeometryScriptGridSizingMethod = Ellipsis` — 0
  - `GRID_RESOLUTION`: `GeometryScriptGridSizingMethod = Ellipsis` — 1

### `unreal.GeometryScriptIndexType`
Inherits: `EnumBase` | Header: `GeometryScriptTypes.h`

By default structs exposed to Python will use a per-UPROPERTY comparison. When this doesnât give correct results (e.g., for structs with no properties, which will compare equal in all cases because ...

**Properties** (6):
  - `ANY`: `GeometryScriptIndexType = Ellipsis` — Index lists of Any type are compatible with any other index list type 0
  - `EDGE`: `GeometryScriptIndexType = Ellipsis` — 2
  - `MATERIAL_ID`: `GeometryScriptIndexType = Ellipsis` — 4
  - `POLYGROUP_ID`: `GeometryScriptIndexType = Ellipsis` — 5
  - `TRIANGLE`: `GeometryScriptIndexType = Ellipsis` — 1
  - `VERTEX`: `GeometryScriptIndexType = Ellipsis` — 3

### `unreal.GeometryScriptInitKMeansMethod`
Inherits: `EnumBase` | Header: `PointSetFunctions.h`

EGeometry Script Init KMeans Method

**Properties** (2):
  - `RANDOM`: `GeometryScriptInitKMeansMethod = Ellipsis` — 0
  - `UNIFORM_SPACING`: `GeometryScriptInitKMeansMethod = Ellipsis` — 1

### `unreal.GeometryScriptLinearExtrudeDirection`
Inherits: `EnumBase` | Header: `MeshModelingFunctions.h`

EGeometry Script Linear Extrude Direction

**Properties** (2):
  - `AVERAGE_FACE_NORMAL`: `GeometryScriptLinearExtrudeDirection = Ellipsis` — 1
  - `FIXED_DIRECTION`: `GeometryScriptLinearExtrudeDirection = Ellipsis` — 0

### `unreal.GeometryScriptLODType`
Inherits: `EnumBase` | Header: `GeometryScriptTypes.h`

The Type of LOD in a Mesh Asset (ie a StaticMesh Asset)

**Properties** (4):
  - `HI_RES_SOURCE_MODEL`: `GeometryScriptLODType = Ellipsis` — The HiRes SourceModel. LOD Index is ignored. HiResSourceModel is not available at Runtime. 1
  - `MAX_AVAILABLE`: `GeometryScriptLODType = Ellipsis` — The Maximum-quality available SourceModel LOD (HiResSourceModel if it is available, otherwise Source...
  - `RENDER_DATA`: `GeometryScriptLODType = Ellipsis` — The Render mesh at at given LOD Index.
A StaticMesh Asset derives its RenderData LODs from itâs So...
  - `SOURCE_MODEL`: `GeometryScriptLODType = Ellipsis` — The SourceModel mesh at a given LOD Index. Note that a StaticMesh Asset with Auto-Generated LODs may...

### `unreal.GeometryScriptMathWarpType`
Inherits: `EnumBase` | Header: `MeshDeformFunctions.h`

EGeometry Script Math Warp Type

**Properties** (3):
  - `SIN_WAVE1D`: `GeometryScriptMathWarpType = Ellipsis` — 0
  - `SIN_WAVE2D`: `GeometryScriptMathWarpType = Ellipsis` — 1
  - `SIN_WAVE3D`: `GeometryScriptMathWarpType = Ellipsis` — 2

### `unreal.GeometryScriptMeshBevelSelectionMode`
Inherits: `EnumBase` | Header: `MeshModelingFunctions.h`

Mode passed to ApplyMeshBevelSelection to control how the input Selection should be interpreted as selecting an area of the mesh to Bevel

**Properties** (4):
  - `ALL_POLYGROUP_EDGES`: `GeometryScriptMeshBevelSelectionMode = Ellipsis` — Convert the selection to PolyGroups and bevel all the PolyGroup Edges of the selected PolyGroups 1
  - `SELECTED_EDGES`: `GeometryScriptMeshBevelSelectionMode = Ellipsis` — Convert the selection to Edges (if needed) and bevel them 3
  - `SHARED_POLYGROUP_EDGES`: `GeometryScriptMeshBevelSelectionMode = Ellipsis` — Convert the selection to PolyGroups and bevel all the PolyGroup Edges that are between selected Poly...
  - `TRIANGLE_AREA`: `GeometryScriptMeshBevelSelectionMode = Ellipsis` — Convert the selection to Triangles and bevel the boundary edge loops of the triangle set 0

### `unreal.GeometryScriptMeshDifferenceReason`
Inherits: `EnumBase` | Header: `MeshComparisonFunctions.h`

EGeometry Script Mesh Difference Reason

**Properties** (13):
  - `ATTRIBUTE`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 12
  - `COLOR`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 9
  - `CONNECTIVITY`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 7
  - `EDGE`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 6
  - `EDGE_COUNT`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 3
  - `GROUP`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 11
  - `NORMAL`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 8
  - `TRIANGLE`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 5
  - `TRIANGLE_COUNT`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 2
  - `UNKNOWN`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 0
  - `UV`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 10
  - `VERTEX`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 4
  - `VERTEX_COUNT`: `GeometryScriptMeshDifferenceReason = Ellipsis` — 1

### `unreal.GeometryScriptMeshEditPolygroupMode`
Inherits: `EnumBase` | Header: `MeshModelingFunctions.h`

EGeometry Script Mesh Edit Polygroup Mode

**Properties** (3):
  - `AUTO_GENERATE_NEW`: `GeometryScriptMeshEditPolygroupMode = Ellipsis` — 1
  - `PRESERVE_EXISTING`: `GeometryScriptMeshEditPolygroupMode = Ellipsis` — 0
  - `SET_CONSTANT`: `GeometryScriptMeshEditPolygroupMode = Ellipsis` — 2

### `unreal.GeometryScriptMeshSelectionConversionType`
Inherits: `EnumBase` | Header: `GeometryScriptSelectionTypes.h`

Type of Conversion to apply to a FGeometryScriptMeshSelection

**Properties** (4):
  - `NO_CONVERSION`: `GeometryScriptMeshSelectionConversionType = Ellipsis` — 0
  - `TO_POLYGROUPS`: `GeometryScriptMeshSelectionConversionType = Ellipsis` — 3
  - `TO_TRIANGLES`: `GeometryScriptMeshSelectionConversionType = Ellipsis` — 2
  - `TO_VERTICES`: `GeometryScriptMeshSelectionConversionType = Ellipsis` — 1

### `unreal.GeometryScriptMeshSelectionType`
Inherits: `EnumBase` | Header: `GeometryScriptSelectionTypes.h`

Type of index stored in a FGeometryScriptMeshSelection

**Properties** (4):
  - `EDGES`: `GeometryScriptMeshSelectionType = Ellipsis` — 3
  - `POLYGROUPS`: `GeometryScriptMeshSelectionType = Ellipsis` — 2
  - `TRIANGLES`: `GeometryScriptMeshSelectionType = Ellipsis` — 1
  - `VERTICES`: `GeometryScriptMeshSelectionType = Ellipsis` — 0

### `unreal.GeometryScriptMorphologicalOpType`
Inherits: `EnumBase` | Header: `MeshVoxelFunctions.h`

EGeometry Script Morphological Op Type

**Properties** (4):
  - `CLOSE`: `GeometryScriptMorphologicalOpType = Ellipsis` — Dilate and then contract, to delete small negative features (sharp inner corners, small holes) 2
  - `CONTRACT`: `GeometryScriptMorphologicalOpType = Ellipsis` — Shrink the shapes inward 1
  - `DILATE`: `GeometryScriptMorphologicalOpType = Ellipsis` — Expand the shapes outward 0
  - `OPEN`: `GeometryScriptMorphologicalOpType = Ellipsis` — Contract and then dilate, to delete small positive features (sharp outer corners, small isolated pie...

### `unreal.GeometryScriptOffsetFacesType`
Inherits: `EnumBase` | Header: `MeshModelingFunctions.h`

EGeometry Script Offset Faces Type

**Properties** (3):
  - `FACE_NORMAL`: `GeometryScriptOffsetFacesType = Ellipsis` — 1
  - `PARALLEL_FACE_OFFSET`: `GeometryScriptOffsetFacesType = Ellipsis` — 2
  - `VERTEX_NORMAL`: `GeometryScriptOffsetFacesType = Ellipsis` — 0

### `unreal.GeometryScriptOutcomePins`
Inherits: `EnumBase` | Header: `GeometryScriptTypes.h`

EGeometry Script Outcome Pins

**Properties** (2):
  - `FAILURE`: `GeometryScriptOutcomePins = Ellipsis` — 0
  - `SUCCESS`: `GeometryScriptOutcomePins = Ellipsis` — 1

### `unreal.GeometryScriptPathOffsetEndType`
Inherits: `EnumBase` | Header: `PolygonFunctions.h`

End types to apply when offsetting open paths

**Properties** (3):
  - `BUTT`: `GeometryScriptPathOffsetEndType = Ellipsis` — Offsets both sides of a path, with square blunt ends 0
  - `ROUND`: `GeometryScriptPathOffsetEndType = Ellipsis` — Offsets both sides of a path, with round extended ends 2
  - `SQUARE`: `GeometryScriptPathOffsetEndType = Ellipsis` — Offsets both sides of a path, with square extended ends 1

### `unreal.GeometryScriptPixelSamplingMethod`
Inherits: `EnumBase` | Header: `TextureMapFunctions.h`

EGeometry Script Pixel Sampling Method

**Properties** (2):
  - `BILINEAR`: `GeometryScriptPixelSamplingMethod = Ellipsis` — 0
  - `NEAREST`: `GeometryScriptPixelSamplingMethod = Ellipsis` — 1

### `unreal.GeometryScriptPolygonFillMode`
Inherits: `EnumBase` | Header: `MeshPrimitiveFunctions.h`

EGeometry Script Polygon Fill Mode

**Properties** (6):
  - `ALL`: `GeometryScriptPolygonFillMode = Ellipsis` — Keep all triangles, regardless of whether they were enclosed by constrained edges 0
  - `NEGATIVE_WINDING`: `GeometryScriptPolygonFillMode = Ellipsis` — Fill where the âwinding numberâ is negative 4
  - `NON_ZERO_WINDING`: `GeometryScriptPolygonFillMode = Ellipsis` — Fill where the âwinding numberâ is not zero 3
  - `ODD_WINDING`: `GeometryScriptPolygonFillMode = Ellipsis` — Fill where the âwinding numberâ is an odd number 5
  - `POSITIVE_WINDING`: `GeometryScriptPolygonFillMode = Ellipsis` — Fill where the âwinding numberâ is positive 2
  - `SOLID`: `GeometryScriptPolygonFillMode = Ellipsis` — Fill everything inside the outer boundaries of constrained edges, ignoring edge orientation and any ...

### `unreal.GeometryScriptPolyOffsetJoinType`
Inherits: `EnumBase` | Header: `PolygonFunctions.h`

Join types to define the shape of corners between polygon and polypath edges

**Properties** (3):
  - `MITER`: `GeometryScriptPolyOffsetJoinType = Ellipsis` — Squaring of convex edge joins with acute angles (âspikesâ). Use in combination with MiterLimit. ...
  - `ROUND`: `GeometryScriptPolyOffsetJoinType = Ellipsis` — Arcs on all convex edge joins. 1
  - `SQUARE`: `GeometryScriptPolyOffsetJoinType = Ellipsis` — Uniform squaring on all convex edge joins. 0

### `unreal.GeometryScriptPolyOperationArea`
Inherits: `EnumBase` | Header: `MeshModelingFunctions.h`

EGeometry Script Poly Operation Area

**Properties** (3):
  - `ENTIRE_SELECTION`: `GeometryScriptPolyOperationArea = Ellipsis` — 0
  - `PER_POLYGROUP`: `GeometryScriptPolyOperationArea = Ellipsis` — 1
  - `PER_TRIANGLE`: `GeometryScriptPolyOperationArea = Ellipsis` — 2

### `unreal.GeometryScriptPrimitiveOriginMode`
Inherits: `EnumBase` | Header: `MeshPrimitiveFunctions.h`

EGeometry Script Primitive Origin Mode

**Properties** (2):
  - `BASE`: `GeometryScriptPrimitiveOriginMode = Ellipsis` — 1
  - `CENTER`: `GeometryScriptPrimitiveOriginMode = Ellipsis` — 0

### `unreal.GeometryScriptPrimitivePolygroupMode`
Inherits: `EnumBase` | Header: `MeshPrimitiveFunctions.h`

EGeometry Script Primitive Polygroup Mode

**Properties** (3):
  - `PER_FACE`: `GeometryScriptPrimitivePolygroupMode = Ellipsis` — 1
  - `PER_QUAD`: `GeometryScriptPrimitivePolygroupMode = Ellipsis` — 2
  - `SINGLE_GROUP`: `GeometryScriptPrimitivePolygroupMode = Ellipsis` — 0

### `unreal.GeometryScriptPrimitiveUVMode`
Inherits: `EnumBase` | Header: `MeshPrimitiveFunctions.h`

EGeometry Script Primitive UVMode

**Properties** (2):
  - `SCALE_TO_FILL`: `GeometryScriptPrimitiveUVMode = Ellipsis` — 1
  - `UNIFORM`: `GeometryScriptPrimitiveUVMode = Ellipsis` — 0

### `unreal.GeometryScriptPruneBoneWeightsAssignmentType`
Inherits: `EnumBase` | Header: `MeshBoneWeightFunctions.h`

EGeometry Script Prune Bone Weights Assignment Type

**Properties** (2):
  - `REASSIGN_TO_PARENT`: `GeometryScriptPruneBoneWeightsAssignmentType = Ellipsis` — Remove the bone from the bone weights and renormalize the remaining weights. 1
  - `RENORMALIZE_REMAINING`: `GeometryScriptPruneBoneWeightsAssignmentType = Ellipsis` — 0

### `unreal.GeometryScriptRemeshEdgeConstraintType`
Inherits: `EnumBase` | Header: `MeshRemeshFunctions.h`

Types of edge constraints, specified for different mesh attributes

**Properties** (4):
  - `FIXED`: `GeometryScriptRemeshEdgeConstraintType = Ellipsis` — Constrained edges cannot be flipped, split or collapsed, and vertices will not move 0
  - `FREE`: `GeometryScriptRemeshEdgeConstraintType = Ellipsis` — Constrained edges cannot be flipped, but otherwise are free to move 2
  - `IGNORE`: `GeometryScriptRemeshEdgeConstraintType = Ellipsis` — Edges are not constrained, ie the Attribute used to derive the Constraints will not be considered 3
  - `REFINE`: `GeometryScriptRemeshEdgeConstraintType = Ellipsis` — Constrained edges can be split, but not flipped or collapsed. Vertices will not move. 1

### `unreal.GeometryScriptRemeshSmoothingType`
Inherits: `EnumBase` | Header: `MeshRemeshFunctions.h`

The Vertex Smoothing strategy used in a Remeshing operation

**Properties** (3):
  - `MIXED`: `GeometryScriptRemeshSmoothingType = Ellipsis` — Similar to UV Preserving, but allows some tangential drift (causing UV distortion) when vertices wou...
  - `UNIFORM`: `GeometryScriptRemeshSmoothingType = Ellipsis` — Vertices move towards their 3D one-ring centroids, UVs are ignored. This produces the most regular m...
  - `UV_PRESERVING`: `GeometryScriptRemeshSmoothingType = Ellipsis` — Vertices move towards the projection of their one-ring centroids onto their normal vectors, preservi...

### `unreal.GeometryScriptRemoveHiddenTrianglesMethod`
Inherits: `EnumBase` | Header: `MeshRepairFunctions.h`

EGeometry Script Remove Hidden Triangles Method

**Properties** (2):
  - `FAST_WINDING_NUMBER`: `GeometryScriptRemoveHiddenTrianglesMethod = Ellipsis` — 0
  - `RAYCAST_OCCLUSION_TEST`: `GeometryScriptRemoveHiddenTrianglesMethod = Ellipsis` — 1

### `unreal.GeometryScriptRemoveMeshSimplificationType`
Inherits: `EnumBase` | Header: `MeshSimplifyFunctions.h`

EGeometry Script Remove Mesh Simplification Type

**Properties** (3):
  - `ATTRIBUTE_AWARE`: `GeometryScriptRemoveMeshSimplificationType = Ellipsis` — 2
  - `STANDARD_QEM`: `GeometryScriptRemoveMeshSimplificationType = Ellipsis` — 0
  - `VOLUME_PRESERVING`: `GeometryScriptRemoveMeshSimplificationType = Ellipsis` — 1

### `unreal.GeometryScriptRepairMeshMode`
Inherits: `EnumBase` | Header: `MeshRepairFunctions.h`

EGeometry Script Repair Mesh Mode

**Properties** (3):
  - `DELETE_ONLY`: `GeometryScriptRepairMeshMode = Ellipsis` — 0
  - `REPAIR_OR_DELETE`: `GeometryScriptRepairMeshMode = Ellipsis` — 1
  - `REPAIR_OR_SKIP`: `GeometryScriptRepairMeshMode = Ellipsis` — 2

### `unreal.GeometryScriptSampleSpacing`
Inherits: `EnumBase` | Header: `PolyPathFunctions.h`

EGeometry Script Sample Spacing

**Properties** (3):
  - `ERROR_TOLERANCE`: `GeometryScriptSampleSpacing = Ellipsis` — 2
  - `UNIFORM_DISTANCE`: `GeometryScriptSampleSpacing = Ellipsis` — 0
  - `UNIFORM_TIME`: `GeometryScriptSampleSpacing = Ellipsis` — 1

### `unreal.GeometryScriptSamplingDistributionMode`
Inherits: `EnumBase` | Header: `MeshSamplingFunctions.h`

Controls the distribution of sample radii

**Properties** (3):
  - `LARGER`: `GeometryScriptSamplingDistributionMode = Ellipsis` — Distribution is weighted towards larger points 2
  - `SMALLER`: `GeometryScriptSamplingDistributionMode = Ellipsis` — Distribution is weighted towards smaller points 1
  - `UNIFORM`: `GeometryScriptSamplingDistributionMode = Ellipsis` — Uniform distribution of sizes, ie all equally likely 0

### `unreal.GeometryScriptSamplingWeightMode`
Inherits: `EnumBase` | Header: `MeshSamplingFunctions.h`

Control how active Weights are used to affect point radius

**Properties** (3):
  - `FILLED_WEIGHT_TO_RADIUS`: `GeometryScriptSamplingWeightMode = Ellipsis` — Weights are clamped to [0,1] and used to interpolate Min/Max Radius, with decay, so that smaller-rad...
  - `WEIGHTED_RANDOM`: `GeometryScriptSamplingWeightMode = Ellipsis` — Weight is used to create nonuniform random sampling, ie it nudges the random sample-radius distribut...
  - `WEIGHT_TO_RADIUS`: `GeometryScriptSamplingWeightMode = Ellipsis` — Weights are clamped to [0,1] and used to interpolate Min/Max Radius. This is a âhard constraintâ...

### `unreal.GeometryScriptSearchOutcomePins`
Inherits: `EnumBase` | Header: `GeometryScriptTypes.h`

EGeometry Script Search Outcome Pins

**Properties** (2):
  - `FOUND`: `GeometryScriptSearchOutcomePins = Ellipsis` — 0
  - `NOT_FOUND`: `GeometryScriptSearchOutcomePins = Ellipsis` — 1

### `unreal.GeometryScriptSmoothBoneWeightsType`
Inherits: `EnumBase` | Header: `MeshBoneWeightFunctions.h`

EGeometry Script Smooth Bone Weights Type

**Properties** (2):
  - `DIRECT_DISTANCE`: `GeometryScriptSmoothBoneWeightsType = Ellipsis` — 0
  - `GEODESIC_VOXEL`: `GeometryScriptSmoothBoneWeightsType = Ellipsis` — Compute weighting by using Euclidean distance from bone to vertex 1

### `unreal.GeometryScriptSweptHullAxis`
Inherits: `EnumBase` | Header: `CollisionFunctions.h`

EGeometry Script Swept Hull Axis

**Properties** (5):
  - `SMALLEST_BOX_DIMENSION`: `GeometryScriptSweptHullAxis = Ellipsis` — Use X/Y/Z axis with smallest axis-aligned-bounding-box dimension 3
  - `SMALLEST_VOLUME`: `GeometryScriptSweptHullAxis = Ellipsis` — Compute projected hull for each of X/Y/Z axes and use the one that has the smallest volume 4
  - `X`: `GeometryScriptSweptHullAxis = Ellipsis` — 0
  - `Y`: `GeometryScriptSweptHullAxis = Ellipsis` — 1
  - `Z`: `GeometryScriptSweptHullAxis = Ellipsis` — 2

### `unreal.GeometryScriptTangentTypes`
Inherits: `EnumBase` | Header: `MeshNormalsFunctions.h`

EGeometry Script Tangent Types

**Properties** (2):
  - `FAST_MIKK_T`: `GeometryScriptTangentTypes = Ellipsis` — 0
  - `PER_TRIANGLE`: `GeometryScriptTangentTypes = Ellipsis` — 1

### `unreal.GeometryScriptTexelDensityMode`
Inherits: `EnumBase` | Header: `MeshUVFunctions.h`

EGeometry Script Texel Density Mode

**Properties** (3):
  - `APPLY_TO_ISLANDS`: `GeometryScriptTexelDensityMode = Ellipsis` — 0
  - `APPLY_TO_WHOLE`: `GeometryScriptTexelDensityMode = Ellipsis` — 1
  - `NORMALIZE`: `GeometryScriptTexelDensityMode = Ellipsis` — 2

### `unreal.GeometryScriptTopologyConnectionType`
Inherits: `EnumBase` | Header: `MeshSelectionFunctions.h`

Types of connection between adjacent Mesh Elements (vertices/triangles/polygoups)

**Properties** (3):
  - `GEOMETRIC`: `GeometryScriptTopologyConnectionType = Ellipsis` — 0
  - `MATERIAL_ID`: `GeometryScriptTopologyConnectionType = Ellipsis` — 2
  - `POLYGROUP`: `GeometryScriptTopologyConnectionType = Ellipsis` — 1

### `unreal.GeometryScriptUniformRemeshTargetType`
Inherits: `EnumBase` | Header: `MeshRemeshFunctions.h`

Goal types for Uniform Remeshing

**Properties** (2):
  - `TARGET_EDGE_LENGTH`: `GeometryScriptUniformRemeshTargetType = Ellipsis` — Attempt to Remesh such that all edges have approximately this length 1
  - `TRIANGLE_COUNT`: `GeometryScriptUniformRemeshTargetType = Ellipsis` — Approximate Desired Triangle Count. This is used to compute a Target Edge Length, and is not an expl...

### `unreal.GeometryScriptUVFlattenMethod`
Inherits: `EnumBase` | Header: `MeshUVFunctions.h`

EGeometry Script UVFlatten Method

**Properties** (3):
  - `CONFORMAL`: `GeometryScriptUVFlattenMethod = Ellipsis` — 1
  - `EXP_MAP`: `GeometryScriptUVFlattenMethod = Ellipsis` — 0
  - `SPECTRAL_CONFORMAL`: `GeometryScriptUVFlattenMethod = Ellipsis` — 2

### `unreal.GeometryScriptUVIslandSource`
Inherits: `EnumBase` | Header: `MeshUVFunctions.h`

EGeometry Script UVIsland Source

**Properties** (2):
  - `POLY_GROUPS`: `GeometryScriptUVIslandSource = Ellipsis` — 0
  - `UV_ISLANDS`: `GeometryScriptUVIslandSource = Ellipsis` — 1

### `unreal.GeometryScriptUVLayoutType`
Inherits: `EnumBase` | Header: `MeshUVFunctions.h`

EGeometry Script UVLayout Type

**Properties** (4):
  - `NORMALIZE`: `GeometryScriptUVLayoutType = Ellipsis` — Scale and translate UV islands to normalize the UV islandsâ area to match an average texel density...
  - `REPACK`: `GeometryScriptUVLayoutType = Ellipsis` — Uniformly scale and translate UV islands collectively to pack them into the unit square, i.e. fit be...
  - `STACK`: `GeometryScriptUVLayoutType = Ellipsis` — Uniformly scale and translate each UV island individually to pack it into the unit square, i.e. fit ...
  - `TRANSFORM`: `GeometryScriptUVLayoutType = Ellipsis` — Apply Scale and Translation properties to all UV values 0

### `unreal.NegativeSpaceSampleMethod`
Inherits: `EnumBase` | Header: `CollisionFunctions.h`

Method to distribute sampling spheres, used by FComputeNegativeSpaceOptions

**Properties** (3):
  - `NAVIGABLE_VOXEL_SEARCH`: `NegativeSpaceSampleMethod = Ellipsis` — A more-principled version of VoxelSearch that attempts to target specifically the space that is reac...
  - `UNIFORM`: `NegativeSpaceSampleMethod = Ellipsis` — Place sample spheres in a uniform grid pattern 0
  - `VOXEL_SEARCH`: `NegativeSpaceSampleMethod = Ellipsis` — Use voxel-based subtraction and offsetting methods to specifically target concavities 1

### `unreal.OutputTargetMeshBones`
Inherits: `EnumBase` | Header: `MeshBoneWeightFunctions.h`

EOutput Target Mesh Bones

**Properties** (2):
  - `SOURCE_BONES`: `OutputTargetMeshBones = Ellipsis` — When transferring weights, the SourceMesh bone attriubtes will be copied over to the TargetMesh, rep...
  - `TARGET_BONES`: `OutputTargetMeshBones = Ellipsis` — When transferring weights, if the TargetMesh has bone attributes, then the transferred SourceMesh we...

### `unreal.SelectiveTessellatePatternType`
Inherits: `EnumBase` | Header: `MeshSubdivideFunctions.h`

Selective Tessellate options

**Properties** (1):
  - `CONCENTRIC_RINGS`: `SelectiveTessellatePatternType = Ellipsis` — 0

### `unreal.TransferBoneWeightsMethod`
Inherits: `EnumBase` | Header: `MeshBoneWeightFunctions.h`

ETransfer Bone Weights Method

**Properties** (2):
  - `CLOSEST_POINT_ON_SURFACE`: `TransferBoneWeightsMethod = Ellipsis` — For every vertex on the TargetMesh, find the closest point on the surface of the SourceMesh and tran...
  - `INPAINT_WEIGHTS`: `TransferBoneWeightsMethod = Ellipsis` — For every vertex on the target mesh, find the closest point on the surface of the source mesh. If th...

### `unreal.TransferVertexColorMethod`
Inherits: `EnumBase` | Header: `MeshVertexColorFunctions.h`

ETransfer Vertex Color Method

**Properties** (2):
  - `CLOSEST_POINT_ON_SURFACE`: `TransferVertexColorMethod = Ellipsis` — For every vertex on the TargetMesh, find the closest point on the surface of the SourceMesh and tran...
  - `INPAINT`: `TransferVertexColorMethod = Ellipsis` — For every vertex on the target mesh, find the closest point on the surface of the source mesh. If th...
