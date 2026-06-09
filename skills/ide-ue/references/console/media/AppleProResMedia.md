# UE Python API — AppleProResMedia Module

**9 types** from the `AppleProResMedia` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AppleProResEncoderProtocol`, `MovieGraphAppleProResNode`, `MoviePipelineAppleProResOutput`, `AppleProResEncoderCodec`, `AppleProResEncoderColorDescription`, `AppleProResEncoderColorPrimaries`, `AppleProResEncoderFormats`, `AppleProResEncoderScanMode`, `AppleProResEncoderScanType`

---

## Classes

### `unreal.AppleProResEncoderProtocol`
Inherits: `FrameGrabberProtocol` | Header: `AppleProResEncoderProtocol.h`

Apple Pro Res Encoder Protocol

### `unreal.MovieGraphAppleProResNode`
Inherits: `MovieGraphVideoOutputNode` | Header: `MovieGraphAppleProResNode.h`

A node which can output Apple ProRes movies.

**Properties** (8):
  - `include_audio`: `bool` — [Read-Write] If true, audio will be included in the video file. (bool)
  - `ocio_configuration`: `OpenColorIODisplayConfiguration` — [Read-Write] OCIO configuration/transform settings. Note: There are differences from the previous im...
  - `ocio_context`: `None` — [Read-Write] OCIO context of key-value string pairs, typically used to apply shot-specific looks (su...
  - `override_b_include_audio`: `bool` — [Read-Write] (bool)
  - `override_ocio_configuration`: `bool` — [Read-Write] (bool)
  - `override_ocio_context`: `bool` — [Read-Write] (bool)
  - `override_quality`: `bool` — [Read-Write] (bool)
  - `quality`: `AppleProResEncoderCodec` — [Read-Write] The Apple ProRes codec that should be used. See Apple documentation for more specifics....

### `unreal.MoviePipelineAppleProResOutput`
Inherits: `MoviePipelineVideoOutputBase` | Header: `MoviePipelineAppleProResOutput.h`

Movie Pipeline Apple Pro Res Output

**Properties** (5):
  - `codec`: `AppleProResEncoderCodec` — [Read-Write] Which Apple ProRes codec should we use? See Apple documentation for more specifics. Use...
  - `drop_frame_timecode`: `bool` — [Read-Write] Should the embedded timecode track be written using drop-frame format? Only applicable ...
  - `include_audio`: `bool` — [Read-Write] If true, audio will be included in the video file. (bool)
  - `max_number_of_encoding_threads`: `int` — [Read-Write] What is the maximum number of threads the encoder should use to encode frames with? Zer...
  - `override_maximum_encoding_threads`: `bool` — [Read-Write] Should we override the maximum number of encoding threads? (bool)

### `unreal.AppleProResEncoderCodec`
Inherits: `EnumBase` | Header: `AppleProResEncoder.h`

EApple Pro Res Encoder Codec

**Properties** (6):
  - `PRO_RES_422`: `AppleProResEncoderCodec = Ellipsis` — High Quality Compression for 422 RGB Sources. Approximately 150mbps1920x1080@30fps: 2
  - `PRO_RES_422HQ`: `AppleProResEncoderCodec = Ellipsis` — A higher bit-rate version of Apple ProRes 422. Approximately 225mbps1920x1080@30fps: 3
  - `PRO_RES_422LT`: `AppleProResEncoderCodec = Ellipsis` — High compression. Approximately 100mbps1920x1080@30fps: 1
  - `PRO_RES_422_PROXY`: `AppleProResEncoderCodec = Ellipsis` — Highest Compression. Approximately 45mbps1920x1080@30fps: 0
  - `PRO_RES_4444`: `AppleProResEncoderCodec = Ellipsis` — Extremely high quality and supports alpha channels. Can support both RGB and YCbCr formats. Very lar...
  - `PRO_RES_4444XQ`: `AppleProResEncoderCodec = Ellipsis` — Highest quality storage with support for alpha channel with up to 12 bits precision for RGB and 16 b...

### `unreal.AppleProResEncoderColorDescription`
Inherits: `EnumBase` | Header: `AppleProResEncoderProtocol.h`

EApple Pro Res Encoder Color Description

**Properties** (3):
  - `CD_HDREC709`: `AppleProResEncoderColorDescription = Ellipsis` — 2
  - `CD_SDREC601_525_60HZ`: `AppleProResEncoderColorDescription = Ellipsis` — 0
  - `CD_SDREC601_625_50HZ`: `AppleProResEncoderColorDescription = Ellipsis` — 1

### `unreal.AppleProResEncoderColorPrimaries`
Inherits: `EnumBase` | Header: `AppleProResEncoder.h`

EApple Pro Res Encoder Color Primaries

**Properties** (3):
  - `CD_HDREC709`: `AppleProResEncoderColorPrimaries = Ellipsis` — 2
  - `CD_SDREC601_525_60HZ`: `AppleProResEncoderColorPrimaries = Ellipsis` — 0
  - `CD_SDREC601_625_50HZ`: `AppleProResEncoderColorPrimaries = Ellipsis` — 1

### `unreal.AppleProResEncoderFormats`
Inherits: `EnumBase` | Header: `AppleProResEncoderProtocol.h`

EApple Pro Res Encoder Formats

**Properties** (6):
  - `F_422`: `AppleProResEncoderFormats = Ellipsis` — 1
  - `F_422HQ`: `AppleProResEncoderFormats = Ellipsis` — 0
  - `F_422LT`: `AppleProResEncoderFormats = Ellipsis` — 2
  - `F_422_PROXY`: `AppleProResEncoderFormats = Ellipsis` — 3
  - `F_4444`: `AppleProResEncoderFormats = Ellipsis` — 4
  - `F_4444XQ`: `AppleProResEncoderFormats = Ellipsis` — 5

### `unreal.AppleProResEncoderScanMode`
Inherits: `EnumBase` | Header: `AppleProResEncoder.h`

EApple Pro Res Encoder Scan Mode

**Properties** (3):
  - `IM_INTERLACED_TOP_FIELD_FIRST`: `AppleProResEncoderScanMode = Ellipsis` — 1
  - `IM_INTERLATED_BOTTOM_FIRST_FIRST`: `AppleProResEncoderScanMode = Ellipsis` — 2
  - `IM_PROGRESSIVE_SCAN`: `AppleProResEncoderScanMode = Ellipsis` — 0

### `unreal.AppleProResEncoderScanType`
Inherits: `EnumBase` | Header: `AppleProResEncoderProtocol.h`

EApple Pro Res Encoder Scan Type

**Properties** (3):
  - `IM_INTERLACED_TOP_FIELD_FIRST`: `AppleProResEncoderScanType = Ellipsis` — 1
  - `IM_INTERLATED_BOTTOM_FIRST_FIRST`: `AppleProResEncoderScanType = Ellipsis` — 2
  - `IM_PROGRESSIVE_SCAN`: `AppleProResEncoderScanType = Ellipsis` — 0
