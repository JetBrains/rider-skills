# UE Python API — CommonUI Module

**99 types** from the `CommonUI` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CommonButtonStyleOptionalSlateSound`, `CommonInputActionDataBase`, `CommonInputActionHandlerData`, `CommonInputTypeInfo`, `CommonNumberFormattingOptions`, `RichTextIconData`, `UIActionBindingHandle`, `UIActionTag`, `UIInputConfig`, `UITag`, `AnalogSlider`, `CommonActionWidget`, `CommonActivatableWidget`, `CommonActivatableWidgetContainerBase`, `CommonActivatableWidgetQueue`, `CommonActivatableWidgetStack`, `CommonActivatableWidgetSwitcher`, `CommonAnimatedSwitcher`, `CommonBorder`, `CommonBorderStyle`, ... (99 total)

---

## Classes

### `unreal.CommonButtonStyleOptionalSlateSound`
Inherits: `StructBase` | Header: `CommonButtonBase.h`

Common Button Style Optional Slate Sound

**Properties** (2):
  - `has_sound`: `bool` — [Read-Write] (bool)
  - `sound`: `SlateSound` — [Read-Write] (SlateSound)

### `unreal.CommonInputActionDataBase`
Inherits: `TableRowBase` | Header: `CommonUITypes.h`

Common Input Action Data Base

**Properties** (3):
  - `display_name`: `Text` [Read-Only] — [Read-Only] User facing name (used when NOT a hold action) (Text)
  - `hold_display_name`: `Text` [Read-Only] — [Read-Only] User facing name used when it IS a hold action (Text)
  - `nav_bar_priority`: `int` [Read-Only] — [Read-Only] Priority in nav-bar (int32)

### `unreal.CommonInputActionHandlerData`
Inherits: `StructBase` | Header: `CommonActionHandlerInterface.h`

FIXME:: This struct is related to legacy CommonUI and should be removed in 5.3 - UE-164871

**Properties** (1):
  - `input_action_row`: `DataTableRowHandle` [Read-Only] — [Read-Only] (DataTableRowHandle)

### `unreal.CommonInputTypeInfo`
Inherits: `StructBase` | Header: `CommonUITypes.h`

Common Input Type Info

### `unreal.CommonNumberFormattingOptions`
Inherits: `StructBase` | Header: `CommonNumericTextBlock.h`

Common Number Formatting Options

**Properties** (7):
  - `always_sign`: `bool` [Read-Only] — â+1â (bool) [Read-Only] Should the numerals always display the sign. IE
  - `maximum_fractional_digits`: `int` [Read-Only] — HalfFromZero rounding and a maximum of 2 fractional digits means 0.009 -> â0.01â. (int32) [Read-...
  - `maximum_integral_digits`: `int` [Read-Only] — A maximum of 2 integral digits means 100.0 -> â99â. (int32) [Read-Only] How many integral digits...
  - `minimum_fractional_digits`: `int` [Read-Only] — A minimum of 2 fractional digits means 1.0 -> â1.00â. (int32) [Read-Only] How many fractional di...
  - `minimum_integral_digits`: `int` [Read-Only] — A minimum of 3 integral digits means 1.0 -> â001â. (int32) [Read-Only] How many integral digits ...
  - `rounding_mode`: `RoundingMode` [Read-Only] — [Read-Only] The rounding mode to be used when the actual value can not be precisely represented due ...
  - `use_grouping`: `bool` [Read-Only] — â1,000,000â (bool) [Read-Only] Should the numerals use group separators. IE

### `unreal.RichTextIconData`
Inherits: `TableRowBase` | Header: `CommonUIRichTextData.h`

Rich Text Icon Data

### `unreal.UIActionBindingHandle`
Inherits: `StructBase` | Header: `UIActionBindingHandle.h`

UIAction Binding Handle

### `unreal.UIActionTag`
Inherits: `UITag` | Header: `UITag.h`

UIAction Tag

### `unreal.UIInputConfig`
Inherits: `StructBase` | Header: `UIActionBindingHandle.h`

Input Config that can be applied on widget activation. Allows for input setup (Mouse capture, UI-only input, move / look ignore, etc), to be controlled by widget activation.

**Properties** (6):
  - `hide_cursor_during_viewport_capture`: `bool` — [Read-Write] (bool)
  - `ignore_look_input`: `bool` — [Read-Write] (bool)
  - `ignore_move_input`: `bool` — [Read-Write] (bool)
  - `input_mode`: `CommonInputMode` — [Read-Write] (CommonInputMode)
  - `mouse_capture_mode`: `MouseCaptureMode` — [Read-Write] (MouseCaptureMode)
  - `mouse_lock_mode`: `MouseLockMode` — [Read-Write] (MouseLockMode)

### `unreal.UITag`
Inherits: `GameplayTag` | Header: `UITag.h`

### `unreal.AnalogSlider`
Inherits: `Slider` | Header: `AnalogSlider.h`

A simple widget that shows a sliding bar with a handle that allows you to control the value in a user define range (between 0..1 by default).

**Properties** (1):
  - `on_analog_capture`: `OnFloatValueChangedEvent` — [Read-Write] Called when the value is changed by slider or typing. (OnFloatValueChangedEvent)

### `unreal.CommonActionWidget`
Inherits: `Widget` | Header: `CommonActionWidget.h`

A widget that shows a platform-specific icon for the given input action.

**Methods** (10):
  - `get_display_text()` -> `Text` — Get Display Text
  - `get_enhanced_input_action()` -> `InputAction` — Get Enhanced Input Action
  - `get_icon()` -> `SlateBrush` — End UWidget
  - `get_icon_dynamic_material()` -> `MaterialInstanceDynamic` — Get Icon Dynamic Material
  - `is_held_action()` -> `bool` — Is Held Action
  - `set_enhanced_input_action(input_action)` -> `None` — Set Enhanced Input Action
  - `set_icon_rim_brush(icon_rim_brush)` -> `None` — Set Icon Rim Brush
  - `set_input_action(input_action_row)` -> `None` — Set Input Action
  - `set_input_action_binding(binding_handle)` -> `None` — Set Input Action Binding
  - `set_input_actions(new_input_actions)` -> `None` — Set Input Actions

**Properties** (7):
  - `enhanced_input_action`: `InputAction` [Read-Only] — [Read-Only] Input Action this common action widget is intended to represent. Optional if using Enhan...
  - `icon_rim_brush`: `SlateBrush` [Read-Only] — [Read-Only] (SlateBrush)
  - `input_actions`: `None` [Read-Only] — [Read-Only] List all the input actions that this common action widget is intended to represent.  In ...
  - `on_input_icon_updated`: `OnInputIconUpdated` — [Read-Write] (OnInputIconUpdated)
  - `on_input_method_changed`: `OnInputMethodChanged` — [Read-Write] (OnInputMethodChanged)
  - `progress_material_brush`: `SlateBrush` — [Read-Write] The material to use when showing held progress, the progress will be sent using the mat...
  - `progress_material_param`: `Name` [Read-Only] — [Read-Only] The material parameter on ProgressMaterialBrush to update the held percentage.  This val...

### `unreal.CommonActivatableWidget`
Inherits: `CommonUserWidget` | Header: `CommonActivatableWidget.h`

The base for widgets that are capable of being âactivatedâ and âdeactivatedâ during their lifetime without being otherwise modified or destroyed.

**Methods** (13):
  - `activate_widget()` -> `None` — Activate Widget
  - `bind_visibility_to_activation(activatable_widget)` -> `None` — Bind our visibility to the activation of another widget, useful for making mouse collisions behave similiar to console n...
  - `bp_get_desired_focus_target()` -> `Widget` — Implement to provide the desired widget to focus if/when this activatable becomes the primary active widget. Note: This ...
  - `bp_get_desired_input_config()` -> `UIInputConfig` — Implement to provide the input config to use when this widget is activated. Keep in mind when all widgets are deactivate...
  - `bp_on_activated()` -> `None` — BP on Activated
  - `bp_on_deactivated()` -> `None` — BP on Deactivated
  - `bp_on_handle_back_action()` -> `bool` — Override in BP implementations to provide custom behavior when receiving a back action Note: Only called if native code ...
  - `clear_focus_restoration_target()` -> `None` — Clears the cached focus target thatâs set when bAutoRestoreFocus is true
  - `deactivate_widget()` -> `None` — Deactivate Widget
  - `get_desired_focus_target()` -> `Widget` — Returns the desired widget to focus when this Widget Activates.
  - `is_activated()` -> `bool` — Is Activated
  - `request_refresh_focus()` -> `None` — Ask for focus to be re-set to our current DesiredFocusTarget, but only if our node is currently the leaf-most active nod...
  - `set_bind_visibilities(on_activated_visibility, on_deactivated_visibility, all_active)` -> `None` — Visibilities to use for when bound widgets in BindVisibilityToActivation are activated.

**Properties** (5):
  - `action_domain_override`: `CommonInputActionDomain` [Read-Only] — [Read-Only] Enable to override the inherited ActionDomain from owning CommonActivatableWidget. (Comm...
  - `bp_on_widget_activated`: `OnWidgetActivationChanged` — [Read-Write] Fires when the widget is activated. (OnWidgetActivationChanged)
  - `bp_on_widget_deactivated`: `OnWidgetActivationChanged` — [Read-Write] Fires when the widget is deactivated. (OnWidgetActivationChanged)
  - `is_active`: `bool` [Read-Only] — [Read-Only] (bool)
  - `override_action_domain`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.CommonActivatableWidgetContainerBase`
