# AI Architecture in Unreal Engine

## Behavior Trees vs State Trees

| Aspect | Behavior Trees | State Trees |
|--------|---------------|-------------|
| Execution | Continuously re-evaluates from root each tick | On-demand via transitions |
| Structure | Selectors, sequences, decorators | States with explicit transitions |
| State Visibility | Implicit (determined by traversal) | Explicit (named states) |
| CPU Overhead | Higher (constant re-evaluation) | Lower (on-demand transitions) |
| Maturity | Battle-tested, stable | Newer; recommended 5.6+ for production |
| Best For | Complex sequential/parallel behaviors | State-driven AI with clear transitions |

### Behavior Tree Architecture
- **Blackboard**: Shared data store for AI decisions
- **Services**: Run periodically on composite nodes (update blackboard)
- **Tasks**: Leaf nodes that DO things (move, attack, wait)
- **Decorators**: Conditions on branches (can enter? should abort?)
- **EQS (Environment Query System)**: Find locations/actors meeting criteria

### State Tree Architecture
- **Hybrid**: Combines behavior tree selectors with state machine transitions
- **Hierarchical**: Selecting a leaf activates all states root→leaf; parents stay active
- **Data binding**: Tasks access data from earlier tasks, parents, evaluators
- **Critical gotchas**:
  - Multiple active states cause unexpected transition cascading
  - "On State Completed" fires when ANY child task finishes, terminating siblings
  - Global tasks in linked subtrees with parameters can crash
  - UE 5.5 significantly improved; 5.6/5.7 recommended for production

### When to Choose Which
- **Behavior Tree**: Established AI patterns, complex behavior compositions, need stability
- **State Tree**: Clearer state visualization, better CPU efficiency, game flow management (not just AI)
- **State Tree for non-AI**: Game phases, menu flows, ability state machines

---

## Mass Entity / ECS Architecture

Epic's archetype-based ECS framework, originally for Matrix Awakens crowd simulations.

### Core Concepts
| Concept | Description |
|---------|-------------|
| Entity | Lightweight integer ID (data-only, no logic) |
| Fragment (`FMassFragment`) | Per-entity data struct (position, velocity, health) |
| Shared Fragment | Data shared across same-archetype entities |
| Constant Shared Fragment | Read-only shared config data |
| Tag | Empty struct for filtering (presence = data) |
| Archetype | Set of fragments+tags defining entity type; stored in contiguous memory |
| Processor | Stateless logic per frame during specified phases |
| Observer | Event-driven processor on fragment/tag add/remove |
| Trait | Bundle of fragments + processors for cohesive feature |

### Performance Model
- **Struct-of-arrays**: Tightly packed in memory chunks for cache efficiency
- **Batch processing**: Processors iterate over fragment arrays, not individual entities
- **Command buffer**: Composition changes deferred to prevent mid-iteration archetype migration
- Handles thousands of entities simultaneously at minimal cost

### Mass Gameplay Systems
- **Mass Representation**: Visual LOD transitions (ISM → Actor → invisible)
- **Mass Spawner**: Entity creation via Entity Template Registry
- **Mass LOD**: Distance + screen-size LOD calculation
- **Mass Replication**: Network replication for Mass entities

### When to Use Mass
- **Hundreds to thousands** of similar entities (crowds, flocks, traffic, vegetation)
- Need **cache-efficient batch processing**
- Entities are primarily data, not individual UObjects
- Performance is critical and traditional actors won't scale

### When NOT to Use Mass
- Few unique actors with complex individual behavior
- Heavy Blueprint-driven gameplay
- Traditional actor systems work fine at your scale
- Team isn't familiar with data-oriented design (steep learning curve)

---

## AI Perception System
- **Sight, Hearing, Damage, Touch, Team, Prediction** senses
- Configured per-AI actor via `UAIPerceptionComponent`
- Stimulus-based: sources emit stimuli, perception processes them
- Integration with Behavior Trees via Blackboard decorators

## Smart Objects
- World-placed objects that provide AI interaction points
- Tagged with capabilities (sit, use_terminal, hide_behind)
- Claimed/released by AI using the smart object system
- Integrate with State Trees for behavior on interaction

---

## Best Practices
1. **Profile AI cost**: Use `stat AI` and Gameplay Debugger
2. **LOD AI complexity**: Full behavior near camera, simplified at distance
3. **Use Significance Manager**: Adjust AI tick rate and behavior complexity
4. **Batch similar AI**: Use Mass Entity for crowds, traditional actors for bosses/companions
5. **Decouple AI from animation**: AI decides, animation system executes
6. **Favor State Trees for new projects** (5.6+): Better tooling, lower CPU overhead

## Anti-Patterns
- Running full AI on every NPC regardless of distance
- Using Tick for AI decisions instead of Behavior Tree/State Tree services
- Not using EQS for spatial queries (manual GetAllActorsOfClass is expensive)
- Putting movement logic in AI controller instead of movement component
- Not leveraging Mass Entity for crowd scenarios
