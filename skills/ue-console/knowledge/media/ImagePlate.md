# UE Python API — ImagePlate Module

**4 types** from the `ImagePlate` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ImagePlateParameters`, `ImagePlate`, `ImagePlateComponent`, `ImagePlateFrustumComponent`

---

## Classes

### `unreal.ImagePlateParameters`
Inherits: `StructBase` | Header: `ImagePlateComponent.h`

Image Plate Parameters

**Properties** (6):
  - `fill_screen`: `bool` — [Read-Write] Automatically size the plate based on the active cameraâs lens and filmback settings....
  - `fill_screen_amount`: `Vector2D` — [Read-Write] The amount to fill the screen with when attached to a camera (Vector2D)
  - `fixed_size`: `Vector2D` — [Read-Write] The fixed size of the image plate (Vector2D)
  - `material`: `MaterialInterface` — [Read-Write] The material that the image plate is rendered with. (MaterialInterface)
  - `render_texture`: `Texture` [Read-Only] — [Read-Only] Transient texture that receives image frames (Texture)
  - `texture_parameter_name`: `Name` — [Read-Write] Name of a texture parameter inside the material to patch the render target texture to (...

### `unreal.ImagePlate`
Inherits: `Actor` | Header: `ImagePlate.h`

Image Plate

**Properties** (1):
  - `image_plate`: `ImagePlateComponent` [Read-Only] — [Read-Only] (ImagePlateComponent)

### `unreal.ImagePlateComponent`
Inherits: `PrimitiveComponent` | Header: `ImagePlateComponent.h`

A 2d plate that will be rendered always facing the camera.

**Methods** (2):
  - `get_plate()` -> `ImagePlateParameters` — Get this actorâs image plates
  - `set_image_plate(plate)` -> `None` — Add an image plate to this actor

### `unreal.ImagePlateFrustumComponent`
Inherits: `PrimitiveComponent` | Header: `ImagePlateFrustumComponent.h`

A 2d material that will be rendered always facing the camera.
