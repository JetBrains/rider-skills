# UE Python API — AlembicLibrary Module

**14 types** from the `AlembicLibrary` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AbcCompressionSettings`, `AbcConversionSettings`, `AbcGeometryCacheSettings`, `AbcMaterialSettings`, `AbcNormalGenerationSettings`, `AbcSamplingSettings`, `AbcStaticMeshSettings`, `AbcAssetImportData`, `AbcImportSettings`, `AbcConversionPreset`, `AbcGeometryCacheMotionVectorsImport`, `AlembicImportType`, `AlembicSamplingType`, `BaseCalculationType`

---

## Classes

### `unreal.AbcCompressionSettings`
Inherits: `StructBase` | Header: `AbcImportSettings.h`

Abc Compression Settings

**Properties** (6):
  - `bake_matrix_animation`: `bool` — [Read-Write] Whether or not Matrix-only animation should be baked out as vertex animation (or skippe...
  - `base_calculation_type`: `BaseCalculationType` — [Read-Write] Determines how the final number of bases that are stored as morph targets are calculate...
  - `max_number_of_bases`: `int` — [Read-Write] Will generate given fixed number of bases as morph targets (int32)
  - `merge_meshes`: `bool` — [Read-Write] Whether or not the individual meshes should be merged for compression purposes (bool)
  - `minimum_number_of_vertex_influence_percentage`: `float` — [Read-Write] Minimum percentage of influenced vertices required for a morph target to be valid (floa...
  - `percentage_of_total_bases`: `float` — [Read-Write] Will generate given percentage of the given bases as morph targets (float)

### `unreal.AbcConversionSettings`
Inherits: `StructBase` | Header: `AbcImportSettings.h`

Abc Conversion Settings

**Properties** (5):
  - `flip_u`: `bool` — [Read-Write] Flag whether or not to flip the U channel in the Texture Coordinates (bool)
  - `flip_v`: `bool` — [Read-Write] Flag whether or not to flip the V channel in the Texture Coordinates (bool)
  - `preset`: `AbcConversionPreset` — [Read-Write] Currently preset that should be applied (AbcConversionPreset)
  - `rotation`: `Vector` — [Read-Write] Rotation in Euler angles that should be applied (Vector)
  - `scale`: `Vector` — [Read-Write] Scale value that should be applied (Vector)

### `unreal.AbcGeometryCacheSettings`
Inherits: `StructBase` | Header: `AbcImportSettings.h`

Abc Geometry Cache Settings

**Properties** (7):
  - `apply_constant_topology_optimizations`: `bool` — [Read-Write] Force the preprocessor to only do optimization once instead of when the preprocessor de...
  - `compressed_position_precision`: `float` — [Read-Write] Precision used for compressing vertex positions (lower = better result but less compres...
  - `compressed_texture_coordinates_number_of_bits`: `int` — [Read-Write] Bit-precision used for compressing texture coordinates (hight = better result but less ...
  - `flatten_tracks`: `bool` — [Read-Write] Whether or not to merge all vertex animation into one track (bool)
  - `motion_vectors`: `AbcGeometryCacheMotionVectorsImport` — [Read-Write] (AbcGeometryCacheMotionVectorsImport)
  - `optimize_index_buffers`: `bool` — [Read-Write] Optimizes index buffers for each unique frame, to allow better cache coherency on the G...
  - `store_imported_vertex_numbers`: `bool` — [Read-Write] Store the imported vertex numbers. This lets you know the vertex numbers inside the DCC...

### `unreal.AbcMaterialSettings`
Inherits: `StructBase` | Header: `AbcImportSettings.h`

Abc Material Settings

**Properties** (2):
  - `create_materials`: `bool` — [Read-Write] Whether or not to create materials according to found Face Set names (will not work wit...
  - `find_materials`: `bool` — [Read-Write] Whether or not to try and find materials according to found Face Set names (will not wo...

### `unreal.AbcNormalGenerationSettings`
Inherits: `StructBase` | Header: `AbcImportSettings.h`

Abc Normal Generation Settings

**Properties** (5):
  - `force_one_smoothing_group_per_object`: `bool` — [Read-Write] Whether or not to force smooth normals for each individual object rather than calculati...
  - `hard_edge_angle_threshold`: `float` — [Read-Write] Threshold used to determine whether an angle between two normals should be considered h...
  - `ignore_degenerate_triangles`: `bool` — [Read-Write] Determines whether or not the degenerate triangles should be ignored when calculating t...
  - `recompute_normals`: `bool` — [Read-Write] Determines whether or not the normals should be forced to be recomputed (bool)
  - `skip_computing_tangents`: `bool` — [Read-Write] Determines whether tangents are computed for GeometryCache. Skipping them can improve s...

### `unreal.AbcSamplingSettings`
Inherits: `StructBase` | Header: `AbcImportSettings.h`

Abc Sampling Settings

**Properties** (6):
  - `frame_end`: `int` — [Read-Write] Ending index to stop sampling the animation at (int32)
  - `frame_start`: `int` — [Read-Write] Starting index to start sampling the animation from (int32)
  - `frame_steps`: `int` — [Read-Write] Steps to take when sampling the animation (int32)
  - `sampling_type`: `AlembicSamplingType` — [Read-Write] Type of sampling performed while importing the animation (AlembicSamplingType)
  - `skip_empty`: `bool` — [Read-Write] Skip empty (pre-roll) frames and start importing at the frame which actually contains d...
  - `time_steps`: `float` — [Read-Write] Time steps to take when sampling the animation (float)

### `unreal.AbcStaticMeshSettings`
Inherits: `StructBase` | Header: `AbcImportSettings.h`

Abc Static Mesh Settings

**Properties** (3):
  - `generate_lightmap_u_vs`: `bool` — [Read-Write] Flag for whether or not lightmap UVs should be generated (bool)
  - `merge_meshes`: `bool` — [Read-Write] Whether or not to merge the static meshes on import (remember this can cause problems w...
  - `propagate_matrix_transformations`: `bool` — [Read-Write] This will, if applicable, apply matrix transformations to the meshes (bool)

### `unreal.AbcAssetImportData`
Inherits: `AssetImportData` | Header: `AbcAssetImportData.h`

Base class for import data and options used when importing any asset from Alembic

### `unreal.AbcImportSettings`
Inherits: `Object` | Header: `AbcImportSettings.h`

Class that contains all options for importing an alembic file

**Properties** (8):
  - `compression_settings`: `AbcCompressionSettings` — [Read-Write] (AbcCompressionSettings)
  - `conversion_settings`: `AbcConversionSettings` — [Read-Write] (AbcConversionSettings)
  - `geometry_cache_settings`: `AbcGeometryCacheSettings` — [Read-Write] (AbcGeometryCacheSettings)
  - `import_type`: `AlembicImportType` — [Read-Write] Type of asset to import from Alembic file (AlembicImportType)
  - `material_settings`: `AbcMaterialSettings` — [Read-Write] (AbcMaterialSettings)
  - `normal_generation_settings`: `AbcNormalGenerationSettings` — [Read-Write] (AbcNormalGenerationSettings)
  - `sampling_settings`: `AbcSamplingSettings` — [Read-Write] (AbcSamplingSettings)
  - `static_mesh_settings`: `AbcStaticMeshSettings` — [Read-Write] (AbcStaticMeshSettings)

### `unreal.AbcConversionPreset`
Inherits: `EnumBase` | Header: `AbcImportSettings.h`

Enum that describes type of asset to import

**Properties** (3):
  - `CUSTOM`: `AbcConversionPreset = Ellipsis` — 2
  - `MAX`: `AbcConversionPreset = Ellipsis` — Imports the Alembic file as flipbook and matrix animated objects 1
  - `MAYA`: `AbcConversionPreset = Ellipsis` — Imports only the first frame as one or multiple static meshes 0

### `unreal.AbcGeometryCacheMotionVectorsImport`
Inherits: `EnumBase` | Header: `AbcImportSettings.h`

EAbc Geometry Cache Motion Vectors Import

**Properties** (3):
  - `CALCULATE_MOTION_VECTORS_DURING_IMPORT`: `AbcGeometryCacheMotionVectorsImport = Ellipsis` — Force calculation of motion vectors during import. This will increase file size as the motion vector...
  - `IMPORT_ABC_VELOCITIES_AS_MOTION_VECTORS`: `AbcGeometryCacheMotionVectorsImport = Ellipsis` — Imports the Velocities from the Alembic file and converts them to motion vectors. This will increase...
  - `NO_MOTION_VECTORS`: `AbcGeometryCacheMotionVectorsImport = Ellipsis` — No motion vectors will be present in the geometry cache. 0

### `unreal.AlembicImportType`
Inherits: `EnumBase` | Header: `AbcImportSettings.h`

Enum that describes type of asset to import

**Properties** (3):
  - `GEOMETRY_CACHE`: `AlembicImportType = Ellipsis` — Imports the Alembic file as flipbook and matrix animated objects 1
  - `SKELETAL`: `AlembicImportType = Ellipsis` — Imports the Alembic file as a skeletal mesh containing base poses as morph targets and blending betw...
  - `STATIC_MESH`: `AlembicImportType = Ellipsis` — Imports only the first frame as one or multiple static meshes 0

### `unreal.AlembicSamplingType`
Inherits: `EnumBase` | Header: `AbcImportSettings.h`

EAlembic Sampling Type

**Properties** (3):
  - `PER_FRAME`: `AlembicSamplingType = Ellipsis` — Samples the animation according to the imported data (default) 0
  - `PER_TIME_STEP`: `AlembicSamplingType = Ellipsis` — Samples the animation at given intervals determined by Time Steps 2
  - `PER_X_FRAMES`: `AlembicSamplingType = Ellipsis` — Samples the animation at given intervals determined by Frame Steps 1

### `unreal.BaseCalculationType`
Inherits: `EnumBase` | Header: `AbcImportSettings.h`

EBase Calculation Type

**Properties** (3):
  - `FIXED_NUMBER`: `BaseCalculationType = Ellipsis` — Set a fixed number of bases to import 2
  - `NO_COMPRESSION`: `BaseCalculationType = Ellipsis` — One base per frame, uncompressed 3
  - `PERCENTAGE_BASED`: `BaseCalculationType = Ellipsis` — Determines the number of bases that should be used with the given percentage 1
