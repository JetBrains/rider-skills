# UE Data-Driven Content Systems

Comprehensive reference for DataTables, DataAssets, CurveTables, Asset Manager, Data Registries, CSV/JSON workflows, and Python automation.

---

## 1. DataTables

### Overview
DataTables (`UDataTable`) are imported spreadsheet tables storing rows of structured data. Each row is keyed by a unique `FName` (RowName). Ideal for bulk structured data: item databases, dialogue lines, loot tables, level config.

### Row Struct Definition (C++)

```cpp
#include "Engine/DataTable.h"

USTRUCT(BlueprintType)
struct FItemDataRow : public FTableRowBase
{
    GENERATED_BODY()

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    FText DisplayName;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float BaseDamage = 10.0f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    int32 MaxStackSize = 1;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TSoftObjectPtr<UTexture2D> Icon;

    // Reference another DataTable row (type-safe, UE 5.0+)
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    FDataTableRowHandle UpgradeItem;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    FGameplayTagContainer Tags;
};
```

**Rules:**
- MUST inherit from `FTableRowBase`
- MUST be a `USTRUCT`, not a `UCLASS`
- CANNOT contain `UObject*` (hard object pointers) -- use `TSoftObjectPtr` or `TSoftClassPtr` instead
- First CSV column is always `RowName` (the key)

### CSV Format

```csv
RowName,DisplayName,BaseDamage,MaxStackSize,Icon,Tags
Sword,"Iron Sword",25.0,1,"/Game/Icons/T_Sword.T_Sword","Item.Weapon.Melee"
Shield,"Wooden Shield",0.0,1,"/Game/Icons/T_Shield.T_Shield","Item.Armor.Shield"
Potion,"Health Potion",0.0,10,"/Game/Icons/T_Potion.T_Potion","Item.Consumable"
```

**Special type encoding in CSV:**
| Type | CSV Format | Example |
|------|-----------|---------|
| `FVector` | `(X=val,Y=val,Z=val)` | `(X=1.0,Y=2.0,Z=3.0)` |
| `FRotator` | `(P=val,Y=val,R=val)` | `(P=0.0,Y=90.0,R=0.0)` |
| `FColor` | `(R=val,G=val,B=val,A=val)` | `(R=255,G=0,B=0,A=255)` |
| `FLinearColor` | `(R=val,G=val,B=val,A=val)` | `(R=1.0,G=0.0,B=0.0,A=1.0)` |
| Nested struct | `(Field1=val,Field2=val)` | `(Value=10,Name="test")` |
| Soft ref | Full path string | `"/Game/BP/BP_Item.BP_Item_C"` |
| Enum | Display name string | `"EItemRarity::Legendary"` |
| `FGameplayTag` | Dot-notation string | `"Item.Weapon.Melee"` |
| Array | Not well-supported in CSV | Use JSON instead |

### JSON Format

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
    },
    {
        "Name": "Shield",
        "DisplayName": "Wooden Shield",
        "BaseDamage": 0.0,
        "MaxStackSize": 1,
        "Icon": "/Game/Icons/T_Shield.T_Shield",
        "Tags": {
            "GameplayTags": ["Item.Armor.Shield"]
        }
    }
]
```

JSON is preferred over CSV when:
- Row struct contains arrays, maps, or nested structs
- You need human-readable diffs
- Round-trip fidelity matters (CSV can lose precision on complex types)

### Runtime Lookup (C++)

```cpp
// Single row lookup
UDataTable* ItemTable = LoadObject<UDataTable>(nullptr, TEXT("/Game/Data/DT_Items"));
FString Context = TEXT("ItemLookup");
FItemDataRow* Row = ItemTable->FindRow<FItemDataRow>(FName("Sword"), Context);
if (Row)
{
    float Damage = Row->BaseDamage;
}

// Iterate all rows
TArray<FName> RowNames = ItemTable->GetRowNames();
for (const FName& Name : RowNames)
{
    FItemDataRow* R = ItemTable->FindRow<FItemDataRow>(Name, Context);
}

// Get all rows as array
TArray<FItemDataRow*> AllRows;
ItemTable->GetAllRows<FItemDataRow>(Context, AllRows);

