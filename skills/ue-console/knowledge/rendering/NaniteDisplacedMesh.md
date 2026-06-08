# UE Python API — NaniteDisplacedMesh Module

**4 types** from the `NaniteDisplacedMesh` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `NaniteDisplacedMeshDisplacementMap`, `NaniteDisplacedMeshParams`, `NaniteDisplacedMesh`, `NaniteDisplacedMeshComponent`

---

## Classes

### `unreal.NaniteDisplacedMeshDisplacementMap`
Inherits: `StructBase` | Header: `NaniteDisplacedMesh.h`

Nanite Displaced Mesh Displacement Map

### `unreal.NaniteDisplacedMeshParams`
Inherits: `StructBase` | Header: `NaniteDisplacedMesh.h`

Nanite Displaced Mesh Params

### `unreal.NaniteDisplacedMesh`
Inherits: `Object` | Header: `NaniteDisplacedMesh.h`

Nanite Displaced Mesh

**Properties** (2):
  - `is_editable`: `bool` [Read-Only] — [Read-Only] Was this asset created by a procedural tool?
This flag is generally set by tool that cre...
  - `parameters`: `NaniteDisplacedMeshParams` — [Read-Write] (NaniteDisplacedMeshParams)

### `unreal.NaniteDisplacedMeshComponent`
Inherits: `StaticMeshComponent` | Header: `NaniteDisplacedMeshComponent.h`

Nanite Displaced Mesh Component

**Properties** (1):
  - `displaced_mesh`: `NaniteDisplacedMesh` — [Read-Write] (NaniteDisplacedMesh)
