"""
Blueprint JSON IR — static conversion between AgentBridge JSON and clean IR format.

JSON IR schema (v1):
{
  "format": "ue-blueprint-ir",
  "version": 1,
  "blueprint": "/Game/BP_Example",
  "graph": "EventGraph",
  "nodes": [
    {
      "id": "K2Node_Event_0",
      "class": "K2Node_Event",
      "title": "Event BeginPlay",
      "x": 0, "y": 0,
      "params": {"EventReference": "ReceiveBeginPlay"},
      "pin_defaults": {"InString": "Hello"}
    }
  ],
  "connections": [
    ["K2Node_Event_0.then", "K2Node_CallFunction_0.execute"]
  ]
}

Usage:
  # Export (in UE Python)
  from bp_ir import export_graph_ir, apply_graph_ir
  ir = export_graph_ir("/Game/BP_Example", "EventGraph")

  # Apply (in UE Python)
  result = apply_graph_ir("/Game/BP_Target", "EventGraph", ir)
"""

import json

try:
    import unreal
    _HAS_UNREAL = True
except ImportError:
    _HAS_UNREAL = False


def _ab():
    """Get AgentBridgeLibrary reference."""
    return unreal.AgentBridgeLibrary


# ── Export: UE graph → JSON IR ───────────────────────────────────────────────

def export_graph_ir(bp_path, graph_name):
    """
    Export a Blueprint graph as JSON IR dict.
    Calls GetBlueprintGraphNodes (enhanced with params + pin defaults).
    """
    ab = _ab()
    raw_json = ab.get_blueprint_graph_nodes(bp_path, graph_name)
    raw_nodes = json.loads(raw_json)

    nodes = []
    connections = []
    seen_connections = set()

    for rn in raw_nodes:
        node = {
            "id": rn["name"],
            "class": rn["class"],
            "title": rn.get("title", ""),
            "x": rn.get("x", 0),
            "y": rn.get("y", 0),
            "params": rn.get("params", {}),
            "pin_defaults": {},
        }

        for pin in rn.get("pins", []):
            # Collect default values (skip exec pins, they have no defaults)
            if pin.get("type") != "exec":
                dv = pin.get("default_value", "")
                if dv:
                    node["pin_defaults"][pin["name"]] = dv
                # Also check default_text_value and default_object
                dtv = pin.get("default_text_value", "")
                if dtv and not dv:
                    node["pin_defaults"][pin["name"]] = dtv
                do = pin.get("default_object", "")
                if do and not dv and not dtv:
                    node["pin_defaults"][pin["name"]] = do

            # Collect connections (deduplicate — each link appears on both sides)
            if pin.get("connected") and "linked_to" in pin:
                for link in pin["linked_to"]:
                    src = f"{rn['name']}.{pin['name']}"
                    tgt = f"{link['node']}.{link['pin']}"
                    # Normalize order: output→input (source.pin → target.pin)
                    if pin.get("direction") == "output":
                        key = (src, tgt)
                    else:
                        key = (tgt, src)
                    if key not in seen_connections:
                        seen_connections.add(key)
                        connections.append([key[0], key[1]])

        # Drop empty pin_defaults
        if not node["pin_defaults"]:
            del node["pin_defaults"]
        # Drop empty params
        if not node["params"]:
            del node["params"]

        nodes.append(node)

    return {
        "format": "ue-blueprint-ir",
        "version": 1,
        "blueprint": bp_path,
        "graph": graph_name,
        "nodes": nodes,
        "connections": connections,
    }


# ── Apply: JSON IR → UE graph ───────────────────────────────────────────────

def apply_graph_ir(bp_path, graph_name, ir, clear_existing=False):
    """
    Apply a JSON IR to a Blueprint graph.
    Creates nodes, sets pin defaults, wires connections.

    Args:
        bp_path: Target Blueprint asset path
        graph_name: Target graph name
        ir: JSON IR dict (or JSON string)
        clear_existing: If True, remove all existing nodes first

    Returns:
        dict with 'created_nodes' (id→ue_name mapping) and 'errors'
    """
    if isinstance(ir, str):
        ir = json.loads(ir)

    ab = _ab()
    id_to_ue_name = {}  # IR id → actual UE node name
    errors = []

    # Optionally clear existing nodes
    if clear_existing:
        existing_json = ab.get_blueprint_graph_nodes(bp_path, graph_name)
        existing = json.loads(existing_json)
        for en in existing:
            ab.remove_blueprint_node(bp_path, graph_name, en["name"])

    # Phase 1: Create all nodes
    for node_ir in ir.get("nodes", []):
        node_class = node_ir["class"]
        params = node_ir.get("params", {})
        x = node_ir.get("x", 0)
        y = node_ir.get("y", 0)

        ue_name = ab.add_blueprint_node(
            bp_path, graph_name,
            node_class, json.dumps(params),
            x, y
        )

        if ue_name:
            id_to_ue_name[node_ir["id"]] = ue_name
        else:
            errors.append(f"Failed to create node: {node_ir['id']} ({node_class})")

    # Phase 2: Set pin default values
    for node_ir in ir.get("nodes", []):
        ue_name = id_to_ue_name.get(node_ir["id"])
        if not ue_name:
            continue
        for pin_name, default_value in node_ir.get("pin_defaults", {}).items():
            ok = ab.set_pin_default_value(
                bp_path, graph_name, ue_name, pin_name, str(default_value)
            )
            if not ok:
                errors.append(
                    f"Failed to set default: {node_ir['id']}.{pin_name} = {default_value}"
                )

    # Phase 3: Wire connections
    for conn in ir.get("connections", []):
        if len(conn) != 2:
            errors.append(f"Invalid connection format: {conn}")
            continue

        src_node_id, src_pin = conn[0].rsplit(".", 1)
        tgt_node_id, tgt_pin = conn[1].rsplit(".", 1)

        src_ue = id_to_ue_name.get(src_node_id, src_node_id)
        tgt_ue = id_to_ue_name.get(tgt_node_id, tgt_node_id)

        ok = ab.connect_blueprint_pins(
            bp_path, graph_name,
            src_ue, src_pin,
            tgt_ue, tgt_pin
        )
        if not ok:
            errors.append(f"Failed to connect: {conn[0]} → {conn[1]}")

    return {
        "created_nodes": id_to_ue_name,
        "errors": errors,
    }


