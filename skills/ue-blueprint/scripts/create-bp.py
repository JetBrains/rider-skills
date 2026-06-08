"""Create a new Blueprint asset from a parent class.

Globals (set via ue-exec.sh --script):
  __bp_name__     : str  - Blueprint asset name (e.g., 'BP_MyActor')
  __bp_path__     : str  - Package path (e.g., '/Game/Blueprints')
  __parent_class__: str  - Parent class name (e.g., 'Actor', 'Pawn', 'Character', 'UserWidget')
"""
import unreal

bp_name = globals().get('__bp_name__', 'BP_NewActor')
bp_path = globals().get('__bp_path__', '/Game/Blueprints')
parent_name = globals().get('__parent_class__', 'Actor')

# Resolve parent class
parent_map = {
    'Actor': unreal.Actor,
    'Pawn': unreal.Pawn,
    'Character': unreal.Character,
    'PlayerController': unreal.PlayerController,
    'GameModeBase': unreal.GameModeBase,
    'GameMode': unreal.GameMode,
    'GameStateBase': unreal.GameStateBase,
    'PlayerState': unreal.PlayerState,
    'HUD': unreal.HUD,
    'UserWidget': unreal.UserWidget,
    'ActorComponent': unreal.ActorComponent,
    'SceneComponent': unreal.SceneComponent,
    'BlueprintFunctionLibrary': unreal.BlueprintFunctionLibrary,
}

parent_class = parent_map.get(parent_name)
if parent_class is None:
    # Try loading as asset path
    parent_class = unreal.load_object(None, parent_name)

if parent_class is None:
    print('ERROR: Unknown parent class: {}'.format(parent_name))
else:
    eal = unreal.EditorAssetLibrary
    full_path = '{}/{}'.format(bp_path, bp_name)

    if eal.does_asset_exist(full_path):
        print('SKIP: {} already exists'.format(full_path))
    else:
        eal.make_directory(bp_path)
        factory = unreal.BlueprintFactory()
        factory.set_editor_property('parent_class', parent_class)
        asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
        bp = asset_tools.create_asset(bp_name, bp_path, unreal.Blueprint, factory)

        if bp:
            unreal.BlueprintEditorLibrary.compile_blueprint(bp)
            eal.save_asset(full_path)
            print('SUCCESS: Created {} (parent: {})'.format(full_path, parent_name))
        else:
            print('ERROR: create_asset returned None for {}'.format(full_path))
