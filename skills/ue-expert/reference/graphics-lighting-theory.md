# Lighting and BRDF Theory for Unreal Engine

Distilled lighting theory focused on understanding UE's rendering pipeline and writing custom shaders.

## Lighting Model Components

### Ambient
- Constant base illumination unaffected by surface orientation
- UE implementation: **Sky Light** (captures scene or HDRI), **Indirect Lighting** (Lumen GI, lightmaps, light probes)
- Sky Light uses cubemap capture or specified HDRI; recapture with `SkyLight->Recapture()` or set to Real Time
- Indirect contribution is modulated by `Indirect Lighting Intensity` on primitives

### Diffuse (Lambert)
- Classic Lambertian: `max(dot(N, L), 0)`
- Energy-conserving form divides by PI: `dot(N, L) / PI`
- UE uses a modified Disney diffuse model (not pure Lambert) that accounts for roughness at grazing angles
- In material editor: BaseColor feeds directly into the diffuse term for dielectrics
- Diffuse is suppressed for metals: `DiffuseColor = BaseColor * (1 - Metallic)`

### Specular (Microfacet)
- Evolution: Phong -> Blinn-Phong -> Cook-Torrance with GGX
- UE default: **GGX/Trowbridge-Reitz** distribution (long-tailed highlights, physically plausible)
- Roughness maps directly to GGX alpha: `alpha = Roughness^2` (perceptual remapping)
- In material editor: Roughness input (0 = mirror, 1 = fully rough)
- Specular input controls F0 for dielectrics: `F0 = 0.08 * Specular` (default 0.5 = 4% reflectance)

### Fresnel
- Schlick approximation: `F = F0 + (1 - F0) * pow(1 - dot(V, H), 5)`
- F0 = reflectance at normal incidence (head-on viewing angle)
- At grazing angles, ALL materials approach 100% reflectance
- UE computes this internally in the BRDF; use `Fresnel` node in material editor for artistic Fresnel effects
- The material editor Fresnel node uses `dot(V, N)` (not `dot(V, H)`), which is an approximation suitable for visual effects but not physically identical to the BRDF Fresnel

### How UE Combines Them (Default Lit)
```
FinalColor = Emissive
           + DiffuseColor * (DirectDiffuse + IndirectDiffuse)
           + SpecularColor * (DirectSpecular + IndirectSpecular)
```
- Direct lighting: per-light evaluation of the full BRDF
- Indirect lighting: Lumen, screen-space reflections, reflection captures, lightmaps
- The shading model function lives in `ShadingModels.ush` (Engine/Shaders/Private)

## BRDF Theory (What UE Uses Under the Hood)

### Microfacet Specular BRDF
```
f_spec(l, v) = D(h) * F(v, h) * G(l, v, h) / (4 * dot(N, L) * dot(N, V))
```

**D — Normal Distribution Function (GGX/Trowbridge-Reitz)**
- Controls the statistical distribution of microfacet orientations
- Determines specular highlight shape and falloff
- `D_GGX(h) = alpha^2 / (PI * (dot(N,H)^2 * (alpha^2 - 1) + 1)^2)`
- Driven by **Roughness** material input
- Long tail compared to Beckmann — more realistic for metals and plastics
- UE source: `D_GGX()` in `BRDF.ush`

**F — Fresnel Term (Schlick)**
- Controls reflectivity based on viewing angle
- `F_Schlick = F0 + (1 - F0) * pow5(1 - dot(V, H))`
- F0 determined by Metallic workflow (see below)
- Driven by **Metallic** and **Specular** material inputs
- UE source: `F_Schlick()` in `BRDF.ush`

**G — Geometry/Visibility Term (Smith-GGX)**
- Accounts for self-shadowing and masking between microfacets
- Smith separable form: `G(l, v) = G1(l) * G1(v)`
- UE uses the Smith height-correlated form (more accurate)
- Higher roughness = more self-shadowing = dimmer specular at grazing angles
- Often combined with the denominator as a "Visibility" term: `Vis = G / (4 * NdotL * NdotV)`
- UE source: `Vis_SmithJointApprox()` in `BRDF.ush`

