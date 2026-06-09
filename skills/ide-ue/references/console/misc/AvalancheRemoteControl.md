# UE Python API — AvalancheRemoteControl Module

**3 types** from the `AvalancheRemoteControl` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaRCControllerId`, `AvaRCLibrary`, `AvaRemoteControlInterface`

---

## Classes

### `unreal.AvaRCControllerId`
Inherits: `StructBase` | Header: `AvaRCControllerId.h`

Struct describing data to identify/find a Controller in a given preset

**Properties** (1):
  - `name`: `Name` — [Read-Write] (Name)

### `unreal.AvaRCLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AvaRCLibrary.h`

Ava RCLibrary

**Methods** (1):
  - `get_controlled_actors(world_context_object, controller)` -> `Array [ Actor ]` [classmethod] — Get Controlled Actors

### `unreal.AvaRemoteControlInterface`
Inherits: `Interface` | Header: `IAvaRemoteControlInterface.h`

Ava Remote Control Interface

**Methods** (1):
  - `on_values_applied()` -> `None` — Called when the remote control values are applied.
