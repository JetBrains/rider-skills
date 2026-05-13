# Decision Frameworks — When to Use What

## Combat/Ability System Selection

| Need | Solution |
|------|----------|
| Abilities with cooldowns, costs, prediction | GAS (Gameplay Ability System) |
| Simple health + damage, no abilities | Custom HealthComponent + damage interface |
| RPG with complex stat interactions | GAS with multiple AttributeSets and Execution Calculations |
| Action game with cancel/combo chains | GAS with Activation Groups (Exclusive_Replaceable) |
| Simple buff/debuff system | GAS GameplayEffects + Tags |
| Prototype / early development | Start simple, migrate to GAS when complexity grows |

## Actor vs Component vs Subsystem

| Need | Use |
|------|-----|
| Physical presence in the world | Actor |
| Reusable behavior attached to actors | ActorComponent |
| Service accessible by many systems (no world presence) | Subsystem |
| Shared state replicated to all clients | Replicated Actor (e.g., GameState) |
| Per-player local service | LocalPlayerSubsystem |
| Level-scoped service | WorldSubsystem |
| Session-persisted service | GameInstanceSubsystem |

## Data Storage Decision

| Data Type | Store In |
|-----------|----------|
| Immutable game definitions (items, abilities) | DataAsset (UPrimaryDataAsset) |
| Tabular data (stats, loot tables, curves) | DataTable |
| Player preferences (settings, keybinds) | SaveGame / LocalPlayerSubsystem |
| Per-match state (scores, kills) | Replicated properties on GameState/PlayerState |
| Ability states (cooldowns, stacks) | GAS (GameplayEffects, Tags) |
| Runtime item instances | Replicated via FastArraySerializer |
| Editor configuration | DeveloperSettings / EditorSettings |

## Communication Pattern Selection

| Need | Pattern |
|------|---------|
| One-to-many notifications on same actor | Delegates (FOnHealthChanged) |
| Cross-system loose coupling | GameplayMessageRouter with tag channels |
| Capability query without type coupling | Interfaces (UINTERFACE) |
| Component initialization ordering | IGameFrameworkInitStateInterface |
| Service location | Subsystem::Get(WorldContext) |
| Tag-based state queries | GameplayTags on ASC or containers |
| Replicated state arrival | OnRep callbacks |
| Feature injection into actors | UGameFrameworkComponentManager |

## Networking Architecture

| Game Type | Architecture |
|-----------|-------------|
| Single-player | No replication needed |
| Co-op (2-4 players) | Listen Server, basic replication |
| Competitive small (up to 16) | Dedicated or Listen Server, standard replication |
| Battle Royale / large (50+) | Dedicated Server + Replication Graph |
| MMO / persistent world | Dedicated Server + custom networking, spatial sharding |

## Replication Strategy

| Data Characteristics | Strategy |
|---------------------|----------|
| Changes every frame (position) | Replicated property + quantization |
| Changes rarely | Push Model replication |
| Array of items | FastArraySerializer |
| Many similar actors | Network Manager pattern |
| Interdependent properties | Atomic struct with NetSerialize |
| Cosmetic/transient event | Unreliable Multicast RPC |
| Critical one-time event | Reliable RPC |

## AI System Selection

| Need | System |
|------|--------|
| Complex sequential behaviors (established) | Behavior Trees |
| State-driven AI with clear transitions | State Trees (5.6+) |
| Hundreds/thousands of similar entities | Mass Entity (ECS) |
| Simple patrol/chase | Basic AI Controller + MoveTo |
| Game flow / phase management | State Trees (non-AI use) |
| Spatial queries (find cover, patrol points) | EQS |
| World interaction points | Smart Objects |

## Plugin Architecture

| Content Type | Plugin Type |
|-------------|-------------|
| Reusable cross-project utility | Utility Plugin |
| Game mode + mechanics | GameFeature Plugin |
| Editor-only tools | Editor Plugin or Editor module |
| Third-party library | ThirdParty Plugin |
| Core framework | Runtime Module in main project |

## UI Architecture

| Widget Type | Approach |
|------------|----------|
| Persistent HUD elements | UIExtension point in Game layer |
| Modal dialogs | Activatable Widget in Modal layer |
| Full-screen menus | Activatable Widget in Menu layer |
| In-game menus (inventory, map) | Activatable Widget in GameMenu layer |
| Tooltips, floating text | Non-activatable widget, manual management |
| Cross-feature HUD injection | UIExtension system with tag-based slots |

## Input System

| Need | Approach |
|------|----------|
| Standard gameplay input | Enhanced Input with Mapping Contexts |
| Ability-triggered actions | Input Action → Tag → ASC → Ability |
| Context-switching (combat → vehicle) | Swap Mapping Contexts at runtime |
| UI input | CommonUI input routing |
| Modular input from features | GameFeatureAction_AddInputContextMapping |

## Scale-Appropriate Architecture

| Team Size | Key Architectural Investments |
|-----------|------------------------------|
| Solo | Don't over-engineer. Single module. Basic components. DataAssets for tuning. |
| 2-3 | Module split (Game + Editor). Component-based pawn. Basic subsystems. |
| 4-10 | Full modular architecture. GameFeatures. GAS. Init state. Testing. |
| 10+ | Lyra-level. Experience system. Custom replication graph. CI/CD. |
| 50+ | All above + Mass Entity, distributed builds, content pipelines. |

## "Should I Use This Pattern?" Quick Check

### Experience System
- Yes if: Multiple game modes, runtime mode switching, DLC/seasonal content
- No if: Single game mode, simple project, prototype

### GAS
- Yes if: Multiple abilities/effects, multiplayer with prediction, complex stat interactions
- No if: Simple health/damage only, single-player prototype

### Replication Graph
- Yes if: 20+ players, large worlds, many replicated actors
- No if: Co-op (<8 players), small maps

### Mass Entity
- Yes if: Hundreds+ similar entities, performance-critical, data-oriented team
- No if: <50 unique actors, Blueprint-heavy project

### GameFeature Plugins
- Yes if: Modular content, multiple developers, DLC plans, seasonal content
- No if: Solo developer, single game mode, no modularity needs

### Init State Interface
- Yes if: Multiple components needing coordinated initialization, multiplayer
- No if: Simple single-component actors, single-player only
