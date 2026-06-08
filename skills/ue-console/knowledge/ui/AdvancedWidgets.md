# UE Python API — AdvancedWidgets Module

**2 types** from the `AdvancedWidgets` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ColorGradingSpinBoxStyle`, `RadialSlider`

---

## Classes

### `unreal.ColorGradingSpinBoxStyle`
Inherits: `SlateWidgetStyle` | Header: `ColorGradingSpinBoxStyle.h`

Represents the appearance of a color grading spin box

**Properties** (5):
  - `active_border_brush`: `SlateBrush` — [Read-Write] Brush used to draw the border of the spinbox when itâs in active use by the user (Sla...
  - `border_brush`: `SlateBrush` — [Read-Write] Brush used to draw the border of the spinbox (SlateBrush)
  - `hovered_border_brush`: `SlateBrush` — [Read-Write] Brush used to draw the border of the spinbox when itâs hovered over (SlateBrush)
  - `selector_brush`: `SlateBrush` — [Read-Write] Brush used to draw the selector indicating the current value (SlateBrush)
  - `selector_width`: `float` — [Read-Write] Width of the selector (float)

### `unreal.RadialSlider`
Inherits: `Widget` | Header: `RadialSlider.h`

A simple widget that shows a sliding bar with a handle that allows you to control the value between 0..1.

**Methods** (20):
  - `get_custom_default_value()` -> `float` — Gets the current custom default value of the slider.
  - `get_normalized_slider_handle_position()` -> `float` — Get the current raw slider alpha from 0 to 1
  - `get_value()` -> `float` — Gets the current value of the slider.
  - `set_angular_offset(value)` -> `None` — Sets the Angular Offset for the slider.
  - `set_center_background_color(value)` -> `None` — Sets the color of the slider bar
  - `set_custom_default_value(value)` -> `None` — Sets the current custom default value of the slider.
  - `set_hand_start_end_ratio(value)` -> `None` — Sets the start and end of the hand as a ratio to the slider radius (so 0.0 to 1.0 is from the slider center to the handl...
  - `set_locked(value)` -> `None` — Sets the handle to be interactive or fixed
  - `set_show_slider_hand(show_slider_hand)` -> `None` — Whether to show the slider hand.
  - `set_show_slider_handle(show_slider_handle)` -> `None` — Whether to show the slider handle (thumb).
  - `set_slider_bar_color(value)` -> `None` — Sets the color of the slider bar
  - `set_slider_handle_color(value)` -> `None` — Sets the color of the handle bar
  - `set_slider_handle_end_angle(value)` -> `None` — Sets the maximum angle of the slider.
  - `set_slider_handle_start_angle(value)` -> `None` — Sets the minimum angle of the slider.
  - `set_slider_progress_color(value)` -> `None` — Sets the progress color of the slider bar
  - `set_slider_range(slider_range)` -> `None` — Sets the curve for the slider range
  - `set_step_size(value)` -> `None` — Sets the amount to adjust the value by, when using a controller or keyboard
  - `set_use_vertical_drag(use_vertical_drag)` -> `None` — Set whether the value is changed when dragging vertically as opposed to along the radial curve.
  - `set_value(value)` -> `None` — Sets the current value of the slider.
  - `set_value_tags(value_tags)` -> `None` — Adds value tags to the slider.

**Properties** (25):
  - `angular_offset`: `float` [Read-Only] — [Read-Only] Rotates radial slider by arbitrary offset to support full gamut of configurations. (floa...
  - `center_background_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the center background in. (LinearColor)
  - `hand_start_end_ratio`: `Vector2D` [Read-Only] — [Read-Only] Start and end of the hand as a ratio to the slider radius (so 0.0 to 1.0 is from the sli...
  - `is_focusable`: `bool` [Read-Only] — [Read-Only] Should the slider be focusable? (bool)
  - `locked`: `bool` [Read-Only] — [Read-Only] Whether the handle is interactive or fixed. (bool)
  - `mouse_uses_step`: `bool` [Read-Only] — [Read-Only] Sets new value if mouse position is greater/less than half the step size. (bool)
  - `on_controller_capture_begin`: `OnControllerCaptureBeginEvent` — [Read-Write] Invoked when the controller capture begins. (OnControllerCaptureBeginEvent)
  - `on_controller_capture_end`: `OnControllerCaptureEndEvent` — [Read-Write] Invoked when the controller capture ends. (OnControllerCaptureEndEvent)
  - `on_mouse_capture_begin`: `OnMouseCaptureBeginEvent` — [Read-Write] Invoked when the mouse is pressed and a capture begins. (OnMouseCaptureBeginEvent)
  - `on_mouse_capture_end`: `OnMouseCaptureEndEvent` — [Read-Write] Invoked when the mouse is released and a capture ends. (OnMouseCaptureEndEvent)
  - `on_value_changed`: `OnFloatValueChangedEvent` — [Read-Write] Called when the value is changed by slider or typing. (OnFloatValueChangedEvent)
  - `requires_controller_lock`: `bool` [Read-Only] — [Read-Only] Sets whether we have to lock input to change the slider value. (bool)
  - `show_slider_hand`: `bool` — [Read-Write] Whether to show the slider hand. (bool)
  - `show_slider_handle`: `bool` — [Read-Write] Whether to show the slider handle (thumb). (bool)
  - `slider_bar_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the slider bar in. (LinearColor)
  - `slider_handle_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the slider handle in. (LinearColor)
  - `slider_handle_end_angle`: `float` [Read-Only] — [Read-Only] The angle at which the Slider Handle will end. (float)
  - `slider_handle_start_angle`: `float` [Read-Only] — [Read-Only] The angle at which the Slider Handle will start. (float)
  - `slider_progress_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the completed progress of the slider bar in. (LinearColor)
  - `slider_range`: `RuntimeFloatCurve` [Read-Only] — [Read-Only] A curve that defines how the slider should be sampled. Default is linear. (RuntimeFloatC...
  - `step_size`: `float` [Read-Only] — [Read-Only] The amount to adjust the value by, when using a controller or keyboard (float)
  - `use_vertical_drag`: `bool` — [Read-Write] Whether the value is changed when dragging vertically as opposed to along the radial cu...
  - `value`: `float` — [Read-Write] The slider value to display. (float)
  - `value_tags`: `None` [Read-Only] — [Read-Only] Adds text tags to the radial slider at the valueâs position. (Array[float])
  - `widget_style`: `SliderStyle` — [Read-Write] The progress bar style (SliderStyle)
