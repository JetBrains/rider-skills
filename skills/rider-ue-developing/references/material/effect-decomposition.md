# Effect Decomposition System

Every visual effect can be decomposed into combinations of atomic building blocks. ALWAYS decompose before building.

---

## Standard Building Blocks

### Shape Blocks (What pattern?)

| Block | Description | UE Nodes | Example Use |
|-------|-------------|----------|-------------|
| Fresnel | Edge detection by view angle | Fresnel | Rim glow, shield edge, glass |
| Gradient-Linear | Ramp along one axis | TexCoord.U or .V | Fade top-to-bottom, progress bar |
| Gradient-Radial | Distance from center | Distance(UV, 0.5) | Spotlight, spherical falloff |
| Gradient-Spherical | Distance from object center (world) | WorldPosition - ObjectPosition | Force fields, proximity |
| Noise | Organic randomness | Noise node | Clouds, fire, corrosion |
| Voronoi | Cell-based pattern | VoronoiNoise | Cracks, cells, crystals |
| UV-Tiling | Repeating pattern | Frac(UV * Scale) | Grids, tiles, scanlines |
| Checker | Alternating cells | Fmod(Floor(UV*S), 2) | Debug, simple patterns |
| Mask-Texture | Arbitrary shape from texture | TextureSample | Decals, logos, complex shapes |
| Depth-Fade | Distance to scene behind | DepthFade / PixelDepth | Soft particles, water edge |
| WorldPos-Mask | Height/position mask | WorldPosition.Z | Snow, water level, biome blend |
| NdotL | Diffuse lighting factor | Dot(Normal, LightDir) | Cel shading, ramp lighting |

### Modifier Blocks (How to transform?)

| Block | Description | UE Nodes | Example Use |
|-------|-------------|----------|-------------|
| Panner | Scroll UVs | Panner | Flowing water, scrolling energy |
| Rotator | Spin UVs | CustomRotator | Radar sweep, loading spinner |
| Sine-Pulse | Oscillate 0-1-0 | Sine(Time * Speed) * 0.5 + 0.5 | Breathing glow, heartbeat |
| Step-Threshold | Hard cutoff | If node | On/off masks, dissolve edge |
| Smoothstep | Soft threshold | SmoothStep | Soft transitions |
| Contrast | Sharpen/soften mask | Power(x, exp) | Tighten Fresnel, sharpen noise |
| Invert | Flip mask | OneMinus | Reverse any mask |
| Remap | Change value range | Lerp(outMin, outMax, InverseLerp) | Adjust any range |
| Posterize | Quantize to N steps | Floor(x * N) / N | Cel shading bands |
| Distortion | Warp UVs with noise | Add(UV, Noise * Amount) | Heat haze, organic feel |
| Erosion | Thin/thicken mask edge | Add(Mask, -Threshold) then Clamp | Dissolve control, edge thinning |

### Combiner Blocks (How to merge?)

| Block | Description | UE Nodes | When to Use |
|-------|-------------|----------|-------------|
| Multiply | AND — both must be bright | Multiply | Mask intersection, pattern × shape |
| Add | OR — sum together | Add | Layer independent effects |
| Lerp | Blend A to B by mask | LinearInterpolate | Texture blending, color mapping |
| Max | Take brighter | Max | Combine alternative masks |
| Min | Take darker | Min | Constrain masks |
| Screen | Soft additive: 1-(1-a)*(1-b) | OneMinus, Multiply, OneMinus | Soft light overlay |

### Output Mapping (Where does it go?)

| Channel | Controls | Typical Range |
|---------|----------|---------------|
| Base Color | Surface albedo | sRGB color, avoid pure black/white |
| Metallic | Metal vs dielectric | 0 or 1 (binary), blend only at transitions |
| Roughness | Shiny vs matte | 0.0 (mirror) to 1.0 (chalk) |
| Emissive | Self-illumination | Color × Mask × Intensity (2-5x max) |
| Opacity | Transparency | 0-1 (requires Translucent blend mode) |
| Opacity Mask | Hard cutoff | 0 or 1 (requires Masked blend mode) |
| Normal | Surface micro-detail | Normal map texture or generated |
| World Position Offset | Vertex displacement | Direction × Mask × Amount |

---

## Decomposition Algorithm

### Step 1: Identify PRIMARY SHAPE
Ask: "What is the core visual pattern?"

| User Says | Shape Block |
|-----------|-------------|
| "glowing edges" | Fresnel |
| "flowing pattern" | Noise + Panner |
| "dissolve" | Noise (as threshold mask) |
| "hex grid" / "pattern" | Mask-Texture |
| "cracks" / "cells" | Voronoi |
| "pulse" / "breathing" | Sine-Pulse |
| "scan line" / "band" | Gradient-Linear + Frac |
| "from bottom/top" | WorldPos-Mask or Gradient-Linear |
| "proximity" / "distance" | Gradient-Spherical |
| "soft edge at ground" | Depth-Fade |
| "toon" / "cel" | NdotL + Posterize |

