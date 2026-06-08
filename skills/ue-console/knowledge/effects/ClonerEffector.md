# UE Python API — ClonerEffector Module

**71 types** from the `ClonerEffector` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CEClonerEffectorChannelData`, `CEClonerGridConstraintCylinder`, `CEClonerGridConstraintSphere`, `CEClonerGridConstraintTexture`, `CEClonerActor`, `CEClonerCircleLayout`, `CEClonerCollisionExtension`, `CEClonerComponent`, `CEClonerConstraintExtension`, `CEClonerCylinderLayout`, `CEClonerDisplacementExtension`, `CEClonerEffectorExtension`, `CEClonerEmitterSpawnExtension`, `CEClonerExtensionBase`, `CEClonerFreePlacementLayout`, `CEClonerGridLayout`, `CEClonerHoneycombLayout`, `CEClonerLayoutBase`, `CEClonerLibrary`, `CEClonerLifetimeExtension`, ... (71 total)

---

## Classes

### `unreal.CEClonerEffectorChannelData`
Inherits: `StructBase` | Header: `CEClonerEffectorShared.h`

CECloner Effector Channel Data

### `unreal.CEClonerGridConstraintCylinder`
Inherits: `StructBase` | Header: `CEClonerEffectorShared.h`

CECloner Grid Constraint Cylinder

**Properties** (3):
  - `center`: `Vector` — [Read-Write] (Vector)
  - `height`: `float` — [Read-Write] (float)
  - `radius`: `float` — [Read-Write] (float)

### `unreal.CEClonerGridConstraintSphere`
Inherits: `StructBase` | Header: `CEClonerEffectorShared.h`

CECloner Grid Constraint Sphere

**Properties** (2):
  - `center`: `Vector` — [Read-Write] (Vector)
  - `radius`: `float` — [Read-Write] (float)

### `unreal.CEClonerGridConstraintTexture`
Inherits: `StructBase` | Header: `CEClonerEffectorShared.h`

CECloner Grid Constraint Texture

**Properties** (5):
  - `channel`: `CEClonerTextureSampleChannel` — [Read-Write] (CEClonerTextureSampleChannel)
  - `compare_mode`: `CEClonerCompareMode` — [Read-Write] (CEClonerCompareMode)
  - `plane`: `CEClonerPlane` — [Read-Write] (CEClonerPlane)
  - `texture`: `Texture` — [Read-Write] (Texture)
  - `threshold`: `float` — [Read-Write] (float)

### `unreal.CEClonerActor`
Inherits: `Actor` | Header: `CEClonerActor.h`

CECloner Actor

**Methods** (1):
  - `get_cloner_component()` -> `CEClonerComponent` — Get Cloner Component

### `unreal.CEClonerCircleLayout`
Inherits: `CEClonerLayoutBase` | Header: `CEClonerCircleLayout.h`

CECloner Circle Layout

**Methods** (18):
  - `get_angle_ratio()` -> `float` — Get Angle Ratio
  - `get_angle_start()` -> `float` — Get Angle Start
  - `get_count()` -> `int32` — Get Count
  - `get_orient_mesh()` -> `bool` — Get Orient Mesh
  - `get_plane()` -> `CEClonerPlane` — Get Plane
  - `get_radius()` -> `float` — Get Radius
  - `get_ring_count()` -> `int32` — Get Ring Count
  - `get_rotation()` -> `Rotator` — Get Rotation
  - `get_scale()` -> `Vector` — Get Scale
  - `set_angle_ratio(angle_ratio)` -> `None` — Set Angle Ratio
  - `set_angle_start(angle_start)` -> `None` — Set Angle Start
  - `set_count(count)` -> `None` — Set Count
  - `set_orient_mesh(orient_mesh)` -> `None` — Set Orient Mesh
  - `set_plane(plane)` -> `None` — Set Plane
  - `set_radius(radius)` -> `None` — Set Radius
  - `set_ring_count(count)` -> `None` — Set Ring Count
  - `set_rotation(rotation)` -> `None` — Set Rotation
  - `set_scale(scale)` -> `None` — Set Scale

### `unreal.CEClonerCollisionExtension`
Inherits: `CEClonerExtensionBase` | Header: `CEClonerCollisionExtension.h`

Extension dealing with collisions and physics related options

**Methods** (19):
  - `get_collision_grid_resolution()` -> `int32` — Get Collision Grid Resolution
  - `get_collision_grid_size()` -> `Vector` — Get Collision Grid Size
  - `get_collision_iterations()` -> `int32` — Get Collision Iterations
  - `get_collision_radii()` -> `Array [ float ]` — Get Collision Radii
  - `get_collision_radius_mode()` -> `CEClonerCollisionRadiusMode` — Get Collision Radius Mode
  - `get_collision_velocity_enabled()` -> `bool` — Get Collision Velocity Enabled
  - `get_mass_max()` -> `float` — Get Mass Max
  - `get_mass_min()` -> `float` — Get Mass Min
  - `get_particle_collision_enabled()` -> `bool` — Get Particle Collision Enabled
  - `get_surface_collision_enabled()` -> `bool` — Get Surface Collision Enabled
  - `set_collision_grid_resolution(collision_grid_resolution)` -> `None` — Set Collision Grid Resolution
  - `set_collision_grid_size(collision_grid_size)` -> `None` — Set Collision Grid Size
  - `set_collision_iterations(collision_iterations)` -> `None` — Set Collision Iterations
  - `set_collision_radius_mode(mode)` -> `None` — Set Collision Radius Mode
  - `set_collision_velocity_enabled(collision_velocity_enabled)` -> `None` — Set Collision Velocity Enabled
  - `set_mass_max(mass_max)` -> `None` — Set Mass Max
  - `set_mass_min(mass_min)` -> `None` — Set Mass Min
  - `set_particle_collision_enabled(particle_collision_enabled)` -> `None` — Set Particle Collision Enabled
  - `set_surface_collision_enabled(surface_collision_enabled)` -> `None` — Set Surface Collision Enabled

### `unreal.CEClonerComponent`
Inherits: `NiagaraComponent` | Header: `CEClonerComponent.h`

CECloner Component

**Methods** (23):
  - `get_active_extensions()` -> `Array [ CEClonerExtensionBase ]` — Retrieves all active extensions on this cloner
  - `get_active_layout()` -> `CEClonerLayoutBase` — Get Active Layout
  - `get_attachment_count()` -> `int32` — Returns the number of root attachment currently on this cloner
  - `get_color()` -> `LinearColor` — Get Color
  - `get_enabled()` -> `bool` — Get Enabled
  - `get_extension(extension_class)` -> `CEClonerExtensionBase` — Get Extension
  - `get_global_rotation()` -> `Rotator` — Get Global Rotation
  - `get_global_scale()` -> `Vector` — Get Global Scale
  - `get_layout_class()` — Get Layout Class
  - `get_layout_name()` -> `Name` — Get Layout Name
  - `get_mesh_count()` -> `int32` — Returns the number of meshes this cloner currently handles
  - `get_seed()` -> `int32` — Get Seed
  - `get_tree_behavior_name()` -> `Name` — Get Tree Behavior Name
  - `get_visualizer_sprite_visible()` -> `bool` — Get Visualizer Sprite Visible
  - `set_color(color)` -> `None` — Set Color
  - `set_enabled(enable)` -> `None` — Set Enabled
  - `set_global_rotation(rotation)` -> `None` — Set Global Rotation
  - `set_global_scale(scale)` -> `None` — Set Global Scale
  - `set_layout_class(layout_class)` -> `None` — Set Layout Class
  - `set_layout_name(layout_name)` -> `None` — Set Layout Name
  - `set_seed(seed)` -> `None` — Set Seed
  - `set_tree_behavior_name(behavior_name)` -> `None` — Set Tree Behavior Name
  - `set_visualizer_sprite_visible(visible)` -> `None` — Set Visualizer Sprite Visible

### `unreal.CEClonerConstraintExtension`
Inherits: `CEClonerExtensionBase` | Header: `CEClonerConstraintExtension.h`

Extension dealing with clone grid constraints

**Methods** (32):
  - `get_constraint()` -> `CEClonerGridConstraint` — Get Constraint
  - `get_cylinder_center()` -> `Vector` — Get Cylinder Center
  - `get_cylinder_height()` -> `float` — Get Cylinder Height
  - `get_cylinder_radius()` -> `float` — Get Cylinder Radius
  - `get_invert_constraint()` -> `bool` — Get Invert Constraint
  - `get_sphere_center()` -> `Vector` — Get Sphere Center
  - `get_sphere_radius()` -> `float` — Get Sphere Radius
  - `get_texture_asset()` -> `Texture` — Get Texture Asset
  - `get_texture_clamp()` -> `bool` — Get Texture Clamp
  - `get_texture_compare_mode()` -> `CEClonerCompareMode` — Get Texture Compare Mode
  - `get_texture_offset()` -> `Vector2D` — Get Texture Offset
  - `get_texture_plane()` -> `CEClonerPlane` — Get Texture Plane
  - `get_texture_rotation()` -> `float` — Get Texture Rotation
  - `get_texture_sample_mode()` -> `CEClonerTextureSampleChannel` — Get Texture Sample Mode
  - `get_texture_scale()` -> `Vector2D` — Get Texture Scale
  - `get_texture_threshold()` -> `float` — Get Texture Threshold
  - `set_constraint(constraint)` -> `None` — Set Constraint
  - `set_cylinder_center(cylinder_center)` -> `None` — Set Cylinder Center
  - `set_cylinder_height(cylinder_height)` -> `None` — Set Cylinder Height
  - `set_cylinder_radius(cylinder_radius)` -> `None` — Set Cylinder Radius
  - `set_invert_constraint(invert_constraint)` -> `None` — Set Invert Constraint
  - `set_sphere_center(sphere_center)` -> `None` — Set Sphere Center
  - `set_sphere_radius(sphere_radius)` -> `None` — Set Sphere Radius
  - `set_texture_asset(texture)` -> `None` — Set Texture Asset
  - `set_texture_clamp(clamp)` -> `None` — Set Texture Clamp
  - `set_texture_compare_mode(mode)` -> `None` — Set Texture Compare Mode
  - `set_texture_offset(offset)` -> `None` — Set Texture Offset
  - `set_texture_plane(plane)` -> `None` — Set Texture Plane
  - `set_texture_rotation(rotation)` -> `None` — Set Texture Rotation
  - `set_texture_sample_mode(sample_mode)` -> `None` — Set Texture Sample Mode
  - `set_texture_scale(scale)` -> `None` — Set Texture Scale
  - `set_texture_threshold(threshold)` -> `None` — Set Texture Threshold

### `unreal.CEClonerCylinderLayout`
Inherits: `CEClonerLayoutBase` | Header: `CEClonerCylinderLayout.h`

CECloner Cylinder Layout

**Methods** (20):
  - `get_angle_ratio()` -> `float` — Get Angle Ratio
  - `get_angle_start()` -> `float` — Get Angle Start
  - `get_base_count()` -> `int32` — Get Base Count
  - `get_height()` -> `float` — Get Height
  - `get_height_count()` -> `int32` — Get Height Count
  - `get_orient_mesh()` -> `bool` — Get Orient Mesh
  - `get_plane()` -> `CEClonerPlane` — Get Plane
  - `get_radius()` -> `float` — Get Radius
  - `get_rotation()` -> `Rotator` — Get Rotation
  - `get_scale()` -> `Vector` — Get Scale
  - `set_angle_ratio(angle_ratio)` -> `None` — Set Angle Ratio
  - `set_angle_start(angle_start)` -> `None` — Set Angle Start
  - `set_base_count(base_count)` -> `None` — Set Base Count
  - `set_height(height)` -> `None` — Set Height
  - `set_height_count(height_count)` -> `None` — Set Height Count
  - `set_orient_mesh(orient_mesh)` -> `None` — Set Orient Mesh
  - `set_plane(plane)` -> `None` — Set Plane
  - `set_radius(radius)` -> `None` — Set Radius
  - `set_rotation(rotation)` -> `None` — Set Rotation
  - `set_scale(scale)` -> `None` — Set Scale

### `unreal.CEClonerDisplacementExtension`
Inherits: `CEClonerExtensionBase` | Header: `CEClonerDisplacementExtension.h`

Extension dealing with clone grid displacements

**Methods** (24):
  - `get_displacement_enabled()` -> `bool` — Get Displacement Enabled
  - `get_displacement_invert()` -> `bool` — Get Displacement Invert
  - `get_displacement_offset_max()` -> `Vector` — Get Displacement Offset Max
  - `get_displacement_rotation_max()` -> `Rotator` — Get Displacement Rotation Max
  - `get_displacement_scale_max()` -> `Vector` — Get Displacement Scale Max
  - `get_displacement_texture_asset()` -> `Texture` — Get Displacement Texture Asset
  - `get_displacement_texture_clamp()` -> `bool` — Get Displacement Texture Clamp
  - `get_displacement_texture_offset()` -> `Vector2D` — Get Displacement Texture Offset
  - `get_displacement_texture_plane()` -> `CEClonerPlane` — Get Displacement Texture Plane
  - `get_displacement_texture_rotation()` -> `float` — Get Displacement Texture Rotation
  - `get_displacement_texture_sample_mode()` -> `CEClonerTextureSampleChannel` — Get Displacement Texture Sample Mode
  - `get_displacement_texture_scale()` -> `Vector2D` — Get Displacement Texture Scale
  - `set_displacement_enabled(enabled)` -> `None` — Set Displacement Enabled
  - `set_displacement_invert(invert)` -> `None` — Set Displacement Invert
  - `set_displacement_offset_max(max)` -> `None` — Set Displacement Offset Max
  - `set_displacement_rotation_max(max)` -> `None` — Set Displacement Rotation Max
  - `set_displacement_scale_max(max)` -> `None` — Set Displacement Scale Max
  - `set_displacement_texture_asset(texture)` -> `None` — Set Displacement Texture Asset
  - `set_displacement_texture_clamp(clamp)` -> `None` — Set Displacement Texture Clamp
  - `set_displacement_texture_offset(offset)` -> `None` — Set Displacement Texture Offset
  - `set_displacement_texture_plane(plane)` -> `None` — Set Displacement Texture Plane
  - `set_displacement_texture_rotation(rotation)` -> `None` — Set Displacement Texture Rotation
  - `set_displacement_texture_sample_mode(sample_mode)` -> `None` — Set Displacement Texture Sample Mode
  - `set_displacement_texture_scale(scale)` -> `None` — Set Displacement Texture Scale

### `unreal.CEClonerEffectorExtension`
Inherits: `CEClonerExtensionBase` | Header: `CEClonerEffectorExtension.h`

Extension dealing with effectors options

**Methods** (4):
  - `get_effector_count()` -> `int32` — Gets the number of effectors applied on this cloner
  - `is_effector_linked(effector_actor)` -> `bool` — Checks if an effector is linked with this cloner
  - `link_effector(effector_actor)` -> `bool` — Links new actor effectors to apply transformation on clones
  - `unlink_effector(effector_actor)` -> `bool` — Unlinks the effector actor and reset the cloner simulation

### `unreal.CEClonerEmitterSpawnExtension`
Inherits: `CEClonerExtensionBase` | Header: `CEClonerEmitterSpawnExtension.h`

Extension dealing with clones spawning options

**Methods** (16):
  - `get_spawn_behavior_mode()` -> `CEClonerSpawnBehaviorMode` — Get Spawn Behavior Mode
  - `get_spawn_loop_interval()` -> `float` — Get Spawn Loop Interval
  - `get_spawn_loop_iterations()` -> `int32` — Get Spawn Loop Iterations
  - `get_spawn_loop_mode()` -> `CEClonerSpawnLoopMode` — Get Spawn Loop Mode
  - `get_spawn_max_frame_count()` -> `int32` — Get Spawn Max Frame Count
  - `get_spawn_max_total_count()` -> `int32` — Get Spawn Max Total Count
  - `get_spawn_rate()` -> `float` — Get Spawn Rate
  - `get_use_local_space()` -> `bool` — Get Use Local Space
  - `set_spawn_behavior_mode(mode)` -> `None` — Set Spawn Behavior Mode
  - `set_spawn_loop_interval(interval)` -> `None` — Set Spawn Loop Interval
  - `set_spawn_loop_iterations(iterations)` -> `None` — Set Spawn Loop Iterations
  - `set_spawn_loop_mode(mode)` -> `None` — Set Spawn Loop Mode
  - `set_spawn_max_frame_count(count)` -> `None` — Set Spawn Max Frame Count
  - `set_spawn_max_total_count(count)` -> `None` — Set Spawn Max Total Count
  - `set_spawn_rate(rate)` -> `None` — Set Spawn Rate
  - `set_use_local_space(local_space)` -> `None` — Set Use Local Space

### `unreal.CEClonerExtensionBase`
Inherits: `Object` | Header: `CEClonerExtensionBase.h`

Reusable extension on cloner layout to group similar options

**Methods** (2):
  - `get_extension_name()` -> `Name` — Get Extension Name
  - `is_extension_active()` -> `bool` — Is Extension Active

### `unreal.CEClonerFreePlacementLayout`
Inherits: `CEClonerLayoutBase` | Header: `CEClonerFreePlacementLayout.h`

CECloner Free Placement Layout

### `unreal.CEClonerGridLayout`
Inherits: `CEClonerLayoutBase` | Header: `CEClonerGridLayout.h`

CECloner Grid Layout

**Methods** (16):
  - `get_count_x()` -> `int32` — Get Count X
  - `get_count_y()` -> `int32` — Get Count Y
  - `get_count_z()` -> `int32` — Get Count Z
  - `get_spacing_x()` -> `float` — Get Spacing X
  - `get_spacing_y()` -> `float` — Get Spacing Y
  - `get_spacing_z()` -> `float` — Get Spacing Z
  - `get_twist_axis()` -> `CEClonerAxis` — Get Twist Axis
  - `get_twist_factor()` -> `float` — Get Twist Factor
  - `set_count_x(count_x)` -> `None` — Set Count X
  - `set_count_y(count_y)` -> `None` — Set Count Y
  - `set_count_z(count_z)` -> `None` — Set Count Z
  - `set_spacing_x(spacing_x)` -> `None` — Set Spacing X
  - `set_spacing_y(spacing_y)` -> `None` — Set Spacing Y
  - `set_spacing_z(spacing_z)` -> `None` — Set Spacing Z
  - `set_twist_axis(axis)` -> `None` — Set Twist Axis
  - `set_twist_factor(factor)` -> `None` — Set Twist Factor

### `unreal.CEClonerHoneycombLayout`
Inherits: `CEClonerLayoutBase` | Header: `CEClonerHoneycombLayout.h`

CECloner Honeycomb Layout

**Methods** (18):
  - `get_height_count()` -> `int32` — Get Height Count
  - `get_height_offset()` -> `float` — Get Height Offset
  - `get_height_spacing()` -> `float` — Get Height Spacing
  - `get_plane()` -> `CEClonerPlane` — Get Plane
  - `get_twist_axis()` -> `CEClonerAxis` — Get Twist Axis
  - `get_twist_factor()` -> `float` — Get Twist Factor
  - `get_width_count()` -> `int32` — Get Width Count
  - `get_width_offset()` -> `float` — Get Width Offset
  - `get_width_spacing()` -> `float` — Get Width Spacing
  - `set_height_count(height_count)` -> `None` — Set Height Count
  - `set_height_offset(height_offset)` -> `None` — Set Height Offset
  - `set_height_spacing(height_spacing)` -> `None` — Set Height Spacing
  - `set_plane(plane)` -> `None` — Set Plane
  - `set_twist_axis(axis)` -> `None` — Set Twist Axis
  - `set_twist_factor(factor)` -> `None` — Set Twist Factor
  - `set_width_count(width_count)` -> `None` — Set Width Count
  - `set_width_offset(width_offset)` -> `None` — Set Width Offset
  - `set_width_spacing(width_spacing)` -> `None` — Set Width Spacing

### `unreal.CEClonerLayoutBase`
Inherits: `Object` | Header: `CEClonerLayoutBase.h`

Base class for layouts available in the cloner actor Steps to add a new layout : 1. Create a new system that extends from NS_ClonerBase and expose all the parent parameters (examples can be found in C...

**Methods** (2):
  - `get_layout_name()` -> `Name` — Get Layout Name
  - `is_layout_active()` -> `bool` — Is this layout system in use within the cloner

### `unreal.CEClonerLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `CEClonerLibrary.h`

