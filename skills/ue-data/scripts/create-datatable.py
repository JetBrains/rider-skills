"""Create a new DataTable from an existing row struct.

Globals:
    __name__        : str  - DataTable asset name (e.g., 'DT_Items')
    __path__        : str  - Asset directory (e.g., '/Game/Data/DataTables')
    __struct_path__ : str  - Row struct path (e.g., '/Script/MyGame.FItemDataRow' or '/Game/Data/Structs/S_ItemRow')
"""
import unreal

name = globals().get('__name__', '')
path = globals().get('__path__', '/Game/Data/DataTables')
struct_path = globals().get('__struct_path__', '')

if not name:
    print('ERROR: __name__ is required')
elif not struct_path:
    print('ERROR: __struct_path__ is required')
else:
    full_path = '{}/{}'.format(path, name)

    if unreal.EditorAssetLibrary.does_asset_exist(full_path):
        print('EXISTS: DataTable already exists at {}'.format(full_path))
        dt = unreal.load_asset(full_path)
        rows = dt.get_row_names() if dt else []
        print('  Rows: {}'.format(len(rows)))
    else:
        # Try loading struct as asset first, then as native
        struct = unreal.load_asset(struct_path)
        if struct is None:
            struct = unreal.find_object(None, struct_path)
        if struct is None:
            print('ERROR: Could not load struct: {}'.format(struct_path))
        else:
            factory = unreal.DataTableFactory()
            factory.struct = struct
            asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
            dt = asset_tools.create_asset(name, path, unreal.DataTable, factory)
            if dt is not None:
                unreal.EditorAssetLibrary.save_asset(full_path)
                print('OK: Created DataTable {} with struct {}'.format(full_path, struct_path))
            else:
                print('ERROR: create_asset returned None for {}'.format(full_path))
