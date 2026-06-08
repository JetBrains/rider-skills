---
name: ue:material
description: "Use when the user asks to create materials with expression graphs (3+ expressions), build material+actor pipelines, create material instance hierarchies, iteratively tune appearance, set up texture graphs, bake materials, procedural texturing, NPR/cel-shading/toon materials, stylized outlines, UV manipulation, or animated material effects. DO NOT TRIGGER for single parameter changes, loading/inspecting materials, C++ code, rendering pipeline/CVars (use ue:graphics), or API reference lookups."
argument-hint: "[material description or task]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions (Substrate, material expressions, shading models, PSO caching, material functions), fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

## CRITICAL — Use PBR Shading Model, NOT Substrate

**Always create materials using the classic PBR shading model (Default Lit, Unlit, etc.) with standard material outputs (BaseColor, Metallic, Roughness, Normal, Emissive, Opacity).** Do NOT use Substrate (SubstrateBSDF, SubstrateUnlitBSDF, SubstrateSlab, etc.) unless the user explicitly requests it.

- Connect to standard output pins: `MP_BaseColor`, `MP_Metallic`, `MP_Roughness`, `MP_Normal`, `MP_EmissiveColor`, `MP_Opacity`
- Do NOT connect to `MP_FRONT_MATERIAL` (Substrate output)
- Do NOT create `SubstrateUnlitBSDF`, `SubstrateSingleBSDF`, or any Substrate nodes

# UE Material Agent — Specialized Subagent

Spawn a focused subagent for complex Unreal Engine material tasks that require building expression graphs, wiring parameters, creating instance hierarchies, or iterative visual tuning.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — effect type, material domain (surface/UI/post-process), shading model
2. **Create material** — create the base material asset with correct domain settings
3. **Build graph** — add expressions, parameters, textures; configure Material Instances if needed
4. **Save** — save material and all material instances to disk
5. **Compile and verify** — compile material; check Output Log for shader compile errors; test visually in editor; tune until result matches intent
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## Texture and Image Generation Integration

When a material needs textures that don't exist in the project, use the **generate-image skill** to create them first, then import and map in the material graph.

### The Texture Creation Workflow

```
1. Analyze material needs → identify required textures
2. Generate textures via generate-image skill
3. Import textures into UE project
4. Create material with TextureSample nodes pointing to imported textures
5. Wire UVs, parameters, and material properties
6. Verify shader compilation
```

### When to Generate Textures

| Scenario | Action |
|----------|--------|
| Base color, normal, roughness textures not in project | Use generate-image skill |
| Procedural patterns (hex grid, circuit lines, noise) | Generate or find existing |
| High-res PBR texture sets | Generate or import from texturing library |
| Placeholder textures for early testing | Generate quick 512x512 versions |

### Texture Generation Prompt Format

```
Use generate-image skill with these parameters:
- Prompt: "unreal engine [texture type], [description], seamless, [resolution], [format notes]"
- Width/Height: 512, 1024, or 2048 (power of 2 for UE)
- Output: Save to project assets folder

Examples:
- "seamless concrete wall texture, rough surface, 1024x1024"
- "hexagonal grid pattern, circuit board style, black on dark gray, seamless"
- "metallic scratched steel texture, PBR, normal map compatible"
```

---

## CRITICAL — Mistakes That Waste Hours

These rules were learned through painful multi-iteration debugging sessions. Violating them causes silent failures or wasted cycles.

### 1. Start Simple, Add Incrementally
- **ALWAYS** start with the simplest approach: standard UVs, basic nodes
- Verify compile + screenshot after EACH addition
- **NEVER** jump to triplanar projection, procedural math, or Custom HLSL first

### 2. Diagnose Before Rebuilding
- Before rewriting a material, **inspect the existing graph** with `get_material_property_input_node()`
- Often the fix is changing ONE connection (e.g., Multiply instead of Add for Fresnel)
- Rebuilding from scratch should be the LAST resort

### 3. Fresnel × Pattern, NOT Fresnel + Pattern
- **WRONG**: `emissive = color * (texture + fresnel)` → edges glow solid, texture invisible at rim
- **CORRECT**: `visibility = fresnel; pattern = texture * visibility; emissive = color * pattern`
- This ensures edges ONLY glow where the pattern (hex lines, grid) exists

### 4. DO NOT Triplanar-Blend Line Textures
- Triplanar projection of hex/grid textures causes lines from 3 axes to overlap → fills entire surface solid
- Standard TextureCoordinate with tiling works fine on spheres and basic shapes
- UV distortion at poles is acceptable for most viewing angles

### 5. Node API Gotchas (see knowledge/node-gotchas.md)
- `MaterialExpressionStep` and `MaterialExpressionSaturate` do NOT exist in UE 5.5–5.7
- `MaterialExpressionIf` inputs are `"A > B"`, `"A == B"`, `"A < B"` (NOT camelCase)
- `MaterialExpressionClamp` silently fails if Min/Max not connected
- `delete_all_material_expressions()` needs 3 calls to fully clear
- Use `.format()` not f-strings in JSON-embedded Python scripts

