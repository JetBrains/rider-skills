# Memory Profiling in Unreal Engine

Comprehensive guide to identifying and resolving memory issues in Unreal Engine projects.

## Memreport -- Full Memory Snapshot

### Running Memreport

```
Memreport -full
```

Outputs a detailed memory breakdown to `Saved/Profiling/MemReports/`. The report includes:
- Platform physical/virtual memory usage
- Per-category allocations (textures, meshes, audio, etc.)
- Loaded object counts by class
- Texture streaming pool status
- RHI resource memory

### Reading the Report

Key sections to examine:

```
// Top of report -- system-level overview
Platform Memory Stats:
  Physical Memory Used:   4.21 GB
  Virtual Memory Used:    8.67 GB
  Peak Physical:          5.14 GB

// Object memory by class
Object class breakdown:
  Texture2D:              847 objects,   1.23 GB
  StaticMesh:             1241 objects,  456.7 MB
  SkeletalMesh:           34 objects,    234.1 MB
  SoundWave:              412 objects,   189.3 MB
  Material:               623 objects,   78.4 MB
  AnimSequence:           156 objects,   67.2 MB
```

Focus on the largest consumers first. Textures and meshes typically dominate.

### Automating Memory Snapshots

Run `Memreport -full` through `ue_execute_python`:

```python
import unreal
unreal.SystemLibrary.execute_console_command(None, "Memreport -full")
```

Then read the output in logs using ue_get_logs MCP tool.

### Comparing Reports

Diff two Memreport files to find memory growth:
- Rising object counts indicate a leak (objects created but never destroyed)
- Rising texture memory without new content loading suggests streaming issues
- Rising "Unmapped" or "Unknown" memory points to native allocations outside UObject tracking

## Low Level Memory Tracker (LLM)

LLM tracks every allocation by tag, providing frame-by-frame memory trends that Memreport cannot.

### Enabling LLM

From command line launch args:
```
-LLM
-LLMCSV              -- Also export CSV for offline analysis
-LLMTag=RenderTargets,Textures  -- Track specific tags only
```

From console at runtime:
```
stat LLM             -- Summary view (top-level categories)
stat LLMFULL         -- Detailed view (all tags)
```

### LLM Categories

| Tag | What It Tracks |
|-----|---------------|
| `Total` | All tracked allocations |
| `Untracked` | Allocations without LLM tags |
| `Textures` | All texture memory |
| `Meshes` | Vertex/index buffers for meshes |
| `Audio` | Audio sample data and buffers |
| `Animation` | Animation sequence data |
| `Physics` | Physics engine allocations (Chaos/PhysX) |
| `RenderTargets` | Render target surfaces |
| `RHIMisc` | Miscellaneous RHI resources |
| `UObject` | UObject headers and properties |
| `EngineMisc` | Engine subsystem allocations |
| `TaskGraph` | Task graph worker memory |
| `Particles` | Niagara/Cascade particle data |
| `AI` | AI subsystem memory |
| `Navigation` | NavMesh data |
| `Shaders` | Compiled shader bytecode |

### LLM CSV Analysis

When launched with `-LLMCSV`, LLM writes per-frame CSV files to `Saved/Profiling/LLM/`:

```
Saved/Profiling/LLM/
  LLM_<timestamp>.csv          -- Summary tags
  LLMPlatform_<timestamp>.csv  -- Platform-specific tags
```

Import into a spreadsheet or graphing tool. Plot each tag over time to find:
- **Steady growth**: Memory leak in that category
- **Sudden jumps**: Level load or large asset load
- **Sawtooth pattern**: Allocate-then-GC cycle (normal but check amplitude)

### Custom LLM Tags

Add project-specific LLM tracking in C++:

```cpp
#include "HAL/LowLevelMemTracker.h"

void UInventorySystem::LoadItems()
{
    LLM_SCOPE_BYTAG(Inventory);  // Must register tag first
    // All allocations in this scope are tagged "Inventory"
    Items = LoadAllItems();
}
```

Register custom tags:

```cpp
// In your module's startup
LLM_DEFINE_TAG(Inventory, NAME_None, TEXT("Inventory"), GET_STATFNAME(STAT_InventoryLLM), FColor::Cyan);
```

## Object Commands: obj list / obj gc

### obj list -- Enumerate UObjects

