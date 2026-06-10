# Data-Driven Gameplay Patterns

## GameplayTags via DataTable

Define tags in CSV using `GameplayTagTableRow`:

```csv
Tag,DevComment
Item.Weapon.Melee,"All melee weapons"
Item.Weapon.Ranged,"All ranged weapons"
Item.Consumable,"Consumable items"
Ability.Fire,"Fire-based abilities"
Status.Burning,"Burning DOT"
```

**Setup:** Project Settings -> GameplayTags -> Add DataTable to Gameplay Tag Table List.

### Tag-Filtered DataTable Queries (C++)

```cpp
TArray<FItemDataRow*> AllItems;
ItemTable->GetAllRows<FItemDataRow>(TEXT("TagFilter"), AllItems);

FGameplayTagContainer RequiredTags;
RequiredTags.AddTag(FGameplayTag::RequestGameplayTag(FName("Item.Weapon.Melee")));

TArray<FItemDataRow*> MeleeWeapons;
for (FItemDataRow* Item : AllItems)
{
    if (Item->Tags.HasAll(RequiredTags))
        MeleeWeapons.Add(Item);
}
```

## Soft References in DataTables

ALWAYS use soft references for assets in DataTable rows:

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

    // BAD: Hard reference — forces immediate load of ALL referenced meshes
    // UPROPERTY(EditAnywhere)
    // UStaticMesh* Mesh;  // DO NOT DO THIS
};
```

### Async-Load Soft References

```cpp
TSoftObjectPtr<UStaticMesh> MeshRef = Row->Mesh;
if (!MeshRef.IsNull())
{
    FStreamableManager& SM = UAssetManager::GetStreamableManager();
    SM.RequestAsyncLoad(
        MeshRef.ToSoftObjectPath(),
        FStreamableDelegate::CreateLambda([MeshRef]()
        {
            UStaticMesh* Loaded = MeshRef.Get();
            // Use mesh
        })
    );
}
```

## FDataTableRowHandle — Type-Safe Row References

```cpp
// In any USTRUCT or UCLASS:
UPROPERTY(EditAnywhere, meta = (RowType = "/Script/MyGame.FItemDataRow"))
FDataTableRowHandle ItemRef;

// Resolve at runtime:
FItemDataRow* Row = ItemRef.GetRow<FItemDataRow>(TEXT("Resolving item ref"));
```

In Blueprint, the editor provides a dropdown picker filtered by struct type.

## FScalableFloat — CurveTable-Backed Values

```cpp
// In ability/effect classes (GameplayAbilities plugin):
UPROPERTY(EditAnywhere)
FScalableFloat MeleeDamage;  // Bind to CurveTable row in editor

// Evaluate at level:
float Level = 15.0f;
float Damage = MeleeDamage.GetValueAtLevel(Level);
int32 DamageInt = MeleeDamage.AsInteger(Level);
bool bUnlocked = MeleeDamage.AsBool(Level);
```

## Data Registries — Multi-Source Data

Combine and manage data from multiple DataTable sources with override priority. Ideal for base game + DLC + mods.

**Configuration:** Project Settings -> Game -> Data Registry

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

**Sources:** DataTables, CurveTables, or custom. Later tables override earlier ones for same row names.

## UPrimaryDataAsset — Asset Manager Integration

```cpp
UCLASS(BlueprintType)
class UCharacterDataAsset : public UPrimaryDataAsset
{
    GENERATED_BODY()
public:
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    FText CharacterName;

    // Loaded only when "UI" bundle is requested
    UPROPERTY(EditAnywhere, meta = (AssetBundles = "UI"))
    TSoftObjectPtr<UTexture2D> Portrait;

    // Loaded only when "Game" bundle is requested
    UPROPERTY(EditAnywhere, meta = (AssetBundles = "Game"))
    TSoftClassPtr<APawn> PawnClass;

    virtual FPrimaryAssetId GetPrimaryAssetId() const override
    {
        return FPrimaryAssetId("Characters", GetFName());
    }
};
```

### Async Loading via Asset Manager

```cpp
UAssetManager& AM = UAssetManager::Get();

// Load with specific bundles
AM.LoadPrimaryAsset(CharId, {"UI"});    // Only loads Portrait
AM.LoadPrimaryAsset(CharId, {"Game"});  // Only loads PawnClass

