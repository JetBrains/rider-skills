# UE Python API — MassEQS Module

**3 types** from the `MassEQS` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MassEnvQueryEntityInfoBlueprintWrapper`, `MassEQSBlueprintLibrary`, `MassEntityTagsTestMode`

---

## Classes

### `unreal.MassEnvQueryEntityInfoBlueprintWrapper`
Inherits: `StructBase` | Header: `MassEQSBlueprintLibrary.h`

Wrapper for Blueprints to be able to parse MassEntityInfo to use functions defined in UMassEQSBlueprintLibrary

### `unreal.MassEQSBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MassEQSBlueprintLibrary.h`

Function library for interfacing with EntityInfo inside blueprints.

**Methods** (7):
  - `contains_entity(entity_list, entity_info)` -> `bool` [classmethod] — Custom array-contains function, as the Blueprint version did not seem to work.
  - `entity_comparison(a, b)` -> `bool` [classmethod] — Custom comparison function, as the Blueprint Equals did not seem to work.
  - `entity_to_string(entity_info)` -> `str` [classmethod] — Utils
  - `get_cached_entity_position(entity_info)` -> `Vector` [classmethod] — Get Cached Entity Position
  - `get_current_entity_position(owner, entity_info)` -> `Vector` [classmethod] — Get Current Entity Position
  - `get_enviroment_query_result_as_entity_info(query_instance)` -> `Array [ MassEnvQueryEntityInfoBlueprintWrapper ]` [classmethod] — Outputs an array filled with resulting EntityInfos. Note that it makes sense only if ItemType is a EnvQueryItemType_Mass...
  - `send_signal_to_entity(owner, entity_info, signal)` -> `None` [classmethod] — Sends the input Signal to the Entity defined by EntityInfo.EntityHandle using the UMassSignalSubsystem.

### `unreal.MassEntityTagsTestMode`
Inherits: `EnumBase` | Header: `MassEnvQueryTest_MassEntityTags.h`

Different modes that this Test can be run in

**Properties** (3):
  - `ALL`: `MassEntityTagsTestMode = Ellipsis` — Filter will require All of the tags to be present on the Entity. 1
  - `ANY`: `MassEntityTagsTestMode = Ellipsis` — Filter will require just one of the tags to be present on the Entity. 0
  - `NONE`: `MassEntityTagsTestMode = Ellipsis` — Filter will require that none of the tags are present on the Entity. 2