Inherits: `Widget` | Header: `CommonActivatableWidgetContainer.h`

Base of widgets built to manage N activatable widgets, displaying one at a time. Intentionally meant to be black boxes that do not expose child/slot modification like a normal panel widget.

**Methods** (6):
  - `bp_add_widget(activatable_widget_class)` -> `CommonActivatableWidget` — Adds a widget of the given class to the container. Note that all widgets added to the container are pooled, so the calle...
  - `clear_widgets()` -> `None` — Clear Widgets
  - `get_active_widget()` -> `CommonActivatableWidget` — Get Active Widget
  - `get_transition_duration()` -> `float` — Get Transition Duration
  - `remove_widget(widget_to_remove)` -> `None` — Remove Widget
  - `set_transition_duration(duration)` -> `None` — Set Transition Duration

**Properties** (1):
  - `transition_fallback_strategy`: `CommonSwitcherTransitionFallbackStrategy` [Read-Only] — [Read-Only] Controls how we will choose another widget if a transitioning widget is removed during t...

### `unreal.CommonActivatableWidgetQueue`
Inherits: `CommonActivatableWidgetContainerBase` | Header: `CommonActivatableWidgetContainer.h`

A display queue of ActivatableWidget elements.

### `unreal.CommonActivatableWidgetStack`
Inherits: `CommonActivatableWidgetContainerBase` | Header: `CommonActivatableWidgetContainer.h`

A display stack of ActivatableWidget elements.

### `unreal.CommonActivatableWidgetSwitcher`
Inherits: `CommonAnimatedSwitcher` | Header: `CommonActivatableWidgetSwitcher.h`

An animated switcher that knows about CommonActivatableWidgets. It can also hold other Widgets.

