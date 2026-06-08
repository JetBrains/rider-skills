# Procedural Texturing in UE Material Editor

All techniques below use Material Expression nodes only — no custom HLSL, no code, no external textures required.

---

## Noise-Based Patterns

### UE Noise Node

The **Noise** expression node is the foundation of most procedural materials.

**Noise Types (Function dropdown):**
- **Simplex** — smooth, organic, fast. Best general-purpose choice.
- **Perlin** — classic noise, slightly more grid-aligned artifacts than Simplex.
- **Gradient** — smooth interpolation, good for broad height variations.
- **Voronoi** — cell-based (but prefer the dedicated VoronoiNoise node in UE5).
- **Value** — blocky, cheapest to compute.

**Key Parameters:**
- **Scale** — world-space or UV-space frequency. Higher = smaller features.
- **Quality** — 1 (fast, banding visible) to 4 (smooth, expensive). Use 2 for most work.
- **Levels** (octaves) — how many noise layers are summed internally. More levels = more detail but higher cost.
- **Output Min / Output Max** — remap the output range. Default -1 to 1, often remap to 0–1.
- **Tiling** — enable for seamless repeats; set tile size to match your UV scale.

### Layered Noise (Fractal Brownian Motion)

FBM adds multiple noise samples at increasing frequency and decreasing amplitude:

1. **Noise** node at Scale S, multiply result by 1.0 (amplitude A).
2. **Second Noise** node at Scale S*2, multiply by A*0.5.
3. **Third Noise** node at Scale S*4, multiply by A*0.25.
4. **Add** all three results together.

Alternatively, set the Noise node's **Levels** parameter higher (3–6) — it does FBM internally. Manual layering gives more control over each octave.

### Turbulence

Take the **Abs** of a Noise output. This folds negative values upward, creating sharp ridges and wispy, flame-like patterns.

- Noise -> **Abs** -> result
- Stack multiple Abs(Noise) at different scales for richer turbulence.

### Domain Warping

Feed one noise output as a UV offset into another noise:

1. Sample **Noise A** at base UVs.
2. **Multiply** Noise A output by a small warp amount (0.01–0.1).
3. **Add** the warp to the original UVs.
4. Sample **Noise B** at the warped UVs.

This produces organic, swirling distortion. Chain multiple warp stages for increasingly alien patterns.

---

## Standard Procedural Patterns

### Checker

Classic two-tone checkerboard:

1. **TextureCoordinate** -> **Multiply** by Scale (e.g., 8).
2. **Floor** the result.
3. Split into R and G channels with **ComponentMask**.
4. **Add** R + G.
5. **Fmod** (divisor = 2) -> **Floor** gives 0 or 1.
6. **Lerp** between two colors using that mask.

UE also has a built-in **Checker** utility function in the Material Function library.

### Stripes / Lines

Horizontal or vertical lines:

1. **TextureCoordinate** -> **ComponentMask** (select U for vertical stripes, V for horizontal).
2. **Multiply** by line count.
3. **Frac** to get sawtooth 0–1 per cell.
4. Feed into **Step** (threshold 0.5) for hard lines, or **SmoothStep** for soft edges.
5. Adjust threshold to control line thickness.

For diagonal stripes: **Add** U + V before the Multiply.

### Dots / Grid

Round dots on a grid:

1. **TextureCoordinate** -> **Multiply** by grid count.
2. **Frac** to get 0–1 within each cell.
3. **Subtract** 0.5 (center the cell at origin).
4. Feed into **VectorLength** (distance from cell center).
5. **Step** or **SmoothStep** with a radius threshold -> circular dot mask.

For soft-edged dots, use **1 - SmoothStep** so the center is white.

### Bricks

Offset every other row for a brick pattern:

1. **TextureCoordinate** -> **Multiply** by (columns, rows).
2. Split V: **Fmod**(V, 2) -> **Floor** gives 0 or 1 per alternating row.
3. **Multiply** that by 0.5, **Add** to U — offsets every other row by half a brick.
4. **Frac** both U and V to get cell-local coordinates.
5. Use cell-local coords to draw mortar lines: **Step** near 0 and near 1 on both axes, combine with **Max**.

### Voronoi

UE5 provides the **VoronoiNoise** node directly:

- **Scale** — cell density.
- Outputs: **Distance** (smooth cell shading), **Cell ID** (flat color per cell), **Edge Distance** (crack/grout lines).
- Use Edge Distance with **Step** for clean crack patterns.
- Use Cell ID with **Frac** or randomization to color each cell differently.

