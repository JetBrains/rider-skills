# UE Python API — UMGEditor Module

**9 types** from the `UMGEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AssetThumbnailWidgetSettings`, `AssetThumbnailWidget`, `SlateVectorArtDataFactory`, `WidgetBlueprint`, `WidgetBlueprintFactory`, `ThumbnailColorStripOrientation_BlueprintType`, `ThumbnailLabelType_BlueprintType`, `ThumbnailPreviewSizeMode`, `GetHighlightTextDelegate`

---

## Classes

### `unreal.AssetThumbnailWidgetSettings`
Inherits: `StructBase` | Header: `AssetThumbnailWidget.h`

Copied mostly from FAssetThumbnailConfig

**Properties** (12):
  - `allow_asset_specific_thumbnail_overlay`: `bool` — [Read-Write] (bool)
  - `allow_hint_text`: `bool` — [Read-Write] (bool)
  - `allow_real_time_on_hovered`: `bool` — [Read-Write] (bool)
  - `asset_type_color_override`: `LinearColor` — [Read-Write] (LinearColor)
  - `color_strip_orientation`: `ThumbnailColorStripOrientation_BlueprintType` — [Read-Write] (ThumbnailColorStripOrientation_BlueprintType)
  - `force_generic_thumbnail`: `bool` — [Read-Write] (bool)
  - `generic_thumbnail_size`: `int` — [Read-Write] (int32)
  - `highlighted_text_delegate`: `GetHighlightTextDelegate` — [Read-Write] (GetHighlightTextDelegate)
  - `hint_color_and_opacity`: `LinearColor` — [Read-Write] (LinearColor)
  - `override_asset_type_color`: `bool` — [Read-Write] Whether to override the asset typeâs colour (bool)
  - `padding`: `Margin` — [Read-Write] (Margin)
  - `thumbnail_label`: `ThumbnailLabelType_BlueprintType` — [Read-Write] (ThumbnailLabelType_BlueprintType)

### `unreal.AssetThumbnailWidget`
Inherits: `Widget` | Header: `AssetThumbnailWidget.h`

This widget can be given an asset and it will render its thumbnail. Editor-only.

**Methods** (5):
  - `get_resolution()` -> `IntPoint` — Gets the resolution of the rendered thumbnail.
  - `set_asset(asset_data)` -> `None` — Set Asset
  - `set_asset_by_object(object)` -> `None` — Set Asset by Object
  - `set_resolution(resolution)` -> `None` — Sets the resolution for the rendered thumbnail.
  - `set_thumbnail_settings(thumbnail_settings)` -> `None` — Set Thumbnail Settings

**Properties** (2):
  - `resolution`: `IntPoint` — [Read-Write] Desired size of the thumbnail (IntPoint)
  - `thumbnail_settings`: `AssetThumbnailWidgetSettings` — [Read-Write] Behaviour and style of the widget (AssetThumbnailWidgetSettings)

### `unreal.SlateVectorArtDataFactory`
Inherits: `Factory` | Header: `SlateVectorArtDataFactory.h`

Slate Vector Art Data Factory

### `unreal.WidgetBlueprint`
Inherits: `BaseWidgetBlueprint` | Header: `WidgetBlueprint.h`

The widget blueprint enables extending UUserWidget the user extensible UWidget.

### `unreal.WidgetBlueprintFactory`
Inherits: `Factory` | Header: `WidgetBlueprintFactory.h`

Widget Blueprint Factory

### `unreal.ThumbnailColorStripOrientation_BlueprintType`
Inherits: `EnumBase` | Header: `AssetThumbnailWidget.h`

EThumbnail Color Strip Orientation Blueprint Type

**Properties** (2):
  - `HORIZONTAL_BOTTOM_EDGE`: `ThumbnailColorStripOrientation_BlueprintType = Ellipsis` — Display the color strip as a horizontal line along the bottom edge 0
  - `VERTICAL_RIGHT_EDGE`: `ThumbnailColorStripOrientation_BlueprintType = Ellipsis` — Display the color strip as a vertical line along the right edge 1

### `unreal.ThumbnailLabelType_BlueprintType`
Inherits: `EnumBase` | Header: `AssetThumbnailWidget.h`

EThumbnail Label Type Blueprint Type

**Properties** (3):
  - `ASSET_NAME`: `ThumbnailLabelType_BlueprintType = Ellipsis` — 1
  - `CLASS_NAME`: `ThumbnailLabelType_BlueprintType = Ellipsis` — 0
  - `NO_LABEL`: `ThumbnailLabelType_BlueprintType = Ellipsis` — 2

### `unreal.ThumbnailPreviewSizeMode`
Inherits: `EnumBase` | Header: `WidgetBlueprint.h`

EThumbnail Preview Size Mode

**Properties** (4):
  - `CUSTOM`: `ThumbnailPreviewSizeMode = Ellipsis` — 2
  - `DESIRED`: `ThumbnailPreviewSizeMode = Ellipsis` — 3
  - `FILL_SCREEN`: `ThumbnailPreviewSizeMode = Ellipsis` — 1
  - `MATCH_DESIGNER_MODE`: `ThumbnailPreviewSizeMode = Ellipsis` — 0

### `unreal.GetHighlightTextDelegate`
Inherits: `DelegateBase` | Header: `AssetThumbnailWidget.h`

Get Highlight Text Delegate Delegate Signature
