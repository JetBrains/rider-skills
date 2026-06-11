# Console Commands Reference

Comprehensive reference of Unreal Engine console commands for debugging, profiling, and diagnostics. Commands can be entered in the editor console (`~` key), via the `ue_execute_python` MCP tool with `unreal.SystemLibrary.execute_console_command(None, "<command>")`, or in config files. Overlay commands (`stat`/`show`/`viewmode`/`ShowDebug`) render in the viewport — verify with `take_screenshot`; text commands print to the log — read with `ue_get_logs`.

## Stat Commands — Performance Monitoring

### Frame Timing

| Command | Description |
|---------|-------------|
| `stat unit` | Core frame timing: GameThread, RenderThread, GPU, RHIT, Frame total. **Start here for performance.** |
| `stat unitgraph` | Same as stat unit but with a scrolling graph overlay |
| `stat fps` | Simple FPS counter in top-right corner |
| `stat raw` | Raw frame time without smoothing |
| `stat hitches` | Log when frame time exceeds a threshold |
| `t.HitchThreshold 0.05` | Set hitch detection threshold (seconds, default 0.05 = 50ms) |

### Game Thread

| Command | Description |
|---------|-------------|
| `stat game` | Game thread timing: tick, physics, blueprints, AI |
| `stat ai` | AI subsystem timing: pathfinding, perception, BT |
| `stat anim` | Animation evaluation, blending, skeletal mesh update |
| `stat physics` | PhysX/Chaos simulation, scene queries, contact generation |
| `stat collision` | Collision detection timing |
| `stat character` | Character movement component timing |
| `stat navmesh` | Navigation mesh queries and updates |
| `stat particles` | Particle system evaluation timing |
| `stat niagara` | Niagara particle system timing |

### Render Thread / GPU

| Command | Description |
|---------|-------------|
| `stat scenerendering` | Full render pass breakdown: basepass, shadows, translucency, post-process |
| `stat gpu` | GPU timing per render pass (requires `r.GPUStatsEnabled 1`) |
| `stat rhi` | Render Hardware Interface: draw calls, triangles, texture memory |
| `stat d3d12rhi` | DirectX 12 specific stats |
| `stat slate` | Slate UI rendering cost |
| `stat shadowrendering` | Shadow map rendering breakdown |
| `stat lightrendering` | Light rendering pass timing |
| `stat initviews` | Visibility computation, frustum culling, occlusion |

### Memory

| Command | Description |
|---------|-------------|
| `stat memory` | Overview: physical, virtual, GPU, texture memory |
| `stat memoryplatform` | Platform-specific memory stats |
| `stat memorystatic` | Static allocations breakdown |
| `stat texturestats` | Texture memory by category |
| `stat levels` | Loaded/visible streaming levels and their memory |
| `stat streaming` | Asset streaming status and bandwidth |
| `stat streamingdetails` | Detailed streaming LOD/mip information |

### Network

| Command | Description |
|---------|-------------|
| `stat net` | Network overview: ping, packet loss, bandwidth in/out |
| `stat nettraffic` | Per-actor replication bandwidth |

### Object System

| Command | Description |
|---------|-------------|
| `stat obj` | UObject allocation stats |
| `stat gc` | Garbage collection timing and frequency |
| `stat threading` | Thread utilization and task stats |

### Toggling Stats Off

```
stat none          — Disable ALL stat displays at once
stat unit          — Toggle: run again to turn off
```

## Show Commands — Visual Debugging

Toggle visual debugging overlays in the viewport.

| Command | Description |
|---------|-------------|
| `show collision` | Show collision geometry (wireframe) |
| `show bounds` | Show actor/component bounding boxes |
| `show navigation` | Show navigation mesh |
| `show volumes` | Show trigger volumes, blocking volumes, etc. |
| `show bsp` | Show BSP geometry |
| `show staticmeshes` | Toggle static mesh rendering |
| `show skeletalmeshes` | Toggle skeletal mesh rendering |
| `show particles` | Toggle particle rendering |
| `show fog` | Toggle fog rendering |
| `show postprocessing` | Toggle all post-processing |
| `show bloom` | Toggle bloom effect |
| `show lensflares` | Toggle lens flares |
| `show decals` | Toggle decal rendering |
| `show tessellation` | Toggle tessellation |
| `show dynamicshadows` | Toggle dynamic shadows |
| `show translucency` | Toggle translucent rendering |
| `show velocitydrawing` | Show velocity buffer (motion blur debug) |