Blueprint operations for cloner

**Methods** (7):
  - `get_cloner_extension_classes()` -> `Set [ type ( Class ) ]` [classmethod] — Retrieves all extension classes available for a cloner
  - `get_cloner_layout_class(layout_name)` -> `type(Class) or None` [classmethod] — Retrieves the layout class from a layout name
  - `get_cloner_layout_classes()` -> `Set [ type ( Class ) ]` [classmethod] — Retrieves all layout classes available for a cloner
  - `get_cloner_layout_name(layout_class)` -> `Name or None` [classmethod] — Retrieves the layout name from a layout class
  - `get_cloner_layout_names()` -> `Set[Name] or None` [classmethod] — Retrieves all the layout names
  - `set_cloner_layout_by_class(world_context, latent_info, cloner, out_layout=CEClonerLayoutBase)` [classmethod] — Sets the active layout of a cloner and wait until the layout is loaded and active
  - `set_cloner_layout_by_name(world_context, latent_info, cloner, out_layout=CEClonerLayoutBase)` [classmethod] — Sets the active layout of a cloner and wait until the layout is loaded and active

### `unreal.CEClonerLifetimeExtension`
Inherits: `CEClonerExtensionBase` | Header: `CEClonerLifetimeExtension.h`

Extension dealing with clones lifetime options

