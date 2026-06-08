# UE Python API — OpenColorIO Module

**8 types** from the `OpenColorIO` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `OpenColorIOColorConversionSettings`, `OpenColorIOColorSpace`, `OpenColorIODisplayConfiguration`, `OpenColorIODisplayView`, `OpenColorIOConfiguration`, `OpenColorIODisplayExtensionWrapper`, `OpenColorIOLibrary`, `OpenColorIOViewTransformDirection`

---

## Classes

### `unreal.OpenColorIOColorConversionSettings`
Inherits: `StructBase` | Header: `OpenColorIOColorSpace.h`

Identifies a OCIO ColorSpace conversion.

**Properties** (5):
  - `configuration_source`: `OpenColorIOConfiguration` — [Read-Write] The source color space name. (OpenColorIOConfiguration)
  - `destination_color_space`: `OpenColorIOColorSpace` — [Read-Write] The destination color space name. (OpenColorIOColorSpace)
  - `destination_display_view`: `OpenColorIODisplayView` — [Read-Write] The destination display view name. (OpenColorIODisplayView)
  - `display_view_direction`: `OpenColorIOViewTransformDirection` — [Read-Write] The display view direction. (OpenColorIOViewTransformDirection)
  - `source_color_space`: `OpenColorIOColorSpace` — [Read-Write] The source color space name. (OpenColorIOColorSpace)

### `unreal.OpenColorIOColorSpace`
Inherits: `StructBase` | Header: `OpenColorIOColorSpace.h`

Structure to identify a ColorSpace as described in an OCIO configuration file. Members are populated by data coming from a config file.

**Properties** (3):
  - `color_space_index`: `int` — [Read-Write]
deprecated: ColorSpaceIndex has been deprecated. (int32)
  - `color_space_name`: `str` — [Read-Write] The ColorSpace name. (str)
  - `family_name`: `str` — [Read-Write] The family of this ColorSpace as specified in the configuration file.
When you have lot...

### `unreal.OpenColorIODisplayConfiguration`
Inherits: `StructBase` | Header: `OpenColorIOColorSpace.h`

Identifies an OCIO Display look configuration

**Properties** (2):
  - `color_configuration`: `OpenColorIOColorConversionSettings` — [Read-Write] Conversion to apply when this display is enabled (OpenColorIOColorConversionSettings)
  - `is_enabled`: `bool` — [Read-Write] Whether or not this display configuration is enabled
Since display look are applied on ...

### `unreal.OpenColorIODisplayView`
Inherits: `StructBase` | Header: `OpenColorIOColorSpace.h`

Open Color IODisplay View

**Properties** (2):
  - `display`: `str` — [Read-Write] Display name. (str)
  - `view`: `str` — [Read-Write] View name. (str)

### `unreal.OpenColorIOConfiguration`
Inherits: `Object` | Header: `OpenColorIOConfiguration.h`

Asset to manage allowed OpenColorIO color spaces. This will create required transform objects.

**Methods** (1):
  - `reload_existing_colorspaces(force = False)` -> `None` — This forces to reload colorspaces and corresponding shaders if those are not loaded already.

**Properties** (4):
  - `configuration_file`: `FilePath` — [Read-Write] (FilePath)
  - `context`: `None` — [Read-Write] OCIO context of key-value string pairs, typically used to apply shot-specific looks (su...
  - `desired_color_spaces`: `None` — [Read-Write] (Array[OpenColorIOColorSpace])
  - `desired_display_views`: `None` — [Read-Write] (Array[OpenColorIODisplayView])

### `unreal.OpenColorIODisplayExtensionWrapper`
Inherits: `Object` | Header: `OpenColorIODisplayExtensionWrapper.h`

This Blueprintable object can hold an OCIO Scene View Extension. You can change its OCIO config, and specify the context in which you want it to be active on.

**Methods** (7):
  - `create_in_game_open_color_io_display_extension(display_configuration)` -> `OpenColorIODisplayExtensionWrapper` [classmethod] — Creates an instance of this object, configured for use in game with the given OCIO configuration.
  - `create_open_color_io_display_extension(display_configuration, is_active_function)` -> `OpenColorIODisplayExtensionWrapper` [classmethod] — Creates an instance of this object, configured with the given arguments (OCIO and activation function).
  - `get_open_color_io_configuration()` -> `OpenColorIODisplayConfiguration` — Gets the display extension OCIO configuration.
  - `remove_scene_extension()` -> `None` — Removes the extension.
  - `set_open_color_io_configuration(display_configuration)` -> `None` — Sets the display extension OCIO configuration.
  - `set_scene_extension_is_active_function(is_active_function)` -> `None` — Sets a single activation function. Will remove any others.
  - `set_scene_extension_is_active_functions(is_active_functions)` -> `None` — Sets an array of activation functions. Will remove any others.

### `unreal.OpenColorIOLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `OpenColorIOBlueprintLibrary.h`

Open Color IOBlueprint Library

**Methods** (1):
  - `apply_color_space_transform(world_context_object, conversion_settings, input_texture, output_render_target)` -> `bool` [classmethod] — Applies a rendering pass of the color transform described in the settings

### `unreal.OpenColorIOViewTransformDirection`
Inherits: `EnumBase` | Header: `OpenColorIOColorSpace.h`

Transformation direction type for display-view transformations.

**Properties** (2):
  - `FORWARD`: `OpenColorIOViewTransformDirection = Ellipsis` — 0
  - `INVERSE`: `OpenColorIOViewTransformDirection = Ellipsis` — 1
