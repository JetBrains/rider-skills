# UE Python API — HairStrandsDeformer Module

**10 types** from the `HairStrandsDeformer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `OptimusGroomAttributeReadDataProvider`, `OptimusGroomExecDataProvider`, `OptimusGroomGuidesReadDataProvider`, `OptimusGroomGuidesWriteDataProvider`, `OptimusGroomMeshesReadDataProvider`, `OptimusGroomSolverReadDataProvider`, `OptimusGroomStrandsReadDataProvider`, `OptimusGroomStrandsWriteDataProvider`, `OptimusGroomAttributeTypes`, `OptimusGroomExecDomain`

---

## Classes

### `unreal.OptimusGroomAttributeReadDataProvider`
Inherits: `ComputeDataProvider` | Header: `DeformerGroomAttributeRead.h`

Compute Framework Data Provider for reading groom strands.

**Properties** (1):
  - `mesh_component`: `MeshComponent` — [Read-Write] (MeshComponent)

### `unreal.OptimusGroomExecDataProvider`
Inherits: `ComputeDataProvider` | Header: `DeformerGroomDomainsExec.h`

Compute Framework Data Provider for executing kernels over a groom execution.

### `unreal.OptimusGroomGuidesReadDataProvider`
Inherits: `ComputeDataProvider` | Header: `DeformerGroomGuidesRead.h`

Compute Framework Data Provider for reading groom guides.

**Properties** (1):
  - `mesh_component`: `MeshComponent` — [Read-Write] (MeshComponent)

### `unreal.OptimusGroomGuidesWriteDataProvider`
Inherits: `ComputeDataProvider` | Header: `DeformerGroomGuidesWrite.h`

Compute Framework Data Provider for writing skinned mesh.

**Properties** (1):
  - `mesh_component`: `MeshComponent` — [Read-Write] (MeshComponent)

### `unreal.OptimusGroomMeshesReadDataProvider`
Inherits: `ComputeDataProvider` | Header: `DeformerGroomMeshesRead.h`

Compute Framework Data Provider for reading groom meshes.

**Properties** (1):
  - `mesh_component`: `MeshComponent` — [Read-Write] (MeshComponent)

### `unreal.OptimusGroomSolverReadDataProvider`
Inherits: `ComputeDataProvider` | Header: `DeformerGroomSolverRead.h`

Compute Framework Data Provider for reading groom guides.

**Properties** (1):
  - `solver_component`: `GroomSolverComponent` — [Read-Write] (GroomSolverComponent)

### `unreal.OptimusGroomStrandsReadDataProvider`
Inherits: `ComputeDataProvider` | Header: `DeformerGroomStrandsRead.h`

Compute Framework Data Provider for reading groom strands.

**Properties** (1):
  - `mesh_component`: `MeshComponent` — [Read-Write] (MeshComponent)

### `unreal.OptimusGroomStrandsWriteDataProvider`
Inherits: `ComputeDataProvider` | Header: `DeformerGroomStrandsWrite.h`

Compute Framework Data Provider for writing skinned mesh.

**Properties** (1):
  - `mesh_component`: `MeshComponent` — [Read-Write] (MeshComponent)

### `unreal.OptimusGroomAttributeTypes`
Inherits: `EnumBase` | Header: `DeformerGroomAttributeRead.h`

List of attribute types on which you could paint in dataflow

**Properties** (15):
  - `BOOL`: `OptimusGroomAttributeTypes = Ellipsis` — 1
  - `FLOAT`: `OptimusGroomAttributeTypes = Ellipsis` — 7
  - `INT`: `OptimusGroomAttributeTypes = Ellipsis` — 2
  - `INT_VECTOR2`: `OptimusGroomAttributeTypes = Ellipsis` — 3
  - `INT_VECTOR3`: `OptimusGroomAttributeTypes = Ellipsis` — 4
  - `INT_VECTOR4`: `OptimusGroomAttributeTypes = Ellipsis` — 5
  - `LINEAR_COLOR`: `OptimusGroomAttributeTypes = Ellipsis` — 11
  - `MATRIX3X4`: `OptimusGroomAttributeTypes = Ellipsis` — 15
  - `QUAT`: `OptimusGroomAttributeTypes = Ellipsis` — 12
  - `ROTATOR`: `OptimusGroomAttributeTypes = Ellipsis` — 13
  - `TRANSFORM`: `OptimusGroomAttributeTypes = Ellipsis` — 14
  - `UINT`: `OptimusGroomAttributeTypes = Ellipsis` — 6
  - `VECTOR2`: `OptimusGroomAttributeTypes = Ellipsis` — 8
  - `VECTOR3`: `OptimusGroomAttributeTypes = Ellipsis` — 9
  - `VECTOR4`: `OptimusGroomAttributeTypes = Ellipsis` — 10

### `unreal.OptimusGroomExecDomain`
Inherits: `EnumBase` | Header: `DeformerGroomDomainsExec.h`

EOptimus Groom Exec Domain

**Properties** (8):
  - `CONTROL_POINT`: `OptimusGroomExecDomain = Ellipsis` — Run kernel with one thread per strands points. 1
  - `CURVE`: `OptimusGroomExecDomain = Ellipsis` — Run kernel with one thread per strands curves. 2
  - `GUIDES_CURVES`: `OptimusGroomExecDomain = Ellipsis` — Run kernel with one thread per guides curves. 6
  - `GUIDES_EDGES`: `OptimusGroomExecDomain = Ellipsis` — Run kernel with one thread per guides edges. 7
  - `GUIDES_OBJECTS`: `OptimusGroomExecDomain = Ellipsis` — Run kernel with one thread per guides objects. 8
  - `GUIDES_POINTS`: `OptimusGroomExecDomain = Ellipsis` — Run kernel with one thread per guides points. 5
  - `STRANDS_EDGES`: `OptimusGroomExecDomain = Ellipsis` — Run kernel with one thread per strands edges. 3
  - `STRANDS_OBJECTS`: `OptimusGroomExecDomain = Ellipsis` — Run kernel with one thread per strands objects. 4