```
obj list                        -- List all UObjects (very large output)
obj list class=Texture2D       -- Filter by class
obj list class=StaticMesh      -- All loaded static meshes
obj list class=Actor           -- All actors in the world
obj list class=SoundWave       -- All loaded sounds
```

Output includes object name, outer, flags, and size. Pipe to log for analysis:

```
obj list class=Texture2D -alphasort
```

### obj gc -- Force Garbage Collection

```
obj gc                          -- Force full GC pass
```

Run `obj gc` then `obj list` to see what survives. Objects that persist after GC but should have been collected indicate reference leaks.

### Detecting UObject Leaks

Workflow for finding leaked UObjects:

1. Establish baseline after level load:
   ```
   obj gc
   obj list class=YourActorClass
   ```
   Record the count.

2. Perform the action suspected of leaking (e.g., spawn/destroy cycle).

3. Force GC and re-check:
   ```
   obj gc
   obj list class=YourActorClass
   ```

4. If count increased, objects are being retained. Find the holder:
   ```
   obj refs name=LeakedObjectName
   ```
   This shows what references the leaked object.

### obj refs -- Reference Chain

```
obj refs name=MyLeakedActor_42
```

Displays the reference chain keeping an object alive. Common culprits:
- Delegates still bound to a destroyed object
- Arrays/Maps holding stale UObject pointers
- Timer handles referencing destroyed actors
- Subsystems caching references without clearing

## Texture Memory

### Texture Streaming Stats

```
stat Streaming
```

Key metrics:
- **Streaming Pool Size**: Configured maximum (`r.Streaming.PoolSize`)
- **Required Size**: What all visible textures want at full resolution
- **Over Budget**: Amount exceeding the pool (triggers quality downgrade)
- **Num Textures**: Total managed textures
- **Pending Requests**: Textures waiting to stream in

### Diagnosing Texture Memory Issues

```
r.Streaming.PoolSize              -- Show current pool (MB)
r.Streaming.PoolSize 2048         -- Set to 2 GB
ListTextures                      -- Full texture list with sizes
stat TexturePool                  -- Texture pool breakdown
r.Streaming.FullyLoadUsedTextures 1  -- Debug: force full res (OOM risk)
```

### Texture Memory Optimization

1. **Compression**: Always use hardware-compressed formats.

   | Format | Ratio | Use Case |
   |--------|-------|----------|
   | BC1/DXT1 | 8:1 | Opaque textures without alpha |
   | BC3/DXT5 | 4:1 | Textures with alpha channel |
   | BC5 | 4:1 | Normal maps (two-channel) |
   | BC7 | 4:1 | High-quality with optional alpha |
   | ASTC 4x4 | 8:1 | Mobile (highest quality ASTC) |
   | ASTC 6x6 | 12:1 | Mobile (balanced) |
   | ASTC 8x8 | 16:1 | Mobile (aggressive compression) |

2. **Max texture size**: Override per-texture in Texture Editor > Maximum Texture Size. Not every texture needs 4096x4096.

3. **LOD Bias per texture group**: In `DefaultEngine.ini`:
   ```ini
   [/Script/Engine.TextureLODSettings]
   @TextureLODGroups=Group
   TextureLODGroups=(Group=TEXTUREGROUP_World, MinLODSize=1, MaxLODSize=2048, LODBias=1)
   TextureLODGroups=(Group=TEXTUREGROUP_Character, MinLODSize=1, MaxLODSize=2048, LODBias=0)
   ```

4. **Virtual Textures**: For landscapes and mega-textures, enable Runtime Virtual Texturing to page texture data on demand instead of loading full textures.

5. **Texture sharing**: Reuse textures across materials with tiling. A single 1K tiling rock texture is cheaper than twenty unique 2K rock textures.

## Mesh Memory and Instancing

### Mesh Memory Stats

```
stat MeshMemory         -- Per-mesh memory breakdown
stat StaticMesh         -- Static mesh rendering stats
```

### Reducing Mesh Memory

1. **LODs**: Each LOD reduces vertex/index buffer memory. A mesh with 50K triangles at LOD0 and 5K at LOD2 saves 90% memory at distance.

2. **Instancing**: Instanced Static Meshes share a single mesh buffer across all instances.
   ```
   // Memory comparison:
   // 1000 individual Static Meshes: 1000 * MeshSize + 1000 * PerActorOverhead
   // 1 ISM with 1000 instances:     1 * MeshSize + 1000 * TransformSize(64 bytes)
   ```

