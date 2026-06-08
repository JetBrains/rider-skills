# Material Effect Patterns

Proven patterns for common visual effects. Each pattern was debugged through multiple iterations — use as-is.

## Anti-Pattern: Triplanar Projection for Line Textures

**DO NOT use triplanar projection for textures with line/grid patterns** (hex grids, wireframes, etc.).

**Why it fails**: When blending 3 axis-aligned projections of a line texture, the white lines from each axis overlap and fill each other's gaps, making the entire surface appear solid/opaque. This happens regardless of blend sharpness (even power 8).

**Use instead**: Standard `TextureCoordinate` with appropriate tiling. UV distortion at sphere poles is acceptable for most viewing angles.

---

## Pattern 1: Shield Effect (Edge Glow + Transparent Center + Scanning)

The classic energy shield: hex pattern visible, bright glowing edges, see-through center, animated scan line.

**Key insight**: Fresnel drives opacity (edges opaque, center transparent). Pattern texture is MULTIPLIED by Fresnel — NOT added independently.

```python
import unreal

mel = unreal.MaterialEditingLibrary
mat = ...  # your material

mat.set_editor_property("blend_mode", unreal.BlendMode.BLEND_TRANSLUCENT)
mat.set_editor_property("shading_model", unreal.MaterialShadingModel.MSM_UNLIT)
mat.set_editor_property("two_sided", True)

# --- HEX TEXTURE ---
uv = mel.create_material_expression(mat, unreal.MaterialExpressionTextureCoordinate, -1200, 0)
uv.set_editor_property("u_tiling", 5.0)
uv.set_editor_property("v_tiling", 5.0)
tex = mel.create_material_expression(mat, unreal.MaterialExpressionTextureSample, -1000, 0)
tex.set_editor_property("texture", hex_texture)
mel.connect_material_expressions(uv, "", tex, "UVs")

# --- FRESNEL (controls edge vs center visibility) ---
fresnel = mel.create_material_expression(mat, unreal.MaterialExpressionFresnel, -1000, 300)
fresnel.set_editor_property("exponent", 2.0)
fresnel.set_editor_property("base_reflect_fraction", 0.02)

# --- SCANNING BAND ---
# World position Z → normalize to [0,1] → compare to animated scan position
world_pos = mel.create_material_expression(mat, unreal.MaterialExpressionWorldPosition, -1200, 700)
obj_pos = mel.create_material_expression(mat, unreal.MaterialExpressionObjectPositionWS, -1200, 600)
# local_z = WorldPos.z - ObjectPos.z, normalized by sphere diameter
# scan_pos = sin(time * speed) * 0.5 + 0.5  → sweeps [0,1]
# scan_band = max(0, 1 - abs(local_z_norm - scan_pos) / band_width)
# (see full implementation in shield recipe)

# --- COMBINE ---
# visibility = fresnel + scan_band
# pattern = hex_texture * visibility + hex_texture * 0.05  (faint base)
# emissive = color * pattern * brightness
# opacity = pattern * 0.85
```

### Critical: Fresnel × Pattern, NOT Fresnel + Pattern

```python
# WRONG — Fresnel glows independently, edges are solid without pattern
emissive = color * (hex + fresnel)  # fresnel overwhelms at edges

# CORRECT — Fresnel only amplifies where pattern exists
visibility = fresnel + scan_band
pattern = hex * visibility
emissive = color * pattern  # edges show hex lines glowing brighter
```

---

## Pattern 2: Sine Pulse Animation

Animate material intensity with a smooth pulse.

```python
# Time → speed multiply → Sine → Abs → remap [0,1] to [low, high]
time_n = mel.create_material_expression(mat, unreal.MaterialExpressionTime, -400, -400)
speed = mel.create_material_expression(mat, unreal.MaterialExpressionConstant, -400, -330)
speed.set_editor_property("r", 1.5)  # pulses per second

t_mul = mel.create_material_expression(mat, unreal.MaterialExpressionMultiply, -250, -400)
mel.connect_material_expressions(time_n, "", t_mul, "A")
mel.connect_material_expressions(speed, "", t_mul, "B")

sin_n = mel.create_material_expression(mat, unreal.MaterialExpressionSine, -100, -400)
mel.connect_material_expressions(t_mul, "", sin_n, "")

abs_n = mel.create_material_expression(mat, unreal.MaterialExpressionAbs, 50, -400)
mel.connect_material_expressions(sin_n, "", abs_n, "")

# Remap [0,1] → [0.5, 1.0]:  abs * 0.5 + 0.5
half = mel.create_material_expression(mat, unreal.MaterialExpressionConstant, 50, -330)
half.set_editor_property("r", 0.5)
scaled = mel.create_material_expression(mat, unreal.MaterialExpressionMultiply, 200, -400)
mel.connect_material_expressions(abs_n, "", scaled, "A")
mel.connect_material_expressions(half, "", scaled, "B")
pulse = mel.create_material_expression(mat, unreal.MaterialExpressionAdd, 350, -400)
mel.connect_material_expressions(scaled, "", pulse, "A")
mel.connect_material_expressions(half, "", pulse, "B")
# pulse output: smooth [0.5, 1.0] oscillation
```