### View Modes

```
viewmode wireframe          — Wireframe rendering
viewmode unlit              — Unlit (no lighting)
viewmode lit                — Default lit mode
viewmode detail_lighting    — Lighting only
viewmode lighting_only      — Lighting without textures
viewmode lightcomplexity    — Heatmap of light overlap
viewmode shadercomplexity   — Heatmap of shader cost
viewmode lightmapdensity    — Lightmap texel density
viewmode LODcoloration      — Color-code LOD levels
```

## Log Commands — Runtime Log Control

### Set Log Category Verbosity

```
log <Category> <Level>
```

Levels: `Fatal`, `Error`, `Warning`, `Display`, `Log`, `Verbose`, `VeryVerbose`, `All`, `Off`

**Common categories:**
```
log LogTemp Verbose              — Enable verbose temporary logging
log LogBlueprintUserMessages All — See all Blueprint Print String output
log LogScript Warning            — Blueprint VM script errors
log LogGarbage Verbose           — GC detailed logging (very noisy)
log LogStreaming Verbose         — Asset streaming details
log LogNet Verbose               — Network replication details
log LogOnline Verbose            — Online subsystem details
log LogAINavigation Verbose      — AI navigation details
log LogAnimation Verbose         — Animation system details
log LogPhysics Verbose           — Physics system details
log LogSlate Verbose             — UI framework details
log LogUMG Verbose               — UMG widget details
log LogLoad Verbose              — Asset loading details
log LogPakFile Verbose           — Pak file operations
log LogConfig Verbose            — Config file loading details
```

### Log File Control

```
log logfile <filename>          — Redirect log output to a specific file
log flush                       — Flush log buffer to disk immediately
```

### Suppress / Unsuppress

```
log LogPhysics off              — Silence a noisy category
log LogPhysics Warning          — Re-enable at Warning+ level
```

## Memory Commands

| Command | Description |
|---------|-------------|
| `memreport` | Summary memory report written to `Saved/Profiling/MemReports/` |
| `memreport -full` | Detailed memory report with per-class UObject breakdown |
| `obj list` | List all loaded UObjects grouped by class, with counts and memory |
| `obj list class=StaticMesh` | List all loaded StaticMesh objects |
| `obj list class=Texture2D` | List all loaded textures with memory sizes |
| `obj gc` | Force immediate garbage collection |
| `obj refs name=MyObjectName` | Show reference chain keeping an object alive (GC debug) |
| `obj mark` | Mark current objects (for delta tracking) |
| `obj markcheck` | Show objects created since last `obj mark` |
| `obj dump <ObjectPath>` | Dump all properties of a specific object |
| `mem detailed` | Detailed memory allocator stats |
| `mem stat` | Memory allocator summary |
| `rhi.DumpMemory` | Dump GPU memory allocations |

### Finding Memory Leaks

```
1. obj mark                     — Baseline
2. <perform suspected leaking operation>
3. obj markcheck                — See what new objects appeared
4. obj gc                       — Force GC
5. obj markcheck                — Remaining objects = potential leaks
6. obj refs name=<LeakedObj>    — Find who's holding the reference
```

## Debug Drawing and HUD

### ShowDebug

```
ShowDebug                       — Toggle debug HUD
ShowDebug BONES                 — Show skeletal mesh bones
ShowDebug ANIMATION             — Show animation state info
ShowDebug AI                    — Show AI debug info (BT, perception)
ShowDebug PHYSICS               — Show physics body debug
ShowDebug CAMERA                — Show camera debug info
ShowDebug INPUT                 — Show input state
ShowDebug COLLISION             — Show collision responses
ShowDebug NET                   — Show network replication debug
ShowDebug MOVEMENT              — Show movement component debug
ShowDebug ABILITYSYSTEM         — Show GAS debug info
```

