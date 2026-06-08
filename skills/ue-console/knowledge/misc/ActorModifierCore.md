# UE Python API — ActorModifierCore Module

**15 types** from the `ActorModifierCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ActorModifierCoreCloneOperation`, `ActorModifierCoreInsertOperation`, `ActorModifierCoreMetadata`, `ActorModifierCoreMoveOperation`, `ActorModifierCoreRemoveOperation`, `ActorModifierCoreBase`, `ActorModifierCoreBlueprintBase`, `ActorModifierCoreComponent`, `ActorModifierCoreLibrary`, `ActorModifierCoreSharedActor`, `ActorModifierCoreStack`, `ActorModifierCoreDisableReason`, `ActorModifierCoreEnableReason`, `ActorModifierCoreStackPosition`, `ModifierCompatibilityRule`

---

## Classes

### `unreal.ActorModifierCoreCloneOperation`
Inherits: `StructBase` | Header: `ActorModifierCoreLibraryDefs.h`

Actor Modifier Core Clone Operation

**Properties** (3):
  - `clone_modifier`: `ActorModifierCoreBase` — [Read-Write] (ActorModifierCoreBase)
  - `clone_position`: `ActorModifierCoreStackPosition` — [Read-Write] (ActorModifierCoreStackPosition)
  - `clone_position_context`: `ActorModifierCoreBase` — [Read-Write] (ActorModifierCoreBase)

### `unreal.ActorModifierCoreInsertOperation`
Inherits: `StructBase` | Header: `ActorModifierCoreLibraryDefs.h`

Actor Modifier Core Insert Operation

**Properties** (3):
  - `insert_position`: `ActorModifierCoreStackPosition` — [Read-Write] (ActorModifierCoreStackPosition)
  - `insert_position_context`: `ActorModifierCoreBase` — [Read-Write] (ActorModifierCoreBase)
  - `modifier_class`: `Class` — [Read-Write] (type(Class))

### `unreal.ActorModifierCoreMetadata`
Inherits: `StructBase` | Header: `ActorModifierCoreDefs.h`

Metadata for each modifier CDO, modifier instance will share same metadata as CDO

### `unreal.ActorModifierCoreMoveOperation`
Inherits: `StructBase` | Header: `ActorModifierCoreLibraryDefs.h`

Actor Modifier Core Move Operation

**Properties** (3):
  - `move_modifier`: `ActorModifierCoreBase` — [Read-Write] (ActorModifierCoreBase)
  - `move_position`: `ActorModifierCoreStackPosition` — [Read-Write] (ActorModifierCoreStackPosition)
  - `move_position_context`: `ActorModifierCoreBase` — [Read-Write] (ActorModifierCoreBase)

### `unreal.ActorModifierCoreRemoveOperation`
Inherits: `StructBase` | Header: `ActorModifierCoreLibraryDefs.h`

Actor Modifier Core Remove Operation

**Properties** (2):
  - `remove_dependencies`: `bool` — [Read-Write] (bool)
  - `remove_modifier`: `ActorModifierCoreBase` — [Read-Write] (ActorModifierCoreBase)

### `unreal.ActorModifierCoreBase`
Inherits: `Object` | Header: `ActorModifierCoreBase.h`

Abstract base class for all modifier, a modifier must be located in a modifier stack to work properly

### `unreal.ActorModifierCoreBlueprintBase`
Inherits: `ActorModifierCoreBase` | Header: `ActorModifierCoreBlueprintBase.h`

Abstract base class for all blueprint modifier

**Methods** (10):
  - `flag_modifier_dirty()` -> `None` — Flag this modifier as needing an update after a property value has changed
  - `on_modifier_added_event(target_actor, reason)` -> `None` — Called when this modifier is added in a stack on an actor
  - `on_modifier_apply_event(target_actor)` -> `Text or None` — Called to apply a custom action on an actor
  - `on_modifier_disabled_event(target_actor, reason)` -> `None` — Called when this modifier is disabled
  - `on_modifier_enabled_event(target_actor, reason)` -> `None` — Called when this modifier is enabled
  - `on_modifier_removed_event(target_actor, reason)` -> `None` — Called when this modifier is removed from a stack on an actor
  - `on_modifier_replaced_event(target_actor)` -> `None` — Called when the modifier gets recompiled and replaced in the stack
  - `on_modifier_restore_state_event(target_actor)` -> `None` — Called to restore this modifier actions on an actor
  - `on_modifier_save_state_event(target_actor)` -> `None` — Called before this modifier is applied on an actor to save all relevant state
  - `on_modifier_setup_event(out_metadata=ActorModifierCoreMetadata)` — Called once to setup modifier metadata

