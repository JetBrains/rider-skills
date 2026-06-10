# GAS C++ Patterns — Copy-Paste Recipes

Complete, compilable C++ code for common GAS implementations. Each recipe includes the .h and .cpp boilerplate.

---

## 0. Build.cs Setup

Add to your module's `Build.cs` — all three are required:

```csharp
// MyProject.Build.cs
PrivateDependencyModuleNames.AddRange(new string[] {
    "GameplayAbilities",
    "GameplayTags",
    "GameplayTasks"
});
```

---

## 1. ASC Setup — Character-Based (Single Player / Simple)

### MyCharacter.h

```cpp
#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "AbilitySystemInterface.h"
#include "AbilitySystemComponent.h"
#include "MyCharacter.generated.h"

class UMyAttributeSet;

UCLASS()
class MYPROJECT_API AMyCharacter : public ACharacter, public IAbilitySystemInterface
{
    GENERATED_BODY()

public:
    AMyCharacter();

    // IAbilitySystemInterface
    virtual UAbilitySystemComponent* GetAbilitySystemComponent() const override;

    // Grant default abilities (call from BeginPlay or PossessedBy)
    void GiveDefaultAbilities();

protected:
    virtual void PossessedBy(AController* NewController) override;
    virtual void OnRep_PlayerState() override;

    UPROPERTY(VisibleDefaultsOnly, BlueprintReadOnly, Category = "Abilities")
    TObjectPtr<UAbilitySystemComponent> AbilitySystemComponent;

    UPROPERTY()
    TObjectPtr<UMyAttributeSet> AttributeSet;

    // Default abilities to grant on possession
    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Abilities")
    TArray<TSubclassOf<UGameplayAbility>> DefaultAbilities;

    // Default effects to apply on possession (e.g., initialize attributes)
    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Abilities")
    TArray<TSubclassOf<UGameplayEffect>> DefaultEffects;
};
```

### MyCharacter.cpp

```cpp
#include "MyCharacter.h"
#include "MyAttributeSet.h"
#include "GameplayAbilitySpec.h"

AMyCharacter::AMyCharacter()
{
    AbilitySystemComponent = CreateDefaultSubobject<UAbilitySystemComponent>(TEXT("AbilitySystemComponent"));
    AbilitySystemComponent->SetIsReplicated(true);
    AbilitySystemComponent->SetReplicationMode(EGameplayEffectReplicationMode::Full);

    AttributeSet = CreateDefaultSubobject<UMyAttributeSet>(TEXT("AttributeSet"));
}

UAbilitySystemComponent* AMyCharacter::GetAbilitySystemComponent() const
{
    return AbilitySystemComponent;
}

void AMyCharacter::PossessedBy(AController* NewController)
{
    Super::PossessedBy(NewController);

    // Server: initialize ability actor info
    AbilitySystemComponent->InitAbilityActorInfo(this, this);

    // Grant default abilities and apply default effects
    GiveDefaultAbilities();
}

void AMyCharacter::OnRep_PlayerState()
{
    Super::OnRep_PlayerState();

    // Client: initialize ability actor info
    AbilitySystemComponent->InitAbilityActorInfo(this, this);
}

void AMyCharacter::GiveDefaultAbilities()
{
    if (!HasAuthority()) return;

    for (TSubclassOf<UGameplayAbility>& AbilityClass : DefaultAbilities)
    {
        AbilitySystemComponent->GiveAbility(FGameplayAbilitySpec(AbilityClass, 1, INDEX_NONE, this));
    }

    for (TSubclassOf<UGameplayEffect>& EffectClass : DefaultEffects)
    {
        FGameplayEffectContextHandle ContextHandle = AbilitySystemComponent->MakeEffectContext();
        ContextHandle.AddSourceObject(this);
        FGameplayEffectSpecHandle SpecHandle = AbilitySystemComponent->MakeOutgoingSpec(EffectClass, 1, ContextHandle);
        if (SpecHandle.IsValid())
        {
            AbilitySystemComponent->ApplyGameplayEffectSpecToSelf(*SpecHandle.Data.Get());
        }
    }
}
```

---

## 2. ASC Setup — PlayerState-Based (Multiplayer)

### MyPlayerState.h

```cpp
#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerState.h"
#include "AbilitySystemInterface.h"
#include "AbilitySystemComponent.h"
#include "MyPlayerState.generated.h"

class UMyAttributeSet;

UCLASS()
class MYPROJECT_API AMyPlayerState : public APlayerState, public IAbilitySystemInterface
{
    GENERATED_BODY()

public:
    AMyPlayerState();

    virtual UAbilitySystemComponent* GetAbilitySystemComponent() const override;

    UMyAttributeSet* GetAttributeSet() const { return AttributeSet; }

protected:
    UPROPERTY(VisibleDefaultsOnly, BlueprintReadOnly, Category = "Abilities")
    TObjectPtr<UAbilitySystemComponent> AbilitySystemComponent;

    UPROPERTY()
    TObjectPtr<UMyAttributeSet> AttributeSet;
};
```

### MyPlayerState.cpp

