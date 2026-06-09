# UE Python API — DynamicMaterial Module

**51 types** from the `DynamicMaterial` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMMaterialStageConnectorChannel`, `DMValueDefinition`, `DMJsonSerializable`, `DMMaterialComponent`, `DMMaterialComponentDynamic`, `DMMaterialLinkedComponent`, `DMMaterialParameter`, `DMMaterialValue`, `DMMaterialValueBool`, `DMMaterialValueBoolDynamic`, `DMMaterialValueColorAtlas`, `DMMaterialValueColorAtlasDynamic`, `DMMaterialValueDynamic`, `DMMaterialValueFloat`, `DMMaterialValueFloat1`, `DMMaterialValueFloat1Dynamic`, `DMMaterialValueFloat2`, `DMMaterialValueFloat2Dynamic`, `DMMaterialValueFloat3RGB`, `DMMaterialValueFloat3RGBDynamic`, ... (51 total)

---

## Classes

### `unreal.DMMaterialStageConnectorChannel`
Inherits: `StructBase` | Header: `DMDefs.h`

An individual component of a connector (e.g. G from RGB.)

**Properties** (4):
  - `material_property`: `DMMaterialPropertyType` [Read-Only] — [Read-Only] When using previous stages, this is the material property the previous stage is using (D...
  - `output_channel`: `int` [Read-Only] — [Read-Only] This can be used to break down float2/3/4 into single pieces of data
A value of 0 will b...
  - `output_index`: `int` [Read-Only] — [Read-Only] The index of the output connector of the given stage. (int32)
  - `source_index`: `int` [Read-Only] — [Read-Only] The index of the source of this channel
Index 0 is the previous stage, 1+ are the other ...

### `unreal.DMValueDefinition`
Inherits: `StructBase` | Header: `DMValueDefinition.h`

Stores information about basic value types, such as EDMValueType::Float1.

**Properties** (5):
  - `channel_names`: `None` [Read-Only] — [Read-Only] (Array[Text])
  - `display_name`: `Text` [Read-Only] — [Read-Only] (Text)
  - `float_count`: `int` [Read-Only] — [Read-Only] (uint8)
  - `type`: `DMValueType` [Read-Only] — [Read-Only] (DMValueType)
  - `value_class`: `Class` [Read-Only] — [Read-Only] (type(Class))

### `unreal.DMJsonSerializable`
Inherits: `Interface` | Header: `DMJsonUtils.h`

DMJson Serializable

### `unreal.DMMaterialComponent`
Inherits: `Object` | Header: `DMMaterialComponent.h`

The base class for all material components. Has a few useful things.

**Methods** (18):
  - `get_component_by_path(path)` -> `DMMaterialComponent` — Searches the component for a specific component based on a path.
  - `get_component_description()` -> `Text` — Returns a description of this class/object.
  - `get_component_path()` -> `str` — Returns the complete path from the model to this component.
  - `get_component_state()` -> `DMComponentLifetimeState` — Get Component State
  - `get_editable_properties()` -> `Array [ Name ]` — Returns a list of FNames for this component representing editable UPROPERTYs.
  - `get_outer_safe()` -> `Object` — Does some checks to see whether the out is safe to retrieve and retrieves it.
  - `get_parent_component()` -> `DMMaterialComponent` — Returns the component that owns this component in the model hierarchy.
  - `get_typed_parent(parent_class, allow_subclasses)` -> `DMMaterialComponent` — Returns the first in the model hierarchy above this component of the given type.
  - `has_component_been_added()` -> `bool` — Returns true if this component is in the Added or greater state.
  - `has_component_been_created()` -> `bool` — This is a kind of âuselessâ check, a component has _always_ been created. Itâs here for completeness.
  - `has_component_been_removed()` -> `bool` — Returns true if this component is in the Removed or greater state.
  - `is_component_added()` -> `bool` — Returns true if this component is in the Added state.
  - `is_component_created()` -> `bool` — Returns true if this component is in the original âCreatedâ state and has not been moved onto Added or Removed.
  - `is_component_removed()` -> `bool` — Returns true if this component is in the Removed state.
  - `is_component_valid()` -> `bool` — Checks object flags and IsValid()
  - `is_property_visible(property_)` -> `bool` — Returns true the given UPROPERTY name is editable.
  - `set_component_state(new_state)` -> `None` — Changes the component state to a new one. Should not be used to set it back to Created.
  - `update(source, update_type)` -> `None` — Event that is triggered when this component, or a sub-component, changes to trigger other updates in the model.

**Properties** (3):
  - `component_dirty`: `bool` [Read-Only] — [Read-Only] (bool)
  - `component_state`: `DMComponentLifetimeState` [Read-Only] — [Read-Only] (DMComponentLifetimeState)
  - `editable_properties`: `None` [Read-Only] — [Read-Only] (Array[Name])

### `unreal.DMMaterialComponentDynamic`
Inherits: `DMMaterialComponent` | Header: `DMMaterialComponentDynamic.h`

Base version of a dynamic material component. Links to the original in the parent material model.

**Methods** (3):
  - `ge_resolved_parent_component()` -> `DMMaterialComponent` — Resolves and returns the component this dynamic one is based on.
  - `get_material_model_dynamic()` -> `DynamicMaterialModelDynamic` — Get Material Model Dynamic
  - `get_parent_component_name()` -> `Name` — Get Parent Component Name

**Properties** (1):
  - `parent_component_name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.DMMaterialLinkedComponent`
Inherits: `DMMaterialComponent` | Header: `DMMaterialLinkedComponent.h`

A component which links to a specific parent component in the hierarchy instead of its Outer.

**Methods** (1):
  - `set_parent_component(parent_component)` -> `None` — Sets the linked parent component.

### `unreal.DMMaterialParameter`
Inherits: `DMMaterialLinkedComponent` | Header: `DMMaterialParameter.h`

A parameter on a Material Designer Material.

**Methods** (3):
  - `get_material_model()` -> `DynamicMaterialModel` — Get Material Model
  - `get_parameter_name()` -> `Name` — Get Parameter Name
  - `rename_parameter(base_parameter_name)` -> `None` — Changes the parameter name registered with the Model.

**Properties** (1):
  - `parameter_name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.DMMaterialValue`
Inherits: `DMMaterialLinkedComponent` | Header: `DMMaterialValue.h`

A value used in a material. Manages its own parameter.

**Methods** (15):
  - `apply_default_value()` -> `None` — Subclasses should implement a SetDefaultValue.
  - `copy_parameters_from(other)` -> `None` — Copies the parameter-based value of the given value to this value, if possible.
  - `create_material_value(material_model, name, value_class, local)` -> `DMMaterialValue` [classmethod] — Creates a new material value and initializes it with the given material model.
  - `get_description()` -> `Text` — Combination of parameter name and type name. May be an automatically generated parameter name.
  - `get_material_model()` -> `DynamicMaterialModel` — Returns the owning material model (this objectâs Outer).
  - `get_material_parameter_name()` -> `Name` — Returns the specifically set parameter name or an automatically generated parameter name.
  - `get_parameter()` -> `DMMaterialParameter` — Returns the parameter component managed by this value. Will only exist if a parameter name has been set.
  - `get_should_expose_parameter()` -> `bool` — Get Should Expose Parameter
  - `get_type()` -> `DMValueType` — Returns the type of value as respresented by the possible base type enums.
  - `get_type_name()` -> `Text` — Uses the Value Definition Library to get the type name of the base enum type.
  - `is_default_value()` -> `bool` — Is Default Value
  - `is_local()` -> `bool` — Returns true is this value is not a âglobalâ value belonging directly to the Model, but belongs to a specific compon...
  - `reset_default_value()` -> `None` — Resets to the default default value. 0, nullptr, etc.
  - `set_parameter_name(base_name)` -> `bool` — Sets a specific parameter name, overriding the automatic one if a base name is provided, or resetting back to the origin...
  - `set_should_expose_parameter(expose)` -> `None` — Set Should Expose Parameter

**Properties** (5):
  - `cached_parameter_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `expose_parameter`: `bool` [Read-Only] — [Read-Only] (bool)
  - `local`: `bool` [Read-Only] — The value is local to the stage it is used in.
