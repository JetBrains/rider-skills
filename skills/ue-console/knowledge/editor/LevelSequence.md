# UE Python API — LevelSequence Module

**18 types** from the `LevelSequence` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LevelSequenceAnimSequenceLinkItem`, `LevelSequenceCameraSettings`, `LevelSequencePlayerSnapshot`, `AnimSequenceLevelSequenceLink`, `DefaultLevelSequenceInstanceData`, `LevelSequence`, `LevelSequenceActor`, `LevelSequenceAnimSequenceLink`, `LevelSequenceBurnIn`, `LevelSequenceBurnInInitSettings`, `LevelSequenceBurnInOptions`, `LevelSequenceDirector`, `LevelSequenceMediaController`, `LevelSequencePlayer`, `LevelSequenceShotMetaDataLibrary`, `ReplicatedLevelSequenceActor`, `LevelSequenceActor_OnLevelSequenceLoaded`, `OnLevelSequencePlayerCameraCutEvent`

---

## Classes

### `unreal.LevelSequenceAnimSequenceLinkItem`
Inherits: `StructBase` | Header: `LevelSequenceAnimSequenceLink.h`

Link To Anim Sequence that we are linked too.

**Properties** (20):
  - `curve_interpolation`: `RichCurveInterpMode` — [Read-Write] (RichCurveInterpMode)
  - `custom_display_rate`: `FrameRate` — [Read-Write] Custom display rate, should be set from the movie scene/sequencer display rate (FrameRa...
  - `custom_end_frame`: `FrameNumber` — [Read-Write] Custom end frame in display rate (FrameNumber)
  - `custom_frame_rate`: `FrameRate` — [Read-Write] Custom frame rate that the anim sequence may have been recorded at (FrameRate)
  - `custom_start_frame`: `FrameNumber` — [Read-Write] Custom start frame in display rate (FrameNumber)
  - `delay_before_start`: `FrameNumber` — [Read-Write] Number of Display Rate frames to delay at the same frame before doing the export. It wi...
  - `evaluate_all_skeletal_mesh_components`: `bool` — [Read-Write] (bool)
  - `exclude_animation_names`: `None` — [Read-Write] Exclude all animation bones/curves that match this list (Array[str])
  - `export_attribute_curves`: `bool` — [Read-Write] (bool)
  - `export_material_curves`: `bool` — [Read-Write] (bool)
  - `export_morph_targets`: `bool` — [Read-Write] (bool)
  - `export_transforms`: `bool` — [Read-Write] From Editor Only UAnimSeqExportOption we cache this since we can re-import dynamically ...
  - `include_animation_names`: `None` — [Read-Write] Include only the animation bones/curves that match this list (Array[str])
  - `interpolation`: `AnimInterpolationType` — [Read-Write] (AnimInterpolationType)
  - `path_to_anim_sequence`: `SoftObjectPath` — [Read-Write] (SoftObjectPath)
  - `record_in_world_space`: `bool` — [Read-Write] (bool)
  - `skel_track_guid`: `Guid` — [Read-Write] (Guid)
  - `use_custom_frame_rate`: `bool` — [Read-Write] Whether or not to use custom frame rate or Sequencer display rate (bool)
  - `use_custom_time_range`: `bool` — [Read-Write] Whether or not to use custom time range (bool)
  - `warm_up_frames`: `FrameNumber` — [Read-Write] Number of Display Rate frames to evaluate before doing the export. It will evaluate aft...

### `unreal.LevelSequenceCameraSettings`
Inherits: `StructBase` | Header: `LevelSequenceCameraSettings.h`

Level Sequence Camera Settings

**Properties** (2):
  - `aspect_ratio_axis_constraint`: `AspectRatioAxisConstraint` — [Read-Write] (AspectRatioAxisConstraint)
  - `override_aspect_ratio_axis_constraint`: `bool` — [Read-Write] (bool)

### `unreal.LevelSequencePlayerSnapshot`
Inherits: `StructBase` | Header: `LevelSequencePlayer.h`

Frame snapshot information for a level sequence

**Properties** (9):
  - `active_shot`: `LevelSequence` [Read-Only] — [Read-Only] (LevelSequence)
  - `camera_component`: `CameraComponent` [Read-Only] — [Read-Only] (CameraComponent)
  - `current_shot_local_time`: `QualifiedTime` [Read-Only] — [Read-Only] (QualifiedTime)
  - `current_shot_name`: `str` [Read-Only] — [Read-Only] (str)
  - `current_shot_source_time`: `QualifiedTime` [Read-Only] — [Read-Only] (QualifiedTime)
  - `root_name`: `str` [Read-Only] — [Read-Only] (str)
  - `root_time`: `QualifiedTime` [Read-Only] — [Read-Only] (QualifiedTime)
  - `source_time`: `QualifiedTime` [Read-Only] — [Read-Only] (QualifiedTime)
  - `source_timecode`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.AnimSequenceLevelSequenceLink`