// Check existence
bool bExists = ItemTable->FindRowUnchecked(FName("Sword")) != nullptr;
```

### Runtime Lookup (Blueprint)
- **Get Data Table Row** -- returns a row struct by name (breaks on missing row)
- **Get Data Table Row Names** -- returns all row keys
- **Does Data Table Row Exist** -- safe existence check

### DataTable Properties (Python API)

| Property | Type | Description |
|----------|------|-------------|
| `row_struct` | `ScriptStruct` | Read-only. The struct type used for rows |
| `import_key_field` | `str` | Which field to use as key on import (default: "Name" for JSON, first field for CSV) |
| `ignore_extra_fields` | `bool` | Ignore CSV/JSON fields not in the struct |
| `ignore_missing_fields` | `bool` | Ignore struct fields missing from CSV/JSON |
| `strip_from_client_builds` | `bool` | Exclude from client builds when True |

### Performance Notes
- `FindRow<T>()` is O(1) hash lookup by FName -- very fast
- Loading the entire DataTable loads ALL rows into memory
- For thousands of rows, consider splitting into multiple tables or using Data Registries
- DataTables are stored as binary UAssets -- cannot diff, require exclusive locking in Perforce

---

## 2. DataAssets (UDataAsset / UPrimaryDataAsset)

### UDataAsset
Base class for data-only assets. Each instance is a separate `.uasset` file.

```cpp
UCLASS(BlueprintType)
class UWeaponDataAsset : public UDataAsset
{
    GENERATED_BODY()
public:
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    FText DisplayName;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float BaseDamage = 10.0f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    UTexture2D* Icon;  // Hard reference OK in DataAssets

    UPROPERTY(EditAnywhere, Instanced)
    TArray<UAbilityEffect*> Effects;  // UObject instances OK!

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TArray<UWeaponDataAsset*> UpgradeChain;
};
```

**Create in Editor:** Right-click Content Browser -> Miscellaneous -> Data Asset -> select your class.

### UPrimaryDataAsset
Extends `UDataAsset` with automatic Asset Manager integration:
- Auto-generates `GetPrimaryAssetId()` from class type + asset name
- Supports Asset Bundles via `UPROPERTY` meta tags
- Discoverable by Asset Manager scan

```cpp
UCLASS(BlueprintType)
class UCharacterDataAsset : public UPrimaryDataAsset
{
    GENERATED_BODY()
public:
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    FText CharacterName;

    // Loaded only when "UI" bundle is requested
    UPROPERTY(EditAnywhere, BlueprintReadWrite, meta = (AssetBundles = "UI"))
    TSoftObjectPtr<UTexture2D> Portrait;

    // Loaded only when "Game" bundle is requested
    UPROPERTY(EditAnywhere, BlueprintReadWrite, meta = (AssetBundles = "Game"))
    TSoftClassPtr<APawn> PawnClass;

    // Override to customize the primary asset type name
    virtual FPrimaryAssetId GetPrimaryAssetId() const override
    {
        return FPrimaryAssetId("Characters", GetFName());
    }
};
```

### When to Use Each

| Criterion | DataTable | UDataAsset | UPrimaryDataAsset |
|-----------|-----------|------------|-------------------|
| Hundreds of similar entries | Best | Tedious (1 file each) | Tedious |
| Complex UObject hierarchies | Cannot | Best | Best |
| CSV/JSON import/export | Built-in | No | No |
| Inheritance / defaults | No | Yes (subclass) | Yes |
| Asset Manager integration | Manual | Manual | Automatic |
| Async bundle loading | No | No | Yes |
| Tabular editing | Built-in | Property Matrix | Property Matrix |
| Can hold UObject instances | No | Yes | Yes |
| Bulk Property editing | Limited | Property Matrix | Property Matrix |

**Rule of thumb:**
- Use **DataTable** for flat, tabular data with many rows (items, buffs, dialogue, loot)
- Use **UDataAsset** for complex objects with UObject references, inheritance, few instances
- Use **UPrimaryDataAsset** when you need Asset Manager discovery, async loading, or bundle-based loading

---

## 3. CurveTables

### Overview
`UCurveTable` stores 2D float curves keyed by row name. Values interpolate between defined X data points. Ideal for level scaling, XP curves, damage falloff, difficulty ramps.

### CSV Format

```csv
Name,1,5,10,20,50
XP.Required,100,500,2000,8000,50000
Damage.Melee,10,30,60,100,200
Damage.Ranged,15,25,50,80,150
Health.Base,100,200,400,800,2000
```

- First row: X-axis values (e.g., character level)
- Subsequent rows: Y-values at each X point
- Row names can use dot notation for organization (e.g., `Ship.HitPoints`)

### JSON Format

```json
[
    {
        "Name": "XP.Required",
        "1": 100,
        "5": 500,
        "10": 2000,
        "20": 8000,
        "50": 50000
    },
    {
        "Name": "Damage.Melee",
        "1": 10,
        "5": 30,
        "10": 60,
        "20": 100,
        "50": 200
    }
]
```

### Interpolation Types (set at import, immutable after)

| Type | Behavior |
|------|----------|
| **Constant** | Clamps to previous known Y value (step function) |
| **Linear** | Linear interpolation between data points |
| **Cubic** | Smooth cubic interpolation between data points |

### C++ API

```cpp
// Using FScalableFloat (GameplayAbilities plugin)
UPROPERTY(EditAnywhere)
FScalableFloat MeleeDamage;  // Bind to CurveTable row in editor

