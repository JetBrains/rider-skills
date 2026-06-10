# GAS Damage Pipeline, Death System & Message Processors

Complete end-to-end flows for combat systems built on GAS.

---

## 1. Damage Pipeline (End-to-End)

```
Ability fires → MakeEffectContext() with weapon/cartridge data
    ↓
GameplayEffect with ExecutionCalculation created
    ↓
ExecutionCalculation::Execute() [SERVER ONLY]:
  1. Capture BaseDamage from source CombatSet
  2. Extract HitResult from EffectContext
  3. Query IAbilitySourceInterface for distance/material attenuation
  4. Query TeamSubsystem for friendly-fire check
  5. FinalDamage = BaseDamage × DistanceAtten × MaterialAtten × TeamMultiplier
  6. Output → HealthSet.Damage (meta attribute, additive)
    ↓
HealthSet::PreGameplayEffectExecute() [SERVER]:
  - Check DamageImmunity tag → nullify damage
  - Check GodMode cheat tag → nullify damage
  - Check SelfDestruct tag → bypass immunity
  - Save pre-change health value
    ↓
HealthSet::PostGameplayEffectExecute() [SERVER]:
  - Convert meta: Health = Clamp(Health - Damage, MinHealth, MaxHealth)
  - Reset: SetDamage(0.0f)
  - Broadcast OnHealthChanged delegate
  - If Health ≤ 0 AND !bOutOfHealth:
    - Set bOutOfHealth = true
    - Broadcast OnOutOfHealth delegate
  - Broadcast FVerbMessage with damage tag (for message processors)
    ↓
HealthComponent::HandleOutOfHealth() [SERVER]:
  - Send GameplayEvent.Death to ASC (triggers death ability)
  - Broadcast elimination verb message (for kill feed, stats)
    ↓
Death Ability activates (ServerInitiated, event-triggered):
  - CancelAbilities(nullptr, &IgnoreTypesWithSurvivesDeath)
  - SetActivationGroup(Exclusive_Blocking) — no new abilities
  - HealthComponent->StartDeath()
    ↓
StartDeath():
  - DeathState = DeathStarted
  - ASC->SetLooseGameplayTagCount(Status.Death.Dying, 1)
  - Broadcast OnDeathStarted (Blueprint handles ragdoll/effects)
    ↓
FinishDeath() (called from Blueprint after animation):
  - DeathState = DeathFinished
  - ASC->SetLooseGameplayTagCount(Status.Death.Dead, 1)
  - Broadcast OnDeathFinished (triggers respawn flow)
```

---

## 2. IAbilitySourceInterface (Weapon Damage Modifiers)

Weapons implement this so execution calculations can query damage curves without coupling:

```cpp
class IAbilitySourceInterface {
    // Returns 0.0-1.0 multiplier based on distance (falloff curve)
    virtual float GetDistanceAttenuation(float Distance,
        const FGameplayTagContainer& SourceTags,
        const FGameplayTagContainer& TargetTags) const = 0;

    // Returns 0.0-1.0 multiplier based on surface type (headshot, armor, etc.)
    virtual float GetPhysicalMaterialAttenuation(const UPhysicalMaterial* PhysMat,
        const FGameplayTagContainer& SourceTags,
        const FGameplayTagContainer& TargetTags) const = 0;
};
```

Execution calc gets the source via `FGameplayEffectContext::GetAbilitySource()` → `IAbilitySourceInterface`.

---

## 3. Death Ability Pattern

