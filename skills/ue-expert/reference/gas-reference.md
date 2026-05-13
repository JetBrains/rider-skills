# Gameplay Ability System (GAS) — Complete Reference

Source: Epic Games official documentation (UE 5.5–5.7) + tranek/GASDocumentation community reference.

## 1. Overview

The Gameplay Ability System (GAS) is a framework for building attributes, abilities, and interactions that an Actor can own and trigger. Designed for RPGs, action-adventure games, MOBAs, and similar titles. It handles:

- Simple attacks to complex spells with multiple status effects
- Cooldowns, costs, and resource management
- Network replication with client-side prediction
- Data-driven design via Gameplay Effects and Gameplay Tags

### Core Components

| Component | Class | Purpose |
|-----------|-------|---------|
| Ability System Component | `UAbilitySystemComponent` | Central hub connecting actors to GAS |
| Gameplay Abilities | `UGameplayAbility` | Active/passive abilities actors can own and trigger |
| Attribute Sets | `UAttributeSet` | Containers for `FGameplayAttributeData` values (health, mana, etc.) |
| Gameplay Effects | `UGameplayEffect` | Data assets that modify attributes (damage, buffs, debuffs) |
| Ability Tasks | `UAbilityTask` | Async operations within abilities (montages, input waits) |
| Gameplay Cues | `AGameplayCueNotify_Actor` / `_Static` | Cosmetic feedback (particles, sounds) — NOT gameplay logic |
| Gameplay Tags | `FGameplayTag` / `FGameplayTagContainer` | Hierarchical labels for state, gating, and filtering |

---

## 2. Project Setup

### Step 1: Enable Plugin
Enable "Gameplay Abilities" plugin in the Editor (Edit > Plugins).

### Step 2: Build.cs Dependencies
```csharp
PrivateDependencyModuleNames.AddRange(new string[] {
    "GameplayAbilities",
    "GameplayTags",
    "GameplayTasks"
});
```

### Step 3: InitGlobalData (UE 4.24–5.2 only, automatic in 5.3+)
```cpp
// In UAssetManager::StartInitialLoading()
UAbilitySystemGlobals::Get().InitGlobalData();
```
Required for TargetData functionality. Without it, TargetData serialization will fail.

### Step 4: Regenerate project files after Build.cs changes.

---

## 3. Ability System Component (ASC)

### Core Class: `UAbilitySystemComponent`

The ASC is the heart of GAS — a `UActorComponent` managing all interactions. Any actor using abilities, attributes, or receiving effects needs an ASC or access to one.

### Setup Pattern

```cpp
// Header
class AMyCharacter : public ACharacter, public IAbilitySystemInterface
{
    GENERATED_BODY()

public:
    virtual UAbilitySystemComponent* GetAbilitySystemComponent() const override;

protected:
    UPROPERTY(VisibleDefaultsOnly, BlueprintReadOnly, Category = "Abilities")
    TObjectPtr<UAbilitySystemComponent> AbilitySystemComponent;
};

// Source
AMyCharacter::AMyCharacter()
{
    AbilitySystemComponent = CreateDefaultSubobject<UAbilitySystemComponent>(TEXT("AbilitySystemComponent"));
    AbilitySystemComponent->SetIsReplicated(true);
}

UAbilitySystemComponent* AMyCharacter::GetAbilitySystemComponent() const
{
    return AbilitySystemComponent;
}
```

### Owner vs Avatar

- **OwnerActor**: The actor with the ASC attached (often PlayerState for persistence)
- **AvatarActor**: The physical representation (the Character/Pawn)
- Both should implement `IAbilitySystemInterface`

### Initialization

```cpp
// Server: in PossessedBy()
void AMyCharacter::PossessedBy(AController* NewController)
{
    Super::PossessedBy(NewController);
    AbilitySystemComponent->InitAbilityActorInfo(this, this);
}

// Client: in AcknowledgePossession() on PlayerController
void AMyPlayerController::AcknowledgePossession(APawn* P)
{
    Super::AcknowledgePossession(P);
    if (AMyCharacter* Character = Cast<AMyCharacter>(P))
    {
        Character->GetAbilitySystemComponent()->InitAbilityActorInfo(Character, Character);
    }
}
```

