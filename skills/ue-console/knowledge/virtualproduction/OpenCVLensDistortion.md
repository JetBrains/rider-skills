# UE Python API — OpenCVLensDistortion Module

**3 types** from the `OpenCVLensDistortion` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `OpenCVCameraViewInfo`, `OpenCVLensDistortionParameters`, `OpenCVLensDistortionLibrary`

---

## Classes

### `unreal.OpenCVCameraViewInfo`
Inherits: `StructBase` | Header: `OpenCVLensDistortionParameters.h`

Open CVCamera View Info

**Properties** (3):
  - `focal_length_ratio`: `float` — [Read-Write] Focal length aspect ratio -> Fy / Fx (float)
  - `horizontal_fov`: `float` — [Read-Write] Horizontal Field Of View in degrees (float)
  - `vertical_fov`: `float` — [Read-Write] Vertical Field Of View in degrees (float)

### `unreal.OpenCVLensDistortionParameters`
Inherits: `OpenCVLensDistortionParametersBase` | Header: `OpenCVLensDistortionParameters.h`

Mathematic camera model for lens distortion/undistortion. Camera matrix =

**Methods** (2):
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:

### `unreal.OpenCVLensDistortionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `OpenCVLensDistortionBlueprintLibrary.h`

Open CVLens Distortion Blueprint Library

**Methods** (4):
  - `create_undistort_uv_displacement_map(lens_parameters, image_size, camera_view_info=OpenCVCameraViewInfo)` [classmethod] — Creates a texture containing a DisplacementMap in the Red and the Green channel for undistorting a camera image. This ca...
  - `draw_displacement_map_to_render_target(world_context_object, output_render_target, pre_computed_undistort_displacement_map)` -> `None` [classmethod] — Draws UV displacement map within the output render target. - Red & green channels hold the distort to undistort displace...
  - `equal_equal_compare_lens_distortion_models(a, b)` -> `bool` [classmethod] — Returns true if A is equal to B (A == B)
  - `not_equal_compare_lens_distortion_models(a, b)` -> `bool` [classmethod] — Returns true if A is not equal to B (A != B)
