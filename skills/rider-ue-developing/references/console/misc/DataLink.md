# UE Python API — DataLink Module

**10 types** from the `DataLink` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataLinkInstance`, `DataLinkScriptPin`, `DataLinkString`, `DataLinkGraph`, `DataLinkRequestProxy`, `DataLinkScriptNode`, `DataLinkSinkObject`, `DataLinkSinkProvider`, `DataLinkExecutionResult`, `OnDataLinkRequestComplete`

---

## Classes

### `unreal.DataLinkInstance`
Inherits: `StructBase` | Header: `DataLinkInstance.h`

Instance of a data link to be executed

**Properties** (2):
  - `data_link_graph`: `DataLinkGraph` — [Read-Write] The data link graph to execute (DataLinkGraph)
  - `input_data`: `None` — [Read-Write] The initial input data to feed into the data link graph (Array[InstancedStruct])

### `unreal.DataLinkScriptPin`
Inherits: `StructBase` | Header: `DataLinkScriptNode.h`

Data Link Script Pin

### `unreal.DataLinkString`
Inherits: `StructBase` | Header: `DataLinkCoreTypes.h`

Data Link String

**Properties** (1):
  - `value`: `str` — [Read-Write] (str)

### `unreal.DataLinkGraph`
Inherits: `Object` | Header: `DataLinkGraph.h`

Data Link Graph

### `unreal.DataLinkRequestProxy`
Inherits: `Object` | Header: `DataLinkRequestProxy.h`

Data Link Request Proxy

**Properties** (1):
  - `on_request_complete`: `OnDataLinkRequestComplete` — [Read-Write] (OnDataLinkRequestComplete)

### `unreal.DataLinkScriptNode`
Inherits: `Object` | Header: `DataLinkScriptNode.h`

Script Nodes are a Blueprint Implementation of a Data Link Node. It does not inherit from UDataLinkNode, as the wrapper does this and forwards the logic execution here. This is done to allow for bluep...

**Methods** (4):
  - `fail()` -> `None` — Called to fail execution
  - `get_input_data(input_name)` -> `InstancedStruct or None` — Retrieves the input data as an Instanced Struct
  - `on_execute()` -> `None` — On Execute
  - `succeed(output_data)` -> `bool` — Called to move to the next node to execute (or finish if last node) providing the output data as an instanced struct

### `unreal.DataLinkSinkObject`
Inherits: `Object` | Header: `DataLinkSinkObject.h`

Data Link Sink Object

**Methods** (2):
  - `get_sink_object()` -> `DataLinkSinkObject` — Get Sink Object
  - `reset_sink()` -> `None` — Reset Sink

### `unreal.DataLinkSinkProvider`
Inherits: `Interface` | Header: `IDataLinkSinkProvider.h`

Data Link Sink Provider

**Methods** (1):
  - `get_sink_object()` -> `DataLinkSinkObject` — Get Sink Object

### `unreal.DataLinkExecutionResult`
Inherits: `EnumBase` | Header: `DataLinkEnums.h`

EData Link Execution Result

**Properties** (2):
  - `FAILED`: `DataLinkExecutionResult = Ellipsis` — 0
  - `SUCCEEDED`: `DataLinkExecutionResult = Ellipsis` — 1

### `unreal.OnDataLinkRequestComplete`
Inherits: `MulticastDelegateBase` | Header: `DataLinkRequestProxy.h`

On Data Link Request Complete Delegate Signature
