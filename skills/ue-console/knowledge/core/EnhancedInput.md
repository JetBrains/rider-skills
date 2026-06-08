# UE Python API — EnhancedInput Module

**75 types** from the `EnhancedInput` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `EnhancedActionKeyMapping`, `InputActionInstance`, `InputActionValue`, `InputCancelAction`, `InputComboStepData`, `KeyMappingRow`, `MappingQueryIssue`, `MapPlayerKeyArgs`, `ModifyContextOptions`, `PlayerKeyMapping`, `PlayerMappableKeyProfileCreationArgs`, `PlayerMappableKeyQueryOptions`, `EnhancedInputComponent`, `EnhancedInputLibrary`, `EnhancedInputLocalPlayerSubsystem`, `EnhancedInputPlatformData`, `EnhancedInputSubsystemInterface`, `EnhancedInputUserSettings`, `EnhancedInputWorldSubsystem`, `EnhancedPlayerInput`, ... (75 total)

---

## Classes

### `unreal.EnhancedActionKeyMapping`
Inherits: `StructBase` | Header: `EnhancedActionKeyMapping.h`

Defines a mapping between a key activation and the resulting enhanced action An key could be a button press, joystick axis movement, etc. An enhanced action could be MoveForward, Jump, Fire, etc.

**Properties** (4):
  - `action`: `InputAction` — [Read-Write] Action to be affected by the key (InputAction)
  - `key`: `Key` — [Read-Write] Key that affect the action. (Key)
  - `modifiers`: `None` — [Read-Write] Modifiers applied to the raw key value.
These are applied sequentially in array order. ...
  - `triggers`: `None` — [Read-Write] Trigger qualifiers. If any trigger qualifiers exist the mapping will not trigger unless...

### `unreal.InputActionInstance`
Inherits: `StructBase` | Header: `InputAction.h`

Run time queryable action instance Generated from UInputAction templates above

