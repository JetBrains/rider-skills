# UE Python API — DaySequence Module

**28 types** from the `DaySequence` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DaySequenceCollectionEntry`, `DaySequenceConditionSet`, `DaySequenceTime`, `BaseDaySequenceActor`, `DaySequence`, `DaySequenceActor`, `DaySequenceCameraModifier`, `DaySequenceCheatManagerExtension`, `DaySequenceCollectionAsset`, `DaySequenceConditionTag`, `DaySequenceDirector`, `DaySequenceModifierComponent`, `DaySequenceModifierVolume`, `DaySequencePlayer`, `DaySequenceStaticTimeContributor`, `DaySequenceSubsystem`, `DaySequenceTrack`, `ProceduralDaySequenceBuilder`, `SunMoonDaySequenceActor`, `DayNightCycleMode`, ... (28 total)

---

## Classes

### `unreal.DaySequenceCollectionEntry`
Inherits: `StructBase` | Header: `DaySequenceCollectionAsset.h`

Day Sequence Collection Entry

### `unreal.DaySequenceConditionSet`
Inherits: `StructBase` | Header: `DaySequenceConditionSet.h`

Day Sequence Condition Set

### `unreal.DaySequenceTime`
Inherits: `StructBase` | Header: `DaySequenceTime.h`

Day Sequence Time

### `unreal.BaseDaySequenceActor`
Inherits: `DaySequenceActor` | Header: `BaseDaySequenceActor.h`

A self-registering Day Sequence Actor with a simple set of lighting components (some of which are optional). Can be used as-is or extended by derived classes (see ASunPositionDaySequenceActor).

**Properties** (7):
  - `exponential_height_fog_component`: `ExponentialHeightFogComponent` [Read-Only] — [Read-Only] Optional Components * (ExponentialHeightFogComponent)
  - `sky_atmosphere_component`: `SkyAtmosphereComponent` [Read-Only] — [Read-Only] (SkyAtmosphereComponent)
  - `sky_light_component`: `SkyLightComponent` [Read-Only] — [Read-Only] (SkyLightComponent)
  - `sky_sphere_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] (StaticMeshComponent)
  - `sun_component`: `DirectionalLightComponent` [Read-Only] — [Read-Only] (DirectionalLightComponent)
  - `sun_root_component`: `SceneComponent` [Read-Only] — [Read-Only] Standard Components * (SceneComponent)
  - `volumetric_cloud_component`: `VolumetricCloudComponent` [Read-Only] — [Read-Only] (VolumetricCloudComponent)

### `unreal.DaySequence`
Inherits: `MovieSceneSequence` | Header: `DaySequence.h`

Day Sequence

**Methods** (3):
  - `add_asset_user_data_of_class(user_data_class)` -> `bool` — Creates and adds an instance of the provided AssetUserData class to the target asset.
  - `get_asset_user_data_of_class(user_data_class)` -> `AssetUserData` — Returns an instance of the provided AssetUserData class if itâs contained in the target asset.
  - `has_asset_user_data_of_class(user_data_class)` -> `bool` — Checks whether or not an instance of the provided AssetUserData class is contained.

### `unreal.DaySequenceActor`
Inherits: `Info` | Header: `DaySequenceActor.h`

Day Sequence Actor

