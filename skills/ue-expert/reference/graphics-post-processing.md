# Post-Processing Pipeline

## Post-Processing Pass Order

Passes executed in this order (`EPass` enum, `PostProcessing.cpp`):
1. MotionBlur
2. PostProcessMaterial **BeforeBloom**
3. Tonemap
4. FXAA / SMAA
5. PostProcessMaterial **AfterTonemapping**
6. DOF, Lumen visualization, MegaLights debug, etc.
7. PrimaryUpscale (TSR/TAA), SecondaryUpscale
8. Editor overlays (selection outline, debug primitives)

**Scene color format** (determined at runtime):
```cpp
// PostProcessing.cpp
const EPixelFormat SceneColorFormat = bProcessSceneColorAlpha
    ? PF_FloatRGBA      // alpha propagation enabled
    : PF_FloatR11G11B10; // default — saves bandwidth
```
Override alpha propagation: `r.PostProcessing.PropagateAlpha`.

## Post-Process Volume (PPV)

### Setup
1. Place `APostProcessVolume` in the level
2. Set **Infinite Extent (Unbound)** for global effects, or use bounds for localized
3. Configure **Priority** for volume blending (higher wins)
4. **Blend Weight** (0-1) controls effect intensity
5. Add custom post-process materials to the **Blendables** array

### Key Properties
```
PostProcessVolume:
  Settings:
    bOverride_* → must be true for each overridden setting
    BloomIntensity, BloomThreshold, BloomSizeScale
    DepthOfFieldFstop, DepthOfFieldFocalDistance, DepthOfFieldSensorWidth
    MotionBlurAmount, MotionBlurMax
    AutoExposureMinBrightness, AutoExposureMaxBrightness
    ColorGradingLUT, ColorSaturation, ColorContrast
    AmbientOcclusionIntensity, AmbientOcclusionRadius
    ScreenSpaceReflectionIntensity, ScreenSpaceReflectionQuality
```

## Built-in Effects

### Bloom
- Convolution-based (multi-pass Gaussian on mip chain)
- `Intensity` — overall bloom strength (0-8, default 0.675)
- `Threshold` — minimum brightness to bloom (-1 to 8, default -1 = all)
- `SizeScale` — scales the bloom radius (default 4.0)
- Individual mip weights: `#1` through `#6` control each bloom pass size
- `Convolution/Kernel` — for FFT-based bloom (expensive but physically accurate)

### Depth of Field
- **Cinematic DOF** (default) — physically-based, aperture-shaped bokeh
  - `FStop` — aperture (lower = more blur, 1.4-22)
  - `Focal Distance` — focus point distance
  - `Sensor Width` — camera sensor size (affects DOF range)
- **Gaussian DOF** — cheaper, smoother, less physically accurate
- **Mobile DOF** — optimized for mobile platforms

### Motion Blur
- Per-object + camera motion blur
- `Amount` — blur intensity (0-1, default 0.5)
- `Max` — maximum blur radius in percent of screen (default 5.0)
- `PerObjectSize` — per-object blur scale

### Exposure / Auto-Exposure
- **Auto Exposure (Histogram)** — default, analyzes histogram of scene luminance
  - `MinBrightness` / `MaxBrightness` — clamp range
  - `SpeedUp` / `SpeedDown` — adaptation speed (seconds)
  - `ExposureCompensation` — manual bias
  - `HistogramLogMin` / `HistogramLogMax` — histogram range
- **Auto Exposure (Basic)** — simpler average-based
- **Manual** — fixed exposure value, no auto-adjustment

### Color Grading
- Per-channel control: `Saturation`, `Contrast`, `Gamma`, `Gain`, `Offset`
- Applied in 4 zones: Global, Shadows, Midtones, Highlights
- `WhiteTemp` / `WhiteTint` — color temperature
- **LUT (Look-Up Table)** — apply a color grading LUT texture
  - `ColorGradingLUT` — 256×16 or 1024×32 unwrapped 3D LUT texture

### Ambient Occlusion
- GTAO (Ground-Truth Ambient Occlusion) in UE5
- `Intensity` (0-1), `Radius` (world units), `Power`
- Less important with Lumen (which provides more accurate AO)
- UE 5.6: ShortRangeAO runs at half resolution with denoiser (~2x faster on console with HWRT)

## Custom Post-Process Materials

### Material Setup
1. Material Domain: **Post Process**
2. Shading Model: **Unlit** (forced)
3. Blendable Location: select where in the PP pipeline this runs

### Blendable Locations

| Location | Access | Use Case |
|----------|--------|----------|
| `Before Tonemapping` | HDR scene color | Color manipulation, custom bloom, HDR effects |
| `After Tonemapping` | LDR scene color | LUT application, vignette, film grain |
| `Before Translucency` | Before translucent pass | Distortion, underwater refraction |
| `Replacing the Tonemapper` | Full pipeline control | Custom tonemapping curves |
| `SSR Input` | Before SSR | Modify what SSR reflects |

