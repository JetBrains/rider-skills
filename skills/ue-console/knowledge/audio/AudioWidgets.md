# UE Python API — AudioWidgets Module

**60 types** from the `AudioWidgets` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AudioMaterialButtonStyle`, `AudioMaterialEnvelopeSettings`, `AudioMaterialEnvelopeStyle`, `AudioMaterialKnobStyle`, `AudioMaterialMeterStyle`, `AudioMaterialSliderStyle`, `AudioMaterialWidgetStyle`, `AudioMeterDefaultColorStyle`, `AudioMeterStyle`, `AudioOscilloscopePanelStyle`, `AudioRadialSliderStyle`, `AudioSliderStyle`, `AudioSpectrumPlotStyle`, `AudioTextBoxStyle`, `AudioVectorscopePanelStyle`, `FixedSampleSequenceRulerStyle`, `MeterChannelInfo`, `PlayheadOverlayStyle`, `SampledSequenceValueGridOverlayStyle`, `SampledSequenceVectorViewerStyle`, ... (60 total)

---

## Classes

### `unreal.AudioMaterialButtonStyle`
Inherits: `AudioMaterialWidgetStyle` | Header: `AudioMaterialSlateTypes.h`

Represents the appearance of an Audio Material Button

**Properties** (7):
  - `button_accent_color`: `LinearColor` — [Read-Write] The buttonâs Accent color value. (LinearColor)
  - `button_main_color`: `LinearColor` — [Read-Write] The buttonâs Main color value. (LinearColor)
  - `button_main_color_tint_1`: `LinearColor` — [Read-Write] The button colorâs Tint value covering one half of the gradient. (LinearColor)
  - `button_main_color_tint_2`: `LinearColor` — [Read-Write] The button colorâs Tint value covering the other half of the gradient. (LinearColor)
  - `button_pressed_outline_color`: `LinearColor` — [Read-Write] The buttonâs Outline color value when Pressed. (LinearColor)
  - `button_shadow_color`: `LinearColor` — [Read-Write] The buttonâs Shadow color value. (LinearColor)
  - `button_unpressed_outline_color`: `LinearColor` — [Read-Write] The buttonâs Outline color value when Unpressed. (LinearColor)

### `unreal.AudioMaterialEnvelopeSettings`
Inherits: `StructBase` | Header: `AudioMaterialEnvelopeSettings.h`

Audio Material Envelope Settings

**Properties** (8):
  - `attack_curve`: `float` — [Read-Write] Curve of the envelopes attack stage.
Attack is the time taken for the rise of the level...
  - `attack_time`: `float` — [Read-Write] Time the Value reaches the Attack stage.
Attack is the time taken for the rise of the l...
  - `attack_value`: `float` — [Read-Write] Value of the envelopes attack stage.
Attack is the time taken for the rise of the level...
  - `decay_curve`: `float` — [Read-Write] Curve of the envelopes Decay stage.
Decay is the time taken for the level to reduce fro...
  - `decay_time`: `float` — [Read-Write] Time that takes to reach the level of the Sustain stage.
Decay is the time taken for th...
  - `release_curve`: `float` — [Read-Write] Curve of the envelopes Release stage.
Release is the time taken for the level to decay ...
  - `release_time`: `float` — [Read-Write] Time that takes to reach zero level
Release is the time taken for the level to decay fr...
  - `sustain_value`: `float` — [Read-Write] Value of the envelopes Sustain stage.
Sustain is the level maintained until release sta...

### `unreal.AudioMaterialEnvelopeStyle`
Inherits: `AudioMaterialWidgetStyle` | Header: `AudioMaterialSlateTypes.h`

Represents the appearance of an Audio Material Envelope

**Properties** (3):
  - `background_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `curve_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `outline_color`: `LinearColor` — [Read-Write] (LinearColor)

### `unreal.AudioMaterialKnobStyle`
Inherits: `AudioMaterialWidgetStyle` | Header: `AudioMaterialSlateTypes.h`

Represents the appearance of an Audio Material Knob

**Properties** (13):
  - `knob_accent_color`: `LinearColor` — [Read-Write] The knobâs Accent color value. (LinearColor)
  - `knob_bar_color`: `LinearColor` — [Read-Write] The knob Barâs Color value. (LinearColor)
  - `knob_bar_fill_max_color`: `LinearColor` — [Read-Write] The knob Barâs Fill color value representing the Ending section of the fill. (LinearC...
  - `knob_bar_fill_mid_color`: `LinearColor` — [Read-Write] The knob Barâs Fill color value representing the Middle section of the fill. (LinearC...
  - `knob_bar_fill_min_color`: `LinearColor` — [Read-Write] The knob Barâs Fill color value representing the Starting section of the fill. (Linea...
  - `knob_bar_fill_tint_color`: `LinearColor` — [Read-Write] The knob Bar Fill colorâs Tint value. (LinearColor)
  - `knob_bar_shadow_color`: `LinearColor` — [Read-Write] The knob Barâs Shadow color value. (LinearColor)
  - `knob_edge_fill_color`: `LinearColor` — [Read-Write] The knobâs Edge Fill color value. (LinearColor)
  - `knob_indicator_dot_color`: `LinearColor` — [Read-Write] The knobâs Indicator Dot color value. (LinearColor)
  - `knob_main_color`: `LinearColor` — [Read-Write] The knobâs Main color value. (LinearColor)
  - `knob_shadow_color`: `LinearColor` — [Read-Write] The knobâs Shadow color value. (LinearColor)
  - `knob_smooth_bevel_color`: `LinearColor` — [Read-Write] The knobâs Smooth Bevel color value. (LinearColor)
  - `text_box_style`: `AudioTextBoxStyle` — [Read-Write] The style to use for the audio text box widget. (AudioTextBoxStyle)

### `unreal.AudioMaterialMeterStyle`
Inherits: `AudioMaterialWidgetStyle` | Header: `AudioMaterialSlateTypes.h`

Represents the appearance of an Audio Material Meter

**Properties** (13):
  - `decibels_per_hash`: `int` — [Read-Write] How wide to draw the decibel scale, if itâs enabled (int32)
  - `font`: `SlateFontInfo` — [Read-Write] Font family and size to be used when displaying the meter scale. (SlateFontInfo)
  - `meter_fill_background_color`: `LinearColor` — [Read-Write] The meterâs Background Fill color value. (LinearColor)
  - `meter_fill_max_color`: `LinearColor` — [Read-Write] The meterâs Fill color value representing the Ending section of the fill. (LinearColo...
  - `meter_fill_mid_color`: `LinearColor` — [Read-Write] The meterâs Fill color value representing the Middle section of the fill. (LinearColo...
  - `meter_fill_min_color`: `LinearColor` — [Read-Write] The meterâs Fill color value representing the Starting section of the fill. (LinearCo...
  - `meter_padding`: `Vector2D` — [Read-Write] How much padding to add around the meter (Vector2D)
  - `scale_hash_height`: `float` — [Read-Write] The height of each hash mark (float)
  - `scale_hash_offset`: `float` — [Read-Write] Offset for the hashes (float)
  - `scale_hash_width`: `float` — [Read-Write] The width of each hash mark (float)
  - `scale_side`: `bool` — [Read-Write] Which side to show the scale. If vertical, true means left side, false means right side...
  - `show_scale`: `bool` — [Read-Write] Whether or not to show the decibel scale alongside the meter (bool)
  - `value_range_db`: `Vector2D` — [Read-Write] The minimum and maximum value to display in dB (values are clamped in this range) (Vect...

### `unreal.AudioMaterialSliderStyle`
Inherits: `AudioMaterialWidgetStyle` | Header: `AudioMaterialSlateTypes.h`

Represents the appearance of an Audio Material Slider

**Properties** (6):
  - `slider_background_accent_color`: `LinearColor` — [Read-Write] The slider Barâs Background Accent color value. Can be thought as the sliderâs Inne...
  - `slider_background_color`: `LinearColor` — [Read-Write] The slider Barâs Background color value. (LinearColor)
  - `slider_handle_main_color`: `LinearColor` — [Read-Write] The slider Handleâs Main color value. (LinearColor)
  - `slider_handle_outline_color`: `LinearColor` — [Read-Write] The slider Handleâs Outline color value. (LinearColor)
  - `slider_value_main_color`: `LinearColor` — [Read-Write] The sliderâs Color value representing the sliderâs Output Value amount. (LinearColo...
  - `text_box_style`: `AudioTextBoxStyle` — [Read-Write] The style to use for the audio text box widget. (AudioTextBoxStyle)

### `unreal.AudioMaterialWidgetStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioMaterialSlateTypes.h`

Base for the appearance of an Audio Material Slates

**Properties** (2):
  - `desired_size`: `Vector2f` — [Read-Write] Desired Draw size of the rendered material (Vector2f)
  - `material`: `MaterialInterface` — [Read-Write] Material used to render the Slate (MaterialInterface)

### `unreal.AudioMeterDefaultColorStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioMeter.h`

Audio Meter Default Color Style

**Properties** (6):
  - `meter_background_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `meter_clipping_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `meter_peak_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `meter_scale_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `meter_scale_label_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `meter_value_color`: `LinearColor` — [Read-Write] (LinearColor)

