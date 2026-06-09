# UE Python API — CustomizableSequencerTracks Module

**5 types** from the `CustomizableSequencerTracks` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SequencerTrackInstanceInput`, `SequencerSectionBP`, `SequencerTrackBP`, `SequencerTrackInstanceBP`, `CustomSequencerTrackType`

---

## Classes

### `unreal.SequencerTrackInstanceInput`
Inherits: `StructBase` | Header: `SequencerTrackInstanceBP.h`

Sequencer Track Instance Input

**Properties** (1):
  - `section`: `SequencerSectionBP` [Read-Only] — [Read-Only] (SequencerSectionBP)

### `unreal.SequencerSectionBP`
Inherits: `MovieSceneSection` | Header: `SequencerSectionBP.h`

Sequencer Section BP

### `unreal.SequencerTrackBP`
Inherits: `MovieSceneNameableTrack` | Header: `SequencerTrackBP.h`

Sequencer Track BP

### `unreal.SequencerTrackInstanceBP`
Inherits: `MovieSceneTrackInstance` | Header: `SequencerTrackInstanceBP.h`

Sequencer Track Instance BP

**Methods** (11):
  - `get_animated_object()` -> `Object` — Get Animated Object
  - `get_input(index)` -> `SequencerTrackInstanceInput` — Get Input
  - `get_inputs()` -> `Array [ SequencerTrackInstanceInput ]` — Get Inputs
  - `get_num_inputs()` -> `int32` — Get Num Inputs
  - `k2_on_begin_update_inputs()` -> `None` — K2 on Begin Update Inputs
  - `k2_on_destroyed()` -> `None` — K2 on Destroyed
  - `k2_on_end_update_inputs()` -> `None` — K2 on End Update Inputs
  - `k2_on_initialize()` -> `None` — K2 on Initialize
  - `k2_on_input_added(input)` -> `None` — K2 on Input Added
  - `k2_on_input_removed(input)` -> `None` — K2 on Input Removed
  - `k2_on_update()` -> `None` — K2 on Update

### `unreal.CustomSequencerTrackType`
Inherits: `EnumBase` | Header: `SequencerTrackBP.h`

ECustom Sequencer Track Type

**Properties** (2):
  - `OBJECT_TRACK`: `CustomSequencerTrackType = Ellipsis` — 1
  - `ROOT_TRACK`: `CustomSequencerTrackType = Ellipsis` — 0
