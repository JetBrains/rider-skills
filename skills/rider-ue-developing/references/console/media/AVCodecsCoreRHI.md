# UE Python API — AVCodecsCoreRHI Module

**12 types** from the `AVCodecsCoreRHI` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SimpleAudioEncoderConfig`, `SimpleAudioPacket`, `SimpleVideoEncoderConfig`, `SimpleVideoPacket`, `SimpleAudioEncoder`, `SimpleAVHelper`, `SimpleVideoDecoder`, `SimpleVideoEncoder`, `SimpleVideoHelper`, `SimpleAudioCodec`, `SimpleAVPreset`, `SimpleVideoCodec`

---

## Classes

### `unreal.SimpleAudioEncoderConfig`
Inherits: `StructBase` | Header: `SimpleAudioEncoder.h`

Simple Audio Encoder Config

**Properties** (3):
  - `bitrate`: `int` — [Read-Write] (int32)
  - `num_channels`: `int` — [Read-Write] (int32)
  - `samplerate`: `int` — [Read-Write] (int32)

### `unreal.SimpleAudioPacket`
Inherits: `StructBase` | Header: `SimpleAudio.h`

Simple Audio Packet

### `unreal.SimpleVideoEncoderConfig`
Inherits: `StructBase` | Header: `SimpleVideoEncoder.h`

Simple Video Encoder Config

**Properties** (5):
  - `height`: `int` — [Read-Write] (int32)
  - `max_bitrate`: `int` — [Read-Write] (int32)
  - `target_bitrate`: `int` — [Read-Write] (int32)
  - `target_framerate`: `int` — [Read-Write] (int32)
  - `width`: `int` — [Read-Write] (int32)

### `unreal.SimpleVideoPacket`
Inherits: `StructBase` | Header: `SimpleVideo.h`

Simple Video Packet

### `unreal.SimpleAudioEncoder`
Inherits: `Object` | Header: `SimpleAudioEncoder.h`

Simple Audio Encoder

**Methods** (10):
  - `close()` -> `None` — Close
  - `get_codec()` -> `SimpleAudioCodec` — Get Codec
  - `get_config()` -> `SimpleAudioEncoderConfig` — Get Config
  - `is_async()` -> `bool` — Is Async
  - `is_open()` -> `bool` — Is Open
  - `open(codec, config, asynchronous)` -> `bool` — Open
  - `receive_packet()` -> `SimpleAudioPacket or None` — Receive Packet
  - `receive_packets()` -> `Array [ SimpleAudioPacket ]` — Receive Packets
  - `send_frame_float(resource, timestamp, num_samples, sample_duration)` -> `bool` — Send Frame Float
  - `set_config(new_config)` -> `None` — Set Config

### `unreal.SimpleAVHelper`
Inherits: `Object` | Header: `SimpleAV.h`

Simple AVHelper

### `unreal.SimpleVideoDecoder`
Inherits: `Object` | Header: `SimpleVideoDecoder.h`

Simple Video Decoder

**Methods** (7):
  - `close()` -> `None` — Close
  - `get_codec()` -> `SimpleVideoCodec` — Get Codec
  - `is_async()` -> `bool` — Is Async
  - `is_open()` -> `bool` — Is Open
  - `open(codec, asynchronous)` -> `bool` — Open
  - `receive_frame(resource)` -> `bool` — Receive Frame
  - `send_packet(packet)` -> `bool` — Send Packet

### `unreal.SimpleVideoEncoder`
Inherits: `Object` | Header: `SimpleVideoEncoder.h`

Simple Video Encoder

**Methods** (11):
  - `close()` -> `None` — Close
  - `get_codec()` -> `SimpleVideoCodec` — Get Codec
  - `get_config()` -> `SimpleVideoEncoderConfig` — Get Config
  - `is_async()` -> `bool` — Is Async
  - `is_open()` -> `bool` — Is Open
  - `open(codec, config, asynchronous)` -> `bool` — Open
  - `receive_packet()` -> `SimpleVideoPacket or None` — Receive Packet
  - `receive_packets()` -> `Array [ SimpleVideoPacket ]` — Receive Packets
  - `send_frame_render_target(resource, timestamp, force_keyframe = False)` -> `bool` — Send Frame Render Target
  - `send_frame_texture(resource, timestamp, force_keyframe = False)` -> `bool` — Send Frame Texture
  - `set_config(new_config)` -> `None` — Set Config

### `unreal.SimpleVideoHelper`
Inherits: `SimpleAVHelper` | Header: `SimpleVideo.h`

Simple Video Helper

**Methods** (1):
  - `share_render_target2d(render_target)` -> `None` [classmethod] — Share Render Target 2D

### `unreal.SimpleAudioCodec`
Inherits: `EnumBase` | Header: `SimpleAudio.h`

ESimple Audio Codec

**Properties** (1):
  - `AAC`: `SimpleAudioCodec = Ellipsis` — 0

### `unreal.SimpleAVPreset`
Inherits: `EnumBase` | Header: `SimpleAV.h`

ESimple AVPreset

**Properties** (5):
  - `DEFAULT`: `SimpleAVPreset = Ellipsis` — 0
  - `HIGH_QUALITY`: `SimpleAVPreset = Ellipsis` — 3
  - `LOSSLESS`: `SimpleAVPreset = Ellipsis` — 4
  - `LOW_QUALITY`: `SimpleAVPreset = Ellipsis` — 2
  - `ULTRA_LOW_QUALITY`: `SimpleAVPreset = Ellipsis` — 1

### `unreal.SimpleVideoCodec`
Inherits: `EnumBase` | Header: `SimpleVideo.h`

ESimple Video Codec

**Properties** (2):
  - `H264`: `SimpleVideoCodec = Ellipsis` — 0
  - `H265`: `SimpleVideoCodec = Ellipsis` — 1
