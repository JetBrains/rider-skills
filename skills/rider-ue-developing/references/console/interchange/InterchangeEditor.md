# UE Python API — InterchangeEditor Module

**1 types** from the `InterchangeEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `InterchangeEditorScriptLibrary`

---

## Classes

### `unreal.InterchangeEditorScriptLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `InterchangeEditorScriptLibrary.h`

Interchange Editor Script Library

**Methods** (8):
  - `can_reset_actor(actor)` -> `bool` [classmethod] — Checks if an actor can be reset.
  - `can_reset_world(world)` -> `bool` [classmethod] — Checks if an world can be reset.
  - `level_instance_commit(level_instance, discard_changes)` -> `bool` [classmethod] — Apply/Discard the changes to Level Instance Actor.
  - `level_instance_enter_edit_mode(level_instance)` -> `bool` [classmethod] — Make Level Instance Actor editable.
  - `level_instance_get_editable_actors(level_instance)` -> `Array [ Actor ]` [classmethod] — Returns array of actors that are editable in the editor when the level instance is put in edit mode. NOTE: This will ret...
  - `reset_actors(actors)` -> `None` [classmethod] — Performs Interchange Reset on Actors. Resets all qualifying actors. Does nothing to actors that cannot be reset.
  - `reset_level_asset(world)` -> `None` [classmethod] — Performs Interchange Reset on a Level Asset.
  - `reset_scene_import_asset(scene_import_asset)` -> `None` [classmethod] — Performs Interchange Reset on an Interchange Scene Import Asset. Resets all the actors added to the level and assets imp...