**Properties** (1):
  - `clear_focus_restoration_target_of_deactivated_widgets`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.CommonAnimatedSwitcher`
Inherits: `WidgetSwitcher` | Header: `CommonAnimatedSwitcher.h`

A widget switcher that activates / deactivates CommonActivatableWidgets, allowing for associated animations to trigger.

**Methods** (6):
  - `activate_next_widget(can_wrap)` -> `None` — Activate Next Widget
  - `activate_previous_widget(can_wrap)` -> `None` — Activate Previous Widget
  - `has_widgets()` -> `bool` — Has Widgets
  - `is_currently_switching()` -> `bool` — Is Currently Switching
  - `is_transition_playing()` -> `bool` — Is the switcher playing a transition animation?
  - `set_disable_transition_animation(disable_animation)` -> `None` — Set Disable Transition Animation

**Properties** (5):
  - `on_active_widget_index_changed_bp`: `OnActiveIndexChangedDelegate` — [Read-Write] Fires when the active widget displayed by the switcher changes (OnActiveIndexChangedDel...
  - `transition_curve_type`: `TransitionCurve` [Read-Only] — [Read-Only] The curve function type to apply to the transition animation (TransitionCurve)
  - `transition_duration`: `float` [Read-Only] — [Read-Only] The total duration of a single transition between widgets (float)
  - `transition_fallback_strategy`: `CommonSwitcherTransitionFallbackStrategy` [Read-Only] — [Read-Only] Controls how we will choose another widget if a transitioning widget is removed during t...
  - `transition_type`: `CommonSwitcherTransition` [Read-Only] — [Read-Only] The type of transition to play between widgets (CommonSwitcherTransition)

### `unreal.CommonBorder`
Inherits: `Border` | Header: `CommonBorder.h`

Uses the border style template defined in CommonUI project settings by default

**Methods** (1):
  - `set_style(style)` -> `None` — Set Style

**Properties** (3):
  - `minimum_padding`: `Margin` [Read-Only] — [Read-Only] The minimum padding we will reduce to when the safezone grows (Margin)
  - `reduce_padding_by_safezone`: `bool` [Read-Only] — [Read-Only] Turning this on will cause the safe zone size to be removed from this borders content pa...
  - `style`: `Class` [Read-Only] — [Read-Only] References the border style to use (type(Class))

### `unreal.CommonBorderStyle`
Inherits: `Object` | Header: `CommonBorder.h`

â- All properties must be EditDefaultsOnly, BlueprintReadOnly !!! ââ We return the CDO to blueprints, so we cannot allow any changes (blueprint doesnât support const variables)

**Methods** (1):
  - `get_background_brush()` -> `SlateBrush` — Get Background Brush

**Properties** (1):
  - `background`: `SlateBrush` [Read-Only] — [Read-Only] The brush for the background of the border (SlateBrush)

### `unreal.CommonBoundActionBar`
Inherits: `DynamicEntryBoxBase` | Header: `CommonBoundActionBar.h`

A box populated with current actions available per CommonUIâs Input Handler.

**Methods** (1):
  - `set_display_owning_player_actions_only(should_only_display_owning_player_actions)` -> `None` — Set Display Owning Player Actions Only

**Properties** (1):
  - `on_action_bar_updated`: `ActionBarUpdated` — [Read-Write] (ActionBarUpdated)

### `unreal.CommonBoundActionButton`
Inherits: `CommonButtonBase` | Header: `CommonBoundActionButton.h`

Common Bound Action Button

**Methods** (1):
  - `on_update_input_action()` -> `None` — On Update Input Action

**Properties** (1):
  - `text_action_name`: `CommonTextBlock` [Read-Only] — [Read-Only] (CommonTextBlock)

### `unreal.CommonButtonBase`
Inherits: `CommonUserWidget` | Header: `CommonButtonBase.h`

Button that disables itself when not active. Also updates actions for CommonActionWidget if bound to display platform-specific icons.

**Methods** (73):
  - `bp_on_clicked()` -> `None` — BP on Clicked
  - `bp_on_deselected()` -> `None` — BP on Deselected
  - `bp_on_disabled()` -> `None` — BP on Disabled
  - `bp_on_double_clicked()` -> `None` — BP on Double Clicked
  - `bp_on_enabled()` -> `None` — BP on Enabled
  - `bp_on_focus_lost()` -> `None` — BP on Focus Lost
  - `bp_on_focus_received()` -> `None` — BP on Focus Received
  - `bp_on_hovered()` -> `None` — BP on Hovered
  - `bp_on_input_action_triggered()` -> `None` — BP on Input Action Triggered
  - `bp_on_input_method_changed(current_input_type)` -> `None` — BP on Input Method Changed
  - `bp_on_lock_clicked()` -> `None` — BP on Lock Clicked
  - `bp_on_lock_double_clicked()` -> `None` — BP on Lock Double Clicked
  - `bp_on_locked_changed(is_locked)` -> `None` — BP on Locked Changed
  - `bp_on_pressed()` -> `None` — BP on Pressed
  - `bp_on_released()` -> `None` — BP on Released
  - `bp_on_selected()` -> `None` — BP on Selected
  - `bp_on_unhovered()` -> `None` — BP on Unhovered
  - `clear_selection()` -> `None` — Clear Selection
  - `disable_button_with_reason(disabled_reason)` -> `None` — Disables this button with a reason (use instead of SetIsEnabled)
  - `get_current_button_padding()` -> `Margin`
  - `get_current_custom_padding()` -> `Margin`
  - `get_current_text_style()` -> `CommonTextStyle`
  - `get_current_text_style_class()`
  - `get_enhanced_input_action()` -> `InputAction` — Gets the appropriate enhanced input action that is set
  - `get_input_action()` -> `DataTableRowHandle or None` — Gets the appropriate input action that is set
  - `get_is_focusable()` -> `bool` — Gets the bIsFocusable flag
  - `get_locked()` -> `bool`
  - `get_required_hold_time()` -> `float` — Returns required hold time for performing a triggering action.
  - `get_requires_hold()` -> `bool` — Returns true if this button has a hold behavior, even if the triggering action is not holdable.
  - `get_selected()` -> `bool`
  - `get_should_select_upon_receiving_focus()` -> `bool` — Get whether the button should become selected upon receiving focus or not
  - `get_single_material_style_mid()` -> `MaterialInstanceDynamic` — Returns the dynamic instance of the material being used for this button, if it is using a single material style.
  - `get_style()` -> `CommonButtonStyle`
  - `is_interaction_enabled()` -> `bool` — Is this button currently interactable? (use instead of GetIsEnabled)
  - `is_pressed()` -> `bool` — Is this button currently pressed?
  - `on_action_complete()` -> `None` — Callback fired when hold events complete
  - `on_action_progress(held_percent)` -> `None` — Callback fired continously during hold interactions
  - `on_current_text_style_changed()` -> `None` — Allows derived classes to take action when the current text style has changed
  - `on_triggered_input_action_changed(new_triggered_action)` -> `None` — Callback fired when input action datatable row changes
  - `on_triggering_enhanced_input_action_changed(input_action)` -> `None` — Callback fired when enhanced input action changes
  - `on_triggering_input_action_changed(new_triggered_action)` -> `None` — Callback fired when triggered input action datatable row changes
  - `set_click_method(click_method)` -> `None` — Set the click method for mouse interaction
  - `set_clicked_sound_override(sound)` -> `None` — Set Clicked Sound Override
  - `set_hide_input_action(hide_input_action)` -> `None` — Set Hide Input Action
  - `set_hovered_sound_override(sound)` -> `None` — Set Hovered Sound Override
  - `set_input_action_progress_material(progress_material_brush, progress_material_param)` -> `None` — Set Input Action Progress Material
  - `set_is_focusable(is_focusable)` -> `None` — Updates the bIsFocusable flag
  - `set_is_interactable_when_selected(interactable_when_selected)` -> `None` — Change whether this widget is selectable at all. If false and currently selected, will deselect.
  - `set_is_interaction_enabled(is_interaction_enabled)` -> `None` — Change whether this widget is selectable at all. If false and currently selected, will deselect.
  - `set_is_locked(is_locked)` -> `None` — Change whether this widget is locked. If locked, the button can be focusable and responsive to mouse input but will not ...
  - `set_is_selectable(is_selectable)` -> `None` — Change whether this widget is selectable at all. If false and currently selected, will deselect.
  - `set_is_selected(selected, give_click_feedback = True)` -> `None` — Change the selected state manually.
  - `set_is_toggleable(is_toggleable)` -> `None` — Change whether this widget is toggleable. If toggleable, clicking when selected will deselect.
  - `set_locked_clicked_sound_override(sound)` -> `None` — Set Locked Clicked Sound Override
  - `set_locked_hovered_sound_override(sound)` -> `None` — Set Locked Hovered Sound Override
  - `set_locked_pressed_sound_override(sound)` -> `None` — Set Locked Pressed Sound Override
  - `set_max_dimensions(max_width, max_height)` -> `None` — Sets the maximum dimensions of this button
  - `set_min_dimensions(min_width, min_height)` -> `None` — Sets the minimum dimensions of this button
  - `set_press_method(press_method)` -> `None` — Set the click method for keyboard/gamepad button press interaction
  - `set_pressed_sound_override(sound)` -> `None` — Set Pressed Sound Override
  - `set_requires_hold(requires_hold)` -> `None` — Change whether this button should have a hold behavior even if the triggering action is not holdable.
  - `set_selected_clicked_sound_override(sound)` -> `None` — Set Selected Clicked Sound Override
  - `set_selected_hovered_sound_override(sound)` -> `None` — Set Selected Hovered Sound Override
  - `set_selected_internal(selected, allow_sound = True, broadcast = True)` -> `None` — Internal method to allow the selected state to be set regardless of selectability or toggleability
  - `set_selected_pressed_sound_override(sound)` -> `None` — Set Selected Pressed Sound Override
  - `set_should_select_upon_receiving_focus(should_select_upon_receiving_focus)` -> `None` — Set whether the button should become selected upon receiving focus or not; Only settable for buttons that are selectable
  - `set_should_use_fallback_default_input_action(should_use_fallback_default_input_action)` -> `None` — Change whether this widget should use the fallback default input action.
  - `set_style(style = None)` -> `None` — Sets the style of this button, rebuilds the internal styling
  - `set_touch_method(touch_method)` -> `None` — Set the click method for touch interaction
  - `set_triggered_input_action(input_action_row)` -> `None` — Updates the current triggered action
  - `set_triggering_enhanced_input_action(input_action)` -> `None` — Updates the current triggering enhanced input action, requires enhanced input enabled in CommonUI settings
  - `set_triggering_input_action(input_action_row)` -> `None` — Updates the current triggering action
  - `stop_double_click_propagation()` -> `None` — Unless this is called, we will assume the double click should be converted into a normal click.

**Properties** (48):
  - `apply_alpha_on_disable`: `bool` [Read-Only] — [Read-Only] The type of mouse action required by the user to trigger the buttonâs âClickâ (boo...
  - `click_event`: `WidgetEventField` [Read-Only] — [Read-Only] (WidgetEventField)
  - `click_method`: `ButtonClickMethod` [Read-Only] — [Read-Only] The type of mouse action required by the user to trigger the buttonâs âClickâ (But...
  - `clicked_slate_sound_override`: `SlateSound` [Read-Only] — [Read-Only] Optional override for the sound to play when this button is clicked (based on Click/Touc...
  - `display_input_action_when_not_interactable`: `bool` [Read-Only] — [Read-Only] True if the input action should be displayed when the button is not interactable (bool)
  - `hide_input_action`: `bool` [Read-Only] — [Read-Only] Whether to hide the input action widget at all times (useful for textless small buttons)...
  - `hide_input_action_with_keyboard`: `bool` [Read-Only] — [Read-Only] True if the input action should be hidden while the user is using a keyboard (bool)
  - `hold_data`: `Class` [Read-Only] — [Read-Only] Press and Hold values used for Keyboard and Mouse, Gamepad and Touch, depending on the c...
  - `hovered_slate_sound_override`: `SlateSound` [Read-Only] — [Read-Only] Optional override for the sound to play when this button is hovered.
Also used for the S...
  - `input_action_widget`: `CommonActionWidget` [Read-Only] — [Read-Only] Optionally bound widget for visualization behavior of an input action;
NOTE: If specifie...
  - `input_priority`: `int` [Read-Only] — [Read-Only] This is the priority for the TriggeringInputAction.  The first, HIGHEST PRIORITY widget ...
  - `interactable_when_selected`: `bool` [Read-Only] — [Read-Only] If true, the button may be clicked while selected. Otherwise, interaction is disabled in...
  - `locked`: `bool` [Read-Only] — [Read-Only] True if this button is currently locked.
Locked button can be hovered, focused, and pres...
  - `locked_clicked_slate_sound_override`: `SlateSound` [Read-Only] — [Read-Only] Optional override for the sound to play when this button is clicked while Locked (SlateS...
  - `locked_hovered_slate_sound_override`: `SlateSound` [Read-Only] — [Read-Only] Optional override for the sound to play when this button is hovered while Locked (SlateS...
  - `locked_pressed_slate_sound_override`: `SlateSound` [Read-Only] — [Read-Only] Optional override for the sound to play when this button is pressed while Locked (SlateS...
  - `max_height`: `int` [Read-Only] — [Read-Only] The maximum height of the button (only used if greater than the styleâs maximum) (int3...
  - `max_width`: `int` [Read-Only] — [Read-Only] The maximum width of the button (only used if greater than the styleâs maximum) (int32...
  - `min_height`: `int` [Read-Only] — [Read-Only] The minimum height of the button (only used if greater than the styleâs minimum) (int3...
  - `min_width`: `int` [Read-Only] — [Read-Only] The minimum width of the button (only used if greater than the styleâs minimum) (int32...
  - `navigate_to_next_widget_on_disable`: `bool` [Read-Only] — [Read-Only] If this button is currently in focus, and is disabled, hidden, or collapsed then focus w...
  - `on_button_base_clicked`: `CommonButtonBaseClicked` — [Read-Write] (CommonButtonBaseClicked)
  - `on_button_base_double_clicked`: `CommonButtonBaseClicked` — [Read-Write] (CommonButtonBaseClicked)
  - `on_button_base_focused`: `CommonButtonBaseClicked` — [Read-Write] (CommonButtonBaseClicked)
  - `on_button_base_hovered`: `CommonButtonBaseClicked` — [Read-Write] (CommonButtonBaseClicked)
  - `on_button_base_lock_clicked`: `CommonButtonBaseClicked` — [Read-Write] (CommonButtonBaseClicked)
  - `on_button_base_lock_double_clicked`: `CommonButtonBaseClicked` — [Read-Write] (CommonButtonBaseClicked)
  - `on_button_base_selected`: `CommonButtonBaseClicked` — [Read-Write] (CommonButtonBaseClicked)
  - `on_button_base_unfocused`: `CommonButtonBaseClicked` — [Read-Write] (CommonButtonBaseClicked)
  - `on_button_base_unhovered`: `CommonButtonBaseClicked` — [Read-Write] (CommonButtonBaseClicked)
  - `on_button_base_unselected`: `CommonButtonBaseClicked` — [Read-Write] (CommonButtonBaseClicked)
  - `on_selected_changed_base`: `CommonSelectedStateChangedBase` — [Read-Write] (CommonSelectedStateChangedBase)
  - `press_method`: `ButtonPressMethod` [Read-Only] — [Read-Only] (ButtonPressMethod)
  - `pressed_slate_sound_override`: `SlateSound` [Read-Only] — [Read-Only] Optional override for the sound to play when this button is pressed.
Also used for the S...
  - `requires_hold`: `bool` [Read-Only] — [Read-Only] True if this button should have a press and hold behavior, triggering the click when the...
  - `selectable`: `bool` [Read-Only] — [Read-Only] True if the button supports being in a âselectedâ state, which will update the style...
  - `selected_clicked_slate_sound_override`: `SlateSound` [Read-Only] — [Read-Only] Optional override for the sound to play when this button is clicked while Selected (Slat...
  - `selected_hovered_slate_sound_override`: `SlateSound` [Read-Only] — [Read-Only] Optional override for the sound to play when this button is hovered while Selected (Slat...
  - `selected_pressed_slate_sound_override`: `SlateSound` [Read-Only] — [Read-Only] Optional override for the sound to play when this button is pressed while Selected (Slat...
  - `should_select_upon_receiving_focus`: `bool` [Read-Only] — [Read-Only] If true, the button will be selected when it receives focus. (bool)
  - `should_use_fallback_default_input_action`: `bool` [Read-Only] — [Read-Only] True if this button should use the default fallback input action (bool is useful for but...
  - `simulate_hover_on_touch_input`: `bool` [Read-Only] — [Read-Only] True if this button should play the hover effect when pressed by a touch input (bool)
  - `style`: `Class` [Read-Only] — [Read-Only] References the button style asset that defines a style in multiple sizes (type(Class))
  - `toggleable`: `bool` [Read-Only] — [Read-Only] True if the button can be deselected by clicking it when selected (bool)
  - `touch_method`: `ButtonTouchMethod` [Read-Only] — [Read-Only] (ButtonTouchMethod)
  - `trigger_clicked_after_selection`: `bool` [Read-Only] — [Read-Only] (bool)
  - `triggering_enhanced_input_action`: `InputAction` [Read-Only] — [Read-Only] The enhanced input action that is bound to this button. The common input manager will tr...
  - `triggering_input_action`: `DataTableRowHandle` [Read-Only] — [Read-Only] The input action that is bound to this button. The common input manager will trigger thi...

### `unreal.CommonButtonGroupBase`
Inherits: `CommonWidgetGroupBase` | Header: `CommonButtonGroupBase.h`

Manages an arbitrary collection of CommonButton widgets. Ensures that no more (and optionally, no less) than one button in the group is selected at a time

**Methods** (12):
  - `deselect_all()` -> `None` — Deselects all buttons in the group.
  - `find_button_index(button_to_find)` -> `int32` — Find the button index of the specified button, if possible
  - `get_button_base_at_index(index)` -> `CommonButtonBase` — Get Button Base at Index
  - `get_button_count()` -> `int32` — Get Button Count
  - `get_hovered_button_index()` -> `int32` — Get the index of the currently hovered button, if any.
  - `get_selected_button_base()` -> `CommonButtonBase` — Get Selected Button Base
  - `get_selected_button_index()` -> `int32` — Get the index of the currently selected button, if any.
  - `has_any_buttons()` -> `bool` — Has Any Buttons
  - `select_button_at_index(button_index, allow_sound = True)` -> `None` — Selects a button at a specific index in the group. Clears all selection if given an invalid index.
  - `select_next_button(allow_wrap = True)` -> `None` — Selects the next button in the group
  - `select_previous_button(allow_wrap = True)` -> `None` — Selects the previous button in the group
  - `set_selection_required(require_selection)` -> `None` — Sets whether the group should always have a button selected.

**Properties** (8):
  - `on_button_base_clicked`: `SimpleButtonBaseGroupDelegate` — [Read-Write] (SimpleButtonBaseGroupDelegate)
  - `on_button_base_double_clicked`: `SimpleButtonBaseGroupDelegate` — [Read-Write] (SimpleButtonBaseGroupDelegate)
  - `on_button_base_lock_clicked`: `SimpleButtonBaseGroupDelegate` — [Read-Write] (SimpleButtonBaseGroupDelegate)
  - `on_button_base_lock_double_clicked`: `SimpleButtonBaseGroupDelegate` — [Read-Write] (SimpleButtonBaseGroupDelegate)
  - `on_hovered_button_base_changed`: `SimpleButtonBaseGroupDelegate` — [Read-Write] (SimpleButtonBaseGroupDelegate)
  - `on_selected_button_base_changed`: `SimpleButtonBaseGroupDelegate` — [Read-Write] (SimpleButtonBaseGroupDelegate)
  - `on_selection_cleared`: `OnSelectionCleared` — [Read-Write] (OnSelectionCleared)
  - `selection_required`: `bool` [Read-Only] — [Read-Only] If true, the group will force that a button be selected at all times (bool)

### `unreal.CommonButtonInternalBase`
Inherits: `Button` | Header: `CommonButtonBase.h`

Custom UButton override that allows us to disable clicking without disabling the widget entirely

**Properties** (1):
  - `on_double_clicked`: `OnButtonClickedEvent` — [Read-Write] Called when the button is clicked (OnButtonClickedEvent)

### `unreal.CommonButtonStyle`
Inherits: `Object` | Header: `CommonButtonBase.h`

â- All properties must be EditDefaultsOnly, BlueprintReadOnly !!! ââ * we return the CDO to blueprints, so we cannot allow any changes (blueprint doesnât support const variables)

**Methods** (15):
  - `get_button_padding()` -> `Margin` — Get Button Padding
  - `get_custom_padding()` -> `Margin` — Get Custom Padding
  - `get_disabled_brush()` -> `SlateBrush` — Get Disabled Brush
  - `get_disabled_text_style()` -> `CommonTextStyle` — Get Disabled Text Style
  - `get_material_brush()` -> `SlateBrush` — Get Material Brush
  - `get_normal_base_brush()` -> `SlateBrush` — Get Normal Base Brush
  - `get_normal_hovered_brush()` -> `SlateBrush` — Get Normal Hovered Brush
  - `get_normal_hovered_text_style()` -> `CommonTextStyle` — Get Normal Hovered Text Style
  - `get_normal_pressed_brush()` -> `SlateBrush` — Get Normal Pressed Brush
  - `get_normal_text_style()` -> `CommonTextStyle` — Get Normal Text Style
  - `get_selected_base_brush()` -> `SlateBrush` — Get Selected Base Brush
  - `get_selected_hovered_brush()` -> `SlateBrush` — Get Selected Hovered Brush
  - `get_selected_hovered_text_style()` -> `CommonTextStyle` — Get Selected Hovered Text Style
  - `get_selected_pressed_brush()` -> `SlateBrush` — Get Selected Pressed Brush
  - `get_selected_text_style()` -> `CommonTextStyle` — Get Selected Text Style

**Properties** (29):
  - `button_padding`: `Margin` [Read-Only] — [Read-Only] The button content padding to apply for each size (Margin)
  - `clicked_slate_sound`: `SlateSound` [Read-Only] — [Read-Only] The sound to play when the button is clicked (SlateSound)
  - `custom_padding`: `Margin` [Read-Only] — [Read-Only] The custom padding of the button to use for each size (Margin)
  - `disabled`: `SlateBrush` [Read-Only] — [Read-Only] The disabled brush to apply to each size of this button (SlateBrush)
  - `disabled_text_style`: `Class` [Read-Only] — [Read-Only] The text style to use when disabled (type(Class))
  - `hovered_slate_sound`: `SlateSound` [Read-Only] — [Read-Only] The sound to play when the button is hovered (SlateSound)
  - `locked_clicked_slate_sound`: `CommonButtonStyleOptionalSlateSound` [Read-Only] — [Read-Only] The sound to play when the button is clicked while locked (CommonButtonStyleOptionalSlat...
  - `locked_hovered_slate_sound`: `CommonButtonStyleOptionalSlateSound` [Read-Only] — [Read-Only] The sound to play when the button is hovered while locked (CommonButtonStyleOptionalSlat...
  - `locked_pressed_slate_sound`: `CommonButtonStyleOptionalSlateSound` [Read-Only] — [Read-Only] The sound to play when the button is pressed while locked (CommonButtonStyleOptionalSlat...
  - `max_height`: `int` [Read-Only] — [Read-Only] The maximum height of buttons using this style (int32)
  - `max_width`: `int` [Read-Only] — [Read-Only] The maximum width of buttons using this style (int32)
  - `min_height`: `int` [Read-Only] — [Read-Only] The minimum height of buttons using this style (int32)
  - `min_width`: `int` [Read-Only] — [Read-Only] The minimum width of buttons using this style (int32)
  - `normal_base`: `SlateBrush` [Read-Only] — [Read-Only] The normal (un-selected) brush to apply to each size of this button (SlateBrush)
  - `normal_hovered`: `SlateBrush` [Read-Only] — [Read-Only] The normal (un-selected) brush to apply to each size of this button when hovered (SlateB...
  - `normal_hovered_text_style`: `Class` [Read-Only] — [Read-Only] The text style to use when un-selected (type(Class))
  - `normal_pressed`: `SlateBrush` [Read-Only] — [Read-Only] The normal (un-selected) brush to apply to each size of this button when pressed (SlateB...
  - `normal_text_style`: `Class` [Read-Only] — [Read-Only] The text style to use when un-selected (type(Class))
  - `pressed_slate_sound`: `SlateSound` [Read-Only] — [Read-Only] The sound to play when the button is pressed (SlateSound)
  - `selected_base`: `SlateBrush` [Read-Only] — [Read-Only] The selected brush to apply to each size of this button (SlateBrush)
  - `selected_clicked_slate_sound`: `CommonButtonStyleOptionalSlateSound` [Read-Only] — [Read-Only] The sound to play when the button is clicked while selected (CommonButtonStyleOptionalSl...
  - `selected_hovered`: `SlateBrush` [Read-Only] — [Read-Only] The selected brush to apply to each size of this button when hovered (SlateBrush)
  - `selected_hovered_slate_sound`: `CommonButtonStyleOptionalSlateSound` [Read-Only] — [Read-Only] The sound to play when the button is hovered while selected (CommonButtonStyleOptionalSl...
  - `selected_hovered_text_style`: `Class` [Read-Only] — [Read-Only] The text style to use when un-selected (type(Class))
  - `selected_pressed`: `SlateBrush` [Read-Only] — [Read-Only] The selected brush to apply to each size of this button when pressed (SlateBrush)
  - `selected_pressed_slate_sound`: `CommonButtonStyleOptionalSlateSound` [Read-Only] — [Read-Only] The sound to play when the button is pressed while selected (CommonButtonStyleOptionalSl...
  - `selected_text_style`: `Class` [Read-Only] — [Read-Only] The text style to use when selected (type(Class))
  - `single_material`: `bool` [Read-Only] — [Read-Only] Whether or not the style uses a drop shadow (bool)
  - `single_material_brush`: `SlateBrush` [Read-Only] — [Read-Only] The normal (un-selected) brush to apply to each size of this button (SlateBrush)

### `unreal.CommonCustomNavigation`
Inherits: `Border` | Header: `CommonCustomNavigation.h`

Exposes a bindable event that can be used to stomp default border navigation with custom behaviors.

### `unreal.CommonDateTimeTextBlock`
Inherits: `CommonTextBlock` | Header: `CommonDateTimeTextBlock.h`

Common Date Time Text Block

**Methods** (4):
  - `get_date_time()` -> `DateTime` — Get Date Time
  - `set_count_down_completion_text(completion_text)` -> `None` — Set Count Down Completion Text
  - `set_date_time_value(date_time, show_as_countdown, refresh_delay = 1.000000)` -> `None` — Set Date Time Value
  - `set_timespan_value(timespan)` -> `None` — Set Timespan Value

### `unreal.CommonGenericInputActionDataTable`
Inherits: `DataTable` | Header: `CommonGenericInputActionDataTable.h`

Overrides postload to allow for derived classes to perform code-level changes to the datatable. Ex: Per-platform edits. Allows modification of datatable data without checking out the data table asset.

### `unreal.CommonHardwareVisibilityBorder`
Inherits: `CommonBorder` | Header: `CommonHardwareVisibilityBorder.h`

A container that controls visibility based on Platform, Input

### `unreal.CommonHierarchicalScrollBox`
Inherits: `ScrollBox` | Header: `CommonHierarchicalScrollBox.h`

An arbitrary scrollable collection of widgets. Great for presenting 10-100 widgets in a list. Doesnât support virtualization.

### `unreal.CommonInputMetadata`
Inherits: `Object` | Header: `CommonUITypes.h`

Metadata CommonUI will try to acquire from Enhanced Input Mapping Contexts (IMC)

**Properties** (2):
  - `is_generic_input_action`: `bool` [Read-Only] — [Read-Only] Generic actions like accept or face button top will be subscribed to by multiple
UI elem...
  - `nav_bar_priority`: `int` [Read-Only] — [Read-Only] Priority in nav-bar (int32)

### `unreal.CommonLazyImage`
Inherits: `Image` | Header: `CommonLazyImage.h`

A special Image widget that can show unloaded images and takes care of the loading for you!

**Methods** (5):
  - `is_loading()` -> `bool` — Is Loading
  - `set_brush_from_lazy_display_asset(lazy_object, match_texture_size = False)` -> `None` — Set the brush from a string asset ref only - expects the referenced asset to be a texture or material.
  - `set_brush_from_lazy_material(lazy_material)` -> `None` — Set the brush from a lazy material asset pointer - will load the material as needed.
  - `set_brush_from_lazy_texture(lazy_texture, match_size = False)` -> `None` — Set the brush from a lazy texture asset pointer - will load the texture as needed.
  - `set_material_texture_param_name(texture_param_name)` -> `None` — Establishes the name of the texture parameter on the currently applied brush material to which textures should be applie...

**Properties** (1):
  - `on_loading_state_changed`: `OnLoadGuardStateChangedDynamic` — [Read-Write] (OnLoadGuardStateChangedDynamic)

### `unreal.CommonLazyWidget`
Inherits: `Widget` | Header: `CommonLazyWidget.h`

A special Image widget that can show unloaded images and takes care of the loading for you!

**Methods** (3):
  - `get_content()` -> `UserWidget` — Get Content
  - `is_loading()` -> `bool` — Is Loading
  - `set_lazy_content(soft_widget)` -> `None` — Set Lazy Content

**Properties** (1):
  - `on_loading_state_changed`: `OnLoadGuardStateChangedDynamic` — [Read-Write] (OnLoadGuardStateChangedDynamic)

### `unreal.CommonListView`
Inherits: `ListView` | Header: `CommonListView.h`

UCommonListView

**Methods** (1):
  - `set_entry_spacing(entry_spacing)` -> `None` — Set Entry Spacing

### `unreal.CommonLoadGuard`
Inherits: `ContentWidget` | Header: `CommonLoadGuard.h`

The Load Guard behaves similarly to a Border, but with the ability to hide its primary content and display a loading spinner and optional message while needed content is loaded or otherwise prepared.

**Methods** (4):
  - `guard_and_load_asset(lazy_asset, on_asset_loaded)` -> `None` — BP Guard and Load Asset
  - `is_loading()` -> `bool` — Is Loading
  - `set_is_loading(is_loading)` -> `None` — Set Is Loading
  - `set_loading_text(loading_text)` -> `None` — Set Loading Text

**Properties** (1):
  - `bp_on_loading_state_changed`: `OnLoadGuardStateChangedDynamic` — [Read-Write] (OnLoadGuardStateChangedDynamic)

### `unreal.CommonMappingContextMetadata`
Inherits: `DataAsset` | Header: `CommonUITypes.h`

Base CommonUI metadata implementation for specification in IMCâs.

**Properties** (2):
  - `enhanced_input_metadata`: `CommonInputMetadata` [Read-Only] — [Read-Only] Fallback or default metadata CommonUI relies on if no per-action meta is found below (Co...
  - `per_action_enhanced_input_metadata`: `None` [Read-Only] — [Read-Only] Map of action to metadata, allows creation of single metadata asset rather than one per ...

### `unreal.CommonNumericTextBlock`
Inherits: `CommonTextBlock` | Header: `CommonNumericTextBlock.h`

Numeric text block that provides interpolation, and some type support (numbers, percents, seconds, distance).

**Methods** (5):
  - `get_target_value()` -> `float` — Returns the value this widget will ultimately show if it is interpolating, or the current value if it is not.
  - `interpolate_to_value(target_value, maximum_interpolation_duration = 3.000000, minimum_change_rate = 1.000000, outro_offset = 0.000000)` -> `None` — Starts an ongoing process of interpolating the current numeric value to the specified target value. The interpolation pr...
  - `is_interpolating_numeric_value()` -> `bool` — Is Interpolating Numeric Value
  - `set_current_value(new_value)` -> `None` — Sets the current numeric value. NOTE: Cancels any ongoing interpolation!
  - `set_numeric_type(numeric_type)` -> `None` — Set Numeric Type

**Properties** (11):
  - `current_numeric_value`: `float` [Read-Only] — The displayed text is very likely not identical to this value, due to formatting. (float) [Read-Only...
  - `ease_out_interpolation_exponent`: `float` [Read-Only] — [Read-Only] Exponent parameter for the âease outâ interpolation curve. Must be > 0, but should b...
  - `formatting_specification`: `CommonNumberFormattingOptions` [Read-Only] — [Read-Only] The specifications for how the current numeric value should be formatted in to numeral t...
  - `interpolation_update_interval`: `float` [Read-Only] — Interpolation updates may occur further apart due to tick rates. (float) [Read-Only] The desired int...
  - `numeric_type`: `CommonNumericType` [Read-Only] — [Read-Only] (CommonNumericType)
  - `on_interpolation_ended_event`: `OnInterpolationEnded` — [Read-Write] Event triggered when interpolation has ended. (OnInterpolationEnded)
  - `on_interpolation_started_event`: `OnInterpolationStarted` — [Read-Write] Event triggered when interpolation has started. (OnInterpolationStarted)
  - `on_interpolation_updated_event`: `OnInterpolationUpdated` — [Read-Write] Event triggered when interpolation has updated. (OnInterpolationUpdated)
  - `on_outro_event`: `OnOutro` — [Read-Write] Event triggered at a specified time before the interpolation completes, for âoutroâ...
  - `perform_size_interpolation`: `bool` [Read-Only] — [Read-Only] (bool)
  - `post_interpolation_shrink_duration`: `float` [Read-Only] — [Read-Only] The desired width of the formatted text may change rapidly and erratically during interp...

### `unreal.CommonPoolableWidgetInterface`
Inherits: `Interface` | Header: `CommonPoolableWidgetInterface.h`

Common Poolable Widget Interface

**Methods** (2):
  - `on_acquire_from_pool()` -> `None` — On Acquire from Pool
  - `on_release_to_pool()` -> `None` — On Release to Pool

### `unreal.CommonRichTextBlock`
Inherits: `RichTextBlock` | Header: `CommonRichTextBlock.h`

Text block that supports custom scaling for mobile platforms, with option to only show icons if space is sparse.

**Methods** (2):
  - `set_scrolling_enabled(is_scrolling_enabled)` -> `None` — Set Scrolling Enabled
  - `set_style(style)` -> `None` — Set Style

**Properties** (5):
  - `auto_collapse_with_empty_text`: `bool` [Read-Only] — [Read-Only] True to automatically collapse this rich text block when set to display an empty string....
  - `display_all_caps`: `bool` — [Read-Write] True to always display text in ALL CAPS
deprecated: bDisplayAllCaps is deprecated. Plea...
  - `is_scrolling_enabled`: `bool` [Read-Only] — [Read-Only] If scrolling is enabled/disabled initially, this can be updated in blueprint (bool)
  - `scroll_orientation`: `Orientation` [Read-Only] — [Read-Only] The orientation the text will scroll if out of bounds. (Orientation)
  - `scroll_style`: `Class` [Read-Only] — [Read-Only] References the scroll style asset to use, no reference disables scrolling (type(Class))

### `unreal.CommonRotator`
Inherits: `CommonButtonBase` | Header: `CommonRotator.h`

A button that can rotate between given text labels.

**Methods** (8):
  - `bp_on_option_selected(index)` -> `None` — BP on Option Selected
  - `bp_on_options_populated(count)` -> `None` — BP on Options Populated
  - `get_selected_index()` -> `int32` — Gets the current selected index
  - `get_selected_text()` -> `Text` — Gets the current text value of the slider.
  - `populate_text_labels(labels)` -> `None` — Set the array of texts available
  - `set_selected_item(value)` -> `None` — Sets the current value of the slider.
  - `shift_text_left()` -> `None` — Shift the current text left.
  - `shift_text_right()` -> `None` — Shift the current text right.

**Properties** (3):
  - `my_text`: `CommonTextBlock` [Read-Only] — [Read-Only] The displayed text (CommonTextBlock)
  - `on_rotated`: `OnRotated` — [Read-Write] (OnRotated)
  - `on_rotated_with_direction`: `OnRotatedWithDirection` — [Read-Write] Called when the Selected state of this button changes. Provides the direction of rotati...

### `unreal.CommonTabListWidgetBase`
Inherits: `CommonUserWidget` | Header: `CommonTabListWidgetBase.h`

Base class for a list of selectable tabs that correspondingly activate and display an arbitrary widget in a linked switcher

**Methods** (22):
  - `disable_tab_with_reason(tab_name_id, reason)` -> `None` — Disables the tab associated with the given ID with a reason
  - `get_active_tab()` -> `Name`
  - `get_linked_switcher()` -> `CommonAnimatedSwitcher`
  - `get_selected_tab_id()` -> `Name` — Get Selected Tab Id
  - `get_tab_button_base_by_id(tab_name_id)` -> `CommonButtonBase` — Returns the tab button matching the ID, if found
  - `get_tab_count()` -> `int32` — Get Tab Count
  - `get_tab_id_at_index(index)` -> `Name` — Get Tab Id at Index
  - `handle_post_linked_switcher_changed_bp()` -> `None` — Handle Post Linked Switcher Changed BP
  - `handle_pre_linked_switcher_changed_bp()` -> `None` — Handle Pre Linked Switcher Changed BP
  - `handle_tab_creation(tab_name_id, tab_button)` -> `None` — Handle Tab Creation
  - `handle_tab_removal(tab_name_id, tab_button)` -> `None` — Handle Tab Removal
  - `has_tab_content_widget(tab_name_id)` -> `bool` — Checks if a tab has an associated content widget
  - `register_tab(tab_name_id, button_widget_type, content_widget, tab_index = -1)` -> `bool` — INDEX_NONE
  - `register_tab_content_widget(tab_name_id, content_widget)` -> `bool` — Registers a content widget with a previously created tab with ID TabNameId. If a linked switcher has been setup, it will...
  - `remove_all_tabs()` -> `None` — Remove All Tabs
  - `remove_tab(tab_name_id)` -> `bool` — Remove Tab
  - `select_tab_by_id(tab_name_id, suppress_click_feedback = False)` -> `bool` — Selects the tab registered under the provided name ID
  - `set_linked_switcher(common_switcher)` -> `None` — Establishes the activatable widget switcher instance that this tab list should interact with
  - `set_listening_for_input(should_listen)` -> `None` — Set Listening for Input
  - `set_tab_enabled(tab_name_id, enable)` -> `None` — Sets whether the tab associated with the given ID is enabled/disabled
  - `set_tab_interaction_enabled(tab_name_id, enable)` -> `None` — Sets whether the tab associated with the given ID is interactable
  - `set_tab_visibility(tab_name_id, new_visibility)` -> `None` — Sets the visibility of the tab associated with the given ID

**Properties** (10):
  - `auto_listen_for_input`: `bool` [Read-Only] — [Read-Only] Whether to register to handle tab list input immediately upon construction (bool)
  - `next_tab_enhanced_input_action`: `InputAction` [Read-Only] — [Read-Only] The input action to listen for causing the next tab to be selected (InputAction)
  - `next_tab_input_action_data`: `DataTableRowHandle` [Read-Only] — [Read-Only] The input action to listen for causing the next tab to be selected (DataTableRowHandle)
  - `on_tab_button_creation`: `OnTabButtonCreation` — [Read-Write] Broadcasts when a new tab is created. (OnTabButtonCreation)
  - `on_tab_button_removal`: `OnTabButtonRemoval` — [Read-Write] Broadcasts when a new tab is created. (OnTabButtonRemoval)
  - `on_tab_list_rebuilt`: `OnTabListRebuilt` — [Read-Write] Broadcasts when the tab list has been rebuilt (after a new tab has been inserted rather...
  - `on_tab_selected`: `OnTabSelected` — [Read-Write] Broadcasts when a new tab is selected. (OnTabSelected)
  - `previous_tab_enhanced_input_action`: `InputAction` [Read-Only] — [Read-Only] The input action to listen for causing the previous tab to be selected (InputAction)
  - `previous_tab_input_action_data`: `DataTableRowHandle` [Read-Only] — [Read-Only] The input action to listen for causing the previous tab to be selected (DataTableRowHand...
  - `should_wrap_navigation`: `bool` [Read-Only] — [Read-Only] Whether pressing next/prev tab on the last/first tab should wrap selection to the beginn...

### `unreal.CommonTextBlock`
Inherits: `TextBlock` | Header: `CommonTextBlock.h`

Text block with automatic scrolling for FX / large texts, also supports a larger set of default styling, & custom mobile scaling.

**Methods** (12):
  - `get_margin()` -> `Margin` — Get Margin
  - `get_mobile_font_size_multiplier()` -> `float` — Get Mobile Font Size Multiplier
  - `reset_scroll_state()` -> `None` — Reset Scroll State
  - `set_apply_line_height_to_bottom_line(apply_line_height_to_bottom_line)` -> `None` — Set Apply Line Height to Bottom Line
  - `set_line_height_percentage(line_height_percentage)` -> `None` — Set Line Height Percentage
  - `set_margin(margin)` -> `None` — Set Margin
  - `set_mobile_font_size_multiplier(mobile_font_size_multiplier)` -> `None` — Sets the new value and then applies the FontSizeMultiplier
  - `set_scroll_orientation(scroll_orientation)` -> `None` — Set Scroll Orientation
  - `set_scrolling_enabled(is_scrolling_enabled)` -> `None` — Set Scrolling Enabled
  - `set_style(style)` -> `None` — Set Style
  - `set_text_case(use_all_caps)` -> `None` — Set Text Case
  - `set_wrap_text_width(wrap_text_at)` -> `None` — Set Wrap Text Width

**Properties** (7):
  - `auto_collapse_with_empty_text`: `bool` [Read-Only] — [Read-Only] True to automatically collapse this text block when set to display an empty string. Conv...
  - `display_all_caps`: `bool` — [Read-Write] True to always display text in ALL CAPS
deprecated: bDisplayAllCaps is deprecated. Plea...
  - `is_scrolling_enabled`: `bool` [Read-Only] — [Read-Only] If scrolling is enabled/disabled initially, this can be updated in blueprint (bool)
  - `mobile_font_size_multiplier`: `float` — [Read-Write] Mobile font size multiplier. Activated by default on mobile. See CVar Mobile_PreviewFon...
  - `scroll_orientation`: `Orientation` [Read-Only] — [Read-Only] The orientation the text will scroll if out of bounds. (Orientation)
  - `scroll_style`: `Class` [Read-Only] — [Read-Only] References the scroll style asset to use, no reference disables scrolling (type(Class))
  - `style`: `Class` [Read-Only] — [Read-Only] References the text style to use (type(Class))

### `unreal.CommonTextScrollStyle`
Inherits: `Object` | Header: `CommonTextBlock.h`

â- All properties must be EditDefaultsOnly, BlueprintReadOnly !!! ââ We return the CDO to blueprints, so we cannot allow any changes (blueprint doesnât support const variables)

**Properties** (6):
  - `clipping`: `WidgetClipping` [Read-Only] — [Read-Only] (WidgetClipping)
  - `end_delay`: `float` [Read-Only] — [Read-Only] (float)
  - `fade_in_delay`: `float` [Read-Only] — [Read-Only] (float)
  - `fade_out_delay`: `float` [Read-Only] — [Read-Only] (float)
  - `speed`: `float` [Read-Only] — [Read-Only] (float)
  - `start_delay`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.CommonTextStyle`
