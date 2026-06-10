# UE Python API — MediaFrameworkUtilitiesEditor Module

**6 types** from the `MediaFrameworkUtilitiesEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MediaBundleFactoryNew`, `MediaFrameworkCapturePanel`, `MediaFrameworkCapturePanelLibrary`, `MediaProfileFactoryNew`, `ProxyMediaOutputFactoryNew`, `ProxyMediaSourceFactoryNew`

---

## Classes

### `unreal.MediaBundleFactoryNew`
Inherits: `Factory` | Header: `MediaBundleFactoryNew.h`

Implements a factory for UMediaPlayer objects.

### `unreal.MediaFrameworkCapturePanel`
Inherits: `Object` | Header: `MediaFrameworkCapturePanelBlueprintLibrary.h`

Media Framework Capture Panel

**Methods** (7):
  - `add_render_target_capture(media_output, render_target, capture_options)` -> `None` — Add a render target 2d to be captured.
  - `add_viewport_capture(media_output, camera, capture_options, view_mode = ViewModeIndex.VMI_UNKNOWN)` -> `None` — Add a camera to be used when capturing the current viewport.
  - `empty_render_target_capture()` -> `None` — Clear all the render target captures.
  - `empty_viewport_capture()` -> `None` — Clear all the viewport captures.
  - `set_current_viewport_capture(media_output, capture_options, view_mode = ViewModeIndex.VMI_UNKNOWN)` -> `None` — Change the setting for capturing the current viewport.
  - `start_capture()` -> `None` — Capture the cameraâs viewport and the render target.
  - `stop_capture()` -> `None` — Stop the current capture.

### `unreal.MediaFrameworkCapturePanelLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MediaFrameworkCapturePanelBlueprintLibrary.h`

Media Framework Capture Panel Blueprint Library

**Methods** (1):
  - `get_media_capture_panel()` -> `MediaFrameworkCapturePanel` [classmethod] — Get Media Capture panel instance.

### `unreal.MediaProfileFactoryNew`
Inherits: `Factory` | Header: `MediaProfileFactoryNew.h`

Implements a factory for UMediaProfileFactoryNew objects.

### `unreal.ProxyMediaOutputFactoryNew`
Inherits: `Factory` | Header: `ProxyMediaOutputFactoryNew.h`

Implements a factory for UProxyMediaOutput objects.

### `unreal.ProxyMediaSourceFactoryNew`
Inherits: `Factory` | Header: `ProxyMediaSourceFactoryNew.h`

Implements a factory for UProxyMediaSource objects.
