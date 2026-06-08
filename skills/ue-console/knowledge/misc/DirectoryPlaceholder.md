# UE Python API — DirectoryPlaceholder Module

**2 types** from the `DirectoryPlaceholder` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DirectoryPlaceholderFactory`, `DirectoryPlaceholderLibrary`

---

## Classes

### `unreal.DirectoryPlaceholderFactory`
Inherits: `Factory` | Header: `DirectoryPlaceholderFactory.h`

Implements a factory for UDirectoryPlaceholder objects

### `unreal.DirectoryPlaceholderLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DirectoryPlaceholderUtils.h`

Library functions for operations on directory placeholder assets

**Methods** (3):
  - `cleanup_placeholders_in_path(path)` -> `None` [classmethod] — Delete all unnecessary placeholder assets in this folder (and sub-folders)
  - `cleanup_placeholders_in_paths(paths)` -> `None` [classmethod] — Delete all unnecessary placeholder assets in these folders (and sub-folders)
  - `delete_placeholders_in_path(path)` -> `None` [classmethod] — Delete all placeholder assets in this folder (and sub-folders)
