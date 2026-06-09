# UE Python API — SourceControl Module

**3 types** from the `SourceControl` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SourceControlState`, `SourceControl`, `SourceControl_QueryFileStateDelegate`

---

## Classes

### `unreal.SourceControlState`
Inherits: `StructBase` | Header: `SourceControlHelpers.h`

Snapshot of source control state of a file see: USourceControlHelpers::QueryFileState()

**Properties** (21):
  - `can_add`: `bool` [Read-Only] — [Read-Only] Determine if this file can be added to source control (i.e. is part of the directory
str...
  - `can_check_in`: `bool` [Read-Only] — [Read-Only] Determine if this file can be checked in. (bool)
  - `can_check_out`: `bool` [Read-Only] — [Read-Only] Determine if this file can be checked out (bool)
  - `can_delete`: `bool` [Read-Only] — [Read-Only] Determine if source control allows this file to be deleted. (bool)
  - `can_edit`: `bool` [Read-Only] — [Read-Only] Determine if source control allows this file to be edited (bool)
  - `can_revert`: `bool` [Read-Only] — [Read-Only] Determine if this file can be reverted, i.e. discard changes and the file will no longer...
  - `checked_out_other`: `str` [Read-Only] — [Read-Only] Get name of other user who this file already checked out or ââ if no other user has ...
  - `filename`: `str` [Read-Only] — [Read-Only] Get the local filename that this state represents (str)
  - `is_added`: `bool` [Read-Only] — [Read-Only] Determine if this file is marked for add
note: if already checked in then not considered...
  - `is_checked_out`: `bool` [Read-Only] — [Read-Only] Determine if this file is checked out (bool)
  - `is_checked_out_in_other_branch`: `bool` [Read-Only] — [Read-Only] Determine if this file is checked out by someone else in another branch (bool)
  - `is_checked_out_other`: `bool` [Read-Only] — [Read-Only] Determine if this file is checked out by someone else (bool)
  - `is_conflicted`: `bool` [Read-Only] — [Read-Only] Determine if this file is in a conflicted state (bool)
  - `is_current`: `bool` [Read-Only] — [Read-Only] Determine if this file is up-to-date with the version in source control (bool)
  - `is_deleted`: `bool` [Read-Only] — [Read-Only] Determine if this file is marked for delete (bool)
  - `is_ignored`: `bool` [Read-Only] — [Read-Only] Determine if this file is ignored by source control (bool)
  - `is_modified`: `bool` [Read-Only] — [Read-Only] Determine if this file is modified compared to the version in source control. (bool)
  - `is_modified_in_other_branch`: `bool` [Read-Only] — [Read-Only] Determine if this file is modified by someone in another branch (bool)
  - `is_source_controlled`: `bool` [Read-Only] — [Read-Only] Determine if this file is under source control (bool)
  - `is_unknown`: `bool` [Read-Only] — [Read-Only] Determine if we know anything about the source control state of this file (bool)
  - `is_valid`: `bool` [Read-Only] — [Read-Only] Indicates whether this source control state has valid information (true) or not (false) ...

### `unreal.SourceControl`
Inherits: `Object` | Header: `SourceControlHelpers.h`

Editor source control common functionality. note: Many of these source control methods use smart file strings which can be one of: - fully qualified path - relative path - long package name - asset pa...

**Methods** (26):
  - `async_query_file_state(file_state_callback, file, silent = False)` -> `None` [classmethod] — Query the source control state of the specified file, asynchronously.
  - `async_query_file_states(file_state_callback, files, silent = False)` -> `None` [classmethod] — Async Query File States
  - `check_in_file(file, description, silent = False, keep_checked_out = False)` -> `bool` [classmethod] — Use currently set source control provider to check in a file. note: Blocks until action is complete.
  - `check_in_files(files, description, silent = False, keep_checked_out = False)` -> `bool` [classmethod] — Use currently set source control provider to check in specified files. note: Blocks until action is complete.
  - `check_out_file(file, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to check out a file. note: Blocks until action is complete.
  - `check_out_files(files, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to check out specified files. note: Blocks until action is complete.
  - `check_out_or_add_file(file, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to check out file or mark it for add. note: Blocks until action is complete.
  - `check_out_or_add_files(files, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to check out files or mark them for add. note: Blocks until action is complete...
  - `copy_file(source_file, dest_file, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to copy a file. note: Blocks until action is complete.
  - `current_provider()` -> `str` [classmethod] — Determine the name of the current source control provider.
  - `is_available()` -> `bool` [classmethod] — Quick check if currently set source control provider is enabled and available for use (server-based providers can use th...
  - `is_enabled()` -> `bool` [classmethod] — Determine if there is a source control system enabled
  - `last_error_msg()` -> `Text` [classmethod] — Get status text set by SourceControl system if an error occurs regardless whether bSilent is set or not. Only set if the...
  - `mark_file_for_add(file, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to mark a file for add. Does nothing (and returns true) if the file is already...
  - `mark_file_for_delete(file, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to remove file from source control and delete the file. note: Blocks until act...
  - `mark_files_for_add(files, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to mark files for add. Does nothing (and returns true) for any file that is al...
  - `mark_files_for_delete(files, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to remove files from source control and delete the files. note: Blocks until a...
  - `query_file_state(file, silent = False)` -> `SourceControlState` [classmethod] — Use currently set source control provider to query a fileâs source control state. note: Blocks until action is complet...
  - `query_file_states(files, silent = False)` -> `Array [ SourceControlState ]` [classmethod] — Query File States
  - `revert_and_reload_packages(packages_to_revert, revert_all = False, reload_world = False)` -> `bool` [classmethod] — Reverts the provided files then reloads packages.
  - `revert_file(file, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to revert a file regardless whether any changes will be lost or not. note: Blo...
  - `revert_files(files, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to revert files regardless whether any changes will be lost or not. note: Bloc...
  - `revert_unchanged_file(file, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to revert a file provided no changes have been made. note: Blocks until action...
  - `revert_unchanged_files(files, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to revert files provided no changes have been made. note: Blocks until action ...
  - `sync_file(file, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to sync a file or directory to the head revision. note: Blocks until action is...
  - `sync_files(files, silent = False)` -> `bool` [classmethod] — Use currently set source control provider to sync files or directories to the head revision. note: Blocks until action i...

### `unreal.SourceControl_QueryFileStateDelegate`
Inherits: `DelegateBase` | Header: `SourceControlHelpers.h`

Delegate to broadcast FileState upon AsyncQueryFileState completion
