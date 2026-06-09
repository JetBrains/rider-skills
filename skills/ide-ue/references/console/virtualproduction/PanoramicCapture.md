# UE Python API — PanoramicCapture Module

**3 types** from the `PanoramicCapture` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `StereoCapturePawn`, `StereoStaticMeshComponent`, `SPStereoCameraLayer`

---

## Classes

### `unreal.StereoCapturePawn`
Inherits: `DefaultPawn` | Header: `StereoCapturePawn.h`

Stereo Capture Pawn

**Methods** (1):
  - `update_stereo_atlas(world_context_object, latent_info)` -> `None` — Update Stereo Atlas

**Properties** (2):
  - `left_eye_atlas`: `Texture2D` [Read-Only] — [Read-Only] (Texture2D)
  - `right_eye_atlas`: `Texture2D` [Read-Only] — [Read-Only] (Texture2D)

### `unreal.StereoStaticMeshComponent`
Inherits: `StaticMeshComponent` | Header: `StereoStaticMeshComponent.h`

Stereo Static Mesh Component

**Properties** (1):
  - `eye_to_render`: `SPStereoCameraLayer` — [Read-Write] (SPStereoCameraLayer)

### `unreal.SPStereoCameraLayer`
Inherits: `EnumBase` | Header: `StereoStaticMeshComponent.h`

ESPStereo Camera Layer

**Properties** (3):
  - `BOTH_EYES`: `SPStereoCameraLayer = Ellipsis` — 2
  - `LEFT_EYE`: `SPStereoCameraLayer = Ellipsis` — 0
  - `RIGHT_EYE`: `SPStereoCameraLayer = Ellipsis` — 1
