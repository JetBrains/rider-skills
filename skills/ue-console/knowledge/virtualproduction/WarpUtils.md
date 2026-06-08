# UE Python API — WarpUtils Module

**1 types** from the `WarpUtils` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `WarpUtilsBlueprintLibrary`

---

## Classes

### `unreal.WarpUtilsBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `WarpUtilsBlueprintLibrary.h`

Warp Utils Blueprint Library

**Methods** (4):
  - `generate_pfm(file, start_location, start_rotation, pfm_origin, tiles_horizontal, tiles_vertical, column_angle, tile_size_horizontal, tile_size_vertical, tile_pixels_horizontal, tile_pixels_vertical, add_margin)` -> `bool` [classmethod] — Generate and save data to a PFM file
  - `generate_pfm_ex(file, start_location, start_rotation, pfm_origin, tiles_horizontal, tiles_vertical, column_angle, tile_size_horizontal, tile_size_vertical, tile_pixels_horizontal, tile_pixels_vertical, add_margin, tiles_validity_flags)` -> `bool` [classmethod] — Generate and save data to a PFM file. Additionally, we have an array of tiles validiy flags (false == all pixels of a ti...
  - `save_pfm(file, tex_width, tex_height, vertices)` -> `bool` [classmethod] — Save data to a PFM file
  - `save_pfm_ex(file, tex_width, tex_height, vertices, tiles_validity_flags)` -> `bool` [classmethod] — Save data to a PFM file. Since the float NaN value is not available in blueprints, we provide a flags array (false == Na...
