# Graphics CVars Reference

Organized by subsystem. Set via console (`~` key), DefaultEngine.ini `[/Script/Engine.RendererSettings]`, or Python `execute_console_command()`.

## Nanite

| CVar | Description | Default | Range |
|------|-------------|---------|-------|
| `r.Nanite` | Enable/disable Nanite | 1 | 0-1 |
| `r.Nanite.MaxPixelsPerEdge` | LOD threshold (higher=coarser) | 1 | 0.1-8 |
| `r.Nanite.Streaming.StreamingPoolSize` | GPU memory budget (MB) | Platform | 128-4096 |
| `r.Nanite.Streaming.NumInitialRootPages` | Preloaded pages at startup | — | — |
| `r.Nanite.MaxCandidateClusters` | Cluster budget cap | — | — |
| `r.Nanite.AllowSplineMeshes` | Spline mesh support (5.5+) | 0 | 0-1 |
| `r.Nanite.RasterSort` | Sort rasterizers for masked (5.5+) | — | — |
| `r.Nanite.Visualize.Triangles` | Debug: LOD visualization | 0 | 0-1 |
| `r.Nanite.Visualize.Overdraw` | Debug: overdraw visualization | 0 | 0-1 |
| `r.Nanite.Visualize.Clusters` | Debug: cluster boundaries | 0 | 0-1 |
| `r.Nanite.Filter.MaxPixelsPerEdge` | Per-asset LOD override | — | — |
| `r.Nanite.StaticGeometryInstanceCull` | Specialized static instance culling (5.6+) | 0 | 0-1 |
| `r.Nanite.Culling.MinLOD` | Min LOD culling check (5.7+) | 1 | 0-1 |
| `r.Nanite.PrimeHZB` | HZB priming after camera cuts (5.7+, experimental) | — | — |

## Lumen

| CVar | Description | Default | Range |
|------|-------------|---------|-------|
| `r.DynamicGlobalIlluminationMethod` | 0=None, 1=Lumen, 2=SSGI | 1 | 0-2 |
| `r.ReflectionMethod` | 1=Lumen, 2=HWRT standalone | 1 | 0-2 |
| `r.Lumen.HardwareRayTracing` | Enable HWRT | 0 | 0-1 |
| `r.Lumen.TraceMeshSDFs` | Software RT mesh SDF tracing | 1 | 0-1 |
| `r.Lumen.Reflections.MaxRoughnessToTrace` | Skip reflections on rough surfaces | 0.4 | 0-1 |
| `r.Lumen.ScreenProbeGather.DownsampleFactor` | Probe density (lower=more) | 16 | 4-32 |
| `r.Lumen.ScreenProbeGather.TracingOctahedronResolution` | Rays per probe | 8 | 4-16 |
| `r.Lumen.ScreenProbeGather.Temporal.MaxFramesAccumulated` | Temporal stability | ~8-16 | 1-64 |
| `r.Lumen.Reflections.Temporal.StabilityMultiplier` | Reflection flicker reduction | 1 | 0.1-5 |
| `r.Lumen.ScreenProbeGather.ScreenTraces.HZBTraversal` | HZB screen traces | 1 | 0-1 |
| `r.Lumen.FarField.Enable` | Far-field GI (>1km) | — | 0-1 |
| `r.LumenScene.FarField.OcclusionOnly` | Occlusion-only far field (~50% faster, 5.6+) | 0 | 0-1 |
| `r.Lumen.HardwareRayTracing.ShaderExecutionReordering` | SER for HWRT (5.6+) | — | 0-1 |
| `r.Lumen.ScreenProbeGather.IntegrateDownsampleFactor` | Integration downsampling (~3x faster, 5.6+) | — | — |
| `r.Lumen.ScreenProbeGather.StochasticInterpolation` | Half-res integration (2=half-res, 5.7+) | — | — |
| `r.LumenScene.DumpStats` | Dump Lumen scene stats (3=primitive culling, 5.7+) | 0 | 0-3 |

## Shadows