// Evaluate at level
float Level = 15.0f;
float Damage = MeleeDamage.GetValueAtLevel(Level);
int32 DamageInt = MeleeDamage.AsInteger(Level);
bool bUnlocked = MeleeDamage.AsBool(Level);

// Direct CurveTable access
UCurveTable* CT = LoadObject<UCurveTable>(nullptr, TEXT("/Game/Data/CT_Scaling"));
static const FName RowName(TEXT("Damage.Melee"));
FRealCurve* Curve = CT->FindCurve(RowName, TEXT("DamageQuery"));
if (Curve)
{
    float Val = Curve->Eval(Level);
}
```

### Blueprint API
- **Evaluate Curve Table Row** -- evaluates a row at a given X value, returns float + success bool
- No built-in Blueprint support for `FScalableFloat` type interpretation (int/bool)

### Use Cases
- XP requirements per level
- Damage/health scaling with character level
- Drop rate curves
- Difficulty modifiers over time
- Movement speed by upgrade tier
- Cooldown reduction per rank

### Composite CurveTables
- Combine multiple CurveTables with override priority
- Later tables override earlier ones for same row names
- Useful for DLC/mod overrides
- Caveat: exported merged data cannot be reimported into composite form

---

## 4. Asset Manager

### Core Concepts

The Asset Manager (`UAssetManager`) provides:
- Discovery and categorization of Primary Assets
- Async loading with bundle control
- Memory management via StreamableHandles
- Chunk assignment for packaging/distribution

### Key Classes

| Class | Purpose |
|-------|---------|
| `UAssetManager` | Singleton manager, subclass for game-specific logic |
| `FPrimaryAssetId` | `Type:Name` identifier (e.g., `"Weapons:Sword_01"`) |
| `FPrimaryAssetType` | Category FName (e.g., `"Weapons"`) |
| `FPrimaryAssetRules` | Cooking, chunking, priority rules |
| `FStreamableManager` | Low-level async loader (used internally) |
| `FStreamableHandle` | Handle keeping loaded assets in memory |
| `UPrimaryAssetLabel` | Editor asset for assigning chunk IDs |

### Configuration (DefaultGame.ini)

```ini
[/Script/Engine.AssetManagerSettings]
!PrimaryAssetTypesToScan=ClearArray
+PrimaryAssetTypesToScan=(PrimaryAssetType="Map",AssetBaseClass=/Script/Engine.World,bHasBlueprintClasses=False,bIsEditorOnly=True,Directories=((Path="/Game/Maps")),SpecificAssets=,Rules=(Priority=-1,bApplyRecursively=True,ChunkId=-1,CookRule=Unknown))
+PrimaryAssetTypesToScan=(PrimaryAssetType="Weapons",AssetBaseClass=/Script/MyGame.UWeaponDataAsset,bHasBlueprintClasses=False,bIsEditorOnly=False,Directories=((Path="/Game/Data/Weapons")),SpecificAssets=,Rules=(Priority=-1,bApplyRecursively=True,ChunkId=-1,CookRule=AlwaysCook))
+PrimaryAssetTypesToScan=(PrimaryAssetType="Characters",AssetBaseClass=/Script/MyGame.UCharacterDataAsset,bHasBlueprintClasses=True,bIsEditorOnly=False,Directories=((Path="/Game/Data/Characters")),SpecificAssets=,Rules=(Priority=-1,bApplyRecursively=True,ChunkId=-1,CookRule=Unknown))
```

Also configurable in **Project Settings -> Game -> Asset Manager**.

### Async Loading (C++)

```cpp
UAssetManager& AM = UAssetManager::Get();

// Get all IDs of a type
TArray<FPrimaryAssetId> WeaponIds;
AM.GetPrimaryAssetIdList(FPrimaryAssetType("Weapons"), WeaponIds);

// Load single asset with callback
FStreamableDelegate Delegate = FStreamableDelegate::CreateUObject(
    this, &UMySubsystem::OnWeaponLoaded, WeaponId);
