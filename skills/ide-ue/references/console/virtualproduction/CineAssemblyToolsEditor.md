# UE Python API — CineAssemblyToolsEditor Module

**6 types** from the `CineAssemblyToolsEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CinematicProduction`, `FolderTemplate`, `CineAssemblyFactory`, `CineAssemblySchemaFactory`, `ProductionFunctionLibrary`, `SubsequencePriority`

---

## Classes

### `unreal.CinematicProduction`
Inherits: `StructBase` | Header: `ProductionSettings.h`

Collection of production settings to override the project/editor behavior

**Properties** (7):
  - `default_asset_names`: `None` [Read-Only] — [Read-Only] List of default names for specific asset types (Map[type(Class),str])
  - `default_display_rate`: `FrameRate` [Read-Only] — [Read-Only] The default frame rate to set for new Level Sequences (FrameRate)
  - `default_start_frame`: `int` [Read-Only] — [Read-Only] The default frame number (using the default frame rate) that new Level Sequences should ...
  - `naming_token_namespace_deny_list`: `None` [Read-Only] — [Read-Only] List of Naming Token namespaces that should not be evaluated (Set[str])
  - `production_id`: `Guid` [Read-Only] — [Read-Only] Unique ID of the production (Guid)
  - `production_name`: `str` [Read-Only] — [Read-Only] Production Name (str)
  - `subsequence_priority`: `SubsequencePriority` [Read-Only] — [Read-Only] Controls whether subsequences override parent sequences, or vice versa (SubsequencePrior...

### `unreal.FolderTemplate`
Inherits: `StructBase` | Header: `ProductionSettings.h`

Properties of a folder in the productionâs template folder hierarchy

### `unreal.CineAssemblyFactory`
Inherits: `Factory` | Header: `CineAssemblyFactory.h`

Factory class used to create new UCineAssembly objects Before creating a new Cine Assembly, the factory will spawn a new window to configure the properties of the asset that is being created.

### `unreal.CineAssemblySchemaFactory`
Inherits: `Factory` | Header: `CineAssemblySchemaFactory.h`

Factory class used to create new UCineAssemblySchema objects Before creating a new assembly schema, the factory will spawn a window to configure the properties of the asset that is being created

### `unreal.ProductionFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ProductionFunctionLibrary.h`

Library of Blueprint/Python accessible functions to interface with the Cinematic Production Settings

**Methods** (11):
  - `add_production(production)` -> `None` [classmethod] — Add the input Cinematic Production to the Production Settingsâ list of productions
  - `clear_active_production()` -> `None` [classmethod] — Sets the active Cinematic Production to None
  - `create_assembly(schema, level, metadata, path, name, use_default_name_from_schema = True)` -> `CineAssembly` [classmethod] — Create a new CineAssembly asset using the input Schema, Level, and Metadata. If bUseDefaultNameFromSchema is true, the d...
  - `delete_production(production_id)` -> `None` [classmethod] — Removes the Cinematic Production matching the input ProductionID from the Prodctuion Settingsâ list of productions
  - `get_active_production()` -> `CinematicProduction or None` [classmethod] — Get the active Cinematic Production (if it exists)
  - `get_all_productions()` -> `Array [ CinematicProduction ]` [classmethod] — Returns an array of all available Cinematic Productions
  - `get_production(production_id)` -> `CinematicProduction or None` [classmethod] — Get the Cinematic Production matching the input ProductionID (if it exists)
  - `is_active_production(production_id)` -> `bool` [classmethod] — Returns true if input ProductionID matches the ID of the current Active Production
  - `rename_production(production_id, new_name)` -> `None` [classmethod] — Renames the Cinematic Production matching the input ProductionID
  - `set_active_production(production = [[],'',[24,1],0,SubsequencePriority.BOTTOM_UP,[],{}])` -> `None` [classmethod] — Sets the input Production as the current Active Production If no input is provided, the Active Production will be set to...
  - `set_active_production_by_id(production_id)` -> `None` [classmethod] — Sets the Production matching the input ProductionID as the current Active Production

### `unreal.SubsequencePriority`
Inherits: `EnumBase` | Header: `ProductionSettings.h`

Options for determining the hierarchical bias of subsequences

**Properties** (2):
  - `BOTTOM_UP`: `SubsequencePriority = Ellipsis` — 1
  - `TOP_DOWN`: `SubsequencePriority = Ellipsis` — 0
