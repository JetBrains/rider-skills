# UE Python API — Synthesis Module

**126 types** from the `Synthesis` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DynamicsBandSettings`, `EpicSynth1Patch`, `ModularSynthPreset`, `ModularSynthPresetBankEntry`, `PatchId`, `SourceEffectBitCrusherBaseSettings`, `SourceEffectBitCrusherSettings`, `SourceEffectChorusBaseSettings`, `SourceEffectChorusSettings`, `SourceEffectConvolutionReverbSettings`, `SourceEffectDynamicsProcessorSettings`, `SourceEffectEnvelopeFollowerSettings`, `SourceEffectEQBand`, `SourceEffectEQSettings`, `SourceEffectFilterAudioBusModulationSettings`, `SourceEffectFilterSettings`, `SourceEffectFoldbackDistortionSettings`, `SourceEffectIndividualFilterSettings`, `SourceEffectMidSideSpreaderSettings`, `SourceEffectMotionFilterModulationSettings`, ... (126 total)

---

## Classes

### `unreal.DynamicsBandSettings`
Inherits: `StructBase` | Header: `SubmixEffectMultiBandCompressor.h`

Dynamics Band Settings

**Properties** (8):
  - `attack_time_msec`: `float` — [Read-Write] The amount of time to ramp into any dynamics processing effect in milliseconds. (float)
  - `crossover_top_frequency`: `float` — [Read-Write] Frequency of the crossover between this band and the next. The last band will have this...
  - `input_gain_db`: `float` — [Read-Write] The input gain of the dynamics processor in dB (float)
  - `knee_bandwidth_db`: `float` — [Read-Write] The knee bandwidth of the compressor to use in dB (float)
  - `output_gain_db`: `float` — [Read-Write] The output gain of the dynamics processor in dB (float)
  - `ratio`: `float` — [Read-Write] The dynamics processor ratio â has different meaning depending on the processor type....
  - `release_time_msec`: `float` — [Read-Write] The amount of time to release the dynamics processing effect in milliseconds (float)
  - `threshold_db`: `float` — [Read-Write] The threshold at which to perform a dynamics processing operation (float)

### `unreal.EpicSynth1Patch`
Inherits: `StructBase` | Header: `EpicSynth1Component.h`

Epic Synth 1Patch

**Properties** (2):
  - `patch_cables`: `None` — [Read-Write] Patch cables to patch destinations from the patch source. (Array[Synth1PatchCable])
  - `patch_source`: `Synth1PatchSource` — [Read-Write] A modular synth patch source (e.g. LFO1/LFO2/Modulation Envelope) (Synth1PatchSource)

### `unreal.ModularSynthPreset`
Inherits: `TableRowBase` | Header: `EpicSynth1Component.h`

Modular Synth Preset

**Properties** (59):
  - `attack_time`: `float` — [Read-Write] The amplitude envelope attack time (in ms) [0.0, 10000] (float)
  - `chorus_depth`: `float` — [Read-Write] The depth of the chorus effect [0.0, 1.0] (float)
  - `chorus_enabled`: `bool` — [Read-Write] Whether or not the chorus effect is enabled (bool)
  - `chorus_feedback`: `float` — [Read-Write] The amount of feedback in the chorus effect [0.0, 1.0] (float)
  - `chorus_frequency`: `float` — [Read-Write] The chorus LFO frequency [0.0, 20.0] (float)
  - `decay_time`: `float` — [Read-Write] The amplitude envelope decay time (in ms)[0.0, 10000] (float)
  - `enable_oscillator_sync`: `bool` — [Read-Write] Whether or not oscillator sync is enabled. Oscillator sync forces oscillator 2âs phas...
  - `enable_polyphony`: `bool` — [Read-Write] Whether or not to allow multiple synth voices. (bool)
  - `enable_unison`: `bool` — [Read-Write] Enables forcing the oscillators to have no stereo spread. (bool)
  - `filter_algorithm`: `SynthFilterAlgorithm` — [Read-Write] The output filter circuit/algorithm type (one-pole ladder, ladder, state-variable) (Syn...
  - `filter_frequency`: `float` — [Read-Write] The output filter cutoff frequency (hz) [0.0, 20000.0] (float)
  - `filter_q`: `float` — [Read-Write] The output filter resonance (Q) [0.5, 10] (float)
  - `filter_type`: `SynthFilterType` — [Read-Write] The output filter type (lowpass, highpass, bandpass, bandstop) (SynthFilterType)
  - `gain_db`: `float` — [Read-Write] The overall gain to use for the synthesizer in dB [-90.0, 20.0] (float)
  - `invert_modulation_envelope`: `bool` — [Read-Write] Whether or not to invert the modulation envelope (bool)
  - `invert_modulation_envelope_bias`: `bool` — [Read-Write] Whether or not to invert the modulation envelope bias output (bool)
  - `legato`: `bool` — [Read-Write] Whether or not to use legato mode. (bool)
  - `lfo1_frequency`: `float` — [Read-Write] The frequency to use for LFO 1 (in hz) [0.0, 50.0] (float)
  - `lfo1_gain`: `float` — [Read-Write] The linear gain to use for LFO 1 [0.0, 1.0] (float)
  - `lfo1_mode`: `SynthLFOMode` — [Read-Write] The mode to use for LFO 1 (SynthLFOMode)
  - `lfo1_patch_type`: `SynthLFOPatchType` — [Read-Write] The built-in patch type to use for LFO 1 (you can route this to any patchable parameter...
  - `lfo1_type`: `SynthLFOType` — [Read-Write] The type of LFO to use for LFO 1 (SynthLFOType)
  - `lfo2_frequency`: `float` — [Read-Write] The frequency to use for LFO 2 (in hz) [0.0, 50.0] (float)
  - `lfo2_gain`: `float` — [Read-Write] The linear gain to use for LFO 2 [0.0, 1.0] (float)
  - `lfo2_mode`: `SynthLFOMode` — [Read-Write] The mode to use for LFO 2 (SynthLFOMode)
  - `lfo2_patch_type`: `SynthLFOPatchType` — [Read-Write] The built-in patch type to use for LFO 2 (you can route this to any patchable parameter...
  - `lfo2_type`: `SynthLFOType` — [Read-Write] The type of LFO to use for LFO 2 (SynthLFOType)
  - `mod_env_bias_patch_type`: `SynthModEnvBiasPatch` — [Read-Write] The built-in patch type for the envelope modulator bias output. Bias is when the envelo...
  - `mod_env_patch_type`: `SynthModEnvPatch` — [Read-Write] The built-in patch type for the envelope modulator (SynthModEnvPatch)
  - `modulation_envelope_attack_time`: `float` — [Read-Write] The modulation envelope attack time (in ms) [0.0, 10000] (float)
  - `modulation_envelope_decay_time`: `float` — [Read-Write] The modulation envelope decay time (in ms) [0.0, 10000] (float)
  - `modulation_envelope_depth`: `float` — [Read-Write] The âdepthâ (i.e. how much) modulation envelope to use. This scales the modulation ...
  - `modulation_envelope_release_time`: `float` — [Read-Write] The modulation envelope release time (in ms) [0.0, 10000] (float)
  - `modulation_envelope_sustain_gain`: `float` — [Read-Write] The modulation envelope sustain gain (linear gain) [0.0, 1.0] (float)
  - `osc1_cents`: `float` — [Read-Write] The cents (hundreds of a semitone) of oscillator 1. [-100.0, 100.0] (float)
  - `osc1_gain`: `float` — [Read-Write] The linear gain of oscillator 1 [0.0, 1.0] (float)
  - `osc1_octave`: `float` — [Read-Write] The octave of oscillator 1. [-8.0, 8.0] (float)
  - `osc1_pulse_width`: `float` — [Read-Write] The pulsewidth of oscillator 1 (when using a square wave type oscillator). [0.0, 1.0] (...
  - `osc1_semitones`: `float` — [Read-Write] The semi-tones of oscillator 1. [-12.0, 12.0] (float)
  - `osc1_type`: `Synth1OscType` — [Read-Write] What type of oscillator to use for oscillator 1 (Synth1OscType)
  - `osc2_cents`: `float` — [Read-Write] The cents (hundreds of a semitone) of oscillator 2. [-100.0, 100.0] (float)
  - `osc2_gain`: `float` — [Read-Write] The linear gain of oscillator 2 [0.0, 1.0] (float)
  - `osc2_octave`: `float` — [Read-Write] The octave of oscillator 2. [-8.0, 8.0] (float)
  - `osc2_pulse_width`: `float` — [Read-Write] The pulsewidth of oscillator 2 (when using a square wave type oscillator). [0.0, 1.0] (...
  - `osc2_semitones`: `float` — [Read-Write] The semi-tones of oscillator 2. [-12.0, 12.0] (float)
  - `osc2_type`: `Synth1OscType` — [Read-Write] What type of oscillator to use for oscillator 2 (Synth1OscType)
  - `pan`: `float` — [Read-Write] The stereo pan to use. 0.0 is center. -1.0 is left, 1.0 is right. (float)
  - `patches`: `None` — [Read-Write] The modular synth patch cords to use for the synth. Allows routing the LFO1/LFO2 and Mo...
  - `portamento`: `float` — [Read-Write] The amount of portamento to use, which is the amount of pitch sliding from current note...
  - `release_time`: `float` — [Read-Write] The amplitude envelope release time (in ms) [0.0, 10000] (float)
  - `retrigger`: `bool` — [Read-Write] Whether or not to use retrigger mode. (bool)
  - `spread`: `float` — [Read-Write] The amount of stereo spread to use between oscillator 1 and oscillator 2 [0.0, 1.0] (fl...
  - `stereo_delay_enabled`: `bool` — [Read-Write] Whether or not stereo delay is enabled on the synth (bool)
  - `stereo_delay_feedback`: `float` — [Read-Write] The amount of feedback in the stereo delay line [0.0, 1.0] (float)
  - `stereo_delay_mode`: `SynthStereoDelayMode` — [Read-Write] The stereo delay mode of the synth (SynthStereoDelayMode)
  - `stereo_delay_ratio`: `float` — [Read-Write] The ratio between left and right stereo delay lines (wider value is more separation) [0...
  - `stereo_delay_time`: `float` — [Read-Write] The stereo delay time (in ms) [0.0, 2000.0] (float)
  - `stereo_delay_wetlevel`: `float` — [Read-Write] The output wet level to use for the stereo delay time [0.0, 1.0] (float)
  - `sustain_gain`: `float` — [Read-Write] The amplitude envelope sustain amount (linear gain) [0.0, 1.0] (float)

### `unreal.ModularSynthPresetBankEntry`
Inherits: `StructBase` | Header: `EpicSynth1Component.h`

Modular Synth Preset Bank Entry

**Properties** (2):
  - `preset`: `ModularSynthPreset` — [Read-Write] (ModularSynthPreset)
  - `preset_name`: `str` — [Read-Write] (str)

### `unreal.PatchId`
Inherits: `StructBase` | Header: `EpicSynth1Types.h`

Patch Id

### `unreal.SourceEffectBitCrusherBaseSettings`
Inherits: `StructBase` | Header: `SourceEffectBitCrusher.h`

Source Effect Bit Crusher Base Settings

**Properties** (3):
  - `asset_sample_rate`: `float` — âasset_sample_rateâ was renamed to âsample_rateâ. deprecated
  - `bit_depth`: `float` — [Read-Write] The reduced bit depth to use for the audio stream (float)
  - `sample_rate`: `float` — [Read-Write] The reduced frequency to use for the audio stream. (float)

### `unreal.SourceEffectBitCrusherSettings`
Inherits: `StructBase` | Header: `SourceEffectBitCrusher.h`

Source Effect Bit Crusher Settings

**Properties** (2):
  - `bit_modulation`: `SoundModulationDestinationSettings` — [Read-Write] The reduced bit depth to use for the audio stream (SoundModulationDestinationSettings)
  - `sample_rate_modulation`: `SoundModulationDestinationSettings` — [Read-Write] The reduced frequency to use for the audio stream. (SoundModulationDestinationSettings)

### `unreal.SourceEffectChorusBaseSettings`
Inherits: `StructBase` | Header: `SourceEffectChorus.h`

Source Effect Chorus Base Settings

**Properties** (6):
  - `depth`: `float` — [Read-Write] The depth of the chorus effect (float)
  - `dry_level`: `float` — [Read-Write] The dry level of the chorus effect (float)
  - `feedback`: `float` — [Read-Write] The feedback of the chorus effect (float)
  - `frequency`: `float` — [Read-Write] The frequency of the chorus effect (float)
  - `spread`: `float` — [Read-Write] The spread of the effect (larger means greater difference between left and right delay ...
  - `wet_level`: `float` — [Read-Write] The wet level of the chorus effect (float)

### `unreal.SourceEffectChorusSettings`
Inherits: `StructBase` | Header: `SourceEffectChorus.h`

Source Effect Chorus Settings

**Properties** (12):
  - `depth`: `float` — [Read-Write]
deprecated: Property âDepthâ is deprecated. (float)
  - `depth_modulation`: `SoundModulationDestinationSettings` — [Read-Write] The depth of the chorus effect (SoundModulationDestinationSettings)
  - `dry_level`: `float` — [Read-Write]
deprecated: Property âDryLevelâ is deprecated. (float)
  - `dry_modulation`: `SoundModulationDestinationSettings` — [Read-Write] The dry level of the chorus effect (SoundModulationDestinationSettings)
  - `feedback`: `float` — [Read-Write]
deprecated: Property âFeedbackâ is deprecated. (float)
  - `feedback_modulation`: `SoundModulationDestinationSettings` — [Read-Write] The feedback of the chorus effect (SoundModulationDestinationSettings)
  - `frequency`: `float` — [Read-Write]
deprecated: Property âFrequencyâ is deprecated. (float)
  - `frequency_modulation`: `SoundModulationDestinationSettings` — [Read-Write] The frequency of the chorus effect (SoundModulationDestinationSettings)
  - `spread`: `float` — [Read-Write]
deprecated: Property âSpreadâ is deprecated. (float)
  - `spread_modulation`: `SoundModulationDestinationSettings` — [Read-Write] The spread of the effect (larger means greater difference between left and right delay ...
  - `wet_level`: `float` — [Read-Write]
deprecated: Property âWetLevelâ is deprecated. (float)
  - `wet_modulation`: `SoundModulationDestinationSettings` — [Read-Write] The wet level of the chorus effect (SoundModulationDestinationSettings)

### `unreal.SourceEffectConvolutionReverbSettings`
Inherits: `StructBase` | Header: `SourceEffectConvolutionReverb.h`

Source Effect Convolution Reverb Settings

**Properties** (3):
  - `bypass`: `bool` — [Read-Write] If true, input audio is directly routed to output audio with applying any effect. (bool...
  - `dry_volume_db`: `float` — [Read-Write] Controls how much of the dry signal is mixed into the output, in Decibels (float)
  - `wet_volume_db`: `float` — [Read-Write] Controls how much of the wet signal is mixed into the output, in Decibels (float)

### `unreal.SourceEffectDynamicsProcessorSettings`
Inherits: `StructBase` | Header: `SourceEffectDynamicsProcessor.h`

Source Effect Dynamics Processor Settings

**Properties** (13):
  - `analog_mode`: `bool` — [Read-Write] Toggles treating the attack and release envelopes as analog-style vs digital-style (Ana...
  - `attack_time_msec`: `float` — [Read-Write] The amount of time to ramp into any dynamics processing effect (float)
  - `bypass`: `bool` — [Read-Write] Whether or not to bypass effect (bool)
  - `dynamics_processor_type`: `SourceEffectDynamicsProcessorType` — [Read-Write] Type of processor to apply (SourceEffectDynamicsProcessorType)
  - `input_gain_db`: `float` — [Read-Write] The input gain of the dynamics processor (float)
  - `knee_bandwidth_db`: `float` — [Read-Write] The knee bandwidth of the processor to use (float)
  - `look_ahead_msec`: `float` — [Read-Write] The amount of time to look ahead of the current audio (Allows for transients to be incl...
  - `output_gain_db`: `float` — [Read-Write] The output gain of the dynamics processor (float)
  - `peak_mode`: `SourceEffectDynamicsPeakMode` — [Read-Write] Mode of peak detection used on input key signal (SourceEffectDynamicsPeakMode)
  - `ratio`: `float` — [Read-Write] The dynamics processor ratio used for compression/expansion (float)
  - `release_time_msec`: `float` — [Read-Write] The amount of time to release the dynamics processing effect (float)
  - `stereo_linked`: `bool` — [Read-Write] Whether the left and right channels are linked when determining envelopes (bool)
  - `threshold_db`: `float` — [Read-Write] The threshold at which to perform a dynamics processing operation (float)

### `unreal.SourceEffectEnvelopeFollowerSettings`
Inherits: `StructBase` | Header: `SourceEffectEnvelopeFollower.h`

Source Effect Envelope Follower Settings

**Properties** (4):
  - `attack_time`: `float` — [Read-Write] The attack time of the envelope follower in milliseconds (float)
  - `is_analog_mode`: `bool` — [Read-Write] Whether or not the envelope follower is in analog mode (bool)
  - `peak_mode`: `EnvelopeFollowerPeakMode` — [Read-Write] The peak mode of the envelope follower (EnvelopeFollowerPeakMode)
  - `release_time`: `float` — [Read-Write] The release time of the envelope follower in milliseconds (float)

### `unreal.SourceEffectEQBand`
Inherits: `StructBase` | Header: `SourceEffectEQ.h`

Source Effect EQBand

**Properties** (4):
  - `bandwidth`: `float` — [Read-Write] The bandwidth (in octaves) of the band (float)
  - `enabled`: `bool` — [Read-Write] Whether or not the band is enabled. Allows changing bands on the fly. (bool)
  - `frequency`: `float` — [Read-Write] The cutoff frequency of the band (float)
  - `gain_db`: `float` — [Read-Write] The gain in decibels to apply to the eq band (float)

### `unreal.SourceEffectEQSettings`
Inherits: `StructBase` | Header: `SourceEffectEQ.h`

EQ source effect settings

**Properties** (1):
  - `eq_bands`: `None` — [Read-Write] The EQ bands to use (Array[SourceEffectEQBand])

### `unreal.SourceEffectFilterAudioBusModulationSettings`
Inherits: `StructBase` | Header: `SourceEffectFilter.h`

Source Effect Filter Audio Bus Modulation Settings

**Properties** (8):
  - `audio_bus`: `AudioBus` — [Read-Write] Audio bus to use to modulate the filter (AudioBus)
  - `envelope_follower_attack_time_msec`: `int` — [Read-Write] The amplitude envelope follower attack time (in milliseconds) on the audio bus. (int32)
  - `envelope_follower_release_time_msec`: `int` — [Read-Write] The amplitude envelope follower release time (in milliseconds) on the audio bus. (int32...
  - `envelope_gain_multiplier`: `float` — [Read-Write] An amount to scale the envelope follower output to map to the modulation values. (float...
  - `max_frequency_modulation`: `float` — [Read-Write] The frequency modulation value (in semitones from the filter frequency) to use when the...
  - `max_resonance_modulation`: `float` — [Read-Write] The resonance modulation value to use when the envelope is loudest (float)
  - `min_frequency_modulation`: `float` — [Read-Write] The frequency modulation value (in semitones from the filter frequency) to use when the...
  - `min_resonance_modulation`: `float` — [Read-Write] The resonance modulation value to use when the envelope is quietest (float)

### `unreal.SourceEffectFilterSettings`
Inherits: `StructBase` | Header: `SourceEffectFilter.h`

Source Effect Filter Settings

**Properties** (5):
  - `audio_bus_modulation`: `None` — [Read-Write] Audio bus settings to use to modulate the filter frequency cutoff (auto-wah) with arbit...
  - `cutoff_frequency`: `float` — [Read-Write] The filter cutoff frequency (float)
  - `filter_circuit`: `SourceEffectFilterCircuit` — [Read-Write] The type of filter circuit to use. (SourceEffectFilterCircuit)
  - `filter_q`: `float` — [Read-Write] The filter resonance. (float)
  - `filter_type`: `SourceEffectFilterType` — [Read-Write] The type of filter to use. (SourceEffectFilterType)

### `unreal.SourceEffectFoldbackDistortionSettings`
Inherits: `StructBase` | Header: `SourceEffectFoldbackDistortion.h`

Source Effect Foldback Distortion Settings

**Properties** (3):
  - `input_gain_db`: `float` — [Read-Write] The amount of gain to add to input to allow forcing the triggering of the threshold (fl...
  - `output_gain_db`: `float` — [Read-Write] The amount of gain to apply to the output (float)
  - `threshold_db`: `float` — [Read-Write] If the audio amplitude is higher than this, it will fold back (float)

### `unreal.SourceEffectIndividualFilterSettings`
Inherits: `StructBase` | Header: `SourceEffectMotionFilter.h`

Source Effect Individual Filter Settings

**Properties** (4):
  - `cutoff_frequency`: `float` — [Read-Write] The filter cutoff frequency (float)
  - `filter_circuit`: `SourceEffectMotionFilterCircuit` — [Read-Write] The type of filter circuit to use. (SourceEffectMotionFilterCircuit)
  - `filter_q`: `float` — [Read-Write] The filter resonance. (float)
  - `filter_type`: `SourceEffectMotionFilterType` — [Read-Write] The type of filter to use. (SourceEffectMotionFilterType)

### `unreal.SourceEffectMidSideSpreaderSettings`
Inherits: `StructBase` | Header: `SourceEffectMidSideSpreader.h`

FSourceEffectMidSideSpreaderSettings This is the source effectâs setting struct.

**Properties** (4):
  - `equal_power`: `bool` — [Read-Write] Indicate whether an equal power relationship between the mid and side channels should b...
  - `input_mode`: `StereoChannelMode` — [Read-Write] Indicate the channel mode of the input signal (StereoChannelMode)
  - `output_mode`: `StereoChannelMode` — [Read-Write] Indicate the channel mode of the output signal (StereoChannelMode)
  - `spread_amount`: `float` — [Read-Write] Amount of Mid/Side Spread. 0.0 is no spread, 1.0 is full wide. (float)

### `unreal.SourceEffectMotionFilterModulationSettings`
Inherits: `StructBase` | Header: `SourceEffectMotionFilter.h`

Source Effect Motion Filter Modulation Settings

**Properties** (5):
  - `modulation_input_range`: `Vector2D` — [Read-Write] The Modulation Clamped Input Range (Vector2D)
  - `modulation_output_maximum_range`: `Vector2D` — [Read-Write] The Modulation Random Maximum Output Range (Vector2D)
  - `modulation_output_minimum_range`: `Vector2D` — [Read-Write] The Modulation Random Minimum Output Range (Vector2D)
  - `modulation_source`: `SourceEffectMotionFilterModSource` — [Read-Write] The Modulation Source (SourceEffectMotionFilterModSource)
  - `update_ease_ms`: `float` — [Read-Write] Update Ease Speed in milliseconds (float)

### `unreal.SourceEffectMotionFilterSettings`
Inherits: `StructBase` | Header: `SourceEffectMotionFilter.h`

FSourceEffectMotionFilterSettings This is the source effectâs setting struct.

**Properties** (6):
  - `dry_volume_db`: `float` — [Read-Write] Dry volume pass-through in dB. (float)
  - `filter_a_settings`: `SourceEffectIndividualFilterSettings` — [Read-Write] Initial settings for Filter A (SourceEffectIndividualFilterSettings)
  - `filter_b_settings`: `SourceEffectIndividualFilterSettings` — [Read-Write] Initial settings for Filter B (SourceEffectIndividualFilterSettings)
  - `modulation_mappings`: `None` — [Read-Write] Modulation Mappings (Map[SourceEffectMotionFilterModDestination,SourceEffectMotionFilte...
  - `motion_filter_mix`: `float` — [Read-Write] Filter Mix controls the amount of each filter in the signal where -1.0f outputs Only Fi...
  - `motion_filter_topology`: `SourceEffectMotionFilterTopology` — [Read-Write] In Serial Mode, Filter A will process then Filter B will process; in Parallel mode, Fil...

### `unreal.SourceEffectPannerSettings`
Inherits: `StructBase` | Header: `SourceEffectPanner.h`

Source Effect Panner Settings

**Properties** (2):
  - `pan`: `float` — [Read-Write] The pan of the source. -1.0 means left, 0.0 means center, 1.0 means right. (float)
  - `spread`: `float` — [Read-Write] The spread of the source. 1.0 means left only in left channel, right only in right; 0.0...

### `unreal.SourceEffectPhaserSettings`
Inherits: `StructBase` | Header: `SourceEffectPhaser.h`

Source Effect Phaser Settings

**Properties** (5):
  - `feedback`: `float` — [Read-Write] The feedback of the phaser effect (float)
  - `frequency`: `float` — [Read-Write] The LFO frequency of the phaser effect (float)
  - `lfo_type`: `PhaserLFOType` — [Read-Write] The phaser LFO type (PhaserLFOType)
  - `use_quadrature_phase`: `bool` — [Read-Write] Whether or not to use quadtrature phase for the LFO modulation (bool)
  - `wet_level`: `float` — [Read-Write] The wet level of the phaser effect (float)

### `unreal.SourceEffectRingModulationSettings`
Inherits: `StructBase` | Header: `SourceEffectRingModulation.h`

Source Effect Ring Modulation Settings

**Properties** (6):
  - `audio_bus_modulator`: `AudioBus` — [Read-Write] Audio bus to use to modulate the effect (AudioBus)
  - `depth`: `float` — [Read-Write] Ring modulation depth (float)
  - `dry_level`: `float` — [Read-Write] Gain for the dry signal (no ring mod) (float)
  - `frequency`: `float` — [Read-Write] Ring modulation frequency (float)
  - `modulator_type`: `RingModulatorTypeSourceEffect` — [Read-Write] Ring modulation modulator oscillator type (RingModulatorTypeSourceEffect)
  - `wet_level`: `float` — [Read-Write] Gain for the wet signal (with ring mod) (float)

### `unreal.SourceEffectSimpleDelaySettings`
Inherits: `StructBase` | Header: `SourceEffectSimpleDelay.h`

Source Effect Simple Delay Settings

**Properties** (7):
  - `delay_amount`: `float` — [Read-Write] Delay amount in seconds (float)
  - `delay_based_on_distance`: `bool` — [Read-Write] Whether or not to delay the audio based on the distance to the listener or use manual d...
  - `dry_amount`: `float` — [Read-Write] Gain stage on dry (non-delayed signal) (float)
  - `feedback`: `float` — [Read-Write] Amount to feedback into the delay line (because why not) (float)
  - `speed_of_sound`: `float` — [Read-Write] Speed of sound in meters per second when using distance-based delay (float)
  - `use_distance_override`: `bool` — [Read-Write] Whether or not to allow the attenuation distance override value vs the distance to list...
  - `wet_amount`: `float` — [Read-Write] Gain stage on wet (delayed) signal (float)

### `unreal.SourceEffectStereoDelaySettings`
Inherits: `StructBase` | Header: `SourceEffectStereoDelay.h`

Source Effect Stereo Delay Settings

**Properties** (10):
  - `delay_mode`: `StereoDelaySourceEffect` — [Read-Write] What mode to set the stereo delay effect. (StereoDelaySourceEffect)
  - `delay_ratio`: `float` — [Read-Write] Delay spread for left and right channels. Allows left and right channels to have differ...
  - `delay_time_msec`: `float` — [Read-Write] The base amount of delay in the left and right channels of the delay line. (float)
  - `dry_level`: `float` — [Read-Write] The dry level of the effect (float)
  - `feedback`: `float` — [Read-Write] The amount of audio to feedback into the delay line once the delay has been tapped. (fl...
  - `filter_enabled`: `bool` — [Read-Write] Whether or not to enable filtering (bool)
  - `filter_frequency`: `float` — [Read-Write] Cutoff frequency of the filter (float)
  - `filter_q`: `float` — [Read-Write] Q of the filter (float)
  - `filter_type`: `StereoDelayFiltertype` — [Read-Write] Filter type to feed feedback audio to (StereoDelayFiltertype)
  - `wet_level`: `float` — [Read-Write] The amount of delay effect to mix with the dry input signal into the effect. (float)

### `unreal.SourceEffectWaveShaperSettings`
Inherits: `StructBase` | Header: `SourceEffectWaveShaper.h`

Source Effect Wave Shaper Settings

**Properties** (2):
  - `amount`: `float` — [Read-Write] The amount of wave shaping. 0.0 = no wave shaping. (float)
  - `output_gain_db`: `float` — [Read-Write] The amount of wave shaping. 0.0 = no wave shaping. (float)

### `unreal.SubmixEffectConvolutionReverbSettings`
Inherits: `StructBase` | Header: `SubmixEffectConvolutionReverb.h`

Submix Effect Convolution Reverb Settings

**Properties** (11):
  - `allow_hardware_acceleration`: `bool` — [Read-Write]
deprecated: Property âAllowHardwareAccelerationâ is deprecated. (bool)
  - `bypass`: `bool` — [Read-Write] If true, input audio is directly routed to output audio with applying any effect. (bool...
  - `dry_volume_db`: `float` — [Read-Write] Controls how much of the dry signal is mixed into the output, in Decibels (float)
  - `impulse_response`: `AudioImpulseResponse` — [Read-Write]
deprecated: Property âImpulseResponseâ is deprecated. (AudioImpulseResponse)
  - `invert_rear_channel_bleed_phase`: `bool` — [Read-Write] If true, rear channel bleed sends will have their phase inverted. (bool)
  - `mix_input_channel_format_to_impulse_response_format`: `bool` — [Read-Write] If true, the submix input audio is downmixed to match the IR asset audio channel
* form...
  - `mix_reverb_output_to_output_channel_format`: `bool` — [Read-Write] If true, the reverberated audio is upmixed or downmixed to match the submix
* output au...
  - `surround_rear_channel_bleed_amount`: `float` — [Read-Write]
deprecated: Property âSurroundRearChannelBleedAmountâ is deprecated. (float)
  - `surround_rear_channel_bleed_db`: `float` — [Read-Write] Amount of audio to be sent to rear channels in quad/surround configurations (float)
  - `surround_rear_channel_flip`: `bool` — [Read-Write] If true, send Surround Rear Channel Bleed Amount sends front left to back right and vic...
  - `wet_volume_db`: `float` — [Read-Write] Controls how much of the wet signal is mixed into the output, in Decibels (float)

### `unreal.SubmixEffectDelaySettings`
Inherits: `StructBase` | Header: `SubmixEffectDelay.h`

FSubmixEffectDelaySettings UStruct used to define user-exposed params for use with your effect.

**Properties** (3):
  - `delay_length`: `float` — [Read-Write] Number of milliseconds of delay.  Caps at max delay at runtime. (float)
  - `interpolation_time`: `float` — [Read-Write] Number of milliseconds over which a tap will reach itâs set length and gain. Smaller ...
  - `maximum_delay_length`: `float` — [Read-Write] Maximum possible length for a delay, in milliseconds. Changing this at runtime will res...

### `unreal.SubmixEffectFilterSettings`
Inherits: `StructBase` | Header: `SubmixEffectFilter.h`

FSubmixEffectFilterSettings UStruct used to define user-exposed params for use with your effect.

**Properties** (4):
  - `filter_algorithm`: `SubmixFilterAlgorithm` — [Read-Write] What type of filter algorithm to use for the submix filter effect (SubmixFilterAlgorith...
  - `filter_frequency`: `float` — [Read-Write] The output filter cutoff frequency (hz) [0.0, 20000.0] (float)
  - `filter_q`: `float` — [Read-Write] The output filter resonance (Q) [0.5, 10] (float)
  - `filter_type`: `SubmixFilterType` — [Read-Write] What type of filter to use for the submix filter effect (SubmixFilterType)

### `unreal.SubmixEffectFlexiverbSettings`
Inherits: `StructBase` | Header: `SubmixEffectFlexiverb.h`

Submix Effect Flexiverb Settings

**Properties** (4):
  - `complexity`: `int` — [Read-Write] (int32)
  - `decay_time`: `float` — [Read-Write] Time in seconds it will take for the impulse response to decay to -60 dB. (float)
  - `pre_delay`: `float` — [Read-Write] PreDelay - 0.01 < 10.0 < 40.0 - Amount of delay to the first echo in milliseconds. (flo...
  - `room_dampening`: `float` — [Read-Write] Room Dampening - 0.0 < 0.85 < 1.0 - Frequency at which the room dampens. (float)

### `unreal.SubmixEffectMultibandCompressorSettings`
Inherits: `StructBase` | Header: `SubmixEffectMultiBandCompressor.h`

A submix dynamics processor

**Properties** (13):
  - `analog_mode`: `bool` — [Read-Write] Toggles treating the attack and release envelopes as analog-style vs digital-style. Ana...
  - `bands`: `None` — [Read-Write] Each band is a full dynamics processor, affecting at a unique frequency range (Array[Dy...
  - `bypass`: `bool` — [Read-Write] Whether or not to bypass effect (bool)
  - `dynamics_processor_type`: `SubmixEffectDynamicsProcessorType` — [Read-Write] Controls how each band will react to audio above its threshold (SubmixEffectDynamicsPro...
  - `external_audio_bus`: `AudioBus` — [Read-Write] If set, uses output of provided submix as modulator of input signal for dynamics proces...
  - `external_submix`: `SoundSubmix` — [Read-Write] If set, uses output of provided submix as modulator of input signal for dynamics proces...
  - `four_pole`: `bool` — [Read-Write] Turning off FourPole mode will use cheaper, shallower 2-pole crossovers (bool)
  - `key_audition`: `bool` — [Read-Write] Audition the key modulation signal, bypassing enveloping and processing the input signa...
  - `key_gain_db`: `float` — [Read-Write] Gain to apply to key signal if external input is supplied (float)
  - `key_source`: `SubmixEffectDynamicsKeySource` — [Read-Write] (SubmixEffectDynamicsKeySource)
  - `link_mode`: `SubmixEffectDynamicsChannelLinkMode` — [Read-Write] Whether to compress all channels equally, and how to evaluate the overall level (Submix...
  - `look_ahead_msec`: `float` — [Read-Write] The amount of time to look ahead of the current audio. Allows for transients to be incl...
  - `peak_mode`: `SubmixEffectDynamicsPeakMode` — [Read-Write] Controls how quickly the bands will react to a signal above its threshold (SubmixEffect...

### `unreal.SubmixEffectStereoDelaySettings`
Inherits: `StructBase` | Header: `SubmixEffectStereoDelay.h`

Submix Effect Stereo Delay Settings

**Properties** (10):
  - `delay_mode`: `StereoDelaySourceEffect` — [Read-Write] What mode to set the stereo delay effect. (StereoDelaySourceEffect)
  - `delay_ratio`: `float` — [Read-Write] Delay spread for left and right channels. Allows left and right channels to have differ...
  - `delay_time_msec`: `float` — [Read-Write] The base amount of delay in the left and right channels of the delay line. (float)
  - `dry_level`: `float` — [Read-Write] The dry level of the effect (float)
  - `feedback`: `float` — [Read-Write] The amount of audio to feedback into the delay line once the delay has been tapped. (fl...
  - `filter_enabled`: `bool` — [Read-Write] Whether or not to enable filtering (bool)
  - `filter_frequency`: `float` — [Read-Write] Cutoff frequency of the filter (float)
  - `filter_q`: `float` — [Read-Write] Q of the filter (float)
  - `filter_type`: `StereoDelayFiltertype` — [Read-Write] Filter type to feed feedback audio to (StereoDelayFiltertype)
  - `wet_level`: `float` — [Read-Write] The amount of delay effect to mix with the dry input signal into the effect. (float)

### `unreal.SubmixEffectStereoToQuadSettings`
Inherits: `StructBase` | Header: `SubmixEffectStereoToQuad.h`

Submix Effect Stereo to Quad Settings

**Properties** (2):
  - `flip_channels`: `bool` — [Read-Write] Whether or not to flip the left and right input channels when sending to the rear chann...
  - `rear_channel_gain`: `float` — [Read-Write] The gain (in decibels) of the rear channels (float)

### `unreal.SubmixEffectTapDelaySettings`
Inherits: `StructBase` | Header: `SubmixEffectTapDelay.h`

FTapDelaySubmixPresetSettings UStruct used to define user-exposed params for use with your effect.

**Properties** (3):
  - `interpolation_time`: `float` — [Read-Write] Number of milliseconds over which a tap will reach itâs set length and gain. Smaller ...
  - `maximum_delay_length`: `float` — [Read-Write] Maximum possible length for a delay, in milliseconds. Changing this at runtime will res...
  - `taps`: `None` — [Read-Write] Each tapâs metadata (Array[TapDelayInfo])

### `unreal.Synth1PatchCable`
Inherits: `StructBase` | Header: `EpicSynth1Types.h`

Synth 1Patch Cable

**Properties** (2):
  - `depth`: `float` — [Read-Write] The patch depth (how much the modulator modulates the destination) (float)
  - `destination`: `Synth1PatchDestination` — [Read-Write] The patch destination type (Synth1PatchDestination)

### `unreal.Synth2DSliderStyle`
Inherits: `SlateWidgetStyle` | Header: `Synth2DSliderStyle.h`

Represents the appearance of an SSynth2DSlider

**Properties** (6):
  - `background_image`: `SlateBrush` — [Read-Write] (SlateBrush)
  - `bar_thickness`: `float` — [Read-Write] (float)
  - `disabled_bar_image`: `SlateBrush` — [Read-Write] (SlateBrush)
  - `disabled_thumb_image`: `SlateBrush` — [Read-Write] Image to use for the 2D handle (SlateBrush)
  - `normal_bar_image`: `SlateBrush` — [Read-Write] (SlateBrush)
  - `normal_thumb_image`: `SlateBrush` — [Read-Write] Image to use for the 2D handle (SlateBrush)

### `unreal.SynthKnobStyle`
Inherits: `SlateWidgetStyle` | Header: `SynthKnobStyle.h`

Represents the appearance of an SSynthKnob

**Properties** (7):
  - `knob_size`: `SynthKnobSize` — [Read-Write] The size of the knobs to use. (SynthKnobSize)
  - `large_knob`: `SlateBrush` — [Read-Write] Image to use for the large knob (SlateBrush)
  - `large_knob_overlay`: `SlateBrush` — [Read-Write] Image to use for the dot handle (SlateBrush)
  - `max_value_angle`: `float` — [Read-Write] Image to use for the medium knob dot handle (float)
  - `medium_knob`: `SlateBrush` — [Read-Write] Image to use for the medium large knob (SlateBrush)
  - `medium_knob_overlay`: `SlateBrush` — [Read-Write] Image to use for the medium knob dot handle (SlateBrush)
  - `min_value_angle`: `float` — [Read-Write] Image to use for the medium knob dot handle (float)

### `unreal.SynthSlateStyle`
Inherits: `SlateWidgetStyle` | Header: `SynthSlateStyle.h`

Represents the appearance of synth UI elements in slate.

**Properties** (2):
  - `color_style`: `SynthSlateColorStyle` — [Read-Write] Image to use when the slider bar is in its disabled state (SynthSlateColorStyle)
  - `size_type`: `SynthSlateSizeType` — [Read-Write] The size of the knobs to use. (SynthSlateSizeType)

### `unreal.TapDelayInfo`
Inherits: `StructBase` | Header: `SubmixEffectTapDelay.h`

Tap Delay Info

**Properties** (5):
  - `delay_length`: `float` — [Read-Write] Amount of time before this echo is heard in milliseconds. (float)
  - `gain`: `float` — [Read-Write] How loud this echo should be, in decibels. (float)
  - `output_channel`: `int` — [Read-Write] When the Tap Line Mode is set to Send To Channel, designates index of channel from whic...
  - `pan_in_degrees`: `float` — [Read-Write] When the Tap Line Mode is set to Panning, designates the angle at which the echo should...
  - `tap_line_mode`: `TapLineMode` — [Read-Write] Whether the tap line should send directly to a channel, pan, or not produce sound at al...

### `unreal.AudioImpulseResponse`
Inherits: `Object` | Header: `EffectConvolutionReverb.h`

UAudioImpulseResponse UAsset used to represent Imported Impulse Responses

**Properties** (3):
  - `ir_data`: `None` — [Read-Write]
deprecated: Property âIRDataâ is deprecated. (Array[float])
  - `normalization_volume_db`: `float` [Read-Only] — [Read-Only] Used to account for energy added by convolution with âloudâ Impulse Responses. (floa...
  - `true_stereo`: `bool` [Read-Only] — [Read-Only] If true, impulse response channels are interpreted as true stereo which allows channel c...

### `unreal.EnvelopeFollowerListener`
Inherits: `ActorComponent` | Header: `SourceEffectEnvelopeFollower.h`

Envelope Follower Listener

**Properties** (1):
  - `on_envelope_follower_update`: `OnEnvelopeFollowerUpdate` — [Read-Write] (OnEnvelopeFollowerUpdate)

### `unreal.GranularSynth`
Inherits: `SynthComponent` | Header: `SynthComponentGranulator.h`

Granular Synth

**Methods** (20):
  - `get_current_playhead_time()` -> `float` — Get Current Playhead Time
  - `get_sample_duration()` -> `float` — Get Sample Duration
  - `is_loaded()` -> `bool` — Is Loaded
  - `note_off(note, kill = False)` -> `None` — Note Off
  - `note_on(note, velocity, duration = -1.000000)` -> `None` — Note On
  - `set_attack_time(attack_time_msec)` -> `None` — Set Attack Time
  - `set_decay_time(decay_time_msec)` -> `None` — Set Decay Time
  - `set_grain_duration(base_duration_msec, duration_range = [0.000000,0.000000])` -> `None` — Set Grain Duration
  - `set_grain_envelope_type(envelope_type)` -> `None` — Set Grain Envelope Type
  - `set_grain_pan(base_pan, pan_range = [0.000000,0.000000])` -> `None` — Set Grain Pan
  - `set_grain_pitch(base_pitch, pitch_range = [0.000000,0.000000])` -> `None` — Set Grain Pitch
  - `set_grain_probability(grain_probability)` -> `None` — Set Grain Probability
  - `set_grain_volume(base_volume, volume_range = [0.000000,0.000000])` -> `None` — Set Grain Volume
  - `set_grains_per_second(grains_per_second)` -> `None` — Set Grains Per Second
  - `set_playback_speed(playhead_rate)` -> `None` — Set Playback Speed
  - `set_playhead_time(position_sec, lerp_time_sec = 0.000000, seek_type = GranularSynthSeekType.FROM_BEGINNING)` -> `None` — Set Playhead Time
  - `set_release_time_msec(release_time_msec)` -> `None` — Set Release Time Msec
  - `set_scrub_mode(scrub_mode)` -> `None` — Set Scrub Mode
  - `set_sound_wave(sound_wave)` -> `None` — This will override the current sound wave if one is set, stop audio, and reload the new sound wave
  - `set_sustain_gain(sustain_gain)` -> `None` — Set Sustain Gain

### `unreal.ModularSynthComponent`
Inherits: `SynthComponent` | Header: `EpicSynth1Component.h`

UModularSynthComponent Implementation of a USynthComponent.

**Methods** (59):
  - `create_patch(patch_source, patch_cables, enable_by_default)` -> `PatchId` — Creates a new modular synth patch between a modulation source and a set of modulation destinations
  - `note_off(note, all_notes_off = False, kill_all_notes = False)` -> `None` — Stop the note (will only do anything if a voice is playing with that note)
  - `note_on(note, velocity, duration = -1.000000)` -> `None` — Play a new note. Optionally pass in a duration to automatically turn off the note.
  - `set_attack_time(attack_time_msec)` -> `None` — Sets the envelope attack time in msec.
  - `set_chorus_depth(depth)` -> `None` — Sets the chorus depth
  - `set_chorus_enabled(enable_chorus)` -> `None` — Sets whether or not chorus is enabled.
  - `set_chorus_feedback(feedback)` -> `None` — Sets the chorus feedback
  - `set_chorus_frequency(frequency)` -> `None` — Sets the chorus frequency
  - `set_decay_time(decay_time_msec)` -> `None` — Sets the envelope decay time in msec.
  - `set_enable_legato(legato_enabled)` -> `None` — Sets whether or not to use legato for the synthesizer.
  - `set_enable_patch(patch_id, is_enabled)` -> `bool` — Set Enable Patch
  - `set_enable_polyphony(enable_polyphony)` -> `None` — Sets whether or not to use polyphony for the synthesizer.
  - `set_enable_retrigger(retrigger_enabled)` -> `None` — Sets whether or not to retrigger envelope per note on.
  - `set_enable_unison(enable_unison)` -> `None` — Sets whether or not the synth is in unison mode (i.e. no spread)
  - `set_filter_algorithm(filter_algorithm)` -> `None` — Sets the filter algorithm.
  - `set_filter_frequency(filter_frequency_hz)` -> `None` — Sets the filter cutoff frequency in hz.
  - `set_filter_frequency_mod(filter_frequency_hz)` -> `None` — Sets the filter cutoff frequency in hz.
  - `set_filter_q(filter_q)` -> `None` — Sets the filter Q (resonance)
  - `set_filter_q_mod(filter_q)` -> `None` — Sets a modulated filter Q (resonance)
  - `set_filter_type(filter_type)` -> `None` — Sets the filter type.
  - `set_gain_db(gain_db)` -> `None` — Sets the synth gain in decibels.
  - `set_lfo_frequency(lfo_index, frequency_hz)` -> `None` — Sets the LFO frequency in hz
  - `set_lfo_frequency_mod(lfo_index, frequency_mod_hz)` -> `None` — Sets the LFO frequency modulation in hz
  - `set_lfo_gain(lfo_index, gain)` -> `None` — Sets the LFO gain factor
  - `set_lfo_gain_mod(lfo_index, gain_mod)` -> `None` — Sets the LFO gain mod factor (external modulation)
  - `set_lfo_mode(lfo_index, lfo_mode)` -> `None` — Sets the LFO type
  - `set_lfo_patch(lfo_index, lfo_patch_type)` -> `None` — Sets the LFO patch type. LFO patch determines what parameter is modulated by the LFO.
  - `set_lfo_type(lfo_index, lfo_type)` -> `None` — Sets the LFO type
  - `set_mod_env_attack_time(attack_time_msec)` -> `None` — Sets the envelope modulator attack time in msec
  - `set_mod_env_bias_invert(invert)` -> `None` — Sets whether or not to invert the bias output of the envelope modulator.
  - `set_mod_env_bias_patch(patch_type)` -> `None` — Sets whether or not to modulate a param based on the envelope. Uses bias envelope output (offset from sustain gain).
  - `set_mod_env_decay_time(decay_time_msec)` -> `None` — Sets the envelope modulator attack time in msec
  - `set_mod_env_depth(depth)` -> `None` — Sets the envelope modulator depth (amount to apply the output modulation)
  - `set_mod_env_invert(invert)` -> `None` — Sets whether or not to invert the envelope modulator.
  - `set_mod_env_patch(patch_type)` -> `None` — Sets whether or not to modulate a param based on the envelope. Uses bias envelope output (offset from sustain gain).
  - `set_mod_env_release_time(release)` -> `None` — Sets the envelope modulator release
  - `set_mod_env_sustain_gain(sustain_gain)` -> `None` — Sets the envelope modulator sustain gain
  - `set_osc_cents(osc_index, cents)` -> `None` — Sets the oscillator cents.
  - `set_osc_frequency_mod(osc_index, osc_freq_mod)` -> `None` — Set the oscillator frequency modulation
  - `set_osc_gain(osc_index, osc_gain)` -> `None` — Set the oscillator gain.
  - `set_osc_gain_mod(osc_index, osc_gain_mod)` -> `None` — Set the oscillator gain modulation.
  - `set_osc_octave(osc_index, octave)` -> `None` — Sets the oscillator octaves
  - `set_osc_pulsewidth(osc_index, pulsewidth)` -> `None` — Sets the square wave pulsewidth [0.0, 1.0]
  - `set_osc_semitones(osc_index, semitones)` -> `None` — Sets the oscillator semitones.
  - `set_osc_sync(is_synced)` -> `None` — Set whether or not to follow the phase of osc2 to osc1
  - `set_osc_type(osc_index, osc_type)` -> `None` — Set the oscillator type.
  - `set_pan(pan)` -> `None` — Sets the pan of the synth [-1.0, 1.0].
  - `set_pitch_bend(pitch_bend)` -> `None` — Sets the synth pitch bend amount.
  - `set_portamento(portamento)` -> `None` — Sets the synth portamento [0.0, 1.0]
  - `set_release_time(release_time_msec)` -> `None` — Sets the envelope release time in msec.
  - `set_spread(spread)` -> `None` — Sets the amount of spread of the oscillators. [0.0, 1.0]
  - `set_stereo_delay_feedback(delay_feedback)` -> `None` — Sets the amount of stereo delay feedback [0.0, 1.0]
  - `set_stereo_delay_is_enabled(stereo_delay_enabled)` -> `None` — Sets whether not stereo delay is enabled.
  - `set_stereo_delay_mode(stereo_delay_mode)` -> `None` — Sets whether not stereo delay is enabled.
  - `set_stereo_delay_ratio(delay_ratio)` -> `None` — Sets the amount of stereo delay ratio between left and right delay lines [0.0, 1.0]
  - `set_stereo_delay_time(delay_time_msec)` -> `None` — Sets the amount of stereo delay time in msec.
  - `set_stereo_delay_wetlevel(delay_wetlevel)` -> `None` — Sets the amount of stereo delay wetlevel [0.0, 1.0]
  - `set_sustain_gain(sustain_gain)` -> `None` — Sets the envelope sustain gain value.
  - `set_synth_preset(synth_preset)` -> `None` — Sets the preset struct for the synth

**Properties** (1):
  - `voice_count`: `int` [Read-Only] — [Read-Only] The voice count to use for the synthesizer. Cannot be changed (int32)

### `unreal.ModularSynthLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `EpicSynth1Component.h`

