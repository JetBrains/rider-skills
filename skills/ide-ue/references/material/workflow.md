# Material Workflow — Step-by-Step

## Pre-Flight Checklist

Before ANY material work:
1. Verify editor running: `ue_health` or `GET /agent/health` → `{"success": true}`
2. **Check if material already exists**: `EditorAssetLibrary.does_asset_exist('/Game/Path/Name')`
3. If exists: `load_asset()` + inspect graph — do NOT call `create_asset()` (opens modal dialog!)
4. If modifying existing material: **read the existing graph first** before rebuilding
5. If creating visual effects: **ask for or analyze reference image** before coding

## The Golden Rule: Start Simple

```
Simple UVs → verify → add Fresnel → verify → add animation → verify → add scanning → verify
```

**NEVER** jump to complex techniques (triplanar, procedural math, Custom HLSL) before confirming the simple version works. Most UV-based approaches work fine on standard meshes.

## Execution: AgentBridge HTTP

All endpoints under `/agent/` prefix. Port from `Saved/AgentBridge.port`.

```bash
PORT=$(cat Saved/AgentBridge.port)

# Execute Python
curl -s -X POST "http://localhost:${PORT}/agent/execute" \
  -H "Content-Type: application/json" \
  -d "$(python3 -c "import json; print(json.dumps({'script': open('/tmp/script.py').read()}))")"

# Check logs for shader errors
curl -s "http://localhost:${PORT}/agent/logs?lines=5&severity=warning"
```

**Script delivery**: For multi-line scripts, write to `/tmp/script.py` and JSON-encode the file contents. Never try to embed complex Python directly in JSON strings (quote escaping issues).

## Creating or Loading a Material (SAFE — No Modal Dialogs)

**CRITICAL**: `create_asset()` on an existing path opens a modal "override" dialog that freezes the editor and requires manual click. ALWAYS check first:

```python
import unreal
mel = unreal.MaterialEditingLibrary
eal = unreal.EditorAssetLibrary
ath = unreal.AssetToolsHelpers.get_asset_tools()

mat_path = "/Game/Materials/M_Name"
if eal.does_asset_exist(mat_path):
    mat = eal.load_asset(mat_path)
    # Clear expressions for a fresh start
    for i in range(3):
        mel.delete_all_material_expressions(mat)
    print("Loaded existing material")
else:
    mat = ath.create_asset("M_Name", "/Game/Materials", unreal.Material, unreal.MaterialFactoryNew())
    print("Created new material")

# ALWAYS validate — None means creation/load failed
if mat is None:
    print("ERROR: Material is None — check if path is valid and editor is running")
    # DO NOT proceed — any .set_editor_property() call will crash with AttributeError
```

## Modifying Existing Material

```python
import unreal
mel = unreal.MaterialEditingLibrary

# 1. Load and inspect BEFORE changing anything
mat = unreal.EditorAssetLibrary.load_asset("/Game/Materials/M_Name")
n = mel.get_num_material_expressions(mat)
print("Expressions: {}".format(n))

# 2. Check what's connected to outputs
em_node = mel.get_material_property_input_node(mat, unreal.MaterialProperty.MP_EMISSIVE_COLOR)
op_node = mel.get_material_property_input_node(mat, unreal.MaterialProperty.MP_OPACITY)
print("Emissive: {}".format(em_node.get_class().get_name() if em_node else "NONE"))
print("Opacity: {}".format(op_node.get_class().get_name() if op_node else "NONE"))

# 3. Trace inputs to understand the graph
if em_node:
    inputs = mel.get_inputs_for_material_expression(em_node)
    for inp in inputs:
        print("  Input: {}".format(inp.get_class().get_name() if inp else "None"))
```

## Clean Rebuild Procedure

When the graph is too broken to fix incrementally:

```python
# 1. Clear everything (call 3x to handle internal nodes)
for i in range(3):
    mel.delete_all_material_expressions(mat)

# 2. Verify cleanup
n = mel.get_num_material_expressions(mat)
print("After cleanup: {} (7 internal nodes is normal)".format(n))

# 3. Set material properties
mat.set_editor_property("blend_mode", unreal.BlendMode.BLEND_TRANSLUCENT)
mat.set_editor_property("shading_model", unreal.MaterialShadingModel.MSM_UNLIT)
mat.set_editor_property("two_sided", True)

# 4. Build graph...
# 5. Layout, compile, save
mel.layout_material_expressions(mat)
mel.recompile_material(mat)
unreal.EditorAssetLibrary.save_asset("/Game/Materials/M_Name")
```

