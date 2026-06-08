# UE Python API — AvalancheEditor Module

**1 types** from the `AvalancheEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaEditorSettings`

---

## Classes

### `unreal.AvaEditorSettings`
Inherits: `DeveloperSettings` | Header: `AvaEditorSettings.h`

Motion Design Editor Settings

**Properties** (8):
  - `auto_activate_motion_design_viewport`: `bool` — [Read-Write] Whether to automatically switch to the Motion Design viewport when the mode is activate...
  - `auto_include_attached_actors_in_edit_actions`: `bool` — [Read-Write] Whether to Automatically Include the Attached Actors when performing Edit Actions such ...
  - `camera_distance`: `float` — [Read-Write] * Distance from the camera that new actors are created via the toolbox or drag and drop...
  - `default_viewport_quality_settings`: `AvaViewportQualitySettings` — [Read-Write] Default viewport quality settings for all newly created Motion Design blueprints. (AvaV...
  - `enable_level_context_switching`: `bool` — [Read-Write] Whether to allow the Motion Design Interface to show the current selected level rather ...
  - `keep_relative_transform_when_grouping`: `bool` — [Read-Write] When Grouping Actors with a Null Actor, whether to keep the relative transform of these...
  - `viewport_quality_presets`: `None` — [Read-Write] Viewport quality settings user presets.
deprecated: This property type has changed. Use...
  - `viewport_quality_settings_presets`: `None` — [Read-Write] Viewport quality settings user presets. (Array[AvaViewportQualitySettingsPreset])
