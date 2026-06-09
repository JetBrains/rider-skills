# UE Python API — CaptureDataUtils Module

**3 types** from the `CaptureDataUtils` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CaptureTimecodeInfo`, `ImageSequenceTimecodeUtils`, `SoundWaveTimecodeUtils`

---

## Classes

### `unreal.CaptureTimecodeInfo`
Inherits: `Object` | Header: `CaptureTimecodeInfo.h`

Capture Timecode Info

**Properties** (2):
  - `frame_rate`: `FrameRate` — [Read-Write] (FrameRate)
  - `timecode`: `Timecode` — [Read-Write] (Timecode)

### `unreal.ImageSequenceTimecodeUtils`
Inherits: `Object` | Header: `ImageSequenceTimecodeUtils.h`

Image Sequence Timecode Utils

**Methods** (6):
  - `get_frame_rate(image_sequence)` -> `FrameRate` [classmethod] — Get Frame Rate
  - `get_frame_rate_string(image_sequence)` -> `str` [classmethod] — Get Frame Rate String
  - `get_timecode(image_sequence)` -> `Timecode` [classmethod] — Get Timecode
  - `get_timecode_string(image_sequence)` -> `str` [classmethod] — Get Timecode String
  - `set_timecode_info(timecode, frame_rate, image_sequence)` -> `None` [classmethod] — Set Timecode Info
  - `set_timecode_info_string(timecode, frame_rate, image_sequence)` -> `None` [classmethod] — Set Timecode Info String

### `unreal.SoundWaveTimecodeUtils`
Inherits: `Object` | Header: `SoundWaveTimecodeUtils.h`

Sound Wave Timecode Utils

**Methods** (3):
  - `get_frame_rate(sound_wave)` -> `FrameRate` [classmethod] — Get Frame Rate
  - `get_timecode(sound_wave)` -> `Timecode` [classmethod] — Get Timecode
  - `set_timecode_info(timecode, frame_rate, out_sound_wave)` -> `None` [classmethod] — Set Timecode Info
