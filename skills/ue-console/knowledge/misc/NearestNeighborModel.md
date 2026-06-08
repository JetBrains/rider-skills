# UE Python API — NearestNeighborModel Module

**11 types** from the `NearestNeighborModel` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ClothPartData`, `NearestNeighborModel`, `NearestNeighborModelInstance`, `NearestNeighborModelSection`, `NearestNeighborNetworkLayer`, `NearestNeighborNetworkLayer_Gemm`, `NearestNeighborNetworkLayer_Gemm_Prelu`, `NearestNeighborOptimizedNetwork`, `NearestNeighborOptimizedNetworkLoader`, `OptimusSkeletonWithQuatsDataProvider`, `NearestNeighborModelSectionWeightMapCreationMethod`

---

## Classes

### `unreal.ClothPartData`
Inherits: `StructBase` | Header: `NearestNeighborModel.h`

Cloth Part Data

### `unreal.NearestNeighborModel`
Inherits: `MLDeformerMorphModel` | Header: `NearestNeighborModel.h`

The nearest neighbor model. This model contains the linear basis of the vertex deltas and a small set of meshes for nearest neighbor search. Given a new pose, the pre-trained neural network first pred...

**Methods** (20):
  - `does_use_pca()` -> `bool` — Does Use PCA
  - `get_batch_size()` -> `int32` — Get Batch Size
  - `get_cached_deltas_paths()` -> `Array [ str ]` — Get Cached Deltas Paths
  - `get_cached_network_paths()` -> `Array [ str ]` — Get Cached Network Paths
  - `get_cached_pca_paths()` -> `Array [ str ]` — Get Cached PCAPaths
  - `get_early_stop_epochs()` -> `int32` — Get Early Stop Epochs
  - `get_hidden_layer_dims()` -> `Array [ int32 ]` — Get Hidden Layer Dims
  - `get_input_dim()` -> `int32` — Get Input Dim
  - `get_learning_rate()` -> `float` — Get Learning Rate
  - `get_model_dir()` -> `str` — Get Model Dir
  - `get_num_iterations()` -> `int32` — Get Num Iterations
  - `get_num_sections()` -> `int32` — ~END UMLDeformerModel overrides.
  - `get_output_dim()` -> `int32` — Get Output Dim
  - `get_pca_coeff_starts()` -> `Array [ int32 ]` — Get PCACoeff Starts
  - `get_regularization_factor()` -> `float` — Get Regularization Factor
  - `get_section_ptr(index)` -> `NearestNeighborModelSection` — GetSectionPtr is reserved for python. Use GetSection for C++.
  - `get_smooth_loss_beta()` -> `float` — Get Smooth Loss Beta
  - `get_total_num_basis()` -> `int32` — Get Total Num Basis
  - `is_ready_for_inference()` -> `bool` — Is Ready for Inference
  - `is_ready_for_training()` -> `bool` — Is Ready for Training

**Properties** (23):
  - `batch_size`: `int` — [Read-Write] Number of data samples processed together as a group in a single pass. (int32)
  - `decay_factor`: `float` — [Read-Write] The ratio of previous frame deltas added into the current frame deltas. A bigger value ...
  - `early_stop_epochs`: `int` — [Read-Write] The number of epochs to stop training if there is no improvement in accuracy. (int32)
  - `file_cache_directory`: `str` [Read-Only] — [Read-Only] Directory to save the intermediate results. (str)
  - `hidden_layer_dims`: `None` — [Read-Write] Dimension of hidden layers in the network. This cannot be empty. (Array[int32])
  - `input_dim`: `int` [Read-Only] — [Read-Only] Network input dimensions. (int32)
  - `input_multipliers`: `None` — [Read-Write] Values to be multiplied to the input. This can be used to debug bad network input. (Arr...
  - `inputs_max`: `None` — [Read-Write] The max input values observed throughout the entire training set. This is used to clamp...
  - `inputs_min`: `None` — [Read-Write] The min input values observed throughout the entire training set. This is used to clamp...
  - `learning_rate`: `float` — [Read-Write] The size of the step when optimizing the network. (float)
  - `nearest_neighbor_offset_weight`: `float` — [Read-Write] The weight multiplied to nearest neighbor deltas. A value of 0 means completely removin...
  - `num_basis_per_section`: `int` — [Read-Write] The number of basis used in each section. (int32)
  - `num_epochs`: `int` — [Read-Write]
deprecated: NumEpochs is deprecated. Convert to NumIterations instead. (int32)
  - `num_iterations`: `int` — [Read-Write] The number of iterations to train the model for. (int32)
  - `output_dim`: `int` [Read-Only] — [Read-Only] Network output dimensions. (int32)
  - `rbf_sigma`: `float` — [Read-Write] Range to blend nearest neighbors. A bigger range will blend more neighbors, produce smo...
  - `regularization_factor`: `float` — [Read-Write] The regularization factor. Higher values can help generate more sparse morph targets, b...
  - `smooth_loss_beta`: `float` — [Read-Write] The beta parameter in the smooth L1 loss function, which describes below which absolute...
  - `use_dual_quaternion_deltas`: `bool` — [Read-Write] Whether to use dual quaternion deltas. If false, LBS deltas will be used. (bool)
  - `use_file_cache`: `bool` — failing to manually clear caches could cause unexpected results. (bool) [Read-Write] Whether to cach...
  - `use_input_multipliers`: `bool` — [Read-Write] Whether to use input multipliers. This can be used to debug bad network input. (bool)
  - `use_pca`: `bool` — [Read-Write] Whether to use pre-computed PCA basis. If false, basis will be learned at training time...
  - `use_rbf`: `bool` — [Read-Write] Whether to use radial basis function to blend multiple nearest neighbors to produce smo...

### `unreal.NearestNeighborModelInstance`
Inherits: `MLDeformerMorphModelInstance` | Header: `NearestNeighborModelInstance.h`

Nearest Neighbor Model Instance

**Methods** (2):
  - `eval(input_data)` -> `Array [ float ]` — This is the slow version of network inference. It is used by python.
  - `reset()` -> `None` — ~END UMLDeformerModelInstance overrides

### `unreal.NearestNeighborModelSection`
Inherits: `Object` | Header: `NearestNeighborModel.h`

The section of the nearest neighbor model. Each section contains a set of vertices in the original skeletal mesh. The nearest neighbor search is performed on each section separately. For example, if a...

**Methods** (10):
  - `does_use_pca()` -> `bool` — Does Use PCA
  - `get_asset_neighbor_coeffs()` -> `Array [ float ]` — Get Asset Neighbor Coeffs
  - `get_asset_num_neighbors()` -> `int32` — Get Asset Num Neighbors
  - `get_basis()` -> `Array [ float ]` — Get Basis
  - `get_num_basis()` -> `int32` — Get Num Basis
  - `get_vertex_map()` -> `Array [ int32 ]` — Get Vertex Map
  - `get_vertex_mean()` -> `Array [ float ]` — Get Vertex Mean
  - `get_vertex_weights()` -> `Array [ float ]` — Get Vertex Weights
  - `set_basis_data(vertex_mean, basis)` -> `None` — Set Basis Data
  - `set_neighbor_data(neighbor_coeffs, neighbor_offsets)` -> `None` — Set Neighbor Data

**Properties** (3):
  - `num_pca_coeffs`: `int` — rename to NumBasis (int32) [Read-Write] Number of PCA coefficients for this section. // TODO
  - `num_vertices`: `int` [Read-Only] — [Read-Only] Number of vertices in this section (int32)
  - `runtime_num_neighbors`: `int` [Read-Only] — [Read-Only] Number of neighbors in this section after excluding frames (int32)

### `unreal.NearestNeighborNetworkLayer`
Inherits: `Object` | Header: `NearestNeighborOptimizedNetwork.h`

Nearest Neighbor Network Layer

**Properties** (2):
  - `num_inputs`: `int` — [Read-Write] (int32)
  - `num_outputs`: `int` — [Read-Write] (int32)

### `unreal.NearestNeighborNetworkLayer_Gemm`
Inherits: `NearestNeighborNetworkLayer` | Header: `NearestNeighborOptimizedNetwork.h`

Nearest Neighbor Network Layer Gemm

### `unreal.NearestNeighborNetworkLayer_Gemm_Prelu`
Inherits: `NearestNeighborNetworkLayer` | Header: `NearestNeighborOptimizedNetwork.h`

Nearest Neighbor Network Layer Gemm Prelu

### `unreal.NearestNeighborOptimizedNetwork`
Inherits: `Object` | Header: `NearestNeighborOptimizedNetwork.h`

The specialized neural network for the MLDeformerModel. This class is used to do inference at runtime at a higher performance than using UNeuralNetwork.

**Methods** (1):
  - `empty()` -> `None` — Clear the network, getting rid of all layers.

**Properties** (1):
  - `layers`: `None` — [Read-Write]
deprecated: Network format changed. (Array[NearestNeighborNetworkLayer])

### `unreal.NearestNeighborOptimizedNetworkLoader`
Inherits: `Object` | Header: `NearestNeighborOptimizedNetworkLoader.h`

Helper class to load the optimized network from disk. LoadOptimizedNetwork is implemented in python.

**Methods** (2):
  - `get_optimized_network()` -> `NearestNeighborOptimizedNetwork` — Get Optimized Network
  - `load_optimized_network(onnx_path)` -> `bool` — Load Optimized Network

### `unreal.OptimusSkeletonWithQuatsDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceSkeletonWithQuats.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (1):
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.NearestNeighborModelSectionWeightMapCreationMethod`
Inherits: `EnumBase` | Header: `NearestNeighborModel.h`

ENearest Neighbor Model Section Weight Map Creation Method

**Properties** (4):
  - `EXTERNAL_TXT`: `NearestNeighborModelSectionWeightMapCreationMethod = Ellipsis` — Using an external .txt file 3
  - `FROM_TEXT`: `NearestNeighborModelSectionWeightMapCreationMethod = Ellipsis` — Include all vertices from text with weight 1. 0
  - `SELECTED_BONES`: `NearestNeighborModelSectionWeightMapCreationMethod = Ellipsis` — Use skinning weights from selected bones. 1
  - `VERTEX_ATTRIBUTES`: `NearestNeighborModelSectionWeightMapCreationMethod = Ellipsis` — Use weights from a vertex attribute. 2
