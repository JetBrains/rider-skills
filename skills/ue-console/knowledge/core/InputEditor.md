# UE Python API — InputEditor Module

**6 types** from the `InputEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `EnhancedInputEditorSubsystem`, `InputAction_Factory`, `InputMappingContext_Factory`, `MockInputUserSettings`, `PlayerMappableInputConfig_Factory`, `TestMappableKeysAction`

---

## Classes

### `unreal.EnhancedInputEditorSubsystem`
Inherits: `EditorSubsystem` | Header: `EnhancedInputEditorSubsystem.h`

The Enhanced Input Editor Subsystem can be used to process input outside of PIE within the editor. Calling StartConsumingInput will allow the input preprocessor to drive Input Action delegates to be f...

**Methods** (31):
  - `add_mapping_context(mapping_context, priority, options = [True,False,False])` -> `None` — Add a control mapping context.
  - `add_tag_to_input_mode(tag_to_add, options = [True,False,False])` -> `None` — Adds the given âTagToAddâ to the current input mode tag container and triggers a rebuild of control mappings.
  - `append_tags_to_input_mode(tags_to_add, options = [True,False,False])` -> `None` — Appends the given âTagsToAddâ to the current input mode tag container and triggers a rebuild of control mappings.
  - `clear_all_mappings()` -> `None` — Remove all applied mapping contexts.
  - `get_all_player_mappable_action_key_mappings()` -> `Array [ EnhancedActionKeyMapping ]` — Get an array of the currently applied key mappings that are marked as Player Mappable.
  - `get_input_mode()` -> `GameplayTagContainer` — Returns the current input mode set on Enhanced Input. This mode will control what mappings are currently being processed...
  - `get_user_settings()` -> `EnhancedInputUserSettings` — Get User Settings
  - `has_mapping_context(mapping_context)` -> `int32 or None` — Check if a mapping context is applied to this subsystemâs owner.
  - `inject_input_for_action(action, raw_value, modifiers, triggers)` -> `None` — Input simulation via injection. Runs modifiers and triggers delegates as if the input had come through the underlying in...
  - `inject_input_for_player_mapping(mapping_name, raw_value, modifiers, triggers)` -> `None` — Input simulation via injection. Runs modifiers and triggers delegates as if the input had come through the underlying in...
  - `inject_input_vector_for_action(action, value, modifiers, triggers)` -> `None` — Input simulation via injection. Runs modifiers and triggers delegates as if the input had come through the underlying in...
  - `inject_input_vector_for_player_mapping(mapping_name, value, modifiers, triggers)` -> `None` — Input simulation via injection. Runs modifiers and triggers delegates as if the input had come through the underlying in...
  - `is_consuming_input()` -> `bool` — Returns true if this subsystem is currently consuming input
  - `pop_input_component(input_component)` -> `bool` — Removes this input component onto the stack to be processed by this subsystemâs tick function
  - `push_input_component(input_component)` -> `None` — Pushes this input component onto the stack to be processed by this subsystemâs tick function
  - `query_keys_mapped_to_action(action)` -> `Array [ Key ]` — Returns the keys mapped to the given action in the active input mapping contexts.
  - `query_map_key_in_active_context_set()` — = DefaultMappingIssues::StandardFatal
  - `query_map_key_in_context_set()` — = DefaultMappingIssues::StandardFatal
  - `remove_mapping_context(mapping_context, options = [True,False,False])` -> `None` — Remove a specific control context. This is safe to call even if the context is not applied.
  - `remove_tag_from_input_mode(tag_to_remove, options = [True,False,False])` -> `None` — Removes the given tag from the current input mode and triggers a rebuild of control mappings.
  - `remove_tags_from_input_mode(tags_to_remove, options = [True,False,False])` -> `None` — Removes tags from the current input mode and triggers a rebuild of control mappings.
  - `request_rebuild_control_mappings(options = [True,False,False], rebuild_type = InputMappingRebuildType.REBUILD)` -> `None` — Flag player for reapplication of all mapping contexts at the end of this frame. This is called automatically when adding...
  - `set_input_mode(new_mode, options = [True,False,False])` -> `None` — Sets the current input mode on the player and triggers a rebuild of control mappings.
  - `start_consuming_input()` -> `None` — Start the consumption of input messages in this subsystem. This is required to have any Input Action delegates be fired.
  - `start_continuous_input_injection_for_action(action, raw_value, modifiers, triggers)` -> `None` — Starts simulation of input via injection. This injects the given input every tick until it is stopped with StopContinuou...
  - `start_continuous_input_injection_for_player_mapping(mapping_name, raw_value, modifiers, triggers)` -> `None` — Starts simulation of input via injection. This injects the given input every tick until it is stopped with StopContinuou...
  - `stop_consuming_input()` -> `None` — Tells this subsystem to stop ticking and consuming any input. This will stop any Input Action Delegates from being calle...
  - `stop_continuous_input_injection_for_action(action)` -> `None` — Stops continuous input injection for the given action.
  - `stop_continuous_input_injection_for_player_mapping(mapping_name)` -> `None` — Stops continuous input injection for the given player mapping name.
  - `update_value_of_continuous_input_injection_for_action(action, raw_value)` -> `None` — Update the value of a continuous input injection, preserving the state of triggers and modifiers.
  - `update_value_of_continuous_input_injection_for_player_mapping(mapping_name, raw_value)` -> `None` — Update the value of a continuous input injection for the given player mapping name, preserving the state of triggers and...

### `unreal.InputAction_Factory`
Inherits: `Factory` | Header: `InputEditorModule.h`

Input Action Factory

### `unreal.InputMappingContext_Factory`
Inherits: `Factory` | Header: `InputEditorModule.h`

Asset factories

### `unreal.MockInputUserSettings`
Inherits: `EnhancedInputUserSettings` | Header: `InputTestFramework.h`

Mock Input User Settings

### `unreal.PlayerMappableInputConfig_Factory`
Inherits: `Factory` | Header: `InputEditorModule.h`

Player Mappable Input Config Factory

### `unreal.TestMappableKeysAction`
Inherits: `InputAction` | Header: `InputTestFramework.h`

A subclass of UInputAction that will have itâs player mappable key settings object set automatically so we can test re-mappable keys.
