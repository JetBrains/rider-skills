# Blueprint Node Types & Class Paths

> **WARNING — UE 5.7**: `BlueprintEditorLibrary.add_node()` does **NOT exist** in UE 5.7.
> There is no Python API to programmatically add nodes to Blueprint graphs.
> The node class paths below are kept as **reference only** — useful for manually identifying
> nodes in the editor or understanding graph structure, but they **cannot be created via Python**.

## Event Nodes

| Node | Class Path | Notes |
|------|-----------|-------|
| Event BeginPlay | `/Script/BlueprintGraph.K2Node_Event` | `EventReference` = `ReceiveBeginPlay` |
| Event Tick | `/Script/BlueprintGraph.K2Node_Event` | `EventReference` = `ReceiveTick` |
| Event ActorBeginOverlap | `/Script/BlueprintGraph.K2Node_Event` | `EventReference` = `ReceiveActorBeginOverlap` |
| Event ActorEndOverlap | `/Script/BlueprintGraph.K2Node_Event` | `EventReference` = `ReceiveActorEndOverlap` |
| Event Any Damage | `/Script/BlueprintGraph.K2Node_Event` | `EventReference` = `ReceiveAnyDamage` |
| Event Hit | `/Script/BlueprintGraph.K2Node_Event` | `EventReference` = `ReceiveHit` |
| Event Destroyed | `/Script/BlueprintGraph.K2Node_Event` | `EventReference` = `ReceiveDestroyed` |
| Custom Event | `/Script/BlueprintGraph.K2Node_CustomEvent` | User-defined event |

Only ONE of each built-in event per Blueprint.

## Flow Control

| Node | Class Path |
|------|-----------|
| Branch (If) | `/Script/BlueprintGraph.K2Node_IfThenElse` |
| Sequence | `/Script/BlueprintGraph.K2Node_ExecutionSequence` |
| Switch on Int | `/Script/BlueprintGraph.K2Node_SwitchInteger` |
| Switch on String | `/Script/BlueprintGraph.K2Node_SwitchString` |
| Switch on Name | `/Script/BlueprintGraph.K2Node_SwitchName` |
| Switch on Enum | `/Script/BlueprintGraph.K2Node_SwitchEnum` |
| For Each Loop | `/Script/BlueprintGraph.K2Node_ForEachElementInEnum` |
| For Loop | `/Script/BlueprintGraph.K2Node_MacroInstance` |
| While Loop | `/Script/BlueprintGraph.K2Node_MacroInstance` |
| Gate | `/Script/BlueprintGraph.K2Node_MacroInstance` |
| Do Once | `/Script/BlueprintGraph.K2Node_MacroInstance` |
| Flip Flop | `/Script/BlueprintGraph.K2Node_MacroInstance` |
| Delay | `/Script/BlueprintGraph.K2Node_LatentAction` |

## Function Calls

| Node | Class Path |
|------|-----------|
| Call Function | `/Script/BlueprintGraph.K2Node_CallFunction` |
| Call Parent Function | `/Script/BlueprintGraph.K2Node_CallParentFunction` |
| Call Array Function | `/Script/BlueprintGraph.K2Node_CallArrayFunction` |
| Call Delegate | `/Script/BlueprintGraph.K2Node_CallDelegate` |

## Variable Access

| Node | Class Path |
|------|-----------|
| Get Variable | `/Script/BlueprintGraph.K2Node_VariableGet` |
| Set Variable | `/Script/BlueprintGraph.K2Node_VariableSet` |

## Object/Component Operations

| Node | Class Path |
|------|-----------|
| Cast To | `/Script/BlueprintGraph.K2Node_DynamicCast` |
| Get Component by Class | `/Script/BlueprintGraph.K2Node_CallFunction` |
| Spawn Actor from Class | `/Script/BlueprintGraph.K2Node_SpawnActor` |
| Construct Object from Class | `/Script/BlueprintGraph.K2Node_ConstructObjectFromClass` |
| Create Widget | `/Script/BlueprintGraph.K2Node_CreateWidget` |

## Math & Logic

| Node | Class Path |
|------|-----------|
| Make Literal (int, float, etc.) | `/Script/BlueprintGraph.K2Node_MakeLiteral*` |
| Math Expression | `/Script/BlueprintGraph.K2Node_MathExpression` |
| Select | `/Script/BlueprintGraph.K2Node_Select` |

## Struct Operations

| Node | Class Path |
|------|-----------|
| Make Struct | `/Script/BlueprintGraph.K2Node_MakeStruct` |
| Break Struct | `/Script/BlueprintGraph.K2Node_BreakStruct` |
| Make Array | `/Script/BlueprintGraph.K2Node_MakeArray` |
| Make Map | `/Script/BlueprintGraph.K2Node_MakeMap` |
| Make Set | `/Script/BlueprintGraph.K2Node_MakeSet` |

