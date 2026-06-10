# UE Python API — StaticMeshEditor Module

**7 types** from the `StaticMeshEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CreateProxyMeshActorOptions`, `JoinStaticMeshActorsOptions`, `MergeStaticMeshActorsOptions`, `StaticMeshReductionOptions`, `StaticMeshReductionSettings`, `StaticMeshEditorSubsystem`, `ScriptCollisionShapeType`

---

## Classes

### `unreal.CreateProxyMeshActorOptions`
Inherits: `JoinStaticMeshActorsOptions` | Header: `StaticMeshEditorSubsystemHelpers.h`

Create Proxy Mesh Actor Options

**Properties** (3):
  - `base_package_name`: `str` — /Game/MyFolder (str) [Read-Write] The package path you want to save to. ie
  - `mesh_proxy_settings`: `MeshProxySettings` — [Read-Write] (MeshProxySettings)
  - `spawn_merged_actor`: `bool` — [Read-Write] Spawn the new merged actors (bool)

### `unreal.JoinStaticMeshActorsOptions`
Inherits: `StructBase` | Header: `StaticMeshEditorSubsystemHelpers.h`

Join Static Mesh Actors Options

**Properties** (3):
  - `destroy_source_actors`: `bool` — [Read-Write] Destroy the provided Actors after the operation. (bool)
  - `new_actor_label`: `str` — [Read-Write] Name of the new spawned Actor to replace the provided Actors. (str)
  - `rename_components_from_source`: `bool` — [Read-Write] Rename StaticMeshComponents based on source Actorâs name. (bool)

### `unreal.MergeStaticMeshActorsOptions`
Inherits: `JoinStaticMeshActorsOptions` | Header: `StaticMeshEditorSubsystemHelpers.h`

Merge Static Mesh Actors Options

**Properties** (3):
  - `base_package_name`: `str` — /Game/MyFolder (str) [Read-Write] The package path you want to save to. ie
  - `mesh_merging_settings`: `MeshMergingSettings` — [Read-Write] (MeshMergingSettings)
  - `spawn_merged_actor`: `bool` — [Read-Write] Spawn the new merged actors (bool)

### `unreal.StaticMeshReductionOptions`
Inherits: `StructBase` | Header: `StaticMeshEditorSubsystemHelpers.h`

Static Mesh Reduction Options

**Properties** (2):
  - `auto_compute_lod_screen_size`: `bool` — [Read-Write] If true, the screen sizes at which LODs swap are computed automatically
