# UE Python API — DisplayClusterWarp Module

**5 types** from the `DisplayClusterWarp` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DisplayClusterWarpGeometryOBJ`, `DisplayClusterWarpGeometryPFM`, `DisplayClusterInFrustumFitCameraComponent`, `DisplayClusterWarpCameraProjectionMode`, `DisplayClusterWarpCameraViewTarget`

---

## Classes

### `unreal.DisplayClusterWarpGeometryOBJ`
Inherits: `StructBase` | Header: `DisplayClusterWarpGeometry.h`

3D geometry that can be used for warping, in an OBJ-like format

**Properties** (4):
  - `normal`: `None` — [Read-Write] Normal of the vertices of the mesh. (Array[Vector])
  - `triangles`: `None` — [Read-Write] Triangles with mesh vertex indices. (Array[int32])
  - `uv`: `None` — [Read-Write] UV of the vertices of the mesh. (Array[Vector2D])
  - `vertices`: `None` — [Read-Write] Vertices of the mesh. (Array[Vector])

### `unreal.DisplayClusterWarpGeometryPFM`
Inherits: `StructBase` | Header: `DisplayClusterWarpGeometry.h`

3D geometry that can be used for warping, in an PFM-like format UE scale used: 1 unit = 1 centimeter

**Properties** (3):
  - `height`: `int` — [Read-Write] Number of vertices vertically. (int32)
  - `vertices`: `None` — [Read-Write] An array with vertices. The total number of vertices in this array must be equal to Wid...
  - `width`: `int` — [Read-Write] Number of vertices horizontally. (int32)

### `unreal.DisplayClusterInFrustumFitCameraComponent`
Inherits: `DisplayClusterCameraComponent` | Header: `DisplayClusterInFrustumFitCameraComponent.h`

3D point in space used to project the camera view onto a group of nDisplay viewports. Support projection policies: mpcdi/pfm 2d/a3d, mesh.

**Properties** (2):
  - `external_camera_actor`: `CineCameraActor` — [Read-Write]
deprecated: Use the Camera from the UDisplayClusterCameraComponent instead (CineCameraA...
  - `use_camera_postprocess`: `bool` — [Read-Write]
deprecated: Use the bEnablePostProcess from the UDisplayClusterCameraComponent instead ...

### `unreal.DisplayClusterWarpCameraProjectionMode`
Inherits: `EnumBase` | Header: `DisplayClusterWarpBlueprint_Enums.h`

Projection mode for the camera that is used as an image source This projection does not directly use slices from the camera image, but calculates the camera sub-frustum used to render the sub-images o...

**Properties** (2):
  - `FILL`: `DisplayClusterWarpCameraProjectionMode = Ellipsis` — Fill the cameraâs frustum entire with the stage geometry 1
  - `FIT`: `DisplayClusterWarpCameraProjectionMode = Ellipsis` — Fit the stage geometry entirely within the cameraâs frustum 0

### `unreal.DisplayClusterWarpCameraViewTarget`
Inherits: `EnumBase` | Header: `DisplayClusterWarpBlueprint_Enums.h`

A set of modes used to determine the view target of the stageâs geometry frustum

**Properties** (2):
  - `GEOMETRIC_CENTER`: `DisplayClusterWarpCameraViewTarget = Ellipsis` — The camera will point in the direction of the geometric center of the stageâs geometry 0
  - `MATCH_VIEW_ORIGIN`: `DisplayClusterWarpCameraViewTarget = Ellipsis` — The camera will point in the same direction as the frustum fit view point. 1
