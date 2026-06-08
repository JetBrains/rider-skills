# UE5 Replication Patterns

## Custom Replication Graph

### Node Types
| Node | Purpose |
|------|---------|
| `GridSpatialization2D` | Spatial grid for distance-based relevancy |
| `ActorList` (AlwaysRelevant) | Globally relevant actors |
| `AlwaysRelevant_ForConnection` | Per-connection (PlayerState, controllers) |
| `PlayerStateFrequencyLimiter` | Rate-limits PlayerState replication |

### Actor Routing (EClassRepNodeMapping)
- `Spatialize_Static` — static grid actors
- `Spatialize_Dynamic` — dynamic grid actors (updates position)
- `Spatialize_Dormancy` — grid with dormancy support
- `NotSpatial_RelevantAllConnections` — always relevant to all
- `NotSpatial_AlwaysRelevantForConnection` — per-connection relevant

### Streaming Level Support
Per-connection tracking of visible streaming levels with actor lists per level.

## FFastArraySerializer Pattern

Bandwidth-efficient replicated collections for equipment, inventory, tag stacks:
```cpp
USTRUCT()
struct FMyList : public FFastArraySerializer {
    void PreReplicatedRemove(const TArrayView<int32>, int32);
    void PostReplicatedAdd(const TArrayView<int32>, int32);
    void PostReplicatedChange(const TArrayView<int32>, int32);
    bool NetDeltaSerialize(FNetDeltaSerializeInfo& DeltaParms);
    UPROPERTY()
    TArray<FMyEntry> Entries;
    UPROPERTY(NotReplicated)
    TObjectPtr<UActorComponent> OwnerComponent;  // Authority-only
};
```

## Subobject Replication

Components managing replicated UObject instances must override:
```cpp
virtual bool ReplicateSubobjects(UActorChannel*, FOutBunch*, FReplicationFlags*) override;
virtual void ReadyForReplication() override;
```

## Custom GameplayEffectContext Serialization

Extend for project-specific replicated data:
```cpp
struct FMyGEContext : public FGameplayEffectContext {
    int32 CartridgeID = -1;  // Replicated
    TWeakObjectPtr<const UObject> Source;  // NOT replicated
    virtual bool NetSerialize(FArchive& Ar, UPackageMap*, bool&) override;
};
template<> struct TStructOpsTypeTraits<FMyGEContext> {
    enum { WithNetSerializer = true, WithCopy = true };
};
```

## Significance Manager

`USignificanceManager` for actor significance-based optimization:
- Tick rate reduction
- Animation quality
- Effect quality
- Replication priority

## Movement Compression

Custom compressed movement structs for bandwidth:
- `FSharedRepMovement` — compressed position/rotation
- Custom acceleration structs with quantized values
- Multicast RPCs for fast shared movement updates
