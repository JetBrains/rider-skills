# UE Python API — ControlRigSpline Module

**21 types** from the `ControlRigSpline` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ControlRigSpline`, `RigUnit_ClosestParameterFromControlRigSpline`, `RigUnit_ControlRigSplineBase`, `RigUnit_ControlRigSplineFromPoints`, `RigUnit_ControlRigSplineFromTransforms`, `RigUnit_DrawControlRigSpline`, `RigUnit_FitChainToSplineCurve`, `RigUnit_FitChainToSplineCurveItemArray`, `RigUnit_FitSplineCurveToChain`, `RigUnit_FitSplineCurveToChainItemArray`, `RigUnit_GetLengthAtParamControlRigSpline`, `RigUnit_GetLengthControlRigSpline`, `RigUnit_ParameterAtPercentage`, `RigUnit_PositionFromControlRigSpline`, `RigUnit_SetSplinePoints`, `RigUnit_SetSplineTransforms`, `RigUnit_SplineConstraint`, `RigUnit_TangentFromControlRigSpline`, `RigUnit_TransformFromControlRigSpline`, `RigUnit_TransformFromControlRigSpline2`, ... (21 total)

---

## Classes

### `unreal.ControlRigSpline`
Inherits: `StructBase` | Header: `ControlRigSplineTypes.h`

Control Rig Spline

### `unreal.RigUnit_ClosestParameterFromControlRigSpline`
Inherits: `RigUnit_ControlRigSplineBase` | Header: `ControlRigSplineUnits.h`

Retrieves the closest U value from a given Spline and a position

**Properties** (3):
  - `position`: `Vector` — [Read-Write] (Vector)
  - `spline`: `ControlRigSpline` — [Read-Write] (ControlRigSpline)
  - `u`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigUnit_ControlRigSplineBase`
Inherits: `RigUnit` | Header: `ControlRigSplineUnits.h`

Rig Unit Control Rig Spline Base

### `unreal.RigUnit_ControlRigSplineFromPoints`
Inherits: `RigUnit_ControlRigSplineBase` | Header: `ControlRigSplineUnits.h`

Creates a Spline curve from an array of positions

**Properties** (7):
  - `closed`: `bool` — [Read-Write] (bool)
  - `compression`: `float` — [Read-Write] (float)
  - `points`: `None` — [Read-Write] (Array[Vector])
  - `samples_per_segment`: `int` — [Read-Write] (int32)
  - `spline`: `ControlRigSpline` [Read-Only] — [Read-Only] (ControlRigSpline)
  - `spline_mode`: `SplineType` — [Read-Write] (SplineType)
  - `stretch`: `float` — [Read-Write] (float)

### `unreal.RigUnit_ControlRigSplineFromTransforms`
Inherits: `RigUnit_ControlRigSplineBase` | Header: `ControlRigSplineUnits.h`

Creates a Spline curve from an array of positions

**Properties** (7):
  - `closed`: `bool` — [Read-Write] (bool)
  - `compression`: `float` — [Read-Write] (float)
  - `samples_per_segment`: `int` — [Read-Write] (int32)
  - `spline`: `ControlRigSpline` [Read-Only] — [Read-Only] (ControlRigSpline)
  - `spline_mode`: `SplineType` — [Read-Write] (SplineType)
  - `stretch`: `float` — [Read-Write] (float)
  - `transforms`: `None` — [Read-Write] (Array[Transform])

### `unreal.RigUnit_DrawControlRigSpline`
Inherits: `RigUnitMutable` | Header: `ControlRigSplineUnits.h`

Draws the given spline in the viewport

**Properties** (4):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `detail`: `int` — [Read-Write] (int32)
  - `spline`: `ControlRigSpline` — [Read-Write] (ControlRigSpline)
  - `thickness`: `float` — [Read-Write] (float)

### `unreal.RigUnit_FitChainToSplineCurve`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `ControlRigSplineUnits.h`

Fits a given chain to a spline curve. Additionally provides rotational control matching the features of the Distribute Rotation node.

**Properties** (14):
  - `alignment`: `ControlRigCurveAlignment` [Read-Only] — [Read-Only] Specifies how to align the chain on the curve (ControlRigCurveAlignment)
  - `debug_settings`: `RigUnit_FitChainToCurve_DebugSettings` — [Read-Write] (RigUnit_FitChainToCurve_DebugSettings)
  - `items`: `RigElementKeyCollection` — [Read-Write] The items to align (RigElementKeyCollection)
  - `maximum`: `float` [Read-Only] — [Read-Only] The maximum U value to use on the curve (float)
  - `minimum`: `float` [Read-Only] — [Read-Only] The minimum U value to use on the curve (float)
  - `pole_vector_position`: `Vector` — [Read-Write] The the position of the pole vector used for aligning the secondary axis.
