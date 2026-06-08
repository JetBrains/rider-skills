# UE Python API — ChaosClothAssetDataflowNodes Module

**5 types** from the `ChaosClothAssetDataflowNodes` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ChaosClothAssetMaxNumInfluences`, `ChaosClothAssetRemeshMethod`, `ChaosClothAssetTransferRenderMeshSource`, `ChaosClothAssetTransferSkinWeightsMethod`, `ChaosClothAssetTransferTargetMeshType`

---

## Classes

### `unreal.ChaosClothAssetMaxNumInfluences`
Inherits: `EnumBase` | Header: `TransferSkinWeightsNode.h`

EChaos Cloth Asset Max Num Influences

**Properties** (3):
  - `EIGHT`: `ChaosClothAssetMaxNumInfluences = Ellipsis` — 8
  - `FOUR`: `ChaosClothAssetMaxNumInfluences = Ellipsis` — 4
  - `TWELVE`: `ChaosClothAssetMaxNumInfluences = Ellipsis` — 12

### `unreal.ChaosClothAssetRemeshMethod`
Inherits: `EnumBase` | Header: `RemeshNode.h`

EChaos Cloth Asset Remesh Method

**Properties** (2):
  - `REMESH`: `ChaosClothAssetRemeshMethod = Ellipsis` — 0
  - `SIMPLIFY`: `ChaosClothAssetRemeshMethod = Ellipsis` — 1

### `unreal.ChaosClothAssetTransferRenderMeshSource`
Inherits: `EnumBase` | Header: `TransferSkinWeightsNode.h`

EChaos Cloth Asset Transfer Render Mesh Source

**Properties** (2):
  - `SIMULATION_MESH`: `ChaosClothAssetTransferRenderMeshSource = Ellipsis` — For render mesh, transfer weights from the Collection input sim mesh, or Sim Collection input if con...
  - `SKELETAL_MESH`: `ChaosClothAssetTransferRenderMeshSource = Ellipsis` — For render mesh, transfer weights from the source Skeletal Mesh. 0

### `unreal.ChaosClothAssetTransferSkinWeightsMethod`
Inherits: `EnumBase` | Header: `TransferSkinWeightsNode.h`

EChaos Cloth Asset Transfer Skin Weights Method

**Properties** (2):
  - `CLOSEST_POINT_ON_SURFACE`: `ChaosClothAssetTransferSkinWeightsMethod = Ellipsis` — For every vertex on the target mesh, find the closest point on the surface of the source mesh and co...
  - `INPAINT_WEIGHTS`: `ChaosClothAssetTransferSkinWeightsMethod = Ellipsis` — For every vertex on the target mesh, find the closest point on the surface of the source mesh.
If th...

### `unreal.ChaosClothAssetTransferTargetMeshType`
Inherits: `EnumBase` | Header: `TransferSkinWeightsNode.h`

EChaos Cloth Asset Transfer Target Mesh Type

**Properties** (3):
  - `ALL`: `ChaosClothAssetTransferTargetMeshType = Ellipsis` — Perform the skin weights transfer for both the simulation and render meshes. 0
  - `RENDER`: `ChaosClothAssetTransferTargetMeshType = Ellipsis` — Perform the skin weights transfer for the render mesh only. 2
  - `SIMULATION`: `ChaosClothAssetTransferTargetMeshType = Ellipsis` — Perform the skin weights transfer for the simulation mesh only. 1
