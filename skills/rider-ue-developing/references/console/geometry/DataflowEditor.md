# UE Python API — DataflowEditor Module

**5 types** from the `DataflowEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataflowAssetFactory`, `DataflowEditorBlueprintLibrary`, `DataflowEditorCollectionComponent`, `DataflowConstructionViewportMousePanButton`, `DataflowEditorEvaluationMode`

---

## Classes

### `unreal.DataflowAssetFactory`
Inherits: `Factory` | Header: `DataflowAssetFactory.h`

Dataflow Asset Factory

### `unreal.DataflowEditorBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DataflowEditorBlueprintLibrary.h`

Dataflow Editor Blueprint Library

**Methods** (4):
  - `add_dataflow_from_clipboard_content(dataflow, clipboard_content, location)` -> `bool` [classmethod] — Add Dataflow from Clipboard Content
  - `add_dataflow_node(dataflow, node_type_name, base_name, location)` -> `Name` [classmethod] — Add a specific node , return the node name
  - `connect_dataflow_nodes(dataflow, from_node_name, output_name, to_node_name, input_name)` -> `bool` [classmethod] — Connect the output oif a node to the input of another
  - `set_dataflow_node_property(dataflow, node_name, property_name, propertyvalue)` -> `bool` [classmethod] — Set Dataflow Node Property

### `unreal.DataflowEditorCollectionComponent`
Inherits: `DynamicMeshComponent` | Header: `DataflowEditorCollectionComponent.h`

FleshComponent

### `unreal.DataflowConstructionViewportMousePanButton`
Inherits: `EnumBase` | Header: `DataflowEditorOptions.h`

EDataflow Construction Viewport Mouse Pan Button

**Properties** (3):
  - `MIDDLE`: `DataflowConstructionViewportMousePanButton = Ellipsis` — Middle Mouse Button 1
  - `RIGHT`: `DataflowConstructionViewportMousePanButton = Ellipsis` — Right Mouse Button 0
  - `RIGHT_OR_MIDDLE`: `DataflowConstructionViewportMousePanButton = Ellipsis` — Either Right or Middle Mouse Button 2

### `unreal.DataflowEditorEvaluationMode`
Inherits: `EnumBase` | Header: `DataflowEditorOptions.h`

EDataflow Editor Evaluation Mode

**Properties** (2):
  - `AUTOMATIC`: `DataflowEditorEvaluationMode = Ellipsis` — Dataflow graph will evaluate automatically when values are changed 0
  - `MANUAL`: `DataflowEditorEvaluationMode = Ellipsis` — Dataflow graph will not eveluate until the user presses the evaluate button in the editor 1
