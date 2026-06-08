"""Export a DataTable to CSV or JSON file.

Globals:
    __asset_path__  : str  - Asset path (e.g., '/Game/Data/DT_Items')
    __format__      : str  - 'csv' or 'json' (default: 'csv')
    __output_path__ : str  - Absolute output file path (default: auto in RawData/)
"""
import unreal
import os

asset_path = globals().get('__asset_path__', '/Game/Data/DT_Items')
fmt = globals().get('__format__', 'csv').lower()
output_path = globals().get('__output_path__', '')

dt = unreal.load_asset(asset_path)
if dt is None:
    print('ERROR: Could not load DataTable: {}'.format(asset_path))
else:
    if not output_path:
        project_dir = unreal.Paths.project_dir()
        raw_dir = os.path.join(project_dir, 'RawData')
        os.makedirs(raw_dir, exist_ok=True)
        name = asset_path.rsplit('/', 1)[-1]
        output_path = os.path.join(raw_dir, '{}.{}'.format(name, fmt))

    if fmt == 'json':
        success = dt.export_to_json_file(output_path)
    else:
        success = dt.export_to_csv_file(output_path)

    if success:
        row_count = len(dt.get_row_names())
        print('OK: Exported {} ({} rows) -> {}'.format(asset_path, row_count, output_path))
    else:
        print('ERROR: Failed to export {} to {}'.format(asset_path, output_path))
