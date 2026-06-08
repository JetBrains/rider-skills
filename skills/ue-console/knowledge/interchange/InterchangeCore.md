# UE Python API — InterchangeCore Module

**21 types** from the `InterchangeCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `InterchangePipelinePropertyStatePerContext`, `InterchangePipelinePropertyStates`, `InterchangeUserDefinedAttributeInfo`, `InterchangeBaseNode`, `InterchangeBaseNodeContainer`, `InterchangeFactoryBase`, `InterchangeFactoryBaseNode`, `InterchangePipelineBase`, `InterchangeSourceData`, `InterchangeSourceNode`, `InterchangeTranslatorBase`, `InterchangeTranslatorSettings`, `InterchangeUserDefinedAttributesAPI`, `InterchangeWriterBase`, `InterchangeFactoryAssetType`, `InterchangeNodeContainerType`, `InterchangeNodeUserInterfaceContext`, `InterchangePipelineTask`, `InterchangeTranslatorAssetType`, `InterchangeTranslatorType`, ... (21 total)

---

## Classes

### `unreal.InterchangePipelinePropertyStatePerContext`
Inherits: `StructBase` | Header: `InterchangePipelineBase.h`

Interchange Pipeline Property State Per Context

**Properties** (1):
  - `visible`: `bool` — [Read-Write] If true, the property is visible. (bool)

### `unreal.InterchangePipelinePropertyStates`
Inherits: `StructBase` | Header: `InterchangePipelineBase.h`

Interchange Pipeline Property States

**Properties** (5):
  - `basic_layout_states`: `InterchangePipelinePropertyStatePerContext` — [Read-Write] The property states for the import context. (InterchangePipelinePropertyStatePerContext...
  - `import_states`: `InterchangePipelinePropertyStatePerContext` — [Read-Write] The property states for the import context (InterchangePipelinePropertyStatePerContext)
  - `locked`: `bool` — [Read-Write] If true, the property is locked. (bool)
  - `pre_dialog_reset`: `bool` — [Read-Write] If true, the property will be reset to default when loading the import dialog. (bool)
  - `reimport_states`: `InterchangePipelinePropertyStatePerContext` — [Read-Write] The property states for the reimport context. (InterchangePipelinePropertyStatePerConte...

### `unreal.InterchangeUserDefinedAttributeInfo`
Inherits: `StructBase` | Header: `InterchangeUserDefinedAttribute.h`

Interchange User Defined Attribute Info

**Properties** (1):
  - `name`: `str` — [Read-Write] (str)

### `unreal.InterchangeBaseNode`
Inherits: `Object` | Header: `InterchangeBaseNode.h`

This struct is used to store and retrieve key-value attributes. The attributes are stored in a generic FAttributeStorage that serializes the values in a TArray64<uint8>. See UE::Interchange::EAttribut...

**Methods** (35):
  - `add_boolean_attribute(node_attribute_key, value)` -> `bool` — Add a Boolean attribute to this node. Returns false if the attribute does not exist or if it cannot be added.
  - `add_double_attribute(node_attribute_key, value)` -> `bool` — Add a double attribute to this node. Returns false if the attribute does not exist or if it cannot be added.
  - `add_float_attribute(node_attribute_key, value)` -> `bool` — Add a float attribute to this node. Returns false if the attribute does not exist or if it cannot be added.
  - `add_guid_attribute(node_attribute_key, value)` -> `bool` — Add a GUID attribute to this node. Returns false if the attribute does not exist or if it cannot be added.
  - `add_int32_attribute(node_attribute_key, value)` -> `bool` — Add a int32 attribute to this node. Returns false if the attribute does not exist or if it cannot be added.
  - `add_linear_color_attribute(node_attribute_key, value)` -> `bool` — Add an FLinearColor attribute to this node. Returns false if the attribute does not exist or if it cannot be added.
  - `add_string_attribute(node_attribute_key, value)` -> `bool` — Add a string attribute to this node. Returns false if the attribute does not exist or if it cannot be added.
  - `add_target_node_uid(asset_uid)` -> `bool` — Add an asset node UID relating to this object.
  - `add_vector2_attribute(node_attribute_key, value)` -> `bool` — Add a Vector2 attribute to this node. Returns false if the attribute does not exist or if it cannot be added.
  - `get_asset_name()` -> `str` — Optional. Any node that can import or export an asset should set the desired name for the asset. If the attribute was ne...
  - `get_boolean_attribute(node_attribute_key)` -> `bool or None` — Get a Boolean attribute from this node. Returns false if the attribute does not exist.
  - `get_desired_child_index()` -> `int32` — Return the desired child index. If the attribute do not exist it will return INDEX_NONE. The interchange node container ...
  - `get_display_label()` -> `str` — Return the display label.
  - `get_double_attribute(node_attribute_key)` -> `double or None` — Get a double attribute from this node. Returns false if the attribute does not exist.
  - `get_float_attribute(node_attribute_key)` -> `float or None` — Get a float attribute from this node. Returns false if the attribute does not exist.
  - `get_guid_attribute(node_attribute_key)` -> `Guid or None` — Get a GUID attribute from this node. Returns false if the attribute does not exist.
  - `get_icon_name()` -> `Name` — Icon name, used to retrieve the brush when we display the node in any UI.
  - `get_int32_attribute(node_attribute_key)` -> `int32 or None` — Get a int32 attribute from this node. Returns false if the attribute does not exist.
  - `get_linear_color_attribute(node_attribute_key)` -> `LinearColor or None` — Get an FLinearColor attribute from this node. Returns false if the attribute does not exist.
  - `get_namespace()` -> `str or None` — Namespace is a prefix added when calling GetUniqueId(). If the attribute exist it will fill Namespace and return true. I...
  - `get_node_container_type()` -> `InterchangeNodeContainerType` — Return the node container type that defines the purpose of the node (factory node, translated scene node, or translated ...
  - `get_parent_uid()` -> `str` — Return the parent unique ID. If the attribute does not exist, returns InvalidNodeUid(). Use UInterchangeBaseNodeContaine...
  - `get_string_attribute(node_attribute_key)` -> `str or None` — Get a string attribute from this node. Returns false if the attribute does not exist.
  - `get_target_node_count()` -> `int32` — Get the number of target assets relating to this object.
  - `get_target_node_uids()` -> `Array [ str ]` — Get the target assets relating to this object.
  - `get_type_name()` -> `str` — Return the node type name of the class. This is used when reporting errors.
  - `get_unique_id()` -> `str` — Return the unique ID passed in the constructor.
  - `get_vector2_attribute(node_attribute_key)` -> `Vector2f or None` — Get a Vector2 attribute from this node. Returns false if the attribute does not exist.
  - `initialize_node(unique_id, display_label, node_container_type)` -> `None` — Initialize the base data of the node.
  - `is_enabled()` -> `bool` — If true, the node is imported or exported. If false, it is discarded. Returns false if the node was disabled. Returns tr...
  - `remove_attribute(node_attribute_key)` -> `bool` — Remove the specified attribute from this node. Returns false if it could not be removed. If the attribute does not exist...
  - `remove_target_node_uid(asset_uid)` -> `bool` — Remove an asset node UID relating to this object.
  - `set_asset_name(asset_name)` -> `bool` — Set the name for the imported asset this node represents. The asset factory will call GetAssetName().
  - `set_display_label(display_name)` -> `bool` — Change the display label.
  - `set_enabled(is_enabled)` -> `bool` — Determine whether this node should be part of the import or export process.

### `unreal.InterchangeBaseNodeContainer`
Inherits: `Object` | Header: `InterchangeBaseNodeContainer.h`

The Interchange UInterchangeBaseNode graph is a format used to feed factories and writers when they import, reimport, and export an asset or scene.

**Methods** (20):
  - `add_node(node)` -> `str` — Add a node to the container. The node is added into a TMap. return:: return the node unique ID of the added item. If the...
  - `clear_node_parent_uid(node_unique_id)` -> `bool` — Remove the nodeâs ParentUid, making it into a top-level node
  - `compute_children_cache()` -> `None` — Fill the cache of children UIDs to optimize the GetNodeChildrenUids call.
  - `get_factory_node(node_unique_id)` -> `InterchangeFactoryBaseNode` — Get a factory node pointer.
  - `get_is_ancestor(node_unique_id, ancestor_uid)` -> `bool` — Checks if ParentNodeUID is an ancestor.
  - `get_node(node_unique_id)` -> `InterchangeBaseNode` — Get a node pointer. Once added to the container, nodes are considered const.
  - `get_node_children(node_unique_id, child_index)` -> `InterchangeBaseNode` — Get the nth const child of the node
  - `get_node_children_count(node_unique_id)` -> `int32` — Get the number of children the node has.
  - `get_node_children_uids(node_unique_id)` -> `Array [ str ]` — Get the UIDs of all the nodeâs children.
  - `get_nodes(class_node)` -> `Array [ str ]` — Return all nodes that are of the ClassNode type.
  - `get_roots()` -> `Array [ str ]` — Return all nodes that do not have any parent.
  - `is_node_uid_valid(node_unique_id)` -> `bool` — Return true if the node unique ID exists in the container.
  - `load_from_file(filename)` -> `None` — Serialize the node container from the specified file.
  - `replace_node(node_unique_id, new_node)` -> `None` — Replace Node
  - `reset()` -> `None` — Empty the container.
  - `reset_children_cache()` -> `None` — Reset the cache of children UIDs.
  - `save_to_file(filename)` -> `None` — Serialize the node container into the specified file.
  - `set_namespace(namespace, target_class)` -> `None` — Set a namespace to all node of the target class in this container. A valid node namespace is prefix to the unique ID in ...
  - `set_node_desired_child_index(node_unique_id, new_node_desired_child_index)` -> `bool` — Set the desired child index of the node.
  - `set_node_parent_uid(node_unique_id, new_parent_node_uid)` -> `bool` — Set the ParentUid of the node.

### `unreal.InterchangeFactoryBase`
Inherits: `Object` | Header: `InterchangeFactoryBase.h`

Asset factory implementation:

**Methods** (4):
  - `get_factory_asset_type()` -> `InterchangeFactoryAssetType` — Return the asset type this factory can create.
  - `get_factory_class()` — Return the UClass this factory can create.
  - `get_source_filenames(object)` -> `Array[str] or None` — Fills the OutSourceFilenames array with the list of source files contained in the asset source data. Returns true if the...
  - `set_source_filename(object, source_filename, source_index)` -> `bool` — Sets the objectâs source at the specified index to the given SourceFileName.

### `unreal.InterchangeFactoryBaseNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeFactoryBaseNode.h`

This struct is used to store and retrieve key-value attributes. The attributes are stored in a generic FAttributeStorage that serializes the values in a TArray64<uint8>. See UE::Interchange::EAttribut...

**Methods** (21):
  - `add_factory_dependency_uid(dependency_uid)` -> `bool` — Add one dependency to this object.
  - `get_custom_level_uid()` -> `str or None` — If this node represent a scene asset (actor), return a specific level in which we will create this scene asset.
  - `get_custom_reference_object()` -> `SoftObjectPath or None` — Return the custom ReferenceObject: the UObject this factory node has created.
  - `get_custom_sub_path()` -> `str or None` — Return the custom sub-path under PackageBasePath where the assets will be created.
  - `get_factory_dependencies()` -> `Array [ str ]` — Retrieve the dependencies for this object.
  - `get_factory_dependencies_count()` -> `int32` — Retrieve the number of factory dependencies for this object.
  - `get_factory_dependency(index)` -> `str` — Retrieve one dependency for this object.
  - `get_object_class()` — Return the UClass of the object we represent, so we can find the factory/writer.
  - `get_reimport_strategy_flags()` -> `ReimportStrategyFlags` — Return the reimport strategy flags.
  - `is_runtime_import_allowed()` -> `bool` — Return if the import of the class is allowed at runtime.
  - `remove_factory_dependency_uid(dependency_uid)` -> `bool` — Remove one dependency from this object.
  - `set_custom_level_uid(attribute_value)` -> `bool` — If this node represent a scene asset (actor), you can set a specific level in which we will create this scene asset.
  - `set_custom_reference_object(attribute_value)` -> `bool` — Set the custom ReferenceObject: the UObject this factory node has created.
  - `set_custom_sub_path(attribute_value)` -> `bool` — Set the custom sub-path under PackageBasePath where the assets will be created.
  - `set_force_node_reimport()` -> `bool` — Allow the creation of the Unreal object even if it has been previously deleted in the editor.
  - `set_reimport_strategy_flags(reimport_strategy_flags)` -> `bool` — Change the reimport strategy flags.
  - `set_skip_node_import()` -> `bool` — Add the skip node attribute. Use this function to cancel the creation of the Unreal asset. See ShouldSkipNodeImport for ...
  - `should_force_node_reimport()` -> `bool` — Return whether or not an object should be created even if it has been deleted in the editor. Return false by default.
  - `should_skip_node_import()` -> `bool` — Return true if this node should skip the factory import process, or false otherwise. Nodes can be in a situation where w...
  - `unset_force_node_reimport()` -> `bool` — Disallow the creation of the Unreal object if it has been previously deleted in the editor.
  - `unset_skip_node_import()` -> `bool` — Remove the skip node attribute. See ShouldSkipNodeImport for more documentation.

### `unreal.InterchangePipelineBase`
Inherits: `Object` | Header: `InterchangePipelineBase.h`

Pipeline implementation:

**Methods** (12):
  - `does_property_states_exist(property_path)` -> `bool` — Return true if the property has valid states, or false if no states were set for the property.
  - `find_or_add_property_states(property_path)` -> `InterchangePipelinePropertyStates` — Return a mutable property states reference. Add the property states if it doesnât exist.
  - `get_support_asset_classes()` -> `Array [ type ( Class ) ]` — Fill the list of all asset this pipeline can create
  - `is_reimport_context()` -> `bool` — Is Reimport Context
  - `scripted_execute_export_pipeline(base_node_container)` -> `None` — Non-virtual helper that allows Blueprint to implement an event-based function. The Interchange manager calls this functi...
  - `scripted_execute_pipeline(base_node_container, source_datas, content_base_path)` -> `None` — ScriptedExecutePipeline, is call after the translation and before we parse the graph to call the factory. This is where ...
  - `scripted_execute_post_broadcast_pipeline(base_node_container, factory_node_key, created_asset, is_a_reimport)` -> `None` — ScriptedExecutePostBroadcastPipeline is called after an asset is completely imported and the broadcast have been called....
  - `scripted_execute_post_factory_pipeline(base_node_container, factory_node_key, created_asset, is_a_reimport)` -> `None` — ScriptedExecutePostFactoryPipeline is called after the factory creates an Unreal asset, but before it calls PostEditChan...
  - `scripted_execute_post_import_pipeline(base_node_container, factory_node_key, created_asset, is_a_reimport)` -> `None` — ScriptedExecutePostImportPipeline is called after an asset is completely imported, after PostEditChange has already been...
  - `scripted_get_pipeline_display_name()` -> `str` — This function is call when we want to list pipeline in the import dialog. If not override the default behavior of this f...
  - `scripted_set_reimport_source_index(reimport_object_class, source_file_index)` -> `None` — Non-virtual helper that allows Blueprint to implement an event-based function. the Interchange framework calls this func...
  - `support_reimport()` -> `bool`

### `unreal.InterchangeSourceData`
Inherits: `Object` | Header: `InterchangeSourceData.h`

Helper class to be able to read different source data File on disk HTTP URL (TODO) Memory buffer (TODO) Stream (TODO)

**Methods** (6):
  - `get_all_context_object_tags()` -> `Array [ str ]` — Get All Context Object Tags
  - `get_context_object_by_tag(tag)` -> `Object` — Get Context Object by Tag
  - `get_filename()` -> `str` — Get Filename
  - `remove_all_context_objects()` -> `None` — Remove All Context Objects
  - `set_context_object_by_tag(tag, object)` -> `None` — Set Context Object by Tag
  - `set_filename(filename)` -> `bool` — Set Filename

### `unreal.InterchangeSourceNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeSourceNode.h`

This class allows a translator to add general source data that describes the whole source. Pipelines can use this information.

**Methods** (29):
  - `get_custom_animated_time_end()` -> `double or None` — Query the end of the source animated time.
  - `get_custom_animated_time_start()` -> `double or None` — Query the start of the source animated time.
  - `get_custom_axis_conversion_inverse_transform()` -> `Transform or None` — Query Axis Conversion Inverse Transform (Primarily used for Socket transform calculations.).
  - `get_custom_import_unused_material()` -> `bool or None` — Query whether to import materials that arenât used.
  - `get_custom_reimport_strategy_flags()` -> `uint8 or None` — Get the reimport strategy based on EReimportStrategyFlags
  - `get_custom_source_frame_rate_denominator()` -> `int32 or None` — Query the source frame rate denominator.
  - `get_custom_source_frame_rate_numerator()` -> `int32 or None` — Query the source frame rate numerator.
  - `get_custom_source_timeline_end()` -> `double or None` — Query the end of the source timeline.
  - `get_custom_source_timeline_start()` -> `double or None` — Query the start of the source timeline.
  - `get_custom_sub_path_prefix()` -> `str or None` — Gets a prefix that should be added to factory node SubPath custom attributes. For example this can contain the imported ...
  - `get_custom_use_asset_type_sub_path_suffix()` -> `bool or None` — Gets whether factory nodes for this import should have a suffix named after their asset category added to their custom s...
  - `get_custom_use_legacy_skeletal_mesh_bake_transform()` -> `bool or None` — Does skeletalMesh factory should uses legacy bake transform behavior to create the skeletal mesh.
  - `get_extra_information()` -> `Map [ str , str ]` — Get Extra Information that we want to show in the Config Panel (such as File Information).
  - `get_unique_instance(node_container)` -> `InterchangeSourceNode` [classmethod] — This function should be use by pipelines to avoid creating a node. If the unique instance doesnât exist, returns nullp...
  - `initialize_source_node(unique_id, display_label)` -> `None` — Initialize the base data of the node.
  - `remove_extra_information(name)` -> `bool` — Remove Extra Information that we dont want to show in the Config Panel.
  - `set_custom_animated_time_end(attribute_value)` -> `bool` — Set the end of the source animated time.
  - `set_custom_animated_time_start(attribute_value)` -> `bool` — Set the start of the source animated time.
  - `set_custom_axis_conversion_inverse_transform(axis_conversion_inverse_transform)` -> `bool` — Set the Axis Conversion Inverse Transform (Primarily used for Socket transform calculations.).
  - `set_custom_import_unused_material(attribute_value)` -> `bool` — Set whether to import materials that arenât used.
  - `set_custom_reimport_strategy_flags(strategy_flag)` -> `bool` — Set the reimport strategy based on EReimportStrategyFlags
  - `set_custom_source_frame_rate_denominator(attribute_value)` -> `bool` — Set the source frame rate denominator.
  - `set_custom_source_frame_rate_numerator(attribute_value)` -> `bool` — Set the source frame rate numerator.
  - `set_custom_source_timeline_end(attribute_value)` -> `bool` — Set the end of the source timeline.
  - `set_custom_source_timeline_start(attribute_value)` -> `bool` — Set the start of the source timeline.
  - `set_custom_sub_path_prefix(prefix)` -> `bool` — Sets the prefix that should be added to factory node SubPath custom attributes.
  - `set_custom_use_asset_type_sub_path_suffix(suffix)` -> `bool` — Sets whether factory nodes for this import should have a suffix named after their asset category added to their custom s...
  - `set_custom_use_legacy_skeletal_mesh_bake_transform(attribute_value)` -> `bool` — Set the SkeletalMesh factory to uses legacy bake transform behavior to create the skeletalmesh.
  - `set_extra_information(name, value)` -> `bool` — Set Extra Information that we want to show in the Config Panel (such as File Information).

### `unreal.InterchangeTranslatorBase`
Inherits: `Object` | Header: `InterchangeTranslatorBase.h`

Interchange Translator Base

**Methods** (7):
  - `can_import_source_data(source_data)` -> `bool` — return true if the translator can translate the given source data.
  - `get_settings()` -> `InterchangeTranslatorSettings` — Return this translator settings
  - `get_source_data()` -> `InterchangeSourceData` — Get the associated source data for this translator.
  - `get_supported_asset_types()` -> `InterchangeTranslatorAssetType` — Get Supported Asset Types
  - `get_supported_formats()` -> `Array [ str ]` — List of formats supported by the translator. Each entry is of the form âext;Descriptionâ where ext is the file exten...
  - `get_translator_type()` -> `InterchangeTranslatorType` — Specifies the capabilities of a translator.
  - `set_settings(interchange_translator_settings)` -> `None` — Reimport will set the settings if they exist in UInterchangeAssetImportData

### `unreal.InterchangeTranslatorSettings`
Inherits: `Object` | Header: `InterchangeTranslatorBase.h`

Base class for translator settings, the UInterchangeAssetImportData will store this data if the source translator exist

**Methods** (2):
  - `load_settings()` -> `None` — Load Settings
  - `save_settings()` -> `None` — Save Settings

### `unreal.InterchangeUserDefinedAttributesAPI`
Inherits: `Object` | Header: `InterchangeUserDefinedAttribute.h`

UInterchangeUserDefinedAttributesAPI is used to store and retrieve user-defined attributes such as DCC node attributes, so that pipelines have access to those attributes. Every user-defined attribute ...

**Methods** (13):
  - `create_user_defined_attribute_boolean(interchange_node, user_defined_attribute_name, value, payload_key, requires_delegate = False)` -> `bool` [classmethod] — Create User Defined Attribute Boolean
  - `create_user_defined_attribute_double(interchange_node, user_defined_attribute_name, value, payload_key, requires_delegate = False)` -> `bool` [classmethod] — Create User Defined Attribute Double
  - `create_user_defined_attribute_f_string(interchange_node, user_defined_attribute_name, value, payload_key, requires_delegate = False)` -> `bool` [classmethod] — Create User Defined Attribute FString
  - `create_user_defined_attribute_float(interchange_node, user_defined_attribute_name, value, payload_key, requires_delegate = False)` -> `bool` [classmethod] — Create User Defined Attribute Float
  - `create_user_defined_attribute_int32(interchange_node, user_defined_attribute_name, value, payload_key, requires_delegate = False)` -> `bool` [classmethod] — Create User Defined Attribute Int 32
  - `duplicate_all_user_defined_attribute(interchange_source_node, interchange_destination_node, add_source_node_name)` -> `None` [classmethod] — Duplicate All User Defined Attribute
  - `get_user_defined_attribute_boolean(interchange_node, user_defined_attribute_name)` -> `(out_value=bool, out_payload_key=str) or None` [classmethod] — Get User Defined Attribute Boolean
  - `get_user_defined_attribute_double(interchange_node, user_defined_attribute_name)` -> `(out_value=double, out_payload_key=str) or None` [classmethod] — Get User Defined Attribute Double
  - `get_user_defined_attribute_f_string(interchange_node, user_defined_attribute_name)` -> `(out_value=str, out_payload_key=str) or None` [classmethod] — Get User Defined Attribute FString
  - `get_user_defined_attribute_float(interchange_node, user_defined_attribute_name)` -> `(out_value=float, out_payload_key=str) or None` [classmethod] — Get User Defined Attribute Float
  - `get_user_defined_attribute_infos(interchange_node)` -> `Array [ InterchangeUserDefinedAttributeInfo ]` [classmethod] — Get User Defined Attribute Infos
  - `get_user_defined_attribute_int32(interchange_node, user_defined_attribute_name)` -> `(out_value=int32, out_payload_key=str) or None` [classmethod] — Get User Defined Attribute Int 32
  - `remove_user_defined_attribute(interchange_node, user_defined_attribute_name)` -> `bool` [classmethod] — Remove the specified user-defined attribute.

### `unreal.InterchangeWriterBase`
Inherits: `Object` | Header: `InterchangeWriterBase.h`

Interchange Writer Base

### `unreal.InterchangeFactoryAssetType`
Inherits: `EnumBase` | Header: `InterchangeFactoryBase.h`

EInterchange Factory Asset Type

**Properties** (6):
  - `ANIMATIONS`: `InterchangeFactoryAssetType = Ellipsis` — 4
  - `MATERIALS`: `InterchangeFactoryAssetType = Ellipsis` — 2
  - `MESHES`: `InterchangeFactoryAssetType = Ellipsis` — 3
  - `NONE`: `InterchangeFactoryAssetType = Ellipsis` — 0
  - `PHYSICS`: `InterchangeFactoryAssetType = Ellipsis` — 5
  - `TEXTURES`: `InterchangeFactoryAssetType = Ellipsis` — 1

### `unreal.InterchangeNodeContainerType`
Inherits: `EnumBase` | Header: `InterchangeBaseNode.h`

ns UE::Interchange

**Properties** (4):
  - `FACTORY_DATA`: `InterchangeNodeContainerType = Ellipsis` — 3
  - `NONE`: `InterchangeNodeContainerType = Ellipsis` — 0
  - `TRANSLATED_ASSET`: `InterchangeNodeContainerType = Ellipsis` — 2
  - `TRANSLATED_SCENE`: `InterchangeNodeContainerType = Ellipsis` — 1

### `unreal.InterchangeNodeUserInterfaceContext`
Inherits: `EnumBase` | Header: `InterchangeBaseNode.h`

EInterchange Node User Interface Context

**Properties** (2):
  - `NONE`: `InterchangeNodeUserInterfaceContext = Ellipsis` — 0
  - `PREVIEW`: `InterchangeNodeUserInterfaceContext = Ellipsis` — 1

### `unreal.InterchangePipelineTask`
Inherits: `EnumBase` | Header: `InterchangePipelineBase.h`

EInterchange Pipeline Task

**Properties** (4):
  - `EXPORT`: `InterchangePipelineTask = Ellipsis` — 3
  - `POST_FACTORY`: `InterchangePipelineTask = Ellipsis` — 1
  - `POST_IMPORT`: `InterchangePipelineTask = Ellipsis` — 2
  - `POST_TRANSLATOR`: `InterchangePipelineTask = Ellipsis` — 0

### `unreal.InterchangeTranslatorAssetType`
Inherits: `EnumBase` | Header: `InterchangeTranslatorBase.h`

EInterchange Translator Asset Type

**Properties** (5):
  - `ANIMATIONS`: `InterchangeTranslatorAssetType = Ellipsis` — 8
  - `MATERIALS`: `InterchangeTranslatorAssetType = Ellipsis` — 2
  - `MESHES`: `InterchangeTranslatorAssetType = Ellipsis` — 4
  - `NONE`: `InterchangeTranslatorAssetType = Ellipsis` — 0
  - `TEXTURES`: `InterchangeTranslatorAssetType = Ellipsis` — 1

### `unreal.InterchangeTranslatorType`
Inherits: `EnumBase` | Header: `InterchangeTranslatorBase.h`

EInterchange Translator Type

**Properties** (4):
  - `ACTORS`: `InterchangeTranslatorType = Ellipsis` — 4
  - `ASSETS`: `InterchangeTranslatorType = Ellipsis` — 2
  - `INVALID`: `InterchangeTranslatorType = Ellipsis` — 0
  - `SCENES`: `InterchangeTranslatorType = Ellipsis` — 6

### `unreal.ReimportStrategyFlags`
Inherits: `EnumBase` | Header: `InterchangeFactoryBaseNode.h`

namespace UE::Interchange

**Properties** (3):
  - `APPLY_EDITOR_CHANGED_PROPERTIES`: `ReimportStrategyFlags = Ellipsis` — Always apply all properties specified by the pipeline, but leave the properties that were modified i...
  - `APPLY_NO_PROPERTIES`: `ReimportStrategyFlags = Ellipsis` — Do not apply any properties when reimporting. Simply change the source data 0
  - `APPLY_PIPELINE_PROPERTIES`: `ReimportStrategyFlags = Ellipsis` — Always apply all properties specified by the pipeline. 1
