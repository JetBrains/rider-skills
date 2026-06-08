# UE Python API — ToolWidgets Module

**1 types** from the `ToolWidgets` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ActionButtonStyle`

---

## Classes

### `unreal.ActionButtonStyle`
Inherits: `SlateWidgetStyle` | Header: `ToolWidgetsSlateTypes.h`

Represents the appearance of an SActionButton

**Properties** (13):
  - `action_button_type`: `Name` — [Read-Write] The type to use for our SActionButton. (Name)
  - `button_content_padding`: `type` — [Read-Write] Spacing between buttonâs border and the content. Default uses ButtonStyle. (âundefi...
  - `button_style`: `ButtonStyle` — [Read-Write] The style to use for our SButton. (ButtonStyle)
  - `combo_button_content_padding`: `type` — [Read-Write] Spacing between buttonâs border and the content. Default uses ComboButtonStyle. (âu...
  - `combo_button_style`: `ComboButtonStyle` — [Read-Write] The style to use for our SComboButton. (ComboButtonStyle)
  - `has_down_arrow`: `bool` — [Read-Write] Whether to show a down arrow for the combo button (bool)
  - `horizontal_content_alignment`: `HorizontalAlignment` — [Read-Write] Horizontal Content alignment within the button. (HorizontalAlignment)
  - `icon_brush`: `type` — [Read-Write] Icon Brush to use. (âundefinedâ)
  - `icon_button_style`: `type` — [Read-Write] The style to use for our SButton when an icon is present. ButtonStyle used if not speci...
  - `icon_color_and_opacity`: `type` — [Read-Write] Icon Color/Tint, defaults is determined by ActionButtonType. (âundefinedâ)
  - `icon_normal_padding`: `type` — [Read-Write] If set and the buttonâs icon is non-null, overrides the button styleâs additional s...
  - `icon_pressed_padding`: `type` — [Read-Write] If set and the buttonâs icon is non-null, overrides the button styleâs additional s...
  - `text_block_style`: `TextBlockStyle` — [Read-Write] The style to use for the button Text. (TextBlockStyle)
