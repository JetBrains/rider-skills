# UE Python API — PropertyAnimatorCore Module

**22 types** from the `PropertyAnimatorCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BoolConverterCondition`, `BoolConverterRule`, `Int32ConverterRule`, `PropertyAnimatorCoreConverterRuleBase`, `PropertyAnimatorCoreData`, `MovieSceneAnimatorSection`, `MovieSceneAnimatorTrack`, `PropertyAnimatorCoreAnimatorPreset`, `PropertyAnimatorCoreBase`, `PropertyAnimatorCoreComponent`, `PropertyAnimatorCoreContext`, `PropertyAnimatorCorePresetBase`, `PropertyAnimatorCorePropertyPreset`, `PropertyAnimatorCoreResolver`, `PropertyAnimatorCoreTimeSourceBase`, `BoolConverterComparison`, `Int32ConverterMethod`, `MovieSceneAnimatorEvalTimeMode`, `PropertyAnimatorCoreMode`, `PropertyAnimatorCoreSystemCountdownFormat`, ... (22 total)

---

## Classes

### `unreal.BoolConverterCondition`
Inherits: `StructBase` | Header: `PropertyAnimatorCoreConverterTraits.h`

Bool Converter Condition

### `unreal.BoolConverterRule`
Inherits: `PropertyAnimatorCoreConverterRuleBase` | Header: `PropertyAnimatorCoreConverterTraits.h`

Bool Converter Rule

### `unreal.Int32ConverterRule`
Inherits: `PropertyAnimatorCoreConverterRuleBase` | Header: `PropertyAnimatorCoreConverterTraits.h`

Int 32Converter Rule

### `unreal.PropertyAnimatorCoreConverterRuleBase`
Inherits: `StructBase` | Header: `PropertyAnimatorCoreConverterTraits.h`

Base struct for converter rules

### `unreal.PropertyAnimatorCoreData`
Inherits: `StructBase` | Header: `PropertyAnimatorCoreData.h`

Serializable struct that contains the property and the owner with accessors

### `unreal.MovieSceneAnimatorSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneAnimatorSection.h`

Movie scene section for a sequencer animator track

### `unreal.MovieSceneAnimatorTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneAnimatorTrack.h`

Movie scene track used to drive animator with sequencer

### `unreal.PropertyAnimatorCoreAnimatorPreset`
Inherits: `PropertyAnimatorCorePresetBase` | Header: `PropertyAnimatorCoreAnimatorPreset.h`

Animator preset class used to import/export animator data

### `unreal.PropertyAnimatorCoreBase`
Inherits: `Object` | Header: `PropertyAnimatorCoreBase.h`

Abstract base class for any Animator, holds a set of linked properties

**Properties** (1):
  - `time_sources_instances`: `None` — [Read-Write]
deprecated: Use TimeSources instead (Map[Name,PropertyAnimatorCoreTimeSourceBase])

### `unreal.PropertyAnimatorCoreComponent`
Inherits: `ActorComponent` | Header: `PropertyAnimatorCoreComponent.h`

A container for controllers that holds properties in this actor

