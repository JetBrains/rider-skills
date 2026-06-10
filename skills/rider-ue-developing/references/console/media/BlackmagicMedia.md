# UE Python API — BlackmagicMedia Module

**8 types** from the `BlackmagicMedia` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BlackmagicMediaHDROptions`, `BlackmagicCustomTimeStep`, `BlackmagicMediaSource`, `BlackmagicTimecodeProvider`, `BlackmagicHDRMetadataEOTF`, `BlackmagicHDRMetadataGamut`, `BlackmagicMediaAudioChannel`, `BlackmagicMediaSourceColorFormat`

---

## Classes

### `unreal.BlackmagicMediaHDROptions`
Inherits: `StructBase` | Header: `BlackmagicMediaDefinitions.h`

Set of metadata describing a HDR video signal.

### `unreal.BlackmagicCustomTimeStep`
Inherits: `GenlockedCustomTimeStep` | Header: `BlackmagicCustomTimeStep.h`

Control the Engine TimeStep via the Blackmagic Design card.

### `unreal.BlackmagicMediaSource`
Inherits: `CaptureCardMediaSource` | Header: `BlackmagicMediaSource.h`

Media source description for Blackmagic.

**Properties** (10):
  - `audio_channels`: `BlackmagicMediaAudioChannel` — [Read-Write] Desired number of audio channel to capture. (BlackmagicMediaAudioChannel)
  - `auto_detectable_timecode_format`: `MediaIOAutoDetectableTimecodeFormat` [Read-Only] — [Read-Only] Use the time code embedded in the input stream. (MediaIOAutoDetectableTimecodeFormat)
  - `capture_audio`: `bool` [Read-Only] — [Read-Only] Capture Audio from the Blackmagic source. (bool)
  - `capture_video`: `bool` [Read-Only] — [Read-Only] Capture Video from the Blackmagic source. (bool)
  - `color_format`: `BlackmagicMediaSourceColorFormat` [Read-Only] — [Read-Only] Native data format internally used by the device after being converted from SDI/HDMI sig...
  - `encode_timecode_in_texel`: `bool` — [Read-Write] Burn Frame Timecode in the input texture without any frame number clipping.
Note: Only ...
  - `is_srgb_input`: `bool` — [Read-Write] Whether the video input is in sRGB color space.
A sRGB to Linear conversion will be app...
  - `max_num_audio_frame_buffer`: `int` [Read-Only] — [Read-Only] Maximum number of audio frames to buffer. (int32)
  - `max_num_video_frame_buffer`: `int` [Read-Only] — [Read-Only] Maximum number of video frames to buffer. (int32)
  - `timecode_format`: `MediaIOTimecodeFormat` — [Read-Write] Use the time code embedded in the input stream.
deprecated: Property âTimecodeFormatâ...

### `unreal.BlackmagicTimecodeProvider`
Inherits: `GenlockedTimecodeProvider` | Header: `BlackmagicTimecodeProvider.h`

Class to fetch a timecode via a Blackmagic Design card.

**Properties** (2):
  - `media_configuration`: `MediaIOConfiguration` — [Read-Write] The device, port and video settings that correspond to the input.
deprecated: Property ...
  - `timecode_format`: `MediaIOTimecodeFormat` — [Read-Write] Timecode format to read from a video signal.
deprecated: Property âTimecodeFormatâ ...

### `unreal.BlackmagicHDRMetadataEOTF`
Inherits: `EnumBase` | Header: `BlackmagicMediaDefinitions.h`

HDR Transfer function. Must match Blackmagic::EBlackmagicHDRMetadataEOTF.

**Properties** (4):
  - `HDR`: `BlackmagicHDRMetadataEOTF = Ellipsis` — 1
  - `HLG`: `BlackmagicHDRMetadataEOTF = Ellipsis` — 3
  - `PQ`: `BlackmagicHDRMetadataEOTF = Ellipsis` — 2
  - `SDR`: `BlackmagicHDRMetadataEOTF = Ellipsis` — 0

### `unreal.BlackmagicHDRMetadataGamut`
Inherits: `EnumBase` | Header: `BlackmagicMediaDefinitions.h`

HDR Color Gamut. Must match Blackmagic::EBlackmagicHDRMetadataGamut.

**Properties** (2):
  - `REC2020`: `BlackmagicHDRMetadataGamut = Ellipsis` — 1
  - `REC709`: `BlackmagicHDRMetadataGamut = Ellipsis` — 0

### `unreal.BlackmagicMediaAudioChannel`
Inherits: `EnumBase` | Header: `BlackmagicMediaSource.h`

Available number of audio channel supported by Unreal Engine & Capture card.

**Properties** (2):
  - `STEREO2`: `BlackmagicMediaAudioChannel = Ellipsis` — 0
  - `SURROUND8`: `BlackmagicMediaAudioChannel = Ellipsis` — 1

### `unreal.BlackmagicMediaSourceColorFormat`
Inherits: `EnumBase` | Header: `BlackmagicMediaSource.h`

Native data format.

**Properties** (2):
  - `YUV10`: `BlackmagicMediaSourceColorFormat = Ellipsis` — 1
  - `YUV8`: `BlackmagicMediaSourceColorFormat = Ellipsis` — 0
