# UE Python API — UserToolBoxCore Module

**10 types** from the `UserToolBoxCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `IconFolderInfo`, `IconTrackerFactory`, `UserToolBoxBaseBlueprint`, `UserToolBoxFunctionLibrary`, `UserToolboxSubsystem`, `UTBBaseCommand`, `UTBCommandFactory`, `UTBCommandTabFactory`, `UTBCommandUMGUI`, `UTBEditorUtilityBlueprintFactory`

---

## Classes

### `unreal.IconFolderInfo`
Inherits: `TableRowBase` | Header: `IconsTracker.h`

Icon Folder Info

### `unreal.IconTrackerFactory`
Inherits: `Factory` | Header: `UTBFactory.h`

Icon Tracker Factory

### `unreal.UserToolBoxBaseBlueprint`
Inherits: `UTBBaseCommand` | Header: `UserToolBoxBaseBlueprint.h`

User Tool Box Base Blueprint

**Methods** (1):
  - `command()` -> `None` — Command

### `unreal.UserToolBoxFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `UserToolBoxFunctionLibrary.h`

User Tool Box Function Library

**Methods** (3):
  - `get_all_slate_style()` -> `Array [ Name ]` [classmethod] — Get All Slate Style
  - `get_brush_by_id(name)` -> `SlateBrush` [classmethod] — Get Brush by Id
  - `get_brush_by_style_and_id(style_name, id)` -> `SlateBrush` [classmethod] — Get Brush by Style and Id

### `unreal.UserToolboxSubsystem`
Inherits: `EditorSubsystem` | Header: `UserToolBoxSubsystem.h`

User Toolbox Subsystem

**Methods** (3):
  - `pick_an_icon()` -> `str or None` — Pick An Icon
  - `refresh_icons()` -> `None` — Refresh Icons
  - `register_tab_data()` -> `None` — Register Tab Data

### `unreal.UTBBaseCommand`
Inherits: `Object` | Header: `UTBBaseCommand.h`

UUTBBaseCommand is the base class for any command of the usertoolbox framework. Inherit directly from this class if you want to create a new command implemented in c++

**Methods** (2):
  - `add_object_to_transaction(object)` -> `None` — Add Object to Transaction
  - `add_objects_to_transaction(objects)` -> `None` — Add Objects to Transaction

**Properties** (6):
  - `category`: `str` — [Read-Write] (str)
  - `icon_path`: `str` — [Read-Write] The icon path for the command (str)
  - `name`: `str` — [Read-Write] The name of the command (str)
  - `show_parameters`: `bool` — [Read-Write] (bool)
  - `tooltip`: `str` — [Read-Write] (str)
  - `ui_override`: `Class` — [Read-Write] (type(Class))

### `unreal.UTBCommandFactory`
Inherits: `Factory` | Header: `UTBFactory.h`

UTBCommand Factory

### `unreal.UTBCommandTabFactory`
Inherits: `Factory` | Header: `UTBFactory.h`

UTBCommand Tab Factory

### `unreal.UTBCommandUMGUI`
Inherits: `UserWidget` | Header: `UTBBaseUICommand.h`

UTBCommand UMGUI

**Methods** (2):
  - `does_support_class(object_class)` -> `bool` — Does Support Class
  - `execute_command()` -> `None` — Execute Command

**Properties** (1):
  - `command`: `UTBBaseCommand` [Read-Only] — [Read-Only] (UTBBaseCommand)

### `unreal.UTBEditorUtilityBlueprintFactory`
Inherits: `Factory` | Header: `UTBFactory.h`

UTBEditor Utility Blueprint Factory
