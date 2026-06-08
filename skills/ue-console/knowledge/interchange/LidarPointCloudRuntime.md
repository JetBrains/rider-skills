# UE Python API — LidarPointCloudRuntime Module

**18 types** from the `LidarPointCloudRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LidarPointCloudImportSettings_ASCII_Columns`, `LidarPointCloudNormal`, `LidarPointCloudPoint`, `LidarPointCloudTraceHit`, `LidarClippingVolume`, `LidarPointCloud`, `LidarPointCloudActor`, `LidarPointCloudBlueprintLibrary`, `LidarPointCloudComponent`, `LidarPointCloudFileIO`, `LidarPointCloudFileIO_ASCII`, `LidarClippingVolumeMode`, `LidarPointCloudAsyncMode`, `LidarPointCloudColorationMode`, `LidarPointCloudDuplicateHandling`, `LidarPointCloudScalingMethod`, `LidarPointCloudSpriteOrientation`, `LidarPointCloudSpriteShape`

---

## Classes

### `unreal.LidarPointCloudImportSettings_ASCII_Columns`
Inherits: `StructBase` | Header: `LidarPointCloudFileIO_ASCII.h`

Used to help expose the import settings to Blueprints

**Properties** (10):
  - `blue`: `int` — [Read-Write] Index of a column containing Blue channel. Set to -1 if not available (int32)
  - `green`: `int` — [Read-Write] Index of a column containing Green channel. Set to -1 if not available (int32)
  - `intensity`: `int` — [Read-Write] Index of a column containing Intensity channel. Set to -1 if not available (int32)
  - `location_x`: `int` — [Read-Write] Index of a column containing Location X data (int32)
  - `location_y`: `int` — [Read-Write] Index of a column containing Location Y data (int32)
  - `location_z`: `int` — [Read-Write] Index of a column containing Location Z data (int32)
  - `normal_x`: `int` — [Read-Write] Index of a column containing Normal X data. Set to -1 if not available (int32)
  - `normal_y`: `int` — [Read-Write] Index of a column containing Normal Y data. Set to -1 if not available (int32)
  - `normal_z`: `int` — [Read-Write] Index of a column containing Normal Z data. Set to -1 if not available (int32)
  - `red`: `int` — [Read-Write] Index of a column containing Red channel. Set to -1 if not available (int32)

### `unreal.LidarPointCloudNormal`
Inherits: `StructBase` | Header: `LidarPointCloudShared.h`

3D vector represented using only a single byte per component

**Properties** (3):
  - `x`: `int` — [Read-Write] (uint8)
  - `y`: `int` — [Read-Write] (uint8)
  - `z`: `int` — [Read-Write] (uint8)

### `unreal.LidarPointCloudPoint`
Inherits: `StructBase` | Header: `LidarPointCloudShared.h`

Lidar Point Cloud Point

**Properties** (4):
  - `color`: `Color` — [Read-Write] (Color)
  - `location`: `Vector3f` — [Read-Write] (Vector3f)
  - `normal`: `LidarPointCloudNormal` — [Read-Write] (LidarPointCloudNormal)
  - `visible`: `bool` — [Read-Write] (bool)

### `unreal.LidarPointCloudTraceHit`
Inherits: `StructBase` | Header: `LidarPointCloud.h`

Lidar Point Cloud Trace Hit

**Properties** (3):
  - `actor`: `LidarPointCloudActor` — [Read-Write] (LidarPointCloudActor)
  - `component`: `LidarPointCloudComponent` — [Read-Write] (LidarPointCloudComponent)
  - `points`: `None` — [Read-Write] (Array[LidarPointCloudPoint])

### `unreal.LidarClippingVolume`
Inherits: `Volume` | Header: `LidarPointCloud.h`

Lidar Clipping Volume

**Properties** (3):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `mode`: `LidarClippingVolumeMode` — [Read-Write] Affects how this volume affects points (LidarClippingVolumeMode)
  - `priority`: `int` — [Read-Write] Determines the processing order of the nodes, in case they overlap.
Higher values take ...

### `unreal.LidarPointCloud`
Inherits: `Object` | Header: `LidarPointCloud.h`