## Log Checking — ALWAYS Do This

### After every ue_execute_python: check Python logs

```
ue_get_logs(filter="LogPython", severity="error", lines=10)
```

Common Python errors and what they mean:

| Log Pattern | Cause | Fix |
|---|---|---|
| `AttributeError: 'NoneType' object has no attribute 'set_editor_property'` | `create_asset()` or `load_asset()` returned `None` | Check `does_asset_exist()` first; validate return value |
| `Created material: None` | Asset already exists → `create_asset()` failed silently or showed modal | Use `does_asset_exist()` + `load_asset()` pattern |
| `AttributeError: type object 'unreal' has no attribute 'MaterialExpressionStep'` | Node class doesn't exist in UE 5.6 | See node-gotchas.md for alternatives |

### After recompile_material(): check shader logs

```
ue_get_logs(filter="ShaderCompiler", severity="warning", lines=10)
```

**Critical**: The log buffer retains old errors. Always note timestamps.

**Common shader errors and fixes**:

| Error | Cause | Fix |
|---|---|---|
| `(Node Clamp) Missing Clamp input` | Clamp Min/Max not connected | Connect all 3 inputs, or use Max+Min nodes instead |
| `(Node If) Missing If AGreaterThanB input` | Wrong input name | Use `"A > B"`, `"A == B"`, `"A < B"` |
| `Failed to compile Material` (no specific node) | Broken expression or dangling connection | Delete all expressions and rebuild |
| No error but renders as gray | Material compiled with fallback shader | Check `get_material_property_input_node()` — likely a disconnected output |

## MANDATORY — Post-Build Graph Integrity Check

After building any material graph, **ALWAYS run this verification** before reporting success. This catches disconnected nodes that `recompile_material()` alone won't flag.

```python
def verify_material_graph(mat, expected_connections):
    """
    Verify all expected material property inputs are connected.

    Args:
        mat: The material to verify
        expected_connections: dict mapping MaterialProperty -> description
            e.g. {MP.MP_BASE_COLOR: "base color", MP.MP_EMISSIVE_COLOR: "emissive"}

    Returns True if all connections verified, raises RuntimeError otherwise.
    """
    mel = unreal.MaterialEditingLibrary
    MP = unreal.MaterialProperty
    errors = []

    for prop, desc in expected_connections.items():
        node = mel.get_material_property_input_node(mat, prop)
        if node is None:
            errors.append("DISCONNECTED: {} ({}) has no input node".format(desc, prop))
        else:
            # Trace one level deeper — check the connected node has its own inputs
            inputs = mel.get_inputs_for_material_expression(mat, node)
            node_name = node.get_class().get_name()
            # Parameters and constants are leaf nodes (no inputs expected)
            leaf_types = [
                'MaterialExpressionConstant', 'MaterialExpressionConstant3Vector',
                'MaterialExpressionConstant4Vector', 'MaterialExpressionScalarParameter',
                'MaterialExpressionVectorParameter', 'MaterialExpressionTime',
                'MaterialExpressionTextureCoordinate', 'MaterialExpressionFresnel',
                'MaterialExpressionWorldPosition', 'MaterialExpressionObjectPositionWS',
            ]
            if node_name not in leaf_types and len(inputs) == 0:
                errors.append(
                    "BROKEN CHAIN: {} ({}) connected to {} but that node has no inputs"
                    .format(desc, prop, node_name)
                )

    if errors:
        for e in errors:
            print("ERROR: {}".format(e))
        raise RuntimeError(
            "Material graph verification failed with {} error(s)".format(len(errors))
        )

    print("Graph verified: all {} connections OK".format(len(expected_connections)))
    return True


# Usage example:
MP = unreal.MaterialProperty
verify_material_graph(mat, {
    MP.MP_BASE_COLOR: "Base Color",
    MP.MP_EMISSIVE_COLOR: "Emissive",
    MP.MP_ROUGHNESS: "Roughness",
})
```

