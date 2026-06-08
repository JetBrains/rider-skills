# Blueprint Pin Wiring Guide

> **WARNING — UE 5.7**: `connect_pins()` does **NOT exist** in UE 5.7.
> `get_all_graphs()` is also removed. There is **no Python API to wire pins** between nodes
> or manipulate graph connections programmatically.
>
> The pin name conventions below are kept as **reference only** — useful for understanding
> Blueprint graph structure when inspecting existing Blueprints, but they **cannot be applied
> programmatically**.

## Pin Discovery

Use `find_event_graph` or `find_graph` to locate graphs (not `get_all_graphs`):

```python
import unreal

bp = unreal.EditorAssetLibrary.load_asset('/Game/Blueprints/BP_MyActor')

# Find EventGraph
event_graph = unreal.BlueprintEditorLibrary.find_event_graph(bp)
if event_graph:
    print('EventGraph: {}'.format(event_graph.get_name()))

# Find a named function graph
func_graph = unreal.BlueprintEditorLibrary.find_graph(bp, 'MyFunction')
```

**Note**: `EdGraph` has no Python methods for node creation, deletion, or pin wiring.
Only standard UObject methods (`get_editor_property`, `get_name`, etc.) are available.

## Pin Name Conventions (Reference)

### Execution Pins
| Display Name | Internal Name |
|-------------|---------------|
| (white exec input) | `execute` |
| (white exec output) | `then` |
| Completed | `Completed` |
| On Success | `OnSuccess` |
| On Failure | `OnFailure` |

**Sequence node** exec outputs: `then_0`, `then_1`, `then_2`, etc.

**Branch node**:
- Input exec: `execute`
- Condition: `Condition`
- True: `then` (NOT `True`)
- False: `else` (NOT `False`)

### Common Data Pins
| Display Name | Internal Name | Type |
|-------------|---------------|------|
| Target | `self` | Object reference |
| Return Value | `ReturnValue` | Varies |
| World Context | `WorldContextObject` | Object |
| Class | `Class` | Class reference |
| New Value | `NewValue` | Varies |
| Delta Seconds | `DeltaSeconds` | float |
| Other Actor | `OtherActor` | Actor |

### Variable Get/Set Pins
- **Get node output**: pin name = variable name (e.g., `Health`)
- **Set node input**: pin name = variable name
- **Set node output**: same pin name (pass-through)
- **Set node exec**: `execute` (in), `then` (out)

### Cast Node Pins
| Pin | Internal Name |
|-----|---------------|
| Object input | `Object` |
| Exec (success) | `then` |
| Exec (fail) | `CastFailed` |
| Cast output | `As <ClassName>` (e.g., `As BP_Enemy`) |

### SpawnActor Pins
| Pin | Internal Name |
|-----|---------------|
| Class | `Class` |
| Spawn Transform | `SpawnTransform` |
| Collision Handling | `CollisionHandlingOverride` |
| Owner | `Owner` |
| Return Value | `ReturnValue` |

## Pin Type Compatibility (Reference)

Compatible conversions:
- `int` -> `float` (auto-conversion)
- `float` -> `int` (truncation, with warning)
- `Object` -> `Interface` (if object implements it)
- `Child class` -> `Parent class` (upcast)
- `Enum` -> `byte`

Incompatible (require explicit conversion nodes):
- `String` -> `int`
- `Vector` -> `Rotator`
- `Object ref` -> `Class ref`

## Wildcard Pins (Reference)

Some nodes have wildcard pins (e.g., Select, Print String's `InString`):
- They accept any type on first connection
- Once connected, type is locked
- Disconnect all to reset the wildcard

## Array/Map/Set Pins (Reference)

- Array pin names are the same, type becomes `Array[Type]`
- Access individual elements through ForEach or Get node
- `Make Array` node: pins are `[0]`, `[1]`, `[2]`, etc.
