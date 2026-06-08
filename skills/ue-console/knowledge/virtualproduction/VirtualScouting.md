# UE Python API — VirtualScouting Module

**2 types** from the `VirtualScouting` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VirtualScoutingEditorSettings`, `VirtualScoutingSettings`

---

## Classes

### `unreal.VirtualScoutingEditorSettings`
Inherits: `DeveloperSettings` | Header: `VirtualScoutingSettings.h`

Per user settings for Virtual Scouting Editor.

**Methods** (1):
  - `get_virtual_scouting_editor_settings()` -> `VirtualScoutingEditorSettings` [classmethod] — Get Virtual Scouting Editor Settings

**Properties** (5):
  - `drag_speed`: `float` — [Read-Write] Speed of movement when you drag-move. Default is 0.7 (float)
  - `enable_tooltips`: `bool` — [Read-Write] Show Tooltips when in VR. These appear when motioncontroller is brought near to HMD (bo...
  - `flight_speed`: `float` — [Read-Write] Avatar flying speed. Default is 4.0 (float)
  - `use_smooth_rotation`: `bool` — [Read-Write] True = Rotate smoothly. False = Flick Rotate. Default is Flick Rotate (bool)
  - `use_teleport_rotation`: `bool` — [Read-Write] Use the forward axis roll from the motion controller to define and adjust teleport rota...

### `unreal.VirtualScoutingSettings`
Inherits: `DeveloperSettings` | Header: `VirtualScoutingSettings.h`

Per project settings for Virtual Scouting.

**Methods** (1):
  - `get_virtual_scouting_settings()` -> `VirtualScoutingSettings` [classmethod] — Get Virtual Scouting Settings

**Properties** (8):
  - `placement_tool_collection`: `Name` — [Read-Write] (Name)
  - `sequence_tool_collection`: `Name` — [Read-Write] (Name)
  - `swap_to_grab_tool_on_spawn_new_actor`: `bool` — [Read-Write] (bool)
  - `use_imperial`: `bool` — [Read-Write] (bool)
  - `viewfinder_aperture_array`: `None` — [Read-Write] (Array[float])
  - `viewfinder_exposure_compensation`: `float` — [Read-Write] (float)
  - `viewfinder_mask_array`: `None` — [Read-Write] (Array[float])
  - `viewfinder_use_exposure`: `bool` — [Read-Write] (bool)
