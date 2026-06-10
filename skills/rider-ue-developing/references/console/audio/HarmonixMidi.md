# UE Python API — HarmonixMidi Module

**22 types** from the `HarmonixMidi` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BeatMapPoint`, `ChordMapPoint`, `MidiFileData`, `MidiNote`, `MidiSongPos`, `MidiTrack`, `MusicalTimeSpan`, `MusicMapTimespanBase`, `MusicTimestamp`, `SongMaps`, `SongSection`, `TempoInfoPoint`, `TimeSignature`, `TimeSignaturePoint`, `MidiFile`, `MidiNoteFunctionLibrary`, `MidiSongPosFunctionLibrary`, `MusicalTickFunctionLibrary`, `MidiClockSubdivisionQuantization`, `MusicalBeatType`, ... (22 total)

---

## Classes

### `unreal.BeatMapPoint`
Inherits: `MusicMapTimespanBase` | Header: `BeatMap.h`

A point in the music representing a âbeatâ.

### `unreal.ChordMapPoint`
Inherits: `MusicMapTimespanBase` | Header: `ChordMap.h`

Specifies the tonality of a given section of music.

### `unreal.MidiFileData`
Inherits: `StructBase` | Header: `MidiFile.h`

Midi File Data

**Properties** (4):
  - `midi_file_name`: `str` [Read-Only] — [Read-Only] (str)
  - `song_maps`: `SongMaps` [Read-Only] — [Read-Only] (SongMaps)
  - `ticks_per_quarter_note`: `int` [Read-Only] — [Read-Only] (int32)
  - `tracks`: `None` [Read-Only] — [Read-Only] (Array[MidiTrack])

### `unreal.MidiNote`
Inherits: `StructBase` | Header: `MidiNote.h`

Helper struct for getting and assigning MidiNote values Uses custom detail customization and custom pins for convenience in Editor

**Properties** (1):
  - `note_number`: `int` — [Read-Write] (uint8)

### `unreal.MidiSongPos`
Inherits: `StructBase` | Header: `MidiSongPos.h`

Position within a song (midi info)

**Properties** (9):
  - `bars_including_count_in`: `float` [Read-Only] — [Read-Only] Total bars from the beginning of the song. (float)
  - `beat_type`: `MusicalBeatType` [Read-Only] — [Read-Only] Whether this beat is a Downbeat (beat 1 of the current bar) or otherwise
This value is d...
  - `beats_including_count_in`: `float` [Read-Only] — [Read-Only] Total beats from the beginning of the song. (float)
  - `seconds_from_bar_one`: `float` [Read-Only] — [Read-Only] Total seconds from bar 1 beat 1. (negative for count-in and/or pickup bars) (float)
  - `seconds_including_count_in`: `float` [Read-Only] — [Read-Only] Total seconds from the beginning of the musical content (ie. includes all count-in and p...
  - `tempo`: `float` [Read-Only] — [Read-Only] Tempo in Quarter Notes Per Minute (BPM) (float)
  - `time_sig_denominator`: `int` [Read-Only] — [Read-Only] Time Signature Numerator (Indicates Subdivision of Bar that counts as 1 beat (4 means Qu...
  - `time_sig_numerator`: `int` [Read-Only] — [Read-Only] Time Signature Numerator (Indicates Number of Beats Per Bar) (int32)
  - `timestamp`: `MusicTimestamp` [Read-Only] — Bar Number and Beat Number within the bar (Bar 1 Beat 1.0f) (MusicTimestamp) [Read-Only] The Musical...

### `unreal.MidiTrack`
Inherits: `StructBase` | Header: `MidiTrack.h`

An FMidiTrack is a collection of FMidiEvents in chronological order.

### `unreal.MusicalTimeSpan`
Inherits: `StructBase` | Header: `MusicTimeSpan.h`

Musical Time Span

**Properties** (4):
  - `length`: `int` — [Read-Write] (int32)
  - `length_units`: `MusicTimeSpanLengthUnits` — [Read-Write] (MusicTimeSpanLengthUnits)
  - `offset`: `int` — [Read-Write] (int32)
  - `offset_units`: `MusicTimeSpanOffsetUnits` — [Read-Write] (MusicTimeSpanOffsetUnits)

### `unreal.MusicMapTimespanBase`
Inherits: `StructBase` | Header: `MusicMapBase.h`

FMusicMapPointBase represents a span in a midi file defined by a start tick and a length. This is a base class for many types of map points we recognize in midi files (e.g. chord, section, tempo, puls...

**Properties** (2):
  - `length_ticks`: `int` [Read-Only] — [Read-Only] (int32)
  - `start_tick`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.MusicTimestamp`
