# UE Python API — LevelSequenceEditor Module

**5 types** from the `LevelSequenceEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MovieSceneScriptingParams`, `LevelSequenceEditorBlueprintLibrary`, `LevelSequenceEditorSubsystem`, `LevelSequenceFactoryNew`, `LevelSequenceWithShotsSettings`

---

## Classes

### `unreal.MovieSceneScriptingParams`
Inherits: `StructBase` | Header: `LevelSequenceEditorSubsystem.h`

Movie Scene Scripting Params

**Properties** (1):
  - `time_unit`: `MovieSceneTimeUnit` — [Read-Write] (MovieSceneTimeUnit)

### `unreal.LevelSequenceEditorBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LevelSequenceEditorBlueprintLibrary.h`

Level Sequence Editor Blueprint Library

**Methods** (61):
  - `close_level_sequence()` -> `None` [classmethod]
  - `delete_color_for_channels(class_)` -> `str` [classmethod] — Delete Color for Channels deprecated: Use USequencerCurveEditorObject::DeleteColorForChannels
  - `empty_selection()` -> `None` [classmethod] — Empties the current selection.
  - `focus_level_sequence(sub_section)` -> `None` [classmethod]
  - `focus_parent_sequence()` -> `None` [classmethod]
  - `force_update()` -> `None` [classmethod] — Force sequencer evaluation and UI update immediately
  - `get_bound_objects(object_binding)` -> `Array [ Object ]` [classmethod] — Get the object bound to the given binding ID with the current level sequence editor
  - `get_channels_with_selected_keys()` -> `Array [ SequencerChannelProxy ]` [classmethod] — Gets the channel with selected keys.
  - `get_current_level_sequence()` -> `LevelSequence` [classmethod]
  - `get_current_local_time()` -> `int32` [classmethod] — Get Current Local Time deprecated: Use GetCurrentLocalTime that returns a FMovieSceneSequencePlaybackParams
  - `get_current_time()` -> `int32` [classmethod] — Get Current Time deprecated: Use GetCurrentTime that returns a FMovieSceneSequencePlaybackParams
  - `get_custom_color_for_channel(class_, identifier)` -> `LinearColor` [classmethod] — Get Custom Color for Channel deprecated: Use USequencerCurveEditorObject::HasCustomColorForChannel
  - `get_focused_level_sequence()` -> `LevelSequence` [classmethod]
  - `get_global_position(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `MovieSceneSequencePlaybackParams` [classmethod] — Get the current global playhead position
  - `get_local_position(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `MovieSceneSequencePlaybackParams` [classmethod] — Get the current local playhead position
  - `get_loop_mode()` -> `SequencerLoopMode` [classmethod] — Get loop mode (note this is a per user preference)
  - `get_playback_end_position(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `MovieSceneSequencePlaybackParams` [classmethod] — Return end of the playback range in the Sequencer UI, which accounts for the exclusive upper bound
  - `get_playback_speed()` -> `float` [classmethod] — Get playback speed of the current level sequence
  - `get_playback_start_position(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `MovieSceneSequencePlaybackParams` [classmethod] — Return the playback start position
  - `get_selected_bindings()` -> `Array [ MovieSceneBindingProxy ]` [classmethod] — Gets the currently selected object bindings
  - `get_selected_channels()` -> `Array [ SequencerChannelProxy ]` [classmethod] — Gets the currently selected channels.
  - `get_selected_folders()` -> `Array [ MovieSceneFolder ]` [classmethod] — Gets the currently selected folders.
  - `get_selected_keys(channel_proxy)` -> `Array [ int32 ]` [classmethod] — Gets the selected key indices with this channel
  - `get_selected_sections()` -> `Array [ MovieSceneSection ]` [classmethod] — Gets the currently selected sections.
  - `get_selected_tracks()` -> `Array [ MovieSceneTrack ]` [classmethod] — Gets the currently selected tracks.
  - `get_selection_range_end()` -> `int32` [classmethod] — Get the selection range end frame.
  - `get_selection_range_start()` -> `int32` [classmethod] — Get the selection range start frame.
  - `get_sub_sequence_hierarchy()` -> `Array [ MovieSceneSubSection ]` [classmethod]
  - `get_track_filter_names()` -> `Array [ Text ]` [classmethod] — Gets all the available track filter names
  - `has_custom_color_for_channel(class_, identifier)` -> `bool` [classmethod] — Has Custom Color for Channel deprecated: Use USequencerCurveEditorObject::HasCustomColorForChannel
  - `is_camera_cut_locked_to_viewport()` -> `bool` [classmethod] — Check whether the lock for the viewport to the camera cuts is enabled.
  - `is_level_sequence_locked()` -> `bool` [classmethod] — Check whether the current level sequence and its descendants are locked for editing.
  - `is_playing()` -> `bool` [classmethod] — Check whether the sequence is actively playing.
  - `is_track_filter_active(track_filter_name)` -> `bool` [classmethod] — Gets whether the specified track filter is on/off
  - `is_track_filter_enabled(track_filter_name)` -> `bool` [classmethod] — Is Track Filter Enabled
  - `open_level_sequence(level_sequence)` -> `bool` [classmethod]
  - `pause()` -> `None` [classmethod] — Pause the current level sequence
  - `play()` -> `None` [classmethod] — Play the current level sequence
  - `play_to(playback_params, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Play from the current time to the requested time in frames
  - `refresh_current_level_sequence()` -> `None` [classmethod] — Refresh Sequencer UI on next tick
  - `select_bindings(object_bindings)` -> `None` [classmethod] — Select bindings
  - `select_channels(channels)` -> `None` [classmethod] — Select channels
  - `select_folders(folders)` -> `None` [classmethod] — Select folders
  - `select_keys(channel, indices)` -> `None` [classmethod] — Select keys from indices
  - `select_sections(sections)` -> `None` [classmethod] — Select sections
  - `select_tracks(tracks)` -> `None` [classmethod] — Select tracks
  - `set_current_local_time(new_frame)` -> `None` [classmethod] — Set Current Local Time deprecated: Use SetCurrentLocalTime that takes a FMovieSceneSequencePlaybackParams
  - `set_current_time(new_frame)` -> `None` [classmethod] — Set Current Time deprecated: Use SetCurrentTime that takes a FMovieSceneSequencePlaybackParams
  - `set_custom_color_for_channel(class_, identifier, new_color)` -> `None` [classmethod] — Set Custom Color for Channel deprecated: Use USequencerCurveEditorObject::SetCustomColorForChannel
  - `set_custom_color_for_channels(class_, identifiers, new_colors)` -> `None` [classmethod] — Set Custom Color for Channels deprecated: Use USequencerCurveEditorObject::DeleteColorForChannels
  - `set_global_position(playback_params, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set global playhead position for the current level sequence. If the requested time is the same as the current time, an e...
  - `set_local_position(playback_params, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set local playhead position for the current level sequence. If the requested time is the same as the current time, an ev...
  - `set_lock_camera_cut_to_viewport(lock)` -> `None` [classmethod] — Sets the lock for the viewport to the camera cuts.
  - `set_lock_level_sequence(lock)` -> `None` [classmethod] — Sets the lock for the current level sequence and its descendants for editing.
  - `set_loop_mode(new_loop_mode)` -> `None` [classmethod] — Set loop mode (note this is a per user preference)
  - `set_playback_speed(new_playback_speed)` -> `None` [classmethod] — Set playback speed of the current level sequence
  - `set_random_color_for_channels(class_, identifiers)` -> `None` [classmethod] — Set Random Color for Channels deprecated: Use USequencerCurveEditorObject::SetRandomColorForChannels
  - `set_selection_range_end(new_frame)` -> `None` [classmethod] — Set the selection range end frame.
  - `set_selection_range_start(new_frame)` -> `None` [classmethod] — Set the selection range start frame.
  - `set_track_filter_active(track_filter_name, active)` -> `None` [classmethod] — Sets the specified track filter to be on or off
  - `set_track_filter_enabled(track_filter_name, enabled)` -> `None` [classmethod] — Set Track Filter Enabled

### `unreal.LevelSequenceEditorSubsystem`
Inherits: `EditorSubsystem` | Header: `LevelSequenceEditorSubsystem.h`

ULevelSequenceEditorSubsystem Subsystem for level sequence editor related utilities to scripts

**Methods** (32):
  - `add_actors(actors)` -> `Array [ MovieSceneBindingProxy ]` — Add existing actors to Sequencer. Tracks will be automatically added based on default track settings.
  - `add_actors_to_binding(actors, object_binding)` -> `None` — Assigns the given actors to the binding
  - `add_spawnable_from_class(sequence, class_to_spawn)` -> `MovieSceneBindingProxy` — Add a new binding to this sequence that will spawn the specified class.
  - `add_spawnable_from_instance(sequence, object_to_spawn)` -> `MovieSceneBindingProxy` — Add a new binding to this sequence that will spawn the specified object.
  - `bake_transform_with_settings(object_bindings, settings, params = [MovieSceneTimeUnit.DISPLAY_RATE])` -> `bool` — Bake transform
  - `change_actor_template_class(object_binding, actor_class)` -> `bool` — Sets the actor class for the spawnable or replaceable template, in the case those binding types support templates.
  - `convert_to_custom_binding(object_binding, binding_type)` -> `MovieSceneBindingProxy` — Convert to a custom binding of the given binding type
  - `convert_to_possessable(object_binding)` -> `MovieSceneBindingProxy` — Convert to possessable. If there are multiple objects assigned to the spawnable.
  - `convert_to_spawnable(object_binding)` -> `Array [ MovieSceneBindingProxy ]` — Convert to spawnable. If there are multiple objects assigned to the possessable, multiple spawnables will be created. Fo...
  - `copy_bindings(bindings)` -> `str` — Copy bindings The copied bindings will be saved to the clipboard as well as assigned to the ExportedText string. The Exp...
  - `copy_folders(objects_exported_text=str, tracks_exported_text=str)` — Copy folders The copied folders will be saved to the clipboard as well as assigned to the ExportedText string. The Expor...
  - `copy_sections(sections)` -> `str` — Copy sections The copied sections will be saved to the clipboard as well as assigned to the ExportedText string. The Exp...
  - `copy_tracks(tracks)` -> `str` — Copy tracks The copied tracks will be saved to the clipboard as well as assigned to the ExportedText string. The Exporte...
  - `create_camera(out_actor=CineCameraActor)` — Create a cine camera actor and add it to Sequencer
  - `fix_actor_references()` -> `None` — Attempts to automatically fix up broken actor references in the current scene
  - `get_curve_editor()` -> `SequencerCurveEditorObject` — Retrieve the curve editor
  - `get_custom_binding_objects(object_binding)` -> `Array [ MovieSceneCustomBinding ]` — In the case that the given binding proxy holds custom bindings, returns an array of the binding objects so properties ca...
  - `get_custom_binding_type(object_binding)` — Returns the custom binding type for the given binding, or nullptr for possessables
  - `get_custom_bindings_of_type(custom_binding_type)` -> `Array [ MovieSceneBindingProxy ]` — Returns all of the bindings in the sequence of the given custom type.
  - `get_scripting_layer()` -> `SequencerModuleScriptingLayer` — Retrieve the scripting layer
  - `paste_bindings(text_to_import, paste_bindings_params)` -> `Array[MovieSceneBindingProxy] or None` — Paste bindings Paste bindings from the given TextToImport string (used in conjunction with CopyBindings). If TextToImpor...
  - `paste_folders(text_to_import, paste_folders_params)` -> `Array[MovieSceneFolder] or None` — Paste folders Paste folders from the given TextToImport string (used in conjunction with CopyFolders). If TextToImport i...
  - `paste_sections(text_to_import, paste_sections_params)` -> `Array[MovieSceneSection] or None` — Paste sections Paste sections from the given TextToImport string (used in conjunction with CopySections). If TextToImpor...
  - `paste_tracks(text_to_import, paste_tracks_params)` -> `Array[MovieSceneTrack] or None` — Paste tracks Paste tracks from the given TextToImport string (used in conjunction with CopyTracks). If TextToImport is e...
  - `rebind_component(component_bindings, component_name)` -> `None` — Rebind the component binding to the requested component
  - `remove_actors_from_binding(actors, object_binding)` -> `None` — Removes the given actors from the binding
  - `remove_all_bindings(object_binding)` -> `None` — Remove all bound actors from this track
  - `remove_invalid_bindings(object_binding)` -> `None` — Remove missing objects bound to this track
  - `replace_binding_with_actors(actors, object_binding)` -> `None` — Replaces the binding with the given actors
  - `save_default_spawnable_state(object_binding)` -> `None` — Save the default state of the spawnable.
  - `snap_sections_to_timeline_using_source_timecode(sections)` -> `None` — Snap sections to timeline using source timecode
  - `sync_sections_using_source_timecode(sections)` -> `None` — Sync section using source timecode

### `unreal.LevelSequenceFactoryNew`
Inherits: `Factory` | Header: `LevelSequenceFactoryNew.h`

Implements a factory for ULevelSequence objects.

### `unreal.LevelSequenceWithShotsSettings`
Inherits: `Object` | Header: `LevelSequenceEditorSettings.h`

Level Sequence With Shots Settings.

**Properties** (1):
  - `sub_sequence_names`: `None` — [Read-Write] Array of sub sequence names, each will result in a level sequence asset in the shot. (A...
