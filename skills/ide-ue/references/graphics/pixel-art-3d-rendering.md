# Pixel Art 3D Rendering in Unreal Engine

Techniques for achieving crisp, stylized pixel art aesthetics using 3D geometry and a custom rendering pipeline. Synthesized from deep-dive research on pixel-perfect rendering architecture, water/ocean rendering, and outline systems.

---

## Core Philosophy

- **3D geometry as foundation**: Use 3D meshes for all the benefits (dynamic lighting, physics, camera freedom, animation) but render the output to look like classic pixel art.
- **Two enemies**: linear filtering (blurs pixel edges) and anti-aliasing (smooths silhouettes). The entire custom pipeline exists to defeat both.
- **Constraints as aesthetic**: Deliberately limit color palette, resolution, and edge treatment even when hardware has no such limits. The constraint is the style.

---

## Two-Pass Downsample Architecture

The fundamental pipeline for pixel art rendering:

```
3D Scene → Render to Low-Res RT (Point Filter) → Upscale to Screen (Point Clamp Sampler)
```

### Pass 1 — Render to Low-Resolution Render Target
- Render the full scene to a small render target (e.g. 320×180 for a 1920×1080 game at 6× pixel scale).
- Use **point (nearest-neighbor) filtering** exclusively — no bilinear, no trilinear.
- This locks all pixel colors to a discrete grid. Each pixel holds the exact source texel color.

### Pass 2 — Upscale to Screen
- Blit the low-res RT to the full screen using a **point clamp sampler**.
- Each low-res texel maps to a uniform block of screen pixels, preserving hard edges.
- Never use any interpolation at this stage.

### In Unreal Engine
- Implement as a **SceneViewExtension** or custom **FScreenPassVS** + full-screen pixel shader.
- Insert after `PostProcessing` or via `ISceneViewExtension::SubscribeToPostProcessingPass`.
- Use `FRDGBuilder` to create a temporary `FRDGTexture` at target pixel resolution, render the scene into it, then upscale via a custom `AddFullscreenPass`.
- Disable TSR/TAA/FXAA for this camera (`r.AntiAliasingMethod=0`) — they fight pixel-grid stability.
- Disable Lumen screen-space effects if they introduce sub-pixel noise.

---

## Color Quantization to a Limited Palette

### Why RGB Distance Fails
- Euclidean distance in RGB treats the color cube as perceptually uniform. It is not.
- Human vision is ~3× more sensitive to green than blue.
- Equal numeric steps in RGB ≠ equal perceived color change.
- Naive quantization introduces perceptually wrong "nearest" colors, especially in shadows and skin tones.

### CIE Lab Color Space
- **L** = lightness (0–100), **A** = green↔magenta, **B** = blue↔yellow.
- Developed to be perceptually uniform: equal numeric distance ≈ equal perceived difference.
- Pipeline: linearize RGB → convert to CIE XYZ → map to Lab via nonlinear transform mimicking cone response.

### Quantization Shader (HLSL Sketch)
```hlsl
float3 RGBToLab(float3 rgb)
{
    // Linearize sRGB
    rgb = pow(rgb, 2.2);
    // RGB → XYZ (D65)
    float3x3 M = { 0.4124564, 0.3575761, 0.1804375,
                   0.2126729, 0.7151522, 0.0721750,
                   0.0193339, 0.1191920, 0.9503041 };
    float3 xyz = mul(M, rgb) / float3(0.95047, 1.0, 1.08883);
    float3 f = (xyz > 0.008856) ? pow(xyz, 1.0/3.0) : (7.787 * xyz + 16.0/116.0);
    return float3(116*f.y - 16, 500*(f.x - f.y), 200*(f.y - f.z));
}

float3 QuantizeTopalette(float3 color, StructuredBuffer<float3> palette, int paletteSize)
{
    float3 labColor = RGBToLab(color);
    float bestDist = 1e10;
    float3 bestColor = palette[0];
    for (int i = 0; i < paletteSize; i++)
    {
        float3 labEntry = RGBToLab(palette[i]);
        float dist = length(labColor - labEntry);
        if (dist < bestDist) { bestDist = dist; bestColor = palette[i]; }
    }
    return bestColor;
}
```