### Gradients

**Linear:** ComponentMask U or V from TextureCoordinate — gives a 0-to-1 ramp.

**Radial:** Subtract center (0.5, 0.5) from UVs -> **VectorLength** -> gives distance from center. Invert with **OneMinus** for bright center.

**Angular:** Subtract center from UVs, split to components, feed into **Arctangent2** (or use the **ATan2** node). Divide by 2*pi (6.2832) and add 0.5 to remap to 0–1.

**Spherical:** Same as radial but apply **Sine** or custom curve for falloff control.

---

## Natural Material Patterns

### Wood Grain

1. Start with **TextureCoordinate** -> **Multiply** by (1, 10) — stretch along V to elongate grain.
2. Compute distance from a center axis using only the U component -> **Sine** of (distance * ring frequency) for concentric ring pattern.
3. Add **Noise** (low scale, stretched) to distort the rings — break uniformity.
4. Add fine **Noise** (high scale) for surface grain detail.
5. **Lerp** between light and dark wood colors using the combined pattern.

### Marble / Veins

1. Sample **Noise** (Simplex, 2–3 levels) at base UVs.
2. **Multiply** noise by a vein intensity factor (5–20).
3. **Add** to a UV component (e.g., U * frequency).
4. Feed the sum into **Sine** — produces wavy vein lines.
5. Remap Sine output 0–1 with **Multiply** 0.5 + **Add** 0.5.
6. **Power** to sharpen veins (higher exponent = thinner veins).
7. **Lerp** between base marble color and vein color.

### Rock / Stone

1. Large-scale **Noise** (low frequency, 2 levels) for broad height variation.
2. Medium-scale **Noise** (mid frequency) multiplied at lower amplitude, **Add** to first.
3. Fine **Noise** (high frequency, 1 level) for surface grit.
4. Apply **Contrast** adjustment: subtract 0.5, **Multiply** by contrast factor, add 0.5, **Clamp**.
5. Use the combined height for roughness variation and normal generation.

### Water / Caustics

1. **VoronoiNoise** with **Panner** on the input UVs (slow speed, e.g., 0.02).
2. Use the Distance output, apply **Power** (2–3) for bright caustic peaks.
3. Layer a second VoronoiNoise at different scale and panner direction.
4. **Add** or **Multiply** both layers together.
5. Feed into Emissive or use as a light projection mask.

### Fire / Smoke

1. **Noise** (Simplex, 3–4 levels) sampled at UVs offset by **Panner** scrolling upward (negative V direction).
2. **Multiply** by a vertical **Gradient** mask (V coordinate) — fades out at top.
3. Apply **Power** to sharpen flame edges.
4. **Lerp** through a color ramp: dark red at bottom -> orange -> yellow -> white at hottest points. Chain multiple Lerp nodes keyed to thresholds of the noise output.

### Clouds / Fog

1. Multi-octave **Noise** (4+ levels, or manual FBM with 3–4 Noise nodes).
2. Animate with **Time** node added to one UV axis, or use **Panner** for directional drift.
3. Remap and **Clamp** output. Use **SmoothStep** for defined cloud edges vs. hazy fog.
4. Multiply by opacity or feed into a translucent material's Opacity channel.

---

## Animation Techniques

### Panner Node

Scrolls UVs at constant speed. Connect before any pattern node.

- **Speed X / Speed Y** — direction and rate of scrolling.
- Chain two Panners at different speeds on different noise layers for complex motion.
- Feed Panner output into Noise UV input for flowing organic animation.

### Time + Sine (Pulsing)

1. **Time** node -> **Multiply** by frequency.
2. **Sine** -> remaps to -1 to 1 oscillation.
3. **Multiply** by amplitude, **Add** offset for desired range.
4. Use to modulate emissive intensity, scale, color blend, or any parameter.

### Rotator Node

Spins UVs around a center point.

- **Center** — pivot point (default 0.5, 0.5).
- **Speed** — rotation rate. Connect **Time** to the Time input for continuous spin.
- Good for spinning patterns, radar sweeps, energy effects.

### World Position Offset (Parallax)

1. **CameraVector** or **ViewDirection** used with height map to shift UVs.
2. **BumpOffset** node does simple parallax: connect height map and adjust Height Ratio.
3. For deeper parallax, use **ParallaxOcclusionMapping** material function (more expensive, better quality).

