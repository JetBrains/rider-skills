# UE Python API — MetaHumanCalibrationGenerator Module

**2 types** from the `MetaHumanCalibrationGenerator` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaHumanCalibrationGenerator`, `MetaHumanCalibrationGeneratorOptions`

---

## Classes

### `unreal.MetaHumanCalibrationGenerator`
Inherits: `Object` | Header: `MetaHumanCalibrationGenerator.h`

MetaHuman Calibration Generator

**Methods** (1):
  - `process(capture_data, options)` -> `bool` — Process

### `unreal.MetaHumanCalibrationGeneratorOptions`
Inherits: `Object` | Header: `MetaHumanCalibrationGeneratorOptions.h`

Options that will used as part of the camera calibration process

**Properties** (6):
  - `board_pattern_height`: `int` — [Read-Write] The width of the checkerboard used to record the calibration footage. (int32)
  - `board_pattern_width`: `int` — [Read-Write] The width of the checkerboard used to record the calibration footage. (int32)
  - `board_square_size`: `float` — [Read-Write] The square size of the checkerboard used to record the calibration footage. (float)
  - `package_path`: `DirectoryPath` — [Read-Write] Content Browser path where the Lens Files and Camera Calibration assets will be created...
  - `sample_rate`: `int` — [Read-Write] Rate at which the camera calibration process will sample frames. Example: 30 will use e...
  - `sharpness_threshold`: `float` — [Read-Write] Value represents the allowed blurriness (in pixels) of the frame that will be used for ...
