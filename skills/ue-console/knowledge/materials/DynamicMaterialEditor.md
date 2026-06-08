# UE Python API — DynamicMaterialEditor Module

**179 types** from the `DynamicMaterialEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMContentBrowserThumbnailSettings`, `DMDefaultMaterialPropertySlotValue`, `DMMaterialChannelListPreset`, `DMMaterialEffectList`, `DMMaterialEffectStackJson`, `DMMaterialLayer`, `DMMaterialSlotOutputConnectorTypes`, `DMMaterialStageConnection`, `DMMaterialStageConnector`, `DMBuildable`, `DMMaterialEffect`, `DMMaterialEffectFunction`, `DMMaterialEffectStack`, `DMMaterialEffectStackPresetSubsystem`, `DMMaterialLayerObject`, `DMMaterialProperty`, `DMMaterialPropertyAmbientOcclusion`, `DMMaterialPropertyAnisotropy`, `DMMaterialPropertyBaseColor`, `DMMaterialPropertyDisplacement`, ... (179 total)

---

## Classes

### `unreal.DMContentBrowserThumbnailSettings`
Inherits: `StructBase` | Header: `DynamicMaterialEditorSettings.h`

DMContent Browser Thumbnail Settings

### `unreal.DMDefaultMaterialPropertySlotValue`
Inherits: `StructBase` | Header: `DynamicMaterialEditorSettings.h`

DMDefault Material Property Slot Value

**Properties** (3):
  - `color`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)
  - `default_type`: `DMDefaultMaterialPropertySlotValueType` [Read-Only] — [Read-Only] (DMDefaultMaterialPropertySlotValueType)
  - `texture`: `Texture` [Read-Only] — [Read-Only] (Texture)

### `unreal.DMMaterialChannelListPreset`
Inherits: `StructBase` | Header: `DynamicMaterialEditorSettings.h`

DMMaterial Channel List Preset

**Properties** (21):
  - `ambient_occlusion`: `bool` [Read-Only] — [Read-Only] (bool)
  - `anisotropy`: `bool` [Read-Only] — [Read-Only] (bool)
  - `base_color`: `bool` [Read-Only] — [Read-Only] (bool)
  - `default_animated`: `bool` [Read-Only] — [Read-Only] (bool)
  - `default_blend_mode`: `BlendMode` [Read-Only] — [Read-Only] (BlendMode)
  - `default_shading_model`: `DMMaterialShadingModel` [Read-Only] — [Read-Only] (DMMaterialShadingModel)
  - `default_two_sided`: `bool` [Read-Only] — [Read-Only] (bool)
  - `displacement`: `bool` [Read-Only] — [Read-Only] (bool)
  - `emissive`: `bool` [Read-Only] — [Read-Only] (bool)
  - `metallic`: `bool` [Read-Only] — [Read-Only] (bool)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `normal`: `bool` [Read-Only] — [Read-Only] (bool)
  - `opacity`: `bool` [Read-Only] — [Read-Only] (bool)
  - `pixel_depth_offset`: `bool` [Read-Only] — [Read-Only] (bool)
  - `refraction`: `bool` [Read-Only] — [Read-Only] (bool)
  - `roughness`: `bool` [Read-Only] — [Read-Only] (bool)
  - `specular`: `bool` [Read-Only] — [Read-Only] (bool)
  - `subsurface_color`: `bool` [Read-Only] — [Read-Only] (bool)
  - `surface_thickness`: `bool` [Read-Only] — [Read-Only] (bool)
  - `tangent`: `bool` [Read-Only] — [Read-Only] (bool)
  - `world_position_offset`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.DMMaterialEffectList`
Inherits: `StructBase` | Header: `DynamicMaterialEditorSettings.h`

DMMaterial Effect List

**Properties** (2):
  - `effects`: `None` [Read-Only] — [Read-Only] (Array[MaterialFunctionInterface])
  - `name`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.DMMaterialEffectStackJson`
Inherits: `StructBase` | Header: `DMMaterialEffectStack.h`

DMMaterial Effect Stack Json

### `unreal.DMMaterialLayer`
Inherits: `StructBase` | Header: `DMMaterialLayer_Deprecated.h`

DMMaterial Layer

**Properties** (8):
  - `base`: `DMMaterialStage` [Read-Only] — [Read-Only] (DMMaterialStage)
  - `base_enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `layer_name`: `Text` [Read-Only] — [Read-Only] (Text)
  - `linked_u_vs`: `bool` [Read-Only] — [Read-Only] (bool)
  - `mask`: `DMMaterialStage` [Read-Only] — [Read-Only] (DMMaterialStage)
  - `mask_enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `material_property`: `DMMaterialPropertyType` [Read-Only] — [Read-Only] (DMMaterialPropertyType)

### `unreal.DMMaterialSlotOutputConnectorTypes`
Inherits: `StructBase` | Header: `DMEDefs.h`

DMMaterial Slot Output Connector Types

**Properties** (1):
  - `connector_types`: `None` [Read-Only] — [Read-Only] (Array[DMValueType])

### `unreal.DMMaterialStageConnection`
Inherits: `StructBase` | Header: `DMEDefs.h`

Represents the channels(channel = float, texture, etc.) that connect to an input.

**Properties** (1):
  - `channels`: `None` [Read-Only] — [Read-Only] This struct represents the connections made to a single input connector.
Can connect sin...

### `unreal.DMMaterialStageConnector`
Inherits: `StructBase` | Header: `DMEDefs.h`

An input or output form a material source/stage (e.g. RGB out.)

