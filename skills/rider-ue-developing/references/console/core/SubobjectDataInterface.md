# UE Python API — SubobjectDataInterface Module

**6 types** from the `SubobjectDataInterface` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AddNewSubobjectParams`, `ReparentSubobjectParams`, `SubobjectData`, `SubobjectDataHandle`, `SubobjectDataBlueprintFunctionLibrary`, `SubobjectDataSubsystem`

---

## Classes

### `unreal.AddNewSubobjectParams`
Inherits: `StructBase` | Header: `SubobjectDataSubsystem.h`

Options when adding a new subobject

**Properties** (5):
  - `blueprint_context`: `Blueprint` — [Read-Write] Pointer to the blueprint context that this subobject is in. If this is null, it is assu...
  - `conform_transform_to_parent`: `bool` — [Read-Write] Whether the newly created component should keep its transform, or conform it to its par...
  - `new_class`: `Class` — [Read-Write] The class of the new subobject that will be added (type(Class))
  - `parent_handle`: `SubobjectDataHandle` — [Read-Write] (SubobjectDataHandle)
  - `skip_mark_blueprint_modified`: `bool` — [Read-Write] Optionally skip marking this blueprint as modified (e.g. if weâre handling that exter...

### `unreal.ReparentSubobjectParams`
Inherits: `StructBase` | Header: `SubobjectDataSubsystem.h`

Options for reparenting subobjects

**Properties** (3):
  - `actor_preview_context`: `Actor` — [Read-Write] The preview actor context to be used if in a blueprint context.
This must have a value ...
  - `blueprint_context`: `Blueprint` — [Read-Write] Pointer to the blueprint context that this subobject is in. If this is null, it is assu...
  - `new_parent_handle`: `SubobjectDataHandle` — [Read-Write] The handle of the subobject to reparent to. (SubobjectDataHandle)

### `unreal.SubobjectData`
Inherits: `StructBase` | Header: `SubobjectData.h`

A struct that represents a single subobject. This can be anything, but are most commonly components attached to an actor instance or blueprint. Keeps track of the handles to its parent object and any ...

### `unreal.SubobjectDataHandle`
Inherits: `StructBase` | Header: `SubobjectDataHandle.h`

A subobject handle is a globally unique identifier for subobjects Upon construction, the handle will be invalid. It is the responsibility of the owning FSubobjectData to set the DataPtr once the subob...

### `unreal.SubobjectDataBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SubobjectDataBlueprintFunctionLibrary.h`

A function library with wrappers around the getter/setter functions for FSubobjectData that will make it easier to use within blueprint contexts.

**Methods** (29):
  - `can_copy(data)` -> `bool` [classmethod]
  - `can_delete(data)` -> `bool` [classmethod]
  - `can_duplicate(data)` -> `bool` [classmethod]
  - `can_edit(data)` -> `bool` [classmethod]
  - `can_rename(data)` -> `bool` [classmethod] — Can Rename
  - `can_reparent(data)` -> `bool` [classmethod]
  - `get_associated_object(data)` -> `Object` [classmethod] — Get Associated Object
  - `get_blueprint(data)` -> `Blueprint` [classmethod] — Get Blueprint
  - `get_data(data_handle)` -> `SubobjectData` [classmethod] — Get Data
  - `get_display_name(data)` -> `Text` [classmethod] — Get Display Name
  - `get_handle(data)` -> `SubobjectDataHandle` [classmethod]
  - `get_object(data, even_if_pending_kill = False)` -> `Object` [classmethod] — Get Object deprecated: Use GetAssociatedObject - it will not return template objects for instances
  - `get_object_for_blueprint(data, blueprint)` -> `Object` [classmethod] — Get Object for Blueprint
  - `get_parent_handle(data)` -> `SubobjectDataHandle` [classmethod]
  - `get_variable_name(data)` -> `Name` [classmethod] — Get Variable Name
  - `is_actor(data)` -> `bool` [classmethod] — Is Actor
  - `is_attached_to(data, handle)` -> `bool` [classmethod] — Is Attached To
  - `is_child_actor(data)` -> `bool` [classmethod] — Is Child Actor
  - `is_component(data)` -> `bool` [classmethod] — Returns true if this subobject is a component.
  - `is_default_scene_root(data)` -> `bool` [classmethod] — Is Default Scene Root
  - `is_handle_valid(data_handle)` -> `bool` [classmethod] — Is Handle Valid
  - `is_inherited_component(data)` -> `bool` [classmethod] — Is Inherited Component
  - `is_instanced_actor(data)` -> `bool` [classmethod] — Is Instanced Actor
  - `is_instanced_component(data)` -> `bool` [classmethod] — Is Instanced Component
  - `is_native_component(data)` -> `bool` [classmethod] — Is Native Component
  - `is_root_actor(data)` -> `bool` [classmethod] — Is Root Actor
  - `is_root_component(data)` -> `bool` [classmethod] — Is Root Component
  - `is_scene_component(data)` -> `bool` [classmethod] — Is Scene Component
  - `is_valid(data)` -> `bool` [classmethod] — Is Valid

### `unreal.SubobjectDataSubsystem`
Inherits: `EngineSubsystem` | Header: `SubobjectDataSubsystem.h`

The Subobject Data Subsystem will produce the reflected subobject data based on a given root object. A root object can be anything, an actor instance clicked on via the level editor, a UBlueprint* by ...

**Methods** (25):
  - `add_new_subobject(fail_reason=Text)` — Add a new subobject as a child to the given parent object
  - `attach_subobject(owner_handle, child_to_add_handle)` -> `bool` — Add the given subobject to a new owner. This will remove the subobject from its previous owner if necessary.
  - `can_copy_subobjects(handles)` -> `bool` — Returns true if the given array of handles represents subobjects that can be copied.
  - `can_paste_subobjects(root_handle, bp_context = None)` -> `bool` — Can Paste Subobjects
  - `change_subobject_class(handle, new_class)` -> `bool` — Attempts to change the subclass of a native component
  - `copy_subobjects(handles, bp_context)` -> `None` — Copy Subobjects
  - `create_new_bp_component(component_class, new_class_path, new_class_name)` [classmethod] — Creates a new Blueprint component from the specified class type The user will be prompted to pick a new subclass name an...
  - `create_new_cpp_component(component_class, new_class_path, new_class_name)` [classmethod] — Creates a new C++ component from the specified class type The user will be prompted to pick a new subclass name and code...
  - `delete_subobject(context_handle, subobject_to_delete, bp_context = None)` -> `int32` — Attempts to delete the given subobject from its blueprint context
  - `delete_subobjects(context_handle, subobjects_to_delete, bp_context = None)` -> `int32` — Attempts to delete the given array of subobjects from their context
  - `detach_subobject(owner_handle, child_to_remove)` -> `bool` — Remove the child subobject from the owner
  - `duplicate_subobjects(context, subobjects_to_dup, bp_context)` -> `Array [ SubobjectDataHandle ]` — Duplicate the given array of subobjects on the context.
  - `find_handle_for_object(context, object_to_find, bp_context = None)` -> `SubobjectDataHandle` — Attempt to find an existing handle for the given object.
  - `is_valid_rename(handle, new_text)` -> `Text or None` — Returns true if the given new text is a valid option to rename the subobject with the given handle. Populates the OutErr...
  - `k2_delete_subobject_from_instance(context_handle, subobject_to_delete)` -> `int32` — Attempts to delete the given subobject from its context
  - `k2_delete_subobjects_from_instance(context_handle, subobjects_to_delete)` -> `int32` — Attempts to delete the given array of subobjects from their context
  - `k2_find_subobject_data_from_handle(handle)` -> `SubobjectData or None` — Attempt to find the subobject data for a given handle. OutData will only be valid if the function returns true.
  - `k2_gather_subobject_data_for_blueprint(context)` -> `Array [ SubobjectDataHandle ]` — Gather all subobjects that the given Blueprint context has. Populates an array of handles that will have the given conte...
  - `k2_gather_subobject_data_for_instance(context)` -> `Array [ SubobjectDataHandle ]` — Gather all subobjects that the given actor instance has. Populates an array of handles that will have the given context ...
  - `make_new_scene_root(context, new_scene_root, bp_context)` -> `bool` — Make New Scene Root
  - `paste_subobjects(paste_to_context, new_parent_handles, bp_context)` -> `Array [ SubobjectDataHandle ]` — Pastes the given subobjects to the PasteToContext.
  - `rename_subobject(handle, new_name)` -> `bool` — Attempts to rename the given subobject to the new name.
  - `rename_subobject_member_variable(bp_context, handle, new_name)` -> `None` [classmethod] — Rename Subobject Member Variable
  - `reparent_subobject(params, to_reparent_handle)` -> `bool` — Attempts to reparent the given subobject to the new parent
  - `reparent_subobjects(params, handles_to_move)` -> `bool` — Attempts to reparent all subobjects in the HandlesToMove array to the new parent handle.
