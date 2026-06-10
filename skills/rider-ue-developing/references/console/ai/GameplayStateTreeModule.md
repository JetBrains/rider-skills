# UE Python API — GameplayStateTreeModule Module

**6 types** from the `GameplayStateTreeModule` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `StateTreeAIComponent`, `StateTreeAIComponentSchema`, `StateTreeComponent`, `StateTreeComponentSchema`, `StateTreeComponentSchemaScheduledTickPolicy`, `StateTreeRunStatusChanged`

---

## Classes

### `unreal.StateTreeAIComponent`
Inherits: `StateTreeComponent` | Header: `StateTreeAIComponent.h`

State tree component designed to be run on an AIController. It uses the StateTreeAIComponentSchema that guarantees access to the AIController.

### `unreal.StateTreeAIComponentSchema`
Inherits: `StateTreeComponentSchema` | Header: `StateTreeAIComponentSchema.h`

State tree schema to be used with StateTreeAIComponent. It guarantees access to an AIController and the Actor context value can be used to access the controlled pawn.

### `unreal.StateTreeComponent`
Inherits: `BrainComponent` | Header: `StateTreeComponent.h`

State Tree Component

**Methods** (5):
  - `get_state_tree_run_status()` -> `StateTreeRunStatus` — Returns the current run status of the StateTree.
  - `send_state_tree_event(event)` -> `None` — Sends event to the running StateTree.
  - `set_start_logic_automatically(start_logic_automatically)` -> `None` — Sets whether the State Tree is started automatically on being play. This function sets the bStartLogicAutomatically prop...
  - `set_state_tree(state_tree)` -> `None` — Stops currently running StateTree and sets new state tree reference.
  - `set_state_tree_reference(state_tree_reference)` -> `None` — Stops currently running StateTree and sets new state tree reference.

**Properties** (1):
  - `on_state_tree_run_status_changed`: `StateTreeRunStatusChanged` — [Read-Write] Called when the run status of the StateTree has changed (StateTreeRunStatusChanged)

### `unreal.StateTreeComponentSchema`
Inherits: `StateTreeSchema` | Header: `StateTreeComponentSchema.h`

StateTree for Actors with StateTree component.

### `unreal.StateTreeComponentSchemaScheduledTickPolicy`
Inherits: `EnumBase` | Header: `StateTreeComponentSchema.h`

EState Tree Component Schema Scheduled Tick Policy

**Properties** (3):
  - `ALLOWED`: `StateTreeComponentSchemaScheduledTickPolicy = Ellipsis` — 1
  - `DEFAULT`: `StateTreeComponentSchemaScheduledTickPolicy = Ellipsis` — 0
  - `DENIED`: `StateTreeComponentSchemaScheduledTickPolicy = Ellipsis` — 2

### `unreal.StateTreeRunStatusChanged`
Inherits: `MulticastDelegateBase` | Header: `StateTreeComponent.h`

State Tree Run Status Changed Delegate Signature
