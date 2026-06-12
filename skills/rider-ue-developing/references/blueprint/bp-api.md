# Blueprint Python API Reference (UE 5.7)

## Key Classes

### unreal.BlueprintEditorLibrary

Primary API for programmatic Blueprint manipulation.

```python
bp_lib = unreal.BlueprintEditorLibrary
```

### What CAN and CANNOT Be Done in UE 5.7

| Capability | Status | API |
|------------|--------|-----|
| Create Blueprint asset | YES | `AssetToolsHelpers.get_asset_tools().create_asset()` |
| Set parent class | YES | `BlueprintFactory.set_editor_property('parent_class', ...)` |
| Reparent existing Blueprint | YES | `reparent_blueprint(bp, new_parent)` |
| Add member variables | YES | `add_member_variable(bp, name, EdGraphPinType)` |
| Set variable defaults | YES | Via CDO after compile |
| Set instance editable | YES | `set_blueprint_variable_instance_editable()` |
| Set expose on spawn | YES | `set_blueprint_variable_expose_on_spawn()` |
| Set expose to cinematics | YES | `set_blueprint_variable_expose_to_cinematics()` |
| Add components | YES | Via `SubobjectDataSubsystem.add_new_subobject()` |
| Configure component properties | YES | Via `load_object()` on component template |
| Add function graphs (empty) | YES | `add_function_graph(bp, name)` |
| Remove function graphs | YES | `remove_function_graph(bp, name)` |
| Find graphs by name | YES | `find_event_graph(bp)`, `find_graph(bp, name)` |
| Rename graphs | YES | `rename_graph(bp, old_name, new_name)` |
| Remove graphs | YES | `remove_graph(bp, name)` |
| Remove unused variables | YES | `remove_unused_variables(bp)` |
| Remove unused nodes | YES | `remove_unused_nodes(bp)` |
| Replace variable references | YES | `replace_variable_references(bp, old_name, new_name)` |
| Get generated class | YES | `generated_class(bp)` |
| Compile Blueprint | YES | `compile_blueprint(bp)` |
| Save Blueprint | YES | `EditorAssetLibrary.save_asset()` |
| Spawn BP in level | YES | `EditorActorSubsystem.spawn_actor_from_class()` |
| Add nodes to graphs | YES | `RiderAgentBridgeLibrary.add_blueprint_node()` |
| Wire pins between nodes | YES | `RiderAgentBridgeLibrary.connect_blueprint_pins()` |
| Remove individual nodes | YES | `RiderAgentBridgeLibrary.remove_blueprint_node()` |
| Get all nodes + pins | YES | `RiderAgentBridgeLibrary.get_blueprint_graph_nodes()` |
| Get all graphs | YES | `RiderAgentBridgeLibrary.get_all_blueprint_graphs()` |
| Export nodes (clipboard) | YES | `RiderAgentBridgeLibrary.export_blueprint_nodes()` |
| Import nodes (clipboard) | YES | `RiderAgentBridgeLibrary.import_blueprint_nodes()` |
| Add variables (typed) | YES | `RiderAgentBridgeLibrary.add_blueprint_variable()` |
| Set pin default values | YES | `RiderAgentBridgeLibrary.set_pin_default_value()` |
| Set variable categories | YES | `RiderAgentBridgeLibrary.set_blueprint_variable_category()` |
| Set variable defaults | YES | `RiderAgentBridgeLibrary.set_blueprint_variable_default_value()` |
| Remove individual variables | YES | `RiderAgentBridgeLibrary.remove_blueprint_variable()` |
| **Create macro graphs** | **NO** | No `add_macro_graph` method |

#### Graph Operations
| Method | Description |
|--------|-------------|
| `compile_blueprint(bp)` | Compile a Blueprint. `bp.status` is protected — do not read it |
| `add_function_graph(bp, name)` | Create a new empty function graph |
| `remove_function_graph(bp, name)` | Remove a function graph by name |
| `find_event_graph(bp)` | Returns the EventGraph `EdGraph` object |
| `find_graph(bp, name)` | Find a specific graph by name |
| `remove_graph(bp, name)` | Remove a graph by name |
| `rename_graph(bp, old_name, new_name)` | Rename a graph |
| `remove_unused_nodes(bp)` | Clean up unused nodes in all graphs |

