# Texture & Image Generation Workflow

How to generate, import, and use textures in UE material graphs. Uses the **generate-image** skill (FLUX.2-klein on DGX Spark) for on-demand texture creation.

## When to Generate Textures

| Scenario | Action |
|----------|--------|
| Material needs base color / normal / roughness textures not in project | Generate via generate-image skill |
| Procedural patterns (hex grid, circuit lines, noise, dots) | Generate or search `/Game/Effects/Textures/` for existing |
| PBR texture sets (albedo + normal + roughness + metallic) | Generate each channel separately |
| Placeholder textures for early iteration | Generate quick 512x512 versions first |
| Texture exists but wrong resolution or style | Generate replacement at correct spec |

## Texture Decomposition — MANDATORY Before Texture-Based Materials

**Before creating any material that uses textures, decompose the texture requirements.**

### Step 1: Identify Required Textures

List each texture with its purpose, format, and channel usage:

```
Texture Plan:
- T_WoodFloor_D: Diffuse/Base Color (RGB, sRGB)
- T_WoodFloor_N: Normal Map (RGB, Linear, sampler_type=NORMAL)
- T_WoodFloor_R: Roughness (R channel, Linear)
- T_WoodFloor_M: Metallic (R channel, Linear) — constant 0 for wood
- T_WoodFloor_AO: Ambient Occlusion (R channel, Linear) — optional
```

### Step 2: Check Project Assets First

Search for existing textures before generating new ones:

```python
import unreal
eal = unreal.EditorAssetLibrary

# Check common texture directories
for search_path in ['/Game/Textures', '/Game/Assets/Textures', '/Game/Effects/Textures']:
    if eal.does_directory_exist(search_path):
        assets = eal.list_assets(search_path, recursive=True)
        for a in assets:
            if 'wood' in a.lower() or 'floor' in a.lower():
                print("Found: {}".format(a))
```

Also check engine content:
- `/Engine/EngineMaterials/` — basic patterns
- `/Engine/EditorMeshes/` — preview meshes
- `/Engine/Functions/` — material functions

### Step 3: Generate Missing Textures

Use the **generate-image** skill with these guidelines:

**Prompt format:**
```
"[texture type] texture, [description], seamless tileable, [style notes], [resolution]"
```

**Examples by texture type:**

| Type | Prompt Example |
|------|---------------|
| **Diffuse/Albedo** | "wood floor planks texture, warm oak color, seamless tileable, top-down view, 1024x1024" |
| **Normal Map** | "wood grain normal map texture, subtle surface detail, seamless tileable, blue-purple tones, 1024x1024" |
| **Roughness** | "roughness map texture, wood floor, lighter areas smoother darker areas rougher, grayscale, seamless, 1024x1024" |
| **Pattern** | "hexagonal grid pattern, thin white lines on black background, seamless tileable, circuit board style, 1024x1024" |
| **Emissive Mask** | "glowing circuit lines mask, white lines on black, tech pattern, seamless, 512x512" |

**Resolution guidelines:**
- 512x512 — placeholders, simple patterns, masks
- 1024x1024 — standard PBR textures, most use cases
- 2048x2048 — hero assets, close-up surfaces

**CRITICAL rules for generation:**
- Always specify "seamless tileable" for repeating textures
- Always specify "top-down view" for floor/wall textures
- For normal maps: request "blue-purple tones" or "normal map style"
- For roughness/metallic: request "grayscale"
- Generate each PBR channel as a separate image

### Step 4: Import Textures into UE

```python
import unreal

eal = unreal.EditorAssetLibrary
ath = unreal.AssetToolsHelpers.get_asset_tools()

def import_texture(source_path, dest_path, dest_name):
    """Import a texture file into the UE project."""
    task = unreal.AssetImportTask()
    task.set_editor_property('filename', source_path)
    task.set_editor_property('destination_path', dest_path)
    task.set_editor_property('destination_name', dest_name)
    task.set_editor_property('automated', True)
    task.set_editor_property('save', True)
    task.set_editor_property('replace_existing', True)

    ath.import_asset_tasks([task])

    # Verify import
    full_path = "{}/{}".format(dest_path, dest_name)
    if eal.does_asset_exist(full_path):
        print("Imported: {}".format(full_path))
        return eal.load_asset(full_path)
    else:
        print("ERROR: Import failed for {}".format(source_path))
        return None

# Example usage:
# tex = import_texture("/tmp/wood_diffuse.png", "/Game/Textures", "T_Wood_D")
```

**Normal map import — set compression:**
```python
# After importing a normal map, set the correct compression
tex = eal.load_asset('/Game/Textures/T_Wood_N')
if tex:
    tex.set_editor_property('compression_settings',
        unreal.TextureCompressionSettings.TC_NORMALMAP)
    tex.set_editor_property('srgb', False)  # Normal maps must be Linear
    eal.save_asset('/Game/Textures/T_Wood_N')
```

