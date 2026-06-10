# UE Python API — FullBodyIK Module

**9 types** from the `FullBodyIK` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FBIKBoneLimit`, `FBIKConstraintOption`, `FBIKDebugOption`, `FBIKEndEffector`, `MotionProcessInput`, `RigUnit_FullbodyIK`, `SolverInput`, `FBIKBoneLimitType`, `PoleVectorOption`

---

## Classes

### `unreal.FBIKBoneLimit`
Inherits: `StructBase` | Header: `FBIKConstraintOption.h`

FBIKBone Limit

### `unreal.FBIKConstraintOption`
Inherits: `StructBase` | Header: `FBIKConstraintOption.h`

FBIKConstraint Option

**Properties** (1):
  - `item`: `RigElementKey` [Read-Only] — [Read-Only] Bone Name (RigElementKey)

### `unreal.FBIKDebugOption`
Inherits: `StructBase` | Header: `FBIKDebugOption.h`

FBIKDebug Option

### `unreal.FBIKEndEffector`
Inherits: `StructBase` | Header: `RigUnit_FullbodyIK.h`

FBIKEnd Effector

**Properties** (1):
  - `item`: `RigElementKey` [Read-Only] — [Read-Only] The last item in the chain to solve - the effector (RigElementKey)

### `unreal.MotionProcessInput`
Inherits: `StructBase` | Header: `FBIKConstraintOption.h`

Motion Process Input

### `unreal.RigUnit_FullbodyIK`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_FullbodyIK.h`

Based on Jacobian solver at core, this can solve multi chains within a root using multi effectors

**Properties** (8):
  - `constraints`: `None` — [Read-Write] (Array[FBIKConstraintOption])
  - `debug_option`: `FBIKDebugOption` — [Read-Write] (FBIKDebugOption)
  - `effectors`: `None` — [Read-Write] (Array[FBIKEndEffector])
  - `end_effectors`: `None` — âend_effectorsâ was renamed to âeffectorsâ. deprecated
  - `motion_property`: `MotionProcessInput` [Read-Only] — [Read-Only] (MotionProcessInput)
  - `propagate_to_children`: `bool` — [Read-Write] If set to true all of the global transforms of the children
of this bone will be recalc...
  - `root`: `RigElementKey` [Read-Only] — [Read-Only] The first bone in the chain to solve (RigElementKey)
  - `solver_property`: `SolverInput` [Read-Only] — [Read-Only] (SolverInput)

### `unreal.SolverInput`
Inherits: `StructBase` | Header: `FBIKShared.h`

Solver Input

### `unreal.FBIKBoneLimitType`
Inherits: `EnumBase` | Header: `FBIKConstraintOption.h`

EFBIKBone Limit Type

**Properties** (3):
  - `FREE`: `FBIKBoneLimitType = Ellipsis` — 0
  - `LIMIT`: `FBIKBoneLimitType = Ellipsis` — 1
  - `LOCKED`: `FBIKBoneLimitType = Ellipsis` — currently hard limit 2

### `unreal.PoleVectorOption`
Inherits: `EnumBase` | Header: `FBIKConstraintOption.h`

EPole Vector Option

**Properties** (2):
  - `DIRECTION`: `PoleVectorOption = Ellipsis` — 0
  - `LOCATION`: `PoleVectorOption = Ellipsis` — The polevector will indicate a direction vector in their local bone space 1
