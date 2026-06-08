# UE Python API — AvalancheModifiers Module

**50 types** from the `AvalancheModifiers` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaBooleanModifierSharedChannelInfo`, `AvaMaterialParameterMap`, `AvaPatternModifierCircleLayoutOptions`, `AvaPatternModifierGridLayoutOptions`, `AvaPatternModifierLineLayoutOptions`, `Vector2b`, `AvaAutoSizeModifier`, `AvaBendModifier`, `AvaBevelModifier`, `AvaBooleanModifier`, `AvaDynamicMeshConverterModifier`, `AvaExtrudeModifier`, `AvaGeometryBaseModifier`, `AvaGlobalOpacityModifier`, `AvaHideEmptyModifier`, `AvaMaterialParameterModifier`, `AvaMirrorModifier`, `AvaNormalModifier`, `AvaOutlineModifier`, `AvaPatternModifier`, ... (50 total)

---

## Classes

### `unreal.AvaBooleanModifierSharedChannelInfo`
Inherits: `StructBase` | Header: `AvaBooleanModifierShared.h`

Ava Boolean Modifier Shared Channel Info

**Properties** (5):
  - `channel_count`: `int` [Read-Only] — [Read-Only] The number of channel currently active (int32)
  - `channel_intersect_count`: `int` [Read-Only] — [Read-Only] The number of modifier intersecting with this modifier (int32)
  - `channel_modifier_count`: `int` [Read-Only] — [Read-Only] The number of modifier on that channel, the more there are, the more impact on performan...
  - `channel_target_count`: `int` [Read-Only] — [Read-Only] The number of modifier on that channel that are masked by other mask modifier (int32)
  - `channel_tool_count`: `int` [Read-Only] — [Read-Only] The number of modifier on that channel that are used to mask other non mask modifier (in...

### `unreal.AvaMaterialParameterMap`
Inherits: `StructBase` | Header: `AvaMaterialParameterModifier.h`

Ava Material Parameter Map

**Properties** (3):
  - `scalar_parameters`: `None` — [Read-Write] (Map[Name,float])
  - `texture_parameters`: `None` — [Read-Write] (Map[Name,Texture])
  - `vector_parameters`: `None` — [Read-Write] (Map[Name,LinearColor])

### `unreal.AvaPatternModifierCircleLayoutOptions`
Inherits: `StructBase` | Header: `AvaPatternModifier.h`

Ava Pattern Modifier Circle Layout Options

**Properties** (9):
  - `accumulate_transform`: `bool` — [Read-Write] (bool)
  - `centered`: `bool` — [Read-Write] Center the layout based on the plane (bool)
  - `full_angle`: `float` — [Read-Write] (float)
  - `plane`: `AvaPatternModifierPlane` — [Read-Write] (AvaPatternModifierPlane)
  - `radius`: `float` — [Read-Write] (float)
  - `repeat_count`: `int` — [Read-Write] (int32)
  - `rotation`: `Rotator` — [Read-Write] (Rotator)
  - `scale`: `Vector` — [Read-Write] (Vector)
  - `start_angle`: `float` — [Read-Write] (float)

### `unreal.AvaPatternModifierGridLayoutOptions`
Inherits: `StructBase` | Header: `AvaPatternModifier.h`

Ava Pattern Modifier Grid Layout Options

**Properties** (8):
  - `accumulate_transform`: `bool` — [Read-Write] (bool)
  - `axis_inverted`: `Vector2b` — [Read-Write] (Vector2b)
  - `centered`: `bool` — [Read-Write] Center the layout based on the plane (bool)
  - `plane`: `AvaPatternModifierPlane` — [Read-Write] (AvaPatternModifierPlane)
  - `repeat_count`: `IntPoint` — [Read-Write] (IntPoint)
  - `rotation`: `Rotator` — [Read-Write] (Rotator)
  - `scale`: `Vector` — [Read-Write] (Vector)
  - `spacing`: `Vector2D` — [Read-Write] Row, Column (Vector2D)

### `unreal.AvaPatternModifierLineLayoutOptions`
Inherits: `StructBase` | Header: `AvaPatternModifier.h`

Ava Pattern Modifier Line Layout Options

**Properties** (8):
  - `accumulate_transform`: `bool` — [Read-Write] (bool)
  - `axis`: `AvaPatternModifierAxis` — [Read-Write] (AvaPatternModifierAxis)
  - `axis_inverted`: `bool` — [Read-Write] (bool)
  - `centered`: `bool` — [Read-Write] Center the layout based on the axis (bool)
  - `repeat_count`: `int` — [Read-Write] (int32)
  - `rotation`: `Rotator` — [Read-Write] (Rotator)
  - `scale`: `Vector` — [Read-Write] (Vector)
  - `spacing`: `float` — [Read-Write] (float)

### `unreal.Vector2b`
Inherits: `StructBase` | Header: `AvaPatternModifier.h`

Vector 2b

**Properties** (2):
  - `x`: `bool` — [Read-Write] (bool)
  - `y`: `bool` — [Read-Write] (bool)

### `unreal.AvaAutoSizeModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaAutoSizeModifier.h`

Adapts the modified actor geometry size/scale to match reference actor bounds and act as a background

**Methods** (10):
  - `get_fit_mode()` -> `AvaAutoSizeFitMode` — Get Fit Mode
  - `get_include_children()` -> `bool` — Get Include Children
  - `get_padding_horizontal()` -> `double` — Get Padding Horizontal
  - `get_padding_vertical()` -> `double` — Get Padding Vertical
  - `get_reference_actor()` -> `ActorModifierSceneTreeActor` — Get Reference Actor
  - `set_fit_mode(fit_mode)` -> `None` — Set Fit Mode
  - `set_include_children(include_children)` -> `None` — Set Include Children
  - `set_padding_horizontal(padding)` -> `None` — Set Padding Horizontal
  - `set_padding_vertical(padding)` -> `None` — Set Padding Vertical
  - `set_reference_actor(reference_actor)` -> `None` — Set Reference Actor

**Properties** (5):
  - `ignore_hidden_actors`: `bool` — [Read-Write] If true, will search for the next visible actor based on the selected reference contain...
  - `padding_horizontal`: `float` — [Read-Write] Padding for left and right side (double)
  - `padding_vertical`: `float` — [Read-Write] Padding for top and bottom side (double)
  - `reference_actor_weak`: `Actor` — [Read-Write] The actor affecting the modifier. This is user selectable if the Reference Container is...
  - `reference_container`: `ActorModifierReferenceContainer` — [Read-Write] The method for finding a reference actor based on itâs position in the parentâs hie...

### `unreal.AvaBendModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaBendModifier.h`

Ava Bend Modifier

**Methods** (12):
  - `get_angle()` -> `float` — Get Angle
  - `get_bend_position()` -> `Vector` — Get Bend Position
  - `get_bend_rotation()` -> `Rotator` — Get Bend Rotation
  - `get_bidirectional()` -> `bool` — Get Bidirectional
  - `get_extent()` -> `float` — Get Extent
  - `get_symmetric_extents()` -> `bool` — Get Symmetric Extents
  - `set_angle(angle)` -> `None` — Set Angle
  - `set_bend_position(bend_position)` -> `None` — Set Bend Position
  - `set_bend_rotation(bend_rotation)` -> `None` — Set Bend Rotation
  - `set_bidirectional(bidirectional)` -> `None` — Set Bidirectional
  - `set_extent(extent)` -> `None` — Set Extent
  - `set_symmetric_extents(symmetric_extents)` -> `None` — Set Symmetric Extents

### `unreal.AvaBevelModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaBevelModifier.h`

Ava Bevel Modifier

**Methods** (6):
  - `get_inset()` -> `float` — Get Inset
  - `get_iterations()` -> `int32` — Get Iterations
  - `get_roundness()` -> `float` — Get Roundness
  - `set_inset(bevel)` -> `None` — Set Inset
  - `set_iterations(iterations)` -> `None` — Set Iterations
  - `set_roundness(roundness)` -> `None` — Set Roundness

### `unreal.AvaBooleanModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaBooleanModifier.h`

This modifier allows you to apply a mask on a certain shape, this will affect every shape it collides with that matches options

**Methods** (4):
  - `get_channel()` -> `uint8` — Get Channel
  - `get_mode()` -> `AvaBooleanMode` — Get Mode
  - `set_channel(channel)` -> `None` — Set Channel
  - `set_mode(mode)` -> `None` — Set Mode

### `unreal.AvaDynamicMeshConverterModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaDynamicMeshConverterModifier.h`

Ava Dynamic Mesh Converter Modifier

**Methods** (14):
  - `get_component_types()` -> `Set [ AvaDynamicMeshConverterModifierType ]` — Get Component Types
  - `get_filter_actor_classes()` -> `Set [ type ( Class ) ]` — Get Filter Actor Classes
  - `get_filter_actor_mode()` -> `AvaDynamicMeshConverterModifierFilter` — Get Filter Actor Mode
  - `get_hide_converted_mesh()` -> `bool` — Get Hide Converted Mesh
  - `get_include_attached_actors()` -> `bool` — Get Include Attached Actors
  - `get_source_actor()` -> `Actor` — Get Source Actor
  - `get_update_interval()` -> `float` — Get Update Interval
  - `set_component_types(types)` -> `None` — Set Component Types
  - `set_filter_actor_classes(classes)` -> `None` — Set Filter Actor Classes
  - `set_filter_actor_mode(filter)` -> `None` — Set Filter Actor Mode
  - `set_hide_converted_mesh(hide)` -> `None` — Set Hide Converted Mesh
  - `set_include_attached_actors(include)` -> `None` — Set Include Attached Actors
  - `set_source_actor(actor)` -> `None` — Set Source Actor
  - `set_update_interval(interval)` -> `None` — Set Update Interval

### `unreal.AvaExtrudeModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaExtrudeModifier.h`

This modifier extrude triangles from a 2D shape with a specific depth and optionally closes the back

**Methods** (6):
  - `get_close_back()` -> `bool` — Get Close Back
  - `get_depth()` -> `float` — Get Depth
  - `get_extrude_mode()` -> `AvaExtrudeMode` — Get Extrude Mode
  - `set_close_back(close_back)` -> `None` — Set Close Back
  - `set_depth(depth)` -> `None` — Set Depth
  - `set_extrude_mode(extrude_mode)` -> `None` — Set Extrude Mode

**Properties** (1):
  - `move_mesh_opposite_direction`: `bool` — [Read-Write] Moves the mesh in the opposite extrude direction by the depth distance
deprecated: Use ...

### `unreal.AvaGeometryBaseModifier`
Inherits: `ActorModifierCoreBase` | Header: `AvaGeometryBaseModifier.h`

Base class used for geometry modifier that uses dynamic mesh components

### `unreal.AvaGlobalOpacityModifier`
Inherits: `AvaMaterialParameterModifier` | Header: `AvaGlobalOpacityModifier.h`

This modifier sets global opacity parameters on an actor with Material Designer Instances generated with the Material Designer

**Methods** (2):
  - `get_global_opacity()` -> `float` — Get Global Opacity
  - `set_global_opacity(opacity)` -> `None` — Set Global Opacity

### `unreal.AvaHideEmptyModifier`
Inherits: `ActorModifierArrangeBaseModifier` | Header: `AvaHideEmptyModifier.h`

Ava Hide Empty Modifier

**Methods** (4):
  - `get_container_actor()` -> `Actor` — Get Container Actor
  - `get_invert_visibility()` -> `bool` — Get Invert Visibility
  - `set_container_actor(actor)` -> `None` — Set Container Actor
  - `set_invert_visibility(invert)` -> `None` — Set Invert Visibility

### `unreal.AvaMaterialParameterModifier`
Inherits: `ActorModifierArrangeBaseModifier` | Header: `AvaMaterialParameterModifier.h`

This modifier sets specified dynamic materials parameters on an actor and its children

**Methods** (4):
  - `get_material_parameters()` -> `AvaMaterialParameterMap` — Get Material Parameters
  - `get_update_children()` -> `bool` — Get Update Children
  - `set_material_parameters(parameter_map)` -> `None` — Set Material Parameters
  - `set_update_children(update_children)` -> `None` — Set Update Children

### `unreal.AvaMirrorModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaMirrorModifier.h`

Ava Mirror Modifier

**Methods** (10):
  - `get_apply_plane_cut()` -> `bool` — Get Apply Plane Cut
  - `get_flip_cut_side()` -> `bool` — Get Flip Cut Side
  - `get_mirror_frame_position()` -> `Vector` — Get Mirror Frame Position
  - `get_mirror_frame_rotation()` -> `Rotator` — Get Mirror Frame Rotation
  - `get_weld_along_plane()` -> `bool` — Get Weld Along Plane
  - `set_apply_plane_cut(apply_plane_cut)` -> `None` — Set Apply Plane Cut
  - `set_flip_cut_side(flip_cut_side)` -> `None` — Set Flip Cut Side
  - `set_mirror_frame_position(mirror_frame_position)` -> `None` — Set Mirror Frame Position
  - `set_mirror_frame_rotation(mirror_frame_rotation)` -> `None` — Set Mirror Frame Rotation
  - `set_weld_along_plane(weld_along_plane)` -> `None` — Set Weld Along Plane

### `unreal.AvaNormalModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaNormalModifier.h`

Ava Normal Modifier

**Methods** (12):
  - `get_angle_threshold()` -> `float` — Get Angle Threshold
  - `get_angle_weighted()` -> `bool` — Get Angle Weighted
  - `get_area_weighted()` -> `bool` — Get Area Weighted
  - `get_invert()` -> `bool` — Get Invert
  - `get_poly_group_layer_idx()` -> `int32` — Get Poly Group Layer Idx
  - `get_split_method()` -> `AvaNormalModifierSplitMethod` — Get Split Method
  - `set_angle_threshold(angle_threshold)` -> `None` — Set Angle Threshold
  - `set_angle_weighted(angle_weighted)` -> `None` — Set Angle Weighted
  - `set_area_weighted(area_weighted)` -> `None` — Set Area Weighted
  - `set_invert(invert)` -> `None` — Set Invert
  - `set_poly_group_layer_idx(poly_group_layer)` -> `None` — Set Poly Group Layer Idx
  - `set_split_method(split_method)` -> `None` — Set Split Method

### `unreal.AvaOutlineModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaOutlineModifier.h`

This modifier adds an outline around a 2D shape with a specific distance

**Methods** (6):
  - `get_distance()` -> `float` — Get Distance
  - `get_mode()` -> `AvaOutlineMode` — Get Mode
  - `get_remove_inside()` -> `bool` — Get Remove Inside
  - `set_distance(distance)` -> `None` — Set Distance
  - `set_mode(mode)` -> `None` — Set Mode
  - `set_remove_inside(remove_inside)` -> `None` — Set Remove Inside

### `unreal.AvaPatternModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaPatternModifier.h`

This modifier clones a shape following various layouts and options

**Methods** (2):
  - `get_active_tool_class()` — Get Active Tool Class
  - `set_active_tool_class(class_)` -> `None` — Set Active Tool Class

### `unreal.AvaPatternModifierCircleTool`
Inherits: `AvaPatternModifierTool` | Header: `AvaPatternModifierCircleTool.h`

Circle tool for the pattern modifier

**Methods** (16):
  - `get_circle_accumulate_transform()` -> `bool` — Get Circle Accumulate Transform
  - `get_circle_count()` -> `int32` — Get Circle Count
  - `get_circle_full_angle()` -> `float` — Get Circle Full Angle
  - `get_circle_plane()` -> `AvaPatternModifierPlane` — Get Circle Plane
  - `get_circle_radius()` -> `float` — Get Circle Radius
  - `get_circle_rotation()` -> `Rotator` — Get Circle Rotation
  - `get_circle_scale()` -> `Vector` — Get Circle Scale
  - `get_circle_start_angle()` -> `float` — Get Circle Start Angle
  - `set_circle_accumulate_transform(circle_accumulate_transform)` -> `None` — Set Circle Accumulate Transform
  - `set_circle_count(circle_count)` -> `None` — Set Circle Count
  - `set_circle_full_angle(circle_full_angle)` -> `None` — Set Circle Full Angle
  - `set_circle_plane(circle_plane)` -> `None` — Set Circle Plane
  - `set_circle_radius(circle_radius)` -> `None` — Set Circle Radius
  - `set_circle_rotation(circle_rotation)` -> `None` — Set Circle Rotation
  - `set_circle_scale(circle_scale)` -> `None` — Set Circle Scale
  - `set_circle_start_angle(circle_start_angle)` -> `None` — Set Circle Start Angle

### `unreal.AvaPatternModifierGridTool`
Inherits: `AvaPatternModifierTool` | Header: `AvaPatternModifierGridTool.h`

Grid tool for the pattern modifier

**Methods** (18):
  - `get_grid_accumulate_transform()` -> `bool` — Get Grid Accumulate Transform
  - `get_grid_alignment()` -> `AvaPatternModifierGridAlignment` — Get Grid Alignment
  - `get_grid_count_x()` -> `int32` — Get Grid Count X
  - `get_grid_count_y()` -> `int32` — Get Grid Count Y
  - `get_grid_plane()` -> `AvaPatternModifierPlane` — Get Grid Plane
  - `get_grid_rotation()` -> `Rotator` — Get Grid Rotation
  - `get_grid_scale()` -> `Vector` — Get Grid Scale
  - `get_grid_spacing_x()` -> `float` — Get Grid Spacing X
  - `get_grid_spacing_y()` -> `float` — Get Grid Spacing Y
  - `set_grid_accumulate_transform(grid_accumulate_transform)` -> `None` — Set Grid Accumulate Transform
  - `set_grid_alignment(grid_alignment)` -> `None` — Set Grid Alignment
  - `set_grid_count_x(grid_count_x)` -> `None` — Set Grid Count X
  - `set_grid_count_y(grid_count_y)` -> `None` — Set Grid Count Y
  - `set_grid_plane(grid_plane)` -> `None` — Set Grid Plane
  - `set_grid_rotation(grid_rotation)` -> `None` — Set Grid Rotation
  - `set_grid_scale(grid_scale)` -> `None` — Set Grid Scale
  - `set_grid_spacing_x(grid_spacing_x)` -> `None` — Set Grid Spacing X
  - `set_grid_spacing_y(grid_spacing_y)` -> `None` — Set Grid Spacing Y

### `unreal.AvaPatternModifierLineTool`
Inherits: `AvaPatternModifierTool` | Header: `AvaPatternModifierLineTool.h`

Line tool for the pattern modifier

**Methods** (14):
  - `get_line_accumulate_transform()` -> `bool` — Get Line Accumulate Transform
  - `get_line_alignment()` -> `AvaPatternModifierLineAlignment` — Get Line Alignment
  - `get_line_axis()` -> `AvaPatternModifierAxis` — Get Line Axis
  - `get_line_count()` -> `int32` — Get Line Count
  - `get_line_rotation()` -> `Rotator` — Get Line Rotation
  - `get_line_scale()` -> `Vector` — Get Line Scale
  - `get_line_spacing()` -> `float` — Get Line Spacing
  - `set_line_accumulate_transform(line_accumulate_transform)` -> `None` — Set Line Accumulate Transform
  - `set_line_alignment(line_alignment)` -> `None` — Set Line Alignment
  - `set_line_axis(line_axis)` -> `None` — Set Line Axis
  - `set_line_count(line_count)` -> `None` — Set Line Count
  - `set_line_rotation(line_rotation)` -> `None` — Set Line Rotation
  - `set_line_scale(line_scale)` -> `None` — Set Line Scale
  - `set_line_spacing(line_spacing)` -> `None` — Set Line Spacing

### `unreal.AvaPatternModifierTool`
Inherits: `Object` | Header: `AvaPatternModifierTool.h`

Represent a tool supported by the pattern modifier

### `unreal.AvaPlaneCutModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaPlaneCutModifier.h`

This modifier cuts a shape based on a 2D plane

**Methods** (8):
  - `get_fill_holes()` -> `bool` — Get Fill Holes
  - `get_invert_cut()` -> `bool` — Get Invert Cut
  - `get_plane_origin()` -> `float` — Get Plane Origin
  - `get_plane_rotation()` -> `Rotator` — Get Plane Rotation
  - `set_fill_holes(fill_holes)` -> `None` — Set Fill Holes
  - `set_invert_cut(invert_cut)` -> `None` — Set Invert Cut
  - `set_plane_origin(origin)` -> `None` — Set Plane Origin
  - `set_plane_rotation(rotation)` -> `None` — Set Plane Rotation

### `unreal.AvaSizeToTextureModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaSizeToTextureModifier.h`

Adapts the modified actor geometry size/scale to match the texture size/ratio

**Methods** (8):
  - `get_fixed_height()` -> `float` — Get Fixed Height
  - `get_fixed_width()` -> `float` — Get Fixed Width
  - `get_rule()` -> `AvaSizeToTextureRule` — Get Rule
  - `get_texture()` -> `Texture` — Get Texture
  - `set_fixed_height(fixed_height)` -> `None` — Set Fixed Height
  - `set_fixed_width(fixed_width)` -> `None` — Set Fixed Width
  - `set_rule(rule)` -> `None` — Set Rule
  - `set_texture(texture)` -> `None` — Set Texture

### `unreal.AvaSplineSweepModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaSplineSweepModifier.h`

Ava Spline Sweep Modifier

**Methods** (22):
  - `get_capped()` -> `bool` — Get Capped
  - `get_looped()` -> `bool` — Get Looped
  - `get_progress_end()` -> `float` — Get Progress End
  - `get_progress_offset()` -> `float` — Get Progress Offset
  - `get_progress_start()` -> `float` — Get Progress Start
  - `get_sample_distance()` -> `float` — Get Sample Distance
  - `get_sample_mode()` -> `AvaSplineSweepSampleMode` — Get Sample Mode
  - `get_scale_end()` -> `float` — Get Scale End
  - `get_scale_start()` -> `float` — Get Scale Start
  - `get_spline_actor()` -> `Actor` — Get Spline Actor
  - `get_steps()` -> `int32` — Get Steps
  - `set_capped(capped)` -> `None` — Set Capped
  - `set_looped(looped)` -> `None` — Set Looped
  - `set_progress_end(end)` -> `None` — Set Progress End
  - `set_progress_offset(offset)` -> `None` — Set Progress Offset
  - `set_progress_start(start)` -> `None` — Set Progress Start
  - `set_sample_distance(distance)` -> `None` — Set Sample Distance
  - `set_sample_mode(mode)` -> `None` — Set Sample Mode
  - `set_scale_end(scale_end)` -> `None` — Set Scale End
  - `set_scale_start(scale_start)` -> `None` — Set Scale Start
  - `set_spline_actor(actor)` -> `None` — Set Spline Actor
  - `set_steps(steps)` -> `None` — Set Steps

### `unreal.AvaSubdivideModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaSubdivideModifier.h`

Ava Subdivide Modifier

**Methods** (6):
  - `get_cuts()` -> `int32` — Get Cuts
  - `get_recompute_normals()` -> `bool` — Get Recompute Normals
  - `get_type()` -> `AvaSubdivisionType` — Get Type
  - `set_cuts(cuts)` -> `None` — Set Cuts
  - `set_recompute_normals(recompute_normals)` -> `None` — Set Recompute Normals
  - `set_type(type)` -> `None` — Set Type

### `unreal.AvaTaperModifier`
Inherits: `AvaGeometryBaseModifier` | Header: `AvaTaperModifier.h`

Ava Taper Modifier

**Methods** (16):
  - `get_amount()` -> `float` — Get Amount
  - `get_extent()` -> `AvaTaperExtent` — Get Extent
  - `get_interpolation_type()` -> `AvaTaperInterpolationType` — Get Interpolation Type
  - `get_lower_extent()` -> `float` — Get Lower Extent
  - `get_offset()` -> `Vector2D` — Get Offset
  - `get_reference_frame()` -> `AvaTaperReferenceFrame` — Get Reference Frame
  - `get_resolution()` -> `int32` — Get Resolution
  - `get_upper_extent()` -> `float` — Get Upper Extent
  - `set_amount(amount)` -> `None` — Set Amount
  - `set_extent(extent)` -> `None` — Set Extent
  - `set_interpolation_type(interpolation_type)` -> `None` — Set Interpolation Type
  - `set_lower_extent(lower_extent)` -> `None` — Set Lower Extent
  - `set_offset(offset)` -> `None` — Set Offset
  - `set_reference_frame(reference_frame)` -> `None` — Set Reference Frame
  - `set_resolution(resolution)` -> `None` — Set Resolution
  - `set_upper_extent(upper_extent)` -> `None` — Set Upper Extent

### `unreal.AvaTranslucentPriorityModifier`
Inherits: `ActorModifierArrangeBaseModifier` | Header: `AvaTranslucentPriorityModifier.h`

Ava Translucent Priority Modifier

**Methods** (12):
  - `get_camera_actor()` -> `CameraActor` — Get Camera Actor
  - `get_include_children()` -> `bool` — Get Include Children
  - `get_mode()` -> `AvaTranslucentPriorityModifierMode` — Get Mode
  - `get_sort_priority()` -> `int32` — Get Sort Priority
  - `get_sort_priority_offset()` -> `int32` — Get Sort Priority Offset
  - `get_sort_priority_step()` -> `int32` — Get Sort Priority Step
  - `set_camera_actor(camera_actor)` -> `None` — Set Camera Actor
  - `set_include_children(include_children)` -> `None` — Set Include Children
  - `set_mode(mode)` -> `None` — Set Mode
  - `set_sort_priority(sort_priority)` -> `None` — Set Sort Priority
  - `set_sort_priority_offset(offset)` -> `None` — Set Sort Priority Offset
  - `set_sort_priority_step(step)` -> `None` — Set Sort Priority Step

### `unreal.AvaVisibilityModifier`
Inherits: `ActorModifierArrangeBaseModifier` | Header: `AvaVisibilityModifier.h`

Controls the visibility of a range of child actors by index.

**Methods** (8):
  - `get_index()` -> `int32` — Get Index
  - `get_invert_visibility()` -> `bool` — Returns true if hiding the child index range instead of showing.
  - `get_skip_when_hidden()` -> `bool` — Get Skip when Hidden
  - `get_treat_as_range()` -> `bool` — Get Treat as Range
  - `set_index(index)` -> `None` — Set Index
  - `set_invert_visibility(invert_visibility)` -> `None` — Sets the child index range to hide instead of showing.
  - `set_skip_when_hidden(skip)` -> `None` — Set Skip when Hidden
  - `set_treat_as_range(treat_as_range)` -> `None` — Set Treat as Range

### `unreal.AvaAutoSizeFitMode`
Inherits: `EnumBase` | Header: `AvaAutoSizeModifier.h`

EAva Auto Size Fit Mode

**Properties** (3):
  - `HEIGHT_ONLY`: `AvaAutoSizeFitMode = Ellipsis` — 2
  - `WIDTH_AND_HEIGHT`: `AvaAutoSizeFitMode = Ellipsis` — 0
  - `WIDTH_ONLY`: `AvaAutoSizeFitMode = Ellipsis` — 1

### `unreal.AvaBooleanMode`
Inherits: `EnumBase` | Header: `AvaBooleanModifier.h`

EAva Boolean Mode

**Properties** (4):
  - `INTERSECT`: `AvaBooleanMode = Ellipsis` — Only keep the intersecting geometry from the two colliding geometry 2
  - `NONE`: `AvaBooleanMode = Ellipsis` — Does not apply any mode, but get affected by other geometry modes 0
  - `SUBTRACT`: `AvaBooleanMode = Ellipsis` — Subtract this geometry from the one it is colliding with 1
  - `UNION`: `AvaBooleanMode = Ellipsis` — Merges the two colliding geometry together 3

### `unreal.AvaDynamicMeshConverterModifierFilter`
Inherits: `EnumBase` | Header: `AvaDynamicMeshConverterModifier.h`

EAva Dynamic Mesh Converter Modifier Filter

**Properties** (3):
  - `EXCLUDE`: `AvaDynamicMeshConverterModifierFilter = Ellipsis` — 2
  - `INCLUDE`: `AvaDynamicMeshConverterModifierFilter = Ellipsis` — 1
  - `NONE`: `AvaDynamicMeshConverterModifierFilter = Ellipsis` — 0

### `unreal.AvaDynamicMeshConverterModifierType`
Inherits: `EnumBase` | Header: `AvaDynamicMeshConverterModifier.h`

Components that can be converted to dynamic mesh

**Properties** (5):
  - `BRUSH_COMPONENT`: `AvaDynamicMeshConverterModifierType = Ellipsis` — 8
  - `DYNAMIC_MESH_COMPONENT`: `AvaDynamicMeshConverterModifierType = Ellipsis` — 2
  - `PROCEDURAL_MESH_COMPONENT`: `AvaDynamicMeshConverterModifierType = Ellipsis` — 16
  - `SKELETAL_MESH_COMPONENT`: `AvaDynamicMeshConverterModifierType = Ellipsis` — 4
  - `STATIC_MESH_COMPONENT`: `AvaDynamicMeshConverterModifierType = Ellipsis` — 1

### `unreal.AvaExtrudeMode`
Inherits: `EnumBase` | Header: `AvaExtrudeModifier.h`

EAva Extrude Mode

**Properties** (3):
  - `FRONT`: `AvaExtrudeMode = Ellipsis` — 1
  - `OPPOSITE`: `AvaExtrudeMode = Ellipsis` — 0
  - `SYMMETRICAL`: `AvaExtrudeMode = Ellipsis` — 2

### `unreal.AvaNormalModifierSplitMethod`
Inherits: `EnumBase` | Header: `AvaNormalModifier.h`

EAva Normal Modifier Split Method

**Properties** (5):
  - `NONE`: `AvaNormalModifierSplitMethod = Ellipsis` — Do not split, leave as it is 0
  - `POLY_GROUP`: `AvaNormalModifierSplitMethod = Ellipsis` — Vertices of a same face grouped together will have a split normal 3
  - `THRESHOLD`: `AvaNormalModifierSplitMethod = Ellipsis` — Vertices above a certain angle threshold will have a split normal 4
  - `TRIANGLE`: `AvaNormalModifierSplitMethod = Ellipsis` — Shared vertex between triangles will have a split normal 2
  - `VERTEX`: `AvaNormalModifierSplitMethod = Ellipsis` — Each vertex will have a split normal between tris 1

### `unreal.AvaOutlineMode`
Inherits: `EnumBase` | Header: `AvaOutlineModifier.h`

EAva Outline Mode

**Properties** (2):
  - `INSET`: `AvaOutlineMode = Ellipsis` — 1
  - `OUTSET`: `AvaOutlineMode = Ellipsis` — 0

### `unreal.AvaPatternModifierAxis`
Inherits: `EnumBase` | Header: `AvaPatternModifier.h`

EAva Pattern Modifier Axis

**Properties** (3):
  - `X`: `AvaPatternModifierAxis = Ellipsis` — 0
  - `Y`: `AvaPatternModifierAxis = Ellipsis` — 1
  - `Z`: `AvaPatternModifierAxis = Ellipsis` — 2

### `unreal.AvaPatternModifierGridAlignment`
Inherits: `EnumBase` | Header: `AvaPatternModifier.h`

EAva Pattern Modifier Grid Alignment

**Properties** (5):
  - `BOTTOM_LEFT`: `AvaPatternModifierGridAlignment = Ellipsis` — 3
  - `BOTTOM_RIGHT`: `AvaPatternModifierGridAlignment = Ellipsis` — 4
  - `CENTER`: `AvaPatternModifierGridAlignment = Ellipsis` — 2
  - `TOP_LEFT`: `AvaPatternModifierGridAlignment = Ellipsis` — 0
  - `TOP_RIGHT`: `AvaPatternModifierGridAlignment = Ellipsis` — 1

### `unreal.AvaPatternModifierLayout`
Inherits: `EnumBase` | Header: `AvaPatternModifier.h`

EAva Pattern Modifier Layout

**Properties** (3):
  - `CIRCLE`: `AvaPatternModifierLayout = Ellipsis` — 2
  - `GRID`: `AvaPatternModifierLayout = Ellipsis` — 1
  - `LINE`: `AvaPatternModifierLayout = Ellipsis` — 0

### `unreal.AvaPatternModifierLineAlignment`
Inherits: `EnumBase` | Header: `AvaPatternModifier.h`

EAva Pattern Modifier Line Alignment

**Properties** (3):
  - `CENTER`: `AvaPatternModifierLineAlignment = Ellipsis` — 1
  - `END`: `AvaPatternModifierLineAlignment = Ellipsis` — 2
  - `START`: `AvaPatternModifierLineAlignment = Ellipsis` — 0

### `unreal.AvaPatternModifierPlane`
Inherits: `EnumBase` | Header: `AvaPatternModifier.h`

EAva Pattern Modifier Plane

**Properties** (3):
  - `XY`: `AvaPatternModifierPlane = Ellipsis` — 0
  - `YZ`: `AvaPatternModifierPlane = Ellipsis` — 2
  - `ZX`: `AvaPatternModifierPlane = Ellipsis` — 1

### `unreal.AvaSizeToTextureRule`
Inherits: `EnumBase` | Header: `AvaSizeToTextureModifier.h`

EAva Size to Texture Rule

**Properties** (4):
  - `ADAPTIVE_HEIGHT`: `AvaSizeToTextureRule = Ellipsis` — Changes to height are allowed, width will react accordingly 1
  - `ADAPTIVE_WIDTH`: `AvaSizeToTextureRule = Ellipsis` — Changes to width are allowed, height will react accordingly 0
  - `FIXED_HEIGHT`: `AvaSizeToTextureRule = Ellipsis` — Lock height and adapt width 2
  - `FIXED_WIDTH`: `AvaSizeToTextureRule = Ellipsis` — Lock width and adapt height 3

### `unreal.AvaSplineSweepSampleMode`
Inherits: `EnumBase` | Header: `AvaSplineSweepModifier.h`

EAva Spline Sweep Sample Mode

**Properties** (2):
  - `CUSTOM_DISTANCE`: `AvaSplineSweepSampleMode = Ellipsis` — steps per custom distance 1 Samples a custom distance
  - `FULL_DISTANCE`: `AvaSplineSweepSampleMode = Ellipsis` — steps on the full distance 0 Samples the full spline distance

### `unreal.AvaSubdivisionType`
Inherits: `EnumBase` | Header: `AvaSubdivideModifier.h`

EAva Subdivision Type

**Properties** (3):
  - `PN`: `AvaSubdivisionType = Ellipsis` — 2
  - `SELECTIVE`: `AvaSubdivisionType = Ellipsis` — 0
  - `UNIFORM`: `AvaSubdivisionType = Ellipsis` — 1

### `unreal.AvaTaperExtent`
Inherits: `EnumBase` | Header: `AvaTaperModifier.h`

EAva Taper Extent

**Properties** (2):
  - `CUSTOM`: `AvaTaperExtent = Ellipsis` — 1
  - `WHOLE_SHAPE`: `AvaTaperExtent = Ellipsis` — 0

### `unreal.AvaTaperInterpolationType`
Inherits: `EnumBase` | Header: `AvaTaperTool.h`

EAva Taper Interpolation Type

**Properties** (5):
  - `CUBIC`: `AvaTaperInterpolationType = Ellipsis` — 2
  - `CUBIC_INVERSE`: `AvaTaperInterpolationType = Ellipsis` — 4
  - `LINEAR`: `AvaTaperInterpolationType = Ellipsis` — 0
  - `QUADRATIC`: `AvaTaperInterpolationType = Ellipsis` — 1
  - `QUADRATIC_INVERSE`: `AvaTaperInterpolationType = Ellipsis` — 3

### `unreal.AvaTaperReferenceFrame`
Inherits: `EnumBase` | Header: `AvaTaperModifier.h`

EAva Taper Reference Frame

**Properties** (2):
  - `CUSTOM`: `AvaTaperReferenceFrame = Ellipsis` — 1
  - `MESH_CENTER`: `AvaTaperReferenceFrame = Ellipsis` — 0

### `unreal.AvaTranslucentPriorityModifierMode`
Inherits: `EnumBase` | Header: `AvaTranslucentPriorityModifier.h`

EAva Translucent Priority Modifier Mode

**Properties** (3):
  - `AUTO_CAMERA_DISTANCE`: `AvaTranslucentPriorityModifierMode = Ellipsis` — The closer you are from the camera based on camera forward axis, the higher your sort priority will ...
  - `AUTO_OUTLINER_TREE`: `AvaTranslucentPriorityModifierMode = Ellipsis` — The higher you are in the outline tree, the higher your sort priority will be 1
  - `MANUAL`: `AvaTranslucentPriorityModifierMode = Ellipsis` — Set it yourself 2