```cpp
UCLASS()
class UGA_Death : public UMyGameplayAbility
{
public:
    UGA_Death()
    {
        // Only server initiates death
        NetExecutionPolicy = EGameplayAbilityNetExecutionPolicy::ServerInitiated;

        // Triggered by gameplay event, not input
        FAbilityTriggerData Trigger;
        Trigger.TriggerTag = TAG_GameplayEvent_Death;
        Trigger.TriggerSource = EGameplayAbilityTriggerSource::GameplayEvent;
        AbilityTriggers.Add(Trigger);
    }

    virtual void ActivateAbility(...) override
    {
        // Cancel everything except abilities tagged SurvivesDeath
        FGameplayTagContainer IgnoreTypes;
        IgnoreTypes.AddTag(TAG_Ability_Behavior_SurvivesDeath);
        ASC->CancelAbilities(nullptr, &IgnoreTypes);

        // Block all new ability activation
        // (Change from whatever group to Exclusive_Blocking)
        ActivationGroup = EAbilityActivationGroup::Exclusive_Blocking;

        // Start death sequence (sets tags, broadcasts delegates)
        HealthComponent->StartDeath();
    }

    // Called from Blueprint when death animation/ragdoll completes
    UFUNCTION(BlueprintCallable)
    void FinishDeath()
    {
        HealthComponent->FinishDeath();
        EndAbility(...);
    }
};
```

---

## 4. Reset Ability Pattern

```cpp
UCLASS()
class UGA_Reset : public UMyGameplayAbility
{
public:
    UGA_Reset()
    {
        NetExecutionPolicy = EGameplayAbilityNetExecutionPolicy::ServerInitiated;
        // Triggered by GameplayEvent.RequestReset
    }

    virtual void ActivateAbility(...) override
    {
        FGameplayTagContainer IgnoreTypes;
        IgnoreTypes.AddTag(TAG_Ability_Behavior_SurvivesDeath);
        ASC->CancelAbilities(nullptr, &IgnoreTypes);

        Character->Reset();  // Moves to spawn point
        BroadcastResetMessage();
        EndAbility(...);
    }
};
```

---

## 5. Health Component — GAS Bridge

Separates health state machine from GAS internals:

```cpp
UCLASS()
class UHealthComponent : public UGameStateComponent // or UPawnComponent
{
    UPROPERTY(ReplicatedUsing=OnRep_DeathState)
    EDeathState DeathState = EDeathState::NotDead;  // NotDead, DeathStarted, DeathFinished

    // Bind to HealthSet delegates during initialization
    void InitializeWithAbilitySystem(UAbilitySystemComponent* ASC)
    {
        HealthSet->OnOutOfHealth.AddUObject(this, &ThisClass::HandleOutOfHealth);
        HealthSet->OnHealthChanged.AddUObject(this, &ThisClass::HandleHealthChanged);
    }

    void HandleOutOfHealth(...)
    {
        // Send death event → triggers death ability
        FGameplayEventData EventData;
        ASC->HandleGameplayEvent(TAG_GameplayEvent_Death, &EventData);

        // Broadcast elimination verb message for UI/stats
        FVerbMessage Msg;
        Msg.Verb = TAG_Elimination_Message;
        Msg.Instigator = Killer;
        Msg.Target = Victim;
        UGameplayMessageSubsystem::Get(World).BroadcastMessage(Msg.Verb, Msg);
    }

    void StartDeath()
    {
        DeathState = EDeathState::DeathStarted;
        ASC->SetLooseGameplayTagCount(TAG_Status_Death_Dying, 1);
        OnDeathStarted.Broadcast(this);
    }

    void FinishDeath()
    {
        DeathState = EDeathState::DeathFinished;
        ASC->SetLooseGameplayTagCount(TAG_Status_Death_Dead, 1);
        OnDeathFinished.Broadcast(this);
    }

    // Client replication — prevent predicted overshooting
    void OnRep_DeathState(EDeathState OldState)
    {
        if (OldState > DeathState) return;  // Don't go backwards
        if (DeathState == EDeathState::DeathStarted) StartDeath();
        if (DeathState == EDeathState::DeathFinished) FinishDeath();
    }
};
```

---

## 6. Message Processor Pattern (Accolades/Stats)

Base class for systems that listen to gameplay messages and produce derived events:

```cpp
UCLASS(Abstract)
class UGameplayMessageProcessor : public UActorComponent
{
    TArray<FGameplayMessageListenerHandle> ListenerHandles;

    virtual void StartListening() PURE_VIRTUAL;  // Override to subscribe

    virtual void EndPlay(EEndPlayReason::Type) override
    {
        // Auto-unregister all listeners
        for (auto& Handle : ListenerHandles) Handle.Unregister();
        ListenerHandles.Empty();
    }
};
```

### Chain Processor (Multi-Kill Detection)
```cpp
// State: TMap<APlayerState*, FChainInfo{LastKillTime, ChainCount}>
// Config: float ChainTimeLimit = 4.5f;
//         TMap<int32, FGameplayTag> ElimChainTags; // {2→DoubleKill, 3→TripleKill}

void OnEliminationMessage(FGameplayTag Channel, const FVerbMessage& Msg)
{
    FChainInfo& Info = PlayerChainHistory.FindOrAdd(Msg.Instigator);
    if (GetServerTime() - Info.LastKillTime < ChainTimeLimit)
        Info.ChainCount++;
    else
        Info.ChainCount = 1;
    Info.LastKillTime = GetServerTime();

    if (FGameplayTag* ChainTag = ElimChainTags.Find(Info.ChainCount))
    {
        FVerbMessage ChainMsg;
        ChainMsg.Verb = *ChainTag;
        ChainMsg.Instigator = Msg.Instigator;
        ChainMsg.Magnitude = Info.ChainCount;
        BroadcastMessage(ChainMsg);
    }
}
```

### Streak Processor (Kill Streak)
```cpp
// State: TMap<APlayerState*, int32> PlayerStreakHistory;
// Config: TMap<int32, FGameplayTag> ElimStreakTags; // {5→Streak5, 10→Streak10}

void OnEliminationMessage(FGameplayTag Channel, const FVerbMessage& Msg)
{
    // Increment killer's streak
    int32& StreakCount = PlayerStreakHistory.FindOrAdd(Msg.Instigator);
    StreakCount++;
    if (FGameplayTag* StreakTag = ElimStreakTags.Find(StreakCount))
        BroadcastStreakMessage(*StreakTag, Msg.Instigator, StreakCount);

    // Reset victim's streak
    PlayerStreakHistory.Remove(Msg.Target);
}
```

### Assist Processor (Damage Tracking)
```cpp
// State: TMap<APlayerState*, TMap<APlayerState*, float>> DamageHistory; // Victim→{Damager→AccumDamage}

void OnDamageMessage(...) { DamageHistory[Victim][Attacker] += Damage; }

void OnEliminationMessage(...)
{
    auto* VictimDamage = DamageHistory.Find(Victim);
    if (VictimDamage)
    {
        for (auto& [Damager, AccumDamage] : *VictimDamage)
        {
            if (Damager != Killer)  // Killer already got credit
                BroadcastAssistMessage(Damager, AccumDamage);
        }
        DamageHistory.Remove(Victim);
    }
}
```

---

## 7. Ranged Weapon Ability (Targeting Pattern)

```cpp
class UGA_RangedWeapon : public UGA_FromEquipment
{
    // Client-side targeting
    void PerformLocalTargeting(TArray<FHitResult>& OutHits)
    {
        for (int32 i = 0; i < BulletsPerCartridge; ++i)
        {
            // Spread via VRandConeNormalDistribution (clustered center)
            FVector Direction = VRandConeNormalDistribution(
                AimDirection, SpreadAngle, SpreadExponent);
            DoSingleBulletTrace(Direction, OutHits);
        }
    }

    void DoSingleBulletTrace(FVector Direction, TArray<FHitResult>& OutHits)
    {
        // 1. Line trace from camera through crosshair
        // 2. If miss → sweep trace with bullet radius (forgiveness)
        // 3. Filter: ignore self, allies (per team rules), already-hit actors
        // 4. Create FGameplayAbilityTargetData_SingleTargetHit per hit
    }

    // Server validates target data, applies effects
    void OnTargetDataReady(const FGameplayAbilityTargetDataHandle& Data)
    {
        for each hit in Data:
            Apply damage GE with hit result in EffectContext
    }
};
```
