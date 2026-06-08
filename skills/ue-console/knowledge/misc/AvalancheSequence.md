# UE Python API — AvalancheSequence Module

**19 types** from the `AvalancheSequence` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaMark`, `AvaSequenceName`, `AvaSequencePlayAdvancedSettings`, `AvaSequencePlayParams`, `AvaSequenceTime`, `AvaSequence`, `AvaSequenceActor`, `AvaSequenceDirector`, `AvaSequencePlaybackActor`, `AvaSequencePlaybackObject`, `AvaSequencePlayer`, `MotionDesignSequenceLibrary`, `AvaMarkDirection`, `AvaMarkRole`, `AvaMarkSearchDirection`, `AvaSequencePlayMode`, `AvaSequenceTimeType`, `AvaTransitionSequenceQueryType`, `AvaTransitionSequenceWaitType`

---

## Classes

### `unreal.AvaMark`
Inherits: `StructBase` | Header: `AvaMark.h`

Ava Mark

**Properties** (9):
  - `direction`: `AvaMarkDirection` — [Read-Write] (AvaMarkDirection)
  - `is_local_mark`: `bool` — [Read-Write] Whether Executing this Mark should affect the Local Sequence
Set to True to only Execut...
  - `jump_label`: `str` — [Read-Write] (str)
  - `label`: `str` [Read-Only] — [Read-Only] (str)
  - `limit_play_count`: `int` — [Read-Write] (int32)
  - `limit_play_count_enabled`: `bool` — [Read-Write] (bool)
  - `pause_time`: `float` — [Read-Write] (float)
  - `role`: `AvaMarkRole` — [Read-Write] (AvaMarkRole)
  - `search_direction`: `AvaMarkSearchDirection` — [Read-Write] (AvaMarkSearchDirection)

### `unreal.AvaSequenceName`
Inherits: `StructBase` | Header: `AvaSequenceName.h`

Ava Sequence Name

**Properties** (1):
  - `name`: `Name` — [Read-Write] (Name)

### `unreal.AvaSequencePlayAdvancedSettings`
Inherits: `StructBase` | Header: `AvaSequenceShared.h`

Ava Sequence Play Advanced Settings

**Properties** (3):
  - `loop_count`: `int` — [Read-Write] Number of times to loop playback. -1 for infinite, else the number of times to loop bef...
  - `playback_speed`: `float` — [Read-Write] (float)
  - `restore_state`: `bool` — [Read-Write] (bool)

### `unreal.AvaSequencePlayParams`
Inherits: `StructBase` | Header: `AvaSequenceShared.h`

Ava Sequence Play Params

**Properties** (4):
  - `advanced_settings`: `AvaSequencePlayAdvancedSettings` — [Read-Write] (AvaSequencePlayAdvancedSettings)
  - `end`: `AvaSequenceTime` — [Read-Write] (AvaSequenceTime)
  - `play_mode`: `AvaSequencePlayMode` — [Read-Write] (AvaSequencePlayMode)
  - `start`: `AvaSequenceTime` — [Read-Write] (AvaSequenceTime)

### `unreal.AvaSequenceTime`
Inherits: `StructBase` | Header: `AvaSequenceShared.h`

Ava Sequence Time

**Properties** (6):
  - `frame`: `int` — [Read-Write] (int32)
  - `has_time_constraint`: `bool` — [Read-Write] (bool)
  - `mark_label`: `str` — [Read-Write] (str)
  - `seconds`: `float` — [Read-Write] (double)
  - `sub_frame`: `float` — [Read-Write] (double)
  - `time_type`: `AvaSequenceTimeType` — [Read-Write] (AvaSequenceTimeType)

### `unreal.AvaSequence`
Inherits: `LevelSequence` | Header: `AvaSequence.h`

Ava Sequence

**Methods** (8):
  - `get_end_time()` -> `double` — Gets the End Time of this Sequence
  - `get_label()` -> `Name` — Get Label
  - `get_mark(mark_label)` -> `AvaMark or None` — Get Mark
  - `get_marks()` -> `Set [ AvaMark ]` — Get Marks
  - `get_sequence_tag()` -> `AvaTagHandle` — Get Sequence Tag
  - `get_start_time()` -> `double` — Gets the Start Time of this Sequence
  - `set_label(label)` -> `None` — Set Label
  - `set_mark(mark_label, mark)` -> `bool` — Set Mark

### `unreal.AvaSequenceActor`
Inherits: `LevelSequenceActor` | Header: `AvaSequenceActor.h`

Ava Sequence Actor

### `unreal.AvaSequenceDirector`
Inherits: `LevelSequenceDirector` | Header: `AvaSequenceDirector.h`

Ava Sequence Director

**Methods** (3):
  - `get_playback_object()` -> `AvaSequencePlaybackObject` — Get Playback Object
  - `play_scheduled_sequences()` -> `None` — Play Scheduled Sequences
  - `play_sequences_by_label(sequence_label, play_settings)` -> `None` — Play Sequences by Label

### `unreal.AvaSequencePlaybackActor`
Inherits: `Actor` | Header: `AvaSequencePlaybackActor.h`

Base Actor for Ava Sequence Playback Management

**Methods** (12):
  - `bp_play_scheduled_sequences()` -> `None` — BP Play Scheduled Sequences
  - `continue_sequences_by_label(sequence_label)` -> `Array [ AvaSequencePlayer ]` — Triggers Continue for the playing sequences that match the given label
  - `continue_sequences_by_labels(sequence_labels)` -> `Array [ AvaSequencePlayer ]` — Triggers Continues in multiple playing sequences given by an array of sequence labels
  - `continue_sequences_by_tag(tag_handle, exact_match)` -> `Array [ AvaSequencePlayer ]` — Triggers Continues in all the sequences matching the provided tag
  - `get_all_sequence_players()` -> `Array [ AvaSequencePlayer ]` — Retrieves all Active Sequence Players
  - `has_active_sequence_players()` -> `bool` — Returns true if there are any Active Sequence Players
  - `play_scheduled_sequences()` -> `Array [ AvaSequencePlayer ]` — Plays the Scheduled Sequences with the Scheduled Play Settings
  - `play_sequence_by_soft_reference(sequence, play_settings)` -> `AvaSequencePlayer` — Plays a single sequence by its soft reference
  - `play_sequences_by_label(sequence_label, play_settings)` -> `Array [ AvaSequencePlayer ]` — Plays all the sequences that have the provided label
  - `play_sequences_by_labels(sequence_labels, play_settings)` -> `Array [ AvaSequencePlayer ]` — Plays multiple Sequences by an array of sequence labels
  - `play_sequences_by_soft_reference(sequences, play_settings)` -> `Array [ AvaSequencePlayer ]` — Plays multiple Sequences by their Soft Reference
  - `play_sequences_by_tag(tag_handle, exact_match, play_settings)` -> `Array [ AvaSequencePlayer ]` — Plays all the Sequences that match the given gameplay tag(s)

### `unreal.AvaSequencePlaybackObject`
Inherits: `Interface` | Header: `AvaSequencePlaybackObject.h`

Ava Sequence Playback Object

**Methods** (11):
  - `continue_sequences_by_label(sequence_label)` -> `Array [ AvaSequencePlayer ]` — Triggers Continue for the playing sequences that match the given label
  - `continue_sequences_by_labels(sequence_labels)` -> `Array [ AvaSequencePlayer ]` — Triggers Continues in multiple playing sequences given by an array of sequence labels
  - `continue_sequences_by_tag(tag_handle, exact_match)` -> `Array [ AvaSequencePlayer ]` — Triggers Continues in all the sequences matching the provided tag
  - `get_all_sequence_players()` -> `Array [ AvaSequencePlayer ]` — Retrieves all Active Sequence Players
  - `has_active_sequence_players()` -> `bool` — Returns true if there are any Active Sequence Players
  - `play_scheduled_sequences()` -> `Array [ AvaSequencePlayer ]` — Plays the Scheduled Sequences with the Scheduled Play Settings
  - `play_sequence_by_soft_reference(sequence, play_settings)` -> `AvaSequencePlayer` — Plays a single sequence by its soft reference
  - `play_sequences_by_label(sequence_label, play_settings)` -> `Array [ AvaSequencePlayer ]` — Plays all the sequences that have the provided label
  - `play_sequences_by_labels(sequence_labels, play_settings)` -> `Array [ AvaSequencePlayer ]` — Plays multiple Sequences by an array of sequence labels
  - `play_sequences_by_soft_reference(sequences, play_settings)` -> `Array [ AvaSequencePlayer ]` — Plays multiple Sequences by their Soft Reference
  - `play_sequences_by_tag(tag_handle, exact_match, play_settings)` -> `Array [ AvaSequencePlayer ]` — Plays all the Sequences that match the given gameplay tag(s)

### `unreal.AvaSequencePlayer`
Inherits: `LevelSequencePlayer` | Header: `AvaSequencePlayer.h`

Ava Sequence Player

### `unreal.MotionDesignSequenceLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AvaSequenceLibrary.h`

Ava Sequence Library

**Methods** (2):
  - `get_playback_object(world_context_object)` -> `AvaSequencePlaybackObject` [classmethod] — Get Playback Object
  - `make_single_frame_play_settings(target_time, play_mode)` -> `AvaSequencePlayParams` [classmethod] — Helper function to build Play Settings for Single Frame Playback

### `unreal.AvaMarkDirection`
Inherits: `EnumBase` | Header: `AvaMarkShared.h`

EAva Mark Direction

**Properties** (3):
  - `BACKWARDS`: `AvaMarkDirection = Ellipsis` — 2
  - `BOTH`: `AvaMarkDirection = Ellipsis` — 0
  - `FORWARDS`: `AvaMarkDirection = Ellipsis` — 1

### `unreal.AvaMarkRole`
Inherits: `EnumBase` | Header: `AvaMarkShared.h`

EAva Mark Role

**Properties** (5):
  - `JUMP`: `AvaMarkRole = Ellipsis` — Jumps to the nearest Marked Frame with the given Label, or continues playback if it doesnât exist ...
  - `NONE`: `AvaMarkRole = Ellipsis` — Does nothing. Used for frame referencing 0 Mark
  - `PAUSE`: `AvaMarkRole = Ellipsis` — Waits a set amount of time before resuming playback 2 Pause Point
  - `REVERSE`: `AvaMarkRole = Ellipsis` — Reverses the Playback Direction 4 Reverse Point
  - `STOP`: `AvaMarkRole = Ellipsis` — Waits for âContinueâ input before resuming playback 1 Stop Point

### `unreal.AvaMarkSearchDirection`
Inherits: `EnumBase` | Header: `AvaMarkShared.h`

EAva Mark Search Direction

**Properties** (5):
  - `ABSOLUTE_BACKWARDS`: `AvaMarkSearchDirection = Ellipsis` — Backwards Fixed Direction, regardless of Playback Direction 4
  - `ABSOLUTE_FORWARDS`: `AvaMarkSearchDirection = Ellipsis` — Forwards Fixed Direction, regardless of Playback Direction 3
  - `ALL`: `AvaMarkSearchDirection = Ellipsis` — Search All Directions 0
  - `OPPOSITE_DIRECTION`: `AvaMarkSearchDirection = Ellipsis` — Search Opposite in the opposite Direction of Playback (what causes Loops) 2
  - `SAME_DIRECTION`: `AvaMarkSearchDirection = Ellipsis` — Search in the Same Direction of Playback 1

### `unreal.AvaSequencePlayMode`
Inherits: `EnumBase` | Header: `AvaSequenceShared.h`

EAva Sequence Play Mode

**Properties** (2):
  - `FORWARD`: `AvaSequencePlayMode = Ellipsis` — Sequence plays and loops from the beginning to the end. 0
  - `REVERSE`: `AvaSequencePlayMode = Ellipsis` — Sequence plays and loops from the end to the beginning. 1

### `unreal.AvaSequenceTimeType`
Inherits: `EnumBase` | Header: `AvaSequenceShared.h`

EAva Sequence Time Type

**Properties** (3):
  - `FRAME`: `AvaSequenceTimeType = Ellipsis` — 1
  - `MARK`: `AvaSequenceTimeType = Ellipsis` — 3
  - `SECONDS`: `AvaSequenceTimeType = Ellipsis` — 2

### `unreal.AvaTransitionSequenceQueryType`
Inherits: `EnumBase` | Header: `AvaTransitionSequenceEnums.h`

EAva Transition Sequence Query Type

**Properties** (2):
  - `NAME`: `AvaTransitionSequenceQueryType = Ellipsis` — Identify the Sequence by its Name 1
  - `TAG`: `AvaTransitionSequenceQueryType = Ellipsis` — Identify the Sequence by its Tag 2

### `unreal.AvaTransitionSequenceWaitType`
Inherits: `EnumBase` | Header: `AvaTransitionSequenceEnums.h`

EAva Transition Sequence Wait Type

**Properties** (2):
  - `NO_WAIT`: `AvaTransitionSequenceWaitType = Ellipsis` — Fire and Forget 1
  - `WAIT_UNTIL_STOP`: `AvaTransitionSequenceWaitType = Ellipsis` — Wait until the Sequence stops midway or finishes to complete 2
