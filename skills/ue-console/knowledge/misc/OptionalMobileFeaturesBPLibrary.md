# UE Python API — OptionalMobileFeaturesBPLibrary Module

**1 types** from the `OptionalMobileFeaturesBPLibrary` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `OptionalMobileFeaturesBPLibrary`

---

## Classes

### `unreal.OptionalMobileFeaturesBPLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `OptionalMobileFeaturesBPLibrary.h`

Optional Mobile Features BPLibrary

**Methods** (4):
  - `are_headphones_plugged_in()` -> `bool` [classmethod] — Returns if headphones are plugged into the device
  - `get_battery_level()` -> `int32` [classmethod] — Returns the current battery level of the device in a range of [0, 100]
  - `get_battery_temperature()` -> `float` [classmethod] — Returns the deviceâs temperature, in Celsius
  - `get_volume_state()` -> `int32` [classmethod] — Returns the current volume state of the device in a range of 0-100 (%)
