# UE Python API — DataLayerEditor Module

**4 types** from the `DataLayerEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataLayerCreationParameters`, `DataLayerEditorSubsystem`, `DataLayerFactory`, `ExternalDataLayerFactory`

---

## Classes

### `unreal.DataLayerCreationParameters`
Inherits: `StructBase` | Header: `DataLayerEditorSubsystem.h`

Data Layer Creation Parameters

**Properties** (3):
  - `data_layer_asset`: `DataLayerAsset` — [Read-Write] Required. Will assign the asset to the created instance. (DataLayerAsset)
  - `is_private`: `bool` — [Read-Write] (bool)
  - `world_data_layers`: `WorldDataLayers` — [Read-Write] Optional. Will default at the level WorldDataLayers if unset. (WorldDataLayers)

### `unreal.DataLayerEditorSubsystem`
Inherits: `EditorSubsystem` | Header: `DataLayerEditorSubsystem.h`

Data Layer Editor Subsystem

**Methods** (57):
  - `add_actor_to_data_layer(actor, data_layer)` -> `bool` — Adds the actor to the DataLayer.
  - `add_actor_to_data_layers(actor, data_layers)` -> `bool` — Adds the provided actor to the DataLayers.
  - `add_actors_to_data_layer(actors, data_layer)` -> `bool` — Add the actors to the DataLayer
  - `add_actors_to_data_layers(actors, data_layers)` -> `bool` — Add the actors to the DataLayers
  - `add_selected_actors_to_data_layer(data_layer)` -> `bool` — Adds selected actors to the DataLayer.
  - `add_selected_actors_to_data_layers(data_layers)` -> `bool` — Adds selected actors to the DataLayers.
  - `add_to_actor_editor_context(data_layer_instance)` -> `None` — Add to Actor Editor Context
  - `append_actors_from_data_layer(data_layer)` -> `Array [ Actor ]` — Appends all the actors associated with the specified DataLayer.
  - `append_actors_from_data_layers(data_layers)` -> `Array [ Actor ]` — Appends all the actors associated with ANY of the specified DataLayers.
  - `create_data_layer(parent_data_layer = None)` -> `DataLayerInstance` — Create Data Layer
  - `create_data_layer_instance(parameters)` -> `DataLayerInstance` — Creates a UDataLayerInstance Object
  - `delete_data_layer(data_layer_to_delete)` -> `None` — Deletes the provided DataLayer
  - `delete_data_layers(data_layers_to_delete)` -> `None` — Deletes all of the provided DataLayers
  - `get_actor_editor_context_current_external_data_layer()` -> `ExternalDataLayerAsset` — Get Actor Editor Context Current External Data Layer
  - `get_actors_from_data_layer(data_layer)` -> `Array [ Actor ]` — Gets all the actors associated with the specified DataLayer. Analog to AppendActorsFromDataLayer but it returns rather t...
  - `get_actors_from_data_layers(data_layers)` -> `Array [ Actor ]` — Gets all the actors associated with ANY of the specified DataLayers. Analog to AppendActorsFromDataLayers but it returns...
  - `get_all_data_layers()` -> `Array [ DataLayerInstance ]` — Returns all Data Layers
  - `get_data_layer(actor_data_layer)` -> `DataLayerInstance` — Get Data Layer
  - `get_data_layer_from_label(data_layer_label)` -> `DataLayerInstance` — Get Data Layer from Label
  - `get_data_layer_instance(data_layer_asset)` -> `DataLayerInstance` — Gets the UDataLayerInstance associated to the DataLayerAsset
  - `get_data_layer_instances(data_layer_assets)` -> `Array [ DataLayerInstance ]` — Gets the UDataLayerInstances associated to the each DataLayerAssets
  - `is_actor_valid_for_data_layer(actor)` -> `bool` — Is Actor Valid for Data Layer
  - `is_actor_valid_for_data_layer_instances(actor, data_layer_instances)` -> `bool` — Checks to see if the specified actor is in an appropriate state to interact with DataLayers
  - `make_all_data_layers_visible()` -> `None` — Set the visibility of all DataLayers to true
  - `remove_actor_from_all_data_layers(actor)` -> `bool` — Removes an actor from all DataLayers.
  - `remove_actor_from_data_layer(actor, data_layer_to_remove)` -> `bool` — Removes an actor from the specified DataLayer.
  - `remove_actor_from_data_layers(actor, data_layers)` -> `bool` — Removes the provided actor from the DataLayers.
  - `remove_actors_from_all_data_layers(actors)` -> `bool` — Removes an actor from all DataLayers.
  - `remove_actors_from_data_layer(actors, data_layer)` -> `bool` — Removes the actors from the specified DataLayer.
  - `remove_actors_from_data_layers(actors, data_layers)` -> `bool` — Remove the actors from the DataLayers
  - `remove_from_actor_editor_context(data_layer_instance)` -> `None` — Remove from Actor Editor Context
  - `remove_selected_actors_from_data_layer(data_layer)` -> `bool` — Removes the selected actors from the DataLayer.
  - `remove_selected_actors_from_data_layers(data_layers)` -> `bool` — Removes selected actors from the DataLayers.
  - `rename_data_layer(data_layer, new_data_layer_label)` -> `bool` — Rename Data Layer
  - `select_actors_in_data_layer(data_layer, select, notify, select_even_if_hidden = False)` -> `bool` — Selects/de-selects actors belonging to the DataLayer.
  - `select_actors_in_data_layers(data_layers, select, notify, select_even_if_hidden = False)` -> `bool` — Selects/de-selects actors belonging to the DataLayers.
  - `set_actor_editor_context_current_external_data_layer(external_data_layer_asset)` -> `bool` — Set Actor Editor Context Current External Data Layer
  - `set_data_layer_initial_runtime_state(data_layer, initial_runtime_state)` -> `None` — Sets the initial runtime state of the DataLayers
  - `set_data_layer_is_dynamically_loaded_in_editor(data_layer, is_loaded_in_editor, is_from_user_change)` -> `bool` — Set Data Layer Is Dynamically Loaded in Editor deprecated: Use SetDataLayerIsLoadedInEditor instead
  - `set_data_layer_is_initially_visible(data_layer, is_initially_visible)` -> `None` — Sets the initial editor visibility state of the DataLayers
  - `set_data_layer_is_loaded_in_editor(data_layer, is_loaded_in_editor, is_from_user_change)` -> `bool` — Changes the DataLayerâs IsLoadedInEditor flag to the provided state
  - `set_data_layer_visibility(data_layer, is_visible)` -> `None` — Changes the DataLayerâs visibility to the provided state
  - `set_data_layers_is_dynamically_loaded_in_editor(data_layers, is_loaded_in_editor, is_from_user_change)` -> `bool` — Set Data Layers Is Dynamically Loaded in Editor deprecated: Use SetDataLayersIsLoadedInEditor instead
  - `set_data_layers_is_loaded_in_editor(data_layers, is_loaded_in_editor, is_from_user_change)` -> `bool` — Changes the IsLoadedInEditor flag of the DataLayers to the provided state
  - `set_data_layers_visibility(data_layers, is_visible)` -> `None` — Changes visibility of the DataLayers to the provided state
  - `set_parent_data_layer(data_layer, parent_data_layer)` -> `bool` — Sets a Parent DataLayer for a specified DataLayer
  - `set_parent_data_layer_for_data_layers(data_layers, parent_data_layer)` -> `None` — Sets a Parent DataLayer for a specified list of DataLayers
  - `toggle_data_layer_is_dynamically_loaded_in_editor(data_layer, is_from_user_change)` -> `bool` — Toggle Data Layer Is Dynamically Loaded in Editor deprecated: Use ToggleDataLayerIsLoadedInEditor instead
  - `toggle_data_layer_is_loaded_in_editor(data_layer, is_from_user_change)` -> `bool` — Toggles the DataLayerâs IsLoadedInEditor flag
  - `toggle_data_layer_visibility(data_layer)` -> `None` — Toggles the DataLayerâs visibility
  - `toggle_data_layers_is_dynamically_loaded_in_editor(data_layers, is_from_user_change)` -> `bool` — Toggle Data Layers Is Dynamically Loaded in Editor deprecated: Use ToggleDataLayersIsLoadedInEditor instead
  - `toggle_data_layers_is_loaded_in_editor(data_layers, is_from_user_change)` -> `bool` — Toggles the IsLoadedInEditor flag of all of the DataLayers
  - `toggle_data_layers_visibility(data_layers)` -> `None` — Toggles the visibility of all of the DataLayers
  - `update_actor_all_views_visibility(actor)` -> `None` — Update Actor All Views Visibility deprecated: Per-view Data Layer visibility was removed.
  - `update_actor_visibility(actor, notify_selection_change, redraw_viewports)` -> `(out_selection_changed=bool, out_actor_modified=bool) or None` — Updates the provided actors visibility in the viewports
  - `update_all_actors_visibility(notify_selection_change, redraw_viewports)` -> `bool` — Updates the visibility of all actors in the viewports
  - `update_all_view_visibility(data_layer_that_changed)` -> `None` — Update All View Visibility deprecated: Per-view Data Layer visibility was removed.

### `unreal.DataLayerFactory`
Inherits: `Factory` | Header: `DataLayerFactory.h`

Data Layer Factory

### `unreal.ExternalDataLayerFactory`
Inherits: `Factory` | Header: `ExternalDataLayerFactory.h`

External Data Layer Factory
