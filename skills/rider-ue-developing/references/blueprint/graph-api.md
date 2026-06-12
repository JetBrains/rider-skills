# UE Blueprint

Programmatic Blueprint manipulation via AgentBridge.

All Python execution goes through the `ue_execute_python` tool. Do NOT look for shell scripts, ports, or HTTP endpoints.

## Checklist

1. **Clarify** — parent class, graph, scope
2. **Inspect existing** — retrieve graph
3. **Create/modify Blueprint** — build graph, add nodes, wire pins, set defaults
4. **Compile and save** — always both
5. **Post-creation verification** — actor placed, level saved, physics/velocity validated
6. **Code review** — after implementation

## Core API — RiderAgentBridgeLibrary

```python
ab = unreal.RiderAgentBridgeLibrary

# Nodes
node = ab.add_blueprint_node(bp_path, 'EventGraph', 'K2Node_CallFunction',
    '{"FunctionReference": "/Script/Engine.KismetSystemLibrary:PrintString"}', 300, 0)
ab.connect_blueprint_pins(bp_path, 'EventGraph', 'K2Node_Event_0', 'then', node, 'execute')
ab.set_pin_default_value(bp_path, 'EventGraph', node, 'InString', 'Hello')

# Variables
ab.add_blueprint_variable(bp_path, 'Health', 'real', 'double', '', 'None', False)
ab.set_blueprint_variable_default_value(bp_path, 'Health', '100.0')
```

## Asset creation

```python
import unreal
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
factory = unreal.BlueprintFactory()
factory.set_editor_property('parent_class', unreal.Actor)
bp = asset_tools.create_asset('BP_MyActor', '/Game/Blueprints', unreal.Blueprint, factory)

# Compile & Save (ALWAYS both)
unreal.BlueprintEditorLibrary.compile_blueprint(bp)
unreal.EditorAssetLibrary.save_asset('/Game/Blueprints/BP_MyActor')
```

## Widget tree manipulation

```python
ab = unreal.RiderAgentBridgeLibrary

# CRITICAL: Open WBP in editor first to initialize WidgetTree
unreal.get_editor_subsystem(unreal.AssetEditorSubsystem).open_editor_for_assets([wbp])

ab.add_widget_to_tree(bp_path, '', 'CanvasPanel', 'RootCanvas')
ab.add_widget_to_tree(bp_path, 'RootCanvas', 'TextBlock', 'Title')
ab.set_widget_property(bp_path, 'Title', 'Text', '"Hello World"')
```

Supported widget classes: TextBlock, Button, Image, ProgressBar, Slider, CheckBox, ComboBoxString, EditableTextBox, CanvasPanel, VerticalBox, HorizontalBox, Overlay, ScrollBox, SizeBox, Border, Spacer, ScaleBox, GridPanel, WrapBox, WidgetSwitcher

## Key rules

- **Compile after every graph change batch** — uncompiled changes invisible to runtime
- **Pin names are internal** — "Exec" = `execute`/`then`, "Return Value" = `ReturnValue`.
- **No duplicate events** — only ONE `Event BeginPlay` per BP. Check existing nodes first.
- **Variables before nodes** — create variables BEFORE Get/Set nodes that reference them
- **Paths start with `/Game/`** — never `/Content/`, never include `.uasset`
- **Save after create AND compile** — unsaved BPs lost on crash

## Post-creation verification (mandatory for gameplay Blueprints)

1. Confirm actor is placed in the level — `get_all_level_actors()`.
2. Save the level — `LevelEditorSubsystem.save_current_level()`.
3. Verify component configuration — Blueprint defaults can override C++ collision settings.
4. Validate physics/velocity values — see **coder.md** physics conventions.
5. Check player pawn class — code casting to `ACharacter` silently fails if project uses `DefaultPawn`.

see: `./bp-api.md`
see: `./gotchas.md`
see: `./recipes.md`

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_health` | Check editor connection (`connected`, `projectName`, `processId`) | Call before any Python execution; stop if `connected: false` and follow Scenario 1 |
| `ue_status` | Health + PIE state + recent logs in one call | Quick pulse check instead of separate ue_health + ue_play(state) + ue_get_logs |
| `ue_execute_python` | Run graph-manipulation and asset-creation Python | All Blueprint work: create asset, compile, save, add nodes, wire pins, set defaults |
| `ue_get_logs` | Fetch editor logs by category/verbosity | After every `ue_execute_python` call — check `LogPython` and `LogBlueprint` for silent errors |
| `search_assets` | Find `.uasset` by name or base class | Locate the BP asset path before `get_asset_properties` or modification |
| `get_asset_properties` | Read CDO property values from a `.uasset` (absolute path) | Inspect Blueprint defaults without opening the editor |
| `find_default_value_overrides` | List every BP that overrides a UPROPERTY | Audit which BPs have non-default values for a specific field |
| `get_class_hierarchy` | All Blueprint descendants of a C++ class | Enumerate all child BPs before a batch CDO update |
| `spawn_actor` | Place a BP actor in the level (`assetPath` + `location` required) | Drop a test instance of the BP into the current level |
| `take_screenshot` | Capture PNG of editor/viewport/asset preview | Verify BP result visually; `kind=asset_preview` with `assetPath` for a BP thumbnail |
| `open_file_in_editor` | Open a file in Rider | Open the C++ parent class for reference while working in the BP |
| `search_symbol` | Find the C++ class behind a Blueprint | Locate parent class declaration before scripting BP graph nodes |
| `ue_import_blueprint_nodes` | Import Blueprint nodes from Unreal clipboard text format into a graph. | Add mutliple nodes to the Blueprint graph at once |
| `ue_export_blueprint_nodes` | Export Blueprint graph nodes to Unreal clipboard text format. | Inspect UE properties format presentation of Blueprint's graph nodes |
