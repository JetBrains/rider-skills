# UE Python API — AudioExtensions Module

**20 types** from the `AudioExtensions` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AudioParameter`, `SoundGeneratorOutput`, `SoundWaveCloudStreamingPlatformSettings`, `SoundWaveCuePoint`, `AudioEndpointSettingsBase`, `AudioParameterControllerInterface`, `AudioPropertiesSheetAssetBase`, `DummyEndpointSettings`, `OcclusionPluginSourceSettingsBase`, `ReverbPluginSourceSettingsBase`, `SoundfieldEffectBase`, `SoundfieldEffectSettingsBase`, `SoundfieldEncodingSettingsBase`, `SoundfieldEndpointSettingsBase`, `SoundModulatorBase`, `SourceDataOverridePluginSourceSettingsBase`, `SpatializationPluginSourceSettingsBase`, `WaveformTransformationBase`, `AudioParameterType`, `SoundWaveCloudStreamingPlatformEnableType`

---

## Classes

### `unreal.AudioParameter`
Inherits: `StructBase` | Header: `AudioParameter.h`

Audio Parameter

**Properties** (13):
  - `array_bool_param`: `None` — [Read-Write] Boolean value of parameter (Array[bool])
  - `array_float_param`: `None` — [Read-Write] Array Float value of parameter (Array[float])
  - `array_int_param`: `None` — [Read-Write] Integer value of parameter (Array[int32])
  - `array_object_param`: `None` — [Read-Write] Object value of parameter (Array[Object])
  - `array_string_param`: `None` — [Read-Write] String value of parameter (Array[str])
  - `bool_param`: `bool` — [Read-Write] Boolean value of parameter (bool)
  - `float_param`: `float` — [Read-Write] Float value of parameter (float)
  - `int_param`: `int` — [Read-Write] Integer value of parameter. If set to âDefault Constructâ, value is number of array...
  - `object_param`: `Object` — [Read-Write] Object value of parameter (Object)
  - `param_name`: `Name` — [Read-Write] Name of the parameter (Name)
  - `param_type`: `AudioParameterType` — [Read-Write] (AudioParameterType)
  - `sound_wave_param`: `Object` — âsound_wave_paramâ was renamed to âobject_paramâ. deprecated
  - `string_param`: `str` — [Read-Write] String value of parameter (str)

### `unreal.SoundGeneratorOutput`
Inherits: `StructBase` | Header: `SoundGeneratorOutput.h`

Base class for generators that have outputs that can be exposed to other game code.

**Properties** (1):
  - `name`: `Name` [Read-Only] — [Read-Only] The outputâs name (Name)

### `unreal.SoundWaveCloudStreamingPlatformSettings`
Inherits: `StructBase` | Header: `ISoundWaveCloudStreaming.h`

Platform specific settings for Sound Wave cloud streaming.

### `unreal.SoundWaveCuePoint`
Inherits: `StructBase` | Header: `IWaveformTransformation.h`

Struct defining a cue point in a sound wave asset

**Properties** (4):
  - `cue_point_id`: `int` [Read-Only] — [Read-Only] Unique identifier for the wave cue point (int32)
  - `frame_length`: `int` [Read-Only] — [Read-Only] The frame length of the cue point (non-zero if itâs a region) (int32)
  - `frame_position`: `int` [Read-Only] — [Read-Only] The frame position of the cue point (int32)
  - `label`: `str` [Read-Only] — [Read-Only] The label for the cue point (str)

### `unreal.AudioEndpointSettingsBase`
Inherits: `Object` | Header: `IAudioEndpoint.h`

This opaque class should be used for specifying settings for how audio should be send to an external endpoint.

### `unreal.AudioParameterControllerInterface`
Inherits: `Interface` | Header: `AudioParameterControllerInterface.h`

Audio Parameter Controller Interface

**Methods** (13):
  - `reset_parameters()` -> `None` — Resets all parameters to their original values.
  - `set_bool_array_parameter(name, value)` -> `None` — Sets a named Boolean Array
  - `set_bool_parameter(name, bool)` -> `None` — Sets a named Boolean
  - `set_float_array_parameter(name, value)` -> `None` — Sets a named Float Array
  - `set_float_parameter(name, float)` -> `None` — Sets a named Float
  - `set_int_array_parameter(name, value)` -> `None` — Sets a named Int32 Array
  - `set_int_parameter(name, int)` -> `None` — Sets a named Int32
  - `set_object_array_parameter(name, value)` -> `None` — Sets a named UObject Array
  - `set_object_parameter(name, value)` -> `None` — Sets a named UObject
  - `set_parameters_blueprint(parameters)` -> `None` — Sets an array of parameters as a batch
  - `set_string_array_parameter(name, value)` -> `None` — Sets a named String Array
  - `set_string_parameter(name, value)` -> `None` — Sets a named String
  - `set_trigger_parameter(name)` -> `None` — Executes a named trigger. Does not cache trigger value, so only executes if the sound is already playing. If the intent ...

### `unreal.AudioPropertiesSheetAssetBase`
Inherits: `Object` | Header: `AudioPropertiesSheetAssetBase.h`

Audio Properties Sheet Asset Base

**Methods** (1):
  - `copy_to_object_properties(target_object)` -> `bool` — Copy to Object Properties

### `unreal.DummyEndpointSettings`
Inherits: `AudioEndpointSettingsBase` | Header: `IAudioEndpoint.h`

Dummy Endpoint Settings

### `unreal.OcclusionPluginSourceSettingsBase`
Inherits: `Object` | Header: `IAudioExtensionPlugin.h`

This is a class which should be overridden to provide users with settings to use for individual sounds

### `unreal.ReverbPluginSourceSettingsBase`
Inherits: `Object` | Header: `IAudioExtensionPlugin.h`

This is a class which should be overridden to provide users with settings to use for individual sounds

### `unreal.SoundfieldEffectBase`
Inherits: `Object` | Header: `ISoundfieldFormat.h`

This opaque class should be used for specifying settings for how audio should be encoded to your soundfield format for a given submix or file.

### `unreal.SoundfieldEffectSettingsBase`
Inherits: `Object` | Header: `ISoundfieldFormat.h`

Soundfield Effect Settings Base

### `unreal.SoundfieldEncodingSettingsBase`
Inherits: `Object` | Header: `ISoundfieldFormat.h`

This opaque class should be used for specifying settings for how audio should be encoded to your soundfield format for a given submix or file.

### `unreal.SoundfieldEndpointSettingsBase`
Inherits: `Object` | Header: `ISoundfieldEndpoint.h`

This opaque class should be used for specifying settings for how audio should be send to an external endpoint.

### `unreal.SoundModulatorBase`
Inherits: `Object` | Header: `IAudioModulation.h`

Base class for all modulators

### `unreal.SourceDataOverridePluginSourceSettingsBase`
Inherits: `Object` | Header: `IAudioExtensionPlugin.h`

This is a class which should be overridden to provide users with settings to use for individual sounds

### `unreal.SpatializationPluginSourceSettingsBase`
Inherits: `Object` | Header: `IAudioExtensionPlugin.h`

This is a class which should be overridden to provide users with settings to use for individual sounds

### `unreal.WaveformTransformationBase`
Inherits: `Object` | Header: `IWaveformTransformation.h`

Base class to hold editor configurable properties for an arbitrary transformation of audio waveform data

### `unreal.AudioParameterType`
Inherits: `EnumBase` | Header: `AudioParameter.h`

EAudio Parameter Type

**Properties** (12):
  - `BOOLEAN`: `AudioParameterType = Ellipsis` — Boolean value 1
  - `BOOLEAN_ARRAY`: `AudioParameterType = Ellipsis` — Array of boolean values (not supported by legacy SoundCue system) 7
  - `FLOAT`: `AudioParameterType = Ellipsis` — Float value 3
  - `FLOAT_ARRAY`: `AudioParameterType = Ellipsis` — Array of float values (not supported by legacy SoundCue system) 9
  - `INTEGER`: `AudioParameterType = Ellipsis` — Integer value 2
  - `INTEGER_ARRAY`: `AudioParameterType = Ellipsis` — Array of integer values (not supported by legacy SoundCue system) 8
  - `NONE`: `AudioParameterType = Ellipsis` — âDefaultâ results in behavior that is resolved
based on the system interpreting it.  To support
...
  - `OBJECT`: `AudioParameterType = Ellipsis` — Object value (types other than SoundWave not supported by legacy SoundCue system) 5
  - `OBJECT_ARRAY`: `AudioParameterType = Ellipsis` — Array of object values (not supported by legacy SoundCue system) 11
  - `STRING`: `AudioParameterType = Ellipsis` — String value (not supported by legacy SoundCue system) 4
  - `STRING_ARRAY`: `AudioParameterType = Ellipsis` — Array of string values (not supported by legacy SoundCue system) 10
  - `TRIGGER`: `AudioParameterType = Ellipsis` — Trigger value 12

### `unreal.SoundWaveCloudStreamingPlatformEnableType`
Inherits: `EnumBase` | Header: `ISoundWaveCloudStreaming.h`

Platform specific enabling of Sound Wave cloud streaming.

**Properties** (2):
  - `DISABLED`: `SoundWaveCloudStreamingPlatformEnableType = Ellipsis` — Disables Sound Wave cloud streaming for this platform. 1
  - `INHERITED`: `SoundWaveCloudStreamingPlatformEnableType = Ellipsis` — Use Sound Wave setting. 0
