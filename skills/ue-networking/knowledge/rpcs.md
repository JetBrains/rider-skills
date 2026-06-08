# RPC Patterns & Validation

## RPC Types

### Server RPC (Client → Server)
```cpp
// Declaration
UFUNCTION(Server, Reliable, WithValidation)
void ServerFireWeapon(FVector_NetQuantize AimLocation, uint8 AmmoSlot);

// Implementation
void AMyCharacter::ServerFireWeapon_Implementation(FVector_NetQuantize AimLocation, uint8 AmmoSlot)
{
    // Runs on SERVER only
    // Validate inputs even with WithValidation for defense in depth
    if (!CanFire()) return;

    ExecuteFire(AimLocation, AmmoSlot);
}

// Validation (returning false disconnects the client!)
bool AMyCharacter::ServerFireWeapon_Validate(FVector_NetQuantize AimLocation, uint8 AmmoSlot)
{
    // Only return false for definitely-cheating scenarios
    if (AmmoSlot >= MAX_AMMO_SLOTS) return false;
    return true;
}
```

### Client RPC (Server → Owning Client)
```cpp
UFUNCTION(Client, Reliable)
void ClientShowDamageNumber(float Damage, FVector WorldLocation);

void AMyCharacter::ClientShowDamageNumber_Implementation(float Damage, FVector WorldLocation)
{
    // Runs on OWNING CLIENT only
    // Safe for UI updates, camera effects, etc.
    SpawnDamageWidget(Damage, WorldLocation);
}
```

### NetMulticast RPC (Server → All Clients)
```cpp
UFUNCTION(NetMulticast, Unreliable)
void MulticastPlayHitEffect(FVector HitLocation, FVector HitNormal);

void AMyCharacter::MulticastPlayHitEffect_Implementation(FVector HitLocation, FVector HitNormal)
{
    // Runs on SERVER + ALL RELEVANT CLIENTS
    // Use for cosmetic effects only — not guaranteed delivery
    SpawnHitParticle(HitLocation, HitNormal);
    PlayHitSound(HitLocation);
}
```

## RPC Decision Matrix

| Scenario | RPC Type | Reliability |
|----------|----------|-------------|
| Player action (fire, interact, use ability) | Server, WithValidation | Reliable |
| Movement input | Property replication (NOT RPC) | N/A |
| UI notification (damage number, level up) | Client | Reliable |
| Screen shake, camera effect | Client | Unreliable |
| Explosion VFX, hit particles | NetMulticast | Unreliable |
| Chat message | Server → broadcast | Reliable |
| Death event | Server → Client or replicated property | Reliable |
| Continuous position update | Replicated property | N/A |
| Frequent cosmetic (footstep sounds) | NetMulticast | Unreliable |

## Validation Patterns

### Parameter Validation
```cpp
bool AMyCharacter::ServerUseItem_Validate(int32 ItemIndex)
{
    // Reject impossible values immediately
    if (ItemIndex < 0 || ItemIndex >= InventorySize) return false;
    return true;
}

void AMyCharacter::ServerUseItem_Implementation(int32 ItemIndex)
{
    // Additional game-logic validation (don't disconnect for these)
    if (!HasItem(ItemIndex)) return; // Item might have been consumed
    if (!CanUseItem(ItemIndex)) return; // Cooldown, stunned, etc.

    ExecuteUseItem(ItemIndex);
}
```

### Rate Limiting
```cpp
void AMyCharacter::ServerFireWeapon_Implementation(FVector AimLoc, uint8 Slot)
{
    // Prevent fire-rate hacking
    float CurrentTime = GetWorld()->GetTimeSeconds();
    float TimeSinceLastFire = CurrentTime - LastFireTime;

    if (TimeSinceLastFire < MinFireInterval * 0.9f) // 10% tolerance for latency
    {
        UE_LOG(LogNet, Warning, TEXT("Fire rate exceeded for %s"), *GetName());
        return;
    }

    LastFireTime = CurrentTime;
    // ... fire logic
}
```

### Position Validation
```cpp
void AMyCharacter::ServerInteract_Implementation(AActor* Target)
{
    if (!Target) return;

    // Verify client isn't claiming to interact with something far away
    float Distance = FVector::Dist(GetActorLocation(), Target->GetActorLocation());
    if (Distance > MaxInteractDistance * 1.5f) // Buffer for latency
    {
        UE_LOG(LogNet, Warning, TEXT("Interaction too far: %.1f > %.1f"),
            Distance, MaxInteractDistance);
        return;
    }

    // ... interact logic
}
```

## RPC Sizing Rules

- **Keep RPC parameters small** — each call creates a network packet
- Use `FVector_NetQuantize` instead of `FVector` (quantized, smaller)
- Use `uint8` instead of `int32` when range allows
- Pass indices/IDs instead of full objects
- **NEVER** pass `TArray` in a frequently-called RPC

## Bandwidth-Friendly Patterns

### Batch RPCs
```cpp
// WRONG: Individual RPCs per item
for (auto& Item : ChangedItems)
    ServerUpdateItem(Item); // N packets!

// CORRECT: Single batched RPC
ServerBatchUpdateItems(ChangedItems); // 1 packet
```

### Property Replication Over RPCs
```cpp
// WRONG: RPC every tick for position
// void Tick() { ServerSendPosition(GetActorLocation()); }

// CORRECT: Let the engine replicate movement
// bReplicateMovement = true;  // Set in constructor
```

## Common RPC Mistakes

1. **Calling Server RPC on server** — wastes a local function call but works; avoid
2. **Calling Client RPC on client** — does nothing; must be called from server
3. **NetMulticast from client** — ignored; must be called from server (or server-executed code path)
4. **Reliable Multicast every frame** — saturates reliable buffer → client disconnect
5. **Not checking authority before Server RPC** — Server RPCs already only execute on server, but the call still generates network traffic from client
