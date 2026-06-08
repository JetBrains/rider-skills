---
name: ue:blueprint
description: "Use when user asks to create Blueprint assets, add nodes to Blueprint graphs, wire Blueprint pins, set Blueprint defaults, compile Blueprints, create Blueprint Function Libraries, or build Widget Blueprint widget trees via AgentBridge. DO NOT TRIGGER for C++ class creation (use ue:coder), single property changes on existing actors (use ue:editor), material graphs (use ue:material), animation Blueprints (use ue:animation), or UI architecture/CommonUI/input routing (use ue:ui)."
allowed-tools: Bash, Read, Write
argument-hint: "[Blueprint task description]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions (Blueprint compiler, nativization, K2Node_, BlueprintCallable rules, Blueprint interfaces), fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# UE Blueprint — Programmatic Blueprint Manipulation

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — understand the Blueprint task; confirm parent class, graph, and scope
2. **Inspect existing** — export IR or run `inspect-bp.py` if modifying an existing Blueprint
3. **Create/modify Blueprint** — build graph, add nodes, wire pins, set defaults
4. **Compile and save** — compile Blueprint, save asset (always both)
5. **Post-creation verification** — confirm actor placed, level saved, physics/velocity validated
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## Executing Python in the Editor

All Python execution goes through **ue:console**. Do NOT look for shell scripts, ports, or HTTP endpoints — ue:console handles all transport.

- Health check, inline scripts, file execution → **ue:console**
- If the editor is not connected, tell the user and stop

## Workflow

### Creating a New Blueprint
1. Create the asset with appropriate parent class
2. Add variables (before nodes that reference them)
3. Add components if needed
4. Build the graph: event nodes → logic → wiring (use JSON IR or low-level API)
5. Compile and save

### Modifying an Existing Blueprint
1. Inspect via `inspect-bp.py` or `export_graph_ir()`
2. Add/modify nodes and connections
3. Compile and save

## Core API — Graph Manipulation (JSON IR)

**Preferred approach** — LLM works with clean JSON, no GUIDs:

```python
import json, sys, os
sys.path.insert(0, os.path.join('__TOOLKIT_ROOT__', 'skills', 'ue:blueprint', 'scripts'))
from bp_ir import export_graph_ir, apply_graph_ir

# Read existing graph
ir = export_graph_ir('/Game/BP_Example', 'EventGraph')

# Build a new graph
ir = {
    "format": "ue:blueprint-ir", "version": 1,
    "blueprint": "/Game/BP_Target", "graph": "EventGraph",
    "nodes": [
        {"id": "evt", "class": "K2Node_Event", "x": 0, "y": 0,
         "params": {"EventReference": "ReceiveBeginPlay"}},
        {"id": "print", "class": "K2Node_CallFunction", "x": 300, "y": 0,
         "params": {"FunctionReference": "/Script/Engine.KismetSystemLibrary:PrintString"},
         "pin_defaults": {"InString": "Hello!"}},
    ],
    "connections": [["evt.then", "print.execute"]],
}
result = apply_graph_ir('/Game/BP_Target', 'EventGraph', ir, clear_existing=True)
```

## Core API — Low-Level AgentBridge

For single operations or when JSON IR is overkill:

```python
ab = unreal.AgentBridgeLibrary

# Nodes
node = ab.add_blueprint_node(bp_path, 'EventGraph', 'K2Node_CallFunction',
    '{"FunctionReference": "/Script/Engine.KismetSystemLibrary:PrintString"}', 300, 0)
ab.connect_blueprint_pins(bp_path, 'EventGraph', 'K2Node_Event_0', 'then', node, 'execute')
ab.set_pin_default_value(bp_path, 'EventGraph', node, 'InString', 'Hello')

# Variables (bypasses EdGraphPinType protected property issue)
ab.add_blueprint_variable(bp_path, 'Health', 'real', 'double', '', 'None', False)
ab.add_blueprint_variable(bp_path, 'TargetActor', 'object', '', '/Script/Engine.Actor', 'None', False)
ab.set_blueprint_variable_default_value(bp_path, 'Health', '100.0')
ab.set_blueprint_variable_category(bp_path, 'Health', 'Stats')

# Clipboard copy-paste between BPs
clipboard = ab.export_blueprint_nodes(bp_path, 'EventGraph', '[]')
ab.import_blueprint_nodes(other_bp, 'EventGraph', clipboard, 500, 0)
```

## Core API — Asset Creation

```python
import unreal
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()

# Actor Blueprint
factory = unreal.BlueprintFactory()
factory.set_editor_property('parent_class', unreal.Actor)
bp = asset_tools.create_asset('BP_MyActor', '/Game/Blueprints', unreal.Blueprint, factory)

# Function Library
factory = unreal.BlueprintFactory()
factory.set_editor_property('parent_class', unreal.BlueprintFunctionLibrary)
bp = asset_tools.create_asset('BFL_Utils', '/Game/Blueprints', unreal.Blueprint, factory)

# Compile & Save (ALWAYS do both after changes)
unreal.BlueprintEditorLibrary.compile_blueprint(bp)
unreal.EditorAssetLibrary.save_asset('/Game/Blueprints/BP_MyActor')
```

