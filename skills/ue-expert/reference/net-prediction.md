# Client-Side Prediction & Reconciliation

## Core Concept

Client-side prediction allows responsive gameplay despite network latency:
1. **Client** executes action immediately (prediction)
2. **Client** sends input to server via RPC
3. **Server** executes the action authoritatively
4. **Server** replicates result back to client
5. **Client** reconciles: if server result matches prediction, smooth; if not, correct

## CharacterMovementComponent Prediction

UE's `CharacterMovementComponent` (CMC) handles movement prediction automatically:

```cpp
// Constructor — enable prediction
AMyCharacter::AMyCharacter()
{
    bReplicates = true;
    bReplicateMovement = true;

    UCharacterMovementComponent* CMC = GetCharacterMovement();
    CMC->SetIsReplicated(true);
    // CMC handles client prediction, server validation, and correction internally
}
```

### Custom Movement Modes
```cpp
// When adding custom movement (flying, swimming, grapple):
// 1. Define the mode
UENUM(BlueprintType)
enum class ECustomMovement : uint8
{
    Grapple = 0,
    WallRun = 1,
};

// 2. Override in CMC subclass
void UMyMovementComponent::PhysCustom(float DeltaTime, int32 Iterations)
{
    // This runs on BOTH client (prediction) and server (authority)
    // Must be deterministic for prediction to work
    switch (CustomMovementMode)
    {
        case (uint8)ECustomMovement::Grapple:
            PhysGrapple(DeltaTime, Iterations);
            break;
    }
}

// 3. Saved move data for reconciliation
class FMyNetworkMoveData : public FCharacterNetworkMoveData
{
    // Custom data that client sends to server with each move
    bool bWantsToGrapple;
    FVector GrappleTarget;
};
```

## Ability Prediction (GAS)

GAS has built-in prediction via `FPredictionKey`:

```cpp
// Ability activation — client predicts, server confirms/rejects
UGameplayAbility::ActivateAbility()
{
    // Runs locally on client with a prediction key
    // If server rejects, the ability is rolled back

    // Apply predicted effect
    FGameplayEffectSpecHandle Spec = MakeOutgoingGameplayEffectSpec(DamageEffect);
    ApplyGameplayEffectSpecToTarget(Spec, Target);
    // If server rejects: effect is automatically removed on client
}
```

## Custom Prediction Pattern

For game systems outside CMC and GAS:

```cpp
// Step 1: Client predicts locally
void AMyActor::PredictAction()
{
    if (!IsLocallyControlled()) return;

    // Apply predicted state
    PredictedHealth -= PredictedDamage;
    PlayPredictedEffect();

    // Send to server
    ServerConfirmAction(ActionData);

    // Store prediction for reconciliation
    PendingPredictions.Add(FPredictionEntry{ActionId, PredictedHealth});
}

// Step 2: Server validates and applies
void AMyActor::ServerConfirmAction_Implementation(FActionData Data)
{
    // Server validates
    if (!ValidateAction(Data))
    {
        ClientRejectPrediction(Data.ActionId);
        return;
    }

    // Apply authoritatively
    Health -= CalculateDamage(Data);
    // Health replicates to client via DOREPLIFETIME
}

// Step 3: Client reconciles on replication
void AMyActor::OnRep_Health()
{
    // Compare with prediction
    // If different, snap to server value (possibly with smoothing)
    if (FMath::Abs(Health - PredictedHealth) > CorrectionThreshold)
    {
        // Server disagrees — correct
        PredictedHealth = Health;
        // Optionally re-simulate pending predictions on top of corrected state
    }

    // Clean up confirmed predictions
    PendingPredictions.RemoveAll([](const auto& P) { return P.bConfirmed; });
}
```

## Smoothing & Interpolation

### SimulatedProxy Smoothing
```cpp
// For other players' characters — UE handles this in CMC:
// FRepMovement → SmoothClientPosition()
// Configurable via:
CMC->NetworkSmoothingMode = ENetworkSmoothingMode::Exponential; // or Linear, Disabled
CMC->NetworkMaxSmoothUpdateDistance = 256.f; // Snap if too far
CMC->NetworkNoSmoothUpdateDistance = 384.f;  // Hard snap threshold
```

### Custom Interpolation
```cpp
void AMyActor::Tick(float DeltaTime)
{
    if (GetLocalRole() == ROLE_SimulatedProxy)
    {
        // Interpolate between received server states
        FVector TargetLocation = ReplicatedLocation; // From server
        FVector CurrentLocation = GetActorLocation();

        float InterpSpeed = 10.f;
        FVector SmoothedLocation = FMath::VInterpTo(
            CurrentLocation, TargetLocation, DeltaTime, InterpSpeed);
        SetActorLocation(SmoothedLocation);
    }
}
```

## Prediction Gotchas

1. **Non-deterministic code** — `FMath::RandRange()` in predicted code gives different results on client vs server → always mismatch
2. **Frame-rate dependent** — if prediction logic uses `DeltaTime` differently on client vs server, results diverge
3. **Order of operations** — client and server must process inputs in the same order
4. **Timestamp mismatch** — use `GetServerWorldTimeSeconds()` instead of `GetTimeSeconds()` for synchronized timing
5. **Pending predictions pile up** — if server is slow to confirm, client accumulates predictions → memory growth
6. **Visual jitter** — correcting predicted visuals too aggressively causes jitter; use smoothing
