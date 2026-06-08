# UE Python API — AssetRegistry Module

**6 types** from the `AssetRegistry` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AssetRegistryDependencyOptions`, `TagAndValue`, `AssetRegistry`, `AssetRegistryHelpers`, `AssetRegistrySortOrder`, `AssetRegistryHelpers_SortingPredicate`

---

## Classes

### `unreal.AssetRegistryDependencyOptions`
Inherits: `StructBase` | Header: `IAssetRegistry.h`

namespace UE::AssetRegistry

**Properties** (5):
  - `include_hard_management_references`: `bool` — [Read-Write] Reference that says one object directly manages another object, set when Primary Assets...
  - `include_hard_package_references`: `bool` — [Read-Write] Dependencies which are required for correct usage of the source asset, and must be load...
  - `include_searchable_names`: `bool` — [Read-Write] References to specific SearchableNames inside a package (bool)
  - `include_soft_management_references`: `bool` — [Read-Write] Indirect management references, these are set through recursion for Primary Assets that...
  - `include_soft_package_references`: `bool` — [Read-Write] Dependencies which donât need to be loaded for the object to be used (i.e. soft objec...

### `unreal.TagAndValue`
Inherits: `StructBase` | Header: `AssetRegistryHelpers.h`

Tag and Value

**Properties** (2):
  - `tag`: `Name` — [Read-Write] (Name)
  - `value`: `str` — [Read-Write] (str)

### `unreal.AssetRegistry`
Inherits: `Interface` | Header: `IAssetRegistry.h`

Asset Registry

**Methods** (28):
  - `get_all_assets(include_only_on_disk_assets = False)` -> `Array[AssetData] or None` — Gets asset data for all assets in the registry. This method may be slow, use a filter if possible to avoid iterating ove...
  - `get_all_cached_paths()` -> `Array [ str ]` — Gets a list of all paths that are currently cached
  - `get_ancestor_class_names(class_path_name)` -> `Array[TopLevelAssetPath] or None` — Returns true if the specified ClassNameâs ancestors could be found. If so, OutAncestorClassNames is a list of all its ...
  - `get_asset_by_object_path(object_path, include_only_on_disk_assets = False)` -> `AssetData` — Get Asset by Object Path deprecated: Use other version that takes a SoftObjectPath
  - `get_assets(filter, skip_ar_filtered_assets = True)` -> `Array[AssetData] or None` — Gets asset data for all assets that match the filter. Assets returned must satisfy every filter component if there is at...
  - `get_assets_by_class(class_path_name, search_sub_classes = False)` -> `Array[AssetData] or None` — Gets asset data for all assets with the supplied class
  - `get_assets_by_package_name(package_name, include_only_on_disk_assets = False, skip_ar_filtered_assets = True)` -> `Array[AssetData] or None` — Gets asset data for the assets in the package with the specified package name see: IAssetRegistry class header for bIncl...
  - `get_assets_by_path(package_path, recursive = False, include_only_on_disk_assets = False)` -> `Array[AssetData] or None` — Gets asset data for all assets in the supplied folder path see: IAssetRegistry class header for bIncludeOnlyOnDiskAssets...
  - `get_assets_by_paths(package_paths, recursive = False, include_only_on_disk_assets = False)` -> `Array[AssetData] or None` — Gets asset data for all assets in any of the supplied folder paths see: IAssetRegistry class header for bIncludeOnlyOnDi...
  - `get_dependencies(package_name, dependency_options)` -> `Array[Name] or None` — Gets a list of paths to objects that are referenced by the supplied package. (On disk references ONLY)
  - `get_derived_class_names(class_names, excluded_class_names)` -> `Set [ TopLevelAssetPath ]` — Returns the names of all classes derived by the supplied class names, excluding any classes matching the excluded class ...
  - `get_in_memory_assets(filter, skip_ar_filtered_assets = True)` -> `Array[AssetData] or None` — Gets asset data for in-memory assets only, that match the filter. Returns assets that would be excluded by calling GetAs...
  - `get_referencers(package_name, reference_options)` -> `Array[Name] or None` — Gets a list of packages that reference the supplied package. (On disk references ONLY)
  - `get_sub_paths(base_path, recurse)` -> `Array [ str ]` — Gets a list of all paths that are currently cached below the passed-in base path
  - `has_assets(package_path, recursive = False)` -> `bool` — Does the given path contain assets, optionally also testing sub-paths?
  - `is_loading_assets()` -> `bool` — Returns true if the asset registry is currently loading files and does not yet know about all assets. This is a legacy f...
  - `is_search_all_assets()` -> `bool` — Whether SearchAllAssets has been called, or was auto-called at startup. When async (editor or cooking), if SearchAllAsse...
  - `is_search_async()` -> `bool` — Whether searching is done async (and was started at startup), or synchronously and on-demand, requiring ScanPathsSynchro...
  - `k2_get_asset_by_object_path(object_path, include_only_on_disk_assets = False, skip_ar_filtered_assets = True)` -> `AssetData` — Gets the asset data for the specified object path see: IAssetRegistry class header for bIncludeOnlyOnDiskAssets.
  - `prioritize_search_path(path_to_prioritize)` -> `None` — If assets are currently being asynchronously scanned in the specified path, this will cause them to be scanned before ot...
  - `run_assets_through_filter(asset_data_list, filter)` -> `Array [ AssetData ]` — Trims items out of the asset data list that do not pass the supplied filter
  - `scan_files_synchronous(file_paths, force_rescan = False)` -> `None` — Scan the specified individual files right now and populate the asset registry. If bForceRescan is true, the paths will b...
  - `scan_modified_asset_files(file_paths)` -> `None` — Forces a rescan of specific filenames, call this when you need to refresh from disk
  - `scan_paths_synchronous(paths, force_rescan = False, ignore_deny_list_scan_filters = False)` -> `None` — Scan the supplied paths recursively right now and populate the asset registry. If bForceRescan is true, the paths will b...
  - `search_all_assets(synchronous_search)` -> `None` — Look for all assets on disk (can be async or synchronous)
  - `use_filter_to_exclude_assets(asset_data_list, filter)` -> `Array [ AssetData ]` — Trims items out of the asset data list that pass the supplied filter
  - `wait_for_completion()` -> `None` — Wait for scan to be complete. If called during editor startup before OnPostEngineInit, and there are assets with classes...
  - `wait_for_package(package_name)` -> `None` — Wait for the scan of a specific package to be complete

### `unreal.AssetRegistryHelpers`
Inherits: `Object` | Header: `AssetRegistryHelpers.h`

Asset Registry Helpers

**Methods** (19):
  - `asset_has_editor_only_data(asset_data)` -> `bool` [classmethod] — Returns true if the asset has its editor-only data
  - `create_asset_data(asset, allow_blueprint_class = False)` -> `AssetData` [classmethod] — Creates asset data from a UObject.
  - `find_asset_native_class(asset_data)` [classmethod] — Returns the first native class of the asset type that can be found. Normally this is just the FAssetData::GetClass(), ho...
  - `get_asset(asset_data)` -> `Object` [classmethod] — Returns the asset UObject if it is loaded or loads the asset if it is unloaded then returns the result
  - `get_asset_registry()` -> `AssetRegistry` [classmethod] — Get Asset Registry
  - `get_blueprint_assets(filter)` -> `Array [ AssetData ]` [classmethod] — Gets asset data for all blueprint assets that match the filter. ClassPaths in the filter specify the blueprintâs paren...
  - `get_class(asset_data)` [classmethod] — Get Class
  - `get_export_text_name(asset_data)` -> `str` [classmethod] — Returns the name for the asset in the form: ClassâObjectPathâ
  - `get_full_name(asset_data)` -> `str` [classmethod] — Returns the full name for the asset in the form: Class ObjectPath
  - `get_tag_value(asset_data, tag_name)` -> `str or None` [classmethod] — Gets the value associated with the given tag as a string
  - `is_asset_cooked(asset_data)` -> `bool` [classmethod] — Returns true if the asset is cooked
  - `is_asset_loaded(asset_data)` -> `bool` [classmethod] — Returns true if the asset is loaded
  - `is_redirector(asset_data)` -> `bool` [classmethod] — Returns true if the this asset is a redirector.
  - `is_u_asset(asset_data)` -> `bool` [classmethod] — Returns true if this is the primary asset in a package, true for maps and assets but false for secondary objects like cl...
  - `is_valid(asset_data)` -> `bool` [classmethod] — Checks to see if this AssetData refers to an asset or is NULL
  - `set_filter_tags_and_values(filter, tags_and_values)` -> `ARFilter` [classmethod] — Populates the FARFilters tags and values map with the passed in tags and values
  - `sort_by_asset_name(assets, sort_order)` -> `Array [ AssetData ]` [classmethod] — Sorts the assets by their asset name.
  - `sort_by_predicate(assets, sorting_predicate, sort_order)` -> `Array [ AssetData ]` [classmethod] — Sorts the assets based on a custom Blueprint delegate.
  - `to_soft_object_path(asset_data)` -> `SoftObjectPath` [classmethod] — Convert to a SoftObjectPath for loading

### `unreal.AssetRegistrySortOrder`
Inherits: `EnumBase` | Header: `AssetRegistryHelpers.h`

EAsset Registry Sort Order

**Properties** (2):
  - `ASCENDING`: `AssetRegistrySortOrder = Ellipsis` — 0
  - `DESCENDING`: `AssetRegistrySortOrder = Ellipsis` — 1

### `unreal.AssetRegistryHelpers_SortingPredicate`
Inherits: `DelegateBase` | Header: `AssetRegistryHelpers.h`

Sorting Predicate Delegate Signature