**Methods** (9):
  - `get_lifetime_enabled()` -> `bool` — Get Lifetime Enabled
  - `get_lifetime_max()` -> `float` — Get Lifetime Max
  - `get_lifetime_min()` -> `float` — Get Lifetime Min
  - `get_lifetime_scale_enabled()` -> `bool` — Get Lifetime Scale Enabled
  - `set_lifetime_enabled(enabled)` -> `None` — Set Lifetime Enabled
  - `set_lifetime_max(max)` -> `None` — Set Lifetime Max
  - `set_lifetime_min(min)` -> `None` — Set Lifetime Min
  - `set_lifetime_scale_curve(curve)` -> `None` — Set Lifetime Scale Curve
  - `set_lifetime_scale_enabled(enabled)` -> `None` — Set Lifetime Scale Enabled

### `unreal.CEClonerLineLayout`
Inherits: `CEClonerLayoutBase` | Header: `CEClonerLineLayout.h`

CECloner Line Layout

**Methods** (10):
  - `get_axis()` -> `CEClonerAxis` — Get Axis
  - `get_count()` -> `int32` — Get Count
  - `get_direction()` -> `Vector` — Get Direction
  - `get_rotation()` -> `Rotator` — Get Rotation
  - `get_spacing()` -> `float` — Get Spacing
  - `set_axis(axis)` -> `None` — Set Axis
  - `set_count(count)` -> `None` — Set Count
  - `set_direction(direction)` -> `None` — Set Direction
  - `set_rotation(rotation)` -> `None` — Set Rotation
  - `set_spacing(spacing)` -> `None` — Set Spacing

