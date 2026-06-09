# UE Python API — ChaosClothAssetEngine Module

**4 types** from the `ChaosClothAssetEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ChaosClothAsset`, `ChaosClothAssetBase`, `ChaosClothAssetInteractor`, `ChaosClothComponent`

---

## Classes

### `unreal.ChaosClothAsset`
Inherits: `ChaosClothAssetBase` | Header: `ClothAsset.h`

Cloth asset for pattern based simulation.

**Properties** (2):
  - `dataflow_asset`: `Dataflow` — [Read-Write] Dataflow asset.
deprecated: Dataflow Asset is now stored in DataflowInstance (Dataflow)
  - `dataflow_terminal`: `str` — [Read-Write] Dataflow Asset terminal node.
deprecated: Dataflow terminal name is now stored in Dataf...

### `unreal.ChaosClothAssetBase`
Inherits: `SkinnedAsset` | Header: `ClothAssetBase.h`

Base cloth asset class.

**Methods** (4):
  - `get_overlay_material()` -> `MaterialInterface` — Get the default overlay material used by this mesh
  - `get_overlay_material_max_draw_distance()` -> `float` — Get the default overlay material max draw distance used by this mesh
  - `set_overlay_material(new_overlay_material)` -> `None` — Change the default overlay material used by this mesh
  - `set_overlay_material_max_draw_distance(max_draw_distance)` -> `None` — Change the default overlay material max draw distance used by this mesh

**Properties** (1):
  - `shadow_physics_asset`: `PhysicsAsset` [Read-Only] — [Read-Only] Physics asset whose shapes will be used for shadowing when components have bCastCharacte...

### `unreal.ChaosClothAssetInteractor`
Inherits: `Object` | Header: `ClothAssetInteractor.h`

Chaos Cloth Asset Interactor

**Methods** (15):
  - `get_all_properties(lod_index = -1)` -> `Array [ str ]` — Generate a list of all properties held by this interactor. Properties for all LODs will be returned if LODIndex = -1.
  - `get_float_value(property_name, lod_index = 0, default_value = 0.000000)` -> `float` — Get the value for a property cast to float. DefaultValue will be returned if the property is not found.
  - `get_high_float_value(property_name, lod_index = 0, default_value = 0.000000)` -> `float` — Get the high value for a weighted property value. DefaultValue will be returned if the property is not found.
  - `get_int_value(property_name, lod_index = 0, default_value = 0)` -> `int32` — Get the value for a property cast to int. DefaultValue will be returned if the property is not found.
  - `get_low_float_value(property_name, lod_index = 0, default_value = 0.000000)` -> `float` — Get the low value for a weighted property value (same as GetFloatValue). DefaultValue will be returned if the property i...
  - `get_string_value(property_name, lod_index = 0, default_value = '')` -> `str` — Get the string value for a property (typically the associated map name for weighted values). DefaultValue will be return...
  - `get_vector_value(property_name, lod_index = 0, default_value = [0.000000,0.000000,0.000000])` -> `Vector` — Get the value for a property cast to vector. DefaultValue will be returned if the property is not found.
  - `get_weighted_float_value(property_name, lod_index = 0, default_value = [0.000000,0.000000])` -> `Vector2D` — Get the low and high values for a weighted property value. DefaultValue will be returned if the property is not found.
  - `set_float_value(property_name, lod_index = -1, value = 0.000000)` -> `None` — Set the value for a property (if it exists). This sets the Low and High values for weighted values. All LODs will be set...
  - `set_high_float_value(property_name, lod_index = -1, value = 0.000000)` -> `None` — Set the high value for a weighted property (if it exists). All LODs will be set when LODIndex = -1.
  - `set_int_value(property_name, lod_index = -1, value = 0)` -> `None` — Set the value for a property (if it exists). All LODs will be set when LODIndex = -1.
  - `set_low_float_value(property_name, lod_index = -1, value = 0.000000)` -> `None` — Set the low value for a weighted property (if it exists). All LODs will be set when LODIndex = -1.
  - `set_string_value(property_name, lod_index = -1, value = '')` -> `None` — Set the string value for a property (if it exists). This is typically the map name associated with a property. All LODs ...
  - `set_vector_value(property_name, lod_index = -1, value = [0.000000,0.000000,0.000000])` -> `None` — Set the value for a property (if it exists). All LODs will be set when LODIndex = -1.
  - `set_weighted_float_value(property_name, lod_index = -1, value = [0.000000,0.000000])` -> `None` — Set the low and high values for a weighted property (if it exists). All LODs will be set when LODIndex = -1.

