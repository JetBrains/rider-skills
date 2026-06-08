# UE Python API — Text3D Module

**25 types** from the `Text3D` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `Text3DActor`, `Text3DCharacterExtensionBase`, `Text3DCharacterTransform`, `Text3DComponent`, `Text3DDefaultGeometryExtension`, `Text3DDefaultLayoutExtension`, `Text3DDefaultMaterialExtension`, `Text3DDefaultRenderingExtension`, `Text3DDefaultTransformExtension`, `Text3DExtensionBase`, `Text3DGeometryExtensionBase`, `Text3DLayoutExtensionBase`, `Text3DMaterialExtensionBase`, `Text3DRendererBase`, `Text3DRenderingExtensionBase`, `Text3DStaticMeshesRenderer`, `Text3DTransformExtensionBase`, `Text3DBevelType`, `Text3DCharacterEffectOrder`, `Text3DHorizontalTextAlignment`, ... (25 total)

---

## Classes

### `unreal.Text3DActor`
Inherits: `Actor` | Header: `Text3DActor.h`

Text 3DActor

**Properties** (1):
  - `text3d_component`: `Text3DComponent` [Read-Only] — [Read-Only] (Text3DComponent)

### `unreal.Text3DCharacterExtensionBase`
Inherits: `Text3DExtensionBase` | Header: `Text3DCharacterExtensionBase.h`

Extension that handles character data for Text3D

### `unreal.Text3DCharacterTransform`
Inherits: `SceneComponent` | Header: `Text3DCharacterTransform.h`

Text 3DCharacter Transform

**Methods** (17):
  - `set_location_distance(distance)` -> `None` — Set Location Distance
  - `set_location_enabled(enabled)` -> `None` — Location
  - `set_location_order(order)` -> `None` — Set Location Order
  - `set_location_progress(progress)` -> `None` — Set Location Progress
  - `set_location_range(range)` -> `None` — Set Location Range
  - `set_rotate_begin(value)` -> `None` — Set Rotate Begin
  - `set_rotate_enabled(enabled)` -> `None` — Rotation
  - `set_rotate_end(value)` -> `None` — Set Rotate End
  - `set_rotate_order(order)` -> `None` — Set Rotate Order
  - `set_rotate_progress(progress)` -> `None` — Set Rotate Progress
  - `set_rotate_range(range)` -> `None` — Set Rotate Range
  - `set_scale_begin(value)` -> `None` — Set Scale Begin
  - `set_scale_enabled(enabled)` -> `None` — Scale
  - `set_scale_end(value)` -> `None` — Set Scale End
  - `set_scale_order(order)` -> `None` — Set Scale Order
  - `set_scale_progress(progress)` -> `None` — Set Scale Progress
  - `set_scale_range(range)` -> `None` — Set Scale Range

**Properties** (17):
  - `location_distance`: `Vector` — [Read-Write] (Vector)
  - `location_enabled`: `bool` — [Read-Write] Location (bool)
  - `location_order`: `Text3DCharacterEffectOrder` — [Read-Write] (Text3DCharacterEffectOrder)
  - `location_progress`: `float` — [Read-Write] (float)
  - `location_range`: `float` — [Read-Write] (float)
  - `rotate_begin`: `Rotator` — [Read-Write] (Rotator)
  - `rotate_enabled`: `bool` — [Read-Write] Rotate (bool)
  - `rotate_end`: `Rotator` — [Read-Write] (Rotator)
  - `rotate_order`: `Text3DCharacterEffectOrder` — [Read-Write] (Text3DCharacterEffectOrder)
  - `rotate_progress`: `float` — [Read-Write] (float)
  - `rotate_range`: `float` — [Read-Write] (float)
  - `scale_begin`: `Vector` — [Read-Write] (Vector)
  - `scale_enabled`: `bool` — [Read-Write] Scale (bool)
  - `scale_end`: `Vector` — [Read-Write] (Vector)
  - `scale_order`: `Text3DCharacterEffectOrder` — [Read-Write] (Text3DCharacterEffectOrder)
  - `scale_progress`: `float` — [Read-Write] (float)
  - `scale_range`: `float` — [Read-Write] (float)

