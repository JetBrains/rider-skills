# UE Python API — ImageCore Module

**2 types** from the `ImageCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SharedImageConstRefBlueprint`, `SharedImageConstRefBlueprintFns`

---

## Classes

### `unreal.SharedImageConstRefBlueprint`
Inherits: `StructBase` | Header: `ImageCoreBP.h`

Exposes a FSharedImage to blueprint in an unalterable way.

### `unreal.SharedImageConstRefBlueprintFns`
Inherits: `Object` | Header: `ImageCoreBP.h`

Shared Image Const Ref Blueprint Fns

**Methods** (6):
  - `get_height(image)` -> `int32` [classmethod] — Returns -1 if Image is invalid
  - `get_pixel_linear_color(image, x, y, failure_color=[0.000000, 0.000000, 0.000000, valid=bool)` [classmethod] — Returns the color value for the given pixel. If the input position is invalid, the format is invalid, or the reference i...
  - `get_pixel_value(image, x, valid=bool)` [classmethod] — Returns the value in the texture for the given pixel as a float vector. If the input position is invalid, the format is ...
  - `get_size(image)` -> `Vector2f` [classmethod] — Returns (-1, -1) if Image is invalid
  - `get_width(image)` -> `int32` [classmethod] — Returns -1 if Image is invalid
  - `is_valid(image)` -> `bool` [classmethod] — Is Valid