**When to use:** After EVERY `recompile_material()` call, before `save_asset()`. This adds 1 second of verification and prevents the #1 cause of "material shows checkerboard" bugs.

## MANDATORY — Full Inter-Node Connection Validation

`verify_material_graph()` above only checks final material property outputs. Intermediate nodes (e.g., a Multiply feeding a Sine, or a Time feeding a Multiply) can be disconnected without triggering that check. **Always run BOTH checks.**

```python
def validate_all_connections(mat, expected_outputs):
    """
    Trace the full node graph from each material property output recursively.
    Verifies: (1) all outputs connected, (2) all intermediate nodes have inputs,
    (3) no orphan nodes exist.

    NOTE: mat.expressions is protected in UE 5.5-5.7 — cannot list nodes directly.
    We trace from outputs and compare reachable count vs get_num_material_expressions().
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
        if name not in leaf_types and len(inputs) == 0:
            errors.append("NODE '{}' has ZERO connected inputs — disconnected".format(name))
        for inp in inputs:
            trace_node(inp, depth + 1)

    for prop, desc in expected_outputs.items():
        node = mel.get_material_property_input_node(mat, prop)
        if node is None:
            errors.append("DISCONNECTED OUTPUT: {} has no input node".format(desc))
        else:
            trace_node(node, 1)

    # Detect orphans (~7 internal nodes are normal)
    total = mel.get_num_material_expressions(mat)
    orphan_estimate = total - len(visited) - 7
    if orphan_estimate > 0:
        errors.append("~{} orphan node(s) not reachable from outputs".format(orphan_estimate))

    return errors

# Usage — run AFTER verify_material_graph():
MP = unreal.MaterialProperty
errors = validate_all_connections(mat, {
    MP.MP_BASE_COLOR: "Base Color",
    MP.MP_EMISSIVE_COLOR: "Emissive",
    MP.MP_ROUGHNESS: "Roughness",
})
if errors:
    for e in errors:
        print("VALIDATION ERROR: {}".format(e))
    raise RuntimeError("{} error(s) — fix before saving".format(len(errors)))
print("All inter-node connections validated OK")
```

**Validation order (MANDATORY after every material build):**
1. `verify_material_graph(mat, expected_connections)` — checks material property outputs
2. `validate_all_connections(mat, expected_outputs)` — traces full graph, checks intermediate wiring + orphans
3. `recompile_material(mat)` — only if both pass
4. Check shader logs for compile errors
5. `save_asset()` — only if everything passes

**If validation fails:** Do NOT save. Reconnect the broken node, re-run both checks, then save.

---

## Visual Verification

After material changes, always capture a screenshot:

```python
import unreal, os

saved = unreal.Paths.convert_relative_path_to_full(unreal.Paths.project_saved_dir())
out_path = os.path.join(saved, "Screenshots", "mat_verify")

sub = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
world = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_editor_world()

capture = sub.spawn_actor_from_class(unreal.SceneCapture2D, cam_pos)
look = unreal.MathLibrary.find_look_at_rotation(cam_pos, target)
capture.set_actor_rotation(look, False)

rt = unreal.RenderingLibrary.create_render_target2d(world, 1280, 720)
cap_comp = capture.get_editor_property("capture_component2d")
cap_comp.set_editor_property("texture_target", rt)
cap_comp.set_editor_property("capture_source", unreal.SceneCaptureSource.SCS_FINAL_COLOR_LDR)
cap_comp.set_editor_property("capture_every_frame", False)  # avoid perf warning
cap_comp.capture_scene()

unreal.RenderingLibrary.export_render_target(world, rt, os.path.dirname(out_path), os.path.basename(out_path))
sub.destroy_actor(capture)
# Output is EXR — convert: sips -s format png <file> --out <file>.png
```

## Iterative Tuning Loop

For appearance tuning, follow this exact cycle:
1. Make ONE change
2. `recompile_material(mat)`
3. Check shader logs for errors
4. Capture screenshot
5. View screenshot
6. Decide next change
7. Repeat

**Never** make 5 changes at once — if the result is wrong, you won't know which change caused it.
