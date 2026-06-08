# Material Python API Reference

Quick-reference for all Python API classes and methods used in material workflows. Use `ue_api_search` and `ue_api_type` to discover types not listed here.

## Core Library Aliases

```python
import unreal
mel = unreal.MaterialEditingLibrary        # Expression graph building
eal = unreal.EditorAssetLibrary            # Asset load/save/exists
ath = unreal.AssetToolsHelpers.get_asset_tools()  # Asset creation
aes = unreal.get_editor_subsystem(unreal.AssetEditorSubsystem)  # Editor windows
```

## MaterialEditingLibrary — Full Method Reference (56 methods)

Source: `MaterialEditor` module. All methods are `classmethod`.

### Create & Wire Expressions

| Method | Returns | Description |
|--------|---------|-------------|
| `create_material_expression(material, expression_class, x=0, y=0)` | `MaterialExpression` | Create expression node at (x, y) position |
| `create_material_expression_in_function(material_function, expression_class, x=0, y=0)` | `MaterialExpression` | Create expression in material function |
| `connect_material_expressions(from_expr, from_output, to_expr, to_input)` | `bool` | Wire output pin to input pin |
| `connect_material_property(from_expr, from_output, property)` | `bool` | Wire to material output (base color, etc.) |
| `delete_material_expression(material, expression)` | `None` | Delete single expression (auto-disconnects) |
| `delete_all_material_expressions(material)` | `None` | Delete all — call 3x for full cleanup |
| `delete_all_material_expressions_in_function(material_function)` | `None` | Same for material functions |
| `duplicate_material_expression(material, material_function, expression)` | `MaterialExpression` | Duplicate with parameters |

### Compile & Inspect

| Method | Returns | Description |
|--------|---------|-------------|
| `recompile_material(material)` | `None` | **MUST call** after any graph changes |
| `get_statistics(material)` | `MaterialStatistics` | Shader instruction/sampler counts |
| `get_num_material_expressions(material)` | `int` | Expression count (~7 internal after cleanup) |
| `get_num_material_expressions_in_function(material_function)` | `int` | Same for functions |
| `layout_material_expressions(material)` | `None` | Auto-arrange nodes in grid |
| `layout_material_function_expressions(material_function)` | `None` | Same for functions |
| `get_material_property_input_node(material, property)` | `MaterialExpression` | What's connected to a material output |
| `get_material_property_input_node_output_name(material, property)` | `str` | Output pin name of connected node |
| `get_inputs_for_material_expression(material, expression)` | `[MaterialExpression]` | What feeds into a node |
| `get_input_node_output_name_for_material_expression(expression, input_node)` | `str or None` | Output pin name of specific input |
| `get_material_expression_input_names(expression)` | `[str]` | Input pin names — use to discover gotchas |
| `get_material_expression_input_types(expression)` | `[int]` | Input pin types |
| `get_material_expression_node_position(...)` | — | Get node position |
| `get_material_selected_nodes(material)` | `Set[Object]` | Selected nodes (editor must be open) |
| `has_material_usage(material, usage)` | `bool` | Check if usage flag is enabled |
| `set_material_usage(material, usage)` | `bool or None` | Enable a usage flag (SkeletalMesh, etc.) |
| `get_nanite_override_material(material)` | `MaterialInterface` | Nanite override if set |

### Parameter Queries

| Method | Returns | Description |
|--------|---------|-------------|
| `get_scalar_parameter_names(material)` | `[Name]` | All scalar param names |
| `get_vector_parameter_names(material)` | `[Name]` | All vector param names |
| `get_texture_parameter_names(material)` | `[Name]` | All texture param names |
| `get_static_switch_parameter_names(material)` | `[Name]` | All static switch param names |
| `get_used_textures(material)` | `[Texture]` | Textures referenced in graph |
| `get_material_default_scalar_parameter_value(material, name)` | `float` | Default scalar value |
| `get_material_default_vector_parameter_value(material, name)` | `LinearColor` | Default vector value |
| `get_material_default_texture_parameter_value(material, name)` | `Texture` | Default texture value |
| `get_material_default_static_switch_parameter_value(material, name)` | `bool` | Default static switch value |
| `get_scalar_parameter_source(material, name)` | `SoftObjectPath or None` | Where param was defined |
| `get_vector_parameter_source(material, name)` | `SoftObjectPath or None` | Where param was defined |
| `get_texture_parameter_source(material, name)` | `SoftObjectPath or None` | Where param was defined |
| `get_static_switch_parameter_source(material, name)` | `SoftObjectPath or None` | Where param was defined |

