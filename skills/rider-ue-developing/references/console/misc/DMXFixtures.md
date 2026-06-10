# UE Python API — DMXFixtures Module

**9 types** from the `DMXFixtures` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMXChannelData`, `DMXFixtureActor`, `DMXFixtureActorBase`, `DMXFixtureActorMatrix`, `DMXFixtureComponent`, `DMXFixtureComponentColor`, `DMXFixtureComponentDouble`, `DMXFixtureComponentSingle`, `DMXFixtureQualityLevel`

---

## Classes

### `unreal.DMXChannelData`
Inherits: `StructBase` | Header: `DMXFixtureComponent.h`

DMXChannel Data

**Properties** (4):
  - `default_value`: `float` [Read-Only] — [Read-Only] (float)
  - `max_value`: `float` [Read-Only] — [Read-Only] (float)
  - `min_value`: `float` [Read-Only] — [Read-Only] (float)
  - `name`: `DMXAttributeName` [Read-Only] — [Read-Only] (DMXAttributeName)

### `unreal.DMXFixtureActor`
Inherits: `DMXFixtureActorBase` | Header: `DMXFixtureActor.h`

DMXFixture Actor

**Methods** (9):
  - `initialize_fixture(static_mesh_lens, static_mesh_beam)` -> `None` — FUNCTIONSâââââââââââ
  - `on_mvr_get_supported_dmx_attributes()` — Should return the DMX Attributes the Actor supports
  - `set_light_cast_shadow(light_should_cast_shadow)` -> `None` — Sets if the light should cast shadows
  - `set_light_color_temp(new_light_color_temp)` -> `None` — Sets a new light color temperature
  - `set_light_distance_max(new_light_distance_max)` -> `None` — Sets a new max light distance
  - `set_light_intensity_max(new_light_intensity_max)` -> `None` — Sets the a new max light intensity
  - `set_pointlight_intensity_scale(new_pointlight_intensity_scale)` -> `None` — Sets a new pointlight intensity scale
  - `set_spotlight_intensity_scale(new_spotlight_intensity_scale)` -> `None` — Sets a new spotlight intensity scale
  - `update_spot_light_intensity()` -> `None` — Updates the spotlight intensity. Considers light intensity max, the spotlight intensity scale and the cone angle to comp...

**Properties** (24):
  - `base`: `SceneComponent` [Read-Only] — [Read-Only] HIERARCHYâââââââââââ (SceneComponent)
  - `beam_quality`: `float` — [Read-Write] Visual quality for the light beam - small value is visually better but cost more on GPU...
  - `disable_lights`: `bool` — [Read-Write] Disable lights rendering in the fixture to save on GPU (bool)
  - `dynamic_material_beam`: `MaterialInstanceDynamic` [Read-Only] — [Read-Only] (MaterialInstanceDynamic)
  - `dynamic_material_lens`: `MaterialInstanceDynamic` [Read-Only] — [Read-Only] (MaterialInstanceDynamic)
  - `dynamic_material_point_light`: `MaterialInstanceDynamic` [Read-Only] — [Read-Only] (MaterialInstanceDynamic)
  - `dynamic_material_spot_light`: `MaterialInstanceDynamic` [Read-Only] — [Read-Only] (MaterialInstanceDynamic)
  - `head`: `SceneComponent` [Read-Only] — [Read-Only] (SceneComponent)
  - `light_cast_shadow`: `bool` — [Read-Write] Enable/disable cast shadow on the spotlight and pointlight (bool)
  - `light_color_temp`: `float` — [Read-Write] Light color temperature on the spotlight and pointlight (float)
  - `light_distance_max`: `float` — [Read-Write] Sets Attenuation Radius on the spotlight and pointlight (float)
  - `light_intensity_max`: `float` — [Read-Write] Light intensity at 1 steradian (32.77deg half angle) (float)
  - `max_quality`: `float` — [Read-Write]
deprecated: Use ZoomQuality instead. (float)
  - `min_quality`: `float` — [Read-Write]
deprecated: Use BeamQuality instead. (float)
  - `occlusion_direction`: `ArrowComponent` [Read-Only] — [Read-Only] (ArrowComponent)
  - `point_light`: `PointLightComponent` [Read-Only] — [Read-Only] (PointLightComponent)
  - `pointlight_intensity_scale`: `float` — [Read-Write] Scales pointlight intensity (float)
  - `quality_level`: `DMXFixtureQualityLevel` — [Read-Write] Visual quality level that changes the number of samples in the volumetric beam (DMXFixt...
  - `spot_light`: `SpotLightComponent` [Read-Only] — [Read-Only] (SpotLightComponent)
  - `spotlight_intensity_scale`: `float` — [Read-Write] Scales spotlight intensity (float)
  - `static_mesh_components`: `None` [Read-Only] — [Read-Only] COMPONENTS âââââââââââ (Array[StaticMeshComponent])
  - `use_dynamic_occlusion`: `bool` — [Read-Write] Simple solution useful for walls, 1 linetrace from the center (bool)
  - `yoke`: `SceneComponent` [Read-Only] — [Read-Only] (SceneComponent)
  - `zoom_quality`: `float` — [Read-Write] Visual quality for the light beam when zoom is wide - small value is visually better bu...

### `unreal.DMXFixtureActorBase`
Inherits: `Actor` | Header: `DMXFixtureActorBase.h`

DMXFixture Actor Base

**Methods** (2):
  - `interpolate_dmx_components(delta_seconds)` -> `None` — Interpolate DMXComponents
  - `push_normalized_values_per_attribute(value_per_attribute_map)` -> `None` — Pushes DMX Values to the Fixture. Expects normalized values in the range of 0.0f - 1.0f

**Properties** (1):
  - `dmx`: `DMXComponent` [Read-Only] — [Read-Only] (DMXComponent)

### `unreal.DMXFixtureActorMatrix`
Inherits: `DMXFixtureActor` | Header: `DMXFixtureActorMatrix.h`

DMXFixture Actor Matrix

**Methods** (3):
  - `generate_editor_matrix_mesh()` -> `None` — Generate Editor Matrix Mesh
  - `initialize_matrix_fixture()` -> `None` — Initialize Matrix Fixture
  - `push_fixture_matrix_cell_data(matrix_pixel_data)` -> `None` — Push Fixture Matrix Cell Data

**Properties** (5):
  - `ignore_pixel_mapping_distribution_of_fixture_patch`: `bool` [Read-Only] — [Read-Only] If set to true, ignores the distribution set in the patch (hence the distribution become...
  - `matrix_depth`: `float` [Read-Only] — [Read-Only] (float)
  - `matrix_head`: `ProceduralMeshComponent` [Read-Only] — [Read-Only] (ProceduralMeshComponent)
  - `matrix_height`: `float` [Read-Only] — [Read-Only] (float)
  - `matrix_width`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.DMXFixtureComponent`
