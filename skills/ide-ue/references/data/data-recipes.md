# UE Data Recipes — Copy-Paste Python Scripts

## Recipe 1: Create DataTable from Existing Struct

```python
import unreal

name = 'DT_Items'
path = '/Game/Data/DataTables'
struct_path = '/Game/Data/Structs/S_ItemRow'  # or '/Script/MyGame.FItemDataRow' for C++ structs

# Check existence first
full_path = '{}/{}'.format(path, name)
if unreal.EditorAssetLibrary.does_asset_exist(full_path):
    print('DataTable already exists: {}'.format(full_path))
    dt = unreal.load_asset(full_path)
else:
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
        if dt:
            unreal.EditorAssetLibrary.save_asset(full_path)
            print('Created DataTable: {}'.format(full_path))
        else:
            print('ERROR: Failed to create DataTable')
```

## Recipe 2: Create DataTable with Inline UserDefinedStruct

```python
import unreal

asset_tools = unreal.AssetToolsHelpers.get_asset_tools()

# 1. Create the struct
struct_path = '/Game/Data/Structs/S_WeaponRow'
if not unreal.EditorAssetLibrary.does_asset_exist(struct_path):
    struct = asset_tools.create_asset(
        'S_WeaponRow', '/Game/Data/Structs',
        unreal.UserDefinedStruct, unreal.StructureFactory()
    )
    unreal.PythonStructLib.add_variable(struct, 'string', '', None, 0, False)   # DisplayName
    unreal.PythonStructLib.add_variable(struct, 'real', 'float', None, 0, False)  # Damage
    unreal.PythonStructLib.add_variable(struct, 'int', '', None, 0, False)      # MaxStack
    unreal.PythonStructLib.add_variable(struct, 'bool', '', None, 0, False)     # IsRanged
    unreal.EditorAssetLibrary.save_asset(struct_path)
    print('Created struct: {}'.format(struct_path))
else:
    struct = unreal.load_asset(struct_path)

# 2. Create the DataTable
dt_path = '/Game/Data/DataTables/DT_Weapons'
if not unreal.EditorAssetLibrary.does_asset_exist(dt_path):
    factory = unreal.DataTableFactory()
    factory.struct = struct
    dt = asset_tools.create_asset(
        'DT_Weapons', '/Game/Data/DataTables',
        unreal.DataTable, factory
    )
    if dt:
        # 3. Add rows
        pdtl = unreal.PythonDataTableLib
        pdtl.add_row(dt, 'Sword')
        pdtl.set_property_by_string_at(dt, 0, 0, 'Iron Sword')
        pdtl.set_property_by_string_at(dt, 0, 1, '25.0')
        pdtl.set_property_by_string_at(dt, 0, 2, '1')
        pdtl.set_property_by_string_at(dt, 0, 3, 'false')

        pdtl.add_row(dt, 'Bow')
        pdtl.set_property_by_string_at(dt, 1, 0, 'Longbow')
        pdtl.set_property_by_string_at(dt, 1, 1, '15.0')
        pdtl.set_property_by_string_at(dt, 1, 2, '1')
        pdtl.set_property_by_string_at(dt, 1, 3, 'true')

        unreal.EditorAssetLibrary.save_asset(dt_path)
        rows, cols = pdtl.get_shape(dt)
        print('Created DT_Weapons: {} rows, {} cols'.format(rows, cols))
```

## Recipe 3: Export DataTable to CSV/JSON

```python
import unreal, os

asset_path = '/Game/Data/DataTables/DT_Items'
dt = unreal.load_asset(asset_path)
if dt is None:
    print('ERROR: Could not load {}'.format(asset_path))
else:
    project_dir = unreal.Paths.project_dir()
    out_dir = os.path.join(project_dir, 'RawData')
    os.makedirs(out_dir, exist_ok=True)

    name = asset_path.rsplit('/', 1)[-1]

    # CSV export
    csv_path = os.path.join(out_dir, '{}.csv'.format(name))
    if dt.export_to_csv_file(csv_path):
        print('Exported CSV: {}'.format(csv_path))

    # JSON export
    json_path = os.path.join(out_dir, '{}.json'.format(name))
    if dt.export_to_json_file(json_path):
        print('Exported JSON: {}'.format(json_path))
```