// Switch bundles (lobby -> gameplay)
AM.ChangeBundleStateForPrimaryAssets(
    LoadedIds,
    {"Game"},   // Add
    {"UI"}      // Remove
);
```

### Blueprint Async Loading
- **Async Load Primary Asset** — loads one asset, fires delegate
- **Async Load Primary Asset List** — loads multiple, fires delegate
- **Get Primary Asset Id List** — get all IDs of a type

## Design Patterns

### Pattern 1: Config-Driven Enemy Spawner
```
DT_EnemyWaves (DataTable)
  → Row: wave1, wave2, wave3...
  → Fields: EnemyType (FDataTableRowHandle → DT_Enemies), Count, SpawnDelay, DifficultyTag

DT_Enemies (DataTable)
  → Fields: ActorClass (TSoftClassPtr), Health (FScalableFloat → CT_EnemyHealth), Tags

CT_EnemyHealth (CurveTable)
  → Rows: Health.Base, Health.Elite, Health.Boss
  → X-axis: difficulty level
```

### Pattern 2: Loot Table with Weights
```
DT_LootTables (DataTable)
  → Fields: RowName (loot pool ID), ItemRef (FDataTableRowHandle → DT_Items), Weight, MinLevel, MaxLevel

Runtime: Query all rows with matching pool, sum weights, random roll
```

### Pattern 3: Dialogue System
```
DT_Dialogue (DataTable, JSON format for arrays)
  → Fields: Speaker, Text (FText), Choices (TArray<FDataTableRowHandle>), Conditions (FGameplayTagContainer)
```

### Pattern 4: CompositeDataTable for Input Merging (Cropout)
```
NewCompositeDataTable (CompositeDataTable)
  parent_tables:
    [0] CUI_InputTable        — project-specific actions (Back, Build, Confirm, Pause, Place)
    [1] GenericInputActionDataTable — engine defaults (GenericAccept, GenericBack, etc.)

CUI_InputData (CommonUIInputData)
  DefaultClickAction → "Confirm" row in NewCompositeDataTable
  DefaultBackAction  → "Back" row in NewCompositeDataTable
```
Composite merges without duplication. Project rows override engine defaults for same RowName.

### Pattern 5: Save System with Blueprint Structs (Cropout)
```
BP_SaveGM (Blueprint — Save Game Manager)
  → Manages save/load lifecycle
  → References:
    ST_SaveInteract — per-interactable state (position, resource amounts, completion)
    ST_Villager     — per-villager state (job assignment, inventory, location)

Save Flow:
  1. BP_SaveGM collects all interactable actors → serialize to TArray<ST_SaveInteract>
  2. Collect all villagers → serialize to TArray<ST_Villager>
  3. Write to USaveGame subclass → SaveGameToSlot
  4. On load: deserialize arrays → spawn/restore actors from struct data
```

**Key principles:**
- Save structs are separate from gameplay DataTable structs (ST_SaveInteract ≠ ST_Resource)
- Save structs track runtime state (position, progress); DataTable structs define static config
- Co-locate save structs with the save manager Blueprint (`Content/Blueprint/Core/Save/`)
- Use `USaveGame` subclass as the container, Blueprint structs for the data within it

## CompositeDataTable — Multi-Source Data Merging

CompositeDataTable combines multiple DataTables into one lookup without data duplication:

```
CompositeDataTable
  parent_tables: [ProjectTable, EngineDefaults, DLCTable]

  Lookup priority: last table wins for duplicate RowNames
  All parents must share the same row struct
```

### Use Cases
- **Input tables** — merge project-specific + engine default actions
- **DLC/Mod support** — base game table + DLC override table
- **Platform variants** — base table + platform-specific overrides
- **Development** — base table + debug/test overrides (stripped from shipping builds)

### C++ Access
```cpp
// CompositeDataTable is accessed identically to regular DataTable
UDataTable* CDT = LoadObject<UDataTable>(nullptr, TEXT("/Game/Data/DT_AllInput"));
FInputActionRow* Row = CDT->FindRow<FInputActionRow>(FName("Confirm"), TEXT("Input"));
```

### Blueprint Access
CompositeDataTable appears as a regular DataTable in Blueprint nodes:
- `Get Data Table Row` — works normally
- `Get Data Table Row Names` — returns merged row names from all parents
- `Does Data Table Row Exist` — checks across all parent tables