```cpp
#include "MyPlayerState.h"
#include "MyAttributeSet.h"

AMyPlayerState::AMyPlayerState()
{
    AbilitySystemComponent = CreateDefaultSubobject<UAbilitySystemComponent>(TEXT("AbilitySystemComponent"));
    AbilitySystemComponent->SetIsReplicated(true);
    AbilitySystemComponent->SetReplicationMode(EGameplayEffectReplicationMode::Mixed);

    AttributeSet = CreateDefaultSubobject<UMyAttributeSet>(TEXT("AttributeSet"));

    // PlayerState default NetUpdateFrequency is low — increase for GAS responsiveness
    NetUpdateFrequency = 100.0f;
}

UAbilitySystemComponent* AMyPlayerState::GetAbilitySystemComponent() const
{
    return AbilitySystemComponent;
}
```

### Character forwarding to PlayerState ASC

```cpp
// In MyCharacter.h — forward ASC queries to PlayerState
virtual UAbilitySystemComponent* GetAbilitySystemComponent() const override;

// In MyCharacter.cpp
UAbilitySystemComponent* AMyCharacter::GetAbilitySystemComponent() const
{
    if (AMyPlayerState* PS = GetPlayerState<AMyPlayerState>())
    {
        return PS->GetAbilitySystemComponent();
    }
    return nullptr;
}

void AMyCharacter::PossessedBy(AController* NewController)
{
    Super::PossessedBy(NewController);

    // Server: init with PlayerState as Owner, Character as Avatar
    if (AMyPlayerState* PS = GetPlayerState<AMyPlayerState>())
    {
        PS->GetAbilitySystemComponent()->InitAbilityActorInfo(PS, this);
    }
}

void AMyCharacter::OnRep_PlayerState()
{
    Super::OnRep_PlayerState();

    // Client: init with PlayerState as Owner, Character as Avatar
    if (AMyPlayerState* PS = GetPlayerState<AMyPlayerState>())
    {
        PS->GetAbilitySystemComponent()->InitAbilityActorInfo(PS, this);
    }
}
```

---

## 3. AttributeSet with Full Replication

### MyAttributeSet.h

```cpp
#pragma once

#include "CoreMinimal.h"
#include "AttributeSet.h"
#include "AbilitySystemComponent.h"
#include "MyAttributeSet.generated.h"

// Shorthand macro for attribute accessors
#define ATTRIBUTE_ACCESSORS(ClassName, PropertyName) \
    GAMEPLAYATTRIBUTE_PROPERTY_GETTER(ClassName, PropertyName) \
    GAMEPLAYATTRIBUTE_VALUE_GETTER(PropertyName) \
    GAMEPLAYATTRIBUTE_VALUE_SETTER(PropertyName) \
    GAMEPLAYATTRIBUTE_VALUE_INITTER(PropertyName)

UCLASS()
class MYPROJECT_API UMyAttributeSet : public UAttributeSet
{
    GENERATED_BODY()

public:
    UMyAttributeSet();

    // --- Vital Attributes ---

    UPROPERTY(EditAnywhere, BlueprintReadOnly, ReplicatedUsing = OnRep_Health, Category = "Vital")
    FGameplayAttributeData Health;
    ATTRIBUTE_ACCESSORS(UMyAttributeSet, Health);

    UPROPERTY(EditAnywhere, BlueprintReadOnly, ReplicatedUsing = OnRep_MaxHealth, Category = "Vital")
    FGameplayAttributeData MaxHealth;
    ATTRIBUTE_ACCESSORS(UMyAttributeSet, MaxHealth);

    UPROPERTY(EditAnywhere, BlueprintReadOnly, ReplicatedUsing = OnRep_Mana, Category = "Vital")
    FGameplayAttributeData Mana;
    ATTRIBUTE_ACCESSORS(UMyAttributeSet, Mana);

    UPROPERTY(EditAnywhere, BlueprintReadOnly, ReplicatedUsing = OnRep_MaxMana, Category = "Vital")
    FGameplayAttributeData MaxMana;
    ATTRIBUTE_ACCESSORS(UMyAttributeSet, MaxMana);

    // --- Combat Attributes ---

    UPROPERTY(EditAnywhere, BlueprintReadOnly, ReplicatedUsing = OnRep_AttackPower, Category = "Combat")
    FGameplayAttributeData AttackPower;
    ATTRIBUTE_ACCESSORS(UMyAttributeSet, AttackPower);

    UPROPERTY(EditAnywhere, BlueprintReadOnly, ReplicatedUsing = OnRep_Armor, Category = "Combat")
    FGameplayAttributeData Armor;
    ATTRIBUTE_ACCESSORS(UMyAttributeSet, Armor);

    // --- Meta Attributes (NOT replicated) ---

    UPROPERTY(BlueprintReadOnly, Category = "Meta")
    FGameplayAttributeData IncomingDamage;
    ATTRIBUTE_ACCESSORS(UMyAttributeSet, IncomingDamage);

    UPROPERTY(BlueprintReadOnly, Category = "Meta")
    FGameplayAttributeData IncomingHealing;
    ATTRIBUTE_ACCESSORS(UMyAttributeSet, IncomingHealing);

    // --- Virtual Function Overrides ---

    virtual void PreAttributeChange(const FGameplayAttribute& Attribute, float& NewValue) override;
    virtual void PostGameplayEffectExecute(const FGameplayEffectModCallbackData& Data) override;
    virtual void GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const override;

protected:
    UFUNCTION()
    void OnRep_Health(const FGameplayAttributeData& OldHealth);
    UFUNCTION()
    void OnRep_MaxHealth(const FGameplayAttributeData& OldMaxHealth);
    UFUNCTION()
    void OnRep_Mana(const FGameplayAttributeData& OldMana);
    UFUNCTION()
    void OnRep_MaxMana(const FGameplayAttributeData& OldMaxMana);
    UFUNCTION()
    void OnRep_AttackPower(const FGameplayAttributeData& OldAttackPower);
    UFUNCTION()
    void OnRep_Armor(const FGameplayAttributeData& OldArmor);
};
```

