# UE Python API — MediaIOCore Module

**30 types** from the `MediaIOCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MediaCaptureOptions`, `MediaIOConfiguration`, `MediaIOConnection`, `MediaIODevice`, `MediaIOMode`, `MediaIOOutputConfiguration`, `MediaIOVideoTimecodeConfiguration`, `CaptureCardMediaSource`, `FileMediaCapture`, `FileMediaOutput`, `MediaCapture`, `MediaOutput`, `VideoDeinterlacer`, `FileMediaOutputPixelFormat`, `MediaCaptureCroppingType`, `MediaCaptureOverrunAction`, `MediaCapturePhase`, `MediaCaptureResizeMethod`, `MediaCaptureState`, `MediaIOAutoDetectableTimecodeFormat`, ... (30 total)

---

## Classes

### `unreal.MediaCaptureOptions`
Inherits: `StructBase` | Header: `MediaCapture.h`

Base class of additional data that can be stored for each requested capture.

**Properties** (14):
  - `apply_linear_to_srgb_conversion`: `bool` — [Read-Write] Whether to apply a linear to sRGB conversion to the texture before outputting. (bool)
  - `auto_restart_on_source_size_change`: `bool` — [Read-Write] If source textureâs size change, auto restart capture to follow source resolution if ...
  - `autostop_on_capture`: `bool` — [Read-Write] Automatically stop capturing after a predetermined number of images. (bool)
  - `capture_phase`: `MediaCapturePhase` — [Read-Write] (MediaCapturePhase)
  - `color_conversion_settings`: `OpenColorIOColorConversionSettings` — [Read-Write] Color conversion settings used by the OCIO conversion pass. (OpenColorIOColorConversion...
  - `convert_to_desired_pixel_format`: `bool` — [Read-Write] Allows to enable/disable pixel format conversion for the cases where render target is n...
  - `crop`: `MediaCaptureCroppingType` — [Read-Write] Crop the captured SceneViewport or TextureRenderTarget2D to the desired size. (MediaCap...
  - `custom_capture_point`: `IntPoint` — [Read-Write] Crop the captured SceneViewport or TextureRenderTarget2D to the desired size.
note: Onl...
  - `force_alpha_to_one_on_conversion`: `bool` — [Read-Write] In some cases when we want to stream irregular render targets containing limited number...
  - `number_of_frames_to_capture`: `int` — [Read-Write] The number of images to capture (int32)
  - `overrun_action`: `MediaCaptureOverrunAction` — [Read-Write] Action to do when game thread overruns render thread and all frames are in flights bein...
  - `resize_method`: `MediaCaptureResizeMethod` — [Read-Write] When the capture start, control if and how the source buffer should be resized to the d...
  - `resize_source_buffer`: `bool` — [Read-Write]
deprecated: bResizeSourceBuffer, please use ResizeMethod instead. (bool)
  - `skip_frame_when_running_expensive_tasks`: `bool` — [Read-Write] When the application enters responsive mode, skip the frame capture.
The application ca...

### `unreal.MediaIOConfiguration`
Inherits: `StructBase` | Header: `MediaIOCoreDefinitions.h`

Configuration of a device input / output.

### `unreal.MediaIOConnection`
Inherits: `StructBase` | Header: `MediaIOCoreDefinitions.h`

Identifies an media connection.

### `unreal.MediaIODevice`
Inherits: `StructBase` | Header: `MediaIOCoreDefinitions.h`

Identifies a device.

### `unreal.MediaIOMode`
Inherits: `StructBase` | Header: `MediaIOCoreDefinitions.h`

Identifies a media mode.

### `unreal.MediaIOOutputConfiguration`
Inherits: `StructBase` | Header: `MediaIOCoreDefinitions.h`

Configuration of a device output.

### `unreal.MediaIOVideoTimecodeConfiguration`
Inherits: `StructBase` | Header: `MediaIOCoreDefinitions.h`

Configuration of a Timecode from Video

### `unreal.CaptureCardMediaSource`
Inherits: `TimeSynchronizableMediaSource` | Header: `CaptureCardMediaSource.h`

Base class for media sources that are coming from a capture card.

**Properties** (5):
  - `color_conversion_settings`: `OpenColorIOColorConversionSettings` — [Read-Write] OCIO Settings used for applying a color conversion to the incoming source. (OpenColorIO...
  - `deinterlacer`: `VideoDeinterlacer` [Read-Only] — [Read-Only] How interlaced video should be treated. (VideoDeinterlacer)
  - `interlace_field_order`: `MediaIOInterlaceFieldOrder` [Read-Only] — [Read-Only] The order in which interlace fields should be copied. (MediaIOInterlaceFieldOrder)
  - `override_source_color_space`: `TextureColorSpace` [Read-Only] — [Read-Only] Color space of the source texture. (TextureColorSpace)
  - `override_source_encoding`: `MediaIOCoreSourceEncoding` [Read-Only] — [Read-Only] Encoding of the source texture. (MediaIOCoreSourceEncoding)

### `unreal.FileMediaCapture`
Inherits: `MediaCapture` | Header: `FileMediaCapture.h`

File Media Capture

### `unreal.FileMediaOutput`
Inherits: `MediaOutput` | Header: `FileMediaOutput.h`

Output information for a file media capture. note: âFrame Buffer Pixel Formatâ must be set to at least 8 bits of alpha to enabled the Key. note: âEnable alpha channel support in post-processingâ...

**Properties** (8):
  - `base_file_name`: `str` — [Read-Write] The base file name of the images. The frame number will be append to the base file name...
  - `desired_pixel_format`: `FileMediaOutputPixelFormat` — [Read-Write] Use the default back buffer pixel format or specify a specific the pixel format to capt...
  - `desired_size`: `IntPoint` — [Read-Write] Use the default back buffer size or specify a specific size to capture. (IntPoint)
  - `file_path`: `DirectoryPath` — [Read-Write] The file path for the images. (DirectoryPath)
  - `invert_alpha`: `bool` — [Read-Write] Invert the alpha for formats that support alpha. (bool)
  - `override_desired_size`: `bool` — [Read-Write] Use the default back buffer size or specify a specific size to capture. (bool)
  - `override_pixel_format`: `bool` — [Read-Write] Use the default back buffer pixel format or specify a specific the pixel format to capt...
  - `write_options`: `ImageWriteOptions` — [Read-Write] Options on how to save the images. (ImageWriteOptions)

### `unreal.MediaCapture`
Inherits: `Object` | Header: `MediaCapture.h`

Abstract base class for media capture.

**Methods** (8):
  - `capture_active_scene_viewport(capture_options)` -> `bool` — Stop the current capture if there is one. Then find and capture every frame from active SceneViewport. It can only find ...
  - `capture_texture_render_target2d(render_target, capture_options)` -> `bool` — Stop the actual capture if there is one. Then capture every frame for a TextureRenderTarget2D. The TextureRenderTarget2D...
  - `get_desired_pixel_format()` -> `PixelFormat` — Get the desired pixel format of the current capture.
  - `get_desired_size()` -> `IntPoint` — Get the desired size of the current capture.
  - `get_state()` -> `MediaCaptureState` — Get the current state of the capture.
  - `set_media_output(media_output)` -> `None` — Set the media output. Can only be set when the capture is stopped.
  - `stop_capture(allow_pending_frame_to_be_process)` -> `None` — Stop the previous requested capture.
  - `update_texture_render_target2d(render_target)` -> `bool` — Update the current capture with every frame for a TextureRenderTarget2D. The TextureRenderTarget2D needs to be of the sa...

**Properties** (1):
  - `on_state_changed`: `MediaCaptureStateChangedSignature` — [Read-Write] Called when the state of the capture changed. (MediaCaptureStateChangedSignature)

### `unreal.MediaOutput`
Inherits: `Object` | Header: `MediaOutput.h`

Abstract base class for media output.

**Methods** (2):
  - `create_media_capture()` -> `MediaCapture` — Creates the specific implementation of the MediaCapture for the MediaOutput.
  - `validate()` -> `str or None` — Validate the media output settings (must be implemented in child classes).

### `unreal.VideoDeinterlacer`
Inherits: `Object` | Header: `MediaIOCoreDeinterlacer.h`

Represents a deinterlacing algorithm. Will dictate how the incoming video signal is converted from interlace to a progressive signal.

### `unreal.FileMediaOutputPixelFormat`
Inherits: `EnumBase` | Header: `FileMediaOutput.h`

Texture format supported by UFileMediaOutput.

**Properties** (2):
  - `B8G8R8A8`: `FileMediaOutputPixelFormat = Ellipsis` — 0
  - `FLOAT_RGBA`: `FileMediaOutputPixelFormat = Ellipsis` — 1

### `unreal.MediaCaptureCroppingType`
Inherits: `EnumBase` | Header: `MediaCapture.h`

Type of cropping

**Properties** (4):
  - `CENTER`: `MediaCaptureCroppingType = Ellipsis` — Keep the center of the captured image. 1
  - `CUSTOM`: `MediaCaptureCroppingType = Ellipsis` — Use the StartCapturePoint and the size of the MediaOutput to keep of the captured image. 3
  - `NONE`: `MediaCaptureCroppingType = Ellipsis` — Do not crop the captured image. 0
  - `TOP_LEFT`: `MediaCaptureCroppingType = Ellipsis` — Keep the top left corner of the captured image. 2

### `unreal.MediaCaptureOverrunAction`
Inherits: `EnumBase` | Header: `MediaCapture.h`

Action when overrun occurs

**Properties** (2):
  - `FLUSH`: `MediaCaptureOverrunAction = Ellipsis` — Flush rendering thread such that all scheduled commands are executed. 0
  - `SKIP`: `MediaCaptureOverrunAction = Ellipsis` — Skip capturing a frame if readback is trailing too much. 1

### `unreal.MediaCapturePhase`
Inherits: `EnumBase` | Header: `MediaCapture.h`

EMedia Capture Phase

**Properties** (6):
  - `AFTER_FXAA`: `MediaCapturePhase = Ellipsis` — 3
  - `AFTER_MOTION_BLUR`: `MediaCapturePhase = Ellipsis` — Will happen after TSR in order to get a texture of the right size. 1
  - `AFTER_TONE_MAP`: `MediaCapturePhase = Ellipsis` — 2
  - `BEFORE_POST_PROCESSING`: `MediaCapturePhase = Ellipsis` — 0
  - `END_FRAME`: `MediaCapturePhase = Ellipsis` — 5
  - `POST_RENDER`: `MediaCapturePhase = Ellipsis` — 4

### `unreal.MediaCaptureResizeMethod`
Inherits: `EnumBase` | Header: `MediaCapture.h`

EMedia Capture Resize Method

**Properties** (4):
  - `NONE`: `MediaCaptureResizeMethod = Ellipsis` — Leaves the source texture as is, which might be incompatible with the output size, causing an error....
  - `RESIZE_IN_CAPTURE_PASS`: `MediaCaptureResizeMethod = Ellipsis` — Leaves the source as is, but expects the capture pass to fully re-render the source texture to the o...
  - `RESIZE_IN_RENDER_PASS`: `MediaCaptureResizeMethod = Ellipsis` — Leaves the source as is, but will add a render pass where we resize the captured texture, leaving th...
  - `RESIZE_SOURCE`: `MediaCaptureResizeMethod = Ellipsis` — Resize the source that is being captured. This will resize the viewport when doing a viewport captur...

### `unreal.MediaCaptureState`
Inherits: `EnumBase` | Header: `MediaCapture.h`

Possible states of media capture.

**Properties** (5):
  - `CAPTURING`: `MediaCaptureState = Ellipsis` — Media is currently capturing. 1
  - `ERROR`: `MediaCaptureState = Ellipsis` — Unrecoverable error occurred during capture. 0
  - `PREPARING`: `MediaCaptureState = Ellipsis` — Media is being prepared for capturing. 2
  - `STOPPED`: `MediaCaptureState = Ellipsis` — Capture has been stopped. 4
  - `STOP_REQUESTED`: `MediaCaptureState = Ellipsis` — Capture has been stopped but some frames may need to be process. 3

### `unreal.MediaIOAutoDetectableTimecodeFormat`
Inherits: `EnumBase` | Header: `MediaIOCoreDefinitions.h`

Timecode formats.

**Properties** (4):
  - `AUTO`: `MediaIOAutoDetectableTimecodeFormat = Ellipsis` — 255
  - `LTC`: `MediaIOAutoDetectableTimecodeFormat = Ellipsis` — 1
  - `NONE`: `MediaIOAutoDetectableTimecodeFormat = Ellipsis` — 0
  - `VITC`: `MediaIOAutoDetectableTimecodeFormat = Ellipsis` — 2

### `unreal.MediaIOCoreSourceEncoding`
Inherits: `EnumBase` | Header: `CaptureCardMediaSource.h`

List of texture source encodings that can be converted to linear. (Integer values match the ETextureSourceEncoding values in TextureDefines.h

**Properties** (4):
  - `LINEAR`: `MediaIOCoreSourceEncoding = Ellipsis` — 1
  - `ST2084`: `MediaIOCoreSourceEncoding = Ellipsis` — 3
  - `S_LOG3`: `MediaIOCoreSourceEncoding = Ellipsis` — BT1886          = 5 UMETA(DisplayName = âBT1886/Gamma 2.4â), 12
  - `S_RGB`: `MediaIOCoreSourceEncoding = Ellipsis` — 2

### `unreal.MediaIOInterlaceFieldOrder`
Inherits: `EnumBase` | Header: `MediaIOCoreDefinitions.h`

Which interlace field should be set first in the buffer.

**Properties** (2):
  - `BOTTOM_FIELD_FIRST`: `MediaIOInterlaceFieldOrder = Ellipsis` — 1
  - `TOP_FIELD_FIRST`: `MediaIOInterlaceFieldOrder = Ellipsis` — 0

### `unreal.MediaIOOutputType`
Inherits: `EnumBase` | Header: `MediaIOCoreDefinitions.h`

SDI Output type.

**Properties** (2):
  - `FILL`: `MediaIOOutputType = Ellipsis` — 0
  - `FILL_AND_KEY`: `MediaIOOutputType = Ellipsis` — 1

### `unreal.MediaIOQuadLinkTransportType`
Inherits: `EnumBase` | Header: `MediaIOCoreDefinitions.h`

Quad link transport type.

**Properties** (2):
  - `SQUARE_DIVISION`: `MediaIOQuadLinkTransportType = Ellipsis` — 0
  - `TWO_SAMPLE_INTERLEAVE`: `MediaIOQuadLinkTransportType = Ellipsis` — 1

### `unreal.MediaIOReferenceType`
Inherits: `EnumBase` | Header: `MediaIOCoreDefinitions.h`

SDI Output type.

**Properties** (3):
  - `EXTERNAL`: `MediaIOReferenceType = Ellipsis` — 1
  - `FREE_RUN`: `MediaIOReferenceType = Ellipsis` — 0
  - `INPUT`: `MediaIOReferenceType = Ellipsis` — 2

### `unreal.MediaIOSampleEvaluationType`
Inherits: `EnumBase` | Header: `MediaIOCoreDefinitions.h`

Various sample evaluation types available in MediaIO.

**Properties** (3):
  - `LATEST`: `MediaIOSampleEvaluationType = Ellipsis` — 0
  - `PLATFORM_TIME`: `MediaIOSampleEvaluationType = Ellipsis` — 1
  - `TIMECODE`: `MediaIOSampleEvaluationType = Ellipsis` — 2

### `unreal.MediaIOStandardType`
Inherits: `EnumBase` | Header: `MediaIOCoreDefinitions.h`

SDI transport type.

**Properties** (3):
  - `INTERLACED`: `MediaIOStandardType = Ellipsis` — 1
  - `PROGRESSIVE`: `MediaIOStandardType = Ellipsis` — 0
  - `PROGRESSIVE_SEGMENTED_FRAME`: `MediaIOStandardType = Ellipsis` — 2

### `unreal.MediaIOTimecodeFormat`
Inherits: `EnumBase` | Header: `MediaIOCoreDefinitions.h`

Timecode formats.

**Properties** (3):
  - `LTC`: `MediaIOTimecodeFormat = Ellipsis` — 1
  - `NONE`: `MediaIOTimecodeFormat = Ellipsis` — 0
  - `VITC`: `MediaIOTimecodeFormat = Ellipsis` — 2

### `unreal.MediaIOTransportType`
Inherits: `EnumBase` | Header: `MediaIOCoreDefinitions.h`

Media transport type.

**Properties** (4):
  - `DUAL_LINK`: `MediaIOTransportType = Ellipsis` — 1
  - `HDMI`: `MediaIOTransportType = Ellipsis` — 3
  - `QUAD_LINK`: `MediaIOTransportType = Ellipsis` — 2
  - `SINGLE_LINK`: `MediaIOTransportType = Ellipsis` — 0

### `unreal.MediaCaptureStateChangedSignature`
Inherits: `MulticastDelegateBase` | Header: `MediaCapture.h`

Delegate signatures
