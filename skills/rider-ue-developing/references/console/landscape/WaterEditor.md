# UE Python API — WaterEditor Module

**7 types** from the `WaterEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `WaterBodyBrushCache`, `CausticsGeneratorActor`, `JumpFloodComponent2D`, `WaterBodyBrushCacheContainer`, `WaterBrushManager`, `WaterLandscapeBrush`, `WaterWavesAssetFactory`

---

## Classes

### `unreal.WaterBodyBrushCache`
Inherits: `StructBase` | Header: `WaterBrushCacheContainer.h`

**Properties** (2):
  - `cache_is_valid`: `bool` — [Read-Write] (bool)
  - `cache_render_target`: `TextureRenderTarget2D` — [Read-Write] (TextureRenderTarget2D)

### `unreal.CausticsGeneratorActor`
Inherits: `Actor` | Header: `CausticsGeneratorActor.h`

Caustics Generator Actor

**Methods** (4):
  - `editor_tick(delta_seconds)` -> `None` — Editor Tick
  - `set_editor_tick_enabled(enabled)` -> `None` — Set Editor Tick Enabled
  - `spawn_caustic_particle_grid(hismc, grid_size, grid_tiles)` -> `None` — Spawn Caustic Particle Grid
  - `spawn_water_preview_grid(hismc, grid_size, grid_tiles)` -> `None` — Spawn Water Preview Grid

**Properties** (1):
  - `default_scene_root`: `SceneComponent` — [Read-Write] UPROPERTY(BlueprintReadWrite, NonTransactional, meta = (Category = âDefaultâ))
UHie...

### `unreal.JumpFloodComponent2D`
Inherits: `ActorComponent` | Header: `JumpFloodComponent2D.h`

Jump Flood Component 2D

**Methods** (7):
  - `assign_render_targets(rta, rtb)` -> `None` — Assign Render Targets
  - `create_mi_ds()` -> `bool` — Create MIDs
  - `find_edges(seed_rt, capture_z, curl, use_depth, zx_location_t)` -> `TextureRenderTarget2D` — Find Edges
  - `find_edges_debug(seed_rt, capture_z, curl, dest_rt, z_offset)` -> `None` — Find Edges Debug
  - `jump_flood(seed_rt, scene_capture_z, curl, use_depth, zx_location_t)` -> `None` — Jump Flood
  - `single_blur_step()` -> `TextureRenderTarget2D` — Single Blur Step
  - `single_jump_step()` -> `TextureRenderTarget2D` — Single Jump Step

**Properties** (5):
  - `blur_edges_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `blur_passes`: `int` — [Read-Write] (int32)
  - `find_edges_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `jump_step_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `use_blur`: `bool` — [Read-Write] (bool)

### `unreal.WaterBodyBrushCacheContainer`
Inherits: `Object` | Header: `WaterBrushCacheContainer.h`

Water Body Brush Cache Container

**Properties** (1):
  - `cache`: `WaterBodyBrushCache` — [Read-Write] (WaterBodyBrushCache)

### `unreal.WaterBrushManager`
Inherits: `WaterLandscapeBrush` | Header: `WaterBrushManager.h`

Water Brush Manager

**Methods** (7):
  - `find_edges()` -> `None` — Find Edges
  - `force_update()` -> `None` — Debug Buttons
  - `get_water_cache_key(value=WaterBodyBrushCache)` — out
  - `setup_default_materials()` -> `None` — Setup Default Materials
  - `single_blur_step()` -> `None` — Single Blur Step
  - `single_jump_step()` -> `None` — Single Jump Step
  - `sort_water_bodies_for_brush_render()` -> `Array [ WaterBody ]` — Sorts the water bodies in the order they should be rendered when rendering the water brush

