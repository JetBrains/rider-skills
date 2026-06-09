# UE Python API — UMG Module

**212 types** from the `UMG` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnchorData`, `EventReply`, `GameViewportWidgetSlot`, `PaintContext`, `RadialBoxSettings`, `RichImageRow`, `RichTextStyleRow`, `ShapedTextOptions`, `SlateChildSize`, `SlatePostBufferUpdateInfo`, `WidgetAnimationHandle`, `WidgetChild`, `WidgetEventField`, `WidgetNavigationData`, `WidgetTransform`, `AsyncTaskDownloadImage`, `BackgroundBlur`, `BackgroundBlurSlot`, `Border`, `BorderSlot`, ... (212 total)

---

## Classes

### `unreal.AnchorData`
Inherits: `StructBase` | Header: `CanvasPanelSlot.h`

Anchor Data

**Properties** (3):
  - `alignment`: `Vector2D` — [Read-Write] Alignment is the pivot point of the widget.  Starting in the upper left at (0,0),
endin...
  - `anchors`: `Anchors` — [Read-Write] Anchors. (Anchors)
  - `offsets`: `Margin` — [Read-Write] Offset. (Margin)

### `unreal.EventReply`
Inherits: `StructBase` | Header: `SlateWrapperTypes.h`

Allows users to handle events and return information to the underlying UI layer.

### `unreal.GameViewportWidgetSlot`
Inherits: `StructBase` | Header: `GameViewportSubsystem.h`

The default value fills the entire screen / player region.

**Properties** (5):
  - `alignment`: `Vector2D` — [Read-Write] (Vector2D)
  - `anchors`: `Anchors` — [Read-Write] (Anchors)
  - `auto_remove_on_world_removed`: `bool` — [Read-Write] Remove the widget when the Widgetâs World is removed.
note: The Widget is added to th...
  - `offsets`: `Margin` — [Read-Write] (Margin)
  - `z_order`: `int` — [Read-Write] The higher the number, the more on top this widget will be. (int32)

### `unreal.PaintContext`
Inherits: `StructBase` | Header: `UserWidget.h`

The state passed into OnPaint that we can expose as a single painting structure to blueprints to allow script code to override OnPaint behavior.

### `unreal.RadialBoxSettings`
Inherits: `StructBase` | Header: `RadialBoxSettings.h`

Radial Box Settings

### `unreal.RichImageRow`
Inherits: `TableRowBase` | Header: `RichTextBlockImageDecorator.h`

Simple struct for rich text styles

### `unreal.RichTextStyleRow`
Inherits: `TableRowBase` | Header: `RichTextBlock.h`

Simple struct for rich text styles

### `unreal.ShapedTextOptions`
Inherits: `StructBase` | Header: `TextWidgetTypes.h`

Common data for all widgets that use shaped text. Contains the common options that should be exposed for the underlying Slate widget.

**Properties** (2):
  - `text_flow_direction`: `TextFlowDirection` [Read-Only] — [Read-Only] Which text flow direction should the text within this widget use? (unset to use the defa...
  - `text_shaping_method`: `TextShapingMethod` [Read-Only] — [Read-Only] Which text shaping method should the text within this widget use? (unset to use the defa...

### `unreal.SlateChildSize`
Inherits: `StructBase` | Header: `SlateWrapperTypes.h`

A struct exposing size param related properties to UMG.

**Properties** (2):
  - `size_rule`: `SlateSizeRule` — [Read-Write] The sizing rule of the content. (SlateSizeRule)
  - `value`: `float` — [Read-Write] The parameter of the size rule. (float)

### `unreal.SlatePostBufferUpdateInfo`
Inherits: `StructBase` | Header: `PostBufferUpdate.h`

Struct containing info needed to update a particular buffer

### `unreal.WidgetAnimationHandle`
Inherits: `StructBase` | Header: `WidgetAnimationHandle.h`

Handle to an ongoing or finished widget animation.

### `unreal.WidgetChild`
Inherits: `StructBase` | Header: `WidgetChild.h`

Represent a Widget present in the Tree Widget of the UserWidget

### `unreal.WidgetEventField`
Inherits: `StructBase` | Header: `WidgetEventField.h`

Generic structure to notify when an event occurs.

### `unreal.WidgetNavigationData`
Inherits: `StructBase` | Header: `WidgetNavigation.h`

Widget Navigation Data

**Properties** (2):
  - `rule`: `UINavigationRule` [Read-Only] — [Read-Only] (UINavigationRule)
  - `widget_to_focus`: `Name` [Read-Only] — [Read-Only] This either the widget to focus, OR the name of the function to call. (Name)

### `unreal.WidgetTransform`
Inherits: `StructBase` | Header: `WidgetTransform.h`

Describes the standard transformation of a widget

**Properties** (4):
  - `angle`: `float` — [Read-Write] The angle in degrees to rotate (float)
  - `scale`: `Vector2D` — [Read-Write] The scale to apply to the widget (Vector2D)
  - `shear`: `Vector2D` — [Read-Write] The amount to shear the widget in slate units (Vector2D)
  - `translation`: `Vector2D` — [Read-Write] The amount to translate the widget in slate units (Vector2D)

### `unreal.AsyncTaskDownloadImage`
Inherits: `BlueprintAsyncActionBase` | Header: `AsyncTaskDownloadImage.h`

Async Task Download Image

**Properties** (2):
  - `on_fail`: `DownloadImageDelegate` — [Read-Write] (DownloadImageDelegate)
  - `on_success`: `DownloadImageDelegate` — [Read-Write] (DownloadImageDelegate)

### `unreal.BackgroundBlur`
Inherits: `ContentWidget` | Header: `BackgroundBlur.h`

A background blur is a container widget that can contain one child widget, providing an opportunity to surround it with adjustable padding and apply a post-process Gaussian blur to all content beneath...

**Methods** (8):
  - `set_apply_alpha_to_blur(apply_alpha_to_blur)` -> `None` — Set Apply Alpha to Blur
  - `set_blur_radius(blur_radius)` -> `None` — Set Blur Radius
  - `set_blur_strength(strength)` -> `None` — Set Blur Strength
  - `set_corner_radius(corner_radius)` -> `None` — Set Corner Radius
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_low_quality_fallback_brush(brush)` -> `None` — Set Low Quality Fallback Brush
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (8):
  - `apply_alpha_to_blur`: `bool` — [Read-Write] True to modulate the strength of the blur based on the widget alpha. (bool)
  - `blur_radius`: `int` — [Read-Write] This is the number of pixels which will be weighted in each direction from any given pi...
  - `blur_strength`: `float` — [Read-Write] How blurry the background is.  Larger numbers mean more blurry but will result in large...
  - `corner_radius`: `Vector4` — [Read-Write] Radius in Slate Units applied to the blur widget at each corner. X = Top Left, Y = Top ...
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the content horizontally. (HorizontalAlignment)
  - `low_quality_fallback_brush`: `SlateBrush` — [Read-Write] An image to draw instead of applying a blur when low quality override mode is enabled.
...
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the content vertically. (VerticalAlignment)

### `unreal.BackgroundBlurSlot`
Inherits: `PanelSlot` | Header: `BackgroundBlurSlot.h`

The Slot for the UBackgroundBlurSlot, contains the widget displayed in a BackgroundBlurâs single slot

**Methods** (3):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (3):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.Border`
Inherits: `ContentWidget` | Header: `Border.h`

A border is a container widget that can contain one child widget, providing an opportunity to surround it with a background image and adjustable padding.

**Methods** (12):
  - `get_dynamic_material()` -> `MaterialInstanceDynamic` — Get Dynamic Material
  - `set_brush(brush)` -> `None` — Set Brush
  - `set_brush_color(brush_color)` -> `None` — Set Brush Color
  - `set_brush_from_asset(asset)` -> `None` — Set Brush from Asset
  - `set_brush_from_material(material)` -> `None` — Set Brush from Material
  - `set_brush_from_texture(texture)` -> `None` — Set Brush from Texture
  - `set_content_color_and_opacity(content_color_and_opacity)` -> `None` — Set Content Color and Opacity
  - `set_desired_size_scale(scale)` -> `None` — Sets the DesiredSizeScale of this border.
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_show_effect_when_disabled(show_effect_when_disabled)` -> `None` — Set Show Effect when Disabled
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (8):
  - `background`: `SlateBrush` [Read-Only] — [Read-Only] Brush to drag as the background (SlateBrush)
  - `brush_color`: `LinearColor` — [Read-Write] Color and opacity of the actual border image (LinearColor)
  - `content_color_and_opacity`: `LinearColor` — [Read-Write] Color and opacity multiplier of content in the border (LinearColor)
  - `desired_size_scale`: `Vector2D` — [Read-Write] Scales the computed desired size of this border and its contents. Useful
for making thi...
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the content horizontally. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `show_effect_when_disabled`: `bool` — [Read-Write] Whether or not to show the disabled effect when this border is disabled (bool)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the content vertically. (VerticalAlignment)

### `unreal.BorderSlot`
Inherits: `PanelSlot` | Header: `BorderSlot.h`

The Slot for the UBorderSlot, contains the widget displayed in a borderâs single slot

**Methods** (3):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (3):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.Button`
Inherits: `ContentWidget` | Header: `Button.h`

The button is a click-able primitive widget to enable basic interaction, you can place any other widget inside a button to make a more complex and interesting click-able element in your UI.

**Methods** (7):
  - `is_pressed()` -> `bool` — Returns true if the user is actively pressing the button. Do not use this for detecting âClicksâ, use the OnClicked ...
  - `set_background_color(background_color)` -> `None` — Sets the color multiplier for the button background
  - `set_click_method(click_method)` -> `None` — Set Click Method
  - `set_color_and_opacity(color_and_opacity)` -> `None` — Sets the color multiplier for the button content
  - `set_press_method(press_method)` -> `None` — Set Press Method
  - `set_style(style)` -> `None` — Sets the color multiplier for the button background
  - `set_touch_method(touch_method)` -> `None` — Set Touch Method

**Properties** (12):
  - `background_color`: `LinearColor` — [Read-Write] The color multiplier for the button background (LinearColor)
  - `click_method`: `ButtonClickMethod` — [Read-Write] The type of mouse action required by the user to trigger the buttons âClickâ (Butto...
  - `color_and_opacity`: `LinearColor` — [Read-Write] The color multiplier for the button content (LinearColor)
  - `is_focusable`: `bool` [Read-Only] — [Read-Only] Sometimes a button should only be mouse-clickable and never keyboard focusable. (bool)
  - `on_clicked`: `OnButtonClickedEvent` — [Read-Write] Called when the button is clicked (OnButtonClickedEvent)
  - `on_hovered`: `OnButtonHoverEvent` — [Read-Write] (OnButtonHoverEvent)
  - `on_pressed`: `OnButtonPressedEvent` — [Read-Write] Called when the button is pressed (OnButtonPressedEvent)
  - `on_released`: `OnButtonReleasedEvent` — [Read-Write] Called when the button is released (OnButtonReleasedEvent)
  - `on_unhovered`: `OnButtonHoverEvent` — [Read-Write] (OnButtonHoverEvent)
  - `press_method`: `ButtonPressMethod` — [Read-Write] The type of keyboard/gamepad button press action required by the user to trigger the bu...
  - `touch_method`: `ButtonTouchMethod` — [Read-Write] The type of touch action required by the user to trigger the buttons âClickâ (Butto...
  - `widget_style`: `ButtonStyle` — [Read-Write] The button style used at runtime (ButtonStyle)

### `unreal.ButtonSlot`
Inherits: `PanelSlot` | Header: `ButtonSlot.h`

The Slot for the UButtonSlot, contains the widget displayed in a buttonâs single slot

**Methods** (3):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (3):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.CanvasPanel`
Inherits: `PanelWidget` | Header: `CanvasPanel.h`

The canvas panel is a designer friendly panel that allows widgets to be laid out at arbitrary locations, anchored and z-ordered with other children of the canvas. The canvas is a great widget for manu...

**Methods** (1):
  - `add_child_to_canvas(content)` -> `CanvasPanelSlot` — Add Child to Canvas

### `unreal.CanvasPanelSlot`
Inherits: `PanelSlot` | Header: `CanvasPanelSlot.h`

Canvas Panel Slot

**Methods** (16):
  - `get_alignment()` -> `Vector2D` — Gets the alignment on the slot
  - `get_anchors()` -> `Anchors` — Gets the anchors on the slot
  - `get_auto_size()` -> `bool` — Gets if the slot to be auto-sized
  - `get_layout()` -> `AnchorData` — Gets the layout data of the slot
  - `get_offsets()` -> `Margin` — Gets the offset data of the slot, which could be position and size, or margins depending on the anchor points
  - `get_position()` -> `Vector2D` — Gets the position of the slot
  - `get_size()` -> `Vector2D` — Gets the size of the slot
  - `get_z_order()` -> `int32` — Gets the z-order on the slot
  - `set_alignment(alignment)` -> `None` — Sets the alignment on the slot
  - `set_anchors(anchors)` -> `None` — Sets the anchors on the slot
  - `set_auto_size(inb_auto_size)` -> `None` — Sets if the slot to be auto-sized
  - `set_layout(layout_data)` -> `None` — Sets the layout data of the slot
  - `set_offsets(offset)` -> `None` — Sets the offset data of the slot, which could be position and size, or margins depending on the anchor points
  - `set_position(position)` -> `None` — Sets the position of the slot
  - `set_size(size)` -> `None` — Sets the size of the slot
  - `set_z_order(z_order)` -> `None` — Sets the z-order on the slot