## Recipe 4: Import CSV/JSON into Existing DataTable

```python
import unreal

asset_path = '/Game/Data/DataTables/DT_Items'
input_path = '/absolute/path/to/items.csv'  # or .json
fmt = 'csv'  # or 'json'

dt = unreal.load_asset(asset_path)
if dt is None:
    print('ERROR: Could not load {}'.format(asset_path))
else:
    struct = dt.get_row_struct()
    if fmt == 'csv':
        success = dt.fill_from_csv_file(input_path, import_row_struct=struct)
    else:
        success = dt.fill_from_json_file(input_path)

    if success:
        unreal.EditorAssetLibrary.save_asset(asset_path)
        rows = dt.get_row_names()
        print('Imported {} rows from {} into {}'.format(len(rows), input_path, asset_path))
    else:
        print('ERROR: Import failed. Check file encoding (UTF-8) and column headers.')
```

## Recipe 5: Update Mode — Merge Rows Without Losing Existing

```python
import unreal, json, os

asset_path = '/Game/Data/DataTables/DT_Items'
update_file = '/absolute/path/to/updates.json'

dt = unreal.load_asset(asset_path)
if dt is None:
    print('ERROR: Could not load {}'.format(asset_path))
else:
    # 1. Export current data
    current_json = dt.export_to_json_string()
    current_rows = json.loads(current_json)
    current_map = {row['Name']: row for row in current_rows}

    # 2. Load updates
    with open(update_file, 'r', encoding='utf-8') as f:
        update_rows = json.loads(f.read())

    # 3. Merge: update existing, add new, keep unmatched
    for row in update_rows:
        name = row.get('Name', '')
        if name in current_map:
            current_map[name].update(row)  # update existing
        else:
            current_map[name] = row        # add new

    # 4. Write back
    merged = list(current_map.values())
    merged_json = json.dumps(merged, indent=2)
    dt.fill_from_json_string(merged_json)
    unreal.EditorAssetLibrary.save_asset(asset_path)
    print('Merged {} rows ({} from update file)'.format(len(merged), len(update_rows)))
```

## Recipe 6: Apply Mode — Overwrite Matching Rows Only

```python
import unreal, json

asset_path = '/Game/Data/DataTables/DT_Items'
apply_file = '/absolute/path/to/overrides.json'

dt = unreal.load_asset(asset_path)
if dt is None:
    print('ERROR: Could not load {}'.format(asset_path))
else:
    # 1. Export current
    current_rows = json.loads(dt.export_to_json_string())
    current_map = {row['Name']: row for row in current_rows}

    # 2. Load overrides
    with open(apply_file, 'r', encoding='utf-8') as f:
        override_rows = json.loads(f.read())

    # 3. Apply: only update rows that exist in both
    applied = 0
    for row in override_rows:
        name = row.get('Name', '')
        if name in current_map:
            current_map[name].update(row)
            applied += 1

    # 4. Write back
    result = list(current_map.values())
    dt.fill_from_json_string(json.dumps(result, indent=2))
    unreal.EditorAssetLibrary.save_asset(asset_path)
    print('Applied {} overrides (skipped {} new rows)'.format(applied, len(override_rows) - applied))
```

## Recipe 7: Create CurveTable from CSV

```python
import unreal

name = 'CT_DamageScaling'
path = '/Game/Data/CurveTables'
csv_path = '/absolute/path/to/damage_curves.csv'

full_path = '{}/{}'.format(path, name)
if not unreal.EditorAssetLibrary.does_asset_exist(full_path):
    factory = unreal.CurveTableFactory()
    # factory.interpolation_type defaults to Linear
    asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
    ct = asset_tools.create_asset(name, path, unreal.CurveTable, factory)
    if ct:
        ct.fill_from_csv_file(csv_path)
        unreal.EditorAssetLibrary.save_asset(full_path)
        print('Created CurveTable: {}'.format(full_path))
else:
    ct = unreal.load_asset(full_path)
    ct.fill_from_csv_file(csv_path)
    unreal.EditorAssetLibrary.save_asset(full_path)
    print('Updated CurveTable: {}'.format(full_path))
```