### 6. NEVER Use create_asset on Existing Assets
- `create_asset()` on an existing path opens a **modal override dialog** that freezes the editor
- **ALWAYS** check `EditorAssetLibrary.does_asset_exist()` first
- If exists: `load_asset()` + clear expressions → rebuild
- If new: `create_asset()` is safe
- **ALWAYS** validate the return value: `if mat is None: print("ERROR: ..."); return`

### 7. ALWAYS Check connect_material_expressions() Return Values
- `connect_material_expressions()` and `connect_material_property()` return `bool` — `False` means the connection silently failed
- A failed connection produces NO error in logs — the node stays disconnected, causing gray/checkerboard materials
- **Use `safe_connect` wrappers** (see `knowledge/node-gotchas.md`) that raise on failure, or at minimum check every return value
- Common causes of silent failure: wrong pin name, None node, incompatible types
- After building the graph, **ALWAYS verify** with `get_material_property_input_node()` for each expected output (see `knowledge/workflow.md` — "Post-Build Graph Integrity Check")

### 8. Always Verify Shader Compilation
- After `recompile_material()`, check `/ue:console --warnings --filter "ShaderCompiler"` for `"Failed to compile Material"`
- Log buffer retains OLD errors — filter by timestamp to distinguish stale vs new
- If material renders as gray → compilation failed silently; check logs

### 9. Always Check Logs After Script Execution
- After every script execution, check `/ue:console --errors --filter "LogPython"` for Python exceptions
- Common: `AttributeError: 'NoneType'` means `create_asset()` or `load_asset()` returned `None`
- Fix the root cause before retrying — do NOT blindly re-run the same script

## MANDATORY — Decompose Before Building

**NEVER start coding a material without decomposing it into blocks first.** This is the single most important rule for producing correct materials on the first attempt.

### The Decomposition Loop

For every material creation task, follow this exact sequence:

1. **Research** — Before writing any code, gather knowledge about the target material:
   - Search the web for "UE5 material graph [material type]" to understand the standard node setup
   - Use `dir(unreal)` filtered for MaterialExpression to discover available expression nodes
   - Use `help(unreal.MaterialExpressionFoo)` to get exact property names and input pins
   - Check `knowledge/material-recipes.md` and `knowledge/effect-patterns.md` for existing proven patterns
   - Check `knowledge/effect-decomposition.md` for the standard building blocks table — map the request to Shape → Modifier → Combiner → Output blocks
   - Check `knowledge/procedural-texturing.md` for noise, procedural patterns, and animation techniques
   - Check `knowledge/uv-techniques.md` for UV manipulation (polar, triplanar, flipbook, parallax, distortion)
   - Check `knowledge/npr-techniques.md` for stylized/toon/cel-shading/outline approaches
   - If the material involves a technique you haven't used before (subsurface, clear coat, world-aligned, etc.), **research it first**

2. **Identify Blocks** — Break the material into independent functional blocks:
   - Each block is a self-contained subgraph that produces ONE output (a color, a scalar, a mask, etc.)
   - Name each block clearly: "Base Color Block", "Roughness Block", "Edge Glow Block", "Animation Block"
   - Identify dependencies between blocks (e.g., "Fresnel Mask" feeds into both "Emissive Block" and "Opacity Block")

3. **Plan the Graph** — Before writing code, write out the block diagram:
   ```
   Block 1: Base Color → MP_BASE_COLOR
   Block 2: Metallic (constant 1.0) → MP_METALLIC
   Block 3: Roughness (ScalarParameter "Roughness", default 0.1) → MP_ROUGHNESS
   Block 4: Fresnel → feeds Block 5
   Block 5: Emissive = RimColor × Fresnel × Intensity → MP_EMISSIVE_COLOR
   ```

4. **Build Incrementally** — Implement one block at a time:
   - Create Block 1 → recompile → verify
   - Create Block 2 → recompile → verify
   - Continue until all blocks are wired
   - **NEVER** build the entire graph in one script without intermediate verification

### Block Decomposition Examples

**PBR Metal material** decomposes to:
- Block: BaseColor (Constant3Vector or VectorParameter)
- Block: Metallic (Constant or ScalarParameter)
- Block: Roughness (ScalarParameter for instance override)
- Block: Normal (optional — TextureSample or flat)

**Animated emissive shield** decomposes to:
- Block: UV Setup (TextureCoordinate with tiling)
- Block: Pattern (TextureSample — hex grid, circuit lines, etc.)
- Block: Edge Mask (Fresnel — controls edge vs center visibility)
- Block: Scan Animation (Time → Sine → remap to sweep position)
- Block: Visibility Combine (edge_mask × pattern — NOT edge_mask + pattern)
- Block: Emissive Output (color × visibility × brightness)
- Block: Opacity Output (visibility × opacity_scale)

**Texture-mapped PBR** decomposes to:
- Block: UV Tiling (TextureCoordinate)
- Block: Diffuse (TextureSampleParameter2D → BaseColor)
- Block: Normal Map (TextureSampleParameter2D, sampler_type=NORMAL → Normal)
- Block: Roughness (ScalarParameter or texture channel)
- Block: Metallic (ScalarParameter or texture channel)