note: that this...
  - `reduction_settings`: `None` — [Read-Write] Array of reduction settings to apply to each new LOD mesh. (Array[StaticMeshReductionSe...

### `unreal.StaticMeshReductionSettings`
Inherits: `StructBase` | Header: `StaticMeshEditorSubsystemHelpers.h`

Static Mesh Reduction Settings

**Properties** (2):
  - `percent_triangles`: `float` — 1.0 = no reduction, 0.0 = no triangles. (float) [Read-Write] Percentage of triangles to keep. Ranges...
  - `screen_size`: `float` — [Read-Write] ScreenSize to display this LOD. Ranges from 0.0 to 1.0. (float)

### `unreal.StaticMeshEditorSubsystem`
Inherits: `EditorSubsystem` | Header: `StaticMeshEditorSubsystem.h`

UStaticMeshEditorSubsystem Subsystem for exposing static mesh functionality to scripts

**Methods** (64):
  - `add_simple_collisions(static_mesh, shape_type)` -> `int32` — Same as AddSimpleCollisionsWithNotification but changes are automatically applied.
  - `add_simple_collisions_with_notification(static_mesh, shape_type, apply_changes)` -> `int32` — Add simple collisions to a static mesh. This method replicates what is done when invoking menu entries âCollision > Ad...
  - `add_uv_channel(static_mesh, lod_index)` -> `bool` — Adds an empty UV channel at the end of the existing channels on the given LOD of a StaticMesh.
  - `bulk_set_convex_decomposition_collisions(static_meshes, hull_count, max_hull_verts, hull_precision)` -> `bool` — Same as SetConvexDecompositionCollisionsWithNotification but changes are automatically applied.
  - `bulk_set_convex_decomposition_collisions_with_notification(static_meshes, hull_count, max_hull_verts, hull_precision, apply_changes)` -> `bool` — Compute convex collisions for a set of static meshes. Any existing collisions will be removed from the static meshes. Th...
  - `create_proxy_mesh_actor(actors_to_merge, merge_options)` -> `StaticMeshActor or None` — Build a proxy mesh actor that can replace a set of mesh actors.
  - `enable_section_affect_distance_field_lighting(static_mesh, affect_distance_field_lighting, lod_index, section_index)` -> `None` — Enables/disables mesh section affects distance field lighting for a specific LOD.
  - `enable_section_cast_shadow(static_mesh, cast_shadow, lod_index, section_index)` -> `None` — Enables/disables mesh section shadow casting for a specific LOD.
  - `enable_section_collision(static_mesh, collision_enabled, lod_index, section_index)` -> `None` — Enables/disables mesh section collision for a specific LOD.
  - `enable_section_force_opaque(static_mesh, force_opaque, lod_index, section_index)` -> `None` — Set/unset mesh section to be forcefully opaque for a specific LOD.
  - `enable_section_visible_in_ray_tracing(static_mesh, visible_in_ray_tracing, lod_index, section_index)` -> `None` — Enables/disables mesh sectionâs visibility in ray tracing for a specific LOD.
  - `generate_box_uv_channel(static_mesh, lod_index, uv_channel_index, position, orientation, size)` -> `bool` — Generates box UV mapping in the specified UV channel on the given LOD of a StaticMesh.
  - `generate_cylindrical_uv_channel(static_mesh, lod_index, uv_channel_index, position, orientation, tiling)` -> `bool` — Generates cylindrical UV mapping in the specified UV channel on the given LOD of a StaticMesh.
  - `generate_planar_uv_channel(static_mesh, lod_index, uv_channel_index, position, orientation, tiling)` -> `bool` — Generates planar UV mapping in the specified UV channel on the given LOD of a StaticMesh.
  - `get_collision_complexity(static_mesh)` -> `CollisionTraceFlag` — Get the Collision Trace behavior of a static mesh
  - `get_convex_collision_count(static_mesh)` -> `int32` — Get number of convex collisions present on a static mesh.
  - `get_lod_build_settings(static_mesh, lod_index)` -> `MeshBuildSettings` — Copy the build options with the specified LOD build settings.
  - `get_lod_count(static_mesh)` -> `int32` — Get number of LODs present on a static mesh.
  - `get_lod_group(static_mesh)` -> `Name` — Get the LODGroup for the specified static mesh
  - `get_lod_material_slot(static_mesh, lod_index, section_index)` -> `int32` — Gets the material slot used for a specific LOD section.
  - `get_lod_reduction_settings(static_mesh, lod_index)` -> `MeshReductionSettings` — Copy the reduction options with the specified LOD reduction settings.
  - `get_lod_screen_sizes(static_mesh)` -> `Array [ float ]` — Get an array of LOD screen sizes for evaluation.
  - `get_nanite_settings(static_mesh)` -> `MeshNaniteSettings` — Get the Nanite Settings for the mesh
  - `get_nanite_source_filename(static_mesh)` -> `str` — Get the Nanite hi-res source filename
  - `get_num_uv_channels(static_mesh, lod_index)` -> `int32` — Returns the number of UV channels for the given LOD of a StaticMesh.
  - `get_number_materials(static_mesh)` -> `int32` — Get number of Materials for a StaticMesh
  - `get_number_verts(static_mesh, lod_index)` -> `int32` — Get number of StaticMesh verts for an LOD
  - `get_simple_collision_count(static_mesh)` -> `int32` — Get number of simple collisions present on a static mesh.
  - `has_instance_vertex_colors(static_mesh_component)` -> `bool` — Check whether a static mesh component has vertex colors
  - `has_vertex_colors(static_mesh)` -> `bool` — Check whether a static mesh has vertex colors
  - `import_lod(base_static_mesh, lod_index, source_filename)` -> `int32` — Import or re-import a LOD into the specified base mesh. If the LOD do not exist it will import it and add it to the base...
  - `import_nanite_hi_res_mesh(static_mesh, source_filename, show_dialog_when_file_missing)` -> `bool` — Import or re-import the nanite hi-res mesh into the specified base mesh.
  - `insert_uv_channel(static_mesh, lod_index, uv_channel_index)` -> `bool` — Inserts an empty UV channel at the specified channel index on the given LOD of a StaticMesh.
  - `is_section_affect_distance_field_lighting_enabled(static_mesh, lod_index, section_index)` -> `bool` — Checks if a specific LOD mesh section affects distance field lighting.
  - `is_section_cast_shadow_enabled(static_mesh, lod_index, section_index)` -> `bool` — Checks if a specific LOD mesh section can cast shadows.
  - `is_section_collision_enabled(static_mesh, lod_index, section_index)` -> `bool` — Checks if a specific LOD mesh section has collision.
  - `is_section_force_opaque_enabled(static_mesh, lod_index, section_index)` -> `bool` — Checks if a specific LOD mesh section is forced to be opaque.
  - `is_section_visible_in_ray_tracing_enabled(static_mesh, lod_index, section_index)` -> `bool` — Checks if a specific LOD mesh section is visible in ray tracing.
  - `join_static_mesh_actors(actors_to_join, join_options)` -> `Actor` — Create a new Actor in the level that contains a duplicate of all the Actors Static Meshes Component. The ActorsToJoin ne...
  - `merge_static_mesh_actors(actors_to_merge, merge_options)` -> `StaticMeshActor or None` — Merge the meshes into a unique mesh with the provided StaticMeshActors. There are multiple options on how to merge the m...
  - `reimport_all_custom_lo_ds(static_mesh: StaticMesh)` -> `bool` — deprecated: âreimport_all_custom_lo_dsâ was renamed to âreimport_all_custom_lodsâ.
  - `reimport_all_custom_lods(static_mesh)` -> `bool` — Re-import all the custom LODs present in the specified static mesh.
  - `remove_collisions(static_mesh)` -> `bool` — Same as RemoveCollisionsWithNotification but changes are applied.
  - `remove_collisions_with_notification(static_mesh, apply_changes)` -> `bool` — Remove collisions from a static mesh. This method replicates what is done when invoking menu entries âCollision > Remo...
  - `remove_lods(static_mesh)` -> `bool` — Remove LODs on a static mesh except LOD 0.
  - `remove_uv_channel(static_mesh, lod_index, uv_channel_index)` -> `bool` — Removes the UV channel at the specified channel index on the given LOD of a StaticMesh.
  - `replace_mesh_components_materials(mesh_components, material_to_be_replaced, new_material)` -> `None` — Find the references of the material MaterialToReplaced on all the MeshComponents provided and replace it by NewMaterial.
  - `replace_mesh_components_materials_on_actors(actors, material_to_be_replaced, new_material)` -> `None` — Find the references of the material MaterialToReplaced on all the MeshComponents of all the Actors provided and replace ...
  - `replace_mesh_components_meshes(mesh_components, mesh_to_be_replaced, new_mesh)` -> `None` — Find the references of the mesh MeshToBeReplaced on all the MeshComponents provided and replace it by NewMesh. The edito...
  - `replace_mesh_components_meshes_on_actors(actors, mesh_to_be_replaced, new_mesh)` -> `None` — Find the references of the mesh MeshToBeReplaced on all the MeshComponents of all the Actors provided and replace it by ...
  - `set_allow_cpu_access(static_mesh, allow_cpu_access)` -> `None` — Sets StaticMeshFlag bAllowCPUAccess
  - `set_convex_decomposition_collisions(static_mesh, hull_count, max_hull_verts, hull_precision)` -> `bool` — Same as SetConvexDecompositionCollisionsWithNotification but changes are automatically applied.
  - `set_convex_decomposition_collisions_with_notification(static_mesh, hull_count, max_hull_verts, hull_precision, apply_changes)` -> `bool` — Add a convex collision to a static mesh. Any existing collisions will be removed from the static mesh. This method repli...
  - `set_generate_lightmap_uv(static_mesh, generate_lightmap_u_vs)` -> `bool` — Set Generate Lightmap UVs for StaticMesh
  - `set_lod_build_settings(static_mesh, lod_index, build_options)` -> `None` — Set the LOD build options for the specified LOD index.
  - `set_lod_from_static_mesh(destination_static_mesh, destination_lod_index, source_static_mesh, source_lod_index, reuse_existing_material_slots)` -> `int32` — Adds or create a LOD at DestinationLodIndex using the geometry from SourceStaticMesh SourceLodIndex
  - `set_lod_group(static_mesh, lod_group, rebuild_immediately = True)` -> `bool` — Set the LODGroup for the specified static mesh
  - `set_lod_material_slot(static_mesh, material_slot_index, lod_index, section_index)` -> `None` — Sets the material slot for a specific LOD.
  - `set_lod_reduction_settings(static_mesh, lod_index, reduction_options)` -> `None` — Set the LOD reduction for the specified LOD index.
  - `set_lod_screen_sizes(static_mesh, screen_sizes)` -> `bool` — Set LOD screen sizes.
  - `set_lods(static_mesh, reduction_options)` -> `int32` — Same as SetLodsWithNotification but changes are applied.
  - `set_lods_with_notification(static_mesh, reduction_options, apply_changes)` -> `int32` — Remove then add LODs on a static mesh. The static mesh must have at least LOD 0. The LOD 0 of the static mesh is kept af...
  - `set_nanite_settings(static_mesh, nanite_settings, apply_changes = True)` -> `None` — Get the Nanite Settings for the mesh
  - `update_nanite_source_filename(static_mesh, new_source_filename)` -> `bool` — Update the Nanite hi-res source filename.

### `unreal.ScriptCollisionShapeType`
Inherits: `EnumBase` | Header: `StaticMeshEditorSubsystemHelpers.h`

Types of Collision Construct that are generated *

**Properties** (8):
  - `BOX`: `ScriptCollisionShapeType = Ellipsis` — 0
  - `CAPSULE`: `ScriptCollisionShapeType = Ellipsis` — 2
  - `NDOP10_X`: `ScriptCollisionShapeType = Ellipsis` — 3
  - `NDOP10_Y`: `ScriptCollisionShapeType = Ellipsis` — 4
  - `NDOP10_Z`: `ScriptCollisionShapeType = Ellipsis` — 5
  - `NDOP18`: `ScriptCollisionShapeType = Ellipsis` — 6
  - `NDOP26`: `ScriptCollisionShapeType = Ellipsis` — 7
  - `SPHERE`: `ScriptCollisionShapeType = Ellipsis` — 1
