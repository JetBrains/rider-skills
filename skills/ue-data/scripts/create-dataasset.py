"""Create a new DataAsset instance from a UDataAsset subclass.

Globals:
    __name__       : str  - Asset name (e.g., 'DA_Weapon_Sword')
    __path__       : str  - Asset directory (e.g., '/Game/Data/DataAssets/Weapons')
    __class_path__ : str  - DataAsset class path (e.g., '/Script/MyGame.WeaponDataAsset')
"""
import unreal

name = globals().get('__name__', '')
path = globals().get('__path__', '/Game/Data/DataAssets')
class_path = globals().get('__class_path__', '')

if not name:
    print('ERROR: __name__ is required')
elif not class_path:
    print('ERROR: __class_path__ is required')
else:
    full_path = '{}/{}'.format(path, name)

    if unreal.EditorAssetLibrary.does_asset_exist(full_path):
        print('EXISTS: DataAsset already exists at {}'.format(full_path))
        da = unreal.load_asset(full_path)
        if da:
            print('  Class: {}'.format(type(da).__name__))
    else:
        asset_class = unreal.find_object(None, class_path)
        if asset_class is None:
            # Try loading as asset
            asset_class = unreal.load_asset(class_path)
        if asset_class is None:
            print('ERROR: Could not find class: {}'.format(class_path))
        else:
            asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
            factory = unreal.DataAssetFactory()
            factory.data_asset_class = asset_class
            da = asset_tools.create_asset(name, path, unreal.DataAsset, factory)
            if da is not None:
                unreal.EditorAssetLibrary.save_asset(full_path)
                print('OK: Created DataAsset {} (class: {})'.format(full_path, class_path))
            else:
                print('ERROR: create_asset returned None. Check class_path: {}'.format(class_path))