### ASC on PlayerState (recommended for multiplayer)
Placing ASC on PlayerState preserves attributes and effects across pawn respawns. Increase `NetUpdateFrequency` on PlayerState (defaults very low). Enable Adaptive Network Update Frequency.

### Critical Constraint
An actor can have only ONE Ability System Component. Multiple ASCs on a single actor cause ambiguity in queries, modifications, and retrieval.

### Replication Modes

| Mode | Use Case | GameplayEffects | Tags/Cues |
|------|----------|-----------------|-----------|
| **Full** | Single player | Replicate to all | Replicate to all |
| **Mixed** | Multiplayer player-controlled | Owning client only | All clients |
| **Minimal** | Multiplayer AI | Not replicated | All clients |

**Mixed mode requires** the OwnerActor's Owner to be the Controller. PlayerState has this by default; Character needs `SetOwner(Controller)`.

### Iterating Abilities Safely
```cpp
ABILITYLIST_SCOPE_LOCK();
for (FGameplayAbilitySpec& Spec : AbilitySystemComponent->GetActivatableAbilities())
{
    // Safe to iterate
}
```

---

## 4. Gameplay Attributes & Attribute Sets

### FGameplayAttributeData

Attributes are floating-point values with dual storage:
- **BaseValue**: Permanent value, modified by Instant effects and level-ups
- **CurrentValue**: BaseValue + temporary modifiers from duration/infinite effects

### Creating an Attribute Set

```cpp
UCLASS()
class MYPROJECT_API UMyAttributeSet : public UAttributeSet
{
    GENERATED_BODY()

public:
    // Attribute declaration
    UPROPERTY(EditAnywhere, BlueprintReadOnly, ReplicatedUsing = OnRep_Health)
    FGameplayAttributeData Health;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, ReplicatedUsing = OnRep_MaxHealth)
    FGameplayAttributeData MaxHealth;

    // Accessor macros (generates GetHealthAttribute(), GetHealth(), SetHealth(), InitHealth())
    GAMEPLAYATTRIBUTE_PROPERTY_GETTER(UMyAttributeSet, Health);
    GAMEPLAYATTRIBUTE_VALUE_GETTER(Health);
    GAMEPLAYATTRIBUTE_VALUE_SETTER(Health);
    GAMEPLAYATTRIBUTE_VALUE_INITTER(Health);

    GAMEPLAYATTRIBUTE_PROPERTY_GETTER(UMyAttributeSet, MaxHealth);
    GAMEPLAYATTRIBUTE_VALUE_GETTER(MaxHealth);
    GAMEPLAYATTRIBUTE_VALUE_SETTER(MaxHealth);
    GAMEPLAYATTRIBUTE_VALUE_INITTER(MaxHealth);

protected:
    UFUNCTION()
    virtual void OnRep_Health(const FGameplayAttributeData& OldHealth);

    UFUNCTION()
    virtual void OnRep_MaxHealth(const FGameplayAttributeData& OldMaxHealth);

    virtual void GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const override;
};
```

### Replication Implementation

```cpp
void UMyAttributeSet::OnRep_Health(const FGameplayAttributeData& OldHealth)
{
    GAMEPLAYATTRIBUTE_REPNOTIFY(UMyAttributeSet, Health, OldHealth);
}

void UMyAttributeSet::GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const
{
    Super::GetLifetimeReplicatedProps(OutLifetimeProps);
    DOREPLIFETIME_CONDITION_NOTIFY(UMyAttributeSet, Health, COND_None, REPNOTIFY_Always);
    DOREPLIFETIME_CONDITION_NOTIFY(UMyAttributeSet, MaxHealth, COND_None, REPNOTIFY_Always);
}
```

### Registration with ASC

