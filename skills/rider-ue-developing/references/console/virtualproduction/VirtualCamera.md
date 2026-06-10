# UE Python API — VirtualCamera Module

**18 types** from the `VirtualCamera` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PilotableSequenceCameraInfo`, `VCamTraceHitProxyQueryParams`, `VCamTraceHitProxyResult`, `AssetFilteringAndSortingFunctionLibrary`, `GameViewFunctionLibrary`, `LevelSequenceVCamLibrary`, `MultiUserTakesVCamFunctionLibrary`, `TakeMetaDataTagsFunctionLibrary`, `VCamBlueprintFunctionLibrary`, `VCamTakesMetaDataMigration`, `VirtualCameraClipsMetaData`, `VirtualCameraUserSettings`, `AssetTagMetaDataSortType`, `SortOrder`, `VCamPhotoSaveMode`, `VCamTutorialCompletionState`, `AssetSortingPredicate`, `VCamBlueprintFunctionLibrary_OnTakeRecorderSlateChanged_VCam`

---

## Classes

### `unreal.PilotableSequenceCameraInfo`
Inherits: `StructBase` | Header: `LevelSequenceVCamLibrary.h`

Pilotable Sequence Camera Info

**Properties** (1):
  - `camera`: `CameraComponent` [Read-Only] — [Read-Only] A camera from a sequencer track (CameraComponent)

### `unreal.VCamTraceHitProxyQueryParams`
Inherits: `StructBase` | Header: `VCamBlueprintFunctionLibrary.h`

VCam Trace Hit Proxy Query Params

**Properties** (2):
  - `hit_proxy_size`: `int` — [Read-Write] Determine the size of the query area around the center pixel. (int32)
  - `ignored_actors`: `None` — [Read-Write] Components on these actors should not be considered. (Array[Actor])

### `unreal.VCamTraceHitProxyResult`
Inherits: `StructBase` | Header: `VCamBlueprintFunctionLibrary.h`

VCam Trace Hit Proxy Result

**Properties** (2):
  - `hit_actor`: `Actor` [Read-Only] — [Read-Only] (Actor)
  - `hit_component`: `PrimitiveComponent` [Read-Only] — [Read-Only] (PrimitiveComponent)

### `unreal.AssetFilteringAndSortingFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AssetFilteringAndSortingFunctionLibrary.h`

This libraryâs purpose is to facilitate Blueprints to discover assets using some filters and sort them.

**Methods** (4):
  - `get_all_assets_by_meta_data_tags(required_tags, allowed_classes)` -> `Array [ AssetData ]` [classmethod] — Gets all assets which have the given tags. deprecated: Use EditorAssetSubsystemâs GetAllAssetsByMetaDataTags instead.
  - `sort_by_asset_name(assets, sort_order = SortOrder.ASCENDING)` -> `Array [ AssetData ]` [classmethod] — Sort by Asset Name deprecated: Use AssetRegistryHelpersâs SortByAssetName instead.
  - `sort_by_custom_predicate(assets, sorting_predicate, sort_order = SortOrder.ASCENDING)` -> `Array [ AssetData ]` [classmethod] — Sort by Custom Predicate deprecated: Use AssetRegistryHelpersâs SortByCustomPredicate instead.
  - `sort_by_meta_data(assets, meta_data_tag, meta_data_type, sort_order = SortOrder.ASCENDING)` -> `Array[AssetData] or None` [classmethod] — Sort by Meta Data deprecated: Use EditorAssetSubsystemâs SortByMetaData instead.

### `unreal.GameViewFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `GameViewFunctionLibrary.h`

Library for changing the viewport into game view. Game view shows the scene as it appears in game.

**Methods** (7):
  - `can_toggle_game_view(viewport_id)` -> `bool` [classmethod] — note: Only works in editor builds.
  - `is_in_game_view(viewport_id)` -> `bool` [classmethod] — note: Only works in editor builds.
  - `restore_game_view_states(snapshot)` -> `None` [classmethod] — Sets the game view of the viewports as specified in the map. Util for using together with SnapshotGameViewStates. note: ...
  - `set_game_view_enabled(viewport_id, is_enabled)` -> `None` [classmethod] — Sets whether the specified viewport should have the game view enabled. note: Only works in editor builds.
  - `set_game_view_enabled_for_all_viewports(is_enabled)` -> `None` [classmethod] — Sets the game view mode for all open viewports. note: Only works in editor builds.
  - `snapshot_game_view_states()` -> `Map [ VCamTargetViewportID , bool ]` [classmethod] — note: Only works in editor builds.
  - `toggle_game_view(viewport_id)` -> `None` [classmethod] — Toggles the game view. Game view shows the scene as it appears in game. note: Only works in editor builds.

