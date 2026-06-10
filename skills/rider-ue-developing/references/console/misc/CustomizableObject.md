# UE Python API — CustomizableObject Module

**48 types** from the `CustomizableObject` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BakedResourceData`, `BakingConfiguration`, `CompileCallbackParams`, `CompileParams`, `CustomizableObjectAnimationSlot`, `CustomizableObjectAssetParameterValue`, `CustomizableObjectBoolParameterValue`, `CustomizableObjectFloatParameterValue`, `CustomizableObjectIdPair`, `CustomizableObjectInstanceBakeOutput`, `CustomizableObjectIntParameterValue`, `CustomizableObjectProjector`, `CustomizableObjectProjectorParameterValue`, `CustomizableObjectTransformParameterValue`, `CustomizableObjectVectorParameterValue`, `MultilayerProjectorLayer`, `MutableLODSettings`, `MutableParamUIMetadata`, `MutableStateUIMetadata`, `MutableUIMetadata`, ... (48 total)

---

## Classes

### `unreal.BakedResourceData`
Inherits: `StructBase` | Header: `CustomizableObjectInstance.h`

Data structure that exposes the path to a baked package and also what type of save was performed (an override, a standard save with a new fileâ¦)

**Properties** (2):
  - `asset_path`: `str` [Read-Only] — [Read-Only] The path used by the saved package. (str)
  - `save_type`: `PackageSaveResolutionType` [Read-Only] — [Read-Only] The way the package represented by this object was saved onto disk. (PackageSaveResoluti...

### `unreal.BakingConfiguration`
Inherits: `StructBase` | Header: `CustomizableObjectInstance.h`

Configuration data structure designed to serve as variable container for the customizable object instance baking methods.

**Properties** (6):
  - `allow_overriding_of_files`: `bool` — [Read-Write] Flag that determines if we should override already exported files or if we should not. ...
  - `export_all_resources_on_bake`: `bool` — [Read-Write] Determines if we want a full or partial export (bool)
  - `generate_constant_material_instances_on_bake`: `bool` — [Read-Write] Determines if we want (or not) to generate constant material instances for each of the ...
  - `on_bake_operation_completed_callback`: `BakeOperationCompletedDelegate` — [Read-Write] Callback executed once the baking operation gets completed. It will return the end succ...
  - `output_files_base_name`: `str` — [Read-Write] The name to be used as base (prefix) during the naming of the exported resources (str)
  - `output_path`: `str` — [Read-Write] The path where to save the baked resources. EX /Game/MyBakingTest (str)

### `unreal.CompileCallbackParams`
Inherits: `StructBase` | Header: `CustomizableObject.h`

Compile Callback Params

**Properties** (5):
  - `compiled`: `bool` [Read-Only] — [Read-Only] The Customizable Object is compiled. (bool)
  - `errors`: `bool` [Read-Only] — [Read-Only] The compile request has finished with errors. False if the request has been skipped. (bo...
  - `request_failed`: `bool` [Read-Only] — [Read-Only] The compile request has failed. See output log for more details. False if the request ha...
  - `skipped`: `bool` [Read-Only] — [Read-Only] The compilation has been skipped due to Compile Parameters. (bool)
  - `warnings`: `bool` [Read-Only] — [Read-Only] The compile request has finished with warnings. False if the request has been skipped. (...

### `unreal.CompileParams`
Inherits: `StructBase` | Header: `CustomizableObject.h`

Compile Params

**Properties** (8):
  - `async_`: `bool` — [Read-Write] If true, compile the Customizable Object asynchronously. If synchronously and the Custo...
  - `callback`: `CompileDelegate` — [Read-Write] Called once the compilation request has finished (successfully or not). (CompileDelegat...
  - `compile_only_selected_instance`: `CustomizableObjectInstance` — [Read-Write] If assigned, compile the Customizable Object only the selected parameter of the given I...
  - `gather_referneces`: `bool` — [Read-Write] Gathers all asset references used in this Customizable Object. Marks the object as modi...
  - `optimization_level`: `CustomizableObjectOptimizationLevel` — [Read-Write] (CustomizableObjectOptimizationLevel)
  - `skip_if_compiled`: `bool` — [Read-Write] If true, skip the compilation if the Customizable Object is already compiled. (bool)
  - `skip_if_out_of_date`: `bool` — [Read-Write] If true, skip the compilation if the Customizable Object or its contents are out of dat...
  - `texture_compression`: `CustomizableObjectTextureCompression` — [Read-Write] (CustomizableObjectTextureCompression)

### `unreal.CustomizableObjectAnimationSlot`
Inherits: `StructBase` | Header: `CustomizableObjectInstanceAssetUserData.h`

Customizable Object Animation Slot

**Properties** (2):
  - `anim_instance`: `Class` — [Read-Write] (Class)
  - `name`: `Name` — [Read-Write] (Name)

### `unreal.CustomizableObjectAssetParameterValue`
Inherits: `StructBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

Customizable Object Asset Parameter Value

