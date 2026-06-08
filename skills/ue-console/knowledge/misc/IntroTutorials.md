# UE Python API — IntroTutorials Module

**9 types** from the `IntroTutorials` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TutorialContent`, `TutorialContentAnchor`, `TutorialStage`, `TutorialWidgetContent`, `EditorTutorial`, `EditorTutorialFactory`, `EditorTutorialImportFactory`, `TutorialAnchorIdentifier`, `TutorialContentType`

---

## Classes

### `unreal.TutorialContent`
Inherits: `StructBase` | Header: `EditorTutorial.h`

Content wrapper

### `unreal.TutorialContentAnchor`
Inherits: `StructBase` | Header: `EditorTutorial.h`

A way of identifying something to be highlighted by a tutorial

### `unreal.TutorialStage`
Inherits: `StructBase` | Header: `EditorTutorial.h`

A single tutorial stage, containing the optional main content & a number of widgets with content attached

### `unreal.TutorialWidgetContent`
Inherits: `StructBase` | Header: `EditorTutorial.h`

Content that is displayed relative to a widget

### `unreal.EditorTutorial`
Inherits: `Object` | Header: `EditorTutorial.h`

An asset used to build a stage-by-stage tutorial in the editor

**Methods** (11):
  - `begin_tutorial(tutorial_to_start, restart)` -> `None` [classmethod] — Begin a tutorial. Note that this will end the current tutorial that is in progress, if any
  - `get_actor_reference(path_to_actor)` -> `Actor` — Attempts to find the actor specified by PathToActor in the current editor world
  - `get_engine_folder_visibilty()` -> `bool` [classmethod] — Returns the visibility of the engine folder in the content browser
  - `go_to_next_tutorial_stage()` -> `None` [classmethod] — Advance to the next stage of a tutorial
  - `go_to_previous_tutorial_stage()` -> `None` [classmethod] — Advance to the previous stage of a tutorial
  - `on_tutorial_closed()` -> `None` — Event fired when a tutorial is closed
  - `on_tutorial_launched()` -> `None` — Event fired when a tutorial is launched
  - `on_tutorial_stage_ended(stage_name)` -> `None` — Event fired when a tutorial stage ends
  - `on_tutorial_stage_started(stage_name)` -> `None` — Event fired when a tutorial stage begins
  - `open_asset(asset)` -> `None` [classmethod] — Open an asset for use by a tutorial
  - `set_engine_folder_visibilty(new_visibility)` -> `None` [classmethod] — Sets the visibility of the engine folder in the content browser

**Properties** (1):
  - `sort_order`: `int` [Read-Only] — [Read-Only] Sorting priority, used by the tutorial browser (int32)

### `unreal.EditorTutorialFactory`
Inherits: `Factory` | Header: `EditorTutorialFactory.h`

Editor Tutorial Factory

### `unreal.EditorTutorialImportFactory`
Inherits: `Factory` | Header: `EditorTutorialImportFactory.h`

Editor Tutorial Import Factory

### `unreal.TutorialAnchorIdentifier`
Inherits: `EnumBase` | Header: `EditorTutorial.h`

The type of tutorial content to display

**Properties** (3):
  - `ASSET`: `TutorialAnchorIdentifier = Ellipsis` — An asset accessible via the content browser 2
  - `NAMED_WIDGET`: `TutorialAnchorIdentifier = Ellipsis` — Uses a tutorial wrapper widget 1
  - `NONE`: `TutorialAnchorIdentifier = Ellipsis` — No anchor 0

### `unreal.TutorialContentType`
Inherits: `EnumBase` | Header: `EditorTutorial.h`

The type of tutorial content to display

**Properties** (4):
  - `NONE`: `TutorialContentType = Ellipsis` — Blank - displays no content 0
  - `RICH_TEXT`: `TutorialContentType = Ellipsis` — Rich text content 3
  - `TEXT`: `TutorialContentType = Ellipsis` — Plain text content 1
  - `UDN_EXCERPT`: `TutorialContentType = Ellipsis` — Content from a UDN excerpt 2
