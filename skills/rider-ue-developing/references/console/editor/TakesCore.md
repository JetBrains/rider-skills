# UE Python API — TakesCore Module

**16 types** from the `TakesCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ActorRecordedProperty`, `AudioInputDeviceChannelProperty`, `AudioInputDeviceInfoProperty`, `AudioInputDeviceProperty`, `TakeRecorderTargetRecordClassProperty`, `ActorRecorderPropertyMap`, `TakeMetaData`, `TakePreset`, `TakePresetSettings`, `TakeRecorderAudioInputSettings`, `TakeRecorderNamingTokensContext`, `TakeRecorderSource`, `TakeRecorderSources`, `TakesCoreBlueprintLibrary`, `TakesCoreBlueprintLibrary_OnTakeRecorderSlateChanged`, `TakesCoreBlueprintLibrary_OnTakeRecorderTakeNumberChanged`

---

## Classes

### `unreal.ActorRecordedProperty`
Inherits: `StructBase` | Header: `TakeRecorderSourceProperty.h`

Actor Recorded Property

**Properties** (2):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `property_name`: `Name` — [Read-Write] (Name)

### `unreal.AudioInputDeviceChannelProperty`
Inherits: `StructBase` | Header: `TakeRecorderSourceProperty.h`

This class is used by Microphone sources to track the currently selected channel. It aslo contains a local cache of the max channel count for the currently selected audio device.

**Properties** (1):
  - `audio_input_device_channel`: `int` — [Read-Write] The currently selected channel from the details panel for this source (int32)

### `unreal.AudioInputDeviceInfoProperty`
Inherits: `StructBase` | Header: `TakeRecorderSourceProperty.h`

Encapsulates audio device properties which are utilized by UI facing classes such as FAudioInputDeviceProperty.

