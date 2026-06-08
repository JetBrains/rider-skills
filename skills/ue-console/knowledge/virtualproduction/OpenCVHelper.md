# UE Python API — OpenCVHelper Module

**6 types** from the `OpenCVHelper` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `OpenCVArucoDetectedMarker`, `OpenCVLensDistortionParametersBase`, `OpenCVBlueprintFunctionLibrary`, `ArucoDictionary`, `OpenCVArucoDictionary`, `OpenCVArucoDictionarySize`

---

## Classes

### `unreal.OpenCVArucoDetectedMarker`
Inherits: `StructBase` | Header: `OpenCVBlueprintFunctionLibrary.h`

Open CVAruco Detected Marker

**Properties** (3):
  - `corners`: `None` — [Read-Write] (Array[Vector2D])
  - `id`: `int` — [Read-Write] (int32)
  - `pose`: `Transform` — [Read-Write] (Transform)

### `unreal.OpenCVLensDistortionParametersBase`
Inherits: `StructBase` | Header: `OpenCVHelper.h`

Mathematic camera model for lens distortion/undistortion. Camera matrix =

**Properties** (11):
  - `c`: `Vector2D` — [Read-Write] Camera matrixâs normalized Cx and Cy. (Vector2D)
  - `f`: `Vector2D` — [Read-Write] Camera matrixâs normalized Fx and Fy. (Vector2D)
  - `k1`: `float` — [Read-Write] Radial parameter #1. (float)
  - `k2`: `float` — [Read-Write] Radial parameter #2. (float)
  - `k3`: `float` — [Read-Write] Radial parameter #3. (float)
  - `k4`: `float` — [Read-Write] Radial parameter #4. (float)
  - `k5`: `float` — [Read-Write] Radial parameter #5. (float)
  - `k6`: `float` — [Read-Write] Radial parameter #6. (float)
  - `p1`: `float` — [Read-Write] Tangential parameter #1. (float)
  - `p2`: `float` — [Read-Write] Tangential parameter #2. (float)
  - `use_fisheye_model`: `bool` — [Read-Write] Camera lens needs Fisheye camera model. (bool)

### `unreal.OpenCVBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `OpenCVBlueprintFunctionLibrary.h`

Open CVBlueprint Function Library

**Methods** (2):
  - `open_cv_aruco_detect_markers()` [classmethod] — Detects all ArUco markers in the supplied image
  - `open_cv_chessboard_detect_corners()` [classmethod] — Detects a camera calibration chessboard in the supplied image

### `unreal.ArucoDictionary`
Inherits: `EnumBase` | Header: `OpenCVHelper.h`

EAruco Dictionary

**Properties** (18):
  - `DICT_4X4_100`: `ArucoDictionary = Ellipsis` — 2
  - `DICT_4X4_1000`: `ArucoDictionary = Ellipsis` — 4
  - `DICT_4X4_250`: `ArucoDictionary = Ellipsis` — 3
  - `DICT_4X4_50`: `ArucoDictionary = Ellipsis` — 1
  - `DICT_5X5_100`: `ArucoDictionary = Ellipsis` — 6
  - `DICT_5X5_1000`: `ArucoDictionary = Ellipsis` — 8
  - `DICT_5X5_250`: `ArucoDictionary = Ellipsis` — 7
  - `DICT_5X5_50`: `ArucoDictionary = Ellipsis` — 5
  - `DICT_6X6_100`: `ArucoDictionary = Ellipsis` — 10
  - `DICT_6X6_1000`: `ArucoDictionary = Ellipsis` — 12
  - `DICT_6X6_250`: `ArucoDictionary = Ellipsis` — 11
  - `DICT_6X6_50`: `ArucoDictionary = Ellipsis` — 9
  - `DICT_7X7_100`: `ArucoDictionary = Ellipsis` — 14
  - `DICT_7X7_1000`: `ArucoDictionary = Ellipsis` — 16
  - `DICT_7X7_250`: `ArucoDictionary = Ellipsis` — 15
  - `DICT_7X7_50`: `ArucoDictionary = Ellipsis` — 13
  - `DICT_ARUCO_ORIGINAL`: `ArucoDictionary = Ellipsis` — 17
  - `NONE`: `ArucoDictionary = Ellipsis` — 0

### `unreal.OpenCVArucoDictionary`
Inherits: `EnumBase` | Header: `OpenCVBlueprintFunctionLibrary.h`

EOpen CVAruco Dictionary

**Properties** (5):
  - `DICT4X4`: `OpenCVArucoDictionary = Ellipsis` — 0
  - `DICT5X5`: `OpenCVArucoDictionary = Ellipsis` — 1
  - `DICT6X6`: `OpenCVArucoDictionary = Ellipsis` — 2
  - `DICT7X7`: `OpenCVArucoDictionary = Ellipsis` — 3
  - `DICT_ORIGINAL`: `OpenCVArucoDictionary = Ellipsis` — 4

### `unreal.OpenCVArucoDictionarySize`
Inherits: `EnumBase` | Header: `OpenCVBlueprintFunctionLibrary.h`

EOpen CVAruco Dictionary Size

**Properties** (4):
  - `DICT_SIZE100`: `OpenCVArucoDictionarySize = Ellipsis` — 1
  - `DICT_SIZE1000`: `OpenCVArucoDictionarySize = Ellipsis` — 3
  - `DICT_SIZE250`: `OpenCVArucoDictionarySize = Ellipsis` — 2
  - `DICT_SIZE50`: `OpenCVArucoDictionarySize = Ellipsis` — 0