### `unreal.CEClonerMeshLayout`
Inherits: `CEClonerLayoutBase` | Header: `CEClonerMeshLayout.h`

CECloner Mesh Layout

**Methods** (8):
  - `get_asset()` -> `CEClonerMeshAsset` — Get Asset
  - `get_count()` -> `int32` — Get Count
  - `get_sample_actor()` -> `Actor` — Get Sample Actor
  - `get_sample_data()` -> `CEClonerMeshSampleData` — Get Sample Data
  - `set_asset(asset)` -> `None` — Set Asset
  - `set_count(count)` -> `None` — Set Count
  - `set_sample_actor(actor)` -> `None` — Set Sample Actor
  - `set_sample_data(sample_data)` -> `None` — Set Sample Data

### `unreal.CEClonerMeshRendererExtension`
Inherits: `CEClonerExtensionBase` | Header: `CEClonerMeshRendererExtension.h`

Extension dealing with mesh rendering options

**Methods** (16):
  - `get_default_meshes()` -> `Array [ StaticMesh ]` — Get Default Meshes
  - `get_mesh_cast_shadows()` -> `bool` — Get Mesh Cast Shadows
  - `get_mesh_facing_mode()` -> `NiagaraMeshFacingMode` — Get Mesh Facing Mode
  - `get_mesh_render_mode()` -> `CEClonerMeshRenderMode` — Get Mesh Render Mode
  - `get_override_material()` -> `MaterialInterface` — Get Override Material
  - `get_sort_translucent_particles()` -> `bool` — Get Sort Translucent Particles
  - `get_use_override_material()` -> `bool` — Get Use Override Material
  - `get_visualize_effectors()` -> `bool` — Get Visualize Effectors
  - `set_default_meshes(meshes)` -> `None` — Set Default Meshes
  - `set_mesh_cast_shadows(inb_cast_shadows)` -> `None` — Set Mesh Cast Shadows
  - `set_mesh_facing_mode(mode)` -> `None` — Set Mesh Facing Mode
  - `set_mesh_render_mode(mode)` -> `None` — Set Mesh Render Mode
  - `set_override_material(material)` -> `None` — Set Override Material
  - `set_sort_translucent_particles(sort)` -> `None` — Set Sort Translucent Particles
  - `set_use_override_material(override)` -> `None` — Set Use Override Material
  - `set_visualize_effectors(visualize)` -> `None` — Set Visualize Effectors

### `unreal.CEClonerProgressExtension`
Inherits: `CEClonerExtensionBase` | Header: `CEClonerProgressExtension.h`

Extension dealing with clone progress options

**Methods** (4):
  - `get_invert_progress()` -> `bool` — Get Invert Progress
  - `get_progress()` -> `float` — Get Progress
  - `set_invert_progress(invert_progress)` -> `None` — Set Invert Progress
  - `set_progress(progress)` -> `None` — Set Progress

### `unreal.CEClonerRangeExtension`
Inherits: `CEClonerExtensionBase` | Header: `CEClonerRangeExtension.h`

Extension dealing with range options

**Methods** (22):
  - `get_range_enabled()` -> `bool` — Get Range Enabled
  - `get_range_mirrored()` -> `bool` — Get Range Mirrored
  - `get_range_offset_max()` -> `Vector` — Get Range Offset Max
  - `get_range_offset_min()` -> `Vector` — Get Range Offset Min
  - `get_range_rotation_max()` -> `Rotator` — Get Range Rotation Max
  - `get_range_rotation_min()` -> `Rotator` — Get Range Rotation Min
  - `get_range_scale_max()` -> `Vector` — Get Range Scale Max
  - `get_range_scale_min()` -> `Vector` — Get Range Scale Min
  - `get_range_scale_uniform()` -> `bool` — Get Range Scale Uniform
  - `get_range_scale_uniform_max()` -> `float` — Get Range Scale Uniform Max
  - `get_range_scale_uniform_min()` -> `float` — Get Range Scale Uniform Min
  - `set_range_enabled(range_enabled)` -> `None` — Set Range Enabled
  - `set_range_mirrored(mirrored)` -> `None` — Set Range Mirrored
  - `set_range_offset_max(range_offset_max)` -> `None` — Set Range Offset Max
  - `set_range_offset_min(range_offset_min)` -> `None` — Set Range Offset Min
  - `set_range_rotation_max(range_rotation_max)` -> `None` — Set Range Rotation Max
  - `set_range_rotation_min(range_rotation_min)` -> `None` — Set Range Rotation Min
  - `set_range_scale_max(range_scale_max)` -> `None` — Set Range Scale Max
  - `set_range_scale_min(range_scale_min)` -> `None` — Set Range Scale Min
  - `set_range_scale_uniform(range_scale_uniform)` -> `None` — Set Range Scale Uniform
  - `set_range_scale_uniform_max(range_scale_uniform_max)` -> `None` — Set Range Scale Uniform Max
  - `set_range_scale_uniform_min(range_scale_uniform_min)` -> `None` — Set Range Scale Uniform Min

### `unreal.CEClonerSphereRandomLayout`
Inherits: `CEClonerLayoutBase` | Header: `CEClonerSphereRandomLayout.h`

CECloner Sphere Random Layout

**Methods** (16):
  - `get_count()` -> `int32` — Get Count
  - `get_distribution()` -> `float` — Get Distribution
  - `get_latitude()` -> `float` — Get Latitude
  - `get_longitude()` -> `float` — Get Longitude
  - `get_orient_mesh()` -> `bool` — Get Orient Mesh
  - `get_radius()` -> `float` — Get Radius
  - `get_rotation()` -> `Rotator` — Get Rotation
  - `get_scale()` -> `Vector` — Get Scale
  - `set_count(count)` -> `None` — Set Count
  - `set_distribution(distribution)` -> `None` — Set Distribution
  - `set_latitude(latitude)` -> `None` — Set Latitude
  - `set_longitude(longitude)` -> `None` — Set Longitude
  - `set_orient_mesh(inb_orient_mesh)` -> `None` — Set Orient Mesh
  - `set_radius(radius)` -> `None` — Set Radius
  - `set_rotation(rotation)` -> `None` — Set Rotation
  - `set_scale(scale)` -> `None` — Set Scale

### `unreal.CEClonerSphereUniformLayout`
Inherits: `CEClonerLayoutBase` | Header: `CEClonerSphereUniformLayout.h`

CECloner Sphere Uniform Layout

**Methods** (12):
  - `get_count()` -> `int32` — Get Count
  - `get_orient_mesh()` -> `bool` — Get Orient Mesh
  - `get_radius()` -> `float` — Get Radius
  - `get_ratio()` -> `float` — Get Ratio
  - `get_rotation()` -> `Rotator` — Get Rotation
  - `get_scale()` -> `Vector` — Get Scale
  - `set_count(count)` -> `None` — Set Count
  - `set_orient_mesh(inb_orient_mesh)` -> `None` — Set Orient Mesh
  - `set_radius(radius)` -> `None` — Set Radius
  - `set_ratio(ratio)` -> `None` — Set Ratio
  - `set_rotation(rotation)` -> `None` — Set Rotation
  - `set_scale(scale)` -> `None` — Set Scale

### `unreal.CEClonerSplineLayout`
Inherits: `CEClonerLayoutBase` | Header: `CEClonerSplineLayout.h`

CECloner Spline Layout

**Methods** (6):
  - `get_count()` -> `int32` — Get Count
  - `get_orient_mesh()` -> `bool` — Get Orient Mesh
  - `get_spline_actor()` -> `Actor` — Get Spline Actor
  - `set_count(count)` -> `None` — Set Count
  - `set_orient_mesh(orient_mesh)` -> `None` — Set Orient Mesh
  - `set_spline_actor(spline_actor)` -> `None` — Set Spline Actor

