# UE Python API — TimedDataMonitor Module

**12 types** from the `TimedDataMonitor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TimedDataMonitorCalibrationParameters`, `TimedDataMonitorCalibrationResult`, `TimedDataMonitorChannelIdentifier`, `TimedDataMonitorInputIdentifier`, `TimedDataMonitorTimeCorrectionParameters`, `TimedDataMonitorTimeCorrectionResult`, `TimedDataMonitorSubsystem`, `TimedDataMonitorCalibrationReturnCode`, `TimedDataMonitorEvaluationState`, `TimedDataMonitorInputEnabled`, `TimedDataMonitorTimeCorrectionReturnCode`, `TimedDataIdentifierListChangedSignature`

---

## Classes

### `unreal.TimedDataMonitorCalibrationParameters`
Inherits: `StructBase` | Header: `TimedDataMonitorCalibration.h`

Timed Data Monitor Calibration Parameters

**Properties** (8):
  - `amount_of_seconds_to_wait_after_statistic_reset`: `float` — [Read-Write] Before calibration, allow to reset the statistics. (float)
  - `buffer_resize_allowed`: `bool` — [Read-Write] If no calibration is possible, are we allowed to increase the size of the buffer. (bool...
  - `buffer_shrink_allowed`: `bool` — [Read-Write] When resizing buffer, do we allow shrinking them. (bool)
  - `failed_if_buffer_cant_be_resize`: `bool` — [Read-Write] When resizing buffer, failed the calibration if a buffer couldnât be resize. (bool)
  - `number_of_retries`: `int` — [Read-Write] When needed, how many retry is allowed. (int32)
  - `number_of_standard_deviation`: `int` — [Read-Write] When using STD, how many should we use. (int32)
  - `reset_statistics_before_using_standard_deviation`: `bool` — [Read-Write] Before calibration, allow to reset the statistics. (bool)
  - `use_standard_deviation`: `bool` — [Read-Write] When calibrating, ensure that the evaluation is included inside the STD. (bool)

### `unreal.TimedDataMonitorCalibrationResult`
Inherits: `StructBase` | Header: `TimedDataMonitorCalibration.h`

Timed Data Monitor Calibration Result

**Properties** (2):
  - `failure_input_identifiers`: `None` [Read-Only] — [Read-Only] (Array[TimedDataMonitorInputIdentifier])
  - `return_code`: `TimedDataMonitorCalibrationReturnCode` [Read-Only] — [Read-Only] (TimedDataMonitorCalibrationReturnCode)

### `unreal.TimedDataMonitorChannelIdentifier`
Inherits: `StructBase` | Header: `TimedDataMonitorTypes.h`

Timed Data Monitor Channel Identifier

### `unreal.TimedDataMonitorInputIdentifier`
Inherits: `StructBase` | Header: `TimedDataMonitorTypes.h`

Timed Data Monitor Input Identifier

### `unreal.TimedDataMonitorTimeCorrectionParameters`
Inherits: `StructBase` | Header: `TimedDataMonitorCalibration.h`

Timed Data Monitor Time Correction Parameters

**Properties** (5):
  - `buffer_resize_allowed`: `bool` — [Read-Write] If no calibration is possible, are we allowed to increase the size of the buffer. (bool...
  - `buffer_shrink_allowed`: `bool` — [Read-Write] When resizing buffer, do we allow shrinking them. (bool)
  - `failed_if_buffer_cant_be_resize`: `bool` — [Read-Write] When resizing buffer, failed the calibration if a buffer couldnât be resize. (bool)
  - `number_of_standard_deviation`: `int` — [Read-Write] When using STD, how many should we use. (int32)
  - `use_standard_deviation`: `bool` — [Read-Write] When calibrating, ensure that the evaluation is included inside the STD. (bool)

### `unreal.TimedDataMonitorTimeCorrectionResult`
Inherits: `StructBase` | Header: `TimedDataMonitorCalibration.h`

Timed Data Monitor Time Correction Result

**Properties** (2):
  - `failure_channel_identifiers`: `None` [Read-Only] — [Read-Only] (Array[TimedDataMonitorChannelIdentifier])
  - `return_code`: `TimedDataMonitorTimeCorrectionReturnCode` [Read-Only] — [Read-Only] (TimedDataMonitorTimeCorrectionReturnCode)

### `unreal.TimedDataMonitorSubsystem`
Inherits: `EngineSubsystem` | Header: `TimedDataMonitorSubsystem.h`

Timed Data Monitor Subsystem

**Methods** (51):
  - `apply_time_correction(identifier, time_correction_parameters)` -> `TimedDataMonitorTimeCorrectionResult` — Assume all data samples were produce at the same time and align them with the current platformâs time
  - `calibrate_latent(world_context_object, latent_info, calibration_parameters)` -> `TimedDataMonitorCalibrationResult` — Change the Timecode Provider offset to align all inputs and channels.
  - `does_channel_exist(identifier)` -> `bool` — Return true if the identifier is a valid channel.
  - `does_input_exist(identifier)` -> `bool` — Return true if the identifier is a valid input.
  - `get_all_channels()` -> `Array [ TimedDataMonitorChannelIdentifier ]` — Get the list of all the channels.
  - `get_all_enabled_channels()` -> `Array [ TimedDataMonitorChannelIdentifier ]` — Get the list of all the channels that are enabled.
  - `get_all_inputs()` -> `Array [ TimedDataMonitorInputIdentifier ]` — Get the list of all the inputs.
  - `get_channel_buffer_overflow_stat(identifier)` -> `int32` — Returns the number of buffer overflows detected by that input since the last reset.
  - `get_channel_buffer_underflow_stat(identifier)` -> `int32` — Returns the number of buffer underflows detected by that input since the last reset.
  - `get_channel_connection_state(identifier)` -> `TimedDataInputState` — Get the state the channel.
  - `get_channel_data_buffer_size(identifier)` -> `int32` — If the channel does support it, get the current maximum sample count of channel.
  - `get_channel_display_name(identifier)` -> `Text` — Return the display name of an input.
  - `get_channel_evaluation_distance_to_newest_sample_mean(identifier)` -> `float` — Returns the average distance, in seconds, between evaluation time and newest sample
  - `get_channel_evaluation_distance_to_newest_sample_standard_deviation(identifier)` -> `float` — Returns the standard deviation of the distance, in seconds, between evaluation time and newest sample
  - `get_channel_evaluation_distance_to_oldest_sample_mean(identifier)` -> `float` — Returns the average distance, in seconds, between evaluation time and oldest sample
  - `get_channel_evaluation_distance_to_oldest_sample_standard_deviation(identifier)` -> `float` — Returns the standard deviation of the distance, in seconds, between evaluation time and oldest sample
  - `get_channel_evaluation_state(identifier)` -> `TimedDataMonitorEvaluationState` — Get the evaluation state of the channel.
  - `get_channel_frame_data_times(identifier)` -> `Array [ TimedDataChannelSampleTime ]` — Get the sample times for every frame in the channel
  - `get_channel_frame_dropped_stat(identifier)` -> `int32` — Returns the number of frames dropped by that input since the last reset.
  - `get_channel_input(identifier)` -> `TimedDataMonitorInputIdentifier` — Return the input of this channel.
  - `get_channel_last_evaluation_data_stat(identifier)` -> `TimedDataInputEvaluationData` — Retrieves information about last evaluation Returns true if identifier was found
  - `get_channel_newest_data_time(identifier)` -> `TimedDataChannelSampleTime` — Get the channel latest sample time.
  - `get_channel_number_of_samples(identifier)` -> `int32` — Get the number of data samples available.
  - `get_channel_oldest_data_time(identifier)` -> `TimedDataChannelSampleTime` — Get the channel oldest sample time.
  - `get_evaluation_state()` -> `TimedDataMonitorEvaluationState` — Get the worst evaluation state of all the inputs.
  - `get_input_channels(identifier)` -> `Array [ TimedDataMonitorChannelIdentifier ]` — Return the list of all channels that are part of the input.
  - `get_input_connection_state(identifier)` -> `TimedDataInputState` — Get the worst state of all the channels of that input.
  - `get_input_data_buffer_size(identifier)` -> `int32` — Get the size of the buffer used by the input.
  - `get_input_display_name(identifier)` -> `Text` — Return the display name of an input.
  - `get_input_enabled(identifier)` -> `TimedDataMonitorInputEnabled` — Is the input enabled in the monitor.
  - `get_input_evaluation_distance_to_newest_sample_mean(identifier)` -> `float` — Returns the max average distance, in seconds, between evaluation time and newest sample
  - `get_input_evaluation_distance_to_newest_sample_standard_deviation(identifier)` -> `float` — Returns the standard deviation of the distance, in seconds, between evaluation time and newest sample
  - `get_input_evaluation_distance_to_oldest_sample_mean(identifier)` -> `float` — Returns the min average distance, in seconds, between evaluation time and oldest sample
  - `get_input_evaluation_distance_to_oldest_sample_standard_deviation(identifier)` -> `float` — Returns the standard deviation of the distance, in seconds, between evaluation time and oldest sample
  - `get_input_evaluation_offset_in_frames(identifier)` -> `float` — Get the offset in frames (see GetEvaluationType) used at evaluation.
  - `get_input_evaluation_offset_in_seconds(identifier)` -> `float` — Get the offset in seconds or frames (see GetEvaluationType) used at evaluation.
  - `get_input_evaluation_state(identifier)` -> `TimedDataMonitorEvaluationState` — Get the worst evaluation state of all the channels of that input.
  - `get_input_evaluation_type(identifier)` -> `TimedDataInputEvaluationType` — Get how the input is evaluated type.
  - `get_input_frame_rate(identifier)` -> `FrameRate` — Get the frame rate at which the samples is produce.
  - `get_input_newest_data_time(identifier)` -> `TimedDataChannelSampleTime` — Get the latest sample time of all the channel in this input.
  - `get_input_oldest_data_time(identifier)` -> `TimedDataChannelSampleTime` — Get the oldest sample time of all the channel in this input.
  - `is_channel_enabled(identifier)` -> `bool` — Is the channel enabled in the monitor.
  - `is_data_buffer_size_controlled_by_input(identifier)` -> `bool` — Does the channel support a different buffer size than itâs input.
  - `reset_all_buffer_stats()` -> `None` — Reset the stat of all the inputs.
  - `set_channel_data_buffer_size(identifier, buffer_size)` -> `None` — If the channel does support it, set the maximum sample count of the channel.
  - `set_channel_enabled(identifier, enabled)` -> `None` — Enable or disable an input from the monitor. The input will still be evaluated but stats will not be tracked and the wil...
  - `set_input_data_buffer_size(identifier, buffer_size)` -> `None` — Set the size of the buffer used by the input.
  - `set_input_enabled(identifier, enabled)` -> `None` — Set all channels for the input enabled in the monitor.
  - `set_input_evaluation_offset_in_frames(identifier, frames)` -> `None` — Set the offset in frames (see GetEvaluationType) used at evaluation.
  - `set_input_evaluation_offset_in_seconds(identifier, seconds)` -> `None` — Set the offset in seconds or frames (see GetEvaluationType) used at evaluation.
  - `set_input_evaluation_type(identifier, evaluation)` -> `None` — Set how the input is evaluated type.

**Properties** (1):
  - `on_identifier_list_changed_dynamic`: `TimedDataIdentifierListChangedSignature` — [Read-Write] Delegate of when an element is added or removed. (TimedDataIdentifierListChangedSignatu...

### `unreal.TimedDataMonitorCalibrationReturnCode`
Inherits: `EnumBase` | Header: `TimedDataMonitorCalibration.h`

ETimed Data Monitor Calibration Return Code

**Properties** (10):
  - `FAILED_BUFFER_COULD_NOT_BE_RESIZE`: `TimedDataMonitorCalibrationReturnCode = Ellipsis` — Failed. A resize was requested but it was not able to do so. 6
  - `FAILED_INVALID_EVALUATION_TYPE`: `TimedDataMonitorCalibrationReturnCode = Ellipsis` — Failed. At least one input has an evaluation type that is not timecode. 3
  - `FAILED_INVALID_FRAME_RATE`: `TimedDataMonitorCalibrationReturnCode = Ellipsis` — Failed. At least one input doesnât have a defined frame rate. 4
  - `FAILED_NO_DATA_BUFFERED`: `TimedDataMonitorCalibrationReturnCode = Ellipsis` — Failed. At least one input doesnât have data buffered. 5
  - `FAILED_NO_TIMECODE`: `TimedDataMonitorCalibrationReturnCode = Ellipsis` — Failed. The timecode provider doesnât have a proper timecode value. 1
  - `FAILED_RESET`: `TimedDataMonitorCalibrationReturnCode = Ellipsis` — Failed. The calibration was manually reset. 7
  - `FAILED_UNRESPONSIVE_INPUT`: `TimedDataMonitorCalibrationReturnCode = Ellipsis` — Failed. At least one input is unresponsive. 2
  - `RETRY_INCREASE_BUFFER_SIZE`: `TimedDataMonitorCalibrationReturnCode = Ellipsis` — Retry. No interval could be found. Increase the buffer size. 9
  - `RETRY_NOT_ENOUGH_DATA`: `TimedDataMonitorCalibrationReturnCode = Ellipsis` — Retry. The buffer size is correct but they do not contain enough data to calibrate. 8
  - `SUCCEEDED`: `TimedDataMonitorCalibrationReturnCode = Ellipsis` — Success. The values were synchronized. 0

### `unreal.TimedDataMonitorEvaluationState`
Inherits: `EnumBase` | Header: `TimedDataMonitorSubsystem.h`

ETimed Data Monitor Evaluation State

**Properties** (4):
  - `DISABLED`: `TimedDataMonitorEvaluationState = Ellipsis` — 3
  - `INSIDE_RANGE`: `TimedDataMonitorEvaluationState = Ellipsis` — 2
  - `NO_SAMPLE`: `TimedDataMonitorEvaluationState = Ellipsis` — 0
  - `OUTSIDE_RANGE`: `TimedDataMonitorEvaluationState = Ellipsis` — 1

### `unreal.TimedDataMonitorInputEnabled`
Inherits: `EnumBase` | Header: `TimedDataMonitorSubsystem.h`

ETimed Data Monitor Input Enabled

**Properties** (3):
  - `DISABLED`: `TimedDataMonitorInputEnabled = Ellipsis` — 0
  - `ENABLED`: `TimedDataMonitorInputEnabled = Ellipsis` — 1
  - `MULTIPLE_VALUES`: `TimedDataMonitorInputEnabled = Ellipsis` — 2

### `unreal.TimedDataMonitorTimeCorrectionReturnCode`
Inherits: `EnumBase` | Header: `TimedDataMonitorCalibration.h`

ETimed Data Monitor Time Correction Return Code

**Properties** (8):
  - `FAILED_BUFFER_COULD_NOT_BE_RESIZE`: `TimedDataMonitorTimeCorrectionReturnCode = Ellipsis` — Failed. A resize was requested but it was not able to do so. 5
  - `FAILED_INVALID_INPUT`: `TimedDataMonitorTimeCorrectionReturnCode = Ellipsis` — Failed. The provided input doesnât exist. 1
  - `FAILED_NO_DATA_BUFFERED`: `TimedDataMonitorTimeCorrectionReturnCode = Ellipsis` — Failed. The channel doesnât have any data in itâs buffer to synchronized with. 4
  - `FAILED_NO_TIMECODE`: `TimedDataMonitorTimeCorrectionReturnCode = Ellipsis` — Failed. The timecode provider was not existing or not synchronized. 2
  - `FAILED_UNRESPONSIVE_INPUT`: `TimedDataMonitorTimeCorrectionReturnCode = Ellipsis` — Failed. At least one channel is unresponsive. 3
  - `RETRY_INCREASE_BUFFER_SIZE`: `TimedDataMonitorTimeCorrectionReturnCode = Ellipsis` — Retry. No interval could be found. Increase the buffer size. 7
  - `RETRY_NOT_ENOUGH_DATA`: `TimedDataMonitorTimeCorrectionReturnCode = Ellipsis` — Retry. The buffer size is correct but they do not contain enough data to to the time correction. 6
  - `SUCCEEDED`: `TimedDataMonitorTimeCorrectionReturnCode = Ellipsis` — Success. The values were synchronized. 0

### `unreal.TimedDataIdentifierListChangedSignature`
Inherits: `MulticastDelegateBase` | Header: `TimedDataMonitorSubsystem.h`

Timed Data Identifier List Changed Signature Delegate Signature
