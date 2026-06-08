# UE Python API — PropertyAnimator Module

**30 types** from the `PropertyAnimator` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PropertyAnimatorCounterFormat`, `PropertyAnimatorCurveEasing`, `PropertyAnimatorBounce`, `PropertyAnimatorClock`, `PropertyAnimatorEaseCurve`, `PropertyAnimatorFloatContext`, `PropertyAnimatorNumericBase`, `PropertyAnimatorOscillate`, `PropertyAnimatorPresetLocation`, `PropertyAnimatorPresetRotation`, `PropertyAnimatorPresetScale`, `PropertyAnimatorPresetText`, `PropertyAnimatorPresetTextLocation`, `PropertyAnimatorPresetTextRotation`, `PropertyAnimatorPresetTextScale`, `PropertyAnimatorPresetTextVisibility`, `PropertyAnimatorPresetVisibility`, `PropertyAnimatorPulse`, `PropertyAnimatorRotatorContext`, `PropertyAnimatorSoundWave`, ... (30 total)

---

## Classes

### `unreal.PropertyAnimatorCounterFormat`
Inherits: `StructBase` | Header: `PropertyAnimatorCounter.h`

Format options used to convert a number to string

### `unreal.PropertyAnimatorCurveEasing`
Inherits: `StructBase` | Header: `PropertyAnimatorCurve.h`

Property Animator Curve Easing

**Properties** (1):
  - `ease_duration`: `float` — [Read-Write] (float)

### `unreal.PropertyAnimatorBounce`
Inherits: `PropertyAnimatorNumericBase` | Header: `PropertyAnimatorBounce.h`

Applies an additive bounce movement with various options on supported float properties

**Properties** (1):
  - `invert_effect`: `bool` — [Read-Write] Invert the effect result (bool)

### `unreal.PropertyAnimatorClock`
Inherits: `PropertyAnimatorTextBase` | Header: `PropertyAnimatorClock.h`

Animate supported string properties to display time

**Properties** (1):
  - `display_format`: `str` — [Read-Write] Display date time format:
%a - Weekday, eg) Sun
%A - Weekday, eg) Sunday
%w - Weekday, ...

### `unreal.PropertyAnimatorEaseCurve`
Inherits: `CurveFloat` | Header: `PropertyAnimatorEaseCurve.h`

Base class for property animator easing curves (0-1)

### `unreal.PropertyAnimatorFloatContext`
Inherits: `PropertyAnimatorCoreContext` | Header: `PropertyAnimatorFloatContext.h`

Property context used by animator for float/double properties

### `unreal.PropertyAnimatorNumericBase`
Inherits: `PropertyAnimatorCoreBase` | Header: `PropertyAnimatorNumericBase.h`

Animate supported numeric properties with various options

### `unreal.PropertyAnimatorOscillate`
Inherits: `PropertyAnimatorNumericBase` | Header: `PropertyAnimatorOscillate.h`

Applies an additive regular oscillate movement with various options on supported float properties

**Properties** (1):
  - `oscillate_function`: `PropertyAnimatorOscillateFunction` — [Read-Write] The oscillate function to feed current time elapsed (PropertyAnimatorOscillateFunction)

### `unreal.PropertyAnimatorPresetLocation`
Inherits: `PropertyAnimatorCorePropertyPreset` | Header: `PropertyAnimatorPresetLocation.h`

Preset for position properties (X, Y, Z) on scene component

### `unreal.PropertyAnimatorPresetRotation`
Inherits: `PropertyAnimatorCorePropertyPreset` | Header: `PropertyAnimatorPresetRotation.h`

Preset for position properties (Roll, Pitch, Yaw) on scene component

### `unreal.PropertyAnimatorPresetScale`
Inherits: `PropertyAnimatorCorePropertyPreset` | Header: `PropertyAnimatorPresetScale.h`

Preset for position properties (X, Y, Z) on scene component

### `unreal.PropertyAnimatorPresetText`
Inherits: `PropertyAnimatorCorePropertyPreset` | Header: `PropertyAnimatorPresetText.h`

Preset for text property on root text 3d component

### `unreal.PropertyAnimatorPresetTextLocation`
Inherits: `PropertyAnimatorPresetLocation` | Header: `PropertyAnimatorPresetTextLocation.h`

Preset for text character position properties (X, Y, Z) on scene component

### `unreal.PropertyAnimatorPresetTextRotation`
Inherits: `PropertyAnimatorPresetRotation` | Header: `PropertyAnimatorPresetTextRotation.h`

Preset for text character position properties (Roll, Pitch, Yaw) on scene component

### `unreal.PropertyAnimatorPresetTextScale`
Inherits: `PropertyAnimatorPresetScale` | Header: `PropertyAnimatorPresetTextScale.h`

Preset for text character position properties (X, Y, Z) on scene component

### `unreal.PropertyAnimatorPresetTextVisibility`
Inherits: `PropertyAnimatorPresetVisibility` | Header: `PropertyAnimatorPresetTextVisibility.h`

Preset for text character visibility on scene component

### `unreal.PropertyAnimatorPresetVisibility`
Inherits: `PropertyAnimatorCorePropertyPreset` | Header: `PropertyAnimatorPresetVisibility.h`

Preset for visibility properties on root scene component

### `unreal.PropertyAnimatorPulse`
Inherits: `PropertyAnimatorNumericBase` | Header: `PropertyAnimatorPulse.h`

Applies an additive pulse movement with various options on supported float properties

**Properties** (2):
  - `easing_function`: `PropertyAnimatorEasingFunction` — [Read-Write] The easing function to use to modify the base effect (PropertyAnimatorEasingFunction)
  - `easing_type`: `PropertyAnimatorEasingType` — [Read-Write] The type of effect for easing function (PropertyAnimatorEasingType)

### `unreal.PropertyAnimatorRotatorContext`
Inherits: `PropertyAnimatorCoreContext` | Header: `PropertyAnimatorRotatorContext.h`

Property context used by animator for rotator properties

### `unreal.PropertyAnimatorSoundWave`
Inherits: `PropertyAnimatorNumericBase` | Header: `PropertyAnimatorSoundWave.h`

Applies a sampled sound wave movement with various options on supported float properties

**Properties** (2):
  - `loop`: `bool` — [Read-Write] Whether we keep looping after the duration has been reached or before 0 (bool)
  - `sampled_sound_wave`: `SoundWave` [Read-Only] — [Read-Only] The sound wave to analyse
Cannot be switched at runtime, only in editor due to analyzer
...

### `unreal.PropertyAnimatorTextBase`
Inherits: `PropertyAnimatorCoreBase` | Header: `PropertyAnimatorTextBase.h`

Animate supported text properties with various options

### `unreal.PropertyAnimatorVectorContext`
Inherits: `PropertyAnimatorCoreContext` | Header: `PropertyAnimatorVectorContext.h`

Property context used by animator for vector properties

### `unreal.PropertyAnimatorWaveCurve`
Inherits: `CurveFloat` | Header: `PropertyAnimatorWaveCurve.h`

Base class for property animator wave curves (inf-inf)

### `unreal.PropertyAnimatorClockMode`
Inherits: `EnumBase` | Header: `PropertyAnimatorClock.h`

Mode supported for properties value

**Properties** (3):
  - `COUNTDOWN`: `PropertyAnimatorClockMode = Ellipsis` — Specified duration elapsing until it reaches 0 1
  - `LOCAL_TIME`: `PropertyAnimatorClockMode = Ellipsis` — Local time of the machine 0
  - `STOPWATCH`: `PropertyAnimatorClockMode = Ellipsis` — Shows the current time elapsed 2

### `unreal.PropertyAnimatorCounterRoundingMode`
Inherits: `EnumBase` | Header: `PropertyAnimatorCounter.h`

Enumerates all rounding mode available

**Properties** (4):
  - `CEIL`: `PropertyAnimatorCounterRoundingMode = Ellipsis` — 3
  - `FLOOR`: `PropertyAnimatorCounterRoundingMode = Ellipsis` — 2
  - `NONE`: `PropertyAnimatorCounterRoundingMode = Ellipsis` — 0
  - `ROUND`: `PropertyAnimatorCounterRoundingMode = Ellipsis` — 1

### `unreal.PropertyAnimatorCycleMode`
Inherits: `EnumBase` | Header: `PropertyAnimatorNumericBase.h`

EProperty Animator Cycle Mode

**Properties** (3):
  - `DO_ONCE`: `PropertyAnimatorCycleMode = Ellipsis` — Cycle only once then stop 1
  - `LOOP`: `PropertyAnimatorCycleMode = Ellipsis` — Cycle and repeat once we reached the end 2
  - `PING_PONG`: `PropertyAnimatorCycleMode = Ellipsis` — Cycle and reverse repeat 3

### `unreal.PropertyAnimatorEasingFunction`
Inherits: `EnumBase` | Header: `PropertyAnimatorShared.h`

EProperty Animator Easing Function

**Properties** (11):
  - `BACK`: `PropertyAnimatorEasingFunction = Ellipsis` — 8
  - `BOUNCE`: `PropertyAnimatorEasingFunction = Ellipsis` — 10
  - `CIRC`: `PropertyAnimatorEasingFunction = Ellipsis` — 7
  - `CUBIC`: `PropertyAnimatorEasingFunction = Ellipsis` — 3
  - `ELASTIC`: `PropertyAnimatorEasingFunction = Ellipsis` — 9
  - `EXPO`: `PropertyAnimatorEasingFunction = Ellipsis` — 6
  - `LINEAR`: `PropertyAnimatorEasingFunction = Ellipsis` — 0
  - `QUAD`: `PropertyAnimatorEasingFunction = Ellipsis` — 2
  - `QUART`: `PropertyAnimatorEasingFunction = Ellipsis` — 4
  - `QUINT`: `PropertyAnimatorEasingFunction = Ellipsis` — 5
  - `SINE`: `PropertyAnimatorEasingFunction = Ellipsis` — 1

### `unreal.PropertyAnimatorEasingType`
Inherits: `EnumBase` | Header: `PropertyAnimatorShared.h`

EProperty Animator Easing Type

**Properties** (3):
  - `IN`: `PropertyAnimatorEasingType = Ellipsis` — 0
  - `IN_OUT`: `PropertyAnimatorEasingType = Ellipsis` — 2
  - `OUT`: `PropertyAnimatorEasingType = Ellipsis` — 1

### `unreal.PropertyAnimatorOscillateFunction`
Inherits: `EnumBase` | Header: `PropertyAnimatorOscillate.h`

EProperty Animator Oscillate Function

**Properties** (6):
  - `COSINE`: `PropertyAnimatorOscillateFunction = Ellipsis` — 1
  - `INVERTED_SQUARE`: `PropertyAnimatorOscillateFunction = Ellipsis` — 3
  - `SAWTOOTH`: `PropertyAnimatorOscillateFunction = Ellipsis` — 4
  - `SINE`: `PropertyAnimatorOscillateFunction = Ellipsis` — 0
  - `SQUARE`: `PropertyAnimatorOscillateFunction = Ellipsis` — 2
  - `TRIANGLE`: `PropertyAnimatorOscillateFunction = Ellipsis` — 5

### `unreal.PropertyAnimatorWaveFunction`
Inherits: `EnumBase` | Header: `PropertyAnimatorShared.h`

EProperty Animator Wave Function

**Properties** (9):
  - `BOUNCE`: `PropertyAnimatorWaveFunction = Ellipsis` — 6
  - `COSINE`: `PropertyAnimatorWaveFunction = Ellipsis` — 1
  - `INVERTED_SQUARE`: `PropertyAnimatorWaveFunction = Ellipsis` — 3
  - `PERLIN`: `PropertyAnimatorWaveFunction = Ellipsis` — 8
  - `PULSE`: `PropertyAnimatorWaveFunction = Ellipsis` — 7
  - `SAWTOOTH`: `PropertyAnimatorWaveFunction = Ellipsis` — 4
  - `SINE`: `PropertyAnimatorWaveFunction = Ellipsis` — 0
  - `SQUARE`: `PropertyAnimatorWaveFunction = Ellipsis` — 2
  - `TRIANGLE`: `PropertyAnimatorWaveFunction = Ellipsis` — 5
