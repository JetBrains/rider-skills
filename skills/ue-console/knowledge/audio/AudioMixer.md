# UE Python API — AudioMixer Module

**36 types** from the `AudioMixer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AudioOutputDeviceInfo`, `SubmixEffectDynamicProcessorFilterSettings`, `SubmixEffectDynamicsProcessorSettings`, `SubmixEffectEQBand`, `SubmixEffectReverbSettings`, `SubmixEffectSubmixEQSettings`, `SwapAudioOutputResult`, `AudioDeviceNotificationSubsystem`, `AudioGenerator`, `AudioMixerLibrary`, `QuartzClockHandle`, `QuartzSubsystem`, `ScrubbedSound`, `SubmixEffectDynamicsProcessorPreset`, `SubmixEffectReverbPreset`, `SubmixEffectSubmixEQPreset`, `SynthComponent`, `SynthSound`, `AudioDeviceChangedRole`, `AudioDeviceChangedState`, ... (36 total)

---

## Classes

### `unreal.AudioOutputDeviceInfo`
Inherits: `StructBase` | Header: `AudioMixerBlueprintLibrary.h`

Platform audio output device info, in a Blueprint-readable format

**Properties** (8):
  - `device_id`: `str` [Read-Only] — [Read-Only] ID of the device. (str)
  - `format`: `AudioMixerStreamDataFormatType` [Read-Only] — [Read-Only] The data format of the audio stream (AudioMixerStreamDataFormatType)
  - `is_current_device`: `bool` [Read-Only] — [Read-Only] Whether or not this device is the device currently in use (bool)
  - `is_system_default`: `bool` [Read-Only] — [Read-Only] Whether or not this device is the system default (bool)
  - `name`: `str` [Read-Only] — [Read-Only] The name of the audio device (str)
  - `num_channels`: `int` [Read-Only] — [Read-Only] The number of channels supported by the audio device (int32)
  - `output_channel_array`: `None` [Read-Only] — [Read-Only] The output channel array of the audio device (Array[AudioMixerChannelType])
  - `sample_rate`: `int` [Read-Only] — [Read-Only] The sample rate of the audio device (int32)

### `unreal.SubmixEffectDynamicProcessorFilterSettings`
Inherits: `StructBase` | Header: `AudioMixerSubmixEffectDynamicsProcessor.h`

Submix Effect Dynamic Processor Filter Settings

**Properties** (3):
  - `cutoff`: `float` — [Read-Write] The cutoff frequency of the HPF applied to key signal (float)
  - `enabled`: `bool` — [Read-Write] Whether or not filter is enabled (bool)
  - `gain_db`: `float` — [Read-Write] The gain of the filter shelf applied to the key signal (float)

### `unreal.SubmixEffectDynamicsProcessorSettings`
Inherits: `StructBase` | Header: `AudioMixerSubmixEffectDynamicsProcessor.h`

Submix dynamics processor settings