TSharedPtr<FStreamableHandle> Handle = AM.LoadPrimaryAsset(
    WeaponId,
    TArray<FName>{"Game"},  // Asset bundles to load
    Delegate
);

// Callback
void UMySubsystem::OnWeaponLoaded(FPrimaryAssetId AssetId)
{
    UObject* Loaded = UAssetManager::Get().GetPrimaryAssetObject(AssetId);
    UWeaponDataAsset* Weapon = Cast<UWeaponDataAsset>(Loaded);
}

// Load multiple assets
TSharedPtr<FStreamableHandle> BatchHandle = AM.LoadPrimaryAssets(
    WeaponIds,
    TArray<FName>{"UI"},
    FStreamableDelegate::CreateLambda([this]() {
        // All loaded
    })
);

// Preload (temporary, released when handle goes out of scope)
TSharedPtr<FStreamableHandle> PreloadHandle = AM.PreloadPrimaryAssets(
    WeaponIds, TArray<FName>{"Game"}, false);

// Unload
AM.UnloadPrimaryAsset(WeaponId);

// Change active bundles (e.g., switching from lobby to gameplay)
AM.ChangeBundleStateForPrimaryAssets(
    LoadedAssetIds,
    TArray<FName>{"Game"},   // Add these bundles
    TArray<FName>{"UI"}      // Remove these bundles
);
```

### Async Loading (Blueprint)
- **Async Load Primary Asset** -- loads one asset, fires delegate on complete
- **Async Load Primary Asset List** -- loads multiple, fires delegate on complete
- **Get Primary Asset Id List** -- get all IDs of a type
- **Unload Primary Asset** -- release strong reference

### Load vs Preload
| Method | Strong Reference? | Auto-Unload? |
|--------|------------------|--------------|
| `LoadPrimaryAsset(s)` | Yes (Asset Manager holds ref) | Must call `UnloadPrimaryAsset()` |
| `PreloadPrimaryAssets` | No (handle only) | When handle is released |

### Asset Bundles
Tag soft references with bundle names to control what loads:

```cpp
// In your UPrimaryDataAsset subclass:
UPROPERTY(EditAnywhere, meta = (AssetBundles = "UI"))
TSoftObjectPtr<UTexture2D> Thumbnail;

UPROPERTY(EditAnywhere, meta = (AssetBundles = "Game"))
TSoftClassPtr<AActor> SpawnableClass;

UPROPERTY(EditAnywhere, meta = (AssetBundles = "UI,Game"))
TSoftObjectPtr<USoundBase> SelectSound;  // Loads in both contexts
```

Request specific bundles when loading:
```cpp
AM.LoadPrimaryAsset(Id, {"UI"});    // Only loads Thumbnail + SelectSound
AM.LoadPrimaryAsset(Id, {"Game"});  // Only loads SpawnableClass + SelectSound
```

### Custom Asset Manager

```cpp
// MyGameAssetManager.h
UCLASS()
class UMyGameAssetManager : public UAssetManager
{
    GENERATED_BODY()
public:
    virtual void StartInitialLoading() override;

    // Convenience accessor
    static UMyGameAssetManager& Get();
};

// Register in DefaultEngine.ini:
// [/Script/Engine.Engine]
// AssetManagerClassName=/Script/MyGame.MyGameAssetManager
```

---

## 5. CSV/JSON Import/Export & Python Automation

### Python API: unreal.DataTable Methods

```python
import unreal

# Load existing DataTable
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

### Python API: unreal.DataTableFunctionLibrary (Class Methods)

```python
import unreal

dt = unreal.load_asset('/Game/Data/DT_Items')

# Export
unreal.DataTableFunctionLibrary.export_data_table_to_csv_file(dt, '/path/to/out.csv')
unreal.DataTableFunctionLibrary.export_data_table_to_json_file(dt, '/path/to/out.json')
csv_str = unreal.DataTableFunctionLibrary.export_data_table_to_csv_string(dt)
json_str = unreal.DataTableFunctionLibrary.export_data_table_to_json_string(dt)

# Import
unreal.DataTableFunctionLibrary.fill_data_table_from_csv_file(dt, '/path/to/in.csv')
unreal.DataTableFunctionLibrary.fill_data_table_from_json_file(dt, '/path/to/in.json')
unreal.DataTableFunctionLibrary.fill_data_table_from_csv_string(dt, csv_str)
unreal.DataTableFunctionLibrary.fill_data_table_from_json_string(dt, json_str)

# Introspection
row_names = unreal.DataTableFunctionLibrary.get_data_table_row_names(dt)
col_names = unreal.DataTableFunctionLibrary.get_data_table_column_names(dt)
row_struct = unreal.DataTableFunctionLibrary.get_data_table_row_struct(dt)
row_exists = unreal.DataTableFunctionLibrary.does_data_table_row_exist(dt, 'Sword')

# CurveTable evaluation
result = unreal.DataTableFunctionLibrary.evaluate_curve_table_row(
    curve_table, 'Damage.Melee', 15.0, 'DamageQuery')
# Returns tuple: (EvaluateCurveTableResult, float)
```

