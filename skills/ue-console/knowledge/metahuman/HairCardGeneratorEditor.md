# UE Python API — HairCardGeneratorEditor Module

**6 types** from the `HairCardGeneratorEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `HairCardGen_GroomData`, `HairCardGen_StrandData`, `HairCardGenControllerBase`, `HairCardGeneratorGroupSettings`, `HairCardGeneratorPluginSettings`, `HairCardAtlasSize`

---

## Classes

### `unreal.HairCardGen_GroomData`
Inherits: `StructBase` | Header: `HairCardGenControllerBase.h`

With âGuideâ data stipped out (since it isnât used as part of the mesh generation algorithm)

**Properties** (6):
  - `basis_type`: `str` [Read-Only] — [Read-Only] (str)
  - `curve_type`: `str` [Read-Only] — [Read-Only] (str)
  - `hairline_group_id`: `int` [Read-Only] — [Read-Only] (int32)
  - `strands`: `None` [Read-Only] — [Read-Only] Array of index buffers. Each buffer defines a distinct hair strand in the groom. (Array[...
  - `vertex_positions`: `None` [Read-Only] — [Read-Only] Flattened Array of 3D vetex positions (Array[float])
  - `vertex_widths`: `None` [Read-Only] — [Read-Only] (Array[float])

### `unreal.HairCardGen_StrandData`
Inherits: `StructBase` | Header: `HairCardGenControllerBase.h`

struct FHairCardGenerationData;

**Properties** (1):
  - `group_id`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.HairCardGenControllerBase`
Inherits: `Object` | Header: `HairCardGenControllerBase.h`

Hair Card Gen Controller Base

**Methods** (15):
  - `check_cluster_textures(group_index)` -> `bool` — Check Cluster Textures
  - `cluster_textures(group_index)` -> `Array [ int32 ]` — Cluster Textures
  - `create_cards_static_mesh(static_mesh, verts, faces, normals, uvs, groups)` -> `None` — Helper C++ function for building a static mesh from verts/faces, etc.
  - `generate_cards_geometry()` -> `Array [ float ]` — Generate Cards Geometry
  - `generate_clumps(group_id)` -> `Array [ int32 ]` — Generate Clumps
  - `generate_mesh(static_mesh)` -> `bool` — Generate Mesh
  - `generate_texture_atlases(width_scale)` -> `bool` — Generate Texture Atlases
  - `generate_texture_layout()` -> `Array [ float ]` — Generate Texture Layout
  - `get_average_curve(id, cid)` -> `Array [ float ]` — Get Average Curve
  - `get_points_per_curve()` -> `int32` — Get Points Per Curve
  - `load_groom_data(groom_data, name, cached_grooms_path, save_cached)` -> `bool` — Load Groom Data
  - `load_settings(generator_settings)` -> `bool` — Load Settings
  - `set_interpolated_avg_curve(id, cid, points)` -> `None` — Set Interpolated Avg Curve
  - `set_optimizations(group_id)` -> `Array [ int32 ]` — Set Optimizations
  - `test_write_fbx_mesh()` -> `bool` — Test Write Fbx Mesh

### `unreal.HairCardGeneratorGroupSettings`
Inherits: `Object` | Header: `HairCardGeneratorPluginSettings.h`

Actual generation settings. Held in TArray, with strand filters applied to determine which settings apply to each strand (See FComposableStrandFilter).