Three methods:
1. **Constructor**: Create as subobject — auto-registers if `GetAbilitySystemComponent()` is valid
2. **Blueprint**: Add Attribute Set type to ASC's "Default Starting Data"
3. **Programmatic** (recommended):
```cpp
UAbilitySystemComponent* ASC = GetAbilitySystemComponent();
if (IsValid(ASC))
{
    AttributeSet = ASC->GetSet<UMyAttributeSet>();
}
```

**Constraint**: Each ASC can have multiple Attribute Sets, but each must be a different class.

### Key Virtual Functions

| Function | When Called | Use For |
|----------|------------|---------|
| `PreAttributeChange()` | Before any modification | Clamp values (prevent health < 0). Do NOT trigger game reactions here. |
| `PreAttributeBaseChange()` | Before base value change | Same as above but for base value only |
| `PreGameplayEffectExecute()` | Before GE executes | Reject or alter proposed changes |
| `PostGameplayEffectExecute()` | After GE executes | Final clamping, death triggers, game reactions |

```cpp
void UMyAttributeSet::PostGameplayEffectExecute(const FGameplayEffectModCallbackData& Data)
{
    Super::PostGameplayEffectExecute(Data);

    if (Data.EvaluatedData.Attribute == GetHealthAttribute())
    {
        SetHealth(FMath::Clamp(GetHealth(), 0.0f, GetMaxHealth()));
    }
}
```

### Custom Getters/Setters for Clamping

```cpp
float UMyAttributeSet::GetHealth() const
{
    return FMath::Max(Health.GetCurrentValue(), 0.0f);
}

void UMyAttributeSet::SetHealth(float NewVal)
{
    NewVal = FMath::Max(NewVal, 0.0f);
    UAbilitySystemComponent* ASC = GetOwningAbilitySystemComponent();
    if (ensure(ASC))
    {
        ASC->SetNumericAttributeBase(GetHealthAttribute(), NewVal);
    }
}
```

### Data Table Initialization

CSV format: `AttributeSetName.AttributeName,BaseValue,MinValue,MaxValue,...`
```
---,BaseValue,MinValue,MaxValue,DerivedAttributeInfo,bCanStack
MyAttributeSet.Health,"100.0","0.0","150.0","","False"
```
**Pitfall**: MinValue and MaxValue columns exist but have NO effect — the system lacks built-in clamping. You must implement clamping yourself.

### Meta Attributes

Temporary-only attributes used during calculations (e.g., "IncomingDamage" receives damage value, then execution calculation applies it to Health). Never replicate meta attributes.

---

## 5. Gameplay Effects (GE)

### Core Class: `UGameplayEffect`

Immutable data assets that modify attributes. Runtime instances are wrapped in `FGameplayEffectSpec`.

### Duration Types

| Type | Behavior | Container |
|------|----------|-----------|
| **Instant** | Modifies BaseValue permanently, never stored | Not added to Active GE Container |
| **Has Duration** | Modifies CurrentValue for limited time, auto-removes | Added to Active GE Container |
| **Infinite** | Modifies CurrentValue indefinitely, must be manually removed | Added to Active GE Container |

**Critical rule**: Instant effects modify BaseValue. Duration/Infinite effects modify CurrentValue and are undone when the effect ends.

### Modifiers

Modifiers define how a GE interacts with attributes:
- Mathematical operations: Add, Multiply, Divide, Override
- Gameplay Tag requirements per modifier (conditional application)
- Magnitude calculation types: Scalable Float, Attribute Based, Custom Calculation Class, SetByCaller

### SetByCaller

Dynamic values passed to effects at runtime:
```cpp
FGameplayEffectSpecHandle SpecHandle = ASC->MakeOutgoingSpec(DamageEffect, Level, ContextHandle);
SpecHandle.Data->SetSetByCallerMagnitude(FGameplayTag::RequestGameplayTag("Data.Damage"), DamageValue);
ASC->ApplyGameplayEffectSpecToSelf(*SpecHandle.Data.Get());
```

