# UE Python API — AvidDNxMedia Module

**4 types** from the `AvidDNxMedia` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvidDNxEncoderProtocol`, `MovieGraphAvidDNxHRNode`, `MoviePipelineAvidDNxOutput`, `AvidDNxEncoderQuality`

---

## Classes

### `unreal.AvidDNxEncoderProtocol`
Inherits: `FrameGrabberProtocol` | Header: `AvidDNxEncoderProtocol.h`

Avid DNx Encoder Protocol

### `unreal.MovieGraphAvidDNxHRNode`
Inherits: `MovieGraphVideoOutputNode` | Header: `MovieGraphAvidDNxHRNode.h`

A node which can output Avid DNxHR movies.

**Properties** (6):
  - `ocio_configuration`: `OpenColorIODisplayConfiguration` — [Read-Write] OCIO configuration/transform settings. Note: There are differences from the previous im...
  - `ocio_context`: `None` — [Read-Write] OCIO context of key-value string pairs, typically used to apply shot-specific looks (su...
  - `override_ocio_configuration`: `bool` — [Read-Write] (bool)
  - `override_ocio_context`: `bool` — [Read-Write] (bool)
  - `override_quality`: `bool` — [Read-Write] (bool)
  - `quality`: `AvidDNxEncoderQuality` — [Read-Write] The quality that the movie will be encoded with. (AvidDNxEncoderQuality)

### `unreal.MoviePipelineAvidDNxOutput`
Inherits: `MoviePipelineVideoOutputBase` | Header: `MoviePipelineAvidDNxOutput.h`

Movie Pipeline Avid DNx Output

**Properties** (2):
  - `number_of_encoding_threads`: `int` — [Read-Write] How many threads should the AvidDNx Encoders use to encode frames? (int32)
  - `use_compression`: `bool` — [Read-Write] Should we use a lossy compression for the output? (bool)

### `unreal.AvidDNxEncoderQuality`
Inherits: `EnumBase` | Header: `AvidDNxEncoder.h`

Quality settings available for the Avid DNx encoder.

**Properties** (5):
  - `HQX_10BIT`: `AvidDNxEncoderQuality = Ellipsis` — 2:2 YCbCr. 1271 High quality extended, 10-bit 4
  - `HQ_8BIT`: `AvidDNxEncoderQuality = Ellipsis` — 2:2 YCbCr. 1272 High quality, 8-bit 4
  - `LB_8BIT`: `AvidDNxEncoderQuality = Ellipsis` — 2:2 YCbCr. 1274 Low bandwidth, 8-bit 4
  - `RGB444_12BIT`: `AvidDNxEncoderQuality = Ellipsis` — 4:4 RGB. 1270 Cinema quality, 12-bit 4
  - `SQ_8BIT`: `AvidDNxEncoderQuality = Ellipsis` — 2:2 YCbCr. 1273 Standard quality, 8-bit 4
