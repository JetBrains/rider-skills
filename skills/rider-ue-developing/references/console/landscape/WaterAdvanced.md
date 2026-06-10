# UE Python API — WaterAdvanced Module

**11 types** from the `WaterAdvanced` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ShallowWaterPhysicsAssetOverride`, `ShallowWaterSimParameters`, `BasicShallowWaterSubsystem`, `FFTOceanPatchSubsystem`, `ShallowWaterPhysicsAssetOverridesDataAsset`, `ShallowWaterRiver`, `ShallowWaterRiverComponent`, `ShallowWaterSettings`, `ShallowWaterSubsystem`, `ShallowWaterCollisionContextType`, `ShallowWaterRenderState`

---

## Classes

### `unreal.ShallowWaterPhysicsAssetOverride`
Inherits: `StructBase` | Header: `ShallowWaterCommon.h`

Shallow Water Physics Asset Override

### `unreal.ShallowWaterSimParameters`
Inherits: `StructBase` | Header: `ShallowWaterCommon.h`

Shallow Water Sim Parameters

### `unreal.BasicShallowWaterSubsystem`
Inherits: `ShallowWaterSubsystem` | Header: `BasicShallowWaterSubsystem.h`

Basic Shallow Water Subsystem

### `unreal.FFTOceanPatchSubsystem`
Inherits: `TickableWorldSubsystem` | Header: `FFTOceanPatchSubsystem.h`

FFTOcean Patch Subsystem

**Properties** (1):
  - `settings`: `ShallowWaterSettings` [Read-Only] — [Read-Only] (ShallowWaterSettings)

### `unreal.ShallowWaterPhysicsAssetOverridesDataAsset`
Inherits: `DataAsset` | Header: `ShallowWaterPhysicsAssetOverridesDataAsset.h`

Shallow Water Physics Asset Overrides Data Asset

### `unreal.ShallowWaterRiver`
Inherits: `Actor` | Header: `ShallowWaterRiverActor.h`

Shallow Water River

### `unreal.ShallowWaterRiverComponent`
Inherits: `PrimitiveComponent` | Header: `ShallowWaterRiverActor.h`

Shallow Water River Component

**Methods** (1):
  - `set_paused(pause)` -> `None` — Set Paused

**Properties** (5):
  - `baked_foam_rt`: `TextureRenderTarget2D` [Read-Only] — [Read-Only] (TextureRenderTarget2D)
  - `baked_sim`: `BakedShallowWaterSimulationComponent` [Read-Only] — [Read-Only] (BakedShallowWaterSimulationComponent)
  - `baked_water_surface_rt`: `TextureRenderTarget2D` [Read-Only] — [Read-Only] (TextureRenderTarget2D)
  - `river_sim_system`: `NiagaraComponent` [Read-Only] — [Read-Only] Asset can be set in Project Settings - Plugins - Water ShallowWaterSimulation (NiagaraCo...
  - `water_info_texture`: `TextureRenderTarget2DArray` [Read-Only] — [Read-Only] (TextureRenderTarget2DArray)

### `unreal.ShallowWaterSettings`
Inherits: `DeveloperSettings` | Header: `ShallowWaterSettings.h`

Shallow Water Settings

**Properties** (15):
  - `default_ocean_patch_niagara_system`: `NiagaraSystem` [Read-Only] — [Read-Only] (NiagaraSystem)
  - `default_shallow_water_collision_ndc`: `NiagaraDataChannelAsset` [Read-Only] — [Read-Only] (NiagaraDataChannelAsset)
  - `default_shallow_water_niagara_simulation`: `NiagaraSystem` [Read-Only] — [Read-Only] (NiagaraSystem)
  - `grid_center_mpc_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `max_active_pawn_num`: `int` [Read-Only] — [Read-Only] (int32)
  - `max_impulse_force_num`: `int` [Read-Only] — [Read-Only] (int32)
  - `normal_rt_material_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `physics_asset_overrides_data_asset`: `ShallowWaterPhysicsAssetOverridesDataAsset` — âphysics_asset_overrides_data_assetâ was renamed to âphysics_asset_proxies_data_assetâ. depr...
  - `physics_asset_proxies_data_asset`: `ShallowWaterPhysicsAssetOverridesDataAsset` [Read-Only] — [Read-Only] Default overrides. Game Feature Plugin can register their own overrides asset with subsy...
  - `resolution_max_axis_mpc_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `shallow_water_sim_parameters`: `ShallowWaterSimParameters` [Read-Only] — [Read-Only] (ShallowWaterSimParameters)
  - `use_default_shallow_water_subsystem`: `bool` [Read-Only] — [Read-Only] (bool)
  - `visualize_active_pawn`: `bool` [Read-Only] — [Read-Only] (bool)
  - `water_mpc`: `MaterialParameterCollection` [Read-Only] — [Read-Only] (MaterialParameterCollection)
  - `world_grid_size_mpc_name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.ShallowWaterSubsystem`
