# UE Python API — FilesystemLiveLinkDevice Module

**2 types** from the `FilesystemLiveLinkDevice` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FilesystemLiveLinkDevice`, `FilesystemLiveLinkDeviceSettings`

---

## Classes

### `unreal.FilesystemLiveLinkDevice`
Inherits: `BaseIngestLiveLinkDevice` | Header: `FilesystemLiveLinkDevice.h`

Ingest take archives (described by .cptake files) and legacy Capture Manager takes

**Methods** (8):
  - `can_set_hardware_id()` -> `bool` — Returns whether itâs valid to call SetHardwareId() on this device at this time.
  - `connect()` -> `bool` — Attempt to establish a connection.
  - `disconnect()` -> `bool` — Attempt to terminate an existing connection.
  - `get_connection_delegate()` -> `ConnectionDelegate` — Get Connection Delegate
  - `get_connection_status()` -> `LiveLinkDeviceConnectionStatus` — Get the current connection state.
  - `get_hardware_id()` -> `str` — Retrieve hardware identifier (serial number, network endpoint, etc).
  - `get_settings()` -> `FilesystemLiveLinkDeviceSettings` — Get Settings
  - `set_hardware_id(hardware_id)` -> `bool` — Set hardware identifier (serial number, network endpoint, etc).

### `unreal.FilesystemLiveLinkDeviceSettings`
Inherits: `LiveLinkDeviceSettings` | Header: `FilesystemLiveLinkDevice.h`

Filesystem Live Link Device Settings

**Properties** (2):
  - `display_name`: `str` — [Read-Write] (str)
  - `take_directory`: `DirectoryPath` — [Read-Write] Path to a directory containing the take(s) data (DirectoryPath)