# ── Diff: Compare two IRs ───────────────────────────────────────────────────

def diff_ir(old_ir, new_ir):
    """
    Compare two JSON IRs and return changes needed.
    Returns dict with 'add_nodes', 'remove_nodes', 'add_connections',
    'remove_connections', 'update_defaults'.
    """
    old_nodes = {n["id"]: n for n in old_ir.get("nodes", [])}
    new_nodes = {n["id"]: n for n in new_ir.get("nodes", [])}

    old_conns = set(tuple(c) for c in old_ir.get("connections", []))
    new_conns = set(tuple(c) for c in new_ir.get("connections", []))

    add_nodes = [new_nodes[nid] for nid in new_nodes if nid not in old_nodes]
    remove_nodes = [nid for nid in old_nodes if nid not in new_nodes]
    add_conns = [list(c) for c in new_conns - old_conns]
    remove_conns = [list(c) for c in old_conns - new_conns]

    # Default value changes for nodes that exist in both
    update_defaults = {}
    for nid in new_nodes:
        if nid not in old_nodes:
            continue
        old_defs = old_nodes[nid].get("pin_defaults", {})
        new_defs = new_nodes[nid].get("pin_defaults", {})
        changed = {}
        for pin, val in new_defs.items():
            if old_defs.get(pin) != val:
                changed[pin] = val
        if changed:
            update_defaults[nid] = changed

    return {
        "add_nodes": add_nodes,
        "remove_nodes": remove_nodes,
        "add_connections": add_conns,
        "remove_connections": remove_conns,
        "update_defaults": update_defaults,
    }


def apply_diff(bp_path, graph_name, diff):
    """
    Apply a diff (from diff_ir) to an existing Blueprint graph.
    Preserves existing nodes not in the diff.
    """
    ab = _ab()
    id_to_ue_name = {}
    errors = []

    # Remove nodes
    for node_id in diff.get("remove_nodes", []):
        ok = ab.remove_blueprint_node(bp_path, graph_name, node_id)
        if not ok:
            errors.append(f"Failed to remove node: {node_id}")

    # Add nodes
    for node_ir in diff.get("add_nodes", []):
        ue_name = ab.add_blueprint_node(
            bp_path, graph_name,
            node_ir["class"], json.dumps(node_ir.get("params", {})),
            node_ir.get("x", 0), node_ir.get("y", 0)
        )
        if ue_name:
            id_to_ue_name[node_ir["id"]] = ue_name
        else:
            errors.append(f"Failed to add node: {node_ir['id']}")

    # Set pin defaults on new nodes
    for node_ir in diff.get("add_nodes", []):
        ue_name = id_to_ue_name.get(node_ir["id"])
        if not ue_name:
            continue
        for pin, val in node_ir.get("pin_defaults", {}).items():
            ab.set_pin_default_value(bp_path, graph_name, ue_name, pin, str(val))

    # Update defaults on existing nodes
    for node_id, defaults in diff.get("update_defaults", {}).items():
        ue_name = id_to_ue_name.get(node_id, node_id)
        for pin, val in defaults.items():
            ok = ab.set_pin_default_value(bp_path, graph_name, ue_name, pin, str(val))
            if not ok:
                errors.append(f"Failed to update default: {node_id}.{pin}")

    # Remove connections (TODO: need disconnect API — not yet in AgentBridge)
    # For now, removing connections requires removing and re-adding nodes

    # Add connections
    for conn in diff.get("add_connections", []):
        src_id, src_pin = conn[0].rsplit(".", 1)
        tgt_id, tgt_pin = conn[1].rsplit(".", 1)
        src_ue = id_to_ue_name.get(src_id, src_id)
        tgt_ue = id_to_ue_name.get(tgt_id, tgt_id)
        ok = ab.connect_blueprint_pins(bp_path, graph_name, src_ue, src_pin, tgt_ue, tgt_pin)
        if not ok:
            errors.append(f"Failed to connect: {conn[0]} → {conn[1]}")

    return {"created_nodes": id_to_ue_name, "errors": errors}
