# UE Python API — SlateCore Module

**79 types** from the `SlateCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnalogInputEvent`, `ButtonStyle`, `CaptureLostEvent`, `CharacterEvent`, `CheckBoxStyle`, `ComboBoxStyle`, `ComboButtonStyle`, `CompositeFont`, `DeprecateSlateVector2D`, `EditableTextBoxStyle`, `EditableTextStyle`, `ExpandableAreaStyle`, `FocusEvent`, `FontOutlineSettings`, `FontSdfSettings`, `Geometry`, `HyperlinkStyle`, `InlineEditableTextBlockStyle`, `InputEvent`, `KeyEvent`, ... (79 total)

---

## Classes

### `unreal.AnalogInputEvent`
Inherits: `KeyEvent` | Header: `Events.h`

FAnalogEvent describes a analog key value. It is passed to event handlers dealing with analog keys.

### `unreal.ButtonStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SButton

**Properties** (13):
  - `clicked_slate_sound`: `SlateSound` — [Read-Write] The sound the button should play when clicked (SlateSound)
  - `disabled`: `SlateBrush` — [Read-Write] Button appearance when disabled, by default this is set to an invalid resource when tha...
  - `disabled_foreground`: `SlateColor` — [Read-Write] Foreground Color when disabled (SlateColor)
  - `hovered`: `SlateBrush` — [Read-Write] Button appearance when hovered (SlateBrush)
  - `hovered_foreground`: `SlateColor` — [Read-Write] Foreground Color when hovered (SlateColor)
  - `hovered_slate_sound`: `SlateSound` — [Read-Write] The sound the button should play when initially hovered over (SlateSound)
  - `normal`: `SlateBrush` — [Read-Write] Button appearance when the button is not hovered or pressed (SlateBrush)
  - `normal_foreground`: `SlateColor` — [Read-Write] Foreground Color when the button is not hovered or pressed (SlateColor)
  - `normal_padding`: `Margin` — [Read-Write] Padding that accounts for the border in the buttonâs background image.
When this is a...
  - `pressed`: `SlateBrush` — [Read-Write] Button appearance when pressed (SlateBrush)
  - `pressed_foreground`: `SlateColor` — [Read-Write] Foreground Color when pressed (SlateColor)
  - `pressed_padding`: `Margin` — [Read-Write] Same as NormalPadding but used when the button is pressed. Allows for moving the conten...
  - `pressed_slate_sound`: `SlateSound` — [Read-Write] The sound the button should play when pressed (SlateSound)

### `unreal.CaptureLostEvent`
Inherits: `StructBase` | Header: `Events.h`

Capture Lost Event

### `unreal.CharacterEvent`
Inherits: `InputEvent` | Header: `Events.h`

FCharacterEvent describes a keyboard action where the utf-16 code is given. Used for OnKeyChar messages

### `unreal.CheckBoxStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SCheckBox

**Properties** (25):
  - `background_hovered_image`: `SlateBrush` — [Read-Write] Background appearance when hovered (SlateBrush)
  - `background_image`: `SlateBrush` — [Read-Write] Background appearance (SlateBrush)
  - `background_pressed_image`: `SlateBrush` — [Read-Write] Background appearance when pressed (SlateBrush)
  - `border_background_color`: `SlateColor` — [Read-Write] BorderBackgroundColor refers to the actual color and opacity of the supplied border ima...
  - `check_box_type`: `SlateCheckBoxType` — [Read-Write] The visual type of the checkbox (SlateCheckBoxType)
  - `checked_foreground`: `SlateColor` — [Read-Write] Foreground Color when checked (SlateColor)
  - `checked_hovered_foreground`: `SlateColor` — [Read-Write] Foreground Color when checked and pressed (SlateColor)
  - `checked_hovered_image`: `SlateBrush` — [Read-Write] CheckBox appearance when checked and hovered (SlateBrush)
  - `checked_image`: `SlateBrush` — [Read-Write] CheckBox appearance when the CheckBox is checked (SlateBrush)
  - `checked_pressed_foreground`: `SlateColor` — [Read-Write] Foreground Color when checked and pressed (SlateColor)
  - `checked_pressed_image`: `SlateBrush` — [Read-Write] CheckBox appearance when checked and pressed (SlateBrush)
  - `checked_slate_sound`: `SlateSound` — [Read-Write] The sound the check box should play when checked (SlateSound)
  - `foreground_color`: `SlateColor` — [Read-Write] The normal unchecked foreground color (SlateColor)
  - `hovered_foreground`: `SlateColor` — [Read-Write] Foreground Color when hovered (SlateColor)
  - `hovered_slate_sound`: `SlateSound` — [Read-Write] The sound the check box should play when initially hovered over (SlateSound)
  - `padding`: `Margin` — [Read-Write] Padding (Margin)
  - `pressed_foreground`: `SlateColor` — [Read-Write] Foreground Color when pressed (SlateColor)
  - `unchecked_hovered_image`: `SlateBrush` — [Read-Write] CheckBox appearance when the CheckBox is unchecked and hovered (SlateBrush)
  - `unchecked_image`: `SlateBrush` — [Read-Write] CheckBox appearance when the CheckBox is unchecked (normal) (SlateBrush)
  - `unchecked_pressed_image`: `SlateBrush` — [Read-Write] CheckBox appearance when the CheckBox is unchecked and hovered (SlateBrush)
  - `unchecked_slate_sound`: `SlateSound` — [Read-Write] The sound the check box should play when unchecked (SlateSound)
  - `undetermined_foreground`: `SlateColor` — [Read-Write] Foreground Color when the check state is indeterminate (SlateColor)
  - `undetermined_hovered_image`: `SlateBrush` — [Read-Write] CheckBox appearance when CheckBox is undetermined and hovered (SlateBrush)
  - `undetermined_image`: `SlateBrush` — [Read-Write] CheckBox appearance when the CheckBox is undetermined (SlateBrush)
  - `undetermined_pressed_image`: `SlateBrush` — [Read-Write] CheckBox appearance when CheckBox is undetermined and pressed (SlateBrush)

### `unreal.ComboBoxStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SComboBox

**Properties** (5):
  - `combo_button_style`: `ComboButtonStyle` — [Read-Write] The style to use for our SComboButton (ComboButtonStyle)
  - `content_padding`: `Margin` — [Read-Write] * Button Content Padding (Margin)
  - `menu_row_padding`: `Margin` — [Read-Write] * Menu Row Padding (Margin)
  - `pressed_slate_sound`: `SlateSound` — [Read-Write] The sound the button should play when pressed (SlateSound)
  - `selection_change_slate_sound`: `SlateSound` — [Read-Write] The Sound to play when the selection is changed (SlateSound)

### `unreal.ComboButtonStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SComboButton

**Properties** (9):
  - `button_style`: `ButtonStyle` — [Read-Write] The style to use for our SButton. (ButtonStyle)
  - `content_padding`: `Margin` — [Read-Write] * Button Content Padding (Margin)
  - `down_arrow_align`: `VerticalAlignment` — [Read-Write] * Dropdown arrow vertical alignment (VerticalAlignment)
  - `down_arrow_image`: `SlateBrush` — [Read-Write] Image to use for the down arrow. (SlateBrush)
  - `down_arrow_padding`: `Margin` — [Read-Write] * Dropdown arrow padding (if a dropdown arrow exists) (Margin)
  - `menu_border_brush`: `SlateBrush` — [Read-Write] Brush to use to add a âmenu borderâ around the drop-down content. (SlateBrush)
  - `menu_border_padding`: `Margin` — [Read-Write] Padding to use to add a âmenu borderâ around the drop-down content. (Margin)
  - `shadow_color_and_opacity`: `LinearColor` — [Read-Write] The color and opacity of the shadow for the down arrow.
