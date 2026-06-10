# UE Python API — AudioModulation Module

**30 types** from the `AudioModulation` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `EnvelopeFollowerGeneratorParams`, `SoundControlBusMixStage`, `SoundControlModulationInput`, `SoundControlModulationPatch`, `SoundModulationADEnvelopeParams`, `SoundModulationLFOParams`, `SoundModulationMixValue`, `SoundModulationParameterSettings`, `SoundModulationTransform`, `AudioModulationDestination`, `AudioModulationStatics`, `AudioModulationStyle`, `SoundControlBus`, `SoundControlBusMix`, `SoundModulationGenerator`, `SoundModulationGeneratorADEnvelope`, `SoundModulationGeneratorEnvelopeFollower`, `SoundModulationGeneratorLFO`, `SoundModulationParameter`, `SoundModulationParameterAdditive`, ... (30 total)

---

## Classes

### `unreal.EnvelopeFollowerGeneratorParams`
Inherits: `StructBase` | Header: `SoundModulationEnvelopeFollower.h`

Envelope Follower Generator Params

**Properties** (6):
  - `attack_time`: `float` — [Read-Write] Attack time of envelope response (in sec) (float)
  - `audio_bus`: `AudioBus` — [Read-Write] AudioBus to follow amplitude of and generate modulation control signal from. (AudioBus)
  - `bypass`: `bool` — [Read-Write] If true, bypasses generator from being modulated by parameters, patches, or mixed (rema...
  - `gain`: `float` — [Read-Write] Gain to apply to amplitude signal. (float)
  - `invert`: `bool` — [Read-Write] If true, inverts output (bool)
  - `release_time`: `float` — [Read-Write] Release time of envelope response (in sec) (float)

### `unreal.SoundControlBusMixStage`
Inherits: `StructBase` | Header: `SoundControlBusMix.h`

Sound Control Bus Mix Stage

**Properties** (2):
  - `bus`: `SoundControlBus` — [Read-Write] Bus controlled by the mix stage. (SoundControlBus)
  - `value`: `SoundModulationMixValue` — [Read-Write] Value mix is set to. (SoundModulationMixValue)

### `unreal.SoundControlModulationInput`
Inherits: `StructBase` | Header: `SoundModulationPatch.h`

Sound Control Modulation Input

**Properties** (2):
  - `bus`: `SoundControlBus` — [Read-Write] The input bus (SoundControlBus)
  - `sample_and_hold`: `bool` — [Read-Write] Get the modulated input value on parent patch initialization and hold that value for it...

### `unreal.SoundControlModulationPatch`
Inherits: `StructBase` | Header: `SoundModulationPatch.h`

Sound Control Modulation Patch

**Properties** (3):
  - `bypass`: `bool` — [Read-Write] Whether or not patch is bypassed (patch is still active, but always returns output para...
  - `inputs`: `None` — [Read-Write] Modulation inputs (Array[SoundControlModulationInput])
  - `output_parameter`: `SoundModulationParameter` [Read-Only] — [Read-Only] (SoundModulationParameter)

### `unreal.SoundModulationADEnvelopeParams`
Inherits: `StructBase` | Header: `SoundModulationADEnvelope.h`

Sound Modulation ADEnvelope Params

**Properties** (6):
  - `attack_curve`: `float` — [Read-Write] The exponential curve factor of the attack. 1.0 = linear growth, < 1.0 logorithmic grow...
  - `attack_time`: `float` — [Read-Write] Attack time of the envelope (seconds). (float)
  - `bypass`: `bool` — [Read-Write] If true, bypasses envelope bus from being modulated by parameters, patches, or mixed (E...
  - `decay_curve`: `float` — [Read-Write] The exponential curve factor of the decay. 1.0 = linear decay, < 1.0 exponential decay,...
  - `decay_time`: `float` — [Read-Write] Decay time of the envelope (seconds). (float)
  - `looping`: `bool` — [Read-Write] Whether or not to loop the envelope. (bool)

### `unreal.SoundModulationLFOParams`
Inherits: `StructBase` | Header: `SoundModulationLFO.h`

Sound Modulation LFOParams

**Properties** (9):
  - `amplitude`: `float` — [Read-Write] Amplitude of oscillator (float)
  - `bypass`: `bool` — [Read-Write] If true, bypasses LFO bus from being modulated by parameters, patches, or mixed (LFO re...
  - `exponential_factor`: `float` — [Read-Write] Factor increasing/decreasing curvature of exponential LFO shape. (float)
  - `frequency`: `float` — [Read-Write] Frequency of oscillator (float)
  - `looping`: `bool` — [Read-Write] Whether or not to loop the oscillation more than once (bool)
  - `offset`: `float` — [Read-Write] Amplitude offset of oscillator (float)
  - `phase`: `float` — [Read-Write] Unit phase offset of oscillator (float)
  - `shape`: `SoundModulationLFOShape` — [Read-Write] Shape of oscillating waveform (SoundModulationLFOShape)
  - `width`: `float` — [Read-Write] Pulse width of square LFO shape. (float)

### `unreal.SoundModulationMixValue`
Inherits: `StructBase` | Header: `SoundModulationValue.h`

Sound Modulation Mix Value

**Properties** (3):
  - `attack_time`: `float` — [Read-Write] Time it takes (in sec) to interpolate from the parameterâs default value to the mix v...
  - `release_time`: `float` — [Read-Write] Time it takes (in sec) to interpolate from the current mix value to the parameterâs d...
  - `target_value`: `float` — [Read-Write] Target value of the modulator. (float)

### `unreal.SoundModulationParameterSettings`
Inherits: `StructBase` | Header: `SoundModulationParameter.h`

Sound Modulation Parameter Settings

**Properties** (1):
  - `value_normalized`: `float` [Read-Only] — [Read-Only] Default value of modulator (unitless) (float)

### `unreal.SoundModulationTransform`
Inherits: `WaveTableTransform` | Header: `SoundModulationPatch.h`

Sound Modulation Transform

### `unreal.AudioModulationDestination`
Inherits: `Object` | Header: `AudioModulationDestination.h`

Audio Modulation Destination

**Methods** (4):
  - `clear_modulator()` -> `bool` — Returns true if a modulator was set and has been cleared.
  - `get_modulator()` -> `SoundModulatorBase` — Returns currently set modulator.
  - `get_value()` -> `float` — Returns the last calculated modulator value sampled from the thread controls are processed on.
  - `set_modulator(modulator)` -> `bool` — Returns true if modulator was set to new value or was already set to provided value.

### `unreal.AudioModulationStatics`
Inherits: `BlueprintFunctionLibrary` | Header: `AudioModulationStatics.h`

namespace AudioModulation

**Methods** (27):
  - `activate_bus(world_context_object, bus)` -> `None` [classmethod] — Activate Bus deprecated: To manually control the activation state of a modulator, use CreateModulationDestination.
  - `activate_bus_mix(world_context_object, mix)` -> `None` [classmethod] — Manually activates a bus modulator mix. If called, deactivation will only occur if mix is manually deactivated and not r...
  - `activate_generator(world_context_object, generator)` -> `None` [classmethod] — Activate Generator deprecated: To manually control the activation state of a modulator, use CreateModulationDestination.
  - `clear_all_global_bus_mix_values(world_context_object, fade_time = -1.000000)` -> `None` [classmethod] — Clears all global control bus mix values if set, using the applied fade time to return all to their respective busâs p...
  - `clear_global_bus_mix_value(world_context_object, bus, fade_time = -1.000000)` -> `None` [classmethod] — Clears global control bus mix if set, using the applied fade time to return to the provided busâs parameter default va...
  - `create_ad_envelope_generator(world_context_object, name, params)` -> `SoundModulationGeneratorADEnvelope` [classmethod] — Creates a modulation generator based on an Attack/Decay Envelope.
  - `create_bus(world_context_object, name, parameter, activate = False)` -> `SoundControlBus` [classmethod] — Creates a modulation bus with the provided default value.
  - `create_bus_mix(world_context_object, name, stages, activate, duration = -1.000000, retrigger_on_activation = False)` -> `SoundControlBusMix` [classmethod] — Creates a Control Bus Mix with the given stage configuration.
  - `create_bus_mix_from_value(world_context_object, name, buses, value = 1.000000, attack_time = 0.100000, release_time = 0.100000, activate = True)` -> `SoundControlBusMix` [classmethod] — Create a mix with stages created for each provided bus that are initialized to the supplied value and timing parameters.
  - `create_bus_mix_stage(world_context_object, bus, value, attack_time = 0.100000, release_time = 0.100000)` -> `SoundControlBusMixStage` [classmethod] — Creates a stage used to mix a control bus.
  - `create_envelope_follower_generator(world_context_object, name, params)` -> `SoundModulationGeneratorEnvelopeFollower` [classmethod] — Creates a modulation generator based on an Envelope Follower with the given parameters.
  - `create_lfo_generator(world_context_object, name, params)` -> `SoundModulationGeneratorLFO` [classmethod] — Creates a modulation generator based on an LFO with the given parameters.
  - `create_modulation_destination(world_context_object, name, modulator)` -> `AudioModulationDestination` [classmethod] — Creates a modulation destination, which activates the given modulator (if not already active) and provides a function to...
  - `deactivate_all_bus_mixes(world_context_object)` -> `None` [classmethod] — Deactivates all currently active Control Bus Mixes. This includes the Global Control Bus Mixes.
  - `deactivate_bus(world_context_object, bus)` -> `None` [classmethod] — Deactivate Bus deprecated: To manually control the activation state of a modulator, use CreateModulationDestination.
  - `deactivate_bus_mix(world_context_object, mix)` -> `None` [classmethod] — Deactivates a modulation bus mix. Does nothing if an instance of the provided bus mix is already inactive.
  - `deactivate_generator(world_context_object, generator)` -> `None` [classmethod] — Deactivate Generator deprecated: To manually control the activation state of a modulator, use CreateModulationDestinatio...
  - `get_modulator_value(world_context_object, modulator)` -> `float` [classmethod] — Gets the (normalized) value of the given modulator.
  - `get_modulators_from_destination(destination)` -> `Set [ SoundModulatorBase ]` [classmethod] — Gets the list of modulators currently applied to a Modulation Destination.
  - `is_control_bus_mix_active(world_context_object, mix)` -> `bool` [classmethod] — Returns whether or not a Control Bus Mix is currently active.
  - `load_mix_from_profile(world_context_object, mix, activate = True, profile_index = 0)` -> `Array [ SoundControlBusMixStage ]` [classmethod] — Loads control bus mix from a profile into UObject mix definition, deserialized from an ini file.
  - `save_mix_to_profile(world_context_object, mix, profile_index = 0)` -> `None` [classmethod] — Saves control bus mix to a profile, serialized to an ini file. If mix is loaded, uses current proxyâs state. If not, u...
  - `set_global_bus_mix_value(world_context_object, bus, value, fade_time = -1.000000)` -> `None` [classmethod] — Sets a Global Control Bus Mix with a single stage associated with the provided Bus to the given float value. This call s...
  - `update_mix(world_context_object, mix, stages, fade_time = -1.000000, duration = -1.000000, retrigger_on_activation = False)` -> `None` [classmethod] — Sets a Control Bus Mix with the provided stage data, if the stages are provided in an active instance proxy of the mix. ...
  - `update_mix_by_filter(world_context_object, mix, address_filter, param_class_filter, param_filter, value = 1.000000, fade_time = -1.000000)` -> `None` [classmethod] — Sets filtered stages of a given class to a provided target value for active instance of mix. Does not update UObject def...
  - `update_mix_from_object(world_context_object, mix, fade_time = -1.000000)` -> `None` [classmethod] — Commits updates from a UObject definition of a bus mix to active instance in audio thread (ignored if mix has not been a...
  - `update_modulator(world_context_object, modulator)` -> `None` [classmethod] — Commits updates from a UObject definition of a modulator (e.g. Bus, Bus Mix, Generator) to active instance in audio thre...

### `unreal.AudioModulationStyle`
Inherits: `BlueprintFunctionLibrary` | Header: `AudioModulationStyle.h`

Audio Modulation Style

**Methods** (5):
  - `get_control_bus_color()` -> `Color` [classmethod] — Get Control Bus Color
  - `get_control_bus_mix_color()` -> `Color` [classmethod] — Get Control Bus Mix Color
  - `get_modulation_generator_color()` -> `Color` [classmethod] — Get Modulation Generator Color
  - `get_parameter_color()` -> `Color` [classmethod] — Get Parameter Color
  - `get_patch_color()` -> `Color` [classmethod] — Get Patch Color

### `unreal.SoundControlBus`
Inherits: `SoundModulatorBase` | Header: `SoundControlBus.h`

Sound Control Bus

**Properties** (5):
  - `address`: `str` — [Read-Write] Address to use when applying mix changes. (str)
  - `bypass`: `bool` — [Read-Write] If true, bypasses control bus from being modulated by parameters, patches, or mixed (co...
  - `generators`: `None` — [Read-Write] The Modulation Generators which modulate this Control Bus. (Array[SoundModulationGenera...
  - `override_address`: `bool` — [Read-Write] If true, Address field is used in place of object name for address used when applying m...
  - `parameter`: `SoundModulationParameter` [Read-Only] — [Read-Only] The Modulation Parameter to use with this Control Bus. This determines how the control b...

### `unreal.SoundControlBusMix`
Inherits: `Object` | Header: `SoundControlBusMix.h`

Sound Control Bus Mix

**Properties** (3):
  - `duration`: `float` [Read-Only] — [Read-Only] Once activated, the mix will start a timer for the given duration (seconds).
When the ti...
  - `mix_stages`: `None` [Read-Only] — [Read-Only] Array of stages controlled by mix. (Array[SoundControlBusMixStage])
  - `retrigger_on_activation`: `bool` [Read-Only] — [Read-Only] If a Mix is already active and you activate it again, one of two things will happen:
If ...

### `unreal.SoundModulationGenerator`
Inherits: `SoundModulatorBase` | Header: `SoundModulationGenerator.h`

Base class for modulators that algorithmically generate values that can effect various endpoints (ex. Control Buses & Parameter Destinations)

### `unreal.SoundModulationGeneratorADEnvelope`
Inherits: `SoundModulationGenerator` | Header: `SoundModulationADEnvelope.h`

Sound Modulation Generator ADEnvelope

**Properties** (1):
  - `params`: `SoundModulationADEnvelopeParams` — [Read-Write] (SoundModulationADEnvelopeParams)

### `unreal.SoundModulationGeneratorEnvelopeFollower`
Inherits: `SoundModulationGenerator` | Header: `SoundModulationEnvelopeFollower.h`

Sound Modulation Generator Envelope Follower

**Properties** (1):
  - `params`: `EnvelopeFollowerGeneratorParams` — [Read-Write] (EnvelopeFollowerGeneratorParams)

### `unreal.SoundModulationGeneratorLFO`
Inherits: `SoundModulationGenerator` | Header: `SoundModulationLFO.h`

Sound Modulation Generator LFO

**Properties** (1):
  - `params`: `SoundModulationLFOParams` — [Read-Write] (SoundModulationLFOParams)

### `unreal.SoundModulationParameter`
Inherits: `Object` | Header: `SoundModulationParameter.h`

Sound Modulation Parameter

**Properties** (1):
  - `settings`: `SoundModulationParameterSettings` [Read-Only] — [Read-Only] (SoundModulationParameterSettings)

### `unreal.SoundModulationParameterAdditive`
Inherits: `SoundModulationParameter` | Header: `SoundModulationParameter.h`

Modulation Parameter whose values are mixed via addition.

**Properties** (2):
  - `unit_max`: `float` [Read-Only] — [Read-Only] Unit maximum of modulator. Maximum is only enforced at modulation destination. (float)
  - `unit_min`: `float` [Read-Only] — [Read-Only] Unit minimum of modulator. Minimum is only enforced at modulation destination. (float)

### `unreal.SoundModulationParameterBipolar`
Inherits: `SoundModulationParameter` | Header: `SoundModulationParameter.h`

Modulation Parameter that scales normalized, unitless value to bipolar range. Mixes additively.

**Properties** (1):
  - `unit_range`: `float` [Read-Only] — [Read-Only] Unit range of modulator. Range is only enforced at modulation destination. (float)

### `unreal.SoundModulationParameterFilterFrequency`
Inherits: `SoundModulationParameterFrequencyBase` | Header: `SoundModulationParameter.h`

Modulation Parameter that scales normalized, unitless value to logarithmic frequency unit space with standard filter min and max frequency set.

### `unreal.SoundModulationParameterFrequency`
Inherits: `SoundModulationParameterFrequencyBase` | Header: `SoundModulationParameter.h`

Modulation Parameter that scales normalized, unitless value to logarithmic frequency unit space with provided minimum and maximum.

**Properties** (2):
  - `unit_max`: `float` [Read-Only] — [Read-Only] Unit maximum of modulator. Maximum is only enforced at modulation destination. (float)
  - `unit_min`: `float` [Read-Only] — [Read-Only] Unit minimum of modulator. Minimum is only enforced at modulation destination. (float)

### `unreal.SoundModulationParameterFrequencyBase`
Inherits: `SoundModulationParameter` | Header: `SoundModulationParameter.h`

Modulation Parameter that scales normalized, unitless value to logarithmic frequency unit space.

### `unreal.SoundModulationParameterHPFFrequency`
Inherits: `SoundModulationParameterFilterFrequency` | Header: `SoundModulationParameter.h`

Modulation Parameter that scales normalized, unitless value to logarithmic frequency unit space with standard filter min and max frequency set. Mixes by taking the maximum (i.e. aggressive) filter fre...

### `unreal.SoundModulationParameterLPFFrequency`
Inherits: `SoundModulationParameterFilterFrequency` | Header: `SoundModulationParameter.h`

Modulation Parameter that scales normalized, unitless value to logarithmic frequency unit space with standard filter min and max frequency set. Mixes by taking the minimum (i.e. aggressive) filter fre...

### `unreal.SoundModulationParameterScaled`
Inherits: `SoundModulationParameter` | Header: `SoundModulationParameter.h`

Linearly scaled value between unit minimum and maximum.

**Properties** (2):
  - `unit_max`: `float` [Read-Only] — [Read-Only] Unit maximum of modulator. Maximum is only enforced at modulation destination. (float)
  - `unit_min`: `float` [Read-Only] — [Read-Only] Unit minimum of modulator. Minimum is only enforced at modulation destination. (float)

### `unreal.SoundModulationParameterVolume`
Inherits: `SoundModulationParameter` | Header: `SoundModulationParameter.h`

Sound Modulation Parameter Volume

**Properties** (1):
  - `min_volume`: `float` [Read-Only] — [Read-Only] Minimum volume of parameter. Only enforced at modulation destination. (float)

### `unreal.SoundModulationPatch`
Inherits: `SoundModulatorBase` | Header: `SoundModulationPatch.h`

Sound Modulation Patch

**Properties** (1):
  - `patch_settings`: `SoundControlModulationPatch` — [Read-Write] (SoundControlModulationPatch)

### `unreal.SoundModulationLFOShape`
Inherits: `EnumBase` | Header: `SoundModulationLFO.h`

ESound Modulation LFOShape

**Properties** (7):
  - `DOWN_SAW`: `SoundModulationLFOShape = Ellipsis` — 2
  - `EXPONENTIAL`: `SoundModulationLFOShape = Ellipsis` — 5
  - `RANDOM_SAMPLE_HOLD`: `SoundModulationLFOShape = Ellipsis` — 6
  - `SINE`: `SoundModulationLFOShape = Ellipsis` — 0
  - `SQUARE`: `SoundModulationLFOShape = Ellipsis` — 3
  - `TRIANGLE`: `SoundModulationLFOShape = Ellipsis` — 4
  - `UP_SAW`: `SoundModulationLFOShape = Ellipsis` — 1
