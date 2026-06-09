# UE Python API — ConsoleVariablesEditorRuntime Module

**2 types** from the `ConsoleVariablesEditorRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ConsoleVariablesEditorAssetSaveData`, `ConsoleVariablesAsset`

---

## Classes

### `unreal.ConsoleVariablesEditorAssetSaveData`
Inherits: `StructBase` | Header: `ConsoleVariablesAsset.h`

Data that will be serialized with this asset

### `unreal.ConsoleVariablesAsset`
Inherits: `Object` | Header: `ConsoleVariablesAsset.h`

An asset used to track collections of console variables that can be recalled and edited using the Console Variables Editor.

**Methods** (13):
  - `add_from(asset_to_copy)` -> `None` — Add list of variables from input asset to this assetâs list
  - `add_or_set_console_object_saved_data(data)` -> `None` — Set the value of a saved console variable if the name matches; add a new console variable to the list if a match is not ...
  - `copy_from(asset_to_copy)` -> `None` — Copy list of variables from input asset to this asset
  - `execute_saved_commands(world_context_object, only_include_checked = False)` -> `None` — Executes all saved commands in this asset, optionally only including those with a Checked checkstate in the UI.
  - `find_saved_data_by_command_string(command_string, search_case = SearchCase.IGNORE_CASE)` -> `ConsoleVariablesEditorAssetSaveData or None` — Outputs the FConsoleVariablesEditorAssetSaveData matching InCommand. Returns whether a match was found. Case sensitive.
  - `get_saved_commands()` -> `Array [ ConsoleVariablesEditorAssetSaveData ]` — Returns the saved list of console variable information such as the variable name, the type and the value of the variable...
  - `get_saved_commands_as_comma_separated_string(only_include_checked = False)` -> `str` — Returns the saved list of console variables as a concatenated comma-separated string. Useful for passing commands and va...
  - `get_saved_commands_as_string_array(only_include_checked = False)` -> `Array [ str ]` — Returns the saved list of console variables as an array of FString.
  - `get_saved_commands_count()` -> `int32` — Returns how many console variables are serialized in this asset
  - `get_variable_collection_description()` -> `str` — Get Variable Collection Description
  - `remove_console_variable(command_string)` -> `bool` — Returns true if the element was found and successfully removed.
  - `replace_saved_commands(replacement)` -> `None` — Completely replaces the saved data with new saved data
  - `set_variable_collection_description(variable_collection_description)` -> `None` — Sets a description for this variable collection.

**Properties** (1):
  - `variable_collection_description`: `str` [Read-Only] — [Read-Only] User defined description of the variable collection (str)
