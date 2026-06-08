# Substrate Automotive Material Patterns

Reference patterns from the official Epic SubstrateMaterials library (280+ materials, production-ready UE 5.7). Use these patterns when creating automotive, product visualization, or architectural materials.

## 3-Tier Material Hierarchy

The library uses a strict 3-level hierarchy for scalable material systems:

```
M_* Parent Material (42)    → Defines slab topology, blend mode, shading model
  └── MTP_* Template (63)   → MaterialInstanceConstant with category defaults (textures, base params)
        └── MI_* Final (349) → MaterialInstanceConstant overriding only what differs
```

### Python: Create a 3-tier material hierarchy

```python
import unreal
mel = unreal.MaterialEditingLibrary
eal = unreal.EditorAssetLibrary
ath = unreal.AssetToolsHelpers.get_asset_tools()

# 1. Parent already exists (e.g., M_Metallic at /Game/SubstrateMaterials/Materials/00_ParentMaterials/)
parent = eal.load_asset('/Game/SubstrateMaterials/Materials/00_ParentMaterials/M_Metallic')

# 2. Create MTP template
mtp = ath.create_asset('MTP_MyMetal', '/Game/Materials/Templates',
    unreal.MaterialInstanceConstant, unreal.MaterialInstanceConstantFactoryNew())
mel.set_material_instance_parent(mtp, parent)
# Set category defaults
mel.set_material_instance_texture_parameter_value(mtp, 'Roughness Map',
    eal.load_asset('/Game/SubstrateMaterials/Textures/03_Metals/T_Metal_Wear_Frosted_R'))
mel.set_material_instance_texture_parameter_value(mtp, 'Normal Map',
    eal.load_asset('/Game/SubstrateMaterials/Textures/03_Metals/T_Metal_Steel_SandBlasted_N'))
eal.save_asset('/Game/Materials/Templates/MTP_MyMetal')

# 3. Create final MI
mi = ath.create_asset('MI_MyChromium', '/Game/Materials/Metals',
    unreal.MaterialInstanceConstant, unreal.MaterialInstanceConstantFactoryNew())
mel.set_material_instance_parent(mi, mtp)
# Override only what differs
mel.set_material_instance_vector_parameter_value(mi, 'Metallic Color A',
    unreal.LinearColor(0.643, 0.651, 0.662, 1.0))
mel.set_material_instance_vector_parameter_value(mi, 'Metallic Color B',
    unreal.LinearColor(0.647, 0.657, 0.669, 1.0))
mel.set_material_instance_vector_parameter_value(mi, 'Primary Roughness Control',
    unreal.LinearColor(0.007, 0.045, 1.0, 0.0))  # Min, Max, Strength, 0
eal.save_asset('/Game/Materials/Metals/MI_MyChromium')
```

## Packed Vector Parameter Convention

All control parameters pack multiple values into Vector4 for efficiency:

| Pattern | X | Y | Z | W |
|---------|---|---|---|---|
| `*Roughness Control` | Min | Max | Strength | 0 |
| `*Thickness Control` | Min | Max | Strength | 0 |
| `Tile XYZ` | TileX | TileY | TileZ | GlobalScale |
| `*Glints Properties` | Density | Size | Rotation | Intensity |
| `*Coverage` | Min | Max | Strength | Falloff |
| `*Detail Control` | TileU | TileV | Strength | Contrast |
| `IOR Control` | Min IOR | Max IOR | Strength | 0 |
| `MFP Scale Control` | Min | Max | Strength | 0 |
| `Color Map HSV` | Hue offset | Sat mult | Value offset | 1.0 |

```python
# Example: set roughness range 0.007-0.045 at full strength
mel.set_material_instance_vector_parameter_value(mi, 'Primary Roughness Control',
    unreal.LinearColor(0.007, 0.045, 1.0, 0.0))

# Example: set tiling with 6x global scale
mel.set_material_instance_vector_parameter_value(mi, 'Tile XYZ',
    unreal.LinearColor(1.0, 1.0, 1.0, 6.0))
```

## Metal Material Recipe

Parent: `M_Metallic` (MSM_DEFAULT_LIT, Masked)
Template: `MTP_Metal`