### UE Integration
- Store palette as a `StructuredBuffer` or `Texture1D` (small, e.g. 16–32 entries).
- Run quantization as a **post-process material** or custom RDG pass after the downsample.
- Swap the palette buffer at runtime for instant mood/time-of-day palette shifts with zero asset changes.

---

## Depth and Normal GBuffer Downsampling

For outlines and effects to remain pixel-grid-aligned, the depth and normal buffers must be downsampled the same way as color:

- Apply the same point-filter downsample pass to `SceneDepth` and `WorldNormal` GBuffer textures.
- Store them in matching low-res render targets.
- All subsequent outline/edge passes operate on these low-res buffers only.

### UE Access
```cpp
// Inside FSceneViewExtension or custom render pass:
FRDGTextureRef SceneDepth = GraphBuilder.RegisterExternalTexture(
    SceneContext.SceneDepthZ, TEXT("SceneDepth"));
FRDGTextureRef GBufferA = GraphBuilder.RegisterExternalTexture(
    SceneContext.GBufferA, TEXT("GBufferA")); // normals in RGB
```

---

## Outline / Edge Detection System

### Three Data Sources
| Source | Detects | Buffer |
|--------|---------|--------|
| Depth discontinuity | Silhouette edges (object vs. background) | Low-res SceneDepth |
| Normal discontinuity | Crease edges (surface folds, corners) | Low-res GBufferA (normals) |
| Mask channel | Per-object opt-in/opt-out | Custom stencil or mask RT |

### Depth-Based Silhouette Detection
```hlsl
float SampleLinearDepth(Texture2D depthTex, SamplerState samp, float2 uv)
{
    float rawDepth = depthTex.Sample(samp, uv).r;
    // Linearize: convert logarithmic GPU depth to eye-space distance
    return (Near * Far) / (Far - rawDepth * (Far - Near));
}

bool IsDepthEdge(float2 uv, float2 texelSize, float threshold)
{
    float center = SampleLinearDepth(DepthTex, PointSampler, uv);
    float right  = SampleLinearDepth(DepthTex, PointSampler, uv + float2(texelSize.x, 0));
    float up     = SampleLinearDepth(DepthTex, PointSampler, uv + float2(0, texelSize.y));
    return (abs(center - right) > threshold) || (abs(center - up) > threshold);
}
```
- **Linearize depth** before comparing — raw GPU depth is logarithmic; a fixed threshold will miss distant edges.
- Threshold in world-space units (e.g. 0.1m) gives distance-independent edge width.

### Normal-Based Crease Detection
```hlsl
bool IsNormalEdge(float2 uv, float2 texelSize, float threshold)
{
    float3 n  = NormalTex.Sample(PointSampler, uv).rgb * 2 - 1;
    float3 nr = NormalTex.Sample(PointSampler, uv + float2(texelSize.x, 0)).rgb * 2 - 1;
    float3 nu = NormalTex.Sample(PointSampler, uv + float2(0, texelSize.y)).rgb * 2 - 1;
    return (1 - dot(n, nr) > threshold) || (1 - dot(n, nu) > threshold);
}
```

### Priority and Compositing
- **Silhouette > Crease**: if a pixel is already a depth edge, skip normal edge test. Prevents double-outline on distant silhouettes.
- Final outline: `outlineColor = lerp(sceneColor, lineColor, IsDepthEdge || (!IsDepthEdge && IsNormalEdge))`.

### Pixel Grid Alignment for Outlines
- Calculate texel size from the **low-res** render target, not screen resolution.
- Search only 4 cardinal neighbors (up/down/left/right). No diagonals — prevents thick corner outlines.
- Result: exactly 1 pixel thin outlines at all times.

### Selective Outlines via Mask
- Render tagged objects into a dedicated mask RT using a custom depth pass with `EarlyDepthStencil`.
- Encode outline type in color channels: R=silhouette, G=crease, B=custom.
- Feed the depth RT as secondary input to discard occluded pixels (`clip(depthTex - maskDepth - epsilon)`).
- High-poly assets (foliage, complex props) opt out via mask to avoid crease-edge clutter.

---

## Water / Ocean Rendering for Pixel Art

A layered shader architecture for stylized water that respects pixel art aesthetics.

### Layer Stack (bottom to top)
1. **Scene color** — unobstructed background
2. **Water color gradient** — depth-based color lerp
3. **Shore foam** — depth-intersection detection
4. **Scrolling detail texture** — UV-animated surface noise
5. **Procedural surface foam** — threshold-based noise foam
6. **Reflections** — blended by view angle