### `unreal.CEClonerStepExtension`
Inherits: `CEClonerExtensionBase` | Header: `CEClonerStepExtension.h`

Extension dealing with delta step accumulated options

**Methods** (8):
  - `get_delta_step_enabled()` -> `bool` — Get Delta Step Enabled
  - `get_delta_step_position()` -> `Vector` — Get Delta Step Position
  - `get_delta_step_rotation()` -> `Rotator` — Get Delta Step Rotation
  - `get_delta_step_scale()` -> `Vector` — Get Delta Step Scale
  - `set_delta_step_enabled(enabled)` -> `None` — Set Delta Step Enabled
  - `set_delta_step_position(position)` -> `None` — Set Delta Step Position
  - `set_delta_step_rotation(rotation)` -> `None` — Set Delta Step Rotation
  - `set_delta_step_scale(scale)` -> `None` — Set Delta Step Scale

### `unreal.CEClonerTextureExtension`
Inherits: `CEClonerExtensionBase` | Header: `CEClonerTextureExtension.h`

Extension dealing with clone grid texture and UV for material

**Methods** (18):
  - `get_custom_texture_asset()` -> `Texture` — Get Custom Texture Asset
  - `get_custom_texture_uv_clamp()` -> `bool` — Get Custom Texture UVClamp
  - `get_custom_texture_uv_offset()` -> `Vector2D` — Get Custom Texture UVOffset
  - `get_custom_texture_uv_plane()` -> `CEClonerPlane` — Get Custom Texture UVPlane
  - `get_custom_texture_uv_rotation()` -> `float` — Get Custom Texture UVRotation
  - `get_custom_texture_uv_scale()` -> `Vector2D` — Get Custom Texture UVScale
  - `get_texture_enabled()` -> `bool` — Get Texture Enabled
  - `get_texture_provider()` -> `CEClonerTextureProvider` — Get Texture Provider
  - `get_texture_uv_provider()` -> `CEClonerTextureProvider` — Get Texture UVProvider
  - `set_custom_texture_asset(texture)` -> `None` — Set Custom Texture Asset
  - `set_custom_texture_uv_clamp(clamp)` -> `None` — Set Custom Texture UVClamp
  - `set_custom_texture_uv_offset(offset)` -> `None` — Set Custom Texture UVOffset
  - `set_custom_texture_uv_plane(plane)` -> `None` — Set Custom Texture UVPlane
  - `set_custom_texture_uv_rotation(rotation)` -> `None` — Set Custom Texture UVRotation
  - `set_custom_texture_uv_scale(scale)` -> `None` — Set Custom Texture UVScale
  - `set_texture_enabled(enabled)` -> `None` — Set Texture Enabled
  - `set_texture_provider(provider)` -> `None` — Set Texture Provider
  - `set_texture_uv_provider(provider)` -> `None` — Set Texture UVProvider

### `unreal.CEEffectorActor`
Inherits: `Actor` | Header: `CEEffectorActor.h`

CEEffector Actor

**Methods** (1):
  - `get_effector_component()` -> `CEEffectorComponent` — Get Effector Component

### `unreal.CEEffectorBoundType`
Inherits: `CEEffectorTypeBase` | Header: `CEEffectorBoundType.h`

CEEffector Bound Type

**Methods** (4):
  - `get_easing()` -> `CEClonerEasing` — Get Easing
  - `get_invert_type()` -> `bool` — Get Invert Type
  - `set_easing(easing)` -> `None` — Set Easing
  - `set_invert_type(invert)` -> `None` — Set Invert Type

### `unreal.CEEffectorBoxType`
Inherits: `CEEffectorBoundType` | Header: `CEEffectorBoxType.h`

CEEffector Box Type

**Methods** (4):
  - `get_inner_extent()` -> `Vector` — Get Inner Extent
  - `get_outer_extent()` -> `Vector` — Get Outer Extent
  - `set_inner_extent(extent)` -> `None` — Set Inner Extent
  - `set_outer_extent(extent)` -> `None` — Set Outer Extent

### `unreal.CEEffectorCancelMode`
Inherits: `CEEffectorModeBase` | Header: `CEEffectorCancelMode.h`

Negates all effects applied on clones

### `unreal.CEEffectorComponent`
Inherits: `SceneComponent` | Header: `CEEffectorComponent.h`

Class used to define an effector

**Methods** (24):
  - `get_active_effects()` -> `Array [ CEEffectorEffectBase ]` — Get Active Effects
  - `get_active_extensions()` -> `None` — deprecated: âget_active_extensionsâ was renamed to âget_active_effectsâ.
  - `get_active_mode()` -> `CEEffectorModeBase` — Get Active Mode
  - `get_active_type()` -> `CEEffectorTypeBase` — Get Active Type
  - `get_channel_identifier()` -> `int32` — Get the effector channel identifier
  - `get_color()` -> `LinearColor` — Get Color
  - `get_enabled()` -> `bool` — Get Enabled
  - `get_extension(extension_class)` -> `CEEffectorExtensionBase` — Get Extension
  - `get_magnitude()` -> `float` — Get Magnitude
  - `get_mode_class()` — Get Mode Class
  - `get_mode_name()` -> `Name` — Get Mode Name
  - `get_type_class()` — Get Type Class
  - `get_type_name()` -> `Name` — Get Type Name
  - `get_visualizer_component_visible()` -> `bool` — Get Visualizer Component Visible
  - `get_visualizer_sprite_visible()` -> `bool` — Get Visualizer Sprite Visible
  - `set_color(color)` -> `None` — Set Color
  - `set_enabled(enable)` -> `None` — Set Enabled
  - `set_magnitude(magnitude)` -> `None` — Set Magnitude
  - `set_mode_class(mode_class)` -> `None` — Set Mode Class
  - `set_mode_name(mode_name)` -> `None` — Set Mode Name
  - `set_type_class(type_class)` -> `None` — Set Type Class
  - `set_type_name(type_name)` -> `None` — Set Type Name
  - `set_visualizer_component_visible(visible)` -> `None` — Set Visualizer Component Visible
  - `set_visualizer_sprite_visible(visible)` -> `None` — Set Visualizer Sprite Visible

### `unreal.CEEffectorCullMode`
Inherits: `CEEffectorModeBase` | Header: `CEEffectorCullMode.h`

CEEffector Cull Mode

**Methods** (4):
  - `get_behavior()` -> `CEEffectorCullModeBehavior` — Get Behavior
  - `get_scale()` -> `Vector` — Get Scale
  - `set_behavior(behavior)` -> `None` — Set Behavior
  - `set_scale(scale)` -> `None` — Set Scale

### `unreal.CEEffectorDelayEffect`
Inherits: `CEEffectorEffectBase` | Header: `CEEffectorDelayEffect.h`

Effector delay extension to affect clones after a period of time with a spring effect

**Methods** (10):
  - `get_delay_enabled()` -> `bool` — Get Delay Enabled
  - `get_delay_in_duration()` -> `float` — Get Delay in Duration
  - `get_delay_out_duration()` -> `float` — Get Delay Out Duration
  - `get_delay_spring_falloff()` -> `float` — Get Delay Spring Falloff
  - `get_delay_spring_frequency()` -> `float` — Get Delay Spring Frequency
  - `set_delay_enabled(enabled)` -> `None` — Set Delay Enabled
  - `set_delay_in_duration(duration)` -> `None` — Set Delay in Duration
  - `set_delay_out_duration(duration)` -> `None` — Set Delay Out Duration
  - `set_delay_spring_falloff(falloff)` -> `None` — Set Delay Spring Falloff
  - `set_delay_spring_frequency(frequency)` -> `None` — Set Delay Spring Frequency

### `unreal.CEEffectorEffectBase`
Inherits: `CEEffectorExtensionBase` | Header: `CEEffectorEffectBase.h`

Represents an effect for an effector to affect clones in a specific way, works with modes and types

### `unreal.CEEffectorExtensionBase`
Inherits: `Object` | Header: `CEEffectorExtensionBase.h`

