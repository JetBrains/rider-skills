# UE Python API — DataprepGeometryOperations Module

**8 types** from the `DataprepGeometryOperations` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataprepBakeTransformOperation`, `DataprepJacketingFilter`, `DataprepOverlappingActorsSelectionTransform`, `DataprepPlaneCutOperation`, `DataprepRemeshOperation`, `DataprepSimplifyMeshOperation`, `DataprepWeldEdgesOperation`, `PlaneCutKeepSide`

---

## Classes

### `unreal.DataprepBakeTransformOperation`
Inherits: `DataprepEditingOperation` | Header: `DataprepGeometryOperations.h`

Experimental - Bake transform of input meshes

### `unreal.DataprepJacketingFilter`
Inherits: `DataprepFilterNoFetcher` | Header: `DataprepGeometryFilters.h`

Apply mesh jacketing to selected objects

### `unreal.DataprepOverlappingActorsSelectionTransform`
Inherits: `DataprepSelectionTransform` | Header: `DataprepGeometrySelectionTransforms.h`

Return all actors overlapping the selected actors

### `unreal.DataprepPlaneCutOperation`
Inherits: `DataprepEditingOperation` | Header: `DataprepGeometryOperations.h`

Experimental - Plane cut input meshes

### `unreal.DataprepRemeshOperation`
Inherits: `DataprepEditingOperation` | Header: `DataprepGeometryOperations.h`

Experimental - Remesh input meshes

### `unreal.DataprepSimplifyMeshOperation`
Inherits: `DataprepEditingOperation` | Header: `DataprepGeometryOperations.h`

Experimental - Simplify input meshes

### `unreal.DataprepWeldEdgesOperation`
Inherits: `DataprepEditingOperation` | Header: `DataprepGeometryOperations.h`

Experimental - Weld edges of input meshes

### `unreal.PlaneCutKeepSide`
Inherits: `EnumBase` | Header: `DataprepGeometryOperations.h`

EPlane Cut Keep Side

**Properties** (3):
  - `BOTH`: `PlaneCutKeepSide = Ellipsis` — 2
  - `NEGATIVE`: `PlaneCutKeepSide = Ellipsis` — 1
  - `POSITIVE`: `PlaneCutKeepSide = Ellipsis` — 0
