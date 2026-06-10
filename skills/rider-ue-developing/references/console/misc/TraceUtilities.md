# UE Python API — TraceUtilities Module

**1 types** from the `TraceUtilities` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TraceUtilLibrary`

---

## Classes

### `unreal.TraceUtilLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `TraceUtilLibrary.h`

Trace Util Library

**Methods** (14):
  - `get_all_channels()` -> `Array [ str ]` [classmethod] — Get All Channels
  - `get_enabled_channels()` -> `Array [ str ]` [classmethod] — Get Enabled Channels
  - `is_channel_enabled(channel_name)` -> `bool` [classmethod] — Is Channel Enabled
  - `is_tracing()` -> `bool` [classmethod] — Is Tracing
  - `pause_tracing()` -> `bool` [classmethod] — Pause Tracing
  - `resume_tracing()` -> `bool` [classmethod] — Resume Tracing
  - `start_trace_send_to(target, channels)` -> `bool` [classmethod] — Start Trace Send To
  - `start_trace_to_file(file_name, channels)` -> `bool` [classmethod] — Start Trace to File
  - `stop_tracing()` -> `bool` [classmethod] — Stop Tracing
  - `toggle_channel(channel_name, enabled)` -> `bool` [classmethod] — Toggle Channel
  - `trace_bookmark(name)` -> `None` [classmethod] — Traces a bookmark with specified name.
  - `trace_mark_region_end(name)` -> `None` [classmethod] — Traces an end event for a region with specified name.
  - `trace_mark_region_start(name)` -> `None` [classmethod] — Traces a begin event for a region with specified name.
  - `trace_screenshot(name, show_ui)` -> `None` [classmethod] — Triggers an Unreal Insights screenshot
