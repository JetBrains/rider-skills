# UE Python API — SoundUtilities Module

**3 types** from the `SoundUtilities` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SoundVariation`, `SoundSimple`, `SoundUtilitiesBPFunctionLibrary`

---

## Classes

### `unreal.SoundVariation`
Inherits: `StructBase` | Header: `SoundSimple.h`

Sound Variation

**Properties** (4):
  - `pitch_range`: `Vector2D` — [Read-Write] The pitch range to use for this variation (Vector2D)
  - `probability_weight`: `float` — [Read-Write] The probability weight to use for this variation (float)
  - `sound_wave`: `SoundWave` — [Read-Write] The sound wave asset to use for this variation (SoundWave)
  - `volume_range`: `Vector2D` — [Read-Write] The volume range to use for this variation (Vector2D)

### `unreal.SoundSimple`
Inherits: `SoundBase` | Header: `SoundSimple.h`

Class which contains a simple list of sound wave variations

**Properties** (1):
  - `variations`: `None` — [Read-Write] List of variations for the simple sound (Array[SoundVariation])

### `unreal.SoundUtilitiesBPFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SoundUtilities.h`

Sound Utilities Blueprint Function Library A library of Sound related functions for use in Blueprints

**Methods** (12):
  - `convert_decibels_to_linear(decibels)` -> `float` [classmethod] — Converts decibel to linear scale
  - `convert_linear_to_decibels(linear, floor)` -> `float` [classmethod] — Converts linear scale volume to decibels
  - `get_bandwidth_from_q(q)` -> `float` [classmethod] — Helper function to get bandwidth from Q
  - `get_beat_tempo(beats_per_minute = 120.000000, beat_multiplier = 1, divisions_of_whole_note = 4)` -> `float` [classmethod] — Calculates a beat time in seconds from the given BPM, beat multiplier and divisions of a whole note.
  - `get_frequency_from_midi_pitch(midi_note)` -> `float` [classmethod] — Calculates Frequency values based on MIDI Pitch input
  - `get_frequency_multiplier_from_semitones(pitch_semitones)` -> `float` [classmethod] — Returns the frequency multiplier to scale a base frequency given the input semitones
  - `get_gain_from_midi_velocity(velocity)` -> `float` [classmethod] — Given a velocity value [0,127], return the linear gain
  - `get_linear_frequency_clamped(value, domain, range)` -> `float` [classmethod] — Returns the linear frequency of the input value. Maps log domain and range values to linear output (good for linear slid...
  - `get_log_frequency_clamped(value, domain, range)` -> `float` [classmethod] — Returns the log frequency of the input value. Maps linear domain and range values to log output (good for linear slider ...
  - `get_midi_pitch_from_frequency(frequency)` -> `int32` [classmethod] — Calculates MIDI Pitch values based on frequency input
  - `get_pitch_scale_from_midi_pitch(base_midi_note, target_midi_note)` -> `float` [classmethod] — Calculates Pitch Scalar based on starting frequency and desired MIDI Pitch output
  - `get_q_from_bandwidth(bandwidth)` -> `float` [classmethod] — Helper function to get Q from bandwidth
