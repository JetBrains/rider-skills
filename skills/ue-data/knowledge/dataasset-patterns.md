# DataAsset Composition Patterns

## UPrimaryDataAsset for Game Data

Use `UPrimaryDataAsset` for data-driven configuration that's discoverable by the Asset Manager:

```cpp
UCLASS(BlueprintType, Const)
class UPawnData : public UPrimaryDataAsset {
    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly)
    TSubclassOf<APawn> PawnClass;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly)
    TArray<TObjectPtr<UAbilitySet>> AbilitySets;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly)
    TObjectPtr<UInputConfig> InputConfig;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly)
    TSubclassOf<UCameraMode> DefaultCameraMode;
};
```

## Fragment Pattern for Item Definitions

Compose items from typed fragment objects instead of monolithic classes:
```cpp
UCLASS(Abstract, DefaultToInstanced, EditInlineNew)
class UItemFragment : public UObject {};

UCLASS()
class UFragment_Equippable : public UItemFragment {
    UPROPERTY(EditDefaultsOnly)
    TSubclassOf<UEquipmentDefinition> EquipmentDef;
};

UCLASS()
class UFragment_QuickBarIcon : public UItemFragment {
    UPROPERTY(EditDefaultsOnly)
    TSoftObjectPtr<UTexture2D> Icon;
};

UCLASS(BlueprintType, Const)
class UItemDefinition : public UPrimaryDataAsset {
    UPROPERTY(EditDefaultsOnly, Instanced)
    TArray<TObjectPtr<UItemFragment>> Fragments;

    template<typename T>
    const T* FindFragment() const;
};
```

## AbilitySet Bundling

Group related GAS elements for clean grant/revoke:
```cpp
UCLASS(BlueprintType, Const)
class UAbilitySet : public UPrimaryDataAsset {
    TArray<FAbilitySetEntry> Abilities;     // {Class, Level, InputTag}
    TArray<FEffectSetEntry> Effects;         // {Class, Level}
    TArray<FAttributeSetEntry> Attributes;   // {Class}

    void GiveToASC(UASC* ASC, FGrantedHandles* Out) const;
};
```

## Experience/Mode Definition

Define loadable game experiences as data:
```cpp
UCLASS(BlueprintType, Const)
class UExperienceDefinition : public UPrimaryDataAsset {
    TArray<FString> GameFeaturesToEnable;
    TObjectPtr<const UPawnData> DefaultPawnData;
    TArray<TObjectPtr<UGameFeatureAction>> Actions;
    TArray<TObjectPtr<UExperienceActionSet>> ActionSets;
};
```

## Asset Manager Registration

Register primary asset types in DefaultGame.ini:
```ini
[/Script/Engine.AssetManagerSettings]
+PrimaryAssetTypesToScan=(PrimaryAssetType="PawnData",AssetBaseClass=/Script/MyGame.PawnData,bHasBlueprintClasses=False,Directories=((Path="/Game/Characters")))
+PrimaryAssetTypesToScan=(PrimaryAssetType="Experience",AssetBaseClass=/Script/MyGame.ExperienceDefinition,bHasBlueprintClasses=False,Directories=((Path="/Game/Experiences")))
```

## Content Organization

```
Content/
├── Characters/     — PawnData, cosmetics per character
├── Weapons/        — Equipment/inventory definitions per weapon
├── Input/          — InputAction, InputMappingContext, InputConfig
├── Experiences/    — Experience definitions, action sets
├── GameplayEffects/— GE assets by category (Damage, Heal, Buff)
├── AbilitySets/    — Bundled ability configurations
└── Teams/          — Team display/configuration assets
```

## Best Practices

1. **Composition over inheritance** — PawnData bundles class + abilities + input + camera
2. **Fragment pattern** — inventory items composed of typed fragments, not monolithic
3. **AbilitySet bundling** — grant/revoke groups atomically via handles
4. **DataAsset references** — use `TObjectPtr` for strong refs, `TSoftObjectPtr` for async
5. **PrimaryDataAsset** — enables Asset Manager discovery and async loading
