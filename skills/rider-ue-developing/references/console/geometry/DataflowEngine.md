# UE Python API — DataflowEngine Module

**8 types** from the `DataflowEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataflowInstance`, `DataflowVariableOverrides`, `StringValuePair`, `Dataflow`, `DataflowBlueprintLibrary`, `DataflowDebugDrawComponent`, `DataflowDebugDrawRenderType`, `DataflowType`

---

## Classes

### `unreal.DataflowInstance`
Inherits: `StructBase` | Header: `DataflowInstance.h`

This structure is to be embedded in any asset that need generation from a dataflow

### `unreal.DataflowVariableOverrides`
Inherits: `StructBase` | Header: `DataflowInstance.h`

This wraps the variable overrides This is also separate from FDataflowInstance to allow for customization to display override checkboxes in front of each variable property ( see DataflowDetails.h )

### `unreal.StringValuePair`
Inherits: `StructBase` | Header: `DataflowEngineTypes.h`

String Value Pair

**Properties** (2):
  - `key`: `str` — [Read-Write] (str)
  - `value`: `str` — [Read-Write] (str)

### `unreal.Dataflow`
Inherits: `EdGraph` | Header: `DataflowObject.h`

UDataflow (UObject)

### `unreal.DataflowBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DataflowBlueprintLibrary.h`

Dataflow Blueprint Library

**Methods** (10):
  - `evaluate_terminal_node_by_name(dataflow, terminal_node_name, result_asset)` -> `None` [classmethod] — Find a specific terminal node by name evaluate it using a specific UObject
  - `override_dataflow_variable_bool(asset, variable_name, variable_value)` -> `bool` [classmethod] — Override a Boolean dataflow variable for a specific asset
  - `override_dataflow_variable_bool_array(asset, variable_name, variable_array_value)` -> `bool` [classmethod] — Override an Boolean Array dataflow variable for a specific asset
  - `override_dataflow_variable_float(asset, variable_name, variable_value)` -> `bool` [classmethod] — Override a Float dataflow variable for a specific asset
  - `override_dataflow_variable_float_array(asset, variable_name, variable_array_value)` -> `bool` [classmethod] — Override a Float Array dataflow variable for a specific asset
  - `override_dataflow_variable_int(asset, variable_name, variable_value)` -> `bool` [classmethod] — Override an Integer dataflow variable for a specific asset
  - `override_dataflow_variable_int_array(asset, variable_name, variable_array_value)` -> `bool` [classmethod] — Override an Integer Array dataflow variable for a specific asset
  - `override_dataflow_variable_object(asset, variable_name, variable_value)` -> `bool` [classmethod] — Override an Unreal Object dataflow variable for a specific asset
  - `override_dataflow_variable_object_array(asset, variable_name, variable_array_value)` -> `bool` [classmethod] — Override an Unreal Object Array dataflow variable for a specific asset
  - `regenerate_asset_from_dataflow(asset_to_regenerate, regenerate_dependent_assets = False)` -> `bool` [classmethod] — Regenerate an asset using its corresponding dataflow

### `unreal.DataflowDebugDrawComponent`
Inherits: `DebugDrawComponent` | Header: `DataflowDebugDrawComponent.h`

Dataflow Debug Draw Component

### `unreal.DataflowDebugDrawRenderType`
Inherits: `EnumBase` | Header: `DataflowDebugDraw.h`

EDataflow Debug Draw Render Type

**Properties** (2):
  - `SHADED`: `DataflowDebugDrawRenderType = Ellipsis` — 1
  - `WIREFRAME`: `DataflowDebugDrawRenderType = Ellipsis` — 0

### `unreal.DataflowType`
Inherits: `EnumBase` | Header: `DataflowObject.h`

Data flow types

**Properties** (2):
  - `CONSTRUCTION`: `DataflowType = Ellipsis` — the dataflow will be used to build assets 0
  - `SIMULATION`: `DataflowType = Ellipsis` — The dataflow will be used to define the simulation evolution 1