### MyAttributeSet.cpp

```cpp
#include "MyAttributeSet.h"
#include "Net/UnrealNetwork.h"
#include "GameplayEffectExtension.h"

UMyAttributeSet::UMyAttributeSet()
{
    InitHealth(100.0f);
    InitMaxHealth(100.0f);
    InitMana(50.0f);
    InitMaxMana(50.0f);
    InitAttackPower(10.0f);
    InitArmor(5.0f);
    InitIncomingDamage(0.0f);
    InitIncomingHealing(0.0f);
}

void UMyAttributeSet::PreAttributeChange(const FGameplayAttribute& Attribute, float& NewValue)
{
    Super::PreAttributeChange(Attribute, NewValue);

    // Clamp only — NO game reactions here
    if (Attribute == GetHealthAttribute())
    {
        NewValue = FMath::Clamp(NewValue, 0.0f, GetMaxHealth());
    }
    else if (Attribute == GetManaAttribute())
    {
        NewValue = FMath::Clamp(NewValue, 0.0f, GetMaxMana());
    }
}

void UMyAttributeSet::PostGameplayEffectExecute(const FGameplayEffectModCallbackData& Data)
{
    Super::PostGameplayEffectExecute(Data);

    if (Data.EvaluatedData.Attribute == GetIncomingDamageAttribute())
    {
        // Apply incoming damage to health
        const float LocalDamage = GetIncomingDamage();
        SetIncomingDamage(0.0f);

        if (LocalDamage > 0.0f)
        {
            const float NewHealth = GetHealth() - LocalDamage;
            SetHealth(FMath::Clamp(NewHealth, 0.0f, GetMaxHealth()));

            if (GetHealth() <= 0.0f)
            {
                // TODO: Trigger death — broadcast delegate, send gameplay event, etc.
            }
        }
    }
    else if (Data.EvaluatedData.Attribute == GetIncomingHealingAttribute())
    {
        const float LocalHealing = GetIncomingHealing();
        SetIncomingHealing(0.0f);

        if (LocalHealing > 0.0f)
        {
            const float NewHealth = GetHealth() + LocalHealing;
            SetHealth(FMath::Clamp(NewHealth, 0.0f, GetMaxHealth()));
        }
    }
    else if (Data.EvaluatedData.Attribute == GetHealthAttribute())
    {
        SetHealth(FMath::Clamp(GetHealth(), 0.0f, GetMaxHealth()));
    }
    else if (Data.EvaluatedData.Attribute == GetManaAttribute())
    {
        SetMana(FMath::Clamp(GetMana(), 0.0f, GetMaxMana()));
    }
}

void UMyAttributeSet::GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const
{
    Super::GetLifetimeReplicatedProps(OutLifetimeProps);

    // NOTE: Meta attributes (IncomingDamage, IncomingHealing) are intentionally NOT replicated
    DOREPLIFETIME_CONDITION_NOTIFY(UMyAttributeSet, Health, COND_None, REPNOTIFY_Always);
    DOREPLIFETIME_CONDITION_NOTIFY(UMyAttributeSet, MaxHealth, COND_None, REPNOTIFY_Always);
    DOREPLIFETIME_CONDITION_NOTIFY(UMyAttributeSet, Mana, COND_None, REPNOTIFY_Always);
    DOREPLIFETIME_CONDITION_NOTIFY(UMyAttributeSet, MaxMana, COND_None, REPNOTIFY_Always);
    DOREPLIFETIME_CONDITION_NOTIFY(UMyAttributeSet, AttackPower, COND_None, REPNOTIFY_Always);
    DOREPLIFETIME_CONDITION_NOTIFY(UMyAttributeSet, Armor, COND_None, REPNOTIFY_Always);
}

// --- Rep Notifies ---

void UMyAttributeSet::OnRep_Health(const FGameplayAttributeData& OldHealth)
{
    GAMEPLAYATTRIBUTE_REPNOTIFY(UMyAttributeSet, Health, OldHealth);
}

void UMyAttributeSet::OnRep_MaxHealth(const FGameplayAttributeData& OldMaxHealth)
{
    GAMEPLAYATTRIBUTE_REPNOTIFY(UMyAttributeSet, MaxHealth, OldMaxHealth);
}

void UMyAttributeSet::OnRep_Mana(const FGameplayAttributeData& OldMana)
{
    GAMEPLAYATTRIBUTE_REPNOTIFY(UMyAttributeSet, Mana, OldMana);
}

void UMyAttributeSet::OnRep_MaxMana(const FGameplayAttributeData& OldMaxMana)
{
    GAMEPLAYATTRIBUTE_REPNOTIFY(UMyAttributeSet, MaxMana, OldMaxMana);
}

void UMyAttributeSet::OnRep_AttackPower(const FGameplayAttributeData& OldAttackPower)
{
    GAMEPLAYATTRIBUTE_REPNOTIFY(UMyAttributeSet, AttackPower, OldAttackPower);
}

void UMyAttributeSet::OnRep_Armor(const FGameplayAttributeData& OldArmor)
{
    GAMEPLAYATTRIBUTE_REPNOTIFY(UMyAttributeSet, Armor, OldArmor);
}
```

