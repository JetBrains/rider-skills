# UE Python API — USDStage Module

**3 types** from the `USDStage` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `UsdDynamicBindingResolverLibrary`, `UsdStageActor`, `UsdStageState`

---

## Classes

### `unreal.UsdDynamicBindingResolverLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `USDDynamicBindingResolverLibrary.h`

Usd Dynamic Binding Resolver Library

**Methods** (1):
  - `resolve_with_stage_actor(world_context_object, params, stage_actor_id_name_filter, root_layer_filter, prim_path)` -> `MovieSceneDynamicBindingResolveResult` [classmethod] — Resolves a Sequencer Dynamic Binding described on Params, returning the actor or component that the Sequencer should bin...

### `unreal.UsdStageActor`
Inherits: `Actor` | Header: `USDStageActor.h`

Usd Stage Actor

**Methods** (34):
  - `get_generated_assets(prim_path)` -> `Array [ Object ]` — Gets the transient assets that were generated for a prim with a given prim path. Likely one asset (e.g. UStaticMesh), bu...
  - `get_generated_component(prim_path)` -> `SceneComponent` — Gets the transient component that was generated for a prim with a given prim path. Warning: The lifetime of the componen...
  - `get_isolated_root_layer()` -> `str` — Returns the root layer identifier of the currently isolated stage if weâre in isolated mode, and the empty string othe...
  - `get_level_sequence()` -> `LevelSequence` — Get Level Sequence
  - `get_source_prim_path(object)` -> `str` — Gets the path to the prim that was parsed to generate the given Object .
  - `get_time()` -> `float` — Get Time
  - `new_stage()` -> `None` — Creates a brand new, memory-only USD stage and opens it
  - `set_asset_cache(new_cache)` -> `None` — Set Asset Cache
  - `set_blocked_prefix_filters(new_filters)` -> `None` — Set Blocked Prefix Filters
  - `set_collapse_top_level_point_instancers(collapse)` -> `None` — Set Collapse Top Level Point Instancers
  - `set_collect_from_entire_subtrees(new_collect_value)` -> `None` — Set Collect from Entire Subtrees
  - `set_collect_metadata(new_collect_value)` -> `None` — Set Collect Metadata
  - `set_collect_on_components(new_collect_value)` -> `None` — Set Collect on Components
  - `set_fallback_collision_type(new_collision_type)` -> `None` — Set Fallback Collision Type
  - `set_geometry_cache_import(import_option)` -> `None` — Set Geometry Cache Import
  - `set_initial_load_set(new_load_set)` -> `None` — Set Initial Load Set
  - `set_interpolation_type(new_type)` -> `None` — Set Interpolation Type
  - `set_invert_filters(new_invert_value)` -> `None` — Set Invert Filters
  - `set_isolated_root_layer(isolated_stage_root_layer)` -> `None` — If IsolatedStageRootLayer is the identifier of one of the sublayers of the currently opened stage, this will enter isola...
  - `set_kinds_to_collapse(new_kinds_to_collapse)` -> `None` — Set Kinds to Collapse
  - `set_material_purpose(new_material_purpose)` -> `None` — Set Material Purpose
  - `set_merge_identical_material_slots(merge)` -> `None` — Set Merge Identical Material Slots
  - `set_nanite_triangle_threshold(new_nanite_triangle_threshold)` -> `None` — Set Nanite Triangle Threshold
  - `set_purposes_to_load(new_purposes_to_load)` -> `None` — Set Purposes to Load
  - `set_render_context(new_render_context)` -> `None` — Set Render Context
  - `set_reuse_identical_assets(reuse)` -> `None` — Set Reuse Identical Assets
  - `set_root_layer(root_file_path)` -> `None` — Set Root Layer
  - `set_root_motion_handling(new_handling_strategy)` -> `None` — Set Root Motion Handling
  - `set_share_assets_for_identical_prims(share)` -> `None` — Set Share Assets for Identical Prims
  - `set_stage_state(new_stage_state)` -> `None` — Set Stage State
  - `set_subdivision_level(new_level)` -> `None` — Set Subdivision Level
  - `set_time(time)` -> `None` — Set Time
  - `set_usd_asset_cache(new_cache)` -> `None` — Set Usd Asset Cache
  - `set_use_prim_kinds_for_collapsing(use)` -> `None` — Set Use Prim Kinds for Collapsing

**Properties** (19):
  - `asset_cache`: `UsdAssetCache` [Read-Only] — [Read-Only] (UsdAssetCache)
  - `fallback_collision_type`: `UsdCollisionType` [Read-Only] — [Read-Only] What type of collision to use for static meshes generated from Prims that donât have p...
  - `geometry_cache_import`: `GeometryCacheImport` [Read-Only] — [Read-Only] (GeometryCacheImport)
  - `initial_load_set`: `UsdInitialLoadSet` [Read-Only] — [Read-Only] These properties are configs so that spawned actors read them from the CDO when spawned....
  - `interpolation_type`: `UsdInterpolationType` [Read-Only] — [Read-Only] (UsdInterpolationType)
  - `kinds_to_collapse`: `int` [Read-Only] — [Read-Only] Whether to try to combine individual assets and components of the same type on a kind-pe...
  - `material_purpose`: `Name` [Read-Only] — [Read-Only] Specifies which material purbose to use when parsing USD material bindings, in addition ...
  - `merge_identical_material_slots`: `bool` [Read-Only] — [Read-Only] If enabled, when multiple mesh prims are collapsed into a single static mesh, identical ...
  - `metadata_options`: `UsdMetadataImportOptions` [Read-Only] — [Read-Only] Describes if/how we should collect metadata from USD prims onto the assets and component...
  - `nanite_triangle_threshold`: `int` [Read-Only] — [Read-Only] Try enabling Nanite for static meshes that are generated with at least this many triangl...
  - `purposes_to_load`: `int` [Read-Only] — [Read-Only] Only load prims with these specific purposes from the USD file (int32)
  - `render_context`: `Name` [Read-Only] — [Read-Only] Specifies which set of shaders to use when parsing USD materials, in addition to the uni...
  - `root_layer`: `FilePath` [Read-Only] — [Read-Only] (FilePath)
  - `root_motion_handling`: `UsdRootMotionHandling` [Read-Only] — [Read-Only] Describes what to add to the root bone animation within generated AnimSequences, if anyt...
  - `scene_component`: `SceneComponent` [Read-Only] — [Read-Only] (SceneComponent)
  - `share_assets_for_identical_prims`: `bool` [Read-Only] — [Read-Only] If true, whenever two prims would have generated identical UAssets (like identical Stati...
  - `stage_state`: `UsdStageState` [Read-Only] — [Read-Only] What to do with the USD Stage pointed to by RootLayer, if any (UsdStageState)
  - `subdivision_level`: `int` [Read-Only] — [Read-Only] Subdivision level to use for all subdivision meshes on the opened stage. 0 means âdonâ...
  - `use_prim_kinds_for_collapsing`: `bool` [Read-Only] — [Read-Only] Use KindsToCollapse to determine when to collapse prim subtrees or not (defaults to enab...

### `unreal.UsdStageState`
Inherits: `EnumBase` | Header: `USDStageActor.h`

EUsd Stage State

**Properties** (3):
  - `CLOSED`: `UsdStageState = Ellipsis` — 0
  - `OPENED`: `UsdStageState = Ellipsis` — 1
  - `OPENED_AND_LOADED`: `UsdStageState = Ellipsis` — 2
