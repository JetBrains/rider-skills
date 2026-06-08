# Substrate — Experimental Layered Material Model

## Overview

Substrate is UE5's next-generation material model that replaces the fixed set of legacy shading models (Default Lit, Clear Coat, Subsurface, etc.) with a modular, physically-based framework.

## Timeline

| UE Version | Status | Notes |
|------------|--------|-------|
| 5.1 | Experimental | Introduced as "Strata" |
| 5.2 | Experimental | Renamed to "Substrate" |
| 5.3–5.4 | Experimental | Expanding feature set |
| 5.5 | Beta | All legacy material features supported; all platforms supported; ready for linear material production |
| 5.6 | Beta | Continued optimization for real-time |
| 5.7 | **Production-Ready** | Enabled by default for new projects. 280+ free automotive Substrate materials available on Fab |

## Core Concepts

### Slab
The fundamental unit — a principled BSDF (Bidirectional Scattering Distribution Function) that composes a surface interface with a medium. Parameterized by physical quantities:

| Parameter | Description |
|-----------|-------------|
| `DiffuseAlbedo` | Base surface color |
| `F0` | Fresnel reflectance at normal incidence |
| `F90` | Fresnel reflectance at grazing angle |
| `Roughness` | Surface roughness |
| `Anisotropy` | Anisotropic reflection stretching |
| `SSSMFP` | Subsurface scattering mean free path |
| `SSSMFPScale` | SSS scale factor |
| `Emissive` | Self-illumination |
| `SecondRoughness` | Second specular lobe roughness |
| `SecondRoughnessWeight` | Blend weight for second lobe |
| `FuzzRoughness` | Fuzz/sheen roughness |
| `FuzzAmount` | Fuzz/sheen intensity |
| `FuzzColor` | Fuzz/sheen tint |
| `Thickness` | Thin-surface thickness |
| `Glint` | Glint/sparkle effect (UE 5.5+) |

### Operators

| Operator | Function | Example |
|----------|----------|---------|
| **Horizontal Blend** | Mix two slabs by ratio | Rust patches on clean metal |
| **Vertical Layering** | Coat one slab over another | Clear coat over car paint |
| **Weight** | Control contribution of a slab | Fade an effect in/out |

Materials plug into the root node's **Front Material** input.

### Material Graph Structure
```
Slab A (car paint) ──┐
                     ├── Vertical Layer ──→ Front Material
Slab B (clear coat) ──┘
```

```
Slab A (clean metal) ──┐
                       ├── Horizontal Blend (mask) ──→ Front Material
Slab B (rust)         ──┘
```

## Enabling Substrate

1. **Project Settings** → Rendering → Substrate Materials (Experimental) → **Enable**
2. Select **GBuffer Format** (affects memory layout and feature support)
3. Restart editor
4. Legacy materials auto-convert but should be manually verified

### GBuffer Formats / Rendering Paths (5.7+)

Substrate ships two parallel rendering paths in 5.7:

| Path | Description | When to use |
|------|-------------|-------------|
| **Adaptive GBuffer** | Per-pixel topology, full layered closures | Modern hardware (PC/console) |
| **Blendable GBuffer** | Simplified fallback, broad compatibility | Mobile / older hardware |

Both paths are available in Project Settings → Rendering → Substrate. The Adaptive GBuffer path is selected by default for new projects.

Legacy format names (pre-5.7, still shown in some editor tooltips):

| Format | Features | Memory |
|--------|----------|--------|
| Standard | Most features, moderate memory | Default |
| Simple | Fewer closure types, less memory | Mobile/low-end |
| Extended | All features including multi-slab | Higher memory |

## Runtime Data Structures (Source Reference)

**`FSubstrateSceneData`** (per-scene, in `FSceneTextures`):
```cpp
FRDGTextureRef MaterialTextureArray;      // Main material data (texture array)
FRDGTextureRef TopLayerTexture;           // Top layer / surface interface
FRDGTextureRef OpaqueRoughRefractionTexture;
FRDGTextureRef ClosureOffsetTexture;      // Closure indexing (Adaptive only)
FRDGTextureRef SeparatedSubSurfaceSceneColor;
uint32 EffectiveMaxBytesPerPixel;
uint32 EffectiveMaxClosurePerPixel;
bool bUsesAnisotropy;
bool bWriteStencil;
bool bRoughDiffuse;
bool bRoughnessTracking;
bool bStochasticLighting;
```

