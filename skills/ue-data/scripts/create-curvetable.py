"""Create or update a CurveTable from CSV or JSON.

Globals:
    __name__       : str  - CurveTable asset name (e.g., 'CT_DamageScaling')
    __path__       : str  - Asset directory (default: '/Game/Data/CurveTables')
    __input_path__ : str  - Absolute path to CSV/JSON source file
    __format__     : str  - 'csv' or 'json' (default: 'csv')
    __interp__     : str  - 'linear', 'constant', or 'cubic' (default: 'linear')
"""
import unreal

name = globals().get('__name__', '')
path = globals().get('__path__', '/Game/Data/CurveTables')
input_path = globals().get('__input_path__', '')
fmt = globals().get('__format__', 'csv').lower()
interp = globals().get('__interp__', 'linear').lower()

if not name:
    print('ERROR: __name__ is required')
elif not input_path:
    print('ERROR: __input_path__ is required')
else:
    import os
    if not os.path.exists(input_path):
        print('ERROR: File not found: {}'.format(input_path))
    else:
        full_path = '{}/{}'.format(path, name)

        if unreal.EditorAssetLibrary.does_asset_exist(full_path):
            ct = unreal.load_asset(full_path)
            action = 'Updated'
        else:
            factory = unreal.CurveTableFactory()
            asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
            ct = asset_tools.create_asset(name, path, unreal.CurveTable, factory)
            action = 'Created'

        if ct is None:
            print('ERROR: Could not create/load CurveTable at {}'.format(full_path))
        else:
            if fmt == 'json':
                success = ct.fill_from_json_file(input_path)
            else:
                success = ct.fill_from_csv_file(input_path)

            if success:
                unreal.EditorAssetLibrary.save_asset(full_path)
                print('OK: {} CurveTable {} from {}'.format(action, full_path, input_path))
            else:
                print('ERROR: Failed to import {} into CurveTable'.format(input_path))
