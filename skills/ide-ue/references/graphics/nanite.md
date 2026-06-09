# Nanite — Virtualized Geometry

## Architecture

Nanite is a GPU-driven, cluster-based virtualized geometry system. Meshes are decomposed into **clusters** (up to 128 triangles each), organized in a DAG (Directed Acyclic Graph) hierarchy. At runtime, the GPU decides which clusters to rasterize based on screen-space pixel coverage.

### Rendering Path
1. **Instance Culling** — GPU culls invisible instances (frustum + occlusion via HZB)
2. **Persistent Culling** — Clusters are hierarchically culled from the DAG
3. **Rasterization** — Nanite's own rasterizer writes a **Visibility Buffer** (triangle ID + material ID per pixel)
4. **Material Evaluation** — A separate pass shades only visible pixels using the visibility buffer
5. **Base Pass Integration** — Results merge into the deferred shading pipeline

### Rasterization Scheduling (`ERasterScheduling`)
```cpp
HardwareOnly = 0          // Only HW rasterizer
HardwareThenSoftware = 1  // HW first, then SW (sequential)
HardwareAndSoftwareOverlap = 2  // HW and SW async compute overlap
```

### Key Classes & Structs
- `FNaniteDrawListContext` — Manages Nanite draw commands
- `FNaniteMaterialCommands` — Material command buffer for Nanite's deferred shading
- `FNaniteVisibilityResults` — Per-view visibility query results
- `Nanite::FPackedView` — Packed view data for GPU culling
- `FNaniteRasterPipeline` — Per-material raster config: `bPerPixelEval`, `bWPOEnabled`, `bDisplacementEnabled`, `bSplineMesh`, `bSkinnedMesh`, `bVoxel`, `bCastShadow`
- `FNaniteMaterialSlot` — Maps material to shading bins: `TriangleShadingBin`, `VoxelShadingBin`, `RasterBin`, `FallbackRasterBin`
- `FNaniteRasterMaterialCache` — Compiled shaders: `RasterVertexShader`, `RasterPixelShader`, `RasterMeshShader`, `ClusterComputeShader`, `PatchComputeShader`
- `FNaniteShadingPipeline` — Material shading setup: `BasePassData`, `LumenCardData`, `MaterialCacheData`

### LOD System
- **Automatic continuous LOD** — no artist-authored LOD levels needed
- Controlled by `r.Nanite.MaxPixelsPerEdge` (default 1.0) — higher = coarser LOD
- LOD transitions are per-cluster and seamless (no popping)

### Streaming
- Nanite geometry pages are streamed from disk to GPU memory on demand
- `r.Nanite.Streaming.StreamingPoolSize` (MB) — GPU memory budget for geometry pages
- `r.Nanite.Streaming.NumInitialRootPages` — pages preloaded at startup (reduces initial pop-in)
- When the pool is full, lowest-priority pages are evicted (causes LOD degradation)

## CVars

### Rasterization
| CVar | Description | Default |
|------|-------------|---------|
| `r.Nanite` | Enable/disable Nanite globally | 1 |
| `r.Nanite.MaxPixelsPerEdge` | LOD threshold (higher = coarser, saves GPU) | 1.0 |
| `r.Nanite.MinPixelsPerEdgeHW` | Edge size threshold — above this uses HW rasterizer | 32.0 |
| `r.Nanite.ComputeRasterization` | Allow software compute rasterizer | 1 |
| `r.Nanite.ProgrammableRaster` | Allow pixel programmable rasterizer (WPO, masks, PDO) | 1 |
| `r.Nanite.AsyncRasterization` | Use async compute for rasterization | 1 |
| `r.Nanite.MeshShaderRasterization` | Use mesh shaders for HW rasterizer | 1 |
| `r.Nanite.RasterSort` | Sort rasterizer dispatches (masked foliage ~20% faster) | 1 |
| `r.Nanite.Bundle.RasterSW` | Shader bundle dispatch for SW raster | 1 |
| `r.Nanite.Bundle.RasterHW` | Shader bundle dispatch for HW raster | 1 |

