# UE Python API — OpenColorIOEditor Module

**3 types** from the `OpenColorIOEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `OpenColorIOConfigurationFactory`, `OpenColorIOConfigurationFactoryNew`, `OpenColorIOEditorBlueprintLibrary`

---

## Classes

### `unreal.OpenColorIOConfigurationFactory`
Inherits: `Factory` | Header: `OpenColorIOConfigurationFactory.h`

Implements a factory for UOpenColorIOConfiguration objects.

### `unreal.OpenColorIOConfigurationFactoryNew`
Inherits: `Factory` | Header: `OpenColorIOConfigurationFactoryNew.h`

Implements a factory for UOpenColorIOConfiguration objects.

### `unreal.OpenColorIOEditorBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `OpenColorIOEditorBlueprintLibrary.h`

Open Color IOEditor Blueprint Library

**Methods** (4):
  - `apply_color_space_transform_to_color(conversion_settings, color)` -> `LinearColor or None` [classmethod] — Apply a color space transform to a color value.
  - `apply_color_space_transform_to_texture(conversion_settings, out_texture)` -> `bool` [classmethod] — Apply a color space transform to a texture asset.
  - `apply_color_space_transform_to_texture_compressed(conversion_settings, target_compression, out_texture)` -> `bool` [classmethod] — Apply a color space transform with a target compression setting to a texture asset.
  - `set_active_viewport_configuration(configuration)` -> `None` [classmethod] — Set the active editor viewportâs display configuration color transform .