---

## Pattern 3: Scanning Band

A horizontal stripe that sweeps up/down across a surface.

```python
# Get local height on surface
world_pos = mel.create_material_expression(mat, unreal.MaterialExpressionWorldPosition, -1200, 600)
obj_pos = mel.create_material_expression(mat, unreal.MaterialExpressionObjectPositionWS, -1200, 700)
local_pos = mel.create_material_expression(mat, unreal.MaterialExpressionSubtract, -1000, 650)
mel.connect_material_expressions(world_pos, "", local_pos, "A")
mel.connect_material_expressions(obj_pos, "", local_pos, "B")

# Extract Z and normalize to [0,1] (divide by object height)
z_mask = mel.create_material_expression(mat, unreal.MaterialExpressionComponentMask, -800, 650)
z_mask.set_editor_property("r", False)
z_mask.set_editor_property("g", False)
z_mask.set_editor_property("b", True)
mel.connect_material_expressions(local_pos, "", z_mask, "")

# Normalize by diameter (e.g. 500 for scale-5 sphere)
diameter = mel.create_material_expression(mat, unreal.MaterialExpressionConstant, -800, 730)
diameter.set_editor_property("r", 500.0)  # adjust to mesh size
z_norm = mel.create_material_expression(mat, unreal.MaterialExpressionDivide, -600, 650)
mel.connect_material_expressions(z_mask, "", z_norm, "A")
mel.connect_material_expressions(diameter, "", z_norm, "B")
offset = mel.create_material_expression(mat, unreal.MaterialExpressionConstant, -600, 730)
offset.set_editor_property("r", 0.5)
z_01 = mel.create_material_expression(mat, unreal.MaterialExpressionAdd, -450, 650)
mel.connect_material_expressions(z_norm, "", z_01, "A")
mel.connect_material_expressions(offset, "", z_01, "B")

# Animated scan position (reuse sine pulse from Pattern 2, speed ~0.8)
# scan_pos = sin(time * 0.8) * 0.5 + 0.5

# Distance from scan line
scan_diff = mel.create_material_expression(mat, unreal.MaterialExpressionSubtract, -150, 700)
mel.connect_material_expressions(z_01, "", scan_diff, "A")
mel.connect_material_expressions(scan_pos, "", scan_diff, "B")
scan_abs = mel.create_material_expression(mat, unreal.MaterialExpressionAbs, 0, 700)
mel.connect_material_expressions(scan_diff, "", scan_abs, "")

# Thin band: 1 - (distance / width), clamped to [0,1]
band_width = mel.create_material_expression(mat, unreal.MaterialExpressionConstant, 0, 780)
band_width.set_editor_property("r", 0.08)  # thinner = sharper line
ratio = mel.create_material_expression(mat, unreal.MaterialExpressionDivide, 150, 700)
mel.connect_material_expressions(scan_abs, "", ratio, "A")
mel.connect_material_expressions(band_width, "", ratio, "B")
inv = mel.create_material_expression(mat, unreal.MaterialExpressionOneMinus, 300, 700)
mel.connect_material_expressions(ratio, "", inv, "")
zero = mel.create_material_expression(mat, unreal.MaterialExpressionConstant, 300, 780)
zero.set_editor_property("r", 0.0)
scan_band = mel.create_material_expression(mat, unreal.MaterialExpressionMax, 450, 700)
mel.connect_material_expressions(inv, "", scan_band, "A")
mel.connect_material_expressions(zero, "", scan_band, "B")
# scan_band: 1.0 at scan line, fades to 0 over band_width
```

---

## Pattern 4: Fresnel Edge Detection

For any effect that should be stronger at edges (shields, outlines, hologram):

```python
fresnel = mel.create_material_expression(mat, unreal.MaterialExpressionFresnel, x, y)
fresnel.set_editor_property("exponent", 2.0)  # 1=wide, 5=narrow edge
fresnel.set_editor_property("base_reflect_fraction", 0.02)  # 0=no center, 0.5=half visible at center
```

**Exponent guide**:
- 1.0 — very wide, most of surface has some effect
- 2.0 — moderate, good for shields
- 3.5 — narrow rim, good for subtle outlines
- 5.0+ — razor-thin edge line

**base_reflect_fraction**: amount visible at dead center (0 = fully transparent center)

---

## Niagara Particle Effects — Limitations

**Python cannot configure Niagara emitter internals** (spawn rate, velocity, lifetime, forces, renderers). The API only supports:
- Creating/loading Niagara system assets
- Spawning `NiagaraActor` and setting component transform
- Setting user parameter overrides (`set_float_parameter`, `set_vector_parameter`)

**For particle effects, always reuse existing project assets.** Search `/Game/Effects/`, `/Game/FX/`, `/Game/VFX/` for impact sparks, hit effects, etc. Duplicate the closest match, place it, and adjust color/position via Python. For behavior changes (spark shape, gravity, lifetime), tell the user to open the Niagara Editor UI.

See `ue-editor/knowledge/niagara.md` for full API limitations, crash triggers, and code examples.
