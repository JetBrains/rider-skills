# UE Python API — ContentBrowserData Module

**19 types** from the `ContentBrowserData` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ContentBrowserDataClassFilter`, `ContentBrowserDataCollectionFilter`, `ContentBrowserDataFilter`, `ContentBrowserDataObjectFilter`, `ContentBrowserDataPackageFilter`, `ContentBrowserItem`, `ContentBrowserItemPath`, `ContentBrowserDataMenuContext_AddNewMenu`, `ContentBrowserDataMenuContext_DragDropMenu`, `ContentBrowserDataMenuContext_FileMenu`, `ContentBrowserDataMenuContext_FolderMenu`, `ContentBrowserDataSubsystem`, `ContentBrowserItemLibrary`, `ContentBrowserItemPathExtensions`, `ContentBrowserDataMenuContext_AddNewMenuDomain`, `ContentBrowserItemAttributeFilter`, `ContentBrowserItemCategoryFilter`, `ContentBrowserItemTypeFilter`, `ContentBrowserPathType`

---

## Classes

### `unreal.ContentBrowserDataClassFilter`
Inherits: `StructBase` | Header: `ContentBrowserDataFilter.h`

Data used to filter object instances by their class. note: This will typically limit your query to returning assets.

**Properties** (4):
  - `class_names_to_exclude`: `None` — [Read-Write] Array of class names that should be excluded from this query (Array[str])
  - `class_names_to_include`: `None` — [Read-Write] Array of class names that should be included in this query (Array[str])
  - `recursive_class_names_to_exclude`: `bool` — [Read-Write] Whether we should include exclusive sub-classes in this query (bool)
  - `recursive_class_names_to_include`: `bool` — [Read-Write] Whether we should include inclusive sub-classes in this query (bool)

### `unreal.ContentBrowserDataCollectionFilter`
Inherits: `StructBase` | Header: `ContentBrowserDataFilter.h`

Data used to filter items by their collection. note: This will typically limit your query to items that support being inside a collection.

**Properties** (1):
  - `include_child_collections`: `bool` — [Read-Write] Whether we should include child collections in this query (bool)

### `unreal.ContentBrowserDataFilter`
Inherits: `StructBase` | Header: `ContentBrowserDataFilter.h`

A filter used to control what is returned from Content Browser data queries. note: The compiled version of this, FContentBrowserDataCompiledFilter, is produced via UContentBrowserDataSubsystem::Compil...

**Properties** (4):
  - `item_attribute_filter`: `ContentBrowserItemAttributeFilter` — [Read-Write] Flags controlling which item attributes should be included in this query (ContentBrowse...
  - `item_category_filter`: `ContentBrowserItemCategoryFilter` — [Read-Write] Flags controlling which item categories should be included in this query (ContentBrowse...
  - `item_type_filter`: `ContentBrowserItemTypeFilter` — [Read-Write] Flags controlling which item types should be included in this query (ContentBrowserItem...
  - `recursive_paths`: `bool` — [Read-Write] Whether we should include sub-paths in this query (bool)

### `unreal.ContentBrowserDataObjectFilter`
Inherits: `StructBase` | Header: `ContentBrowserDataFilter.h`

Data used to filter object instances by their name and tags. note: This will typically limit your query to returning assets.

**Properties** (3):
  - `object_names_to_exclude`: `None` — [Read-Write] Array of object names that should be excluded from this query (Array[Name])
  - `object_names_to_include`: `None` — [Read-Write] Array of object names that should be included in this query (Array[Name])
  - `on_disk_objects_only`: `bool` — [Read-Write] Whether we should only include on-disk objects (ignoring those that exist only in memor...

### `unreal.ContentBrowserDataPackageFilter`
Inherits: `StructBase` | Header: `ContentBrowserDataFilter.h`

Data used to filter object instances by their package. note: This will typically limit your query to returning assets.

**Properties** (6):
  - `package_names_to_exclude`: `None` — [Read-Write] Array of package names that should be excluded from this query (Array[Name])
  - `package_names_to_include`: `None` — [Read-Write] Array of package names that should be included in this query (Array[Name])
  - `package_paths_to_exclude`: `None` — [Read-Write] Array of package paths that should be excluded from this query (Array[Name])
  - `package_paths_to_include`: `None` — [Read-Write] Array of package paths that should be included in this query (Array[Name])
  - `recursive_package_paths_to_exclude`: `bool` — [Read-Write] Whether we should include exclusive package sub-paths in this query (bool)
  - `recursive_package_paths_to_include`: `bool` — [Read-Write] Whether we should include inclusive package sub-paths in this query (bool)

### `unreal.ContentBrowserItem`
Inherits: `StructBase` | Header: `ContentBrowserItem.h`

Representation of a Content Browser item.

**Methods** (4):
  - `get_display_name()` -> `Text` — Get Display Name
  - `get_virtual_path()` -> `Name` — Get Virtual Path
  - `is_file()` -> `bool` — Is File
  - `is_folder()` -> `bool` — Is Folder

### `unreal.ContentBrowserItemPath`
Inherits: `StructBase` | Header: `ContentBrowserItemPath.h`

Hold multiple versions of a path as FNames

**Methods** (3):
  - `get_internal_path()` -> `Name` — Returns internal path if there is one (eg,. â/PluginA/MyFileâ).
  - `get_virtual_path()` -> `Name` — Returns virtual path as FName (eg, â/All/Plugins/PluginA/MyFileâ).
  - `set_path(path, path_type)` -> `None` — Set the path being stored

### `unreal.ContentBrowserDataMenuContext_AddNewMenu`
Inherits: `Object` | Header: `ContentBrowserDataMenuContexts.h`

Content Browser Data Menu Context Add New Menu

**Properties** (4):
  - `can_be_modified`: `bool` [Read-Only] — [Read-Only] (bool)
  - `contains_valid_package_path`: `bool` [Read-Only] — [Read-Only] At least one of the selected paths maps to a mounted content root (bool)
  - `owner_domain`: `ContentBrowserDataMenuContext_AddNewMenuDomain` [Read-Only] — [Read-Only] (ContentBrowserDataMenuContext_AddNewMenuDomain)
  - `selected_paths`: `None` [Read-Only] — [Read-Only] (Array[Name])

### `unreal.ContentBrowserDataMenuContext_DragDropMenu`
Inherits: `Object` | Header: `ContentBrowserDataMenuContexts.h`

Content Browser Data Menu Context Drag Drop Menu

**Properties** (4):
  - `can_copy`: `bool` [Read-Only] — [Read-Only] (bool)
  - `can_move`: `bool` [Read-Only] — [Read-Only] (bool)
  - `dragged_items`: `None` [Read-Only] — [Read-Only] (Array[ContentBrowserItem])
  - `drop_target_item`: `ContentBrowserItem` [Read-Only] — [Read-Only] (ContentBrowserItem)

### `unreal.ContentBrowserDataMenuContext_FileMenu`
Inherits: `Object` | Header: `ContentBrowserDataMenuContexts.h`

Content Browser Data Menu Context File Menu

**Properties** (5):
  - `can_be_modified`: `bool` [Read-Only] — [Read-Only] (bool)
  - `can_view`: `bool` [Read-Only] — [Read-Only] (bool)
  - `contains_unsupported_assets`: `bool` [Read-Only] — [Read-Only] (bool)
  - `has_cooked_packages`: `bool` [Read-Only] — [Read-Only] (bool)
  - `selected_items`: `None` [Read-Only] — [Read-Only] (Array[ContentBrowserItem])

### `unreal.ContentBrowserDataMenuContext_FolderMenu`
Inherits: `Object` | Header: `ContentBrowserDataMenuContexts.h`

Content Browser Data Menu Context Folder Menu

**Properties** (2):
  - `can_be_modified`: `bool` [Read-Only] — [Read-Only] (bool)
  - `selected_items`: `None` [Read-Only] — [Read-Only] (Array[ContentBrowserItem])

### `unreal.ContentBrowserDataSubsystem`
Inherits: `EditorSubsystem` | Header: `ContentBrowserDataSubsystem.h`

Subsystem that provides access to Content Browser data. This type deals with the composition of multiple data sources, which provide information about the folders and files available in the Content Br...

**Methods** (9):
  - `activate_all_data_sources()` -> `None` — Activate all available data sources.
  - `activate_data_source(name)` -> `bool` — Attempt to activate the named data source.
  - `deactivate_all_data_sources()` -> `None` — Deactivate all active data sources.
  - `deactivate_data_source(name)` -> `bool` — Attempt to deactivate the named data source.
  - `get_active_data_sources()` -> `Array [ Name ]` — Get the list of current active data sources.
  - `get_available_data_sources()` -> `Array [ Name ]` — Get the list of current available data sources.
  - `get_item_at_path(path, item_type_filter)` -> `ContentBrowserItem` — Get the first item (folder and/or file) that exists at the given virtual path.
  - `get_items_at_path(path, item_type_filter)` -> `Array [ ContentBrowserItem ]` — Get the items (folders and/or files) that exist at the given virtual path. note: Multiple items may have the same virtua...
  - `get_items_under_path(path, filter)` -> `Array [ ContentBrowserItem ]` — Get the items (folders and/or files) that exist under the given virtual path.

### `unreal.ContentBrowserItemLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ContentBrowserItem.h`

TODO: Script API exposure

**Methods** (4):
  - `get_display_name(item)` -> `Text` [classmethod] — Get Display Name
  - `get_virtual_path(item)` -> `Name` [classmethod] — Get Virtual Path
  - `is_file(item)` -> `bool` [classmethod] — Is File
  - `is_folder(item)` -> `bool` [classmethod] — Is Folder

### `unreal.ContentBrowserItemPathExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `ContentBrowserItemPath.h`

