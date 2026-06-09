# UE Python API — Harmonix Module

**2 types** from the `Harmonix` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `HarmonixBlueprintUtil`, `CalibratedMusicTimebase`

---

## Classes

### `unreal.HarmonixBlueprintUtil`
Inherits: `BlueprintFunctionLibrary` | Header: `Harmonix.h`

Harmonix Blueprint Util

**Methods** (8):
  - `get_measured_audio_latency_ms()` -> `float` [classmethod] — deprecated: âget_measured_audio_latency_msâ was renamed to âget_measured_user_experience_and_reaction_to_audio_ren...
  - `get_measured_user_experience_and_reaction_to_audio_render_offset_ms()` -> `float` [classmethod] — Get Measured User Experience and Reaction to Audio Render Offset Ms
  - `get_measured_video_latency_ms()` -> `float` [classmethod] — deprecated: âget_measured_video_latency_msâ was renamed to âget_measured_video_to_audio_render_offset_msâ.
  - `get_measured_video_to_audio_render_offset_ms()` -> `float` [classmethod] — Get Measured Video to Audio Render Offset Ms
  - `set_measured_audio_latency_ms(milliseconds: float)` -> `None` [classmethod] — deprecated: âset_measured_audio_latency_msâ was renamed to âset_measured_user_experience_and_reaction_to_audio_ren...
  - `set_measured_user_experience_and_reaction_to_audio_render_offset_ms(milliseconds)` -> `None` [classmethod] — Set Measured User Experience and Reaction to Audio Render Offset Ms
  - `set_measured_video_latency_ms(milliseconds: float)` -> `None` [classmethod] — deprecated: âset_measured_video_latency_msâ was renamed to âset_measured_video_to_audio_render_offset_msâ.
  - `set_measured_video_to_audio_render_offset_ms(milliseconds)` -> `None` [classmethod] — Set Measured Video to Audio Render Offset Ms

### `unreal.CalibratedMusicTimebase`
Inherits: `EnumBase` | Header: `MusicalTimebase.h`

ECalibrated Music Timebase

**Properties** (4):
  - `AUDIO_RENDER_TIME`: `CalibratedMusicTimebase = Ellipsis` — Tells you almost exactly where the audio renderer is right now (smoothed version of the jittery, raw...
  - `EXPERIENCED_TIME`: `CalibratedMusicTimebase = Ellipsis` — Tells you what the player is actually hearing & seeing this instant (when properly calibrated). Usef...
  - `RAW_AUDIO_RENDER_TIME`: `CalibratedMusicTimebase = Ellipsis` — Un-smoothed, jittery,
* raw position of the audio rendering. Only useful for debugging! 3 Tells you ...
  - `VIDEO_RENDER_TIME`: `CalibratedMusicTimebase = Ellipsis` — Tells you what you should be drawing right now so it appearsin sync with the music.(when properly ca...
