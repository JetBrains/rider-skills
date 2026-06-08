"""
Export a Blueprint graph as JSON IR.
Runs in UE Python via AgentBridge.

Globals:
  __bp_path__    — Blueprint asset path (e.g. "/Game/BP_Example")
  __graph_name__ — Graph name (default: "EventGraph")
  __output__     — Optional: file path to write JSON (if empty, prints to log)
"""

import json
import sys
import os

# Add scripts dir to path for bp_ir import
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from bp_ir import export_graph_ir

import unreal

bp_path = __bp_path__  # noqa: F821 — set by caller
graph_name = getattr(sys.modules[__name__], '__graph_name__', 'EventGraph') or 'EventGraph'
output_path = getattr(sys.modules[__name__], '__output__', '')

ir = export_graph_ir(bp_path, graph_name)

ir_json = json.dumps(ir, indent=2)

if output_path:
    with open(output_path, 'w') as f:
        f.write(ir_json)
    unreal.log(f'Blueprint IR exported to {output_path}')
else:
    # Print to log for AgentBridge capture
    print(ir_json)
    unreal.log(f'Blueprint IR: {len(ir["nodes"])} nodes, {len(ir["connections"])} connections')