### Executions (UGameplayEffectExecutionCalculation)

For complex calculations beyond simple modifiers:

```cpp
UCLASS()
class UMyDamageExecution : public UGameplayEffectExecutionCalculation
{
    GENERATED_BODY()

public:
    UMyDamageExecution();

    virtual void Execute_Implementation(
        const FGameplayEffectCustomExecutionParameters& ExecutionParams,
        FGameplayEffectCustomExecutionOutput& OutExecutionOutput) const override;
};
```

Executions can:
- Capture source and target attributes
- Perform arbitrary math
- Output multiple attribute modifications
- Access GameplayEffectContext for instigator/causer info

### Modifier Magnitude Calculations (UGameplayModMagnitudeCalculation)

Custom calculation classes for modifier magnitudes:

```cpp
UCLASS()
class UMyModCalc : public UGameplayModMagnitudeCalculation
{
    GENERATED_BODY()

public:
    virtual float CalculateBaseMagnitude_Implementation(const FGameplayEffectSpec& Spec) const override;
};
```

Key methods:
- `GetCapturedAttributeMagnitude()` — retrieve captured attribute values
- `GetSetByCallerMagnitudeByTag()` — access SetByCaller values
- `GetSourceAggregatedTags()` / `GetTargetAggregatedTags()` — check tags on source/target

### Gameplay Effect Components

| Component | Purpose |
|-----------|---------|
| `UChanceToApplyGameplayEffectComponent` | Probability-based application |
| `UBlockAbilityTagsGameplayEffectComponent` | Block abilities by tag on target |
| `UAssetTagsGameplayEffectComponent` | Tags owned by the GE asset (not transferred to actors) |
| `UAdditionalEffectsGameplayEffectComponent` | Chain additional GEs under conditions |
| `UTargetTagsGameplayEffectComponent` | Grant tags to target/owner |
| `UTargetTagRequirementsGameplayEffectComponent` | Tag requirements for application |
| `URemoveOtherGameplayEffectComponent` | Remove other GEs conditionally |
| `UImmunityGameplayEffectComponent` | Block specific GE applications |
| `UCustomCanApplyGameplayEffectComponent` | Custom application requirements |

### Stacking

- Stack count with maximum limits
- Reset or extend durations on re-application
- Independent instances with individual timers
- Behavior on stack expiry (remove one or all)

### Immunity

Targets with immunity tags automatically reject matching effect applications without executing modifications.

### Cost and Cooldown

Standard patterns (not special systems):
- **Cost GE**: Instant effect subtracting resource (mana, stamina)
- **Cooldown GE**: Duration effect with a cooldown tag that blocks re-activation

---

## 6. Gameplay Abilities (GA)

### Core Class: `UGameplayAbility`

Defines what an ability does, its costs, activation conditions, and execution flow.

### Lifecycle

1. **Grant**: `GiveAbility(FGameplayAbilitySpec)` — server only
2. **Check**: `CanActivateAbility()` — availability without execution
3. **Activate**: `TryActivateAbility()` — checks + activates
4. **Commit**: `CommitAbility()` — apply cost and cooldown
5. **Execute**: Run ability logic, launch Ability Tasks
6. **End**: `EndAbility()` — REQUIRED or ability appears perpetually active

**Critical Warning**: Failing to call `EndAbility()` causes the system to believe the ability is still running, preventing future activation and blocking dependent abilities.

### Granting/Revoking (Server-Only)

```cpp
// Grant
FGameplayAbilitySpec Spec(AbilityClass, Level, InputID, this);
FGameplayAbilitySpecHandle Handle = ASC->GiveAbility(Spec);

// Grant and activate immediately
ASC->GiveAbilityAndActivateOnce(Spec);

// Revoke
ASC->ClearAbility(Handle);
ASC->SetRemoveAbilityOnEnd(Handle);  // Remove when current execution finishes
ASC->ClearAllAbilities();
```

### Instancing Policy