### `unreal.Text3DComponent`
Inherits: `SceneComponent` | Header: `Text3DComponent.h`

Text 3DComponent

**Methods** (27):
  - `get_bounds(box_extent=Vector)` — Get whole text rendered bounds
  - `get_formatted_text()` -> `Text` — Returns the Text property, after being formatted by the FormatText virtual function. If FormatText is not overriden, the...
  - `set_back_material(value)` -> `None` — Set the text back material
  - `set_bevel(value)` -> `None` — Set the 3d bevel value
  - `set_bevel_material(value)` -> `None` — Set the text bevel material
  - `set_bevel_segments(value)` -> `None` — Set the amount of segments that will be used to tessellate the Bevel
  - `set_bevel_type(value)` -> `None` — Set the 3d bevel type
  - `set_cast_shadow(new_cast_shadow)` -> `None` — Set the value of CastShadow.
  - `set_enforce_upper_case(enforce_upper_case)` -> `None` — Set Enforce Upper Case
  - `set_extrude(value)` -> `None` — Set the text extrusion size and signal the primitives to be rebuilt
  - `set_extrude_material(value)` -> `None` — Set the text extrude material
  - `set_font(font)` -> `None` — Set the text font and signal the primitives to be rebuilt
  - `set_front_material(value)` -> `None` — Set the text front material
  - `set_has_max_height(value)` -> `None` — Enable / Disable a Maximum Height
  - `set_has_max_width(value)` -> `None` — Enable / Disable a Maximum Width
  - `set_has_outline(value)` -> `None` — Set whether an outline is applied.
  - `set_horizontal_alignment(value)` -> `None` — Set the horizontal alignment value and signal the primitives to be rebuilt
  - `set_kerning(value)` -> `None` — Set the kerning value and signal the primitives to be rebuilt
  - `set_line_spacing(value)` -> `None` — Set the line spacing value and signal the primitives to be rebuilt
  - `set_max_height(value)` -> `None` — Set the Maximum Height - If height is larger, mesh will scale down to fit MaxHeight value
  - `set_max_width(value)` -> `None` — Set the Maximum Width - If width is larger, mesh will scale down to fit MaxWidth value
  - `set_max_width_handling(value)` -> `None` — Set the Maximum Width Handling - Whether to wrap before scaling when the text size reaches the max width
  - `set_outline_expand(value)` -> `None` — Set the outline width.
  - `set_scale_proportionally(value)` -> `None` — Set if the mesh should scale proportionally when Max Width/Height is set
  - `set_text(value)` -> `None` — Set the text value and signal the primitives to be rebuilt
  - `set_vertical_alignment(value)` -> `None` — Set the vertical alignment and signal the primitives to be rebuilt
  - `set_word_spacing(value)` -> `None` — Set the word spacing value and signal the primitives to be rebuilt

**Properties** (1):
  - `text_generated_delegate`: `TextGenerated` — [Read-Write] (TextGenerated)

### `unreal.Text3DDefaultGeometryExtension`
Inherits: `Text3DGeometryExtensionBase` | Header: `Text3DDefaultGeometryExtension.h`

Text 3DDefault Geometry Extension

**Methods** (14):
  - `get_bevel()` -> `float` — Get the 3d bevel value
  - `get_bevel_segments()` -> `int32` — Get the amount of segments that will be used to tessellate the Bevel
  - `get_bevel_type()` -> `Text3DBevelType` — Get the 3d bevel type
  - `get_extrude()` -> `float` — Get the text extrusion size and signal the primitives to be rebuilt
  - `get_outline()` -> `float` — Get the outline width.
  - `get_use_outline()` -> `bool` — Get whether an outline is applied.
  - `set_bevel(value)` -> `None` — Set the 3d bevel value
  - `set_bevel_segments(value)` -> `None` — Set the amount of segments that will be used to tessellate the Bevel
  - `set_bevel_type(value)` -> `None` — Set the 3d bevel type
  - `set_extrude(value)` -> `None` — Set the text extrusion size and signal the primitives to be rebuilt
  - `set_outline(value)` -> `None` — Set the outline width.
  - `set_pivot_h_alignment(pivot)` -> `None` — Set Pivot HAlignment
  - `set_pivot_v_alignment(pivot)` -> `None` — Set Pivot VAlignment
  - `set_use_outline(value)` -> `None` — Set whether an outline is applied.

