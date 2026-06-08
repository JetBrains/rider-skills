# UE Python API — AnimationCore Module

**10 types** from the `AnimationCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `Axis`, `ConstraintDescription`, `EulerTransform`, `FilterOptionPerAxis`, `TransformConstraint`, `TransformFilter`, `TransformNoScale`, `ConstraintType`, `EulerRotationOrder`, `TransformConstraintType`

---

## Classes

### `unreal.Axis`
Inherits: `StructBase` | Header: `CommonAnimTypes.h`

Axis to represent direction

### `unreal.ConstraintDescription`
Inherits: `StructBase` | Header: `Constraint.h`

A description of how to apply a simple transform constraint

**Properties** (7):
  - `parent`: `bool` — [Read-Write] this does composed transform - where as individual will accumulate per component (bool)
  - `rotation`: `bool` — [Read-Write] (bool)
  - `rotation_axes`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)
  - `scale`: `bool` — [Read-Write] (bool)
  - `scale_axes`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)
  - `translation`: `bool` — [Read-Write] (bool)
  - `translation_axes`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)

### `unreal.EulerTransform`
Inherits: `StructBase` | Header: `EulerTransform.h`

Euler Transform

**Properties** (3):
  - `location`: `Vector` — [Read-Write] The translation of this transform (Vector)
  - `rotation`: `Rotator` — [Read-Write] The rotation of this transform (Rotator)
  - `scale`: `Vector` — [Read-Write] The scale of this transform (Vector)

### `unreal.FilterOptionPerAxis`
Inherits: `StructBase` | Header: `Constraint.h`

Filter Option Per Axis

**Properties** (3):
  - `x`: `bool` — [Read-Write] (bool)
  - `y`: `bool` — [Read-Write] (bool)
  - `z`: `bool` — [Read-Write] (bool)

### `unreal.TransformConstraint`
Inherits: `StructBase` | Header: `Constraint.h`

Transform Constraint

**Properties** (5):
  - `maintain_offset`: `bool` — [Read-Write] When the constraint is first applied, maintain the offset from the target node (bool)
  - `operator`: `ConstraintDescription` — [Read-Write]
note: thought of separating this out per each but weâll have an issue with applying t...
  - `source_node`: `Name` — [Read-Write] (Name)
  - `target_node`: `Name` — [Read-Write] (Name)
  - `weight`: `float` — [Read-Write] (float)

### `unreal.TransformFilter`
Inherits: `StructBase` | Header: `Constraint.h`

A filter for a whole transform

**Properties** (3):
  - `rotation_filter`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)
  - `scale_filter`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)
  - `translation_filter`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)

### `unreal.TransformNoScale`
Inherits: `StructBase` | Header: `TransformNoScale.h`

Transform No Scale

**Properties** (2):
  - `location`: `Vector` — [Read-Write] The translation of this transform (Vector)
  - `rotation`: `Quat` — [Read-Write] The rotation of this transform (Quat)

### `unreal.ConstraintType`
Inherits: `EnumBase` | Header: `Constraint.h`

Constraint Types

**Properties** (2):
  - `AIM`: `ConstraintType = Ellipsis` — Aim Constraint 1
  - `TRANSFORM`: `ConstraintType = Ellipsis` — Transform Constraint 0

### `unreal.EulerRotationOrder`
Inherits: `EnumBase` | Header: `EulerTransform.h`

EEuler Rotation Order

**Properties** (6):
  - `XYZ`: `EulerRotationOrder = Ellipsis` — 0
  - `XZY`: `EulerRotationOrder = Ellipsis` — 1
  - `YXZ`: `EulerRotationOrder = Ellipsis` — 2
  - `YZX`: `EulerRotationOrder = Ellipsis` — 3
  - `ZXY`: `EulerRotationOrder = Ellipsis` — 4
  - `ZYX`: `EulerRotationOrder = Ellipsis` — 5

### `unreal.TransformConstraintType`
Inherits: `EnumBase` | Header: `Constraint.h`

Transform Constraint Types

**Properties** (5):
  - `LOOK_AT`: `TransformConstraintType = Ellipsis` — 4
  - `PARENT`: `TransformConstraintType = Ellipsis` — 3
  - `ROTATION`: `TransformConstraintType = Ellipsis` — 1
  - `SCALE`: `TransformConstraintType = Ellipsis` — 2
  - `TRANSLATION`: `TransformConstraintType = Ellipsis` — 0
