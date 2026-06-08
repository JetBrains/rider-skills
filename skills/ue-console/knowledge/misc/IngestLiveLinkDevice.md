# UE Python API — IngestLiveLinkDevice Module

**2 types** from the `IngestLiveLinkDevice` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BaseIngestLiveLinkDevice`, `DesiredPlayerMediaSource`

---

## Classes

### `unreal.BaseIngestLiveLinkDevice`
Inherits: `LiveLinkDevice` | Header: `BaseIngestLiveLinkDevice.h`

Base class that provides default implementations of core ingest capability functions.

**Methods** (6):
  - `cancel_ingest_process(process_handle)` -> `None` — Cancel Ingest Process
  - `create_ingest_process(take_id, process_config)` -> `IngestCapability_ProcessHandle` — Create Ingest Process
  - `get_take_identifiers()` -> `Array [ int32 ]` — Get Take Identifiers
  - `get_take_information(take_id)` -> `IngestCapability_TakeInformation` — Get Take Information
  - `run_ingest_process(process_handle, options)` -> `None` — Run Ingest Process
  - `update_take_list(callback)` -> `None` — Update Take List

### `unreal.DesiredPlayerMediaSource`
Inherits: `FileMediaSource` | Header: `CaptureExtractTimecode.h`

Desired Player Media Source