### Creating DataTables Programmatically (Python)

```python
import unreal

# 1. Create the row struct (UserDefinedStruct)
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
struct = asset_tools.create_asset(
    'S_MyItem', '/Game/Data/Structs',
    unreal.UserDefinedStruct, unreal.StructureFactory()
)

# Add variables to the struct
unreal.PythonStructLib.add_variable(struct, 'string', '', None, 0, False)   # FString
unreal.PythonStructLib.add_variable(struct, 'real', 'float', None, 0, False)  # float
unreal.PythonStructLib.add_variable(struct, 'int', '', None, 0, False)      # int32
unreal.PythonStructLib.add_variable(struct, 'struct', '',
    unreal.Vector.static_struct(), 0, False)  # FVector

# 2. Create the DataTable using that struct
factory = unreal.DataTableFactory()
factory.struct = struct  # or unreal.load_asset('/Game/Data/Structs/S_MyItem')
dt = asset_tools.create_asset(
    'DT_MyItems', '/Game/Data',
    unreal.DataTable, factory
)

# 3. Add rows
unreal.PythonDataTableLib.add_row(dt, 'Row_001')
unreal.PythonDataTableLib.add_row(dt, 'Row_002')

# 4. Set cell values (by index: row_index, column_index)
unreal.PythonDataTableLib.set_property_by_string_at(dt, 0, 0, 'Iron Sword')
unreal.PythonDataTableLib.set_property_by_string_at(dt, 0, 1, '25.0')
unreal.PythonDataTableLib.set_property_by_string_at(dt, 0, 2, '1')
unreal.PythonDataTableLib.set_property_by_string_at(dt, 0, 3, '(X=0,Y=0,Z=100)')

# 5. Read cell values
val = unreal.PythonDataTableLib.get_property_as_string_at(dt, 0, 0)  # 'Iron Sword'

# 6. Other row operations
unreal.PythonDataTableLib.rename_row(dt, 'Row_001', 'Sword')
unreal.PythonDataTableLib.duplicate_row(dt, 'Sword')
unreal.PythonDataTableLib.remove_row(dt, 'Row_002')
unreal.PythonDataTableLib.move_row(dt, 0, 1)  # from_index, to_index
unreal.PythonDataTableLib.reset_row(dt, 'Sword')  # Reset to defaults

# 7. Get table dimensions and data
rows, cols = unreal.PythonDataTableLib.get_shape(dt)
json_str = unreal.PythonDataTableLib.get_table_as_json(dt)
flat = unreal.PythonDataTableLib.get_flatten_data_table(dt, include_header=False)

# 8. Save
unreal.EditorAssetLibrary.save_asset('/Game/Data/DT_MyItems')
```

### Round-Trip Workflow (External Excel/Google Sheets)

```
Excel/Sheets  -->  Export CSV  -->  Python script  -->  fill_from_csv_file()
                                                              |
                                                        UE DataTable
                                                              |
                                                   export_to_csv_file()  -->  Import back to Excel
```

**Complete round-trip script:**

```python
import unreal
import os

PROJECT_DIR = unreal.Paths.project_dir()
CSV_DIR = os.path.join(PROJECT_DIR, 'RawData')

def export_all_tables(table_paths, output_dir=CSV_DIR):
    """Export multiple DataTables to CSV for external editing."""
    os.makedirs(output_dir, exist_ok=True)
    for path in table_paths:
        dt = unreal.load_asset(path)
        if dt is None:
            unreal.log_warning(f'Could not load: {path}')
            continue
        name = path.rsplit('/', 1)[-1]
        csv_path = os.path.join(output_dir, f'{name}.csv')
        if dt.export_to_csv_file(csv_path):
            unreal.log(f'Exported: {csv_path}')
        else:
            unreal.log_error(f'Failed to export: {path}')

def import_all_tables(table_map, input_dir=CSV_DIR):
    """Import CSVs back into DataTables. table_map: {asset_path: csv_filename}"""
    for asset_path, csv_name in table_map.items():
        dt = unreal.load_asset(asset_path)
        if dt is None:
            unreal.log_warning(f'Could not load: {asset_path}')
            continue
        csv_path = os.path.join(input_dir, csv_name)
        struct = dt.get_row_struct()
        if dt.fill_from_csv_file(csv_path, import_row_struct=struct):
            unreal.log(f'Imported: {csv_path} -> {asset_path}')
            unreal.EditorAssetLibrary.save_asset(asset_path)
        else:
            unreal.log_error(f'Failed to import: {csv_path}')

# Usage
TABLES = ['/Game/Data/DT_Items', '/Game/Data/DT_Enemies', '/Game/Data/DT_Dialogue']
export_all_tables(TABLES)

import_all_tables({
    '/Game/Data/DT_Items': 'DT_Items.csv',
    '/Game/Data/DT_Enemies': 'DT_Enemies.csv',
})
```

