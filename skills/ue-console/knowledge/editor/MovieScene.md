# UE Python API — MovieScene Module

**87 types** from the `MovieScene` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ActorForWorldTransforms`, `MovieSceneBindingOverrideData`, `MovieSceneBindingProxy`, `MovieSceneBindingResolveContext`, `MovieSceneBindingResolveResult`, `MovieSceneConditionContainer`, `MovieSceneConditionContext`, `MovieSceneDynamicBinding`, `MovieSceneDynamicBindingPayloadVariable`, `MovieSceneDynamicBindingResolveParams`, `MovieSceneDynamicBindingResolveResult`, `MovieSceneEasingSettings`, `MovieSceneFrameRange`, `MovieSceneMarkedFrame`, `MovieSceneNumericVariant`, `MovieSceneObjectBindingID`, `MovieSceneSectionEvalOptions`, `MovieSceneSectionParameters`, `MovieSceneSectionTimingParametersFrames`, `MovieSceneSectionTimingParametersSeconds`, ... (87 total)

---

## Classes

### `unreal.ActorForWorldTransforms`
Inherits: `StructBase` | Header: `ActorForWorldTransforms.h`

Description of an actor selected parts we can find world transforms on

**Properties** (3):
  - `actor`: `Actor` — [Read-Write] (Actor)
  - `component`: `SceneComponent` — [Read-Write] (SceneComponent)
  - `socket_name`: `Name` — [Read-Write] (Name)

### `unreal.MovieSceneBindingOverrideData`
Inherits: `StructBase` | Header: `MovieSceneBindingOverrides.h`

Movie scene binding override data

### `unreal.MovieSceneBindingProxy`
Inherits: `StructBase` | Header: `MovieSceneBindingProxy.h`

Movie Scene Binding Proxy represents the binding ID (an FGuid) and the corresponding sequence that it relates to. This is primarily used for scripting where there is no support for FMovieSceneSequence...

**Methods** (23):
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `add_track(track_type)` -> `MovieSceneTrack` — Add a new track to the specified binding
  - `find_tracks_by_exact_type(track_type)` -> `Array [ MovieSceneTrack ]` — Find all tracks within a given binding of the specified type, not allowing sub-classed types
  - `find_tracks_by_type(track_type)` -> `Array [ MovieSceneTrack ]` — Find all tracks within a given binding of the specified type
  - `get_child_possessables()` -> `Array [ MovieSceneBindingProxy ]` — Get all the children of this binding
  - `get_display_name()` -> `Text` — Get this bindingâs name
  - `get_id()` -> `Guid` — Get this bindingâs ID
  - `get_name()` -> `str` — Get this bindingâs object non-display name
  - `get_object_template()` -> `Object` — Get this bindingâs object template
  - `get_parent()` -> `MovieSceneBindingProxy` — Get the parent of this binding
  - `get_possessed_object_class()` — Get this bindingâs possessed object class
  - `get_sorting_order()` -> `int32` — Get the sorting order for this binding
  - `get_tracks()` -> `Array [ MovieSceneTrack ]` — Get all the tracks stored within this binding
  - `is_valid()` -> `bool` — Check whether the specified binding is valid
  - `move_binding_contents(destination_binding_id)` -> `None` — Move all the contents (tracks, child bindings) of the specified binding ID onto another
  - `remove()` -> `None` — Remove the specified binding
  - `remove_track(track_to_remove)` -> `None` — Remove the specified track from this binding
  - `set_display_name(display_name)` -> `None` — Set this bindingâs name
  - `set_name(name)` -> `None` — Set this bindingâs object non-display name
  - `set_parent(parent_binding)` -> `None` — Set the parent to this binding
  - `set_sorting_order(sorting_order)` -> `None` — Set the sorting order for this binding
  - `set_spawnable_binding_id(spawnable_binding_id)` -> `None` — Set the spawnable id that the possessable binding should possess

**Properties** (2):
  - `binding_id`: `Guid` [Read-Only] — [Read-Only] (Guid)
  - `sequence`: `MovieSceneSequence` [Read-Only] — [Read-Only] (MovieSceneSequence)

### `unreal.MovieSceneBindingResolveContext`
Inherits: `StructBase` | Header: `MovieSceneCustomBinding.h`

Blueprint-specific resolution context for custom bindings.

**Properties** (2):
  - `binding`: `MovieSceneBindingProxy` — [Read-Write] Binding for the bound object currently evaluating this condition if applicable (Binding...
  - `world_context`: `Object` — [Read-Write] The world context (Object)

### `unreal.MovieSceneBindingResolveResult`
Inherits: `StructBase` | Header: `MovieSceneCustomBinding.h`

Movie Scene Binding Resolve Result

**Properties** (1):
  - `object`: `Object` — [Read-Write] The resolved object (Object)

### `unreal.MovieSceneConditionContainer`
Inherits: `StructBase` | Header: `MovieSceneCondition.h`

Container struct for instanced UMovieSceneConditions, existing only to allow property type customization for choosing conditions.

**Properties** (1):
  - `condition`: `MovieSceneCondition` — [Read-Write] (MovieSceneCondition)

### `unreal.MovieSceneConditionContext`
Inherits: `StructBase` | Header: `MovieSceneCondition.h`

Blueprint-friendly struct containing any context needed to evaluate conditions.

**Properties** (3):
  - `binding`: `MovieSceneBindingProxy` — [Read-Write] Binding for the bound object currently evaluating this condition if applicable (Binding...
  - `bound_objects`: `None` — [Read-Write] Array of objects bound to the binding currently evaluating this condition if applicable...
  - `world_context`: `Object` — [Read-Write] The world context (Object)

### `unreal.MovieSceneDynamicBinding`
Inherits: `StructBase` | Header: `MovieSceneDynamicBinding.h`

Data for a dynamic binding endpoint call.

### `unreal.MovieSceneDynamicBindingPayloadVariable`
Inherits: `StructBase` | Header: `MovieSceneDynamicBinding.h`

Value definition for any type-agnostic variable (exported as text)

### `unreal.MovieSceneDynamicBindingResolveParams`
Inherits: `StructBase` | Header: `MovieSceneDynamicBinding.h`

Optional parameter struct for dynamic binding resolver functions.

**Properties** (3):
  - `object_binding_id`: `Guid` — [Read-Write] The ID of the object binding being resolved (Guid)
  - `root_sequence`: `MovieSceneSequence` — [Read-Write] The root sequence (MovieSceneSequence)
  - `sequence`: `MovieSceneSequence` — [Read-Write] The sequence that contains the object binding being resolved (MovieSceneSequence)

### `unreal.MovieSceneDynamicBindingResolveResult`
Inherits: `StructBase` | Header: `MovieSceneDynamicBinding.h`

Movie Scene Dynamic Binding Resolve Result

**Properties** (2):
  - `is_possessed_object`: `bool` — [Read-Write] Whether the resolved object is external to the sequence This property is ignored for po...
  - `object`: `Object` — [Read-Write] The resolved object (Object)

### `unreal.MovieSceneEasingSettings`
Inherits: `StructBase` | Header: `MovieSceneSection.h`

Movie Scene Easing Settings

### `unreal.MovieSceneFrameRange`
Inherits: `StructBase` | Header: `MovieSceneFrameMigration.h`

Type used to convert from a FFloatRange to a TRange<FFrameNumber>

### `unreal.MovieSceneMarkedFrame`
Inherits: `StructBase` | Header: `MovieSceneMarkedFrame.h`

Movie Scene Marked Frame

**Properties** (4):
  - `frame_number`: `FrameNumber` — [Read-Write] (FrameNumber)
  - `is_determinism_fence`: `bool` — [Read-Write] When checked, treat this mark as a fence for evaluation purposes. Fences cannot be cros...
  - `is_inclusive_time`: `bool` — when true, the range will be dissected as (X, Y] -> (Y, Z], when false it will be (X, Y) -> [Y, Z]. ...
  - `label`: `str` — [Read-Write] (str)

### `unreal.MovieSceneNumericVariant`
Inherits: `StructBase` | Header: `MovieSceneNumericVariant.h`

A variant type that masquerades as a numeric (double) value.

### `unreal.MovieSceneObjectBindingID`
Inherits: `StructBase` | Header: `MovieSceneObjectBindingID.h`

Persistent identifier to a specific object binding within a sequence hierarchy.

### `unreal.MovieSceneSectionEvalOptions`
Inherits: `StructBase` | Header: `MovieSceneSection.h`

Movie Scene Section Eval Options

### `unreal.MovieSceneSectionParameters`
Inherits: `StructBase` | Header: `MovieSceneSectionParameters.h`

namespace UE::MovieScene

**Properties** (7):
  - `can_loop`: `bool` — [Read-Write] Whether this section supports looping the sub-sequence. (bool)
  - `end_frame_offset`: `FrameNumber` — [Read-Write] Number of frames (in display rate) to skip at the beginning of the sub-sequence. (Frame...
  - `first_loop_start_frame_offset`: `FrameNumber` — [Read-Write] Number of frames (in display rate) to offset the first loop of the sub-sequence. (Frame...
  - `flags`: `MovieSceneSubSectionFlags` — [Read-Write] Sub-section flags defining how to deal with this sub-sequence (MovieSceneSubSectionFlag...
  - `hierarchical_bias`: `int` — [Read-Write] Hierachical bias. Higher bias will take precedence. (int32)
  - `start_frame_offset`: `FrameNumber` — [Read-Write] Number of frames (in display rate) to skip at the beginning of the sub-sequence. (Frame...
  - `time_scale`: `MovieSceneTimeWarpVariant` — [Read-Write] Playback time scaling factor. (MovieSceneTimeWarpVariant)

### `unreal.MovieSceneSectionTimingParametersFrames`
Inherits: `StructBase` | Header: `MovieSceneSectionTimingParameters.h`

Parameter utility that converts section timing parameters to a transform using inner frame values.

**Properties** (7):
  - `clamp`: `bool` — [Read-Write] When true, apply clamping to the inner range. Mutually exclusive with bLoop. (bool)
  - `first_loop_start_offset`: `FrameNumber` — [Read-Write] Start offset to apply only to the first loop (FrameNumber)
  - `inner_end_offset`: `FrameNumber` — [Read-Write] End offset (in inner framerate frames) to apply to all loops ie, loop_range=[0 + InnerS...
  - `inner_start_offset`: `FrameNumber` — [Read-Write] Start offset (in inner framerate frames) to apply to all loops (FrameNumber)
  - `loop`: `bool` — [Read-Write] When true, apply looping to the inner range. Mutually exclusive with bClamp. (bool)
  - `play_rate`: `MovieSceneTimeWarpVariant` — [Read-Write] Playrate optionally implemented as time-warp (MovieSceneTimeWarpVariant)
  - `reverse`: `bool` — [Read-Write] When true, reverses the play direction. Applied after all other transformations (bool)

### `unreal.MovieSceneSectionTimingParametersSeconds`
Inherits: `StructBase` | Header: `MovieSceneSectionTimingParameters.h`

Parameter utility that converts section timing parameters to a transform using Seconds values.

**Properties** (7):
  - `clamp`: `bool` — [Read-Write] When true, apply clamping to the inner range. Mutually exclusive with bLoop. (bool)
  - `first_loop_start_offset`: `float` — [Read-Write] Start offset to apply only to the first loop (float)
  - `inner_end_offset`: `float` — [Read-Write] End offset (in seconds) to apply to all loops ie, loop_range=[0 + InnerStartOffset, End...
  - `inner_start_offset`: `float` — [Read-Write] Start offset (in seconds) to apply to all loops (float)
  - `loop`: `bool` — [Read-Write] When true, apply looping to the inner range. Mutually exclusive with bClamp. (bool)
  - `play_rate`: `MovieSceneTimeWarpVariant` — [Read-Write] Playrate optionally implemented as time-warp (MovieSceneTimeWarpVariant)
  - `reverse`: `bool` — [Read-Write] When true, reverses the play direction. Applied after all other transformations (bool)

### `unreal.MovieSceneSequenceLoopCount`
Inherits: `StructBase` | Header: `MovieSceneSequencePlaybackSettings.h`

POD struct that represents a number of loops where -1 signifies infinite looping, 0 means no loops, etc Defined as a struct rather than an int so a property type customization can be bound to it

**Properties** (1):
  - `value`: `int` — [Read-Write] Whether or not to loop playback. If Loop Exactly is chosen, you can specify the number ...

### `unreal.MovieSceneSequencePlaybackParams`
Inherits: `StructBase` | Header: `MovieSceneSequencePlayer.h`

Movie Scene Sequence Playback Params

**Properties** (7):
  - `frame`: `FrameTime` — [Read-Write] (FrameTime)
  - `has_jumped`: `bool` — [Read-Write] (bool)
  - `marked_frame`: `str` — [Read-Write] (str)
  - `position_type`: `MovieScenePositionType` — [Read-Write] (MovieScenePositionType)
  - `time`: `float` — [Read-Write] (float)
  - `timecode`: `Timecode` — [Read-Write] (Timecode)
  - `update_method`: `UpdatePositionMethod` — [Read-Write] (UpdatePositionMethod)

### `unreal.MovieSceneSequencePlaybackSettings`
Inherits: `StructBase` | Header: `MovieSceneSequencePlaybackSettings.h`

Settings for the level sequence player actor.

**Properties** (14):
  - `auto_play`: `bool` — [Read-Write] Auto-play the sequence when created (bool)
  - `disable_camera_cuts`: `bool` — [Read-Write] Disable camera cuts (bool)
  - `disable_look_at_input`: `bool` — [Read-Write] Disable LookAt Input from player during play (bool)
  - `disable_movement_input`: `bool` — [Read-Write] Disable Input from player during play (bool)
  - `finish_completion_state_override`: `MovieSceneCompletionModeOverride` — [Read-Write] If set to something other than none, when a sequence ends, the completion mode of any t...
  - `hide_hud`: `bool` — [Read-Write] Hide HUD during play (bool)
  - `hide_player`: `bool` — [Read-Write] Hide Player Pawn during play (bool)
  - `loop_count`: `MovieSceneSequenceLoopCount` — [Read-Write] Number of times to loop playback. -1 for infinite, else the number of times to loop bef...
  - `pause_at_end`: `bool` — [Read-Write] Pause the sequence when playback reaches the end rather than stopping it (bool)
  - `play_rate`: `float` — [Read-Write] The rate at which to playback the animation (float)
  - `random_start_time`: `bool` — [Read-Write] Start playback at a random time (bool)
  - `restore_state`: `bool` — [Read-Write] Flag used to specify whether actor states should be restored on stop.
This has been dep...
  - `start_time`: `float` — [Read-Write] Start playback at the specified offset from the start of the sequenceâs playback rang...
  - `tick_interval`: `MovieSceneSequenceTickInterval` — [Read-Write] Overridable tick interval for this sequence to update at. When not overridden, the owni...

### `unreal.MovieSceneSequencePlayToParams`
Inherits: `StructBase` | Header: `MovieSceneSequencePlayer.h`

Movie Scene Sequence Play to Params

**Properties** (1):
  - `exclusive`: `bool` — [Read-Write] Should the PlayTo time be considered exclusive? Defaults to true as end frames in Seque...

### `unreal.MovieSceneSequenceTickInterval`
Inherits: `StructBase` | Header: `MovieSceneSequenceTickInterval.h`

Structure defining a concrete tick interval for a Sequencer based evaluation

**Properties** (4):
  - `allow_rounding`: `bool` — [Read-Write] When true, allow the sequence to be grouped with other sequences based on Sequencer.Tic...
  - `evaluation_budget_microseconds`: `float` — [Read-Write] Defines an approximate budget for evaluation of this sequence (and any other sequences ...
  - `tick_interval_seconds`: `float` — [Read-Write] Defines the rate at which the sequence should update, in seconds (float)
  - `tick_when_paused`: `bool` — [Read-Write] When true, the sequence will continue to tick and progress even when the world is pause...

### `unreal.MovieSceneTimecodeSource`
Inherits: `StructBase` | Header: `MovieSceneSection.h`

Movie Scene Timecode Source

**Properties** (1):
  - `timecode`: `Timecode` [Read-Only] — [Read-Only] The global timecode at which this target is based (ie. the timecode at the beginning of ...

### `unreal.MovieSceneTimeWarpVariant`
Inherits: `StructBase` | Header: `MovieSceneTimeWarpVariant.h`

Numeric variant type that represents a âtime-warpâ operation transforming a time into another time.

**Methods** (2):
  - `set_fixed_play_rate(fixed_play_rate)` -> `None` — Assign a constant playrate to this timewarp, overwriting any existing timewarp implementation.
  - `to_fixed_play_rate()` -> `double` — Retrieve this timewarpâs constant play rate. Will throw an error if the timewarp is not a constant play rate.

### `unreal.MovieSceneTrackDisplayOptions`
Inherits: `StructBase` | Header: `MovieSceneTrack.h`

Generic display options for any track

### `unreal.MovieSceneTrackEvalOptions`
Inherits: `StructBase` | Header: `MovieSceneTrack.h`

Generic evaluation options for any track

### `unreal.OptionalMovieSceneBlendType`
Inherits: `StructBase` | Header: `MovieSceneBlendType.h`

Optional blend type structure

**Properties** (2):
  - `blend_type`: `MovieSceneBlendType` [Read-Only] — [Read-Only] The actual blend type (MovieSceneBlendType)
  - `is_valid`: `bool` [Read-Only] — [Read-Only] Boolean indicating whether BlendType is valid (bool)

### `unreal.TestMovieSceneStruct`
Inherits: `StructBase` | Header: `MovieSceneTestObjects.h`

Test Movie Scene Struct

**Properties** (3):
  - `first`: `float` — [Read-Write] (float)
  - `second`: `float` — [Read-Write] (float)
  - `vector`: `Vector` — [Read-Write] (Vector)

### `unreal.BuiltInDynamicBindingResolverLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneDynamicBinding.h`

Default dynamic binding resolver library, with several basic resolver functions.

**Methods** (1):
  - `resolve_to_player_pawn(world_context_object, player_controller_index = 0)` -> `MovieSceneDynamicBindingResolveResult` [classmethod] — Resolve the bound object to the playerâs pawn

### `unreal.MovieScene`
Inherits: `MovieSceneDecorationContainerObject` | Header: `MovieScene.h`

Implements a movie scene asset.

**Properties** (2):
  - `mute_nodes`: `None` — [Read-Write] Nodes currently marked Mute, stored as node tree paths
deprecated: Mute nodes are now s...
  - `solo_nodes`: `None` — [Read-Write] Nodes currently marked Solo, stored as node tree paths
deprecated: Solo nodes are now s...

### `unreal.MovieSceneBindingEventReceiverInterface`
Inherits: `Interface` | Header: `MovieSceneBindingEventReceiverInterface.h`

Movie Scene Binding Event Receiver Interface

**Methods** (2):
  - `on_object_bound_by_sequencer(player, binding_id)` -> `None` — On Object Bound by Sequencer
  - `on_object_unbound_by_sequencer(player, binding_id)` -> `None` — On Object Unbound by Sequencer

### `unreal.MovieSceneBindingLifetimeSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneBindingLifetimeSection.h`

Binding lifetime section that will connect an object binding while active, and disconnect it afterwards.

### `unreal.MovieSceneBindingLifetimeTrack`
Inherits: `MovieSceneTrack` | Header: `MovieSceneBindingLifetimeTrack.h`

Handles when an object binding should be activated/deactivated

### `unreal.MovieSceneBindingOverrides`
Inherits: `Object` | Header: `MovieSceneBindingOverrides.h`

A one-to-many definition of movie scene object binding IDs to overridden objects that should be bound to that binding.

### `unreal.MovieSceneBoolSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneBoolSection.h`

A single bool section.

### `unreal.MovieSceneBoundObjectProxy`
Inherits: `Interface` | Header: `IMovieSceneBoundObjectProxy.h`

Movie Scene Bound Object Proxy

**Methods** (1):
  - `bp_get_bound_object_for_sequencer(resolved_object)` -> `Object` — Retrieve the bound object that this interface wants to animate. Could be âthisâ or a transient child object.

### `unreal.MovieSceneBuiltInEasingFunction`
Inherits: `Object` | Header: `MovieSceneEasingCurves.h`

Movie Scene Built in Easing Function

**Methods** (1):
  - `on_evaluate(interp)` -> `float` — Evaluate the easing with an interpolation value between 0 and 1

### `unreal.MovieSceneCondition`
Inherits: `MovieSceneSignedObject` | Header: `MovieSceneCondition.h`

Abstract condition class. Conditions can be applied to sections, tracks, and track rows to determine whether or not they are evaluated at runtime. This allows developers to create Sequences with dynam...

**Methods** (3):
  - `bp_evaluate_condition(condition_context)` -> `bool` — Override to implement your condition.
  - `bp_get_check_frequency()` -> `MovieSceneConditionCheckFrequency` — Returns the check frequency of the condition, which determines whether the condition result can change during playback a...
  - `bp_get_scope()` -> `MovieSceneConditionScope` — Returns the scope of the condition, which determines whether the condition needs to be re-evaluated for different bindin...

**Properties** (2):
  - `editor_force_true`: `bool` — [Read-Write] If true, will skip evaluating the condition and always return true. Useful for authorin...
  - `invert`: `bool` — [Read-Write] If true, inverts the result of the condition check. (bool)

### `unreal.MovieSceneCustomBinding`
Inherits: `Object` | Header: `MovieSceneCustomBinding.h`

A custom binding. Allows users to define their own binding resolution types, including dynamic âReplaceableâ bindings with previews in editor, as well as Spawnable types.

**Methods** (2):
  - `get_base_custom_priority()` -> `int32` [classmethod] — Get Base Custom Priority
  - `get_base_engine_priority()` -> `int32` [classmethod] — Get Base Engine Priority

### `unreal.MovieSceneDecorationContainerObject`
Inherits: `MovieSceneSignedObject` | Header: `MovieSceneDecorationContainer.h`

Movie Scene Decoration Container Object

### `unreal.MovieSceneEasingFunction`
Inherits: `Interface` | Header: `MovieSceneEasingFunction.h`

Movie Scene Easing Function

**Methods** (1):
  - `on_evaluate(interp)` -> `float` — Evaluate the easing with an interpolation value between 0 and 1

### `unreal.MovieSceneFolder`
Inherits: `Object` | Header: `MovieSceneFolder.h`

Represents a folder used for organizing objects in tracks in a movie scene.

**Methods** (13):
  - `add_child_folder(folder_to_add)` -> `bool` — Add a child folder to the target folder
  - `add_child_object_binding(object_binding)` -> `bool` — Add a guid for an object binding to this folder
  - `add_child_track(track)` -> `bool` — Add a track to this folder
  - `get_child_folders()` -> `Array [ MovieSceneFolder ]` — Get the child folders of a given folder
  - `get_child_object_bindings()` -> `Array [ MovieSceneBindingProxy ]` — Get the object bindings contained by this folder
  - `get_child_tracks()` -> `Array [ MovieSceneTrack ]` — Get the tracks contained by this folder
  - `get_folder_color()` -> `Color` — Get the display color of the given folder
  - `get_folder_name()` -> `Name` — Get the given folderâs display name
  - `remove_child_folder(folder_to_remove)` -> `bool` — Remove a child folder from the given folder
  - `remove_child_object_binding(object_binding)` -> `bool` — Remove an object binding from the given folder
  - `remove_child_track(track)` -> `bool` — Remove a track from the given folder
  - `set_folder_color(folder_color)` -> `bool` — Set the display color of the given folder
  - `set_folder_name(folder_name)` -> `bool` — Set the name of the given folder

### `unreal.MovieSceneGroupCondition`
Inherits: `MovieSceneCondition` | Header: `MovieSceneGroupCondition.h`

Condition class that allows the grouping of other conditions using âandâ, âorâ, or âxorâ.

**Properties** (2):
  - `operator`: `MovieSceneGroupConditionOperator` — [Read-Write] Which operator to use in evaluating the group condition (MovieSceneGroupConditionOperat...
  - `sub_conditions`: `None` — [Read-Write] List of sub-conditions to evaluate as part of this condition. Condition results will be...

### `unreal.MovieSceneHookSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneHookSection.h`

Movie Scene Hook Section

### `unreal.MovieSceneMetaData`
Inherits: `Object` | Header: `MovieSceneMetaData.h`

Movie scene meta-data that is stored on UMovieScene assets Meta-data is retrieved through ULevelSequence::FindMetaData<ULevelSequenceMetaData>()

**Methods** (6):
  - `get_author()` -> `str`
  - `get_created()` -> `DateTime`
  - `get_notes()` -> `str`
  - `set_author(author)` -> `None` — Set this metadataâs author
  - `set_created(created)` -> `None` — Set this metadataâs created date
  - `set_notes(notes)` -> `None` — Set this metadataâs notes

### `unreal.MovieSceneNameableTrack`
Inherits: `MovieSceneTrack` | Header: `MovieSceneNameableTrack.h`

Base class for movie scene tracks that can be renamed by the user.

### `unreal.MovieSceneReplaceableBindingBase`
Inherits: `MovieSceneCustomBinding` | Header: `MovieSceneReplaceableBinding.h`

The base class for custom replaceable bindings. A replaceable binding uses an internal custom spawnable at editor time to produce a preview object, while in editor will use some other mechanism to dyn...

**Properties** (1):
  - `preview_spawnable`: `MovieSceneSpawnableBindingBase` [Read-Only] — [Read-Only] Optional Editor-only preview object (MovieSceneSpawnableBindingBase)

### `unreal.MovieSceneSection`
Inherits: `MovieSceneDecorationContainerObject` | Header: `MovieSceneSection.h`

Base class for movie scene sections

**Methods** (41):
  - `get_all_channels()` -> `Array [ MovieSceneScriptingChannel ]` — Find all channels that belong to the specified UMovieSceneSection. Some sections have many channels (such as Transforms ...
  - `get_auto_size_end_frame()` -> `int32` — Get end frame of the AutoSize. Will throw an exception if section has no end frame, use GetAutoSizeHasEndFrame to check ...
  - `get_auto_size_end_frame_seconds()` -> `float` — Get end time of the AutoSize seconds. Will throw an exception if section has no end frame, use GetAutoSizeHasEndFrame to...
  - `get_auto_size_has_end_frame()` -> `bool` — Checks to see if this section has an AutoSize implementation, and if so, if that implementation has a end frame.
  - `get_auto_size_has_start_frame()` -> `bool` — Checks to see if this section has an AutoSize implementation, and if so, if that implementation has a start frame.
  - `get_auto_size_start_frame()` -> `int32` — Get start frame of the AutoSize. Will throw an exception if section has no start frame, use GetAutoSizeHasStartFrame to ...
  - `get_auto_size_start_frame_seconds()` -> `float` — Get start time of the AutoSize in seconds. Will throw an exception if section has no start frame, use GetAutoSizeHasStar...
  - `get_blend_type()` -> `OptionalMovieSceneBlendType` — Gets this sectionâs blend type
  - `get_channel(channel_name)` -> `MovieSceneScriptingChannel` — Get channel from specified section and channel name
  - `get_channels_by_type(channel_type)` -> `Array [ MovieSceneScriptingChannel ]` — Find all channels that belong to the specified UMovieSceneSection that match the specific type. This will filter out any...
  - `get_color_tint()` -> `Color` — Get this sectionâs color tint.
  - `get_completion_mode()` -> `MovieSceneCompletionMode` — Gets this sectionâs completion mode
  - `get_end_frame()` -> `int32` — Get end frame. Will throw an exception if section has no end frame, use HasEndFrame to check first.
  - `get_end_frame_seconds()` -> `float` — Get end time in seconds. Will throw an exception if section has no end frame, use HasEndFrame to check first.
  - `get_overlap_priority()` -> `int32` — Gets this sectionâs priority over overlapping sections (higher wins)
  - `get_post_roll_frames()` -> `int32` — Get Post Roll Frames
  - `get_pre_roll_frames()` -> `int32` — Get Pre Roll Frames
  - `get_row_index()` -> `int32` — Gets the row index for this section
  - `get_start_frame()` -> `int32` — Get start frame. Will throw an exception if section has no start frame, use HasStartFrame to check first.
  - `get_start_frame_seconds()` -> `float` — Get start time in seconds. Will throw an exception if section has no start frame, use HasStartFrame to check first.
  - `has_end_frame()` -> `bool` — Has end frame
  - `has_start_frame()` -> `bool` — Has start frame
  - `is_active()` -> `bool` — Is Active
  - `is_locked()` -> `bool` — Is Locked
  - `set_blend_type(blend_type)` -> `None` — Sets this sectionâs blend type
  - `set_color_tint(color_tint)` -> `None` — Set this sectionâs color tint.
  - `set_completion_mode(completion_mode)` -> `None`
  - `set_end_frame(end_frame)` -> `None` — Set end frame
  - `set_end_frame_bounded(is_bounded)` -> `None` — Set end frame bounded
  - `set_end_frame_seconds(end_time)` -> `None` — Set end time in seconds
  - `set_is_active(is_active)` -> `None` — Whether or not this section is active.
  - `set_is_locked(is_locked)` -> `None` — Whether or not this section is locked.
  - `set_overlap_priority(new_priority)` -> `None` — Sets this sectionâs priority over overlapping sections (higher wins)
  - `set_post_roll_frames(post_roll_frames)` -> `None` — Gets/sets the number of frames to continue âpostrollingâ this section for after evaluation has ended.
  - `set_pre_roll_frames(pre_roll_frames)` -> `None` — Gets the number of frames to prepare this section for evaluation before it actually starts.
  - `set_range(start_frame, end_frame)` -> `None` — Set range
  - `set_range_seconds(start_time, end_time)` -> `None` — Set range in seconds
  - `set_row_index(new_row_index)` -> `None` — Sets this sectionâs new row index
  - `set_start_frame(start_frame)` -> `None` — Set start frame
  - `set_start_frame_bounded(is_bounded)` -> `None` — Set start frame bounded
  - `set_start_frame_seconds(start_time)` -> `None` — Set start time in seconds

### `unreal.MovieSceneSequence`
Inherits: `MovieSceneSignedObject` | Header: `MovieSceneSequence.h`

Abstract base class for movie scene animations (C++ version).

**Methods** (72):
  - `add_marked_frame(marked_frame)` -> `int32` — Add Marked Frame deprecated: AddMarkedFrame is deprecated. Please use AddMarkedFrame that takes a time unit instead
  - `add_marked_frame_to_sequence(marked_frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `int32` — InMarkedFrame: The given user marked frame to add *
  - `add_possessable(object_to_possess)` -> `MovieSceneBindingProxy` — Add a new binding to this sequence that will possess the specified object
  - `add_root_folder_to_sequence(new_folder_name)` -> `MovieSceneFolder` — Add a root folder to the given sequence
  - `add_spawnable_from_class(class_to_spawn)` -> `MovieSceneBindingProxy` — Add Spawnable from Class deprecated: AddSpawnableFromClass is deprecated. Please use AddSpawnableFromClass in the Level ...
  - `add_spawnable_from_instance(object_to_spawn)` -> `MovieSceneBindingProxy` — Add Spawnable from Instance deprecated: AddSpawnableFromInstance is deprecated. Please use AddSpawnableFromInstance in t...
  - `add_track(track_type)` -> `MovieSceneTrack` — Add a new track of the specified type
  - `are_marked_frames_locked()` -> `bool`
  - `delete_marked_frame(delete_index)` -> `None` — DeleteIndex: The index to the user marked frame to delete
  - `delete_marked_frames()` -> `None`
  - `find_binding_by_id(binding_id)` -> `MovieSceneBindingProxy` — Attempt to locate a binding in this sequence by its Id
  - `find_binding_by_name(name)` -> `MovieSceneBindingProxy` — Attempt to locate a binding in this sequence by its name
  - `find_binding_by_tag(binding_name)` -> `MovieSceneObjectBindingID` — Find the first object binding ID associated with the specified tag name (set up through RMB->Expose on Object bindings f...
  - `find_bindings_by_tag(binding_name)` -> `Array [ MovieSceneObjectBindingID ]` — Find all object binding IDs associated with the specified tag name (set up through RMB->Expose on Object bindings from w...
  - `find_marked_frame_by_frame_number(frame_number)` -> `int32` — Find Marked Frame by Frame Number deprecated: FindMarkedFrameByFrameNumber is deprecated. Please use FindMarkedFrameByFr...
  - `find_marked_frame_by_frame_number_in_sequence(frame_number, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `int32` — InFrameNumber: The frame number of the user marked frame to find
  - `find_marked_frame_by_label(label)` -> `int32` — InLabel: The label to the user marked frame to find
  - `find_next_marked_frame(frame_number, forward)` -> `int32` — Find Next Marked Frame deprecated: FindNextMarkedFrame is deprecated. Please use FindNextMarkedFrame that takes a time u...
  - `find_next_marked_frame_in_sequence(frame_number, forward, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `int32` — InFrameNumber: The frame number to find the next/previous user marked frame from * bForward: Find forward from the given...
  - `find_tracks_by_exact_type(track_type)` -> `Array [ MovieSceneTrack ]` — Find all tracks of the specified type, not allowing sub-classed types
  - `find_tracks_by_type(track_type)` -> `Array [ MovieSceneTrack ]` — Find all tracks of the specified type
  - `get_binding_id(binding)` -> `MovieSceneObjectBindingID` — Get the binding ID for a binding within a sequence. note:: The resulting binding is only valid when applied to propertie...
  - `get_bindings()` -> `Array [ MovieSceneBindingProxy ]` — Get all the bindings in this sequence
  - `get_clock_source()` -> `UpdateClockSource` — Get the clock source for this sequence
  - `get_display_rate()` -> `FrameRate` — Gets this sequenceâs display rate
  - `get_earliest_timecode_source()` -> `MovieSceneTimecodeSource` — Get the earliest timecode source out of all of the movie scene sections contained within this sequenceâs movie scene.
  - `get_evaluation_type()` -> `MovieSceneEvaluationType` — Get the evaluation type for this sequence
  - `get_marked_frames()` -> `Array [ MovieSceneMarkedFrame ]` — Get Marked Frames deprecated: GetMarkedFrames is deprecated. Please use GetMarkedFrames that takes a time unit instead
  - `get_marked_frames_from_sequence(time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ MovieSceneMarkedFrame ]`
  - `get_movie_scene()` -> `MovieScene` — Get this sequenceâs movie scene data
  - `get_playback_end()` -> `int32` — Get playback end of this sequence in display rate resolution
  - `get_playback_end_seconds()` -> `float` — Get playback end of this sequence in seconds
  - `get_playback_range()` -> `SequencerScriptingRange` — Get playback range of this sequence in display rate resolution
  - `get_playback_start()` -> `int32` — Get playback start of this sequence in display rate resolution
  - `get_playback_start_seconds()` -> `float` — Get playback start of this sequence in seconds
  - `get_portable_binding_id(destination_sequence, binding)` -> `MovieSceneObjectBindingID` — Get a portable binding ID for a binding that resides in a different sequence to the one where this binding will be resol...
  - `get_possessables()` -> `Array [ MovieSceneBindingProxy ]` — Get all the possessables in this sequence. It is understood for the purpose of this function that this means the binding...
  - `get_root_folders_in_sequence()` -> `Array [ MovieSceneFolder ]` — Get the root folders in the provided sequence
  - `get_spawnables()` -> `Array [ MovieSceneBindingProxy ]` — Get all the spawnables in this sequence. For Level Sequences, this includes bindings with binding type UMovieSceneSpawna...
  - `get_tick_resolution()` -> `FrameRate` — Gets this sequenceâs tick resolution
  - `get_tracks()` -> `Array [ MovieSceneTrack ]` — Get all tracks
  - `get_view_range_end()` -> `double` — Get the sequence view range end in seconds
  - `get_view_range_start()` -> `double` — Get the sequence view range start in seconds
  - `get_work_range_end()` -> `double` — Get the sequence work range end in seconds
  - `get_work_range_start()` -> `double` — Get the sequence work range start in seconds
  - `is_playback_range_locked()` -> `bool`
  - `is_read_only()` -> `bool`
  - `locate_bound_objects(binding, context)` -> `Array [ Object ]` — Locate all the objects that correspond to the specified object ID, using the specified context
  - `make_range(start_frame, duration)` -> `SequencerScriptingRange` — Make a new range for this sequence in its display rate
  - `make_range_seconds(start_time, duration)` -> `SequencerScriptingRange` — Make a new range for this sequence in seconds
  - `remove_root_folder_from_sequence(folder)` -> `None` — Remove a root folder from the given sequence. Will throw an exception if the specified folder is not valid or not a root...
  - `remove_track(track)` -> `bool` — Removes a track
  - `resolve_binding_id(object_binding_id)` -> `MovieSceneBindingProxy` — Make a binding for the given binding ID
  - `set_clock_source(clock_source)` -> `None` — Set the clock source for this sequence
  - `set_display_rate(display_rate)` -> `None` — Sets this sequenceâs display rate
  - `set_evaluation_type(evaluation_type)` -> `None` — Set the evaluation type for this sequence
  - `set_marked_frame(mark_index, frame_number)` -> `None` — Set Marked Frame deprecated: SetMarkedFrame is deprecated. Please use SetMarkedFrame that takes a time unit instead
  - `set_marked_frame_in_sequence(mark_index, frame_number, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` — InMarkIndex: The given user marked frame index to edit * InFrameNumber: The frame number to set
  - `set_marked_frames_locked(locked)` -> `None` — bInLocked: Whether the movie scene marked frames should be locked
  - `set_playback_end(end_frame)` -> `None` — Set playback end of this sequence
  - `set_playback_end_seconds(end_time)` -> `None` — Set playback end of this sequence in seconds
  - `set_playback_range_locked(locked)` -> `None` — bInLocked: Whether the movie scene playback range should be locked
  - `set_playback_start(start_frame)` -> `None` — Set playback start of this sequence
  - `set_playback_start_seconds(start_time)` -> `None` — Set playback start of this sequence in seconds
  - `set_read_only(read_only)` -> `None` — bInReadOnly: Whether the movie scene should be read only or not
  - `set_tick_resolution(tick_resolution)` -> `None` — Sets this sequenceâs tick resolution and migrates frame times
  - `set_tick_resolution_directly(tick_resolution)` -> `None` — Sets this sequenceâs tick resolution directly without migrating frame times
  - `set_view_range_end(end_time_in_seconds)` -> `None` — Set the sequence view range end in seconds
  - `set_view_range_start(start_time_in_seconds)` -> `None` — Set the sequence view range start in seconds
  - `set_work_range_end(end_time_in_seconds)` -> `None` — Set the sequence work range end in seconds
  - `set_work_range_start(start_time_in_seconds)` -> `None` — Set the sequence work range start in seconds
  - `sort_marked_frames()` -> `None`

### `unreal.MovieSceneSequencePlayer`
Inherits: `Object` | Header: `MovieSceneSequencePlayer.h`

Abstract class that provides consistent player behaviour for various animation players

**Methods** (39):
  - `change_playback_direction()` -> `None` — Changes the direction of playback (go in reverse if it was going forward, or vice versa)
  - `get_bound_objects(object_binding)` -> `Array [ Object ]` — Retrieve all objects currently bound to the specified binding identifier
  - `get_completion_mode_override()` -> `MovieSceneCompletionModeOverride` — Get the state of the completion mode override
  - `get_current_time()` -> `QualifiedTime` — Get the current playback position
  - `get_disable_camera_cuts()` -> `bool` — Set whether to disable camera cuts
  - `get_duration()` -> `QualifiedTime` — Get the total duration of the sequence
  - `get_end_time()` -> `QualifiedTime` — Get the offset within the level sequence to finish playing
  - `get_frame_duration()` -> `int32` — Get this sequenceâs duration in frames
  - `get_frame_rate()` -> `FrameRate` — Get this sequenceâs display rate.
  - `get_hide_hud()` -> `bool` — Get if the hud is hidden during play.
  - `get_object_bindings(object)` -> `Array [ MovieSceneObjectBindingID ]` — Get the object bindings for the requested object
  - `get_play_rate()` -> `float` — Get the playback rate of this player.
  - `get_sequence()` -> `MovieSceneSequence` — Access the sequence this player is playing
  - `get_sequence_name(add_client_info = False)` -> `str` — Get the name of the sequence this player is playing
  - `get_start_time()` -> `QualifiedTime` — Get the offset within the level sequence to start playing
  - `go_to_end_and_stop()` -> `None` — Go to end of the sequence and stop. Adheres to âWhen Finishedâ section rules.
  - `is_paused()` -> `bool` — Check whether the sequence is paused.
  - `is_playing()` -> `bool` — Check whether the sequence is actively playing.
  - `is_reversed()` -> `bool` — Check whether playback is reversed.
  - `pause()` -> `None` — Pause playback.
  - `play()` -> `None` — Start playback forwards from the current time cursor position, using the current play rate.
  - `play_looping(num_loops = -1)` -> `None` — Start playback from the current time cursor position, looping the specified number of times.
  - `play_reverse()` -> `None` — Reverse playback.
  - `play_to(playback_params, play_to_params)` -> `None` — Play from the current position to the requested position and pause. If requested position is before the current position...
  - `remove_weight()` -> `None` — Removes a previously assigned weight
  - `request_invalidate_binding(object_binding)` -> `None` — Invalidates the given binding, forcing it to be refetched. This may be useful for some custom bindings that wish their r...
  - `restore_state()` -> `None` — Restore any changes made by this player to their original state
  - `scrub()` -> `None` — Scrub playback.
  - `set_completion_mode_override(completion_mode_override)` -> `None` — Set the state of the completion mode override. Note, setting the state to force restore state will only take effect if t...
  - `set_disable_camera_cuts(disable_camera_cuts)` -> `None` — Set whether to disable camera cuts
  - `set_frame_range(start_frame, duration, sub_frames = 0.000000)` -> `None` — Set the valid play range for this sequence, determined by a starting frame number (in this sequence playerâs plaback f...
  - `set_frame_rate(frame_rate)` -> `None` — Set the frame-rate that this player should play with, making all frame numbers in the specified time-space
  - `set_hide_hud(hide_hud)` -> `None` — Set if hiding the hud during play.
  - `set_play_rate(play_rate)` -> `None` — Set the playback rate of this player. Negative values will play the animation in reverse.
  - `set_playback_position(playback_params)` -> `None` — Set the current time of the player by evaluating from the current time to the specified time, as if the sequence is play...
  - `set_time_range(start_time, duration)` -> `None` — Set the valid play range for this sequence, determined by a starting time and a duration (in seconds)
  - `set_weight(weight)` -> `None` — Set a manual weight to be multiplied with all blendable elements within this sequence note:: It is recommended that a we...
  - `stop()` -> `None` — Stop playback and move the cursor to the end (or start, for reversed playback) of the sequence.
  - `stop_at_current_time()` -> `None` — Stop playback without moving the cursor.

**Properties** (5):
  - `on_finished`: `OnMovieSceneSequencePlayerEvent` — [Read-Write] Event triggered when the level sequence player finishes naturally (without explicitly c...
  - `on_pause`: `OnMovieSceneSequencePlayerEvent` — [Read-Write] Event triggered when the level sequence player is paused (OnMovieSceneSequencePlayerEve...
  - `on_play`: `OnMovieSceneSequencePlayerEvent` — [Read-Write] Event triggered when the level sequence player is played (OnMovieSceneSequencePlayerEve...
  - `on_play_reverse`: `OnMovieSceneSequencePlayerEvent` — [Read-Write] Event triggered when the level sequence player is played in reverse (OnMovieSceneSequen...
  - `on_stop`: `OnMovieSceneSequencePlayerEvent` — [Read-Write] Event triggered when the level sequence player is stopped (OnMovieSceneSequencePlayerEv...

### `unreal.MovieSceneSignedObject`
Inherits: `Object` | Header: `MovieSceneSignedObject.h`

namespace UE

### `unreal.MovieSceneSpawnableBindingBase`
Inherits: `MovieSceneCustomBinding` | Header: `MovieSceneSpawnableBinding.h`

The base class for custom spawnable bindings. A spawnable binding will spawn an object upon resolution or return a cached previously spawned object. UMovieSceneSpawnableActorBinding is the reimplement...

**Properties** (2):
  - `continuously_respawn`: `bool` — [Read-Write] When enabled, this spawnable will always be respawned if it gets destroyed externally. ...
  - `spawn_ownership`: `SpawnOwnership` — [Read-Write] * The spawn ownership setting for this spawnable, allowing spawnables to potentially ou...

### `unreal.MovieSceneSpawnSection`
Inherits: `MovieSceneBoolSection` | Header: `MovieSceneSpawnSection.h`

A spawn section.

### `unreal.MovieSceneSpawnTrack`
Inherits: `MovieSceneTrack` | Header: `MovieSceneSpawnTrack.h`

Handles when a spawnable should be spawned and destroyed

### `unreal.MovieSceneSubSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneSubSection.h`

Implements a section in sub-sequence tracks.

**Methods** (3):
  - `get_parent_sequence_frame(frame, parent_sequence)` -> `int32` — Get the frame in the space of its parent sequence
  - `get_sequence()` -> `MovieSceneSequence` — Get the sequence that is assigned to this section. see: SetSequence
  - `set_sequence(sequence)` -> `None` — Sets the sequence played by this section. see: GetSequence

**Properties** (1):
  - `parameters`: `MovieSceneSectionParameters` — [Read-Write] (MovieSceneSectionParameters)

### `unreal.MovieSceneSubTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneSubTrack.h`

A track that holds sub-sequences within a larger sequence.

### `unreal.MovieSceneTimeWarpSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneTimeWarpSection.h`

The section type contained within a UMovieSceneTimeWarpTrack.

### `unreal.MovieSceneTimeWarpTrack`
Inherits: `MovieSceneTrack` | Header: `MovieSceneTimeWarpTrack.h`

A track that can be added to any sequence to affect the playback position and speed of that sequence and all its subsequences

### `unreal.MovieSceneTrack`
Inherits: `MovieSceneDecorationContainerObject` | Header: `MovieSceneTrack.h`

Base class for a track in a Movie Scene

**Methods** (13):
  - `add_section()` -> `MovieSceneSection` — Add a new section to this track
  - `get_color_tint()` -> `Color` — Get the color tint for this track
  - `get_display_name()` -> `Text` — Get this trackâs display name
  - `get_section_to_key()` -> `MovieSceneSection` — Get the section to key for this track
  - `get_sections()` -> `Array [ MovieSceneSection ]` — Access all this trackâs sections
  - `get_sorting_order()` -> `int32` — Get the sorting order for this track
  - `get_track_row_display_name(row_index)` -> `Text` — Get this track rowâs display name
  - `remove_section(section)` -> `None` — Remove the specified section
  - `set_color_tint(color_tint)` -> `None` — Set the color tint for this track
  - `set_display_name(name)` -> `None` — Set this trackâs display name
  - `set_section_to_key(section)` -> `None` — Set the section to key for this track. When properties for this section are modified externally, this section will recei...
  - `set_sorting_order(sorting_order)` -> `None` — Set the sorting order for this track
  - `set_track_row_display_name(name, row_index)` -> `None` — Set this track rowâs display name

### `unreal.MovieSceneTrackInstance`
Inherits: `Object` | Header: `MovieSceneTrackInstance.h`

Base class for all track instances. Can also be used for root tracks where AnimatedObject will be nullptr

### `unreal.TestMovieSceneArrayPropertiesActor`
Inherits: `Actor` | Header: `MovieSceneTestObjects.h`

Test Movie Scene Array Properties Actor

**Properties** (4):
  - `multiple_floats`: `None` — [Read-Write] (Array[float])
  - `multiple_structs`: `None` — [Read-Write] (Array[TestMovieSceneStruct])
  - `single_struct`: `TestMovieSceneStruct` — [Read-Write] (TestMovieSceneStruct)
  - `test_vector`: `Vector` — [Read-Write] (Vector)

### `unreal.TestMovieSceneEvalHookSection`
Inherits: `MovieSceneHookSection` | Header: `MovieSceneTestObjects.h`

Test Movie Scene Eval Hook Section

### `unreal.TestMovieSceneEvalHookTrack`
Inherits: `MovieSceneTrack` | Header: `MovieSceneTestObjects.h`

Test Movie Scene Eval Hook Track

### `unreal.TestMovieSceneSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneTestObjects.h`

Test Movie Scene Section

### `unreal.TestMovieSceneSequence`
Inherits: `MovieSceneSequence` | Header: `MovieSceneTestObjects.h`

Test Movie Scene Sequence

### `unreal.TestMovieSceneSubSection`
Inherits: `MovieSceneSubSection` | Header: `MovieSceneTestObjects.h`

Test Movie Scene Sub Section

### `unreal.TestMovieSceneSubTrack`
Inherits: `MovieSceneSubTrack` | Header: `MovieSceneTestObjects.h`

Test Movie Scene Sub Track

### `unreal.TestMovieSceneTrack`
Inherits: `MovieSceneTrack` | Header: `MovieSceneTestObjects.h`

Test Movie Scene Track

### `unreal.MovieSceneBlendType`
Inherits: `EnumBase` | Header: `MovieSceneBlendType.h`

Movie scene blend type enumeration

**Properties** (5):
  - `ABSOLUTE`: `MovieSceneBlendType = Ellipsis` — Blends all other weighted values together as an average of the total weight 1
  - `ADDITIVE`: `MovieSceneBlendType = Ellipsis` — Applies this value as a sum total of all other additives 2
  - `ADDITIVE_FROM_BASE`: `MovieSceneBlendType = Ellipsis` — Applies this value as an additive equal to the difference between the current value and the first va...
  - `OVERRIDE`: `MovieSceneBlendType = Ellipsis` — The value will override the current value 16
  - `RELATIVE`: `MovieSceneBlendType = Ellipsis` — Applies this value as a sum total of all other additives and the initial value before the animation ...

### `unreal.MovieSceneBuiltInEasing`
Inherits: `EnumBase` | Header: `MovieSceneEasingCurves.h`

EMovie Scene Built in Easing

**Properties** (25):
  - `CIRC_IN`: `MovieSceneBuiltInEasing = Ellipsis` — Circular easing 21
  - `CIRC_IN_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 23
  - `CIRC_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 22
  - `CUBIC`: `MovieSceneBuiltInEasing = Ellipsis` — Cubic easing 7
  - `CUBIC_IN`: `MovieSceneBuiltInEasing = Ellipsis` — 8
  - `CUBIC_IN_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 10
  - `CUBIC_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 9
  - `CUSTOM`: `MovieSceneBuiltInEasing = Ellipsis` — Custom 24
  - `EXPO_IN`: `MovieSceneBuiltInEasing = Ellipsis` — Exponential easing 18
  - `EXPO_IN_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 20
  - `EXPO_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 19
  - `HERMITE_CUBIC_IN_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 11
  - `LINEAR`: `MovieSceneBuiltInEasing = Ellipsis` — Linear easing 0
  - `QUAD_IN`: `MovieSceneBuiltInEasing = Ellipsis` — Quadratic easing 4
  - `QUAD_IN_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 6
  - `QUAD_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 5
  - `QUART_IN`: `MovieSceneBuiltInEasing = Ellipsis` — Quartic easing 12
  - `QUART_IN_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 14
  - `QUART_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 13
  - `QUINT_IN`: `MovieSceneBuiltInEasing = Ellipsis` — Quintic easing 15
  - `QUINT_IN_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 17
  - `QUINT_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 16
  - `SIN_IN`: `MovieSceneBuiltInEasing = Ellipsis` — Sinusoidal easing 1
  - `SIN_IN_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 3
  - `SIN_OUT`: `MovieSceneBuiltInEasing = Ellipsis` — 2

### `unreal.MovieSceneCompletionMode`
Inherits: `EnumBase` | Header: `MovieSceneCompletionMode.h`

Enumeration specifying how to handle state when this section is no longer evaluated

**Properties** (3):
  - `KEEP_STATE`: `MovieSceneCompletionMode = Ellipsis` — 0
  - `PROJECT_DEFAULT`: `MovieSceneCompletionMode = Ellipsis` — 2
  - `RESTORE_STATE`: `MovieSceneCompletionMode = Ellipsis` — 1

### `unreal.MovieSceneCompletionModeOverride`
Inherits: `EnumBase` | Header: `MovieSceneSequencePlaybackSettings.h`

Whether to override track sectionsâ default completion mode when a sequence finishes.

**Properties** (3):
  - `FORCE_KEEP_STATE`: `MovieSceneCompletionModeOverride = Ellipsis` — 1
  - `FORCE_RESTORE_STATE`: `MovieSceneCompletionModeOverride = Ellipsis` — 2
  - `NONE`: `MovieSceneCompletionModeOverride = Ellipsis` — 0

### `unreal.MovieSceneConditionCheckFrequency`
Inherits: `EnumBase` | Header: `MovieSceneCondition.h`

Defines how often a condition needs to be checked. * Most conditions should return âOnceâ, but if the condition result can change during playback, âOnTickâ can be chosen to have the condition ...

**Properties** (2):
  - `ONCE`: `MovieSceneConditionCheckFrequency = Ellipsis` — Condition result will not change during sequence playback and only needs to get checked once. 0
  - `ON_TICK`: `MovieSceneConditionCheckFrequency = Ellipsis` — Condition result may change during sequence playback and should be checked per tick. 1

### `unreal.MovieSceneConditionScope`
Inherits: `EnumBase` | Header: `MovieSceneCondition.h`

Defines the scope of a particular condition type. By default, the condition scope will determine whether conditions need to be re-evaluated for different bindings or entities in the Sequence.

**Properties** (3):
  - `BINDING`: `MovieSceneConditionScope = Ellipsis` — Condition may have different results for different object bindings. 1
  - `GLOBAL`: `MovieSceneConditionScope = Ellipsis` — Condition has the same result regardless of the binding or entity. 0
  - `OWNER_OBJECT`: `MovieSceneConditionScope = Ellipsis` — Condition may have different results for each different outer object owner (i.e. track, section) in ...

### `unreal.MovieSceneEvaluationType`
Inherits: `EnumBase` | Header: `MovieSceneFwd.h`

EMovie Scene Evaluation Type

**Properties** (2):
  - `FRAME_LOCKED`: `MovieSceneEvaluationType = Ellipsis` — Play the sequence frame-locked to its playback rate (snapped to the tick resolution - no sub-frames)...
  - `WITH_SUB_FRAMES`: `MovieSceneEvaluationType = Ellipsis` — Play the sequence in real-time, with sub-frame interpolation if necessary 1

### `unreal.MovieSceneGroupConditionOperator`
Inherits: `EnumBase` | Header: `MovieSceneGroupCondition.h`

Which operator to use in evaluating a MovieSceneGroupCondition

**Properties** (3):
  - `AND`: `MovieSceneGroupConditionOperator = Ellipsis` — 0
  - `OR`: `MovieSceneGroupConditionOperator = Ellipsis` — 1
  - `XOR`: `MovieSceneGroupConditionOperator = Ellipsis` — 2

### `unreal.MovieSceneKeyInterpolation`
Inherits: `EnumBase` | Header: `KeyParams.h`

EMovie Scene Key Interpolation

**Properties** (6):
  - `AUTO`: `MovieSceneKeyInterpolation = Ellipsis` — Auto. 0
  - `BREAK`: `MovieSceneKeyInterpolation = Ellipsis` — Break. 2
  - `CONSTANT`: `MovieSceneKeyInterpolation = Ellipsis` — Constant. 4
  - `LINEAR`: `MovieSceneKeyInterpolation = Ellipsis` — Linear. 3
  - `SMART_AUTO`: `MovieSceneKeyInterpolation = Ellipsis` — Smart Auto. 5
  - `USER`: `MovieSceneKeyInterpolation = Ellipsis` — User. 1

### `unreal.MovieScenePositionType`
Inherits: `EnumBase` | Header: `MovieSceneSequencePlayer.h`

EMovie Scene Position Type

**Properties** (4):
  - `FRAME`: `MovieScenePositionType = Ellipsis` — 0
  - `MARKED_FRAME`: `MovieScenePositionType = Ellipsis` — 2
  - `TIME`: `MovieScenePositionType = Ellipsis` — 1
  - `TIMECODE`: `MovieScenePositionType = Ellipsis` — 3

### `unreal.MovieSceneSubSectionFlags`
Inherits: `EnumBase` | Header: `MovieSceneSectionParameters.h`

Flag structure that can be applied to any sub-section allowing control over various behaviors for the nested sub-sequence.

**Properties** (6):
  - `ANY_RESTORE_STATE_OVERRIDE`: `MovieSceneSubSectionFlags = Ellipsis` — 3
  - `BLEND_HIERARCHICAL_BIAS`: `MovieSceneSubSectionFlags = Ellipsis` — Blend this sub sequenceâs hierarchical bias level using a higher -> lower override. Values from hi...
  - `IGNORE_HIERARCHICAL_BIAS`: `MovieSceneSubSectionFlags = Ellipsis` — Everything inside this sub-sequence should ignore hierarchical bias and always be relevant 4
  - `NONE`: `MovieSceneSubSectionFlags = Ellipsis` — 0
  - `OVERRIDE_KEEP_STATE`: `MovieSceneSubSectionFlags = Ellipsis` — When set, everything within the sub-section (including further sub-sections) should be keep-state. M...
  - `OVERRIDE_RESTORE_STATE`: `MovieSceneSubSectionFlags = Ellipsis` — When set, everything within the sub-section (including further sub-sections) should be restore-state...

### `unreal.MovieSceneTimeUnit`
Inherits: `EnumBase` | Header: `MovieSceneTimeUnit.h`

Specifies which frame of reference you want to set/get time values in. This allows users to work in reference space without having to manually convert back and forth all of the time.

**Properties** (2):
  - `DISPLAY_RATE`: `MovieSceneTimeUnit = Ellipsis` — Display Rate matches the values shown in the UI such as 30fps giving you 30 frames per second. Suppo...
  - `TICK_RESOLUTION`: `MovieSceneTimeUnit = Ellipsis` — Tick Resolution is the internal resolution that data is actually stored in, such as 24000 giving you...

### `unreal.SpawnOwnership`
Inherits: `EnumBase` | Header: `MovieSceneSpawnable.h`

ESpawn Ownership

**Properties** (3):
  - `EXTERNAL`: `SpawnOwnership = Ellipsis` — Once spawned, the objectâs lifetime is managed externally. 2
  - `INNER_SEQUENCE`: `SpawnOwnership = Ellipsis` — The objectâs lifetime is managed by the sequence that spawned it 0
  - `ROOT_SEQUENCE`: `SpawnOwnership = Ellipsis` — The objectâs lifetime is managed by the outermost sequence 1

### `unreal.UpdateClockSource`
Inherits: `EnumBase` | Header: `MovieSceneFwd.h`

Enum used to define how to update to a particular time

**Properties** (7):
  - `AUDIO`: `UpdateClockSource = Ellipsis` — Use the audio clock for timing. Does not honor world or actor pause state. 2
  - `CUSTOM`: `UpdateClockSource = Ellipsis` — Custom clock source created and defined externally. 6
  - `PLATFORM`: `UpdateClockSource = Ellipsis` — Use the platform clock for timing. Does not honor world or actor pause state. 1
  - `PLAY_EVERY_FRAME`: `UpdateClockSource = Ellipsis` — Hold on each whole frame for a Sequencer.SecondsPerFrame many wall-clock seconds before advancing to...
  - `RELATIVE_TIMECODE`: `UpdateClockSource = Ellipsis` — Time relative to the timecode provider for timing. Does not honor world or actor pause state. 3
  - `TICK`: `UpdateClockSource = Ellipsis` — Use the default world tick delta for timing. Honors world and actor pause state, but is susceptible ...
  - `TIMECODE`: `UpdateClockSource = Ellipsis` — Use current timecode provider for timing. Does not honor world or actor pause state. 4

### `unreal.UpdatePositionMethod`
Inherits: `EnumBase` | Header: `MovieSceneSequencePlayer.h`

Enum used to define how to update to a particular time

**Properties** (3):
  - `JUMP`: `UpdatePositionMethod = Ellipsis` — Jump to a specified position (without triggering events in between), using the current player status...
  - `PLAY`: `UpdatePositionMethod = Ellipsis` — Update from the current position to a specified position (including triggering events), using the cu...
  - `SCRUB`: `UpdatePositionMethod = Ellipsis` — Jump to a specified position, temporarily using EMovieScenePlayerStatus::Scrubbing 2

### `unreal.OnMovieSceneSequencePlayerEvent`
Inherits: `MulticastDelegateBase` | Header: `MovieSceneSequencePlayer.h`

On Movie Scene Sequence Player Event Delegate Signature