Inherits: `ActorComponent` | Header: `DMXFixtureComponent.h`

DMXFixture Component

**Methods** (5):
  - `get_parent_fixture_actor()` -> `DMXFixtureActor` — If attached to a DMX Fixture Actor, returns the parent fixture actor.
  - `get_supported_dmx_attributes()` -> `Array [ Name ]` — Should be implemented to let other objects (e.g. datasmith) know which attributes the component can handle
  - `get_texture_center_colors(texture_atlas, num_textures, update_texture_resource = True)` -> `Array [ LinearColor ]` — Reads pixel color in the middle of each âTextureâ and output linear colors. Note, this function locks the GPU to rea...
  - `initialize_component()` -> `None` — Called to initialize the component in blueprints
  - `interpolate_component(delta_seconds)` -> `None` — Called each tick when interpolation is enabled, to calculate the next value

### `unreal.DMXFixtureComponentColor`
Inherits: `DMXFixtureComponent` | Header: `DMXFixtureComponentColor.h`

Specific class to handle color mixing using 4 channels (rgb, cmy, rgbw). Note, the color values are never interpolated.

**Methods** (2):
  - `set_color_no_interp(new_color)` -> `None` — Sets the color of the component. Note DMX Fixture Component Color does not support interpolation
  - `set_component(new_color: LinearColor)` -> `None` — deprecated: âset_componentâ was renamed to âset_color_no_interpâ.

**Properties** (4):
  - `dmx_channel1`: `DMXAttributeName` — [Read-Write] (DMXAttributeName)
  - `dmx_channel2`: `DMXAttributeName` — [Read-Write] (DMXAttributeName)
  - `dmx_channel3`: `DMXAttributeName` — [Read-Write] (DMXAttributeName)
  - `dmx_channel4`: `DMXAttributeName` — [Read-Write] (DMXAttributeName)

### `unreal.DMXFixtureComponentDouble`
Inherits: `DMXFixtureComponent` | Header: `DMXFixtureComponentDouble.h`

