# Gameplay Cue System — Complete Reference

## Overview

Gameplay Cues are the **cosmetic feedback layer** of the Gameplay Ability System (GAS). They handle visual effects (particles, Niagara), sound effects, camera shakes, UI animations, and other non-gameplay feedback triggered by GameplayEffects or manual ASC calls. Gameplay Cues use **unreliable** multicast RPCs — NEVER put gameplay logic in them.

### Core Architecture

```
GameplayEffect applied/removed/executed
  → UAbilitySystemComponent (ASC) fires cue RPC
    → UGameplayCueManager::HandleGameplayCue()
      → UGameplayCueManager::RouteGameplayCue()
        → UGameplayCueSet::HandleGameplayCue()
          → UGameplayCueSet::HandleGameplayCueNotify_Internal()
            → AGameplayCueNotify_Actor / UGameplayCueNotify_Static / _Burst
```

### Module Dependencies

```cpp
// Build.cs — same as GAS, no additional modules needed
PrivateDependencyModuleNames.AddRange(new string[] {
    "GameplayAbilities",
    "GameplayTags",
    "GameplayTasks"
});
```

---

## 1. Gameplay Cue Notify Types

### Decision Table

| Type | Instanced? | Actor Spawned? | Persists? | Use Case |
|------|-----------|----------------|-----------|----------|
| `UGameplayCueNotify_Static` | No (CDO) | No | No | Simple instant effects, no state needed |
| `UGameplayCueNotify_Burst` | No (CDO) | No | No | One-off VFX/SFX with built-in spawn config |
| `AGameplayCueNotify_BurstLatent` | Yes | Yes | Brief | Burst effects needing short lifetime to finish playing |
| `AGameplayCueNotify_Actor` | Yes | Yes | Yes | Duration/infinite effects, complex state management |
| `AGameplayCueNotify_Looping` | Yes | Yes | Yes | Continuous looping effects (fire, shield, aura) |

### AGameplayCueNotify_Actor

Spawns a persistent actor in the world. Used for **duration-based effects** that need state: burning auras, shields, buff visuals, charging effects.

**Key Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `GameplayCueTag` | `FGameplayTag` | Tag this notify responds to (MUST start with `GameplayCue.`) |
| `bAutoDestroyOnRemove` | `bool` | Recycle/destroy when OnRemove fires |
| `AutoDestroyDelay` | `float` | Seconds to wait before destroy/recycle after removal |
| `bAutoDestroyWhenFinished` | `bool` | Destroy when all components report finished |
| `bUniqueInstancePerInstigator` | `bool` | Separate instance per damage source actor |
| `bUniqueInstancePerSourceObject` | `bool` | Separate instance per source object |
| `bAllowMultipleOnActiveEvents` | `bool` | Re-trigger OnActive if already active |
| `bAllowMultipleWhileActiveEvents` | `bool` | Re-trigger WhileActive from multiple sources |
| `bAutoAttachToOwner` | `bool` | Attach spawned actor to owning actor |
| `bIsOverride` | `bool` | Prevents cascading execution to parent handlers |
| `NumPreallocatedInstances` | `int32` | Object pool size for this cue type |

**Lifecycle Methods:**

| Pre-5.5 Name | UE 5.5+ Name | When Called |
|-------------|--------------|-------------|
| `OnActive_Implementation` | `OnBurst` | When cue first activates (Duration/Infinite GE applied) |
| `WhileActive_Implementation` | `OnBecomeRelevant` | When cue becomes relevant (late joiners, re-entry) |
| `OnExecute_Implementation` | `OnExecute` | For instant effects or periodic ticks |
| `OnRemove_Implementation` | `OnCeaseRelevant` | When cue is removed (GE expires/removed) |

**CRITICAL (UE 5.5+):** Implementing OnBurst + OnCeaseRelevant WITHOUT OnBecomeRelevant triggers asset validation warning and causes "stuck" cues for late-joining clients. Always implement WhileActive/OnBecomeRelevant alongside OnActive/OnBurst.

