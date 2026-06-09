# UE Python API — BlueprintEditorLibrary Module

**2 types** from the `BlueprintEditorLibrary` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BlueprintEditorLibrary`, `AssetSaveVersionComparisonResults`

---

## Classes

### `unreal.BlueprintEditorLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlueprintEditorLibrary.h`

Blueprint Editor Library

**Methods** (33):
  - `add_function_graph(blueprint, func_name = 'NewFunction')` -> `EdGraph` [classmethod] — Adds a function to the given blueprint
  - `add_member_variable(blueprint, member_name, variable_type)` -> `bool` [classmethod] — Adds a member variable to the specified blueprint with the specified type.
  - `compare_asset_save_version_to(asset, version_to_check)` -> `AssetSaveVersionComparisonResults` [classmethod] — Compares the given assets save version to the VersionToCheck. see: GetSavedByEngineVersion and GetCurrentEngineVersion
  - `compare_soft_object_save_version_to(object_to_check, version_to_check)` -> `AssetSaveVersionComparisonResults` [classmethod] — Compares the given soft objectâs save version to the VersionToCheck. This will read the packages file header see: GetS...
  - `compile_blueprint(blueprint)` -> `None` [classmethod] — Compiles the given blueprint.
  - `create_blueprint_asset_with_parent(asset_path, parent_class)` -> `Blueprint` [classmethod] — Creates a blueprint based on a specific parent, honoring registered custom blueprint types
  - `find_event_graph(blueprint)` -> `EdGraph` [classmethod] — Finds the event graph of the given blueprint. Null if it doesnât have one. This will only return the primary event gra...
  - `find_graph(blueprint, graph_name)` -> `EdGraph` [classmethod] — Finds the graph with the given name on the blueprint. Null if it doesnât have one.
  - `generated_class(blueprint_obj)` [classmethod] — Gets the class generated when this blueprint is compiled
  - `get_array_type(contained_type)` -> `EdGraphPinType` [classmethod]
  - `get_basic_type_by_name(type_name)` -> `EdGraphPinType` [classmethod]
  - `get_blueprint_asset(object)` -> `Blueprint` [classmethod] — Casts the provided Object to a Blueprint - the root asset type of a blueprint asset. Note that the blueprint asset itsel...
  - `get_blueprint_for_class(does_class_have_blueprint=bool)` [classmethod] — Looks up the UBlueprint that generated the provided class, if any. Provides a âtrueâ exec pin to execute if there is...
  - `get_class_reference_type(class_type)` -> `EdGraphPinType` [classmethod]
  - `get_current_engine_version()` -> `str` [classmethod] — Returns a string which represents the current engine version (FEngineVersion::Current()) For example: â5.6.0-37518009+...
  - `get_map_type(key_type, value_type)` -> `EdGraphPinType` [classmethod]
  - `get_object_reference_type(object_type)` -> `EdGraphPinType` [classmethod]
  - `get_saved_by_engine_version(asset)` -> `str` [classmethod] — Returns a string representation of the engine version which the given asset was saved with. see: FLinker::Summary::Saved...
  - `get_set_type(contained_type)` -> `EdGraphPinType` [classmethod]
  - `get_struct_type(struct_type)` -> `EdGraphPinType` [classmethod]
  - `refresh_all_open_blueprint_editors()` -> `None` [classmethod] — Refresh any open blueprint editors
  - `refresh_open_editors_for_blueprint(bp)` -> `None` [classmethod] — Attempt to refresh any open blueprint editors for the given asset
  - `remove_function_graph(blueprint, func_name)` -> `None` [classmethod] — Deletes the function of the given name on this blueprint. Does NOT replace function call sites.
  - `remove_graph(blueprint, graph)` -> `None` [classmethod] — Removes the given graph from the blueprint if possible
  - `remove_unused_nodes(blueprint)` -> `None` [classmethod] — Remove any nodes in this blueprint that have no connections made to them.
  - `remove_unused_variables(blueprint)` -> `int32` [classmethod] — Deletes any unused blueprint created variables the given blueprint. An Unused variable is any BP variable that is not re...
  - `rename_graph(graph, new_name_str = 'NewGraph')` -> `None` [classmethod] — Attempts to rename the given graph with a new name
  - `reparent_blueprint(blueprint, new_parent_class)` -> `None` [classmethod] — Attempts to reparent the given blueprint to the new chosen parent class.
  - `replace_variable_references(blueprint, old_var_name, new_var_name)` -> `None` [classmethod] — Replace any references of variables with the OldVarName to references of those with the NewVarName if possible
  - `set_blueprint_variable_expose_on_spawn(blueprint, variable_name, expose_on_spawn)` -> `None` [classmethod] — Sets âExpose On Spawnâ to true/false on a Blueprint variable
  - `set_blueprint_variable_expose_to_cinematics(blueprint, variable_name, expose_to_cinematics)` -> `None` [classmethod] — Sets âExpose To Cinematicsâ to true/false on a Blueprint variable
  - `set_blueprint_variable_instance_editable(blueprint, variable_name, instance_editable)` -> `None` [classmethod] — Sets âInstance Editableâ to true/false on a Blueprint variable
  - `upgrade_operator_nodes(blueprint)` -> `None` [classmethod] — Replace any old operator nodes (float + float, vector + float, int + vector, etc) with the newer Promotable Operator ver...

### `unreal.AssetSaveVersionComparisonResults`
Inherits: `EnumBase` | Header: `BlueprintEditorLibrary.h`

The results of comparing an assets save version to another

**Properties** (4):
  - `IDENTICAL`: `AssetSaveVersionComparisonResults = Ellipsis` — The asset save version is identical to what it is being compared to 1
  - `INVALID_COMPARISON`: `AssetSaveVersionComparisonResults = Ellipsis` — The comparison could not be completed 0
  - `NEWER`: `AssetSaveVersionComparisonResults = Ellipsis` — The asset save version is newer than what it is being compared to 2
  - `OLDER`: `AssetSaveVersionComparisonResults = Ellipsis` — The asset save version is older than what it is being compared to 3