### When Unsure About a Block

If you don't know the correct node setup for a block:

1. **Search internal API**: `dir(unreal)` filtered for MaterialExpression — discovers nodes you might not know exist
2. **Check node inputs**: `mel.get_material_expression_input_names(node)` — exact pin names (avoids "A > B" vs "AGreaterThanB" mistakes)
3. **Search the web**: "UE5 material [effect name] node setup" — see how artists build the graph in the visual editor
4. **Check knowledge files**: existing recipes and effect patterns cover PBR, translucent, Fresnel, animated, scanning, and shield materials
5. **Use simple alternatives**: if a complex node has gotchas (Clamp, If, Step), use basic math (Max, Min, Multiply) instead

### NEVER Skip Decomposition

Even for "simple" materials (3-4 nodes), write the block plan first. This takes 10 seconds and prevents:
- Forgetting to connect a material property (gray material)
- Using wrong blend of nodes (Add vs Multiply for masks)
- Missing the recompile step between blocks
- Building a 20-node graph that fails with an unclear shader error

---

## Texture Decomposition — Create or Update Images/Textures

**Before creating or modifying a material that uses textures, decompose the texture requirements.** This is critical for producing correct materials on the first attempt.

### The Texture Decomposition Loop

For every material that needs textures, follow this exact sequence:

1. **Identify Required Textures** — List each texture with its purpose:
   ```
   - Diffuse/Base Color: main surface color (RGB)
   - Normal Map: surface detail/geometry (RGB, sampler_type=NORMAL)
   - Roughness: surface smoothness (R channel)
   - Metallic: metalness amount (R channel)
   - Emissive Mask: glowing areas (R or A channel)
   - Opacity Mask: transparency areas (R or A channel)
   ```

2. **Check Project Assets First** — Search for existing textures:
   - `/Game/Textures/`
   - `/Game/Assets/Textures/`
   - `/Engine/EngineMaterials/`
   - Use `/ue:console --file scene-tree.py` or `/ue:console --script` to list asset directories

3. **Generate Missing Textures** — If not in project:
   - Use `generate-image` skill with proper prompts
   - Request power-of-2 resolutions (512, 1024, 2048)
   - For PBR: generate separate base color, normal, roughness
   - For patterns: specify "seamless" and style details
   - Save outputs to project texture folder

4. **Import Textures into UE** — Python pattern:
   ```python
   # Import texture from file
   task = unreal.AssetImportTask()
   task.filename = "/path/to/local/texture.png"
   task.destination_path = "/Game/Textures"
   task.destination_name = "T_Name"
   task.automated = True
   task.save = True
   ```

5. **Plan Material Graph** — Before coding:
   ```
   UV Setup (TextureCoordinate) → TextureSample → Material Property
   ```

6. **Build Material** — Implement one texture at a time:
   - Create UV coordinates → recompile → verify
   - Add first texture sample → recompile → verify
   - Add second texture sample → recompile → verify
   - Continue until complete

### Texture Decomposition Examples

**PBR Metal Material** decomposes to:
- Texture: BaseColor (generated or imported) → `MP_BASE_COLOR`
- Constant: Metallic = 1.0 → `MP_METALLIC`
- Parameter: Roughness (scalar parameter for override) → `MP_ROUGHNESS`
- Optional: Normal map texture → `MP_NORMAL`

**Emissive Shield Material** decomposes to:
- Texture: Hex grid pattern (generate "seamless hexagonal grid pattern")
- UV: TextureCoordinate with tiling
- Fresnel: Edge visibility mask
- Combine: `visibility = fresnel + scan_band; pattern = texture * visibility`
- Output: `emissive = color * pattern * brightness`

**Translucent Glow Material** decomposes to:
- Texture: Optional pattern for emissive (generate "circuit board lines")
- Color Parameter: EmissiveColor
- Scalar Parameter: EmissiveIntensity
- Scalar Parameter: Opacity
- No texture sample needed for solid colors

### When Unsure About Texture Requirements

If you don't know what textures a material needs:

1. **Research online**: "UE5 PBR material setup" or "UE5 [material type] texture requirements"
2. **Check existing materials**: `get_used_textures(mat)` on similar materials
3. **Start minimal**: Base color + constant metallic/roughness works for many cases
4. **Iteratively add**: Add normal map → verify → add roughness → verify

## When to Delegate

- **Expression graph building** — materials with 3+ expression nodes (e.g., PBR with base color + metallic + roughness + normal)
- **Material + actor pipelines** — create material, configure it, apply to mesh, verify visually
- **Material instance hierarchies** — parent material with parameters → child instances with overrides
- **Iterative appearance tuning** — create, screenshot, adjust, repeat
- **Texture-mapped materials** — wiring texture samples, UV tiling, normal maps
- **Animated materials** — Panner, Time, Sine expression setups
- **Bulk material operations** — applying materials to many actors, creating multiple variants
- **Texture generation + import** — generating textures via generate-image, importing into UE, mapping to materials

