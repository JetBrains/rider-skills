# UE Python API — DisplayClusterProjection Module

**3 types** from the `DisplayClusterProjection` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DisplayClusterProjectionBlueprintAPI`, `DisplayClusterProjectionBlueprintAPIImpl`, `DisplayClusterProjectionBlueprintLib`

---

## Classes

### `unreal.DisplayClusterProjectionBlueprintAPI`
Inherits: `Interface` | Header: `IDisplayClusterProjectionBlueprintAPI.h`

Display Cluster Projection Blueprint API

**Methods** (1):
  - `camera_policy_set_camera(viewport_id, new_camera, fov_multiplier = 1.000000)` -> `None` — Camera Policy Set Camera deprecated: This function is now available in the main blueprint functions list under ânDispl...

### `unreal.DisplayClusterProjectionBlueprintAPIImpl`
Inherits: `Object` | Header: `DisplayClusterProjectionBlueprintAPIImpl.h`

Blueprint API interface implementation

**Methods** (1):
  - `camera_policy_set_camera(viewport_id, new_camera, fov_multiplier = 1.000000)` -> `None` — Camera Policy Set Camera deprecated: This function is now available in the main blueprint functions list under ânDispl...

### `unreal.DisplayClusterProjectionBlueprintLib`
Inherits: `BlueprintFunctionLibrary` | Header: `DisplayClusterProjectionBlueprintLib.h`

Blueprint API function library

**Methods** (2):
  - `camera_policy_set_camera(viewport_id, new_camera, fov_multiplier = 1.000000)` -> `None` [classmethod] — Sets camera up for âcameraâ projection policy.
  - `get_api()` -> `DisplayClusterProjectionBlueprintAPI` [classmethod] — Get API deprecated: GetAPI has been deprecated. All functions are now available in the main blueprint functions list und...
