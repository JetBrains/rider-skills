# Virtual Shadow Maps & Temporal Super Resolution

## Virtual Shadow Maps (VSM)

### Architecture
- Single massive virtual shadow map (16k × 16k) per light, divided into pages/tiles
- Only pages visible to the camera are rendered — massive efficiency gain over cascade shadows
- Pages are cached across frames — only invalidated pages re-render
- Leverages Nanite's rasterizer for efficient shadow rendering of Nanite meshes

### Requirements
- DirectX 12 or Vulkan (not available on DX11)
- Best performance with Nanite meshes (non-Nanite uses slower fallback rasterizer)

### CVars

| CVar | Description | Default |
|------|-------------|---------|
| `r.Shadow.Virtual.Enable` | 0=Cascade shadows, 1=VSM | 1 |
| `r.Shadow.Virtual.Cache` | Enable/disable page caching | 1 |
| `r.Shadow.Virtual.Cache.InvalidateUseHZB` | HZB-based cache invalidation (skip non-visible invalidation) | 1 |
| `r.Shadow.Virtual.Cache.DeformableMeshesInvalidate` | Force invalidation for deformable meshes | 1 |
| `r.Shadow.Virtual.Cache.MaxPageAgeSinceLastRequest` | Max frames to keep unrequested cached pages | 1000 |
| `r.Shadow.Virtual.Cache.MaxLightAgeSinceLastRequest` | Max frames for offscreen light cache | 10 |
| `r.Shadow.Virtual.Cache.FramesStaticThreshold` | Frames before transition to static cache | 100 |
| `r.Shadow.Virtual.ResolutionLodBiasDirectional` | LOD bias for directional light shadows | 0.0 |
| `r.Shadow.Virtual.ResolutionLodBiasDirectionalMoving` | Separate LOD bias for moving directional lights | 0.0 |
| `r.Shadow.Virtual.DynamicRes.MaxResolutionLodBias` | Max global LOD bias | 2.0 |
| `r.Shadow.Virtual.DynamicRes.MaxPagePoolLoadFactor` | Pool usage threshold before LOD scaling kicks in | 0.85 |
| `r.Shadow.Virtual.MaxPhysicalPages` | Maximum physical shadow pages (memory budget) | — |
| `r.Shadow.Virtual.Clipmap.FirstLevel` | Nearest clipmap resolution level | 6 |
| `r.Shadow.Virtual.Clipmap.LastLevel` | Farthest clipmap level | 22 |
| `r.Shadow.Virtual.Clipmap.FirstCoarseLevel` | First level for coarse page marking | 15 |
| `r.Shadow.Virtual.Clipmap.LastCoarseLevel` | Last level for coarse page marking | 18 |
| `r.Shadow.Virtual.Clipmap.ZRangeScale` | Z-depth range relative to radius | 1000.0 |
| `r.Shadow.Virtual.Clipmap.WPODisableDistance` | Distance to disable WPO in clipmap | — |
| `r.Shadow.Virtual.Clipmap.WPODisableDistance.InvalidateOnScaleChange` | Invalidate cache when WPO threshold shifts | 0 |
| `r.Shadow.Virtual.NonNanite.IncludeInCoarsePages` | Include non-Nanite meshes in coarse pages | — |

**Physical page layout constants (source):**
- Page size: 128×128 texels, virtual address: 16K×16K (128×128 pages)
- Max physical pages: 65K (`PhysicalPageAddressBits = 16`)
- 7 HZB mip levels per page

### Cache Invalidation
VSM's performance depends on cache efficiency. Invalidation triggers:
- **Dynamic objects moving** — only affected pages re-render
- **World Position Offset (WPO)** — invalidates cache EVERY FRAME for WPO meshes (major perf cost)
- **Light movement** — entire shadow map re-renders
- **Camera movement** — new pages may need rendering, but cached pages persist

### Common Issues

| Issue | Cause | Fix |
|-------|-------|-----|
| **Shadow popping** | Page resolution transitions | Adjust `ResolutionLodBias` CVars |
| **Poor performance** | Too many non-Nanite shadow casters | Convert key shadow casters to Nanite |
| **WPO perf cliff** | Foliage with wind WPO invalidates cache every frame | Disable WPO for shadow pass, or use distance-based WPO fade |
| **Missing shadows at distance** | Insufficient clipmap levels | Increase `r.Shadow.Virtual.Clipmap.LastLevel` |
| **Memory pressure** | Too many physical pages | Reduce `MaxPhysicalPages` or shadow resolution |

