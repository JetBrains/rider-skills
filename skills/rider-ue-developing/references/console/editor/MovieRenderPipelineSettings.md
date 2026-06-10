# UE Python API — MovieRenderPipelineSettings Module

**4 types** from the `MovieRenderPipelineSettings` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MoviePipelineBurnInSetting`, `MoviePipelineBurnInWidget`, `MoviePipelineConsoleVariableSetting`, `MoviePipelineWidgetRenderer`

---

## Classes

### `unreal.MoviePipelineBurnInSetting`
Inherits: `MoviePipelineRenderPass` | Header: `MoviePipelineBurnInSetting.h`

Movie Pipeline Burn in Setting

**Properties** (2):
  - `burn_in_class`: `SoftClassPath` — [Read-Write] (SoftClassPath)
  - `composite_onto_final_image`: `bool` — [Read-Write] If true, the Burn In image will be composited into the Final Image pass. Doesnât appl...

### `unreal.MoviePipelineBurnInWidget`
Inherits: `UserWidget` | Header: `MoviePipelineBurnInWidget.h`

Base class for level sequence burn ins

**Methods** (1):
  - `on_output_frame_started(for_pipeline)` -> `None` — Called on the first temporal and first spatial sample of each output frame with the information about the frame being pr...

### `unreal.MoviePipelineConsoleVariableSetting`
Inherits: `MoviePipelineSetting` | Header: `MoviePipelineConsoleVariableSetting.h`

Movie Pipeline Console Variable Setting

**Methods** (5):
  - `add_console_variable(name, value)` -> `bool` — Adds a console variable override with the given name and value, and will add a duplicate if one with the provided name a...
  - `add_or_update_console_variable(name, value)` -> `bool` — Adds a console variable override with the given name and value if one does not already exist. If the console variable wi...
  - `get_console_variables()` -> `Array [ MoviePipelineConsoleVariableEntry ]` — Gets a copy of all console variable overrides. These are not meant to be changed; use the mutator methods if console var...
  - `remove_console_variable(name, remove_all_instances = False)` -> `bool` — Removes the console variable override with the specified name. If more than one with the same name exists, the last one ...
  - `update_console_variable_enable_state(name, is_enabled)` -> `bool` — Updates the enable state of the console variable override with the provided name. If there are duplicate cvars with the ...

**Properties** (3):
  - `console_variable_presets`: `Array [ MovieSceneConsoleVariableTrackInterface ]` — [Read-Write] An array of presets from the Console Variables Editor. The preset cvars will be applied...
  - `end_console_commands`: `None` — [Read-Write] An array of console commands to execute when this shot is finished. Used to restore cha...
  - `start_console_commands`: `None` — [Read-Write] An array of console commands to execute when this shot is started. If you need to resto...

### `unreal.MoviePipelineWidgetRenderer`
Inherits: `MoviePipelineRenderPass` | Header: `MoviePipelineWidgetRenderSetting.h`

Movie Pipeline Widget Renderer

**Properties** (1):
  - `composite_onto_final_image`: `bool` — [Read-Write] If true, the widget renderer image will be composited into the Final Image pass. Doesnâ...