### Metallic Workflow
```
F0 = lerp(DielectricF0, BaseColor, Metallic)
DielectricF0 = 0.08 * Specular  // default Specular=0.5 -> F0=0.04
DiffuseColor = BaseColor * (1 - Metallic)
```
- Metals: F0 = BaseColor (colored reflections), no diffuse
- Dielectrics: F0 = 0.04 (default, achromatic), full diffuse from BaseColor
- Metallic should be 0 or 1 in practice; blend values only at material transitions (rust edges, dirt on metal)

### Energy Conservation
- `Diffuse + Specular <= 1` at every point
- UE enforces this: as Fresnel increases specular at grazing angles, diffuse is reduced proportionally
- `DiffuseContribution = DiffuseColor * (1 - F)` ensures energy is not created
- Emissive bypasses this (additive on top of lighting)

## UE Shading Models (When to Use What)

| Model | Use Case | Key Properties | Notes |
|-------|----------|---------------|-------|
| **Default Lit** | Most objects | Full PBR, all standard inputs | Use unless you need a specific effect |
| **Subsurface** | Wax, jade, thick skin | Subsurface Color, Opacity (thickness) | Light scatters through; Opacity controls depth |
| **Preintegrated Skin** | Character faces/skin | Curvature-based SSS | Faster than full subsurface, screen-space approximation |
| **Clear Coat** | Car paint, lacquer, coated wood | Clear Coat (0-1), Clear Coat Roughness | Two specular lobes; bottom layer uses standard inputs |
| **Cloth** | Fabric, velvet | Fuzz Color, Cloth | Modifies specular for fabric sheen; Charlie distribution |
| **Two Sided Foliage** | Leaves, thin translucent surfaces | Subsurface Color | Backlit transmission using flipped normal; cheap SSS |
| **Hair** | Strand-based hair (Groom) | Scatter, Backlit, Tangent | Marschner model; needs proper tangent direction along strand |
| **Eye** | Realistic eyes | Iris Mask, Iris Distance | Refraction through cornea, caustic on iris |
| **Unlit** | UI elements, custom lighting, skybox | Emissive Color only | No lighting applied; use for full manual control |
| **Substrate** (production-ready 5.7+) | Universal replacement | Slab-based material model | Replaces all above; enabled by default for new projects in 5.7. See `substrate.md` for details |

**Choosing a shading model in material editor**: Material Properties > Shading Model dropdown. In custom HLSL, the shading model ID is set in `FMaterialAttributes.ShadingModelID`.

## Advanced Lighting Concepts

### Hemisphere Lighting
- Cheap outdoor ambient: `lerp(GroundColor, SkyColor, Normal.z * 0.5 + 0.5)`
- In material editor: use a `HemisphereLerp` custom node with world normal
- Good for stylized games or supplementing indirect lighting on a budget

### Spherical Harmonics (SH)
- Compressed representation of low-frequency lighting (9 coefficients for 2nd order)
- UE uses SH for indirect diffuse in volumetric lightmaps and light probes
- Cannot represent sharp features (high-frequency detail); that's what reflection captures handle
- Lightmass bakes indirect lighting into SH probes placed in a volume grid

### Image-Based Lighting (IBL)
- **Specular IBL**: Pre-filtered environment cubemap, mip level selected by roughness
  - UE: Reflection Captures (sphere/box), Lumen reflections, or Planar Reflections
  - Split-sum approximation: pre-integrated BRDF LUT (`PreIntegratedGF` in engine)
- **Diffuse IBL**: Irradiance map (heavily blurred cubemap) or SH
  - UE: Sky Light irradiance, Lumen diffuse GI
- Key file: `ReflectionEnvironmentShaders.usf`

### Light Functions
- **IES Profiles**: Real-world photometric light distribution data, applied to point/spot lights
  - Import `.ies` files, assign to light's IES Texture property
- **Light Functions**: Material applied to a light, modulating its intensity/color spatially
  - Useful for gobos, animated patterns, projector effects
  - Material domain must be set to "Light Function"

### Bent Normals
- Normal direction biased toward the least occluded direction
- Reduces light leaking from AO: indirect lighting uses bent normal instead of geometric normal
- UE: Generated during lightmap baking or via DFAO (Distance Field Ambient Occlusion)
- In Lumen: bent normals improve indirect lighting accuracy in corners and crevices
- `r.Lumen.ScreenProbeGather.UseBentNormal 1` (enabled by default)

