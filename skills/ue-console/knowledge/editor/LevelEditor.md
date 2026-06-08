# UE Python API — LevelEditor Module

**9 types** from the `LevelEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LevelEditorContextMenuContext`, `LevelEditorSubsystem`, `QuickActionMenuContext`, `LevelEditorMenuContext`, `OnLevelEditorEditorCameraMoved`, `OnLevelEditorMapChanged`, `OnLevelEditorMapOpened`, `OnLevelEditorPostSaveWorld`, `OnLevelEditorPreSaveWorld`

---

## Classes

### `unreal.LevelEditorContextMenuContext`
Inherits: `Object` | Header: `LevelEditorMenuContext.h`

Level Editor Context Menu Context

**Methods** (1):
  - `get_hit_proxy_element()` -> `ScriptTypedElementHandle` — Get Script Hit Proxy Element

**Properties** (5):
  - `context_type`: `LevelEditorMenuContext` [Read-Only] — [Read-Only] (LevelEditorMenuContext)
  - `current_selection`: `TypedElementSelectionSet` [Read-Only] — [Read-Only] (TypedElementSelectionSet)
  - `cursor_world_location`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `hit_proxy_actor`: `Actor` [Read-Only] — [Read-Only] If the ContextType is Viewport this property can be set to the HitProxy actor that trigg...
  - `selected_components`: `None` [Read-Only] — [Read-Only] (Array[ActorComponent])

### `unreal.LevelEditorSubsystem`
Inherits: `EditorSubsystem` | Header: `LevelEditorSubsystem.h`

ULevelEditorSubsystem Subsystem for exposing Level Editor related functionality to scripts

**Methods** (26):
  - `build_light_maps(quality = LightingBuildQuality.QUALITY_PRODUCTION, with_reflection_captures = False)` -> `bool` — Build Light Maps and optionally the reflection captures.
  - `editor_get_game_view(viewport_config_key = 'None')` -> `bool` — Editor Get Game View
  - `editor_invalidate_viewports()` -> `None` — Editor Invalidate Viewports
  - `editor_play_simulate()` -> `None` — Editor Play Simulate
  - `editor_request_begin_play()` -> `None` — Editor Request Begin Play
  - `editor_request_end_play()` -> `None` — Editor Request End Play
  - `editor_set_game_view(game_view, viewport_config_key = 'None')` -> `None` — Editor Set Game View
  - `editor_set_viewport_realtime(realtime, viewport_config_key = 'None')` -> `None` — Editor Set Viewport Realtime
  - `eject_pilot_level_actor(viewport_config_key = 'None')` -> `None` — Eject Pilot Level Actor
  - `get_active_viewport_config_key()` -> `Name` — Get Active Viewport Config Key
  - `get_allows_cinematic_control(viewport_config_key = 'None')` -> `bool` — Get Allows Cinematic Control
  - `get_current_level()` -> `Level` — Get the current level used by the world editor.
  - `get_exact_camera_view(viewport_config_key = 'None')` -> `bool` — Get Exact Camera View
  - `get_pilot_level_actor(viewport_config_key = 'None')` -> `Actor` — Get Pilot Level Actor
  - `get_selection_set()` -> `TypedElementSelectionSet` — Get the selection set for the current world, you can use this to track and create changes to the level editorâs select...
  - `get_viewport_config_keys()` -> `Array [ Name ]` — Get Viewport Config Keys
  - `is_in_play_in_editor()` -> `bool` — Is in Play in Editor
  - `load_level(asset_path)` -> `bool` — Close the current Persistent Level (without saving it). Loads the specified level.
  - `new_level(asset_path, is_partitioned_world = False)` -> `bool` — Close the current Persistent Level (without saving it). Create a new blank Level and save it. Load the new created level...
  - `new_level_from_template(asset_path, template_asset_path)` -> `bool` — Close the current Persistent Level (without saving it). Create a new Level base on another level and save it. Load the n...
  - `pilot_level_actor(actor_to_pilot, viewport_config_key = 'None')` -> `None` — Pilot Level Actor
  - `save_all_dirty_levels()` -> `bool` — Saves all Level currently loaded by the World Editor.
  - `save_current_level()` -> `bool` — Saves the specified Level. Must already be saved at lease once to have a valid path.
  - `set_allows_cinematic_control(allow, viewport_config_key = 'None')` -> `None` — Set Allows Cinematic Control
  - `set_current_level_by_name(level_name)` -> `bool` — Set the current level used by the world editor. If more than one level shares the same name, the first one encounter of ...
  - `set_exact_camera_view(exact_camera_view, viewport_config_key = 'None')` -> `None` — Set Exact Camera View

**Properties** (5):
  - `on_editor_camera_moved`: `OnLevelEditorEditorCameraMoved` — [Read-Write] Expose EditorCameraMoved to blueprints (OnLevelEditorEditorCameraMoved)
  - `on_map_changed`: `OnLevelEditorMapChanged` — This executes too early for some editor scripting, consider using OnMapOpened if this doesnât work...
  - `on_map_opened`: `OnLevelEditorMapOpened` — [Read-Write] Expose MapOpened to blueprints (OnLevelEditorMapOpened)
  - `on_post_save_world`: `OnLevelEditorPostSaveWorld` — [Read-Write] Expose PostSaveWorld to blueprints (OnLevelEditorPostSaveWorld)
  - `on_pre_save_world`: `OnLevelEditorPreSaveWorld` — [Read-Write] Expose PreSaveWorld to blueprints (OnLevelEditorPreSaveWorld)

### `unreal.QuickActionMenuContext`
Inherits: `Object` | Header: `LevelEditorMenuContext.h`

Quick Action Menu Context

**Properties** (1):
  - `current_selection`: `TypedElementSelectionSet` [Read-Only] — [Read-Only] (TypedElementSelectionSet)

### `unreal.LevelEditorMenuContext`
Inherits: `EnumBase` | Header: `LevelEditorMenuContext.h`

Enum to describe what a level editor context menu should be built for

**Properties** (3):
  - `MAIN_MENU`: `LevelEditorMenuContext = Ellipsis` — This is the replica of the context menu that appears in the main menu bar (lists all entries) 2
  - `SCENE_OUTLINER`: `LevelEditorMenuContext = Ellipsis` — This context menu is applicable to the Scene Outliner (disables click-position-based menu items) 1
  - `VIEWPORT`: `LevelEditorMenuContext = Ellipsis` — This context menu is applicable to a viewport (limited subset of entries) 0

### `unreal.OnLevelEditorEditorCameraMoved`
Inherits: `MulticastDelegateBase` | Header: `LevelEditorSubsystem.h`

Delegate type for editor camera movement

### `unreal.OnLevelEditorMapChanged`
Inherits: `MulticastDelegateBase` | Header: `LevelEditorSubsystem.h`

Delegate type for map change events ( Params: uint32 MapChangeFlags (MapChangeEventFlags) )

### `unreal.OnLevelEditorMapOpened`
Inherits: `MulticastDelegateBase` | Header: `LevelEditorSubsystem.h`

Delegate type for triggering when a map is opened

### `unreal.OnLevelEditorPostSaveWorld`
Inherits: `MulticastDelegateBase` | Header: `LevelEditorSubsystem.h`

Delegate type for post save world events ( uint32 SaveFlags, UWorld* World, bool bSuccess )

### `unreal.OnLevelEditorPreSaveWorld`
Inherits: `MulticastDelegateBase` | Header: `LevelEditorSubsystem.h`

Delegate type for pre save world events ( uint32 SaveFlags, UWorld* World )
