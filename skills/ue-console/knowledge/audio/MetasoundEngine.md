# UE Python API — MetasoundEngine Module

**24 types** from the `MetasoundEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaSoundAssetDirectory`, `MetaSoundBuilderNodeInputHandle`, `MetaSoundBuilderNodeOutputHandle`, `MetaSoundBuilderOptions`, `MetaSoundNodeHandle`, `MetaSoundOutput`, `MetaSoundAssetSubsystem`, `MetaSoundBuilderBase`, `MetaSoundBuilderSubsystem`, `MetaSoundCacheSubsystem`, `MetasoundEditorGraphBase`, `MetasoundFrontendLiteralBlueprintAccess`, `MetasoundGeneratorHandle`, `MetasoundOutputBlueprintAccess`, `MetaSoundOutputSubsystem`, `MetaSoundPatch`, `MetaSoundPatchBuilder`, `MetaSoundSource`, `MetaSoundSourceBuilder`, `MetaSoundBuilderResult`, ... (24 total)

---

## Classes

### `unreal.MetaSoundAssetDirectory`
Inherits: `StructBase` | Header: `MetasoundAssetSubsystem.h`

namespace Metasound::Engine

**Properties** (1):
  - `directory`: `DirectoryPath` — [Read-Write] (DirectoryPath)

### `unreal.MetaSoundBuilderNodeInputHandle`
Inherits: `MetasoundFrontendVertexHandle` | Header: `MetasoundBuilderBase.h`

namespace Metasound::Engine

### `unreal.MetaSoundBuilderNodeOutputHandle`
Inherits: `MetasoundFrontendVertexHandle` | Header: `MetasoundBuilderBase.h`

Meta Sound Builder Node Output Handle

### `unreal.MetaSoundBuilderOptions`
Inherits: `StructBase` | Header: `MetasoundBuilderBase.h`

Meta Sound Builder Options

**Properties** (2):
  - `force_unique_class_name`: `bool` — [Read-Write] If the resulting MetaSound is building over an existing document, a unique class name w...
  - `name`: `Name` — [Read-Write] Name of generated object. If object already exists, used as the base name to ensure new...

### `unreal.MetaSoundNodeHandle`
Inherits: `StructBase` | Header: `MetasoundBuilderBase.h`

Meta Sound Node Handle

### `unreal.MetaSoundOutput`
Inherits: `SoundGeneratorOutput` | Header: `MetasoundOutput.h`

Exposes the value of an output on a FMetasoundGenerator.

### `unreal.MetaSoundAssetSubsystem`
Inherits: `EngineSubsystem` | Header: `MetasoundAssetSubsystem.h`

Meta Sound Asset Subsystem

**Methods** (5):
  - `find_asset_class_info(path, force_load = True)` -> `(out_doc_info=MetaSoundDocumentInfo, out_interface_info=MetaSoundClassInterfaceInfo) or None` — Returns asset class info for the given MetaSound asset. Will attempt to get info without loading the asset if its tag da...
  - `reassign_class_name(doc_interface)` -> `bool` — Reassign Class Name
  - `register_asset_classes_in_directories(directories)` -> `None` — Register Asset Classes in Directories
  - `replace_references_in_directory(directories, old_class_name, new_class_name, old_version = [1,0], new_version = [1,0])` -> `bool` — Replaces dependencies in a MetaSound with the given class name and version with another MetaSound with the given class n...
  - `unregister_asset_classes_in_directories(directories)` -> `None` — Unregister Asset Classes in Directories

### `unreal.MetaSoundBuilderBase`
Inherits: `Object` | Header: `MetasoundBuilderBase.h`

Base implementation of MetaSound builder