Only active if ShadowOffset is ...
  - `shadow_offset`: `DeprecateSlateVector2D` — [Read-Write] How much should the shadow be offset for the down arrow?
An offset of 0 implies no shad...

### `unreal.CompositeFont`
Inherits: `StructBase` | Header: `CompositeFont.h`

Composite Font

### `unreal.DeprecateSlateVector2D`
Inherits: `Vector2f` | Header: `SlateVector2.h`

Vector2D (single-precision)

### `unreal.EditableTextBoxStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SEditableTextBox

**Properties** (13):
  - `background_color`: `SlateColor` — [Read-Write] The background color applied to the active background image (SlateColor)
  - `background_image_focused`: `SlateBrush` — [Read-Write] Border background image when the box is focused (SlateBrush)
  - `background_image_hovered`: `SlateBrush` — [Read-Write] Border background image when the box is hovered (SlateBrush)
  - `background_image_normal`: `SlateBrush` — [Read-Write] Border background image when the box is not hovered or focused (SlateBrush)
  - `background_image_read_only`: `SlateBrush` [Read-Only] — [Read-Write] Border background image when the box is read-only (SlateBrush)
  - `focused_foreground_color`: `SlateColor` — [Read-Write] The foreground color of text when the edit box has keyboard focus. (SlateColor)
  - `foreground_color`: `SlateColor` — [Read-Write] The foreground color of text. (SlateColor)
  - `h_scroll_bar_padding`: `Margin` — [Read-Write] Padding around the horizontal scrollbar (Margin)
  - `padding`: `Margin` — [Read-Write] Padding (Margin)
  - `read_only_foreground_color`: `SlateColor` [Read-Only] — [Read-Write] The read-only foreground color of text in read-only mode. (SlateColor)
  - `scroll_bar_style`: `ScrollBarStyle` — [Read-Write] Style used for the scrollbars (ScrollBarStyle)
  - `text_style`: `TextBlockStyle` — [Read-Write] The style of the text block, which dictates the font, color, and shadow options. Style ...
  - `v_scroll_bar_padding`: `Margin` — [Read-Write] Padding around the vertical scrollbar (Margin)

### `unreal.EditableTextStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SEditableText

**Properties** (5):
  - `background_image_composing`: `SlateBrush` — [Read-Write] Background image for the selected text (SlateBrush)
  - `background_image_selected`: `SlateBrush` — [Read-Write] Background image for the selected text (SlateBrush)
  - `caret_image`: `SlateBrush` — [Read-Write] Image brush used for the caret (SlateBrush)
  - `color_and_opacity`: `SlateColor` — [Read-Write] The color and opacity of this text (SlateColor)
  - `font`: `SlateFontInfo` — [Read-Write] Font family and size to be used when displaying this text. (SlateFontInfo)

### `unreal.ExpandableAreaStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SExpandableArea

### `unreal.FocusEvent`
Inherits: `StructBase` | Header: `Events.h`

FFocusEvent is used when notifying widgets about keyboard focus changes It is passed to event handlers dealing with keyboard focus

### `unreal.FontOutlineSettings`
Inherits: `StructBase` | Header: `SlateFontInfo.h`

Settings for applying an outline to a font

**Properties** (6):
  - `apply_outline_to_drop_shadows`: `bool` — [Read-Write] When enabled the outline will be applied to any drop shadow that uses this font (bool)
  - `mitered_corners`: `bool` — [Read-Write] When enabled, outlines have sharp mitered corners, otherwise they are rounded. (bool)
  - `outline_color`: `LinearColor` — [Read-Write] The color of the outline for any character in this font (LinearColor)
  - `outline_material`: `Object` — [Read-Write] Optional material to apply to the outline (Object)
  - `outline_size`: `int` — [Read-Write] Size of the outline in slate units (at 1.0 font scale this unit is a pixel) (int32)
  - `separate_fill_alpha`: `bool` — [Read-Write] When enabled the outline will be completely translucent where the filled area will be. ...

### `unreal.FontSdfSettings`
Inherits: `StructBase` | Header: `FontSdfSettings.h`

Settings for signed distance field fonts.

### `unreal.Geometry`
Inherits: `StructBase` | Header: `Geometry.h`

Represents the position, size, and absolute position of a Widget in Slate. The absolute location of a geometry is usually screen space or window space depending on where the geometry originated. Geome...

### `unreal.HyperlinkStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SHyperlink

**Properties** (3):
  - `padding`: `Margin` — [Read-Write] Padding (Margin)
  - `text_style`: `TextBlockStyle` — [Read-Write] Text style (TextBlockStyle)
  - `underline_style`: `ButtonStyle` — [Read-Write] Underline style (ButtonStyle)

### `unreal.InlineEditableTextBlockStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SInlineEditableTextBlock

**Properties** (2):
  - `editable_text_box_style`: `EditableTextBoxStyle` — [Read-Write] The style of the editable text box, which dictates the font, color, and shadow options....
  - `text_style`: `TextBlockStyle` — [Read-Write] The style of the text block, which dictates the font, color, and shadow options. Style ...

### `unreal.InputEvent`
Inherits: `StructBase` | Header: `Events.h`

Base class for all mouse and keyevents.

### `unreal.KeyEvent`
Inherits: `InputEvent` | Header: `Events.h`

FKeyEvent describes a key action (keyboard/controller key/button pressed or released.) It is passed to event handlers dealing with key input.

### `unreal.Margin`
Inherits: `StructBase` | Header: `Margin.h`

Describes the space around a Widget.

**Properties** (4):
  - `bottom`: `float` — [Read-Write] Holds the margin to the bottom. (float)
  - `left`: `float` — [Read-Write] Holds the margin to the left. (float)
  - `right`: `float` — [Read-Write] Holds the margin to the right. (float)
  - `top`: `float` — [Read-Write] Holds the margin to the top. (float)

### `unreal.MotionEvent`
Inherits: `InputEvent` | Header: `Events.h`

FMotionEvent describes a touch pad action (press, move, lift) It is passed to event handlers dealing with touch input.

### `unreal.NavigationEvent`
Inherits: `InputEvent` | Header: `Events.h`

FNavigationEvent describes a navigation action (Left, Right, Up, Down) It is passed to event handlers dealing with navigation.

### `unreal.PointerEvent`
Inherits: `InputEvent` | Header: `Events.h`

FPointerEvent describes a mouse or touch action (e.g. Press, Release, Move, etc). It is passed to event handlers dealing with pointer-based input.

### `unreal.ProgressBarStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SProgressBar

**Properties** (4):
  - `background_image`: `SlateBrush` — [Read-Write] Background image to use for the progress bar (SlateBrush)
  - `enable_fill_animation`: `bool` — [Read-Write] Enables a simple animation on the fill image to give the appearance that progress has n...
  - `fill_image`: `SlateBrush` — [Read-Write] Foreground image to use for the progress bar (SlateBrush)
  - `marquee_image`: `SlateBrush` — [Read-Write] Image to use for marquee mode (SlateBrush)

### `unreal.ScrollBarStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SScrollBar

