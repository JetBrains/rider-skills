# UE Python API — MovieSceneTracks Module

**119 types** from the `MovieSceneTracks` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ComponentMaterialInfo`, `EventPayload`, `MovieSceneBaseCacheParams`, `MovieSceneCameraShakeSectionData`, `MovieSceneCameraShakeSourceTrigger`, `MovieSceneConsoleVariableCollection`, `MovieSceneCVarOverrides`, `MovieSceneDirectorBlueprintConditionData`, `MovieSceneDirectorBlueprintConditionPayloadVariable`, `MovieSceneEvent`, `MovieSceneEventParameters`, `MovieSceneEventPayloadVariable`, `MovieSceneEventPtrs`, `MovieSceneSkeletalAnimationParams`, `MovieScene3DAttachSection`, `MovieScene3DAttachTrack`, `MovieScene3DConstraintSection`, `MovieScene3DConstraintTrack`, `MovieScene3DPathSection`, `MovieScene3DPathTrack`, ... (119 total)

---

## Classes

### `unreal.ComponentMaterialInfo`
Inherits: `StructBase` | Header: `MovieSceneMaterialTrack.h`

Contains what is necessary to uniquely identify a material on a component, whether that be an indexed material, one with a slot name, or an overlay material.

**Properties** (3):
  - `material_slot_index`: `int` — [Read-Write] (int32)
  - `material_slot_name`: `Name` — [Read-Write] (Name)
  - `material_type`: `ComponentMaterialType` — [Read-Write] (ComponentMaterialType)

### `unreal.EventPayload`
Inherits: `StructBase` | Header: `MovieSceneEventSection.h`

Event Payload

**Properties** (2):
  - `event_name`: `Name` — [Read-Write] The name of the event to trigger (Name)
  - `parameters`: `MovieSceneEventParameters` [Read-Only] — [Read-Only] The event parameters (MovieSceneEventParameters)

### `unreal.MovieSceneBaseCacheParams`
Inherits: `StructBase` | Header: `MovieSceneBaseCacheSection.h`

Base class for the cache parameters that will be used in all the cache sections

### `unreal.MovieSceneCameraShakeSectionData`
Inherits: `StructBase` | Header: `MovieSceneCameraShakeSection.h`

Movie Scene Camera Shake Section Data

### `unreal.MovieSceneCameraShakeSourceTrigger`
Inherits: `StructBase` | Header: `MovieSceneCameraShakeSourceTriggerChannel.h`

Movie Scene Camera Shake Source Trigger

**Properties** (4):
  - `play_scale`: `float` — [Read-Write] Scalar that affects shake intensity (float)
  - `play_space`: `CameraShakePlaySpace` — [Read-Write] (CameraShakePlaySpace)
  - `shake_class`: `Class` — [Read-Write] Class of the camera shake to play (type(Class))
  - `user_defined_play_space`: `Rotator` — [Read-Write] (Rotator)

### `unreal.MovieSceneConsoleVariableCollection`
Inherits: `StructBase` | Header: `MovieSceneCVarSection.h`

Movie Scene Console Variable Collection

### `unreal.MovieSceneCVarOverrides`
Inherits: `StructBase` | Header: `MovieSceneCVarSection.h`

Movie Scene CVar Overrides

### `unreal.MovieSceneDirectorBlueprintConditionData`
Inherits: `StructBase` | Header: `MovieSceneDirectorBlueprintCondition.h`

Data for a director blueprint condition endpoint call.

### `unreal.MovieSceneDirectorBlueprintConditionPayloadVariable`
Inherits: `StructBase` | Header: `MovieSceneDirectorBlueprintCondition.h`

Value definition for any type-agnostic variable (exported as text)

### `unreal.MovieSceneEvent`
Inherits: `StructBase` | Header: `MovieSceneEvent.h`

Movie Scene Event

**Methods** (1):
  - `get_bound_object_property_class()`

### `unreal.MovieSceneEventParameters`
Inherits: `StructBase` | Header: `MovieSceneEventSection.h`

Movie Scene Event Parameters

### `unreal.MovieSceneEventPayloadVariable`
Inherits: `StructBase` | Header: `MovieSceneEvent.h`

Value definition for any type-agnostic variable (exported as text)

### `unreal.MovieSceneEventPtrs`
Inherits: `StructBase` | Header: `MovieSceneEvent.h`

Compiled reflection pointers for the event function and parameters

### `unreal.MovieSceneSkeletalAnimationParams`
Inherits: `StructBase` | Header: `MovieSceneSkeletalAnimationSection.h`

Movie Scene Skeletal Animation Params

**Properties** (12):
  - `animation`: `AnimSequenceBase` — [Read-Write] The animation this section plays (AnimSequenceBase)
  - `end_frame_offset`: `FrameNumber` — [Read-Write] The offset into the end of the animation clip (FrameNumber)
  - `first_loop_start_frame_offset`: `FrameNumber` — [Read-Write] The offset into the beginning of the animation clip for the first loop of play. (FrameN...
  - `force_custom_mode`: `bool` — [Read-Write] If on animation sequence will always play when active even if the animation is controll...
  - `linear_playback_when_scaled`: `bool` — [Read-Write] (bool)
  - `mirror_data_table`: `MirrorDataTable` — [Read-Write] (MirrorDataTable)
  - `play_rate`: `MovieSceneTimeWarpVariant` — [Read-Write] The playback rate of the animation clip (MovieSceneTimeWarpVariant)
  - `reverse`: `bool` — [Read-Write] Reverse the playback of the animation clip (bool)
  - `skip_anim_notifiers`: `bool` — [Read-Write] If on will skip sending animation notifies (bool)
  - `slot_name`: `Name` — [Read-Write] The slot name to use for the animation (Name)
  - `start_frame_offset`: `FrameNumber` — [Read-Write] The offset into the beginning of the animation clip (FrameNumber)
  - `swap_root_bone`: `SwapRootBone` — [Read-Write] If on the root bone transform will be swapped to the specified root (SwapRootBone)

### `unreal.MovieScene3DAttachSection`
Inherits: `MovieScene3DConstraintSection` | Header: `MovieScene3DAttachSection.h`

A 3D Attach section

**Properties** (8):
  - `attach_component_name`: `Name` — [Read-Write] (Name)
  - `attach_socket_name`: `Name` — [Read-Write] (Name)
  - `attachment_location_rule`: `AttachmentRule` — [Read-Write] (AttachmentRule)
  - `attachment_rotation_rule`: `AttachmentRule` — [Read-Write] (AttachmentRule)
  - `attachment_scale_rule`: `AttachmentRule` — [Read-Write] (AttachmentRule)
  - `detachment_location_rule`: `DetachmentRule` — [Read-Write] (DetachmentRule)
  - `detachment_rotation_rule`: `DetachmentRule` — [Read-Write] (DetachmentRule)
  - `detachment_scale_rule`: `DetachmentRule` — [Read-Write] (DetachmentRule)

### `unreal.MovieScene3DAttachTrack`
Inherits: `MovieScene3DConstraintTrack` | Header: `MovieScene3DAttachTrack.h`

Handles manipulation of path tracks in a movie scene.

### `unreal.MovieScene3DConstraintSection`
Inherits: `MovieSceneSection` | Header: `MovieScene3DConstraintSection.h`

Base class for 3D constraint section

**Methods** (2):
  - `get_constraint_binding_id()` -> `MovieSceneObjectBindingID` — Gets the constraint binding for this Constraint section
  - `set_constraint_binding_id(constraint_binding_id)` -> `None` — Sets the constraint binding for this Constraint section

### `unreal.MovieScene3DConstraintTrack`
Inherits: `MovieSceneTrack` | Header: `MovieScene3DConstraintTrack.h`

Base class for constraint tracks (tracks that are dependent upon other objects).

### `unreal.MovieScene3DPathSection`
Inherits: `MovieScene3DConstraintSection` | Header: `MovieScene3DPathSection.h`

A 3D Path section

**Properties** (5):
  - `follow`: `bool` — [Read-Write] Follow Curve (bool)
  - `force_upright`: `bool` — [Read-Write] Force Upright (bool)
  - `front_axis_enum`: `MovieScene3DPathSection_Axis` — [Read-Write] Front Axis (MovieScene3DPathSection_Axis)
  - `reverse`: `bool` — [Read-Write] Reverse Timing (bool)
  - `up_axis_enum`: `MovieScene3DPathSection_Axis` — [Read-Write] Up Axis (MovieScene3DPathSection_Axis)

### `unreal.MovieScene3DPathTrack`
Inherits: `MovieScene3DConstraintTrack` | Header: `MovieScene3DPathTrack.h`

Handles manipulation of path tracks in a movie scene

### `unreal.MovieScene3DTransformSection`
Inherits: `MovieSceneSection` | Header: `MovieScene3DTransformSection.h`

A 3D transform section

### `unreal.MovieScene3DTransformTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieScene3DTransformTrack.h`

Handles manipulation of component transforms in a movie scene

### `unreal.MovieSceneActorReferenceSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneActorReferenceSection.h`

A single actor reference point section

### `unreal.MovieSceneActorReferenceTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneActorReferenceTrack.h`

Handles manipulation of actor reference properties in a movie scene

### `unreal.MovieSceneAsyncAction_SequencePrediction`
Inherits: `BlueprintAsyncActionBase` | Header: `MovieScenePredictionSystem.h`

Async BP action that represents a pending prediction that is dispatched on a playing sequence.

**Methods** (4):
  - `predict_local_transform_at_frame(player, target_component, frame_time)` -> `MovieSceneAsyncAction_SequencePrediction` [classmethod] — Initiate an asynchronous prediction for the specified componentâs local transform at a specific time in a sequence Cha...
  - `predict_local_transform_at_time(player, target_component, time_in_seconds)` -> `MovieSceneAsyncAction_SequencePrediction` [classmethod] — Initiate an asynchronous prediction for the specified componentâs local transform at a specific time in a sequence Cha...
  - `predict_world_transform_at_frame(player, target_component, frame_time)` -> `MovieSceneAsyncAction_SequencePrediction` [classmethod] — Initiate an asynchronous prediction for the specified componentâs world transform at a specific time in a sequence Cha...
  - `predict_world_transform_at_time(player, target_component, time_in_seconds)` -> `MovieSceneAsyncAction_SequencePrediction` [classmethod] — Initiate an asynchronous prediction for the specified componentâs world transform at a specific time in a sequence Cha...

**Properties** (2):
  - `failure`: `MovieSceneActorPredictionFailure` — [Read-Write] Called when a message is broadcast on the specified channel. Use GetPayload() to reques...
  - `result`: `MovieSceneActorPredictionResult` — [Read-Write] Called when a message is broadcast on the specified channel. Use GetPayload() to reques...

### `unreal.MovieSceneAudioSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneAudioSection.h`

Audio section, for use in the audio track, or by attached audio objects

**Methods** (13):
  - `get_attenuation_settings()` -> `SoundAttenuation`
  - `get_looping()` -> `bool`
  - `get_override_attenuation()` -> `bool`
  - `get_playback_sound()` -> `SoundBase` — Gets the sound that this section should use for playback, taking into account localization concerns
  - `get_sound()` -> `SoundBase` — Gets the sound for this section
  - `get_start_offset()` -> `FrameNumber` — Get the offset into the beginning of the audio clip
  - `get_suppress_subtitles()` -> `bool`
  - `set_attenuation_settings(attenuation_settings)` -> `None` — Set the attenuation settings for this audio section
  - `set_looping(looping)` -> `None` — Set whether the sound should be looped
  - `set_override_attenuation(override_attenuation)` -> `None` — Set whether the attentuation should be overriden
  - `set_sound(sound)` -> `None` — Sets this sectionâs sound
  - `set_start_offset(start_offset)` -> `None` — Set the offset into the beginning of the audio clip
  - `set_suppress_subtitles(suppress_subtitles)` -> `None` — Set whether subtitles should be suppressed

**Properties** (1):
  - `sound`: `SoundBase` — [Read-Write] The sound cue or wave that this section plays (SoundBase)

### `unreal.MovieSceneAudioTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneAudioTrack.h`

Handles manipulation of audio.

### `unreal.MovieSceneBaseCacheSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneBaseCacheSection.h`

Movie scene section that control base cache playback

### `unreal.MovieSceneBoolTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneBoolTrack.h`

Handles manipulation of float properties in a movie scene

### `unreal.MovieSceneByteSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneByteSection.h`

A single byte section.

### `unreal.MovieSceneByteTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneByteTrack.h`

Handles manipulation of byte properties in a movie scene

**Methods** (2):
  - `get_byte_track_enum()` -> `Enum` — Get this byte trackâs enum
  - `set_byte_track_enum(enum)` -> `None` — Set this byte trackâs enum

### `unreal.MovieSceneCameraCutSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneCameraCutSection.h`

Movie CameraCuts are sections on the CameraCuts track, that show what the viewer âseesâ

**Methods** (2):
  - `get_camera_binding_id()` -> `MovieSceneObjectBindingID` — Gets the camera binding for this CameraCut section
  - `set_camera_binding_id(camera_binding_id)` -> `None` — Sets the camera binding for this CameraCut section

### `unreal.MovieSceneCameraCutTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneCameraCutTrack.h`

Handles manipulation of CameraCut properties in a movie scene.

### `unreal.MovieSceneCameraShakeSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneCameraShakeSection.h`

Movie Scene Camera Shake Section

### `unreal.MovieSceneCameraShakeSourceShakeSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneCameraShakeSourceShakeSection.h`

Movie Scene Camera Shake Source Shake Section

### `unreal.MovieSceneCameraShakeSourceShakeTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneCameraShakeSourceShakeTrack.h`

Movie Scene Camera Shake Source Shake Track

### `unreal.MovieSceneCameraShakeSourceTriggerSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneCameraShakeSourceTriggerSection.h`

Movie Scene Camera Shake Source Trigger Section

### `unreal.MovieSceneCameraShakeSourceTriggerTrack`
Inherits: `MovieSceneTrack` | Header: `MovieSceneCameraShakeSourceTriggerTrack.h`

Movie Scene Camera Shake Source Trigger Track

### `unreal.MovieSceneCameraShakeTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneCameraShakeTrack.h`

Movie Scene Camera Shake Track

### `unreal.MovieSceneCinematicShotSection`
Inherits: `MovieSceneSubSection` | Header: `MovieSceneCinematicShotSection.h`

Implements a cinematic shot section.

**Methods** (2):
  - `get_shot_display_name()` -> `str`
  - `set_shot_display_name(shot_display_name)` -> `None` — Set the shot display name

### `unreal.MovieSceneCinematicShotTrack`
Inherits: `MovieSceneSubTrack` | Header: `MovieSceneCinematicShotTrack.h`

A track that holds consecutive sub sequences.

### `unreal.MovieSceneColorSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneColorSection.h`

A single floating point section

### `unreal.MovieSceneColorTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneColorTrack.h`

Handles manipulation of float properties in a movie scene

### `unreal.MovieSceneCommonAnimationTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneCommonAnimationTrack.h`

Movie Scene Common Animation Track

### `unreal.MovieSceneComponentMaterialParameterSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneComponentMaterialParameterSection.h`

A movie scene section containing data for material parameters.

**Methods** (4):
  - `add_color_parameter_key(parameter_info, time, value, layer_name, asset_name, channel_names = [])` -> `None` — Adds a a key for a specific color parameter at the specified time with the specified value.
  - `add_scalar_parameter_key(parameter_info, time, value, layer_name, asset_name)` -> `None` — Adds a a key for a specific scalar parameter at the specified time with the specified value.
  - `remove_color_parameter(parameter_info)` -> `bool` — Removes a color parameter from this section.
  - `remove_scalar_parameter(parameter_info)` -> `bool` — Removes a scalar parameter from this section.

### `unreal.MovieSceneComponentMaterialTrack`
Inherits: `MovieSceneMaterialTrack` | Header: `MovieSceneMaterialTrack.h`

A material track which is specialized for animation materials which are owned by actor components.

**Methods** (4):
  - `get_material_index()` -> `int32` — Get Material Index deprecated: Use SetMaterialInfo instead
  - `get_material_info()` -> `ComponentMaterialInfo` — Get material info of the component that is animated by the material track. deprecated: Use SetMaterialInfo instead
  - `set_material_index(material_index)` -> `None` — Set Material Index deprecated: Use SetMaterialInfo instead
  - `set_material_info(material_info)` -> `None` — Set material info of the component that is animated by the material track.

**Properties** (1):
  - `material_index`: `int` — [Read-Write] The index of this material this track is animating. Has been deprecated in favor of Mat...

### `unreal.MovieSceneCustomPrimitiveDataSection`
Inherits: `MovieSceneParameterSection` | Header: `MovieSceneCustomPrimitiveDataSection.h`

Movie scene section that animates custom primitive data scalars, vector2s, vector3s, and colors

### `unreal.MovieSceneCustomPrimitiveDataTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneCustomPrimitiveDataTrack.h`

Handles manipulation of custom primitive data in a movie scene.

### `unreal.MovieSceneCVarSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneCVarSection.h`

A CVar section is responsible for applying a user-supplied value to the specified cvar, and then restoring the previous value after the section ends.

**Methods** (2):
  - `get_string()` -> `str` — Get String
  - `set_from_string(string)` -> `None` — Set from String

### `unreal.MovieSceneCVarTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneCVarTrack.h`

Track for setting (and restoring) Console Variables during playback.

### `unreal.MovieSceneDataLayerSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneDataLayerSection.h`

Movie Scene Data Layer Section

**Methods** (10):
  - `get_data_layer_assets()` -> `Array [ DataLayerAsset ]` — Get Data Layer Assets
  - `get_desired_state()` -> `DataLayerRuntimeState` — Get Desired State
  - `get_flush_on_activated()` -> `bool` — Get Flush on Activated
  - `get_flush_on_unload()` -> `bool` — Get Flush on Unload
  - `get_preroll_state()` -> `DataLayerRuntimeState` — Get Preroll State
  - `set_data_layer_assets(data_layer_assets)` -> `None` — Set Data Layer Assets
  - `set_desired_state(desired_state)` -> `None` — Set Desired State
  - `set_flush_on_activated(flush_on_activated)` -> `None` — Set Flush on Activated
  - `set_flush_on_unload(flush_on_unload)` -> `None` — Set Flush on Unload
  - `set_preroll_state(preroll_state)` -> `None` — Set Preroll State

### `unreal.MovieSceneDataLayerTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneDataLayerTrack.h`

A track that controls loading, unloading and visibility of data layers

### `unreal.MovieSceneDirectorBlueprintCondition`
Inherits: `MovieSceneCondition` | Header: `MovieSceneDirectorBlueprintCondition.h`

Condition class allowing users to create a director blueprint endpoint in the Sequence to evaluate a condition.

### `unreal.MovieSceneDoubleSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneDoubleSection.h`

A double precision floating point section

### `unreal.MovieSceneDoubleTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneDoubleTrack.h`

Handles manipulation of double properties in a movie scene

### `unreal.MovieSceneDoubleVectorSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneVectorSection.h`

A double vector section.

### `unreal.MovieSceneDoubleVectorTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneVectorTrack.h`

Handles manipulation of double vectors in a movie scene

**Methods** (2):
  - `get_num_channels_used()` -> `int32` — Get the number of channels used for this track
  - `set_num_channels_used(num_channels_used)` -> `None` — Set the number of channels used for this track

### `unreal.MovieSceneEnumSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneEnumSection.h`

A single enum section.

### `unreal.MovieSceneEnumTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneEnumTrack.h`

Handles manipulation of byte properties in a movie scene

### `unreal.MovieSceneEulerTransformTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneEulerTransformTrack.h`

Handles manipulation of 3D euler transform properties in a movie scene

### `unreal.MovieSceneEventRepeaterSection`
Inherits: `MovieSceneEventSectionBase` | Header: `MovieSceneEventRepeaterSection.h`

Event section that will trigger its event exactly once, every time it is evaluated.

### `unreal.MovieSceneEventSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneEventSection.h`

Implements a section in movie scene event tracks.

### `unreal.MovieSceneEventSectionBase`
Inherits: `MovieSceneSection` | Header: `MovieSceneEventSectionBase.h`

Base class for all event sections. Manages dirtying the section and track on recompilation of the director blueprint.

### `unreal.MovieSceneEventTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneEventTrack.h`

Implements a movie scene track that triggers discrete events during playback.

**Methods** (2):
  - `add_event_repeater_section()` -> `MovieSceneEventRepeaterSection` — Create a new event repeater section for the given track
  - `add_event_trigger_section()` -> `MovieSceneEventTriggerSection` — Create a new event trigger section for the given track

### `unreal.MovieSceneEventTriggerSection`
Inherits: `MovieSceneEventSectionBase` | Header: `MovieSceneEventTriggerSection.h`

Event section that triggeres specific timed events.

### `unreal.MovieSceneFadeSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneFadeSection.h`

A single floating point section.

### `unreal.MovieSceneFadeTrack`
Inherits: `MovieSceneFloatTrack` | Header: `MovieSceneFadeTrack.h`

Implements a movie scene track that controls a fade.

### `unreal.MovieSceneFadeTrackTestLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MovieSceneFadeTrackTests.h`

Movie Scene Fade Track Test Library

**Methods** (1):
  - `get_manual_fade_amount(player_camera_manager)` -> `float` [classmethod] — Get Manual Fade Amount

### `unreal.MovieSceneFloatSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneFloatSection.h`

A single floating point section

### `unreal.MovieSceneFloatTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneFloatTrack.h`

Handles manipulation of float properties in a movie scene

### `unreal.MovieSceneFloatVectorSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneVectorSection.h`

A float vector section.

### `unreal.MovieSceneFloatVectorTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneVectorTrack.h`

Handles manipulation of float vectors in a movie scene

**Methods** (2):
  - `get_num_channels_used()` -> `int32` — Get the number of channels used for this track
  - `set_num_channels_used(num_channels_used)` -> `None` — Set the number of channels used for this track

### `unreal.MovieSceneIntegerSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneIntegerSection.h`

A single integer section.

### `unreal.MovieSceneIntegerTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneIntegerTrack.h`

Handles manipulation of integer properties in a movie scene

### `unreal.MovieSceneLevelVisibilitySection`
Inherits: `MovieSceneSection` | Header: `MovieSceneLevelVisibilitySection.h`

A section for use with the movie scene level visibility track, which controls streamed level visibility.

**Methods** (4):
  - `get_level_names()` -> `Array [ Name ]` — Get Level Names
  - `get_visibility()` -> `LevelVisibility` — Get Visibility
  - `set_level_names(level_names)` -> `None` — Set Level Names
  - `set_visibility(visibility)` -> `None` — Set Visibility

### `unreal.MovieSceneLevelVisibilityTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneLevelVisibilityTrack.h`

A track for controlling the visibility of streamed levels.

### `unreal.MovieSceneMaterialParameterCollectionTrack`
Inherits: `MovieSceneMaterialTrack` | Header: `MovieSceneMaterialParameterCollectionTrack.h`

Handles manipulation of material parameter collections in a movie scene.

### `unreal.MovieSceneMaterialTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneMaterialTrack.h`

Handles manipulation of material parameters in a movie scene.

### `unreal.MovieSceneObjectPropertySection`
Inherits: `MovieSceneSection` | Header: `MovieSceneObjectPropertySection.h`

Movie Scene Object Property Section

### `unreal.MovieSceneObjectPropertyTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneObjectPropertyTrack.h`

Movie Scene Object Property Track

**Methods** (2):
  - `get_object_property_class()` — Get this object property trackâs property class
  - `set_object_property_class(property_class)` -> `None` — Set this object property trackâs property class

### `unreal.MovieSceneParameterSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneParameterSection.h`

A single movie scene section which can contain data for multiple named parameters.

**Methods** (13):
  - `add_bool_parameter_key(parameter_name, time, value)` -> `None` — Adds a a key for a specific bool parameter at the specified time with the specified value.
  - `add_color_parameter_key(parameter_name, time, value)` -> `None` — Adds a a key for a specific color parameter at the specified time with the specified value.
  - `add_scalar_parameter_key(parameter_name, time, value)` -> `None` — Adds a a key for a specific scalar parameter at the specified time with the specified value.
  - `add_transform_parameter_key(parameter_name, time, value)` -> `None` — Adds a a key for a specific color parameter at the specified time with the specified value.
  - `add_vector2d_parameter_key(parameter_name, time, value)` -> `None` — Adds a a key for a specific vector2D parameter at the specified time with the specified value.
  - `add_vector_parameter_key(parameter_name, time, value)` -> `None` — Adds a a key for a specific vector parameter at the specified time with the specified value.
  - `get_parameter_names()` -> `Set [ Name ]` — Gets the set of all parameter names used by this section.
  - `remove_bool_parameter(parameter_name)` -> `bool` — Removes a bool parameter from this section.
  - `remove_color_parameter(parameter_name)` -> `bool` — Removes a color parameter from this section.
  - `remove_scalar_parameter(parameter_name)` -> `bool` — Removes a scalar parameter from this section.
  - `remove_transform_parameter(parameter_name)` -> `bool` — Removes a transform parameter from this section.
  - `remove_vector2d_parameter(parameter_name)` -> `bool` — Removes a vector2D parameter from this section.
  - `remove_vector_parameter(parameter_name)` -> `bool` — Removes a vector parameter from this section.

### `unreal.MovieSceneParticleParameterTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneParticleParameterTrack.h`

Handles manipulation of material parameters in a movie scene.

### `unreal.MovieSceneParticleSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneParticleSection.h`

Particle section, for particle toggling and triggering.

### `unreal.MovieSceneParticleTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneParticleTrack.h`

Handles triggering of particle emitters

### `unreal.MovieScenePlatformCondition`
Inherits: `MovieSceneCondition` | Header: `MovieScenePlatformCondition.h`

Condition on whether the platform running the executable matches one of the given platforms.

### `unreal.MovieScenePrimitiveMaterialSection`
Inherits: `MovieSceneSection` | Header: `MovieScenePrimitiveMaterialSection.h`

Movie Scene Primitive Material Section

### `unreal.MovieScenePrimitiveMaterialTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieScenePrimitiveMaterialTrack.h`

Movie Scene Primitive Material Track

**Methods** (4):
  - `get_material_index()` -> `int32` — Get Material Index deprecated: Use SetMaterialInfo instead
  - `get_material_info()` -> `ComponentMaterialInfo` — Get material info of the component that is animated by the material track. deprecated: Use SetMaterialInfo instead
  - `set_material_index(material_index)` -> `None` — Set Material Index deprecated: Use SetMaterialInfo instead
  - `set_material_info(material_info)` -> `None` — Set material info of the component that is animated by the material track.

### `unreal.MovieScenePropertyTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieScenePropertyTrack.h`

Base class for tracks that animate an object property

**Methods** (4):
  - `get_property_name()` -> `Name` — Get this trackâs property name
  - `get_property_path()` -> `str` — Get this trackâs property path
  - `get_unique_track_name()` -> `Name` — Get this trackâs unique name
  - `set_property_name_and_path(property_name, property_path)` -> `None` — Set this trackâs property name and path

### `unreal.MovieSceneReplaceableActorBinding`
Inherits: `MovieSceneReplaceableBindingBase` | Header: `MovieSceneReplaceableActorBinding.h`

An implementation of UMovieSceneReplaceableBindingBase that uses UMovieSceneSpawnableActorBinding as the preview spawnable, and has no implementation of ResolveRuntimeBindingInternal, relying instead ...

### `unreal.MovieSceneReplaceableActorBinding_BPBase`
Inherits: `MovieSceneReplaceableBindingBase` | Header: `MovieSceneReplaceableActorBinding.h`

Base class for Custom Replaceable Binding classes implemented by Blueprints

**Methods** (3):
  - `bp_init_replaceable_binding(source_object, owner_movie_scene)` -> `None` — Called after binding creation to allow the replaceable to initialize any data members from the source object.
  - `bp_resolve_runtime_binding(resolve_context)` -> `MovieSceneBindingResolveResult`
  - `bp_supports_binding_creation_from_object(source_object)` -> `bool` — Called on the binding to determine whether this binding type supports creating a binding from the passed in object.

**Properties** (4):
  - `binding_type_pretty_name`: `Text` [Read-Only] — [Read-Only] Name to show in Sequencer for the custom binding type. (Text)
  - `binding_type_tooltip`: `Text` [Read-Only] — [Read-Only] Tooltip to show in Sequencer for the custom binding type. (Text)
  - `custom_binding_priority`: `int` [Read-Only] — [Read-Only] Priority with which to consider this binding type over others when considering binding a...
  - `preview_spawnable_type`: `Class` [Read-Only] — [Read-Only] Preview Spawnable Type to use for this replaceable (type(Class))

### `unreal.MovieSceneReplaceableDirectorBlueprintBinding`
Inherits: `MovieSceneReplaceableBindingBase` | Header: `MovieSceneReplaceableDirectorBlueprintBinding.h`

Custom binding type that uses a Director Blueprint endpoint to allow the user to define at runtime how to resolve this binding. User can use any desired custom spawnable type as the preview within Seq...

**Properties** (1):
  - `preview_spawnable_type`: `Class` — [Read-Write] Preview Spawnable Type to use for this replaceable (type(Class))

### `unreal.MovieSceneRotatorSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneRotatorSection.h`

Movie scene section that animates each component (X, Y, Z) of an FRotator property

### `unreal.MovieSceneRotatorTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneRotatorTrack.h`

Movie scene track that animates an FRotator property

### `unreal.MovieSceneScalabilityCondition`
Inherits: `MovieSceneCondition` | Header: `MovieSceneScalabilityCondition.h`

Condition on whether the current engine scalability settings fulfill a given constraint.

### `unreal.MovieSceneSkeletalAnimationSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneSkeletalAnimationSection.h`

Movie scene section that control skeletal animation

**Properties** (6):
  - `matched_location_offset`: `Vector` [Read-Only] — [Read-Only] Location offset determined by matching (Vector)
  - `matched_rotation_offset`: `Rotator` [Read-Only] — [Read-Only] Rotation offset determined by matching (Rotator)
  - `params`: `MovieSceneSkeletalAnimationParams` — [Read-Write] (MovieSceneSkeletalAnimationParams)
  - `show_skeleton`: `bool` — [Read-Write] Whether to show the underlying skeleton for this section. (bool)
  - `start_location_offset`: `Vector` — [Read-Write] Location offset applied before the matched offset (Vector)
  - `start_rotation_offset`: `Rotator` — [Read-Write] Location offset applied after the matched offset (Rotator)

### `unreal.MovieSceneSkeletalAnimationTrack`
Inherits: `MovieSceneCommonAnimationTrack` | Header: `MovieSceneSkeletalAnimationTrack.h`

Handles animation of skeletal mesh actors

**Properties** (1):
  - `swap_root_bone`: `SwapRootBone` — [Read-Write] If on the root bone transform will be swapped to the specified root (SwapRootBone)

### `unreal.MovieSceneSlomoSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneSlomoSection.h`

A single floating point section.

### `unreal.MovieSceneSlomoTrack`
Inherits: `MovieSceneFloatTrack` | Header: `MovieSceneSlomoTrack.h`

Implements a movie scene track that controls a movie sceneâs world time dilation.

### `unreal.MovieSceneSpawnableActorBinding`
Inherits: `MovieSceneSpawnableActorBindingBase` | Header: `MovieSceneSpawnableActorBinding.h`

An implementation of UMovieSceneSpawnableActorBindingBase that matches the old FMovieSceneSpawnable spawnable implementation, allowing the spawning of Actors from a UObject template which is serialize...

### `unreal.MovieSceneSpawnableActorBindingBase`
Inherits: `MovieSceneSpawnableBindingBase` | Header: `MovieSceneSpawnableActorBinding.h`

The base class for actor-specific spawnable bindings. Contains a default implementation that can handle spawning an Actor from provided Actor class and optional Actor template. Can be overridden in C+...

**Properties** (2):
  - `level_name`: `Name` — [Read-Write] Name of level to spawn into (Name)
  - `net_addressable_name`: `bool` — [Read-Write] When enabled, the actor will be spawned with a unique name so that it can be addressabl...

### `unreal.MovieSceneSpawnableDirectorBlueprintBinding`
Inherits: `MovieSceneSpawnableBindingBase` | Header: `MovieSceneSpawnableDirectorBlueprintBinding.h`

Custom binding type that uses a Director Blueprint endpoint to allow the user to define how to spawn an actor for this binding.

### `unreal.MovieSceneStringSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneStringSection.h`

A single string section

### `unreal.MovieSceneStringTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneStringTrack.h`

Implements a movie scene track that holds a series of strings.

### `unreal.MovieSceneTestSequence`
Inherits: `MovieSceneSequence` | Header: `MovieSceneTestDataBuilders.h`

Simple type of sequence for use in automated tests.

### `unreal.MovieSceneTransformOrigin`
Inherits: `Interface` | Header: `IMovieSceneTransformOrigin.h`

Movie Scene Transform Origin

**Methods** (1):
  - `bp_get_transform_origin()` -> `Transform` — Get the transform from which all absolute component transform sections should be relative. Scale is ignored.

### `unreal.MovieSceneTransformTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneTransformTrack.h`

Handles manipulation of 3D transform properties in a movie scene

### `unreal.MovieSceneVisibilitySection`
Inherits: `MovieSceneBoolSection` | Header: `MovieSceneVisibilitySection.h`

A spawn section.

### `unreal.MovieSceneVisibilityTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneVisibilityTrack.h`

Handles manipulation of visibility properties in a movie scene

### `unreal.ComponentMaterialType`
Inherits: `EnumBase` | Header: `MovieSceneMaterialTrack.h`

EComponent Material Type

**Properties** (5):
  - `DECAL_MATERIAL`: `ComponentMaterialType = Ellipsis` — A decal material 3
  - `EMPTY`: `ComponentMaterialType = Ellipsis` — Empty/Uninitialized 0
  - `INDEXED_MATERIAL`: `ComponentMaterialType = Ellipsis` — A material in one of the indexed slots on a primitive component 1
  - `OVERLAY_MATERIAL`: `ComponentMaterialType = Ellipsis` — An overlay material on a mesh component 2
  - `VOLUMETRIC_CLOUD_MATERIAL`: `ComponentMaterialType = Ellipsis` — Volumetric Cloud Material 4

### `unreal.FireEventsAtPosition`
Inherits: `EnumBase` | Header: `MovieSceneEventTrack.h`

Indicates at what point in the sequence evaluation events should fire

**Properties** (3):
  - `AFTER_SPAWN`: `FireEventsAtPosition = Ellipsis` — Fire events right after any spawn tracks have been evaluated 2
  - `AT_END_OF_EVALUATION`: `FireEventsAtPosition = Ellipsis` — Fire events after everything else has been evaluated in the sequence 1
  - `AT_START_OF_EVALUATION`: `FireEventsAtPosition = Ellipsis` — Fire events before anything else is evaluated in the sequence 0

### `unreal.LevelVisibility`
Inherits: `EnumBase` | Header: `MovieSceneLevelVisibilitySection.h`

Visibility options for the level visibility section.

**Properties** (2):
  - `HIDDEN`: `LevelVisibility = Ellipsis` — The streamed levels should be hidden. 1
  - `VISIBLE`: `LevelVisibility = Ellipsis` — The streamed levels should be visible. 0

### `unreal.MovieScene3DPathSection_Axis`
Inherits: `EnumBase` | Header: `MovieScene3DPathSection.h`

Movie Scene 3DPath Section Axis

**Properties** (6):
  - `NEG_X`: `MovieScene3DPathSection_Axis = Ellipsis` — 3
  - `NEG_Y`: `MovieScene3DPathSection_Axis = Ellipsis` — 4
  - `NEG_Z`: `MovieScene3DPathSection_Axis = Ellipsis` — 5
  - `X`: `MovieScene3DPathSection_Axis = Ellipsis` — 0
  - `Y`: `MovieScene3DPathSection_Axis = Ellipsis` — 1
  - `Z`: `MovieScene3DPathSection_Axis = Ellipsis` — 2

### `unreal.MovieSceneScalabilityConditionGroup`
Inherits: `EnumBase` | Header: `MovieSceneScalabilityCondition.h`

The below is a bit hardcoded to try and match how scalability settings are set up in Scalability.h. This is because unfortunately scalability settings at their core are not very extensible or data-dri...

**Properties** (11):
  - `ANTI_ALIASING`: `MovieSceneScalabilityConditionGroup = Ellipsis` — 1
  - `EFFECTS`: `MovieSceneScalabilityConditionGroup = Ellipsis` — 7
  - `FOLIAGE`: `MovieSceneScalabilityConditionGroup = Ellipsis` — 8
  - `GLOBAL_ILLUMINATION`: `MovieSceneScalabilityConditionGroup = Ellipsis` — 3
  - `LANDSCAPE`: `MovieSceneScalabilityConditionGroup = Ellipsis` — 10
  - `POST_PROCESS`: `MovieSceneScalabilityConditionGroup = Ellipsis` — 5
  - `REFLECTION`: `MovieSceneScalabilityConditionGroup = Ellipsis` — 4
  - `SHADING`: `MovieSceneScalabilityConditionGroup = Ellipsis` — 9
  - `SHADOW`: `MovieSceneScalabilityConditionGroup = Ellipsis` — 2
  - `TEXTURE`: `MovieSceneScalabilityConditionGroup = Ellipsis` — 6
  - `VIEW_DISTANCE`: `MovieSceneScalabilityConditionGroup = Ellipsis` — 0

### `unreal.MovieSceneScalabilityConditionLevel`
Inherits: `EnumBase` | Header: `MovieSceneScalabilityCondition.h`

EMovie Scene Scalability Condition Level

**Properties** (5):
  - `CINEMATIC`: `MovieSceneScalabilityConditionLevel = Ellipsis` — 4
  - `EPIC`: `MovieSceneScalabilityConditionLevel = Ellipsis` — 3
  - `HIGH`: `MovieSceneScalabilityConditionLevel = Ellipsis` — 2
  - `LOW`: `MovieSceneScalabilityConditionLevel = Ellipsis` — 0
  - `MEDIUM`: `MovieSceneScalabilityConditionLevel = Ellipsis` — 1

### `unreal.MovieSceneScalabilityConditionOperator`
Inherits: `EnumBase` | Header: `MovieSceneScalabilityCondition.h`

EMovie Scene Scalability Condition Operator

**Properties** (5):
  - `EQUAL_TO`: `MovieSceneScalabilityConditionOperator = Ellipsis` — 2
  - `GREATER_THAN`: `MovieSceneScalabilityConditionOperator = Ellipsis` — 4
  - `GREATER_THAN_OR_EQUAL_TO`: `MovieSceneScalabilityConditionOperator = Ellipsis` — 3
  - `LESS_THAN`: `MovieSceneScalabilityConditionOperator = Ellipsis` — 0
  - `LESS_THAN_OR_EQUAL_TO`: `MovieSceneScalabilityConditionOperator = Ellipsis` — 1

### `unreal.ParticleKey`
Inherits: `EnumBase` | Header: `MovieSceneParticleSection.h`

Defines the types of particle keys.

**Properties** (3):
  - `ACTIVATE`: `ParticleKey = Ellipsis` — 0
  - `DEACTIVATE`: `ParticleKey = Ellipsis` — 1
  - `TRIGGER`: `ParticleKey = Ellipsis` — 2

### `unreal.Show3DTrajectory`
Inherits: `EnumBase` | Header: `MovieScene3DTransformSection.h`

Visibility options for 3d trajectory.

**Properties** (3):
  - `EST_ALWAYS`: `Show3DTrajectory = Ellipsis` — 1
  - `EST_NEVER`: `Show3DTrajectory = Ellipsis` — 2
  - `EST_ONLY_WHEN_SELECTED`: `Show3DTrajectory = Ellipsis` — 0

### `unreal.MovieSceneActorPredictionFailure`
Inherits: `MulticastDelegateBase` | Header: `MovieScenePredictionSystem.h`

Movie Scene Actor Prediction Failure Delegate Signature

### `unreal.MovieSceneActorPredictionResult`
Inherits: `MulticastDelegateBase` | Header: `MovieScenePredictionSystem.h`

namespace UE
