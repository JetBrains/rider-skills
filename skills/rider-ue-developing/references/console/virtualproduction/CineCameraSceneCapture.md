# UE Python API — CineCameraSceneCapture Module

**1 types** from the `CineCameraSceneCapture` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CineCaptureComponent2D`

---

## Classes

### `unreal.CineCaptureComponent2D`
Inherits: `SceneCaptureComponent2D` | Header: `CineCameraSceneCaptureComponent.h`

Cine Capture Component extends Scene Capture to allow users to render Cine Camera Component into a render target. Cine Capture has a few modifiable properties, but most of the properties are controlle...

**Properties** (5):
  - `follow_scene_capture_render_path`: `bool` — [Read-Write] Affects rendering path cine capture takes. Scene Capture takes a slightly different ren...
  - `ocio_configuration`: `OpenColorIODisplayConfiguration` — [Read-Write] Open Color IO Configuration. Used to apply color transforms. (OpenColorIODisplayConfigu...
  - `override_user_flags`: `bool` — [Read-Write] Override state for per-view user flags accessible in materials via TestPostVolumeUserFl...
  - `render_target_highest_dimension`: `int` — [Read-Write] Highest possible dimension of specified render target in either X or Y (depends on cine...
  - `user_flags`: `int` — [Read-Write] Per-view user flags accessible in materials via TestPostVolumeUserFlag node, allowing p...
