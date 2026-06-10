# UE Python API — TimeManagement Module

**11 types** from the `TimeManagement` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TimedDataChannelSampleTime`, `TimedDataInputEvaluationData`, `CatchupFixedRateCustomTimeStep`, `FixedFrameRateCustomTimeStep`, `GenlockedCustomTimeStep`, `GenlockedFixedRateCustomTimeStep`, `GenlockedTimecodeProvider`, `TimeManagementLibrary`, `TimeSynchronizationSource`, `TimedDataInputEvaluationType`, `TimedDataInputState`

---

## Classes

### `unreal.TimedDataChannelSampleTime`
Inherits: `StructBase` | Header: `ITimedDataInput.h`

Timed Data Channel Sample Time

### `unreal.TimedDataInputEvaluationData`
Inherits: `StructBase` | Header: `ITimedDataInput.h`

Timed Data Input Evaluation Data

**Properties** (2):
  - `distance_to_newest_sample_seconds`: `float` — [Read-Write] Distance between evaluation time and newest sample in seconds (float)
  - `distance_to_oldest_sample_seconds`: `float` — [Read-Write] Distance between evaluation time and newest sample in seconds (float)

### `unreal.CatchupFixedRateCustomTimeStep`
Inherits: `FixedFrameRateCustomTimeStep` | Header: `CatchupFixedRateCustomTimeStep.h`

Control the Engine TimeStep via a fixed frame rate that catches up with real time.

### `unreal.FixedFrameRateCustomTimeStep`
Inherits: `EngineCustomTimeStep` | Header: `FixedFrameRateCustomTimeStep.h`

Class to control the Engine TimeStep via a FixedFrameRate

### `unreal.GenlockedCustomTimeStep`
Inherits: `FixedFrameRateCustomTimeStep` | Header: `GenlockedCustomTimeStep.h`

Class to control the Engine Timestep from a Genlock signal.

### `unreal.GenlockedFixedRateCustomTimeStep`
Inherits: `GenlockedCustomTimeStep` | Header: `GenlockedFixedRateCustomTimeStep.h`

Control the Engine TimeStep via a fixed frame rate.

### `unreal.GenlockedTimecodeProvider`
Inherits: `TimecodeProvider` | Header: `GenlockedTimecodeProvider.h`

This timecode provider base class will try to use the engine genlock sync to adjust its count.

### `unreal.TimeManagementLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `TimeManagementBlueprintLibrary.h`

Time Management Blueprint Library

**Methods** (18):
  - `add_frame_number_frame_number(a, b)` -> `FrameNumber` [classmethod] — Addition (FrameNumber A + FrameNumber B)
  - `add_frame_number_integer(a, b)` -> `FrameNumber` [classmethod] — Addition (FrameNumber A + int B)
  - `conv_frame_rate_to_interval(frame_rate)` -> `float` [classmethod] — Converts a FrameRate to an interval float representing the frame time in seconds ie: 1/30 returns 0.0333333
  - `conv_frame_rate_to_seconds(frame_rate)` -> `float` [classmethod] — Conv Frame Rate to Seconds deprecated: FrameRateToInterval replaces this function, which returns the expected result of ...
  - `conv_qualified_frame_time_to_seconds(frame_time)` -> `float` [classmethod] — Converts an QualifiedFrameTime to seconds.
  - `conv_timecode_to_string(timecode, force_sign_display = False)` -> `str` [classmethod] — Converts an Timecode to a string (hh:mm:ss:ff). If bForceSignDisplay then the number sign will always be prepended inste...
  - `divide_frame_number_integer(a, b)` -> `FrameNumber` [classmethod] — Divide (FrameNumber A / B)
  - `frame_number_to_integer(frame_number)` -> `int32` [classmethod] — Converts a FrameNumber to an int32 for use in functions that take int32 frame counts for convenience.
  - `get_timecode()` -> `Timecode` [classmethod] — Get the current timecode of the engine.
  - `get_timecode_frame_rate()` -> `FrameRate` [classmethod] — Gets the current timecode frame rate.
  - `is_valid_framerate(frame_rate)` -> `bool` [classmethod] — Verifies that this is a valid framerate with a non-zero denominator.
  - `is_valid_multiple_of(frame_rate, other_framerate)` -> `bool` [classmethod] — Checks if this framerate is an even multiple of another framerate, ie: 60 is a multiple of 30, but 59.94 is not.
  - `multiply_frame_number_integer(a, b)` -> `FrameNumber` [classmethod] — Multiply (FrameNumber A * B)
  - `multiply_seconds_frame_rate(time_in_seconds, frame_rate)` -> `FrameTime` [classmethod] — Multiplies a value in seconds against a FrameRate to get a new FrameTime.
  - `snap_frame_time_to_rate(source_time, source_rate, snap_to_rate)` -> `FrameTime` [classmethod] — Snaps the given SourceTime to the nearest frame in the specified Destination Framerate. Useful for determining the neare...
  - `subtract_frame_number_frame_number(a, b)` -> `FrameNumber` [classmethod] — Subtraction (FrameNumber A - FrameNumber B)
  - `subtract_frame_number_integer(a, b)` -> `FrameNumber` [classmethod] — Subtraction (FrameNumber A - int B)
  - `transform_time(source_time, source_rate, destination_rate)` -> `FrameTime` [classmethod] — Converts the specified time from one framerate to another framerate. This is useful for converting between tick resoluti...

### `unreal.TimeSynchronizationSource`
Inherits: `Object` | Header: `TimeSynchronizationSource.h`

Base class for sources to be used for time synchronization.

### `unreal.TimedDataInputEvaluationType`
Inherits: `EnumBase` | Header: `ITimedDataInput.h`

ETimed Data Input Evaluation Type

**Properties** (3):
  - `NONE`: `TimedDataInputEvaluationType = Ellipsis` — There is no special evaluation type for that input. 0
  - `PLATFORM_TIME`: `TimedDataInputEvaluationType = Ellipsis` — The input is evaluated from the engineâs time. Note that the engineâs time is relative to FPlatf...
  - `TIMECODE`: `TimedDataInputEvaluationType = Ellipsis` — The input is evaluated from the engineâs timecode. 1

### `unreal.TimedDataInputState`
Inherits: `EnumBase` | Header: `ITimedDataInput.h`

ETimed Data Input State

**Properties** (3):
  - `CONNECTED`: `TimedDataInputState = Ellipsis` — The input is connected. 0
  - `DISCONNECTED`: `TimedDataInputState = Ellipsis` — The input is not connected. 2
  - `UNRESPONSIVE`: `TimedDataInputState = Ellipsis` — The input is connected but no data is available. 1
