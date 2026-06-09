# UE Python API — GameplayBehaviorsModule Module

**9 types** from the `GameplayBehaviorsModule` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ValueOrBBKey_GameplayTagContainer`, `GameplayBehavior`, `GameplayBehavior_AnimationBased`, `GameplayBehavior_BehaviorTree`, `GameplayBehaviorConfig`, `GameplayBehaviorConfig_Animation`, `GameplayBehaviorConfig_BehaviorTree`, `GameplayBehaviorLibrary`, `ValueOrBBKey_GameplayTagBlueprintUtility`

---

## Classes

### `unreal.ValueOrBBKey_GameplayTagContainer`
Inherits: `ValueOrBlackboardKeyBase` | Header: `ValueOrBBKey_GameplayTag.h`

Value or BBKey Gameplay Tag Container

### `unreal.GameplayBehavior`
Inherits: `Object` | Header: `GameplayBehavior.h`

Gameplay Behavior

**Methods** (10):
  - `k2_abort_behavior(avatar)` -> `None` — K2 Abort Behavior
  - `k2_end_behavior(avatar)` -> `None` — K2 End Behavior
  - `k2_get_next_actor_index_in_sequence(current_index = 0)` -> `int32`
  - `k2_on_finished(avatar, was_interrupted)` -> `None` — K2 on Finished
  - `k2_on_finished_character(avatar, was_interrupted)` -> `None` — K2 on Finished Character
  - `k2_on_finished_pawn(avatar, was_interrupted)` -> `None` — K2 on Finished Pawn
  - `k2_on_triggered(avatar, config, smart_object_owner)` -> `None` — NOTE: on trigger functions - weâll trigger the most specific one that given behavior implements
  - `k2_on_triggered_character(avatar, config, smart_object_owner)` -> `None` — K2 on Triggered Character
  - `k2_on_triggered_pawn(avatar, config, smart_object_owner)` -> `None` — K2 on Triggered Pawn
  - `k2_trigger_behavior(avatar, config = None, smart_object_owner = None)` -> `None` — K2 Trigger Behavior

**Properties** (1):
  - `relevant_actors`: `None` — [Read-Write] Itâs up to the behavior implementation to decide how to use these actors.
Can be used...

### `unreal.GameplayBehavior_AnimationBased`
Inherits: `GameplayBehavior` | Header: `GameplayBehavior_AnimationBased.h`

Note that this behavior is supporting playing only a single montage for a given Avatar at a time. Trying to play multiple or using multiple UGameplayBehavior_AnimationBased instances will result in re...

### `unreal.GameplayBehavior_BehaviorTree`
Inherits: `GameplayBehavior` | Header: `GameplayBehavior_BehaviorTree.h`

NOTE: this behavior works only for AIControlled pawns

### `unreal.GameplayBehaviorConfig`
Inherits: `Object` | Header: `GameplayBehaviorConfig.h`

Gameplay Behavior Config

### `unreal.GameplayBehaviorConfig_Animation`
Inherits: `GameplayBehaviorConfig` | Header: `GameplayBehaviorConfig_Animation.h`

Gameplay Behavior Config Animation

### `unreal.GameplayBehaviorConfig_BehaviorTree`
Inherits: `GameplayBehaviorConfig` | Header: `GameplayBehaviorConfig_BehaviorTree.h`

Gameplay Behavior Config Behavior Tree

### `unreal.GameplayBehaviorLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `GameplayBehaviorsBlueprintFunctionLibrary.h`

Gameplay Behaviors Blueprint Function Library

**Methods** (5):
  - `add_gameplay_tag_filter_to_blackboard_key_selector(owner, property_name)` -> `BlackboardKeySelector` [classmethod] — Add Gameplay Tag Filter to Blackboard Key Selector
  - `get_blackboard_value_as_gameplay_tag(node_owner, key)` -> `GameplayTagContainer` [classmethod] — Get Blackboard Value as Gameplay Tag
  - `get_blackboard_value_as_gameplay_tag_from_blackboard_comp(blackboard_comp, key_name)` -> `GameplayTagContainer` [classmethod] — Get Blackboard Value as Gameplay Tag from Blackboard Comp
  - `set_blackboard_value_as_gameplay_tag(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as Gameplay Tag
  - `set_value_as_gameplay_tag_for_blackboard_comp(blackboard_comp, key_name, gameplay_tag_value)` -> `None` [classmethod] — Set Value as Gameplay Tag for Blackboard Comp

### `unreal.ValueOrBBKey_GameplayTagBlueprintUtility`
Inherits: `BlueprintFunctionLibrary` | Header: `ValueOrBBKey_GameplayTag.h`

Value or BBKey Gameplay Tag Blueprint Utility

**Methods** (1):
  - `get_tag_container(value, behavior_tree_comp)` -> `GameplayTagContainer` [classmethod] — Get Tag Container
