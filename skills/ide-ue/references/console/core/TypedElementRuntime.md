# UE Python API — TypedElementRuntime Module

**16 types** from the `TypedElementRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TypedElementAssetDataReferencedOptions`, `TypedElementIsSelectedOptions`, `TypedElementSelectionNormalizationOptions`, `TypedElementSelectionOptions`, `TypedElementSelectionSetState`, `TypedElementAssetDataInterface`, `TypedElementHierarchyInterface`, `TypedElementObjectInterface`, `TypedElementPrimitiveCustomDataInterface`, `TypedElementSelectionInterface`, `TypedElementSelectionSet`, `TypedElementSelectionSetLibrary`, `TypedElementChildInclusionMethod`, `TypedElementSelectionMethod`, `TypedElementSelectionSet_OnChangeDynamic`, `TypedElementSelectionSet_OnPreChangeDynamic`

---

## Classes

### `unreal.TypedElementAssetDataReferencedOptions`
Inherits: `StructBase` | Header: `TypedElementAssetDataInterface.h`

Typed Element Asset Data Referenced Options

**Properties** (1):
  - `only_top_level_asset`: `bool` — [Read-Write] (bool)

### `unreal.TypedElementIsSelectedOptions`
Inherits: `StructBase` | Header: `TypedElementSelectionInterface.h`

Typed Element Is Selected Options

**Properties** (1):
  - `allow_indirect`: `bool` — [Read-Write] (bool)

### `unreal.TypedElementSelectionNormalizationOptions`
Inherits: `StructBase` | Header: `TypedElementSelectionSet.h`

Typed Element Selection Normalization Options

**Properties** (2):
  - `expand_groups`: `bool` — [Read-Write] (bool)
  - `follow_attachment`: `bool` — [Read-Write] (bool)

### `unreal.TypedElementSelectionOptions`
Inherits: `StructBase` | Header: `TypedElementSelectionInterface.h`

Typed Element Selection Options

**Properties** (6):
  - `allow_groups`: `bool` — [Read-Write] (bool)
  - `allow_hidden`: `bool` — [Read-Write] (bool)
  - `allow_legacy_notifications`: `bool` — [Read-Write] (bool)
  - `allow_sub_root_selection`: `bool` — [Read-Write] (bool)
  - `child_element_inclusion_method`: `TypedElementChildInclusionMethod` — [Read-Write] (TypedElementChildInclusionMethod)
  - `warn_if_locked`: `bool` — [Read-Write] (bool)

### `unreal.TypedElementSelectionSetState`
Inherits: `StructBase` | Header: `TypedElementSelectionSet.h`

Typed Element Selection Set State

### `unreal.TypedElementAssetDataInterface`
Inherits: `Interface` | Header: `TypedElementAssetDataInterface.h`

Typed Element Asset Data Interface

**Methods** (2):
  - `get_all_referenced_asset_datas(element_handle)` -> `Array [ AssetData ]` — Returns any asset datas for content objects referenced by handle. If the given handle itself has valid asset data, it sh...
  - `get_asset_data(element_handle)` -> `AssetData` — Returns the asset data for the given handle, if it exists.

### `unreal.TypedElementHierarchyInterface`
Inherits: `Interface` | Header: `TypedElementHierarchyInterface.h`

Typed Element Hierarchy Interface

**Methods** (2):
  - `get_child_elements(element_handle, allow_create = True)` -> `Array [ ScriptTypedElementHandle ]` — Get the logical children of this element, if any. eg) An actor might return its component, or an ISM component might ret...
  - `get_parent_element(element_handle, allow_create = True)` -> `ScriptTypedElementHandle` — Get the logical parent of this element, if any. eg) A component might return its actor, or a static mesh instance might ...

### `unreal.TypedElementObjectInterface`
Inherits: `Interface` | Header: `TypedElementObjectInterface.h`

Typed Element Object Interface

**Methods** (2):
  - `get_object(element_handle)` -> `Object` — Get the object instance that this handle represents, if any.
  - `get_object_class(element_handle)` — Gets the object instanceâs class that the handle represents, if any.

### `unreal.TypedElementPrimitiveCustomDataInterface`
Inherits: `Interface` | Header: `TypedElementPrimitiveCustomDataInterface.h`

