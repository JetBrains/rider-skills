# GAS Pitfalls — Hard-Won Debugging Knowledge

Each pitfall includes the symptom, root cause, and fix. These are the most common sources of GAS bugs.

---

## 1. Forgetting EndAbility()

**Symptom**: Ability activates once, then can never be activated again. `showdebug abilitysystem` shows the ability as "Active" permanently. Cooldowns never reset.

**Cause**: `ActivateAbility()` has a code path that doesn't call `EndAbility()`. Common when an AbilityTask callback is missing or when early-return logic skips cleanup.

**Fix**: Ensure EVERY code path calls `EndAbility()`:
```cpp
void UMyAbility::ActivateAbility(...)
{
    if (!CommitAbility(Handle, ActorInfo, ActivationInfo))
    {
        EndAbility(Handle, ActorInfo, ActivationInfo, true, true);  // <-- Don't forget!
        return;
    }

    // Wire ALL AbilityTask delegates
    MontageTask->OnCompleted.AddDynamic(this, &UMyAbility::OnDone);
    MontageTask->OnCancelled.AddDynamic(this, &UMyAbility::OnCancelled);
    MontageTask->OnInterrupted.AddDynamic(this, &UMyAbility::OnCancelled);  // <-- Easy to miss!
}
```
**Rule**: Grep for `EndAbility` — it should appear at least twice per ability (success + failure paths).

---

## 2. ASC Placement — Character vs PlayerState

**Symptom**: In multiplayer, player respawns and loses all attributes, active effects, and granted abilities.

**Cause**: ASC is on the Character, which is destroyed on death. A new Character is spawned with a fresh ASC.

**Fix**: For multiplayer, place ASC on PlayerState (persists across pawn respawns):
- Create ASC and AttributeSet as subobjects of PlayerState
- Character forwards `GetAbilitySystemComponent()` to its PlayerState
- Call `InitAbilityActorInfo(PlayerState, Character)` with PlayerState as Owner and Character as Avatar
- Increase `PlayerState::NetUpdateFrequency` (default is very low)

**When Character-based is OK**: Single-player games, prototypes, or actors that never respawn.

---

## 3. Mixed Replication Mode — Owner Requirement

**Symptom**: GameplayEffects are applied server-side but the owning client never sees them. Other clients see tags/cues but the controlling player doesn't get effect replication.

**Cause**: `EGameplayEffectReplicationMode::Mixed` requires `OwnerActor->GetOwner()` to be the Controller. If the Owner chain is broken, GE replication to the owning client fails silently.

**Fix**:
- **PlayerState-based ASC**: Works automatically — PlayerState's Owner is already the Controller
- **Character-based ASC**: Must call `Character->SetOwner(Controller)` in `PossessedBy()`

```cpp
void AMyCharacter::PossessedBy(AController* NewController)
{
    Super::PossessedBy(NewController);
    SetOwner(NewController);  // Required for Mixed replication mode!
    AbilitySystemComponent->InitAbilityActorInfo(this, this);
}
```

---

## 4. ABILITYLIST_SCOPE_LOCK() Missing

**Symptom**: Crash (access violation) when iterating abilities, especially during combat with many effects being applied/removed. Intermittent and hard to reproduce.

**Cause**: `GetActivatableAbilities()` returns a reference to the internal array. If an ability is granted or removed during iteration (e.g., from a GE component), the array is modified while being iterated.

**Fix**: Always wrap iteration with the scope lock macro:
```cpp
ABILITYLIST_SCOPE_LOCK();
for (FGameplayAbilitySpec& Spec : ASC->GetActivatableAbilities())
{
    // Safe — array modifications are deferred until lock releases
}
```

---

## 5. PreAttributeChange vs PostGameplayEffectExecute

**Symptom**: Game logic (death events, XP awards, UI notifications) triggers at wrong times or triggers when effects are just being previewed/predicted.

**Cause**: `PreAttributeChange()` is called for ALL changes including client prediction previews. Putting game reactions here causes them to fire prematurely or duplicate.

**Fix**:
- **PreAttributeChange**: ONLY for clamping values (`NewValue = FMath::Clamp(...)`)
- **PostGameplayEffectExecute**: For game reactions (death check, XP award, sound triggers, delegate broadcasts)