### CSV Encoding Gotchas
- MUST use UTF-8 encoding (with or without BOM)
- Column headers MUST match UPROPERTY names exactly (case-sensitive)
- First column MUST be `RowName` (or configured via `import_key_field`)
- Avoid field names `Name` (reserved in JSON mode)
- Spaces in field names cause parsing errors after packaging
- Commas inside string values MUST be quoted: `"Hello, World"`
- Arrays are NOT well-supported in CSV -- use JSON format instead
- Windows Excel may save as Windows-1252 by default -- force UTF-8

---

## 6. Data-Driven Gameplay

### GameplayTags + DataTables

GameplayTags can be defined via DataTables using the `GameplayTagTableRow` struct:

```csv
Tag,DevComment
Item.Weapon.Melee,"All melee weapons"
Item.Weapon.Ranged,"All ranged weapons"
Item.Consumable,"Consumable items"
Ability.Fire,"Fire-based abilities"
Status.Burning,"Burning damage-over-time"
```

**Setup:** Project Settings -> GameplayTags -> Add DataTable to Gameplay Tag Table List.

**Usage pattern -- tag-filtered DataTable queries:**

```cpp
// Filter items by tag
TArray<FItemDataRow*> AllItems;
ItemTable->GetAllRows<FItemDataRow>(TEXT("TagFilter"), AllItems);

TArray<FItemDataRow*> MeleeWeapons;
FGameplayTagContainer RequiredTags;
RequiredTags.AddTag(FGameplayTag::RequestGameplayTag(FName("Item.Weapon.Melee")));

for (FItemDataRow* Item : AllItems)
{
    if (Item->Tags.HasAll(RequiredTags))
    {
        MeleeWeapons.Add(Item);
    }
}
```

### Soft References in DataTables

Always use soft references for assets in DataTable rows to avoid loading everything at once:

```cpp
USTRUCT(BlueprintType)
struct FItemRow : public FTableRowBase
{
    GENERATED_BODY()

    // GOOD: Soft reference, loads on demand
    UPROPERTY(EditAnywhere)
    TSoftObjectPtr<UStaticMesh> Mesh;

    UPROPERTY(EditAnywhere)
    TSoftClassPtr<AActor> ActorClass;

    // BAD: Hard reference, forces immediate load of the mesh
    // UPROPERTY(EditAnywhere)
    // UStaticMesh* Mesh;  // DO NOT DO THIS
};

// Async-load the soft reference when needed:
TSoftObjectPtr<UStaticMesh> MeshRef = Row->Mesh;
if (!MeshRef.IsNull())
{
    FStreamableManager& StreamableManager = UAssetManager::GetStreamableManager();
    StreamableManager.RequestAsyncLoad(
        MeshRef.ToSoftObjectPath(),
        FStreamableDelegate::CreateLambda([MeshRef]()
        {
            UStaticMesh* LoadedMesh = MeshRef.Get();
            // Use mesh
        })
    );
}
```

### Data Registries

Data Registries combine and manage data from multiple DataTable sources with override support:

- **Purpose:** Merge data from base game + DLC + mods with priority ordering
- **Configuration:** Project Settings -> Game -> Data Registry
- **Key class:** `UDataRegistry`
- **Sources:** DataTables, CurveTables, or custom sources
- **Lookup:** `UDataRegistrySubsystem::AcquireItem()` for async, `FindCachedItemBP()` for cached

```cpp
// Async acquire from registry
UDataRegistrySubsystem* DRS = UDataRegistrySubsystem::Get();
FDataRegistryId ItemId(FDataRegistryType("Items"), FName("Sword"));
DRS->AcquireItem(ItemId, FDataRegistryItemAcquiredCallback::CreateLambda(
    [](const FDataRegistryAcquireResult& Result)
    {
        const FItemDataRow* Row = Result.GetItem<FItemDataRow>();
    }
));
```