Additional methods:
- `HandleGameplayCue()` — generic handler for all event types
- `EndGameplayCue()` — manually terminate; destroys or recycles
- `Recycle()` — called instead of destroy when pooling is enabled; hide actor, stop effects
- `ReuseAfterRecycle()` — called when recycled instance is reused; undo everything from Recycle()

### UGameplayCueNotify_Static

Non-instanced UObject. The CDO (Class Default Object) handles events directly. No actor spawned. Ideal for **fire-and-forget** instant effects.

**Methods:** Same as Actor cue — `OnExecute`, `OnActive`, `WhileActive`, `OnRemove`.

### UGameplayCueNotify_Burst (UE5+)

Inherits from `UGameplayCueNotify_Static`. Purpose-built for **one-time burst effects** — particle spawns, sounds at impact.

- Non-instanced, no actor spawned (most lightweight option)
- Should NEVER contain looping effects

**Built-in `FGameplayCueNotify_BurstEffects` struct:**

| Field | Type | Description |
|-------|------|-------------|
| `BurstParticles` | `TArray<FGameplayCueNotify_ParticleInfo>` | Particles to spawn (non-looping) |
| `BurstSounds` | `TArray<FGameplayCueNotify_SoundInfo>` | Sounds to play (non-looping) |
| `BurstCameraShake` | `FGameplayCueNotify_CameraShakeInfo` | Camera shake on burst |
| `BurstCameraLensEffect` | `FGameplayCueNotify_CameraLensEffectInfo` | Camera lens effect |
| `BurstForceFeedback` | `FGameplayCueNotify_ForceFeedbackInfo` | Controller haptics |
| `BurstDecal` | `FGameplayCueNotify_DecalInfo` | Decal to spawn at location |

**Additional properties:**
- `DefaultPlacementInfo` — default placement rules for spawned effects (overridable per-effect)
- `DefaultSpawnCondition` — condition to check before spawning anything

### AGameplayCueNotify_BurstLatent (UE5+)

Actor-based variant of Burst. Spawns an actor that **auto-destroys** after a short lifetime. Use when burst effects need time to finish (particle trails, decaying sounds).

### AGameplayCueNotify_Looping (UE5+)

Instanced actor for **continuous looping effects**. Start with `AddGameplayCue`, stop with `RemoveGameplayCue`.

Properties:
- Looping Effects list — effects spawned on loop start
- Same instance management properties as `_Actor` (bUniqueInstancePerInstigator, etc.)

---

## 2. Gameplay Cue Tags

### Convention

All Gameplay Cue tags **MUST** start with `GameplayCue.` prefix:

```
GameplayCue.
  GameplayCue.Damage.Physical.Slash
  GameplayCue.Damage.Elemental.Fire
  GameplayCue.Ability.Fireball.Impact
  GameplayCue.Status.Burning
  GameplayCue.Status.Frozen
  GameplayCue.Hero.Victory
  GameplayCue.Weapon.Fire.Muzzle
  GameplayCue.Heal.Burst
  GameplayCue.Shield.Activate
```

### Tag Hierarchy and Parent Matching

A handler registered for `GameplayCue.Damage` catches ALL child tags:
- `GameplayCue.Damage.Physical`
- `GameplayCue.Damage.Physical.Slash`
- `GameplayCue.Damage.Elemental.Fire`

Use `Parameters.OriginalTag` to identify the exact tag that triggered the cue. Use `Parameters.MatchedTagName` to see which handler actually matched.

**Note:** `MatchedTagName` and `OriginalTag` are NOT replicated — they are set locally during routing.

### Native Tag Declaration

```cpp
// MyProjectTags.h
UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_GameplayCue_Fire_Impact);
UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_GameplayCue_Fire_Aura);
UE_DECLARE_GAMEPLAY_TAG_EXTERN(TAG_GameplayCue_Heal);

// MyProjectTags.cpp
UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_GameplayCue_Fire_Impact, "GameplayCue.Fire.Impact", "Fire hit visual effect");
UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_GameplayCue_Fire_Aura, "GameplayCue.Fire.Aura", "Persistent fire aura effect");
UE_DEFINE_GAMEPLAY_TAG_COMMENT(TAG_GameplayCue_Heal, "GameplayCue.Heal", "Healing visual effect");
```

---

