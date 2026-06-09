# UE Python API — GeometryCollectionEngine Module

**44 types** from the `GeometryCollectionEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ChaosBreakingEventData`, `ChaosBreakingEventRequestSettings`, `ChaosCollisionEventData`, `ChaosCollisionEventRequestSettings`, `ChaosRemovalEventData`, `ChaosRemovalEventRequestSettings`, `ChaosTrailingEventData`, `ChaosTrailingEventRequestSettings`, `GeometryCollectionAutoInstanceMesh`, `GeometryCollectionCollisionParticleData`, `GeometryCollectionCollisionTypeData`, `GeometryCollectionDamagePropagationData`, `GeometryCollectionEmbeddedExemplar`, `GeometryCollectionLevelSetData`, `GeometryCollectionProxyMeshData`, `GeometryCollectionSizeSpecificData`, `GeometryCollectionSource`, `ChaosDestructionListener`, `GeometryCollection`, `GeometryCollectionActor`, ... (44 total)

---

## Classes

### `unreal.ChaosBreakingEventData`
Inherits: `StructBase` | Header: `ChaosBreakingEventFilter.h`

A breaking event data structure.

**Properties** (3):
  - `location`: `Vector` [Read-Only] — [Read-Only] Location of the breaking event (centroid) (Vector)
  - `mass`: `float` [Read-Only] — [Read-Only] The mass of the breaking event (float)
  - `velocity`: `Vector` [Read-Only] — [Read-Only] The velocity of the breaking event (Vector)

### `unreal.ChaosBreakingEventRequestSettings`
Inherits: `StructBase` | Header: `ChaosBreakingEventFilter.h`

Settings used to refine breaking event requests

**Properties** (6):
  - `max_distance`: `float` — [Read-Write] The maximum distance threshold for the results. (float)
  - `max_number_of_results`: `int` — [Read-Write] The maximum number of results to return. (int32)
  - `min_mass`: `float` — [Read-Write] The minimum mass threshold for the results. (float)
  - `min_radius`: `float` — [Read-Write] The minimum breaking radius threshold for the results. (float)
  - `min_speed`: `float` — [Read-Write] The minimum speed threshold for the results. (float)
  - `sort_method`: `ChaosBreakingSortMethod` — [Read-Write] The method used to sort the breaking events. (ChaosBreakingSortMethod)

### `unreal.ChaosCollisionEventData`
Inherits: `StructBase` | Header: `ChaosCollisionEventFilter.h`

A collision event data structure

**Properties** (7):
  - `impulse`: `Vector` [Read-Only] — [Read-Only] The accumulated impulse vector of the collision event (Vector)
  - `location`: `Vector` [Read-Only] — [Read-Only] Location of the collision event (Vector)
  - `mass1`: `float` [Read-Only] — [Read-Only] The mass of object 1 of the collision event (float)
  - `mass2`: `float` [Read-Only] — [Read-Only] The mass of object 2 of the collision event (float)
  - `normal`: `Vector` [Read-Only] — [Read-Only] Normal of the collision event (Vector)
  - `velocity1`: `Vector` [Read-Only] — [Read-Only] The velocity of object 1 of the collision event (Vector)
  - `velocity2`: `Vector` [Read-Only] — [Read-Only] The velocity of object 2 of the collision event (Vector)

### `unreal.ChaosCollisionEventRequestSettings`
Inherits: `StructBase` | Header: `ChaosCollisionEventFilter.h`

Settings used to define collision event requests