### `unreal.Text3DDefaultLayoutExtension`
Inherits: `Text3DLayoutExtensionBase` | Header: `Text3DDefaultLayoutExtension.h`

Text 3DDefault Layout Extension

**Methods** (22):
  - `get_horizontal_alignment()` -> `Text3DHorizontalTextAlignment` — Get the horizontal alignment value and signal the primitives to be rebuilt
  - `get_line_spacing()` -> `float` — Get the line spacing value and signal the primitives to be rebuilt
  - `get_max_height()` -> `float` — Get the Maximum Height - If height is larger, mesh will scale down to fit MaxHeight value
  - `get_max_width()` -> `float` — Get the Maximum Width - If width is larger, mesh will scale down to fit MaxWidth value
  - `get_max_width_behavior()` -> `Text3DMaxWidthHandling` — Get the Maximum Width Handling - Whether to wrap before scaling when the text size reaches the max width
  - `get_scales_proportionally()` -> `bool` — Get if the mesh should scale proportionally when Max Width/Height is set
  - `get_tracking()` -> `float` — Get the tracking value and signal the primitives to be rebuilt
  - `get_use_max_height()` -> `bool` — Whether a maximum height is specified
  - `get_use_max_width()` -> `bool` — Whether a maximum width is specified
  - `get_vertical_alignment()` -> `Text3DVerticalTextAlignment` — Get the vertical alignment and signal the primitives to be rebuilt
  - `get_word_spacing()` -> `float` — Get the word spacing value and signal the primitives to be rebuilt
  - `set_horizontal_alignment(value)` -> `None` — Set the horizontal alignment value and signal the primitives to be rebuilt
  - `set_line_spacing(value)` -> `None` — Set the line spacing value and signal the primitives to be rebuilt
  - `set_max_height(value)` -> `None` — Set the Maximum Height - If height is larger, mesh will scale down to fit MaxHeight value
  - `set_max_width(value)` -> `None` — Set the Maximum Width - If width is larger, mesh will scale down to fit MaxWidth value
  - `set_max_width_behavior(value)` -> `None` — Set the Maximum Width Handling - Whether to wrap before scaling when the text size reaches the max width
  - `set_scale_proportionally(value)` -> `None` — Set if the mesh should scale proportionally when Max Width/Height is set
  - `set_tracking(value)` -> `None` — Set the tracking value and signal the primitives to be rebuilt
  - `set_use_max_height(value)` -> `None` — Enable / Disable a Maximum Height
  - `set_use_max_width(value)` -> `None` — Enable / Disable a Maximum Width
  - `set_vertical_alignment(value)` -> `None` — Set the vertical alignment and signal the primitives to be rebuilt
  - `set_word_spacing(value)` -> `None` — Set the word spacing value and signal the primitives to be rebuilt

### `unreal.Text3DDefaultMaterialExtension`
Inherits: `Text3DMaterialExtensionBase` | Header: `Text3DDefaultMaterialExtension.h`

Text 3DDefault Material Extension

