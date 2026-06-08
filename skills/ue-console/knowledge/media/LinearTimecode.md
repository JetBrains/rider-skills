# UE Python API — LinearTimecode Module

**4 types** from the `LinearTimecode` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DropTimecode`, `DropTimecodeToStringConversion`, `LinearTimecodeComponent`, `OnTimecodeChange`

---

## Classes

### `unreal.DropTimecode`
Inherits: `StructBase` | Header: `DropTimecode.h`

Hold a frame of a Linear Timecode Frame

**Properties** (5):
  - `color_framing`: `bool` — [Read-Write] Sync is in phase with color burst (bool)
  - `frame_rate`: `int` — [Read-Write] Guess at incoming frame rate (int32)
  - `new_frame`: `bool` — [Read-Write] Is a new timecode frame (bool)
  - `running_forward`: `bool` — [Read-Write] When timecode is reading forward (bool)
  - `timecode`: `Timecode` — [Read-Write] Decoded Timecode (Timecode)

### `unreal.DropTimecodeToStringConversion`
Inherits: `BlueprintFunctionLibrary` | Header: `LinearTimecodeComponent.h`

Extend type conversions to handle FDropTimecode structure

**Methods** (1):
  - `conv_drop_timecode_to_string(timecode)` -> `str` [classmethod] — Convert a timecode structure into a string

### `unreal.LinearTimecodeComponent`
Inherits: `SceneComponent` | Header: `LinearTimecodeComponent.h`

Implements a Linear timecode decoder.

**Methods** (3):
  - `get_drop_frame_number()` -> `int32` — Get the Frame Number
  - `get_drop_time_code_frame_number(timecode)` -> `int32` [classmethod] — Convert a drop timecode into a frame number
  - `set_drop_timecode_frame_number(timecode, frame_number)` -> `DropTimecode` [classmethod] — Convert frame number into a drop timecode

**Properties** (3):
  - `drop_timecode`: `DropTimecode` [Read-Only] — [Read-Only] (DropTimecode)
  - `media_player`: `MediaPlayer` — [Read-Write] The media player asset associated with this component. (MediaPlayer)
  - `on_timecode_change`: `OnTimecodeChange` — [Read-Write] Called when the timecode changes (OnTimecodeChange)

### `unreal.OnTimecodeChange`
Inherits: `MulticastDelegateBase` | Header: `LinearTimecodeComponent.h`

On Timecode Change Delegate Signature