### `unreal.AudioMeterStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioMeterStyle.h`

Represents the appearance of an SAudioMeter

**Properties** (17):
  - `background_image`: `SlateBrush` — [Read-Write] Image to use to represent the background. (SlateBrush)
  - `decibels_per_hash`: `int` — [Read-Write] How wide to draw the decibel scale, if itâs enabled (int32)
  - `font`: `SlateFontInfo` — [Read-Write] Font family and size to be used when displaying the meter scale. (SlateFontInfo)
  - `meter_background_image`: `SlateBrush` — [Read-Write] Image to use to represent the meter background. (SlateBrush)
  - `meter_padding`: `Vector2D` — [Read-Write] How much padding to add around the meter (Vector2D)
  - `meter_peak_image`: `SlateBrush` — [Read-Write] Image to use to represent the meter peak. (SlateBrush)
  - `meter_size`: `Vector2D` — [Read-Write] How thick to draw the meter (Vector2D)
  - `meter_value_background_image`: `SlateBrush` — [Read-Write] Image to use to draw behind the meter value. (SlateBrush)
  - `meter_value_image`: `SlateBrush` — [Read-Write] Image to use to represent the meter value. (SlateBrush)
  - `meter_value_padding`: `float` — [Read-Write] How much padding to add around the meter value (float)
  - `peak_value_width`: `float` — [Read-Write] How wide to draw the peak value indicator (float)
  - `scale_hash_height`: `float` — [Read-Write] The height of each hash mark (float)
  - `scale_hash_offset`: `float` — [Read-Write] Offset for the hashes (float)
  - `scale_hash_width`: `float` — [Read-Write] The width of each hash mark (float)
  - `scale_side`: `bool` — [Read-Write] Which side to show the scale. If vertical, true means left side, false means right side...
  - `show_scale`: `bool` — [Read-Write] Whether or not to show the decibel scale alongside the meter (bool)
  - `value_range_db`: `Vector2D` — [Read-Write] The minimum and maximum value to display in dB (values are clamped in this range) (Vect...

### `unreal.AudioOscilloscopePanelStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioOscilloscopePanelStyle.h`

Represents the appearance of an SAudioOscilloscopePanelWidget

**Properties** (4):
  - `time_ruler_style`: `FixedSampleSequenceRulerStyle` — [Read-Write] The time rule style. (FixedSampleSequenceRulerStyle)
  - `trigger_threshold_line_style`: `TriggerThresholdLineStyle` — [Read-Write] The triggerthreshold line style. (TriggerThresholdLineStyle)
  - `value_grid_style`: `SampledSequenceValueGridOverlayStyle` — [Read-Write] The value grid style. (SampledSequenceValueGridOverlayStyle)
  - `wave_viewer_style`: `SampledSequenceViewerStyle` — [Read-Write] The waveform view style. (SampledSequenceViewerStyle)

### `unreal.AudioRadialSliderStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioWidgetsSlateTypes.h`

Represents the appearance of an Audio Radial Slider

**Properties** (6):
  - `center_background_color`: `SlateColor` — [Read-Write] Color used to draw the slider center background (SlateColor)
  - `default_slider_radius`: `float` — [Read-Write] Default size of the slider itself (not including label) (float)
  - `label_padding`: `float` — [Read-Write] Size of the padding between the label and the slider (float)
  - `slider_bar_color`: `SlateColor` — [Read-Write] Color used to draw the unprogressed slider bar (SlateColor)
  - `slider_progress_color`: `SlateColor` — [Read-Write] Color used to draw the progress bar (SlateColor)
  - `text_box_style`: `AudioTextBoxStyle` — [Read-Write] The style to use for the audio text box widget. (AudioTextBoxStyle)

### `unreal.AudioSliderStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioWidgetsSlateTypes.h`

Represents the appearance of an Audio Slider

**Properties** (9):
  - `label_padding`: `float` — [Read-Write] Size of the padding between the label and the slider (float)
  - `slider_background_color`: `SlateColor` — [Read-Write] Color used to draw the slider background (SlateColor)
  - `slider_background_size`: `Vector2D` — [Read-Write] Size of the slider background (slider default is vertical) (Vector2D)
  - `slider_bar_color`: `SlateColor` — [Read-Write] Color used to draw the slider bar (SlateColor)
  - `slider_style`: `SliderStyle` — [Read-Write] The style to use for the underlying SSlider. (SliderStyle)
  - `slider_thumb_color`: `SlateColor` — [Read-Write] Color used to draw the slider thumb (handle) (SlateColor)
  - `text_box_style`: `AudioTextBoxStyle` — [Read-Write] The style to use for the audio text box widget. (AudioTextBoxStyle)
  - `widget_background_color`: `SlateColor` — [Read-Write] Color used to draw the widget background (SlateColor)
  - `widget_background_image`: `SlateBrush` — [Read-Write] Image for the widget background (SlateBrush)

### `unreal.AudioSpectrumPlotStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioSpectrumPlotStyle.h`

Represents the appearance of an SAudioSpectrumPlot

**Properties** (7):
  - `axis_label_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `axis_label_font`: `SlateFontInfo` — [Read-Write] (SlateFontInfo)
  - `background_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `crosshair_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `crosshair_label_font`: `SlateFontInfo` — [Read-Write] (SlateFontInfo)
  - `grid_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `spectrum_color`: `SlateColor` — [Read-Write] (SlateColor)

### `unreal.AudioTextBoxStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioWidgetsSlateTypes.h`

Represents the appearance of an Audio Text Box

**Properties** (2):
  - `background_color`: `SlateColor` — [Read-Write] Color used to draw the label background (SlateColor)
  - `background_image`: `SlateBrush` — [Read-Write] Image for the label border (SlateBrush)

### `unreal.AudioVectorscopePanelStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioVectorscopePanelStyle.h`

Represents the appearance of an SAudioVectorscopePanelWidget

**Properties** (2):
  - `value_grid_style`: `SampledSequenceValueGridOverlayStyle` — [Read-Write] The value grid style. (SampledSequenceValueGridOverlayStyle)
  - `vector_viewer_style`: `SampledSequenceVectorViewerStyle` — [Read-Write] The vector view style. (SampledSequenceVectorViewerStyle)

### `unreal.FixedSampleSequenceRulerStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioWidgetsSlateTypes.h`

Represents the appearance of a Sampled Sequence Time Ruler

**Properties** (11):
  - `background_brush`: `SlateBrush` — [Read-Write] (SlateBrush)
  - `background_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `desired_height`: `float` — [Read-Write] (float)
  - `desired_width`: `float` — [Read-Write] (float)
  - `handle_brush`: `SlateBrush` — [Read-Write] (SlateBrush)
  - `handle_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `handle_width`: `float` — [Read-Write] (float)
  - `ticks_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `ticks_text_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `ticks_text_font`: `SlateFontInfo` — [Read-Write] (SlateFontInfo)
  - `ticks_text_offset`: `float` — [Read-Write] (float)

### `unreal.MeterChannelInfo`
Inherits: `StructBase` | Header: `AudioMeterTypes.h`

Meter Channel Info

**Properties** (3):
  - `clipping_value`: `float` — [Read-Write] (float)
  - `meter_value`: `float` — [Read-Write] (float)
  - `peak_value`: `float` — [Read-Write] (float)

### `unreal.PlayheadOverlayStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioWidgetsSlateTypes.h`

Represents the appearance of a Waveform Viewer Overlay style

**Properties** (4):
  - `desired_height`: `float` — [Read-Write] (float)
  - `desired_width`: `float` — [Read-Write] (float)
  - `playhead_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `playhead_width`: `float` — [Read-Write] (float)

### `unreal.SampledSequenceValueGridOverlayStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioWidgetsSlateTypes.h`

Represents the appearance of a Sampled Sequence Value Grid Overlay

**Properties** (6):
  - `desired_height`: `float` — [Read-Write] (float)
  - `desired_width`: `float` — [Read-Write] (float)
  - `grid_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `grid_thickness`: `float` — [Read-Write] (float)
  - `label_text_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `label_text_font`: `SlateFontInfo` — [Read-Write] (SlateFontInfo)

### `unreal.SampledSequenceVectorViewerStyle`
Inherits: `SlateWidgetStyle` | Header: `SampledSequenceVectorViewerStyle.h`

Represents the appearance of a trigger threshold line

**Properties** (4):
  - `background_brush`: `SlateBrush` — [Read-Write] (SlateBrush)
  - `background_color`: `SlateColor` — [Read-Write] The background color. (SlateColor)
  - `line_color`: `LinearColor` — [Read-Write] The vector view line color. (LinearColor)
  - `line_thickness`: `float` — [Read-Write] The vector view line thickness. (float)

### `unreal.SampledSequenceViewerStyle`
Inherits: `SlateWidgetStyle` | Header: `AudioWidgetsSlateTypes.h`

Represents the appearance of a Sampled Sequence Viewer

**Properties** (11):
  - `background_brush`: `SlateBrush` — [Read-Write] (SlateBrush)
  - `desired_height`: `float` — [Read-Write] (float)
  - `desired_width`: `float` — [Read-Write] (float)
  - `major_grid_line_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `minor_grid_line_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `sample_markers_size`: `float` — [Read-Write] (float)
  - `sequence_background_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `sequence_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `sequence_line_thickness`: `float` — [Read-Write] (float)
  - `zero_crossing_line_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `zero_crossing_line_thickness`: `float` — [Read-Write] (float)

### `unreal.TriggerThresholdLineStyle`
Inherits: `SlateWidgetStyle` | Header: `TriggerThresholdLineStyle.h`

Represents the appearance of a trigger threshold line

**Properties** (1):
  - `line_color`: `LinearColor` — [Read-Write] The trigger threshold line color. (LinearColor)

### `unreal.AudioFrequencyRadialSlider`
Inherits: `AudioRadialSlider` | Header: `AudioRadialSlider.h`

An audio slider widget, for use with frequency.

### `unreal.AudioFrequencySlider`
Inherits: `AudioSliderBase` | Header: `AudioSlider.h`

An audio slider widget, for use with frequency.

### `unreal.AudioMaterialButton`
Inherits: `Widget` | Header: `AudioMaterialButton.h`

A simple widget that shows a button Button is rendered by using material instead of texture.

**Methods** (2):
  - `get_is_pressed()` -> `bool` — Gets the current value of the slider.
  - `set_is_pressed(pressed)` -> `None` — Sets the current value of the slider. InValue is Clamped between 0.f - 1.f

**Properties** (3):
  - `is_pressed`: `bool` — [Read-Write] Default Value of the button (bool)
  - `on_button_pressed_changed_event`: `OnButtonPressedChangedEvent` — [Read-Write] Called when the value is changed by button. (OnButtonPressedChangedEvent)
  - `widget_style`: `AudioMaterialButtonStyle` — [Read-Write] The buttonâs style (AudioMaterialButtonStyle)

### `unreal.AudioMaterialEnvelope`
Inherits: `Widget` | Header: `AudioMaterialEnvelope.h`

A simple widget that shows a envelope curve Depending on given AudioMaterialEnvelopeSetings Rendered by using material instead of texture.

**Properties** (2):
  - `envelope_settings`: `AudioMaterialEnvelopeSettings` — [Read-Write] Envelope settings (AudioMaterialEnvelopeSettings)
  - `widget_style`: `AudioMaterialEnvelopeStyle` — [Read-Write] The Envelopeâs style (AudioMaterialEnvelopeStyle)

### `unreal.AudioMaterialKnob`
Inherits: `Widget` | Header: `AudioMaterialKnob.h`

A simple widget that shows a turning Knob that allows you to control the value between 0..1. Knob is rendered by using material instead of texture.

**Methods** (12):
  - `get_fine_tune_speed()` -> `float` — Get the Knobs fine-tune speed
  - `get_is_locked()` -> `bool` — Get whether the knob is interactive or fixed.
  - `get_mouse_uses_step()` -> `bool` — Get whether the knob uses steps when tuning On Mouse move
  - `get_step_size()` -> `float` — Get Step Size
  - `get_tune_speed()` -> `float` — Get the Knobs tune speed
  - `get_value()` -> `float` — Get the current value of the knob.
  - `set_fine_tune_speed(value)` -> `None` — Set the knobs fine-tune speed. InValue is Clamped between 0.f - 1.f
  - `set_locked(locked)` -> `None` — Set the knob to be interactive or fixed
  - `set_mouse_uses_step(uses_step)` -> `None` — Set the knob to use steps when turning On Mouse move
  - `set_step_size(value)` -> `None` — Set the amount to adjust the value when using steps
  - `set_tune_speed(value)` -> `None` — Set the knobs tune speed. InValue is Clamped between 0.f - 1.f
  - `set_value(value)` -> `None` — Set the current value of the knob. InValue is Clamped between 0.f - 1.f

**Properties** (8):
  - `fine_tune_speed`: `float` — [Read-Write] The tune speed when fine-tuning the knob (float)
  - `locked`: `bool` — [Read-Write] Whether the knob is interactive or fixed. (bool)
  - `mouse_uses_step`: `bool` — [Read-Write] Sets new value if mouse position is greater/less than half the step size. (bool)
  - `on_knob_value_changed`: `OnKnobValueChangedEvent` — [Read-Write] Called when the value is changed by knob. (OnKnobValueChangedEvent)
  - `step_size`: `float` — [Read-Write] The amount to adjust the value by, when using steps (float)
  - `tune_speed`: `float` — [Read-Write] The tune speed of the knob (float)
  - `value`: `float` — [Read-Write] Default Value of the Knob (float)
  - `widget_style`: `AudioMaterialKnobStyle` — [Read-Write] The buttonâs style (AudioMaterialKnobStyle)

### `unreal.AudioMaterialMeter`
Inherits: `Widget` | Header: `AudioMaterialMeter.h`

Meter is rendered by using material instead of texture.

**Methods** (2):
  - `get_meter_channel_info()` -> `Array [ MeterChannelInfo ]` — Gets the current linear values of the meter.
  - `set_meter_channel_info(meter_channel_info)` -> `None` — Sets the current meter values.

**Properties** (3):
  - `meter_channel_info`: `None` — [Read-Write] The current meter value to display. (Array[MeterChannelInfo])
  - `orientation`: `Orientation` [Read-Only] — [Read-Only] The Meterâs orientation. (Orientation)
  - `widget_style`: `AudioMaterialMeterStyle` — [Read-Write] The meterâs style (AudioMaterialMeterStyle)

### `unreal.AudioMaterialSlider`
Inherits: `Widget` | Header: `AudioMaterialSlider.h`

A simple widget that shows a sliding bar with a handle that allows you to control the value between 0..1. Slider is rendered by using material instead of texture.

**Methods** (12):
  - `get_fine_tune_speed()` -> `float` — Get slider fine-tune speed
  - `get_is_locked()` -> `bool` — Get whether the slider is interactive or fixed.
  - `get_mouse_uses_step()` -> `bool` — Get whether the slider uses steps when turning On Mouse move
  - `get_step_size()` -> `float` — Get Step Size
  - `get_tune_speed()` -> `float` — Get slider tune speed
  - `get_value()` -> `float` — Gets the current value of the slider.
  - `set_fine_tune_speed(value)` -> `None` — Set the fine-tune speed of the slider. InValue is Clamped between 0.f - 1.f
  - `set_locked(locked)` -> `None` — Set the slider to be interactive or fixed
  - `set_mouse_uses_step(uses_step)` -> `None` — Sets the slider to use steps when turning On Mouse move
  - `set_step_size(value)` -> `None` — Sets the amount to adjust the value when using steps
  - `set_tune_speed(value)` -> `None` — Set the tune speed of the slider. InValue is Clamped between 0.f - 1.f
  - `set_value(value)` -> `None` — Sets the current value of the slider. InValue is Clamped between 0.f - 1.f

**Properties** (8):
  - `fine_tune_speed`: `float` — [Read-Write] The tune speed of the slider when fine-tuning the slider On Mouse move && Left-Shift pr...
  - `locked`: `bool` — [Read-Write] Whether the slider is interactive or fixed. (bool)
  - `mouse_uses_step`: `bool` — [Read-Write] Sets new value if mouse position is greater/less than half the step size. (bool)
  - `on_value_changed`: `OnSliderFloatValueChangedEvent` — [Read-Write] Called when the value is changed by slider. (OnSliderFloatValueChangedEvent)
  - `step_size`: `float` — [Read-Write] The amount to adjust the value by, when using steps (float)
  - `tune_speed`: `float` — [Read-Write] The tune speed of the slider On Mouse move (float)
  - `value`: `float` — [Read-Write] Default Value of the slider (float)
  - `widget_style`: `AudioMaterialSliderStyle` — [Read-Write] The sliderâs style (AudioMaterialSliderStyle)

### `unreal.AudioMeter`
Inherits: `Widget` | Header: `AudioMeter.h`

An audio meter widget.

**Methods** (9):
  - `get_meter_channel_info()` -> `Array [ MeterChannelInfo ]` — Gets the current linear value of the meter.
  - `set_background_color(value)` -> `None` — Sets the background color
  - `set_meter_background_color(value)` -> `None` — Sets the meter background color
  - `set_meter_channel_info(meter_channel_info)` -> `None` — Sets the current meter values.
  - `set_meter_clipping_color(value)` -> `None` — Sets the meter clipping color
  - `set_meter_peak_color(value)` -> `None` — Sets the meter peak color
  - `set_meter_scale_color(value)` -> `None` — Sets the meter scale color
  - `set_meter_scale_label_color(value)` -> `None` — Sets the meter scale color
  - `set_meter_value_color(value)` -> `None` — Sets the meter value color

**Properties** (9):
  - `background_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the background. (LinearColor)
  - `meter_background_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the meter background. (LinearColor)
  - `meter_clipping_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the meter clipping value. (LinearColor)
  - `meter_peak_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the meter peak value. (LinearColor)
  - `meter_scale_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the meter scale hashes. (LinearColor)
  - `meter_scale_label_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the meter scale label. (LinearColor)
  - `meter_value_color`: `LinearColor` [Read-Only] — [Read-Only] The color to draw the meter value. (LinearColor)
  - `orientation`: `Orientation` [Read-Only] — [Read-Only] The sliderâs orientation. (Orientation)
  - `widget_style`: `AudioMeterStyle` — [Read-Write] The audio meter style (AudioMeterStyle)

### `unreal.AudioOscilloscope`
Inherits: `Widget` | Header: `AudioOscilloscopeUMG.h`

An oscilloscope UMG widget.

**Methods** (2):
  - `start_processing()` -> `None` — Starts the oscilloscope processing.
  - `stop_processing()` -> `None` — Stops the oscilloscope processing.

**Properties** (14):
  - `amplitude_grid_labels_unit`: `YAxisLabelsUnit` [Read-Only] — [Read-Only] Define the amplitude grid labels unit. (YAxisLabelsUnit)
  - `analysis_period_ms`: `float` [Read-Only] — [Read-Only] The analysis period in milliseconds. (float)
  - `audio_bus`: `AudioBus` [Read-Only] — [Read-Only] The audio bus used to obtain audio samples for the oscilloscope (AudioBus)
  - `channel_to_analyze`: `int` [Read-Only] — [Read-Only] The channel to analyze with the oscilloscope (only available if PanelLayoutType is set t...
  - `max_time_window_ms`: `float` [Read-Only] — [Read-Only] The max time window in milliseconds. (float)
  - `oscilloscope_style`: `AudioOscilloscopePanelStyle` [Read-Only] — [Read-Only] The oscilloscope panel style (AudioOscilloscopePanelStyle)
  - `panel_layout_type`: `AudioPanelLayoutType` [Read-Only] — [Read-Only] Show/Hide advanced panel layout. (AudioPanelLayoutType)
  - `show_amplitude_grid`: `bool` [Read-Only] — [Read-Only] Show/Hide the amplitude grid. (bool)
  - `show_amplitude_labels`: `bool` [Read-Only] — [Read-Only] Show/Hide the amplitude labels. (bool)
  - `show_time_grid`: `bool` [Read-Only] — [Read-Only] Show/Hide the time grid. (bool)
  - `time_grid_labels_unit`: `XAxisLabelsUnit` [Read-Only] — [Read-Only] Define the time grid labels unit. (XAxisLabelsUnit)
  - `time_window_ms`: `float` [Read-Only] — [Read-Only] The time window in milliseconds. (float)
  - `trigger_mode`: `AudioOscilloscopeTriggerMode` [Read-Only] — [Read-Only] The trigger detection behavior. (AudioOscilloscopeTriggerMode)
  - `trigger_threshold`: `float` [Read-Only] — [Read-Only] The trigger threshold position in the Y axis. (float)

### `unreal.AudioRadialSlider`
Inherits: `Widget` | Header: `AudioRadialSlider.h`

An audio radial slider widget.

**Methods** (15):
  - `get_output_value(slider_value)` -> `float` — Get output value from normalized linear (0 - 1) based on internal lin to output mapping.
  - `get_slider_value(output_value)` -> `float` — Get normalized linear (0 - 1) slider value from output based on internal lin to output mapping.
  - `set_center_background_color(value)` -> `None` — Sets the label background color
  - `set_hand_start_end_ratio(hand_start_end_ratio)` -> `None` — Sets the start and end of the hand as a ratio to the slider radius (so 0.0 to 1.0 is from the slider center to the handl...
  - `set_output_range(output_range)` -> `None` — Sets the output range
  - `set_show_label_only_on_hover(show_label_only_on_hover)` -> `None` — If true, show text label only on hover; if false always show label.
  - `set_show_units_text(show_units_text)` -> `None` — Sets whether to show the units text
  - `set_slider_bar_color(value)` -> `None` — Sets the slider bar color
  - `set_slider_progress_color(value)` -> `None` — Sets the slider progress color
  - `set_slider_thickness(thickness)` -> `None` — Sets the slider thickness
  - `set_text_label_background_color(color)` -> `None` — Sets the label background color
  - `set_units_text(units)` -> `None` — Sets the units text
  - `set_units_text_read_only(is_read_only)` -> `None` — Sets whether the units text is read only
  - `set_value_text_read_only(is_read_only)` -> `None` — Sets whether the value text is read only
  - `set_widget_layout(layout)` -> `None` — Sets the widget layout

**Properties** (1):
  - `on_value_changed`: `OnAudioRadialSliderValueChangedEvent` — [Read-Write] Called when the value is changed by slider or typing. (OnAudioRadialSliderValueChangedE...

### `unreal.AudioSlider`
Inherits: `AudioSliderBase` | Header: `AudioSlider.h`

An audio slider widget with customizable curves.

**Properties** (2):
  - `lin_to_output_curve`: `CurveFloat` — [Read-Write] Curves for mapping linear to output values. (CurveFloat)
  - `output_to_lin_curve`: `CurveFloat` — [Read-Write] (CurveFloat)

### `unreal.AudioSliderBase`
Inherits: `Widget` | Header: `AudioSlider.h`

An audio slider widget.

**Methods** (13):
  - `get_lin_value(output_value)` -> `float` — Get normalized linear (0 - 1) value from output based on internal lin to output mapping. deprecated: 5.1 - GetLinValue i...
  - `get_output_value(slider_value)` -> `float` — Get output value from normalized linear (0 - 1) based on internal lin to output mapping.
  - `get_slider_value(output_value)` -> `float` — Get normalized linear (0 - 1) slider value from output based on internal lin to output mapping.
  - `set_show_label_only_on_hover(show_label_only_on_hover)` -> `None` — If true, show text label only on hover; if false always show label.
  - `set_show_units_text(show_units_text)` -> `None` — Sets whether to show the units text
  - `set_slider_background_color(value)` -> `None` — Sets the slider background color
  - `set_slider_bar_color(value)` -> `None` — Sets the slider bar color
  - `set_slider_thumb_color(value)` -> `None` — Sets the slider thumb color
  - `set_text_label_background_color(color)` -> `None` — Sets the label background color
  - `set_units_text(units)` -> `None` — Sets the units text
  - `set_units_text_read_only(is_read_only)` -> `None` — Sets whether the units text is read only
  - `set_value_text_read_only(is_read_only)` -> `None` — Sets whether the value text is read only
  - `set_widget_background_color(value)` -> `None` — Sets the widget background color

**Properties** (2):
  - `on_value_changed`: `OnFloatValueChangedEvent` — [Read-Write] Called when the value is changed by slider or typing. (OnFloatValueChangedEvent)
  - `orientation`: `Orientation` [Read-Only] — [Read-Only] The sliderâs orientation. (Orientation)

### `unreal.AudioVectorscope`
Inherits: `Widget` | Header: `AudioVectorscopeUMG.h`

A vectorscope UMG widget.

**Methods** (2):
  - `start_processing()` -> `None` — Starts the vectorscope processing.
  - `stop_processing()` -> `None` — Stops the vectorscope processing.

**Properties** (8):
  - `audio_bus`: `AudioBus` [Read-Only] — [Read-Only] The audio bus used to obtain audio samples for the vectorscope (AudioBus)
  - `display_persistence_ms`: `float` [Read-Only] — [Read-Only] For how long the audio samples should persist in the screen (in milliseconds). (float)
  - `grid_divisions`: `int` [Read-Only] — [Read-Only] The number of grid divisions. (int32)
  - `max_display_persistence_ms`: `float` [Read-Only] — [Read-Only] The max where the audio samples should persist in the screen (in milliseconds). (float)
  - `panel_layout_type`: `AudioPanelLayoutType` [Read-Only] — [Read-Only] Show/Hide advanced panel layout. (AudioPanelLayoutType)
  - `scale`: `float` [Read-Only] — [Read-Only] The scale for the displayed audio samples. (float)
  - `show_grid`: `bool` [Read-Only] — [Read-Only] Show/Hide the vectorscope grid. (bool)
  - `vectorscope_style`: `AudioVectorscopePanelStyle` [Read-Only] — [Read-Only] The vectorscope panel style (AudioVectorscopePanelStyle)

### `unreal.AudioVolumeRadialSlider`
Inherits: `AudioRadialSlider` | Header: `AudioRadialSlider.h`

An audio slider widget, for use with volume.

### `unreal.AudioVolumeSlider`
Inherits: `AudioSlider` | Header: `AudioSlider.h`

An audio slider widget with default customizable curves for volume (dB).

### `unreal.AudioColorGradient`
Inherits: `EnumBase` | Header: `AudioColorMapper.h`

EAudio Color Gradient

**Properties** (2):
  - `BLACK_TO_WHITE`: `AudioColorGradient = Ellipsis` — 0
  - `WHITE_TO_BLACK`: `AudioColorGradient = Ellipsis` — 1

### `unreal.AudioMaterialEnvelopeType`
Inherits: `EnumBase` | Header: `AudioMaterialEnvelopeSettings.h`

Envelope curve types A: Attack D: Decay S: Sustain R: Release

**Properties** (2):
  - `AD`: `AudioMaterialEnvelopeType = Ellipsis` — 0
  - `ADSR`: `AudioMaterialEnvelopeType = Ellipsis` — 1

### `unreal.AudioOscilloscopeTriggerMode`
Inherits: `EnumBase` | Header: `AudioOscilloscopeEnums.h`

EAudio Oscilloscope Trigger Mode

**Properties** (3):
  - `FALLING`: `AudioOscilloscopeTriggerMode = Ellipsis` — 2
  - `NONE`: `AudioOscilloscopeTriggerMode = Ellipsis` — 0
  - `RISING`: `AudioOscilloscopeTriggerMode = Ellipsis` — 1

### `unreal.AudioPanelLayoutType`
Inherits: `EnumBase` | Header: `AudioWidgetsEnums.h`

EAudio Panel Layout Type

**Properties** (2):
  - `ADVANCED`: `AudioPanelLayoutType = Ellipsis` — 1
  - `BASIC`: `AudioPanelLayoutType = Ellipsis` — 0

### `unreal.AudioRadialSliderLayout`
Inherits: `EnumBase` | Header: `SAudioRadialSlider.h`

EAudio Radial Slider Layout

**Properties** (3):
  - `LAYOUT_LABEL_BOTTOM`: `AudioRadialSliderLayout = Ellipsis` — Label below radial slider. 2
  - `LAYOUT_LABEL_CENTER`: `AudioRadialSliderLayout = Ellipsis` — Label in the center of the radial slider. 1
  - `LAYOUT_LABEL_TOP`: `AudioRadialSliderLayout = Ellipsis` — Label above radial slider. 0

### `unreal.AudioSpectrogramFrequencyAxisPixelBucketMode`
Inherits: `EnumBase` | Header: `AudioSpectrogramViewport.h`

EAudio Spectrogram Frequency Axis Pixel Bucket Mode

**Properties** (3):
  - `AVERAGE`: `AudioSpectrogramFrequencyAxisPixelBucketMode = Ellipsis` — Plot the average of the data points in each frequency axis pixel bucket. 2
  - `PEAK`: `AudioSpectrogramFrequencyAxisPixelBucketMode = Ellipsis` — Plot one data point per frequency axis pixel bucket only, choosing the data point with the highest s...
  - `SAMPLE`: `AudioSpectrogramFrequencyAxisPixelBucketMode = Ellipsis` — Plot one data point per frequency axis pixel bucket only, choosing the data point nearest the pixel ...

### `unreal.AudioSpectrogramFrequencyAxisScale`
Inherits: `EnumBase` | Header: `AudioSpectrogramViewport.h`

EAudio Spectrogram Frequency Axis Scale

**Properties** (2):
  - `LINEAR`: `AudioSpectrogramFrequencyAxisScale = Ellipsis` — 0
  - `LOGARITHMIC`: `AudioSpectrogramFrequencyAxisScale = Ellipsis` — 1

### `unreal.AudioSpectrumAnalyzerBallistics`
Inherits: `EnumBase` | Header: `AudioSpectrumAnalyzer.h`

EAudio Spectrum Analyzer Ballistics

**Properties** (2):
  - `ANALOG`: `AudioSpectrumAnalyzerBallistics = Ellipsis` — 0
  - `DIGITAL`: `AudioSpectrumAnalyzerBallistics = Ellipsis` — 1

### `unreal.AudioSpectrumAnalyzerType`
Inherits: `EnumBase` | Header: `AudioSpectrumAnalyzer.h`

EAudio Spectrum Analyzer Type

**Properties** (2):
  - `CQT`: `AudioSpectrumAnalyzerType = Ellipsis` — Constant-Q Transform 1
  - `FFT`: `AudioSpectrumAnalyzerType = Ellipsis` — Fast Fourier Transform 0

### `unreal.AudioSpectrumPlotFrequencyAxisPixelBucketMode`
Inherits: `EnumBase` | Header: `SAudioSpectrumPlot.h`

EAudio Spectrum Plot Frequency Axis Pixel Bucket Mode

**Properties** (3):
  - `AVERAGE`: `AudioSpectrumPlotFrequencyAxisPixelBucketMode = Ellipsis` — Plot the average of the data points in each frequency axis pixel bucket. 2
  - `PEAK`: `AudioSpectrumPlotFrequencyAxisPixelBucketMode = Ellipsis` — Plot one data point per frequency axis pixel bucket only, choosing the data point with the highest s...
  - `SAMPLE`: `AudioSpectrumPlotFrequencyAxisPixelBucketMode = Ellipsis` — Plot one data point per frequency axis pixel bucket only, choosing the data point nearest the pixel ...

### `unreal.AudioSpectrumPlotFrequencyAxisScale`
Inherits: `EnumBase` | Header: `SAudioSpectrumPlot.h`

EAudio Spectrum Plot Frequency Axis Scale

**Properties** (2):
  - `LINEAR`: `AudioSpectrumPlotFrequencyAxisScale = Ellipsis` — 0
  - `LOGARITHMIC`: `AudioSpectrumPlotFrequencyAxisScale = Ellipsis` — 1

### `unreal.AudioSpectrumPlotTilt`
Inherits: `EnumBase` | Header: `SAudioSpectrumPlot.h`

EAudio Spectrum Plot Tilt

**Properties** (5):
  - `NO_TILT`: `AudioSpectrumPlotTilt = Ellipsis` — 0 dB/octave slope (white noise is flat). 0
  - `PLUS1_5D_B_PER_OCTAVE`: `AudioSpectrumPlotTilt = Ellipsis` — 1.5 dB/octave slope. 1
  - `PLUS3D_B_PER_OCTAVE`: `AudioSpectrumPlotTilt = Ellipsis` — 3 dB/octave slope (pink noise is flat). 2
  - `PLUS4_5D_B_PER_OCTAVE`: `AudioSpectrumPlotTilt = Ellipsis` — 4.5 dB/octave slope. 3
  - `PLUS6D_B_PER_OCTAVE`: `AudioSpectrumPlotTilt = Ellipsis` — 6 dB/octave slope (Brownian noise is flat). 4

### `unreal.AudioUnitsValueType`
Inherits: `EnumBase` | Header: `AudioWidgetsEnums.h`

EAudio Units Value Type

**Properties** (3):
  - `FREQUENCY`: `AudioUnitsValueType = Ellipsis` — 1
  - `LINEAR`: `AudioUnitsValueType = Ellipsis` — 0
  - `VOLUME`: `AudioUnitsValueType = Ellipsis` — 2

### `unreal.XAxisLabelsUnit`
Inherits: `EnumBase` | Header: `SAudioOscilloscopePanelWidget.h`

EXAxis Labels Unit

**Properties** (2):
  - `SAMPLES`: `XAxisLabelsUnit = Ellipsis` — 0
  - `SECONDS`: `XAxisLabelsUnit = Ellipsis` — 1

### `unreal.YAxisLabelsUnit`
Inherits: `EnumBase` | Header: `SAudioOscilloscopePanelWidget.h`

EYAxis Labels Unit

**Properties** (2):
  - `DB`: `YAxisLabelsUnit = Ellipsis` — 1
  - `LINEAR`: `YAxisLabelsUnit = Ellipsis` — 0

### `unreal.AudioMaterialMeter_GetMeterChannelInfo`
Inherits: `DelegateBase` | Header: `AudioMaterialMeter.h`

Get Meter Channel Info Delegate Signature

### `unreal.AudioMeter_GetMeterChannelInfo`
Inherits: `DelegateBase` | Header: `AudioMeter.h`

Get Meter Channel Info Delegate Signature

### `unreal.AudioOscilloscope_GetOscilloscopeAudioSamples`
Inherits: `DelegateBase` | Header: `AudioOscilloscopeUMG.h`

Get Oscilloscope Audio Samples Delegate Signature

### `unreal.AudioVectorscope_GetVectorscopeAudioSamples`
Inherits: `DelegateBase` | Header: `AudioVectorscopeUMG.h`

Get Vectorscope Audio Samples Delegate Signature

### `unreal.OnAudioRadialSliderValueChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `AudioRadialSlider.h`

On Audio Radial Slider Value Changed Event Delegate Signature

### `unreal.OnButtonPressedChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `AudioMaterialButton.h`

On Button Pressed Changed Event Delegate Signature

### `unreal.OnKnobValueChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `AudioMaterialKnob.h`

On Knob Value Changed Event Delegate Signature

### `unreal.OnSliderFloatValueChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `AudioMaterialSlider.h`

On Slider Float Value Changed Event Delegate Signature
