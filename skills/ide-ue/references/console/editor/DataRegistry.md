# UE Python API — DataRegistry Module

**10 types** from the `DataRegistry` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataRegistryCachePolicy`, `DataRegistryId`, `DataRegistryLookup`, `DataRegistryOrTableRow`, `DataRegistryType`, `SoftDataRegistryOrTable`, `DataRegistrySubsystem`, `DataRegistryAcquireStatus`, `DataRegistrySubsystemGetItemResult`, `DataRegistryItemAcquiredBPCallback`

---

## Classes

### `unreal.DataRegistryCachePolicy`
Inherits: `StructBase` | Header: `DataRegistryTypes.h`

Rules to use when deciding how to unload registry items and related assets

**Properties** (6):
  - `cache_is_always_volatile`: `bool` — [Read-Write] If this is true, the cache is always considered volatile when returning EDataRegistryCa...
  - `force_keep_seconds`: `float` — [Read-Write] Any item accessed within this amount of seconds is never unloaded (float)
  - `force_release_seconds`: `float` — [Read-Write] Any item not accessed within this amount of seconds is always unloaded (float)
  - `max_number_kept`: `int` — [Read-Write] Maximum number of items to keep loaded, 0 means infinite (int32)
  - `min_number_kept`: `int` — [Read-Write] Will not release items if fewer then this number loaded, 0 means infinite (int32)
  - `use_curve_table_cache_version`: `bool` — [Read-Write] If this is true, the cache version is synchronized with the global CurveTable cache ver...

### `unreal.DataRegistryId`
Inherits: `StructBase` | Header: `DataRegistryId.h`

Identifier for a specific DataRegistryItem, provides the user with a Tag or dropdown-based UI for selecting based on the available index info

**Methods** (5):
  - `__bool__()` -> `bool` — Returns true if this is a non-empty item identifier, does not check if it is currently registered
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `is_valid()` -> `bool` — Returns true if this is a non-empty item identifier, does not check if it is currently registered
  - `to_string()` -> `str` — Converts a Data Registry Id to a string. The other direction is not provided because it cannot be validated

**Properties** (2):
  - `item_name`: `Name` — [Read-Write] The name of this object, may be a leaf gameplay tag or a raw name depending on the type...
  - `registry_type`: `DataRegistryType` — [Read-Write] The type of this item, used to look up the correct registry (DataRegistryType)

### `unreal.DataRegistryLookup`
Inherits: `StructBase` | Header: `DataRegistryTypes.h`

A resolved unique id for a specific source, explains how to look it up. This type is opaque in blueprints and cannot be saved across runs

### `unreal.DataRegistryOrTableRow`
Inherits: `StructBase` | Header: `SoftDataRegistryOrTable.h`

Defines a DataRegistryId or DataTableRowHandle with a common interface to both

**Properties** (2):
  - `data_registry_id`: `DataRegistryId` — [Read-Write] (DataRegistryId)
  - `data_table_row`: `DataTableRowHandle` — [Read-Write] (DataTableRowHandle)

### `unreal.DataRegistryType`
Inherits: `StructBase` | Header: `DataRegistryId.h`

Wrapper struct to represent a global data registry, represented as an FName internally and implicitly convertible back and forth. This exists so the blueprint API can understand itâs not a normal FN...

**Methods** (5):
  - `__bool__()` -> `bool` — Returns true if this is a non-empty type, does not check if it is currently registered
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `is_valid()` -> `bool` — Returns true if this is a non-empty type, does not check if it is currently registered
  - `to_string()` -> `str` — Converts a Data Registry Type to a string. The other direction is not provided because it cannot be validated

**Properties** (1):
  - `name`: `Name` — [Read-Write] The FName representing this type (Name)

### `unreal.SoftDataRegistryOrTable`
Inherits: `StructBase` | Header: `SoftDataRegistryOrTable.h`

Defines a DataRegistry or a DataTable with a common interface to both

### `unreal.DataRegistrySubsystem`
Inherits: `EngineSubsystem` | Header: `DataRegistrySubsystem.h`

Singleton manager that provides synchronous and asynchronous access to data registries

**Methods** (11):
  - `acquire_item_bp(item_id, acquire_callback)` -> `bool` [classmethod] — Starts an asynchronous acquire of a data registry item that may not yet be cached, and then accessed with Get Data Regis...
  - `conv_data_registry_id_to_string(data_registry_id)` -> `str` [classmethod] — Converts a Data Registry Id to a string. The other direction is not provided because it cannot be validated
  - `conv_data_registry_type_to_string(data_registry_type)` -> `str` [classmethod] — Converts a Data Registry Type to a string. The other direction is not provided because it cannot be validated
  - `equal_equal_data_registry_id(a, b)` -> `bool` [classmethod] — Returns true if the values are equal (A == B)
  - `equal_equal_data_registry_type(a, b)` -> `bool` [classmethod] — Returns true if the values are equal (A == B)
  - `evaluate_data_registry_curve(item_id, input_value, out_value=float)` [classmethod] — Attempts to evaluate a curve stored in a DataRegistry cache using a specific input value
  - `get_possible_data_registry_id_list(registry_type)` -> `Array [ DataRegistryId ]` [classmethod] — Returns the list of known identifiers for an active data registry so they can be iterated with Find or Acquire. Dependin...
  - `is_valid_data_registry_id(data_registry_id)` -> `bool` [classmethod] — Returns true if this is a non-empty item identifier, does not check if it is currently registered
  - `is_valid_data_registry_type(data_registry_type)` -> `bool` [classmethod] — Returns true if this is a non-empty type, does not check if it is currently registered
  - `not_equal_data_registry_id(a, b)` -> `bool` [classmethod] — Returns true if the values are not equal (A != B)
  - `not_equal_data_registry_type(a, b)` -> `bool` [classmethod] — Returns true if the values are not equal (A != B)

### `unreal.DataRegistryAcquireStatus`
Inherits: `EnumBase` | Header: `DataRegistryTypes.h`

State of a registry async request

**Properties** (7):
  - `ACQUIRE_ERROR`: `DataRegistryAcquireStatus = Ellipsis` — Failed to acquire, may have timed out or had network issues, can be retried later 5
  - `ACQUIRE_FINISHED`: `DataRegistryAcquireStatus = Ellipsis` — Fully loaded 4
  - `DOES_NOT_EXIST`: `DataRegistryAcquireStatus = Ellipsis` — Known to not exist, cannot be retried 6
  - `INITIAL_ACQUIRE_FINISHED`: `DataRegistryAcquireStatus = Ellipsis` — Temporary state, finished acquiring data but need to check resources 2
  - `NOT_STARTED`: `DataRegistryAcquireStatus = Ellipsis` — Not started yet 0
  - `WAITING_FOR_INITIAL_ACQUIRE`: `DataRegistryAcquireStatus = Ellipsis` — Initial acquire still in progress 1
  - `WAITING_FOR_RESOURCES`: `DataRegistryAcquireStatus = Ellipsis` — Data requested and returned, still loading dependent resources 3

### `unreal.DataRegistrySubsystemGetItemResult`
Inherits: `EnumBase` | Header: `DataRegistrySubsystem.h`

Enum used to indicate success or failure of finding a data registry item

**Properties** (2):
  - `FOUND`: `DataRegistrySubsystemGetItemResult = Ellipsis` — Found the row successfully. 0
  - `NOT_FOUND`: `DataRegistrySubsystemGetItemResult = Ellipsis` — Failed to find the row. 1

### `unreal.DataRegistryItemAcquiredBPCallback`
Inherits: `DelegateBase` | Header: `DataRegistryTypes.h`

Blueprint delegate called when item is loaded, you will need to re-query the cache