Key parameters:
- `Metallic Color A` / `Metallic Color B` — spectral F0 values (not sRGB)
- `Metallic Color Blending Map` — texture blending between A and B
- `Primary Roughness Control` — (Min, Max, Strength, 0)
- `Anisotropy Strength Variation Control` — (Min, Max, Strength, 0)
- `Roughness Map`, `Normal Map` — surface detail textures

Reference F0 values:
| Metal | Color A | Color B |
|-------|---------|---------|
| Chromium | (0.643, 0.651, 0.662) | (0.647, 0.657, 0.669) |
| Aluminum | (0.911, 0.913, 0.912) | (0.909, 0.916, 0.921) |

## Car Paint Material Recipe

Parent: `M_Paint_Metallic` (MSM_SUBSURFACE_PROFILE, Opaque)
Template: `MTP_Paint_Metallic`

Key parameters:
- `Tint` — base paint color (linear)
- `Metallic Color Map` — flake color variation texture
- `Metallic Color Map HSV` — (Hue, Sat, Value, 1) adjustment
- `Primary Roughness Control` — base roughness range
- `Secondary Roughness Control` + `Secondary Roughness Weight` — second specular lobe
- `Normal Map Strength` — flake bump intensity
- `Topcoat Thin Film Thickness/IOR` — optional thin-film interference

**Glint variants** add sparkle:
- `M_Paint_Metallic_Glint` → single glint layer
- `M_Paint_Metallic_DualGlint` → two glint layers (primary + secondary)
- Glint params: `Primary Glints Color`, `Primary Glints Properties` (Density, Size, Rotation, Intensity), `Primary Glints Roughness`, `Primary Glints Background Roughness Weight`

## Leather Material Recipe

Parent: `M_Opaque_Dielectric_Coat_POM` (MSM_SUBSURFACE_PROFILE, Opaque)
Template: `MTP_Leather_Perforated`

Key parameters:
- `Tint` — leather base color
- `Topcoat Color` — clear coat tint
- `Topcoat Thickness Control` — coat thickness range
- `Topcoat Roughness Control` — coat roughness range
- `Topcoat IOR` — coat index of refraction (~1.478 for leather)
- `F0 Control` — base specular reflectance range
- `Use Perforations` — scalar toggle (0/1)
- `Perforations Rim/Sidewall/Bottom Color` — per-depth coloring
- POM depth via `Perforations Depth Control`

## Carbon Fiber Recipe

Parent: `M_Opaque_Dielectric_Coat_Aniso` (MSM_SUBSURFACE_PROFILE, Opaque)
Template: `MTP_CarbonFiber`

Key parameters:
- `Tile U/V` — weave repeat count (e.g., 40x40)
- `Topcoat Color/Coverage/Thickness/Roughness` — clear epoxy coat
- `Tint` — fiber base color (very dark: ~0.006)
- `F0 Control` — specular range
- `Anisotropy Map` — directional reflection texture
- `Anisotropy Strength Variation Control`

## Glass / Windshield Recipe

Parent: `M_Translucent_Thin_Tinted` (MSM_DEFAULT_LIT, `BLEND_TRANSLUCENT_COLORED_TRANSMITTANCE`)
Template: `MTP_Windshield_Lumen`

Key parameters:
- `Transmittance Tint` — glass color filter
- `IOR Control` — (Min, Max, Strength) index of refraction (~1.533-1.55)
- `Roughness Control` — glass smoothness
- `MFP Anisotropy Control` — subsurface anisotropy
- `MFP Scale Control` — subsurface scattering scale

**Important**: Use `BLEND_TRANSLUCENT_COLORED_TRANSMITTANCE` (enum 7) for physically correct glass, NOT `BLEND_TRANSLUCENT`.

## Fabric/Suede with Sheen Recipe

Parent: `M_Opaque_Dielectric_Sheen_POM` (MSM_DEFAULT_LIT, Opaque)
Template: `MTP_Suede_Perforated`

Key parameters:
- `Tint` — fabric base color
- `Sheen Tint` — fuzz/nap color
- `Sheen Coverage Control` — (Min, Max, Strength)
- `Sheen Roughness Control` — (Min, Max, Strength)
- `Use Microfibers` — toggle for fiber detail (1.0)
- `Microfibers Height Control` — (Height, Coverage, Fade, 1)
- Dust system: `Dust Coverage`, `Dust Layer 0/1/2 Color`, `Thin Dust Color`

## Plastic (SSS) Recipe