Inherits: `TickableWorldSubsystem` | Header: `ShallowWaterSubsystem.h`

Shallow Water Subsystem

**Methods** (7):
  - `add_collision_agent(collision_tracker_actor: Actor, max_lifespan: float = 60.0)` -> `None` — deprecated: âadd_collision_agentâ was renamed to âadd_collision_tracker_for_actorâ.
  - `add_collision_tracker_for_actor(collision_tracker_actor, max_lifespan = 60.000000)` -> `None`
  - `get_all_overlapping_water_bodies_and_update_collision_trackers()` -> `Set [ WaterBody ]`
  - `register_impact(impact_position, impact_velocity, impact_radius)` -> `None` — Register Impact
  - `remove_collision_agent_for_actor(collision_tracker_actor: Actor)` -> `None` — deprecated: âremove_collision_agent_for_actorâ was renamed to âremove_collision_tracker_for_actorâ.
  - `remove_collision_tracker_for_actor(collision_tracker_actor)` -> `None` — Remove Collision Tracker for Actor
  - `set_water_body_mid_parameters(water_body)` -> `None` — Manually set MID parameters for water bodies before they collide with any pawns or CollisionTrackers

**Properties** (5):
  - `mpc`: `MaterialParameterCollection` [Read-Only] — [Read-Only] (MaterialParameterCollection)
  - `normal_rt`: `TextureRenderTarget2D` [Read-Only] — [Read-Only] (TextureRenderTarget2D)
  - `settings`: `ShallowWaterSettings` [Read-Only] — [Read-Only] (ShallowWaterSettings)
  - `shallow_water_niagara_simulation`: `NiagaraComponent` [Read-Only] — [Read-Only] Asset can be set in Project Settings - Plugins - Water ShallowWaterSimulation (NiagaraCo...
  - `water_info_texture`: `TextureRenderTarget2DArray` [Read-Only] — [Read-Only] (TextureRenderTarget2DArray)

### `unreal.ShallowWaterCollisionContextType`
Inherits: `EnumBase` | Header: `ShallowWaterSubsystem.h`

EShallow Water Collision Context Type

**Properties** (3):
  - `CUSTOM`: `ShallowWaterCollisionContextType = Ellipsis` — Pawn as driver or pawn as passenger 2
  - `PAWN`: `ShallowWaterCollisionContextType = Ellipsis` — 0
  - `VEHICLE`: `ShallowWaterCollisionContextType = Ellipsis` — 1

### `unreal.ShallowWaterRenderState`
Inherits: `EnumBase` | Header: `ShallowWaterRiverActor.h`

EShallow Water Render State

**Properties** (6):
  - `BAKED_SIM`: `ShallowWaterRenderState = Ellipsis` — 3
  - `DEBUG_RENDER_BOTTOM_CONTOUR`: `ShallowWaterRenderState = Ellipsis` — 4
  - `DEBUG_RENDER_FOAM`: `ShallowWaterRenderState = Ellipsis` — 5
  - `LIVE_SIM`: `ShallowWaterRenderState = Ellipsis` — 2
  - `WATER_COMPONENT`: `ShallowWaterRenderState = Ellipsis` — 0
  - `WATER_COMPONENT_WITH_BAKED_SIM`: `ShallowWaterRenderState = Ellipsis` — 1