**Properties** (10):
  - `dragged_thumb_image`: `SlateBrush` — [Read-Write] Image to use when the scrollbar thumb is in its dragged state (SlateBrush)
  - `horizontal_background_image`: `SlateBrush` — [Read-Write] Background image to use when the scrollbar is oriented horizontally (SlateBrush)
  - `horizontal_bottom_slot_image`: `SlateBrush` — [Read-Write] The image to use to represent the track below the thumb when the scrollbar is oriented ...
  - `horizontal_top_slot_image`: `SlateBrush` — [Read-Write] The image to use to represent the track above the thumb when the scrollbar is oriented ...
  - `hovered_thumb_image`: `SlateBrush` — [Read-Write] Image to use when the scrollbar thumb is in its hovered state (SlateBrush)
  - `normal_thumb_image`: `SlateBrush` — [Read-Write] Image to use when the scrollbar thumb is in its normal state (SlateBrush)
  - `thickness`: `float` — [Read-Write] (float)
  - `vertical_background_image`: `SlateBrush` — [Read-Write] Background image to use when the scrollbar is oriented vertically (SlateBrush)
  - `vertical_bottom_slot_image`: `SlateBrush` — [Read-Write] The image to use to represent the track below the thumb when the scrollbar is oriented ...
  - `vertical_top_slot_image`: `SlateBrush` — [Read-Write] The image to use to represent the track above the thumb when the scrollbar is oriented ...

### `unreal.ScrollBorderStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an FScrollBorderStyle

**Properties** (2):
  - `bottom_shadow_brush`: `SlateBrush` — [Read-Write] Brush used to draw the bottom shadow of a scrollborder (SlateBrush)
  - `top_shadow_brush`: `SlateBrush` — [Read-Write] Brush used to draw the top shadow of a scrollborder (SlateBrush)

### `unreal.ScrollBoxStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SScrollBox

**Properties** (7):
  - `bar_thickness`: `float` — [Read-Write] (float)
  - `bottom_shadow_brush`: `SlateBrush` — [Read-Write] Brush used to draw the bottom shadow of a scrollbox (SlateBrush)
  - `horizontal_scrolled_content_padding`: `Margin` — [Read-Write] Padding scroll panel that presents the scrolled content (Margin)
  - `left_shadow_brush`: `SlateBrush` — [Read-Write] Brush used to draw the left shadow of a scrollbox (SlateBrush)
  - `right_shadow_brush`: `SlateBrush` — [Read-Write] Brush used to draw the right shadow of a scrollbox (SlateBrush)
  - `top_shadow_brush`: `SlateBrush` — [Read-Write] Brush used to draw the top shadow of a scrollbox (SlateBrush)
  - `vertical_scrolled_content_padding`: `Margin` — [Read-Write] Padding scroll panel that presents the scrolled content (Margin)

### `unreal.SegmentedControlStyle`
Inherits: `SlateWidgetStyle` | Header: `SegmentedControlStyle.h`

Represents the appearance of an SSegmentedControl

**Properties** (5):
  - `background_brush`: `SlateBrush` — [Read-Write] Background of the segmented control (SlateBrush)
  - `control_style`: `CheckBoxStyle` — [Read-Write] The style to use for our Center Control (CheckBoxStyle)
  - `first_control_style`: `CheckBoxStyle` — [Read-Write] The style to use for our Left Control (CheckBoxStyle)
  - `last_control_style`: `CheckBoxStyle` — [Read-Write] The style to use for our Left Control (CheckBoxStyle)
  - `uniform_padding`: `Margin` — [Read-Write] Padding between each control (Margin)

### `unreal.SlateBrush`
Inherits: `StructBase` | Header: `SlateBrush.h`

A brush which contains information about how to draw a Slate element //, meta = (HasNativeMake = ââ))