Typed Element Primitive Custom Data Interface

**Methods** (2):
  - `set_custom_data(element_handle, custom_data_floats, mark_render_state_dirty = False)` -> `None` — Sets all Primitiveâs CustomData values
  - `set_custom_data_value(element_handle, custom_data_index, custom_data_value, mark_render_state_dirty = False)` -> `None` — Sets a single Primitiveâs CustomData value

### `unreal.TypedElementSelectionInterface`
Inherits: `Interface` | Header: `TypedElementSelectionInterface.h`

Typed Element Selection Interface

**Methods** (7):
  - `allow_selection_modifiers(element_handle, selection_set)` -> `bool` — Test to see whether selection modifiers (Ctrl or Shift) are allowed while selecting this element.
  - `can_deselect_element(element_handle, selection_options)` -> `bool` — Test to see whether the given element can be deselected.
  - `can_select_element(element_handle, selection_options)` -> `bool` — Test to see whether the given element can be selected.
  - `deselect_element(element_handle, selection_set, selection_options)` -> `bool` — Attempt to deselect the given element.
  - `get_selection_element(element_handle, current_selection, selection_method)` -> `ScriptTypedElementHandle` — Given an element, return the element that should actually perform a selection operation.
  - `is_element_selected(element_handle, selection_set, selection_options)` -> `bool` — Test to see whether the given element is currently considered selected.
  - `select_element(element_handle, selection_set, selection_options)` -> `bool` — Attempt to select the given element.

### `unreal.TypedElementSelectionSet`
Inherits: `Object` | Header: `TypedElementSelectionSet.h`

A wrapper around an element list that ensures mutation goes via the selection interfaces, as well as providing some utilities for batching operations.

**Methods** (27):
  - `allow_selection_modifiers(element_handle)` -> `bool` — Test to see whether selection modifiers (Ctrl or Shift) are allowed while selecting this element.
  - `can_deselect_element(element_handle, selection_options)` -> `bool` — Test to see whether the given element can be deselected.
  - `can_select_element(element_handle, selection_options)` -> `bool` — Test to see whether the given element can be selected.
  - `clear_selection(selection_options)` -> `bool` — Clear the current selection.
  - `count_selected_elements(base_interface_type = None)` -> `int32` — Count the number of selected elements, optionally filtering to elements that implement the given interface.
  - `count_selected_objects(required_class = None)` -> `int32` — Count the number of selected objects.
  - `deselect_element(element_handle, selection_options)` -> `bool` — Attempt to deselect the given element.
  - `deselect_elements(element_handles, selection_options)` -> `bool` — Attempt to deselect the given elements.
  - `deselect_elements_from_list(element_list, selection_options)` -> `bool` — Attempt to deselect the given elements.
  - `get_bottom_selected_object(required_class = None)` -> `Object` — Get the last selected object of the given type.
  - `get_current_selection_state()` -> `TypedElementSelectionSetState` — Serializes the current selection set. The calling code is responsible for storing any state information. The selection s...
  - `get_normalized_element_list(element_list, normalization_options)` -> `TypedElementList` — Get a normalized version of the given element list that can be used to perform operations like gizmo manipulation, delet...
  - `get_normalized_selection(normalization_options)` -> `TypedElementList` — Get a normalized version of this selection set that can be used to perform operations like gizmo manipulation, deletion,...
  - `get_num_selected_elements()` -> `int32` — Get the number of selected elements.
  - `get_selected_element_handles(base_interface_type = None)` -> `Array [ ScriptTypedElementHandle ]` — Get the handle of every selected element, optionally filtering to elements that implement the given interface.
  - `get_selected_objects(required_class = None)` -> `Array [ Object ]` — Get the array of selected objects from the currently selected elements.
  - `get_selection_element(element_handle, selection_method)` -> `ScriptTypedElementHandle` — Given an element, return the element that should actually perform a selection operation.
  - `get_top_selected_object(required_class = None)` -> `Object` — Get the first selected object of the given type.
  - `has_selected_elements(base_interface_type = None)` -> `bool` — Test whether there selected elements, optionally filtering to elements that implement the given interface.
  - `has_selected_objects(required_class = None)` -> `bool` — Test whether there are any selected objects.
  - `is_element_selected(element_handle, selection_options)` -> `bool` — Test to see whether the given element is currently considered selected.
  - `restore_selection_state(selection_state)` -> `None` — Restores the selection set from the given state. The calling code is responsible for managing any undo state.
  - `select_element(element_handle, selection_options)` -> `bool` — Attempt to select the given element.
  - `select_elements(element_handles, selection_options)` -> `bool` — Attempt to select the given elements.
  - `select_elements_from_list(element_list, selection_options)` -> `bool` — Attempt to select the given elements.
  - `set_selection(element_handles, selection_options)` -> `bool` — Attempt to make the selection the given elements. note: Equivalent to calling ClearSelection then SelectElements, but ha...
  - `set_selection_from_list(element_list, selection_options)` -> `bool` — Attempt to make the selection the given elements. note: Equivalent to calling ClearSelection then SelectElements, but ha...

