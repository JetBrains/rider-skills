# UE Python API — HarmonixMetasound Module

**32 types** from the `HarmonixMetasound` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `HarmonixPeakTamerSettings`, `MidiEventInfo`, `MusicLoopConfiguration`, `MusicSeekRequest`, `MusicSeekTarget`, `MusicTempometerMPCParameterNames`, `MusicTempometerMPCParameters`, `StepSequenceCell`, `StepSequenceNote`, `StepSequencePage`, `StepSequenceRow`, `StepSequenceTable`, `HarmonixPeakTamer`, `MetasoundOfflinePlayerComponent`, `MidiEventInfoBlueprintLibrary`, `MidiStepSequence`, `MusicClockComponent`, `MusicParameterBlueprintLibrary`, `MusicTempometerComponent`, `MusicTimestampBlueprintLibrary`, ... (32 total)

---

## Classes

### `unreal.HarmonixPeakTamerSettings`
Inherits: `StructBase` | Header: `PeakTamer.h`

Harmonix Peak Tamer Settings

**Properties** (5):
  - `enable_value_smoothing`: `bool` — [Read-Write] (bool)
  - `peak_attack_time_seconds`: `float` — [Read-Write] (float)
  - `peak_release_time_seconds`: `float` — [Read-Write] (float)
  - `value_attack_time_seconds`: `float` — [Read-Write] (float)
  - `value_release_time_seconds`: `float` — [Read-Write] (float)

### `unreal.MidiEventInfo`
Inherits: `StructBase` | Header: `MidiEventInfo.h`

Midi Event Info

**Properties** (2):
  - `timestamp`: `MusicTimestamp` — [Read-Write] (MusicTimestamp)
  - `track_index`: `int` — [Read-Write] (int32)

### `unreal.MusicLoopConfiguration`
Inherits: `StructBase` | Header: `MusicLoopConfiguration.h`

Music Loop Configuration

**Properties** (3):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `region_end`: `MusicTimestamp` — [Read-Write] (MusicTimestamp)
  - `region_start`: `MusicTimestamp` — [Read-Write] (MusicTimestamp)

### `unreal.MusicSeekRequest`
Inherits: `StructBase` | Header: `MusicSeekRequest.h`

Music Seek Request

**Properties** (3):
  - `emmediate_if_past_from_point`: `bool` — [Read-Write] (bool)
  - `from_point`: `MusicTimestamp` — [Read-Write] (MusicTimestamp)
  - `to_point`: `MusicTimestamp` — [Read-Write] (MusicTimestamp)

### `unreal.MusicSeekTarget`
Inherits: `StructBase` | Header: `MusicSeekRequest.h`

Music Seek Target

**Properties** (3):
  - `bar_beat`: `MusicTimestamp` — [Read-Write] (MusicTimestamp)
  - `ms`: `float` — [Read-Write] (float)
  - `type`: `SeekPointType` — [Read-Write] (SeekPointType)

### `unreal.MusicTempometerMPCParameterNames`
Inherits: `StructBase` | Header: `MusicTempometerUtilities.h`

Music Tempometer MPCParameter Names

### `unreal.MusicTempometerMPCParameters`
Inherits: `StructBase` | Header: `MusicTempometerUtilities.h`

Parameters used when creating/updating the corresponding Material Parameter Collection

### `unreal.StepSequenceCell`
Inherits: `StructBase` | Header: `MidiStepSequence.h`

First, the USTRUCT(s) that make up the user facing data for this assetâ¦

**Properties** (2):
  - `continuation`: `bool` [Read-Only] — [Read-Only] (bool)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.StepSequenceNote`
Inherits: `StructBase` | Header: `MidiStepSequence.h`

Step Sequence Note

**Properties** (2):
  - `note_number`: `int` [Read-Only] — [Read-Only] (int32)
  - `velocity`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.StepSequencePage`
Inherits: `StructBase` | Header: `MidiStepSequence.h`

Step Sequence Page

**Properties** (1):
  - `rows`: `None` [Read-Only] — [Read-Only] (Array[StepSequenceRow])

### `unreal.StepSequenceRow`
Inherits: `StructBase` | Header: `MidiStepSequence.h`

Step Sequence Row

**Properties** (2):
  - `cells`: `None` [Read-Only] — [Read-Only] (Array[StepSequenceCell])
  - `row_enabled`: `bool` [Read-Only] — [Read-Only] If the row is disabled, no notes in that row will play (bool)

