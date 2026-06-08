# Data-Driven Design & Gameplay Tags

## Core Philosophy

Gameplay behavior should be defined in data, not code. If a designer needs to create a new variant, it should require a DataAsset, not a C++ class.

## DataAsset Patterns

### Primary Data Assets
```cpp
UCLASS()
class UMyItemDefinition : public UPrimaryDataAsset {
    UPROPERTY(EditDefaultsOnly) FText DisplayName;
    UPROPERTY(EditDefaultsOnly) TArray<TObjectPtr<UMyItemFragment>> Fragments;

    virtual FPrimaryAssetId GetPrimaryAssetId() const override {
        return FPrimaryAssetId("Item", GetFName());
    }
};
```

- **Primary Assets**: Managed directly by Asset Manager via PrimaryAssetId (Type:Name)
- **Secondary Assets**: Loaded automatically when referenced by Primary Assets
- By default, only UWorld (levels) are Primary — everything else is Secondary unless configured

### DataAsset vs Blueprint

| Use DataAsset | Use Blueprint |
|---------------|---------------|
| Pure configuration (stats, item definitions) | Needs gameplay logic (abilities, AI behavior) |
| Designers create many variants | Few variants with unique behavior |
| No per-instance state | Needs runtime state |
| Referenced by many systems | Self-contained |

### Lyra's DataAsset Hierarchy
- `ULyraExperienceDefinition`: Game mode configuration
- `ULyraPawnData`: Pawn class + abilities + input + camera
- `ULyraAbilitySet`: Bundled abilities + effects + attributes
- `ULyraInputConfig`: Input action → tag mappings
- `ULyraEquipmentDefinition`: Equipment type + abilities + spawned actors
- `ULyraInventoryItemDefinition`: Item display name + array of fragments

---

## Fragment Pattern

The most powerful data-driven composition pattern in Lyra.

### Concept
An item/entity is defined entirely by its array of fragments. Each fragment encapsulates one capability. Combining fragments creates item types without monolithic classes.

### Implementation
```cpp
UCLASS(Abstract, DefaultToInstanced, EditInlineNew)
class UMyItemFragment : public UObject {
    virtual void OnInstanceCreated(UMyItemInstance* Instance) const {}
};

UCLASS() class UFragment_Equippable : public UMyItemFragment {
    UPROPERTY(EditDefaultsOnly) TObjectPtr<UMyEquipmentDef> EquipmentDef;
};

UCLASS() class UFragment_SetStats : public UMyItemFragment {
    UPROPERTY(EditDefaultsOnly) TMap<FGameplayTag, int32> Stats;
};

UCLASS() class UFragment_QuickBarIcon : public UMyItemFragment {
    UPROPERTY(EditDefaultsOnly) TObjectPtr<UTexture2D> Icon;
};
```

### Lyra's Fragment Types
| Fragment | Purpose |
|----------|---------|
| `InventoryFragment_EquippableItem` | References EquipmentDefinition |
| `InventoryFragment_SetStats` | Maps tags → numeric values |
| `InventoryFragment_PickupIcon` | Mesh display for equipment spawners |
| `InventoryFragment_QuickBarIcon` | UI icon in quickbar |
| `InventoryFragment_ReticleConfig` | Weapon reticle widget config |

### When to Use Fragments
- Items with many possible capabilities (RPG loot, crafting ingredients)
- Entities that need extensible behavior without code changes
- Systems where designers mix-and-match features

---

## Gameplay Tags

### Why Tags Over Enums/Booleans
- **Hierarchical matching**: `Damage.DoT.Fire` matches queries for `Damage.*`
- **No recompilation**: Add tags in editor or .ini files
- **Cross-system**: Any system can query tags without type coupling
- **Network-efficient**: Index-based fast replication
- **Editor UI**: Built-in selection/search without custom editors
- **Reference tracking**: Find all usages of a tag across the project

### Tag Hierarchy Design
```
Ability.ActivateFail.IsDead
Ability.ActivateFail.Cooldown
Ability.ActivateFail.Cost
Ability.Behavior.SurvivesDeath

Status.Crouching
Status.Death.Dying
Status.Death.Dead

Movement.Mode.Walking
Movement.Mode.Falling

InputTag.Move
InputTag.Look.Mouse
InputTag.Look.Stick

GameplayEvent.Death
GameplayEvent.Reset

SetByCaller.Damage
SetByCaller.Heal
```

### Tag Containers
```cpp
// Always use FGameplayTagContainer, not TArray<FGameplayTag>
FGameplayTagContainer Tags;
Tags.AddTag(FGameplayTag::RequestGameplayTag("Status.Burning"));
Tags.HasTag(Tag);           // Exact match
Tags.HasTagExact(Tag);      // No hierarchy matching
Tags.HasAny(OtherContainer);
Tags.HasAll(OtherContainer);
```

### Tag Stacks (FGameplayTagStackContainer)
Replicated tags with counts. Uses FFastArraySerializer for efficient networking.
```cpp
FGameplayTagStackContainer Stacks;
Stacks.AddStack(AmmoTag, 30);    // Add 30 ammo
Stacks.RemoveStack(AmmoTag, 1);  // Consume 1
int32 Count = Stacks.GetStackCount(AmmoTag);
bool Has = Stacks.ContainsTag(AmmoTag);
```

**Used for**: Weapon ammo, inventory counts, stat points, team scores, ability charges

### Tag Relationship Mapping
Per-pawn customization of which tags block/require abilities:
```cpp
UCLASS()
class ULyraAbilityTagRelationshipMapping : public UDataAsset {
    // If ability has TagA, it requires TagB to activate
    // If ability has TagA, it's blocked by TagC
    // Loaded from PawnData, not hardcoded
};
```

---

## Soft vs Hard References

| Aspect | Hard Reference | Soft Reference |
|--------|---------------|----------------|
| Loading | Automatic when owner loads | Manual / on-demand |
| Memory | Always in memory | Only when loaded |
| Types | `UObject*`, `TSubclassOf<>` | `TSoftObjectPtr<>`, `TSoftClassPtr<>` |
| Use When | Asset always needed | Optional, large, or context-dependent |

### Asset Bundles
Tag properties for partial loading:
```cpp
UPROPERTY(meta = (AssetBundles = "UI"))
TSoftObjectPtr<UTexture2D> Icon;

UPROPERTY(meta = (AssetBundles = "Gameplay"))
TSoftObjectPtr<UStaticMesh> Mesh;
```
Load only `"UI"` bundle → get icons without 3D meshes.

### Async Loading
```cpp
FStreamableManager& Manager = UAssetManager::GetStreamableManager();
Manager.RequestAsyncLoad(AssetPaths, FStreamableDelegate::CreateUObject(this, &UMyClass::OnAssetsLoaded));
```

---

## Anti-Patterns

- **Hard-referencing large assets**: Creates synchronous load chains → hitches
- **FName/string comparisons**: Use FGameplayTag (editor UI, reference tracking, fast replication)
- **Monolithic item classes**: Use fragment pattern for extensibility
- **Not using Asset Bundles**: Loading 3D meshes when only UI data is needed
- **Losing FStreamableHandle**: Asset silently unloads
- **Hardcoded attribute values**: Drive from DataTables or DataAssets
- **Casting to Blueprint classes**: Creates hard load dependency; cast to C++ base or use interfaces
