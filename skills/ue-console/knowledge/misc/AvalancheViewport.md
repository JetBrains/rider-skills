# UE Python API — AvalancheViewport Module

**5 types** from the `AvalancheViewport` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaLevelViewportSafeFrame`, `AvaViewportDataActor`, `AvaViewportSettings`, `AvaShapeEditorOverlayType`, `AvaViewportSnapState`

---

## Classes

### `unreal.AvaLevelViewportSafeFrame`
Inherits: `StructBase` | Header: `AvaViewportSettings.h`

Ava Level Viewport Safe Frame

**Properties** (3):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `screen_percentage`: `float` — [Read-Write] Distance from the center of the screen to the edge in percent. (float)
  - `thickness`: `float` — [Read-Write] (float)

### `unreal.AvaViewportDataActor`
Inherits: `Actor` | Header: `AvaViewportDataActor.h`

Ava Viewport Data Actor

### `unreal.AvaViewportSettings`
Inherits: `DeveloperSettings` | Header: `AvaViewportSettings.h`

Ava Viewport Settings

**Methods** (3):
  - `get_snap_state()` -> `AvaViewportSnapState` — Get Snap State
  - `has_snap_state(snap_state)` -> `bool` — Has Snap State
  - `set_snap_state(snap_state)` -> `None` — Set Snap State

**Properties** (35):
  - `camera_bounds_shade_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `disabled_guide_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `disabled_locked_guide_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `dragged_guide_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enable_bounding_boxes`: `bool` — [Read-Write] (bool)
  - `enable_shapes_editor_overlay`: `bool` — [Read-Write] (bool)
  - `enable_texture_overlay`: `bool` — [Read-Write] (bool)
  - `enable_viewport_overlay`: `bool` — [Read-Write] (bool)
  - `enabled_guide_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled_locked_guide_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `grid_always_visible`: `bool` — [Read-Write] (bool)
  - `grid_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `grid_enabled`: `bool` — [Read-Write] (bool)
  - `grid_size`: `int` — [Read-Write] (int32)
  - `grid_thickness`: `float` — [Read-Write] (float)
  - `guide_config_path`: `str` — [Read-Write] Directory used to load and save guide json config files. The path will be checked again...
  - `guide_thickness`: `float` — [Read-Write] (float)
  - `guides_enabled`: `bool` — [Read-Write] (bool)
  - `pixel_grid_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `pixel_grid_enabled`: `bool` — [Read-Write] (bool)
  - `safe_frames`: `None` — [Read-Write] (Array[AvaLevelViewportSafeFrame])
  - `safe_frames_enabled`: `bool` — [Read-Write] (bool)
  - `shape_editor_overlay_type`: `AvaShapeEditorOverlayType` — [Read-Write] Whether to show or hide the Shapes In-Viewport controls. (AvaShapeEditorOverlayType)
  - `snap_indicator_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `snap_indicator_thickness`: `float` — [Read-Write] (float)
  - `snap_indicators_enabled`: `bool` — [Read-Write] (bool)
  - `snap_state`: `int` — [Read-Write] (int32)
  - `texture_overlay_opacity`: `float` — [Read-Write] (float)
  - `texture_overlay_stretch`: `bool` — [Read-Write] (bool)
  - `texture_overlay_texture`: `Texture` — [Read-Write] (Texture)
  - `viewport_background_material`: `Material` — [Read-Write] (Material)
  - `viewport_checkerboard_color0`: `LinearColor` — [Read-Write] (LinearColor)
  - `viewport_checkerboard_color1`: `LinearColor` — [Read-Write] (LinearColor)
  - `viewport_checkerboard_material`: `Material` — [Read-Write] (Material)
  - `viewport_checkerboard_size`: `float` — [Read-Write] (float)

### `unreal.AvaShapeEditorOverlayType`
Inherits: `EnumBase` | Header: `AvaViewportSettings.h`

EAva Shape Editor Overlay Type

**Properties** (2):
  - `COMPONENT_VISUALIZER_ONLY`: `AvaShapeEditorOverlayType = Ellipsis` — 0
  - `FULL_DETAILS`: `AvaShapeEditorOverlayType = Ellipsis` — 1

### `unreal.AvaViewportSnapState`
Inherits: `EnumBase` | Header: `AvaSnapDefs.h`

EAva Viewport Snap State

**Properties** (5):
  - `ACTOR`: `AvaViewportSnapState = Ellipsis` — 8
  - `ALL`: `AvaViewportSnapState = Ellipsis` — 14
  - `GLOBAL`: `AvaViewportSnapState = Ellipsis` — 1
  - `GRID`: `AvaViewportSnapState = Ellipsis` — 4
  - `SCREEN`: `AvaViewportSnapState = Ellipsis` — 2