### `unreal.StepSequenceTable`
Inherits: `StructBase` | Header: `MidiStepSequence.h`

Step Sequence Table

**Properties** (3):
  - `notes`: `None` [Read-Only] — [Read-Only] (Array[StepSequenceNote])
  - `pages`: `None` [Read-Only] — [Read-Only] (Array[StepSequencePage])
  - `step_skip_index`: `int` [Read-Only] — [Read-Only] If >0, any step at index X will be skipped if X % N == N - 1 (int32)

### `unreal.HarmonixPeakTamer`
Inherits: `Object` | Header: `PeakTamer.h`

Takes a raw peak value from an audio analyzer and outputs a smoothed, compressed value in range [0, 1]

**Methods** (5):
  - `configure(settings)` -> `None` — Configure
  - `create_harmonix_peak_tamer()` -> `HarmonixPeakTamer` [classmethod] — Create Harmonix Peak Tamer
  - `get_peak()` -> `float` — Get Peak
  - `get_value()` -> `float` — Get Value
  - `update(input_value, delta_time_seconds)` -> `None` — Update

### `unreal.MetasoundOfflinePlayerComponent`
Inherits: `ActorComponent` | Header: `MetasoundOfflinePlayerComponent.h`

Metasound Offline Player Component

### `unreal.MidiEventInfoBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MidiEventInfo.h`

Midi Event Info Blueprint Library

**Methods** (8):
  - `get_channel(event)` -> `int32` [classmethod] — Get Channel
  - `get_midi_event_info(success=bool)` [classmethod] — Get Midi Event Info
  - `get_note_number(event)` -> `int32` [classmethod] — Get Note Number
  - `get_velocity(event)` -> `int32` [classmethod] — Get Velocity
  - `is_midi_event_info(output)` -> `bool` [classmethod] — Is Midi Event Info
  - `is_note(event)` -> `bool` [classmethod] — Is Note
  - `is_note_off(event)` -> `bool` [classmethod] — Is Note Off
  - `is_note_on(event)` -> `bool` [classmethod] — Is Note On

### `unreal.MidiStepSequence`
Inherits: `Object` | Header: `MidiStepSequence.h`

This class represents a step sequence table. It is used by the MetasSound Step Sequence node to generate midi note on/off messages.

**Methods** (17):
  - `disable_rows_above(first_disabled_row)` -> `None` — Disable Rows Above
  - `get_cell(row, column)` -> `StepSequenceCell` — Get Cell
  - `get_cell_on_page(page, row, column)` -> `StepSequenceCell` — Get Cell on Page
  - `get_step_table()` -> `StepSequenceTable` — Get Step Table
  - `set_cell(row, column, state)` -> `StepSequenceCell` — Set Cell
  - `set_cell_continuation(row, column, state)` -> `StepSequenceCell` — Set Cell Continuation
  - `set_cell_continuation_on_page(page, row, column, state)` -> `StepSequenceCell` — Set Cell Continuation on Page
  - `set_cell_on_page(page, row, column, state)` -> `StepSequenceCell` — Set Cell on Page
  - `set_num_columns(count)` -> `None` — Set Num Columns
  - `set_num_pages(count)` -> `None` — Set Num Pages
  - `set_num_rows(count)` -> `None` — Set Num Rows
  - `set_row_note_number(row_index, midi_note_number)` -> `bool` — Set Row Note Number
  - `set_row_velocity(row_index, midi_velocoty)` -> `bool` — Set Row Velocity
  - `set_step_skip_index(step_index)` -> `bool` — Set Step Skip Index
  - `set_step_table(new_step_table)` -> `None` — Set Step Table
  - `toggle_cell(row, column)` -> `StepSequenceCell` — Toggle Cell
  - `toggle_cell_on_page(page, row, column)` -> `StepSequenceCell` — Toggle Cell on Page

**Properties** (4):
  - `columns`: `int` — [Read-Write] (int32)
  - `pages`: `int` — [Read-Write] (int32)
  - `rows`: `int` — [Read-Write] (int32)
  - `step_table`: `StepSequenceTable` [Read-Only] — [Read-Only] (StepSequenceTable)

### `unreal.MusicClockComponent`
Inherits: `ActorComponent` | Header: `MusicClockComponent.h`