### `unreal.ChaosClothComponent`
Inherits: `SkinnedMeshComponent` | Header: `ClothComponent.h`

Chaos Cloth Component

**Methods** (22):
  - `add_collision_source(source_component, source_physics_asset, use_sphyls_only = False)` -> `None` — Add a collision source for the cloth on this component. Each cloth tick, the collision defined by the physics asset, tra...
  - `force_next_update_teleport()` -> `None` — Teleport the cloth particles to the new reference bone location keeping pose and velocities prior to advancing the simul...
  - `force_next_update_teleport_and_reset()` -> `None` — Teleport the cloth particles to the new reference bone location while reseting the pose and velocities prior to advancin...
  - `get_asset()` -> `ChaosClothAssetBase` — Get the cloth object used by this component, could be a cloth asset, an outfit asset, or any other type of asset inherit...
  - `get_cloth_asset()` -> `ChaosClothAsset` — Get the cloth asset used by this component. deprecated: Function âGetClothAssetâ is deprecated.
  - `get_cloth_outfit_interactor(model_index = 0, cloth_simulation_model_name = 'None')` -> `ChaosClothAssetInteractor` — Find the current interactor for the cloth outfit associated with this cloth component. The default parameter values will...
  - `get_collide_with_environment()` -> `bool` — Set whether or not to collision with the environment is enabled.
  - `is_simulation_enabled()` -> `bool` — Return whether or not the simulation is currently enabled.
  - `is_simulation_suspended()` -> `bool` — Return whether or not the simulation is currently suspended.
  - `recreate_cloth_simulation_proxy()` -> `None` — Hard reset the cloth simulation by recreating the proxy.
  - `remove_collision_source(source_component, source_physics_asset)` -> `None` — Remove a cloth collision source matching the specified component and physics asset,
  - `remove_collision_sources(source_component)` -> `None` — Remove all cloth collision sources matching the specified component.
  - `reset_collision_sources()` -> `None` — Remove all cloth collision sources.
  - `reset_config_properties()` -> `None` — Reset all cloth simulation config properties to the values stored in the original cloth asset.
  - `reset_teleport_mode()` -> `None` — Reset the teleport mode.
  - `resume_simulation()` -> `None` — Resume a previously suspended simulation.
  - `set_asset(asset)` -> `None` — Set the cloth object used by this component, could be a cloth asset, an outfit asset, or any other type of asset inherit...
  - `set_cloth_asset(cloth_asset)` -> `None` — Set the cloth asset used by this component. deprecated: Function âSetClothAssetâ is deprecated.
  - `set_collide_with_environment(collide)` -> `None` — Set whether or not to collide with the environment.
  - `set_enable_simulation(enable)` -> `None` — Set whether or not to enable simulation.
  - `set_simulate_in_editor(new_simulate_state)` -> `None` — Sets whether or not to simulate cloth in the editor. This is supported only in the editor
  - `suspend_simulation()` -> `None` — Stop the simulation, and keep the cloth in its last pose.

**Properties** (8):
  - `asset`: `ChaosClothAssetBase` — [Read-Write] (ChaosClothAssetBase)
  - `blend_weight`: `float` — [Read-Write] Blend amount between the skinned (=0) and the simulated pose (=1). (float)
  - `cloth_asset`: `ChaosClothAssetBase` — âcloth_assetâ was renamed to âassetâ. deprecated
  - `enable_simulation`: `bool` — [Read-Write] Whether to enable the simulation or use the skinned pose instead. (bool)
  - `reset`: `bool` — [Read-Write] Whether to reset the pose, bTeleport must be true. (bool)
  - `teleport`: `bool` — [Read-Write] Whether to teleport the cloth prior to advancing the simulation. (bool)
  - `teleport_distance_threshold`: `float` — [Read-Write] Conduct teleportation if the characterâs movement is greater than this threshold in 1...
  - `teleport_rotation_threshold`: `float` — [Read-Write] Rotation threshold in degrees, ranging from 0 to 180.
Conduct teleportation if the char...