3. **Nanite**: Nanite meshes use compressed cluster hierarchies. Disk size is larger but runtime memory is typically comparable or smaller because only visible clusters are resident.

4. **Vertex reduction**: Use the Mesh Reduction settings in the Static Mesh Editor. Target 50% reduction per LOD level.

5. **Remove unused UV channels**: Extra UV channels consume vertex buffer memory. Strip channels not used by materials.

### Per-Mesh Memory Audit

```cpp
// Log mesh memory at runtime
for (TObjectIterator<UStaticMesh> It; It; ++It)
{
    UStaticMesh* Mesh = *It;
    int32 Bytes = Mesh->GetResourceSizeBytes(EResourceSizeMode::EstimatedTotal);
    if (Bytes > 1024 * 1024) // > 1 MB
    {
        UE_LOG(LogTemp, Warning, TEXT("Large mesh: %s = %.2f MB"),
            *Mesh->GetName(), Bytes / (1024.f * 1024.f));
    }
}
```

## Audio Memory

### Audio Memory Stats

```
stat Audio              -- Audio system overview
stat SoundWaves         -- Per-wave memory usage
stat SoundCues          -- Cue playback stats
```

### Audio Memory Optimization

1. **Streaming**: Enable streaming for sounds > 200 KB. In Sound Wave properties: `bStreaming = true`.
   ```
   // Non-streaming: entire sound loaded into memory
   // Streaming: only current decode buffer in memory (~256 KB per active stream)
   ```

2. **Compression quality**: Reduce quality for ambient sounds. Set `CompressionQuality` (0-100) in Sound Wave.
   ```ini
   # Per-platform compression in DefaultEngine.ini
   [Audio]
   OggQuality=40          ; Desktop
   OpusQuality=30         ; Mobile
   ```

3. **Max concurrent sounds**: Limit `MaxChannels` in Audio Settings to prevent excessive decode buffers.

4. **Sound groups**: Use Sound Concurrency to limit simultaneous instances of similar sounds (e.g., max 3 gunshot sounds).

5. **Unload unused**: Call `USoundWave::FreeResources()` or rely on GC for sounds no longer referenced.

## Memory Leak Detection

### Systematic Leak Detection Workflow

1. **Baseline**: After initial load, force GC and capture Memreport:
   ```
   obj gc
   Memreport -full
   ```

2. **Stress test**: Perform the suspected leaking action repeatedly (load/unload level, spawn/destroy actors, open/close UI).

3. **Re-measure**: Force GC and capture another Memreport:
   ```
   obj gc
   Memreport -full
   ```

4. **Compare**: Diff the two reports. Focus on:
   - Object count increases per class
   - Memory growth in specific categories
   - Texture count growth without new content

5. **Isolate**: Use `obj refs` to trace reference chains for leaked objects.

### Common Leak Patterns

**Delegate leaks**: Binding to a delegate without unbinding on destroy:
```cpp
// BAD: delegate leak
void AMyActor::BeginPlay()
{
    SomeSubsystem->OnEvent.AddDynamic(this, &AMyActor::HandleEvent);
}

// GOOD: clean up in EndPlay
void AMyActor::EndPlay(EEndPlayReason::Type Reason)
{
    SomeSubsystem->OnEvent.RemoveDynamic(this, &AMyActor::HandleEvent);
    Super::EndPlay(Reason);
}
```

**Timer leaks**: Timers holding references to destroyed objects:
```cpp
// GOOD: clear timers on destroy
void AMyActor::EndPlay(EEndPlayReason::Type Reason)
{
    GetWorldTimerManager().ClearAllTimersForObject(this);
    Super::EndPlay(Reason);
}
```

**Widget leaks**: UI widgets stored in TSharedPtr without clearing:
```cpp
// GOOD: null out widget references
void UMyHUD::RemoveFromParent()
{
    if (CachedWidget.IsValid())
    {
        CachedWidget->RemoveFromParent();
        CachedWidget.Reset();
    }
    Super::RemoveFromParent();
}
```

**TArray/TMap holding UObject pointers**: Containers that grow but never shrink:
```cpp
// BAD: never cleaned
TArray<AActor*> ProcessedActors;

// GOOD: periodic cleanup
void CleanupStaleReferences()
{
    ProcessedActors.RemoveAll([](AActor* A) { return !IsValid(A); });
}
```