### Material Instance Operations

| Method | Returns | Description |
|--------|---------|-------------|
| `set_material_instance_parent(instance, parent)` | `None` | Set parent material |
| `set_material_instance_scalar_parameter_value(instance, name, value)` | `bool` | Override scalar param |
| `set_material_instance_vector_parameter_value(instance, name, value)` | `bool` | Override vector param |
| `set_material_instance_texture_parameter_value(instance, name, value)` | `bool` | Override texture param |
| `set_material_instance_static_switch_parameter_value(instance, name, value)` | `bool` | Override static switch |
| `set_material_instance_runtime_virtual_texture_parameter_value(instance, name, value)` | `bool` | Override RVT param |
| `set_material_instance_sparse_volume_texture_parameter_value(instance, name, value)` | `bool` | Override SVT param |
| `get_material_instance_scalar_parameter_value(instance, name)` | `float` | Read scalar override |
| `get_material_instance_vector_parameter_value(instance, name)` | `LinearColor` | Read vector override |
| `get_material_instance_texture_parameter_value(instance, name)` | `Texture` | Read texture override |
| `get_material_instance_static_switch_parameter_value(instance, name)` | `bool` | Read static switch |
| `get_material_instance_runtime_virtual_texture_parameter_value(instance, name)` | `RuntimeVirtualTexture` | Read RVT |
| `get_material_instance_sparse_volume_texture_parameter_value(instance, name)` | `SparseVolumeTexture` | Read SVT |
| `clear_all_material_instance_parameters(instance)` | `None` | Remove all overrides |
| `update_material_instance(instance)` | `None` | Recompile after changes |
| `get_child_instances(parent)` | `[AssetData]` | All direct child instances |

### Material Function Operations

| Method | Returns | Description |
|--------|---------|-------------|
| `update_material_function(material_function, preview_material=None)` | `None` | Recompile function and dependent materials |

## MaterialStatistics Properties

```python
stats = mel.get_statistics(mat)
stats.num_pixel_shader_instructions   # int — most expensive PS
stats.num_vertex_shader_instructions  # int — most expensive VS
stats.num_pixel_texture_samples       # int — PS texture samples
stats.num_vertex_texture_samples      # int — VS texture samples
stats.num_virtual_texture_samples     # int — VT samples
stats.num_samplers                    # int — total samplers
stats.num_interpolator_scalars        # int — user interpolators
stats.num_uv_scalars                  # int — UV interpolators
```

## EditorAssetLibrary — Material-Related Methods

```python
eal = unreal.EditorAssetLibrary

eal.does_asset_exist('/Game/Materials/M_Name')  # bool — ALWAYS check before create
eal.load_asset('/Game/Materials/M_Name')         # Object or None
eal.save_asset('/Game/Materials/M_Name')         # bool
eal.delete_asset('/Game/Materials/M_Name')       # NEVER USE — modal dialog!
eal.rename_asset(source, destination)            # bool
eal.duplicate_asset(source, destination)         # Object
eal.find_asset_data('/Game/Materials/M_Name')    # AssetData
eal.list_assets('/Game/Materials/', recursive=True)  # [str]
```

## AssetToolsHelpers — Creating Assets

```python
ath = unreal.AssetToolsHelpers.get_asset_tools()

# Material
mat = ath.create_asset('M_Name', '/Game/Materials', unreal.Material, unreal.MaterialFactoryNew())

# Material Instance Constant
mic = ath.create_asset('MI_Name', '/Game/Materials', unreal.MaterialInstanceConstant, unreal.MaterialInstanceConstantFactoryNew())
```