---

## 4. Basic GameplayAbility with Cost and Cooldown

### MyGameplayAbility.h

```cpp
#pragma once

#include "CoreMinimal.h"
#include "Abilities/GameplayAbility.h"
#include "MyGameplayAbility.generated.h"

UCLASS()
class MYPROJECT_API UMyGameplayAbility : public UGameplayAbility
{
    GENERATED_BODY()

public:
    UMyGameplayAbility();

    // Ability level convenience
    UFUNCTION(BlueprintCallable, Category = "Ability")
    int32 GetAbilityLevel() const;
};
```

### MyGameplayAbility.cpp

```cpp
#include "MyGameplayAbility.h"

UMyGameplayAbility::UMyGameplayAbility()
{
    // Recommended defaults
    InstancingPolicy = EGameplayAbilityInstancingPolicy::InstancedPerActor;
    NetExecutionPolicy = EGameplayAbilityNetExecutionPolicy::LocalPredicted;

    // Set CostGameplayEffectClass and CooldownGameplayEffectClass in Blueprint or subclass constructor
}

int32 UMyGameplayAbility::GetAbilityLevel() const
{
    return GetAbilityLevel();
}
```

### Example: Fireball Ability

```cpp
// GA_Fireball.h
UCLASS()
class UGA_Fireball : public UMyGameplayAbility
{
    GENERATED_BODY()

public:
    UGA_Fireball();

    virtual void ActivateAbility(const FGameplayAbilitySpecHandle Handle,
        const FGameplayAbilityActorInfo* ActorInfo,
        const FGameplayAbilityActivationInfo ActivationInfo,
        const FGameplayEventData* TriggerEventData) override;

protected:
    UPROPERTY(EditDefaultsOnly, Category = "Damage")
    TSubclassOf<UGameplayEffect> DamageEffectClass;

    UPROPERTY(EditDefaultsOnly, Category = "Damage")
    float BaseDamage = 25.0f;

    UPROPERTY(EditDefaultsOnly, Category = "Animation")
    TObjectPtr<UAnimMontage> CastMontage;

    UFUNCTION()
    void OnMontageCompleted();

    UFUNCTION()
    void OnMontageCancelled();
};

// GA_Fireball.cpp
UGA_Fireball::UGA_Fireball()
{
    // Block activation while stunned or silenced
    ActivationBlockedTags.AddTag(FGameplayTag::RequestGameplayTag("Status.Debuff.Stun"));
    ActivationBlockedTags.AddTag(FGameplayTag::RequestGameplayTag("Status.Debuff.Silence"));
}

void UGA_Fireball::ActivateAbility(const FGameplayAbilitySpecHandle Handle,
    const FGameplayAbilityActorInfo* ActorInfo,
    const FGameplayAbilityActivationInfo ActivationInfo,
    const FGameplayEventData* TriggerEventData)
{
    if (!CommitAbility(Handle, ActorInfo, ActivationInfo))
    {
        EndAbility(Handle, ActorInfo, ActivationInfo, true, true);
        return;
    }

    // Play cast animation
    UAbilityTask_PlayMontageAndWait* MontageTask =
        UAbilityTask_PlayMontageAndWait::CreatePlayMontageAndWaitProxy(
            this, NAME_None, CastMontage, 1.0f);

    MontageTask->OnCompleted.AddDynamic(this, &UGA_Fireball::OnMontageCompleted);
    MontageTask->OnCancelled.AddDynamic(this, &UGA_Fireball::OnMontageCancelled);
    MontageTask->OnInterrupted.AddDynamic(this, &UGA_Fireball::OnMontageCancelled);
    MontageTask->ReadyForActivation();
}

void UGA_Fireball::OnMontageCompleted()
{
    // Apply damage effect to target (simplified — real version would use targeting)
    if (DamageEffectClass)
    {
        FGameplayEffectSpecHandle SpecHandle = MakeOutgoingGameplayEffectSpec(DamageEffectClass, GetAbilityLevel());
        if (SpecHandle.IsValid())
        {
            // Set damage value via SetByCaller
            SpecHandle.Data->SetSetByCallerMagnitude(
                FGameplayTag::RequestGameplayTag("Data.Damage"), BaseDamage);

            // Apply to target ASC (simplified)
            ApplyGameplayEffectSpecToOwner(CurrentSpecHandle, CurrentActorInfo, CurrentActivationInfo, SpecHandle);
        }
    }

    EndAbility(CurrentSpecHandle, CurrentActorInfo, CurrentActivationInfo, true, false);
}

void UGA_Fireball::OnMontageCancelled()
{
    EndAbility(CurrentSpecHandle, CurrentActorInfo, CurrentActivationInfo, true, true);
}
```

