# GAS Advanced Patterns

## Custom AbilitySystemComponent Patterns

### Input-Tag-Based Activation
Instead of binding abilities to raw input actions, map InputActions to GameplayTags, then route tags to the ASC:
```cpp
void UMyASC::AbilityInputTagPressed(const FGameplayTag& InputTag);
void UMyASC::AbilityInputTagReleased(const FGameplayTag& InputTag);
void UMyASC::ProcessAbilityInput(float DeltaTime, bool bGamePaused);
```
Track pressed/released/held spec handles per frame. In `ProcessAbilityInput`, try activating abilities whose InputTag matches.

### Activation Groups
Manage exclusive abilities (e.g., only one weapon mode active):
```cpp
enum class EAbilityActivationGroup : uint8 {
    Independent,           // Runs alongside anything
    Exclusive_Replaceable, // Canceled by new exclusives
    Exclusive_Blocking,    // Blocks other exclusives
};
```
Track `ActivationGroupCounts[MAX]` to check/enforce group limits.

### Tag Relationship Mapping (Data-Driven)
Define ability tag interactions in a DataAsset instead of hardcoding:
```cpp
USTRUCT()
struct FAbilityTagRelationship {
    FGameplayTag AbilityTag;
    FGameplayTagContainer AbilityTagsToBlock;
    FGameplayTagContainer AbilityTagsToCancel;
    FGameplayTagContainer ActivationRequiredTags;
    FGameplayTagContainer ActivationBlockedTags;
};
```
Override `ApplyAbilityBlockAndCancelTags` and `DoesAbilitySatisfyTagRequirements` to consult the mapping.

### Dynamic Tag Effects
Add/remove gameplay tags via transient GameplayEffects:
```cpp
void AddDynamicTagGameplayEffect(const FGameplayTag& Tag);
void RemoveDynamicTagGameplayEffect(const FGameplayTag& Tag);
```

## Custom GameplayAbility Patterns

### Activation Policies
```cpp
enum class EAbilityActivationPolicy : uint8 {
    OnInputTriggered,  // Activate on input
    WhileInputActive,  // Retry while held
    OnSpawn            // Auto-activate on avatar assignment
};
```

### Composable Costs
Add cost objects beyond standard GE costs:
```cpp
UPROPERTY(EditDefaultsOnly, Instanced)
TArray<TObjectPtr<UAbilityCost>> AdditionalCosts;
```
Subclass `UAbilityCost` for inventory items, tag stacks, cooldown tokens, etc. Override `CheckCost`/`ApplyCost` to iterate them.

### Failure Handling
Map failure tags to user-facing feedback:
```cpp
UPROPERTY(EditDefaultsOnly)
TMap<FGameplayTag, FText> FailureTagToUserFacingMessages;
UPROPERTY(EditDefaultsOnly)
TMap<FGameplayTag, TObjectPtr<UAnimMontage>> FailureTagToAnimMontage;
```
Broadcast via unreliable client RPC for responsive feedback.

### Camera Mode Integration
Abilities can push/pop camera modes (e.g., ADS):
```cpp
void SetCameraMode(TSubclassOf<UCameraMode> CameraMode);
void ClearCameraMode();
```

## AbilitySet DataAsset Pattern

Bundle abilities + effects + attributes for composition:
```cpp
UCLASS(BlueprintType, Const)
class UAbilitySet : public UPrimaryDataAsset {
    TArray<FAbilitySet_GameplayAbility> GrantedGameplayAbilities; // {Ability, Level, InputTag}
    TArray<FAbilitySet_GameplayEffect>  GrantedGameplayEffects;   // {Effect, Level}
    TArray<FAbilitySet_AttributeSet>    GrantedAttributes;        // {AttributeSet class}
};
```

### GrantedHandles Pattern
Track everything granted for clean revocation:
```cpp
struct FAbilitySet_GrantedHandles {
    TArray<FGameplayAbilitySpecHandle> AbilitySpecHandles;
    TArray<FActiveGameplayEffectHandle> GameplayEffectHandles;
    TArray<TObjectPtr<UAttributeSet>> GrantedAttributeSets;
    void TakeFromAbilitySystem(UAbilitySystemComponent* ASC); // Revokes all
};

// Grant
FAbilitySet_GrantedHandles Handles;
AbilitySet->GiveToAbilitySystem(ASC, &Handles, SourceObject);
// Revoke
Handles.TakeFromAbilitySystem(ASC);
```

## Custom GameplayEffectContext

Extend for project-specific data:
```cpp
USTRUCT()
struct FMyGameplayEffectContext : public FGameplayEffectContext {
    int32 CartridgeID = -1;                           // Group bullets from same shot
    TWeakObjectPtr<const UObject> AbilitySourceObject; // Weapon/item source
    // Override NetSerialize, Duplicate, GetScriptStruct
};
```
Register via `UAbilitySystemGlobals::AllocGameplayEffectContext`.

## GameplayTagStack Utility

Replicated tag→count map using FFastArraySerializer:
```cpp
struct FGameplayTagStackContainer : public FFastArraySerializer {
    void AddStack(FGameplayTag Tag, int32 StackCount);
    void RemoveStack(FGameplayTag Tag, int32 StackCount);
    int32 GetStackCount(FGameplayTag Tag) const;
    bool ContainsTag(FGameplayTag Tag) const;
};
```
Useful for kill counts, ammo tracking, score, team state.

## Health Component → GAS Bridge

Separate health logic from GAS internals:
1. Component binds to HealthSet attribute delegates
2. Monitors Health attribute → fires `OnHealthChanged`
3. Health reaches 0 → `StartDeath()` → death state machine
4. Death state replicated: `NotDead → DeathStarted → DeathFinished`

## Equipment → GAS Integration

Grant/revoke abilities on equip/unequip:
1. `EquipItem()` → create instance → `AbilitySet->GiveToAbilitySystem()`
2. Store `GrantedHandles` per equipment entry
3. `UnequipItem()` → `Handles.TakeFromAbilitySystem()`
4. Use FFastArraySerializer for replicated equipment lists
