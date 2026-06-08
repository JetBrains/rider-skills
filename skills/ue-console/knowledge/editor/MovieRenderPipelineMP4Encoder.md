# UE Python API — MovieRenderPipelineMP4Encoder Module

**5 types** from the `MovieRenderPipelineMP4Encoder` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MovieGraphMP4EncoderNode`, `MoviePipelineMP4EncoderOutput`, `MoviePipelineMP4EncodeLevel`, `MoviePipelineMP4EncodeProfile`, `MoviePipelineMP4EncodeRateControlMode`

---

## Classes

### `unreal.MovieGraphMP4EncoderNode`
Inherits: `MovieGraphVideoOutputNode` | Header: `MovieGraphMP4EncoderNode.h`

A node which can output H264 mp4 files.

**Properties** (18):
  - `average_bitrate_in_mbps`: `float` — [Read-Write] What is the average bitrate the encoder should target per second? Value is in Megabits ...
  - `constant_rate_factor`: `int` — [Read-Write] What is the Constant Rate Factor (CRF) when targeting a specific quality. Values of 17-...
  - `encoding_level`: `MoviePipelineMP4EncodeLevel` — [Read-Write] A higher encode level generally results in a better quality video for the same bitrate,...
  - `encoding_profile`: `MoviePipelineMP4EncodeProfile` — [Read-Write] A higher profile generally results in a better quality video for the same bitrate, but ...
  - `encoding_rate_control`: `MoviePipelineMP4EncodeRateControlMode` — [Read-Write] Specifies the bitrate control method used by the encoder. Quality lets the user target ...
  - `include_audio`: `bool` — [Read-Write] If true, audio will be included in the video file. (bool)
  - `max_bitrate_in_mbps`: `float` — [Read-Write] When using VariableBitRate_Constrained, what is the maximum bitrate that the encoder ca...
  - `ocio_configuration`: `OpenColorIODisplayConfiguration` — [Read-Write] OCIO configuration/transform settings. Note: There are differences from the previous im...
  - `ocio_context`: `None` — [Read-Write] OCIO context of key-value string pairs, typically used to apply shot-specific looks (su...
  - `override_average_bitrate_in_mbps`: `bool` — [Read-Write] (bool)
  - `override_b_include_audio`: `bool` — [Read-Write] (bool)
  - `override_constant_rate_factor`: `bool` — [Read-Write] (bool)
  - `override_encoding_level`: `bool` — [Read-Write] (bool)
  - `override_encoding_profile`: `bool` — [Read-Write] (bool)
  - `override_encoding_rate_control`: `bool` — [Read-Write] (bool)
  - `override_max_bitrate_in_mbps`: `bool` — [Read-Write] (bool)
  - `override_ocio_configuration`: `bool` — [Read-Write] (bool)
  - `override_ocio_context`: `bool` — [Read-Write] (bool)

### `unreal.MoviePipelineMP4EncoderOutput`
Inherits: `MoviePipelineVideoOutputBase` | Header: `MoviePipelineMP4EncoderOutput.h`

Movie Pipeline MP4Encoder Output

**Properties** (7):
  - `average_bitrate_in_mbps`: `float` — [Read-Write] What is the average bitrate the encoder should target per second? Value is in Megabits ...
  - `constant_rate_factor`: `int` — [Read-Write] What is the Constant Rate Factor (CRF) when targeting a specific quality. Values of 17-...
  - `encoding_level`: `MoviePipelineMP4EncodeLevel` — [Read-Write] A higher encode level generally results in a better quality video for the same bitrate,...
  - `encoding_profile`: `MoviePipelineMP4EncodeProfile` — [Read-Write] A higher profile generally results in a better quality video for the same bitrate, but ...
  - `encoding_rate_control`: `MoviePipelineMP4EncodeRateControlMode` — [Read-Write] Specifies the bitrate control method used by the encoder. Quality lets the user target ...
  - `include_audio`: `bool` — [Read-Write] If true, audio will be included in the video file. (bool)
  - `max_bitrate_in_mbps`: `float` — [Read-Write] When using VariableBitRate_Constrained, what is the maximum bitrate that the encoder ca...

### `unreal.MoviePipelineMP4EncodeLevel`
Inherits: `EnumBase` | Header: `MoviePipelineMP4EncoderCommon.h`

A higher level generally results in a higher quality for a given bitrate, but a higher level requires newer encoders and decoders. Auto will let the encoder choose an appropriate one given the other p...

**Properties** (18):
  - `AUTO`: `MoviePipelineMP4EncodeLevel = Ellipsis` — Let the encoder choose the best level based on other parameters. 0
  - `LEVEL1`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 10
  - `LEVEL1_1`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 11
  - `LEVEL1_2`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 12
  - `LEVEL1_3`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 13
  - `LEVEL1_B`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 11
  - `LEVEL2`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 20
  - `LEVEL2_1`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 21
  - `LEVEL2_2`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 22
  - `LEVEL3`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 30
  - `LEVEL3_1`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 31
  - `LEVEL3_2`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 32
  - `LEVEL4`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 40
  - `LEVEL4_1`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 41
  - `LEVEL4_2`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 42
  - `LEVEL5`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 50
  - `LEVEL5_1`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 51
  - `LEVEL5_2`: `MoviePipelineMP4EncodeLevel = Ellipsis` — 52

### `unreal.MoviePipelineMP4EncodeProfile`
Inherits: `EnumBase` | Header: `MoviePipelineMP4EncoderCommon.h`

Which encoding profile should be used for encoding? A higher profile usually means better quality for a given bitrate, but may not play back on older hardware.

**Properties** (3):
  - `BASELINE`: `MoviePipelineMP4EncodeProfile = Ellipsis` — 0
  - `HIGH`: `MoviePipelineMP4EncodeProfile = Ellipsis` — 2
  - `MAIN`: `MoviePipelineMP4EncodeProfile = Ellipsis` — 1

### `unreal.MoviePipelineMP4EncodeRateControlMode`
Inherits: `EnumBase` | Header: `MoviePipelineMP4EncoderCommon.h`

EMovie Pipeline MP4Encode Rate Control Mode

**Properties** (5):
  - `CONSTANT_BIT_RATE`: `MoviePipelineMP4EncodeRateControlMode = Ellipsis` — Uses a variable bitrate that attempts to achieve a given mean bitrate, but can specify a maximum bit...
  - `CONSTANT_QP`: `MoviePipelineMP4EncodeRateControlMode = Ellipsis` — Automatically chooses a bit rate to target the given quality. Valid ranges are 16-51. 0
  - `QUALITY`: `MoviePipelineMP4EncodeRateControlMode = Ellipsis` — Automatically chooses a bit rate to target the given quality. Valid ranges are 16-51. 1
  - `VARIABLE_BIT_RATE_CONSTRAINED`: `MoviePipelineMP4EncodeRateControlMode = Ellipsis` — Uses a variable bitrate that attempts to achieve a given mean bitrate, but can use a higher bitrate ...
  - `VARIABLE_BIT_RATE_UNCONSTRAINED`: `MoviePipelineMP4EncodeRateControlMode = Ellipsis` — Attempts to achieve a given mean bitrate for every frame. Can result in higher bitrates than necessa...
