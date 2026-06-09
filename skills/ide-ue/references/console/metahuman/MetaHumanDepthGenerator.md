# UE Python API — MetaHumanDepthGenerator Module

**2 types** from the `MetaHumanDepthGenerator` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaHumanDepthGenerator`, `MetaHumanGenerateDepthWindowOptions`

---

## Classes

### `unreal.MetaHumanDepthGenerator`
Inherits: `Object` | Header: `MetaHumanDepthGenerator.h`

MetaHuman Depth Generator

**Methods** (1):
  - `process(footage_capture_data, options)` -> `bool` — Process

### `unreal.MetaHumanGenerateDepthWindowOptions`
Inherits: `Object` | Header: `MetaHumanGenerateDepthWindowOptions.h`

MetaHuman Generate Depth Window Options

**Properties** (10):
  - `asset_name`: `str` — [Read-Write] (str)
  - `camera_calibration_override`: `CameraCalibration` — [Read-Write] (CameraCalibration)
  - `depth_precision`: `MetaHumanCaptureDepthPrecisionType` — [Read-Write] Precision of the calculated depth data. Full precision is more accurate, but requires m...
  - `depth_resolution`: `MetaHumanCaptureDepthResolutionType` — [Read-Write] Resolution scaling applied to the calculated depth data. Full resolution is more accura...
  - `image_sequence_root_path`: `DirectoryPath` — [Read-Write] (DirectoryPath)
  - `max_distance`: `float` — [Read-Write] The maximum cm from the camera expected for valid depth information.
Depth information ...
  - `min_distance`: `float` — [Read-Write] The minimum cm from the camera expected for valid depth information.
Depth information ...
  - `package_path`: `DirectoryPath` — [Read-Write] (DirectoryPath)
  - `should_compress_depth_files`: `bool` — [Read-Write] (bool)
  - `should_exclude_depth_files_from_import`: `bool` — [Read-Write] (bool)
