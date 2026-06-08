"""List DataTables, DataAssets, or CurveTables in a directory.

Globals:
    __search_dir__ : str  - Directory to search (default: '/Game/Data')
    __asset_type__ : str  - 'datatable', 'dataasset', 'curvetable', or 'all' (default: 'all')
"""
import unreal

search_dir = globals().get('__search_dir__', '/Game/Data')
asset_type = globals().get('__asset_type__', 'all').lower()

type_map = {
    'datatable': unreal.DataTable,
    'dataasset': unreal.DataAsset,
    'curvetable': unreal.CurveTable,
}

assets = unreal.EditorAssetLibrary.list_assets(search_dir, recursive=True)
results = {'DataTable': [], 'DataAsset': [], 'CurveTable': [], 'Other': []}

for asset_path in assets:
    clean = str(asset_path)
    if '.' in clean.rsplit('/', 1)[-1]:
        clean = clean.rsplit('.', 1)[0]

    obj = unreal.load_asset(clean)
    if obj is None:
        continue

    if isinstance(obj, unreal.DataTable):
        cat = 'DataTable'
    elif isinstance(obj, unreal.CurveTable):
        cat = 'CurveTable'
    elif isinstance(obj, unreal.DataAsset):
        cat = 'DataAsset'
    else:
        cat = 'Other'

    if asset_type == 'all' or asset_type == cat.lower():
        row_info = ''
        if cat == 'DataTable':
            rows = obj.get_row_names()
            row_info = ' ({} rows)'.format(len(rows))
        elif cat == 'DataAsset':
            row_info = ' [{}]'.format(type(obj).__name__)
        results[cat].append('{}{}'.format(clean, row_info))

for cat in ['DataTable', 'DataAsset', 'CurveTable']:
    items = results[cat]
    if items and (asset_type == 'all' or asset_type == cat.lower()):
        print('=== {} ({}) ==='.format(cat, len(items)))
        for item in sorted(items):
            print('  {}'.format(item))

total = sum(len(v) for v in results.values()) - len(results.get('Other', []))
print('\nTotal: {}'.format(total))
