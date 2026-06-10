# Blueprint Recipes (UE 5.7)

Common Blueprint creation patterns as complete Python scripts.
All recipes use the UE 5.7 API (`add_member_variable` + `EdGraphPinType` + CDO defaults).

> **Note**: Blueprint graph logic (nodes, pins, wiring) **cannot** be created programmatically
> in UE 5.7. Recipes cover asset creation, variables, components, and structure only.
> All Blueprint logic must be added manually in the editor.

## Recipe 1: Basic Actor Blueprint

```python
import unreal

# Create
factory = unreal.BlueprintFactory()
factory.set_editor_property('parent_class', unreal.Actor)
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
bp = asset_tools.create_asset('BP_HelloWorld', '/Game/Blueprints', unreal.Blueprint, factory)

if bp is None:
    print('ERROR: Asset already exists or path invalid')
else:
    unreal.BlueprintEditorLibrary.compile_blueprint(bp)
    unreal.EditorAssetLibrary.save_asset('/Game/Blueprints/BP_HelloWorld')
    print('SUCCESS: Created BP_HelloWorld')
```

## Recipe 2: Actor with Variables and Components

```python
import unreal
import re

bp_path = '/Game/Blueprints/Items/BP_Collectible'

# Create BP
factory = unreal.BlueprintFactory()
factory.set_editor_property('parent_class', unreal.Actor)
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
unreal.EditorAssetLibrary.make_directory('/Game/Blueprints/Items')
bp = asset_tools.create_asset('BP_Collectible', '/Game/Blueprints/Items', unreal.Blueprint, factory)

if bp is None:
    print('ERROR: Failed to create')
else:
    bp_lib = unreal.BlueprintEditorLibrary

    # ── Add variables using EdGraphPinType ──
    pt = unreal.EdGraphPinType()

    # int variable
    pt.import_text('(PinCategory="int")')
    bp_lib.add_member_variable(bp, 'PointValue', pt)
    bp_lib.set_blueprint_variable_instance_editable(bp, 'PointValue', True)

    # bool variable
    pt.import_text('(PinCategory="bool")')
    bp_lib.add_member_variable(bp, 'bIsCollected', pt)

    # object reference variable
    pt.import_text('(PinCategory="object",PinSubCategoryObject=/Script/Engine.SoundBase)')
    bp_lib.add_member_variable(bp, 'CollectionSound', pt)
    bp_lib.set_blueprint_variable_instance_editable(bp, 'CollectionSound', True)

    # ── Add components via SubobjectDataSubsystem ──
    subsys = unreal.get_engine_subsystem(unreal.SubobjectDataSubsystem)
    handles = subsys.k2_gather_subobject_data_for_blueprint(bp)
    root_handle = handles[0]

    # Add root mesh component
    params = unreal.AddNewSubobjectParams()
    params.set_editor_property("parent_handle", root_handle)
    params.set_editor_property("new_class", unreal.StaticMeshComponent)
    params.set_editor_property("blueprint_context", bp)
    mesh_handle, _ = subsys.add_new_subobject(params)

    # Add collision sphere (parented to mesh)
    params2 = unreal.AddNewSubobjectParams()
    params2.set_editor_property("parent_handle", mesh_handle)
    params2.set_editor_property("new_class", unreal.SphereComponent)
    params2.set_editor_property("blueprint_context", bp)
    subsys.add_new_subobject(params2)

    # ── Compile first pass (generates class for CDO access) ──
    bp_lib.compile_blueprint(bp)

    # ── Set variable defaults via CDO ──
    gen_class = bp_lib.generated_class(bp)
    cdo = unreal.get_default_object(gen_class)
    cdo.set_editor_property('PointValue', 10)
    cdo.set_editor_property('bIsCollected', False)

    # ── Configure components via export_text workaround ──
    handles_after = subsys.k2_gather_subobject_data_for_blueprint(bp)
    for h in handles_after:
        data = subsys.k2_find_subobject_data_from_handle(h)
        if data:
            txt = data.export_text()
            if "SphereComponent" in txt:
                match = re.search(r"'([^']+)'", txt)
                if match:
                    sc = unreal.load_object(name=match.group(1), outer=None)
                    if sc:
                        sc.set_editor_property('sphere_radius', 150.0)
                        sc.set_editor_property('generate_overlap_events', True)
                        # Collision: use METHODS, not set_editor_property
                        sc.set_collision_enabled(unreal.CollisionEnabled.QUERY_ONLY)
                        sc.set_collision_response_to_all_channels(unreal.CollisionResponse.IGNORE)
                        sc.set_collision_response_to_channel(
                            unreal.CollisionChannel.PAWN, unreal.CollisionResponse.OVERLAP
                        )

    # ── Final compile and save ──
    bp_lib.compile_blueprint(bp)
    unreal.EditorAssetLibrary.save_asset(bp_path)
    print('Created BP_Collectible')
```