False: The value is a global value owned directly by ...
  - `parameter`: `DMMaterialParameter` [Read-Only] — [Read-Only] The parameter name used to expose this value in a material.
If it isnât provided, an a...
  - `type`: `DMValueType` [Read-Only] — [Read-Only] (DMValueType)

### `unreal.DMMaterialValueBool`
Inherits: `DMMaterialValue` | Header: `DMMaterialValueBool.h`

Component representing a bool value. Manages its own parameter.

**Methods** (4):
  - `get_default_value()` -> `bool` — Get Default Value
  - `get_value()` -> `bool` — Get Value
  - `set_default_value(default_value)` -> `None` — Set Default Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (2):
  - `default_value`: `bool` — [Read-Write] (bool)
  - `value`: `bool` — [Read-Write] (bool)

### `unreal.DMMaterialValueBoolDynamic`
Inherits: `DMMaterialValueDynamic` | Header: `DMMaterialValueBoolDynamic.h`

Link to a UDMMaterialValueBool for Material Designer Model Dynamics.

**Methods** (3):
  - `get_default_value()` -> `bool` — Get Default Value
  - `get_value()` -> `bool` — Get Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (1):
  - `value`: `bool` — [Read-Write] (bool)

### `unreal.DMMaterialValueColorAtlas`
Inherits: `DMMaterialValue` | Header: `DMMaterialValueColorAtlas.h`

Component representing a color atlas value. Manages its own parameter.

**Methods** (8):
  - `get_atlas()` -> `CurveLinearColorAtlas` — Get Atlas
  - `get_curve()` -> `CurveLinearColor` — Get Curve
  - `get_default_value()` -> `float` — Get Default Value
  - `get_value()` -> `float` — Get Value
  - `set_atlas(atlas)` -> `None` — Set Atlas
  - `set_curve(curve)` -> `None` — Set Curve
  - `set_default_value(default_value)` -> `None` — Set Default Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (4):
  - `atlas`: `CurveLinearColorAtlas` — [Read-Write] (CurveLinearColorAtlas)
  - `curve`: `CurveLinearColor` — [Read-Write] (CurveLinearColor)
  - `default_value`: `float` — [Read-Write] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.DMMaterialValueColorAtlasDynamic`
Inherits: `DMMaterialValueDynamic` | Header: `DMMaterialValueColorAtlasDynamic.h`

Link to a UDMMaterialValueColorAtlas for Material Designer Model Dynamics.

**Methods** (3):
  - `get_default_value()` -> `float` — Get Default Value
  - `get_value()` -> `float` — Get Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (1):
  - `value`: `float` — [Read-Write] (float)

### `unreal.DMMaterialValueDynamic`
Inherits: `DMMaterialComponentDynamic` | Header: `DMMaterialValueDynamic.h`

A value used inside an instanced material instance. Links to the original value in the parent material.

**Methods** (4):
  - `apply_default_value()` -> `None` — Apply Default Value
  - `copy_parameters_from(other)` -> `None` — Copies the parameter-based value of the given value to this value, if possible.
  - `get_parent_value()` -> `DMMaterialValue` — Resolves (if necessary) and returns the value this dynamic value is based on.
  - `is_default_value()` -> `bool` — Returns true if this value dynamicâs value is the same as the parent valueâs value.

### `unreal.DMMaterialValueFloat`
Inherits: `DMMaterialValue` | Header: `DMMaterialValueFloat.h`

Base class for float/scalar values in Materials.

**Methods** (3):
  - `get_value_range()` -> `FloatInterval` — The value range for any float component. If both values are the same, it is not set.
  - `has_value_range()` -> `bool` — Returns true if a value range has been set. This is true if the min and max arenât the same.
  - `set_value_range(value_range)` -> `None` — Sets the range of possible values. Set min and max to the same to disable.

**Properties** (1):
  - `value_range`: `FloatInterval` [Read-Only] — [Read-Only] (FloatInterval)

### `unreal.DMMaterialValueFloat1`
Inherits: `DMMaterialValueFloat` | Header: `DMMaterialValueFloat1.h`

Component representing a float/scalar value. Manages its own parameter.

**Methods** (4):
  - `get_default_value()` -> `float` — Get Default Value
  - `get_value()` -> `float` — Get Value
  - `set_default_value(default_value)` -> `None` — Set Default Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (2):
  - `default_value`: `float` — [Read-Write] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.DMMaterialValueFloat1Dynamic`
