# UE Python API — AjaMediaOutput Module

**6 types** from the `AjaMediaOutput` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AjaFrameGrabberProtocol`, `AjaMediaCapture`, `AjaMediaOutput`, `AjaMediaOutputAudioSampleRate`, `AjaMediaOutputChannelConfiguration`, `AjaMediaOutputPixelFormat`

---

## Classes

### `unreal.AjaFrameGrabberProtocol`
Inherits: `MovieSceneImageCaptureProtocolBase` | Header: `AjaMediaFrameGrabberProtocol.h`

Aja Frame Grabber Protocol

**Properties** (1):
  - `media_output`: `SoftObjectPath` — [Read-Write] AJA Setting to use for the FrameGrabberProtocol (SoftObjectPath)

### `unreal.AjaMediaCapture`
Inherits: `MediaCapture` | Header: `AjaMediaCapture.h`

Output Media for AJA streams. The output format could be any of EAjaMediaOutputPixelFormat.

### `unreal.AjaMediaOutput`
Inherits: `MediaOutput` | Header: `AjaMediaOutput.h`

Output information for an aja media capture. note: âFrame Buffer Pixel Formatâ must be set to at least 8 bits of alpha to enabled the Key. note: âEnable alpha channel support in post-processingâ...

**Properties** (10):
  - `audio_buffer_size`: `int` — [Read-Write] Size of the buffer that holds rendered audio samples, a bigger buffer will produce a mo...
  - `audio_sample_rate`: `AjaMediaOutputAudioSampleRate` — [Read-Write] Audio output sample rate. (AjaMediaOutputAudioSampleRate)
  - `encode_timecode_in_texel`: `bool` — [Read-Write] Burn Frame Timecode on the output without any frame number clipping. (bool)
  - `num_output_audio_channels`: `AjaMediaOutputChannelConfiguration` — [Read-Write] Number of audio channels used when output audio on the card. (AjaMediaOutputChannelConf...
  - `output_audio`: `bool` — [Read-Write] Whether to capture and output audio from the engine. (bool)
  - `output_audio_on_audio_thread`: `bool` — [Read-Write] Whether to output audio on the audio thread instead of the rendering thread. Only avail...
  - `output_with_auto_circulating`: `bool` — [Read-Write] The output of the Audio, Ancillary and/or video will be perform at the same time.
This ...
  - `pixel_format`: `AjaMediaOutputPixelFormat` — [Read-Write] Native data format internally used by the device before being converted to SDI/HDMI sig...
  - `timecode_format`: `MediaIOTimecodeFormat` — [Read-Write] Whether to embed the Engineâs timecode to the output frame. (MediaIOTimecodeFormat)
  - `wait_for_sync_event`: `bool` — [Read-Write] Try to maintain a the engine âGenlockâ with the VSync signal. (bool)

### `unreal.AjaMediaOutputAudioSampleRate`
Inherits: `EnumBase` | Header: `AjaMediaOutput.h`

EAja Media Output Audio Sample Rate

**Properties** (1):
  - `SR_48K`: `AjaMediaOutputAudioSampleRate = Ellipsis` — 48000

### `unreal.AjaMediaOutputChannelConfiguration`
Inherits: `EnumBase` | Header: `AjaMediaOutput.h`

Number of output audio channels

**Properties** (3):
  - `CH_16`: `AjaMediaOutputChannelConfiguration = Ellipsis` — 16
  - `CH_6`: `AjaMediaOutputChannelConfiguration = Ellipsis` — 6
  - `CH_8`: `AjaMediaOutputChannelConfiguration = Ellipsis` — 8

### `unreal.AjaMediaOutputPixelFormat`
Inherits: `EnumBase` | Header: `AjaMediaOutput.h`

Native data format.

**Properties** (2):
  - `PF_10BIT_YUV`: `AjaMediaOutputPixelFormat = Ellipsis` — 1
  - `PF_8BIT_YUV`: `AjaMediaOutputPixelFormat = Ellipsis` — 0
