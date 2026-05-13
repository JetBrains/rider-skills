# Replication Fundamentals

## Actor Replication Setup

### Constructor Requirements
```cpp
AMyReplicatedActor::AMyReplicatedActor()
{
    // REQUIRED for any replication to work
    bReplicates = true;

    // Movement replication (actors that move)
    bReplicateMovement = true;

    // Update frequency (Hz) — lower = less bandwidth
    NetUpdateFrequency = 30.f;  // 30 times/sec (default: 100)
    MinNetUpdateFrequency = 5.f; // Minimum when adaptive

    // Relevancy
    bAlwaysRelevant = false;     // true for game-wide actors (GameState, etc.)
    bOnlyRelevantToOwner = false; // true for inventory, ability systems

    // Net priority (higher = replicated sooner when bandwidth-constrained)
    NetPriority = 1.0f;          // Default
    // PlayerControllers default to 3.0, Pawns to 2.0
}
```

### Property Replication Registration

**Header:**
```cpp
UCLASS()
class MYGAME_API AMyActor : public AActor
{
    GENERATED_BODY()

    // Simple replication
    UPROPERTY(Replicated)
    float Health;

    // With notification callback
    UPROPERTY(ReplicatedUsing = OnRep_Health)
    float Health;

    UFUNCTION()
    void OnRep_Health();

    // Array replication (use FFastArraySerializer for large arrays)
    UPROPERTY(Replicated)
    TArray<FMyStruct> Inventory;
};
```

**Source — REQUIRED registration:**
```cpp
#include "Net/UnrealNetwork.h"

void AMyActor::GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const
{
    Super::GetLifetimeReplicatedProps(OutLifetimeProps);

    // Basic — replicate to everyone
    DOREPLIFETIME(AMyActor, Health);

    // With condition — bandwidth optimization
    DOREPLIFETIME_CONDITION(AMyActor, Health, COND_OwnerOnly);
    DOREPLIFETIME_CONDITION(AMyActor, TeamId, COND_InitialOnly);
    DOREPLIFETIME_CONDITION(AMyActor, ThirdPersonMesh, COND_SkipOwner);
}
```

### Replication Conditions

| Condition | When Sent | Use Case |
|-----------|-----------|----------|
| `COND_None` | Always (default) | General state |
| `COND_InitialOnly` | First replication only | Team, class, skin |
| `COND_OwnerOnly` | Only to owner | Ammo count, ability cooldowns |
| `COND_SkipOwner` | Everyone except owner | Third-person animations |
| `COND_SimulatedOnly` | Simulated proxies | Movement smoothing data |
| `COND_AutonomousOnly` | Autonomous proxy only | Input acknowledgment |
| `COND_SimulatedOrPhysics` | Simulated or physics | Physics state |
| `COND_InitialOrOwner` | Initial to all, then owner only | Rare |
| `COND_Custom` | You decide in PreReplication | Full control |
| `COND_ReplayOrOwner` | Replay or owner | Demo recording |
| `COND_ReplayOnly` | Replay only | Demo recording |
| `COND_SkipReplay` | Never in replay | Debug state |
| `COND_Dynamic` | Runtime-changeable | DOREPLIFETIME_CONDITION_DYNAMIC |
| `COND_Never` | Never replicated | Override parent |

### OnRep Pattern
```cpp
void AMyActor::OnRep_Health()
{
    // Called on CLIENTS when Health changes
    // Server NEVER gets this call — it must handle changes directly

    HandleHealthChanged();
}

void AMyActor::SetHealth(float NewHealth)
{
    // Called on SERVER
    if (HasAuthority())
    {
        Health = NewHealth;  // Will replicate to clients, triggering OnRep
        HandleHealthChanged(); // Server must call manually
    }
}

void AMyActor::HandleHealthChanged()
{
    // Shared logic: update health bar, play effects, check death
    UpdateHealthBar();
    if (Health <= 0.f) { Die(); }
}
```

## Component Replication

```cpp
UMyComponent::UMyComponent()
{
    // Enable replication for this component
    SetIsReplicatedByDefault(true);
}

void UMyComponent::GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const
{
    Super::GetLifetimeReplicatedProps(OutLifetimeProps);
    DOREPLIFETIME(UMyComponent, MyProperty);
}
```

## Subobject Replication (Dynamically Created Components)

```cpp
// In the owning actor:
bool AMyActor::ReplicateSubobjects(UActorChannel* Channel, FOutBunch* Bunch, FReplicationFlags* RepFlags)
{
    bool bWroteSomething = Super::ReplicateSubobjects(Channel, Bunch, RepFlags);

    if (MyDynamicComponent)
    {
        bWroteSomething |= Channel->ReplicateSubobject(MyDynamicComponent, *Bunch, *RepFlags);
    }

    return bWroteSomething;
}
```

## Struct Replication

For structs with many fields, implement `NetSerialize` for custom serialization:
```cpp
USTRUCT()
struct FMyNetData
{
    GENERATED_BODY()

    UPROPERTY()
    FVector Location;

    UPROPERTY()
    uint8 Health; // Use smallest type that fits

    bool NetSerialize(FArchive& Ar, UPackageMap* Map, bool& bOutSuccess);
};
```

## Fast Array Serialization

For large replicated arrays (inventory, status effects):
```cpp
USTRUCT()
struct FMyArrayItem : public FFastArraySerializerItem
{
    GENERATED_BODY()

    UPROPERTY()
    int32 ItemId;

    UPROPERTY()
    int32 Count;

    void PreReplicatedRemove(const FMyArrayContainer& ArraySerializer);
    void PostReplicatedAdd(const FMyArrayContainer& ArraySerializer);
    void PostReplicatedChange(const FMyArrayContainer& ArraySerializer);
};

USTRUCT()
struct FMyArrayContainer : public FFastArraySerializer
{
    GENERATED_BODY()

    UPROPERTY()
    TArray<FMyArrayItem> Items;

    bool NetDeltaSerialize(FNetDeltaSerializeInfo& DeltaParms)
    {
        return FFastArraySerializer::FastArrayDeltaSerialize<FMyArrayItem, FMyArrayContainer>(Items, DeltaParms, *this);
    }
};
```

## Net Roles

| Role | Where | Description |
|------|-------|-------------|
| `ROLE_Authority` | Server | Has the truth; modifies state |
| `ROLE_AutonomousProxy` | Owning client | Player's own pawn; runs prediction |
| `ROLE_SimulatedProxy` | Other clients | Other players' pawns; interpolated |
| `ROLE_None` | N/A | Not replicated |

```cpp
// Check role
if (GetLocalRole() == ROLE_Authority) { /* server logic */ }
if (IsLocallyControlled()) { /* owning client or server for AI */ }
if (HasAuthority()) { /* server — most common check */ }
```
