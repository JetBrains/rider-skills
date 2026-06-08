# UE Python API — NearestNeighborModelEditor Module

**6 types** from the `NearestNeighborModelEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `NearestNeighborKMeansInputData`, `NearestNeighborAnimStream`, `NearestNeighborGeometryCacheStream`, `NearestNeighborKMeansData`, `NearestNeighborStatsData`, `NearestNeighborTrainingModel`

---

## Classes

### `unreal.NearestNeighborKMeansInputData`
Inherits: `StructBase` | Header: `NearestNeighborKMeansTool.h`

Nearest Neighbor KMeans Input Data

**Properties** (3):
  - `cache`: `GeometryCache` [Read-Only] — [Read-Only] (GeometryCache)
  - `must_include_frames`: `None` [Read-Only] — [Read-Only] (Array[int32])
  - `poses`: `AnimSequence` [Read-Only] — [Read-Only] (AnimSequence)

### `unreal.NearestNeighborAnimStream`
Inherits: `Object` | Header: `NearestNeighborEditorHelpers.h`

Nearest Neighbor Anim Stream

**Methods** (4):
  - `append_frames(anim, frames)` -> `bool` — Append Frames
  - `init(skeleton)` -> `None` — Init
  - `is_valid()` -> `bool` — Is Valid
  - `to_anim(out_anim)` -> `bool` — To Anim

### `unreal.NearestNeighborGeometryCacheStream`
Inherits: `Object` | Header: `NearestNeighborEditorHelpers.h`

Nearest Neighbor Geometry Cache Stream

**Methods** (4):
  - `append_frames(cache, frames)` -> `bool` — Append Frames
  - `init(template_cache)` -> `None` — Init
  - `is_valid()` -> `bool` — Is Valid
  - `to_geometry_cache(out_cache)` -> `bool` — To Geometry Cache

### `unreal.NearestNeighborKMeansData`
Inherits: `Object` | Header: `NearestNeighborKMeansTool.h`

Nearest Neighbor KMeans Data

**Properties** (6):
  - `extract_geometry_cache`: `bool` [Read-Only] — [Read-Only] Whether to extract geometry cache at the same time. (bool)
  - `extracted_cache`: `GeometryCache` [Read-Only] — [Read-Only] Extracted geometry cache. (GeometryCache)
  - `extracted_poses`: `AnimSequence` [Read-Only] — [Read-Only] Extracted poses. (AnimSequence)
  - `inputs`: `None` [Read-Only] — [Read-Only] (Array[NearestNeighborKMeansInputData])
  - `num_clusters`: `int` [Read-Only] — [Read-Only] Number of clusters to be generated. (int32)
  - `section_index`: `int` [Read-Only] — [Read-Only] Section used to generate clustered poses. (int32)

### `unreal.NearestNeighborStatsData`
Inherits: `Object` | Header: `NearestNeighborStatsTool.h`

Nearest Neighbor Stats Data

**Properties** (2):
  - `section_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `test_anim`: `AnimSequence` [Read-Only] — [Read-Only] (AnimSequence)

### `unreal.NearestNeighborTrainingModel`
Inherits: `MLDeformerGeomCacheTrainingModel` | Header: `NearestNeighborTrainingModel.h`

Nearest Neighbor Training Model

**Methods** (15):
  - `create_model_instance()` -> `NearestNeighborModelInstance` — Create Model Instance
  - `custom_sample(frame)` -> `bool` — Custom Sample
  - `destroy_model_instance(model_instance)` -> `None` — Destroy Model Instance
  - `get_mesh_index_buffer()` -> `Array [ int32 ]` — Get Mesh Index Buffer
  - `get_model_skeleton(model)` -> `Skeleton` — Get Model Skeleton
  - `get_nearest_neighbor_model()` -> `NearestNeighborModel` — Get Nearest Neighbor Model
  - `get_neighbor_stats(stats_data)` -> `bool` — Get Neighbor Stats
  - `get_num_frames_anim_sequence(anim)` -> `int32` — Get Num Frames Anim Sequence
  - `get_num_frames_geometry_cache(geometry_cache)` -> `int32` — Get Num Frames Geometry Cache
  - `get_unskinned_vertex_positions()` -> `Array [ float ]` — Get Unskinned Vertex Positions
  - `kmeans_cluster_poses(k_means_data)` -> `int32` — Kmeans Cluster Poses
  - `set_custom_sampler_data(anim, cache = None)` -> `bool` — Set Custom Sampler Data
  - `set_custom_sampler_data_from_section(section_index)` -> `bool` — Set Custom Sampler Data from Section
  - `train()` -> `int32` — Train
  - `update_nearest_neighbor_data()` -> `int32` — Update Nearest Neighbor Data

**Properties** (2):
  - `custom_sampler_bone_rotations`: `None` [Read-Only] — [Read-Only] (Array[float])
  - `custom_sampler_deltas`: `None` [Read-Only] — [Read-Only] (Array[float])