## When NOT to Delegate

- **Single parameter change** — just run `/ue:console --script` directly
- **Loading or inspecting a material** — use `/ue:console --script` with `EditorAssetLibrary.load_asset()`
- **General editor tasks** — use **ue:task** skill
- **C++ material code** — use **ue:coder** skill
- **API reference lookup** — use `dir(unreal)` / `help()` inside Python scripts via ue:console

## How to Spawn

Use the **Python agent** at `../../agents/ue:material/main.py` (relative to this skill directory). It runs as a
standalone Claude Agent SDK process with custom MCP tools and embedded material knowledge.

### Option A: Via Bash (recommended)

```bash
Bash(
    command="cd \"${CLAUDE_SKILL_DIR}/../../agents/ue:material\" && python main.py 'Create a chrome PBR material at /Game/Materials/M_Chrome with Metallic=1, Roughness=0.05 as ScalarParameter'",
    description="Run material agent"
)
```

### Option B: Via Agent tool (for parallel execution)

```python
Agent(
    subagent_type="general-purpose",
    description="Create chrome PBR material",
    prompt="Run the material agent: cd \"${CLAUDE_SKILL_DIR}/../../agents/ue:material\" && python main.py 'task description here'"
)
```

### Environment Variables

| Variable | Purpose | Default |
|----------|---------|---------|
| `AGENT_BRIDGE_PORT` | AgentBridge HTTP port | Auto-detect from `Saved/AgentBridge.port` |
| `AGENT_BRIDGE_HOST` | Editor hostname | `localhost` |
| `UE_PROJECT_DIR` | UE project root (for port file search) | Current working directory |

### Agent Architecture

```
main.py (Claude Agent SDK)
    |
ClaudeSDKClient with custom tools
    |
+----------------------------------+
| material-tools (in-process)      |  <-- Custom HTTP wrappers
|  /ue:console --script/--errors/    |
|  --warnings/--build/--file       |
|  read_knowledge                  |
+----------------------------------+
    |
AgentBridge HTTP endpoints (port from Saved/AgentBridge.port)
```

The agent embeds critical knowledge (node gotchas, workflow rules, decomposition procedures)
in its system prompt and provides detailed reference material (recipes, API docs, effect
patterns) via the `read_knowledge` tool on demand.

### Example Invocations

**Chrome PBR material:**
```bash
python main.py "Create a chrome PBR material at /Game/Materials/M_Chrome with:
- Base color: dark gray (0.02, 0.02, 0.02)
- Metallic: 1.0
- Roughness: 0.05 (exposed as ScalarParameter 'Roughness' so instances can override)
- Fresnel rim highlight connected to emissive at low intensity (0.5x)
Save the material, verify shader compilation, and report parameter names."
```

**Animated emissive material:**
```bash
python main.py "Create an animated emissive material at /Game/Materials/M_PulsingGlow with:
- Blend mode: translucent, shading model: unlit, two-sided: true
- VectorParameter 'EmissiveColor' (default: bright cyan 0, 0.8, 1.0)
- Sine(Time) driving emissive intensity between 1x and 3x
- Opacity at 0.7
Apply it to an actor named 'GlowSphere' if it exists in the level."
```

## Editor Communication

All editor communication goes through **/ue:console**. See the ue:console skill for the full transport API.

## Tips

- Keep task descriptions focused on a single material objective
- The agent has full material knowledge embedded — no need to include tool lists or workflow paths
- For complex multi-material setups, run the agent once per material
- The agent's output is printed to stdout — summarize it for the user
- Use `--quiet` flag to suppress streaming and get only the final result

## Material Workflow Paths

### Path 1: Create or load material (SAFE — no modal dialogs)
1. **Check first**: `EditorAssetLibrary.does_asset_exist('/Game/Path/Name')`
2. If exists: `load_asset()` + `delete_all_material_expressions()` (3x) to get clean slate
3. If new: `AssetToolsHelpers.get_asset_tools().create_asset(name, path, unreal.Material, unreal.MaterialFactoryNew())`
4. **Validate**: `if mat is None: print("ERROR: create/load failed"); return`
5. Build expression graph with `MaterialEditingLibrary.create_material_expression()`
6. Connect expressions: `connect_material_expressions()` and `connect_material_property()`
7. `MaterialEditingLibrary.recompile_material(mat)`
8. `EditorAssetLibrary.save_asset(path)`

**CRITICAL**: `create_asset()` on an existing path opens a modal dialog that freezes the editor. ALWAYS check `does_asset_exist()` first.

### Path 2: Create material instance
1. `AssetToolsHelpers.get_asset_tools().create_asset(name, path, unreal.MaterialInstanceConstant, unreal.MaterialInstanceConstantFactoryNew())`
2. `MaterialEditingLibrary.set_material_instance_parent(mic, parent_mat)`
3. Set parameters: `set_material_instance_scalar/vector/texture_parameter_value()`
4. `EditorAssetLibrary.save_asset(path)`