### Scene Texture Inputs

| Node | Content |
|------|---------|
| `SceneTexture:SceneColor` | Current scene color (HDR or LDR depending on location) |
| `SceneTexture:SceneDepth` | Scene depth buffer (linear depth) |
| `SceneTexture:WorldNormal` | World-space normals from GBuffer |
| `SceneTexture:GBufferAO` | AO from GBuffer |
| `SceneTexture:CustomDepth` | Custom depth buffer (per-actor opt-in) |
| `SceneTexture:CustomStencil` | Custom stencil buffer (8-bit, per-actor) |
| `SceneTexture:Velocity` | Motion vectors |
| `SceneTexture:PostProcessInput0` | Previous PP pass output (for chaining) |

### User Scene Textures (UE 5.1+)
Create intermediate textures for multi-pass effects:
1. Material A writes to a User Scene Texture (downsampled/blurred)
2. Material B reads from that User Scene Texture
3. Enables custom bloom, variable blur, multi-pass distortion

### Adding PP Material to Volume
```python
# Via Python automation
import unreal

# Create material instance
mat = unreal.EditorAssetLibrary.load_asset('/Game/PostProcess/PP_EdgeDetect')

# Get post-process volume
ppv = unreal.EditorActorSubsystem().get_all_level_actors_of_class(unreal.PostProcessVolume)[0]

# Add to blendables
settings = ppv.get_editor_property('settings')
weightable = unreal.WeightedBlendable()
weightable.weight = 1.0
weightable.object = mat
# Note: blendables array manipulation requires C++ or BP; Python access is limited
```

## Performance Considerations

### Cost Ranking (cheapest to most expensive)
1. **Built-in PPV settings** — optimized, batched, hardware-accelerated
2. **Simple custom PP material** — few texture samples, basic math
3. **Multi-pass custom PP** — User Scene Textures add passes
4. **Custom PP with SceneDepth/Normals** — additional GBuffer reads
5. **Replacing the Tonemapper** — full pipeline replacement

### Optimization Tips
1. Prefer built-in PPV settings over custom materials when possible
2. Use `r.PostProcessAAQuality` to control AA quality vs performance
3. Custom PP materials: minimize texture samples and ALU instructions
4. Use `SceneTexture:PostProcessInput0` for chaining instead of sampling SceneColor multiple times
5. Profile with `stat GPU` — look at PostProcessing category
6. Disable unnecessary effects per-platform in scalability settings

## CVars

### Quality
| CVar | Description |
|------|-------------|
| `r.BloomQuality` | 0=off, 1-5=quality levels |
| `r.DepthOfFieldQuality` | 0=off, 1-4=quality levels |
| `r.MotionBlurQuality` | 0=off, 1-4=quality levels |
| `r.EyeAdaptationQuality` | 0=off, 1-3=quality levels |
| `r.AmbientOcclusionLevels` | 0=off, 1-3=quality levels |
| `r.Tonemapper.Quality` | Tonemapper quality |
| `r.PostProcessAAQuality` | AA quality in post-process |
| `ShowFlag.PostProcessing` | Toggle all post-processing on/off |
| `ShowFlag.Bloom` | Toggle bloom specifically |

### Bloom (FFT)
| CVar | Description | Default |
|------|-------------|---------|
| `r.Bloom.ApplyLocalExposure` | Apply local exposure to bloom | 1 |
| `r.Bloom.ScreenPercentage` | FFT bloom screen resolution % | 100.0 |
| `r.Bloom.CacheKernel` | Cache FFT bloom kernel | 1 |
| `r.Bloom.AsyncCompute` | Async compute for FFT bloom | 1 |

### Depth of Field
| CVar | Description | Default |
|------|-------------|---------|
| `r.DepthOfField.MaxSize` | Max DOF circle of confusion radius | 100.0 |
| `r.DOF.Gather.ResolutionDivisor` | Resolution divisor for gather pass | 2 |
| `r.DOF.Recombine.Quality` | Recombine pass quality | — |

### Eye Adaptation / Auto-Exposure
| CVar | Description | Default |
|------|-------------|---------|
| `r.EyeAdaptation.PreExposureOverride` | Override pre-exposure value | 0 |
| `r.EyeAdaptation.ExposureCompensationCurveLUT` | Use exposure compensation LUT | 1 |
| `r.AutoExposure.IgnoreMaterials` | Ignore specific materials in auto-exposure | 0 |
| `r.AutoExposure.LuminanceMethod` | Luminance calculation method | 0 |

### General
| CVar | Description | Default |
|------|-------------|---------|
| `r.PostProcessing.PropagateAlpha` | Propagate alpha through PP chain | false |
| `r.PostProcessing.PreferCompute` | Use compute shaders for PP | 0 |
| `r.PostProcessing.DownsampleQuality` | Downsample quality (0=low, 1=high) | 0 |
| `r.PostProcessing.UserSceneTextureDebug` | Debug user scene textures (0=off, 2=on error) | 2 |