**Methods** (17):
  - `contains_day_sequence(day_sequence)` -> `bool` — Returns true if the given InDaySequence is referenced by any entry in the DaySequences map property.
  - `get_apparent_time_of_day()` -> `float` — Get the current apparent time of day in hours. This is distinct from the actual time of day in that it is affected by st...
  - `get_day_length()` -> `float` — Get the length of each day in hours.
  - `get_initial_time_of_day()` -> `float` — Get the initial time of day in hours.
  - `get_play_rate()` -> `float` — Gets the play rate of the day cycle at runtime. Always 1 in editor worlds.
  - `get_static_time_of_day()` -> `float` — Get this day sequence actorâs static (fixed) time-of-day, or numeric_limits<float>::lowest() if it doesnât have one
  - `get_time_of_day()` -> `float` — Get the current time of day in hours.
  - `get_time_of_day_preview()` -> `float`
  - `get_time_per_cycle()` -> `float` — Get the duration of each day cycle in hours (assuming PlayRate is 1.0)
  - `has_static_time_of_day()` -> `bool` — Check whether this day sequence actor has a static (fixed) time-of-day
  - `is_paused()` -> `bool`
  - `is_playing()` -> `bool`
  - `pause()` -> `None` — Pause playback of the sequence.
  - `play()` -> `None` — Resume playback of the sequence.
  - `set_play_rate(new_rate)` -> `None` — Sets the play rate of the day cycle at runtime. A play rate of 2.0 will result in a day cycle that is half as long as Ti...
  - `set_time_of_day(hours)` -> `bool` — Set the current time of day in hours (server only).
  - `set_time_of_day_preview(hours)` -> `None` — Set the TimeOfDayPreview and broadcast the event.

