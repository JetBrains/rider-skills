# UE Python API — OpenCVLensCalibration Module

**1 types** from the `OpenCVLensCalibration` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `OpenCVLensCalibrator`

---

## Classes

### `unreal.OpenCVLensCalibrator`
Inherits: `Object` | Header: `OpenCVLensCalibrator.h`

Open CVLens Calibrator

**Methods** (4):
  - `calculate_lens_parameters()` -> `(lens_distortion_parameters=OpenCVLensDistortionParameters, margin_of_error=float, camera_view_info=OpenCVCameraViewInfo) or None`
  - `create_calibrator(board_width = 7, board_height = 5, square_size = 3.000000, use_fisheye_model = False)` -> `OpenCVLensCalibrator` [classmethod]
  - `feed_image(file_path)` -> `bool` — Feeds an image to the calibration. It must contain a checkerboard somewhere in the image. The images fed in should come ...
  - `feed_render_target(texture_render_target)` -> `bool` — Feeds a render target to the calibration. It must contain a checkerboard somewhere in the image. The images fed in shoul...

**Properties** (2):
  - `maximum_corner_coordinates`: `Vector2D` [Read-Only] — [Read-Only] Biggest coordinates of a grid corner that was found. For best result, try to cover full ...
  - `minimum_corner_coordinates`: `Vector2D` [Read-Only] — [Read-Only] Smallest coordinates of a grid corner that was found. For best result, try to cover full...