#### Variable Operations
| Method | Description |
|--------|-------------|
| `add_member_variable(bp, name, EdGraphPinType)` | Add a variable with an `EdGraphPinType` (see below) |
| `set_blueprint_variable_instance_editable(bp, name, bool)` | Expose to Details panel |
| `set_blueprint_variable_expose_on_spawn(bp, name, bool)` | Expose on SpawnActor |
| `set_blueprint_variable_expose_to_cinematics(bp, name, bool)` | Expose to Sequencer |
| `remove_unused_variables(bp)` | Remove all unreferenced variables |
| `replace_variable_references(bp, old_name, new_name)` | Rename variable references across graphs |

**NOT available in BlueprintEditorLibrary** (use RiderAgentBridgeLibrary instead):
- ~~`add_variable(bp, name, type_str)`~~ — use `RiderAgentBridgeLibrary.add_blueprint_variable()` or `add_member_variable(bp, name, EdGraphPinType)`
- ~~`remove_variable(bp, name)`~~ — use `RiderAgentBridgeLibrary.remove_blueprint_variable()`
- ~~`set_blueprint_variable_default_value(bp, name, str)`~~ — use `RiderAgentBridgeLibrary.set_blueprint_variable_default_value()`
- ~~`set_blueprint_variable_category(bp, name, str)`~~ — use `RiderAgentBridgeLibrary.set_blueprint_variable_category()`
- ~~`get_all_graphs(bp)`~~ — use `RiderAgentBridgeLibrary.get_all_blueprint_graphs()`
- ~~`add_node(bp, graph, class, x, y)`~~ — use `RiderAgentBridgeLibrary.add_blueprint_node()`
- ~~`remove_node(bp, graph, node)`~~ — use `RiderAgentBridgeLibrary.remove_blueprint_node()`
- ~~`connect_pins(node1, pin1, node2, pin2)`~~ — use `RiderAgentBridgeLibrary.connect_blueprint_pins()`
- ~~`add_macro_graph(bp, name)`~~ — does not exist

#### Blueprint Introspection
| Method | Description |
|--------|-------------|
| `generated_class(bp)` | Returns the generated `UClass` for a compiled Blueprint |
| `get_blueprint_asset(obj)` | Get the Blueprint asset from a UObject |
| `get_blueprint_for_class(cls)` | Get the Blueprint asset from a UClass |
| `refresh_open_editors_for_blueprint(bp)` | Refresh open BP editors for this BP |
| `refresh_all_open_blueprint_editors()` | Refresh all open BP editors |
| `upgrade_operator_nodes(bp)` | Upgrade deprecated operator nodes |
| `reparent_blueprint(bp, new_parent_class)` | Change Blueprint parent class |

#### EdGraphPinType Helpers
| Method | Description |
|--------|-------------|
| `get_basic_type_by_name(name)` | Get a basic pin type by name |
| `get_array_type(inner_type)` | Get an array pin type |
| `get_map_type(key_type, value_type)` | Get a map pin type |
| `get_set_type(inner_type)` | Get a set pin type |
| `get_struct_type(struct)` | Get a struct pin type |
| `get_class_reference_type(class)` | Get a class reference pin type |
| `get_object_reference_type(class)` | Get an object reference pin type |

## EdGraphPinType Construction

In UE 5.7, `add_member_variable` requires an `EdGraphPinType` struct instead of a string.
The struct fields are **not** accessible via `set_editor_property()` — use `import_text()`.

### Common Type Patterns