Represents the Point Cloud asset

**Methods** (61):
  - `apply_color_to_all_points(new_color, visible_only)` -> `None` — Applies the given color to all points
  - `apply_color_to_first_point_by_ray(new_color, origin, direction, radius, visible_only)` -> `None` — Applies the given color to the first point hit by the given ray
  - `apply_color_to_points_by_ray(new_color, origin, direction, radius, visible_only)` -> `None` — Applies the given color to all points hit by the given ray
  - `apply_color_to_points_in_box(new_color, center, extent, visible_only)` -> `None` — Applies the given color to all points within the box
  - `apply_color_to_points_in_sphere(new_color, center, radius, visible_only)` -> `None` — Applies the given color to all points within the sphere
  - `build_collision()` -> `None` — Builds collision mesh for the cloud, using current collision settings
  - `build_collision_with_callback(world_context_object, latent_info)` -> `bool` — Build Collision with Callback
  - `calculate_normals(latent_info)` -> `None` — Calculates Normals for this point cloud
  - `center_points()` -> `None` — Centers this cloud
  - `export(filename)` -> `bool` — Exports this Point Cloud to the given filename. Consult supported export formats. Returns true if successful
  - `get_bounds(use_original_coordinates = False)` -> `Box` — Get Bounds
  - `get_collider_polys()` -> `int32` — Returns the number of polygons in the collider or 0 if no collider is built
  - `get_data_size()` -> `int32` — Returns the amount of memory in MB used to store the point cloud.
  - `get_estimated_point_spacing()` -> `float` — Get Estimated Point Spacing
  - `get_num_lo_ds()` -> `int` — deprecated: âget_num_lo_dsâ was renamed to âget_num_lodsâ.
  - `get_num_lods()` -> `int32` — End UObject Interface.
  - `get_num_nodes()` -> `int32` — Get Num Nodes
  - `get_num_points()` -> `int64` — Get Num Points
  - `get_num_visible_points()` -> `int64` — Get Num Visible Points
  - `get_points_as_copies(return_world_space, start_index = 0, count = -1)` -> `Array [ LidarPointCloudPoint ]` — Returns an array with copies of points from the tree If ReturnWorldSpace is selected, the pointsâ locations will be co...
  - `get_points_in_box_as_copies(center, extent, visible_only, return_world_space)` -> `Array [ LidarPointCloudPoint ]` — Returns an array with copies of points within the given box If ReturnWorldSpace is selected, the pointsâ locations wil...
  - `get_points_in_sphere_as_copies(center, radius, visible_only, return_world_space)` -> `Array [ LidarPointCloudPoint ]` — Returns an array with copies of points within the given sphere If ReturnWorldSpace is selected, the pointsâ locations ...
  - `get_source_path()` -> `str` — Get Source Path
  - `has_collision_data()` -> `bool` — Returns true, if the Octree has collision built
  - `has_points_by_ray(origin, direction, radius, visible_only)` -> `bool` — Returns true if there are any points hit by the given ray.
  - `has_points_in_box(center, extent, visible_only)` -> `bool` — Returns true if there are any points within the given box.
  - `has_points_in_sphere(center, radius, visible_only)` -> `bool` — Returns true if there are any points within the given sphere.
  - `hide_all()` -> `None` — Marks all points hidden
  - `initialize(new_bounds)` -> `None` — Re-initializes the asset with new bounds. Warning: Will erase all currently held data!
  - `insert_point(point, duplicate_handling, refresh_points_bounds, translation)` -> `None` — Inserts the given point into the Octree structure. If bRefreshPointsBounds is set to false, make sure you call RefreshBo...
  - `insert_points(points, duplicate_handling, refresh_points_bounds, translation)` -> `None` — Inserts group of points into the Octree structure, multi-threaded. If bRefreshPointsBounds is set to false, make sure yo...
  - `is_centered()` -> `bool` — Returns true, if the cloud has been centered.
  - `is_fully_loaded()` -> `bool` — Returns true, if the cloud is fully and persistently loaded.
  - `is_optimized_for_dynamic_data()` -> `bool` — Is Optimized for Dynamic Data
  - `line_trace_multi(origin, direction, radius, visible_only, return_world_space)` -> `Array[LidarPointCloudPoint] or None` — Performs a raycast test against the point cloud. Populates OutHits array with the results. If ReturnWorldSpace is select...
  - `line_trace_single(origin, direction, radius, visible_only)` -> `LidarPointCloudPoint or None` — Performs a raycast test against the point cloud. Returns the pointer if hit or nullptr otherwise.
  - `load_all_nodes()` -> `None` — Persistently loads all nodes.
  - `mark_point_visibility_dirty()` -> `None` — This should to be called if any manual modification to individual pointsâ visibility has been made. If not marked dirt...
  - `merge(point_clouds_to_merge)` -> `None` — Merges this point cloud with the ones provided
  - `merge_single(point_cloud_to_merge)` -> `None` — Merges this point cloud with the one provided
  - `refresh_bounds()` -> `None` — Recalculates and updates points bounds.
  - `refresh_rendering()` -> `None` — Refresh Rendering
  - `reimport(world_context_object, use_async, progress=float)` — Re-imports the cloud from itâs original source file, overwriting any current point information.
  - `remove_collision()` -> `None` — Removes collision mesh from the cloud.
  - `remove_first_point_by_ray(origin, direction, radius, visible_only)` -> `None` — Removes the first point hit by the given ray
  - `remove_hidden_points()` -> `None` — Removes all hidden points
  - `remove_point(point)` -> `None` — Attempts to remove the given point.
  - `remove_points_by_ray(origin, direction, radius, visible_only)` -> `None` — Removes all points hit by the given ray
  - `remove_points_in_box(center, extent, visible_only)` -> `None` — Removes all points within the given box
  - `remove_points_in_sphere(center, radius, visible_only)` -> `None` — Removes all points within the given sphere
  - `restore_original_coordinates()` -> `None` — Restores original coordinates
  - `set_data(points)` -> `bool` — Reinitializes the cloud with the new set of data.
  - `set_location_offset(offset)` -> `None` — Applies given offset to this point cloud.
  - `set_optimal_collision_error()` -> `None` — Set Optimal Collision Error
  - `set_optimized_for_dynamic_data(new_optimized_for_dynamic_data)` -> `None` — Set Optimized for Dynamic Data
  - `set_source_path(new_source_path)` -> `None` — Set Source Path
  - `set_visibility_of_first_point_by_ray(new_visibility, origin, direction, radius)` -> `None` — Sets visibility of the first point hit by the given ray.
  - `set_visibility_of_points_by_ray(new_visibility, origin, direction, radius)` -> `None` — Sets visibility of points hit by the given ray.
  - `set_visibility_of_points_in_box(new_visibility, center, extent)` -> `None` — Sets visibility of points within the given box.
  - `set_visibility_of_points_in_sphere(new_visibility, center, radius)` -> `None` — Sets visibility of points within the given sphere.
  - `unhide_all()` -> `None` — Marks all points visible

