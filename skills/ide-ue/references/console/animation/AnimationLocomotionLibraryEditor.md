# UE Python API — AnimationLocomotionLibraryEditor Module

**2 types** from the `AnimationLocomotionLibraryEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DistanceCurveModifier`, `DistanceCurve_Axis`

---

## Classes

### `unreal.DistanceCurveModifier`
Inherits: `AnimationModifier` | Header: `DistanceCurveModifier.h`

Extracts traveling distance information from root motion and bakes it to a curve. A negative value indicates distance remaining to a stop or pivot point. A positive value indicates distance traveled f...

**Properties** (4):
  - `axis`: `DistanceCurve_Axis` — [Read-Write] Axes to calculate the distance value from. (DistanceCurve_Axis)
  - `curve_name`: `Name` — [Read-Write] Name for the generated curve. (Name)
  - `stop_at_end`: `bool` — [Read-Write] Root motion is considered to be stopped at the clipâs end (bool)
  - `stop_speed_threshold`: `float` — [Read-Write] Root motion speed must be below this threshold to be considered stopped. (float)

### `unreal.DistanceCurve_Axis`
Inherits: `EnumBase` | Header: `DistanceCurveModifier.h`

Axes to calculate the distance value from

**Properties** (7):
  - `X`: `DistanceCurve_Axis = Ellipsis` — 0
  - `XY`: `DistanceCurve_Axis = Ellipsis` — 3
  - `XYZ`: `DistanceCurve_Axis = Ellipsis` — 6
  - `XZ`: `DistanceCurve_Axis = Ellipsis` — 4
  - `Y`: `DistanceCurve_Axis = Ellipsis` — 1
  - `YZ`: `DistanceCurve_Axis = Ellipsis` — 5
  - `Z`: `DistanceCurve_Axis = Ellipsis` — 2