## Delegates & Events

| Node | Class Path |
|------|-----------|
| Bind Event | `/Script/BlueprintGraph.K2Node_AssignDelegate` |
| Create Event | `/Script/BlueprintGraph.K2Node_CreateDelegate` |
| Add Custom Event | `/Script/BlueprintGraph.K2Node_CustomEvent` |
| Event Dispatcher (Call) | `/Script/BlueprintGraph.K2Node_CallDelegate` |
| Event Dispatcher (Bind) | `/Script/BlueprintGraph.K2Node_AssignDelegate` |

## Interface

| Node | Class Path |
|------|-----------|
| Interface Message | `/Script/BlueprintGraph.K2Node_Message` |
| Does Implement Interface | `/Script/BlueprintGraph.K2Node_CallFunction` |

## Commonly Used Macro Instances

Macros like ForLoop, WhileLoop, Gate, DoOnce, FlipFlop are `K2Node_MacroInstance` with the `MacroGraphReference` set to the macro in `/Engine/EditorBlueprintResources/StandardMacros`.

## K2Node Classes Exposed in UE 5.7

Only 7 K2Node classes are available in the Python API (none can be instantiated into graphs):

- `K2Node`
- `K2Node_CallFunction`
- `K2Node_DataChannelAccessContextOperation`
- `K2Node_DataChannelAccessContext_GetMembers`
- `K2Node_DataChannelAccessContext_Make`
- `K2Node_DataChannelAccessContext_Prepare`
- `K2Node_DataChannelAccessContext_SetMembers`

## Node Position Guidelines (Reference)

```
X: 0      300      600      900      1200
   Events  Logic    Branch   Actions  Output

Y spacing: 200px between parallel paths
```

Place nodes left-to-right following execution flow. Group related logic vertically.

---

## MCP tools

All Blueprint node work goes through `ue_execute_python` + AgentBridge. Confirm `ue_status` first — graph APIs are no-ops during PIE.

| Tool | Purpose | When to use |
|------|---------|-------------|
| `ue_status` | Confirm editor connected and not in PIE | Required before all graph operations |
| `ue_execute_python` | All Blueprint node operations via AgentBridge | Inspect, add, connect, set pin defaults, compile, save |
| `search_assets` | Find a Blueprint asset by name or class | Resolve `/Game/...` path before any AgentBridge call |
| `get_asset_properties` | Read CDO property values from a `.uasset` | Verify function-reference node params without running the game |
| `get_class_hierarchy` | All Blueprint subclasses of a C++ class | Enumerate BPs before a batch node update |
| `lint_files` / `get_file_problems` | Check Blueprint source for errors | Validate after bulk graph changes |

### Inspect existing node types

```python
import unreal, json
ab = unreal.RiderAgentBridgeLibrary
nodes = ab.get_blueprint_graph_nodes('/Game/MyBP', 'EventGraph')
print(json.dumps(json.loads(nodes), indent=2))
# Returns [{id, class, x, y, params, pins}] — class matches K2Node paths in this file
```

Always call this before adding nodes — avoids duplicate events (only ONE `Event BeginPlay` per BP).

### Export full graph IR (preferred for multi-node inspection/edit)

```python
from bp_ir import export_graph_ir, apply_graph_ir
ir = export_graph_ir('/Game/MyBP', 'EventGraph')          # full graph as JSON
result = apply_graph_ir('/Game/MyBP', 'EventGraph', modified_ir, clear_existing=True)
```

IR is diffable and does the whole change in one round-trip. Use low-level AgentBridge only for single-node additions.

### Add a node, wire it, compile

```python
import unreal
ab = unreal.RiderAgentBridgeLibrary
bp = '/Game/MyBP'

node_id = ab.add_blueprint_node(bp, 'EventGraph', 'K2Node_CallFunction',
    '{"FunctionReference": "/Script/Engine.KismetSystemLibrary:PrintString"}', 300, 0)
ab.connect_blueprint_pins(bp, 'EventGraph', 'K2Node_Event_0', 'then', node_id, 'execute')
ab.set_pin_default_value(bp, 'EventGraph', node_id, 'InString', 'Hello')

bp_asset = unreal.EditorAssetLibrary.load_asset(bp)
unreal.BlueprintEditorLibrary.compile_blueprint(bp_asset)
unreal.EditorAssetLibrary.save_asset(bp)
```

### Workflow

1. `ue_status` — require `connected = true` and `playState != "Play"`.
2. `search_assets { query: "MyBP" }` — get the `/Game/...` path.
3. `ue_execute_python` → `ab.get_blueprint_graph_nodes(bp_path, graph)` — audit what's there.
4. Make the change (IR for multi-node; low-level AgentBridge for single-node).
5. Compile + save in the same `ue_execute_python` call.
6. `get_asset_properties` or `ue_status` to verify.