**NEVER call `create_asset()` if asset already exists** — opens modal dialog, freezes editor.

## BlueprintMaterialTextureNodesBPLibrary — MIC Shortcuts

Alternative methods for Material Instance Constant editing (editor-only):

```python
bmt = unreal.BlueprintMaterialTextureNodesBPLibrary

bmt.create_mic_editor_only(material, name='MIC_')           # Create MIC from material
bmt.set_mic_scalar_param_editor_only(mic, 'ParamName', 1.0)
bmt.set_mic_vector_param_editor_only(mic, 'ParamName', [r, g, b, a])
bmt.set_mic_texture_param_editor_only(mic, 'ParamName', texture)
bmt.set_mic_blend_mode_editor_only(mic, BlendMode.BLEND_TRANSLUCENT)
bmt.set_mic_shading_model_editor_only(mic, MaterialShadingModel.MSM_UNLIT)
bmt.set_mic_two_sided_editor_only(mic, True)
```

## Material Class Properties (set via set_editor_property)

```python
# Blend Mode
mat.set_editor_property('blend_mode', unreal.BlendMode.BLEND_OPAQUE)       # default
mat.set_editor_property('blend_mode', unreal.BlendMode.BLEND_TRANSLUCENT)
mat.set_editor_property('blend_mode', unreal.BlendMode.BLEND_ADDITIVE)
mat.set_editor_property('blend_mode', unreal.BlendMode.BLEND_MODULATE)
mat.set_editor_property('blend_mode', unreal.BlendMode.BLEND_ALPHA_COMPOSITE)
mat.set_editor_property('blend_mode', unreal.BlendMode.BLEND_ALPHA_HOLDOUT)

# Shading Model
mat.set_editor_property('shading_model', unreal.MaterialShadingModel.MSM_DEFAULT_LIT)
mat.set_editor_property('shading_model', unreal.MaterialShadingModel.MSM_UNLIT)
mat.set_editor_property('shading_model', unreal.MaterialShadingModel.MSM_SUBSURFACE)
mat.set_editor_property('shading_model', unreal.MaterialShadingModel.MSM_CLEAR_COAT)

# Common properties
mat.set_editor_property('two_sided', True)              # Render both faces
mat.set_editor_property('wireframe', True)              # Wireframe render
mat.set_editor_property('is_thin_surface', True)        # Thin surface model
mat.set_editor_property('dithered_lod_transition', True) # LOD fade

# Preview mesh (for Material Editor viewport)
mat.set_editor_property('preview_mesh',
    unreal.SoftObjectPath('/Engine/EditorMeshes/EditorSphere.EditorSphere'))
# Also: EditorCube, EditorCylinder, EditorPlane
```

## MaterialProperty Enum — All Values

Connect expression outputs to material pins:

```python
MP = unreal.MaterialProperty
mel.connect_material_property(expr, output, MP.MP_BASE_COLOR)
mel.connect_material_property(expr, output, MP.MP_METALLIC)
mel.connect_material_property(expr, output, MP.MP_SPECULAR)
mel.connect_material_property(expr, output, MP.MP_ROUGHNESS)
mel.connect_material_property(expr, output, MP.MP_EMISSIVE_COLOR)  # emissive
mel.connect_material_property(expr, output, MP.MP_OPACITY)
mel.connect_material_property(expr, output, MP.MP_OPACITY_MASK)
mel.connect_material_property(expr, output, MP.MP_NORMAL)
mel.connect_material_property(expr, output, MP.MP_WORLD_POSITION_OFFSET)
mel.connect_material_property(expr, output, MP.MP_AMBIENT_OCCLUSION)
mel.connect_material_property(expr, output, MP.MP_SUBSURFACE_COLOR)
mel.connect_material_property(expr, output, MP.MP_REFRACTION)
mel.connect_material_property(expr, output, MP.MP_ANISOTROPY)

# Substrate output (replaces all legacy pins when Substrate is enabled)
mel.connect_material_property(expr, output, MP.MP_FRONT_MATERIAL)
```