### `unreal.LevelSequenceVCamLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LevelSequenceVCamLibrary.h`

Utility functions for Level Sequences to implement VCamHUD UI.

**Methods** (2):
  - `find_pilotable_cameras_in_active_level_sequence()` -> `Array [ PilotableSequenceCameraInfo ]` [classmethod] — Gets all cameras currently spawned by the active level sequence. Note: You must have called ULevelSequenceEditorBlueprin...
  - `has_any_camera_cuts_in_level_sequence(sequence)` -> `bool` [classmethod] — Checks whether this sequence has any camera cuts set up. If yes, you should pilot the sequence using ULevelSequenceEdito...

### `unreal.MultiUserTakesVCamFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MultiUserTakesVCamFunctionLibrary.h`

This library wraps UMultiUserTakesFunctionLibrary: in editor builds, the calls are forwarded and cooked builds, the calls are compiled out. This is done so that Blueprints can continue to be cooked wi...

**Methods** (7):
  - `get_record_on_client(client_endpoint_id)` -> `bool` [classmethod] — Gets the checkbox value in the âRecord On Clientâ column in the settings displayed at the bottom of the âTake Reco...
  - `get_record_on_client_local()` -> `bool` [classmethod] — Gets the checkbox value in the âRecord On Clientâ column in the settings displayed at the bottom of the âTake Reco...
  - `get_synchronize_take_recorder_transactions(client_endpoint_id)` -> `bool` [classmethod] — Gets the value of the âSynchronizeTakeRecorderTransactionsâ checkbox in the settings displayed at the bottom of the ...
  - `get_synchronize_take_recorder_transactions_local()` -> `bool` [classmethod] — Gets the value of the âSynchronizeTakeRecorderTransactionsâ checkbox in the settings displayed at the bottom of the ...
  - `set_record_on_client(client_endpoint_id, new_value)` -> `None` [classmethod] — Sets the checkbox value in the âRecord On Clientâ column in the settings displayed at the bottom of the âTake Reco...
  - `set_record_on_client_local(new_value)` -> `None` [classmethod] — Sets the checkbox value in the âRecord On Clientâ column in the settings displayed at the bottom of the âTake Reco...
  - `set_synchronize_take_recorder_transactions_local(new_value)` -> `None` [classmethod] — Sets the value of the âSynchronizeTakeRecorderTransactionsâ checkbox in the settings displayed at the bottom of the ...

### `unreal.TakeMetaDataTagsFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `TakeMetaDataTagsFunctionLibrary.h`

This libraryâs purpose is to expose the names of the UTakeMetaData asset registry tag names.

**Methods** (9):
  - `get_all_take_meta_data_tags()` -> `Set [ Name ]` [classmethod] — Gets all tags for TakeMetaData
  - `get_take_meta_data_tag_description()` -> `Name` [classmethod] — The asset registry tag that contains the user-description for this meta-data
  - `get_take_meta_data_tag_is_sub_sequence()` -> `Name` [classmethod] — The asset registry tag that specifies if the meta-data is a subsequence.
  - `get_take_meta_data_tag_level_path()` -> `Name` [classmethod] — The asset registry tag that contains the level-path for this meta-data
  - `get_take_meta_data_tag_slate()` -> `Name` [classmethod] — The asset registry tag that contains the slate for this meta-data
  - `get_take_meta_data_tag_take_number()` -> `Name` [classmethod] — The asset registry tag that contains the take number for this meta-data
  - `get_take_meta_data_tag_timecode_in()` -> `Name` [classmethod] — The asset registry tag that contains the timecode in for this meta-data
  - `get_take_meta_data_tag_timecode_out()` -> `Name` [classmethod] — The asset registry tag that contains the timecode out for this meta-data
  - `get_take_meta_data_tag_timestamp()` -> `Name` [classmethod] — The asset registry tag that contains the timestamp for this meta-data

### `unreal.VCamBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `VCamBlueprintFunctionLibrary.h`

VCam Blueprint Function Library