Component that uses 2 DMX channels

**Methods** (12):
  - `dmx_interpolated_step(channel_index: int)` -> `float` — deprecated: âdmx_interpolated_stepâ was renamed to âget_dmx_interpolated_stepâ.
  - `dmx_interpolated_value(channel_index: int)` -> `float` — deprecated: âdmx_interpolated_valueâ was renamed to âget_dmx_interpolated_valueâ.
  - `dmx_is_interpolation_done(channel_index: int)` -> `bool` — deprecated: âdmx_is_interpolation_doneâ was renamed to âis_dmx_interpolation_doneâ.
  - `dmx_target_value(channel_index: int)` -> `float` — deprecated: âdmx_target_valueâ was renamed to âget_dmx_target_valueâ.
  - `get_dmx_interpolated_step(channel_index)` -> `float` — Gets the interpolation delta value (step) for this frame
  - `get_dmx_interpolated_value(channel_index)` -> `float` — Gets the current interpolated value
  - `get_dmx_target_value(channel_index)` -> `float` — Gets the target value towards which the component interpolates
  - `is_dmx_interpolation_done(channel_index)` -> `bool` — True if the target value is reached and no interpolation is required
  - `set_channel1_value_no_interp(channel1_value)` -> `None` — Sets first value of the second channel. When interpolation is enabled this function should be called until the value is ...
  - `set_channel2_value_no_interp(channel2_value)` -> `None` — Sets second value of the second channel. When interpolation is enabled this function should be called until the value is...
  - `set_component_channel1(channel1_value: float)` -> `None` — deprecated: âset_component_channel1â was renamed to âset_channel1_value_no_interpâ.
  - `set_component_channel2(channel2_value: float)` -> `None` — deprecated: âset_component_channel2â was renamed to âset_channel2_value_no_interpâ.

**Properties** (2):
  - `dmx_channel1`: `DMXChannelData` [Read-Only] — [Read-Only] The first dmx attribute the component handles (DMXChannelData)
  - `dmx_channel2`: `DMXChannelData` [Read-Only] — [Read-Only] The second dmx attribute the component handles (DMXChannelData)

### `unreal.DMXFixtureComponentSingle`
Inherits: `DMXFixtureComponent` | Header: `DMXFixtureComponentSingle.h`

Component that uses 1 DMX channel

**Methods** (10):
  - `dmx_interpolated_step()` -> `float` — deprecated: âdmx_interpolated_stepâ was renamed to âget_dmx_interpolated_stepâ.
  - `dmx_interpolated_value()` -> `float` — deprecated: âdmx_interpolated_valueâ was renamed to âget_dmx_interpolated_valueâ.
  - `dmx_is_interpolation_done()` -> `bool` — deprecated: âdmx_is_interpolation_doneâ was renamed to âis_dmx_interpolation_doneâ.
  - `dmx_target_value()` -> `float` — deprecated: âdmx_target_valueâ was renamed to âget_dmx_target_valueâ.
  - `get_dmx_interpolated_step()` -> `float` — Gets the interpolation delta value (step) for this frame
  - `get_dmx_interpolated_value()` -> `float` — Gets the current interpolated value
  - `get_dmx_target_value()` -> `float` — Gets the target value towards which the component interpolates
  - `is_dmx_interpolation_done()` -> `bool` — True if the target value is reached and no interpolation is required
  - `set_component(new_value: float)` -> `None` — deprecated: âset_componentâ was renamed to âset_value_no_interpâ.
  - `set_value_no_interp(new_value)` -> `None` — Called to set the value. When interpolation is enabled this function is called by the plugin until the target value is r...

**Properties** (1):
  - `dmx_channel`: `DMXChannelData` [Read-Only] — [Read-Only] (DMXChannelData)

### `unreal.DMXFixtureQualityLevel`
Inherits: `EnumBase` | Header: `DMXFixtureActor.h`

EDMXFixture Quality Level

**Properties** (5):
  - `CUSTOM`: `DMXFixtureQualityLevel = Ellipsis` — 4
  - `HIGH_QUALITY`: `DMXFixtureQualityLevel = Ellipsis` — 2
  - `LOW_QUALITY`: `DMXFixtureQualityLevel = Ellipsis` — 0
  - `MEDIUM_QUALITY`: `DMXFixtureQualityLevel = Ellipsis` — 1
  - `ULTRA_QUALITY`: `DMXFixtureQualityLevel = Ellipsis` — 3