## Recipe 3: Widget Blueprint (HUD)

```python
import unreal

bp_path = '/Game/UI/WBP_GameHUD'

factory = unreal.BlueprintFactory()
factory.set_editor_property('parent_class', unreal.UserWidget)
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
unreal.EditorAssetLibrary.make_directory('/Game/UI')
bp = asset_tools.create_asset('WBP_GameHUD', '/Game/UI', unreal.Blueprint, factory)

if bp:
    bp_lib = unreal.BlueprintEditorLibrary
    pt = unreal.EdGraphPinType()

    # Float variable
    pt.import_text('(PinCategory="real",PinSubCategory="double")')
    bp_lib.add_member_variable(bp, 'PlayerHealth', pt)

    # Text variable
    pt.import_text('(PinCategory="text")')
    bp_lib.add_member_variable(bp, 'ScoreText', pt)

    # Bool variable
    pt.import_text('(PinCategory="bool")')
    bp_lib.add_member_variable(bp, 'bIsVisible', pt)

    # Compile to generate class, then set defaults via CDO
    bp_lib.compile_blueprint(bp)
    gen_class = bp_lib.generated_class(bp)
    cdo = unreal.get_default_object(gen_class)
    cdo.set_editor_property('PlayerHealth', 1.0)
    cdo.set_editor_property('bIsVisible', True)

    bp_lib.compile_blueprint(bp)
    unreal.EditorAssetLibrary.save_asset(bp_path)
    print('SUCCESS: Created WBP_GameHUD')
```

## Recipe 4: Blueprint Interface

```python
import unreal

factory = unreal.BlueprintFactory()
factory.set_editor_property('blueprint_type', unreal.BlueprintType.INTERFACE)
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
unreal.EditorAssetLibrary.make_directory('/Game/Blueprints/Interfaces')
bp = asset_tools.create_asset('BPI_Interactable', '/Game/Blueprints/Interfaces', unreal.Blueprint, factory)

if bp:
    bp_lib = unreal.BlueprintEditorLibrary

    # Add interface functions (empty shells — logic must be added manually)
    bp_lib.add_function_graph(bp, 'Interact')
    bp_lib.add_function_graph(bp, 'GetInteractionText')
    bp_lib.add_function_graph(bp, 'CanInteract')

    bp_lib.compile_blueprint(bp)
    unreal.EditorAssetLibrary.save_asset('/Game/Blueprints/Interfaces/BPI_Interactable')
    print('SUCCESS: Created BPI_Interactable')
```

## Recipe 5: Blueprint Function Library

```python
import unreal

factory = unreal.BlueprintFactory()
factory.set_editor_property('parent_class', unreal.BlueprintFunctionLibrary)
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
unreal.EditorAssetLibrary.make_directory('/Game/Blueprints/Libraries')
bp = asset_tools.create_asset('BFL_MathUtils', '/Game/Blueprints/Libraries', unreal.Blueprint, factory)

if bp:
    bp_lib = unreal.BlueprintEditorLibrary

    # Add utility functions (empty shells — logic must be added manually)
    bp_lib.add_function_graph(bp, 'RemapValue')
    bp_lib.add_function_graph(bp, 'RandomPointInCircle')
    bp_lib.add_function_graph(bp, 'SmoothDamp')

    bp_lib.compile_blueprint(bp)
    unreal.EditorAssetLibrary.save_asset('/Game/Blueprints/Libraries/BFL_MathUtils')
    print('SUCCESS: Created BFL_MathUtils')
```

## Recipe 6: Duplicate and Modify Existing Blueprint

```python
import unreal

eal = unreal.EditorAssetLibrary
bp_lib = unreal.BlueprintEditorLibrary

source = '/Game/Blueprints/BP_BaseEnemy'
target = '/Game/Blueprints/Enemies/BP_FlyingEnemy'

# Duplicate
if eal.does_asset_exist(source):
    eal.make_directory('/Game/Blueprints/Enemies')
    eal.duplicate_asset(source, target)
    bp = eal.load_asset(target)

    if bp:
        pt = unreal.EdGraphPinType()

        # Add flying-specific float variables
        pt.import_text('(PinCategory="real",PinSubCategory="double")')
        bp_lib.add_member_variable(bp, 'FlyHeight', pt)
        bp_lib.set_blueprint_variable_instance_editable(bp, 'FlyHeight', True)

        bp_lib.add_member_variable(bp, 'HoverAmplitude', pt)

        # Compile to get CDO, then set defaults
        bp_lib.compile_blueprint(bp)
        gen_class = bp_lib.generated_class(bp)
        cdo = unreal.get_default_object(gen_class)
        cdo.set_editor_property('FlyHeight', 500.0)
        cdo.set_editor_property('HoverAmplitude', 50.0)

        bp_lib.compile_blueprint(bp)
        eal.save_asset(target)
        print('SUCCESS: Created BP_FlyingEnemy from BP_BaseEnemy')
else:
    print('ERROR: Source {} not found'.format(source))
```

