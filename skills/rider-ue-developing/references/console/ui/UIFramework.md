# UE Python API — UIFramework Module

**24 types** from the `UIFramework` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `UIFrameworkCanvasBoxSlot`, `UIFrameworkClickEventArgument`, `UIFrameworkGameLayerSlot`, `UIFrameworkOverlaySlot`, `UIFrameworkParentWidget`, `UIFrameworkSimpleEventArgument`, `UIFrameworkSimpleSlot`, `UIFrameworkSlotBase`, `UIFrameworkStackBoxSlot`, `UIFrameworkUserWidgetNamedSlot`, `UIFrameworkButton`, `UIFrameworkButtonWidget`, `UIFrameworkCanvasBox`, `UIFrameworkColorBlock`, `UIFrameworkImageBlock`, `UIFrameworkOverlay`, `UIFrameworkPlayerComponent`, `UIFrameworkStackBox`, `UIFrameworkTextBase`, `UIFrameworkTextBlock`, ... (24 total)

---

## Classes

### `unreal.UIFrameworkCanvasBoxSlot`
Inherits: `UIFrameworkSlotBase` | Header: `UIFCanvasBox.h`

UIFramework Canvas Box Slot

**Properties** (5):
  - `alignment`: `Vector2D` — [Read-Write] Alignment is the pivot point of the widget.  Starting in the upper left at (0,0),
endin...
  - `anchors`: `Anchors` — [Read-Write] Anchors. (Anchors)
  - `offsets`: `Margin` — [Read-Write] Offset. (Margin)
  - `size_to_content`: `bool` — [Read-Write] When true we use the widgetâs desired size (bool)
  - `z_order`: `int` — [Read-Write] The order priority this widget is rendered inside the layer. Higher values are rendered...

### `unreal.UIFrameworkClickEventArgument`
Inherits: `UIFrameworkSimpleEventArgument` | Header: `UIFEvents.h`

UIFramework Click Event Argument

### `unreal.UIFrameworkGameLayerSlot`
Inherits: `UIFrameworkSlotBase` | Header: `UIFPlayerComponent.h`

UIFramework Game Layer Slot

**Properties** (3):
  - `input_mode`: `UIFrameworkInputMode` — [Read-Write] (UIFrameworkInputMode)
  - `type`: `UIFrameworkGameLayerType` — [Read-Write] (UIFrameworkGameLayerType)
  - `z_order`: `int` — [Read-Write] (int32)

### `unreal.UIFrameworkOverlaySlot`
Inherits: `UIFrameworkSlotBase` | Header: `UIFOverlay.h`

UIFramework Overlay Slot

**Properties** (3):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] Horizontal alignment of the widget inside the slot. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] Distance between that surrounds the widget inside the slot. (Margin)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] Vertical alignment of the widget inside the slot. (VerticalAlignment)

### `unreal.UIFrameworkParentWidget`
Inherits: `StructBase` | Header: `UIFParentWidget.h`

UIFramework Parent Widget

### `unreal.UIFrameworkSimpleEventArgument`
Inherits: `StructBase` | Header: `UIFEvents.h`

UIFramework Simple Event Argument

### `unreal.UIFrameworkSimpleSlot`
Inherits: `UIFrameworkSlotBase` | Header: `UIFSlotBase.h`

UIFramework Simple Slot

**Properties** (3):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] (Margin)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] (VerticalAlignment)

### `unreal.UIFrameworkSlotBase`
Inherits: `FastArraySerializerItem` | Header: `UIFSlotBase.h`

UIFramework Slot Base

**Properties** (1):
  - `widget`: `UIFrameworkWidget` — [Read-Write] (UIFrameworkWidget)

### `unreal.UIFrameworkStackBoxSlot`
Inherits: `UIFrameworkSlotBase` | Header: `UIFStackBox.h`

UIFramework Stack Box Slot

**Properties** (4):
  - `horizontal_alignment`: `HorizontalAlignment` — [Read-Write] Horizontal alignment of the widget inside the slot. (HorizontalAlignment)
  - `padding`: `Margin` — [Read-Write] Distance between that surrounds the widget inside the slot. (Margin)
  - `size`: `SlateChildSize` — [Read-Write] How much space this slot should occupy in the direction of the panel. (SlateChildSize)
  - `vertical_alignment`: `VerticalAlignment` — [Read-Write] Vertical alignment of the widget inside the slot. (VerticalAlignment)

### `unreal.UIFrameworkUserWidgetNamedSlot`
Inherits: `UIFrameworkSlotBase` | Header: `UIFUserWidget.h`

UIFramework User Widget Named Slot

**Properties** (1):
  - `slot_name`: `Name` — [Read-Write] The name of the NamedSlot (Name)

### `unreal.UIFrameworkButton`
Inherits: `UIFrameworkWidget` | Header: `UIFButton.h`

UIFramework Button

**Methods** (2):
  - `get_content()` -> `UIFrameworkSimpleSlot` — Get Content
  - `set_content(content)` -> `None` — Set Content

### `unreal.UIFrameworkButtonWidget`
Inherits: `Button` | Header: `UIFButton.h`

UIFramework Button Widget

### `unreal.UIFrameworkCanvasBox`
Inherits: `UIFrameworkWidget` | Header: `UIFCanvasBox.h`

UIFramework Canvas Box

