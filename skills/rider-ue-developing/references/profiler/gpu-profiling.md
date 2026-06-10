# GPU Profiling in Unreal Engine

Comprehensive guide to identifying and resolving GPU bottlenecks in Unreal Engine projects.

## GPU Stat Commands

### stat GPU -- Per-Pass Timing

The primary GPU profiling command:

```
stat GPU
```

Displays per-render-pass GPU time in milliseconds:

```
PrePass:           0.42 ms    -- Depth prepass
BasePass:          3.21 ms    -- Geometry + material shading
ShadowDepths:      1.87 ms    -- Shadow map rendering
Lighting:          2.14 ms    -- Deferred lighting evaluation
HZB:               0.15 ms    -- Hierarchical Z-Buffer
Reflections:       0.89 ms    -- Screen-space + reflection captures
Translucency:      0.67 ms    -- Translucent objects
PostProcessing:    1.23 ms    -- Post-process chain
VolumetricFog:     0.34 ms    -- Volumetric fog computation
```

The sum of all passes approximates total GPU frame time. Focus on the largest contributor.

### ProfileGPU -- Detailed One-Frame Breakdown

```
ProfileGPU
```

Captures a single frame with detailed per-draw-call GPU timing. Results appear in the output log and (in editor) as a visual hierarchy. More detailed than `stat GPU` -- shows individual mesh draws, shadow cascades, and post-process effects.

Shortcut in editor: **Ctrl+Shift+,** (comma)

### stat SceneRendering -- Draw Call Analysis

```
stat SceneRendering
```

Key metrics:
- **Mesh draw calls**: Total draw calls submitted (target: < 2000 for 60fps)
- **Static mesh draw calls**: From static geometry
- **Dynamic primitives**: Rebuilt every frame (expensive)
- **Visible static mesh elements**: After culling
- **Processed primitives**: Total triangles submitted to GPU

### stat RHI -- Resource Statistics

```
stat RHI
```

Shows:
- Render target memory
- Texture memory
- Buffer memory (vertex, index, structured)
- Draw calls and primitives per frame
- RHI thread time

## RenderDoc Integration

RenderDoc provides frame capture and per-draw analysis at the API level.

### Setup