| Policy | Object Creation | Use Case |
|--------|----------------|----------|
| **Instanced Per Execution** | New object per activation | Infrequent abilities (MOBA ultimates) |
| **Instanced Per Actor** | One object per actor, reused | Most abilities. Best for replication. |
| **Non-Instanced** | Uses Class Default Object | High-frequency abilities (RTS basic attacks). C++ only, no member vars, no delegates, no replication. |

### Net Execution Policy

| Policy | Behavior |
|--------|----------|
| **Local Predicted** | Client executes immediately, server confirms. Responsive but may rollback. |
| **Local Only** | Client only, no server replication of the ability itself. |
| **Server Initiated** | Server runs, propagates to clients. More accurate, more latency. |
| **Server Only** | Server exclusively. Clients see results via normal replication. |

### Gameplay Tags on Abilities

| Tag Variable | Purpose |
|-------------|---------|
| `CancelAbilitiesWithTag` | Cancel running abilities with matching tags |
| `BlockAbilitiesWithTag` | Prevent activation of matching abilities |
| `ActivationOwnedTags` | Tags granted to owner during execution |
| `ActivationRequiredTags` | Owner must have ALL these tags to activate |
| `ActivationBlockedTags` | Owner must NOT have ANY of these tags |
| `TargetRequiredTags` | Target must have ALL these tags |
| `TargetBlockedTags` | Target must NOT have ANY of these tags |

### Gameplay Events

Trigger abilities via `FGameplayEventData`:
```cpp
// Send event to actor
UAbilitySystemBlueprintLibrary::SendGameplayEventToActor(TargetActor, EventTag, EventData);

// Or direct ASC call
ASC->HandleGameplayEvent(EventTag, &EventData);
```

**Important**: Triggered abilities execute `ActivateAbilityFromEvent()` (not `ActivateAbility()`), receiving event data as parameter. Handle both code paths.

---

## 7. Ability Tasks

### Core Class: `UAbilityTask`

Async operations within abilities that execute across multiple frames.

### Key Characteristics
- Execute within a Gameplay Ability's context
- Self-terminate via `EndTask()` or auto-terminate when parent ability ends
- Affect execution flow through Delegates (C++) or output pins (Blueprint)
- Work in networked and non-networked environments
- Maintain indirect synchronization through replicated parent abilities

### Common Built-in Tasks
- `UAbilityTask_PlayMontageAndWait` — Play animation montage
- `UAbilityTask_WaitGameplayEvent` — Wait for a gameplay event
- `UAbilityTask_WaitInputPress` / `WaitInputRelease` — Wait for input
- `UAbilityTask_WaitTargetData` — Wait for targeting data
- `UAbilityTask_WaitGameplayTagAdded` / `Removed` — React to tag changes
- `UAbilityTask_WaitDelay` — Timer-based wait
- `UAbilityTask_ApplyRootMotionConstantForce` — Root motion movement

### Usage Pattern

```cpp
void UMyAbility::ActivateAbility(...)
{
    UAbilityTask_PlayMontageAndWait* MontageTask =
        UAbilityTask_PlayMontageAndWait::CreatePlayMontageAndWaitProxy(
            this, NAME_None, AttackMontage, 1.0f);

    MontageTask->OnCompleted.AddDynamic(this, &UMyAbility::OnMontageCompleted);
    MontageTask->OnCancelled.AddDynamic(this, &UMyAbility::OnMontageCancelled);
    MontageTask->OnInterrupted.AddDynamic(this, &UMyAbility::OnMontageInterrupted);
    MontageTask->ReadyForActivation();
}
```

---

## 8. Gameplay Tags

### Core Types
- `FGameplayTag` — Single tag
- `FGameplayTagContainer` — Multiple tags
- `FGameplayTagQuery` — Complex tag queries

### Hierarchical Naming

Tags use dot-separated hierarchy: `Status.Debuff.Stun`, `Ability.Melee.Slash`, `GameplayCue.Fire.Impact`

### Defining Tags

