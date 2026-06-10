# UE Python API — MaterialEditor Module

**2 types** from the `MaterialEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MaterialStatistics`, `MaterialEditingLibrary`

---

## Classes

### `unreal.MaterialStatistics`
Inherits: `StructBase` | Header: `MaterialEditingLibrary.h`

Material Statistics

**Properties** (8):
  - `num_interpolator_scalars`: `int` — [Read-Write] Number of interpolator scalars required for user-defined interpolators (int32)
  - `num_pixel_shader_instructions`: `int` — [Read-Write] Number of instructions used by most expensive pixel shader in the material (int32)
  - `num_pixel_texture_samples`: `int` — [Read-Write] Number of textures sampled by the pixel shader (int32)
  - `num_samplers`: `int` — [Read-Write] Number of samplers required by the material (int32)
  - `num_uv_scalars`: `int` — [Read-Write] Number of interpolator scalars required for UVs (int32)
  - `num_vertex_shader_instructions`: `int` — [Read-Write] Number of instructions used by most expensive vertex shader in the material (int32)
  - `num_vertex_texture_samples`: `int` — [Read-Write] Number of textures sampled by the vertex shader (int32)
  - `num_virtual_texture_samples`: `int` — [Read-Write] Number of virtual textures sampled (int32)

### `unreal.MaterialEditingLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MaterialEditingLibrary.h`

Blueprint library for creating/editing Materials

