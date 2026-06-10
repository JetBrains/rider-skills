# UE Python API — TypedElementFramework Module

**8 types** from the `TypedElementFramework` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ScriptTypedElementHandle`, `TypedElementList`, `TestTypedElementInterfaceA`, `TestTypedElementInterfaceB`, `TestTypedElementInterfaceC`, `TypedElementHandleLibrary`, `TypedElementListLibrary`, `TypedElementRegistry`

---

## Classes

### `unreal.ScriptTypedElementHandle`
Inherits: `StructBase` | Header: `TypedElementHandle.h`

Script exposure for the typed element handle struct type Act as a weak handle to simplify the scripting use of the typed element framework and making it safer to use by avoiding crash in case of a bad...

**Methods** (7):
  - `__bool__()` -> `bool` — Has this handle been initialized to a valid element?
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `equal(rhs)` -> `bool` — Are these two handles equal?
  - `is_set()` -> `bool` — Has this handle been initialized to a valid element?
  - `not_equal(rhs)` -> `bool` — Are these two handles not equal?
  - `release()` -> `None` — Release this handle and set it back to an empty state.

### `unreal.TypedElementList`
Inherits: `StructBase` | Header: `TypedElementListProxy.h`

A list of script element handles (proxy to a FScriptTypedElementList instance). Provides high-level access to groups of elements, including accessing elements that implement specific interfaces.

**Methods** (19):
  - `add(element_handle)` -> `bool` — Add the given element handle to this element list, if it isnât already in the list.
  - `append(element_handles)` -> `None` — Append the given element handles to this element list.
  - `append_list(other_element_list)` -> `None` — Append the another element list to this element list.
  - `clone()` -> `TypedElementList` — Clone this list instance. note: Only copies elements; does not copy any bindings!
  - `contains(element_handle)` -> `bool` — Does this element list contain an entry for the given element handle?
  - `count_elements(base_interface_type = None)` -> `int32` — Count the number of elements in this list, optionally filtering to elements that implement the given interface.
  - `count_elements_of_type(element_type_name)` -> `int32` — Count the number of elements in this list of the given type.
  - `empty(slack = 0)` -> `None` — Remove all entries from this element list, potentially leaving space allocated for the given number of entries.
  - `get_element_handle_at(index)` -> `ScriptTypedElementHandle` — Get the element handle at the given index. note: Use IsValidIndex to test for validity.
  - `get_element_handles(base_interface_type)` -> `Array [ ScriptTypedElementHandle ]` — Get the handle of every element in this list, optionally filtering to elements that implement the given interface.
  - `get_element_interface(element_handle, base_interface_type)` -> `Object` — Get the element interface from the given handle.
  - `has_elements(base_interface_type = None)` -> `bool` — Test whether there are elements in this list, optionally filtering to elements that implement the given interface.
  - `has_elements_of_type(element_type_name)` -> `bool` — Test whether there are elements in this list of the given type.
  - `is_valid_index(index)` -> `bool` — Is the given index a valid entry within this element list?
  - `num()` -> `int32` — Get the number of entries within this element list.
  - `remove(element_handle)` -> `bool` — Remove the given element handle from this element list, if it is in the list.
  - `reserve(size)` -> `None` — Pre-allocate enough memory in this element list to store the given number of entries.
  - `reset()` -> `None` — Remove all entries from this element list, preserving existing allocations.
  - `shrink()` -> `None` — Shrink this element list storage to avoid slack.

### `unreal.TestTypedElementInterfaceA`
Inherits: `Interface` | Header: `TypedElementFrameworkTests.h`

Test Typed Element Interface A

**Methods** (2):
  - `get_display_name(element_handle)` -> `Text` — Get Display Name
  - `set_display_name(element_handle, new_name, notify = True)` -> `bool` — Set Display Name

### `unreal.TestTypedElementInterfaceB`
Inherits: `Interface` | Header: `TypedElementFrameworkTests.h`

Test Typed Element Interface B

**Methods** (1):
  - `mark_as_tested(element_handle)` -> `bool` — Mark as Tested

### `unreal.TestTypedElementInterfaceC`
Inherits: `Interface` | Header: `TypedElementFrameworkTests.h`

Test Typed Element Interface C

**Methods** (1):
  - `get_is_tested(element_handle)` -> `bool` — Get Is Tested

### `unreal.TypedElementHandleLibrary`
Inherits: `Object` | Header: `TypedElementHandle.h`

Script exposure for FScriptTypedElementHandle.

**Methods** (4):
  - `equal(lhs, rhs)` -> `bool` [classmethod] — Are these two handles equal?
  - `is_set(element_handle)` -> `bool` [classmethod] — Has this handle been initialized to a valid element?
  - `not_equal(lhs, rhs)` -> `bool` [classmethod] — Are these two handles not equal?
  - `release(element_handle)` -> `ScriptTypedElementHandle` [classmethod] — Release this handle and set it back to an empty state.

### `unreal.TypedElementListLibrary`
Inherits: `Object` | Header: `TypedElementListLibrary.h`

Typed Element List Library

**Methods** (20):
  - `add(element_list, element_handle)` -> `bool` [classmethod] — Add the given element handle to this element list, if it isnât already in the list.
  - `append(element_list, element_handles)` -> `None` [classmethod] — Append the given element handles to this element list.
  - `append_list(element_list, other_element_list)` -> `None` [classmethod] — Append the another element list to this element list.
  - `clone(element_list)` -> `TypedElementList` [classmethod] — Clone this list instance. note: Only copies elements; does not copy any bindings!
  - `contains(element_list, element_handle)` -> `bool` [classmethod] — Does this element list contain an entry for the given element handle?
  - `count_elements(element_list, base_interface_type = None)` -> `int32` [classmethod] — Count the number of elements in this list, optionally filtering to elements that implement the given interface.
  - `count_elements_of_type(element_list, element_type_name)` -> `int32` [classmethod] — Count the number of elements in this list of the given type.
  - `create_element_list(registry)` -> `TypedElementList` [classmethod] — Create an empty list of elements associated with the given registry.
  - `empty(element_list, slack = 0)` -> `None` [classmethod] — Remove all entries from this element list, potentially leaving space allocated for the given number of entries.
  - `get_element_handle_at(element_list, index)` -> `ScriptTypedElementHandle` [classmethod] — Get the element handle at the given index. note: Use IsValidIndex to test for validity.
  - `get_element_handles(element_list, base_interface_type)` -> `Array [ ScriptTypedElementHandle ]` [classmethod] — Get the handle of every element in this list, optionally filtering to elements that implement the given interface.
  - `get_element_interface(element_list, element_handle, base_interface_type)` -> `Object` [classmethod] — Get the element interface from the given handle.
  - `has_elements(element_list, base_interface_type = None)` -> `bool` [classmethod] — Test whether there are elements in this list, optionally filtering to elements that implement the given interface.
  - `has_elements_of_type(element_list, element_type_name)` -> `bool` [classmethod] — Test whether there are elements in this list of the given type.
  - `is_valid_index(element_list, index)` -> `bool` [classmethod] — Is the given index a valid entry within this element list?
  - `num(element_list)` -> `int32` [classmethod] — Get the number of entries within this element list.
  - `remove(element_list, element_handle)` -> `bool` [classmethod] — Remove the given element handle from this element list, if it is in the list.
  - `reserve(element_list, size)` -> `None` [classmethod] — Pre-allocate enough memory in this element list to store the given number of entries.
  - `reset(element_list)` -> `None` [classmethod] — Remove all entries from this element list, preserving existing allocations.
  - `shrink(element_list)` -> `None` [classmethod] — Shrink this element list storage to avoid slack.

### `unreal.TypedElementRegistry`
Inherits: `Object` | Header: `TypedElementRegistry.h`

Registry of element types and their associated interfaces, along with the elements that represent their instances.

**Methods** (3):
  - `create_element_list()` -> `TypedElementList` — Create an empty list of elements associated with the given registry.
  - `get_default_typed_element_registry()` -> `TypedElementRegistry` [classmethod] — Get the singleton instance of the registry used in most cases.
  - `get_element_interface(element_handle, base_interface_type)` -> `Object` — Get the element interface supported by the given handle, or null if there is no support for this interface or if the han...
