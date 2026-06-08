# UE Python API — LedWallCalibration Module

**1 types** from the `LedWallCalibration` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LedWallArucoGenerationOptions`

---

## Classes

### `unreal.LedWallArucoGenerationOptions`
Inherits: `StructBase` | Header: `LedWallArucoGenerationOptions.h`

Structure that can be passed to the Aruco generation function

**Properties** (5):
  - `aruco_dictionary`: `ArucoDictionary` — [Read-Write] Aruco dictionary to use when generating the markers (ArucoDictionary)
  - `marker_id`: `int` — [Read-Write] Starting marker Id. Arucos will be generated with consecutive Marker Ids, starting from...
  - `place_modulus`: `int` — [Read-Write] Used to avoid using up the symbols in the dictionary as quickly.
Will place the next ma...
  - `texture_height`: `int` — [Read-Write] Height of the texture that will contain the Aruco markers (int32)
  - `texture_width`: `int` — [Read-Write] Width of the texture that will contain the Aruco markers (int32)
