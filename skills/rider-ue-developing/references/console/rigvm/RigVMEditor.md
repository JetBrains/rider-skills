# UE Python API — RigVMEditor Module

**8 types** from the `RigVMEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RigVMBlueprintLoadLogEntry`, `RigVMEditorGraphMenuContext`, `RigVMBlueprintLibrary`, `RigVMEditorMenuContext`, `RigVMBlueprintLoadLogSeverity`, `RigVMAssetDataFilterDynamic`, `RigVMBlueprintFilterDynamic`, `RigVMNodeFilterDynamic`

---

## Classes

### `unreal.RigVMBlueprintLoadLogEntry`
Inherits: `StructBase` | Header: `RigVMEditorBlueprintLibrary.h`

Rig VMBlueprint Load Log Entry

**Properties** (3):
  - `message`: `str` [Read-Only] — [Read-Only] (str)
  - `severity`: `RigVMBlueprintLoadLogSeverity` [Read-Only] — [Read-Only] (RigVMBlueprintLoadLogSeverity)
  - `subject`: `Object` [Read-Only] — [Read-Only] (Object)

### `unreal.RigVMEditorGraphMenuContext`
Inherits: `StructBase` | Header: `RigVMEditorMenuContext.h`

Rig VMEditor Graph Menu Context

**Properties** (3):
  - `graph`: `RigVMGraph` [Read-Only] — [Read-Only] The graph associated with this context. (RigVMGraph)
  - `node`: `RigVMNode` [Read-Only] — [Read-Only] The node associated with this context. (RigVMNode)
  - `pin`: `RigVMPin` [Read-Only] — [Read-Only] The pin associated with this context; may be NULL when over a node. (RigVMPin)

### `unreal.RigVMBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `RigVMEditorBlueprintLibrary.h`

Rig VMEditor Blueprint Library

**Methods** (13):
  - `get_assets_with_filter(class_, asset_data_filter)` -> `Array [ AssetData ]` [classmethod] — Get Assets with Filter for Blueprint
  - `get_controller(blueprint)` -> `RigVMController` [classmethod] — Get Controller
  - `get_model(blueprint)` -> `RigVMGraph` [classmethod] — Get Model
  - `load_assets()` -> `Array [ RigVMBlueprint ]` [classmethod] — Load Assets
  - `load_assets_by_class(class_)` -> `Array [ RigVMBlueprint ]` [classmethod] — Load Assets by Class
  - `load_assets_with_asset_data_and_blueprint_filters(class_, asset_data_filter, blueprint_filter)` -> `Array [ RigVMBlueprint ]` [classmethod] — Load Assets with Asset Data and Blueprint Filters for Blueprint
  - `load_assets_with_asset_data_and_node_filters(class_, asset_data_filter, node_filter)` -> `Array [ RigVMBlueprint ]` [classmethod] — Load Assets with Asset Data and Node Filters for Blueprint
  - `load_assets_with_asset_data_filter(class_, asset_data_filter)` -> `Array [ RigVMBlueprint ]` [classmethod] — Load Assets with Asset Data Filter for Blueprint
  - `load_assets_with_blueprint_filter(class_, blueprint_filter)` -> `Array [ RigVMBlueprint ]` [classmethod] — Load Assets with Blueprint Filter for Blueprint
  - `load_assets_with_node_filter(class_, node_filter)` -> `Array [ RigVMBlueprint ]` [classmethod] — Load Assets with Node Filter for Blueprint
  - `recompile_vm(blueprint)` -> `None` [classmethod] — Recompile VM
  - `recompile_vm_if_required(blueprint)` -> `None` [classmethod] — Recompile VMIf Required
  - `request_auto_vm_recompilation(blueprint)` -> `None` [classmethod] — Request Auto VMRecompilation

### `unreal.RigVMEditorMenuContext`
Inherits: `Object` | Header: `RigVMEditorMenuContext.h`

Rig VMEditor Menu Context

**Methods** (4):
  - `get_graph_menu_context()` -> `RigVMEditorGraphMenuContext` — Returns context for graph node context menu
  - `get_rig_vm_blueprint()` -> `RigVMBlueprint` — Get the rigvm blueprint that we are editing
  - `get_rig_vm_host()` -> `RigVMHost` — Get the active rigvm host instance in the viewport
  - `is_alt_down()` -> `bool` — Returns true if either alt key is down

### `unreal.RigVMBlueprintLoadLogSeverity`
Inherits: `EnumBase` | Header: `RigVMEditorBlueprintLibrary.h`

ERig VMBlueprint Load Log Severity

**Properties** (3):
  - `DISPLAY`: `RigVMBlueprintLoadLogSeverity = Ellipsis` — 0
  - `ERROR`: `RigVMBlueprintLoadLogSeverity = Ellipsis` — 2
  - `WARNING`: `RigVMBlueprintLoadLogSeverity = Ellipsis` — 1

### `unreal.RigVMAssetDataFilterDynamic`
Inherits: `DelegateBase` | Header: `RigVMEditorBlueprintLibrary.h`

Rig VMAsset Data Filter Dynamic Delegate Signature

### `unreal.RigVMBlueprintFilterDynamic`
Inherits: `DelegateBase` | Header: `RigVMEditorBlueprintLibrary.h`

Rig VMBlueprint Filter Dynamic Delegate Signature

### `unreal.RigVMNodeFilterDynamic`
Inherits: `DelegateBase` | Header: `RigVMEditorBlueprintLibrary.h`

Rig VMNode Filter Dynamic Delegate Signature