### `unreal.ActorModifierCoreComponent`
Inherits: `ActorComponent` | Header: `ActorModifierCoreComponent.h`

Component that contains a modifier stack and can be added on any actor

**Methods** (1):
  - `get_modifier_stack()` -> `ActorModifierCoreStack` — Get Modifier Stack

### `unreal.ActorModifierCoreLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ActorModifierCoreLibrary.h`

Blueprint Create/Read/Update/Delete operations for modifiers

**Methods** (33):
  - `add_modifier_metadata_dependency(metadata, metadata=ActorModifierCoreMetadata)` [classmethod] — Adds a modifier metadata dependency for this modifier
  - `clone_modifier(modifier_stack, operation)` -> `ActorModifierCoreBase or None` [classmethod] — Clones an existing modifier into a modifier stack
  - `contains_modifier(modifier_stack, modifier)` -> `bool` [classmethod] — Checks if a modifier is contained in the stack
  - `enable_modifier(modifier, state)` -> `bool` [classmethod] — Sets the state of an existing modifier
  - `find_modifier_by_class(modifier_stack, modifier_class)` -> `ActorModifierCoreBase` [classmethod] — Returns the first modifier of a specified class in the stack
  - `find_modifier_by_name(modifier_stack, modifier_name)` -> `ActorModifierCoreBase` [classmethod] — Returns the first modifier with specified name in the stack
  - `find_modifier_of_class(modifier_stack: ActorModifierCoreStack, modifier_class: Class)` -> `ActorModifierCoreBase` [classmethod] — deprecated: âfind_modifier_of_classâ was renamed to âfind_modifier_by_classâ.
  - `find_modifier_stack(actor, create_if_none = False)` -> `ActorModifierCoreStack or None` [classmethod] — Retrieves the modifier stack or create one if none is found
  - `find_modifiers_by_class(modifier_stack, modifier_class)` -> `Array [ ActorModifierCoreBase ]` [classmethod] — Finds all modifiers with specified class in the stack
  - `find_modifiers_by_name(modifier_stack, modifier_name)` -> `Array [ ActorModifierCoreBase ]` [classmethod] — Finds all modifiers with specified class in the stack
  - `get_available_modifiers()` -> `Set[type(Class)] or None` [classmethod] — Gets all available modifier classes registered
  - `get_dependent_modifiers(modifier)` -> `Set[ActorModifierCoreBase] or None` [classmethod] — Retrieves all modifiers found after this one that depends on this modifier
  - `get_modifier_actor(modifier)` -> `Actor or None` [classmethod] — Retrieves the actor modified by a modifier
  - `get_modifier_categories()` -> `Set[Name] or None` [classmethod] — Retrieves the modifier categories available
  - `get_modifier_category(modifier)` -> `Name or None` [classmethod] — Retrieves the modifier category of an existing modifier
  - `get_modifier_category_by_class(modifier_class)` -> `Name or None` [classmethod] — Retrieves the modifier category from a modifier class
  - `get_modifier_class(modifier_name)` -> `type(Class) or None` [classmethod] — Retrieves the modifier class from a modifier name
  - `get_modifier_name(modifier)` -> `Name or None` [classmethod] — Retrieves the modifier name of an existing modifier
  - `get_modifier_name_by_class(modifier_class)` -> `Name or None` [classmethod] — Retrieves the modifier name from a modifier class
  - `get_modifier_stack(modifier)` -> `ActorModifierCoreStack or None` [classmethod] — Retrieves the modifier stack this modifier is in
  - `get_modifiers_by_category(category)` -> `Set[type(Class)] or None` [classmethod] — Retrieves the modifiers classes by a category
  - `get_required_modifiers(modifier)` -> `Set[ActorModifierCoreBase] or None` [classmethod] — Retrieves all modifiers found before this one that are required for this modifier
  - `get_stack_modifiers(modifier_stack)` -> `Array[ActorModifierCoreBase] or None` [classmethod] — Retrieves all modifiers from a modifier stack
  - `get_supported_modifiers(actor, context_position = ActorModifierCoreStackPosition.BEFORE, context_modifier = None)` -> `Set[type(Class)] or None` [classmethod] — Gets all modifier classes supported by this actor at a specific position
  - `insert_modifier(modifier_stack, operation)` -> `ActorModifierCoreBase or None` [classmethod] — Creates and insert a new modifier into a modifier stack
  - `is_modifier_enabled(modifier)` -> `bool or None` [classmethod] — Checks the state of an existing modifier
  - `move_modifier(modifier_stack, operation)` -> `bool` [classmethod] — Moves an existing modifier into a modifier stack
  - `remove_modifier(modifier_stack, operation)` -> `bool` [classmethod] — Removes an existing modifier from a modifier stack
  - `set_modifier_metadata_category(metadata, metadata=ActorModifierCoreMetadata)` [classmethod] — Sets the modifier metadata category
  - `set_modifier_metadata_compatibility_rule(metadata, metadata=ActorModifierCoreMetadata)` [classmethod] — Sets the modifier metadata compatibility rule
  - `set_modifier_metadata_description(metadata, metadata=ActorModifierCoreMetadata)` [classmethod] — Sets the modifier metadata description (EDITOR-ONLY)
  - `set_modifier_metadata_display_name(metadata, metadata=ActorModifierCoreMetadata)` [classmethod] — Sets the modifier metadata display name (EDITOR-ONLY)
  - `set_modifier_metadata_name(metadata, metadata=ActorModifierCoreMetadata)` [classmethod] — Sets the modifier metadata name

