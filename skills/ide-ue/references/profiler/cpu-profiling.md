# CPU Profiling in Unreal Engine

Comprehensive guide to identifying and resolving CPU bottlenecks in Unreal Engine projects.

## Stat Commands for CPU Analysis

### stat unit -- The Starting Point

`stat unit` displays the top-level frame time breakdown:

```
Frame:   14.23 ms
Game:     8.41 ms   <-- CPU game thread
Draw:     3.12 ms   <-- CPU render thread
GPU:      6.87 ms   <-- GPU execution
RHIT:     0.45 ms   <-- RHI thread
```

If **Game** is the largest number, you are CPU game-thread bound.
If **Draw** is the largest, you are CPU render-thread bound.

### stat game -- Game Thread Breakdown

Shows where game thread time is spent:

```
stat game
```

Key categories:
- **Tick** -- Actor and component tick functions
- **Physics** -- PhysX/Chaos simulation step
- **AI** -- Behavior trees, EQS, perception
- **Anim** -- Animation blueprint evaluation
- **Spawn** -- Actor construction and initialization
- **GC** -- Garbage collection pauses

Look for any single category exceeding 3-4ms at 60fps. That is your primary target.

### stat slow -- Catch Outliers

Displays anything exceeding a configurable threshold:

```
stat slow 0.5    -- Show anything taking > 0.5ms
stat slow 1.0    -- Show anything taking > 1.0ms
```

Useful for finding intermittent spikes. Leave it running during gameplay and watch for entries that appear sporadically -- these cause frame hitches.

### stat engine -- Engine Subsystem Costs

Breaks down engine-level subsystem costs:

```
stat engine
```

Shows:
- FrameTime
- GameEngine Tick
- World Tick Time
- Streaming volumes
- Level streaming
- Net tick time

### Additional CPU stat commands

```
stat Threading        -- Thread utilization overview
stat TaskGraph        -- Task graph execution stats
stat TickGroups       -- Per-tick-group timing
stat Collision        -- Collision query costs
stat Character        -- Character movement costs
stat NavMesh          -- Navigation mesh queries
stat Niagara          -- Niagara particle CPU costs
stat Net              -- Network replication overhead
stat Object           -- UObject allocation stats
```

## Unreal Insights

Unreal Insights is the modern replacement for the legacy profiler. It captures trace events to a file for offline analysis.

### Starting a Trace

From console:
```
Trace.Start default,cpu,frame,bookmark    -- Common CPU trace
Trace.Start default,cpu,frame,gpu,memory  -- Full trace
Trace.Stop                                 -- End capture
```

From command line (launch args):
```
-trace=default,cpu,frame,bookmark -tracehost=127.0.0.1
```

### Trace Channels

| Channel | What It Captures |
|---------|-----------------|
| `cpu` | All TRACE_CPUPROFILER scoped events |
| `frame` | Frame boundaries and timing |
| `bookmark` | Named bookmarks for navigation |
| `gpu` | GPU trace events (requires RHI support) |
| `memory` | Allocation tracking |
| `loadtime` | Asset loading and streaming |
| `assetloadtime` | Detailed per-asset load timing |
| `object` | UObject lifecycle events |
| `net` | Network replication events |
| `task` | Task graph scheduling |
| `log` | Log output as trace events |

### Analyzing Traces

1. Launch UnrealInsights: `Engine/Binaries/Win64/UnrealInsights.exe`
2. Open the `.utrace` file from `Saved/Profiling/`
3. Use the Timing Insights tab for CPU analysis
4. Look for:
   - Long bars in the game thread lane
   - Gaps between frames (idle/stall time)
   - Render thread waiting on game thread (or vice versa)
   - Task graph worker utilization

### Key Insights Features

- **Timing view**: Flame chart of all scoped events per thread
- **Counters**: Numeric stats over time (draw calls, triangles, memory)
- **Log panel**: Correlated log messages with timing
- **Callers/Callees**: Call graph for selected events
- **Aggregated stats**: Sort events by total/average/max time

