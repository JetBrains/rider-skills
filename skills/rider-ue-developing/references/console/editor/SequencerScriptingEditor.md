# UE Python API — SequencerScriptingEditor Module

**7 types** from the `SequencerScriptingEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SequencerBoundObjects`, `SequencerChannelProxy`, `SequencerExportFBXParams`, `SequencerQuickBindingResult`, `SequencerCurveEditorObject`, `SequencerTools`, `OnRenderMovieStopped`

---

## Classes

### `unreal.SequencerBoundObjects`
Inherits: `StructBase` | Header: `SequencerTools.h`

Sequencer Bound Objects

**Properties** (2):
  - `binding_proxy`: `MovieSceneBindingProxy` — [Read-Write] (MovieSceneBindingProxy)
  - `bound_objects`: `None` — [Read-Write] (Array[Object])

### `unreal.SequencerChannelProxy`
Inherits: `StructBase` | Header: `SequencerCurveEditorObject.h`

Sequencer Channel Proxy

**Properties** (2):
  - `channel_name`: `Name` — [Read-Write] (Name)
  - `section`: `MovieSceneSection` — [Read-Write] (MovieSceneSection)

### `unreal.SequencerExportFBXParams`
Inherits: `StructBase` | Header: `SequencerTools.h`

Sequencer Export FBXParams

**Properties** (7):
  - `bindings`: `None` — [Read-Write] (Array[MovieSceneBindingProxy])
  - `fbx_file_name`: `str` — [Read-Write] (str)
  - `override_options`: `FbxExportOption` — [Read-Write] (FbxExportOption)
  - `root_sequence`: `LevelSequence` — [Read-Write] (LevelSequence)
  - `sequence`: `LevelSequence` — [Read-Write] (LevelSequence)
  - `tracks`: `None` — [Read-Write] (Array[MovieSceneTrack])
  - `world`: `World` — [Read-Write] (World)

### `unreal.SequencerQuickBindingResult`
Inherits: `StructBase` | Header: `SequencerTools.h`

Wrapper around result of quick binding for event track in sequencer.

**Properties** (1):
  - `payload_names`: `None` [Read-Only] — [Read-Only] Names of the payload variables of the event. (Array[str])

### `unreal.SequencerCurveEditorObject`
Inherits: `Object` | Header: `SequencerCurveEditorObject.h`

Class to hold sequencer curve editor functions

**Methods** (16):
  - `apply_filter(filter)` -> `None` — Apply Filter
  - `close_curve_editor()` -> `None` — Close curve editor
  - `delete_color_for_channels(class_)` -> `str` — Delete for specified channel idendified by itâs class and identifier.
  - `empty_selection()` -> `None` — Empties the current selection.
  - `get_channels_with_selected_keys()` -> `Array [ SequencerChannelProxy ]` — Gets the channel with selected keys
  - `get_custom_color_for_channel(class_, identifier)` -> `LinearColor` — Get custom color for specified channel idendified by itâs class and identifier,if none exists will return white
  - `get_selected_keys(channel_proxy)` -> `Array [ int32 ]` — Gets the selected keys with this channel
  - `has_custom_color_for_channel(class_, identifier)` -> `bool` — Get if a custom color for specified channel idendified by itâs class and identifier exists
  - `is_curve_editor_open()` -> `bool` — Is curve editor open
  - `is_curve_shown(channel)` -> `bool` — Is the curve displayed
  - `open_curve_editor()` -> `None` — Open curve editor
  - `select_keys(channel, indices)` -> `None` — Select keys
  - `set_custom_color_for_channel(class_, identifier, new_color)` -> `None` — Set Custom Color for specified channel idendified by itâs class and identifier. This will be stored in editor user pre...
  - `set_custom_color_for_channels(class_, identifiers, new_colors)` -> `None` — Set Custom Color for specified channels idendified by itâs class and identifiers. This will be stored in editor user p...
  - `set_random_color_for_channels(class_, identifiers)` -> `None` — Set Random Colors for specified channels idendified by itâs class and identifiers. This will be stored in editor user ...
  - `show_curve(channel, show_curve)` -> `None` — Show curve

