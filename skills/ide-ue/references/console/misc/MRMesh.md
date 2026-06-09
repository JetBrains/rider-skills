# UE Python API — MRMesh Module

**6 types** from the `MRMesh` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MRMeshConfiguration`, `MeshReconstructorBase`, `MockDataMeshTrackerComponent`, `MRMeshComponent`, `MeshTrackerVertexColorMode`, `MockDataMeshTrackerComponent_OnMockDataMeshTrackerUpdated`

---

## Classes

### `unreal.MRMeshConfiguration`
Inherits: `StructBase` | Header: `MeshReconstructorBase.h`

MRMesh Configuration

### `unreal.MeshReconstructorBase`
Inherits: `Object` | Header: `MeshReconstructorBase.h`

Mesh Reconstructor Base

**Methods** (5):
  - `is_reconstruction_paused()` -> `bool` — Is Reconstruction Paused
  - `is_reconstruction_started()` -> `bool` — Is Reconstruction Started
  - `pause_reconstruction()` -> `None` — Pause Reconstruction
  - `start_reconstruction()` -> `None` — Start Reconstruction
  - `stop_reconstruction()` -> `None` — Stop Reconstruction

### `unreal.MockDataMeshTrackerComponent`
Inherits: `SceneComponent` | Header: `MockDataMeshTrackerComponent.h`

The MeshTrackerComponent class manages requests for environmental mesh data, processes the results and provides them to the calling system. The calling system is able request environmental mesh data w...

**Methods** (2):
  - `connect_mr_mesh(mr_mesh_ptr)` -> `None` — Sets the procedural mesh component that will store and display the environmental mesh results.
  - `disconnect_mr_mesh(mr_mesh_ptr)` -> `None` — Unlinks the current procedural mesh component from the mesh tracking system.

**Properties** (9):
  - `block_vertex_colors`: `None` — [Read-Write] Colors through which we cycle when setting vertex color by block. (Array[Color])
  - `on_mesh_tracker_updated`: `OnMockDataMeshTrackerUpdated` — [Read-Write] Activated whenever new information about this mesh tracker is detected. (OnMockDataMesh...
  - `request_normals`: `bool` — [Read-Write] If true, the system will generate normals for the triangle vertices. (bool)
  - `request_vertex_confidence`: `bool` — [Read-Write] If true, the system will generate the mesh confidence values for the triangle vertices....
  - `scan_world`: `bool` — [Read-Write] Set to true to start scanning the world for meshes. (bool)
  - `update_interval`: `float` — [Read-Write] Update Interval in Seconds. (float)
  - `vertex_color_from_confidence_one`: `LinearColor` — [Read-Write] Color mapped to confidence value of one. (LinearColor)
  - `vertex_color_from_confidence_zero`: `LinearColor` — [Read-Write] Color mapped to confidence value of zero. (LinearColor)
  - `vertex_color_mode`: `MeshTrackerVertexColorMode` — [Read-Write] Vertex Colors can be unused, or filled with several types of information. (MeshTrackerV...

### `unreal.MRMeshComponent`
Inherits: `PrimitiveComponent` | Header: `MRMeshComponent.h`

MRMesh Component

**Methods** (11):
  - `clear()` -> `None` — Clear
  - `force_nav_mesh_update()` -> `None` — Force navmesh generation to run using the current collision data. This will run even if the collision data has not been ...
  - `get_enable_mesh_occlusion()` -> `bool` — Get Enable Mesh Occlusion
  - `get_use_wireframe()` -> `bool` — Get Use Wireframe
  - `get_wireframe_color()` -> `LinearColor` — Get Wireframe Color
  - `is_connected()` -> `bool` — Is Connected
  - `request_nav_mesh_update()` -> `None` — Generate nav mesh if collision data has changed since the last nav mesh generation.
  - `set_enable_mesh_occlusion(enable)` -> `None` — Set Enable Mesh Occlusion
  - `set_use_wireframe(use_wireframe)` -> `None` — Set Use Wireframe
  - `set_wireframe_color(color)` -> `None` — Set Wireframe Color
  - `set_wireframe_material(material)` -> `None` — Set the wireframe material.

### `unreal.MeshTrackerVertexColorMode`
Inherits: `EnumBase` | Header: `MockDataMeshTrackerComponent.h`

Vertex color mode.

**Properties** (3):
  - `BLOCK`: `MeshTrackerVertexColorMode = Ellipsis` — ! Each block is given a color from a list. 2
  - `CONFIDENCE`: `MeshTrackerVertexColorMode = Ellipsis` — ! Vertex confidence is interpolated between two specified colors. 1
  - `NONE`: `MeshTrackerVertexColorMode = Ellipsis` — Vertex Color is not set. 0

### `unreal.MockDataMeshTrackerComponent_OnMockDataMeshTrackerUpdated`
Inherits: `MulticastDelegateBase` | Header: `MockDataMeshTrackerComponent.h`

Delegate used by OnMeshUpdated().