**`FSubstrateViewData`** (per-view):
```cpp
FIntPoint TileCount;
uint32 TileEncoding;                      // SUBSTRATE_TILE_SIZE = 8
FRDGBufferRef ClassificationTileListBuffer;
FRDGBufferRef ClassificationTileDrawIndirectBuffer;
FRDGBufferRef ClassificationTileDispatchIndirectBuffer;
FRDGBufferRef ClosureTileBuffer;
FRDGBufferRef ClosureTileCountBuffer;
```

**Tile Types (`ESubstrateTileType`):**
- `ESimple` — single closure, fast path
- `ESingle` — single layer
- `EComplex` — multiple closures / complex
- `EComplexSpecial` — adaptive path only (multi-slab)

**Stencil bits** (used for tile routing in lighting passes):
```cpp
StencilBit_Fast           = 0x10  // STENCIL_SUBSTRATE_FASTPATH
StencilBit_Single         = 0x20  // STENCIL_SUBSTRATE_SINGLEPATH
StencilBit_Complex        = 0x40  // STENCIL_SUBSTRATE_COMPLEX
StencilBit_ComplexSpecial = 0x80  // STENCIL_SUBSTRATE_COMPLEX_SPECIAL
```

## Substrate CVars

| CVar | Description | Default |
|------|-------------|---------|
| `r.Substrate.AsyncClassification` | Run tile classification async (with shadow pass) | 1 |
| `r.Substrate.AllocationMode` | 0=per-view (reallocate each frame), 1=can only grow (fewer hitches), 2=platform settings | 1 |
| `r.Substrate.UseClosureCountFromMaterial` | Scale layers from material data vs fixed `r.Substrate.ClosuresPerPixel` | 1 |
| `r.Substrate.StencilPassStage` | 0=indirect compose, 1=before lighting (standalone), 2=first need | 1 |
| `r.Substrate.StochasticLighting.Active` | Stochastic lighting (compile-time flag required) | 0 |
| `r.Substrate.Debug.RoughnessTracking` | Top layer roughness affects lower layers | 1 |
| `r.Substrate.Debug.PeelLayersAboveDepth` | Debug: peel off top layers progressively | 0 |

## Programming with Substrate

### GBuffer Access
```cpp
// Reading Substrate data in a shader
FSubstratePixelHeader Header = UnpackSubstrateHeaderIn(PixelMaterialInputs);
FSubstrateData SubstrateData = PixelMaterialInputs.GetFrontSubstrateData();

// Iterate closures/BSDFs
for (uint i = 0; i < Header.ClosureCount; ++i)
{
    FSubstrateBSDF BSDF = UnpackSubstrateBSDF(SubstrateData, Header, i);
    // Access BSDF parameters...
}
```