Parent: `M_Mask_Dielectric_MFP` (MSM_SUBSURFACE_PROFILE, Masked)
Template: `MTP_Plastic_Mask_SSS`

Key parameters:
- `Tint` — surface color
- `Transmittance Tint` — SSS color
- `MFP Scale Control` — scatter distance range
- `MFP Anisotropy Control` — directional scattering
- `Thickness Control` — slab thickness range

## Emissive / Backlit Material

Uses `MTP_Emissive_*` templates inheriting from windshield/plastic/metal parents with added emissive parameters:
- `Luminance` — in physical nits (e.g., 15000.0)
- `Emissive Tint` — emissive color multiplier
- `Emissive Color Map` / `Emissive Mask Map` — texture-driven emission

## Weathered Variants

Add `_Weathered` suffix to any MI and enable imperfection layers:
- `Use Fingerprints = 1.0` + fingerprint detail controls
- `Use Dust = 1.0` + 3-layer dust system (thin/scattered/heavy)
- `Use Scratches = 1.0` + scratch direction/strength controls

## Existing Material Templates (available at /Game/SubstrateMaterials/)

### Paint Templates (01_Paints/0_Templates/)
`MTP_Paint_Dielectric`, `MTP_Paint_Dielectric_DualGlint`, `MTP_Paint_Dielectric_Glint`, `MTP_Paint_Dielectric_Flipflop`, `MTP_Paint_Metallic`, `MTP_Paint_Metallic_DualGlint`, `MTP_Paint_Metallic_Glint`, `MTP_Paint_Metallic_Flipflop`, `MTP_Paint_Metallic_DualGlint_Optimized`, `MTP_Paint_Metallic_Flipflop_Optimized`, `MTP_Paint_Metallic_Glint_Optimized`, `MTP_Paint_OPBR`, `MTP_Paint_Caliper`, `MTP_Paint_Circles`, `MTP_LicensePlate`

### Upholstery Templates (02_Upholstery/0_Templates/)
`MTP_Leather_Perforated`, `MTP_Leather_OPBR`, `MTP_Suede_Perforated`, `MTP_Fabric_OPBR`, `MTP_Fabric_Velvet_OPBR`, `MTP_Fabric_Textile_Perforated`, `MTP_Carpet`, `MTP_Belt`, `MTP_Plastic_OPBR`

### Metal Templates (03_Metals/0_Templates/)
`MTP_Metal`, `MTP_Anodized_Metal`, `MTP_Circles_Anisotropy_Metal`, `MTP_Perforated_Metal`, `MTP_Perforated_Anodized_Metal`

### Carbon Templates (04_Carbon/)
`MTP_CarbonFiber`, `MTP_CarbonFiber_OPBR`, `MTP_Dielectric_Coated_Black`, `MTP_Metallic_Coated_Black`

### Translucent Templates (05_Translucent/0_Templates/)
`MTP_Windshield_Lumen`, `MTP_Polycarbonate_Lumen_RR`, `MTP_Windshield_PT`, `MTP_Polycarbonate_PT`, `MTP_Mirror`, `MTP_Windshield_Frit`

### Plastic/Rubber/Wood Templates
`MTP_Plastic`, `MTP_Plastic_Mask_Perforated`, `MTP_Plastic_Mask_SSS`, `MTP_Plastic_OPBR`, `MTP_Rubber_OPBR`, `MTP_Tire`, `MTP_WoodVeneer`, `MTP_WoodVeneer_OPBR`

### Emissive Templates (09_Emissive/0_Templates/)
`MTP_Emissive_LEDScreen`, `MTP_Emissive_Metal_Anodized_Perforated`, `MTP_Emissive_Metal_Chromium_Matte`, `MTP_Emissive_Metal_Perforated`, `MTP_Emissive_Plastic_Perforated`, `MTP_Emissive_Plastic_RadialLines`, `MTP_Emissive_Plastic_SSS`, `MTP_Emissive_Windshield_Frosted_Lumen_Back`, `MTP_Emissive_Windshield_Frosted_PT`, `MTP_Emissive_Windshield_Lumen`, `MTP_Emissive_Windshield_Lumen_Clear`, `MTP_Emissive_Windshield_PT`

### Decal Templates (10_Decals/0_Templates/)
`MTP_Decal_Dielectric`, `MTP_Decal_Emissive`, `MTP_Decal_Metallic`