**Properties** (5):
  - `device_id`: `str` [Read-Only] — [Read-Only] The unique id used to identify the device (str)
  - `device_name`: `str` [Read-Only] — [Read-Only] User friendly name of the audio device (str)
  - `input_channels`: `int` [Read-Only] — [Read-Only] The number input channels this device supports (int32)
  - `is_default_device`: `bool` [Read-Only] — [Read-Only] Boolean indicating if this device is the currently the system selected input device (boo...
  - `preferred_sample_rate`: `int` [Read-Only] — [Read-Only] The preferred sample rate for this audio device (int32)

### `unreal.AudioInputDeviceProperty`
Inherits: `StructBase` | Header: `TakeRecorderSourceProperty.h`

Encapsulates the array of audio input devices which is populated by UTakeRecorderMicrophoneAudioManager and utilized by the audio input device list in FAudioInputDevicePropertyCustomization.

**Properties** (4):
  - `audio_input_buffer_size`: `int` — [Read-Write] The desired buffer size used for audio callbacks during record (int32)
  - `device_id`: `str` — [Read-Write] The unique id of the currently selected audio device (str)
  - `device_info_array`: `None` [Read-Only] — [Read-Only] Holds device information for each of the audio devices available on this system. (Array[...
  - `use_system_default_audio_device`: `bool` — [Read-Write] Boolean indicating if the system selects audio device should be used or to use the sele...

### `unreal.TakeRecorderTargetRecordClassProperty`
Inherits: `StructBase` | Header: `TakePresetSettings.h`

Wraps the class so this can be customized by a type layout.

### `unreal.ActorRecorderPropertyMap`
Inherits: `Object` | Header: `TakeRecorderSourceProperty.h`

This represents a list of all possible properties and components on an actor which can be recorded by the Actor Recorder and whether or not the user wishes to record them. If you wish to expose a prop...

**Properties** (3):
  - `children`: `None` — [Read-Write] (Array[ActorRecorderPropertyMap])
  - `properties`: `None` — [Read-Write] Represents properties exposed to Cinematics that can possibly be recorded. (Array[Actor...
  - `recorded_object`: `Object` [Read-Only] — [Read-Only] (Object)

### `unreal.TakeMetaData`
Inherits: `Object` | Header: `TakeMetaData.h`

Take meta-data that is stored on ULevelSequence assets that are recorded through the Take Recorder. Meta-data is retrieved through ULevelSequence::FindMetaData<UTakeMetaData>()

**Methods** (30):
  - `generate_asset_path(path_format_string, context = None)` -> `str` — Generate the desired asset path for this take meta-data
  - `get_description()` -> `str`
  - `get_duration()` -> `FrameTime`
  - `get_frame_rate()` -> `FrameRate`
  - `get_frame_rate_from_timecode()` -> `bool`
  - `get_level_origin()` -> `Level`
  - `get_level_path()` -> `str`
  - `get_preset_origin()` -> `TakePreset`
  - `get_slate()` -> `str`
  - `get_take_number()` -> `int32`
  - `get_timecode_in()` -> `Timecode`
  - `get_timecode_out()` -> `Timecode`
  - `get_timestamp()` -> `DateTime`
  - `is_locked()` -> `bool` — Check whether this take is locked
  - `is_sub_sequence()` -> `bool` — True if this take meta data was recorded as part of a subsequence.
  - `lock()` -> `None` — Lock this take, causing it to become read-only
  - `recorded()` -> `bool` — Check if this take was recorded (as opposed to being setup for recording)
  - `set_description(description)` -> `None` — Set this takeâs user-provided description note:: Only valid for takes that have not been locked
  - `set_duration(duration)` -> `None` — Set this takeâs duration note:: Only valid for takes that have not been locked
  - `set_frame_rate(frame_rate)` -> `None` — Set this takeâs frame-rate note:: Only valid for takes that have not been locked
  - `set_frame_rate_from_timecode(from_timecode)` -> `None` — Set if we get frame rate from time code
  - `set_is_sub_sequence(new_value)` -> `None` — Set whether the take meta data is part of a subsequence.
  - `set_level_origin(level_origin)` -> `None` — Set the map used to create this recording
  - `set_preset_origin(preset_origin)` -> `None` — Set the preset on which the take is based note:: Only valid for takes that have not been locked
  - `set_slate(slate, emit_changed = True)` -> `None` — Set the slate for this take and reset its take number to 1 note:: Only valid for takes that have not been locked
  - `set_take_number(take_number, emit_changed = True)` -> `None` — Set this takeâs take number. Take numbers are always clamped to be >= 1. note:: Only valid for takes that have not bee...
  - `set_timecode_in(timecode_in)` -> `None` — Set this takeâs timecode in note:: Only valid for takes that have not been locked
  - `set_timecode_out(timecode_out)` -> `None` — Set this takeâs timecode out note:: Only valid for takes that have not been locked
  - `set_timestamp(timestamp)` -> `None` — Set this takeâs timestamp note:: Only valid for takes that have not been locked
  - `unlock()` -> `None` — Unlock this take if it is read-only, allowing it to be modified once again

### `unreal.TakePreset`
Inherits: `Object` | Header: `TakePreset.h`

Take preset that is stored as an asset comprising a ULevelSequence, and a set of actor recording sources

### `unreal.TakePresetSettings`
Inherits: `Object` | Header: `TakePresetSettings.h`

Settings for how to assemble UTakePreset.

### `unreal.TakeRecorderAudioInputSettings`
Inherits: `Object` | Header: `TakeRecorderSourceProperty.h`

Provides access to the UI code for registering OnAudioInputDeviceChanged delegates.

### `unreal.TakeRecorderNamingTokensContext`
Inherits: `Object` | Header: `TakeRecorderNamingTokensContext.h`

Context object which may be passed to NamingTokens evaluations from within TakeRecorder. This is stored under TakesCore rather than the TakeRecorderNamingTokensModule for dependency management. Multip...

### `unreal.TakeRecorderSource`
Inherits: `Object` | Header: `TakeRecorderSource.h`

Base class for all sources that can be recorded with the Take Recorder. Custom recording sources can be created by inheriting from this class and implementing the Start/Tick/Stop recording functions. ...

**Properties** (3):
  - `enabled`: `bool` — [Read-Write] True if this source is cued for recording or not (bool)
  - `take_number`: `int` — [Read-Write] (int32)
  - `track_tint`: `Color` — [Read-Write] (Color)

### `unreal.TakeRecorderSources`
Inherits: `Object` | Header: `TakeRecorderSources.h`

A list of sources to record for any given take. Stored as meta-data on ULevelSequence through ULevelSequence::FindMetaData<UTakeRecorderSources>

**Methods** (4):
  - `add_source(source_type)` -> `TakeRecorderSource` — Add a new source to this source list of the templated type
  - `get_sources_copy()` -> `Array [ TakeRecorderSource ]` — Retrieves a copy of the list of sources that are being recorded. This is intended for Blueprint usages which cannot use ...
  - `remove_source(source)` -> `None` — Remove the specified source from this list
  - `start_recording_source(sources, current_frame_time)` -> `None` — Calls the recording initialization flows on each of the specified sources.

### `unreal.TakesCoreBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `TakesCoreBlueprintLibrary.h`

Takes Core Blueprint Library

**Methods** (4):
  - `compute_next_take_number(slate)` -> `int32` [classmethod] — Compute the next unused sequential take number for the specified slate
  - `find_takes(slate, take_number = 0)` -> `Array [ AssetData ]` [classmethod] — Find all the existing takes that were recorded with the specified slate
  - `set_on_take_recorder_slate_changed(on_take_recorder_slate_changed)` -> `None` [classmethod] — Called when the slate is changed.
  - `set_on_take_recorder_take_number_changed(on_take_recorder_take_number_changed)` -> `None` [classmethod] — Called when the take number is changed.

### `unreal.TakesCoreBlueprintLibrary_OnTakeRecorderSlateChanged`
Inherits: `DelegateBase` | Header: `TakesCoreBlueprintLibrary.h`

On Take Recorder Slate Changed Delegate Signature

### `unreal.TakesCoreBlueprintLibrary_OnTakeRecorderTakeNumberChanged`
Inherits: `DelegateBase` | Header: `TakesCoreBlueprintLibrary.h`

On Take Recorder Take Number Changed Delegate Signature