### `unreal.CustomizableObjectBoolParameterValue`
Inherits: `StructBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

Customizable Object Bool Parameter Value

### `unreal.CustomizableObjectFloatParameterValue`
Inherits: `StructBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

Customizable Object Float Parameter Value

### `unreal.CustomizableObjectIdPair`
Inherits: `StructBase` | Header: `CustomizableObjectIdentifier.h`

Customizable Object Id Pair

**Properties** (2):
  - `customizable_object_group_name`: `str` [Read-Only] — [Read-Only] (str)
  - `customizable_object_name`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.CustomizableObjectInstanceBakeOutput`
Inherits: `StructBase` | Header: `CustomizableObjectInstance.h`

Structure returned as output of the baking operation. May contain a filled collection of FBakedResourceData objects and also the success end state of the baking operation.

**Properties** (2):
  - `saved_packages`: `None` [Read-Only] — [Read-Only] Collection of FBakedResourceData representing all saved packages during the baking opera...
  - `was_bake_successful`: `bool` [Read-Only] — [Read-Only] Success state for the baking operation. True for success and false for failure. (bool)

### `unreal.CustomizableObjectIntParameterValue`
Inherits: `StructBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

Customizable Object Int Parameter Value

### `unreal.CustomizableObjectProjector`
Inherits: `StructBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

Customizable Object Projector

### `unreal.CustomizableObjectProjectorParameterValue`
Inherits: `StructBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

Customizable Object Projector Parameter Value

### `unreal.CustomizableObjectTransformParameterValue`
Inherits: `StructBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

Customizable Object Transform Parameter Value

### `unreal.CustomizableObjectVectorParameterValue`
Inherits: `StructBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

Customizable Object Vector Parameter Value

### `unreal.MultilayerProjectorLayer`
Inherits: `StructBase` | Header: `MultilayerProjector.h`

Data structure representing a Multilayer Projector Layer.

### `unreal.MutableLODSettings`
Inherits: `StructBase` | Header: `CustomizableObject.h`

Mutable LODSettings

### `unreal.MutableParamUIMetadata`
Inherits: `MutableUIMetadata` | Header: `CustomizableObjectUIData.h`

Mutable Param UIMetadata

**Properties** (3):
  - `gameplay_tags`: `GameplayTagContainer` — [Read-Write] Gameplay tags to take into consideration when filtering parameters.
Only applies to the...
  - `maximum_value`: `float` — [Read-Write] (float)
  - `minimum_value`: `float` — [Read-Write] (float)

### `unreal.MutableStateUIMetadata`
Inherits: `MutableUIMetadata` | Header: `CustomizableObjectUIData.h`

Mutable State UIMetadata

### `unreal.MutableUIMetadata`
Inherits: `StructBase` | Header: `CustomizableObjectUIData.h`

Mutable UIMetadata

**Properties** (6):
  - `extra_assets`: `None` — [Read-Write] Extra assets to be used in UI building (Map[str,Object])
  - `extra_information`: `None` — [Read-Write] Extra information to be used in UI building, with semantics completely defined by the g...
  - `object_friendly_name`: `str` — [Read-Write] This is the name to be shown in UI (str)
  - `ui_order`: `int` — [Read-Write] This is the order of the object inside its section (int32)
  - `ui_section_name`: `str` — [Read-Write] This is the name of the section where the object will be placed in UI (str)
  - `ui_thumbnail`: `Texture2D` — [Read-Write] Thumbnail for UI (Texture2D)

### `unreal.PreSetSkeletalMeshParams`
Inherits: `StructBase` | Header: `CustomizableObjectInstance.h`

Pre Set Skeletal Mesh Params

### `unreal.UpdateContext`
Inherits: `StructBase` | Header: `CustomizableObjectInstance.h`

Instance Update Context. Used to avoid changing the delegate signature in the future.

**Properties** (1):
  - `update_result`: `UpdateResult` [Read-Only] — [Read-Only] (UpdateResult)

### `unreal.CustomizableInstanceLODManagement`
Inherits: `CustomizableInstanceLODManagementBase` | Header: `CustomizableInstanceLODManagement.h`

Customizable Instance LODManagement

### `unreal.CustomizableInstanceLODManagementBase`
Inherits: `Object` | Header: `CustomizableInstanceLODManagement.h`

This is an abstract base class, override it to create a MakeShared<FInstance> LOD management system and register with UCustomizableObjectSystem::SetInstanceLODManagement

### `unreal.CustomizableObject`
Inherits: `Object` | Header: `CustomizableObject.h`

Customizable Object