**Properties** (9):
  - `draw_as`: `SlateBrushDrawType` — [Read-Write] How to draw the image (SlateBrushDrawType)
  - `image_size`: `DeprecateSlateVector2D` — [Read-Write] Size of the resource in Slate Units (DeprecateSlateVector2D)
  - `margin`: `Margin` — [Read-Write] The margin to use in Box and Border modes (Margin)
  - `mirroring`: `SlateBrushMirrorType` — [Read-Write] How to mirror the image in Image mode.  This is normally only used for dynamic image br...
  - `outline_settings`: `SlateBrushOutlineSettings` — [Read-Write] How to draw the outline.  Currently only used for RoundedBox type brushes. (SlateBrushO...
  - `resource_object`: `Object` — [Read-Write] The image to render for this brush, can be a UTexture or UMaterialInterface or an objec...
  - `texture_object`: `Object` — âtexture_objectâ was renamed to âresource_objectâ. deprecated
  - `tiling`: `SlateBrushTileType` — [Read-Write] How to tile the image in Image mode (SlateBrushTileType)
  - `tint_color`: `SlateColor` — [Read-Write] Tinting applied to the image. (SlateColor)

### `unreal.SlateBrushOutlineSettings`
Inherits: `StructBase` | Header: `SlateBrush.h`

Possible options for rounded box brush image

**Properties** (5):
  - `color`: `SlateColor` — [Read-Write] Tinting applied to the border outline. (SlateColor)
  - `corner_radii`: `Vector4` — [Read-Write] Radius in Slate Units applied to the outline at each corner. X = Top Left, Y = Top Righ...
  - `rounding_type`: `SlateBrushRoundingType` — [Read-Write] The Rounding Type * (SlateBrushRoundingType)
  - `use_brush_transparency`: `bool` — [Read-Write] True if we should use the owning brushâs transparency as our own * (bool)
  - `width`: `float` — [Read-Write] Line width in Slate Units applied to the border outline. (float)

### `unreal.SlateColor`
Inherits: `StructBase` | Header: `SlateColor.h`

A Slate color can be a directly specified value, or the color can be pulled from a WidgetStyle.

**Properties** (2):
  - `color_use_rule`: `SlateColorStylingMode` — [Read-Write] The rule for which color to pick. (SlateColorStylingMode)
  - `specified_color`: `LinearColor` — [Read-Write] The current specified color; only meaningful when ColorToUse == UseColor_Specified. (Li...

### `unreal.SlateFontInfo`
Inherits: `StructBase` | Header: `SlateFontInfo.h`

A representation of a font in Slate.

**Properties** (10):
  - `font_material`: `Object` — [Read-Write] The material to use when rendering (Object)
  - `font_object`: `Object` — [Read-Write] The font object (valid when used from UMG or a Slate widget style asset) (Object)
  - `force_monospaced`: `bool` — [Read-Write] Enable pseudo-monospaced font. (bool)
  - `letter_spacing`: `int` — [Read-Write] The uniform spacing (or tracking) between all characters in the text. (int32)
  - `material_is_stencil`: `bool` — [Read-Write] When enabled, whole quads are filled by the material without automatically stenciling t...
  - `monospaced_width`: `float` — [Read-Write] The uniform width to apply to all characters when bForceMonospaced is enabled, proporti...
  - `outline_settings`: `FontOutlineSettings` — [Read-Write] Settings for applying an outline to a font (FontOutlineSettings)
  - `size`: `float` — [Read-Write] The font size is a measure in point values. The conversion of points to Slate Units is ...
  - `skew_amount`: `float` — [Read-Write] A skew amount to apply to the text. (float)
  - `typeface_font_name`: `Name` — [Read-Write] The name of the font to use from the default typeface (None will use the first entry) (...

### `unreal.SlateSound`
Inherits: `StructBase` | Header: `SlateSound.h`

An intermediary to make UBaseSound available for Slate to play sounds

**Properties** (1):
  - `resource_object`: `Object` — [Read-Write] Pointer to the USoundBase. Holding onto it as a UObject because USoundBase is not avail...

### `unreal.SlateWidgetStyle`
Inherits: `StructBase` | Header: `SlateWidgetStyle.h`

Base structure for widget styles.

### `unreal.SliderStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SSlider

**Properties** (7):
  - `bar_thickness`: `float` — [Read-Write] (float)
  - `disabled_bar_image`: `SlateBrush` — [Read-Write] Image to use when the slider bar is in its disabled state (SlateBrush)
  - `disabled_thumb_image`: `SlateBrush` — [Read-Write] Image to use when the slider thumb is in its disabled state (SlateBrush)
  - `hovered_bar_image`: `SlateBrush` — [Read-Write] Image to use when the slider bar is in its hovered state (SlateBrush)
  - `hovered_thumb_image`: `SlateBrush` — [Read-Write] Image to use when the slider thumb is in its hovered state (SlateBrush)
  - `normal_bar_image`: `SlateBrush` — [Read-Write] Image to use when the slider bar is in its normal state (SlateBrush)
  - `normal_thumb_image`: `SlateBrush` — [Read-Write] Image to use when the slider thumb is in its normal state (SlateBrush)

### `unreal.SpinBoxStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SSpinBox

**Properties** (9):
  - `active_background_brush`: `SlateBrush` — [Read-Write] (SlateBrush)
  - `active_fill_brush`: `SlateBrush` — [Read-Write] Brush used to fill the spinbox when itâs active (SlateBrush)
  - `arrows_image`: `SlateBrush` — [Read-Write] Image used to draw the spinbox arrows (SlateBrush)
  - `background_brush`: `SlateBrush` — [Read-Write] Brush used to draw the background of the spinbox (SlateBrush)
  - `hovered_background_brush`: `SlateBrush` — [Read-Write] Brush used to draw the background of the spinbox when itâs hovered over (SlateBrush)
  - `hovered_fill_brush`: `SlateBrush` — [Read-Write] Brush used to fill the spinbox when itâs hovered and not active (SlateBrush)
  - `inactive_fill_brush`: `SlateBrush` — [Read-Write] Brush used to fill the spinbox when itâs inactive (SlateBrush)
  - `inset_padding`: `Margin` — [Read-Write] Padding between the background brush and the fill brush (Margin)
  - `text_padding`: `Margin` — [Read-Write] Padding to add around the spinbox and its text (Margin)

### `unreal.SplitterStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SSplitter

**Properties** (2):
  - `handle_highlight_brush`: `SlateBrush` — [Read-Write] Brush used to draw the handle in its highlight state (SlateBrush)
  - `handle_normal_brush`: `SlateBrush` — [Read-Write] Brush used to draw the handle in its normal state (SlateBrush)

### `unreal.TableRowStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an STableRow

**Properties** (19):
  - `active_brush`: `SlateBrush` — [Read-Write] Brush used when a selected row is active (SlateBrush)
  - `active_highlighted_brush`: `SlateBrush` — [Read-Write] Brush used when a highlighted row is active (SlateBrush)
  - `active_hovered_brush`: `SlateBrush` — [Read-Write] Brush used when a selected row is active and hovered (SlateBrush)
  - `drop_indicator_above`: `SlateBrush` — [Read-Write] Brush used to provide feedback that a user can drop above the hovered row. (SlateBrush)
  - `drop_indicator_below`: `SlateBrush` — [Read-Write] Brush used to provide feedback that a user can drop below the hovered row. (SlateBrush)
  - `drop_indicator_onto`: `SlateBrush` — [Read-Write] Brush used to provide feedback that a user can drop onto the hovered row. (SlateBrush)
  - `even_row_background_brush`: `SlateBrush` — [Read-Write] Brush used when an even row is in its normal state (SlateBrush)
  - `even_row_background_hovered_brush`: `SlateBrush` — [Read-Write] Brush used when an even row is hovered (SlateBrush)
  - `inactive_brush`: `SlateBrush` — [Read-Write] Brush used when a selected row is inactive (SlateBrush)
  - `inactive_highlighted_brush`: `SlateBrush` — [Read-Write] Brush used when a highlighted row is inactive and hovered (SlateBrush)
  - `inactive_hovered_brush`: `SlateBrush` — [Read-Write] Brush used when a selected row is inactive and hovered (SlateBrush)
  - `odd_row_background_brush`: `SlateBrush` — [Read-Write] Brush to used when an odd row is in its normal state (SlateBrush)
  - `odd_row_background_hovered_brush`: `SlateBrush` — [Read-Write] Brush used when an odd row is hovered (SlateBrush)
  - `parent_row_background_brush`: `SlateBrush` — [Read-Write] Brush used for the top parent row (SlateBrush)
  - `parent_row_background_hovered_brush`: `SlateBrush` — [Read-Write] Brush used for the top parent row and row is hovered (SlateBrush)
  - `selected_text_color`: `SlateColor` — [Read-Write] Text color used for the selected row (SlateColor)
  - `selector_focused_brush`: `SlateBrush` — [Read-Write] Brush used as a selector when a row is focused (SlateBrush)
  - `text_color`: `SlateColor` — [Read-Write] Text color used for all rows (SlateColor)
  - `use_parent_row_brush`: `bool` — [Read-Write] If using parent row brushes (bool)

### `unreal.TableViewStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an STableView

**Properties** (1):
  - `background_brush`: `SlateBrush` — [Read-Write] Brush used when a selected row is active (SlateBrush)

### `unreal.TextBlockStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an STextBlock

**Properties** (10):
  - `color_and_opacity`: `SlateColor` — [Read-Write] The color and opacity of this text (SlateColor)
  - `font`: `SlateFontInfo` — [Read-Write] Font family and size to be used when displaying this text. (SlateFontInfo)
  - `highlight_color`: `SlateColor` — [Read-Write] The color of highlighted text (SlateColor)
  - `highlight_shape`: `SlateBrush` — [Read-Write] The shape of highlighted text (SlateBrush)
  - `overflow_policy`: `TextOverflowPolicy` — [Read-Write] Determines what happens to text that is clipped and doesnât fit within the clip rect ...
  - `shadow_color_and_opacity`: `LinearColor` — [Read-Write] The color and opacity of the shadow (LinearColor)
  - `shadow_offset`: `DeprecateSlateVector2D` — [Read-Write] How much should the shadow be offset? An offset of 0 implies no shadow. (DeprecateSlate...
  - `strike_brush`: `SlateBrush` — [Read-Write] The brush used to draw an strike through the text (if any) (SlateBrush)
  - `transform_policy`: `TextTransformPolicy` — [Read-Write] The Text Transform Policy (defaults to None) (TextTransformPolicy)
  - `underline_brush`: `SlateBrush` — [Read-Write] The brush used to draw an underline under the text (if any) (SlateBrush)

### `unreal.ToolBarStyle`
Inherits: `SlateWidgetStyle` | Header: `ToolBarStyle.h`

Represents the appearance of a toolbar

**Properties** (40):
  - `allow_wrap_button`: `bool` — [Read-Write] Set to false if the wrap button should never be shown (even if entries are clipped) (bo...
  - `allow_wrapping_default`: `bool` — [Read-Write] Set to false if the toolbar should not wrap (to the next line) by default, but can be o...
  - `background_brush`: `SlateBrush` — [Read-Write] The brush used for the background of the toolbar (SlateBrush)
  - `background_padding`: `Margin` — [Read-Write] (Margin)
  - `block_hovered`: `SlateBrush` — [Read-Write] Hovered brush for an entire block (SlateBrush)
  - `block_padding`: `Margin` — [Read-Write] (Margin)
  - `button_content_fill_width`: `float` — [Read-Write] (float)
  - `button_content_max_width`: `float` — [Read-Write] (float)
  - `button_padding`: `Margin` — [Read-Write] (Margin)
  - `button_style`: `ButtonStyle` — [Read-Write] (ButtonStyle)
  - `check_box_padding`: `Margin` — [Read-Write] (Margin)
  - `combo_button_padding`: `Margin` — [Read-Write] (Margin)
  - `combo_button_style`: `ComboButtonStyle` — [Read-Write] (ComboButtonStyle)
  - `combo_content_horizontal_alignment`: `HorizontalAlignment` — [Read-Write] (HorizontalAlignment)
  - `combo_content_max_width`: `float` — [Read-Write] Max width that label text block slot in combo buttons should have. 0 means no max. (flo...
  - `combo_content_min_width`: `float` — [Read-Write] Min width that label text block slot in combo buttons should have. (float)
  - `editable_text_style`: `EditableTextBoxStyle` — [Read-Write] (EditableTextBoxStyle)
  - `expand_brush`: `SlateBrush` — [Read-Write] The brush used for the expand arrow when the toolbar runs out of room and needs to disp...
  - `icon_padding`: `Margin` — [Read-Write] (Margin)
  - `icon_padding_with_collapsed_label`: `Margin` — [Read-Write] (Margin)
  - `icon_padding_with_visible_label`: `Margin` — [Read-Write] (Margin)
  - `icon_size`: `DeprecateSlateVector2D` — [Read-Write] (DeprecateSlateVector2D)
  - `indented_block_padding`: `Margin` — [Read-Write] (Margin)
  - `label_padding`: `Margin` — [Read-Write] (Margin)
  - `label_style`: `TextBlockStyle` — [Read-Write] (TextBlockStyle)
  - `num_columns`: `int` — [Read-Write] (int32)
  - `raised_children_right_padding`: `float` — [Read-Write] (float)
  - `separator_brush`: `SlateBrush` — [Read-Write] (SlateBrush)
  - `separator_padding`: `Margin` — [Read-Write] (Margin)
  - `separator_thickness`: `float` — [Read-Write] (float)
  - `settings_button_style`: `ButtonStyle` — [Read-Write] (ButtonStyle)
  - `settings_combo_button`: `ComboButtonStyle` — [Read-Write] (ComboButtonStyle)
  - `settings_toggle_button`: `CheckBoxStyle` — [Read-Write] (CheckBoxStyle)
  - `show_labels`: `bool` — [Read-Write] (bool)
  - `toggle_button`: `CheckBoxStyle` — [Read-Write] (CheckBoxStyle)
  - `uniform_block_height`: `float` — [Read-Write] (float)
  - `uniform_block_width`: `float` — [Read-Write] (float)
  - `vertical_alignment_override`: `type` — [Read-Write] (âundefinedâ)
  - `wrap_button_index`: `int` — [Read-Write] (int32)
  - `wrap_button_padding`: `Margin` — [Read-Write] (Margin)

### `unreal.WindowStyle`
Inherits: `SlateWidgetStyle` | Header: `SlateTypes.h`

Represents the appearance of an SWindow

**Properties** (19):
  - `active_title_brush`: `SlateBrush` — [Read-Write] Brush used to draw the window title area when the window is active (SlateBrush)
  - `background_brush`: `SlateBrush` — [Read-Write] Brush used to draw the window background (SlateBrush)
  - `background_color`: `SlateColor` — [Read-Write] Color used to draw the window background (SlateColor)
  - `border_brush`: `SlateBrush` — [Read-Write] Brush used to draw the window border (SlateBrush)
  - `border_color`: `SlateColor` — [Read-Write] Color used to draw the window border (SlateColor)
  - `border_padding`: `Margin` — [Read-Write] Window corner rounding.  If this value is <= 0 no rounding will occur.   Used for regul...
  - `child_background_brush`: `SlateBrush` — [Read-Write] Brush used to draw the background of child windows (SlateBrush)
  - `close_button_style`: `ButtonStyle` — [Read-Write] Style used to draw the window close button (ButtonStyle)
  - `enter_fullscreen_button_style`: `ButtonStyle` — [Read-Write] Style used to draw the enter fullscreen button (ButtonStyle)
  - `exit_fullscreen_button_style`: `ButtonStyle` — [Read-Write] Style used to draw the exit fullscreen button (ButtonStyle)
  - `flash_title_brush`: `SlateBrush` — [Read-Write] Brush used to draw the window title area when the window is flashing (SlateBrush)
  - `inactive_title_brush`: `SlateBrush` — [Read-Write] Brush used to draw the window title area when the window is inactive (SlateBrush)
  - `maximize_button_style`: `ButtonStyle` — [Read-Write] Style used to draw the window maximize button (ButtonStyle)
  - `minimize_button_style`: `ButtonStyle` — [Read-Write] Style used to draw the window minimize button (ButtonStyle)
  - `outline_brush`: `SlateBrush` — [Read-Write] Brush used to draw the window outline (SlateBrush)
  - `outline_color`: `SlateColor` — [Read-Write] Color used to draw the window outline (SlateColor)
  - `restore_button_style`: `ButtonStyle` — [Read-Write] Style used to draw the window restore button (ButtonStyle)
  - `title_text_style`: `TextBlockStyle` — [Read-Write] Style used to draw the window title text (TextBlockStyle)
  - `window_corner_radius`: `int` — [Read-Write] Window corner rounding.  If this value is <= 0 no rounding will occur.   Used for regul...

### `unreal.SlateWidgetStyleContainerBase`
Inherits: `Object` | Header: `SlateWidgetStyleContainerBase.h`

Just a wrapper for the struct with real data in it.

### `unreal.ButtonClickMethod`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Enumerates different methods that a button click can be triggered. Normally, DownAndUp is appropriate.

**Properties** (4):
  - `DOWN_AND_UP`: `ButtonClickMethod = Ellipsis` — User must press the button, then release while over the button to trigger the click.
This is the mos...
  - `MOUSE_DOWN`: `ButtonClickMethod = Ellipsis` — Click will be triggered immediately on mouse down, and mouse will not be captured. 1
  - `MOUSE_UP`: `ButtonClickMethod = Ellipsis` — Click will always be triggered when mouse button is released over the button,
even if the button was...
  - `PRECISE_CLICK`: `ButtonClickMethod = Ellipsis` — Inside a list, buttons can only be clicked with precise tap.
Moving the pointer will scroll the list...

### `unreal.ButtonPressMethod`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Enumerates different methods that a button can be triggered with keyboard/controller. Normally, DownAndUp is appropriate.

**Properties** (3):
  - `BUTTON_PRESS`: `ButtonPressMethod = Ellipsis` — Click will be triggered immediately on button press. 1
  - `BUTTON_RELEASE`: `ButtonPressMethod = Ellipsis` — Click will always be triggered when a button release occurs on the focused button,
even if the butto...
  - `DOWN_AND_UP`: `ButtonPressMethod = Ellipsis` — User must press the button, then release while the button has focus to trigger the click.
This is th...

### `unreal.ButtonTouchMethod`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Ways in which touch interactions trigger a âClickedâ event.

**Properties** (3):
  - `DOWN`: `ButtonTouchMethod = Ellipsis` — Click will be triggered immediately on touch down, and touch will not be captured. 1
  - `DOWN_AND_UP`: `ButtonTouchMethod = Ellipsis` — Most buttons behave this way. 0
  - `PRECISE_TAP`: `ButtonTouchMethod = Ellipsis` — Inside a list, buttons can only be clicked with precise tap.
Moving the pointer will scroll the list...

### `unreal.CheckBoxState`
Inherits: `EnumBase` | Header: `SlateTypes.h`

Current state of the check box

**Properties** (3):
  - `CHECKED`: `CheckBoxState = Ellipsis` — Checked 1
  - `UNCHECKED`: `CheckBoxState = Ellipsis` — Unchecked 0
  - `UNDETERMINED`: `CheckBoxState = Ellipsis` — Neither checked nor unchecked 2

### `unreal.ColorVisionDeficiency`
Inherits: `EnumBase` | Header: `RenderingCommon.h`

Enumerates color vision deficiency types.

**Properties** (4):
  - `DEUTERANOPE`: `ColorVisionDeficiency = Ellipsis` — 1
  - `NORMAL_VISION`: `ColorVisionDeficiency = Ellipsis` — 0
  - `PROTANOPE`: `ColorVisionDeficiency = Ellipsis` — 2
  - `TRITANOPE`: `ColorVisionDeficiency = Ellipsis` — 3

### `unreal.ConsumeMouseWheel`
Inherits: `EnumBase` | Header: `SlateTypes.h`

Used to determine how we should handle mouse wheel input events when someone scrolls.

**Properties** (3):
  - `ALWAYS`: `ConsumeMouseWheel = Ellipsis` — Always consume mouse wheel event even if we donât scroll at all. 1
  - `NEVER`: `ConsumeMouseWheel = Ellipsis` — Never consume the mouse wheel 2
  - `WHEN_SCROLLING_POSSIBLE`: `ConsumeMouseWheel = Ellipsis` — Only consume the mouse wheel event when we actually scroll some amount. 0

### `unreal.FlowDirectionPreference`
Inherits: `EnumBase` | Header: `FlowDirection.h`

EFlow Direction Preference

**Properties** (4):
  - `CULTURE`: `FlowDirectionPreference = Ellipsis` — Begins laying out widgets using the current cultures layout direction preference, flipping the direc...
  - `INHERIT`: `FlowDirectionPreference = Ellipsis` — Inherits the flow direction set by the parent widget. 0
  - `LEFT_TO_RIGHT`: `FlowDirectionPreference = Ellipsis` — Forces a Left to Right layout flow. 2
  - `RIGHT_TO_LEFT`: `FlowDirectionPreference = Ellipsis` — Forces a Right to Left layout flow. 3

### `unreal.FontHinting`
Inherits: `EnumBase` | Header: `CompositeFont.h`

EFont Hinting

**Properties** (5):
  - `AUTO`: `FontHinting = Ellipsis` — Force the use of an automatic hinting algorithm. 1
  - `AUTO_LIGHT`: `FontHinting = Ellipsis` — Force the use of an automatic light hinting algorithm, optimized for non-monochrome displays. 2
  - `DEFAULT`: `FontHinting = Ellipsis` — Use the default hinting specified in the font. 0
  - `MONOCHROME`: `FontHinting = Ellipsis` — Force the use of an automatic hinting algorithm optimized for monochrome displays. 3
  - `NONE`: `FontHinting = Ellipsis` — Do not use hinting. 4

### `unreal.FontLayoutMethod`
Inherits: `EnumBase` | Header: `CompositeFont.h`

EFont Layout Method

**Properties** (2):
  - `BOUNDING_BOX`: `FontLayoutMethod = Ellipsis` — Layout the font using the values from its bounding box. This typically yields a larger line height f...
  - `METRICS`: `FontLayoutMethod = Ellipsis` — Layout the font using the metrics data available in the font. This is typically the desired option, ...

### `unreal.FontLoadingPolicy`
Inherits: `EnumBase` | Header: `CompositeFont.h`

EFont Loading Policy

**Properties** (3):
  - `INLINE`: `FontLoadingPolicy = Ellipsis` — Embed the font data within the asset. This will consume more memory than Streaming, however it is gu...
  - `LAZY_LOAD`: `FontLoadingPolicy = Ellipsis` — Lazy load the entire font into memory. This will consume more memory than Streaming, however there w...
  - `STREAM`: `FontLoadingPolicy = Ellipsis` — Stream the font from disk. This will consume less memory than LazyLoad or Inline, however there will...

### `unreal.FontRasterizationMode`
Inherits: `EnumBase` | Header: `FontRasterizationMode.h`

Enumerates supported font rasterization modes.

**Properties** (4):
  - `BITMAP`: `FontRasterizationMode = Ellipsis` — Glyphs are rasterized directly into alpha mask bitmaps per size and skew. 0
  - `MSDF`: `FontRasterizationMode = Ellipsis` — Glyphs are rasterized into multi-channel signed distance fields, which are size and skew agnostic. 1
  - `SDF`: `FontRasterizationMode = Ellipsis` — Glyphs are rasterized into single-channel signed distance fields, which are size and skew agnostic. ...
  - `SDF_APPROXIMATION`: `FontRasterizationMode = Ellipsis` — Glyphs are rasterized into approximate distance fields, which are size and skew agnostic. More memor...

### `unreal.HorizontalAlignment`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Enumerates horizontal alignment options, i.e. for widget slots.

**Properties** (4):
  - `H_ALIGN_CENTER`: `HorizontalAlignment = Ellipsis` — Center-align. 2
  - `H_ALIGN_FILL`: `HorizontalAlignment = Ellipsis` — Fill the entire width. 0
  - `H_ALIGN_LEFT`: `HorizontalAlignment = Ellipsis` — Left-align. 1
  - `H_ALIGN_RIGHT`: `HorizontalAlignment = Ellipsis` — Right-align. 3

### `unreal.MenuPlacement`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Enumerates possible placements for pop-up menus.

**Properties** (13):
  - `MENU_PLACEMENT_ABOVE_ANCHOR`: `MenuPlacement = Ellipsis` — Place the menu immediately above the anchor, no transition effect 6
  - `MENU_PLACEMENT_ABOVE_RIGHT_ANCHOR`: `MenuPlacement = Ellipsis` — Place the menu immediately above the anchor aligned to the right of the content 8
  - `MENU_PLACEMENT_BELOW_ANCHOR`: `MenuPlacement = Ellipsis` — Place the menu immediately below the anchor 0
  - `MENU_PLACEMENT_BELOW_RIGHT_ANCHOR`: `MenuPlacement = Ellipsis` — Place the menu immediately below the anchor aligned to the right of the content 2
  - `MENU_PLACEMENT_CENTER`: `MenuPlacement = Ellipsis` — Place the menuâs center on top of the menu anchorâs center point 10
  - `MENU_PLACEMENT_CENTERED_ABOVE_ANCHOR`: `MenuPlacement = Ellipsis` — Place the menu immediately centered above the anchor, no transition effect 7
  - `MENU_PLACEMENT_CENTERED_BELOW_ANCHOR`: `MenuPlacement = Ellipsis` — Place the menu immediately centered below the anchor 1
  - `MENU_PLACEMENT_COMBO_BOX`: `MenuPlacement = Ellipsis` — Place the menu immediately below the anchor and match is width to the anchorâs content 3
  - `MENU_PLACEMENT_COMBO_BOX_RIGHT`: `MenuPlacement = Ellipsis` — Place the menu immediately below the anchor and match is width to the anchorâs content. If the wid...
  - `MENU_PLACEMENT_MATCH_BOTTOM_LEFT`: `MenuPlacement = Ellipsis` — Place the menuâs bottom left corner directly on top of the menu anchorâs bottom left corner 12
  - `MENU_PLACEMENT_MENU_LEFT`: `MenuPlacement = Ellipsis` — Place the menu to the left of the anchor 9
  - `MENU_PLACEMENT_MENU_RIGHT`: `MenuPlacement = Ellipsis` — Place the menu to the right of the anchor 5
  - `MENU_PLACEMENT_RIGHT_LEFT_CENTER`: `MenuPlacement = Ellipsis` — Place the menuâs vertical center on the left side at the menu anchorâs vertical center on the ri...

### `unreal.Orientation`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Enumerates widget orientations.

**Properties** (2):
  - `ORIENT_HORIZONTAL`: `Orientation = Ellipsis` — Orient horizontally, i.e. left to right. 0
  - `ORIENT_VERTICAL`: `Orientation = Ellipsis` — Orient vertically, i.e. top to bottom. 1

### `unreal.ScrollDirection`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Enumerates scroll directions.

**Properties** (2):
  - `SCROLL_DOWN`: `ScrollDirection = Ellipsis` — Scroll down. 0
  - `SCROLL_UP`: `ScrollDirection = Ellipsis` — Scroll up. 1

### `unreal.SelectInfo`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Additional information about a selection event

**Properties** (4):
  - `DIRECT`: `SelectInfo = Ellipsis` — Selection was directly set in code 3
  - `ON_KEY_PRESS`: `SelectInfo = Ellipsis` — User selected via a key press 0
  - `ON_MOUSE_CLICK`: `SelectInfo = Ellipsis` — User selected by clicking on the item 2
  - `ON_NAVIGATION`: `SelectInfo = Ellipsis` — User selected by navigating to the item 1

### `unreal.SlateBrushDrawType`
Inherits: `EnumBase` | Header: `SlateBrush.h`

Enumerates ways in which an image can be drawn.

**Properties** (5):
  - `BORDER`: `SlateBrushDrawType = Ellipsis` — Draw a 3x3 border where the sides tile and the middle is empty 2
  - `BOX`: `SlateBrushDrawType = Ellipsis` — Draw a 3x3 box, where the sides and the middle stretch based on the Margin 1
  - `IMAGE`: `SlateBrushDrawType = Ellipsis` — Draw an image; margin is ignored 3
  - `NO_DRAW_TYPE`: `SlateBrushDrawType = Ellipsis` — Donât do anything 0
  - `ROUNDED_BOX`: `SlateBrushDrawType = Ellipsis` — Draw a solid rectangle with an outline and corner radius 4

### `unreal.SlateBrushImageType`
Inherits: `EnumBase` | Header: `SlateBrush.h`

Enumerates brush image types.

**Properties** (4):
  - `FULL_COLOR`: `SlateBrushImageType = Ellipsis` — The image to be loaded is in full color. 1
  - `LINEAR`: `SlateBrushImageType = Ellipsis` — The image is a special texture in linear space (usually a rendering resource such as a lookup table)...
  - `NO_IMAGE`: `SlateBrushImageType = Ellipsis` — No image is loaded.  Color only brushes, transparent brushes etc. 0
  - `VECTOR`: `SlateBrushImageType = Ellipsis` — The image is vector graphics and will be rendered and cached in full color using size/scale requeste...

### `unreal.SlateBrushMirrorType`
Inherits: `EnumBase` | Header: `SlateBrush.h`

Possible options for mirroring the brush image

**Properties** (4):
  - `BOTH`: `SlateBrushMirrorType = Ellipsis` — Mirror in both directions. 3
  - `HORIZONTAL`: `SlateBrushMirrorType = Ellipsis` — Mirror the image horizontally. 1
  - `NO_MIRROR`: `SlateBrushMirrorType = Ellipsis` — Donât mirror anything, just draw the texture as it is. 0
  - `VERTICAL`: `SlateBrushMirrorType = Ellipsis` — Mirror the image vertically. 2

### `unreal.SlateBrushRoundingType`
Inherits: `EnumBase` | Header: `SlateBrush.h`

Enumerates rounding options

**Properties** (2):
  - `FIXED_RADIUS`: `SlateBrushRoundingType = Ellipsis` — Use the specified Radius * 0
  - `HALF_HEIGHT_RADIUS`: `SlateBrushRoundingType = Ellipsis` — The rounding radius should be half the height such that it always looks perfectly round * 1

### `unreal.SlateBrushTileType`
Inherits: `EnumBase` | Header: `SlateBrush.h`

Enumerates tiling options for image drawing.

**Properties** (4):
  - `BOTH`: `SlateBrushTileType = Ellipsis` — Tile in both directions 3
  - `HORIZONTAL`: `SlateBrushTileType = Ellipsis` — Tile the image horizontally 1
  - `NO_TILE`: `SlateBrushTileType = Ellipsis` — Just stretch 0
  - `VERTICAL`: `SlateBrushTileType = Ellipsis` — Tile the image vertically 2

### `unreal.SlateCheckBoxType`
Inherits: `EnumBase` | Header: `SlateTypes.h`

Type of check box

**Properties** (2):
  - `CHECK_BOX`: `SlateCheckBoxType = Ellipsis` — Traditional check box with check button and label (or other content) 0
  - `TOGGLE_BUTTON`: `SlateCheckBoxType = Ellipsis` — Toggle button.  You provide button content (such as an image), and the user can press to toggle it. ...

### `unreal.SlateColorStylingMode`
Inherits: `EnumBase` | Header: `SlateColor.h`

Enumerates types of color values that can be held by Slate color.

**Properties** (2):
  - `USE_COLOR_FOREGROUND`: `SlateColorStylingMode = Ellipsis` — Use the widgetâs foreground color. 2
  - `USE_COLOR_SPECIFIED`: `SlateColorStylingMode = Ellipsis` — Color value is stored in this Slate color. 0

### `unreal.SlateParentWindowSearchMethod`
Inherits: `EnumBase` | Header: `SlateTypes.h`

Used to determine which search method we should use when finding a suitable parent window

**Properties** (2):
  - `ACTIVE_WINDOW`: `SlateParentWindowSearchMethod = Ellipsis` — Favor using the active window (will fallback to the main window if the active window is unsuitable) ...
  - `MAIN_WINDOW`: `SlateParentWindowSearchMethod = Ellipsis` — Favor using the main window 1

### `unreal.SlatePostRT`
Inherits: `EnumBase` | Header: `SlateRendererTypes.h`

Bitfield used to mark if a slate post RT is used or not

**Properties** (8):
  - `ALL`: `SlatePostRT = Ellipsis` — 31
  - `E_SLATE_POST_RT_0`: `SlatePostRT = Ellipsis` — 1
  - `E_SLATE_POST_RT_1`: `SlatePostRT = Ellipsis` — 2
  - `E_SLATE_POST_RT_2`: `SlatePostRT = Ellipsis` — 4
  - `E_SLATE_POST_RT_3`: `SlatePostRT = Ellipsis` — 8
  - `E_SLATE_POST_RT_4`: `SlatePostRT = Ellipsis` — 16
  - `NONE`: `SlatePostRT = Ellipsis` — 0
  - `NUM`: `SlatePostRT = Ellipsis` — 5

### `unreal.TextCommit`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Additional information about a text committal

**Properties** (4):
  - `DEFAULT`: `TextCommit = Ellipsis` — Losing focus or similar event caused implicit commit 0
  - `ON_CLEARED`: `TextCommit = Ellipsis` — Keyboard focus was explicitly cleared via the escape key or other similar action 3
  - `ON_ENTER`: `TextCommit = Ellipsis` — User committed via the enter key 1
  - `ON_USER_MOVED_FOCUS`: `TextCommit = Ellipsis` — User committed via tabbing away or moving focus explicitly away 2

### `unreal.TextOverflowPolicy`
Inherits: `EnumBase` | Header: `SlateTypes.h`

The different methods that can be used to determine what happens to text when it is longer than its allowed length

**Properties** (4):
  - `CLIP`: `TextOverflowPolicy = Ellipsis` — Overflowing text will be clipped 0
  - `ELLIPSIS`: `TextOverflowPolicy = Ellipsis` — Overflowing text will be replaced with an ellipsis 1
  - `MIDDLE_ELLIPSIS`: `TextOverflowPolicy = Ellipsis` — Overflowing text will be replaced with an ellipsis starting from the centern
Current Limits:
- Multi...
  - `MULTILINE_ELLIPSIS`: `TextOverflowPolicy = Ellipsis` — Overflowing text will be replaced with an ellipsis. A partially clipped line on the vertical axis wi...

### `unreal.TextShapingMethod`
Inherits: `EnumBase` | Header: `FontCache.h`

Methods that can be used to shape text. note: If you change this enum, make sure and update CVarDefaultTextShapingMethod and GetDefaultTextShapingMethod.

**Properties** (3):
  - `AUTO`: `TextShapingMethod = Ellipsis` — Automatically picks the fastest possible shaping method (either KerningOnly or FullShaping) based on...
  - `FULL_SHAPING`: `TextShapingMethod = Ellipsis` — Provides full text shaping, allowing accurate rendering of complex right-to-left or bi-directional g...
  - `KERNING_ONLY`: `TextShapingMethod = Ellipsis` — Provides fake shaping using only kerning data.
This can be faster than full shaping, but wonât ren...

### `unreal.TextTransformPolicy`
Inherits: `EnumBase` | Header: `SlateTypes.h`

Text transformation policy that can be applied to the text before displaying it.

**Properties** (3):
  - `NONE`: `TextTransformPolicy = Ellipsis` — No transform, just use the given text as-is 0
  - `TO_LOWER`: `TextTransformPolicy = Ellipsis` — Convert the text to lowercase for display 1
  - `TO_UPPER`: `TextTransformPolicy = Ellipsis` — Convert the text to uppercase for display 2

### `unreal.UINavigation`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Navigation context for event

**Properties** (7):
  - `DOWN`: `UINavigation = Ellipsis` — 3
  - `INVALID`: `UINavigation = Ellipsis` — Denotes an invalid navigation, more important used to denote no specified navigation 7
  - `LEFT`: `UINavigation = Ellipsis` — Four cardinal directions 0
  - `NEXT`: `UINavigation = Ellipsis` — Conceptual next and previous 4
  - `PREVIOUS`: `UINavigation = Ellipsis` — 5
  - `RIGHT`: `UINavigation = Ellipsis` — 1
  - `UP`: `UINavigation = Ellipsis` — 2

### `unreal.UINavigationAction`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Generic UI navigation action that are usually bound to a gamepad or other input device

**Properties** (3):
  - `ACCEPT`: `UINavigationAction = Ellipsis` — Accept, normally acts like a mouse click. Corresponds to Virtual_Accept key 0
  - `BACK`: `UINavigationAction = Ellipsis` — Back/Cancel, normally acts like escape. Corresponds to Virtual_Back key 1
  - `INVALID`: `UINavigationAction = Ellipsis` — Invalid action 3

### `unreal.UINavigationRule`
Inherits: `EnumBase` | Header: `NavigationReply.h`

EUINavigation Rule

**Properties** (7):
  - `CUSTOM`: `UINavigationRule = Ellipsis` — Custom navigation handled by user code. 4
  - `CUSTOM_BOUNDARY`: `UINavigationRule = Ellipsis` — Custom navigation handled by user code if the boundary is hit. 5
  - `ESCAPE`: `UINavigationRule = Ellipsis` — Allow the movement to continue in that direction, seeking the next navigable widget automatically. 0
  - `EXPLICIT`: `UINavigationRule = Ellipsis` — Move to a specific widget. 1
  - `INVALID`: `UINavigationRule = Ellipsis` — Invalid Rule 6
  - `STOP`: `UINavigationRule = Ellipsis` — Stops movement in this direction 3
  - `WRAP`: `UINavigationRule = Ellipsis` — Wrap movement inside this container, causing the movement to cycle around from the opposite side,
if...

### `unreal.VerticalAlignment`
Inherits: `EnumBase` | Header: `SlateEnums.h`

Enumerates vertical alignment options, i.e. for widget slots.

**Properties** (4):
  - `V_ALIGN_BOTTOM`: `VerticalAlignment = Ellipsis` — Bottom-align. 3
  - `V_ALIGN_CENTER`: `VerticalAlignment = Ellipsis` — Center-align. 2
  - `V_ALIGN_FILL`: `VerticalAlignment = Ellipsis` — Fill the entire height. 0
  - `V_ALIGN_TOP`: `VerticalAlignment = Ellipsis` — Top-align. 1

### `unreal.WidgetClipping`
Inherits: `EnumBase` | Header: `Clipping.h`

This enum controls clipping of widgets in Slate. By default all SWidgets do not need to clip their children. Most of the time, you donât need to clip, the only times it becomes important is when som...

**Properties** (5):
  - `CLIP_TO_BOUNDS`: `WidgetClipping = Ellipsis` — This widget clips content the bounds of this widget.  It intersects those bounds with any previous c...
  - `CLIP_TO_BOUNDS_ALWAYS`: `WidgetClipping = Ellipsis` — This widget clips to its bounds.  It intersects those bounds with any previous clipping area. NOTE: ...
  - `CLIP_TO_BOUNDS_WITHOUT_INTERSECTING`: `WidgetClipping = Ellipsis` — This widget clips to its bounds.  It does NOT intersect with any existing clipping geometry, it push...
  - `INHERIT`: `WidgetClipping = Ellipsis` — This widget does not clip children, it and all children inherit the clipping area of the last widget...
  - `ON_DEMAND`: `WidgetClipping = Ellipsis` — This widget clips to its bounds when itâs Desired Size is larger than the allocated geometry
the w...

### `unreal.WidgetPixelSnapping`
Inherits: `EnumBase` | Header: `WidgetPixelSnapping.h`

The different states of pixel snapping a widget can be in.

**Properties** (3):
  - `DISABLED`: `WidgetPixelSnapping = Ellipsis` — Draws the widget without snapping. Useful during animations or moving indicators. 1
  - `INHERIT`: `WidgetPixelSnapping = Ellipsis` — Inherits the snapping method set by the parent widget. 0
  - `SNAP_TO_PIXEL`: `WidgetPixelSnapping = Ellipsis` — Draws the widget at the nearest pixel. Improves sharpness of widgets. 2
