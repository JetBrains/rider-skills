# UE Python API — HarmonixDsp Module

**30 types** from the `HarmonixDsp` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AdsrSettings`, `BiquadFilterSettings`, `FusionPatchData`, `FusionPatchSettings`, `HarmonixAudioAnalyzerOutputSettings`, `HarmonixFFTAnalyzerResults`, `HarmonixFFTAnalyzerSettings`, `KeyzoneSettings`, `LfoSettings`, `ModulatorSettings`, `PannerDetails`, `PitchShifterName`, `PortamentoSettings`, `StreamingChannelParams`, `StreamingChannelParamsArray`, `TimeStretchConfig`, `TrackChannelInfo`, `TypedParameter`, `FusionPatch`, `AdsrTarget`, ... (30 total)

---

## Classes

### `unreal.AdsrSettings`
Inherits: `StructBase` | Header: `AdsrSettings.h`

Adsr Settings

### `unreal.BiquadFilterSettings`
Inherits: `StructBase` | Header: `BiquadFilterSettings.h`

Biquad Filter Settings

### `unreal.FusionPatchData`
Inherits: `StructBase` | Header: `FusionPatch.h`

User facing data of FusionPatch

### `unreal.FusionPatchSettings`
Inherits: `StructBase` | Header: `FusionPatchSettings.h`

Fusion Patch Settings

### `unreal.HarmonixAudioAnalyzerOutputSettings`
Inherits: `StructBase` | Header: `OutputSettings.h`

Harmonix Audio Analyzer Output Settings

**Properties** (4):
  - `fall_ms`: `float` — [Read-Write] (float)
  - `max_decibels`: `float` — [Read-Write] (float)
  - `range_decibels`: `float` — [Read-Write] (float)
  - `rise_ms`: `float` — [Read-Write] (float)

### `unreal.HarmonixFFTAnalyzerResults`
Inherits: `StructBase` | Header: `FFTAnalyzer.h`

Harmonix FFTAnalyzer Results

**Properties** (1):
  - `spectrum`: `None` [Read-Only] — [Read-Only] (Array[float])

### `unreal.HarmonixFFTAnalyzerSettings`
Inherits: `StructBase` | Header: `FFTAnalyzer.h`

Harmonix FFTAnalyzer Settings

### `unreal.KeyzoneSettings`
Inherits: `StructBase` | Header: `KeyzoneSettings.h`

Keyzone Settings

### `unreal.LfoSettings`
Inherits: `StructBase` | Header: `LfoSettings.h`

Lfo Settings

### `unreal.ModulatorSettings`
Inherits: `StructBase` | Header: `ModulatorSettings.h`

Modulator Settings

### `unreal.PannerDetails`
Inherits: `StructBase` | Header: `PannerDetails.h`

Panner Details

### `unreal.PitchShifterName`
Inherits: `StructBase` | Header: `PitchShifterName.h`

struct with detail customization for drop down selection of registered factories

### `unreal.PortamentoSettings`
Inherits: `StructBase` | Header: `PortamentoSettings.h`

Portamento Settings

### `unreal.StreamingChannelParams`
Inherits: `StructBase` | Header: `StandardStream.h`

Streaming Channel Params

### `unreal.StreamingChannelParamsArray`
Inherits: `StructBase` | Header: `TrackChannelInfo.h`

Streaming Channel Params Array

### `unreal.TimeStretchConfig`
Inherits: `StructBase` | Header: `StretcherAndPitchShifter.h`

Time Stretch Config

### `unreal.TrackChannelInfo`
Inherits: `StructBase` | Header: `TrackChannelInfo.h`

Track Channel Info

### `unreal.TypedParameter`
Inherits: `StructBase` | Header: `TypedParameter.h`

Wrapper for FVariant, an extensible union of multiple types

### `unreal.FusionPatch`
Inherits: `Object` | Header: `FusionPatch.h`

Fusion Patch

**Properties** (1):
  - `fusion_patch_data`: `FusionPatchData` [Read-Only] — [Read-Only] (FusionPatchData)

### `unreal.AdsrTarget`
Inherits: `EnumBase` | Header: `AdsrSettings.h`

EAdsr Target

**Properties** (2):
  - `FILTER_FREQ`: `AdsrTarget = Ellipsis` — 1
  - `VOLUME`: `AdsrTarget = Ellipsis` — 0

### `unreal.BiquadFilterType`
Inherits: `EnumBase` | Header: `BiquadFilterSettings.h`

EBiquad Filter Type

**Properties** (6):
  - `BAND_PASS`: `BiquadFilterType = Ellipsis` — 2
  - `HIGH_PASS`: `BiquadFilterType = Ellipsis` — 1
  - `HIGH_SHELF`: `BiquadFilterType = Ellipsis` — 5
  - `LOW_PASS`: `BiquadFilterType = Ellipsis` — 0
  - `LOW_SHELF`: `BiquadFilterType = Ellipsis` — 4
  - `PEAKING`: `BiquadFilterType = Ellipsis` — 3

### `unreal.FusionPatchAudioLoadResult`
Inherits: `EnumBase` | Header: `FusionPatch.h`

EFusion Patch Audio Load Result

**Properties** (3):
  - `CANCELLED`: `FusionPatchAudioLoadResult = Ellipsis` — 2
  - `FAIL`: `FusionPatchAudioLoadResult = Ellipsis` — 1
  - `SUCCESS`: `FusionPatchAudioLoadResult = Ellipsis` — 0

### `unreal.KeyzoneSelectMode`
Inherits: `EnumBase` | Header: `FusionPatchSettings.h`

EKeyzone Select Mode

**Properties** (4):
  - `CYCLE`: `KeyzoneSelectMode = Ellipsis` — 3
  - `LAYERS`: `KeyzoneSelectMode = Ellipsis` — 0
  - `RANDOM`: `KeyzoneSelectMode = Ellipsis` — 1
  - `RANDOM_WITH_REPETITION`: `KeyzoneSelectMode = Ellipsis` — 2

### `unreal.LfoTarget`
Inherits: `EnumBase` | Header: `LfoSettings.h`

ELfo Target

**Properties** (3):
  - `FILTER_FREQ`: `LfoTarget = Ellipsis` — 2
  - `PAN`: `LfoTarget = Ellipsis` — 0
  - `PITCH`: `LfoTarget = Ellipsis` — 1

### `unreal.ModulatorTarget`
Inherits: `EnumBase` | Header: `ModulatorSettings.h`

EModulator Target

**Properties** (2):
  - `PITCH`: `ModulatorTarget = Ellipsis` — 1
  - `START_POINT`: `ModulatorTarget = Ellipsis` — 0

### `unreal.PannerMode`
Inherits: `EnumBase` | Header: `PannerDetails.h`

EPanner Mode

**Properties** (5):
  - `DIRECT_ASSIGNMENT`: `PannerMode = Ellipsis` — 4
  - `LEGACY_STEREO`: `PannerMode = Ellipsis` — 0
  - `POLAR_SURROUND`: `PannerMode = Ellipsis` — 3
  - `STEREO`: `PannerMode = Ellipsis` — 1
  - `SURROUND`: `PannerMode = Ellipsis` — 2

### `unreal.PortamentoMode`
Inherits: `EnumBase` | Header: `PortamentoSettings.h`

EPortamento Mode

**Properties** (2):
  - `LEGATO`: `PortamentoMode = Ellipsis` — 0
  - `PERSISTENT`: `PortamentoMode = Ellipsis` — 1

### `unreal.TimeSyncOption`
Inherits: `EnumBase` | Header: `TimeSyncOption.h`

ETime Sync Option

**Properties** (3):
  - `NONE`: `TimeSyncOption = Ellipsis` — Time setting will always be as authored 0
  - `SPEED_SCALE`: `TimeSyncOption = Ellipsis` — Time setting is multiplied by the current music playback speed. 2
  - `TEMPO_SYNC`: `TimeSyncOption = Ellipsis` — Time setting is interpreted as a multiple of quarter note(s) and kept in sync with the current tempo...

### `unreal.WaveShape`
Inherits: `EnumBase` | Header: `LfoSettings.h`

EWave Shape

**Properties** (6):
  - `RANDOM`: `WaveShape = Ellipsis` — 5
  - `SAW_DOWN`: `WaveShape = Ellipsis` — 3
  - `SAW_UP`: `WaveShape = Ellipsis` — 2
  - `SINE`: `WaveShape = Ellipsis` — 0
  - `SQUARE`: `WaveShape = Ellipsis` — 1
  - `TRIANGLE`: `WaveShape = Ellipsis` — 4

### `unreal.OnFusionPatchLoadComplete`
Inherits: `DelegateBase` | Header: `FusionPatch.h`

Called when a load request for a sound has completed.