## Non-Photorealistic Rendering (NPR) in UE

### Cel Shading / Toon Shading
- Posterize the diffuse lighting response into discrete steps:
  ```hlsl
  float Steps = 3.0;
  float CelDiffuse = floor(NdotL * Steps) / Steps;
  ```
- Implementation approaches:
  1. **Unlit model + custom lighting**: Full control, compute lighting manually in material
  2. **Post-process**: Apply quantization in a post-process material on SceneColor
  3. **Custom shading model**: Modify `ShadingModels.ush` (engine modification)
- Use a **1D ramp texture** for artistic control: `Texture2DSample(RampTex, UV(NdotL, 0))`

### Outline / Edge Detection
1. **Inverted Hull Method**
   - Duplicate mesh, flip normals (or use Two Sided + custom node), push vertices along normal in vertex shader
   - Material: `WorldPositionOffset = VertexNormalWS * OutlineWidth`
   - Set to render back faces only (Two Sided, then mask front faces)
   - Pros: per-object control, works in VR. Cons: extra draw calls, no inner edges

2. **Post-Process Edge Detection**
   - Run Sobel/Roberts filter on **SceneDepth** and **WorldNormal** buffers
   - In post-process material: sample `SceneTexture:SceneDepth` at neighboring pixels, detect discontinuities
   - Pros: uniform line weight, catches all edges. Cons: screen-space artifacts at distance

3. **Custom Depth + Stencil**
   - Enable Custom Depth on select actors
   - In post-process: compare `SceneDepth` vs `CustomDepth` to find silhouette edges
   - Use Custom Stencil Value to control which objects get outlines
   - Good for selective outlining (interaction highlights, selected objects)

### Hatching / Crosshatch
- Sample from a **TAM (Tonal Art Map)**: array of hatching textures ordered by density
- Select texture based on light intensity: darker areas use denser hatching
- Blend between adjacent hatching textures for smooth transitions
- Use `NdotL` or a custom lighting channel to drive selection

### Stylized Shading with Ramp Textures
- Replace the standard lighting falloff with an artist-painted 1D gradient
- Map `dot(N, L)` (range -1 to 1, remapped to 0-1) to U coordinate of a ramp texture
- Allows any arbitrary light-to-color mapping (warm shadows, color banding, etc.)
- In material editor: `TextureSample` with UV = `(NdotL * 0.5 + 0.5, 0)`
- Set texture to **Clamp** addressing and disable mipmaps for sharp transitions

## Practical Rules

### Material Authoring
- **Roughness** controls both specular highlight size AND indirect reflection blur (same parameter, two effects)
- **Metallic** is binary in the real world (0 or 1); only use intermediate values at transitions (e.g., rust edge on metal, dirt accumulation)
- **Specular** input (0-1) remaps F0 for dielectrics: `F0 = 0.08 * Specular`; default 0.5 = 4% reflectance (correct for most materials)
- **BaseColor** for metals = reflection tint color; for dielectrics = diffuse albedo color
- **NEVER** set BaseColor to pure black (0,0,0) or pure white (1,1,1) — breaks energy conservation; use 0.02-0.04 minimum and 0.8 maximum
- **Emissive** is additive on top of all lighting, not a replacement for light sources; use Emissive + actual lights for bloom and illumination of nearby surfaces

### Performance Awareness
- Shading cost scales with visible pixels (fill rate), not vertex count
- Complex materials with many texture samples are expensive at high resolution
- `Fully Rough` flag on materials skips specular entirely — significant savings for distant/background objects
- `r.ForceDebugViewModes 1` + Buffer Visualization > Lighting Only to isolate lighting cost
- GGX specular is more expensive than Blinn-Phong but UE's implementation is heavily optimized; don't substitute unless profiling shows a need

### Key Engine Source Files
| File | Contains |
|------|----------|
| `BRDF.ush` | D_GGX, F_Schlick, Vis_SmithJointApprox, diffuse models |
| `ShadingModels.ush` | Per-shading-model evaluation functions |
| `DeferredLightingCommon.ush` | Direct light accumulation loop |
| `ReflectionEnvironmentShaders.usf` | IBL, reflection capture blending |
| `BasePassPixelShader.usf` | GBuffer encoding, material evaluation |
| `LightFunctionCommon.ush` | Light function material evaluation |