**Methods** (39):
  - `compile(params)` -> `None` — Compile the Customizable Object.
  - `contains_enum_parameter_value(parameter_name, value)` -> `bool` — Return true if the enum parameter contains this value a possible option.
  - `contains_parameter(parameter_name)` -> `bool` — Contains Parameter
  - `create_instance()` -> `CustomizableObjectInstance` — Create a new instance of this object. The instance parameters will be initialized with the object default values.
  - `find_parameter(name)` -> `int32` — Find Parameter
  - `get_bool_parameter_default_value(parameter_name)` -> `bool` — Get the default value of a parameter of type Bool.
  - `get_color_parameter_default_value(parameter_name)` -> `LinearColor` — Get the default value of a parameter of type Color.
  - `get_component_count()` -> `int32` — Get the number of components this Customizable Object has.
  - `get_component_mesh_reference_skeletal_mesh(name)` -> `SkeletalMesh` — Given a Mesh Component name, return its reference Skeletal Mesh.
  - `get_component_name(component_index)` -> `Name` — Return the name of the component.
  - `get_enum_parameter_default_value(parameter_name)` -> `int32` — Get the default value of a parameter of type Int.
  - `get_enum_parameter_group_type(param_name)` -> `CustomizableObjectGroupType` — Returns the group type of the given integer parameter
  - `get_enum_parameter_num_values(parameter_name)` -> `int32` — If the given parameter is enum int parameter, return how many possible values an enum parameter has. Otherwise, return 0...
  - `get_enum_parameter_value(parameter_name, value_index)` -> `str` — Gets the Name of the value at position ValueIndex in the list of available values for the int parameter.
  - `get_enum_parameter_value_data_table(param_name, value)` -> `Array [ DataTable ]` — Return the DataTables used by the given parameter and its value (if any).
  - `get_enum_parameter_value_ui_metadata(param_name, option_name)` -> `MutableParamUIMetadata` — Return the metadata associated to the given enum parameter value.
  - `get_float_parameter_default_value(parameter_name)` -> `float` — Get the default value of a parameter of type Float.
  - `get_int_parameter_available_option(param_index, k)` -> `str` — Get Int Parameter Available Option
  - `get_int_parameter_default_value(parameter_name: str)` -> `int` — deprecated: âget_int_parameter_default_valueâ was renamed to âget_enum_parameter_default_valueâ.
  - `get_int_parameter_group_type(param_name: str)` -> `CustomizableObjectGroupType` — deprecated: âget_int_parameter_group_typeâ was renamed to âget_enum_parameter_group_typeâ.
  - `get_int_parameter_num_options(param_index)` -> `int32` — Get Int Parameter Num Options
  - `get_int_parameter_option_data_table(param_name: str, value: str)` -> `None` — deprecated: âget_int_parameter_option_data_tableâ was renamed to âget_enum_parameter_value_data_tableâ.
  - `get_int_parameter_option_ui_metadata(param_name: str, option_name: str)` -> `MutableParamUIMetadata` — deprecated: âget_int_parameter_option_ui_metadataâ was renamed to âget_enum_parameter_value_ui_metadataâ.
  - `get_parameter_count()` -> `int32` — Get the number of parameters available in instances of this object.
  - `get_parameter_name(param_index)` -> `str` — TODO >5.6 rename to GetParameterType (with redirector). Name -> ParameterName (create redirector)
  - `get_parameter_type(param_index)` -> `MutableParameterType` — Get Parameter Type
  - `get_parameter_type_by_name(name)` -> `MutableParameterType` — Get the type of a parameter from its name.
  - `get_parameter_ui_metadata(param_name)` -> `MutableParamUIMetadata` — Return the metadata associated to a parameter.
  - `get_projector_parameter_default_value(parameter_name)` -> `CustomizableObjectProjector` — Get the default value of a projector with the provided name
  - `get_state_count()` -> `int32` — Return the number of object states that are defined in the CustomizableObject.
  - `get_state_name(state_index)` -> `str` — Get State Name
  - `get_state_parameter_count(state_name)` -> `int32` — Return the number of parameters that are editable at runtime for a specific state.
  - `get_state_parameter_name(state_name, parameter_index)` -> `str` — Return the name of one of the stateâs runtime parameters, by its index (from 0 to GetStateParameterCount - 1).
  - `get_state_ui_metadata(state_name)` -> `MutableStateUIMetadata` — Return the metadata associated to a state.
  - `get_transform_parameter_default_value(parameter_name)` -> `Transform` — Get the default value of a parameter of type Transform.
  - `is_child_object()` -> `bool` — Return true if this Customizable Object has references to a parent Customizable Object. Only root Customizable Objects w...
  - `is_compiled()` -> `bool` — Check if the CustomizableObject asset has been compiled. This will always be true in a packaged game, but it could be fa...
  - `is_loading()` -> `bool` — Return true if the Customizable Object is still being loaded. It may take a few frames to load the Customizable Object.
  - `is_parameter_multidimensional(parameter_name)` -> `bool` — Return true if the parameter at the index provided is multidimensional.

**Properties** (1):
  - `lod_settings`: `MutableLODSettings` — [Read-Write]
deprecated: Moved to Mesh Component Node (MutableLODSettings)

### `unreal.CustomizableObjectExtension`
Inherits: `Object` | Header: `CustomizableObjectExtension.h`

An extension that adds functionality to the Customizable Object system

### `unreal.CustomizableObjectInstance`
Inherits: `Object` | Header: `CustomizableObjectInstance.h`

Customizable Object Instance

