# UE Python API — SlateScriptingCommands Module

**4 types** from the `SlateScriptingCommands` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ScriptingCommandInfo`, `UICommandsScriptingSubsystem`, `CanExecuteCommand`, `ExecuteCommand`

---

## Classes

### `unreal.ScriptingCommandInfo`
Inherits: `StructBase` | Header: `UICommandsScriptingSubsystem.h`

The data defining a scripting command. At the exception of its delegates.

**Properties** (6):
  - `context_name`: `Name` — [Read-Write] The editor context this command is bound to (Name)
  - `description`: `Text` — [Read-Write] The description of the command (Text)
  - `input_chord`: `InputChord` — [Read-Write] The input chord to bound to the command (InputChord)
  - `label`: `Text` — [Read-Write] The command label or what name will be displayed for it (Text)
  - `name`: `Name` — [Read-Write] The command name. Must be unique in its set. (Name)
  - `set`: `Name` — [Read-Write] The command set this command belongs to. This is to avoid conflicts and could refer to ...

### `unreal.UICommandsScriptingSubsystem`
Inherits: `EngineSubsystem` | Header: `UICommandsScriptingSubsystem.h`

UEditorInputSubsystem Subsystem for dynamically registering editor commands through scripting

**Methods** (17):
  - `can_execute_commands()` -> `bool` — Checks whether commands registered in the subsystem can be executed
  - `can_set_execute_commands(set_name)` -> `bool` — Checks whether commands in the given set can be executed. This will also check CanExecuteCommands at a global scope
  - `get_available_contexts()` -> `Array [ Name ]` — Retrieves the list of names for all contexts currently registered in the subsystem. This does not check whether the cont...
  - `get_binding_count_for_context(context_name)` -> `int32` — Retrieves the number of UI Command Lists registered within this context through the subsystem. UI Command Lists are typi...
  - `get_registered_commands()` -> `Array [ ScriptingCommandInfo ]` — Retrieves the list of command info for all commands currently registered in the subsystem
  - `is_command_registered(command_info, check_input_chord = True)` -> `bool` — Checks whether the given command is registered within the subsystem. Using name, set and context for comparison
  - `is_command_set_registered(set_name)` -> `bool` — Checks whether the given set is currently registered in the subsystem
  - `is_context_registered(context_name)` -> `bool` — Checks whether the context with the given name is currently registered in the subsystem This does not check whether the ...
  - `is_input_chord_mapped(context_name, input_chord)` -> `bool` — Checks whether the given input chord is already mapped to a command in the given context. This includes commands not reg...
  - `register_command(command_info, on_execute_command, override_existing = False)` -> `bool` — Registers a command within the given context and set. The set must be registered beforehand.
  - `register_command_checked(command_info, on_execute_command, on_can_execute_command, override_existing = False)` -> `bool` — Registers a command within the given context and set. The set must be registered beforehand.
  - `register_command_set(set_name)` -> `bool` — Registers a new command set
  - `set_can_execute_commands(should_execute_commands)` -> `None` — Sets whether commands registered in the subsystem can be executed
  - `set_can_set_execute_commands(set_name, should_execute_commands)` -> `None` — Enables or disables execution of commands registered within the given set
  - `unregister_all_sets()` -> `None` — Unregisters all commands dynamically registered within all contexts and sets. warning: this will unregister all commands...
  - `unregister_command(command_info)` -> `bool` — Unregisters a command previously registered. The command name, set and context will be used for comparison.
  - `unregister_command_set(set_name)` -> `bool` — Unregisters the corresponding command set with all commands registered within it

### `unreal.CanExecuteCommand`
Inherits: `DelegateBase` | Header: `UICommandsScriptingSubsystem.h`

Exposing FCanExecuteAction as dynamic

### `unreal.ExecuteCommand`
Inherits: `DelegateBase` | Header: `UICommandsScriptingSubsystem.h`

Exposing FExecuteAction as dynamic
