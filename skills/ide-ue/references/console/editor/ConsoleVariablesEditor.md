# UE Python API — ConsoleVariablesEditor Module

**5 types** from the `ConsoleVariablesEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ConcertCVarSynchronization`, `ConsoleVariablesEditorFactory`, `ConsoleVariablesEditorFunctionLibrary`, `ConsoleVariablesEditorPresetImportMode`, `ConsoleVariablesEditorRowDisplayType`

---

## Classes

### `unreal.ConcertCVarSynchronization`
Inherits: `Object` | Header: `ConsoleVariableSyncData.h`

Concert CVar Synchronization

**Properties** (1):
  - `sync_c_var_transactions`: `bool` — [Read-Write] (bool)

### `unreal.ConsoleVariablesEditorFactory`
Inherits: `Factory` | Header: `ConsoleVariablesEditorFactory.h`

Console Variables Editor Factory

### `unreal.ConsoleVariablesEditorFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ConsoleVariablesEditorFunctionLibrary.h`

An asset used to track collections of console variables that can be recalled and edited using the Console Variables Editor.

**Methods** (14):
  - `add_validated_command_to_current_preset(new_command)` -> `bool` [classmethod]
  - `copy_current_list_to_asset(asset)` -> `bool` [classmethod]
  - `get_console_variable_source_by_name(command_name)` -> `str or None` [classmethod] — Set a console variable value directly. Returns true if the console object exists.
  - `get_console_variable_string_value(command_name)` -> `str or None` [classmethod] — Get a console variableâs string value directly. Returns true if the console object exists.
  - `get_currently_loaded_preset()` -> `ConsoleVariablesAsset` [classmethod] — Return the currently loaded list of variables in the Console Variables Editor.
  - `get_enable_multi_user_c_var_sync()` -> `bool` [classmethod] — Return whether the Multi-user sync setting for the current instance of the editor is enabled.
  - `get_list_of_commands_from_preset(asset)` -> `Array[str] or None` [classmethod] — Return an array of strings containing the command names for each command found in the given preset.
  - `load_preset_into_console_variables_editor(asset, import_mode = ConsoleVariablesEditorPresetImportMode.ADD_TO_EXISTING)` -> `None` [classmethod] — Loads the given asset in the Console Variables Editor and sets all its variable values.
  - `remove_command_from_current_preset(new_command)` -> `bool` [classmethod]
  - `set_console_variable_by_name_bool(command_name, value)` -> `bool` [classmethod] — Set a console variable value directly. Returns true if the console object exists.
  - `set_console_variable_by_name_float(command_name, value)` -> `bool` [classmethod] — Set a console variable value directly. Returns true if the console object exists.
  - `set_console_variable_by_name_int(command_name, value)` -> `bool` [classmethod] — Set a console variable value directly. Returns true if the console object exists.
  - `set_console_variable_by_name_string(command_name, value)` -> `bool` [classmethod] — Set a console variable value directly. Returns true if the console object exists.
  - `set_enable_multi_user_c_var_sync(new_setting)` -> `None` [classmethod] — Enable or disable the Multi-user sync setting for the current instance of the editor.

### `unreal.ConsoleVariablesEditorPresetImportMode`
Inherits: `EnumBase` | Header: `ConsoleVariablesEditorProjectSettings.h`

EConsole Variables Editor Preset Import Mode

**Properties** (2):
  - `ADD_TO_EXISTING`: `ConsoleVariablesEditorPresetImportMode = Ellipsis` — Add the list of variables from the imported preset to the current preset, replacing the values of an...
  - `REPLACE_EXISTING`: `ConsoleVariablesEditorPresetImportMode = Ellipsis` — Completely replace the list of variables in the current preset, resetting them to their default valu...

### `unreal.ConsoleVariablesEditorRowDisplayType`
Inherits: `EnumBase` | Header: `ConsoleVariablesEditorProjectSettings.h`

EConsole Variables Editor Row Display Type

**Properties** (2):
  - `SHOW_CURRENT_VALUE`: `ConsoleVariablesEditorRowDisplayType = Ellipsis` — 0
  - `SHOW_LAST_ENTERED_VALUE`: `ConsoleVariablesEditorRowDisplayType = Ellipsis` — 1