Only has an e...
  - `primary_axis`: `Vector` — [Read-Write] The major axis being aligned - along the bone (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `rotation_ease_type`: `RigVMAnimEasingType` [Read-Only] — [Read-Only] The easing to use between to rotations. (RigVMAnimEasingType)
  - `rotations`: `None` — [Read-Write] The list of rotations to be applied along the curve (Array[RigUnit_FitChainToCurve_Rota...
  - `sampling_precision`: `int` [Read-Only] — [Read-Only] The number of samples to use on the curve. Clamped at 64. (int32)
  - `secondary_axis`: `Vector` — [Read-Write] The minor axis being aligned - towards the pole vector.
You can use (0.0, 0.0, 0.0) to ...
  - `spline`: `ControlRigSpline` — [Read-Write] The curve to align to (ControlRigSpline)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the rotation should be applied (float)

### `unreal.RigUnit_FitChainToSplineCurveItemArray`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `ControlRigSplineUnits.h`

Fits a given chain to a spline curve. Additionally provides rotational control matching the features of the Distribute Rotation node.

**Properties** (14):
  - `alignment`: `ControlRigCurveAlignment` [Read-Only] — [Read-Only] Specifies how to align the chain on the curve (ControlRigCurveAlignment)
  - `debug_settings`: `RigUnit_FitChainToCurve_DebugSettings` — [Read-Write] (RigUnit_FitChainToCurve_DebugSettings)
  - `items`: `None` — [Read-Write] The items to align (Array[RigElementKey])
  - `maximum`: `float` [Read-Only] — [Read-Only] The maximum U value to use on the curve (float)
  - `minimum`: `float` [Read-Only] — [Read-Only] The minimum U value to use on the curve (float)
  - `pole_vector_position`: `Vector` — [Read-Write] The the position of the pole vector used for aligning the secondary axis.
Only has an e...
  - `primary_axis`: `Vector` — [Read-Write] The major axis being aligned - along the bone (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `rotation_ease_type`: `RigVMAnimEasingType` [Read-Only] — [Read-Only] The easing to use between to rotations. (RigVMAnimEasingType)
  - `rotations`: `None` — [Read-Write] The list of rotations to be applied along the curve (Array[RigUnit_FitChainToCurve_Rota...
  - `sampling_precision`: `int` [Read-Only] — [Read-Only] The number of samples to use on the curve. Clamped at 64. (int32)
  - `secondary_axis`: `Vector` — [Read-Write] The minor axis being aligned - towards the pole vector.
You can use (0.0, 0.0, 0.0) to ...
  - `spline`: `ControlRigSpline` — [Read-Write] The curve to align to (ControlRigSpline)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the rotation should be applied (float)

### `unreal.RigUnit_FitSplineCurveToChain`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `ControlRigSplineUnits.h`

Fits a given spline curve to a chain.

**Properties** (2):
  - `items`: `RigElementKeyCollection` — [Read-Write] The items to align to (RigElementKeyCollection)
  - `spline`: `ControlRigSpline` — [Read-Write] The curve to align (ControlRigSpline)

### `unreal.RigUnit_FitSplineCurveToChainItemArray`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `ControlRigSplineUnits.h`

Fits a given spline curve to a chain.

**Properties** (2):
  - `items`: `None` — [Read-Write] The items to align to (Array[RigElementKey])
  - `spline`: `ControlRigSpline` — [Read-Write] The curve to align (ControlRigSpline)

### `unreal.RigUnit_GetLengthAtParamControlRigSpline`
Inherits: `RigUnit` | Header: `ControlRigSplineUnits.h`

Retrieves the length from a given Splin

**Properties** (3):
  - `length`: `float` [Read-Only] — [Read-Only] (float)
  - `spline`: `ControlRigSpline` — [Read-Write] (ControlRigSpline)
  - `u`: `float` — [Read-Write] (float)

### `unreal.RigUnit_GetLengthControlRigSpline`
Inherits: `RigUnit` | Header: `ControlRigSplineUnits.h`

Retrieves the length from a given Splin

**Properties** (2):
  - `length`: `float` [Read-Only] — [Read-Only] (float)
  - `spline`: `ControlRigSpline` — [Read-Write] (ControlRigSpline)

### `unreal.RigUnit_ParameterAtPercentage`
Inherits: `RigUnit_ControlRigSplineBase` | Header: `ControlRigSplineUnits.h`

Returns the U parameter of a spline given a length percentage (0.0 - 1.0)

**Properties** (3):
  - `percentage`: `float` — [Read-Write] (float)
  - `spline`: `ControlRigSpline` — [Read-Write] (ControlRigSpline)
  - `u`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigUnit_PositionFromControlRigSpline`
Inherits: `RigUnit_ControlRigSplineBase` | Header: `ControlRigSplineUnits.h`

Retrieves the position from a given Spline and U value

**Properties** (3):
  - `position`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `spline`: `ControlRigSpline` — [Read-Write] (ControlRigSpline)
  - `u`: `float` — [Read-Write] (float)

### `unreal.RigUnit_SetSplinePoints`
Inherits: `RigUnitMutable` | Header: `ControlRigSplineUnits.h`

Set the points of a spline, given a spline and an array of positions

**Properties** (2):
  - `points`: `None` — [Read-Write] (Array[Vector])
  - `spline`: `ControlRigSpline` — [Read-Write] (ControlRigSpline)

### `unreal.RigUnit_SetSplineTransforms`
Inherits: `RigUnitMutable` | Header: `ControlRigSplineUnits.h`

Set the points of a spline, given a spline and an array of positions

**Properties** (2):
  - `spline`: `ControlRigSpline` — [Read-Write] (ControlRigSpline)
  - `transforms`: `None` — [Read-Write] (Array[Transform])

### `unreal.RigUnit_SplineConstraint`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `ControlRigSplineUnits.h`

Fits a given chain to a spline curve. Additionally provides rotational control matching the features of the Distribute Rotation node.

**Properties** (8):
  - `alignment`: `ControlRigCurveAlignment` [Read-Only] — [Read-Only] Specifies how to align the chain on the curve (ControlRigCurveAlignment)
  - `items`: `None` — [Read-Write] The items to align (Array[RigElementKey])
  - `maximum`: `float` — [Read-Write] The maximum U value to use on the curve (float)
  - `minimum`: `float` — [Read-Write] The minimum U value to use on the curve (float)
  - `primary_axis`: `Vector` — [Read-Write] (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `secondary_axis`: `Vector` — [Read-Write] (Vector)
  - `spline`: `ControlRigSpline` — [Read-Write] The curve to align to (ControlRigSpline)

### `unreal.RigUnit_TangentFromControlRigSpline`
Inherits: `RigUnit_ControlRigSplineBase` | Header: `ControlRigSplineUnits.h`

Retrieves the tangent from a given Spline and U value

**Properties** (3):
  - `spline`: `ControlRigSpline` — [Read-Write] (ControlRigSpline)
  - `tangent`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `u`: `float` — [Read-Write] (float)

### `unreal.RigUnit_TransformFromControlRigSpline`
Inherits: `RigUnit_ControlRigSplineBase` | Header: `ControlRigSplineUnits.h`

Retrieves the transform from a given Spline and U value based on the given Up Vector and Roll

**Properties** (5):
  - `roll`: `float` — [Read-Write] (float)
  - `spline`: `ControlRigSpline` — [Read-Write] (ControlRigSpline)
  - `transform`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `u`: `float` — [Read-Write] (float)
  - `up_vector`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnit_TransformFromControlRigSpline2`
Inherits: `RigUnit_ControlRigSplineBase` | Header: `ControlRigSplineUnits.h`

Retrieves the transform from a given Spline and U value based on the given Up Vector and Roll

**Properties** (5):
  - `primary_axis`: `Vector` — [Read-Write] (Vector)
  - `secondary_axis`: `Vector` — [Read-Write] (Vector)
  - `spline`: `ControlRigSpline` — [Read-Write] (ControlRigSpline)
  - `transform`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `u`: `float` — [Read-Write] (float)

### `unreal.SplineType`
Inherits: `EnumBase` | Header: `ControlRigSplineTypes.h`

ESpline Type

**Properties** (2):
  - `B_SPLINE`: `SplineType = Ellipsis` — The smooth curve will pass through the first and last control points 0
  - `HERMITE`: `SplineType = Ellipsis` — The curve will pass through the control points 1
