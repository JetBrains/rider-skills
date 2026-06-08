# UE Python API — CurveExpression Module

**6 types** from the `CurveExpression` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_RemapCurves`, `AnimNode_RemapCurvesBase`, `AnimNode_RemapCurvesFromMesh`, `CurveExpressionList`, `CurveExpressionsDataAsset`, `RemapCurvesExpressionSource`

---

## Classes

### `unreal.AnimNode_RemapCurves`
Inherits: `AnimNode_RemapCurvesBase` | Header: `AnimNode_RemapCurves.h`

Anim Node Remap Curves

### `unreal.AnimNode_RemapCurvesBase`
Inherits: `AnimNode_Base` | Header: `AnimNode_RemapCurvesBase.h`

Anim Node Remap Curves Base

**Properties** (5):
  - `curve_expressions`: `None` — [Read-Write] (Map[Name,str])
  - `curve_expressions_data_asset`: `CurveExpressionsDataAsset` — [Read-Write] (CurveExpressionsDataAsset)
  - `expression_list`: `CurveExpressionList` [Read-Only] — [Read-Only] (CurveExpressionList)
  - `expressions_immutable`: `bool` — [Read-Write] The expression map given is immutable and will not change during runtime. Improves perf...
  - `source_pose`: `PoseLink` — [Read-Write] (PoseLink)

### `unreal.AnimNode_RemapCurvesFromMesh`
Inherits: `AnimNode_RemapCurvesBase` | Header: `AnimNode_RemapCurvesFromMesh.h`

Anim Node Remap Curves from Mesh

**Properties** (2):
  - `source_mesh_component`: `SkeletalMeshComponent` — [Read-Write] This is used by default if itâs valid (SkeletalMeshComponent)
  - `use_attached_parent`: `bool` — [Read-Write] If SourceMeshComponent is not valid, and if this is true, it will look for attached par...

### `unreal.CurveExpressionList`
Inherits: `StructBase` | Header: `CurveExpressionsDataAsset.h`

Curve Expression List

### `unreal.CurveExpressionsDataAsset`
Inherits: `DataAsset` | Header: `CurveExpressionsDataAsset.h`

Curve Expressions Data Asset

### `unreal.RemapCurvesExpressionSource`
Inherits: `EnumBase` | Header: `AnimNode_RemapCurvesBase.h`

ERemap Curves Expression Source

**Properties** (3):
  - `DATA_ASSET`: `RemapCurvesExpressionSource = Ellipsis` — 1
  - `EXPRESSION_LIST`: `RemapCurvesExpressionSource = Ellipsis` — 0
  - `EXPRESSION_MAP`: `RemapCurvesExpressionSource = Ellipsis` — 2