## 3. FGameplayCueParameters

Complete struct carrying context data from GE to cue handler:

| Field | Type | Description |
|-------|------|-------------|
| `NormalizedMagnitude` | `float` | GE magnitude normalized 0–1 (effect strength) |
| `RawMagnitude` | `float` | Raw final magnitude from GE |
| `EffectContext` | `FGameplayEffectContextHandle` | Full context: who applied, hit result, source/target |
| `MatchedTagName` | `FGameplayTag` | Tag that matched this handler (NOT replicated) |
| `OriginalTag` | `FGameplayTag` | Original cue tag as fired (NOT replicated) |
| `AggregatedSourceTags` | `FGameplayTagContainer` | All tags on the source/instigator |
| `AggregatedTargetTags` | `FGameplayTagContainer` | All tags on the target |
| `Location` | `FVector_NetQuantize10` | World location of the cue event |
| `Normal` | `FVector_NetQuantizeNormal` | World normal (hit surface normal) |
| `Instigator` | `TWeakObjectPtr<AActor>` | Actor owning the ASC |
| `EffectCauser` | `TWeakObjectPtr<AActor>` | Physical actor that caused effect (weapon, projectile) |
| `SourceObject` | `TWeakObjectPtr<const UObject>` | Original object the effect was created from |
| `PhysicalMaterial` | `TWeakObjectPtr<const UPhysicalMaterial>` | Physical material of hit surface |
| `GameplayEffectLevel` | `int32` | Level of the GameplayEffect (default 1) |
| `AbilityLevel` | `int32` | Level of the originating ability (default 1) |
| `TargetAttachComponent` | `TWeakObjectPtr<USceneComponent>` | Component to attach cue effects to |
| `bReplicateLocationWhenUsingMinimalRepProxy` | `bool` | If true, replicate Location/Normal even with Minimal Rep Proxy |

**Helper Methods:**
- `IsInstigatorLocallyControlled()` — check if instigator is local (for 1P vs 3P effects)
- `IsInstigatorLocallyControlledPlayer(AActor* Fallback)` — same but with fallback actor
- `GetInstigator()` — resolve weak pointer to instigator actor
- `GetEffectCauser()` — resolve weak pointer to effect causer
- `GetSourceObject()` — resolve weak pointer to source object

### Passing Custom Data via EffectContext

Subclass `FGameplayEffectContext` to carry project-specific data:

1. Create `FMyEffectContext : public FGameplayEffectContext`
2. Override `GetScriptStruct()`, `Duplicate()`, `NetSerialize()`
3. Add `TStructOpsTypeTraits` matching parent
4. Override `AllocGameplayEffectContext()` in custom `UAbilitySystemGlobals` subclass
5. Cast back in cue handler: `static_cast<const FMyEffectContext*>(Parameters.EffectContext.Get())`

---

## 4. Cue Event Lifecycle (EGameplayCueEvent)

```cpp
UENUM(BlueprintType)
namespace EGameplayCueEvent
{
    enum Type
    {
        OnActive,    // Cue first activated
        WhileActive, // Cue active (includes late joiners)
        Executed,    // Instant / periodic tick
        Removed      // Cue removed
    };
}
```

### GE Duration → Cue Event Mapping

| GE Duration Policy | Events Fired |
|--------------------|-------------|
| **Instant** | `Executed` only |
| **Duration** | `OnActive` + `WhileActive` on apply → `Removed` on expiry |
| **Infinite** | `OnActive` + `WhileActive` on apply → `Removed` on manual removal |
| **Periodic tick** | `Executed` on each tick (in addition to the above for Duration/Infinite) |

### Late-Join Behavior

`WhileActive` fires for clients who:
- Join mid-game while a cue is active
- Enter relevancy range of an actor with active cues
- Ensures they see ongoing effects even if they missed `OnActive`

---

## 5. UGameplayCueManager

Singleton manager handling all cue dispatch, spawning, pooling, and asset discovery.

**Access:** `UAbilitySystemGlobals::Get().GetGameplayCueManager()`

### Core Methods

