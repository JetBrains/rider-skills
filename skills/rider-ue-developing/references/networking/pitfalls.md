# Common Networking Pitfalls

## The Silent Killers (No Error, Wrong Behavior)

### 1. Missing GetLifetimeReplicatedProps Registration
**Symptom**: Property has `Replicated` specifier but value never updates on clients.
**Cause**: Forgot `DOREPLIFETIME` macro in `GetLifetimeReplicatedProps()`.
**Fix**: Always pair `UPROPERTY(Replicated)` with `DOREPLIFETIME()`.
```cpp
// EVERY replicated property needs this
void AMyActor::GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const
{
    Super::GetLifetimeReplicatedProps(OutLifetimeProps); // Don't forget Super!
    DOREPLIFETIME(AMyActor, MyProperty);
}
```

### 2. Modifying Replicated State on Client
**Symptom**: Changes work momentarily then revert, or work on one machine but not others.
**Cause**: Client directly changed a replicated property instead of requesting via Server RPC.
**Fix**: All state changes go through server:
```cpp
// WRONG
void AMyActor::TakeDamage_Client(float Dmg)
{
    Health -= Dmg; // Changed on client, will be overwritten by server
}

// CORRECT
void AMyActor::RequestDamage(float Dmg)
{
    if (HasAuthority())
        ApplyDamage(Dmg);  // On server, apply directly
    else
        ServerApplyDamage(Dmg);  // On client, ask server
}
```

### 3. Constructor Code Running on Wrong Side
**Symptom**: Spawned actor has different state on client vs server.
**Cause**: Constructor runs on both client and server, but with different contexts.
**Fix**: Don't put game logic in constructors. Use `BeginPlay()` with authority checks.

### 4. OnRep Not Firing on Server
**Symptom**: Game logic in OnRep works on clients but not server.
**Cause**: OnRep only fires on clients receiving replicated data.
**Fix**: Extract shared logic into a helper function. Call it from both the setter (server) and OnRep (client).

### 5. Timer/Tick Running on Wrong Side
**Symptom**: Duplicate effects, double damage, or effects only on one side.
**Cause**: Tick and timers run on all instances (server AND clients).
**Fix**: Guard with role checks:
```cpp
void AMyActor::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);

    if (HasAuthority())
    {
        // Server-only logic: AI, damage, spawning
        ServerTickLogic(DeltaTime);
    }

    if (IsLocallyControlled())
    {
        // Owning client: input, prediction, local UI
        LocalTickLogic(DeltaTime);
    }

    // Both sides: visual interpolation, cosmetic effects
    VisualTickLogic(DeltaTime);
}
```

## The Connection Killers (Disconnects & Crashes)

### 6. Reliable Buffer Overflow
**Symptom**: Client disconnects with "Reliable buffer overflow" in server log.
**Cause**: Sending too many Reliable RPCs (reliable queue fills up).
**Fix**:
- Never send Reliable RPCs every tick
- Use Unreliable for frequent/cosmetic RPCs
- Prefer property replication for continuous state
- Batch multiple small RPCs into one

### 7. Referencing Actors Across Connections
**Symptom**: "Stably named object not found" or nullptr crash.
**Cause**: Sending a pointer to an actor that doesn't exist on the client yet (not replicated, or relevancy cut it).
**Fix**: Use `FNetworkGUID` or replicated ID instead of raw pointers when the target actor might not be known to the client.

### 8. Spawning Actors on Client
**Symptom**: Actor exists on one client but not others, or duplicate actors after server creates it.
**Cause**: Client spawned an actor directly.
**Fix**: Only server should spawn replicated actors. Clients can spawn local-only cosmetic actors (particles, UI).

## The Bandwidth Killers (Lag & Rubber Banding)

### 9. Replicating Too Much Data
**Symptom**: Server bandwidth spikes, clients experience lag.
**Cause**: Large structs, arrays, or strings replicated frequently.
**Fix**:
- Use replication conditions (`COND_OwnerOnly`, etc.)
- Use `FFastArraySerializer` for arrays (delta compression)
- Quantize vectors: `FVector_NetQuantize`, `FVector_NetQuantize10`, `FVector_NetQuantize100`
- Use bitfields and smallest integer types
- Set appropriate `NetUpdateFrequency`

### 10. Not Using Net Dormancy
**Symptom**: Server CPU spikes with many placed actors.
**Cause**: Every replicated actor is checked for changes every tick.
**Fix**: Use `NetDormancy = DORM_Initial` for actors that change rarely. Call `FlushNetDormancy()` only when state changes.

