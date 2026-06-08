# UE Python API — WaveTable Module

**9 types** from the `WaveTable` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `WaveTableBankEntry`, `WaveTableData`, `WaveTableSettings`, `WaveTableTransform`, `WaveTableBank`, `WaveTableBitDepth`, `WaveTableCurve`, `WaveTableResolution`, `WaveTableSamplingMode`

---

## Classes

### `unreal.WaveTableBankEntry`
Inherits: `StructBase` | Header: `WaveTableBank.h`

Wave Table Bank Entry

### `unreal.WaveTableData`
Inherits: `StructBase` | Header: `WaveTable.h`

Serialized WaveTable data, that supports multiple bit depth formats.

### `unreal.WaveTableSettings`
Inherits: `StructBase` | Header: `WaveTableSettings.h`

Wave Table Settings

### `unreal.WaveTableTransform`
Inherits: `StructBase` | Header: `WaveTableTransform.h`

Wave Table Transform

**Properties** (3):
  - `curve`: `WaveTableCurve` — [Read-Write] The curve to apply when transforming the output. (WaveTableCurve)
  - `curve_shared`: `CurveFloat` — [Read-Write] Asset curve reference to apply if output curve type is set to âShared.â (CurveFloat...
  - `scalar`: `float` — [Read-Write] When curve set to log, exponential or exponential inverse, value is factor âbâ in f...

### `unreal.WaveTableBank`
Inherits: `Object` | Header: `WaveTableBank.h`

Wave Table Bank

### `unreal.WaveTableBitDepth`
Inherits: `EnumBase` | Header: `WaveTable.h`

namespace WaveTable

**Properties** (2):
  - `IEEE_FLOAT`: `WaveTableBitDepth = Ellipsis` — Higher precision and faster operative performance
(engine operates at 32-bit) at the cost of twice t...
  - `PCM_16`: `WaveTableBitDepth = Ellipsis` — Lower resolution and marginal performance cost with
conversion overhead (engine operates on 32-bit)
...

### `unreal.WaveTableCurve`
Inherits: `EnumBase` | Header: `WaveTableSettings.h`

EWave Table Curve

**Properties** (11):
  - `CUSTOM`: `WaveTableCurve = Ellipsis` — Design a custom curve unique to the owning transform 9
  - `EXP`: `WaveTableCurve = Ellipsis` — 2
  - `EXP_INVERSE`: `WaveTableCurve = Ellipsis` — 3
  - `FILE`: `WaveTableCurve = Ellipsis` — Generate WaveTable from audio file 10
  - `LINEAR`: `WaveTableCurve = Ellipsis` — 0
  - `LINEAR_INV`: `WaveTableCurve = Ellipsis` — 1
  - `LOG`: `WaveTableCurve = Ellipsis` — 4
  - `SHARED`: `WaveTableCurve = Ellipsis` — Reference a shared curve asset 8
  - `SIN`: `WaveTableCurve = Ellipsis` — 5
  - `SIN_FULL`: `WaveTableCurve = Ellipsis` — 6
  - `S_CURVE`: `WaveTableCurve = Ellipsis` — 7

### `unreal.WaveTableResolution`
Inherits: `EnumBase` | Header: `WaveTableSettings.h`

namespace WaveTable

**Properties** (11):
  - `MAXIMUM`: `WaveTableResolution = Ellipsis` — Takes largest source file length (if WaveTable was produced
by a file, PCM stream, SoundWave, etc.) ...
  - `RES_1024`: `WaveTableResolution = Ellipsis` — 10
  - `RES_128`: `WaveTableResolution = Ellipsis` — 7
  - `RES_16`: `WaveTableResolution = Ellipsis` — 4
  - `RES_2048`: `WaveTableResolution = Ellipsis` — 11
  - `RES_256`: `WaveTableResolution = Ellipsis` — 8
  - `RES_32`: `WaveTableResolution = Ellipsis` — 5
  - `RES_4096`: `WaveTableResolution = Ellipsis` — 12
  - `RES_512`: `WaveTableResolution = Ellipsis` — 9
  - `RES_64`: `WaveTableResolution = Ellipsis` — 6
  - `RES_8`: `WaveTableResolution = Ellipsis` — 3

### `unreal.WaveTableSamplingMode`
Inherits: `EnumBase` | Header: `WaveTableSettings.h`

SamplingMode of a given bank or collection of WaveTables

**Properties** (2):
  - `FIXED_RESOLUTION`: `WaveTableSamplingMode = Ellipsis` — Enforces resolution (i.e. size of all tables), uniformly resampling
all tables in the collection to ...
  - `FIXED_SAMPLE_RATE`: `WaveTableSamplingMode = Ellipsis` — Enforces fixed sample rate for all members in the bank/collection,
enabling them to be of unique dur...