| Method | Purpose |
|--------|---------|
| `HandleGameplayCue(Actor, Tag, EventType, Params)` | Main entry point — validates and dispatches |
| `HandleGameplayCues(Actor, Tags, EventType, Params)` | Multi-tag dispatch |
| `RouteGameplayCue(Actor, Tag, EventType, Params)` | Routes to correct handler class |
| `TranslateGameplayCue(Tag, Actor, Params)` | Translates tag before routing |
| `GetInstancedCueActor(...)` | Get/create pooled actor instance |
| `EndGameplayCuesFor(Actor)` | Force-stop all active cues on actor |
| `ShouldSuppressGameplayCues(Actor)` | Virtual — override to filter cues per actor |

### Batching (Network Optimization)

| Method | Purpose |
|--------|---------|
| `StartGameplayCueSendContext()` | Begin batching — increments counter |
| `EndGameplayCueSendContext()` | End batching — decrements counter, flushes at 0 |
| `FlushPendingCues()` | Send all batched cue RPCs |

Use `FScopedGameplayCueSendContext` RAII wrapper for automatic scope management.

**Caveat:** `FScopedGameplayCueSendContext` groups RPCs into the same frame — it does NOT reduce the number of RPCs. Each multicast is still sent individually. For true RPC count reduction, use Ability Batching (separate mechanism).

### Non-Replicated Cue Functions (UE5+)

| Method | Purpose |
|--------|---------|
| `AddGameplayCue_NonReplicated(Actor, Tag, Params)` | Local-only persistent cue |
| `RemoveGameplayCue_NonReplicated(Actor, Tag, Params)` | Remove local-only cue |
| `ExecuteGameplayCue_NonReplicated(Actor, Tag, Params)` | Execute local-only one-shot cue |

### Preallocation

| Method | Purpose |
|--------|---------|
| `ResetPreallocation(World)` | Reset pool for a world |
| `UpdatePreallocation(World)` | Tick pool updates |
| `DumpPreallocationStats(World)` | Debug — print pool sizes |

### Object Library System

**`FGameplayCueObjectLibrary`** struct controls asset scanning:

| Field | Purpose |
|-------|---------|
| `Paths` | Directories to scan for cue assets |
| `ActorObjectLibrary` | UObjectLibrary for actor-based notifies |
| `StaticObjectLibrary` | UObjectLibrary for static notifies |
| `CueSet` | Target UGameplayCueSet to populate |
| `bShouldSyncScan` | Synchronous scan at startup |
| `bShouldAsyncLoad` | Async load cue classes |
| `bShouldSyncLoad` | Sync load cue classes |
| `AsyncPriority` | Loading priority |

### Virtual Methods for Subclassing

| Method | Default | Override Purpose |
|--------|---------|-----------------|
| `ShouldAsyncLoadRuntimeObjectLibraries()` | true | Return false for on-demand loading (Lyra pattern) |
| `ShouldSyncLoadMissingGameplayCues()` | varies | Control blocking load of missing cues |
| `ShouldAsyncLoadMissingGameplayCues()` | true | Async load missing cues, execute on completion |
| `ShouldLoadGameplayCueAssetData(FAssetData)` | true | Filter individual assets from loading |
| `HandleMissingGameplayCue(...)` | warn | Custom handling when cue class not loaded |
| `GetAlwaysLoadedGameplayCuePaths()` | — | Paths to always keep loaded in memory |
| `GetValidGameplayCuePaths()` | — | Paths for editor asset discovery |
| `ShouldSuppressGameplayCues(Actor)` | false | Suppress cues for specific actors (dead, hidden) |

### Configuration (DefaultGame.ini)

```ini
[/Script/GameplayAbilities.AbilitySystemGlobals]
; CRITICAL: Without this, engine scans ALL of /Game/ — extremely slow on large projects
+GameplayCueNotifyPaths=/Game/Effects/GameplayCues
+GameplayCueNotifyPaths=/Game/Characters/GameplayCues

; Custom GameplayCueManager class
GlobalGameplayCueManagerClass=/Script/YourProject.YourGameplayCueManager
```

### GameFeature Plugin Cue Paths

For modular projects using GameFeature plugins, INI-based `+GameplayCueNotifyPaths` may not work for plugin modules. Use programmatic registration:

```cpp
UAbilitySystemGlobals::Get().GetGameplayCueManager()->AddGameplayCueNotifyPath(TEXT("/YourPlugin/GameplayCues"));
```

Lyra uses `AddGameplayCuePath` actions in GameFeature Data Assets.

---

## 6. IGameplayCueInterface

Interface that actors implement to receive cue events directly (without standalone GCN classes).

### Key Methods

```cpp
// Main handler — override to process individual cue tags
virtual void HandleGameplayCue(AActor* Self, FGameplayTag GameplayCueTag,
    EGameplayCueEvent::Type EventType, FGameplayCueParameters Parameters);

// Batch handler for multiple tags
virtual void HandleGameplayCues(AActor* Self, const FGameplayTagContainer& GameplayCueTags,
    EGameplayCueEvent::Type EventType, FGameplayCueParameters Parameters);

// Return false to reject cues
virtual bool ShouldAcceptGameplayCue(AActor* Self, FGameplayTag GameplayCueTag,
    EGameplayCueEvent::Type EventType, FGameplayCueParameters Parameters);

// Optionally return custom cue sets
virtual void GetGameplayCueSets(TArray<UGameplayCueSet*>& OutSets) const;

// Fallback when no tag-specific handler found
virtual void GameplayCueDefaultHandler(EGameplayCueEvent::Type EventType,
    FGameplayCueParameters Parameters);

// Continue searching parent classes
void ForwardGameplayCueToParent();
```

### Tag-Matched Function Pattern

Name a UFUNCTION matching the cue tag (dots become underscores):
```cpp
UFUNCTION()
void GameplayCue_Damage(EGameplayCueEvent::Type EventType, FGameplayCueParameters Parameters);
// Matches GameplayCue.Damage and ALL child tags
```

### Cue Forwarding

Pass cues from pawn to weapon or other components:
```cpp
UAbilitySystemBlueprintLibrary::ForwardGameplayCueToTarget(Actor, Function, EventType, Parameters);
```

---

## 7. UGameplayCueSet

Data structure mapping gameplay cue tags to handler classes.

- Global set accessed via `UGameplayCueManager::GetRuntimeCueSet()`
- `GetGlobalCueSets()` returns runtime + editor sets
- When `HandleGameplayCueNotify_Internal` is called, performs just-in-time class lookup
- If class not loaded: sync-load, async-load, or skip (depends on manager config)
- Actors can return additional sets via `IGameplayCueInterface::GetGameplayCueSets()`
- Multiple handlers can respond to the same tag

---

## 8. GameplayCue Translation (FGameplayCueTranslator)

Runtime tag translation system. Translates a cue tag to a different tag based on context (actor, parameters).

**Use case:** `GameplayCue.Hero.Victory` → `GameplayCue.Hero.Warrior.Victory` or `GameplayCue.Hero.Mage.Victory` based on which hero.

**Classes:**
- `UGameplayCueTranslator` — base class, games subclass
- `FGameplayCueTranslationManager` — lives on `UGameplayCueManager`, performs translation
- `FGameplayCueTranslatorNode` — node in the translation lookup tree

**Flow:**
1. Translator defines rules (tag A → tag B based on conditions)
2. `TranslateGameplayCue()` called before routing
3. Translated tag routed through normal cue system

**Debug commands:**
- `Log LogGameplayCueTranslator Verbose`
- `GameplayCue.PrintGameplayCueTranslator`
- `GameplayCue.BuildGameplayCueTranslator`

---

## 9. Replication

### ASC Replication Mode → Cue Behavior

| Mode | GE Replication | Cue Replication | Use Case |
|------|---------------|-----------------|----------|
| **Full** | To all clients | To all clients | Single player, small multiplayer |
| **Mixed** | Only to owner | NetMulticast to all | Player-controlled actors in MP |
| **Minimal** | Never | Tags + Cues to all | AI, large player counts (100+) |

### NetMulticast RPC Functions (on ASC)

