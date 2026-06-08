# UE Python API — GameplayInteractionsModule Module

**9 types** from the `GameplayInteractionsModule` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GameplayInteractionAbortContext`, `GameplayInteractionSlotUserData`, `AITask_UseGameplayInteraction`, `GameplayInteractionSmartObjectBehaviorDefinition`, `GameplayInteractionStateTreeSchema`, `GameplayInteractionAbortReason`, `GameplayTaskActuationResult`, `PlayContextualAnimExecutionMethod`, `GameplayTaskActuationCompleted`

---

## Classes

### `unreal.GameplayInteractionAbortContext`
Inherits: `StructBase` | Header: `GameplayInteractionsTypes.h`

Struct holding data related to the abort action

### `unreal.GameplayInteractionSlotUserData`
Inherits: `SmartObjectSlotStateData` | Header: `GameplayInteractionsTypes.h`

Data added to a Smart Object slot when interaction is started on it. Allows to look up the user.

### `unreal.AITask_UseGameplayInteraction`
Inherits: `AITask` | Header: `AITask_UseGameplayInteraction.h`

AITask Use Gameplay Interaction

**Methods** (1):
  - `request_abort()` -> `None` — Request Abort

**Properties** (4):
  - `on_failed`: `GenericGameplayTaskDelegate` — [Read-Write] (GenericGameplayTaskDelegate)
  - `on_finished`: `GenericGameplayTaskDelegate` — [Read-Write] (GenericGameplayTaskDelegate)
  - `on_move_to_failed`: `GenericGameplayTaskDelegate` — [Read-Write] (GenericGameplayTaskDelegate)
  - `on_succeeded`: `GenericGameplayTaskDelegate` — [Read-Write] (GenericGameplayTaskDelegate)

### `unreal.GameplayInteractionSmartObjectBehaviorDefinition`
Inherits: `SmartObjectBehaviorDefinition` | Header: `GameplayInteractionSmartObjectBehaviorDefinition.h`

SmartObject behavior definition for the GameplayInteractions

**Methods** (2):
  - `get_state_tree()` -> `StateTree` — Get State Tree
  - `set_state_tree(new_state_tree)` -> `None` — Set State Tree

**Properties** (1):
  - `state_tree_reference`: `StateTreeReference` — [Read-Write] (StateTreeReference)

### `unreal.GameplayInteractionStateTreeSchema`
Inherits: `StateTreeSchema` | Header: `GameplayInteractionStateTreeSchema.h`

Gameplay Interaction State Tree Schema

### `unreal.GameplayInteractionAbortReason`
Inherits: `EnumBase` | Header: `GameplayInteractionsTypes.h`

Reason why the interaction is ended prematurely.

**Properties** (3):
  - `EXTERNAL_ABORT`: `GameplayInteractionAbortReason = Ellipsis` — 1
  - `INTERNAL_ABORT`: `GameplayInteractionAbortReason = Ellipsis` — 2
  - `UNSET`: `GameplayInteractionAbortReason = Ellipsis` — 0

### `unreal.GameplayTaskActuationResult`
Inherits: `EnumBase` | Header: `GameplayInteractionsTypes.h`

EGameplay Task Actuation Result

**Properties** (4):
  - `FAILED`: `GameplayTaskActuationResult = Ellipsis` — 2
  - `NONE`: `GameplayTaskActuationResult = Ellipsis` — 0
  - `REQUEST_FAILED`: `GameplayTaskActuationResult = Ellipsis` — 1
  - `SUCCEEDED`: `GameplayTaskActuationResult = Ellipsis` — 3

### `unreal.PlayContextualAnimExecutionMethod`
Inherits: `EnumBase` | Header: `StateTreeTask_PlayContextualAnim.h`

EPlay Contextual Anim Execution Method

**Properties** (4):
  - `JOIN_INTERACTION`: `PlayContextualAnimExecutionMethod = Ellipsis` — Join an existing interaction 1
  - `START_INTERACTION`: `PlayContextualAnimExecutionMethod = Ellipsis` — Start a new interaction 0
  - `TRANSITION_ALL_ACTORS`: `PlayContextualAnimExecutionMethod = Ellipsis` — Transition a single actor in an interaction to a different section 2
  - `TRANSITION_SINGLE_ACTOR`: `PlayContextualAnimExecutionMethod = Ellipsis` — Transition all the actors in an interaction to a different sections 3

### `unreal.GameplayTaskActuationCompleted`
Inherits: `MulticastDelegateBase` | Header: `GameplayInteractionsTypes.h`

Gameplay Task Actuation Completed Delegate Signature