## Recipe 8: Create DataAsset Instance

```python
import unreal

# Assumes UPrimaryDataAsset subclass exists (e.g., UWeaponDataAsset)
name = 'DA_Weapon_Sword'
path = '/Game/Data/DataAssets/Weapons'
class_path = '/Script/MyGame.WeaponDataAsset'

full_path = '{}/{}'.format(path, name)
if unreal.EditorAssetLibrary.does_asset_exist(full_path):
    print('DataAsset already exists: {}'.format(full_path))
    da = unreal.load_asset(full_path)
else:
    asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
    factory = unreal.DataAssetFactory()
    factory.data_asset_class = unreal.find_object(None, class_path)
    da = asset_tools.create_asset(name, path, unreal.DataAsset, factory)
    if da:
        unreal.EditorAssetLibrary.save_asset(full_path)
        print('Created DataAsset: {}'.format(full_path))
    else:
        print('ERROR: Failed to create DataAsset. Check class_path: {}'.format(class_path))

# Set properties on DataAsset
if da:
    da.set_editor_property('display_name', unreal.Text('Excalibur'))
    da.set_editor_property('base_damage', 50.0)
    unreal.EditorAssetLibrary.save_asset(full_path)
```

## Recipe 9: Batch Export All DataTables in Directory

```python
import unreal, os

search_dir = '/Game/Data/DataTables'
output_dir = os.path.join(unreal.Paths.project_dir(), 'RawData')
os.makedirs(output_dir, exist_ok=True)

assets = unreal.EditorAssetLibrary.list_assets(search_dir, recursive=True)
exported = 0
for asset_path in assets:
    # Remove class prefix if present (e.g., "DataTable'/Game/...'")
    clean_path = str(asset_path).split("'")[0] if "'" in str(asset_path) else str(asset_path)
    # Remove trailing .suffix from asset path
    if '.' in clean_path.rsplit('/', 1)[-1]:
        clean_path = clean_path.rsplit('.', 1)[0]

    obj = unreal.load_asset(clean_path)
    if obj is None or not isinstance(obj, unreal.DataTable):
        continue

    name = clean_path.rsplit('/', 1)[-1]
    csv_path = os.path.join(output_dir, '{}.csv'.format(name))
    json_path = os.path.join(output_dir, '{}.json'.format(name))

    obj.export_to_csv_file(csv_path)
    obj.export_to_json_file(json_path)
    exported += 1
    print('Exported: {}'.format(name))

print('Total exported: {}'.format(exported))
```

## Recipe 10: Inspect DataTable (Schema + Sample Rows)

```python
import unreal, json

asset_path = '/Game/Data/DataTables/DT_Items'
sample_count = 3

dt = unreal.load_asset(asset_path)
if dt is None:
    print('ERROR: Could not load {}'.format(asset_path))
else:
    # Schema
    cols = dt.get_column_export_names()
    row_names = dt.get_row_names()
    print('=== DataTable: {} ==='.format(asset_path))
    print('Row struct: {}'.format(dt.get_editor_property('row_struct')))
    print('Rows: {}, Columns: {}'.format(len(row_names), len(cols)))
    print('Columns: {}'.format(', '.join([str(c) for c in cols])))

    # Sample rows (via JSON for rich data)
    json_str = dt.export_to_json_string()
    all_rows = json.loads(json_str)
    print('--- Sample rows (first {}) ---'.format(min(sample_count, len(all_rows))))
    for row in all_rows[:sample_count]:
        print(json.dumps(row, indent=2))
```

## Recipe 11: Round-Trip Workflow (External Editor)