**Properties** (5):
  - `collision_accuracy`: `float` — [Read-Write]
deprecated: Use MaxCollisionError instead. (float)
  - `max_collision_error`: `float` — [Read-Write] Determines the maximum error (in cm) of the collision for this point cloud.
NOTE: Lower...
  - `normals_noise_tolerance`: `float` — [Read-Write] Higher values are less susceptible to noise, but will most likely lose finer details, e...
  - `normals_quality`: `int` — [Read-Write] Higher values will generally result in more accurate calculations, at the expense of ti...
  - `original_coordinates`: `Vector` [Read-Only] — [Read-Only] Stores the original offset as a double. (Vector)

### `unreal.LidarPointCloudActor`
Inherits: `Actor` | Header: `LidarPointCloudActor.h`

Lidar Point Cloud Actor

**Methods** (2):
  - `get_point_cloud()` -> `LidarPointCloud` — Get Point Cloud
  - `set_point_cloud(point_cloud)` -> `None` — Set Point Cloud

**Properties** (1):
  - `point_cloud_component`: `LidarPointCloudComponent` [Read-Only] — [Read-Only] (LidarPointCloudComponent)

### `unreal.LidarPointCloudBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LidarPointCloud.h`

Blueprint library for the Point Cloud assets

**Methods** (27):
  - `align_clouds(point_clouds_to_align)` -> `None` [classmethod] — Aligns provided clouds based on the relative offset between their Original Coordinates. Retains overall centering of the...
  - `apply_color_to_first_point_by_ray(world_context_object, new_color, origin, direction, radius, visible_only)` -> `None` [classmethod] — Applies the given color to the first point hit by the given ray
  - `apply_color_to_points_by_ray(world_context_object, new_color, origin, direction, radius, visible_only)` -> `None` [classmethod] — Applies the given color to all points hit by the given ray
  - `apply_color_to_points_in_box(world_context_object, new_color, center, extent, visible_only)` -> `None` [classmethod] — Applies the given color to all points within the box
  - `apply_color_to_points_in_sphere(world_context_object, new_color, center, radius, visible_only)` -> `None` [classmethod] — Applies the given color to all points within the sphere
  - `are_points_by_ray(world_context_object, origin, direction, radius, visible_only)` -> `bool` [classmethod] — Returns true if there are any points hit by the given ray.
  - `are_points_in_box(world_context_object, center, extent, visible_only)` -> `bool` [classmethod] — Returns true if there are any points within the given box.
  - `are_points_in_sphere(world_context_object, center, radius, visible_only)` -> `bool` [classmethod] — Returns true if there are any points within the given sphere.
  - `conv_lidar_point_cloud_normal_to_vector(normal)` -> `Vector` [classmethod] — Converts a Lidar Point Cloud Normal to a Vector
  - `conv_vector_to_lidar_point_cloud_normal(vector)` -> `LidarPointCloudNormal` [classmethod] — Converts a Vector to a Lidar Point Cloud Normal
  - `create_point_cloud_empty()` -> `LidarPointCloud` [classmethod] — Returns new, empty Point Cloud object.
  - `create_point_cloud_from_data(world_context_object, points, use_async, progress=float, point_cloud=LidarPointCloud)` [classmethod]
  - `create_point_cloud_from_file(world_context_object, filename, use_async, progress=float, point_cloud=LidarPointCloud)` [classmethod] — Returns new Point Cloud object imported using default settings. If using Async, the process runs in the background witho...
  - `export_point_cloud_to_file(point_cloud, filename)` -> `bool` [classmethod] — Exports the Point Cloud to the given filename. Consult supported export formats. Returns true if successful
  - `get_points_in_box_as_copies(world_context_object, center, extent, visible_only)` -> `Array [ LidarPointCloudPoint ]` [classmethod] — Returns an array with copies of points within the given box
  - `get_points_in_sphere_as_copies(world_context_object, center, radius, visible_only)` -> `Array [ LidarPointCloudPoint ]` [classmethod] — Returns an array with copies of points within the given sphere
  - `line_trace_multi(world_context_object, origin, direction, radius, visible_only)` -> `Array[LidarPointCloudTraceHit] or None` [classmethod] — Does a collision trace along the given line and returns all hits encountered up to and including the first blocking hit.
  - `line_trace_single(world_context_object, origin, direction, radius, visible_only)` -> `LidarPointCloudTraceHit or None` [classmethod] — Does a collision trace along the given line and returns the first blocking hit encountered.
  - `normal_from_vector(normal, vector)` -> `LidarPointCloudNormal` [classmethod] — Sets the given normal using provided vector
  - `remove_first_point_by_ray(world_context_object, origin, direction, radius, visible_only)` -> `None` [classmethod] — Removes the first point hit by the given ray
  - `remove_points_by_ray(world_context_object, origin, direction, radius, visible_only)` -> `None` [classmethod] — Removes all points hit by the given ray
  - `remove_points_in_box(world_context_object, center, extent, visible_only)` -> `None` [classmethod] — Removes all points within the given box
  - `remove_points_in_sphere(world_context_object, center, radius, visible_only)` -> `None` [classmethod] — Removes all points within the given sphere
  - `set_visibility_of_first_point_by_ray(world_context_object, new_visibility, origin, direction, radius)` -> `None` [classmethod] — Sets visibility of the first point hit by the given ray.
  - `set_visibility_of_points_by_ray(world_context_object, new_visibility, origin, direction, radius)` -> `None` [classmethod] — Sets visibility of points hit by the given ray.
  - `set_visibility_of_points_in_box(world_context_object, new_visibility, center, extent)` -> `None` [classmethod] — Sets visibility of points within the given box.
  - `set_visibility_of_points_in_sphere(world_context_object, new_visibility, center, radius)` -> `None` [classmethod] — Sets visibility of points within the given sphere.