Inherits: `Object` | Header: `CommonTextBlock.h`

â- All properties must be EditDefaultsOnly, BlueprintReadOnly !!! ââ We return the CDO to blueprints, so we cannot allow any changes (blueprint doesnât support const variables)

**Methods** (8):
  - `get_apply_line_height_to_bottom_line()` -> `bool` — Get Apply Line Height to Bottom Line
  - `get_color()` -> `LinearColor` — Get Color
  - `get_font()` -> `SlateFontInfo` — Get Font
  - `get_line_height_percentage()` -> `float` — Get Line Height Percentage
  - `get_margin()` -> `Margin` — Get Margin
  - `get_shadow_color()` -> `LinearColor` — Get Shadow Color
  - `get_shadow_offset()` -> `Vector2D` — Get Shadow Offset
  - `get_strike_brush()` -> `SlateBrush` — Get Strike Brush

**Properties** (9):
  - `apply_line_height_to_bottom_line`: `bool` [Read-Only] — [Read-Only] Whether to leave extra space below the last line due to line height (bool)
  - `color`: `LinearColor` [Read-Only] — [Read-Only] The color of the text (LinearColor)
  - `font`: `SlateFontInfo` [Read-Only] — [Read-Only] The font to apply at each size (SlateFontInfo)
  - `line_height_percentage`: `float` [Read-Only] — [Read-Only] The amount to scale each lines height by at each size (float)
  - `margin`: `Margin` [Read-Only] — [Read-Only] The amount of blank space left around the edges of text area at each size (Margin)
  - `shadow_color`: `LinearColor` [Read-Only] — [Read-Only] The drop shadow color (LinearColor)
  - `shadow_offset`: `Vector2D` [Read-Only] — [Read-Only] The offset of the drop shadow at each size (Vector2D)
  - `strike_brush`: `SlateBrush` [Read-Only] — [Read-Only] The brush used to draw an strike through the text (if any) (SlateBrush)
  - `uses_drop_shadow`: `bool` [Read-Only] — [Read-Only] Whether or not the style uses a drop shadow (bool)

