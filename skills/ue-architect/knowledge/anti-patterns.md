# Common Anti-Patterns in UE Development

## Top 10 Most Damaging Anti-Patterns

### 1. Hard Reference Cascade ("Reference Chain Bomb")
**The Problem**: When Blueprint A references Blueprint B through a variable type, cast node, or inheritance, Unreal loads B and ALL its dependencies. This cascades: if B references C, D, E (each with meshes, textures, sounds), loading A pulls everything in. A single Blueprint can create thousands of asset references, causing minute-long load times and gigabytes of unnecessary memory.

**Fix**: Use soft references (`TSoftObjectPtr`, `TSoftClassPtr`), interfaces instead of casts, and C++ base classes for type casting (casting to C++ creates no hard reference; casting to Blueprint does).

### 2. God Class / God Actor
**The Problem**: One class accumulates all game logic — GameMode handles health, inventory, input, UI, networking, and saving. Impossible to maintain, test, or extend.

**Fix**: Single Responsibility Principle. Break into focused components: HealthComponent, InventoryComponent, InputComponent. Use subsystems for cross-cutting services.

### 3. Tick Abuse
**The Problem**: By default, most actors have Tick enabled. Running complex logic, GetAllActorsOfClass, or heavy computation every frame. Overhead compounds as entity counts grow.

**Fix**:
- Disable Tick on actors/components that don't need per-frame updates
- Use delegates, timers (`SetTimer`), and state-change callbacks
- Use `SetActorTickInterval` for periodic-but-not-every-frame logic
- Event-driven patterns yield 20-30% performance improvement

### 4. GetAllActorsOfClass in Tick
**The Problem**: Iterates ALL world actors every frame. Extremely expensive.

**Fix**: Cache references at spawn time. Use subsystems to register/unregister actors. Refresh caches only when composition changes.

### 5. Blueprint-to-Blueprint Casting
**The Problem**: The CPU cost of the cast is negligible (simple hierarchy traversal), but casting TO a Blueprint class creates a hard reference that loads the entire Blueprint + all its dependencies. This is the #1 cause of Reference Chain Bombs.

**Fix**: Cast to C++ base classes (no hard reference). Use interfaces (`UINTERFACE`) for cross-system queries. Use GameplayTags for state checking.

### 6. Deep Inheritance Hierarchies
**The Problem**: `ShooterCharacter -> CombatCharacter -> BaseCharacter -> AModularCharacter`. Adding a VehicleDriver that shares some shooter behavior means either duplicating code or creating diamond inheritance. Rigid, expensive to refactor, long compile times.

**Fix**: Composition over inheritance. Use ActorComponents for behavior. Use DataAssets for configuration. Use interfaces for polymorphism.

### 7. Not Using Init State Interface
**The Problem**: Components assuming other components are initialized in BeginPlay. Works in single-player editor, breaks in multiplayer where data replicates asynchronously.

**Fix**: Use `IGameFrameworkInitStateInterface` for coordinated multi-component initialization. Never assume data is available in BeginPlay.

### 8. Tight Coupling Between Core Game and Feature Plugins
**The Problem**: Core game references GameFeature plugin code, creating circular dependencies. Defeats the entire purpose of modular architecture. Adding/removing features requires core code changes.

**Fix**: Dependencies flow one way — features depend on core, never the reverse. Use interfaces, tags, and the component injection system for communication.

### 9. Reliable RPCs on Tick
**The Problem**: Reliable RPCs are resent until acknowledged. Calling them every tick overflows the reliable buffer, disconnecting players.

**Fix**: Use unreliable RPCs for per-tick data. Use replicated properties for persistent state. Reliable RPCs only for critical, infrequent events.

### 10. Replicating Everything by Default
**The Problem**: Marking all properties for replication and all actors as replicated. Most replication bandwidth and CPU time is wasted on data clients don't need.

**Fix**: Only replicate what clients need. Use `DOREPLIFETIME_CONDITION`. Use `SetReplicates(false)` for client-only actors. Derive state from existing replicated data.

---

## Networking Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| `GetPlayerController(0)` | Different results on server vs client | Use ownership queries |
| RPCs during BeginPlay | No NetConnection yet | Use Possessed/PostNetReceive |
| Delay nodes for replication | Timing is non-deterministic | Use OnRep callbacks |
| Multicast RPCs from clients | Execute locally only | Filter with HasAuthority() |
| FNames as RPC params | Full string each call | Use FGameplayTag or index |
| Replicating SkeletalMesh directly | Massive bandwidth | Replicate state flag + OnRep |

## GAS Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| Replicated meta attributes | Transient values sent over network | Keep server-only |
| Client-predicted projectiles | Non-predictable in GAS | Server spawns, client plays FX |
| All abilities granted at spawn | Memory/init cost | Lazy-load, grant from AbilitySets |
| Gameplay logic in GameplayCues | Desyncs in multiplayer | Cues are cosmetic only |
| No GrantedHandles tracking | Ability leaks on respawn | Store and cleanup handles |

## Architecture Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| Monolithic single module | Any change recompiles everything | Split into focused modules |
| Circular module dependencies | Build errors, architectural mess | Shared base module or interfaces |
| Editor code in runtime module | Bloats game builds | Separate editor module |
| Hardcoded game config | Requires recompilation for changes | DataAssets and DataTables |
| Monolithic item classes | Can't create new item types without code | Fragment pattern |
| Forgetting ExplicitlyLoaded flag | GameFeature loads at startup | Set true in .uplugin |

## Blueprint Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| Pure functions in loops | Executes N*2+1 times per loop | Cache in local variable |
| Functions > 50 nodes | Unreadable, unmaintainable | Break into sub-functions |
| No Blueprint interfaces | Casting everywhere = hard refs | Use interfaces for communication |
| All logic in Event Graph | Spaghetti | Use functions, macros, and components |

## Performance Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| No significance system | All AI at full fidelity | Use SignificanceManager |
| Identical static meshes placed individually | Draw call explosion | Use Instanced Static Mesh |
| Manual LODs with Nanite-suitable assets | Wasted artist time | Enable Nanite |
| Optimizing without profiling | Fixing wrong bottleneck | Profile first: stat unit, Insights |
| Complex AI for distant actors | Wasted CPU | LOD-based AI complexity |