### Path 3: Apply material to actor
1. Find actor: `EditorActorSubsystem.get_all_level_actors()` + filter
2. Get mesh component: `actor.get_component_by_class(unreal.StaticMeshComponent)`
3. Load material: `EditorAssetLibrary.load_asset('/Game/Path/Mat')`
4. `mesh_comp.set_material(slot_index, material)`

### Path 4: Dynamic material instance (runtime)
1. Get mesh component from actor
2. `mesh_comp.create_dynamic_material_instance(slot, source_material)`
3. `dmi.set_scalar_parameter_value('ParamName', value)`

### Path 5: Open in Material Editor (visual preview + node graph)
1. Load material: `mat = EditorAssetLibrary.load_asset('/Game/Path/Mat')`
2. Open editor: `get_editor_subsystem(AssetEditorSubsystem).open_editor_for_assets([mat])`
3. Set preview mesh (optional): `mat.set_editor_property('preview_mesh', SoftObjectPath('/Engine/EditorMeshes/EditorSphere.EditorSphere'))`
4. Close when done: `get_editor_subsystem(AssetEditorSubsystem).close_all_editors_for_asset(mat)`

**Use this path** for visual verification during iterative tuning — open the Material Editor, make changes via `MaterialEditingLibrary`, recompile, and the preview updates live. Common preview meshes: `EditorSphere`, `EditorCube`, `EditorCylinder`, `EditorPlane` (all under `/Engine/EditorMeshes/`).

**Note:** Preview camera (zoom/orbit) is NOT exposed to Python — only the preview mesh can be set programmatically.

---

## Texture Import Workflow

### Path 6: Import texture from file
1. **Generate texture** via generate-image skill if not exists locally
2. **Download to local** project texture folder (e.g., `Content/Textures/T_Name.png`)
3. **Create import task**:
   ```python
   import unreal
   task = unreal.AssetImportTask()
   task.filename = "/full/path/to/Texture.png"
   task.destination_path = "/Game/Textures"
   task.destination_name = "T_Name"
   task.automated = True
   task.save = True

   # Set texture options (PBR format)
   factory = unreal.TextureFactory()
   factory.set_editor_property('import_unreal_material_1_2', True)
   factory.set_editor_property('create_material', True)

   unreal.AssetToolsHelpers.get_asset_tools().import_asset_tasks([task])
   ```
4. **Verify import**: Check logs for success message
5. **Load texture**: `EditorAssetLibrary.load_asset('/Game/Textures/T_Name')`
6. **Use in material**: `TextureSample.texture = loaded_texture`

## AssetEditorSubsystem — Open Material Editor

```python
aes = unreal.get_editor_subsystem(unreal.AssetEditorSubsystem)
aes.open_editor_for_assets([mat])           # opens Material Editor with preview + node graph
aes.close_all_editors_for_asset(mat)        # close when done
```

The Material Editor provides a **live 3D preview** and **full node graph** that updates as you modify the material via `MaterialEditingLibrary`. Use it for visual verification during iterative tuning.

## Key MaterialEditingLibrary Methods

Essential methods (from 56 total — use `help(unreal.MaterialEditingLibrary)` for full reference):

**Create & wire expressions:**
- `create_material_expression(material, expression_class, x, y)` → MaterialExpression
- `connect_material_expressions(from_expr, from_output, to_expr, to_input)` → bool
- `connect_material_property(from_expr, from_output, property)` → bool
- `delete_material_expression(material, expression)`
- `delete_all_material_expressions(material)`

**Compile & inspect:**
- `recompile_material(material)` — MUST call after graph changes
- `get_statistics(material)` → MaterialStatistics
- `get_num_material_expressions(material)` → int
- `layout_material_expressions(material)` — auto-arrange nodes
- `get_material_property_input_node(material, property)` → what feeds a material output
- `get_inputs_for_material_expression(material, expression)` → input nodes
- `get_material_selected_nodes(material)` → selected nodes (editor must be open)

**Parameter queries:**
- `get_scalar_parameter_names(material)` → [Name]
- `get_vector_parameter_names(material)` → [Name]
- `get_texture_parameter_names(material)` → [Name]
- `get_used_textures(material)` → [Texture]

**Material instance operations:**
- `set_material_instance_parent(instance, parent)`
- `set_material_instance_scalar_parameter_value(instance, name, value)`
- `set_material_instance_vector_parameter_value(instance, name, value)`
- `set_material_instance_texture_parameter_value(instance, name, value)`
- `get_material_instance_scalar_parameter_value(instance, name)` → float
- `get_material_instance_vector_parameter_value(instance, name)` → LinearColor
- `update_material_instance(instance)` — recompile after changes

## Common Expression Classes

Use with `create_material_expression(mat, unreal.<ClassName>, x, y)`:

**Constants:**
- `MaterialExpressionConstant` — single float (property: `r`)
- `MaterialExpressionConstant3Vector` — RGB color (property: `constant`)
- `MaterialExpressionConstant4Vector` — RGBA (property: `constant`)

