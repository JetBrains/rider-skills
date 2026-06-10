# Material Node Gotchas — UE 5.5–5.7

Hard-won knowledge about MaterialExpression nodes. Violating any of these causes silent shader compile failures or wasted iterations.

## create_asset() Modal Dialog Freeze (MOST COMMON BUG)

`create_asset()` on an existing path opens a modal "Override asset?" dialog that **blocks the game thread** and requires manual click. The script hangs, `create_asset()` returns `None`, and all subsequent code crashes with `AttributeError: 'NoneType'`.

```python
# WRONG — if M_HexShield already exists, editor FREEZES with modal dialog
mat = ath.create_asset('M_HexShield', '/Game/Materials', unreal.Material, unreal.MaterialFactoryNew())
mat.set_editor_property(...)  # AttributeError: 'NoneType' has no attribute 'set_editor_property'

# CORRECT — always check first
mat_path = '/Game/Materials/M_HexShield'
if eal.does_asset_exist(mat_path):
    mat = eal.load_asset(mat_path)
    for i in range(3):
        mel.delete_all_material_expressions(mat)
else:
    mat = ath.create_asset('M_HexShield', '/Game/Materials', unreal.Material, unreal.MaterialFactoryNew())
if mat is None:
    print("ERROR: Material is None")
```

**Also applies to**: `MaterialInstanceConstant`, textures, and any other asset type created via `create_asset()`.

## Non-Existent Nodes (DO NOT USE)

These expression classes do NOT exist in UE 5.5–5.7 Python API. Using them causes `AttributeError` or creates broken nodes:

| Do NOT use | Use instead |
|---|---|
| `MaterialExpressionStep` | `MaterialExpressionIf` (see below) |
| `MaterialExpressionSaturate` | `Multiply` by 1 + `Max` with 0 (manual clamp) |
| `MaterialExpressionFrac` | Check existence before use |

## MaterialExpressionIf — Correct Input Names

The If node's input names contain **spaces and symbols**, not camelCase:

```python
# WRONG — causes "Missing If AGreaterThanB input" shader error
mel.connect_material_expressions(val, "", if_node, "AGreaterThanB")

# CORRECT — actual input names
mel.connect_material_expressions(hex_pattern, "", if_node, "A")
mel.connect_material_expressions(threshold, "", if_node, "B")
mel.connect_material_expressions(one_val, "", if_node, "A > B")   # when A > B
mel.connect_material_expressions(one_val, "", if_node, "A == B")  # when A == B
mel.connect_material_expressions(zero_val, "", if_node, "A < B")  # when A < B
```

**Discovery method**: Always check input names for unfamiliar nodes:
```python
names = mel.get_material_expression_input_names(node)
print("Input names: {}".format(names))
```

## MaterialExpressionClamp — ALL Inputs Required

Clamp silently fails if Min or Max inputs are not connected. This causes:
`(Node Clamp) Missing Clamp input` shader compile error.

```python
# WRONG — creates node but shader fails
clamp = mel.create_material_expression(mat, unreal.MaterialExpressionClamp, 0, 0)
mel.connect_material_expressions(source, "", clamp, "")
# Missing Min and Max connections!

# CORRECT — connect all three inputs
mel.connect_material_expressions(source, "", clamp, "")
mel.connect_material_expressions(min_val, "", clamp, "Min")
mel.connect_material_expressions(max_val, "", clamp, "Max")
```

**Alternative**: Avoid Clamp entirely — use manual math:
```python
# Clamp to [0, 1] without Clamp node:
max_node = mel.create_material_expression(mat, unreal.MaterialExpressionMax, x, y)
zero = mel.create_material_expression(mat, unreal.MaterialExpressionConstant, x-200, y)
zero.set_editor_property("r", 0.0)
mel.connect_material_expressions(source, "", max_node, "A")
mel.connect_material_expressions(zero, "", max_node, "B")
# Then Min with 1.0 if needed
```

## delete_all_material_expressions — Incomplete Cleanup

A single call does NOT remove all expressions. Internal/built-in nodes persist.

```python
# WRONG — leaves ~7 residual expressions
mel.delete_all_material_expressions(mat)

# CORRECT — call multiple times and verify
for i in range(3):
    mel.delete_all_material_expressions(mat)
n = mel.get_num_material_expressions(mat)
print("Remaining: {}".format(n))  # ~7 internal nodes is normal
```

## Emissive Property Name

The emissive output property is `MP_EMISSIVE_COLOR` (some docs say `MP_EMISSION_COLOR` — both may work but use `MP_EMISSIVE_COLOR` for consistency):

```python
mel.connect_material_property(node, "", unreal.MaterialProperty.MP_EMISSIVE_COLOR)
```

## F-Strings in JSON-Embedded Scripts

When sending Python via AgentBridge JSON, f-strings with nested quotes break:

```python
# WRONG — SyntaxError when embedded in JSON "script" field
print(f"Value: {obj.get_editor_property("name")}")

# CORRECT — use .format()
print("Value: {}".format(obj.get_editor_property("name")))
```

## Texture Output Pin Names