**Methods** (44):
  - `get_back_color()` -> `LinearColor` — Get Back Color
  - `get_back_material()` -> `MaterialInterface` — Get Back Material
  - `get_bevel_color()` -> `LinearColor` — Get Bevel Color
  - `get_bevel_material()` -> `MaterialInterface` — Get Bevel Material
  - `get_blend_mode()` -> `Text3DMaterialBlendMode` — Get Blend Mode
  - `get_extrude_color()` -> `LinearColor` — Get Extrude Color
  - `get_extrude_material()` -> `MaterialInterface` — Get Extrude Material
  - `get_front_color()` -> `LinearColor` — Get Front Color
  - `get_front_material()` -> `MaterialInterface` — Get Front Material
  - `get_gradient_color_a()` -> `LinearColor` — Get Gradient Color A
  - `get_gradient_color_b()` -> `LinearColor` — Get Gradient Color B
  - `get_gradient_offset()` -> `float` — Get Gradient Offset
  - `get_gradient_rotation()` -> `float` — Get Gradient Rotation
  - `get_gradient_smoothness()` -> `float` — Get Gradient Smoothness
  - `get_is_unlit()` -> `bool` — Get Is Unlit
  - `get_mask_offset()` -> `float` — Get Mask Offset
  - `get_mask_rotation()` -> `float` — Get Mask Rotation
  - `get_mask_smoothness()` -> `float` — Get Mask Smoothness
  - `get_opacity()` -> `float` — Get Opacity
  - `get_style()` -> `Text3DMaterialStyle` — Get Style
  - `get_texture_asset()` -> `Texture2D` — Get Texture Asset
  - `get_texture_tiling()` -> `Vector2D` — Get Texture Tiling
  - `set_back_color(color)` -> `None` — Set Back Color
  - `set_back_material(material)` -> `None` — Set Back Material
  - `set_bevel_color(color)` -> `None` — Set Bevel Color
  - `set_bevel_material(material)` -> `None` — Set Bevel Material
  - `set_blend_mode(blend_mode)` -> `None` — Set Blend Mode
  - `set_extrude_color(color)` -> `None` — Set Extrude Color
  - `set_extrude_material(material)` -> `None` — Set Extrude Material
  - `set_front_color(color)` -> `None` — Set Front Color
  - `set_front_material(material)` -> `None` — Set Front Material
  - `set_gradient_color_a(color)` -> `None` — Set Gradient Color A
  - `set_gradient_color_b(color)` -> `None` — Set Gradient Color B
  - `set_gradient_offset(gradient_offset)` -> `None` — Set Gradient Offset
  - `set_gradient_rotation(gradient_rotation)` -> `None` — Set Gradient Rotation
  - `set_gradient_smoothness(gradient_smoothness)` -> `None` — Set Gradient Smoothness
  - `set_is_unlit(is_unlit)` -> `None` — Set Is Unlit
  - `set_mask_offset(mask_offset)` -> `None` — Set Mask Offset
  - `set_mask_rotation(mask_rotation)` -> `None` — Set Mask Rotation
  - `set_mask_smoothness(mask_smoothness)` -> `None` — Set Mask Smoothness
  - `set_opacity(opacity)` -> `None` — Set Opacity
  - `set_style(style)` -> `None` — Set Style
  - `set_texture_asset(texture_asset)` -> `None` — Set Texture Asset
  - `set_texture_tiling(texture_tiling)` -> `None` — Set Texture Tiling

### `unreal.Text3DDefaultRenderingExtension`
Inherits: `Text3DRenderingExtensionBase` | Header: `Text3DDefaultRenderingExtension.h`

Extension that handles rendering data for Text3D

**Methods** (10):
  - `get_affect_dynamic_indirect_lighting()` -> `bool` — Get the value of AffectDynamicIndirectLighting.
  - `get_affect_indirect_lighting_while_hidden()` -> `bool` — Get the value of AffectIndirectLightingWhileHidden.
  - `get_cast_hidden_shadow()` -> `bool` — Get the value of CastHiddenShadow.
  - `get_cast_shadow()` -> `bool` — Get the value of CastShadow.
  - `get_holdout()` -> `bool` — Get the value of Holdout.
  - `set_affect_dynamic_indirect_lighting(value)` -> `None` — Set the value of AffectDynamicIndirectLighting.
  - `set_affect_indirect_lighting_while_hidden(value)` -> `None` — Set the value of AffectIndirectLightingWhileHidden.
  - `set_cast_hidden_shadow(cast_shadow)` -> `None` — Set the value of CastHiddenShadow.
  - `set_cast_shadow(cast_shadow)` -> `None` — Set the value of CastShadow.
  - `set_holdout(holdout)` -> `None` — Set the value of Holdout.

