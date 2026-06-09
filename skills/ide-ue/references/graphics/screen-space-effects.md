# Screen-Space Effects in Unreal Engine

Depth buffer tricks, stencil techniques, and creative post-process effects.

---

## Depth Buffer Techniques

### Depth Access in UE
| Node | Returns | Available In |
|------|---------|-------------|
| SceneDepth | Distance camera → opaque geometry behind pixel | Translucent, Post-process |
| CustomDepth | Per-object selective depth buffer | Post-process |
| PixelDepth | Distance camera → current pixel being shaded | Any material |
| DepthFade | `SceneDepth - PixelDepth` with fade distance | Translucent |

### Soft Particles / Intersection Effects
- **DepthFade** node: returns 0 at intersection, 1 at full fade distance
- Multiply into Opacity for soft particle edges
- **Intersection highlight**: `OneMinus(Saturate(DepthFade / ThinWidth))` → bright line at contact
- Use for: soft particles, water shoreline foam, force field contact glow

### Silhouette / X-Ray Through Walls
1. Enable "Render Custom Depth Pass" on target mesh
2. Set Custom Depth Stencil Value (e.g., 1 for friendly, 2 for enemy)
3. Post-process material: where `CustomDepth < SceneDepth` → object is behind wall
4. Show overlay color/silhouette where occluded
- Use for: team outlines, interactable highlighting, wall hacks (gameplay feature)

### Depth-Based Effects
- **Manual fog**: `Lerp(SceneColor, FogColor, Saturate(SceneDepth / MaxDist))`
- **Focus highlight**: desaturate everything outside depth range
- **Depth of field mask**: custom DOF using depth comparison

### Outline from Depth (Sobel)
1. Sample SceneDepth at 4+ neighboring UV offsets
2. Compute gradient: `abs(center - left) + abs(center - right) + abs(center - up) + abs(center - down)`
3. Threshold for edge detection
4. Combine with normal-buffer edges for complete outlines
5. UV offset size: `1.0 / ViewportSize` per pixel

---

## Stencil Buffer Techniques

### Setup
1. Project Settings → Rendering → **Custom Depth-Stencil Pass = "Enabled with Stencil"**
2. Per-mesh: `Render Custom Depth = true`, `Custom Depth Stencil Value = N`
3. Post-process material: read `CustomStencil` SceneTexture

### Per-Object Effects via Stencil
- Assign stencil values: team=1, interactable=2, selected=3
- Post-process branches on stencil value for different effects per group
- Use for: colored outlines, highlight interactables, selection glow

### Stencil Masking
- Apply effects ONLY where stencil matches specific value
- Decal masking: limit decals to tagged surfaces
- Selective post-processing: bloom only on certain objects

---

## Post-Process Effect Recipes

### World-Space Scan Effect
```
Input:  ScanOrigin (Vector param), ScanRadius (Scalar param, animated)
Steps:
  1. Reconstruct world position from SceneDepth + ScreenPosition
  2. Distance = Length(WorldPos - ScanOrigin)
  3. Ring mask = Smoothstep(Radius - Width, Radius, Dist) - Smoothstep(Radius, Radius + Width, Dist)
  4. Output = SceneColor + RingColor * RingMask * Intensity
```

### Grayscale / Desaturation
- `Luminance = Dot(SceneColor.rgb, float3(0.299, 0.587, 0.114))`
- Selective: use depth or stencil mask to desaturate only parts
- Use for: focus effect, flashback, death screen, damage feedback

### Blur Effects
- **Gaussian blur**: sample SceneColor at N UV offsets, weighted by Gaussian kernel
- **Separable**: horizontal pass + vertical pass (much cheaper than 2D kernel)
- **Radial blur**: offset UVs toward/away from center point, accumulate samples
- **UE built-in DOF**: post-process volume settings, use for most blur needs

### Chromatic Aberration
- Sample R, G, B at slightly different UV offsets from center
- Offset increases toward screen edges (multiply by distance from center)
- Small amounts = cinematic; large = damage/drunk effect
- Built-in in UE PP settings, but custom allows animated artistic control

### Vignette
- Mask: `Smoothstep(OuterRadius, InnerRadius, Length(UV - 0.5))`
- `SceneColor * VignetteMask`
- Custom vignette allows: animated radius, colored edges, non-circular shapes

### Screen-Space Refraction / Distortion
- Offset SceneColor UVs by noise or normal map
- `DistortedUV = ScreenUV + NoiseTexture.rg * Intensity`
- Sample SceneColor at DistortedUV
- Use for: water surface, glass, heat shimmer, force fields
- Also: Refraction pin on Translucent materials (IOR-based, automatic)

---

## Performance Guide

| Technique | GPU Cost | Notes |
|-----------|----------|-------|
| SceneDepth read | Very Low | Single texture fetch |
| CustomDepth pass | Medium | Extra depth render per tagged object |
| Stencil test | Very Low | Hardware stencil, near-free |
| Sobel edge (4 samples) | Low-Medium | 4 depth fetches |
| Sobel edge (8 samples) | Medium | 8 fetches, better quality |
| Gaussian blur (9-tap) | Medium | Separable = 2 × 9 instead of 81 |
| Gaussian blur (25-tap) | High | Consider half-resolution |
| Full-screen post-process | Varies | Runs per pixel at full res |
| World position reconstruct | Low | Standard depth + inverse projection |

---

## CVars

| CVar | Description |
|------|-------------|
| r.CustomDepth | Custom depth mode (0=off, 1=depth only, 3=depth+stencil) |
| r.CustomDepthTemporalAAJitter | Apply TAA jitter to custom depth |
| r.PostProcessing.PropagateAlpha | Enable scene alpha propagation |
| r.SceneColorFormat | Scene color buffer format (0=PQ, 1=FP16, 2=FP32) |
| r.PostProcessAAQuality | Post-process AA quality level |

---

## Best Practices

1. **CustomDepth is free to READ** but costs a depth pass per tagged object — don't enable on hundreds of meshes
2. **Post-process materials**: minimize instruction count, every instruction runs per-pixel at full resolution
3. **Half-resolution** for expensive effects (blur, AO) — render at half res, upscale
4. **Stencil is near-free** to test — prefer over complex shader branching for per-object effects
5. **Reconstruct world position from depth** rather than passing via vertex interpolators
6. **Screen edges**: screen-space effects break at edges — fade out or clamp UVs
7. **Blendable Location**: "Before Tonemapping" for HDR effects, "After Tonemapping" for UI/LUT effects
8. **Post-process priority**: higher priority volume wins in overlap — use for area-specific effects
