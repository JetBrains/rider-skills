# UE Python API — LandmassEditor Module

**8 types** from the `LandmassEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BrushDataTree`, `LandmassLandscapeInfo`, `LandmassActor`, `LandmassBlueprintFunctionLibrary`, `LandmassErosionBrushBase`, `LandmassManagerBase`, `BrushBlendMode`, `OnBrushUpdatedDelegate`

---

## Classes

### `unreal.BrushDataTree`
Inherits: `StructBase` | Header: `LandmassManagerBase.h`

Brush Data Tree

**Properties** (9):
  - `brush_actors`: `None` — [Read-Write] (Array[LandmassActor])
  - `child_data_count`: `int` — [Read-Write] (int32)
  - `current_level`: `int` — [Read-Write] (int32)
  - `index_x0y0`: `int` — [Read-Write] (int32)
  - `index_x0y1`: `int` — [Read-Write] (int32)
  - `index_x1y0`: `int` — [Read-Write] (int32)
  - `index_x1y1`: `int` — [Read-Write] (int32)
  - `node_extents`: `Vector4` — [Read-Write] (Vector4)
  - `parent_index`: `int` — [Read-Write] (int32)

### `unreal.LandmassLandscapeInfo`
Inherits: `StructBase` | Header: `LandmassManagerBase.h`

Landmass Landscape Info

**Properties** (3):
  - `landscape_quads`: `IntPoint` — [Read-Write] (IntPoint)
  - `landscape_transform`: `Transform` — [Read-Write] (Transform)
  - `render_target_resolution`: `IntPoint` — [Read-Write] (IntPoint)

### `unreal.LandmassActor`
Inherits: `Actor` | Header: `LandmassActor.h`

Landmass Actor

**Methods** (14):
  - `actor_selection_changed(selected)` -> `None` — Actor Selection Changed
  - `custom_tick(delta_seconds)` -> `None` — Custom Tick
  - `draw_brush_material(material)` -> `None` — Draw Brush Material
  - `fast_preview_mode()` -> `None` — Fast Preview Mode
  - `move_brush_down()` -> `None` — Move Brush Down
  - `move_brush_up()` -> `None` — Move Brush Up
  - `move_to_bottom()` -> `None` — Move to Bottom
  - `move_to_top()` -> `None` — Move to Top
  - `render_layer(parameters)` -> `None` — Render Layer
  - `render_layer_native(parameters)` -> `None` — Render Layer Native
  - `restore_landscape_editing()` -> `None` — Restore Landscape Editing
  - `set_editor_tick_enabled(enabled)` -> `None` — Set Editor Tick Enabled
  - `set_mesh_exents_material(material)` -> `None` — Set Mesh Exents Material
  - `update_brush_extents()` -> `None` — Update Brush Extents

**Properties** (17):
  - `affects_heightmap`: `bool` — [Read-Write] (bool)
  - `affects_visibility`: `bool` — [Read-Write] (bool)
  - `affects_weightmaps`: `bool` — [Read-Write] (bool)
  - `brush_extents`: `Vector4` [Read-Only] — [Read-Only] (Vector4)
  - `brush_manager`: `LandmassManagerBase` — [Read-Write] (LandmassManagerBase)
  - `brush_render_parameters`: `LandscapeBrushParameters` — [Read-Write] (LandscapeBrushParameters)
  - `brush_size`: `float` — [Read-Write] (float)
  - `draw_to_entire_landscape`: `bool` — [Read-Write] (bool)
  - `extents_preview_mid`: `MaterialInstanceDynamic` — [Read-Write] (MaterialInstanceDynamic)
  - `height_blend_mode`: `BrushBlendMode` — [Read-Write] (BrushBlendMode)
  - `height_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `heightmap_render_mid`: `MaterialInstanceDynamic` — [Read-Write] (MaterialInstanceDynamic)
  - `on_brush_updated`: `OnBrushUpdatedDelegate` — [Read-Write] (OnBrushUpdatedDelegate)
  - `weight_map_blend_mode`: `BrushBlendMode` — [Read-Write] (BrushBlendMode)
  - `weightmap_layers`: `None` — [Read-Write] (Array[Name])
  - `weightmap_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `weightmap_render_mid`: `MaterialInstanceDynamic` — [Read-Write] (MaterialInstanceDynamic)