**Parameters (exposed to instances):**
- `MaterialExpressionScalarParameter` — float param (properties: `parameter_name`, `default_value`)
- `MaterialExpressionVectorParameter` — color param (properties: `parameter_name`, `default_value`)
- `MaterialExpressionStaticSwitchParameter` — bool switch

**Texture:**
- `MaterialExpressionTextureSample` — sample a texture (property: `texture`)
- `MaterialExpressionTextureSampleParameter2D` — parameterized texture sample
- `MaterialExpressionTextureCoordinate` — UV coordinates (properties: `u_tiling`, `v_tiling`)
- `MaterialExpressionComponentMask` — extract R/G/B/A channels from texture
- `MaterialExpressionVectorParameter` — for texture parameter overrides

**Texture Output Pin Names:**
TextureSample outputs: `""` (default RGBA), `"RGB"`, `"R"`, `"G"`, `"B"`, `"A"`

```python
# Full RGBA
mel.connect_material_expressions(tex, "", multiply, "A")
# Just RGB (no alpha)
mel.connect_material_property(tex, "RGB", unreal.MaterialProperty.MP_BASE_COLOR)
# Single channel
mel.connect_material_expressions(tex, "R", multiply, "A")
```

**Math:**
- `MaterialExpressionMultiply` — A * B
- `MaterialExpressionAdd` — A + B
- `MaterialExpressionSubtract` — A - B
- `MaterialExpressionDivide` — A / B
- `MaterialExpressionClamp` — clamp(input, min, max)
- `MaterialExpressionLinearInterpolate` — lerp(A, B, Alpha)
- `MaterialExpressionOneMinus` — 1 - input
- `MaterialExpressionPower` — base ^ exponent
- `MaterialExpressionAppendVector` — combine components

**Effects:**
- `MaterialExpressionFresnel` — rim lighting (properties: `exponent`, `base_reflect_fraction`)
- `MaterialExpressionPanner` — UV animation (properties: `speed_x`, `speed_y`)
- `MaterialExpressionTime` — game time
- `MaterialExpressionSine` — sine wave
- `MaterialExpressionNormalize` — normalize vector

## Material Property Enum Values

Use with `connect_material_property(expr, output_name, property)`:

**Legacy pins (non-Substrate):**
- `MaterialProperty.MP_BASE_COLOR`
- `MaterialProperty.MP_METALLIC`
- `MaterialProperty.MP_SPECULAR`
- `MaterialProperty.MP_ROUGHNESS`
- `MaterialProperty.MP_EMISSION_COLOR` (emissive)
- `MaterialProperty.MP_OPACITY`
- `MaterialProperty.MP_OPACITY_MASK`
- `MaterialProperty.MP_NORMAL`
- `MaterialProperty.MP_WORLD_POSITION_OFFSET`
- `MaterialProperty.MP_AMBIENT_OCCLUSION`
- `MaterialProperty.MP_SUBSURFACE_COLOR`

**Substrate pin (replaces all of the above when Substrate is enabled):**
- `MaterialProperty.MP_FRONT_MATERIAL` — connect a SubstrateSlabBSDF or operator chain here

## Substrate Expression Classes (UE 5.5+)

When Substrate is enabled, use these instead of legacy material pins. Connect the final node to `MP_FRONT_MATERIAL`.

**BSDF nodes** (create slabs):
- `MaterialExpressionSubstrateSlabBSDF` — core principled slab (inputs: DiffuseAlbedo, F0, F90, Roughness, Normal, Anisotropy, Emissive, SecondRoughness, Glint)
- `MaterialExpressionSubstrateUnlitBSDF` — unlit emissive surface
- `MaterialExpressionSubstrateSimpleClearCoatBSDF` — simplified clear coat
- `MaterialExpressionSubstrateHairBSDF`, `SubstrateEyeBSDF`, `SubstrateSingleLayerWaterBSDF`

**Composition operators** (combine slabs):
- `MaterialExpressionSubstrateVerticalLayering` — coat over base (inputs: Top, Base)
- `MaterialExpressionSubstrateHorizontalMixing` — blend by mask (inputs: Foreground, Background, Mix)
- `MaterialExpressionSubstrateWeight` — scale contribution (inputs: A, Weight)
- `MaterialExpressionSubstrateAdd` — additive blend (inputs: A, B)

**Utility nodes**:
- `MaterialExpressionSubstrateMetalnessToDiffuseAlbedoF0` — convert metalness workflow → Substrate (inputs: BaseColor, Metallic, Specular; outputs: DiffuseAlbedo, F0)
- `MaterialExpressionSubstrateThinFilm` — thin-film iridescence (inputs: A, Thickness, IOR)
- `MaterialExpressionSubstrateTransmittanceToMFP` — convert transmittance to SSS MFP
- `MaterialExpressionSubstrateHazinessToSecondaryRoughness` — haziness to roughness

**Note**: `MaterialExpressionStrata*` (deprecated, UE 5.1–5.4) still works but use `Substrate*` for new code.

## Critical Rules

