# UE Python API — NavigationSystem Module

**46 types** from the `NavigationSystem` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `NavigationFilterArea`, `NavigationFilterFlags`, `NavLinkGenerationJumpDownConfig`, `NavMeshResolutionParam`, `RecastNavMeshTileGenerationDebug`, `AbstractNavData`, `BaseGeneratedNavLinksProxy`, `NavArea`, `NavArea_Default`, `NavArea_LowHeight`, `NavArea_Null`, `NavArea_Obstacle`, `NavAreaMeta`, `NavAreaMeta_SwitchByAgent`, `NavigationData`, `NavigationGraph`, `NavigationGraphNode`, `NavigationGraphNodeComponent`, `NavigationInvokerComponent`, `NavigationPath`, ... (46 total)

---

## Classes

### `unreal.NavigationFilterArea`
Inherits: `StructBase` | Header: `NavigationQueryFilter.h`

Navigation Filter Area

### `unreal.NavigationFilterFlags`
Inherits: `StructBase` | Header: `NavigationQueryFilter.h`

Use UNavigationSystemV1.DescribeFilterFlags() to setup user friendly names of flags

### `unreal.NavLinkGenerationJumpDownConfig`
Inherits: `StructBase` | Header: `LinkGenerationConfig.h`

Experimental configuration to generate vertical links.

**Properties** (1):
  - `area_class`: `Class` — [Read-Write]
deprecated: Use DownDirectionAreaClass and UpDirectionAreaClass instead. (type(Class))

### `unreal.NavMeshResolutionParam`
Inherits: `StructBase` | Header: `RecastNavMesh.h`

Nav Mesh Resolution Param

### `unreal.RecastNavMeshTileGenerationDebug`
Inherits: `StructBase` | Header: `RecastNavMesh.h`

Recast Nav Mesh Tile Generation Debug

### `unreal.AbstractNavData`
Inherits: `NavigationData` | Header: `AbstractNavData.h`

Abstract Nav Data

### `unreal.BaseGeneratedNavLinksProxy`
Inherits: `Object` | Header: `BaseGeneratedNavLinksProxy.h`

Experimental Base class used to create generated navlinks proxy. The proxy id is used to represent multiple links generated from the same configuration.

### `unreal.NavArea`
Inherits: `NavAreaBase` | Header: `NavArea.h`

Class containing definition of a navigation area

### `unreal.NavArea_Default`
Inherits: `NavArea` | Header: `NavArea_Default.h`

Regular navigation area, applied to entire navigation data by default

### `unreal.NavArea_LowHeight`
Inherits: `NavArea` | Header: `NavArea_LowHeight.h`

Special area that can be generated in spaces with insufficient free height above. Cannot be traversed by anyone.

### `unreal.NavArea_Null`
Inherits: `NavArea` | Header: `NavArea_Null.h`

In general represents an empty area, that cannot be traversed by anyone. Ever.

### `unreal.NavArea_Obstacle`
Inherits: `NavArea` | Header: `NavArea_Obstacle.h`

In general represents a high cost area, that shouldnât be traversed by anyone unless no other path exist.

### `unreal.NavAreaMeta`
Inherits: `NavArea` | Header: `NavAreaMeta.h`

### `unreal.NavAreaMeta_SwitchByAgent`
Inherits: `NavAreaMeta` | Header: `NavAreaMeta_SwitchByAgent.h`

Class containing definition of a navigation area

### `unreal.NavigationData`
Inherits: `Actor` | Header: `NavigationData.h`

Represents abstract Navigation Data (sub-classed as NavMesh, NavGraph, etc) Used as a common interface for all navigation types handled by NavigationSystem

### `unreal.NavigationGraph`
Inherits: `NavigationData` | Header: `NavigationGraph.h`

currently abstract since itâs not full implemented

### `unreal.NavigationGraphNode`
Inherits: `Actor` | Header: `NavigationGraphNode.h`

Navigation Graph Node

### `unreal.NavigationGraphNodeComponent`
Inherits: `SceneComponent` | Header: `NavigationGraphNodeComponent.h`

Navigation Graph Node Component

### `unreal.NavigationInvokerComponent`
Inherits: `ActorComponent` | Header: `NavigationInvokerComponent.h`

Navigation Invoker Component

### `unreal.NavigationPath`
Inherits: `Object` | Header: `NavigationPath.h`

UObject wrapper for FNavigationPath