**Properties** (1):
  - `property_animators`: `None` — [Read-Write] Animators linked to this actor, they contain only properties within this actor (Array[P...

### `unreal.PropertyAnimatorCoreContext`
Inherits: `Object` | Header: `PropertyAnimatorCoreContext.h`

Context for properties linked to an animator

### `unreal.PropertyAnimatorCorePresetBase`
Inherits: `Object` | Header: `PropertyAnimatorCorePresetBase.h`

Abstract Base class to define preset for animators with custom properties and options Will get registered automatically by the subsystem Should remain transient and stateless

### `unreal.PropertyAnimatorCorePropertyPreset`
Inherits: `PropertyAnimatorCorePresetBase` | Header: `PropertyAnimatorCorePropertyPreset.h`

Property preset class used to import/export properties on supported animators

### `unreal.PropertyAnimatorCoreResolver`
Inherits: `Object` | Header: `PropertyAnimatorCoreResolver.h`

Base class to find properties hidden or not reachable, allows to discover resolvable properties for specific actors/components/objects that we cannot reach or are transient, will be resolved when need...

### `unreal.PropertyAnimatorCoreTimeSourceBase`
Inherits: `Object` | Header: `PropertyAnimatorCoreTimeSourceBase.h`

Abstract base class for time source used by property animators Can be transient or saved to disk if contains user set data

### `unreal.BoolConverterComparison`
Inherits: `EnumBase` | Header: `PropertyAnimatorCoreConverterTraits.h`

EBool Converter Comparison

**Properties** (6):
  - `EQUAL`: `BoolConverterComparison = Ellipsis` — 0
  - `GREATER`: `BoolConverterComparison = Ellipsis` — 2
  - `GREATER_EQUAL`: `BoolConverterComparison = Ellipsis` — 4
  - `LESS`: `BoolConverterComparison = Ellipsis` — 3
  - `LESS_EQUAL`: `BoolConverterComparison = Ellipsis` — 5
  - `NOT_EQUAL`: `BoolConverterComparison = Ellipsis` — 1

### `unreal.Int32ConverterMethod`
Inherits: `EnumBase` | Header: `PropertyAnimatorCoreConverterTraits.h`

EInt 32Converter Method

**Properties** (3):
  - `CEIL`: `Int32ConverterMethod = Ellipsis` — 2
  - `FLOOR`: `Int32ConverterMethod = Ellipsis` — 1
  - `ROUND`: `Int32ConverterMethod = Ellipsis` — 0

### `unreal.MovieSceneAnimatorEvalTimeMode`
Inherits: `EnumBase` | Header: `MovieSceneAnimatorTypes.h`

Enumerates all possible ways of interpreting time

**Properties** (3):
  - `CUSTOM`: `MovieSceneAnimatorEvalTimeMode = Ellipsis` — Custom provided time, interpolate between start and end time based on progress 2
  - `SECTION`: `MovieSceneAnimatorEvalTimeMode = Ellipsis` — The section time, takes into account any offset the section has 1
  - `SEQUENCE`: `MovieSceneAnimatorEvalTimeMode = Ellipsis` — The sequence time, if the section has an offset, it wonât matter 0

### `unreal.PropertyAnimatorCoreMode`
Inherits: `EnumBase` | Header: `PropertyAnimatorCoreContext.h`

Mode supported for properties value

**Properties** (2):
  - `ABSOLUTE`: `PropertyAnimatorCoreMode = Ellipsis` — Set the property value directly 0
  - `ADDITIVE`: `PropertyAnimatorCoreMode = Ellipsis` — Add value on the existing property value 1

### `unreal.PropertyAnimatorCoreSystemCountdownFormat`
Inherits: `EnumBase` | Header: `PropertyAnimatorCoreSystemTimeSource.h`

Enumerates all possible format interpretation in countdown mode

**Properties** (2):
  - `DURATION`: `PropertyAnimatorCoreSystemCountdownFormat = Ellipsis` — format time provided is the duration of the countdown (relative)
eg: if current time is 10:00:00 and...
  - `TARGET`: `PropertyAnimatorCoreSystemCountdownFormat = Ellipsis` — Format time provided is the target time (absolute)
eg: if current time is 10:00.00 and format is set...

### `unreal.PropertyAnimatorCoreSystemMode`
Inherits: `EnumBase` | Header: `PropertyAnimatorCoreSystemTimeSource.h`

Enumerates all possible modes for the machine clock time source

**Properties** (3):
  - `COUNTDOWN`: `PropertyAnimatorCoreSystemMode = Ellipsis` — Specified duration elapsing until it reaches 0 1
  - `LOCAL_TIME`: `PropertyAnimatorCoreSystemMode = Ellipsis` — Local time of the machine 0
  - `STOPWATCH`: `PropertyAnimatorCoreSystemMode = Ellipsis` — Current time elapsed since the time source is active 2

### `unreal.PropertyAnimatorPropertySupport`
Inherits: `EnumBase` | Header: `PropertyAnimatorCoreBase.h`

EProperty Animator Property Support

**Properties** (4):
  - `ALL`: `PropertyAnimatorPropertySupport = Ellipsis` — 3
  - `COMPLETE`: `PropertyAnimatorPropertySupport = Ellipsis` — 2
  - `INCOMPLETE`: `PropertyAnimatorPropertySupport = Ellipsis` — 1
  - `NONE`: `PropertyAnimatorPropertySupport = Ellipsis` — 0