**Methods** (2):
  - `add_widget(widget)` -> `None` — Add Widget
  - `remove_widget(widget)` -> `None` — Remove Widget

### `unreal.UIFrameworkColorBlock`
Inherits: `UIFrameworkWidget` | Header: `UIFColorBlock.h`

UIFramework Color Block

**Methods** (4):
  - `get_color()` -> `LinearColor` — Get Color
  - `get_desired_size()` -> `Vector2f` — Get Desired Size
  - `set_color(tint)` -> `None` — Set Color
  - `set_desired_size(desired_size)` -> `None` — Set Desired Size

### `unreal.UIFrameworkImageBlock`
Inherits: `UIFrameworkWidget` | Header: `UIFImageBlock.h`

UIFramework Image Block

**Methods** (9):
  - `ge_resource_object()` -> `Object` — Ge Resource Object
  - `get_desired_size()` -> `Vector2f` — Get Desired Size
  - `get_tiling()` -> `SlateBrushTileType` — Get Tiling
  - `get_tint()` -> `LinearColor` — Get Tint
  - `set_desired_size(desired_size)` -> `None` — Set Desired Size
  - `set_material(material)` -> `None` — Set Material
  - `set_texture(texture, use_texture_size)` -> `None` — Set Texture
  - `set_tiling(overflow_policy)` -> `None` — Set Tiling
  - `set_tint(tint)` -> `None` — Set Tint

### `unreal.UIFrameworkOverlay`
Inherits: `UIFrameworkWidget` | Header: `UIFOverlay.h`

UIFramework Overlay

**Methods** (2):
  - `add_widget(widget)` -> `None` — Add Widget
  - `remove_widget(widget)` -> `None` — Remove Widget

### `unreal.UIFrameworkPlayerComponent`
Inherits: `ActorComponent` | Header: `UIFPlayerComponent.h`

UIFramework Player Component

**Methods** (2):
  - `add_widget(widget)` -> `None` — Add Widget
  - `remove_widget(widget)` -> `None` — Remove Widget

### `unreal.UIFrameworkStackBox`
Inherits: `UIFrameworkWidget` | Header: `UIFStackBox.h`

UIFramework Stack Box

**Methods** (2):
  - `add_widget(widget)` -> `None` — Add Widget
  - `remove_widget(widget)` -> `None` — Remove Widget

**Properties** (1):
  - `orientation`: `Orientation` — [Read-Write] The orientation of the stack box. (Orientation)

### `unreal.UIFrameworkTextBase`
Inherits: `UIFrameworkWidget` | Header: `UIFTextBlock.h`

UIFramework Text Base

**Methods** (7):
  - `get_justification()` -> `TextJustify` — Get Justification
  - `get_overflow_policy()` -> `TextOverflowPolicy` — Get Overflow Policy
  - `get_text()` -> `Text` — Get Text
  - `get_text_color()` -> `LinearColor` — Get Text Color
  - `set_justification(justification)` -> `None` — Set Justification
  - `set_overflow_policy(overflow_policy)` -> `None` — Set Overflow Policy
  - `set_text_color(text_color)` -> `None` — Set Text Color

### `unreal.UIFrameworkTextBlock`
Inherits: `UIFrameworkTextBase` | Header: `UIFTextBlock.h`

UIFramework Text Block

**Methods** (4):
  - `get_shadow_color()` -> `LinearColor` — Get Shadow Color
  - `get_shadow_offset()` -> `Vector2f` — Get Shadow Offset
  - `set_shadow_color(shadow_color)` -> `None` — Set Shadow Color
  - `set_shadow_offset(shadow_offset)` -> `None` — Set Shadow Offset

### `unreal.UIFrameworkUserWidget`
Inherits: `UIFrameworkWidget` | Header: `UIFUserWidget.h`

UIFramework User Widget

**Methods** (3):
  - `get_named_slot(slot_name)` -> `UIFrameworkWidget` — Get Named Slot
  - `set_named_slot(slot_name, widget)` -> `None` — Set Named Slot
  - `set_widget_class(value)` -> `None` — Set Widget Class

### `unreal.UIFrameworkWidget`
Inherits: `MVVMViewModelBase` | Header: `UIFWidget.h`

UIFramework Widget

**Properties** (5):
  - `is_enabled`: `bool` — [Read-Write] (bool)
  - `is_hit_test_visible`: `bool` — [Read-Write] (bool)
  - `render_opacity`: `float` — [Read-Write] (double)
  - `visibility`: `SlateVisibility` — [Read-Write] (SlateVisibility)
  - `widget_class`: `Class` [Read-Only] — [Read-Only] (Class)

### `unreal.UIFrameworkGameLayerType`
Inherits: `EnumBase` | Header: `UIFPlayerComponent.h`

EUIFramework Game Layer Type

**Properties** (2):
  - `PLAYER_SCREEN`: `UIFrameworkGameLayerType = Ellipsis` — 1
  - `VIEWPORT`: `UIFrameworkGameLayerType = Ellipsis` — 0

### `unreal.UIFrameworkInputMode`
Inherits: `EnumBase` | Header: `UIFPlayerComponent.h`

EUIFramework Input Mode

**Properties** (2):
  - `GAME`: `UIFrameworkInputMode = Ellipsis` — Input is received by the Game. 1
  - `UI`: `UIFrameworkInputMode = Ellipsis` — // Input is received by the UI. 0