---

## 5. Damage Execution Calculation

### MyDamageExecCalc.h

```cpp
#pragma once

#include "CoreMinimal.h"
#include "GameplayEffectExecutionCalculation.h"
#include "MyDamageExecCalc.generated.h"

UCLASS()
class MYPROJECT_API UMyDamageExecCalc : public UGameplayEffectExecutionCalculation
{
    GENERATED_BODY()

public:
    UMyDamageExecCalc();

    virtual void Execute_Implementation(
        const FGameplayEffectCustomExecutionParameters& ExecutionParams,
        FGameplayEffectCustomExecutionOutput& OutExecutionOutput) const override;
};
```

### MyDamageExecCalc.cpp

```cpp
#include "MyDamageExecCalc.h"
#include "MyAttributeSet.h"
#include "AbilitySystemComponent.h"

// Declare attribute captures (file-static for performance)
struct FDamageStatics
{
    DECLARE_ATTRIBUTE_CAPTUREDEF(AttackPower);
    DECLARE_ATTRIBUTE_CAPTUREDEF(Armor);
    DECLARE_ATTRIBUTE_CAPTUREDEF(IncomingDamage);

    FDamageStatics()
    {
        // Capture source AttackPower (snapshot at effect application time)
        DEFINE_ATTRIBUTE_CAPTUREDEF(UMyAttributeSet, AttackPower, Source, true);
        // Capture target Armor (snapshot at effect application time)
        DEFINE_ATTRIBUTE_CAPTUREDEF(UMyAttributeSet, Armor, Target, true);
        // Output to target IncomingDamage (not captured — written to)
        DEFINE_ATTRIBUTE_CAPTUREDEF(UMyAttributeSet, IncomingDamage, Target, false);
    }
};

static const FDamageStatics& DamageStatics()
{
    static FDamageStatics Statics;
    return Statics;
}

UMyDamageExecCalc::UMyDamageExecCalc()
{
    RelevantAttributesToCapture.Add(DamageStatics().AttackPowerDef);
    RelevantAttributesToCapture.Add(DamageStatics().ArmorDef);
}

void UMyDamageExecCalc::Execute_Implementation(
    const FGameplayEffectCustomExecutionParameters& ExecutionParams,
    FGameplayEffectCustomExecutionOutput& OutExecutionOutput) const
{
    UAbilitySystemComponent* SourceASC = ExecutionParams.GetSourceAbilitySystemComponent();
    UAbilitySystemComponent* TargetASC = ExecutionParams.GetTargetAbilitySystemComponent();

    if (!SourceASC || !TargetASC) return;

    const FGameplayEffectSpec& Spec = ExecutionParams.GetOwningSpec();

    // Gather tags for conditional modifiers
    const FGameplayTagContainer* SourceTags = Spec.CapturedSourceTags.GetAggregatedTags();
    const FGameplayTagContainer* TargetTags = Spec.CapturedTargetTags.GetAggregatedTags();

    FAggregatorEvaluateParameters EvaluationParameters;
    EvaluationParameters.SourceTags = SourceTags;
    EvaluationParameters.TargetTags = TargetTags;

    // Read captured attribute values
    float AttackPower = 0.0f;
    ExecutionParams.AttemptCalculateCapturedAttributeMagnitude(
        DamageStatics().AttackPowerDef, EvaluationParameters, AttackPower);

    float Armor = 0.0f;
    ExecutionParams.AttemptCalculateCapturedAttributeMagnitude(
        DamageStatics().ArmorDef, EvaluationParameters, Armor);

    // Read SetByCaller damage multiplier (defaults to 1.0 if not set)
    float DamageMultiplier = Spec.GetSetByCallerMagnitude(
        FGameplayTag::RequestGameplayTag("Data.DamageMultiplier"), false, 1.0f);

    // Calculate final damage
    float FinalDamage = FMath::Max(AttackPower - (Armor * 0.5f), 0.0f) * DamageMultiplier;

    if (FinalDamage > 0.0f)
    {
        // Output: add to IncomingDamage meta attribute
        OutExecutionOutput.AddOutputModifier(
            FGameplayModifierEvaluatedData(
                DamageStatics().IncomingDamageProperty,
                EGameplayModOp::Additive,
                FinalDamage));
    }
}
```

---

## 6. Custom Modifier Magnitude Calculation (MMC)

### MyMMC_MaxHealth.h

```cpp
#pragma once

#include "CoreMinimal.h"
#include "GameplayModMagnitudeCalculation.h"
#include "MyMMC_MaxHealth.generated.h"

// Example: MaxHealth scales with character level + vigor attribute
UCLASS()
class MYPROJECT_API UMyMMC_MaxHealth : public UGameplayModMagnitudeCalculation
{
    GENERATED_BODY()

public:
    UMyMMC_MaxHealth();

    virtual float CalculateBaseMagnitude_Implementation(const FGameplayEffectSpec& Spec) const override;

private:
    FGameplayEffectAttributeCaptureDefinition VigorDef;
};
```

### MyMMC_MaxHealth.cpp

