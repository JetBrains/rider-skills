# Net Relevancy, Priority & Dormancy

## Net Relevancy

Controls whether an actor is replicated to a specific client. Irrelevant actors save bandwidth.

### Default Relevancy Rules

An actor is relevant to a client if ANY of these are true:
1. `bAlwaysRelevant == true`
2. Actor is owned by the client's PlayerController
3. Actor is the client's Pawn
4. Actor is the Instigator of something relevant
5. Actor is within `NetCullDistanceSquared` of the client's view point

### Configuration
```cpp
AMyActor::AMyActor()
{
    // Always relevant to all clients (game state, managers, etc.)
    bAlwaysRelevant = true;

    // Only relevant to owner (HUD, inventory, private data)
    bOnlyRelevantToOwner = true;

    // Distance-based relevancy (default)
    NetCullDistanceSquared = 225000000.f; // ~15000 units = ~150m

    // For large actors that should be visible from far away
    NetCullDistanceSquared = 900000000.f; // ~300m
}
```

### Custom Relevancy
```cpp
bool AMyActor::IsNetRelevantFor(const AActor* RealViewer, const AActor* ViewTarget,
    const FVector& SrcLocation) const
{
    // Custom relevancy logic
    if (bAlwaysRelevant) return true;

    // Relevant if same team
    if (IsSameTeam(ViewTarget)) return true;

    // Relevant if within range
    float DistSq = (GetActorLocation() - SrcLocation).SizeSquared();
    return DistSq < NetCullDistanceSquared;
}
```

## Net Priority

When bandwidth is constrained, higher-priority actors replicate first.

```cpp
AMyActor::AMyActor()
{
    // Default priorities:
    // AActor: 1.0
    // APawn: 2.0 (GetNetPriority() override)
    // APlayerController: 3.0

    NetPriority = 2.5f; // Higher = more important
}

// Dynamic priority based on game state
float AMyActor::GetNetPriority(const FVector& ViewPos, const FVector& ViewDir,
    AActor* Viewer, FActorPriority& ActorInfo, UActorChannel* InChannel)
{
    float BasePriority = Super::GetNetPriority(ViewPos, ViewDir, Viewer, ActorInfo, InChannel);

    // Boost priority when visible to viewer
    FVector ToActor = GetActorLocation() - ViewPos;
    ToActor.Normalize();
    float Dot = FVector::DotProduct(ViewDir, ToActor);
    if (Dot > 0.7f) // In front of viewer
        BasePriority *= 2.0f;

    // Boost priority when recently changed
    if (GetWorld()->GetTimeSeconds() - LastStateChangeTime < 1.0f)
        BasePriority *= 1.5f;

    return BasePriority;
}
```

## Net Dormancy

Dormancy pauses replication for actors whose state rarely changes (placed props, closed doors).

### Dormancy Levels
| Level | Behavior |
|-------|----------|
| `DORM_Never` | Never goes dormant (always check for replication) |
| `DORM_Awake` | Currently awake, may go dormant |
| `DORM_DormantAll` | Dormant for all connections |
| `DORM_DormantPartial` | Dormant for some connections |
| `DORM_Initial` | Initially dormant, wakes on first state change |

### Using Dormancy
```cpp
AMyDoor::AMyDoor()
{
    bReplicates = true;
    NetDormancy = DORM_DormantAll; // Start dormant
}

void AMyDoor::Open()
{
    if (HasAuthority())
    {
        bIsOpen = true;

        // Wake up to replicate the change
        FlushNetDormancy();
        ForceNetUpdate(); // Replicate NOW, don't wait for next cycle

        // Go back to dormant after change is sent
        // (happens automatically with DORM_DormantAll on next cycle)
    }
}
```

### Dormancy Best Practices
- Use `DORM_Initial` for placed actors that might change (doors, pickups)
- Use `DORM_DormantAll` for actors that are done changing (dead NPCs)
- Call `FlushNetDormancy()` + `ForceNetUpdate()` when state changes
- Dormant actors are NOT replicated to new clients until they wake up — use `DORM_DormantAll` carefully

## Net Update Frequency

```cpp
AMyActor::AMyActor()
{
    // How often the engine CHECKS for changes to replicate
    NetUpdateFrequency = 30.f;  // 30 Hz — good for most gameplay actors

    // Minimum frequency (adaptive throttling won't go below this)
    MinNetUpdateFrequency = 5.f; // 5 Hz minimum
}

// Force immediate update (bypass frequency throttle)
ForceNetUpdate();
```

### Recommended Frequencies
| Actor Type | Frequency | Rationale |
|-----------|-----------|-----------|
| Player character | 60-100 Hz | Responsive movement |
| AI character | 15-30 Hz | Less precision needed |
| Projectile | 30-60 Hz | Fast-moving |
| Door/pickup | 1-5 Hz | State changes rare |
| Game state | 5-10 Hz | Score, timer updates |
| Environment prop | 0 (dormant) | Never changes |

## Replication Graph (UE 5.x)

For large-scale multiplayer (50+ players), the default replication driver becomes a bottleneck.

```cpp
// Custom replication graph — spatial grid example
class UMyReplicationGraph : public UReplicationGraph
{
    // Spatial grid: only process actors near each connection
    UReplicationGraphNode_GridSpatialization2D* GridNode;

    // Always-relevant node for game state
    UReplicationGraphNode_AlwaysRelevant* AlwaysRelevantNode;

    // Per-connection nodes for player-specific actors
    UReplicationGraphNode_AlwaysRelevant_ForConnection* PerConnectionNodes;
};
```

This is an advanced optimization — only needed when profiling shows replication as a bottleneck.
