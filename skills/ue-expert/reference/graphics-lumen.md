# Lumen — Global Illumination & Reflections

## Architecture

Lumen is a multi-layered dynamic GI and reflection system combining:
1. **Surface Cache** ("Lumen Scene") — low-res pre-shaded representation of all surfaces
2. **Ray Tracing** — software (Mesh Distance Fields) or hardware (BVH/RT cores)
3. **Temporal Accumulation** — multiple frames averaged for stability

### GI Pipeline
1. Surface Cache captures low-res direct + indirect lighting per mesh card
2. Screen-space probes are placed (importance-sampled toward previously bright directions)
3. Rays are traced from probes (SDF or HWRT) to gather radiance
4. Radiance is cached and temporally accumulated
5. Final gather interpolates probe results to screen pixels
6. Infinite bounces achieved via temporal feedback (this frame's GI feeds next frame's Surface Cache)

### Reflection Pipeline
1. Screen-Space Reflections (SSR) run first — cheapest, handles nearby reflections
2. Where SSR fails (off-screen geometry, glossy surfaces), Lumen traces rays via SDF or HWRT
3. Results are temporally accumulated and denoised

## Software vs Hardware Ray Tracing

| Aspect | Software RT (SWRT) | Hardware RT (HWRT) |
|--------|-----------------------|-------------|
| **Intersection** | Mesh Distance Fields (SDF) | BVH acceleration structures (RT cores) |
| **Hardware** | All DX11+ GPUs | DX12 with RT support (NVIDIA RTX, AMD RDNA2+) |
| **Quality** | Good for most cases. Struggles with thin geometry. | Higher fidelity, handles thin walls. |
| **Performance** | Cheaper per ray | More expensive but more accurate; heavily optimized in 5.6+ |
| **Enable** | Default (pre-5.7) | `r.Lumen.HardwareRayTracing 1` |
| **Status** | **DEPRECATED** (5.6+) — detail traces deprecated, won't receive further work | **Recommended path** — Epic's focus going forward |

### IMPORTANT: SWRT Deprecation (UE 5.6+)
- `r.Lumen.TraceMeshSDFs` (SWRT detail tracing) is deprecated as of UE 5.6
- HWRT is the recommended rendering path going forward
- Epic is consolidating Lumen to a single HWRT path at 60Hz
- For projects requiring SWRT compatibility (no RT hardware), screen traces still work but detail traces are frozen

### HWRT + Surface Cache (Hybrid)
- HWRT hits read lighting from the Surface Cache instead of full shading
- Best balance of quality and performance
- Enable: `r.Lumen.HardwareRayTracing 1` (Surface Cache is used by default)

### HWRT Without Surface Cache
- Full shading at hit points — highest quality, highest cost
- For cinematics or archviz, not real-time gameplay

## Final Gather Methods

Three methods selectable via `r.Lumen.FinalGatherMethod`:
- `0` — **IrradianceFieldGather** — world-space irradiance field (legacy)
- `1` — **ScreenProbeGather** — screen-space probe-based gather (default)
- `2` — **ReSTIRGather** — Reservoir-based Importance Resampling (5.7+, experimental)

## Reflection Passes

Three independent reflection passes (`ELumenReflectionPass`):
- `Opaque` — standard opaque reflections
- `SingleLayerWater` — water surface reflections (enabled separately via `ShouldRenderLumenReflectionsWater()`)
- `FrontLayerTranslucency` — translucent front layer GI/reflections (separate from opaque)

## CVars

### Core
| CVar | Description | Default |
|------|-------------|---------|
| `r.DynamicGlobalIlluminationMethod` | 0=None, 1=Lumen, 2=SSGI | 1 |
| `r.ReflectionMethod` | 1=Lumen, 2=HWRT standalone | 1 |
| `r.Lumen.HardwareRayTracing` | Enable HWRT for Lumen | 0 |
| `r.Lumen.TraceMeshSDFs` | Enable SDF tracing (SWRT, deprecated 5.6+) | 1 |
| `r.Lumen.FinalGatherMethod` | 0=IrradianceField, 1=ScreenProbe, 2=ReSTIR | 1 |
| `r.Lumen.LightingDataFormat` | 0=R11G11B10, 1=Float16, 2=Float32 | 0 |
| `r.Lumen.AsyncCompute` | Use async compute | 1 |
| `r.Lumen.WaveOps` | Use wave operations | 1 |
| `r.Lumen.TraceDistanceScale` | Scale all tracing distances (scalability) | 1.0 |