### `unreal.CommonTileView`
Inherits: `TileView` | Header: `CommonTileView.h`

TileView specialized to navigate on focus for consoles & enable scrolling when not focused for touch

### `unreal.CommonTreeView`
Inherits: `TreeView` | Header: `CommonTreeView.h`

TreeView specialized to navigate on focus for consoles & enable scrolling when not focused for touch

### `unreal.CommonUILibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `CommonUILibrary.h`

Common UILibrary

**Methods** (1):
  - `find_parent_widget_of_type(starting_widget, type)` -> `Widget` [classmethod] — Finds the first parent widget of the given type and returns it, or null if no parent could be found.

### `unreal.CommonUIRichTextData`
Inherits: `Object` | Header: `CommonUIRichTextData.h`

Derive from this class for rich text data per game it is referenced in Common UI Settings, found in project settings UI

### `unreal.CommonUISubsystemBase`
Inherits: `GameInstanceSubsystem` | Header: `CommonUISubsystemBase.h`

Common UISubsystem Base

**Methods** (2):
  - `get_enhanced_input_action_button_icon(input_action, local_player)` -> `SlateBrush` — Gets Action Button Icon for given action and player, enhanced input API currently does not allow input type specificatio...
  - `get_input_action_button_icon(input_action_row_handle, input_type, gamepad_name)` -> `SlateBrush` — Gets Action Button Icon for current gamepad

