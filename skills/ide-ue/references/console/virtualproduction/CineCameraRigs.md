# UE Python API — CineCameraRigs Module

**10 types** from the `CineCameraRigs` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CineSplineCurveDefaults`, `CineSplinePointData`, `CineCameraAttachMount`, `CineCameraRigRail`, `CineCameraRigRailHelpers`, `CineCameraRigRailSettings`, `CineSplineComponent`, `CineCameraRigRailDriveMode`, `CineCameraRigRailLoopMode`, `CineSplineComponent_OnSplineEdited_BP`

---

## Classes

### `unreal.CineSplineCurveDefaults`
Inherits: `StructBase` | Header: `CineSplineMetadata.h`

Cine Spline Curve Defaults

### `unreal.CineSplinePointData`
Inherits: `StructBase` | Header: `CineSplinePointData.h`

Simple struct to hold spline point data

**Properties** (5):
  - `aperture`: `float` — [Read-Write] (float)
  - `focal_length`: `float` — [Read-Write] (float)
  - `focus_distance`: `float` — [Read-Write] (float)
  - `location`: `Vector` — [Read-Write] (Vector)
  - `rotation`: `Rotator` — [Read-Write] (Rotator)

### `unreal.CineCameraAttachMount`
Inherits: `Actor` | Header: `CineCameraAttachMount.h`

Cine Camera Attach Mount

**Methods** (5):
  - `get_constraint()` -> `TickableParentConstraint` — Get ParentConstraint object. Returns nullptr if there is no constraint
  - `reset_location_offset()` -> `None` — Reset constraint offset for location
  - `reset_rotation_offset()` -> `None` — Reset constraint offset for rotation
  - `zero_roll()` -> `None` — Zero out rotationX in world space. This can help setting the mount parallel to the ground.
  - `zero_tilt()` -> `None` — Zero out rotationY in world space. This can help setting the mount parallel to the ground.

**Properties** (8):
  - `enable_location_lag`: `bool` — [Read-Write] If true, attached actors lag behind target position to smooth its movement (bool)
  - `enable_rotation_lag`: `bool` — [Read-Write] If true, attached actors lag behind target position to smooth its movement (bool)
  - `location_lag_speed`: `float` — [Read-Write] If bEnableLocationLag is true, controls how quickly camera reaches target position. Low...
  - `rotation_lag_speed`: `float` — [Read-Write] If bEnableRotationLag is true, controls how quickly camera reaches target position. Low...
  - `spring_arm_component`: `SpringArmComponent` [Read-Only] — [Read-Only] SprintArm component for lag effect (SpringArmComponent)
  - `target_actor`: `Actor` — [Read-Write] Constraint target actor (Actor)
  - `target_socket`: `Name` — [Read-Write] Constraint target socket name (Name)
  - `transform_filter`: `TransformFilter` — [Read-Write] Constraint axis filter (TransformFilter)

### `unreal.CineCameraRigRail`
Inherits: `CameraRig_Rail` | Header: `CineCameraRigRail.h`

Cine Camera Rig Rail

**Methods** (2):
  - `get_cine_spline_component()` -> `CineSplineComponent` — Returns CineSplineComponent
  - `get_velocity_at_position(position, delta = 0.001000)` -> `Vector` — Calculate internal velocity at the given position

**Properties** (25):
  - `absolute_position_on_rail`: `float` — [Read-Write] Custom parameter to drive current position (float)
  - `attach_location_x`: `bool` — [Read-Write] Determines if camera mount inherits LocationX (bool)
  - `attach_location_y`: `bool` — [Read-Write] Determines if camera mount inherits LocationY (bool)
  - `attach_location_z`: `bool` — [Read-Write] Determines if camera mount inherits LocationZ (bool)
  - `attach_rotation_x`: `bool` — [Read-Write] Determines if camera mount inherits RotationX (bool)
  - `attach_rotation_y`: `bool` — [Read-Write] Determines if camera mount inherits RotationY (bool)
  - `attach_rotation_z`: `bool` — [Read-Write] Determines if camera mount inherits RotationZ (bool)
  - `cine_spline_component`: `CineSplineComponent` [Read-Only] — [Read-Only] (CineSplineComponent)
  - `compensate_time_scale`: `bool` — [Read-Write] If enabled, it compensates world time dilation in Speed/Duration mode so that the splin...
  - `display_speed_heatmap`: `bool` — [Read-Write] Enable speed visualization. Automatically disabled when position property is driven in ...
  - `drive_mode`: `CineCameraRigRailDriveMode` — [Read-Write] Drive Mode to update position in tick (CineCameraRigRailDriveMode)
  - `inherit_aperture`: `bool` — [Read-Write] Determines if it can drive aperture on the attached actors (bool)
  - `inherit_focal_length`: `bool` — [Read-Write] Determines if it can drive focal length on the attached actors (bool)
  - `inherit_focus_distance`: `bool` — [Read-Write] Determines if it can drive focus distance on the attached actors (bool)
  - `loop`: `bool` — [Read-Write] Enable loop in speed or duration mode
deprecated: Use LoopMode instead (bool)
  - `loop_mode`: `CineCameraRigRailLoopMode` — [Read-Write] (CineCameraRigRailLoopMode)
  - `play`: `bool` — [Read-Write] Determine if it can update position in Duration mode or Speed mode. If false, it pauses...
  - `reverse`: `bool` — [Read-Write] Determine if it plays in reverse. (bool)
  - `speed`: `float` — [Read-Write] Specifies the drive speed of the rig rail in centimeter per second (float)
  - `speed_sample_count_per_segment`: `int` — [Read-Write] Number of speed samples per spline segment (int32)
  - `spline_mesh_material`: `MaterialInterface` — [Read-Write] Material assigned to spline component mesh (MaterialInterface)
  - `spline_mesh_mi_ds`: `None` [Read-Only] — [Read-Only] Material Instance Dynamic created for the spline mesh (Array[MaterialInstanceDynamic])
  - `spline_mesh_texture`: `Texture2D` — [Read-Write] Texture that can be set to SplineMeshMIDs (Texture2D)
  - `use_absolute_position`: `bool` — [Read-Write] Use AbsolutePosition metadata to parameterize the spline (bool)
  - `use_point_rotation`: `bool` — [Read-Write] Use PointRotation metadata for attachment orientation. If false, attachment orientation...

### `unreal.CineCameraRigRailHelpers`
Inherits: `BlueprintFunctionLibrary` | Header: `CineCameraRigRailHelpers.h`

Cine Camera Rig Rail Helpers

**Methods** (1):
  - `create_or_update_spline_heatmap_texture(texture, data_values, low_value, average_value, high_value)` -> `Texture2D` [classmethod] — Create a transient heatmap texture from data values

### `unreal.CineCameraRigRailSettings`
Inherits: `Object` | Header: `CineCameraRigsSettings.h`

Cine Camera Rig Rail Settings

**Properties** (3):
  - `default_spline_mesh_material`: `MaterialInterface` — [Read-Write] Path to the default spline mesh material used in CineCameraRigRail (MaterialInterface)
  - `default_spline_mesh_texture`: `Texture2D` — [Read-Write] Path to the default spline mesh texture used when speed visualization is off (Texture2D...
  - `speed_mode_spline_mesh_texture`: `Texture2D` — [Read-Write] Path to the texture used in the speed visualization when drive mode is Speed (Texture2D...

### `unreal.CineSplineComponent`
Inherits: `SplineComponent` | Header: `CineSplineComponent.h`

Cine Spline Component

**Methods** (13):
  - `add_spline_data_at_position(position, point_data)` -> `None` — Add a new spline point data at the given custom position
  - `find_spline_data_at_position(position, tolerance = 0.001000)` -> `int32 or None` — Returns true if there is a spline point at given custom position
  - `get_input_key_at_position(position)` -> `float` — Get input key value from custom position
  - `get_point_rotation_at_spline_input_key(key)` -> `Quat` — Get camera rotation metadata value along the spline at spline input key
  - `get_point_rotation_at_spline_point(index)` -> `Quat` — Get camera rotation metadata property value along the spline at spline point
  - `get_position_at_input_key(key)` -> `float` — Get custom position value at spline input key
  - `get_spline_data_at_position(position)` -> `CineSplinePointData` — Get a spline point data at the given custom position
  - `set_absolute_position_at_spline_point(point_index, value)` -> `None` — Set custom position metadata at a given spline point
  - `set_aperture_at_spline_point(point_index, value)` -> `None` — Set aperture metadata at a given spline point
  - `set_focal_length_at_spline_point(point_index, value)` -> `None` — Set focal lenght metadata at a given splint point
  - `set_focus_distance_at_spline_point(point_index, value)` -> `None` — Set focus distance metadata at a given spline point
  - `set_point_rotation_at_spline_point(point_index, value)` -> `None` — Set camera rotation metadata at a given spline point
  - `update_spline_data_at_index(index, point_data)` -> `None` — Update spline point data at the given spline point

**Properties** (1):
  - `on_spline_edited_bp`: `OnSplineEdited_BP` — [Read-Write] Event trigerred when spline is edited (OnSplineEdited_BP)

### `unreal.CineCameraRigRailDriveMode`
Inherits: `EnumBase` | Header: `CineCameraRigRail.h`

ECine Camera Rig Rail Drive Mode

**Properties** (3):
  - `DURATION`: `CineCameraRigRailDriveMode = Ellipsis` — Duration Mode. AbsolutePostionOnRail is updated based on the spline duration 1
  - `MANUAL`: `CineCameraRigRailDriveMode = Ellipsis` — Manual Mode 0
  - `SPEED`: `CineCameraRigRailDriveMode = Ellipsis` — Speed Mode. AbsolutePositionOnRail is updated based on the specified speed 2

### `unreal.CineCameraRigRailLoopMode`
Inherits: `EnumBase` | Header: `CineCameraRigRail.h`

ECine Camera Rig Rail Loop Mode

**Properties** (3):
  - `BOUNCE`: `CineCameraRigRailLoopMode = Ellipsis` — Play forward then backward 2
  - `LOOP`: `CineCameraRigRailLoopMode = Ellipsis` — Play Loop 1
  - `NO_LOOP`: `CineCameraRigRailLoopMode = Ellipsis` — Play once 0

### `unreal.CineSplineComponent_OnSplineEdited_BP`
Inherits: `MulticastDelegateBase` | Header: `CineSplineComponent.h`

On Spline Edited BP Delegate Signature
