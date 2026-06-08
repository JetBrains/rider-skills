# Core Architecture Principles for Unreal Engine

## The Five Pillars of UE Architecture

### 1. Composition Over Inheritance
The single most important principle in modern UE development. Instead of deep class hierarchies:
- **Use ActorComponents** to add behavior to actors (HealthComponent, InventoryComponent, AbilityComponent)
- **Use DataAssets** to define configuration (PawnData, AbilitySets, ExperienceDefinitions)
- **Use Fragments** for extensible item/entity definitions (InventoryItemFragments)
- **Use GameFeature plugins** to inject features without modifying core classes

**Lyra example**: `ALyraCharacter` is thin — all behavior comes from `ULyraPawnExtensionComponent`, `ULyraHealthComponent`, `ULyraCameraComponent`, and `ULyraHeroComponent`. The character class itself has minimal logic.

**Why this matters**: Inheritance creates rigid hierarchies that are expensive to refactor. A `ShooterCharacter` that inherits from `BaseCharacter` breaks when you need a `VehicleDriver` that shares some but not all shooter behavior. Components allow mixing and matching.

### 2. Data-Driven Configuration
Gameplay behavior should be defined in data, not code:
- **DataAssets** (UPrimaryDataAsset) for immutable game definitions
- **DataTables** for tabular data (stats, loot tables, difficulty curves)
- **GameplayTags** for hierarchical labeling and querying
- **Soft References** for lazy-loaded assets

**Lyra example**: `ULyraPawnData` bundles PawnClass + AbilitySets + InputConfig + CameraMode. Designers create new pawn variants by creating new DataAssets — zero code required.

**Rule of thumb**: If a designer needs to create a new variant of something, it should require creating a DataAsset, not a C++ class.

### 3. Modular Plugin Architecture
Organize code into isolated, purpose-driven modules and plugins:
- **Core game module**: Fundamental gameplay framework (no content-specific code)
- **Utility plugins**: Reusable systems (messaging, UI extensions, async patterns)
- **GameFeature plugins**: Content + mechanics that activate/deactivate at runtime
- **Editor module**: Editor-only tools and validators

**Lyra example**: 14 utility plugins + 5 GameFeature plugins. Core `LyraGame` module knows nothing about `ShooterCore` or `TopDownArena`.

### 4. Explicit Lifecycle Management
Never assume initialization order. Use explicit coordination:
- **IGameFrameworkInitStateInterface** for component initialization ordering
- **Delegates and callbacks** for "call when ready" patterns
- **Experience loading states** for game mode initialization
- **OnRep callbacks** for network state arrival

**Lyra example**: PawnExtensionComponent coordinates all pawn features through a 4-state init chain: Spawned → DataAvailable → DataInitialized → GameplayReady.

### 5. Decoupled Communication
Systems should not directly reference each other:
- **GameplayMessageRouter** for cross-system event messaging
- **Gameplay Tags** for type-safe labeling without class coupling
- **Interfaces** (UINTERFACE) for capability queries without casting
- **Delegates** for observer patterns
- **Subsystems** for service location

**Lyra example**: When a player eliminates another, a `FLyraVerbMessage` is broadcast. The accolade system, UI, and stats system all subscribe independently — none knows about the others.

---

## SOLID Principles in UE Context

### Single Responsibility (SRP)
Each class/component handles ONE concern:
- `ULyraHealthComponent` — health, damage, death (nothing else)
- `ULyraEquipmentManagerComponent` — equip/unequip items
- `ULyraTeamSubsystem` — team registration and comparison

**Anti-pattern**: A `PlayerManager` class that handles health, inventory, input, UI, networking, and saving.

### Open/Closed (OCP)
Extend behavior without modifying existing code:
- DataAssets define new variants (new PawnData = new character type)
- GameFeature plugins add mechanics (new weapon type = new plugin)
- Fragments add capabilities to items (new fragment = new item behavior)

**Anti-pattern**: Adding `if (WeaponType == Shotgun)` branches to a base weapon class.

### Liskov Substitution (LSP)
Subclasses must honor base class contracts:
- All Lyra framework classes inherit from `AModular*` base classes
- Any `ULyraGameplayAbility` subclass works in any AbilitySet
- Any `ULyraCameraMode` subclass works in the camera stack

### Interface Segregation (ISP)
Keep interfaces minimal and focused:
- `ILyraTeamAgentInterface` — only team-related methods
- `IAbilitySystemInterface` — only ASC access
- `IPickupable` — only pickup behavior

### Dependency Inversion (DIP)
Depend on abstractions, not concretions:
- GameFeature actions reference actor classes by `TSubclassOf<>`, not concrete types
- Message routing uses `FGameplayTag` channels, not direct function calls
- Input binds to tags that trigger abilities, not directly to ability classes

---

## Key Architectural Decisions Checklist

When designing a new system, answer these questions:

1. **Ownership**: Which actor/object owns this data? Who has authority?
2. **Lifetime**: How long does this data/system live? (Engine? GameInstance? World? Actor?)
3. **Replication**: Does this need to replicate? To whom? How often?
4. **Extensibility**: Will designers need to create new variants? → Use DataAssets
5. **Dependencies**: What does this system need to know about? → Minimize with interfaces/tags
6. **Initialization**: When is this data available? → Use init state or delegates
7. **Cleanup**: How is this cleaned up? → Match lifetime to appropriate UE object

---

## Production Patterns from Epic (Fortnite/Lyra)

### Pattern: Experience-Driven Architecture
- A single `ExperienceDefinition` DataAsset describes an entire game mode
- Experiences compose: GameFeature plugins + PawnData + Actions + ActionSets
- Server loads experience → enables plugins → executes actions → notifies clients
- Clients react to replicated experience state, never drive it

### Pattern: Action-Based Feature Injection
- `UGameFeatureAction` subclasses define what happens when a feature activates
- AddAbilities, AddWidgets, AddInputBinding, AddInputContextMapping
- Actions execute in order during experience loading, reverse during unloading
- Zero coupling: actions reference target types, not specific implementations

### Pattern: Tag-Based Communication
- Everything is tagged: abilities, items, teams, states, input, messages
- Tags form hierarchies: `Ability.ActivateFail.IsDead`, `Status.Death.Dying`
- Tag matching enables powerful queries without type coupling
- Tag stacks (FGameplayTagStack) add counting for ammo, charges, scores

### Pattern: Fast Array Replication
- Equipment, Inventory, Character Parts all use `FFastArraySerializer`
- Only changed entries replicate (delta serialization)
- Callbacks: PreReplicatedRemove, PostReplicatedAdd, PostReplicatedChange
- Client-side spawning driven by replication callbacks

---

## Architecture Scale Guide

| Project Scale | Architecture Investment |
|---------------|----------------------|
| **Prototype/Jam** | Minimal. Single module, basic components, direct references OK |
| **Small Indie (1-3 devs)** | Basic module split (Game + Editor). DataAssets for key configs. Components for major systems |
| **Medium (4-10 devs)** | Full module architecture. GameFeature plugins for content. Subsystems for services. GAS for abilities |
| **Large (10+ devs)** | Lyra-level architecture. Experience system. Modular gameplay. Custom replication graph. Full testing pipeline |
| **AAA/Live Service** | Fortnite-level. All of the above plus custom networking, Mass Entity for scale, CI/CD pipeline, automated testing |