## Garbage Collection Optimization

### GC Stats

```
stat GC                 -- GC timing and frequency
stat Object             -- UObject allocation stats
```

### GC Settings

```
gc.TimeBetweenPurgingPendingKillObjects    -- Seconds between GC passes (default: 60)
gc.MaxObjectsNotConsideredByGC             -- Objects below this count skip GC mark (default: 0)
gc.NumRetriesBeforeForcingGC               -- Retries before forcing GC on allocation failure
gc.MinGCClusterSize                        -- Minimum objects for cluster GC
```

### Incremental GC

Full GC pauses can cause frame hitches (5-50ms depending on object count). Incremental GC spreads work across frames:

```
gc.IncrementalBeDestructive 0              -- Allow incremental destruction
gc.MaxObjectsInEditor 0                    -- No limit in editor
```

In C++:
```cpp
// Request incremental GC instead of full
GEngine->ForceGarbageCollection(false);  // false = incremental

// Or schedule timed incremental collection
GetWorld()->ForceGarbageCollection(false);
```

### Cluster GC

Cluster GC groups related objects so they are collected together, reducing GC traversal:

```cpp
// Enable clustering for a class
virtual bool ImplementsGetOwnerCluster() override { return true; }

// In class declaration
virtual void GetOwnerCluster(TArray<UObject*>& OutCluster) override
{
    OutCluster.Add(OwnedComponent1);
    OutCluster.Add(OwnedComponent2);
    // All objects in cluster are collected as a unit
}
```

Engine classes like Actor already implement clustering for their components.

### Reducing GC Pressure

1. **Object pooling**: Reuse actors instead of spawn/destroy cycles.
   ```cpp
   // Pool pattern
   AActor* Pool::Acquire()
   {
       if (Available.Num() > 0)
       {
           AActor* Actor = Available.Pop();
           Actor->SetActorHiddenInGame(false);
           Actor->SetActorEnableCollision(true);
           Actor->SetActorTickEnabled(true);
           return Actor;
       }
       return GetWorld()->SpawnActor<AActor>(PooledClass);
   }

   void Pool::Release(AActor* Actor)
   {
       Actor->SetActorHiddenInGame(true);
       Actor->SetActorEnableCollision(false);
       Actor->SetActorTickEnabled(false);
       Available.Add(Actor);
   }
   ```

2. **Reduce UObject count**: Use structs (FStruct) instead of UObjects where lifecycle management is not needed. Structs are not GC-tracked.

3. **Avoid frequent spawn/destroy**: Each destroyed UObject becomes pending-kill and waits for GC. Rapid spawn/destroy creates GC pressure.

4. **Pre-allocate containers**: Use `Reserve()` on TArray/TMap to avoid repeated allocations during gameplay.

## Memory Budgets by Platform

### Reference Budgets

| Platform | Total RAM | Available to Game | Texture Budget | Mesh Budget | Audio Budget |
|----------|----------|-------------------|---------------|------------|-------------|
| PC (Low) | 8 GB | ~4 GB | 1.5 GB | 800 MB | 256 MB |
| PC (High) | 16 GB | ~8 GB | 3 GB | 1.5 GB | 512 MB |
| PS5 | 16 GB | ~12 GB | 4 GB | 2 GB | 512 MB |
| Xbox Series X | 16 GB | ~12 GB | 4 GB | 2 GB | 512 MB |
| Xbox Series S | 10 GB | ~7 GB | 2.5 GB | 1 GB | 256 MB |
| Switch | 4 GB | ~2.5 GB | 768 MB | 512 MB | 128 MB |
| Mobile (High) | 6 GB | ~2 GB | 512 MB | 384 MB | 128 MB |
| Mobile (Low) | 3 GB | ~1 GB | 256 MB | 192 MB | 64 MB |

These are approximate and vary by game type. Open-world games need more texture/mesh budget; linear games can allocate more to audio and effects.

### Platform-Specific Considerations

**Console (PS5/Xbox)**:
- Fixed memory target -- budget carefully and test on hardware
- Use `FPlatformMemory::GetStats()` for accurate platform memory usage
- Memory warnings fire at 90% usage -- treat as hard limit
- Unified memory architecture means GPU and CPU share the pool

