# UE Python API — CustomMeshComponent Module

**2 types** from the `CustomMeshComponent` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CustomMeshTriangle`, `CustomMeshComponent`

---

## Classes

### `unreal.CustomMeshTriangle`
Inherits: `StructBase` | Header: `CustomMeshComponent.h`

Custom Mesh Triangle

**Properties** (3):
  - `vertex0`: `Vector` — [Read-Write] (Vector)
  - `vertex1`: `Vector` — [Read-Write] (Vector)
  - `vertex2`: `Vector` — [Read-Write] (Vector)

### `unreal.CustomMeshComponent`
Inherits: `MeshComponent` | Header: `CustomMeshComponent.h`

Component that allows you to specify custom triangle mesh geometry

**Methods** (3):
  - `add_custom_mesh_triangles(triangles)` -> `None` — Add to the geometry to use on this triangle mesh. This may cause an allocation. Use SetCustomMeshTriangles() instead whe...
  - `clear_custom_mesh_triangles()` -> `None` — Removes all geometry from this triangle mesh. Does not deallocate memory, allowing new geometry to reuse the existing al...
  - `set_custom_mesh_triangles(triangles)` -> `bool` — Set the geometry to use on this triangle mesh
