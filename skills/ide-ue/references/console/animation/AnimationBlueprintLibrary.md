# UE Python API — AnimationBlueprintLibrary Module

**8 types** from the `AnimationBlueprintLibrary` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimPose`, `AnimPoseEvaluationOptions`, `AnimationLibrary`, `AnimPoseExtensions`, `AnimDataEvalType`, `AnimPoseSpaces`, `OnNotifyReplaced`, `OnNotifyStateReplaced`

---

## Classes

### `unreal.AnimPose`
Inherits: `StructBase` | Header: `AnimPose.h`

Script friendly representation of an evaluated animation bone pose

**Methods** (13):
  - `evaluate_animation_blueprint_with_input_pose(target_skeletal_mesh, animation_blueprint)` -> `AnimPose` — Evaluates an Animation Blueprint instance, using the provided Anim Pose and its Input Pose value, generating a valid Ani...
  - `get_bone_names()` -> `Array [ Name ]` — Returns an array of bone names contained by the pose
  - `get_bone_pose(bone_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` — Retrieves the transform for the provided bone name from a pose
  - `get_curve_names()` -> `Array [ Name ]` — Returns an array of curve names contained by the pose
  - `get_curve_weight(curve_name)` -> `float` — Returns the weight of an evaluated curve - if found
  - `get_ref_bone_pose(bone_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` — Retrieves the reference pose transform for the provided bone name
  - `get_ref_pose_relative_transform(from_bone_name, to_bone_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` — Retrieves the relative transform for the reference pose between the two provided bone names
  - `get_relative_to_ref_pose_transform(bone_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` — Retrieves the relative transform between reference and animated bone transform
  - `get_relative_transform(from_bone_name, to_bone_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` — Retrieves the relative transform between the two provided bone names
  - `get_socket_names()` -> `Array [ Name ]` — Returns an array of socket names contained by the pose
  - `get_socket_pose(socket_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` — Retrieves the transform for the provided socket name from a pose
  - `is_valid()` -> `bool` — Returns whether the Anim Pose contains valid data
  - `set_bone_pose(transform, bone_name, space = AnimPoseSpaces.LOCAL)` -> `None` — Sets the transform for the provided bone name for a pose

### `unreal.AnimPoseEvaluationOptions`
Inherits: `StructBase` | Header: `AnimPose.h`

Anim Pose Evaluation Options

**Properties** (7):
  - `evaluate_curves`: `bool` — [Read-Write] Whether or not to evaluate Animation Curves (bool)
  - `evaluation_type`: `AnimDataEvalType` — [Read-Write] Type of evaluation which should be used (AnimDataEvalType)
  - `extract_root_motion`: `bool` — [Read-Write] Whether or not to extract root motion values (bool)
  - `incorporate_root_motion_into_pose`: `bool` — [Read-Write] Whether or not to force root motion being incorporated into retrieved pose (bool)
  - `optional_skeletal_mesh`: `SkeletalMesh` — [Read-Write] Optional skeletal mesh with proportions to use when evaluating a pose (SkeletalMesh)
  - `retrieve_additive_as_full_pose`: `bool` — [Read-Write] Whether or additive animations should be applied to their base-pose (bool)
  - `should_retarget`: `bool` — [Read-Write] Whether or not to retarget animation during evaluation (bool)

### `unreal.AnimationLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimationBlueprintLibrary.h`

Blueprint library for altering and analyzing animation / skeletal data

**Methods** (105):
  - `add_animation_notify_event(animation_sequence_base, notify_track_name, start_time, notify_class)` -> `AnimNotify` [classmethod] — Adds an Animation Notify Event to Notify track in the given Animation with the given Notify creation data
  - `add_animation_notify_event_object(animation_sequence_base, start_time, notify, notify_track_name)` -> `None` [classmethod] — Adds an the specific Animation Notify to the Animation Sequence (requires Notifyâs outer to be the Animation Sequence)
  - `add_animation_notify_state_event(animation_sequence_base, notify_track_name, start_time, duration, notify_state_class)` -> `AnimNotifyState` [classmethod] — Adds an Animation Notify State Event to Notify track in the given Animation with the given Notify State creation data
  - `add_animation_notify_state_event_object(animation_sequence_base, start_time, duration, notify_state, notify_track_name)` -> `None` [classmethod] — Adds an the specific Animation Notify State to the Animation Sequence (requires Notify Stateâs outer to be the Animati...
  - `add_animation_notify_track(animation_sequence_base, notify_track_name, track_color = [1.000000,1.000000,1.000000,1.000000])` -> `None` [classmethod] — Adds an Animation Notify Track to the Animation Sequence
  - `add_animation_sync_marker(animation_sequence, marker_name, time, notify_track_name)` -> `None` [classmethod] — Adds an Animation Sync Marker to Notify track in the given Animation with the corresponding Marker Name and Time
  - `add_curve(animation_sequence_base, curve_name, curve_type = RawCurveTrackTypes.RCT_FLOAT, meta_data_curve = False)` -> `None` [classmethod] — Adds an Animation Curve by Type and Name to the given Animation Sequence
  - `add_float_curve_key(animation_sequence_base, curve_name, time, value)` -> `None` [classmethod] — Adds a Float Key to the specified Animation Curve inside of the given Animation Sequence
  - `add_float_curve_keys(animation_sequence_base, curve_name, times, values)` -> `None` [classmethod] — Adds a multiple of Float Keys to the specified Animation Curve inside of the given Animation Sequence
  - `add_meta_data(animation_asset, meta_data_class)` -> `AnimMetaData` [classmethod] — Creates and Adds an instance of the specified MetaData Class to the given Animation Asset
  - `add_meta_data_object(animation_asset, meta_data_object)` -> `None` [classmethod] — Adds an instance of the specified MetaData Class to the given Animation Asset (requires MetaDataObjectâs outer to be t...
  - `add_node_asset_override(anim_blueprint, target, override, print_applied_overrides = False)` -> `None` [classmethod] — Adds an Animation Asset override for the provided AnimationBlueprint, replacing any instance of Target with Override
  - `add_transformation_curve_key(animation_sequence_base, curve_name, time, transform)` -> `None` [classmethod] — Adds a Transformation Key to the specified Animation Curve inside of the given Animation Sequence
  - `add_transformation_curve_keys(animation_sequence_base, curve_name, times, transforms)` -> `None` [classmethod] — Adds a multiple of Transformation Keys to the specified Animation Curve inside of the given Animation Sequence
  - `add_vector_curve_key(animation_sequence_base, curve_name, time, vector)` -> `None` [classmethod] — Adds a Vector Key to the specified Animation Curve inside of the given Animation Sequence
  - `add_vector_curve_keys(animation_sequence_base, curve_name, times, vectors)` -> `None` [classmethod] — Adds a multiple of Vector Keys to the specified Animation Curve inside of the given Animation Sequence
  - `add_virtual_bone(animation_sequence, source_bone_name, target_bone_name)` -> `Name` [classmethod] — Adds a Virtual Bone between the Source and Target Bones to the given Animation Sequence
  - `contains_meta_data_of_class(animation_asset, meta_data_class)` -> `bool` [classmethod] — Checks whether or not the given Animation Asset contains Meta Data Instance of the specified Meta Data Class
  - `copy_anim_notifies_from_sequence(source_animation_sequence_base, destination_animation_sequence_base, delete_existing_notifies = False)` -> `None` [classmethod] — Copies animation notifies from Src Animation Sequence to Dest. Creates anim notify tracks as necessary. Returns true on ...
  - `copy_animation_curve_names_to_skeleton(old_skeleton, new_skeleton, sequence_base, curve_type)` -> `None` [classmethod] — Ensures that any curve names that do not exist on the NewSkeleton are added to it, in which case the SmartName on the ac...
  - `does_bone_name_exist(animation_sequence, bone_name)` -> `bool` [classmethod] — Checks whether or not the given Bone Name exist on the Skeleton referenced by the given Animation Sequence
  - `does_curve_exist(animation_sequence_base, curve_name, curve_type)` -> `bool` [classmethod] — Checks whether or not the given Curve Name exist on the Skeleton referenced by the given Animation Sequence
  - `evaluate_bone_timecode_and_slate_attributes_at_time(bone_name, animation_sequence_base, eval_time)` -> `(out_qualified_frame_time=QualifiedTime, slate=str) or None` [classmethod] — Evaluates timecode attributes (e.g. âTCFrameâ, âTCSecondâ, etc.) and TCSlate of the root bone and returns the re...
  - `evaluate_root_bone_timecode_attributes_at_time(animation_sequence_base, eval_time)` -> `QualifiedTime or None` [classmethod] — Evaluates timecode attributes (e.g. âTCFrameâ, âTCSecondâ, etc.) of the root bone and returns the resulting qual...
  - `evaluate_root_bone_timecode_subframe_attribute_at_time(animation_sequence_base, eval_time)` -> `float or None` [classmethod] — Evaluates the subframe timecode attribute (e.g. âTCSubframeâ) of the root bone and returns the resulting value. Sinc...
  - `extract_root_track_transform(animation_sequence_base, time)` -> `Transform` [classmethod] — Gets the root transform from the raw animation at Time
  - `finalize_bone_animation(animation_sequence)` -> `None` [classmethod] — Finalize Bone Animation deprecated: FinalizeBoneAnimation has been deprecated, use UAnimDataController instead
  - `find_bone_path_to_root(animation_sequence_base, bone_name)` -> `Array [ Name ]` [classmethod] — Finds the Bone Path from the given Bone to the Root Bone
  - `get_additive_animation_type(animation_sequence)` -> `AdditiveAnimationType` [classmethod] — Retrieves the Additive Animation type for the given Animation Sequence
  - `get_additive_base_pose_type(animation_sequence)` -> `AdditiveBasePoseType` [classmethod] — Retrieves the Additive Base Pose type for the given Animation Sequence
  - `get_anim_notify_event_duration(notify_event)` -> `float` [classmethod] — Returns the duration for a NotifyEvent, only non-zero for Anim Notify States
  - `get_anim_notify_event_trigger_time(notify_event)` -> `float` [classmethod] — Returns the actual trigger time for a NotifyEvent
  - `get_animation_curve_names(animation_sequence_base, curve_type)` -> `Array [ Name ]` [classmethod] — Retrieves the Names of the individual float curves for the given Animation Sequence
  - `get_animation_graphs(animation_blueprint)` -> `Array [ AnimationGraph ]` [classmethod] — Returns all Animation Graphs contained by the provided Animation Blueprint
  - `get_animation_interpolation_type(animation_sequence)` -> `AnimInterpolationType` [classmethod] — Retrieves the Animation Interpolation type for the given Animation Sequence
  - `get_animation_notify_event_names(animation_sequence_base)` -> `Array [ Name ]` [classmethod] — Retrieves all Unique Animation Notify Events found within the given Animation Sequence
  - `get_animation_notify_events(animation_sequence_base)` -> `Array [ AnimNotifyEvent ]` [classmethod] — Retrieves all Animation Notify Events found within the given Animation Sequence
  - `get_animation_notify_events_for_track(animation_sequence_base, notify_track_name)` -> `Array [ AnimNotifyEvent ]` [classmethod] — Retrieves all Animation Notify Events for the given Notify Track Name from the given Animation Sequence
  - `get_animation_notify_track_names(animation_sequence_base)` -> `Array [ Name ]` [classmethod] — Retrieves all Unique Animation Notify Track Names found within the given Animation Sequence
  - `get_animation_sync_markers(animation_sequence)` -> `Array [ AnimSyncMarker ]` [classmethod] — Retrieves all the Animation Sync Markers for the given Animation Sequence
  - `get_animation_sync_markers_for_track(animation_sequence, notify_track_name)` -> `Array [ AnimSyncMarker ]` [classmethod] — Retrieves all Animation Sync Markers for the given Notify Track Name from the given Animation Sequence
  - `get_animation_track_names(animation_sequence_base)` -> `Array [ Name ]` [classmethod] — Retrieves the Names of the individual ATracks for the given Animation Sequence
  - `get_bone_compression_settings(animation_sequence)` -> `AnimBoneCompressionSettings` [classmethod] — Retrieves the Bone Compression Settings for the given Animation Sequence
  - `get_bone_pose_for_frame(animation_sequence_base, bone_name, frame, extract_root_motion)` -> `Transform` [classmethod] — Get Bone Pose for Frame
  - `get_bone_pose_for_time(animation_sequence_base, bone_name, time, extract_root_motion)` -> `Transform` [classmethod] — Get Bone Pose for Time
  - `get_bone_poses_for_frame(animation_sequence_base, bone_names, frame, extract_root_motion, preview_mesh = None)` -> `Array [ Transform ]` [classmethod] — Get Bone Poses for Frame
  - `get_bone_poses_for_time(animation_sequence_base, bone_names, time, extract_root_motion, preview_mesh = None)` -> `Array [ Transform ]` [classmethod] — Get Bone Poses for Time
  - `get_curve_compression_settings(animation_sequence)` -> `AnimCurveCompressionSettings` [classmethod] — Retrieves the Curve Compression Settings for the given Animation Sequence
  - `get_float_keys()` [classmethod] — Retrieves, a multiple of, Float Key(s) from the specified Animation Curve inside of the given Animation Sequence
  - `get_float_value_at_time(animation_sequence_base, curve_name, time)` -> `float` [classmethod] — Retrieves an evaluated float value for a given time from the specified Animation Curve inside of the given Animation Seq...
  - `get_frame_at_time(animation_sequence_base, time)` -> `int32` [classmethod] — Retrieves the Frame Index at the specified Time Value for the given Animation Sequence
  - `get_meta_data(animation_asset)` -> `Array [ AnimMetaData ]` [classmethod] — Retrieves all Meta Data Instances from the given Animation Asset
  - `get_meta_data_of_class(animation_asset, meta_data_class)` -> `Array [ AnimMetaData ]` [classmethod] — Retrieves all Meta Data Instances from the given Animation Asset
  - `get_montage_slot_names(animation_montage)` -> `Array [ Name ]` [classmethod] — Retrieves the Names of the Animation Slots used in the given Montage
  - `get_nodes_of_class(animation_blueprint, node_class, include_child_classes = True)` -> `Array [ AnimGraphNode_Base ]` [classmethod] — Returns all Animation Graph Nodes of the provided Node Class contained by the Animation Blueprint
  - `get_num_frames(animation_sequence_base)` -> `int32` [classmethod] — Retrieves the number of animation frames for the given Animation Sequence
  - `get_num_keys(animation_sequence_base)` -> `int32` [classmethod] — Retrieves the number of animation keys for the given Animation Sequence
  - `get_rate_scale(animation_sequence_base)` -> `float` [classmethod] — Retrieves the (Play) Rate Scale of the given Animation Sequence
  - `get_raw_track_data()` [classmethod] — Get Raw Track Data
  - `get_raw_track_position_data(animation_sequence_base, track_name)` -> `Array [ Vector ]` [classmethod] — Get Raw Track Position Data
  - `get_raw_track_rotation_data(animation_sequence_base, track_name)` -> `Array [ Quat ]` [classmethod] — Get Raw Track Rotation Data
  - `get_raw_track_scale_data(animation_sequence_base, track_name)` -> `Array [ Vector ]` [classmethod] — Get Raw Track Scale Data
  - `get_root_motion_lock_type(animation_sequence)` -> `RootMotionRootLock` [classmethod] — Retrieves the Root Motion Lock Type for the given Animation Sequence
  - `get_sequence_length(animation_sequence_base)` -> `float` [classmethod] — Retrieves the Length of the given Animation Sequence
  - `get_time_at_frame(animation_sequence_base, frame)` -> `float` [classmethod] — Retrieves the Time Value at the specified Frame Indexfor the given Animation Sequence
  - `get_transformation_keys()` [classmethod] — Retrieves, a multiple of, Transformation Key(s) from the specified Animation Curve inside of the given Animation Sequenc...
  - `get_unique_marker_names(animation_sequence)` -> `Array [ Name ]` [classmethod] — Retrieves all the Unique Names for the Animation Sync Markers contained by the given Animation Sequence
  - `get_variable_frame_stripping_settings(animation_sequence)` -> `VariableFrameStrippingSettings` [classmethod] — Retrieves the Variable Frame Stripping Settings for the given Animation Sequence
  - `get_vector_keys()` [classmethod] — Retrieves, a multiple of, Vector Key(s) from the specified Animation Curve inside of the given Animation Sequence
  - `is_root_motion_enabled(animation_sequence)` -> `bool` [classmethod] — Checks whether or not Root Motion is Enabled for the given Animation Sequence
  - `is_root_motion_lock_forced(animation_sequence)` -> `bool` [classmethod] — Checks whether or not Root Motion locking is Forced for the given Animation Sequence
  - `is_valid_anim_notify_track_name(animation_sequence_base, notify_track_name)` -> `bool` [classmethod] — Checks whether or not the given Track Name is a valid Animation Notify Track in the Animation Sequence
  - `is_valid_animation_sync_marker_name(animation_sequence, marker_name)` -> `bool` [classmethod] — Checks whether or not the given Marker Name is a valid Animation Sync Marker Name
  - `is_valid_raw_animation_track_name(animation_sequence_base, track_name)` -> `bool` [classmethod] — Checks whether or not the given Animation Track Name is contained within the Animation Sequence
  - `is_valid_time(animation_sequence_base, time)` -> `bool` [classmethod] — Checks whether or not the given Time Value lies within the given Animation Sequenceâs Length
  - `remove_all_animation_notify_tracks(animation_sequence_base)` -> `None` [classmethod] — Removes All Animation Notify Tracks from Animation Sequence
  - `remove_all_animation_sync_markers(animation_sequence)` -> `None` [classmethod] — Removes All Animation Sync Markers found within the Animation Sequence, and returns the number of removed instances
  - `remove_all_bone_animation(animation_sequence)` -> `None` [classmethod] — Removes all Animation Bone Track Data from the given Animation Sequence
  - `remove_all_curve_data(animation_sequence_base)` -> `None` [classmethod] — Removes all Animation Curve Data from the given Animation Sequence (Raw Animation Curves [Names] may not be removed from...
  - `remove_all_meta_data(animation_asset)` -> `None` [classmethod] — Removes all Meta Data from the given Animation Asset
  - `remove_all_virtual_bones(animation_sequence)` -> `None` [classmethod] — Removes all Virtual Bones from the given Animation Sequence
  - `remove_animation_notify_events_by_name(animation_sequence_base, notify_name)` -> `int32` [classmethod] — Removes Animation Notify Events found by Name within the Animation Sequence, and returns the number of removed name inst...
  - `remove_animation_notify_events_by_track(animation_sequence_base, notify_track_name)` -> `int32` [classmethod] — Removes Animation Notify Events found by Track within the Animation Sequence, and returns the number of removed name ins...
  - `remove_animation_notify_track(animation_sequence_base, notify_track_name)` -> `None` [classmethod] — Removes an Animation Notify Track from Animation Sequence by Name
  - `remove_animation_sync_markers_by_name(animation_sequence, marker_name)` -> `int32` [classmethod] — Removes All Animation Sync Marker found within the Animation Sequence whose name matches MarkerName, and returns the num...
  - `remove_animation_sync_markers_by_track(animation_sequence, notify_track_name)` -> `int32` [classmethod] — Removes All Animation Sync Marker found within the Animation Sequence that belong to the specific Notify Track, and retu...
  - `remove_bone_animation(animation_sequence, bone_name, include_children = True, finalize = True)` -> `None` [classmethod] — Removes an Animation Curve by Name from the given Animation Sequence (Raw Animation Curves [Names] may not be removed fr...
  - `remove_bone_selective_animation(animation_sequence, bone_name, children_excluded, include_children = True, exclude_recursively = False, finalize = True)` -> `None` [classmethod] — Removes an Animation Curve by Name from the given Animation Sequence (Raw Animation Curves [Names] may not be removed fr...
  - `remove_curve(animation_sequence_base, curve_name, remove_name_from_skeleton = False)` -> `None` [classmethod] — Removes an Animation Curve by Name from the given Animation Sequence (Raw Animation Curves [Names] may not be removed fr...
  - `remove_meta_data(animation_asset, meta_data_object)` -> `None` [classmethod] — Removes the specified Meta Data Instance from the given Animation Asset
  - `remove_meta_data_of_class(animation_asset, meta_data_class)` -> `None` [classmethod] — Removes all Meta Data Instance of the specified Class from the given Animation Asset
  - `remove_virtual_bone(animation_sequence, virtual_bone_name)` -> `None` [classmethod] — Removes a Virtual Bone with the specified Bone Name from the given Animation Sequence
  - `remove_virtual_bones(animation_sequence, virtual_bone_names)` -> `None` [classmethod] — Removes Virtual Bones with the specified Bone Names from the given Animation Sequence
  - `replace_anim_notifies(animation_sequence_base, old_notify_class, new_notify_class, on_notify_replaced)` -> `None` [classmethod] — Replaces animation notifies in the specified Animation Sequence
  - `replace_anim_notify_states(animation_sequence_base, old_notify_class, new_notify_class, on_notify_state_replaced)` -> `None` [classmethod] — Replaces animation notifies in the specified Animation Sequence
  - `set_additive_animation_type(animation_sequence, additive_animation_type)` -> `None` [classmethod] — Sets the Additive Animation type for the given Animation Sequence
  - `set_additive_base_pose_type(animation_sequence, additive_base_pose_type)` -> `None` [classmethod] — Sets the Additive Base Pose type for the given Animation Sequence
  - `set_animation_interpolation_type(animation_sequence, interpolation_type)` -> `None` [classmethod] — Sets the Animation Interpolation type for the given Animation Sequence
  - `set_bone_compression_settings(animation_sequence, compression_settings)` -> `None` [classmethod] — Sets the Bone Compression Settings for the given Animation Sequence
  - `set_curve_compression_settings(animation_sequence, compression_settings)` -> `None` [classmethod] — Sets the Curve Compression Settings for the given Animation Sequence
  - `set_is_root_motion_lock_forced(animation_sequence, forced)` -> `None` [classmethod] — Sets whether or not Root Motion locking is Forced for the given Animation Sequence
  - `set_rate_scale(animation_sequence_base, rate_scale)` -> `None` [classmethod] — Sets the (Play) Rate Scale for the given Animation Sequence
  - `set_root_motion_enabled(animation_sequence, enabled)` -> `None` [classmethod] — Sets whether or not Root Motion is Enabled for the given Animation Sequence
  - `set_root_motion_lock_type(animation_sequence, root_motion_lock_type)` -> `None` [classmethod] — Sets the Root Motion Lock Type for the given Animation Sequence
  - `set_variable_frame_stripping_settings(animation_sequence, variable_frame_stripping_settings)` -> `None` [classmethod] — Sets the Variable Frame Stripping Settings for the given Animation Sequence

### `unreal.AnimPoseExtensions`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimPose.h`

Script exposed functionality for populating, retrieving data from and setting data on FAnimPose

**Methods** (16):
  - `evaluate_animation_blueprint_with_input_pose(input_pose, target_skeletal_mesh, animation_blueprint)` -> `AnimPose` [classmethod] — Evaluates an Animation Blueprint instance, using the provided Anim Pose and its Input Pose value, generating a valid Ani...
  - `get_anim_pose_at_frame(animation_sequence_base, frame_index, evaluation_options)` -> `AnimPose` [classmethod] — Evaluates an Animation Sequence Base to generate a valid Anim Pose instance
  - `get_anim_pose_at_time(animation_sequence_base, time, evaluation_options)` -> `AnimPose` [classmethod] — Evaluates an Animation Sequence Base to generate a valid Anim Pose instance
  - `get_bone_names(pose)` -> `Array [ Name ]` [classmethod] — Returns an array of bone names contained by the pose
  - `get_bone_pose(pose, bone_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` [classmethod] — Retrieves the transform for the provided bone name from a pose
  - `get_curve_names(pose)` -> `Array [ Name ]` [classmethod] — Returns an array of curve names contained by the pose
  - `get_curve_weight(pose, curve_name)` -> `float` [classmethod] — Returns the weight of an evaluated curve - if found
  - `get_ref_bone_pose(pose, bone_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` [classmethod] — Retrieves the reference pose transform for the provided bone name
  - `get_ref_pose_relative_transform(pose, from_bone_name, to_bone_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` [classmethod] — Retrieves the relative transform for the reference pose between the two provided bone names
  - `get_reference_pose(skeleton)` -> `AnimPose` [classmethod] — Populates an Anim Pose with the reference poses stored for the provided USkeleton
  - `get_relative_to_ref_pose_transform(pose, bone_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` [classmethod] — Retrieves the relative transform between reference and animated bone transform
  - `get_relative_transform(pose, from_bone_name, to_bone_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` [classmethod] — Retrieves the relative transform between the two provided bone names
  - `get_socket_names(pose)` -> `Array [ Name ]` [classmethod] — Returns an array of socket names contained by the pose
  - `get_socket_pose(pose, socket_name, space = AnimPoseSpaces.LOCAL)` -> `Transform` [classmethod] — Retrieves the transform for the provided socket name from a pose
  - `is_valid(pose)` -> `bool` [classmethod] — Returns whether the Anim Pose contains valid data
  - `set_bone_pose(pose, transform, bone_name, space = AnimPoseSpaces.LOCAL)` -> `AnimPose` [classmethod] — Sets the transform for the provided bone name for a pose

### `unreal.AnimDataEvalType`
Inherits: `EnumBase` | Header: `AnimPose.h`

EAnim Data Eval Type

**Properties** (3):
  - `COMPRESSED`: `AnimDataEvalType = Ellipsis` — Evaluates the compressed Animation data - matching runtime (cooked) 2
  - `RAW`: `AnimDataEvalType = Ellipsis` — Evaluates the original Animation Source data with additive animation layers 1
  - `SOURCE`: `AnimDataEvalType = Ellipsis` — Evaluates the original Animation Source data 0

### `unreal.AnimPoseSpaces`
Inherits: `EnumBase` | Header: `AnimPose.h`

EAnim Pose Spaces

**Properties** (2):
  - `LOCAL`: `AnimPoseSpaces = Ellipsis` — Local (bone) space 0
  - `WORLD`: `AnimPoseSpaces = Ellipsis` — World (component) space 1

### `unreal.OnNotifyReplaced`
Inherits: `DelegateBase` | Header: `AnimationBlueprintLibrary.h`

Delegate called when a notify was replaced

### `unreal.OnNotifyStateReplaced`
Inherits: `DelegateBase` | Header: `AnimationBlueprintLibrary.h`

Delegate called when a notify state was replaced