**Properties** (6):
  - `max_distance`: `float` — [Read-Write] The maximum distance threshold for the results. (float)
  - `max_number_results`: `int` — [Read-Write] The maximum number of results to return. (int32)
  - `min_impulse`: `float` — [Read-Write] The minimum impulse threshold for the results. (float)
  - `min_mass`: `float` — [Read-Write] The minimum mass threshold for the results (compared with min of particle 1 mass and pa...
  - `min_speed`: `float` — [Read-Write] The min speed threshold for the results (compared with min of particle 1 speed and part...
  - `sort_method`: `ChaosCollisionSortMethod` — [Read-Write] The method used to sort the collision events. (ChaosCollisionSortMethod)

### `unreal.ChaosRemovalEventData`
Inherits: `StructBase` | Header: `ChaosRemovalEventFilter.h`

A Removal event data structure.

**Properties** (3):
  - `location`: `Vector` — [Read-Write] Current removal location. (Vector)
  - `mass`: `float` — [Read-Write] The mass of the removal. (float)
  - `particle_index`: `int` — [Read-Write] The particle index of the removal. (int32)

### `unreal.ChaosRemovalEventRequestSettings`
Inherits: `StructBase` | Header: `ChaosRemovalEventFilter.h`

Chaos Removal Event Request Settings

**Properties** (4):
  - `max_distance`: `float` — [Read-Write] The maximum distance threshold for the results (if location is set on destruction event...
  - `max_number_of_results`: `int` — [Read-Write] The maximum number of results to return. (int32)
  - `min_mass`: `float` — [Read-Write] The minimum mass treshold for the results. (float)
  - `sort_method`: `ChaosRemovalSortMethod` — [Read-Write] The method used to sort the removal events. (ChaosRemovalSortMethod)

### `unreal.ChaosTrailingEventData`
Inherits: `StructBase` | Header: `ChaosTrailingEventFilter.h`

A trailing event data structure.

**Properties** (5):
  - `angular_velocity`: `Vector` — [Read-Write] The angular velocity of the trail. (Vector)
  - `location`: `Vector` — [Read-Write] Current trail location. (Vector)
  - `mass`: `float` — [Read-Write] The mass of the trail. (float)
  - `particle_index`: `int` — [Read-Write] The particle index of the trail. (int32)
  - `velocity`: `Vector` — [Read-Write] The velocity of the trail. (Vector)

### `unreal.ChaosTrailingEventRequestSettings`
Inherits: `StructBase` | Header: `ChaosTrailingEventFilter.h`

Chaos Trailing Event Request Settings

**Properties** (6):
  - `max_distance`: `float` — [Read-Write] The maximum distance threshold for the results (if location is set on destruction event...
  - `max_number_of_results`: `int` — [Read-Write] The maximum number of results to return. (int32)
  - `min_angular_speed`: `float` — [Read-Write] The minimum angular speed threshold for the results. (float)
  - `min_mass`: `float` — [Read-Write] The minimum mass treshold for the results. (float)
  - `min_speed`: `float` — [Read-Write] The minimum speed threshold for the results. (float)
  - `sort_method`: `ChaosTrailingSortMethod` — [Read-Write] The method used to sort the breaking events. (ChaosTrailingSortMethod)

### `unreal.GeometryCollectionAutoInstanceMesh`
Inherits: `StructBase` | Header: `GeometryCollectionObject.h`

Geometry Collection Auto Instance Mesh

**Properties** (3):
  - `materials`: `None` — [Read-Write] (Array[MaterialInterface])
  - `mesh`: `StaticMesh` — [Read-Write] (StaticMesh)
  - `static_mesh`: `SoftObjectPath` — [Read-Write]
deprecated: Use Mesh instead. (SoftObjectPath)

### `unreal.GeometryCollectionCollisionParticleData`
Inherits: `StructBase` | Header: `GeometryCollectionObject.h`

Geometry Collection Collision Particle Data

### `unreal.GeometryCollectionCollisionTypeData`
Inherits: `StructBase` | Header: `GeometryCollectionObject.h`

Geometry Collection Collision Type Data

### `unreal.GeometryCollectionDamagePropagationData`
Inherits: `StructBase` | Header: `GeometryCollectionDamagePropagationData.h`

Geometry Collection Damage Propagation Data

**Properties** (3):
  - `break_damage_propagation_factor`: `float` — [Read-Write] factor of the remaining strain propagated through the connection graph after a piece br...
  - `enabled`: `bool` — [Read-Write] Whether or not damage propagation is enabled. (bool)
  - `shock_damage_propagation_factor`: `float` — [Read-Write] factor of the received strain propagated throug the connection graph if the piece did n...

### `unreal.GeometryCollectionEmbeddedExemplar`
Inherits: `StructBase` | Header: `GeometryCollectionObject.h`

Geometry Collection Embedded Exemplar

### `unreal.GeometryCollectionLevelSetData`
Inherits: `StructBase` | Header: `GeometryCollectionObject.h`

Geometry Collection Level Set Data

### `unreal.GeometryCollectionProxyMeshData`
Inherits: `StructBase` | Header: `GeometryCollectionObject.h`

Geometry Collection Proxy Mesh Data

**Properties** (2):
  - `mesh_transforms`: `None` — [Read-Write] Transform of the mesh relative to the geometry collection it belongs to
if an entry is ...
  - `proxy_meshes`: `None` — [Read-Write] References to meshes to be used as proxies for rendering when the geometry collection i...

### `unreal.GeometryCollectionSizeSpecificData`
Inherits: `StructBase` | Header: `GeometryCollectionObject.h`

Geometry Collection Size Specific Data

**Properties** (9):
  - `collision_object_reduction_percentage`: `int` — 10)
deprecated: Use Collision.CollisionObjectReductionPercentage instead. (int32) [Read-Write] *  Re...
  - `collision_particles_fraction`: `float` — [Read-Write] Number of particles on the triangulated surface to use for collisions.
deprecated: Use ...
  - `collision_type`: `CollisionTypeEnum` — [Read-Write] *  CollisionType defines how to initialize the rigid collision structures.
deprecated: ...
  - `implicit_type`: `ImplicitTypeEnum` — [Read-Write] *  CollisionType defines how to initialize the rigid collision structures.
deprecated: ...
  - `max_cluster_level_set_resolution`: `int` — 10)
deprecated: Use Collision.LevelSet.MaxClusterLevelSetResolution instead. (int32) [Read-Write] * ...
  - `max_level_set_resolution`: `int` — 10)
deprecated: Use Collision.LevelSet.MaxLevelSetResolution instead. (int32) [Read-Write] *  Resolu...
  - `maximum_collision_particles`: `int` — [Read-Write] Max number of particles.
deprecated: Use Collision.MaximumCollisionParticles instead. (...
  - `min_cluster_level_set_resolution`: `int` — 5)
deprecated: Use Collision.LevelSet.MinClusterLevelSetResolution instead. (int32) [Read-Write] *  ...
  - `min_level_set_resolution`: `int` — 5)
deprecated: Use Collision.LevelSet.MinLevelSetResolution instead. (int32) [Read-Write] *  Resolut...

### `unreal.GeometryCollectionSource`
Inherits: `StructBase` | Header: `GeometryCollectionObject.h`

Geometry Collection Source

