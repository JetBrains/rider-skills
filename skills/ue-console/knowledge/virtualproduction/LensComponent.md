# UE Python API — LensComponent Module

**5 types** from the `LensComponent` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LensComponent`, `DistortionRenderingMode`, `DistortionSource`, `FilmbackOverrideSource`, `FIZEvaluationMode`

---

## Classes

### `unreal.LensComponent`
Inherits: `ActorComponent` | Header: `LensComponent.h`

Component for applying a post-process lens distortion effect to a CineCameraComponent on the same actor

**Methods** (30):
  - `apply_nodal_offset(component_to_offset, use_manual_inputs = False, manual_focus_input = 0.000000, manual_zoom_input = 0.000000)` -> `None` — Manually apply nodal offset to the specified component. If bUseManualInputs is true, the input Focus and Zoom values wil...
  - `clear_distortion_state()` -> `None` — Reset the distortion state to defaults to represent âno distortionâ
  - `get_cropped_filmback()` -> `CameraFilmbackSettings` — Get the cropped filmback (only relevant if the filmback override setting is set to use the CroppedFilmback
  - `get_distortion_source()` -> `DistortionSource` — Get the distortion source setting
  - `get_distortion_state()` -> `LensDistortionState` — Get the current distortion state
  - `get_filmback_override_setting()` -> `FilmbackOverrideSource` — Get the filmback override setting
  - `get_fiz_evaluation_mode()` -> `FIZEvaluationMode` — Get the evaluation mode used to evaluate the LensFile
  - `get_lens_distortion_handler()` -> `LensDistortionModelHandlerBase` — Returns the LensDistortionHandler in use for the current LensModel
  - `get_lens_file()` -> `LensFile` — Get the LensFile used by this component
  - `get_lens_file_evaluation_inputs()` -> `LensFileEvaluationInputs` — Get the data used by this component to evaluate the LensFile
  - `get_lens_file_picker()` -> `LensFilePicker` — Get the LensFile picker used by this component
  - `get_lens_model()` — Get the current lens model
  - `get_original_focal_length()` -> `float` — Get the original (not adjusted for overscan) focal length of the camera
  - `get_overscan_multiplier()` -> `float` — Get the evaluation mode used to evaluate the LensFile
  - `set_apply_distortion(apply)` -> `None` — Set whether distortion should be applied to the target camera
  - `set_apply_nodal_offset_on_tick(apply_nodal_offset)` -> `None` — Set whether nodal offset should be automatically applied during this componentâs tick
  - `set_cropped_filmback(filmback)` -> `None` — Set the cropped filmback (only relevant if the filmback override setting is set to use the CroppedFilmback
  - `set_distortion_source(source)` -> `None` — Set the distortion source setting
  - `set_distortion_state(state)` -> `None` — Set the current distortion state
  - `set_filmback_override_setting(setting)` -> `None` — Set the filmback override setting
  - `set_fiz_evaluation_mode(mode)` -> `None` — Set the evaluation mode used to evaluate the LensFile
  - `set_lens_file(lens_file)` -> `None` — Set the LensFile used by this component
  - `set_lens_file_evaluation_inputs(focus, zoom)` -> `None` — Set the data used by this component to evaluate the LensFile
  - `set_lens_file_picker(lens_file)` -> `None` — Set the LensFile picker used by this component
  - `set_lens_model(model)` -> `None` — Set the current lens model
  - `set_overscan_multiplier(multiplier)` -> `None` — Set the LensFile used by this component
  - `should_apply_distortion()` -> `bool` — Whether distortion should be applied to the target camera
  - `should_apply_nodal_offset_on_tick()` -> `bool` — Returns true if nodal offset will be automatically applied during this componentâs tick, false otherwise
  - `was_distortion_evaluated()` -> `bool` — Returns true if distortion was evaluated this tick
  - `was_nodal_offset_applied_this_tick()` -> `bool` — Returns true if nodal offset was applied during the current tick, false otherwise

**Properties** (9):
  - `apply_distortion`: `bool` — [Read-Write] Whether or not to apply distortion to the target camera component (bool)
  - `distortion_source`: `DistortionHandlerPicker` — [Read-Write]
deprecated: This property has been deprecated. Use GetDistortionSource() and SetDistort...
  - `distortion_state`: `LensDistortionState` — [Read-Write] The current distortion state (LensDistortionState)
  - `original_tracked_component_location`: `Vector` — [Read-Write] * Location and Rotation of the TrackedComponent prior to nodal offset being applied
* N...
  - `original_tracked_component_rotation`: `Vector` — [Read-Write] (Vector)
  - `original_tracked_component_transform`: `Transform` [Read-Only] — [Read-Only] Serialized transform of the TrackedComponent prior to nodal offset being applied (Transf...
  - `override_camera_overscan`: `bool` — [Read-Write] If checked, the cameraâs overscan value will be driven by the lens component to autom...
  - `overscan_multiplier`: `float` — [Read-Write] The percentage of the computed overscan that should be applied to the target camera (fl...
  - `scale_overscan`: `bool` — [Read-Write] Whether to scale the computed overscan by the overscan percentage (bool)

### `unreal.DistortionRenderingMode`
Inherits: `EnumBase` | Header: `LensComponent.h`

Specifies how the distortion should be rendered in the post-processing pipeline

**Properties** (2):
  - `POST_PROCESS_MATERIAL`: `DistortionRenderingMode = Ellipsis` — Use the plugin post process material 0
  - `SCENE_VIEW_EXTENSION`: `DistortionRenderingMode = Ellipsis` — Use the experimental lens distortion scene view extension. Further control of where distortion is re...

### `unreal.DistortionSource`
Inherits: `EnumBase` | Header: `LensComponent.h`

Specifies from where the distortion state information comes

**Properties** (3):
  - `LENS_FILE`: `DistortionSource = Ellipsis` — Distortion state is evaluated using the LensFile 0
  - `LIVE_LINK_LENS_SUBJECT`: `DistortionSource = Ellipsis` — Distortion state is inputted directly from a LiveLink subject 1
  - `MANUAL`: `DistortionSource = Ellipsis` — Distortion state is set manually by the user using the Distortion State setting below 2

### `unreal.FilmbackOverrideSource`
Inherits: `EnumBase` | Header: `LensComponent.h`

Controls whether this component can override the cameraâs filmback, and if so, which override to use

**Properties** (3):
  - `CROPPED_FILMBACK_SETTING`: `FilmbackOverrideSource = Ellipsis` — Override the cameraâs filmback using the CroppedFilmback setting below 1
  - `DO_NOT_OVERRIDE`: `FilmbackOverrideSource = Ellipsis` — Do not override the cameraâs filmback 2
  - `LENS_FILE`: `FilmbackOverrideSource = Ellipsis` — Override the cameraâs filmback using the sensor dimensions recorded in the LensInfo of the LensFil...

### `unreal.FIZEvaluationMode`
Inherits: `EnumBase` | Header: `LensComponent.h`

Mode that controls where FIZ inputs are sourced from and how they are used to evaluate the LensFile

**Properties** (5):
  - `DO_NOT_EVALUATE`: `FIZEvaluationMode = Ellipsis` — Do not evaluate the Lens File 4
  - `MANUAL`: `FIZEvaluationMode = Ellipsis` — Evaluate the Lens File using values set directly in the details panel or via BP/scripting 3
  - `USE_CAMERA_SETTINGS`: `FIZEvaluationMode = Ellipsis` — Evaluate the Lens File using the current FIZ settings of the target camera 1
  - `USE_LIVE_LINK`: `FIZEvaluationMode = Ellipsis` — Evaluate the Lens File with the latest FIZ data received from LiveLink 0
  - `USE_RECORDED_VALUES`: `FIZEvaluationMode = Ellipsis` — Evaluate the Lens File using values recorded in a level sequence (set automatically when the sequenc...
