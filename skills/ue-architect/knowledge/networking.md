# Networking & Replication Architecture

## Core Principles

### Server Authority
The server maintains authority over gameplay logic. Clients maintain a "close approximation." Always validate Server RPC data received from clients — implement "trust and verify" patterns.

### Replicate State, Not Events
- **Replicated properties**: For stateful data clients need continuously (health, position, inventory)
- **RPCs**: For transient or cosmetic events (sound effect, particle spawn, UI notification)
- Property replication is guaranteed reliable eventually, but not every frame

### Minimize Replication Surface
- `SetReplicates(false)` is the biggest performance win
- Don't replicate what can be derived from existing replicated state
- The less an actor updates, the less server time spent on it

---

## Dedicated vs Listen Server

| Factor | Dedicated Server | Listen Server |
|--------|-----------------|---------------|
| Fairness | Equal latency for all | Host has zero-latency advantage |
| Persistence | Always available | Dies when host leaves |
| Resources | Headless, no rendering | Shares CPU with host's client |
| Cost | Infrastructure required | Free, player-hosted |
| Scale | MMOs, competitive, 50+ players | Co-op, casual, small groups |
| Complexity | Higher setup/maintenance | Lower barrier to entry |

---

## Replication Graph (Production Pattern)

### Purpose
Replaces the naive approach where each actor evaluates every client individually. Instead, persistent graph nodes build actor replication lists on demand per client, sharing data across frames.

### Lyra's Node Architecture

| Node Type | Purpose |
|-----------|---------|
| GridSpatialization2D | 2D spatial culling (10km cells, configurable) |
| AlwaysRelevantNode | Globally relevant actors (GameState, GameMode proxy) |
| AlwaysRelevant_ForConnection | Per-connection relevant actors (own PlayerState, Controller) |
| PlayerStateFrequencyLimiter | Spread PlayerState updates across frames (2 per frame) |
| ActorListFrequencyBuckets | Frequency-bucketed dynamic actor replication |

### Actor Categorization
```cpp
enum EClassRepNodeMapping {
    NotRouted,                    // Special-case (PlayerState limiter)
    RelevantAllConnections,       // Always relevant to everyone
    Spatialize_Static,            // Non-moving grid actors
    Spatialize_Dynamic,           // Frequently-moving grid actors
    Spatialize_Dormancy,          // Dormant → static; active → dynamic
};
```

### Configuration CVars
- `Lyra.RepGraph.CellSize`: Grid cell size (default 10000 cm = 100m)
- `Lyra.RepGraph.SpatialBiasX/Y`: Grid origin offset
- `Lyra.RepGraph.DynamicActorFrequencyBuckets`: Bucketing config (3 buckets default)
- `Lyra.RepGraph.DestructionInfoMaxDist`: Max distance for destruction replication (30km)

---

## Movement Replication Optimization

### FLyraReplicatedAcceleration (3 bytes total)
```cpp
uint8 AccelXYRadians;     // XY direction quantized to [0, 2π]
uint8 AccelXYMagnitude;   // XY magnitude quantized to [0, MaxAccel]
int8 AccelZ;              // Z quantized to [-MaxAccel, MaxAccel]
```

### FSharedRepMovement
```cpp
FRepMovement RepMovement;  // Standard quantized movement
float RepTimeStamp;
uint8 RepMovementMode;
bool bProxyIsJumpForceApplied;
bool bIsCrouched;
```

### FastSharedReplication Multicast RPC
- Bandwidth-limited independent of NetDriver (default 10 KB/s)
- Distance culling: `FastSharedPathCullDistPct` (80% of cull distance)
- Only sent when default property replication is skipped (complementary, not duplicate)

---

## Key Replication Patterns

### Push Model Replication
Standard replication compares every replicated variable every frame. Push Model explicitly marks dirty:
```cpp
MARK_PROPERTY_DIRTY_FROM_NAME(MyClass, MyProperty, this);
```
- 2x+ improvement in `NetBroadcastTickTime` (167ms → 76ms in tests)
- Mix with standard replication on same object
- Use for properties that change infrequently

### FastArraySerializer
For dynamic arrays — only transmits changes (adds, removes, modifications):
```cpp
struct FMyEntry : public FFastArraySerializerItem { ... };
struct FMyList : public FFastArraySerializer {
    void PreReplicatedRemove(const TArrayView<int32>& RemovedIndices, int32 FinalSize);
    void PostReplicatedAdd(const TArrayView<int32>& AddedIndices, int32 FinalSize);
    void PostReplicatedChange(const TArrayView<int32>& ChangedIndices, int32 FinalSize);
};
```
- For ~10K items: CPU from 3ms → 0.05ms when array changed
- Used in Lyra for: Equipment, Inventory, Character Parts, Tag Stacks
- Must manually mark dirty; list order not guaranteed between client/server

### Network Managers
Centralize replication for multiple similar actors:
- Disable replication on individual actors
- Manager tracks them in FFastArraySerializer list
- Manager forwards diffs
- Best for pure data replication; keep RPCs on original actors

### Atomic Replication
Pack interdependent properties in structs with custom `NetSerialize`:
```cpp
bool FMyStruct::NetSerialize(FArchive& Ar, UPackageMap* Map, bool& bOutSuccess) { ... }
```
- Prevents intermediate invalid states from partial property updates
- Essential when properties must update together (position + rotation, health + shield)

---

## RPC Best Practices

### Reliable vs. Unreliable
| Type | Use For | Warning |
|------|---------|---------|
| Reliable | Critical gameplay, non-tick events | NEVER on Tick — overflows buffer, disconnects players |
| Unreliable | Per-tick cosmetic, frequent updates | May be lost, acceptable for visual-only |

### Naming Convention
```cpp
UFUNCTION(Server, Reliable) void ServerRequestFire();
UFUNCTION(Client, Unreliable) void ClientPlayHitEffect();
UFUNCTION(NetMulticast, Unreliable) void MulticastPlayExplosion();
```

### Execution Path Filtering
- `HasAuthority()`: Check server control (after PreInitializeComponents)
- `IsLocallyControlled()`: Client-specific UI/effects (avoid during spawning)
- `GetNetMode()` / `IsNetMode()`: Early lifecycle before roles initialize

---

## Common Anti-Patterns

- **`GetPlayerController(0)`**: Returns different results on server vs. client — use ownership queries
- **Reliable RPCs on Tick**: Buffer overflow → disconnect
- **RPCs during BeginPlay**: Actors lack NetConnection during early init — use Possessed/PostNetReceive
- **Delay nodes for replication timing**: Use OnRep callbacks instead
- **Multicast RPCs from clients**: Execute locally only
- **Replicating SkeletalMeshComponent directly**: Replicate state/flag with OnRep callback
- **Assuming replication order across actors**: Use atomic structs for interdependent data
- **Not using conditional replication**: `DOREPLIFETIME_CONDITION` prevents unnecessary updates
- **FNames as RPC parameters**: Send full string each call; use FGameplayTag or index instead

---

## Lyra Network Optimization Summary

| Technique | Benefit |
|-----------|---------|
| Spatial Culling (10km grid) | Reduce actor list per connection |
| Fast Shared Replication (10 KB/s) | Independent bandwidth for movement |
| Acceleration Compression (3 bytes) | Efficient input replication |
| Frequency Bucketing | Spread updates across frames |
| PlayerState Limiting (2/frame) | Reduce updates for large player counts |
| Connection-Specific Nodes | Owner/team-relevant actors only |
| Streaming Level Integration | Load/unload actors per visible level |
| RPC Channel Control | Prevent unwanted channel opens |
