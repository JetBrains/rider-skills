# UE Python API — WaveFunctionCollapse Module

**11 types** from the `WaveFunctionCollapse` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `WaveFunctionCollapseAdjacencyToOptionsMap`, `WaveFunctionCollapseNeighbor`, `WaveFunctionCollapseNeighborRule`, `WaveFunctionCollapseOption`, `WaveFunctionCollapseOptions`, `WaveFunctionCollapseQueueElement`, `WaveFunctionCollapseTile`, `WaveFunctionCollapseBPLibrary`, `WaveFunctionCollapseModel`, `WaveFunctionCollapseSubsystem`, `WaveFunctionCollapseAdjacency`

---

## Classes

### `unreal.WaveFunctionCollapseAdjacencyToOptionsMap`
Inherits: `StructBase` | Header: `WaveFunctionCollapseModel.h`

Container struct for AdjacencyToOptionsMap Stores the weight and contribution of an option

**Properties** (3):
  - `adjacency_to_options_map`: `None` — [Read-Write] (Map[WaveFunctionCollapseAdjacency,WaveFunctionCollapseOptions])
  - `contribution`: `int` — [Read-Write] The amount of times an option is present when deriving a model.
This value is used to c...
  - `weight`: `float` — [Read-Write] The weight of an option calculated by dividing this Contribution by the sum of all cont...

### `unreal.WaveFunctionCollapseNeighbor`
Inherits: `StructBase` | Header: `WaveFunctionCollapseBPLibrary.h`

Wave Function Collapse Neighbor

**Properties** (3):
  - `adjacency`: `WaveFunctionCollapseAdjacency` — [Read-Write] (WaveFunctionCollapseAdjacency)
  - `neighbor_object`: `SoftObjectPath` — [Read-Write] (SoftObjectPath)
  - `step`: `int` — [Read-Write] (int32)

### `unreal.WaveFunctionCollapseNeighborRule`
Inherits: `StructBase` | Header: `WaveFunctionCollapseBPLibrary.h`

Wave Function Collapse Neighbor Rule

**Properties** (5):
  - `key_object`: `SoftObjectPath` — [Read-Write] (SoftObjectPath)
  - `neighbors`: `None` — [Read-Write] (Array[WaveFunctionCollapseNeighbor])
  - `spawn_chance`: `float` — [Read-Write] SpawnChance 1 = 100 % chance to spawn, SpawnChance 0 = 0 % chance to spawn (float)
  - `spawn_objects`: `None` — [Read-Write] (Array[SoftObjectPath])
  - `spawn_relative_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.WaveFunctionCollapseOption`
Inherits: `StructBase` | Header: `WaveFunctionCollapseModel.h`

Base Option Struct which holds an object, its orientation and scale

**Properties** (3):
  - `base_object`: `SoftObjectPath` — [Read-Write] (SoftObjectPath)
  - `base_rotator`: `Rotator` — [Read-Write] (Rotator)
  - `base_scale3d`: `Vector` — [Read-Write] (Vector)

### `unreal.WaveFunctionCollapseOptions`
Inherits: `StructBase` | Header: `WaveFunctionCollapseModel.h`

Container struct for array of Options

**Properties** (1):
  - `options`: `None` — [Read-Write] (Array[WaveFunctionCollapseOption])

### `unreal.WaveFunctionCollapseQueueElement`
Inherits: `StructBase` | Header: `WaveFunctionCollapseModel.h`

A helper struct used for queuing during Observation and Propagation phases

**Properties** (2):
  - `adjacency`: `WaveFunctionCollapseAdjacency` — [Read-Write] (WaveFunctionCollapseAdjacency)
  - `center_object_index`: `int` — [Read-Write] (int32)

### `unreal.WaveFunctionCollapseTile`
Inherits: `StructBase` | Header: `WaveFunctionCollapseModel.h`

Base Tile Struct which holds an array of remaining Options and its Shannon Entropy value

**Properties** (2):
  - `remaining_options`: `None` — [Read-Write] (Array[WaveFunctionCollapseOption])
  - `shannon_entropy`: `float` — [Read-Write] (float)

### `unreal.WaveFunctionCollapseBPLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `WaveFunctionCollapseBPLibrary.h`

Wave Function Collapse BPLibrary

**Methods** (17):
  - `add_to_adjacency_to_options_map(adjacency_to_options_map, adjacency, option)` -> `WaveFunctionCollapseAdjacencyToOptionsMap` [classmethod] — Add an entry to an AdjacencyToOptionsMap
  - `build_initial_tile(wfc_model)` -> `WaveFunctionCollapseTile` [classmethod] — Builds the initial tile which adds every unique option in a model to its RemainingOptions array and calculates its entro...
  - `calculate_shannon_entropy(options, wfc_model)` -> `float` [classmethod] — Calculates Shannon Entropy from an array of options and a given model
  - `derive_model_from_actors(actors, wfc_model, tile_size, is_border_empty_option, is_min_z_floor_option, use_uniform_weight_distribution, auto_derive_z_axis_rotation_constraints, spawn_exclusion_assets, ignore_rotation_assets)` -> `None` [classmethod] — Derive constraints from a given layout of actors and append them to a model
  - `get_adjacent_indices(index, resolution)` -> `Map [ int32 , WaveFunctionCollapseAdjacency ]` [classmethod] — Get adjacent indices of a given index and its adjacency
  - `get_adjacent_positions(position, resolution)` -> `Map [ IntVector , WaveFunctionCollapseAdjacency ]` [classmethod] — Get adjacent positions of a given position and its adjacency
  - `get_next_z_axis_clockwise_adjacency(adjacency)` -> `WaveFunctionCollapseAdjacency` [classmethod] — Get the next adjacency in clockwise direction on a Z-axis for a given adjacency. For example GetNextZAxisClockwiseAdjace...
  - `get_opposite_adjacency(adjacency)` -> `WaveFunctionCollapseAdjacency` [classmethod] — Get the opposite adjacency for a given adjacency. For example GetOppositeAdjacency(Front) will return Back.
  - `get_position_to_option_map_from_actor(actor, tile_size, position_to_option_map)` -> `Map[IntVector, WaveFunctionCollapseOption] or None` [classmethod] — Get PositionToOptionsMap from a given actor that has ISM components. This is useful when you want to derive neighboring ...
  - `index_as_position(index, resolution)` -> `IntVector` [classmethod] — Convert 2D array index to 3D grid position
  - `is_option_contained(option, options)` -> `bool` [classmethod] — Is the option contained in the given options array
  - `is_soft_obj_path_equal(soft_object_path_a, soft_object_path_b)` -> `bool` [classmethod] — Is Soft Obj Path Equal
  - `make_border_option()` -> `WaveFunctionCollapseOption` [classmethod] — Make FWaveFunctionCollapseOption of type: BorderOption
  - `make_empty_option()` -> `WaveFunctionCollapseOption` [classmethod] — Make FWaveFunctionCollapseOption of type: EmptyOption
  - `make_void_option()` -> `WaveFunctionCollapseOption` [classmethod] — Make FWaveFunctionCollapseOption of type: VoidOption
  - `position_as_index(position, resolution)` -> `int32` [classmethod] — Convert 3D grid position to 2D array index
  - `sanitize_rotator(rotator)` -> `Rotator` [classmethod] — Converts Rotator to Matrix and back to sanitize multiple representations of the same rotation to a common Rotator value

### `unreal.WaveFunctionCollapseModel`
Inherits: `DataAsset` | Header: `WaveFunctionCollapseModel.h`

A Model of WFC constraints. This data asset should contain all necessary data to allow for a WFC solve of an arbitrary grid size.

