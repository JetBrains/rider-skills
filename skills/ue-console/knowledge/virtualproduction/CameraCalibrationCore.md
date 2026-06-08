# UE Python API — CameraCalibrationCore Module

**39 types** from the `CameraCalibrationCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnamorphicDistortionParameters`, `CalibratedMapFormat`, `CameraFeedInfo`, `DataTablePointInfoBase`, `DistortionCalibrationResult`, `DistortionData`, `DistortionHandlerPicker`, `DistortionInfo`, `DistortionPointInfo`, `FocalLengthInfo`, `FocalLengthPointInfo`, `FocalLengthZoomPoint`, `ImageCenterInfo`, `ImageCenterPointInfo`, `LensDistortionState`, `LensFileEvaluationInputs`, `LensFilePicker`, `LensInfo`, `NodalOffsetPointInfo`, `NodalPointOffset`, ... (39 total)

---

## Classes

### `unreal.AnamorphicDistortionParameters`
Inherits: `StructBase` | Header: `AnamorphicLensModel.h`

Lens distortion parameters for the 3DE4 Anamorphic - Standard Degree 4 model All parameters are unitless and represent the coefficients used to undistort a distorted image For complete model descripti...

**Properties** (14):
  - `cx02`: `float` — [Read-Write] X coefficient of the r^2 term (float)
  - `cx04`: `float` — [Read-Write] X coefficient of the r^4 term (float)
  - `cx22`: `float` — [Read-Write] X coefficient of the r^2*cos(2*phi) term (float)
  - `cx24`: `float` — [Read-Write] X coefficient of the r^4*cos(2*phi) term (float)
  - `cx44`: `float` — [Read-Write] X coefficient of the r^4*cos(4*phi) term (float)
  - `cy02`: `float` — [Read-Write] Y coefficient of the r^2 term (float)
  - `cy04`: `float` — [Read-Write] Y coefficient of the r^4 term (float)
  - `cy22`: `float` — [Read-Write] Y coefficient of the r^2*cos(2*phi) term (float)
  - `cy24`: `float` — [Read-Write] Y coefficient of the r^4*cos(2*phi) term (float)
  - `cy44`: `float` — [Read-Write] Y coefficient of the r^4*cos(4*phi) term (float)
  - `lens_rotation`: `float` — [Read-Write] Lens Rotation in degrees. Represents mounting inaccuracies (should be small, between -2...
  - `pixel_aspect`: `float` — [Read-Write] Anamorphic Squeeze (the ratio of the filmback size to the size of the rasterized image)...
  - `squeeze_x`: `float` — [Read-Write] Squeeze Factor (should be small, relatively close to 1.0) (float)
  - `squeeze_y`: `float` — [Read-Write] Squeeze Factor (should be small, relatively close to 1.0) (float)

### `unreal.CalibratedMapFormat`
Inherits: `StructBase` | Header: `CalibratedMapFormat.h`

Formatting options for processing a calibrated map

### `unreal.CameraFeedInfo`
Inherits: `StructBase` | Header: `LensData.h`

Information about a camera feed, including its dimensions and aspect ratio. The camera feed represents (potentially) an inner rect of a media input, excluding any masks / extractions that may surround...

### `unreal.DataTablePointInfoBase`
Inherits: `StructBase` | Header: `LensData.h`

Base struct for point info wrapper which holds focus and zoom Child classes should hold the point info itself

**Properties** (2):
  - `focus`: `float` — [Read-Write] Point Focus Value (float)
  - `zoom`: `float` — [Read-Write] Point Zoom Value (float)

### `unreal.DistortionCalibrationResult`
Inherits: `StructBase` | Header: `CameraCalibrationTypes.h`

Results from a distortion calibration, including camera intrinsics and either the parameters to an analytical model or an ST Map

**Properties** (11):
  - `camera_poses`: `None` — [Read-Write] Calibrated camera pose for each input image (Array[Transform])
  - `error_message`: `Text` — [Read-Write] Error text to be written by a solver to provide the reason why the solve may have faile...
  - `evaluated_focus`: `float` — [Read-Write] Nominal focus distance of the lens associated with this result (float)
  - `evaluated_zoom`: `float` — [Read-Write] Nominal focal length of the lens associated with this result (float)
  - `focal_length`: `FocalLengthInfo` — [Read-Write] Calibrated focal length result (FocalLengthInfo)
  - `image_center`: `ImageCenterInfo` — [Read-Write] Calibrated image center result (ImageCenterInfo)
  - `nodal_offset`: `NodalPointOffset` — [Read-Write] Calibrated nodal offset result (NodalPointOffset)
  - `parameters`: `DistortionInfo` — [Read-Write] Distortion parameters for the model specified by the lens file. And empty parameter arr...
  - `reprojection_error`: `float` — [Read-Write] Final reprojection error produced using this result (double)
  - `st_map`: `STMapInfo` — [Read-Write] ST Map that represents the UV displacements for this result. If the ST Map UTexture is ...
  - `st_map_full_path`: `str` — [Read-Write] Absolute path to an ST Map file on disk that should be imported when this result is pro...

### `unreal.DistortionData`
Inherits: `StructBase` | Header: `LensData.h`

Distortion data evaluated for given FZ pair based on lens parameters

**Properties** (2):
  - `distorted_u_vs`: `None` [Read-Only] — [Read-Only] (Array[Vector2D])
  - `overscan_factor`: `float` — [Read-Write] Estimated overscan factor based on distortion to have distorted cg covering full size (...

### `unreal.DistortionHandlerPicker`
Inherits: `StructBase` | Header: `CameraCalibrationTypes.h`

Distortion Handler Picker

**Properties** (3):
  - `distortion_producer_id`: `Guid` — [Read-Write] UObject that produces the distortion state for the desired distortion handler (Guid)
  - `handler_display_name`: `str` — [Read-Write] Display name of the desired distortion handler (str)
  - `target_camera_component`: `CineCameraComponent` — [Read-Write] CineCameraComponent with which the desired distortion handler is associated (CineCamera...

### `unreal.DistortionInfo`
Inherits: `StructBase` | Header: `LensData.h`

Lens distortion parameters

**Properties** (1):
  - `parameters`: `None` — [Read-Write] Generic array of floating-point lens distortion parameters (Array[float])

### `unreal.DistortionPointInfo`
Inherits: `DataTablePointInfoBase` | Header: `LensData.h`

Distortion Point Info struct

**Properties** (1):
  - `distortion_info`: `DistortionInfo` — [Read-Write] Lens distortion parameter (DistortionInfo)

### `unreal.FocalLengthInfo`
Inherits: `StructBase` | Header: `LensData.h`

Normalized focal length information for both width and height dimension If focal length is in pixel, normalize using pixel dimensions If focal length is in mm, normalize using sensor dimensions

**Properties** (1):
  - `fx_fy`: `Vector2D` — [Read-Write] Value expected to be normalized (unitless) (Vector2D)

### `unreal.FocalLengthPointInfo`
Inherits: `DataTablePointInfoBase` | Header: `LensData.h`

Focal Length Point Info struct

**Properties** (1):
  - `focal_length_info`: `FocalLengthInfo` — [Read-Write] Focal Length parameter (FocalLengthInfo)

### `unreal.FocalLengthZoomPoint`
Inherits: `StructBase` | Header: `FocalLengthTable.h`

Focal length associated to a zoom value

### `unreal.ImageCenterInfo`
Inherits: `StructBase` | Header: `LensData.h`

Lens camera image center parameters

**Properties** (1):
  - `principal_point`: `Vector2D` — [Read-Write] Value expected to be normalized [0,1] (Vector2D)

### `unreal.ImageCenterPointInfo`
Inherits: `DataTablePointInfoBase` | Header: `LensData.h`

Image Center Point Info struct

**Properties** (1):
  - `image_center_info`: `ImageCenterInfo` — [Read-Write] Image Center parameter (ImageCenterInfo)

### `unreal.LensDistortionState`
Inherits: `StructBase` | Header: `LensDistortionModelHandlerBase.h`

Lens Distortion State

**Properties** (3):
  - `distortion_info`: `DistortionInfo` — [Read-Write] Generic array of distortion parameters (DistortionInfo)
  - `focal_length_info`: `FocalLengthInfo` — [Read-Write] Normalized focal fength in both dimensions (FocalLengthInfo)
  - `image_center`: `ImageCenterInfo` — [Read-Write] Normalized center of the image, in the range [0.0f, 1.0f] (ImageCenterInfo)

### `unreal.LensFileEvaluationInputs`
Inherits: `StructBase` | Header: `LensFile.h`

Lens File Evaluation Inputs

**Properties** (5):
  - `filmback`: `CameraFilmbackSettings` — [Read-Write] (CameraFilmbackSettings)
  - `focus`: `float` — [Read-Write] (float)
  - `iris`: `float` — [Read-Write] (float)
  - `is_valid`: `bool` [Read-Only] — [Read-Only] (bool)
  - `zoom`: `float` — [Read-Write] (float)

### `unreal.LensFilePicker`
Inherits: `StructBase` | Header: `LensFile.h`

Wrapper to facilitate default LensFile vs picker

**Properties** (2):
  - `lens_file`: `LensFile` — [Read-Write] LensFile asset to use if DefaultLensFile is not desired (LensFile)
  - `use_default_lens_file`: `bool` — [Read-Write] If true, default LensFile will be used, if one is set (bool)

### `unreal.LensInfo`
Inherits: `StructBase` | Header: `LensData.h`

Information about the lens rig

**Properties** (6):
  - `image_dimensions`: `IntPoint` — [Read-Write] Resolution of the original footage that was captured by the camera (not necessarily the...
  - `lens_model`: `Class` — [Read-Write] Model of the lens (spherical, anamorphic, etcâ¦) (type(Class))
  - `lens_model_name`: `str` — [Read-Write] Model name of the lens (str)
  - `lens_serial_number`: `str` — [Read-Write] Serial number of the lens (str)
  - `sensor_dimensions`: `Vector2D` — [Read-Write] Width and height of the calibrated cameraâs sensor, in millimeters (Vector2D)
  - `squeeze_factor`: `float` — [Read-Write] Squeeze Factor (or Pixel Aspect) for anamorphic lenses. Spherical Lenses should keep th...

### `unreal.NodalOffsetPointInfo`
Inherits: `DataTablePointInfoBase` | Header: `LensData.h`

Nodal Point Point Info struct

**Properties** (1):
  - `nodal_point_offset`: `NodalPointOffset` — [Read-Write] Nodal Point parameter (NodalPointOffset)

### `unreal.NodalPointOffset`
Inherits: `StructBase` | Header: `LensData.h`

Lens nodal point offset

**Properties** (2):
  - `location_offset`: `Vector` — [Read-Write] (Vector)
  - `rotation_offset`: `Quat` — [Read-Write] (Quat)

### `unreal.SimulcamInfo`
Inherits: `StructBase` | Header: `LensData.h`

Information about the simulcam composition

**Properties** (3):
  - `cg_layer_aspect_ratio`: `float` — [Read-Write] Aspect ratio of the CG layer in the simulcam composition, which was set to match the as...
  - `media_plate_aspect_ratio`: `float` — [Read-Write] Aspect ratio of the media plate in the simulcam composition, which was set to match the...
  - `media_resolution`: `IntPoint` — [Read-Write] Resolution of the selected Media Source (IntPoint)

### `unreal.SphericalDistortionParameters`
Inherits: `StructBase` | Header: `SphericalLensModel.h`

Spherical lens distortion parameters All parameters are unitless and represent the coefficients used to undistort a distorted image Refer to the OpenCV camera calibration documentation for the intende...

**Properties** (5):
  - `k1`: `float` — [Read-Write] Radial coefficient of the r^2 term (float)
  - `k2`: `float` — [Read-Write] Radial coefficient of the r^4 term (float)
  - `k3`: `float` — [Read-Write] Radial coefficient of the r^6 term (float)
  - `p1`: `float` — [Read-Write] First tangential coefficient (float)
  - `p2`: `float` — [Read-Write] Second tangential coefficient (float)

### `unreal.STMapInfo`
Inherits: `StructBase` | Header: `LensData.h`

Pre generate STMap and normalized focal length information

**Properties** (1):
  - `distortion_map`: `Texture` — [Read-Write] Pre calibrated UVMap/STMap (Texture)

### `unreal.STMapPointInfo`
Inherits: `DataTablePointInfoBase` | Header: `LensData.h`

ST Map Point Info struct

**Properties** (1):
  - `st_map_info`: `STMapInfo` — [Read-Write] ST Map parameter (STMapInfo)

### `unreal.AnamorphicLensDistortionModelHandler`
Inherits: `LensDistortionModelHandlerBase` | Header: `AnamorphicLensDistortionModelHandler.h`

Lens distortion handler for an Anamorphic lens model that implements the 3DE4 Anamorphic - Standard Degree 4 model

### `unreal.AnamorphicLensModel`
Inherits: `LensModel` | Header: `AnamorphicLensModel.h`

Anamorphic lens model, using Anamorphic lens distortion parameters

### `unreal.CalibrationPointComponent`
Inherits: `ProceduralMeshComponent` | Header: `CalibrationPointComponent.h`

One or more instances of this component can be added to an actor (e.g. a static mesh actor blueprint), and should be placed at geometrically and visually distinct landmarks of the object. These 3d poi...

**Methods** (4):
  - `get_namespaced_point_names()` -> `Array [ str ]` — Gathers the namespaced names of the subpoints and the component itself.
  - `get_world_location(point_name)` -> `Vector or None` — Returns the World location of the subpoint (or the component) specified by name
  - `namespaced_subpoint_name(subpoint_name)` -> `str or None` — Namespaces the given subpoint name. Does not check that the subpoint exists.
  - `rebuild_vertices()` -> `None` — Rebuilds the point visualization.

**Properties** (4):
  - `point_visualization_scale`: `float` — [Read-Write] Scales up/down the size of the point visualization meshes (float)
  - `sub_points`: `None` — [Read-Write] A way to group many points in a single component (Map[str,Vector])
  - `visualization_shape`: `CalibrationPointVisualization` — [Read-Write] Shape used to visualize the calibration (sub)points (CalibrationPointVisualization)
  - `visualize_points_in_editor`: `bool` — [Read-Write] Draws a visual representation of the calibration points (bool)

### `unreal.CameraCalibrationCheckerboard`
Inherits: `Actor` | Header: `CameraCalibrationCheckerboard.h`

Dynamic checkerboad actor

**Methods** (1):
  - `rebuild()` -> `None` — Rebuilds the instanced components that make up this checkerboard

**Properties** (4):
  - `num_corner_cols`: `int` — [Read-Write] Number of columns (int32)
  - `num_corner_rows`: `int` — [Read-Write] Number of rows (int32)
  - `square_side_length`: `float` — [Read-Write] Length of the side of each square (float)
  - `thickness`: `float` — [Read-Write] Thickness of checkerboard. Not used for calibration purposes. (float)

### `unreal.CameraCalibrationSubsystem`
Inherits: `EngineSubsystem` | Header: `CameraCalibrationSubsystem.h`

Camera Calibration subsystem

**Methods** (16):
  - `find_distortion_model_handler(distortion_handler_picker, distortion_handler_picker=DistortionHandlerPicker)` — Find Distortion Model Handler
  - `find_or_create_distortion_model_handler(distortion_handler_picker, distortion_handler_picker=DistortionHandlerPicker)` — Find or Create Distortion Model Handler
  - `get_camera_calibration_step(name)` — Returns the camera calibration step by name
  - `get_camera_calibration_steps()` -> `Array [ Name ]` — Returns an array with the names of the available camera calibration steps
  - `get_camera_image_center_algo(name)` — Returns the image center algorithm by name
  - `get_camera_image_center_algos()` -> `Array [ Name ]` — Returns an array with the names of the available image center algorithms
  - `get_camera_nodal_offset_algo(name)` — Returns the nodal offset algorithm by name
  - `get_camera_nodal_offset_algos()` -> `Array [ Name ]` — Returns an array with the names of the available nodal offset algorithms
  - `get_default_lens_file()` -> `LensFile` — Get the default lens file.
  - `get_distortion_model_handlers(component)` -> `Array [ LensDistortionModelHandlerBase ]` — Get Distortion Model Handlers
  - `get_lens_file(picker)` -> `LensFile` — Facilitator around the picker to get the desired lens file.
  - `get_overlay_material(overlay_name)` -> `MaterialInterface` — Returns the overlay material associated with the input overlay name
  - `get_overlay_material_names()` -> `Array [ Name ]` — Returns a list of all overlays known to the subsystem This includes the default overlays listed in the camera calibratio...
  - `get_registered_lens_model(model_name)` — Return the ULensModel subclass that was registered with the input model name
  - `set_default_lens_file(new_default_lens_file)` -> `None` — Get the default lens file.
  - `unregister_distortion_model_handler(component, handler)` -> `None` — Unregister Distortion Model Handler

### `unreal.LensDistortionModelHandlerBase`
Inherits: `Object` | Header: `LensDistortionModelHandlerBase.h`

Asset user data that can be used on Camera Actors to manage lens distortion state and utilities

**Methods** (4):
  - `get_distortion_displacement_map()` -> `TextureRenderTarget2D` — Get the UV displacement map used to distort an undistorted image
  - `get_undistortion_displacement_map()` -> `TextureRenderTarget2D` — Get the UV displacement map used to undistort a distorted image
  - `is_model_supported(model_to_support)` -> `bool` — Returns true if the input model is supported by this model handler, false otherwise.
  - `set_distortion_state(new_state)` -> `None` — Update the lens distortion state, recompute the overscan factor, and set all material parameters

**Properties** (5):
  - `camera_filmback`: `CameraFilmbackSettings` — [Read-Write] Filmback settings of the camera that is being used for distortion (CameraFilmbackSettin...
  - `current_state`: `LensDistortionState` [Read-Only] — [Read-Only] Current state as set by the most recent call to Update() (LensDistortionState)
  - `distortion_post_process_mid`: `MaterialInstanceDynamic` [Read-Only] — [Read-Only] Dynamically created post-process material instance for the currently specified lens mode...
  - `lens_model_class`: `Class` [Read-Only] — [Read-Only] Lens Model describing how to interpret the distortion parameters (type(Class))
  - `overscan_factor`: `float` [Read-Only] — [Read-Only] Computed overscan factor needed to scale the cameraâs FOV (read-only) (float)

### `unreal.LensFile`
Inherits: `Object` | Header: `LensFile.h`

A Lens file containing calibration mapping from FIZ data

**Methods** (35):
  - `add_distortion_point(new_focus, new_zoom, new_point, new_focal_length)` -> `None` — Adds a distortion point in our map. If a point already exist at the location, it is updated
  - `add_focal_length_point(new_focus, new_zoom, new_focal_length)` -> `None` — Adds a focal length point in our map. If a point already exist at the location, it is updated
  - `add_image_center_point(new_focus, new_zoom, new_point)` -> `None` — Adds an ImageCenter point in our map. If a point already exist at the location, it is updated
  - `add_nodal_offset_point(new_focus, new_zoom, new_point)` -> `None` — Adds an NodalOffset point in our map. If a point already exist at the location, it is updated
  - `add_st_map_point(new_focus, new_zoom, new_point)` -> `None` — Adds an STMap point in our map. If a point already exist at the location, it is updated
  - `change_focus_point(data_category, existing_focus, new_focus)` -> `None` — Changes the value of a focus point
  - `change_zoom_point(data_category, focus, existing_zoom, new_zoom)` -> `None` — Changes the value of a zoom point
  - `clear_all()` -> `None` — Removes all points of all tables
  - `clear_data(data_category)` -> `None` — Removes table associated to data category
  - `evaluate_distortion_data(focus, zoom, filmback, lens_handler)` -> `bool` — Draws the distortion map based on evaluation point
  - `evaluate_distortion_parameters(focus, zoom)` -> `DistortionInfo or None` — Returns interpolated distortion parameters
  - `evaluate_focal_length(focus, zoom)` -> `FocalLengthInfo or None` — Returns interpolated focal length
  - `evaluate_image_center_parameters(focus, zoom)` -> `ImageCenterInfo or None` — Returns interpolated image center parameters based on input focus and zoom
  - `evaluate_nodal_point_offset(focus, zoom)` -> `NodalPointOffset or None` — Returns interpolated nodal point offset based on input focus and zoom
  - `evaluate_normalized_focus(normalized_value)` -> `float` — Returns interpolated focus based on input normalized value and mapping
  - `evaluate_normalized_iris(normalized_value)` -> `float` — Returns interpolated iris based on input normalized value and mapping
  - `get_distortion_point(focus, zoom)` -> `DistortionInfo or None` — Gets a Distortion point by given focus and zoom, if point does not exists returns false
  - `get_distortion_points()` -> `Array [ DistortionPointInfo ]` — Gets all Distortion points struct with focus, zoom and info
  - `get_focal_length_point(focus, zoom)` -> `FocalLengthInfo or None` — Gets a Focal Length point by given focus and zoom, if point does not exists returns false
  - `get_focal_length_points()` -> `Array [ FocalLengthPointInfo ]` — Gets all Focal Length points struct with focus, zoom and info
  - `get_image_center_point(focus, zoom)` -> `ImageCenterInfo or None` — Gets a Image Center point by given focus and zoom, if point does not exists returns false
  - `get_image_center_points()` -> `Array [ ImageCenterPointInfo ]` — Gets all Image Center points struct with focus, zoom and info
  - `get_nodal_offset_point(focus, zoom)` -> `NodalPointOffset or None` — Gets a Nodal Offset point by given focus and zoom, if point does not exists returns false
  - `get_nodal_offset_points()` -> `Array [ NodalOffsetPointInfo ]` — Gets all Nodal Offset points struct with focus, zoom and info
  - `get_st_map_point(focus, zoom)` -> `STMapInfo or None` — Gets a ST Map point by given focus and zoom, if point does not exists returns false
  - `get_st_map_points()` -> `Array [ STMapPointInfo ]` — Gets all ST Map points struct with focus, zoom and info
  - `get_total_point_num(data_category)` -> `int32` — Returns total number of the points for given category
  - `has_focus_encoder_mapping()` -> `bool` — Whether focus encoder mapping is configured
  - `has_focus_point(data_category, focus)` -> `bool` — Checks to see if there is a focal point for the specified focus in the data category
  - `has_iris_encoder_mapping()` -> `bool` — Whether iris encoder mapping is configured
  - `has_samples(data_category)` -> `bool` — Returns whether a category has data samples
  - `has_zoom_point(data_category, focus, zoom)` -> `bool` — Removes a zoom point
  - `merge_focus_point(data_category, src_focus, dest_focus, replace_existing_zoom_points)` -> `None` — Merges the contents of one focus point into another focus point
  - `remove_focus_point(data_category, focus)` -> `None` — Removes a focus point
  - `remove_zoom_point(data_category, focus, zoom)` -> `None` — Removes a zoom point

**Properties** (5):
  - `camera_feed_info`: `CameraFeedInfo` — [Read-Write] Camera feed information (CameraFeedInfo)
  - `data_mode`: `LensDataMode` — [Read-Write] Type of data used for lens mapping (LensDataMode)
  - `lens_info`: `LensInfo` — [Read-Write] Lens information (LensInfo)
  - `simulcam_info`: `SimulcamInfo` [Read-Only] — [Read-Only] Simulcam information (SimulcamInfo)
  - `user_metadata`: `None` — [Read-Write] Metadata user could enter for its lens (Map[str,str])

### `unreal.LensModel`
Inherits: `Object` | Header: `LensModel.h`

Abstract base class for lens models

### `unreal.SphericalLensDistortionModelHandler`
Inherits: `LensDistortionModelHandlerBase` | Header: `SphericalLensDistortionModelHandler.h`

Lens distortion handler for a spherical lens model that implements the Brown-Conrady polynomial model

### `unreal.SphericalLensModel`
Inherits: `LensModel` | Header: `SphericalLensModel.h`

Spherical lens model, using spherical lens distortion parameters

### `unreal.CalibratedMapChannels`
Inherits: `EnumBase` | Header: `CalibratedMapFormat.h`

Specifies which two channels contain the calibrated map data (or None if there is no data)

**Properties** (3):
  - `BA`: `CalibratedMapChannels = Ellipsis` — 1
  - `NONE`: `CalibratedMapChannels = Ellipsis` — 2
  - `RG`: `CalibratedMapChannels = Ellipsis` — 0

### `unreal.CalibratedMapPixelOrigin`
Inherits: `EnumBase` | Header: `CalibratedMapFormat.h`

Specifies the location of the pixel origin in a calibrated map

**Properties** (2):
  - `BOTTOM_LEFT`: `CalibratedMapPixelOrigin = Ellipsis` — 1
  - `TOP_LEFT`: `CalibratedMapPixelOrigin = Ellipsis` — 0

### `unreal.CalibrationPointVisualization`
Inherits: `EnumBase` | Header: `CalibrationPointComponent.h`

Ways of visualizing the calibration points

**Properties** (2):
  - `CALIBRATION_POINT_VISUALIZATION_CUBE`: `CalibrationPointVisualization = Ellipsis` — 0
  - `CALIBRATION_POINT_VISUALIZATION_PYRAMID`: `CalibrationPointVisualization = Ellipsis` — 1

### `unreal.LensDataCategory`
Inherits: `EnumBase` | Header: `LensFile.h`

Data categories manipulated in the camera calibration tools

**Properties** (7):
  - `DISTORTION`: `LensDataCategory = Ellipsis` — 3
  - `FOCUS`: `LensDataCategory = Ellipsis` — 0
  - `IMAGE_CENTER`: `LensDataCategory = Ellipsis` — 4
  - `IRIS`: `LensDataCategory = Ellipsis` — 1
  - `NODAL_OFFSET`: `LensDataCategory = Ellipsis` — 6
  - `ST_MAP`: `LensDataCategory = Ellipsis` — 5
  - `ZOOM`: `LensDataCategory = Ellipsis` — 2

### `unreal.LensDataMode`
Inherits: `EnumBase` | Header: `LensFile.h`

Mode of operation of Lens File

**Properties** (2):
  - `PARAMETERS`: `LensDataMode = Ellipsis` — 0
  - `ST_MAP`: `LensDataMode = Ellipsis` — 1
