# UE Python API — CPSLiveLinkDevice Module

**4 types** from the `CPSLiveLinkDevice` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DeviceIpAddress`, `ToggleConnectAction`, `LiveLinkFaceDevice`, `LiveLinkFaceDeviceSettings`

---

## Classes

### `unreal.DeviceIpAddress`
Inherits: `StructBase` | Header: `DeviceIpAddressCustomization.h`

Device Ip Address

**Properties** (1):
  - `ip_address_string`: `str` — [Read-Write] (str)

### `unreal.ToggleConnectAction`
Inherits: `StructBase` | Header: `ToggleConnectActionCustomization.h`

Toggle Connect Action

### `unreal.LiveLinkFaceDevice`
Inherits: `BaseIngestLiveLinkDevice` | Header: `LiveLinkFaceDevice.h`

Use for ingest from the Live Link Face app and control recording

**Methods** (11):
  - `can_set_hardware_id()` -> `bool` — Returns whether itâs valid to call SetHardwareId() on this device at this time.
  - `connect()` -> `bool` — Attempt to establish a connection.
  - `disconnect()` -> `bool` — Attempt to terminate an existing connection.
  - `get_connection_delegate()` -> `ConnectionDelegate` — Get Connection Delegate
  - `get_connection_status()` -> `LiveLinkDeviceConnectionStatus` — Get the current connection state.
  - `get_hardware_id()` -> `str` — Retrieve hardware identifier (serial number, network endpoint, etc).
  - `get_settings()` -> `LiveLinkFaceDeviceSettings` — Get Settings
  - `is_recording()` -> `bool` — Is Recording
  - `set_hardware_id(hardware_id)` -> `bool` — Set hardware identifier (serial number, network endpoint, etc).
  - `start_recording()` -> `bool` — Start Recording
  - `stop_recording()` -> `bool` — Stop Recording

### `unreal.LiveLinkFaceDeviceSettings`
Inherits: `LiveLinkDeviceSettings` | Header: `LiveLinkFaceDevice.h`

Live Link Face Device Settings

**Properties** (3):
  - `display_name`: `str` — [Read-Write] (str)
  - `ip_address`: `DeviceIpAddress` — [Read-Write] (DeviceIpAddress)
  - `port`: `int` — [Read-Write] (int32)
