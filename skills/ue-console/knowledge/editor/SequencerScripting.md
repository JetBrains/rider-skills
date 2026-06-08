# UE Python API — SequencerScripting Module

**38 types** from the `SequencerScripting` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SequencerScriptingRange`, `MovieSceneBindingExtensions`, `MovieSceneDoubleVectorTrackExtensions`, `MovieSceneEventTrackExtensions`, `MovieSceneFloatVectorTrackExtensions`, `MovieSceneFolderExtensions`, `MovieSceneMaterialTrackExtensions`, `MovieScenePrimitiveMaterialTrackExtensions`, `MovieScenePropertyTrackExtensions`, `MovieSceneScriptingActorReferenceChannel`, `MovieSceneScriptingActorReferenceKey`, `MovieSceneScriptingActualFloatKey`, `MovieSceneScriptingBoolChannel`, `MovieSceneScriptingBoolKey`, `MovieSceneScriptingByteChannel`, `MovieSceneScriptingByteKey`, `MovieSceneScriptingChannel`, `MovieSceneScriptingDoubleAsFloatKey`, `MovieSceneScriptingDoubleChannel`, `MovieSceneScriptingDoubleKey`, ... (38 total)

---

## Classes

### `unreal.SequencerScriptingRange`
Inherits: `StructBase` | Header: `SequencerScriptingRange.h`

Sequencer Scripting Range

**Methods** (12):
  - `get_end_frame()` -> `int32` — Get the ending frame for the specified range, if it has one. Defined as the first subsequent frame that is outside of th...
  - `get_end_seconds()` -> `float` — Get the ending time for the specified range in seconds, if it has one. Defined as the first time that is outside of the ...
  - `get_start_frame()` -> `int32` — Get the starting frame for the specified range, if it has one. Defined as the first valid frame that is inside the range...
  - `get_start_seconds()` -> `float` — Get the starting time for the specified range in seconds, if it has one. Defined as the first valid time that is inside ...
  - `has_end()` -> `bool` — Check whether this range has an end
  - `has_start()` -> `bool` — Check whether this range has a start
  - `remove_end()` -> `None` — Remove the end from this range, making it infinite
  - `remove_start()` -> `None` — Remove the start from this range, making it infinite
  - `set_end_frame(end)` -> `None` — Set the ending frame for the specified range. Interpreted as the first subsequent frame that is outside of the range.
  - `set_end_seconds(end)` -> `None` — Set the ending time for the specified range in seconds. Interpreted as the first time that is outside of the range.
  - `set_start_frame(start)` -> `None` — Set the starting frame for the specified range. Interpreted as the first valid frame that is inside the range.
  - `set_start_seconds(start)` -> `None` — Set the starting time for the specified range in seconds. Interpreted as the first valid time that is inside the range.

**Properties** (4):
  - `exclusive_end`: `int` — [Read-Write] (int32)
  - `has_end_value`: `bool` — [Read-Write] (bool)
  - `has_start_value`: `bool` — [Read-Write] (bool)
  - `inclusive_start`: `int` — [Read-Write] (int32)

### `unreal.MovieSceneBindingExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneBindingExtensions.h`

Function library containing methods that should be hoisted onto FMovieSceneBindingProxies for scripting

**Methods** (23):
  - `add_track(binding, track_type)` -> `MovieSceneTrack` [classmethod] — Add a new track to the specified binding
  - `equal_equal_movie_scene_binding_proxy(a, b)` -> `bool` [classmethod] — Returns true if the values are equal (A == B)
  - `find_tracks_by_exact_type(binding, track_type)` -> `Array [ MovieSceneTrack ]` [classmethod] — Find all tracks within a given binding of the specified type, not allowing sub-classed types
  - `find_tracks_by_type(binding, track_type)` -> `Array [ MovieSceneTrack ]` [classmethod] — Find all tracks within a given binding of the specified type
  - `get_child_possessables(binding)` -> `Array [ MovieSceneBindingProxy ]` [classmethod] — Get all the children of this binding
  - `get_display_name(binding)` -> `Text` [classmethod] — Get this bindingâs name
  - `get_id(binding)` -> `Guid` [classmethod] — Get this bindingâs ID
  - `get_name(binding)` -> `str` [classmethod] — Get this bindingâs object non-display name
  - `get_object_template(binding)` -> `Object` [classmethod] — Get this bindingâs object template
  - `get_parent(binding)` -> `MovieSceneBindingProxy` [classmethod] — Get the parent of this binding
  - `get_possessed_object_class(binding)` [classmethod] — Get this bindingâs possessed object class
  - `get_sorting_order(binding)` -> `int32` [classmethod] — Get the sorting order for this binding
  - `get_tracks(binding)` -> `Array [ MovieSceneTrack ]` [classmethod] — Get all the tracks stored within this binding
  - `is_valid(binding)` -> `bool` [classmethod] — Check whether the specified binding is valid
  - `move_binding_contents(source_binding_id, destination_binding_id)` -> `None` [classmethod] — Move all the contents (tracks, child bindings) of the specified binding ID onto another
  - `not_equal_movie_scene_binding_proxy(a, b)` -> `bool` [classmethod] — Returns true if the values are not equal (A != B)
  - `remove(binding)` -> `None` [classmethod] — Remove the specified binding
  - `remove_track(binding, track_to_remove)` -> `None` [classmethod] — Remove the specified track from this binding
  - `set_display_name(binding, display_name)` -> `None` [classmethod] — Set this bindingâs name
  - `set_name(binding, name)` -> `None` [classmethod] — Set this bindingâs object non-display name
  - `set_parent(binding, parent_binding)` -> `None` [classmethod] — Set the parent to this binding
  - `set_sorting_order(binding, sorting_order)` -> `None` [classmethod] — Set the sorting order for this binding
  - `set_spawnable_binding_id(binding, spawnable_binding_id)` -> `None` [classmethod] — Set the spawnable id that the possessable binding should possess

### `unreal.MovieSceneDoubleVectorTrackExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneVectorTrackExtensions.h`

Function library containing methods that should be hoisted onto UMovieSceneDoubleVectorTrack for scripting

**Methods** (2):
  - `get_num_channels_used(track)` -> `int32` [classmethod] — Get the number of channels used for this track
  - `set_num_channels_used(track, num_channels_used)` -> `None` [classmethod] — Set the number of channels used for this track

### `unreal.MovieSceneEventTrackExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneEventTrackExtensions.h`

Function library containing methods that should be hoisted onto UMovieSceneEventTrack for scripting

**Methods** (3):
  - `add_event_repeater_section(track)` -> `MovieSceneEventRepeaterSection` [classmethod] — Create a new event repeater section for the given track
  - `add_event_trigger_section(track)` -> `MovieSceneEventTriggerSection` [classmethod] — Create a new event trigger section for the given track
  - `get_bound_object_property_class(event_key)` [classmethod]

### `unreal.MovieSceneFloatVectorTrackExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneVectorTrackExtensions.h`

Function library containing methods that should be hoisted onto UMovieSceneFloatVectorTrack for scripting

**Methods** (2):
  - `get_num_channels_used(track)` -> `int32` [classmethod] — Get the number of channels used for this track
  - `set_num_channels_used(track, num_channels_used)` -> `None` [classmethod] — Set the number of channels used for this track

### `unreal.MovieSceneFolderExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneFolderExtensions.h`

Function library containing methods that should be hoisted onto UMovieSceneFolders for scripting

**Methods** (13):
  - `add_child_folder(target_folder, folder_to_add)` -> `bool` [classmethod] — Add a child folder to the target folder
  - `add_child_object_binding(folder, object_binding)` -> `bool` [classmethod] — Add a guid for an object binding to this folder
  - `add_child_track(folder, track)` -> `bool` [classmethod] — Add a track to this folder
  - `get_child_folders(folder)` -> `Array [ MovieSceneFolder ]` [classmethod] — Get the child folders of a given folder
  - `get_child_object_bindings(folder)` -> `Array [ MovieSceneBindingProxy ]` [classmethod] — Get the object bindings contained by this folder
  - `get_child_tracks(folder)` -> `Array [ MovieSceneTrack ]` [classmethod] — Get the tracks contained by this folder
  - `get_folder_color(folder)` -> `Color` [classmethod] — Get the display color of the given folder
  - `get_folder_name(folder)` -> `Name` [classmethod] — Get the given folderâs display name
  - `remove_child_folder(target_folder, folder_to_remove)` -> `bool` [classmethod] — Remove a child folder from the given folder
  - `remove_child_object_binding(folder, object_binding)` -> `bool` [classmethod] — Remove an object binding from the given folder
  - `remove_child_track(folder, track)` -> `bool` [classmethod] — Remove a track from the given folder
  - `set_folder_color(folder, folder_color)` -> `bool` [classmethod] — Set the display color of the given folder
  - `set_folder_name(folder, folder_name)` -> `bool` [classmethod] — Set the name of the given folder

### `unreal.MovieSceneMaterialTrackExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneMaterialTrackExtensions.h`

Function library containing methods that should be hoisted onto UMovieSceneMaterialTrack for scripting

**Methods** (4):
  - `get_material_index(track)` -> `int32` [classmethod] — Get Material Index deprecated: Use SetMaterialInfo instead
  - `get_material_info(track)` -> `ComponentMaterialInfo` [classmethod] — Get material info of the component that is animated by the material track. deprecated: Use SetMaterialInfo instead
  - `set_material_index(track, material_index)` -> `None` [classmethod] — Set Material Index deprecated: Use SetMaterialInfo instead
  - `set_material_info(track, material_info)` -> `None` [classmethod] — Set material info of the component that is animated by the material track.

### `unreal.MovieScenePrimitiveMaterialTrackExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieScenePrimitiveMaterialTrackExtensions.h`

Function library containing methods that should be hoisted onto UMovieScenePrimitiveMaterialTrack for scripting

**Methods** (4):
  - `get_material_index(track)` -> `int32` [classmethod] — Get Material Index deprecated: Use SetMaterialInfo instead
  - `get_material_info(track)` -> `ComponentMaterialInfo` [classmethod] — Get material info of the component that is animated by the material track. deprecated: Use SetMaterialInfo instead
  - `set_material_index(track, material_index)` -> `None` [classmethod] — Set Material Index deprecated: Use SetMaterialInfo instead
  - `set_material_info(track, material_info)` -> `None` [classmethod] — Set material info of the component that is animated by the material track.

### `unreal.MovieScenePropertyTrackExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieScenePropertyTrackExtensions.h`

Function library containing methods that should be hoisted onto UMovieScenePropertyTrack for scripting

**Methods** (8):
  - `get_byte_track_enum(track)` -> `Enum` [classmethod] — Get this byte trackâs enum
  - `get_object_property_class(track)` [classmethod] — Get this object property trackâs property class
  - `get_property_name(track)` -> `Name` [classmethod] — Get this trackâs property name
  - `get_property_path(track)` -> `str` [classmethod] — Get this trackâs property path
  - `get_unique_track_name(track)` -> `Name` [classmethod] — Get this trackâs unique name
  - `set_byte_track_enum(track, enum)` -> `None` [classmethod] — Set this byte trackâs enum
  - `set_object_property_class(track, property_class)` -> `None` [classmethod] — Set this object property trackâs property class
  - `set_property_name_and_path(track, property_name, property_path)` -> `None` [classmethod] — Set this trackâs property name and path

### `unreal.MovieSceneScriptingActorReferenceChannel`
Inherits: `MovieSceneScriptingChannel` | Header: `MovieSceneScriptingActorReference.h`

Movie Scene Scripting Actor Reference Channel

**Methods** (9):
  - `add_key(time, new_value, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `MovieSceneScriptingActorReferenceKey` — Add a key to this channel. This initializes a new key and returns a reference to it.
  - `get_default()` -> `MovieSceneObjectBindingID` — Get this channelâs default value that will be used when no keys are present. Only a valid value when HasDefault() retu...
  - `get_keys()` -> `Array [ MovieSceneScriptingKey ]` — Gets all of the keys in this channel.
  - `get_keys_by_index(indices)` -> `Array [ MovieSceneScriptingKey ]` — Gets the keys in this channel specified by the specific index Indices: The indices from which to get the keys from
  - `has_default()` -> `bool`
  - `remove_default()` -> `None` — Remove this channelâs default value causing the channel to have no effect where no keys are present
  - `remove_key(key)` -> `None` — Removes the specified key. Does nothing if the key is not specified or the key belongs to another channel.
  - `set_default(default_value)` -> `None` — Set this channelâs default value that should be used when no keys are present. Sets bHasDefaultValue to true automatic...
  - `transform(offset_frame, scale, pivot_frame, scripting_range, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Transform the keys in time in the channel by an offset, scale and pivot

### `unreal.MovieSceneScriptingActorReferenceKey`
Inherits: `MovieSceneScriptingKey` | Header: `MovieSceneScriptingActorReference.h`

Exposes a Sequencer Actor Reference type key to Python/Blueprints. Stores a reference to the data so changes to this class are forwarded onto the underlying data structures.

**Methods** (4):
  - `get_time(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameTime` — Gets the time for this key from the owning channel.
  - `get_value()` -> `MovieSceneObjectBindingID` — Gets the value for this key from the owning channel.
  - `set_time(new_frame_number, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Sets the time for this key in the owning channel. Will replace any key that already exists at that frame number in this ...
  - `set_value(new_value)` -> `None` — Sets the value for this key, reflecting it in the owning channel.

### `unreal.MovieSceneScriptingActualFloatKey`
Inherits: `MovieSceneScriptingFloatKey` | Header: `MovieSceneScriptingFloat.h`

Movie Scene Scripting Actual Float Key

### `unreal.MovieSceneScriptingBoolChannel`
Inherits: `MovieSceneScriptingChannel` | Header: `MovieSceneScriptingBool.h`

Movie Scene Scripting Bool Channel

**Methods** (12):
  - `add_key(time, new_value, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `MovieSceneScriptingBoolKey` — Add a key to this channel. This initializes a new key and returns a reference to it.
  - `compute_effective_range()` -> `SequencerScriptingRange` — Compute the effective range of this channel, for example, the extents of its key times
  - `evaluate_keys(range, frame_rate)` -> `Array [ bool ]` — Gets baked keys in this channel.
  - `get_default()` -> `bool` — Get this channelâs default value that will be used when no keys are present. Only a valid value when HasDefault() retu...
  - `get_keys()` -> `Array [ MovieSceneScriptingKey ]` — Gets all of the keys in this channel.
  - `get_keys_by_index(indices)` -> `Array [ MovieSceneScriptingKey ]` — Gets the keys in this channel specified by the specific index Indices: The indices from which to get the keys from
  - `get_num_keys()` -> `int32` — Returns number of keys in this channel.
  - `has_default()` -> `bool`
  - `remove_default()` -> `None` — Remove this channelâs default value causing the channel to have no effect where no keys are present
  - `remove_key(key)` -> `None` — Removes the specified key. Does nothing if the key is not specified or the key belongs to another channel.
  - `set_default(default_value)` -> `None` — Set this channelâs default value that should be used when no keys are present. Sets bHasDefaultValue to true automatic...
  - `transform(offset_frame, scale, pivot_frame, scripting_range, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Transform the keys in time in the channel by an offset, scale and pivot

### `unreal.MovieSceneScriptingBoolKey`
Inherits: `MovieSceneScriptingKey` | Header: `MovieSceneScriptingBool.h`

Exposes a Sequencer bool type key to Python/Blueprints. Stores a reference to the data so changes to this class are forwarded onto the underlying data structures.

**Methods** (4):
  - `get_time(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameTime` — Gets the time for this key from the owning channel.
  - `get_value()` -> `bool` — Gets the value for this key from the owning channel.
  - `set_time(new_frame_number, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Sets the time for this key in the owning channel. Will replace any key that already exists at that frame number in this ...
  - `set_value(new_value)` -> `None` — Sets the value for this key, reflecting it in the owning channel.

### `unreal.MovieSceneScriptingByteChannel`
Inherits: `MovieSceneScriptingChannel` | Header: `MovieSceneScriptingByte.h`

Movie Scene Scripting Byte Channel

**Methods** (9):
  - `add_key(time, new_value, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, interpolation = MovieSceneKeyInterpolation.AUTO)` -> `MovieSceneScriptingByteKey` — Add a key to this channel. This initializes a new key and returns a reference to it.
  - `get_default()` -> `uint8` — Get this channelâs default value that will be used when no keys are present. Only a valid value when HasDefault() retu...
  - `get_keys()` -> `Array [ MovieSceneScriptingKey ]` — Gets all of the keys in this channel.
  - `get_keys_by_index(indices)` -> `Array [ MovieSceneScriptingKey ]` — Gets the keys in this channel specified by the specific index Indices: The indices from which to get the keys from
  - `has_default()` -> `bool`
  - `remove_default()` -> `None` — Remove this channelâs default value causing the channel to have no effect where no keys are present
  - `remove_key(key)` -> `None` — Removes the specified key. Does nothing if the key is not specified or the key belongs to another channel.
  - `set_default(default_value)` -> `None` — Set this channelâs default value that should be used when no keys are present. Sets bHasDefaultValue to true automatic...
  - `transform(offset_frame, scale, pivot_frame, scripting_range, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Transform the keys in time in the channel by an offset, scale and pivot

### `unreal.MovieSceneScriptingByteKey`
Inherits: `MovieSceneScriptingKey` | Header: `MovieSceneScriptingByte.h`

Exposes a Sequencer byte/enum type key to Python/Blueprints. Stores a reference to the data so changes to this class are forwarded onto the underlying data structures.

**Methods** (4):
  - `get_time(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameTime` — Gets the time for this key from the owning channel.
  - `get_value()` -> `uint8` — Gets the value for this key from the owning channel.
  - `set_time(new_frame_number, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Sets the time for this key in the owning channel. Will replace any key that already exists at that frame number in this ...
  - `set_value(new_value)` -> `None` — Sets the value for this key, reflecting it in the owning channel.

### `unreal.MovieSceneScriptingChannel`
Inherits: `Object` | Header: `MovieSceneScriptingChannel.h`

Movie Scene Scripting Channel

**Properties** (1):
  - `channel_name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.MovieSceneScriptingDoubleAsFloatKey`
Inherits: `MovieSceneScriptingFloatKey` | Header: `MovieSceneScriptingFloat.h`

Movie Scene Scripting Double as Float Key

### `unreal.MovieSceneScriptingDoubleChannel`
Inherits: `MovieSceneScriptingChannel` | Header: `MovieSceneScriptingDouble.h`

Movie Scene Scripting Double Channel

**Methods** (16):
  - `add_key(time, new_value, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, interpolation = MovieSceneKeyInterpolation.AUTO)` -> `MovieSceneScriptingDoubleKey` — Add a key to this channel. This initializes a new key and returns a reference to it.
  - `compute_effective_range()` -> `SequencerScriptingRange` — Compute the effective range of this channel, for example, the extents of its key times
  - `evaluate_keys(range, frame_rate)` -> `Array [ double ]` — Gets baked keys in this channel.
  - `get_default()` -> `double` — Get this channelâs default value that will be used when no keys are present. Only a valid value when HasDefault() retu...
  - `get_keys()` -> `Array [ MovieSceneScriptingKey ]` — Gets all of the keys in this channel.
  - `get_keys_by_index(indices)` -> `Array [ MovieSceneScriptingKey ]` — Gets the keys in this channel specified by the specific index Indices: The indices from which to get the keys from
  - `get_num_keys()` -> `int32` — Returns number of keys in this channel.
  - `get_post_infinity_extrapolation()` -> `RichCurveExtrapolation`
  - `get_pre_infinity_extrapolation()` -> `RichCurveExtrapolation`
  - `has_default()` -> `bool`
  - `remove_default()` -> `None` — Remove this channelâs default value causing the channel to have no effect where no keys are present
  - `remove_key(key)` -> `None` — Removes the specified key. Does nothing if the key is not specified or the key belongs to another channel.
  - `set_default(default_value)` -> `None` — Set this channelâs default value that should be used when no keys are present. Sets bHasDefaultValue to true automatic...
  - `set_post_infinity_extrapolation(extrapolation)` -> `None` — Sets the Post-infinity extrapolation state. See ERichCurveExtrapolation for more detail.
  - `set_pre_infinity_extrapolation(extrapolation)` -> `None` — Sets the Pre-infinity extrapolation state. See ERichCurveExtrapolation for more detail.
  - `transform(offset_frame, scale, pivot_frame, scripting_range, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Transform the keys in time in the channel by an offset, scale and pivot

### `unreal.MovieSceneScriptingDoubleKey`
Inherits: `MovieSceneScriptingKey` | Header: `MovieSceneScriptingDouble.h`

Exposes a Sequencer double type key to Python/Blueprints. Stores a reference to the data so changes to this class are forwarded onto the underlying data structures.

**Methods** (18):
  - `get_arrive_tangent()` -> `float` — If Interpolation Mode is RCIM_Cubic, the arriving tangent at this key
  - `get_arrive_tangent_weight()` -> `float` — If Tangent Weight Mode is RCTWM_WeightedArrive or RCTWM_WeightedBoth, the weight of the arriving tangent on the left sid...
  - `get_interpolation_mode()` -> `RichCurveInterpMode` — Gets the interpolation mode for this key from the owning channel.
  - `get_leave_tangent()` -> `float` — If Interpolation Mode is RCIM_Cubic, the leaving tangent at this key
  - `get_leave_tangent_weight()` -> `float` — If Tangent Weight Mode is RCTWM_WeightedLeave or RCTWM_WeightedBoth, the weight of the leaving tangent on the right side...
  - `get_tangent_mode()` -> `RichCurveTangentMode` — Gets the tangent mode for this key from the owning channel.
  - `get_tangent_weight_mode()` -> `RichCurveTangentWeightMode` — If Interpolation Mode is RCIM_Cubic, the tangent weight mode at this key
  - `get_time(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameTime` — Gets the time for this key from the owning channel.
  - `get_value()` -> `double` — Gets the value for this key from the owning channel.
  - `set_arrive_tangent(new_value)` -> `None` — If Interpolation Mode is RCIM_Cubic, the arriving tangent at this key.
  - `set_arrive_tangent_weight(new_value)` -> `None` — If Tangent Weight Mode is RCTWM_WeightedArrive or RCTWM_WeightedBoth, the weight of the arriving tangent on the left sid...
  - `set_interpolation_mode(new_value)` -> `None` — Sets the interpolation mode for this key, reflecting it in the owning channel.
  - `set_leave_tangent(new_value)` -> `None` — If Interpolation Mode is RCIM_Cubic, the leaving tangent at this key.
  - `set_leave_tangent_weight(new_value)` -> `None` — If Tangent Weight Mode is RCTWM_WeightedLeave or RCTWM_WeightedBoth, the weight of the leaving tangent on the right side...
  - `set_tangent_mode(new_value)` -> `None` — Sets the tangent mode for this key, reflecting it in the owning channel.
  - `set_tangent_weight_mode(new_value)` -> `None` — If Interpolation Mode is RCIM_Cubic, the tangent weight mode at this key.
  - `set_time(new_frame_number, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Sets the time for this key in the owning channel. Will replace any key that already exists at that frame number in this ...
  - `set_value(new_value)` -> `None` — Sets the value for this key, reflecting it in the owning channel.

### `unreal.MovieSceneScriptingEventChannel`
Inherits: `MovieSceneScriptingChannel` | Header: `MovieSceneScriptingEvent.h`

Movie Scene Scripting Event Channel

**Methods** (5):
  - `add_key(time, new_value, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `MovieSceneScriptingEventKey` — Add a key to this channel. This initializes a new key and returns a reference to it.
  - `get_keys()` -> `Array [ MovieSceneScriptingKey ]` — Gets all of the keys in this channel.
  - `get_keys_by_index(indices)` -> `Array [ MovieSceneScriptingKey ]` — Gets the keys in this channel specified by the specific index Indices: The indices from which to get the keys from
  - `remove_key(key)` -> `None` — Removes the specified key. Does nothing if the key is not specified or the key belongs to another channel.
  - `transform(offset_frame, scale, pivot_frame, scripting_range, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Transform the keys in time in the channel by an offset, scale and pivot

### `unreal.MovieSceneScriptingEventKey`
Inherits: `MovieSceneScriptingKey` | Header: `MovieSceneScriptingEvent.h`

Exposes a Sequencer Event type key to Python/Blueprints. Stores a reference to the data so changes to this class are forwarded onto the underlying data structures.

**Methods** (4):
  - `get_time(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameTime` — Gets the time for this key from the owning channel.
  - `get_value()` -> `MovieSceneEvent` — Gets the value for this key from the owning channel.
  - `set_time(new_frame_number, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Sets the time for this key in the owning channel. Will replace any key that already exists at that frame number in this ...
  - `set_value(new_value)` -> `None` — Sets the value for this key, reflecting it in the owning channel.

### `unreal.MovieSceneScriptingFloatChannel`
Inherits: `MovieSceneScriptingChannel` | Header: `MovieSceneScriptingFloat.h`

Movie Scene Scripting Float Channel

**Methods** (16):
  - `add_key(time, new_value, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, interpolation = MovieSceneKeyInterpolation.AUTO)` -> `MovieSceneScriptingFloatKey` — Add a key to this channel. This initializes a new key and returns a reference to it.
  - `compute_effective_range()` -> `SequencerScriptingRange` — Compute the effective range of this channel, for example, the extents of its key times
  - `evaluate_keys(range, frame_rate)` -> `Array [ float ]` — Gets baked keys in this channel.
  - `get_default()` -> `float` — Get this channelâs default value that will be used when no keys are present. Only a valid value when HasDefault() retu...
  - `get_keys()` -> `Array [ MovieSceneScriptingKey ]` — Gets all of the keys in this channel.
  - `get_keys_by_index(indices)` -> `Array [ MovieSceneScriptingKey ]` — Gets the keys in this channel specified by the specific index Indices: The indices from which to get the keys from
  - `get_num_keys()` -> `int32` — Returns number of keys in this channel.
  - `get_post_infinity_extrapolation()` -> `RichCurveExtrapolation`
  - `get_pre_infinity_extrapolation()` -> `RichCurveExtrapolation`
  - `has_default()` -> `bool`
  - `remove_default()` -> `None` — Remove this channelâs default value causing the channel to have no effect where no keys are present
  - `remove_key(key)` -> `None` — Removes the specified key. Does nothing if the key is not specified or the key belongs to another channel.
  - `set_default(default_value)` -> `None` — Set this channelâs default value that should be used when no keys are present. Sets bHasDefaultValue to true automatic...
  - `set_post_infinity_extrapolation(extrapolation)` -> `None` — Sets the Post-infinity extrapolation state. See ERichCurveExtrapolation for more detail.
  - `set_pre_infinity_extrapolation(extrapolation)` -> `None` — Sets the Pre-infinity extrapolation state. See ERichCurveExtrapolation for more detail.
  - `transform(offset_frame, scale, pivot_frame, scripting_range, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Transform the keys in time in the channel by an offset, scale and pivot

### `unreal.MovieSceneScriptingFloatKey`
Inherits: `MovieSceneScriptingKey` | Header: `MovieSceneScriptingFloat.h`

Exposes a Sequencer float type key to Python/Blueprints. Stores a reference to the data so changes to this class are forwarded onto the underlying data structures.

**Methods** (18):
  - `get_arrive_tangent()` -> `float` — If Interpolation Mode is RCIM_Cubic, the arriving tangent at this key
  - `get_arrive_tangent_weight()` -> `float` — If Tangent Weight Mode is RCTWM_WeightedArrive or RCTWM_WeightedBoth, the weight of the arriving tangent on the left sid...
  - `get_interpolation_mode()` -> `RichCurveInterpMode` — Gets the interpolation mode for this key from the owning channel.
  - `get_leave_tangent()` -> `float` — If Interpolation Mode is RCIM_Cubic, the leaving tangent at this key
  - `get_leave_tangent_weight()` -> `float` — If Tangent Weight Mode is RCTWM_WeightedLeave or RCTWM_WeightedBoth, the weight of the leaving tangent on the right side...
  - `get_tangent_mode()` -> `RichCurveTangentMode` — Gets the tangent mode for this key from the owning channel.
  - `get_tangent_weight_mode()` -> `RichCurveTangentWeightMode` — If Interpolation Mode is RCIM_Cubic, the tangent weight mode at this key
  - `get_time(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameTime` — Gets the time for this key from the owning channel.
  - `get_value()` -> `float` — Gets the value for this key from the owning channel.
  - `set_arrive_tangent(new_value)` -> `None` — If Interpolation Mode is RCIM_Cubic, the arriving tangent at this key.
  - `set_arrive_tangent_weight(new_value)` -> `None` — If Tangent Weight Mode is RCTWM_WeightedArrive or RCTWM_WeightedBoth, the weight of the arriving tangent on the left sid...
  - `set_interpolation_mode(new_value)` -> `None` — Sets the interpolation mode for this key, reflecting it in the owning channel.
  - `set_leave_tangent(new_value)` -> `None` — If Interpolation Mode is RCIM_Cubic, the leaving tangent at this key.
  - `set_leave_tangent_weight(new_value)` -> `None` — If Tangent Weight Mode is RCTWM_WeightedLeave or RCTWM_WeightedBoth, the weight of the leaving tangent on the right side...
  - `set_tangent_mode(new_value)` -> `None` — Sets the tangent mode for this key, reflecting it in the owning channel.
  - `set_tangent_weight_mode(new_value)` -> `None` — If Interpolation Mode is RCIM_Cubic, the tangent weight mode at this key.
  - `set_time(new_frame_number, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Sets the time for this key in the owning channel. Will replace any key that already exists at that frame number in this ...
  - `set_value(new_value)` -> `None` — Sets the value for this key, reflecting it in the owning channel.

### `unreal.MovieSceneScriptingIntegerChannel`
Inherits: `MovieSceneScriptingChannel` | Header: `MovieSceneScriptingInteger.h`

Movie Scene Scripting Integer Channel

**Methods** (13):
  - `add_key(time, new_value, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `MovieSceneScriptingIntegerKey` — Add a key to this channel. This initializes a new key and returns a reference to it.
  - `evaluate_keys(range, frame_rate)` -> `Array [ int32 ]` — Gets baked keys in this channel.
  - `get_default()` -> `int32` — Get this channelâs default value that will be used when no keys are present. Only a valid value when HasDefault() retu...
  - `get_interpolate_linear_keys()` -> `bool` — Get whether this channel will evaluate linear keys with interpolation.
  - `get_keys()` -> `Array [ MovieSceneScriptingKey ]` — Gets all of the keys in this channel.
  - `get_keys_by_index(indices)` -> `Array [ MovieSceneScriptingKey ]` — Gets the keys in this channel specified by the specific index Indices: The indices from which to get the keys from
  - `get_num_keys()` -> `int32` — Returns number of keys in this channel.
  - `has_default()` -> `bool`
  - `remove_default()` -> `None` — Remove this channelâs default value causing the channel to have no effect where no keys are present
  - `remove_key(key)` -> `None` — Removes the specified key. Does nothing if the key is not specified or the key belongs to another channel.
  - `set_default(default_value)` -> `None` — Set this channelâs default value that should be used when no keys are present. Sets bHasDefaultValue to true automatic...
  - `set_interpolate_linear_keys(interpolate_linear_keys)` -> `None` — Set this channel to evaluate linear keys with interpolation.
  - `transform(offset_frame, scale, pivot_frame, scripting_range, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Transform the keys in time in the channel by an offset, scale and pivot

### `unreal.MovieSceneScriptingIntegerKey`
Inherits: `MovieSceneScriptingKey` | Header: `MovieSceneScriptingInteger.h`

Exposes a Sequencer integer type key to Python/Blueprints. Stores a reference to the data so changes to this class are forwarded onto the underlying data structures.

**Methods** (4):
  - `get_time(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameTime` — Gets the time for this key from the owning channel.
  - `get_value()` -> `int32` — Gets the value for this key from the owning channel.
  - `set_time(new_frame_number, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Sets the time for this key in the owning channel. Will replace any key that already exists at that frame number in this ...
  - `set_value(new_value)` -> `None` — Sets the value for this key, reflecting it in the owning channel.

### `unreal.MovieSceneScriptingKey`
Inherits: `Object` | Header: `MovieSceneScriptingChannel.h`

Movie Scene Scripting Key

### `unreal.MovieSceneScriptingObjectPathChannel`
Inherits: `MovieSceneScriptingChannel` | Header: `MovieSceneScriptingObjectPath.h`

Movie Scene Scripting Object Path Channel

**Methods** (9):
  - `add_key(time, new_value, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `MovieSceneScriptingObjectPathKey` — Add a key to this channel. This initializes a new key and returns a reference to it.
  - `get_default()` -> `Object` — Get this channelâs default value that will be used when no keys are present. Only a valid value when HasDefault() retu...
  - `get_keys()` -> `Array [ MovieSceneScriptingKey ]` — Gets all of the keys in this channel.
  - `get_keys_by_index(indices)` -> `Array [ MovieSceneScriptingKey ]` — Gets the keys in this channel specified by the specific index Indices: The indices from which to get the keys from
  - `has_default()` -> `bool`
  - `remove_default()` -> `None` — Remove this channelâs default value causing the channel to have no effect where no keys are present
  - `remove_key(key)` -> `None` — Removes the specified key. Does nothing if the key is not specified or the key belongs to another channel.
  - `set_default(default_value)` -> `None` — Set this channelâs default value that should be used when no keys are present. Sets bHasDefaultValue to true automatic...
  - `transform(offset_frame, scale, pivot_frame, scripting_range, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Transform the keys in time in the channel by an offset, scale and pivot

### `unreal.MovieSceneScriptingObjectPathKey`
Inherits: `MovieSceneScriptingKey` | Header: `MovieSceneScriptingObjectPath.h`

Exposes a Sequencer Object Path type key to Python/Blueprints. Stores a reference to the data so changes to this class are forwarded onto the underlying data structures.

**Methods** (4):
  - `get_time(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameTime` — Gets the time for this key from the owning channel.
  - `get_value()` -> `Object` — Gets the value for this key from the owning channel.
  - `set_time(new_frame_number, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Sets the time for this key in the owning channel. Will replace any key that already exists at that frame number in this ...
  - `set_value(new_value)` -> `None` — Sets the value for this key, reflecting it in the owning channel.

### `unreal.MovieSceneScriptingParticleChannel`
Inherits: `MovieSceneScriptingChannel` | Header: `MovieSceneScriptingParticle.h`

Movie Scene Scripting Particle Channel

**Methods** (12):
  - `add_key(time, new_particle_value, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `MovieSceneScriptingParticleKey` — Add a key to this channel. This initializes a new key and returns a reference to it.
  - `compute_effective_range()` -> `SequencerScriptingRange` — Compute the effective range of this channel, for example, the extents of its key times
  - `evaluate_keys(range, frame_rate)` -> `Array [ ParticleKey ]` — Gets baked keys in this channel.
  - `get_default()` -> `ParticleKey` — Get this channelâs default value that will be used when no keys are present. Only a valid value when HasDefault() retu...
  - `get_keys()` -> `Array [ MovieSceneScriptingKey ]` — Gets all of the keys in this channel.
  - `get_keys_by_index(indices)` -> `Array [ MovieSceneScriptingKey ]` — Gets the keys in this channel specified by the specific index Indices: The indices from which to get the keys from
  - `get_num_keys()` -> `int32` — Returns number of keys in this channel.
  - `has_default()` -> `bool`
  - `remove_default()` -> `None` — Remove this channelâs default value causing the channel to have no effect where no keys are present
  - `remove_key(key)` -> `None` — Removes the specified key. Does nothing if the key is not specified or the key belongs to another channel.
  - `set_default(default_value)` -> `None` — Set this channelâs default value that should be used when no keys are present. Sets bHasDefaultValue to true automatic...
  - `transform(offset_frame, scale, pivot_frame, scripting_range, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Transform the keys in time in the channel by an offset, scale and pivot

### `unreal.MovieSceneScriptingParticleKey`
Inherits: `MovieSceneScriptingKey` | Header: `MovieSceneScriptingParticle.h`

Exposes a Sequencer partcicle type key to Python/Blueprints. Stores a reference to the data so changes to this class are forwarded onto the underlying data structures.

**Methods** (4):
  - `get_time(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameTime` — Gets the time for this key from the owning channel.
  - `get_value()` -> `ParticleKey` — Gets the value for this key from the owning channel.
  - `set_time(new_frame_number, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Sets the time for this key in the owning channel. Will replace any key that already exists at that frame number in this ...
  - `set_value(new_value)` -> `None` — Sets the value for this key, reflecting it in the owning channel.

### `unreal.MovieSceneScriptingStringChannel`
Inherits: `MovieSceneScriptingChannel` | Header: `MovieSceneScriptingString.h`

Movie Scene Scripting String Channel

**Methods** (9):
  - `add_key(time, new_value, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `MovieSceneScriptingStringKey` — Add a key to this channel. This initializes a new key and returns a reference to it.
  - `get_default()` -> `str` — Get this channelâs default value that will be used when no keys are present. Only a valid value when HasDefault() retu...
  - `get_keys()` -> `Array [ MovieSceneScriptingKey ]` — Gets all of the keys in this channel.
  - `get_keys_by_index(indices)` -> `Array [ MovieSceneScriptingKey ]` — Gets the keys in this channel specified by the specific index Indices: The indices from which to get the keys from
  - `has_default()` -> `bool`
  - `remove_default()` -> `None` — Remove this channelâs default value causing the channel to have no effect where no keys are present
  - `remove_key(key)` -> `None` — Removes the specified key. Does nothing if the key is not specified or the key belongs to another channel.
  - `set_default(default_value)` -> `None` — Set this channelâs default value that should be used when no keys are present. Sets bHasDefaultValue to true automatic...
  - `transform(offset_frame, scale, pivot_frame, scripting_range, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Transform the OffsetFrame in time in the channel by an offset, scale and pivot

### `unreal.MovieSceneScriptingStringKey`
Inherits: `MovieSceneScriptingKey` | Header: `MovieSceneScriptingString.h`

Exposes a Sequencer string type key to Python/Blueprints. Stores a reference to the data so changes to this class are forwarded onto the underlying data structures.

**Methods** (4):
  - `get_time(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameTime` — Gets the time for this key from the owning channel.
  - `get_value()` -> `str` — Gets the value for this key from the owning channel.
  - `set_time(new_frame_number, sub_frame = 0.000000, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — Sets the time for this key in the owning channel. Will replace any key that already exists at that frame number in this ...
  - `set_value(new_value)` -> `None` — Sets the value for this key, reflecting it in the owning channel.

### `unreal.MovieSceneSectionExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneSectionExtensions.h`

Function library containing methods that should be hoisted onto UMovieSceneSections for scripting

**Methods** (24):
  - `get_all_channels(section)` -> `Array [ MovieSceneScriptingChannel ]` [classmethod] — Find all channels that belong to the specified UMovieSceneSection. Some sections have many channels (such as Transforms ...
  - `get_auto_size_end_frame(section)` -> `int32` [classmethod] — Get end frame of the AutoSize. Will throw an exception if section has no end frame, use GetAutoSizeHasEndFrame to check ...
  - `get_auto_size_end_frame_seconds(section)` -> `float` [classmethod] — Get end time of the AutoSize seconds. Will throw an exception if section has no end frame, use GetAutoSizeHasEndFrame to...
  - `get_auto_size_has_end_frame(section)` -> `bool` [classmethod] — Checks to see if this section has an AutoSize implementation, and if so, if that implementation has a end frame.
  - `get_auto_size_has_start_frame(section)` -> `bool` [classmethod] — Checks to see if this section has an AutoSize implementation, and if so, if that implementation has a start frame.
  - `get_auto_size_start_frame(section)` -> `int32` [classmethod] — Get start frame of the AutoSize. Will throw an exception if section has no start frame, use GetAutoSizeHasStartFrame to ...
  - `get_auto_size_start_frame_seconds(section)` -> `float` [classmethod] — Get start time of the AutoSize in seconds. Will throw an exception if section has no start frame, use GetAutoSizeHasStar...
  - `get_channel(section, channel_name)` -> `MovieSceneScriptingChannel` [classmethod] — Get channel from specified section and channel name
  - `get_channels_by_type(section, channel_type)` -> `Array [ MovieSceneScriptingChannel ]` [classmethod] — Find all channels that belong to the specified UMovieSceneSection that match the specific type. This will filter out any...
  - `get_end_frame(section)` -> `int32` [classmethod] — Get end frame. Will throw an exception if section has no end frame, use HasEndFrame to check first.
  - `get_end_frame_seconds(section)` -> `float` [classmethod] — Get end time in seconds. Will throw an exception if section has no end frame, use HasEndFrame to check first.
  - `get_parent_sequence_frame(section, frame, parent_sequence)` -> `int32` [classmethod] — Get the frame in the space of its parent sequence
  - `get_start_frame(section)` -> `int32` [classmethod] — Get start frame. Will throw an exception if section has no start frame, use HasStartFrame to check first.
  - `get_start_frame_seconds(section)` -> `float` [classmethod] — Get start time in seconds. Will throw an exception if section has no start frame, use HasStartFrame to check first.
  - `has_end_frame(section)` -> `bool` [classmethod] — Has end frame
  - `has_start_frame(section)` -> `bool` [classmethod] — Has start frame
  - `set_end_frame(section, end_frame)` -> `None` [classmethod] — Set end frame
  - `set_end_frame_bounded(section, is_bounded)` -> `None` [classmethod] — Set end frame bounded
  - `set_end_frame_seconds(section, end_time)` -> `None` [classmethod] — Set end time in seconds
  - `set_range(section, start_frame, end_frame)` -> `None` [classmethod] — Set range
  - `set_range_seconds(section, start_time, end_time)` -> `None` [classmethod] — Set range in seconds
  - `set_start_frame(section, start_frame)` -> `None` [classmethod] — Set start frame
  - `set_start_frame_bounded(section, is_bounded)` -> `None` [classmethod] — Set start frame bounded
  - `set_start_frame_seconds(section, start_time)` -> `None` [classmethod] — Set start time in seconds

### `unreal.MovieSceneSequenceExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneSequenceExtensions.h`

Function library containing methods that should be hoisted onto UMovieSceneSequences for scripting purposes

**Methods** (69):
  - `add_marked_frame(sequence, marked_frame)` -> `int32` [classmethod] — Add Marked Frame deprecated: AddMarkedFrame is deprecated. Please use AddMarkedFrame that takes a time unit instead
  - `add_marked_frame_to_sequence(sequence, marked_frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `int32` [classmethod] — InMarkedFrame: The given user marked frame to add *
  - `add_possessable(sequence, object_to_possess)` -> `MovieSceneBindingProxy` [classmethod] — Add a new binding to this sequence that will possess the specified object
  - `add_root_folder_to_sequence(sequence, new_folder_name)` -> `MovieSceneFolder` [classmethod] — Add a root folder to the given sequence
  - `add_spawnable_from_class(sequence, class_to_spawn)` -> `MovieSceneBindingProxy` [classmethod] — Add Spawnable from Class deprecated: AddSpawnableFromClass is deprecated. Please use AddSpawnableFromClass in the Level ...
  - `add_spawnable_from_instance(sequence, object_to_spawn)` -> `MovieSceneBindingProxy` [classmethod] — Add Spawnable from Instance deprecated: AddSpawnableFromInstance is deprecated. Please use AddSpawnableFromInstance in t...
  - `add_track(sequence, track_type)` -> `MovieSceneTrack` [classmethod] — Add a new track of the specified type
  - `are_marked_frames_locked(sequence)` -> `bool` [classmethod]
  - `delete_marked_frame(sequence, delete_index)` -> `None` [classmethod] — DeleteIndex: The index to the user marked frame to delete
  - `delete_marked_frames(sequence)` -> `None` [classmethod]
  - `find_binding_by_id(sequence, binding_id)` -> `MovieSceneBindingProxy` [classmethod] — Attempt to locate a binding in this sequence by its Id
  - `find_binding_by_name(sequence, name)` -> `MovieSceneBindingProxy` [classmethod] — Attempt to locate a binding in this sequence by its name
  - `find_marked_frame_by_frame_number(sequence, frame_number)` -> `int32` [classmethod] — Find Marked Frame by Frame Number deprecated: FindMarkedFrameByFrameNumber is deprecated. Please use FindMarkedFrameByFr...
  - `find_marked_frame_by_frame_number_in_sequence(sequence, frame_number, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `int32` [classmethod] — InFrameNumber: The frame number of the user marked frame to find
  - `find_marked_frame_by_label(sequence, label)` -> `int32` [classmethod] — InLabel: The label to the user marked frame to find
  - `find_next_marked_frame(sequence, frame_number, forward)` -> `int32` [classmethod] — Find Next Marked Frame deprecated: FindNextMarkedFrame is deprecated. Please use FindNextMarkedFrame that takes a time u...
  - `find_next_marked_frame_in_sequence(sequence, frame_number, forward, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `int32` [classmethod] — InFrameNumber: The frame number to find the next/previous user marked frame from * bForward: Find forward from the given...
  - `find_tracks_by_exact_type(sequence, track_type)` -> `Array [ MovieSceneTrack ]` [classmethod] — Find all tracks of the specified type, not allowing sub-classed types
  - `find_tracks_by_type(sequence, track_type)` -> `Array [ MovieSceneTrack ]` [classmethod] — Find all tracks of the specified type
  - `get_binding_id(sequence, binding)` -> `MovieSceneObjectBindingID` [classmethod] — Get the binding ID for a binding within a sequence. note:: The resulting binding is only valid when applied to propertie...
  - `get_bindings(sequence)` -> `Array [ MovieSceneBindingProxy ]` [classmethod] — Get all the bindings in this sequence
  - `get_clock_source(sequence)` -> `UpdateClockSource` [classmethod] — Get the clock source for this sequence
  - `get_display_rate(sequence)` -> `FrameRate` [classmethod] — Gets this sequenceâs display rate
  - `get_evaluation_type(sequence)` -> `MovieSceneEvaluationType` [classmethod] — Get the evaluation type for this sequence
  - `get_marked_frames(sequence)` -> `Array [ MovieSceneMarkedFrame ]` [classmethod] — Get Marked Frames deprecated: GetMarkedFrames is deprecated. Please use GetMarkedFrames that takes a time unit instead
  - `get_marked_frames_from_sequence(sequence, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ MovieSceneMarkedFrame ]` [classmethod]
  - `get_movie_scene(sequence)` -> `MovieScene` [classmethod] — Get this sequenceâs movie scene data
  - `get_playback_end(sequence)` -> `int32` [classmethod] — Get playback end of this sequence in display rate resolution
  - `get_playback_end_seconds(sequence)` -> `float` [classmethod] — Get playback end of this sequence in seconds
  - `get_playback_range(sequence)` -> `SequencerScriptingRange` [classmethod] — Get playback range of this sequence in display rate resolution
  - `get_playback_start(sequence)` -> `int32` [classmethod] — Get playback start of this sequence in display rate resolution
  - `get_playback_start_seconds(sequence)` -> `float` [classmethod] — Get playback start of this sequence in seconds
  - `get_portable_binding_id(root_sequence, destination_sequence, binding)` -> `MovieSceneObjectBindingID` [classmethod] — Get a portable binding ID for a binding that resides in a different sequence to the one where this binding will be resol...
  - `get_possessables(sequence)` -> `Array [ MovieSceneBindingProxy ]` [classmethod] — Get all the possessables in this sequence. It is understood for the purpose of this function that this means the binding...
  - `get_root_folders_in_sequence(sequence)` -> `Array [ MovieSceneFolder ]` [classmethod] — Get the root folders in the provided sequence
  - `get_spawnables(sequence)` -> `Array [ MovieSceneBindingProxy ]` [classmethod] — Get all the spawnables in this sequence. For Level Sequences, this includes bindings with binding type UMovieSceneSpawna...
  - `get_tick_resolution(sequence)` -> `FrameRate` [classmethod] — Gets this sequenceâs tick resolution
  - `get_tracks(sequence)` -> `Array [ MovieSceneTrack ]` [classmethod] — Get all tracks
  - `get_view_range_end(sequence)` -> `double` [classmethod] — Get the sequence view range end in seconds
  - `get_view_range_start(sequence)` -> `double` [classmethod] — Get the sequence view range start in seconds
  - `get_work_range_end(sequence)` -> `double` [classmethod] — Get the sequence work range end in seconds
  - `get_work_range_start(sequence)` -> `double` [classmethod] — Get the sequence work range start in seconds
  - `is_playback_range_locked(sequence)` -> `bool` [classmethod]
  - `is_read_only(sequence)` -> `bool` [classmethod]
  - `locate_bound_objects(sequence, binding, context)` -> `Array [ Object ]` [classmethod] — Locate all the objects that correspond to the specified object ID, using the specified context
  - `make_range(sequence, start_frame, duration)` -> `SequencerScriptingRange` [classmethod] — Make a new range for this sequence in its display rate
  - `make_range_seconds(sequence, start_time, duration)` -> `SequencerScriptingRange` [classmethod] — Make a new range for this sequence in seconds
  - `remove_root_folder_from_sequence(sequence, folder)` -> `None` [classmethod] — Remove a root folder from the given sequence. Will throw an exception if the specified folder is not valid or not a root...
  - `remove_track(sequence, track)` -> `bool` [classmethod] — Removes a track
  - `resolve_binding_id(root_sequence, object_binding_id)` -> `MovieSceneBindingProxy` [classmethod] — Make a binding for the given binding ID
  - `set_clock_source(sequence, clock_source)` -> `None` [classmethod] — Set the clock source for this sequence
  - `set_display_rate(sequence, display_rate)` -> `None` [classmethod] — Sets this sequenceâs display rate
  - `set_evaluation_type(sequence, evaluation_type)` -> `None` [classmethod] — Set the evaluation type for this sequence
  - `set_marked_frame(sequence, mark_index, frame_number)` -> `None` [classmethod] — Set Marked Frame deprecated: SetMarkedFrame is deprecated. Please use SetMarkedFrame that takes a time unit instead
  - `set_marked_frame_in_sequence(sequence, mark_index, frame_number, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — InMarkIndex: The given user marked frame index to edit * InFrameNumber: The frame number to set
  - `set_marked_frames_locked(sequence, locked)` -> `None` [classmethod] — bInLocked: Whether the movie scene marked frames should be locked
  - `set_playback_end(sequence, end_frame)` -> `None` [classmethod] — Set playback end of this sequence
  - `set_playback_end_seconds(sequence, end_time)` -> `None` [classmethod] — Set playback end of this sequence in seconds
  - `set_playback_range_locked(sequence, locked)` -> `None` [classmethod] — bInLocked: Whether the movie scene playback range should be locked
  - `set_playback_start(sequence, start_frame)` -> `None` [classmethod] — Set playback start of this sequence
  - `set_playback_start_seconds(sequence, start_time)` -> `None` [classmethod] — Set playback start of this sequence in seconds
  - `set_read_only(sequence, read_only)` -> `None` [classmethod] — bInReadOnly: Whether the movie scene should be read only or not
  - `set_tick_resolution(sequence, tick_resolution)` -> `None` [classmethod] — Sets this sequenceâs tick resolution and migrates frame times
  - `set_tick_resolution_directly(sequence, tick_resolution)` -> `None` [classmethod] — Sets this sequenceâs tick resolution directly without migrating frame times
  - `set_view_range_end(sequence, end_time_in_seconds)` -> `None` [classmethod] — Set the sequence view range end in seconds
  - `set_view_range_start(sequence, start_time_in_seconds)` -> `None` [classmethod] — Set the sequence view range start in seconds
  - `set_work_range_end(sequence, end_time_in_seconds)` -> `None` [classmethod] — Set the sequence work range end in seconds
  - `set_work_range_start(sequence, start_time_in_seconds)` -> `None` [classmethod] — Set the sequence work range start in seconds
  - `sort_marked_frames(sequence)` -> `None` [classmethod]

### `unreal.MovieSceneTimeWarpExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneTimeWarpExtensions.h`

Function library containing methods that relate to time-warp within Sequencer

**Methods** (6):
  - `break_time_warp(time_warp)` -> `double` [classmethod] — Break Time Warp
  - `conv_play_rate_to_time_warp_variant(constant_play_rate)` -> `MovieSceneTimeWarpVariant` [classmethod] — Converts a constant playrate to a timewarp variant
  - `conv_time_warp_variant_to_play_rate(time_warp)` -> `double` [classmethod] — Converts a timewarp variant struct to a constant play rate
  - `make_time_warp(fixed_play_rate)` -> `MovieSceneTimeWarpVariant` [classmethod] — Make Time Warp
  - `set_fixed_play_rate(time_warp, fixed_play_rate)` -> `MovieSceneTimeWarpVariant` [classmethod] — Assign a constant playrate to this timewarp, overwriting any existing timewarp implementation.
  - `to_fixed_play_rate(time_warp)` -> `double` [classmethod] — Retrieve this timewarpâs constant play rate. Will throw an error if the timewarp is not a constant play rate.

### `unreal.MovieSceneTrackExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneTrackExtensions.h`

Function library containing methods that should be hoisted onto UMovieSceneTracks for scripting

**Methods** (13):
  - `add_section(track)` -> `MovieSceneSection` [classmethod] — Add a new section to this track
  - `get_color_tint(track)` -> `Color` [classmethod] — Get the color tint for this track
  - `get_display_name(track)` -> `Text` [classmethod] — Get this trackâs display name
  - `get_section_to_key(track)` -> `MovieSceneSection` [classmethod] — Get the section to key for this track
  - `get_sections(track)` -> `Array [ MovieSceneSection ]` [classmethod] — Access all this trackâs sections
  - `get_sorting_order(track)` -> `int32` [classmethod] — Get the sorting order for this track
  - `get_track_row_display_name(track, row_index)` -> `Text` [classmethod] — Get this track rowâs display name
  - `remove_section(track, section)` -> `None` [classmethod] — Remove the specified section
  - `set_color_tint(track, color_tint)` -> `None` [classmethod] — Set the color tint for this track
  - `set_display_name(track, name)` -> `None` [classmethod] — Set this trackâs display name
  - `set_section_to_key(track, section)` -> `None` [classmethod] — Set the section to key for this track. When properties for this section are modified externally, this section will recei...
  - `set_sorting_order(track, sorting_order)` -> `None` [classmethod] — Set the sorting order for this track
  - `set_track_row_display_name(track, name, row_index)` -> `None` [classmethod] — Set this track rowâs display name

### `unreal.SequencerScriptingRangeExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `SequencerScriptingRangeExtensions.h`

Function library containing methods that should be hoisted onto FSequencerScriptingRanges

**Methods** (12):
  - `get_end_frame(range)` -> `int32` [classmethod] — Get the ending frame for the specified range, if it has one. Defined as the first subsequent frame that is outside of th...
  - `get_end_seconds(range)` -> `float` [classmethod] — Get the ending time for the specified range in seconds, if it has one. Defined as the first time that is outside of the ...
  - `get_start_frame(range)` -> `int32` [classmethod] — Get the starting frame for the specified range, if it has one. Defined as the first valid frame that is inside the range...
  - `get_start_seconds(range)` -> `float` [classmethod] — Get the starting time for the specified range in seconds, if it has one. Defined as the first valid time that is inside ...
  - `has_end(range)` -> `bool` [classmethod] — Check whether this range has an end
  - `has_start(range)` -> `bool` [classmethod] — Check whether this range has a start
  - `remove_end(range)` -> `SequencerScriptingRange` [classmethod] — Remove the end from this range, making it infinite
  - `remove_start(range)` -> `SequencerScriptingRange` [classmethod] — Remove the start from this range, making it infinite
  - `set_end_frame(range, end)` -> `SequencerScriptingRange` [classmethod] — Set the ending frame for the specified range. Interpreted as the first subsequent frame that is outside of the range.
  - `set_end_seconds(range, end)` -> `SequencerScriptingRange` [classmethod] — Set the ending time for the specified range in seconds. Interpreted as the first time that is outside of the range.
  - `set_start_frame(range, start)` -> `SequencerScriptingRange` [classmethod] — Set the starting frame for the specified range. Interpreted as the first valid frame that is inside the range.
  - `set_start_seconds(range, start)` -> `SequencerScriptingRange` [classmethod] — Set the starting time for the specified range in seconds. Interpreted as the first valid time that is inside the range.
