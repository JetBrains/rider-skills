# UE5 Rendering Pipeline

## Overview

The entry point is **`FDeferredShadingSceneRenderer::Render()`** in `DeferredShadingRenderer.cpp`. Despite its name, this class handles both deferred and forward paths. UE5 restructured rendering around three pillars — Nanite (virtualized geometry), Lumen (dynamic GI), and Virtual Shadow Maps — while preserving the deferred GBuffer architecture from UE4. Existing material and lighting workflows carry forward, but geometry submission, shadow, and GI subsystems are entirely new.

## Frame Stages (In Order)

### 1. InitViews
Frustum culling, distance culling, optional precomputed visibility cells, and HZB-based occlusion queries against the previous frame's hierarchical Z-buffer. The scene is stored as an octree of `FPrimitiveSceneProxy` objects — the render thread's mirrors of game-thread `UPrimitiveComponent` instances.

### 2. Nanite Culling and Rasterization
Runs entirely on the GPU. Instance culling (frustum + occlusion) feeds into two-pass cluster culling, selecting a cut of each mesh's binary LOD tree based on screen-space projected error. Clusters below a size threshold go through Nanite's **software rasterizer** (a compute shader processing 128 triangles per thread group); larger clusters use traditional hardware rasterization. Both write to a **Visibility Buffer** (`R32G32_UINT`, encoding triangle ID, cluster ID, and depth via 64-bit atomic max operations).

### 2b. Velocity / Motion Vectors (`RenderVelocities`)
Controlled by `r.VelocityOutputPass`:
- `0` — during depth pass (two phases: with/without velocity)
- `1` — extra GBuffer target during base pass
- `2` — after base pass

Three pass types in `EVelocityPass`: `Opaque`, `Translucent`, `TranslucentClippedDepth`.
Stereo OpenXR motion vectors rendered to a separate `StereoMotionVectors` texture (Vulkan-NDC format).

### 3. Depth Prepass
Renders non-Nanite opaque geometry into the depth buffer using reverse-Z. The result feeds **HZB generation** — a mip chain used for occlusion culling and screen-space effects.

### 4. Base Pass (GBuffer Population)
Nanite geometry undergoes a separate resolve step: for each screen pixel, the visibility buffer is read to fetch vertex data and evaluate the material shader, writing results into the standard GBuffer. In UE 5.4+, this resolve uses **GPU-driven compute shaders** with bin-sorted pixel lists per material, eliminating the earlier fullscreen-triangle-per-material approach. Non-Nanite meshes write the GBuffer directly through the traditional base pass.

**GBuffer Layout:**

| RT | Name | RGB | A |
|----|------|-----|---|
| A | GBufferA | World normal | Per-object data |
| B | GBufferB | Metallic, specular, roughness | Shading model ID |
| C | GBufferC | Base color | Ambient occlusion |
| D | GBufferD | Custom data (subsurface color, clear coat, etc.) | — |
| E | GBufferE | Precomputed shadow factors | — |
| F | GBufferF | High precision normals | — |
| SGGX | GBufferSGGX | SGGX / fiber normals | — |

Additional slots tracked in `EGBufferSlot` enum (`GBufferInfo.h`): `GBS_Velocity` (RG float16), `GBS_WorldTangent`, `GBS_Anisotropy`, `GBS_SubsurfaceColor`, `GBS_ClearCoat`, `GBS_IrisNormal`, `GBS_SeparatedMainDirLight`, etc.

Format controlled by `r.GBufferFormat` (0=low precision 8-bit, 1=default, 3=high precision normals, 5=full high precision).

View GBuffer contents in editor with `r.VisualizeBuffer`.

### 5. Shadow Rendering
Virtual Shadow Maps use a **16K×16K virtual resolution** divided into 128×128 pages, with only visible pages allocated and rendered — largely via Nanite's GPU-driven rasterizer. Directional lights use a clipmap structure; local lights get individual VSMs (cubemaps for point lights). Shadow Map Ray Tracing (SMRT) provides contact-hardening soft shadows by tracing rays against shadow map pages. Pages are cached between frames, so static geometry shadows become essentially free after initial rendering.

### 6. Deferred Lighting
`ComputeLightGrid` clusters lights into a frustum-space 3D grid (**64×64 pixel tiles, 32 Z-partitions**). Non-shadowed and shadowed lights are processed in separate passes, reading material properties from the GBuffer and computing PBR lighting.

### 7. Lumen
Executes after deferred lighting. The diffuse GI pipeline begins with screen traces against the depth buffer, then traces against signed distance fields (software RT) or BVH acceleration structures (hardware RT). A world-space radiance cache resolves distant lighting, and a final gather step produces the result — all heavily downsampled and temporally filtered to fit within roughly **4ms**. Lumen reflections share the same tracing infrastructure: screen-space reflections first, then Lumen traces for off-screen content, with rough surfaces reusing the screen-space radiance cache at no extra cost.

### 8. Translucency
Rendered in a single forward pass per object (necessary for correct blending with deferred shading). A volumetric lighting cache provides efficient illumination for translucent surfaces.

### 9. Post-Processing
TSR or TAA, motion blur, bloom, auto exposure, depth of field, tone mapping, color grading, film grain. TSR renders the scene at reduced internal resolution (default ~66.7%) and accumulates temporal data to reconstruct higher-resolution output on any SM5 hardware.

---

## Nanite, Lumen, and VSM as an Integrated System

These three systems are not independent features but a **tightly coupled rendering architecture**. Understanding the shared infrastructure is critical when customizing the renderer.