```python
pt = unreal.EdGraphPinType()

# Float (double precision — the default in UE 5.7)
pt.import_text('(PinCategory="real",PinSubCategory="double")')

# Boolean
pt.import_text('(PinCategory="bool")')

# Integer
pt.import_text('(PinCategory="int")')

# String
pt.import_text('(PinCategory="string")')

# Name
pt.import_text('(PinCategory="name")')

# Text
pt.import_text('(PinCategory="text")')

# Vector
pt.import_text('(PinCategory="struct",PinSubCategoryObject=/Script/CoreUObject.Vector)')

# Rotator
pt.import_text('(PinCategory="struct",PinSubCategoryObject=/Script/CoreUObject.Rotator)')

# Transform
pt.import_text('(PinCategory="struct",PinSubCategoryObject=/Script/CoreUObject.Transform)')

# LinearColor
pt.import_text('(PinCategory="struct",PinSubCategoryObject=/Script/CoreUObject.LinearColor)')

# Object reference (e.g., MaterialInstanceDynamic)
pt.import_text('(PinCategory="object",PinSubCategoryObject=/Script/Engine.MaterialInstanceDynamic)')

# Object reference (e.g., SoundBase)
pt.import_text('(PinCategory="object",PinSubCategoryObject=/Script/Engine.SoundBase)')

# Object reference (e.g., Actor)
pt.import_text('(PinCategory="object",PinSubCategoryObject=/Script/Engine.Actor)')

# Array of floats (double)
pt.import_text('(PinCategory="real",PinSubCategory="double",ContainerType=Array)')

# Array of objects
pt.import_text('(PinCategory="object",PinSubCategoryObject=/Script/Engine.Actor,ContainerType=Array)')
```

### Helper: Make a PinType for any category

```python
def make_pin_type(category, sub_category='', sub_object='', container=''):
    """Build an EdGraphPinType via import_text."""
    parts = ['PinCategory="{}"'.format(category)]
    if sub_category:
        parts.append('PinSubCategory="{}"'.format(sub_category))
    if sub_object:
        parts.append('PinSubCategoryObject={}'.format(sub_object))
    if container:
        parts.append('ContainerType={}'.format(container))
    pt = unreal.EdGraphPinType()
    pt.import_text('({})'.format(','.join(parts)))
    return pt
```

## Setting Variable Default Values (CDO Approach)

In UE 5.7, `set_blueprint_variable_default_value` does not exist. Set defaults via the
Class Default Object (CDO) after compiling the Blueprint:

```python
# 1. Compile first so the generated class exists
unreal.BlueprintEditorLibrary.compile_blueprint(bp)

# 2. Get the generated class (new in 5.7)
gen_class = unreal.BlueprintEditorLibrary.generated_class(bp)

# 3. Get the CDO and set properties
cdo = unreal.get_default_object(gen_class)
cdo.set_editor_property('MyFloat', 50.0)
cdo.set_editor_property('bMyBool', True)
cdo.set_editor_property('MyInt', 42)
cdo.set_editor_property('MyString', 'Hello')
cdo.set_editor_property('MyVector', unreal.Vector(1.0, 2.0, 3.0))

# 4. Recompile and save
unreal.BlueprintEditorLibrary.compile_blueprint(bp)
unreal.EditorAssetLibrary.save_asset(bp_path)
```

**Important**: The CDO approach requires compile before setting defaults (so the generated
class has the variable properties). Then recompile after setting defaults.

### Alternative: Load generated class by path

```python
# If you know the asset path:
gen_class = unreal.load_object(None, '/Game/Blueprints/BP_Name.BP_Name_C')
cdo = unreal.get_default_object(gen_class)
```

## Finding Graphs (UE 5.7)

```python
# Get the EventGraph
event_graph = unreal.BlueprintEditorLibrary.find_event_graph(bp)
if event_graph:
    print('EventGraph: {}'.format(event_graph.get_name()))

# Find a specific function graph
func_graph = unreal.BlueprintEditorLibrary.find_graph(bp, 'MyFunction')
```

**Note**: There is no way to enumerate ALL graphs. You must know the graph name.
Use `find_event_graph(bp)` for the EventGraph and `find_graph(bp, name)` for named graphs.

### unreal.BlueprintFactory

Factory for creating Blueprint assets.

```python
factory = unreal.BlueprintFactory()
factory.set_editor_property('parent_class', unreal.Actor)  # or any UClass
# Optional:
factory.set_editor_property('blueprint_type', unreal.BlueprintType.NORMAL)
```