Represents an extension for an effector to apply a custom behavior on cloner

**Methods** (2):
  - `get_extension_name()` -> `Name` — Get Extension Name
  - `is_extension_active()` -> `bool` — Is Extension Active

### `unreal.CEEffectorForceEffect`
Inherits: `CEEffectorEffectBase` | Header: `CEEffectorForceEffect.h`

Effector supported forces to affect clones

**Methods** (42):
  - `get_attraction_force_enabled()` -> `bool` — Get Attraction Force Enabled
  - `get_attraction_force_falloff()` -> `float` — Get Attraction Force Falloff
  - `get_attraction_force_strength()` -> `float` — Get Attraction Force Strength
  - `get_curl_noise_force_enabled()` -> `bool` — Get Curl Noise Force Enabled
  - `get_curl_noise_force_frequency()` -> `float` — Get Curl Noise Force Frequency
  - `get_curl_noise_force_strength()` -> `float` — Get Curl Noise Force Strength
  - `get_drag_force_enabled()` -> `bool` — Get Drag Force Enabled
  - `get_drag_force_linear()` -> `float` — Get Drag Force Linear
  - `get_drag_force_rotational()` -> `float` — Get Drag Force Rotational
  - `get_forces_enabled()` -> `bool` — Get Forces Enabled
  - `get_gravity_force_acceleration()` -> `Vector` — Get Gravity Force Acceleration
  - `get_gravity_force_enabled()` -> `bool` — Get Gravity Force Enabled
  - `get_orientation_force_enabled()` -> `bool` — Get Orientation Force Enabled
  - `get_orientation_force_max()` -> `Vector` — Get Orientation Force Max
  - `get_orientation_force_min()` -> `Vector` — Get Orientation Force Min
  - `get_orientation_force_rate()` -> `float` — Get Orientation Force Rate
  - `get_vector_noise_force_amount()` -> `float` — Get Vector Noise Force Amount
  - `get_vector_noise_force_enabled()` -> `bool` — Get Vector Noise Force Enabled
  - `get_vortex_force_amount()` -> `float` — Get Vortex Force Amount
  - `get_vortex_force_axis()` -> `Vector` — Get Vortex Force Axis
  - `get_vortex_force_enabled()` -> `bool` — Get Vortex Force Enabled
  - `set_attraction_force_enabled(force_enabled)` -> `None` — Set Attraction Force Enabled
  - `set_attraction_force_falloff(force_falloff)` -> `None` — Set Attraction Force Falloff
  - `set_attraction_force_strength(force_strength)` -> `None` — Set Attraction Force Strength
  - `set_curl_noise_force_enabled(force_enabled)` -> `None` — Set Curl Noise Force Enabled
  - `set_curl_noise_force_frequency(force_curl_noise_frequency)` -> `None` — Set Curl Noise Force Frequency
  - `set_curl_noise_force_strength(force_curl_noise_strength)` -> `None` — Set Curl Noise Force Strength
  - `set_drag_force_enabled(enabled)` -> `None` — Set Drag Force Enabled
  - `set_drag_force_linear(strength)` -> `None` — Set Drag Force Linear
  - `set_drag_force_rotational(strength)` -> `None` — Set Drag Force Rotational
  - `set_forces_enabled(forces_enabled)` -> `None` — Set Forces Enabled
  - `set_gravity_force_acceleration(acceleration)` -> `None` — Set Gravity Force Acceleration
  - `set_gravity_force_enabled(force_enabled)` -> `None` — Set Gravity Force Enabled
  - `set_orientation_force_enabled(force_enabled)` -> `None` — Set Orientation Force Enabled
  - `set_orientation_force_max(force_orientation_max)` -> `None` — Set Orientation Force Max
  - `set_orientation_force_min(force_orientation_min)` -> `None` — Set Orientation Force Min
  - `set_orientation_force_rate(force_orientation_rate)` -> `None` — Set Orientation Force Rate
  - `set_vector_noise_force_amount(amount)` -> `None` — Set Vector Noise Force Amount
  - `set_vector_noise_force_enabled(enabled)` -> `None` — Set Vector Noise Force Enabled
  - `set_vortex_force_amount(force_vortex_amount)` -> `None` — Set Vortex Force Amount
  - `set_vortex_force_axis(force_vortex_axis)` -> `None` — Set Vortex Force Axis
  - `set_vortex_force_enabled(force_enabled)` -> `None` — Set Vortex Force Enabled

### `unreal.CEEffectorLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `CEEffectorLibrary.h`

Blueprint operations for effector

**Methods** (5):
  - `get_effector_effect_classes()` -> `Set [ type ( Class ) ]` [classmethod] — Retrieves all effect classes available for an effector
  - `get_effector_extension_classes()` -> `None` [classmethod] — deprecated: âget_effector_extension_classesâ was renamed to âget_effector_effect_classesâ.
  - `get_effector_mode_classes()` -> `Set [ type ( Class ) ]` [classmethod] — Retrieves all mode classes available for an effector
  - `get_effector_type_classes()` -> `Set [ type ( Class ) ]` [classmethod] — Retrieves all type classes available for an effector
  - `get_effector_type_names()` -> `Set [ Name ]` [classmethod] — Retrieves all type classes available for an effector

### `unreal.CEEffectorModeBase`
Inherits: `CEEffectorExtensionBase` | Header: `CEEffectorModeBase.h`

Represents a behavior for an effector to affect clones in a specific way

### `unreal.CEEffectorOffsetMode`
Inherits: `CEEffectorModeBase` | Header: `CEEffectorOffsetMode.h`

CEEffector Offset Mode

**Methods** (6):
  - `get_offset()` -> `Vector` — Get Offset
  - `get_rotation()` -> `Rotator` — Get Rotation
  - `get_scale()` -> `Vector` — Get Scale
  - `set_offset(offset)` -> `None` — Set Offset
  - `set_rotation(rotation)` -> `None` — Set Rotation
  - `set_scale(scale)` -> `None` — Set Scale

### `unreal.CEEffectorPlaneType`
Inherits: `CEEffectorBoundType` | Header: `CEEffectorPlaneType.h`

CEEffector Plane Type

**Methods** (2):
  - `get_plane_spacing()` -> `float` — Get Plane Spacing
  - `set_plane_spacing(spacing)` -> `None` — Set Plane Spacing

### `unreal.CEEffectorProceduralMode`
Inherits: `CEEffectorModeBase` | Header: `CEEffectorProceduralMode.h`

CEEffector Procedural Mode

**Methods** (12):
  - `get_frequency()` -> `float` — Get Frequency
  - `get_location_strength()` -> `Vector` — Get Location Strength
  - `get_pan()` -> `Vector` — Get Pan
  - `get_pattern()` -> `CEClonerEffectorProceduralPattern` — Get Pattern
  - `get_rotation_strength()` -> `Rotator` — Get Rotation Strength
  - `get_scale_strength()` -> `Vector` — Get Scale Strength
  - `set_frequency(frequency)` -> `None` — Set Frequency
  - `set_location_strength(strength)` -> `None` — Set Location Strength
  - `set_pan(pan)` -> `None` — Set Pan
  - `set_pattern(pattern)` -> `None` — Set Pattern
  - `set_rotation_strength(strength)` -> `None` — Set Rotation Strength
  - `set_scale_strength(strength)` -> `None` — Set Scale Strength

### `unreal.CEEffectorPushMode`
Inherits: `CEEffectorModeBase` | Header: `CEEffectorPushMode.h`

CEEffector Push Mode

**Methods** (4):
  - `get_push_direction()` -> `CEClonerEffectorPushDirection` — Get Push Direction
  - `get_push_strength()` -> `Vector` — Get Push Strength
  - `set_push_direction(direction)` -> `None` — Set Push Direction
  - `set_push_strength(strength)` -> `None` — Set Push Strength

