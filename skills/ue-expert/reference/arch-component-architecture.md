# Component Architecture & Init State System

## Component-Based Design in UE

### When to Use Components vs. Inheritance

| Use Components (Composition) | Use Inheritance |
|------------------------------|-----------------|
| Behavior is optional or reusable across unrelated actor types | Genuine "is-a" relationship with universal shared behavior |
| Functionality likely changes independently | Core identity that all subtypes share |
| Need to mix-and-match features on actors | Overriding virtual functions for polymorphism |
| Designers should toggle features on/off | |

### Lyra's Component Architecture
`ALyraCharacter` is deliberately thin. All behavior comes from focused components:

| Component | Responsibility |
|-----------|---------------|
| `ULyraPawnExtensionComponent` | Init state coordination, ASC setup, PawnData management |
| `ULyraHealthComponent` | Health attribute tracking, damage/death state machine |
| `ULyraCameraComponent` | Camera mode management, mode stack blending |
| `ULyraHeroComponent` | Player input binding, camera mode selection |
| `ULyraPawnComponent_CharacterParts` | Cosmetic character part management |

Each handles exactly ONE concern. No component knows implementation details of others — they communicate through init state, delegates, and interfaces.

---

## IGameFrameworkInitStateInterface

### The Problem It Solves
Multiple components on an actor depend on each other during initialization. Without coordination:
- Component A needs data from Component B, which hasn't initialized yet
- Adding a Delay/Timer is fragile and non-deterministic
- BeginPlay order is not guaranteed across components

### The Solution: Init State Chain

Four states, progressing in order:
```
InitState_Spawned → InitState_DataAvailable → InitState_DataInitialized → InitState_GameplayReady
```

| State | Meaning | When |
|-------|---------|------|
| Spawned | Component exists on actor | After component registration |
| DataAvailable | Required data has arrived (PawnData, PlayerState replicated) | After replication or server setup |
| DataInitialized | Component has consumed its data and configured itself | After processing data |
| GameplayReady | All components ready for gameplay | After all components reach DataInitialized |

### How It Works
1. Components implement `IGameFrameworkInitStateInterface`
2. Register with `UGameFrameworkComponentManager` from `OnRegister`
3. In `BeginPlay`, call `BindOnActorInitStateChanged` to listen for sibling state changes
4. Call `CheckDefaultInitialization()` to attempt advancing through chain
5. When one component advances, it notifies others → cascade of transitions
6. All components eventually reach GameplayReady

### Key Methods
```cpp
// Check if transition is valid
virtual bool CanChangeInitState(UGameFrameworkComponentManager* Manager,
    FGameplayTag CurrentState, FGameplayTag DesiredState) const;

// Execute transition logic
virtual void HandleChangeInitState(UGameFrameworkComponentManager* Manager,
    FGameplayTag CurrentState, FGameplayTag DesiredState);

// React to other components' state changes
virtual void OnActorInitStateChanged(const FActorInitStateChangedParams& Params);

// Attempt to advance through states
virtual void CheckDefaultInitialization();
```

### Lyra's Init Flow Example

```
1. Pawn spawns with PawnExtensionComponent + HeroComponent
2. PawnExtensionComponent registers as "PawnExtension" feature
3. HeroComponent registers as "Hero" feature
4. Both enter Spawned state
5. Server sets PawnData → PawnExtension transitions to DataAvailable
6. PawnExtension initializes ASC → transitions to DataInitialized
7. HeroComponent sees PawnExtension is DataInitialized
8. HeroComponent binds input, sets camera → transitions to DataInitialized
9. Both reach GameplayReady → gameplay begins
```

### Debugging
- `Log LogModularGameplay Verbose` for detailed init state logging
- `ModularGameplay.DumpGameFrameworkComponentManagers` to inspect injection state

---

## Modular Gameplay Actor Pattern

### Base Classes (ModularGameplayActors Plugin)
| Class | Extends |
|-------|---------|
| `AModularCharacter` | ACharacter |
| `AModularPawn` | APawn |
| `AModularPlayerController` | APlayerController |
| `AModularPlayerState` | APlayerState |
| `AModularGameModeBase` | AGameModeBase |
| `AModularGameMode` | AGameMode |
| `AModularGameStateBase` | AGameStateBase |
| `AModularAIController` | AAIController |

### What They Do
Minimal implementations that register with `UGameFrameworkComponentManager`:
```
PreInitializeComponents() → Register with component manager
BeginPlay() → Broadcast GameActorReady event
EndPlay() → Unregister from component manager
```

This enables runtime component injection from GameFeature plugins without any coupling.

### Component Injection Flow
```
1. GameFeature plugin activates
2. AddComponents action calls ComponentManager->AddComponentRequest(ActorClass, ComponentClass)
3. ComponentManager watches for actors of that class
4. When matching actor spawns, ComponentManager injects component
5. Component receives init state events, initializes normally
6. When feature deactivates, injected components are removed
```

---

## Extension Handler Pattern

For GameFeature plugins that need to run custom logic when actors spawn:

```cpp
// In your GameFeatureAction:
void AddToWorld(const FWorldContext& WorldContext) {
    UGameFrameworkComponentManager* Manager = ...;
    Manager->AddExtensionHandler(
        AMyCharacter::StaticClass(),
        UGameFrameworkComponentManager::FExtensionHandlerDelegate::CreateUObject(
            this, &ThisClass::HandleActorExtension));
}
```

The handler fires when actors of the specified class register with the component manager.

---

## When to Use Each Communication Pattern

| Pattern | Use When |
|---------|----------|
| Init State Interface | Component initialization ordering on same actor |
| Delegates / Events | One-to-many notifications (OnHealthChanged, OnTeamChanged) |
| Interfaces (UINTERFACE) | Capability queries without type coupling (IPickupable) |
| GameplayMessageRouter | Cross-system messaging (kill events, achievements) |
| Direct reference | Tightly coupled components on same actor (HeroComponent → PawnExtension) |
| Subsystem lookup | Service location (TeamSubsystem, GlobalAbilitySystem) |

---

## Anti-Patterns

- **Assuming component init order**: Use init state interface, not implicit ordering
- **BeginPlay for cross-component setup**: Data may not be replicated yet
- **Deep inheritance instead of components**: Leads to diamond problem, rigid hierarchies
- **Not registering with ComponentManager**: Components never receive injected features
- **Tick-based polling for initialization**: Use event-driven init state callbacks
- **Monolithic Actor classes**: All logic in one class instead of focused components
- **Components that know about each other's internals**: Use interfaces/delegates for communication
