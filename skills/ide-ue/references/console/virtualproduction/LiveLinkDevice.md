# UE Python API — LiveLinkDevice Module

**14 types** from the `LiveLinkDevice` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LiveLinkDeviceCreateError`, `LiveLinkDeviceCreateResult`, `ConnectionDelegate`, `LiveLinkDevice`, `LiveLinkDevice_BasicTest`, `LiveLinkDeviceCapability`, `LiveLinkDeviceCapability_BasicTest`, `LiveLinkDeviceCapability_Connection`, `LiveLinkDeviceCapability_Recording`, `LiveLinkDeviceSettings`, `LiveLinkDeviceSubsystem`, `DeviceHealth`, `LiveLinkDeviceConnectionStatus`, `DeviceConnectionStatusChangedDynamic`

---

## Classes

### `unreal.LiveLinkDeviceCreateError`
Inherits: `StructBase` | Header: `LiveLinkDeviceSubsystem.h`

Live Link Device Create Error

### `unreal.LiveLinkDeviceCreateResult`
Inherits: `StructBase` | Header: `LiveLinkDeviceSubsystem.h`

Live Link Device Create Result

**Properties** (2):
  - `device`: `LiveLinkDevice` — [Read-Write] (LiveLinkDevice)
  - `device_id`: `Guid` — [Read-Write] (Guid)

### `unreal.ConnectionDelegate`
Inherits: `Object` | Header: `LiveLinkDeviceCapability_Connection.h`

Connection Delegate

### `unreal.LiveLinkDevice`
Inherits: `Object` | Header: `LiveLinkDevice.h`

Abstract base class for all Live Link devices.

**Methods** (3):
  - `get_device_health()` -> `DeviceHealth` — At-a-glance health/âseverityâ of the device.
  - `get_display_name()` -> `Text` — Human-readable display name for this device.
  - `get_health_text()` -> `Text` — Human-readable explanation for the current device health.

### `unreal.LiveLinkDevice_BasicTest`
Inherits: `LiveLinkDevice` | Header: `LiveLinkDevice_BasicTest.h`

Live Link Device Basic Test

**Methods** (2):
  - `get_value()` -> `int32` — Get Value
  - `set_value(value)` -> `None` — Set Value

### `unreal.LiveLinkDeviceCapability`
Inherits: `Interface` | Header: `LiveLinkDeviceCapability.h`

Live Link Device Capability

### `unreal.LiveLinkDeviceCapability_BasicTest`
Inherits: `LiveLinkDeviceCapability` | Header: `LiveLinkDevice_BasicTest.h`

Live Link Device Capability Basic Test

**Methods** (2):
  - `get_value()` -> `int32` — Get Value
  - `set_value(value)` -> `None` — Set Value

### `unreal.LiveLinkDeviceCapability_Connection`
Inherits: `LiveLinkDeviceCapability` | Header: `LiveLinkDeviceCapability_Connection.h`

Live Link Device Capability Connection

**Methods** (7):
  - `can_set_hardware_id()` -> `bool` — Returns whether itâs valid to call SetHardwareId() on this device at this time.
  - `connect()` -> `bool` — Attempt to establish a connection.
  - `disconnect()` -> `bool` — Attempt to terminate an existing connection.
  - `get_connection_delegate()` -> `ConnectionDelegate` — Get Connection Delegate
  - `get_connection_status()` -> `LiveLinkDeviceConnectionStatus` — Get the current connection state.
  - `get_hardware_id()` -> `str` — Retrieve hardware identifier (serial number, network endpoint, etc).
  - `set_hardware_id(hardware_id)` -> `bool` — Set hardware identifier (serial number, network endpoint, etc).

### `unreal.LiveLinkDeviceCapability_Recording`
Inherits: `LiveLinkDeviceCapability` | Header: `LiveLinkDeviceCapability_Recording.h`

Live Link Device Capability Recording

**Methods** (3):
  - `is_recording()` -> `bool` — Is Recording
  - `start_recording()` -> `bool` — Start Recording
  - `stop_recording()` -> `bool` — Stop Recording

### `unreal.LiveLinkDeviceSettings`
Inherits: `Object` | Header: `LiveLinkDevice.h`

Live Link Device Settings

### `unreal.LiveLinkDeviceSubsystem`
Inherits: `EngineSubsystem` | Header: `LiveLinkDeviceSubsystem.h`

Device repository with lifecycle notifications. Facilitates cached lookups related to device and capability classes.

**Methods** (2):
  - `get_devices_by_capability(capability)` -> `Array [ LiveLinkDevice ]` — Get Devices by Capability
  - `get_devices_by_class(device_class)` -> `Array [ LiveLinkDevice ]` — Get Devices by Class

### `unreal.DeviceHealth`
Inherits: `EnumBase` | Header: `LiveLinkDevice.h`

EDevice Health

**Properties** (4):
  - `ERROR`: `DeviceHealth = Ellipsis` — 3
  - `INFO`: `DeviceHealth = Ellipsis` — 1
  - `NOMINAL`: `DeviceHealth = Ellipsis` — 0
  - `WARNING`: `DeviceHealth = Ellipsis` — 2

### `unreal.LiveLinkDeviceConnectionStatus`
Inherits: `EnumBase` | Header: `LiveLinkDeviceCapability_Connection.h`

Device connection states.

**Properties** (4):
  - `CONNECTED`: `LiveLinkDeviceConnectionStatus = Ellipsis` — 2
  - `CONNECTING`: `LiveLinkDeviceConnectionStatus = Ellipsis` — 1
  - `DISCONNECTED`: `LiveLinkDeviceConnectionStatus = Ellipsis` — 0
  - `DISCONNECTING`: `LiveLinkDeviceConnectionStatus = Ellipsis` — 3

### `unreal.DeviceConnectionStatusChangedDynamic`
Inherits: `MulticastDelegateBase` | Header: `LiveLinkDeviceCapability_Connection.h`

Device Connection Status Changed Dynamic Delegate Signature