Inherits: `DMMaterialValueDynamic` | Header: `DMMaterialValueFloat1Dynamic.h`

Link to a UDMMaterialValueFloat1 for Material Designer Model Dynamics.

**Methods** (3):
  - `get_default_value()` -> `float` — Get Default Value
  - `get_value()` -> `float` — Get Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (1):
  - `value`: `float` — [Read-Write] (float)

### `unreal.DMMaterialValueFloat2`
Inherits: `DMMaterialValueFloat` | Header: `DMMaterialValueFloat2.h`

Component representing an FVector2D value. Manages its own parameter.

**Methods** (4):
  - `get_default_value()` -> `Vector2D` — Get Default Value
  - `get_value()` -> `Vector2D` — Get Value
  - `set_default_value(default_value)` -> `None` — Set Default Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (2):
  - `default_value`: `Vector2D` — [Read-Write] (Vector2D)
  - `value`: `Vector2D` — [Read-Write] (Vector2D)

### `unreal.DMMaterialValueFloat2Dynamic`
Inherits: `DMMaterialValueDynamic` | Header: `DMMaterialValueFloat2Dynamic.h`

Link to a UDMMaterialValueFloat2 for Material Designer Model Dynamics.

**Methods** (3):
  - `get_default_value()` -> `Vector2D` — Get Default Value
  - `get_value()` -> `Vector2D` — Get Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (1):
  - `value`: `Vector2D` — [Read-Write] (Vector2D)

### `unreal.DMMaterialValueFloat3RGB`
Inherits: `DMMaterialValueFloat` | Header: `DMMaterialValueFloat3RGB.h`

Component representing an FLinearColor (no alpha) value. Manages its own parameter.

**Methods** (4):
  - `get_default_value()` -> `LinearColor` — Get Default Value
  - `get_value()` -> `LinearColor` — Get Value
  - `set_default_value(default_value)` -> `None` — Set Default Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (2):
  - `default_value`: `LinearColor` — [Read-Write] (LinearColor)
  - `value`: `LinearColor` — [Read-Write] (LinearColor)

### `unreal.DMMaterialValueFloat3RGBDynamic`
Inherits: `DMMaterialValueDynamic` | Header: `DMMaterialValueFloat3RGBDynamic.h`

Link to a UDMMaterialValue3RGB for Material Designer Model Dynamics.

**Methods** (3):
  - `get_default_value()` -> `LinearColor` — Get Default Value
  - `get_value()` -> `LinearColor` — Get Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (1):
  - `value`: `LinearColor` — [Read-Write] (LinearColor)

### `unreal.DMMaterialValueFloat3RPY`
Inherits: `DMMaterialValueFloat` | Header: `DMMaterialValueFloat3RPY.h`

Component representing an FRotator value. Manages its own parameter.

**Methods** (4):
  - `get_default_value()` -> `Rotator` — Get Default Value
  - `get_value()` -> `Rotator` — Get Value
  - `set_default_value(default_value)` -> `None` — Set Default Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (2):
  - `default_value`: `Rotator` — [Read-Write] (Rotator)
  - `value`: `Rotator` — [Read-Write] (Rotator)

### `unreal.DMMaterialValueFloat3RPYDynamic`
Inherits: `DMMaterialValueDynamic` | Header: `DMMaterialValueFloat3RPYDynamic.h`

Link to a UDMMaterialValueFloat3RPY for Material Designer Model Dynamics.

**Methods** (3):
  - `get_default_value()` -> `Rotator` — Get Default Value
  - `get_value()` -> `Rotator` — Get Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (1):
  - `value`: `Rotator` — [Read-Write] (Rotator)

### `unreal.DMMaterialValueFloat3XYZ`
Inherits: `DMMaterialValueFloat` | Header: `DMMaterialValueFloat3XYZ.h`

Component representing an FVector value. Manages its own parameter.

**Methods** (4):
  - `get_default_value()` -> `Vector` — Get Default Value
  - `get_value()` -> `Vector` — Get Value
  - `set_default_value(default_value)` -> `None` — Set Default Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (2):
  - `default_value`: `Vector` — [Read-Write] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.DMMaterialValueFloat3XYZDynamic`
Inherits: `DMMaterialValueDynamic` | Header: `DMMaterialValueFloat3XYZDynamic.h`

Link to a UDMMaterialValueFloat3XYZ for Material Designer Model Dynamics.

**Methods** (3):
  - `get_default_value()` -> `Vector` — Get Default Value
  - `get_value()` -> `Vector` — Get Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (1):
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.DMMaterialValueFloat4`
Inherits: `DMMaterialValueFloat` | Header: `DMMaterialValueFloat4.h`

