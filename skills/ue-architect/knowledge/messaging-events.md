# Messaging & Event Architecture

## GameplayMessageRouter Plugin

### Architecture
- **UGameplayMessageSubsystem**: GameInstance subsystem accessible via `Get(WorldContextObject)`
- Message channels identified by `FGameplayTag`
- Completely decouples event producers from consumers
- Type-safe: messages are `USTRUCT()` types agreed at compile time

### Broadcasting
```cpp
FMyMessage Message;
Message.Instigator = InstigatorActor;
Message.Value = 100;
UGameplayMessageSubsystem::Get(this).BroadcastMessage(ChannelTag, Message);
```

### Subscribing
```cpp
FGameplayMessageListenerParams<FMyMessage> Params;
Params.SetMessageReceivedCallback(this, &ThisClass::OnMessageReceived);
Handle = UGameplayMessageSubsystem::Get(this).RegisterListener(ChannelTag, Params);
```

### Matching Rules
- **ExactMatch**: Subscribe to specific tag only
- **PartialMatch**: Subscribe to tag + all children (e.g., subscribe to `GameEvent.Kill` catches `GameEvent.Kill.Headshot`)

### Blueprint Support
- `UAsyncAction_ListenForGameplayMessage`: Blueprint-callable async listening node

---

## FLyraVerbMessage

Lyra's universal "Instigator Verb Target" event structure:
```cpp
struct FLyraVerbMessage {
    FGameplayTag Verb;                   // What happened (Kill, Assist, Pickup)
    TObjectPtr<UObject> Instigator;      // Who did it
    TObjectPtr<UObject> Target;          // Who it happened to
    FGameplayTagContainer InstigatorTags;// Instigator's state tags
    FGameplayTagContainer TargetTags;    // Target's state tags
    FGameplayTagContainer ContextTags;   // Additional context
    double Magnitude;                    // Numeric value (damage, score)
};
```

### Distribution
- `GameState.MulticastMessageToClients()`: Unreliable broadcast (fast, may drop)
- `GameState.MulticastReliableMessageToClients()`: Reliable broadcast (guaranteed, slower)

### Message Processors (ShooterCore)
- `ElimChainProcessor`: Tracks rapid elimination chains
- `ElimStreakProcessor`: Tracks elimination streaks
- `AssistProcessor`: Tracks kill assists

These subscribe to verb messages and publish their own notifications. Zero coupling between them.

---

## Delegate Patterns

### For Actor-Level Events
```cpp
// Declaration
DECLARE_DYNAMIC_MULTICAST_DELEGATE_TwoParams(FOnHealthChanged, float, OldValue, float, NewValue);

UPROPERTY(BlueprintAssignable)
FOnHealthChanged OnHealthChanged;

// Usage
OnHealthChanged.Broadcast(OldHealth, NewHealth);
```

### For Component Communication
```cpp
// Lyra pattern: CallAndRegister
void CallOrRegister_OnExperienceLoaded(FOnExperienceLoaded::FDelegate&& Delegate);
// If already loaded: fires immediately
// If not loaded: registers for later callback
```

This pattern eliminates race conditions — you never miss an event whether you subscribe before or after it fires.

---

## Inventory Change Messages
```cpp
struct FLyraInventoryChangeMessage {
    UActorComponent* InventoryOwner;
    ULyraInventoryItemInstance* Instance;
    int32 NewCount;
    int32 Delta;  // +N for add, -N for remove
};
```
Published to GameplayMessageRouter. UI, achievements, analytics all subscribe independently.

---

## Communication Pattern Selection Guide

| Need | Pattern | Coupling |
|------|---------|----------|
| "Something happened" to many listeners | GameplayMessageRouter | None (tag-based) |
| Component state changed | Delegate on component | Weak (delegate binding) |
| Capability query ("can you be picked up?") | Interface (UINTERFACE) | Type-level (interface) |
| "Are you ready?" between components | Init State Interface | Framework-managed |
| Finding a service | Subsystem::Get() | Weak (subsystem lookup) |
| Parent notifying children | Delegate | Weak |
| Child requesting from parent | Interface or direct reference | Moderate |

---

## Event Flow Example: Player Eliminates Enemy

```
1. Server: DamageExecution applies lethal damage
2. HealthComponent detects health <= 0
3. HealthComponent broadcasts OnDeathStarted delegate
4. Death ability activates on ASC
5. GameMode creates FLyraVerbMessage (Verb: Kill)
6. GameState.MulticastMessageToClients(VerbMessage)
7. GameplayMessageRouter distributes to subscribers:
   a. ElimChainProcessor → checks for chain, publishes chain notification
   b. ElimStreakProcessor → increments streak, publishes streak notification
   c. AssistProcessor → checks for assists, publishes assist notifications
   d. ScoreSystem → awards points
   e. UI → shows elimination feed
   f. Analytics → logs event
```

None of these systems reference each other. Adding a new subscriber (e.g., achievement system) requires zero changes to existing code.

---

## Anti-Patterns
- Direct function calls between unrelated systems (tight coupling)
- Not using CallOrRegister pattern (race conditions on late subscribers)
- Reliable RPCs for frequent cosmetic events (use unreliable or replicated properties)
- Publishing messages without type safety (raw UObject* instead of USTRUCT)
- Subscribing to messages without unsubscribing (memory leaks)
- Using GameplayMessageRouter for same-actor component communication (overkill; use delegates)