**Properties** (14):
  - `apply_to_card_groups`: `None` [Read-Only] — [Read-Only] Specify which strands (card group ids) this settings group applies to (Set[Name])
  - `generate_filename`: `str` [Read-Only] — [Read-Only] (str)
  - `lod_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `max_number_of_flyaways`: `int` [Read-Only] — [Read-Only] Maximum number of cards to assign to flyaway strands (int32)
  - `max_vertical_segments_per_card`: `int` [Read-Only] — [Read-Only] Maximum number of segments along each card (aligned with the strands), ignored for adapt...
  - `number_of_textures_in_atlas`: `int` [Read-Only] — [Read-Only] Number of strand clump textures per atlas (int32)
  - `parent_name`: `str` [Read-Only] — [Read-Only] (str)
  - `strand_count`: `int` [Read-Only] — [Read-Only] (int32)
  - `strand_width_scaling_factor`: `float` [Read-Only] — [Read-Only] Scaling factor mapping strand-width to pixel-size for coverage texture (float)
  - `target_number_of_cards`: `int` [Read-Only] — [Read-Only] Total number of cards to generate for this settings group (int32)
  - `target_triangle_count`: `int` [Read-Only] — [Read-Only] Target number of triangles of the final mesh, only for adaptive subdivision (int32)
  - `use_adaptive_subdivision`: `bool` [Read-Only] — [Read-Only] Use adaptive subdivision when generating card geometry (bool)
  - `use_multi_card_clumps`: `bool` [Read-Only] — [Read-Only] Generate multiple cards (3) per strand clump to give the appearance of volume (bool)
  - `use_optimized_compression_factor`: `bool` [Read-Only] — [Read-Only] Compress textures along strand direction to save vertical redolution,
if strands are all...

### `unreal.HairCardGeneratorPluginSettings`
Inherits: `HairCardGenerationSettings` | Header: `HairCardGeneratorPluginSettings.h`

Self contained hair card generation settings. Separated/Duplicated from the groom asset to: (1) constrain the prompt windowâs details view, and (2) let the user modify it without mutating the origin...

**Properties** (26):
  - `atlas_size`: `HairCardAtlasSize` [Read-Only] — [Read-Only] Size of hair card texture atlases (HairCardAtlasSize)
  - `base_filename`: `str` [Read-Only] — [Read-Only] Base filename of generated mesh/texture assets (str)
  - `base_parent_name`: `str` [Read-Only] — [Read-Only] The base name of direct parent LOD level, used for resubdividing geometry or writing to ...
  - `card_group_ids`: `None` [Read-Only] — [Read-Only] (Array[Name])
  - `channel_layout`: `HairTextureLayout` [Read-Only] — This automatically pulls from group 0) (HairTextureLayout) [Read-Only] Texture layout selected (NOTE
  - `depth_maximum`: `float` [Read-Only] — [Read-Only] Maximum strand depth value (mapped to 1 in depth texture) (float)
  - `depth_minimum`: `float` [Read-Only] — [Read-Only] Minimum strand depth value (mapped to 0 in depth texture) (float)
  - `derived_texture_settings_name`: `str` [Read-Only] — [Read-Only] The base name of LOD from which texture info/outputs will be pulled (for writing to rese...
  - `filter_group_generation_settings`: `None` [Read-Only] — [Read-Only] (Array[HairCardGeneratorGroupSettings])
  - `generate_for_groom_group`: `int` [Read-Only] — [Read-Only] The groom group for which geometry will be generated (int32)
  - `generate_geometry_for_all_groups`: `bool` [Read-Only] — [Read-Only] Generate geometry for all groom groups on group 0 (bool)
  - `hair_widths`: `None` [Read-Only] — [Read-Only] (Array[float])
  - `intermediate_path`: `str` [Read-Only] — [Read-Only] (str)
  - `lod_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `output_path`: `str` [Read-Only] — [Read-Only] (str)
  - `override_hair_width`: `bool` [Read-Only] — [Read-Only] (bool)
  - `random_seed`: `int` [Read-Only] — [Read-Only] Seed value for pseudo-random number generation (set to a specific value for repeatable r...
  - `reduce_cards_from_previous_lod`: `bool` [Read-Only] — [Read-Only] Use previous LOD generated cards and textures but reduce triangle count and flyaways (bo...
  - `reserve_texture_space_lod`: `int` [Read-Only] — [Read-Only] Percentage of texture atlas space to reserve for higher LODs (int32)
  - `root_scales`: `None` [Read-Only] — [Read-Only] (Array[float])
  - `strand_filter_group_index_map`: `None` [Read-Only] — [Read-Only] (Array[int32])
  - `tip_scales`: `None` [Read-Only] — [Read-Only] (Array[float])
  - `use_groom_asset_strand_width`: `bool` [Read-Only] — [Read-Only] Use strand width (bool)
  - `use_reserved_space_from_previous_lod`: `bool` [Read-Only] — [Read-Only] Place new card textures in reserved space from previous LOD (bool)
  - `uv_smoothing_iterations`: `int` [Read-Only] — [Read-Only] Number of iterations for smoothing strand UVs (int32)
  - `version`: `str` [Read-Only] — [Read-Only] Static HCS version number to force regeneration on tool updates (str)

### `unreal.HairCardAtlasSize`
Inherits: `EnumBase` | Header: `HairCardGeneratorPluginSettings.h`

EHair Card Atlas Size

**Properties** (4):
  - `ATLAS_SIZE1024`: `HairCardAtlasSize = Ellipsis` — 10
  - `ATLAS_SIZE2048`: `HairCardAtlasSize = Ellipsis` — 11
  - `ATLAS_SIZE4096`: `HairCardAtlasSize = Ellipsis` — 12
  - `ATLAS_SIZE8192`: `HairCardAtlasSize = Ellipsis` — 13
