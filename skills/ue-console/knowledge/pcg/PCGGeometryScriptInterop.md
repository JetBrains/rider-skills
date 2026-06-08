# UE Python API — PCGGeometryScriptInterop Module

**21 types** from the `PCGGeometryScriptInterop` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PCGAppendMeshesFromPointsSettings`, `PCGBooleanOperationSettings`, `PCGCreateEmptyDynamicMeshSettings`, `PCGDynamicMeshBaseSettings`, `PCGDynamicMeshData`, `PCGDynamicMeshManagedComponent`, `PCGDynamicMeshTransformSettings`, `PCGGeometryBlueprintElement`, `PCGGetDynamicMeshDataSettings`, `PCGMergeDynamicMeshesSettings`, `PCGMeshSamplerSettings`, `PCGPrimitiveCrossSectionSettings`, `PCGSaveDynamicMeshToAssetSettings`, `PCGSpawnDynamicMeshSettings`, `PCGSplineToMeshSettings`, `PCGStaticMeshToDynamicMeshSettings`, `PCGAppendMeshesFromPointsMode`, `PCGBooleanOperationMode`, `PCGBooleanOperationTagInheritanceMode`, `PCGColorChannel`, ... (21 total)

---

## Classes

### `unreal.PCGAppendMeshesFromPointsSettings`
Inherits: `PCGDynamicMeshBaseSettings` | Header: `PCGAppendMeshesFromPoints.h`

Append meshes at the points transforms. Mesh can be a single static mesh, multiple meshes coming from the points or another dynamic mesh.

**Properties** (7):
  - `extract_materials`: `bool` — [Read-Write] Allows to extract materials from the static mesh and set them in the resulting append. ...
  - `mesh_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `mode`: `PCGAppendMeshesFromPointsMode` — [Read-Write] (PCGAppendMeshesFromPointsMode)
  - `requested_lod_index`: `int` — [Read-Write] (int32)
  - `requested_lod_type`: `GeometryScriptLODType` — [Read-Write] LOD type to use when creating DynamicMesh from specified StaticMesh. (GeometryScriptLOD...
  - `static_mesh`: `StaticMesh` — [Read-Write] (StaticMesh)
  - `synchronous_load`: `bool` — [Read-Write] (bool)

### `unreal.PCGBooleanOperationSettings`
Inherits: `PCGDynamicMeshBaseSettings` | Header: `PCGBooleanOperation.h`

Do a boolean operation between dynamic meshes.

**Properties** (4):
  - `boolean_operation`: `GeometryScriptBooleanOperation` — [Read-Write] (GeometryScriptBooleanOperation)
  - `boolean_operation_options`: `GeometryScriptMeshBooleanOptions` — [Read-Write] (GeometryScriptMeshBooleanOptions)
  - `mode`: `PCGBooleanOperationMode` — [Read-Write] (PCGBooleanOperationMode)
  - `tag_inheritance_mode`: `PCGBooleanOperationTagInheritanceMode` — [Read-Write] (PCGBooleanOperationTagInheritanceMode)

### `unreal.PCGCreateEmptyDynamicMeshSettings`
Inherits: `PCGDynamicMeshBaseSettings` | Header: `PCGCreateEmptyDynamicMesh.h`

Create an empty dynamic mesh data.

### `unreal.PCGDynamicMeshBaseSettings`
Inherits: `PCGSettings` | Header: `PCGDynamicMeshBaseElement.h`

Base class for Dynamic Mesh nodes

### `unreal.PCGDynamicMeshData`
Inherits: `PCGSpatialData` | Header: `PCGDynamicMeshData.h`

PCGDynamic Mesh Data

**Methods** (2):
  - `k2_initialize(mesh, materials, can_take_ownership = False)` -> `None` — Initialize the dynamic mesh data from an input dynamic mesh object. If the input dynamic mesh is not meant to be re-used...
  - `set_materials(materials)` -> `None` — Set Materials

**Properties** (2):
  - `dynamic_mesh`: `DynamicMesh` [Read-Only] — [Read-Only] (DynamicMesh)
  - `materials`: `None` [Read-Only] — [Read-Only] (Array[MaterialInterface])

### `unreal.PCGDynamicMeshManagedComponent`
Inherits: `PCGManagedComponent` | Header: `PCGDynamicMeshManagedComponent.h`

PCGDynamic Mesh Managed Component

### `unreal.PCGDynamicMeshTransformSettings`
Inherits: `PCGDynamicMeshBaseSettings` | Header: `PCGDynamicMeshTransform.h`

Apply a transform to all dynamic meshes.

**Properties** (1):
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.PCGGeometryBlueprintElement`
Inherits: `PCGBlueprintElement` | Header: `PCGGeometryBlueprintElement.h`

Subclass of PCG Blueprint Element, it comes with pre-configured pins as input and output for Dynamic meshes and force to be non-cacheable. The function CopyOrStealInputData is a helper to either steal...

**Methods** (2):
  - `copy_or_steal_input_data(tagged_data)` -> `PCGDynamicMeshData` — Allows to steal the data and work in place if the data is not used elsewhere. If this element is cacheable, it will auto...
  - `process_dynamic_mesh(dyn_mesh)` -> `Array [ str ]` — Streamlined version of the Execute function, to only process the dynamic meshes. For each input that is a dynamic mesh, ...

### `unreal.PCGGetDynamicMeshDataSettings`
Inherits: `PCGDataFromActorSettings` | Header: `PCGGetDynamicMeshData.h`

PCGGet Dynamic Mesh Data Settings

**Properties** (1):
  - `options`: `GeometryScriptCopyMeshFromComponentOptions` — [Read-Write] If data is coming from a component, you can impact the options there. (GeometryScriptCo...

### `unreal.PCGMergeDynamicMeshesSettings`
Inherits: `PCGDynamicMeshBaseSettings` | Header: `PCGMergeDynamicMeshes.h`

Appends all incoming dynamic meshes to the first dynamic mesh in order.

### `unreal.PCGMeshSamplerSettings`
Inherits: `PCGSettings` | Header: `PCGMeshSampler.h`

Sample points on a mesh.

**Properties** (23):
  - `color_channel_as_density`: `PCGColorChannel` — [Read-Write] (PCGColorChannel)
  - `extract_mesh_from_input`: `bool` — [Read-Write] Can provide a list of inputs to sample the meshes from. It can be a list of StaticMeshe...
  - `extract_uv_as_attribute`: `bool` — [Read-Write] (bool)
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] Selector to read data from. (PCGAttributePropertyInputSelector)
  - `material_attribute_name`: `Name` — [Read-Write] (Name)
  - `material_id_attribute_name`: `Name` — [Read-Write] (Name)
  - `non_uniform_sampling_options`: `GeometryScriptNonUniformPointSamplingOptions` — [Read-Write] (GeometryScriptNonUniformPointSamplingOptions)
  - `output_material_info`: `bool` — [Read-Write] (bool)
  - `output_triangle_ids`: `bool` — [Read-Write] (bool)
  - `point_steepness`: `float` — [Read-Write] Each PCG point represents a discretized, volumetric region of world space. The pointsâ...
  - `remove_hidden_triangles`: `bool` — [Read-Write] Post-processing pass after voxelization to remove hidden triangles. (bool)
  - `requested_lod_index`: `int` — [Read-Write] (int32)
  - `requested_lod_type`: `GeometryScriptLODType` — [Read-Write] LOD type to use when creating DynamicMesh from specified StaticMesh. (GeometryScriptLOD...
  - `sampling_method`: `PCGMeshSamplingMethod` — [Read-Write] (PCGMeshSamplingMethod)
  - `sampling_options`: `GeometryScriptMeshPointSamplingOptions` — [Read-Write] Poisson Sampling parameters (GeometryScriptMeshPointSamplingOptions)
  - `static_mesh`: `StaticMesh` — [Read-Write] Soft Object Path to the mesh to sample from. Will be loaded. (StaticMesh)
  - `synchronous_load`: `bool` — [Read-Write] (bool)
  - `triangle_id_attribute_name`: `Name` — [Read-Write] (Name)
  - `use_color_channel_as_density`: `bool` — [Read-Write] Will extract the color channel into the density. (bool)
  - `uv_attribute_name`: `Name` — [Read-Write] (Name)
  - `uv_channel`: `int` — [Read-Write] (int32)
  - `voxel_size`: `float` — [Read-Write] Size of a voxel for the voxelization. (float)
  - `voxelize`: `bool` — [Read-Write] Enable voxelisation as a preparation pass. Can be more expensive given the VoxelSize. (...

### `unreal.PCGPrimitiveCrossSectionSettings`
Inherits: `PCGSettings` | Header: `PCGPrimitiveCrossSection.h`

Creates spline cross-sections of one more primitives based on vertex features.

**Properties** (9):
  - `enable_min_area_culling`: `bool` — [Read-Write] Cull tiers that have a surface area smaller than a specified threshold. (bool)
  - `enable_tier_merging`: `bool` — [Read-Write] Cull tiers that are within a specified threshold. (bool)
  - `extrusion_vector_attribute`: `PCGAttributePropertyOutputSelector` — [Read-Write] The attribute that will be populated with each cross-sectionâs extrusion vector. (PCG...
  - `max_mesh_vertex_count`: `int` — [Read-Write] A safeguard to prevent finding features on an overly complex mesh. (int32)
  - `min_area_culling_threshold`: `float` — [Read-Write] If a tier is smaller in area than this threshold, it will be culled. (double)
  - `minimum_coplanar_vertices`: `int` — [Read-Write] The minimum required number of vertices that must be co-planar in order to be considere...
  - `remove_redundant_sections`: `bool` — This will currently cull even if there are other unique tiers in between. (bool) [Read-Write] If mul...
  - `slice_direction`: `Vector` — [Read-Write] Slicing will happen from the minimum vertex along this direction vector (normalized). (...
  - `tier_merging_threshold`: `float` — [Read-Write] If a tier is within this distance (in cm) of the previous tier, it will be culled. (dou...

### `unreal.PCGSaveDynamicMeshToAssetSettings`
Inherits: `PCGDynamicMeshBaseSettings` | Header: `PCGSaveDynamicMeshToAsset.h`

Saves dynamic mesh data into a static mesh asset.

**Properties** (4):
  - `copy_mesh_to_asset_options`: `GeometryScriptCopyMeshToAssetOptions` — [Read-Write] (GeometryScriptCopyMeshToAssetOptions)
  - `export_materials_from_dynamic_mesh`: `bool` — [Read-Write] This option has higher priority than CopyMeshToAssetOptions.ReplaceMaterials.
If true, ...
  - `export_params`: `PCGAssetExporterParameters` — [Read-Write] (PCGAssetExporterParameters)
  - `mesh_write_lod`: `GeometryScriptMeshWriteLOD` — [Read-Write] (GeometryScriptMeshWriteLOD)

### `unreal.PCGSpawnDynamicMeshSettings`
Inherits: `PCGDynamicMeshBaseSettings` | Header: `PCGSpawnDynamicMesh.h`

Spawn a dynamic mesh component for each dynamic mesh data in input.

**Properties** (2):
  - `post_process_function_names`: `None` — [Read-Write] Specify a list of functions to be called on the target actor after instances are spawne...
  - `target_actor`: `Actor` — [Read-Write] (Actor)

### `unreal.PCGSplineToMeshSettings`
Inherits: `PCGDynamicMeshBaseSettings` | Header: `PCGSplineToMesh.h`

PCGSpline to Mesh Settings

### `unreal.PCGStaticMeshToDynamicMeshSettings`
Inherits: `PCGDynamicMeshBaseSettings` | Header: `PCGStaticMeshToDynamicMeshElement.h`

Convert a static mesh into a dynamic mesh data.

**Properties** (5):
  - `extract_materials`: `bool` — [Read-Write] Allows to extract materials from the static mesh and store them in the PCG Dynamic Mesh...
  - `requested_lod_index`: `int` — [Read-Write] (int32)
  - `requested_lod_type`: `GeometryScriptLODType` — [Read-Write] LOD type to use when creating DynamicMesh from specified StaticMesh. (GeometryScriptLOD...
  - `static_mesh`: `StaticMesh` — [Read-Write] (StaticMesh)
  - `synchronous_load`: `bool` — [Read-Write] (bool)

### `unreal.PCGAppendMeshesFromPointsMode`
Inherits: `EnumBase` | Header: `PCGAppendMeshesFromPoints.h`

EPCGAppend Meshes from Points Mode

**Properties** (3):
  - `DYNAMIC_MESH`: `PCGAppendMeshesFromPointsMode = Ellipsis` — Mesh taken from another dynamic mesh 2
  - `SINGLE_STATIC_MESH`: `PCGAppendMeshesFromPointsMode = Ellipsis` — Mesh taken from the node settings 0
  - `STATIC_MESH_FROM_ATTRIBUTE`: `PCGAppendMeshesFromPointsMode = Ellipsis` — Mesh taken from attributes on the points 1

### `unreal.PCGBooleanOperationMode`
Inherits: `EnumBase` | Header: `PCGBooleanOperation.h`

EPCGBoolean Operation Mode

**Properties** (3):
  - `EACH_A_WITH_EACH_B`: `PCGBooleanOperationMode = Ellipsis` — Each input in A is booleanâd with its associated input in B (A1 with B1, A2 with B2, etcâ¦). Prod...
  - `EACH_A_WITH_EACH_B_SEQUENTIALLY`: `PCGBooleanOperationMode = Ellipsis` — Each input in A is booleanâd with every input in B sequentially. (A1 with B1 then with B2, A2 with...
  - `EACH_A_WITH_EVERY_B`: `PCGBooleanOperationMode = Ellipsis` — A1 with B1, A1 with B2, A2 with B1, A2 with B2, etcâ¦). Produces N * M outputs. 2 Each input in A i...

### `unreal.PCGBooleanOperationTagInheritanceMode`
Inherits: `EnumBase` | Header: `PCGBooleanOperation.h`

EPCGBoolean Operation Tag Inheritance Mode

**Properties** (3):
  - `A`: `PCGBooleanOperationTagInheritanceMode = Ellipsis` — 1
  - `B`: `PCGBooleanOperationTagInheritanceMode = Ellipsis` — 2
  - `BOTH`: `PCGBooleanOperationTagInheritanceMode = Ellipsis` — 0

### `unreal.PCGColorChannel`
Inherits: `EnumBase` | Header: `PCGMeshSampler.h`

EPCGColor Channel

**Properties** (4):
  - `ALPHA`: `PCGColorChannel = Ellipsis` — 3
  - `BLUE`: `PCGColorChannel = Ellipsis` — 2
  - `GREEN`: `PCGColorChannel = Ellipsis` — 1
  - `RED`: `PCGColorChannel = Ellipsis` — 0

### `unreal.PCGMeshSamplingMethod`
Inherits: `EnumBase` | Header: `PCGMeshSampler.h`

EPCGMesh Sampling Method

**Properties** (3):
  - `ONE_POINT_PER_TRIANGLE`: `PCGMeshSamplingMethod = Ellipsis` — Sample one point (at the center) of each triangle of the mesh. 0
  - `ONE_POINT_PER_VERTEX`: `PCGMeshSamplingMethod = Ellipsis` — Sample one point per vertex on the mesh. 1
  - `POISSON_SAMPLING`: `PCGMeshSamplingMethod = Ellipsis` — Use Poisson sampling to sample points on the mesh. Can be expensive and therefore it is not framebou...
