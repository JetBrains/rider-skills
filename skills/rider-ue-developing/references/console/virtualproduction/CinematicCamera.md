# UE Python API — CinematicCamera Module

**15 types** from the `CinematicCamera` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CameraFilmbackSettings`, `CameraFocusSettings`, `CameraLensSettings`, `CameraLookatTrackingSettings`, `CameraTrackingFocusSettings`, `NamedFilmbackPreset`, `NamedLensPreset`, `NamedPlateCropPreset`, `PlateCropSettings`, `CameraRig_Crane`, `CameraRig_Rail`, `CineCameraActor`, `CineCameraComponent`, `CineCameraSettings`, `CameraFocusMethod`

---

## Classes

### `unreal.CameraFilmbackSettings`
Inherits: `StructBase` | Header: `CineCameraSettings.h`

#note, this struct has a details customization in CameraFilmbackSettingsCustomization.cpp/h

**Properties** (5):
  - `sensor_aspect_ratio`: `float` [Read-Only] — [Read-Only] Read-only. Computed from Sensor dimensions. (float)
  - `sensor_height`: `float` — [Read-Write] Vertical size of filmback or digital sensor, in mm. (float)
  - `sensor_horizontal_offset`: `float` — [Read-Write] Horizontal offset of the filmback, in mm. (float)
  - `sensor_vertical_offset`: `float` — [Read-Write] Vertical offset of the filmback, in mm. (float)
  - `sensor_width`: `float` — [Read-Write] Horizontal size of filmback or digital sensor, in mm. (float)

### `unreal.CameraFocusSettings`
Inherits: `StructBase` | Header: `CineCameraSettings.h`

Settings to control camera focus

**Properties** (6):
  - `focus_method`: `CameraFocusMethod` — [Read-Write] Which method to use to handle camera focus (CameraFocusMethod)
  - `focus_offset`: `float` — [Read-Write] Additional focus depth offset, used for manually tweaking if your chosen focus method n...
  - `focus_smoothing_interp_speed`: `float` — [Read-Write] Controls interpolation speed when smoothing focus distance changes. Ignored if bSmoothF...
  - `manual_focus_distance`: `float` — [Read-Write] Manually-controlled focus distance (manual focus mode only) (float)
  - `smooth_focus_changes`: `bool` — [Read-Write] True to use interpolation to smooth out changes in focus distance, false for focus dist...
  - `tracking_focus_settings`: `CameraTrackingFocusSettings` — [Read-Write] Settings to control tracking focus (tracking focus mode only) (CameraTrackingFocusSetti...

### `unreal.CameraLensSettings`
Inherits: `StructBase` | Header: `CineCameraSettings.h`

#note, this struct has a details customization in CameraLensSettingsCustomization.cpp/h

**Properties** (7):
  - `diaphragm_blade_count`: `int` — [Read-Write] Number of blades of diaphragm. (int32)
  - `max_f_stop`: `float` — [Read-Write] Maximum aperture for this lens (e.g. 2.8 for an f/2.8 lens) (float)
  - `max_focal_length`: `float` — [Read-Write] Maximum focal length for this lens (float)
  - `min_f_stop`: `float` — [Read-Write] Minimum aperture for this lens (e.g. 2.8 for an f/2.8 lens) (float)
  - `min_focal_length`: `float` — [Read-Write] Minimum focal length for this lens (float)
  - `minimum_focus_distance`: `float` — [Read-Write] Shortest distance this lens can focus on. (float)
  - `squeeze_factor`: `float` — [Read-Write] Squeeze factor for anamorphic lenses. (float)

### `unreal.CameraLookatTrackingSettings`
Inherits: `StructBase` | Header: `CineCameraActor.h`

Settings to control the cameraâs lookat feature

**Properties** (6):
  - `actor_to_track`: `Actor` — [Read-Write] If set, camera will track this actorâs location (Actor)
  - `allow_roll`: `bool` — [Read-Write] True to allow user-defined roll, false otherwise. (bool)
  - `draw_debug_look_at_tracking_position`: `bool` — [Read-Write] True to draw a debug representation of the lookat location (bool)
  - `enable_look_at_tracking`: `bool` — [Read-Write] True to enable lookat tracking, false otherwise. (bool)
  - `look_at_tracking_interp_speed`: `float` — [Read-Write] Controls degree of smoothing. 0.f for no smoothing, higher numbers for faster/tighter t...
  - `relative_offset`: `Vector` — [Read-Write] Offset from actor position to look at. Relative to actor if tracking an actor, relative...

### `unreal.CameraTrackingFocusSettings`
Inherits: `StructBase` | Header: `CineCameraSettings.h`

Settings to control tracking-focus mode.

**Properties** (3):
  - `actor_to_track`: `Actor` — [Read-Write] Focus distance will be tied to this actorâs location. (Actor)
  - `draw_debug_tracking_focus_point`: `bool` — [Read-Write] True to draw a debug representation of the tracked position. (bool)
  - `relative_offset`: `Vector` — [Read-Write] Offset from actor position to track. Relative to actor if tracking an actor, relative t...

### `unreal.NamedFilmbackPreset`
Inherits: `StructBase` | Header: `CineCameraSettings.h`

A named bundle of filmback settings used to implement filmback presets

**Properties** (3):
  - `display_name`: `Text` — [Read-Write] Display name for the preset. (Text)
  - `filmback_settings`: `CameraFilmbackSettings` — [Read-Write] (CameraFilmbackSettings)
  - `name`: `str` — [Read-Write] Name for the preset. (str)

### `unreal.NamedLensPreset`
Inherits: `StructBase` | Header: `CineCameraSettings.h`

A named bundle of lens settings used to implement lens presets.

**Properties** (2):
  - `lens_settings`: `CameraLensSettings` — [Read-Write] (CameraLensSettings)
  - `name`: `str` — [Read-Write] Name for the preset. (str)

### `unreal.NamedPlateCropPreset`
Inherits: `StructBase` | Header: `CineCameraSettings.h`

A named bundle of crop settings used to implement crop presets.

**Properties** (2):
  - `crop_settings`: `PlateCropSettings` — [Read-Write] (PlateCropSettings)
  - `name`: `str` — [Read-Write] Name for the preset. (str)

### `unreal.PlateCropSettings`
Inherits: `StructBase` | Header: `CineCameraSettings.h`

#note, this struct has a details customization in CameraCropSettingsCustomization.cpp/h

**Properties** (1):
  - `aspect_ratio`: `float` — [Read-Write] (float)

### `unreal.CameraRig_Crane`
Inherits: `Actor` | Header: `CameraRig_Crane.h`

A simple rig for simulating crane-like camera movements.

**Properties** (5):
  - `crane_arm_length`: `float` — [Read-Write] Controls the length of the crane arm. (float)
  - `crane_pitch`: `float` — [Read-Write] Controls the pitch of the crane arm. (float)
  - `crane_yaw`: `float` — [Read-Write] Controls the yaw of the crane arm. (float)
  - `lock_mount_pitch`: `bool` — [Read-Write] Lock the mount pitch so that an attached camera is locked and pitched in the direction ...
  - `lock_mount_yaw`: `bool` — [Read-Write] Lock the mount yaw so that an attached camera is locked and oriented in the direction o...

### `unreal.CameraRig_Rail`
Inherits: `Actor` | Header: `CameraRig_Rail.h`

Camera Rig Rail

**Methods** (1):
  - `get_rail_spline_component()` -> `SplineComponent` — Returns the spline component that defines the rail path

**Properties** (2):
  - `current_position_on_rail`: `float` — [Read-Write] Defines current position of the mount point along the rail, in terms of normalized dist...
  - `lock_orientation_to_rail`: `bool` — [Read-Write] Determines whether the orientation of the mount should be in the direction of the rail....

### `unreal.CineCameraActor`
Inherits: `CameraActor` | Header: `CineCameraActor.h`

A CineCameraActor is a CameraActor specialized to work like a cinematic camera.

**Methods** (1):
  - `get_cine_camera_component()` -> `CineCameraComponent` — Returns the CineCameraComponent of this CineCamera

**Properties** (1):
  - `lookat_tracking_settings`: `CameraLookatTrackingSettings` — [Read-Write] (CameraLookatTrackingSettings)

### `unreal.CineCameraComponent`
Inherits: `CameraComponent` | Header: `CineCameraComponent.h`

A specialized version of a camera component, geared toward cinematic usage.

**Methods** (13):
  - `get_crop_preset_name()` -> `str` — Returns the lens name of the camera with the current settings.
  - `get_default_filmback_preset_name()` -> `str` — Get Default Filmback Preset Name
  - `get_filmback_preset_name()` -> `str` — Returns the filmback name of the camera with the current settings.
  - `get_filmback_presets_copy()` -> `Array [ NamedFilmbackPreset ]` [classmethod] — Get Filmback Presets Copy
  - `get_horizontal_field_of_view()` -> `float` — Returns the horizonal FOV of the camera with current settings.
  - `get_horizontal_projection_offset()` -> `float` — Get Horizontal Projection Offset
  - `get_lens_preset_name()` -> `str` — Returns the lens name of the camera with the current settings.
  - `get_lens_presets_copy()` -> `Array [ NamedLensPreset ]` [classmethod] — Get Lens Presets Copy
  - `get_vertical_field_of_view()` -> `float` — Returns the vertical FOV of the camera with current settings.
  - `get_vertical_projection_offset()` -> `float` — Get Vertical Projection Offset
  - `set_crop_preset_by_name(preset_name)` -> `None` — Set the current lens settings by preset name.
  - `set_filmback_preset_by_name(preset_name)` -> `None` — Set the current preset settings by preset name.
  - `set_lens_preset_by_name(preset_name)` -> `None` — Set the current lens settings by preset name.

**Properties** (9):
  - `crop_settings`: `PlateCropSettings` — [Read-Write] Controls the crop settings. (PlateCropSettings)
  - `current_aperture`: `float` — [Read-Write] Current aperture, in terms of f-stop (e.g. 2.8 for f/2.8) (float)
  - `current_focal_length`: `float` — [Read-Write] Current focal length of the camera (i.e. controls FoV, zoom) (float)
  - `current_focus_distance`: `float` [Read-Only] — [Read-Only] Read-only. Control this value via FocusSettings. (float)
  - `custom_near_clipping_plane`: `float` — [Read-Write] Set bOverride_CustomNearClippingPlane to true if you want to use a custom clipping plan...
  - `filmback`: `CameraFilmbackSettings` — [Read-Write] Controls the filmback of the camera. (CameraFilmbackSettings)
  - `focus_settings`: `CameraFocusSettings` — [Read-Write] Controls the cameraâs focus. (CameraFocusSettings)
  - `lens_settings`: `CameraLensSettings` — [Read-Write] Controls the cameraâs lens. (CameraLensSettings)
  - `override_custom_near_clipping_plane`: `bool` — [Read-Write] (bool)

### `unreal.CineCameraSettings`
Inherits: `DeveloperSettings` | Header: `CineCameraSettings.h`

Cine Camera Settings

**Methods** (4):
  - `get_cine_camera_settings()` -> `CineCameraSettings` [classmethod] — Get Cine Camera Settings
  - `get_crop_preset_by_name(preset_name)` -> `PlateCropSettings or None` — Gets the Crop settings associated with a given preset name Returns true if a preset with the given name was found
  - `get_filmback_preset_by_name(preset_name)` -> `CameraFilmbackSettings or None` — Gets the Filmback settings associated with a given preset name Returns true if a preset with the given name was found
  - `get_lens_preset_by_name(preset_name)` -> `CameraLensSettings or None` — Gets the Lens settings associated with a given preset name Returns true if a preset with the given name was found

**Properties** (8):
  - `crop_presets`: `None` — [Read-Write] List of available crop presets (Array[NamedPlateCropPreset])
  - `default_crop_preset_name`: `str` — [Read-Write] Name of the default crop preset (str)
  - `default_filmback_preset`: `str` — [Read-Write] Name of the default filmback preset (str)
  - `default_lens_f_stop`: `float` — [Read-Write] Default aperture (will be constrained by default lens) (float)
  - `default_lens_focal_length`: `float` — [Read-Write] Default focal length (will be constrained by default lens) (float)
  - `default_lens_preset_name`: `str` — [Read-Write] Name of the default lens preset (str)
  - `filmback_presets`: `None` — [Read-Write] List of available filmback presets (Array[NamedFilmbackPreset])
  - `lens_presets`: `None` — [Read-Write] List of available lens presets (Array[NamedLensPreset])

### `unreal.CameraFocusMethod`
Inherits: `EnumBase` | Header: `CineCameraSettings.h`

Supported methods for focusing the camera.

**Properties** (4):
  - `DISABLE`: `CameraFocusMethod = Ellipsis` — Disable depth of field entirely. 3
  - `DO_NOT_OVERRIDE`: `CameraFocusMethod = Ellipsis` — Donât override, ie. allow post process volume settings to persist. 0
  - `MANUAL`: `CameraFocusMethod = Ellipsis` — Allows for specifying or animating exact focus distances. 1
  - `TRACKING`: `CameraFocusMethod = Ellipsis` — Locks focus to specific object. 2