TextureSample outputs: `""` (default RGBA), `"RGB"`, `"R"`, `"G"`, `"B"`, `"A"`

```python
# Full RGBA
mel.connect_material_expressions(tex, "", multiply, "A")
# Just RGB (no alpha)
mel.connect_material_property(tex, "RGB", unreal.MaterialProperty.MP_BASE_COLOR)
# Single channel
mel.connect_material_expressions(tex, "R", multiply, "A")
```

## WorldPosition Node

`MaterialExpressionWorldPosition` — NOT `MaterialExpressionAbsoluteWorldPosition`. Use this for world-space position in material graph.

## Substrate-Specific Gotchas

### MP_FRONT_MATERIAL Is the Only Output

When Substrate is enabled, legacy pins (MP_BASE_COLOR, MP_METALLIC, etc.) do NOT work. You must connect a SubstrateSlabBSDF or operator chain to `MP_FRONT_MATERIAL`:

```python
# WRONG when Substrate is enabled — silently ignored
mel.connect_material_property(color, '', unreal.MaterialProperty.MP_BASE_COLOR)

# CORRECT — connect slab/operator to Front Material
mel.connect_material_property(slab, '', unreal.MaterialProperty.MP_FRONT_MATERIAL)
```

### SubstrateMetalnessToDiffuseAlbedoF0 Output Pins

This node has named output pins — you must specify them:

```python
# WRONG — connects default output (undefined)
mel.connect_material_expressions(metal_cvt, '', slab, 'DiffuseAlbedo')

# CORRECT — specify output pin name
mel.connect_material_expressions(metal_cvt, 'DiffuseAlbedo', slab, 'DiffuseAlbedo')
mel.connect_material_expressions(metal_cvt, 'F0', slab, 'F0')
```

### Strata vs Substrate Naming

Both `MaterialExpressionStrata*` and `MaterialExpressionSubstrate*` exist. The `Strata*` variants are deprecated aliases. Use `Substrate*` for new code:

```python
# DEPRECATED (still works, prints warning)
unreal.MaterialExpressionStrataSlabBSDF
# CURRENT
unreal.MaterialExpressionSubstrateSlabBSDF
```

### Material Functions from SubstrateMaterials Showcase

The 280+ Fab automotive materials use a library of `MFW_*` / `MF_*` material functions (e.g., `MFW_Coat`, `MFW_Metallic_Glint`, `MFW_Imperfections`). These are NOT built-in to UE — they're project assets at `/Game/SubstrateMaterials/Materials/00_MaterialFunctions/`. You can reference them with `MaterialExpressionMaterialFunctionCall` if they exist in the project.

## connect_material_expressions() Silently Fails

`connect_material_expressions()` and `connect_material_property()` return `bool` — `True` if the connection was made, `False` if it failed. **A failed connection produces NO error log** — the node simply stays disconnected, causing a gray/checkerboard material at runtime.

Common causes of silent `False`:
- Wrong output pin name (e.g., `""` vs `"RGB"` vs `"R"`)
- Wrong input pin name (case-sensitive, sometimes has spaces — use `get_material_expression_input_names()`)
- Connecting incompatible types (e.g., scalar to a vector-only input)
- Node was not created successfully (returned `None` from `create_material_expression`)

```python
# WRONG — ignores return value, broken connections go undetected
mel.connect_material_expressions(time_node, "", sine_node, "")
mel.connect_material_expressions(sine_node, "", multiply_node, "A")
mel.connect_material_property(multiply_node, "", unreal.MaterialProperty.MP_EMISSIVE_COLOR)

# CORRECT — check every connection
def safe_connect(from_expr, from_out, to_expr, to_in):
    """Connect expressions with validation. Raises on failure."""
    result = mel.connect_material_expressions(from_expr, from_out, to_expr, to_in)
    if not result:
        from_name = from_expr.get_class().get_name() if from_expr else "None"
        to_name = to_expr.get_class().get_name() if to_expr else "None"
        raise RuntimeError(
            "Connection FAILED: {}.{} -> {}.{}".format(from_name, from_out, to_name, to_in)
        )
    return result

def safe_connect_property(from_expr, from_out, prop):
    """Connect to material property with validation. Raises on failure."""
    result = mel.connect_material_property(from_expr, from_out, prop)
    if not result:
        from_name = from_expr.get_class().get_name() if from_expr else "None"
        raise RuntimeError(
            "Property connection FAILED: {}.{} -> {}".format(from_name, from_out, prop)
        )
    return result
```

**ALWAYS use `safe_connect` / `safe_connect_property` wrappers** (or at minimum check the return value) for every connection call. This is the single most common cause of "material looks gray/checkerboard but script reported success."

---

## Shader Error Detection

After `recompile_material()`, errors go into the log buffer but stale errors persist. Always filter by timestamp:

```python
# Via AgentBridge logs endpoint:
# GET /agent/logs?lines=5&severity=warning
# Then filter entries where message contains "M_YourMaterial" AND timestamp > recompile time

# In Python, check immediately after recompile — new errors appear within ~1 second
```
