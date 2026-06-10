# UE Python API — AjaMedia Module

**10 types** from the `AjaMedia` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AjaMediaHDROptions`, `AjaMediaTimecodeConfiguration`, `AjaMediaTimecodeReference`, `AjaCustomTimeStep`, `AjaMediaSource`, `AjaTimecodeProvider`, `AjaHDRMetadataEOTF`, `AjaHDRMetadataGamut`, `AjaMediaAudioChannel`, `AjaMediaSourceColorFormat`

---

## Classes

### `unreal.AjaMediaHDROptions`
Inherits: `StructBase` | Header: `AjaMediaDefinitions.h`

Set of metadata describing a HDR video signal.

### `unreal.AjaMediaTimecodeConfiguration`
Inherits: `StructBase` | Header: `AjaDeviceProvider.h`

Configuration of an AJA timecode from Video

### `unreal.AjaMediaTimecodeReference`
Inherits: `StructBase` | Header: `AjaDeviceProvider.h`

Configuration of an AJA timecode.

### `unreal.AjaCustomTimeStep`
Inherits: `GenlockedCustomTimeStep` | Header: `AjaCustomTimeStep.h`

Control the Engine TimeStep via the AJA card. When the signal is lost in the editor (not in PIE), the CustomTimeStep will try to re-synchronize every second.

### `unreal.AjaMediaSource`
Inherits: `CaptureCardMediaSource` | Header: `AjaMediaSource.h`

Media source for AJA streams.

**Properties** (13):
  - `audio_channel`: `AjaMediaAudioChannel` [Read-Only] — [Read-Only] Desired number of audio channel to capture. (AjaMediaAudioChannel)
  - `auto_detectable_timecode_format`: `MediaIOAutoDetectableTimecodeFormat` [Read-Only] — [Read-Only] Use the time code embedded in the input stream. (MediaIOAutoDetectableTimecodeFormat)
  - `capture_ancillary`: `bool` [Read-Only] — [Read-Only] Capture Ancillary from the AJA source.
It will decrease performance (bool)
  - `capture_audio`: `bool` [Read-Only] — [Read-Only] Capture Audio from the AJA source. (bool)
  - `capture_video`: `bool` [Read-Only] — [Read-Only] Capture Video from the AJA source. (bool)
  - `capture_with_auto_circulating`: `bool` [Read-Only] — [Read-Only] Use a ring buffer to capture and transfer data.
This may decrease transfer latency but i...
  - `color_format`: `AjaMediaSourceColorFormat` [Read-Only] — [Read-Only] Native data format internally used by the device after being converted from SDI/HDMI sig...
  - `encode_timecode_in_texel`: `bool` [Read-Only] — [Read-Only] Burn Frame Timecode in the input texture without any frame number clipping.
Note: Only s...
  - `is_srgb_input`: `bool` — [Read-Write] Whether the video input is in sRGB color space.
A sRGB to Linear conversion will be app...
  - `max_num_ancillary_frame_buffer`: `int` [Read-Only] — [Read-Only] Maximum number of ancillary data frames to buffer. (int32)
  - `max_num_audio_frame_buffer`: `int` [Read-Only] — [Read-Only] Maximum number of audio frames to buffer. (int32)
  - `max_num_video_frame_buffer`: `int` [Read-Only] — [Read-Only] Maximum number of video frames to buffer. (int32)
  - `timecode_format`: `MediaIOTimecodeFormat` — [Read-Write] Use the time code embedded in the input stream.
deprecated: Property âTimecodeFormatâ...

### `unreal.AjaTimecodeProvider`
Inherits: `GenlockedTimecodeProvider` | Header: `AjaTimecodeProvider.h`

Class to fetch a timecode via an AJA card. When the signal is lost in the editor (not in PIE), the TimecodeProvider will try to re-synchronize every second.

**Properties** (1):
  - `video_configuration`: `AjaMediaTimecodeConfiguration` — [Read-Write] It read the timecode from an input source.
deprecated: Property âVideoConfigurationâ...

### `unreal.AjaHDRMetadataEOTF`
Inherits: `EnumBase` | Header: `AjaMediaDefinitions.h`

HDR Transfer function. Must match AJA::EAjaHDRMetadataEOTF.

**Properties** (3):
  - `HLG`: `AjaHDRMetadataEOTF = Ellipsis` — 1
  - `PQ`: `AjaHDRMetadataEOTF = Ellipsis` — 2
  - `SDR`: `AjaHDRMetadataEOTF = Ellipsis` — 0

### `unreal.AjaHDRMetadataGamut`
Inherits: `EnumBase` | Header: `AjaMediaDefinitions.h`

HDR Color Gamut. Must match AJA::EAjaHDRMetadataGamut.

**Properties** (2):
  - `REC2020`: `AjaHDRMetadataGamut = Ellipsis` — 1
  - `REC709`: `AjaHDRMetadataGamut = Ellipsis` — 0

### `unreal.AjaMediaAudioChannel`
Inherits: `EnumBase` | Header: `AjaMediaSource.h`

Available number of audio channel supported by Unreal Engine & AJA

**Properties** (2):
  - `CHANNEL6`: `AjaMediaAudioChannel = Ellipsis` — 0
  - `CHANNEL8`: `AjaMediaAudioChannel = Ellipsis` — 1

### `unreal.AjaMediaSourceColorFormat`
Inherits: `EnumBase` | Header: `AjaMediaSource.h`

Native data format.

**Properties** (2):
  - `YUV2_8BIT`: `AjaMediaSourceColorFormat = Ellipsis` — 0
  - `YUV_10BIT`: `AjaMediaSourceColorFormat = Ellipsis` — 1
