# UE Python API — MonoVideoLiveLinkDevice Module

**2 types** from the `MonoVideoLiveLinkDevice` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MonoVideoLiveLinkDevice`, `MonoVideoLiveLinkDeviceSettings`

---

## Classes

### `unreal.MonoVideoLiveLinkDevice`
Inherits: `BaseIngestLiveLinkDevice` | Header: `MonoVideoLiveLinkDevice.h`

Ingest video files as mono takes

**Methods** (8):
  - `can_set_hardware_id()` -> `bool` — Returns whether itâs valid to call SetHardwareId() on this device at this time.
  - `connect()` -> `bool` — Attempt to establish a connection.
  - `disconnect()` -> `bool` — Attempt to terminate an existing connection.
  - `get_connection_delegate()` -> `ConnectionDelegate` — Get Connection Delegate
  - `get_connection_status()` -> `LiveLinkDeviceConnectionStatus` — Get the current connection state.
  - `get_hardware_id()` -> `str` — Retrieve hardware identifier (serial number, network endpoint, etc).
  - `get_settings()` -> `MonoVideoLiveLinkDeviceSettings` — Get Settings
  - `set_hardware_id(hardware_id)` -> `bool` — Set hardware identifier (serial number, network endpoint, etc).

### `unreal.MonoVideoLiveLinkDeviceSettings`
Inherits: `LiveLinkDeviceSettings` | Header: `MonoVideoLiveLinkDevice.h`

Mono Video Live Link Device Settings

**Properties** (3):
  - `display_name`: `str` — [Read-Write] (str)
  - `take_directory`: `DirectoryPath` — [Read-Write] Path to a directory containing the take(s) data (DirectoryPath)
  - `video_discovery_expression`: `TakeDiscoveryExpression` — <Slate> - slate name <Name> - identifier for the camera <Take> - take number <Any> - any string <Aut...
