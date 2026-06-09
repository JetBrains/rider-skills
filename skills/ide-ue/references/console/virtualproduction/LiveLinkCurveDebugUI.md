# UE Python API — LiveLinkCurveDebugUI Module

**2 types** from the `LiveLinkCurveDebugUI` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LiveLinkDebuggerBlueprintLibrary`, `LiveLinkDebuggerSettings`

---

## Classes

### `unreal.LiveLinkDebuggerBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LiveLinkDebuggerBlueprintLibrary.h`

Live Link Debugger Blueprint Library

**Methods** (2):
  - `display_live_link_debugger(subject_name)` -> `None` [classmethod] — Display Live Link Debugger
  - `hide_live_link_debugger()` -> `None` [classmethod] — Hide Live Link Debugger

### `unreal.LiveLinkDebuggerSettings`
Inherits: `Object` | Header: `LiveLinkDebuggerSettings.h`

Live Link Debugger Settings

**Methods** (2):
  - `get_bar_color_for_curve_value(curve_value)` -> `SlateColor` — Get Bar Color for Curve Value
  - `get_dpi_scale_based_on_size(size)` -> `float` — Get DPIScale Based on Size
