# UE Python API — TargetDeviceServicesScripting Module

**3 types** from the `TargetDeviceServicesScripting` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DeviceSnapshot`, `DeviceSnapshots`, `TargetDeviceServices`

---

## Classes

### `unreal.DeviceSnapshot`
Inherits: `StructBase` | Header: `TargetDeviceServicesBPFunctionLibrary.h`

The struct is designed to store device information

**Properties** (8):
  - `device_connection_type`: `str` [Read-Only] — [Read-Only] Stores deviceâs connection type. (str)
  - `device_id`: `str` [Read-Only] — [Read-Only] Stores deviceâs identifier. (str)
  - `device_type`: `str` [Read-Only] — [Read-Only] Stores deviceâs type. (str)
  - `host_name`: `str` [Read-Only] — [Read-Only] Stores deviceâs hostname. (str)
  - `is_connected`: `bool` [Read-Only] — [Read-Only] Stores deviceâs flag that is used to detect whether device
is connected (true) or disc...
  - `model_id`: `str` [Read-Only] — [Read-Only] Stores deviceâs model identifier. (str)
  - `name`: `str` [Read-Only] — [Read-Only] Stores deviceâs name. (str)
  - `operating_system`: `str` [Read-Only] — [Read-Only] Stores deviceâs operating system name. (str)

### `unreal.DeviceSnapshots`
Inherits: `StructBase` | Header: `TargetDeviceServicesBPFunctionLibrary.h`

The struct is a container class that stores instances of FDeviceSnapshot instances. It is a helper class to be used in blueprints as a value of TMap container.

**Properties** (1):
  - `entries`: `None` [Read-Only] — [Read-Only] Stores array of device snapshots. (Array[DeviceSnapshot])

### `unreal.TargetDeviceServices`
Inherits: `BlueprintFunctionLibrary` | Header: `TargetDeviceServicesBPFunctionLibrary.h`

The class declares a set of functions to be exposed to blueprints.

**Methods** (1):
  - `get_device_snapshots()` -> `Map [ str , DeviceSnapshots ]` [classmethod] — Fetches snapshots of devices that are available in the network.
