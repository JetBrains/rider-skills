# UE Python API — TakeRecorderSources Module

**13 types** from the `TakeRecorderSources` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TakeRecorderActorSource`, `TakeRecorderCameraCutSource`, `TakeRecorderLevelSequenceSource`, `TakeRecorderLevelVisibilitySource`, `TakeRecorderLevelVisibilitySourceSettings`, `TakeRecorderMicrophoneAudioManager`, `TakeRecorderMicrophoneAudioSource`, `TakeRecorderMicrophoneAudioSourceSettings`, `TakeRecorderNearbySpawnedActorSource`, `TakeRecorderPlayerSource`, `TakeRecorderWorldSource`, `TakeRecorderWorldSourceSettings`, `TakeRecorderActorRecordType`

---

## Classes

### `unreal.TakeRecorderActorSource`
Inherits: `TakeRecorderSource` | Header: `TakeRecorderActorSource.h`

This Take Recorder Source can record an actor from the Worldâs properties. Records the properties of the actor and the components on the actor and safely handles new components being spawned at runt...

**Methods** (4):
  - `add_source_for_actor(actor, sources)` -> `TakeRecorderSource` [classmethod]
  - `get_source_actor()` -> `Actor` — Get Source Actor
  - `remove_actor_from_sources(actor, sources)` -> `None` [classmethod]
  - `set_source_actor(target)` -> `None` — Set the Target actor that we are going to record. Will reset the Recorded Property Map to defaults.

**Properties** (7):
  - `exclude_animation_names`: `None` — [Read-Write] Exclude all animation bones/curves that match this list (Array[str])
  - `include_animation_names`: `None` — [Read-Write] Include only the animation bones/curves that match this list (Array[str])
  - `record_parent_hierarchy`: `bool` — [Read-Write] Whether to ensure that the parent hierarchy is also recorded. If recording to possessab...
  - `record_type`: `TakeRecorderActorRecordType` — [Read-Write] Should this actor be recorded as a Possessable in Sequencer? If so the resulting Object...
  - `recorded_properties`: `ActorRecorderPropertyMap` — [Read-Write] Lists the properties and components on the current actor and whether or not each proper...
  - `reduce_keys`: `bool` — [Read-Write] Whether to perform key-reduction algorithms as part of the recording (bool)
  - `target`: `Actor` — [Read-Write] Reference to the actor in the world that should have itâs properties recorded. (Actor...

### `unreal.TakeRecorderCameraCutSource`
Inherits: `TakeRecorderSource` | Header: `TakeRecorderCameraCutSource.h`

A recording source that detects camera switching and creates a camera cut track

### `unreal.TakeRecorderLevelSequenceSource`
Inherits: `TakeRecorderSource` | Header: `TakeRecorderLevelSequenceSource.h`

Plays level sequence actors when recording starts

**Properties** (1):
  - `level_sequences_to_trigger`: `None` — [Read-Write] (Array[LevelSequence])

### `unreal.TakeRecorderLevelVisibilitySource`
Inherits: `TakeRecorderLevelVisibilitySourceSettings` | Header: `TakeRecorderLevelVisibilitySource.h`

A recording source that records level visibility state

### `unreal.TakeRecorderLevelVisibilitySourceSettings`
Inherits: `TakeRecorderSource` | Header: `TakeRecorderLevelVisibilitySource.h`

A recording source that records level visibilitiy

**Properties** (1):
  - `level_visibility_track_name`: `Text` — [Read-Write] Name of the recorded level visibility track name (Text)

### `unreal.TakeRecorderMicrophoneAudioManager`
Inherits: `TakeRecorderAudioInputSettings` | Header: `TakeRecorderMicrophoneAudioManager.h`

**Properties** (1):
  - `audio_input_device`: `AudioInputDeviceProperty` — [Read-Write] The audio device to use for this microphone source (AudioInputDeviceProperty)

### `unreal.TakeRecorderMicrophoneAudioSource`
Inherits: `TakeRecorderMicrophoneAudioSourceSettings` | Header: `TakeRecorderMicrophoneAudioSource.h`

A recording source that records microphone audio

**Properties** (4):
  - `audio_channel`: `AudioInputDeviceChannelProperty` — [Read-Write] The audio device to use for this microphone source (AudioInputDeviceChannelProperty)
  - `audio_gain`: `float` — [Read-Write] Gain in decibels to apply to recorded audio (float)
  - `replace_recorded_audio`: `bool` — [Read-Write] Replace existing recorded audio with any newly recorded audio (bool)
  - `split_audio_channels_into_separate_tracks`: `bool` — [Read-Write]
deprecated: SplitAudioChannelsIntoSeparateTracks is deprecated. (bool)

### `unreal.TakeRecorderMicrophoneAudioSourceSettings`
Inherits: `TakeRecorderSource` | Header: `TakeRecorderMicrophoneAudioSource.h`

A recording source that records microphone audio

**Properties** (4):
  - `audio_asset_name`: `str` — [Read-Write] The name of the audio asset.
Supports any of the following format specifiers that will ...
  - `audio_source_name`: `Text` — [Read-Write] Name of the audio source (Text)
  - `audio_sub_directory`: `str` — [Read-Write] The name of the subdirectory audio will be placed in. Leave this empty to place into th...
  - `audio_track_name`: `Text` — [Read-Write] Name of the recorded audio track (Text)

### `unreal.TakeRecorderNearbySpawnedActorSource`
Inherits: `TakeRecorderSource` | Header: `TakeRecorderNearbySpawnedActorSource.h`

A recording source that detects actors spawned close to the current camera, and captures them as spawnables

**Properties** (3):
  - `filter_spawned_actors`: `bool` — [Read-Write] Should we only record actors that pass the filter list? (bool)
  - `filter_types`: `None` — [Read-Write] A type filter to apply to spawned objects (Array[type(Class)])
  - `proximity`: `float` — [Read-Write] The proximity to the current camera that an actor must be spawned in order to be record...

### `unreal.TakeRecorderPlayerSource`
Inherits: `TakeRecorderSource` | Header: `TakeRecorderPlayerSource.h`

A recording source that records the current player

### `unreal.TakeRecorderWorldSource`
Inherits: `TakeRecorderWorldSourceSettings` | Header: `TakeRecorderWorldSource.h`

A recording source that records world state

### `unreal.TakeRecorderWorldSourceSettings`
Inherits: `TakeRecorderSource` | Header: `TakeRecorderWorldSource.h`

A recording source that records world state

**Properties** (2):
  - `autotrack_actors`: `bool` — [Read-Write] Add a binding and track for all actors that arenât explicitly being recorded (bool)
  - `record_world_settings`: `bool` — [Read-Write] Record world settings (bool)

### `unreal.TakeRecorderActorRecordType`
Inherits: `EnumBase` | Header: `TakeRecorderActorSource.h`

ETake Recorder Actor Record Type

**Properties** (3):
  - `POSSESSABLE`: `TakeRecorderActorRecordType = Ellipsis` — 0
  - `PROJECT_DEFAULT`: `TakeRecorderActorRecordType = Ellipsis` — 2
  - `SPAWNABLE`: `TakeRecorderActorRecordType = Ellipsis` — 1
