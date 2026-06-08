# UE Python API — RemoteControlWebInterface Module

**1 types** from the `RemoteControlWebInterface` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RCWebInterfaceBlueprintLibrary`

---

## Classes

### `unreal.RCWebInterfaceBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `RCWebInterfaceLibrary.h`

RCWeb Interface Blueprint Library

**Methods** (6):
  - `find_all_actors_of_class(class_)` -> `Map [ Actor , str ]` [classmethod] — Shortcut function to find all actors of a class
  - `find_matching_actors_to_rebind(preset_id, property_ids)` -> `Map [ str , Actor ]` [classmethod] — Get a list of compatible actors to rebind the remote control preset properties returned value is a map, key is the actor...
  - `get_owner_actor_label(preset_id, property_ids)` -> `str` [classmethod] — Get the label of the owner actor of the remote control preset properties If the properties has different owners, an empt...
  - `get_values_of_actors_by_class(class_)` -> `Map [ Actor , str ]` [classmethod] — Gets all properties values (as a json) of all actors of type Class
  - `rebind_properties(preset_id, property_ids, new_owner)` -> `None` [classmethod] — Rebind the remote control preset properties to a new owner
  - `spawn_actor(class_)` -> `Actor` [classmethod] — Shortcut function to spawn an actor of a class