1. **NEVER create_asset on existing path** — it opens a modal override dialog that freezes the editor. ALWAYS `does_asset_exist()` first, then `load_asset()` if exists
2. **ALWAYS validate return values** — `create_asset()` and `load_asset()` can return `None`. Check before using: `if mat is None: print("ERROR"); return`
3. **ALWAYS check connection return values** — `connect_material_expressions()` and `connect_material_property()` return `bool`. A `False` means the connection silently failed and the node is disconnected. Use `safe_connect` wrappers (see `knowledge/node-gotchas.md`) or check every call. **This is the #1 cause of gray/checkerboard materials.**
4. **ALWAYS verify graph integrity after building** — call `get_material_property_input_node()` for each expected output pin. If any returns `None`, the graph is broken. See `verify_material_graph()` in `knowledge/workflow.md`
5. **ALWAYS recompile** — call `MaterialEditingLibrary.recompile_material(mat)` after any expression graph changes
6. **ALWAYS save** — call `EditorAssetLibrary.save_asset('/Game/...')` after creating or modifying materials
7. **NEVER call delete_asset()** — it opens a modal dialog that freezes the editor
8. **Check shader logs** — after recompile, use `/ue:console --warnings --filter "ShaderCompiler"` to detect compile failures
9. **Check Python logs** — after script execution, use `/ue:console --errors --filter "LogPython"` to catch exceptions
10. **Use set_editor_property()** — never use direct attribute access on UE objects
11. **Prefer standard expressions over Custom HLSL** — Custom nodes may fail in some shader permutations
12. **Emissive brightness** — keep multiplier at 2-5x max; higher values wash out in screenshots due to bloom
13. **Translucent setup** — set blend_mode, shading_model, AND two_sided together
14. **Texture sampler type** — set `sampler_type = unreal.MaterialSamplerType.SAMPLERTYPE_NORMAL` for normal maps

## Verification Steps (MANDATORY — DO NOT SKIP)

After completing material work, the subagent MUST run ALL of these steps. **Skipping verification is the #1 cause of broken materials.**

### Step 1: Verify all connections succeeded during build
Every `connect_material_expressions()` and `connect_material_property()` call must return `True`. Use `safe_connect` wrappers (see `knowledge/node-gotchas.md`). If any call returns `False`, fix it immediately before proceeding.

### Step 2: Run full inter-node connection validation (CRITICAL)
After building the graph and before saving, execute a **full connection trace** that walks every node in the graph and verifies all expected inputs are wired. This catches disconnected intermediate nodes that `verify_material_graph()` alone misses (it only checks final material property outputs).

```python
def validate_all_connections(mat, expected_outputs):
    """
    Trace the full node graph from each material property output, walking
    every intermediate node recursively. Verifies:
    1. All expected outputs are connected
    2. All non-leaf intermediate nodes have inputs wired
    3. Total reachable nodes matches expected count (detects orphans)

    Args:
        mat: The material to validate
        expected_outputs: dict {MaterialProperty: "description"}

    NOTE: mat.expressions is protected in UE 5.5-5.7. We cannot list
    all nodes directly. Instead we trace from outputs and compare the
    count of reachable nodes against get_num_material_expressions().
    """
    mel = unreal.MaterialEditingLibrary
    errors = []
    visited = set()

    leaf_types = {
        'MaterialExpressionConstant', 'MaterialExpressionConstant2Vector',
        'MaterialExpressionConstant3Vector', 'MaterialExpressionConstant4Vector',
        'MaterialExpressionScalarParameter', 'MaterialExpressionVectorParameter',
        'MaterialExpressionStaticSwitchParameter', 'MaterialExpressionStaticBoolParameter',
        'MaterialExpressionTime', 'MaterialExpressionTextureCoordinate',
        'MaterialExpressionWorldPosition', 'MaterialExpressionObjectPositionWS',
        'MaterialExpressionActorPositionWS', 'MaterialExpressionCameraPositionWS',
        'MaterialExpressionPixelNormalWS', 'MaterialExpressionVertexNormalWS',
        'MaterialExpressionObjectRadius', 'MaterialExpressionScreenPosition',
        'MaterialExpressionViewSize', 'MaterialExpressionTwoSidedSign',
        'MaterialExpressionFresnel',
    }

    def trace_node(node, depth=0):
        if node is None:
            return
        node_id = id(node)
        if node_id in visited:
            return
        visited.add(node_id)
        name = node.get_class().get_name()
        inputs = mel.get_inputs_for_material_expression(mat, node)
        prefix = "  " * depth
        print("{}[OK] {} — {} input(s)".format(prefix, name, len(inputs)))

        if name not in leaf_types and len(inputs) == 0:
            errors.append(
                "NODE '{}' has ZERO connected inputs — disconnected intermediate node"
                .format(name)
            )
        for inp in inputs:
            trace_node(inp, depth + 1)

    # Trace from each expected material output
    for prop, desc in expected_outputs.items():
        node = mel.get_material_property_input_node(mat, prop)
        print("=== {} ===".format(desc))
        if node is None:
            errors.append("DISCONNECTED OUTPUT: {} has no input node".format(desc))
        else:
            trace_node(node, 1)

    # Compare reachable vs total (detect orphan nodes)
    total = mel.get_num_material_expressions(mat)
    reachable = len(visited)
    # ~7 internal nodes are normal (UE built-in expressions)
    orphan_estimate = total - reachable - 7
    if orphan_estimate > 0:
        errors.append(
            "POSSIBLE ORPHANS: {} total expressions, {} reachable from outputs, "
            "~7 internal — ~{} may be orphaned/disconnected"
            .format(total, reachable, orphan_estimate)
        )
        print("WARNING: {} possible orphan node(s)".format(orphan_estimate))

    if errors:
        for e in errors:
            print("VALIDATION ERROR: {}".format(e))
        raise RuntimeError(
            "Graph validation failed with {} error(s) — fix before saving"
            .format(len(errors))
        )

    print("\nAll connections validated: {} nodes reachable, {} outputs wired"
          .format(reachable, len(expected_outputs)))
    return True

# Usage:
MP = unreal.MaterialProperty
validate_all_connections(mat, {
    MP.MP_BASE_COLOR: "Base Color",
    MP.MP_EMISSIVE_COLOR: "Emissive",
    MP.MP_ROUGHNESS: "Roughness",
    MP.MP_METALLIC: "Metallic",
})
```

