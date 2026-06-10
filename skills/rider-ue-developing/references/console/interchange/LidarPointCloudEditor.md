# UE Python API — LidarPointCloudEditor Module

**4 types** from the `LidarPointCloudEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LidarPointCloudFactory`, `LidarToolActionsNormals`, `LidarToolActionsPaintSelection`, `LidarToolActionsSelection`

---

## Classes

### `unreal.LidarPointCloudFactory`
Inherits: `Factory` | Header: `LidarPointCloudFactory.h`

Lidar Point Cloud Factory

### `unreal.LidarToolActionsNormals`
Inherits: `InteractiveToolPropertySet` | Header: `LidarPointCloudEditorTools.h`

Lidar Tool Actions Normals

**Properties** (1):
  - `noise_tolerance`: `float` — [Read-Write] Higher values are less susceptible to noise, but will most likely lose finer details, e...

### `unreal.LidarToolActionsPaintSelection`
Inherits: `LidarToolActionsSelection` | Header: `LidarPointCloudEditorTools.h`

Lidar Tool Actions Paint Selection

### `unreal.LidarToolActionsSelection`
Inherits: `InteractiveToolPropertySet` | Header: `LidarPointCloudEditorTools.h`

Lidar Tool Actions Selection

**Properties** (1):
  - `noise_tolerance`: `float` — [Read-Write] Higher values are less susceptible to noise, but will most likely lose finer details, e...
