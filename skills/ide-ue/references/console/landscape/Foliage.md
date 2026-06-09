# UE Python API — Foliage Module

**22 types** from the `Foliage` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FoliageDensityFalloff`, `FoliageTypeObject`, `FoliageVertexColorChannelMask`, `ProceduralFoliageInstance`, `FoliageInstancedStaticMeshComponent`, `FoliageStatistics`, `FoliageType`, `FoliageType_Actor`, `FoliageType_InstancedStaticMesh`, `GrassInstancedStaticMeshComponent`, `InstancedFoliageActor`, `InteractiveFoliageActor`, `InteractiveFoliageComponent`, `ProceduralFoliageBlockingVolume`, `ProceduralFoliageComponent`, `ProceduralFoliageSpawner`, `ProceduralFoliageVolume`, `FoliageScaling`, `SimulationOverlap`, `SimulationQuery`, ... (22 total)

---

## Classes

### `unreal.FoliageDensityFalloff`
Inherits: `StructBase` | Header: `FoliageType.h`

Foliage Density Falloff

### `unreal.FoliageTypeObject`
Inherits: `StructBase` | Header: `FoliageTypeObject.h`

A wrapper struct used to allow the use of either FoliageType assets or FoliageType blueprint classes

### `unreal.FoliageVertexColorChannelMask`
Inherits: `StructBase` | Header: `FoliageType.h`

Foliage Vertex Color Channel Mask

### `unreal.ProceduralFoliageInstance`
Inherits: `StructBase` | Header: `ProceduralFoliageInstance.h`

Procedural Foliage Instance

**Properties** (3):
  - `age`: `float` — [Read-Write] (float)
  - `location`: `Vector` — [Read-Write] (Vector)
  - `normal`: `Vector` — [Read-Write] (Vector)

### `unreal.FoliageInstancedStaticMeshComponent`
Inherits: `HierarchicalInstancedStaticMeshComponent` | Header: `FoliageInstancedStaticMeshComponent.h`

Foliage Instanced Static Mesh Component

**Properties** (2):
  - `on_instance_take_point_damage`: `InstancePointDamageSignature` — [Read-Write] (InstancePointDamageSignature)
  - `on_instance_take_radial_damage`: `InstanceRadialDamageSignature` — [Read-Write] (InstanceRadialDamageSignature)

### `unreal.FoliageStatistics`
Inherits: `BlueprintFunctionLibrary` | Header: `FoliageStatistics.h`

Foliage Statistics

**Methods** (3):
  - `foliage_overlapping_box_count(world_context_object, static_mesh, box)` -> `int32` [classmethod] — Gets the number of instances overlapping a provided box
  - `foliage_overlapping_box_transforms(world_context_object, static_mesh, box)` -> `Array [ Transform ]` [classmethod] — Get the transform of every instance overlapping the provided FBox
  - `foliage_overlapping_sphere_count(world_context_object, static_mesh, center_position, radius)` -> `int32` [classmethod] — Counts how many foliage instances overlap a given sphere

### `unreal.FoliageType`
Inherits: `Object` | Header: `FoliageType.h`

Foliage Type

**Methods** (1):
  - `get_source()` -> `Object` — Returns the source asset for a UFoliageType. It can be a UStaticMesh in case weâre dealing with a UFoliageType_Instanc...

**Properties** (42):
  - `affect_distance_field_lighting`: `bool` [Read-Only] — [Read-Only] Controls whether the primitive should affect dynamic distance field lighting methods.  T...
  - `affect_dynamic_indirect_lighting`: `bool` [Read-Only] — [Read-Only] Controls whether the foliage should inject light into the Light Propagation Volume.  Thi...
  - `align_max_angle`: `float` — [Read-Write] The maximum angle in degrees that foliage instances will be adjusted away from the vert...
  - `align_to_normal`: `bool` — [Read-Write] Whether foliage instances should have their angle adjusted away from vertical to match ...
  - `average_normal`: `bool` — [Read-Write] Will average normal based on Foliage Type base radius (this as a cost as it will do ext...
  - `average_normal_sample_count`: `int` — [Read-Write] Line trace count to use around hit location when averaging normal (int32)
  - `average_normal_single_component`: `bool` — [Read-Write] Whether to discard normals originating from other hit components or not when averaging ...
  - `cast_contact_shadow`: `bool` [Read-Only] — [Read-Only] Whether the object should cast contact shadows. This flag is only used if CastShadow is ...
  - `cast_dynamic_shadow`: `bool` [Read-Only] — [Read-Only] Controls whether the foliage should cast shadows in the case of non precomputed shadowin...
  - `cast_shadow`: `bool` [Read-Only] — [Read-Only] Controls whether the foliage should cast a shadow or not. (bool)
  - `cast_shadow_as_two_sided`: `bool` [Read-Only] — [Read-Only] Whether this foliage should cast dynamic shadows as if it were a two sided material. (bo...
  - `cast_static_shadow`: `bool` [Read-Only] — [Read-Only] Whether the foliage should cast a static shadow from shadow casting lights.  This flag i...
  - `collision_scale`: `Vector` — [Read-Write] The foliage instanceâs collision bounding box will be scaled by the specified amount ...
  - `collision_with_world`: `bool` — [Read-Write] If checked, an overlap test with existing world geometry is performed before each insta...
  - `custom_depth_stencil_value`: `int` [Read-Only] — [Read-Only] Optionally write this 0-255 value to the stencil buffer in CustomDepth pass (Requires pr...
  - `custom_depth_stencil_write_mask`: `RendererStencilMask` [Read-Only] — [Read-Only] Mask used for stencil buffer writes. (RendererStencilMask)
  - `evaluate_world_position_offset`: `bool` [Read-Only] — [Read-Only] (bool)
  - `exclusion_landscape_layers`: `None` — [Read-Write] If layer names are specified, painting on landscape will exclude the foliage to areas o...
  - `ground_slope_angle`: `FloatInterval` — [Read-Write] Foliage instances will only be placed on surfaces sloping in the specified angle range ...
  - `height`: `FloatInterval` — [Read-Write] The valid altitude range where foliage instances will be placed, specified using minimu...
  - `include_in_hlod`: `bool` — [Read-Write] (bool)
  - `landscape_layers`: `None` — [Read-Write] If layer names are specified, painting on landscape will limit the foliage to areas of ...
  - `lighting_channels`: `LightingChannels` [Read-Only] — [Read-Only] Lighting channels that placed foliage will be assigned. Lights with matching channels wi...
  - `lightmap_type`: `LightmapType` [Read-Only] — [Read-Only] Controls the type of lightmap used for this component. (LightmapType)
  - `minimum_exclusion_layer_weight`: `float` — [Read-Write] Specifies the minimum value above which the landscape exclusion layer weight value must...
  - `minimum_layer_weight`: `float` — [Read-Write] Specifies the minimum value above which the landscape layer weight value must be, in or...
  - `mobility`: `ComponentMobility` [Read-Only] — [Read-Only] Mobility property to apply to foliage components (ComponentMobility)
  - `overridden_light_map_res`: `int` [Read-Only] — [Read-Only] Overrides the lightmap resolution defined in the static mesh (int32)
  - `override_light_map_res`: `bool` [Read-Only] — [Read-Only] Whether to override the lightmap resolution defined in the static mesh. (bool)
  - `random_pitch_angle`: `float` — [Read-Write] A random pitch adjustment can be applied to each instance, up to the specified angle in...
  - `random_yaw`: `bool` — [Read-Write] If selected, foliage instances will have a random yaw rotation around their vertical ax...
  - `receives_decals`: `bool` [Read-Only] — [Read-Only] Whether the foliage receives decals. (bool)
  - `render_custom_depth`: `bool` [Read-Only] — [Read-Only] If true, the foliage will be rendered in the CustomDepth pass (usually used for outlines...
  - `runtime_virtual_textures`: `None` — [Read-Write] Array of runtime virtual textures into which we draw the instances.
The mesh material a...
  - `shadow_cache_invalidation_behavior`: `ShadowCacheInvalidationBehavior` [Read-Only] — [Read-Only] Control shadow invalidation behavior, in particular with respect to Virtual Shadow Maps ...
  - `translucency_sort_priority`: `int` [Read-Only] — [Read-Only] Translucent objects with a lower sort priority draw behind objects with a higher priorit...
  - `use_as_occluder`: `bool` [Read-Only] — [Read-Only] If enabled, foliage will render a pre-pass which allows it to occlude other primitives, ...
  - `virtual_texture_cull_mips`: `int` [Read-Only] — [Read-Only] Number of lower mips in the runtime virtual texture to skip for rendering this primitive...
  - `virtual_texture_render_pass_type`: `RuntimeVirtualTextureMainPassType` [Read-Only] — [Read-Only] Controls if this component draws in the main pass as well as in the virtual texture. (Ru...
  - `visible_in_ray_tracing`: `bool` [Read-Only] — [Read-Only] (bool)
  - `world_position_offset_disable_distance`: `int` [Read-Only] — [Read-Only] (int32)
  - `z_offset`: `FloatInterval` — [Read-Write] Specifies a range from minimum to maximum of the offset to apply to a foliage instanceâ...

### `unreal.FoliageType_Actor`
Inherits: `FoliageType` | Header: `FoliageType_Actor.h`

Foliage Type Actor

### `unreal.FoliageType_InstancedStaticMesh`
Inherits: `FoliageType` | Header: `FoliageType_InstancedStaticMesh.h`

Foliage Type Instanced Static Mesh

**Properties** (3):
  - `mesh`: `StaticMesh` — [Read-Write] (StaticMesh)
  - `nanite_override_materials`: `None` — [Read-Write] Nanite material overrides for foliage instances. (Array[MaterialInterface])
  - `override_materials`: `None` — [Read-Write] Material overrides for foliage instances. (Array[MaterialInterface])

### `unreal.GrassInstancedStaticMeshComponent`
Inherits: `HierarchicalInstancedStaticMeshComponent` | Header: `GrassInstancedStaticMeshComponent.h`

Grass Instanced Static Mesh Component

### `unreal.InstancedFoliageActor`
Inherits: `ISMPartitionActor` | Header: `InstancedFoliageActor.h`

Instanced Foliage Actor

**Methods** (4):
  - `add_instances(world_context_object, foliage_type, transforms)` -> `None` [classmethod] — Add Instances
  - `get_instance_transforms(foliage_type, instances_level = None)` -> `Array [ Transform ]` — Returns the transforms of all instances of a particular UFoliageType on a given level. If no level is provided all insta...
  - `get_used_foliage_types()` -> `Array [ FoliageType ]` — Returns all the different types of UFoliageType assets that a particular AInstancedFoliageActor uses. This function exis...
  - `remove_all_instances(world_context_object, foliage_type)` -> `None` [classmethod] — Remove All Instances

### `unreal.InteractiveFoliageActor`
Inherits: `StaticMeshActor` | Header: `InteractiveFoliageActor.h`

Interactive Foliage Actor

**Properties** (8):
  - `foliage_damage_impulse_scale`: `float` — [Read-Write] Scales forces applied from damage events. (float)
  - `foliage_damping`: `float` — [Read-Write] Determines the amount of energy lost by the spring as it oscillates.
This force is simi...
  - `foliage_stiffness`: `float` — [Read-Write] Determines how strong the force that pushes toward the springâs center will be. (floa...
  - `foliage_stiffness_quadratic`: `float` — [Read-Write] Same as FoliageStiffness, but the strength of this force increases with the square of t...
  - `foliage_touch_impulse_scale`: `float` — [Read-Write] Scales forces applied from touch events. (float)
  - `max_damage_impulse`: `float` — [Read-Write] Clamps the magnitude of each damage force applied. (float)
  - `max_force`: `float` — [Read-Write] Clamps the magnitude of combined forces applied each update. (float)
  - `max_touch_impulse`: `float` — [Read-Write] Clamps the magnitude of each touch force applied. (float)

### `unreal.InteractiveFoliageComponent`
Inherits: `StaticMeshComponent` | Header: `InteractiveFoliageComponent.h`

Interactive Foliage Component

### `unreal.ProceduralFoliageBlockingVolume`
Inherits: `Volume` | Header: `ProceduralFoliageBlockingVolume.h`

An invisible volume used to block ProceduralFoliage instances from being spawned.

### `unreal.ProceduralFoliageComponent`
Inherits: `ActorComponent` | Header: `ProceduralFoliageComponent.h`

Procedural Foliage Component

**Properties** (10):
  - `allow_bsp`: `bool` — [Read-Write] Whether to place foliage on BSP (bool)
  - `allow_foliage`: `bool` — [Read-Write] Whether to place foliage on other blocking foliage geometry (bool)
  - `allow_landscape`: `bool` — [Read-Write] Whether to place foliage on landscape (bool)
  - `allow_static_mesh`: `bool` — [Read-Write] Whether to place foliage on StaticMesh (bool)
  - `allow_translucent`: `bool` — [Read-Write] Whether to place foliage on translucent geometry (bool)
  - `foliage_spawner`: `ProceduralFoliageSpawner` — [Read-Write] The procedural foliage spawner used to generate foliage instances within this volume. (...
  - `overlap`: `float` — âoverlapâ was renamed to âtile_overlapâ. deprecated
  - `procedural_foliage`: `ProceduralFoliageSpawner` — âprocedural_foliageâ was renamed to âfoliage_spawnerâ. deprecated
  - `show_debug_tiles`: `bool` — [Read-Write] Whether to visualize the tiles used for the foliage spawner simulation (bool)
  - `tile_overlap`: `float` — [Read-Write] The amount of overlap between simulation tiles (in cm). (float)

### `unreal.ProceduralFoliageSpawner`
Inherits: `Object` | Header: `ProceduralFoliageSpawner.h`

Procedural Foliage Spawner

**Methods** (1):
  - `simulate(num_steps = -1)` -> `None` — Simulate

**Properties** (4):
  - `minimum_quad_tree_size`: `float` [Read-Only] — [Read-Only] Minimum size of the quad tree used during the simulation. Reduce if too many instances a...
  - `num_unique_tiles`: `int` [Read-Only] — [Read-Only] The number of unique tiles to generate. The final simulation is a procedurally determine...
  - `random_seed`: `int` [Read-Only] — [Read-Only] The seed used for generating the randomness of the simulation. (int32)
  - `tile_size`: `float` [Read-Only] — [Read-Only] Length of the tile (in cm) along one axis. The total area of the tile will be TileSize*T...

### `unreal.ProceduralFoliageVolume`
Inherits: `Volume` | Header: `ProceduralFoliageVolume.h`

Procedural Foliage Volume

**Properties** (1):
  - `procedural_component`: `ProceduralFoliageComponent` [Read-Only] — [Read-Only] (ProceduralFoliageComponent)

### `unreal.FoliageScaling`
Inherits: `EnumBase` | Header: `FoliageType.h`

EFoliage Scaling

**Properties** (5):
  - `FREE`: `FoliageScaling = Ellipsis` — Foliage instances will have random X,Y and Z scales. 1
  - `LOCK_XY`: `FoliageScaling = Ellipsis` — Locks the X and Y axis scale. 2
  - `LOCK_XZ`: `FoliageScaling = Ellipsis` — Locks the X and Z axis scale. 3
  - `LOCK_YZ`: `FoliageScaling = Ellipsis` — Locks the Y and Z axis scale. 4
  - `UNIFORM`: `FoliageScaling = Ellipsis` — Foliage instances will have uniform X,Y and Z scales. 0

### `unreal.SimulationOverlap`
Inherits: `EnumBase` | Header: `ProceduralFoliageInstance.h`

ESimulation Overlap

**Properties** (3):
  - `COLLISION_OVERLAP`: `SimulationOverlap = Ellipsis` — Instances overlap with collision 0
  - `NONE`: `SimulationOverlap = Ellipsis` — No overlap 2
  - `SHADE_OVERLAP`: `SimulationOverlap = Ellipsis` — Instances overlap with shade 1

### `unreal.SimulationQuery`
Inherits: `EnumBase` | Header: `ProceduralFoliageInstance.h`

ESimulation Query

**Properties** (3):
  - `ANY_OVERLAP`: `SimulationQuery = Ellipsis` — any overlap 3
  - `COLLISION_OVERLAP`: `SimulationQuery = Ellipsis` — Instances overlap with collision 1
  - `SHADE_OVERLAP`: `SimulationQuery = Ellipsis` — Instances overlap with shade 2

### `unreal.InstancePointDamageSignature`
Inherits: `MulticastDelegateBase` | Header: `FoliageInstancedStaticMeshComponent.h`

Instance Point Damage Signature Delegate Signature

### `unreal.InstanceRadialDamageSignature`
Inherits: `MulticastDelegateBase` | Header: `FoliageInstancedStaticMeshComponent.h`

Instance Radial Damage Signature Delegate Signature
