# UE Python API — GeometryCollectionDepNodes Module

**3 types** from the `GeometryCollectionDepNodes` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataflowTransferNodeBoundingVolume`, `DataflowTransferNodeFalloff`, `DataflowTransferNodeSampleScale`

---

## Classes

### `unreal.DataflowTransferNodeBoundingVolume`
Inherits: `EnumBase` | Header: `GeometryCollectionTransferVertexScalarAttributeDepNode.h`

EDataflow Transfer Node Bounding Volume

**Properties** (2):
  - `DATAFLOW_TRANSFER_TRIANGLE`: `DataflowTransferNodeBoundingVolume = Ellipsis` — Bounding volume on triangles of the source triangle mesh 1
  - `DATAFLOW_TRANSFER_VERTEX`: `DataflowTransferNodeBoundingVolume = Ellipsis` — Bounding volume on vertices of the source triangle mesh 0

### `unreal.DataflowTransferNodeFalloff`
Inherits: `EnumBase` | Header: `GeometryCollectionTransferVertexScalarAttributeDepNode.h`

EDataflow Transfer Node Falloff

**Properties** (3):
  - `DATAFLOW_TRANSFER_LINEAR`: `DataflowTransferNodeFalloff = Ellipsis` — Linear falloff based on distance from triangle 1
  - `DATAFLOW_TRANSFER_NONE`: `DataflowTransferNodeFalloff = Ellipsis` — No distance falloff 2
  - `DATAFLOW_TRANSFER_SQUARED`: `DataflowTransferNodeFalloff = Ellipsis` — Squared falloff based on distance from triangle 0

### `unreal.DataflowTransferNodeSampleScale`
Inherits: `EnumBase` | Header: `GeometryCollectionTransferVertexScalarAttributeDepNode.h`

EDataflow Transfer Node Sample Scale

**Properties** (3):
  - `DATAFLOW_TRANSFER_ASSET_BOUND`: `DataflowTransferNodeSampleScale = Ellipsis` — Bounding volume hierarchy cell size based on max length of the bounding box of the whole asset 2
  - `DATAFLOW_TRANSFER_ASSET_EDGE`: `DataflowTransferNodeSampleScale = Ellipsis` — Bounding volume hierarchy cell size based on max edge length of the whole asset 1
  - `DATAFLOW_TRANSFER_COMPONENT_EDGE`: `DataflowTransferNodeSampleScale = Ellipsis` — Bounding volume hierarchy cell size based on max edge length of each geometry group 0