### LOD & Pixels-Per-Edge
| CVar | Description | Default |
|------|-------------|---------|
| `r.Nanite.ImposterMaxPixels` | Max size for impostor fallback | 5 |
| `r.Nanite.PrimaryRaster.PixelsPerEdgeScaling` | Dynamic scaling % when over budget | 30.0 |
| `r.Nanite.DicingRate` | Micropolygon size for tessellation (pixels) | 2.0 |
| `r.Nanite.MaxPatchesPerGroup` | Max tessellation patches per rasterizer group | 5 |

### Culling
| CVar | Description | Default |
|------|-------------|---------|
| `r.Nanite.Culling.HZB` | Hierarchical depth occlusion culling | 1 |
| `r.Nanite.Culling.TwoPass` | Two-pass occlusion culling | 1 |
| `r.Nanite.Culling.WPODisableDistance` | Disable WPO beyond this distance | 1 |
| `r.Nanite.Culling.MinLOD` | Min LOD culling check (saves memory, 5.7+) | 1 |
| `r.Nanite.StaticGeometryInstanceCull` | Specialized static instance cull (5.6+) | 0 |
| `r.Nanite.FilterPrimitives` | Per-view primitive filtering | 1 |

### Tessellation (5.5+)
| CVar | Description | Default |
|------|-------------|---------|
| `r.Nanite.Tessellation` | Runtime tessellation support | 1 |
| `r.Nanite.AllowProgrammableDistances` | Distance-based programmable raster disabling | 1 |

### Streaming
| CVar | Description | Default |
|------|-------------|---------|
| `r.Nanite.Streaming.StreamingPoolSize` | GPU memory budget in MB | Platform-dependent |
| `r.Nanite.Streaming.NumInitialRootPages` | Pages preloaded at startup | — |

### Depth & Memory
| CVar | Description | Default |
|------|-------------|---------|
| `r.Nanite.DepthBucketing` | Group geometry by depth range (cache/memory optimization) | 1 |
| `r.Nanite.FastVisBufferClear` | Visibility buffer clear (0=disabled, 1=pixel, 2=tile) | 1 |
| `r.Nanite.CustomDepth.ExportMethod` | Custom depth export (0=PS, 1=CS/HTILE) | 1 |
| `r.Nanite.MaterialVisibility` | Track which materials are actually rendered | 1 |

### Debug
| CVar | Description | Default |
|------|-------------|---------|
| `r.Nanite.MaxCandidateClusters` | Cluster budget cap | — |
| `r.Nanite.AllowSplineMeshes` | Spline mesh support | 0 |
| `r.Nanite.PrimeHZB` | Experimental HZB priming after camera cuts (5.7+) | — |
| `r.Nanite.ShowStats` | Display Nanite statistics overlay | 0 |

### Debug Visualization
| CVar / Command | Purpose |
|-----------------|---------|
| `r.Nanite.Visualize.Triangles` | Color triangles by LOD level |
| `r.Nanite.Visualize.Overdraw` | Show pixel overdraw (red = bad) |
| `r.Nanite.Visualize.Clusters` | Show cluster boundaries |
| `r.Nanite.Visualize.Hierarchy` | Show DAG hierarchy levels |
| `NaniteStats primary` | GPU stats overlay (requires `r.ShaderPrint 1`) |

### Material Evaluation Path
```
FNaniteMaterialSlot (bin references)
  ↓
FNaniteRasterPipeline (raster config: bPerPixelEval, bWPOEnabled, bVoxel…)
  ↓
FNaniteRasterMaterialCache (compiled HW/SW shaders)
  ↓
Rasterization → VisBuffer64 (triangle ID + cluster ID + depth)
  ↓
ShadeBinning → Shading Phase (FNaniteShadingPipeline per bin)
  ↓
DispatchBasePass → GBuffer population
```

## UE Version History

### UE 5.0–5.3
- Static meshes only (no skeletal, no splines)
- No masked material support on Nanite
- No World Position Offset