### UE 5.6 Improvements
- **Receiver masks** improve clipmap culling effectiveness for dense scenes (`r.Shadow.Virtual.UseReceiverMask`, off by default in 5.6)
- Local light receiver masks: `r.shadow.virtual.usereceivermasklocal`
- Per-chunk shadow casting aggregation with early culling
- Clipmap far culling plane optimization: `r.Shadow.Virtual.Clipmap.CullDynamicTightly` (default true)
- Normalized High scalability VSM settings across platforms

### UE 5.7 Improvements
- **Receiver masks enabled by default** for directional lights (~10MB memory overhead, significant perf improvement with dynamic geometry)
- MegaLights-driven VSM page marking

### Debug Visualization
- `r.Shadow.Virtual.Visualize.Layout 1` — show page layout
- `r.Shadow.Virtual.Visualize.CacheHits 1` — green=cached, red=re-rendered
- `stat ShadowRendering` — shadow pass timing

---

## Temporal Super Resolution (TSR)

### Architecture
TSR renders at a lower resolution (`r.ScreenPercentage`) and reconstructs to output resolution using temporal history. It uses:
1. Previous frame's high-res history buffer
2. Current frame's low-res render
3. Motion vectors for reprojection
4. Rejection heuristics to avoid ghosting

### CVars

| CVar | Description | Default |
|------|-------------|---------|
| `r.AntiAliasingMethod` | 2=TAAU, 4=TSR | 4 |
| `r.ScreenPercentage` | Rendering resolution % (e.g., 50 = half-res) | Varies by quality preset |
| `r.TSR.History.ScreenPercentage` | History buffer resolution % (100=1x, 200=2x) | 100–200 |
| `r.TSR.History.SampleCount` | Max accumulated samples per pixel (8.0–32.0) | 16.0 |
| `r.TSR.History.R11G11B10` | R11G11B10 history format (saves bandwidth, no alpha) | 1 |
| `r.TSR.History.UpdateQuality` | History update shader quality (driven by sg.AntiAliasingQuality) | 3 |
| `r.TSR.ShadingRejection.Mode` | 0=responsive/blocky, 1=stable/ghosting-prone | 1 |
| `r.TSR.ShadingRejection.SampleCount` | Samples kept after rejection | 2.0 |
| `r.TSR.ShadingRejection.Flickering` | Enable temporal flickering detection | 1 |
| `r.TSR.ShadingRejection.Flickering.FrameRateCap` | Reference framerate for frequency boundary | 60 |
| `r.TSR.ShadingRejection.Flickering.Period` | Flicker period threshold (frames) | 2.0 |
| `r.TSR.ShadingRejection.Flickering.MaxParallaxVelocity` | Disable flickering detection above this velocity | 10.0 |
| `r.TSR.ShadingRejection.ExposureOffset` | Exposure adjust for LDR shadow quantization | 0 |
| `r.TSR.RejectionAntiAliasingQuality` | Spatial AA quality during history rejection | 3 |
| `r.TSR.ThinGeometryDetection` | Detect and stabilize thin geometry (foliage, hair) | 0 |
| `r.TSR.ThinGeometryDetection.Coverage.ShadingRange` | Thin geo detection range (5.7+: 2=all shading models) | 3 |
| `r.TSR.Resurrection` | Resurrect previously rejected detail from past frames | 0 |
| `r.TSR.Resurrection.PersistentFrameCount` | Stored frames for resurrection (must be even, ≥2) | 2 |
| `r.TSR.Resurrection.PersistentFrameInterval` | Frame interval between stored frames (must be odd, ≥1) | 31 |
| `r.TSR.ReprojectionField` | Enable reprojection field AA (on by default at High+) | 0 |
| `r.TSR.AsyncCompute` | 0=off, 1=independent passes, 2=with depth/velocity, 3=all | 2 |
| `r.TSR.WaveOps` | Use wave operations in rejection heuristics | 1 |
| `r.TSR.Velocity.WeightClampingSampleCount` | Sample clamp at high velocity (anti-ghosting) | 4.0 |
| `r.TSR.Velocity.WeightClampingPixelSpeed` | Velocity threshold for sample clamping | 1.0 |
| `r.TSR.Visualize` | Debug modes: 0=sample count, 4=resurrection, 7=flickering, 11=reprojection, 15=thin geo | -1 |

