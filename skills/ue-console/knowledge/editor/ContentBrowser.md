# UE Python API — ContentBrowser Module

**3 types** from the `ContentBrowser` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ContentBrowserAssetContextMenuContext`, `ContentBrowserFolderContext`, `ContentBrowserMenuContext`

---

## Classes

### `unreal.ContentBrowserAssetContextMenuContext`
Inherits: `Object` | Header: `ContentBrowserMenuContexts.h`

Content Browser Asset Context Menu Context

**Methods** (3):
  - `get_selected_objects()` -> `Array [ Object ]` — Get Selected Objects deprecated: GetSelectedObjects has been deprecated. We no longer automatically load assets on right...
  - `load_selected_objects(load_tags)` -> `Array [ Object ]` — Loads all the selected assets and returns an array of the objects.
  - `load_selected_objects_if_needed()` -> `Array [ Object ]` — Loads the selected assets (if needed) which is based on AssetViewUtils::LoadAssetsIfNeeded, this exists primarily for ba...

**Properties** (2):
  - `contains_unsupported_assets`: `bool` [Read-Only] — [Read-Only] (bool)
  - `selected_assets`: `None` [Read-Only] — [Read-Only] The currently selected assets in the content browser. (Array[AssetData])

### `unreal.ContentBrowserFolderContext`
Inherits: `ContentBrowserMenuContext` | Header: `ContentBrowserMenuContexts.h`

Content Browser Folder Context

**Properties** (5):
  - `can_be_modified`: `bool` [Read-Only] — [Read-Only] (bool)
  - `no_folder_on_disk`: `bool` [Read-Only] — [Read-Only] (bool)
  - `num_asset_paths`: `int` [Read-Only] — [Read-Only] (int32)
  - `num_class_paths`: `int` [Read-Only] — [Read-Only] (int32)
  - `selected_package_paths`: `None` [Read-Only] — [Read-Only] (Array[str])

### `unreal.ContentBrowserMenuContext`
Inherits: `Object` | Header: `ContentBrowserMenuContexts.h`

Content Browser Menu Context