**Properties** (3):
  - `index`: `int` [Read-Only] — [Read-Only] This is the index of the input connector on the UMaterialExpression node (not on the sta...
  - `name`: `Text` [Read-Only] — [Read-Only] (Text)
  - `type`: `DMValueType` [Read-Only] — [Read-Only] (DMValueType)

### `unreal.DMBuildable`
Inherits: `Interface` | Header: `DMEDefs.h`

**Methods** (1):
  - `do_build(dirty_assets)` -> `None` — Do Build

### `unreal.DMMaterialEffect`
Inherits: `DMMaterialComponent` | Header: `DMMaterialEffect.h`

DMMaterial Effect

**Methods** (9):
  - `create_effect(effect_stack, effect_class)` -> `DMMaterialEffect` [classmethod] — Create Effect
  - `find_index()` -> `int32` — Retrieves the index of this effect in the effect stack.
  - `get_effect_description()` -> `Text` — Get Effect Description
  - `get_effect_name()` -> `Text` — Get Effect Name
  - `get_effect_stack()` -> `DMMaterialEffectStack` — Get Effect Stack
  - `get_effect_target()` -> `DMMaterialEffectTarget` — Returns the type of nodes which this effect targets.
  - `is_enabled()` -> `bool` — Is Enabled
  - `set_enabled(is_enabled)` -> `bool` — Set Enabled
  - `stage_type_to_effect_type(stage_type)` -> `DMMaterialEffectTarget` [classmethod] — Stage Type to Effect Type

**Properties** (2):
  - `effect_target`: `DMMaterialEffectTarget` [Read-Only] — [Read-Only] (DMMaterialEffectTarget)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.DMMaterialEffectFunction`
Inherits: `DMMaterialEffect` | Header: `DMMaterialEffectFunction.h`

DMMaterial Effect Function

**Methods** (4):
  - `bp_get_input_values()` -> `Array [ DMMaterialValue ]` — BP Get Input Values
  - `get_input_value(index)` -> `DMMaterialValue` — Returns the value used as the function input.
  - `get_material_function()` -> `MaterialFunctionInterface` — Get Material Function
  - `set_material_function(function)` -> `bool` — Set Material Function

**Properties** (2):
  - `input_values`: `None` [Read-Only] — [Read-Only] (Array[DMMaterialValue])
  - `material_function_ptr`: `MaterialFunctionInterface` [Read-Only] — [Read-Only] (MaterialFunctionInterface)

### `unreal.DMMaterialEffectStack`
Inherits: `DMMaterialComponent` | Header: `DMMaterialEffectStack.h`

Container for effects. Effects can be applied to either layers (on a per stage basis) or to slots.

**Methods** (17):
  - `add_effect(effect)` -> `bool` — Add Effect
  - `apply_preset(preset)` -> `None` — Apply the given preset to this stack. Does not remove old effects.
  - `bp_get_effects()` -> `Array [ DMMaterialEffect ]` — BP Get Effects
  - `bp_move_effect_by_index(index, new_index)` -> `bool` — BP Move Effect by Index
  - `bp_move_effect_by_value(effect, new_index)` -> `bool` — BP Move Effect by Value
  - `bp_remove_effect_by_index(index)` -> `DMMaterialEffect` — BP Remove Effect by Index
  - `bp_remove_effect_by_value(effect)` -> `bool` — BP Remove Effect by Value
  - `create_effect_stack_for_layer(layer)` -> `DMMaterialEffectStack` [classmethod] — Create Effect Stack for Layer
  - `create_effect_stack_for_slot(slot)` -> `DMMaterialEffectStack` [classmethod] — Create Effect Stack for Slot
  - `create_preset()` -> `DMMaterialEffectStackJson` — Creates a preset based on the current stage.
  - `get_effect(index)` -> `DMMaterialEffect` — Get Effect
  - `get_layer()` -> `DMMaterialLayerObject` — Get Layer
  - `get_slot()` -> `DMMaterialSlot` — Get Slot
  - `has_effect(effect)` -> `bool` — Has Effect
  - `is_enabled()` -> `bool` — Is Enabled
  - `set_effect(index, effect)` -> `DMMaterialEffect` — Set Effect
  - `set_enabled(is_enabled)` -> `bool` — Set Enabled

**Properties** (2):
  - `effects`: `None` [Read-Only] — [Read-Only] (Array[DMMaterialEffect])
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.DMMaterialEffectStackPresetSubsystem`
Inherits: `EditorSubsystem` | Header: `DMMaterialEffectStackPresetSubsystem.h`

DMMaterial Effect Stack Preset Subsystem

**Methods** (4):
  - `get_preset_names()` -> `Array [ str ]` — Get Preset Names
  - `load_preset(preset_name)` -> `DMMaterialEffectStackJson or None` — Load Preset
  - `remove_preset(preset_name)` -> `bool` — Remove Preset
  - `save_preset(preset_name, preset)` -> `bool` — Save Preset

### `unreal.DMMaterialLayerObject`
Inherits: `DMMaterialComponent` | Header: `DMMaterialLayer.h`

A collection of stages.

**Methods** (30):
  - `are_all_stages_enabled(stage_scope)` -> `bool` — Checks if both stages are enabled and valid
  - `are_all_stages_valid(stage_scope)` -> `bool` — Are All Stages Valid
  - `can_move_layer_above(layer)` -> `bool` — Can Move Layer Above
  - `can_move_layer_below(layer)` -> `bool` — Can Move Layer Below
  - `create_layer(slot, material_property, stages)` -> `DMMaterialLayerObject` [classmethod] — Create Layer
  - `find_index()` -> `int32` — Find the index of this layer in the slot.
  - `get_effect_stack()` -> `DMMaterialEffectStack` — Get Effect Stack
  - `get_first_enabled_stage(stage_scope)` -> `DMMaterialStage` — Checks for the first enabled and valid stage.
  - `get_first_valid_stage(stage_scope)` -> `DMMaterialStage` — Get First Valid Stage
  - `get_last_enabled_stage(stage_scope)` -> `DMMaterialStage` — Checks for the last enabled and valid stage.
  - `get_last_valid_stage(stage_scope)` -> `DMMaterialStage` — Get Last Valid Stage
  - `get_layer_name()` -> `Text` — Get Layer Name
  - `get_material_property()` -> `DMMaterialPropertyType` — Get Material Property
  - `get_next_layer(using_property, search_for)` -> `DMMaterialLayerObject` — Get Next Layer
  - `get_previous_layer(using_property, search_for)` -> `DMMaterialLayerObject` — Get Previous Layer
  - `get_slot()` -> `DMMaterialSlot` — Get Slot
  - `get_stage(stage_type = DMMaterialLayerStage.ALL, check_enabled = False)` -> `DMMaterialStage` — Get Stage
  - `get_stage_type(stage)` -> `DMMaterialLayerStage` — Get Stage Type
  - `get_stages(stage_type = DMMaterialLayerStage.ALL, check_enabled = False)` -> `Array [ DMMaterialStage ]` — Get Stages
  - `has_valid_stage(stage)` -> `bool` — Has Valid Stage
  - `has_valid_stage_of_type(stage_scope = DMMaterialLayerStage.ALL)` -> `bool` — Has Valid Stage Of Type
  - `is_enabled()` -> `bool` — Is Enabled
  - `is_stage_enabled(stage_scope = DMMaterialLayerStage.ALL)` -> `bool` — Is Stage Enabled
  - `is_texture_uv_link_enabled()` -> `bool` — Texture UV Link means that all stages use the same Texture UV from the base stage, if available.
  - `set_enabled(is_enabled)` -> `bool` — Set Enabled
  - `set_layer_name(name)` -> `None` — Set Layer Name
  - `set_material_property(material_property)` -> `bool` — Set Material Property
  - `set_stage(stage_type, stage)` -> `bool` — Replace the specified stage.
  - `set_texture_uv_link_enabled(value)` -> `bool` — Texture UV Link means that all stages use the same Texture UV from the base stage, if available.
  - `toggle_texture_uv_link_enabled()` -> `bool` — Texture UV Link means that all stages use the same Texture UV from the base stage, if available.

**Properties** (6):
  - `effect_stack`: `DMMaterialEffectStack` [Read-Only] — [Read-Only] (DMMaterialEffectStack)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `layer_name`: `Text` [Read-Only] — [Read-Only] (Text)
  - `linked_u_vs`: `bool` [Read-Only] — [Read-Only] (bool)
  - `material_property`: `DMMaterialPropertyType` [Read-Only] — [Read-Only] (DMMaterialPropertyType)
  - `stages`: `None` [Read-Only] — [Read-Only] (Array[DMMaterialStage])

### `unreal.DMMaterialProperty`
Inherits: `DMMaterialComponent` | Header: `DMMaterialProperty.h`

Base Color, Specular, Opacity, etc

**Methods** (11):
  - `get_description()` -> `Text` — The description of this property based on the EDMMaterialPropertyType enum.
  - `get_input_connection_map()` -> `DMMaterialStageConnection`
  - `get_input_connector_type()` -> `DMValueType`
  - `get_material_model_editor_only_data()` -> `DynamicMaterialModelEditorOnlyData` — Get Material Model Editor Only Data
  - `get_material_property()` -> `DMMaterialPropertyType` — Get Material Property
  - `get_output_processor()` -> `MaterialFunctionInterface` — The output process is an optional material function which is applied in between the property and its inputs.
  - `is_enabled()` -> `bool` — Is Enabled
  - `is_material_pin()` -> `bool` — Whether this property represents a material pin. Only materials properties with a pin will be generated by default.
  - `reset_input_connection_map()` -> `None` — Empty the connection map and recalculate the input types.
  - `set_enabled(enabled)` -> `None` — Set Enabled
  - `set_output_processor(function)` -> `None` — The output process is an optional material function which is applied in between the property and its inputs.

**Properties** (6):
  - `components`: `None` [Read-Only] — [Read-Only] Components of this property. Not necessarily owned or controlled by this property. (Map[...
  - `enabled`: `bool` [Read-Only] — [Read-Only] Whether this property is enabled. If it is not enabled, it will generate no expressions....
  - `input_connection_map`: `DMMaterialStageConnection` [Read-Only] — [Read-Only] The map of expressions connected to this propertyâs input node. (DMMaterialStageConnec...
  - `input_connector_type`: `DMValueType` [Read-Only] — [Read-Only] The value type used to connect to this property. Will be either VT_Float1, VT_Float3_RGB...
  - `material_property`: `DMMaterialPropertyType` [Read-Only] — [Read-Only] The property type of this property. (DMMaterialPropertyType)
  - `output_processor`: `MaterialFunctionInterface` [Read-Only] — [Read-Only] An optional material function which is applied in between the property and its inputs. (...

### `unreal.DMMaterialPropertyAmbientOcclusion`
Inherits: `DMMaterialProperty` | Header: `DMMPAmbientOcclusion.h`

DMMaterial Property Ambient Occlusion

### `unreal.DMMaterialPropertyAnisotropy`
Inherits: `DMMaterialProperty` | Header: `DMMPAnisotropy.h`

DMMaterial Property Anisotropy

### `unreal.DMMaterialPropertyBaseColor`
Inherits: `DMMaterialProperty` | Header: `DMMPBaseColor.h`

DMMaterial Property Base Color

### `unreal.DMMaterialPropertyDisplacement`
Inherits: `DMMaterialProperty` | Header: `DMMPDisplacement.h`

DMMaterial Property Displacement

### `unreal.DMMaterialPropertyEmissiveColor`
Inherits: `DMMaterialProperty` | Header: `DMMPEmissiveColor.h`

DMMaterial Property Emissive Color

### `unreal.DMMaterialPropertyMetallic`
Inherits: `DMMaterialProperty` | Header: `DMMPMetallic.h`

DMMaterial Property Metallic

### `unreal.DMMaterialPropertyNormal`
Inherits: `DMMaterialProperty` | Header: `DMMPNormal.h`

DMMaterial Property Normal

### `unreal.DMMaterialPropertyOpacity`
Inherits: `DMMaterialProperty` | Header: `DMMPOpacity.h`

DMMaterial Property Opacity

### `unreal.DMMaterialPropertyOpacityMask`
Inherits: `DMMaterialProperty` | Header: `DMMPOpacityMask.h`

DMMaterial Property Opacity Mask

### `unreal.DMMaterialPropertyPixelDepthOffset`
Inherits: `DMMaterialProperty` | Header: `DMMPPixelDepthOffset.h`

DMMaterial Property Pixel Depth Offset

### `unreal.DMMaterialPropertyRefraction`
Inherits: `DMMaterialProperty` | Header: `DMMPRefraction.h`

DMMaterial Property Refraction

### `unreal.DMMaterialPropertyRoughness`
Inherits: `DMMaterialProperty` | Header: `DMMPRoughness.h`

DMMaterial Property Roughness

### `unreal.DMMaterialPropertySpecular`
Inherits: `DMMaterialProperty` | Header: `DMMPSpecular.h`

DMMaterial Property Specular

### `unreal.DMMaterialPropertySubsurfaceColor`
Inherits: `DMMaterialProperty` | Header: `DMMPSubsurfaceColor.h`

DMMaterial Property Subsurface Color

### `unreal.DMMaterialPropertySurfaceThickness`
Inherits: `DMMaterialProperty` | Header: `DMMPSurfaceThickness.h`

DMMaterial Property Surface Thickness

### `unreal.DMMaterialPropertyTangent`
Inherits: `DMMaterialProperty` | Header: `DMMPTangent.h`

DMMaterial Property Tangent

### `unreal.DMMaterialPropertyWorldPositionOffset`
Inherits: `DMMaterialProperty` | Header: `DMMPWorldPositionOffset.h`

DMMaterial Property World Position Offset

### `unreal.DMMaterialSlot`
Inherits: `DMMaterialComponent` | Header: `DMMaterialSlot.h`

A list of operations/inputs daisy chained together to produce an output.

**Methods** (20):
  - `add_default_layer(material_property)` -> `DMMaterialLayerObject` — Adds the default layer type for this slot based on the given material property.
  - `add_layer(material_property, new_base)` -> `DMMaterialLayerObject` — Adds the default layer (with specified base) based on the given material property.
  - `add_layer_with_mask(material_property, new_base, new_mask)` -> `DMMaterialLayerObject` — Adds a new layer with the specified base and mask layers.
  - `bp_get_layers()` -> `Array [ DMMaterialLayerObject ]` — BP Get Layers
  - `can_remove_layer(layer)` -> `bool` — Canât be removed if it is the last remaining layer.
  - `change_material_property(property_from, property_to)` -> `bool` — Changes the material property of all matching layers to another.
  - `find_layer(base_or_mask)` -> `DMMaterialLayerObject` — Find Layer
  - `get_all_output_connector_types()` -> `Set [ DMValueType ]` — Returns all possible output connector types.
  - `get_description()` -> `Text` — Get Description
  - `get_index()` -> `int32` — Returns the index of this slot in the model.
  - `get_last_layer_for_material_property(material_property)` -> `DMMaterialLayerObject` — Useful for determining output types.
  - `get_layer(layer_index)` -> `DMMaterialLayerObject` — Get Layer
  - `get_material_model_editor_only_data()` -> `DynamicMaterialModelEditorOnlyData` — Get Material Model Editor Only Data
  - `get_output_connector_types_for_material_property(material_property)` -> `Array [ DMValueType ]` — Returns the output types for the last layer with the given material property.
  - `k2_get_slots_referenced_by()` -> `Array [ DMMaterialSlot ]` — Returns an array of the slots referencing this slot.
  - `move_layer(layer, new_index)` -> `bool` — Move Layer
  - `move_layer_after(layer, after_layer = None)` -> `bool` — Move Layer After
  - `move_layer_before(layer, before_layer = None)` -> `bool` — Move Layer Before
  - `remove_layer(layer)` -> `bool` — Removes the layer, if possible.
  - `set_layer_material_property_and_replace_others(layer, property_from, property_to)` -> `bool` — Sets the material property of the given layer and changes all other layers matching that property to a different one.

**Properties** (3):
  - `index`: `int` [Read-Only] — [Read-Only] (int32)
  - `layer_objects`: `None` [Read-Only] — [Read-Only] (Array[DMMaterialLayerObject])
  - `output_connector_types`: `None` [Read-Only] — [Read-Only] (Map[DMMaterialPropertyType,DMMaterialSlotOutputConnectorTypes])

### `unreal.DMMaterialStage`
Inherits: `DMMaterialComponent` | Header: `DMMaterialStage.h`

A component which wraps a source and its inputs.

**Methods** (28):
  - `add_input(new_input)` -> `None` — Add Input
  - `can_change_source()` -> `bool` — Can Change Source
  - `change_input(input_class, input_idx, input_channel, output_idx, output_channel)` -> `DMMaterialStageInput` — Change Input
  - `change_input_previous_stage(input_idx, input_channel, previous_stage_property, output_idx, output_channel)` -> `DMMaterialStageSource` — Changes the input of the given input index to the output of the previous stage with the given material property.
  - `change_source(source_class)` -> `DMMaterialStageSource` — Change Source
  - `create_material_stage(layer = None)` -> `DMMaterialStage` [classmethod] — Create Material Stage
  - `find_index()` -> `int32` — Returns the index of this stage in the layer.
  - `generate_preview_material(preview_material)` -> `None` — Generate Preview Material
  - `get_input_connection_map()` -> `Array [ DMMaterialStageConnection ]` — Determines what connects to what on this stageâs Source.
  - `get_inputs()` -> `Array [ DMMaterialStageInput ]` — Get Inputs
  - `get_layer()` -> `DMMaterialLayerObject` — Get Layer
  - `get_next_stage()` -> `DMMaterialStage` — Get Next Stage
  - `get_previous_stage()` -> `DMMaterialStage` — Get Previous Stage
  - `get_source()` -> `DMMaterialStageSource` — Get Source
  - `get_source_type(channel)` -> `DMValueType` — Get Source Type
  - `is_compatible_with_next_stage(next_stage)` -> `bool` — see: IsCompatibleWithPreviousStage
  - `is_compatible_with_previous_stage(previous_stage)` -> `bool` — Returns true if the output of the previous stage can connect to this stage. It is now up to the user to sort this partic...
  - `is_enabled()` -> `bool` — Is Enabled
  - `is_input_mapped(input_index)` -> `bool` — Returns true if the given sourceâs input is mapped to an input (or the previous stage).
  - `remove_all_inputs()` -> `None` — Remove All Inputs
  - `remove_input(input)` -> `None` — Remove Input
  - `remove_unused_inputs()` -> `None` — Remove Unused Inputs
  - `reset_input_connection_map()` -> `None` — Verifies the entire input connection map.
  - `set_can_change_source(can_change_source)` -> `None` — Set Can Change Source
  - `set_enabled(enabled)` -> `bool` — Set Enabled
  - `set_source(source)` -> `None` — Set Source
  - `verify_all_input_maps()` -> `bool` — Returns true if any changes were made
  - `verify_input_map(input_idx)` -> `bool` — Returns true if any changes were made

**Properties** (4):
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `input_connection_map`: `None` [Read-Only] — [Read-Only] How our inputs connect to the inputs of this stageâs source (Array[DMMaterialStageConn...
  - `inputs`: `None` [Read-Only] — [Read-Only] (Array[DMMaterialStageInput])
  - `source`: `DMMaterialStageSource` [Read-Only] — [Read-Only] (DMMaterialStageSource)

### `unreal.DMMaterialStageBlend`
Inherits: `DMMaterialStageThroughput` | Header: `DMMaterialStageBlend.h`

A node which represents a blend operation.

**Methods** (3):
  - `get_base_channel_override()` -> `AvaColorChannel` — Get Base Channel Override
  - `get_blend_description()` -> `Text` — Get Blend Description
  - `set_base_channel_override(mask_channel)` -> `None` — Set Base Channel Override

**Properties** (2):
  - `base_channel_override`: `AvaColorChannel` [Read-Only] — [Read-Only] Changes the output channel of the base input. (AvaColorChannel)
  - `blend_description`: `Text` [Read-Only] — [Read-Only] (Text)

### `unreal.DMMaterialStageBlendAdd`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBAdd.h`

The same as linear dodge

### `unreal.DMMaterialStageBlendColor`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBColor.h`

DMMaterial Stage Blend Color

### `unreal.DMMaterialStageBlendColorBurn`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBColorBurn.h`

DMMaterial Stage Blend Color Burn

### `unreal.DMMaterialStageBlendColorDodge`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBColorDodge.h`

DMMaterial Stage Blend Color Dodge

### `unreal.DMMaterialStageBlendContrastBase`
Inherits: `DMMaterialStageBlend` | Header: `DMMSBContrastBase.h`

DMMaterial Stage Blend Contrast Base

### `unreal.DMMaterialStageBlendDarken`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBDarken.h`

DMMaterial Stage Blend Darken

### `unreal.DMMaterialStageBlendDarkenColor`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBDarkenColor.h`

DMMaterial Stage Blend Darken Color

### `unreal.DMMaterialStageBlendDifference`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBDifference.h`

DMMaterial Stage Blend Difference

### `unreal.DMMaterialStageBlendDivide`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBDivide.h`

DMMaterial Stage Blend Divide

### `unreal.DMMaterialStageBlendExclusion`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBExclusion.h`

DMMaterial Stage Blend Exclusion

### `unreal.DMMaterialStageBlendFunction`
Inherits: `DMMaterialStageBlend` | Header: `DMMaterialStageBlendFunction.h`

A blending stage based on a material function.

### `unreal.DMMaterialStageBlendHardLight`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBHardLight.h`

DMMaterial Stage Blend Hard Light

### `unreal.DMMaterialStageBlendHardMix`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBHardMix.h`

DMMaterial Stage Blend Hard Mix

### `unreal.DMMaterialStageBlendHue`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBHue.h`

DMMaterial Stage Blend Hue

### `unreal.DMMaterialStageBlendLighten`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBLighten.h`

DMMaterial Stage Blend Lighten

### `unreal.DMMaterialStageBlendLightenColor`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBLightenColor.h`

DMMaterial Stage Blend Lighten Color

### `unreal.DMMaterialStageBlendLinearBurn`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBLinearBurn.h`

DMMaterial Stage Blend Linear Burn

### `unreal.DMMaterialStageBlendLinearDodge`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBLinearDodge.h`

DMMaterial Stage Blend Linear Dodge

### `unreal.DMMaterialStageBlendLinearLight`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBLinearLight.h`

DMMaterial Stage Blend Linear Light

### `unreal.DMMaterialStageBlendLuminosity`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBLuminosity.h`

DMMaterial Stage Blend Luminosity

### `unreal.DMMaterialStageBlendMultiply`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBMultiply.h`

DMMaterial Stage Blend Multiply

### `unreal.DMMaterialStageBlendNormal`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBNormal.h`

DMMaterial Stage Blend Normal

### `unreal.DMMaterialStageBlendOverlay`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBOverlay.h`

DMMaterial Stage Blend Overlay

### `unreal.DMMaterialStageBlendPinLight`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBPinLight.h`

DMMaterial Stage Blend Pin Light

### `unreal.DMMaterialStageBlendSaturation`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBSaturation.h`

DMMaterial Stage Blend Saturation

### `unreal.DMMaterialStageBlendScreen`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBScreen.h`

DMMaterial Stage Blend Screen

### `unreal.DMMaterialStageBlendSoftLight`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBSoftLight.h`

DMMaterial Stage Blend Soft Light

### `unreal.DMMaterialStageBlendSubtract`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBSubtract.h`

DMMaterial Stage Blend Subtract

### `unreal.DMMaterialStageBlendVividLight`
Inherits: `DMMaterialStageBlendFunction` | Header: `DMMSBVividLight.h`

DMMaterial Stage Blend Vivid Light

### `unreal.DMMaterialStageExpression`
Inherits: `DMMaterialStageThroughput` | Header: `DMMaterialStageExpression.h`

A node which directly represents a material expression (or function).

**Methods** (3):
  - `change_stage_source_expression(stage, expression_class)` -> `DMMaterialStageExpression` [classmethod] — Change Stage Source Expression
  - `get_material_expression_class()` — Get Material Expression Class
  - `get_menus()` -> `Array [ DMExpressionMenu ]` — Get Menus

**Properties** (2):
  - `material_expression_class`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `menus`: `None` [Read-Only] — [Read-Only] (Array[DMExpressionMenu])

### `unreal.DMMaterialStageExpressionAbs`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEAbs.h`

DMMaterial Stage Expression Abs

### `unreal.DMMaterialStageExpressionActorPositionWS`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEActorPositionWS.h`

DMMaterial Stage Expression Actor Position WS

### `unreal.DMMaterialStageExpressionAdd`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEAdd.h`

DMMaterial Stage Expression Add

### `unreal.DMMaterialStageExpressionArccosine`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEArcCosine.h`

DMMaterial Stage Expression Arccosine

### `unreal.DMMaterialStageExpressionArccosineFast`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEArcCosineFast.h`

DMMaterial Stage Expression Arccosine Fast

### `unreal.DMMaterialStageExpressionArcsine`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEArcSine.h`

DMMaterial Stage Expression Arcsine

### `unreal.DMMaterialStageExpressionArcsineFast`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEArcSineFast.h`

DMMaterial Stage Expression Arcsine Fast

### `unreal.DMMaterialStageExpressionArctangent`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEArctangent.h`

DMMaterial Stage Expression Arctangent

### `unreal.DMMaterialStageExpressionArctangent2`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEArctangent2.h`

DMMaterial Stage Expression Arctangent 2

### `unreal.DMMaterialStageExpressionArctangent2Fast`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEArctangent2Fast.h`

DMMaterial Stage Expression Arctangent 2Fast

### `unreal.DMMaterialStageExpressionArctangentFast`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEArctangentFast.h`

DMMaterial Stage Expression Arctangent Fast

### `unreal.DMMaterialStageExpressionCameraPositionWS`
Inherits: `DMMaterialStageExpression` | Header: `DMMSECameraPositionWS.h`

DMMaterial Stage Expression Camera Position WS

### `unreal.DMMaterialStageExpressionCameraVectorWS`
Inherits: `DMMaterialStageExpression` | Header: `DMMSECameraVectorWS.h`

DMMaterial Stage Expression Camera Vector WS

### `unreal.DMMaterialStageExpressionCeil`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSECeil.h`

DMMaterial Stage Expression Ceil

### `unreal.DMMaterialStageExpressionClamp`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEClamp.h`

DMMaterial Stage Expression Clamp

### `unreal.DMMaterialStageExpressionCosine`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSECosine.h`

DMMaterial Stage Expression Cosine

### `unreal.DMMaterialStageExpressionCrossProduct`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSECrossProduct.h`

DMMaterial Stage Expression Cross Product

### `unreal.DMMaterialStageExpressionDeltaTime`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEDeltaTime.h`

DMMaterial Stage Expression Delta Time

### `unreal.DMMaterialStageExpressionDivide`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEDivide.h`

DMMaterial Stage Expression Divide

### `unreal.DMMaterialStageExpressionDotProduct`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEDotProduct.h`

DMMaterial Stage Expression Dot Product

### `unreal.DMMaterialStageExpressionFloatModulo`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEFloatModulo.h`

DMMaterial Stage Expression Float Modulo

### `unreal.DMMaterialStageExpressionFloor`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEFloor.h`

DMMaterial Stage Expression Floor

### `unreal.DMMaterialStageExpressionInverseLinearInterpolate`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEInverseLinearInterpolate.h`

DMMaterial Stage Expression Inverse Linear Interpolate

### `unreal.DMMaterialStageExpressionLightmapUVs`
Inherits: `DMMaterialStageExpression` | Header: `DMMSELightmapUVs.h`

DMMaterial Stage Expression Lightmap UVs

### `unreal.DMMaterialStageExpressionLightVector`
Inherits: `DMMaterialStageExpression` | Header: `DMMSELightVector.h`

DMMaterial Stage Expression Light Vector

### `unreal.DMMaterialStageExpressionLinearInterpolate`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSELinearInterpolate.h`

DMMaterial Stage Expression Linear Interpolate

### `unreal.DMMaterialStageExpressionLogarithm10`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSELogarithm10.h`

DMMaterial Stage Expression Logarithm 10

### `unreal.DMMaterialStageExpressionLogarithm2`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSELogarithm2.h`

DMMaterial Stage Expression Logarithm 2

### `unreal.DMMaterialStageExpressionMathBase`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEMathBase.h`

DMMaterial Stage Expression Math Base

**Properties** (3):
  - `allow_single_float_match`: `bool` [Read-Only] — [Read-Only] Allow matching of single floats to match other types of floats. (bool)
  - `single_channel_only`: `bool` [Read-Only] — [Read-Only] Whether this just works with Scalars. (bool)
  - `variadic_input_count`: `int` [Read-Only] — [Read-Only] How many inputs this should automatically create. (int32)

### `unreal.DMMaterialStageExpressionMax`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEMax.h`

DMMaterial Stage Expression Max

### `unreal.DMMaterialStageExpressionMin`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEMin.h`

DMMaterial Stage Expression Min

### `unreal.DMMaterialStageExpressionMultiply`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEMultiply.h`

DMMaterial Stage Expression Multiply

### `unreal.DMMaterialStageExpressionObjectBounds`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEObjectBounds.h`

DMMaterial Stage Expression Object Bounds

### `unreal.DMMaterialStageExpressionObjectOrientation`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEObjectOrientation.h`

DMMaterial Stage Expression Object Orientation

### `unreal.DMMaterialStageExpressionObjectPositionWS`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEObjectPositionWS.h`

DMMaterial Stage Expression Object Position WS

### `unreal.DMMaterialStageExpressionObjectRadius`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEObjectRadius.h`

DMMaterial Stage Expression Object Radius

### `unreal.DMMaterialStageExpressionOneMinus`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEOneMinus.h`

DMMaterial Stage Expression One Minus

### `unreal.DMMaterialStageExpressionPanner`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEPanner.h`

DMMaterial Stage Expression Panner

### `unreal.DMMaterialStageExpressionParticleColor`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEParticleColor.h`

DMMaterial Stage Expression Particle Color

### `unreal.DMMaterialStageExpressionParticleDirection`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEParticleDirection.h`

DMMaterial Stage Expression Particle Direction

### `unreal.DMMaterialStageExpressionParticleMacroUV`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEParticleMacroUV.h`

DMMaterial Stage Expression Particle Macro UV

### `unreal.DMMaterialStageExpressionParticleMotionBlurFade`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEParticleMotionBlurFade.h`

DMMaterial Stage Expression Particle Motion Blur Fade

### `unreal.DMMaterialStageExpressionParticlePositionWS`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEParticlePositionWS.h`

DMMaterial Stage Expression Particle Position WS

### `unreal.DMMaterialStageExpressionParticleRadius`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEParticleRadius.h`

DMMaterial Stage Expression Particle Radius

### `unreal.DMMaterialStageExpressionParticleRandom`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEParticleRandom.h`

DMMaterial Stage Expression Particle Random

### `unreal.DMMaterialStageExpressionParticleRelativeTime`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEParticleRelativeTime.h`

DMMaterial Stage Expression Particle Relative Time

### `unreal.DMMaterialStageExpressionParticleSize`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEParticleSize.h`

DMMaterial Stage Expression Particle Size

### `unreal.DMMaterialStageExpressionParticleSpeed`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEParticleSpeed.h`

DMMaterial Stage Expression Particle Speed

### `unreal.DMMaterialStageExpressionParticleSubUV`
Inherits: `DMMaterialStageExpressionTextureSampleBase` | Header: `DMMSEParticleSubUV.h`

DMMaterial Stage Expression Particle Sub UV

### `unreal.DMMaterialStageExpressionParticleSubUVProperties`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEParticleSubUVProperties.h`

DMMaterial Stage Expression Particle Sub UVProperties

### `unreal.DMMaterialStageExpressionPixelDepth`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEPixelDepth.h`

DMMaterial Stage Expression Pixel Depth

### `unreal.DMMaterialStageExpressionPixelNormalWS`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEPixelNormalWS.h`

DMMaterial Stage Expression Pixel Normal WS

### `unreal.DMMaterialStageExpressionPower`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEPower.h`

DMMaterial Stage Expression Power

### `unreal.DMMaterialStageExpressionReflectionVectorWS`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEReflectionVectorWS.h`

DMMaterial Stage Expression Reflection Vector WS

### `unreal.DMMaterialStageExpressionRotateAboutAxis`
Inherits: `DMMaterialStageExpression` | Header: `DMMSERotateAboutAxis.h`

DMMaterial Stage Expression Rotate About Axis

**Properties** (1):
  - `period`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.DMMaterialStageExpressionRound`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSERound.h`

DMMaterial Stage Expression Round

### `unreal.DMMaterialStageExpressionSceneColor`
Inherits: `DMMaterialStageExpression` | Header: `DMMSESceneColor.h`

DMMaterial Stage Expression Scene Color

**Properties** (1):
  - `input_mode`: `MaterialSceneAttributeInputMode` [Read-Only] — [Read-Only] (MaterialSceneAttributeInputMode)

### `unreal.DMMaterialStageExpressionSceneDepth`
Inherits: `DMMaterialStageExpression` | Header: `DMMSESceneDepth.h`

DMMaterial Stage Expression Scene Depth

### `unreal.DMMaterialStageExpressionSceneTexture`
Inherits: `DMMaterialStageExpression` | Header: `DMMSESceneTexture.h`

DMMaterial Stage Expression Scene Texture

**Properties** (1):
  - `scene_texture_id`: `SceneTextureId` [Read-Only] — [Read-Only] (SceneTextureId)

### `unreal.DMMaterialStageExpressionScreenPosition`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEScreenPosition.h`

DMMaterial Stage Expression Screen Position

### `unreal.DMMaterialStageExpressionSign`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSESign.h`

DMMaterial Stage Expression Sign

### `unreal.DMMaterialStageExpressionSine`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSESine.h`

DMMaterial Stage Expression Sine

### `unreal.DMMaterialStageExpressionSmoothStep`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSESmoothStep.h`

DMMaterial Stage Expression Smooth Step

### `unreal.DMMaterialStageExpressionSquareRoot`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSESquareRoot.h`

DMMaterial Stage Expression Square Root

### `unreal.DMMaterialStageExpressionStep`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSEStep.h`

DMMaterial Stage Expression Step

### `unreal.DMMaterialStageExpressionSubtract`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSESubtract.h`

DMMaterial Stage Expression Subtract

### `unreal.DMMaterialStageExpressionTangent`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSETangent.h`

DMMaterial Stage Expression Tangent

### `unreal.DMMaterialStageExpressionTextureCoordinate`
Inherits: `DMMaterialStageExpression` | Header: `DMMSETextureCoordinate.h`

DMMaterial Stage Expression Texture Coordinate

**Properties** (3):
  - `coordinate_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `u_tiling`: `float` [Read-Only] — [Read-Only] (float)
  - `v_tiling`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.DMMaterialStageExpressionTextureSample`
Inherits: `DMMaterialStageExpressionTextureSampleBase` | Header: `DMMSETextureSample.h`

DMMaterial Stage Expression Texture Sample

**Methods** (3):
  - `can_use_base_texture()` -> `bool` — Can Use Base Texture
  - `get_use_base_texture()` -> `bool` — Get Use Base Texture
  - `set_use_base_texture(use_base_texture)` -> `None` — Set Use Base Texture

**Properties** (1):
  - `use_base_texture`: `bool` [Read-Only] — [Read-Only] * When both the base and mask stages are set to a texture and toggle layer UV link is on...

### `unreal.DMMaterialStageExpressionTextureSampleBase`
Inherits: `DMMaterialStageExpression` | Header: `DMMSETextureSampleBase.h`

DMMaterial Stage Expression Texture Sample Base

**Methods** (2):
  - `is_clamp_texture_enabled()` -> `bool` — Is Clamp Texture Enabled
  - `set_clamp_texture_enabled(value)` -> `None` — Set Clamp Texture Enabled

**Properties** (1):
  - `clamp_texture`: `bool` — [Read-Write] Forces a material rebuild. (bool)

### `unreal.DMMaterialStageExpressionTextureSampleEdgeColor`
Inherits: `DMMaterialStageExpression` | Header: `DMMSETextureSampleEdgeColor.h`

DMMaterial Stage Expression Texture Sample Edge Color

**Properties** (1):
  - `edge_location`: `DMEdgeLocation` [Read-Only] — [Read-Only] (DMEdgeLocation)

### `unreal.DMMaterialStageExpressionTime`
Inherits: `DMMaterialStageExpression` | Header: `DMMSETime.h`

DMMaterial Stage Expression Time

### `unreal.DMMaterialStageExpressionTransform`
Inherits: `DMMaterialStageExpression` | Header: `DMMSETransform.h`

DMMaterial Stage Expression Transform

**Properties** (2):
  - `transform_source_type`: `MaterialVectorCoordTransformSource` [Read-Only] — [Read-Only] (MaterialVectorCoordTransformSource)
  - `transform_type`: `MaterialVectorCoordTransform` [Read-Only] — [Read-Only] (MaterialVectorCoordTransform)

### `unreal.DMMaterialStageExpressionTruncate`
Inherits: `DMMaterialStageExpressionMathBase` | Header: `DMMSETruncate.h`

DMMaterial Stage Expression Truncate

### `unreal.DMMaterialStageExpressionUVRotator`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEUVRotator.h`

DMMaterial Stage Expression UVRotator

**Properties** (3):
  - `center_x`: `float` [Read-Only] — [Read-Only] (float)
  - `center_y`: `float` [Read-Only] — [Read-Only] (float)
  - `speed`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.DMMaterialStageExpressionVertexColor`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEVertexColor.h`

DMMaterial Stage Expression Vertex Color

### `unreal.DMMaterialStageExpressionVertexNormalWS`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEVertexNormalWS.h`

DMMaterial Stage Expression Vertex Normal WS

### `unreal.DMMaterialStageExpressionVertexTangentWS`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEVertexTangentWS.h`

DMMaterial Stage Expression Vertex Tangent WS

### `unreal.DMMaterialStageExpressionViewSize`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEViewSize.h`

DMMaterial Stage Expression View Size

### `unreal.DMMaterialStageExpressionWorldPosition`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEWorldPosition.h`

DMMaterial Stage Expression World Position

**Properties** (1):
  - `world_position_shader_offset`: `WorldPositionIncludedOffsets` [Read-Only] — [Read-Only] (WorldPositionIncludedOffsets)

### `unreal.DMMaterialStageExpressionWorldPositionNoise`
Inherits: `DMMaterialStageExpression` | Header: `DMMSEWorldPositionNoise.h`

DMMaterial Stage Expression World Position Noise

**Methods** (12):
  - `get_location_type()` -> `DMLocationType` — Get Location Type
  - `get_noise_function()` -> `VectorNoiseFunction` — Get Noise Function
  - `get_quality()` -> `int32` — Get Quality
  - `get_shader_offset()` -> `WorldPositionIncludedOffsets` — Get Shader Offset
  - `get_tile_size()` -> `int32` — Get Tile Size
  - `get_tiling()` -> `bool` — Get Tiling
  - `set_location_type(location_type)` -> `None` — Set Location Type
  - `set_noise_function(noise_function)` -> `None` — Set Noise Function
  - `set_quality(quality)` -> `None` — Set Quality
  - `set_shader_offset(shader_offset)` -> `None` — Set Shader Offset
  - `set_tile_size(tile_size)` -> `None` — Set Tile Size
  - `set_tiling(tiling)` -> `None` — Set Tiling

**Properties** (6):
  - `location_type`: `DMLocationType` — [Read-Write] (DMLocationType)
  - `noise_function`: `VectorNoiseFunction` — [Read-Write] (VectorNoiseFunction)
  - `quality`: `int` — [Read-Write] (int32)
  - `shader_offset`: `WorldPositionIncludedOffsets` — [Read-Write] (WorldPositionIncludedOffsets)
  - `tile_size`: `int` — [Read-Write] (int32)
  - `tiling`: `bool` — [Read-Write] (bool)

### `unreal.DMMaterialStageFunction`
Inherits: `DMMaterialStageThroughput` | Header: `DMMaterialStageFunction.h`

Represents a material function which can be added directly to a stage.

**Methods** (5):
  - `change_stage_source_function(stage, material_function)` -> `DMMaterialStageFunction` [classmethod] — Change Stage Source Function
  - `get_input_value(index)` -> `DMMaterialValue` — Get Input Value
  - `get_input_values()` -> `Array [ DMMaterialValue ]` — Get Input Values
  - `get_material_function()` -> `MaterialFunctionInterface` — Get Material Function
  - `set_material_function(material_function)` -> `None` — Set Material Function

**Properties** (1):
  - `material_function`: `MaterialFunctionInterface` — [Read-Write] (MaterialFunctionInterface)

### `unreal.DMMaterialStageGradient`
Inherits: `DMMaterialStageThroughput` | Header: `DMMaterialStageGradient.h`

A node which represents UV-based gradient.

**Methods** (2):
  - `change_stage_source_gradient(stage, gradient_class)` -> `DMMaterialStageGradient` [classmethod] — Change Stage Source Gradient
  - `create_stage(material_stage_gradient_class, layer = None)` -> `DMMaterialStage` [classmethod] — Create Stage

**Properties** (1):
  - `material_function`: `MaterialFunctionInterface` [Read-Only] — [Read-Only] (MaterialFunctionInterface)

### `unreal.DMMaterialStageGradientLinear`
Inherits: `DMMaterialStageGradient` | Header: `DMMSGLinear.h`

DMMaterial Stage Gradient Linear

**Methods** (2):
  - `get_tiling_type()` -> `LinearGradientTileType` — Get Tiling Type
  - `set_tiling_type(type)` -> `None` — Set Tiling Type

**Properties** (1):
  - `tiling`: `LinearGradientTileType` — [Read-Write] (LinearGradientTileType)

### `unreal.DMMaterialStageGradientRadial`
Inherits: `DMMaterialStageGradient` | Header: `DMMSGRadial.h`

DMMaterial Stage Gradient Radial

### `unreal.DMMaterialStageInput`
Inherits: `DMMaterialStageSource` | Header: `DMMaterialStageInput.h`

A node which produces an output (e.g. Texture coordinate.)

### `unreal.DMMaterialStageInputExpression`
Inherits: `DMMaterialStageInputThroughput` | Header: `DMMSIExpression.h`

DMMaterial Stage Input Expression

**Methods** (6):
  - `change_stage_input_expression(stage, expression_class, input_idx, input_channel, output_idx, output_channel)` -> `DMMaterialStageInputExpression` [classmethod] — Change the input type of an input on a stage to an expression.
  - `change_stage_source_expression(stage, expression_class)` -> `DMMaterialStageInputExpression` [classmethod] — Change Stage Source Expression
  - `create_stage(material_stage_expression_class, layer = None)` -> `DMMaterialStage` [classmethod] — Create Stage
  - `get_material_stage_expression()` -> `DMMaterialStageExpression` — Get Material Stage Expression
  - `get_material_stage_expression_class()` — Get Material Stage Expression Class
  - `set_material_stage_expression_class(material_stage_expression_class)` -> `None` — Set Material Stage Expression Class

### `unreal.DMMaterialStageInputFunction`
Inherits: `DMMaterialStageInputThroughput` | Header: `DMMSIFunction.h`

DMMaterial Stage Input Function

**Methods** (6):
  - `change_stage_input_function(stage, material_function, input_idx, input_channel, output_idx, output_channel)` -> `DMMaterialStageInputFunction` [classmethod] — Change the input type of an input on a stage to a function.
  - `change_stage_source_function(stage, material_function)` -> `DMMaterialStageInputFunction` [classmethod] — Change Stage Source Function
  - `create_stage(layer = None)` -> `DMMaterialStage` [classmethod] — Create Stage
  - `get_material_function()` -> `MaterialFunctionInterface` — Get Material Function
  - `get_material_stage_function()` -> `DMMaterialStageFunction` — Get Material Stage Function
  - `set_material_function(material_function)` -> `None` — Set Material Function

### `unreal.DMMaterialStageInputGradient`
Inherits: `DMMaterialStageInputThroughput` | Header: `DMMSIGradient.h`

DMMaterial Stage Input Gradient

**Methods** (6):
  - `change_stage_input_gradient(stage, gradient_class, input_idx, input_channel, output_channel)` -> `DMMaterialStageInputGradient` [classmethod] — Change the input type of an input on a stage to a gradient.
  - `change_stage_source_gradient(stage, gradient_class)` -> `DMMaterialStageInputGradient` [classmethod] — Change Stage Source Gradient
  - `create_stage(material_stage_gradient_class, layer = None)` -> `DMMaterialStage` [classmethod] — Create Stage
  - `get_material_stage_gradient()` -> `DMMaterialStageGradient` — Get Material Stage Gradient
  - `get_material_stage_gradient_class()` — Get Material Stage Gradient Class
  - `set_material_stage_gradient_class(material_stage_gradient_class)` -> `None` — Set Material Stage Gradient Class

### `unreal.DMMaterialStageInputSlot`
Inherits: `DMMaterialStageInput` | Header: `DMMSISlot.h`

DMMaterial Stage Input Slot

**Methods** (7):
  - `change_stage_input_slot(stage, input_idx, input_channel, slot, property_, output_idx, output_channel)` -> `DMMaterialStageInputSlot` [classmethod] — Change the input type of an input on a stage to the output of another slot.
  - `change_stage_source_slot(stage, slot, property_)` -> `DMMaterialStageInputSlot` [classmethod] — Change Stage Source Slot
  - `create_stage(source_slot, material_property, layer = None)` -> `DMMaterialStage` [classmethod] — Create Stage
  - `get_material_property()` -> `DMMaterialPropertyType` — Get Material Property
  - `get_slot()` -> `DMMaterialSlot` — Get Slot
  - `set_material_property(material_property)` -> `None` — Set Material Property
  - `set_slot(slot)` -> `None` — Set Slot

**Properties** (2):
  - `material_property`: `DMMaterialPropertyType` [Read-Only] — [Read-Only] (DMMaterialPropertyType)
  - `slot`: `DMMaterialSlot` [Read-Only] — [Read-Only] (DMMaterialSlot)

### `unreal.DMMaterialStageInputTextureUV`
Inherits: `DMMaterialStageInput` | Header: `DMMSITextureUV.h`

DMMaterial Stage Input Texture UV

**Methods** (4):
  - `change_stage_input_uv(stage, input_idx, input_channel, output_channel)` -> `DMMaterialStageInputTextureUV` [classmethod] — Change Stage Input UV
  - `change_stage_source_uv(stage, do_update)` -> `DMMaterialStageInputTextureUV` [classmethod] — Change Stage Source UV
  - `create_stage(material_model, layer = None)` -> `DMMaterialStage` [classmethod] — Create Stage
  - `get_texture_uv()` -> `DMTextureUV` — Get Texture UV

**Properties** (1):
  - `texture_uv`: `DMTextureUV` [Read-Only] — [Read-Only] (DMTextureUV)

### `unreal.DMMaterialStageInputThroughput`
Inherits: `DMMaterialStageInput` | Header: `DMMSIThroughput.h`

DMMaterial Stage Input Throughput

**Methods** (3):
  - `get_material_stage_throughput()` -> `DMMaterialStageThroughput` — Get Material Stage Throughput
  - `get_material_stage_throughput_class()` — Get Material Stage Throughput Class
  - `get_sub_stage()` -> `DMMaterialSubStage` — Get Sub Stage

**Properties** (1):
  - `sub_stage`: `DMMaterialSubStage` [Read-Only] — [Read-Only] (DMMaterialSubStage)

### `unreal.DMMaterialStageInputValue`
Inherits: `DMMaterialStageInput` | Header: `DMMSIValue.h`

DMMaterial Stage Input Value

**Methods** (9):
  - `change_stage_input_new_local_value(stage, input_idx, input_channel, value_class, output_channel)` -> `DMMaterialStageInputValue` [classmethod] — Change Stage Input New Local Value
  - `change_stage_input_new_value(stage, input_idx, input_channel, value_class, output_channel)` -> `DMMaterialStageInputValue` [classmethod] — Change Stage Input New Value
  - `change_stage_input_value(stage, input_idx, input_channel, value, output_channel)` -> `DMMaterialStageInputValue` [classmethod] — Change Stage Input Value
  - `change_stage_source_new_local_value(stage, value_class)` -> `DMMaterialStageInputValue` [classmethod] — Change Stage Source New Local Value
  - `change_stage_source_new_value(stage, value_class)` -> `DMMaterialStageInputValue` [classmethod] — Change Stage Source New Value
  - `change_stage_source_value(stage, value)` -> `DMMaterialStageInputValue` [classmethod] — Change Stage Source Value
  - `create_stage(value, layer = None)` -> `DMMaterialStage` [classmethod] — Create Stage
  - `get_value()` -> `DMMaterialValue` — Get Value
  - `set_value(value)` -> `None` — Set Value

**Properties** (1):
  - `value`: `DMMaterialValue` [Read-Only] — [Read-Only] (DMMaterialValue)

### `unreal.DMMaterialStageSource`
Inherits: `DMMaterialComponent` | Header: `DMMaterialStageSource.h`

A node which produces an output.

**Methods** (4):
  - `generate_preview_material(preview_material)` -> `None` — Generates a material representing just this node.
  - `get_output_connectors()` -> `Array [ DMMaterialStageConnector ]` — Get Output Connectors
  - `get_stage()` -> `DMMaterialStage` — Get Stage
  - `get_stage_description()` -> `Text` — Returns a description of the stage for which this is the source.

**Properties** (1):
  - `output_connectors`: `None` [Read-Only] — [Read-Only] (Array[DMMaterialStageConnector])

### `unreal.DMMaterialStageThroughput`
Inherits: `DMMaterialStageSource` | Header: `DMMaterialStageThroughput.h`

A node which take one or more inputs and produces an output (e.g. Multiply)

**Methods** (6):
  - `allows_nested_inputs()` -> `bool` — Returns true if this nodeâs inputs can have their own inputs.
  - `can_input_accept_type(throughput_input_index, value_type)` -> `bool` — Can Input Accept Type
  - `can_input_connect_to(throughput_input_index, output_connector, output_channel, check_single_float = False)` -> `bool` — Whether the given output connector can connect to this node.
  - `get_description()` -> `Text` — Get Description
  - `get_input_connectors()` -> `Array [ DMMaterialStageConnector ]` — Get Input Connectors
  - `is_input_required()` -> `bool` — Returns true if input is required to successfully compile this node.

**Properties** (4):
  - `allow_nested_inputs`: `bool` [Read-Only] — [Read-Only] (bool)
  - `input_connectors`: `None` [Read-Only] — [Read-Only] (Array[DMMaterialStageConnector])
  - `input_required`: `bool` [Read-Only] — [Read-Only] (bool)
  - `name`: `Text` [Read-Only] — [Read-Only] (Text)

### `unreal.DMMaterialStageThroughputLayerBlend`
Inherits: `DMMaterialStageThroughput` | Header: `DMMaterialStageThroughputLayerBlend.h`

Used as the source for mask stages.

**Methods** (6):
  - `create_stage(layer = None)` -> `DMMaterialStage` [classmethod] — Create Stage
  - `get_input_mask()` -> `DMMaterialStageInput` — Returns the input connected to the Mask input.
  - `get_mask_channel_override()` -> `AvaColorChannel` — Filters the output of the mask input node with the given channel.
  - `set_mask_channel_override(mask_channel)` -> `None` — Filters the output of the mask input node with the given channel.
  - `set_premultiply_alpha(value)` -> `None` — When true, the base stageâs output will be multiplied by this stage (darkening it where it is translucent).
  - `use_premultiply_alpha()` -> `bool` — When true, the base stageâs output will be multiplied by this stage (darkening it where it is translucent).

**Properties** (3):
  - `is_alpha_only_blend`: `bool` [Read-Only] — [Read-Only] (bool)
  - `mask_channel_override`: `AvaColorChannel` [Read-Only] — [Read-Only] Changes the output channel of the mask input. (AvaColorChannel)
  - `premultiply_alpha`: `bool` [Read-Only] — [Read-Only] Additionally multiplies the output of the RGB Stage by the output from this Stage. (bool...

### `unreal.DMMaterialSubStage`
Inherits: `DMMaterialStage` | Header: `DMMaterialSubStage.h`

A stage that is a subobject of another stage, such as when an input throughput has its own inputs.

**Methods** (4):
  - `create_material_sub_stage(parent_stage)` -> `DMMaterialSubStage` [classmethod] — Create Material Sub Stage
  - `get_parent_most_stage()` -> `DMMaterialStage` — Recursively calls GetParentStage() to find the outer stage.
  - `get_parent_stage()` -> `DMMaterialStage` — Returns the parent stage of this stage, which is probably not its direct parent.
  - `set_parent_component(parent_component)` -> `None` — Sets which object directly owns this component in the hierarchy.

**Properties** (1):
  - `parent_stage`: `DMMaterialStage` [Read-Only] — [Read-Only] (DMMaterialStage)

### `unreal.DMTextureSetFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DMTextureSetFunctionLibrary.h`

Material Stage Function Library

**Methods** (1):
  - `add_texture_set_to_model(editor_only_data, texture_set, replace_slots)` -> `bool` [classmethod] — Integrates a Texture Set with the given modelâs editor only data.

### `unreal.DynamicMaterialEditorSettings`
Inherits: `DeveloperSettings` | Header: `DynamicMaterialEditorSettings.h`

Material Designer Settings

**Methods** (3):
  - `should_automatically_apply_to_source_on_preview_compile()` -> `bool` — Should Automatically Apply to Source on Preview Compile
  - `should_automatically_compile_preview_material()` -> `bool` — Should Automatically Compile Preview Material
  - `should_automatically_copy_parameters_to_source_material()` -> `bool` — Should Automatically Copy Parameters to Source Material

**Properties** (21):
  - `add_details_panel_button`: `bool` [Read-Only] — [Read-Only] If true, a âCreate with Material Designerâ button will show on properties and materi...
  - `automatically_copy_parameters_to_source_material`: `bool` [Read-Only] — [Read-Only] When properties on the preview material are changed, if they are parameter-based then au...
  - `custom_effects_folders`: `None` [Read-Only] — [Read-Only] * Add paths to search for custom effects.
*
* Format examples:
* - /Game/Some/Path
* - /...
  - `custom_preview_mesh`: `StaticMesh` [Read-Only] — [Read-Only] (StaticMesh)
  - `default_mask`: `Texture` [Read-Only] — [Read-Only] (Texture)
  - `default_slot_value_overrides`: `None` [Read-Only] — [Read-Only] Overrides the default values given to slots created in the given material property. (Map...
  - `follow_selection`: `bool` [Read-Only] — [Read-Only] Changes the currently active material in the designer following actor/object selection. ...
  - `layout`: `DMMaterialEditorLayout` [Read-Only] — [Read-Only] (DMMaterialEditorLayout)
  - `live_edit_mode`: `DMLiveEditMode` [Read-Only] — [Read-Only] When enabled, reduces compile options to a single mode called Live Edit. (DMLiveEditMode...
  - `material_channel_presets`: `None` [Read-Only] — [Read-Only] (Array[DMMaterialChannelListPreset])
  - `preview_images_use_texture_u_vs`: `bool` [Read-Only] — [Read-Only] (bool)
  - `preview_mesh`: `DMMaterialPreviewMesh` [Read-Only] — [Read-Only] (DMMaterialPreviewMesh)
  - `preview_splitter_location`: `float` [Read-Only] — [Read-Only] Adjusts the vertical size of the material layer view. (float)
  - `property_preview_size`: `float` [Read-Only] — [Read-Only] (float)
  - `show_preview_background`: `bool` [Read-Only] — [Read-Only] (bool)
  - `splitter_location`: `float` [Read-Only] — [Read-Only] Adjusts the vertical size of the material layer view. (float)
  - `stage_preview_size`: `float` [Read-Only] — [Read-Only] (float)
  - `thumbnail_size`: `float` [Read-Only] — [Read-Only] (double)
  - `use_full_channel_names_in_top_slim_layout`: `bool` [Read-Only] — [Read-Only] (bool)
  - `use_linear_color_for_vectors`: `bool` [Read-Only] — [Read-Only] (bool)
  - `uv_visualizer_visible`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.DynamicMaterialInstanceFactory`
Inherits: `Factory` | Header: `DynamicMaterialInstanceFactory.h`

Dynamic Material Instance Factory

### `unreal.DynamicMaterialModelEditorOnlyData`
Inherits: `Object` | Header: `DynamicMaterialModelEditorOnlyData.h`

Dynamic Material Model Editor Only Data

**Methods** (47):
  - `add_slot()` -> `DMMaterialSlot` — Adds the next available slot. Highly recommended to use AddSlotForMaterialProperty(PropertyType).
  - `add_slot_for_material_property(type)` -> `DMMaterialSlot` — Add Slot for Material Property
  - `assign_material_property_to_slot(property_, slot)` -> `None` — Assign Material Property to Slot
  - `build_material(dirty_assets)` -> `None` — Build Material
  - `do_build(dirty_assets)` -> `None` — Do Build
  - `get_blend_mode()` -> `BlendMode` — Get Blend Mode
  - `get_displacement_center()` -> `float` — Get Displacement Center
  - `get_displacement_magnitude()` -> `float` — Get Displacement Magnitude
  - `get_domain()` -> `MaterialDomain` — Get Domain
  - `get_generated_material()` -> `Material` — Get Generated Material
  - `get_has_pixel_animation()` -> `bool` — Get Has Pixel Animation
  - `get_is_two_sided()` -> `bool` — Get Is Two Sided
  - `get_material_model()` -> `DynamicMaterialModel` — Get Material Model
  - `get_material_properties()` -> `Map [ DMMaterialPropertyType , DMMaterialProperty ]` — Get Material Properties
  - `get_material_properties_for_slot(slot)` -> `Array [ DMMaterialPropertyType ]` — Get Material Properties for Slot
  - `get_material_property(material_property)` -> `DMMaterialProperty` — Get Material Property
  - `get_material_stats()` -> `MaterialStatistics` — Get Material Stats
  - `get_shading_model()` -> `DMMaterialShadingModel` — Get Shading Model
  - `get_slot(index)` -> `DMMaterialSlot` — Gets slot by index. Highly recommended to use GetSlotForMaterialProperty(PropertyType).
  - `get_slot_for_enabled_material_property(type)` -> `DMMaterialSlot` — Same as the above method, but will only return the slot if the material property is enabled.
  - `get_slot_for_material_property(type)` -> `DMMaterialSlot` — Get Slot for Material Property
  - `get_slots()` -> `Array [ DMMaterialSlot ]` — Get Slots
  - `get_state()` -> `DMState` — Get State
  - `has_build_been_requested()` -> `bool` — Has Build Been Requested
  - `is_nanite_tessellation_enabled()` -> `bool` — Is Nanite Tessellation Enabled
  - `is_output_translucent_velocity_enabled()` -> `bool` — Is Output Translucent Velocity Enabled
  - `is_pixel_animation_flag_set()` -> `bool` — deprecated: âis_pixel_animation_flag_setâ was renamed to âget_has_pixel_animationâ.
  - `is_responsive_aa_enabled()` -> `bool` — Is Responsive AAEnabled
  - `is_two_sided_flag_set()` -> `bool` — deprecated: âis_two_sided_flag_setâ was renamed to âget_is_two_sidedâ.
  - `open_material_editor()` -> `None` — Open Material Editor
  - `remove_slot(index)` -> `DMMaterialSlot` — Removes the next slot by index. Highly recommended to use RemoveSlotForMaterialProperty(PropertyType).
  - `remove_slot_for_material_property(type)` -> `DMMaterialSlot` — Remove Slot for Material Property
  - `request_material_build(request_type = DMBuildRequestType.PREVIEW)` -> `None` — Called when the model needs to have the material rebuild.
  - `set_blend_mode(blend_mode)` -> `None` — Set Blend Mode
  - `set_channel_list_preset(preset_name)` -> `None` — Set Channel List Preset
  - `set_displacement_center(center)` -> `None` — Set Displacement Center
  - `set_displacement_magnitude(magnitude)` -> `None` — Set Displacement Magnitude
  - `set_domain(domain)` -> `None` — Set Domain
  - `set_has_pixel_animation(has_animation)` -> `None` — Set Has Pixel Animation
  - `set_is_two_sided(enabled)` -> `None` — Set Is Two Sided
  - `set_nanite_tessellation_enabled(enabled)` -> `None` — Set Nanite Tessellation Enabled
  - `set_output_translucent_velocity_enabled(enabled)` -> `None` — Set Output Translucent Velocity Enabled
  - `set_pixel_animation_flag(has_animation: bool)` -> `None` — deprecated: âset_pixel_animation_flagâ was renamed to âset_has_pixel_animationâ.
  - `set_responsive_aa_enabled(enabled)` -> `None` — Set Responsive AAEnabled
  - `set_shading_model(shading_model)` -> `None` — Set Shading Model
  - `set_two_sided_flag(enabled: bool)` -> `None` — deprecated: âset_two_sided_flagâ was renamed to âset_is_two_sidedâ.
  - `unassign_material_property(property_)` -> `None` — Unassign Material Property

**Properties** (40):
  - `ambient_occlusion`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `anisotropy`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `b_pixel_animation_flag`: `bool` — âb_pixel_animation_flagâ was renamed to âhas_pixel_animationâ. deprecated
  - `b_two_sided_flag`: `bool` — âb_two_sided_flagâ was renamed to âtwo_sidedâ. deprecated
  - `base_color`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `blend_mode`: `BlendMode` [Read-Only] — [Read-Only] (BlendMode)
  - `create_material_package`: `bool` [Read-Only] — [Read-Only] (bool)
  - `custom1`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `custom2`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `custom3`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `custom4`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `displacement`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `displacement_center`: `float` [Read-Only] — [Read-Only] Mid point for displacement in the range 0-1. (float)
  - `displacement_magnitude`: `float` [Read-Only] — [Read-Only] Multipler for displacement values. (float)
  - `domain`: `MaterialDomain` [Read-Only] — [Read-Only] (MaterialDomain)
  - `emissive_color`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `expressions`: `None` [Read-Only] — [Read-Only] (Array[MaterialExpression])
  - `has_pixel_animation`: `bool` [Read-Only] — [Read-Only] Whether the opaque material has any pixel animations happening, that isnât included in...
  - `material_model`: `DynamicMaterialModel` [Read-Only] — [Read-Only] (DynamicMaterialModel)
  - `material_stats`: `MaterialStatistics` [Read-Only] — [Read-Only] (MaterialStatistics)
  - `metallic`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `nanite_tessellation_enabled`: `bool` [Read-Only] — Required for displacement to work. (bool) [Read-Only] Whether tessellation is enabled on the materia...
  - `normal`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `opacity`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `opacity_mask`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `output_translucent_velocity_enabled`: `bool` [Read-Only] — [Read-Only] When true, translucent materials will output motion vectors and write to depth buffer in...
  - `pixel_depth_offset`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `property_slot_map`: `None` [Read-Only] — [Read-Only] (Map[DMMaterialPropertyType,DMMaterialSlot])
  - `refraction`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `responsive_aa_enabled`: `bool` [Read-Only] — [Read-Only] Indicates that the material should be rendered using responsive anti-aliasing. Improves ...
  - `roughness`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `shading_model`: `DMMaterialShadingModel` [Read-Only] — [Read-Only] (DMMaterialShadingModel)
  - `slots`: `None` [Read-Only] — [Read-Only] (Array[DMMaterialSlot])
  - `specular`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `state`: `DMState` [Read-Only] — [Read-Only] (DMState)
  - `subsurface_color`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `surface_thickness`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `tangent`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)
  - `two_sided`: `bool` [Read-Only] — [Read-Only] Indicates that the material should be rendered without backface culling and the normal s...
  - `world_position_offset`: `DMMaterialProperty` [Read-Only] — [Read-Only] (DMMaterialProperty)

### `unreal.DynamicMaterialModelFactory`
Inherits: `Factory` | Header: `DynamicMaterialModelFactory.h`

Dynamic Material Model Factory

### `unreal.AvaColorChannel`
Inherits: `EnumBase` | Header: `DMEDefs.h`

EAva Color Channel

**Properties** (5):
  - `ALPHA`: `AvaColorChannel = Ellipsis` — 8
  - `BLUE`: `AvaColorChannel = Ellipsis` — 4
  - `GREEN`: `AvaColorChannel = Ellipsis` — 2
  - `NONE`: `AvaColorChannel = Ellipsis` — 0
  - `RED`: `AvaColorChannel = Ellipsis` — 1

### `unreal.DMDefaultMaterialPropertySlotValueType`
Inherits: `EnumBase` | Header: `DynamicMaterialEditorSettings.h`

EDMDefault Material Property Slot Value Type

**Properties** (2):
  - `COLOR`: `DMDefaultMaterialPropertySlotValueType = Ellipsis` — 1
  - `TEXTURE`: `DMDefaultMaterialPropertySlotValueType = Ellipsis` — 0

### `unreal.DMEdgeLocation`
Inherits: `EnumBase` | Header: `DMMSETextureSampleEdgeColor.h`

EDMEdge Location

**Properties** (10):
  - `BOTTOM`: `DMEdgeLocation = Ellipsis` — 7
  - `BOTTOM_LEFT`: `DMEdgeLocation = Ellipsis` — 6
  - `BOTTOM_RIGHT`: `DMEdgeLocation = Ellipsis` — 8
  - `CENTER`: `DMEdgeLocation = Ellipsis` — 4
  - `CUSTOM`: `DMEdgeLocation = Ellipsis` — 9
  - `LEFT`: `DMEdgeLocation = Ellipsis` — 3
  - `RIGHT`: `DMEdgeLocation = Ellipsis` — 5
  - `TOP`: `DMEdgeLocation = Ellipsis` — 1
  - `TOP_LEFT`: `DMEdgeLocation = Ellipsis` — 0
  - `TOP_RIGHT`: `DMEdgeLocation = Ellipsis` — 2

### `unreal.DMExpressionMenu`
Inherits: `EnumBase` | Header: `DMMaterialStageExpression.h`

EDMExpression Menu

**Properties** (11):
  - `CAMERA`: `DMExpressionMenu = Ellipsis` — 0
  - `DECAL`: `DMExpressionMenu = Ellipsis` — 1
  - `GEOMETRY`: `DMExpressionMenu = Ellipsis` — 2
  - `LANDSCAPE`: `DMExpressionMenu = Ellipsis` — 3
  - `MATH`: `DMExpressionMenu = Ellipsis` — 4
  - `OBJECT`: `DMExpressionMenu = Ellipsis` — 5
  - `OTHER`: `DMExpressionMenu = Ellipsis` — 6
  - `PARTICLE`: `DMExpressionMenu = Ellipsis` — 7
  - `TEXTURE`: `DMExpressionMenu = Ellipsis` — 8
  - `TIME`: `DMExpressionMenu = Ellipsis` — 9
  - `WORLD_SPACE`: `DMExpressionMenu = Ellipsis` — 10

### `unreal.DMLiveEditMode`
Inherits: `EnumBase` | Header: `DynamicMaterialEditorSettings.h`

EDMLive Edit Mode

**Properties** (3):
  - `DISABLED`: `DMLiveEditMode = Ellipsis` — 0
  - `LIVE_EDIT_OFF`: `DMLiveEditMode = Ellipsis` — 1
  - `LIVE_EDIT_ON`: `DMLiveEditMode = Ellipsis` — 2

### `unreal.DMMaterialEditorLayout`
Inherits: `EnumBase` | Header: `DynamicMaterialEditorSettings.h`

EDMMaterial Editor Layout

**Properties** (5):
  - `FIRST`: `DMMaterialEditorLayout = Ellipsis` — 0
  - `LAST`: `DMMaterialEditorLayout = Ellipsis` — 2
  - `LEFT`: `DMMaterialEditorLayout = Ellipsis` — 2
  - `TOP`: `DMMaterialEditorLayout = Ellipsis` — 0
  - `TOP_SLIM`: `DMMaterialEditorLayout = Ellipsis` — 1

### `unreal.DMMaterialEffectTarget`
Inherits: `EnumBase` | Header: `DMMaterialEffect.h`

EDMMaterial Effect Target

**Properties** (5):
  - `BASE_STAGE`: `DMMaterialEffectTarget = Ellipsis` — 1
  - `MASK_STAGE`: `DMMaterialEffectTarget = Ellipsis` — 2
  - `NONE`: `DMMaterialEffectTarget = Ellipsis` — 0
  - `SLOT`: `DMMaterialEffectTarget = Ellipsis` — 8
  - `TEXTURE_UV`: `DMMaterialEffectTarget = Ellipsis` — 4

### `unreal.DMMaterialLayerStage`
Inherits: `EnumBase` | Header: `DMEDefs.h`

EDMMaterial Layer Stage

**Properties** (3):
  - `ALL`: `DMMaterialLayerStage = Ellipsis` — 3
  - `BASE`: `DMMaterialLayerStage = Ellipsis` — 1
  - `MASK`: `DMMaterialLayerStage = Ellipsis` — 2

### `unreal.DMMaterialPreviewMesh`
Inherits: `EnumBase` | Header: `DynamicMaterialEditorSettings.h`

EDMMaterial Preview Mesh

**Properties** (5):
  - `CUBE`: `DMMaterialPreviewMesh = Ellipsis` — 1
  - `CUSTOM`: `DMMaterialPreviewMesh = Ellipsis` — 4
  - `CYLINDER`: `DMMaterialPreviewMesh = Ellipsis` — 3
  - `PLANE`: `DMMaterialPreviewMesh = Ellipsis` — 0
  - `SPHERE`: `DMMaterialPreviewMesh = Ellipsis` — 2

### `unreal.DMState`
Inherits: `EnumBase` | Header: `DynamicMaterialModelEditorOnlyData.h`

EDMState

**Properties** (2):
  - `BUILDING`: `DMState = Ellipsis` — 1
  - `IDLE`: `DMState = Ellipsis` — 0

### `unreal.LinearGradientTileType`
Inherits: `EnumBase` | Header: `DMMSGLinear.h`

ELinear Gradient Tile Type

**Properties** (3):
  - `NO_TILE`: `LinearGradientTileType = Ellipsis` — 0
  - `TILE`: `LinearGradientTileType = Ellipsis` — 1
  - `TILE_AND_MIRROR`: `LinearGradientTileType = Ellipsis` — 2
