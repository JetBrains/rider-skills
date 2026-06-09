# UE Python API — LiveLinkCapabilities Module

**14 types** from the `LiveLinkCapabilities` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `IngestCapability_AudioOptions`, `IngestCapability_VideoOptions`, `IngestCapability_Options`, `IngestCapability_ProcessHandle`, `IngestCapability_ProcessResult`, `IngestCapability_TakeInformation`, `IngestCapability_UpdateTakeListCallback`, `LiveLinkDeviceCapability_Ingest`, `IngestCapability_ImagePixelFormat`, `IngestCapability_ImageRotation`, `IngestCapability_ProcessConfig`, `ProcessFinishReporter`, `ProcessProgressReporter`, `UpdateTakeListCallback`

---

## Classes

### `unreal.IngestCapability_AudioOptions`
Inherits: `StructBase` | Header: `IngestCapability_Options.h`

Ingest Capability Audio Options

**Properties** (2):
  - `file_name_prefix`: `str` — [Read-Write] (str)
  - `format`: `str` — [Read-Write] (str)

### `unreal.IngestCapability_VideoOptions`
Inherits: `StructBase` | Header: `IngestCapability_Options.h`

Ingest Capability Video Options

**Properties** (4):
  - `file_name_prefix`: `str` — [Read-Write] (str)
  - `format`: `str` — [Read-Write] (str)
  - `pixel_format`: `IngestCapability_ImagePixelFormat` — [Read-Write] (IngestCapability_ImagePixelFormat)
  - `rotation`: `IngestCapability_ImageRotation` — [Read-Write] (IngestCapability_ImageRotation)

### `unreal.IngestCapability_Options`
Inherits: `Object` | Header: `IngestCapability_Options.h`

Ingest Capability Options

**Properties** (5):
  - `audio`: `IngestCapability_AudioOptions` — [Read-Write] (IngestCapability_AudioOptions)
  - `download_directory`: `str` — [Read-Write] (str)
  - `upload_host_name`: `str` — [Read-Write] (str)
  - `video`: `IngestCapability_VideoOptions` — [Read-Write] (IngestCapability_VideoOptions)
  - `working_directory`: `str` — [Read-Write] (str)

### `unreal.IngestCapability_ProcessHandle`
Inherits: `Object` | Header: `IngestCapability_ProcessHandle.h`

Ingest Capability Process Handle

**Methods** (4):
  - `get_take_id()` -> `int32` — Get Take Id
  - `is_done()` -> `bool` — Is Done
  - `on_process_finish_reporter_dynamic()` -> `ProcessFinishReporter` — On Process Finish Reporter Dynamic
  - `on_process_progress_reporter_dynamic()` -> `ProcessProgressReporter` — On Process Progress Reporter Dynamic

### `unreal.IngestCapability_ProcessResult`
Inherits: `Object` | Header: `IngestCapability_ProcessHandle.h`

Ingest Capability Process Result

**Methods** (2):
  - `is_error()` -> `bool` — Is Error
  - `is_valid()` -> `bool` — Is Valid

**Properties** (2):
  - `code`: `int` [Read-Only] — [Read-Only] (int32)
  - `message`: `Text` [Read-Only] — [Read-Only] (Text)

### `unreal.IngestCapability_TakeInformation`
Inherits: `Object` | Header: `IngestCapability_TakeInformation.h`

Ingest Capability Take Information

**Methods** (1):
  - `get_date_time_string()` -> `str` — Get Date Time String

**Properties** (4):
  - `date_time`: `DateTime` [Read-Only] — [Read-Only] (DateTime)
  - `device_name`: `str` [Read-Only] — [Read-Only] (str)
  - `slate_name`: `str` [Read-Only] — [Read-Only] (str)
  - `take_number`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.IngestCapability_UpdateTakeListCallback`
Inherits: `Object` | Header: `IngestCapability_UpdateTakeList.h`

Ingest Capability Update Take List Callback

### `unreal.LiveLinkDeviceCapability_Ingest`
Inherits: `LiveLinkDeviceCapability` | Header: `LiveLinkDeviceCapability_Ingest.h`

Live Link Device Capability Ingest

**Methods** (6):
  - `cancel_ingest_process(process_handle)` -> `None` — Cancel Ingest Process
  - `create_ingest_process(take_id, process_config)` -> `IngestCapability_ProcessHandle` — Create Ingest Process
  - `get_take_identifiers()` -> `Array [ int32 ]` — Get Take Identifiers
  - `get_take_information(take_id)` -> `IngestCapability_TakeInformation` — Get Take Information
  - `run_ingest_process(process_handle, options)` -> `None` — Run Ingest Process
  - `update_take_list(callback)` -> `None` — Update Take List

### `unreal.IngestCapability_ImagePixelFormat`
Inherits: `EnumBase` | Header: `IngestCapability_Options.h`

EIngest Capability Image Pixel Format

**Properties** (11):
  - `DEFAULT`: `IngestCapability_ImagePixelFormat = Ellipsis` — 0
  - `F_MONO`: `IngestCapability_ImagePixelFormat = Ellipsis` — 9
  - `U16_MONO`: `IngestCapability_ImagePixelFormat = Ellipsis` — 8
  - `U8_BGR`: `IngestCapability_ImagePixelFormat = Ellipsis` — 1
  - `U8_BGRA`: `IngestCapability_ImagePixelFormat = Ellipsis` — 3
  - `U8_I420`: `IngestCapability_ImagePixelFormat = Ellipsis` — 5
  - `U8_I444`: `IngestCapability_ImagePixelFormat = Ellipsis` — 4
  - `U8_MONO`: `IngestCapability_ImagePixelFormat = Ellipsis` — 7
  - `U8_NV12`: `IngestCapability_ImagePixelFormat = Ellipsis` — 6
  - `U8_RGB`: `IngestCapability_ImagePixelFormat = Ellipsis` — 0
  - `U8_RGBA`: `IngestCapability_ImagePixelFormat = Ellipsis` — 2

### `unreal.IngestCapability_ImageRotation`
Inherits: `EnumBase` | Header: `IngestCapability_Options.h`

EIngest Capability Image Rotation

**Properties** (5):
  - `CW_180`: `IngestCapability_ImageRotation = Ellipsis` — 2
  - `CW_270`: `IngestCapability_ImageRotation = Ellipsis` — 3
  - `CW_90`: `IngestCapability_ImageRotation = Ellipsis` — 1
  - `DEFAULT`: `IngestCapability_ImageRotation = Ellipsis` — 0
  - `NONE`: `IngestCapability_ImageRotation = Ellipsis` — 0

### `unreal.IngestCapability_ProcessConfig`
Inherits: `EnumBase` | Header: `IngestCapability_ProcessHandle.h`

EIngest Capability Process Config

**Properties** (2):
  - `DOWNLOAD`: `IngestCapability_ProcessConfig = Ellipsis` — Download only. Copies data to specified download directory A Take Archive device can be used to inge...
  - `INGEST`: `IngestCapability_ProcessConfig = Ellipsis` — Ingest data to specified UE/UEFN client 3

### `unreal.ProcessFinishReporter`
Inherits: `DelegateBase` | Header: `IngestCapability_ProcessHandle.h`

Process Finish Reporter Delegate Signature

### `unreal.ProcessProgressReporter`
Inherits: `DelegateBase` | Header: `IngestCapability_ProcessHandle.h`

Process Progress Reporter Delegate Signature

### `unreal.UpdateTakeListCallback`
Inherits: `DelegateBase` | Header: `IngestCapability_UpdateTakeList.h`

Update Take List Callback Delegate Signature