**Methods** (9):
  - `enable_debug_drawing(should_draw_debug_data, path_color = [1.000000,1.000000,1.000000,1.000000])` -> `None` — Enable Debug Drawing
  - `enable_recalculation_on_invalidation(do_recalculation)` -> `None` — if enabled path will request recalculation if it gets invalidated due to a change to underlying navigation
  - `get_debug_string()` -> `str` — UObject end
  - `get_path_cost()` -> `double` — Get Path Cost
  - `get_path_lenght()` -> `float` — deprecated: âget_path_lenghtâ was renamed to âget_path_lengthâ.
  - `get_path_length()` -> `double` — Get Path Length
  - `is_partial()` -> `bool` — Is Partial
  - `is_string_pulled()` -> `bool` — Is String Pulled
  - `is_valid()` -> `bool` — Is Valid

**Properties** (3):
  - `path_points`: `None` [Read-Only] — [Read-Only] (Array[Vector])
  - `path_updated_notifier`: `OnNavigationPathUpdated` — [Read-Write] (OnNavigationPathUpdated)
  - `recalculate_on_invalidation`: `NavigationOptionFlag` [Read-Only] — [Read-Only] (NavigationOptionFlag)

### `unreal.NavigationQueryFilter`
Inherits: `Object` | Header: `NavigationQueryFilter.h`

Class containing definition of a navigation query filter

### `unreal.NavigationSystemV1`
Inherits: `NavigationSystemBase` | Header: `NavigationSystem.h`

Navigation System V1

**Methods** (19):
  - `find_path_to_actor_synchronously(world_context_object, path_start, goal_actor, tether_distance = 50.000000, pathfinding_context = None, filter_class = None)` -> `NavigationPath` [classmethod]
  - `find_path_to_location_synchronously(world_context_object, path_start, path_end, pathfinding_context = None, filter_class = None)` -> `NavigationPath` [classmethod] — Finds path instantly, in a FindPath Synchronously.
  - `get_navigation_system(world_context_object)` -> `NavigationSystemV1` [classmethod] — Blueprint functions
  - `get_path_cost(world_context_object, path_start, path_end, nav_data=None, path_cost=double)` [classmethod] — Potentially expensive. Use with caution. Consider using UPathFollowingComponent::GetRemainingPathCost instead
  - `get_path_length(world_context_object, path_start, path_end, nav_data=None, path_length=double)` [classmethod] — Potentially expensive. Use with caution
  - `get_random_location_in_navigable_radius(world_context_object, origin, radius, nav_data = None, filter_class = None)` -> `Vector or None` [classmethod] — Generates a random location in navigable space within given radius of Origin.
  - `get_random_point_in_navigable_radius(world_context_object, origin, radius, nav_data = None, filter_class = None)` -> `Vector or None` [classmethod] — K2 Get Random Point in Navigable Radius deprecated: GetRandomPointInNavigableRadius is deprecated. Use GetRandomLocation...
  - `get_random_reachable_point_in_radius(world_context_object, origin, radius, nav_data = None, filter_class = None)` -> `Vector or None` [classmethod] — Generates a random location reachable from given Origin location.
  - `is_navigation_being_built(world_context_object)` -> `bool` [classmethod] — Is Navigation Being Built
  - `is_navigation_being_built_or_locked(world_context_object)` -> `bool` [classmethod] — Is Navigation Being Built or Locked
  - `k2_replace_area_in_octree_data(object, old_area, new_area)` -> `bool` — K2 Replace Area in Octree Data
  - `navigation_raycast(world_context_object, ray_start, ray_end, filter_class = None, querier = None)` -> `Vector or None` [classmethod] — Performs navigation raycast on NavigationData appropriate for given Querier.
  - `on_navigation_bounds_updated(nav_volume)` -> `None` — todo: document
  - `project_point_to_navigation(world_context_object, point, nav_data, filter_class, query_extent = [0.000000,0.000000,0.000000])` -> `Vector or None` [classmethod] — Project a point onto the NavigationData
  - `register_navigation_invoker(invoker, tile_generation_radius = 3000.000000, tile_removal_radius = 5000.000000)` -> `None` — note:: you need NavigationSystemâs GenerateNavigationOnlyAroundNavigationInvokers to be set to true to take advantage ...
  - `reset_max_simultaneous_tile_generation_jobs_count()` -> `None` — Brings limit of simultaneous navmesh tile generation jobs back to Project Settingâs default value
  - `set_geometry_gathering_mode(new_mode)` -> `None` — Set Geometry Gathering Mode
  - `set_max_simultaneous_tile_generation_jobs_count(max_number_of_jobs)` -> `None` — will limit the number of simultaneously running navmesh tile generation jobs to specified number.
  - `unregister_navigation_invoker(invoker)` -> `None` — Removes given actor from the list of active navigation enforcers. see: RegisterNavigationInvoker for more details

**Properties** (3):
  - `crowd_manager_class`: `Class` [Read-Only] — [Read-Only] (Class)
  - `default_agent_name`: `Name` [Read-Only] — [Read-Only] If not None indicates which of navigation datas and supported agents are
