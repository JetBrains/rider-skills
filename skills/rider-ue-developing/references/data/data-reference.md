# UE Data Python API Reference

## DataTable Instance Methods

```python
import unreal

dt = unreal.load_asset('/Game/Data/DT_Items')

# --- Export ---
csv_string = dt.export_to_csv_string()
dt.export_to_csv_file('/absolute/path/to/items.csv')
json_string = dt.export_to_json_string()
dt.export_to_json_file('/absolute/path/to/items.json')

# --- Import (empties table first, then fills) ---
dt.fill_from_csv_file('/absolute/path/to/items.csv')
dt.fill_from_csv_string(csv_string)
dt.fill_from_json_file('/absolute/path/to/items.json')
dt.fill_from_json_string(json_string)

# With explicit row struct (runs automated, no dialogs)
struct = dt.get_row_struct()
dt.fill_from_csv_file('/path/to/items.csv', import_row_struct=struct)

# --- Introspection ---
row_names = dt.get_row_names()            # [Name('Sword'), Name('Shield'), ...]
col_names = dt.get_column_names()          # Raw property names
col_export_names = dt.get_column_export_names()  # Friendly names
values = dt.get_column_as_string('BaseDamage')   # All values in one column
exists = dt.does_row_exist('Sword')        # bool
```

## DataTableFunctionLibrary (Static Methods)

```python
dtfl = unreal.DataTableFunctionLibrary

# Export
dtfl.export_data_table_to_csv_file(dt, '/path/out.csv')
dtfl.export_data_table_to_json_file(dt, '/path/out.json')
csv_str = dtfl.export_data_table_to_csv_string(dt)
json_str = dtfl.export_data_table_to_json_string(dt)

# Import
dtfl.fill_data_table_from_csv_file(dt, '/path/in.csv')
dtfl.fill_data_table_from_json_file(dt, '/path/in.json')
dtfl.fill_data_table_from_csv_string(dt, csv_str)
dtfl.fill_data_table_from_json_string(dt, json_str)

# Introspection
row_names = dtfl.get_data_table_row_names(dt)
col_names = dtfl.get_data_table_column_names(dt)
row_struct = dtfl.get_data_table_row_struct(dt)
row_exists = dtfl.does_data_table_row_exist(dt, 'Sword')

# CurveTable evaluation
result = dtfl.evaluate_curve_table_row(curve_table, 'Damage.Melee', 15.0, 'Query')
# Returns tuple: (EvaluateCurveTableResult, float)
```

## PythonDataTableLib (Row Manipulation)

```python
pdtl = unreal.PythonDataTableLib

# Add / remove / rename rows
pdtl.add_row(dt, 'NewRow')
pdtl.remove_row(dt, 'OldRow')
pdtl.rename_row(dt, 'OldName', 'NewName')
pdtl.duplicate_row(dt, 'SourceRow')
pdtl.move_row(dt, from_index, to_index)
pdtl.reset_row(dt, 'RowName')  # Reset to defaults

# Get/set cell values (by row_index, column_index)
val = pdtl.get_property_as_string_at(dt, row_idx, col_idx)
pdtl.set_property_by_string_at(dt, row_idx, col_idx, 'value_string')

# Table info
rows, cols = pdtl.get_shape(dt)
json_str = pdtl.get_table_as_json(dt)
flat = pdtl.get_flatten_data_table(dt, include_header=False)
```

## PythonStructLib (UserDefinedStruct Creation)

```python
psl = unreal.PythonStructLib
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()

# Create struct
struct = asset_tools.create_asset(
    'S_MyItem', '/Game/Data/Structs',
    unreal.UserDefinedStruct, unreal.StructureFactory()
)

# Add variables — (struct, category, subcategory, default_value_struct, array_dim, is_enabled)
psl.add_variable(struct, 'string', '', None, 0, False)       # FString
psl.add_variable(struct, 'real', 'float', None, 0, False)    # float
psl.add_variable(struct, 'int', '', None, 0, False)          # int32
psl.add_variable(struct, 'bool', '', None, 0, False)         # bool
psl.add_variable(struct, 'struct', '', unreal.Vector.static_struct(), 0, False)  # FVector
psl.add_variable(struct, 'object', '', None, 0, False)       # UObject ref
```

