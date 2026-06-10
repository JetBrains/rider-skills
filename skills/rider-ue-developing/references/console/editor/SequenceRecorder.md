# UE Python API — SequenceRecorder Module

**4 types** from the `SequenceRecorder` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TimecodeBoneMethod`, `SequenceRecorderGroup`, `SequenceRecorderLibrary`, `TimecodeBoneMode`

---

## Classes

### `unreal.TimecodeBoneMethod`
Inherits: `StructBase` | Header: `AnimationRecorder.h`

Timecode Bone Method

**Properties** (2):
  - `bone_mode`: `TimecodeBoneMode` — [Read-Write] The timecode bone mode (TimecodeBoneMode)
  - `bone_name`: `Name` — [Read-Write] Name of the bone to assign timecode values to (Name)

### `unreal.SequenceRecorderGroup`
Inherits: `Actor` | Header: `SequenceRecorderActorGroup.h`

Sequence Recorder Group

### `unreal.SequenceRecorderLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SequenceRecorderBlueprintLibrary.h`

Sequence Recorder Blueprint Library

**Methods** (3):
  - `is_recording_sequence()` -> `bool` [classmethod] — Are we currently recording a sequence
  - `start_recording_sequence(actors_to_record)` -> `None` [classmethod] — Start recording the passed-in actors to a level sequence.
  - `stop_recording_sequence()` -> `None` [classmethod] — Stop recording the current sequence, if any

### `unreal.TimecodeBoneMode`
Inherits: `EnumBase` | Header: `AnimationRecorder.h`

ETimecode Bone Mode

**Properties** (3):
  - `ALL`: `TimecodeBoneMode = Ellipsis` — 0
  - `ROOT`: `TimecodeBoneMode = Ellipsis` — 1
  - `USER_DEFINED`: `TimecodeBoneMode = Ellipsis` — 2
