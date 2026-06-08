---
name: ue:profiler
description: "Use when user asks about performance profiling, frame rate drops, GPU bottlenecks, CPU optimization, memory usage, draw calls, shader complexity, stat commands, Unreal Insights, or performance budgets. DO NOT TRIGGER for debugging crashes (use ue:debugger), building (use ue:builder), writing optimization code (use ue:coder), or architecture questions (use ue:architect)."
allowed-tools: Bash, Read
argument-hint: "[performance issue or profiling task]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions, fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# UE Profiler Skill

Profile and optimize Unreal Engine project performance using stat commands, Unreal Insights, GPU profiling, memory analysis, and platform-specific tools.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Identify bottleneck** — CPU vs GPU vs memory vs draw calls; gather stat commands output
2. **Measure baseline** — capture Unreal Insights trace or GPU Visualizer frame
3. **Optimize** — apply targeted fix (LOD, culling, batching, shader complexity, etc.)
4. **Verify** — re-measure; confirm improvement without regression

## CRITICAL -- Mistakes That Waste Hours

These eight rules prevent the most common profiling errors. Violating any of them produces misleading data and wasted effort.

1. **Profile in SHIPPING or TEST config** -- Development builds include debug checks, stats overhead, and unoptimized code paths. A function that takes 2ms in Development may take 0.3ms in Shipping. Always profile in the config that matches your target. Use TEST config when you need stat commands in a near-shipping environment.

2. **Disable editor overhead: use Standalone Game or packaged build, not PIE** -- Play-In-Editor runs Slate ticks, editor subsystems, reference tracking, and GC pressure from editor objects. A scene that runs at 120fps standalone may show 60fps in PIE. Launch with `-game` flag or use a packaged build. If you must use PIE, subtract ~3-5ms of baseline editor overhead from your measurements.

3. **`stat unit` shows FRAME time, not just GPU/CPU -- identify the actual bottleneck first** -- `stat unit` displays Frame, Game (CPU game thread), Draw (CPU render thread), GPU, and RHIT times. The frame time equals the SLOWEST of these. If Game=8ms, Draw=4ms, GPU=14ms, you are GPU-bound. Do not optimize CPU when the GPU is the bottleneck. Always start with `stat unit`.

4. **GPU profiler (`ProfileGPU`) gives per-pass breakdown -- don't guess which pass is slow** -- Run `ProfileGPU` (or `stat GPU`) to see exactly how many milliseconds each render pass takes: BasePass, Shadows, Lighting, Translucency, PostProcessing. Guessing leads to optimizing the wrong pass. The breakdown tells you precisely where to focus.

5. **Draw calls: batching helps but instancing is better -- check `stat SceneRendering` first** -- High draw call count is a symptom, not a diagnosis. `stat SceneRendering` shows mesh draw calls, dynamic primitives, and static primitives. Merging actors helps but adds memory. Instanced Static Meshes or ISM/HISM components reduce both draw calls and memory. Nanite eliminates traditional draw call concerns for supported geometry.

6. **Memory: `Memreport` gives a snapshot, not trends -- use LLM (Low Level Memory Tracker) for trends** -- `Memreport -full` is excellent for a point-in-time breakdown but cannot show leaks or growth over time. Enable LLM tags (`-llm` or `-LLMTag`) and use `stat LLM` / `stat LLMFULL` to watch memory categories frame-over-frame. Export CSV for analysis of long-running sessions.

7. **Blueprint nativization won't fix BP tick -- the real fix is moving hot loops to C++** -- Nativization converts BP to C++ at cook time but does not eliminate VM overhead for complex graphs. If a Blueprint ticks every frame with heavy logic, the correct fix is implementing that logic in a native C++ component and calling it from BP only for setup/events. Profile with `stat Game` to find expensive BP ticks.

8. **Texture streaming pool: 1GB default is too low for open-world -- check `r.Streaming.PoolSize`** -- The default streaming pool (1024 MB) causes aggressive quality drops in large worlds. Visible as blurry textures that never resolve. Check `stat Streaming` for pool usage. Set `r.Streaming.PoolSize` to 2048-4096 for open-world on PC/console. On mobile, keep it at 256-512 and rely on aggressive LODs.

## Profiling Workflow

Follow this workflow for every profiling session:

### Step 1: Identify the Bottleneck

```
# Run in standalone game or packaged build
stat unit
```

Read the output:
- **Frame** > 16.67ms = below 60fps target
- Compare **Game**, **Draw**, **GPU**, **RHIT** to find the largest value
- The largest value is your bottleneck category

