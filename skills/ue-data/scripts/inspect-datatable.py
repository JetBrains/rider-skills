"""Inspect a DataTable: show schema, row count, and sample rows.

Globals:
    __asset_path__  : str  - Asset path (e.g., '/Game/Data/DT_Items')
    __sample_rows__ : int  - Number of sample rows to display (default: 3)
"""
import unreal
import json

asset_path = globals().get('__asset_path__', '/Game/Data/DT_Items')
sample_count = int(globals().get('__sample_rows__', 3))

dt = unreal.load_asset(asset_path)
if dt is None:
    print('ERROR: Could not load DataTable: {}'.format(asset_path))
else:
    cols = dt.get_column_export_names()
    raw_cols = dt.get_column_names()
    row_names = dt.get_row_names()

    print('=== DataTable: {} ==='.format(asset_path))
    print('Row struct: {}'.format(dt.get_editor_property('row_struct')))
    print('Rows: {}, Columns: {}'.format(len(row_names), len(cols)))

    # Column details
    print('\n--- Columns ---')
    for i, (raw, export) in enumerate(zip(raw_cols, cols)):
        col_vals = dt.get_column_as_string(str(raw))
        sample_val = str(col_vals[0]) if col_vals else '(empty)'
        display = str(export)
        if str(raw) != display:
            display = '{} (raw: {})'.format(display, raw)
        print('  [{}] {} — sample: {}'.format(i, display, sample_val[:60]))

    # Row names
    print('\n--- Row Names (first 20) ---')
    for rn in row_names[:20]:
        print('  {}'.format(rn))
    if len(row_names) > 20:
        print('  ... and {} more'.format(len(row_names) - 20))

    # Sample rows as JSON
    json_str = dt.export_to_json_string()
    all_rows = json.loads(json_str)
    print('\n--- Sample Rows (first {}) ---'.format(min(sample_count, len(all_rows))))
    for row in all_rows[:sample_count]:
        print(json.dumps(row, indent=2, ensure_ascii=False))