```cpp
// WRONG — fires on prediction AND confirmation
void UMyAttributeSet::PreAttributeChange(const FGameplayAttribute& Attribute, float& NewValue)
{
    if (Attribute == GetHealthAttribute() && NewValue <= 0.0f)
        BroadcastDeath(); // DON'T DO THIS HERE
}

// CORRECT
void UMyAttributeSet::PostGameplayEffectExecute(const FGameplayEffectModCallbackData& Data)
{
    if (Data.EvaluatedData.Attribute == GetHealthAttribute() && GetHealth() <= 0.0f)
        BroadcastDeath(); // Fires only after confirmed effect execution
}
```

---

## 6. Meta Attributes Replicated

**Symptom**: IncomingDamage/IncomingHealing values appear stale on clients, or damage is applied twice, or values from previous calculations leak into new ones.

**Cause**: Meta attributes are temporary containers for execution calculations. They're set, consumed (in PostGameplayEffectExecute), and reset to 0 within a single frame. Replicating them causes race conditions: the replicated value arrives out of sync with the actual calculation.

**Fix**:
- Remove `ReplicatedUsing` from meta attribute UPROPERTYs
- Remove them from `GetLifetimeReplicatedProps()`
- Always reset to 0 after consuming: `SetIncomingDamage(0.0f)`

```cpp
// Meta attributes — NO ReplicatedUsing, NO DOREPLIFETIME
UPROPERTY(BlueprintReadOnly, Category = "Meta")
FGameplayAttributeData IncomingDamage;  // No ReplicatedUsing!
```

---

## 7. DataTable MinValue/MaxValue Columns

**Symptom**: Attributes exceed expected min/max bounds despite setting MinValue/MaxValue in the initialization DataTable.

**Cause**: The DataTable CSV format includes MinValue and MaxValue columns, but **they are completely ignored by the engine**. There is no built-in clamping from DataTables.

**Fix**: Implement clamping yourself in `PreAttributeChange()` and `PostGameplayEffectExecute()`:
```cpp
void UMyAttributeSet::PreAttributeChange(const FGameplayAttribute& Attribute, float& NewValue)
{
    if (Attribute == GetHealthAttribute())
        NewValue = FMath::Clamp(NewValue, 0.0f, GetMaxHealth());
}
```

---

## 8. GameplayCues for Gameplay Logic

**Symptom**: Effects that should always happen (removing a buff, dealing periodic damage, spawning projectiles) sometimes don't fire on clients. Works reliably in standalone/listen server but fails in dedicated server setups.

**Cause**: GameplayCues use **unreliable** multicast RPCs. They're designed for cosmetic effects where occasional misses are acceptable. Network congestion or packet loss can cause missed cues.

**Fix**:
- Use GameplayCues ONLY for cosmetics: particles, sounds, camera shakes, UI animations
- All gameplay state changes must go through GameplayEffects (reliable replication) or ability logic
- If you need guaranteed client notification, use a replicated property or reliable RPC

---

## 9. Non-Instanced Abilities in Blueprint

**Symptom**: Crash or undefined behavior when a Blueprint ability uses `NonInstanced` instancing policy. Variables don't retain values between activations.

**Cause**: Non-Instanced abilities use the Class Default Object (CDO) — they don't create per-actor instances. Blueprint graphs rely on instance variables and delegates, which don't work on CDOs.

