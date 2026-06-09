# UE Python API — UMGWidgetPreview Module

**3 types** from the `UMGWidgetPreview` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PreviewableWidgetVariant`, `WidgetPreview`, `WidgetPreviewFactory`

---

## Classes

### `unreal.PreviewableWidgetVariant`
Inherits: `StructBase` | Header: `WidgetPreview.h`

Previewable Widget Variant

**Properties** (1):
  - `object_path`: `SoftObjectPath` [Read-Only] — [Read-Only] (SoftObjectPath)

### `unreal.WidgetPreview`
Inherits: `Object` | Header: `WidgetPreview.h`

Widget Preview

**Methods** (2):
  - `get_available_widget_slot_names()` -> `Array [ Name ]` — Returns slot names not already occupied in SlotWidgets.
  - `get_widget_slot_names()` -> `Array [ Name ]` — Get Widget Slot Names

**Properties** (4):
  - `overridden_widget_size`: `Vector2D` — [Read-Write] (Vector2D)
  - `should_override_widget_size`: `bool` — [Read-Write] Widget Custom Size Override (bool)
  - `slot_widget_types`: `None` — [Read-Write] Widget per-slot, if WidgetType has any. (Map[Name,PreviewableWidgetVariant])
  - `widget_type`: `PreviewableWidgetVariant` — [Read-Write] Widget to preview. (PreviewableWidgetVariant)

### `unreal.WidgetPreviewFactory`
Inherits: `Factory` | Header: `WidgetPreviewFactory.h`

Widget Preview Factory