**Methods** (72):
  - `add_graph_input_node(name, data_type, default_value, out_result=MetaSoundBuilderResult)` — Adds a graph input node with the given name, DataType, and sets the graph input to default value. Returns the new input ...
  - `add_graph_output_node(name, data_type, default_value, out_result=MetaSoundBuilderResult)` — Adds a graph output node with the given name, DataType, and sets output nodeâs input to default value. Returns the new...
  - `add_graph_variable(name, data_type, default_value)` -> `MetaSoundBuilderResult` — Adds a graph variable node with the given name, DataType, and sets to default value.
  - `add_graph_variable_get_delayed_node(out_result=MetaSoundBuilderResult)` — Adds a graph variable node with the given name, DataType, and sets to default value.
  - `add_graph_variable_get_node(out_result=MetaSoundBuilderResult)` — Adds a graph variable node with the given name, DataType, and sets to default value.
  - `add_graph_variable_set_node(out_result=MetaSoundBuilderResult)` — Adds a graph variable node with the given name, DataType, and sets to default value.
  - `add_interface(interface_name)` -> `MetaSoundBuilderResult` — Adds an interface registered with the given name to the graph, adding associated input and output nodes.
  - `add_node(out_result=MetaSoundBuilderResult)` — Adds a node to the graph using the provided MetaSound asset as its defining NodeClass. Returns a node handle to the crea...
  - `add_node_by_class_name(class_name, out_result=MetaSoundBuilderResult)` — Adds node referencing the highest native class version of the given class name to the document. Returns a node handle to...
  - `build(parent, options)` -> `MetaSoundDocumentInterface` — Build
  - `build_and_overwrite_meta_sound(existing_meta_sound, force_unique_class_name = False)` -> `None` — Copies a transient MetaSound with the provided builder options, copying the underlying MetaSound managed by this builder...
  - `build_new_meta_sound(name_base)` -> `MetaSoundDocumentInterface` — Builds a transient MetaSound with the provided builder options, copying the underlying MetaSound managed by this builder...
  - `connect_node_input_to_graph_input(graph_input_name, node_input_handle)` -> `MetaSoundBuilderResult` — Connects a given node input to the graph input with the given name.
  - `connect_node_inputs_to_matching_graph_interface_inputs()` — Connects a given nodeâs inputs to all graph inputs for shared interfaces implemented on both the nodeâs referenced c...
  - `connect_node_output_to_graph_output(graph_output_name, node_output_handle)` -> `MetaSoundBuilderResult` — Connects a given node output to the graph output with the given name.
  - `connect_node_outputs_to_matching_graph_interface_outputs()` — Connects a given nodeâs outputs to all graph outputs for shared interfaces implemented on both the nodeâs referenced...
  - `connect_nodes(node_output_handle, node_input_handle)` -> `MetaSoundBuilderResult` — Connects node output to a node input. Does NOT provide loop detection for performance reasons. Loop detection is checked...
  - `connect_nodes_by_interface_bindings(from_node_handle, to_node_handle)` -> `MetaSoundBuilderResult` — Connects two nodes using defined MetaSound Interface Bindings registered with the MetaSound Interface registry.
  - `contains_node(node)` -> `bool` — Returns whether node exists.
  - `contains_node_input(input)` -> `bool` — Returns whether node input exists.
  - `contains_node_output(output)` -> `bool` — Returns whether node output exists.
  - `convert_from_preset()` -> `MetaSoundBuilderResult` — Converts this preset to a fully accessible MetaSound; sets result to succeeded if it was converted successfully and fail...
  - `convert_to_preset(referenced_node_class)` -> `MetaSoundBuilderResult` — Convert this builder to a MetaSound source preset with the given referenced source builder
  - `disconnect_node_input(node_input_handle)` -> `MetaSoundBuilderResult` — Removes connection to a given node input. Returns success if connection was removed, failed if not.
  - `disconnect_node_output(node_output_handle)` -> `MetaSoundBuilderResult` — Removes all connections from a given node output. Returns success if all connections were removed, failed if not.
  - `disconnect_nodes(node_output_handle, node_input_handle)` -> `MetaSoundBuilderResult` — Disconnects node output to a node input. Returns success if connection was removed, failed if not.
  - `disconnect_nodes_by_interface_bindings(from_node_handle, to_node_handle)` -> `MetaSoundBuilderResult` — Disconnects two nodes using defined MetaSound Interface Bindings registered with the MetaSound Interface registry. Retur...
  - `find_graph_input_node(out_data_type=Name, node_output_handle=MetaSoundBuilderNodeOutputHandle, out_result=MetaSoundBuilderResult)` — Returns graph input node by the given name if it exists, or an invalid handle if not found.
  - `find_graph_output_node(out_data_type=Name, node_input_handle=MetaSoundBuilderNodeInputHandle, out_result=MetaSoundBuilderResult)` — Returns graph output node by the given name if it exists, or an invalid handle if not found.
  - `find_interface_input_nodes()` — Returns input nodes associated with a given interface.
  - `find_interface_output_nodes()` — Returns output nodes associated with a given interface.
  - `find_node_class_version(out_result=MetaSoundBuilderResult)` — Returns outputâs parent node if the input is valid, otherwise returns invalid node handle.
  - `find_node_input_by_name(node_handle, out_result=MetaSoundBuilderResult)` — Returns node input by the given name if it exists, or an invalid handle if not found.
  - `find_node_input_parent(out_result=MetaSoundBuilderResult)` — Returns inputâs parent node if the input is valid, otherwise returns invalid node handle.
  - `find_node_inputs()` — Returns all node inputs.
  - `find_node_inputs_by_data_type()` — Returns node inputs by the given DataType (ex. âAudioâ, âTriggerâ, âStringâ, âBoolâ, âFloatâ, âInt...
  - `find_node_output_by_name(node_handle, out_result=MetaSoundBuilderResult)` — Returns node output by the given name.
  - `find_node_output_parent(out_result=MetaSoundBuilderResult)` — Returns outputâs parent node if the input is valid, otherwise returns invalid node handle.
  - `find_node_outputs()` — Returns all node outputs.
  - `find_node_outputs_by_data_type()` — Returns node outputs by the given DataType (ex. âAudioâ, âTriggerâ, âStringâ, âBoolâ, âFloatâ, âIn...
  - `get_graph_input_default(out_result=MetaSoundBuilderResult)` — Gets the graph inputâs default literal value.
  - `get_graph_input_names()` — Gets names of all graph inputs.
  - `get_graph_output_names()` — Gets names of all graph outputs.
  - `get_graph_variable_default(out_result=MetaSoundBuilderResult)` — Gets the graph variableâs default literal value.
  - `get_node_input_class_default(out_result=MetaSoundBuilderResult)` — Returns node inputâs class literal value if set, otherwise fails and returns default literal.
  - `get_node_input_data(data_type=Name, out_result=MetaSoundBuilderResult)` — Returns node inputâs data if valid (including things like name and datatype).
  - `get_node_input_default(out_result=MetaSoundBuilderResult)` — Returns node inputâs literal value if set on graph, otherwise fails and returns default literal.
  - `get_node_input_is_constructor_pin(input_handle)` -> `bool` — Returns whether the given node input is a constructor pin
  - `get_node_output_data(data_type=Name, out_result=MetaSoundBuilderResult)` — Returns node outputâs data if valid (including things like name and datatype).
  - `get_node_output_is_constructor_pin(output_handle)` -> `bool` — Returns whether the given node output is a constructor pin
  - `get_referenced_preset_asset()` -> `Object` — Return the asset referenced by this preset builder. Returns nullptr if the builder is not a preset.
  - `get_root_graph_class_name()` -> `MetasoundFrontendClassName` — Returns the MetaSound assetâs graph class name (used by the MetaSound Node Class Registry)
  - `interface_is_declared(interface_name)` -> `bool` — Returns if a given interface is declared.
  - `is_preset()` -> `bool` — Returns whether this is a preset.
  - `node_input_is_connected(input_handle)` -> `bool` — Returns if a given node input has connections.
  - `node_output_is_connected(output_handle)` -> `bool` — Returns if a given node output is connected.
  - `nodes_are_connected(output_handle, input_handle)` -> `bool` — Returns if a given node output and node input are connected.
  - `remove_graph_input(name)` -> `MetaSoundBuilderResult` — Removes input from all paged graphs if it exists; sets result to succeeded if it was removed and failed if it was not.
  - `remove_graph_output(name)` -> `MetaSoundBuilderResult` — Removes output from all paged graphs if it exists; sets result to succeeded if it was removed and failed if it was not.
  - `remove_graph_variable(name)` -> `MetaSoundBuilderResult` — Removes graph variable from the current build graph if it exists; sets result to succeeded if it was removed and failed ...
  - `remove_interface(interface_name)` -> `MetaSoundBuilderResult` — Removes the interface with the given name from the builderâs MetaSound. Removes any graph inputs and outputs associate...
  - `remove_node(node_handle, remove_unused_dependencies = True)` -> `MetaSoundBuilderResult` — Removes node and any associated connections from the current build graph. (Advanced) Optionally, remove unused dependenc...
  - `remove_node_input_default(input_handle)` -> `MetaSoundBuilderResult` — Removes node input literal default if set, reverting the value to be whatever the node class defaults the value to. Retu...
  - `remove_unused_dependencies()` -> `None` — Removes dependencies in document that are no longer referenced by nodes
  - `set_graph_input_access_type(input_name, access_type)` -> `MetaSoundBuilderResult` — Disconnects the given graph inputâs respective template nodes and sets the graph inputâs AccessType should it not ma...
  - `set_graph_input_data_type(input_name, data_type)` -> `MetaSoundBuilderResult` — Disconnects the given graph inputâs respective template nodes and sets the graph inputâs DataType should it not matc...
  - `set_graph_input_default(input_name, literal)` -> `MetaSoundBuilderResult` — Sets the input nodeâs default value, overriding the default provided by the referenced graph if the graph is a preset.
  - `set_graph_input_name(input_name, new_name)` -> `MetaSoundBuilderResult` — Sets the given graph inputâs name to the new name. Result succeeds if the name was successfully changed or the new nam...
  - `set_graph_output_access_type(output_name, access_type)` -> `MetaSoundBuilderResult` — Disconnects the given graph outputâs respective template nodes and sets the graph outputâs AccessType should it not ...
  - `set_graph_output_data_type(output_name, data_type)` -> `MetaSoundBuilderResult` — Disconnects the given graph outputâs respective template nodes and sets the graph outputâs DataType should it not ma...
  - `set_graph_output_name(output_name, new_name)` -> `MetaSoundBuilderResult` — Sets the given graph outputâs name to the new name. Result succeeds if the name was successfully changed or the new na...
  - `set_node_input_default(node_input_handle, literal)` -> `MetaSoundBuilderResult` — Sets the nodeâs input default value (used if no connection to the given node input is present)

**Properties** (2):
  - `class_name`: `MetasoundFrontendClassName` — [Read-Write]
deprecated: 5.5 - No longer used. ClassName should be queried from associated FrontendB...
  - `is_attached`: `bool` — [Read-Write]
deprecated: 5.4 - All source builders now operate on an underlying document source docu...

### `unreal.MetaSoundBuilderSubsystem`
Inherits: `EngineSubsystem` | Header: `MetasoundBuilderSubsystem.h`

The subsystem in charge of tracking MetaSound builders

**Methods** (27):
  - `create_bool_array_meta_sound_literal(data_type=Name)` — Create Bool Array Meta Sound Literal
  - `create_bool_meta_sound_literal(data_type=Name)` — Create Bool Meta Sound Literal
  - `create_float_array_meta_sound_literal(data_type=Name)` — Create Float Array Meta Sound Literal
  - `create_float_meta_sound_literal(data_type=Name)` — Create Float Meta Sound Literal
  - `create_int_array_meta_sound_literal(data_type=Name)` — Create Int Array Meta Sound Literal
  - `create_int_meta_sound_literal(data_type=Name)` — Create Int Meta Sound Literal
  - `create_meta_sound_literal_from_param(param)` -> `MetasoundFrontendLiteral` — Create Meta Sound Literal from Param
  - `create_object_array_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` — Create Object Array Meta Sound Literal
  - `create_object_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` — Create Object Meta Sound Literal
  - `create_patch_builder(out_result=MetaSoundBuilderResult)` — Create Patch Builder
  - `create_patch_preset_builder(builder_name, out_result=MetaSoundBuilderResult)` — Creates a builder that acts on a generated, transient preset MetaSound UObject. Fails if Referenced MetaSound is not a U...
  - `create_source_builder()` — Create Source Builder
  - `create_source_preset_builder(builder_name, out_result=MetaSoundBuilderResult)` — Creates a builder that acts on a generated, transient preset MetaSound UObject. Fails if Referenced MetaSound is not a U...
  - `create_string_array_meta_sound_literal(data_type=Name)` — Create String Array Meta Sound Literal
  - `create_string_meta_sound_literal(data_type=Name)` — Create String Meta Sound Literal
  - `find_builder(builder_name)` -> `MetaSoundBuilderBase` — Returns the builder manually registered with the MetaSound Builder Subsystem with the provided custom name (if previousl...
  - `find_builder_of_document(meta_sound)` -> `MetaSoundBuilderBase` — Returns the builder associated with the given MetaSound (if one exists, transient or asset).
  - `find_patch_builder(builder_name)` -> `MetaSoundPatchBuilder` — Returns the patch builder manually registered with the MetaSound Builder Subsystem with the provided custom name (if pre...
  - `find_source_builder(builder_name)` -> `MetaSoundSourceBuilder` — Returns the source builder manually registered with the MetaSound Builder Subsystem with the provided custom name (if pr...
  - `is_interface_registered(interface_name)` -> `bool` — Is Interface Registered
  - `register_builder(builder_name, builder)` -> `None` — Adds builder to subsystemâs registry to make it persistent and easily accessible by multiple systems or Blueprints
  - `register_patch_builder(builder_name, builder)` -> `None` — Adds builder to subsystemâs registry to make it persistent and easily accessible by multiple systems or Blueprints
  - `register_source_builder(builder_name, builder)` -> `None` — Adds builder to subsystemâs registry to make it persistent and easily accessible by multiple systems or Blueprints
  - `set_target_page(page_name)` -> `bool` — Sets the targeted page for all MetaSound graph & input default to resolve against. If target page is not implemented (or...
  - `unregister_builder(builder_name)` -> `bool` — Unregister Builder
  - `unregister_patch_builder(builder_name)` -> `bool` — Unregister Patch Builder
  - `unregister_source_builder(builder_name)` -> `bool` — Unregister Source Builder

### `unreal.MetaSoundCacheSubsystem`
Inherits: `AudioEngineSubsystem` | Header: `MetasoundOperatorCacheSubsystem.h`

UMetaSoundCacheSubsystem

**Methods** (3):
  - `precache_meta_sound(meta_sound, num_instances = 1)` -> `None`
  - `remove_cached_operators_for_meta_sound(meta_sound)` -> `None` — Clear the operator pool of any operators associated with the given MetaSound
  - `touch_or_precache_meta_sound(meta_sound, num_instances = 1)` -> `None`

### `unreal.MetasoundEditorGraphBase`
Inherits: `EdGraph` | Header: `Metasound.h`

namespace Metasound::Engine

### `unreal.MetasoundFrontendLiteralBlueprintAccess`
Inherits: `BlueprintFunctionLibrary` | Header: `MetasoundFrontendLiteralBlueprintAccess.h`

Blueprint support for FMetasoundFrontendLiteral

**Methods** (23):
  - `conv_meta_sound_literal_to_string(literal)` -> `str` [classmethod] — Conv Meta Sound Literal to String
  - `create_bool_array_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` [classmethod] — Create Bool Array Meta Sound Literal
  - `create_bool_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` [classmethod] — Literal creation
  - `create_float_array_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` [classmethod] — Create Float Array Meta Sound Literal
  - `create_float_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` [classmethod] — Create Float Meta Sound Literal
  - `create_int_array_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` [classmethod] — Create Int Array Meta Sound Literal
  - `create_int_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` [classmethod] — Create Int Meta Sound Literal
  - `create_meta_sound_literal_from_param(param)` -> `MetasoundFrontendLiteral` [classmethod] — Create Meta Sound Literal from Param
  - `create_object_array_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` [classmethod] — Create Object Array Meta Sound Literal
  - `create_object_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` [classmethod] — Create Object Meta Sound Literal
  - `create_string_array_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` [classmethod] — Create String Array Meta Sound Literal
  - `create_string_meta_sound_literal(value)` -> `MetasoundFrontendLiteral` [classmethod] — Create String Meta Sound Literal
  - `get_bool_array_value_from_literal()` [classmethod] — Get Bool Array Value from Literal
  - `get_bool_value_from_literal(literal)` -> `MetaSoundBuilderResult or None` [classmethod] — Value accessors
  - `get_float_array_value_from_literal()` [classmethod] — Get Float Array Value from Literal
  - `get_float_value_from_literal(out_result=MetaSoundBuilderResult)` [classmethod] — Get Float Value from Literal
  - `get_int_array_value_from_literal()` [classmethod] — Get Int Array Value from Literal
  - `get_int_value_from_literal(out_result=MetaSoundBuilderResult)` [classmethod] — Get Int Value from Literal
  - `get_object_array_value_from_literal()` [classmethod] — Get Object Array Value from Literal
  - `get_object_value_from_literal(out_result=MetaSoundBuilderResult)` [classmethod] — Get Object Value from Literal
  - `get_string_array_value_from_literal()` [classmethod] — Get String Array Value from Literal
  - `get_string_value_from_literal(out_result=MetaSoundBuilderResult)` [classmethod] — Get String Value from Literal
  - `get_type(literal)` -> `MetasoundFrontendLiteralType` [classmethod] — Get Type

### `unreal.MetasoundGeneratorHandle`
Inherits: `Object` | Header: `MetasoundGeneratorHandle.h`

Blueprint-facing interface to a FMetasoundGenerator on a UAudioComponent.

**Methods** (6):
  - `apply_parameter_pack(pack)` -> `bool` — Makes a copy of the supplied parameter pack and passes it to the MetaSoundGenerator for asynchronous processing. IT ALSO...
  - `create_meta_sound_generator_handle(on_component)` -> `MetasoundGeneratorHandle` [classmethod] — Create Meta Sound Generator Handle
  - `enable_runtime_render_timing(enable)` -> `None` — Enable the profiling of the MetaSound render for this playing instance. You must call this before calling âGetRuntimeC...
  - `get_cpu_core_utilization()` -> `double` — Get the CPU usage as âfraction of real timeâ used to render this metasound. NOTE: The MetasoundSource asset MUST hav...
  - `update_watchers()` -> `None` — Update Watchers
  - `watch_output(output_name, on_output_value_changed, analyzer_name = 'None', analyzer_output_name = 'None')` -> `bool` — Watch an output value.

### `unreal.MetasoundOutputBlueprintAccess`
Inherits: `BlueprintFunctionLibrary` | Header: `MetasoundOutput.h`

Blueprint support for core types. If you want to support more core types, add them here. If you want to support types introduced in other plugins, create a blueprint library in that plugin.

**Methods** (10):
  - `get_bool(output)` -> `bool or None` [classmethod] — Get Bool
  - `get_float(success=bool)` [classmethod] — Get Float
  - `get_int32(success=bool)` [classmethod] — Get Int 32
  - `get_string(success=bool)` [classmethod] — Get String
  - `get_time_seconds(success=bool)` [classmethod] — Get Time Seconds
  - `is_bool(output)` -> `bool` [classmethod] — Is Bool
  - `is_float(output)` -> `bool` [classmethod] — Is Float
  - `is_int32(output)` -> `bool` [classmethod] — Is Int 32
  - `is_string(output)` -> `bool` [classmethod] — Is String
  - `is_time(output)` -> `bool` [classmethod] — Is Time

### `unreal.MetaSoundOutputSubsystem`
Inherits: `WorldSubsystem` | Header: `MetasoundOutputSubsystem.h`

Provides access to a playing Metasound generatorâs outputs

**Methods** (2):
  - `unwatch_output(audio_component, output_name, on_output_value_changed, analyzer_name = 'None', analyzer_output_name = 'None')` -> `bool` — Unwatch Output
  - `watch_output(audio_component, output_name, on_output_value_changed, analyzer_name = 'None', analyzer_output_name = 'None')` -> `bool` — Watch an output on a Metasound playing on a given audio component.

### `unreal.MetaSoundPatch`
Inherits: `Object` | Header: `Metasound.h`

This asset type is used for Metasound assets that can only be used as nodes in other Metasound graphs. Because of this, they contain no required inputs or outputs.

**Properties** (7):
  - `asset_class_id`: `Guid` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (Guid)
  - `graph`: `MetasoundEditorGraphBase` — [Read-Write]
deprecated: Use EditorGraph instead as it is now transient and generated via the Fronte...
  - `is_preset`: `bool` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (bool)
  - `registry_input_types`: `str` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (str)
  - `registry_output_types`: `str` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (str)
  - `registry_version_major`: `int` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (int32)
  - `registry_version_minor`: `int` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (int32)

### `unreal.MetaSoundPatchBuilder`
Inherits: `MetaSoundBuilderBase` | Header: `MetasoundBuilderSubsystem.h`

Builder in charge of building a MetaSound Patch

### `unreal.MetaSoundSource`
Inherits: `SoundWaveProcedural` | Header: `MetasoundSource.h`

This Metasound type can be played as an audio source.

**Properties** (11):
  - `asset_class_id`: `Guid` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (Guid)
  - `block_rate_override`: `PerPlatformFloat` [Read-Only] — A Zero value will have no effect and use either the Quality setting (if set), or the defaults. (PerP...
  - `graph`: `MetasoundEditorGraphBase` — [Read-Write]
deprecated: Use EditorGraph instead as it is now transient and generated via the Fronte...
  - `is_preset`: `bool` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (bool)
  - `output_format`: `MetaSoundOutputAudioFormat` [Read-Only] — [Read-Only] The output audio format of the metasound source. (MetaSoundOutputAudioFormat)
  - `quality_setting`: `Name` — [Read-Write] The QualitySetting MetaSound will use, as defined in âMetaSoundâ Settings. (Name)
  - `registry_input_types`: `str` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (str)
  - `registry_output_types`: `str` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (str)
  - `registry_version_major`: `int` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (int32)
  - `registry_version_minor`: `int` — [Read-Write]
deprecated: Property is now serialized directly as asset tag (int32)
  - `sample_rate_override`: `PerPlatformInt` [Read-Only] — A Zero value will have no effect and use either the Quality setting (if set), or the Device Rate (Pe...

### `unreal.MetaSoundSourceBuilder`
Inherits: `MetaSoundBuilderBase` | Header: `MetasoundBuilderSubsystem.h`

Builder in charge of building a MetaSound Source

**Methods** (6):
  - `audition(parent, audio_component, on_create_generator, live_updates_enabled = False)` -> `None` — Audition
  - `get_live_updates_enabled()` -> `bool` — Returns whether or not live updates are both globally enabled (via cvar) and are enabled on this builderâs last built ...
  - `set_block_rate_override(block_rate)` -> `None` — Sets the MetaSoundâs BlockRate override
  - `set_format(output_format)` -> `MetaSoundBuilderResult` — Sets the output audio format of the source
  - `set_quality(quality)` -> `None` — Sets the MetaSoundâs Quality level
  - `set_sample_rate_override(sample_rate)` -> `None` — Sets the MetaSoundâs SampleRate override

### `unreal.MetaSoundBuilderResult`
Inherits: `EnumBase` | Header: `MetasoundBuilderBase.h`

EMeta Sound Builder Result

**Properties** (2):
  - `FAILED`: `MetaSoundBuilderResult = Ellipsis` — 1
  - `SUCCEEDED`: `MetaSoundBuilderResult = Ellipsis` — 0

### `unreal.MetaSoundOutputAudioFormat`
Inherits: `EnumBase` | Header: `MetasoundOutputFormatInterfaces.h`

Declares supported MetaSound output audio formats

**Properties** (5):
  - `FIVE_DOT_ONE`: `MetaSoundOutputAudioFormat = Ellipsis` — 3
  - `MONO`: `MetaSoundOutputAudioFormat = Ellipsis` — 0
  - `QUAD`: `MetaSoundOutputAudioFormat = Ellipsis` — 2
  - `SEVEN_DOT_ONE`: `MetaSoundOutputAudioFormat = Ellipsis` — 4
  - `STEREO`: `MetaSoundOutputAudioFormat = Ellipsis` — 1

### `unreal.OnCreateAuditionGeneratorHandleDelegate`
Inherits: `DelegateBase` | Header: `MetasoundBuilderSubsystem.h`

namespace Metasound::Engine

### `unreal.OnMetasoundOutputValueChanged`
Inherits: `DelegateBase` | Header: `MetasoundGeneratorHandle.h`

On Metasound Output Value Changed Delegate Signature

### `unreal.OnMetasoundOutputValueChangedMulticast`
Inherits: `MulticastDelegateBase` | Header: `MetasoundGeneratorHandle.h`

On Metasound Output Value Changed Multicast Delegate Signature