```cpp
NetMulticast_InvokeGameplayCueExecuted_FromSpec(const FGameplayEffectSpecForRPC& Spec);
NetMulticast_InvokeGameplayCueExecuted(FGameplayTag Tag, FPredictionKey Key);
NetMulticast_InvokeGameplayCuesExecuted(const FGameplayTagContainer& Tags);
NetMulticast_InvokeGameplayCueExecuted_WithParams(FGameplayTag Tag, const FGameplayCueParameters& Params);
NetMulticast_InvokeGameplayCueAdded_WithParams(FGameplayTag Tag, const FGameplayCueParameters& Params);
NetMulticast_InvokeGameplayCueAddedAndWhileActive_FromSpec(const FGameplayEffectSpecForRPC& Spec);
NetMulticast_InvokeGameplayCueAddedAndWhileActive_WithParams(FGameplayTag Tag, const FGameplayCueParameters& Params);
```

### Prediction Flow

1. Client with valid `FPredictionKey` calls `ExecuteGameplayCue` → cue plays immediately (predicted)
2. Server processes ability, executes cue with replication key
3. Client receives replicated cue → skips (already predicted via matching key)
4. If server rejects ability → client rolls back via `FPredictionKeyDelegates`

### Active Cue Replication (Fast Array Serializer)

```cpp
struct FActiveGameplayCue : FFastArraySerializerItem
{
    FGameplayTag GameplayCueTag;         // Replicated
    FPredictionKey PredictionKey;        // Replicated
    FGameplayCueParameters Parameters;   // Replicated
    bool bPredictivelyRemoved;           // NOT replicated

    void PreReplicatedRemove(const FActiveGameplayCueContainer&);
    void PostReplicatedAdd(const FActiveGameplayCueContainer&);
    void PostReplicatedChange(const FActiveGameplayCueContainer&);
};

struct FActiveGameplayCueContainer : FFastArraySerializer
{
    TArray<FActiveGameplayCue> GameplayCues;
    UAbilitySystemComponent* Owner;
    bool bMinimalReplication;

    void AddCue(Tag, Key, Params);
    void RemoveCue(Tag);
    void PredictiveRemove(Tag);
    void PredictiveAdd(Tag, Key);
    bool HasCue(Tag) const;
};
```

### Known Issue: Listen Server Double-Fire

With Mixed/Minimal replication mode, `OnActive`/`OnRemove` fire TWICE on listen server player:
1. Once from GE application (local)
2. Once from NetMulticast RPC

`WhileActive` fires only once. Clients always see events once. Guard with state flags if needed.

---

## 10. Triggering Cues

### Via ASC (Replicated)

```cpp
// One-shot instant
ASC->ExecuteGameplayCue(Tag);
ASC->ExecuteGameplayCue(Tag, Parameters);

// Persistent (add/remove lifecycle)
ASC->AddGameplayCue(Tag, Parameters);
ASC->RemoveGameplayCue(Tag);
ASC->RemoveAllGameplayCues();

// Query
bool bActive = ASC->IsGameplayCueActive(Tag);
```

### Via ASC (Local Only — No Replication)

```cpp
ASC->ExecuteGameplayCueLocal(Tag, Parameters);
ASC->AddGameplayCueLocal(Tag, Parameters);
ASC->RemoveGameplayCueLocal(Tag);
```

### Via GameplayEffect

Add cues to `UGameplayEffect::GameplayCues` array (array of `FGameplayEffectCue`):
- Each entry has a `GameplayTag` and optional `MinLevel`/`MaxLevel` filtering
- GE magnitude feeds `NormalizedMagnitude` (0-1) and `RawMagnitude` in parameters
- Events fire automatically based on GE duration policy

### Periodic GE Cues

Duration/Infinite GEs with a `Period` fire `Executed` on each tick. `execute_periodic_effect_on_application` controls whether first execution is immediate.

### Stacking and Cues

`suppress_stacking_cues` on `UGameplayEffect`: When true, cues only trigger for first stack. Subsequent stack applications are silent.

---

## 11. Performance

### Path Configuration (Critical)

```ini
[/Script/GameplayAbilities.AbilitySystemGlobals]
+GameplayCueNotifyPaths=/Game/Effects/GameplayCues
```

Without this, engine scans ALL of `/Game/` at startup — loads all GCN assets + referenced particles/sounds into memory.

