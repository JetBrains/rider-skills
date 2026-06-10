# UE Python API — Soundscape Module

**17 types** from the `Soundscape` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SoundscapeColorModulationSettings`, `SoundscapeColorPlaybackSettings`, `SoundscapeColorPoint`, `SoundscapeColorPointCollection`, `SoundscapeColorPointVectorArray`, `SoundscapeColorSpawnSettings`, `SoundscapePaletteCollection`, `SoundscapePaletteColor`, `ActiveSoundscapeColor`, `ActiveSoundscapePalette`, `SoundscapeBPFunctionLibrary`, `SoundscapeColor`, `SoundscapeColorPointComponent`, `SoundscapePalette`, `SoundscapeSubsystem`, `SoundscapeColorAltitudeClampMode`, `OnSoundscapeColorParameterChanges`

---

## Classes

### `unreal.SoundscapeColorModulationSettings`
Inherits: `StructBase` | Header: `SoundscapeColor.h`

Struct

**Properties** (12):
  - `fade_volume`: `bool` — [Read-Write] Add Volume Fades to the Re-trigger Sound playback (bool)
  - `max_fade_in_time`: `float` — [Read-Write] This is the maximum Fade-In duration for re-triggered sounds (float)
  - `max_fade_out_time`: `float` — [Read-Write] This is the maximum Fade-Out duration for re-triggered sounds (float)
  - `min_fade_in_time`: `float` — [Read-Write] This is the minimum Fade-In duration for re-triggered sounds (float)
  - `min_fade_out_time`: `float` — [Read-Write] This is the minimum Fade-Out duration for re-triggered sounds (float)
  - `only_fade_in_on_retrigger`: `bool` — [Read-Write] Only Fade-In on retriggers (bool)
  - `pitch_max`: `float` — [Read-Write] Maximum Pitch Range for Step (float)
  - `pitch_min`: `float` — [Read-Write] Minimum Pitch Range for Step (float)
  - `randomize_pitch`: `bool` — [Read-Write] Add Volume Fades to the Re-trigger Sound playback (bool)
  - `randomize_volume`: `bool` — [Read-Write] Add Volume Fades to the Re-trigger Sound playback (bool)
  - `volume_max`: `float` — [Read-Write] Maximum Volume Range for Step (float)
  - `volume_min`: `float` — [Read-Write] Minimum Volume Range for Step (float)

### `unreal.SoundscapeColorPlaybackSettings`
Inherits: `StructBase` | Header: `SoundscapeColor.h`

Struct containing Sound Scape Element Control Data

**Properties** (4):
  - `limit_playback_duration`: `bool` — [Read-Write] Limit Ambient Bedâs playback duration (bool)
  - `max_playback_duration`: `float` — [Read-Write] This is the maximum playback duration for this ambient bed (assuming a looping sound), ...
  - `min_playback_duration`: `float` — [Read-Write] This is the minimum playback duration for this ambient bed (assuming a looping sound), ...
  - `randomize_starting_seek_time`: `bool` — [Read-Write] Upon starting playback, will randomly seek into the Sound if true (bool)

### `unreal.SoundscapeColorPoint`
Inherits: `StructBase` | Header: `SoundscapeColorPoint.h`

Soundscape Color Point

**Properties** (2):
  - `color_point`: `GameplayTag` — [Read-Write] (GameplayTag)
  - `location`: `Vector` — [Read-Write] (Vector)

### `unreal.SoundscapeColorPointCollection`
Inherits: `StructBase` | Header: `SoundscapeSubsystem.h`

Struct

**Properties** (1):
  - `color_point_collection`: `None` — [Read-Write] Soundscape Color Point Collection (Array[SoundscapeColorPointVectorArray])

### `unreal.SoundscapeColorPointVectorArray`
Inherits: `StructBase` | Header: `SoundscapeColorPoint.h`

Soundscape Color Point Vector Array

**Properties** (2):
  - `color_point`: `GameplayTag` — [Read-Write] (GameplayTag)
  - `locations`: `None` — [Read-Write] (Array[Vector])

### `unreal.SoundscapeColorSpawnSettings`
Inherits: `StructBase` | Header: `SoundscapeColor.h`

Struct

**Properties** (29):
  - `clamp_height`: `bool` — [Read-Write] When false, there will only be one Element spawned (bool)
  - `clamp_mode`: `SoundscapeColorAltitudeClampMode` — [Read-Write] What mode of altitude clamping to use, Relative clamps the z-axis about the location of...
  - `color_point`: `GameplayTag` — [Read-Write] Color Point (GameplayTag)
  - `continuously_respawn`: `bool` — [Read-Write] When false, there will only be one Element spawned (bool)
  - `cull_by_max_spawn_distance`: `bool` — [Read-Write] Culls the voices by the Max Spawn Distance (bool)
  - `delay_first_spawn`: `bool` — [Read-Write] Automatically Element Spawn when Element Returns Finished (bool)
  - `filter_by_color_point_density`: `bool` — [Read-Write] Filter by Color Point Density allows designers to only allow this Color to spawn in spa...
  - `ignore_z_axis_when_culling_by_max_distance`: `bool` — [Read-Write] Culls the voices by the Max Spawn Distance (bool)
  - `max_altitudinal_rotation_angle`: `float` — [Read-Write] The Maximum Altitudinal rotation in the world orientation for Element Playback (float)
  - `max_azimuthal_rotation_angle`: `float` — [Read-Write] The Maximum azimuthal rotation in the world orientation for Element Playback (float)
  - `max_first_spawn_delay`: `float` — [Read-Write] Sets the Maximum Time between Spawning Elements, checking if Elements are Finished, etc...
  - `max_number_of_spawned_elements`: `int` — [Read-Write] Max number of concurrent Elements of this type playing back at once, will not Spawn New...
  - `max_spawn_angle`: `float` — [Read-Write] The Maximum Azimuth based on the Baseâs Forward Vector in which to position Element P...
  - `max_spawn_delay`: `float` — [Read-Write] Sets the Maximum Time between Spawning Elements, checking if Elements are Finished, etc...
  - `max_spawn_distance`: `float` — [Read-Write] Sets the Maximum Distance from Base for Playback of the Element (float)
  - `max_spawn_height_clamp`: `float` — [Read-Write] After Element Playback position is determined, will clamp the Z-Axis to these ranges (f...
  - `min_altitudinal_rotation_angle`: `float` — [Read-Write] The Minimum Altitudinal rotation in the world orientation for Element Playback (float)
  - `min_azimuthal_rotation_angle`: `float` — [Read-Write] The Minimum azimuthal rotation in the world orientation for Element Playback (float)
  - `min_color_point_number`: `int` — [Read-Write] Minimum number of Color Point density required before spawn is successful (int32)
  - `min_first_spawn_delay`: `float` — [Read-Write] Sets Minimum Time between Spawning Elements, checking if Elements are Finished, etc. (f...
  - `min_spawn_angle`: `float` — [Read-Write] The Minimum Azimuth based on the Baseâs Forward Vector in which to position Element P...
  - `min_spawn_delay`: `float` — [Read-Write] Sets Minimum Time between Spawning Elements, checking if Elements are Finished, etc. (f...
  - `min_spawn_distance`: `float` — [Read-Write] Sets Minimum Distance from Base for Playback of the Element (float)
  - `min_spawn_height_clamp`: `float` — [Read-Write] After Element Playback position is determined, will clamp the Z-Axis to these ranges (f...
  - `position_by_trace`: `bool` — [Read-Write] Position By Trace allows sounds to be repositioned from their spawn point to a new poin...
  - `rotate_sound_source`: `bool` — [Read-Write] When false, the sound rotation will be unmodified (bool)
  - `trace_channel`: `CollisionChannel` — [Read-Write] The physics trace channel to use (CollisionChannel)
  - `trace_distance`: `float` — [Read-Write] Trace distance (float)
  - `trace_vector`: `Vector` — [Read-Write] The Minimum nomralized directional vector in world orientation for the Trace to fire (d...

### `unreal.SoundscapePaletteCollection`
Inherits: `StructBase` | Header: `SoundscapeSubsystem.h`

Struct

**Properties** (1):
  - `soundscape_palette_collection`: `None` — [Read-Write] Soundscape Palette Collection (Set[SoftObjectPath])

### `unreal.SoundscapePaletteColor`
Inherits: `StructBase` | Header: `SoundScapePalette.h`

Struct storing Modulation State

**Properties** (5):
  - `color_fade_in`: `float` — [Read-Write] Volume Fade In Time (float)
  - `color_fade_out`: `float` — [Read-Write] Volume Fade Out Time (float)
  - `color_pitch`: `float` — [Read-Write] Base Pitch Scalar (float)
  - `color_volume`: `float` — [Read-Write] Base Volume Scalar (float)
  - `soundscape_color`: `SoundscapeColor` — [Read-Write] Soundscape Color to Play (SoundscapeColor)

### `unreal.ActiveSoundscapeColor`
Inherits: `Object` | Header: `SoundscapeColor.h`

Active Soundscape Color

**Methods** (3):
  - `is_playing()` -> `bool` — Is playing
  - `play(color_volume = 1.000000, color_pitch = 1.000000, color_fade_in_time = 1.000000)` -> `None` — Play Active Soundscape Color
  - `stop(color_fade_out_time = 1.000000)` -> `None` — Stop Active Soundscape Color

### `unreal.ActiveSoundscapePalette`
Inherits: `Object` | Header: `SoundScapePalette.h`

Active Soundscape Palette

**Methods** (2):
  - `play()` -> `None` — Play
  - `stop()` -> `None` — Stop

### `unreal.SoundscapeBPFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SoundScape.h`

Soundscape BPFunction Library

**Methods** (2):
  - `spawn_soundscape_color(world_context_object, soundscape_color_in)` -> `ActiveSoundscapeColor or None` [classmethod] — Spawns, but does not play, a new Soundscape Elemental Agent. Returns true if spawn was successful. âPlayâ can be cal...
  - `spawn_soundscape_palette(world_context_object, soundscape_palette_in)` -> `ActiveSoundscapePalette or None` [classmethod] — Spawns a new Soundscape Palette Agent. Returns true if spawn was successful.

### `unreal.SoundscapeColor`
Inherits: `Object` | Header: `SoundscapeColor.h`

Soundscape Color

**Properties** (6):
  - `modulation_behavior`: `SoundscapeColorModulationSettings` — [Read-Write] Modulation behavior (SoundscapeColorModulationSettings)
  - `pitch_base`: `float` — [Read-Write] Base Pitch Scalar (float)
  - `playback_behavior`: `SoundscapeColorPlaybackSettings` — [Read-Write] Playback behavior (SoundscapeColorPlaybackSettings)
  - `sound`: `SoundBase` — [Read-Write] Sound to Play (SoundBase)
  - `spawn_behavior`: `SoundscapeColorSpawnSettings` — [Read-Write] Playback behavior (SoundscapeColorSpawnSettings)
  - `volume_base`: `float` — [Read-Write] Base Volume Scalar (float)

### `unreal.SoundscapeColorPointComponent`
Inherits: `ActorComponent` | Header: `SoundscapeColorPoint.h`

Soundscape Color Point Component

**Properties** (1):
  - `color_point`: `GameplayTag` — [Read-Write] This Componentâs Soundscape Pigment value (GameplayTag)

### `unreal.SoundscapePalette`
Inherits: `Object` | Header: `SoundScapePalette.h`

Class containing relevant data for a Soundscape Element

**Properties** (2):
  - `colors`: `None` — [Read-Write] Elements (Array[SoundscapePaletteColor])
  - `soundscape_palette_playback_conditions`: `GameplayTagQuery` — [Read-Write] (GameplayTagQuery)

### `unreal.SoundscapeSubsystem`
Inherits: `GameInstanceSubsystem` | Header: `SoundscapeSubsystem.h`

Soundscape Subsystem

**Methods** (8):
  - `add_color_point_collection(color_point_collection_name, color_point_collection)` -> `None` — Add a Color Point Collection to the Subsystem, returns true if successful
  - `add_palette_collection(palette_collection_name, palette_collection)` -> `bool` — Add Palette Collection
  - `check_color_point_density(location, color_point)` -> `int32` — Check Color Point Density for a Location Cell
  - `clear_state(soundscape_state)` -> `None` — Clear State
  - `remove_color_point_collection(color_point_collection_name)` -> `bool` — Remove a Color Point Collection from the Subsystem, returns true if successful
  - `remove_palette_collection(palette_collection_name)` -> `bool` — Remove Palette Collection
  - `restart_soundscape()` -> `None` — Restart Soundscape
  - `set_state(soundscape_state)` -> `None` — Set State

### `unreal.SoundscapeColorAltitudeClampMode`
Inherits: `EnumBase` | Header: `SoundscapeColor.h`

ESoundscape Color Altitude Clamp Mode

**Properties** (2):
  - `ABSOLUTE`: `SoundscapeColorAltitudeClampMode = Ellipsis` — Altitude relative to the listener location 1
  - `RELATIVE`: `SoundscapeColorAltitudeClampMode = Ellipsis` — 0

### `unreal.OnSoundscapeColorParameterChanges`
Inherits: `MulticastDelegateBase` | Header: `SoundscapeColor.h`

UObject delegate to broadcast parameter changes to ActiveSoundscapeColor instances.