| CVar | Description | Default | Range |
|------|-------------|---------|-------|
| `r.Shadow.Virtual.Enable` | 0=Cascade, 1=VSM | 1 | 0-1 |
| `r.Shadow.Virtual.Cache.StaticSeparate` | Separate static cache | 1 | 0-1 |
| `r.Shadow.Virtual.MaxPhysicalPages` | Max physical shadow pages | — | — |
| `r.Shadow.Virtual.ResolutionLodBiasDirectional` | Directional light LOD bias | — | — |
| `r.Shadow.Virtual.ResolutionLodBiasLocal` | Local light LOD bias | — | — |
| `r.Shadow.RadiusThreshold` | Skip shadows below this radius | — | — |
| `r.Shadow.Virtual.Clipmap.FirstLevel` | First clipmap level | — | — |
| `r.Shadow.Virtual.Clipmap.LastLevel` | Last clipmap level | — | — |
| `r.Shadow.CSM.MaxCascades` | Max cascade shadow maps (non-VSM) | 3 | 1-10 |
| `r.Shadow.DistanceScale` | Shadow distance multiplier | 1.0 | — |
| `r.Shadow.Virtual.UseReceiverMask` | Receiver masks for clipmap culling (5.6+) | 0 (5.6), 1 (5.7+) | 0-1 |
| `r.shadow.virtual.usereceivermasklocal` | Receiver masks for local lights (5.6+) | — | 0-1 |
| `r.Shadow.Virtual.Clipmap.CullDynamicTightly` | Tight dynamic culling with receiver mask (5.6+) | 1 | 0-1 |
| `r.Shadow.DoesFadeUseResolutionScale` | Shadow fade depends on resolution scale (5.6+) | — | 0-1 |

## TSR / Anti-Aliasing

| CVar | Description | Default | Range |
|------|-------------|---------|-------|
| `r.AntiAliasingMethod` | 0=None, 1=FXAA, 2=TAAU, 4=TSR | 4 | 0-4 |
| `r.ScreenPercentage` | Render resolution % | Varies | 25-200 |
| `r.TSR.History.ScreenPercentage` | History buffer resolution % | 100-200 | 50-400 |
| `r.TSR.ShadingRejection.Flickering` | Flicker rejection | — | — |
| `r.TSR.RejectionAntiAliasingQuality` | AA quality of rejection | — | — |
| `r.TSR.Resurrection` | Resurrect rejected detail | — | — |
| `r.TSR.History.R11G11B10` | Use smaller history format | — | 0-1 |
| `r.TSR.ThinGeometryDetection` | Thin geometry detection for foliage/hair (5.6+) | 0 | 0-1 |
| `r.TSR.ThinGeometryDetection.Coverage.ShadingRange` | Thin geometry detection range (2=all models, 5.7+) | — | — |
| `r.TSR.ShadingRejection.ExposureOffset` | Ghosting reduction (5.7+) | — | — |
| `r.TSR.Visualize` | TSR visualization mode (15=edge detection, 5.6+) | 0 | — |
| `r.TemporalAA.Upsampling` | Enable TAAU (alt to TSR) | 0 | 0-1 |
| `r.AntiAliasingMethod` | 0=None, 1=FXAA, 2=TAAU, 4=TSR, **5=SMAA (5.7+)** | 4 | 0-5 |
| `r.SMAA.Quality` | SMAA quality level (5.7+, experimental) | — | — |

## Dynamic Resolution

| CVar | Description | Default |
|------|-------------|---------|
| `r.DynamicRes.OperationMode` | 0=Off, 1=GPU time, 2=game thread | 0 |
| `r.DynamicRes.MinScreenPercentage` | Floor for dynamic resolution | 50 |
| `r.DynamicRes.MaxScreenPercentage` | Ceiling for dynamic resolution | 100 |
| `r.DynamicRes.TargetedGPUHeadRoom` | Target GPU headroom % | — |

## Post-Processing

| CVar | Description | Default |
|------|-------------|---------|
| `r.BloomQuality` | 0=off, 1-5=quality | 5 |
| `r.DepthOfFieldQuality` | 0=off, 1-4=quality | 2 |
| `r.MotionBlurQuality` | 0=off, 1-4=quality | 4 |
| `r.EyeAdaptationQuality` | 0=off, 1-3=quality | 2 |
| `r.AmbientOcclusionLevels` | 0=off, 1-3=levels | 3 |
| `r.Tonemapper.Quality` | Tonemapper quality | — |
| `r.PostProcessAAQuality` | Post-process AA quality | — |
| `ShowFlag.PostProcessing` | Toggle all PP | 1 |
| `ShowFlag.Bloom` | Toggle bloom | 1 |

## Distance Fields

