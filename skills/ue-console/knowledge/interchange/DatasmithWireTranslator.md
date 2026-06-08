# UE Python API — DatasmithWireTranslator Module

**2 types** from the `DatasmithWireTranslator` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `WireSettings`, `DatasmithWireOptions`

---

## Classes

### `unreal.WireSettings`
Inherits: `DatasmithTessellationOptions` | Header: `IWireInterface.h`

Wire Settings

**Properties** (2):
  - `merge_geometry_by_group`: `bool` — [Read-Write] If set to true, all geometry nodes under a group are merged. Default is true. (bool)
  - `use_layer_as_actor`: `bool` — [Read-Write] If set to true, the first levelâs actors in the outliner are the layers. Default is t...

### `unreal.DatasmithWireOptions`
Inherits: `DatasmithOptionsBase` | Header: `DatasmithWireTranslator.h`

Datasmith Wire Options

**Properties** (1):
  - `settings`: `WireSettings` — [Read-Write] (WireSettings)