**Properties** (2):
  - `on_pre_selection_change`: `OnPreChangeDynamic` — [Read-Write] Delegate that is invoked whenever the underlying element list is potentially about to c...
  - `on_selection_change`: `OnChangeDynamic` — [Read-Write] Delegate that is invoked whenever the underlying element list has been changed. (OnChan...

### `unreal.TypedElementSelectionSetLibrary`
Inherits: `Object` | Header: `TypedElementSelectionSetLibrary.h`

Library of functions for the scripting of Typed Elements that use both a selection set and a element list

**Methods** (5):
  - `deselect_elements_from_list(selection_set, element_list, selection_options)` -> `bool` [classmethod] — Attempt to deselect the given elements.
  - `get_normalized_element_list(selection_set, element_list, normalization_options)` -> `TypedElementList` [classmethod] — Get a normalized version of the given element list that can be used to perform operations like gizmo manipulation, delet...
  - `get_normalized_selection(selection_set, normalization_options)` -> `TypedElementList` [classmethod] — Get a normalized version of this selection set that can be used to perform operations like gizmo manipulation, deletion,...
  - `select_elements_from_list(selection_set, element_list, selection_options)` -> `bool` [classmethod] — Attempt to select the given elements.
  - `set_selection_from_list(selection_set, element_list, selection_options)` -> `bool` [classmethod] — Attempt to make the selection the given elements. note: Equivalent to calling ClearSelection then SelectElements, but ha...

### `unreal.TypedElementChildInclusionMethod`
Inherits: `EnumBase` | Header: `TypedElementSelectionInterface.h`

ETyped Element Child Inclusion Method

**Properties** (3):
  - `IMMEDIATE`: `TypedElementChildInclusionMethod = Ellipsis` — Include the immediate child elements, but do not recurse 1
  - `NONE`: `TypedElementChildInclusionMethod = Ellipsis` — Do not include child elements 0
  - `RECURSIVE`: `TypedElementChildInclusionMethod = Ellipsis` — Include the immediate child elements, and recurse into their children too 2

### `unreal.TypedElementSelectionMethod`
Inherits: `EnumBase` | Header: `TypedElementSelectionInterface.h`

ETyped Element Selection Method

**Properties** (3):
  - `FROM_SECONDARY`: `TypedElementSelectionMethod = Ellipsis` — The âsecondaryâ element is choosing to pass back up the chain (eg. an ISM was selected, but we w...
  - `PRIMARY`: `TypedElementSelectionMethod = Ellipsis` — Select the âprimaryâ element (eg, a component would favor selecting its owner actor) 0
  - `SECONDARY`: `TypedElementSelectionMethod = Ellipsis` — Select the âsecondaryâ element (eg, a component would favor selecting itself) 1

### `unreal.TypedElementSelectionSet_OnChangeDynamic`
Inherits: `MulticastDelegateBase` | Header: `TypedElementSelectionSet.h`

On Change Dynamic Delegate Signature

### `unreal.TypedElementSelectionSet_OnPreChangeDynamic`
Inherits: `MulticastDelegateBase` | Header: `TypedElementSelectionSet.h`

On Pre Change Dynamic Delegate Signature
