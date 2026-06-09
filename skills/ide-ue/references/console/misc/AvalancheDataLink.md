# UE Python API — AvalancheDataLink Module

**3 types** from the `AvalancheDataLink` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaDataLinkControllerMapping`, `AvaDataLinkActor`, `AvaDataLinkInstance`

---

## Classes

### `unreal.AvaDataLinkControllerMapping`
Inherits: `StructBase` | Header: `AvaDataLinkInstance.h`

Ava Data Link Controller Mapping

**Properties** (2):
  - `output_field_name`: `str` — [Read-Write] (str)
  - `target_controller`: `AvaRCControllerId` — [Read-Write] (AvaRCControllerId)

### `unreal.AvaDataLinkActor`
Inherits: `Actor` | Header: `AvaDataLinkActor.h`

Ava Data Link Actor

**Methods** (1):
  - `execute_data_link_instances()` -> `None` — Execute Data Link Instances

### `unreal.AvaDataLinkInstance`
Inherits: `Object` | Header: `AvaDataLinkInstance.h`

Ava Data Link Instance

**Properties** (2):
  - `controller_mappings`: `None` — [Read-Write] (Array[AvaDataLinkControllerMapping])
  - `data_link_instance`: `DataLinkInstance` — [Read-Write] (DataLinkInstance)