Music Clock Component

**Methods** (66):
  - `bar_to_ms(bar)` -> `float` — Bar to Ms
  - `beat_to_ms(beat)` -> `float` — Beat to Ms
  - `connect_to_metasound_on_audio_component(audio_component)` -> `bool` — Connect to Metasound on Audio Component
  - `connect_to_wall_clock_for_midi(tempo_map)` -> `None` — Connect to Wall Clock for Midi
  - `continue_()` -> `None` — Continue the clock from paused
  - `create_metasound_driven_music_clock(world_context_object, audio_component, metasound_ouput_pin_name = 'MIDIClock', start = True)` -> `MusicClockComponent` [classmethod] — Create Metasound Driven Music Clock
  - `create_music_clock_component(world_context_object: Object, audio_component: AudioComponent, metasound_ouput_pin_name: Name = 'MIDIClock', start: bool = True)` -> `MusicClockComponent` [classmethod] — deprecated: âcreate_music_clock_componentâ was renamed to âcreate_metasound_driven_music_clockâ.
  - `create_wall_clock_driven_music_clock(world_context_object, with_tempo_map, start = True)` -> `MusicClockComponent` [classmethod] — Create Wall Clock Driven Music Clock
  - `get_bars_including_count_in(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Returns the fractional total bars from the beginning of the authored music content. NOTE: INCLUDES time for count-in and...
  - `get_beat_in_bar_at_ms(ms)` -> `float` — Get Beat in Bar at Ms
  - `get_beats_including_count_in(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Returns the fractional total beats from the beginning of the authored music content. NOTE: INCLUDES time for count-in an...
  - `get_count_in_seconds()` -> `float` — Get Count in Seconds
  - `get_current_bar_duration_seconds()` -> `float` — Get The Current Bar Duration in Seconds Based on the current tempo, advance rate and time signature 0 if the clock is st...
  - `get_current_beat_duration_seconds()` -> `float` — Get The Current Beat Duration in Seconds Based on the current tempo, advance rate and time signature 0 if the clock is s...
  - `get_current_clock_advance_rate()` -> `float` — Get The Current Clock advance rate 0 if the clock is stopped
  - `get_current_player_experienced_song_pos()` -> `MidiSongPos` — Get Current Player Experienced Song Pos
  - `get_current_raw_audio_render_song_pos()` -> `MidiSongPos` — Get Current Raw Audio Render Song Pos
  - `get_current_section_index(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `int32` — Returns the index of the current section for the provided time base. [0, Num-1]
  - `get_current_section_length_ms(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Returns the length of the current section in milliseconds
  - `get_current_section_name(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `str` — Returns the name of the section that weâre currently in (intro, chorus, outro)
  - `get_current_section_start_ms(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Returns the start time of the current section in milliseconds
  - `get_current_smoothed_audio_render_song_pos()` -> `MidiSongPos` — Getter functions for the Blueprint properties exposed aboveâ¦
  - `get_current_tempo()` -> `float` — Get The Current Tempo (BPM) of the runnig clock 0 if the clock is stopped
  - `get_current_time_signature(out_denominator=int32)` — Get The Current Time Signature 0 if the clock is stopped
  - `get_current_timestamp(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `MusicTimestamp`
  - `get_current_video_render_song_pos()` -> `MidiSongPos` — Get Current Video Render Song Pos
  - `get_delta_bar(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Get Delta Bar
  - `get_delta_beat(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Get Delta Beat
  - `get_distance_from_current_bar(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Gets a value expressed in bars between 0-1 that indicates how much progress we made towards the current bar to the next ...
  - `get_distance_from_current_beat(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Gets a value expressed in beats between 0-1 that indicates how much progress we made in the current beat
  - `get_distance_to_closest_bar(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Gets value expressed in bars between 0-1 that indicates how close we are to the closest bar (current bar or next bar).
  - `get_distance_to_closest_beat(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Gets a value expressed in beats between 0-1 that indicates how close we are to the closest beat (current beat or next be...
  - `get_distance_to_next_bar(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Gets a value expressed in bars between 0-1 that indicates how close we are to the next bar.
  - `get_distance_to_next_beat(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Gets a value expressed in beats between 0-1 that indicates how close we are to the next beat.
  - `get_ms_per_bar_at_ms(ms)` -> `float` — Get Ms Per Bar at Ms
  - `get_ms_per_beat_at_ms(ms)` -> `float` — Get Ms Per Beat at Ms
  - `get_num_beats_in_bar_at_ms(ms)` -> `float` — Get Num Beats in Bar at Ms
  - `get_num_sections()` -> `int32` — Get Num Sections
  - `get_previous_player_experienced_song_pos()` -> `MidiSongPos` — Get Previous Player Experienced Song Pos
  - `get_previous_smoothed_audio_render_song_pos()` -> `MidiSongPos` — Get Previous Smoothed Audio Render Song Pos
  - `get_previous_song_pos(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `MidiSongPos` — Get Previous Song Pos
  - `get_previous_video_render_song_pos()` -> `MidiSongPos` — Get Previous Video Render Song Pos
  - `get_run_past_music_end()` -> `bool` — Get Run Past Music End
  - `get_seconds_from_bar_one(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Time from Bar 1 Beat 1. The classic âstart of the songâ. NOTE: DOES NOT INCLUDE time for count-in and pickup bars.
  - `get_seconds_including_count_in(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Time from the beginning of the authored music content. NOTE: INCLUDES time for count-in and pickup bars.
  - `get_section_end_ms_at_ms(ms)` -> `float` — Get Section End Ms at Ms
  - `get_section_length_ms_at_ms(ms)` -> `float` — Get Section Length Ms at Ms
  - `get_section_name_at_ms(ms)` -> `str` — Get Section Name at Ms
  - `get_section_start_ms_at_ms(ms)` -> `float` — Get Section Start Ms at Ms
  - `get_song_length_bars()` -> `float` — Get Song Length Bars
  - `get_song_length_beats()` -> `float` — Get Song Length Beats
  - `get_song_length_ms()` -> `float` — Get Song Length Ms
  - `get_song_pos(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `MidiSongPos` — Get Song Pos
  - `get_song_remaining_ms(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Returns the remaining time until the end of the MIDI in milliseconds based on the timestamp corresponding to the passed ...
  - `get_song_remaining_time(timebase: CalibratedMusicTimebase = Ellipsis)` -> `float` — deprecated: âget_song_remaining_timeâ was renamed to âget_song_remaining_msâ.
  - `get_song_sections()` -> `Array [ SongSection ]` — Get Song Sections
  - `get_state()` -> `MusicClockState` — Get State
  - `looped_this_frame(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `bool` — Returns true if there was a seek in the specified timebase
  - `measure_span_progress(span, timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `float` — Measure Span Progress
  - `pause()` -> `None` — Pause the clock at the current running time
  - `seeked_this_frame(timebase = CalibratedMusicTimebase.VIDEO_RENDER_TIME)` -> `bool` — Returns true if there was a seek in the specified timebase
  - `set_run_past_music_end(run_past_music_end)` -> `None` — Set Run Past Music End
  - `set_tempo_map_for_wall_clock(tempo_map)` -> `None` — Set the tempo map when running off of wall clock
  - `start()` -> `None` — Start the clock ticking and tracking music time Same as âActivateâ
  - `stop()` -> `None` — Stop this clock ticking and no longer track music time Same as âDeactivateâ
  - `tick_to_ms(tick)` -> `float` — Tick to Ms

**Properties** (23):
  - `audio_render_music_time_discontinuity_event`: `MusicTimeDiscontinuityEvent` — [Read-Write] (MusicTimeDiscontinuityEvent)
  - `bar_event`: `BarEvent` — [Read-Write] (BarEvent)
  - `beat_event`: `BeatEvent` — [Read-Write] (BeatEvent)
  - `current_bar_duration_sec`: `float` [Read-Only] — [Read-Only] (float)
  - `current_beat_duration_sec`: `float` [Read-Only] — [Read-Only] (float)
  - `current_player_experienced_song_pos`: `MidiSongPos` [Read-Only] — [Read-Only] (MidiSongPos)
  - `current_raw_audio_render_song_pos`: `MidiSongPos` [Read-Only] — [Read-Only] (MidiSongPos)
  - `current_smoothed_audio_render_song_pos`: `MidiSongPos` [Read-Only] — [Read-Only] Donât let C++ access these directly! They are a blueprint convenience and only work be...
  - `current_song_pos`: `MidiSongPos` — âcurrent_song_posâ was renamed to âcurrent_smoothed_audio_render_song_posâ. deprecated
  - `current_video_render_song_pos`: `MidiSongPos` [Read-Only] — [Read-Only] (MidiSongPos)
  - `default_clock_advance_rate`: `float` — [Read-Write] Default Clock Advance Rate
used for Wall clock with no tempo map NOT THE CURRENT RUNNIN...
  - `default_tempo`: `float` — [Read-Write] Default Tempo (BPM)
used for Wall clock with no tempo map NOT THE CURRENT RUNNING TEMPO...
  - `default_time_signature_denom`: `int` — [Read-Write] Default Time Signature (Denominator)
used for the Wall clock with no tempo map NOT THE ...
  - `default_time_signature_num`: `int` — [Read-Write] Default Time Signature (Numerator)
used for the Wall Clock with no tempo map NOT THE CU...
  - `metasounds_audio_component`: `AudioComponent` [Read-Only] — [Read-Only] (AudioComponent)
  - `music_clock_connected_event`: `MusicClockConnected` — [Read-Write] (MusicClockConnected)
  - `music_clock_disconnected_event`: `MusicClockDisconnected` — [Read-Write] (MusicClockDisconnected)
  - `play_state_event`: `PlayStateEvent` — [Read-Write] (PlayStateEvent)
  - `player_experience_music_time_discontinuity_event`: `MusicTimeDiscontinuityEvent` — [Read-Write] (MusicTimeDiscontinuityEvent)
  - `run_past_music_end`: `bool` — [Read-Write] (bool)
  - `section_event`: `SectionEvent` — [Read-Write] (SectionEvent)
  - `timebase_for_bar_and_beat_events`: `CalibratedMusicTimebase` — [Read-Write] (CalibratedMusicTimebase)
  - `video_render_music_time_discontinuity_event`: `MusicTimeDiscontinuityEvent` — [Read-Write] (MusicTimeDiscontinuityEvent)

### `unreal.MusicParameterBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MusicParameterBlueprintLibrary.h`

Music Parameter Blueprint Library

**Methods** (9):
  - `get_music_loop_configuration(target, result=SetParamResult)` — Get Music Loop Configuration
  - `get_music_seek_request(target, result=SetParamResult)` — Get Music Seek Request
  - `get_music_timestamp(target, result=SetParamResult)` — Get Music Timestamp
  - `has_music_loop_configuration(target, name)` -> `bool` — Has Music Loop Configuration
  - `has_music_seek_request(target, name)` -> `bool` — Has Music Seek Request
  - `has_music_timestamp(target, name)` -> `bool` — Has Music Timestamp
  - `set_music_loop_configuration(target, parameter_name, value, result=SetParamResult)` [classmethod] — / FMusicLoopConfiguration
  - `set_music_seek_request(target, parameter_name, value, result=SetParamResult)` [classmethod] — / FMusicSeekRequest
  - `set_music_timestamp(target, parameter_name, value, result=SetParamResult)` [classmethod] — / FMusicTimestamp

### `unreal.MusicTempometerComponent`
Inherits: `ActorComponent` | Header: `MusicTempometerComponent.h`

UMusicTempometerComponent provides playback properties of a UMusicClockComponent on its actor and optionally updates a UMaterialParameterCollection.

**Methods** (15):
  - `get_bar_progress()` -> `float` — Progress of the current bar [0, 1).
  - `get_bars_including_count_in()` -> `float` — Bars from the beginning of the music. Includes all count-in and pickup bars (ie. wonât be negative when the music star...
  - `get_beat_progress()` -> `float` — Progress of the current beat [0, 1).
  - `get_beats_including_count_in()` -> `float` — Beats from the beginning of the music. Includes all count-in and pickup bars/beats (ie. wonât be negative when the mus...
  - `get_clock_no_mutex()` -> `MusicClockComponent` — Get Clock No Mutex
  - `get_material_parameter_collection()` -> `MaterialParameterCollection` — Get Material Parameter Collection
  - `get_seconds_from_bar_one()` -> `float` — Seconds from Bar 1 Beat 1 of the music. If the music has a count-in or pickup bars this number may be negative when the ...
  - `get_seconds_including_count_in()` -> `float` — Seconds from the beginning of the entire music authoring. Includes all count-in and pickup bars (ie. wonât be negative...
  - `get_song_pos()` -> `MidiSongPos` — The FSongPos for which the game thread is currently issuing graphics rendering commands, according to calibration data.
  - `get_tempo()` -> `float` — Current tempo (beats per minute).
  - `get_time_signature_denominator()` -> `float` — Current time signature denominator (scale from note duration to beat fraction for a simple meter).
  - `get_time_signature_numerator()` -> `float` — Current time signature numerator (beats per bar for a simple meter).
  - `get_timestamp()` -> `MusicTimestamp`
  - `set_clock(clock_component)` -> `None` — SetSongPosInterface allows setting any UObject implementing the ISongPosInterface as the attribute source.
  - `set_clock_from_actor(actor)` -> `None` — SetSongPosInterfaceFromActor sets the actor or the first of its owned components that implements ISongPosInterface as th...

**Properties** (3):
  - `material_parameter_collection`: `MaterialParameterCollection` — [Read-Write] (MaterialParameterCollection)
  - `music_clock`: `MusicClockComponent` — [Read-Write] Music whose tempo to detect. (MusicClockComponent)
  - `song_pos`: `MidiSongPos` [Read-Only] — [Read-Only] (MidiSongPos)

### `unreal.MusicTimestampBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MusicTimestamp.h`

Music Timestamp Blueprint Library

**Methods** (2):
  - `get_music_timestamp(success=bool)` [classmethod] — Get Music Timestamp
  - `is_music_timestamp(output)` -> `bool` [classmethod] — Is Music Timestamp

### `unreal.TimeSignatureBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `TimeSignature.h`

Time Signature Blueprint Library

**Methods** (2):
  - `get_time_signature(success=bool)` [classmethod] — Get Time Signature
  - `is_time_signature(output)` -> `bool` [classmethod] — Is Time Signature

### `unreal.MusicClockDriveMethod`
Inherits: `EnumBase` | Header: `MusicClockComponent.h`

EMusic Clock Drive Method

**Properties** (2):
  - `META_SOUND`: `MusicClockDriveMethod = Ellipsis` — 1
  - `WALL_CLOCK`: `MusicClockDriveMethod = Ellipsis` — 0

### `unreal.MusicClockState`
Inherits: `EnumBase` | Header: `MusicClockComponent.h`

EMusic Clock State

**Properties** (3):
  - `PAUSED`: `MusicClockState = Ellipsis` — 1
  - `RUNNING`: `MusicClockState = Ellipsis` — 2
  - `STOPPED`: `MusicClockState = Ellipsis` — 0

### `unreal.MusicTimeDiscontinuityType`
Inherits: `EnumBase` | Header: `MusicClockComponent.h`

EMusic Time Discontinuity Type

**Properties** (2):
  - `LOOP`: `MusicTimeDiscontinuityType = Ellipsis` — 0
  - `SEEK`: `MusicTimeDiscontinuityType = Ellipsis` — 1

### `unreal.SeekPointType`
Inherits: `EnumBase` | Header: `MusicSeekRequest.h`

ESeek Point Type

**Properties** (2):
  - `BAR_BEAT`: `SeekPointType = Ellipsis` — 0
  - `MILLISECOND`: `SeekPointType = Ellipsis` — 1

### `unreal.BarEvent`
Inherits: `MulticastDelegateBase` | Header: `MusicClockComponent.h`

Bar Event Delegate Signature

### `unreal.BeatEvent`
Inherits: `MulticastDelegateBase` | Header: `MusicClockComponent.h`

Beat Event Delegate Signature

### `unreal.MusicClockConnected`
Inherits: `MulticastDelegateBase` | Header: `MusicClockComponent.h`

Music Clock Connected Delegate Signature

### `unreal.MusicClockDisconnected`
Inherits: `MulticastDelegateBase` | Header: `MusicClockComponent.h`

Music Clock Disconnected Delegate Signature

### `unreal.MusicTimeDiscontinuityEvent`
Inherits: `MulticastDelegateBase` | Header: `MusicClockComponent.h`

Music Time Discontinuity Event Delegate Signature

### `unreal.PlayStateEvent`
Inherits: `MulticastDelegateBase` | Header: `MusicClockComponent.h`

Play State Event Delegate Signature

### `unreal.SectionEvent`
Inherits: `MulticastDelegateBase` | Header: `MusicClockComponent.h`

Section Event Delegate Signature