Modular Synth Library

**Methods** (1):
  - `add_modular_synth_preset_to_bank_asset(bank, preset, preset_name)` -> `None` [classmethod] — Adds the modular synth preset to the bank asset in the content browser. Only call during editor.

### `unreal.ModularSynthPresetBank`
Inherits: `Object` | Header: `EpicSynth1Component.h`

Modular Synth Preset Bank

**Properties** (1):
  - `presets`: `None` — [Read-Write] (Array[ModularSynthPresetBankEntry])

### `unreal.MonoWaveTableSynthPreset`
Inherits: `Object` | Header: `SynthComponentMonoWaveTable.h`

UStruct Mono Wave Table Synth Preset

**Properties** (6):
  - `lock_keyframes_to_grid`: `int` [Read-Only] — [Read-Only] How many evenly-spaced keyframes to use when LockKeyframesToGrid is true (int32)
  - `lock_keyframes_to_grid_bool`: `bool` [Read-Only] — [Read-Only] Lock wavetables to evenly spaced keyframes that can be edited vertically only (will re-s...
  - `normalize_wave_tables`: `bool` — [Read-Write] Normalize the WaveTable data? False will allow clipping, True will normalize the tables...
  - `preset_name`: `str` — [Read-Write] Name the preset (str)
  - `wave_table`: `None` [Read-Only] — [Read-Only] Wave Table Editor (Array[RuntimeFloatCurve])
  - `wave_table_resolution`: `int` [Read-Only] — [Read-Only] How many samples will be taken of the curve from time = [0.0, 1.0] (int32)

### `unreal.SourceEffectBitCrusherPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectBitCrusher.h`

Source Effect Bit Crusher Preset

**Methods** (8):
  - `set_bit_modulator(modulator)` -> `None` — Set Bit Modulator
  - `set_bit_modulators(modulators)` -> `None` — Set Bit Modulators
  - `set_bits(bits)` -> `None` — Set Bits
  - `set_modulation_settings(modulation_settings)` -> `None` — Set Modulation Settings
  - `set_sample_rate(sample_rate)` -> `None` — Set Sample Rate
  - `set_sample_rate_modulator(modulator)` -> `None` — Set Sample Rate Modulator
  - `set_sample_rate_modulators(modulators)` -> `None` — Set Sample Rate Modulators
  - `set_settings(settings)` -> `None` — Sets just base (i.e. carrier) setting values without modifying modulation source references

**Properties** (1):
  - `settings`: `SourceEffectBitCrusherSettings` [Read-Only] — [Read-Only] (SourceEffectBitCrusherSettings)

### `unreal.SourceEffectChorusPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectChorus.h`

Source Effect Chorus Preset

**Methods** (20):
  - `set_depth(depth)` -> `None` — Set Depth
  - `set_depth_modulator(modulator)` -> `None` — Set Depth Modulator
  - `set_depth_modulators(modulators)` -> `None` — Set Depth Modulators
  - `set_dry(dry_amount)` -> `None` — Set Dry
  - `set_dry_modulator(modulator)` -> `None` — Set Dry Modulator
  - `set_dry_modulators(modulators)` -> `None` — Set Dry Modulators
  - `set_feedback(feedback)` -> `None` — Set Feedback
  - `set_feedback_modulator(modulator)` -> `None` — Set Feedback Modulator
  - `set_feedback_modulators(modulators)` -> `None` — Set Feedback Modulators
  - `set_frequency(frequency)` -> `None` — Set Frequency
  - `set_frequency_modulator(modulator)` -> `None` — Set Frequency Modulator
  - `set_frequency_modulators(modulators)` -> `None` — Set Frequency Modulators
  - `set_modulation_settings(modulation_settings)` -> `None` — Set Modulation Settings
  - `set_settings(settings)` -> `None` — Sets just base (i.e. carrier) setting values without modifying modulation source references
  - `set_spread(spread)` -> `None` — Set Spread
  - `set_spread_modulator(modulator)` -> `None` — Set Spread Modulator
  - `set_spread_modulators(modulators)` -> `None` — Set Spread Modulators
  - `set_wet(wet_amount)` -> `None` — Set Wet
  - `set_wet_modulator(modulator)` -> `None` — Set Wet Modulator
  - `set_wet_modulators(modulators)` -> `None` — Set Wet Modulators

**Properties** (1):
  - `settings`: `SourceEffectChorusSettings` [Read-Only] — [Read-Only] (SourceEffectChorusSettings)

### `unreal.SourceEffectConvolutionReverbPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectConvolutionReverb.h`

Source Effect Convolution Reverb Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set the convolution reverb settings

**Properties** (4):
  - `block_size`: `SubmixEffectConvolutionReverbBlockSize` [Read-Only] — [Read-Only] Set the internal block size. This can effect latency and performance. Higher values will...
  - `enable_hardware_acceleration`: `bool` [Read-Only] — [Read-Only] Opt into hardware acceleration of the convolution reverb (if available) (bool)
  - `impulse_response`: `AudioImpulseResponse` — [Read-Write] The impulse response used for convolution. (AudioImpulseResponse)
  - `settings`: `SourceEffectConvolutionReverbSettings` — [Read-Write] ConvolutionReverbPreset Preset Settings. (SourceEffectConvolutionReverbSettings)

### `unreal.SourceEffectDynamicsProcessorPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectDynamicsProcessor.h`

Source Effect Dynamics Processor Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SourceEffectDynamicsProcessorSettings` [Read-Only] — [Read-Only] (SourceEffectDynamicsProcessorSettings)

### `unreal.SourceEffectEnvelopeFollowerPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectEnvelopeFollower.h`

Source Effect Envelope Follower Preset

**Methods** (3):
  - `register_envelope_follower_listener(envelope_follower_listener)` -> `None` — Registers an envelope follower listener with the effect.
  - `set_settings(settings)` -> `None` — Set Settings
  - `unregister_envelope_follower_listener(envelope_follower_listener)` -> `None` — Unregisters an envelope follower listener with the effect.

**Properties** (1):
  - `settings`: `SourceEffectEnvelopeFollowerSettings` [Read-Only] — [Read-Only] (SourceEffectEnvelopeFollowerSettings)

### `unreal.SourceEffectEQPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectEQ.h`

Source Effect EQPreset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SourceEffectEQSettings` [Read-Only] — [Read-Only] (SourceEffectEQSettings)

### `unreal.SourceEffectFilterPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectFilter.h`

Source Effect Filter Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SourceEffectFilterSettings` [Read-Only] — [Read-Only] (SourceEffectFilterSettings)

### `unreal.SourceEffectFoldbackDistortionPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectFoldbackDistortion.h`

Source Effect Foldback Distortion Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SourceEffectFoldbackDistortionSettings` [Read-Only] — [Read-Only] (SourceEffectFoldbackDistortionSettings)

### `unreal.SourceEffectMidSideSpreaderPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectMidSideSpreader.h`

USourceEffectMidSideSpreaderPreset This code exposes your preset settings and effect class to the editor. And allows for a handle to setting/updating effect settings dynamically.

**Methods** (1):
  - `set_settings(settings)` -> `None` — Change settings of your effect from blueprints. Will broadcast changes to active instances.

**Properties** (1):
  - `settings`: `SourceEffectMidSideSpreaderSettings` [Read-Only] — [Read-Only] The copy of the settings struct. Canât be written to in BP, but can be read.
Note that...

### `unreal.SourceEffectMotionFilterPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectMotionFilter.h`

USourceEffectMotionFilterPreset This code exposes your preset settings and effect class to the editor. And allows for a handle to setting/updating effect settings dynamically.

**Methods** (1):
  - `set_settings(settings)` -> `None` — Change settings of your effect from blueprints. Will broadcast changes to active instances.

**Properties** (1):
  - `settings`: `SourceEffectMotionFilterSettings` [Read-Only] — [Read-Only] The copy of the settings struct. Canât be written to in BP, but can be read.
Note that...

### `unreal.SourceEffectPannerPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectPanner.h`

Source Effect Panner Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SourceEffectPannerSettings` [Read-Only] — [Read-Only] (SourceEffectPannerSettings)

### `unreal.SourceEffectPhaserPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectPhaser.h`

Source Effect Phaser Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SourceEffectPhaserSettings` — [Read-Write] The depth of the chorus effect (SourceEffectPhaserSettings)

### `unreal.SourceEffectRingModulationPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectRingModulation.h`

Source Effect Ring Modulation Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SourceEffectRingModulationSettings` [Read-Only] — [Read-Only] (SourceEffectRingModulationSettings)

### `unreal.SourceEffectSimpleDelayPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectSimpleDelay.h`

Source Effect Simple Delay Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SourceEffectSimpleDelaySettings` [Read-Only] — [Read-Only] (SourceEffectSimpleDelaySettings)

### `unreal.SourceEffectStereoDelayPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectStereoDelay.h`

Source Effect Stereo Delay Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SourceEffectStereoDelaySettings` [Read-Only] — [Read-Only] (SourceEffectStereoDelaySettings)

### `unreal.SourceEffectWaveShaperPreset`
Inherits: `SoundEffectSourcePreset` | Header: `SourceEffectWaveShaper.h`

Source Effect Wave Shaper Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SourceEffectWaveShaperSettings` [Read-Only] — [Read-Only] (SourceEffectWaveShaperSettings)

### `unreal.SubmixEffectConvolutionReverbPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `SubmixEffectConvolutionReverb.h`

Submix Effect Convolution Reverb Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set the convolution reverb settings

**Properties** (4):
  - `block_size`: `SubmixEffectConvolutionReverbBlockSize` [Read-Only] — [Read-Only] Set the internal block size. This can effect latency and performance. Higher values will...
  - `enable_hardware_acceleration`: `bool` [Read-Only] — [Read-Only] Opt into hardware acceleration of the convolution reverb (if available) (bool)
  - `impulse_response`: `AudioImpulseResponse` — [Read-Write] The impulse response used for convolution. (AudioImpulseResponse)
  - `settings`: `SubmixEffectConvolutionReverbSettings` — [Read-Write] ConvolutionReverbPreset Preset Settings. (SubmixEffectConvolutionReverbSettings)

### `unreal.SubmixEffectDelayPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `SubmixEffectDelay.h`

USubmixEffectDelayPreset Class which processes audio streams and uses parameters defined in the preset class.

**Methods** (5):
  - `get_max_delay_in_milliseconds()` -> `float` — Get the maximum delay possible.
  - `set_default_settings(settings)` -> `None` — Sets objectâs default settings. This will update both the default UObject settings (and mark it as dirty), as well as ...
  - `set_delay(length)` -> `None` — Set how long the delay actually is, in milliseconds.
  - `set_interpolation_time(time)` -> `None` — Set the time it takes to interpolate between parameters, in milliseconds.
  - `set_settings(settings)` -> `None` — Sets runtime delay settings. This will replace any dynamically added or modified settings without modifying the original...

**Properties** (1):
  - `settings`: `SubmixEffectDelaySettings` — [Read-Write] (SubmixEffectDelaySettings)

### `unreal.SubmixEffectDelayStatics`
Inherits: `BlueprintFunctionLibrary` | Header: `SubmixEffectDelay.h`

Submix Effect Delay Statics

**Methods** (3):
  - `set_delay_length(delay_settings, delay_settings=SubmixEffectDelaySettings)` [classmethod] — Set Delay Length
  - `set_interpolation_time(delay_settings, delay_settings=SubmixEffectDelaySettings)` [classmethod] — Set Interpolation Time
  - `set_maximum_delay_length(delay_settings, delay_settings=SubmixEffectDelaySettings)` [classmethod] — Set Maximum Delay Length

### `unreal.SubmixEffectFilterPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `SubmixEffectFilter.h`

USubmixEffectFilterPreset Class which processes audio streams and uses parameters defined in the preset class.

**Methods** (7):
  - `set_filter_algorithm(algorithm)` -> `None` — Sets the filter algorithm
  - `set_filter_cutoff_frequency(frequency)` -> `None` — Sets the base filter cutoff frequency
  - `set_filter_cutoff_frequency_mod(frequency)` -> `None` — Sets the mod filter cutoff frequency
  - `set_filter_q(q)` -> `None` — Sets the filter Q
  - `set_filter_q_mod(q)` -> `None` — Sets the filter Q
  - `set_filter_type(type)` -> `None` — Sets the filter type
  - `set_settings(settings)` -> `None` — Set all filter effect settings

**Properties** (1):
  - `settings`: `SubmixEffectFilterSettings` — [Read-Write] (SubmixEffectFilterSettings)

### `unreal.SubmixEffectFlexiverbPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `SubmixEffectFlexiverb.h`

Submix Effect Flexiverb Preset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SubmixEffectFlexiverbSettings` — [Read-Write] (SubmixEffectFlexiverbSettings)

### `unreal.SubmixEffectMultibandCompressorPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `SubmixEffectMultiBandCompressor.h`

Submix Effect Multiband Compressor Preset

**Methods** (4):
  - `reset_key()` -> `None` — Reset Key
  - `set_audio_bus(audio_bus)` -> `None` — Sets the source key input as the provided AudioBusâ output. If no object is provided, key is set to effectâs input.
  - `set_external_submix(submix)` -> `None` — Sets the source key input as the provided Submixâs output. If no object is provided, key is set to effectâs input.
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SubmixEffectMultibandCompressorSettings` — [Read-Write] (SubmixEffectMultibandCompressorSettings)

### `unreal.SubmixEffectStereoDelayPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `SubmixEffectStereoDelay.h`

USubmixEffectDelayPreset Class which processes audio streams and uses parameters defined in the preset class.

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set all tap delay settings. This will replace any dynamically added or modified taps.

**Properties** (1):
  - `settings`: `SubmixEffectStereoDelaySettings` — [Read-Write] (SubmixEffectStereoDelaySettings)

### `unreal.SubmixEffectStereoToQuadPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `SubmixEffectStereoToQuad.h`

Submix effect which sends stereo audio to quad (left surround and right surround) if the channel count is greater than 2.

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set all tap delay settings. This will replace any dynamically added or modified taps.

**Properties** (1):
  - `settings`: `SubmixEffectStereoToQuadSettings` — [Read-Write] (SubmixEffectStereoToQuadSettings)

### `unreal.SubmixEffectTapDelayPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `SubmixEffectTapDelay.h`

UTapDelaySubmixPreset Class which processes audio streams and uses parameters defined in the preset class.

**Methods** (8):
  - `add_tap()` -> `int32` — Adds a dynamic tap delay with the given settings. Returns the tap id.
  - `get_max_delay_in_milliseconds()` -> `float` — Get the maximum delay possible.
  - `get_tap(tap_id)` -> `TapDelayInfo` — Get the current info about a specific tap.
  - `get_tap_ids()` -> `Array [ int32 ]` — Retrieve an array of all tap ids for the submix effect.
  - `remove_tap(tap_id)` -> `None` — Remove the tap from the preset.
  - `set_interpolation_time(time)` -> `None` — Set the time it takes to interpolate between parameters, in milliseconds.
  - `set_settings(settings)` -> `None` — Set all tap delay setting. This will replace any dynamically added or modified taps.
  - `set_tap(tap_id, tap_info)` -> `None` — Modify a specific tap.

**Properties** (1):
  - `settings`: `SubmixEffectTapDelaySettings` — [Read-Write] (SubmixEffectTapDelaySettings)

### `unreal.Synth2DSlider`
Inherits: `Widget` | Header: `Synth2DSlider.h`

A simple widget that shows a sliding bar with a handle that allows you to control the value between 0..1.

**Methods** (6):
  - `get_value()` -> `Vector2D` — Gets the current value of the slider.
  - `set_indent_handle(value)` -> `None` — Sets if the slidable area should be indented to fit the handle
  - `set_locked(value)` -> `None` — Sets the handle to be interactive or fixed
  - `set_slider_handle_color(value)` -> `None` — Sets the color of the handle bar
  - `set_step_size(value)` -> `None` — Sets the amount to adjust the value by, when using a controller or keyboard
  - `set_value(value)` -> `None` — Sets the current value of the slider.

**Properties** (12):
  - `indent_handle`: `bool` [Read-Only] — [Read-Only] Whether the slidable area should be indented to fit the handle. (bool)
  - `is_focusable`: `bool` [Read-Only] — [Read-Only] Should the slider be focusable? (bool)
  - `locked`: `bool` [Read-Only] — [Read-Only] Whether the handle is interactive or fixed. (bool)
  - `on_controller_capture_begin`: `OnControllerCaptureBeginEventSynth2D` — [Read-Write] Invoked when the controller capture begins. (OnControllerCaptureBeginEventSynth2D)
  - `on_controller_capture_end`: `OnControllerCaptureEndEventSynth2D` — [Read-Write] Invoked when the controller capture ends. (OnControllerCaptureEndEventSynth2D)
  - `on_mouse_capture_begin`: `OnMouseCaptureBeginEventSynth2D` — [Read-Write] Invoked when the mouse is pressed and a capture begins. (OnMouseCaptureBeginEventSynth2...
  - `on_mouse_capture_end`: `OnMouseCaptureEndEventSynth2D` — [Read-Write] Invoked when the mouse is released and a capture ends. (OnMouseCaptureEndEventSynth2D)
  - `on_value_changed_x`: `OnFloatValueChangedEventSynth2D` — [Read-Write] Called when the value is changed by slider or typing. (OnFloatValueChangedEventSynth2D)
  - `on_value_changed_y`: `OnFloatValueChangedEventSynth2D` — [Read-Write] Called when the value is changed by slider or typing. (OnFloatValueChangedEventSynth2D)
  - `slider_handle_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the slider handle in. (LinearColor)
  - `step_size`: `float` [Read-Only] — [Read-Only] The amount to adjust the value by, when using a controller or keyboard (float)
  - `widget_style`: `Synth2DSliderStyle` — [Read-Write] The progress bar style (Synth2DSliderStyle)

### `unreal.SynthComponentMonoWaveTable`
Inherits: `SynthComponent` | Header: `SynthComponentMonoWaveTable.h`

Synth Component Mono Wave Table

**Methods** (44):
  - `get_curve_tangent(table_index)` -> `float` — Get the curve interpolation type (What the curve is doing between keyframes)
  - `get_key_frame_values_for_table(table_index)` -> `Array [ float ]` — Get an array of floats that represent the key frames in the requested curve
  - `get_max_table_index()` -> `int32` — Get the number of curves in the wave table. (returns -1 if there is no asset)
  - `get_num_table_entries()` -> `int32` — Start BP functionality // Get the number of table elements from Blueprint
  - `note_off(midi_note)` -> `None` — Starts a new note (retrigs modulators, etc.)
  - `note_on(midi_note, velocity)` -> `None` — Starts a new note (retrigs modulators, etc.)
  - `refresh_all_wave_tables()` -> `None` — Refresh all wavetables (from Game Thread data)
  - `refresh_wave_table(index)` -> `None` — Refresh a particular wavetable (from Game Thread data)
  - `set_amp_envelope_attack_time(attack_time_msec)` -> `None` — Set Amp envelope attack time (msec)
  - `set_amp_envelope_bias_depth(depth)` -> `None` — Set the bias depth of the the Amp envelope
  - `set_amp_envelope_bias_invert(bias_invert)` -> `None` — Set whether or not the Amp envelopeâs bias is inverted
  - `set_amp_envelope_decay_time(decay_time_msec)` -> `None` — Set Amp envelope decay time (msec)
  - `set_amp_envelope_depth(depth)` -> `None` — Set the overall depth of the Amp envelope
  - `set_amp_envelope_invert(invert)` -> `None` — Set whether or not the Amp envelope is inverted
  - `set_amp_envelope_release_time(release_time_msec)` -> `None` — Set Amp envelope release time (msec)
  - `set_amp_envelope_sustain_gain(sustain_gain)` -> `None` — Set Amp envelope sustain gain [0.0, 1.0]
  - `set_curve_interpolation_type(interpolation_type, table_index)` -> `bool` — Set the curve interpolation type (What the curve is doing between keyframes) This should only be used for live-editing f...
  - `set_curve_tangent(table_index, new_tangent)` -> `bool` — Set the curve tangent (âCurve depthâ between keyframes) This should only be used for live-editing features! (changin...
  - `set_curve_value(table_index, keyframe_index, new_value)` -> `bool`
  - `set_filter_envelope_attack_time(attack_time_msec)` -> `None` — Set Low-Pass Filter envelope attack time (msec)
  - `set_filter_envelope_bias_depth(depth)` -> `None` — Set Low-Pass Filter envelope bias depth
  - `set_filter_envelope_bias_invert(bias_invert)` -> `None` — Set Low-Pass Filter envelope bias inversion
  - `set_filter_envelope_depth(depth)` -> `None` — Set Low-Pass Filter envelope depth
  - `set_filter_envelope_invert(invert)` -> `None` — Set Low-Pass Filter envelope inversion
  - `set_filter_envelope_release_time(release_time_msec)` -> `None` — Set Low-Pass Filter envelope release time (msec)
  - `set_filter_envelope_sustain_gain(sustain_gain)` -> `None` — Set Low-Pass Filter envelope sustain gain
  - `set_filter_envelopen_decay_time(decay_time_msec)` -> `None` — Set Low-Pass Filter envelope decay time (msec)
  - `set_frequency(frequency_hz)` -> `None` — Sets the oscillatorâs frequency
  - `set_frequency_pitch_bend(frequency_offset_cents)` -> `None` — Set a frequency offset in cents (for pitch modulation such as the Pitch Bend Wheel)
  - `set_frequency_with_midi_note(midi_note)` -> `None` — Set the oscillatorâs frequency via midi note number
  - `set_low_pass_filter_resonance(new_q)` -> `None` — Set the Cut-off frequency of the low-pass filter
  - `set_pos_lfo_depth(lfo_depth)` -> `None`
  - `set_pos_lfo_frequency(lfo_frequency)` -> `None` — Set frequency of LFO controlling Table Position (in Hz)
  - `set_pos_lfo_type(lfo_type)` -> `None` — Set the shape of the Lfo controlling the position
  - `set_position_envelope_attack_time(attack_time_msec)` -> `None` — Set Position envelope attack time (msec)
  - `set_position_envelope_bias_depth(depth)` -> `None` — Set Position envelope bias depth
  - `set_position_envelope_bias_invert(bias_invert)` -> `None` — Set Position envelope bias inversion
  - `set_position_envelope_decay_time(decay_time_msec)` -> `None` — Set Position envelope decay time (msec)
  - `set_position_envelope_depth(depth)` -> `None` — Set Position envelope envelope depth
  - `set_position_envelope_invert(invert)` -> `None` — Set Position envelope envelope inversion
  - `set_position_envelope_release_time(release_time_msec)` -> `None` — Set Position envelope release time (msec)
  - `set_position_envelope_sustain_gain(sustain_gain)` -> `None` — Set Position envelope sustain gain
  - `set_sustain_pedal_state(sustain_pedal_state)` -> `None` — Inform the synth if the sustain pedal is pressed or not
  - `set_wave_table_position(position)` -> `None` — Sets the wavetable position. Expects a percentage between 0.0 and 1.0

**Properties** (2):
  - `on_num_tables_changed`: `NumTablesChanged` — [Read-Write] Curve array altered (NumTablesChanged)
  - `on_table_altered`: `OnTableAltered` — [Read-Write] Wave Table curve was edited (OnTableAltered)

### `unreal.SynthComponentToneGenerator`
Inherits: `SynthComponent` | Header: `SynthComponentToneGenerator.h`

Synth Component Tone Generator

**Methods** (2):
  - `set_frequency(frequency)` -> `None` — Sets the frequency of the tone generator
  - `set_volume(volume)` -> `None` — Sets the volume of the tone generator

**Properties** (5):
  - `attenuation_db_at_max_range`: `float` — [Read-Write] An attenuation, in decibels, to apply to the sound at max range. (float)
  - `distance_attenuation_curve`: `RuntimeFloatCurve` — [Read-Write] A distance attenuation curve to use to attenuate the audio. (RuntimeFloatCurve)
  - `distance_range`: `Vector2D` — [Read-Write] A distance range over which to apply distance attenuation using the supplied curve. (Ve...
  - `frequency`: `float` [Read-Only] — [Read-Only] The frequency (in hz) of the tone generator. (float)
  - `volume`: `float` [Read-Only] — [Read-Only] The linear volume of the tone generator. (float)

### `unreal.SynthesisUtilitiesBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SynthesisBlueprintUtilities.h`

Synthesis Utilities Blueprint Function Library A library of synthesis related functions for use in Blueprints

**Methods** (2):
  - `get_linear_frequency(log_frequency_value, domain_min, domain_max, range_min, range_max)` -> `float` [classmethod] — Returns the log frequency of the input value. Maps linear domain and range values to log output (good for linear slider ...
  - `get_log_frequency(linear_value, domain_min, domain_max, range_min, range_max)` -> `float` [classmethod] — Returns the log frequency of the input value. Maps linear domain and range values to log output (good for linear slider ...

### `unreal.SynthKnob`
Inherits: `Widget` | Header: `SynthKnob.h`

A simple widget that shows a sliding bar with a handle that allows you to control the value between 0..1.

**Methods** (4):
  - `get_value()` -> `float` — Gets the current value of the slider.
  - `set_locked(value)` -> `None` — Sets the handle to be interactive or fixed
  - `set_step_size(value)` -> `None` — Sets the amount to adjust the value by, when using a controller or keyboard
  - `set_value(value)` -> `None` — Sets the current value of the slider.

**Properties** (14):
  - `is_focusable`: `bool` [Read-Only] — [Read-Only] Should the slider be focusable? (bool)
  - `locked`: `bool` [Read-Only] — [Read-Only] Whether the handle is interactive or fixed. (bool)
  - `mouse_fine_tune_speed`: `float` [Read-Only] — [Read-Only] The speed of the mouse knob control when fine-tuning the knob (float)
  - `mouse_speed`: `float` [Read-Only] — [Read-Only] The speed of the mouse knob control (float)
  - `on_controller_capture_begin`: `OnControllerCaptureBeginEvent` — [Read-Write] Invoked when the controller capture begins. (OnControllerCaptureBeginEvent)
  - `on_controller_capture_end`: `OnControllerCaptureEndEvent` — [Read-Write] Invoked when the controller capture ends. (OnControllerCaptureEndEvent)
  - `on_mouse_capture_begin`: `OnMouseCaptureBeginEvent` — [Read-Write] Invoked when the mouse is pressed and a capture begins. (OnMouseCaptureBeginEvent)
  - `on_mouse_capture_end`: `OnMouseCaptureEndEvent` — [Read-Write] Invoked when the mouse is released and a capture ends. (OnMouseCaptureEndEvent)
  - `on_value_changed`: `OnFloatValueChangedEvent` — [Read-Write] Called when the value is changed by slider or typing. (OnFloatValueChangedEvent)
  - `parameter_name`: `Text` [Read-Only] — [Read-Only] The name of the pararameter. Will show when knob turns. (Text)
  - `parameter_units`: `Text` [Read-Only] — [Read-Only] The parameter units (e.g. hz). Will append to synth tooltip info. (Text)
  - `show_tooltip_info`: `bool` [Read-Only] — [Read-Only] Enable tool tip window to show parameter information while knob turns (bool)
  - `step_size`: `float` [Read-Only] — [Read-Only] The amount to adjust the value by, when using a controller or keyboard (float)
  - `widget_style`: `SynthKnobStyle` — [Read-Write] The synth knob style (SynthKnobStyle)

### `unreal.SynthSamplePlayer`
Inherits: `SynthComponent` | Header: `SynthComponentWaveTable.h`

Synth Sample Player

**Methods** (9):
  - `get_current_playback_progress_percent()` -> `float` — Get Current Playback Progress Percent
  - `get_current_playback_progress_time()` -> `float` — Get Current Playback Progress Time
  - `get_sample_duration()` -> `float` — Get Sample Duration
  - `is_loaded()` -> `bool` — Is Loaded
  - `seek_to_time(time_sec, seek_type, wrap = True)` -> `None` — Seek to Time
  - `set_pitch(pitch, time_sec)` -> `None` — Set Pitch
  - `set_scrub_mode(scrub_mode)` -> `None` — Set Scrub Mode
  - `set_scrub_time_width(scrub_time_width_sec)` -> `None` — Set Scrub Time Width
  - `set_sound_wave(sound_wave)` -> `None` — This will override the current sound wave if one is set, stop audio, and reload the new sound wave

**Properties** (3):
  - `on_sample_loaded`: `OnSampleLoaded` — [Read-Write] (OnSampleLoaded)
  - `on_sample_playback_progress`: `OnSamplePlaybackProgress` — [Read-Write] (OnSamplePlaybackProgress)
  - `sound_wave`: `SoundWave` — [Read-Write] (SoundWave)

### `unreal.CurveInterpolationType`
Inherits: `EnumBase` | Header: `SynthComponentMonoWaveTable.h`

Curve Interpolation Type

**Properties** (3):
  - `AUTOINTERP`: `CurveInterpolationType = Ellipsis` — 0
  - `CONSTANT`: `CurveInterpolationType = Ellipsis` — 2
  - `LINEAR`: `CurveInterpolationType = Ellipsis` — 1

### `unreal.EnvelopeFollowerPeakMode`
Inherits: `EnumBase` | Header: `SourceEffectEnvelopeFollower.h`

EEnvelope Follower Peak Mode

**Properties** (3):
  - `MEAN_SQUARED`: `EnvelopeFollowerPeakMode = Ellipsis` — 0
  - `PEAK`: `EnvelopeFollowerPeakMode = Ellipsis` — 2
  - `ROOT_MEAN_SQUARED`: `EnvelopeFollowerPeakMode = Ellipsis` — 1

### `unreal.GranularSynthEnvelopeType`
Inherits: `EnumBase` | Header: `SynthComponentGranulator.h`

EGranular Synth Envelope Type

**Properties** (14):
  - `BLACKMAN`: `GranularSynthEnvelopeType = Ellipsis` — 12
  - `BLACKMAN_HARRIS`: `GranularSynthEnvelopeType = Ellipsis` — 13
  - `COSINE`: `GranularSynthEnvelopeType = Ellipsis` — 9
  - `COSINE_SQUARED`: `GranularSynthEnvelopeType = Ellipsis` — 10
  - `DOWNWARD_TRIANGLE`: `GranularSynthEnvelopeType = Ellipsis` — 2
  - `EXPONENTIAL_DECAY`: `GranularSynthEnvelopeType = Ellipsis` — 4
  - `EXPONENTIAL_INCREASE`: `GranularSynthEnvelopeType = Ellipsis` — 5
  - `GAUSSIAN`: `GranularSynthEnvelopeType = Ellipsis` — 6
  - `HANNING`: `GranularSynthEnvelopeType = Ellipsis` — 7
  - `LANCZOS`: `GranularSynthEnvelopeType = Ellipsis` — 8
  - `RECTANGULAR`: `GranularSynthEnvelopeType = Ellipsis` — 0
  - `TRIANGLE`: `GranularSynthEnvelopeType = Ellipsis` — 1
  - `UPWARD_TRIANGLE`: `GranularSynthEnvelopeType = Ellipsis` — 3
  - `WELCH`: `GranularSynthEnvelopeType = Ellipsis` — 11

### `unreal.GranularSynthSeekType`
Inherits: `EnumBase` | Header: `SynthComponentGranulator.h`

EGranular Synth Seek Type

**Properties** (2):
  - `FROM_BEGINNING`: `GranularSynthSeekType = Ellipsis` — 0
  - `FROM_CURRENT_POSITION`: `GranularSynthSeekType = Ellipsis` — 1

### `unreal.PhaserLFOType`
Inherits: `EnumBase` | Header: `SourceEffectPhaser.h`

EPhaser LFOType

**Properties** (7):
  - `DOWN_SAW`: `PhaserLFOType = Ellipsis` — 2
  - `EXPONENTIAL`: `PhaserLFOType = Ellipsis` — 5
  - `RANDOM_SAMPLE_HOLD`: `PhaserLFOType = Ellipsis` — 6
  - `SINE`: `PhaserLFOType = Ellipsis` — 0
  - `SQUARE`: `PhaserLFOType = Ellipsis` — 3
  - `TRIANGLE`: `PhaserLFOType = Ellipsis` — 4
  - `UP_SAW`: `PhaserLFOType = Ellipsis` — 1

### `unreal.RingModulatorTypeSourceEffect`
Inherits: `EnumBase` | Header: `SourceEffectRingModulation.h`

ERing Modulator Type Source Effect

**Properties** (4):
  - `SAW`: `RingModulatorTypeSourceEffect = Ellipsis` — 1
  - `SINE`: `RingModulatorTypeSourceEffect = Ellipsis` — 0
  - `SQUARE`: `RingModulatorTypeSourceEffect = Ellipsis` — 3
  - `TRIANGLE`: `RingModulatorTypeSourceEffect = Ellipsis` — 2

### `unreal.SamplePlayerSeekType`
Inherits: `EnumBase` | Header: `SynthComponentWaveTable.h`

ESample Player Seek Type

**Properties** (3):
  - `FROM_BEGINNING`: `SamplePlayerSeekType = Ellipsis` — 0
  - `FROM_CURRENT_POSITION`: `SamplePlayerSeekType = Ellipsis` — 1
  - `FROM_END`: `SamplePlayerSeekType = Ellipsis` — 2

### `unreal.SourceEffectDynamicsPeakMode`
Inherits: `EnumBase` | Header: `SourceEffectDynamicsProcessor.h`

ESource Effect Dynamics Peak Mode

**Properties** (3):
  - `MEAN_SQUARED`: `SourceEffectDynamicsPeakMode = Ellipsis` — 0
  - `PEAK`: `SourceEffectDynamicsPeakMode = Ellipsis` — 2
  - `ROOT_MEAN_SQUARED`: `SourceEffectDynamicsPeakMode = Ellipsis` — 1

### `unreal.SourceEffectDynamicsProcessorType`
Inherits: `EnumBase` | Header: `SourceEffectDynamicsProcessor.h`

ESource Effect Dynamics Processor Type

**Properties** (5):
  - `COMPRESSOR`: `SourceEffectDynamicsProcessorType = Ellipsis` — 0
  - `EXPANDER`: `SourceEffectDynamicsProcessorType = Ellipsis` — 2
  - `GATE`: `SourceEffectDynamicsProcessorType = Ellipsis` — 3
  - `LIMITER`: `SourceEffectDynamicsProcessorType = Ellipsis` — 1
  - `UPWARDS_COMPRESSOR`: `SourceEffectDynamicsProcessorType = Ellipsis` — 4

### `unreal.SourceEffectFilterCircuit`
Inherits: `EnumBase` | Header: `SourceEffectFilter.h`

ESource Effect Filter Circuit

**Properties** (3):
  - `LADDER`: `SourceEffectFilterCircuit = Ellipsis` — 2
  - `ONE_POLE`: `SourceEffectFilterCircuit = Ellipsis` — 0
  - `STATE_VARIABLE`: `SourceEffectFilterCircuit = Ellipsis` — 1

### `unreal.SourceEffectFilterParam`
Inherits: `EnumBase` | Header: `SourceEffectFilter.h`

ESource Effect Filter Param

**Properties** (2):
  - `FILTER_FREQUENCY`: `SourceEffectFilterParam = Ellipsis` — 0
  - `FILTER_RESONANCE`: `SourceEffectFilterParam = Ellipsis` — 1

### `unreal.SourceEffectFilterType`
Inherits: `EnumBase` | Header: `SourceEffectFilter.h`

ESource Effect Filter Type

**Properties** (4):
  - `BAND_PASS`: `SourceEffectFilterType = Ellipsis` — 2
  - `BAND_STOP`: `SourceEffectFilterType = Ellipsis` — 3
  - `HIGH_PASS`: `SourceEffectFilterType = Ellipsis` — 1
  - `LOW_PASS`: `SourceEffectFilterType = Ellipsis` — 0

### `unreal.SourceEffectMotionFilterCircuit`
Inherits: `EnumBase` | Header: `SourceEffectMotionFilter.h`

ESource Effect Motion Filter Circuit

**Properties** (3):
  - `LADDER`: `SourceEffectMotionFilterCircuit = Ellipsis` — 2
  - `ONE_POLE`: `SourceEffectMotionFilterCircuit = Ellipsis` — 0
  - `STATE_VARIABLE`: `SourceEffectMotionFilterCircuit = Ellipsis` — 1

### `unreal.SourceEffectMotionFilterModDestination`
Inherits: `EnumBase` | Header: `SourceEffectMotionFilter.h`

ESource Effect Motion Filter Mod Destination

**Properties** (7):
  - `FILTER_A_CUTOFF_FREQUENCY`: `SourceEffectMotionFilterModDestination = Ellipsis` — Filter input frequencies range between 20.0f and 15000.0f. 0
  - `FILTER_A_OUTPUT_VOLUME_DB`: `SourceEffectMotionFilterModDestination = Ellipsis` — Filter output dB range between 10.0f and -96.0f. Final Filter output is clamped to +6 dB, use positi...
  - `FILTER_A_RESONANCE`: `SourceEffectMotionFilterModDestination = Ellipsis` — Filter input resonances range between 0.5f and 10.0f. 1
  - `FILTER_B_CUTOFF_FREQUENCY`: `SourceEffectMotionFilterModDestination = Ellipsis` — Filter input frequencies range between 20.0f and 15000.0f. 3
  - `FILTER_B_OUTPUT_VOLUME_DB`: `SourceEffectMotionFilterModDestination = Ellipsis` — Filter output dB range between 10.0f and -96.0f. Final Filter output is clamped to +6 dB, use positi...
  - `FILTER_B_RESONANCE`: `SourceEffectMotionFilterModDestination = Ellipsis` — Filter input resonances range between 0.5f and 10.0f. 4
  - `FILTER_MIX`: `SourceEffectMotionFilterModDestination = Ellipsis` — Filter Mix values range from -1.0f (Filter A) and 1.0f (Filter B). 6

### `unreal.SourceEffectMotionFilterModSource`
Inherits: `EnumBase` | Header: `SourceEffectMotionFilter.h`

ESource Effect Motion Filter Mod Source

**Properties** (5):
  - `DISTANCE_FROM_LISTENER`: `SourceEffectMotionFilterModSource = Ellipsis` — Uunits between Listener and Sound Source. 0
  - `SPEED_OF_ANGLE_DELTA`: `SourceEffectMotionFilterModSource = Ellipsis` — Degrees per second change in Angle of Source from Listener. 4
  - `SPEED_OF_LISTENER`: `SourceEffectMotionFilterModSource = Ellipsis` — Uunits per second change in world location of Listener. 3
  - `SPEED_OF_SOURCE_EMITTER`: `SourceEffectMotionFilterModSource = Ellipsis` — Uunits per second change in world location of Sound Source. 2
  - `SPEED_RELATIVE_TO_LISTENER`: `SourceEffectMotionFilterModSource = Ellipsis` — Uunits per second change in distance between Listener and Sound Source. 1

### `unreal.SourceEffectMotionFilterTopology`
Inherits: `EnumBase` | Header: `SourceEffectMotionFilter.h`

ESource Effect Motion Filter Topology

**Properties** (2):
  - `PARALLEL_MODE`: `SourceEffectMotionFilterTopology = Ellipsis` — 1
  - `SERIAL_MODE`: `SourceEffectMotionFilterTopology = Ellipsis` — 0

### `unreal.SourceEffectMotionFilterType`
Inherits: `EnumBase` | Header: `SourceEffectMotionFilter.h`

ESource Effect Motion Filter Type

**Properties** (4):
  - `BAND_PASS`: `SourceEffectMotionFilterType = Ellipsis` — 2
  - `BAND_STOP`: `SourceEffectMotionFilterType = Ellipsis` — 3
  - `HIGH_PASS`: `SourceEffectMotionFilterType = Ellipsis` — 1
  - `LOW_PASS`: `SourceEffectMotionFilterType = Ellipsis` — 0

### `unreal.StereoChannelMode`
Inherits: `EnumBase` | Header: `SourceEffectMidSideSpreader.h`

Stereo channel mode

**Properties** (2):
  - `LEFT_RIGHT`: `StereoChannelMode = Ellipsis` — 1
  - `MID_SIDE`: `StereoChannelMode = Ellipsis` — 0

### `unreal.StereoDelayFiltertype`
Inherits: `EnumBase` | Header: `SourceEffectStereoDelay.h`

Stereo delay filter types

**Properties** (4):
  - `BANDPASS`: `StereoDelayFiltertype = Ellipsis` — 2
  - `HIGHPASS`: `StereoDelayFiltertype = Ellipsis` — 1
  - `LOWPASS`: `StereoDelayFiltertype = Ellipsis` — 0
  - `NOTCH`: `StereoDelayFiltertype = Ellipsis` — 3

### `unreal.StereoDelaySourceEffect`
Inherits: `EnumBase` | Header: `SourceEffectStereoDelay.h`

EStereo Delay Source Effect

**Properties** (3):
  - `CROSS`: `StereoDelaySourceEffect = Ellipsis` — Left input mixes right delay line output and feeds to right output.
Right input mixes with left dela...
  - `NORMAL`: `StereoDelaySourceEffect = Ellipsis` — Left input mixes with left delay line output and feeds to left output.
Right input mixes with right ...
  - `PING_PONG`: `StereoDelaySourceEffect = Ellipsis` — Left input mixes with left delay line output and feeds to right output.
Right input mixes with right...

### `unreal.SubmixEffectConvolutionReverbBlockSize`
Inherits: `EnumBase` | Header: `EffectConvolutionReverb.h`

Block size of convolution reverb algorithm.

**Properties** (3):
  - `BLOCK_SIZE1024`: `SubmixEffectConvolutionReverbBlockSize = Ellipsis` — 1024 audio frames per a block. 2
  - `BLOCK_SIZE256`: `SubmixEffectConvolutionReverbBlockSize = Ellipsis` — 256 audio frames per a block. 0
  - `BLOCK_SIZE512`: `SubmixEffectConvolutionReverbBlockSize = Ellipsis` — 512 audio frames per a block. 1

### `unreal.SubmixFilterAlgorithm`
Inherits: `EnumBase` | Header: `SubmixEffectFilter.h`

ESubmix Filter Algorithm

**Properties** (3):
  - `LADDER`: `SubmixFilterAlgorithm = Ellipsis` — 2
  - `ONE_POLE`: `SubmixFilterAlgorithm = Ellipsis` — 0
  - `STATE_VARIABLE`: `SubmixFilterAlgorithm = Ellipsis` — 1

### `unreal.SubmixFilterType`
Inherits: `EnumBase` | Header: `SubmixEffectFilter.h`

ESubmix Filter Type

**Properties** (4):
  - `BAND_PASS`: `SubmixFilterType = Ellipsis` — 2
  - `BAND_STOP`: `SubmixFilterType = Ellipsis` — 3
  - `HIGH_PASS`: `SubmixFilterType = Ellipsis` — 1
  - `LOW_PASS`: `SubmixFilterType = Ellipsis` — 0

### `unreal.Synth1OscType`
Inherits: `EnumBase` | Header: `EpicSynth1Types.h`

ESynth 1Osc Type

**Properties** (5):
  - `NOISE`: `Synth1OscType = Ellipsis` — 4
  - `SAW`: `Synth1OscType = Ellipsis` — 1
  - `SINE`: `Synth1OscType = Ellipsis` — 0
  - `SQUARE`: `Synth1OscType = Ellipsis` — 3
  - `TRIANGLE`: `Synth1OscType = Ellipsis` — 2

### `unreal.Synth1PatchDestination`
Inherits: `EnumBase` | Header: `EpicSynth1Types.h`

ESynth 1Patch Destination

**Properties** (14):
  - `FILTER_FREQUENCY`: `Synth1PatchDestination = Ellipsis` — 6
  - `FILTER_Q`: `Synth1PatchDestination = Ellipsis` — 7
  - `GAIN`: `Synth1PatchDestination = Ellipsis` — 8
  - `LFO1_FREQUENCY`: `Synth1PatchDestination = Ellipsis` — 10
  - `LFO1_GAIN`: `Synth1PatchDestination = Ellipsis` — 11
  - `LFO2_FREQUENCY`: `Synth1PatchDestination = Ellipsis` — 12
  - `LFO2_GAIN`: `Synth1PatchDestination = Ellipsis` — 13
  - `OSC1_FREQUENCY`: `Synth1PatchDestination = Ellipsis` — 1
  - `OSC1_GAIN`: `Synth1PatchDestination = Ellipsis` — 0
  - `OSC1_PULSEWIDTH`: `Synth1PatchDestination = Ellipsis` — 2
  - `OSC2_FREQUENCY`: `Synth1PatchDestination = Ellipsis` — 4
  - `OSC2_GAIN`: `Synth1PatchDestination = Ellipsis` — 3
  - `OSC2_PULSEWIDTH`: `Synth1PatchDestination = Ellipsis` — 5
  - `PAN`: `Synth1PatchDestination = Ellipsis` — 9

### `unreal.Synth1PatchSource`
Inherits: `EnumBase` | Header: `EpicSynth1Types.h`

ESynth 1Patch Source

**Properties** (4):
  - `BIAS_ENVELOPE`: `Synth1PatchSource = Ellipsis` — 3
  - `ENVELOPE`: `Synth1PatchSource = Ellipsis` — 2
  - `LFO1`: `Synth1PatchSource = Ellipsis` — 0
  - `LFO2`: `Synth1PatchSource = Ellipsis` — 1

### `unreal.SynthFilterAlgorithm`
Inherits: `EnumBase` | Header: `EpicSynth1Types.h`

ESynth Filter Algorithm

**Properties** (3):
  - `LADDER`: `SynthFilterAlgorithm = Ellipsis` — 2
  - `ONE_POLE`: `SynthFilterAlgorithm = Ellipsis` — 0
  - `STATE_VARIABLE`: `SynthFilterAlgorithm = Ellipsis` — 1

### `unreal.SynthFilterType`
Inherits: `EnumBase` | Header: `EpicSynth1Types.h`

ESynth Filter Type

**Properties** (4):
  - `BAND_PASS`: `SynthFilterType = Ellipsis` — 2
  - `BAND_STOP`: `SynthFilterType = Ellipsis` — 3
  - `HIGH_PASS`: `SynthFilterType = Ellipsis` — 1
  - `LOW_PASS`: `SynthFilterType = Ellipsis` — 0

### `unreal.SynthKnobSize`
Inherits: `EnumBase` | Header: `SynthKnobStyle.h`

ESynth Knob Size

**Properties** (2):
  - `LARGE`: `SynthKnobSize = Ellipsis` — 1
  - `MEDIUM`: `SynthKnobSize = Ellipsis` — 0

### `unreal.SynthLFOMode`
Inherits: `EnumBase` | Header: `EpicSynth1Types.h`

ESynth LFOMode

**Properties** (3):
  - `FREE`: `SynthLFOMode = Ellipsis` — 2
  - `ONE_SHOT`: `SynthLFOMode = Ellipsis` — 1
  - `SYNC`: `SynthLFOMode = Ellipsis` — 0

### `unreal.SynthLFOPatchType`
Inherits: `EnumBase` | Header: `EpicSynth1Types.h`

ESynth LFOPatch Type

**Properties** (9):
  - `PATCH_LFO1_TO_LFO2_FREQUENCY`: `SynthLFOPatchType = Ellipsis` — 7
  - `PATCH_LFO1_TO_LFO2_GAIN`: `SynthLFOPatchType = Ellipsis` — 8
  - `PATCH_TO_FILTER_FREQ`: `SynthLFOPatchType = Ellipsis` — 3
  - `PATCH_TO_FILTER_Q`: `SynthLFOPatchType = Ellipsis` — 4
  - `PATCH_TO_GAIN`: `SynthLFOPatchType = Ellipsis` — 1
  - `PATCH_TO_NONE`: `SynthLFOPatchType = Ellipsis` — 0
  - `PATCH_TO_OSC_FREQ`: `SynthLFOPatchType = Ellipsis` — 2
  - `PATCH_TO_OSC_PAN`: `SynthLFOPatchType = Ellipsis` — 6
  - `PATCH_TO_OSC_PULSE_WIDTH`: `SynthLFOPatchType = Ellipsis` — 5

### `unreal.SynthLFOType`
Inherits: `EnumBase` | Header: `EpicSynth1Types.h`

ESynth LFOType

**Properties** (7):
  - `DOWN_SAW`: `SynthLFOType = Ellipsis` — 2
  - `EXPONENTIAL`: `SynthLFOType = Ellipsis` — 5
  - `RANDOM_SAMPLE_HOLD`: `SynthLFOType = Ellipsis` — 6
  - `SINE`: `SynthLFOType = Ellipsis` — 0
  - `SQUARE`: `SynthLFOType = Ellipsis` — 3
  - `TRIANGLE`: `SynthLFOType = Ellipsis` — 4
  - `UP_SAW`: `SynthLFOType = Ellipsis` — 1

### `unreal.SynthModEnvBiasPatch`
Inherits: `EnumBase` | Header: `EpicSynth1Types.h`

ESynth Mod Env Bias Patch

**Properties** (8):
  - `PATCH_TO_FILTER_FREQ`: `SynthModEnvBiasPatch = Ellipsis` — 2
  - `PATCH_TO_FILTER_Q`: `SynthModEnvBiasPatch = Ellipsis` — 3
  - `PATCH_TO_LFO1_FREQ`: `SynthModEnvBiasPatch = Ellipsis` — 6
  - `PATCH_TO_LFO1_GAIN`: `SynthModEnvBiasPatch = Ellipsis` — 4
  - `PATCH_TO_LFO2_FREQ`: `SynthModEnvBiasPatch = Ellipsis` — 7
  - `PATCH_TO_LFO2_GAIN`: `SynthModEnvBiasPatch = Ellipsis` — 5
  - `PATCH_TO_NONE`: `SynthModEnvBiasPatch = Ellipsis` — 0
  - `PATCH_TO_OSC_FREQ`: `SynthModEnvBiasPatch = Ellipsis` — 1

### `unreal.SynthModEnvPatch`
Inherits: `EnumBase` | Header: `EpicSynth1Types.h`

ESynth Mod Env Patch

**Properties** (8):
  - `PATCH_TO_FILTER_FREQ`: `SynthModEnvPatch = Ellipsis` — 2
  - `PATCH_TO_FILTER_Q`: `SynthModEnvPatch = Ellipsis` — 3
  - `PATCH_TO_LFO1_FREQ`: `SynthModEnvPatch = Ellipsis` — 6
  - `PATCH_TO_LFO1_GAIN`: `SynthModEnvPatch = Ellipsis` — 4
  - `PATCH_TO_LFO2_FREQ`: `SynthModEnvPatch = Ellipsis` — 7
  - `PATCH_TO_LFO2_GAIN`: `SynthModEnvPatch = Ellipsis` — 5
  - `PATCH_TO_NONE`: `SynthModEnvPatch = Ellipsis` — 0
  - `PATCH_TO_OSC_FREQ`: `SynthModEnvPatch = Ellipsis` — 1

### `unreal.SynthSlateColorStyle`
Inherits: `EnumBase` | Header: `SynthSlateStyle.h`

ESynth Slate Color Style

**Properties** (2):
  - `DARK`: `SynthSlateColorStyle = Ellipsis` — 1
  - `LIGHT`: `SynthSlateColorStyle = Ellipsis` — 0

### `unreal.SynthSlateSizeType`
Inherits: `EnumBase` | Header: `SynthSlateStyle.h`

ESynth Slate Size Type

**Properties** (3):
  - `LARGE`: `SynthSlateSizeType = Ellipsis` — 2
  - `MEDIUM`: `SynthSlateSizeType = Ellipsis` — 1
  - `SMALL`: `SynthSlateSizeType = Ellipsis` — 0

### `unreal.SynthStereoDelayMode`
Inherits: `EnumBase` | Header: `EpicSynth1Types.h`

ESynth Stereo Delay Mode

**Properties** (3):
  - `CROSS`: `SynthStereoDelayMode = Ellipsis` — 1
  - `NORMAL`: `SynthStereoDelayMode = Ellipsis` — 0
  - `PING_PONG`: `SynthStereoDelayMode = Ellipsis` — 2

### `unreal.TapLineMode`
Inherits: `EnumBase` | Header: `SubmixEffectTapDelay.h`

ETap Line Mode

**Properties** (3):
  - `DISABLED`: `TapLineMode = Ellipsis` — Disables the tap audio and performs a fadeout 2
  - `PANNING`: `TapLineMode = Ellipsis` — Allow tap to pan between channels based on azimuth angle 1
  - `SEND_TO_CHANNEL`: `TapLineMode = Ellipsis` — Send tap audio output to a channel directly 0

### `unreal.NumTablesChanged`
Inherits: `MulticastDelegateBase` | Header: `SynthComponentMonoWaveTable.h`

Num Tables Changed Delegate Signature

### `unreal.OnControllerCaptureBeginEventSynth2D`
Inherits: `MulticastDelegateBase` | Header: `Synth2DSlider.h`

On Controller Capture Begin Event Synth 2D Delegate Signature

### `unreal.OnControllerCaptureEndEventSynth2D`
Inherits: `MulticastDelegateBase` | Header: `Synth2DSlider.h`

On Controller Capture End Event Synth 2D Delegate Signature

### `unreal.OnEnvelopeFollowerUpdate`
Inherits: `MulticastDelegateBase` | Header: `SourceEffectEnvelopeFollower.h`

On Envelope Follower Update Delegate Signature

### `unreal.OnFloatValueChangedEventSynth2D`
Inherits: `MulticastDelegateBase` | Header: `Synth2DSlider.h`

On Float Value Changed Event Synth 2D Delegate Signature

### `unreal.OnMouseCaptureBeginEventSynth2D`
Inherits: `MulticastDelegateBase` | Header: `Synth2DSlider.h`

On Mouse Capture Begin Event Synth 2D Delegate Signature

### `unreal.OnMouseCaptureEndEventSynth2D`
Inherits: `MulticastDelegateBase` | Header: `Synth2DSlider.h`

On Mouse Capture End Event Synth 2D Delegate Signature

### `unreal.OnSampleLoaded`
Inherits: `MulticastDelegateBase` | Header: `SynthComponentWaveTable.h`

Called when a sample has finished loading into the sample player

### `unreal.OnSamplePlaybackProgress`
Inherits: `MulticastDelegateBase` | Header: `SynthComponentWaveTable.h`

Called while a sample player is playing back. Indicates the playhead progress in percent and as absolute time value (within the file).

### `unreal.OnTableAltered`
Inherits: `MulticastDelegateBase` | Header: `SynthComponentMonoWaveTable.h`

On Table Altered Delegate Signature
