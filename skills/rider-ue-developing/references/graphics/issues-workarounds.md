# Common Rendering Issues & Workarounds

## Nanite Issues

### Thin Geometry Culling
**Symptom**: Tree branches, wires, fences disappear at distance.
**Cause**: Nanite's cluster-based LOD aggressively simplifies geometry below pixel threshold.
**Workaround**:
- Enable "Preserve Area" in Static Mesh → Nanite Settings
- Increase `r.Nanite.MaxPixelsPerEdge` (makes all Nanite coarser — not ideal)
- For critical thin meshes, use non-Nanite fallback with manual LODs

### WPO + VSM Shadow Bug (UE 5.5–5.6)
**Symptom**: Trees with World Position Offset wind animation don't cast shadows / have massive perf cost.
**Cause**: WPO invalidates VSM cache every frame; shadow data is lost in the process.
**Fix (UE 5.7+)**: Use **Nanite Skinning** with the **Dynamic Wind** plugin instead of WPO — Epic explicitly states WPO is "generally not suitable for Nanite due to its increased rendering cost."
**Workaround (pre-5.7)**:
- Disable WPO for shadow pass (requires C++ per-material flag)
- Use distance-based WPO fade-out

### Masked Material Performance
**Symptom**: Masked Nanite materials (foliage, fences) significantly slower than opaque.
**Cause**: Masked materials break Nanite's depth-only pre-pass optimization.
**Fix**: Use `r.Nanite.RasterSort 1` (UE 5.5+) for ~20% improvement on masked foliage.

### Streaming Pool Exhaustion
**Symptom**: Aggressive LOD degradation, geometry pop-in, low-quality meshes.
**Cause**: `r.Nanite.Streaming.StreamingPoolSize` exceeded.
**Fix**:
1. Monitor with `NaniteStats primary` (needs `r.ShaderPrint 1`)
2. Increase pool size if VRAM allows
3. Reduce mesh density or disable Nanite on small props

---

## Lumen Issues

### Light Leaking Through Walls
**Symptom**: Bright patches inside rooms from exterior light.
**Cause**: Software RT uses Mesh Distance Fields; thin walls (<10cm) produce inaccurate SDFs.
**Fixes**:
1. Use walls ≥20cm thick
2. Enable Two-Sided Distance Field Generation (mesh build settings)
3. Enable HWRT for thin geometry: `r.Lumen.HardwareRayTracing 1`
4. Visualize SDFs: `r.DistanceFieldAO.Visualize 1`