### Custom Shader Integration
- `FSubstrateData` initialized with normal data
- Accessed via `PixelMaterialInputs.GetFrontSubstrateData()`
- `FSubstratePixelHeader` manages the closure/BSDF tree per pixel
- See official docs: [Programming with Substrate GBuffer Formats](https://dev.epicgames.com/documentation/en-us/unreal-engine/programming-with-substrate-gbuffer-formats)

## Migration from Legacy Shading Models

| Legacy Model | Substrate Equivalent |
|-------------|---------------------|
| Default Lit | Single Slab (DiffuseAlbedo + F0 + Roughness) |
| Clear Coat | Vertical Layer: base Slab + clear coat Slab |
| Subsurface | Single Slab with SSSMFP parameters |
| Subsurface Profile | Single Slab with SSSMFP + profile reference |
| Two Sided Foliage | Single Slab with transmission settings |
| Hair | Dedicated hair BSDF (fiber model) |
| Cloth | Single Slab with FuzzAmount/FuzzColor/FuzzRoughness |
| Eye | Dedicated eye model (iris, sclera, cornea layers) |
| Thin Translucent | Single Slab with Thickness parameter |

### Auto-Conversion
- Legacy materials are auto-converted when Substrate is enabled
- Conversion is approximate — complex materials may need manual adjustment
- Check shader compilation warnings after enabling

## Performance

### Cost Model
- **Single Slab** (equivalent to legacy Default Lit): ~same cost as legacy
- **Multi-Slab** (layered): cost increases with closure tree complexity
- Each additional Slab/operator adds GBuffer bandwidth and shading cost
- Material Editor shows Substrate-specific cost info in the info tab

### Optimization
1. Use the fewest Slabs possible — most materials need only 1-2
2. Horizontal Blend is cheaper than Vertical Layer (no refraction computation)
3. Disable unused Slab parameters (reduces permutations)
4. Profile with `stat GPU` — look for increased GBuffer bandwidth

## Known Issues & Workarounds

| Issue | Details | Workaround |
|-------|---------|------------|
| **Auto-conversion artifacts** | Some legacy materials look different after conversion | Manually adjust Slab parameters |
| **GBuffer format mismatch** | Switching formats requires full shader recompile | Plan format choice early |
| **Multi-Slab overdraw** | Complex layered materials are expensive | Limit to 2 Slabs for gameplay meshes |
| **Plugin compatibility** | Some rendering plugins don't support Substrate GBuffer | Check plugin documentation |
| **Editor performance** | Material Editor preview slower with complex Substrate graphs | Use simpler preview meshes |

## Best Practices

1. **Use Substrate for new projects on UE 5.7+** — it's production-ready and enabled by default
2. **For UE 5.5–5.6** — Substrate is Beta; suitable for linear/offline production, evaluate for real-time
3. **For UE 5.4 and earlier** — use legacy shading models; Substrate is not stable enough
4. **Plan GBuffer format early** — changing it later requires full shader recompile
5. **Keep it simple** — most materials need only 1-2 Slabs
6. **Verify auto-converted materials** — spot-check important materials after enabling Substrate
7. **Monitor GBuffer bandwidth** — `stat RHI` shows texture bandwidth; Substrate can increase it
8. **Leverage layering for complex surfaces** — car paint, oiled leather, blood/sweat on skin are ideal Substrate use cases

## Python API — Substrate Expression Classes

Two naming conventions exist. `MaterialExpressionStrata*` (UE 5.1–5.4, deprecated) and `MaterialExpressionSubstrate*` (UE 5.5+, current). Both are available via `unreal.*` but prefer `Substrate*` for new code.

### BSDF Nodes (create surface layers)

| Python Class | Purpose | Key Inputs |
|---|---|---|
| `SubstrateSlabBSDF` | Core principled BSDF — the "slab" | DiffuseAlbedo, F0, F90, Roughness, Normal, Anisotropy, SSSMFP, Emissive, SecondRoughness, Glint |
| `SubstrateSimpleClearCoatBSDF` | Simplified clear coat | ClearCoatColor, ClearCoatRoughness |
| `SubstrateUnlitBSDF` | Unlit emissive surface | EmissiveColor |
| `SubstrateHairBSDF` | Hair/fiber shading | BaseColor, Scatter, Specular, Roughness |
| `SubstrateEyeBSDF` | Eye shading model | DiffuseAlbedo, Roughness, IrisMask, IrisDistance |
| `SubstrateSingleLayerWaterBSDF` | Water surface | BaseColor, Metallic, Specular, Roughness |
| `SubstrateVolumetricFogCloudBSDF` | Fog/cloud volume | Albedo, Extinction |
| `SubstrateLightFunction` | Light function output | Color |
| `SubstratePostProcess` | Post-process material output | Color, Opacity |

### Composition Operators (combine layers)

| Python Class | Purpose | Inputs |
|---|---|---|
| `SubstrateVerticalLayering` | Coat one slab over another (top + base) | Top, Base |
| `SubstrateHorizontalMixing` | Blend two slabs by mask (foreground + background + mix) | Foreground, Background, Mix |
| `SubstrateWeight` | Scale a slab's contribution | A, Weight |
| `SubstrateAdd` | Additive blend of two slabs | A, B |
| `SubstrateSelect` | Conditional selection between slabs (UE 5.7+) | A, B, Selector |
| `SubstrateConvertToDecal` | Convert slab output for decal use | DecalMaterial |
| `SubstrateConvertMaterialAttributes` | Convert legacy MaterialAttributes to Substrate | — |

### Utility Nodes

| Python Class | Purpose |
|---|---|
| `SubstrateThinFilm` | Thin-film interference (iridescence, oil slick) — wraps a slab |
| `SubstrateHazinessToSecondaryRoughness` | Convert haziness value to second roughness weight |
| `SubstrateMetalnessToDiffuseAlbedoF0` | Metalness workflow adapter → DiffuseAlbedo + F0 |
| `SubstrateTransmittanceToMFP` | Convert transmittance color to SSS mean free path |
| `SubstrateShadingModels` | Select shading model per-pixel (UE 5.7+) |
| `SubstrateUI` | Custom Substrate UI node |

### SubstrateSlabBSDF Properties (Python)

```python
slab = mel.create_material_expression(mat, unreal.MaterialExpressionSubstrateSlabBSDF, x, y)
# Exposed Python properties:
slab.specular_profile    # SpecularProfile asset (iridescence, anisotropy profiles)
slab.subsurface_profile  # SubsurfaceProfile asset (SSS profile — must also set on Material node)
# All other inputs (DiffuseAlbedo, F0, Roughness, Normal, etc.) are connected
# via mel.connect_material_expressions() to the slab's input pins
```

### Connecting to Front Material

Substrate materials connect to `MP_FRONT_MATERIAL` instead of legacy pins (MP_BASE_COLOR, MP_METALLIC, etc.):

```python
# Connect a slab (or operator chain) to the material's Front Material output
mel.connect_material_property(slab_or_operator, '', unreal.MaterialProperty.MP_FRONT_MATERIAL)
```

### Class Naming Convention

```python
# DEPRECATED (UE 5.1–5.4 "Strata" era) — still works but shows deprecation warning
unreal.MaterialExpressionStrataSlabBSDF
unreal.MaterialExpressionStrataVerticalLayering

# CURRENT (UE 5.5+) — use these
unreal.MaterialExpressionSubstrateSlabBSDF
unreal.MaterialExpressionSubstrateVerticalLayering
```

## Real-World Architecture: Automotive Paint Material

Analysis of **M_Paint_Metallic_DualGlint** from the SubstrateMaterials showcase (280+ materials on Fab, production-ready for UE 5.7):

### Architecture

```
Material Functions (MFW_*) ─→ Slab nodes ─→ Vertical Layering ─→ Named Reroute ─→ MP_FRONT_MATERIAL
```

Only 28 expressions in the material itself — bulk of logic lives in **80+ Material Functions** using a modular `MFW_` / `MF_` naming convention.

### Material Function Library (`MFW_` = wrapper, `MF_` = utility)

**Base Layer Functions:**
- `MFW_Iso_Metallic_Base` — isotropic metallic slab (base layer for metals)
- `MFW_Iso_Dielectric_Base` — isotropic dielectric slab (plastics, glass, etc.)
- `MFW_Aniso_Dielectric_Base` — anisotropic dielectric (brushed plastic)
- `MFW_Aniso_BaseMetal` — anisotropic metal base
- `MFW_Graphics_Base` — base for graphic/logo overlays

**Color Functions:**
- `MFW_Metallic_Color` — metallic color with HSV adjustment + tint
- `MFW_Metallic_BaseMetal_Color` — bare metal color (for anodized/patina workflows)
- `MFW_Dielectric_Color` — dielectric diffuse color
- `MFW_Graphic_Color` — graphic/decal color control
- `MFW_Translucent_Color` — translucent material color

**Roughness Functions:**
- `MFW_Metallic_Roughness` — metallic roughness with map control
- `MFW_Dielectric_Roughness` — dielectric roughness with map
- `MFW_Dielectric_RoughnessSimple` — simplified roughness
- `MFW_Sheen_Roughness` — sheen/fuzz roughness
- `MFW_Translucent_Roughness` — translucent roughness

**Specular/Glint Functions:**
- `MFW_Metallic_Glint` — primary glint layer (sparkle/flake effect)
- `MFW_2nd_Metallic_Glint` — secondary glint layer (dual-glint paints)
- `MFW_Metallic_OPT_Glint` — optimized single-glint variant
- `MF_GlintCore` — core glint computation (shared by all glint functions)
- `MFW_Dielectric_Spec` — dielectric specular control
- `MFW_Translucent_Spec` — translucent specular

**Coat/Layering Functions:**
- `MFW_Coat` — clear coat layer (vertical layering on top of base)
- `MFW_MidCoat` — mid-coat layer (3-layer paint: base → midcoat → topcoat)
- `MFW_Tinted_Thin_Translucent` — tinted thin translucent layer
- `MFW_Tinted_Thin_Translucent_RR` — tinted thin translucent with ray refraction
- `MFW_Tinted_Translucent_PT` — path-traced translucent

**Thin Film Functions:**
- `MFW_Metallic_ThinFilm` — thin-film interference on metal (oil slick, iridescence)
- `MFW_Dielectric_ThinFilm` — thin-film on dielectric
- `MFW_Translucent_ThinFilm` — thin-film on translucent surfaces
- `MF_ThinIOR` — IOR computation for thin-film effects

**Normal/Detail Functions:**
- `MFW_Metallic_Normal` — metallic normal mapping with strength control
- `MFW_Dielectric_Normal` — dielectric normal mapping
- `MFW_Translucent_Normal` — translucent normal mapping
- `MF_NormalCore` — shared normal computation
- `MFW_Height2Normal` — heightmap to normal conversion
- `MF_Slope2Normal` — slope to normal conversion

**Imperfection Functions:**
- `MFW_Imperfections` — master imperfections layer (fingerprints + dust + scratches)
- `MF_FingerprintInput` — fingerprint detail (scattering, coverage, random mask)
- `MF_DustInput` — dust detail (3-layer dust: thin, scattered, heavy)
- `MF_ScratchInput` — scratch detail (directional scratches, normal-based)
- `MFW_ImperfectionDebug` — debug visualization for imperfection masks
- `MFW_ImperfectionDustDebug` — debug visualization for dust layers

**Anisotropy Functions:**
- `MFW_Metallic_Anisotropy` — metallic anisotropic reflections
- `MFW_Dielectric_Anisotropy` — dielectric anisotropic reflections
- `MFW_Aniso_Circled_Metal` — circular brushed metal pattern
- `MFW_Aniso_Cracks_Circled_Metal` — cracked circular metal
- `MFW_Aniso_Dieletric_Circle` — circular brushed dielectric
- `MFW_Aniso_Dielectric_Cracks_Circle` — cracked circular dielectric
- `MFW_Aniso_Dielectric_Sheen` — aniso dielectric with sheen

**UV/Coordinate Functions:**
- `MF_MakeCoordinates` — standard UV generation
- `MF_MakeCoordinatesBase` — base coordinate system
- `MF_MakeCoordinates_Advanced` — advanced UV with rotation/projection
- `MF_MakeCoordinates_GEOUV` — geometry-based UVs
- `MF_MakeCoordinates_Pattern` — pattern-specific UVs
- `MF_MakeCoordinates_Perforation` — perforation pattern UVs
- `MF_MakeCoordinates_Velvet` — velvet-specific UVs
- `MF_MakeCoordinatesBase_POM` — parallax occlusion mapping UVs

**Utility Functions:**
- `MF_SafeBlend` — safe linear blend avoiding NaN
- `MF_MapControl` — remap value range
- `MF_Fade` — distance fade
- `MF_FadeCamera` — camera distance fade
- `MF_DitheringOptions` — dithering control
- `MF_BayerDithering` — Bayer matrix dithering
- `MF_EnumerationSwtich` — multi-option enumeration switch
- `MF_IORControl` — index of refraction control
- `MF_TintOptions` — tint selection options
- `MF_3DPatternMask` — 3D pattern masking
- `MF_EVCaculator` — exposure value calculator
- `MF_PolarWarp` — polar UV warping
- `MF_CubeMapUV` — cubemap UV generation

**Special Functions:**
- `MFW_Perforation` — perforated metal (holes in surface)
- `MFW_Logo` — logo/decal overlay
- `MFW_Velvet` — velvet/fabric sheen
- `MFW_Circle` — circular pattern
- `MFW_RotorCrackPattern` — brake rotor crack pattern
- `MFW_EmissiveNit` — physically-based emissive (nit units)
- `MFW_EmissiveSimple` — simple emissive
- `MFW_EmissiveNitTranslucentLayer` — emissive translucent
- `MF_3DToon` — 3D toon/NPR shading
- `MF_SafeSheenColor` — safe sheen color (prevents NaN)
- `MF_Round3D` — 3D rounding function
- `MF_NormalizeAngle` — angle normalization

### Parameter Architecture (M_Paint_Metallic_DualGlint)

The material exposes **48 scalar**, **32 vector**, **11 texture**, and **1 static switch** parameters. Key patterns:

**Packed vector parameters** — vector4 used to pack multiple controls:
- `Primary Glints Properties = (Density, Size, Rotation, Intensity)` as `(1.0, 0.5, 0.5, 1.0)`
- `Topcoat Thickness Control = (Min, Max, Strength, 0)` as `(0.005, 0.0055, 1.0, 0.0)`
- `Dust Coverage = (Min, Max, Strength, Falloff)` as `(0.05, 0.3, 1.0, 0.1)`
- `Scratches Detail Control = (TileU, TileV, Strength, Contrast)` as `(0.035, 0.345, 1.1, 0.43)`

**Toggle parameters** — scalars used as booleans (0.0 = off, 1.0 = on):
- `Use Topcoat`, `Use Fingerprints`, `Use Dust`, `Use Scratches`, `Use Metallic Thin Film`

**Shader cost**: 2195 pixel shader instructions, 16 pixel texture samples, 3 virtual texture samples. This is a complex automotive-grade material — typical game materials should target 200-500 PS instructions.

### `substrate_roughness_tracking` Material Property

```python
mat.get_editor_property('substrate_roughness_tracking')  # True
```
When enabled, the material compiler tracks roughness across Substrate layers for improved specular quality. Enabled by default in production Substrate materials.

## Complete Material Architecture: SubstrateMaterials Library (280+ Assets)

The official Epic automotive Substrate library (available on Fab, production-ready for UE 5.7) demonstrates the definitive approach for organizing complex Substrate material systems.

### 3-Tier Hierarchy: Parent Material → MTP Template → MI Final

```
Parent Material (M_*)         42 materials — define slab topology, blend mode, shading model
  └── MTP Template (MTP_*)    63 material instances — configure default textures + parameter presets per category
        └── MI Final (MI_*)   349 material instances — override colors, roughness, textures for specific looks
```

**Key insight**: The parent material graph is kept small (~28 expressions). All complex logic lives in **88 Material Functions** (`MFW_*` / `MF_*`) called from within the parent. The MTP layer sets a "category preset" (e.g., all metals share one MTP with default metal textures). Final MIs only override the 3-8 parameters that differentiate, e.g., chromium from aluminum.

### Parent Material Categories & Shading Models

| Category | Parent Material | Shading Model | Blend Mode | Key Feature |
|----------|----------------|---------------|------------|-------------|
| **Paint (Dielectric)** | `M_Paint_Dielectric` | `MSM_SUBSURFACE_PROFILE` | Opaque | Base + clear coat via Vertical Layering |
| **Paint (Metallic)** | `M_Paint_Metallic` | `MSM_SUBSURFACE_PROFILE` | Opaque | Metallic flakes + coat |
| **Paint (Glint)** | `M_Paint_Metallic_Glint` | `MSM_SUBSURFACE_PROFILE` | Opaque | Glint sparkle via `MFW_Metallic_Glint` |
| **Paint (DualGlint)** | `M_Paint_Metallic_DualGlint` | `MSM_SUBSURFACE_PROFILE` | Opaque | Two glint layers (primary+secondary) |
| **Paint (Flipflop/Midcoat)** | `M_Paint_Metallic_Glint_Midcoat` | `MSM_SUBSURFACE_PROFILE` | Opaque | 3-layer: base → midcoat → topcoat |
| **Metal** | `M_Metallic` | `MSM_DEFAULT_LIT` | Masked | Bare metals (chromium, aluminum, steel, copper, gold) |
| **Anodized Metal** | `M_Anodized_Metallic` | `MSM_SUBSURFACE_PROFILE` | Masked | Metal + colored oxide layer |
| **Aniso Metal** | `M_Metallic_Circles_Anisotropy` | `MSM_DEFAULT_LIT` | Opaque | Circular brushed patterns |
| **Dielectric** | `M_Mask_Dielectric` | `MSM_DEFAULT_LIT` | Masked | Plastics, rubber, asphalt |
| **Dielectric + Coat** | `M_Opaque_Dielectric_Coat_POM` | `MSM_SUBSURFACE_PROFILE` | Opaque | Leather, wood veneer (coat + POM) |
| **Dielectric + Sheen** | `M_Opaque_Dielectric_Sheen_POM` | `MSM_DEFAULT_LIT` | Opaque | Suede, carpet, fabric (fuzz + POM) |
| **Dielectric + MFP** | `M_Mask_Dielectric_MFP` | `MSM_SUBSURFACE_PROFILE` | Masked | SSS plastics (translucent scattering) |
| **Translucent (Lumen)** | `M_Translucent_Thin_Tinted` | `MSM_DEFAULT_LIT` | `BLEND_TRANSLUCENT_COLORED_TRANSMITTANCE` | Windshield glass (Lumen path) |
| **Translucent (PT)** | `M_Translucent_Tinted_PT` | `MSM_DEFAULT_LIT` | `BLEND_TRANSLUCENT_COLORED_TRANSMITTANCE` | Glass (Path Tracing path) |
| **Translucent + RR** | `M_Translucent_Thin_Tinted_RR` | `MSM_DEFAULT_LIT` | `BLEND_TRANSLUCENT_COLORED_TRANSMITTANCE` | Polycarbonate with retro-reflector |
| **Emissive Translucent** | `M_Translucent_Thin_Emissive_Tinted` | `MSM_DEFAULT_LIT` | `BLEND_TRANSLUCENT_COLORED_TRANSMITTANCE` | Backlit glass, light guides |
| **Decals** | `M_Dielectric_D`, `M_Metallic_D`, `M_Emissiv_D` | `MSM_DEFAULT_LIT` | Translucent | Deferred decals (dielectric/metallic/emissive) |
| **Graphics** | `M_Dielectric_Graphics` | `MSM_DEFAULT_LIT` | Opaque | Multi-texture overlays (tires, license plates) |
| **Dots/Frit** | `M_Dielectric_Dots` | `MSM_DEFAULT_LIT` | Masked + TwoSided | Windshield frit band |

### OpenPBR (OPBR) — New Unified Surface Model

Several MTPs use a new `M_OpenPBR_Opaque_Parent` and `M_OpenPBR_OpaquePOM_Parent` material. Identified OPBR templates:
- `MTP_Paint_OPBR`, `MTP_Fabric_OPBR`, `MTP_Leather_OPBR`, `MTP_Plastic_OPBR`
- `MTP_Rubber_OPBR`, `MTP_CarbonFiber_OPBR`, `MTP_WoodVeneer_OPBR`
- `MTP_Fabric_Velvet_OPBR` (uses POM variant)

These exist alongside the Substrate slab-based parents, indicating UE 5.7 supports **both** Substrate slab composition and OpenPBR as material authoring workflows. OPBR materials use a conventional parameter naming scheme and are simpler to instance.

### Blend Mode: `BLEND_TRANSLUCENT_COLORED_TRANSMITTANCE`

All translucent glass/windshield materials use `BLEND_TRANSLUCENT_COLORED_TRANSMITTANCE` (enum value 7), **not** the standard `BLEND_TRANSLUCENT`. This mode enables physically-correct colored light transmission through tinted glass with per-channel transmittance control.

### SpecularProfile Assets

The library includes 4 `SpecularProfile` assets for specialized reflectance behavior:
- `SP_Default` — standard isotropic specular
- `SP_ChromeColor_L` — chrome with luminance-based color shift
- `SP_ChromeColor_V` — chrome with view-angle color shift
- `SP_ChromeColor_LV` — chrome with both luminance + view-angle shift

These are assigned to `SubstrateSlabBSDF.specular_profile` to create advanced specular effects like chrome with color shifts at different viewing angles.

### Packed Vector Parameter Convention

The library consistently uses `Vector4` parameters to pack multiple controls into a single parameter for efficiency:

| Packing Pattern | X | Y | Z | W |
|----------------|---|---|---|---|
| `*Roughness Control` | Min | Max | Strength | 0 |
| `*Thickness Control` | Min | Max | Strength | 0 |
| `*Glints Properties` | Density | Size | Rotation | Intensity |
| `Tile XYZ` | TileX | TileY | TileZ | GlobalScale |
| `*Coverage` | Min | Max | Strength | Falloff |
| `*Detail Control` | TileU | TileV | Strength | Contrast |
| `IOR Control` | Min | Max | Strength | 0 |
| `MFP Scale Control` | Min | Max | Strength | 0 |
| `Topcoat Normal Map Tile` | TileU | TileV | Strength | 0 |
| `Color Map HSV` | Hue | Saturation | Value | 1.0 |

### Physically-Based Metal Color Specifications

The library uses spectral F0 values (not sRGB BaseColor) for metals. Reference values from real measured data:

| Metal | Color A (R, G, B) | Color B (R, G, B) | Notes |
|-------|-------------------|-------------------|-------|
| Chromium | (0.643, 0.651, 0.662) | (0.647, 0.657, 0.669) | Near-white, slight blue tint |
| Aluminum | (0.911, 0.913, 0.912) | (0.909, 0.916, 0.921) | Very bright, neutral |
| Gold | — | — | Warm yellow-orange F0 |
| Copper | — | — | Red-orange F0 |

Two-color blending (`Metallic Color A` + `Metallic Color B` + `Metallic Color Blending Map`) creates realistic micro-variation in metal reflectance.

### Imperfection System (Fingerprints + Dust + Scratches)

The `MFW_Imperfections` function adds photorealistic surface wear via three independent layers:

- **Fingerprints** (`MF_FingerprintInput`): scattered prints controlled by vertex-color or random mask, with per-print scaling
- **Dust** (`MF_DustInput`): 3-layer system (thin/scattered/heavy) with independent colors per layer, vertex-color-driven coverage
- **Scratches** (`MF_ScratchInput`): directional scratches with normal-based blending, tile/strength/contrast control

Each layer has independent toggle parameters (`Use Fingerprints`, `Use Dust`, `Use Scratches`) and can be enabled/disabled per material instance. The `_Weathered` MI variants (e.g., `MI_Paint_Solid_Red_Weathered`) enable imperfections on top of clean materials.

### Emissive System — Physical Luminance (Nits)

The emissive material functions (`MFW_EmissiveNit`, `MFW_EmissiveNitTranslucentLayer`) use **physical luminance in nits** rather than arbitrary multipliers:
- `Luminance` parameter: directly in nits (e.g., 15000.0 for a light guide)
- `MF_EVCaculator`: exposure value calculator for physically-based light intensity

### Folder Structure Convention

```
SubstrateMaterials/
├── Materials/
│   ├── 00_ParentMaterials/    42 M_* parent materials
│   ├── 00_MaterialFunctions/  88 MFW_*/MF_* functions
│   ├── 01_Paints/
│   │   ├── 0_Templates/       MTP_Paint_* (15 templates)
│   │   └── [MI_Paint_*]       Final paint instances
│   ├── 02_Upholstery/
│   │   ├── 0_Templates/       MTP_Leather/Fabric/Suede/Belt/Carpet
│   │   └── [MI_*]             Leather, fabric, suede, carpet instances
│   ├── 03_Metals/
│   │   ├── 0_Templates/       MTP_Metal/Anodized/Perforated
│   │   └── [MI_*]             Chromium, aluminum, gold, steel, etc.
│   ├── 04_Carbon/
│   │   ├── 1_CarbonFiber/     Carbon fiber (twill, plain weave)
│   │   └── 2_CarbonCeramic/   Carbon ceramic (brake discs)
│   ├── 05_Translucent/
│   │   ├── 0_Templates/Lumen/ Lumen-path glass templates
│   │   ├── 0_Templates/PT/    Path-traced glass templates
│   │   └── [MI_*]             Windshield, polycarbonate, reflectors
│   ├── 06_Plastics/           Plastics, SSS plastics, perforated
│   ├── 07_Rubbers/            Rubber, tire patterns
│   ├── 08_WoodVeneer/         Wood veneer with topcoat
│   ├── 09_Emissive/           Backlit/frontlit glass, LED screens, light bars
│   └── 10_Decals/             Dielectric/metallic/emissive decals
├── Textures/                  214 textures organized by material type
├── Enums/                     36 UserDefinedEnums for static switches
└── LevelAssets/               Showcase levels (LookDev, Overview)
