"""Import CSV or JSON into an existing DataTable.

Globals:
    __asset_path__ : str  - Asset path (e.g., '/Game/Data/DT_Items')
    __format__     : str  - 'csv' or 'json' (default: 'csv')
    __input_path__ : str  - Absolute input file path
    __mode__       : str  - 'rewrite' (default), 'update', or 'apply'
        rewrite: Clear all rows, fill from file
        update:  Merge — update existing, add new, keep unmatched
        apply:   Overwrite matching rows only, skip new rows
"""
import unreal
import json
import os

asset_path = globals().get('__asset_path__', '')
fmt = globals().get('__format__', 'csv').lower()
input_path = globals().get('__input_path__', '')
mode = globals().get('__mode__', 'rewrite').lower()

if not asset_path:
    print('ERROR: __asset_path__ is required')
elif not input_path:
    print('ERROR: __input_path__ is required')
elif not os.path.exists(input_path):
    print('ERROR: File not found: {}'.format(input_path))
else:
    dt = unreal.load_asset(asset_path)
    if dt is None:
        print('ERROR: Could not load DataTable: {}'.format(asset_path))
    else:
        if mode == 'rewrite':
            # Standard fill — clears and replaces all rows
            struct = dt.get_row_struct()
            if fmt == 'json':
                success = dt.fill_from_json_file(input_path)
            else:
                success = dt.fill_from_csv_file(input_path, import_row_struct=struct)
            if success:
                unreal.EditorAssetLibrary.save_asset(asset_path)
                rows = dt.get_row_names()
                print('OK: Rewrite {} — {} rows from {}'.format(asset_path, len(rows), input_path))
            else:
                print('ERROR: Import failed. Check encoding (UTF-8) and column headers.')

        elif mode in ('update', 'apply'):
            # Export current data
            current_json = dt.export_to_json_string()
            current_rows = json.loads(current_json)
            current_map = {row['Name']: row for row in current_rows}

            # Load input file
            if fmt == 'json':
                with open(input_path, 'r', encoding='utf-8') as f:
                    input_rows = json.loads(f.read())
            else:
                # Convert CSV to JSON via temp import
                import csv
                with open(input_path, 'r', encoding='utf-8') as f:
                    reader = csv.DictReader(f)
                    input_rows = []
                    for row in reader:
                        # Rename RowName -> Name for consistency
                        if 'RowName' in row:
                            row['Name'] = row.pop('RowName')
                        input_rows.append(row)

            if mode == 'update':
                # Merge: update existing, add new, keep unmatched
                for row in input_rows:
                    name = row.get('Name', '')
                    if name in current_map:
                        current_map[name].update(row)
                    else:
                        current_map[name] = row
                merged = list(current_map.values())
                dt.fill_from_json_string(json.dumps(merged))
                unreal.EditorAssetLibrary.save_asset(asset_path)
                print('OK: Update {} — {} total rows ({} from file)'.format(
                    asset_path, len(merged), len(input_rows)))

            else:  # apply
                # Overwrite matching rows only
                applied = 0
                for row in input_rows:
                    name = row.get('Name', '')
                    if name in current_map:
                        current_map[name].update(row)
                        applied += 1
                result = list(current_map.values())
                dt.fill_from_json_string(json.dumps(result))
                unreal.EditorAssetLibrary.save_asset(asset_path)
                print('OK: Apply {} — {} rows updated, {} skipped'.format(
                    asset_path, applied, len(input_rows) - applied))
        else:
            print('ERROR: Unknown mode "{}". Use: rewrite, update, apply'.format(mode))