**When a validation error is found:** Do NOT save the material. Instead:
1. Identify the disconnected node from the error message
2. Reconnect it using `connect_material_expressions()` with correct pin names
3. Re-run `validate_all_connections()` until it passes
4. Only then proceed to recompile and save
5. If orphan nodes are detected, either wire them into the graph or delete them with `delete_material_expression()`

### Step 3: Run post-build graph integrity check (material outputs)
Call `get_material_property_input_node()` for each expected material output (BaseColor, Emissive, Roughness, etc.) and confirm none return `None`. See `knowledge/workflow.md` for the `verify_material_graph()` function.

### Step 4: Check shader compilation
`/ue:console --warnings --filter "ShaderCompiler"` — look for `"Failed to compile Material"` entries.

### Step 5: List parameters to confirm setup
`get_scalar_parameter_names()`, `get_vector_parameter_names()` — verify all expected parameters exist.

### Step 6: Visual verification
Open in Material Editor: `AssetEditorSubsystem.open_editor_for_assets([mat])`. Take a screenshot if applied to a visible actor: `/ue:console --file screenshot.py`.

### Step 7: Report structured summary
What was created, parameter names, connection validation results, any shader warnings.

**Camera positioning (CRITICAL — common mistake):**
- `unreal.Rotator(a, b, c)` constructor order is `(roll, pitch, yaw)` — NOT `(pitch, yaw, roll)`!
- **ALWAYS use `MathLibrary.find_look_at_rotation(cam_pos, target_pos)`** to aim camera
- Or set properties explicitly: `rot = unreal.Rotator(); rot.pitch = -15; rot.yaw = 90`

**Output format:**
Return a structured summary:
- What was done (steps taken)
- Assets created/modified (full paths)
- Parameters exposed (names, types, default values)
- Shader compilation status
- Any errors encountered and how they were resolved
```

## CRITICAL — Niagara Is Out of Scope

If the task involves particle effects (sparks, smoke, fire, explosions), do NOT try to configure Niagara emitter internals from Python. The material-agent skill is for **material expression graphs only**.

For particle effects, the parent agent should:
1. Search for existing project effects in `/Game/Effects/`, `/Game/FX/`, `/Game/VFX/` and reuse them
2. Set user parameter overrides on `NiagaraComponent` (`set_float_parameter`, `set_vector_parameter`)
3. Tell the user to customize Niagara behavior in the Niagara Editor UI

**NEVER instantiate `NiagaraPythonEmitter`** — causes SIGSEGV crash. See `ue:editor/knowledge/niagara.md` for details.

---

see: knowledge/python-api.md — Python API reference: MaterialEditingLibrary (56 methods), EditorAssetLibrary, AssetToolsHelpers, BlueprintMaterialTextureNodes, Material properties, enums, log functions
see: knowledge/material-recipes.md — Copy-paste Python recipes: PBR, parameterized, instances, texture-mapped, animated, Fresnel, translucent, dynamic materials
see: knowledge/node-gotchas.md — Non-existent nodes, correct input names, Clamp/If/Step pitfalls, delete cleanup, f-string issues
see: knowledge/effect-patterns.md — Shield effect, scanning band, sine pulse, Fresnel edge detection — proven patterns with anti-patterns
see: knowledge/workflow.md — Step-by-step workflow, clean rebuild procedure, shader error checking, visual verification, iterative tuning
see: knowledge/texture-workflow.md — Texture generation via generate-image skill, import into UE, PBR channel setup, texture decomposition examples
see: knowledge/substrate-automotive.md — Automotive Substrate material patterns: 3-tier hierarchy, packed vector params, metal/paint/leather/glass/fabric/carbon recipes, 63 MTP templates reference
