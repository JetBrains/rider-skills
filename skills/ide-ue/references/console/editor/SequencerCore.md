# UE Python API — SequencerCore Module

**5 types** from the `SequencerCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SequencerViewModelScriptingStruct`, `SequencerOutlinerScriptingObject`, `SequencerScriptingLayer`, `SequencerViewModelStructExtensions`, `SequencerOutlinerSelectionChanged`

---

## Classes

### `unreal.SequencerViewModelScriptingStruct`
Inherits: `StructBase` | Header: `ViewModelScriptingStruct.h`

Sequencer View Model Scripting Struct

**Methods** (2):
  - `get_label()` -> `str` — Get Label
  - `get_path()` -> `str` — Get Path

**Properties** (1):
  - `type`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.SequencerOutlinerScriptingObject`
Inherits: `Object` | Header: `OutlinerScriptingObject.h`

Sequencer Outliner Scripting Object

**Methods** (4):
  - `get_children(node, type_name = 'None')` -> `Array [ SequencerViewModelScriptingStruct ]` — Get Children
  - `get_root_node()` -> `SequencerViewModelScriptingStruct` — Get Root Node
  - `get_selection()` -> `Array [ SequencerViewModelScriptingStruct ]` — Get Selection
  - `set_selection(selection)` -> `None` — Set Selection

**Properties** (1):
  - `on_selection_changed`: `SequencerOutlinerSelectionChanged` — [Read-Write] (SequencerOutlinerSelectionChanged)

### `unreal.SequencerScriptingLayer`
Inherits: `Object` | Header: `SequencerScriptingLayer.h`

Sequencer Scripting Layer

**Properties** (1):
  - `outliner`: `SequencerOutlinerScriptingObject` [Read-Only] — [Read-Only] (SequencerOutlinerScriptingObject)

### `unreal.SequencerViewModelStructExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `ViewModelScriptingStruct.h`

Function library containing methods that should be hoisted onto FSequencerScriptingRanges

**Methods** (2):
  - `get_label(view_model)` -> `str` [classmethod] — Get Label
  - `get_path(view_model)` -> `str` [classmethod] — Get Path

### `unreal.SequencerOutlinerSelectionChanged`
Inherits: `MulticastDelegateBase` | Header: `OutlinerScriptingObject.h`

Sequencer Outliner Selection Changed Delegate Signature
