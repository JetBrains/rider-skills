"""Export multiple DataTables to CSV or JSON.

Globals:
    __table_paths__ : str  - Comma-separated asset paths (e.g., '/Game/Data/DT_Items,/Game/Data/DT_Enemies')
    __output_dir__  : str  - Output directory (default: <ProjectDir>/RawData/)
    __format__      : str  - 'csv', 'json', or 'both' (default: 'both')
"""
import unreal
import os

table_paths_str = globals().get('__table_paths__', '')
output_dir = globals().get('__output_dir__', '')
fmt = globals().get('__format__', 'both').lower()

if not table_paths_str:
    print('ERROR: __table_paths__ is required (comma-separated asset paths)')
else:
    table_paths = [p.strip() for p in table_paths_str.split(',') if p.strip()]

    if not output_dir:
        output_dir = os.path.join(unreal.Paths.project_dir(), 'RawData')
    os.makedirs(output_dir, exist_ok=True)

    exported = 0
    failed = 0
    for asset_path in table_paths:
        dt = unreal.load_asset(asset_path)
        if dt is None:
            print('SKIP: Could not load {}'.format(asset_path))
            failed += 1
            continue

        name = asset_path.rsplit('/', 1)[-1]
        row_count = len(dt.get_row_names())

        if fmt in ('csv', 'both'):
            csv_path = os.path.join(output_dir, '{}.csv'.format(name))
            if dt.export_to_csv_file(csv_path):
                print('OK: {} -> {} ({} rows)'.format(name, csv_path, row_count))
            else:
                print('FAIL: CSV export for {}'.format(name))
                failed += 1

        if fmt in ('json', 'both'):
            json_path = os.path.join(output_dir, '{}.json'.format(name))
            if dt.export_to_json_file(json_path):
                print('OK: {} -> {} ({} rows)'.format(name, json_path, row_count))
            else:
                print('FAIL: JSON export for {}'.format(name))
                failed += 1

        exported += 1

    print('\nExported: {}, Failed: {}'.format(exported, failed))
