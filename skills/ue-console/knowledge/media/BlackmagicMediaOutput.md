# UE Python API — BlackmagicMediaOutput Module

**6 types** from the `BlackmagicMediaOutput` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BlackmagicMediaCapture`, `BlackmagicMediaOutput`, `BlackmagicMediaAudioOutputChannelCount`, `BlackmagicMediaOutputAudioBitDepth`, `BlackmagicMediaOutputAudioSampleRate`, `BlackmagicMediaOutputPixelFormat`

---

## Classes

### `unreal.BlackmagicMediaCapture`
Inherits: `MediaCapture` | Header: `BlackmagicMediaCapture.h`

Output Media for Blackmagic streams. The output format could be any of EBlackmagicMediaOutputPixelFormat.

### `unreal.BlackmagicMediaOutput`
Inherits: `MediaOutput` | Header: `BlackmagicMediaOutput.h`

Output information for a MediaCapture. note: âFrame Buffer Pixel Formatâ must be set to at least 8 bits of alpha to enabled the Key. note: âEnable alpha channel support in post-processingâ mus...

**Properties** (10):
  - `audio_bit_depth`: `BlackmagicMediaOutputAudioBitDepth` — [Read-Write] Bit depth of each audio sample. (BlackmagicMediaOutputAudioBitDepth)
  - `audio_buffer_size`: `int` — [Read-Write] Size of the buffer that holds rendered audio samples, a bigger buffer will produce an o...
  - `audio_sample_rate`: `BlackmagicMediaOutputAudioSampleRate` — [Read-Write] Sample rate of the audio output. (BlackmagicMediaOutputAudioSampleRate)
  - `encode_timecode_in_texel`: `bool` — [Read-Write] Burn Frame Timecode on the output without any frame number clipping. (bool)
  - `output_audio`: `bool` — [Read-Write] Whether to capture and output audio from the engine. (bool)
  - `output_channel_count`: `BlackmagicMediaAudioOutputChannelCount` — [Read-Write] Number of audio channels to output. (BlackmagicMediaAudioOutputChannelCount)
  - `pixel_format`: `BlackmagicMediaOutputPixelFormat` — [Read-Write] Native data format internally used by the device before being converted to SDI/HDMI sig...
  - `timecode_format`: `MediaIOTimecodeFormat` — [Read-Write] Whether to embed the Engineâs timecode to the output frame. (MediaIOTimecodeFormat)
  - `use_multithreaded_scheduling`: `bool` — [Read-Write] Whether to use multi threaded scheduling which should improve performance when outputti...
  - `wait_for_sync_event`: `bool` — [Read-Write] Try to maintain a the engine âGenlockâ with the VSync signal. (bool)

### `unreal.BlackmagicMediaAudioOutputChannelCount`
Inherits: `EnumBase` | Header: `BlackmagicMediaOutput.h`

EBlackmagic Media Audio Output Channel Count

**Properties** (3):
  - `CH_16`: `BlackmagicMediaAudioOutputChannelCount = Ellipsis` — 16
  - `CH_2`: `BlackmagicMediaAudioOutputChannelCount = Ellipsis` — 2
  - `CH_8`: `BlackmagicMediaAudioOutputChannelCount = Ellipsis` — 8

### `unreal.BlackmagicMediaOutputAudioBitDepth`
Inherits: `EnumBase` | Header: `BlackmagicMediaOutput.h`

EBlackmagic Media Output Audio Bit Depth

**Properties** (2):
  - `SIGNED_16_BITS`: `BlackmagicMediaOutputAudioBitDepth = Ellipsis` — 16
  - `SIGNED_32_BITS`: `BlackmagicMediaOutputAudioBitDepth = Ellipsis` — 32

### `unreal.BlackmagicMediaOutputAudioSampleRate`
Inherits: `EnumBase` | Header: `BlackmagicMediaOutput.h`

EBlackmagic Media Output Audio Sample Rate

**Properties** (1):
  - `SR_48K`: `BlackmagicMediaOutputAudioSampleRate = Ellipsis` — 48000

### `unreal.BlackmagicMediaOutputPixelFormat`
Inherits: `EnumBase` | Header: `BlackmagicMediaOutput.h`

Native data format.

**Properties** (2):
  - `PF_10BIT_YUV`: `BlackmagicMediaOutputPixelFormat = Ellipsis` — 1
  - `PF_8BIT_YUV`: `BlackmagicMediaOutputPixelFormat = Ellipsis` — 0
