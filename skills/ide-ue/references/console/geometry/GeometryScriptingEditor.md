# UE Python API — GeometryScriptingEditor Module

**15 types** from the `GeometryScriptingEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DynamicMeshChangeContainer`, `GeometryScriptChannelPackResult`, `GeometryScriptChannelPackSource`, `GeometryScriptCreateNewSkeletalMeshAssetOptions`, `GeometryScriptCreateNewStaticMeshAssetOptions`, `GeometryScriptCreateNewTexture2DAssetOptions`, `GeometryScriptCreateNewVolumeFromMeshOptions`, `GeometryScriptUniqueAssetNameOptions`, `GeneratedDynamicMeshActor`, `GeometryScript_EditorDynamicMeshUtil`, `GeometryScript_EditorTextureUtils`, `GeometryScript_NewAssetUtils`, `GeometryScript_OpenSubdiv`, `GeometryScriptReadGammaSpace`, `GeometryScriptRGBAChannel`

---

## Classes

### `unreal.DynamicMeshChangeContainer`
Inherits: `StructBase` | Header: `EditorDynamicMeshUtilityFunctions.h`

FDynamicMeshChangeContainer is a temporary struct usable in Blueprints to emit âchangeâ transactions for a UDynamicMesh. The internals are hidden and this type is only intended to be used with the...

### `unreal.GeometryScriptChannelPackResult`
Inherits: `StructBase` | Header: `EditorTextureMapFunctions.h`

Geometry Script Channel Pack Result

**Properties** (1):
  - `output`: `Texture2D` — [Read-Write] (Texture2D)

### `unreal.GeometryScriptChannelPackSource`
Inherits: `StructBase` | Header: `EditorTextureMapFunctions.h`

Geometry Script Channel Pack Source