## Widget Tree Manipulation

```python
ab = unreal.AgentBridgeLibrary

# CRITICAL: After creating a WBP, you MUST open it in editor to initialize WidgetTree
subsys = unreal.get_editor_subsystem(unreal.AssetEditorSubsystem)
subsys.open_editor_for_assets([wbp])

# Then widget tree ops work
ab.add_widget_to_tree(bp_path, '', 'CanvasPanel', 'RootCanvas')       # root panel (empty parent)
ab.add_widget_to_tree(bp_path, 'RootCanvas', 'TextBlock', 'Title')    # child widget
ab.set_widget_property(bp_path, 'Title', 'Text', '"Hello World"')
ab.list_widgets_in_tree(bp_path)                                        # → JSON array
ab.remove_widget_from_tree(bp_path, 'Title')
```

Supported widget classes: TextBlock, Button, Image, ProgressBar, Slider, CheckBox, ComboBoxString, EditableTextBox, CanvasPanel, VerticalBox, HorizontalBox, Overlay, ScrollBox, SizeBox, Border, Spacer, ScaleBox, GridPanel, WrapBox, WidgetSwitcher

## Static Scripts

| Script | Purpose | Params |
|--------|---------|--------|
| `create-bp.py` | Create a new Blueprint from parent class | `__bp_name__`, `__bp_path__`, `__parent_class__` |
| `discover-pins.py` | List all pins on all nodes in a BP | `__bp_path__` |
| `add-component.py` | Add a component to a Blueprint | `__bp_path__`, `__component_class__`, `__component_name__` |
| `compile-bp.py` | Compile and report status | `__bp_path__` |
| `inspect-bp.py` | Print graph structure, nodes, variables | `__bp_path__` |
| `safe-delete-bp.py` | Safely delete a BP (clears editors, instances, GC) | `__bp_path__` |
| `bp_ir.py` | **JSON IR module** — export/apply/diff Blueprint graphs | (imported as library) |
| `bp_ir_export.py` | Export BP graph → JSON IR | `__bp_path__`, `__graph_name__`, `__output__` |
| `bp_ir_import.py` | Import JSON IR → BP graph | `__bp_path__`, `__graph_name__`, `__ir_json__`, `__clear__`, `__compile__` |

## Key Rules (details in knowledge/gotchas.md)

- **Compile after every graph change batch** — uncompiled changes are invisible to runtime
- **Pin names are internal, not display** — "Exec" = `execute`/`then`, "Return Value" = `ReturnValue`. Use `discover-pins.py`
- **No duplicate events** — only ONE `Event BeginPlay` per BP. Check existing nodes first
- **Variables before nodes** — create variables BEFORE Get/Set nodes that reference them
- **Paths start with `/Game/`** — never `/Content/`, never include `.uasset`
- **Save after create AND compile** — unsaved BPs lost on crash
- **bp.status is protected** — don't read it, just compile and save

## Post-Creation Verification (MANDATORY)

After creating a Blueprint with gameplay logic (overlaps, triggers, physics, spawning), **always verify it works end-to-end**:

1. **Confirm the actor is placed in the level** — `get_all_level_actors()` and check for the expected class. If missing, spawn it.
2. **Save the level** — unsaved actors are lost. Call `LevelEditorSubsystem.save_current_level()`.
3. **Verify component configuration matches C++ defaults** — check that collision profiles, overlap events, physics settings weren't reset by Blueprint defaults. Common issue: Blueprint overrides C++ collision settings.
4. **Validate physics/velocity values** — don't assume N cm distance = N cm/s velocity. UE gravity is 980 cm/s². A launch of 300 cm/s only reaches 46cm height (see ue:coder physics conventions).
5. **Check the player pawn class** — gameplay code that casts to `ACharacter` will silently fail if the project uses `DefaultPawn` (which is NOT an ACharacter). Always verify the project's GameMode → DefaultPawnClass inheritance chain.

**Common Blueprint gotchas that break gameplay:**
- Mesh component with collision enabled blocks the trigger volume → character walks ON TOP instead of INTO the overlap zone
- Blueprint defaults override C++ constructor values (component transforms, collision profiles)
- Live Coding can break delegate bindings set in constructors — if overlaps stop firing after a hot reload, restart PIE

## When NOT to Use This Skill

| Task | Use Instead |
|------|-------------|
| C++ class creation | **ue:coder** |
| Material graphs | **ue:material** |
| Animation Blueprints | **ue:animation** |
| Single property on placed actor | **ue:editor** |
| UI architecture / CommonUI | **ue:ui** |

## Knowledge Files

| Topic | File |
|-------|------|
| Python BP API reference | knowledge/bp-api.md |
| Node types and class paths | knowledge/node-types.md |
| Pin wiring patterns | knowledge/pin-wiring.md |
| Common Blueprint recipes | knowledge/recipes.md |
| Gotchas and pitfalls | knowledge/gotchas.md |
