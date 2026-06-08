# UE Python API — BlueprintFileUtils Module

**1 types** from the `BlueprintFileUtils` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BlueprintFileUtilsBPLibrary`

---

## Classes

### `unreal.BlueprintFileUtilsBPLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlueprintFileUtilsBPLibrary.h`

Blueprint File Utils BPLibrary

**Methods** (10):
  - `copy_file(dest_filename, src_filename, replace = True, even_if_read_only = False)` -> `bool` [classmethod] — Copies a file.
  - `delete_directory(directory, must_exist = False, delete_recursively = False)` -> `bool` [classmethod] — Deletes a directory and all the files in it and optionally all sub-directories and files within it
  - `delete_file(filename, must_exist = False, even_if_read_only = False)` -> `bool` [classmethod] — Deletes a file.
  - `directory_exists(directory)` -> `bool` [classmethod] — Checks if a directory exists
  - `file_exists(filename)` -> `bool` [classmethod] — Checks if a file exists
  - `find_files(directory, file_extension = '')` -> `Array[str] or None` [classmethod] — Finds all the files within the given directory, with optional file extension filter.
  - `find_recursive(start_directory, wildcard = '', find_files = True, find_directories = False)` -> `Array[str] or None` [classmethod] — Finds all the files and/or directories within the given directory and any sub-directories. Files can be found with anopt...
  - `get_user_directory()` -> `str` [classmethod] — Get the users directory. Platform specific (usually something like MyDocuments or the users home directory
  - `make_directory(path, create_tree = False)` -> `bool` [classmethod] — Makes a new directory, and optionally sub-directories
  - `move_file(dest_filename, src_filename, replace = True, even_if_read_only = False)` -> `bool` [classmethod] — Move File