Inherits: `AssetUserData` | Header: `AnimSequenceLevelSequenceLink.h`

Link To Level Sequence That may be driving the anim sequence

**Properties** (2):
  - `path_to_level_sequence`: `SoftObjectPath` — [Read-Write] (SoftObjectPath)
  - `skel_track_guid`: `Guid` — [Read-Write] (Guid)

### `unreal.DefaultLevelSequenceInstanceData`
Inherits: `Object` | Header: `DefaultLevelSequenceInstanceData.h`

Default instance data class that level sequences understand. Implements IMovieSceneTransformOrigin.

**Methods** (1):
  - `bp_get_transform_origin()` -> `Transform` — Get the transform from which all absolute component transform sections should be relative. Scale is ignored.

**Properties** (2):
  - `transform_origin`: `Transform` — [Read-Write] Specifies a transform that offsets all absolute transform sections in this sequence. Sc...
  - `transform_origin_actor`: `Actor` — [Read-Write] When set, this actorâs world position will be used as the transform origin for all ab...

### `unreal.LevelSequence`
Inherits: `MovieSceneSequence` | Header: `LevelSequence.h`

Movie scene animation for Actors.

**Methods** (7):
  - `add_asset_user_data_of_class(user_data_class)` -> `bool` — Creates and adds an instance of the provided AssetUserData class to the target asset.
  - `copy_meta_data(meta_data)` -> `Object` — Copy the specified meta data into this level sequence, overwriting any existing meta-data of the same type Meta-data may...
  - `find_meta_data_by_class(class_)` -> `Object` — Find meta-data of a particular type for this level sequence instance.
  - `find_or_add_meta_data_by_class(class_)` -> `Object` — Find meta-data of a particular type for this level sequence instance, adding it if it doesnât already exist.
  - `get_asset_user_data_of_class(user_data_class)` -> `AssetUserData` — Returns an instance of the provided AssetUserData class if itâs contained in the target asset.
  - `has_asset_user_data_of_class(user_data_class)` -> `bool` — Checks whether or not an instance of the provided AssetUserData class is contained.
  - `remove_meta_data_by_class(class_)` -> `None` — Remove meta-data of a particular type for this level sequence instance, if it exists

### `unreal.LevelSequenceActor`
Inherits: `Actor` | Header: `LevelSequenceActor.h`

Actor responsible for controlling a specific level sequence in the world.

**Methods** (14):
  - `add_binding(binding, actor, allow_bindings_from_asset = False)` -> `None` — Adds the specified actor to the overridden bindings for the specified binding ID, optionally still allowing the bindings...
  - `add_binding_by_tag(binding_tag, actor, allow_bindings_from_asset = False)` -> `None` — Binds an actor to all the bindings tagged with the specified name in this sequence. Does not remove any exising bindings...
  - `find_named_binding(tag)` -> `MovieSceneObjectBindingID` — Retrieve the first object binding that has been tagged with the specified name
  - `find_named_bindings(tag)` -> `Array [ MovieSceneObjectBindingID ]` — Retrieve all the bindings that have been tagged with the specified name
  - `get_sequence()` -> `LevelSequence` — Get the level sequence being played by this actor. see: SetSequence
  - `hide_burnin()` -> `None` — Hide burnin
  - `remove_binding(binding, actor)` -> `None` — Removes the specified actor from the specified bindingâs actor array
  - `remove_binding_by_tag(tag, actor)` -> `None` — Removes the specified actor from the specified bindingâs actor array
  - `reset_binding(binding)` -> `None` — Resets the specified binding back to the defaults defined by the Level Sequence asset
  - `reset_bindings()` -> `None` — Resets all overridden bindings back to the defaults defined by the Level Sequence asset
  - `set_binding(binding, actors, allow_bindings_from_asset = False)` -> `None` — Overrides the specified binding with the specified actors, optionally still allowing the bindings defined in the Level S...
  - `set_binding_by_tag(binding_tag, actors, allow_bindings_from_asset = False)` -> `None` — Assigns an set of actors to all the bindings tagged with the specified name in this sequence. Object Bindings can be tag...
  - `set_sequence(sequence)` -> `None` — Set the level sequence being played by this actor. see: GetSequence
  - `show_burnin()` -> `None` — Show burnin