### `unreal.LidarPointCloudComponent`
Inherits: `MeshComponent` | Header: `LidarPointCloudComponent.h`

Component that allows you to render specified point cloud section

**Methods** (24):
  - `apply_color_to_first_point_by_ray(new_color, origin, direction, radius, visible_only)` -> `None` — Applies the given color to the first point hit by the given ray
  - `apply_color_to_points_by_ray(new_color, origin, direction, radius, visible_only)` -> `None` — Applies the given color to all points hit by the given ray
  - `apply_color_to_points_in_box(new_color, center, extent, visible_only)` -> `None` — Applies the given color to all points within the box
  - `apply_color_to_points_in_sphere(new_color, center, radius, visible_only)` -> `None` — Applies the given color to all points within the sphere
  - `apply_rendering_parameters()` -> `None` — Applies specified rendering parameters (Brightness, Saturation, etc) to the selected material
  - `get_point_cloud()` -> `LidarPointCloud` — Get Point Cloud
  - `get_point_shape()` -> `LidarPointCloudSpriteShape` — Returns the current Point Shape
  - `get_points_in_box_as_copies(center, extent, visible_only, return_world_space)` -> `Array [ LidarPointCloudPoint ]` — Populates the array with copies of points within the given box. If ReturnWorldSpace is selected, the pointsâ locations...
  - `get_points_in_sphere_as_copies(center, radius, visible_only, return_world_space)` -> `Array [ LidarPointCloudPoint ]` — Populates the array with copies of points within the given sphere. If ReturnWorldSpace is selected, the pointsâ locati...
  - `has_points_by_ray(origin, direction, radius, visible_only)` -> `bool` — Returns true if there are any points hit by the given ray.
  - `has_points_in_box(center, extent, visible_only)` -> `bool` — Returns true if there are any points within the given box.
  - `has_points_in_sphere(center, radius, visible_only)` -> `bool` — Returns true if there are any points within the given sphere.
  - `line_trace_multi(origin, direction, radius, visible_only, return_world_space)` -> `Array[LidarPointCloudPoint] or None` — Performs a raycast test against the point cloud. Populates OutHits array with the results. If ReturnWorldSpace is select...
  - `line_trace_single(origin, direction, radius, visible_only)` -> `LidarPointCloudPoint or None` — Performs a raycast test against the point cloud. Returns the pointer if hit or nullptr otherwise.
  - `remove_first_point_by_ray(origin, direction, radius, visible_only)` -> `None` — Removes the first point hit by the given ray
  - `remove_points_by_ray(origin, direction, radius, visible_only)` -> `None` — Removes all points hit by the given ray
  - `remove_points_in_box(center, extent, visible_only)` -> `None` — Removes all points within the given box
  - `remove_points_in_sphere(center, radius, visible_only)` -> `None` — Removes all points within the given sphere
  - `set_point_cloud(point_cloud)` -> `None` — Set Point Cloud
  - `set_point_shape(new_point_shape)` -> `None` — Sets new Point Shape
  - `set_visibility_of_first_point_by_ray(new_visibility, origin, direction, radius)` -> `None` — Sets visibility of the first point hit by the given ray.
  - `set_visibility_of_points_by_ray(new_visibility, origin, direction, radius)` -> `None` — Sets visibility of points hit by the given ray.
  - `set_visibility_of_points_in_box(new_visibility, center, extent)` -> `None` — Sets visibility of points within the given box.
  - `set_visibility_of_points_in_sphere(new_visibility, center, radius)` -> `None` — Sets visibility of points within the given sphere.