### `unreal.Text3DDefaultTransformExtension`
Inherits: `Text3DTransformExtensionBase` | Header: `Text3DDefaultTransformExtension.h`

Extension that handles transform data for Text3D

**Methods** (17):
  - `set_location_distance(distance)` -> `None` — Set Location Distance
  - `set_location_ease_curve(ease_curve)` -> `None` — Set Location Ease Curve
  - `set_location_enabled(enabled)` -> `None` — Set Location Enabled
  - `set_location_order(order)` -> `None` — Set Location Order
  - `set_location_progress(progress)` -> `None` — Set Location Progress
  - `set_rotation_begin(value)` -> `None` — Set Rotation Begin
  - `set_rotation_ease_curve(ease_curve)` -> `None` — Set Rotation Ease Curve
  - `set_rotation_enabled(enabled)` -> `None` — Set Rotation Enabled
  - `set_rotation_end(value)` -> `None` — Set Rotation End
  - `set_rotation_order(order)` -> `None` — Set Rotation Order
  - `set_rotation_progress(progress)` -> `None` — Set Rotation Progress
  - `set_scale_begin(value)` -> `None` — Set Scale Begin
  - `set_scale_ease_curve(ease_curve)` -> `None` — Set Scale Ease Curve
  - `set_scale_enabled(enabled)` -> `None` — Set Scale Enabled
  - `set_scale_end(value)` -> `None` — Set Scale End
  - `set_scale_order(order)` -> `None` — Set Scale Order
  - `set_scale_progress(progress)` -> `None` — Set Scale Progress

### `unreal.Text3DExtensionBase`
Inherits: `Object` | Header: `Text3DExtensionBase.h`

Extensions are piece of data and logic needed to render Text3D that can be reused by multiple renderers, they execute once during every renderer update at the right moment

### `unreal.Text3DGeometryExtensionBase`
Inherits: `Text3DExtensionBase` | Header: `Text3DGeometryExtensionBase.h`

Extension that handles geometry data for Text3D

### `unreal.Text3DLayoutExtensionBase`
Inherits: `Text3DExtensionBase` | Header: `Text3DLayoutExtensionBase.h`

Extension that handles layout data for Text3D

### `unreal.Text3DMaterialExtensionBase`
Inherits: `Text3DExtensionBase` | Header: `Text3DMaterialExtensionBase.h`

Extension that handles materials for Text3D

### `unreal.Text3DRendererBase`
Inherits: `Object` | Header: `Text3DRendererBase.h`

Base class for a rendering implementation of Text3D The whole rendering logic should be encapsulated into an instance of this class

### `unreal.Text3DRenderingExtensionBase`
Inherits: `Text3DExtensionBase` | Header: `Text3DRenderingExtensionBase.h`

Extension that handles rendering data for Text3D

### `unreal.Text3DStaticMeshesRenderer`
Inherits: `Text3DRendererBase` | Header: `Text3DStaticMeshesRenderer.h`

Legacy/default renderer for Text3D Each text character is rendered as a StaticMesh within its own StaticMeshComponent Kerning is done through a scene component containing the current character Text3DC...

**Methods** (5):
  - `get_glyph_count()` -> `int32` — Gets the number of font glyphs that are currently used
  - `get_glyph_kerning_component(index)` -> `SceneComponent` — Gets the USceneComponent that a glyph is attached to
  - `get_glyph_kerning_components()` -> `Array [ SceneComponent ]` — Gets all the glyph kerning components
  - `get_glyph_mesh_component(index)` -> `StaticMeshComponent` — Gets the StaticMeshComponent of a glyph
  - `get_glyph_mesh_components()` -> `Array [ StaticMeshComponent ]` — Gets all the glyph meshes