## Cycle Counters and Scoped Timers

### SCOPE_CYCLE_COUNTER

Add to any C++ function to make it visible in `stat` groups:

```cpp
#include "Stats/Stats.h"

// Declare a stat group (in header or cpp)
DECLARE_STATS_GROUP(TEXT("MyGame"), STATGROUP_MyGame, STATCAT_Advanced);

// Declare individual stats
DECLARE_CYCLE_STAT(TEXT("Combat System Tick"), STAT_CombatTick, STATGROUP_MyGame);
DECLARE_CYCLE_STAT(TEXT("Damage Calculation"), STAT_DamageCalc, STATGROUP_MyGame);

// Use in functions
void UCombatComponent::TickComponent(float DeltaTime, ...)
{
    SCOPE_CYCLE_COUNTER(STAT_CombatTick);
    // ... your code ...

    {
        SCOPE_CYCLE_COUNTER(STAT_DamageCalc);
        CalculateDamage();
    }
}
```

View with:
```
stat MyGame
```

### TRACE_CPUPROFILER_EVENT_SCOPE

Lightweight tracing for Unreal Insights (no stat group overhead):

```cpp
#include "ProfilingDebugging/CpuProfilerTrace.h"

void UInventorySystem::ProcessLoot()
{
    TRACE_CPUPROFILER_EVENT_SCOPE(InventorySystem_ProcessLoot);

    for (auto& Item : PendingLoot)
    {
        TRACE_CPUPROFILER_EVENT_SCOPE(InventorySystem_ProcessSingleItem);
        AddItem(Item);
    }
}
```

These appear in Unreal Insights timing view but have zero overhead when tracing is disabled.

### TRACE_BOOKMARK

Mark specific moments in the trace for easy navigation:

```cpp
#include "ProfilingDebugging/MiscTrace.h"

TRACE_BOOKMARK(TEXT("Boss Fight Started"));
TRACE_BOOKMARK(TEXT("Wave %d Spawned"), WaveNumber);
```

### Quick Scoped Timer (Log Output)

For quick ad-hoc measurements without setting up stat groups:

```cpp
#include "ProfilingDebugging/ScopedTimers.h"

{
    FScopedDurationTimer Timer(MyAccumulator);
    // code to measure
}
// MyAccumulator now holds elapsed seconds (double)
```

Or log directly:

```cpp
{
    QUICK_SCOPE_CYCLE_COUNTER(STAT_MyQuickMeasurement);
    DoExpensiveWork();
}
```

## Task Graph Profiling

The task graph system distributes work across worker threads.

### Monitoring Task Graph

```
stat TaskGraph
```

Shows:
- Number of tasks dispatched
- Worker thread utilization
- Task queue depth
- Stalls from task dependencies

### Identifying Task Graph Issues

Common problems:
1. **Unbalanced work**: One worker has a 5ms task while others are idle. Split large tasks.
2. **Too many small tasks**: Scheduling overhead exceeds work. Batch small items.
3. **Dependency chains**: Tasks waiting on each other serializes execution. Restructure to allow parallelism.
4. **Game thread waiting on tasks**: `FTaskGraphInterface::Get().WaitUntilTaskCompletes()` on game thread blocks everything.

### Async Task Patterns

```cpp
// Fire-and-forget async work
AsyncTask(ENamedThreads::AnyBackgroundThreadNormalTask, [this]()
{
    TRACE_CPUPROFILER_EVENT_SCOPE(AsyncPathfinding);
    ComputeExpensivePath();
});

// ParallelFor for data-parallel work
ParallelFor(Items.Num(), [&](int32 Index)
{
    TRACE_CPUPROFILER_EVENT_SCOPE(ProcessItem);
    ProcessItem(Items[Index]);
});
```

## Tick Optimization

Actor and component ticks are the single most common source of CPU game thread bottlenecks.

### Diagnosing Tick Cost

