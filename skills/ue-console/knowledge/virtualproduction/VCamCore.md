# UE Python API — VCamCore Module

**55 types** from the `VCamCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ChildWidgetReference`, `DeterminePlayerControllersTargetPolicyParams`, `ModifierStackEntry`, `UpdateViewTargetPolicyParams`, `VCamChildWidgetReference`, `VCamConnection`, `VCamConnectionTargetSettings`, `VCamCoreChangeActivationArgs`, `VCamCoreChangeActivationResult`, `VCamInputDeviceConfig`, `VCamInputDeviceID`, `VCamInputProfile`, `VCamModifierConnectionPoint`, `VCamReceiveOutputProviderData`, `VCamStringPromptRequest`, `VCamStringPromptResponse`, `VCamViewportLocker`, `VCamViewportLockState`, `VCamWidgetConnectionState`, `WidgetConnectionConfig`, ... (55 total)

---

## Classes

### `unreal.ChildWidgetReference`
Inherits: `StructBase` | Header: `WidgetReference.h`

A reference to any child widget within an UMG Blueprint; only widgets in the same widget tree can be referenced. Has a detail customization for choosing widget.

### `unreal.DeterminePlayerControllersTargetPolicyParams`
Inherits: `StructBase` | Header: `GameplayViewTargetPolicy.h`

Determine Player Controllers Target Policy Params

**Properties** (3):
  - `camera_to_affect`: `CineCameraComponent` — [Read-Write] The camera the output provider is associated with. (CineCameraComponent)
  - `new_is_active`: `bool` — [Read-Write] Whether the output provider will be made active or inactive. (bool)
  - `output_provider`: `VCamOutputProviderBase` — [Read-Write] The output provider in question (VCamOutputProviderBase)

### `unreal.ModifierStackEntry`
Inherits: `StructBase` | Header: `ModifierStackEntry.h`

Links a Modifier with a Name for use in a Modifier Stack

### `unreal.UpdateViewTargetPolicyParams`
Inherits: `DeterminePlayerControllersTargetPolicyParams` | Header: `GameplayViewTargetPolicy.h`

Update View Target Policy Params