### `unreal.CEEffectorRadialType`
Inherits: `CEEffectorBoundType` | Header: `CEEffectorRadialType.h`

CEEffector Radial Type

**Methods** (6):
  - `get_radial_angle()` -> `float` — Get Radial Angle
  - `get_radial_max_radius()` -> `float` — Get Radial Max Radius
  - `get_radial_min_radius()` -> `float` — Get Radial Min Radius
  - `set_radial_angle(angle)` -> `None` — Set Radial Angle
  - `set_radial_max_radius(radius)` -> `None` — Set Radial Max Radius
  - `set_radial_min_radius(radius)` -> `None` — Set Radial Min Radius

### `unreal.CEEffectorSphereType`
Inherits: `CEEffectorBoundType` | Header: `CEEffectorSphereType.h`

CEEffector Sphere Type

**Methods** (4):
  - `get_inner_radius()` -> `float` — Get Inner Radius
  - `get_outer_radius()` -> `float` — Get Outer Radius
  - `set_inner_radius(radius)` -> `None` — Set Inner Radius
  - `set_outer_radius(radius)` -> `None` — Set Outer Radius

### `unreal.CEEffectorStepMode`
Inherits: `CEEffectorModeBase` | Header: `CEEffectorStepMode.h`

CEEffector Step Mode

**Methods** (6):
  - `get_step_position()` -> `Vector` — Get Step Position
  - `get_step_rotation()` -> `Rotator` — Get Step Rotation
  - `get_step_scale()` -> `Vector` — Get Step Scale
  - `set_step_position(position)` -> `None` — Set Step Position
  - `set_step_rotation(rotation)` -> `None` — Set Step Rotation
  - `set_step_scale(scale)` -> `None` — Set Step Scale

### `unreal.CEEffectorTargetMode`
Inherits: `CEEffectorModeBase` | Header: `CEEffectorTargetMode.h`

CEEffector Target Mode

**Methods** (2):
  - `get_target_actor()` -> `Actor` — Get Target Actor
  - `set_target_actor(target_actor)` -> `None` — Set Target Actor

### `unreal.CEEffectorTorusType`
Inherits: `CEEffectorBoundType` | Header: `CEEffectorTorusType.h`

CEEffector Torus Type

**Methods** (6):
  - `get_torus_inner_radius()` -> `float` — Get Torus Inner Radius
  - `get_torus_outer_radius()` -> `float` — Get Torus Outer Radius
  - `get_torus_radius()` -> `float` — Get Torus Radius
  - `set_torus_inner_radius(radius)` -> `None` — Set Torus Inner Radius
  - `set_torus_outer_radius(radius)` -> `None` — Set Torus Outer Radius
  - `set_torus_radius(radius)` -> `None` — Set Torus Radius

### `unreal.CEEffectorTypeBase`
Inherits: `CEEffectorExtensionBase` | Header: `CEEffectorTypeBase.h`

Represents a shape for an effector to affect clones on specific zones

### `unreal.CEEffectorUnboundType`
Inherits: `CEEffectorTypeBase` | Header: `CEEffectorUnboundType.h`

CEEffector Unbound Type

### `unreal.CEClonerAxis`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerate the axis available to use

**Properties** (4):
  - `CUSTOM`: `CEClonerAxis = Ellipsis` — 3
  - `X`: `CEClonerAxis = Ellipsis` — 0
  - `Y`: `CEClonerAxis = Ellipsis` — 1
  - `Z`: `CEClonerAxis = Ellipsis` — 2

### `unreal.CEClonerCollisionRadiusMode`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerates all modes for how clones radius are calculed

**Properties** (4):
  - `EXTENT_LENGTH`: `CEClonerCollisionRadiusMode = Ellipsis` — Collision radius will be calculated automatically based on the extent length, mesh scale included 3
  - `MANUAL`: `CEClonerCollisionRadiusMode = Ellipsis` — Input collision radius manually 0
  - `MAX_EXTENT`: `CEClonerCollisionRadiusMode = Ellipsis` — Collision radius will be calculated automatically based on the max extent value, mesh scale included...
  - `MIN_EXTENT`: `CEClonerCollisionRadiusMode = Ellipsis` — Collision radius will be calculated automatically based on the min extent value, mesh scale included...

### `unreal.CEClonerCompareMode`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerate all operation compare mode for constraint

**Properties** (6):
  - `EQUAL`: `CEClonerCompareMode = Ellipsis` — 2
  - `GREATER`: `CEClonerCompareMode = Ellipsis` — 0
  - `GREATER_EQUAL`: `CEClonerCompareMode = Ellipsis` — 1
  - `LESS`: `CEClonerCompareMode = Ellipsis` — 4
  - `LESS_EQUAL`: `CEClonerCompareMode = Ellipsis` — 5
  - `NOT_EQUAL`: `CEClonerCompareMode = Ellipsis` — 3

### `unreal.CEClonerEasing`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerates all easing functions that are available to apply on weights See https://easings.net/ for curves visualizations and web open domain implementations Used as one enum to send the index to niag...

**Properties** (32):
  - `IN_BACK`: `CEClonerEasing = Ellipsis` — 22
  - `IN_BOUNCE`: `CEClonerEasing = Ellipsis` — 28
  - `IN_CIRC`: `CEClonerEasing = Ellipsis` — 19
  - `IN_CUBIC`: `CEClonerEasing = Ellipsis` — 7
  - `IN_ELASTIC`: `CEClonerEasing = Ellipsis` — 25
  - `IN_EXPO`: `CEClonerEasing = Ellipsis` — 16
  - `IN_OUT_BACK`: `CEClonerEasing = Ellipsis` — 24
  - `IN_OUT_BOUNCE`: `CEClonerEasing = Ellipsis` — 30
  - `IN_OUT_CIRC`: `CEClonerEasing = Ellipsis` — 21
  - `IN_OUT_CUBIC`: `CEClonerEasing = Ellipsis` — 9
  - `IN_OUT_ELASTIC`: `CEClonerEasing = Ellipsis` — 27
  - `IN_OUT_EXPO`: `CEClonerEasing = Ellipsis` — 18
  - `IN_OUT_QUAD`: `CEClonerEasing = Ellipsis` — 6
  - `IN_OUT_QUART`: `CEClonerEasing = Ellipsis` — 12
  - `IN_OUT_QUINT`: `CEClonerEasing = Ellipsis` — 15
  - `IN_OUT_SINE`: `CEClonerEasing = Ellipsis` — 3
  - `IN_QUAD`: `CEClonerEasing = Ellipsis` — 4
  - `IN_QUART`: `CEClonerEasing = Ellipsis` — 10
  - `IN_QUINT`: `CEClonerEasing = Ellipsis` — 13
  - `IN_SINE`: `CEClonerEasing = Ellipsis` — 1
  - `LINEAR`: `CEClonerEasing = Ellipsis` — 0
  - `OUT_BACK`: `CEClonerEasing = Ellipsis` — 23
  - `OUT_BOUNCE`: `CEClonerEasing = Ellipsis` — 29
  - `OUT_CIRC`: `CEClonerEasing = Ellipsis` — 20
  - `OUT_CUBIC`: `CEClonerEasing = Ellipsis` — 8
  - `OUT_ELASTIC`: `CEClonerEasing = Ellipsis` — 26
  - `OUT_EXPO`: `CEClonerEasing = Ellipsis` — 17
  - `OUT_QUAD`: `CEClonerEasing = Ellipsis` — 5
  - `OUT_QUART`: `CEClonerEasing = Ellipsis` — 11
  - `OUT_QUINT`: `CEClonerEasing = Ellipsis` — 14
  - `OUT_SINE`: `CEClonerEasing = Ellipsis` — 2
  - `RANDOM`: `CEClonerEasing = Ellipsis` — 31

### `unreal.CEClonerEffectorMode`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerates the effector mode available