## DataTable Properties

| Property | Type | Description |
|----------|------|-------------|
| `row_struct` | `ScriptStruct` | Read-only. The struct type used for rows |
| `import_key_field` | `str` | Which field to use as key on import |
| `ignore_extra_fields` | `bool` | Ignore CSV/JSON fields not in the struct |
| `ignore_missing_fields` | `bool` | Ignore struct fields missing from CSV/JSON |
| `strip_from_client_builds` | `bool` | Exclude from client builds |

## Asset Manager Configuration (DefaultGame.ini)

```ini
[/Script/Engine.AssetManagerSettings]
!PrimaryAssetTypesToScan=ClearArray
+PrimaryAssetTypesToScan=(PrimaryAssetType="Weapons",AssetBaseClass=/Script/MyGame.UWeaponDataAsset,bHasBlueprintClasses=False,bIsEditorOnly=False,Directories=((Path="/Game/Data/Weapons")),SpecificAssets=,Rules=(Priority=-1,bApplyRecursively=True,ChunkId=-1,CookRule=AlwaysCook))
```

## Asset Manager Async Loading (C++)

```cpp
UAssetManager& AM = UAssetManager::Get();

// Get all IDs of a type
TArray<FPrimaryAssetId> WeaponIds;
AM.GetPrimaryAssetIdList(FPrimaryAssetType("Weapons"), WeaponIds);

// Load with bundle
TSharedPtr<FStreamableHandle> Handle = AM.LoadPrimaryAsset(
    WeaponId,
    TArray<FName>{"Game"},  // bundles
    FStreamableDelegate::CreateUObject(this, &UMySubsystem::OnLoaded, WeaponId)
);

// Unload
AM.UnloadPrimaryAsset(WeaponId);

// Change bundles (lobby -> gameplay transition)
AM.ChangeBundleStateForPrimaryAssets(
    LoadedIds,
    TArray<FName>{"Game"},   // Add
    TArray<FName>{"UI"}      // Remove
);
```

## Asset Bundle Tags (C++)

```cpp
UPROPERTY(EditAnywhere, meta = (AssetBundles = "UI"))
TSoftObjectPtr<UTexture2D> Portrait;

UPROPERTY(EditAnywhere, meta = (AssetBundles = "Game"))
TSoftClassPtr<APawn> PawnClass;

UPROPERTY(EditAnywhere, meta = (AssetBundles = "UI,Game"))
TSoftObjectPtr<USoundBase> SelectSound;  // Loads in both contexts
```

## CSV Special Type Encoding

| Type | CSV Format | Example |
|------|-----------|---------|
| `FVector` | `(X=val,Y=val,Z=val)` | `(X=1.0,Y=2.0,Z=3.0)` |
| `FRotator` | `(P=val,Y=val,R=val)` | `(P=0.0,Y=90.0,R=0.0)` |
| `FColor` | `(R=val,G=val,B=val,A=val)` | `(R=255,G=0,B=0,A=255)` |
| `FLinearColor` | `(R=val,G=val,B=val,A=val)` | `(R=1.0,G=0.0,B=0.0,A=1.0)` |
| Nested struct | `(Field1=val,Field2=val)` | `(Value=10,Name="test")` |
| Soft ref | Full path string | `"/Game/BP/BP_Item.BP_Item_C"` |
| Enum | Display name | `"EItemRarity::Legendary"` |
| `FGameplayTag` | Dot-notation | `"Item.Weapon.Melee"` |
| Array | Not supported in CSV | Use JSON instead |

## JSON DataTable Format

