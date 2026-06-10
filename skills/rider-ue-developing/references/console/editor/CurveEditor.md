# UE Python API — CurveEditor Module

**10 types** from the `CurveEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CurveEditorBakeFilterRange`, `GaussianParams`, `SmartReduceParams`, `CurveEditorBakeFilter`, `CurveEditorEulerFilter`, `CurveEditorFilterBase`, `CurveEditorGaussianFilter`, `CurveEditorReduceFilter`, `CurveEditorSmartReduceFilter`, `CurveEditorSmartSnapFilter`

---

## Classes

### `unreal.CurveEditorBakeFilterRange`
Inherits: `StructBase` | Header: `CurveEditorBakeFilter.h`

Curve Editor Bake Filter Range

**Properties** (2):
  - `max`: `FrameNumber` — [Read-Write] (FrameNumber)
  - `min`: `FrameNumber` — [Read-Write] (FrameNumber)

### `unreal.GaussianParams`
Inherits: `StructBase` | Header: `CurveEditorGaussianFilter.h`

Gaussian Params

**Properties** (1):
  - `kernel_width`: `int` — [Read-Write] Sigma that determines how âfatâ the filter is, higher value means fatter width (int...

### `unreal.SmartReduceParams`
Inherits: `StructBase` | Header: `CurveEditorSmartReduceFilter.h`

Smart Reduce Params

**Properties** (2):
  - `sample_rate`: `FrameRate` — [Read-Write] Rate at which the curve should be sampled to compare against value tolerance. (FrameRat...
  - `tolerance_percentage`: `float` — [Read-Write] Tolerance threshold, set as a percentage of the valueâs range (float)

### `unreal.CurveEditorBakeFilter`
Inherits: `CurveEditorFilterBase` | Header: `CurveEditorBakeFilter.h`

Curve Editor Bake Filter

**Properties** (6):
  - `bake_interval`: `FrameNumber` — [Read-Write] The interval between baked keys. (FrameNumber)
  - `bake_interval_in_seconds`: `float` — [Read-Write] The interval between baked keys when there is no valid Display Rate and Tick Resolution...
  - `custom_range`: `CurveEditorBakeFilterRange` — [Read-Write] Specifies a custom range to use for baking (CurveEditorBakeFilterRange)
  - `custom_range_max_in_seconds`: `float` — [Read-Write] Specifies a custom range to use for baking when there is no valid Display Rate and Tick...
  - `custom_range_min_in_seconds`: `float` — [Read-Write] Specifies a custom range to use for baking when there is no valid Display Rate and Tick...
  - `custom_range_override`: `bool` — [Read-Write] When enabled, CustomRange will be used for the bake region. Otherwise the selected keys...

### `unreal.CurveEditorEulerFilter`
Inherits: `CurveEditorFilterBase` | Header: `CurveEditorEulerFilter.h`

Curve Editor Euler Filter

### `unreal.CurveEditorFilterBase`
Inherits: `Object` | Header: `CurveEditorFilterBase.h`

An abstract base class for Curve Editor Filtering. If you inherit from this class your class will automatically show up in the Curve Editorâs Filter dropdown. This allows projects to easily create c...

### `unreal.CurveEditorGaussianFilter`
Inherits: `CurveEditorFilterBase` | Header: `CurveEditorGaussianFilter.h`

Curve Editor Gaussian Filter

**Properties** (1):
  - `gaussian_params`: `GaussianParams` — [Read-Write] (GaussianParams)

### `unreal.CurveEditorReduceFilter`
Inherits: `CurveEditorFilterBase` | Header: `CurveEditorReduceFilter.h`

Curve Editor Reduce Filter

**Properties** (3):
  - `sample_rate`: `FrameRate` — [Read-Write] Rate at which the curve should be sampled to compare against value tolerance. (FrameRat...
  - `tolerance`: `float` — [Read-Write] Minimum change in values required for a key to be considered distinct enough to keep. (...
  - `try_remove_user_set_tangent_keys`: `bool` — [Read-Write] Flag whether or not to use SampleRate for sampling between evaluated keys, which allows...

### `unreal.CurveEditorSmartReduceFilter`
Inherits: `CurveEditorFilterBase` | Header: `CurveEditorSmartReduceFilter.h`

Curve Editor Smart Reduce Filter

**Properties** (1):
  - `smart_reduce_params`: `SmartReduceParams` — [Read-Write] (SmartReduceParams)

### `unreal.CurveEditorSmartSnapFilter`
Inherits: `CurveEditorFilterBase` | Header: `CurveEditorSmartSnapFilter.h`

Curve Editor Smart Snap Filter