### `unreal.ActorModifierCoreSharedActor`
Inherits: `Actor` | Header: `ActorModifierCoreSharedActor.h`

Singleton actor used to keep all shared data across modifiers instances, there can only be one per level, should not be visible to user Use the modifier subsystem to query objects, do not handle it di...

### `unreal.ActorModifierCoreStack`
Inherits: `ActorModifierCoreBase` | Header: `ActorModifierCoreStack.h`

A modifier stack contains modifiers and is also a modifier by itself

### `unreal.ActorModifierCoreDisableReason`
Inherits: `EnumBase` | Header: `ActorModifierCoreDefs.h`

EActor Modifier Core Disable Reason

**Properties** (3):
  - `DESTROYED`: `ActorModifierCoreDisableReason = Ellipsis` — Modifier disabled by actor destroyed 2
  - `UNDO`: `ActorModifierCoreDisableReason = Ellipsis` — Modifier disabled by undo 1
  - `USER`: `ActorModifierCoreDisableReason = Ellipsis` — Modifier disabled by user 0

### `unreal.ActorModifierCoreEnableReason`
Inherits: `EnumBase` | Header: `ActorModifierCoreDefs.h`

EActor Modifier Core Enable Reason

**Properties** (4):
  - `DUPLICATE`: `ActorModifierCoreEnableReason = Ellipsis` — Modifier added by duplicate 3
  - `LOAD`: `ActorModifierCoreEnableReason = Ellipsis` — Modifier added by load 1
  - `UNDO`: `ActorModifierCoreEnableReason = Ellipsis` — Modifier added by undo 2
  - `USER`: `ActorModifierCoreEnableReason = Ellipsis` — Modifier added by user 0

### `unreal.ActorModifierCoreStackPosition`
Inherits: `EnumBase` | Header: `ActorModifierCoreDefs.h`

Enumerates valid positions for modifier operations

**Properties** (2):
  - `AFTER`: `ActorModifierCoreStackPosition = Ellipsis` — 1
  - `BEFORE`: `ActorModifierCoreStackPosition = Ellipsis` — 0

### `unreal.ModifierCompatibilityRule`
Inherits: `DelegateBase` | Header: `ActorModifierCoreDefs.h`

Modifier Compatibility Rule Delegate Signature