### 11. Replicating Derived State
**Symptom**: Unnecessary bandwidth usage.
**Cause**: Replicating values that can be computed from other replicated values.
**Fix**: Only replicate source data. Derive on client:
```cpp
// WRONG: replicate both
UPROPERTY(Replicated) float Health;
UPROPERTY(Replicated) float HealthPercent; // Redundant!

// CORRECT: replicate Health, compute percent locally
UPROPERTY(Replicated) float Health;
float GetHealthPercent() const { return Health / MaxHealth; }
```

## The Timing Killers (Race Conditions)

### 12. Assuming Spawn Order
**Symptom**: NullPtr crash on client trying to access a component/actor that hasn't replicated yet.
**Cause**: Client code assumes another actor exists, but it hasn't replicated yet.
**Fix**: Use OnRep callbacks, `IsValid()` checks, or wait for the dependency to replicate.

### 13. BeginPlay Order Mismatch
**Symptom**: Initialization works on server, fails on client.
**Cause**: BeginPlay order differs between server (immediate) and client (after replication).
**Fix**: Don't depend on other actors in BeginPlay. Use `PostInitializeComponents()` for self-init, and event-driven patterns for cross-actor dependencies.

### 14. Seamless Travel Data Loss
**Symptom**: Player data lost during map transitions.
**Cause**: Actors are destroyed during level travel.
**Fix**: Use `GameInstance` for persistent data, or implement `APlayerController::GetSeamlessTravelActorList()` to persist specific actors.

## Debugging Checklist

When networking isn't working, check in this order:
1. `bReplicates = true` in constructor?
2. `GetLifetimeReplicatedProps` registered all properties?
3. `HasAuthority()` checked before state changes?
4. Owner chain intact? (Actor → Owner → Controller → Connection)
5. Component has `SetIsReplicatedByDefault(true)`?
6. RPC called from correct side? (Server RPC from client, Client RPC from server)
7. `Net/UnrealNetwork.h` included?
8. Check `LogNet` in output log for warnings

---

## Debugging workflows

Test in PIE per `replication-testing-pie.md` (drive actions through `simulate_input`, observe via role-aware `UE_LOG` over the shared `ue_get_logs` stream). Network-condition emulation (`net PktLag/PktLoss/...`), `stat net`/`stat nettraffic`, and `ShowDebug Net` / `net.DrawDebugReplicationInfo` / `net.ShowNetRole` live in `network-profiling.md`.

**Role-aware log (the cross-world channel):**
```cpp
UE_LOG(LogNet, Warning, TEXT("[%s] %s: Health=%.1f"),
    HasAuthority() ? TEXT("SERVER") : TEXT("CLIENT"), *GetName(), Health);
```

**"Property not replicating":** `bReplicates`? → `DOREPLIFETIME` present? → `#include "Net/UnrealNetwork.h"`? → condition filtering the target client? → actor relevant (distance/`bAlwaysRelevant`)? → dormant (call `FlushNetDormancy()`)? → log in OnRep to confirm server sends → `NetUpdateFrequency` too low / try `ForceNetUpdate()`.

**"RPC not firing":** called from correct side (Server←owning client, Client/Multicast←server)? → owner chain to a NetConnection intact? → `HasAuthority()`/`IsLocallyControlled()` at call site? → actor `bReplicates`? → Server RPC `_Validate` returning false? → log before and inside `_Implementation`.

**"Client desync":** log value on both sides each second → client modifying it directly? → non-deterministic prediction? → OnRep applying correctly? → race (client reads before replicate)?

**"Reliable buffer overflow" (disconnect):** grep for `Reliable` RPCs in Tick/timers → switch frequent ones to `Unreliable` / reduce frequency / batch → temporary: `net.MaxReliableBufferSize=512`.

**Verbose logs & error strings:** `Log LogNet|LogNetTraffic|LogRep|LogNetDormancy|LogNetSerialization Verbose`. Grep: `"No owning connection"` (ownership broken) · `"Stably named object"` (ref unresolved on client) · `"Reliable buffer overflow"` · `"NaN"` (movement corruption) · `"Server rejected"` (validation fail).

**Network replay** (reproduce intermittent bugs from any POV): `demorec MyReplay` / `demostop` / `demoplay MyReplay` → saved to `Saved/Demos/`.
