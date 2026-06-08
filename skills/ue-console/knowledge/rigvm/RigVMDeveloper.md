# UE Python API — RigVMDeveloper Module

**46 types** from the `RigVMDeveloper` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RigStructScope`, `RigVMCompileSettings`, `RigVMEdGraphDisplaySettings`, `RigVMFunctionReferenceArray`, `RigVMGraphParameterDescription`, `RigVMGraphVariableDescription`, `RigVMParserASTSettings`, `RigVMPythonSettings`, `RigVMActionStack`, `RigVMAggregateNode`, `RigVMArrayNode`, `RigVMBlueprint`, `RigVMBranchNode`, `RigVMBuildData`, `RigVMCollapseNode`, `RigVMCommentNode`, `RigVMCompiler`, `RigVMController`, `RigVMDispatchNode`, `RigVMEnumNode`, ... (46 total)

---

## Classes

### `unreal.RigStructScope`
Inherits: `StructBase` | Header: `RigVMController.h`

Rig Struct Scope

### `unreal.RigVMCompileSettings`
Inherits: `StructBase` | Header: `RigVMCompiler.h`

Rig VMCompile Settings

**Properties** (7):
  - `ast_settings`: `RigVMParserASTSettings` — [Read-Write] (RigVMParserASTSettings)
  - `enable_pin_watches`: `bool` — [Read-Write] (bool)
  - `surpress_errors`: `bool` — [Read-Write] (bool)
  - `surpress_info_messages`: `bool` — [Read-Write] (bool)
  - `surpress_warnings`: `bool` — [Read-Write] (bool)
  - `warn_about_deprecated_nodes`: `bool` — [Read-Write] (bool)
  - `warn_about_duplicate_events`: `bool` — [Read-Write] (bool)

### `unreal.RigVMEdGraphDisplaySettings`
Inherits: `StructBase` | Header: `RigVMBlueprint.h`

Rig VMEd Graph Display Settings

### `unreal.RigVMFunctionReferenceArray`
Inherits: `StructBase` | Header: `RigVMBuildData.h`

Rig VMFunction Reference Array

### `unreal.RigVMGraphParameterDescription`
Inherits: `StructBase` | Header: `RigVMParameterNode.h`

The parameter description is used to convey information about unique parameters within a Graph. Multiple Parameter Nodes can share the same parameter description.

**Properties** (5):
  - `cpp_type`: `str` [Read-Only] — [Read-Only] The C++ data type of the parameter (str)
  - `cpp_type_object`: `Object` [Read-Only] — [Read-Only] The Struct of the C++ data type of the parameter (or nullptr) (Object)
  - `default_value`: `str` [Read-Only] — [Read-Only] The default value of the parameter (str)
  - `is_input`: `bool` [Read-Only] — [Read-Only] True if the parameter is an input (bool)
  - `name`: `Name` [Read-Only] — [Read-Only] The name of the parameter (Name)

### `unreal.RigVMGraphVariableDescription`
Inherits: `StructBase` | Header: `RigVMVariableDescription.h`

The variable description is used to convey information about unique variables within a Graph. Multiple Variable Nodes can share the same variable description.

**Properties** (5):
  - `category`: `Text` [Read-Only] — [Read-Only] The category of the variable (Text)
  - `cpp_type`: `str` [Read-Only] — [Read-Only] The C++ data type of the variable (str)
  - `cpp_type_object`: `Object` [Read-Only] — [Read-Only] The Struct of the C++ data type of the variable (or nullptr) (Object)
  - `default_value`: `str` [Read-Only] — [Read-Only] The default value of the variable (str)
  - `name`: `Name` [Read-Only] — [Read-Only] The name of the variable (Name)

### `unreal.RigVMParserASTSettings`
Inherits: `StructBase` | Header: `RigVMAST.h`

The settings to apply during the parse of the abstract syntax tree. The folding settings can affect the performance of the parse dramatically.

**Properties** (1):
  - `setup_traits`: `bool` — [Read-Write] (bool)

### `unreal.RigVMPythonSettings`
Inherits: `StructBase` | Header: `RigVMBlueprint.h`

Rig VMPython Settings

### `unreal.RigVMActionStack`
Inherits: `Object` | Header: `RigVMControllerActions.h`

The Action Stack can be used to track actions happening on a Graph. Currently the only owner of the ActionStack is the Controller. Actions can be added to the stack, or they can be understood as scope...

### `unreal.RigVMAggregateNode`
Inherits: `RigVMCollapseNode` | Header: `RigVMAggregateNode.h`

The Aggregate Node contains a subgraph of nodes with aggregate pins (2in+1out or 1out+2in) connected to each other. For example, a unit node IntAdd which adds 2 integers and provides Result=A+B could ...

### `unreal.RigVMArrayNode`
Inherits: `RigVMTemplateNode` | Header: `RigVMArrayNode.h`

The Array Node represents one of a series available array operations such as SetNum, GetAtIndex etc.

**Methods** (3):
  - `get_cpp_type()` -> `str` — Returns the C++ data type of the element
  - `get_cpp_type_object()` -> `Object` — Returns the C++ data type struct of the array (or nullptr)
  - `get_op_code()` -> `RigVMOpCode` — Returns the op code of this node

### `unreal.RigVMBlueprint`
Inherits: `Blueprint` | Header: `RigVMBlueprint.h`

Rig VMBlueprint

**Methods** (33):
  - `add_member_variable(name, cpp_type, is_public = False, is_read_only = False, default_value = '')` -> `Name` — Add Member Variable
  - `add_model(name = 'RigGraph', setup_undo_redo = True, print_python_command = True)` -> `RigVMGraph` — Add Model
  - `change_member_variable_type(name, cpp_type, is_public = False, is_read_only = False, default_value = '')` -> `bool` — Change Member Variable Type
  - `create_rig_vm_host()` -> `RigVMHost` — Create Rig VMHost
  - `generate_python_commands(new_blueprint_name)` -> `Array [ str ]` — Generate Python Commands
  - `get_all_models()` -> `Array [ RigVMGraph ]` — Get All Models
  - `get_asset_variant()` -> `RigVMVariant` — Get Asset Variant BP
  - `get_asset_variant_ref()` -> `RigVMVariantRef` — Get Asset Variant Ref
  - `get_auto_vm_recompile()` -> `bool` — Get Auto VMRecompile
  - `get_available_rig_vm_structs()` -> `Array [ Struct ]` — Get Available Rig VMStructs
  - `get_controller(graph = None)` -> `RigVMController` — Get Controller
  - `get_controller_by_name(graph_name = '')` -> `RigVMController` — Get Controller by Name
  - `get_debugged_rig_vm_host()` -> `RigVMHost` — Get Debugged Rig VMHost
  - `get_default_model()` -> `RigVMGraph` — Get Default Model
  - `get_focused_model()` -> `RigVMGraph` — Get Focused Model
  - `get_local_function_library()` -> `RigVMFunctionLibrary` — Get Local Function Library
  - `get_matching_variants()` -> `Array [ RigVMVariantRef ]` — Get Matching Variants
  - `get_member_variables()` -> `Array [ RigVMGraphVariableDescription ]` — Get Member Variables
  - `get_model(ed_graph = None)` -> `RigVMGraph` — Get Model
  - `get_or_create_controller(graph = None)` -> `RigVMController` — Get or Create Controller
  - `get_or_create_local_function_library(setup_undo_redo = True)` -> `RigVMFunctionLibrary` — Get or Create Local Function Library
  - `get_rig_vm_host_class()` — Get Rig VMHost Class
  - `join_asset_variant(guid)` -> `bool` — Merges the assetâs guid with a provided one to join the variant set
  - `recompile_vm()` -> `None` — Recompile VM
  - `recompile_vm_if_required()` -> `None` — Recompile VMIf Required
  - `remove_member_variable(name)` -> `bool` — Remove Member Variable
  - `remove_model(name = 'RigGraph', setup_undo_redo = True, print_python_command = True)` -> `bool` — Remove Model
  - `rename_member_variable(old_name, new_name)` -> `bool` — Rename Member Variable
  - `request_auto_vm_recompilation()` -> `None` — Request Auto VMRecompilation
  - `request_rig_vm_init()` -> `None` — Request Rig VMInit
  - `set_auto_vm_recompile(auto_recompile)` -> `None` — Set Auto VMRecompile
  - `split_asset_variant()` -> `bool` — Resets the assetâs guid to a new one and splits it from the former variant set
  - `suspend_notifications(suspend_notifs)` -> `None` — Suspend Notifications

**Properties** (1):
  - `vm_compile_settings`: `RigVMCompileSettings` — [Read-Write] (RigVMCompileSettings)

### `unreal.RigVMBranchNode`
Inherits: `RigVMNode` | Header: `RigVMBranchNode.h`

A branch node is used to branch between two blocks of execution

### `unreal.RigVMBuildData`
Inherits: `Object` | Header: `RigVMBuildData.h`

The Build Data is used to store transient / intermediate build information for the RigVM graph to improve the user experience. This object is never serialized.

**Methods** (16):
  - `create_asset_variant(asset_data, name = 'None')` -> `RigVMVariantRef` — Creates a new variant of an asset
  - `create_function_variant(function_identifier, name = 'None')` -> `RigVMVariantRef` — Creates a new variant of a graph function within the same asset
  - `find_asset_variant_refs(guid)` -> `Array [ RigVMVariantRef ]` — Will find all the asset variants matching the given variant guid
  - `find_function_variant_refs(guid)` -> `Array [ RigVMVariantRef ]` — Will find all the function variants matching the given variant guid
  - `gather_all_asset_variant_refs()` -> `Array [ RigVMVariantRef ]` — Will find all asset variant refs
  - `gather_all_function_variant_refs()` -> `Array [ RigVMVariantRef ]` — Will find all public function variant refs, and private function variant refs from loaded assets
  - `gather_function_variant_refs_for_asset(asset_data)` -> `Array [ RigVMVariantRef ]` — Will find the public function variant refs inside this asset, and private function variant refs if the asset is loaded
  - `get()` -> `RigVMBuildData` [classmethod] — Returns the singleton build data
  - `get_all_function_identifiers(only_public = True)` -> `Array [ RigVMGraphFunctionIdentifier ]` — Returns all known public function identifiers used in the project
  - `get_asset_data_for_path(object_path)` -> `AssetData` — Returns the asset data given an object path
  - `get_asset_data_for_variant(variant_ref)` -> `AssetData` — Returns the asset data given a variant reference
  - `get_function_identifier_for_variant(variant_ref)` -> `RigVMGraphFunctionIdentifier` — Returns the function identifier given a variant reference
  - `get_used_function_identifiers(only_public = True)` -> `Array [ RigVMGraphFunctionIdentifier ]` — Returns all known public function identifiers used in the project
  - `get_variant_ref_for_asset(asset_data)` -> `RigVMVariantRef` — Returns the asset data given a variant reference
  - `join_variant_set(variant_ref, guid)` -> `RigVMVariantRef` — Joins a variant with another variantâs set
  - `split_variant_from_set(variant_ref)` -> `RigVMVariantRef` — Splits a variant from its variant set (by assigning a new, unique guid

**Properties** (1):
  - `function_references`: `None` — [Read-Write]
deprecated: Property âFunctionReferencesâ is deprecated. (Map[RigVMLibraryNode,RigV...

### `unreal.RigVMCollapseNode`
Inherits: `RigVMLibraryNode` | Header: `RigVMCollapseNode.h`

The Collapse Node is a library node which stores the function and its nodes directly within the node itself.

### `unreal.RigVMCommentNode`
Inherits: `RigVMNode` | Header: `RigVMCommentNode.h`

Comment Nodes can be used to annotate a Graph by adding colored grouping as well as user provided text. Comment Nodes are purely cosmetic and donât contribute to the runtime result of the Graph / Fu...

**Methods** (4):
  - `get_comment_bubble_visible()` -> `bool` — Returns the current user provided bubble visibility of this comment.
  - `get_comment_color_bubble()` -> `bool` — Returns the current user provided bubble color inheritance of this comment.
  - `get_comment_font_size()` -> `int32` — Returns the current user provided font size of this comment.
  - `get_comment_text()` -> `str` — Returns the current user provided text of this comment.

### `unreal.RigVMCompiler`
Inherits: `Object` | Header: `RigVMCompiler.h`

Rig VMCompiler

**Methods** (2):
  - `compile(graphs, controller, out_vm)` -> `bool` — Compile deprecated: Compile is deprecated, use CompileVM with Context parameter.
  - `compile_vm(graphs, controller, out_vm)` -> `RigVMExtendedExecuteContext or None` — Compile VM

### `unreal.RigVMController`
Inherits: `Object` | Header: `RigVMController.h`

The Controller is the sole authority to perform changes on the Graph. The Controller itself is stateless. The Controller offers a Modified event to subscribe to for user interface views - so they can ...

**Methods** (177):
  - `add_aggregate_pin(node_name, pin_name, default_value = '', setup_undo_redo = True, print_python_command = False)` -> `str` — Add Aggregate Pin
  - `add_array_node(op_code, cpp_type, cpp_type_object, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False, is_patching = False)` -> `RigVMNode` — Adds a Array Node to the edited Graph. This causes a NodeAdded modified event.
  - `add_array_node_from_object_path(op_code, cpp_type, cpp_type_object_path, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False, is_patching = False)` -> `RigVMNode` — Adds a Array Node to the edited Graph given a struct object path name. This causes a NodeAdded modified event.
  - `add_array_pin(array_pin_path, default_value = '', setup_undo_redo = True, print_python_command = False)` -> `str` — Adds an array element pin to the end of an array pin. This causes a PinArraySizeChanged modified event.
  - `add_branch_node(position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMNode` — Adds a branch node to the graph. Branch nodes can be used to split the execution of into multiple branches, allowing to ...
  - `add_comment_node(comment_text, position = [0.000000,0.000000], size = [400.000000,300.000000], color = [0.000000,0.000000,0.000000,1.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMCommentNode` — Adds a Comment Node to the edited Graph. Comments can be used to annotate the Graph. This causes a NodeAdded modified ev...
  - `add_default_tag_to_function_variant(function_name, tag_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Adds a default tag to a function variant
  - `add_empty_pin_category(node_name, category, setup_undo_redo = True, print_python_command = False)` -> `bool` — Adds a new pin category. The category is UI relevant only and used to order pins in the user interface of the node as we...
  - `add_enum_node(cpp_type_object_path, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMEnumNode` — Adds an enum node to the graph Enum nodes can be used to represent constant enum values within the graph
  - `add_exposed_pin(pin_name, direction, cpp_type, cpp_type_object_path, default_value, setup_undo_redo = True, print_python_command = False)` -> `Name` — Adds an exposed pin to the graph controlled by this
  - `add_external_function_reference_node(host_path, function_name, node_position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMFunctionReferenceNode` — Add External Function Reference Node
  - `add_free_reroute_node(cpp_type, cpp_type_object_path, is_constant, custom_widget_name, default_value, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True)` -> `RigVMRerouteNode` — Adds a free Reroute Node
  - `add_function_reference_node(function_definition, node_position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMFunctionReferenceNode` — Add Function Reference Node
  - `add_function_reference_node_from_description(function_definition, node_position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMFunctionReferenceNode` — Adds a function reference / invocation to the graph
  - `add_function_to_library(function_name, mutable, node_position = [0.000000,0.000000], setup_undo_redo = True, print_python_command = False)` -> `RigVMLibraryNode` — Adds a function definition to a function library graph
  - `add_if_node(cpp_type, cpp_type_object_path, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMNode` — Adds an if node to the graph. If nodes can be used to pick between two values based on a condition.
  - `add_if_node_from_struct(script_struct, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True)` -> `RigVMNode` — Add if Node from Struct
  - `add_injected_node(pin_path, as_input, script_struct, method_name, input_pin_name, output_pin_name, node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMInjectionInfo` — Adds a Function / Struct Node to the edited Graph as an injected node UnitNode represent a RIGVM_METHOD declaration on a...
  - `add_injected_node_from_struct_path(pin_path, as_input, script_struct_path, method_name, input_pin_name, output_pin_name, node_name = '', setup_undo_redo = True)` -> `RigVMInjectionInfo` — Adds a Function / Struct Node to the edited Graph as an injected node UnitNode represent a RIGVM_METHOD declaration on a...
  - `add_invoke_entry_node(entry_name, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMInvokeEntryNode` — Adds an entry invocation node This causes a NodeAdded modified event.
  - `add_link(output_pin_path, input_pin_path, setup_undo_redo = True, print_python_command = False, user_direction = RigVMPinDirection.OUTPUT, create_cast_node = False)` -> `bool` — Adds a link to the graph. This causes a LinkAdded modified event.
  - `add_local_variable(variable_name, cpp_type, cpp_type_object, default_value, setup_undo_redo = True, print_python_command = False)` -> `RigVMGraphVariableDescription` — Add a local variable to the graph
  - `add_local_variable_from_object_path(variable_name, cpp_type, cpp_type_object_path, default_value, setup_undo_redo = True)` -> `RigVMGraphVariableDescription` — Add a local variable to the graph given a struct object path name.
  - `add_override_to_all_pins_on_node(node_name, setup_undo = True, print_python_command = False)` -> `bool` — Adds an override to all pins on a node
  - `add_override_to_all_pins_on_nodes(node_names, setup_undo = True, print_python_command = False)` -> `bool` — Adds an override to all pins on a list of nodes
  - `add_override_to_pin(pin_path, setup_undo = True, print_python_command = False)` -> `bool` — Adds an override to the given pin path
  - `add_override_to_pins(pin_paths, setup_undo = True, print_python_command = False)` -> `bool` — Adds an override to a given list of pin paths
  - `add_parameter_node(parameter_name, cpp_type, cpp_type_object, is_input, default_value, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMParameterNode` — Adds a Parameter Node to the edited Graph. Parameters represent input or output arguments to the Graph / Function. Input...
  - `add_parameter_node_from_object_path(parameter_name, cpp_type, cpp_type_object_path, is_input, default_value, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMParameterNode` — Adds a Parameter Node to the edited Graph given a struct object path name. Parameters represent input or output argument...
  - `add_reroute_node_on_link(link, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMRerouteNode` — Adds a Reroute Node on an existing Link to the edited Graph. Reroute Nodes can be used to visually improve the data flow...
  - `add_reroute_node_on_link_path(link_pin_path_representation, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMRerouteNode` — Adds a Reroute Node on an existing Link to the edited Graph given the Linkâs string representation. Reroute Nodes can ...
  - `add_reroute_node_on_pin(pin_path, as_input, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMRerouteNode` — Adds a Reroute Node on an existing Pin to the editor Graph. Reroute Nodes can be used to visually improve the data flow,...
  - `add_select_node(cpp_type, cpp_type_object_path, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMNode` — Adds a select node to the graph. Select nodes can be used to pick between multiple values based on an index.
  - `add_select_node_from_struct(script_struct, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True)` -> `RigVMNode` — Add Select Node from Struct
  - `add_tag_to_function_variant(function_name, tag, setup_undo_redo = True, print_python_command = False)` -> `bool` — Adds a tag to a function variant
  - `add_template_node(notation, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMTemplateNode` — Adds a template node to the graph.
  - `add_trait(node_name, trait_type_object_path, trait_name = 'None', default_value = '', pin_index = -1, setup_undo_redo = True, print_python_command = False)` -> `Name` — Adds a trait to a node
  - `add_unit_node(script_struct, method_name = 'Execute', position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMUnitNode` — Adds a Function / Struct Node to the edited Graph. UnitNode represent a RIGVM_METHOD declaration on a USTRUCT. This caus...
  - `add_unit_node_from_struct_path(script_struct_path, method_name = 'Execute', position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMUnitNode` — Adds a Function / Struct Node to the edited Graph given its struct object path name. UnitNode represent a RIGVM_METHOD d...
  - `add_unit_node_with_defaults(script_struct, defaults, method_name = 'Execute', position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMUnitNode` — Adds a Function / Struct Node to the edited Graph. UnitNode represent a RIGVM_METHOD declaration on a USTRUCT. This caus...
  - `add_variable_node(variable_name, cpp_type, cpp_type_object, is_getter, default_value, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMVariableNode` — Adds a Variable Node to the edited Graph. Variables represent local work state for the function and can be read from and...
  - `add_variable_node_from_object_path(variable_name, cpp_type, cpp_type_object_path, is_getter, default_value, position = [0.000000,0.000000], node_name = '', setup_undo_redo = True, print_python_command = False)` -> `RigVMVariableNode` — Adds a Variable Node to the edited Graph given a struct object path name. Variables represent local work state for the f...
  - `bind_pin_to_variable(pin_path, new_bound_variable_path, setup_undo_redo = True, print_python_command = False)` -> `bool` — Binds a pin to a variable (or removes the binding given NAME_None) This causes a PinBoundVariableChanged modified event.
  - `break_all_links(pin_path, as_input = True, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes all links on a given pin from the graph. This might cause multiple LinkRemoved modified event.
  - `break_link(output_pin_path, input_pin_path, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes a link from the graph. This causes a LinkRemoved modified event.
  - `can_import_nodes_from_text(text)` -> `bool` — Exports the given nodes as text
  - `cancel_undo_bracket()` -> `bool` — Cancels an undo bracket / scoped transaction. This is primarily useful for Python. This causes a UndoBracketCanceled mod...
  - `change_exposed_pin_type(pin_name, cpp_type, cpp_type_object_path, setup_undo_redo, setup_orphan_pins = True, print_python_command = False)` -> `bool or None` — Changes the type of an exposed pin in the graph controlled by this
  - `clear_array_pin(array_pin_path, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes all (but one) array element pin from an array pin. This causes a PinArraySizeChanged modified event.
  - `clear_node_layout(node_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes any layout information from a node
  - `clear_node_selection(setup_undo_redo = True, print_python_command = False)` -> `bool` — Deselects all currently selected nodes in the graph. This might cause several NodeDeselected modified event.
  - `clear_override_on_all_pins_on_node(node_name, setup_undo = True, print_python_command = False)` -> `bool` — Clears the overrides for all pins on a node
  - `clear_override_on_all_pins_on_nodes(node_names, setup_undo = True, print_python_command = False)` -> `bool` — Clears the overrides for all pins of a list of nodes
  - `clear_override_on_pin(pin_path, setup_undo = True, print_python_command = False)` -> `bool` — Clears an override on a given pin path
  - `clear_override_on_pins(pin_paths, setup_undo = True, print_python_command = False)` -> `bool` — Clears the overrides on a given list of pin paths
  - `clear_pin_category(pin_path, setup_undo_redo = True, print_python_command = False)` -> `bool` — Clears the pin category. The category is UI relevant only and used to order pins in the user interface of the node as we...
  - `close_undo_bracket()` -> `bool` — Closes an undo bracket / scoped transaction. This is primarily useful for Python. This causes a UndoBracketClosed modifi...
  - `collapse_nodes(node_names, collapse_node_name = '', setup_undo_redo = True, print_python_command = False, is_aggregate = False)` -> `RigVMCollapseNode` — Turns a series of nodes into a Collapse node
  - `create_function_variant(function_name, variant_name = 'None', setup_undo_redo = True, print_python_command = False)` -> `RigVMLibraryNode` — Creates a variant of a function given the name of an existing function variant
  - `duplicate_array_pin(array_element_pin_path, setup_undo_redo = True, print_python_command = False)` -> `str` — Duplicates an array element pin. This causes a PinArraySizeChanged modified event.
  - `eject_node_from_pin(pin_path, setup_undo_redo = True, print_python_command = False)` -> `RigVMNode` — Ejects the last injected node on a pin
  - `enable_reporting(enabled = True)` -> `None` — Enables or disables the error reporting of this Controller.
  - `expand_library_node(node_name, setup_undo_redo = True, print_python_command = False)` -> `Array [ RigVMNode ]` — Turns a library node into its contained nodes
  - `export_node_to_text(node, include_exterior_links = False)` -> `str` — Exports the given node as text
  - `export_nodes_to_text(node_names, include_exterior_links = False)` -> `str` — Exports the given nodes as text
  - `export_selected_nodes_to_text(include_exterior_links = False)` -> `str` — Exports the selected nodes as text
  - `find_graph_function_header(function_identifier)` -> `RigVMGraphFunctionHeader` — Find Graph Function Header
  - `find_graph_function_header_by_name(host_path, function_name)` -> `RigVMGraphFunctionHeader` — Find Graph Function Header by Name
  - `find_graph_function_identifier(host_path, function_name)` -> `RigVMGraphFunctionIdentifier` — Find Graph Function Identifier
  - `find_variants_of_function(function_name)` -> `Array [ RigVMVariantRef ]` — Returns all variant refs related to the given function
  - `generate_python_commands()` -> `Array [ str ]` — Generate Python Commands
  - `get_action_stack()` -> `RigVMActionStack` — Get Action Stack
  - `get_controller_for_graph(graph)` -> `RigVMController` — Returns another controller for a given graph
  - `get_graph()` -> `RigVMGraph` — Returns the currently edited Graph of this controller.
  - `get_pin_default_value(pin_path)` -> `str` — Returns the default value of a pin given its pinpath.
  - `get_registered_templates()` -> `Array [ str ]` [classmethod] — Returns all registered template notations
  - `get_registered_unit_structs()` -> `Array [ ScriptStruct ]` [classmethod] — Returns all registered unit structs
  - `get_schema()` -> `RigVMSchema` — Returns the schema used by this controller
  - `get_template_for_unit_struct(function, method_name = 'Execute')` -> `str` [classmethod] — Returns the template for a given function (or an empty string)
  - `get_top_level_graph()` -> `RigVMGraph` — Returns the top level graph
  - `get_unit_structs_for_template(notation)` -> `Array [ ScriptStruct ]` [classmethod] — Returns all supported unit structs for a given template notation
  - `import_nodes_from_text(text, setup_undo_redo = True, print_python_commands = False)` -> `Array [ Name ]` — Exports the given nodes as text
  - `insert_array_pin(array_pin_path, index = -1, default_value = '', setup_undo_redo = True, print_python_command = False)` -> `str` — Inserts an array element pin into an array pin. This causes a PinArraySizeChanged modified event.
  - `is_function_public(function_name)` -> `bool` — Returns true if a function is marked as public in the function library
  - `is_reporting_enabled()` -> `bool` — Returns true if reporting is enabled
  - `is_transacting()` -> `bool` — Returns true if the controller is currently transacting
  - `join_function_variant(function_name, guid, setup_undo_redo = True, print_python_command = False)` -> `bool` — Merges the functionâs guid with a provided one to join the variant set
  - `localize_function(function_definition, localize_dependent_private_functions = True, setup_undo_redo = True, print_python_command = False)` -> `RigVMLibraryNode` — Localize Function
  - `localize_function_from_path(host_path, function_name, localize_dependent_private_functions = True, setup_undo_redo = True, print_python_command = False)` -> `RigVMLibraryNode` — Copies a function declaration into this graphâs local function library
  - `localize_functions(function_definitions, localize_dependent_private_functions = True, setup_undo_redo = True, print_python_command = False)` -> `Map [ RigVMGraphFunctionIdentifier , RigVMLibraryNode ]` — Copies a series of function declaratioms into this graphâs local function library
  - `make_bindings_from_variable_node(node_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Turns a variable node into one or more bindings
  - `make_options_for_workflow(subject, workflow)` -> `RigVMUserWorkflowOptions` — creates the options struct for a given workflow
  - `make_variable_node_from_binding(pin_path, node_position = [0.000000,0.000000], setup_undo_redo = True, print_python_command = False)` -> `bool` — Turns a binding to a variable node
  - `mark_function_as_public(function_name, is_public, setup_undo_redo = True, print_python_command = False)` -> `bool` — Mark a function as public/private in the function library
  - `open_undo_bracket(title)` -> `bool` — Opens an undo bracket / scoped transaction for a series of actions to be performed as one step on the Undo stack. This i...
  - `perform_user_workflow(workflow, options, setup_undo_redo = True)` -> `bool` — performs all actions representing the workflow
  - `pop_graph(setup_undo_redo = True)` -> `RigVMGraph` — Pops the last graph off the stack This causes a GraphChanged modified event. deprecated: Function has been deprecated, p...
  - `promote_collapse_node_to_function_reference_node(node_name, setup_undo_redo = True, print_python_command = False, existing_function_definition_path = '')` -> `Name` — Turns a collapse node into a function node
  - `promote_function_reference_node_to_collapse_node(node_name, setup_undo_redo = True, print_python_command = False, remove_function_definition = False)` -> `Name` — Turns a collapse node into a function node
  - `promote_pin_to_variable(pin_path, create_variable_node, node_position = [0.000000,0.000000], setup_undo_redo = True, print_python_command = False)` -> `bool` — Promotes a pin to a variable
  - `push_graph(graph, setup_undo_redo = True)` -> `bool` — Pushes a new graph to the stack This causes a GraphChanged modified event. deprecated: Function has been deprecated, ple...
  - `redo()` -> `bool` — Re-does the last action on the stack. Note: This should really only be used for unit tests, use the GEditorâs main Und...
  - `refresh_variable_node(node_name, variable_name, cpp_type, cpp_type_object, setup_undo_redo, setup_orphan_pins = True)` -> `None` — Refreshes the variable node with the new data
  - `remove_aggregate_pin(pin_path, setup_undo_redo = True, print_python_command = False)` -> `bool` — Remove Aggregate Pin
  - `remove_array_pin(array_element_pin_path, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes an array element pin from an array pin. This causes a PinArraySizeChanged modified event.
  - `remove_exposed_pin(pin_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes an exposed pin from the graph controlled by this
  - `remove_function_from_library(function_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes a function from a function library graph
  - `remove_injected_node(pin_path, as_input, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes an injected node This causes a NodeRemoved modified event.
  - `remove_local_variable(variable_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Remove a local variable from the graph
  - `remove_node(node, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes a node from the graph This causes a NodeRemoved modified event.
  - `remove_node_by_name(node_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes a node from the graph given the nodeâs name. This causes a NodeRemoved modified event.
  - `remove_nodes(nodes, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes a list of nodes from the graph This causes a NodeRemoved modified event.
  - `remove_nodes_by_name(node_names, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes a list of nodes from the graph given the names This causes a NodeRemoved modified event.
  - `remove_pin_category(node_name, pin_category, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes a pin category. The category is UI relevant only and used to order pins in the user interface of the node as wel...
  - `remove_tag_from_function_variant(function_name, tag_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Adds a tag to a function variant
  - `remove_trait(node_name, trait_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes a trait from a node
  - `rename_exposed_pin(old_pin_name, new_pin_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Renames an exposed pin in the graph controlled by this
  - `rename_function(old_function_name, new_function_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Renames a function in the function library
  - `rename_local_variable(variable_name, new_variable_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Rename a local variable from the graph
  - `rename_node(node, new_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Renames a node in the graph This causes a NodeRenamed modified event.
  - `rename_parameter(old_name, new_name, setup_undo_redo = True)` -> `bool` — Renames a parameter in the graph. This causes a ParameterRenamed modified event. deprecated: Function âRenameParameter...
  - `rename_pin_category(node_name, old_pin_category, new_pin_category, setup_undo_redo = True, print_python_command = False)` -> `bool` — Renames a pin category. The category is UI relevant only and used to order pins in the user interface of the node as wel...
  - `rename_variable(old_name, new_name, setup_undo_redo = True)` -> `bool` — Renames a variable in the graph. This causes a VariableRenamed modified event. deprecated: Function âRenameVariableâ...
  - `replace_parameter_node_with_variable(node_name, variable_name, cpp_type, cpp_type_object, setup_undo_redo)` -> `RigVMVariableNode` — Refreshes the variable node with the new data
  - `reset_default_value_for_all_pins_on_node(node_name, setup_undo = True, print_python_command = False)` -> `bool` — Resets the default value of all pins of a given node
  - `reset_default_value_for_all_pins_on_nodes(node_names, setup_undo = True, print_python_command = False)` -> `bool` — Resets the default value of all pins of a list of nodes
  - `reset_default_value_for_pins(pin_paths, setup_undo = True, print_python_command = False)` -> `bool` — Resets the default value of a list of pin given the pinpaths.
  - `reset_pin_default_value(pin_path, setup_undo_redo = True, print_python_command = False)` -> `bool` — Resets the default value of a pin given its pinpath. This causes a PinDefaultValueChanged modified event.
  - `resolve_wild_card_pin(pin_path, cpp_type, cpp_type_object_path, setup_undo_redo = True, print_python_command = False)` -> `bool` — Resolves a wildcard pin on any node
  - `select_node(node, select = True, setup_undo_redo = True, print_python_command = False)` -> `bool` — Selects a single node in the graph. This causes a NodeSelected / NodeDeselected modified event.
  - `select_node_by_name(node_name, select = True, setup_undo_redo = True)` -> `bool` — Selects a single node in the graph by name. This causes a NodeSelected / NodeDeselected modified event.
  - `set_action_stack(action_stack)` -> `None` — Set Action Stack
  - `set_array_pin_size(array_pin_path, size, default_value = '', setup_undo_redo = True, print_python_command = False)` -> `bool` — Sets the size of the array pin This causes a PinArraySizeChanged modified event.
  - `set_comment_text(node, comment_text, comment_font_size, comment_bubble_visible, comment_color_bubble, setup_undo_redo = True, print_python_command = False)` -> `bool` — Sets the comment text and properties of a comment node in the graph. This causes a CommentTextChanged modified event.
  - `set_comment_text_by_name(node_name, comment_text, comment_font_size, comment_bubble_visible, comment_color_bubble, setup_undo_redo = True, print_python_command = False)` -> `bool` — Sets the comment text and properties of a comment node in the graph by name. This causes a CommentTextChanged modified e...
  - `set_exposed_pin_index(pin_name, new_index, setup_undo_redo = True, print_python_command = False)` -> `bool` — Sets the index for an exposed pin. This can be used to move the pin up and down on the node.
  - `set_graph(graph)` -> `None` — Sets the currently edited Graph of this controller. This causes a GraphChanged modified event. deprecated: Function has ...
  - `set_is_running_unit_test(is_running)` -> `None` — Helper function to disable a series of checks that can be ignored during a unit test
  - `set_local_variable_default_value(variable_name, default_value, setup_undo_redo = True, print_python_command = False)` -> `bool` — Set Local Variable Default Value
  - `set_local_variable_type(variable_name, cpp_type, cpp_type_object, setup_undo_redo = True, print_python_command = False)` -> `bool` — Sets the type of the local variable
  - `set_local_variable_type_from_object_path(variable_name, cpp_type, cpp_type_object_path, setup_undo_redo = True, print_python_command = False)` -> `bool` — Set Local Variable Type from Object Path
  - `set_node_category(node, category, setup_undo_redo = True, merge_undo_action = False, print_python_command = False)` -> `bool` — Sets the category of a node in the graph. This causes a NodeCategoryChanged modified event.
  - `set_node_category_by_name(node_name, category, setup_undo_redo = True, merge_undo_action = False)` -> `bool` — Sets the category of a node in the graph. This causes a NodeCategoryChanged modified event.
  - `set_node_color(node, color, setup_undo_redo = True, merge_undo_action = False, print_python_command = False)` -> `bool` — Sets the color of a node in the graph. This causes a NodeColorChanged modified event.
  - `set_node_color_by_name(node_name, color, setup_undo_redo = True, merge_undo_action = False)` -> `bool` — Sets the color of a node in the graph by name. This causes a NodeColorChanged modified event.
  - `set_node_description(node, description, setup_undo_redo = True, merge_undo_action = False, print_python_command = False)` -> `bool` — Sets the function description of a node in the graph. This causes a NodeDescriptionChanged modified event.
  - `set_node_description_by_name(node_name, description, setup_undo_redo = True, merge_undo_action = False)` -> `bool` — Sets the keywords of a node in the graph. This causes a NodeDescriptionChanged modified event.
  - `set_node_keywords(node, keywords, setup_undo_redo = True, merge_undo_action = False, print_python_command = False)` -> `bool` — Sets the keywords of a node in the graph. This causes a NodeKeywordsChanged modified event.
  - `set_node_keywords_by_name(node_name, keywords, setup_undo_redo = True, merge_undo_action = False)` -> `bool` — Sets the keywords of a node in the graph. This causes a NodeKeywordsChanged modified event.
  - `set_node_layout(node_name, layout, setup_undo_redo = True, print_python_command = False)` -> `bool` — Applies a complete node layout to a node
  - `set_node_position(node, position, setup_undo_redo = True, merge_undo_action = False, print_python_command = False)` -> `bool` — Sets the position of a node in the graph. This causes a NodePositionChanged modified event.
  - `set_node_position_by_name(node_name, position, setup_undo_redo = True, merge_undo_action = False, print_python_command = False)` -> `bool` — Sets the position of a node in the graph by name. This causes a NodePositionChanged modified event.
  - `set_node_selection(node_names, setup_undo_redo = True, print_python_command = False)` -> `bool` — Selects the nodes given the selection This might cause several NodeDeselected modified event.
  - `set_node_size(node, size, setup_undo_redo = True, merge_undo_action = False, print_python_command = False)` -> `bool` — Sets the size of a node in the graph. This causes a NodeSizeChanged modified event.
  - `set_node_size_by_name(node_name, size, setup_undo_redo = True, merge_undo_action = False, print_python_command = False)` -> `bool` — Sets the size of a node in the graph by name. This causes a NodeSizeChanged modified event.
  - `set_node_title(node, node_title, setup_undo_redo = True, merge_undo_action = False, print_python_command = False)` -> `bool` — Sets the raw node title of a node in the graph. Some nodes generate customs node titles that override this setting.
  - `set_node_title_by_name(node_name, node_title, setup_undo_redo = True, merge_undo_action = False)` -> `bool` — Sets the raw node title of a node in the graph. Some nodes generate customs node titles that override this setting.
  - `set_pin_category(pin_path, category, setup_undo_redo = True, print_python_command = False)` -> `bool` — Sets the pin category. The category is UI relevant only and used to order pins in the user interface of the node as well...
  - `set_pin_category_expansion(node_name, pin_category, is_expanded, setup_undo_redo = True, print_python_command = False)` -> `bool` — Changes a pin categoryâs expansion state. The category is UI relevant only and used to order pins in the user interfac...
  - `set_pin_category_index(node_name, pin_category, new_index, setup_undo_redo = True, print_python_command = False)` -> `bool` — Changes a pin categoryâs index. The category is UI relevant only and used to order pins in the user interface of the n...
  - `set_pin_default_value(pin_path, default_value, resize_arrays = True, setup_undo_redo = True, merge_undo_action = False, print_python_command = False, set_value_on_linked_pins = True)` -> `bool` — Sets the default value of a pin given its pinpath. This causes a PinDefaultValueChanged modified event.
  - `set_pin_display_name(pin_path, display_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Sets the pin display name. The display name is UI relevant only.
  - `set_pin_expansion(pin_path, is_expanded, setup_undo_redo = True, print_python_command = False)` -> `bool` — Sets the pin to be expanded or not This causes a PinExpansionChanged modified event.
  - `set_pin_index_in_category(pin_path, index_in_category, setup_undo_redo = True, print_python_command = False)` -> `bool` — Changes a pin categoryâs expansion state. The category is UI relevant only and used to order pins in the user interfac...
  - `set_pin_is_watched(pin_path, is_watched, setup_undo_redo = True)` -> `bool` — Sets the pin to be watched (or not) This causes a PinWatchedChanged modified event.
  - `set_remapped_variable(function_ref_node, inner_variable_name, outer_variable_name, setup_undo_redo = True)` -> `bool` — Sets the remapped variable on a function reference node
  - `set_schema(schema)` -> `None` — Set Schema deprecated: Function has been deprecated, please use SetSchemaClass instead.
  - `set_schema_class(schema_class)` -> `None` — Sets the schema class on the controller
  - `set_unit_node_defaults(node, defaults, setup_undo_redo = True, print_python_command = False)` -> `bool` — Adds a Function / Struct Node to the edited Graph. UnitNode represent a RIGVM_METHOD declaration on a USTRUCT. This caus...
  - `split_function_variant(function_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Resets the functionâs guid to a new one and splits it from the former variant set
  - `swap_all_function_references(old_function_identifier, new_function_identifier, setup_orphan_pins, setup_undo_redo = True, print_python_command = False)` -> `bool` — Swap All Function References
  - `swap_function_reference(function_reference_node, new_function_identifier, setup_orphan_pins, setup_undo_redo = True, print_python_command = False)` -> `bool` — Swap Function Reference
  - `swap_function_reference_by_name(function_reference_node_name, new_function_identifier, setup_orphan_pins, setup_undo_redo = True, print_python_command = False)` -> `bool` — Swap Function Reference by Name
  - `unbind_pin_from_variable(pin_path, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes the binging of a pin to a variable This causes a PinBoundVariableChanged modified event.
  - `undo()` -> `bool` — Un-does the last action on the stack. Note: This should really only be used for unit tests, use the GEditorâs main Und...
  - `unresolve_template_nodes(node_names, setup_undo_redo = True, print_python_command = False)` -> `bool` — Turns a resolved templated node(s) back into its template.
  - `upgrade_nodes(node_names, recursive = True, setup_undo_redo = True, print_python_command = False)` -> `Array [ RigVMNode ]` — Upgrades a set of nodes with each corresponding next known version

**Properties** (1):
  - `modified_event`: `RigVMGraphModifiedDynamicEvent` [Read-Only] — [Read-Only] (RigVMGraphModifiedDynamicEvent)

### `unreal.RigVMDispatchNode`
Inherits: `RigVMTemplateNode` | Header: `RigVMDispatchNode.h`

The Struct Node represents a Function Invocation of a RIGVM_METHOD declared on a USTRUCT. Struct Nodes have input / output pins for all struct UPROPERTY members.

### `unreal.RigVMEnumNode`
Inherits: `RigVMNode` | Header: `RigVMEnumNode.h`

The Enum Node represents a constant enum value for use within the graph.

**Methods** (3):
  - `get_cpp_type()` -> `str` — Returns the C++ data type of the parameter
  - `get_cpp_type_object()` -> `Object` — Returns the C++ data type struct of the parameter (or nullptr)
  - `get_enum()` -> `Enum` — Returns the enum itself

### `unreal.RigVMFunctionEntryNode`
Inherits: `RigVMFunctionInterfaceNode` | Header: `RigVMFunctionEntryNode.h`

The Function Entry node is used to provide access to the input pins of the library node for links within.

### `unreal.RigVMFunctionInterfaceNode`
Inherits: `RigVMTemplateNode` | Header: `RigVMFunctionInterfaceNode.h`

The Function Interface node is is used as the base class for both the entry and return nodes.

### `unreal.RigVMFunctionLibrary`
Inherits: `RigVMGraph` | Header: `RigVMFunctionLibrary.h`

The Function Library is a graph used only to store the sub graphs used for functions.

**Methods** (5):
  - `find_function(function_name)` -> `RigVMLibraryNode` — Finds a function by name
  - `find_function_for_node(node)` -> `RigVMLibraryNode` — Finds a function by a node within a function (or a sub graph of that)
  - `get_functions()` -> `Array [ RigVMLibraryNode ]` — Returns all of the stored functions
  - `get_reference_paths_for_function(function_name)` -> `Array [ str ]` — Returns all references for a given function name
  - `get_references_for_function(function_name)` -> `Array [ RigVMFunctionReferenceNode ]` — Returns all references for a given function name

### `unreal.RigVMFunctionReferenceNode`
Inherits: `RigVMLibraryNode` | Header: `RigVMFunctionReferenceNode.h`

The Function Reference Node is a library node which references a library node from a separate function library graph.

**Methods** (1):
  - `get_referenced_function_header()` -> `RigVMGraphFunctionHeader` — Get Referenced Function Header for Blueprint

**Properties** (1):
  - `referenced_node_ptr`: `RigVMLibraryNode` — [Read-Write]
deprecated: Property âReferencedNodePtrâ is deprecated. (RigVMLibraryNode)

### `unreal.RigVMFunctionReturnNode`
Inherits: `RigVMFunctionInterfaceNode` | Header: `RigVMFunctionReturnNode.h`

The Function Return node is used to provide access to the output pins of the library node for links within.

### `unreal.RigVMGraph`
Inherits: `Object` | Header: `RigVMGraph.h`

The Graph represents a Function definition using Nodes as statements. Graphs can be compiled into a URigVM using the FRigVMCompiler. Graphs provide access to its Nodes, Pins and Links.

**Methods** (29):
  - `contains_link(pin_path_representation)` -> `bool` — Returns true if the graph contains a link given its string representation
  - `find_link(link_pin_path_representation)` -> `RigVMLink` — Returns a link given its string representation, for example âNodeA.Color.R -> NodeB.Translation.Xâ
  - `find_node(node_path)` -> `RigVMNode` — Returns a Node given its path (or nullptr). (for now this is the same as finding a node by its name.)
  - `find_node_by_name(node_name)` -> `RigVMNode` — Returns a Node given its name (or nullptr).
  - `find_pin(pin_path)` -> `RigVMPin` — Returns a Pin given its path, for example âNode.Color.Râ.
  - `get_contained_graphs(recursive = False)` -> `Array [ RigVMGraph ]` — Returns all of the contained graphs
  - `get_default_function_library()` -> `RigVMFunctionLibrary` — Returns the locally available function library
  - `get_entry_node()` -> `RigVMFunctionEntryNode` — Returns the entry node of this graph
  - `get_event_names()` -> `Array [ Name ]` — Returns array of event names
  - `get_graph_depth()` -> `int32` — Returns the root / top level parent graph of this graph (or this if it is the root graph)
  - `get_graph_name()` -> `str` — Returns the name of this graph (as defined by the node path)
  - `get_input_arguments()` -> `Array [ RigVMGraphVariableDescription ]` — Returns the input arguments of this graph
  - `get_links()` -> `Array [ RigVMLink ]` — Returns all of the Links within this Graph.
  - `get_local_variables(include_input_arguments = False)` -> `Array [ RigVMGraphVariableDescription ]` — Returns the local variables of this function
  - `get_node_path()` -> `str` — Returns the path of this graph as defined by its invoking nodes
  - `get_nodes()` -> `Array [ RigVMNode ]` — Returns all of the Nodes within this Graph.
  - `get_output_arguments()` -> `Array [ RigVMGraphVariableDescription ]` — Returns the output arguments of this graph
  - `get_parent_graph()` -> `RigVMGraph` — Returns the parent graph of this graph
  - `get_return_node()` -> `RigVMFunctionReturnNode` — Returns the return node of this graph
  - `get_root_graph()` -> `RigVMGraph` — Returns the root / top level parent graph of this graph (or this if it is the root graph)
  - `get_schema()` -> `RigVMSchema` — Returns the schema used by this graph
  - `get_schema_class()` — Returns the schema class used by this graph
  - `get_select_nodes()` -> `Array [ Name ]` — Returns the names of all currently selected Nodes.
  - `get_variable_descriptions()` -> `Array [ RigVMGraphVariableDescription ]` — Returns a list of unique Variable descriptions within this Graph. Multiple Variable Nodes can share the same description...
  - `is_node_selected(node_name)` -> `bool` — Returns true if a Node with a given name is selected.
  - `is_root_graph()` -> `bool` — Returns true if this graph is a root / top level graph
  - `is_top_level_graph()` -> `bool` — Returns true if this graph is the top level graph
  - `set_default_function_library(function_library)` -> `None` — Set Default Function Library
  - `set_schema_class(schema_class)` -> `None` — Sets the schema class on the graph

### `unreal.RigVMIfNode`
Inherits: `RigVMTemplateNode` | Header: `RigVMIfNode.h`

A if node is used to pick between two values

### `unreal.RigVMInjectionInfo`
Inherits: `Object` | Header: `RigVMPin.h`

The Injected Info is used for injecting a node on a pin. Injected nodes are not visible to the user, but they are normal nodes on the graph.

**Methods** (2):
  - `get_graph()` -> `RigVMGraph` — Returns the graph of this injected node.
  - `get_pin()` -> `RigVMPin` — Returns the pin of this injected node.

### `unreal.RigVMInvokeEntryNode`
Inherits: `RigVMNode` | Header: `RigVMInvokeEntryNode.h`

The Invoke Entry Node is used to invoke another entry from the the currently running entry.

**Methods** (1):
  - `get_entry_name()` -> `Name` — Returns the name of the entry to run

### `unreal.RigVMLibraryNode`
Inherits: `RigVMTemplateNode` | Header: `RigVMLibraryNode.h`

The Library Node represents a function invocation of a function specified somewhere else. The function can be expressed as a sub-graph (RigVMGroupNode) or as a referenced function (RigVMFunctionNode).

**Methods** (5):
  - `get_contained_graph()` -> `RigVMGraph` — Get Contained Graph
  - `get_function_variant()` -> `RigVMVariant` — Get Function Variant
  - `get_function_variant_ref()` -> `RigVMVariantRef` — Get Function Variant Ref
  - `get_library()` -> `RigVMFunctionLibrary` — Get Library
  - `get_matching_variants()` -> `Array [ RigVMVariantRef ]` — Get Matching Variants

### `unreal.RigVMLink`
Inherits: `Object` | Header: `RigVMLink.h`

The Link represents a connection between two Pins within a Graph. The Link can be accessed on the Graph itself - or through the URigVMPin::GetLinks() method.

**Methods** (9):
  - `get_graph()` -> `RigVMGraph` — Returns the Linkâs owning Graph/
  - `get_graph_depth()` -> `int32` — Returns the graph nesting depth of this link
  - `get_link_index()` -> `int32` — Returns the current index of this Link within its owning Graph.
  - `get_opposite_pin(pin)` -> `RigVMPin` — Returns the opposite Pin of this Link given one of its edges (or nullptr)
  - `get_pin_path_representation()` -> `str` — Returns a string representation of the Link, for example: âNodeA.Color.R -> NodeB.Translation.Xâ note: can be split ...
  - `get_source_node()` -> `RigVMNode` — Returns the source Node of this Link (or nullptr)
  - `get_source_pin()` -> `RigVMPin` — Returns the source Pin of this Link (or nullptr)
  - `get_target_node()` -> `RigVMNode` — Returns the target Node of this Link (or nullptr)
  - `get_target_pin()` -> `RigVMPin` — Returns the target Pin of this Link (or nullptr)

### `unreal.RigVMNode`
Inherits: `Object` | Header: `RigVMNode.h`

The Node represents a single statement within a Graph. Nodes can represent values such as Variables / Parameters, they can represent Function Invocations or Control Flow logic statements (such as If c...

**Methods** (65):
  - `can_be_upgraded()` -> `bool` — returns true if the node can be upgraded
  - `can_only_exist_once()` -> `bool` — Returns true if this node can only exist once in a graph
  - `execution_is_halted_at_this_node()` -> `bool` — Execution Is Halted at This Node
  - `find_execute_pin()` -> `RigVMPin` — Returns the first execute pin
  - `find_function_for_node()` -> `RigVMLibraryNode` — Find Function for Node
  - `find_pin(pin_path)` -> `RigVMPin` — Returns a Pin given itâs partial pin path below this node (for example: âColor.Râ)
  - `find_root_pin_by_name(pin_name)` -> `RigVMPin` — Returns a root pin given its name
  - `get_aggregate_inputs()` -> `Array [ RigVMPin ]` — Get Aggregate Inputs
  - `get_aggregate_outputs()` -> `Array [ RigVMPin ]` — Get Aggregate Outputs
  - `get_all_pins_recursively()` -> `Array [ RigVMPin ]` — Returns all of the Pins of this Node (including SubPins).
  - `get_event_name()` -> `Name` — Returns the name of the event
  - `get_first_aggregate_pin()` -> `RigVMPin` — Get First Aggregate Pin
  - `get_graph()` -> `RigVMGraph` — Returns the Graph of this Node
  - `get_graph_depth()` -> `int32` — Returns the graph nesting depth of this node
  - `get_injection_info()` -> `RigVMInjectionInfo` — Returns the injection info of this Node (or nullptr)
  - `get_linked_source_nodes()` -> `Array [ RigVMNode ]` — Returns a list of Nodes connected as sources to this Node as the target.
  - `get_linked_target_nodes()` -> `Array [ RigVMNode ]` — Returns a list of Nodes connected as targets to this Node as the source.
  - `get_links()` -> `Array [ RigVMLink ]` — Returns all links to any pin on this node
  - `get_next_aggregate_name(last_aggregate_pin_name)` -> `Name` — Get Next Aggregate Name
  - `get_node_color()` -> `LinearColor` — Returns the color of this node - used for UI.
  - `get_node_index()` -> `int32` — Returns the current index of the Node within the Graph.
  - `get_node_layout(include_empty_categories = False)` -> `RigVMNodeLayout` — Returns the pin UI layout for this node
  - `get_node_path(recursive = False)` -> `str` — Returns the a . separated string containing all of the names used to reach this Node within the Graph. (for now this is ...
  - `get_node_title()` -> `str` — Returns the title of this Node - used for UI.
  - `get_opposite_aggregate_pin()` -> `RigVMPin` — Get Opposite Aggregate Pin
  - `get_orphaned_pins()` -> `Array [ RigVMPin ]` — Returns all of the top-level orphaned Pins of this Node.
  - `get_parent_pin_categories(category, only_existing = False, include_self = False)` -> `Array [ str ]` — Returns all parent categories of a given
  - `get_parent_pin_category(category, only_existing = False)` -> `str` — Returns the parent pin category of the given category (or an empty string in case thereâs no parent)
  - `get_pin_categories()` -> `Array [ str ]` — Returns all user defined categories on this node
  - `get_pin_category_name(category)` -> `str` — Returns the name of pin category
  - `get_pins()` -> `Array [ RigVMPin ]` — Returns all of the top-level Pins of this Node.
  - `get_pins_for_category(category)` -> `Array [ RigVMPin ]` — Returns all pins for a given category
  - `get_position()` -> `Vector2D` — Returns the 2d position of this node - used for UI.
  - `get_previous_f_name()` -> `Name` — Returns the name of the node prior to the renaming
  - `get_root_graph()` -> `RigVMGraph` — Returns the top level / root Graph of this Node
  - `get_second_aggregate_pin()` -> `RigVMPin` — Get Second Aggregate Pin
  - `get_size()` -> `Vector2D` — Returns the 2d size of this node - used for UI.
  - `get_sub_pin_categories(category, only_existing = False, recursive = False)` -> `Array [ str ]` — Returns all sub user defined categories of a given parent category
  - `get_supported_workflows(type, subject)` -> `Array [ RigVMUserWorkflow ]` — returns all supported workflows of the node
  - `get_tool_tip_text()` -> `Text` — Returns the tooltip of this node
  - `get_trait_pins()` -> `Array [ RigVMPin ]` — Get Trait Pins
  - `has_breakpoint()` -> `bool` — Has Breakpoint
  - `has_input_pin(include_io = True)` -> `bool` — Returns true if the node has any input pins
  - `has_io_pin()` -> `bool` — Returns true if the node has any io pins
  - `has_lazy_pin(only_consider_pins_with_links = False)` -> `bool` — Returns true if the node has any lazily evaluating pins
  - `has_orphaned_pins()` -> `bool` — Returns true if the node has orphaned pins - which leads to a compiler error
  - `has_output_pin(include_io = True)` -> `bool` — Returns true if the node has any output pins
  - `has_pin_of_direction(direction)` -> `bool` — Returns true if the node has any pins of the provided direction
  - `is_aggregate()` -> `bool` — Is Aggregate
  - `is_control_flow_node()` -> `bool` — return true if this node is a control flow node
  - `is_defined_as_constant()` -> `bool` — Returns true if the node is defined as non-varying
  - `is_defined_as_varying()` -> `bool` — Returns true if the node is defined as non-varying
  - `is_event()` -> `bool` — Returns true if this Node is the beginning of a scope
  - `is_injected()` -> `bool` — Returns true if this is an injected node. Injected nodes are managed by pins are are not visible to the user.
  - `is_input_aggregate()` -> `bool` — Is Input Aggregate
  - `is_linked_to(node)` -> `bool` — Returns true if this Node is linked to another given node through any of the Nodesâ Pins.
  - `is_loop_node()` -> `bool` — return true if this node is a loop node
  - `is_mutable()` -> `bool` — Returns true if this Node has side effects or internal state.
  - `is_pin_category_expanded(category)` -> `bool` — Returns all pins for a given category
  - `is_pure()` -> `bool` — Returns true if this Node has no side-effects and no internal state.
  - `is_selected()` -> `bool` — Returns true if this Node is currently selected.
  - `is_trait_pin(name)` -> `bool` — Is Trait Pin
  - `is_visible_in_ui()` -> `bool` — Returns true if this should be visible in the UI
  - `set_execution_is_halted_at_this_node(value)` -> `None` — Set Execution Is Halted at This Node
  - `set_has_breakpoint(value)` -> `None` — Set Has Breakpoint

### `unreal.RigVMParameterNode`
Inherits: `RigVMNode` | Header: `RigVMParameterNode.h`

The Parameter Node represents an input or output argument / parameter of the Function / Graph. Parameter Node have only a single value pin.

**Methods** (6):
  - `get_cpp_type()` -> `str` — Returns the C++ data type of the parameter
  - `get_cpp_type_object()` -> `Object` — Returns the C++ data type struct of the parameter (or nullptr)
  - `get_default_value()` -> `str` — Returns the default value of the parameter as a string
  - `get_parameter_description()` -> `RigVMGraphParameterDescription` — Returns this parameter nodeâs parameter description
  - `get_parameter_name()` -> `Name` — Returns the name of the parameter
  - `is_input()` -> `bool` — Returns true if this node is an input

### `unreal.RigVMPin`
Inherits: `Object` | Header: `RigVMPin.h`

The Pin represents a single connector / pin on a node in the RigVM model. Pins can be connected based on rules. Pins also provide access to a âPinPathâ, which essentially represents . separated li...

**Methods** (65):
  - `can_provide_default_value()` -> `bool` — Returns true if the pin can / may provide a default value
  - `contains_wild_card_sub_pin()` -> `bool` — Returns true if any of the subpins is a wildcard
  - `find_link_for_pin(other_pin)` -> `RigVMLink` — Returns the link that represents the connection between this pin and InOtherPin. nullptr is returned if the pins are not...
  - `find_sub_pin(pin_path)` -> `RigVMPin` — Returns a SubPin given a name / path or nullptr.
  - `get_absolute_pin_index()` -> `int32` — Returns the absolute index of the Pin within the node / parent Pin
  - `get_all_sub_pins_recursively()` -> `Array [ RigVMPin ]` — Returns all of the SubPins of this one including sub-sub-pins
  - `get_array_element_cpp_type()` -> `str` — Returns the C++ data type of an element of the Pin array
  - `get_array_size()` -> `int32` — Returns the number of elements within an array Pin
  - `get_category()` -> `str` — Returns the category on a pin. The category is UI relevant only and used to order pins in the user interface of the node...
  - `get_cpp_type()` -> `str` — Returns the C++ data type of the pin
  - `get_cpp_type_object()` -> `Object` — Returns the struct of the data type of the Pin, or nullptr otherwise.
  - `get_custom_widget_name()` -> `Name` — Returns the name of a custom widget to be used for editing the Pin.
  - `get_default_value()` -> `str` — Returns the default value of the Pin as a string. Note that this value is computed based on the Pinâs SubPins - so for...
  - `get_default_value_type()` -> `RigVMPinDefaultValueType` — Returns true if the pin can / may provide a default value
  - `get_direction()` -> `RigVMPinDirection` — Returns the direction of the pin
  - `get_display_name()` -> `Name` — Returns the display label of the pin
  - `get_enum()` -> `Enum` — Returns the enum of the data type of the Pin, or nullptr otherwise.
  - `get_graph()` -> `RigVMGraph` — Returns the graph of this Pin.
  - `get_index_in_category()` -> `int32` — Returns index within a category on a pin. The category is UI relevant only and used to order pins in the user interface ...
  - `get_linked_source_pins(recursive = False)` -> `Array [ RigVMPin ]` — Returns all of the linked source Pins, using this Pin as the target.
  - `get_linked_target_pins(recursive = False)` -> `Array [ RigVMPin ]` — Returns all of the linked target Pins, using this Pin as the source.
  - `get_links()` -> `Array [ RigVMLink ]` — Returns all of the links linked to this Pin.
  - `get_meta_data(key)` -> `str` — Returns the keyed metadata associated with this pin, if any
  - `get_node()` -> `RigVMNode` — Returns the node of this Pin.
  - `get_original_default_value()` -> `str` — Get Original Default Value
  - `get_original_pin_from_injected_node()` -> `RigVMPin` — Returns the original pin for a pin on an injected node. This can be used to determine where a link should go in the user...
  - `get_parent_pin()` -> `RigVMPin` — Returns the parent Pin - or nullptr if the Pin is nested directly below a node.
  - `get_parent_script_struct(fallback_node)` -> `ScriptStruct` — Returns the parent struct of the data type of the Pin
  - `get_pin_for_link()` -> `RigVMPin` — Returns the pin to be used for a link. This might differ from this actual pin, since the pin might contain injected node...
  - `get_pin_index()` -> `int32` — Returns the index of the Pin within the node / parent Pin
  - `get_pin_path(use_node_path = False)` -> `str` — Returns a . separated path containing all names of the pin and its owners, this includes the node name, for example âN...
  - `get_root_pin()` -> `RigVMPin` — Returns the top-most parent Pin, so for example for âNode.Transform.Translation.Xâ this returns the Pin for âNode....
  - `get_script_struct()` -> `ScriptStruct` — Returns the struct of the data type of the Pin, or nullptr otherwise.
  - `get_segment_path(include_root_pin = False)` -> `str` — Returns a . separated path containing all names of the pin within its main memory owner / storage. This is typically use...
  - `get_source_links(recursive = False)` -> `Array [ RigVMLink ]` — Returns all of the source pins using this Pin as the target.
  - `get_sub_pin_path(parent_pin, include_parent_pin_name = False)` -> `str` — Returns a . separated path containing all names of the pin and its owners until we hit the provided parent pin.
  - `get_sub_pins()` -> `Array [ RigVMPin ]` — Returns all of the SubPins of this one.
  - `get_target_links(recursive = False)` -> `Array [ RigVMLink ]` — Returns all of the target links, using this Pin as the source.
  - `get_tool_tip_text()` -> `Text` — Returns the tooltip of this pin
  - `has_default_value_override()` -> `bool` — Returns true if the default value was ever changed by the user
  - `has_original_default_value()` -> `bool` — Has Original Default Value
  - `has_user_provided_default_value()` -> `bool` — Has User Provided Default Value
  - `is_array()` -> `bool` — Returns true if the data type of the Pin is an array
  - `is_array_element()` -> `bool` — Returns true if the Pin is a SubPin within an array
  - `is_defined_as_constant()` -> `bool` — Returns true if the pin is defined as a constant value / literal
  - `is_dynamic_array()` -> `bool` — Returns true if this pin represents a dynamic array
  - `is_enum()` -> `bool` — Returns true if the data type of the Pin is a enum
  - `is_execute_context()` -> `bool` — Returns true if the C++ data type is an execute context
  - `is_expanded()` -> `bool` — Returns true if the pin is currently expanded
  - `is_fixed_size_array()` -> `bool` — Returns true if this pin is an array that should be displayed as elements only
  - `is_interface()` -> `bool` — Returns true if the data type of the Pin is a interface
  - `is_lazy()` -> `bool` — Returns true if this pinâs value may be executed lazily
  - `is_linked_to(pin)` -> `bool` — Returns true if this Pin is linked to another Pin
  - `is_reference_counted_container()` -> `bool` — Returns true if this data type is referenced counted
  - `is_root_pin()` -> `bool` — Returns true if this pin is a root pin
  - `is_string_type()` -> `bool` — Returns true if the C++ data type is FString or FName
  - `is_struct()` -> `bool` — Returns true if the data type of the Pin is a struct
  - `is_struct_member()` -> `bool` — Returns true if the Pin is a SubPin within a struct
  - `is_trait_pin()` -> `bool` — Returns true if this pin represents a trait
  - `is_u_object()` -> `bool` — Returns true if the data type of the Pin is a uobject
  - `is_valid_default_value(default_value)` -> `bool` — Returns true if the default value provided is valid
  - `is_wild_card()` -> `bool` — Returns true if the C++ data type is unknown
  - `requires_watch(check_exposed_pin_chain = False)` -> `bool` — Returns true if the pin should be watched
  - `should_hide_sub_pins()` -> `bool` — Returns true if this pinâs subpins should be hidden in the UI
  - `should_only_show_sub_pins()` -> `bool` — Returns true if this pin is an array that should be displayed as elements only

### `unreal.RigVMRerouteNode`
Inherits: `RigVMNode` | Header: `RigVMRerouteNode.h`

A reroute node is used to visually improve the data flow within a Graph. Reroutes are purely cosmetic and have no impact on the resulting VM whatsoever. Reroutes can furthermore be displayed as full n...

### `unreal.RigVMSchema`
Inherits: `Object` | Header: `RigVMSchema.h`

The Schema is used to determine which actions are allowed on a graph. This includes any topological change.

### `unreal.RigVMSelectNode`
Inherits: `RigVMTemplateNode` | Header: `RigVMSelectNode.h`

A select node is used to select between multiple values

### `unreal.RigVMTemplateNode`
Inherits: `RigVMNode` | Header: `RigVMTemplateNode.h`

The Template Node represents an unresolved function. Template nodes can morph into all functions implementing the templateâs template.

**Methods** (5):
  - `get_notation()` -> `Name` — Returns the notation of the node
  - `get_script_struct()` -> `ScriptStruct` — Returns the UStruct for this unit node (the struct declaring the RIGVM_METHOD)
  - `is_fully_unresolved()` -> `bool` — returns true if the template is fully unresolved
  - `is_resolved()` -> `bool` — returns true if the template node is resolved
  - `is_singleton()` -> `bool` — Is Singleton

### `unreal.RigVMUnitNode`
Inherits: `RigVMTemplateNode` | Header: `RigVMUnitNode.h`

The Struct Node represents a Function Invocation of a RIGVM_METHOD declared on a USTRUCT. Struct Nodes have input / output pins for all struct UPROPERTY members.

**Methods** (2):
  - `get_method_name()` -> `Name` — Returns the name of the declared RIGVM_METHOD
  - `get_struct_default_value()` -> `str` — Returns the default value for the struct as text

### `unreal.RigVMUserWorkflowRegistry`
Inherits: `Object` | Header: `RigVMUserWorkflowRegistry.h`

Rig VMUser Workflow Registry

**Methods** (4):
  - `get()` -> `RigVMUserWorkflowRegistry` [classmethod] — Get
  - `get_workflows(type, struct, subject)` -> `Array [ RigVMUserWorkflow ]` — Get Workflows
  - `register_provider(struct, provider)` -> `int32` — Register Provider
  - `unregister_provider(handle)` -> `None` — Unregister Provider

### `unreal.RigVMVariableNode`
Inherits: `RigVMNode` | Header: `RigVMVariableNode.h`

The Variable Node represents a mutable value / local state within the the Function / Graph. Variable Nodeâs can be a getter or a setter. Getters are pure nodes with just an output value pin, while s...

**Methods** (9):
  - `get_cpp_type()` -> `str` — Returns the C++ data type of the variable
  - `get_cpp_type_object()` -> `Object` — Returns the C++ data type struct of the variable (or nullptr)
  - `get_default_value()` -> `str` — Returns the default value of the variable as a string
  - `get_variable_description()` -> `RigVMGraphVariableDescription` — Returns this variable nodeâs variable description
  - `get_variable_name()` -> `Name` — Returns the name of the variable
  - `is_external_variable()` -> `bool` — Returns true if this variable is an external variable
  - `is_getter()` -> `bool` — Returns true if this node is a variable getter
  - `is_input_argument()` -> `bool` — Returns true if this variable is an input argument
  - `is_local_variable()` -> `bool` — Returns true if this variable is a local variable

### `unreal.RigVMGraphNotifType`
Inherits: `EnumBase` | Header: `RigVMNotifications.h`

The Graph Notification Type is used to differentiate between all of the changes that can happen within a graph.

**Properties** (46):
  - `COMMENT_TEXT_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A link has been removed (Subject == URigVMLink) 22
  - `FUNCTION_ACCESS_CHANGED`: `RigVMGraphNotifType = Ellipsis` — The definition of a library nodeâs template has changed (Subject == URigVMLibraryNode) 38
  - `FUNCTION_RENAMED`: `RigVMGraphNotifType = Ellipsis` — A node has been renamed in the graph (Subject == URigVMNode) 31
  - `FUNCTION_VARIANT_GUID_CHANGED`: `RigVMGraphNotifType = Ellipsis` — The category of a pin expanded / collapsed (Subject == URigVMNode) 44
  - `GRAPH_CHANGED`: `RigVMGraphNotifType = Ellipsis` — 0
  - `INTERACTION_BRACKET_CANCELED`: `RigVMGraphNotifType = Ellipsis` — A bracket has been opened (Subject == nullptr) 28
  - `INTERACTION_BRACKET_CLOSED`: `RigVMGraphNotifType = Ellipsis` — A bracket has been opened (Subject == nullptr) 27
  - `INTERACTION_BRACKET_OPENED`: `RigVMGraphNotifType = Ellipsis` — A variable has been renamed (Subject == URigVMVariableNode) 26
  - `INVALID`: `RigVMGraphNotifType = Ellipsis` — The guid for a function has changed (Subject == URigVMLibraryNode) 45
  - `LIBRARY_TEMPLATE_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A function reference nodeâs remapping has changed (Subject == URigVMFunctionReferenceNode) 37
  - `LINK_ADDED`: `RigVMGraphNotifType = Ellipsis` — A pinâs index has changed (Subject == URigVMPin) 20
  - `LINK_REMOVED`: `RigVMGraphNotifType = Ellipsis` — A link has been added (Subject == URigVMLink) 21
  - `NODE_ADDED`: `RigVMGraphNotifType = Ellipsis` — The graph has changed / a new graph has been picked (Subject == nullptr) 1
  - `NODE_CATEGORY_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A node has changed itâs referenced function 33
  - `NODE_COLOR_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A nodeâs title has changed (Subject == URigVMNode) 9
  - `NODE_DESCRIPTION_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A nodeâs keywords have changed (Subject == URigVMNode) 35
  - `NODE_DESELECTED`: `RigVMGraphNotifType = Ellipsis` — A node has been selected (Subject == URigVMNode) 4
  - `NODE_KEYWORDS_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A nodeâs category has changed (Subject == URigVMNode) 34
  - `NODE_POSITION_CHANGED`: `RigVMGraphNotifType = Ellipsis` — The set of selected nodes has changed (Subject == nullptr) 6
  - `NODE_REFERENCE_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A function has been renamed in the graph (Subject == URigVMLibraryNode) 32
  - `NODE_REMOVED`: `RigVMGraphNotifType = Ellipsis` — A node has been added to the graph (Subject == URigVMNode) 2
  - `NODE_RENAMED`: `RigVMGraphNotifType = Ellipsis` — A pin has been bound or unbound to / from a variable (Subject == URigVMPin) 30
  - `NODE_SELECTED`: `RigVMGraphNotifType = Ellipsis` — A node has been removed from the graph (Subject == URigVMNode) 3
  - `NODE_SELECTION_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A node has been deselected (Subject == URigVMNode) 5
  - `NODE_SIZE_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A nodeâs position has changed (Subject == URigVMNode) 7
  - `NODE_TITLE_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A nodeâs size has changed (Subject == URigVMNode) 8
  - `PIN_ADDED`: `RigVMGraphNotifType = Ellipsis` — A nodeâs color has changed (Subject == URigVMNode) 10
  - `PIN_ARRAY_SIZE_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A pinâs watch state has changed (Subject == URigVMPin) 15
  - `PIN_BOUND_VARIABLE_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A bracket has been canceled (Subject == nullptr) 29
  - `PIN_CATEGORIES_CHANGED`: `RigVMGraphNotifType = Ellipsis` — The category of a pin has changed - requiring a rebuild of the node user interface (Subject == URigV...
  - `PIN_CATEGORY_CHANGED`: `RigVMGraphNotifType = Ellipsis` — The display name of a pin has changed - requiring a rebuild of the node user interface (Subject == U...
  - `PIN_CATEGORY_EXPANSION_CHANGED`: `RigVMGraphNotifType = Ellipsis` — The category list of a node has changed - requiring a rebuild of the node user interface (Subject ==...
  - `PIN_DEFAULT_VALUE_CHANGED`: `RigVMGraphNotifType = Ellipsis` — An array pinâs size has changed (Subject == URigVMPin) 16
  - `PIN_DIRECTION_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A pinâs default value has changed (Subject == URigVMPin) 17
  - `PIN_DISPLAY_NAME_CHANGED`: `RigVMGraphNotifType = Ellipsis` — The tags in the header of this function variant have changed (Subject == URigVMLibraryNode) 40
  - `PIN_EXPANSION_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A pin has been renamed (Subject == URigVMPin) 13
  - `PIN_INDEX_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A pinâs data type has changed (Subject == URigVMPin) 19
  - `PIN_REMOVED`: `RigVMGraphNotifType = Ellipsis` — A pin has been added to a given node (Subject == URigVMPin) 11
  - `PIN_RENAMED`: `RigVMGraphNotifType = Ellipsis` — A pin has been removed from a given node (Subject == URigVMPin) 12
  - `PIN_TYPE_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A pinâs direction has changed (Subject == URigVMPin) 18
  - `PIN_WATCHED_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A pinâs expansion state has changed(Subject == URigVMPin) 14
  - `VARIABLE_ADDED`: `RigVMGraphNotifType = Ellipsis` — A comment nodeâs text has changed (Subject == URigVMCommentNode) 23
  - `VARIABLE_REMAPPING_CHANGED`: `RigVMGraphNotifType = Ellipsis` — A nodeâs description has changed (Subject == URigVMNode) 36
  - `VARIABLE_REMOVED`: `RigVMGraphNotifType = Ellipsis` — A variable has been added (Subject == URigVMVariableNode) 24
  - `VARIABLE_RENAMED`: `RigVMGraphNotifType = Ellipsis` — A variable has been removed (Subject == URigVMVariableNode) 25
  - `VARIANT_TAGS_CHANGED`: `RigVMGraphNotifType = Ellipsis` — The function has been made public/private (Subject == URigVMLibraryNode) 39

### `unreal.RigVMPinDefaultValueType`
Inherits: `EnumBase` | Header: `RigVMPin.h`

ERig VMPin Default Value Type

**Properties** (4):
  - `AUTO_DETECT`: `RigVMPinDefaultValueType = Ellipsis` — 0
  - `KEEP_VALUE_TYPE`: `RigVMPinDefaultValueType = Ellipsis` — The value is overridden by the user and should stay like this no matter what 3
  - `OVERRIDE`: `RigVMPinDefaultValueType = Ellipsis` — The value is unchanged and will remain the original default 2
  - `UNSET`: `RigVMPinDefaultValueType = Ellipsis` — Detect if this is an unchanged or overridden value based on the delta 1

### `unreal.RigVMTagDisplayMode`
Inherits: `EnumBase` | Header: `RigVMBlueprint.h`

ERig VMTag Display Mode

**Properties** (3):
  - `ALL`: `RigVMTagDisplayMode = Ellipsis` — 1
  - `DEPRECATION_ONLY`: `RigVMTagDisplayMode = Ellipsis` — 2
  - `NONE`: `RigVMTagDisplayMode = Ellipsis` — 0

### `unreal.RigVMGraphModifiedDynamicEvent`
Inherits: `MulticastDelegateBase` | Header: `RigVMNotifications.h`

A dynamic delegate for subscribing / reacting to graph modifications (used for Python integration).

### `unreal.RigVMUserWorkflowProvider`
Inherits: `DelegateBase` | Header: `RigVMUserWorkflowRegistry.h`

Rig VMUser Workflow Provider Delegate Signature
