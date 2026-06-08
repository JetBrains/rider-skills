# UE Python API — USDTests Module

**1 types** from the `USDTests` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `USDTestingLibrary`

---

## Classes

### `unreal.USDTestingLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `USDTestsBlueprintLibrary.h`

Library of functions that can be used via Python scripting to help testing the other USD functionality

**Methods** (6):
  - `clear_transaction_history()` -> `None` [classmethod] — Clear Transaction History
  - `dirty_stage_actor_blueprint(blueprint_derived_stage_actor)` -> `None` [classmethod] — Dirty Stage Actor Blueprint
  - `get_subtree_material_slot_count(stage_actor, prim_path)` -> `int64` [classmethod] — Get Subtree Material Slot Count
  - `get_subtree_vertex_count(stage_actor, prim_path)` -> `int64` [classmethod] — Get Subtree Vertex Count
  - `recompile_blueprint_stage_actor(blueprint_derived_stage_actor)` -> `bool` [classmethod] — Recompile Blueprint Stage Actor
  - `set_usd_stage_cpp(stage_actor, new_stage_root_layer)` -> `None` [classmethod] — Set Usd Stage Cpp