```json
[
    {
        "Name": "Sword",
        "DisplayName": "Iron Sword",
        "BaseDamage": 25.0,
        "MaxStackSize": 1,
        "Icon": "/Game/Icons/T_Sword.T_Sword",
        "Tags": {
            "GameplayTags": ["Item.Weapon.Melee"]
        }
    }
]
```

## CurveTable CSV Format

```csv
Name,1,5,10,20,50
XP.Required,100,500,2000,8000,50000
Damage.Melee,10,30,60,100,200
Health.Base,100,200,400,800,2000
```

- First row: X-axis values (e.g., character level)
- Subsequent rows: Y-values at each X point
- Interpolation types: Constant, Linear, Cubic (set at import)

## CompositeDataTable

CompositeDataTable merges multiple DataTables into a single read-only view. No data duplication — reads from source tables at runtime.

```python
# Properties
cdt = unreal.load_asset('/Game/Data/DT_AllInput')
parent_tables = cdt.get_editor_property('parent_tables')  # TArray<UDataTable*>
cdt.set_editor_property('parent_tables', [dt1, dt2, dt3])

# Row access works identically to regular DataTable
row_names = cdt.get_row_names()       # merged row names from all parents
cdt.export_to_json_string()           # exports merged view
```

**Key properties:**
- `parent_tables` — ordered list of source DataTables (later overrides earlier for same RowName)
- All parents MUST use the same row struct
- CompositeDataTable is read-only — cannot add/remove rows directly
- Used for: combining project data with engine defaults, DLC/mod data layering

**Factory:** `unreal.CompositeDataTableFactory()` — creates empty CompositeDataTable, then set `parent_tables`

## Standalone Curve Assets

Individual curve assets (not CurveTable rows). Used for material animation, Blueprint timelines, audio modulation.

| Class | Factory | Purpose |
|-------|---------|---------|
| `CurveFloat` | `CurveFloatFactory` | Single float curve (opacity, speed, wobble) |
| `CurveVector` | `CurveVectorFactory` | XYZ vector curve (position, scale) |
| `CurveLinearColor` | `CurveLinearColorFactory` | RGBA color curve (color gradients) |
| `CurveLinearColorAtlas` | — | Atlas of multiple color curves (material lookups) |

```python
# Create standalone CurveFloat
factory = unreal.CurveFloatFactory()
curve = unreal.AssetToolsHelpers.get_asset_tools().create_asset(
    'C_WobbleCurve', '/Game/Environment/Materials/Textures', None, factory)

# CurveFloat is commonly referenced by:
# - Material parameter collections (texture animation)
# - Blueprint Timeline nodes
# - Audio ControlBus modulation
# - Camera shake intensity falloff
```

**Naming:** `C_` prefix for standalone curves (e.g., `C_WobbleCurve`, `C_FadeIn`)

## UserDefinedEnum

Blueprint-accessible enum assets created in-editor or via Python.

```python
# Create
factory = unreal.EnumFactory()
enum_asset = unreal.AssetToolsHelpers.get_asset_tools().create_asset(
    'E_ResourceType', '/Game/Blueprint/Interactable/Extras',
    unreal.UserDefinedEnum, factory)

# Or via AgentBridge (safer)
enum_asset = unreal.RiderAgentBridgeLibrary.ensure_asset(
    '/Game/Blueprint/Interactable/Extras', 'E_ResourceType',
    'UserDefinedEnum', 'EnumFactory')
```

**Naming:** `E_` prefix (e.g., `E_ResourceType`, `E_InputType`)

## EditorAssetLibrary Quick Reference

```python
eal = unreal.EditorAssetLibrary

eal.does_asset_exist('/Game/Data/DT_Items')      # bool
eal.save_asset('/Game/Data/DT_Items')             # save
eal.duplicate_asset(src, dst)                     # copy
eal.list_assets('/Game/Data/', recursive=True)    # enumerate
dt = eal.load_asset('/Game/Data/DT_Items')        # load
```