**Methods** (43):
  - `calculate_auto_focus_distance(reticle_position, cine_camera)` -> `float` [classmethod] — Calculates auto focus
  - `call_function_by_name(obj_ptr, function_name)` -> `bool` [classmethod] — Returns true if the function was found & executed correctly.
  - `clear_camera_overscan(camera_component)` -> `None` [classmethod] — Clears any overscan from the camera
  - `convert_string_to_frame_rate(frame_rate_string)` -> `FrameRate` [classmethod] — Converts a double framerate to a FFrameRate
  - `copy_to_cine_camera_actor(source_camera_component, target_camera_actor)` -> `bool` [classmethod] — Copies all properties from a CineCameraComponent to a CineCameraActor and ensure the root actor transform is updated so ...
  - `deproject_screen_to_world(screen_position)` -> `(out_world_position=Vector, out_world_direction=Vector) or None` [classmethod] — Convert 2D screen position to World Space 3D position and direction in the active viewport. Returns false if unable to d...
  - `deproject_screen_to_world_by_viewport(screen_position, target_viewport)` -> `(out_world_position=Vector, out_world_direction=Vector) or None` [classmethod] — Converts 2D screen position to World Space 3D position and direction in the specified viewport. Returns false if unable ...
  - `editor_load_asset(asset_path)` -> `Object` [classmethod] — Load an asset through path.
  - `editor_save_asset(asset_path)` -> `bool` [classmethod] — Save an asset through path. Returns true on success.
  - `editor_set_game_view(is_toggled)` -> `None` [classmethod] — Sets the current game view
  - `enable_debug_focus_plane(cine_camera, enabled)` -> `None` [classmethod] — Enable/Disable debug focus plane
  - `get_bound_objects(camera_binding_id)` -> `Array [ Object ]` [classmethod] — Get UObject from Camera Object Bindings
  - `get_current_level_sequence()` -> `LevelSequence` [classmethod] — Get the currently opened level sequence asset see: ULevelSequenceEditorBlueprintLibrary::GetCurrentLevelSequence
  - `get_current_level_sequence_current_frame()` -> `int32` [classmethod] — Get the current playback position in frames
  - `get_display_rate(level_sequence)` -> `FrameRate` [classmethod] — Grab the display rate from a LevelSequencesâ MovieScene
  - `get_level_sequence_frame_as_timecode(level_sequence, frame)` -> `Timecode` [classmethod] — Convert a frame from a level sequence to timecode
  - `get_level_sequence_frame_as_timecode_without_object(display_rate, frame)` -> `Timecode` [classmethod] — Convert a frame from a level sequence to timecode using only a provided display rate
  - `get_level_sequence_length_in_frames(level_sequence)` -> `int32` [classmethod] — Get length in frames of a level sequence
  - `get_next_undo_description()` -> `str` [classmethod] — Returns the description of the undo action that will be performed next.
  - `get_object_metadata_tags(object)` -> `Map [ Name , str ]` [classmethod] — Retrieves UObjectâs metadata tags
  - `get_pending_take_level_sequence()` -> `LevelSequence` [classmethod] — Gets the level sequence associated with the current pending take. see: ITakeRecorderModule::GetPendingTake
  - `get_playback_speed()` -> `float` [classmethod] — Get playback speed in Sequencer
  - `import_snapshot_texture(file_name, sub_folder_name, absolute_path_package)` -> `Texture` [classmethod] — Imports image as a uasset
  - `is_asset_dirty(asset_data)` -> `bool` [classmethod] — Checks if the asset is dirty
  - `is_current_level_sequence_playing()` -> `bool` [classmethod] — Check whether the sequence is actively playing.
  - `is_game_running()` -> `bool` [classmethod] — Returns true if not in editor or if running the game in PIE or Simulate
  - `is_recording()` -> `bool` [classmethod] — Check whether a recording is currently active
  - `is_take_recorder_panel_open()` -> `bool` [classmethod] — Is Take Recorder Panel Open
  - `modify_object_metadata_tags(object, tag, value)` -> `None` [classmethod] — Modifies a UObjectâs metadata tags, adding a tag if the tag does not exist.
  - `multi_trace_hit_proxy_on_viewport(screen_position, target_viewport, query_params)` -> `Array[VCamTraceHitProxyResult] or None` [classmethod] — Traces from the viewport and returns all components that contribute to the pixels surrounding InScreenPosition. The size...
  - `open_level_sequence(level_sequence)` -> `bool` [classmethod] — Open a level sequence asset
  - `pause_current_level_sequence()` -> `None` [classmethod] — Pause the current level sequence
  - `pilot_actor(selected_actor)` -> `None` [classmethod] — Pilot the provided actor using editor scripting
  - `play_current_level_sequence()` -> `None` [classmethod] — Play the current level sequence
  - `set_actor_label(actor, new_actor_label)` -> `None` [classmethod] — Set Actor Label
  - `set_camera_overscan(camera_component, asymmetric_overscan, scale_resolution = False)` -> `None` [classmethod] — Adds asymmetric overscan to the camera.
  - `set_current_level_sequence_current_frame(new_frame)` -> `None` [classmethod] — Set playback position for the current level sequence in frames
  - `set_on_take_recorder_slate_changed(on_take_recorder_slate_changed)` -> `None` [classmethod] — Called when the slate is changed.
  - `set_playback_speed(value = 1.000000)` -> `None` [classmethod] — Set playback speed in Sequencer
  - `sort_assets_by_timecode_asset_data(level_sequence_assets)` -> `Array [ AssetData ]` [classmethod] — Sort array of FAssetData by metadata timecode *
  - `timecode_to_frame_amount(timecode, frame_rate)` -> `int32` [classmethod] — Convert timecode to amount of frames at a given framerate
  - `try_open_take_recorder_panel()` -> `bool` [classmethod] — Try Open Take Recorder Panel
  - `update_post_process_settings_for_capture(capture_component, depth_of_field, f_stop_value)` -> `bool` [classmethod] — Updates the provided USceneCaptureComponent2Dâs PostProcessingSettings. Returns true on success.

