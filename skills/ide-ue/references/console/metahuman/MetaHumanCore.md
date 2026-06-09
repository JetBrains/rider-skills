# UE Python API — MetaHumanCore Module

**6 types** from the `MetaHumanCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaHumanViewportCameraState`, `MetaHumanViewportState`, `MetaHumanContourData`, `MetaHumanProcessingAsset`, `MetaHumanViewportSettings`, `ABImageViewMode`

---

## Classes

### `unreal.MetaHumanViewportCameraState`
Inherits: `StructBase` | Header: `MetaHumanViewportSettings.h`

MetaHuman Viewport Camera State

### `unreal.MetaHumanViewportState`
Inherits: `StructBase` | Header: `MetaHumanViewportSettings.h`

MetaHuman Viewport State

### `unreal.MetaHumanContourData`
Inherits: `Object` | Header: `MetaHumanContourData.h`

MetaHuman Contour Data

### `unreal.MetaHumanProcessingAsset`
Inherits: `Object` | Header: `MetaHumanProcessingAsset.h`

MetaHuman Processing Asset

### `unreal.MetaHumanViewportSettings`
Inherits: `Object` | Header: `MetaHumanViewportSettings.h`

MetaHuman Viewport Settings

**Methods** (17):
  - `get_ev100(view)` -> `float` — Get EV100
  - `get_view_mode_index(view)` -> `ViewModeIndex` — Get View Mode Index
  - `is_depth_mesh_visible(view)` -> `bool` — Is Depth Mesh Visible
  - `is_footage_visible(view)` -> `bool` — Is Footage Visible
  - `is_showing_control_vertices(view)` -> `bool` — Is Showing Control Vertices
  - `is_showing_curves(view)` -> `bool` — Is Showing Curves
  - `is_showing_single_view()` -> `bool` — Is Showing Single View
  - `is_showing_undistorted(view)` -> `bool` — Is Showing Undistorted
  - `is_skeletal_mesh_visible(view)` -> `bool` — Is Skeletal Mesh Visible
  - `set_ev100(view, value, notify)` -> `None` — Set EV100
  - `set_view_mode_index(view, view_mode_index, notify)` -> `None` — Set View Mode Index
  - `toggle_depth_mesh_visibility(view)` -> `None` — Toggle Depth Mesh Visibility
  - `toggle_distortion(view)` -> `None` — Toggle Distortion
  - `toggle_footage_visibility(view)` -> `None` — Toggle Footage Visibility
  - `toggle_show_control_vertices(view)` -> `None` — Toggle Show Control Vertices
  - `toggle_show_curves(view)` -> `None` — Toggle Show Curves
  - `toggle_skeletal_mesh_visibility(view)` -> `None` — Toggle Skeletal Mesh Visibility

### `unreal.ABImageViewMode`
Inherits: `EnumBase` | Header: `MetaHumanViewportModes.h`

EABImage View Mode

**Properties** (6):
  - `A`: `ABImageViewMode = Ellipsis` — Ensure any change is reflected in the material shader 0
  - `AB_SIDE`: `ABImageViewMode = Ellipsis` — Multi view modes 3
  - `AB_SPLIT`: `ABImageViewMode = Ellipsis` — 2
  - `ANY`: `ABImageViewMode = Ellipsis` — Special modes for querying per-view parameter state 5
  - `B`: `ABImageViewMode = Ellipsis` — Single view modes 1
  - `CURRENT`: `ABImageViewMode = Ellipsis` — 4
