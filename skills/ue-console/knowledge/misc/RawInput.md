# UE Python API — RawInput Module

**2 types** from the `RawInput` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RegisteredDeviceInfo`, `RawInputFunctionLibrary`

---

## Classes

### `unreal.RegisteredDeviceInfo`
Inherits: `StructBase` | Header: `RawInputFunctionLibrary.h`

Registered Device Info

**Properties** (4):
  - `device_name`: `str` [Read-Only] — [Read-Only] Driver supplied device name (str)
  - `handle`: `int` [Read-Only] — [Read-Only] (int32)
  - `product_id`: `int` [Read-Only] — [Read-Only] Integer representation of the product ID (e.g. 0xC262 = 49762) (int32)
  - `vendor_id`: `int` [Read-Only] — [Read-Only] Integer representation of the vendor ID (e.g. 0xC262 = 49762) (int32)

### `unreal.RawInputFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `RawInputFunctionLibrary.h`

Raw Input Function Library

**Methods** (1):
  - `get_registered_devices()` -> `Array [ RegisteredDeviceInfo ]` [classmethod] — Get Registered Devices