### `unreal.SequencerTools`
Inherits: `BlueprintFunctionLibrary` | Header: `SequencerTools.h`

This is a set of helper functions to access various parts of the Sequencer API via Python. Because Sequencer itself is not suitable for exposing, most functionality gets wrapped by UObjects that have ...

**Methods** (17):
  - `cancel_movie_render()` -> `None` [classmethod] — Cancel Movie Render deprecated: Function âCancelMovieRenderâ is deprecated.
  - `clear_linked_anim_sequences(level_sequence)` -> `None` [classmethod] — InLevelSequence: LevelSequence to clean links for
  - `create_event(sequence, section, endpoint, payload)` -> `MovieSceneEvent` [classmethod] — Create an event from a previously created blueprint endpoint and a payload. The resulting event should be added only to ...
  - `create_quick_binding(sequence, object, function_name, call_in_editor)` -> `SequencerQuickBindingResult` [classmethod] — Create a quick binding to an actorâs member method to be used in an event sequence.
  - `export_anim_sequence(world, sequence, anim_sequence, export_option, binding, create_link)` -> `bool` [classmethod] — InWorld: World to export * InSequence: Sequence to export * AnimSequence: The AnimSequence to save into. * ExportOption:...
  - `export_fbx_from_control_rig(sequence, actor_with_control_rig_track, export_fbx_control_rig_settings)` -> `bool` [classmethod] — Exports an FBX from the section to key of the control rig track of the actor with the given name.
  - `export_level_sequence_fbx(params)` -> `bool` [classmethod]
  - `get_anim_sequence_link_from_level_sequence(level_sequence)` -> `LevelSequenceAnimSequenceLink` [classmethod] — InLevelSequence: LevelSequence to get links from *
  - `get_bound_objects(world, sequence, bindings, range)` -> `Array [ SequencerBoundObjects ]` [classmethod] — Get Bound Objects deprecated: Function âGetBoundObjectsâ is deprecated.
  - `get_level_sequence_link_from_anim_sequence(anim_sequence)` -> `AnimSequenceLevelSequenceLink` [classmethod] — InAnimSequence: AnimSequence to get links from *
  - `get_object_bindings(world, sequence, object, range)` -> `Array [ SequencerBoundObjects ]` [classmethod] — Get Object Bindings deprecated: Function âGetObjectBindingsâ is deprecated.
  - `import_fbx_to_control_rig(world, sequence, actor_with_control_rig_track, selected_control_rig_names, import_fbx_control_rig_settings, import_filename)` -> `bool` [classmethod] — InWorld: World to import to * InSequence: InSequence to import * ActorWithControlRigTrack: ActorWithControlRigTrack The ...
  - `import_level_sequence_fbx(world, sequence, bindings, import_fbx_settings, import_filename, actor_context = None)` -> `bool` [classmethod] — InWorld: World to import to * InSequence: InSequence to import * InBindings: InBindings to import * InImportFBXSettings:...
  - `is_event_endpoint_valid(endpoint)` -> `bool` [classmethod] — Check if an endpoint is valid and can be used to create movie scene event.
  - `is_rendering_movie()` -> `bool` [classmethod] — Is Rendering Movie deprecated: Function âIsRenderingMovieâ is deprecated.
  - `link_anim_sequence(sequence, anim_sequence, export_options, binding)` -> `bool` [classmethod] — InSequence: Sequence to link from * AnimSequence: The AnimSequence to link to. * ExportOption: The export options that s...
  - `render_movie(capture_settings, on_finished_callback)` -> `bool` [classmethod] — Render Movie deprecated: Function âRenderMovieâ is deprecated.

### `unreal.OnRenderMovieStopped`
Inherits: `DelegateBase` | Header: `SequencerTools.h`

On Render Movie Stopped Delegate Signature
