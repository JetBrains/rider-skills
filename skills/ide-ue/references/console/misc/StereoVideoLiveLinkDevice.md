# UE Python API — StereoVideoLiveLinkDevice Module

**2 types** from the `StereoVideoLiveLinkDevice` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `StereoVideoLiveLinkDevice`, `StereoVideoLiveLinkDeviceSettings`

---

## Classes

### `unreal.StereoVideoLiveLinkDevice`
Inherits: `BaseIngestLiveLinkDevice` | Header: `StereoVideoLiveLinkDevice.h`

Ingest subfolders containing pairs of video files as stereo takes

**Methods** (8):
  - `can_set_hardware_id()` -> `bool` — Returns whether itâs valid to call SetHardwareId() on this device at this time.
  - `connect()` -> `bool` — Attempt to establish a connection.
  - `disconnect()` -> `bool` — Attempt to terminate an existing connection.
  - `get_connection_delegate()` -> `ConnectionDelegate` — Get Connection Delegate
  - `get_connection_status()` -> `LiveLinkDeviceConnectionStatus` — Get the current connection state.
  - `get_hardware_id()` -> `str` — Retrieve hardware identifier (serial number, network endpoint, etc).
  - `get_settings()` -> `StereoVideoLiveLinkDeviceSettings` — Get Settings
  - `set_hardware_id(hardware_id)` -> `bool` — Set hardware identifier (serial number, network endpoint, etc).

### `unreal.StereoVideoLiveLinkDeviceSettings`
Inherits: `LiveLinkDeviceSettings` | Header: `StereoVideoLiveLinkDevice.h`

Stereo Video Live Link Device Settings

**Properties** (4):
  - `audio_discovery_expression`: `TakeDiscoveryExpression` — <Slate> - slate name <Name> - identifier for the camera in the stereo pair <Take> - take number <Any...
  - `display_name`: `str` — [Read-Write] (str)
  - `take_directory`: `DirectoryPath` — [Read-Write] Path to a directory containing the take(s) data (DirectoryPath)
  - `video_discovery_expression`: `TakeDiscoveryExpression` — <Slate> - slate name <Name> - identifier for the camera in the stereo pair <Take> - take number <Any...
