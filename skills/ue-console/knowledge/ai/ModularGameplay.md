# UE Python API — ModularGameplay Module

**10 types** from the `ModularGameplay` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ActorInitStateChangedParams`, `ControllerComponent`, `GameFrameworkComponent`, `GameFrameworkComponentManager`, `GameFrameworkInitStateInterface`, `GameStateComponent`, `PawnComponent`, `PlayerStateComponent`, `GameFrameworkAddComponentFlags`, `ActorInitStateChangedBPDelegate`

---

## Classes

### `unreal.ActorInitStateChangedParams`
Inherits: `StructBase` | Header: `GameFrameworkComponentDelegates.h`

Parameters struct for Init State change functions

**Properties** (4):
  - `feature_name`: `Name` — [Read-Write] Name of the feature that changed (Name)
  - `feature_state`: `GameplayTag` — [Read-Write] The new state of the feature (GameplayTag)
  - `implementer`: `Object` — [Read-Write] The object (often a component) that implements the feature (Object)
  - `owning_actor`: `Actor` — [Read-Write] The actor owning the feature that changed (Actor)

### `unreal.ControllerComponent`
Inherits: `GameFrameworkComponent` | Header: `ControllerComponent.h`

ControllerComponent is an actor component made for AController and receives controller events.

### `unreal.GameFrameworkComponent`
Inherits: `ActorComponent` | Header: `GameFrameworkComponent.h`

GameFrameworkComponent is a base class for actor components made for the basic game framework classes.

### `unreal.GameFrameworkComponentManager`
Inherits: `GameInstanceSubsystem` | Header: `GameFrameworkComponentManager.h`

A manager to handle putting components on actors as they come and go. Put in a request to instantiate components of a given class on actors of a given class and they will automatically be made for the...

**Methods** (7):
  - `add_receiver(receiver, add_only_in_game_worlds = True)` -> `None` — Adds an actor as a receiver for components. If it passes the actorclass filter on requests it will get the components.
  - `register_and_call_for_actor_init_state(actor, feature_name, required_state, delegate, call_immediately = True)` -> `bool` — Registers blueprint delegate for feature state change notifications on a specific actor and may call it immediately
  - `register_and_call_for_class_init_state(actor_class, feature_name, required_state, delegate, call_immediately = True)` -> `bool` — Registers blueprint delegate for feature state change notifications on a class of actors and may call it immediately
  - `remove_receiver(receiver)` -> `None` — Removes an actor as a receiver for components.
  - `send_extension_event(receiver, event_name, only_in_game_worlds = True)` -> `None` — Sends an arbitrary extension event that can be listened for by other systems
  - `unregister_actor_init_state_delegate(actor, delegate_to_remove)` -> `bool` — Removes a registered delegate bound to a specific actor
  - `unregister_class_init_state_delegate(actor_class, delegate_to_remove)` -> `bool` — Removes a registered delegate bound to a class

### `unreal.GameFrameworkInitStateInterface`
Inherits: `Interface` | Header: `GameFrameworkInitStateInterface.h`

Game Framework Init State Interface

**Methods** (5):
  - `get_feature_name()` -> `Name` — Returns the feature this object implements, this interface is only meant for simple objects with a single feature like A...
  - `get_init_state()` -> `GameplayTag` — Returns the current feature state of this object, the default behavior is to query the manager
  - `has_reached_init_state(desired_state)` -> `bool` — Checks the component manager to see if we have already reached the desired state or a later one
  - `register_and_call_for_init_state_change(required_state, delegate, call_immediately = True)` -> `bool` — Binds a BP delegate to get called on a state change for this feature
  - `unregister_init_state_delegate(delegate)` -> `bool` — Unbinds a BP delegate from changes to this feature

### `unreal.GameStateComponent`
Inherits: `GameFrameworkComponent` | Header: `GameStateComponent.h`

GameStateComponent is an actor component made for AGameStateBase and receives GameState events.

### `unreal.PawnComponent`
Inherits: `GameFrameworkComponent` | Header: `PawnComponent.h`

PawnComponent is an actor component made for APawn and receives pawn events.

### `unreal.PlayerStateComponent`
Inherits: `GameFrameworkComponent` | Header: `PlayerStateComponent.h`

PlayerStateComponent is an actor component made for APlayerState and receives PlayerState events.

### `unreal.GameFrameworkAddComponentFlags`
Inherits: `EnumBase` | Header: `GameFrameworkComponentManager.h`

Bitflag enum to control how this AddComponents action should actually run

**Properties** (3):
  - `ADD_IF_NOT_CHILD`: `GameFrameworkAddComponentFlags = Ellipsis` — If AddIfNotChild is set, it will be added only if ComponentClass is not a child of an existing compo...
  - `ADD_UNIQUE`: `GameFrameworkAddComponentFlags = Ellipsis` — If AddUnique is set, it will be added only if there is no existing component on ActorInstance of Com...
  - `USE_AUTO_GENERATED_NAME`: `GameFrameworkAddComponentFlags = Ellipsis` — If UseAutoGeneratedName is set, it will generate a new name and not re-use the class name directly (...

### `unreal.ActorInitStateChangedBPDelegate`
Inherits: `DelegateBase` | Header: `GameFrameworkComponentDelegates.h`

Blueprint delegate called when an actor feature changes init state