**Properties** (7):
  - `add_internal_materials`: `bool` — [Read-Write] (Legacy) Whether source materials will be duplicated to create new slots for internal m...
  - `instance_custom_data`: `None` — [Read-Write] (Array[float])
  - `local_transform`: `Transform` — [Read-Write] (Transform)
  - `set_internal_from_material_index`: `bool` — [Read-Write] Whether to set the âinternalâ flag for faces with odd-numbered materials slots. (bo...
  - `source_geometry_object`: `SoftObjectPath` — [Read-Write] (SoftObjectPath)
  - `source_material`: `None` — [Read-Write] (Array[MaterialInterface])
  - `split_components`: `bool` — [Read-Write] Whether individual source mesh components should be split into separate pieces of geome...

### `unreal.ChaosDestructionListener`
Inherits: `SceneComponent` | Header: `ChaosBlueprint.h`

Object allowing for retrieving Chaos Destruction data.

**Methods** (17):
  - `add_chaos_solver_actor(chaos_solver_actor)` -> `None` — Dynamically adds a chaos solver to the listener
  - `add_geometry_collection_actor(geometry_collection_actor)` -> `None` — Dynamically adds a chaos solver to the listener
  - `is_event_listening()` -> `bool` — Returns if the destruction listener is listening to any events
  - `remove_chaos_solver_actor(chaos_solver_actor)` -> `None` — Dynamically removes a chaos solver from the listener
  - `remove_geometry_collection_actor(geometry_collection_actor)` -> `None` — Dynamically removes a chaos solver from the listener
  - `set_breaking_event_enabled(is_enabled)` -> `None` — Enables or disables breaking event listening
  - `set_breaking_event_request_settings(settings)` -> `None` — Sets breaking event request settings dynamically
  - `set_collision_event_enabled(is_enabled)` -> `None` — Enables or disables collision event listening
  - `set_collision_event_request_settings(settings)` -> `None` — Sets collision event request settings dynamically
  - `set_removal_event_enabled(is_enabled)` -> `None` — Enables or disables removal event listening
  - `set_removal_event_request_settings(settings)` -> `None` — Sets removal event request settings dynamically
  - `set_trailing_event_enabled(is_enabled)` -> `None` — Enables or disables trailing event listening
  - `set_trailing_event_request_settings(settings)` -> `None` — Sets trailing event request settings dynamically
  - `sort_breaking_events(breaking_events, sort_method)` -> `Array [ ChaosBreakingEventData ]` — Sorts breaking events according to the given sort method
  - `sort_collision_events(collision_events, sort_method)` -> `Array [ ChaosCollisionEventData ]` — Sorts collision events according to the given sort method
  - `sort_removal_events(removal_events, sort_method)` -> `Array [ ChaosRemovalEventData ]` — Sorts removal events according to the given sort method
  - `sort_trailing_events(trailing_events, sort_method)` -> `Array [ ChaosTrailingEventData ]` — Sorts trailing events according to the given sort method

**Properties** (14):
  - `breaking_event_request_settings`: `ChaosBreakingEventRequestSettings` [Read-Only] — [Read-Only] The settings to use for breaking event listening (ChaosBreakingEventRequestSettings)
  - `chaos_solver_actors`: `None` [Read-Only] — [Read-Only] Which chaos solver actors weâre using. If empty, this listener will fallback to the â...
  - `collision_event_request_settings`: `ChaosCollisionEventRequestSettings` [Read-Only] — [Read-Only] The settings to use for collision event listening (ChaosCollisionEventRequestSettings)
  - `geometry_collection_actors`: `None` [Read-Only] — [Read-Only] Which chaos solver actors weâre using. If empty, this listener will fallback to the â...
  - `is_breaking_event_listening_enabled`: `bool` [Read-Only] — [Read-Only] Whether or not collision event listening is enabled (bool)
  - `is_collision_event_listening_enabled`: `bool` [Read-Only] — [Read-Only] Whether or not collision event listening is enabled (bool)
  - `is_removal_event_listening_enabled`: `bool` [Read-Only] — [Read-Only] Whether or not removal event listening is enabled (bool)
  - `is_trailing_event_listening_enabled`: `bool` [Read-Only] — [Read-Only] Whether or not trailing event listening is enabled (bool)
  - `on_breaking_events`: `OnChaosBreakingEvents` — [Read-Write] Called when new breaking events are available. (OnChaosBreakingEvents)
  - `on_collision_events`: `OnChaosCollisionEvents` — [Read-Write] Called when new collision events are available. (OnChaosCollisionEvents)
  - `on_removal_events`: `OnChaosRemovalEvents` — [Read-Write] Called when new trailing events are available. (OnChaosRemovalEvents)
  - `on_trailing_events`: `OnChaosTrailingEvents` — [Read-Write] Called when new trailing events are available. (OnChaosTrailingEvents)
  - `removal_event_request_settings`: `ChaosRemovalEventRequestSettings` [Read-Only] — [Read-Only] The settings to use for removal event listening (ChaosRemovalEventRequestSettings)
  - `trailing_event_request_settings`: `ChaosTrailingEventRequestSettings` [Read-Only] — [Read-Only] The settings to use for trailing event listening (ChaosTrailingEventRequestSettings)

### `unreal.GeometryCollection`
Inherits: `Object` | Header: `GeometryCollectionObject.h`

UGeometryCollectionObject (UObject)

**Methods** (7):
  - `add_asset_user_data_of_class(user_data_class)` -> `bool` — Creates and adds an instance of the provided AssetUserData class to the target asset.
  - `get_asset_user_data_of_class(user_data_class)` -> `AssetUserData` — Returns an instance of the provided AssetUserData class if itâs contained in the target asset.
  - `get_dataflow_asset()` -> `Dataflow` — Get Dataflow Asset
  - `has_asset_user_data_of_class(user_data_class)` -> `bool` — Checks whether or not an instance of the provided AssetUserData class is contained.
  - `set_convert_vertex_colors_to_srgb(value)` -> `None` — Set Convert Vertex Colors to SRGB
  - `set_dataflow_asset(dataflow_asset)` -> `None` — Set Dataflow Asset
  - `set_enable_nanite(value)` -> `None` — Set Enable Nanite

**Properties** (39):
  - `asset_import_data`: `AssetImportData` — [Read-Write] Importing data and options used for this geometry collection (AssetImportData)
  - `automatic_crumble_partial_clusters`: `bool` [Read-Only] — [Read-Only] When using remove on sleep , automatically crumble partial cluster into smaller pieces w...
  - `collision_object_reduction_percentage`: `float` — 10)