```python
import unreal, os

PROJECT_DIR = unreal.Paths.project_dir()
RAW_DIR = os.path.join(PROJECT_DIR, 'RawData')
os.makedirs(RAW_DIR, exist_ok=True)

TABLES = [
    '/Game/Data/DT_Items',
    '/Game/Data/DT_Enemies',
    '/Game/Data/DT_Dialogue',
]

def export_for_editing():
    """Export tables to CSV for editing in Excel/Sheets."""
    for path in TABLES:
        dt = unreal.load_asset(path)
        if dt is None:
            print('SKIP: {}'.format(path))
            continue
        name = path.rsplit('/', 1)[-1]
        csv_path = os.path.join(RAW_DIR, '{}.csv'.format(name))
        dt.export_to_csv_file(csv_path)
        print('Exported: {} -> {}'.format(path, csv_path))

def import_from_editing():
    """Import edited CSVs back into DataTables."""
    for path in TABLES:
        dt = unreal.load_asset(path)
        if dt is None:
            print('SKIP: {}'.format(path))
            continue
        name = path.rsplit('/', 1)[-1]
        csv_path = os.path.join(RAW_DIR, '{}.csv'.format(name))
        if not os.path.exists(csv_path):
            print('SKIP (no file): {}'.format(csv_path))
            continue
        struct = dt.get_row_struct()
        if dt.fill_from_csv_file(csv_path, import_row_struct=struct):
            unreal.EditorAssetLibrary.save_asset(path)
            print('Imported: {} -> {}'.format(csv_path, path))
        else:
            print('ERROR: Failed to import {}'.format(csv_path))

# Call one of these:
export_for_editing()
# import_from_editing()
```

## Recipe 12: Excel (XLSX) Conversion via openpyxl

**Note:** openpyxl must be installed in UE's Python (`pip install openpyxl` in UE's Python env, or use the system script approach below).

### System Script Approach (outside UE, then import CSV)

```python
#!/usr/bin/env python3
"""Convert Excel XLSX to CSV for UE DataTable import, or CSV to XLSX for editing."""
import csv
import json
import sys
import os

try:
    import openpyxl
except ImportError:
    print('ERROR: pip install openpyxl')
    sys.exit(1)

def xlsx_to_csv(xlsx_path, csv_path, sheet_name=None):
    """Convert XLSX sheet to CSV (UTF-8, suitable for UE import)."""
    wb = openpyxl.load_workbook(xlsx_path, read_only=True, data_only=True)
    ws = wb[sheet_name] if sheet_name else wb.active
    with open(csv_path, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        for row in ws.iter_rows(values_only=True):
            writer.writerow(['' if v is None else v for v in row])
    wb.close()
    print('Converted: {} -> {}'.format(xlsx_path, csv_path))

def csv_to_xlsx(csv_path, xlsx_path, sheet_name='DataTable'):
    """Convert CSV to XLSX for editing in Excel."""
    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = sheet_name
    with open(csv_path, 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        for row in reader:
            ws.append(row)
    # Auto-size columns
    for col in ws.columns:
        max_len = max(len(str(cell.value or '')) for cell in col)
        ws.column_dimensions[col[0].column_letter].width = min(max_len + 2, 50)
    wb.save(xlsx_path)
    print('Converted: {} -> {}'.format(csv_path, xlsx_path))

def xlsx_to_json(xlsx_path, json_path, sheet_name=None):
    """Convert XLSX to JSON array format for UE DataTable import."""
    wb = openpyxl.load_workbook(xlsx_path, read_only=True, data_only=True)
    ws = wb[sheet_name] if sheet_name else wb.active
    rows = list(ws.iter_rows(values_only=True))
    if not rows:
        print('ERROR: Empty spreadsheet')
        return
    headers = [str(h) for h in rows[0]]
    # First column is RowName -> maps to "Name" in JSON
    if headers[0] == 'RowName':
        headers[0] = 'Name'
    result = []
    for row in rows[1:]:
        entry = {}
        for i, val in enumerate(row):
            if i < len(headers):
                key = headers[i]
                if val is None:
                    val = ''
                # Try numeric conversion
                if isinstance(val, str):
                    try:
                        val = float(val) if '.' in val else int(val)
                    except (ValueError, TypeError):
                        pass
                entry[key] = val
        if entry.get('Name', ''):
            result.append(entry)
    wb.close()
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(result, f, indent=2, ensure_ascii=False)
    print('Converted: {} -> {} ({} rows)'.format(xlsx_path, json_path, len(result)))

def json_to_xlsx(json_path, xlsx_path, sheet_name='DataTable'):
    """Convert JSON DataTable export to XLSX for editing."""
    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    if not data:
        print('ERROR: Empty JSON')
        return
    # Collect all keys preserving order
    headers = list(dict.fromkeys(k for row in data for k in row.keys()))
    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = sheet_name
    # Rename "Name" back to "RowName" for UE convention
    display_headers = ['RowName' if h == 'Name' else h for h in headers]
    ws.append(display_headers)
    for row in data:
        ws.append([row.get(h, '') for h in headers])
    for col in ws.columns:
        max_len = max(len(str(cell.value or '')) for cell in col)
        ws.column_dimensions[col[0].column_letter].width = min(max_len + 2, 50)
    wb.save(xlsx_path)
    print('Converted: {} -> {} ({} rows)'.format(json_path, xlsx_path, len(data)))

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print('Usage: python excel-convert.py <input> <output> [sheet_name]')
        print('  Supported: .xlsx <-> .csv, .xlsx <-> .json')
        sys.exit(1)
    inp, out = sys.argv[1], sys.argv[2]
    sheet = sys.argv[3] if len(sys.argv) > 3 else None
    ext_in = os.path.splitext(inp)[1].lower()
    ext_out = os.path.splitext(out)[1].lower()
    if ext_in == '.xlsx' and ext_out == '.csv':
        xlsx_to_csv(inp, out, sheet)
    elif ext_in == '.csv' and ext_out == '.xlsx':
        csv_to_xlsx(inp, out, sheet or 'DataTable')
    elif ext_in == '.xlsx' and ext_out == '.json':
        xlsx_to_json(inp, out, sheet)
    elif ext_in == '.json' and ext_out == '.xlsx':
        json_to_xlsx(inp, out, sheet or 'DataTable')
    else:
        print('ERROR: Unsupported conversion: {} -> {}'.format(ext_in, ext_out))
```

