# UE Python API — AudioSynesthesia Module

**38 types** from the `AudioSynesthesia` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ConstantQResults`, `LoudnessResults`, `MeterResults`, `SynesthesiaSpectrumResults`, `AudioSynesthesiaNRT`, `AudioSynesthesiaNRTSettings`, `AudioSynesthesiaSettings`, `ConstantQAnalyzer`, `ConstantQNRT`, `ConstantQNRTSettings`, `ConstantQSettings`, `LoudnessAnalyzer`, `LoudnessNRT`, `LoudnessNRTSettings`, `LoudnessSettings`, `MeterAnalyzer`, `MeterSettings`, `OnsetNRT`, `OnsetNRTSettings`, `SynesthesiaSpectrumAnalysisSettings`, ... (38 total)

---

## Classes

### `unreal.ConstantQResults`
Inherits: `StructBase` | Header: `ConstantQ.h`

The results of the ConstantQ analysis.

**Properties** (2):
  - `spectrum_values`: `None` [Read-Only] — [Read-Only] The spectrum values from the FFT (Array[float])
  - `time_seconds`: `float` [Read-Only] — [Read-Only] The time in seconds since analysis began of this ConstantQ analysis result (float)

### `unreal.LoudnessResults`
Inherits: `StructBase` | Header: `Loudness.h`

The results of the loudness analyis.

**Properties** (4):
  - `loudness`: `float` [Read-Only] — [Read-Only] The raw loudness value in dB (float)
  - `normalized_loudness`: `float` [Read-Only] — [Read-Only] The normalized loudness (float)
  - `perceptual_energy`: `float` [Read-Only] — [Read-Only] The normalized loudness (float)
  - `time_seconds`: `float` [Read-Only] — [Read-Only] The time in seconds since analysis began (float)

### `unreal.MeterResults`
Inherits: `StructBase` | Header: `Meter.h`

The results of the meter analysis.

**Properties** (5):
  - `clipping_value`: `float` [Read-Only] — [Read-Only] The value (if non-zero) if clipping was detected above the clipping threshold (float)
  - `meter_value`: `float` [Read-Only] — [Read-Only] The meter value (float)
  - `num_samples_clipping`: `int` [Read-Only] — [Read-Only] The number of samples in the period which were above the clipping threshold. Will be 0 i...
  - `peak_value`: `float` [Read-Only] — [Read-Only] The peak value (float)
  - `time_seconds`: `float` [Read-Only] — [Read-Only] The time in seconds since analysis began of this meter analysis result (float)

### `unreal.SynesthesiaSpectrumResults`
Inherits: `StructBase` | Header: `SynesthesiaSpectrumAnalysis.h`

The results of the spectrum analysis.

**Properties** (2):
  - `spectrum_values`: `None` [Read-Only] — [Read-Only] The spectrum values from the FFT (Array[float])
  - `time_seconds`: `float` [Read-Only] — [Read-Only] The time in seconds since analysis began of this SynesthesiaSpectrumAnalysis analysis re...

### `unreal.AudioSynesthesiaNRT`
Inherits: `AudioAnalyzerNRT` | Header: `AudioSynesthesiaNRT.h`

UAudioSynesthesiaNRT

### `unreal.AudioSynesthesiaNRTSettings`
Inherits: `AudioAnalyzerNRTSettings` | Header: `AudioSynesthesiaNRT.h`

UAudioSynesthesiaNRTSettings

### `unreal.AudioSynesthesiaSettings`
Inherits: `AudioAnalyzerSettings` | Header: `AudioSynesthesia.h`

UAudioSynesthesiaSettings

### `unreal.ConstantQAnalyzer`
Inherits: `AudioAnalyzer` | Header: `ConstantQ.h`

UConstantQAnalyzer

**Methods** (2):
  - `get_center_frequencies()` -> `Array [ float ]` — Get Center Frequencies
  - `get_num_center_frequencies()` -> `int32` — Get Num Center Frequencies

**Properties** (3):
  - `on_constant_q_results`: `OnConstantQResults` — [Read-Write] Delegate to receive all Spectrum results, per-channel, since last delegate call. If bDo...
  - `on_latest_constant_q_results`: `OnLatestConstantQResults` — [Read-Write] Delegate to receive the latest per-channel Spectrum results. If bDownmixToMono setting ...
  - `settings`: `ConstantQSettings` — [Read-Write] The settings for the audio analyzer. (ConstantQSettings)

### `unreal.ConstantQNRT`
Inherits: `AudioSynesthesiaNRT` | Header: `ConstantQNRT.h`

UConstantQNRT

**Methods** (2):
  - `get_channel_constant_q_at_time(seconds, channel)` -> `Array [ float ]` — Get a specific channel cqt of the analyzed sound at a given time.
  - `get_normalized_channel_constant_q_at_time(seconds, channel)` -> `Array [ float ]` — Get a specific channel cqt of the analyzed sound at a given time.

**Properties** (1):
  - `settings`: `ConstantQNRTSettings` [Read-Only] — [Read-Only] The settings for the audio analyzer. (ConstantQNRTSettings)

### `unreal.ConstantQNRTSettings`
Inherits: `AudioSynesthesiaNRTSettings` | Header: `ConstantQNRT.h`

UConstantQNRTSettings

**Properties** (11):
  - `analysis_period`: `float` [Read-Only] — [Read-Only] Number of seconds between cqt measurements (float)
  - `band_width_stretch`: `float` [Read-Only] — [Read-Only] Stretching factor to control overlap of adjacent bands. (float)
  - `cqt_normalization`: `ConstantQNormalizationEnum` [Read-Only] — [Read-Only] Normalization scheme used to generate band windows. (ConstantQNormalizationEnum)
  - `downmix_to_mono`: `bool` [Read-Only] — [Read-Only] If true, multichannel audio is downmixed to mono with equal amplitude scaling. If false,...
  - `fft_size`: `ConstantQFFTSizeEnum` [Read-Only] — [Read-Only] Size of FFT. (ConstantQFFTSizeEnum)
  - `noise_floor_db`: `float` [Read-Only] — [Read-Only] Noise floor to use when normalizing CQT (float)
  - `num_bands`: `int` [Read-Only] — [Read-Only] Total number of resulting constant Q bands. (int32)
  - `num_bands_per_octave`: `float` [Read-Only] — [Read-Only] Number of bands within an octave. (float)
  - `spectrum_type`: `AudioSpectrumType` [Read-Only] — [Read-Only] Type of spectrum to use. (AudioSpectrumType)
  - `starting_frequency`: `float` [Read-Only] — [Read-Only] Starting frequency for first bin of CQT (float)
  - `window_type`: `FFTWindowType` [Read-Only] — [Read-Only] Type of window to be applied to input audio (FFTWindowType)

### `unreal.ConstantQSettings`
Inherits: `AudioSynesthesiaSettings` | Header: `ConstantQ.h`

UConstantQSettings

**Properties** (11):
  - `analysis_period_in_seconds`: `float` [Read-Only] — [Read-Only] Number of seconds between cqt measurements (float)
  - `band_width_stretch`: `float` [Read-Only] — [Read-Only] Stretching factor to control overlap of adjacent bands. (float)
  - `cqt_normalization`: `ConstantQNormalizationEnum` [Read-Only] — [Read-Only] Normalization scheme used to generate band windows. (ConstantQNormalizationEnum)
  - `downmix_to_mono`: `bool` [Read-Only] — [Read-Only] If true, multichannel audio is downmixed to mono with equal amplitude scaling. If false,...
  - `fft_size`: `ConstantQFFTSizeEnum` [Read-Only] — [Read-Only] Size of FFT. (ConstantQFFTSizeEnum)
  - `noise_floor_db`: `float` [Read-Only] — [Read-Only] Noise floor to use when normalizing CQT (float)
  - `num_bands`: `int` [Read-Only] — [Read-Only] Total number of resulting constant Q bands. (int32)
  - `num_bands_per_octave`: `float` [Read-Only] — [Read-Only] Number of bands within an octave. (float)
  - `spectrum_type`: `AudioSpectrumType` [Read-Only] — [Read-Only] Type of spectrum to use. (AudioSpectrumType)
  - `starting_frequency_hz`: `float` [Read-Only] — [Read-Only] Starting frequency for first bin of CQT (float)
  - `window_type`: `FFTWindowType` [Read-Only] — [Read-Only] Type of window to be applied to input audio (FFTWindowType)

### `unreal.LoudnessAnalyzer`
Inherits: `AudioAnalyzer` | Header: `Loudness.h`

ULoudnessAnalyzer

**Properties** (5):
  - `on_latest_overall_loudness_results`: `OnLatestOverallLoudnessResults` — [Read-Write] Delegate to receive the latest overall loudness results. (OnLatestOverallLoudnessResult...
  - `on_latest_per_channel_loudness_results`: `OnLatestPerChannelLoudnessResults` — [Read-Write] Delegate to receive the latest per-channel loudness results. (OnLatestPerChannelLoudnes...
  - `on_overall_loudness_results`: `OnOverallLoudnessResults` — [Read-Write] Delegate to receive all overall loudness results since last delegate call. (OnOverallLo...
  - `on_per_channel_loudness_results`: `OnPerChannelLoudnessResults` — [Read-Write] Delegate to receive all loudness results, per-channel, since last delegate call. (OnPer...
  - `settings`: `LoudnessSettings` — [Read-Write] The settings for the audio analyzer. (LoudnessSettings)

### `unreal.LoudnessNRT`
Inherits: `AudioSynesthesiaNRT` | Header: `LoudnessNRT.h`

ULoudnessNRT

**Methods** (4):
  - `get_channel_loudness_at_time(seconds, channel)` -> `float` — Get a specific channel loudness of the analyzed sound at a given time.
  - `get_loudness_at_time(seconds)` -> `float` — Get the overall loudness of the analyzed sound at a given time.
  - `get_normalized_channel_loudness_at_time(seconds, channel)` -> `float` — Get a specific channel normalized loudness of the analyzed sound at a given time. Normalized loudness is always between ...
  - `get_normalized_loudness_at_time(seconds)` -> `float` — Get the normalized overall loudness of the analyzed sound at a given time. Normalized loudness is always between 0.0 to ...

**Properties** (1):
  - `settings`: `LoudnessNRTSettings` [Read-Only] — [Read-Only] The settings for the audio analyzer. (LoudnessNRTSettings)

### `unreal.LoudnessNRTSettings`
Inherits: `AudioSynesthesiaNRTSettings` | Header: `LoudnessNRT.h`

ULoudnessNRTSettings

**Properties** (5):
  - `analysis_period`: `float` [Read-Only] — [Read-Only] Number of seconds between loudness measurements (float)
  - `curve_type`: `LoudnessNRTCurveTypeEnum` [Read-Only] — [Read-Only] Type of equal loudness curve used in calculations (LoudnessNRTCurveTypeEnum)
  - `maximum_frequency`: `float` [Read-Only] — [Read-Only] Maximum analysis frequency for calculating loudness. (float)
  - `minimum_frequency`: `float` [Read-Only] — [Read-Only] Minimum analysis frequency for calculating loudness. (float)
  - `noise_floor_db`: `float` [Read-Only] — [Read-Only] dB level to denote silence.  Used when calculating normalized loudness. (float)

### `unreal.LoudnessSettings`
Inherits: `AudioSynesthesiaSettings` | Header: `Loudness.h`

ULoudnessSettings

**Properties** (6):
  - `analysis_period`: `float` [Read-Only] — [Read-Only] Number of seconds between loudness measurements (float)
  - `curve_type`: `LoudnessCurveTypeEnum` [Read-Only] — [Read-Only] Type of equal loudness curve used in calculations (LoudnessCurveTypeEnum)
  - `expected_max_loudness`: `float` [Read-Only] — [Read-Only] dB level to denote silence.  Used when calculating normalized loudness. (float)
  - `maximum_frequency`: `float` [Read-Only] — [Read-Only] Maximum analysis frequency for calculating loudness. (float)
  - `minimum_frequency`: `float` [Read-Only] — [Read-Only] Minimum analysis frequency for calculating loudness. (float)
  - `noise_floor_db`: `float` [Read-Only] — [Read-Only] dB level to denote silence.  Used when calculating normalized loudness. (float)

### `unreal.MeterAnalyzer`
Inherits: `AudioAnalyzer` | Header: `Meter.h`

UMeterAnalyzer

**Properties** (5):
  - `on_latest_overall_meter_results`: `OnLatestOverallMeterResults` — [Read-Write] Delegate to receive the latest overall meter results. (OnLatestOverallMeterResults)
  - `on_latest_per_channel_meter_results`: `OnLatestPerChannelMeterResults` — [Read-Write] Delegate to receive the latest per-channel meter results. (OnLatestPerChannelMeterResul...
  - `on_overall_meter_results`: `OnOverallMeterResults` — [Read-Write] Delegate to receive all overall meter results since last delegate call. (OnOverallMeter...
  - `on_per_channel_meter_results`: `OnPerChannelMeterResults` — [Read-Write] Delegate to receive all meter results, per-channel, since last delegate call. (OnPerCha...
  - `settings`: `MeterSettings` — [Read-Write] The settings for the meter audio analyzer. (MeterSettings)

### `unreal.MeterSettings`
Inherits: `AudioSynesthesiaSettings` | Header: `Meter.h`

UMeterSettings

**Properties** (6):
  - `analysis_period`: `float` [Read-Only] — [Read-Only] Number of seconds between meter measurements (float)
  - `clipping_threshold`: `float` [Read-Only] — [Read-Only] What volume threshold to throw clipping detection notifications. (float)
  - `meter_attack_time`: `int` [Read-Only] — [Read-Only] Meter attack time, in milliseconds (int32)
  - `meter_release_time`: `int` [Read-Only] — [Read-Only] Meter release time, in milliseconds. (int32)
  - `peak_hold_time`: `int` [Read-Only] — [Read-Only] Peak hold time, in milliseconds (int32)
  - `peak_mode`: `MeterPeakType` [Read-Only] — [Read-Only] Meter envelope type type (MeterPeakType)

### `unreal.OnsetNRT`
Inherits: `AudioSynesthesiaNRT` | Header: `OnsetNRT.h`

UOnsetNRT

**Methods** (2):
  - `get_channel_onsets_between_times()` — Returns onsets which occured between start and end timestamps.
  - `get_normalized_channel_onsets_between_times()` — Get a specific channel cqt of the analyzed sound at a given time.

**Properties** (1):
  - `settings`: `OnsetNRTSettings` [Read-Only] — [Read-Only] The settings for the audio analyzer. (OnsetNRTSettings)

### `unreal.OnsetNRTSettings`
Inherits: `AudioSynesthesiaNRTSettings` | Header: `OnsetNRT.h`

UOnsetNRTSettings

**Properties** (5):
  - `downmix_to_mono`: `bool` [Read-Only] — [Read-Only] If true, multichannel audio is downmixed to mono with equal amplitude scaling. If false,...
  - `granularity_in_seconds`: `float` [Read-Only] — [Read-Only] Onset timestamp granularity onsets. Lower granularity takes longer to compute. (float)
  - `maximum_frequency`: `float` [Read-Only] — [Read-Only] Starting frequency for onset anlaysis. (float)
  - `minimum_frequency`: `float` [Read-Only] — [Read-Only] Starting frequency for onset anlaysis. (float)
  - `sensitivity`: `float` [Read-Only] — [Read-Only] Sensitivity of onset detector. Higher sensitivity will find more onsets. (float)

### `unreal.SynesthesiaSpectrumAnalysisSettings`
Inherits: `AudioSynesthesiaSettings` | Header: `SynesthesiaSpectrumAnalysis.h`

USynesthesiaSpectrumAnalysisSettings

**Properties** (5):
  - `analysis_period`: `float` [Read-Only] — [Read-Only] Number of seconds between SynesthesiaSpectrumAnalysis measurements (float)
  - `downmix_to_mono`: `bool` [Read-Only] — [Read-Only] If true, multichannel audio is downmixed to mono with equal amplitude scaling. If false,...
  - `fft_size`: `FFTSize` [Read-Only] — [Read-Only] Size of FFT. (FFTSize)
  - `spectrum_type`: `AudioSpectrumType` [Read-Only] — [Read-Only] Type of spectrum to use. (AudioSpectrumType)
  - `window_type`: `FFTWindowType` [Read-Only] — [Read-Only] Type of window to use. (FFTWindowType)

### `unreal.SynesthesiaSpectrumAnalyzer`
Inherits: `AudioAnalyzer` | Header: `SynesthesiaSpectrumAnalysis.h`

USynesthesiaSpectrumAnalysisAnalyzer

**Methods** (2):
  - `get_center_frequencies(sample_rate)` -> `Array [ float ]` — Get Center Frequencies
  - `get_num_center_frequencies()` -> `int32` — Get Num Center Frequencies

**Properties** (3):
  - `on_latest_spectrum_results`: `OnLatestSpectrumResults` — [Read-Write] Delegate to receive the latest per-channel Spectrum results. If bDownmixToMono setting ...
  - `on_spectrum_results`: `OnSpectrumResults` — [Read-Write] Delegate to receive all Spectrum results, per-channel, since last delegate call. If bDo...
  - `settings`: `SynesthesiaSpectrumAnalysisSettings` — [Read-Write] The settings for the SynesthesiaSpectrumAnalysis audio analyzer. (SynesthesiaSpectrumAn...

### `unreal.ConstantQFFTSizeEnum`
Inherits: `EnumBase` | Header: `ConstantQNRT.h`

EContantQFFTSizeEnum

**Properties** (9):
  - `LARGE`: `ConstantQFFTSizeEnum = Ellipsis` — 2048 5
  - `MAX`: `ConstantQFFTSizeEnum = Ellipsis` — 16384 8
  - `MEDIUM`: `ConstantQFFTSizeEnum = Ellipsis` — 1024 4
  - `MIN`: `ConstantQFFTSizeEnum = Ellipsis` — 64 0
  - `SMALL`: `ConstantQFFTSizeEnum = Ellipsis` — 512 3
  - `XX_LARGE`: `ConstantQFFTSizeEnum = Ellipsis` — 8192 7
  - `XX_SMALL`: `ConstantQFFTSizeEnum = Ellipsis` — 128 1
  - `X_LARGE`: `ConstantQFFTSizeEnum = Ellipsis` — 4096 6
  - `X_SMALL`: `ConstantQFFTSizeEnum = Ellipsis` — 256 2

### `unreal.ConstantQNormalizationEnum`
Inherits: `EnumBase` | Header: `ConstantQNRT.h`

EConstantQNormalizationEnum

**Properties** (3):
  - `EQUAL_AMPLITUDE`: `ConstantQNormalizationEnum = Ellipsis` — Normalize bands by their maximum values. Will result in relatively strong high frequences because th...
  - `EQUAL_ENERGY`: `ConstantQNormalizationEnum = Ellipsis` — Normalize bands by energy. Good when using power spectrum. 1
  - `EQUAL_EUCLIDEAN_NORM`: `ConstantQNormalizationEnum = Ellipsis` — Normalize bands by euclidean norm. Good when using magnitude spectrum. 0

### `unreal.LoudnessCurveTypeEnum`
Inherits: `EnumBase` | Header: `Loudness.h`

ELoudnessCurveTypeEnum

**Properties** (6):
  - `A`: `LoudnessCurveTypeEnum = Ellipsis` — Loudness Curve A Weighting. Commonly used in environmental sound measurements. Best for low level so...
  - `B`: `LoudnessCurveTypeEnum = Ellipsis` — Loudness Curve B Weighting. Relative to âAâ, gives more precedence to frequencies below 1kHz. 1
  - `C`: `LoudnessCurveTypeEnum = Ellipsis` — Loudness Curve C Weighting. Relative to âAâ and âBâ, gives more precedence to frequencies be...
  - `D`: `LoudnessCurveTypeEnum = Ellipsis` — Loudness Curve D Weighting. Similar to âBâ but with an emphasis on presence in the 2kHz-6KHz fre...
  - `K`: `LoudnessCurveTypeEnum = Ellipsis` — Loudness Curve K Weighting. Correlates with subjective perception of recorded broadcast content. 4
  - `NONE`: `LoudnessCurveTypeEnum = Ellipsis` — No loudness curve weighting. 5

### `unreal.LoudnessNRTCurveTypeEnum`
Inherits: `EnumBase` | Header: `LoudnessNRT.h`

ELoudnessNRTCurveTypeEnum

**Properties** (6):
  - `A`: `LoudnessNRTCurveTypeEnum = Ellipsis` — Loudness Curve A Weighting. Commonly used in environmental sound measurements. Best for low level so...
  - `B`: `LoudnessNRTCurveTypeEnum = Ellipsis` — Loudness Curve B Weighting. Relative to âAâ, gives more precedence to frequencies below 1kHz. 1
  - `C`: `LoudnessNRTCurveTypeEnum = Ellipsis` — Loudness Curve C Weighting. Relative to âAâ and âBâ, gives more precedence to frequencies be...
  - `D`: `LoudnessNRTCurveTypeEnum = Ellipsis` — Loudness Curve D Weighting. Similar to âBâ but with an emphasis on presence in the 2kHz-6KHz fre...
  - `K`: `LoudnessNRTCurveTypeEnum = Ellipsis` — Loudness Curve K Weighting. Correlates with subjective perception of recorded broadcast content. 4
  - `NONE`: `LoudnessNRTCurveTypeEnum = Ellipsis` — No loudness curve weighting. 5

### `unreal.MeterPeakType`
Inherits: `EnumBase` | Header: `Meter.h`

EMeter Peak Type

**Properties** (3):
  - `MEAN_SQUARED`: `MeterPeakType = Ellipsis` — 0
  - `PEAK`: `MeterPeakType = Ellipsis` — 2
  - `ROOT_MEAN_SQUARED`: `MeterPeakType = Ellipsis` — 1

### `unreal.OnConstantQResults`
Inherits: `MulticastDelegateBase` | Header: `ConstantQ.h`

Delegate to receive all ConstantQ results per channel (time-stamped in an array) since last delegate call. If bDownmixToMono setting is true, results will be in channel index 0.

### `unreal.OnLatestConstantQResults`
Inherits: `MulticastDelegateBase` | Header: `ConstantQ.h`

Delegate to receive only the most recent overall ConstantQ result per channel. If bDownmixToMono setting is true, results will be in channel index 0.

### `unreal.OnLatestOverallLoudnessResults`
Inherits: `MulticastDelegateBase` | Header: `Loudness.h`

Delegate to receive only the most recent overall loudness result.

### `unreal.OnLatestOverallMeterResults`
Inherits: `MulticastDelegateBase` | Header: `Meter.h`

Delegate to receive only the most recent overall meter results.

### `unreal.OnLatestPerChannelLoudnessResults`
Inherits: `MulticastDelegateBase` | Header: `Loudness.h`

Delegate to receive only the most recent overall loudness result per channel.

### `unreal.OnLatestPerChannelMeterResults`
Inherits: `MulticastDelegateBase` | Header: `Meter.h`

Delegate to receive only the most recent overall meter result per channel.

### `unreal.OnLatestSpectrumResults`
Inherits: `MulticastDelegateBase` | Header: `SynesthesiaSpectrumAnalysis.h`

Delegate to receive only the most recent overall spectrum result per channel. If bDownmixToMono setting is true, results will be in channel index 0.

### `unreal.OnOverallLoudnessResults`
Inherits: `MulticastDelegateBase` | Header: `Loudness.h`

Delegate to receive all overall loudness results (time-stamped in an array) since last delegate call.

### `unreal.OnOverallMeterResults`
Inherits: `MulticastDelegateBase` | Header: `Meter.h`

Delegate to receive all overall loudness results (time-stamped in an array) since last delegate call.

### `unreal.OnPerChannelLoudnessResults`
Inherits: `MulticastDelegateBase` | Header: `Loudness.h`

Delegate to receive all loudness results per channel (time-stamped in an array) since last delegate call.

### `unreal.OnPerChannelMeterResults`
Inherits: `MulticastDelegateBase` | Header: `Meter.h`

Delegate to receive all meter results per channel (time-stamped in an array) since last delegate call.

### `unreal.OnSpectrumResults`
Inherits: `MulticastDelegateBase` | Header: `SynesthesiaSpectrumAnalysis.h`

Delegate to receive all spectrum results per channel (time-stamped in an array) since last delegate call. If bDownmixToMono setting is true, results will be in channel index 0.
