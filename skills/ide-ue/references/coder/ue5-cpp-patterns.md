# UE5 C++ Patterns

## UE_API / MinimalAPI Pattern
```cpp
#define UE_API MYGAME_API
UCLASS(MinimalAPI)
class UMyClass : public UParentClass {
    GENERATED_BODY()
public:
    UE_API void MyFunction();  // Only exported functions marked
};
#undef UE_API
```

## FFastArraySerializer for Replicated Collections
```cpp
USTRUCT()
struct FMyEntry : public FFastArraySerializerItem {
    GENERATED_BODY()
    UPROPERTY()
    int32 Data;
    UPROPERTY(NotReplicated)
    int32 LocalOnly;  // Authority-only
};

USTRUCT()
struct FMyList : public FFastArraySerializer {
    GENERATED_BODY()
    void PreReplicatedRemove(const TArrayView<int32> RemovedIndices, int32 FinalSize);
    void PostReplicatedAdd(const TArrayView<int32> AddedIndices, int32 FinalSize);
    void PostReplicatedChange(const TArrayView<int32> ChangedIndices, int32 FinalSize);
    bool NetDeltaSerialize(FNetDeltaSerializeInfo& DeltaParms) {
        return FFastArraySerializer::FastArrayDeltaSerialize<FMyEntry, FMyList>(Entries, DeltaParms, *this);
    }
    UPROPERTY()
    TArray<FMyEntry> Entries;
};

template<>
struct TStructOpsTypeTraits<FMyList> : public TStructOpsTypeTraitsBase2<FMyList> {
    enum { WithNetDeltaSerializer = true };
};
```

## Component Init State Interface
Coordinated multi-component initialization:
```cpp
class UMyComponent : public UPawnComponent, public IGameFrameworkInitStateInterface {
    static const FName NAME_ActorFeatureName;
    virtual FName GetFeatureName() const override;
    virtual bool CanChangeInitState(Manager, CurrentState, DesiredState) const override;
    virtual void HandleChangeInitState(Manager, CurrentState, DesiredState) override;
    virtual void OnActorInitStateChanged(const FActorInitStateChangedParams& Params) override;
    virtual void CheckDefaultInitialization() override;
};
```
States flow: `Spawned → DataAvailable → DataInitialized → GameplayReady`

## FindComponent Static Pattern
```cpp
UFUNCTION(BlueprintPure, Category = "MyGame|Health")
static UMyComponent* FindMyComponent(const AActor* Actor) {
    return (Actor ? Actor->FindComponentByClass<UMyComponent>() : nullptr);
}
```

## CallOrRegister Delegate Pattern
Safe for callbacks whether event already fired or not:
```cpp
void CallOrRegister_OnLoaded(FOnLoaded::FDelegate&& Delegate);
// If already loaded → calls immediately
// If not yet → registers for later callback
```

## DataAsset Composition
Use UPrimaryDataAsset for data-driven composition instead of hardcoding:
```cpp
UCLASS(BlueprintType, Const)
class UPawnData : public UPrimaryDataAsset {
    TSubclassOf<APawn> PawnClass;
    TArray<TObjectPtr<UAbilitySet>> AbilitySets;
    TObjectPtr<UInputConfig> InputConfig;
    TSubclassOf<UCameraMode> DefaultCameraMode;
};
```

## Inventory Fragment Pattern
Compose item definitions from typed fragments:
```cpp
UCLASS(Abstract, DefaultToInstanced, EditInlineNew)
class UInventoryFragment : public UObject {};

UCLASS()
class UFragment_Equippable : public UInventoryFragment {
    TSubclassOf<UEquipmentDefinition> EquipmentDefinition;
};

UCLASS()
class UItemDefinition : public UPrimaryDataAsset {
    UPROPERTY(EditDefaultsOnly, Instanced)
    TArray<TObjectPtr<UInventoryFragment>> Fragments;
};
```

## GameFeature Plugin Requirements
- `ExplicitlyLoaded: true` and `EnabledByDefault: false` in `.uplugin`
- Custom `UGameFeatureAction` subclasses for activation logic
- Actions execute when experience/mode loads the plugin

## Modular Gameplay Base Classes
Always use modular base classes for framework extensibility:
| Instead of | Use |
|-----------|-----|
| `AGameModeBase` | `AModularGameModeBase` |
| `AGameStateBase` | `AModularGameStateBase` |
| `ACharacter` | `AModularCharacter` |
| `APlayerController` | `AModularPlayerController` |
| `APlayerState` | `AModularPlayerState` |

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `search_symbol` | Locate a class or pattern across the codebase | Find all `FFastArraySerializer` subclasses or `IGameFrameworkInitStateInterface` implementors before adding a new one |
| `analyze_calls` | Map call graph for init-state transitions | `INCOMING_CALLS` on `HandleChangeInitState` to see which components feed into it |
| `get_symbol_info` | Inspect a symbol's signature and documentation | Hover-level detail on `CallOrRegister_OnLoaded` or `DataAsset` base class before subclassing |
| `get_file_problems` | IDE diagnostics after editing patterns | Run after adding `USTRUCT` / `UCLASS` macros to verify generated header paths and export macros |
| `build_solution_start` / `build_solution_state` | Compile to surface link errors | Confirm `TStructOpsTypeTraits` specialization is correct; `buildIsSuccess` required before creating Blueprint from the new class |
