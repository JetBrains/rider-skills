# UE Python API — AudioGameplay Module

**14 types** from the `AudioGameplay` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AudioGameplayRequirements`, `AudioAssetUserData`, `AudioComponentGroup`, `AudioComponentGroupExtension`, `AudioGameplayComponent`, `AudioGameplayCondition`, `AudioGameplayVolumeInteraction`, `AudioParameterComponent`, `AudioRequirementPreset`, `BoolParamCallback`, `OnParameterChanged`, `SoundCallback`, `SoundGroupChanged`, `StringParamCallback`

---

## Classes

### `unreal.AudioGameplayRequirements`
Inherits: `StructBase` | Header: `AudioGameplayRequirements.h`

AudioGameplayRequirements - A set of requirements for audio gameplay features.

**Properties** (2):
  - `custom`: `GameplayTagQuery` — [Read-Write] An optional custom query tested against a collection of tags to determine a match.  Ign...
  - `preset`: `AudioRequirementPreset` — [Read-Write] An optional requirement preset tested against a collection of tags to determine a match...

### `unreal.AudioAssetUserData`
Inherits: `AssetUserData` | Header: `AudioAssetUserData.h`

UAudioAssetUserData - Base class for user data being attached to audio assets

**Properties** (1):
  - `metadata_tags`: `GameplayTagContainer` — [Read-Write] (GameplayTagContainer)

### `unreal.AudioComponentGroup`
Inherits: `SceneComponent` | Header: `AudioComponentGroup.h`

Automatic Handler for voices and parameters across any number of AudioComponents

**Methods** (36):
  - `add_extension(new_extension)` -> `None` — Add Extension
  - `add_external_component(component_to_add)` -> `None` — Allow an externally created AudioComponent to share parameters with this SoundGroup
  - `broadcast_event(event_name)` -> `None` — Broadcast Event
  - `broadcast_kill()` -> `None` — Broadcast Kill
  - `broadcast_stop_all()` -> `None` — Broadcast Stop All
  - `disable_virtualization()` -> `None` — Disable Virtualization
  - `enable_virtualization()` -> `None` — Enable Virtualization
  - `get_bool_param_value(param_name)` -> `bool` — Get Bool Param Value
  - `get_float_param_value(param_name)` -> `float` — Get Float Param Value
  - `get_string_param_value(param_name)` -> `str` — Get String Param Value
  - `is_playing_any()` -> `bool` — Is Playing Any
  - `is_virtualized()` -> `bool` — Is Virtualized
  - `remove_extension(new_extension)` -> `None` — Remove Extension
  - `remove_external_component(component_to_remove)` -> `None` — Remove External Component
  - `reset_parameters()` -> `None` — Resets all parameters to their original values.
  - `set_bool_array_parameter(name, value)` -> `None` — Sets a named Boolean Array
  - `set_bool_parameter(name, bool)` -> `None` — Sets a named Boolean
  - `set_float_array_parameter(name, value)` -> `None` — Sets a named Float Array
  - `set_float_parameter(name, float)` -> `None` — Sets a named Float
  - `set_int_array_parameter(name, value)` -> `None` — Sets a named Int32 Array
  - `set_int_parameter(name, int)` -> `None` — Sets a named Int32
  - `set_low_pass_filter(frequency)` -> `None` — Set Low Pass Filter
  - `set_object_array_parameter(name, value)` -> `None` — Sets a named UObject Array
  - `set_object_parameter(name, value)` -> `None` — Sets a named UObject
  - `set_parameters_blueprint(parameters)` -> `None` — Sets an array of parameters as a batch
  - `set_pitch_multiplier(pitch)` -> `None` — Set Pitch Multiplier
  - `set_string_array_parameter(name, value)` -> `None` — Sets a named String Array
  - `set_string_parameter(name, value)` -> `None` — Sets a named String
  - `set_trigger_parameter(name)` -> `None` — Executes a named trigger. Does not cache trigger value, so only executes if the sound is already playing. If the intent ...
  - `set_volume_multiplier(volume)` -> `None` — Set Volume Multiplier
  - `static_get_or_create_component_group(actor)` -> `AudioComponentGroup` [classmethod] — Static Get or Create Component Group
  - `stop_sound(sound, fade_time = 0.000000)` -> `None` — Stop all instances of this Sound on any internal or external components
  - `subscribe_to_bool(param_name, delegate)` -> `None` — Subscribe to Bool
  - `subscribe_to_event(event_name, delegate)` -> `None` — Subscribe to Event
  - `subscribe_to_string_param(param_name, delegate)` -> `None` — Subscribe to String Param
  - `unsubscribe_object(object)` -> `None` — remove any string, event, and bool subscriptions that are bound to this object

**Properties** (5):
  - `on_killed`: `SoundGroupChanged` — [Read-Write] (SoundGroupChanged)
  - `on_stopped`: `SoundGroupChanged` — [Read-Write] (SoundGroupChanged)
  - `on_unvirtualized`: `SoundGroupChanged` — [Read-Write] (SoundGroupChanged)
  - `on_virtualized`: `SoundGroupChanged` — [Read-Write] (SoundGroupChanged)
  - `persistent_params`: `None` [Read-Only] — [Read-Only] (Array[AudioParameter])

### `unreal.AudioComponentGroupExtension`
Inherits: `Interface` | Header: `AudioComponentGroupExtension.h`

Audio Component Group Extension

### `unreal.AudioGameplayComponent`
Inherits: `ActorComponent` | Header: `AudioGameplayComponent.h`

Audio Gameplay Component

### `unreal.AudioGameplayCondition`
Inherits: `Interface` | Header: `IAudioGameplayCondition.h`

Audio Gameplay Condition

**Methods** (2):
  - `condition_met()` -> `bool` — Basic condition check
  - `condition_met_position(position)` -> `bool` — Allows testing a condition against a provided position.

### `unreal.AudioGameplayVolumeInteraction`
Inherits: `Interface` | Header: `IAudioGameplayVolumeInteraction.h`

Audio Gameplay Volume Interaction

**Methods** (2):
  - `on_listener_enter()` -> `None` — Called when a listener âentersâ the associated proxy
  - `on_listener_exit()` -> `None` — Called when a listener âexitsâ the associated proxy

### `unreal.AudioParameterComponent`
Inherits: `AudioGameplayComponent` | Header: `AudioParameterComponent.h`

UAudioParameterComponent - Can be used to set/store audio parameters and automatically dispatch them (through ActorSoundParameterInterface) to any sounds played by the componentâs Owner Actor

**Methods** (15):
  - `get_actor_sound_params()` -> `Array [ AudioParameter ]` — Overrides logic for gathering AudioParameters to set by default when an AudioComponent/ActiveSound plays with a given ac...
  - `get_parameters()` -> `Array [ AudioParameter ]` — Get Parameters
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

**Properties** (1):
  - `on_parameter_changed`: `OnParameterChanged` — [Read-Write] (OnParameterChanged)

### `unreal.AudioRequirementPreset`
Inherits: `DataAsset` | Header: `AudioGameplayRequirements.h`

UAudioRequirementPreset - A reusable GameplayTagQuery for audio

**Properties** (1):
  - `query`: `GameplayTagQuery` — [Read-Write] (GameplayTagQuery)

### `unreal.BoolParamCallback`
Inherits: `DelegateBase` | Header: `AudioComponentGroup.h`

Bool Param Callback Delegate Signature

### `unreal.OnParameterChanged`
Inherits: `MulticastDelegateBase` | Header: `AudioParameterComponent.h`

On Parameter Changed Delegate Signature

### `unreal.SoundCallback`
Inherits: `DelegateBase` | Header: `AudioComponentGroup.h`

Sound Callback Delegate Signature

### `unreal.SoundGroupChanged`
Inherits: `MulticastDelegateBase` | Header: `AudioComponentGroup.h`

Sound Group Changed Delegate Signature

### `unreal.StringParamCallback`
Inherits: `DelegateBase` | Header: `AudioComponentGroup.h`

String Param Callback Delegate Signature