**Methods** (11):
  - `add_constraint(key_option, adjacency, adjacent_option)` -> `None` — Create a constraint
  - `build_initial_tile()` -> `WaveFunctionCollapseTile` — Builds the initial tile which adds every unique option in a model to its RemainingOptions array and calculates its entro...
  - `get_constraint_count()` -> `int32` — Get the total count of constraints in this model
  - `get_option_contribution(option)` -> `int32` — Get the contribution value of an option
  - `get_option_weight(option)` -> `float` — Get the weight value of an option
  - `get_options(key_option, adjacency)` -> `WaveFunctionCollapseOptions` — Get all options for a given key option in a given adjacency
  - `set_all_contributions(contribution)` -> `None` — Set the contribution values of key objects to a given value
  - `set_all_weights(weight)` -> `None` — Set the weights of key objects to a given value
  - `set_option_contribution(option, contribution)` -> `None` — Set the contribution value of a key object to a given value
  - `set_weights_from_contributions()` -> `None` — Set the weights of key objects based on their contribution values
  - `swap_meshes(source_to_target_mesh_map)` -> `None` — Swap meshes in the model with other meshes based on a map. This is useful when working with template meshes that need to...

**Properties** (3):
  - `constraints`: `None` — [Read-Write] (Map[WaveFunctionCollapseOption,WaveFunctionCollapseAdjacencyToOptionsMap])
  - `spawn_exclusion`: `None` — [Read-Write] (Array[SoftObjectPath])
  - `tile_size`: `float` — [Read-Write] Grid Tile Size in cm^3 (float)

### `unreal.WaveFunctionCollapseSubsystem`
Inherits: `EditorSubsystem` | Header: `WaveFunctionCollapseSubsystem.h`

Wave Function Collapse Subsystem

**Methods** (7):
  - `collapse(try_count = 1, random_seed = 0)` -> `Actor` — Solve a grid using a WFC model. If successful, spawn an actor.
  - `derive_grid_from_transform_bounds(transforms)` -> `None` — Derive grid from the bounds of an array of transforms Assumptions:
  - `derive_grid_from_transforms(transforms)` -> `None` — Derive grid from an array of transforms Assumptions:
  - `initialize_wfc()` — Initialize WFC process which sets up Tiles and RemainingTiles arrays Pre-populates Tiles with StarterOptions, BorderOpti...
  - `observation_propagation(random_seed)` -> `(tiles=Array[WaveFunctionCollapseTile], remaining_tiles=Array[int32], observation_queue=Map[int32, WaveFunctionCollapseQueueElement]) or None` — Recursive Observation and Propagation cycle
  - `observe(random_seed)` -> `(tiles=Array[WaveFunctionCollapseTile], remaining_tiles=Array[int32], observation_queue=Map[int32, WaveFunctionCollapseQueueElement]) or None` — Observation phase: This process randomly selects one tile from minimum entropy tiles then randomly selects a valid optio...
  - `propagate()` -> `(tiles=Array[WaveFunctionCollapseTile], remaining_tiles=Array[int32], observation_queue=Map[int32, WaveFunctionCollapseQueueElement], propagation_count=int32) or None` — Propagation phase: This process checks if the selection made during the observation is valid by checking constraint vali...

**Properties** (6):
  - `orientation`: `Rotator` — [Read-Write] (Rotator)
  - `origin_location`: `Vector` — [Read-Write] (Vector)
  - `resolution`: `IntVector` — [Read-Write] (IntVector)
  - `starter_options`: `None` — [Read-Write] (Map[IntVector,WaveFunctionCollapseOption])
  - `use_empty_border`: `bool` — [Read-Write] (bool)
  - `wfc_model`: `WaveFunctionCollapseModel` — [Read-Write] (WaveFunctionCollapseModel)

### `unreal.WaveFunctionCollapseAdjacency`
Inherits: `EnumBase` | Header: `WaveFunctionCollapseModel.h`

EWave Function Collapse Adjacency

**Properties** (6):
  - `BACK`: `WaveFunctionCollapseAdjacency = Ellipsis` — 1
  - `DOWN`: `WaveFunctionCollapseAdjacency = Ellipsis` — 5
  - `FRONT`: `WaveFunctionCollapseAdjacency = Ellipsis` — 0
  - `LEFT`: `WaveFunctionCollapseAdjacency = Ellipsis` — 3
  - `RIGHT`: `WaveFunctionCollapseAdjacency = Ellipsis` — 2
  - `UP`: `WaveFunctionCollapseAdjacency = Ellipsis` — 4