Content Browser Item Path Extensions

**Methods** (3):
  - `get_internal_path(item_path)` -> `Name` [classmethod] — Returns internal path if there is one (eg,. â/PluginA/MyFileâ).
  - `get_virtual_path(item_path)` -> `Name` [classmethod] — Returns virtual path as FName (eg, â/All/Plugins/PluginA/MyFileâ).
  - `set_path(item_path, path, path_type)` -> `ContentBrowserItemPath` [classmethod] — Set the path being stored

### `unreal.ContentBrowserDataMenuContext_AddNewMenuDomain`
Inherits: `EnumBase` | Header: `ContentBrowserDataMenuContexts.h`

EContent Browser Data Menu Context Add New Menu Domain

**Properties** (3):
  - `ASSET_VIEW`: `ContentBrowserDataMenuContext_AddNewMenuDomain = Ellipsis` — 1
  - `PATH_VIEW`: `ContentBrowserDataMenuContext_AddNewMenuDomain = Ellipsis` — 2
  - `TOOLBAR`: `ContentBrowserDataMenuContext_AddNewMenuDomain = Ellipsis` — 0

### `unreal.ContentBrowserItemAttributeFilter`
Inherits: `EnumBase` | Header: `ContentBrowserDataFilter.h`

Flags controlling which item attributes should be included