### Depth-Based Color Tinting
```hlsl
float depthFade = saturate((groundDepth - surfaceDepth) / MaxDepth);
float3 waterColor = lerp(ShallowColor, DeepColor, depthFade);
// Also darken submerged objects
objectColor = lerp(objectColor, objectColor * DeepTint, depthFade);
```
- Sample `SceneDepth` at surface UV for `surfaceDepth`, and scene geometry depth for `groundDepth`.
- Simulates light absorption and scattering without volumetrics.

### Wave Displacement (Vertex Shader)
```hlsl
float wave1 = sin(dot(WaveDir1, worldPos.xz) * Frequency + Time * Speed);
float wave2 = sin(dot(WaveDir2, worldPos.xz) * Frequency + Time * Speed);
// WaveDir2 is WaveDir1 rotated 90° around Y
float displacement = wave1 * wave2 * Amplitude;
worldPos.y += displacement;
```
- Two perpendicular sine waves multiplied together produce ebb-and-flow complexity from simple math.
- Runs in vertex shader on a coarse water mesh — very low GPU cost.

### Shoreline Foam
```hlsl
float foamMask = 1 - saturate((groundDepth - surfaceDepth) / FoamDepth);
float foam = FoamTex.Sample(PointSampler, uv + animOffset) * foamMask;
```
- `FoamDepth` ~ 0.2m gives a one-pixel-thick foam band at the shore.

### Procedural Surface Foam
```hlsl
float noise = NoiseTex.Sample(PointSampler, uv * NoiseScale + Time * ScrollSpeed).r;
float surfaceFoam = step(FoamThreshold, noise); // threshold → binary foam
```
- Animates via UV scroll on the noise texture.
- Threshold slider controls foam density.

### Planar Reflections
- Spawn a secondary **SceneCaptureComponent2D** mirrored across the water plane.
- Compute reflection matrix from plane equation `(A, B, C, D)` where `(A,B,C)` = surface normal.
- Use **oblique near-plane projection** to clip geometry below water surface cleanly.
- Sample reflection RT at screen-space UV offset by wave noise for distortion.
- Blend with water color using Fresnel (view-angle-based weight).

```hlsl
float fresnel = pow(1 - saturate(dot(viewDir, surfaceNormal)), FresnelPower);
float3 finalColor = lerp(waterColor, reflectionColor, fresnel);
```

### Refraction
- Sample `SceneColor` RT at UV offset by animated noise: `float2 offset = noise * RefractionStrength * depthFade`.
- Scale distortion by depth — subtle at surface, strong in deep water.
- Apply after depth-based color tinting.

### UE Implementation Notes
- Water mesh: `UProceduralMeshComponent` or static plane with tessellation disabled.
- Reflection capture: `USceneCaptureComponent2D` with `CaptureSource = SCS_SceneColorHDR`, reduced resolution (e.g. ¼ res).
- Disable expensive features on reflection camera: no Lumen, no TSR, no shadows from secondary lights.
- Use `UMaterialParameterCollection` to drive wave params from Blueprint (time, weather state).

---

## Dithering

Classic technique to simulate additional colors within a limited palette.

### Ordered (Bayer Matrix) Dithering
```hlsl
static const float Bayer4x4[16] = {
     0, 8, 2,10,
    12, 4,14, 6,
     3,11, 1, 9,
    15, 7,13, 5
};

float BayerThreshold(uint2 pixelPos)
{
    return Bayer4x4[(pixelPos.x % 4) + (pixelPos.y % 4) * 4] / 16.0;
}

float3 DitherQuantize(float3 color, uint2 pixelPos, StructuredBuffer<float3> palette, int count)
{
    float threshold = BayerThreshold(pixelPos);
    // Perturb in Lab space before quantizing
    float3 lab = RGBToLab(color);
    lab += (threshold - 0.5) * DitherStrength;
    return QuantizeToLab(LabToRGB(lab), palette, count);
}
```
- Apply **after** downsampling to low-res RT, **before** palette quantization.
- Operate in Lab space for perceptually uniform dithering patterns.
- `DitherStrength` controls how much color mixing appears.

---

## Anti-Aliasing Strategy

