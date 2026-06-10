# Non-Photorealistic Rendering (NPR) in Unreal Engine

Stylized and non-photorealistic techniques achievable through UE materials and post-processing. Applies to UE 5.5–5.7; Substrate (production-ready in 5.7) does not change NPR workflows since NPR typically uses Unlit shading model.

---

## Cel Shading / Toon Shading

### Approach 1: Unlit Material with Custom Lighting (Recommended)
- Shading Model: **Unlit** (disables engine PBR)
- Calculate NdotL: `Dot(VertexNormalWS, LightVector)`
- Posterize: `Floor(NdotL * Steps) / Steps` — quantizes to N bands
- Map to colors: `Lerp(ShadowColor, LitColor, PosterizedNdotL)`
- Output: Emissive = final color
- Pros: full control, predictable results
- Cons: no built-in shadows, must handle multiple lights manually

### Approach 2: Post-Process Cel Shading
- Post-process material reads SceneColor
- Separate luminance, quantize it, reconstruct
- Apply color banding to entire scene
- Pros: uniform look across all objects
- Cons: less per-object control

### Approach 3: Custom Shading Model (Advanced, C++)
- Modify engine source: add custom BRDF in ShadingModels.ush
- Register new shading model enum
- Most control but requires engine modification — rarely worth it for stylized games

### Cel Shading Decomposition
```
Shape:    NdotL (dot product of normal and light direction)
Modifier: Posterize (Floor * Steps / Steps)
Combine:  Lerp(ShadowColor, LitColor, PosterizedValue)
Output:   Emissive (Unlit shading model)
```

---

## Outline / Edge Detection

### Method 1: Inverted Hull (Material-Based, Per-Object)
- Mesh needs 2 material slots: inner (normal material) + outer (outline)
- Outline material: Unlit, black (or outline color)
  - Two-Sided ON, then cull front faces via vertex normal check
  - WorldPositionOffset = `VertexNormal * OutlineThickness`
  - Pushes back faces outward, creating visible outline
- Pros: cheap, resolution-independent, per-object thickness control
- Cons: requires extra material slot, doesn't work on flat surfaces

### Method 2: Post-Process Sobel Edge Detection
- Post-process material
- Sample **SceneDepth** at 4-8 neighboring pixels (Sobel kernel)
- Edge = large depth gradient between adjacent samples
- Also sample **WorldNormal** buffer — detect normal discontinuities
- Combine: `Max(DepthEdge, NormalEdge)` for complete outlines
- UV offsets: `1.0 / ViewSize` for single-pixel neighbor distance
- Pros: uniform, no mesh modification, catches all edges
- Cons: screen-space (scale with resolution), can miss thin features

### Method 3: Custom Depth + Stencil
- Enable "Render Custom Depth Pass" on target meshes
- Set Custom Depth Stencil Value per object
- Post-process: where `CustomDepth < SceneDepth` → object is occluded
- Edge: detect CustomDepth discontinuity
- Pros: selective per-object outlines, stencil for color coding
- Cons: requires per-object setup

---

## Stylized Techniques

### Ramp / Gradient Lighting
- 1D texture lookup: NdotL as U coordinate, sample hand-painted gradient
- Gradient encodes artistic light-to-shadow transition
- Can include warm-to-cool shift, colored shadows, multiple bands
- UE: TextureSample with `Saturate(NdotL)` → UV.x, constant 0.5 → UV.y
- Texture: Clamp wrap mode, Bilinear filter
- Decomposition: `Shape: NdotL → Modifier: TextureLookup → Output: Emissive`

### Hatching / Cross-Hatching
- 6 hatching textures at increasing density (Tonal Art Maps)
- Select/blend based on light intensity:
  - Bright: no hatching (white)
  - Medium: sparse lines
  - Dark: dense cross-hatching
- Blend thresholds from NdotL using Smoothstep bands
- Subtle UV jitter over Time for hand-drawn feel

### Pixel Art / Retro
- Post-process pixelation: `Floor(UV * PixelCount) / PixelCount`
- Color palette reduction: `Floor(Color * PaletteSize) / PaletteSize`
- Optional dithering: ordered dither pattern for smooth gradients
- Apply before tonemapping for consistent results

### Fresnel Rim Light (Stylized)
- Exaggerated Fresnel for anime/cartoon character highlighting
- `Power(1 - NdotV, 2-4)` — higher exponent = thinner rim
- Multiply by bright color → Emissive
- Can posterize rim too for stepped edge glow
- Common in: anime, Borderlands-style, Fortnite

### Watercolor / Painterly
- Kuwahara filter: smooths regions while preserving edges (post-process)
- Add paper texture overlay (multiply in screen space)
- Edge darkening (outline) + color bleeding
- Wet edges: darken/saturate at shape boundaries

---

## Effect Decomposition for NPR

| Effect | Shape Block | Modifier | Output Channel | Shading Model |
|--------|------------|----------|----------------|---------------|
| Cel shade | NdotL | Posterize | Emissive | Unlit |
| Outline (hull) | VertexNormal | WPO extrusion | Separate material | Unlit |
| Outline (PP) | Depth + Normal edges | Sobel kernel | Post-process | N/A |
| Ramp lighting | NdotL | Texture lookup | Emissive | Unlit |
| Hatching | NdotL thresholds | Texture blend | Emissive | Unlit |
| Stylized rim | Fresnel | Power + Color | Emissive | Any |
| Pixel art | ScreenUV | Floor quantize | Post-process | N/A |

---

## Critical Rules

1. **Cel shading = Unlit shading model** — Default Lit will fight your custom lighting
2. **Inverted hull outline**: world-space thickness is consistent across distances; screen-space requires dividing by distance
3. **Post-process outlines**: tune depth/normal thresholds per scene scale — what works for a room fails for a landscape
4. **Ramp textures**: MUST use Clamp wrap mode (not Repeat) — values outside 0-1 cause artifacts
5. **Cel shading with shadows**: render shadow mask to separate buffer or use custom depth, multiply into NdotL BEFORE posterizing
6. **NPR + Two-Sided**: thin objects (leaves, paper) often need Two-Sided rendering to look correct
7. **Light direction**: for Unlit materials, pass light direction as a Material Parameter Collection value — no automatic light access in Unlit
8. **Performance**: post-process NPR affects entire screen — use stencil masking to limit to specific objects when possible
