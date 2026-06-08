# UE Python API — GeneSplicerModule Module

**5 types** from the `GeneSplicerModule` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GenePoolAsset`, `GeneSplicerBP`, `PoolSpliceParams`, `RegionAffiliationAsset`, `SpliceData`

---

## Classes

### `unreal.GenePoolAsset`
Inherits: `Object` | Header: `GenePoolAsset.h`

Gene Pool Asset

**Methods** (1):
  - `get_dna_count()` -> `int32` — Get DNACount

### `unreal.GeneSplicerBP`
Inherits: `BlueprintFunctionLibrary` | Header: `GeneSplicerBP.h`

Gene Splicer BP

**Methods** (3):
  - `create_archetype(dna_folder_path, raf_asset, archetype_output_path)` -> `bool` [classmethod] — Create Archetype
  - `create_gene_pool(dna_folder_path, archtype_path, gene_pool_output_path)` -> `bool` [classmethod] — Create Gene Pool
  - `splice(splice_data)` -> `None` [classmethod] — Splice

### `unreal.PoolSpliceParams`
Inherits: `Object` | Header: `PoolSpliceParamsBP.h`

Pool Splice Params

**Methods** (5):
  - `get_dna_count()` -> `int32` — Get DNACount
  - `get_region_count()` -> `int32` — Get Region Count
  - `get_region_names()` -> `Array [ str ]` — Get Region Names
  - `register_to_splice_data(splice_data, name, gene_pool_asset, raf)` -> `None` — Register to Splice Data
  - `set_splice_weights(dna_start_index, weights)` -> `None` — Set Splice Weights

### `unreal.RegionAffiliationAsset`
Inherits: `Object` | Header: `RegionAffiliationAsset.h`

Region Affiliation Asset

**Methods** (2):
  - `get_region_count()` -> `int32` — Get Region Count
  - `get_region_name(region_index)` -> `str` — Get Region Name

### `unreal.SpliceData`
Inherits: `Object` | Header: `SpliceDataBP.h`

Splice Data

**Methods** (5):
  - `get_skeletal_mesh_component()` -> `SkeletalMeshComponent` — Get Skeletal Mesh Component
  - `register_gene_pool(name, gene_pool_asset, raf)` -> `None` — Register Gene Pool
  - `set_archetype(path)` -> `None` — Set Archetype
  - `set_skeletal_mesh_component(new_skel_mesh_component)` -> `None` — Set Skeletal Mesh Component
  - `set_splice_weights(name, dna_start_index, weights)` -> `None` — Set Splice Weights
