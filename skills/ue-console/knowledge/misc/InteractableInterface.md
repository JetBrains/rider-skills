# UE Python API — InteractableInterface Module

**13 types** from the `InteractableInterface` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `InteractionContext`, `InteractionContextData`, `InteractionQueryResults`, `InteractionTargetConfiguration`, `AbilityTask_GrantNearbyInteractionData`, `GameplayAbility_Interact`, `InteractableInterfaceLibrary`, `InteractionAbilityInterface`, `InteractionInstigatorComponent`, `InteractionTarget`, `InteractionTargetComponent`, `AvailableInteractionTargetsChanged`, `BeginInteractionCallback`

---

## Classes

### `unreal.InteractionContext`
Inherits: `StructBase` | Header: `InteractionTypes.h`

The context of a given interaction query. This holds some state about what is currently querying for intractable objects and will allow you to specify some specific game state around each interaction....

**Properties** (2):
  - `context_data`: `InstancedStruct` — [Read-Write] Data about this specific interaction query (InstancedStruct)
  - `target`: `InteractionTarget` — [Read-Write] The interactable target that should be used (InteractionTarget)

### `unreal.InteractionContextData`
Inherits: `StructBase` | Header: `InteractionTypes.h`

Data about a specific interaction that is happening.

**Properties** (2):
  - `instigator`: `InteractableInstigator` — [Read-Write] The interaction instigator who is doing the querying! (InteractableInstigator)
  - `interaction_tags`: `GameplayTagContainer` — [Read-Write] Some tags that are unique to this interaction and can be used to provide some context (...

### `unreal.InteractionQueryResults`
Inherits: `StructBase` | Header: `InteractionTypes.h`

A struct that will be populated with all the available interaction options for a given target.

**Properties** (1):
  - `available_interactions`: `None` — [Read-Write] Array of available interactions that can be started.
Add to this array for any interact...

### `unreal.InteractionTargetConfiguration`
Inherits: `StructBase` | Header: `InteractionTypes.h`

Contains data about a single interactable target. This is information that you may want to use to build some UI or decide on what the state of certain interactable objects is.

**Properties** (1):
  - `display_name`: `Text` — [Read-Write] The display name that can be used for this interaction (Text)

### `unreal.AbilityTask_GrantNearbyInteractionData`
Inherits: `AbilityTask` | Header: `InteractionTask_WaitForTargets.h`

Gameplay Ability Task that will query all available interaction targets at a given interval around itâs owning ability actor.

**Properties** (1):
  - `on_available_interaction_targets_changed`: `AvailableInteractionTargetsChanged` — [Read-Write] Delegate fired when the available interaction targets near the owner of this ability ta...

### `unreal.GameplayAbility_Interact`
Inherits: `GameplayAbility` | Header: `InteractionTask_WaitForTargets.h`

Gameplay ability for interacting with a target(s).

**Methods** (4):
  - `on_available_interactions_updated()` -> `None` — Called when this abilityâs available interaction targets have been updated. This is a good place to update some UI or ...
  - `on_trigger_interaction()` -> `None` — Triggers the interaction with one or more of the currently available targets. Override this in blueprints or native C++ ...
  - `trigger_interaction()` -> `None` — Attempts to begin the interaction with the current targets.
  - `update_interactions(available_targets)` -> `None` — Update the available interactions that this ability can trigger. This is normally populated via an async task running in...

**Properties** (1):
  - `current_available_targets`: `None` [Read-Only] — [Read-Only] Array of available interaction targets to interact with. This is populated by âUpdateI...

### `unreal.InteractableInterfaceLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `InteractableInterfaceLibrary.h`

BP function helpers to utilize the Interactable Interface.

**Methods** (4):
  - `append_target_configuration(target, context, out_results)` -> `InteractionQueryResults` [classmethod] — Determines what the configuration of this target is. Gather information about this specific target so that it can be dis...
  - `begin_interaction_on_target(target, context)` -> `None` [classmethod] — Called when this target is interacted with. Implement any state changes or gameplay affects you want this interaction to...
  - `get_interactable_targets_from_actor(actor)` -> `Array [ InteractionTarget ]` [classmethod] — Populates the given OutInteractionTargets array with all IInteractionTarget interface objects on the given actor.
  - `reset_query_results(to_reset)` -> `InteractionQueryResults` [classmethod] — Resets the values of the given interaction query results to be empty.

### `unreal.InteractionAbilityInterface`
Inherits: `Interface` | Header: `InteractionTask_WaitForTargets.h`

Interaction Ability Interface

**Methods** (2):
  - `on_available_interactions_updated()` -> `None` — Called when this abilityâs available interaction targets have been updated. This is a good place to update some UI or ...
  - `on_trigger_interaction()` -> `None` — Triggers the interaction with one or more of the currently available targets. Override this in blueprints or native C++ ...

### `unreal.InteractionInstigatorComponent`
Inherits: `ActorComponent` | Header: `InteractionInstigatorComponent.h`

Interaction Instigator Component

**Methods** (1):
  - `attempt_to_begin_interactions(targets_to_interact_with)` -> `None` — Attempts to begin interacting with the given array of targets

**Properties** (1):
  - `interaction_context_data`: `InstancedStruct` — [Read-Write] Data about this specific interaction (InstancedStruct)

### `unreal.InteractionTarget`
Inherits: `Interface` | Header: `InteractableTargetInterface.h`

Interaction Target

### `unreal.InteractionTargetComponent`
Inherits: `BoxComponent` | Header: `InteractionTargetComponent.h`

A target that can be interacted with by an interaction instigator.

**Methods** (2):
  - `bp_append_target_configuration(context)` -> `InteractionQueryResults` — Determines what the configuration of this target is. Gather information about this specific target so that it can be dis...
  - `bp_begin_interaction(context)` -> `None` — Called when this target is interacted with. Implement any state changes or gameplay affects you want this interaction to...

**Properties** (2):
  - `on_begin_interaction_callback`: `BeginInteractionCallback` — [Read-Write] A callback for when this target begins interaction. (BeginInteractionCallback)
  - `target_configs`: `None` — [Read-Write] The configuration for this target component. Stores metadata about this interaction can...

### `unreal.AvailableInteractionTargetsChanged`
Inherits: `MulticastDelegateBase` | Header: `InteractionTask_WaitForTargets.h`

Delegate fired for when the nearby available interactable targets have changed.

### `unreal.BeginInteractionCallback`
Inherits: `MulticastDelegateBase` | Header: `InteractionTargetComponent.h`

Begin Interaction Callback Delegate Signature