## Substrate Expression Classes (UE 5.5+ with Substrate Enabled)

When Substrate is enabled, materials use `MP_FRONT_MATERIAL` instead of legacy pins. Build with these expression classes:

### BSDF Nodes (create surface layers)

```python
# Core slab — the fundamental Substrate building block
slab = mel.create_material_expression(mat, unreal.MaterialExpressionSubstrateSlabBSDF, x, y)
# Input pins: DiffuseAlbedo, F0, F90, Roughness, Normal, Anisotropy, SSSProfile, SSSMFP, Emissive, SecondRoughness, Glint, etc.
# Properties: slab.specular_profile, slab.subsurface_profile

# Other BSDF types
unreal.MaterialExpressionSubstrateUnlitBSDF        # Unlit emissive
unreal.MaterialExpressionSubstrateSimpleClearCoatBSDF  # Simplified clear coat
unreal.MaterialExpressionSubstrateHairBSDF          # Hair fiber model
unreal.MaterialExpressionSubstrateEyeBSDF           # Eye model
unreal.MaterialExpressionSubstrateSingleLayerWaterBSDF  # Water surface
```

### Composition Operators (combine layers)

```python
# Vertical layering — coat on top of base (clear coat, lacquer, etc.)
vert = mel.create_material_expression(mat, unreal.MaterialExpressionSubstrateVerticalLayering, x, y)
# Inputs: Top, Base

# Horizontal mixing — blend two slabs with mask (rust patches, decals, etc.)
hmix = mel.create_material_expression(mat, unreal.MaterialExpressionSubstrateHorizontalMixing, x, y)
# Inputs: Foreground, Background, Mix

# Weight — scale a slab's contribution
weight = mel.create_material_expression(mat, unreal.MaterialExpressionSubstrateWeight, x, y)
# Inputs: A, Weight

# Additive blend
add = mel.create_material_expression(mat, unreal.MaterialExpressionSubstrateAdd, x, y)
# Inputs: A, B
```

### Utility Nodes

```python
# Convert metalness workflow (BaseColor + Metallic) → Substrate (DiffuseAlbedo + F0)
metal_cvt = mel.create_material_expression(mat, unreal.MaterialExpressionSubstrateMetalnessToDiffuseAlbedoF0, x, y)
# Inputs: BaseColor, Metallic, Specular
# Output pins: 'DiffuseAlbedo', 'F0'

# Thin-film interference (iridescence, oil slick)
thin_film = mel.create_material_expression(mat, unreal.MaterialExpressionSubstrateThinFilm, x, y)
# Inputs: A (slab), Thickness, IOR

# Haziness to secondary roughness
haze = mel.create_material_expression(mat, unreal.MaterialExpressionSubstrateHazinessToSecondaryRoughness, x, y)
# Inputs: Haziness

# Transmittance to mean free path (SSS)
mfp = mel.create_material_expression(mat, unreal.MaterialExpressionSubstrateTransmittanceToMFP, x, y)
# Inputs: Transmittance
```

### Class Naming

`Strata*` prefix (UE 5.1–5.4) is deprecated but still works. Use `Substrate*` for new code:

```python
# DEPRECATED — works but prints warning
unreal.MaterialExpressionStrataSlabBSDF
# CURRENT — use this
unreal.MaterialExpressionSubstrateSlabBSDF
```

## Log Functions for Debugging

```python
# Via MCP tools:
ue_logs(filter="LogPython", severity="error", lines=10)      # Python exceptions
ue_logs(filter="ShaderCompiler", severity="warning", lines=10) # Shader compile errors

# Via Python in editor:
unreal.log("Info message")
unreal.log_warning("Warning message")
unreal.log_error("Error message")
```

## MaterialExpressionCustom (Custom HLSL Node)