**Properties** (7):
  - `CANCEL`: `CEClonerEffectorMode = Ellipsis` — Cancels/reverses all effects 6
  - `CULL`: `CEClonerEffectorMode = Ellipsis` — Culls clones based on a zone 5
  - `DEFAULT`: `CEClonerEffectorMode = Ellipsis` — Control clones offset, rotation, scale manually 0
  - `PROCEDURAL`: `CEClonerEffectorMode = Ellipsis` — Procedural pattern applied across the field zone 2
  - `PUSH`: `CEClonerEffectorMode = Ellipsis` — Pushes clones apart based on a strength and direction 3
  - `STEP`: `CEClonerEffectorMode = Ellipsis` — Accumulate transform on clones based on their index 4
  - `TARGET`: `CEClonerEffectorMode = Ellipsis` — Rotates clones towards a target actor 1

### `unreal.CEClonerEffectorProceduralPattern`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerates the effector procedural pattern available

**Properties** (3):
  - `CIRCULAR_WAVE`: `CEClonerEffectorProceduralPattern = Ellipsis` — Ripple wave movement 2
  - `CURL_NOISE`: `CEClonerEffectorProceduralPattern = Ellipsis` — Jacobian Simplex Noise 0
  - `DIRECTIONAL_WAVE`: `CEClonerEffectorProceduralPattern = Ellipsis` — Wave moving towards specific direction 1

### `unreal.CEClonerEffectorPushDirection`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerates the effector push direction available

**Properties** (5):
  - `EFFECTOR`: `CEClonerEffectorPushDirection = Ellipsis` — Push based on the clone position relative to the effector 3
  - `FORWARD`: `CEClonerEffectorPushDirection = Ellipsis` — Push based on the clone forward vector 0
  - `RANDOM`: `CEClonerEffectorPushDirection = Ellipsis` — Push based on a random unit vector based on the cloner seed 4
  - `RIGHT`: `CEClonerEffectorPushDirection = Ellipsis` — Push based on the clone right vector 1
  - `UP`: `CEClonerEffectorPushDirection = Ellipsis` — Push based on the cloner up vector 2

### `unreal.CEClonerEffectorType`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerates the effector shapes available

**Properties** (6):
  - `BOX`: `CEClonerEffectorType = Ellipsis` — Clones inside the box extent will be affected by the effector 2
  - `PLANE`: `CEClonerEffectorType = Ellipsis` — Clones between two planes will be affected by the effector 1
  - `RADIAL`: `CEClonerEffectorType = Ellipsis` — All clones within the angle range will be affected 4
  - `SPHERE`: `CEClonerEffectorType = Ellipsis` — Clones inside the sphere radius will be affected by the effector 0
  - `TORUS`: `CEClonerEffectorType = Ellipsis` — All clones inside the torus radius will be affected by the effector 5
  - `UNBOUND`: `CEClonerEffectorType = Ellipsis` — All clones will be affected by the effector with the same max weight 3

### `unreal.CEClonerGridConstraint`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerate the grid constraints available when cloner layout selected is grid

**Properties** (4):
  - `CYLINDER`: `CEClonerGridConstraint = Ellipsis` — 2
  - `NONE`: `CEClonerGridConstraint = Ellipsis` — 0
  - `SPHERE`: `CEClonerGridConstraint = Ellipsis` — 1
  - `TEXTURE`: `CEClonerGridConstraint = Ellipsis` — 3

### `unreal.CEClonerMeshAsset`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerate the mesh asset to look for when mesh layout is selected

**Properties** (2):
  - `SKELETAL_MESH`: `CEClonerMeshAsset = Ellipsis` — 1
  - `STATIC_MESH`: `CEClonerMeshAsset = Ellipsis` — 0

### `unreal.CEClonerMeshRenderMode`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerate the mesh render modes available to render a cloner instance

**Properties** (3):
  - `BLEND`: `CEClonerMeshRenderMode = Ellipsis` — Blend based on the total cloner instances and attachment mesh available 2
  - `ITERATE`: `CEClonerMeshRenderMode = Ellipsis` — Iterate through each attachment mesh available 0
  - `RANDOM`: `CEClonerMeshRenderMode = Ellipsis` — Pick randomly through each attachment mesh available, update cloner seed for variations 1

### `unreal.CEClonerMeshSampleData`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerate the mesh sample dataset to pick from when mesh layout is selected

**Properties** (5):
  - `BONES`: `CEClonerMeshSampleData = Ellipsis` — 3
  - `SECTIONS`: `CEClonerMeshSampleData = Ellipsis` — 4
  - `SOCKETS`: `CEClonerMeshSampleData = Ellipsis` — 2
  - `TRIANGLES`: `CEClonerMeshSampleData = Ellipsis` — 1
  - `VERTICES`: `CEClonerMeshSampleData = Ellipsis` — 0

### `unreal.CEClonerPlane`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerate the planes available to use

**Properties** (4):
  - `CUSTOM`: `CEClonerPlane = Ellipsis` — 3
  - `XY`: `CEClonerPlane = Ellipsis` — 0
  - `XZ`: `CEClonerPlane = Ellipsis` — 2
  - `YZ`: `CEClonerPlane = Ellipsis` — 1

### `unreal.CEClonerSpawnBehaviorMode`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerates all modes for how clones are spawned

**Properties** (2):
  - `INSTANT`: `CEClonerSpawnBehaviorMode = Ellipsis` — Spawns instantly the number of clones needed for the layout at a specific interval 0
  - `RATE`: `CEClonerSpawnBehaviorMode = Ellipsis` — Spawns clones at a specific rate per second and fills the layout 1

### `unreal.CEClonerSpawnLoopMode`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerates all modes to handle cloner spawn mode

**Properties** (3):
  - `INFINITE`: `CEClonerSpawnLoopMode = Ellipsis` — Cloner spawns infinitely and never enters idle mode 2
  - `MULTIPLE`: `CEClonerSpawnLoopMode = Ellipsis` — Cloner spawns multiple times and then enters idle mode 1
  - `ONCE`: `CEClonerSpawnLoopMode = Ellipsis` — Cloner spawns once and then enters idle mode 0

### `unreal.CEClonerTextureProvider`
Inherits: `EnumBase` | Header: `CEClonerTextureExtension.h`

ECECloner Texture Provider

**Properties** (3):
  - `CONSTRAINT`: `CEClonerTextureProvider = Ellipsis` — Use texture from constraint extension 0
  - `CUSTOM`: `CEClonerTextureProvider = Ellipsis` — Use custom texture 2
  - `DISPLACEMENT`: `CEClonerTextureProvider = Ellipsis` — Use texture from displacement extension 1

### `unreal.CEClonerTextureSampleChannel`
Inherits: `EnumBase` | Header: `CEClonerEffectorShared.h`

Enumerate all texture channels to sample for constraint

**Properties** (7):
  - `A`: `CEClonerTextureSampleChannel = Ellipsis` — 6
  - `B`: `CEClonerTextureSampleChannel = Ellipsis` — 5
  - `G`: `CEClonerTextureSampleChannel = Ellipsis` — 4
  - `R`: `CEClonerTextureSampleChannel = Ellipsis` — 3
  - `RGB_AVERAGE`: `CEClonerTextureSampleChannel = Ellipsis` — 1
  - `RGB_LUMINANCE`: `CEClonerTextureSampleChannel = Ellipsis` — 0
  - `RGB_MAX`: `CEClonerTextureSampleChannel = Ellipsis` — 2

### `unreal.CEEffectorCullModeBehavior`
Inherits: `EnumBase` | Header: `CEEffectorCullMode.h`

ECEEffector Cull Mode Behavior

**Properties** (2):
  - `HIDE`: `CEEffectorCullModeBehavior = Ellipsis` — Hide clones based on effector shape, higher priority than other kill effector 1
  - `KILL`: `CEEffectorCullModeBehavior = Ellipsis` — Kill clones based on effector shape, lower priority than other hide effector 0
