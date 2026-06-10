# UE Python API — Shotgrid Module

**2 types** from the `Shotgrid` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ShotgridMenuItem`, `ShotgridEngine`

---

## Classes

### `unreal.ShotgridMenuItem`
Inherits: `StructBase` | Header: `ShotgridEngine.h`

Shotgrid Menu Item

**Properties** (4):
  - `description`: `str` — [Read-Write] Description text for the tooltip (str)
  - `name`: `str` — [Read-Write] Command name for internal use (str)
  - `title`: `str` — [Read-Write] Text to display in the menu (str)
  - `type`: `str` — [Read-Write] Menu item type to help interpret the command (str)

### `unreal.ShotgridEngine`
Inherits: `Object` | Header: `ShotgridEngine.h`

Wrapper for the Python Shotgrid Engine The functions are implemented in Python by a class that derives from this one

**Methods** (8):
  - `execute_command(command_name)` -> `None` — Execute a Shotgrid command by name in the Python Shotgrid Engine
  - `get_instance()` -> `ShotgridEngine` [classmethod] — Get the instance of the Python Shotgrid Engine
  - `get_referenced_assets(actor)` -> `Array [ Object ]` — Get the assets that are referenced by the given Actor
  - `get_selected_actors()` -> `Array [ Actor ]` — Selected actors to be used for Shotgrid commands
  - `get_shotgrid_menu_items()` -> `Array [ ShotgridMenuItem ]` — Get the available Shotgrid commands from the Python Shotgrid Engine
  - `get_shotgrid_work_dir()` -> `str` [classmethod] — Get the root path for the Shotgrid work area
  - `on_engine_initialized()` -> `None` — Callback for when the Python Shotgrid Engine has finished initialization
  - `shutdown()` -> `None` — Shut down the Python Shotgrid Engine

**Properties** (2):
  - `selected_actors`: `None` — [Read-Write] (Array[Actor])
  - `selected_assets`: `None` — [Read-Write] Selected assets to be used for Shotgrid commands (Array[AssetData])