Inherits: `StructBase` | Header: `BarMap.h`

Music Timestamp

**Properties** (2):
  - `bar`: `int` — [Read-Write] (int32)
  - `beat`: `float` — [Read-Write] (float)

### `unreal.SongMaps`
Inherits: `StructBase` | Header: `SongMaps.h`

FSongMaps encapsulates a number of other musical/midi map types that are very useful for musical gameplay and interactivity.

### `unreal.SongSection`
Inherits: `MusicMapTimespanBase` | Header: `SectionMap.h`

A section in a piece of music has a name, a starting point, and a length

**Properties** (1):
  - `name`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.TempoInfoPoint`
Inherits: `MusicMapTimespanBase` | Header: `TempoMap.h`

A position in a song where the tempo is specified (the rate at which the music plays)

### `unreal.TimeSignature`
Inherits: `StructBase` | Header: `BarMap.h`

A simple container for a musical time signature (numerator and denominator.)

### `unreal.TimeSignaturePoint`
Inherits: `MusicMapTimespanBase` | Header: `BarMap.h`

A time signature associated with a specific tick in a midi file.

### `unreal.MidiFile`
Inherits: `Object` | Header: `MidiFile.h`

An FMidFile is primarily a container for FMidiTracks.

**Properties** (1):
  - `start_bar`: `int` [Read-Only] — [Read-Only] The Start Bar of a Midi File (int32)

### `unreal.MidiNoteFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MidiFunctionLibrary.h`

Function library for FMidiNote and various midi note constants

**Methods** (12):
  - `byte_to_midi_note(byte)` -> `MidiNote` [classmethod] — Byte to Midi Note
  - `get_max_midi_note()` -> `MidiNote` [classmethod] — Get Max Midi Note
  - `get_max_note_number()` -> `uint8` [classmethod] — Get Max Note Number
  - `get_max_note_velocity()` -> `uint8` [classmethod] — Get Max Note Velocity
  - `get_max_num_notes()` -> `int32` [classmethod] — Get Max Num Notes
  - `get_min_midi_note()` -> `MidiNote` [classmethod] — Get Min Midi Note
  - `get_min_note_number()` -> `uint8` [classmethod] — Get Min Note Number
  - `get_min_note_velocity()` -> `uint8` [classmethod] — Get Min Note Velocity
  - `int_to_midi_note(int)` -> `MidiNote` [classmethod] — Int to Midi Note
  - `make_literal_midi_note(value)` -> `MidiNote` [classmethod] — Make Literal Midi Note
  - `midi_note_to_byte(midi_note)` -> `uint8` [classmethod] — Midi Note to Byte
  - `midi_note_to_int(midi_note)` -> `int32` [classmethod] — Midi Note to Int

### `unreal.MidiSongPosFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MidiFunctionLibrary.h`

Function library for FMidiSongPos

**Methods** (2):
  - `is_song_pos_valid(song_pos)` -> `bool` [classmethod] — Is Song Pos Valid
  - `lerp_song_pos(a, b, alpha)` -> `MidiSongPos` [classmethod] — Lerp Song Pos

### `unreal.MusicalTickFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MidiFunctionLibrary.h`

Function library for converting Ticks to Beats and Beats to Ticks and other midi constants

**Methods** (9):
  - `beat_to_tick(quarter_note: float)` -> `float` [classmethod] — deprecated: âbeat_to_tickâ was renamed to âquarter_note_to_tickâ.
  - `get_quarter_notes_per_tick()` -> `float` [classmethod] — Get Quarter Notes Per Tick
  - `get_ticks_per_beat()` -> `float` [classmethod] — deprecated: âget_ticks_per_beatâ was renamed to âget_ticks_per_quarter_noteâ.
  - `get_ticks_per_beat_int()` -> `int` [classmethod] — deprecated: âget_ticks_per_beat_intâ was renamed to âget_ticks_per_quarter_note_intâ.
  - `get_ticks_per_quarter_note()` -> `float` [classmethod] — Get Ticks Per Quarter Note
  - `get_ticks_per_quarter_note_int()` -> `int32` [classmethod] — Get Ticks Per Quarter Note Int
  - `quarter_note_to_tick(quarter_note)` -> `float` [classmethod] — Quarter Note to Tick
  - `tick_to_beat(tick: float)` -> `float` [classmethod] — deprecated: âtick_to_beatâ was renamed to âtick_to_quarter_noteâ.
  - `tick_to_quarter_note(tick)` -> `float` [classmethod] — Tick to Quarter Note

### `unreal.MidiClockSubdivisionQuantization`
Inherits: `EnumBase` | Header: `SongMaps.h`

EMidi Clock Subdivision Quantization

**Properties** (18):
  - `BAR`: `MidiClockSubdivisionQuantization = Ellipsis` — 0
  - `BEAT`: `MidiClockSubdivisionQuantization = Ellipsis` — 1
  - `DOTTED_EIGHTH_NOTE`: `MidiClockSubdivisionQuantization = Ellipsis` — 9
  - `DOTTED_HALF_NOTE`: `MidiClockSubdivisionQuantization = Ellipsis` — 11
  - `DOTTED_QUARTER_NOTE`: `MidiClockSubdivisionQuantization = Ellipsis` — 10
  - `DOTTED_SIXTEENTH_NOTE`: `MidiClockSubdivisionQuantization = Ellipsis` — 8
  - `DOTTED_WHOLE_NOTE`: `MidiClockSubdivisionQuantization = Ellipsis` — 12
  - `EIGHTH_NOTE`: `MidiClockSubdivisionQuantization = Ellipsis` — 4
  - `EIGHTH_NOTE_TRIPLET`: `MidiClockSubdivisionQuantization = Ellipsis` — 14
  - `HALF_NOTE`: `MidiClockSubdivisionQuantization = Ellipsis` — 6
  - `HALF_NOTE_TRIPLET`: `MidiClockSubdivisionQuantization = Ellipsis` — 16
  - `NONE`: `MidiClockSubdivisionQuantization = Ellipsis` — 19
  - `QUARTER_NOTE`: `MidiClockSubdivisionQuantization = Ellipsis` — 5
  - `QUARTER_NOTE_TRIPLET`: `MidiClockSubdivisionQuantization = Ellipsis` — 15
  - `SIXTEENTH_NOTE`: `MidiClockSubdivisionQuantization = Ellipsis` — 3
  - `SIXTEENTH_NOTE_TRIPLET`: `MidiClockSubdivisionQuantization = Ellipsis` — 13
  - `THIRTY_SECOND_NOTE`: `MidiClockSubdivisionQuantization = Ellipsis` — 2
  - `WHOLE_NOTE`: `MidiClockSubdivisionQuantization = Ellipsis` — 7

### `unreal.MusicalBeatType`
Inherits: `EnumBase` | Header: `BeatMap.h`

EMusical Beat Type

**Properties** (3):
  - `DOWNBEAT`: `MusicalBeatType = Ellipsis` — 0
  - `NORMAL`: `MusicalBeatType = Ellipsis` — 2
  - `STRONG`: `MusicalBeatType = Ellipsis` — 1

### `unreal.MusicTimeSpanLengthUnits`
Inherits: `EnumBase` | Header: `MusicTimeSpan.h`

EMusic Time Span Length Units

**Properties** (17):
  - `BARS`: `MusicTimeSpanLengthUnits = Ellipsis` — (dependent on time signature) 0
  - `BEATS`: `MusicTimeSpanLengthUnits = Ellipsis` — (dependent on time signature and Pulse Override) 1
  - `DOTTED_EIGHTH_NOTES`: `MusicTimeSpanLengthUnits = Ellipsis` — 9
  - `DOTTED_HALF_NOTES`: `MusicTimeSpanLengthUnits = Ellipsis` — 11
  - `DOTTED_QUARTER_NOTES`: `MusicTimeSpanLengthUnits = Ellipsis` — 10
  - `DOTTED_SIXTEENTH_NOTES`: `MusicTimeSpanLengthUnits = Ellipsis` — 8
  - `DOTTED_WHOLE_NOTES`: `MusicTimeSpanLengthUnits = Ellipsis` — 12
  - `EIGHTH_NOTES`: `MusicTimeSpanLengthUnits = Ellipsis` — 4
  - `EIGHTH_NOTE_TRIPLETS`: `MusicTimeSpanLengthUnits = Ellipsis` — 14
  - `HALF_NOTES`: `MusicTimeSpanLengthUnits = Ellipsis` — 6
  - `HALF_NOTE_TRIPLETS`: `MusicTimeSpanLengthUnits = Ellipsis` — 16
  - `QUARTER_NOTES`: `MusicTimeSpanLengthUnits = Ellipsis` — 5
  - `QUARTER_NOTE_TRIPLETS`: `MusicTimeSpanLengthUnits = Ellipsis` — 15
  - `SIXTEENTH_NOTES`: `MusicTimeSpanLengthUnits = Ellipsis` — 3
  - `SIXTEENTH_NOTE_TRIPLETS`: `MusicTimeSpanLengthUnits = Ellipsis` — 13
  - `THIRTY_SECOND_NOTES`: `MusicTimeSpanLengthUnits = Ellipsis` — 2
  - `WHOLE_NOTES`: `MusicTimeSpanLengthUnits = Ellipsis` — 7

### `unreal.MusicTimeSpanOffsetUnits`
Inherits: `EnumBase` | Header: `MusicTimeSpan.h`

EMusic Time Span Offset Units

**Properties** (18):
  - `BARS`: `MusicTimeSpanOffsetUnits = Ellipsis` — (dependent on time signature) 1
  - `BEATS`: `MusicTimeSpanOffsetUnits = Ellipsis` — (dependent on time signature and Pulse Override) 2
  - `DOTTED_EIGHTH_NOTES`: `MusicTimeSpanOffsetUnits = Ellipsis` — 10
  - `DOTTED_HALF_NOTES`: `MusicTimeSpanOffsetUnits = Ellipsis` — 12
  - `DOTTED_QUARTER_NOTES`: `MusicTimeSpanOffsetUnits = Ellipsis` — 11
  - `DOTTED_SIXTEENTH_NOTES`: `MusicTimeSpanOffsetUnits = Ellipsis` — 9
  - `DOTTED_WHOLE_NOTES`: `MusicTimeSpanOffsetUnits = Ellipsis` — 13
  - `EIGHTH_NOTES`: `MusicTimeSpanOffsetUnits = Ellipsis` — 5
  - `EIGHTH_NOTE_TRIPLETS`: `MusicTimeSpanOffsetUnits = Ellipsis` — 15
  - `HALF_NOTES`: `MusicTimeSpanOffsetUnits = Ellipsis` — 7
  - `HALF_NOTE_TRIPLETS`: `MusicTimeSpanOffsetUnits = Ellipsis` — 17
  - `MS`: `MusicTimeSpanOffsetUnits = Ellipsis` — 0
  - `QUARTER_NOTES`: `MusicTimeSpanOffsetUnits = Ellipsis` — 6
  - `QUARTER_NOTE_TRIPLETS`: `MusicTimeSpanOffsetUnits = Ellipsis` — 16
  - `SIXTEENTH_NOTES`: `MusicTimeSpanOffsetUnits = Ellipsis` — 4
  - `SIXTEENTH_NOTE_TRIPLETS`: `MusicTimeSpanOffsetUnits = Ellipsis` — 14
  - `THIRTY_SECOND_NOTES`: `MusicTimeSpanOffsetUnits = Ellipsis` — 3
  - `WHOLE_NOTES`: `MusicTimeSpanOffsetUnits = Ellipsis` — 8