| Technique | Use |
|-----------|-----|
| TSR / TAA | **Disable** — introduces sub-pixel ghosting that breaks pixel grid |
| FXAA | **Disable** — softens silhouettes |
| MSAA | Can be used on the 3D geometry pass only (before downsample) |
| Manual jitter | **Avoid** — pixel grid must be stable frame-to-frame |

Set via CVar or Project Settings:
```ini
r.AntiAliasingMethod=0
r.TemporalAA.Upsampling=0
r.TSR.Enable=0
```

---

## Camera and Projection Setup

- **Orthographic projection**: optional for strict pixel-perfect top-down or isometric views. Eliminates perspective distortion that can misalign pixels at shallow angles.
- **Pixel-snapped camera**: move camera in increments of one world-unit-per-pixel to prevent sub-pixel camera drift causing pixel shimmer.
- **Fixed FOV with integer pixel scale**: choose FOV so that world units map cleanly to pixel counts at target resolution.

---

## RDG Pass Structure for Pixel Art Pipeline

```cpp
// 1. Downsample color to low-res RT
AddDownsamplePass(GraphBuilder, SceneColorIn, PixelColorRT, EDownsampleFilter::Point);

// 2. Downsample depth + normals to low-res RTs
AddDownsamplePass(GraphBuilder, SceneDepth, PixelDepthRT, EDownsampleFilter::Point);
AddDownsamplePass(GraphBuilder, GBufferNormal, PixelNormalRT, EDownsampleFilter::Point);

// 3. Palette quantization (Lab-space)
AddQuantizationPass(GraphBuilder, PixelColorRT, PaletteBuffer, QuantizedColorRT);

// 4. Outline detection
AddOutlinePass(GraphBuilder, QuantizedColorRT, PixelDepthRT, PixelNormalRT, OutlinedRT);

// 5. Water effects (if water present in scene)
AddWaterPass(GraphBuilder, OutlinedRT, PixelDepthRT, WaterRT);

// 6. Upscale to screen
AddUpsamplePass(GraphBuilder, WaterRT, FinalOutput, EUpsampleFilter::Point);
```

---

## Performance Budget Guidelines

| Pass | Typical Cost |
|------|-------------|
| Low-res render | ~same as full-res (geometry bound, not fill-rate) |
| Point downsample | < 0.1ms |
| Lab quantization (16-color palette) | 0.2–0.5ms |
| Outline detection (4-tap) | 0.3–0.6ms |
| Planar reflection (½ res) | 2–5ms |
| Water shader (layered) | 0.5–1ms |
| Point upsample | < 0.1ms |

- Profile with **RenderDoc** or **Unreal Insights** (`r.RDG.Debug=1`).
- Reflection camera is the most expensive single item — reduce capture resolution aggressively.
- Palette quantization scales linearly with palette size; keep palettes ≤ 32 colors.

---

## Key CVars for Pixel Art Rendering

```ini
# Disable all AA
r.AntiAliasingMethod=0
r.TSR.Enable=0

# Disable screen-space effects that don't respect pixel grid
r.SSR.Quality=0
r.SSAO.Enable=0
r.SSGI.Enable=0

# Disable Lumen for strict pixel art (re-enable carefully if needed)
r.Lumen.Reflections.Allow=0
r.Lumen.DiffuseIndirect.Allow=0

# Disable post-process bloom/lens that blur pixels
r.BloomQuality=0
r.LensFlareQuality=0

# Keep these — they operate on the 3D scene before downsample
r.Shadow.Virtual.Enable=1
r.DynamicGlobalIlluminationMethod=0  # or use baked
```

---

## Common Issues and Fixes

| Issue | Cause | Fix |
|-------|-------|-----|
| Shimmer / pixel crawl | Sub-pixel camera movement | Snap camera position to pixel grid |
| Blurry pixels | Linear sampler in upscale | Force point clamp sampler in upscale pass |
| Wrong palette colors in shadows | RGB quantization | Switch to CIE Lab quantization |
| Outlines too thick | Using screen-res texel size | Use low-res RT texel size for edge search |
| Outline on every crease | No mask filtering | Add per-object mask channel to suppress |
| Water foam too thin/thick | `FoamDepth` miscalibrated | Tune `FoamDepth` per water mesh scale |
| Reflection lag | Capture not synced | Sync reflection camera via pre-render callback |
| Mixels (inconsistent pixel sizes) | Post-process applied at screen res | Apply all effects before final upsample |