deprecated: This property is deprecated. Use the default SizeSpecificData instead. (float) [Read...
  - `collision_particles_fraction`: `float` — [Read-Write] Number of particles on the triangulated surface to use for collisions.
deprecated: This...
  - `collision_type`: `CollisionTypeEnum` — [Read-Write] *  CollisionType defines how to initialize the rigid collision structures.
deprecated: ...
  - `convert_vertex_colors_to_srgb`: `bool` — [Read-Write] Convert vertex colors to sRGB for rendering. Exposed to avoid changing vertex color ren...
  - `custom_renderer_type`: `Class` — [Read-Write] Custom class type that will be used to render the geometry collection instead of using ...
  - `damage_model`: `DamageModelTypeEnum` — [Read-Write] Damage model to use for evaluating destruction. (DamageModelTypeEnum)
  - `dataflow_asset`: `Dataflow` — [Read-Write] this is deprecated data replaced with Setter and Getter but it is exposed to blueprint
...
  - `dataflow_terminal`: `str` — [Read-Write]
deprecated: Dataflow terminal name is now stored in DataflowInstance (str)
  - `density_from_physics_material`: `bool` — [Read-Write] Whether to use density ( for mass computation ) from physics material ( if physics mate...
  - `enable_nanite`: `bool` — [Read-Write] Enable support for Nanite. (bool)
  - `enable_remove_pieces_on_fracture`: `bool` — [Read-Write] Enable remove pieces on fracture
deprecated: Use remove on break feature instead ( Frac...
  - `geometry_source`: `None` — [Read-Write] (Array[GeometryCollectionSource])
  - `implicit_type`: `ImplicitTypeEnum` — [Read-Write] *  CollisionType defines how to initialize the rigid collision structures.
deprecated: ...
  - `import_collision_from_source`: `bool` — [Read-Write] whether to import collision from the source asset (bool)
  - `mass`: `float` — [Read-Write] Total Mass of Collection. If density, units are in kg/m^3 ( only enabled if physics mat...
  - `mass_as_density`: `bool` — [Read-Write] Mass As Density, units are in kg/m^3 ( only enabled if physics material is not set ) (b...
  - `max_cluster_level_set_resolution`: `int` — 10)
deprecated: This property is deprecated. Use the default SizeSpecificData instead. (int32) [Read...
  - `max_level_set_resolution`: `int` — 10)
deprecated: This property is deprecated. Use the default SizeSpecificData instead. (int32) [Read...
  - `maximum_collision_particles`: `int` — [Read-Write] Max number of particles.
deprecated: This property is deprecated. Use the default SizeS...
  - `maximum_sleep_time`: `Vector2D` [Read-Only] — [Read-Only] How long may the particle sleep before initiating removal (in seconds). (Vector2D)
  - `min_cluster_level_set_resolution`: `int` — 5)
deprecated: This property is deprecated. Use the default SizeSpecificData instead. (int32) [Read-...
  - `min_level_set_resolution`: `int` — 5)
deprecated: This property is deprecated. Use the default SizeSpecificData instead. (int32) [Read-...
  - `minimum_mass_clamp`: `float` [Read-Only] — 0.1) (float) [Read-Only] Smallest allowable mass (def
  - `optimize_convexes`: `bool` — [Read-Write] whether to optimize convexes for collisions. If true the convex optimizer will generate...
  - `overrides`: `None` — [Read-Write] (Map[str,str])
  - `physics_material`: `PhysicalMaterial` [Read-Only] — [Read-Only] Physics material to use for the geometry collection (PhysicalMaterial)
  - `removal_duration`: `Vector2D` [Read-Only] — [Read-Only] How long does the removal process take (in seconds). (Vector2D)
  - `remove_on_fracture_materials`: `None` — [Read-Write] Materials relating to remove on fracture
deprecated: Use remove on break feature instea...
  - `remove_on_max_sleep`: `bool` [Read-Only] — [Read-Only] Remove particle from simulation and dissolve rendered geometry once sleep threshold has ...
  - `root_proxy`: `SoftObjectPath` — [Read-Write] static mesh to use as a proxy for rendering until the geometry collection is broken
dep...
  - `root_proxy_data`: `GeometryCollectionProxyMeshData` — [Read-Write] Static mesh to use as a proxy for rendering until the geometry collection is broken. (G...
  - `scale_on_removal`: `bool` — [Read-Write] When enabled, particle will scale down (shrink) when using being removed ( using both r...
  - `slow_moving_as_sleeping`: `bool` [Read-Only] — [Read-Only] when on non-sleeping, slow moving pieces will be considered as sleeping, this helps remo...
  - `slow_moving_velocity_threshold`: `float` [Read-Only] — [Read-Only] When slow moving detection is on, this defines the linear velocity thresholds in cm/s to...
  - `strip_on_cook`: `bool` — [Read-Write] Strip unnecessary data from the Geometry Collection to keep the memory footprint as sma...
  - `strip_render_data_on_cook`: `bool` — [Read-Write] Strip unnecessary render data from the Geometry Collection to keep the memory footprint...
  - `use_material_damage_modifiers`: `bool` — [Read-Write] When on , use the modifiers on the material to adjust the user defined damage threshold...

### `unreal.GeometryCollectionActor`
Inherits: `Actor` | Header: `GeometryCollectionActor.h`

Geometry Collection Actor

**Methods** (1):
  - `raycast_single(start, end)` -> `HitResult or None` — Raycast Single

**Properties** (1):
  - `geometry_collection_component`: `GeometryCollectionComponent` [Read-Only] — [Read-Only] GeometryCollectionComponent (GeometryCollectionComponent)

### `unreal.GeometryCollectionComponent`
Inherits: `MeshComponent` | Header: `GeometryCollectionComponent.h`

**Methods** (42):
  - `apply_angular_velocity(item_index, angular_velocity)` -> `None` — Apply angular velocity on specific piece
  - `apply_asset_defaults()` -> `None` — Apply default values from asset ( damage related data and physics material )
  - `apply_breaking_angular_velocity(item_index, angular_velocity)` -> `None` — Apply linear velocity on breaking pieces for a specific cluster If ItemIndex does not represent a cluster this will do n...
  - `apply_breaking_linear_velocity(item_index, linear_velocity)` -> `None` — Apply linear velocity on breaking pieces for a specific cluster If ItemIndex does not represent a cluster this will do n...
  - `apply_external_strain(item_index, location, radius = 0.000000, propagation_depth = 0, propagation_factor = 1.000000, strain = 0.000000)` -> `None` — Apply an external strain to specific piece of the geometry collection
  - `apply_internal_strain(item_index, location, radius = 0.000000, propagation_depth = 0, propagation_factor = 1.000000, strain = 0.000000)` -> `None` — Apply an internal strain to specific piece of the geometry collection
  - `apply_kinematic_field(radius, position)` -> `None`
  - `apply_linear_velocity(item_index, linear_velocity)` -> `None` — Apply linear velocity on specific piece
  - `apply_physics_field(enabled, target, meta_data, field)` -> `None`
  - `crumble_active_clusters()` -> `None` — Crumbe active clusters for this entire geometry collection this will apply to internal and regular clusters
  - `crumble_cluster(item_index)` -> `None` — Crumbe a cluster into all its pieces
  - `enable_root_proxy_for_custom_renderer(enable)` -> `None` — Enable Root Proxy for Custom Renderer deprecated: Please use ForceBrokenForCustomRenderer() instead
  - `force_broken_for_custom_renderer(force_broken)` -> `None` — Force any custom renderer to render using the broken/decayed path. This can be set at runtime
  - `get_debug_info()` -> `str` — RestCollection
  - `get_initial_level(item_index)` -> `int32` — Get the initial level of a specific piece Initial level means the level as it is in the unbroken state
  - `get_initial_local_rest_transforms()` -> `Array [ Transform ]` — Get the initial rest transforms in component (local) space space, they are the transforms as defined in the rest collect...
  - `get_local_bounds()` -> `Box` — Get local bounds of the geometry collection
  - `get_local_rest_transforms(initial_transforms = False)` -> `Array [ Transform ]` — Get the rest transforms in component (local) space space, if none have been set by SetLocalRestTransforms or if RestTran...
  - `get_mass_and_extents(out_extents=Box)` — Get mass and extent of a specific piece
  - `get_root_current_transform()` -> `Transform` — Get the root item current world transform
  - `get_root_index()` -> `int32` — Get the root item index of the hierarchy
  - `get_root_initial_transform()` -> `Transform` — Get the root item initial transform in world space
  - `is_root_broken()` -> `bool` — return true if the root cluster is not longer active at runtime
  - `receive_physics_collision(collision_info)` -> `None` — Receive Physics Collision
  - `remove_all_anchors()` -> `None` — this will remove anchors on all the pieces ( including the static and kinematic initial states ones ) of the geometry co...
  - `set_abandoned_particle_collision_profile_name(collision_profile)` -> `None` — Set Abandoned Particle Collision Profile Name
  - `set_anchored_by_box(world_space_box, anchored, max_level = -1)` -> `None` — Set all pieces within a world space bounding box to be anchored or not
  - `set_anchored_by_index(index, anchored)` -> `None` — Set a piece or cluster to be anchored or not
  - `set_anchored_by_transformed_box(box, transform, anchored, max_level = -1)` -> `None` — Set all pieces within a world transformed bounding box to be anchored or not
  - `set_enable_damage_from_collision(value)` -> `None` — Set Enable Damage from Collision
  - `set_local_rest_transforms(transforms, only_leaves)` -> `None` — Set the local rest transform, this may be different from the rest collection If the geometry collection is already simul...
  - `set_notify_breaks(new_notify_breaks)` -> `None` — Changes whether or not this component will get future break notifications.
  - `set_notify_crumblings(new_notify_crumblings, new_crumbling_event_includes_children = False)` -> `None` — Changes whether or not this component will get future crumbling notifications.
  - `set_notify_global_breaks(new_notify_global_breaks)` -> `None` — Changes whether or not this component will get future global break notifications.
  - `set_notify_global_collision(new_notify_global_collisions)` -> `None` — Changes whether or not this component will get future global collision notifications.
  - `set_notify_global_crumblings(new_notify_global_crumblings, global_new_crumbling_event_includes_children)` -> `None` — Changes whether or not this component will get future global crumbling notifications.
  - `set_notify_global_removals(new_notify_global_removals)` -> `None` — Changes whether or not this component will get future global removal notifications.
  - `set_notify_removals(new_notify_removals)` -> `None` — Changes whether or not this component will get future removal notifications.
  - `set_per_level_collision_profile_names(profile_names)` -> `None` — Set Per Level Collision Profile Names
  - `set_per_particle_collision_profile_name(bone_ids, profile_name)` -> `None` — Set Per Particle Collision Profile Name
  - `set_rest_collection(rest_collection_in, apply_asset_defaults = True)` -> `None` — RestCollection
  - `set_root_proxy_component_space_transform(index, root_proxy_transform)` -> `None` — blueprint function to set a specific root proxy local transform warning: when called from C++ and calling it on multiple...

**Properties** (67):
  - `abandoned_collision_profile_name`: `Name` — [Read-Write] Whether abandoned particles on the client should continue to have collision (i.e.
still...
  - `allow_removal_on_break`: `bool` — [Read-Write] Allow removal on break for the instance if the rest collection has it enabled (bool)
  - `allow_removal_on_sleep`: `bool` — [Read-Write] Allow removal on sleep for the instance if the rest collection has it enabled (bool)
  - `angular_ether_drag`: `float` — [Read-Write] Uniform angular ether drag.
deprecated: Use PhysicalMaterial instead. (float)
  - `cache_playback`: `bool` [Read-Only] — [Read-Only] (bool)
  - `chaos_solver_actor`: `ChaosSolverActor` — [Read-Write] Chaos RBD Solver override. Will use the worldâs default solver actor if null. (ChaosS...
  - `cluster_connection_type`: `ClusterConnectionTypeEnum` — [Read-Write]
deprecated: Connection types are defined on the asset now. (ClusterConnectionTypeEnum)
  - `cluster_group_index`: `int` — [Read-Write] Cluster group index - Geometry Collections using the same index will simulate as one si...
  - `collision_group`: `int` — [Read-Write] (int32)
  - `collision_profile_per_level`: `None` — [Read-Write] A per-level collision profile name. If the name is set to NONE or an invalid collision ...
  - `collision_sample_fraction`: `float` — [Read-Write] Fraction of collision sample particles to keep (float)
  - `crumbling_event_includes_children`: `bool` [Read-Only] — [Read-Only] If this and bNotifyCrumblings are true, the crumbling events will contain released child...
  - `custom_renderer_type`: `Class` — [Read-Write] Custom class type that will be used to render the geometry collection instead of using ...
  - `damage_model`: `DamageModelTypeEnum` — [Read-Write] Damage model to use for evaluating destruction. (DamageModelTypeEnum)
  - `damage_propagation_data`: `GeometryCollectionDamagePropagationData` — [Read-Write] Data about how damage propagation shoudl behave. (GeometryCollectionDamagePropagationDa...
  - `damage_threshold`: `None` — [Read-Write] (Array[float])
  - `density_from_physics_material`: `bool` — [Read-Write] when true, density will be used to compute mass using the assigned physics material (bo...
  - `desired_cache_time`: `float` [Read-Only] — [Read-Only] (float)
  - `enable_abandon_after_level`: `bool` — [Read-Write] Enables use of ReplicationAbandonAfterLevel to stop providing network updates to
client...
  - `enable_clustering`: `bool` — [Read-Write] (bool)
  - `enable_damage_from_collision`: `bool` — [Read-Write] Whether or not collisions against this geometry collection will apply strain which coul...
  - `enable_replication`: `bool` — [Read-Write] Per-instance override to enable/disable replication for the geometry collection (bool)
  - `force_motion_blur`: `bool` — [Read-Write] If ForceMotionBlur is on, motion blur will always be active, even if the GeometryCollec...
  - `force_update_active_transforms`: `bool` — [Read-Write] Update transforms of active particles even when they are not moving. Has performance im...
  - `global_crumbling_event_includes_children`: `bool` [Read-Only] — [Read-Only] If this and bNotifyGlobalCrumblings are true, the crumbling events will contain released...
  - `gravity_group_index`: `int` — [Read-Write] (int32)
  - `initial_angular_velocity`: `Vector` — [Read-Write] (Vector)
  - `initial_linear_velocity`: `Vector` — [Read-Write] (Vector)
  - `initial_velocity_type`: `InitialVelocityTypeEnum` — [Read-Write] (InitialVelocityTypeEnum)
  - `initialization_fields`: `None` [Read-Only] — [Read-Only] (Array[FieldSystemActor])
  - `linear_ether_drag`: `float` — [Read-Write] Uniform linear ether drag.
deprecated: Use PhysicalMaterial instead. (float)
  - `max_cluster_level`: `int` — [Read-Write] Maximum level for cluster breaks. (int32)
  - `max_simulated_level`: `int` — [Read-Write] The maximum level to create rigid bodies that could be simulated.
Example: If we have a...
  - `notify_breaks`: `bool` [Read-Only] — [Read-Only] If true, this component will generate breaking events that other systems may subscribe t...
  - `notify_collisions`: `bool` [Read-Only] — [Read-Only] If true, this component will generate collision events that other systems may subscribe ...
  - `notify_crumblings`: `bool` [Read-Only] — [Read-Only] If true, this component will generate crumbling events that other systems may subscribe ...
  - `notify_geometry_collection_physics_loading_state_change`: `NotifyGeometryCollectionPhysicsLoadingStateChange` — [Read-Write] (NotifyGeometryCollectionPhysicsLoadingStateChange)
  - `notify_geometry_collection_physics_state_change`: `NotifyGeometryCollectionPhysicsStateChange` — [Read-Write] (NotifyGeometryCollectionPhysicsStateChange)
  - `notify_global_breaks`: `bool` [Read-Only] — [Read-Only] If true, this component will generate breaking events that will be listened by the globa...
  - `notify_global_collisions`: `bool` [Read-Only] — [Read-Only] If true, this component will generate collision events  that will be listened by the glo...
  - `notify_global_crumblings`: `bool` [Read-Only] — [Read-Only] If true, this component will generate crumbling events  that will be listened by the glo...
  - `notify_global_removals`: `bool` [Read-Only] — [Read-Only] If true, this component will generate removal events  that will be listened by the globa...
  - `notify_removals`: `bool` [Read-Only] — [Read-Only] If true, this component will generate removal events that other systems may subscribe to...
  - `notify_trailing`: `bool` [Read-Only] — [Read-Only] If true, this component will generate trailing events that other systems may subscribe t...
  - `object_type`: `ObjectStateTypeEnum` — [Read-Write] ObjectType defines how to initialize the rigid objects state, Kinematic, Sleeping, Dyna...
  - `on_chaos_break_event`: `OnChaosBreakEvent` — [Read-Write] (OnChaosBreakEvent)
  - `on_chaos_crumbling_event`: `OnChaosCrumblingEvent` — [Read-Write] (OnChaosCrumblingEvent)
  - `on_chaos_physics_collision`: `OnChaosPhysicsCollision` — [Read-Write] (OnChaosPhysicsCollision)
  - `on_chaos_removal_event`: `OnChaosRemovalEvent` — [Read-Write] (OnChaosRemovalEvent)
  - `one_way_interaction_level`: `int` — [Read-Write] All bodies with a level greater than or equal to this will have One-Way Interaction ena...
  - `override_custom_renderer`: `bool` — [Read-Write] If true, CustomRendererType will be used. If false, CustomRendererType comes from the R...
  - `physical_material`: `ChaosPhysicalMaterial` — [Read-Write] Physical Properties
deprecated: Physical material now derived from render materials, fo...
  - `physical_material_override`: `PhysicalMaterial` — [Read-Write]
deprecated: Physical material now derived from render materials, for instance overrides...
  - `replication_abandon_after_level`: `int` — [Read-Write] If replicating - the cluster level after which replication will not happen
see: bEnable...
  - `replication_abandon_cluster_level`: `int` — [Read-Write] If replicating - the cluster level to stop sending corrections for geometry collection ...
  - `replication_max_position_and_velocity_correction_level`: `int` — [Read-Write] If replicating - the maximum level where clusters will have their position and velocity...
  - `rest_collection`: `GeometryCollection` [Read-Only] — [Read-Only] (GeometryCollection)
  - `run_time_data_collection_guid`: `Guid` [Read-Only] — [Read-Only] (Guid)
  - `show_bone_colors`: `bool` — [Read-Write] Display Bone Colors instead of assigned materials (bool)
  - `simulating`: `bool` — [Read-Write]
deprecated: GeometryCollection now abides the bSimulatePhysics flag from the base class...
  - `store_velocities`: `bool` [Read-Only] — [Read-Only] If true, this component will save linear and angular velocities on its DynamicCollection...
  - `update_component_transform_to_root_bone`: `bool` — [Read-Write] Relocate the component so that the original offset to the root bone is maintained
This ...
  - `update_navigation_in_tick`: `bool` — [Read-Write] (bool)
  - `use_material_damage_modifiers`: `bool` — [Read-Write] When on , use the modifiers on the material to adjust the user defined damage threshold...
  - `use_root_proxy_for_navigation`: `bool` — [Read-Write] (bool)
  - `use_size_specific_damage_threshold`: `bool` — [Read-Write] Damage threshold for clusters at different levels. (bool)
  - `use_static_mesh_collision_for_traces`: `bool` — Remove the ability to change this at runtime, as weâll want to use this at cook time instead (bool...

### `unreal.GeometryCollectionDebugDrawActor`
Inherits: `Actor` | Header: `GeometryCollectionDebugDrawActor.h`

Geometry Collection Debug Draw Actor

### `unreal.GeometryCollectionDebugDrawComponent`
Inherits: `ActorComponent` | Header: `GeometryCollectionDebugDrawComponent.h`

Geometry Collection Debug Draw Component

### `unreal.GeometryCollectionISMPoolActor`
Inherits: `Actor` | Header: `GeometryCollectionISMPoolActor.h`

Geometry Collection ISMPool Actor

**Properties** (2):
  - `ism_pool_comp`: `GeometryCollectionISMPoolComponent` [Read-Only] — [Read-Only] (GeometryCollectionISMPoolComponent)
  - `ism_pool_debug_draw_comp`: `GeometryCollectionISMPoolDebugDrawComponent` [Read-Only] — [Read-Only] (GeometryCollectionISMPoolDebugDrawComponent)

### `unreal.GeometryCollectionISMPoolComponent`
Inherits: `SceneComponent` | Header: `GeometryCollectionISMPoolComponent.h`

Geometry Collection ISMPool Component

### `unreal.GeometryCollectionISMPoolDebugDrawComponent`
Inherits: `DebugDrawComponent` | Header: `GeometryCollectionISMPoolDebugDrawComponent.h`

Geometry Collection ISMPool Debug Draw Component

### `unreal.GeometryCollectionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `GeometryCollectionBlueprintLibrary.h`

Blueprint library for Geometry Collections.

**Methods** (3):
  - `set_custom_instance_data_by_index(geometry_collection_component, custom_data_index, custom_data_value)` -> `None` [classmethod] — Set a custom instance data value for all instances associated with a geometry collection. This assumes that the geometry...
  - `set_custom_instance_data_by_name(geometry_collection_component, custom_data_name, custom_data_value)` -> `None` [classmethod] — Set a custom instance data value for all instances associated with a geometry collection. This assumes that the geometry...
  - `set_ism_pool_custom_instance_data(geometry_collection_component, custom_data_index, custom_data_value)` -> `None` [classmethod] — Set ISMPool Custom Instance Data deprecated: Use SetCustomInstanceDataByIndex() instead

### `unreal.GeometryCollectionRenderLevelSetActor`
Inherits: `Actor` | Header: `GeometryCollectionRenderLevelSetActor.h`

AGeometryCollectionRenderLevelSetActor An actor representing the collection of data necessary to render volumes. This references a ray marching material, which is used internally by a post process com...

**Properties** (6):
  - `enabled`: `bool` — [Read-Write] Enable or disable rendering (bool)
  - `isovalue`: `float` — [Read-Write] Isovalue of the level set to use for surface reconstruction.  Generally you want
this t...
  - `ray_march_material`: `Material` — [Read-Write] Material that performs ray marching.  Note this must have certain parameters in order
t...
  - `render_volume_bounding_box`: `bool` — [Read-Write] Enable or disable rendering (bool)
  - `surface_tolerance`: `float` — [Read-Write] Surface tolerance used for rendering.  When surface reconstruction is noisy,
try tweaki...
  - `target_volume_texture`: `VolumeTexture` — [Read-Write] Volume texture to fill (VolumeTexture)

### `unreal.ChaosBreakingSortMethod`
Inherits: `EnumBase` | Header: `ChaosBreakingEventFilter.h`

Enumeration defining how to sort breaking results

**Properties** (4):
  - `SORT_BY_HIGHEST_MASS`: `ChaosBreakingSortMethod = Ellipsis` — 1
  - `SORT_BY_HIGHEST_SPEED`: `ChaosBreakingSortMethod = Ellipsis` — 2
  - `SORT_BY_NEAREST_FIRST`: `ChaosBreakingSortMethod = Ellipsis` — 3
  - `SORT_NONE`: `ChaosBreakingSortMethod = Ellipsis` — 0

### `unreal.ChaosCollisionSortMethod`
Inherits: `EnumBase` | Header: `ChaosCollisionEventFilter.h`

Enumeration defining how to sort collision results

**Properties** (5):
  - `SORT_BY_HIGHEST_IMPULSE`: `ChaosCollisionSortMethod = Ellipsis` — 3
  - `SORT_BY_HIGHEST_MASS`: `ChaosCollisionSortMethod = Ellipsis` — 1
  - `SORT_BY_HIGHEST_SPEED`: `ChaosCollisionSortMethod = Ellipsis` — 2
  - `SORT_BY_NEAREST_FIRST`: `ChaosCollisionSortMethod = Ellipsis` — 4
  - `SORT_NONE`: `ChaosCollisionSortMethod = Ellipsis` — 0

### `unreal.ChaosRemovalSortMethod`
Inherits: `EnumBase` | Header: `ChaosRemovalEventFilter.h`

Enumeration defining how to sort removal results

**Properties** (3):
  - `SORT_BY_HIGHEST_MASS`: `ChaosRemovalSortMethod = Ellipsis` — 1
  - `SORT_BY_NEAREST_FIRST`: `ChaosRemovalSortMethod = Ellipsis` — 2
  - `SORT_NONE`: `ChaosRemovalSortMethod = Ellipsis` — 0

### `unreal.ChaosTrailingSortMethod`
Inherits: `EnumBase` | Header: `ChaosTrailingEventFilter.h`

Enumeration defining how to sort trailing results

**Properties** (4):
  - `SORT_BY_HIGHEST_MASS`: `ChaosTrailingSortMethod = Ellipsis` — 1
  - `SORT_BY_HIGHEST_SPEED`: `ChaosTrailingSortMethod = Ellipsis` — 2
  - `SORT_BY_NEAREST_FIRST`: `ChaosTrailingSortMethod = Ellipsis` — 3
  - `SORT_NONE`: `ChaosTrailingSortMethod = Ellipsis` — 0

### `unreal.GeometryCollectionDebugDrawActorHideGeometry`
Inherits: `EnumBase` | Header: `GeometryCollectionDebugDrawActor.h`

**Properties** (5):
  - `HIDE_ALL`: `GeometryCollectionDebugDrawActorHideGeometry = Ellipsis` — Hide all geometry collections. 4
  - `HIDE_NONE`: `GeometryCollectionDebugDrawActorHideGeometry = Ellipsis` — Do not hide any geometry. 0
  - `HIDE_SELECTED`: `GeometryCollectionDebugDrawActorHideGeometry = Ellipsis` — Hide the geometry associated with the selected rigid bodies. 2
  - `HIDE_WHOLE_COLLECTION`: `GeometryCollectionDebugDrawActorHideGeometry = Ellipsis` — Hide the entire geometry collection associated with the selected rigid bodies. 3
  - `HIDE_WITH_COLLISION`: `GeometryCollectionDebugDrawActorHideGeometry = Ellipsis` — Hide the geometry associated with rigid bodies that are selected for collision volume visualization....

### `unreal.GeometryCollectionComponent_NotifyGeometryCollectionPhysicsLoadingStateChange`
Inherits: `MulticastDelegateBase` | Header: `GeometryCollectionComponent.h`

Notify Geometry Collection Physics Loading State Change Delegate Signature

### `unreal.GeometryCollectionComponent_NotifyGeometryCollectionPhysicsStateChange`
Inherits: `MulticastDelegateBase` | Header: `GeometryCollectionComponent.h`

Blueprint event

### `unreal.OnChaosBreakEvent`
Inherits: `MulticastDelegateBase` | Header: `GeometryCollectionComponent.h`

On Chaos Break Event Delegate Signature

### `unreal.OnChaosBreakingEvents`
Inherits: `MulticastDelegateBase` | Header: `ChaosBlueprint.h`

Called when new destruction events are available for breaks. Breaking listening must be enabled to get callbacks on this delegate.

### `unreal.OnChaosCollisionEvents`
Inherits: `MulticastDelegateBase` | Header: `ChaosBlueprint.h`

Called when new destruction events are available for collisions. Collision listening must be enabled to get callbacks on this delegate.

### `unreal.OnChaosCrumblingEvent`
Inherits: `MulticastDelegateBase` | Header: `GeometryCollectionComponent.h`

On Chaos Crumbling Event Delegate Signature

### `unreal.OnChaosRemovalEvent`
Inherits: `MulticastDelegateBase` | Header: `GeometryCollectionComponent.h`

On Chaos Removal Event Delegate Signature

### `unreal.OnChaosRemovalEvents`
Inherits: `MulticastDelegateBase` | Header: `ChaosBlueprint.h`

Called when new destruction events are available for removals. Removal listening must be enabled to get callbacks on this delegate.

### `unreal.OnChaosTrailingEvents`
Inherits: `MulticastDelegateBase` | Header: `ChaosBlueprint.h`

Called when new trailing events are available for breaks. Trailing listening must be enabled to get callbacks on this delegate.

### `unreal.OnGeometryCollectionFullyDecayedEvent`
Inherits: `MulticastDelegateBase` | Header: `GeometryCollectionComponent.h`

On Geometry Collection Fully Decayed Event Delegate Signature

### `unreal.OnGeometryCollectionRootMovedEvent`
Inherits: `MulticastDelegateBase` | Header: `GeometryCollectionComponent.h`

On Geometry Collection Root Moved Event Delegate Signature