**PC**:
- Variable hardware requires scalable memory usage
- Use texture quality settings to scale texture pool
- Monitor `FPlatformMemory::GetConstants().TotalPhysical` for user's RAM
- Implement memory-based quality auto-detection at startup

**Mobile**:
- OS kills background apps aggressively -- stay under ~70% of device RAM
- Texture compression (ASTC) is critical for fitting in budget
- Use `FPlatformMemory::GetStats()` to detect low-memory situations
- Implement `FCoreDelegates::GetMemoryTrimDelegate()` to release caches on warning

**Switch**:
- Tightest memory budget of current platforms
- Aggressive LOD and texture downscaling required
- Consider separate asset packages with lower-resolution content
- Monitor with Switch-specific profiling tools (Nintendo SDK)

### Device Profile Memory Optimization (Mobile)

Device profiles in `DefaultDeviceProfiles.ini` are the primary tool for setting per-device memory budgets. Key CVars to configure per tier:

```ini
; Low-end mobile
+CVars=r.Streaming.PoolSize=256         ; Texture streaming pool (MB)
+CVars=r.RenderTargetPoolMin=100        ; Render target pool minimum (MB)
+CVars=fx.GPUSimulationTextureSizeX=256 ; Particle simulation texture
+CVars=fx.GPUSimulationTextureSizeY=128
+CVars=r.FreeSkeletalMeshBuffers=1      ; Free CPU-side buffers after GPU upload
+CVars=r.MaterialQualityLevel=0         ; Low quality materials

; Mid-range mobile
+CVars=r.Streaming.PoolSize=490
+CVars=r.RenderTargetPoolMin=140
+CVars=fx.GPUSimulationTextureSizeX=512
+CVars=fx.GPUSimulationTextureSizeY=256
+CVars=r.FreeSkeletalMeshBuffers=1
+CVars=r.MaterialQualityLevel=2         ; Medium quality

; High-end mobile
+CVars=r.Streaming.PoolSize=768
+CVars=r.RenderTargetPoolMin=200
+CVars=fx.GPUSimulationTextureSizeX=1024
+CVars=fx.GPUSimulationTextureSizeY=512
+CVars=r.MaterialQualityLevel=1         ; High quality
```

Combine with TextureLODGroups per tier to cap max texture resolution:

```ini
; Low tier: cap world textures at 1024
+TextureLODGroups=(Group=TEXTUREGROUP_World,MinLODSize=1,MaxLODSize=1024,LODBias=1)

; Mid tier: allow 2048
+TextureLODGroups=(Group=TEXTUREGROUP_World,MinLODSize=1,MaxLODSize=2048,LODBias=0)
```

### Memory Budget Monitoring at Runtime

```cpp
// Check memory usage at runtime
FPlatformMemoryStats MemStats = FPlatformMemory::GetStats();
float UsedGB = MemStats.UsedPhysical / (1024.0 * 1024.0 * 1024.0);
float TotalGB = MemStats.TotalPhysical / (1024.0 * 1024.0 * 1024.0);
float UsagePercent = (UsedGB / TotalGB) * 100.0f;

UE_LOG(LogMemory, Log, TEXT("Memory: %.2f / %.2f GB (%.1f%%)"),
    UsedGB, TotalGB, UsagePercent);

if (UsagePercent > 85.0f)
{
    UE_LOG(LogMemory, Warning, TEXT("Memory usage critical -- triggering cleanup"));
    // Flush texture streaming pool
    IStreamingManager::Get().GetTextureStreamingManager().SetPoolSize(
        PoolSizeReduced);
    // Force GC
    GEngine->ForceGarbageCollection(true);
}
```

### stat Memory Quick Reference

```
stat Memory             -- High-level memory summary
stat MemoryPlatform     -- Platform-specific memory stats
stat MemoryStaticMesh   -- Static mesh memory
stat MemorySkeletalMesh -- Skeletal mesh memory
stat LLM               -- Low Level Memory Tracker (summary)
stat LLMFULL            -- Low Level Memory Tracker (all tags)
Memreport -full         -- Full report to file
obj list                -- All UObjects
obj gc                  -- Force garbage collection
r.Streaming.PoolSize    -- Texture pool size
stat Streaming          -- Texture streaming status
stat TexturePool        -- Texture pool breakdown
```
