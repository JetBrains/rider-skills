"""Inspect a Blueprint's structure: graphs, variables, components, status.

Globals:
  __bp_path__: str - Asset path (e.g., '/Game/Blueprints/BP_MyActor')
"""
import unreal

bp_path = globals().get('__bp_path__', '')
if not bp_path:
    print('ERROR: __bp_path__ not set')
else:
    bp = unreal.EditorAssetLibrary.load_asset(bp_path)
    if bp is None:
        print('ERROR: {} not found'.format(bp_path))
    else:
        bp_lib = unreal.BlueprintEditorLibrary

        # Basic info
        parent = bp.get_editor_property('parent_class')
        print('=== Blueprint: {} ==='.format(bp.get_name()))
        print('Path: {}'.format(bp_path))
        print('Parent: {}'.format(parent.get_name() if parent else 'None'))
        print('Status: {}'.format(bp.get_editor_property('status')))
        print('Type: {}'.format(bp.get_editor_property('blueprint_type')))

        # Graphs
        graphs = bp_lib.get_all_graphs(bp)
        print('\n=== Graphs ({}) ==='.format(len(graphs)))
        for g in graphs:
            print('  [{}]'.format(g.get_name()))

        # Components via SCS
        scs = bp.get_editor_property('simple_construction_script')
        if scs:
            nodes = scs.get_all_nodes()
            print('\n=== Components ({}) ==='.format(len(nodes)))
            for node in nodes:
                comp = node.get_editor_property('component_template')
                if comp:
                    print('  {} ({})'.format(comp.get_name(), comp.get_class().get_name()))

        # Generated class (CDO)
        gen_class = bp.get_editor_property('generated_class')
        if gen_class:
            print('\n=== Generated Class ===')
            print('  {}'.format(gen_class.get_name()))

        print('\nInspection complete.')