**Methods** (56):
  - `clear_all_material_instance_parameters(instance)` -> `None` [classmethod] — Clears all material parameters set by this Material Instance
  - `connect_material_expressions(from_expression, from_output_name, to_expression, to_input_name)` -> `bool` [classmethod] — Create connection between two material expressions
  - `connect_material_property(from_expression, from_output_name, property_)` -> `bool` [classmethod] — Connect a material expression output to one of the material property inputs (e.g. diffuse color, opacity etc)
  - `create_material_expression(material, expression_class, node_pos_x = 0, node_pos_y = 0)` -> `MaterialExpression` [classmethod] — Create a new material expression node within the supplied material
  - `create_material_expression_in_function(material_function, expression_class, node_pos_x = 0, node_pos_y = 0)` -> `MaterialExpression` [classmethod] — Create a new material expression node within the supplied material function
  - `delete_all_material_expressions(material)` -> `None` [classmethod] — Delete all material expressions in the supplied material
  - `delete_all_material_expressions_in_function(material_function)` -> `None` [classmethod] — Delete all material expressions in the supplied material function
  - `delete_material_expression(material, expression)` -> `None` [classmethod] — Delete a specific expression from a material. Will disconnect from other expressions.
  - `delete_material_expression_in_function(material_function, expression)` -> `None` [classmethod] — Delete a specific expression from a material function. Will disconnect from other expressions.
  - `duplicate_material_expression(material, material_function, expression)` -> `MaterialExpression` [classmethod] — Duplicates the provided material expression adding it to the same material / material function, and copying parameters. ...
  - `get_child_instances(parent)` -> `Array [ AssetData ]` [classmethod] — Gets all direct child mat instances
  - `get_input_node_output_name_for_material_expression(material_expression, input_node)` -> `str or None` [classmethod] — Get the output name of input node connected to MaterialExpression from an active material editor
  - `get_inputs_for_material_expression(material, material_expression)` -> `Array [ MaterialExpression ]` [classmethod] — Get the set of nodes acting as inputs to a node from an active material editor
  - `get_material_default_scalar_parameter_value(material, parameter_name)` -> `float` [classmethod] — Get the default scalar (float) parameter value from a Material
  - `get_material_default_static_switch_parameter_value(material, parameter_name)` -> `bool` [classmethod] — Get the default static switch parameter value from a Material
  - `get_material_default_texture_parameter_value(material, parameter_name)` -> `Texture` [classmethod] — Get the default texture parameter value from a Material
  - `get_material_default_vector_parameter_value(material, parameter_name)` -> `LinearColor` [classmethod] — Get the default vector parameter value from a Material
  - `get_material_expression_input_names(material_expression)` -> `Array [ str ]` [classmethod] — Get the array of input pin names for a material expression
  - `get_material_expression_input_types(material_expression)` -> `Array [ int32 ]` [classmethod] — Get the array of input pin types for a material expression
  - `get_material_expression_node_position(node_pos_y=int32)` [classmethod] — Get the position of the MaterialExpression node.
  - `get_material_instance_runtime_virtual_texture_parameter_value(instance, parameter_name, association = MaterialParameterAssociation.GLOBAL_PARAMETER)` -> `RuntimeVirtualTexture` [classmethod] — Get the current texture parameter value from a Material Instance
  - `get_material_instance_scalar_parameter_value(instance, parameter_name, association = MaterialParameterAssociation.GLOBAL_PARAMETER)` -> `float` [classmethod] — Get the current scalar (float) parameter value from a Material Instance
  - `get_material_instance_sparse_volume_texture_parameter_value(instance, parameter_name, association = MaterialParameterAssociation.GLOBAL_PARAMETER)` -> `SparseVolumeTexture` [classmethod] — Get the current texture parameter value from a Material Instance
  - `get_material_instance_static_switch_parameter_value(instance, parameter_name, association = MaterialParameterAssociation.GLOBAL_PARAMETER)` -> `bool` [classmethod] — Get the current static switch parameter value from a Material Instance
  - `get_material_instance_texture_parameter_value(instance, parameter_name, association = MaterialParameterAssociation.GLOBAL_PARAMETER)` -> `Texture` [classmethod] — Get the current texture parameter value from a Material Instance
  - `get_material_instance_vector_parameter_value(instance, parameter_name, association = MaterialParameterAssociation.GLOBAL_PARAMETER)` -> `LinearColor` [classmethod] — Get the current vector parameter value from a Material Instance
  - `get_material_property_input_node(material, property_)` -> `MaterialExpression` [classmethod] — Get the node providing the output for a given material property from an active material editor
  - `get_material_property_input_node_output_name(material, property_)` -> `str` [classmethod] — Get the node output name providing the output for a given material property from an active material editor
  - `get_material_selected_nodes(material)` -> `Set [ Object ]` [classmethod] — Get the set of selected nodes from an active material editor
  - `get_nanite_override_material(material)` -> `MaterialInterface` [classmethod] — Returns any nanite override material for the given material
  - `get_num_material_expressions(material)` -> `int32` [classmethod] — Returns number of material expressions in the supplied material
  - `get_num_material_expressions_in_function(material_function)` -> `int32` [classmethod] — Returns number of material expressions in the supplied material
  - `get_scalar_parameter_names(material)` -> `Array [ Name ]` [classmethod] — Gets all scalar parameter names
  - `get_scalar_parameter_source(material, parameter_name)` -> `SoftObjectPath or None` [classmethod] — Returns the path of the asset where the parameter originated, as well as true/false if it was found
  - `get_static_switch_parameter_names(material)` -> `Array [ Name ]` [classmethod] — Gets all static switch parameter names
  - `get_static_switch_parameter_source(material, parameter_name)` -> `SoftObjectPath or None` [classmethod] — Returns the path of the asset where the parameter originated, as well as true/false if it was found
  - `get_statistics(material)` -> `MaterialStatistics` [classmethod] — Returns statistics about the given material
  - `get_texture_parameter_names(material)` -> `Array [ Name ]` [classmethod] — Gets all texture parameter names
  - `get_texture_parameter_source(material, parameter_name)` -> `SoftObjectPath or None` [classmethod] — Returns the path of the asset where the parameter originated, as well as true/false if it was found
  - `get_used_textures(material)` -> `Array [ Texture ]` [classmethod] — Get the list of textures used by a material
  - `get_vector_parameter_names(material)` -> `Array [ Name ]` [classmethod] — Gets all vector parameter names
  - `get_vector_parameter_source(material, parameter_name)` -> `SoftObjectPath or None` [classmethod] — Returns the path of the asset where the parameter originated, as well as true/false if it was found
  - `has_material_usage(material, usage)` -> `bool` [classmethod] — Check if a particular usage is enabled for the supplied material (e.g. SkeletalMesh, ParticleSprite etc)
  - `layout_material_expressions(material)` -> `None` [classmethod] — Layouts the expressions in a grid pattern
  - `layout_material_function_expressions(material_function)` -> `None` [classmethod] — Layouts the expressions in a grid pattern
  - `recompile_material(material)` -> `None` [classmethod] — Trigger a recompile of a material. Must be performed after making changes to the graph to have changes reflected.
  - `set_material_instance_parent(instance, new_parent)` -> `None` [classmethod] — Set the parent Material or Material Instance to use for this Material Instance
  - `set_material_instance_runtime_virtual_texture_parameter_value(instance, parameter_name, value, association = MaterialParameterAssociation.GLOBAL_PARAMETER)` -> `bool` [classmethod] — Set the texture parameter value for a Material Instance
  - `set_material_instance_scalar_parameter_value(instance, parameter_name, value, association = MaterialParameterAssociation.GLOBAL_PARAMETER)` -> `bool` [classmethod] — Set the scalar (float) parameter value for a Material Instance
  - `set_material_instance_sparse_volume_texture_parameter_value(instance, parameter_name, value, association = MaterialParameterAssociation.GLOBAL_PARAMETER)` -> `bool` [classmethod] — Set the texture parameter value for a Material Instance
  - `set_material_instance_static_switch_parameter_value(instance, parameter_name, value, association = MaterialParameterAssociation.GLOBAL_PARAMETER, update_material_instance = True)` -> `bool` [classmethod] — Set the static switch parameter value for a Material Instance
  - `set_material_instance_texture_parameter_value(instance, parameter_name, value, association = MaterialParameterAssociation.GLOBAL_PARAMETER)` -> `bool` [classmethod] — Set the texture parameter value for a Material Instance
  - `set_material_instance_vector_parameter_value(instance, parameter_name, value, association = MaterialParameterAssociation.GLOBAL_PARAMETER)` -> `bool` [classmethod] — Set the vector parameter value for a Material Instance
  - `set_material_usage(material, usage)` -> `bool or None` [classmethod] — Enable a particular usage for the supplied material (e.g. SkeletalMesh, ParticleSprite etc)
  - `update_material_function(material_function, preview_material = None)` -> `None` [classmethod] — Update a Material Function after edits have been made. Will recompile any Materials that use the supplied Material Funct...
  - `update_material_instance(instance)` -> `None` [classmethod] — Called after making modifications to a Material Instance to recompile shaders etc.
