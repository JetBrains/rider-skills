# UE Python API — WorkspaceEditor Module

**2 types** from the `WorkspaceEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `Workspace`, `WorkspaceFactory`

---

## Classes

### `unreal.Workspace`
Inherits: `Object` | Header: `Workspace.h`

**Methods** (4):
  - `add_asset(asset, setup_undo_redo = True, print_python_command = True)` -> `bool` — Adds an asset to the workspace
  - `add_assets(assets, setup_undo_redo = True, print_python_command = True)` -> `bool` — Adds assets to the workspace
  - `remove_asset(asset, setup_undo_redo = True, print_python_command = True)` -> `bool` — Removes an asset from the workspace
  - `remove_assets(assets, setup_undo_redo = True, print_python_command = True)` -> `bool` — Removes assets from the workspace

### `unreal.WorkspaceFactory`
Inherits: `Factory` | Header: `WorkspaceFactory.h`

Workspace Factory
