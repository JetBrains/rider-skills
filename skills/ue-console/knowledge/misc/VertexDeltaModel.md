# UE Python API — VertexDeltaModel Module

**3 types** from the `VertexDeltaModel` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VertexDeltaGraphDataProvider`, `VertexDeltaGraphDebugDataProvider`, `VertexDeltaModel`

---

## Classes

### `unreal.VertexDeltaGraphDataProvider`
Inherits: `ComputeDataProvider` | Header: `VertexDeltaGraphDataInterface.h`

Compute Framework Data Provider for MLDeformer data.

**Properties** (1):
  - `deformer_component`: `MLDeformerComponent` — [Read-Write] The deformer component that this data provider works on. (MLDeformerComponent)

### `unreal.VertexDeltaGraphDebugDataProvider`
Inherits: `ComputeDataProvider` | Header: `VertexDeltaGraphDebugDataInterface.h`

Compute Framework Data Provider for MLDeformer debugging data.

**Properties** (2):
  - `deformer_asset`: `MLDeformerAsset` — [Read-Write] (MLDeformerAsset)
  - `deformer_component`: `MLDeformerComponent` — [Read-Write] (MLDeformerComponent)

### `unreal.VertexDeltaModel`
Inherits: `MLDeformerGeomCacheModel` | Header: `VertexDeltaModel.h`

The vertex delta model, which uses a GPU based neural network. This model acts more as an example of how to implement a model that only uses the GPU. It is not as efficient as the Neural Morph Model, ...

**Properties** (5):
  - `batch_size`: `int` — [Read-Write] The number of frames per batch when training the model. (int32)
  - `learning_rate`: `float` — [Read-Write] The learning rate used during the model training. (float)
  - `num_hidden_layers`: `int` — [Read-Write] The number of hidden layers that the neural network model will have.nHigher numbers wil...
  - `num_iterations`: `int` — [Read-Write] The number of iterations to train the model for. (int32)
  - `num_neurons_per_layer`: `int` — [Read-Write] The number of units/neurons per hidden layer. Higher numbers will slow down performance...