### UE 5.4
- **Programmable Rasterizer** — supports masked materials, WPO, Pixel Depth Offset on Nanite meshes
- Custom Depth/Stencil improved compatibility

### UE 5.5
- **Skeletal mesh support** — GPU skinning before Nanite culling/rasterization
- **Displacement** — runtime tessellation from displacement maps
- **Spline mesh support** — `r.Nanite.AllowSplineMeshes=1` (with culling caveats)
- **Rasterizer sorting** — `r.Nanite.RasterSort` for ~20% faster masked foliage rasterization
- Reduced shader permutations for tonemap

### UE 5.6
- **Instance culling improvements** — explicit chunk bounds in culling hierarchy (+100μs in CitySample)
- **Hierarchical instance culling** refactored to 64-instance chunks supporting GPU-updated instances
- **Specialized static geometry instance cull** — `r.Nanite.StaticGeometryInstanceCull` (off by default)
- **LOD generation bugfix** preventing excessive simplification destroying silhouettes
- Distance culling bugfix for Cascaded Shadow Maps
- Single-view specialization for chunk-based instance cull shader reducing register pressure

### UE 5.7
- **Nanite Foliage (Experimental)** — major new system for dense vegetation rendering:
  - **Nanite Voxels** — automatically renders millions of overlapping elements (canopies, needles, ground clutter) as voxels at distance, seamlessly transitions to triangles up close. ~2x FPS improvement (62→119 FPS with 77K trees at 20M polys each)
  - **Nanite Assemblies** — builds foliage from instanced parts, reducing storage/memory/rendering cost
  - **Nanite Skinning** — replaces WPO for dynamic wind via new Dynamic Wind plugin (WPO is generally unsuitable for Nanite due to rendering cost)
- **Culling improvements** — `r.Nanite.Culling.MinLOD` enabled by default, improves culling speed and reduces candidate cluster memory
- **HZB priming** — experimental `r.Nanite.PrimeHZB` to address performance issues after camera cuts
- **Skinned mesh distance control** — `NanitePixelProgrammableDistance` disables pixel programmable rasterization beyond specified camera distance

## Limitations & Workarounds

| Limitation | Details | Workaround |
|------------|---------|------------|
| **Transparency** | Nanite visibility buffer conflicts with alpha blending. VSM performance degrades further with masked Nanite. | Minimize masked materials on Nanite. Use `r.Nanite.RasterSort` (5.5+). |
| **WPO + VSM** | World Position Offset invalidates VSM cache every frame — major perf cost. WPO generally unsuitable for Nanite. | Use Nanite Skinning with Dynamic Wind plugin instead (5.7+). For pre-5.7: disable WPO on shadow-casting Nanite meshes, or accept the cost. |
| **Thin geometry** | Nanite aggressively culls thin geometry at distance (kills tree branches). | Enable "Preserve Area" in static mesh settings. |
| **Spline meshes** | Culling issues under extreme deformation. Performance cost. | Use sparingly. Test with `r.Nanite.Visualize.Clusters`. |
| **Streaming pool full** | Exceeding `StreamingPoolSize` causes aggressive LOD degradation and pop-in. | Increase pool size, reduce mesh density, or use LOD groups. |
| **No instanced rendering** | Each Nanite mesh is rendered individually (no ISM/HISM benefit). | For simple repeated geometry (grass), non-Nanite ISM may be better. |

## Best Practices

1. **Monitor streaming pressure** — Use `NaniteStats primary` to check pool usage. Keep headroom (70-80% target).
2. **Set appropriate pool size** — Match to target GPU VRAM. 512MB for 4GB GPUs, 1024MB+ for 8GB+.
3. **Use Nanite selectively** — Not every mesh benefits. Small props with few triangles may be better as traditional meshes.
4. **Check overdraw** — `r.Nanite.Visualize.Overdraw` reveals meshes that produce excessive per-pixel work.
5. **Test at target resolution** — Nanite LOD is screen-space dependent. Test at shipping resolution.
6. **Preload root pages** — Increase `NumInitialRootPages` for levels where pop-in at load is noticeable.
