# UE Python API — TimecodeSynchronizer Module

**5 types** from the `TimecodeSynchronizer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TimecodeSynchronizerActiveTimecodedInputSource`, `TimecodeSynchronizer`, `TimecodeSynchronizationFrameRateSources`, `TimecodeSynchronizationSyncMode`, `TimecodeSynchronizationTimecodeType`

---

## Classes

### `unreal.TimecodeSynchronizerActiveTimecodedInputSource`
Inherits: `StructBase` | Header: `TimecodeSynchronizer.h`

Timecode Synchronizer Active Timecoded Input Source

### `unreal.TimecodeSynchronizer`
Inherits: `TimecodeProvider` | Header: `TimecodeSynchronizer.h`

Timecode Synchronizer

### `unreal.TimecodeSynchronizationFrameRateSources`
Inherits: `EnumBase` | Header: `TimecodeSynchronizer.h`

Enumerates possible framerate source

**Properties** (2):
  - `CUSTOM_FRAME_RATE`: `TimecodeSynchronizationFrameRateSources = Ellipsis` — Custom Frame Rate selected by the user. 1
  - `ENGINE_CUSTOM_TIME_STEP_FRAME_RATE`: `TimecodeSynchronizationFrameRateSources = Ellipsis` — Frame Rate of engine custom time step if it is of type UFixedFrameRateCustomTimeStep. 0

### `unreal.TimecodeSynchronizationSyncMode`
Inherits: `EnumBase` | Header: `TimecodeSynchronizer.h`

Defines the various modes that the synchronizer can use to try and achieve synchronization.

**Properties** (3):
  - `AUTO`: `TimecodeSynchronizationSyncMode = Ellipsis` — Engine will try and automatically determine an appropriate offset based on what frames are available...
  - `AUTO_OLDEST`: `TimecodeSynchronizationSyncMode = Ellipsis` — The same as Auto except that instead of trying to find a suitable timecode nearest to the
newest com...
  - `USER_DEFINED_OFFSET`: `TimecodeSynchronizationSyncMode = Ellipsis` — User will specify an offset (number of frames) from the Timecode Source (see ETimecodeSycnrhonizatio...

### `unreal.TimecodeSynchronizationTimecodeType`
Inherits: `EnumBase` | Header: `TimecodeSynchronizer.h`

Enumerates Timecode source type.

**Properties** (3):
  - `DEFAULT_PROVIDER`: `TimecodeSynchronizationTimecodeType = Ellipsis` — Use the configured Engine Default Timecode provider. 0
  - `INPUT_SOURCE`: `TimecodeSynchronizationTimecodeType = Ellipsis` — Use one of the InputSource as the Timecode Provider. 2
  - `TIMECODE_PROVIDER`: `TimecodeSynchronizationTimecodeType = Ellipsis` — Use an external Timecode Provider to provide the timecode to follow. 1