Component representing a float4 value. Manages its own parameter.

**Methods** (4):
  - `get_default_value()` -> `LinearColor` — Get Default Value
  - `get_value()` -> `LinearColor` — Get Value
  - `set_default_value(default_value)` -> `None` — Set Default Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (2):
  - `default_value`: `LinearColor` — [Read-Write] (LinearColor)
  - `value`: `LinearColor` — [Read-Write] (LinearColor)

### `unreal.DMMaterialValueFloat4Dynamic`
Inherits: `DMMaterialValueDynamic` | Header: `DMMaterialValueFloat4Dynamic.h`

Link to a UDMMaterialValueFloat4 for Material Designer Model Dynamics.

**Methods** (3):
  - `get_default_value()` -> `LinearColor` — Get Default Value
  - `get_value()` -> `LinearColor` — Get Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (1):
  - `value`: `LinearColor` — [Read-Write] (LinearColor)

### `unreal.DMMaterialValueRenderTarget`
Inherits: `DMMaterialValueTexture` | Header: `DMMaterialValueRenderTarget.h`

Component representing a render target texture value. Manages its own parameter.

**Methods** (9):
  - `get_clear_color()` -> `LinearColor` — Get Clear Color
  - `get_render_target()` -> `TextureRenderTarget2D` — Get Render Target
  - `get_renderer()` -> `DMRenderTargetRenderer` — Get Renderer
  - `get_texture_format()` -> `TextureRenderTargetFormat` — Get Texture Format
  - `get_texture_size()` -> `IntPoint` — Get Texture Size
  - `set_clear_color(clear_color)` -> `None` — Set Clear Color
  - `set_renderer(renderer)` -> `None` — Set Renderer
  - `set_texture_format(texture_format)` -> `None` — Set Texture Format
  - `set_texture_size(texture_size)` -> `None` — Set Texture Size

