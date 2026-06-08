# UE Python API — CameraCalibrationEditor Module

**9 types** from the `CameraCalibrationEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ImagePoints`, `ObjectPoints`, `AutoCalibrationTest`, `LensDistortionSolver`, `LensDistortionSolverOpenCV`, `LensFileExporter`, `LensFileFactoryNew`, `LensFileImporterFactory`, `CalibrationFlags`

---

## Classes

### `unreal.ImagePoints`
Inherits: `StructBase` | Header: `CameraCalibrationSolver.h`

An array of 2D image points associated with a single calibration image Structure is needed because Blueprints and Python do not support arrays of arrays.

**Properties** (1):
  - `points`: `None` — [Read-Write] 2D image points in an image (Array[Vector2D])

### `unreal.ObjectPoints`
Inherits: `StructBase` | Header: `CameraCalibrationSolver.h`

An array of 3D object points associated with a single calibration image. Structure is needed because Blueprints and Python do not support arrays of arrays.

**Properties** (1):
  - `points`: `None` — [Read-Write] 3D object points in an image (Array[Vector])

### `unreal.AutoCalibrationTest`
Inherits: `Object` | Header: `TestCameraCalibration.h`

Exposes RunTests to BP and Python for ease of running a test in the editor

**Methods** (1):
  - `run_tests(filename, log_verbose_test_description = False)` -> `None` [classmethod] — Runs the calibration test set defined in the input file

### `unreal.LensDistortionSolver`
Inherits: `Object` | Header: `CameraCalibrationSolver.h`

Base lens distortion solver class that can be inherited from in Blueprints or Python

**Methods** (4):
  - `get_display_name()` -> `Text` — Get the name of this solver class for displaying in the editor UI
  - `is_enabled()` -> `bool` — Get the name of this solver class for displaying in the editor UI
  - `is_running()` -> `bool` — Returns true if the solver is currently running, and false if it has been cancelled. The solver should call this in crit...
  - `solve(object_point_array, image_point_array, image_size, focal_length, image_center, distortion_parameters, camera_poses, target_poses, lens_model, pixel_aspect, solver_flags)` -> `DistortionCalibrationResult` — Calibrate camera intrinsics and distortion from a set of input 3D-2D point correspondences and initial camera intrinsics...

### `unreal.LensDistortionSolverOpenCV`
Inherits: `LensDistortionSolver` | Header: `CameraCalibrationSolver.h`

Lens Distortion Solver class, supporting anamorphic and spherical models The implementation is largely based on the implementation of calibrateCamera from OpenCV: https://github.com/opencv/opencv

### `unreal.LensFileExporter`
Inherits: `Exporter` | Header: `LensFileExporter.h`

Lens File Exporter

### `unreal.LensFileFactoryNew`
Inherits: `Factory` | Header: `LensFileFactoryNew.h`

Implements a factory for ULensFile objects.

### `unreal.LensFileImporterFactory`
Inherits: `Factory` | Header: `LensFileImporterFactory.h`

Lens File Importer Factory

### `unreal.CalibrationFlags`
Inherits: `EnumBase` | Header: `CameraCalibrationSolver.h`

Flags used to modify the execution of the calibration solver

**Properties** (10):
  - `FIX_ASPECT_RATIO`: `CalibrationFlags = Ellipsis` — The solver will fix all distortion values at 0 64
  - `FIX_DISTORTION`: `CalibrationFlags = Ellipsis` — The solver will not optimize the camera extrinsics 32
  - `FIX_EXTRINSICS`: `CalibrationFlags = Ellipsis` — The solver will not optimize the principal point 16
  - `FIX_FOCAL_LENGTH`: `CalibrationFlags = Ellipsis` — The solver will skip extrinsics initialization an use the input Camera Poses as the starting value f...
  - `FIX_PRINCIPAL_POINT`: `CalibrationFlags = Ellipsis` — The solver will not optimize the focal length 8
  - `GROUP_CAMERA_POSES`: `CalibrationFlags = Ellipsis` — The solver will solve for an offset for each imageâs input 3D object points 256
  - `NONE`: `CalibrationFlags = Ellipsis` — 0
  - `SOLVE_TARGET_OFFSET`: `CalibrationFlags = Ellipsis` — The solver will respect the input aspect ratio when solving for Fx and Fy 128
  - `USE_EXTRINSIC_GUESS`: `CalibrationFlags = Ellipsis` — The solver will skip intrinsics initialization an use the input values of Focal Length and Image Cen...
  - `USE_INTRINSIC_GUESS`: `CalibrationFlags = Ellipsis` — 1