### HZB Traversal Leak (UE 5.6+)
**Symptom**: Light leaks between meshes after engine upgrade.
**Cause**: Disabling `r.Lumen.ScreenProbeGather.ScreenTraces.HZBTraversal` exposes leak path.
**Fix**: Keep HZB traversal enabled (it's on by default).

### Flickering Reflections
**Symptom**: Reflections flicker, especially on glossy surfaces or moving objects.
**Fix**:
```
r.Lumen.Reflections.Temporal.StabilityMultiplier 3  (up to 5)
r.Lumen.ScreenProbeGather.Temporal.MaxFramesAccumulated 30
```
Trade-off: more stability = more ghosting on fast motion.

### Dark Surface Artifacts (HWRT + Nanite)
**Symptom**: Unnaturally dark patches on Nanite surfaces with HWRT enabled.
**Cause**: Known bug in HWRT + Nanite Surface Cache interaction.
**Workaround**: Check for fixes in latest engine hotfixes. Temporary: adjust Surface Cache quality settings.

### Slow GI Convergence
**Symptom**: GI takes several seconds to settle after camera movement.
**Cause**: Temporal accumulation design — intentional trade-off.
**Fix**: Reduce `MaxFramesAccumulated` for faster response (increases noise).

---

## Shadow Issues

### VSM Shadow Popping
**Symptom**: Visible shadow resolution changes (popping) during camera movement.
**Fix**: Adjust `r.Shadow.Virtual.ResolutionLodBiasDirectional` / `ResolutionLodBiasLocal` (negative bias = higher resolution).

### VSM Cache Thrashing
**Symptom**: Shadow rendering cost spikes repeatedly.
**Cause**: Many dynamic or WPO objects invalidating cache.
**Fix**:
1. Reduce WPO usage on shadow casters
2. Set `r.Shadow.Virtual.Cache.StaticSeparate 1` (separates static cache)
3. Profile with `r.Shadow.Virtual.Visualize.CacheHits 1`

### Missing Shadows at Distance
**Symptom**: Directional light shadows cut off at a certain distance.
**Fix**:
- VSM: Increase `r.Shadow.Virtual.Clipmap.LastLevel`
- CSM: Increase `r.Shadow.CSM.MaxCascades` and `r.Shadow.DistanceScale`

---

## TSR Issues

### Ghosting on Fast Objects
**Symptom**: Trailing artifacts on fast-moving objects or during quick camera rotation.
**Fix**:
1. Reduce history accumulation strength
2. Increase `r.TSR.ShadingRejection.Flickering`
3. Ensure motion vectors are correct (skeletal meshes need proper velocity pass)

### Blurriness at Low Resolution
**Symptom**: Image looks soft/blurry, especially on fine detail (including thin foliage/hair).
**Fix**:
1. Increase `r.ScreenPercentage` (minimum 50% at 4K, 66% at 1440p)
2. Use `r.TSR.History.ScreenPercentage 200` (Epic/Cinematic preset)
3. Enable thin geometry detection: `r.TSR.ThinGeometryDetection 1` (5.6+), or `r.TSR.ThinGeometryDetection.Coverage.ShadingRange=2` for all shading models (5.7+)
4. Consider DLSS/FSR plugins for better upscaling quality

---

## Shader Compilation Issues

### Hitches / Stuttering on New Materials
**Symptom**: Frame spike when a new material or mesh combination is rendered for the first time.
**Cause**: PSO (Pipeline State Object) compilation stalls render thread.
**Fixes**:
1. Enable PSO Precaching: Project Settings → Rendering
2. Record PSO cache: launch with `-logPSO`, play game, then cook with collected cache
3. `r.PSOPrecaching.ProxyCreationWhenPSOReady 1`
4. UE 5.6 fix: PSO cache stall fix preventing unnecessary render thread stalls

### Shader Compilation Takes Too Long
**Symptom**: Editor startup or material changes take minutes to compile shaders.
**Fixes**:
1. Enable Shared Derived Data Cache (DDC)
2. Use Shader Compile Workers: ensure `ShaderCompileWorker` processes are running
3. Reduce permutations: check material complexity, reduce Static Switch Parameters
4. `r.Shaders.FastMath 1` (faster compilation, slight precision loss)

### "Failed to compile Material" in Logs
**Symptom**: Material renders as default gray; `LogShaderCompilers` shows failure.
**Diagnosis**:
1. Check `ue-exec.sh --warnings --filter "ShaderCompiler"` for specific error
2. Common causes: invalid node connections, unsupported features for target platform
3. Open material in editor → check error messages in graph

---

## Post-Processing Issues

### Bloom Washing Out Scene
**Symptom**: Bright areas cause excessive glow that obscures detail.
**Fix**: Reduce `BloomIntensity`, increase `BloomThreshold`, reduce emissive multipliers.

### Auto-Exposure Oscillation
**Symptom**: Screen brightness rapidly fluctuates.
**Fix**:
```
r.EyeAdaptation.SpeedUp 1.0   (slower adaptation)
r.EyeAdaptation.SpeedDown 1.0
```
Or narrow the min/max brightness range.

### Custom PP Material Not Rendering
**Symptom**: Custom post-process material has no visible effect.
**Causes**:
1. Not added to PostProcessVolume Blendables array
2. Wrong Blendable Location (Before/After Tonemapping)
3. Material domain not set to Post Process
4. Volume not set to Infinite Extent / actor not inside volume

---

## General Rendering Issues

### Editor Preview vs Shipping Build Mismatch
**Symptom**: Scene looks different in packaged build vs editor.
**Cause**: Editor uses different scalability settings, preview rendering mode.
**Fix**: Test with `Standalone Game` mode (`Alt+P`) or use shipping build for final validation.

### GPU Crash / Device Removed
**Symptom**: Editor/game crashes with "GPU crashed or device removed" error.
**Diagnosis**:
1. Enable GPU crash debugging: `r.GPUCrashDebugging 1`
2. DX12: `r.D3D12.DREDEnable 1` for detailed error info
3. Check for: out-of-VRAM, infinite shader loops, incorrect RDG barriers

### Mobile / Console Rendering Differences
**Symptom**: Scene looks different on mobile or console.
**Cause**: Different feature levels, different default CVars, platform-specific paths.
**Fix**: Use `Preview Rendering Level` in editor for target platform. Test on actual hardware frequently.
