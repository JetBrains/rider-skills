# UE Python API — AudioAnalyzer Module

**5 types** from the `AudioAnalyzer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AudioAnalyzer`, `AudioAnalyzerAssetBase`, `AudioAnalyzerNRT`, `AudioAnalyzerNRTSettings`, `AudioAnalyzerSettings`

---

## Classes

### `unreal.AudioAnalyzer`
Inherits: `Object` | Header: `AudioAnalyzer.h`

UAudioAnalyzer

**Methods** (2):
  - `start_analyzing(world_context_object, audio_bus_to_analyze)` -> `None` — Starts analyzing audio from the given audio bus. Optionally override the audio bus desired to analyze.
  - `stop_analyzing(world_context_object = None)` -> `None` — Stops analyzing audio.

### `unreal.AudioAnalyzerAssetBase`
Inherits: `Object` | Header: `AudioAnalyzerAsset.h`

UAudioAnalyzerAssetBase

### `unreal.AudioAnalyzerNRT`
Inherits: `AudioAnalyzerAssetBase` | Header: `AudioAnalyzerNRT.h`

UAudioAnalyzerNRT

**Properties** (2):
  - `duration_in_seconds`: `float` [Read-Only] — [Read-Only] The duration of the analyzed audio in seconds. (float)
  - `sound`: `SoundWave` [Read-Only] — [Read-Only] The USoundWave which is analyzed. (SoundWave)

### `unreal.AudioAnalyzerNRTSettings`
Inherits: `AudioAnalyzerAssetBase` | Header: `AudioAnalyzerNRT.h`

UAudioAnalyzerNRTSettings

### `unreal.AudioAnalyzerSettings`
Inherits: `AudioAnalyzerAssetBase` | Header: `AudioAnalyzer.h`

UAudioAnalyzerSettings