### Screen Probe Gather
| CVar | Description | Default |
|------|-------------|---------|
| `r.Lumen.ScreenProbeGather.DownsampleFactor` | Probe grid size in pixels | 16 |
| `r.Lumen.ScreenProbeGather.TracingOctahedronResolution` | Ray directions per probe (8 = 64 rays) | 8 |
| `r.Lumen.ScreenProbeGather.NumAdaptiveProbes` | Max adaptive probes per uniform probe | 8 |
| `r.Lumen.ScreenProbeGather.AdaptiveProbeAllocationFraction` | Fraction of budget for adaptive probes | 0.5 |
| `r.Lumen.ScreenProbeGather.RadianceCache` | World-space persistent radiance cache | 1 |
| `r.Lumen.ScreenProbeGather.IntegrationTileClassification` | Tile classification for occupancy | 1 |
| `r.Lumen.ScreenProbeGather.ShortRangeAO` | Full-res contact shadow/AO | 1 |
| `r.Lumen.ScreenProbeGather.MaxRoughness` | Max roughness for rough specular | 0.6 |
| `r.Lumen.ScreenProbeGather.MaxRayIntensity` | Firefly clamp | 10 |
| `r.Lumen.ScreenProbeGather.SpatialFilterProbes` | Spatial filter (noise vs stability) | 1 |
| `r.Lumen.ScreenProbeGather.IrradianceFormat` | 0=SH3, 1=Octahedral (faster) | 1 |
| `r.Lumen.ScreenProbeGather.DiffuseIntegralMethod` | 0=Preintegrated, 1=ImportanceSample, 2=Numerical | 0 |

### Temporal
| CVar | Description | Default |
|------|-------------|---------|
| `r.Lumen.ScreenProbeGather.Temporal.MaxFramesAccumulated` | Frames to accumulate (lower=faster, more flicker) | 10.0 |
| `r.Lumen.ScreenProbeGather.Temporal.DistanceThreshold` | Discard threshold (lower=less ghosting, more flicker) | 0.01 |
| `r.Lumen.ScreenProbeGather.Temporal.DistanceThresholdForFoliage` | Relaxed threshold for foliage | 0.03 |
| `r.Lumen.ScreenProbeGather.Temporal.MaxFramesAccumulated` | Frames to accumulate | 10.0 |
| `r.Lumen.Reflections.Temporal.StabilityMultiplier` | Reflection flicker reduction (1-5) | 1 |
| `r.LumenScene.Radiosity.Temporal.MaxFramesAccumulated` | Radiosity accumulation (faster but noisier) | 4 |

### HWRT
| CVar | Description | Default |
|------|-------------|---------|
| `r.Lumen.HardwareRayTracing.Inline` | Inline ray tracing instead of RayGen | 0 |
| `r.Lumen.HardwareRayTracing.LightingMode` | 0=NoHitLighting, 1=HitLighting, 2=Deferred | 0 |
| `r.Lumen.HardwareRayTracing.ShaderExecutionReordering` | SER on NVIDIA hardware | 0 |
| `r.Lumen.HardwareRayTracing.MaxIterations` | Max traversal iterations | 256 |
| `r.Lumen.HardwareRayTracing.MinTraceDistanceToSampleSurfaceCache` | Min distance before sampling surface cache | 4.0 |

### Radiosity (Multi-Bounce)
| CVar | Description | Default |
|------|-------------|---------|
| `r.LumenScene.Radiosity` | Enable multi-bounce radiosity | 1 |
| `r.LumenScene.Radiosity.ProbeSpacing` | Distance between probes (texels) | 4 |
| `r.LumenScene.Radiosity.HemisphereProbeResolution` | Traces per hemisphere dimension (4=16 rays) | 4 |
| `r.LumenScene.Radiosity.MaxRayIntensity` | Clamp bright emissive sources | 40.0 |
| `r.LumenScene.Radiosity.SpatialFilterProbes` | Spatial filter (noise vs leaking trade-off) | 1 |
| `r.LumenScene.Radiosity.ProbeOcclusion` | Depth test during interpolation (SWRT only) | 0 |
| `r.LumenScene.Radiosity.ProbeOcclusionStrength` | 0=no occlusion, 1=stop all leaking | 0.5 |

### ReSTIR Gather (5.7+)
| CVar | Description | Default |
|------|-------------|---------|
| `r.Lumen.ReSTIRGather.DownsampleFactor` | Main perf control | 2 |
| `r.Lumen.ReSTIRGather.TemporalResampling` | Temporal resampling pass | 1 |
| `r.Lumen.ReSTIRGather.SpatialResampling` | Spatial resampling | 1 |
| `r.Lumen.ReSTIRGather.SpatialResampling.NumPasses` | Number of spatial passes | 2 |
| `r.Lumen.ReSTIRGather.SpatialResampling.NumSamples` | Samples per pass | 4 |

### Far-Field
| CVar | Description | Default |
|------|-------------|---------|
| `r.Lumen.FarField.Enable` | Far-field GI for large worlds (>1km) | — |
| `r.Lumen.FarField.MaxTraceDistance` | Maximum far-field trace distance | — |
| `r.LumenScene.FarField.OcclusionOnly` | Occlusion-only far field (~50% faster, 5.6+) | 0 |

### Performance (5.6+)
| CVar | Description | Default |
|------|-------------|---------|
| `r.Lumen.ScreenProbeGather.IntegrateDownsampleFactor` | Integration downsampling (~3x faster, 5.6+) | — |
| `r.Lumen.ScreenProbeGather.StochasticInterpolation` | Half-res integration (2=half-res, 5.7+) | — |
| `r.LumenScene.DumpStats` | Dump Lumen scene stats (3=primitive culling, 5.7+) | 0 |
| `r.LumenScene.SurfaceCache.Compress` | Surface cache compression (0=off, 1=UAV alias, 2=copy) | 1 |