### Step 2: Measure Baseline

Once you know the bottleneck category, drill deeper:

| Bottleneck | Next Command | What to Look For |
|-----------|-------------|-----------------|
| Game (CPU) | `stat game`, `stat slow` | Tick time, physics, AI, animation |
| Draw (CPU) | `stat SceneRendering` | Draw calls, mesh passes, visibility |
| GPU | `ProfileGPU`, `stat GPU` | Per-pass costs, shader complexity |
| RHIT | `stat RHI` | Resource creation, buffer locks |

Record the baseline numbers before making any changes.

### Step 3: Optimize

Apply targeted optimizations based on the profiling data. See knowledge files for specific techniques per category.

### Step 4: Verify

Re-run the exact same profiling commands under the same conditions:
- Same map/level
- Same camera position and view
- Same number of actors/objects
- Same build configuration

Compare numbers against your baseline. If improvement is less than 10%, the optimization may not be worth the complexity cost.

## Profiling via ue:console

Run stat commands via **/ue:console**:

```
/ue:console --script "unreal.SystemLibrary.execute_console_command(None, 'stat unit')"
/ue:console --script "unreal.SystemLibrary.execute_console_command(None, 'stat SceneRendering')"
/ue:console --script "unreal.SystemLibrary.execute_console_command(None, 'stat GPU')"
/ue:console --script "unreal.SystemLibrary.execute_console_command(None, 'ProfileGPU')"
/ue:console --script "unreal.SystemLibrary.execute_console_command(None, 'Memreport -full')"
/ue:console --script "unreal.SystemLibrary.execute_console_command(None, 'Trace.Start default,cpu,frame,bookmark,memory')"
/ue:console --script "unreal.SystemLibrary.execute_console_command(None, 'Trace.Stop')"
/ue:console --script "unreal.SystemLibrary.execute_console_command(None, 'stat LLM')"
```

## Knowledge File Reference

| File | Contents | When to Use |
|------|----------|-------------|
| `knowledge/cpu-profiling.md` | stat commands, Unreal Insights, cycle counters, tick optimization, threading | Game thread or Draw thread bottleneck |
| `knowledge/gpu-profiling.md` | GPU profiler, RenderDoc, draw calls, Nanite, Lumen, VSM, LODs | GPU bottleneck, visual quality vs performance |
| `knowledge/memory-profiling.md` | Memreport, LLM tracker, texture streaming, GC, platform budgets | Memory warnings, OOM crashes, hitching from GC |

## Quick Reference: Common Console Commands

```
stat unit              -- Frame time breakdown (start here)
stat fps               -- FPS counter
stat game              -- Game thread breakdown
stat slow              -- Anything exceeding threshold
stat SceneRendering    -- Draw calls and mesh passes
stat GPU               -- GPU pass timings
stat RHI               -- RHI resource stats
stat Streaming         -- Texture streaming pool usage
stat Memory            -- High-level memory stats
stat LLM               -- Low Level Memory Tracker
stat Particles         -- Particle system costs
stat AI                -- AI system costs
stat Physics           -- Physics simulation costs
stat Animation         -- Animation evaluation costs
stat Anim              -- Shorter alias for animation stats
stat Audio             -- Audio system stats
stat Slate             -- UI rendering costs
ProfileGPU             -- Detailed GPU pass breakdown
Memreport -full        -- Full memory report to log
obj list               -- List all UObjects by class
obj gc                 -- Force garbage collection
Trace.Start            -- Begin Unreal Insights capture
Trace.Stop             -- End Unreal Insights capture
r.Streaming.PoolSize   -- Get/set texture streaming pool (MB)
t.MaxFPS               -- Get/set frame rate cap
sg.ResolutionQuality   -- Resolution scale (10-100)
```

## Platform Performance Budgets (Reference)

| Platform | Target FPS | Frame Budget | CPU Budget | GPU Budget |
|----------|-----------|-------------|-----------|-----------|
| PC (High) | 60 | 16.67ms | 10ms | 14ms |
| PC (Ultra) | 120 | 8.33ms | 5ms | 7ms |
| PS5 | 60 | 16.67ms | 10ms | 14ms |
| Xbox Series X | 60 | 16.67ms | 10ms | 14ms |
| Switch | 30 | 33.33ms | 20ms | 28ms |
| Mobile (High) | 60 | 16.67ms | 8ms | 12ms |
| Mobile (Low) | 30 | 33.33ms | 18ms | 25ms |

Note: CPU/GPU budgets leave headroom for spikes. Never budget 100% of frame time.