**Properties** (4):
  - `channel`: `GeometryScriptRGBAChannel` — [Read-Write] If Texture is not null, this determines which channel is read/sourced (GeometryScriptRG...
  - `default_value`: `float` — [Read-Write] If Texture is null, this value is read/sourced and the Channel and ReadGammaSpace value...
  - `read_gamma_space`: `GeometryScriptReadGammaSpace` — [Read-Write] If Texture is not null, this determines how the color data will be read/sourced (Geomet...
  - `texture`: `Texture2D` — [Read-Write] The Texture which should be read/sourced. If null then the DefaultValue is used instead...

### `unreal.GeometryScriptCreateNewSkeletalMeshAssetOptions`
Inherits: `StructBase` | Header: `CreateNewAssetUtilityFunctions.h`

Geometry Script Create New Skeletal Mesh Asset Options

**Properties** (7):
  - `apply_nanite_settings`: `bool` — [Read-Write] Whether to apply the provided Nanite Settings to the new Skeletal Mesh asset. If false,...
  - `enable_recompute_normals`: `bool` — [Read-Write] (bool)
  - `enable_recompute_tangents`: `bool` — [Read-Write] (bool)
  - `materials`: `None` — [Read-Write] (Map[Name,MaterialInterface])
  - `nanite_settings`: `MeshNaniteSettings` — [Read-Write] Nanite settings to apply to the new Skeletal Mesh Asset, if bApplyNaniteSettings is tru...
  - `use_mesh_bone_proportions`: `bool` — [Read-Write] If true, will use the skeleton proportions (if available) stored in the dynamic mesh. (...
  - `use_original_vertex_order`: `bool` — [Read-Write] Use the original vertex order found in the source data. This is useful if the inbound m...

### `unreal.GeometryScriptCreateNewStaticMeshAssetOptions`
Inherits: `StructBase` | Header: `CreateNewAssetUtilityFunctions.h`

Geometry Script Create New Static Mesh Asset Options

**Properties** (8):
  - `collision_mode`: `CollisionTraceFlag` — [Read-Write] (CollisionTraceFlag)
  - `enable_collision`: `bool` — [Read-Write] (bool)
  - `enable_nanite`: `bool` — [Read-Write] (bool)
  - `enable_recompute_normals`: `bool` — [Read-Write] (bool)
  - `enable_recompute_tangents`: `bool` — [Read-Write] (bool)
  - `nanite_proxy_triangle_percent`: `float` — [Read-Write] Replaced NaniteProxyTrianglePercent with usage of Engine FMeshNaniteSettings, use Nanit...
  - `nanite_settings`: `MeshNaniteSettings` — [Read-Write] Nanite settings to set on new StaticMesh Asset (MeshNaniteSettings)
  - `use_original_vertex_order`: `bool` — [Read-Write] Use the original vertex order found in the source data. This is useful if the inbound m...

### `unreal.GeometryScriptCreateNewTexture2DAssetOptions`
Inherits: `StructBase` | Header: `CreateNewAssetUtilityFunctions.h`

Geometry Script Create New Texture 2DAsset Options

**Properties** (1):
  - `overwrite_if_exists`: `bool` — [Read-Write] If true, overwrite any existing texture assets using the same AssetPathAndName (bool)

### `unreal.GeometryScriptCreateNewVolumeFromMeshOptions`
Inherits: `StructBase` | Header: `CreateNewAssetUtilityFunctions.h`

Geometry Script Create New Volume from Mesh Options

**Properties** (3):
  - `auto_simplify`: `bool` — [Read-Write] (bool)
  - `max_triangles`: `int` — [Read-Write] (int32)
  - `volume_type`: `Class` — [Read-Write] (type(Class))

### `unreal.GeometryScriptUniqueAssetNameOptions`
Inherits: `StructBase` | Header: `CreateNewAssetUtilityFunctions.h`

Geometry Script Unique Asset Name Options

**Properties** (1):
  - `unique_id_digits`: `int` — [Read-Write] (int32)

### `unreal.GeneratedDynamicMeshActor`
Inherits: `DynamicMeshActor` | Header: `GeneratedDynamicMeshActor.h`

AGeneratedDynamicMeshActor is an Editor-only subclass of ADynamicMeshActor that provides special support for dynamic procedural generation of meshes in the Editor, eg via Blueprints. Expensive procedu...

**Methods** (5):
  - `copy_properties_from_static_mesh(static_mesh_actor, copy_component_materials = False)` -> `None` — Attempt to copy Actor Properties from a StaticMeshActor. Optionally copy DynamicMeshComponent material list to the Stati...
  - `copy_properties_to_static_mesh(static_mesh_actor, copy_component_materials = False)` -> `None` — Attempt to copy Actor Properties to a StaticMeshActor. Optionally copy DynamicMeshComponent material list to the StaticM...
  - `increment_progress(num_steps, message)` -> `None` — Call this function from within OnRebuildGeneratedMesh to update progress tracking.
  - `mark_for_mesh_rebuild(immediate = False, immediate_even_if_frozen = False)` -> `None` — Mark this Actor as modified so that OnRebuildGeneratedMesh runs
  - `on_rebuild_generated_mesh(target_mesh)` -> `None` — This event will be fired to notify the BP that the generated Mesh should be rebuilt. GeneratedDynamicMeshActor BP subcla...

**Properties** (6):
  - `dialog_delay`: `float` — [Read-Write] Delay in seconds before the progress dialog is shown, if enabled (float)
  - `enable_rebuild_progress`: `bool` — [Read-Write] If enabled, a long-running OnRebuildGeneratedMesh event will show a progress dialog (Th...
  - `frozen`: `bool` — [Read-Write] If true, the DynamicMeshComponent will be âFrozenâ in its current state, and automa...
  - `num_progress_steps`: `int` — [Read-Write] Number of progress steps/ticks that the progress bar will be subdivided into (int32)
  - `progress_message`: `str` — [Read-Write] The default progress message (str)
  - `reset_on_rebuild`: `bool` — [Read-Write] If true, the DynamicMeshComponent will be cleared before the RebuildGeneratedMesh event...

### `unreal.GeometryScript_EditorDynamicMeshUtil`
Inherits: `BlueprintFunctionLibrary` | Header: `EditorDynamicMeshUtilityFunctions.h`

Geometry Script Library Editor Dynamic Mesh Functions

**Methods** (4):
  - `begin_tracked_mesh_change(change_tracker=DynamicMeshChangeContainer)` [classmethod] — Save current state of TargetMesh so that an undoable/redoable Change can be emitted after TargetMesh is modified, using ...
  - `emit_tracked_mesh_change(target_mesh, change_tracker=DynamicMeshChangeContainer)` [classmethod] — Emit an undo/redo Change for a modified TargetMesh, based on the ChangeTracker information that was saved (via call to B...
  - `fetch_debug_mesh(debug_mesh_name, to_target_mesh, debug_mesh_exists=bool)` [classmethod] — Fetch a debug FDynamicMesh3 saved with DebugMeshName from the global debug mesh storage and copy to ToTargetMesh. If Deb...
  - `stash_debug_mesh(target_mesh, debug_mesh_name)` -> `DynamicMesh` [classmethod] — Store a copy of TargetMesh with name DebugMeshName. The mesh can later be recovered via FetchDebugMesh. warning: This fu...

### `unreal.GeometryScript_EditorTextureUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `EditorTextureMapFunctions.h`

Geometry Script Library Editor Texture Map Functions

**Methods** (1):
  - `channel_pack(r_channel_source, g_channel_source, b_channel_source, a_channel_source, output_srgb, debug = None)` -> `GeometryScriptChannelPackResult` [classmethod] — Channel Pack

### `unreal.GeometryScript_NewAssetUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `CreateNewAssetUtilityFunctions.h`

Geometry Script Library Create New Asset Functions

**Methods** (10):
  - `create_new_skeletal_mesh_asset_from_mesh(from_dynamic_mesh, skeleton, asset_path_and_name, options, outcome=GeometryScriptOutcomePins)` [classmethod] — Create a new SkeletalMesh asset from a DynamicMesh and a Skeleton. Save the asset at the AssetPathAndName location.
  - `create_new_skeletal_mesh_asset_from_mesh_lo_ds(from_dynamic_mesh_lo_ds: None, skeleton: Skeleton, asset_path_and_name: str, options: GeometryScriptCreateNewSkeletalMeshAssetOptions, debug: GeometryScriptDebug = Ellipsis)` -> `Tuple [ SkeletalMesh , GeometryScriptOutcomePins ]` [classmethod] — deprecated: âcreate_new_skeletal_mesh_asset_from_mesh_lo_dsâ was renamed to âcreate_new_skeletal_mesh_asset_from_m...
  - `create_new_skeletal_mesh_asset_from_mesh_lods(from_dynamic_mesh_lo_ds, skeleton, asset_path_and_name, options, outcome=GeometryScriptOutcomePins)` [classmethod] — Create a new SkeletalMesh asset from a collection of LODs represented by an array of DynamicMeshes and a Skeleton. Save ...
  - `create_new_static_mesh_asset_from_mesh(from_dynamic_mesh, asset_path_and_name, options, outcome=GeometryScriptOutcomePins)` [classmethod] — Create a new StaticMesh asset from a DynamicMesh. Save the asset at the AssetPathAndName location.
  - `create_new_static_mesh_asset_from_mesh_lo_ds(from_dynamic_mesh: None, asset_path_and_name: str, options: GeometryScriptCreateNewStaticMeshAssetOptions, debug: GeometryScriptDebug = Ellipsis)` -> `Tuple [ StaticMesh , GeometryScriptOutcomePins ]` [classmethod] — deprecated: âcreate_new_static_mesh_asset_from_mesh_lo_dsâ was renamed to âcreate_new_static_mesh_asset_from_mesh_...
  - `create_new_static_mesh_asset_from_mesh_lods(from_dynamic_mesh, asset_path_and_name, options, outcome=GeometryScriptOutcomePins)` [classmethod] — Create a new StaticMesh asset from a collection of LODs represented by an array of DynamicMeshes. Save the asset at the ...
  - `create_new_texture2d_asset(from_texture, asset_path_and_name, options, outcome=GeometryScriptOutcomePins)` [classmethod] — Create New Texture 2DAsset
  - `create_new_volume_from_mesh(from_dynamic_mesh, create_in_world, actor_transform, base_actor_name, options, create_in_world=World, outcome=GeometryScriptOutcomePins)` [classmethod] — Create a new Volume from a Dynamic Mesh, in the specified world.
  - `create_new_volume_from_mesh_world_context(world_context_object, from_dynamic_mesh, actor_transform, base_actor_name, options, outcome=GeometryScriptOutcomePins)` [classmethod] — Create a new Volume from a Dynamic Mesh, in the same world as the calling blueprint.
  - `create_unique_new_asset_path_name(asset_folder_path, base_asset_name, options, unique_asset_name=str, outcome=GeometryScriptOutcomePins)` [classmethod] — Create Unique New Asset Path Name

### `unreal.GeometryScript_OpenSubdiv`
Inherits: `BlueprintFunctionLibrary` | Header: `OpenSubdivUtilityFunctions.h`

Geometry Script Library Open Subdiv Functions

**Methods** (2):
  - `apply_polygroup_catmull_clark_sub_d(from_dynamic_mesh, subdivisions, group_layer, debug = None)` -> `DynamicMesh` [classmethod] — Apply Polygroup Catmull Clark Sub D
  - `apply_triangle_loop_sub_d(from_dynamic_mesh, subdivisions, debug = None)` -> `DynamicMesh` [classmethod] — Apply Triangle Loop Sub D

### `unreal.GeometryScriptReadGammaSpace`
Inherits: `EnumBase` | Header: `EditorTextureMapFunctions.h`

EGeometry Script Read Gamma Space

**Properties** (3):
  - `FROM_TEXTURE_SETTINGS`: `GeometryScriptReadGammaSpace = Ellipsis` — Read color data from Texture directly, without any conversion 0
  - `LINEAR`: `GeometryScriptReadGammaSpace = Ellipsis` — Read linear color data from Texture, converting if needed 1
  - `SRGB`: `GeometryScriptReadGammaSpace = Ellipsis` — Read sRGB color data from Texture, converting if needed 2

### `unreal.GeometryScriptRGBAChannel`
Inherits: `EnumBase` | Header: `EditorTextureMapFunctions.h`

EGeometry Script RGBAChannel

**Properties** (4):
  - `A`: `GeometryScriptRGBAChannel = Ellipsis` — 3
  - `B`: `GeometryScriptRGBAChannel = Ellipsis` — 2
  - `G`: `GeometryScriptRGBAChannel = Ellipsis` — 1
  - `R`: `GeometryScriptRGBAChannel = Ellipsis` — 0