```cpp
#include "MyMMC_MaxHealth.h"
#include "MyAttributeSet.h"
#include "AbilitySystemComponent.h"

UMyMMC_MaxHealth::UMyMMC_MaxHealth()
{
    VigorDef.AttributeToCapture = UMyAttributeSet::GetVigorAttribute();
    VigorDef.AttributeSource = EGameplayEffectAttributeCaptureSource::Target;
    VigorDef.bSnapshot = false; // Use current value, not snapshot

    RelevantAttributesToCapture.Add(VigorDef);
}

float UMyMMC_MaxHealth::CalculateBaseMagnitude_Implementation(const FGameplayEffectSpec& Spec) const
{
    // Gather tags
    const FGameplayTagContainer* SourceTags = Spec.CapturedSourceTags.GetAggregatedTags();
    const FGameplayTagContainer* TargetTags = Spec.CapturedTargetTags.GetAggregatedTags();

    FAggregatorEvaluateParameters EvaluationParameters;
    EvaluationParameters.SourceTags = SourceTags;
    EvaluationParameters.TargetTags = TargetTags;

    float Vigor = 0.0f;
    GetCapturedAttributeMagnitude(VigorDef, Spec, EvaluationParameters, Vigor);

    // Get character level from the spec
    float Level = FMath::Max(Spec.GetLevel(), 1.0f);

    // Formula: BaseHealth + (Vigor * 10) + (Level * 5)
    return 100.0f + (Vigor * 10.0f) + (Level * 5.0f);
}
```

---

## 7. Gameplay Event Sending and Handling

### Sending an Event (from AnimNotify, overlap, etc.)

```cpp
#include "AbilitySystemBlueprintLibrary.h"

void AMyCharacter::OnWeaponOverlap(AActor* OtherActor)
{
    FGameplayEventData EventData;
    EventData.Instigator = this;
    EventData.Target = OtherActor;
    EventData.EventMagnitude = 1.0f;

    // Send to our own ASC — abilities listening for this tag will trigger
    UAbilitySystemBlueprintLibrary::SendGameplayEventToActor(
        this,
        FGameplayTag::RequestGameplayTag("Event.Melee.Hit"),
        EventData);
}
```

### Handling an Event in an Ability

```cpp
// In ability constructor, set up event trigger
UGA_MeleeReaction::UGA_MeleeReaction()
{
    FAbilityTriggerData TriggerData;
    TriggerData.TriggerTag = FGameplayTag::RequestGameplayTag("Event.Melee.Hit");
    TriggerData.TriggerSource = EGameplayAbilityTriggerSource::GameplayEvent;
    AbilityTriggers.Add(TriggerData);
}

// Override ActivateAbilityFromEvent (NOT ActivateAbility)
void UGA_MeleeReaction::ActivateAbilityFromEvent(
    const FGameplayAbilitySpecHandle Handle,
    const FGameplayAbilityActorInfo* ActorInfo,
    const FGameplayAbilityActivationInfo ActivationInfo,
    const FGameplayEventData* TriggerEventData)
{
    if (!TriggerEventData) { EndAbility(Handle, ActorInfo, ActivationInfo, true, true); return; }

    AActor* TargetActor = const_cast<AActor*>(TriggerEventData->Target.Get());
    // ... apply effects to target ...

    EndAbility(Handle, ActorInfo, ActivationInfo, true, false);
}
```

---

## 8. AbilityTask Usage Patterns

### PlayMontageAndWait + WaitGameplayEvent Combo

```cpp
void UGA_MeleeAttack::ActivateAbility(...)
{
    if (!CommitAbility(Handle, ActorInfo, ActivationInfo))
    {
        EndAbility(Handle, ActorInfo, ActivationInfo, true, true);
        return;
    }

    // Play attack montage
    UAbilityTask_PlayMontageAndWait* MontageTask =
        UAbilityTask_PlayMontageAndWait::CreatePlayMontageAndWaitProxy(
            this, NAME_None, AttackMontage, 1.0f);
    MontageTask->OnCompleted.AddDynamic(this, &UGA_MeleeAttack::OnMontageFinished);
    MontageTask->OnCancelled.AddDynamic(this, &UGA_MeleeAttack::OnMontageCancelled);
    MontageTask->OnInterrupted.AddDynamic(this, &UGA_MeleeAttack::OnMontageCancelled);
    MontageTask->ReadyForActivation();

    // Wait for hit event from anim notify (runs concurrently with montage)
    UAbilityTask_WaitGameplayEvent* EventTask =
        UAbilityTask_WaitGameplayEvent::WaitGameplayEvent(
            this, FGameplayTag::RequestGameplayTag("Event.Montage.Hit"));
    EventTask->EventReceived.AddDynamic(this, &UGA_MeleeAttack::OnHitEventReceived);
    EventTask->ReadyForActivation();
}

void UGA_MeleeAttack::OnHitEventReceived(FGameplayEventData Payload)
{
    // Apply damage GE to the target from the event
    if (AActor* Target = const_cast<AActor*>(Payload.Target.Get()))
    {
        if (UAbilitySystemComponent* TargetASC = UAbilitySystemBlueprintLibrary::GetAbilitySystemComponent(Target))
        {
            FGameplayEffectSpecHandle DamageSpec = MakeOutgoingGameplayEffectSpec(DamageEffectClass, GetAbilityLevel());
            ApplyGameplayEffectSpecToTarget(CurrentSpecHandle, CurrentActorInfo, CurrentActivationInfo, DamageSpec, TargetASC);
        }
    }
}

void UGA_MeleeAttack::OnMontageFinished()
{
    EndAbility(CurrentSpecHandle, CurrentActorInfo, CurrentActivationInfo, true, false);
}

void UGA_MeleeAttack::OnMontageCancelled()
{
    EndAbility(CurrentSpecHandle, CurrentActorInfo, CurrentActivationInfo, true, true);
}
```

