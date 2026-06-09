# UE Python API — LiveLinkLens Module

**4 types** from the `LiveLinkLens` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LiveLinkLensBlueprintData`, `LiveLinkLensFrameData`, `LiveLinkLensStaticData`, `LiveLinkLensRole`

---

## Classes

### `unreal.LiveLinkLensBlueprintData`
Inherits: `LiveLinkBaseBlueprintData` | Header: `LiveLinkLensTypes.h`

Facility structure to handle lens data in blueprint

**Properties** (2):
  - `frame_data`: `LiveLinkLensFrameData` — [Read-Write] Dynamic data that can change every frame (LiveLinkLensFrameData)
  - `static_data`: `LiveLinkLensStaticData` — [Read-Write] Static data that should not change every frame (LiveLinkLensStaticData)

### `unreal.LiveLinkLensFrameData`
Inherits: `LiveLinkCameraFrameData` | Header: `LiveLinkLensTypes.h`

Struct for dynamic (per-frame) lens data

**Properties** (3):
  - `distortion_parameters`: `None` — [Read-Write] Parameters used by the distortion model (Array[float])
  - `fx_fy`: `Vector2D` — [Read-Write] Normalized focal length used by the distortion model (Vector2D)
  - `principal_point`: `Vector2D` — [Read-Write] Normalized center of the image, in the range [0.0f, 1.0f] (Vector2D)

### `unreal.LiveLinkLensStaticData`
Inherits: `LiveLinkCameraStaticData` | Header: `LiveLinkLensTypes.h`

Struct for static lens data

**Properties** (1):
  - `lens_model`: `Name` — [Read-Write] Specifies the type/character of the lens (spherical, anamorphic, etc.) (Name)

### `unreal.LiveLinkLensRole`
Inherits: `LiveLinkCameraRole` | Header: `LiveLinkLensRole.h`

Role associated with lens data
