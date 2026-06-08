# UE Python API — ARUtilities Module

**6 types** from the `ARUtilities` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ARKitPoseTrackingConfig`, `ARLiveLinkRetargetAsset`, `ARPassthroughManager`, `ARUtilitiesFunctionLibrary`, `PassthroughMaterialUpdateComponent`, `ARLiveLinkSourceType`

---

## Classes

### `unreal.ARKitPoseTrackingConfig`
Inherits: `StructBase` | Header: `ARLiveLinkRetargetAsset.h`

ARKit Pose Tracking Config

### `unreal.ARLiveLinkRetargetAsset`
Inherits: `LiveLinkRetargetAsset` | Header: `ARLiveLinkRetargetAsset.h`

Platform agnostic live link retarget asset

### `unreal.ARPassthroughManager`
Inherits: `Actor` | Header: `ARPassthroughManager.h`

A helper actor that collects the ARComponent in the scene and apply the passthrough material to them.

**Methods** (1):
  - `get_passthrough_material_update_component()` -> `PassthroughMaterialUpdateComponent` — Get Passthrough Material Update Component

### `unreal.ARUtilitiesFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ARUtilitiesFunctionLibrary.h`

ARUtilities Function Library

**Methods** (3):
  - `update_camera_texture_param(material_instance, camera_texture, color_scale = 1.000000)` -> `None` [classmethod] — Update material texture parameter using pre-defined names: For regular texture: CameraTexture For external texture: Exte...
  - `update_scene_depth_texture(material_instance, scene_depth_texture, depth_to_meter_scale = 1.000000)` -> `None` [classmethod] — Update material texture parameter using pre-defined names: Scene depth texture: SceneDepthTexture Depth to meter scale: ...
  - `update_world_to_meter_scale(material_instance, world_to_meter_scale = 100.000000)` -> `None` [classmethod] — Update material texture parameter using pre-defined names: World to meter scale: WorldToMeterScale

### `unreal.PassthroughMaterialUpdateComponent`
Inherits: `ActorComponent` | Header: `PassthroughMaterialUpdateComponent.h`

Helper component that automatically pick the correct passthrough material to use and handles updating the camera texture in the tick.

**Methods** (3):
  - `add_affected_component(component)` -> `None` — Add a component to be affected by the passthrough rendering
  - `remove_affected_component(component)` -> `None` — Remove the component from passthrough rendering
  - `set_passthrough_debug_color(new_debug_color)` -> `None` — Update the passthrough debug color

### `unreal.ARLiveLinkSourceType`
Inherits: `EnumBase` | Header: `ARLiveLinkRetargetAsset.h`

EARLive Link Source Type

**Properties** (2):
  - `AR_KIT_POSE_TRACKING`: `ARLiveLinkSourceType = Ellipsis` — 1
  - `NONE`: `ARLiveLinkSourceType = Ellipsis` — 0
