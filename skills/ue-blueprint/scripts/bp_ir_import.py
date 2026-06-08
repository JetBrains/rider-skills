"""
Import a JSON IR into a Blueprint graph.
Runs in UE Python via AgentBridge.

Globals:
  __bp_path__       — Target Blueprint asset path (e.g. "/Game/BP_Target")
  __graph_name__    — Target graph name (default: "EventGraph")
  __ir_json__       — JSON IR as string
  __clear__         — If "true", clear existing nodes before importing
  __compile__       — If "true" (default), compile after import
"""

import json
import sys
import os

# Add scripts dir to path for bp_ir import
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from bp_ir import apply_graph_ir

import unreal

bp_path = __bp_path__  # noqa: F821 — set by caller
graph_name = getattr(sys.modules[__name__], '__graph_name__', 'EventGraph') or 'EventGraph'
ir_json = __ir_json__  # noqa: F821 — set by caller
clear = getattr(sys.modules[__name__], '__clear__', 'false') == 'true'
do_compile = getattr(sys.modules[__name__], '__compile__', 'true') != 'false'

ir = json.loads(ir_json)

result = apply_graph_ir(bp_path, graph_name, ir, clear_existing=clear)

# Report
created = result['created_nodes']
errors = result['errors']

if created:
    unreal.log(f'Created {len(created)} nodes:')
    for ir_id, ue_name in created.items():
        unreal.log(f'  {ir_id} → {ue_name}')

if errors:
    for err in errors:
        unreal.log_warning(err)

# Compile
if do_compile:
    bp = unreal.EditorAssetLibrary.load_asset(bp_path)
    if bp:
        unreal.BlueprintEditorLibrary.compile_blueprint(bp)
        unreal.log(f'Compiled {bp_path}')

# Save
unreal.EditorAssetLibrary.save_asset(bp_path)
unreal.log(f'Saved {bp_path}')

# Output result as JSON
print(json.dumps(result, indent=2))