### `unreal.VCamTakesMetaDataMigration`
Inherits: `BlueprintFunctionLibrary` | Header: `VCamTakesMetaDataMigration.h`

Helps VCam Blueprints migrate. UVirtualCameraClipsMetaData

**Methods** (14):
  - `get_auto_migrate_accessed_level_sequences_c_var()` -> `bool` [classmethod] — Get Auto Migrate Accessed Level Sequences CVar
  - `get_favorite_level(level_sequence)` -> `int32 or None` [classmethod] — Gets the favorite rating. The favorite rating is like a star rating, usually 1-3 if it was rated. Does no migration. Loo...
  - `get_favorite_level_by_asset_data(asset_data)` -> `int32 or None` [classmethod] — Gets the favorite rating. The favorite rating is like a star rating, usually 1-3 if it was rated. Does no migration. Loo...
  - `get_is_flagged(level_sequence)` -> `bool or None` [classmethod] — Gets whether this was flagged by a user. Does no migration. Looks for new data source first and falls back to legacy dat...
  - `get_is_flagged_by_asset_data(asset_data)` -> `bool or None` [classmethod] — Gets whether this was flagged by a user. Does no migration. Looks for new data source first and falls back to legacy dat...
  - `get_is_no_good(level_sequence)` -> `bool or None` [classmethod] — Gets whether the user has marked this take as no good. Does no migration. Looks for new data source first and falls back...
  - `get_is_no_good_by_asset_data(asset_data)` -> `bool or None` [classmethod] — Gets whether the user has marked this take as no good. Does no migration. Looks for new data source first and falls back...
  - `migrate_v_cam_takes_meta_data(level_sequence)` -> `None` [classmethod] — Migrates UVirtualCameraClipsMetaData to UMovieSceneShotMetaData.
  - `needs_to_migrate_v_cam_meta_data(level_sequence)` -> `bool` [classmethod]
  - `needs_to_migrate_v_cam_meta_data_by_asset_data(asset_data)` -> `bool` [classmethod]
  - `set_favorite_level(level_sequence, favorite_level)` -> `None` [classmethod] — Sets the favorite rating. The favorite rating is like a star rating, usually 1-3 if it was rated. Always writes the data...
  - `set_is_flagged(level_sequence, is_flagged)` -> `None` [classmethod] — Sets whether this was flagged by a user. Always writes the data to the new data source.
  - `set_is_no_good(level_sequence, is_no_good)` -> `None` [classmethod] — Sets whether the user has marked this take as no good. Always writes the data to the new data source.
  - `slow_migrate_all_v_cam_takes_meta_data_in_project()` -> `None` [classmethod] — SLOW Migrate All VCam Takes Meta Data in Project

### `unreal.VirtualCameraClipsMetaData`
Inherits: `Object` | Header: `VirtualCameraClipsMetaData.h`

Clips meta-data that is stored on ULevelSequence assets that are recorded through the virtual camera. Meta-data is retrieved through ULevelSequence::FindMetaData<UVirtualCameraClipsMetaData>().

