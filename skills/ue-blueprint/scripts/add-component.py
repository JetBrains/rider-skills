"""Add a component to a Blueprint's SimpleConstructionScript.

Globals:
  __bp_path__         : str - Asset path (e.g., '/Game/Blueprints/BP_MyActor')
  __component_class__ : str - Component class name (e.g., 'StaticMeshComponent')
  __component_name__  : str - Display name for the component (e.g., 'MyMesh')
  __attach_to_root__  : str - 'true' to attach to root (default: 'true')
"""
import unreal

bp_path = globals().get('__bp_path__', '')
comp_class_name = globals().get('__component_class__', 'StaticMeshComponent')
comp_name = globals().get('__component_name__', comp_class_name)
attach_root = globals().get('__attach_to_root__', 'true').lower() == 'true'

if not bp_path:
    print('ERROR: __bp_path__ not set')
else:
    bp = unreal.EditorAssetLibrary.load_asset(bp_path)
    if bp is None:
        print('ERROR: {} not found'.format(bp_path))
    else:
        scs = bp.get_editor_property('simple_construction_script')
        if scs is None:
            print('ERROR: No SimpleConstructionScript on {}'.format(bp_path))
        else:
            # Resolve component class
            comp_class = getattr(unreal, comp_class_name, None)
            if comp_class is None:
                print('ERROR: Unknown component class: {}'.format(comp_class_name))
            else:
                node = scs.create_node(comp_class)
                if attach_root:
                    root_nodes = scs.get_all_nodes()
                    if root_nodes:
                        scs.add_node_to_parent(node, root_nodes[0])
                    else:
                        scs.add_node(node)
                else:
                    scs.add_node(node)

                # Compile and save
                unreal.BlueprintEditorLibrary.compile_blueprint(bp)
                unreal.EditorAssetLibrary.save_asset(bp_path)
                print('SUCCESS: Added {} ({}) to {}'.format(
                    comp_name, comp_class_name, bp.get_name()))