### `unreal.CommonUIVisibilitySubsystem`
Inherits: `LocalPlayerSubsystem` | Header: `CommonUIVisibilitySubsystem.h`

Common UIVisibility Subsystem

### `unreal.CommonUserWidget`
Inherits: `UserWidget` | Header: `CommonUserWidget.h`

Common User Widget

**Methods** (3):
  - `register_scroll_recipient_external(analog_scroll_recipient)` -> `None` — Add a widget to the list of widgets to get scroll events for this input root node
  - `set_consume_pointer_input(consume_pointer_input)` -> `None` — Sets whether or not this widget will consume ALL pointer input that reaches it
  - `unregister_scroll_recipient_external(analog_scroll_recipient)` -> `None` — Remove a widget from the list of widgets to get scroll events for this input root node

**Properties** (2):
  - `consume_pointer_input`: `bool` [Read-Only] — [Read-Only] Set this to true if you donât want any pointer (mouse and touch) input to bubble past ...
  - `display_in_action_bar`: `bool` [Read-Only] — [Read-Only] True to generally display this widgetâs actions in the action bar, assuming it has act...

### `unreal.CommonVideoPlayer`
Inherits: `Widget` | Header: `CommonVideoPlayer.h`

Common Video Player

**Methods** (18):
  - `close()` -> `None` — Close
  - `get_playback_rate()` -> `float` — Get Playback Rate
  - `get_playback_time()` -> `float` — Get Playback Time
  - `get_video_duration()` -> `float` — Get Video Duration
  - `is_looping()` -> `bool` — Is Looping
  - `is_muted()` -> `bool` — Is Muted
  - `is_paused()` -> `bool` — Is Paused
  - `is_playing()` -> `bool` — Is Playing
  - `pause()` -> `None` — Pause
  - `play()` -> `None` — Play
  - `play_from_start()` -> `None` — Play from Start
  - `reverse()` -> `None` — Reverse
  - `seek(playback_time)` -> `None` — Seek
  - `set_is_muted(is_muted)` -> `None` — Set Is Muted
  - `set_looping(should_loop_playback)` -> `None` — Set Looping
  - `set_playback_rate(playback_rate)` -> `None` — Set Playback Rate
  - `set_should_match_size(match_size)` -> `None` — Set Should Match Size
  - `set_video(new_video)` -> `None` — Set Video