**Properties** (23):
  - `classification_colors`: `None` — [Read-Write] Used with the Classification source.
Maps the given classification ID to a color. (Map[...
  - `color_source`: `LidarPointCloudColorationMode` — [Read-Write] Specifies which source to use for point colors. (LidarPointCloudColorationMode)
  - `color_tint`: `LinearColor` — [Read-Write] Specifies the tint to apply to the points. (LinearColor)
  - `contrast`: `Vector4` — [Read-Write] (Vector4)
  - `custom_material`: `MaterialInterface` [Read-Only] — [Read-Only] Allows using custom-built material for the point cloud.
Set to None to use the default o...
  - `draw_node_bounds`: `bool` — [Read-Write] Enabling this will cause the visible nodes to render their bounds. (bool)
  - `elevation_color_bottom`: `LinearColor` — [Read-Write] Specifies the bottom color of the elevation-based gradient. (LinearColor)
  - `elevation_color_top`: `LinearColor` — [Read-Write] Specifies the top color of the elevation-based gradient. (LinearColor)
  - `gain`: `Vector4` — [Read-Write] Affects the emissive strength of the color. Useful to create Bloom and light bleed effe...
  - `gamma`: `Vector4` — [Read-Write] (Vector4)
  - `gap_filling_strength`: `float` — [Read-Write] If set to > 0, it attempts to close gaps between points.
Setting this too high may caus...
  - `intensity_influence`: `float` — [Read-Write] Specifies the influence of Intensity data, if available, on the overall color. (float)
  - `max_depth`: `int` — [Read-Write] Maximum Depth to which the nodes should be rendered.
-1 to disable. (int32)
  - `min_depth`: `int` — [Read-Write] Minimum Depth from which the nodes should be rendered.
0 to disable. (int32)
  - `offset`: `Vector4` — [Read-Write] Applied additively, 0 being neutral. (Vector4)
  - `point_cloud`: `LidarPointCloud` [Read-Only] — [Read-Only] (LidarPointCloud)
  - `point_orientation`: `LidarPointCloudSpriteOrientation` — [Read-Write] Affects the orientation of points. (LidarPointCloudSpriteOrientation)
  - `point_shape`: `LidarPointCloudSpriteShape` — [Read-Write] Affects the shape of points.
deprecated: Use GetPointShape() / SetPointShape() instead....
  - `point_size`: `float` — [Read-Write] Use to tweak the size of the points.
Set to 0 to switch to 1 pixel points. (float)
  - `point_size_bias`: `float` — [Read-Write] Larger values will help mask LOD transition areas, but too large values will lead to lo...
  - `saturation`: `Vector4` — [Read-Write] (Vector4)
  - `scaling_method`: `LidarPointCloudScalingMethod` — [Read-Write] Determines how the points will be scaled (LidarPointCloudScalingMethod)
  - `use_frustum_culling`: `bool` — [Read-Write] If enabled, points outside of the visible frustum will not be rendered.
While most proj...

### `unreal.LidarPointCloudFileIO`
Inherits: `Exporter` | Header: `LidarPointCloudFileIO.h`

Holds information about all registered file handlers

### `unreal.LidarPointCloudFileIO_ASCII`
Inherits: `BlueprintFunctionLibrary` | Header: `LidarPointCloudFileIO_ASCII.h`

Inherits from UBlueprintFunctionLibrary to allow exposure to Blueprint Library in the same class.

**Methods** (1):
  - `create_point_cloud_from_file(world_context_object, filename, use_async, rgb_range, columns, progress=float, point_cloud=LidarPointCloud)` [classmethod] — Create Point Cloud from File

### `unreal.LidarClippingVolumeMode`
Inherits: `EnumBase` | Header: `LidarPointCloudShared.h`

ELidar Clipping Volume Mode

**Properties** (2):
  - `CLIP_INSIDE`: `LidarClippingVolumeMode = Ellipsis` — This will clip all points inside the volume 0
  - `CLIP_OUTSIDE`: `LidarClippingVolumeMode = Ellipsis` — This will clip all points outside of the volume 1

### `unreal.LidarPointCloudAsyncMode`
Inherits: `EnumBase` | Header: `LidarPointCloudShared.h`

Used in blueprint latent function execution

**Properties** (3):
  - `FAILURE`: `LidarPointCloudAsyncMode = Ellipsis` — 1
  - `PROGRESS`: `LidarPointCloudAsyncMode = Ellipsis` — 2
  - `SUCCESS`: `LidarPointCloudAsyncMode = Ellipsis` — 0

### `unreal.LidarPointCloudColorationMode`
Inherits: `EnumBase` | Header: `LidarPointCloudShared.h`

ELidar Point Cloud Coloration Mode

**Properties** (6):
  - `CLASSIFICATION`: `LidarPointCloudColorationMode = Ellipsis` — Uses Classification ID of the point along with the componentâs Classification Colors property to s...
  - `DATA`: `LidarPointCloudColorationMode = Ellipsis` — Uses imported RGB / Intensity data 1
  - `DATA_WITH_CLASSIFICATION_ALPHA`: `LidarPointCloudColorationMode = Ellipsis` — Uses imported RGB / Intensity data combined with Alpha mask from Classification Colors 2
  - `ELEVATION`: `LidarPointCloudColorationMode = Ellipsis` — The cloudâs color will be overridden with elevation-based color 3
  - `NONE`: `LidarPointCloudColorationMode = Ellipsis` — Uses color tint only 0
  - `POSITION`: `LidarPointCloudColorationMode = Ellipsis` — The cloudâs color will be overridden with relative position-based color 4

### `unreal.LidarPointCloudDuplicateHandling`
Inherits: `EnumBase` | Header: `LidarPointCloudSettings.h`

ELidar Point Cloud Duplicate Handling

**Properties** (3):
  - `IGNORE`: `LidarPointCloudDuplicateHandling = Ellipsis` — Keeps any duplicates found 0
  - `SELECT_BRIGHTER`: `LidarPointCloudDuplicateHandling = Ellipsis` — Selects the brightest of the duplicates 2
  - `SELECT_FIRST`: `LidarPointCloudDuplicateHandling = Ellipsis` — Keeps the first point and skips any further duplicates 1

### `unreal.LidarPointCloudScalingMethod`
Inherits: `EnumBase` | Header: `LidarPointCloudShared.h`

ELidar Point Cloud Scaling Method

**Properties** (4):
  - `FIXED_SCREEN_SIZE`: `LidarPointCloudScalingMethod = Ellipsis` — Sprites will be rendered using screen-space scaling method.
In that mode, Point Size property will w...
  - `PER_NODE`: `LidarPointCloudScalingMethod = Ellipsis` — Points are scaled based on the estimated density of their containing node.
Recommended for assets wi...
  - `PER_NODE_ADAPTIVE`: `LidarPointCloudScalingMethod = Ellipsis` — Similar to PerNode, but the density is calculated adaptively based on the current view.
Produces goo...
  - `PER_POINT`: `LidarPointCloudScalingMethod = Ellipsis` — Points are scaled based on their individual calculated depth.
Capable of resolving the highest amoun...

### `unreal.LidarPointCloudSpriteOrientation`
Inherits: `EnumBase` | Header: `LidarPointCloudComponent.h`

ELidar Point Cloud Sprite Orientation

**Properties** (2):
  - `PREFER_FACING_CAMERA`: `LidarPointCloudSpriteOrientation = Ellipsis` — The sprites will face camera, even if Normals are available. 0
  - `PREFER_FACING_NORMAL`: `LidarPointCloudSpriteOrientation = Ellipsis` — The sprites will attempt to face Normals, if available, or fall back to facing camera otherwise. 1

### `unreal.LidarPointCloudSpriteShape`
Inherits: `EnumBase` | Header: `LidarPointCloudShared.h`

ELidar Point Cloud Sprite Shape

**Properties** (2):
  - `CIRCLE`: `LidarPointCloudSpriteShape = Ellipsis` — 1
  - `SQUARE`: `LidarPointCloudSpriteShape = Ellipsis` — 0
