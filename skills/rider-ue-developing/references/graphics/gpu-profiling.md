# GPU Profiling & Optimization

## Quick Reference — Profiling Commands

| Command | What It Shows | When to Use |
|---------|---------------|-------------|
| `stat GPU` | Per-pass GPU timings (ms) | First check — overall GPU breakdown |
| `stat unit` | Frame time: Game/Draw/GPU/RHI threads | Identify which thread is bottleneck |
| `stat RHI` | Draw calls, triangles, texture memory | Draw call / memory pressure check |
| `stat Nanite` | Nanite-specific stats | Nanite performance issues |
| `stat NiagaraGPU` | Niagara GPU sim stats | Particle system performance |
| `stat ShadowRendering` | Shadow pass breakdown | Shadow performance issues |
| `stat SceneRendering` | Full scene render breakdown | Detailed render analysis |
| `ProfileGPU` | Opens GPU Visualizer | Hierarchical timing breakdown |
| `Ctrl+Shift+,` | GPU Visualizer shortcut | Same as ProfileGPU |
| `NaniteStats primary` | Nanite GPU overlay | Nanite cluster/streaming stats (needs `r.ShaderPrint 1`) |

## Tools

### In-Engine: GPU Visualizer / GPU Profiler 2.0 (UE 5.6+)
- UE 5.6 overhauled GPU profiling: **GPU Profiler 2.0** unifies Stats, ProfileGPU, and Insights into a common data stream
- **Two GPU tracks**: separate Graphics and Compute tracks (visibility into async compute)
- Pipeline bubble detection and cross-queue dependency tracking
- `stat GPU` now clearly differentiates async compute workloads
- `stat unit` now displays current render resolution (5.6+)
- The in-editor ProfileGPU UI was removed in 5.6; console log dump was enhanced
- Legacy command `ProfileGPU` or `Ctrl+Shift+,` still works for console log dump

### In-Engine: Unreal Insights
- External tool: `Engine/Binaries/Win64/UnrealInsights.exe`
- Start trace: `trace.start gpu,rendering,bookmark` (console command)
- Stop trace: `trace.stop`
- Analyze: Open `.utrace` file in Unreal Insights
- Shows timeline view with GPU lanes, frame markers, and detailed pass info
- **UE 5.6+**: Enhanced CPU trace events, callstack visualization for bookmarks (`callstack,module,bookmark` channels)
- **UE 5.6+**: Experimental Low-Level Memory (LLM) asset memory profiling with per-platform budgets

### External: RenderDoc
- Free, open-source GPU frame capture
- Integration: `r.RenderDoc.CaptureAllActivity 1`, then `renderdoc.CaptureFrame`
- Or use RenderDoc overlay (launch editor from RenderDoc)
- Shows shader source (if `r.Shaders.KeepDebugInfo 1`), draw call list, resource inspector
- Best for: debugging visual artifacts, inspecting intermediate textures

### External: NVIDIA Nsight Graphics
- NVIDIA-specific, deep shader profiling
- Warp-level occupancy, register usage, memory throughput
- Best for: shader optimization on NVIDIA GPUs

### External: PIX (Windows)
- DirectX 12 profiling and debugging
- GPU captures, timing, API call recording
- Best for: DX12-specific issues, PSO debugging

## Common Bottlenecks & Solutions

### Base Pass (GBuffer Fill)
**Symptom**: `stat GPU` shows BasePass is expensive
**Causes**:
- Too many materials with high instruction count
- Excessive texture samples per material
- Dynamic branching in shaders

**Fixes**:
1. Reduce material complexity (view with Shader Complexity mode)
2. Use Material Instances with Static Switch Parameters
3. Merge actors with same material (auto-instancing via GPU Scene)
4. Check `r.ShaderComplexityMode` visualization

### Shadow Pass
**Symptom**: Shadow rendering dominates GPU time
**Fixes**:
1. Use VSM instead of cascaded shadows (`r.Shadow.Virtual.Enable 1`)
2. Reduce shadow-casting light count
3. Use `r.Shadow.RadiusThreshold` to skip small shadows
4. Configure `CullDistanceVolume` to cull shadow casters at distance

### Draw Calls
**Symptom**: `stat RHI` shows high draw call count (>2000-3000)
**Fixes**:
1. Enable GPU Scene for auto-instancing (default in UE5)
2. Use `InstancedStaticMeshComponent` / `HierarchicalInstancedStaticMeshComponent`
3. Merge actors: `Actor > Merge Actors` in editor
4. Use Nanite (handles LOD and batching internally)
5. Profile merging candidates with `stat SceneRendering`

