# UE Python API — EngineSettings Module

**6 types** from the `EngineSettings` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GameModeName`, `TemplateMapInfoOverride`, `GameMapsSettings`, `FourPlayerSplitScreenType`, `ThreePlayerSplitScreenType`, `TwoPlayerSplitScreenType`

---

## Classes

### `unreal.GameModeName`
Inherits: `StructBase` | Header: `GameMapsSettings.h`

Helper structure, used to associate GameModes with shortcut names.

### `unreal.TemplateMapInfoOverride`
Inherits: `StructBase` | Header: `GameMapsSettings.h`

Used by new level dialog.

### `unreal.GameMapsSettings`
Inherits: `Object` | Header: `GameMapsSettings.h`

Game Maps Settings

**Methods** (3):
  - `get_game_maps_settings()` -> `GameMapsSettings` [classmethod] — Returns the game local maps settings
  - `get_skip_assigning_gamepad_to_player1()` -> `bool` — Get Skip Assigning Gamepad to Player 1
  - `set_skip_assigning_gamepad_to_player1(skip_first_player = True)` -> `None` — Modify âSkip Assigning Gamepad to Player 1â GameMapsSettings option note: This value is saved to local config when c...

### `unreal.FourPlayerSplitScreenType`
Inherits: `EnumBase` | Header: `GameMapsSettings.h`

EFour Player Split Screen Type

**Properties** (3):
  - `GRID`: `FourPlayerSplitScreenType = Ellipsis` — 0
  - `HORIZONTAL`: `FourPlayerSplitScreenType = Ellipsis` — 2
  - `VERTICAL`: `FourPlayerSplitScreenType = Ellipsis` — 1

### `unreal.ThreePlayerSplitScreenType`
Inherits: `EnumBase` | Header: `GameMapsSettings.h`

Ways the screen can be split with three players.

**Properties** (4):
  - `FAVOR_BOTTOM`: `ThreePlayerSplitScreenType = Ellipsis` — 1
  - `FAVOR_TOP`: `ThreePlayerSplitScreenType = Ellipsis` — 0
  - `HORIZONTAL`: `ThreePlayerSplitScreenType = Ellipsis` — 3
  - `VERTICAL`: `ThreePlayerSplitScreenType = Ellipsis` — 2

### `unreal.TwoPlayerSplitScreenType`
Inherits: `EnumBase` | Header: `GameMapsSettings.h`

Ways the screen can be split with two players.

**Properties** (2):
  - `HORIZONTAL`: `TwoPlayerSplitScreenType = Ellipsis` — 0
  - `VERTICAL`: `TwoPlayerSplitScreenType = Ellipsis` — 1