### Combined: Flowing Effects

Panner + Noise is the core combination for rivers, lava, energy flows:

1. **Panner** (slow, directional) -> **Noise** = base flow.
2. **Second Panner** (different speed/angle) -> **Second Noise** = detail layer.
3. **Multiply** or **Add** both layers.
4. Optional: use first noise to domain-warp the second for non-uniform flow.

---

## Decomposition Rules for Procedural Materials

When building any procedural material from a reference, follow this order:

### Rule 1: Identify the BASE SHAPE

What is the fundamental repeating pattern? Checker, bricks, voronoi cells, concentric rings, parallel lines, organic blobs? Build this first using the recipes above. Get the tiling and proportions right before adding complexity.

### Rule 2: Add VARIATION

Pure geometric patterns look artificial. Layer noise to break uniformity:
- Warp the UVs of the base pattern with low-frequency noise.
- Multiply the pattern by noise to vary intensity across the surface.
- Add noise-driven randomness to per-cell properties (color, size).

### Rule 3: Apply COLOR MAPPING

Use the pattern as a mask to blend colors:
- **Lerp** between two colors using the pattern as Alpha.
- For multi-color: chain Lerp nodes or use **If** nodes at thresholds.
- Add subtle color variation with low-frequency noise multiplied into the color.

### Rule 4: Add DETAIL

Secondary patterns at higher frequency add realism:
- Fine noise for surface grit or grain.
- Micro-scratches: high-frequency directional noise in roughness.
- Pores/speckles: high-frequency dots pattern at low contrast.

### Rule 5: Add ANIMATION (if needed)

Only for dynamic materials (water, fire, energy, holograms):
- Choose the right technique: Panner for directional flow, Time+Sine for pulsing, Rotator for spin.
- Animate the variation layer, not the base shape (more natural).
- Use different speeds on different layers for parallax-like depth.

### Rule 6: Connect to PBR Channels

A procedural pattern should drive multiple material outputs, not just Base Color:
- **Roughness** — derive from the pattern. Cracks are rougher, polished surfaces smoother. Invert or remap the height/pattern and plug into Roughness.
- **Normal** — generate from the procedural height (see Height-to-Normal below).
- **Metallic** — usually constant, but can vary (e.g., exposed metal under paint uses pattern as mask).
- **Ambient Occlusion** — darken crevices. Invert height, apply Power to concentrate in low areas.
- **Emissive** — for glowing patterns (lava in cracks, energy lines).

---

## Height-to-Normal Conversion

Procedural patterns produce height (scalar) values. Converting to normals gives them 3D surface detail without geometry.

### DDX / DDY Method

Computes the screen-space derivative of the height to approximate a normal:

1. Compute your procedural **height** value (0–1 scalar).
2. **DDX** of height = rate of change in screen X.
3. **DDY** of height = rate of change in screen Y.
4. **Append** DDX and DDY into a 2-component vector.
5. **Multiply** by a strength factor (negative for correct direction, e.g., -5 to -20).
6. **Append** result with 1.0 as the Z (blue) component.
7. **Normalize** the vector.
8. Connect to the **Normal** input of the material.

Limitation: DDX/DDY resolution is screen-dependent — normals get coarser at distance. Works best for close-up or mid-range surfaces.

### NormalFromHeightmap Material Function

UE provides **NormalFromHeightmap** (or **NormalFromFunction**) in the Material Function library:

- Input: height value and UV coordinates.
- Internally samples the height at offset positions to compute proper derivatives.
- **Strength** parameter controls bump intensity.
- More accurate than DDX/DDY, especially at oblique angles, but more expensive (multiple height evaluations).

### Bump Offset (Parallax)

Not a normal technique, but complements normals for added depth:

1. **BumpOffset** node: connect height map to Height, set Height Ratio (0.01–0.05).
2. Connect output to the UV input of your Base Color and other texture reads.
3. Creates the illusion of depth by shifting UVs based on view angle.
4. Combine with generated normals for convincing surface depth.

### Tips

- Always **Normalize** your final normal vector before connecting to the material Normal input.
- For blending procedural normals with a texture-based normal map, use **BlendAngleCorrectNormal** material function — it handles the math correctly, unlike simple linear blending.
- Strength values for normal generation are scene-dependent. Start low (1–5) and increase until the surface reads well at your target viewing distance.
- For tiling procedural materials, make sure the height function itself tiles — otherwise the normals will show seams at tile boundaries.
