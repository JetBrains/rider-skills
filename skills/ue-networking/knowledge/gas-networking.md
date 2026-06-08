# GAS-Specific Networking Patterns

Networking patterns specific to the Gameplay Ability System — attribute replication, ability prediction defaults, input replication, and effect context serialization.

---

## 1. ASC Replication Modes (When to Use Which)

| Mode | GEs Replicate To | Tags/Cues Replicate To | Use Case |
|------|-----------------|----------------------|----------|
| **Full** | All clients | All clients | Single player, simple prototypes |
| **Mixed** | Owning client only | All clients | **Multiplayer player-controlled** (recommended) |
| **Minimal** | Not replicated | All clients | Multiplayer AI characters |

**Mixed mode requirement**: `OwnerActor->GetOwner()` must be the Controller.
- PlayerState-based ASC: works automatically (PlayerState's Owner is Controller)
- Character-based ASC: must call `Character->SetOwner(Controller)` in `PossessedBy()`

---

## 2. Ability Default Network Policies

Production defaults for custom ability base class:

```cpp
UMyGameplayAbility::UMyGameplayAbility()
{
    ReplicationPolicy = EGameplayAbilityReplicationPolicy::ReplicateNo;  // Specs replicate, not instances
    InstancingPolicy = EGameplayAbilityInstancingPolicy::InstancedPerActor;
    NetExecutionPolicy = EGameplayAbilityNetExecutionPolicy::LocalPredicted;
    NetSecurityPolicy = EGameplayAbilityNetSecurityPolicy::ClientOrServer;
}
```

**Override NetExecutionPolicy per ability type:**

| Ability Type | NetExecutionPolicy | Why |
|-------------|-------------------|-----|
| Combat abilities | `LocalPredicted` | Responsive feel, server confirms |
| Death ability | `ServerInitiated` | Only server decides death |
| Reset/Respawn | `ServerInitiated` | Only server moves players |
| Passive/Aura | `ServerOnly` | No client interaction needed |
| UI-only (local feedback) | `LocalOnly` | No server involvement |

---

## 3. Input Replication (Modern Pattern)

**Do NOT use** `bReplicateInputDirectly` (deprecated, unreliable).

Instead use `InvokeReplicatedEvent`:

```cpp
void UMyASC::AbilitySpecInputPressed(FGameplayAbilitySpec& Spec)
{
    Super::AbilitySpecInputPressed(Spec);

    if (Spec.IsActive())
    {
        // Get prediction key from active ability instance
        const UGameplayAbility* Instance = Spec.GetPrimaryInstance();
        FPredictionKey PredKey = Instance
            ? Instance->GetCurrentActivationInfo().GetActivationPredictionKey()
            : Spec.ActivationInfo.GetActivationPredictionKey();

        // Replicate input via event system (enables WaitInputPress/Release tasks)
        InvokeReplicatedEvent(
            EAbilityGenericReplicatedEvent::InputPressed,
            Spec.Handle, PredKey);
    }
}

void UMyASC::AbilitySpecInputReleased(FGameplayAbilitySpec& Spec)
{
    Super::AbilitySpecInputReleased(Spec);

    if (Spec.IsActive())
    {
        InvokeReplicatedEvent(
            EAbilityGenericReplicatedEvent::InputReleased,
            Spec.Handle, Spec.ActivationInfo.GetActivationPredictionKey());
    }
}
```

This allows `UAbilityTask_WaitInputPress` and `UAbilityTask_WaitInputRelease` to work correctly in multiplayer.

---

## 4. Attribute Replication Conditions

### Decision Table

| Attribute Type | COND | REPNOTIFY | Rationale |
|---------------|------|-----------|-----------|
| Health, MaxHealth | `COND_None` | `REPNOTIFY_Always` | Everyone needs health bars |
| BaseDamage, BaseHeal | `COND_OwnerOnly` | `REPNOTIFY_Always` | Only owner needs combat stats |
| Movement speed | `COND_None` | `REPNOTIFY_Always` | All clients predict movement |
| Damage (meta) | **Not replicated** | — | Server-only intermediate value |
| Healing (meta) | **Not replicated** | — | Server-only intermediate value |

### OnRep Pattern for Attributes

```cpp
void UMyHealthSet::OnRep_Health(const FGameplayAttributeData& OldValue)
{
    // Engine bookkeeping macro (required)
    GAMEPLAYATTRIBUTE_REPNOTIFY(UMyHealthSet, Health, OldValue);

    // Client-side estimation (no EffectContext available on client)
    float EstimatedMagnitude = GetHealth() - OldValue.GetCurrentValue();

    // Broadcast for UI — clients only get estimated values
    OnHealthChanged.Broadcast(nullptr, nullptr, nullptr,
        EstimatedMagnitude, OldValue.GetCurrentValue(), GetHealth());

    // Death detection on client (server handles via PostGameplayEffectExecute)
    if (!bOutOfHealth && GetHealth() <= 0.0f)
    {
        OnOutOfHealth.Broadcast(...);
        bOutOfHealth = true;
    }
}
```

---

## 5. Ability Failure Notification RPC

Server tells client why ability failed (for UI feedback):

```cpp
// Built-in engine RPC (Client, Unreliable)
void UAbilitySystemComponent::ClientNotifyAbilityFailed(
    const UGameplayAbility* Ability,
    const FGameplayTagContainer& FailureReason);
```

Custom handling:
```cpp
// In custom ASC
void UMyASC::NotifyAbilityFailed(const FGameplayAbilitySpecHandle Handle,
    UGameplayAbility* Ability, const FGameplayTagContainer& FailureTags)
{
    Super::NotifyAbilityFailed(Handle, Ability, FailureTags);

    // Map failure tags to user-facing messages
    if (const UMyAbility* MyAbility = Cast<UMyAbility>(Ability))
    {
        MyAbility->OnAbilityFailedToActivate(FailureTags);
        // Broadcasts via UGameplayMessageSubsystem for HUD display
    }
}
```

---

## 6. Custom GameplayEffectContext NetSerialize

```cpp
bool FMyEffectContext::NetSerialize(FArchive& Ar, UPackageMap* Map, bool& bOutSuccess)
{
    // ALWAYS call super first
    Super::NetSerialize(Ar, Map, bOutSuccess);

    // Only serialize what clients actually need
    // CartridgeID: cosmetic grouping → could skip for bandwidth
    // AbilitySourceObject: authority-only → SKIP

    // UE 5.6+ Iris support:
    // UE_NET_IMPLEMENT_FORWARDING_NETSERIALIZER_AND_REGISTRY_DELEGATES(FMyEffectContext)

    bOutSuccess = true;
    return true;
}
```

**Rule**: Don't serialize authority-only data. If clients don't need it, skip it.

---

## 7. GameplayCue Replication

### Via GameplayEffect (Automatic)
- Cues on duration/infinite GEs: `OnActive()` on apply, `OnRemove()` on end
- Cues on instant GEs: `OnExecute()` fires once
- All replicate through effect spec replication (no extra work)

### Via Direct Execution (NetMulticast)
```cpp
ASC->ExecuteGameplayCue(Tag, Params);  // Sends Multicast RPC (Unreliable)
```

### Local-Only (No Replication)
```cpp
// Skip replication for client-only cosmetics
UAbilitySystemGlobals::Get().GetGameplayCueManager()->HandleGameplayCue(
    Actor, Tag, EGameplayCueEvent::Executed, Params);
```

**Key rule**: Cues use **unreliable** RPCs. Never use them for gameplay logic.

---

## 8. FFastArraySerializer for GAS-Adjacent Systems

### Verb Message Replication
```cpp
USTRUCT()
struct FVerbMessageReplication : public FFastArraySerializer {
    UPROPERTY()
    TArray<FVerbMessageEntry> CurrentMessages;

    bool NetDeltaSerialize(FNetDeltaSerializeInfo& DeltaParms) {
        return FFastArraySerializer::FastArrayDeltaSerialize<
            FVerbMessageEntry, FVerbMessageReplication>(
            CurrentMessages, DeltaParms, *this);
    }
};
```

### GameplayTagStack Replication
```cpp
USTRUCT()
struct FGameplayTagStackContainer : public FFastArraySerializer {
    UPROPERTY()
    TArray<FGameplayTagStack> Stacks;  // Tag + Count pairs

    UPROPERTY(NotReplicated)
    TMap<FGameplayTag, int32> TagToCountMap;  // Local O(1) cache

    // Callbacks sync the cache
    void PostReplicatedAdd(const TArrayView<int32> AddedIndices, int32);
    void PostReplicatedChange(const TArrayView<int32> ChangedIndices, int32);
    void PreReplicatedRemove(const TArrayView<int32> RemovedIndices, int32);
};
```

### Equipment List Replication
```cpp
USTRUCT()
struct FEquipmentList : public FFastArraySerializer {
    UPROPERTY()
    TArray<FAppliedEquipmentEntry> Entries;

    // On add: Instance->OnEquipped()
    // On remove: GrantedHandles.TakeFromAbilitySystem(ASC), Instance->OnUnequipped()
};
```

---

## 9. Compressed Movement for GAS Characters

Quantize acceleration to 3 bytes (vs 12 bytes raw FVector):

```cpp
USTRUCT()
struct FCompressedAcceleration {
    uint8 AccelXYRadians = 0;      // [0, 2π] → [0, 255]
    uint8 AccelXYMagnitude = 0;    // [0, MaxAccel] → [0, 255]
    int8  AccelZ = 0;              // [-MaxAccel, MaxAccel] → [-128, 127]
};

// Replicate to simulated proxies only
DOREPLIFETIME_CONDITION(ThisClass, ReplicatedAcceleration, COND_SimulatedOnly);

// Encode in PreReplication (server)
void PreReplication(IRepChangedPropertyTracker&)
{
    double Mag, Rad;
    FMath::CartesianToPolar(Accel.X, Accel.Y, Mag, Rad);
    ReplicatedAcceleration.AccelXYRadians = FMath::FloorToInt((Rad / TWO_PI) * 255.0);
    ReplicatedAcceleration.AccelXYMagnitude = FMath::FloorToInt((Mag / MaxAccel) * 255.0);
    ReplicatedAcceleration.AccelZ = FMath::FloorToInt((Accel.Z / MaxAccel) * 127.0);
}
```

### FastSharedReplication Alternative
When standard replication skips a frame, use multicast for movement:
```cpp
UFUNCTION(NetMulticast, Unreliable)
void FastSharedReplication(const FSharedRepMovement& Data);
```

---

## 10. Replication Summary

| Data | Method | Condition | Notes |
|------|--------|-----------|-------|
| Ability specs | ASC automatic | — | Specs, not instances |
| GameplayEffects | ASC automatic (by mode) | Full/Mixed/Minimal | |
| Tags (owned) | ASC automatic | — | Replicate to all |
| GameplayCues | Via GE or NetMulticast | Unreliable | Cosmetic only |
| Health/MaxHealth | DOREPLIFETIME | `COND_None` | All clients |
| Combat stats | DOREPLIFETIME | `COND_OwnerOnly` | Owner only |
| Meta attributes | Not replicated | — | Server-only |
| Death state | DOREPLIFETIME + OnRep | — | State machine |
| Tag stacks | FFastArraySerializer | Delta | Bandwidth-efficient |
| Equipment | FFastArraySerializer | Delta | Grant/revoke abilities |
| Verb messages | FFastArraySerializer | Delta | Event replication |
| Movement accel | DOREPLIFETIME | `COND_SimulatedOnly` | 3 bytes compressed |