## Recipe 7: Batch Create Blueprints from Config

```python
import unreal

asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
bp_lib = unreal.BlueprintEditorLibrary
eal = unreal.EditorAssetLibrary

# Config: list of (name, path, parent_class, variables)
# Variables: (name, pin_type_text, default_value)
blueprints = [
    ('BP_HealthPickup', '/Game/Blueprints/Pickups', unreal.Actor, [
        ('HealAmount', '(PinCategory="real",PinSubCategory="double")', 25.0),
        ('RespawnTime', '(PinCategory="real",PinSubCategory="double")', 30.0),
    ]),
    ('BP_AmmoPickup', '/Game/Blueprints/Pickups', unreal.Actor, [
        ('AmmoAmount', '(PinCategory="int")', 50),
        ('AmmoType', '(PinCategory="name")', 'Rifle'),
    ]),
    ('BP_ShieldPickup', '/Game/Blueprints/Pickups', unreal.Actor, [
        ('ShieldAmount', '(PinCategory="real",PinSubCategory="double")', 50.0),
        ('Duration', '(PinCategory="real",PinSubCategory="double")', 10.0),
    ]),
]

eal.make_directory('/Game/Blueprints/Pickups')

for bp_name, bp_path, parent, variables in blueprints:
    factory = unreal.BlueprintFactory()
    factory.set_editor_property('parent_class', parent)
    bp = asset_tools.create_asset(bp_name, bp_path, unreal.Blueprint, factory)

    if bp:
        pt = unreal.EdGraphPinType()
        for var_name, pin_type_text, var_default in variables:
            pt.import_text(pin_type_text)
            bp_lib.add_member_variable(bp, var_name, pt)
            bp_lib.set_blueprint_variable_instance_editable(bp, var_name, True)

        # Compile to generate class, then set defaults via CDO
        bp_lib.compile_blueprint(bp)
        gen_class = bp_lib.generated_class(bp)
        cdo = unreal.get_default_object(gen_class)
        for var_name, pin_type_text, var_default in variables:
            cdo.set_editor_property(var_name, var_default)

        bp_lib.compile_blueprint(bp)
        full_path = '{}/{}'.format(bp_path, bp_name)
        eal.save_asset(full_path)
        print('Created: {}'.format(bp_name))
    else:
        print('SKIPPED: {} (already exists?)'.format(bp_name))

print('Batch complete')
```

## Recipe 8: Inspect Blueprint Structure

```python
import unreal
import re

bp_path = '/Game/Blueprints/BP_MyActor'
bp = unreal.EditorAssetLibrary.load_asset(bp_path)

if bp is None:
    print('ERROR: {} not found'.format(bp_path))
else:
    bp_lib = unreal.BlueprintEditorLibrary

    # Basic info (NOTE: 'status' is protected — don't read it)
    parent = bp.get_editor_property('parent_class')
    print('Blueprint: {}'.format(bp.get_name()))
    print('Parent: {}'.format(parent.get_name() if parent else 'None'))

    # Generated class (UE 5.7)
    gen_class = bp_lib.generated_class(bp)
    if gen_class:
        print('Generated class: {}'.format(gen_class.get_name()))

    # Graphs — use find_event_graph / find_graph (get_all_graphs does not exist)
    event_graph = bp_lib.find_event_graph(bp)
    if event_graph:
        print('\nEventGraph: {}'.format(event_graph.get_name()))

    # Components (via SubobjectDataSubsystem)
    subsys = unreal.get_engine_subsystem(unreal.SubobjectDataSubsystem)
    handles = subsys.k2_gather_subobject_data_for_blueprint(bp)
    print('\nSubobjects ({}):'.format(len(handles)))
    for h in handles:
        data = subsys.k2_find_subobject_data_from_handle(h)
        if data:
            txt = data.export_text()
            # Extract class and name from WeakObjectPtr
            match = re.search(r"/Script/\w+\.(\w+)'[^:]+:(\w+)'", txt)
            if match:
                print('  - {} ({})'.format(match.group(2), match.group(1)))
            elif 'Default__' in txt:
                print('  - CDO (root)')

    print('\nInspection complete')
```

## Recipe 9: Reparent Blueprint

