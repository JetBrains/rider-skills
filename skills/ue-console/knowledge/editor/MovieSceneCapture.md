# UE Python API — MovieSceneCapture Module

**27 types** from the `MovieSceneCapture` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CapturedPixels`, `CapturedPixelsID`, `CaptureResolution`, `CompositionGraphCapturePasses`, `FrameMetrics`, `MovieSceneCaptureSettings`, `CompositionGraphCaptureProtocol`, `CompressedImageSequenceProtocol`, `FrameGrabberProtocol`, `ImageSequenceProtocol`, `ImageSequenceProtocol_BMP`, `ImageSequenceProtocol_EXR`, `ImageSequenceProtocol_JPG`, `ImageSequenceProtocol_PNG`, `LevelCapture`, `MasterAudioSubmixCaptureProtocol`, `MovieSceneAudioCaptureProtocolBase`, `MovieSceneCapture`, `MovieSceneCaptureEnvironment`, `MovieSceneCaptureProtocolBase`, ... (27 total)

---

## Classes

### `unreal.CapturedPixels`
Inherits: `StructBase` | Header: `UserDefinedCaptureProtocol.h`

Captured Pixels

### `unreal.CapturedPixelsID`
Inherits: `StructBase` | Header: `UserDefinedCaptureProtocol.h`

Structure used as an identifier for a particular buffer within a capture.

**Properties** (1):
  - `identifiers`: `None` — [Read-Write] Map of identifiers to their values for this ID. (Map[Name,Name])

### `unreal.CaptureResolution`
Inherits: `StructBase` | Header: `MovieSceneCaptureSettings.h`

Structure representing a capture resolution

**Properties** (2):
  - `res_x`: `int` — [Read-Write] (int32)
  - `res_y`: `int` — [Read-Write] (int32)

### `unreal.CompositionGraphCapturePasses`
Inherits: `StructBase` | Header: `CompositionGraphCaptureProtocol.h`

Composition Graph Capture Passes

**Properties** (1):
  - `value`: `None` — [Read-Write] List of passes to record by name. (Array[str])

### `unreal.FrameMetrics`
Inherits: `StructBase` | Header: `MovieSceneCaptureProtocolBase.h`

Metrics that correspond to a particular frame

**Properties** (4):
  - `frame_delta`: `float` [Read-Only] — [Read-Only] The total amount of time, in seconds, that this specific frame took to render (not accou...
  - `frame_number`: `int` [Read-Only] — [Read-Only] The index of this frame from the start of the capture, including dropped frames (int32)
  - `num_dropped_frames`: `int` [Read-Only] — [Read-Only] The number of frames we dropped in-between this frame, and the last one we captured (int...
  - `total_elapsed_time`: `float` [Read-Only] — [Read-Only] The total amount of time, in seconds, since the capture started (float)

### `unreal.MovieSceneCaptureSettings`
Inherits: `StructBase` | Header: `MovieSceneCaptureSettings.h`

Common movie-scene capture settings

**Properties** (21):
  - `allow_movement`: `bool` — [Read-Write] Whether to allow player movement whilst capturing (bool)
  - `allow_turning`: `bool` — [Read-Write] Whether to allow player rotation whilst capturing (bool)
  - `cinematic_engine_scalability`: `bool` — [Read-Write] Whether to enable cinematic engine scalability settings (bool)
  - `cinematic_mode`: `bool` — [Read-Write] Whether to enable cinematic mode whilst capturing (bool)
  - `custom_frame_rate`: `FrameRate` — [Read-Write] The custom frame rate at which to capture if âUse Custom Frame Rateâ is enabled (Fr...
  - `enable_texture_streaming`: `bool` — [Read-Write] Whether to texture streaming should be enabled while capturing.  Turning off texture st...
  - `frame_rate`: `FrameRate` [Read-Only] — [Read-Only] The sequenceâs frame rate at which to capture if âUse Custom Frame Rateâ is not en...
  - `game_mode_override`: `Class` — [Read-Write] Optional game mode to override the mapâs default game mode with.  This can be useful ...
  - `handle_frames`: `int` — [Read-Write] Number of frame handles to include for each shot (int32)
  - `movie_extension`: `str` — [Read-Write] Filename extension for movies referenced in the XMLs/EDLs (str)
  - `output_directory`: `DirectoryPath` — [Read-Write] The directory to output the captured file(s) in (DirectoryPath)
  - `output_format`: `str` — [Read-Write] The format to use for the resulting filename. Extension will be added automatically. An...
  - `overwrite_existing`: `bool` — [Read-Write] Whether to overwrite existing files or not (bool)
  - `path_tracer_sample_per_pixel`: `int` — [Read-Write] Number of sampler per pixel to be used when rendering the scene with the path tracer (i...
  - `resolution`: `CaptureResolution` — [Read-Write] The resolution at which to capture (CaptureResolution)
  - `show_hud`: `bool` — [Read-Write] Whether to show the in-game HUD whilst capturing (bool)
  - `show_player`: `bool` — [Read-Write] Whether to show the local player whilst capturing (bool)
  - `use_custom_frame_rate`: `bool` — [Read-Write] Specify using the custom frame rate as opposed to the sequenceâs display rate (bool)
  - `use_path_tracer`: `bool` — [Read-Write] Whether to use the path tracer (if supported) to render the scene (bool)
  - `use_relative_frame_numbers`: `bool` — [Read-Write] True if frame numbers in the output files should be relative to zero, rather than the a...
  - `zero_pad_frame_numbers`: `int` — [Read-Write] How much to zero-pad frame numbers on filenames (uint8)

### `unreal.CompositionGraphCaptureProtocol`
Inherits: `MovieSceneImageCaptureProtocolBase` | Header: `CompositionGraphCaptureProtocol.h`

Composition Graph Capture Protocol

**Properties** (6):
  - `capture_frames_in_hdr`: `bool` — [Read-Write] Whether to capture the frames as HDR textures (*.exr format) (bool)
  - `capture_gamut`: `HDRCaptureGamut` — [Read-Write] The color gamut to use when storing HDR captured data. The gamut depends on whether the...
  - `disable_screen_percentage`: `bool` — [Read-Write] Whether to disable screen percentage (bool)
  - `hdr_compression_quality`: `int` — [Read-Write] Compression Quality for HDR Frames (0 for no compression, 1 for default compression whi...
  - `include_render_passes`: `CompositionGraphCapturePasses` — [Read-Write] A list of render passes to include in the capture. Leave empty to export all available ...
  - `post_processing_material`: `SoftObjectPath` — [Read-Write] Custom post processing material to use for rendering (SoftObjectPath)

### `unreal.CompressedImageSequenceProtocol`
Inherits: `ImageSequenceProtocol` | Header: `ImageSequenceProtocol.h`

Compressed Image Sequence Protocol

**Properties** (1):
  - `compression_quality`: `int` — [Read-Write] Level of compression to apply to the image, between 1 (worst quality, best compression)...

### `unreal.FrameGrabberProtocol`
Inherits: `MovieSceneImageCaptureProtocolBase` | Header: `FrameGrabberProtocol.h`

Frame Grabber Protocol

### `unreal.ImageSequenceProtocol`
Inherits: `FrameGrabberProtocol` | Header: `ImageSequenceProtocol.h`

Image Sequence Protocol

### `unreal.ImageSequenceProtocol_BMP`
Inherits: `ImageSequenceProtocol` | Header: `ImageSequenceProtocol.h`

Image Sequence Protocol BMP

### `unreal.ImageSequenceProtocol_EXR`
Inherits: `ImageSequenceProtocol` | Header: `ImageSequenceProtocol.h`

Image Sequence Protocol EXR

### `unreal.ImageSequenceProtocol_JPG`
Inherits: `CompressedImageSequenceProtocol` | Header: `ImageSequenceProtocol.h`

Image Sequence Protocol JPG

### `unreal.ImageSequenceProtocol_PNG`
Inherits: `CompressedImageSequenceProtocol` | Header: `ImageSequenceProtocol.h`

Image Sequence Protocol PNG

### `unreal.LevelCapture`
Inherits: `MovieSceneCapture` | Header: `LevelCapture.h`

Level Capture

### `unreal.MasterAudioSubmixCaptureProtocol`
Inherits: `MovieSceneAudioCaptureProtocolBase` | Header: `AudioCaptureProtocol.h`

This is an experimental audio capture implementation which captures the final output from the master submix. This requires that your sequence can be played back in real-time (when rendering is disable...

**Properties** (1):
  - `file_name`: `str` — [Read-Write] (str)

### `unreal.MovieSceneAudioCaptureProtocolBase`
Inherits: `MovieSceneCaptureProtocolBase` | Header: `MovieSceneCaptureProtocolBase.h`

A class to inherit from for audio capture protocols. Used to filter the UI for protocols used on the audio capture pass.

### `unreal.MovieSceneCapture`
Inherits: `Object` | Header: `MovieSceneCapture.h`

Class responsible for capturing scene data

**Methods** (4):
  - `get_audio_capture_protocol()` -> `MovieSceneCaptureProtocolBase` — Get Audio Capture Protocol
  - `get_image_capture_protocol()` -> `MovieSceneCaptureProtocolBase` — Access the capture protocol we are using
  - `set_audio_capture_protocol_type(protocol_type)` -> `None` — Set Audio Capture Protocol Type
  - `set_image_capture_protocol_type(protocol_type)` -> `None` — Set Image Capture Protocol Type

**Properties** (5):
  - `additional_command_line_arguments`: `str` — [Read-Write] Additional command line arguments to pass to the external process when capturing (str)
  - `close_editor_when_capture_starts`: `bool` — [Read-Write] When enabled, the editor will shutdown when the capture starts (bool)
  - `inherited_command_line_arguments`: `str` — [Read-Write] Command line arguments inherited from this process (str)
  - `settings`: `MovieSceneCaptureSettings` — [Read-Write] Settings that define how to capture (MovieSceneCaptureSettings)
  - `use_separate_process`: `bool` — [Read-Write] Whether to capture the movie in a separate process or not (bool)

### `unreal.MovieSceneCaptureEnvironment`
Inherits: `Object` | Header: `MovieSceneCaptureEnvironment.h`

Movie Scene Capture Environment

**Methods** (5):
  - `find_audio_capture_protocol()` -> `MovieSceneAudioCaptureProtocolBase` [classmethod] — Attempt to locate a capture protocol - may not be in a capturing state
  - `find_image_capture_protocol()` -> `MovieSceneImageCaptureProtocolBase` [classmethod] — Attempt to locate a capture protocol - may not be in a capturing state
  - `get_capture_elapsed_time()` -> `float` [classmethod] — Get the total elapsed time of the current capture in seconds
  - `get_capture_frame_number()` -> `int32` [classmethod] — Get the frame number of the current capture
  - `is_capture_in_progress()` -> `bool` [classmethod] — Return true if there is any capture currently active (even in a warm-up state). Useful for checking whether to do certai...

### `unreal.MovieSceneCaptureProtocolBase`
Inherits: `Object` | Header: `MovieSceneCaptureProtocolBase.h`

A capture protocol responsible for dealing with captured frames using some custom method (writing out to disk, streaming, etc)

**Methods** (2):
  - `get_state()` -> `MovieSceneCaptureProtocolState` — Get the current state of this capture protocol
  - `is_capturing()` -> `bool` — Check whether we can capture a frame from this protocol

### `unreal.MovieSceneImageCaptureProtocolBase`
Inherits: `MovieSceneCaptureProtocolBase` | Header: `MovieSceneCaptureProtocolBase.h`

A class to inherit from for image capture protocols. Used to filter the UI for protocols used on the image capture pass.

### `unreal.NullAudioCaptureProtocol`
Inherits: `MovieSceneAudioCaptureProtocolBase` | Header: `AudioCaptureProtocol.h`

This is a null audio capture implementation which skips capturing audio. The MovieSceneCapture is explicitly aware of this type and will skip processing an audio pass if this is specified.

### `unreal.UserDefinedCaptureProtocol`
Inherits: `MovieSceneImageCaptureProtocolBase` | Header: `UserDefinedCaptureProtocol.h`

A blueprintable capture protocol that defines how to capture frames from the engine

**Methods** (16):
  - `generate_filename(frame_metrics)` -> `str` — Generate a filename for the current frame
  - `get_current_frame_metrics()` -> `FrameMetrics` — Access this protocolâs current frame metrics
  - `on_begin_finalize()` -> `None` — Called when this protocol is going to be shut down - should not capture any more frames
  - `on_can_finalize()` -> `bool` — Called to check whether this protocol has finished any pending tasks, and can now be shut down
  - `on_capture_frame()` -> `None` — Called when this protocol should capture the current frame
  - `on_finalize()` -> `None` — Called to complete finalization of this protocol
  - `on_pause_capture()` -> `None` — Called when this protocol should temporarily stop capturing frames
  - `on_pixels_received(pixels, id, frame_metrics)` -> `None` — Called when pixels have been received for the specified stream name
  - `on_pre_tick()` -> `None` — Called before the capture process itself is ticked, before each frame is set up for capture Useful for any pre-frame set...
  - `on_setup()` -> `bool` — Called once at the start of the capture process, but before any warmup frames
  - `on_start_capture()` -> `None` — Called when this protocol should start capturing frames
  - `on_tick()` -> `None` — Called after the capture process itself is ticked, after the frame is set up for capture, but before most actors have ti...
  - `on_warm_up()` -> `None` — Called when the capture process is warming up. Protocols may transition from either an initialized, or capturing state t...
  - `resolve_buffer(buffer, buffer_id)` -> `None`
  - `start_capturing_final_pixels(stream_id)` -> `None` — Instruct this protocol to start capturing LDR final pixels (including slate widgets and burn-ins)
  - `stop_capturing_final_pixels()` -> `None` — Instruct this protocol to stop capturing LDR final pixels

**Properties** (1):
  - `world`: `World` [Read-Only] — [Read-Only] World pointer assigned on Setup (World)

### `unreal.UserDefinedImageCaptureProtocol`
Inherits: `UserDefinedCaptureProtocol` | Header: `UserDefinedCaptureProtocol.h`

A blueprintable capture protocol tailored to capturing and exporting frames as images

**Methods** (3):
  - `generate_filename_for_buffer(buffer, stream_id)` -> `str`
  - `generate_filename_for_current_frame()` -> `str`
  - `write_image_to_disk(pixel_data, stream_id, frame_metrics, copy_image_data = False)` -> `None`

**Properties** (3):
  - `compression_quality`: `int` — [Read-Write] The compression quality for the image type. For EXRs, 0 = Default ZIP compression, 1 = ...
  - `enable_compression`: `bool` — [Read-Write] Whether to save images with compression or not. Not supported for bitmaps. (bool)
  - `format`: `DesiredImageFormat` — [Read-Write] The image format to save as (DesiredImageFormat)

### `unreal.VideoCaptureProtocol`
Inherits: `FrameGrabberProtocol` | Header: `VideoCaptureProtocol.h`

Video Capture Protocol

### `unreal.HDRCaptureGamut`
Inherits: `EnumBase` | Header: `CompositionGraphCaptureProtocol.h`

Used by UCompositionGraphCaptureSettings. Matches gamut order in EDisplayColorGamut

**Properties** (6):
  - `HCGM_ACES`: `HDRCaptureGamut = Ellipsis` — 3
  - `HCGM_ACE_SCG`: `HDRCaptureGamut = Ellipsis` — 4
  - `HCGM_LINEAR`: `HDRCaptureGamut = Ellipsis` — 5
  - `HCGM_P3DCI`: `HDRCaptureGamut = Ellipsis` — 1
  - `HCGM_REC2020`: `HDRCaptureGamut = Ellipsis` — 2
  - `HCGM_REC709`: `HDRCaptureGamut = Ellipsis` — 0

### `unreal.MovieSceneCaptureProtocolState`
Inherits: `EnumBase` | Header: `MovieSceneCaptureProtocolBase.h`

EMovie Scene Capture Protocol State

**Properties** (4):
  - `CAPTURING`: `MovieSceneCaptureProtocolState = Ellipsis` — The protocol has been initialized, bound to a viewport and is capturing data 2
  - `FINALIZING`: `MovieSceneCaptureProtocolState = Ellipsis` — The protocol has finished capturing data, and is pending finalization 3
  - `IDLE`: `MovieSceneCaptureProtocolState = Ellipsis` — The protocol is idle, and has not even been initialized 0
  - `INITIALIZED`: `MovieSceneCaptureProtocolState = Ellipsis` — The protocol has been initialized (and bound to a viewport) but is not capturing frames yet 1