---

## 9. Gameplay Cue Actor

### GCN_FireAura.h

```cpp
#pragma once

#include "CoreMinimal.h"
#include "GameplayCueNotify_Actor.h"
#include "GCN_FireAura.generated.h"

UCLASS()
class MYPROJECT_API AGCN_FireAura : public AGameplayCueNotify_Actor
{
    GENERATED_BODY()

public:
    AGCN_FireAura();

    virtual bool OnActive_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters) override;
    virtual bool WhileActive_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters) override;
    virtual bool OnRemove_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters) override;

protected:
    UPROPERTY(EditDefaultsOnly, Category = "Effects")
    TObjectPtr<UParticleSystem> FireParticleSystem;

    UPROPERTY(EditDefaultsOnly, Category = "Effects")
    TObjectPtr<USoundBase> FireLoopSound;

    UPROPERTY()
    TObjectPtr<UParticleSystemComponent> ActiveParticles;

    UPROPERTY()
    TObjectPtr<UAudioComponent> ActiveSound;
};
```

### GCN_FireAura.cpp

```cpp
#include "GCN_FireAura.h"
#include "Particles/ParticleSystemComponent.h"
#include "Components/AudioComponent.h"
#include "Kismet/GameplayStatics.h"

AGCN_FireAura::AGCN_FireAura()
{
    // Tag MUST match the GameplayCue tag: "GameplayCue.Fire.Aura"
    GameplayCueTag = FGameplayTag::RequestGameplayTag("GameplayCue.Fire.Aura");

    // Auto-destroy when cue is removed
    bAutoDestroyOnRemove = true;
}

bool AGCN_FireAura::OnActive_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters)
{
    if (MyTarget && FireParticleSystem)
    {
        ActiveParticles = UGameplayStatics::SpawnEmitterAttached(
            FireParticleSystem, MyTarget->GetRootComponent(),
            NAME_None, FVector::ZeroVector, FRotator::ZeroRotator,
            EAttachLocation::KeepRelativeOffset, true);
    }

    if (MyTarget && FireLoopSound)
    {
        ActiveSound = UGameplayStatics::SpawnSoundAttached(
            FireLoopSound, MyTarget->GetRootComponent());
    }

    return true;
}

bool AGCN_FireAura::WhileActive_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters)
{
    // Called when this cue becomes relevant (e.g., actor comes into view mid-effect)
    // Restart effects if they're not already playing
    if (!ActiveParticles && MyTarget && FireParticleSystem)
    {
        ActiveParticles = UGameplayStatics::SpawnEmitterAttached(
            FireParticleSystem, MyTarget->GetRootComponent());
    }
    return true;
}

bool AGCN_FireAura::OnRemove_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters)
{
    if (ActiveParticles)
    {
        ActiveParticles->DeactivateSystem();
        ActiveParticles = nullptr;
    }

    if (ActiveSound)
    {
        ActiveSound->Stop();
        ActiveSound = nullptr;
    }

    return true;
}
```

---

## 10. Native GameplayTag Declaration

### MyGameplayTags.h

```cpp
#pragma once

#include "NativeGameplayTags.h"

// Forward-declare all project tags in one header
namespace MyGameplayTags
{
    // Status effects
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Status_Stun);
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Status_Silence);
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Status_Burning);
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Status_Invulnerable);

    // Ability categories
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Ability_Melee);
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Ability_Ranged);
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Ability_Spell);

    // Cooldowns
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Cooldown_Ability_Fireball);
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Cooldown_Ability_MeleeAttack);

    // Events
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Event_Montage_Hit);
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Event_Death);

    // Data (for SetByCaller)
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Data_Damage);
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Data_DamageMultiplier);
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Data_Healing);

    // Gameplay Cues
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_GameplayCue_Fire_Impact);
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_GameplayCue_Fire_Aura);
    UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_GameplayCue_Heal);
}
```

### MyGameplayTags.cpp

```cpp
#include "MyGameplayTags.h"

namespace MyGameplayTags
{
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Status_Stun, "Status.Debuff.Stun", "Character is stunned");
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Status_Silence, "Status.Debuff.Silence", "Character cannot cast spells");
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Status_Burning, "Status.Debuff.Burning", "Character takes fire damage over time");
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Status_Invulnerable, "Status.Buff.Invulnerable", "Character cannot take damage");

    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Ability_Melee, "Ability.Melee", "Melee ability category");
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Ability_Ranged, "Ability.Ranged", "Ranged ability category");
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Ability_Spell, "Ability.Spell", "Spell ability category");

    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Cooldown_Ability_Fireball, "Cooldown.Ability.Fireball", "Fireball cooldown");
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Cooldown_Ability_MeleeAttack, "Cooldown.Ability.MeleeAttack", "Melee attack cooldown");

    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Event_Montage_Hit, "Event.Montage.Hit", "Anim notify hit event");
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Event_Death, "Event.Death", "Character death event");

    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Data_Damage, "Data.Damage", "SetByCaller: raw damage value");
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Data_DamageMultiplier, "Data.DamageMultiplier", "SetByCaller: damage multiplier");
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Data_Healing, "Data.Healing", "SetByCaller: healing value");

    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_GameplayCue_Fire_Impact, "GameplayCue.Fire.Impact", "Fire hit visual effect");
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_GameplayCue_Fire_Aura, "GameplayCue.Fire.Aura", "Persistent fire aura effect");
    UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_GameplayCue_Heal, "GameplayCue.Heal", "Healing visual effect");
}
```