**C++ Native Tags** (preferred for code-referenced tags):
```cpp
// Header
#include "NativeGameplayTags.h"
UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_Status_Stun);

// Source
UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_Status_Stun, "Status.Debuff.Stun", "Character is stunned");
```

**Project Settings**: Edit > Project Settings > Gameplay Tags > Manage Gameplay Tags

**Data Tables**: Import from CSV/JSON using `GameplayTagTableRow` row type.

### Tag Operations

```cpp
// Container operations
FGameplayTagContainer Tags;
Tags.AddTag(FGameplayTag::RequestGameplayTag("Status.Buff.Speed"));
Tags.RemoveTag(FGameplayTag::RequestGameplayTag("Status.Buff.Speed"));

// Queries
bool bHas = Tags.HasTag(SomeTag);
bool bHasAny = Tags.HasAny(OtherContainer);
bool bHasAll = Tags.HasAll(RequiredContainer);
```

**Pitfall**: `HasAny()` with an empty container returns false. `HasAll()` with an empty container returns true.

### Tag Queries (FGameplayTagQuery)

Combine conditions:
- `AnyTagsMatch` — at least one tag found
- `AllTagsMatch` — all tags found (empty returns true)
- `NoTagsMatch` — no tags found (empty returns true)
- Nested expressions: `AnyExpressionsMatch`, `AllExpressionsMatch`, `NoExpressionsMatch`

### IGameplayTagAssetInterface

Implement for streamlined tag access:
```cpp
class AMyActor : public AActor, public IGameplayTagAssetInterface
{
    virtual void GetOwnedGameplayTags(FGameplayTagContainer& TagContainer) const override;
};
```

---

## 9. Gameplay Cues

### Purpose
Cosmetic-only effects (particles, sounds, camera shakes). **NEVER use for gameplay logic** — Gameplay Cues do not use reliable replication, so clients may miss them.

### Types

| Class | Behavior | Use Case |
|-------|----------|----------|
| `AGameplayCueNotify_Actor` | Spawns persistent actor, maintains state, can tick | Ongoing effects (auras, sprint trails) |
| `AGameplayCueNotify_Looping` | Subclass of Actor, continuous looping effects | Persistent particle loops |
| `AGameplayCueNotify_Static` (via UGameplayCueNotify_Static) | Fire-and-forget, no state | Impact effects, one-shots |

### Tag Convention
All Gameplay Cue tags MUST be prefixed with `GameplayCue.`:
- `GameplayCue.Fire.Impact`
- `GameplayCue.ElectricalSparks`
- `GameplayCue.WaterSplash.Big`

### Key Events (AGameplayCueNotify_Actor)

| Event | When Fired |
|-------|------------|
| `OnActive` | Duration-based cue first activates |
| `WhileActive` | Cue becomes relevant (joins in progress) |
| `OnExecute` | Instant effects or periodic ticks |
| `OnRemove` | Cue duration ends |

### Triggering

```cpp
// Via ASC
ASC->ExecuteGameplayCue(GameplayCueTag, Parameters);  // One-shot
ASC->AddGameplayCue(GameplayCueTag, Parameters);       // Persistent
ASC->RemoveGameplayCue(GameplayCueTag);                // Remove persistent
```

### UGameplayCueManager

Singleton manager handling dispatch and spawning. Key features:
- Cue routing and dispatching
- Actor recycling pool for performance
- Preallocation system
- Asset library management
- Batching support via `StartGameplayCueSendContext()` / `EndGameplayCueSendContext()`
- Non-replicated local cues: `AddGameplayCue_NonReplicated()`, `ExecuteGameplayCue_NonReplicated()`

### Performance: Batching
- **Manual RPC Batching**: Group multiple cue calls into single network packet
- **Multiple Cues on One GE**: Attach several cues to one Gameplay Effect

---

## 10. Prediction

### How It Works

Client-side prediction lets clients execute ability logic optimistically while awaiting server confirmation. The system uses `FPredictionKey` — unique IDs generated on the client and sent to the server.