**Properties** (7):
  - `bias`: `int` — [Read-Write] User-defined bias to apply to sequences in DaySequenceCollection. (int32)
  - `binding_overrides`: `MovieSceneBindingOverrides` [Read-Only] — [Read-Only] Mapping of actors to override the sequence bindings with (MovieSceneBindingOverrides)
  - `day_interp_curve`: `CurveFloat` — [Read-Write] User-provided interpolation curve that maps day cycle times to desired cycle times (usu...
  - `on_time_of_day_preview_changed`: `OnTimeOfDayPreviewChanged` — [Read-Write] Blueprint exposed delegate invoked when the TimeOfDayPreview property
is changed. (OnTi...
  - `replicate_playback`: `bool` — [Read-Write] If true, playback of this sequence on the server will be synchronized across other clie...
  - `run_day_cycle`: `bool` — [Read-Write] Whether or not to run a day cycle. If this is unchecked the day cycle will remain fixed...
  - `use_interp_curve`: `bool` — [Read-Write] (bool)

### `unreal.DaySequenceCameraModifier`
Inherits: `CameraModifier` | Header: `DaySequenceCameraModifier.h`

Day Sequence Camera Modifier

**Properties** (1):
  - `settings`: `PostProcessSettings` — [Read-Write] Post process settings to use for this modifier. Sequencer should handle this (blending ...

### `unreal.DaySequenceCheatManagerExtension`
Inherits: `CheatManagerExtension` | Header: `DaySequenceCheatManagerExtension.h`

Cheats related to DaySequence

### `unreal.DaySequenceCollectionAsset`
Inherits: `DataAsset` | Header: `DaySequenceCollectionAsset.h`

Day Sequence Collection Asset

### `unreal.DaySequenceConditionTag`
Inherits: `Object` | Header: `DaySequenceConditionTag.h`

Day Sequence Condition Tag

**Methods** (3):
  - `broadcast_on_condition_value_changed()` -> `None` — Derived classes should call this function to notify listeners that the underlying condition may have changed. This will ...
  - `evaluate()` -> `bool` — Evaluates a preconfigured boolean condition.
  - `setup_on_condition_value_changed()` -> `None` — Derived classes should override this function if the condition being evaluated is associated with external delegates whi...

### `unreal.DaySequenceDirector`
Inherits: `Object` | Header: `DaySequenceDirector.h`

Day Sequence Director

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
  - `player`: `DaySequencePlayer` [Read-Only] — [Read-Only] Pointer to the player thatâs playing back this directorâs sequence. Only valid in ga...

### `unreal.DaySequenceModifierComponent`
Inherits: `SceneComponent` | Header: `DaySequenceModifierComponent.h`

Day Sequence Modifier Component

**Methods** (6):
  - `bind_to_day_sequence_actor(day_sequence_actor)` -> `None` — Bind this component to the specified day sequence actor. Will not add our overrides to the sub-sequence until EnableModi...
  - `disable_component()` -> `None` — Disable this component. Will remove the sub-sequence from the root sequence if itâs set up.
  - `enable_component()` -> `None` — Enable this component.
  - `get_blend_weight()` -> `float` — Get the current blend weight.
  - `set_blend_target(actor)` -> `None` — Sets the blend target to use when in Volume mode.
  - `unbind_from_day_sequence_actor()` -> `None` — Unbind this component from its day sequence actor if valid. Will removes the sub-sequence from the root sequence if itâ...

**Properties** (20):
  - `bias`: `int` — [Read-Write] User-defined bias. (int32)
  - `blend_amount`: `float` — [Read-Write] Defines the region in which the effective blend weight is in the range (0.0, 1.0) (not ...
  - `blend_policy`: `DaySequenceModifierUserBlendPolicy` — [Read-Write] Determines how the modifier uses UserBlendWeight to compute effective blend weight. (Da...
  - `blend_time`: `float` — [Read-Write] Defines the amount of time (in seconds) that it takes for blend weight to move across t...
  - `day_night_cycle`: `DayNightCycleMode` — [Read-Write] Changes the way the modifier controls the day/night cycle time when enabled. (DayNightC...
  - `day_night_cycle_time`: `float` — [Read-Write] The time to use for the day/night cycle. (float)
  - `force_smooth_blending`: `bool` — Is always be very expensive! (bool) [Read-Write] If true, day sequence evaluation will be smooth reg...
  - `ignore_bias`: `bool` — [Read-Write] When enabled, these overrides will always override all settings regardless of their bia...
  - `is_component_enabled`: `bool` [Read-Only] — [Read-Only] Flag used track whether or not this component is enabled or disabled. (bool)
  - `is_enabled`: `bool` [Read-Only] — [Read-Only] Non-serialized variable for tracking whether our overrides are enabled or not. (bool)
  - `mode`: `DaySequenceModifierMode` — [Read-Write] Determines how the modifier computes InternalBlendWeight. (DaySequenceModifierMode)
  - `on_post_enable_modifier`: `OnPostEnableModifier` — [Read-Write] Blueprint exposed delegate invoked after the modifier component is enabled. (OnPostEnab...
  - `on_post_reinitialize_sub_sequences`: `OnPostReinitializeSubSequences` — [Read-Write] Blueprint exposed delegate invoked after the componentâs subsequences are reinitializ...
  - `preview`: `bool` — [Read-Write] When enabled, preview this day sequence modifier in the editor. (bool)
  - `smooth_blending`: `bool` — Can be very expensive. (bool) [Read-Write] If true, day sequence evaluation while within the blendin...
  - `target_actor`: `DaySequenceActor` — [Read-Write] Non-serialized target actor we are currently bound to (DaySequenceActor)
  - `transient_sequence`: `DaySequence` — [Read-Write] The user provided Transient Day Sequence. (DaySequence)
  - `user_blend_weight`: `float` — [Read-Write] User specified blend weight. The final blend weight is determined by BlendPolicy. (floa...
  - `user_day_sequence`: `DaySequence` — [Read-Write] The user provided Day Sequence. (DaySequence)
  - `volume_shape_components`: `None` — [Read-Write] When set, the shape components will be used for the modifier volume, otherwise the defa...

### `unreal.DaySequenceModifierVolume`
Inherits: `Actor` | Header: `DaySequenceModifierVolume.h`

Day Sequence Modifier Volume

**Methods** (1):
  - `on_day_sequence_actor_bound(actor)` -> `None` — On Day Sequence Actor Bound

**Properties** (2):
  - `day_sequence_modifier`: `DaySequenceModifierComponent` [Read-Only] — [Read-Only] (DaySequenceModifierComponent)
  - `default_box`: `BoxComponent` [Read-Only] — [Read-Only] (BoxComponent)

### `unreal.DaySequencePlayer`
Inherits: `Object` | Header: `DaySequencePlayer.h`

UDaySequencePlayer is used to actually âplayâ a Day sequence asset at runtime.

**Methods** (27):
  - `get_bound_objects(object_binding)` -> `Array [ Object ]` — Retrieve all objects currently bound to the specified binding identifier
  - `get_completion_mode_override()` -> `MovieSceneCompletionModeOverride` — Get the state of the completion mode override
  - `get_disable_camera_cuts()` -> `bool` — Set whether to disable camera cuts
  - `get_end_time()` -> `QualifiedTime` — Get the offset within the level sequence to finish playing
  - `get_frame_duration()` -> `int32` — Get this sequenceâs duration in frames
  - `get_frame_rate()` -> `FrameRate` — Get this sequenceâs display rate.
  - `get_object_bindings(object)` -> `Array [ MovieSceneObjectBindingID ]` — Get the object bindings for the requested object
  - `get_play_rate()` -> `float` — Get the playback rate of this player.
  - `get_sequence()` -> `MovieSceneSequence` — Access the sequence this player is playing
  - `get_sequence_name(add_client_info = False)` -> `str` — Get the name of the sequence this player is playing
  - `get_start_time()` -> `QualifiedTime` — Get the offset within the level sequence to start playing
  - `go_to_end_and_stop()` -> `None` — Go to end of the sequence and stop. Adheres to âWhen Finishedâ section rules.
  - `is_paused()` -> `bool` — Check whether the sequence is paused.
  - `is_playing()` -> `bool` — Check whether the sequence is actively playing.
  - `play()` -> `None` — Start playback forwards from the current time cursor position, using the current play rate.
  - `play_looping(num_loops = -1)` -> `None` — Start playback from the current time cursor position, looping the specified number of times.
  - `remove_weight()` -> `None` — Removes a previously assigned weight
  - `request_invalidate_binding(object_binding)` -> `None` — Invalidates the given binding, forcing it to be refetched. This may be useful for some custom bindings that wish their r...
  - `scrub()` -> `None` — Scrub playback.
  - `set_completion_mode_override(completion_mode_override)` -> `None` — Set the state of the completion mode override. Note, setting the state to force restore state will only take effect if t...
  - `set_disable_camera_cuts(disable_camera_cuts)` -> `None` — Set whether to disable camera cuts
  - `set_frame_range(start_frame, duration, sub_frames = 0.000000)` -> `None` — Set the valid play range for this sequence, determined by a starting frame number (in this sequence playerâs plaback f...
  - `set_frame_rate(frame_rate)` -> `None` — Set the frame-rate that this player should play with, making all frame numbers in the specified time-space
  - `set_play_rate(play_rate)` -> `None` — Set the playback rate of this player. Negative values will play the animation in reverse.
  - `set_weight(weight)` -> `None` — Set a manual weight to be multiplied with all blendable elements within this sequence note:: It is recommended that a we...
  - `stop()` -> `None` — Stop playback and move the cursor to the end (or start, for reversed playback) of the sequence.
  - `stop_at_current_time()` -> `None` — Stop playback without moving the cursor.

**Properties** (5):
  - `on_finished`: `OnDaySequencePlayerEvent` — [Read-Write] Event triggered when the level sequence player finishes naturally (without explicitly c...
  - `on_pause`: `OnDaySequencePlayerEvent` — [Read-Write] Event triggered when the level sequence player is paused (OnDaySequencePlayerEvent)
  - `on_play`: `OnDaySequencePlayerEvent` — [Read-Write] Event triggered when the level sequence player is played (OnDaySequencePlayerEvent)
  - `on_play_reverse`: `OnDaySequencePlayerEvent` — [Read-Write] Event triggered when the level sequence player is played in reverse (OnDaySequencePlaye...
  - `on_stop`: `OnDaySequencePlayerEvent` — [Read-Write] Event triggered when the level sequence player is stopped (OnDaySequencePlayerEvent)

### `unreal.DaySequenceStaticTimeContributor`
Inherits: `Object` | Header: `DaySequenceStaticTime.h`

A Blueprint exposed static time contributor. Used to contribute to static time blending for the specified Day Sequence Actor without needing to spawn actors and/or components.

**Methods** (2):
  - `bind_to_day_sequence_actor(target_actor, priority = 1000)` -> `None` — Begin contributing static time to the specified actor.
  - `unbind_from_day_sequence_actor()` -> `None` — Stop contributing static time.

**Properties** (3):
  - `blend_weight`: `float` — [Read-Write] The desired blend weight. Once bound to a Day Sequence Actor, this can be freely change...
  - `static_time`: `float` — [Read-Write] The desired static time. Once bound to a Day Sequence Actor, this can be freely changed...
  - `wants_static_time`: `bool` — [Read-Write] Determines whether or not this contributor is effective once we are bound. This can be ...

### `unreal.DaySequenceSubsystem`
Inherits: `WorldSubsystem` | Header: `DaySequenceSubsystem.h`

Day Sequence Subsystem

**Methods** (2):
  - `get_day_sequence_actor(find_fallback_on_null = True)` -> `DaySequenceActor` — Get Day Sequence Actor
  - `set_day_sequence_actor(actor)` -> `None` — Set Day Sequence Actor

**Properties** (1):
  - `on_day_sequence_actor_set`: `OnDaySequenceActorSet` — [Read-Write] Blueprint exposed delegate that is broadcast when the active DaySequenceActor changes. ...

### `unreal.DaySequenceTrack`
Inherits: `MovieSceneSubTrack` | Header: `DaySequenceTrack.h`

Day Sequence Track

### `unreal.ProceduralDaySequenceBuilder`
Inherits: `Object` | Header: `ProceduralDaySequenceBuilder.h`

A utility class for creating procedural Day Sequences. Before adding any keys, SetActiveBoundObject should be called and provided a Day Sequence Actor or a component owned by a Day Sequence Actor. All...

**Methods** (19):
  - `add_bool_key(property_name, key, value)` -> `None` — Add Bool Key
  - `add_bool_override(property_name, value)` -> `None` — Key Creation:
  - `add_color_material_parameter_override(parameter_name, material_index, value)` -> `None` — Add Color Material Parameter Override
  - `add_color_override(property_name, value)` -> `None` — Add Color Override
  - `add_material_override(material_index, value)` -> `None` — Add Material Override
  - `add_rotation_key(key, value, interp_mode = RichCurveInterpMode.RCIM_CUBIC)` -> `None` — Add Rotation Key
  - `add_scalar_key(property_name, key, value, interp_mode = RichCurveInterpMode.RCIM_CUBIC)` -> `None` — Add Scalar Key
  - `add_scalar_material_parameter_override(parameter_name, material_index, value)` -> `None` — Add Scalar Material Parameter Override
  - `add_scalar_override(property_name, value)` -> `None` — Add Scalar Override
  - `add_scale_key(key, value, interp_mode = RichCurveInterpMode.RCIM_CUBIC)` -> `None` — Add Scale Key
  - `add_transform_override(value)` -> `None` — Add Transform Override
  - `add_translation_key(key, value, interp_mode = RichCurveInterpMode.RCIM_CUBIC)` -> `None` — Add Translation Key
  - `add_vector_key(property_name, key, value, interp_mode = RichCurveInterpMode.RCIM_CUBIC)` -> `None` — Add Vector Key
  - `add_vector_override(property_name, value)` -> `None` — Add Vector Override
  - `add_visibility_override(value)` -> `None` — Add Visibility Override
  - `clear_keys()` -> `None` — Key Deletion:
  - `initialize(actor, initial_sequence = None, clear_initial_sequence = True)` -> `DaySequence` — Initialize the procedural sequence and set the TargetActor for this builder.
  - `is_initialized()` -> `bool` — Returns true Initialize has been called with a valid actor.
  - `set_active_bound_object(object)` -> `None` — Prepare the builder to begin adding keys animating properties on InObject.

### `unreal.SunMoonDaySequenceActor`
Inherits: `BaseDaySequenceActor` | Header: `SunMoonDaySequenceActor.h`

A Day Sequence Actor that represents a physically accurate 24 hour day cycle.

**Properties** (1):
  - `moon_component`: `DirectionalLightComponent` [Read-Only] — [Read-Only] (DirectionalLightComponent)

### `unreal.DayNightCycleMode`
Inherits: `EnumBase` | Header: `DaySequenceModifierComponent.h`

Enum specifying how to control a day / night cycle from a modifier

**Properties** (5):
  - `DEFAULT`: `DayNightCycleMode = Ellipsis` — (default) Make no changes to the day/night cycle time 0
  - `FIXED_TIME`: `DayNightCycleMode = Ellipsis` — Force the day/night cycle to be fixed at the specified constant time 1
  - `RANDOM_FIXED_TIME`: `DayNightCycleMode = Ellipsis` — Use a random, fixed time for the day/night cycle 3
  - `RANDOM_START_TIME`: `DayNightCycleMode = Ellipsis` — Start the day/night cycle at a random time, and allow it to continue from there 4
  - `START_AT_SPECIFIED_TIME`: `DayNightCycleMode = Ellipsis` — Set an initial time for the day/night cycle when the modifier is enabled 2

### `unreal.DaySequenceModifierMode`
Inherits: `EnumBase` | Header: `DaySequenceModifierComponent.h`

Enum that defines modifier behavior for auto enabling and computing the internal blend weight.

**Properties** (3):
  - `GLOBAL`: `DaySequenceModifierMode = Ellipsis` — Blend weight is always 1.0. 0
  - `TIME`: `DaySequenceModifierMode = Ellipsis` — Blend weight smoothly moves between 0.0 and 1.0 at a fixed rate according to when the blend target l...
  - `VOLUME`: `DaySequenceModifierMode = Ellipsis` — Blend weight smoothly moves between 0.0 and 1.0 according to how far the blend target is from the vo...

### `unreal.DaySequenceModifierUserBlendPolicy`
Inherits: `EnumBase` | Header: `DaySequenceModifierComponent.h`

Enum specifying how the modifier resolves the user specified blend weight against the internal blend weight.

**Properties** (4):
  - `IGNORED`: `DaySequenceModifierUserBlendPolicy = Ellipsis` — User specified weights are ignored (i.e. the effective weight is InternallyComputedWeight 0
  - `MAXIMUM`: `DaySequenceModifierUserBlendPolicy = Ellipsis` — The effective weight is FMath::Max(InternallyComputedWeight, UserSpecifiedWeight 2
  - `MINIMUM`: `DaySequenceModifierUserBlendPolicy = Ellipsis` — (default) The effective weight is FMath::Min(InternallyComputedWeight, UserSpecifiedWeight 1
  - `OVERRIDE`: `DaySequenceModifierUserBlendPolicy = Ellipsis` — The effective weight is UserSpecifiedWeight 3

### `unreal.DaySequenceStaticTimeMode`
Inherits: `EnumBase` | Header: `DaySequenceActor.h`

EDay Sequence Static Time Mode

**Properties** (2):
  - `LOCAL_TIME_WARP`: `DaySequenceStaticTimeMode = Ellipsis` — Static time will apply a time warp local to the modifierâs sequence evaluation time.
The local tim...
  - `ROOT_TIME_WARP`: `DaySequenceStaticTimeMode = Ellipsis` — Static time will apply a time warp on the RootSequence/global evaluation time. 0

### `unreal.OnDaySequenceActorSet`
Inherits: `MulticastDelegateBase` | Header: `DaySequenceSubsystem.h`

On Day Sequence Actor Set Delegate Signature

### `unreal.OnDaySequencePlayerEvent`
Inherits: `MulticastDelegateBase` | Header: `DaySequencePlayer.h`

On Day Sequence Player Event Delegate Signature

### `unreal.OnPostEnableModifier`
Inherits: `MulticastDelegateBase` | Header: `DaySequenceModifierComponent.h`

On Post Enable Modifier Delegate Signature

### `unreal.OnPostReinitializeSubSequences`
Inherits: `MulticastDelegateBase` | Header: `DaySequenceModifierComponent.h`

On Post Reinitialize Sub Sequences Delegate Signature

### `unreal.OnTimeOfDayPreviewChanged`
Inherits: `MulticastDelegateBase` | Header: `DaySequenceActor.h`

On Time Of Day Preview Changed Delegate Signature
