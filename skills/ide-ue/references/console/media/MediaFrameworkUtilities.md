# UE Python API — MediaFrameworkUtilities Module

**6 types** from the `MediaFrameworkUtilities` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MediaBundle`, `MediaBundleActorBase`, `MediaProfile`, `MediaProfileLibrary`, `ProxyMediaOutput`, `ProxyMediaSource`

---

## Classes

### `unreal.MediaBundle`
Inherits: `Object` | Header: `MediaBundle.h`

A bundle of the Media Asset necessary to play a video & audio

**Methods** (6):
  - `get_lens_displacement_texture()` -> `TextureRenderTarget2D` — Get the lens displacement Render Target.
  - `get_material()` -> `MaterialInterface` — Get the material interface.
  - `get_media_player()` -> `MediaPlayer` — Get the media player.
  - `get_media_source()` -> `MediaSource` — Get the media source.
  - `get_media_texture()` -> `MediaTexture` — Get the media texture.
  - `get_undistorted_camera_view_info()` -> `OpenCVCameraViewInfo` — Get the undistorted space camera view information.

### `unreal.MediaBundleActorBase`
Inherits: `Actor` | Header: `MediaBundleActorBase.h`

A base actor that

**Methods** (4):
  - `get_media_bundle()` -> `MediaBundle` — Get the Media Bundle.
  - `request_close_media_source()` -> `None` — Close the Media Source.
  - `request_open_media_source()` -> `bool` — Play the Media Source.
  - `set_component(primitive, media_sound)` -> `None` — Assign the primitive to render on. Will change the material for the Media material.

### `unreal.MediaProfile`
Inherits: `Object` | Header: `MediaProfile.h`

A media profile that configures the inputs, outputs, timecode provider and custom time step.

### `unreal.MediaProfileLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MediaProfileBlueprintLibrary.h`

Media Profile Blueprint Library

**Methods** (4):
  - `get_all_media_output_proxy()` -> `Array [ ProxyMediaOutput ]` [classmethod] — Get All Media Output Proxy
  - `get_all_media_source_proxy()` -> `Array [ ProxyMediaSource ]` [classmethod] — Get All Media Source Proxy
  - `get_media_profile()` -> `MediaProfile` [classmethod] — Get Media Profile
  - `set_media_profile(media_profile)` -> `None` [classmethod] — Set Media Profile

### `unreal.ProxyMediaOutput`
Inherits: `MediaOutput` | Header: `ProxyMediaOutput.h`

A media output that redirect to another media output.

**Methods** (1):
  - `is_proxy_valid()` -> `bool` — Is the media proxy has a valid proxy.

### `unreal.ProxyMediaSource`
Inherits: `MediaSource` | Header: `ProxyMediaSource.h`

A media source that reditect to another media source.

**Methods** (1):
  - `is_proxy_valid()` -> `bool` — Is the media proxy has a valid proxy.
