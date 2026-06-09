# Performance Optimization Patterns

## Profile Before Optimizing
Always identify actual bottlenecks first:
- `stat unit` — frame time breakdown (Game, Draw, GPU, RHIT)
- `stat game` — game thread breakdown
- `stat gpu` — GPU breakdown
- **Unreal Insights** — comprehensive profiling
- **Gameplay Debugger** — per-actor debugging

---

## Event-Driven Over Tick-Dependent

Migrating from `Event Tick` to event-driven patterns yields 20-30% performance improvement.

| Instead of | Use |
|------------|-----|
| Tick + GetAllActorsOfClass | Register/unregister pattern in subsystem |
| Tick + distance check | Significance Manager |
| Tick + polling state | Delegates / OnRep callbacks |
| Tick + timer simulation | `SetTimer()` or `SetActorTickInterval()` |

Disable Tick: `PrimaryActorTick.bCanEverTick = false;` or `PrimaryComponentTick.bCanEverTick = false;`

---

## Significance Manager

Centralized framework for evaluating "significance" of managed objects. Objects adjust behavior based on significance value.

### How It Works
- Objects register with evaluation functions returning float significance
- During Update, function runs per transform provided (typically camera locations)
- PostSignificance callback fires to adjust behavior

### Applications
| Significance Level | Behavior |
|-------------------|----------|
| High (close to camera) | Full animation, AI, particles, tick rate |
| Medium | Reduced animation quality, simplified AI |
| Low | Minimal updates, instanced rendering |
| Off (very far) | No updates, invisible or culled |

### Budget Management
- Per-actor-type budgets (ensure player pawns always high-detail)
- Compensate for player clusters (limit high-detail AI count)
- Animation Budget Allocator: manages skeletal mesh CPU via significance

---

## Rendering Performance

### Nanite (Virtualized Geometry)
- Automatic LOD without manual LOD creation
- Virtualizes geometry → clusters based on screen-space polygon size
- Only processes visible detail
- **Targets**: Nanite < 8ms total; VisBuffer < 4ms, BasePass < 3ms
- Best for: detailed organic meshes, photogrammetry, complex terrain

### Culling Strategies
| Strategy | What It Does |
|----------|-------------|
| Frustum Culling | Only render objects in camera view |
| Occlusion Culling | Skip objects hidden behind others |
| Distance Culling | Remove objects beyond configurable distance |
| HLOD | Automatic simplified proxies for distant clusters |

### Instanced Static Meshes
Use ISM/HISM instead of placing many identical static meshes individually. Significantly reduces draw calls.

---

## Network Performance
(See networking.md for full details)

| Technique | Impact |
|-----------|--------|
| Push Model Replication | 2x+ improvement in NetBroadcastTickTime |
| FastArraySerializer | 10K items: 3ms → 0.05ms |
| Replication Graph | Spatial culling prevents N*M distance checks |
| Network Managers | Centralized replication for similar actors |
| SetReplicates(false) | Biggest single win — stop replicating what you don't need |

---

## Memory Optimization

### Soft References
Use `TSoftObjectPtr` / `TSoftClassPtr` for assets not needed immediately:
- Prevents cascading hard-reference chains
- Enables on-demand loading
- Reduces initial memory footprint

### Asset Bundles
Partition asset loading — load UI data without 3D meshes:
```cpp
UPROPERTY(meta = (AssetBundles = "UI"))
TSoftObjectPtr<UTexture2D> Icon;
```

### Object Pooling
For frequently spawned/destroyed objects (projectiles, effects):
- Pre-allocate pool at init
- Activate/deactivate instead of spawn/destroy
- Reset state on recycle

---

## Blueprint Performance

- **Pure functions in loops**: Execute N*2+1 times per ForEach (cache in local variable)
- **50-node rule**: Functions > 50 nodes → break down
- **Blueprint Interfaces**: Faster than casting, no memory bloat
- **Nativize hot paths**: Convert performance-critical Blueprints to C++

---

## GAS Performance

- **Replication Mode**: Use Minimal for AI (biggest network win)
- **Ability Batching**: Batch activations into single RPCs for rapid-fire
- **Cue Batching**: Combine cues into single network message
- **Lazy Loading**: Defer ability spec creation
- **Push Model**: Property-level dirty flags for frequent attribute changes
- **ASC Proxy**: Consolidate replication for multiple ASCs

---

## Profiling Commands Quick Reference

| Command | Purpose |
|---------|---------|
| `stat unit` | Frame time: Game/Draw/GPU/RHIT |
| `stat game` | Game thread breakdown |
| `stat gpu` | GPU cost breakdown |
| `stat net` | Network statistics |
| `stat scenerendering` | Rendering passes |
| `stat initviews` | Visibility/culling |
| `stat particles` | Particle system cost |
| `stat anim` | Animation evaluation cost |
| `profilegpu` | One-frame GPU capture |
| `Lyra.RepGraph.*` | Replication graph CVars |

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_play` | Start PIE under load | Run the scenario that reproduces the performance issue |
| `ue_get_logs` | Watch for hitches and warnings | `minVerbosity="Warning"`, `pattern="hitch\|dropped\|exceeded\|Stat"` — surface frame budget violations |
| `ue_execute_python` | Run profiling commands | `unreal.SystemLibrary.execute_console_command(world, "stat game")` to dump per-system timing |
| `search_symbol` | Find tick-heavy classes | `search_symbol("UActorComponent")` → `analyze_calls("Tick")` to find unexpected tickers |
| `analyze_calls` | Map the call graph of a hot function | Identify which callers drive the expensive function before optimizing |
| `xdebug_set_breakpoint` | Break on a specific hitching path | Conditional breakpoint: fire when frame time > threshold to catch the root call |