```python
import unreal

bp_path = '/Game/Blueprints/BP_MyActor'
bp = unreal.EditorAssetLibrary.load_asset(bp_path)

if bp:
    # Change parent class (new in UE 5.7)
    unreal.BlueprintEditorLibrary.reparent_blueprint(bp, unreal.Pawn)
    unreal.BlueprintEditorLibrary.compile_blueprint(bp)
    unreal.EditorAssetLibrary.save_asset(bp_path)
    print('Reparented to Pawn')
```

## Recipe 10: Add Variables with All Common Types

```python
import unreal

bp_path = '/Game/Blueprints/BP_VariableDemo'

factory = unreal.BlueprintFactory()
factory.set_editor_property('parent_class', unreal.Actor)
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
bp = asset_tools.create_asset('BP_VariableDemo', '/Game/Blueprints', unreal.Blueprint, factory)

if bp:
    bp_lib = unreal.BlueprintEditorLibrary
    pt = unreal.EdGraphPinType()

    # Float (double precision)
    pt.import_text('(PinCategory="real",PinSubCategory="double")')
    bp_lib.add_member_variable(bp, 'MyFloat', pt)

    # Bool
    pt.import_text('(PinCategory="bool")')
    bp_lib.add_member_variable(bp, 'bMyBool', pt)

    # Int
    pt.import_text('(PinCategory="int")')
    bp_lib.add_member_variable(bp, 'MyInt', pt)

    # String
    pt.import_text('(PinCategory="string")')
    bp_lib.add_member_variable(bp, 'MyString', pt)

    # Name
    pt.import_text('(PinCategory="name")')
    bp_lib.add_member_variable(bp, 'MyName', pt)

    # Text
    pt.import_text('(PinCategory="text")')
    bp_lib.add_member_variable(bp, 'MyText', pt)

    # Vector
    pt.import_text('(PinCategory="struct",PinSubCategoryObject=/Script/CoreUObject.Vector)')
    bp_lib.add_member_variable(bp, 'MyVector', pt)

    # Rotator
    pt.import_text('(PinCategory="struct",PinSubCategoryObject=/Script/CoreUObject.Rotator)')
    bp_lib.add_member_variable(bp, 'MyRotator', pt)

    # Transform
    pt.import_text('(PinCategory="struct",PinSubCategoryObject=/Script/CoreUObject.Transform)')
    bp_lib.add_member_variable(bp, 'MyTransform', pt)

    # LinearColor
    pt.import_text('(PinCategory="struct",PinSubCategoryObject=/Script/CoreUObject.LinearColor)')
    bp_lib.add_member_variable(bp, 'MyColor', pt)

    # Object reference (Actor)
    pt.import_text('(PinCategory="object",PinSubCategoryObject=/Script/Engine.Actor)')
    bp_lib.add_member_variable(bp, 'MyActorRef', pt)

    # Object reference (MaterialInstanceDynamic)
    pt.import_text('(PinCategory="object",PinSubCategoryObject=/Script/Engine.MaterialInstanceDynamic)')
    bp_lib.add_member_variable(bp, 'MyMID', pt)

    # Array of floats
    pt.import_text('(PinCategory="real",PinSubCategory="double",ContainerType=Array)')
    bp_lib.add_member_variable(bp, 'MyFloatArray', pt)

    # Compile, set defaults, recompile
    bp_lib.compile_blueprint(bp)
    gen_class = bp_lib.generated_class(bp)
    cdo = unreal.get_default_object(gen_class)
    cdo.set_editor_property('MyFloat', 42.0)
    cdo.set_editor_property('bMyBool', True)
    cdo.set_editor_property('MyInt', 7)
    cdo.set_editor_property('MyString', 'Hello')
    cdo.set_editor_property('MyVector', unreal.Vector(1.0, 2.0, 3.0))
    cdo.set_editor_property('MyColor', unreal.LinearColor(1.0, 0.0, 0.0, 1.0))

    bp_lib.compile_blueprint(bp)
    unreal.EditorAssetLibrary.save_asset(bp_path)
    print('Created BP_VariableDemo with all common types')
```

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_status` | Confirm editor connected | Required before any `ue_execute_python` call; recipes fail silently without a connection |
| `ue_execute_python` | Execute any recipe above | Pass the entire script as `script`; for multi-step recipes use `scripts: [...]` with `startFrom` for resumability |
| `search_assets` | Check if the BP already exists before creating | Avoids "asset exists, creation skipped" silent failure |
| `get_asset_properties` | Verify CDO defaults after creation | Confirm that `set_editor_property` calls actually landed |
| `get_class_hierarchy` | List all descendants before batch operations | Enumerate child BPs before a bulk CDO update |