**Methods** (82):
  - `add_value_to_float_range(param_name)` -> `int32` — Increases the range of values of the float with ParamName, returns the index of the new float value, -1 otherwise. The a...
  - `add_value_to_int_range(param_name)` -> `int32` — Increases the range of values of the integer with ParamName and returns the index of the new integer value, -1 otherwise...
  - `add_value_to_projector_range(param_name)` -> `int32` — Increases the range of values of the projector with ParamName, returns the index of the new projector value, -1 otherwis...
  - `bake(baking_configuration)` -> `None` — Performs the baking of the instance resources in an async fashion. Bind yourself to the callback present in InBakingConf...
  - `clone()` -> `CustomizableObjectInstance` — Clones the instance creating a new identical transient instance.
  - `clone_static(outer)` -> `CustomizableObjectInstance` — Clones the instance creating a new identical static instance with the given Outer.
  - `contains_bool_parameter(parameter_name)` -> `bool` — Return true if the Bool Parameter exists.
  - `contains_float_parameter(parameter_name)` -> `bool` — Return true if the Float Parameter exists.
  - `contains_int_parameter(parameter_name)` -> `bool` — Return true if the Int Parameter exists.
  - `contains_projector_parameter(parameter_name)` -> `bool` — Return true if the Projector Parameter exists.
  - `contains_transform_parameter(parameter_name)` -> `bool` — Return true if the Transform Parameter exists.
  - `contains_vector_parameter(parameter_name)` -> `bool` — Return true if the Vector Parameter exists.
  - `find_bool_parameter_name_index(param_name)` -> `int32` — Find Bool Parameter Name Index
  - `find_float_parameter_name_index(param_name)` -> `int32` — Find Float Parameter Name Index
  - `find_int_parameter_name_index(param_name)` -> `int32` — Find Int Parameter Name Index
  - `find_projector_parameter_name_index(param_name)` -> `int32` — Find Projector Parameter Name Index
  - `find_vector_parameter_name_index(param_name)` -> `int32` — Find Vector Parameter Name Index
  - `for_each_anim_instance(object_component_index, delegate)` -> `None` — DEPRECATED: Use ForEachComponentAnimInstance.
  - `for_each_component_anim_instance(component_name, delegate)` -> `None` — Execute a delegate for each animation instance involved in this customizable object instance.
  - `get_anim_bp(component_name, slot)` — Returns the animation BP for the parameter component and slot, gathered from all the meshes that compose this instance.
  - `get_animation_gameplay_tags()` -> `GameplayTagContainer` — Return the list of tags for this instance.
  - `get_bool_parameter_selected_option(bool_param_name)` -> `bool` — Gets the bool value âBoolValueâ of a bool parameter with name âBoolParamNameâ.
  - `get_build_parameter_relevancy()` -> `bool` — Return true if the parameter relevancy will be updated when this instance is generated.
  - `get_color_parameter_selected_option(color_param_name)` -> `LinearColor` — Gets the value of a color parameter with name âColorParamNameâ.
  - `get_component_mesh_skeletal_mesh(component_name)` -> `SkeletalMesh` — Given a Mesh Component name, return its generated Skeletal Mesh.
  - `get_component_names()` -> `Array [ Name ]` — Return the list of names of components generated for this instance. This only has values when the instance has been comp...
  - `get_current_state()` -> `str` — Return the name of the current CustomizableObject state this is instance is set to.
  - `get_customizable_object()` -> `CustomizableObject` — Get the CustomizableObject that this is an instance of.
  - `get_extension_instance_data(extension)` -> `InstancedStruct` — Get Extension Instance Data
  - `get_float_parameter_selected_option(float_param_name, range_index = -1)` -> `float` — Gets the value of a float parameter with name âFloatParamNameâ.
  - `get_float_value_range(param_name)` -> `int32` — For multidimensional parameters, return the number of dimensions that the given float parameter supports.
  - `get_int_parameter_selected_option(param_name, range_index = -1)` -> `str` — Return the name of the option currently set in the given parameter.
  - `get_int_value_range(param_name)` -> `int32` — For multidimensional parameters, return the number of dimensions that the given int parameter supports.
  - `get_merged_asset_user_data(component_index)` -> `Set [ AssetUserData ]` — Returns the AssetUserData that was gathered from all the constituent mesh parts during the last update. It requires that...
  - `get_num_components()` -> `int32` — Return the total number of components that can be generated with the CustomizableObject (unrelated to this instance para...
  - `get_projector_angle(param_name, range_index = -1)` -> `float` — Get the current cylindrical projector angle for the parameter with the given name.
  - `get_projector_direction(param_name, range_index = -1)` -> `Vector` — Get the current projector direction vector for the parameter with the given name.
  - `get_projector_parameter_type(param_name, range_index = -1)` -> `CustomizableObjectProjectorType` — Get the current projector type for the parameter with the given name.
  - `get_projector_position(param_name, range_index = -1)` -> `Vector` — Get the current projector position for the parameter with the given name.
  - `get_projector_scale(param_name, range_index = -1)` -> `Vector` — Get the current projector scale for the parameter with the given name.
  - `get_projector_up(param_name, range_index = -1)` -> `Vector` — Get the current projector up vector for the parameter with the given name.
  - `get_projector_value(projector_param_name, out_direction=Vector, out_up=Vector, out_scale=Vector, out_angle=float, out_type=CustomizableObjectProjectorType)` — Get the projector values of a projector parameter with index âProjectorParamIndexâ.
  - `get_projector_value_range(param_name)` -> `int32` — For multidimensional parameters, return the number of dimensions that the given projector parameter supports.
  - `get_skeletal_mesh(component_index = 0)` -> `SkeletalMesh` — DEPRECATED: Use GetComponentMeshSkeletalMesh
  - `get_texture_parameter_selected_option(texture_param_name, range_index = -1)` -> `Name` — Gets the value of a texture parameter with name âTextureParamNameâ.
  - `get_texture_value_range(param_name)` -> `int32` — For multidimensional parameters, return the number of dimensions that the given texture parameter supports.
  - `get_transform_parameter_selected_option(transform_param_name)` -> `Transform` — Gets the value of a transform parameter with name âTransformParamNameâ.
  - `has_any_parameters()` -> `bool` — Return true if the instance has any parameters.
  - `has_any_skeletal_mesh()` -> `bool` — Return true if a skeletal mesh has been generated for any component of this instance.
  - `is_parameter_dirty(param_name, range_index = -1)` -> `bool` — Return true if the parameter has changed but the Instance has not yet been updated.
  - `is_parameter_relevant(param_name)` -> `bool` — Return true if the given parameter has any effect in the current object state, and considering the current values of the...
  - `multilayer_projector_create_layer(projector_param_name, index)` -> `None` — See FMultilayerProjector::CreateLayer.
  - `multilayer_projector_get_layer(projector_param_name, index)` -> `MultilayerProjectorLayer` — See FMultilayerProjector::GetLayer.
  - `multilayer_projector_num_layers(projector_param_name)` -> `int32` — See FMultilayerProjector::NumLayers.
  - `multilayer_projector_remove_layer_at(projector_param_name, index)` -> `None` — See FMultilayerProjector::RemoveLayerAt.
  - `multilayer_projector_update_layer(projector_param_name, index, layer)` -> `None` — See FMultilayerProjector::UpdateLayer.
  - `remove_value_from_float_range(param_name, range_index = -1)` -> `int32`
  - `remove_value_from_int_range(param_name, range_index = -1)` -> `int32`
  - `remove_value_from_projector_range(param_name, range_index = -1)` -> `int32`
  - `set_bool_parameter_selected_option(bool_param_name, bool_value)` -> `None` — Sets the bool value âBoolValueâ of a bool parameter with name âBoolParamNameâ.
  - `set_build_parameter_relevancy(value)` -> `None` — Set the flag that controls if parameter relevancy will be updated when this instance is generated.
  - `set_color_parameter_selected_option(color_param_name, color_value)` -> `None` — Sets the color value âColorValueâ of a color parameter with index âColorParamIndexâ.
  - `set_current_state(state_name)` -> `None` — Set the CustomizableObject state that this instance will be generated into.
  - `set_default_value(param_name)` -> `None` — Sets a parameter to its default value
  - `set_default_values()` -> `None` — Set all parameters to their default value.
  - `set_float_parameter_selected_option(float_param_name, float_value, range_index = -1)` -> `None` — Sets the float value âFloatValueâ of a float parameter with index âFloatParamIndexâ.
  - `set_int_parameter_selected_option(param_name, selected_option_name, range_index = -1)` -> `None` — Set the currently selected option value for the given parameter, by parameter name and option name.
  - `set_object(object)` -> `None` — Set the CustomizableObject this instance will be generated from. It is usually not necessary to call this since instance...
  - `set_projector_angle(projector_param_name, angle, range_index = -1)` -> `None` — Set only the cylindrical projector angle keeping the rest of values.
  - `set_projector_direction(projector_param_name, direction, range_index = -1)` -> `None` — Set only the projector direction vector keeping the rest of values.
  - `set_projector_position(projector_param_name, pos, range_index = -1)` -> `None` — Set only the projector position keeping the rest of values.
  - `set_projector_scale(projector_param_name, scale, range_index = -1)` -> `None` — Set only the projector scale keeping the rest of values.
  - `set_projector_up(projector_param_name, up, range_index = -1)` -> `None` — Set only the projector up vector keeping the rest of values.
  - `set_projector_value(projector_param_name, out_pos, out_direction, out_up, out_scale, out_angle, range_index = -1)` -> `None` — Sets the projector values of a projector parameter with index âProjectorParamIndexâ.
  - `set_random_values()` -> `None` — Set random values to the parameters.
  - `set_random_values_from_stream(stream)` -> `None` — Set random values to the parameters using a stream.
  - `set_replace_physics_assets(replace_enabled)` -> `None` — Enable physics asset replacement so that generated skeletal meshes have the merged physics assets of their skeletal mesh...
  - `set_texture_parameter_selected_option(texture_param_name, texture_value, range_index = -1)` -> `None` — Sets the texture value âTextureValueâ of a texture parameter with index âTextureParamIndexâ.
  - `set_transform_parameter_selected_option(transform_param_name, transform_value)` -> `None` — Sets the transform value âTransformValueâ of a transform parameter with name âTransformParamNameâ.
  - `set_vector_parameter_selected_option(vector_param_name, vector_value)` -> `None` — Sets the vector value âVectorValueâ of a vector parameter with index âVectorParamIndexâ.
  - `update_skeletal_mesh_async(ignore_close_dist = False, force_high_priority = False)` -> `None` — Generate the instance with the current parameters and update all the components Skeletal Meshes asynchronously.
  - `update_skeletal_mesh_async_result(callback, ignore_close_dist = False, force_high_priority = False)` -> `None` — Generate the instance with the current parameters and update all the components Skeletal Meshes asynchronously. Callback...

**Properties** (1):
  - `updated_delegate`: `ObjectInstanceUpdatedDelegate` — [Read-Write] Broadcast when the Customizable Object Instance is updated. (ObjectInstanceUpdatedDeleg...

### `unreal.CustomizableObjectInstanceUsage`
Inherits: `Object` | Header: `CustomizableObjectInstanceUsage.h`

This class can be used instead of a UCustomizableComponent (for example for non-BP projects) to link a UCustomizableObjectInstance and a USkeletalComponent so that the CustomizableObjectSystem takes c...

**Methods** (12):
  - `attach_to(skeletal_mesh_component)` -> `None` — Attach this Customizable Object Instance Usage to a Skeletal Mesh Component to be customized.
  - `get_attach_parent()` -> `SkeletalMeshComponent` — Get the parent Skeletal Mesh Component this Customizable Object Instance Usage is attached to.
  - `get_component_name()` -> `Name` — Get Component Name
  - `get_customizable_object_instance()` -> `CustomizableObjectInstance` — Get Customizable Object Instance
  - `get_skip_set_reference_skeletal_mesh()` -> `bool` — Get Skip Set Reference Skeletal Mesh
  - `get_skip_set_skeletal_mesh_on_attach()` -> `bool` — Get Skip Set Skeletal Mesh on Attach
  - `set_component_name(name)` -> `None` — Set Component Name
  - `set_customizable_object_instance(customizable_object_instance)` -> `None` — Set Customizable Object Instance
  - `set_skip_set_reference_skeletal_mesh(skip)` -> `None` — Set to true to avoid automatically replacing the Skeletal Mesh of the parent Skeletal Mesh Component by the Reference Sk...
  - `set_skip_set_skeletal_mesh_on_attach(skip)` -> `None` — Set to true to avoid automatically replacing the Skeletal Mesh of the parent Skeletal Mesh Component with any mesh.
  - `update_skeletal_mesh_async(never_skip_update = False)` -> `None` — Update Skeletal Mesh asynchronously.
  - `update_skeletal_mesh_async_result(callback, ignore_close_dist = False, force_high_priority = False)` -> `None` — Update Skeletal Mesh asynchronously. Callback will be called once the update finishes, even if it fails.

### `unreal.CustomizableObjectInstanceUserData`
Inherits: `AssetUserData` | Header: `CustomizableObjectInstanceAssetUserData.h`

Additional data attached to Skeletal Meshes.

**Methods** (2):
  - `get_animation_gameplay_tags()` -> `GameplayTagContainer` — Return the list of tags for this instance.
  - `set_animation_gameplay_tags(instance_tags)` -> `None` — Sets the list of tags for this instance.

**Properties** (2):
  - `animation_gameplay_tag`: `GameplayTagContainer` — [Read-Write] (GameplayTagContainer)
  - `animation_slots`: `None` — [Read-Write] (Array[CustomizableObjectAnimationSlot])

### `unreal.CustomizableObjectSkeletalMesh`
Inherits: `SkeletalMesh` | Header: `CustomizableObjectSkeletalMesh.h`

CustomizableObjectSkeletalMesh is a class inheriting from USkeletalMesh with the sole purpose of allowing skeletal meshes generated by Mutable to stream-in Mesh LODs.

### `unreal.CustomizableObjectSystem`
Inherits: `Object` | Header: `CustomizableObjectSystem.h`

Customizable Object System

**Methods** (13):
  - `get_average_build_time()` -> `int32` — Return the average build/update time of an instance in ms.
  - `get_instance()` -> `CustomizableObjectSystem` [classmethod] — Get the singleton object. It will be created if it doesnât exist yet.
  - `get_instance_checked()` -> `CustomizableObjectSystem` [classmethod] — Get Instance Checked
  - `get_num_instances()` -> `int32` — Get the number of instances built and alive.
  - `get_num_pending_instances()` -> `int32` — Get the number of instances waiting to be updated.
  - `get_plugin_version()` -> `str` — Find out the version of the plugin
  - `get_texture_memory_used()` -> `int64` — Get the amount of GPU memory in use in bytes for textures generated by mutable.
  - `get_total_instances()` -> `int32` — Get the total number of instances including built and not built.
  - `get_working_memory()` -> `int32` — Get Mutableâs working memory limit (kilobytes). See SetWorkingMemory(int32).
  - `is_update_result_valid(update_result)` -> `bool` [classmethod] — Determines if the result of the instance update is valid or not.
  - `is_updating(instance)` -> `bool` — Return true if the instance is being updated.
  - `set_release_mutable_textures_immediately(release_textures)` -> `None` — If set to true, Mutable will release Mutable-generated textures immediately when they are no longer used without waiting...
  - `set_working_memory(kilo_bytes)` -> `None` — Set Mutableâs working memory limit (kilobytes). Mutable will flush internal caches to try to keep its memory consumpti...

### `unreal.CustomizableSkeletalComponent`
Inherits: `SceneComponent` | Header: `CustomizableSkeletalComponent.h`

Customizable Skeletal Component

**Methods** (10):
  - `get_component_name()` -> `Name` — Get Component Name
  - `get_customizable_object_instance()` -> `CustomizableObjectInstance` — Get Customizable Object Instance
  - `get_skip_set_reference_skeletal_mesh()` -> `bool` — Get Skip Set Reference Skeletal Mesh
  - `get_skip_set_skeletal_mesh_on_attach()` -> `bool` — Get Skip Set Skeletal Mesh on Attach
  - `set_component_name(name)` -> `None` — Own interface
  - `set_customizable_object_instance(instance)` -> `None` — Set Customizable Object Instance
  - `set_skip_set_reference_skeletal_mesh(skip)` -> `None` — Set to true to avoid automatically replacing the Skeletal Mesh of the parent Skeletal Mesh Component by the Reference Sk...
  - `set_skip_set_skeletal_mesh_on_attach(skip)` -> `None` — Set to true to avoid automatically replacing the Skeletal Mesh of the parent Skeletal Mesh Component with any mesh.
  - `update_skeletal_mesh_async(never_skip_update = False)` -> `None` — Update Skeletal Mesh asynchronously.
  - `update_skeletal_mesh_async_result(callback, ignore_close_dist = False, force_high_priority = False)` -> `None` — Update Skeletal Mesh asynchronously. Callback will be called once the update finishes, even if it fails.

**Properties** (2):
  - `component_index`: `int` — [Read-Write] This component index refers to the object list of components
DEPRECATED: Use FNames ins...
  - `customizable_object_instance`: `CustomizableObjectInstance` — [Read-Write] (CustomizableObjectInstance)

### `unreal.CustomizableSkeletalMeshActor`
Inherits: `SkeletalMeshActor` | Header: `CustomizableSkeletalMeshActor.h`

Customizable Skeletal Mesh Actor

**Methods** (2):
  - `enable_debug_material(enable_debug_material)` -> `None` — Enable Debug Material deprecated: Function âEnableDebugMaterialâ is deprecated.
  - `set_debug_material(debug_material)` -> `None` — Set Debug Material deprecated: Function âSetDebugMaterialâ is deprecated.

### `unreal.DGGUI`
Inherits: `UserWidget` | Header: `CustomizableObjectDGGUI.h`

**Methods** (2):
  - `get_customizable_object_instance_usage()` -> `CustomizableObjectInstanceUsage` — Get Customizable Object Instance Usage
  - `set_customizable_object_instance_usage(customizable_object_instance_usage)` -> `None` — Set Customizable Object Instance Usage

### `unreal.CustomizableObjectGroupType`
Inherits: `EnumBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

ECustomizable Object Group Type

**Properties** (4):
  - `COGT_ALL`: `CustomizableObjectGroupType = Ellipsis` — 1
  - `COGT_ONE`: `CustomizableObjectGroupType = Ellipsis` — 2
  - `COGT_ONE_OR_NONE`: `CustomizableObjectGroupType = Ellipsis` — 3
  - `COGT_TOGGLE`: `CustomizableObjectGroupType = Ellipsis` — 0

### `unreal.CustomizableObjectOptimizationLevel`
Inherits: `EnumBase` | Header: `CustomizableObjectSystem.h`

ECustomizable Object Optimization Level

**Properties** (4):
  - `FROM_CUSTOMIZABLE_OBJECT`: `CustomizableObjectOptimizationLevel = Ellipsis` — 3
  - `MAXIMUM`: `CustomizableObjectOptimizationLevel = Ellipsis` — 2
  - `MINIMAL`: `CustomizableObjectOptimizationLevel = Ellipsis` — 1
  - `NONE`: `CustomizableObjectOptimizationLevel = Ellipsis` — 0

### `unreal.CustomizableObjectProjectorType`
Inherits: `EnumBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

ECustomizable Object Projector Type

**Properties** (3):
  - `CYLINDRICAL`: `CustomizableObjectProjectorType = Ellipsis` — 1
  - `PLANAR`: `CustomizableObjectProjectorType = Ellipsis` — 0
  - `WRAPPING`: `CustomizableObjectProjectorType = Ellipsis` — 2

### `unreal.CustomizableObjectTextureCompression`
Inherits: `EnumBase` | Header: `CustomizableObjectSystem.h`

ECustomizable Object Texture Compression

**Properties** (3):
  - `FAST`: `CustomizableObjectTextureCompression = Ellipsis` — Use Mutableâs fast low-quality compression 1
  - `HIGH_QUALITY`: `CustomizableObjectTextureCompression = Ellipsis` — Use Unrealâs highest quality compression (100x slower to compress) 2
  - `NONE`: `CustomizableObjectTextureCompression = Ellipsis` — Donât use texture compression 0

### `unreal.MutableCompileMeshType`
Inherits: `EnumBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

Customizable object mesh compilation options

**Properties** (5):
  - `ADD_WORKING_SET_AND_CHILDREN`: `MutableCompileMeshType = Ellipsis` — Add to the compilation all COs in the Working Set array and all parents of this object and all paren...
  - `ADD_WORKING_SET_NO_CHILDREN`: `MutableCompileMeshType = Ellipsis` — Compile this CO and add all children and parents until whole graph root 3
  - `FULL`: `MutableCompileMeshType = Ellipsis` — 0
  - `LOCAL`: `MutableCompileMeshType = Ellipsis` — Compile this CO, and add all COs in the whole hierarchy 1
  - `LOCAL_AND_CHILDREN`: `MutableCompileMeshType = Ellipsis` — Compile this CO and add all parents until whole graph root 2

### `unreal.MutableParameterType`
Inherits: `EnumBase` | Header: `CustomizableObjectParameterTypeDefinitions.h`

EMutable Parameter Type

**Properties** (9):
  - `BOOL`: `MutableParameterType = Ellipsis` — 1
  - `COLOR`: `MutableParameterType = Ellipsis` — 4
  - `FLOAT`: `MutableParameterType = Ellipsis` — 3
  - `INT`: `MutableParameterType = Ellipsis` — 2
  - `MESH`: `MutableParameterType = Ellipsis` — 8
  - `NONE`: `MutableParameterType = Ellipsis` — 0
  - `PROJECTOR`: `MutableParameterType = Ellipsis` — 5
  - `TEXTURE`: `MutableParameterType = Ellipsis` — 6
  - `TRANSFORM`: `MutableParameterType = Ellipsis` — 7

### `unreal.PackageSaveResolutionType`
Inherits: `EnumBase` | Header: `CustomizableObjectInstance.h`

Represents what kind of saving procedure was performed to save the package

**Properties** (4):
  - `NEW_FILE`: `PackageSaveResolutionType = Ellipsis` — The package got saved as a new file. 1
  - `NONE`: `PackageSaveResolutionType = Ellipsis` — 0
  - `OVERRIDEN`: `PackageSaveResolutionType = Ellipsis` — The package was already present on disk so the old package was deleted and a new one was saved on it...
  - `UNABLE_TO_OVERRIDE`: `PackageSaveResolutionType = Ellipsis` — An override was required but due to an error or lack of user permission it could not be done. 3 Erro...

### `unreal.UpdateResult`
Inherits: `EnumBase` | Header: `CustomizableObjectInstance.h`

Instance Update Result.

**Properties** (7):
  - `ERROR`: `UpdateResult = Ellipsis` — Generic warning. Update finished but with warnings. 2
  - `ERROR16_BIT_BONE_INDEX`: `UpdateResult = Ellipsis` — The update was not finished since due to the LOD management discarding the data. 6
  - `ERROR_DISCARDED`: `UpdateResult = Ellipsis` — The update was replaced by a newer update request. 5
  - `ERROR_OPTIMIZED`: `UpdateResult = Ellipsis` — Generic error. 3
  - `ERROR_REPLACED`: `UpdateResult = Ellipsis` — The update was skipped since its result would have been the same as the current customization. 4
  - `SUCCESS`: `UpdateResult = Ellipsis` — 0
  - `WARNING`: `UpdateResult = Ellipsis` — Update finished without issues. 1

### `unreal.BakeOperationCompletedDelegate`
Inherits: `DelegateBase` | Header: `CustomizableObjectInstance.h`

Bake Operation Completed Delegate Delegate Signature

### `unreal.CompileDelegate`
Inherits: `DelegateBase` | Header: `CustomizableObject.h`

Compile Delegate Delegate Signature

### `unreal.EachComponentAnimInstanceClassDelegate`
Inherits: `DelegateBase` | Header: `CustomizableObjectInstance.h`

Each Component Anim Instance Class Delegate Delegate Signature

### `unreal.InstanceUpdateDelegate`
Inherits: `DelegateBase` | Header: `CustomizableObjectInstance.h`

Instance Update Delegate Delegate Signature

### `unreal.ObjectInstanceUpdatedDelegate`
Inherits: `MulticastDelegateBase` | Header: `CustomizableObjectInstance.h`

Broadcast when an Instance update has completed. Notice that Mutable internally can also start an Instance update.

### `unreal.PreSetSkeletalMeshDelegate`
Inherits: `MulticastDelegateBase` | Header: `CustomizableObjectInstance.h`

Pre Set Skeletal Mesh Delegate Delegate Signature