### `unreal.CommonVisibilitySwitcher`
Inherits: `Overlay` | Header: `CommonVisibilitySwitcher.h`

Basic switcher that toggles visibility on its children to only show one widget at a time. Activates visible widget if possible.

**Methods** (9):
  - `activate_visible_slot()` -> `None` — Activate Visible Slot
  - `deactivate_visible_slot()` -> `None` — Deactivate Visible Slot
  - `decrement_active_widget_index(allow_wrapping = True)` -> `None` — Decrement Active Widget Index
  - `get_active_widget()` -> `Widget` — Get Active Widget
  - `get_active_widget_index()` -> `int32` — Get Active Widget Index
  - `increment_active_widget_index(allow_wrapping = True)` -> `None` — Increment Active Widget Index
  - `is_currently_switching()` -> `bool` — Is Currently Switching
  - `set_active_widget(widget)` -> `None` — Set Active Widget
  - `set_active_widget_index(index)` -> `None` — Set Active Widget Index

### `unreal.CommonVisibilitySwitcherSlot`
Inherits: `OverlaySlot` | Header: `CommonVisibilitySwitcherSlot.h`

Common Visibility Switcher Slot

### `unreal.CommonVisualAttachment`
Inherits: `SizeBox` | Header: `CommonVisualAttachment.h`

Adds a widget as a zero-size attachment to another. Think icons to the left of labels, without changing the computed size of the label.

**Properties** (1):
  - `content_anchor`: `Vector2D` — [Read-Write] Content Anchor Point as a ratio of the content size. Use (1.0, 1.0) to anchor the conte...

### `unreal.CommonWidgetCarousel`
Inherits: `PanelWidget` | Header: `CommonWidgetCarousel.h`

A widget switcher is like a tab control, but without tabs. At most one widget is visible at time.

**Methods** (10):
  - `begin_auto_scrolling(scroll_interval = 10.000000)` -> `None` — Begin Auto Scrolling
  - `end_auto_scrolling()` -> `None` — End Auto Scrolling
  - `get_active_widget_index()` -> `int32` — Gets the slot index of the currently active widget
  - `get_move_speed()` -> `float` — Gets the Move Speed.
  - `get_widget_at_index(index)` -> `Widget` — Get a widget at the provided index
  - `next_page()` -> `None` — Next Page
  - `previous_page()` -> `None` — Previous Page
  - `set_active_widget(widget)` -> `None` — Activates the widget and makes it the active index.
  - `set_active_widget_index(index)` -> `None` — Activates the widget at the specified index.
  - `set_move_speed(move_speed)` -> `None` — Sets the Move Speed.

**Properties** (3):
  - `active_widget_index`: `int` [Read-Only] — [Read-Only] The slot index to display (int32)
  - `move_speed`: `float` — [Read-Write] How quickly the carousel transitions when changing active widget (float)
  - `on_current_page_index_changed`: `OnCurrentPageIndexChanged` — [Read-Write] (OnCurrentPageIndexChanged)

### `unreal.CommonWidgetCarouselNavBar`
Inherits: `Widget` | Header: `CommonWidgetCarouselNavBar.h`

A Navigation control for a Carousel

**Methods** (1):
  - `set_linked_carousel(common_carousel)` -> `None` — Establishes the Widget Carousel instance that this Nav Bar should interact with

**Properties** (2):
  - `button_padding`: `Margin` [Read-Only] — [Read-Only] (Margin)
  - `button_widget_type`: `Class` [Read-Only] — [Read-Only] (type(Class))

### `unreal.CommonWidgetGroupBase`
Inherits: `Object` | Header: `CommonWidgetGroupBase.h`

Base class for CommonUI widget groups, currently only used for button groups

**Methods** (4):
  - `add_widget(widget)` -> `None` — Add Widget
  - `add_widgets(widgets)` -> `None` — Add Widgets
  - `remove_all()` -> `None` — Remove All
  - `remove_widget(widget)` -> `None` — Remove Widget

### `unreal.LoadGuardSlot`
Inherits: `PanelSlot` | Header: `CommonLoadGuard.h`

Virtually identical to a UBorderSlot, but unfortunately that assumes (fairly) that its parent widget is a UBorder.

**Methods** (3):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

### `unreal.UCommonVisibilityWidgetBase`
Inherits: `CommonBorder` | Header: `CommonVisibilityWidgetBase.h`

A container that controls visibility based on Input type and Platform

### `unreal.CommonNumericType`
Inherits: `EnumBase` | Header: `CommonNumericTextBlock.h`

ECommon Numeric Type

**Properties** (4):
  - `DISTANCE`: `CommonNumericType = Ellipsis` — 3
  - `NUMBER`: `CommonNumericType = Ellipsis` — 0
  - `PERCENTAGE`: `CommonNumericType = Ellipsis` — 1
  - `SECONDS`: `CommonNumericType = Ellipsis` — 2

### `unreal.CommonSwitcherTransition`
Inherits: `EnumBase` | Header: `SCommonAnimatedSwitcher.h`

ECommon Switcher Transition

**Properties** (4):
  - `FADE_ONLY`: `CommonSwitcherTransition = Ellipsis` — Fade transition only with no movement 0
  - `HORIZONTAL`: `CommonSwitcherTransition = Ellipsis` — Increasing the active index goes right, decreasing goes left 1
  - `VERTICAL`: `CommonSwitcherTransition = Ellipsis` — Increasing the active index goes up, decreasing goes down 2
  - `ZOOM`: `CommonSwitcherTransition = Ellipsis` — Increasing the active index zooms in, decreasing zooms out 3

### `unreal.CommonSwitcherTransitionFallbackStrategy`
Inherits: `EnumBase` | Header: `SCommonAnimatedSwitcher.h`