| CVar | Description | Default |
|------|-------------|---------|
| `r.DistanceFieldAO.Visualize` | Visualize mesh distance fields | 0 |
| `r.DistanceFieldBuildQuality` | SDF build quality (1-3) | 2 |
| `r.GenerateMeshDistanceFields` | Generate SDFs for static meshes | 1 |

## Ray Tracing (Hardware)

| CVar | Description | Default |
|------|-------------|---------|
| `r.RayTracing` | Enable DX12 ray tracing | 0 |
| `r.RayTracing.ForceAllRayTracingEffects` | Force all RT effects on | 0 |
| `r.RayTracing.Shadows` | RT shadows | 0 |
| `r.RayTracing.AmbientOcclusion` | RT ambient occlusion | 0 |
| `r.RayTracing.Reflections` | RT reflections (standalone, not Lumen) | 0 |
| `r.RayTracing.GlobalIllumination` | RT GI (standalone, not Lumen) | 0 |

## MegaLights (5.5+)

| CVar | Description | Default | Range |
|------|-------------|---------|-------|
| `r.MegaLights.Enable` | Enable MegaLights (also in Project Settings) | 0 | 0-1 |
| `r.MegaLights.DefaultShadowMethod` | Default shadow method for MegaLights | — | — |
| `r.MegaLights.DownsampleFactor` | Quality/performance scaling (5.6+) | — | 1-2 |
| `r.MegaLights.DownsampleMode` | Consolidated downsample control (5.7+) | — | — |
| `r.MegaLights.DownsampleCheckerboard` | Half-resolution checkerboard (5.7+) | — | 0-1 |
| `r.MegaLights.HardwareRayTracing.ForceTwoSided` | Force two-sided for raster matching (5.7+) | — | 0-1 |

## Texture Streaming

| CVar | Description | Default |
|------|-------------|---------|
| `r.Streaming.PoolSize` | Texture streaming pool (MB) | Platform |
| `r.Streaming.MipBias` | Global mip bias (negative=sharper) | 0 |
| `r.Streaming.MaxEffectiveScreenSize` | Cap effective resolution for streaming | 0 |
| `r.VirtualTextures` | Enable virtual textures | 0 |
| `r.VirtualTexturedLightmaps` | Virtual textured lightmaps | 0 |

## Rendering Debug

| CVar | Description |
|------|-------------|
| `r.ShaderPrint 1` | Enable shader debug print |
| `r.ShaderComplexityMode` | Shader complexity visualization |
| `r.RDG.Debug 1` | RDG validation |
| `r.RDG.ImmediateMode 1` | Bypass RDG scheduling |
| `r.GPUCrashDebugging 1` | GPU crash breadcrumbs |
| `r.D3D12.DREDEnable 1` | DX12 DRED diagnostics |
| `r.ShaderDevelopmentMode 1` | Shader dev features |
| `r.Shaders.Optimize 0` | Disable shader optimization |
| `r.Shaders.KeepDebugInfo 1` | Keep debug info |
| `r.DumpShaderDebugInfo 1` | Dump shader intermediates |

## PSO Caching

| CVar | Description |
|------|-------------|
| `r.PSOPrecaching` | Enable PSO precaching |
| `r.PSOPrecaching.ProxyCreationWhenPSOReady` | Delay proxy creation until PSO ready |
| `-logPSO` | Launch flag to record PSO usage |
| `-clearPSODriverCache` | Clear driver PSO cache |

## Shader & Material (5.6+)

| CVar | Description |
|------|-------------|
| `ListShaders` | Console command: runtime shader memory analysis (5.6+) |
| `r.128BitBPPSCompilation.Allow` | Disabling saves ~50k shaders / 15 MiB (5.7+, default true) |
| `r.Velocity.PixelShaderMotionVectorWorldOffset.Supported` | Per-pixel motion vectors in materials (5.7+) |
| `r.Velocity.OutputTranslucentClippedDepth.Supported` | Translucency depth improvements (5.7+) |
| `r.ViewTextureMipBias.Quantization` | Sampler state proliferation reduction (5.6+, default 1024) |

## Deprecations

| CVar / Feature | Version | Notes |
|----------------|---------|-------|
| `r.Lumen.TraceMeshSDFs` | 5.6 deprecated, 5.7 dead | SWRT detail tracing — use HWRT instead |
| `r.UseClusteredDeferredShading` | 5.7 deprecated | Marked for removal |
| In-editor ProfileGPU UI | 5.6 removed | Use console `ProfileGPU` dump or Unreal Insights instead |