1. Install RenderDoc (https://renderdoc.org)
2. Launch UE with `-RenderDoc` command line flag or enable the RenderDoc plugin
3. Press **F12** to capture a frame (default key)

### What RenderDoc Shows That UE Profiler Does Not

- Per-draw-call GPU duration at the API level
- Shader execution time per draw
- Overdraw visualization
- Texture/buffer binding state per draw
- Pipeline state (blend, depth, stencil)
- Resource usage and memory layout

### RenderDoc Workflow for UE

1. Capture frame during the problematic scenario
2. Open the Event Browser -- shows all GPU commands chronologically
3. Look at the Texture Viewer for render target contents at each step
4. Use the Pipeline State viewer to inspect shader bindings
5. Sort draw calls by GPU duration to find the most expensive ones
6. Check Mesh Output to see vertex/triangle counts per draw

### Common Findings

- **Overdraw**: Multiple transparent layers rendering to the same pixel. Check with the overdraw visualization mode.
- **Redundant state changes**: Frequent material switches cause pipeline flushes. Batch by material.
- **Large render targets**: Unnecessary full-resolution passes. Check if resolution can be reduced.
- **Shader occupancy**: Complex shaders with many registers reduce GPU parallelism.

## Draw Call Analysis

### Understanding Draw Call Cost

Each draw call has CPU overhead (command recording) and GPU overhead (state setup). The GPU overhead is relatively fixed per call, so many small draws are worse than fewer large draws.

### Reducing Draw Calls

**Instanced Static Meshes (ISM)**:
```cpp
// Convert repeated static meshes to instanced
UInstancedStaticMeshComponent* ISM = CreateDefaultSubobject<UInstancedStaticMeshComponent>(TEXT("ISM"));
ISM->SetStaticMesh(TreeMesh);
for (const FTransform& T : TreeTransforms)
{
    ISM->AddInstance(T);
}
```

**Hierarchical Instanced Static Meshes (HISM)**:
- Same API as ISM but adds occlusion culling per cluster
- Use for large instance counts (> 1000)
- Foliage system uses HISM internally

**Mesh Merging** (Editor tool):
- Select static meshes -> Merge Actors
- Reduces draw calls but increases memory (merged mesh is unique)
- Cannot be un-merged at runtime
- Good for environment props that are always together

**Nanite** (UE5):
- Eliminates traditional draw call overhead for supported meshes
- Virtualizes geometry -- only visible triangles are rasterized
- No LOD management needed
- Check Nanite-eligible meshes: no skeletal meshes, no translucency, no custom vertex factories

### Batching Rules

Draws can batch if they share:
- Same mesh (or compatible vertex layout)
- Same material instance
- Same render state (blend mode, depth state)
- Same lightmap (for static lighting)

If two objects differ in any of these, they require separate draw calls.

## Shader Complexity View Mode

In the editor viewport: **View Mode > Optimization Viewmodes > Shader Complexity**

Color coding:
- **Green**: Cheap shaders (< 50 instructions)
- **Yellow**: Moderate (50-200 instructions)
- **Orange**: Expensive (200-500 instructions)
- **Red**: Very expensive (500+ instructions)
- **Pink/White**: Extreme (1000+ instructions, usually overlapping translucency)

### Reducing Shader Complexity

1. **Material LODs**: Use `QualitySwitch` or material LOD to simplify materials at distance
2. **Texture samples**: Each sample costs ~4-8 cycles. Combine channels (pack roughness/metallic/AO into one RGB texture)
3. **Math operations**: `pow()`, `sin()`, `cos()` are expensive. Pre-bake into textures where possible.
4. **Branching**: Dynamic branching (`if` nodes) can be expensive on some GPUs. Prefer lerp-based blending.
5. **Translucency**: Each layer re-evaluates the full shader. Minimize translucent overlap.

### Shader Permutations

Materials generate shader permutations for different feature combinations. Too many permutations increase compile time and memory:

```
r.ShaderPipelineCache.Enabled 1    -- Enable PSO caching
r.ShaderPipelineCache.SaveBoundPSOs 1
```

## Nanite vs Traditional Mesh Rendering

### Nanite Benefits

- **No LOD management**: Automatic per-cluster LOD selection
- **No draw call overhead**: GPU-driven rendering pipeline
- **Handles billions of triangles**: Virtual geometry streaming
- **Per-pixel culling**: Only visible pixels consume bandwidth

### Nanite Costs

- **Memory**: Nanite meshes use more disk/memory for the hierarchy data
- **Incompatible features**: No skeletal meshes, no vertex animation, limited WPO
- **Translucency**: Not supported
- **Custom vertex factories**: Not supported (Nanite has its own rasterizer)
- **Masking**: Supported but slower than opaque

### When NOT to Use Nanite

- Skeletal/animated meshes
- Transparent objects (glass, water surfaces)
- Very simple meshes (< 100 triangles) -- overhead of hierarchy not worth it
- Meshes using heavy World Position Offset
- Mobile platforms (not supported)

### Monitoring Nanite

```
stat Nanite            -- Nanite rendering stats
r.Nanite.Visualize 1   -- Overlay showing Nanite clusters
```

Key Nanite stats:
- Visible clusters
- Rasterized triangles
- Peak triangle count
- Streaming stats (virtual geometry pages)

## Lumen Global Illumination

Lumen provides dynamic GI and reflections. It is a significant GPU cost.

### Lumen Modes

**Software Lumen** (default):
- Screen-space tracing + surface cache
- Lower quality but faster
- Good for medium-range GI

**Hardware Lumen** (ray tracing):
- Uses RT cores on supported GPUs
- Higher quality, especially for off-screen bounces
- Requires `r.Lumen.HardwareRayTracing 1`

### Lumen Cost Settings

```
r.Lumen.DiffuseIndirect.Allow 1          -- Enable/disable Lumen GI
r.Lumen.Reflections.Allow 1               -- Enable/disable Lumen reflections
r.Lumen.TraceMeshSDFs.Allow 1             -- Mesh SDF tracing (expensive but better quality)
r.Lumen.ScreenProbeGather.TracingOctahedronResolution 8  -- Reduce for performance
r.Lumen.FinalGather.Quality 0.5           -- 0.25-1.0 quality scale
r.Lumen.Reflections.MaxRoughnessToTrace 0.4  -- Skip reflections on rough surfaces
```

### Lumen Performance Tips

1. **Surface cache resolution**: Large open worlds need larger surface cache. Check `r.Lumen.SurfaceCache.MeshCardLength`
2. **Far-field GI**: Reduce `r.Lumen.MaxTraceDistance` if distant GI is not visible
3. **Screen probes**: Reduce `r.Lumen.ScreenProbeGather.ScreenSpaceTracingSteps` for distant views
4. **Mesh SDFs**: Disable for small props with `bAffectDistanceFieldLighting = false`
5. **Emissive**: Lumen traces emissive surfaces. High-emissive materials increase trace cost.

### Monitoring Lumen

```
stat Lumen             -- Lumen-specific GPU stats
r.Lumen.Visualize 1   -- Debug visualization
```

## Virtual Shadow Maps (VSM)

VSM replaces traditional cascaded shadow maps. It provides pixel-accurate shadows but has its own performance characteristics.

### VSM Cost Centers

1. **Page allocation**: VSM allocates virtual pages on demand. Many shadow-casting lights increase page count.
2. **Caching**: Only invalidated pages re-render. Moving objects invalidate pages each frame.
3. **Nanite integration**: VSM rasterizes shadow depths via Nanite (fast) or traditional pipeline (slower for non-Nanite meshes).

### VSM Performance Settings

```
r.Shadow.Virtual.Enable 1                   -- Master toggle
r.Shadow.Virtual.MaxPhysicalPages 4096      -- Memory budget (reduce for perf)
r.Shadow.Virtual.ResolutionLodBiasDirectional 0  -- Reduce for lower shadow resolution
r.Shadow.Virtual.ResolutionLodBiasLocal 0.5      -- Bias for local lights
r.Shadow.Virtual.SMRT.RayCountDirectional 4      -- Shadow map ray-traced samples
r.Shadow.Virtual.Cache.StaticSeparate 1          -- Separate static shadow cache
```

### VSM Performance Tips

1. **Reduce shadow-casting lights**: Each shadow-casting light allocates VSM pages
2. **Cull distant shadows**: Use `r.Shadow.Virtual.MaxDistanceScale`
3. **Static vs dynamic separation**: Enable separate static cache to avoid re-rendering static geometry
4. **Non-Nanite cost**: Traditional meshes in VSM use the standard shadow pass (slower). Convert to Nanite where possible.

### Monitoring VSM

```
stat ShadowRendering    -- Shadow map stats
r.Shadow.Virtual.Visualize 1  -- Debug page visualization
```

## Texture Streaming and Memory

### Texture Streaming Pool

```
stat Streaming          -- Pool usage and streaming stats
r.Streaming.PoolSize    -- Get current pool size (MB)
r.Streaming.PoolSize 2048  -- Set to 2 GB
```

Key metrics:
- **Required Pool**: How much memory textures want
- **Streaming Pool**: How much is allocated
- **Over Budget**: If required > pool, quality degrades

### Texture Memory Commands

```
ListTextures                          -- Full list of loaded textures
ListTextures -alphasort              -- Sorted by name
r.Streaming.FullyLoadUsedTextures 1   -- Force full resolution (debug only)
stat TexturePool                      -- Texture pool stats
```

### Texture Optimization

1. **Compression**: Use BCn/ASTC compression. Uncompressed RGBA8 = 4x memory cost.
2. **Max resolution**: Not every texture needs 4K. Environment textures at distance can be 1K.
3. **Streaming priority**: Set per-texture streaming priority in the texture editor.
4. **Virtual textures**: Enable Runtime Virtual Texturing for large landscapes with many unique textures.
5. **Texture groups**: Configure `TextureGroup` settings in `DefaultEngine.ini` for global LOD bias per category.

## LOD and HLOD

### LOD Impact on GPU

Each LOD level reduces:
- Triangle count (direct GPU savings)
- Material complexity (can switch to simpler materials)
- Bone count (for skeletal meshes)

### Monitoring LOD

```
stat MeshLOD            -- LOD switching stats
r.ForceLOD 0           -- Force specific LOD level (debug)
r.StaticMeshLODDistanceScale 1.0  -- Scale LOD distances
```

### Auto LOD Generation

UE can auto-generate LODs:
- Static meshes: Mesh editor > LOD Settings > Auto Compute LOD
- Nanite: Handled automatically (no manual LODs needed)

### HLOD (Hierarchical LOD)

HLOD merges distant actors into simplified proxy meshes:

1. **Setup**: World Settings > Enable HLOD, configure HLOD volumes
2. **Build**: Build > Build HLOD from the editor
3. **Clusters**: Actors grouped by proximity form HLOD clusters
4. **Proxy meshes**: Generated simplified meshes replace clusters at distance

HLOD reduces draw calls dramatically for open worlds. A city block with 500 draw calls becomes 1-3 draws at distance.

### HLOD Settings

```
r.HLOD.DistanceOverride 0      -- Override HLOD transition distance
r.HLOD.MaxDrawDistance 0        -- Max draw distance for HLOD proxies
stat HLOD                       -- HLOD performance stats
```

## Mobile GPU Profiling

Mobile platforms have distinct GPU characteristics requiring specialized profiling.

### Platform-Specific Tools

| Platform | Tool | Command |
|----------|------|---------|
| Android (Mali) | Arm Mobile Studio / Streamline | Launch via ADB |
| Android (Adreno) | Snapdragon Profiler | Connect via USB |
| iOS | Xcode GPU Profiler | Instruments > Metal System Trace |
| iOS | RenderDoc (Metal) | Frame capture via USB |

### Mobile-Specific Stats

```
stat OpenGL            -- OpenGL ES stats (Android)
stat Metal             -- Metal API stats (iOS)
stat Vulkan            -- Vulkan stats (Android)
```

### Mobile GPU Bottlenecks

1. **Fill rate**: Mobile GPUs have limited pixel throughput. Reduce resolution with `sg.ResolutionQuality`.
2. **Bandwidth**: Texture sampling is expensive. Use ASTC compression, reduce texture resolution.
3. **Overdraw**: Tile-based GPUs re-shade all fragments in a tile. Minimize transparent overlaps.
4. **Shader complexity**: Mobile GPUs have far fewer ALU units. Target < 100 instructions per pixel.
5. **Draw calls**: Mobile API overhead is higher per call. Target < 500 draw calls.

### Mobile Render Features to Control

```
r.MobileHDR 1                          -- HDR rendering (expensive)
r.Mobile.ShadingPath 0                  -- 0=forward, 1=deferred
r.MobileContentScaleFactor 1.0          -- Resolution scale
r.Mobile.AmbientOcclusion 0             -- SSAO (expensive on mobile)
r.BloomQuality 0                        -- Disable bloom
r.DefaultFeature.MotionBlur 0           -- Disable motion blur
r.DefaultFeature.AutoExposure 0         -- Disable auto exposure
r.DefaultFeature.AntiAliasing 0         -- AA quality (0=off)
```

### Thermal Throttling

Mobile GPUs throttle when hot. Profile after the device reaches steady-state temperature:

1. Run the app for 5+ minutes before measuring
2. Compare initial fps vs sustained fps
3. If sustained drops > 20%, reduce GPU load to prevent thermal throttle
4. Use `stat unit` over time to watch for gradual frame time increase

### Device Profile-Driven Mobile Optimization

Use `DefaultDeviceProfiles.ini` to set per-GPU-family rendering settings. This is the primary tool for multi-device GPU optimization:

```ini
; High-end GPU (e.g., Adreno 7xx, Mali-G710)
[Android_High DeviceProfile]
+CVars=sg.ShadowQuality=2
+CVars=sg.PostProcessQuality=2
+CVars=r.MobileContentScaleFactor=1.0
+CVars=r.Mobile.AmbientOcclusionQuality=1

; Mid-range GPU (e.g., Adreno 5xx, Mali-G78)
[Android_Mid DeviceProfile]
+CVars=sg.ShadowQuality=1
+CVars=sg.PostProcessQuality=1
+CVars=r.MobileContentScaleFactor=0.9
+CVars=r.DynamicRes.OperationMode=2
+CVars=r.SecondaryScreenPercentage.GameViewport=83.33

; Low-end GPU (e.g., Adreno 4xx, Mali-T6xx)
[Android_Low DeviceProfile]
+CVars=sg.ShadowQuality=0
+CVars=sg.PostProcessQuality=0
+CVars=r.MobileContentScaleFactor=0.8
+CVars=r.Shadow.CSM.MaxCascades=1
+CVars=r.Shadow.DistanceScale=0.4
```

Dynamic resolution is critical for mobile — it automatically reduces render resolution when the GPU can't keep up:

```ini
+CVars=r.DynamicRes.OperationMode=2             ; Based on GPU time
+CVars=r.DynamicRes.MinScreenPercentage=50      ; Floor at 50%
+CVars=r.DynamicRes.MaxScreenPercentage=100     ; Ceiling at native
+CVars=r.DynamicRes.FrameTimeBudget=16.6        ; Target 60fps
```

For iOS, set quality per specific device model (iPhone6S through iPhone14Pro etc.) rather than GPU family, since Apple's GPU family mapping is less granular.

## Advanced GPU Profiling Techniques

### GPU Crash Debugging

When the GPU crashes (TDR on Windows, device lost):

```
r.D3D12.DREDEnabled 1            -- Device Removed Extended Data (DX12)
r.GPUCrashDebugging 1            -- Enable GPU crash debugging
r.GPUCrashDebugging.Breadcrumbs 1  -- Breadcrumb markers in command buffer
```

After a crash, check `Saved/Logs` for the DRED report showing which command caused the fault.

### Async Compute

UE5 can overlap GPU compute work with rasterization:

```
r.D3D12.AsyncCompute 1           -- Enable async compute (DX12)
r.Vulkan.AsyncCompute 1          -- Enable async compute (Vulkan)
```

Async compute helps when the GPU has idle compute units during rasterization-heavy passes. Profile with and without to verify improvement.

### Resolution Scaling

Dynamic resolution adapts to maintain frame rate:

```
r.DynamicRes.OperationMode 2      -- 2 = based on GPU time
r.DynamicRes.MinScreenPercentage 50
r.DynamicRes.MaxScreenPercentage 100
r.DynamicRes.FrameTimeBudget 16.6  -- Target frame time (ms)
```

Monitor with:
```
stat DynamicResolution
```

### Temporal Super Resolution (TSR)

TSR upscales from lower resolution with temporal accumulation:

```
r.TemporalAA.Upscaler 1           -- Enable TSR
r.TemporalAA.Quality 1            -- 0=low, 1=medium, 2=high
sg.ResolutionQuality 66           -- Render at 66% resolution
```

TSR at 66% internal resolution can look nearly as good as native while saving ~30% GPU time.