Determines the switcherâs behavior if the target of a transition is removed before it becomes the active widget.

**Properties** (5):
  - `FIRST`: `CommonSwitcherTransitionFallbackStrategy = Ellipsis` — Fall back to the first item in the switcher 3
  - `LAST`: `CommonSwitcherTransitionFallbackStrategy = Ellipsis` — Fall back to the last item in the switcher 4
  - `NEXT`: `CommonSwitcherTransitionFallbackStrategy = Ellipsis` — Fall back to the nearest valid slot at a higher index than the original target, or the last slot if ...
  - `NONE`: `CommonSwitcherTransitionFallbackStrategy = Ellipsis` — Transition fallbacks are disabled and no special handling will occur if a transitioning widget is re...
  - `PREVIOUS`: `CommonSwitcherTransitionFallbackStrategy = Ellipsis` — Fall back to the nearest valid slot at a lower index than the original target, or the first slot if ...

### `unreal.InputActionState`
Inherits: `EnumBase` | Header: `CommonUITypes.h`

EInput Action State

**Properties** (4):
  - `DISABLED`: `InputActionState = Ellipsis` — Disabled, will call all the disabled callback if specified otherwise do nothing 1
  - `ENABLED`: `InputActionState = Ellipsis` — Enabled, will call all callbacks 0
  - `HIDDEN`: `InputActionState = Ellipsis` — Use this sparingly 2 The common input reflector will not visualize this but still calls all callback...
  - `HIDDEN_AND_DISABLED`: `InputActionState = Ellipsis` — Hidden and disabled behaves as if it were never added with no callbacks being called 3

### `unreal.RichTextInlineIconDisplayMode`
Inherits: `EnumBase` | Header: `CommonRichTextBlock.h`

Various ways that we display inline icon that have an icon-name association

**Properties** (3):
  - `ICON_AND_TEXT`: `RichTextInlineIconDisplayMode = Ellipsis` — Show both the icon and the text - use whenever there is space 2
  - `ICON_ONLY`: `RichTextInlineIconDisplayMode = Ellipsis` — Only show the icon - use when space is limited 0
  - `TEXT_ONLY`: `RichTextInlineIconDisplayMode = Ellipsis` — Only show the text - use seldom if ever 1

### `unreal.RotatorDirection`
Inherits: `EnumBase` | Header: `CommonRotator.h`

ERotator Direction

**Properties** (2):
  - `LEFT`: `RotatorDirection = Ellipsis` — 1
  - `RIGHT`: `RotatorDirection = Ellipsis` — 0

### `unreal.TransitionCurve`
Inherits: `EnumBase` | Header: `SCommonAnimatedSwitcher.h`

ETransition Curve

**Properties** (7):
  - `CUBIC_IN`: `TransitionCurve = Ellipsis` — Cubic ease in 4
  - `CUBIC_IN_OUT`: `TransitionCurve = Ellipsis` — Cubic ease in, cubic ease out 6
  - `CUBIC_OUT`: `TransitionCurve = Ellipsis` — Cubic ease out 5
  - `LINEAR`: `TransitionCurve = Ellipsis` — Linear interpolation, with no easing 0
  - `QUAD_IN`: `TransitionCurve = Ellipsis` — Quadratic ease in 1
  - `QUAD_IN_OUT`: `TransitionCurve = Ellipsis` — Quadratic ease in, quadratic ease out 3
  - `QUAD_OUT`: `TransitionCurve = Ellipsis` — Quadratic ease out 2

### `unreal.ActionBarUpdated`
Inherits: `MulticastDelegateBase` | Header: `CommonBoundActionBar.h`

Action Bar Updated Delegate Signature

### `unreal.CommonActionCommited`
Inherits: `DelegateBase` | Header: `CommonActionHandlerInterface.h`

Action committed delegate tells the handler that an action is ready to handle. Return value is used to determine if the action was handled or ignored.

### `unreal.CommonActionComplete`
Inherits: `MulticastDelegateBase` | Header: `CommonActionHandlerInterface.h`

Common Action Complete Delegate Signature

### `unreal.CommonActionCompleteSingle`
Inherits: `DelegateBase` | Header: `CommonActionHandlerInterface.h`

Action complete delegate will tell a listener if a held action completed. The single delegate will be used for binding with a listener that the multicast delegate calls.

### `unreal.CommonActionProgress`
Inherits: `MulticastDelegateBase` | Header: `CommonActionHandlerInterface.h`

Common Action Progress Delegate Signature

### `unreal.CommonActionProgressSingle`
Inherits: `DelegateBase` | Header: `CommonActionHandlerInterface.h`

Action progress delegate will tell a listener about the progress of an action being held. The single delegate will be used for binding with a listener that the multicast delegate calls.

### `unreal.CommonActionWidget_OnInputIconUpdated`
Inherits: `MulticastDelegateBase` | Header: `CommonActionWidget.h`

On Input Icon Updated Delegate Signature

### `unreal.CommonActionWidget_OnInputMethodChanged`
Inherits: `MulticastDelegateBase` | Header: `CommonActionWidget.h`

On Input Method Changed Delegate Signature

### `unreal.CommonButtonBaseClicked`
Inherits: `MulticastDelegateBase` | Header: `CommonButtonBase.h`

Common Button Base Clicked Delegate Signature

### `unreal.CommonCustomNavigation_OnCustomNavigationEvent`
Inherits: `DelegateBase` | Header: `CommonCustomNavigation.h`

On Custom Navigation Event Delegate Signature

### `unreal.CommonLoadGuard_OnAssetLoaded`
Inherits: `DelegateBase` | Header: `CommonLoadGuard.h`

On Asset Loaded Delegate Signature

### `unreal.CommonNumericTextBlock_OnInterpolationEnded`
Inherits: `MulticastDelegateBase` | Header: `CommonNumericTextBlock.h`

On Interpolation Ended Delegate Signature

### `unreal.CommonNumericTextBlock_OnInterpolationStarted`
Inherits: `MulticastDelegateBase` | Header: `CommonNumericTextBlock.h`

On Interpolation Started Delegate Signature

### `unreal.CommonNumericTextBlock_OnInterpolationUpdated`
Inherits: `MulticastDelegateBase` | Header: `CommonNumericTextBlock.h`

On Interpolation Updated Delegate Signature

### `unreal.CommonNumericTextBlock_OnOutro`
Inherits: `MulticastDelegateBase` | Header: `CommonNumericTextBlock.h`

On Outro Delegate Signature

### `unreal.CommonSelectedStateChangedBase`
Inherits: `MulticastDelegateBase` | Header: `CommonButtonBase.h`

Common Selected State Changed Base Delegate Signature

### `unreal.CommonTabListWidgetBase_OnTabButtonCreation`
Inherits: `MulticastDelegateBase` | Header: `CommonTabListWidgetBase.h`

Delegate broadcast when a new tab is created. Allows hook ups after creation.

### `unreal.CommonTabListWidgetBase_OnTabButtonRemoval`
Inherits: `MulticastDelegateBase` | Header: `CommonTabListWidgetBase.h`

Delegate broadcast when a tab is being removed. Allows clean ups after destruction.

### `unreal.CommonTabListWidgetBase_OnTabListRebuilt`
Inherits: `MulticastDelegateBase` | Header: `CommonTabListWidgetBase.h`

Delegate broadcast when the tab list has been rebuilt (after a new tab has been inserted rather than added to the end).

### `unreal.CommonTabListWidgetBase_OnTabSelected`
Inherits: `MulticastDelegateBase` | Header: `CommonTabListWidgetBase.h`

Delegate broadcast when a new tab is selected.

### `unreal.HardwareVisibilityTagsChangedDynamicEvent`
Inherits: `MulticastDelegateBase` | Header: `CommonUIVisibilitySubsystem.h`

Hardware Visibility Tags Changed Dynamic Event Delegate Signature

### `unreal.OnActiveIndexChangedDelegate`
Inherits: `MulticastDelegateBase` | Header: `CommonAnimatedSwitcher.h`

On Active Index Changed Delegate Delegate Signature

### `unreal.OnCurrentPageIndexChanged`
Inherits: `MulticastDelegateBase` | Header: `CommonWidgetCarousel.h`

On Current Page Index Changed Delegate Signature

### `unreal.OnItemClicked`
Inherits: `DelegateBase` | Header: `CommonUITypes.h`

On Item Clicked Delegate Signature

### `unreal.OnItemSelected`
Inherits: `DelegateBase` | Header: `CommonUITypes.h`

On Item Selected Delegate Signature

### `unreal.OnLoadGuardStateChangedDynamic`
Inherits: `MulticastDelegateBase` | Header: `CommonLoadGuard.h`

On Load Guard State Changed Dynamic Delegate Signature

### `unreal.OnRotated`
Inherits: `MulticastDelegateBase` | Header: `CommonRotator.h`

On Rotated Delegate Signature

### `unreal.OnRotatedWithDirection`
Inherits: `MulticastDelegateBase` | Header: `CommonRotator.h`

On Rotated with Direction Delegate Signature

### `unreal.OnSelectionCleared`
Inherits: `MulticastDelegateBase` | Header: `CommonButtonGroupBase.h`

On Selection Cleared Delegate Signature

### `unreal.OnWidgetActivationChanged`
Inherits: `MulticastDelegateBase` | Header: `CommonActivatableWidget.h`

On Widget Activation Changed Delegate Signature

### `unreal.SimpleButtonBaseGroupDelegate`
Inherits: `MulticastDelegateBase` | Header: `CommonButtonGroupBase.h`

Simple Button Base Group Delegate Delegate Signature