**Properties** (1):
  - `player_controllers`: `None` — [Read-Write] The player controllers whose view targets should be set to CameraToAffect. (Array[Playe...

### `unreal.VCamChildWidgetReference`
Inherits: `ChildWidgetReference` | Header: `WidgetReference.h`

Version that restraints Widget to UVCamWidget instances.

### `unreal.VCamConnection`
Inherits: `StructBase` | Header: `VCamConnectionStructs.h`

A VCam Connection allows an external object (primarily widgets) to communicate with VCam Modifiers through Connection Points that have known properties. The connection allows you to specify a set of r...

**Properties** (6):
  - `action_type`: `InputActionValueType` — [Read-Write] * If this connection requires an Input Action then this property specifies what Input A...
  - `connection_target_settings`: `VCamConnectionTargetSettings` — [Read-Write] * A struct containing information about which Modifier and Connection Point to look for...
  - `manually_configure_connection`: `bool` — [Read-Write] * If you are not using an external system to configure the connection then you can enab...
  - `optional_interfaces`: `None` — [Read-Write] * A list of interfaces that a modifier may optionally implement that this connection ca...
  - `required_interfaces`: `None` — [Read-Write] * A list of interfaces that a modifier must implement to be considered a valid connecti...
  - `requires_input_action`: `bool` — [Read-Write] * Whether this connection requires a target Connection Point to have an associated Inpu...

### `unreal.VCamConnectionTargetSettings`
Inherits: `StructBase` | Header: `VCamConnectionStructs.h`

This stores information about the target for a given VCam Widget Connection Ideally this is controlled externally via a configurator system but can be set explicitly if required

**Properties** (2):
  - `target_connection_point`: `Name` — [Read-Write] * The name of the Connection Point to search for in a given VCam Modifier (Name)
  - `target_modifier_name`: `Name` — [Read-Write] * The name of the Modifier to search for in a given VCam Componentâs Modifier Stack (...

### `unreal.VCamCoreChangeActivationArgs`
Inherits: `StructBase` | Header: `UnifiedActivationDelegate.h`

Input struct for deciding whether an output provider can change its activation state.

**Properties** (1):
  - `output_provider`: `VCamOutputProviderBase` — [Read-Write] The output provider that is about to be changed (VCamOutputProviderBase)

### `unreal.VCamCoreChangeActivationResult`
Inherits: `StructBase` | Header: `UnifiedActivationDelegate.h`

Output struct for deciding whether an output provider can change its activation state.

**Properties** (2):
  - `can_perform_operation`: `bool` — [Read-Write] Whether the activation change can take place (bool)
  - `reason`: `Text` — [Read-Write] Optional reason to display if the operation is not valid. (Text)

### `unreal.VCamInputDeviceConfig`
Inherits: `StructBase` | Header: `VCamInputDeviceConfig.h`

Defines the input devices a UVCamComponent will accept input from.

### `unreal.VCamInputDeviceID`
Inherits: `StructBase` | Header: `VCamInputDeviceConfig.h`

VCam Input Device ID

### `unreal.VCamInputProfile`
Inherits: `StructBase` | Header: `VCamInputSettings.h`

VCam Input Profile

**Properties** (1):
  - `mappable_key_overrides`: `None` — [Read-Write] Remaps inputs to new keys. This remaps the input action mappings found in the modifiers...

### `unreal.VCamModifierConnectionPoint`
Inherits: `StructBase` | Header: `VCamModifier.h`

VCam Modifier Connection Point

**Properties** (1):
  - `associated_action`: `InputAction` — [Read-Write] An optional action to associate with this connection point. (InputAction)

### `unreal.VCamReceiveOutputProviderData`
Inherits: `StructBase` | Header: `IVCamOutputProviderCreatedWidget.h`

VCam Receive Output Provider Data

**Properties** (1):
  - `output_provider`: `VCamOutputProviderBase` [Read-Only] — [Read-Only] (VCamOutputProviderBase)

### `unreal.VCamStringPromptRequest`
Inherits: `StructBase` | Header: `VCamStringPrompt.h`

Request for string input which will be sent to a VCam streaming client

### `unreal.VCamStringPromptResponse`
Inherits: `StructBase` | Header: `VCamStringPrompt.h`

Response to a request for string input from a VCam streaming client

**Properties** (2):
  - `entry`: `str` [Read-Only] — [Read-Only] The string that the user provided. Empty if the result is not Submitted. (str)
  - `result`: `VCamStringPromptResult` [Read-Only] — [Read-Only] The result of the string prompt (VCamStringPromptResult)

### `unreal.VCamViewportLocker`
Inherits: `StructBase` | Header: `VCamViewportLocker.h`

Keeps track of which viewports are locked

### `unreal.VCamViewportLockState`
Inherits: `StructBase` | Header: `VCamViewportLocker.h`

VCam Viewport Lock State

### `unreal.VCamWidgetConnectionState`
Inherits: `StructBase` | Header: `VCamWidgetConnectionState.h`

VCam Widget Connection State

**Properties** (1):
  - `widget_configs`: `None` — [Read-Write] A list of widgets to update (Array[WidgetConnectionConfig])

### `unreal.WidgetConnectionConfig`
Inherits: `StructBase` | Header: `WidgetConnectionConfig.h`

Widget Connection Config

**Properties** (2):
  - `connection_targets`: `None` — A valid key of in UVCamWidget::Connections of the widget identified via WidgetProperty.
Value: The s...
  - `widget`: `VCamChildWidgetReference` — [Read-Write] Defines the widget whose connections should be updated. Must be a VCamWidget.
This is t...

### `unreal.FocusFirstPlayerViewTargetPolicy`
Inherits: `GameplayViewTargetPolicy` | Header: `FocusFirstPlayerViewTargetPolicy.h`

Chooses the first local player controller.

### `unreal.GameplayViewTargetPolicy`
Inherits: `Object` | Header: `GameplayViewTargetPolicy.h`

A gameplay view target policy determines which player controller should change its view target when gameplay is started, e.g. PIE or in shipped games.

**Methods** (2):
  - `determine_player_controllers(params)` -> `Array [ PlayerController ]` — Called when the policy should be applied: when the output providerâs activation changes in a game world.
  - `update_view_target(params)` -> `None` — Called to just after the view target has been updated for the player controller that was previously returned by Determin...

### `unreal.InputVCamSubsystem`
Inherits: `VCamSubsystem` | Header: `InputVCamSubsystem.h`

Handles all input for UVCamComponent. Essentially maps input devices to UVCamComponents, similar like APlayerController does for gameplay code.

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

### `unreal.PromptClientForStringAsyncAction`
Inherits: `BlueprintAsyncActionBase` | Header: `PromptClientForStringAsyncAction.h`

Sends a prompt for a string to the current VCam client.

**Properties** (1):
  - `on_completed`: `StringPromptResponseDelegate` — [Read-Write] Event that triggers when the operation completes. (StringPromptResponseDelegate)

### `unreal.VCamBaseActor`
Inherits: `CineCameraActor` | Header: `VCamBaseActor.h`

Utility base class which sets up a UVCamComponent with a Cine Camera. Acts as base class for Blueprint VCamActor, which has some default properties set already. Therefore Abstract and NotPlaceable.

**Methods** (1):
  - `get_v_cam_component()` -> `VCamComponent` — Get VCam Component

**Properties** (1):
  - `v_cam_component`: `VCamComponent` [Read-Only] — [Read-Only] (VCamComponent)

### `unreal.VCamBlueprintModifier`
Inherits: `VCamModifier` | Header: `VCamModifier.h`

VCam Blueprint Modifier

**Methods** (4):
  - `get_input_mapping_context_and_priority()` -> `None` — This function is deliberately non-working to force cleanup of Input Contexts Please move any previous values to the new ...
  - `on_apply(context, camera_component, delta_time)` -> `None` — Called every tick to update this modifier.
  - `on_deinitialize()` -> `None` — On Deinitialize
  - `on_initialize(context)` -> `None` — On Initialize

### `unreal.VCamComponent`
Inherits: `SceneComponent` | Header: `VCamComponent.h`

Provides a modular system for editing a UCineCameraComponent using user widgets. This component must be attached as a direct child of UCineCameraComponent.

**Methods** (56):
  - `add_input_profile_with_currently_active_mappings(profile_name, update_if_profile_already_exists = True)` -> `bool` — Tries to add a new Input Profile to the VCam Input Settings and populates it with any currently active player mappable k...
  - `add_modifier(name, modifier_class)` -> `VCamModifier or None` — Add a modifier to the stack with a given name. If that name is already in use then the modifier will not be added. Retur...
  - `add_output_provider(provider_class)` -> `VCamOutputProviderBase or None` — ************* Output Provider access ***************
  - `clear_modifiers()` -> `None` — deprecated: âclear_modifiersâ was renamed to âremove_all_modifiersâ.
  - `find_modifier_by_interface(interface_class: Class)` -> `None` — deprecated: âfind_modifier_by_interfaceâ was renamed to âget_modifiers_by_interfaceâ.
  - `find_modifier_by_name(name: Name)` -> `VCamModifier` — deprecated: âfind_modifier_by_nameâ was renamed to âget_modifier_by_nameâ.
  - `find_modifiers_by_class(modifier_class: Class)` -> `None` — deprecated: âfind_modifiers_by_classâ was renamed to âget_modifiers_by_classâ.
  - `get_all_modifier_names()` -> `Array [ Name ]` — Returns all the modifier names used to identifying connection points.
  - `get_all_modifiers()` -> `Array [ VCamModifier ]` — Returns all the Modifiers in the Componentâs Stack Note: Itâs possible not all Modifiers will be valid (such as if t...
  - `get_all_output_providers()` -> `Array [ VCamOutputProviderBase ]` — Get All Output Providers
  - `get_all_player_mappable_action_key_mappings()` -> `Array [ EnhancedActionKeyMapping ]` — Searches the currently active input system for all registered key mappings that are marked as Player Mappable.
  - `get_disable_component_when_spawned_by_sequencer()` -> `bool` — Get Disable Component when Spawned by Sequencer
  - `get_disable_output_on_multi_user_receiver()` -> `bool` — Get Disable Output on Multi User Receiver
  - `get_input_device_settings()` -> `VCamInputDeviceConfig` — Gets the current input device settings being used (if this component is enabled) or that will be used (if not enabled).
  - `get_input_profile()` -> `VCamInputProfile` — Get Input Profile
  - `get_input_v_cam_subsystem()` -> `InputVCamSubsystem` — Gets the subsystem responsible for input handling.
  - `get_live_link_data_for_current_frame()` -> `LiveLinkCameraBlueprintData or None`
  - `get_live_link_subobject()` -> `LiveLinkSubjectName` — Get Live Link Subobject
  - `get_modifier_by_index(index)` -> `VCamModifier` — Returns the Modifier in the Stack with the given index if it exist.
  - `get_modifier_by_name(name)` -> `VCamModifier` — Tries to find a Modifier in the Stack with the given name. The returned Modifier must be checked before it is used.
  - `get_modifier_context()` -> `VCamModifierContext` — Get the current Modifier Context
  - `get_modifiers_by_class(modifier_class)` -> `Array [ VCamModifier ]` — Given a specific Modifier class, returns a list of matching Modifiers
  - `get_modifiers_by_interface(interface_class)` -> `Array [ VCamModifier ]` — Given a specific Interface class, returns a list of matching Modifiers
  - `get_number_of_modifiers()` -> `int32` — Get Number Of Modifiers
  - `get_number_of_output_providers()` -> `int32` — Get Number Of Output Providers
  - `get_output_provider_by_index(provider_index)` -> `VCamOutputProviderBase` — Get Output Provider by Index
  - `get_output_providers_by_class(provider_class)` -> `Array [ VCamOutputProviderBase ]` — Get Output Providers by Class
  - `get_player_mappable_keys()` -> `Array [ EnhancedActionKeyMapping ]` — Get Player Mappable Keys deprecated: GetPlayerMappableKeys has been deprecated. Please use UEnhancedPlayerMappableKeyPro...
  - `get_player_mapped_key(mapping_name)` -> `Key` — Searches the currently active input system for the current key mapped to a given input mapping If there is not a player ...
  - `get_record_as_cine_camera()` -> `bool` — Get Record as Cine Camera
  - `get_role()` -> `GameplayTag` — ************* Blueprint Getters & Setters ***************
  - `get_subsystem_array(class_)` -> `Array [ VCamSubsystem ]` — Gets all subsystems implementing this interface
  - `get_target_camera()` -> `CineCameraComponent` — Get Target Camera
  - `inject_input_for_action(action, raw_value, modifiers, triggers)` -> `None` — Injects an input action.
  - `inject_input_vector_for_action(action, value, modifiers, triggers)` -> `None` — Injects an input vector for action.
  - `insert_modifier(name, index, modifier_class)` -> `VCamModifier or None` — Insert a modifier to the stack with a given name and index. If that name is already in use then the modifier will not be...
  - `insert_output_provider(index, provider_class)` -> `VCamOutputProviderBase or None` — Insert Output Provider
  - `register_object_for_input(object)` -> `None` — Registers the given object with the VCamComponentâs Input Component This allows dynamic input bindings such as input e...
  - `remove_all_modifiers()` -> `None` — Remove all Modifiers from the Stack.
  - `remove_all_output_providers()` -> `None` — Remove All Output Providers
  - `remove_modifier(modifier)` -> `bool`
  - `remove_modifier_by_index(modifier_index)` -> `bool`
  - `remove_modifier_by_name(name)` -> `bool`
  - `remove_output_provider(provider)` -> `bool` — Remove Output Provider
  - `remove_output_provider_by_index(provider_index)` -> `bool` — Remove Output Provider by Index
  - `save_current_input_profile_to_settings(profile_name)` -> `bool` — Saves the current input profile settings to the VCam Input Settings using the provided Profile Name
  - `set_disable_component_when_spawned_by_sequencer(value)` -> `None` — Set Disable Component when Spawned by Sequencer
  - `set_disable_output_on_multi_user_receiver(value)` -> `None` — Set Disable Output on Multi User Receiver
  - `set_input_profile_from_name(profile_name)` -> `bool` — Attempts to apply key mapping settings from an input profile defined in VCam Input Settings Returns whether the profile ...
  - `set_live_link_subobject(value)` -> `None` — Set Live Link Subobject
  - `set_modifier_context_class(context_class)` -> `VCamModifierContext` — Sets the Modifier Context to a new instance of the provided class
  - `set_modifier_index(original_index, new_index)` -> `bool` — Moves an existing modifier in the stack from its current index to a new index
  - `set_output_provider_index(original_index, new_index)` -> `bool` — Moves an existing Output Provider in the stack from its current index to a new index
  - `set_record_as_cine_camera(value)` -> `None` — Set Record as Cine Camera
  - `set_role(value)` -> `None` — Set Role
  - `unregister_object_for_input(object)` -> `None` — Unregisters the given object with the VCamComponentâs Input Component

**Properties** (9):
  - `disable_component_when_spawned_by_sequencer`: `bool` — [Read-Write] If true, the component will force bEnabled to false when it is part of a spawnable in S...
  - `disable_output_on_multi_user_receiver`: `bool` — [Read-Write] Do we disable the output if the virtual camera is in a Multi-user session and the camer...
  - `enabled`: `bool` — [Read-Write] Whether the VCamComponent will update every frame (bool)
  - `input_device_settings`: `VCamInputDeviceConfig` — [Read-Write] (VCamInputDeviceConfig)
  - `input_profile`: `VCamInputProfile` — [Read-Write] (VCamInputProfile)
  - `live_link_subject`: `LiveLinkSubjectName` — [Read-Write] LiveLink subject name for the incoming camera transform (LiveLinkSubjectName)
  - `on_component_replaced`: `OnComponentReplaced` — [Read-Write] There are situations in the editor where the component may be replaced by another compo...
  - `record_as_cine_camera`: `bool` — [Read-Write] Affects recordings in Take Recorder. If true, the owning actor should be recorded as a ...
  - `role`: `GameplayTag` — [Read-Write] The role of this virtual camera.  If this value is set and the corresponding tag set on...

### `unreal.VCamCoreScriptingFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `VCamCoreScriptingFunctionLibrary.h`

VCam Core Scripting Function Library

**Methods** (2):
  - `add_can_activate_output_provider_delegate(delegate)` -> `None` [classmethod] — Add a delegate with which you can decide whether an output provider can be activated.
  - `remove_can_activate_output_provider_delegate(object)` -> `None` [classmethod] — Removes all activation deciding delegates you previously bound to the provider Object.

### `unreal.VCamInputSettings`
Inherits: `DeveloperSettings` | Header: `VCamInputSettings.h`

These settings store input profiles.

**Methods** (4):
  - `get_input_profile_names()` -> `Array [ Name ]`
  - `get_v_cam_input_settings()` -> `VCamInputSettings` [classmethod] — Gets the settings object.
  - `set_default_input_profile(new_default_input_profile)` -> `None` — Sets DefaultInputProfile and saves it out to the config.
  - `set_input_profiles(new_input_profiles)` -> `None` — Updates InputProfiles and save it out to the config.

**Properties** (2):
  - `default_input_profile`: `Name` — [Read-Write] The profile that VCam components should default to. (Name)
  - `input_profiles`: `None` — [Read-Write] A bunch of profiles that components can switch between (Map[Name,VCamInputProfile])

### `unreal.VCamModifier`
Inherits: `Object` | Header: `VCamModifier.h`

VCam Modifier

**Methods** (6):
  - `get_current_live_link_data_from_owning_component()` -> `LiveLinkCameraBlueprintData` — Get Current Live Link Data from Owning Component
  - `get_owning_v_cam_component()` -> `VCamComponent` — Get Owning VCam Component
  - `get_stack_entry_name()` -> `Name` — Gets the name of the modifier in the associated modifier stack
  - `is_enabled()` -> `bool` — Is Enabled
  - `set_enabled(new_enabled)` -> `None` — Set Enabled
  - `set_stack_entry_name(new_name)` -> `bool` — Sets the name of the modifier in the associated modifier stack Returns a bool for whether

**Properties** (3):
  - `connection_points`: `None` — [Read-Write] (Map[Name,VCamModifierConnectionPoint])
  - `input_context_priority`: `int` [Read-Only] — [Read-Only] If an Input Mapping Context is provided then this value defines the priority level that ...
  - `input_mapping_context`: `InputMappingContext` [Read-Only] — [Read-Only] If an Input Mapping Context is specified then that Context will be automatically added t...

### `unreal.VCamModifierContext`
Inherits: `Object` | Header: `VCamModifierContext.h`

VCam Modifier Context

### `unreal.VCamOutputComposure`
Inherits: `VCamOutputProviderBase` | Header: `VCamOutputComposure.h`

VCam Output Composure

**Properties** (2):
  - `final_output_render_target`: `TextureRenderTarget2D` — [Read-Write] TextureRenderTarget2D asset that contains the final output (TextureRenderTarget2D)
  - `layer_targets`: `None` — [Read-Write] List of Composure stack Compositing Elements to render the requested UMG into (Array[Co...

### `unreal.VCamOutputMediaOutput`
Inherits: `VCamOutputProviderBase` | Header: `VCamOutputMediaOutput.h`

VCam Output Media Output

**Properties** (2):
  - `from_composure_output_provider_index`: `int` — [Read-Write] If using the output from a Composure Output Provider, specify it here (int32)
  - `output_config`: `MediaOutput` — [Read-Write] Media Output configuration asset (MediaOutput)

### `unreal.VCamOutputProviderBase`
Inherits: `Object` | Header: `VCamOutputProviderBase.h`

Output providers implement methods of overlaying a widget onto a target viewport. The composition of viewport and widget is then usually streamed to an application outside the engine, e.g. via Pixel S...

**Methods** (9):
  - `can_toggle_activation()` -> `bool`
  - `get_target_viewport()` -> `VCamTargetViewportID` — Get Target Viewport
  - `get_umg_class()` — Get UMGClass
  - `get_v_cam_component()` -> `VCamComponent` — Get VCam Component
  - `is_active()` -> `bool` — Returns if this output provider is currently active or not
  - `is_initialized()` -> `bool` — Returns if this output provider has been initialized or not
  - `set_active(active)` -> `None` — Called to turn on or off this output provider
  - `set_target_viewport(value)` -> `None` — Set Target Viewport
  - `set_umg_class(umg_class)` -> `None` — Set UMGClass

**Properties** (5):
  - `on_activated_delegate_blueprint`: `ActivationDelegate_Blueprint` — [Read-Write] Called when the activation state of this output provider changes. (ActivationDelegate_B...
  - `override_resolution`: `IntPoint` — [Read-Write] When bUseOverrideResolution is set, use this custom resolution (IntPoint)
  - `target_viewport`: `VCamTargetViewportID` — [Read-Write] Which viewport to use for this VCam (VCamTargetViewportID)
  - `umg_class`: `Class` — [Read-Write] The UMG class to be rendered in this output provider (type(Class))
  - `use_override_resolution`: `bool` — [Read-Write] Override the default output resolution with a custom value - NOTE you must toggle bIsAc...

### `unreal.VCamOutputProviderCreatedWidget`
Inherits: `Interface` | Header: `IVCamOutputProviderCreatedWidget.h`

VCam Output Provider Created Widget

**Methods** (1):
  - `receive_output_provider(data)` -> `None` — This is called to let widgets know of the output provider that created them.

### `unreal.VCamOutputRemoteSession`
Inherits: `VCamOutputProviderBase` | Header: `VCamOutputRemoteSession.h`

VCam Output Remote Session

**Properties** (2):
  - `from_composure_output_provider_index`: `int` — [Read-Write] If using the output from a Composure Output Provider, specify it here (int32)
  - `port_number`: `int` — [Read-Write] Network port number - change this only if connecting multiple RemoteSession devices to ...

### `unreal.VCamOutputViewport`
Inherits: `VCamOutputProviderBase` | Header: `VCamOutputViewport.h`

Adds a widget on top of the viewport locally.

### `unreal.VCamPlayerInput`
Inherits: `EnhancedPlayerInput` | Header: `VCamPlayerInput.h`

Receives raw input from input processor (or player controller in user code). Filters input

### `unreal.VCamStateSwitcherWidget`
Inherits: `VCamWidget` | Header: `VCamStateSwitcherWidget.h`

A widget that has a set of states you can switch between using SetCurrentState. A state is a collection of VCamWidgets whose connections should be rebound to new connection points.

**Methods** (4):
  - `get_current_state()` -> `Name` — Get Current State
  - `get_state_info(state)` -> `VCamWidgetConnectionState or None` — Get State Info
  - `get_states()` -> `Array [ Name ]` — Get States
  - `set_current_state(new_state, force_update = False, reinitialize_connections = True)` -> `bool` — Switches to given state - if the state transition is valid, UpdateConnectionTargets will be called. If CurrentState == N...

**Properties** (4):
  - `current_state`: `Name` — [Read-Write] (Name)
  - `on_post_state_changed`: `ChangeConnectionStateEvent` — [Read-Write] Executes when after the state has been changed (ChangeConnectionStateEvent)
  - `on_pre_state_changed`: `ChangeConnectionStateEvent` — [Read-Write] Executes when the state is about to be changed (ChangeConnectionStateEvent)
  - `states`: `None` — [Read-Write] The states (Map[Name,VCamWidgetConnectionState])

### `unreal.VCamSubsystem`
Inherits: `Subsystem` | Header: `VCamSubsystem.h`

Base class for auto instanced and initialized subsystem that share the lifetime of UVCamComponents.

**Methods** (1):
  - `get_v_cam_component()` -> `VCamComponent` — Get VCam Component

### `unreal.VCamTestActor`
Inherits: `VCamBaseActor` | Header: `VCamTestActor.h`

VCam Test Actor

### `unreal.VCamUIFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `VCamUIFunctionLibrary.h`

Function Library primarily used for exposing functionality of UI related structs to Blueprints

**Methods** (9):
  - `get_connected_input_action_v_cam_connection(connection)` -> `InputAction` [classmethod]
  - `get_connected_input_action_v_cam_widget(widget, connection_id)` -> `InputAction or None` [classmethod] — Gets the input action mapped to ConnectionId on the widget.
  - `get_connected_modifier_v_cam_connection(connection)` -> `VCamModifier` [classmethod]
  - `get_connected_modifier_v_cam_widget(widget, connection_id)` -> `VCamModifier or None` [classmethod] — Gets the modifier connected to ConnectionId on the widget.
  - `get_connection_by_name_v_cam_widget(widget, connection_id)` -> `VCamConnection or None` [classmethod] — Gets a connection by its ID.
  - `get_connection_point_name_v_cam_connection(connection)` -> `Name` [classmethod]
  - `get_connection_point_name_v_cam_widget(widget, connection_id)` -> `Name or None` [classmethod] — Gets the connection point the connection ConnectionId attempts to connect to on the widget.
  - `is_connected_v_cam_connection(connection)` -> `bool` [classmethod]
  - `is_connected_v_cam_widget(widget, connection_id)` -> `bool or None` [classmethod] — Gets whether the ConnectionId is connected on the widget.

### `unreal.VCamWidget`
Inherits: `UserWidget` | Header: `VCamWidget.h`

A wrapper widget class that contains a set of VCam Connections If you add a widget deriving from UVCamWidget to an Overlay Widget for a VCam Output Provider then when the Overlay is created by the Pro...

**Methods** (5):
  - `on_connection_updated(connection_name, did_connect_successfully, modifier_connection_point_name, connected_modifier, connected_action)` -> `None`
  - `on_initialize_connections(v_cam)` -> `None` — On Initialize Connections
  - `post_connections_initialized()` -> `None`
  - `reinitialize_connections()` -> `bool`
  - `update_connection_targets(new_connection_targets, reinitialize_on_successful_update = True)` -> `ConnectionUpdateResult`

**Properties** (6):
  - `connections`: `None` — [Read-Write] * The VCam Connections associated with this Widget
*
* Each Connection has a unique nam...
  - `input_context_priority`: `int` [Read-Only] — [Read-Only] * If this widget is registered for input then this property defines the priority that th...
  - `input_mapping_context`: `InputMappingContext` [Read-Only] — [Read-Only] * If this widget is registered for input then this input mapping context will be added t...
  - `on_post_connections_reinitialized_delegate_blueprint`: `ConnectionsReinitializedDelegate_Blueprint` — [Read-Write] Called when ReinitializeConnections is called. (ConnectionsReinitializedDelegate_Bluepr...
  - `register_for_input`: `bool` [Read-Only] — [Read-Only] * Determines whether this widget will be automatically registered to receive input when ...
  - `v_cam_component`: `VCamComponent` [Read-Only] — [Read-Only] * Cached pointer to the VCam Component that owns this VCam Widget (VCamComponent)

### `unreal.WidgetReferenceBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `WidgetReference.h`

Widget Reference Blueprint Function Library

**Methods** (2):
  - `resolve_v_cam_widget(widget_reference, owner_widget)` -> `VCamWidget` [classmethod] — Resolve VCam Widget
  - `resolve_widget(widget_reference, owner_widget)` -> `Widget` [classmethod] — Resolve Widget

### `unreal.ConnectionUpdateResult`
Inherits: `EnumBase` | Header: `VCamWidget.h`

EConnection Update Result

**Properties** (2):
  - `DID_UPDATE_CONNECTIONS`: `ConnectionUpdateResult = Ellipsis` — 0
  - `NO_CONNECTIONS_UPDATED`: `ConnectionUpdateResult = Ellipsis` — 1

### `unreal.VCamInputLoggingMode`
Inherits: `EnumBase` | Header: `VCamInputDeviceConfig.h`

EVCam Input Logging Mode

**Properties** (4):
  - `ALL`: `VCamInputLoggingMode = Ellipsis` — Log all input, regardless whether it is passed down to input actions or not (i.e. that passed filter...
  - `NONE`: `VCamInputLoggingMode = Ellipsis` — No logging 0
  - `ONLY_CONSUMABLE`: `VCamInputLoggingMode = Ellipsis` — Log only input that are passed down to the input actions (i.e. that passed filtering conditions) 1
  - `ONLY_GAMEPAD`: `VCamInputLoggingMode = Ellipsis` — Log all gamepad input regardless whether it is passed down to input actions or not (i.e. that passed...

### `unreal.VCamInputMode`
Inherits: `EnumBase` | Header: `VCamInputDeviceConfig.h`

EVCam Input Mode

**Properties** (4):
  - `CONSUME_DEVICE`: `VCamInputMode = Ellipsis` — Input is passed to VCam input actions. For gamepads, input is always consumed even if no input actio...
  - `CONSUME_IF_USED`: `VCamInputMode = Ellipsis` — Input is passed to VCam input actions.
Input is consumed if the input action was configured to consu...
  - `DO_NOT_CONSUME`: `VCamInputMode = Ellipsis` — Input is passed to VCam input actions.
Input is not consumed - even if the input action was configur...
  - `IGNORE`: `VCamInputMode = Ellipsis` — Input is not passed to VCam input actions. 3

### `unreal.VCamStringPromptResult`
Inherits: `EnumBase` | Header: `VCamStringPrompt.h`

Result of a request for string input from a VCam streaming client

**Properties** (4):
  - `CANCELLED`: `VCamStringPromptResult = Ellipsis` — The user cancelled the string prompt 1
  - `DISCONNECTED`: `VCamStringPromptResult = Ellipsis` — The user disconnected before responding to the string prompt 2
  - `SUBMITTED`: `VCamStringPromptResult = Ellipsis` — The user submitted a string, which is contained in the responseâs Input field 0
  - `UNAVAILABLE`: `VCamStringPromptResult = Ellipsis` — String prompts are not available in the current VCam configuration 3

### `unreal.VCamTargetViewportID`
Inherits: `EnumBase` | Header: `EVCamTargetViewportID.h`

EVCam Target Viewport ID

**Properties** (4):
  - `VIEWPORT1`: `VCamTargetViewportID = Ellipsis` — 0
  - `VIEWPORT2`: `VCamTargetViewportID = Ellipsis` — 1
  - `VIEWPORT3`: `VCamTargetViewportID = Ellipsis` — 2
  - `VIEWPORT4`: `VCamTargetViewportID = Ellipsis` — 3

### `unreal.CanChangeActiviationDynamicVCamDelegate`
Inherits: `DelegateBase` | Header: `UnifiedActivationDelegate.h`

Can Change Activiation Dynamic VCam Delegate Delegate Signature

### `unreal.ChangeConnectionStateEvent`
Inherits: `MulticastDelegateBase` | Header: `VCamStateSwitcherWidget.h`

Change Connection State Event Delegate Signature

### `unreal.OnComponentReplaced`
Inherits: `MulticastDelegateBase` | Header: `VCamComponent.h`

On Component Replaced Delegate Signature

### `unreal.PromptClientForStringAsyncAction_StringPromptResponseDelegate`
Inherits: `MulticastDelegateBase` | Header: `PromptClientForStringAsyncAction.h`

String Prompt Response Delegate Delegate Signature

### `unreal.VCamOutputProviderBase_ActivationDelegate_Blueprint`
Inherits: `MulticastDelegateBase` | Header: `VCamOutputProviderBase.h`

Activation Delegate Blueprint Delegate Signature

### `unreal.VCamWidget_ConnectionsReinitializedDelegate_Blueprint`
Inherits: `MulticastDelegateBase` | Header: `VCamWidget.h`

Connections Reinitialized Delegate Blueprint Delegate Signature