**Properties** (20):
  - `analog_mode`: `bool` — [Read-Write] Toggles treating the attack and release envelopes as analog-style vs digital-style (Ana...
  - `attack_time_msec`: `float` — [Read-Write] The amount of time to ramp into any dynamics processing effect (float)
  - `bypass`: `bool` — [Read-Write] Whether or not to bypass effect (bool)
  - `dynamics_processor_type`: `SubmixEffectDynamicsProcessorType` — [Read-Write] Type of processor to apply (SubmixEffectDynamicsProcessorType)
  - `external_audio_bus`: `AudioBus` — [Read-Write] If set, uses output of provided audio bus as modulator of input signal for dynamics pro...
  - `external_submix`: `SoundSubmix` — [Read-Write] If set, uses output of provided submix as modulator of input signal for dynamics proces...
  - `input_gain_db`: `float` — [Read-Write] The input gain of the dynamics processor (float)
  - `key_audition`: `bool` — [Read-Write] Audition the key modulation signal, bypassing enveloping and processing the input signa...
  - `key_gain_db`: `float` — [Read-Write] Gain to apply to key signal if key source not set to default (input). (float)
  - `key_highshelf`: `SubmixEffectDynamicProcessorFilterSettings` — [Read-Write] High Shelf filter settings for key signal (external signal if supplied or input signal ...
  - `key_lowshelf`: `SubmixEffectDynamicProcessorFilterSettings` — [Read-Write] Low Shelf filter settings for key signal (external signal if supplied or input signal i...
  - `key_source`: `SubmixEffectDynamicsKeySource` — [Read-Write] (SubmixEffectDynamicsKeySource)
  - `knee_bandwidth_db`: `float` — [Read-Write] The knee bandwidth of the processor to use (float)
  - `link_mode`: `SubmixEffectDynamicsChannelLinkMode` — [Read-Write] Mode of peak detection if key signal is multi-channel (SubmixEffectDynamicsChannelLinkM...
  - `look_ahead_msec`: `float` — [Read-Write] The amount of time to look ahead of the current audio (Allows for transients to be incl...
  - `output_gain_db`: `float` — [Read-Write] The output gain of the dynamics processor (float)
  - `peak_mode`: `SubmixEffectDynamicsPeakMode` — [Read-Write] Mode of peak detection used on input key signal (SubmixEffectDynamicsPeakMode)
  - `ratio`: `float` — [Read-Write] The dynamics processor ratio used for compression/expansion (float)
  - `release_time_msec`: `float` — [Read-Write] The amount of time to release the dynamics processing effect (float)
  - `threshold_db`: `float` — [Read-Write] The threshold at which to perform a dynamics processing operation (float)

### `unreal.SubmixEffectEQBand`
Inherits: `StructBase` | Header: `AudioMixerSubmixEffectEQ.h`

A multiband EQ submix effect.

**Properties** (4):
  - `bandwidth`: `float` — [Read-Write] The bandwidth, in octaves, of the EQ band (float)
  - `enabled`: `bool` — [Read-Write] Whether or not the EQ band is enabled (bool)
  - `frequency`: `float` — [Read-Write] Cutoff frequency (in hz) of the EQ band (float)
  - `gain_db`: `float` — [Read-Write] The gain in decibels of the EQ band (float)

### `unreal.SubmixEffectReverbSettings`
Inherits: `StructBase` | Header: `AudioMixerSubmixEffectReverb.h`

Submix Effect Reverb Settings

**Properties** (16):
  - `air_absorption_gain_hf`: `float` — [Read-Write] Air Absorption - 0.0 < 0.994 < 1.0 - lower value means more absorption (float)
  - `bypass`: `bool` — [Read-Write] Bypasses reverb (bool)
  - `bypass_early_reflections`: `bool` — [Read-Write] Bypasses early reflections (bool)
  - `bypass_late_reflections`: `bool` — [Read-Write] Bypasses late reflections. (bool)
  - `decay_hf_ratio`: `float` — [Read-Write] Decay High Frequency Ratio - 0.1 < 0.83 < 2.0 - how much quicker or slower the high fre...
  - `decay_time`: `float` — [Read-Write] Decay Time - 0.1 < 1.49 < 20.0 Seconds - larger is more reverb (float)
  - `density`: `float` — [Read-Write] Density - 0.0 < 0.85 < 1.0 - Coloration of the late reverb - lower value is more grainy...
  - `diffusion`: `float` — [Read-Write] Diffusion - 0.0 < 0.85 < 1.0 - Echo density in the reverberation decay - lower is more ...
  - `dry_level`: `float` — [Read-Write] Overall dry level of the reverb effect (float)
  - `gain`: `float` — [Read-Write] Reverb Gain - 0.0 < 0.32 < 1.0 - overall reverb gain - master volume control (float)
  - `gain_hf`: `float` — [Read-Write] Reverb Gain High Frequency - 0.0 < 0.89 < 1.0 - attenuates the high frequency reflected...
  - `late_delay`: `float` — [Read-Write] Late Reverb Delay - 0.0 < 0.011 < 0.1 Seconds - time difference between late reverb and...
  - `late_gain`: `float` — [Read-Write] Late Reverb Gain - 0.0 < 1.26 < 10.0 - gain of the late reverb (float)
  - `reflections_delay`: `float` — [Read-Write] Reflections Delay - 0.0 < 0.007 < 0.3 Seconds - the time between the listener receiving...
  - `reflections_gain`: `float` — [Read-Write] Reflections Gain - 0.0 < 0.05 < 3.16 - controls the amount of initial reflections (floa...
  - `wet_level`: `float` — [Read-Write] Overall wet level of the reverb effect (float)

### `unreal.SubmixEffectSubmixEQSettings`
Inherits: `StructBase` | Header: `AudioMixerSubmixEffectEQ.h`

EQ submix effect

**Properties** (1):
  - `eq_bands`: `None` — [Read-Write] The EQ bands to use. (Array[SubmixEffectEQBand])

### `unreal.SwapAudioOutputResult`
Inherits: `StructBase` | Header: `AudioMixerBlueprintLibrary.h`

Out structure for use with AudioMixerBlueprintLibrary::SwapAudioOutputDevice

**Properties** (3):
  - `current_device_id`: `str` [Read-Only] — [Read-Only] ID of the currently set device.  This is the device at the time of the call, NOT the res...
  - `requested_device_id`: `str` [Read-Only] — [Read-Only] ID of the requested device. (str)
  - `result`: `SwapAudioOutputDeviceResultState` [Read-Only] — [Read-Only] Result of the call (SwapAudioOutputDeviceResultState)

### `unreal.AudioDeviceNotificationSubsystem`
Inherits: `EngineSubsystem` | Header: `AudioDeviceNotificationSubsystem.h`

UAudioDeviceNotificationSubsystem

**Properties** (6):
  - `default_capture_device_changed`: `OnAudioDefaultDeviceChanged` — [Read-Write] Multicast delegate triggered when default capture device changes (OnAudioDefaultDeviceC...
  - `default_render_device_changed`: `OnAudioDefaultDeviceChanged` — [Read-Write] Multicast delegate triggered when default render device changes (OnAudioDefaultDeviceCh...
  - `device_added`: `OnAudioDeviceChange` — [Read-Write] Multicast delegate triggered when a device is added (OnAudioDeviceChange)
  - `device_removed`: `OnAudioDeviceChange` — [Read-Write] Multicast delegate triggered when a device is removed (OnAudioDeviceChange)
  - `device_state_changed`: `OnAudioDeviceStateChanged` — [Read-Write] Multicast delegate triggered on device state change (OnAudioDeviceStateChanged)
  - `device_switched`: `OnAudioDeviceChange` — [Read-Write] Multicast delegate triggered on device switch (OnAudioDeviceChange)

### `unreal.AudioGenerator`
Inherits: `Object` | Header: `AudioGenerator.h`

Audio Generator

### `unreal.AudioMixerLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AudioMixerBlueprintLibrary.h`

Audio Mixer Blueprint Library

**Methods** (40):
  - `add_master_submix_effect(world_context_object, submix_effect_preset)` -> `None` [classmethod] — Adds a submix effect preset to the master submix.
  - `add_source_effect_to_preset_chain(world_context_object, preset_chain, entry)` -> `None` [classmethod] — Adds source effect entry to preset chain. Only effects the instance of the preset chain
  - `add_submix_effect(world_context_object, sound_submix, submix_effect_preset)` -> `int32` [classmethod] — Adds a submix effect preset to the given submix at the end of its submix effect chain. Returns the number of submix effe...
  - `clear_master_submix_effects(world_context_object)` -> `None` [classmethod] — Clears all master submix effects.
  - `clear_submix_effect_chain_override(world_context_object, sound_submix, fade_time_sec)` -> `None` [classmethod] — Clears all submix effect overrides on the given submix and returns it to the default effect chain.
  - `clear_submix_effects(world_context_object, sound_submix)` -> `None` [classmethod] — Clears all submix effects on the given submix.
  - `conv_audio_output_device_info_to_string(info)` -> `str` [classmethod] — Returns the device info in a human readable format
  - `get_available_audio_output_devices(world_context_object, on_obtain_devices_event)` -> `None` [classmethod] — Gets information about all audio output devices available in the system
  - `get_current_audio_output_device_name(world_context_object, on_obtain_current_device_event)` -> `None` [classmethod] — Gets information about the currently used audio output device
  - `get_magnitude_for_frequencies(world_context_object, frequencies, submix_to_analyze = None)` -> `Array [ float ]` [classmethod] — Retrieve the magnitudes for the given frequencies.
  - `get_number_of_entries_in_source_effect_chain(world_context_object, preset_chain)` -> `int32` [classmethod] — Returns the number of effect chain entries in the given source effect chain.
  - `get_phase_for_frequencies(world_context_object, frequencies, submix_to_analyze = None)` -> `Array [ float ]` [classmethod] — Retrieve the phases for the given frequencies.
  - `is_audio_bus_active(world_context_object, audio_bus)` -> `bool` [classmethod] — Queries if the given audio bus is active (and audio can be mixed to it).
  - `make_full_spectrum_spectral_analysis_band_settings(num_bands = 30, minimum_frequency = 40.000000, maximum_frequency = 16000.000000, attack_time_msec = 10, release_time_msec = 10)` -> `Array [ SoundSubmixSpectralAnalysisBandSettings ]` [classmethod] — Make an array of logarithmically spaced bands.
  - `make_musical_spectral_analysis_band_settings(num_semitones = 60, starting_musical_note = MusicalNoteName.C, starting_octave = 2, attack_time_msec = 10, release_time_msec = 10)` -> `Array [ SoundSubmixSpectralAnalysisBandSettings ]` [classmethod] — Make an array of musically spaced bands with ascending frequency.
  - `make_preset_spectral_analysis_band_settings(band_preset_type, num_bands = 10, attack_time_msec = 10, release_time_msec = 10)` -> `Array [ SoundSubmixSpectralAnalysisBandSettings ]` [classmethod] — Make an array of bands which span the frequency range of a given EAudioSpectrumBandPresetType.
  - `pause_recording_output(world_context_object, submix_to_pause = None)` -> `None` [classmethod] — Pause recording audio, without finalizing the recording to disk. By leaving the Submix To Record field blank, you can re...
  - `prime_sound_cue_for_playback(sound_cue)` -> `None` [classmethod] — Begin loading any sounds referenced by a sound cue into the cache so that it can be played immediately.
  - `prime_sound_for_playback(sound_wave, on_load_completion)` -> `None` [classmethod] — Begin loading a sound into the cache so that it can be played immediately.
  - `register_audio_bus_to_submix(world_context_object, sound_submix, audio_bus)` -> `None` [classmethod] — Registers an audio bus to a submix so the submix output can be routed to the audiobus.
  - `remove_master_submix_effect(world_context_object, submix_effect_preset)` -> `None` [classmethod] — Removes a submix effect preset from the master submix.
  - `remove_source_effect_from_preset_chain(world_context_object, preset_chain, entry_index)` -> `None` [classmethod] — Removes source effect entry from preset chain. Only affects the instance of preset chain.
  - `remove_submix_effect(world_context_object, sound_submix, submix_effect_preset)` -> `None` [classmethod] — Removes all instances of a submix effect preset from the given submix.
  - `remove_submix_effect_at_index(world_context_object, sound_submix, submix_chain_index)` -> `None` [classmethod] — Removes the submix effect at the given submix chain index, if there is a submix effect at that index.
  - `remove_submix_effect_preset(world_context_object, sound_submix, submix_effect_preset)` -> `None` [classmethod] — Remove Submix Effect Preset deprecated: Function âRemoveSubmixEffectPresetâ is deprecated.
  - `remove_submix_effect_preset_at_index(world_context_object, sound_submix, submix_chain_index)` -> `None` [classmethod] — Remove Submix Effect Preset at Index deprecated: Function âRemoveSubmixEffectPresetAtIndexâ is deprecated.
  - `replace_sound_effect_submix(world_context_object, sound_submix, submix_chain_index, submix_effect_preset)` -> `None` [classmethod] — Replace Sound Effect Submix deprecated: Function âReplaceSoundEffectSubmixâ is deprecated.
  - `replace_submix_effect(world_context_object, sound_submix, submix_chain_index, submix_effect_preset)` -> `None` [classmethod] — Replaces the submix effect at the given submix chain index, adds the effect if there is none at that index.
  - `resume_recording_output(world_context_object, submix_to_pause = None)` -> `None` [classmethod] — Resume recording audio after pausing. By leaving the Submix To Pause field blank, you can record the master output of th...
  - `set_bypass_source_effect_chain_entry(world_context_object, preset_chain, entry_index, bypassed)` -> `None` [classmethod] — Set whether or not to bypass the effect at the source effect chain index.
  - `set_submix_effect_chain_override(world_context_object, sound_submix, submix_effect_preset_chain, fade_time_sec)` -> `None` [classmethod] — Sets a submix effect chain override on the given submix. The effect chain will cross fade from the base effect chain or ...
  - `start_analyzing_output(world_context_object, submix_to_analyze = None, fft_size = FFTSize.DEFAULT_SIZE, interpolation_method = FFTPeakInterpolationMethod.LINEAR, window_type = FFTWindowType.HANN, hop_size = 0.000000, spectrum_type = AudioSpectrumType.MAGNITUDE_SPECTRUM)` -> `None` [classmethod] — Start spectrum analysis of the audio output. By leaving the Submix To Analyze blank, you can analyze the master output o...
  - `start_audio_bus(world_context_object, audio_bus)` -> `None` [classmethod] — Starts the given audio bus.
  - `start_recording_output(world_context_object, expected_duration, submix_to_record = None)` -> `None` [classmethod] — Start recording audio. By leaving the Submix To Record field blank, you can record the master output of the game.
  - `stop_analyzing_output(world_context_object, submix_to_stop_analyzing = None)` -> `None` [classmethod] — Stop spectrum analysis.
  - `stop_audio_bus(world_context_object, audio_bus)` -> `None` [classmethod] — Stops the given audio bus.
  - `stop_recording_output(world_context_object, export_type, name, path, submix_to_record = None, existing_sound_wave_to_overwrite = None)` -> `SoundWave` [classmethod] — Stop recording audio. Path can be absolute, or relative (to the /Saved/BouncedWavFiles folder). By leaving the Submix To...
  - `swap_audio_output_device(world_context_object, new_device_id, on_completed_device_swap)` -> `None` [classmethod] — Hotswaps to the requested audio output device
  - `trim_audio_cache(megabytes_to_free)` -> `float` [classmethod] — Trim memory used by the audio cache. Returns the number of megabytes freed.
  - `unregister_audio_bus_from_submix(world_context_object, sound_submix, audio_bus)` -> `None` [classmethod] — Unregisters an audio bus that could have been registered to a submix.

### `unreal.QuartzClockHandle`
Inherits: `Object` | Header: `AudioMixerClockHandle.h`

**Methods** (27):
  - `get_beat_progress_percent(quantization_boundary = QuartzCommandQuantization.BEAT, phase_offset = 0.000000, ms_offset = 0.000000)` -> `float` — Returns the current progress until the next occurrence of the provided musical duration as a float value from 0 (previou...
  - `get_beats_per_minute(world_context_object)` -> `float` — Get Beats Per Minute
  - `get_current_timestamp(world_context_object)` -> `QuartzTransportTimeStamp` — Retrieves a timestamp for the clock
  - `get_duration_of_quantization_type_in_seconds(world_context_object, quantization_type, multiplier = 1.000000)` -> `float` — Returns the duration in seconds of the given Quantization Type
  - `get_estimated_run_time(world_context_object)` -> `float` — Returns the amount of time, in seconds, the clock has been running. Caution: due to latency, this will not be perfectly ...
  - `get_milliseconds_per_tick(world_context_object)` -> `float` — Metronome getters
  - `get_seconds_per_tick(world_context_object)` -> `float` — Get Seconds Per Tick
  - `get_thirty_second_notes_per_minute(world_context_object)` -> `float` — Get Thirty Second Notes Per Minute
  - `get_ticks_per_second(world_context_object)` -> `float` — Get Ticks Per Second
  - `is_clock_running(world_context_object)` -> `bool` — Is Clock Running
  - `notify_on_quantization_boundary(world_context_object, quantization_boundary, delegate, ms_offset = 0.000000)` -> `None` — Notify on Quantization Boundary
  - `pause_clock(world_context_object)` -> `QuartzClockHandle` — Pause Clock
  - `reset_transport(world_context_object, delegate)` -> `None` — Reset Transport
  - `reset_transport_quantized(world_context_object, quantization_boundary, delegate)` -> `QuartzClockHandle` — Reset Transport Quantized
  - `resume_clock(world_context_object)` -> `QuartzClockHandle` — Resume Clock
  - `set_beats_per_minute(world_context_object, quantization_boundary, delegate, beats_per_minute = 60.000000)` -> `QuartzClockHandle` — Set Beats Per Minute
  - `set_milliseconds_per_tick(world_context_object, quantization_boundary, delegate, milliseconds_per_tick = 100.000000)` -> `QuartzClockHandle` — Metronome Alteration (setters)
  - `set_seconds_per_tick(world_context_object, quantization_boundary, delegate, seconds_per_tick = 0.250000)` -> `QuartzClockHandle` — Set Seconds Per Tick
  - `set_thirty_second_notes_per_minute(world_context_object, quantization_boundary, delegate, thirty_seconds_notes_per_minute = 960.000000)` -> `QuartzClockHandle` — Set Thirty Second Notes Per Minute
  - `set_ticks_per_second(world_context_object, quantization_boundary, delegate, ticks_per_second = 10.000000)` -> `QuartzClockHandle` — Set Ticks Per Second
  - `start_clock(world_context_object)` -> `QuartzClockHandle` — Clock manipulation
  - `start_other_clock(world_context_object, other_clock_name, quantization_boundary, delegate)` -> `None` — âotherâ clock manipulation
  - `stop_clock(world_context_object, cancel_pending_events)` -> `QuartzClockHandle` — Stop Clock
  - `subscribe_to_all_quantization_events(world_context_object, on_quantization_event)` -> `QuartzClockHandle` — Subscribe to All Quantization Events
  - `subscribe_to_quantization_event(world_context_object, quantization_boundary, on_quantization_event)` -> `QuartzClockHandle` — Metronome subscription
  - `unsubscribe_from_all_time_divisions(world_context_object)` -> `QuartzClockHandle` — Unsubscribe from All Time Divisions
  - `unsubscribe_from_time_division(world_context_object, quantization_boundary)` -> `QuartzClockHandle` — Unsubscribe from Time Division

### `unreal.QuartzSubsystem`
Inherits: `TickableWorldSubsystem` | Header: `QuartzSubsystem.h`

Quartz Subsystem

**Methods** (20):
  - `create_new_clock(world_context_object, clock_name, settings, override_settings_if_clock_exists = False, use_audio_engine_clock_manager = True)` -> `QuartzClockHandle` — Clock Creation create a new clock (or return handle if clock already exists)
  - `delete_clock_by_handle(world_context_object, clock_handle)` -> `QuartzClockHandle` — delete an existing clock given its clock handle
  - `delete_clock_by_name(world_context_object, clock_name)` -> `None` — delete an existing clock given its name
  - `does_clock_exist(world_context_object, clock_name)` -> `bool` — returns true if the clock exists
  - `get_audio_render_thread_to_game_thread_average_latency()` -> `float` — latency data (Audio Render Thread -> Game thread)
  - `get_audio_render_thread_to_game_thread_max_latency()` -> `float` — Get Audio Render Thread to Game Thread Max Latency
  - `get_audio_render_thread_to_game_thread_min_latency()` -> `float` — Get Audio Render Thread to Game Thread Min Latency
  - `get_current_clock_timestamp(world_context_object, clock_name)` -> `QuartzTransportTimeStamp` — Retrieves a timestamp for the clock
  - `get_duration_of_quantization_type_in_seconds(world_context_object, clock_name, quantization_type, multiplier = 1.000000)` -> `float` — Returns the duration in seconds of the given Quantization Type
  - `get_estimated_clock_run_time(world_context_object, clock_name)` -> `float` — Returns the amount of time, in seconds, the clock has been running. Caution: due to latency, this will not be perfectly ...
  - `get_game_thread_to_audio_render_thread_average_latency(world_context_object)` -> `float` — latency data (Game thread -> Audio Render Thread)
  - `get_game_thread_to_audio_render_thread_max_latency(world_context_object)` -> `float` — Get Game Thread to Audio Render Thread Max Latency
  - `get_game_thread_to_audio_render_thread_min_latency(world_context_object)` -> `float` — Get Game Thread to Audio Render Thread Min Latency
  - `get_handle_for_clock(world_context_object, clock_name)` -> `QuartzClockHandle` — get handle for existing clock
  - `get_round_trip_average_latency(world_context_object)` -> `float` — latency data (Round trip)
  - `get_round_trip_max_latency(world_context_object)` -> `float` — Get Round Trip Max Latency
  - `get_round_trip_min_latency(world_context_object)` -> `float` — Get Round Trip Min Latency
  - `is_clock_running(world_context_object, clock_name)` -> `bool` — returns true if the clock is running
  - `is_quartz_enabled()` -> `bool` — Is Quartz Enabled
  - `set_quartz_subsystem_tickable_when_paused(tickable_when_paused)` -> `None` — Set Quartz Subsystem Tickable when Paused

### `unreal.ScrubbedSound`
Inherits: `SoundWave` | Header: `SoundWaveScrubber.h`

Scrubbed Sound

**Methods** (6):
  - `get_playhead_time()` -> `float` — Returns the current playhead time
  - `set_grain_duration_range(grain_duration_range_seconds)` -> `None` — Sets the scrub grain duration range.
  - `set_is_scrubbing(is_scrubbing)` -> `None` — Sets if the scrubber is actively scrubbing or not
  - `set_is_scrubbing_while_stationary(scrub_while_stationary)` -> `None` — Sets if the scrubber should scrub while playhead is stationary (after it hits itâs target playhead)
  - `set_playhead_time(playhead_time_seconds)` -> `None` — Sets the scrub time in seconds
  - `set_sound_wave(sound_wave)` -> `None` — Sets the sound wave to scrub

### `unreal.SubmixEffectDynamicsProcessorPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `AudioMixerSubmixEffectDynamicsProcessor.h`

Submix Effect Dynamics Processor Preset

**Methods** (4):
  - `reset_key()` -> `None` — Reset Key
  - `set_audio_bus(audio_bus)` -> `None` — Sets the source key input as the provided AudioBusâ output. If no object is provided, key is set to effectâs input.
  - `set_external_submix(submix)` -> `None` — Sets the source key input as the provided Submixâs output. If no object is provided, key is set to effectâs input.
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SubmixEffectDynamicsProcessorSettings` — [Read-Write] (SubmixEffectDynamicsProcessorSettings)

### `unreal.SubmixEffectReverbPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `AudioMixerSubmixEffectReverb.h`

Submix Effect Reverb Preset

**Methods** (2):
  - `set_settings(settings)` -> `None` — Set Settings
  - `set_settings_with_reverb_effect(reverb_effect, wet_level, dry_level = 0.000000)` -> `None` — Set Settings with Reverb Effect

**Properties** (1):
  - `settings`: `SubmixEffectReverbSettings` — [Read-Write] (SubmixEffectReverbSettings)

### `unreal.SubmixEffectSubmixEQPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `AudioMixerSubmixEffectEQ.h`

Submix Effect Submix EQPreset

**Methods** (1):
  - `set_settings(settings)` -> `None` — Set Settings

**Properties** (1):
  - `settings`: `SubmixEffectSubmixEQSettings` — [Read-Write] (SubmixEffectSubmixEQSettings)

### `unreal.SynthComponent`
Inherits: `SceneComponent` | Header: `SynthComponent.h`

Synth Component

**Methods** (17):
  - `adjust_volume(adjust_volume_duration, adjust_volume_level, fade_curve = AudioFaderCurve.LINEAR)` -> `None` — This function allows designers to trigger an adjustment to the sound instanceâs playback Volume with options for smoot...
  - `fade_in(fade_in_duration, fade_volume_level = 1.000000, start_time = 0.000000, fade_curve = AudioFaderCurve.LINEAR)` -> `None` — This function allows designers to call Play on an Audio Component instance while applying a volume curve over time. Para...
  - `fade_out(fade_out_duration, fade_volume_level, fade_curve = AudioFaderCurve.LINEAR)` -> `None` — This function allows designers to call a delayed Stop on an Audio Component instance while applying a volume curve over ...
  - `get_modulators(destination)` -> `Set [ SoundModulatorBase ]` — Gets the set of currently active modulators for a given Modulation Destination.
  - `is_playing()` -> `bool` — Returns true if this component is currently playing.
  - `set_audio_bus_send_post_effect(audio_bus, audio_bus_send_level)` -> `None` — Sets how much audio the sound should send to the given AudioBus (post effect).
  - `set_audio_bus_send_pre_effect(audio_bus, audio_bus_send_level)` -> `None` — Sets how much audio the sound should send to the given AudioBus (pre effect).
  - `set_low_pass_filter_enabled(low_pass_filter_enabled)` -> `None` — Sets whether or not the low pass filter is enabled on the audio component.
  - `set_low_pass_filter_frequency(low_pass_filter_frequency)` -> `None` — Sets lowpass filter frequency of the audio component.
  - `set_modulation_routing(modulators, destination, routing_method = ModulationRouting.INHERIT)` -> `None` — Sets the routing for one of the given Synth componentâs Modulation Destinations.
  - `set_output_to_bus_only(output_to_bus_only)` -> `None` — Sets whether or not the synth component outputs its audio to any source or audio buses.
  - `set_source_bus_send_post_effect(sound_source_bus, source_bus_send_level)` -> `None` — Sets how much audio the sound should send to the given SourceBus (post effect).
  - `set_source_bus_send_pre_effect(sound_source_bus, source_bus_send_level)` -> `None` — Sets how much audio the sound should send to the given SourceBus (pre effect).
  - `set_submix_send(submix, send_level)` -> `None` — Sets how much audio the sound should send to the given submix.
  - `set_volume_multiplier(volume_multiplier)` -> `None` — Set a new volume multiplier
  - `start()` -> `None` — Starts the synth generating audio.
  - `stop()` -> `None` — Stops the synth generating audio.

**Properties** (14):
  - `allow_spatialization`: `bool` — [Read-Write] Is this audio component allowed to be spatialized? (bool)
  - `attenuation_overrides`: `SoundAttenuationSettings` — [Read-Write] If bOverrideSettings is true, the attenuation properties to use for sounds generated by...
  - `attenuation_settings`: `SoundAttenuation` — [Read-Write] If bOverrideSettings is false, the asset to use to determine attenuation properties for...
  - `bus_sends`: `None` — [Read-Write] This sound will send its audio output to this list of buses if there are bus instances ...
  - `concurrency_set`: `None` — [Read-Write] What sound concurrency to use for sounds generated by this audio component (Set[SoundCo...
  - `enable_bus_sends`: `bool` — [Read-Write] Whether or not to enable sending this audioâs output to buses. (bool)
  - `envelope_follower_attack_time`: `int` — [Read-Write] The attack time in milliseconds for the envelope follower. Delegate callbacks can be re...
  - `envelope_follower_release_time`: `int` — [Read-Write] The release time in milliseconds for the envelope follower. Delegate callbacks can be r...
  - `is_ui_sound`: `bool` — [Read-Write] Whether or not this sound plays when the game is paused in the UI (bool)
  - `modulation_routing`: `SoundModulationDefaultRoutingSettings` — [Read-Write] (SoundModulationDefaultRoutingSettings)
  - `on_audio_envelope_value`: `OnSynthEnvelopeValue` — [Read-Write] (OnSynthEnvelopeValue)
  - `override_attenuation`: `bool` — [Read-Write] Should the Attenuation Settings asset be used (false) or should the properties set dire...
  - `pre_effect_bus_sends`: `None` — [Read-Write] This sound will send its audio output to this list of buses if there are bus instances ...
  - `sound_submix_sends`: `None` — [Read-Write] An array of submix sends. Audio from this sound will send a portion of its audio to the...

### `unreal.SynthSound`
Inherits: `SoundWaveProcedural` | Header: `SynthComponent.h`

Synth Sound

### `unreal.AudioDeviceChangedRole`
Inherits: `EnumBase` | Header: `AudioDeviceNotificationSubsystem.h`

EAudioDeviceChangedRole

**Properties** (4):
  - `COMMUNICATIONS`: `AudioDeviceChangedRole = Ellipsis` — 3
  - `CONSOLE`: `AudioDeviceChangedRole = Ellipsis` — 1
  - `INVALID`: `AudioDeviceChangedRole = Ellipsis` — 0
  - `MULTIMEDIA`: `AudioDeviceChangedRole = Ellipsis` — 2

### `unreal.AudioDeviceChangedState`
Inherits: `EnumBase` | Header: `AudioDeviceNotificationSubsystem.h`

EAudioDeviceChangedState

**Properties** (5):
  - `ACTIVE`: `AudioDeviceChangedState = Ellipsis` — 1
  - `DISABLED`: `AudioDeviceChangedState = Ellipsis` — 2
  - `INVALID`: `AudioDeviceChangedState = Ellipsis` — 0
  - `NOT_PRESENT`: `AudioDeviceChangedState = Ellipsis` — 3
  - `UNPLUGGED`: `AudioDeviceChangedState = Ellipsis` — 4

### `unreal.AudioMixerChannelType`
Inherits: `EnumBase` | Header: `AudioMixerBlueprintLibrary.h`

A copy of Audio::EAudioMixerChannel::Type to get around UHTâs refusal of namespaces

**Properties** (21):
  - `BACK_CENTER`: `AudioMixerChannelType = Ellipsis` — 8
  - `BACK_LEFT`: `AudioMixerChannelType = Ellipsis` — 4
  - `BACK_RIGHT`: `AudioMixerChannelType = Ellipsis` — 5
  - `CHANNEL_TYPE_COUNT`: `AudioMixerChannelType = Ellipsis` — 19
  - `DEFAULT_CHANNEL`: `AudioMixerChannelType = Ellipsis` — 0
  - `FRONT_CENTER`: `AudioMixerChannelType = Ellipsis` — 2
  - `FRONT_LEFT`: `AudioMixerChannelType = Ellipsis` — 0
  - `FRONT_LEFT_OF_CENTER`: `AudioMixerChannelType = Ellipsis` — 6
  - `FRONT_RIGHT`: `AudioMixerChannelType = Ellipsis` — 1
  - `FRONT_RIGHT_OF_CENTER`: `AudioMixerChannelType = Ellipsis` — 7
  - `LOW_FREQUENCY`: `AudioMixerChannelType = Ellipsis` — 3
  - `SIDE_LEFT`: `AudioMixerChannelType = Ellipsis` — 9
  - `SIDE_RIGHT`: `AudioMixerChannelType = Ellipsis` — 10
  - `TOP_BACK_CENTER`: `AudioMixerChannelType = Ellipsis` — 16
  - `TOP_BACK_LEFT`: `AudioMixerChannelType = Ellipsis` — 15
  - `TOP_BACK_RIGHT`: `AudioMixerChannelType = Ellipsis` — 17
  - `TOP_CENTER`: `AudioMixerChannelType = Ellipsis` — 11
  - `TOP_FRONT_CENTER`: `AudioMixerChannelType = Ellipsis` — 13
  - `TOP_FRONT_LEFT`: `AudioMixerChannelType = Ellipsis` — 12
  - `TOP_FRONT_RIGHT`: `AudioMixerChannelType = Ellipsis` — 14
  - `UNKNOWN`: `AudioMixerChannelType = Ellipsis` — 18

### `unreal.AudioMixerStreamDataFormatType`
Inherits: `EnumBase` | Header: `AudioMixerBlueprintLibrary.h`

Duplicate of Audio::EAudioMixerStreamDataFormat::Type, to get around UHTâs lack of namespace support

**Properties** (4):
  - `FLOAT`: `AudioMixerStreamDataFormatType = Ellipsis` — 1
  - `INT16`: `AudioMixerStreamDataFormatType = Ellipsis` — 2
  - `UNKNOWN`: `AudioMixerStreamDataFormatType = Ellipsis` — 0
  - `UNSUPPORTED`: `AudioMixerStreamDataFormatType = Ellipsis` — 3

### `unreal.MusicalNoteName`
Inherits: `EnumBase` | Header: `AudioMixerBlueprintLibrary.h`

EMusical Note Name

**Properties** (12):
  - `A`: `MusicalNoteName = Ellipsis` — 9
  - `AB`: `MusicalNoteName = Ellipsis` — 8
  - `B`: `MusicalNoteName = Ellipsis` — 11
  - `BB`: `MusicalNoteName = Ellipsis` — 10
  - `C`: `MusicalNoteName = Ellipsis` — 0
  - `D`: `MusicalNoteName = Ellipsis` — 2
  - `DB`: `MusicalNoteName = Ellipsis` — 1
  - `E`: `MusicalNoteName = Ellipsis` — 4
  - `EB`: `MusicalNoteName = Ellipsis` — 3
  - `F`: `MusicalNoteName = Ellipsis` — 5
  - `G`: `MusicalNoteName = Ellipsis` — 7
  - `GB`: `MusicalNoteName = Ellipsis` — 6

### `unreal.SubmixEffectDynamicsChannelLinkMode`
Inherits: `EnumBase` | Header: `AudioMixerSubmixEffectDynamicsProcessor.h`

ESubmix Effect Dynamics Channel Link Mode

**Properties** (3):
  - `AVERAGE`: `SubmixEffectDynamicsChannelLinkMode = Ellipsis` — 1
  - `DISABLED`: `SubmixEffectDynamicsChannelLinkMode = Ellipsis` — 0
  - `PEAK`: `SubmixEffectDynamicsChannelLinkMode = Ellipsis` — 2

### `unreal.SubmixEffectDynamicsKeySource`
Inherits: `EnumBase` | Header: `AudioMixerSubmixEffectDynamicsProcessor.h`

ESubmix Effect Dynamics Key Source

**Properties** (3):
  - `AUDIO_BUS`: `SubmixEffectDynamicsKeySource = Ellipsis` — Uses audio bus as key 1
  - `DEFAULT`: `SubmixEffectDynamicsKeySource = Ellipsis` — Defaults to use local submix (input) as key 0
  - `SUBMIX`: `SubmixEffectDynamicsKeySource = Ellipsis` — Uses external submix as key 2

### `unreal.SubmixEffectDynamicsPeakMode`
Inherits: `EnumBase` | Header: `AudioMixerSubmixEffectDynamicsProcessor.h`

ESubmix Effect Dynamics Peak Mode

**Properties** (3):
  - `MEAN_SQUARED`: `SubmixEffectDynamicsPeakMode = Ellipsis` — 0
  - `PEAK`: `SubmixEffectDynamicsPeakMode = Ellipsis` — 2
  - `ROOT_MEAN_SQUARED`: `SubmixEffectDynamicsPeakMode = Ellipsis` — 1

### `unreal.SubmixEffectDynamicsProcessorType`
Inherits: `EnumBase` | Header: `AudioMixerSubmixEffectDynamicsProcessor.h`

ESubmix Effect Dynamics Processor Type

**Properties** (5):
  - `COMPRESSOR`: `SubmixEffectDynamicsProcessorType = Ellipsis` — 0
  - `EXPANDER`: `SubmixEffectDynamicsProcessorType = Ellipsis` — 2
  - `GATE`: `SubmixEffectDynamicsProcessorType = Ellipsis` — 3
  - `LIMITER`: `SubmixEffectDynamicsProcessorType = Ellipsis` — 1
  - `UPWARDS_COMPRESSOR`: `SubmixEffectDynamicsProcessorType = Ellipsis` — 4

### `unreal.SwapAudioOutputDeviceResultState`
Inherits: `EnumBase` | Header: `AudioMixerBlueprintLibrary.h`

Resulting State of SwapAudioOutputDevice call

**Properties** (3):
  - `FAILURE`: `SwapAudioOutputDeviceResultState = Ellipsis` — 0
  - `NONE`: `SwapAudioOutputDeviceResultState = Ellipsis` — 2
  - `SUCCESS`: `SwapAudioOutputDeviceResultState = Ellipsis` — 1

### `unreal.OnAudioDefaultDeviceChanged`
Inherits: `MulticastDelegateBase` | Header: `AudioDeviceNotificationSubsystem.h`

On Audio Default Device Changed Delegate Signature

### `unreal.OnAudioDeviceChange`
Inherits: `MulticastDelegateBase` | Header: `AudioDeviceNotificationSubsystem.h`

On Audio Device Change Delegate Signature

### `unreal.OnAudioDeviceStateChanged`
Inherits: `MulticastDelegateBase` | Header: `AudioDeviceNotificationSubsystem.h`

On Audio Device State Changed Delegate Signature

### `unreal.OnAudioOutputDevicesObtained`
Inherits: `DelegateBase` | Header: `AudioMixerBlueprintLibrary.h`

Called when a list of all available audio devices is retrieved

### `unreal.OnCompletedDeviceSwap`
Inherits: `DelegateBase` | Header: `AudioMixerBlueprintLibrary.h`

Called when the system has swapped to another audio output device

### `unreal.OnMainAudioOutputDeviceObtained`
Inherits: `DelegateBase` | Header: `AudioMixerBlueprintLibrary.h`

Called when a list of all available audio devices is retrieved

### `unreal.OnSoundLoadComplete`
Inherits: `DelegateBase` | Header: `AudioMixerBlueprintLibrary.h`

Called when a load request for a sound has completed.

### `unreal.OnSynthEnvelopeValue`
Inherits: `MulticastDelegateBase` | Header: `SynthComponent.h`

Called by a synth component and returns the soundâs envelope value (using an envelope follower in the audio renderer). This only works in the audio mixer.