### `unreal.LandmassBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LandmassBPEditorExtension.h`

Landmass Blueprint Function Library

**Methods** (4):
  - `combine_world_extents(extents_a, extents_b)` -> `Vector4` [classmethod] — Combine World Extents
  - `force_update_texture(texture)` -> `None` [classmethod] — Force Update Texture
  - `get_cursor_world_ray()` -> `(camera_location=Vector, ray_origin=Vector, ray_direction=Vector) or None` [classmethod] — Get Cursor World Ray
  - `world_extents_to_canvas_coordinates(world_extents, screen_size=Vector2D, coordinate_position=Vector2D, coordinate_size=Vector2D)` [classmethod] — World Extents to Canvas Coordinates

### `unreal.LandmassErosionBrushBase`
Inherits: `LandscapeBlueprintBrushBase` | Header: `LandmassErosionBrushBase.h`

Landmass Erosion Brush Base

**Methods** (3):
  - `actor_selection_changed(selected)` -> `None` — Actor Selection Changed
  - `get_landscape()` -> `Landscape` — Get Landscape
  - `set_target_landscape(owning_landscape)` -> `None` — Adds the brush to the given landscape, removing it from any previous one. This differs from SetOwningLandscape in that S...

### `unreal.LandmassManagerBase`
Inherits: `LandscapeBlueprintBrushBase` | Header: `LandmassManagerBase.h`

Landmass Manager Base

**Methods** (17):
  - `actor_selection_changed(selected)` -> `None` — Actor Selection Changed
  - `add_brush_to_array(brush_to_add)` -> `None` — Add Brush to Array
  - `add_brush_to_tree()` — Add Brush to Tree
  - `consolidate_nodes()` -> `Array [ int32 ]` — Consolidate Nodes
  - `draw_brush_material(brush, brush_material)` -> `None` — Draw Brush Material
  - `get_actors_within_modified_nodes()` — Get Actors Within Modified Nodes
  - `get_landscape()` -> `Landscape` — Get Landscape
  - `get_nodes_within_extents()` — Get Nodes Within Extents
  - `launch_landmass_editor(brush_requesting_editor)` -> `None` — Launch Landmass Editor
  - `populate_node_tree()` -> `None` — Populate Node Tree
  - `remove_brush_from_tree(brush_to_remove)` -> `Array [ int32 ]` — Remove Brush from Tree
  - `request_update_from_brush(brush_requesting_update)` -> `None` — Request Update from Brush
  - `set_capture_boundary_normals(capture_boundary_normals)` -> `None` — Set Capture Boundary Normals
  - `set_target_landscape(owning_landscape)` -> `None` — Adds the brush to the given landscape, removing it from any previous one. This differs from SetOwningLandscape in that S...
  - `sort_brushes(brush_array_to_match, actors_to_sort)` -> `Array [ LandmassActor ]` — Sort Brushes
  - `toggle_preview_mode(enable_preview_mode)` -> `None` — Toggle Preview Mode
  - `update_child_data_counts()` -> `None` — Update Child Data Counts

**Properties** (4):
  - `brush_node_data`: `None` — [Read-Write] (Array[BrushDataTree])
  - `brush_tree_depth`: `int` — [Read-Write] (int32)
  - `landmass_brushes`: `None` — [Read-Write] (Array[LandmassActor])
  - `landscape_information`: `LandmassLandscapeInfo` — [Read-Write] (LandmassLandscapeInfo)

### `unreal.BrushBlendMode`
Inherits: `EnumBase` | Header: `LandmassActor.h`

EBrush Blend Mode

**Properties** (4):
  - `ADDITIVE`: `BrushBlendMode = Ellipsis` — 3
  - `ALPHA_BLEND`: `BrushBlendMode = Ellipsis` — 0
  - `MAX`: `BrushBlendMode = Ellipsis` — 2
  - `MIN`: `BrushBlendMode = Ellipsis` — 1

### `unreal.OnBrushUpdatedDelegate`
Inherits: `MulticastDelegateBase` | Header: `LandmassActor.h`

On Brush Updated Delegate Delegate Signature