**Methods** (30):
  - `get_all_clips_meta_data_tags()` -> `Set [ Name ]` [classmethod] — Gets all asset registry tags
  - `get_clips_meta_data_tag_display_rate()` -> `Name` [classmethod] — Get Clips Meta Data Tag Display Rate deprecated: Data was removed.
  - `get_clips_meta_data_tag_favorite_level()` -> `Name` [classmethod] — Get Clips Meta Data Tag Favorite Level deprecated: Use ULevelSequenceShotMetaDataLibrary::GetFavoriteRatingAssetTag inst...
  - `get_clips_meta_data_tag_focal_length()` -> `Name` [classmethod] — Get Clips Meta Data Tag Focal Length deprecated: Data was removed.
  - `get_clips_meta_data_tag_frame_count_end()` -> `Name` [classmethod] — Get Clips Meta Data Tag Frame Count End deprecated: Data was removed.
  - `get_clips_meta_data_tag_frame_count_start()` -> `Name` [classmethod] — Get Clips Meta Data Tag Frame Count Start deprecated: Data was removed.
  - `get_clips_meta_data_tag_is_cine_a_cine_camera_recording()` -> `Name` [classmethod] — Get Clips Meta Data Tag Is Cine ACine Camera Recording deprecated: Data was removed.
  - `get_clips_meta_data_tag_is_created_from_v_cam()` -> `Name` [classmethod] — Get Clips Meta Data Tag Is Created from VCam deprecated: Data was removed.
  - `get_clips_meta_data_tag_is_flagged()` -> `Name` [classmethod] — Get Clips Meta Data Tag Is Flagged deprecated: Use ULevelSequenceShotMetaDataLibrary::GetIsFlaggedAssetTag instead.
  - `get_clips_meta_data_tag_is_no_good()` -> `Name` [classmethod] — Get Clips Meta Data Tag Is No Good deprecated: Use ULevelSequenceShotMetaDataLibrary::GetIsNoGoodAssetTag instead.
  - `get_clips_meta_data_tag_is_selected()` -> `Name` [classmethod] — Get Clips Meta Data Tag Is Selected deprecated: Data was removed.
  - `get_clips_meta_data_tag_length_in_frames()` -> `Name` [classmethod] — Get Clips Meta Data Tag Length in Frames deprecated: Data was removed.
  - `get_clips_meta_data_tag_post_smooth_level()` -> `Name` [classmethod] — The asset registry tag that contains post smooth level
  - `get_clips_meta_data_tag_recorded_level()` -> `Name` [classmethod] — Get Clips Meta Data Tag Recorded Level deprecated: Data was removed.
  - `get_display_rate()` -> `FrameRate` — Get Display Rate deprecated: Data was removed.
  - `get_focal_length()` -> `float` — Get Focal Length deprecated: Data was removed.
  - `get_frame_count_end()` -> `int32` — Get Frame Count End deprecated: Data was removed.
  - `get_frame_count_start()` -> `int32` — Get Frame Count Start deprecated: Data was removed.
  - `get_is_a_cine_camera_recording()` -> `bool` — Get Is ACine Camera Recording deprecated: Data was removed.
  - `get_length_in_frames()` -> `int32` — Get Length in Frames deprecated: Data was removed.
  - `get_recorded_level_name()` -> `str` — Get Recorded Level Name deprecated: Data was removed.
  - `get_selected()` -> `bool` — Get Selected deprecated: Data was removed.
  - `set_display_rate(display_rate)` -> `None` — Set Display Rate deprecated: Data was removed.
  - `set_focal_length(focal_length)` -> `None` — Set Focal Length deprecated: Data was removed.
  - `set_frame_count_end(frame)` -> `None` — Set Frame Count End deprecated: Data was removed.
  - `set_frame_count_start(frame)` -> `None` — Set Frame Count Start deprecated: Data was removed.
  - `set_is_a_cine_camera_recording(is_a_cine_camera_recording)` -> `None` — Set Is ACine Camera Recording deprecated: Data was removed.
  - `set_length_in_frames(length)` -> `None` — Set Length in Frames deprecated: Data was removed.
  - `set_recorded_level_name(level_name)` -> `None` — Set Recorded Level Name deprecated: Data was removed.
  - `set_selected(selected)` -> `None` — Set Selected deprecated: Data was removed.

**Properties** (13):
  - `display_rate`: `FrameRate` — [Read-Write]
deprecated: Data was removed. (FrameRate)
  - `favorite_level`: `int` — [Read-Write]
deprecated: Use ULevelSequenceShotMetaDataLibrary or UVCamTakesMetaDataMigration instea...
  - `focal_length`: `float` — [Read-Write] The focal length of the streamed camera used to record the take