### FDataTableRowHandle (Type-Safe Row References)

```cpp
UPROPERTY(EditAnywhere, meta = (RowType = "/Script/MyGame.FItemDataRow"))
FDataTableRowHandle ItemRef;

// Resolve at runtime
FItemDataRow* Row = ItemRef.GetRow<FItemDataRow>(TEXT("Resolving item ref"));
```

In Blueprint, the editor provides a dropdown picker filtered by the DataTable and struct type.

---

## 7. Common Pitfalls

### Row Struct Changes Breaking Tables

**Problem:** Adding/removing/renaming UPROPERTY fields in a C++ row struct can corrupt DataTable assets.

**Hot-reload is especially dangerous:**
- Adding new properties with hot-reload may not show them in editor
- After editor restart, the DataTable may reference the hot-reloaded struct (REINST_) instead of the real struct
- ALL table data can be lost

**Mitigation:**
- NEVER rely on hot-reload for struct changes -- always restart the editor
- Use `ignore_missing_fields = true` when importing after removing columns
- Use `ignore_extra_fields = true` when importing CSVs with extra columns
- Keep a JSON export backup before making struct changes
- Add new fields with default values to avoid breaking existing rows

### CSV Encoding Issues

| Issue | Symptom | Fix |
|-------|---------|-----|
| Wrong encoding | Garbled text, missing characters | Save as UTF-8 (not Windows-1252) |
| BOM bytes | First column name not matching | Use UTF-8 without BOM, or handle BOM |
| CRLF vs LF | May cause issues on some platforms | Normalize line endings |
| Unquoted commas | Row splits incorrectly | Quote all string fields |
| Trailing newline | Phantom empty row | Strip trailing whitespace |
| Excel auto-format | Numbers become dates, leading zeros stripped | Format cells as Text before editing |

### Circular References

**Problem:** DataAssets referencing each other create circular dependencies, causing:
- Infinite load loops
- Package cook failures
- Memory leaks

**Mitigation:**
- Use `TSoftObjectPtr` / `TSoftClassPtr` instead of hard references
- Use `FDataTableRowHandle` to reference rows indirectly
- Break cycles with FName or FPrimaryAssetId identifiers instead of direct pointers

### Hot-Reload Issues with DataAssets

- DataAssets in memory may hold stale data after hot-reload
- Blueprint-derived DataAssets may lose their CDO (Class Default Object) overrides
- Always restart editor for DataAsset class changes
- Live Coding (Ctrl+Alt+F11) is generally safer than hot-reload but still not 100% safe for struct layout changes

### Binary UAsset Limitations

- DataTables and DataAssets are stored as binary `.uasset` files
- Cannot diff in version control -- always shows as "binary file changed"
- In Perforce: requires exclusive lock (check-out) to edit
- In Git: use Git LFS; consider JSON sidecar files for diff-friendly history

### Other Pitfalls

- **RowName collisions:** Duplicate row names silently overwrite earlier rows on import
- **FindRow returning nullptr:** Always null-check; row may have been removed or renamed
- **DataTable in packaged build:** Ensure the DataTable is referenced by something or marked AlwaysCook, otherwise it gets stripped
- **Blueprint struct changes:** Changing a Blueprint-defined struct used by a DataTable can corrupt ALL rows -- prefer C++ structs

---

## 8. UE Python API Reference Summary

### Key Classes for DataTable Operations

| Class | Purpose |
|-------|---------|
| `unreal.DataTable` | The DataTable asset class; has import/export/introspection methods |
| `unreal.DataTableFunctionLibrary` | Static helper methods for DataTable and CurveTable operations |
| `unreal.PythonDataTableLib` | Extended row manipulation: add, remove, rename, move, duplicate rows; get/set cell values |
| `unreal.PythonStructLib` | Create and modify UserDefinedStruct assets programmatically |
| `unreal.PythonEnumLib` | Create and modify UserDefinedEnum assets programmatically |
| `unreal.DataTableFactory` | Factory for creating new DataTable assets (set `.struct` before creation) |
| `unreal.StructureFactory` | Factory for creating new UserDefinedStruct assets |
| `unreal.EnumFactory` | Factory for creating new UserDefinedEnum assets |
| `unreal.AssetToolsHelpers` | Access `get_asset_tools()` for `create_asset()` calls |
| `unreal.EditorAssetLibrary` | Save, delete, duplicate, rename assets; check existence |
| `unreal.CurveTable` | CurveTable asset class |