going to be use...
  - `on_navigation_generation_finished_delegate`: `OnNavDataGenericEvent` — [Read-Write] (OnNavDataGenericEvent)

### `unreal.NavigationTestingActor`
Inherits: `Actor` | Header: `NavigationTestingActor.h`

Navigation Testing Actor

**Properties** (8):
  - `path_cost`: `float` [Read-Only] — [Read-Only] (double)
  - `path_exist`: `bool` [Read-Only] — [Read-Only] (bool)
  - `path_is_partial`: `bool` [Read-Only] — [Read-Only] (bool)
  - `path_search_out_of_nodes`: `bool` [Read-Only] — [Read-Only] (bool)
  - `pathfinding_steps`: `int` [Read-Only] — [Read-Only] (int32)
  - `pathfinding_time`: `float` [Read-Only] — [Read-Only] Time in micro seconds (float)
  - `projected_location`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `projected_location_valid`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.NavLinkComponent`
Inherits: `PrimitiveComponent` | Header: `NavLinkComponent.h`

Nav Link Component

**Properties** (1):
  - `links`: `None` [Read-Only] — [Read-Only] (Array[NavigationLink])

### `unreal.NavLinkCustomComponent`
Inherits: `NavRelevantComponent` | Header: `NavLinkCustomComponent.h`

Encapsulates NavLinkCustomInterface interface, can be used with Actors not relevant for navigation

### `unreal.NavLinkRenderingComponent`
Inherits: `PrimitiveComponent` | Header: `NavLinkRenderingComponent.h`

Nav Link Rendering Component

### `unreal.NavLinkTrivial`
Inherits: `NavLinkDefinition` | Header: `NavLinkTrivial.h`

Nav Link Trivial

### `unreal.NavMeshBoundsVolume`
Inherits: `Volume` | Header: `NavMeshBoundsVolume.h`

Nav Mesh Bounds Volume

### `unreal.NavMeshRenderingComponent`
Inherits: `DebugDrawComponent` | Header: `NavMeshRenderingComponent.h`

Nav Mesh Rendering Component

### `unreal.NavModifierComponent`
Inherits: `NavRelevantComponent` | Header: `NavModifierComponent.h`

Nav Modifier Component

**Methods** (2):
  - `set_area_class(new_area_class)` -> `None` — Set Area Class
  - `set_area_class_to_replace(new_area_class_to_replace)` -> `None` — Set Area Class to Replace

**Properties** (2):
  - `area_class`: `Class` [Read-Only] — [Read-Only] NavArea to apply inside the defined volume. (type(Class))
  - `area_class_to_replace`: `Class` [Read-Only] — it will now replace any surface marked by AreaClassToReplace in the volume and replace it with AreaC...

### `unreal.NavModifierVolume`
Inherits: `Volume` | Header: `NavModifierVolume.h`

Allows applying selected AreaClass to navmesh, using Volumeâs shape

**Methods** (2):
  - `set_area_class(new_area_class = None)` -> `None` — Set Area Class
  - `set_area_class_to_replace(new_area_class_to_replace = None)` -> `None` — Set Area Class to Replace

**Properties** (2):
  - `area_class`: `Class` [Read-Only] — [Read-Only] NavArea to apply inside the defined volume. (type(Class))
  - `area_class_to_replace`: `Class` [Read-Only] — it will now replace any surface marked by AreaClassToReplace in the volume and replace it with AreaC...

### `unreal.NavRelevantComponent`
Inherits: `ActorComponent` | Header: `NavRelevantComponent.h`

Nav Relevant Component

**Methods** (1):
  - `set_navigation_relevancy(relevant)` -> `None` — Set Navigation Relevancy

### `unreal.NavSystemConfigOverride`
Inherits: `Actor` | Header: `NavSystemConfigOverride.h`

Nav System Config Override

**Properties** (3):
  - `load_on_client`: `bool` — [Read-Write] (bool)
  - `navigation_system_config`: `NavigationSystemConfig` [Read-Only] — [Read-Only] (NavigationSystemConfig)
  - `override_policy`: `NavSystemOverridePolicy` [Read-Only] — [Read-Only] If thereâs already a NavigationSystem instance in the world how should this nav overri...

### `unreal.NavTestRenderingComponent`
Inherits: `DebugDrawComponent` | Header: `NavTestRenderingComponent.h`

Nav Test Rendering Component

### `unreal.RecastFilter_UseDefaultArea`
Inherits: `NavigationQueryFilter` | Header: `RecastFilter_UseDefaultArea.h`

Regular navigation area, applied to entire navigation data by default

### `unreal.RecastNavMesh`
Inherits: `NavigationData` | Header: `RecastNavMesh.h`

Recast Nav Mesh

**Methods** (1):
  - `k2_replace_area_in_tile_bounds(bounds, old_area, new_area, replace_links = True)` -> `bool`

**Properties** (3):
  - `agent_max_step_height`: `float` — [Read-Write]
deprecated: Use NavMeshResolutionParams to set AgentMaxStepHeight for the different res...
  - `cell_height`: `float` — [Read-Write]
deprecated: Use NavMeshResolutionParams to set CellHeight for the different resolutions...
  - `cell_size`: `float` — [Read-Write]
deprecated: Use NavMeshResolutionParams to set CellSize for the different resolutions i...

### `unreal.SplineNavModifierComponent`
Inherits: `NavModifierComponent` | Header: `SplineNavModifierComponent.h`

Used to assign a chosen NavArea to the nav mesh in the vicinity of a chosen spline. A tube is constructed around the spline and intersected with the nav mesh. Set its dimensions with StrokeWidth and S...

### `unreal.HeightFieldRenderMode`
Inherits: `EnumBase` | Header: `RecastNavMesh.h`

EHeight Field Render Mode

**Properties** (2):
  - `SOLID`: `HeightFieldRenderMode = Ellipsis` — 0
  - `WALKABLE`: `HeightFieldRenderMode = Ellipsis` — 1

### `unreal.NavCostDisplay`
Inherits: `EnumBase` | Header: `NavigationTestingActor.h`

ENav Cost Display

**Properties** (3):
  - `HEURISTIC_ONLY`: `NavCostDisplay = Ellipsis` — 1
  - `REAL_COST_ONLY`: `NavCostDisplay = Ellipsis` — 2
  - `TOTAL_COST`: `NavCostDisplay = Ellipsis` — 0

### `unreal.NavigationLedgeSlopeFilterMode`
Inherits: `EnumBase` | Header: `RecastNavMesh.h`

ENavigation Ledge Slope Filter Mode

**Properties** (3):
  - `NONE`: `NavigationLedgeSlopeFilterMode = Ellipsis` — Use walkableClimb value to filter 1
  - `RECAST`: `NavigationLedgeSlopeFilterMode = Ellipsis` — 0
  - `USE_STEP_HEIGHT_FROM_AGENT_MAX_SLOPE`: `NavigationLedgeSlopeFilterMode = Ellipsis` — Skip slope filtering 2

### `unreal.NavSystemOverridePolicy`
Inherits: `EnumBase` | Header: `NavSystemConfigOverride.h`

ENav System Override Policy

**Properties** (3):
  - `APPEND`: `NavSystemOverridePolicy = Ellipsis` — the pre-existing nav system instance will be destroyed. 1
  - `OVERRIDE`: `NavSystemOverridePolicy = Ellipsis` — 0
  - `SKIP`: `NavSystemOverridePolicy = Ellipsis` — config information will be added to pre-existing nav system instance 2

### `unreal.RecastPartitioning`
Inherits: `EnumBase` | Header: `RecastNavMesh.h`

keep in sync with rcRegionPartitioning enum!

**Properties** (3):
  - `CHUNKY_MONOTONE`: `RecastPartitioning = Ellipsis` — 2
  - `MONOTONE`: `RecastPartitioning = Ellipsis` — 0
  - `WATERSHED`: `RecastPartitioning = Ellipsis` — 1

### `unreal.RuntimeGenerationType`
Inherits: `EnumBase` | Header: `NavigationData.h`

Supported options for runtime navigation data generation

**Properties** (3):
  - `DYNAMIC`: `RuntimeGenerationType = Ellipsis` — Fully dynamic, supports geometry changes along with navigation modifiers 2
  - `DYNAMIC_MODIFIERS_ONLY`: `RuntimeGenerationType = Ellipsis` — Supports only navigation modifiers updates 1
  - `STATIC`: `RuntimeGenerationType = Ellipsis` — No runtime generation, fully static navigation data 0

### `unreal.SubdivisionLOD`
Inherits: `EnumBase` | Header: `SplineNavModifierComponent.h`

ESubdivision LOD

**Properties** (4):
  - `HIGH`: `SubdivisionLOD = Ellipsis` — 2
  - `LOW`: `SubdivisionLOD = Ellipsis` — 0
  - `MEDIUM`: `SubdivisionLOD = Ellipsis` — 1
  - `ULTRA`: `SubdivisionLOD = Ellipsis` — 3

### `unreal.OnNavDataGenericEvent`
Inherits: `MulticastDelegateBase` | Header: `NavigationSystem.h`

Delegate to let interested parties know that Nav Data has been registered

### `unreal.OnNavigationPathUpdated`
Inherits: `MulticastDelegateBase` | Header: `NavigationPath.h`

On Navigation Path Updated Delegate Signature