deprecated: Data was re...
  - `frame_count_end`: `int` — [Read-Write]
deprecated: Data was removed. (int32)
  - `frame_count_start`: `int` — [Read-Write]
deprecated: Data was removed. (int32)
  - `is_a_cine_camera_recording`: `bool` — [Read-Write]
deprecated: Data was removed. (bool)
  - `is_created_from_v_cam`: `bool` — [Read-Write]
deprecated: Data was removed. (bool)
  - `is_flagged`: `bool` — [Read-Write]
deprecated: Use ULevelSequenceShotMetaDataLibrary or UVCamTakesMetaDataMigration instea...
  - `is_no_good`: `bool` — [Read-Write]
deprecated: Use ULevelSequenceShotMetaDataLibrary or UVCamTakesMetaDataMigration instea...
  - `is_selected`: `bool` — [Read-Write]
deprecated: Data was removed. (bool)
  - `length_in_frames`: `int` — [Read-Write]
deprecated: Data was removed. (int32)
  - `post_smooth_level`: `int` — [Read-Write] The asset registry tag that contains the post smooth level (int32)
  - `recorded_level_name`: `str` — [Read-Write]
deprecated: Data was removed. (str)

### `unreal.VirtualCameraUserSettings`
Inherits: `Object` | Header: `VCamUserSettings.h`

Virtual Camera User Settings

**Methods** (3):
  - `get_settings()` -> `VirtualCameraUserSettings` [classmethod] — Get Settings
  - `is_tutorial_completed()` -> `bool`
  - `set_tutorial_completion_state(new_state)` -> `None` — Sets the tutorial completion state and saves it to the config file if it has changed.

**Properties** (4):
  - `photo_save_location`: `DirectoryPath` — [Read-Write] Directory path to store vcam photos (DirectoryPath)
  - `photo_save_mode`: `VCamPhotoSaveMode` — [Read-Write] VCam photo save mode (VCamPhotoSaveMode)
  - `texture_save_location`: `DirectoryPath` — [Read-Write] Directory path to store vcam photo texture assets (DirectoryPath)
  - `v_cam_tutorial_completion_state`: `VCamTutorialCompletionState` — [Read-Write] Indicates whether the VCam tutorial is completed.
You can manually reset this to Pendin...

### `unreal.AssetTagMetaDataSortType`
Inherits: `EnumBase` | Header: `AssetFilteringAndSortingFunctionLibrary.h`

EAsset Tag Meta Data Sort Type

**Properties** (3):
  - `DATE_TIME`: `AssetTagMetaDataSortType = Ellipsis` — 2
  - `NUMERIC`: `AssetTagMetaDataSortType = Ellipsis` — 1
  - `STRING`: `AssetTagMetaDataSortType = Ellipsis` — 0

### `unreal.SortOrder`
Inherits: `EnumBase` | Header: `AssetFilteringAndSortingFunctionLibrary.h`

ESort Order

**Properties** (2):
  - `ASCENDING`: `SortOrder = Ellipsis` — 0
  - `DESCENDING`: `SortOrder = Ellipsis` — 1

### `unreal.VCamPhotoSaveMode`
Inherits: `EnumBase` | Header: `VCamUserSettings.h`

EVCam Photo Save Mode

**Properties** (4):
  - `BOTH`: `VCamPhotoSaveMode = Ellipsis` — 3
  - `OFF`: `VCamPhotoSaveMode = Ellipsis` — 0
  - `PNG`: `VCamPhotoSaveMode = Ellipsis` — 1
  - `TEXTURE`: `VCamPhotoSaveMode = Ellipsis` — 2

### `unreal.VCamTutorialCompletionState`
Inherits: `EnumBase` | Header: `VCamUserSettings.h`

EVCam Tutorial Completion State

**Properties** (2):
  - `COMPLETED`: `VCamTutorialCompletionState = Ellipsis` — Tutorial was completed 1
  - `PENDING`: `VCamTutorialCompletionState = Ellipsis` — Tutorial not completed 0

### `unreal.AssetSortingPredicate`
Inherits: `DelegateBase` | Header: `AssetFilteringAndSortingFunctionLibrary.h`

Asset Sorting Predicate Delegate Signature

### `unreal.VCamBlueprintFunctionLibrary_OnTakeRecorderSlateChanged_VCam`
Inherits: `DelegateBase` | Header: `VCamBlueprintFunctionLibrary.h`

On Take Recorder Slate Changed VCam Delegate Signature
