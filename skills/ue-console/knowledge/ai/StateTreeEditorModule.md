# UE Python API — StateTreeEditorModule Module

**11 types** from the `StateTreeEditorModule` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `StateTreeEditorColor`, `StateTreeEditorColorRef`, `StateTreeEditorNode`, `StateTreeEventDesc`, `StateTreeStateParameters`, `StateTreeTransition`, `StateTreeTransitionDelegateListener`, `QAStateTreeEditorData`, `StateTreeEditorData`, `StateTreeFactory`, `StateTreeState`

---

## Classes

### `unreal.StateTreeEditorColor`
Inherits: `StructBase` | Header: `StateTreeEditorTypes.h`

Struct describing a Color, its display name and a unique identifier to get an instance via UStateTreeEditorData::FindColor

### `unreal.StateTreeEditorColorRef`
Inherits: `StructBase` | Header: `StateTreeEditorTypes.h`

Id Struct to uniquely identify an FStateTreeEditorColor instance. An existing FStateTreeEditorColor instance can be found via UStateTreeEditorData::FindColor

### `unreal.StateTreeEditorNode`
Inherits: `StructBase` | Header: `StateTreeEditorNode.h`

Base for Evaluator, Task and Condition nodes.

### `unreal.StateTreeEventDesc`
Inherits: `StructBase` | Header: `StateTreeState.h`

Editor representation of an event description.

### `unreal.StateTreeStateParameters`
Inherits: `StructBase` | Header: `StateTreeState.h`

State Tree State Parameters

### `unreal.StateTreeTransition`
Inherits: `StructBase` | Header: `StateTreeState.h`

Editor representation of a transition in StateTree

### `unreal.StateTreeTransitionDelegateListener`
Inherits: `StructBase` | Header: `StateTreeState.h`

StateTreeâs internal delegate listener used exclusively in transitions.

### `unreal.QAStateTreeEditorData`
Inherits: `StateTreeEditorData` | Header: `StateTreeEditorData.h`

QAState Tree Editor Data

### `unreal.StateTreeEditorData`
Inherits: `Object` | Header: `StateTreeEditorData.h`

Edit time data for StateTree asset. This data gets baked into runtime format before being used by the StateTreeInstance.

**Properties** (1):
  - `root_parameters`: `StateTreeStateParameters` — [Read-Write]
deprecated: Property âRootParametersâ is deprecated. (StateTreeStateParameters)

### `unreal.StateTreeFactory`
Inherits: `Factory` | Header: `StateTreeFactory.h`

Factory for UStateTree

### `unreal.StateTreeState`
Inherits: `Object` | Header: `StateTreeState.h`

Editor representation of a state in StateTree