### Overdraw
**Symptom**: Pixel shader cost high, especially with translucent materials
**Fixes**:
1. View mode: Shader Complexity (hotkey: `Alt+8`)
2. Reduce translucent material layers
3. Use masked instead of translucent where possible
4. `r.Nanite.Visualize.Overdraw` for Nanite-specific overdraw

### Shader Compilation Hitches
**Symptom**: Frame spikes when new materials/meshes are first rendered
**Cause**: First-time PSO (Pipeline State Object) compilation
**Fixes**:
1. Enable PSO Precaching: Project Settings → Rendering → PSO Precaching
2. Record PSO cache during QA: `-logPSO` launch flag
3. Bundle cache: cook with collected PSO cache file
4. `r.PSOPrecaching.ProxyCreationWhenPSOReady 1` — only create proxy when PSO is ready

### Memory (VRAM)
**Symptom**: Stuttering, texture pop-in, GPU out of memory
**Diagnostics**:
- `stat RHI` — texture memory, buffer memory
- `r.Streaming.PoolSize` — texture streaming pool (MB)
- `r.Nanite.Streaming.StreamingPoolSize` — Nanite geometry pool (MB)

**Fixes**:
1. Increase streaming pool: `r.Streaming.PoolSize 2048` (or appropriate for target GPU)
2. Use texture streaming (default for 2D textures)
3. Reduce texture resolution where not visible
4. Use virtual textures for large unique textures

## Mesh Draw Command Pipeline

Understanding how UE processes draw calls:

```
FPrimitiveSceneProxy
    → GetDynamicMeshElements() or DrawStaticElements()
        → FMeshBatch (material + mesh data)
            → FMeshDrawCommand (stateless RHI draw description)
                → GPU Draw Call
```

### Static vs Dynamic Path
| Path | When | Cost |
|------|------|------|
| **Static (Cached)** | `DrawStaticElements()` — meshes that don't change | Commands cached, very cheap per frame |
| **Dynamic** | `GetDynamicMeshElements()` — skeletal meshes, particles, etc. | Commands rebuilt every frame |

### Auto-Instancing (GPU Scene)
- GPU Scene uploads primitive data to GPU buffers
- Meshes with identical shader bindings are merged into instanced draws
- Matching check: `FMeshDrawCommand::MatchesForDynamicInstancing()`
- Requires same: material, vertex factory, shader bindings, render state

## Performance Budgets (60fps targets)

| Category | Budget | Notes |
|----------|--------|-------|
| **Total GPU frame** | 16.6ms | 60fps target |
| **Base Pass** | 3-5ms | GBuffer fill |
| **Shadows** | 2-4ms | VSM or cascades |
| **Lighting** | 2-4ms | Lumen or deferred lights |
| **Post-Processing** | 1-3ms | Bloom, DOF, etc. |
| **Nanite** | 1-3ms | Culling + rasterization |
| **TSR** | 1-2ms | Upscaling |
| **Translucency** | 0.5-2ms | Sorted translucent objects |
| **UI** | 0.5-1ms | Widget rendering |

## CVars for Profiling

| CVar | Purpose |
|------|---------|
| `r.ShaderPrint 1` | Enable on-screen shader debug print (needed for NaniteStats) |
| `r.ShaderComplexityMode` | 0=default, 1=count, 2=complexity |
| `r.RDG.Debug 1` | RDG validation and debugging |
| `r.RHICmdBypass 0` | Disable RHI command bypass (for debugging) |
| `r.GPUCrashDebugging 1` | Enable GPU crash breadcrumbs (DX12) |
| `r.D3D12.DREDEnable 1` | DirectX 12 DRED (Device Removed Extended Data) |
| `r.Shaders.Optimize 0` | Disable shader optimization (for debugging) |
| `r.Shaders.KeepDebugInfo 1` | Keep debug info for RenderDoc |
| `stat StartFile` / `stat StopFile` | Record stats to file for analysis |
| `ListShaders` | Runtime shader memory analysis (5.6+, parallel to `ListTextures`) |
| `r.LumenScene.DumpStats 3` | Lumen primitive culling diagnostics (5.7+) |

## Profiling Workflow

1. **Identify the bottleneck thread** — `stat unit` → is it Game, Draw, or GPU?
2. **If GPU** — `stat GPU` → which pass is expensive?
3. **Drill into pass** — `ProfileGPU` for hierarchical view
4. **Nanite-specific** — `NaniteStats primary` (with `r.ShaderPrint 1`)
5. **Visual debugging** — Shader Complexity mode (`Alt+8`), buffer visualizations
6. **Frame capture** — RenderDoc for detailed draw call and shader analysis
7. **Timeline analysis** — Unreal Insights for frame-over-frame patterns
