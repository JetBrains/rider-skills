# UE Python API — LiveLinkExampleDevice Module

**1 types** from the `LiveLinkExampleDevice` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LiveLinkExampleDevice`

---

## Classes

### `unreal.LiveLinkExampleDevice`
Inherits: `LiveLinkDevice` | Header: `LiveLinkExampleDevice.h`

Live Link Example Device

**Methods** (10):
  - `can_set_hardware_id()` -> `bool` — Returns whether itâs valid to call SetHardwareId() on this device at this time.
  - `connect()` -> `bool` — Attempt to establish a connection.
  - `disconnect()` -> `bool` — Attempt to terminate an existing connection.
  - `get_connection_delegate()` -> `ConnectionDelegate` — Get Connection Delegate
  - `get_connection_status()` -> `LiveLinkDeviceConnectionStatus` — Get the current connection state.
  - `get_hardware_id()` -> `str` — Retrieve hardware identifier (serial number, network endpoint, etc).
  - `is_recording()` -> `bool` — Is Recording
  - `set_hardware_id(hardware_id)` -> `bool` — Set hardware identifier (serial number, network endpoint, etc).
  - `start_recording()` -> `bool` — Start Recording
  - `stop_recording()` -> `bool` — Stop Recording