**Properties** (7):
  - `elapsed_processed_time`: `float` [Read-Only] — [Read-Only] Total trigger processing/evaluation time (How long this action has been in event Started...
  - `elapsed_triggered_time`: `float` [Read-Only] — [Read-Only] Triggered time (How long this action has been in event Triggered only) (float)
  - `last_triggered_world_time`: `float` [Read-Only] — [Read-Only] The last time that this evaluated to a Triggered State (float)
  - `modifiers`: `None` [Read-Only] — [Read-Only] (Array[InputModifier])
  - `source_action`: `InputAction` [Read-Only] — [Read-Only] The source action that this instance is created from (InputAction)
  - `trigger_event`: `TriggerEvent` [Read-Only] — [Read-Only] Trigger state (TriggerEvent)
  - `triggers`: `None` [Read-Only] — [Read-Only] (Array[InputTrigger])

### `unreal.InputActionValue`
Inherits: `StructBase` | Header: `InputActionValue.h`

Input Action Value

### `unreal.InputCancelAction`
Inherits: `StructBase` | Header: `InputTriggers.h`

Input Cancel Action

**Properties** (2):
  - `cancel_action`: `InputAction` — [Read-Write] The action that must be completed (according to Cancellation States) to cancel the comb...
  - `cancellation_states`: `int` — [Read-Write] Trigger events for this action that will cancel the combo - what events from this actio...

### `unreal.InputComboStepData`
Inherits: `StructBase` | Header: `InputTriggers.h`

Input Combo Step Data

**Properties** (3):
  - `combo_step_action`: `InputAction` — [Read-Write] The action that must be completed (according to Combo Step Completion States) to progre...
  - `combo_step_completion_states`: `int` — [Read-Write] Trigger events that will complete this step - what events from this action should progr...
  - `time_to_press_key`: `float` — [Read-Write] Time to press the key before combo is cancelled - starts once the previous step in the ...

### `unreal.KeyMappingRow`
Inherits: `StructBase` | Header: `EnhancedInputUserSettings.h`

Stores all mappings bound to a single mapping name.

**Properties** (1):
  - `mappings`: `None` [Read-Only] — [Read-Only] (Set[PlayerKeyMapping])

### `unreal.MappingQueryIssue`
Inherits: `StructBase` | Header: `InputMappingQuery.h`

Potential issue raised with a mapping request

**Properties** (3):
  - `blocking_action`: `InputAction` [Read-Only] — [Read-Only] Action within the input context that caused the blockage (InputAction)
  - `blocking_context`: `InputMappingContext` [Read-Only] — [Read-Only] Input context that contains a blocking action bound to the queried key (InputMappingCont...
  - `issue`: `MappingQueryIssueFlag` [Read-Only] — [Read-Only] (MappingQueryIssueFlag)

### `unreal.MapPlayerKeyArgs`
Inherits: `StructBase` | Header: `EnhancedInputUserSettings.h`

Arguments that can be used when mapping a player key

**Properties** (8):
  - `create_matching_slot_if_needed`: `bool` — [Read-Write] If there is not a player mapping already with the same Slot and Hardware Device ID, the...
  - `defer_on_settings_changed_broadcast`: `bool` — [Read-Write] Defers setting changed delegates until the next frame if set to true. (bool)
  - `hardware_device_id`: `Name` — [Read-Write] An OPTIONAL specifier about what kind of hardware this mapping is for. (Name)
  - `mapping_name`: `Name` — [Read-Write] The name of the mapping for this key. This is either the default mapping name from an I...
  - `new_key`: `Key` — [Read-Write] The new Key that this should be mapped to (Key)
  - `profile_id`: `GameplayTag` — [Read-Write]
deprecated: Use ProfileIdString instead. (GameplayTag)
  - `profile_id_string`: `str` — [Read-Write] The Key Mapping Profile identifier that this mapping should be set on. If this is empty...
  - `slot`: `PlayerMappableKeySlot` — [Read-Write] What slot this key mapping is for (PlayerMappableKeySlot)

### `unreal.ModifyContextOptions`
Inherits: `StructBase` | Header: `EnhancedInputSubsystemInterface.h`

Passed in as params for Adding/Remove input contexts

**Properties** (3):
  - `force_immediately`: `bool` — [Read-Write] The mapping changes will be applied synchronously, rather than at the end of the frame,...
  - `ignore_all_pressed_keys_until_release`: `bool` — [Read-Write] If true, then any keys that are âdownâ or âpressedâ during the rebuild of contr...
  - `notify_user_settings`: `bool` — [Read-Write] If true, then this Mapping Context will be registered or unregistered with the
Enhanced...

### `unreal.PlayerKeyMapping`
Inherits: `StructBase` | Header: `EnhancedInputUserSettings.h`

Represents a single key mapping that is set by the player

**Properties** (10):
  - `associated_input_action`: `InputAction` [Read-Only] — [Read-Only]
deprecated: This property is deprecated, use AssociatedInputActionSoft instead. (InputAc...
  - `associated_input_action_soft`: `InputAction` [Read-Only] — [Read-Only] The input action associated with this player key mapping (InputAction)
  - `current_key`: `Key` [Read-Only] — [Read-Only] The key that the player has mapped to (Key)
  - `default_key`: `Key` [Read-Only] — [Read-Only] The default key that this mapping was set to in its input mapping context (Key)
  - `display_category`: `Text` [Read-Only] — [Read-Only] Localized display category of this mapping (Text)
  - `display_name`: `Text` [Read-Only] — [Read-Only] Localized display name of this mapping (Text)
  - `hardware_device_id`: `HardwareDeviceIdentifier` [Read-Only] — [Read-Only] An optional Hardware Device specifier for this mapping (HardwareDeviceIdentifier)
  - `is_dirty`: `bool` [Read-Only] — [Read-Only] True if this key mapping is dirty (i.e. has been changed by the player) (bool)
  - `mapping_name`: `Name` [Read-Only] — [Read-Only] The name of the mapping for this key (Name)
  - `slot`: `PlayerMappableKeySlot` [Read-Only] — [Read-Only] What slot this key is mapped to (PlayerMappableKeySlot)

### `unreal.PlayerMappableKeyProfileCreationArgs`
Inherits: `StructBase` | Header: `EnhancedInputUserSettings.h`

Arguments that can be used when creating a new mapping profile

**Properties** (6):
  - `display_name`: `Text` — [Read-Write] The display name of this profile (Text)
  - `profile_identifier`: `GameplayTag` — [Read-Write]
deprecated: Use ProfileStringIdentifier instead. (GameplayTag)
  - `profile_string_identifier`: `str` — [Read-Write] The unique identifier that this profile should have (str)
  - `profile_type`: `Class` — [Read-Write] (type(Class))
  - `set_as_current_profile`: `bool` — [Read-Write] (bool)
  - `user_id`: `PlatformUserId` — [Read-Write] The user ID of the ULocalPlayer that this profile is associated with (PlatformUserId)

### `unreal.PlayerMappableKeyQueryOptions`
Inherits: `StructBase` | Header: `EnhancedInputUserSettings.h`

Options when querying what keys are mapped to a specific action on the player mappable key profile.

**Properties** (7):
  - `key_to_match`: `Key` — [Read-Write] If specified, then this key will be used to match against when checking if the key type...
  - `mapping_name`: `Name` — [Read-Write] The mapping name to search for (Name)
  - `match_basic_key_types`: `bool` — [Read-Write] If true, then only keys that have the same value for IsGamepadKey, IsTouch, and IsGestu...
  - `match_key_axis_type`: `bool` — [Read-Write] If true, then only keys that have the same value of IsAxis1D, IsAxis2D, and IsAxis3D wi...
  - `required_device_flags`: `int` — [Read-Write] If set, then only player mappings whose Hardware Device Identifier that has the same fl...
  - `required_device_type`: `HardwareDevicePrimaryType` — [Read-Write] If set, then only player mappings whose hardware device identifier that has the same pr...
  - `slot_to_match`: `PlayerMappableKeySlot` — [Read-Write] The key slot that will be required to match if set. By default this is EPlayerMappableK...

### `unreal.EnhancedInputComponent`
Inherits: `InputComponent` | Header: `EnhancedInputComponent.h`

Implement an Actor component for input bindings.

### `unreal.EnhancedInputLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `EnhancedInputLibrary.h`

Enhanced Input Library

**Methods** (7):
  - `conv_input_action_value_to_string(action_value)` -> `str` [classmethod] — Converts a FInputActionValue to a string
  - `conv_trigger_event_value_to_string(trigger_event)` -> `str` [classmethod] — Converts an ETriggerEvent to a string
  - `flush_player_input(player_controller)` -> `None` [classmethod] — Flushes the player controllerâs pressed keys see: APlayerController::FlushPressedKeys
  - `get_mapping_name(action_key_mapping)` -> `Name` [classmethod] — Returns the name of the mapping based on setting behavior used. If no name is found in the Mappable Key Settings it will...
  - `get_player_mappable_key_settings(action_key_mapping)` -> `PlayerMappableKeySettings` [classmethod] — Returns the Player Mappable Key Settings owned by the Action Key Mapping or by the referenced Input Action, or nothing b...
  - `is_action_key_mapping_player_mappable(action_key_mapping)` -> `bool` [classmethod] — Returns true if this Action Key Mapping either holds a Player Mappable Key Settings or is set bIsPlayerMappable.
  - `request_rebuild_control_mappings_using_context(context, force_immediately = False)` -> `None` [classmethod] — Flag all enhanced input subsystems making use of the mapping context for reapplication of all control mappings at the en...

### `unreal.EnhancedInputLocalPlayerSubsystem`
Inherits: `LocalPlayerSubsystem` | Header: `EnhancedInputSubsystems.h`

Per local player input subsystem

**Methods** (26):
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
  - `query_keys_mapped_to_action(action)` -> `Array [ Key ]` — Returns the keys mapped to the given action in the active input mapping contexts.
  - `query_map_key_in_active_context_set()` — = DefaultMappingIssues::StandardFatal
  - `query_map_key_in_context_set()` — = DefaultMappingIssues::StandardFatal
  - `remove_mapping_context(mapping_context, options = [True,False,False])` -> `None` — Remove a specific control context. This is safe to call even if the context is not applied.
  - `remove_tag_from_input_mode(tag_to_remove, options = [True,False,False])` -> `None` — Removes the given tag from the current input mode and triggers a rebuild of control mappings.
  - `remove_tags_from_input_mode(tags_to_remove, options = [True,False,False])` -> `None` — Removes tags from the current input mode and triggers a rebuild of control mappings.
  - `request_rebuild_control_mappings(options = [True,False,False], rebuild_type = InputMappingRebuildType.REBUILD)` -> `None` — Flag player for reapplication of all mapping contexts at the end of this frame. This is called automatically when adding...
  - `set_input_mode(new_mode, options = [True,False,False])` -> `None` — Sets the current input mode on the player and triggers a rebuild of control mappings.
  - `start_continuous_input_injection_for_action(action, raw_value, modifiers, triggers)` -> `None` — Starts simulation of input via injection. This injects the given input every tick until it is stopped with StopContinuou...
  - `start_continuous_input_injection_for_player_mapping(mapping_name, raw_value, modifiers, triggers)` -> `None` — Starts simulation of input via injection. This injects the given input every tick until it is stopped with StopContinuou...
  - `stop_continuous_input_injection_for_action(action)` -> `None` — Stops continuous input injection for the given action.
  - `stop_continuous_input_injection_for_player_mapping(mapping_name)` -> `None` — Stops continuous input injection for the given player mapping name.
  - `update_value_of_continuous_input_injection_for_action(action, raw_value)` -> `None` — Update the value of a continuous input injection, preserving the state of triggers and modifiers.
  - `update_value_of_continuous_input_injection_for_player_mapping(mapping_name, raw_value)` -> `None` — Update the value of a continuous input injection for the given player mapping name, preserving the state of triggers and...

**Properties** (3):
  - `control_mappings_rebuilt_delegate`: `OnControlMappingsRebuilt` — [Read-Write] Blueprint Event that is called at the end of any frame that Control Mappings have been ...
  - `on_mapping_context_added`: `OnMappingContextAdded` — [Read-Write] * A callback fired when a mapping context is added (AddMappingContext is called on this...
  - `on_mapping_context_removed`: `OnMappingContextRemoved` — [Read-Write] * A callback fired when a mapping context is removed (RemoveMappingContext is called on...

### `unreal.EnhancedInputPlatformData`
Inherits: `Object` | Header: `EnhancedInputPlatformSettings.h`

A base class that can be used to store platform specific data for Enhanced Input.

**Methods** (1):
  - `get_context_redirect(context)` -> `InputMappingContext` — Returns a pointer to the desired redirect mapping context. If there isnât one, then this returns InContext.

**Properties** (1):
  - `mapping_context_redirects`: `None` [Read-Only] — [Read-Only] Maps one Input Mapping Context to another. This can be used to replace
specific Input Ma...

### `unreal.EnhancedInputSubsystemInterface`
Inherits: `Interface` | Header: `EnhancedInputSubsystemInterface.h`

Enhanced Input Subsystem Interface

**Methods** (26):
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
  - `query_keys_mapped_to_action(action)` -> `Array [ Key ]` — Returns the keys mapped to the given action in the active input mapping contexts.
  - `query_map_key_in_active_context_set()` — = DefaultMappingIssues::StandardFatal
  - `query_map_key_in_context_set()` — = DefaultMappingIssues::StandardFatal
  - `remove_mapping_context(mapping_context, options = [True,False,False])` -> `None` — Remove a specific control context. This is safe to call even if the context is not applied.
  - `remove_tag_from_input_mode(tag_to_remove, options = [True,False,False])` -> `None` — Removes the given tag from the current input mode and triggers a rebuild of control mappings.
  - `remove_tags_from_input_mode(tags_to_remove, options = [True,False,False])` -> `None` — Removes tags from the current input mode and triggers a rebuild of control mappings.
  - `request_rebuild_control_mappings(options = [True,False,False], rebuild_type = InputMappingRebuildType.REBUILD)` -> `None` — Flag player for reapplication of all mapping contexts at the end of this frame. This is called automatically when adding...
  - `set_input_mode(new_mode, options = [True,False,False])` -> `None` — Sets the current input mode on the player and triggers a rebuild of control mappings.
  - `start_continuous_input_injection_for_action(action, raw_value, modifiers, triggers)` -> `None` — Starts simulation of input via injection. This injects the given input every tick until it is stopped with StopContinuou...
  - `start_continuous_input_injection_for_player_mapping(mapping_name, raw_value, modifiers, triggers)` -> `None` — Starts simulation of input via injection. This injects the given input every tick until it is stopped with StopContinuou...
  - `stop_continuous_input_injection_for_action(action)` -> `None` — Stops continuous input injection for the given action.
  - `stop_continuous_input_injection_for_player_mapping(mapping_name)` -> `None` — Stops continuous input injection for the given player mapping name.
  - `update_value_of_continuous_input_injection_for_action(action, raw_value)` -> `None` — Update the value of a continuous input injection, preserving the state of triggers and modifiers.
  - `update_value_of_continuous_input_injection_for_player_mapping(mapping_name, raw_value)` -> `None` — Update the value of a continuous input injection for the given player mapping name, preserving the state of triggers and...

### `unreal.EnhancedInputUserSettings`
Inherits: `SaveGame` | Header: `EnhancedInputUserSettings.h`

The Enhanced Input User Settings class is a place where you can put all of your Input Related settings that you want your user to be able to change. Things like their key mappings, aim sensitivity, ac...

**Methods** (23):
  - `apply_settings()` -> `None` — Apply any custom input settings to your user. By default, this will just broadcast the OnSettingsApplied delegate which ...
  - `async_save_settings()` -> `None` — Asynchronously save the settings to a hardcoded save game slot. This will work for simple games, but if you need to inte...
  - `create_new_key_profile(args)` -> `EnhancedPlayerMappableKeyProfile` — Creates a new profile with this name and type.
  - `find_mappings_in_row(mapping_name)` -> `Set [ PlayerKeyMapping ]` — Returns a set of all player key mappings for the given mapping name.
  - `get_active_key_profile()` -> `EnhancedPlayerMappableKeyProfile` — Get the currently active key profile that the user has set
  - `get_active_key_profile_id()` -> `str` — Gets the currently selected key profile
  - `get_current_key_profile()` -> `EnhancedPlayerMappableKeyProfile` — deprecated: âget_current_key_profileâ was renamed to âget_active_key_profileâ.
  - `get_current_key_profile_identifier()` -> `str` — deprecated: âget_current_key_profile_identifierâ was renamed to âget_active_key_profile_idâ.
  - `get_key_profile_with_id(profile_id)` -> `EnhancedPlayerMappableKeyProfile` — Get Key Profile with Id
  - `get_key_profile_with_identifier(profile_id: str)` -> `EnhancedPlayerMappableKeyProfile` — deprecated: âget_key_profile_with_identifierâ was renamed to âget_key_profile_with_idâ.
  - `is_mapping_context_registered(imc)` -> `bool` — Returns true if this mapping context is currently registered with the settings
  - `map_player_key(args)` -> `GameplayTagContainer` — Sets the player mapped key on the current key profile.
  - `register_input_mapping_context(imc)` -> `bool` — Registers this mapping context with the user settings. This will iterate all the key mappings in the context and create ...
  - `register_input_mapping_contexts(mapping_contexts)` -> `bool` — Registers multiple mapping contexts with the settings
  - `reset_all_player_keys_in_row(args)` -> `GameplayTagContainer` — Resets each player mapped key to itâs default value from the Input Mapping Context that it was registered from. If a k...
  - `reset_key_profile_id_to_default(profile_id)` -> `GameplayTagContainer` — Resets the given key profile to default key mappings
  - `reset_key_profile_to_default(profile_id)` -> `GameplayTagContainer` — Reset Key Profile to Default
  - `save_settings()` -> `None` — Synchronously save the settings to a hardcoded save game slot. This will work for simple games, but if you need to integ...
  - `set_active_key_profile(profile_id)` -> `bool` — Changes the currently active key profile to the one with the given name. Returns true if the operation was successful.
  - `set_key_profile(profile_id: str)` -> `bool` — deprecated: âset_key_profileâ was renamed to âset_active_key_profileâ.
  - `un_map_player_key(args)` -> `GameplayTagContainer` — Unmaps a single player mapping that matches the given Mapping name, slot, and hardware device.
  - `unregister_input_mapping_context(imc)` -> `bool` — Removes this mapping context from the registered mapping contexts
  - `unregister_input_mapping_contexts(mapping_contexts)` -> `bool` — Removes multiple mapping contexts from the registered mapping contexts

**Properties** (3):
  - `current_profile_identifier`: `GameplayTag` — [Read-Write]
deprecated: Property âCurrentProfileIdentifierâ is deprecated. (GameplayTag)
  - `on_settings_applied`: `EnhancedInputUserSettingsApplied` — [Read-Write] (EnhancedInputUserSettingsApplied)
  - `on_settings_changed`: `EnhancedInputUserSettingsChanged` — [Read-Write] (EnhancedInputUserSettingsChanged)

### `unreal.EnhancedInputWorldSubsystem`
Inherits: `WorldSubsystem` | Header: `EnhancedInputSubsystems.h`

Per world input subsystem that allows you to bind input delegates to actors without an owning Player Controller. This should be used when an actor needs to receive input delegates but will never have ...

**Methods** (28):
  - `add_actor_input_component(actor)` -> `None` — Adds this Actorâs input component onto the stack to be processed by this subsystemâs tick function
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
  - `query_keys_mapped_to_action(action)` -> `Array [ Key ]` — Returns the keys mapped to the given action in the active input mapping contexts.
  - `query_map_key_in_active_context_set()` — = DefaultMappingIssues::StandardFatal
  - `query_map_key_in_context_set()` — = DefaultMappingIssues::StandardFatal
  - `remove_actor_input_component(actor)` -> `bool` — Removes this Actorâs input component from the stack to be processed by this subsystemâs tick function
  - `remove_mapping_context(mapping_context, options = [True,False,False])` -> `None` — Remove a specific control context. This is safe to call even if the context is not applied.
  - `remove_tag_from_input_mode(tag_to_remove, options = [True,False,False])` -> `None` — Removes the given tag from the current input mode and triggers a rebuild of control mappings.
  - `remove_tags_from_input_mode(tags_to_remove, options = [True,False,False])` -> `None` — Removes tags from the current input mode and triggers a rebuild of control mappings.
  - `request_rebuild_control_mappings(options = [True,False,False], rebuild_type = InputMappingRebuildType.REBUILD)` -> `None` — Flag player for reapplication of all mapping contexts at the end of this frame. This is called automatically when adding...
  - `set_input_mode(new_mode, options = [True,False,False])` -> `None` — Sets the current input mode on the player and triggers a rebuild of control mappings.
  - `start_continuous_input_injection_for_action(action, raw_value, modifiers, triggers)` -> `None` — Starts simulation of input via injection. This injects the given input every tick until it is stopped with StopContinuou...
  - `start_continuous_input_injection_for_player_mapping(mapping_name, raw_value, modifiers, triggers)` -> `None` — Starts simulation of input via injection. This injects the given input every tick until it is stopped with StopContinuou...
  - `stop_continuous_input_injection_for_action(action)` -> `None` — Stops continuous input injection for the given action.
  - `stop_continuous_input_injection_for_player_mapping(mapping_name)` -> `None` — Stops continuous input injection for the given player mapping name.
  - `update_value_of_continuous_input_injection_for_action(action, raw_value)` -> `None` — Update the value of a continuous input injection, preserving the state of triggers and modifiers.
  - `update_value_of_continuous_input_injection_for_player_mapping(mapping_name, raw_value)` -> `None` — Update the value of a continuous input injection for the given player mapping name, preserving the state of triggers and...

### `unreal.EnhancedPlayerInput`
Inherits: `PlayerInput` | Header: `EnhancedPlayerInput.h`

UEnhancedPlayerInput : UPlayerInput extensions for enhanced player input system

### `unreal.EnhancedPlayerMappableKeyProfile`
Inherits: `Object` | Header: `EnhancedInputUserSettings.h`

Represents one âProfileâ that a user can have for their player mappable keys

**Methods** (14):
  - `does_mapping_pass_query_options(player_mapping, options)` -> `bool` — Returns true if the given player key mapping passes the query filter provided.
  - `dump_profile_to_log()` -> `None` — A helper function to print out all the current profile settings to the log.
  - `get_mapped_keys_in_row()` — OUT
  - `get_mapping_names_for_key()` — OUT
  - `get_player_mapping_rows()` -> `Map [ Name , KeyMappingRow ]` — Get all known key mappings for this profile. This returns a map of âMapping Nameâ -> Player Mappings to that name
  - `get_profile_display_name()` -> `Text` — Get the localized display name for this profile
  - `get_profile_id_string()` -> `str` — Get Profile Id String
  - `get_profile_identifer()` -> `str` — deprecated: âget_profile_identiferâ was renamed to âget_profile_id_stringâ.
  - `k2_find_key_mapping(args)` -> `PlayerKeyMapping` — K2 Find Key Mapping
  - `query_player_mapped_keys()` — OUT
  - `reset_mapping_to_default(mapping_name)` -> `None` — Resets every player key mapping to this mapping back to itâs default value
  - `reset_to_default()` -> `None` — Resets all the key mappings in this profile to their default value from their Input Mapping Context.
  - `set_display_name(new_display_name)` -> `None` — Set Display Name
  - `to_string()` -> `str` — Returns a string that can be used to debug the current key mappings.

**Properties** (5):
  - `display_name`: `Text` — [Read-Write] The localized display name of this profile (Text)
  - `owning_user_id`: `PlatformUserId` [Read-Only] — [Read-Only] The platform user id of the owning Local Player of this profile. (PlatformUserId)
  - `player_mapped_keys`: `None` [Read-Only] — [Read-Only] A map of âMapping Row Nameâ to all key mappings associated with it.
Note: Dirty mapp...
  - `profile_identifier`: `GameplayTag` — [Read-Write]
deprecated: Use ProfileIdentifierString (GameplayTag)
  - `profile_identifier_string`: `str` [Read-Only] — [Read-Only] The ID of this profile. This can be used by each Key Mapping to filter down which profil...

### `unreal.InputAction`
Inherits: `DataAsset` | Header: `InputAction.h`

An Input Action is a logical representation of something the user can do, such as âJumpâ or âCrouchâ. These are what your gameplay code binds to in order to listen for input state changes. For...

**Properties** (11):
  - `accumulation_behavior`: `InputActionAccumulationBehavior` [Read-Only] — [Read-Only] This defines how the value of this input action will be calcuated in the case that there...
  - `action_description`: `Text` [Read-Only] — [Read-Only] A localized descriptor of this input action (Text)
  - `consume_input`: `bool` — [Read-Write] Should this action swallow any inputs bound to it or allow them to pass through to affe...
  - `consumes_action_and_axis_mappings`: `bool` — [Read-Write] Should this Input Action consume any legacy Action and Axis key mappings?
If true, then...
  - `modifiers`: `None` — [Read-Write] Modifiers are applied to the final action value.
These are applied sequentially in arra...
  - `player_mappable_key_settings`: `PlayerMappableKeySettings` — [Read-Write] Holds setting information about this Action Input for setting screen and save purposes....
  - `reserve_all_mappings`: `bool` [Read-Only] — It is the responsibility of the author of the mapping code to enforce this! (bool) [Read-Only] This ...
  - `trigger_events_that_consume_legacy_keys`: `int` — [Read-Write] A bitmask of trigger events that, when reached, will consume any FKeys mapped to this i...
  - `trigger_when_paused`: `bool` [Read-Only] — [Read-Only] Should this action be able to trigger whilst the game is paused - Replaces bExecuteWhenP...
  - `triggers`: `None` — [Read-Write] Trigger qualifiers. If any trigger qualifiers exist the action will not trigger unless:...
  - `value_type`: `InputActionValueType` [Read-Only] — [Read-Only] The type that this action returns from a GetActionValue query or action event (InputActi...

### `unreal.InputMappingContext`
Inherits: `DataAsset` | Header: `InputMappingContext.h`

UInputMappingContext : A collection of key to action mappings for a specific input context Could be used to:

**Methods** (4):
  - `map_key(action, to_key)` -> `EnhancedActionKeyMapping` — Map a key to an action within the mapping context.
  - `unmap_all()` -> `None` — Unmap everything within the mapping context.
  - `unmap_all_keys_from_action(action)` -> `None` — Unmap all key maps to an action within the mapping context.
  - `unmap_key(action, key)` -> `None` — Unmap a key from an action within the mapping context.

**Properties** (5):
  - `context_description`: `Text` [Read-Only] — [Read-Only] Localized context descriptor (Text)
  - `input_mode_filter_options`: `MappingContextInputModeFilterOptions` [Read-Only] — [Read-Only] Defines how this input mapping context should be filtered based on the current input mod...
  - `input_mode_query_override`: `GameplayTagQuery` [Read-Only] — [Read-Only] Tag Query which will be matched against the current Enhanced Input Subsystemâs input m...
  - `mappings`: `None` [Read-Only] — [Read-Only] List of key to action mappings. (Array[EnhancedActionKeyMapping])
  - `registration_tracking_mode`: `MappingContextRegistrationTrackingMode` [Read-Only] — [Read-Only] Select the behaviour when multiple AddMappingContext() calls are made for this Input Map...

### `unreal.InputModifier`
Inherits: `Object` | Header: `InputModifiers.h`

Base class for building modifiers.

**Methods** (2):
  - `get_visualization_color(sample_value, final_value)` -> `LinearColor` — Helper to allow debug visualization of the modifier.
  - `modify_raw(player_input, current_value, delta_time)` -> `InputActionValue` — ModifyRaw Will be called by each modifier in the modifier chain

### `unreal.InputModifierDeadZone`
Inherits: `InputModifier` | Header: `InputModifiers.h`

Dead Zone Input values within the range LowerThreshold -> UpperThreshold will be remapped from 0 -> 1. Values outside this range will be clamped.

**Properties** (3):
  - `lower_threshold`: `float` — [Read-Write] Threshold below which input is ignored
This value should always be lower then the Upper...
  - `type`: `DeadZoneType` — [Read-Write] (DeadZoneType)
  - `upper_threshold`: `float` — [Read-Write] Threshold above which input is clamped to 1 (float)

### `unreal.InputModifierFOVScaling`
Inherits: `InputModifier` | Header: `InputModifiers.h`

FOV Scaling Apply FOV dependent scaling to input values, per axis

**Properties** (2):
  - `fov_scale`: `float` — [Read-Write] Extra scalar applied on top of basic FOV scaling. (float)
  - `fov_scaling_type`: `FOVScalingType` — [Read-Write] (FOVScalingType)

### `unreal.InputModifierNegate`
Inherits: `InputModifier` | Header: `InputModifiers.h`

Negate Inverts input per axis

**Properties** (3):
  - `x`: `bool` — [Read-Write] (bool)
  - `y`: `bool` — [Read-Write] (bool)
  - `z`: `bool` — [Read-Write] (bool)

### `unreal.InputModifierResponseCurveExponential`
Inherits: `InputModifier` | Header: `InputModifiers.h`

Response Curve Exponential Apply a simple exponential response curve to input values, per axis

**Properties** (1):
  - `curve_exponent`: `Vector` — [Read-Write] (Vector)

### `unreal.InputModifierResponseCurveUser`
Inherits: `InputModifier` | Header: `InputModifiers.h`

Response Curve User Defined Apply a custom response curve to input values, per axis

**Properties** (3):
  - `response_x`: `CurveFloat` — [Read-Write] (CurveFloat)
  - `response_y`: `CurveFloat` — [Read-Write] (CurveFloat)
  - `response_z`: `CurveFloat` — [Read-Write] (CurveFloat)

### `unreal.InputModifierScalar`
Inherits: `InputModifier` | Header: `InputModifiers.h`

Scalar Scales input by a set factor per axis

**Properties** (1):
  - `scalar`: `Vector` — [Read-Write] The scalar that will be applied to the input value. For example, if you have a scalar o...

### `unreal.InputModifierScaleByDeltaTime`
Inherits: `InputModifier` | Header: `InputModifiers.h`

Scalar Multiplies the input value by Delta Time this frame

### `unreal.InputModifierSmooth`
Inherits: `InputModifier` | Header: `InputModifiers.h`

Smooth Smooth inputs out over multiple frames

### `unreal.InputModifierSmoothDelta`
Inherits: `InputModifier` | Header: `InputModifiers.h`

Normalized Smooth Delta

**Properties** (3):
  - `easing_exponent`: `float` — [Read-Write] For ease functions, this controls the degree of the curve. This only affects the Interp...
  - `smoothing_method`: `NormalizeInputSmoothingType` — [Read-Write] (NormalizeInputSmoothingType)
  - `speed`: `float` — [Read-Write] Speed, or Alpha. If the speed given is 0, then jump to the target. (float)

### `unreal.InputModifierSwizzleAxis`
Inherits: `InputModifier` | Header: `InputModifiers.h`

Swizzle axis components of an input value. Useful to map a 1D input onto the Y axis of a 2D action.

**Properties** (1):
  - `order`: `InputAxisSwizzle` — [Read-Write] Default to XY swap, useful for binding 1D inputs to the Y axis. (InputAxisSwizzle)

### `unreal.InputModifierToWorldSpace`
Inherits: `InputModifier` | Header: `InputModifiers.h`

Input space to World space conversion Auto-converts axes within the Input Action Value into world space allowing the result to be directly plugged into functions that take world space values. E.g. For...

### `unreal.InputTrigger`
Inherits: `Object` | Header: `InputTriggers.h`

Base class for building triggers. Transitions to Triggered state once the input meets or exceeds the actuation threshold.

**Methods** (3):
  - `get_trigger_type()` -> `TriggerType`
  - `is_actuated(for_value)` -> `bool`
  - `update_state(player_input, modified_value, delta_time)` -> `TriggerState`

**Properties** (3):
  - `actuation_threshold`: `float` — [Read-Write] Point at which this trigger fires (float)
  - `last_value`: `InputActionValue` [Read-Only] — [Read-Only] Value passed to UpdateState on the previous tick. This will be updated automatically aft...
  - `should_always_tick`: `bool` [Read-Only] — [Read-Only] Decides whether this trigger ticks every frame or not.
* This WILL affect performance an...

### `unreal.InputTriggerChordAction`
Inherits: `InputTrigger` | Header: `InputTriggers.h`

UInputTriggerChordAction Applies a chord action that must be triggering for this triggerâs action to trigger

**Properties** (1):
  - `chord_action`: `InputAction` — [Read-Write] The action that must be triggering for this triggerâs action to trigger (InputAction)

### `unreal.InputTriggerChordBlocker`
Inherits: `InputTriggerChordAction` | Header: `InputTriggers.h`

### `unreal.InputTriggerCombo`
Inherits: `InputTrigger` | Header: `InputTriggers.h`

UInputTriggerCombo All actions in the combo array must be completed (based on combo completion event specified - triggered, completed, etc.) to trigger the action this trigger is on. Actions must also...

**Properties** (4):
  - `combo_actions`: `None` — [Read-Write] List of input actions that need to be completed (according to Combo Step Completion Sta...
  - `current_combo_step_index`: `int` [Read-Only] — [Read-Only] Keeps track of what action weâre currently at in the combo (int32)
  - `current_time_between_combo_steps`: `float` [Read-Only] — [Read-Only] Time elapsed between last combo InputAction trigger and current time (float)
  - `input_cancel_actions`: `None` — [Read-Write] Actions that will cancel the combo if they are completed (according to Cancellation Sta...

### `unreal.InputTriggerDown`
Inherits: `InputTrigger` | Header: `InputTriggers.h`

### `unreal.InputTriggerHold`
Inherits: `InputTriggerTimedBase` | Header: `InputTriggers.h`

**Properties** (2):
  - `hold_time_threshold`: `float` — [Read-Write] How long does the input have to be held to cause trigger? (float)
  - `is_one_shot`: `bool` — [Read-Write] Should this trigger fire only once, or fire every frame once the hold time threshold is...

### `unreal.InputTriggerHoldAndRelease`
Inherits: `InputTriggerTimedBase` | Header: `InputTriggers.h`

**Properties** (1):
  - `hold_time_threshold`: `float` — [Read-Write] How long does the input have to be held to cause trigger? (float)

### `unreal.InputTriggerPressed`
Inherits: `InputTrigger` | Header: `InputTriggers.h`

### `unreal.InputTriggerPulse`
Inherits: `InputTriggerTimedBase` | Header: `InputTriggers.h`

**Properties** (3):
  - `interval`: `float` — [Read-Write] How long between each trigger fire while input is held, in seconds? (float)
  - `trigger_limit`: `int` — [Read-Write] How many times can the trigger fire while input is held? (0 = no limit) (int32)
  - `trigger_on_start`: `bool` — [Read-Write] Whether to trigger when the input first exceeds the actuation threshold or wait for the...

### `unreal.InputTriggerReleased`
Inherits: `InputTrigger` | Header: `InputTriggers.h`

### `unreal.InputTriggerRepeatedTap`
Inherits: `InputTriggerTimedBase` | Header: `InputTriggers.h`

Fires the âTriggeredâ event upon a repeated taps of a key.

**Properties** (3):
  - `number_of_taps_which_trigger_repeat`: `int` — [Read-Write] The number of taps in a row it takes for this to be considered triggered. Note: To crea...
  - `repeat_delay`: `float` — [Read-Write] The max amount of time which can pass in between single taps that can pass and still be...
  - `tap_release_time_threshold`: `float` — [Read-Write] Release within this time-frame to trigger a tap (float)

### `unreal.InputTriggerTap`
Inherits: `InputTriggerTimedBase` | Header: `InputTriggers.h`

**Properties** (1):
  - `tap_release_time_threshold`: `float` — [Read-Write] Release within this time-frame to trigger a tap (float)

### `unreal.InputTriggerTimedBase`
Inherits: `InputTrigger` | Header: `InputTriggers.h`

Base class for building triggers that have firing conditions governed by elapsed time. This class transitions state to Ongoing once input is actuated, and will track Ongoing input time until input is ...

**Properties** (2):
  - `affected_by_time_dilation`: `bool` — [Read-Write] Should global time dilation be applied to the held duration?
Default is set to false. I...
  - `held_duration`: `float` — [Read-Write] How long have we been actuating this trigger? (float)

### `unreal.PlayerMappableInputConfig`
Inherits: `PrimaryDataAsset` | Header: `PlayerMappableInputConfig.h`

UPlayerMappableInputConfig

**Methods** (9):
  - `get_config_name()` -> `Name` — Get Config Name
  - `get_display_name()` -> `Text` — Get Display Name
  - `get_keys_bound_to_action(action)` -> `Array [ EnhancedActionKeyMapping ]` — Returns all the keys mapped to a specific Input Action in this mapping config.
  - `get_mapping_by_name(mapping_name)` -> `EnhancedActionKeyMapping` — Returns the action key mapping for the mapping that matches the given name
  - `get_mapping_contexts()` -> `Map [ InputMappingContext , int32 ]` — Return all the Input Mapping contexts that
  - `get_metadata()` -> `Object` — Get all the player mappable keys in this config.
  - `get_player_mappable_keys()` -> `Array [ EnhancedActionKeyMapping ]` — Get all the player mappable keys in this config.
  - `is_deprecated()` -> `bool` — Is Deprecated
  - `reset_to_default()` -> `None` — Resets this mappable config to use the keys

**Properties** (4):
  - `config_display_name`: `Text` [Read-Only] — [Read-Only] The display name that can be used (Text)
  - `config_name`: `Name` [Read-Only] — [Read-Only] The unique name of this config that can be used when saving it (Name)
  - `contexts`: `None` [Read-Only] — [Read-Only] Mapping contexts that make up this Input Config with their associated priority. (Map[Inp...
  - `metadata`: `Object` [Read-Only] — [Read-Only] Metadata that can used to store any other related items to your key mapping such as icon...

### `unreal.PlayerMappableKeySettings`
Inherits: `Object` | Header: `PlayerMappableKeySettings.h`

Hold setting information of an Action Input or a Action Key Mapping for setting screen and save purposes.

**Properties** (5):
  - `display_category`: `Text` [Read-Only] — [Read-Only] The category that this player mapping is in (Text)
  - `display_name`: `Text` [Read-Only] — [Read-Only] The localized display name of this key mapping. Use this when displaying the mappings to...
  - `metadata`: `Object` [Read-Only] — [Read-Only] Metadata that can used to store any other related items to this key mapping such as icon...
  - `name`: `Name` [Read-Only] — [Read-Only] A unique name for this player mapping to be saved with. (Name)
  - `supported_key_profile_ids`: `None` [Read-Only] — [Read-Only] If this key mapping should only be added when a specific key profile is equipped, then s...

### `unreal.DeadZoneType`
Inherits: `EnumBase` | Header: `InputModifiers.h`

EDead Zone Type

**Properties** (3):
  - `AXIAL`: `DeadZoneType = Ellipsis` — Apply dead zone to axes individually. This will result in input being chamfered at the corners for
2...
  - `RADIAL`: `DeadZoneType = Ellipsis` — Apply dead zone logic to all axes simultaneously. This gives smooth input (circular/spherical covera...
  - `UNSCALED_RADIAL`: `DeadZoneType = Ellipsis` — Apply dead zone logic to all axes simultaneously without any smooth input
which the normal âRadial...

### `unreal.FOVScalingType`
Inherits: `EnumBase` | Header: `InputModifiers.h`

EFOVScaling Type

**Properties** (2):
  - `STANDARD`: `FOVScalingType = Ellipsis` — FOV scaling to apply scaled movement deltas to inputs dependent upon the playerâs selected FOV 0
  - `UE4_BACK_COMPAT`: `FOVScalingType = Ellipsis` — FOV scaling was incorrectly calculated in UE4âs UPlayerInput::MassageAxisInput. This implementatio...

### `unreal.InputActionAccumulationBehavior`
Inherits: `EnumBase` | Header: `InputAction.h`

This is an advanced setting that allows you to change how the value of an Input Action is calculated when there are multiple mappings to the same Input Action. The default behavior is to accept highes...

**Properties** (2):
  - `CUMULATIVE`: `InputActionAccumulationBehavior = Ellipsis` — Cumulatively adds the key values for each mapping. For example, a value of -0.7 and +0.75 on the sam...
  - `TAKE_HIGHEST_ABSOLUTE_VALUE`: `InputActionAccumulationBehavior = Ellipsis` — Take the value from the mapping with the highest Absolute Value. For example, given a value of -0.3 ...

### `unreal.InputActionValueType`
Inherits: `EnumBase` | Header: `InputActionValue.h`

EInput Action Value Type

**Properties** (4):
  - `AXIS1D`: `InputActionValueType = Ellipsis` — 1
  - `AXIS2D`: `InputActionValueType = Ellipsis` — 2
  - `AXIS3D`: `InputActionValueType = Ellipsis` — 3
  - `BOOLEAN`: `InputActionValueType = Ellipsis` — Value types in increasing size order (used for type promotion)
Name these Digital/Analog? 0

### `unreal.InputAxisSwizzle`
Inherits: `EnumBase` | Header: `InputModifiers.h`

EInput Axis Swizzle

**Properties** (5):
  - `XZY`: `InputAxisSwizzle = Ellipsis` — Swap Y and Z axis 2
  - `YXZ`: `InputAxisSwizzle = Ellipsis` — Swap X and Y axis. Useful for binding 1D inputs to the Y axis for 2D actions. 0
  - `YZX`: `InputAxisSwizzle = Ellipsis` — Reorder all axes, Y first 3
  - `ZXY`: `InputAxisSwizzle = Ellipsis` — Reorder all axes, Z first 4
  - `ZYX`: `InputAxisSwizzle = Ellipsis` — Swap X and Z axis 1

### `unreal.InputMappingRebuildType`
Inherits: `EnumBase` | Header: `EnhancedInputSubsystemInterface.h`

EInput Mapping Rebuild Type

**Properties** (3):
  - `NONE`: `InputMappingRebuildType = Ellipsis` — No rebuild required. 0
  - `REBUILD`: `InputMappingRebuildType = Ellipsis` — Standard mapping rebuild. Retains existing triggers and modifiers for actions that were previously m...
  - `REBUILD_WITH_FLUSH`: `InputMappingRebuildType = Ellipsis` — If you have made changes to the triggers/modifiers associated with a UInputAction that was previousl...

### `unreal.MappingContextInputModeFilterOptions`
Inherits: `EnumBase` | Header: `InputMappingContext.h`

Options for an input mapping context being filtered based on the current input mode of the player.

**Properties** (3):
  - `DO_NOT_FILTER`: `MappingContextInputModeFilterOptions = Ellipsis` — This Input mapping context should not be filtered based on the current mode, effectively ignoring
th...
  - `USE_CUSTOM_QUERY`: `MappingContextInputModeFilterOptions = Ellipsis` — This mapping context should use a custom input mode query instead of the project default. 1
  - `USE_PROJECT_DEFAULT_QUERY`: `MappingContextInputModeFilterOptions = Ellipsis` — This mapping context should use the projectâs default input mode query.
see: UEnhancedInputDevelop...

### `unreal.MappingContextRegistrationTrackingMode`
Inherits: `EnumBase` | Header: `InputMappingContext.h`

Options for how multiple registrations of an input mapping context should be tracked.

**Properties** (2):
  - `COUNT_REGISTRATIONS`: `MappingContextRegistrationTrackingMode = Ellipsis` — Track how many times the IMC is added and keeps the IMC applied until the IMC is removed the same nu...
  - `UNTRACKED`: `MappingContextRegistrationTrackingMode = Ellipsis` — This is the default behavior.
Registrations of the Input Mapping Context are not tracked. The mappin...

### `unreal.MappingQueryIssueFlag`
Inherits: `EnumBase` | Header: `InputMappingQuery.h`

Mapping issues arising from a QueryMapKeyInâ¦ call

**Properties** (7):
  - `COLLISION_WITH_MAPPING_IN_SAME_CONTEXT`: `MappingQueryIssueFlag = Ellipsis` — Mapping will be functional, but a collision with another mapping within this context may cause issue...
  - `FORCES_TYPE_DEMOTION`: `MappingQueryIssueFlag = Ellipsis` — Trying to bind an FKey with a more complex type than the bound action supports (this could behave od...
  - `FORCES_TYPE_PROMOTION`: `MappingQueryIssueFlag = Ellipsis` — bool -> Axis1D promotions are never considered forced. 16 Trying to bind an FKey with a less complex...
  - `HIDDEN_BY_EXISTING_MAPPING`: `MappingQueryIssueFlag = Ellipsis` — Mapping will not be functional, due to an existing mapping blocking it. 4
  - `HIDES_EXISTING_MAPPING`: `MappingQueryIssueFlag = Ellipsis` — Mapping will cause an existing mapping to be hidden and/or need remapping. 2
  - `NO_ISSUE`: `MappingQueryIssueFlag = Ellipsis` — Mapping will not affect any existing mappings and is safe to apply. 0
  - `RESERVED_BY_ACTION`: `MappingQueryIssueFlag = Ellipsis` — Mapping has been reserved for the exclusive use of another action. The new mapping should be refused...

### `unreal.MappingQueryResult`
Inherits: `EnumBase` | Header: `InputMappingQuery.h`

Result summary from a QueryMapKeyInâ¦ call

**Properties** (5):
  - `ERROR_ENHANCED_INPUT_NOT_ENABLED`: `MappingQueryResult = Ellipsis` — Query failed because the player controller being queried is not configured to support enhanced input...
  - `ERROR_INPUT_CONTEXT_NOT_IN_ACTIVE_CONTEXTS`: `MappingQueryResult = Ellipsis` — Query failed because the input context being queried against is not part of the active context list....
  - `ERROR_INVALID_ACTION`: `MappingQueryResult = Ellipsis` — Query failed because the action being queried against is None/null 2
  - `MAPPING_AVAILABLE`: `MappingQueryResult = Ellipsis` — Mapping will not affect any existing mappings and is safe to apply. 4
  - `NOT_MAPPABLE`: `MappingQueryResult = Ellipsis` — Mapping cannot be applied due to blocking issues. Check OutIssues for details. 3

### `unreal.NormalizeInputSmoothingType`
Inherits: `EnumBase` | Header: `InputModifiers.h`

Behavior options for how the value is calculated in UInputModifierSmoothDelta.

**Properties** (15):
  - `INTERP_CIRCULAR_IN`: `NormalizeInputSmoothingType = Ellipsis` — 4
  - `INTERP_CIRCULAR_IN_OUT`: `NormalizeInputSmoothingType = Ellipsis` — 6
  - `INTERP_CIRCULAR_OUT`: `NormalizeInputSmoothingType = Ellipsis` — 5
  - `INTERP_CONSTANT_TO`: `NormalizeInputSmoothingType = Ellipsis` — 3
  - `INTERP_EASE_IN`: `NormalizeInputSmoothingType = Ellipsis` — 7
  - `INTERP_EASE_IN_OUT`: `NormalizeInputSmoothingType = Ellipsis` — 9
  - `INTERP_EASE_OUT`: `NormalizeInputSmoothingType = Ellipsis` — 8
  - `INTERP_EXPO_IN`: `NormalizeInputSmoothingType = Ellipsis` — 10
  - `INTERP_EXPO_IN_OUT`: `NormalizeInputSmoothingType = Ellipsis` — 12
  - `INTERP_EXPO_OUT`: `NormalizeInputSmoothingType = Ellipsis` — 11
  - `INTERP_SIN_IN`: `NormalizeInputSmoothingType = Ellipsis` — 13
  - `INTERP_SIN_IN_OUT`: `NormalizeInputSmoothingType = Ellipsis` — 15
  - `INTERP_SIN_OUT`: `NormalizeInputSmoothingType = Ellipsis` — 14
  - `INTERP_TO`: `NormalizeInputSmoothingType = Ellipsis` — 2
  - `LERP`: `NormalizeInputSmoothingType = Ellipsis` — 1

### `unreal.PlayerMappableKeySettingBehaviors`
Inherits: `EnumBase` | Header: `EnhancedActionKeyMapping.h`

Defines which Player Mappable Key Setting to use for a Action Key Mapping.

**Properties** (3):
  - `IGNORE_SETTINGS`: `PlayerMappableKeySettingBehaviors = Ellipsis` — Donât use any Settings even if one is specified in the Input Action. 2
  - `INHERIT_SETTINGS_FROM_ACTION`: `PlayerMappableKeySettingBehaviors = Ellipsis` — Use the Settings specified in the Input Action. 0
  - `OVERRIDE_SETTINGS`: `PlayerMappableKeySettingBehaviors = Ellipsis` — Use the Settings specified in the Action Key Mapping overriding the ones specified in the Input acti...

### `unreal.PlayerMappableKeySlot`
Inherits: `EnumBase` | Header: `EnhancedInputUserSettings.h`

The âSlotâ that a player mappable key is in. Used by UI to allow for multiple keys to be bound by the player for a single player mapping

**Properties** (9):
  - `FIFTH`: `PlayerMappableKeySlot = Ellipsis` — 4
  - `FIRST`: `PlayerMappableKeySlot = Ellipsis` — The first key slot 0
  - `FOURTH`: `PlayerMappableKeySlot = Ellipsis` — 3
  - `MAX`: `PlayerMappableKeySlot = Ellipsis` — 8
  - `SECOND`: `PlayerMappableKeySlot = Ellipsis` — The second mappable key slot. This is the default max in the project settings 1
  - `SEVENTH`: `PlayerMappableKeySlot = Ellipsis` — 6
  - `SIXTH`: `PlayerMappableKeySlot = Ellipsis` — 5
  - `THIRD`: `PlayerMappableKeySlot = Ellipsis` — 2
  - `UNSPECIFIED`: `PlayerMappableKeySlot = Ellipsis` — A key that isnât in any slot 7

### `unreal.TriggerEvent`
Inherits: `EnumBase` | Header: `InputTriggers.h`

Trigger events are the Actionâs interpretation of all Trigger State transitions that occurred for the action in the last tick

**Properties** (5):
  - `CANCELED`: `TriggerEvent = Ellipsis` — Triggering has been canceled. For example,  the user has let go of a key before the âPress and Hol...
  - `COMPLETED`: `TriggerEvent = Ellipsis` — The trigger state has transitioned from Triggered to None this frame, i.e. Triggering has finished.
...
  - `ONGOING`: `TriggerEvent = Ellipsis` — Triggering is still being processed. For example, an action with a âPress and Holdâ trigger
will...
  - `STARTED`: `TriggerEvent = Ellipsis` — Triggered may also occur this frame, but this event will always be fired first. 2 An event has occur...
  - `TRIGGERED`: `TriggerEvent = Ellipsis` — Triggering occurred after one or more processing ticks 1

### `unreal.TriggerState`
Inherits: `EnumBase` | Header: `InputTriggers.h`

Trigger states are a light weight interpretation of the provided input values used in trigger UpdateState responses.

**Properties** (3):
  - `NONE`: `TriggerState = Ellipsis` — No inputs 0
  - `ONGOING`: `TriggerState = Ellipsis` — Triggering is being monitored, but not yet been confirmed (e.g. a time based trigger that requires t...
  - `TRIGGERED`: `TriggerState = Ellipsis` — The trigger state has been met 2

### `unreal.TriggerType`
Inherits: `EnumBase` | Header: `InputTriggers.h`

Trigger type determine how the trigger contributes to an actionâs overall trigger event the behavior of the trigger

**Properties** (3):
  - `BLOCKER`: `TriggerType = Ellipsis` — Inverted trigger that will block all other triggers when IsBlocking returns true 2
  - `EXPLICIT`: `TriggerType = Ellipsis` — Input may trigger if any explicit trigger is triggered. 0
  - `IMPLICIT`: `TriggerType = Ellipsis` — Input may trigger only if all implicit triggers are triggered. 1

### `unreal.EnhancedInputActionHandlerDynamicSignature`
Inherits: `DelegateBase` | Header: `EnhancedInputComponent.h`

### `unreal.EnhancedInputLocalPlayerSubsystem_OnControlMappingsRebuilt`
Inherits: `MulticastDelegateBase` | Header: `EnhancedInputSubsystems.h`

A delegate that will be called when control mappings have been rebuilt this frame.

### `unreal.EnhancedInputLocalPlayerSubsystem_OnMappingContextAdded`
Inherits: `MulticastDelegateBase` | Header: `EnhancedInputSubsystems.h`

On Mapping Context Added Delegate Signature

### `unreal.EnhancedInputLocalPlayerSubsystem_OnMappingContextRemoved`
Inherits: `MulticastDelegateBase` | Header: `EnhancedInputSubsystems.h`

On Mapping Context Removed Delegate Signature

### `unreal.EnhancedInputUserSettings_EnhancedInputUserSettingsApplied`
Inherits: `MulticastDelegateBase` | Header: `EnhancedInputUserSettings.h`

Called after the settings have been applied from the ApplySettings call.

### `unreal.EnhancedInputUserSettings_EnhancedInputUserSettingsChanged`
Inherits: `MulticastDelegateBase` | Header: `EnhancedInputUserSettings.h`

Fired when the user settings have changed, such as their key mappings.

### `unreal.EnhancedInputUserSettings_MappableKeyProfileChanged`
Inherits: `MulticastDelegateBase` | Header: `EnhancedInputUserSettings.h`

Fired when you equip a different key profile

### `unreal.EnhancedInputUserSettings_MappingContextRegisteredWithSettings`
Inherits: `MulticastDelegateBase` | Header: `EnhancedInputUserSettings.h`

Fired when a new input mapping context is registered. Useful if you need to update your UI

### `unreal.InputDebugKeyHandlerDynamicSignature`
Inherits: `DelegateBase` | Header: `EnhancedInputComponent.h`

Input Debug Key Handler Dynamic Signature Delegate Signature