### What CAN Be Predicted
- Ability activation
- Animation montage playback
- Attribute modifications (via GameplayEffects)
- Gameplay Tag application
- Gameplay Cue spawning
- Root Motion movement

### What CANNOT Be Predicted
- **GameplayEffect removal** — Major limitation. Workaround: predict adding an inverse effect.
- Projectile spawning (only the animation is predicted)

### FPredictionKey

```
- Current (int16): Unique ID
- Base (int16): Original key in dependency chains
- bIsServerInitiated (bool): Server-created key flag
```

Key methods:
- `CreateNewPredictionKey()` — Generate independent key
- `GenerateDependentPredictionKey()` — Create dependent key in chain
- `NewRejectedDelegate()` — Called on prediction failure (rollback)
- `NewCaughtUpDelegate()` — Called when server confirms prediction

### Prediction Window

The prediction window spans the synchronous `ActivateAbility` callstack. Timers or latent nodes invalidate the window. Use `FScopedPredictionWindow` for additional prediction scopes.

### Net Execution Policies for Prediction

- **Local Predicted**: Best for responsive gameplay. Client predicts, server confirms/rejects.
- **Server Initiated**: No client prediction. More accurate but delayed.

---

## 11. Targeting

### Target Data: `FGameplayAbilityTargetData`

Structures containing target information passed through the ability pipeline.

### Target Actors

Handle target acquisition mechanics:
- Raycasting / shape-based detection
- Valid target filtering
- Confirm/cancel selection
- Generate TargetData from player input

### Target Data Filters

Refine valid targets: team checks, line-of-sight, range validation.

### Gameplay Ability World Reticles

3D widgets showing valid target locations/ranges for targeting feedback.

### Gameplay Effect Containers

Bundle targeting logic with effect application. Centralizes ability configuration for designers.

---

## 12. Common Implementation Patterns

### Stun
Apply a GE that grants `Status.Debuff.Stun` tag. Abilities check `ActivationBlockedTags` for that tag. Visual feedback via Gameplay Cue.

### Sprint
GE modifying MovementSpeed attribute. Constantly drains stamina. Use Local Predicted for responsiveness.

### Lifesteal
Execution Calculation monitors outgoing damage and applies proportional healing GE to source.

### Passive Armor Stacks
Periodic GE granting armor stacks (max 4). Receiving damage removes one stack.

### Cost and Cooldown
- Cost: Instant GE subtracting resource attribute
- Cooldown: Duration GE with cooldown tag blocking re-activation via `ActivationBlockedTags`

### Damage with Armor Mitigation
`UGameplayEffectExecutionCalculation` capturing source Attack and target Armor, computing final damage, applying to target Health.

---

## 13. Debugging

### Console Commands
- `showdebug abilitysystem` — Real-time display of active effects, tags, attributes, abilities
- Gameplay Debugger (apostrophe key) — Visual inspection of ability system state

### Logging
- `LogAbilitySystem` category — Filter for ability system events
- Monitor replication, prediction errors, and effect application timing

---

## 14. Common Pitfalls

1. **Forgetting EndAbility()**: Ability appears perpetually active, blocks future activations
2. **ASC on Character vs PlayerState**: Character = attributes lost on respawn; PlayerState = persistent
3. **Low NetUpdateFrequency on PlayerState**: Perceived lag in attribute/tag replication
4. **Mixed mode without Owner set**: GameplayEffects won't replicate to owning client
5. **Iterating abilities without lock**: Must use `ABILITYLIST_SCOPE_LOCK()` to prevent crashes
6. **Meta attributes replicated**: Meta attributes are temporary calculation helpers — never replicate them
7. **Data Table MinValue/MaxValue**: These columns have NO effect — implement clamping yourself
8. **Gameplay Cues for gameplay logic**: Cues use unreliable replication — use only for cosmetics
9. **Not handling ActivateAbilityFromEvent**: Triggered abilities use a different code path than normal activation
10. **Non-Instanced abilities in Blueprint**: Non-instanced policy is C++ only — cannot use Blueprint graphs
11. **Multiple ASCs on one actor**: Not supported — causes ambiguity in all queries
12. **PreAttributeChange for game reactions**: This function is for clamping only — use PostGameplayEffectExecute for game logic (death, etc.)