### Quality Presets

| Preset | Screen % | History % | Notes |
|--------|----------|-----------|-------|
| Low | ~50% | 100% | Fast, visible artifacts |
| Medium | ~58% | 100% | Balanced |
| High | ~66% | 100% | Good quality |
| Epic | ~77% | 200% | High quality, 2x history buffer |
| Cinematic | ~100% | 200% | Maximum quality, full-res + supersampled history |

### Common Issues

| Issue | Cause | Fix |
|-------|-------|-----|
| **Ghosting** | Temporal history not rejected fast enough | Reduce `MaxFramesAccumulated`, increase rejection strength |
| **Shimmer/sparkle** | Sub-pixel detail below render resolution | Increase `r.ScreenPercentage` or use `r.TSR.History.ScreenPercentage 200` |
| **Blurriness** | Too low screen percentage | Increase `r.ScreenPercentage`. Minimum recommended: 50% at 4K, 66% at 1440p |
| **High memory** | 200% history buffer | Use `r.TSR.History.R11G11B10 1` or reduce to 100% |

### UE 5.6 TSR Improvements
- **Thin geometry detection** improving temporal stability of thin geometry like foliage and hair (off by default: `r.TSR.ThinGeometryDetection`)
- Visualization mode: `r.TSR.Visualize 15` shows edge detection and partial coverage regions

### UE 5.7 TSR Improvements
- **Thin geometry detection expanded** — `r.TSR.ThinGeometryDetection.Coverage.ShadingRange=2` enables for all shading models
- **Ghosting reduction** — `r.TSR.ShadingRejection.ExposureOffset` restored
- **Temporal Responsiveness** — experimental custom material output node controlling history rejection (Default=0, Medium=0-0.5, Full=0.5-1.0)
- **Per-pixel motion vectors** — `Motion Vector World Offset (Per-Pixel)` via `r.Velocity.PixelShaderMotionVectorWorldOffset.Supported`
- **Translucency improvements** — `r.Velocity.OutputTranslucentClippedDepth.Supported`

### SMAA (UE 5.7+, Experimental)
New anti-aliasing option as alternative to TSR:
- Desktop: `r.AntiAliasingMethod=5`
- Mobile: `r.Mobile.AntiAliasing=5`
- Quality: `r.SMAA.Quality`
- Edge detection: `r.SMAA.EdgeMode` (color vs luminance)

### TAAU Fallback
For platforms that can't afford TSR:
- `r.AntiAliasingMethod 2` + `r.TemporalAA.Upsampling 1`
- Cheaper but lower quality than TSR
- Useful for mobile/Switch targets

### Dynamic Resolution
Combine TSR with dynamic resolution for frame-rate stability:
- `r.DynamicRes.OperationMode 1` (based on GPU time)
- `r.DynamicRes.MinScreenPercentage` / `r.DynamicRes.MaxScreenPercentage`
- TSR handles the upscaling, dynamic resolution adjusts input resolution to meet frame budget

## Best Practices

### VSM
1. **Prefer Nanite meshes** for shadow casters — VSM + Nanite is the optimal path
2. **Avoid WPO on shadow casters** — or fade WPO out at distance to limit cache invalidation
3. **Monitor cache efficiency** — `r.Shadow.Virtual.Visualize.CacheHits 1` should show mostly green
4. **Separate static cache** — keep `StaticSeparate 1` so static geometry is cached independently

### TSR
1. **Test at shipping resolution** — TSR quality varies significantly with output resolution
2. **Test with fast motion** — ghosting is most visible during quick camera movement or fast-moving objects
3. **Use Epic/Cinematic presets for quality** — the 200% history buffer is a major quality jump
4. **Combine with dynamic resolution** for frame-rate guarantees
5. **Alternative: DLSS/FSR** — NVIDIA DLSS and AMD FSR plugins can replace TSR with hardware-specific upscaling