## Recipe 13: Create CompositeDataTable

CompositeDataTables merge multiple DataTables into one unified lookup. Used for combining project-specific data with engine defaults (e.g., input tables).

```python
import unreal

name = 'DT_AllInput'
path = '/Game/Data'

full_path = '{}/{}'.format(path, name)
if unreal.EditorAssetLibrary.does_asset_exist(full_path):
    print('CompositeDataTable already exists: {}'.format(full_path))
    cdt = unreal.load_asset(full_path)
else:
    factory = unreal.CompositeDataTableFactory()
    asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
    cdt = asset_tools.create_asset(name, path, unreal.CompositeDataTable, factory)
    if cdt is None:
        print('ERROR: Failed to create CompositeDataTable')
    else:
        print('Created CompositeDataTable: {}'.format(full_path))

if cdt:
    # Add source tables — order matters (later tables override earlier for same row names)
    source_tables = [
        '/Game/Blueprint/Core/Player/Input/CUI_InputTable',   # project-specific
        '/CommonUI/GenericInputActionDataTable',                # engine defaults (fallback)
    ]
    tables = []
    for table_path in source_tables:
        dt = unreal.load_asset(table_path)
        if dt:
            tables.append(dt)
        else:
            print('WARNING: Could not load source table: {}'.format(table_path))

    cdt.set_editor_property('parent_tables', tables)
    unreal.EditorAssetLibrary.save_asset(full_path)
    print('Set {} source tables on {}'.format(len(tables), full_path))
```

**Key points:**
- CompositeDataTable reads from source tables at runtime — no data duplication
- Row name conflicts: later tables in the array override earlier ones
- All source tables MUST share the same row struct type
- Useful for: input tables (project + engine defaults), mod support, DLC data layers

## Recipe 14: Create Blueprint UserDefinedEnum

