# UE Python API — MotoSynth Module

**4 types** from the `MotoSynth` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MotoSynthRuntimeSettings`, `MotoSynthPreset`, `MotoSynthSource`, `SynthComponentMoto`

---

## Classes

### `unreal.MotoSynthRuntimeSettings`
Inherits: `StructBase` | Header: `MotoSynthPreset.h`

Moto Synth Runtime Settings

**Properties** (33):
  - `grain_crossfade_samples_for_constant_rp_ms`: `int` — [Read-Write] Number of samples to cross fade grains when on a constant-RPM state. More crossfaded sa...
  - `grain_table_random_offset_for_constant_rp_ms`: `int` — [Read-Write] Random grain table offset for cases where RPM is constant. Allows random shuffling of g...
  - `granular_engine_enabled`: `bool` — [Read-Write] If the granular engine is enabled (bool)
  - `granular_engine_pitch_scale`: `float` — [Read-Write] The pitch scale of the granular engine (float)
  - `granular_engine_volume`: `float` — [Read-Write] The volume of the granular engine (float)
  - `noise_attack_curve_range`: `Vector2D` — [Read-Write] Noise envelope attack curve.  1.0 = linear growth, < 1.0 logorithmic growth, > 1.0 expo...
  - `noise_attack_time_msec_range`: `Vector2D` — [Read-Write] Noise envelope attack time in milliseconds between min/max RPM (Vector2D)
  - `noise_decay_curve_range`: `Vector2D` — [Read-Write] Noise envelope attack curve between min/max RPM.  1.0 = linear growth, < 1.0 logorithmi...
  - `noise_decay_time_msec_range`: `Vector2D` — [Read-Write] Noise envelope attack time in milliseconds between min/max RPM (Vector2D)
  - `noise_enabled`: `bool` — [Read-Write] If the noise generator enabled (bool)
  - `noise_envelope_enabled`: `bool` — [Read-Write] If the noise generator has the envelope enabled (bool)
  - `noise_lpf_range`: `Vector2D` — [Read-Write] The filter frequency of the noise generator between min/max RPM (Vector2D)
  - `noise_volume_range`: `Vector2D` — [Read-Write] The volume of the noise source (Vector2D)
  - `num_grain_table_entries_per_grain`: `int` — [Read-Write] How many grain-table entries to use per runtime grain (int32)
  - `num_samples_to_crossfade_between_grains`: `int` — [Read-Write] The volume of the granular engine (int32)
  - `stereo_delay_msec`: `float` — [Read-Write] If the stereo widener is enabled (float)
  - `stereo_feedback`: `float` — [Read-Write] Amount of feedback for stereo widener (float)
  - `stereo_widener_delay_ratio`: `float` — [Read-Write] Delay ratio of left/right channels for stereo widener effect (float)
  - `stereo_widener_dry_level`: `float` — [Read-Write] Dry level of stereo delay used for stereo widener (float)
  - `stereo_widener_enabled`: `bool` — [Read-Write] If the stereo widener is enabled (bool)
  - `stereo_widener_filter_enabled`: `bool` — [Read-Write] Delay ratio of left/right channels for stereo widener effect (bool)
  - `stereo_widener_filter_frequency`: `float` — [Read-Write] Delay ratio of left/right channels for stereo widener effect (float)
  - `stereo_widener_filter_q`: `float` — [Read-Write] Delay ratio of left/right channels for stereo widener effect (float)
  - `stereo_widener_wetlevel`: `float` — [Read-Write] Wet level of stereo delay used for stereo widener (float)
  - `synth_octave_shift`: `int` — [Read-Write] Octave shift of the synth (int32)
  - `synth_tone_attack_curve_range`: `Vector2D` — [Read-Write] Synth tone envelope attack curve.  1.0 = linear growth, < 1.0 logorithmic growth, > 1.0...
  - `synth_tone_attack_time_msec_range`: `Vector2D` — [Read-Write] Synth tone envelope attack time in milliseconds between min/max RPM (Vector2D)
  - `synth_tone_decay_curve_range`: `Vector2D` — [Read-Write] Synth tone envelope decay curve.  1.0 = linear decay, < 1.0 exponential decay, > 1.0 lo...
  - `synth_tone_decay_time_msec_range`: `Vector2D` — [Read-Write] Synth tone decay time in milliseconds (Vector2D)
  - `synth_tone_enabled`: `bool` — [Read-Write] If the synth tone is enabled (bool)
  - `synth_tone_envelope_enabled`: `bool` — [Read-Write] Enable the synth tone envelope generator (bool)
  - `synth_tone_filter_frequency_range`: `Vector2D` — [Read-Write] The filter frequency of the synth tone between min/max RPM (Vector2D)
  - `synth_tone_volume_range`: `Vector2D` — [Read-Write] The volume of the synth tone   between min and max RPM (Vector2D)

### `unreal.MotoSynthPreset`
Inherits: `Object` | Header: `MotoSynthPreset.h`

Asset used to store moto synth preset data.

**Properties** (1):
  - `settings`: `MotoSynthRuntimeSettings` — [Read-Write] (MotoSynthRuntimeSettings)

### `unreal.MotoSynthSource`
Inherits: `Object` | Header: `MotoSynthSourceAsset.h`

UMotoSynthSource UAsset used to represent Imported MotoSynth Sources

**Properties** (7):
  - `convert_to8_bit`: `bool` — [Read-Write] Whether or not to convert this moto synth source to 8 bit on load to use less memory (b...
  - `down_sample_factor`: `float` — [Read-Write] Amount to scale down the sample rate of the source (float)
  - `dynamics_knee_bandwidth`: `float` — [Read-Write] (float)
  - `dynamics_processor_lookahead`: `float` — [Read-Write] (float)
  - `rpm_curve`: `RuntimeFloatCurve` — [Read-Write] A curve to define the RPM contour from the min and max estimated RPM
Curve values are n...
  - `rpm_synth_volume`: `float` — [Read-Write] Sets the volume of the RPM curve synth for testing RPM curve to source (float)
  - `sound_wave_source`: `SoundWave` — [Read-Write] The source to use for the moto synth source (SoundWave)

### `unreal.SynthComponentMoto`
Inherits: `SynthComponent` | Header: `SynthComponentMoto.h`

Synth Component Moto

**Methods** (4):
  - `get_rpm_range(out_max_rpm=float)` — Retrieves RPM range of the moto synth, taking into account the acceleration and deceleration sources. The min RPM is the...
  - `is_enabled()` -> `bool` — Returns if the moto synth is enabled.
  - `set_rpm(rpm, time_sec)` -> `None` — Sets the RPM of the granular engine directly.
  - `set_settings(settings)` -> `None` — Sets a moto synth settings dynamically.

**Properties** (2):
  - `moto_synth_preset`: `MotoSynthPreset` — [Read-Write] The moto synth preset to use for the moto synth component. (MotoSynthPreset)
  - `rpm`: `float` — [Read-Write] Sets the starting RPM of the engine (float)