### Step 2: Identify MODIFIERS
Ask: "How is the pattern changed over time or space?"

| User Says | Modifier |
|-----------|----------|
| "animated" / "moving" | Panner or Sine-Pulse |
| "soft" / "smooth" | Smoothstep |
| "sharp" / "crisp" | Power(high) or Step |
| "organic" / "irregular" | Multiply with Noise |
| "distorted" / "warped" | UV Distortion |
| "flickering" | Noise(Time) or random |
| "spinning" | Rotator |
| "growing" / "shrinking" | ScalarParameter as threshold |

### Step 3: Identify OUTPUT CHANNELS
Ask: "What visual property changes?"

| User Says | Output Channel |
|-----------|---------------|
| "glowing" / "bright" / "neon" | Emissive |
| "transparent" / "see-through" | Opacity (Translucent mode) |
| "disappearing" / "dissolve" | Opacity Mask (Masked mode) |
| "shiny spots" / "wet" | Roughness (low = shiny) |
| "color change" / "painted" | Base Color via Lerp |
| "moving surface" / "wave" | World Position Offset |
| "bumpy" / "textured surface" | Normal |

### Step 4: COMBINE
- Shape × Modifier = Final Mask
- Final Mask drives output via Lerp or Multiply
- Multiple shapes: decide AND (Multiply) vs OR (Add/Max)

---

## Decomposition Examples

### Energy Shield
```
Shape:    Fresnel (edge glow) + Noise (surface pattern)
Modifier: Panner on Noise (flowing) + Sine-Pulse (breathing intensity)
Combine:  Fresnel × Noise (NOT add — addition washes out edges)
Output:   Emissive = Color × Combined × Intensity
          Opacity = Combined × BaseOpacity
Settings: Translucent, Two-Sided
```

### Dissolve Effect
```
Shape:    Noise (dissolution threshold pattern)
Modifier: ScalarParameter "DissolveAmount" controls threshold
Combine:  If(Noise > DissolveAmount, 1, 0) = mask
          Edge band: Smoothstep narrow range around threshold
Output:   OpacityMask = StepResult (Masked blend mode)
          Emissive = EdgeBand × BurnColor × Intensity
```

### Hologram
```
Shape:    Fresnel (edge glow) + Frac(UV.y × LineCount) (scanlines)
Modifier: Panner on scanlines (scroll up) + Noise(Time) (flicker)
Combine:  Add Fresnel + Scanlines (both contribute independently)
Output:   Emissive = HoloColor × Combined
          Opacity = Combined × 0.3-0.5
Settings: Translucent (Additive blend), Two-Sided
```

### Lava / Magma
```
Shape:    Noise (low freq, base pattern) + Noise (high freq, detail)
Modifier: Panner (slow directional flow) + Power (contrast for hot/cold)
Combine:  Lerp(RockColor, LavaColor, RemappedNoise)
Output:   BaseColor = LerpResult
          Emissive = HotMask × LavaColor × 3.0
          Roughness = Lerp(0.8, 0.1, HotMask)
```

### Cel-Shaded Material
```
Shape:    NdotL = Dot(VertexNormalWS, LightDirection)
Modifier: Posterize = Floor(NdotL × Steps) / Steps
Combine:  Lerp between shadow/lit colors by posterized value
Output:   Emissive = BaseColor × PosterizedLight
Settings: Unlit shading model (disable engine lighting)
```

### Water Surface
```
Shape:    Noise×2 (different scale for wave normals) + DepthFade (shore)
Modifier: Panner×2 (crossing directions) + Sine(Time) for vertex wave
Combine:  Blend two normals, multiply opacity by shore mask
Output:   Normal = BlendedWaveNormals
          Roughness = 0.0-0.1
          BaseColor = WaterColor with depth tint
          Opacity = DepthFade shore blend
Settings: Translucent, possibly WPO for vertex waves
```

### Force Field Impact
```
Shape:    Gradient-Spherical from impact point + Noise (distortion)
Modifier: ScalarParameter "Ripple" animated 0→1 over time
Combine:  Ring mask = Smoothstep around ripple radius × Noise
Output:   Emissive = FieldColor × RingMask × Intensity
          Opacity = RingMask
          WPO = Normal × RingMask × PushAmount (surface deformation)
Settings: Translucent, Two-Sided
```

---

## Critical Rules

1. **ALWAYS decompose BEFORE building** — plan the full graph, then implement block by block
2. **Fresnel × Pattern, NEVER Fresnel + Pattern** — addition washes out edge detection
3. **Start with simplest block** that achieves 80% of the look, then refine incrementally
4. **Each block must be independently testable** — connect to Emissive alone to preview
5. **Name parameters descriptively** — EdgeGlowIntensity, not Param1
6. **Performance budget**: noise ≤ 3 octaves, avoid Voronoi in real-time if possible
7. **Power node controls curves** — use instead of complex math for falloff adjustment
8. **Verify at each step** — don't wire 10 nodes then check; verify after every 2-3 nodes