Embed raw HLSL shader code in the material graph. Useful for complex procedural math
that would require 30+ standard nodes (e.g., triangular grids, Voronoi, advanced noise).

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `code` | `str` | HLSL code body. Must end with `return <value>;` |
| `output_type` | `CustomMaterialOutputType` | Return type of the main output |
| `description` | `str` | Display name in the material graph |
| `inputs` | `Array[CustomInput]` | Named input pins (connected to other nodes) |
| `additional_outputs` | `Array[CustomOutput]` | Extra output pins beyond the main return |
| `additional_defines` | `Array` | `#define` macros available in the code |
| `include_file_paths` | `Array` | Additional USF/USH includes |

### Output Types

```python
unreal.CustomMaterialOutputType.CMOT_FLOAT1   # scalar
unreal.CustomMaterialOutputType.CMOT_FLOAT2   # float2
unreal.CustomMaterialOutputType.CMOT_FLOAT3   # float3
unreal.CustomMaterialOutputType.CMOT_FLOAT4   # float4
unreal.CustomMaterialOutputType.CMOT_MATERIAL_ATTRIBUTES  # full material
```

### CustomInput — Adding Inputs

`CustomInput` only has `input_name` (no type property — type is inferred from what's connected):

```python
inp = unreal.CustomInput()
inp.set_editor_property("input_name", "MyInput")
```

### CustomOutput — Adding Extra Outputs

```python
out = unreal.CustomOutput()
out.set_editor_property("output_name", "EdgeMask")
out.set_editor_property("output_type", unreal.CustomMaterialOutputType.CMOT_FLOAT1)
```

### Complete Example — Custom HLSL Node with Inputs

```python
custom = mel.create_material_expression(mat, unreal.MaterialExpressionCustom, -800, 200)
custom.set_editor_property("description", "TriGrid")
custom.set_editor_property("output_type", unreal.CustomMaterialOutputType.CMOT_FLOAT1)

# Define inputs
inp_pos = unreal.CustomInput()
inp_pos.set_editor_property("input_name", "Pos")
inp_scale = unreal.CustomInput()
inp_scale.set_editor_property("input_name", "Scale")

custom.set_editor_property("inputs", [inp_pos, inp_scale])

# Set HLSL code (inputs are available as variables matching input_name)
hlsl = """float3 p = normalize(Pos);
float grid = frac(p.x * Scale) + frac(p.y * Scale);
return saturate(grid);"""
custom.set_editor_property("code", hlsl)

# Connect other nodes to the Custom node's input pins
# Pin names MUST match input_name values exactly
mel.connect_material_expressions(position_node, "", custom, "Pos")
mel.connect_material_expressions(scale_param, "", custom, "Scale")
```

### Gotchas

- Input pin names on the Custom node match the `input_name` values in the `inputs` array
- Inside the HLSL code, input variables are available by their `input_name` (e.g., `Pos`, `Scale`)
- The default Custom node has one input named `"None"` — always replace the `inputs` array
- HLSL code must end with a `return` statement matching the `output_type`
- Standard HLSL math functions work: `sin`, `cos`, `atan2`, `smoothstep`, `lerp`, `saturate`, `frac`, `floor`, `normalize`, `length`, `dot`, `cross`, `clamp`, `abs`, `pow`, `sqrt`

---

## Expression Discovery

When you need a node not listed in SKILL.md:

```python
# Search API for expression types
ue_api_search("MaterialExpression")           # all expression classes
ue_api_search("MaterialExpressionNoise")      # specific node

# Get full details for a type
ue_api_type("MaterialExpressionFresnel")      # properties, methods, inputs

# At runtime, discover input pin names:
names = mel.get_material_expression_input_names(node)
print("Input names: {}".format(names))
```

## Material Baking API

For baking material properties to textures (advanced):

```python
# MaterialBaking module types:
# - unreal.MaterialOptions — properties to bake, texture size
# - unreal.PropertyEntry — per-property settings (constant_value, custom_size)
# - unreal.MaterialMergeOptions — blend mode for merged proxy
# - unreal.AssetBakeOptions — bake configuration
```
