# Experience System & GameFeature Architecture

## Overview

The Experience System is Lyra's most distinctive architectural pattern — it enables loading entirely different game modes at runtime without code changes. It is Epic's recommended approach for production games needing runtime-configurable game modes.

## Core Classes

### ULyraExperienceDefinition (DataAsset)
Defines a complete playable experience:
```cpp
UPROPERTY() TArray<FString> GameFeaturesToEnable;              // Plugin URLs to load
UPROPERTY() TObjectPtr<const ULyraPawnData> DefaultPawnData;   // Default pawn configuration
UPROPERTY() TArray<UGameFeatureAction*> Actions;               // Actions to execute
UPROPERTY() TArray<ULyraExperienceActionSet*> ActionSets;      // Composable action bundles
```

**Key design decision**: Experiences CANNOT inherit from each other. Composition through Action Sets is the reuse mechanism.

### ULyraExperienceActionSet (DataAsset)
Composable bundles of actions shared across experiences:
```cpp
UPROPERTY() TArray<UGameFeatureAction*> Actions;
UPROPERTY() TArray<FString> GameFeaturesToEnable;
```
Example: Elimination and Control game types share input bindings and HUD widgets through shared ActionSets.

### ULyraExperienceManagerComponent (GameState Component)
Manages the experience lifecycle. State machine:
```
Unloaded → Loading → LoadingGameFeatures → LoadingChaosTestingDelay → ExecutingActions → Loaded → Deactivating
```

Three priority delegates for experience-loaded notifications:
1. **OnExperienceLoaded_HighPriority**: Team creation, core subsystem setup
2. **OnExperienceLoaded**: Main gameplay initialization
3. **OnExperienceLoaded_LowPriority**: Bot spawning, late-init systems

**Critical**: `BeginPlay` does NOT mean gameplay begins. Actors must use `CallOrRegister_OnExperienceLoaded()` to know when to start.

## Experience Loading Flow

```
1. Server: GameMode calls SetCurrentExperience(FPrimaryAssetId)
2. Manager loads ExperienceDefinition DataAsset
3. Manager loads all referenced ActionSets
4. Manager loads all GameFeature plugins (dependency order)
5. Manager instantiates and executes all UGameFeatureAction instances
6. Delegates broadcast: HighPriority → Normal → LowPriority
7. CurrentExperience replicates to clients
8. Clients run same action sequence locally
```

## GameFeature Actions

### Built-in Custom Actions (Lyra)

**UGameFeatureAction_AddAbilities**
- Grants abilities, attribute sets, and ability sets to actors matching a class
- Configurable: ActorClass → Array of (Abilities + Attributes + AbilitySets)
- Tracks granted handles for proper cleanup

**UGameFeatureAction_AddWidgets**
- Adds HUD layout widgets and element widgets
- Uses UIExtension system with tag-based slot IDs
- Two categories: Layout requests (with layer tags) and Element entries (with slot tags)

**UGameFeatureAction_AddInputBinding**
- Extends ULyraInputConfig to local players
- Adds ability-input action bindings via pawn extension system

**UGameFeatureAction_AddInputContextMapping**
- Maps UInputMappingContext with priority to players
- Full lifecycle: Registering → Activating → Deactivating → Unregistering

**UGameFeatureAction_AddGameplayCuePath**
- Adds directory paths to GameplayCue notify paths

**UGameFeatureAction_SplitscreenConfig**
- Voting system for splitscreen enable/disable

### Base Pattern: UGameFeatureAction_WorldActionBase
All world-scoped actions inherit from this. It binds to `GameInstance->OnGameInstanceStart` to activate per-world.

## Component Injection

The `UGameFrameworkComponentManager` subsystem handles runtime component injection:

1. **Actor registration**: In `PreInitializeComponents()`, actors register with component manager
2. **Ready broadcast**: In `BeginPlay()`, actors broadcast `GameActorReady`
3. **Extension handlers**: GameFeature actions subscribe via `AddExtensionHandler` to inject components
4. **Cleanup**: In `EndPlay()`, actors unregister; injected components are automatically cleaned up

## Design Principles

### Why Experience-Based (not GameMode inheritance)
- GameMode inheritance creates rigid hierarchies; changing weapons means a new GameMode subclass
- Experiences compose: same core + different weapons + different HUD = different DataAsset, not code
- Experiences can activate/deactivate dynamically (entering/leaving game zones)
- Content designers create new experiences without code changes

### Why Action Sets (not Experience inheritance)
- Actions are the unit of reuse, not experiences
- Multiple experiences share the same input bindings, HUD elements, or ability sets
- Adding a new feature to all shooter modes = adding to one ActionSet

### Chaos Testing
Built-in delay injection (`lyra.chaos.ExperienceDelayLoad.MinSecs`) tests staggered client readiness. Essential for catching timing bugs in multiplayer.

## Implementing Your Own Experience System

1. Create `UMyExperienceDefinition` DataAsset with relevant configuration
2. Create `UMyExperienceManagerComponent` on GameState
3. Implement the state machine (at minimum: Loading → Loaded)
4. Fire delegates when loaded so all systems can initialize
5. Create custom `UGameFeatureAction` subclasses for your project's needs
6. Use `CallOrRegister_OnExperienceLoaded()` pattern everywhere

## Anti-Patterns

- Loading experiences synchronously (blocks the main thread; always use async)
- Not waiting for OnExperienceLoaded before initializing gameplay systems
- Referencing GameFeature plugin code from the core game module
- Editing GameFeature plugin content while the plugin is in Active state
- Hard-coding game mode logic instead of composing via actions
- Forgetting to set `ExplicitlyLoaded: true` in GameFeature `.uplugin` files