**Properties** (35):
  - `blur_edges_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `brush_angle_falloff_material`: `MaterialInterface` — [Read-Write] Brush materials (MaterialInterface)
  - `brush_angle_falloff_mid`: `MaterialInstanceDynamic` — [Read-Write] MIDs (MaterialInstanceDynamic)
  - `brush_curve_rt_cache`: `None` [Read-Only] — [Read-Only] MIDs End (Map[CurveFloat,WaterBodyBrushCache])
  - `brush_width_falloff_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `brush_width_falloff_mid`: `MaterialInstanceDynamic` — [Read-Write] (MaterialInstanceDynamic)
  - `canvas_segment_size`: `float` — [Read-Write] (float)
  - `composite_water_body_texture_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `composite_water_body_texture_mid`: `MaterialInstanceDynamic` — [Read-Write] (MaterialInstanceDynamic)
  - `debug_distance_field_material`: `MaterialInterface` — rename to DebugDistanceFieldMaterial and make it work : (MaterialInterface) [Read-Write] TODO [jonat...
  - `debug_distance_field_mid`: `MaterialInstanceDynamic` — [Read-Write] (MaterialInstanceDynamic)
  - `disable_brush_texture_effects`: `bool` — [Read-Write] (bool)
  - `distance_divisor`: `float` — [Read-Write] (float)
  - `distance_field_cache_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `distance_field_cache_mid`: `MaterialInstanceDynamic` — [Read-Write] (MaterialInstanceDynamic)
  - `draw_canvas_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `draw_canvas_mid`: `MaterialInstanceDynamic` — [Read-Write] (MaterialInstanceDynamic)
  - `find_edges_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `island_falloff_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `island_falloff_mid`: `MaterialInstanceDynamic` — [Read-Write] (MaterialInstanceDynamic)
  - `jump_step_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `landscape_quads`: `IntPoint` [Read-Only] — [Read-Only] (IntPoint)
  - `landscape_rt_res`: `IntPoint` [Read-Only] — [Read-Only] (IntPoint)
  - `landscape_transform`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `render_river_spline_depth_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `river_spline_mi_ds`: `None` — [Read-Write] (Array[MaterialInstanceDynamic])
  - `show_distance`: `bool` — [Read-Write] (bool)
  - `show_gradient`: `bool` — [Read-Write] (bool)
  - `show_grid`: `bool` — [Read-Write] (bool)
  - `spline_mesh_extension`: `float` — [Read-Write] (float)
  - `use_dynamic_preview_rt`: `bool` — [Read-Write] (bool)
  - `water_clear_height`: `float` — [Read-Write] (float)
  - `weightmap_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `weightmap_mid`: `MaterialInstanceDynamic` — [Read-Write] (MaterialInstanceDynamic)
  - `world_size`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.WaterLandscapeBrush`
Inherits: `LandscapeBlueprintBrush` | Header: `WaterLandscapeBrush.h`

Water Landscape Brush

**Methods** (14):
  - `blueprint_get_render_targets(height_render_target)` -> `TextureRenderTarget2D` — Blueprint Get Render Targets deprecated: This event isnât called anymore, the WaterVelocityTexture is now regenerated ...
  - `blueprint_on_render_target_textures_updated(velocity_texture)` -> `None` — Blueprint on Render Target Textures Updated deprecated: This event isnât called anymore, the WaterVelocityTexture is n...
  - `blueprint_water_bodies_changed()` -> `None` — Blueprint Water Bodies Changed
  - `blueprint_water_body_changed(actor)` -> `None` — Blueprint Water Body Changed
  - `clear_actor_cache(actor)` -> `None` — Clear Actor Cache
  - `clear_water_body_cache(water_body)` -> `None` — Clear Water Body Cache deprecated: Use ClearActorCache instead
  - `force_water_texture_update()` -> `None` — Force Water Texture Update deprecated: This function is now useless, the WaterVelocityTexture is now regenerated at runt...
  - `get_actor_cache(actor, cache_class)` -> `Object` — Get Actor Cache
  - `get_actors_affecting_landscape()` -> `Array [ WaterBrushActorInterface ]` — Get Actors Affecting Landscape
  - `get_water_bodies(water_body_class)` -> `Array [ WaterBody ]` — Get Water Bodies
  - `get_water_body_cache(water_body, cache_class)` -> `Object` — Get Water Body Cache deprecated: Use GetActorCache instead
  - `get_water_body_islands(water_body_island_class)` -> `Array [ WaterBodyIsland ]` — Get Water Body Islands
  - `set_actor_cache(actor, cache)` -> `None` — Set Actor Cache
  - `set_water_body_cache(water_body, cache)` -> `None` — Set Water Body Cache deprecated: Use SetActorCache instead

### `unreal.WaterWavesAssetFactory`
Inherits: `Factory` | Header: `WaterWavesAssetFactory.h`

Water Waves Asset Factory
