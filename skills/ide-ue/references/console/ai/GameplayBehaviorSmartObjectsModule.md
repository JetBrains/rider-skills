# UE Python API — GameplayBehaviorSmartObjectsModule Module

**2 types** from the `GameplayBehaviorSmartObjectsModule` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AITask_UseGameplayBehaviorSmartObject`, `GameplayBehaviorsLibrary`

---

## Classes

### `unreal.AITask_UseGameplayBehaviorSmartObject`
Inherits: `AITask` | Header: `AITask_UseGameplayBehaviorSmartObject.h`

AITask Use Gameplay Behavior Smart Object

**Properties** (3):
  - `on_failed`: `GenericGameplayTaskDelegate` — [Read-Write] (GenericGameplayTaskDelegate)
  - `on_move_to_failed`: `GenericGameplayTaskDelegate` — [Read-Write] (GenericGameplayTaskDelegate)
  - `on_succeeded`: `GenericGameplayTaskDelegate` — [Read-Write] (GenericGameplayTaskDelegate)

### `unreal.GameplayBehaviorsLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `GameplayBehaviorSmartObjectsBlueprintFunctionLibrary.h`

Gameplay Behavior Smart Objects Blueprint Function Library

**Methods** (2):
  - `k2_use_smart_object(avatar: Actor, smart_object: Actor)` -> `bool` [classmethod] — deprecated: âk2_use_smart_objectâ was renamed to âuse_gameplay_behavior_smart_objectâ.
  - `use_gameplay_behavior_smart_object(avatar, smart_object)` -> `bool` [classmethod] — Use Gameplay Behavior Smart Object deprecated: Use MoveToAndUseSmartObjectWithGameplayBehavior or UseSmartObjectWithGame...
