# UE Python API — DatasmithInterchange Module

**11 types** from the `DatasmithInterchange` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DatasmithInterchangeStaticMeshDataNode`, `InterchangeDatasmithAreaLightFactory`, `InterchangeDatasmithAreaLightFactoryNode`, `InterchangeDatasmithAreaLightNode`, `InterchangeDatasmithLevelPipeline`, `InterchangeDatasmithMaterialPipeline`, `InterchangeDatasmithPbrMaterialNode`, `InterchangeDatasmithPipeline`, `InterchangeDatasmithStaticMeshPipeline`, `InterchangeDatasmithTranslator`, `InterchangeDatasmithTranslatorSettings`

---

## Classes

### `unreal.DatasmithInterchangeStaticMeshDataNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeDatasmithStaticMeshData.h`

Datasmith Interchange Static Mesh Data Node

### `unreal.InterchangeDatasmithAreaLightFactory`
Inherits: `InterchangeActorFactory` | Header: `InterchangeDatasmithAreaLightFactory.h`

Interchange Datasmith Area Light Factory

### `unreal.InterchangeDatasmithAreaLightFactoryNode`
Inherits: `InterchangeActorFactoryNode` | Header: `InterchangeDatasmithAreaLightFactoryNode.h`

Interchange Datasmith Area Light Factory Node

**Methods** (30):
  - `get_custom_attenuation_radius()` -> `float or None` — Get Custom Attenuation Radius
  - `get_custom_color()` -> `LinearColor or None` — Get Custom Color
  - `get_custom_dimensions()` -> `Vector2D or None` — Get Custom Dimensions
  - `get_custom_ies_brightness_scale()` -> `float or None` — Get Custom IESBrightness Scale
  - `get_custom_intensity()` -> `float or None` — Get Custom Intensity
  - `get_custom_intensity_units()` -> `LightUnits or None` — Get Custom Intensity Units
  - `get_custom_light_shape()` -> `DatasmithAreaLightActorShape or None` — Get Custom Light Shape
  - `get_custom_light_type()` -> `DatasmithAreaLightActorType or None` — Get Custom Light Type
  - `get_custom_rotation()` -> `Rotator or None` — Get Custom Rotation
  - `get_custom_source_length()` -> `float or None` — Get Custom Source Length
  - `get_custom_source_radius()` -> `float or None` — Get Custom Source Radius
  - `get_custom_spotlight_inner_angle()` -> `float or None` — Get Custom Spotlight Inner Angle
  - `get_custom_spotlight_outer_angle()` -> `float or None` — Get Custom Spotlight Outer Angle
  - `get_custom_temperature()` -> `float or None` — Get Custom Temperature
  - `get_custom_use_ies_brightness()` -> `bool or None` — Get Custom Use IESBrightness
  - `set_custom_attenuation_radius(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Attenuation Radius
  - `set_custom_color(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Color
  - `set_custom_dimensions(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Dimensions
  - `set_custom_ies_brightness_scale(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom IESBrightness Scale
  - `set_custom_intensity(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Intensity
  - `set_custom_intensity_units(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Intensity Units
  - `set_custom_light_shape(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Light Shape
  - `set_custom_light_type(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Light Type
  - `set_custom_rotation(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Rotation
  - `set_custom_source_length(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Source Length
  - `set_custom_source_radius(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Source Radius
  - `set_custom_spotlight_inner_angle(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Spotlight Inner Angle
  - `set_custom_spotlight_outer_angle(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Spotlight Outer Angle
  - `set_custom_temperature(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Temperature
  - `set_custom_use_ies_brightness(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Use IESBrightness

### `unreal.InterchangeDatasmithAreaLightNode`
Inherits: `InterchangeLightNode` | Header: `InterchangeDatasmithAreaLightNode.h`

Interchange Datasmith Area Light Node

**Methods** (16):
  - `get_custom_color()` -> `LinearColor or None` — Get Custom Color
  - `get_custom_dimensions()` -> `Vector2D or None` — Get Custom Dimensions
  - `get_custom_light_shape()` -> `DatasmithAreaLightActorShape or None` — Get Custom Light Shape
  - `get_custom_light_type()` -> `DatasmithAreaLightActorType or None` — Get Custom Light Type
  - `get_custom_source_length()` -> `float or None` — Get Custom Source Length
  - `get_custom_source_radius()` -> `float or None` — Get Custom Source Radius
  - `get_custom_spotlight_inner_angle()` -> `float or None` — Get Custom Spotlight Inner Angle
  - `get_custom_spotlight_outer_angle()` -> `float or None` — Get Custom Spotlight Outer Angle
  - `set_custom_color(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Color
  - `set_custom_dimensions(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Dimensions
  - `set_custom_light_shape(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Light Shape
  - `set_custom_light_type(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Light Type
  - `set_custom_source_length(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Source Length
  - `set_custom_source_radius(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Source Radius
  - `set_custom_spotlight_inner_angle(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Spotlight Inner Angle
  - `set_custom_spotlight_outer_angle(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Spotlight Outer Angle

### `unreal.InterchangeDatasmithLevelPipeline`
Inherits: `InterchangeGenericLevelPipeline` | Header: `InterchangeDatasmithLevelPipeline.h`

Interchange Datasmith Level Pipeline

### `unreal.InterchangeDatasmithMaterialPipeline`
Inherits: `InterchangeGenericMaterialPipeline` | Header: `InterchangeDatasmithMaterialPipeline.h`

Interchange Datasmith Material Pipeline

### `unreal.InterchangeDatasmithPbrMaterialNode`
Inherits: `InterchangeShaderGraphNode` | Header: `InterchangeDatasmithMaterialNode.h`

Interchange Datasmith Pbr Material Node

### `unreal.InterchangeDatasmithPipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeDatasmithPipeline.h`

Interchange Datasmith Pipeline

### `unreal.InterchangeDatasmithStaticMeshPipeline`
Inherits: `InterchangeGenericMeshPipeline` | Header: `InterchangeDatasmithStaticMeshPipeline.h`

Interchange Datasmith Static Mesh Pipeline

### `unreal.InterchangeDatasmithTranslator`
Inherits: `InterchangeTranslatorBase` | Header: `InterchangeDatasmithTranslator.h`

Interchange Datasmith Translator

### `unreal.InterchangeDatasmithTranslatorSettings`
Inherits: `InterchangeTranslatorSettings` | Header: `InterchangeDatasmithTranslator.h`

Interchange Datasmith Translator Settings

**Properties** (1):
  - `datasmith_option`: `DatasmithOptionsBase` — [Read-Write] (DatasmithOptionsBase)