```
stat TickGroups          -- Per-group timing
dumpticks               -- Log all ticking objects (warning: huge output)
stat slow 0.1           -- Catch individual expensive ticks
```

### Reduce Tick Frequency

Not everything needs to tick every frame:

```cpp
// In constructor or BeginPlay
PrimaryActorTick.TickInterval = 0.1f;  // 10 Hz instead of every frame

// For components
PrimaryComponentTick.TickInterval = 0.2f;  // 5 Hz
```

### Disable Tick Entirely

Many actors and components do not need tick at all:

```cpp
// Actor
PrimaryActorTick.bCanEverTick = false;

// Component
PrimaryComponentTick.bCanEverTick = false;

// Disable at runtime when not needed
SetActorTickEnabled(false);
SetComponentTickEnabled(false);
```

### Component Tick Groups

Control execution order to avoid unnecessary dependencies:

```cpp
// Tick before physics
PrimaryComponentTick.TickGroup = TG_PrePhysics;

// Tick after physics (most common)
PrimaryComponentTick.TickGroup = TG_DuringPhysics;

// Tick after all movement and physics
PrimaryComponentTick.TickGroup = TG_PostPhysics;

// Tick after everything else
PrimaryComponentTick.TickGroup = TG_PostUpdateWork;
```

### Significance-Based Tick

Use the Significance Manager to reduce tick rate for distant/unimportant objects:

```cpp
// Register with significance manager
USignificanceManager* SM = FSignificanceManagerModule::Get(GetWorld());
SM->RegisterObject(this, TAG_MyActor,
    FSignificanceManager::FSignificanceFunction::CreateLambda(
        [](USignificanceManager::FManagedObjectInfo* Info, const FTransform& ViewPoint) -> float
        {
            float Distance = FVector::Dist(
                Info->GetObject<AActor>()->GetActorLocation(),
                ViewPoint.GetLocation());
            // Return 0.0-1.0 significance based on distance
            return FMath::Clamp(1.0f - (Distance / 10000.0f), 0.0f, 1.0f);
        }
    ),
    FSignificanceManager::FPostSignificanceFunction::CreateLambda(
        [](USignificanceManager::FManagedObjectInfo* Info, float OldSig, float NewSig, bool bFinal)
        {
            AActor* Actor = Info->GetObject<AActor>();
            if (NewSig < 0.1f)
                Actor->SetActorTickInterval(1.0f);      // Far away: 1 Hz
            else if (NewSig < 0.5f)
                Actor->SetActorTickInterval(0.1f);       // Medium: 10 Hz
            else
                Actor->SetActorTickInterval(0.0f);       // Close: every frame
        }
    )
);
```

### Timer-Based Instead of Tick

Replace tick with timers for periodic logic:

```cpp
// Instead of checking a condition every frame in Tick():
GetWorldTimerManager().SetTimer(
    CheckTimerHandle,
    this,
    &AMyActor::CheckCondition,
    0.5f,    // Every 500ms
    true     // Looping
);
```

## Threading: Game Thread vs Render Thread vs Async

### Thread Architecture

Unreal runs three primary threads:

1. **Game Thread** -- All gameplay logic, Blueprint execution, physics dispatch, animation evaluation
2. **Render Thread** -- Scene proxy updates, draw command generation, render graph setup
3. **RHI Thread** -- Submits GPU commands to the graphics API

Plus worker threads for the Task Graph.

### Game Thread Stalls

The game thread can stall waiting on:
- **Render thread**: If render thread is behind, game thread blocks at frame sync. Visible in Insights as `FFrameEndSync`.
- **Async loading**: `LoadObject` / `StaticLoadObject` blocks. Use `StreamableManager` for async loads.
- **Flush commands**: `FlushRenderingCommands()` forces full GPU sync. Avoid in gameplay code.

### Render Thread Stalls

The render thread can stall waiting on:
- **Game thread**: Waiting for scene updates to complete
- **GPU**: Previous frame's GPU work not finished (GPU-bound)
- **Visibility**: Occlusion query readback latency

