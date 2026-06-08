# UE Python API — CaptureManagerEditor Module

**4 types** from the `CaptureManagerEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LiveLinkHubFetchTakesResult`, `LiveLinkHubTakeMetadata`, `LiveLinkHubCaptureDevice`, `LiveLinkHubCaptureDeviceFactory`

---

## Classes

### `unreal.LiveLinkHubFetchTakesResult`
Inherits: `StructBase` | Header: `ULiveLinkHubCaptureDevice.h`

Live Link Hub Fetch Takes Result

**Properties** (2):
  - `status`: `IngestCapability_ProcessResult` [Read-Only] — [Read-Only] (IngestCapability_ProcessResult)
  - `takes`: `None` [Read-Only] — [Read-Only] (Array[LiveLinkHubTakeMetadata])

### `unreal.LiveLinkHubTakeMetadata`
Inherits: `StructBase` | Header: `ULiveLinkHubCaptureDevice.h`

Live Link Hub Take Metadata

**Properties** (1):
  - `metadata`: `IngestCapability_TakeInformation` [Read-Only] — [Read-Only] (IngestCapability_TakeInformation)

### `unreal.LiveLinkHubCaptureDevice`
Inherits: `Object` | Header: `ULiveLinkHubCaptureDevice.h`

Live Link Hub Capture Device

**Methods** (5):
  - `download_take(take, download_directory)` -> `IngestCapability_ProcessResult` — Download Take
  - `fetch_takes()` -> `LiveLinkHubFetchTakesResult` — Fetch Takes
  - `import_take(take, conversion_settings)` -> `IngestCapability_ProcessResult` — Import Take
  - `start(timeout_seconds)` -> `IngestCapability_ProcessResult` — Start
  - `stop()` -> `IngestCapability_ProcessResult` — Stop

**Properties** (1):
  - `name`: `str` — [Read-Write] (str)

### `unreal.LiveLinkHubCaptureDeviceFactory`
Inherits: `Object` | Header: `ULiveLinkHubCaptureDevice.h`

Live Link Hub Capture Device Factory

**Methods** (1):
  - `create_device_by_class(name, device_class, settings)` -> `LiveLinkHubCaptureDevice` — Create Device by Class