## Common Artifacts & Fixes

### Light Leaking
**Symptom**: Light appears inside rooms where it shouldn't.
**Causes**:
- Thin walls (<10cm) produce inaccurate Mesh Distance Fields
- Gaps in mesh geometry (non-watertight)
- `r.Lumen.ScreenProbeGather.ScreenTraces.HZBTraversal` disabled (UE 5.6+ bug)

**Fixes**:
1. Use walls ≥20cm thick
2. Check SDFs: `r.DistanceFieldAO.Visualize 1` — look for gaps at thin geometry
3. Enable Two-Sided Distance Field Generation in mesh build settings
4. Keep HZB traversal enabled: `r.Lumen.ScreenProbeGather.ScreenTraces.HZBTraversal 1`
5. For persistent leaks, add blocking geometry behind thin walls

### Flickering / Noise
**Symptom**: GI or reflections flicker, especially on moving objects.
**Fixes**:
1. Increase temporal accumulation: `r.Lumen.ScreenProbeGather.Temporal.MaxFramesAccumulated 30`
2. Increase reflection stability: `r.Lumen.Reflections.Temporal.StabilityMultiplier 3` (up to 5)
3. Trade-off: more stability = more ghosting on fast motion

### Dark Surfaces / Black Patches
**Symptom**: Some surfaces appear unnaturally dark.
**Causes**:
- Corrupted distance fields from thin or single-sided meshes
- HWRT + Nanite interaction bug (UE 5.6+)

**Fixes**:
1. Enable "Two-Sided Distance Field Generation" in Static Mesh Build Settings
2. Ensure meshes are closed/watertight
3. Rebuild distance fields: `r.DistanceFieldBuildQuality 3` (higher quality)

### GI Lag / Ghosting
**Symptom**: GI updates lag behind fast-moving lights or objects.
**Cause**: Temporal accumulation needs multiple frames to converge.
**Fixes**:
1. Reduce `MaxFramesAccumulated` (trades stability for responsiveness)
2. Use HWRT for faster convergence on dynamic objects
3. Accept some lag — Lumen's design trades latency for quality

## UE Version Changes

### UE 5.5
- **Path Tracer** moved to Production-Ready status
- **MegaLights (Experimental)** — new stochastic direct lighting system for many dynamic shadow-casting lights (see megalights.md)

### UE 5.6
- **HWRT performance gains**:
  - ShortRangeAO runs at half resolution with denoiser (~2x faster on console)
  - Far Field 30% faster; new occlusion-only mode ~50% faster (`r.LumenScene.FarField.OcclusionOnly 1`)
  - Shader Execution Reordering (SER) support (`r.Lumen.HardwareRayTracing.ShaderExecutionReordering`)
  - Screen Probe Gather integration downsampling ~3x faster (`r.Lumen.ScreenProbeGather.IntegrateDownsampleFactor`)
  - Adaptive probe placement reducing probe count while maintaining visuals
  - Surface Cache updates driven by frustum distance — 2x faster page updates
- **Firefly filtering** now more aggressive by default (`r.Lumen.ScreenProbeGather.MaxRayIntensity` reduced from 40 to 10)
- **Output format** reduced to 32 bits saving 0.02-0.03ms on console
- **SWRT detail traces deprecated** — HWRT is the recommended scaling path going forward

### UE 5.7
- **SWRT detail tracing** (`r.Lumen.TraceMeshSDFs`) fully deprecated — won't receive further work
- **HWRT** consolidating as the single recommended path at 60Hz
- **Half-res integration** on High scalability: `r.Lumen.ScreenProbeGather.StochasticInterpolation 2` saves ~0.5ms at 1080p
- Continued aggressive firefly filtering: `r.Lumen.ScreenProbeGather.MaxRayIntensity 10`
- `r.LumenScene.DumpStats 3` for primitive culling diagnostics
- Consolidated GBuffer tile classification into single pass shared between Lumen and MegaLights
- Screen tile marking optimizations accelerate reflections, GI, and water reflections
- Sharper reflections and better indirect lighting for interior spaces

## Best Practices

1. **Design geometry for Lumen** — thick walls (≥20cm), closed volumes, no single-sided geometry
2. **Use Lumen Scene visualization** — `r.Lumen.Visualize.CardPlacement 1` to check Surface Cache coverage
3. **Balance temporal settings** — start with defaults, increase stability only where needed
4. **HWRT for interiors** — thin walls and complex occlusion benefit most from HWRT
5. **Prefer HWRT over SWRT** — SWRT detail tracing is deprecated as of 5.6; HWRT is the future path
6. **Monitor Surface Cache** — `r.Lumen.Visualize.SurfaceCache 1` to check for missing/stale cards
7. **Far-field for open worlds** — enable for GI beyond ~1km; use `r.LumenScene.FarField.OcclusionOnly 1` (5.6+) for better performance
