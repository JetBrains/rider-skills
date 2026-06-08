# UE Python API — CurveEditorTools Module

**3 types** from the `CurveEditorTools` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CurveEditorFFTFilter`, `CurveEditorFFTFilterClass`, `CurveEditorFFTFilterType`

---

## Classes

### `unreal.CurveEditorFFTFilter`
Inherits: `CurveEditorFilterBase` | Header: `CurveEditorFFTFilter.h`

Curve Editor FFTFilter

**Properties** (4):
  - `cutoff_frequency`: `float` — [Read-Write] Normalized between 0-1. In a low pass filter, the lower the value is the smoother the o...
  - `order`: `int` — [Read-Write] The number of samples used to filter in the time domain. It maps how steep the roll off...
  - `response`: `CurveEditorFFTFilterClass` — [Read-Write] Which FFT filter implementation to use. (CurveEditorFFTFilterClass)
  - `type`: `CurveEditorFFTFilterType` — [Read-Write] Which frequencies are allowed through. For example, low-pass will let low frequency thr...

### `unreal.CurveEditorFFTFilterClass`
Inherits: `EnumBase` | Header: `CurveEditorFFTFilter.h`

ECurve Editor FFTFilter Class

**Properties** (2):
  - `BUTTERWORTH`: `CurveEditorFFTFilterClass = Ellipsis` — 0
  - `CHEBYSHEV`: `CurveEditorFFTFilterClass = Ellipsis` — 1

### `unreal.CurveEditorFFTFilterType`
Inherits: `EnumBase` | Header: `CurveEditorFFTFilter.h`

ECurve Editor FFTFilter Type

**Properties** (2):
  - `HIGHPASS`: `CurveEditorFFTFilterType = Ellipsis` — 1
  - `LOWPASS`: `CurveEditorFFTFilterType = Ellipsis` — 0
