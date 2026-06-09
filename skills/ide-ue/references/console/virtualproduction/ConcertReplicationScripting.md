# UE Python API — ConcertReplicationScripting Module

**4 types** from the `ConcertReplicationScripting` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ConcertPropertyChainWrapper`, `ConcertPropertyChainWrapperContainer`, `ConcertReplicationBlueprintFunctionLibrary`, `ConcertReplicationBlueprintFunctionLibrary_PropertyChainPredicate`

---

## Classes

### `unreal.ConcertPropertyChainWrapper`
Inherits: `StructBase` | Header: `ConcertPropertyChainWrapper.h`

Concert Property Chain Wrapper

**Methods** (2):
  - `get_child_properties(class_, only_direct = False)` -> `Array [ ConcertPropertyChainWrapper ]` — Returns all child properties of Parent that are valid for replicating.
  - `to_string()` -> `str` — Converts the the property to a string.

### `unreal.ConcertPropertyChainWrapperContainer`
Inherits: `StructBase` | Header: `ConcertPropertyChainWrapperContainer.h`

Special array of property chains. Used to allow for detail customization.

**Properties** (1):
  - `property_chains`: `None` — [Read-Write] (Array[ConcertPropertyChainWrapper])

### `unreal.ConcertReplicationBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ConcertReplicationBlueprintFunctionLibrary.h`

Concert Replication Blueprint Function Library

**Methods** (10):
  - `get_all_properties(class_)` -> `Array [ ConcertPropertyChainWrapper ]` [classmethod] — Gets all properties in the class that are valid for replicating.
  - `get_child_properties(parent, class_, only_direct = False)` -> `Array [ ConcertPropertyChainWrapper ]` [classmethod] — Returns all child properties of Parent that are valid for replicating.
  - `get_properties_in(class_, filter)` -> `Array [ ConcertPropertyChainWrapper ]` [classmethod] — Builds an array of property paths that pass the given filter.
  - `get_property_from_leaf(path, index = 0)` -> `Name` [classmethod] — Gets the property at Index starting from the leaf most property. Example: The leaf Index 0 for [âRelativeLocationâ, ...
  - `get_property_from_root(path, index = 0)` -> `Name` [classmethod] — Gets the property at Index starting from the root most property. Example: The root Index 0 for [âRelativeLocationâ, ...
  - `get_property_string_path(path)` -> `Array [ Name ]` [classmethod] — Gets the path as string array. Example: [âRelativeLocationâ, âXâ]
  - `is_child_of(to_test, parent)` -> `bool` [classmethod] — Checks whether ToTest is a child property of Parent.
  - `is_direct_child_of(to_test, parent)` -> `bool` [classmethod] — Checks whether ToTest is a direct child property of Parent.
  - `make_property_chain_by_literal_path(class_, path_to_property)` -> `ConcertPropertyChainWrapper or None` [classmethod] — Tries to make concert property chain by specifying a path manually.
  - `to_string(property_chain)` -> `str` [classmethod] — Converts the the property to a string.

### `unreal.ConcertReplicationBlueprintFunctionLibrary_PropertyChainPredicate`
Inherits: `DelegateBase` | Header: `ConcertReplicationBlueprintFunctionLibrary.h`

Property Chain Predicate Delegate Signature