**Properties** (9):
  - `binding_overrides`: `MovieSceneBindingOverrides` [Read-Only] — [Read-Only] Mapping of actors to override the sequence bindings with (MovieSceneBindingOverrides)
  - `burn_in_options`: `LevelSequenceBurnInOptions` [Read-Only] — [Read-Only] (LevelSequenceBurnInOptions)
  - `camera_settings`: `LevelSequenceCameraSettings` — [Read-Write] (LevelSequenceCameraSettings)
  - `default_instance_data`: `Object` — [Read-Write] Instance data that can be used to dynamically control sequence evaluation at runtime (O...
  - `level_sequence_asset`: `LevelSequence` [Read-Only] — [Read-Only] (LevelSequence)
  - `override_instance_data`: `bool` — [Read-Write] Enable specification of dynamic instance data to be supplied to the sequence during pla...
  - `playback_settings`: `MovieSceneSequencePlaybackSettings` [Read-Only] — [Read-Only] (MovieSceneSequencePlaybackSettings)
  - `replicate_playback`: `bool` — [Read-Write] If true, playback of this level sequence on the server will be synchronized across othe...
  - `sequence_player`: `LevelSequencePlayer` [Read-Only] — [Read-Only] (LevelSequencePlayer)

### `unreal.LevelSequenceAnimSequenceLink`
Inherits: `AssetUserData` | Header: `LevelSequenceAnimSequenceLink.h`

Link To Set of Anim Sequences that we may belinked to.

**Properties** (1):
  - `anim_sequence_links`: `None` — [Read-Write] (Array[LevelSequenceAnimSequenceLinkItem])

### `unreal.LevelSequenceBurnIn`
Inherits: `UserWidget` | Header: `LevelSequenceBurnIn.h`

Base class for level sequence burn ins

**Methods** (2):
  - `get_settings_class()` — Get the settings class to use for this burn in
  - `set_settings(settings)` -> `None` — Called when this burn in is receiving its settings

**Properties** (2):
  - `frame_information`: `LevelSequencePlayerSnapshot` [Read-Only] — [Read-Only] Snapshot of frame information. (LevelSequencePlayerSnapshot)
  - `level_sequence_actor`: `LevelSequenceActor` [Read-Only] — [Read-Only] The actor to get our burn in frames from (LevelSequenceActor)

### `unreal.LevelSequenceBurnInInitSettings`
Inherits: `Object` | Header: `LevelSequenceActor.h`

Level Sequence Burn in Init Settings

### `unreal.LevelSequenceBurnInOptions`
Inherits: `Object` | Header: `LevelSequenceActor.h`

Level Sequence Burn in Options

**Methods** (1):
  - `set_burn_in(burn_in_class)` -> `None` — Loads the specified class path and initializes an instance, then stores it in Settings.

**Properties** (3):
  - `burn_in_class`: `SoftClassPath` — [Read-Write] (SoftClassPath)
  - `settings`: `LevelSequenceBurnInInitSettings` — [Read-Write] (LevelSequenceBurnInInitSettings)
  - `use_burn_in`: `bool` — [Read-Write] (bool)

### `unreal.LevelSequenceDirector`
Inherits: `Object` | Header: `LevelSequenceDirector.h`

Level Sequence Director

**Methods** (8):
  - `get_bound_actor(object_binding)` -> `Actor` — Resolve the first valid Actor binding inside this sub-sequence that relates to the specified ID note:: ObjectBinding sho...
  - `get_bound_actors(object_binding)` -> `Array [ Actor ]` — Resolve the actor bindings inside this sub-sequence that relate to the specified ID note:: ObjectBinding should be const...
  - `get_bound_object(object_binding)` -> `Object` — Resolve the first valid binding inside this sub-sequence that relates to the specified ID note:: ObjectBinding should be...
  - `get_bound_objects(object_binding)` -> `Array [ Object ]` — Resolve the bindings inside this sub-sequence that relate to the specified ID note:: ObjectBinding should be constructed...
  - `get_current_time()` -> `QualifiedTime` — Get the current time for this directorâs sub-sequence (or the root sequence, if this is a root sequence director)
  - `get_root_sequence_time()` -> `QualifiedTime` — Get the current time for the outermost (root) sequence
  - `get_sequence()` -> `MovieSceneSequence`
  - `on_created()` -> `None` — Called when this director is created

**Properties** (1):
  - `player`: `LevelSequencePlayer` [Read-Only] — [Read-Only] Pointer to the player thatâs playing back this directorâs sequence. Only valid in ga...

### `unreal.LevelSequenceMediaController`
Inherits: `Actor` | Header: `SequenceMediaController.h`

Replicated actor class that is responsible for instigating various cinematic assets (Media, Audio, Level Sequences) in a synchronized fasion

**Methods** (4):
  - `get_media_component()` -> `MediaComponent` — Access this actorâs media component
  - `get_sequence()` -> `LevelSequenceActor` — Access this actorâs Level Sequence Actor
  - `play()` -> `None` — Play
  - `synchronize_to_server(desync_threshold_seconds = 2.000000)` -> `None` — Forcibly synchronize the sequence to the serverâs position if it has diverged by more than the specified threshold

**Properties** (3):
  - `media_component`: `MediaComponent` [Read-Only] — [Read-Only] Media component that contains the media player to synchronize with (MediaComponent)
  - `sequence`: `LevelSequenceActor` [Read-Only] — [Read-Only] Pointer to the sequence actor to use for playback (LevelSequenceActor)
  - `server_start_time_seconds`: `float` [Read-Only] — [Read-Only] Replicated time at which the server started the sequence (taken from AGameStateBase::Get...

### `unreal.LevelSequencePlayer`
Inherits: `MovieSceneSequencePlayer` | Header: `LevelSequencePlayer.h`

ULevelSequencePlayer is used to actually âplayâ an level sequence asset at runtime.

**Methods** (2):
  - `create_level_sequence_player(world_context_object, level_sequence, out_actor=LevelSequenceActor)` [classmethod] — Create a new level sequence player.
  - `get_active_camera_component()` -> `CameraComponent` — Get the active camera cut camera

**Properties** (1):
  - `on_camera_cut`: `OnLevelSequencePlayerCameraCutEvent` — [Read-Write] Event triggered when there is a camera cut (OnLevelSequencePlayerCameraCutEvent)

### `unreal.LevelSequenceShotMetaDataLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LevelSequenceShotMetaDataLibrary.h`

Manages ULevelSequence meta data that is common for rating shots in cinematic workflows. Manages access to UMovieSceneShotsMetaData for ULevelSequences.

**Methods** (21):
  - `clear_favorite_rating(level_sequence)` -> `None` [classmethod] — Clears the favorite rating.
  - `clear_is_flagged(level_sequence)` -> `None` [classmethod] — Clear IsFlagged flag.
  - `clear_is_no_good(level_sequence)` -> `None` [classmethod] — Clear the IsNoGood flag.
  - `get_favorite_rating(level_sequence)` -> `int32 or None` [classmethod] — Gets the favorite rating. The favorite rating is like a star rating, usually 1-3 if it was rated.
  - `get_favorite_rating_asset_tag()` -> `Name` [classmethod]
  - `get_favorite_rating_by_asset_data(asset_data)` -> `int32 or None` [classmethod] — Gets the favorite rating. The favorite rating is like a star rating, usually 1-3 if it was rated.
  - `get_is_flagged(level_sequence)` -> `bool or None` [classmethod] — Gets whether this was flagged by a user.
  - `get_is_flagged_asset_tag()` -> `Name` [classmethod]
  - `get_is_flagged_by_asset_data(asset_data)` -> `bool or None` [classmethod] — Gets whether this was flagged by a user.
  - `get_is_no_good(level_sequence)` -> `bool or None` [classmethod] — Gets whether the user has marked this shot as no good.
  - `get_is_no_good_asset_tag()` -> `Name` [classmethod]
  - `get_is_no_good_by_asset_data(asset_data)` -> `bool or None` [classmethod] — Gets whether the user has marked this shot as no good.
  - `has_favorite_rating(level_sequence)` -> `bool` [classmethod]
  - `has_favorite_rating_by_asset_data(asset_data)` -> `bool` [classmethod]
  - `has_is_flagged(level_sequence)` -> `bool` [classmethod]
  - `has_is_flagged_by_asset_data(asset_data)` -> `bool` [classmethod]
  - `has_is_no_good(level_sequence)` -> `bool` [classmethod]
  - `has_is_no_good_by_asset_data(asset_data)` -> `bool` [classmethod]
  - `set_favorite_rating(level_sequence, favorite_rating)` -> `None` [classmethod] — Sets the favorite rating. The favorite rating is like a star rating, usually 1-3 if it was rated.
  - `set_is_flagged(level_sequence, is_flagged)` -> `None` [classmethod] — Sets whether this was flagged by a user.
  - `set_is_no_good(level_sequence, is_no_good)` -> `None` [classmethod] — Sets whether the user has marked this shot as no good.

### `unreal.ReplicatedLevelSequenceActor`
Inherits: `LevelSequenceActor` | Header: `LevelSequenceActor.h`

A level sequence actor that is set to always be relevant for networking purposes

### `unreal.LevelSequenceActor_OnLevelSequenceLoaded`
Inherits: `DelegateBase` | Header: `LevelSequenceActor.h`

On Level Sequence Loaded Delegate Signature

### `unreal.OnLevelSequencePlayerCameraCutEvent`
Inherits: `MulticastDelegateBase` | Header: `LevelSequencePlayer.h`

On Level Sequence Player Camera Cut Event Delegate Signature