Blueprint types:
- `NORMAL` — standard Blueprint class
- `CONST` — const Blueprint (rare)
- `MACRO_LIBRARY` — macro library
- `INTERFACE` — Blueprint Interface
- `LEVEL_SCRIPT` — level Blueprint (don't create manually)
- `FUNCTION_LIBRARY` — Blueprint Function Library

### unreal.AssetToolsHelpers

```python
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
bp = asset_tools.create_asset(
    asset_name='BP_MyActor',
    package_path='/Game/Blueprints',
    asset_class=unreal.Blueprint,
    factory=factory
)
```

### unreal.EditorAssetLibrary

```python
eal = unreal.EditorAssetLibrary

# Load
bp = eal.load_asset('/Game/Blueprints/BP_MyActor')

# Check existence
exists = eal.does_asset_exist('/Game/Blueprints/BP_MyActor')

# Save
eal.save_asset('/Game/Blueprints/BP_MyActor')
eal.save_directory('/Game/Blueprints/')

# List
assets = eal.list_assets('/Game/Blueprints/', recursive=True)

# Duplicate
eal.duplicate_asset('/Game/BP_Source', '/Game/BP_Copy')

# Rename
eal.rename_asset('/Game/BP_Old', '/Game/BP_New')

# Make directory
eal.make_directory('/Game/Blueprints/Combat')
```

### unreal.SubobjectDataSubsystem (Components)

**WARNING**: `bp.get_editor_property('simple_construction_script')` does **NOT** work —
the property is not exposed to Python. Use `SubobjectDataSubsystem` instead.

```python
subsys = unreal.get_engine_subsystem(unreal.SubobjectDataSubsystem)

# ── Step 1: Get existing subobject handles ──
handles = subsys.k2_gather_subobject_data_for_blueprint(bp)
root_handle = handles[0]  # CDO handle

# ── Step 2: Add a component ──
params = unreal.AddNewSubobjectParams()
params.set_editor_property("parent_handle", root_handle)
params.set_editor_property("new_class", unreal.StaticMeshComponent)
params.set_editor_property("blueprint_context", bp)

new_handle, msg = subsys.add_new_subobject(params)
# msg is empty string on success

# ── Step 3: Find and configure the component template ──
# SubobjectData does NOT expose the object directly via get_editor_property.
# Use export_text() to get the object path, then load_object() to access it.
handles_after = subsys.k2_gather_subobject_data_for_blueprint(bp)
for h in handles_after:
    data = subsys.k2_find_subobject_data_from_handle(h)
    if data is None:
        continue
    txt = data.export_text()
    # txt looks like: (WeakObjectPtr="/Script/Engine.StaticMeshComponent'/Game/BP.BP_C:SMC_GEN_VARIABLE'",...)
    # Extract the object path between the single quotes
    if "StaticMeshComponent" in txt:
        import re
        match = re.search(r"'([^']+)'", txt)
        if match:
            obj_path = match.group(1)
            smc = unreal.load_object(name=obj_path, outer=None)
            if smc:
                smc.set_editor_property("static_mesh", sphere_mesh)
                smc.set_material(0, mat)

# ── Step 4: Compile and save ──
unreal.BlueprintEditorLibrary.compile_blueprint(bp)
unreal.EditorAssetLibrary.save_asset(bp_path)
```

### SubobjectDataSubsystem — Key Methods

| Method | Description |
|--------|-------------|
| `k2_gather_subobject_data_for_blueprint(bp)` | Returns `Array[SubobjectDataHandle]` for all components |
| `k2_find_subobject_data_from_handle(handle)` | Returns `SubobjectData` struct (use `export_text()` to inspect) |
| `add_new_subobject(params)` | Returns `(SubobjectDataHandle, Text)` — handle + error message |
| `delete_subobject(handle, bp)` | Delete a component from the blueprint |
| `rename_subobject(handle, new_name)` | Rename a component |
| `attach_subobject(owner_handle, child_handle)` | Reparent component |
| `make_new_scene_root(bp, handle)` | Set component as scene root |

### SubobjectDataBlueprintFunctionLibrary — Working with SubobjectData

`SubobjectData` does **NOT** expose `object` or `component_template` via `get_editor_property()`.
Use `SubobjectDataBlueprintFunctionLibrary` static methods instead.

**IMPORTANT**: Most methods take `SubobjectData` (not `SubobjectDataHandle`). Convert first:
```python
data = subsys.k2_find_subobject_data_from_handle(handle)
```

| Method | Takes | Description |
|--------|-------|-------------|
| `get_display_name(data)` | SubobjectData | Component display name (e.g. "ShieldMesh_GEN_VARIABLE") |
| `get_object(data)` | SubobjectData | Underlying UObject (DEPRECATED — use `get_associated_object`) |
| `get_associated_object(data)` | SubobjectData | Underlying UObject (preferred) |
| `get_object_for_blueprint(data, bp)` | SubobjectData | Object specific to a Blueprint context |
| `get_handle(data)` | SubobjectData | Returns the SubobjectDataHandle |
| `get_blueprint(data)` | SubobjectData | Returns the owning Blueprint |
| `is_handle_valid(handle)` | **SubobjectDataHandle** | Check if a handle is valid |
| `is_component(data)` | SubobjectData | True if this is a component |
| `is_scene_component(data)` | SubobjectData | True if this is a scene component |
| `is_default_scene_root(data)` | SubobjectData | True if this is the default scene root |

#### Recommended pattern: iterate and configure component templates

```python
sdbfl = unreal.SubobjectDataBlueprintFunctionLibrary
handles = subsys.k2_gather_subobject_data_for_blueprint(bp)
for h in handles:
    data = subsys.k2_find_subobject_data_from_handle(h)
    if data is None:
        continue
    name = str(sdbfl.get_display_name(data))
    obj = sdbfl.get_object(data)  # or get_associated_object
    if obj and "MyMesh" in name:
        mesh = unreal.StaticMeshComponent.cast(obj)
        if mesh:
            mesh.set_static_mesh(sphere)
            mesh.set_material(0, mat)
```

#### Fallback: parse export_text for object path

```python
data = subsys.k2_find_subobject_data_from_handle(handle)
txt = data.export_text()
import re
match = re.search(r"'([^']+)'", txt)
obj_path = match.group(1)
component = unreal.load_object(name=obj_path, outer=None)
```

## Blueprint Status Values

**WARNING**: `bp.get_editor_property('status')` raises `Property 'Status' is protected and cannot be read`.
Do NOT attempt to check blueprint compile status via Python. Instead, check editor logs after compile:

```python
# Compile (no way to read status directly)
unreal.BlueprintEditorLibrary.compile_blueprint(bp)
# Check logs for errors: ue-exec.sh --logs --severity error --lines 5 --filter "Blueprint"
```

| Status (for reference only — not readable) | Meaning |
|--------|---------|
| `BS_UP_TO_DATE` | Compiled successfully |
| `BS_DIRTY` | Needs recompile |
| `BS_ERROR` | Compile errors — check message log |
| `BS_BEING_CREATED` | Still being created (rare) |
| `BS_UNKNOWN` | Unknown state |

## Common Gotchas

1. **`create_asset` returns None** — path already exists or parent dir missing
2. **`add_member_variable` returns False** — variable name already exists or invalid `EdGraphPinType`
3. **`compile_blueprint` crashes** — graph has invalid connections; call `remove_unused_nodes(bp)` first
4. **`load_asset` returns None** — wrong path (missing `/Game/` prefix or has `.uasset` suffix)
5. **CDO defaults require compile first** — must compile before getting CDO, then compile again after setting defaults
6. **`bp.get_editor_property('simple_construction_script')` FAILS** — property not exposed. Use `SubobjectDataSubsystem` instead
7. **`bp.get_editor_property('status')` FAILS** — property is protected. No Python-accessible way to read compile status
8. **`SubobjectData` has no `object` property** — use `SubobjectDataBlueprintFunctionLibrary.get_object(data)` (deprecated) or `get_associated_object(data)`. Fallback: `data.export_text()` + parse path + `load_object`
9. **`generated_class().get_default_object()` returns the class, not an Actor** — cannot call `get_components_by_class()` on it
10. **Collision enum names use prefixes** — `CollisionChannel.ECC_WORLD_DYNAMIC` (not `WORLD_DYNAMIC`), `CollisionChannel.ECC_PAWN`, `CollisionChannel.ECC_PROJECTILE`. Response type: `CollisionResponseType.ECR_BLOCK/ECR_IGNORE/ECR_OVERLAP`. Enabled: `CollisionEnabled.NO_COLLISION/QUERY_ONLY/QUERY_AND_PHYSICS`. Use `set_collision_enabled()`, `set_collision_object_type()`, `set_collision_response_to_channel()` methods.
11. **EdGraphPinType protected from Python** — `set_editor_property('PinCategory', ...)` fails. Use `import_text()` instead.
12. **`set_generate_overlap_events` is a property** — use `set_editor_property('generate_overlap_events', True)`, not `set_generate_overlap_events(True)`
13. **SubobjectDataSubsystem constructor deprecated** — use `unreal.get_engine_subsystem(unreal.SubobjectDataSubsystem)` instead of `unreal.SubobjectDataSubsystem()`

### `unreal.RiderAgentBridgeLibrary` API

`unreal.RiderAgentBridgeLibrary` Python module exposes functions for working with BP graphs that are missing in the UE Python API.

```python
ab = unreal.RiderAgentBridgeLibrary

# Graph info
graphs_json = ab.get_all_blueprint_graphs(bp_path)     # → JSON array
nodes_json = ab.get_blueprint_graph_nodes(bp_path, 'EventGraph')  # → JSON array with params + defaults

# Node manipulation
node_name = ab.add_blueprint_node(bp_path, 'EventGraph', 'K2Node_CallFunction',
    '{"FunctionReference": "/Script/Engine.KismetSystemLibrary:PrintString"}', 300, 0)
ab.connect_blueprint_pins(bp_path, 'EventGraph', 'NodeA', 'then', 'NodeB', 'execute')
ab.set_pin_default_value(bp_path, 'EventGraph', node_name, 'InString', 'Hello')
ab.remove_blueprint_node(bp_path, 'EventGraph', node_name)

# Variables
ab.add_blueprint_variable(bp_path, 'Health', 'real', 'double', '', 'None', False)
ab.add_blueprint_variable(bp_path, 'Targets', 'object', '', '/Script/Engine.Actor', 'Array', False)
ab.set_blueprint_variable_default_value(bp_path, 'Health', '100.0')
ab.set_blueprint_variable_category(bp_path, 'Health', 'Stats')
ab.remove_blueprint_variable(bp_path, 'OldVar')

# Clipboard (for template copy-paste between BPs)
clipboard = ab.export_blueprint_nodes(bp_path, 'EventGraph', '[]')  # all nodes
clipboard = ab.export_blueprint_nodes(bp_path, 'EventGraph', '["K2Node_Event_0"]')  # specific
result = ab.import_blueprint_nodes(target_bp, 'EventGraph', clipboard, 500, 0)
```

### Pin Type Reference (for add_blueprint_variable)

| Type | PinCategory | PinSubCategory | PinSubCategoryObject |
|---|---|---|---|
| bool | `bool` | | |
| int32 | `int` | | |
| int64 | `int64` | | |
| float/double | `real` | `double` | |
| string | `string` | | |
| name | `name` | | |
| text | `text` | | |
| byte | `byte` | | |
| enum | `byte` | | `/Script/Module.EMyEnum` |
| struct | `struct` | | `/Script/CoreUObject.Vector` |
| object ref | `object` | | `/Script/Engine.Actor` |
| class ref | `class` | | `/Script/Engine.Actor` |
| soft object | `softobject` | | `/Script/Engine.Texture2D` |
| soft class | `softclass` | | `/Script/Engine.Actor` |

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_execute_python` | Run Blueprint API scripts directly | Pass the snippets above (create asset, add component, set defaults) into the running editor; use `scripts` array for multi-step pipelines |
| `ue_health` | Verify editor is connected | Call once before any `ue_execute_python` batch — fails fast if the editor is not running |
| `ue_status` | Check PIE state and recent Blueprint logs | Confirm no active PIE (edits fail during PIE); inspect `LogBlueprint` entries for compile errors after `compile_blueprint()` |
| `search_assets` | Confirm asset path before scripting | `search_assets(query="BP_MyActor")` to resolve the exact `/Game/...` path needed for `load_asset` or `create_asset` |
| `get_asset_properties` | Read CDO values on a Blueprint | Verify that `set_editor_property` calls on the CDO produced the expected default values |
