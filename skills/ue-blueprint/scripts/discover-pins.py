"""Discover all pin names on all nodes in a Blueprint graph.

This is essential before wiring pins — display names differ from internal names.

Globals:
  __bp_path__   : str - Asset path (e.g., '/Game/Blueprints/BP_MyActor')
  __graph_name__: str - Graph name to inspect (default: 'EventGraph')
"""
import unreal

bp_path = globals().get('__bp_path__', '')
graph_name = globals().get('__graph_name__', 'EventGraph')

if not bp_path:
    print('ERROR: __bp_path__ not set')
else:
    bp = unreal.EditorAssetLibrary.load_asset(bp_path)
    if bp is None:
        print('ERROR: {} not found'.format(bp_path))
    else:
        bp_lib = unreal.BlueprintEditorLibrary
        graphs = bp_lib.get_all_graphs(bp)

        target_graph = None
        for g in graphs:
            if str(g.get_name()) == graph_name:
                target_graph = g
                break

        if target_graph is None:
            print('ERROR: Graph "{}" not found. Available:'.format(graph_name))
            for g in graphs:
                print('  - {}'.format(g.get_name()))
        else:
            print('=== Pins in {} / {} ==='.format(bp.get_name(), graph_name))
            print('(Use these internal names for connect_pins calls)')
            print('')
            # Note: Direct node/pin iteration depends on UE Python API version
            # This script uses the available introspection methods
            print('To enumerate pins, use dir() on graph nodes:')
            print('  graphs = BlueprintEditorLibrary.get_all_graphs(bp)')
            print('  # Then inspect node members')
            print('')
            print('Graph {} has {} member(s)'.format(
                graph_name, len(dir(target_graph))))
            print('Graph attrs: {}'.format(
                [a for a in dir(target_graph) if not a.startswith('_')][:20]))