---

## 15. API Quick Reference

### UAbilitySystemComponent Key Methods

| Method | Purpose |
|--------|---------|
| `GiveAbility(Spec)` | Grant ability (server only) |
| `GiveAbilityAndActivateOnce(Spec)` | Grant + immediate activation |
| `TryActivateAbility(Handle)` | Check + activate |
| `ClearAbility(Handle)` | Revoke ability |
| `ClearAllAbilities()` | Revoke all abilities |
| `ApplyGameplayEffectSpecToSelf(Spec)` | Apply GE to self |
| `ApplyGameplayEffectSpecToTarget(Spec, Target)` | Apply GE to target |
| `MakeOutgoingSpec(GEClass, Level, Context)` | Create GE spec |
| `RemoveActiveGameplayEffect(Handle)` | Remove active GE |
| `InitAbilityActorInfo(Owner, Avatar)` | Initialize ASC |
| `GetSet<T>()` | Get AttributeSet by type |
| `AddLooseGameplayTag(Tag)` | Add tag without GE |
| `RemoveLooseGameplayTag(Tag)` | Remove loose tag |
| `HasMatchingGameplayTag(Tag)` | Check for tag |
| `ExecuteGameplayCue(Tag, Params)` | Trigger one-shot cue |
| `AddGameplayCue(Tag, Params)` | Add persistent cue |
| `RemoveGameplayCue(Tag)` | Remove persistent cue |

### UGameplayAbility Key Methods

| Method | Purpose |
|--------|---------|
| `ActivateAbility()` | Override to implement ability logic |
| `ActivateAbilityFromEvent()` | Override for event-triggered abilities |
| `CanActivateAbility()` | Check if ability can activate |
| `CommitAbility()` | Apply cost and cooldown |
| `CommitAbilityCost()` | Apply cost only |
| `CommitAbilityCooldown()` | Apply cooldown only |
| `EndAbility()` | REQUIRED — end ability execution |
| `CancelAbility()` | Cancel if CanBeCanceled |
| `SendGameplayEvent(Tag, Payload)` | Send event |
| `GetAbilitySystemComponentFromActorInfo()` | Get ASC |
| `GetAvatarActorFromActorInfo()` | Get avatar actor |
| `MakeOutgoingGameplayEffectSpec(GEClass, Level)` | Create GE spec |
| `ApplyGameplayEffectSpecToOwner(Spec)` | Apply GE to self |
| `ApplyGameplayEffectSpecToTarget(Spec, TargetData)` | Apply GE to target |

### UAttributeSet Key Virtual Functions

| Function | Purpose |
|----------|---------|
| `PreAttributeChange(Attribute, NewValue)` | Clamp before modification |
| `PreAttributeBaseChange(Attribute, NewValue)` | Clamp base value |
| `PreGameplayEffectExecute(Data)` | Reject/alter before GE executes |
| `PostGameplayEffectExecute(Data)` | React after GE executes |
| `GetLifetimeReplicatedProps(OutProps)` | Register replicated attributes |

---

## 16. Optimization Tips

1. **Replication Mode**: Use Minimal for AI, Mixed for players, Full only for single-player
2. **Ability Batching**: Group multiple activations into single network packets
3. **Gameplay Cue Batching**: Combine cue triggers; use multiple cues per GE
4. **Attribute Proxy Replication**: Replicate aggregated proxy values instead of individual changes
5. **ASC Lazy Loading**: Defer initialization until needed for conditional ability systems
6. **Instanced Per Actor**: Preferred over Per Execution for most abilities (avoids object spawning overhead)
7. **Non-Instanced**: Use for very high-frequency abilities (RTS basic attacks) where overhead matters most