```python
import unreal

name = 'E_ResourceType'
path = '/Game/Blueprint/Interactable/Extras'

full_path = '{}/{}'.format(path, name)
if unreal.EditorAssetLibrary.does_asset_exist(full_path):
    print('Enum already exists: {}'.format(full_path))
    enum_asset = unreal.load_asset(full_path)
else:
    asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
    factory = unreal.EnumFactory()
    enum_asset = asset_tools.create_asset(name, path, unreal.UserDefinedEnum, factory)
    if enum_asset is None:
        print('ERROR: Failed to create enum')
    else:
        # Add enum values — UserDefinedEnum starts with one default entry
        # Use set_editor_property to configure display names
        unreal.EditorAssetLibrary.save_asset(full_path)
        print('Created enum: {}'.format(full_path))

# NOTE: UserDefinedEnum manipulation via Python is limited.
# For complex enums, create via AgentBridge ensure_asset:
ab = unreal.AgentBridgeLibrary
enum_asset = ab.ensure_asset(path, name, 'UserDefinedEnum', 'EnumFactory')
if enum_asset:
    unreal.EditorAssetLibrary.save_asset(full_path)
    print('Ensured enum: {}'.format(full_path))
```

## Recipe 15: Create Standalone CurveFloat Asset

Standalone curve assets (CurveFloat, CurveVector, CurveLinearColor) are individual curves — different from CurveTables which hold multiple named curves.

```python
import unreal

name = 'C_FadeIn'
path = '/Game/Data/Curves'

full_path = '{}/{}'.format(path, name)
if unreal.EditorAssetLibrary.does_asset_exist(full_path):
    print('Curve already exists: {}'.format(full_path))
    curve = unreal.load_asset(full_path)
else:
    asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
    factory = unreal.CurveFloatFactory()
    # For other types: CurveVectorFactory, CurveLinearColorFactory
    curve = asset_tools.create_asset(name, path, None, factory)
    if curve is None:
        print('ERROR: Failed to create curve')
    else:
        unreal.EditorAssetLibrary.save_asset(full_path)
        print('Created CurveFloat: {}'.format(full_path))

# NOTE: Adding keys programmatically requires accessing the internal FRichCurve.
# For complex curves, create the asset then edit in the Curve Editor.
# CurveFloat is commonly used for:
#   - Material animation (wobble, pulse, fade)
#   - Timeline curves in Blueprints
#   - Audio parameter modulation
#   - Camera shake falloff
```

## Recipe 16: Create Blueprint Struct (Co-Located with System)

For Blueprint-only projects, create structs next to the systems that use them:

```python
import unreal

# Co-locate struct with its system (Cropout pattern)
name = 'ST_Job'
path = '/Game/Blueprint/Villagers'  # Same folder as DT_Jobs and villager Blueprints

full_path = '{}/{}'.format(path, name)
if unreal.EditorAssetLibrary.does_asset_exist(full_path):
    print('Struct already exists: {}'.format(full_path))
    struct = unreal.load_asset(full_path)
else:
    asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
    struct = asset_tools.create_asset(
        name, path,
        unreal.UserDefinedStruct, unreal.StructureFactory()
    )
    if struct is None:
        print('ERROR: Failed to create struct')
    else:
        psl = unreal.PythonStructLib
        # Job-related fields
        psl.add_variable(struct, 'string', '', None, 0, False)       # JobName
        psl.add_variable(struct, 'real', 'float', None, 0, False)    # Duration
        psl.add_variable(struct, 'int', '', None, 0, False)          # MaxWorkers
        psl.add_variable(struct, 'bool', '', None, 0, False)         # RequiresBuilding
        unreal.EditorAssetLibrary.save_asset(full_path)
        print('Created struct: {}'.format(full_path))

# Then create the DataTable using this struct
dt_name = 'DT_Jobs'
dt_full = '{}/{}'.format(path, dt_name)
if not unreal.EditorAssetLibrary.does_asset_exist(dt_full):
    factory = unreal.DataTableFactory()
    factory.struct = struct
    dt = asset_tools.create_asset(dt_name, path, unreal.DataTable, factory)
    if dt:
        unreal.EditorAssetLibrary.save_asset(dt_full)
        print('Created DataTable: {} using struct: {}'.format(dt_full, full_path))
```
