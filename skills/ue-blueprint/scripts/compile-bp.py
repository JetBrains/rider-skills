"""Compile a Blueprint and report status.

Globals:
  __bp_path__: str - Asset path (e.g., '/Game/Blueprints/BP_MyActor')
  __save__   : str - 'true' to save after compile (default: 'true')
"""
import unreal

bp_path = globals().get('__bp_path__', '')
do_save = globals().get('__save__', 'true').lower() == 'true'

if not bp_path:
    print('ERROR: __bp_path__ not set')
else:
    bp = unreal.EditorAssetLibrary.load_asset(bp_path)
    if bp is None:
        print('ERROR: {} not found'.format(bp_path))
    else:
        unreal.BlueprintEditorLibrary.compile_blueprint(bp)
        status = bp.get_editor_property('status')
        print('Compiled: {} -> {}'.format(bp.get_name(), status))

        if do_save:
            unreal.EditorAssetLibrary.save_asset(bp_path)
            print('Saved: {}'.format(bp_path))