### Shared Infrastructure

**Nanite's GPU-driven rasterizer** serves double duty — rendering both the visibility buffer for the main view AND the depth pages for Virtual Shadow Maps. Optimizing Nanite directly improves shadow performance.

**Lumen's Surface Cache** is the key data structure enabling dynamic GI. Cards — rectangular patches placed on mesh surfaces — store low-resolution lighting information. When a traced ray hits geometry, Lumen reads lighting from the surface cache rather than evaluating materials per hit point. The hybrid tracing pipeline prioritizes: screen traces → mesh distance field traces (nearby) → global distance field (distant) → hardware ray tracing (highest quality).

### Practical Implication for Custom Geometry
Custom geometry types that bypass Nanite (custom vertex factories, procedural meshes) **won't automatically benefit from**:
- VSM's shadow page caching (they use the slower non-Nanite fallback path)
- Lumen's surface cache coverage (pink areas in `r.Lumen.Visualize.CardPlacement 1` = missing coverage)

Plan your customization strategy around this architectural reality.

### Per-System Notes

**Nanite limitations** narrowed significantly:
- UE 5.0: static opaque meshes only
- UE 5.1: Programmable Rasterizer (WPO, opacity masks)
- UE 5.5: skinned mesh support
- UE 5.7: experimental voxel-based foliage
- Translucency remains unsupported — always uses the traditional rendering path

**VSM caching** — primary performance concern is **alpha-tested materials and WPO**: these invalidate shadow pages frequently. Disable WPO on distant LODs. As of UE 5.6, VSMs require Nanite to be project-enabled.

**TSR** is a pure algorithmic temporal upscaler (no AI/ML), working on any SM5 GPU. When DLSS or FSR plugins are active, they override TSR. Enable with `r.AntiAliasingMethod 4`.

**Path Tracer** is a separate, progressive hardware-accelerated renderer that replaces the entire deferred pipeline when activated. Shares DXR infrastructure but uses an unbiased implementation with Russian Roulette path termination. Use for offline/cinematic rendering only.

---

## Debug Visualization and Profiling

```
stat unit                    # Identify game/render/GPU bottleneck
stat GPU                     # Per-pass GPU timing
profilegpu                   # Detailed breakdown (also Ctrl+Shift+,)
stat scenerendering          # Draw call counts (>2000 = instancing/merging needed)
r.VisualizeBuffer            # GBuffer inspection
ShowFlag.ShaderComplexity    # Material cost
FreezeRendering              # Freeze renderer state for inspection

# Isolation toggles:
r.Lumen.DiffuseIndirect.Allow 0     # Disable GI
r.Shadow.Virtual.Enable 0           # Cascade shadow fallback
ShowFlag.NaniteMeshes 0             # Hide Nanite geometry
r.ScreenPercentage 50               # Halve resolution
```

### CVar Configuration Files

| File | Section | Purpose |
|------|---------|---------|
| `DefaultEngine.ini` | `[/Script/Engine.RendererSettings]` | Project-wide renderer defaults |
| `ConsoleVariables.ini` | — | Startup-time dev CVars (e.g., `r.ShaderDevelopmentMode=1`) |
| `BaseScalability.ini` | — | Scalability group definitions mapped to CVars |
| `DefaultDeviceProfiles.ini` | — | Platform-specific rendering profiles |

CVar priority cascade (lowest to highest): Constructor → Scalability → DeviceProfile → ConsoleVariablesIni → Commandline → Console input.

---

## Key Structs (Source Reference)

**`FSceneTextures`** (`SceneTextures.h`) — all render targets for a frame:
- `Color` / `Depth` / `Stencil` — core scene textures
- `GBufferA`–`GBufferF`, `GBufferSGGX` — GBuffer slots
- `Velocity` — motion vectors
- `ScreenSpaceAO` — SSAO result
- `CustomDepth` — per-actor opt-in depth
- `SmallDepth` — conservative downsampled depth
- `StereoMotionVectors` / `StereoMotionVectorDepth` — OpenXR
- `SubstrateSceneData` — Substrate material textures

**`FSceneTexturesConfig`** — GBuffer layout configuration per platform:
- `GBufferParams[GBL_Num]` / `GBufferBindings[GBL_Num]` — per-layout assignments
- `EGBufferLayout`: `GBL_Default`, `GBL_ForceVelocity`
- Flags: `bIsUsingGBuffers`, `bRequireMultiView`, mobile flags

**`FSceneTextureUniformParameters`** — shader-accessible via `SHADER_PARAMETER_RDG_TEXTURE`:
`SceneColorTexture`, `SceneDepthTexture`, `GBufferATexture`–`GBufferFTexture`, `GBufferVelocityTexture`, `GBufferSGGXTexture`, `ScreenSpaceAOTexture`, `CustomDepthTexture`, `CustomStencilTexture`

## Source Code Entry Points

| File | Purpose |
|------|---------|
| `DeferredShadingRenderer.cpp` | `FDeferredShadingSceneRenderer::Render()` — frame entry point |
| `Renderer/Private/Lumen/` | Lumen subsystem implementation |
| `Renderer/Private/Nanite/` | Nanite subsystem implementation |
| `Renderer/Private/VirtualShadowMaps/` | VSM implementation |
| `Renderer/Private/PostProcess/` | Post-processing passes |
| `MaterialTemplate.ush` | Material HLSL insertion points |
| `HLSLMaterialTranslator.cpp` | Material graph → HLSL translation |