**Roughness/Metallic import — set to Linear:**
```python
# Single-channel maps must be Linear, not sRGB
tex = eal.load_asset('/Game/Textures/T_Wood_R')
if tex:
    tex.set_editor_property('srgb', False)
    tex.set_editor_property('compression_settings',
        unreal.TextureCompressionSettings.TC_MASKS)
    eal.save_asset('/Game/Textures/T_Wood_R')
```

### Step 5: Wire Textures in Material

```python
import unreal
mel = unreal.MaterialEditingLibrary

# UV tiling (shared by all texture samples)
uv = mel.create_material_expression(mat, unreal.MaterialExpressionTextureCoordinate, -800, 0)
uv.set_editor_property('u_tiling', 2.0)
uv.set_editor_property('v_tiling', 2.0)

# Diffuse texture → Base Color
diffuse = mel.create_material_expression(mat, unreal.MaterialExpressionTextureSampleParameter2D, -500, -200)
diffuse.set_editor_property('parameter_name', 'DiffuseTexture')
diffuse.set_editor_property('texture', diffuse_tex)
mel.connect_material_expressions(uv, '', diffuse, 'UVs')
mel.connect_material_property(diffuse, 'RGB', unreal.MaterialProperty.MP_BASE_COLOR)

# Normal map → Normal (MUST set sampler_type!)
normal = mel.create_material_expression(mat, unreal.MaterialExpressionTextureSampleParameter2D, -500, 200)
normal.set_editor_property('parameter_name', 'NormalTexture')
normal.set_editor_property('texture', normal_tex)
normal.set_editor_property('sampler_type', unreal.MaterialSamplerType.SAMPLERTYPE_NORMAL)
mel.connect_material_expressions(uv, '', normal, 'UVs')
mel.connect_material_property(normal, 'RGB', unreal.MaterialProperty.MP_NORMAL)

# Roughness → single channel (R)
roughness_tex_node = mel.create_material_expression(mat, unreal.MaterialExpressionTextureSampleParameter2D, -500, 400)
roughness_tex_node.set_editor_property('parameter_name', 'RoughnessTexture')
roughness_tex_node.set_editor_property('texture', roughness_tex)
mel.connect_material_expressions(uv, '', roughness_tex_node, 'UVs')
mel.connect_material_property(roughness_tex_node, 'R', unreal.MaterialProperty.MP_ROUGHNESS)
```

## Texture Decomposition Examples

**PBR Wood Floor:**
```
Textures needed:
1. T_WoodFloor_D — diffuse (RGB, sRGB) → MP_BASE_COLOR
2. T_WoodFloor_N — normal map (RGB, Linear, SAMPLERTYPE_NORMAL) → MP_NORMAL
3. T_WoodFloor_R — roughness (R channel, Linear) → MP_ROUGHNESS
4. Metallic — constant 0.0 (wood is non-metallic)

UV Setup: TextureCoordinate, u_tiling=2, v_tiling=2 (shared)
```

**Sci-Fi Panel:**
```
Textures needed:
1. T_SciFi_D — diffuse with panel lines and rivets (RGB)
2. T_SciFi_N — normal map for beveled edges and surface detail
3. T_SciFi_R — roughness: smooth panels, rough seams
4. T_SciFi_M — metallic: 1.0 for metal panels, 0.0 for rubber seams
5. T_SciFi_E — emissive mask: glowing indicator lights (R channel)

UV Setup: TextureCoordinate, tiling depends on mesh scale
Emissive: T_SciFi_E.R × EmissiveColor (VectorParameter) × Intensity (ScalarParameter)
```

**Shield Effect with Generated Pattern:**
```
Textures needed:
1. T_HexGrid — hexagonal grid pattern (white lines on black, seamless)
   Generate: "hexagonal grid pattern, thin white lines on black background, seamless tileable, 1024x1024"

UV Setup: TextureCoordinate, u_tiling=5, v_tiling=5
Blend: BLEND_TRANSLUCENT, MSM_UNLIT, two_sided=True
Pattern: T_HexGrid × Fresnel → Emissive + Opacity
```

## Common Mistakes with Textures

1. **Forgetting sampler_type for normal maps** — causes flat shading, no surface detail visible
2. **Leaving sRGB=True on roughness/metallic maps** — makes surface too rough/shiny, incorrect look
3. **Using same TextureCoordinate tiling for all channels** — usually correct, but normal map may need different scale
4. **Not verifying import succeeded** — always `does_asset_exist()` after import
5. **Generating all PBR channels in one image** — generate each channel SEPARATELY
6. **Using RGBA output for single-channel maps** — use `"R"` output pin, not `""` (RGBA)
