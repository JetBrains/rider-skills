# UE Python API — LensDistortion Module

**2 types** from the `LensDistortion` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LensDistortionCameraModel`, `LensDistortionLibrary`

---

## Classes

### `unreal.LensDistortionCameraModel`
Inherits: `StructBase` | Header: `LensDistortionAPI.h`

Lens Distortion Camera Model

**Properties** (7):
  - `c`: `Vector2D` — [Read-Write] Camera matrixâs Cx and Cy. (Vector2D)
  - `f`: `Vector2D` — [Read-Write] Camera matrixâs Fx and Fy. (Vector2D)
  - `k1`: `float` — [Read-Write] Radial parameter #1. (float)
  - `k2`: `float` — [Read-Write] Radial parameter #2. (float)
  - `k3`: `float` — [Read-Write] Radial parameter #3. (float)
  - `p1`: `float` — [Read-Write] Tangential parameter #1. (float)
  - `p2`: `float` — [Read-Write] Tangential parameter #2. (float)

### `unreal.LensDistortionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LensDistortionBlueprintLibrary.h`

Lens Distortion Blueprint Library

**Methods** (4):
  - `draw_uv_displacement_to_render_target(world_context_object, camera_model, distorted_horizontal_fov, distorted_aspect_ratio, undistort_overscan_factor, output_render_target, output_multiply = 0.500000, output_add = 0.500000)` -> `None` [classmethod] — Draws UV displacement map within the output render target. - Red & green channels hold the distortion displacement; - Bl...
  - `equal_equal_compare_lens_distortion_models(a, b)` -> `bool` [classmethod] — Returns true if A is equal to B (A == B) deprecated: The LensDistortion plugin is deprecated. Please update your project...
  - `get_undistort_overscan_factor(camera_model, distorted_horizontal_fov, distorted_aspect_ratio)` -> `float` [classmethod] — Returns the overscan factor required for the undistort rendering to avoid unrendered distorted pixels. deprecated: The L...
  - `not_equal_compare_lens_distortion_models(a, b)` -> `bool` [classmethod] — Returns true if A is not equal to B (A != B) deprecated: The LensDistortion plugin is deprecated. Please update your pro...
