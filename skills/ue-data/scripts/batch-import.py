"""Import multiple files into DataTables.

Globals:
    __mapping__ : str  - JSON string mapping asset paths to file paths
                         e.g., '{"/Game/Data/DT_Items": "/path/to/items.csv"}'
    __format__  : str  - 'csv' or 'json' (default: 'csv')
    __mode__    : str  - 'rewrite', 'update', or 'apply' (default: 'rewrite')
"""
import unreal
import json
import os

mapping_str = globals().get('__mapping__', '{}')
fmt = globals().get('__format__', 'csv').lower()
mode = globals().get('__mode__', 'rewrite').lower()

try:
    mapping = json.loads(mapping_str)
except (json.JSONDecodeError, TypeError):
    print('ERROR: __mapping__ must be valid JSON: {{"asset_path": "file_path", ...}}')
    mapping = {}

if not mapping:
    print('ERROR: __mapping__ is empty or invalid')
else:
    imported = 0
    failed = 0

    for asset_path, file_path in mapping.items():
        if not os.path.exists(file_path):
            print('SKIP: File not found: {}'.format(file_path))
            failed += 1
            continue

        dt = unreal.load_asset(asset_path)
        if dt is None:
            print('SKIP: Could not load DataTable: {}'.format(asset_path))
            failed += 1
            continue

        if mode == 'rewrite':
            struct = dt.get_row_struct()
            if fmt == 'json':
                success = dt.fill_from_json_file(file_path)
            else:
                success = dt.fill_from_csv_file(file_path, import_row_struct=struct)

            if success:
                unreal.EditorAssetLibrary.save_asset(asset_path)
                rows = dt.get_row_names()
                print('OK: {} <- {} ({} rows, mode={})'.format(
                    asset_path, file_path, len(rows), mode))
                imported += 1
            else:
                print('FAIL: Import {} into {}'.format(file_path, asset_path))
                failed += 1

        elif mode in ('update', 'apply'):
            # Use JSON merge approach
            current_rows = json.loads(dt.export_to_json_string())
            current_map = {row['Name']: row for row in current_rows}

            if fmt == 'json':
                with open(file_path, 'r', encoding='utf-8') as f:
                    input_rows = json.loads(f.read())
            else:
                import csv
                with open(file_path, 'r', encoding='utf-8') as f:
                    reader = csv.DictReader(f)
                    input_rows = []
                    for row in reader:
                        if 'RowName' in row:
                            row['Name'] = row.pop('RowName')
                        input_rows.append(row)

            if mode == 'update':
                for row in input_rows:
                    name = row.get('Name', '')
                    if name in current_map:
                        current_map[name].update(row)
                    else:
                        current_map[name] = row
            else:  # apply
                for row in input_rows:
                    name = row.get('Name', '')
                    if name in current_map:
                        current_map[name].update(row)

            result = list(current_map.values())
            dt.fill_from_json_string(json.dumps(result))
            unreal.EditorAssetLibrary.save_asset(asset_path)
            print('OK: {} <- {} ({} rows, mode={})'.format(
                asset_path, file_path, len(result), mode))
            imported += 1

    print('\nImported: {}, Failed: {}'.format(imported, failed))