### Debug Drawing Console Variables

```
p.VisualizeSimulation 1         — Visualize physics simulation
ai.debug.nav 1                  — Show AI navigation debug
VisualizeTexture <name>         — Display a render target in viewport
r.VisualizeBuffer <name>        — Display a GBuffer channel
```

## Network Debugging

| Command | Description |
|---------|-------------|
| `stat net` | Overview: ping, in/out bandwidth, packet loss |
| `stat nettraffic` | Per-actor bandwidth usage |
| `net PktLag=<ms>` | Simulate network latency (milliseconds) |
| `net PktLoss=<percent>` | Simulate packet loss (0-100) |
| `net PktOrder=1` | Simulate out-of-order packets |
| `net PktDup=<percent>` | Simulate duplicate packets |
| `net PktLagVariance=<ms>` | Jitter / latency variance |
| `p.NetShowCorrections 1` | Show physics replication corrections |
| `p.NetCorrectionLifetime 5` | How long to display corrections (seconds) |
| `net.Replication.DebugProperty 1` | Log property replication |
| `net.DormancyEnable 0` | Disable dormancy (debug replication issues) |
| `log LogNet Verbose` | Verbose network logging |
| `log LogRep Verbose` | Verbose replication logging |

### Network Emulation Profiles

```
net PktLag=100 PktLoss=5        — Simulate bad connection (100ms lag, 5% loss)
net PktLag=200 PktLoss=10       — Simulate terrible connection
net PktLag=0 PktLoss=0          — Reset to no emulation
```

## Profiling and Insights

### CPU Profiling (stat files)

```
stat startfile                  — Begin recording .ue4stats profile to Saved/Profiling/
stat stopfile                   — Stop recording
```
Open the resulting `.ue4stats` file in **Session Frontend** (Window > Developer Tools > Session Frontend > Profiler tab).

### Unreal Insights (UE5 preferred profiler)

```
-tracehost=127.0.0.1            — Launch arg: connect to Insights server
-trace=cpu,gpu,frame,memory     — Launch arg: specify trace channels
-statnamedevents                — Launch arg: include stat named events in trace

Trace.Start cpu,gpu,frame       — Console command: start tracing at runtime
Trace.Stop                      — Console command: stop tracing
Trace.Bookmark <name>           — Console command: insert a named marker
```

Open traces with **UnrealInsights** tool (shipped with the engine).

### GPU Profiling

```
r.GPUStatsEnabled 1             — Enable GPU timing queries
profilegpu                      — Print GPU timing for current frame
r.RHICmdBypass 0                — Disable parallel command list (isolate GPU timing)
stat gpu                        — Persistent GPU timing overlay
```

### Frame Profiling

```
stat dumpframe                  — Dump current frame stats to log
stat dumphitches                — Dump hitch report to log
stat dumpave                    — Dump averaged stats to log
stat dumpnonframe               — Dump non-frame-aligned stats
```

## Useful Console Variables (CVars)

### Rendering Debug

```
r.ScreenPercentage 50           — Reduce render resolution (GPU bound test)
r.SetRes 1280x720               — Set render resolution
r.AllowOcclusionQueries 0       — Disable occlusion culling
r.DefaultFeature.AntiAliasing 0 — Disable AA
sg.PostProcessQuality 0         — Minimum post-process
foliage.DensityScale 0          — Remove foliage (perf test)
r.Shadow.MaxResolution 512      — Reduce shadow quality
grass.FlushCache                — Clear grass cache
```

### Gameplay Debug

```
p.VisualizeSimulation 1         — Physics debug rendering
ai.DebugEnabled 1               — Enable AI debugging
AbilitySystem.Debug.Enabled 1   — GAS debug output
fx.Niagara.Debug.Enabled 1      — Niagara debug
wp.Runtime.Debug 1              — World Partition debug
```

### Build / Cook Debug

```
-LogCmds="LogCook Verbose"      — Verbose cook logging (command line arg)
-LogCmds="LogPakFile Verbose"   — Verbose pak file logging (command line arg)
```