### Moving Work Off Game Thread

```cpp
// Background thread via AsyncTask
AsyncTask(ENamedThreads::AnyBackgroundHiPriTask, [WeakThis = MakeWeakObjectPtr(this)]()
{
    if (auto* This = WeakThis.Get())
    {
        TArray<FResult> Results = This->HeavyComputation();

        // Return results to game thread
        AsyncTask(ENamedThreads::GameThread, [WeakThis, Results = MoveTemp(Results)]()
        {
            if (auto* This = WeakThis.Get())
            {
                This->ApplyResults(Results);
            }
        });
    }
});
```

### Thread Safety Considerations

- UObject properties: read/write only on game thread (or with explicit synchronization)
- Render resources: modify only via render commands (`ENQUEUE_RENDER_COMMAND`)
- Shared data: use `FCriticalSection`, `FRWLock`, or lock-free structures
- Never call `GetWorld()`, `Spawn`, `Destroy` from background threads

## Common CPU Bottlenecks

### Physics (stat Physics)

Symptoms: `stat Physics` shows > 4ms
- **Too many bodies**: Merge collision, use simplified collision
- **Complex collision**: Use convex decomposition, not per-poly
- **Overlap queries**: Reduce overlap check frequency, use channels
- **Ragdoll**: Limit simultaneous ragdolls, reduce bone count
- **Chaos solver iterations**: Reduce `p.Chaos.Solver.Iterations` for distant objects

### Animation (stat Anim, stat Animation)

Symptoms: `stat Anim` shows high evaluation time
- **Too many skeletal meshes**: Use LOD to reduce bone count at distance
- **Complex anim graphs**: Simplify blend trees, use fast path
- **URO (Update Rate Optimization)**: Enable to reduce evaluation frequency at distance
- **Parallel evaluation**: Ensure `bAllowMultiThreadedAnimationUpdate` is true

```cpp
// Enable URO on skeletal mesh
SkeletalMeshComponent->bEnableUpdateRateOptimizations = true;
SkeletalMeshComponent->AnimUpdateRateParams->bShouldUseLodMap = true;
```

### AI (stat AI)

Symptoms: `stat AI` shows high perception or BT costs
- **Perception**: Reduce sight/hearing check frequency, limit max age
- **EQS**: Cache query results, reduce item count, use simpler tests first
- **Behavior Trees**: Avoid complex decorators that re-evaluate every frame
- **Navigation**: Use nav mesh instead of ray casts, cache paths

### Slate/UMG (stat Slate)

Symptoms: `stat Slate` shows > 2ms
- **Invisible widgets**: Collapse instead of hiding (Collapsed vs Hidden)
- **Binding complexity**: Avoid complex bindings that evaluate every frame
- **Widget count**: Reduce widget hierarchy depth, use virtualized lists
- **Invalidation box**: Wrap static UI regions in `SInvalidationPanel` / Invalidation Box

```
stat Slate              -- Overall Slate rendering cost
stat SlateMemory        -- Widget memory allocation
WidgetReflector         -- Visual widget hierarchy debugger (F9 in editor)
```

### Level Streaming

Symptoms: Hitches during level transitions
- **Blocking loads**: Use async loading with priority
- **Too much in one sublevel**: Split into smaller streaming volumes
- **GC after unload**: Spread GC across frames with incremental GC

```cpp
// Force incremental GC instead of full GC
GEngine->ForceGarbageCollection(false);  // false = incremental
```

### Blueprint VM Overhead

Symptoms: `stat game` shows high tick, specific BPs visible in Insights
- **Nativize hot paths**: Move frame-critical logic to C++
- **Reduce BP node count per tick**: Each node has VM dispatch overhead
- **Cache expensive lookups**: Store component references, avoid repeated GetComponentByClass
- **Use C++ base classes**: Implement core logic in C++, expose events/properties to BP