### `unreal.Text3DTransformExtensionBase`
Inherits: `Text3DExtensionBase` | Header: `Text3DTransformExtensionBase.h`

Extension that handles transform data for Text3D

### `unreal.Text3DBevelType`
Inherits: `EnumBase` | Header: `Text3DTypes.h`

EText 3DBevel Type

**Properties** (7):
  - `CONCAVE`: `Text3DBevelType = Ellipsis` — 3
  - `CONVEX`: `Text3DBevelType = Ellipsis` — 2
  - `ENGRAVED`: `Text3DBevelType = Ellipsis` — 6
  - `HALF_CIRCLE`: `Text3DBevelType = Ellipsis` — 1
  - `LINEAR`: `Text3DBevelType = Ellipsis` — 0
  - `ONE_STEP`: `Text3DBevelType = Ellipsis` — 4
  - `TWO_STEPS`: `Text3DBevelType = Ellipsis` — 5

### `unreal.Text3DCharacterEffectOrder`
Inherits: `EnumBase` | Header: `Text3DTypes.h`

EText 3DCharacter Effect Order

**Properties** (4):
  - `FROM_CENTER`: `Text3DCharacterEffectOrder = Ellipsis` — 1
  - `NORMAL`: `Text3DCharacterEffectOrder = Ellipsis` — 0
  - `OPPOSITE`: `Text3DCharacterEffectOrder = Ellipsis` — 3
  - `TO_CENTER`: `Text3DCharacterEffectOrder = Ellipsis` — 2

### `unreal.Text3DHorizontalTextAlignment`
Inherits: `EnumBase` | Header: `Text3DTypes.h`

EText 3DHorizontal Text Alignment

**Properties** (3):
  - `CENTER`: `Text3DHorizontalTextAlignment = Ellipsis` — 1
  - `LEFT`: `Text3DHorizontalTextAlignment = Ellipsis` — 0
  - `RIGHT`: `Text3DHorizontalTextAlignment = Ellipsis` — 2

### `unreal.Text3DMaterialBlendMode`
Inherits: `EnumBase` | Header: `Text3DTypes.h`

EText 3DMaterial Blend Mode

**Properties** (2):
  - `OPAQUE`: `Text3DMaterialBlendMode = Ellipsis` — 1
  - `TRANSLUCENT`: `Text3DMaterialBlendMode = Ellipsis` — 2

### `unreal.Text3DMaterialStyle`
Inherits: `EnumBase` | Header: `Text3DTypes.h`

EText 3DMaterial Style

**Properties** (4):
  - `CUSTOM`: `Text3DMaterialStyle = Ellipsis` — 4
  - `GRADIENT`: `Text3DMaterialStyle = Ellipsis` — 2
  - `SOLID`: `Text3DMaterialStyle = Ellipsis` — 1
  - `TEXTURE`: `Text3DMaterialStyle = Ellipsis` — 3

### `unreal.Text3DMaxWidthHandling`
Inherits: `EnumBase` | Header: `Text3DTypes.h`

EText 3DMax Width Handling

**Properties** (2):
  - `SCALE`: `Text3DMaxWidthHandling = Ellipsis` — Scales the text to meet the max width 0
  - `WRAP_AND_SCALE`: `Text3DMaxWidthHandling = Ellipsis` — First wraps the text (if possible) and then scales to meet the max width 1

### `unreal.Text3DVerticalTextAlignment`
Inherits: `EnumBase` | Header: `Text3DTypes.h`

EText 3DVertical Text Alignment

**Properties** (4):
  - `BOTTOM`: `Text3DVerticalTextAlignment = Ellipsis` — 3
  - `CENTER`: `Text3DVerticalTextAlignment = Ellipsis` — 2
  - `FIRST_LINE`: `Text3DVerticalTextAlignment = Ellipsis` — 0
  - `TOP`: `Text3DVerticalTextAlignment = Ellipsis` — 1

### `unreal.Text3DComponent_TextGenerated`
Inherits: `MulticastDelegateBase` | Header: `Text3DComponent.h`

Delegate called after text is rebuilt
