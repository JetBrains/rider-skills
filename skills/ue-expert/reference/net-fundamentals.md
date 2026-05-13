# Game Networking Fundamentals

Engine-specific patterns from *Algorithms and Networking for Computer Games* (Smed & Hakonen, 2006) mapped to Unreal Engine.

---

## Communication Layers → UE Mapping

| Layer | UE Equivalent |
|-------|---------------|
| Physical Platform | NetDriver, socket subsystem, platform networking |
| Logical Platform | Replication Graph, NetConnection, channels |
| Networked Application | GameMode, GameState, replication, RPCs |

---

## Data Architecture Patterns

### Server-Authoritative
- `UFUNCTION(Server, Reliable)` for client requests; server validates
- `HasAuthority()` guards server-only logic
- GameMode exists only on server — never replicated to clients

### Replicated State
- `UPROPERTY(Replicated)` + `DOREPLIFETIME` macros
- `OnRep_` callbacks handle client-side state arrival
- **Push Model**: `MARK_PROPERTY_DIRTY_FROM_NAME` for infrequently-changing properties
- **FastArraySerializer**: Delta replication for dynamic arrays (inventory, equipment)

### Distributed Ownership
- `IsLocallyControlled()` determines which node drives an actor
- Autonomous proxy vs simulated proxy distinction

**Key principle**: Indeterminism (player input) → distribution; determinism (AI, physics) → replication.

---

## Compensating Resource Limitations

### Information Principle (Singhal & Zyda)
`Resources = M x H x B x T x P` — M=messages, H=destinations, B=bandwidth/msg, T=timeliness, P=processing/msg. Reducing any factor saves resources but trades off quality.

### Dead Reckoning — UE Implementation
- `CharacterMovementComponent` uses client-side prediction + server reconciliation
- `FRepMovement` quantizes position/velocity for bandwidth savings
- Lyra's `FLyraReplicatedAcceleration`: **3 bytes total** (direction + magnitude + Z)
- Threshold-based: server only sends correction when prediction error exceeds tolerance

### Convergence
- **Snap**: Instant correction. Only for large discrepancies.
- **Linear**: `FMath::VInterpTo` over N frames.
- **Cubic/Hermite**: Smooth velocity transitions. Better for observed players.

### Area of Interest (AOI) Filtering
- **Replication Graph**: Spatial grid culling (`GridSpatialization2D`, default 10km cells in Lyra)
- **Net Relevancy**: `IsNetRelevantFor()` override per actor
- **Net Cull Distance**: `NetCullDistanceSquared` on actors
- **Dormancy**: `SetNetDormancy(DORM_DormantAll)` for inactive actors

### Packet Aggregation
- NetDriver bunches multiple actor updates per packet
- `NetUpdateFrequency` controls how often an actor is considered for replication
- `MinNetUpdateFrequency` sets minimum rate during low-priority periods
- Property conditions: `DOREPLIFETIME_CONDITION(Class, Prop, COND_SkipOwner)`

---

## Local Perception Filters

### Local Lag
- Not built-in; implement via input buffering in `PlayerController`
- Trade-off: worse responsiveness, better consistency

### Server-Side Rewind (Time Warp)
- Implement via `UWorld::GetTimeSeconds()` + stored transform history
- Lyra does NOT use server rewind — uses client-side hit detection with server validation
- For competitive FPS: store N frames of hitbox transforms, rewind on `ServerRPC_Fire`

---

## Consistency vs Responsiveness — UE Patterns

| Approach | UE Pattern |
|----------|------------|
| Client prediction + reconciliation | `CharacterMovementComponent` |
| Server authoritative, no prediction | Simple RPCs, no local prediction |
| Deterministic lockstep | Custom: `FFixedStepTicker`, same RNG seed, fixed timestep. Not native. |

---

## Scalability Techniques

### Interest Management
- **Grid-based**: `GridSpatialization2D` in Replication Graph
- **Aura-based**: `NetCullDistanceSquared`
- **Class-based**: `NetPriority` and frequency bucketing

### Temporal Decoupling
- `NetUpdateFrequency`: High for players (100Hz), low for static objects (1-2Hz)
- Lyra's `PlayerStateFrequencyLimiter`: Max 2 PlayerState updates per frame
- `ActorListFrequencyBuckets`: Spread dynamic actor updates across frames

---

## Common Gotchas

- **Floating-point determinism**: Different platforms yield different results. Never rely on FP equality across clients. Use quantized/fixed-point for critical state.
- **Authority during BeginPlay**: Actors may not have NetConnection yet. Defer network logic to `OnPossessed` or `PostNetReceive`.
- **Reliable RPC flooding**: Never call reliable RPCs on tick. Buffer overflows disconnect clients.
- **Replication order across actors**: Not guaranteed. Use atomic structs (`NetSerialize`) for interdependent data.
- **Listen server fairness**: Host has zero latency. Add artificial local lag or use dedicated servers for competitive play.

---

## References

- Smed, J. & Hakonen, H. (2006). *Algorithms and Networking for Computer Games*. Chapters 8-9.
- Singhal, S. & Zyda, M. (1999). *Networked Virtual Environments*.
- UE Docs: Networking Overview, Replication Graph, Character Movement Network.
