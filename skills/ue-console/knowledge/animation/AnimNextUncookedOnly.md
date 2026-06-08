# UE Python API — AnimNextUncookedOnly Module

**12 types** from the `AnimNextUncookedOnly` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNextVariableBinding`, `AnimNextDataInterface_EditorData`, `AnimNextDataInterfaceEntry`, `AnimNextEventGraphEntry`, `AnimNextModule_EditorData`, `AnimNextRigVMAssetEditorData`, `AnimNextRigVMAssetEntry`, `AnimNextRigVMAssetLibrary`, `AnimNextUnitNode`, `AnimNextVariableEntry`, `AnimNextDataInterfaceAutomaticBindingMode`, `AnimNextExportAccessSpecifier`

---

## Classes

### `unreal.AnimNextVariableBinding`
Inherits: `StructBase` | Header: `AnimNextVariableBinding.h`

Anim Next Variable Binding

### `unreal.AnimNextDataInterface_EditorData`
Inherits: `AnimNextRigVMAssetEditorData` | Header: `AnimNextDataInterface_EditorData.h`

Editor data for AnimNext data interfaces

### `unreal.AnimNextDataInterfaceEntry`
Inherits: `AnimNextRigVMAssetEntry` | Header: `AnimNextDataInterfaceEntry.h`

Anim Next Data Interface Entry

### `unreal.AnimNextEventGraphEntry`
Inherits: `AnimNextRigVMAssetEntry` | Header: `AnimNextEventGraphEntry.h`

Anim Next Event Graph Entry

### `unreal.AnimNextModule_EditorData`
Inherits: `AnimNextDataInterface_EditorData` | Header: `AnimNextModule_EditorData.h`

Editor data for AnimNext modules

### `unreal.AnimNextRigVMAssetEditorData`
Inherits: `Object` | Header: `AnimNextRigVMAssetEditorData.h`

Base class for all AnimNext editor data objects that use RigVM

**Properties** (1):
  - `vm_compile_settings`: `RigVMCompileSettings` — [Read-Write] (RigVMCompileSettings)

### `unreal.AnimNextRigVMAssetEntry`
Inherits: `Object` | Header: `AnimNextRigVMAssetEntry.h`

Base class that defines an entry in a module, e.g. a parameter or a graph

### `unreal.AnimNextRigVMAssetLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimNextRigVMAssetEditorData.h`

Script-callable editor API hoisted onto UAnimNextRigVMAsset

**Methods** (8):
  - `add_data_interface(asset, data_interface, setup_undo_redo = True, print_python_command = True)` -> `AnimNextDataInterfaceEntry` [classmethod] — Adds a data interface to an AnimNext asset
  - `add_event_graph(asset, name, event_struct, setup_undo_redo = True, print_python_command = True)` -> `AnimNextEventGraphEntry` [classmethod] — Adds an event graph to an AnimNext asset
  - `add_function(asset, function_name, mutable, setup_undo_redo = True, print_python_command = True)` -> `RigVMLibraryNode` [classmethod] — Adds a function to an AnimNext asset
  - `add_variable(asset, name, value_type, container_type = PropertyBagContainerType.NONE, value_type_object = None, default_value = '', setup_undo_redo = True, print_python_command = True)` -> `AnimNextVariableEntry` [classmethod] — Adds a parameter to an AnimNext asset
  - `find_entry(asset, name)` -> `AnimNextRigVMAssetEntry` [classmethod] — Finds an entry in an AnimNext asset
  - `remove_all_entries(asset, setup_undo_redo = True, print_python_command = True)` -> `bool` [classmethod] — Removes all entries from an AnimNext asset
  - `remove_entries(asset, entries, setup_undo_redo = True, print_python_command = True)` -> `bool` [classmethod] — Removes multiple entries from an AnimNext asset
  - `remove_entry(asset, entry, setup_undo_redo = True, print_python_command = True)` -> `bool` [classmethod] — Removes an entry from an AnimNext asset

### `unreal.AnimNextUnitNode`
Inherits: `RigVMUnitNode` | Header: `AnimNextUnitNode.h`

Implements AnimNext RigVM unit node extensions

### `unreal.AnimNextVariableEntry`
Inherits: `AnimNextRigVMAssetEntry` | Header: `AnimNextVariableEntry.h`

Anim Next Variable Entry

### `unreal.AnimNextDataInterfaceAutomaticBindingMode`
Inherits: `EnumBase` | Header: `AnimNextDataInterfaceEntry.h`

EAnim Next Data Interface Automatic Binding Mode

**Properties** (2):
  - `BIND_SHARED_INTERFACES`: `AnimNextDataInterfaceAutomaticBindingMode = Ellipsis` — Public variables that exist on shared data interfaces on this asset and its host will be bound toget...
  - `NO_BINDING`: `AnimNextDataInterfaceAutomaticBindingMode = Ellipsis` — No automatic binding will be performed 0

### `unreal.AnimNextExportAccessSpecifier`
Inherits: `EnumBase` | Header: `IAnimNextRigVMExportInterface.h`

EAnim Next Export Access Specifier

**Properties** (2):
  - `PRIVATE`: `AnimNextExportAccessSpecifier = Ellipsis` — Export can only be used/referenced in the graph it is declared in 0
  - `PUBLIC`: `AnimNextExportAccessSpecifier = Ellipsis` — Export can be used/referenced in other graphs/contexts (e.g. BP, Verse) 1
