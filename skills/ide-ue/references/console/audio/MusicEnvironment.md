# UE Python API — MusicEnvironment Module

**6 types** from the `MusicEnvironment` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MusicClockSourceManager`, `MusicEnvironmentClockSource`, `MusicEnvironmentMetronome`, `MusicEnvironmentSubsystem`, `MusicalSyncPointCaptureMode`, `MusicalTimeSignatureRemapMode`

---

## Classes

### `unreal.MusicClockSourceManager`
Inherits: `Object` | Header: `MusicClockSourceManager.h`

Music Clock Source Manager

**Methods** (8):
  - `add_tagged_clock(tag, clock)` -> `None` — Add Tagged Clock
  - `find_clock(tag, exact_match = True)` -> `MusicEnvironmentClockSource` — Find Clock
  - `get_global_music_clock_authority()` -> `MusicEnvironmentClockSource` — Get Global Music Clock Authority
  - `pop_music_clock_authority()` -> `None` — Pop Music Clock Authority
  - `push_global_music_clock_authority(clock)` -> `bool` — Push Global Music Clock Authority
  - `remove_clock_with_tag(tag)` -> `None` — Remove Clock with Tag
  - `remove_global_clock_authority(clock)` -> `None` — Remove Global Clock Authority
  - `remove_tagged_clock(clock)` -> `None` — Remove Tagged Clock

### `unreal.MusicEnvironmentClockSource`
Inherits: `Interface` | Header: `MusicEnvironmentClockSource.h`

Music Environment Clock Source

### `unreal.MusicEnvironmentMetronome`
Inherits: `MusicEnvironmentClockSource` | Header: `MusicEnvironmentMetronome.h`

Music Environment Metronome

### `unreal.MusicEnvironmentSubsystem`
Inherits: `EngineSubsystem` | Header: `MusicEnvironmentSubsystem.h`

Music Environment Subsystem

**Methods** (3):
  - `can_spawn_metronome()` -> `bool` — Can Spawn Metronome
  - `get_clock_source_manager()` -> `MusicClockSourceManager` — Get Clock Source Manager
  - `spawn_metronome(outer, name = 'None')` -> `MusicEnvironmentMetronome` — Spawn Metronome

### `unreal.MusicalSyncPointCaptureMode`
Inherits: `EnumBase` | Header: `MusicalEnums.h`

EMusical Sync Point Capture Mode

**Properties** (5):
  - `DIRECT_MAPPED`: `MusicalSyncPointCaptureMode = Ellipsis` — Bar 1 | Beat 1 of the level sequence is mapped directly to Bar 1 | Beat 1 of the driving music clock...
  - `IMMEDIATE`: `MusicalSyncPointCaptureMode = Ellipsis` — Bar 1 | Beat 1 of the level sequence will be mapped to the current position of the music clock. Now ...
  - `NEAREST_QUANTIZED_POSITION`: `MusicalSyncPointCaptureMode = Ellipsis` — Bar 1 | Beat 1 of the level sequence is mapped to the NEAREST specified quantized musical subdivisio...
  - `NEXT_QUANTIZED_POSITION`: `MusicalSyncPointCaptureMode = Ellipsis` — Bar 1 | Beat 1 of the level sequence is mapped to the NEXT specified quantized musical subdivision. ...
  - `PREVIOUS_QUANTIZED_POSITION`: `MusicalSyncPointCaptureMode = Ellipsis` — Bar 1 | Beat 1 of the level sequence is mapped to the Previous specified quantized musical subdivisi...

### `unreal.MusicalTimeSignatureRemapMode`
Inherits: `EnumBase` | Header: `MusicalEnums.h`

EMusical Time Signature Remap Mode

**Properties** (4):
  - `CROP_OR_LOOP_BARS`: `MusicalTimeSignatureRemapMode = Ellipsis` — Crop or loop bars as necessary to align downbeats between the level sequence and the music clock. 2
  - `NONE`: `MusicalTimeSignatureRemapMode = Ellipsis` — No attempt is made to maintain âbar synchronizationâ if there are mismatched time signature. 0
  - `SCALE_BARS`: `MusicalTimeSignatureRemapMode = Ellipsis` — Scale each bar as necessary to match bar lengths in music clock. 1
  - `SCALE_BEATS_AND_CROP_OR_LOOP`: `MusicalTimeSignatureRemapMode = Ellipsis` — Scale beats to match music clock beat lengths, and THEN crop or loop bars as necessary to align down...
