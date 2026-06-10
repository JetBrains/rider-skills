# UE Python API — ActorLayerUtilities Module

**2 types** from the `ActorLayerUtilities` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ActorLayer`, `LayersBlueprintLibrary`

---

## Classes

### `unreal.ActorLayer`
Inherits: `StructBase` | Header: `ActorLayerUtilities.h`

Actor Layer

**Properties** (1):
  - `name`: `Name` — [Read-Write] The name of this layer (Name)

### `unreal.LayersBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ActorLayerUtilities.h`

Function library containing methods for interacting with editor layers

**Methods** (3):
  - `add_actor_to_layer(actor, layer)` -> `None` [classmethod] — Adds the actor to the specified layer
  - `get_actors(world_context_object, actor_layer)` -> `Array [ Actor ]` [classmethod] — Get all the actors in this layer
  - `remove_actor_from_layer(actor, layer)` -> `None` [classmethod] — Removes the actor from the specified layer