**Properties** (7):
  - `INCLUDE_ALL`: `ContentBrowserItemAttributeFilter = Ellipsis` — 31
  - `INCLUDE_DEVELOPER`: `ContentBrowserItemAttributeFilter = Ellipsis` — 8
  - `INCLUDE_ENGINE`: `ContentBrowserItemAttributeFilter = Ellipsis` — 2
  - `INCLUDE_LOCALIZED`: `ContentBrowserItemAttributeFilter = Ellipsis` — 16
  - `INCLUDE_NONE`: `ContentBrowserItemAttributeFilter = Ellipsis` — 0
  - `INCLUDE_PLUGINS`: `ContentBrowserItemAttributeFilter = Ellipsis` — 4
  - `INCLUDE_PROJECT`: `ContentBrowserItemAttributeFilter = Ellipsis` — 1

### `unreal.ContentBrowserItemCategoryFilter`
Inherits: `EnumBase` | Header: `ContentBrowserDataFilter.h`

Flags controlling which item categories should be included Generally matches EContentBrowserItemFlags::Category_MASK

**Properties** (7):
  - `INCLUDE_ALL`: `ContentBrowserItemCategoryFilter = Ellipsis` — 31
  - `INCLUDE_ASSETS`: `ContentBrowserItemCategoryFilter = Ellipsis` — 1
  - `INCLUDE_CLASSES`: `ContentBrowserItemCategoryFilter = Ellipsis` — 2
  - `INCLUDE_COLLECTIONS`: `ContentBrowserItemCategoryFilter = Ellipsis` — 4
  - `INCLUDE_MISC`: `ContentBrowserItemCategoryFilter = Ellipsis` — 16
  - `INCLUDE_NONE`: `ContentBrowserItemCategoryFilter = Ellipsis` — 0
  - `INCLUDE_REDIRECTORS`: `ContentBrowserItemCategoryFilter = Ellipsis` — 8

### `unreal.ContentBrowserItemTypeFilter`
Inherits: `EnumBase` | Header: `ContentBrowserDataFilter.h`

Flags controlling which item types should be included Generally matches EContentBrowserItemFlags::Type_MASK

**Properties** (4):
  - `INCLUDE_ALL`: `ContentBrowserItemTypeFilter = Ellipsis` — 3
  - `INCLUDE_FILES`: `ContentBrowserItemTypeFilter = Ellipsis` — 2
  - `INCLUDE_FOLDERS`: `ContentBrowserItemTypeFilter = Ellipsis` — 1
  - `INCLUDE_NONE`: `ContentBrowserItemTypeFilter = Ellipsis` — 0

### `unreal.ContentBrowserPathType`
Inherits: `EnumBase` | Header: `ContentBrowserDataSubsystem.h`

EContent Browser Path Type

**Properties** (3):
  - `INTERNAL`: `ContentBrowserPathType = Ellipsis` — Internal path compatible with asset registry and engine calls (eg,. â/PluginA/MyFileâ) 1
  - `NONE`: `ContentBrowserPathType = Ellipsis` — No path type set 0
  - `VIRTUAL`: `ContentBrowserPathType = Ellipsis` — Virtual path for enumerating Content Browser data (eg, â/All/Plugins/PluginA/MyFileâ) 2