### EditorAssetLibrary Useful Methods

```python
import unreal

eal = unreal.EditorAssetLibrary

# Check if asset exists
eal.does_asset_exist('/Game/Data/DT_Items')

# Save after modification
eal.save_asset('/Game/Data/DT_Items')

# Duplicate
eal.duplicate_asset('/Game/Data/DT_Items', '/Game/Data/DT_Items_Backup')

# Delete
eal.delete_asset('/Game/Data/DT_Items_Old')

# List assets in directory
assets = eal.list_assets('/Game/Data/', recursive=True)

# Load asset (same as unreal.load_asset)
dt = eal.load_asset('/Game/Data/DT_Items')
```

---

## 9. Best Practices

### Decision Matrix: DataTable vs DataAsset vs Config

| Data Type | Recommended Store | Reason |
|-----------|------------------|--------|
| Item definitions (100s of items) | DataTable | Tabular, CSV-importable, fast lookup |
| Character abilities | DataTable + CurveTable | Flat stats in DT, scaling in CT |
| Unique boss configurations | UPrimaryDataAsset | Complex, few instances, bundle loading |
| UI theme/style data | UDataAsset | Contains UObject refs (materials, fonts) |
| Server connection strings | Config (.ini) | Environment-specific, not game content |
| Difficulty presets | DataTable | Easy to compare side-by-side |
| Procedural generation rules | UDataAsset | Needs inheritance, UObject instances |
| Localization strings | FText + DataTable | CSV round-trip for translators |
| XP/damage curves | CurveTable | Built-in interpolation |
| Mod-overridable game data | Data Registry | Multiple sources with priority merge |

### Naming Conventions

| Asset Type | Prefix | Example |
|-----------|--------|---------|
| DataTable | `DT_` | `DT_Items`, `DT_Dialogue`, `DT_LootTables` |
| CurveTable | `CT_` | `CT_DamageScaling`, `CT_XPRequirements` |
| DataAsset | `DA_` | `DA_BossConfig`, `DA_WeaponMelee_Sword` |
| Row Struct (C++) | `F...Row` | `FItemDataRow`, `FDialogueRow` |
| Row Struct (BP) | `S_` | `S_ItemRow`, `S_EnemyRow` |
| UserDefinedEnum | `E_` | `E_ItemRarity`, `E_DamageType` |

### Folder Structure

```
Content/
  Data/
    DataTables/
      DT_Items.uasset
      DT_Enemies.uasset
      DT_Dialogue.uasset
    CurveTables/
      CT_DamageScaling.uasset
      CT_XPRequirements.uasset
    DataAssets/
      Characters/
        DA_Hero_Warrior.uasset
        DA_Hero_Mage.uasset
      Weapons/
        DA_Weapon_Sword.uasset
        DA_Weapon_Staff.uasset
    Structs/          (Blueprint-defined structs only; C++ structs live in code)
      S_ItemRow.uasset
    Enums/
      E_ItemRarity.uasset
  RawData/            (NOT in Content/ -- excluded from cook)
    DT_Items.csv
    DT_Enemies.csv
    CT_DamageScaling.csv
```

### Performance Guidelines

1. **Minimize hard references in DataTable rows** -- every hard-referenced asset loads when the DataTable loads
2. **Use soft references** (`TSoftObjectPtr`, `TSoftClassPtr`) for meshes, textures, Blueprints
3. **Split large DataTables** (1000+ rows) by category for faster partial loading
4. **Use CurveTables** instead of large DataTables when data is continuous/interpolatable
5. **Async-load DataAssets** via Asset Manager rather than `LoadObject<>()` to avoid hitches
6. **`FindRow<T>()`** is O(1) by FName -- safe for per-frame lookups if the table is already loaded
7. **Cache row pointers** -- the pointer is stable as long as the DataTable remains loaded
8. **`strip_from_client_builds`** -- mark server-only DataTables to reduce client package size
9. **Data Registries** add indirection overhead -- only use when multi-source merging is needed
10. **Profile with Asset Audit** (Window -> Developer Tools -> Asset Audit) to find oversized tables and reference chains

### Source Control Tips

- Export JSON sidecars alongside binary .uasset for diffable history
- Automate CSV export in CI to detect unintended data changes
- Use exclusive checkout (Perforce) or file locking (Git LFS) for DataTable assets
- Keep a `RawData/` folder outside `Content/` for authoritative CSV/JSON sources
- Automate import via Python Editor Utility to ensure single source of truth