---

## 11. Common Gameplay Patterns

### Stun Effect (Duration GE + Tag)

```cpp
// Create in Blueprint or C++:
// UGameplayEffect* GE_Stun
// - DurationPolicy: HasDuration (2 seconds)
// - GrantedTags: Status.Debuff.Stun (via UTargetTagsGameplayEffectComponent)
// - GameplayCue: GameplayCue.Status.Stun

// Abilities that should be blocked by stun:
// In constructor: ActivationBlockedTags.AddTag(TAG_Status_Stun);

// Apply stun:
FGameplayEffectSpecHandle StunSpec = ASC->MakeOutgoingSpec(GE_Stun, 1, ContextHandle);
ASC->ApplyGameplayEffectSpecToTarget(*StunSpec.Data.Get(), TargetASC);
```

### Sprint (Infinite GE + Stamina Drain)

```cpp
// GE_SprintSpeed: Infinite duration, Multiply MovementSpeed by 1.5
// GE_SprintStaminaDrain: Infinite duration with Period (0.1s), subtract Stamina per tick

void UGA_Sprint::ActivateAbility(...)
{
    if (!CommitAbility(Handle, ActorInfo, ActivationInfo))
    {
        EndAbility(Handle, ActorInfo, ActivationInfo, true, true);
        return;
    }

    // Apply speed buff and stamina drain
    SpeedHandle = ApplyGameplayEffectSpecToOwner(CurrentSpecHandle, CurrentActorInfo,
        CurrentActivationInfo, MakeOutgoingGameplayEffectSpec(GE_SprintSpeed, 1));
    DrainHandle = ApplyGameplayEffectSpecToOwner(CurrentSpecHandle, CurrentActorInfo,
        CurrentActivationInfo, MakeOutgoingGameplayEffectSpec(GE_SprintStaminaDrain, 1));

    // Wait for input release to stop sprinting
    UAbilityTask_WaitInputRelease* InputTask = UAbilityTask_WaitInputRelease::WaitInputRelease(this);
    InputTask->OnRelease.AddDynamic(this, &UGA_Sprint::OnSprintReleased);
    InputTask->ReadyForActivation();
}

void UGA_Sprint::OnSprintReleased(float TimeHeld)
{
    // Remove sprint effects
    UAbilitySystemComponent* ASC = GetAbilitySystemComponentFromActorInfo();
    if (ASC)
    {
        ASC->RemoveActiveGameplayEffect(SpeedHandle);
        ASC->RemoveActiveGameplayEffect(DrainHandle);
    }
    EndAbility(CurrentSpecHandle, CurrentActorInfo, CurrentActivationInfo, true, false);
}
```

### Lifesteal (in Execution Calculation)

```cpp
// Inside Execute_Implementation after calculating FinalDamage:
float LifestealPercent = 0.15f; // 15% lifesteal
float HealAmount = FinalDamage * LifestealPercent;

if (HealAmount > 0.0f && SourceASC)
{
    // Apply healing to source via IncomingHealing meta attribute
    // (requires a separate GE or direct attribute modification)
    FGameplayEffectSpecHandle HealSpec = SourceASC->MakeOutgoingSpec(GE_Lifesteal, 1, SourceASC->MakeEffectContext());
    HealSpec.Data->SetSetByCallerMagnitude(TAG_Data_Healing, HealAmount);
    SourceASC->ApplyGameplayEffectSpecToSelf(*HealSpec.Data.Get());
}
```

### Dynamic GameplayEffect Creation at Runtime

```cpp
// Create a temporary GE at runtime (useful for dynamic buffs)
UGameplayEffect* DynamicEffect = NewObject<UGameplayEffect>(GetTransientPackage(), FName("DynamicBuff"));
DynamicEffect->DurationPolicy = EGameplayEffectDurationType::HasDuration;
DynamicEffect->DurationMagnitude = FScalableFloat(5.0f); // 5 seconds

// Add modifier
FGameplayModifierInfo Modifier;
Modifier.Attribute = UMyAttributeSet::GetAttackPowerAttribute();
Modifier.ModifierOp = EGameplayModOp::Additive;
Modifier.ModifierMagnitude = FScalableFloat(25.0f); // +25 attack
DynamicEffect->Modifiers.Add(Modifier);

// Apply
FGameplayEffectContextHandle Context = ASC->MakeEffectContext();
FGameplayEffectSpec Spec(DynamicEffect, Context, 1.0f);
ASC->ApplyGameplayEffectSpecToSelf(Spec);
```