**Properties** (4):
  - `clear_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `renderer`: `DMRenderTargetRenderer` — [Read-Write] (DMRenderTargetRenderer)
  - `texture_format`: `TextureRenderTargetFormat` — [Read-Write] (TextureRenderTargetFormat)
  - `texture_size`: `IntPoint` — [Read-Write] (IntPoint)

### `unreal.DMMaterialValueRenderTargetDynamic`
Inherits: `DMMaterialValueDynamic` | Header: `DMMaterialValueRenderTargetDynamic.h`

Skeleton class because this offers no functionality in a dynamic model. Yet.

### `unreal.DMMaterialValueTexture`
Inherits: `DMMaterialValue` | Header: `DMMaterialValueTexture.h`

Component representing a texture value. Manages its own parameter.

**Methods** (6):
  - `create_material_value_texture(outer, texture)` -> `DMMaterialValueTexture` [classmethod] — Create Material Value Texture
  - `get_default_value()` -> `Texture` — Get Default Value
  - `get_value()` -> `Texture` — Get Value
  - `has_alpha()` -> `bool` — Return true if the texture value has an alpha channel.
  - `set_default_value(default_value)` -> `None` — Set Default Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (2):
  - `default_value`: `Texture` — [Read-Write] (Texture)
  - `value`: `Texture` — [Read-Write] (Texture)

### `unreal.DMMaterialValueTextureDynamic`
Inherits: `DMMaterialValueDynamic` | Header: `DMMaterialValueTextureDynamic.h`

Link to a UDMMaterialValueTexture for Material Designer Model Dynamics.

**Methods** (3):
  - `get_default_value()` -> `Texture` — Get Default Value
  - `get_value()` -> `Texture` — Get Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (1):
  - `value`: `Texture` — [Read-Write] (Texture)

### `unreal.DMParameterContainer`
Inherits: `Interface` | Header: `IDMParameterContainer.h`

DMParameter Container

**Methods** (1):
  - `copy_parameters_from(other)` -> `None` — Copies the parameter-based value of the given value to this value, if possible.

### `unreal.DMRenderTargetRenderer`
Inherits: `DMMaterialComponent` | Header: `DMRenderTargetRenderer.h`

A component responsible for rendering something to a texture render target (value).

**Methods** (5):
  - `async_update_render_target()` -> `None` — Updates the contents of the render target, redrawing and possibly resizing it, at the end of the frame.
  - `create_render_target_renderer(renderer_class, render_target_value)` -> `DMRenderTargetRenderer` [classmethod] — Creates a render of the given class and initializes it.
  - `get_render_target_value()` -> `DMMaterialValueRenderTarget` — Returns the render target value (the objectâs Outer).
  - `is_updating()` -> `bool` — Returns true is this target is currently being re-rendering.
  - `update_render_target()` -> `None` — Updates the contents of the render target, redrawing and possibly resizing it.

### `unreal.DMRenderTargetTextRenderer`
Inherits: `DMRenderTargetWidgetRendererBase` | Header: `DMRenderTargetTextRenderer.h`

Renderer that renders an STextBlock widget and exposes all its parameters/properties.

**Methods** (46):
  - `get_auto_wrap_text()` -> `bool` — Get Auto Wrap Text
  - `get_background_color()` -> `LinearColor` — Get Background Color
  - `get_flow_direction()` -> `TextFlowDirection` — Get Flow Direction
  - `get_font_info()` -> `SlateFontInfo` — Get Font Info
  - `get_has_highlight()` -> `bool` — Get Has Highlight
  - `get_has_shadow()` -> `bool` — Get Has Shadow
  - `get_highlight_color()` -> `LinearColor` — Get Highlight Color
  - `get_justify()` -> `TextJustify` — Get Justify
  - `get_line_height()` -> `float` — Get Line Height
  - `get_padding_bottom()` -> `float` — Get Padding Bottom
  - `get_padding_left()` -> `float` — Get Padding Left
  - `get_padding_right()` -> `float` — Get Padding Right
  - `get_padding_top()` -> `float` — Get Padding Top
  - `get_shadow_color()` -> `LinearColor` — Get Shadow Color
  - `get_shadow_offset()` -> `Vector2D` — Get Shadow Offset
  - `get_shaping_method()` -> `TextShapingMethod` — Get Shaping Method
  - `get_strike_brush()` -> `InstancedStruct` — Get Strike Brush
  - `get_text()` -> `Text` — Get Text
  - `get_text_color()` -> `LinearColor` — Get Text Color
  - `get_transform_policy()` -> `TextTransformPolicy` — Get Transform Policy
  - `get_wrap_text_at()` -> `float` — Get Wrap Text At
  - `get_wrapping_policy()` -> `TextWrappingPolicy` — Get Wrapping Policy
  - `is_overriding_render_target_size()` -> `bool` — Is Overriding Render Target Size
  - `set_auto_wrap_text(auto_wrap)` -> `None` — Set Auto Wrap Text
  - `set_background_color(background_color)` -> `None` — Set Background Color
  - `set_flow_direction(flow_direction)` -> `None` — Set Flow Direction
  - `set_font_info(font_info)` -> `None` — Set Font Info
  - `set_has_highlight(has_highlight)` -> `None` — Set Has Highlight
  - `set_has_shadow(has_shadow)` -> `None` — Set Has Shadow
  - `set_highlight_color(highlight_color)` -> `None` — Set Highlight Color
  - `set_justify(justify)` -> `None` — Set Justify
  - `set_line_height(line_height)` -> `None` — Set Line Height
  - `set_override_render_target_size(override)` -> `None` — Set Override Render Target Size
  - `set_padding_bottom(padding)` -> `None` — Set Padding Bottom
  - `set_padding_left(padding)` -> `None` — Set Padding Left
  - `set_padding_right(padding)` -> `None` — Set Padding Right
  - `set_padding_top(padding)` -> `None` — Set Padding Top
  - `set_shadow_color(shadow_color)` -> `None` — Set Shadow Color
  - `set_shadow_offset(shadow_offset)` -> `None` — Set Shadow Offset
  - `set_shaping_method(shaping_method)` -> `None` — Set Shaping Method
  - `set_strike_brush(strike_brush)` -> `None` — Set Strike Brush
  - `set_text(text)` -> `None` — Set Text
  - `set_text_color(color)` -> `None` — Set Text Color
  - `set_transform_policy(transform_policy)` -> `None` — Set Transform Policy
  - `set_wrap_text_at(wrap_at)` -> `None` — Set Wrap Text At
  - `set_wrapping_policy(wrapping_policy)` -> `None` — Set Wrapping Policy

**Properties** (22):
  - `auto_wrap_text`: `bool` — [Read-Write] (bool)
  - `flow_direction`: `TextFlowDirection` — [Read-Write] (TextFlowDirection)
  - `font_info`: `SlateFontInfo` — [Read-Write] (SlateFontInfo)
  - `has_highlight`: `bool` — [Read-Write] (bool)
  - `has_shadow`: `bool` — [Read-Write] (bool)
  - `highlight_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `justify`: `TextJustify` — [Read-Write] (TextJustify)
  - `line_height`: `float` — [Read-Write] Multiplier on the base font height. (float)
  - `override_render_target_size`: `bool` — [Read-Write] When true, will change the size of the render target to fit the text. (bool)
  - `padding_bottom`: `float` — [Read-Write] Extra space adding beyond the edge of the glyphs. Useful for shadows, glows, etc. (floa...
  - `padding_left`: `float` — [Read-Write] Extra space adding beyond the edge of the glyphs. Useful for shadows, glows, etc. (floa...
  - `padding_right`: `float` — [Read-Write] Extra space adding beyond the edge of the glyphs. Useful for shadows, glows, etc. (floa...
  - `padding_top`: `float` — [Read-Write] Extra space adding beyond the edge of the glyphs. Useful for shadows, glows, etc. (floa...
  - `shadow_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `shadow_offset`: `Vector2D` — [Read-Write] (Vector2D)
  - `shaping_method`: `TextShapingMethod` — [Read-Write] (TextShapingMethod)
  - `strike_brush`: `InstancedStruct` — [Read-Write] (InstancedStruct)
  - `text`: `Text` — [Read-Write] (Text)
  - `text_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `transform_policy`: `TextTransformPolicy` — [Read-Write] (TextTransformPolicy)
  - `wrap_text_at`: `float` — [Read-Write] (float)
  - `wrapping_policy`: `TextWrappingPolicy` — [Read-Write] (TextWrappingPolicy)

### `unreal.DMRenderTargetUMGWidgetRenderer`
Inherits: `DMRenderTargetWidgetRendererBase` | Header: `DMRenderTargetUMGWidgetRenderer.h`

DMRender Target UMGWidget Renderer

**Methods** (2):
  - `get_widget_class()` — Get Widget Class
  - `set_widget_class(widget_class)` -> `None` — Set Widget Class

**Properties** (1):
  - `widget_class`: `Class` — [Read-Write] (type(Class))

### `unreal.DMRenderTargetWidgetRendererBase`
Inherits: `DMRenderTargetRenderer` | Header: `DMRenderTargetWidgetRendererBase.h`

Renderer that renders UWidgets to render targets.

### `unreal.DMTextureUV`
Inherits: `DMMaterialLinkedComponent` | Header: `DMTextureUV.h`

Represents a Texture UV material function with the following parameters: offset, tiling, pivot and rotation.

**Methods** (23):
  - `copy_parameters_from(other)` -> `None` — Copies the parameter-based value of the given value to this value, if possible.
  - `create_texture_uv(outer)` -> `DMTextureUV` [classmethod] — Create Texture UV
  - `get_material_model()` -> `DynamicMaterialModel` — Get Material Model
  - `get_material_parameter(property_name, component)` -> `DMMaterialParameter` — Get Material Parameter
  - `get_material_parameter_name(property_name, component)` -> `Name` — Get Material Parameter Name
  - `get_mirror_on_x()` -> `bool` — Get Mirror on X
  - `get_mirror_on_y()` -> `bool` — Get Mirror on Y
  - `get_offset()` -> `Vector2D` — Get Offset
  - `get_parameters()` -> `Array [ DMMaterialParameter ]` — Get Parameters
  - `get_pivot()` -> `Vector2D` — Get Pivot
  - `get_rotation()` -> `float` — Get Rotation
  - `get_should_expose_parameter(property_name, component)` -> `bool` — Get Should Expose Parameter
  - `get_tiling()` -> `Vector2D` — Get Tiling
  - `get_uv_source()` -> `DMUVSource` — Get UVSource
  - `set_material_parameter_name(property_name, component, new_name)` -> `bool` — Set Material Parameter Name
  - `set_mirror_on_x(mirror_on_x)` -> `None` — Set Mirror on X
  - `set_mirror_on_y(mirror_on_y)` -> `None` — Set Mirror on Y
  - `set_offset(offset)` -> `None` — Set Offset
  - `set_pivot(pivot)` -> `None` — Set Pivot
  - `set_rotation(rotation)` -> `None` — Set Rotation
  - `set_should_expose_parameter(property_name, component, expose)` -> `None` — Set Should Expose Parameter
  - `set_tiling(tiling)` -> `None` — Set Tiling
  - `set_uv_source(uv_source)` -> `None` — Set UVSource

**Properties** (11):
  - `cached_parameter_names`: `None` [Read-Only] — [Read-Only] (Map[int32,Name])
  - `exposed_parameters`: `None` [Read-Only] — [Read-Only] (Set[int32])
  - `link_tiling`: `bool` — [Read-Write] (bool)
  - `material_parameters`: `None` [Read-Only] — [Read-Only] (Map[int32,DMMaterialParameter])
  - `mirror_on_x`: `bool` — [Read-Write] Forces a material rebuild. (bool)
  - `mirror_on_y`: `bool` — [Read-Write] Forces a material rebuild. (bool)
  - `offset`: `Vector2D` — [Read-Write] (Vector2D)
  - `pivot`: `Vector2D` — [Read-Write] Pivot for rotation and tiling. (Vector2D)
  - `rotation`: `float` — [Read-Write] (float)
  - `tiling`: `Vector2D` — [Read-Write] (Vector2D)
  - `uv_source`: `DMUVSource` — [Read-Write] Forces a material rebuild. (DMUVSource)

### `unreal.DMTextureUVDynamic`
Inherits: `DMMaterialComponentDynamic` | Header: `DMTextureUVDynamic.h`

A texture uv used inside a instanced material instance. Links to the original texture uv in the parent material.

**Methods** (10):
  - `copy_parameters_from(other)` -> `None` — Copies the parameter-based value of the given value to this value, if possible.
  - `get_offset()` -> `Vector2D` — Returns the dynamic value for this property.
  - `get_parent_texture_uv()` -> `DMTextureUV` — Resolves and returns the parent texture uv from the parent model.
  - `get_pivot()` -> `Vector2D` — Returns the dynamic value for this property.
  - `get_rotation()` -> `float` — Returns the dynamic value for this property.
  - `get_tiling()` -> `Vector2D` — Returns the dynamic value for this property.
  - `set_offset(offset)` -> `None` — Sets the dynamic value for this property.
  - `set_pivot(pivot)` -> `None` — Sets the dynamic value for this property.
  - `set_rotation(rotation)` -> `None` — Sets the dynamic value for this property.
  - `set_tiling(tiling)` -> `None` — Sets the dynamic value for this property.

**Properties** (4):
  - `offset`: `Vector2D` — [Read-Write] (Vector2D)
  - `pivot`: `Vector2D` — [Read-Write] Pivot for rotation and tiling. (Vector2D)
  - `rotation`: `float` — [Read-Write] (float)
  - `tiling`: `Vector2D` — [Read-Write] (Vector2D)

### `unreal.DMValueDefinitionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DMValueDefinition.h`

DMValue Definition Library

**Methods** (4):
  - `bp_are_types_compatible(a, b, a_channel, b_channel)` -> `bool` [classmethod] — Returns whether the given types can be connected together as input/output.
  - `get_type_for_float_count(float_count)` -> `DMValueDefinition` [classmethod] — Converts a number of floats into the value type
  - `get_value_definition(value_type)` -> `DMValueDefinition` [classmethod] — Returns a value definition for the given value type.
  - `get_value_types()` -> `Array [ DMValueType ]` [classmethod] — Returns the array of available Value Types, excluding generics like None or Max.

### `unreal.DynamicMaterialInstance`
Inherits: `MaterialInstanceDynamic` | Header: `DynamicMaterialInstance.h`

A Material Designer Material with its own integrated Material Designer Model that generates the base Material.

**Methods** (2):
  - `get_material_model()` -> `DynamicMaterialModel` — Resolves the base Material Model used with this Instance and returns it.
  - `get_material_model_base()` -> `DynamicMaterialModelBase` — Returns the Material Model associated with this Material Designer Material.

**Properties** (2):
  - `material_model`: `DynamicMaterialModelBase` — âmaterial_modelâ was renamed to âmaterial_model_baseâ. deprecated
  - `material_model_base`: `DynamicMaterialModelBase` [Read-Only] — [Read-Only] (DynamicMaterialModelBase)

### `unreal.DynamicMaterialModel`
Inherits: `DynamicMaterialModelBase` | Header: `DynamicMaterialModel.h`

Dynamic Material Model

**Methods** (10):
  - `add_value(value_class)` -> `DMMaterialValue` — Creates a new value of the given class and returns it.
  - `bp_get_editor_only_data()` -> `DynamicMaterialModelEditorOnlyDataInterface` — Returns the editor only data for this model.
  - `get_component_by_path(path)` -> `DMMaterialComponent` — Searches the model for a specific component based on a path.
  - `get_global_opacity_value()` -> `DMMaterialValueFloat1` — Get Global Opacity Value
  - `get_global_parameter_value(name)` -> `DMMaterialValue` — Returns a specific global parameter value (such as global opacity) of the given object name (see global parameter FNames...
  - `get_global_parameter_value_for_material_property(property_)` -> `DMMaterialValue` — Returns a specific global parameter value (such as global opacity) for the given material property or nullptr.
  - `get_value_by_name(name)` -> `DMMaterialValue` — Returns a specific (non-global parameter) value of the given object name.
  - `get_values()` -> `Array [ DMMaterialValue ]` — Returns an array of the (non-global parameter) values used in this Model.
  - `has_parameter_name(parameter_name)` -> `bool` — Returns true if a parameter has with the given name exists on this Model. Will not include automatically generated compo...
  - `is_model_valid()` -> `bool` — Returns this if this is IsValid() and isnât isnât being destroyed.

**Properties** (24):
  - `dynamic_material`: `Material` [Read-Only] — [Read-Only] Material generated by the Model. (Material)
  - `dynamic_material_instance`: `DynamicMaterialInstance` [Read-Only] — [Read-Only] Material Designer Material representing the MID for this Model. (DynamicMaterialInstance...
  - `editor_only_data_si`: `Object` [Read-Only] — [Read-Only] Object holding the editor-only data used by this model. (Object)
  - `global_ambient_occlusion_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_anisotropy_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_base_color_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_displacement_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_emissive_color_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_metallic_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_normal_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_offset_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_opacity_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_pixel_depth_offset_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_refraction_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_rotation_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_roughness_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_specular_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_subsurface_color_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_surface_thickness_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_tangent_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_tiling_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `global_world_position_offset_parameter_value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)
  - `runtime_components`: `None` [Read-Only] — [Read-Only] References to runtime components outered to this model which are not otherwise reference...
  - `values`: `None` [Read-Only] — [Read-Only] Global values (Array[DMMaterialValue])

### `unreal.DynamicMaterialModelBase`
Inherits: `Object` | Header: `DynamicMaterialModelBase.h`

Base version of a dynamic material model.

**Methods** (3):
  - `get_dynamic_material_instance()` -> `DynamicMaterialInstance` — Returns the Material Designer Material that contains this Model, if there is one.
  - `get_generated_material()` -> `Material` — Returns the UMaterial from the resolved Material Model.
  - `resolve_material_model()` -> `DynamicMaterialModel` — Returns the Material Designer Model that is the base for this Model. It will be this object for a Model. It will be the ...

### `unreal.DynamicMaterialModelDynamic`
Inherits: `DynamicMaterialModelBase` | Header: `DynamicMaterialModelDynamic.h`

Represents a MID-like version of a Material Designer Model. Uses dynamic values/texture uvs to link to the original model.

**Methods** (4):
  - `create(outer, parent_model)` -> `DynamicMaterialModelDynamic` [classmethod] — Create a new Material Designer Model Instance based on a parent Model.
  - `get_component_by_path(path)` -> `DMMaterialComponent` — Finds the component with the given path.
  - `get_component_dynamic(name)` -> `DMMaterialComponentDynamic` — Returns the component with the given name or nullptr.
  - `get_parent_model()` -> `DynamicMaterialModel` — Resolves and returns the parent model from ParentModelSoft, saving it in the transient ParentModel.

**Properties** (3):
  - `dynamic_components`: `None` [Read-Only] — [Read-Only] Map of the dynamic components that reference the parent model. (Map[Name,DMMaterialCompo...
  - `dynamic_material_instance`: `DynamicMaterialInstance` [Read-Only] — [Read-Only] Hard reference to the instance, if it exists. (DynamicMaterialInstance)
  - `parent_model_soft`: `DynamicMaterialModel` [Read-Only] — [Read-Only] Soft reference to the parent model. (DynamicMaterialModel)

### `unreal.DynamicMaterialModelEditorOnlyDataInterface`
Inherits: `Interface` | Header: `IDynamicMaterialModelEditorOnlyDataInterface.h`

Dynamic Material Model Editor Only Data Interface

**Methods** (1):
  - `request_material_build(request_type = DMBuildRequestType.PREVIEW)` -> `None` — Called when the model needs to have the material rebuild.

### `unreal.DMBuildRequestType`
Inherits: `EnumBase` | Header: `IDynamicMaterialModelEditorOnlyDataInterface.h`

EDMBuild Request Type

**Properties** (3):
  - `ASYNC`: `DMBuildRequestType = Ellipsis` — Will try to add to the build queue or fallback to immediate compile. 1
  - `IMMEDIATE`: `DMBuildRequestType = Ellipsis` — Compile the material immediately. 0
  - `PREVIEW`: `DMBuildRequestType = Ellipsis` — If bAutomaticallyCompilePreviewMaterial is false, will just mark the material as changed,
but not ac...

### `unreal.DMComponentLifetimeState`
Inherits: `EnumBase` | Header: `DMMaterialComponent.h`

EDMComponent Lifetime State

**Properties** (3):
  - `ADDED`: `DMComponentLifetimeState = Ellipsis` — 1
  - `CREATED`: `DMComponentLifetimeState = Ellipsis` — 0
  - `REMOVED`: `DMComponentLifetimeState = Ellipsis` — 2

### `unreal.DMLocationType`
Inherits: `EnumBase` | Header: `DMDefs.h`

EDMLocation Type

**Properties** (2):
  - `ACTOR`: `DMLocationType = Ellipsis` — 1
  - `WORLD`: `DMLocationType = Ellipsis` — 0

### `unreal.DMMaterialPropertyType`
Inherits: `EnumBase` | Header: `DMDefs.h`

Some short names provided so they fit nicely on buttons!

**Properties** (23):
  - `AMBIENT_OCCLUSION`: `DMMaterialPropertyType = Ellipsis` — 11
  - `ANISOTROPY`: `DMMaterialPropertyType = Ellipsis` — 12
  - `ANY`: `DMMaterialPropertyType = Ellipsis` — 22
  - `BASE_COLOR`: `DMMaterialPropertyType = Ellipsis` — 1
  - `CUSTOM1`: `DMMaterialPropertyType = Ellipsis` — 15
  - `CUSTOM2`: `DMMaterialPropertyType = Ellipsis` — 16
  - `CUSTOM3`: `DMMaterialPropertyType = Ellipsis` — 17
  - `CUSTOM4`: `DMMaterialPropertyType = Ellipsis` — 18
  - `DISPLACEMENT`: `DMMaterialPropertyType = Ellipsis` — 19
  - `EMISSIVE_COLOR`: `DMMaterialPropertyType = Ellipsis` — 2
  - `METALLIC`: `DMMaterialPropertyType = Ellipsis` — 7
  - `NONE`: `DMMaterialPropertyType = Ellipsis` — 0
  - `NORMAL`: `DMMaterialPropertyType = Ellipsis` — 8
  - `OPACITY`: `DMMaterialPropertyType = Ellipsis` — 3
  - `OPACITY_MASK`: `DMMaterialPropertyType = Ellipsis` — 4
  - `PIXEL_DEPTH_OFFSET`: `DMMaterialPropertyType = Ellipsis` — 9
  - `REFRACTION`: `DMMaterialPropertyType = Ellipsis` — 13
  - `ROUGHNESS`: `DMMaterialPropertyType = Ellipsis` — 5
  - `SPECULAR`: `DMMaterialPropertyType = Ellipsis` — 6
  - `SUBSURFACE_COLOR`: `DMMaterialPropertyType = Ellipsis` — 20
  - `SURFACE_THICKNESS`: `DMMaterialPropertyType = Ellipsis` — 21
  - `TANGENT`: `DMMaterialPropertyType = Ellipsis` — 14
  - `WORLD_POSITION_OFFSET`: `DMMaterialPropertyType = Ellipsis` — 10

### `unreal.DMMaterialShadingModel`
Inherits: `EnumBase` | Header: `DMDefs.h`

EDMMaterial Shading Model

**Properties** (2):
  - `DEFAULT_LIT`: `DMMaterialShadingModel = Ellipsis` — 1
  - `UNLIT`: `DMMaterialShadingModel = Ellipsis` — 0

### `unreal.DMUpdateType`
Inherits: `EnumBase` | Header: `DMDefs.h`

EDMUpdate Type

**Properties** (4):
  - `ALLOW_PARENT_UPDATE`: `DMUpdateType = Ellipsis` — 2
  - `REFRESH_DETAIL_VIEW`: `DMUpdateType = Ellipsis` — 4
  - `STRUCTURE`: `DMUpdateType = Ellipsis` — 1
  - `VALUE`: `DMUpdateType = Ellipsis` — 0

### `unreal.DMUVSource`
Inherits: `EnumBase` | Header: `DMDefs.h`

EDMUVSource

**Properties** (3):
  - `SCREEN_POSITION`: `DMUVSource = Ellipsis` — 1
  - `TEXTURE`: `DMUVSource = Ellipsis` — 0
  - `WORLD_POSITION`: `DMUVSource = Ellipsis` — 2

### `unreal.DMValueType`
Inherits: `EnumBase` | Header: `DMDefs.h`

EDMValue Type

**Properties** (12):
  - `VT_BOOL`: `DMValueType = Ellipsis` — 1
  - `VT_COLOR_ATLAS`: `DMValueType = Ellipsis` — 10
  - `VT_FLOAT1`: `DMValueType = Ellipsis` — 2
  - `VT_FLOAT2`: `DMValueType = Ellipsis` — 3
  - `VT_FLOAT3_RGB`: `DMValueType = Ellipsis` — 5
  - `VT_FLOAT3_RPY`: `DMValueType = Ellipsis` — 4
  - `VT_FLOAT3_XYZ`: `DMValueType = Ellipsis` — 6
  - `VT_FLOAT4_RGBA`: `DMValueType = Ellipsis` — 7
  - `VT_FLOAT_ANY`: `DMValueType = Ellipsis` — 8
  - `VT_NONE`: `DMValueType = Ellipsis` — 0
  - `VT_TEXTURE`: `DMValueType = Ellipsis` — 9
  - `VT_UNUSED`: `DMValueType = Ellipsis` — 11