**Fix**: Non-Instanced policy is **C++ only**:
- Cannot use Blueprint event graphs
- Cannot use member variables (they'd be shared across all actors)
- Cannot bind delegates
- Cannot replicate ability state
- Only use for extremely high-frequency abilities (RTS basic attacks) where the allocation overhead matters

For everything else, use **InstancedPerActor** (the recommended default).

---

## 10. Multiple ASCs on One Actor

**Symptom**: Abilities granted to one ASC don't show up in `showdebug`, effects applied to one ASC don't modify attributes on the other, `IAbilitySystemInterface::GetAbilitySystemComponent()` returns only one.

**Cause**: The GAS framework assumes one ASC per actor. `IAbilitySystemInterface` returns a single pointer. Many internal systems use `GetAbilitySystemComponent()` which resolves to one ASC, ignoring the other.

**Fix**: Don't do it. Use ONE ASC per actor. If you need to represent multiple ability "sets" (e.g., equipment abilities vs innate abilities), use:
- Tag-based filtering within a single ASC
- Separate AttributeSets on the same ASC
- `AbilityTags` to categorize abilities

---

## 11. Cooldown Prediction Latency

**Symptom**: Client predicts ability activation and shows cooldown, but the cooldown visual resets briefly when server confirmation arrives, then starts again. Feels "flickery."

**Cause**: Cooldown duration GE is predicted on the client and then confirmed by the server. If there's network latency, the confirmed effect may start slightly later than the predicted one, causing a visual reset.

**Fix**:
- Ensure cooldown UI reads from `GetCooldownTimeRemaining()` which accounts for prediction
- Use `OnGameplayEffectAppliedDelegateToSelf` for UI updates (fires for both predicted and confirmed)
- Consider a small client-side buffer that smooths over the prediction/confirmation gap

---

## 12. GameplayEffect Removal Cannot Be Predicted

**Symptom**: Client removes a buff/debuff but the visual effect lingers until server confirmation arrives. Removing an infinite sprint buff feels laggy.

**Cause**: GE removal is a **known prediction limitation**. The client cannot optimistically remove an effect — it must wait for the server to confirm removal.

**Fix**:
- For responsive removal, predict applying an **inverse effect** (e.g., to cancel a speed buff, apply an instant GE that sets speed multiplier back to 1.0)
- Accept the latency for non-critical effect removal
- Use `RemoveActiveGameplayEffect()` on the server and let replication handle clients

---

## 13. SetByCaller Missing Values

**Symptom**: Damage or healing effect applies 0 instead of expected value. Runtime log shows: `"Warning: SetByCaller tag [TagName] not found, returning 0."`

**Cause**: `SetSetByCallerMagnitude()` was never called on the spec before applying, or the wrong tag was used (string mismatch).

**Fix**:
```cpp
// ALWAYS set ALL SetByCaller values before applying
FGameplayEffectSpecHandle Spec = ASC->MakeOutgoingSpec(DamageEffect, Level, Context);

// Use native tags (compile-time safety) instead of RequestGameplayTag strings
Spec.Data->SetSetByCallerMagnitude(MyGameplayTags::TAG_Data_Damage, DamageValue);

// Use the warn parameter to catch missing values explicitly
float Value = Spec.Data->GetSetByCallerMagnitude(TAG_Data_Damage, true, -1.0f);
// true = warn if missing, -1.0f = default if missing
```

---

## 14. InitGlobalData Not Called (UE < 5.3)

**Symptom**: TargetData doesn't serialize/deserialize correctly. `WaitTargetData` ability task produces empty or corrupted results. Works in PIE but fails in packaged builds.

**Cause**: In UE 4.24–5.2, `UAbilitySystemGlobals::InitGlobalData()` must be called manually. It initializes the global data tables for tag serialization and TargetData. UE 5.3+ calls it automatically.

**Fix**: Override `UAssetManager::StartInitialLoading()`:
```cpp
void UMyAssetManager::StartInitialLoading()
{
    Super::StartInitialLoading();
    UAbilitySystemGlobals::Get().InitGlobalData();
}
```
And set your custom asset manager in Project Settings > Engine > General Settings > Asset Manager Class.

---

## 15. Modifier Aggregation Formula (Paragon-Derived)

**Symptom**: Stacking multiple percentage buffs (e.g., +10% attack from two sources) produces unexpected results. Two +50% buffs don't equal +100%.

**Cause**: The default modifier aggregation formula is derived from Paragon and uses: `((Attribute - AttributeBase) + Sum_of_Additive) * Product_of_Multiplicative`. The multiplicative modifiers multiply the **sum** of all additive modifiers, not each other.

**Fix**:
- Understand the formula before designing effects
- For truly multiplicative stacking, use Execution Calculations instead of modifiers
- If you need a different formula, override `UAbilitySystemGlobals::GetGameplayEffectModifierAggregator()` (advanced, engine-level change)

---

## Quick Diagnostic Checklist

When GAS isn't working as expected, check in this order:

1. **Build.cs** — all three modules included?
2. **InitAbilityActorInfo** — called on BOTH server and client?
3. **Replication mode** — correct for your game type?
4. **Owner chain** — is `GetOwner()` set for Mixed mode?
5. **EndAbility** — called on ALL code paths?
6. **showdebug abilitysystem** — what does the live debugger show?
7. **LogAbilitySystem** — any warnings in the log?
8. **Tag spelling** — exact match? Tags are case-sensitive hierarchies.
9. **SetByCaller** — all values set before applying?
10. **Meta attributes** — consumed and reset? Not replicated?
