# UE Python API — NDIMedia Module

**9 types** from the `NDIMedia` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `NDIReceiverPerformanceData`, `NDISourceSettings`, `NDIMediaCapture`, `NDIMediaOutput`, `NDIMediaSource`, `NDITimecodeProvider`, `NDIMediaOutputAudioSampleRate`, `NDIMediaOutputPixelFormat`, `NDIReceiverBandwidth`

---

## Classes

### `unreal.NDIReceiverPerformanceData`
Inherits: `StructBase` | Header: `NDIReceiverPerformanceData.h`

NDI receiverâs performance statistics on number of frames received and dropped.

**Properties** (6):
  - `audio_frames`: `int` [Read-Only] — [Read-Only] The number of audio frames received (int64)
  - `dropped_audio_frames`: `int` [Read-Only] — [Read-Only] The number of audio frames dropped (int64)
  - `dropped_metadata_frames`: `int` [Read-Only] — [Read-Only] The number of metadata frames dropped (int64)
  - `dropped_video_frames`: `int` [Read-Only] — [Read-Only] The number of video frames dropped (int64)
  - `metadata_frames`: `int` [Read-Only] — [Read-Only] The number of metadata frames received (int64)
  - `video_frames`: `int` [Read-Only] — [Read-Only] The number of video frames received (int64)

### `unreal.NDISourceSettings`
Inherits: `StructBase` | Header: `NDISourceSettings.h`

Carries the NDI source and capture settings to the media receiver from either media source/player or timecode provider.

**Properties** (4):
  - `bandwidth`: `NDIReceiverBandwidth` — [Read-Write] Indicates the current bandwidth mode used for the connection to this source (NDIReceive...
  - `capture_audio`: `bool` — [Read-Write] Capture Audio from the NDI source. (bool)
  - `capture_video`: `bool` — [Read-Write] Capture Video from the NDI source. (bool)
  - `source_name`: `str` — [Read-Write] NDI Source name (str)

### `unreal.NDIMediaCapture`
Inherits: `MediaCapture` | Header: `NDIMediaCapture.h`

NDIMedia Capture

### `unreal.NDIMediaOutput`
Inherits: `MediaOutput` | Header: `NDIMediaOutput.h`

Output information for a NDI media capture. note: âFrame Buffer Pixel Formatâ must be set to RGBA8

**Properties** (15):
  - `audio_buffer_size`: `int` — [Read-Write] Size of the buffer that holds rendered audio samples, a bigger buffer will produce a mo...
  - `audio_sample_rate`: `NDIMediaOutputAudioSampleRate` — [Read-Write] NDI Audio supports any sample rate.
The standard for live production is 48 kHz. (NDIMed...
  - `desired_pixel_format`: `NDIMediaOutputPixelFormat` — [Read-Write] Use the default back buffer pixel format or specify a specific the pixel format to capt...
  - `desired_size`: `IntPoint` — [Read-Write] Use the default back buffer size or specify a specific size to capture. (IntPoint)
  - `frame_rate`: `FrameRate` — [Read-Write] Represents the desired number of frames (per second) for video to be sent over NDI (Fra...
  - `group_name`: `str` — [Read-Write] Defines the group this source is part of. If left empty, the source is âungroupedâ ...
  - `invert_key_output`: `bool` — [Read-Write] Options on how to save the images. (bool)
  - `num_output_audio_channels`: `int` — [Read-Write] An individual NDI stream can transport multiple audio channels.
The number of channels ...
  - `output_audio`: `bool` — [Read-Write] Whether to capture and output audio from the engine. (bool)
  - `output_type`: `MediaIOOutputType` — [Read-Write] Whether to output the fill or the fill and key. (MediaIOOutputType)
  - `override_desired_size`: `bool` — [Read-Write] Use the default back buffer size or specify a specific size to capture. (bool)
  - `override_pixel_format`: `bool` — [Read-Write] Use the default back buffer pixel format or specify a specific the pixel format to capt...
  - `send_audio_only_if_receivers_connected`: `bool` — [Read-Write] As an optimization, the audio will not be converted and sent if there are no connected ...
  - `source_name`: `str` — [Read-Write] Describes a user-friendly name of the output stream to differentiate from other output ...
  - `wait_for_sync_event`: `bool` — [Read-Write] Wait for the NDI source sync event.
Caution: this will be blocking in the rendering thr...

### `unreal.NDIMediaSource`
Inherits: `CaptureCardMediaSource` | Header: `NDIMediaSource.h`

Media source for NDI streams.

**Properties** (8):
  - `capture_ancillary`: `bool` [Read-Only] — [Read-Only] Capture Ancillary from the NDI source.
It will decrease performance (bool)
  - `capture_audio`: `bool` [Read-Only] — [Read-Only] Capture Audio from the NDI source. (bool)
  - `capture_video`: `bool` [Read-Only] — [Read-Only] Capture Video from the NDI source. (bool)
  - `encode_timecode_in_texel`: `bool` [Read-Only] — [Read-Only] Burn Frame Timecode in the input texture without any frame number clipping.
Note: Only s...
  - `max_num_ancillary_frame_buffer`: `int` [Read-Only] — [Read-Only] Maximum number of ancillary data frames to buffer. (int32)
  - `max_num_audio_frame_buffer`: `int` [Read-Only] — [Read-Only] Maximum number of audio frames to buffer. (int32)
  - `max_num_video_frame_buffer`: `int` [Read-Only] — [Read-Only] Maximum number of video frames to buffer. (int32)
  - `sync_timecode_to_source`: `bool` — [Read-Write] Indicates whether the timecode should be synced to the Source Timecode value or engineâ...

### `unreal.NDITimecodeProvider`
Inherits: `GenlockedTimecodeProvider` | Header: `NDITimecodeProvider.h`

Timecode provider from an NDI source

### `unreal.NDIMediaOutputAudioSampleRate`
Inherits: `EnumBase` | Header: `NDIMediaOutput.h`

NDI Audio supports any sample rate. The standard for live production is 48 kHz.

**Properties** (6):
  - `SR_176_4K`: `NDIMediaOutputAudioSampleRate = Ellipsis` — 176400
  - `SR_192K`: `NDIMediaOutputAudioSampleRate = Ellipsis` — 192000
  - `SR_44_1K`: `NDIMediaOutputAudioSampleRate = Ellipsis` — 44100
  - `SR_48K`: `NDIMediaOutputAudioSampleRate = Ellipsis` — 48000
  - `SR_88_2K`: `NDIMediaOutputAudioSampleRate = Ellipsis` — 88200
  - `SR_96K`: `NDIMediaOutputAudioSampleRate = Ellipsis` — 96000

### `unreal.NDIMediaOutputPixelFormat`
Inherits: `EnumBase` | Header: `NDIMediaOutput.h`

Texture format supported by UNDIMediaOutput.

**Properties** (1):
  - `B8G8R8A8`: `NDIMediaOutputPixelFormat = Ellipsis` — 0

### `unreal.NDIReceiverBandwidth`
Inherits: `EnumBase` | Header: `NDIMediaDefines.h`

Receiver Bandwidth modes

**Properties** (4):
  - `AUDIO_ONLY`: `NDIReceiverBandwidth = Ellipsis` — Receive metadata, audio 1
  - `HIGHEST`: `NDIReceiverBandwidth = Ellipsis` — Receive metadata, audio, video at full resolution. 3
  - `LOWEST`: `NDIReceiverBandwidth = Ellipsis` — Receive metadata, audio, video at a lower bandwidth and resolution. 2
  - `METADATA_ONLY`: `NDIReceiverBandwidth = Ellipsis` — Receive metadata. 0