**Properties** (3):
  - `auto_size`: `bool` — [Read-Write] When AutoSize is true we use the widgetâs desired size (bool)
  - `layout_data`: `AnchorData` — [Read-Write] The anchoring information for the slot (AnchorData)
  - `z_order`: `int` — [Read-Write] The order priority this widget is rendered in.  Higher values are rendered last (and so...

### `unreal.CheckBox`
Inherits: `ContentWidget` | Header: `CheckBox.h`

The checkbox widget allows you to display a toggled state of âuncheckedâ, âcheckedâ and âindeterminable. You can use the checkbox for a classic checkbox, or as a toggle button, or as radio b...

**Methods** (8):
  - `get_checked_state()` -> `CheckBoxState` — Returns the full current checked state.
  - `is_checked()` -> `bool` — Returns true if the checkbox is currently checked
  - `is_pressed()` -> `bool` — Returns true if this button is currently pressed
  - `set_checked_state(checked_state)` -> `None` — Sets the checked state.
  - `set_click_method(click_method)` -> `None` — Sets the click method.
  - `set_is_checked(is_checked)` -> `None` — Sets the checked state.
  - `set_press_method(press_method)` -> `None` — Sets the press method.
  - `set_touch_method(touch_method)` -> `None` — Sets the touch method.

**Properties** (8):
  - `checked_state`: `CheckBoxState` — [Read-Write] Whether the check box is currently in a checked state (CheckBoxState)
  - `click_method`: `ButtonClickMethod` — [Read-Write] The type of mouse action required by the user to trigger the buttons âClickâ (Butto...
  - `horizontal_alignment`: `HorizontalAlignment` [Read-Only] — [Read-Only] How the content of the toggle button should align within the given space (HorizontalAlig...
  - `is_focusable`: `bool` [Read-Only] — [Read-Only] Sometimes a button should only be mouse-clickable and never keyboard focusable. (bool)
  - `on_check_state_changed`: `OnCheckBoxComponentStateChanged` — [Read-Write] Called when the checked state has changed (OnCheckBoxComponentStateChanged)
  - `press_method`: `ButtonPressMethod` — [Read-Write] The type of keyboard/gamepad button press action required by the user to trigger the bu...
  - `touch_method`: `ButtonTouchMethod` — [Read-Write] The type of touch action required by the user to trigger the buttons âClickâ (Butto...
  - `widget_style`: `CheckBoxStyle` — [Read-Write] The checkbox bar style (CheckBoxStyle)

### `unreal.CircularThrobber`
Inherits: `Widget` | Header: `CircularThrobber.h`

A throbber widget that orients images in a spinning circle.

**Methods** (3):
  - `set_number_of_pieces(number_of_pieces)` -> `None` — Sets how many pieces there are.
  - `set_period(period)` -> `None` — Sets the amount of time for a full circle (in seconds).
  - `set_radius(radius)` -> `None` — Sets the radius of the circle.

**Properties** (4):
  - `image`: `SlateBrush` — [Read-Write] The throbber image. (SlateBrush)
  - `number_of_pieces`: `int` — [Read-Write] How many pieces there are (int32)
  - `period`: `float` — [Read-Write] The amount of time for a full circle (in seconds) (float)
  - `radius`: `float` — [Read-Write] The radius of the circle. If the throbber is a child of Canvas Panel, the âSize to Co...

### `unreal.ComboBox`
Inherits: `Widget` | Header: `ComboBox.h`

The combobox allows you to display a list of options to the user in a dropdown menu for them to select one.

**Properties** (3):
  - `is_focusable`: `bool` [Read-Only] — [Read-Only] (bool)
  - `items`: `None` — [Read-Write] The list of items to be displayed on the combobox. (Array[Object])
  - `scroll_bar_style`: `ScrollBarStyle` — [Read-Write] (ScrollBarStyle)

### `unreal.ComboBoxKey`
Inherits: `Widget` | Header: `ComboBoxKey.h`

The combobox allows you to display a list of options to the user in a dropdown menu for them to select one. Use OnGenerateConentWidgetEvent to return a custom built widget.

**Methods** (7):
  - `add_option(option)` -> `None` — Add an element to the option list.
  - `clear_options()` -> `None` — Remove all the elements of the option list.
  - `clear_selection()` -> `None` — Clear the current selection.
  - `get_selected_option()` -> `Name` — Get the current selected option
  - `is_open()` -> `bool` — Is the combobox menu opened.
  - `remove_option(option)` -> `bool` — Remove an element to the option list.
  - `set_selected_option(option)` -> `None` — Set the current selected option.

**Properties** (11):
  - `content_padding`: `Margin` — [Read-Write] (Margin)
  - `enable_gamepad_navigation_mode`: `bool` — [Read-Write] When false, directional keys will change the selection. When true, ComboBox
must be act...
  - `foreground_color`: `SlateColor` [Read-Only] — [Read-Only] The foreground color to pass through the hierarchy. (SlateColor)
  - `has_down_arrow`: `bool` — [Read-Write] When false, the down arrow is not generated and it is up to the API consumer
to make th...
  - `is_focusable`: `bool` [Read-Only] — [Read-Only] When true, allows the combo box to receive keyboard focus (bool)
  - `item_style`: `TableRowStyle` — [Read-Write] The item row style. (TableRowStyle)
  - `max_list_height`: `float` — [Read-Write] The max height of the combobox list that opens (float)
  - `on_opening`: `OnOpeningEvent` — [Read-Write] Called when the combobox is opening (OnOpeningEvent)
  - `on_selection_changed`: `OnSelectionChangedEvent` — [Read-Write] Called when a new item is selected in the combobox. (OnSelectionChangedEvent)
  - `scroll_bar_style`: `ScrollBarStyle` [Read-Only] — [Read-Only] The scroll bar style. (ScrollBarStyle)
  - `widget_style`: `ComboBoxStyle` — [Read-Write] The combobox style. (ComboBoxStyle)

### `unreal.ComboBoxString`
Inherits: `Widget` | Header: `ComboBoxString.h`

The combobox allows you to display a list of options to the user in a dropdown menu for them to select one.

**Methods** (13):
  - `add_option(option)` -> `None` — Add Option
  - `clear_options()` -> `None` — Clear Options
  - `clear_selection()` -> `None` — Clear Selection
  - `find_option_index(option)` -> `int32` — Find Option Index
  - `get_option_at_index(index)` -> `str` — Get Option at Index
  - `get_option_count()` -> `int32` — Returns the number of options
  - `get_selected_index()` -> `int32` — Get Selected Index
  - `get_selected_option()` -> `str` — Get Selected Option
  - `is_open()` -> `bool` — Is Open
  - `refresh_options()` -> `None` — Refreshes the list of options. If you added new ones, and want to update the list even if itâs currently being display...
  - `remove_option(option)` -> `bool` — Remove Option
  - `set_selected_index(index)` -> `None` — Set Selected Index
  - `set_selected_option(option)` -> `None` — Set Selected Option

**Properties** (12):
  - `content_padding`: `Margin` — [Read-Write] (Margin)
  - `enable_gamepad_navigation_mode`: `bool` — [Read-Write] When false, directional keys will change the selection. When true, ComboBox
must be act...
  - `font`: `SlateFontInfo` [Read-Only] — [Read-Only] The default font to use in the combobox, only applies if youâre not implementing OnGen...
  - `foreground_color`: `SlateColor` [Read-Only] — [Read-Only] The foreground color to pass through the hierarchy. (SlateColor)
  - `has_down_arrow`: `bool` — [Read-Write] When false, the down arrow is not generated and it is up to the API consumer
to make th...
  - `is_focusable`: `bool` [Read-Only] — [Read-Only] (bool)
  - `item_style`: `TableRowStyle` — [Read-Write] The item row style. (TableRowStyle)
  - `max_list_height`: `float` — [Read-Write] The max height of the combobox list that opens (float)
  - `on_opening`: `OnOpeningEvent` — [Read-Write] Called when the combobox is opening (OnOpeningEvent)
  - `on_selection_changed`: `OnSelectionChangedEvent` — [Read-Write] Called when a new item is selected in the combobox. (OnSelectionChangedEvent)
  - `scroll_bar_style`: `ScrollBarStyle` [Read-Only] — [Read-Only] The scroll bar style. (ScrollBarStyle)
  - `widget_style`: `ComboBoxStyle` — [Read-Write] The style. (ComboBoxStyle)

### `unreal.ContentWidget`
Inherits: `PanelWidget` | Header: `ContentWidget.h`

Content Widget

**Methods** (3):
  - `get_content()` -> `Widget` — Get Content
  - `get_content_slot()` -> `PanelSlot` — Get Content Slot
  - `set_content(content)` -> `PanelSlot` — Set Content

### `unreal.DragDropOperation`
Inherits: `Object` | Header: `DragDropOperation.h`

This class is the base drag drop operation for UMG, extend it to add additional data and add new functionality.

**Methods** (3):
  - `drag_cancelled(pointer_event)` -> `None` — Drag Cancelled
  - `dragged(pointer_event)` -> `None` — Dragged
  - `drop(pointer_event)` -> `None` — Drop

**Properties** (8):
  - `default_drag_visual`: `Widget` [Read-Only] — [Read-Only] The Drag Visual is the widget to display when dragging the item.  Normally people create...
  - `offset`: `Vector2D` — [Read-Write] A percentage offset (-1..+1) from the Pivot location, the percentage is of the desired ...
  - `on_drag_cancelled`: `OnDragDropMulticast` — [Read-Write] (OnDragDropMulticast)
  - `on_dragged`: `OnDragDropMulticast` — [Read-Write] (OnDragDropMulticast)
  - `on_drop`: `OnDragDropMulticast` — [Read-Write] (OnDragDropMulticast)
  - `payload`: `Object` — [Read-Write] The payload of the drag operation.  This can be any UObject that you want to pass along...
  - `pivot`: `DragPivot` — [Read-Write] Controls where the drag widget visual will appear when dragged relative to the pointer ...
  - `tag`: `str` — [Read-Write] A simple string tag you can optionally use to provide extra metadata about the operatio...

### `unreal.DynamicEntryBox`
Inherits: `DynamicEntryBoxBase` | Header: `DynamicEntryBox.h`

A special box panel that auto-generates its entries at both design-time and runtime. Useful for cases where you can have a varying number of entries, but it isnât worth the effort or conceptual over...

**Methods** (4):
  - `bp_create_entry()` -> `UserWidget` — Creates and establishes a new dynamic entry in the box
  - `bp_create_entry_of_class(entry_class)` -> `UserWidget` — Creates and establishes a new dynamic entry in the box using the specified class instead of the default.
  - `remove_entry(entry_widget)` -> `None` — Remove Entry
  - `reset(delete_widgets = False)` -> `None` — Clear out the box entries, optionally deleting the underlying Slate widgets entirely as well.

**Properties** (1):
  - `entry_widget_class`: `Class` [Read-Only] — [Read-Only] The class of widget to create entries of.
If natively binding this widget, use the Entry...

### `unreal.DynamicEntryBoxBase`
Inherits: `Widget` | Header: `DynamicEntryBoxBase.h`

Base for widgets that support a dynamic number of auto-generated entries at both design- and run-time. Contains all functionality needed to create, construct, and cache an arbitrary number of entry wi...

**Methods** (4):
  - `get_all_entries()` -> `Array [ UserWidget ]` — Get All Entries
  - `get_num_entries()` -> `int32` — Get Num Entries
  - `set_entry_spacing(entry_spacing)` -> `None` — Set Entry Spacing
  - `set_radial_settings(settings)` -> `None` — Set Radial Settings

**Properties** (8):
  - `entry_box_type`: `DynamicBoxType` [Read-Only] — [Read-Only] The type of box panel into which created entries are added. Some differences in function...
  - `entry_horizontal_alignment`: `HorizontalAlignment` [Read-Only] — [Read-Only] Horizontal alignment of generated entries. Horizontal/Vertical/Wrap boxes only. (Horizon...
  - `entry_size_rule`: `SlateChildSize` [Read-Only] — [Read-Only] Sizing rule to apply to generated entries. Horizontal/Vertical boxes only. (SlateChildSi...
  - `entry_spacing`: `Vector2D` — [Read-Write] The padding to apply between entries in the box.
Note horizontal boxes only use the X a...
  - `entry_vertical_alignment`: `VerticalAlignment` [Read-Only] — [Read-Only] Vertical alignment of generated entries. Horizontal/Vertical/Wrap boxes only. (VerticalA...
  - `max_element_size`: `int` [Read-Only] — [Read-Only] The maximum size of each entry in the dominant axis of the box. Vertical/Horizontal boxe...
  - `radial_box_settings`: `RadialBoxSettings` — [Read-Write] Settings only relevant to RadialBox (RadialBoxSettings)
  - `spacing_pattern`: `None` [Read-Only] — [Read-Only] The looping sequence of entry paddings to apply as entries are created. Overlay boxes on...

### `unreal.EditableText`
Inherits: `Widget` | Header: `EditableText.h`

Editable text box widget

**Methods** (12):
  - `get_font()` -> `SlateFontInfo` — Get Font
  - `get_hint_text()` -> `Text` — Gets the Hint text that appears when there is no text in the text box
  - `get_justification()` -> `TextJustify` — Get Justification
  - `get_text()` -> `Text` — Gets the widget text
  - `set_font(font_info)` -> `None` — Set Font
  - `set_font_material(material)` -> `None` — Set Font Material
  - `set_font_outline_material(material)` -> `None` — Set Font Outline Material
  - `set_hint_text(hint_text)` -> `None` — Set Hint Text
  - `set_is_password(inb_is_password)` -> `None` — Set Is Password
  - `set_is_read_only(inb_is_ready_only)` -> `None` — Set Is Read Only
  - `set_minimum_desired_width(min_desired_width)` -> `None` — Set the minimum desired width for this text box
  - `set_text(text)` -> `None` — Directly sets the widget text. Warning: This will wipe any binding created for the Text property!

**Properties** (17):
  - `clear_keyboard_focus_on_commit`: `bool` — [Read-Write] Whether to clear keyboard focus when pressing enter to commit changes (bool)
  - `enable_integrated_keyboard`: `bool` — [Read-Write] Whether the integrated keyboard is enabled for this editable text. (bool)
  - `hint_text`: `Text` — [Read-Write] Hint text that appears when there is no text in the text box (Text)
  - `is_caret_moved_when_gain_focus`: `bool` — [Read-Write] When set to true the caret is moved when gaining focus (bool)
  - `is_password`: `bool` — [Read-Write] Sets whether this text box is for storing a password (bool)
  - `is_read_only`: `bool` — [Read-Write] Sets whether this text box can actually be modified interactively by the user (bool)
  - `justification`: `TextJustify` — [Read-Write] How the text should be aligned with the margin. (TextJustify)
  - `minimum_desired_width`: `float` — [Read-Write] The minimum desired Width for the text (float)
  - `on_text_changed`: `OnEditableTextChangedEvent` — [Read-Write] Called whenever the text is changed programmatically or interactively by the user (OnEd...
  - `on_text_committed`: `OnEditableTextCommittedEvent` — [Read-Write] Called whenever the text is committed.  This happens when the user presses enter or the...
  - `overflow_policy`: `TextOverflowPolicy` — [Read-Write] Sets what happens to text that is clipped and doesnât fit within the clip rect for th...
  - `revert_text_on_escape`: `bool` — [Read-Write] Whether to allow the user to back out of changes when they press the escape key (bool)
  - `select_all_text_on_commit`: `bool` — [Read-Write] Whether to select all text when pressing enter to commit changes (bool)
  - `select_all_text_when_focused`: `bool` — [Read-Write] Whether to select all text when the user clicks to give focus on the widget (bool)
  - `shaped_text_options`: `ShapedTextOptions` [Read-Only] — [Read-Only] Controls how the text within this widget should be shaped. (ShapedTextOptions)
  - `text`: `Text` — [Read-Write] The text content for this editable text box widget (Text)
  - `widget_style`: `EditableTextStyle` — [Read-Write] The style (EditableTextStyle)

### `unreal.EditableTextBox`
Inherits: `Widget` | Header: `EditableTextBox.h`

Allows the user to type in custom text. Only permits a single line of text to be entered.

**Methods** (9):
  - `clear_error()` -> `None` — Clear Error
  - `get_text()` -> `Text` — Gets the widget text
  - `has_error()` -> `bool` — Has Error
  - `set_error(error)` -> `None` — Set Error
  - `set_foreground_color(color)` -> `None` — Set Foreground Color
  - `set_hint_text(text)` -> `None` — Sets the Hint text that appears when there is no text in the text box
  - `set_is_password(is_password)` -> `None` — Set Is Password
  - `set_is_read_only(read_only)` -> `None` — Sets the Text as Readonly to prevent it from being modified interactively by the user
  - `set_text(text)` -> `None` — Directly sets the widget text. Warning: This will wipe any binding created for the Text property!

**Properties** (16):
  - `clear_keyboard_focus_on_commit`: `bool` — [Read-Write] Whether to clear keyboard focus when pressing enter to commit changes (bool)
  - `hint_text`: `Text` — [Read-Write] Hint text that appears when there is no text in the text box (Text)
  - `is_caret_moved_when_gain_focus`: `bool` — [Read-Write] Workaround as we lose focus when the auto completion closes. (bool)
  - `is_password`: `bool` — [Read-Write] Sets whether this text box is for storing a password (bool)
  - `is_read_only`: `bool` — [Read-Write] Sets the Text Box as Readonly to prevent it from being modified interactively by the us...
  - `justification`: `TextJustify` — [Read-Write] How the text should be aligned with the margin. (TextJustify)
  - `minimum_desired_width`: `float` — [Read-Write] The minimum desired size for the text (float)
  - `on_text_changed`: `OnEditableTextBoxChangedEvent` — [Read-Write] Called whenever the text is changed programmatically or interactively by the user (OnEd...
  - `on_text_committed`: `OnEditableTextBoxCommittedEvent` — [Read-Write] Called whenever the text is committed.  This happens when the user presses enter or the...
  - `overflow_policy`: `TextOverflowPolicy` — [Read-Write] Sets what happens to text that is clipped and doesnât fit within the clip rect for th...
  - `revert_text_on_escape`: `bool` — [Read-Write] Whether to allow the user to back out of changes when they press the escape key (bool)
  - `select_all_text_on_commit`: `bool` — [Read-Write] Whether to select all text when pressing enter to commit changes (bool)
  - `select_all_text_when_focused`: `bool` — [Read-Write] Whether to select all text when the user clicks to give focus on the widget (bool)
  - `shaped_text_options`: `ShapedTextOptions` [Read-Only] — [Read-Only] Controls how the text within this widget should be shaped. (ShapedTextOptions)
  - `text`: `Text` — [Read-Write] The text content for this editable text box widget (Text)
  - `widget_style`: `EditableTextBoxStyle` — [Read-Write] The style (EditableTextBoxStyle)

### `unreal.ExpandableArea`
Inherits: `Widget` | Header: `ExpandableArea.h`

Expandable Area

**Methods** (3):
  - `get_is_expanded()` -> `bool` — Get Is Expanded
  - `set_is_expanded(is_expanded)` -> `None` — Set Is Expanded
  - `set_is_expanded_animated(is_expanded)` -> `None` — Set Is Expanded Animated

**Properties** (7):
  - `area_padding`: `Margin` — [Read-Write] (Margin)
  - `border_brush`: `SlateBrush` — [Read-Write] (SlateBrush)
  - `border_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `header_padding`: `Margin` — [Read-Write] (Margin)
  - `is_expanded`: `bool` — [Read-Write] (bool)
  - `max_height`: `float` — [Read-Write] The maximum height of the area (float)
  - `on_expansion_changed`: `OnExpandableAreaExpansionChanged` — [Read-Write] A bindable delegate for the IsChecked. (OnExpandableAreaExpansionChanged)

### `unreal.GameViewportSubsystem`
Inherits: `EngineSubsystem` | Header: `GameViewportSubsystem.h`

Game Viewport Subsystem

**Methods** (8):
  - `add_widget(widget, slot)` -> `bool` — Adds it to the gameâs viewport.
  - `add_widget_for_player(widget, player, slot)` -> `bool` — Adds the widget to the gameâs viewport in the section dedicated to the player. This is valuable in a split screen game...
  - `get_widget_slot(widget)` -> `GameViewportWidgetSlot` — The slot info from previously added widget or info that is store for later.
  - `is_widget_added(widget)` -> `bool`
  - `remove_widget(widget)` -> `None` — Removes the widget from the viewport.
  - `set_widget_slot(widget, slot)` -> `None` — Update the slot info of a previously added widget or Store the slot info for later use.
  - `set_widget_slot_desired_size(slot, size)` -> `GameViewportWidgetSlot` [classmethod] — Helper function to set the desired size in the viewport for the Slot.
  - `set_widget_slot_position(slot, widget, position, remove_dpi_scale)` -> `GameViewportWidgetSlot` [classmethod] — Helper function to set the position in the viewport for the Slot.

### `unreal.GridPanel`
Inherits: `PanelWidget` | Header: `GridPanel.h`

A table-like panel that retains the width of every column throughout the table.

**Methods** (3):
  - `add_child_to_grid(content, row = 0, column = 0)` -> `GridSlot` — Add Child to Grid
  - `set_column_fill(column_index, coefficient)` -> `None` — Set Column Fill
  - `set_row_fill(row_index, coefficient)` -> `None` — Set Row Fill

**Properties** (2):
  - `column_fill`: `None` [Read-Only] — [Read-Only] The column fill rules (Array[float])
  - `row_fill`: `None` [Read-Only] — [Read-Only] The row fill rules (Array[float])

### `unreal.GridSlot`
Inherits: `PanelSlot` | Header: `GridSlot.h`

A slot for UGridPanel, these slots all share the same size as the largest slot in the grid.

**Methods** (9):
  - `set_column(column)` -> `None` — Sets the column index of the slot, this determines what cell the slot is in the panel
  - `set_column_span(column_span)` -> `None` — How many columns this slot spans over
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_layer(layer)` -> `None` — Sets positive values offset this cell to be hit-tested and drawn on top of others.
  - `set_nudge(nudge)` -> `None` — Sets the offset for this slotâs content by some amount; positive values offset to lower right
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_row(row)` -> `None` — Sets the row index of the slot, this determines what cell the slot is in the panel
  - `set_row_span(row_span)` -> `None` — How many rows this this slot spans over
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (9):
  - `column`: `int` — [Read-Write] The column index of the cell this slot is in (int32)
  - `column_span`: `int` — [Read-Write] (int32)
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `layer`: `int` — [Read-Write] Positive values offset this cell to be hit-tested and drawn on top of others. Default i...
  - `nudge`: `Vector2D` — [Read-Write] Offset this slotâs content by some amount; positive values offset to lower right (Vec...
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `row`: `int` — [Read-Write] The row index of the cell this slot is in (int32)
  - `row_span`: `int` — [Read-Write] (int32)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.HorizontalBox`
Inherits: `PanelWidget` | Header: `HorizontalBox.h`

Allows widgets to be laid out in a flow horizontally.

**Methods** (1):
  - `add_child_to_horizontal_box(content)` -> `HorizontalBoxSlot` — Add Child to Horizontal Box

### `unreal.HorizontalBoxSlot`
Inherits: `PanelSlot` | Header: `HorizontalBoxSlot.h`

Horizontal Box Slot

**Methods** (4):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_size(size)` -> `None` — Set Size
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (4):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The amount of padding between the slots parent and the content. (Margin)
  - `size`: `SlateChildSize` — [Read-Write] How much space this slot should occupy in the direction of the panel. (SlateChildSize)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] (VerticalAlignment)

### `unreal.Image`
Inherits: `Widget` | Header: `Image.h`

The image widget allows you to display a Slate Brush, or texture or material in the UI.

**Methods** (15):
  - `get_dynamic_material()` -> `MaterialInstanceDynamic` — Get Dynamic Material
  - `set_brush(brush)` -> `None` — Set Brush
  - `set_brush_from_asset(asset)` -> `None` — Set Brush from Asset
  - `set_brush_from_atlas_interface(atlas_region, match_size = False)` -> `None` — Sets the Brush to the specified Atlas Region.
  - `set_brush_from_material(material)` -> `None` — Set Brush from Material
  - `set_brush_from_soft_material(soft_material)` -> `None` — Set Brush from Soft Material
  - `set_brush_from_soft_texture(soft_texture, match_size = False)` -> `None` — Sets the Brush to the specified Soft Texture.
  - `set_brush_from_texture(texture, match_size = False)` -> `None` — Sets the Brush to the specified Texture.
  - `set_brush_from_texture_dynamic(texture, match_size = False)` -> `None` — Sets the Brush to the specified Dynamic Texture.
  - `set_brush_resource_object(resource_object)` -> `None` — Set Brush Resource Object
  - `set_brush_size(desired_size: Vector2D)` -> `None` — deprecated: âset_brush_sizeâ was renamed to âset_desired_size_overrideâ.
  - `set_brush_tint_color(tint_color)` -> `None` — Set Brush Tint Color
  - `set_color_and_opacity(color_and_opacity)` -> `None` — Set Color and Opacity
  - `set_desired_size_override(desired_size)` -> `None` — Set Desired Size Override
  - `set_opacity(opacity)` -> `None` — Set Opacity

**Properties** (3):
  - `brush`: `SlateBrush` — [Read-Write] Image to draw (SlateBrush)
  - `color_and_opacity`: `LinearColor` — [Read-Write] Color and opacity (LinearColor)
  - `flip_for_right_to_left_flow_direction`: `bool` — [Read-Write] Flips the image if the localizationâs flow direction is RightToLeft (bool)

### `unreal.InputKeySelector`
Inherits: `Widget` | Header: `InputKeySelector.h`

A widget for selecting a single key or a single key with a modifier.

**Methods** (8):
  - `get_is_selecting_key()` -> `bool` — Returns true if the widget is currently selecting a key, otherwise returns false.
  - `set_allow_gamepad_keys(allow_gamepad_keys)` -> `None` — Sets whether or not gamepad keys are allowed in the selected key.
  - `set_allow_modifier_keys(allow_modifier_keys)` -> `None` — Sets whether or not modifier keys are allowed in the selected key.
  - `set_escape_keys(keys)` -> `None` — Sets escape keys.
  - `set_key_selection_text(key_selection_text)` -> `None` — Sets the text which is displayed while selecting keys.
  - `set_no_key_specified_text(no_key_specified_text)` -> `None` — Sets the text to display when no key text is available or not selecting a key.
  - `set_selected_key(selected_key)` -> `None` — Sets the currently selected key.
  - `set_text_block_visibility(visibility)` -> `None` — Sets the visibility of the text block.

**Properties** (11):
  - `allow_gamepad_keys`: `bool` — [Read-Write] When true gamepad keys are allowed in the input chord representing the selected key, ot...
  - `allow_modifier_keys`: `bool` — [Read-Write] When true modifier keys such as control and alt are allowed in the
input chord represen...
  - `escape_keys`: `None` [Read-Only] — [Read-Only] When true gamepad keys are allowed in the input chord representing the selected key, oth...
  - `key_selection_text`: `Text` — [Read-Write] Sets the text which is displayed while selecting keys. (Text)
  - `margin`: `Margin` — [Read-Write] The amount of blank space around the text used to display the currently selected key. (...
  - `no_key_specified_text`: `Text` — [Read-Write] Sets the text to display when no key text is available or not selecting a key. (Text)
  - `on_is_selecting_key_changed`: `OnIsSelectingKeyChanged` — [Read-Write] Called whenever the key selection mode starts or stops. (OnIsSelectingKeyChanged)
  - `on_key_selected`: `OnKeySelected` — [Read-Write] Called whenever a new key is selected by the user. (OnKeySelected)
  - `selected_key`: `InputChord` — [Read-Write] The currently selected key chord. (InputChord)
  - `text_style`: `TextBlockStyle` — [Read-Write] The button style used at runtime (TextBlockStyle)
  - `widget_style`: `ButtonStyle` — [Read-Write] The button style used at runtime (ButtonStyle)

### `unreal.InvalidationBox`
Inherits: `ContentWidget` | Header: `InvalidationBox.h`

Invalidate * Single Child * Caching / Performance

**Methods** (3):
  - `get_can_cache()` -> `bool`
  - `invalidate_cache()` -> `None` — Invalidate Cache deprecated: Function âInvalidateCacheâ is deprecated.
  - `set_can_cache(can_cache)` -> `None` — Tell the InvalidationBox to use the invalidation process. note: the other internal flags can disable the option.

**Properties** (1):
  - `can_cache`: `bool` — [Read-Write] Should the invalidation panel cache the widgets?  Making this false makes it so the inv...

### `unreal.ListView`
Inherits: `ListViewBase` | Header: `ListView.h`

A virtualized list that allows up to thousands of items to be displayed.

**Methods** (26):
  - `add_item(item)` -> `None` — Adds an the item to the list
  - `bp_cancel_scroll_into_view()` -> `None` — Cancels a previous request to scroll and item into view.
  - `bp_clear_selection()` -> `None` — Clear selection
  - `bp_get_num_items_selected()` -> `int32` — Gets the number of items currently selected in the list
  - `bp_get_selected_item()` -> `Object` — Gets the first selected item, if any; recommended that you only use this for single selection lists.
  - `bp_get_selected_items()` -> `Array[Object] or None` — Gets a list of all the currently selected items
  - `bp_is_item_visible(item)` -> `bool` — Gets whether the entry for the given object is currently visible in the list
  - `bp_navigate_to_item(item)` -> `None` — Requests that the given item is navigated to, scrolling it into view if needed.
  - `bp_scroll_item_into_view(item)` -> `None` — Requests that the given item is scrolled into view
  - `bp_set_item_selection(item, selected)` -> `None` — Sets whether the given item is selected.
  - `bp_set_list_items(list_items)` -> `None` — Sets the array of objects to display rows for in the list
  - `bp_set_selected_item(item)` -> `None` — Sets the given item as the sole selected item.
  - `clear_list_items()` -> `None` — Removes all items from the list
  - `get_horizontal_entry_spacing()` -> `float` — Get the horizontal spacing between entries.
  - `get_index_for_item(item)` -> `int32` — Returns the index that the specified item is at. Will return the first found, or -1 for not found
  - `get_item_at(index)` -> `Object` — Returns the item at the given index
  - `get_list_items()` -> `Array [ Object ]` — Gets the list of all items in the list. Note that each of these items only has a corresponding entry widget when visible...
  - `get_num_items()` -> `int32` — Returns the total number of items
  - `get_vertical_entry_spacing()` -> `float` — Get the vertical spacing between entries.
  - `is_refresh_pending()` -> `bool` — Returns true if a refresh is pending and the list will be rebuilt on the next tick
  - `navigate_to_index(index)` -> `None` — Requests that the item at the given index navigated to, scrolling it into view if needed.
  - `remove_item(item)` -> `None` — Removes an the item from the list
  - `scroll_index_into_view(index)` -> `None` — Requests that the item at the given index is scrolled into view
  - `set_scroll_into_view_alignment(new_scroll_into_view_alignment)` -> `None` — Sets ScrollIntoViewAlignment which allows to stick the selected item to either side or center
  - `set_selected_index(index)` -> `None` — Sets the item at the given index as the sole selected item.
  - `set_selection_mode(selection_mode)` -> `None` — Sets the new selection mode, preserving the current selection where possible.

**Properties** (23):
  - `bp_on_entry_initialized`: `OnListEntryInitializedDynamic` — [Read-Write] Called when a row widget is generated for a list item (OnListEntryInitializedDynamic)
  - `bp_on_is_item_selectable_or_navigable`: `OnIsItemSelectableOrNavigableDynamic` — [Read-Write] (OnIsItemSelectableOrNavigableDynamic)
  - `bp_on_item_clicked`: `SimpleListItemEventDynamic` — [Read-Write] (SimpleListItemEventDynamic)
  - `bp_on_item_double_clicked`: `SimpleListItemEventDynamic` — [Read-Write] (SimpleListItemEventDynamic)
  - `bp_on_item_is_hovered_changed`: `OnItemIsHoveredChangedDynamic` — [Read-Write] (OnItemIsHoveredChangedDynamic)
  - `bp_on_item_scrolled_into_view`: `OnListItemScrolledIntoViewDynamic` — [Read-Write] (OnListItemScrolledIntoViewDynamic)
  - `bp_on_item_selection_changed`: `OnListItemSelectionChangedDynamic` — [Read-Write] (OnListItemSelectionChangedDynamic)
  - `bp_on_list_view_finished_scrolling`: `OnListViewFinishedScrollingDynamic` — [Read-Write] (OnListViewFinishedScrollingDynamic)
  - `bp_on_list_view_scrolled`: `OnListViewScrolledDynamic` — [Read-Write] (OnListViewScrolledDynamic)
  - `clear_scroll_velocity_on_selection`: `bool` [Read-Only] — [Read-Only] (bool)
  - `clear_selection_on_click`: `bool` [Read-Only] — [Read-Only] (bool)
  - `consume_mouse_wheel`: `ConsumeMouseWheel` [Read-Only] — [Read-Only] (ConsumeMouseWheel)
  - `entry_spacing`: `float` [Read-Only] — [Read-Only] This deprecated property was originally BlueprintReadOnly. To satisfy the compiler requi...
  - `horizontal_entry_spacing`: `float` [Read-Only] — [Read-Only] (float)
  - `is_focusable`: `bool` [Read-Only] — [Read-Only] (bool)
  - `orientation`: `Orientation` [Read-Only] — [Read-Only] The scroll & layout orientation of the list. ListView and TileView only.
Vertical will s...
  - `return_focus_to_selection`: `bool` [Read-Only] — [Read-Only] (bool)
  - `scroll_bar_padding`: `Margin` — [Read-Write] (Margin)
  - `scroll_bar_style`: `ScrollBarStyle` [Read-Only] — [Read-Only] (ScrollBarStyle)
  - `scroll_into_view_alignment`: `ScrollIntoViewAlignment` [Read-Only] — [Read-Only] Sets where to scroll a widget to when using explicit navigation (ScrollIntoViewAlignment...
  - `selection_mode`: `SelectionMode` [Read-Only] — [Read-Only] (SelectionMode)
  - `vertical_entry_spacing`: `float` [Read-Only] — [Read-Only] (float)
  - `widget_style`: `TableViewStyle` [Read-Only] — [Read-Only] (TableViewStyle)

### `unreal.ListViewBase`
Inherits: `Widget` | Header: `ListViewBase.h`

Bare-bones base class to make creating custom UListView widgets easier. Child classes should also inherit from ITypedUMGListView<T> to get a basic public ListView API for free.

**Methods** (12):
  - `end_inertial_scrolling()` -> `None` — Stops the scroll inertia
  - `get_displayed_entry_widgets()` -> `Array [ UserWidget ]` — Gets all of the list entry widgets currently being displayed by the list
  - `get_scroll_offset()` -> `float` — Get the scroll offset of this view (in items)
  - `regenerate_all_entries()` -> `None` — Full regeneration of all entries in the list. Note that the entry UWidget instances will not be destroyed, but they will...
  - `request_refresh()` -> `None` — Sets the list to refresh on the next tick. Note that refreshing, from a list perspective, is limited to accounting for d...
  - `scroll_to_bottom()` -> `None` — Scroll the entire list down to the bottom-most item
  - `scroll_to_top()` -> `None` — Scroll the entire list up to the first item
  - `set_is_gamepad_scrolling_enabled(is_gamepad_scrolling_enabled)` -> `None` — Enable/Disable the ability of the list to scroll via gamepad.
  - `set_is_pointer_scrolling_enabled(is_pointer_scrolling_enabled)` -> `None` — Enable/Disable the ability of the list to scroll. This should be use as a temporary disable.
  - `set_scroll_offset(scroll_offset)` -> `None` — Set the scroll offset of this view (in items)
  - `set_scrollbar_visibility(visibility)` -> `None` — Set Scrollbar Visibility
  - `set_wheel_scroll_multiplier(new_wheel_scroll_multiplier)` -> `None` — Set Wheel Scroll Multiplier

**Properties** (10):
  - `allow_dragging`: `bool` [Read-Only] — [Read-Only] True to allow dragging of row widgets in the list (bool)
  - `bp_on_entries_generated`: `OnListEntriesGeneratedDynamic` — [Read-Write] Called when all row widgets are generated for all list items (OnListEntriesGeneratedDyn...
  - `bp_on_entry_generated`: `OnListEntryGeneratedDynamic` — [Read-Write] Called when a row widget is generated for a list item (OnListEntryGeneratedDynamic)
  - `bp_on_entry_released`: `OnListEntryReleasedDynamic` — [Read-Write] Called when a row widget is released by the list (i.e. when it no longer represents a l...
  - `enable_scroll_animation`: `bool` [Read-Only] — [Read-Only] True to enable lerped animation when scrolling through the list (bool)
  - `enable_touch_animated_scrolling`: `bool` [Read-Only] — [Read-Only] True to enable lerped animation when scrolling through the list with touch (bool)
  - `entry_widget_class`: `Class` [Read-Only] — [Read-Only] The type of widget to create for each entry displayed in the list. (type(Class))
  - `scrolling_animation_interpolation_speed`: `float` [Read-Only] — [Read-Only] The speed to apply when lerping in the scroll animation. (float)
  - `select_item_on_navigation`: `bool` [Read-Only] — [Read-Only] If true, items will be âselectedâ (in addition to focused) when navigating to them. ...
  - `wheel_scroll_multiplier`: `float` [Read-Only] — [Read-Only] The multiplier to apply when wheel scrolling (float)

### `unreal.MenuAnchor`
Inherits: `ContentWidget` | Header: `MenuAnchor.h`

The Menu Anchor allows you to specify an location that a popup menu should be anchored to, and should be summoned from. * Single Child * Popup

**Methods** (9):
  - `close()` -> `None` — Closes the menu if it is currently open.
  - `fit_in_window(fit)` -> `None` — Fit in Window
  - `get_menu_position()` -> `Vector2D` — Returns the current menu position
  - `has_open_sub_menus()` -> `bool` — Returns whether this menu has open submenus
  - `is_open()` -> `bool` — Returns true if the popup is open; false otherwise.
  - `open(focus_menu)` -> `None` — Opens the menu if it is not already open
  - `set_placement(placement)` -> `None` — TODO UMG Add Set MenuClass
  - `should_open_due_to_click()` -> `bool` — Returns true if we should open the menu due to a click. Sometimes we should not, if the same MouseDownEvent that just cl...
  - `toggle_open(focus_on_open)` -> `None` — Toggles the menus open state.

**Properties** (7):
  - `menu_class`: `Class` [Read-Only] — [Read-Only] The widget class to spawn when the menu is required.  Creates the widget freshly each ti...
  - `on_menu_open_changed`: `OnMenuOpenChangedEvent` — [Read-Write] Called when the opened state of the menu changes (OnMenuOpenChangedEvent)
  - `placement`: `MenuPlacement` — [Read-Write] The placement location of the summoned widget. (MenuPlacement)
  - `should_defer_painting_after_window_content`: `bool` [Read-Only] — [Read-Only] (bool)
  - `should_fit_in_window`: `bool` — [Read-Write] Should the menu anchor attempt to fit the menu inside the window. (bool)
  - `show_menu_background`: `bool` [Read-Only] — [Read-Only] For menus using the application menu stack, should the window background be visible? (bo...
  - `use_application_menu_stack`: `bool` [Read-Only] — [Read-Only] Does this menu behave like a normal stacked menu? Set it to false to control the menuâ...

### `unreal.MovieScene2DTransformSection`
Inherits: `MovieSceneSection` | Header: `MovieScene2DTransformSection.h`

A transform section

### `unreal.MovieScene2DTransformTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieScene2DTransformTrack.h`

Handles manipulation of 2D transforms in a movie scene

### `unreal.MovieSceneMarginSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneMarginSection.h`

A section in a Margin track

### `unreal.MovieSceneMarginTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneMarginTrack.h`

Handles manipulation of FMargins in a movie scene

### `unreal.MovieSceneWidgetMaterialTrack`
Inherits: `MovieSceneMaterialTrack` | Header: `MovieSceneWidgetMaterialTrack.h`

A material track which is specialized for materials which are owned by widget brushes.

### `unreal.MultiLineEditableText`
Inherits: `TextLayoutWidget` | Header: `MultiLineEditableText.h`

Editable text box widget

**Methods** (9):
  - `get_font()` -> `SlateFontInfo` — Get Font
  - `get_hint_text()` -> `Text` — Returns the Hint text that appears when there is no text in the text box
  - `get_text()` -> `Text` — Gets the widget text
  - `set_font(font_info)` -> `None` — Set Font
  - `set_font_material(material)` -> `None` — Set Font Material
  - `set_font_outline_material(material)` -> `None` — Set Font Outline Material
  - `set_hint_text(hint_text)` -> `None` — Sets the Hint text that appears when there is no text in the text box
  - `set_is_read_only(read_only)` -> `None` — Sets the Text as Readonly to prevent it from being modified interactively by the user
  - `set_text(text)` -> `None` — Directly sets the widget text.

**Properties** (9):
  - `clear_keyboard_focus_on_commit`: `bool` — [Read-Write] Whether to clear keyboard focus when pressing enter to commit changes (bool)
  - `hint_text`: `Text` — [Read-Write] Hint text that appears when there is no text in the text box (Text)
  - `is_read_only`: `bool` — [Read-Write] Sets the Text as Readonly to prevent it from being modified interactively by the user (...
  - `on_text_changed`: `OnMultiLineEditableTextChangedEvent` — [Read-Write] Called whenever the text is changed programmatically or interactively by the user (OnMu...
  - `on_text_committed`: `OnMultiLineEditableTextCommittedEvent` — [Read-Write] Called whenever the text is committed.  This happens when the user presses enter or the...
  - `revert_text_on_escape`: `bool` — [Read-Write] Whether to allow the user to back out of changes when they press the escape key (bool)
  - `select_all_text_when_focused`: `bool` — [Read-Write] Whether to select all text when the user clicks to give focus on the widget (bool)
  - `text`: `Text` — [Read-Write] The text content for this editable text box widget (Text)
  - `widget_style`: `TextBlockStyle` — [Read-Write] The style (TextBlockStyle)

### `unreal.MultiLineEditableTextBox`
Inherits: `TextLayoutWidget` | Header: `MultiLineEditableTextBox.h`

Allows a user to enter multiple lines of text

**Methods** (8):
  - `get_hint_text()` -> `Text` — Returns the Hint text that appears when there is no text in the text box
  - `get_text()` -> `Text` — Gets the widget text
  - `set_error(error)` -> `None` — Set Error
  - `set_foreground_color(color)` -> `None` — Set Foreground Color
  - `set_hint_text(hint_text)` -> `None` — Sets the Hint text that appears when there is no text in the text box
  - `set_is_read_only(read_only)` -> `None` — Sets the Text as Readonly to prevent it from being modified interactively by the user
  - `set_text(text)` -> `None` — Directly sets the widget text. Warning: This will wipe any binding created for the Text property!
  - `set_text_style(text_style)` -> `None` — Set Text Style

**Properties** (6):
  - `hint_text`: `Text` — [Read-Write] Hint text that appears when there is no text in the text box (Text)
  - `is_read_only`: `bool` — [Read-Write] Sets the Text as Readonly to prevent it from being modified interactively by the user (...
  - `on_text_changed`: `OnMultiLineEditableTextBoxChangedEvent` — [Read-Write] Called whenever the text is changed programmatically or interactively by the user (OnMu...
  - `on_text_committed`: `OnMultiLineEditableTextBoxCommittedEvent` — [Read-Write] Called whenever the text is committed.  This happens when the user presses enter or the...
  - `text`: `Text` — [Read-Write] The text content for this editable text box widget (Text)
  - `widget_style`: `EditableTextBoxStyle` — [Read-Write] The style (EditableTextBoxStyle)

### `unreal.NamedSlot`
Inherits: `ContentWidget` | Header: `NamedSlot.h`

Allows you to expose an external slot for your user widget. When others reuse your user control, they can put whatever they want in this named slot.

### `unreal.NativeWidgetHost`
Inherits: `Widget` | Header: `NativeWidgetHost.h`

A NativeWidgetHost is a container widget that can contain one child slate widget. This should be used when all you need is to nest a native widget inside a UMG widget.

### `unreal.Overlay`
Inherits: `PanelWidget` | Header: `Overlay.h`

Allows widgets to be stacked on top of each other, uses simple flow layout for content on each layer.

**Methods** (2):
  - `add_child_to_overlay(content)` -> `OverlaySlot` — Add Child to Overlay
  - `replace_overlay_child_at(index, content)` -> `bool` — Replace the widget at the given index it with a different widget.

### `unreal.OverlaySlot`
Inherits: `PanelSlot` | Header: `OverlaySlot.h`

Slot for the UOverlay panel. Allows content to be hover above other content.

**Methods** (3):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set the alignment of the object horizontally.
  - `set_padding(padding)` -> `None` — Set padding area between the slot and the content it contains.
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set the alignment of the object vertically.

**Properties** (3):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.PanelSlot`
Inherits: `Visual` | Header: `PanelSlot.h`

The base class for all Slots in UMG.

**Methods** (1):
  - `get_content()` -> `Widget` — Get Content

### `unreal.PanelWidget`
Inherits: `Widget` | Header: `PanelWidget.h`

The base class for all UMG panel widgets. Panel widgets layout a collection of child widgets.

**Methods** (10):
  - `add_child(content)` -> `PanelSlot` — Adds a new child widget to the container. Returns the base slot type, requires casting to turn it into the type specific...
  - `clear_children()` -> `None` — Remove all child widgets from the panel widget.
  - `get_all_children()` -> `Array [ Widget ]` — Gets all widgets in the container
  - `get_child_at(index)` -> `Widget` — Gets the widget at an index.
  - `get_child_index(content)` -> `int32` — Gets the index of a specific child widget
  - `get_children_count()` -> `int32` — Gets number of child widgets in the container.
  - `has_any_children()` -> `bool` — Returns true if there are any child widgets in the panel
  - `has_child(content)` -> `bool` — Returns true if panel contains this widget
  - `remove_child(content)` -> `bool` — Removes a specific widget from the container.
  - `remove_child_at(index)` -> `bool` — Removes a child by itâs index.

### `unreal.PostBufferBlurUpdater`
Inherits: `SlatePostBufferProcessorUpdater` | Header: `PostBufferBlurUpdater.h`

Processor updater that sets the blur strength for a blur processor intra-frame on the renderthread

### `unreal.PostBufferUpdate`
Inherits: `Widget` | Header: `PostBufferUpdate.h`

Widget that when drawn, will trigger the slate post buffer to update. Does not draw anything itself. This allows for you to perform layered UI / sampling effects with the GetSlatePost material functio...

**Properties** (2):
  - `perform_default_post_buffer_update`: `bool` — [Read-Write] True if we should do the default post buffer update of the scene before any UI.
If any ...
  - `update_only_paint_area`: `bool` [Read-Only] — [Read-Only] True if we should only update the buffer within the bounds of this widget (bool)

### `unreal.ProgressBar`
Inherits: `Widget` | Header: `ProgressBar.h`

The progress bar widget is a simple bar that fills up that can be restyled to fit any number of uses.

**Methods** (3):
  - `set_fill_color_and_opacity(color)` -> `None` — Sets the fill color of the progress bar.
  - `set_is_marquee(inb_is_marquee)` -> `None` — Sets the progress bar to show as a marquee.
  - `set_percent(percent)` -> `None` — Sets the current value of the ProgressBar.

**Properties** (7):
  - `bar_fill_style`: `ProgressBarFillStyle` — [Read-Write] Defines the visual style of the progress bar fill - scale or mask (ProgressBarFillStyle...
  - `bar_fill_type`: `ProgressBarFillType` — [Read-Write] Defines the direction in which the progress bar fills (ProgressBarFillType)
  - `border_padding`: `Vector2D` — [Read-Write] (Vector2D)
  - `fill_color_and_opacity`: `LinearColor` — [Read-Write] Fill Color and Opacity (LinearColor)
  - `is_marquee`: `bool` — [Read-Write] (bool)
  - `percent`: `float` — [Read-Write] Used to determine the fill position of the progress bar ranging 0..1 (float)
  - `widget_style`: `ProgressBarStyle` — [Read-Write] The progress bar style (ProgressBarStyle)

### `unreal.RetainerBox`
Inherits: `ContentWidget` | Header: `RetainerBox.h`

The Retainer Box renders children widgets to a render target first before later rendering that render target to the screen. This allows both frequency and phase to be controlled so that the UI can act...

**Methods** (6):
  - `get_effect_material()` -> `MaterialInstanceDynamic` — Get the current dynamic effect material applied to the retainer box.
  - `request_render()` -> `None` — Requests the retainer redrawn the contents it has.
  - `set_effect_material(effect_material)` -> `None` — Set a new effect material to the retainer widget.
  - `set_rendering_phase(render_phase, total_phases)` -> `None` — Requests the retainer redrawn the contents it has.
  - `set_retain_rendering(retain_rendering)` -> `None` — Set the flag for if we retain the render or pass-through
  - `set_texture_parameter(texture_parameter)` -> `None` — Sets the name of the texture parameter to set the render target to on the material.

**Properties** (8):
  - `effect_material`: `MaterialInterface` — [Read-Write] The effect to optionally apply to the render target.  We will set the texture sampler b...
  - `phase`: `int` [Read-Only] — [Read-Only] The Phase this widget will draw on. If the Phase is 0, and the PhaseCount is 1, the widg...
  - `phase_count`: `int` [Read-Only] — [Read-Only] The PhaseCount controls how many phases are possible know what to modulus the current fr...
  - `render_on_invalidation`: `bool` [Read-Only] — [Read-Only] Should this widget redraw the contents it has every time it receives an invalidation req...
  - `render_on_phase`: `bool` [Read-Only] — [Read-Only] Should this widget redraw the contents it has every time the phase occurs. (bool)
  - `retain_render`: `bool` — [Read-Write] (bool)
  - `show_effects_in_designer`: `bool` [Read-Only] — [Read-Only] If true, retained rendering occurs in designer (bool)
  - `texture_parameter`: `Name` — [Read-Write] The texture sampler parameter of the
EffectMaterial,: that weâll set to the render ta...

### `unreal.RichTextBlock`
Inherits: `TextLayoutWidget` | Header: `RichTextBlock.h`

The rich text block

**Methods** (20):
  - `clear_all_default_style_overrides()` -> `None` — Remove all overrides made to the default text style and return to the style specified in the style set data table
  - `get_decorator_by_class(decorator_class)` -> `RichTextBlockDecorator` — Get Decorator by Class
  - `get_default_dynamic_material()` -> `MaterialInstanceDynamic` — Creates a dynamic material for the default font or returns it if it already exists
  - `get_text()` -> `Text` — Returns widgets text.
  - `get_text_style_set()` -> `DataTable` — Get Text Style Set
  - `refresh_text_layout()` -> `None` — Causes the text to reflow itâs layout and re-evaluate any decorators
  - `set_auto_wrap_text(auto_text_wrap)` -> `None` — Set the auto wrap for this rich text block
  - `set_decorators(decorator_classes)` -> `None` — Replaces the existing decorators with the list provided
  - `set_default_color_and_opacity(color_and_opacity)` -> `None` — Sets the color and opacity of the default text in this rich text block
  - `set_default_font(font_info)` -> `None` — Dynamically set the default font info for this rich text block
  - `set_default_material(material)` -> `None` — Set Default Material
  - `set_default_shadow_color_and_opacity(shadow_color_and_opacity)` -> `None` — Sets the color and opacity of the default text drop shadow Note: if opacity is zero no shadow will be drawn
  - `set_default_shadow_offset(shadow_offset)` -> `None` — Sets the offset that the default text drop shadow should be drawn at
  - `set_default_strike_brush(strike_brush)` -> `None` — Dynamically set the default strike brush for this rich text block
  - `set_default_text_style(default_text_style)` -> `None` — Wholesale override of the currently established default text style
  - `set_min_desired_width(min_desired_width)` -> `None` — Set the minimum desired width for this rich text block
  - `set_text(text)` -> `None` — Directly sets the widget text. Warning: This will wipe any binding created for the Text property!
  - `set_text_overflow_policy(overflow_policy)` -> `None` — Set the text overflow policy for this text block.
  - `set_text_style_set(new_text_style_set)` -> `None` — Set Text Style Set
  - `set_text_transform_policy(transform_policy)` -> `None` — Set the text transformation policy for this text block.

**Properties** (6):
  - `default_text_style_override`: `TextBlockStyle` — [Read-Write] Text style to apply by default to text in this block (TextBlockStyle)
  - `min_desired_width`: `float` — [Read-Write] The minimum desired size for the text (float)
  - `text`: `Text` — [Read-Write] The text to display (Text)
  - `text_overflow_policy`: `TextOverflowPolicy` — [Read-Write] Sets what happens to text that is clipped and doesnât fit within the clip rect for th...
  - `text_style_set`: `DataTable` — [Read-Write] (DataTable)
  - `text_transform_policy`: `TextTransformPolicy` — [Read-Write] The text transformation policy to apply to this text block (TextTransformPolicy)

### `unreal.RichTextBlockDecorator`
Inherits: `Object` | Header: `RichTextBlockDecorator.h`

Rich Text Block Decorator

### `unreal.RichTextBlockImageDecorator`
Inherits: `RichTextBlockDecorator` | Header: `RichTextBlockImageDecorator.h`

Allows you to setup an image decorator that can be configured to map certain keys to certain images. We recommend you subclass this as a blueprint to configure the instance.

### `unreal.SafeZone`
Inherits: `ContentWidget` | Header: `SafeZone.h`

The Safe-Zone widget is an essential part of developing a game UI that can run on lots of different non-PC platforms. While a modern flat panel computer monitor may not have over scan issues, this is ...

**Methods** (1):
  - `set_sides_to_pad(pad_left, pad_right, pad_top, pad_bottom)` -> `None` — Set Sides to Pad

**Properties** (4):
  - `pad_bottom`: `bool` — [Read-Write] If this safe zone should pad for the bottom side of the screenâs safe zone (bool)
  - `pad_left`: `bool` — [Read-Write] If this safe zone should pad for the left side of the screenâs safe zone (bool)
  - `pad_right`: `bool` — [Read-Write] If this safe zone should pad for the right side of the screenâs safe zone (bool)
  - `pad_top`: `bool` — [Read-Write] If this safe zone should pad for the top side of the screenâs safe zone (bool)

### `unreal.SafeZoneSlot`
Inherits: `PanelSlot` | Header: `SafeZoneSlot.h`

Safe Zone Slot

**Properties** (5):
  - `h_align`: `HorizontalAlignment` — [Read-Write] (HorizontalAlignment)
  - `is_title_safe`: `bool` — [Read-Write] (bool)
  - `padding`: `Margin` — [Read-Write] (Margin)
  - `safe_area_scale`: `Margin` — [Read-Write] (Margin)
  - `v_align`: `VerticalAlignment` — [Read-Write] (VerticalAlignment)

### `unreal.ScaleBox`
Inherits: `ContentWidget` | Header: `ScaleBox.h`

Allows you to place content with a desired size and have it scale to meet the constraints placed on this boxâs alloted area. If you needed to have a background image scale to fill an area but not be...

**Methods** (4):
  - `set_ignore_inherited_scale(ignore_inherited_scale)` -> `None` — Set Ignore Inherited Scale
  - `set_stretch(stretch)` -> `None` — Set Stretch
  - `set_stretch_direction(stretch_direction)` -> `None` — Set Stretch Direction
  - `set_user_specified_scale(user_specified_scale)` -> `None` — Set User Specified Scale

**Properties** (4):
  - `ignore_inherited_scale`: `bool` — [Read-Write] Optional bool to ignore the inherited scale. Applies inverse scaling to counteract pare...
  - `stretch`: `Stretch` — [Read-Write] The stretching rule to apply when content is stretched (Stretch)
  - `stretch_direction`: `StretchDirection` — [Read-Write] Controls in what direction content can be scaled (StretchDirection)
  - `user_specified_scale`: `float` — [Read-Write] Optional scale that can be specified by the User. Used only for UserSpecified stretchin...

### `unreal.ScaleBoxSlot`
Inherits: `PanelSlot` | Header: `ScaleBoxSlot.h`

The Slot for the UScaleBoxSlot, contains the widget displayed in a buttonâs single slot

**Methods** (3):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding deprecated: Function âSetPaddingâ is deprecated.
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (2):
  - `horizontal_alignment`: `HorizontalAlignment` [Read-Only] — [Read-Only] The alignment of the object horizontally. (HorizontalAlignment)
  - `vertical_alignment`: `VerticalAlignment` [Read-Only] — [Read-Only] The alignment of the object vertically. (VerticalAlignment)

### `unreal.ScrollBar`
Inherits: `Widget` | Header: `ScrollBar.h`

Scroll Bar

**Methods** (1):
  - `set_state(offset_fraction, thumb_size_fraction)` -> `None` — Set the offset and size of the trackâs thumb. Note that the maximum offset is 1.0-ThumbSizeFraction. If the user can v...

**Properties** (6):
  - `always_show_scrollbar`: `bool` — [Read-Write] (bool)
  - `always_show_scrollbar_track`: `bool` — [Read-Write] (bool)
  - `orientation`: `Orientation` [Read-Only] — [Read-Only] (Orientation)
  - `padding`: `Margin` — [Read-Write] The margin around the scrollbar (Margin)
  - `thickness`: `Vector2D` — [Read-Write] The thickness of the scrollbar thumb (Vector2D)
  - `widget_style`: `ScrollBarStyle` — [Read-Write] Style of the scrollbar (ScrollBarStyle)

### `unreal.ScrollBox`
Inherits: `PanelWidget` | Header: `ScrollBox.h`

An arbitrary scrollable collection of widgets. Great for presenting 10-100 widgets in a list. Doesnât support virtualization.

**Methods** (30):
  - `end_inertial_scrolling()` -> `None` — Instantly stops any inertial scrolling that is currently in progress
  - `get_analog_mouse_wheel_key()` -> `Key` — Get Analog Mouse Wheel Key
  - `get_consume_pointer_input()` -> `bool` — Get Consume Pointer Input
  - `get_is_focusable()` -> `bool` — Get Is Focusable
  - `get_is_scrolling()` -> `bool` — Returns true when the widget is currently inertial scrolling
  - `get_overscroll_offset()` -> `float` — Gets the overscroll offset of the scrollbox in Slate Units.
  - `get_overscroll_percentage()` -> `float` — Gets the overscroll offset of the scrollbox in percentage from its view size.
  - `get_scroll_offset()` -> `float` — Gets the scroll offset of the scrollbox in Slate Units.
  - `get_scroll_offset_of_end()` -> `float` — Gets the scroll offset of the bottom of the ScrollBox in Slate Units.
  - `get_view_fraction()` -> `float` — Gets the fraction currently visible in the scrollbox
  - `get_view_offset_fraction()` -> `float` — Get View Offset Fraction
  - `scroll_to_end()` -> `None` — Scrolls the ScrollBox to the bottom instantly during the next layout pass.
  - `scroll_to_start()` -> `None` — Scrolls the ScrollBox to the top instantly
  - `scroll_widget_into_view(widget_to_find, animate_scroll = True, scroll_destination = DescendantScrollDestination.INTO_VIEW, padding = 0.000000)` -> `None` — Scrolls the ScrollBox to the widget during the next layout pass.
  - `set_allow_overscroll(new_allow_overscroll)` -> `None` — Set Allow Overscroll
  - `set_always_show_scrollbar(new_always_show_scrollbar)` -> `None` — Set Always Show Scrollbar
  - `set_analog_mouse_wheel_key(mouse_wheel_key)` -> `None` — Set Analog Mouse Wheel Key
  - `set_animate_wheel_scrolling(should_animate_wheel_scrolling)` -> `None` — Set Animate Wheel Scrolling
  - `set_consume_mouse_wheel(new_consume_mouse_wheel)` -> `None` — Set Consume Mouse Wheel
  - `set_consume_pointer_input(consume_pointer_input)` -> `None` — Set Consume Pointer Input
  - `set_is_focusable(is_focusable)` -> `None` — Set Is Focusable
  - `set_navigation_destination(new_navigation_destination)` -> `None` — Set Navigation Destination
  - `set_orientation(new_orientation)` -> `None` — Set Orientation
  - `set_scroll_animation_interpolation_speed(new_scroll_animation_interpolation_speed)` -> `None` — Set Scroll Animation Interpolation Speed
  - `set_scroll_bar_visibility(new_scroll_bar_visibility)` -> `None` — Set Scroll Bar Visibility
  - `set_scroll_offset(new_scroll_offset)` -> `None` — Updates the scroll offset of the scrollbox.
  - `set_scroll_when_focus_changes(new_scroll_when_focus_changes)` -> `None` — Set Scroll when Focus Changes
  - `set_scrollbar_padding(new_scrollbar_padding)` -> `None` — Set Scrollbar Padding
  - `set_scrollbar_thickness(new_scrollbar_thickness)` -> `None` — Set Scrollbar Thickness
  - `set_wheel_scroll_multiplier(new_wheel_scroll_multiplier)` -> `None` — Set Wheel Scroll Multiplier

**Properties** (27):
  - `allow_overscroll`: `bool` — [Read-Write] Disable to stop scrollbars from activating inertial overscrolling (bool)
  - `allow_right_click_drag_scrolling`: `bool` — [Read-Write] Option to disable right-click-drag scrolling (bool)
  - `always_show_scrollbar`: `bool` — [Read-Write] (bool)
  - `always_show_scrollbar_track`: `bool` — [Read-Write] (bool)
  - `analog_mouse_wheel_key`: `Key` — [Read-Write] The virtual mouse wheel key for gamepad input (Key)
  - `animate_wheel_scrolling`: `bool` — [Read-Write] True to lerp smoothly when wheel scrolling along the scroll box (bool)
  - `back_pad_scrolling`: `bool` [Read-Only] — [Read-Only] Whether to back pad this scroll box, allowing user to scroll backward until child conten...
  - `consume_mouse_wheel`: `ConsumeMouseWheel` — [Read-Write] When mouse wheel events should be consumed. (ConsumeMouseWheel)
  - `consume_pointer_input`: `bool` — [Read-Write] Option to pass touch input events to widgets behind the ScrollBox. (bool)
  - `enable_touch_scrolling`: `bool` — [Read-Write] True to allow scrolling using touch input. (bool)
  - `front_pad_scrolling`: `bool` [Read-Only] — [Read-Only] Whether to front pad this scroll box, allowing user to scroll forward until child conten...
  - `is_focusable`: `bool` — [Read-Write] If true, scrollbox can receive focus. On gamepad, ensure AnalogMouseWheelKey is set to ...
  - `navigation_destination`: `DescendantScrollDestination` — [Read-Write] Sets where to scroll a widget to when using explicit navigation or if ScrollWhenFocusCh...
  - `navigation_scroll_padding`: `float` [Read-Only] — [Read-Only] The amount of padding to ensure exists between the item being navigated to, at the edge ...
  - `on_focus_lost`: `OnScrollBoxFocusLostEvent` — [Read-Write] Called when the scroll has changed (OnScrollBoxFocusLostEvent)
  - `on_focus_received`: `OnScrollBoxFocusReceivedEvent` — [Read-Write] Called when the scroll has changed (OnScrollBoxFocusReceivedEvent)
  - `on_scroll_bar_visibility_changed`: `OnScrollBarVisibilityChangedEvent` — [Read-Write] Called when the scrollbar visibility has changed (OnScrollBarVisibilityChangedEvent)
  - `on_user_scrolled`: `OnUserScrolledEvent` — [Read-Write] Called when the scroll has changed (OnUserScrolledEvent)
  - `orientation`: `Orientation` — [Read-Write] The orientation of the scrolling and stacking in the box. (Orientation)
  - `scroll_animation_interpolation_speed`: `float` — [Read-Write] (float)
  - `scroll_bar_visibility`: `SlateVisibility` — [Read-Write] Visibility (SlateVisibility)
  - `scroll_when_focus_changes`: `ScrollWhenFocusChanges` — [Read-Write] Scroll behavior when user focus is given to a child widget (ScrollWhenFocusChanges)
  - `scrollbar_padding`: `Margin` — [Read-Write] The margin around the scrollbar (Margin)
  - `scrollbar_thickness`: `Vector2D` — [Read-Write] The thickness of the scrollbar thumb (Vector2D)
  - `wheel_scroll_multiplier`: `float` — [Read-Write] The multiplier to apply when wheel scrolling (float)
  - `widget_bar_style`: `ScrollBarStyle` — [Read-Write] The bar style (ScrollBarStyle)
  - `widget_style`: `ScrollBoxStyle` — [Read-Write] The style (ScrollBoxStyle)

### `unreal.ScrollBoxSlot`
Inherits: `PanelSlot` | Header: `ScrollBoxSlot.h`

The Slot for the UScrollBox, contains the widget that are scrollable

**Methods** (3):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (4):
  - `horizontal_alignment`: `HorizontalAlignment` [Read-Only] — [Read-Only] The alignment of the object horizontally. (HorizontalAlignment)
  - `padding`: `Margin` [Read-Only] — [Read-Only] The padding area between the slot and the content it contains. (Margin)
  - `size`: `SlateChildSize` — [Read-Write] How much space this slot should occupy in the direction of the panel. (SlateChildSize)
  - `vertical_alignment`: `VerticalAlignment` [Read-Only] — [Read-Only] The alignment of the object vertically. (VerticalAlignment)

### `unreal.SizeBox`
Inherits: `ContentWidget` | Header: `SizeBox.h`

A widget that allows you to specify the size it reports to have and desire. Not all widgets report a desired size that you actually desire. Wrapping them in a SizeBox lets you have the Size Box force ...

**Methods** (16):
  - `clear_height_override()` -> `None` — Clear Height Override
  - `clear_max_aspect_ratio()` -> `None` — Clear Max Aspect Ratio
  - `clear_max_desired_height()` -> `None` — Clear Max Desired Height
  - `clear_max_desired_width()` -> `None` — Clear Max Desired Width
  - `clear_min_aspect_ratio()` -> `None` — Clear Min Aspect Ratio
  - `clear_min_desired_height()` -> `None` — Clear Min Desired Height
  - `clear_min_desired_width()` -> `None` — Clear Min Desired Width
  - `clear_width_override()` -> `None` — Clear Width Override
  - `set_height_override(height_override)` -> `None` — When specified, ignore the contentâs desired size and report the HeightOverride as the Boxâs desired height.
  - `set_max_aspect_ratio(max_aspect_ratio)` -> `None` — Set Max Aspect Ratio
  - `set_max_desired_height(max_desired_height)` -> `None` — When specified, will report the MaxDesiredHeight if smaller than the contentâs desired height.
  - `set_max_desired_width(max_desired_width)` -> `None` — When specified, will report the MaxDesiredWidth if smaller than the contentâs desired width.
  - `set_min_aspect_ratio(min_aspect_ratio)` -> `None` — Set Min Aspect Ratio
  - `set_min_desired_height(min_desired_height)` -> `None` — When specified, will report the MinDesiredHeight if larger than the contentâs desired height.
  - `set_min_desired_width(min_desired_width)` -> `None` — When specified, will report the MinDesiredWidth if larger than the contentâs desired width.
  - `set_width_override(width_override)` -> `None` — When specified, ignore the contentâs desired size and report the WidthOverride as the Boxâs desired width.

**Properties** (8):
  - `height_override`: `float` — [Read-Write] When specified, ignore the contentâs desired size and report the HeightOverride as th...
  - `max_aspect_ratio`: `float` — [Read-Write] (float)
  - `max_desired_height`: `float` — [Read-Write] When specified, will report the MaxDesiredHeight if smaller than the contentâs desire...
  - `max_desired_width`: `float` — [Read-Write] When specified, will report the MaxDesiredWidth if smaller than the contentâs desired...
  - `min_aspect_ratio`: `float` — [Read-Write] (float)
  - `min_desired_height`: `float` — [Read-Write] When specified, will report the MinDesiredHeight if larger than the contentâs desired...
  - `min_desired_width`: `float` — [Read-Write] When specified, will report the MinDesiredWidth if larger than the contentâs desired ...
  - `width_override`: `float` — [Read-Write] When specified, ignore the contentâs desired size and report the WidthOverride as the...

### `unreal.SizeBoxSlot`
Inherits: `PanelSlot` | Header: `SizeBoxSlot.h`

The Slot for the USizeBoxSlot, contains the widget displayed in a buttonâs single slot

**Methods** (3):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (3):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.SlateLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SlateBlueprintLibrary.h`

Slate Blueprint Library

**Methods** (20):
  - `absolute_to_local(geometry, absolute_coordinate)` -> `Vector2D` [classmethod] — Transforms absolute coordinates into local coordinates Absolute coordinates could be either desktop or window space depe...
  - `absolute_to_viewport(world_context_object, viewport_position=Vector2D)` [classmethod] — Translates absolute coordinate in desktop space of the geometry provided into local viewport coordinates.
  - `equal_equal_slate_brush(a, b)` -> `bool` [classmethod] — Returns whether brushes A and B are identical.
  - `get_absolute_size(geometry)` -> `Vector2D` [classmethod] — Returns the size of the geometry in absolute space.
  - `get_local_size(geometry)` -> `Vector2D` [classmethod] — Returns the size of the geometry in local space.
  - `get_local_top_left(geometry)` -> `Vector2D` [classmethod] — Returns the local top/left of the geometry in local space.
  - `is_under_location(geometry, absolute_coordinate)` -> `bool` [classmethod] — Absolute coordinates could be either desktop or window space depending on what space the root of the widget hierarchy is...
  - `local_to_absolute(geometry, local_coordinate)` -> `Vector2D` [classmethod] — Transforms local coordinates into absolute coordinates Absolute coordinates could be either desktop or window space depe...
  - `local_to_viewport(world_context_object, geometry, viewport_position=Vector2D)` [classmethod] — Translates local coordinate of the geometry provided into local viewport coordinates.
  - `scalar_absolute_to_local(geometry, absolute_scalar)` -> `float` [classmethod] — Transforms a scalar from absolute space to local space
  - `scalar_local_to_absolute(geometry, local_scalar)` -> `float` [classmethod] — Transforms a scalar from local space to absolute space
  - `screen_to_viewport(world_context_object, screen_position)` -> `Vector2D` [classmethod] — Translates a screen position in pixels into the local space of the viewport widget.
  - `screen_to_widget_absolute(world_context_object, screen_position, include_window_position = False)` -> `Vector2D` [classmethod] — Translates a screen position in pixels into absolute application coordinates. If bIncludeWindowPosition is true, then th...
  - `screen_to_widget_local(world_context_object, geometry, screen_position, include_window_position = False)` -> `Vector2D` [classmethod] — Translates a screen position in pixels into the local space of a widget with the given geometry. If bIncludeWindowPositi...
  - `transform_scalar_absolute_to_local(geometry, absolute_scalar)` -> `float` [classmethod] — Transform Scalar Absolute to Local deprecated: Returns inverted results. Replace with âLocal to Absolute (Scalar)â
  - `transform_scalar_local_to_absolute(geometry, local_scalar)` -> `float` [classmethod] — Transform Scalar Local to Absolute deprecated: Returns inverted results. Replace with âAbsolute To Local (Scalar)â
  - `transform_vector_absolute_to_local(geometry, absolute_vector)` -> `Vector2D` [classmethod] — Transform Vector Absolute to Local deprecated: Returns inverted results. Replace with âLocal to Absolute (Vector)â
  - `transform_vector_local_to_absolute(geometry, local_vector)` -> `Vector2D` [classmethod] — Transform Vector Local to Absolute deprecated: Returns inverted results. Replace with âAbsolute To Local (Vector)â
  - `vector_absolute_to_local(geometry, absolute_vector)` -> `Vector2D` [classmethod] — Transforms a vector from absolute space to local space
  - `vector_local_to_absolute(geometry, local_vector)` -> `Vector2D` [classmethod] — Transforms a vector from local space to absolute space

### `unreal.SlatePostBufferProcessorUpdater`
Inherits: `Object` | Header: `PostBufferUpdate.h`

Class that can create a FPostParamUpdaterProxy whose lifetime will be managed by the renderthread. This proxy will be given a Post buffer processor to update mid-frame.

### `unreal.Slider`
Inherits: `Widget` | Header: `Slider.h`

A simple widget that shows a sliding bar with a handle that allows you to control the value in a user define range (between 0..1 by default).

**Methods** (10):
  - `get_normalized_value()` -> `float` — Get the current value scaled from 0 to 1
  - `get_value()` -> `float` — Gets the current value of the slider.
  - `set_indent_handle(value)` -> `None` — Sets if the slidable area should be indented to fit the handle.
  - `set_locked(value)` -> `None` — Sets the handle to be interactive or fixed.
  - `set_max_value(value)` -> `None` — Sets the maximum value of the slider.
  - `set_min_value(value)` -> `None` — Sets the minimum value of the slider.
  - `set_slider_bar_color(value)` -> `None` — Sets the color of the slider bar.
  - `set_slider_handle_color(value)` -> `None` — Sets the color of the handle bar
  - `set_step_size(value)` -> `None` — Sets the amount to adjust the value by, when using a controller or keyboard.
  - `set_value(value)` -> `None` — Sets the current value of the slider.

**Properties** (19):
  - `indent_handle`: `bool` — [Read-Write] Whether the slidable area should be indented to fit the handle. (bool)
  - `is_focusable`: `bool` [Read-Only] — [Read-Only] Should the slider be focusable? (bool)
  - `locked`: `bool` — [Read-Write] Whether the handle is interactive or fixed. (bool)
  - `max_value`: `float` — [Read-Write] The maximum value the slider can be set to. (float)
  - `min_value`: `float` — [Read-Write] The minimum value the slider can be set to. (float)
  - `mouse_uses_step`: `bool` [Read-Only] — [Read-Only] Sets new value if mouse position is greater/less than half the step size. (bool)
  - `on_controller_capture_begin`: `OnControllerCaptureBeginEvent` — [Read-Write] Invoked when the controller capture begins. (OnControllerCaptureBeginEvent)
  - `on_controller_capture_end`: `OnControllerCaptureEndEvent` — [Read-Write] Invoked when the controller capture ends. (OnControllerCaptureEndEvent)
  - `on_mouse_capture_begin`: `OnMouseCaptureBeginEvent` — [Read-Write] Invoked when the mouse is pressed and a capture begins. (OnMouseCaptureBeginEvent)
  - `on_mouse_capture_end`: `OnMouseCaptureEndEvent` — [Read-Write] Invoked when the mouse is released and a capture ends. (OnMouseCaptureEndEvent)
  - `on_value_changed`: `OnFloatValueChangedEvent` — [Read-Write] Called when the value is changed by slider or typing. (OnFloatValueChangedEvent)
  - `orientation`: `Orientation` — [Read-Write] The sliderâs orientation. (Orientation)
  - `prevent_throttling`: `bool` [Read-Only] — [Read-Only] If refresh requests for the viewport should happen for all value changes * (bool)
  - `requires_controller_lock`: `bool` [Read-Only] — [Read-Only] Sets whether we have to lock input to change the slider value. (bool)
  - `slider_bar_color`: `LinearColor` — [Read-Write] The color to draw the slider bar in. (LinearColor)
  - `slider_handle_color`: `LinearColor` — [Read-Write] The color to draw the slider handle in. (LinearColor)
  - `step_size`: `float` — [Read-Write] The amount to adjust the value by, when using a controller or keyboard (float)
  - `value`: `float` — [Read-Write] The volume value to display. (float)
  - `widget_style`: `SliderStyle` — [Read-Write] The progress bar style (SliderStyle)

### `unreal.Spacer`
Inherits: `Widget` | Header: `Spacer.h`

A spacer widget; it does not have a visual representation, and just provides padding between other widgets.

**Methods** (1):
  - `set_size(size)` -> `None` — Sets the size of the spacer

**Properties** (1):
  - `size`: `Vector2D` — [Read-Write] The size of the spacer (Vector2D)

### `unreal.SpinBox`
Inherits: `Widget` | Header: `SpinBox.h`

A numerical entry box that allows for direct entry of the number or allows the user to click and slide the number.

**Methods** (15):
  - `clear_max_slider_value()` -> `None` — Clear the maximum value that can be specified using the slider.
  - `clear_max_value()` -> `None` — Clear the maximum value that can be manually set in the spin box.
  - `clear_min_slider_value()` -> `None` — Clear the minimum value that can be specified using the slider.
  - `clear_min_value()` -> `None` — Clear the minimum value that can be manually set in the spin box.
  - `get_max_slider_value()` -> `float` — Get the current maximum value that can be specified using the slider.
  - `get_max_value()` -> `float` — Get the current maximum value that can be manually set in the spin box.
  - `get_min_slider_value()` -> `float` — Get the current minimum value that can be specified using the slider.
  - `get_min_value()` -> `float` — Get the current minimum value that can be manually set in the spin box.
  - `get_value()` -> `float` — Get the current value of the spin box.
  - `set_foreground_color(foreground_color)` -> `None` — Set Foreground Color
  - `set_max_slider_value(new_value)` -> `None` — Set the maximum value that can be specified using the slider.
  - `set_max_value(new_value)` -> `None` — Set the maximum value that can be manually set in the spin box.
  - `set_min_slider_value(new_value)` -> `None` — Set the minimum value that can be specified using the slider.
  - `set_min_value(new_value)` -> `None` — Set the minimum value that can be manually set in the spin box.
  - `set_value(new_value)` -> `None` — Set the value of the spin box.

**Properties** (22):
  - `always_uses_delta_snap`: `bool` — [Read-Write] Whether this spin box should use the delta snapping logic for typed values - default fa...
  - `clear_keyboard_focus_on_commit`: `bool` — [Read-Write] Whether to remove the keyboard focus from the spin box when the value is committed (boo...
  - `delta`: `float` — [Read-Write] The amount by which to change the spin box value as the slider moves. (float)
  - `enable_slider`: `bool` — [Read-Write] Whether this spin box should have slider feature enabled (bool)
  - `font`: `SlateFontInfo` — [Read-Write] Font color and opacity (overrides style) (SlateFontInfo)
  - `foreground_color`: `SlateColor` — [Read-Write] (SlateColor)
  - `justification`: `TextJustify` — [Read-Write] The justification the value text should appear as. (TextJustify)
  - `max_fractional_digits`: `int` — [Read-Write] The maximum required fractional digits - default 6 (int32)
  - `max_slider_value`: `float` — [Read-Write] The maximum allowable value that can be specified using the slider (float)
  - `max_value`: `float` — [Read-Write] The maximum allowable value that can be manually entered into the spin box (float)
  - `min_desired_width`: `float` — [Read-Write] The minimum width of the spin box (float)
  - `min_fractional_digits`: `int` — [Read-Write] The minimum required fractional digits - default 1 (int32)
  - `min_slider_value`: `float` — [Read-Write] The minimum allowable value that can be specified using the slider (float)
  - `min_value`: `float` — [Read-Write] The minimum allowable value that can be manually entered into the spin box (float)
  - `on_begin_slider_movement`: `OnSpinBoxBeginSliderMovement` — [Read-Write] Called right before the slider begins to move (OnSpinBoxBeginSliderMovement)
  - `on_end_slider_movement`: `OnSpinBoxValueChangedEvent` — [Read-Write] Called right after the slider handle is released by the user (OnSpinBoxValueChangedEven...
  - `on_value_changed`: `OnSpinBoxValueChangedEvent` — [Read-Write] Called when the value is changed interactively by the user (OnSpinBoxValueChangedEvent)
  - `on_value_committed`: `OnSpinBoxValueCommittedEvent` — [Read-Write] Called when the value is committed. Occurs when the user presses Enter or the text box ...
  - `select_all_text_on_commit`: `bool` — [Read-Write] Whether to select the text in the spin box when the value is committed (bool)
  - `slider_exponent`: `float` — [Read-Write] The exponent by which to increase the delta as the mouse moves. 1 is constant (never in...
  - `value`: `float` — [Read-Write] Value stored in this spin box (float)
  - `widget_style`: `SpinBoxStyle` — [Read-Write] The Style (SpinBoxStyle)

### `unreal.StackBox`
Inherits: `PanelWidget` | Header: `StackBox.h`

A stack box widget is a layout panel allowing child widgets to be automatically laid out vertically or horizontally.

**Methods** (2):
  - `add_child_to_stack_box(content)` -> `StackBoxSlot` — Adds a new child widget to the container.
  - `replace_stack_box_child_at(index, content)` -> `bool` — Replace the widget at the given index it with a different widget.

**Properties** (1):
  - `orientation`: `Orientation` — [Read-Write] The orientation of the stack box. (Orientation)

### `unreal.StackBoxSlot`
Inherits: `PanelSlot` | Header: `StackBoxSlot.h`

The Slot for the UStackBox, contains the widget that is flowed vertically or horizontally.

**Properties** (4):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `size`: `SlateChildSize` — [Read-Write] How much space this slot should occupy in the direction of the panel. (SlateChildSize)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.TextBlock`
Inherits: `TextLayoutWidget` | Header: `TextBlock.h`

A simple static text widget.

**Methods** (16):
  - `get_dynamic_font_material()` -> `MaterialInstanceDynamic` — Get Dynamic Font Material
  - `get_dynamic_outline_material()` -> `MaterialInstanceDynamic` — Get Dynamic Outline Material
  - `get_text()` -> `Text` — Gets the widget text
  - `set_auto_wrap_text(auto_text_wrap)` -> `None` — Set the auto wrap for this text block.
  - `set_color_and_opacity(color_and_opacity)` -> `None` — Sets the color and opacity of the text in this text block
  - `set_font(font_info)` -> `None` — Dynamically set the font info for this text block
  - `set_font_material(material)` -> `None` — Set Font Material
  - `set_font_outline_material(material)` -> `None` — Set Font Outline Material
  - `set_min_desired_width(min_desired_width)` -> `None` — Set the minimum desired width for this text block
  - `set_opacity(opacity)` -> `None` — Sets the opacity of the text in this text block
  - `set_shadow_color_and_opacity(shadow_color_and_opacity)` -> `None` — Sets the color and opacity of the text drop shadow Note: if opacity is zero no shadow will be drawn
  - `set_shadow_offset(shadow_offset)` -> `None` — Sets the offset that the text drop shadow should be drawn at
  - `set_strike_brush(strike_brush)` -> `None` — Dynamically set the strike brush for this text block
  - `set_text(text)` -> `None` — Directly sets the widget text. Warning: This will wipe any binding created for the Text property!
  - `set_text_overflow_policy(overflow_policy)` -> `None` — Set the text overflow policy for this text block.
  - `set_text_transform_policy(transform_policy)` -> `None` — Set the text transformation policy for this text block.

**Properties** (11):
  - `color_and_opacity`: `SlateColor` — [Read-Write] The color of the text (SlateColor)
  - `font`: `SlateFontInfo` — [Read-Write] The font to render the text with (SlateFontInfo)
  - `min_desired_width`: `float` — [Read-Write] The minimum desired size for the text (float)
  - `shadow_color_and_opacity`: `LinearColor` — [Read-Write] The color of the shadow (LinearColor)
  - `shadow_offset`: `Vector2D` — [Read-Write] The direction the shadow is cast (Vector2D)
  - `simple_text_mode`: `bool` [Read-Only] — [Read-Only] If this is enabled, text shaping, wrapping, justification are disabled in favor of much ...
  - `strike_brush`: `SlateBrush` — [Read-Write] The brush to strike through text with (SlateBrush)
  - `text`: `Text` — [Read-Write] The text to display (Text)
  - `text_overflow_policy`: `TextOverflowPolicy` — [Read-Write] Sets what happens to text that is clipped and doesnât fit within the clip rect for th...
  - `text_transform_policy`: `TextTransformPolicy` — [Read-Write] The text transformation policy to apply to this text block. (TextTransformPolicy)
  - `wrap_with_invalidation_panel`: `bool` [Read-Only] — [Read-Only] If true, it will automatically wrap this text widget with an invalidation panel (bool)

### `unreal.TextLayoutWidget`
Inherits: `Widget` | Header: `TextWidgetTypes.h`

Base class for all widgets that use a text layout. Contains the common options that should be exposed for the underlying Slate widget.

**Properties** (8):
  - `apply_line_height_to_bottom_line`: `bool` — [Read-Write] Whether to leave extra space below the last line due to line height. (bool)
  - `auto_wrap_text`: `bool` — [Read-Write] True if weâre wrapping text automatically based on the computed horizontal space for ...
  - `justification`: `TextJustify` — [Read-Write] How the text should be aligned with the margin. (TextJustify)
  - `line_height_percentage`: `float` — [Read-Write] The amount to scale each lines height by. (float)
  - `margin`: `Margin` — [Read-Write] The amount of blank space left around the edges of text area. (Margin)
  - `shaped_text_options`: `ShapedTextOptions` — [Read-Write] Controls how the text within this widget should be shaped. (ShapedTextOptions)
  - `wrap_text_at`: `float` — [Read-Write] Whether text wraps onto a new line when itâs length exceeds this width; if this value...
  - `wrapping_policy`: `TextWrappingPolicy` — [Read-Write] The wrapping policy to use. (TextWrappingPolicy)

### `unreal.Throbber`
Inherits: `Widget` | Header: `Throbber.h`

A Throbber widget that shows several zooming circles in a row.

**Methods** (4):
  - `set_animate_horizontally(animate_horizontally)` -> `None` — Sets whether the pieces animate horizontally.
  - `set_animate_opacity(animate_opacity)` -> `None` — Sets whether the pieces animate their opacity.
  - `set_animate_vertically(animate_vertically)` -> `None` — Sets whether the pieces animate vertically.
  - `set_number_of_pieces(number_of_pieces)` -> `None` — Sets how many pieces there are

**Properties** (5):
  - `animate_horizontally`: `bool` — [Read-Write] Should the pieces animate horizontally? (bool)
  - `animate_opacity`: `bool` — [Read-Write] Should the pieces animate their opacity? (bool)
  - `animate_vertically`: `bool` — [Read-Write] Should the pieces animate vertically? (bool)
  - `image`: `SlateBrush` — [Read-Write] The animated pieces. (SlateBrush)
  - `number_of_pieces`: `int` — [Read-Write] How many pieces there are (int32)

### `unreal.TileView`
Inherits: `ListView` | Header: `TileView.h`

A ListView that presents the contents as a set of tiles all uniformly sized.

**Methods** (4):
  - `get_entry_height()` -> `float` — Gets the height of tile entries
  - `get_entry_width()` -> `float` — Gets the width of tile entries
  - `set_entry_height(new_height)` -> `None` — Sets the height of every tile entry
  - `set_entry_width(new_width)` -> `None` — Sets the width of every tile entry

### `unreal.TreeView`
Inherits: `ListView` | Header: `TreeView.h`

Similar to ListView, but can display a hierarchical tree of elements. The base items source for the tree identifies the root items, each of which can have n associated child items. There is no hard li...

**Methods** (3):
  - `collapse_all()` -> `None` — Collapses all currently expanded items
  - `expand_all()` -> `None` — Expands all items with children
  - `set_item_expansion(item, expand_item)` -> `None` — Attempts to expand/collapse the given item (only relevant if the item has children)

**Properties** (1):
  - `bp_on_item_expansion_changed`: `OnItemExpansionChangedDynamic` — [Read-Write] (OnItemExpansionChangedDynamic)

### `unreal.UMGSequencePlayer`
Inherits: `Object` | Header: `UMGSequencePlayer.h`

UMGSequence Player

**Methods** (2):
  - `get_user_tag()` -> `Name` — deprecated: Function âGetUserTagâ is deprecated.
  - `set_user_tag(user_tag)` -> `None` — Set User Tag deprecated: Function âSetUserTagâ is deprecated.

### `unreal.UniformGridPanel`
Inherits: `PanelWidget` | Header: `UniformGridPanel.h`

A panel that evenly divides up available space between all of its children.

**Methods** (4):
  - `add_child_to_uniform_grid(content, row = 0, column = 0)` -> `UniformGridSlot` — Add Child to Uniform Grid
  - `set_min_desired_slot_height(min_desired_slot_height)` -> `None` — Set Min Desired Slot Height
  - `set_min_desired_slot_width(min_desired_slot_width)` -> `None` — Set Min Desired Slot Width
  - `set_slot_padding(slot_padding)` -> `None` — Set Slot Padding

**Properties** (3):
  - `min_desired_slot_height`: `float` — [Read-Write] The minimum desired height of the slots (float)
  - `min_desired_slot_width`: `float` — [Read-Write] The minimum desired width of the slots (float)
  - `slot_padding`: `Margin` — [Read-Write] Padding given to each slot (Margin)

### `unreal.UniformGridSlot`
Inherits: `PanelSlot` | Header: `UniformGridSlot.h`

A slot for UUniformGridPanel, these slots all share the same size as the largest slot in the grid.

**Methods** (4):
  - `set_column(column)` -> `None` — Sets the column index of the slot, this determines what cell the slot is in the panel
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_row(row)` -> `None` — Sets the row index of the slot, this determines what cell the slot is in the panel
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (4):
  - `column`: `int` — [Read-Write] The column index of the cell this slot is in (int32)
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `row`: `int` — [Read-Write] The row index of the cell this slot is in (int32)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.UserListEntry`
Inherits: `Interface` | Header: `IUserListEntry.h`

User List Entry

**Methods** (3):
  - `bp_on_entry_released()` -> `None` — Called when this entry is released from the owning table and no longer represents any list item
  - `bp_on_item_expansion_changed(is_expanded)` -> `None` — Called when the expansion state of the item represented by this entry changes. Tree view entries only.
  - `bp_on_item_selection_changed(is_selected)` -> `None` — Called when the selection state of the item represented by this entry changes.

### `unreal.UserListEntryLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `IUserListEntry.h`

Static library to supply âfor freeâ functionality to widgets that implement IUserListEntry

**Methods** (3):
  - `get_owning_list_view(user_list_entry)` -> `ListViewBase` [classmethod] — Returns the list view that contains this entry.
  - `is_list_item_expanded(user_list_entry)` -> `bool` [classmethod] — Returns true if the item represented by this entry is currently expanded and showing its children. Tree view entries onl...
  - `is_list_item_selected(user_list_entry)` -> `bool` [classmethod] — Returns true if the item represented by this entry is currently selected in the owning list view.

### `unreal.UserObjectListEntry`
Inherits: `UserListEntry` | Header: `IUserObjectListEntry.h`

User Object List Entry

**Methods** (1):
  - `on_list_item_object_set(list_item_object)` -> `None` — Called when this entry is assigned a new item object to represent by the owning list view

### `unreal.UserObjectListEntryLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `IUserObjectListEntry.h`

Static library to supply âfor freeâ functionality to widgets that implement IUserListEntry

**Methods** (1):
  - `get_list_item_object(user_object_list_entry)` -> `Object` [classmethod] — Returns the item in the owning list view that this entry is currently assigned to represent.

### `unreal.UserWidget`
Inherits: `Widget` | Header: `UserWidget.h`

A widget that enables UI extensibility through WidgetBlueprint.

**Methods** (106):
  - `add_extension(extension_type)` -> `UserWidgetExtension` — Add the extension of the requested type.
  - `add_to_player_screen(z_order = 0)` -> `bool` — Adds the widget to the gameâs viewport in a section dedicated to the player. This is valuable in a split screen game w...
  - `add_to_viewport(z_order = 0)` -> `None` — Adds it to the gameâs viewport and fills the entire screen, unless SetDesiredSizeInViewport is called to explicitly se...
  - `bind_to_animation_event(animation, delegate, animation_event, user_tag = 'None')` -> `None` — Allows binding to a specific animationâs event.
  - `bind_to_animation_finished(animation, delegate)` -> `None` — Bind an animation finished delegate.
  - `bind_to_animation_started(animation, delegate)` -> `None` — Bind an animation started delegate.
  - `cancel_latent_actions()` -> `None` — Cancels any pending Delays or timer callbacks for this widget.
  - `construct()` -> `None` — Called after the underlying slate widget is constructed. Depending on how the slate object is used this event may be cal...
  - `destruct()` -> `None` — Called when a widget is no longer referenced causing the slate resource to destroyed. Just like Construct this event can...
  - `flush_animations()` -> `None` — Flushes all animations on all widgets to guarantee that any queued updates are processed before this call returns
  - `get_alignment_in_viewport()` -> `Vector2D` — Get Alignment in Viewport
  - `get_anchors_in_viewport()` -> `Anchors` — Get Anchors in Viewport
  - `get_animation_current_time(animation)` -> `float` — Gets the current time of the animation in this widget
  - `get_extension(extension_type)` -> `UserWidgetExtension` — Find the first extension of the requested type.
  - `get_extensions(extension_type)` -> `Array [ UserWidgetExtension ]` — Find the extensions of the requested type.
  - `get_is_visible()` -> `bool` — Get Is Visible deprecated: Use IsInViewport instead
  - `get_owning_player_camera_manager()` -> `PlayerCameraManager` — Gets the player camera manager associated with this UI.
  - `get_owning_player_pawn()` -> `Pawn` — Gets the player pawn associated with this UI.
  - `is_animation_playing(animation)` -> `bool` — Gets whether an animation is currently playing on this widget.
  - `is_animation_playing_forward(animation)` -> `bool` — returns true if the animation is currently playing forward, false otherwise.
  - `is_any_animation_playing()` -> `bool`
  - `is_interactable()` -> `bool` — Gets a value indicating if the widget is interactive.
  - `is_listening_for_input_action(action_name)` -> `bool` — Checks if the action has a registered callback with the input component.
  - `is_playing_animation()` -> `bool` — Are we currently playing any animations?
  - `listen_for_input_action(action_name, event_type, consume, callback)` -> `None` — Listens for a particular Player Input Action by name. This requires that those actions are being executed, and that weâ...
  - `on_added_to_focus_path(focus_event)` -> `None` — If focus is gained on on this widget or on a child widget and this widget is added to the focus path, and wasnât previ...
  - `on_analog_value_changed(my_geometry, analog_input_event)` -> `EventReply` — Called when an analog value changes on a button that supports analog
  - `on_animation_finished(animation)` -> `None` — Called when an animation has either played all the way through or is stopped
  - `on_animation_started(animation)` -> `None` — Called when an animation is started.
  - `on_drag_cancelled(pointer_event, operation)` -> `None` — Called when the user cancels the drag operation, typically when they simply release the mouse button after beginning a d...
  - `on_drag_detected(my_geometry, pointer_event)` -> `DragDropOperation` — Called when Slate detects that a widget started to be dragged.
  - `on_drag_enter(my_geometry, pointer_event, operation)` -> `None` — Called during drag and drop when the drag enters the widget.
  - `on_drag_leave(pointer_event, operation)` -> `None` — Called during drag and drop when the drag leaves the widget.
  - `on_drag_over(my_geometry, pointer_event, operation)` -> `bool` — Called during drag and drop when the the mouse is being dragged over a widget.
  - `on_drop(my_geometry, pointer_event, operation)` -> `bool` — Called when the user is dropping something onto a widget. Ends the drag and drop operation, even if no widget handles th...
  - `on_focus_lost(focus_event)` -> `None` — Called when this widget loses focus. This event does not bubble.
  - `on_focus_received(my_geometry, focus_event)` -> `EventReply` — Called when keyboard focus is given to this widget. This event does not bubble.
  - `on_initialized()` -> `None` — Called once only at game time on non-template instances. While Construct/Destruct pertain to the underlying Slate, this ...
  - `on_key_char(my_geometry, character_event)` -> `EventReply` — Called after a character is entered while this widget has focus
  - `on_key_down(my_geometry, key_event)` -> `EventReply` — Called after a key (keyboard, controller, â¦) is pressed when this widget has focus (this event bubbles if not handled)
  - `on_key_up(my_geometry, key_event)` -> `EventReply` — Called after a key (keyboard, controller, â¦) is released when this widget has focus
  - `on_motion_detected(my_geometry, motion_event)` -> `EventReply` — Called when motion is detected (controller or device) e.g. Someone tilts or shakes their controller.
  - `on_mouse_button_double_click(my_geometry, mouse_event)` -> `EventReply` — Called when a mouse button is double clicked. Override this in derived classes.
  - `on_mouse_button_down(my_geometry, mouse_event)` -> `EventReply` — The system calls this method to notify the widget that a mouse button was pressed within it. This event is bubbled.
  - `on_mouse_button_up(my_geometry, mouse_event)` -> `EventReply` — The system calls this method to notify the widget that a mouse button was release within it. This event is bubbled.
  - `on_mouse_capture_lost()` -> `None` — Called when mouse capture is lost if it was owned by this widget.
  - `on_mouse_enter(my_geometry, mouse_event)` -> `None` — The system will use this event to notify a widget that the cursor has entered it. This event is NOT bubbled.
  - `on_mouse_leave(mouse_event)` -> `None` — The system will use this event to notify a widget that the cursor has left it. This event is NOT bubbled.
  - `on_mouse_move(my_geometry, mouse_event)` -> `EventReply` — The system calls this method to notify the widget that a mouse moved within it. This event is bubbled.
  - `on_mouse_wheel(my_geometry, mouse_event)` -> `EventReply` — Called when the mouse wheel is spun. This event is bubbled.
  - `on_paint(context)` -> `PaintContext` — On Paint
  - `on_preview_key_down(my_geometry, key_event)` -> `EventReply` — Called after a key (keyboard, controller, â¦) is pressed when this widget or a child of this widget has focus If a widg...
  - `on_preview_mouse_button_down(my_geometry, mouse_event)` -> `EventReply` — Just like OnMouseButtonDown, but tunnels instead of bubbling. If this event is handled, OnMouseButtonDown will not be se...
  - `on_removed_from_focus_path(focus_event)` -> `None` — If focus is lost on on this widget or on a child widget and this widget is no longer part of the focus path.
  - `on_touch_ended(my_geometry, touch_event)` -> `EventReply` — Called when a touchpad touch is ended (finger lifted)
  - `on_touch_first_move(my_geometry, touch_event)` -> `EventReply` — Called when a touchpad touch is first moved (initial finger movement)
  - `on_touch_force_changed(my_geometry, touch_event)` -> `EventReply` — Called when a touchpad force has changed (user pressed down harder or let up)
  - `on_touch_gesture(my_geometry, gesture_event)` -> `EventReply` — Called when the user performs a gesture on trackpad. This event is bubbled.
  - `on_touch_moved(my_geometry, touch_event)` -> `EventReply` — Called when a touchpad touch is moved (finger moved)
  - `on_touch_started(my_geometry, touch_event)` -> `EventReply` — Called when a touchpad touch is started (finger down)
  - `pause_animation(animation)` -> `float` — Pauses an already running animation in this widget
  - `play_animation(animation, start_at_time = 0.000000, num_loops_to_play = 1, play_mode = UMGSequencePlayMode.FORWARD, playback_speed = 1.000000, restore_state = False)` -> `WidgetAnimationHandle` — Plays an animation in this widget a specified number of times
  - `play_animation_at_time(animation: WidgetAnimation, start_at_time: float = 0.0, num_loops_to_play: int = 1, play_mode: UMGSequencePlayMode = Ellipsis, playback_speed: float = 1.0, restore_state: bool = False)` -> `WidgetAnimationHandle` — deprecated: âplay_animation_at_timeâ was renamed to âplay_animationâ.
  - `play_animation_forward(animation, playback_speed = 1.000000, restore_state = False)` -> `WidgetAnimationHandle` — Plays an animation on this widget relative to itâs current state forward. You should use this version in situations wh...
  - `play_animation_reverse(animation, playback_speed = 1.000000, restore_state = False)` -> `WidgetAnimationHandle` — Plays an animation on this widget relative to itâs current state in reverse. You should use this version in situations...
  - `play_animation_time_range(animation, start_at_time = 0.000000, end_at_time = 0.000000, num_loops_to_play = 1, play_mode = UMGSequencePlayMode.FORWARD, playback_speed = 1.000000, restore_state = False)` -> `WidgetAnimationHandle` — Plays an animation in this widget a specified number of times stopping at a specified time
  - `play_animation_to(animation: WidgetAnimation, start_at_time: float = 0.0, end_at_time: float = 0.0, num_loops_to_play: int = 1, play_mode: UMGSequencePlayMode = Ellipsis, playback_speed: float = 1.0, restore_state: bool = False)` -> `WidgetAnimationHandle` — deprecated: âplay_animation_toâ was renamed to âplay_animation_time_rangeâ.
  - `play_sound(sound_to_play)` -> `None` — Plays a sound through the UI deprecated: Use the UGameplayStatics::PlaySound2D instead.
  - `pre_construct(is_design_time)` -> `None` — Called by both the game and the editor. Allows users to run initial setup for their widgets to better preview the setup ...
  - `queue_pause_animation(animation)` -> `float` — Pauses an already running animation in this widget
  - `queue_play_animation(animation, start_at_time = 0.000000, num_loops_to_play = 1, play_mode = UMGSequencePlayMode.FORWARD, playback_speed = 1.000000, restore_state = False)` -> `None` — Plays an animation in this widget a specified number of times
  - `queue_play_animation_forward(animation, playback_speed = 1.000000, restore_state = False)` -> `None` — Plays an animation on this widget relative to itâs current state forward. You should use this version in situations wh...
  - `queue_play_animation_reverse(animation, playback_speed = 1.000000, restore_state = False)` -> `None` — Plays an animation on this widget relative to itâs current state in reverse. You should use this version in situations...
  - `queue_play_animation_time_range(animation, start_at_time = 0.000000, end_at_time = 0.000000, num_loops_to_play = 1, play_mode = UMGSequencePlayMode.FORWARD, playback_speed = 1.000000, restore_state = False)` -> `None` — Plays an animation in this widget a specified number of times stopping at a specified time
  - `queue_stop_all_animations()` -> `None` — Stop All actively running animations.
  - `queue_stop_animation(animation)` -> `None` — Stops an already running animation in this widget
  - `register_input_component()` -> `None` — ListenForInputAction will automatically Register an Input Component with the player input system. If you however, want t...
  - `remove_extension(extension)` -> `None` — Remove the extension.
  - `remove_extensions(extension_type)` -> `None` — Remove all extensions of the requested type.
  - `remove_from_viewport()` -> `None` — Remove from Viewport deprecated: Use RemoveFromParent instead
  - `reverse_animation(animation)` -> `None` — If an animation is playing, this function will reverse the playback.
  - `set_alignment_in_viewport(alignment)` -> `None` — Set Alignment in Viewport
  - `set_anchors_in_viewport(anchors)` -> `None` — Set Anchors in Viewport
  - `set_animation_current_time(animation, time)` -> `None` — Sets the current time of the animation in this widget. Does not change state.
  - `set_color_and_opacity(color_and_opacity)` -> `None` — Sets the tint of the widget, this affects all child widgets.
  - `set_desired_focus_widget(widget)` -> `bool` — Sets the child Widget that should receive focus when this UserWidget gets focus.
  - `set_desired_size_in_viewport(size)` -> `None` — Set Desired Size in Viewport
  - `set_foreground_color(foreground_color)` -> `None` — Sets the foreground color of the widget, this is inherited by sub widgets. Any color property that is marked as inherit ...
  - `set_input_action_blocking(should_block)` -> `None` — Set Input Action Blocking
  - `set_input_action_priority(new_priority)` -> `None` — Set Input Action Priority
  - `set_num_loops_to_play(animation, num_loops_to_play)` -> `None` — Changes the number of loops to play given a playing animation
  - `set_owning_player(local_player_controller)` -> `None` — Sets the local player associated with this UI via PlayerController reference.
  - `set_padding(padding)` -> `None` — Sets the padding for the user widget, putting a larger gap between the widget border and itâs root widget.
  - `set_playback_speed(animation, playback_speed = 1.000000)` -> `None` — Changes the playback rate of a playing animation
  - `set_position_in_viewport(position, remove_dpi_scale = True)` -> `None` — Sets the widgets position in the viewport.
  - `stop_all_animations()` -> `None` — Stop All actively running animations.
  - `stop_animation(animation)` -> `None` — Stops an already running animation in this widget
  - `stop_animations_and_latent_actions()` -> `None` — Cancels any pending Delays or timer callbacks for this widget, and stops all active animations on the widget.
  - `stop_listening_for_all_input_actions()` -> `None` — Stops listening to all input actions, and unregisters the input component with the player controller.
  - `stop_listening_for_input_action(action_name, event_type)` -> `None` — Removes the binding for a particular actionâs callback.
  - `tick(my_geometry, delta_time)` -> `None` — Ticks this widget. Override in derived classes, but always call the parent implementation.
  - `unbind_all_from_animation_finished(animation)` -> `None` — Unbind All from Animation Finished
  - `unbind_all_from_animation_started(animation)` -> `None` — Unbind All from Animation Started
  - `unbind_from_animation_finished(animation, delegate)` -> `None` — Unbind an animation finished delegate.
  - `unbind_from_animation_started(animation, delegate)` -> `None` — Unbind an animation started delegate.
  - `unregister_input_component()` -> `None` — StopListeningForAllInputActions will automatically Register an Input Component with the player input system. If you howe...

**Properties** (8):
  - `color_and_opacity`: `LinearColor` — [Read-Write] The color and opacity of this widget.  Tints all child widgets. (LinearColor)
  - `foreground_color`: `SlateColor` — [Read-Write] The foreground color of the widget, this is inherited by sub widgets.  Any color proper...
  - `is_focusable`: `bool` — [Read-Write] Setting this flag to true, allows this widget to accept focus when clicked, or when nav...
  - `on_visibility_changed`: `OnVisibilityChangedEvent` — [Read-Write] Called when the visibility has changed (OnVisibilityChangedEvent)
  - `padding`: `Margin` — [Read-Write] The padding area around the content. (Margin)
  - `priority`: `int` — [Read-Write] (int32)
  - `stop_action`: `bool` — [Read-Write] (bool)
  - `tick_frequency`: `WidgetTickFrequency` [Read-Only] — [Read-Only] This widget is allowed to tick. If this is unchecked tick will never be called, animatio...

### `unreal.UserWidgetBlueprint`
Inherits: `Blueprint` | Header: `UserWidgetBlueprint.h`

User Widget Blueprint

### `unreal.UserWidgetExtension`
Inherits: `Object` | Header: `UserWidgetExtension.h`

UserWidgetExtension is the base class for components that define reusable behavior that can be added to different types of Widgets.

### `unreal.UserWidgetFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `UserWidget.h`

User Widget Function Library

**Methods** (1):
  - `conv_umg_sequence_player(widget_animation_handle)` -> `UMGSequencePlayer` [classmethod] — Conv UMGSequence Player deprecated: Function âConv_UMGSequencePlayerâ is deprecated.

### `unreal.VerticalBox`
Inherits: `PanelWidget` | Header: `VerticalBox.h`

A vertical box widget is a layout panel allowing child widgets to be automatically laid out vertically.

**Methods** (2):
  - `add_child_to_vertical_box(content)` -> `VerticalBoxSlot` — Add Child to Vertical Box
  - `add_child_vertical_box(content: Widget)` -> `VerticalBoxSlot` — deprecated: âadd_child_vertical_boxâ was renamed to âadd_child_to_vertical_boxâ.

### `unreal.VerticalBoxSlot`
Inherits: `PanelSlot` | Header: `VerticalBoxSlot.h`

The Slot for the UVerticalBox, contains the widget that is flowed vertically

**Methods** (4):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_size(size)` -> `None` — Set Size
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (4):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `size`: `SlateChildSize` — [Read-Write] How much space this slot should occupy in the direction of the panel. (SlateChildSize)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.Viewport`
Inherits: `ContentWidget` | Header: `Viewport.h`

**Methods** (11):
  - `get_view_location()` -> `Vector` — Get View Location
  - `get_view_projection_matrix()` -> `Matrix` — Get View Projection Matrix
  - `get_view_rotation()` -> `Rotator` — Get View Rotation
  - `get_viewport_world()` -> `World` — Get Viewport World
  - `set_enable_advanced_features(enable_advanced_features)` -> `None` — Set Enable Advanced Features
  - `set_light_intensity(light_intensity)` -> `None` — Set Light Intensity
  - `set_show_flag(show_flag_name, value)` -> `None` — Set Show Flag
  - `set_sky_intensity(light_intensity)` -> `None` — Set Sky Intensity
  - `set_view_location(location)` -> `None` — Set View Location
  - `set_view_rotation(rotation)` -> `None` — Set View Rotation
  - `spawn(actor_class)` -> `Actor` — Spawn

**Properties** (1):
  - `background_color`: `LinearColor` — [Read-Write] (LinearColor)

### `unreal.Visual`
Inherits: `Object` | Header: `Visual.h`

The base class for elements in UMG: slots and widgets.

### `unreal.Widget`
Inherits: `Visual` | Header: `Widget.h`

This is the base class for all wrapped Slate controls that are exposed to UObjects.

**Methods** (59):
  - `add_field_value_changed_delegate(field_id, delegate)` -> `None` — K2 Add Field Value Changed Delegate
  - `broadcast_field_value_changed(field_id)` -> `None` — K2 Broadcast Field Value Changed
  - `force_layout_prepass()` -> `None` — Forces a pre-pass. A pre-pass caches the desired size of the widget hierarchy owned by this widget. One pre-pass already...
  - `force_volatile(force)` -> `None` — Sets the forced volatility of the widget.
  - `get_accessible_summary_text()` -> `Text` — Gets the accessible summary text from the underlying Slate accessible widget.
  - `get_accessible_text()` -> `Text` — Gets the accessible text from the underlying Slate accessible widget
  - `get_cached_geometry()` -> `Geometry` — Gets the last geometry used to Tick the widget. This data may not exist yet if this call happens prior to the widget hav...
  - `get_clipping()` -> `WidgetClipping` — Gets the clipping state of this widget.
  - `get_desired_size()` -> `Vector2D` — Gets the widgets desired size. NOTE: The underlying Slate widget must exist and be valid, also at least one pre-pass mus...
  - `get_game_instance()` -> `GameInstance` — Gets the game instance associated with this UI.
  - `get_is_enabled()` -> `bool` — Gets the current enabled status of the widget
  - `get_opacity()` -> `float` — deprecated: âget_opacityâ was renamed to âget_render_opacityâ.
  - `get_owning_local_player()` -> `LocalPlayer` — Gets the local player associated with this UI.
  - `get_owning_player()` -> `PlayerController` — Gets the player controller associated with this UI.
  - `get_paint_space_geometry()` -> `Geometry` — Get Paint Space Geometry
  - `get_parent()` -> `PanelWidget` — Gets the parent widget
  - `get_render_opacity()` -> `float` — Gets the current visibility of the widget.
  - `get_render_transform_angle()` -> `float` — Get Render Transform Angle
  - `get_tick_space_geometry()` -> `Geometry` — Get Tick Space Geometry
  - `get_visibility()` -> `SlateVisibility` — Gets the current visibility of the widget.
  - `has_any_user_focus()` -> `bool` — Returns true if this widget is focused by any user.
  - `has_focused_descendants()` -> `bool` — Returns true if any descendant widget is focused by any user.
  - `has_keyboard_focus()` -> `bool` — Checks to see if this widget currently has the keyboard focus
  - `has_mouse_capture()` -> `bool` — Checks to see if this widget is the current mouse captor
  - `has_mouse_capture_by_user(user_index, pointer_index = -1)` -> `bool` — Checks to see if this widget is the current mouse captor
  - `has_user_focus(player_controller)` -> `bool` — Returns true if this widget is focused by a specific user.
  - `has_user_focused_descendants(player_controller)` -> `bool` — Returns true if any descendant widget is focused by a specific user.
  - `invalidate_layout_and_volatility()` -> `None` — Invalidates the widget from the view of a layout caching widget that may own this widget. will force the owning widget t...
  - `is_hovered()` -> `bool` — Returns true if the widget is currently being hovered by a pointer device
  - `is_in_viewport()` -> `bool`
  - `is_rendered()` -> `bool` — Returns true if the widget is Visible, HitTestInvisible or SelfHitTestInvisible and the Render Opacity is greater than 0...
  - `is_visible()` -> `bool` — Returns true if the widget is Visible, HitTestInvisible or SelfHitTestInvisible.
  - `remove_field_value_changed_delegate(field_id, delegate)` -> `None` — K2 Remove Field Value Changed Delegate
  - `remove_from_parent()` -> `None` — Removes the widget from its parent widget. If this widget was added to the playerâs screen or the viewport it will als...
  - `reset_cursor()` -> `None` — Resets the cursor to use on the widget, removing any customization for it.
  - `set_all_navigation_rules(rule, widget_to_focus)` -> `None` — Sets the widget navigation rules for all directions. This can only be called on widgets that are in a widget tree.
  - `set_clipping(clipping)` -> `None` — Sets the clipping state of this widget.
  - `set_cursor(cursor)` -> `None` — Sets the cursor to show over the widget.
  - `set_focus()` -> `None` — Sets the focus to this widget for the owning user
  - `set_is_enabled(is_enabled)` -> `None` — Sets the current enabled status of the widget
  - `set_keyboard_focus()` -> `None` — Sets the focus to this widget.
  - `set_navigation_rule(direction, rule, widget_to_focus)` -> `None` — Set Navigation Rule deprecated: Function âSetNavigationRuleâ is deprecated.
  - `set_navigation_rule_base(direction, rule)` -> `None` — Sets the widget navigation rules for a specific direction. This can only be called on widgets that are in a widget tree....
  - `set_navigation_rule_custom(direction, custom_delegate)` -> `None` — Sets the widget navigation rules for a specific direction. This can only be called on widgets that are in a widget tree....
  - `set_navigation_rule_custom_boundary(direction, custom_delegate)` -> `None` — Sets the widget navigation rules for a specific direction. This can only be called on widgets that are in a widget tree....
  - `set_navigation_rule_explicit(direction, widget)` -> `None` — Sets the widget navigation rules for a specific direction. This can only be called on widgets that are in a widget tree....
  - `set_opacity(opacity: float)` -> `None` — deprecated: âset_opacityâ was renamed to âset_render_opacityâ.
  - `set_render_angle(angle: float)` -> `None` — deprecated: âset_render_angleâ was renamed to âset_render_transform_angleâ.
  - `set_render_opacity(opacity)` -> `None` — Sets the visibility of the widget.
  - `set_render_scale(scale)` -> `None` — Set Render Scale
  - `set_render_shear(shear)` -> `None` — Set Render Shear
  - `set_render_transform(transform)` -> `None` — Set Render Transform
  - `set_render_transform_angle(angle)` -> `None` — Set Render Transform Angle
  - `set_render_transform_pivot(pivot)` -> `None` — Set Render Transform Pivot
  - `set_render_translation(translation)` -> `None` — Set Render Translation
  - `set_tool_tip(widget)` -> `None` — Sets a custom widget as the tooltip of the widget.
  - `set_tool_tip_text(tool_tip_text)` -> `None` — Sets the tooltip text for the widget.
  - `set_user_focus(player_controller)` -> `None` — Sets the focus to this widget for a specific user (if setting focus for the owning user, prefer SetFocus())
  - `set_visibility(visibility)` -> `None` — Sets the visibility of the widget.

**Properties** (17):
  - `clip_to_bounds`: `WidgetClipping` — âclip_to_boundsâ was renamed to âclippingâ. deprecated
  - `clipping`: `WidgetClipping` — [Read-Write] Controls how the clipping behavior of this widget.  Normally content that overflows the...
  - `cursor`: `MouseCursor` — [Read-Write] The cursor to show when the mouse is over the widget (MouseCursor)
  - `flow_direction_preference`: `FlowDirectionPreference` — [Read-Write] Allows you to set a new flow direction (FlowDirectionPreference)
  - `is_enabled`: `bool` — [Read-Write] Sets whether this widget can be modified interactively by the user (bool)
  - `is_volatile`: `bool` [Read-Only] — [Read-Only] If true prevents the widget or its childâs geometry or layout information from being c...
  - `navigation`: `WidgetNavigation` [Read-Only] — [Read-Only] The navigation object for this widget is optionally created if the user has configured c...
  - `opacity`: `float` — âopacityâ was renamed to ârender_opacityâ. deprecated
  - `pixel_snapping`: `WidgetPixelSnapping` — [Read-Write] If the widget will draw snapped to the nearest pixel.  Improves clarity but might cause...
  - `render_opacity`: `float` — [Read-Write] The opacity of the widget (float)
  - `render_transform`: `WidgetTransform` — [Read-Write] The render transform of the widget allows for arbitrary 2D transforms to be applied to ...
  - `render_transform_pivot`: `Vector2D` — [Read-Write] The render transform pivot controls the location about which transforms are applied.
Th...
  - `slot`: `PanelSlot` [Read-Only] — [Read-Only] The parent slot of the UWidget.  Allows us to easily inline edit the layout controlling ...
  - `tool_tip_text`: `Text` — [Read-Write] Tooltip text to show when the user hovers over the widget with the mouse (Text)
  - `tool_tip_widget`: `Widget` [Read-Only] — [Read-Only] Tooltip widget to show when the user hovers over the widget with the mouse (Widget)
  - `visibility`: `SlateVisibility` — [Read-Write] The visibility of the widget (SlateVisibility)
  - `visiblity`: `SlateVisibility` — âvisiblityâ was renamed to âvisibilityâ. deprecated

### `unreal.WidgetAnimation`
Inherits: `MovieSceneSequence` | Header: `WidgetAnimation.h`

Widget Animation

**Methods** (2):
  - `get_end_time()` -> `float` — Get the end time of this animation. see: GetStartTime
  - `get_start_time()` -> `float` — Get the start time of this animation. see: GetEndTime

### `unreal.WidgetAnimationHandleFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `WidgetAnimationHandle.h`

Widget Animation Handle Function Library

**Methods** (2):
  - `get_user_tag(target)` -> `Name` [classmethod] — Get User Tag
  - `set_user_tag(target, user_tag)` -> `WidgetAnimationHandle` [classmethod] — Set User Tag

### `unreal.WidgetAnimationPlayCallbackProxy`
Inherits: `Object` | Header: `WidgetAnimationPlayCallbackProxy.h`

Widget Animation Play Callback Proxy

**Properties** (1):
  - `finished`: `WidgetAnimationResult` — [Read-Write] Called when animation has been completed (WidgetAnimationResult)

### `unreal.WidgetBlueprintGeneratedClass`
Inherits: `BlueprintGeneratedClass` | Header: `WidgetBlueprintGeneratedClass.h`

The widget blueprint generated class allows us to create blueprint-able widgets for UMG at runtime. All WBPGCâs are of UUserWidget classes, and they perform special post initialization using this cl...

### `unreal.WidgetComponent`
Inherits: `MeshComponent` | Header: `WidgetComponent.h`

The widget component provides a surface in the 3D environment on which to render widgets normally rendered to the screen. Widgets are first rendered to a render target, then that render target is disp...

**Methods** (38):
  - `get_current_draw_size()` -> `Vector2D` — Returns the âactualâ draw size of the quad in the world
  - `get_cylinder_arc_angle()` -> `double` — Defines the curvature of the widget component when using EWidgetGeometryMode::Cylinder; ignored otherwise.
  - `get_draw_at_desired_size()` -> `bool` — Get Draw at Desired Size
  - `get_draw_size()` -> `Vector2D` — Returns the âspecifiedâ draw size of the quad in the world
  - `get_geometry_mode()` -> `WidgetGeometryMode` — see: EWidgetGeometryMode, see: GetCylinderArcAngle()
  - `get_manually_redraw()` -> `bool` — see: bManuallyRedraw
  - `get_material_instance()` -> `MaterialInstanceDynamic` — Returns the dynamic material instance used to render the user widget
  - `get_owner_player()` -> `LocalPlayer` — Gets the local player that owns this widget component.
  - `get_pivot()` -> `Vector2D` — Returns the pivot point where the UI is rendered about the origin.
  - `get_redraw_time()` -> `float` — Get Redraw Time
  - `get_render_target()` -> `TextureRenderTarget2D` — Returns the render target to which the user widget is rendered
  - `get_tick_when_offscreen()` -> `bool` — Gets whether the widget ticks when offscreen or not
  - `get_two_sided()` -> `bool` — Gets whether the widget is two-sided or not
  - `get_user_widget_object()` -> `UserWidget` — Returns the user widget object displayed by this component
  - `get_widget()` -> `UserWidget` — Gets the widget that is used by this Widget Component. It will be null if a Slate Widget was set using SetSlateWidget fu...
  - `get_widget_space()` -> `WidgetSpace` — Get Widget Space
  - `get_window_focusable()` -> `bool` — see: bWindowFocusable
  - `get_window_visiblility()` -> `WindowVisibility` — Gets the visibility of the virtual window created to host the widget focusable.
  - `is_widget_visible()` -> `bool` — Returns true if the the Slate window is visible and that the widget is also visible, false otherwise.
  - `request_redraw()` -> `None` — Requests that the widget be redrawn. deprecated: Use RequestRenderUpdate instead
  - `request_render_update()` -> `None` — Requests that the widget have itâs render target updated, if TickMode is disabled, this will force a tick to happen to...
  - `set_background_color(new_background_color)` -> `None` — Sets the background color and opacityscale for this widget
  - `set_cylinder_arc_angle(cylinder_arc_angle)` -> `None` — Defines the curvature of the widget component when using EWidgetGeometryMode::Cylinder; ignored otherwise.
  - `set_draw_at_desired_size(draw_at_desired_size)` -> `None` — Set Draw at Desired Size
  - `set_draw_size(size)` -> `None` — Sets the draw size of the quad in the world
  - `set_geometry_mode(geometry_mode)` -> `None` — Set Geometry Mode
  - `set_manually_redraw(use_manual_redraw)` -> `None` — see: bManuallyRedraw
  - `set_owner_player(local_player)` -> `None` — Sets the local player that owns this widget component. Setting the owning player controls which playerâs viewport the ...
  - `set_pivot(pivot)` -> `None` — Set Pivot
  - `set_redraw_time(redraw_time)` -> `None` — Set Redraw Time
  - `set_tick_mode(tick_mode)` -> `None` — Sets the Tick mode of the Widget Component.
  - `set_tick_when_offscreen(want_tick_when_offscreen)` -> `None` — Sets whether the widget ticks when offscreen or not
  - `set_tint_color_and_opacity(new_tint_color_and_opacity)` -> `None` — Sets the tint color and opacity scale for this widget
  - `set_two_sided(want_two_sided)` -> `None` — Sets whether the widget is two-sided or not
  - `set_widget(widget)` -> `None`
  - `set_widget_space(new_space)` -> `None` — Set Widget Space
  - `set_window_focusable(window_focusable)` -> `None` — see: bWindowFocusable
  - `set_window_visibility(visibility)` -> `None` — Sets the visibility of the virtual window created to host the widget focusable.

### `unreal.WidgetInteractionComponent`
Inherits: `SceneComponent` | Header: `WidgetInteractionComponent.h`

This is a component to allow interaction with the Widget Component. This class allows you to simulate a sort of laser pointer device, when it hovers over widgets it will send the basic signals to show...

**Methods** (15):
  - `get2d_hit_location()` -> `Vector2D` — Gets the last hit location on the widget in 2D, local pixel units of the render target.
  - `get_hovered_widget_component()` -> `WidgetComponent` — Get the currently hovered widget component.
  - `get_last_hit_result()` -> `HitResult` — Gets the last hit result generated by the component. Returns the custom hit result if that was set.
  - `is_over_focusable_widget()` -> `bool` — Returns true if a widget under the hit result is focusable. e.g. Slate widgets that return true for SupportsKeyboardFocu...
  - `is_over_hit_test_visible_widget()` -> `bool` — Returns true if a widget under the hit result is has a visibility that makes it hit test visible. e.g. Slate widgets tha...
  - `is_over_interactable_widget()` -> `bool` — Returns true if a widget under the hit result is interactive. e.g. Slate widgets that return true for IsInteractable().
  - `press_and_release_key(key)` -> `bool` — Does both the press and release of a simulated keyboard key.
  - `press_key(key, repeat = False)` -> `bool` — Press a key as if it had come from the keyboard. Avoid using this for âa-z|A-Zâ, things like the Editable Textbox in...
  - `press_pointer_key(key)` -> `None` — Presses a key as if the mouse/pointer were the source of it. Normally you would just use Left/Right mouse button for the...
  - `release_key(key)` -> `bool` — Releases a key as if it had been released by the keyboard.
  - `release_pointer_key(key)` -> `None` — Releases a key as if the mouse/pointer were the source of it. Normally you would just use Left/Right mouse button for th...
  - `scroll_wheel(scroll_delta)` -> `None` — Sends a scroll wheel event to the widget under the last hit result.
  - `send_key_char(characters, repeat = False)` -> `bool` — Transmits a list of characters to a widget by simulating a OnKeyChar event for each key listed in the string.
  - `set_custom_hit_result(hit_result)` -> `None` — Set custom hit result. This is only taken into account if InteractionSource is set to EWidgetInteractionSource::Custom.
  - `set_focus(focus_widget)` -> `None` — Set the focus target of the virtual user managed by this component

**Properties** (11):
  - `debug_color`: `LinearColor` — [Read-Write] Determines the color of the debug lines. (LinearColor)
  - `debug_line_thickness`: `float` — [Read-Write] Determines the thickness of the debug lines. (float)
  - `debug_sphere_line_thickness`: `float` — [Read-Write] Determines the line thickness of the debug sphere. (float)
  - `enable_hit_testing`: `bool` — [Read-Write] Should the interaction component perform hit testing (Automatic or Custom) and attempt ...
  - `interaction_distance`: `float` — [Read-Write] The distance in game units the component should be able to interact with a widget compo...
  - `interaction_source`: `WidgetInteractionSource` — [Read-Write] Should we project from the world location of the component?  If you set this to false, ...
  - `on_hovered_widget_changed`: `OnHoveredWidgetChanged` — [Read-Write] Called when the hovered Widget Component changes.  The interaction component functions ...
  - `pointer_index`: `int` — [Read-Write] Each user virtual controller or virtual finger tips being simulated should use a differ...
  - `show_debug`: `bool` — [Read-Write] Shows some debugging lines and a hit sphere to help you debug interactions. (bool)
  - `trace_channel`: `CollisionChannel` — [Read-Write] The trace channel to use when tracing for widget components in the world. (CollisionCha...
  - `virtual_user_index`: `int` — [Read-Write] Represents the Virtual User Index.  Each virtual user should be represented by a differ...

### `unreal.WidgetLayoutLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `WidgetLayoutLibrary.h`

Widget Layout Library

**Methods** (23):
  - `get_mouse_position_on_platform()` -> `Vector2D` [classmethod] — Gets the platformâs mouse cursor position. This is the âabsoluteâ desktop location of the mouse.
  - `get_mouse_position_on_viewport(world_context_object)` -> `Vector2D` [classmethod] — Gets the platformâs mouse cursor position in the local space of the viewport widget.
  - `get_mouse_position_scaled_by_dpi(player)` -> `(location_x=float, location_y=float) or None` [classmethod] — Gets the mouse position of the player controller, scaled by the DPI. If youâre trying to go from raw mouse screenspace...
  - `get_player_screen_widget_geometry(player_controller)` -> `Geometry` [classmethod] — Gets the geometry of the widget holding all widgets added to the âPlayer Screenâ. You can use this geometry to conve...
  - `get_viewport_scale(world_context_object)` -> `float` [classmethod] — Gets the current DPI Scale being applied to the viewport and all the Widgets.
  - `get_viewport_size(world_context_object)` -> `Vector2D` [classmethod] — Gets the size of the game viewport.
  - `get_viewport_widget_geometry(world_context_object)` -> `Geometry` [classmethod] — Gets the geometry of the widget holding all widgets added to the âViewportâ. You can use this geometry to convert be...
  - `project_world_location_to_widget_position(player_controller, world_location, player_viewport_relative)` -> `Vector2D or None` [classmethod] — Gets the projected world to screen position for a player, then converts it into a widget position, which takes into acco...
  - `remove_all_widgets(world_context_object)` -> `None` [classmethod] — Removes all widgets from the viewport.
  - `slot_as_border_slot(widget)` -> `BorderSlot` [classmethod] — Gets the slot object on the child widget as a Border Slot, allowing you to manipulate layout information.
  - `slot_as_canvas_slot(widget)` -> `CanvasPanelSlot` [classmethod] — Gets the slot object on the child widget as a Canvas Slot, allowing you to manipulate layout information.
  - `slot_as_grid_slot(widget)` -> `GridSlot` [classmethod] — Gets the slot object on the child widget as a Grid Slot, allowing you to manipulate layout information.
  - `slot_as_horizontal_box_slot(widget)` -> `HorizontalBoxSlot` [classmethod] — Gets the slot object on the child widget as a Horizontal Box Slot, allowing you to manipulate its information.
  - `slot_as_overlay_slot(widget)` -> `OverlaySlot` [classmethod] — Gets the slot object on the child widget as a Overlay Slot, allowing you to manipulate layout information.
  - `slot_as_safe_box_slot(widget)` -> `SafeZoneSlot` [classmethod] — Gets the slot object on the child widget as a Safe Box Slot, allowing you to manipulate its information.
  - `slot_as_scale_box_slot(widget)` -> `ScaleBoxSlot` [classmethod] — Gets the slot object on the child widget as a Scale Box Slot, allowing you to manipulate its information.
  - `slot_as_scroll_box_slot(widget)` -> `ScrollBoxSlot` [classmethod] — Gets the slot object on the child widget as a Scroll Box Slot, allowing you to manipulate its information.
  - `slot_as_size_box_slot(widget)` -> `SizeBoxSlot` [classmethod] — Gets the slot object on the child widget as a Size Box Slot, allowing you to manipulate its information.
  - `slot_as_stack_box_slot(widget)` -> `StackBoxSlot` [classmethod] — Gets the slot object on the child widget as a Stack Box Slot, allowing you to manipulate its information.
  - `slot_as_uniform_grid_slot(widget)` -> `UniformGridSlot` [classmethod] — Gets the slot object on the child widget as a Uniform Grid Slot, allowing you to manipulate layout information.
  - `slot_as_vertical_box_slot(widget)` -> `VerticalBoxSlot` [classmethod] — Gets the slot object on the child widget as a Vertical Box Slot, allowing you to manipulate its information.
  - `slot_as_widget_switcher_slot(widget)` -> `WidgetSwitcherSlot` [classmethod] — Gets the slot object on the child widget as a Widget Switcher Slot, allowing you to manipulate its information.
  - `slot_as_wrap_box_slot(widget)` -> `WrapBoxSlot` [classmethod] — Gets the slot object on the child widget as a Wrap Box Slot, allowing you to manipulate its information.

### `unreal.WidgetLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `WidgetBlueprintLibrary.h`

Widget Blueprint Library

**Methods** (52):
  - `cancel_drag_drop()` -> `None` [classmethod] — Cancels any current drag drop operation.
  - `capture_joystick(reply, capturing_widget, reply=EventReply)` [classmethod] — Capture Joystick deprecated: Use SetUserFocus() instead
  - `capture_mouse(reply, reply=EventReply)` [classmethod] — Capture Mouse
  - `clear_user_focus(reply, reply=EventReply)` [classmethod] — Clear User Focus
  - `detect_drag(reply, widget_detecting_drag, reply=EventReply)` [classmethod] — Ask Slate to detect if a user starts dragging in this widget later. Slate internally tracks the movement and if it surpa...
  - `detect_drag_if_pressed(pointer_event, widget_detecting_drag, drag_key)` -> `EventReply` [classmethod] — Given the pointer event, emit the DetectDrag reply if the provided key was pressed. If the DragKey is a touch key, that ...
  - `dismiss_all_menus()` -> `None` [classmethod] — Closes any popup menu
  - `draw_box(context, position, size, brush, tint = [1.000000,1.000000,1.000000,1.000000])` -> `PaintContext` [classmethod] — Draws a box
  - `draw_line(context, position_a, position_b, tint = [1.000000,1.000000,1.000000,1.000000], anti_alias = True, thickness = 1.000000)` -> `PaintContext` [classmethod] — Draws a line.
  - `draw_lines(context, points, tint = [1.000000,1.000000,1.000000,1.000000], anti_alias = True, thickness = 1.000000)` -> `PaintContext` [classmethod] — Draws several line segments.
  - `draw_spline(context, start, start_dir, end, end_dir, tint = [1.000000,1.000000,1.000000,1.000000], thickness = 1.000000)` -> `PaintContext` [classmethod] — Draws a hermite spline.
  - `draw_text(context, string, position, tint = [1.000000,1.000000,1.000000,1.000000])` -> `PaintContext` [classmethod] — Draws text. deprecated: Use Draw Text instead
  - `draw_text_formatted(context, text, position, font, font_size = 16.000000, font_type_face = 'Regular', tint = [1.000000,1.000000,1.000000,1.000000])` -> `PaintContext` [classmethod] — Draws text.
  - `end_drag_drop(reply=EventReply)` [classmethod] — An event should return FReply::Handled().EndDragDrop() to request that the current drag/drop operation be terminated.
  - `get_all_widgets_of_class(world_context_object, widget_class, top_level_only = True)` -> `Array [ UserWidget ]` [classmethod] — Find all widgets of a certain class.
  - `get_all_widgets_with_interface(world_context_object, interface, top_level_only)` -> `Array [ UserWidget ]` [classmethod] — Find all widgets in the world with the specified interface. This is a slow operation, use with caution e.g. do not use e...
  - `get_brush_resource(brush)` -> `Object` [classmethod] — Gets the resource object on a brush. This could be a UTexture2D or a UMaterialInterface.
  - `get_brush_resource_as_material(brush)` -> `MaterialInterface` [classmethod] — Gets the brush resource as a material.
  - `get_brush_resource_as_texture2d(brush)` -> `Texture2D` [classmethod] — Gets the brush resource as a texture 2D.
  - `get_drag_dropping_content()` -> `DragDropOperation` [classmethod] — Returns the drag and drop operation that is currently occurring if any, otherwise nothing.
  - `get_dynamic_material(brush=SlateBrush)` [classmethod] — Gets the material that allows changes to parameters at runtime. The brush must already have a material assigned to it, i...
  - `get_input_event_from_character_event(event)` -> `InputEvent` [classmethod] — Get Input Event from Character Event
  - `get_input_event_from_key_event(event)` -> `InputEvent` [classmethod] — Get Input Event from Key Event
  - `get_input_event_from_navigation_event(event)` -> `InputEvent` [classmethod] — Get Input Event from Navigation Event
  - `get_input_event_from_pointer_event(event)` -> `InputEvent` [classmethod] — Get Input Event from Pointer Event
  - `get_key_event_from_analog_input_event(event)` -> `KeyEvent` [classmethod] — Get Key Event from Analog Input Event
  - `get_safe_zone_padding(safe_padding_scale=Vector2D, spill_over_padding=Vector4)` [classmethod] — Gets the amount of padding that needs to be added when accounting for the safe zone on TVs.
  - `handled()` -> `EventReply` [classmethod] — The event reply to use when you choose to handle an event. This will prevent the event from continuing to bubble up / do...
  - `is_drag_dropping()` -> `bool` [classmethod] — Returns true if a drag/drop event is occurring that a widget can handle.
  - `lock_mouse(reply, reply=EventReply)` [classmethod] — Lock Mouse
  - `make_brush_from_asset(brush_asset)` -> `SlateBrush` [classmethod] — Creates a Slate Brush from a Slate Brush Asset
  - `make_brush_from_material(material, width = 32, height = 32)` -> `SlateBrush` [classmethod] — Creates a Slate Brush from a Material. Materials donât have an implicit size, so providing a widget and height is requ...
  - `make_brush_from_texture(texture, width = 0, height = 0)` -> `SlateBrush` [classmethod] — Creates a Slate Brush from a Texture2D
  - `no_resource_brush()` -> `SlateBrush` [classmethod] — Creates a Slate Brush that wont draw anything, the âNull Brushâ.
  - `release_joystick_capture(reply, reply=EventReply)` [classmethod] — Release Joystick Capture deprecated: Use ClearUserFocus() instead
  - `release_mouse_capture(reply=EventReply)` [classmethod] — Release Mouse Capture
  - `restore_previous_window_title_bar_state()` -> `None` [classmethod] — Restore Previous Window Title Bar State
  - `set_brush_resource_to_material(brush, material)` -> `SlateBrush` [classmethod] — Sets the resource on a brush to be a Material.
  - `set_brush_resource_to_texture(brush, texture)` -> `SlateBrush` [classmethod] — Sets the resource on a brush to be a UTexture2D.
  - `set_color_vision_deficiency_type(type, severity, correct_deficiency, show_correction_with_deficiency)` -> `None` [classmethod] — Apply color deficiency correction settings to the game window
  - `set_focus_to_game_viewport()` -> `None` [classmethod] — Set Focus to Game Viewport
  - `set_hardware_cursor(world_context_object, cursor_shape, cursor_name, hot_spot)` -> `bool` [classmethod] — Loads or sets a hardware cursor from the content directory in the game.
  - `set_input_mode_game_and_ui_ex(player_controller, widget_to_focus = None, mouse_lock_mode = MouseLockMode.DO_NOT_LOCK, hide_cursor_during_capture = True, flush_input = False)` -> `None` [classmethod] — Setup an input mode that allows only the UI to respond to user input, and if the UI doesnât handle it player input / p...
  - `set_input_mode_game_only(player_controller, flush_input = False)` -> `None` [classmethod] — Setup an input mode that allows only player input / player controller to respond to user input. Note: Any bound Input Ev...
  - `set_input_mode_ui_only_ex(player_controller, widget_to_focus = None, mouse_lock_mode = MouseLockMode.DO_NOT_LOCK, flush_input = False)` -> `None` [classmethod] — Setup an input mode that allows only the UI to respond to user input. Note: This means that any bound Input Events in th...
  - `set_mouse_position(reply, reply=EventReply)` [classmethod] — Set Mouse Position
  - `set_user_focus(reply, focus_widget, reply=EventReply)` [classmethod] — Set User Focus
  - `set_window_title_bar_close_button_active(active)` -> `None` [classmethod] — Set Window Title Bar Close Button Active
  - `set_window_title_bar_on_close_clicked_delegate(delegate)` -> `None` [classmethod] — Set Window Title Bar on Close Clicked Delegate
  - `set_window_title_bar_state(title_bar_content, mode, title_bar_drag_enabled, window_buttons_visible, title_bar_visible)` -> `None` [classmethod] — Set Window Title Bar State
  - `unhandled()` -> `EventReply` [classmethod] — The event reply to use when you choose not to handle an event.
  - `unlock_mouse(reply=EventReply)` [classmethod] — Unlock Mouse

### `unreal.WidgetNavigation`
Inherits: `Object` | Header: `WidgetNavigation.h`

Widget Navigation

**Properties** (6):
  - `down`: `WidgetNavigationData` [Read-Only] — [Read-Only] Happens when the user presses down arrow, joystick, d-pad. (WidgetNavigationData)
  - `left`: `WidgetNavigationData` [Read-Only] — [Read-Only] Happens when the user presses left arrow, joystick, d-pad. (WidgetNavigationData)
  - `next`: `WidgetNavigationData` [Read-Only] — [Read-Only] Happens when the user presses Tab. (WidgetNavigationData)
  - `previous`: `WidgetNavigationData` [Read-Only] — [Read-Only] Happens when the user presses Shift+Tab. (WidgetNavigationData)
  - `right`: `WidgetNavigationData` [Read-Only] — [Read-Only] Happens when the user presses right arrow, joystick, d-pad. (WidgetNavigationData)
  - `up`: `WidgetNavigationData` [Read-Only] — [Read-Only] Happens when the user presses up arrow, joystick, d-pad. (WidgetNavigationData)

### `unreal.WidgetSwitcher`
Inherits: `PanelWidget` | Header: `WidgetSwitcher.h`

A widget switcher is like a tab control, but without tabs. At most one widget is visible at time.

**Methods** (6):
  - `get_active_widget()` -> `Widget` — Get the reference of the currently active widget
  - `get_active_widget_index()` -> `int32` — Gets the slot index of the currently active widget
  - `get_num_widgets()` -> `int32` — Gets the number of widgets that this switcher manages.
  - `get_widget_at_index(index)` -> `Widget` — Get a widget at the provided index
  - `set_active_widget(widget)` -> `None` — Activates the widget and makes it the active index.
  - `set_active_widget_index(index)` -> `None` — Activates the widget at the specified index.

**Properties** (1):
  - `active_widget_index`: `int` — [Read-Write] The slot index to display (int32)

### `unreal.WidgetSwitcherSlot`
Inherits: `PanelSlot` | Header: `WidgetSwitcherSlot.h`

The Slot for the UWidgetSwitcher, contains the widget that is flowed vertically

**Methods** (3):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (3):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.WidgetTree`
Inherits: `Object` | Header: `WidgetTree.h`

The widget tree manages the collection of widgets in a blueprint widget.

### `unreal.WindowTitleBarArea`
Inherits: `ContentWidget` | Header: `WindowTitleBarArea.h`

A panel for defining a region of the UI that should allow users to drag the window on desktop platforms.

**Methods** (3):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (2):
  - `double_click_toggles_fullscreen`: `bool` — [Read-Write] Should double clicking the title bar area toggle fullscreen instead of maximizing the w...
  - `window_buttons_enabled`: `bool` — [Read-Write] Should the title bar area diaplay window minimize/maximize/close buttons. (bool)

### `unreal.WindowTitleBarAreaSlot`
Inherits: `PanelSlot` | Header: `WindowTitleBarAreaSlot.h`

The Slot for the UWindowTitleBarArea

**Methods** (3):
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (3):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.WrapBox`
Inherits: `PanelWidget` | Header: `WrapBox.h`

Arranges widgets left-to-right or top-to-bottom dependently of the orientation. When the widgets exceed the wrapSize it will place widgets on the next line.

**Methods** (4):
  - `add_child_to_wrap_box(content)` -> `WrapBoxSlot` — Add Child to Wrap Box
  - `add_child_wrap_box(content: Widget)` -> `WrapBoxSlot` — deprecated: âadd_child_wrap_boxâ was renamed to âadd_child_to_wrap_boxâ.
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_inner_slot_padding(padding)` -> `None` — Sets the inner slot padding goes between slots sharing borders

**Properties** (5):
  - `explicit_wrap_size`: `bool` — [Read-Write] Use explicit wrap size whenever possible. It greatly simplifies layout calculations and...
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of each line of wrapped content. (HorizontalAlignment)
  - `inner_slot_padding`: `Vector2D` — [Read-Write] The inner slot padding goes between slots sharing borders (Vector2D)
  - `orientation`: `Orientation` — [Read-Write] Determines if the Wrap Box should arranges the widgets left-to-right or top-to-bottom (...
  - `wrap_size`: `float` — [Read-Write] When this size is exceeded, elements will start appearing on the next line. (float)

### `unreal.WrapBoxSlot`
Inherits: `PanelSlot` | Header: `WrapBoxSlot.h`

The Slot for the UWrapBox, contains the widget that is flowed vertically

**Methods** (6):
  - `set_fill_empty_space(inb_fill_empty_space)` -> `None` — Set Fill Empty Space
  - `set_fill_span_when_less_than(fill_span_when_less_than)` -> `None` — Set Fill Span when Less Than
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_new_line(force_new_line)` -> `None` — Set New Line
  - `set_padding(padding)` -> `None` — Set Padding
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment

**Properties** (6):
  - `fill_empty_space`: `bool` — [Read-Write] Should this slot fill the remaining space on the line? (bool)
  - `fill_span_when_less_than`: `float` — [Read-Write] If the total available space in the wrap panel drops below this threshold, this slot wi...
  - `force_new_line`: `bool` — [Read-Write] Should this slot start on a new line? (bool)
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] The alignment of the object horizontally. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] The padding area between the slot and the content it contains. (Margin)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] The alignment of the object vertically. (VerticalAlignment)

### `unreal.DragPivot`
Inherits: `EnumBase` | Header: `DragDropOperation.h`

Controls where the drag widget visual will appear when dragged relative to the pointer performing the drag operation.

**Properties** (10):
  - `BOTTOM_CENTER`: `DragPivot = Ellipsis` — 8
  - `BOTTOM_LEFT`: `DragPivot = Ellipsis` — 7
  - `BOTTOM_RIGHT`: `DragPivot = Ellipsis` — 9
  - `CENTER_CENTER`: `DragPivot = Ellipsis` — 5
  - `CENTER_LEFT`: `DragPivot = Ellipsis` — 4
  - `CENTER_RIGHT`: `DragPivot = Ellipsis` — 6
  - `MOUSE_DOWN`: `DragPivot = Ellipsis` — 0
  - `TOP_CENTER`: `DragPivot = Ellipsis` — 2
  - `TOP_LEFT`: `DragPivot = Ellipsis` — 1
  - `TOP_RIGHT`: `DragPivot = Ellipsis` — 3

### `unreal.DynamicBoxType`
Inherits: `EnumBase` | Header: `DynamicEntryBoxBase.h`

EDynamic Box Type

**Properties** (6):
  - `HORIZONTAL`: `DynamicBoxType = Ellipsis` — 0
  - `OVERLAY`: `DynamicBoxType = Ellipsis` — 5
  - `RADIAL`: `DynamicBoxType = Ellipsis` — 4
  - `VERTICAL`: `DynamicBoxType = Ellipsis` — 1
  - `VERTICAL_WRAP`: `DynamicBoxType = Ellipsis` — 3
  - `WRAP`: `DynamicBoxType = Ellipsis` — 2

### `unreal.SlateAccessibleBehavior`
Inherits: `EnumBase` | Header: `SlateWrapperTypes.h`

Whether a widget should be included in accessibility, and if so, how its text should be retrieved.

**Properties** (5):
  - `AUTO`: `SlateAccessibleBehavior = Ellipsis` — Accessible, first checking to see if thereâs any custom default text assigned for widgets of this ...
  - `CUSTOM`: `SlateAccessibleBehavior = Ellipsis` — Accessible, and retrieve manually-assigned text from a TAttribute. 3
  - `NOT_ACCESSIBLE`: `SlateAccessibleBehavior = Ellipsis` — Not accessible. 0
  - `SUMMARY`: `SlateAccessibleBehavior = Ellipsis` — Accessible, and traverse all child widgets and concat their AccessibleSummaryText together. 2
  - `TOOL_TIP`: `SlateAccessibleBehavior = Ellipsis` — Accessible, and use the tooltipâs accessible text. 4

### `unreal.SlateSizeRule`
Inherits: `EnumBase` | Header: `SlateWrapperTypes.h`

The sizing options of UWidgets

**Properties** (2):
  - `AUTOMATIC`: `SlateSizeRule = Ellipsis` — Only requests as much room as it needs based on the widgets desired size. 0
  - `FILL`: `SlateSizeRule = Ellipsis` — Greedily attempts to fill all available room based on the percentage value 0..1 1

### `unreal.SlateVisibility`
Inherits: `EnumBase` | Header: `SlateWrapperTypes.h`

Is an entity visible?

**Properties** (5):
  - `COLLAPSED`: `SlateVisibility = Ellipsis` — Not visible and takes up no space in the layout (obviously not hit-testable). 1
  - `HIDDEN`: `SlateVisibility = Ellipsis` — Not visible but occupies layout space (obviously not hit-testable). 2
  - `HIT_TEST_INVISIBLE`: `SlateVisibility = Ellipsis` — Visible but not hit-testable (cannot interact with cursor) and children in the hierarchy (if any) ar...
  - `SELF_HIT_TEST_INVISIBLE`: `SlateVisibility = Ellipsis` — Visible but not hit-testable (cannot interact with cursor) and doesnât affect hit-testing on child...
  - `VISIBLE`: `SlateVisibility = Ellipsis` — Visible and hit-testable (can interact with cursor). Default value. 0

### `unreal.TickMode`
Inherits: `EnumBase` | Header: `WidgetComponent.h`

ETick Mode

**Properties** (3):
  - `AUTOMATIC`: `TickMode = Ellipsis` — The component is ticked only when needed. i.e. when visible. 2
  - `DISABLED`: `TickMode = Ellipsis` — The component tick is disabled until re-enabled. 0
  - `ENABLED`: `TickMode = Ellipsis` — The component is always ticked 1

### `unreal.UMGSequencePlayMode`
Inherits: `EnumBase` | Header: `UMGSequencePlayMode.h`

Describes playback modes for UMG sequences.

**Properties** (3):
  - `FORWARD`: `UMGSequencePlayMode = Ellipsis` — Animation plays and loops from the beginning to the end. 0
  - `PING_PONG`: `UMGSequencePlayMode = Ellipsis` — Animation plays from the beginning to the end and then from the end to the beginning. 2
  - `REVERSE`: `UMGSequencePlayMode = Ellipsis` — Animation plays and loops from the end to the beginning. 1

### `unreal.VirtualKeyboardType`
Inherits: `EnumBase` | Header: `SlateWrapperTypes.h`

EVirtual Keyboard Type

**Properties** (6):
  - `ALPHA_NUMERIC`: `VirtualKeyboardType = Ellipsis` — 5
  - `DEFAULT`: `VirtualKeyboardType = Ellipsis` — 0
  - `EMAIL`: `VirtualKeyboardType = Ellipsis` — 3
  - `NUMBER`: `VirtualKeyboardType = Ellipsis` — 1
  - `PASSWORD`: `VirtualKeyboardType = Ellipsis` — 4
  - `WEB`: `VirtualKeyboardType = Ellipsis` — 2

### `unreal.WidgetAnimationEvent`
Inherits: `EnumBase` | Header: `UserWidget.h`

Different animation events.

**Properties** (2):
  - `FINISHED`: `WidgetAnimationEvent = Ellipsis` — 1
  - `STARTED`: `WidgetAnimationEvent = Ellipsis` — 0

### `unreal.WidgetBlendMode`
Inherits: `EnumBase` | Header: `WidgetComponent.h`

EWidget Blend Mode

**Properties** (3):
  - `MASKED`: `WidgetBlendMode = Ellipsis` — 1
  - `OPAQUE`: `WidgetBlendMode = Ellipsis` — 0
  - `TRANSPARENT`: `WidgetBlendMode = Ellipsis` — 2

### `unreal.WidgetGeometryMode`
Inherits: `EnumBase` | Header: `WidgetComponent.h`

EWidget Geometry Mode

**Properties** (2):
  - `CYLINDER`: `WidgetGeometryMode = Ellipsis` — The widget is mapped onto a cylinder 1
  - `PLANE`: `WidgetGeometryMode = Ellipsis` — The widget is mapped onto a plane 0

### `unreal.WidgetInteractionSource`
Inherits: `EnumBase` | Header: `WidgetInteractionComponent.h`

The interaction source for the widget interaction component, e.g. where do we try and trace from to try to find a widget under a virtual pointer device.

**Properties** (4):
  - `CENTER_SCREEN`: `WidgetInteractionSource = Ellipsis` — Sends trace from the center of the first local playerâs screen. 2
  - `CUSTOM`: `WidgetInteractionSource = Ellipsis` — Sends traces from a custom location determined by the user.  Will use whatever
FHitResult is set by ...
  - `MOUSE`: `WidgetInteractionSource = Ellipsis` — Sends traces from the mouse location of the first local player controller. 1
  - `WORLD`: `WidgetInteractionSource = Ellipsis` — Sends traces from the world location and orientation of the interaction component. 0

### `unreal.WidgetSpace`
Inherits: `EnumBase` | Header: `WidgetComponent.h`

EWidget Space

**Properties** (2):
  - `SCREEN`: `WidgetSpace = Ellipsis` — The widget is rendered in the screen, completely outside of the world, never occluded. 1
  - `WORLD`: `WidgetSpace = Ellipsis` — The widget is rendered in the world as mesh, it can be occluded like any other mesh in the world. 0

### `unreal.WidgetTickFrequency`
Inherits: `EnumBase` | Header: `UserWidget.h`

Determines what strategy we use to determine when and if the widget ticks.

**Properties** (2):
  - `AUTO`: `WidgetTickFrequency = Ellipsis` — This widget will tick if a blueprint tick function is implemented, any latent actions are found or a...
  - `NEVER`: `WidgetTickFrequency = Ellipsis` — This widget never ticks 0

### `unreal.WidgetTimingPolicy`
Inherits: `EnumBase` | Header: `WidgetComponent.h`

EWidget Timing Policy

**Properties** (2):
  - `GAME_TIME`: `WidgetTimingPolicy = Ellipsis` — The widget will tick using game time, respecting pausing and time dilation. 1
  - `REAL_TIME`: `WidgetTimingPolicy = Ellipsis` — The widget will tick using real time. When not ticking, real time will accumulate and be simulated o...

### `unreal.WindowVisibility`
Inherits: `EnumBase` | Header: `WidgetComponent.h`

EWindow Visibility

**Properties** (2):
  - `SELF_HIT_TEST_INVISIBLE`: `WindowVisibility = Ellipsis` — The window visibility is SelfHitTestInvisible 1
  - `VISIBLE`: `WindowVisibility = Ellipsis` — The window visibility is Visible 0

### `unreal.ComboBoxKey_GenerateWidgetEvent`
Inherits: `DelegateBase` | Header: `ComboBoxKey.h`

Generate Widget Event Delegate Signature

### `unreal.ComboBoxKey_OnOpeningEvent`
Inherits: `MulticastDelegateBase` | Header: `ComboBoxKey.h`

On Opening Event Delegate Signature

### `unreal.ComboBoxKey_OnSelectionChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `ComboBoxKey.h`

On Selection Changed Event Delegate Signature

### `unreal.ComboBoxString_OnOpeningEvent`
Inherits: `MulticastDelegateBase` | Header: `ComboBoxString.h`

On Opening Event Delegate Signature

### `unreal.ComboBoxString_OnSelectionChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `ComboBoxString.h`

On Selection Changed Event Delegate Signature

### `unreal.CustomWidgetNavigationDelegate`
Inherits: `DelegateBase` | Header: `WidgetNavigation.h`

Custom Widget Navigation Delegate Delegate Signature

### `unreal.DownloadImageDelegate`
Inherits: `MulticastDelegateBase` | Header: `AsyncTaskDownloadImage.h`

Download Image Delegate Delegate Signature

### `unreal.EditableText_OnEditableTextChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `EditableText.h`

On Editable Text Changed Event Delegate Signature

### `unreal.EditableText_OnEditableTextCommittedEvent`
Inherits: `MulticastDelegateBase` | Header: `EditableText.h`

On Editable Text Committed Event Delegate Signature

### `unreal.EditableTextBox_OnEditableTextBoxChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `EditableTextBox.h`

On Editable Text Box Changed Event Delegate Signature

### `unreal.EditableTextBox_OnEditableTextBoxCommittedEvent`
Inherits: `MulticastDelegateBase` | Header: `EditableTextBox.h`

On Editable Text Box Committed Event Delegate Signature

### `unreal.InputKeySelector_OnIsSelectingKeyChanged`
Inherits: `MulticastDelegateBase` | Header: `InputKeySelector.h`

On Is Selecting Key Changed Delegate Signature

### `unreal.InputKeySelector_OnKeySelected`
Inherits: `MulticastDelegateBase` | Header: `InputKeySelector.h`

On Key Selected Delegate Signature

### `unreal.MenuAnchor_GetUserWidget`
Inherits: `DelegateBase` | Header: `MenuAnchor.h`

Get User Widget Delegate Signature

### `unreal.MultiLineEditableText_OnMultiLineEditableTextChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `MultiLineEditableText.h`

On Multi Line Editable Text Changed Event Delegate Signature

### `unreal.MultiLineEditableText_OnMultiLineEditableTextCommittedEvent`
Inherits: `MulticastDelegateBase` | Header: `MultiLineEditableText.h`

On Multi Line Editable Text Committed Event Delegate Signature

### `unreal.MultiLineEditableTextBox_OnMultiLineEditableTextBoxChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `MultiLineEditableTextBox.h`

On Multi Line Editable Text Box Changed Event Delegate Signature

### `unreal.MultiLineEditableTextBox_OnMultiLineEditableTextBoxCommittedEvent`
Inherits: `MulticastDelegateBase` | Header: `MultiLineEditableTextBox.h`

On Multi Line Editable Text Box Committed Event Delegate Signature

### `unreal.OnButtonClickedEvent`
Inherits: `MulticastDelegateBase` | Header: `Button.h`

On Button Clicked Event Delegate Signature

### `unreal.OnButtonHoverEvent`
Inherits: `MulticastDelegateBase` | Header: `Button.h`

On Button Hover Event Delegate Signature

### `unreal.OnButtonPressedEvent`
Inherits: `MulticastDelegateBase` | Header: `Button.h`

On Button Pressed Event Delegate Signature

### `unreal.OnButtonReleasedEvent`
Inherits: `MulticastDelegateBase` | Header: `Button.h`

On Button Released Event Delegate Signature

### `unreal.OnCheckBoxComponentStateChanged`
Inherits: `MulticastDelegateBase` | Header: `CheckBox.h`

On Check Box Component State Changed Delegate Signature

### `unreal.OnConstructEvent`
Inherits: `MulticastDelegateBase` | Header: `UserWidget.h`

On Construct Event Delegate Signature

### `unreal.OnControllerCaptureBeginEvent`
Inherits: `MulticastDelegateBase` | Header: `Slider.h`

On Controller Capture Begin Event Delegate Signature

### `unreal.OnControllerCaptureEndEvent`
Inherits: `MulticastDelegateBase` | Header: `Slider.h`

On Controller Capture End Event Delegate Signature

### `unreal.OnDragDropMulticast`
Inherits: `MulticastDelegateBase` | Header: `DragDropOperation.h`

On Drag Drop Multicast Delegate Signature

### `unreal.OnExpandableAreaExpansionChanged`
Inherits: `MulticastDelegateBase` | Header: `ExpandableArea.h`

On Expandable Area Expansion Changed Delegate Signature

### `unreal.OnFloatValueChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `Slider.h`

On Float Value Changed Event Delegate Signature

### `unreal.OnGetItemChildrenDynamic`
Inherits: `DelegateBase` | Header: `TreeView.h`

On Get Item Children Dynamic Delegate Signature

### `unreal.OnHoveredWidgetChanged`
Inherits: `MulticastDelegateBase` | Header: `WidgetInteractionComponent.h`

TODO Come up with a better way to let people forward a lot of keyboard input without a bunch of glue

### `unreal.OnInputAction`
Inherits: `DelegateBase` | Header: `UserWidget.h`

On Input Action Delegate Signature

### `unreal.OnIsItemSelectableOrNavigableDynamic`
Inherits: `DelegateBase` | Header: `ListView.h`

On Is Item Selectable or Navigable Dynamic Delegate Signature

### `unreal.OnItemExpansionChangedDynamic`
Inherits: `MulticastDelegateBase` | Header: `TreeView.h`

On Item Expansion Changed Dynamic Delegate Signature

### `unreal.OnItemIsHoveredChangedDynamic`
Inherits: `MulticastDelegateBase` | Header: `ListView.h`

On Item Is Hovered Changed Dynamic Delegate Signature

### `unreal.OnListEntriesGeneratedDynamic`
Inherits: `MulticastDelegateBase` | Header: `ListViewBase.h`

On List Entries Generated Dynamic Delegate Signature

### `unreal.OnListEntryGeneratedDynamic`
Inherits: `MulticastDelegateBase` | Header: `ListViewBase.h`

On List Entry Generated Dynamic Delegate Signature

### `unreal.OnListEntryInitializedDynamic`
Inherits: `MulticastDelegateBase` | Header: `ListView.h`

On List Entry Initialized Dynamic Delegate Signature

### `unreal.OnListEntryReleasedDynamic`
Inherits: `MulticastDelegateBase` | Header: `ListViewBase.h`

On List Entry Released Dynamic Delegate Signature

### `unreal.OnListItemScrolledIntoViewDynamic`
Inherits: `MulticastDelegateBase` | Header: `ListView.h`

On List Item Scrolled Into View Dynamic Delegate Signature

### `unreal.OnListItemSelectionChangedDynamic`
Inherits: `MulticastDelegateBase` | Header: `ListView.h`

On List Item Selection Changed Dynamic Delegate Signature

### `unreal.OnListViewFinishedScrollingDynamic`
Inherits: `MulticastDelegateBase` | Header: `ListView.h`

On List View Finished Scrolling Dynamic Delegate Signature

### `unreal.OnListViewScrolledDynamic`
Inherits: `MulticastDelegateBase` | Header: `ListView.h`

On List View Scrolled Dynamic Delegate Signature

### `unreal.OnMenuOpenChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `MenuAnchor.h`

On Menu Open Changed Event Delegate Signature

### `unreal.OnMouseCaptureBeginEvent`
Inherits: `MulticastDelegateBase` | Header: `Slider.h`

On Mouse Capture Begin Event Delegate Signature

### `unreal.OnMouseCaptureEndEvent`
Inherits: `MulticastDelegateBase` | Header: `Slider.h`

On Mouse Capture End Event Delegate Signature

### `unreal.OnScrollBarVisibilityChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `ScrollBox.h`

On Scroll Bar Visibility Changed Event Delegate Signature

### `unreal.OnScrollBoxFocusLostEvent`
Inherits: `MulticastDelegateBase` | Header: `ScrollBox.h`

On Scroll Box Focus Lost Event Delegate Signature

### `unreal.OnScrollBoxFocusReceivedEvent`
Inherits: `MulticastDelegateBase` | Header: `ScrollBox.h`

On Scroll Box Focus Received Event Delegate Signature

### `unreal.OnUserScrolledEvent`
Inherits: `MulticastDelegateBase` | Header: `ScrollBox.h`

On User Scrolled Event Delegate Signature

### `unreal.OnVisibilityChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `UserWidget.h`

On Visibility Changed Event Delegate Signature

### `unreal.OnWidgetAnimationPlaybackStatusChanged`
Inherits: `MulticastDelegateBase` | Header: `WidgetAnimationEvents.h`

On Widget Animation Playback Status Changed Delegate Signature

### `unreal.SimpleListItemEventDynamic`
Inherits: `MulticastDelegateBase` | Header: `ListView.h`

Simple List Item Event Dynamic Delegate Signature

### `unreal.SlateAccessibleWidgetData_GetText`
Inherits: `DelegateBase` | Header: `SlateWrapperTypes.h`

Get Text Delegate Signature

### `unreal.SpinBox_OnSpinBoxBeginSliderMovement`
Inherits: `MulticastDelegateBase` | Header: `SpinBox.h`

On Spin Box Begin Slider Movement Delegate Signature

### `unreal.SpinBox_OnSpinBoxValueChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `SpinBox.h`

On Spin Box Value Changed Event Delegate Signature

### `unreal.SpinBox_OnSpinBoxValueCommittedEvent`
Inherits: `MulticastDelegateBase` | Header: `SpinBox.h`

On Spin Box Value Committed Event Delegate Signature

### `unreal.Widget_GenerateWidgetForObject`
Inherits: `DelegateBase` | Header: `Widget.h`

Generate Widget for Object Delegate Signature

### `unreal.Widget_GenerateWidgetForString`
Inherits: `DelegateBase` | Header: `Widget.h`

Events

### `unreal.Widget_GetBool`
Inherits: `DelegateBase` | Header: `Widget.h`

### `unreal.Widget_GetCheckBoxState`
Inherits: `DelegateBase` | Header: `Widget.h`

Get Check Box State Delegate Signature

### `unreal.Widget_GetFloat`
Inherits: `DelegateBase` | Header: `Widget.h`

Get Float Delegate Signature

### `unreal.Widget_GetInt32`
Inherits: `DelegateBase` | Header: `Widget.h`

Get Int 32 Delegate Signature

### `unreal.Widget_GetLinearColor`
Inherits: `DelegateBase` | Header: `Widget.h`

Get Linear Color Delegate Signature

### `unreal.Widget_GetMouseCursor`
Inherits: `DelegateBase` | Header: `Widget.h`

Get Mouse Cursor Delegate Signature

### `unreal.Widget_GetSlateBrush`
Inherits: `DelegateBase` | Header: `Widget.h`

Get Slate Brush Delegate Signature

### `unreal.Widget_GetSlateColor`
Inherits: `DelegateBase` | Header: `Widget.h`

Get Slate Color Delegate Signature

### `unreal.Widget_GetSlateVisibility`
Inherits: `DelegateBase` | Header: `Widget.h`

Get Slate Visibility Delegate Signature

### `unreal.Widget_GetText`
Inherits: `DelegateBase` | Header: `Widget.h`

Get Text Delegate Signature

### `unreal.Widget_GetWidget`
Inherits: `DelegateBase` | Header: `Widget.h`

Get Widget Delegate Signature

### `unreal.Widget_OnPointerEvent`
Inherits: `DelegateBase` | Header: `Widget.h`

On Pointer Event Delegate Signature

### `unreal.Widget_OnReply`
Inherits: `DelegateBase` | Header: `Widget.h`

Events

### `unreal.WidgetAnimationDynamicEvent`
Inherits: `DelegateBase` | Header: `WidgetAnimationEvents.h`

Widget Animation Dynamic Event Delegate Signature

### `unreal.WidgetAnimationDynamicEvents`
Inherits: `MulticastDelegateBase` | Header: `WidgetAnimationEvents.h`

Widget Animation Dynamic Events Delegate Signature

### `unreal.WidgetAnimationResult`
Inherits: `MulticastDelegateBase` | Header: `WidgetAnimationPlayCallbackProxy.h`

Widget Animation Result Delegate Signature

### `unreal.WidgetLibrary_OnGameWindowCloseButtonClickedDelegate`
Inherits: `DelegateBase` | Header: `WidgetBlueprintLibrary.h`

On Game Window Close Button Clicked Delegate Delegate Signature