### Object Pooling

- Set `NumPreallocatedInstances` on `AGameplayCueNotify_Actor` subclasses
- `IsGameplayCueRecylingEnabled()` — static check if pooling is on globally
- Override `Recycle()` and `ReuseAfterRecycle()` for custom cleanup/reinit
- `bAutoDestroyOnRemove` + `AutoDestroyDelay` for automatic recycling

### Loading Strategies

| Strategy | Method | Trade-off |
|----------|--------|-----------|
| Preload all at startup | Default behavior | Slow startup, no runtime hitches |
| On-demand async | Override `ShouldAsyncLoadRuntimeObjectLibraries()` → false | Fast startup, first-use delay |
| On-demand sync | `ShouldSyncLoadMissingGameplayCues()` → true | Fast startup, blocks on first use |
| Always-loaded subset | `GetAlwaysLoadedGameplayCuePaths()` | Critical cues ready, rest on-demand |

### Best Practices

1. Use `_Static` / `_Burst` instead of `_Actor` when possible (no actor spawn overhead)
2. Batch cues on a single GameplayEffect to reduce replication cost
3. Use `FScopedGameplayCueSendContext` to batch RPCs within a frame
4. Configure `GameplayCueNotifyPaths` — never scan all of `/Game/`
5. Use soft object references for VFX/SFX assets (async loading)
6. Set `NumPreallocatedInstances` on frequently-used actor cues
7. Implement early-exit in `WhileActive` callbacks
8. Use local cues (`_NonReplicated`) for UI-only effects (damage numbers, hit markers)

---

## 12. Debugging

### Console Commands

| Command | Purpose |
|---------|---------|
| `showdebug abilitysystem` | GAS debugger HUD: attributes, active GEs, abilities |
| `AbilitySystem.Debug.NextCategory` | Cycle debug pages |
| `AbilitySystem.GameplayCue.DisplayStates` | Show active gameplay cue states |
| `GameplayCue.PrintGameplayCueTranslator` | Print tag translation table |
| `GameplayCue.BuildGameplayCueTranslator` | Rebuild translation for debugging |

### Log Categories

| Category | Purpose |
|----------|---------|
| `LogAbilitySystem` | General GAS logging |
| `LogGameplayCueNotify` | Cue notify creation/destruction/events |
| `LogGameplayCueTranslator` | Tag translation |

Enable verbose: `Log LogGameplayCueNotify Verbose`

---

## 13. Gameplay Subsystem Integration

### Subsystem Types for GAS/Cue Management

| Subsystem | Lifetime | Cue Use Case |
|-----------|----------|-------------|
| `UGameInstanceSubsystem` | Entire session, persists across levels | Global GAS init, ability registry, shared cue config |
| `UWorldSubsystem` | Tied to world/level | Per-level cue pools, level-specific cue management |
| `ULocalPlayerSubsystem` | Per local player | Player-specific cue filtering, local prediction state |

### Initialization Order

`UGameInstanceSubsystem` initializes before `UWorldSubsystem` — correct place for `UAbilitySystemGlobals::Get().InitGlobalData()` and custom GameplayCueManager registration.

---

## 14. ASC Methods — Quick Reference

| Method | Category | Description |
|--------|----------|-------------|
| `ExecuteGameplayCue(Tag, Params)` | Replicated | One-shot cue |
| `AddGameplayCue(Tag, Params)` | Replicated | Add persistent cue |
| `RemoveGameplayCue(Tag)` | Replicated | Remove persistent cue |
| `RemoveAllGameplayCues()` | Replicated | Remove all active cues |
| `ExecuteGameplayCueLocal(Tag, Params)` | Local | One-shot, no replication |
| `AddGameplayCueLocal(Tag, Params)` | Local | Add persistent, no replication |
| `RemoveGameplayCueLocal(Tag)` | Local | Remove persistent, no replication |
| `IsGameplayCueActive(Tag)` | Query | Check if cue is currently active |
| `AddGameplayCue_MinimalReplication(Tag, Params)` | Minimal | For minimal replication mode |
| `RemoveGameplayCue_MinimalReplication(Tag)` | Minimal | For minimal replication mode |
