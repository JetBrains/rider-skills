# UE Python API — GameplayCameras Module

**79 types** from the `GameplayCameras` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BaseCameraObjectReference`, `BlueprintCameraDirectorEvaluationParams`, `BlueprintCameraEvaluationDataRef`, `BlueprintCameraPose`, `BooleanCameraParameter`, `CameraActorAttachmentInfo`, `CameraActorTargetInfo`, `CameraAssetReference`, `CameraContextDataID`, `CameraDirectorStateTreeEvaluationData`, `CameraFramingZone`, `CameraRigAssetReference`, `CameraRigInstanceID`, `CameraShakeAssetReference`, `CameraVariableSetterHandle`, `DoubleCameraParameter`, `FloatCameraParameter`, `Integer32CameraParameter`, `Rotator3dCameraParameter`, `Rotator3fCameraParameter`, ... (79 total)

---

## Classes

### `unreal.BaseCameraObjectReference`
Inherits: `StructBase` | Header: `BaseCameraObjectReference.h`

Base Camera Object Reference

### `unreal.BlueprintCameraDirectorEvaluationParams`
Inherits: `StructBase` | Header: `BlueprintCameraDirector.h`

Blueprint Camera Director Evaluation Params

**Properties** (2):
  - `delta_time`: `float` — [Read-Write] The elapsed time since the last evaluation. (float)
  - `evaluation_context_owner`: `Object` — [Read-Write] The owner (if any) of the evaluation context we are running inside of. (Object)

### `unreal.BlueprintCameraEvaluationDataRef`
Inherits: `StructBase` | Header: `BlueprintCameraEvaluationDataRef.h`

Blueprint wrapper for camera evaluation data.

### `unreal.BlueprintCameraPose`
Inherits: `StructBase` | Header: `BlueprintCameraPose.h`

Represents a camera pose.

**Properties** (23):
  - `aperture`: `float` — [Read-Write] The aperture (f-stop) of the cameraâs lens. (float)
  - `aspect_ratio_axis_constraint`: `AspectRatioAxisConstraint` — [Read-Write] The aspect ratio axis constraint to use if aspect ratio is constrained. (AspectRatioAxi...
  - `constrain_aspect_ratio`: `bool` — [Read-Write] Whether the camera should constrain aspect ratio. (bool)
  - `diaphragm_blade_count`: `int` — [Read-Write] Number of blades in the lens diaphragm (int32)
  - `enable_physical_camera`: `bool` — [Read-Write] Whether to setup post-process settings based on physical camera properties such as Aper...
  - `far_clipping_plane`: `float` — [Read-Write] The cameraâs far clipping plane. (float)
  - `field_of_view`: `float` — [Read-Write] The field of view of the camera. May be negative if driven by focal length. (float)
  - `focal_length`: `float` — [Read-Write] The focal length of the camera. May be negative if driven directly by field of view. (f...
  - `focus_distance`: `float` — [Read-Write] The focus distance of the camera, if different from target distance. (float)
  - `iso`: `float` — [Read-Write] The camera sensor sensitivity in ISO. (float)
  - `location`: `Vector` — [Read-Write] The location of the camera. (Vector)
  - `near_clipping_plane`: `float` — [Read-Write] The cameraâs near clipping plane. (float)
  - `orthographic_width`: `float` — [Read-Write] The desired width (in world units) of the orthographic view (ignored in Perspective mod...
  - `overscan`: `float` — [Read-Write] Sensor overscan in percentage (float)
  - `projection_mode`: `CameraProjectionMode` — [Read-Write] Projection mode - Perspective or orthographic (CameraProjectionMode)
  - `rotation`: `Rotator` — [Read-Write] The rotation of the camera. (Rotator)
  - `sensor_height`: `float` — [Read-Write] The height of the cameraâs sensor. (float)
  - `sensor_horizontal_offset`: `float` — [Read-Write] Horizontal offset of the sensor, in mm. (float)
  - `sensor_vertical_offset`: `float` — [Read-Write] Vertical offset of the sensor, in mm. (float)
  - `sensor_width`: `float` — [Read-Write] The width of the cameraâs sensor. (float)
  - `shutter_speed`: `float` — [Read-Write] The shutter speed of the cameraâs lens, in 1/seconds (float)
  - `squeeze_factor`: `float` — [Read-Write] The squeeze factor of the cameraâs lens. (float)
  - `target_distance`: `float` — [Read-Write] The distance of the target of the camera. (double)

### `unreal.BooleanCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Boolean camera parameter.

**Properties** (1):
  - `value`: `bool` — [Read-Write] (bool)

### `unreal.CameraActorAttachmentInfo`
Inherits: `StructBase` | Header: `CameraActorAttachmentInfo.h`

Attachment information for a camera rig.

**Properties** (4):
  - `actor`: `Actor` — [Read-Write] The actor to attach to. (Actor)
  - `bone_name`: `Name` — [Read-Write] An optional bone to attach to on the actor. (Name)
  - `socket_name`: `Name` — [Read-Write] An optional socket to attach to on the actor. (Name)
  - `weight`: `float` — [Read-Write] The weight of this attachment. Unused if only one attachment is used. (float)

### `unreal.CameraActorTargetInfo`
Inherits: `StructBase` | Header: `CameraActorTargetInfo.h`

Targeting information for a camera rig.

**Properties** (6):
  - `actor`: `Actor` — [Read-Write] The actor to target. (Actor)
  - `bone_name`: `Name` — [Read-Write] An optional bone to target on the actor. (Name)
  - `socket_name`: `Name` — [Read-Write] An optional socket to target on the actor. (Name)
  - `target_shape`: `CameraTargetShape` — [Read-Write] Specifies the shape of the target. (CameraTargetShape)
  - `target_size`: `float` — [Read-Write] Specifies the size of target. Only used if TargetShape is set to manual bounds. (float)
  - `weight`: `float` — [Read-Write] The weight of this target. Unused when only one target is used. (float)

### `unreal.CameraAssetReference`
Inherits: `StructBase` | Header: `CameraAssetReference.h`

A structure holding a reference to a camera asset, along with the interface parameter override values for any of its camera rigs.

### `unreal.CameraContextDataID`
Inherits: `StructBase` | Header: `CameraContextDataTableFwd.h`

The ID of a context data, used to refer to it in a camera context data table.

### `unreal.CameraDirectorStateTreeEvaluationData`
Inherits: `StructBase` | Header: `CameraDirectorStateTreeSchema.h`

The evaluation data for the StateTree camera director.

### `unreal.CameraFramingZone`
Inherits: `StructBase` | Header: `CameraFramingZone.h`

A structure that defines a zone for use in framing subjects in screen-space.

**Properties** (4):
  - `bottom`: `float` — [Read-Write] (double)
  - `left`: `float` — [Read-Write] (double)
  - `right`: `float` — [Read-Write] (double)
  - `top`: `float` — [Read-Write] (double)

### `unreal.CameraRigAssetReference`
Inherits: `BaseCameraObjectReference` | Header: `CameraRigAssetReference.h`

A structure holding a reference to a camera rig asset, along with the interface parameter override values.

### `unreal.CameraRigInstanceID`
Inherits: `StructBase` | Header: `CameraRigInstanceID.h`

A unique instance ID for a running, or previously running, camera rig.

### `unreal.CameraShakeAssetReference`
Inherits: `BaseCameraObjectReference` | Header: `CameraShakeAssetReference.h`

A structure holding a reference to a camera shake asset, along with the interface parameter override values.

### `unreal.CameraVariableSetterHandle`
Inherits: `StructBase` | Header: `CameraVariableSetter.h`

A handle to an ongoing camera variable setter.

### `unreal.DoubleCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Double camera parameter.

**Properties** (1):
  - `value`: `float` — [Read-Write] (double)

### `unreal.FloatCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Float camera parameter.

**Properties** (1):
  - `value`: `float` — [Read-Write] (float)

### `unreal.Integer32CameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Integer camera parameter.

**Properties** (1):
  - `value`: `int` — [Read-Write] (int32)

### `unreal.Rotator3dCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Rotator3d camera parameter.

**Properties** (1):
  - `value`: `Rotator` — [Read-Write] (Rotator)

### `unreal.Rotator3fCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Rotator3f camera parameter.

**Properties** (1):
  - `value`: `Rotator3f` — [Read-Write] (Rotator3f)

### `unreal.Transform3dCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Transform3d camera parameter.

**Properties** (1):
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.Transform3fCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Transform3f camera parameter.

**Properties** (1):
  - `value`: `Transform3f` — [Read-Write] (Transform3f)

### `unreal.Vector2dCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Vector2d camera parameter.

**Properties** (1):
  - `value`: `Vector2D` — [Read-Write] (Vector2D)

### `unreal.Vector2fCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Vector2f camera parameter.

**Properties** (1):
  - `value`: `Vector2f` — [Read-Write] (Vector2f)

### `unreal.Vector3dCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Vector3d camera parameter.

**Properties** (1):
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.Vector3fCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Vector3f camera parameter.

**Properties** (1):
  - `value`: `Vector3f` — [Read-Write] (Vector3f)

### `unreal.Vector4dCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Vector4d camera parameter.

**Properties** (1):
  - `value`: `Vector4` — [Read-Write] (Vector4)

### `unreal.Vector4fCameraParameter`
Inherits: `StructBase` | Header: `CameraParameters.h`

Vector4f camera parameter.

**Properties** (1):
  - `value`: `Vector4f` — [Read-Write] (Vector4f)

### `unreal.ActivateCameraRigFunctions`
Inherits: `BlueprintFunctionLibrary` | Header: `ActivateCameraRigFunctions.h`

Blueprint functions for activating camera rigs in the base/global/visual layers.

**Methods** (6):
  - `activate_base_camera_rig(world_context_object: Object, player_controller: PlayerController, camera_rig: CameraRigAsset)` -> `None` [classmethod] — deprecated: âactivate_base_camera_rigâ was renamed to âactivate_persistent_base_camera_rigâ.
  - `activate_global_camera_rig(world_context_object: Object, player_controller: PlayerController, camera_rig: CameraRigAsset)` -> `None` [classmethod] — deprecated: âactivate_global_camera_rigâ was renamed to âactivate_persistent_global_camera_rigâ.
  - `activate_persistent_base_camera_rig(world_context_object, player_controller, camera_rig)` -> `None` [classmethod] — Activates the given camera rig prefab in the base layer.
  - `activate_persistent_global_camera_rig(world_context_object, player_controller, camera_rig)` -> `None` [classmethod] — Activates the given camera rig prefab in the global layer.
  - `activate_persistent_visual_camera_rig(world_context_object, player_controller, camera_rig)` -> `None` [classmethod] — Activates the given camera rig prefab in the visual layer.
  - `activate_visual_camera_rig(world_context_object: Object, player_controller: PlayerController, camera_rig: CameraRigAsset)` -> `None` [classmethod] — deprecated: âactivate_visual_camera_rigâ was renamed to âactivate_persistent_visual_camera_rigâ.

### `unreal.BaseCameraObject`
Inherits: `Object` | Header: `BaseCameraObject.h`

Base Camera Object

### `unreal.BlueprintCameraContextDataTableFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlueprintCameraEvaluationDataRef.h`

Utility Blueprint functions for camera context data tables.

**Methods** (12):
  - `get_class_data(camera_data, data_id)` [classmethod] — Gets a value from the given camera context data table.
  - `get_enum_data(camera_data, data_id, enum_type)` -> `uint8` [classmethod] — Gets a value from the given camera context data table.
  - `get_name_data(camera_data, data_id)` -> `Name` [classmethod] — Gets a value from the given camera context data table.
  - `get_object_data(camera_data, data_id)` -> `Object` [classmethod] — Gets a value from the given camera context data table.
  - `get_string_data(camera_data, data_id)` -> `str` [classmethod] — Gets a value from the given camera context data table.
  - `get_struct_data(camera_data, data_id, data_struct_type)` -> `InstancedStruct` [classmethod] — Gets a value from the given camera context data table.
  - `set_class_data(camera_data, data_id, data)` -> `bool` [classmethod] — Sets a value in the given camera context data table.
  - `set_enum_data(camera_data, data_id, enum_type, data)` -> `bool` [classmethod] — Sets a value in the given camera context data table.
  - `set_name_data(camera_data, data_id, data)` -> `bool` [classmethod] — Sets a value in the given camera context data table.
  - `set_object_data(camera_data, data_id, data)` -> `bool` [classmethod] — Sets a value in the given camera context data table.
  - `set_string_data(camera_data, data_id, data)` -> `bool` [classmethod] — Sets a value in the given camera context data table.
  - `set_struct_data(camera_data, data_id, data)` -> `bool` [classmethod] — Sets a value in the given camera context data table.

### `unreal.BlueprintCameraDirectorEvaluator`
Inherits: `Object` | Header: `BlueprintCameraDirector.h`

Base class for a Blueprint camera director evaluator.

**Methods** (18):
  - `activate_camera_director(evaluation_context_owner)` -> `None` — Override this method in Blueprint to execute custom logic when this camera director gets activated.
  - `activate_camera_rig(camera_rig, force_new_instance = False)` -> `None` — Specifies a camera rig to be active this frame.
  - `activate_camera_rig_prefab(camera_rig: CameraRigAsset, force_new_instance: bool = False)` -> `None` — deprecated: âactivate_camera_rig_prefabâ was renamed to âactivate_camera_rigâ.
  - `activate_camera_rig_via_proxy(camera_rig_proxy, force_new_instance = False)` -> `None` — Specifies a camera rig to be active this frame, via a proxy which is later resolved via the proxy table of the Blueprint...
  - `activate_persistent_base_camera_rig(camera_rig_prefab)` -> `None` — Activates the given camera rig prefab in the base layer.
  - `activate_persistent_global_camera_rig(camera_rig_prefab)` -> `None` — Activates the given camera rig prefab in the global layer.
  - `activate_persistent_visual_camera_rig(camera_rig_prefab)` -> `None` — Activates the given camera rig prefab in the visual layer.
  - `add_child_evaluation_context(child_evaluation_context_owner)` -> `Name` — Add Child Evaluation Context
  - `deactivate_camera_director(evaluation_context_owner)` -> `None` — Override this method in Blueprint to execute custom logic when this camera director gets deactivated.
  - `deactivate_persistent_base_camera_rig(camera_rig_prefab)` -> `None` — Deactivates the given camera rig prefab in the base layer.
  - `deactivate_persistent_global_camera_rig(camera_rig_prefab)` -> `None` — Deactivates the given camera rig prefab in the global layer.
  - `deactivate_persistent_visual_camera_rig(camera_rig_prefab)` -> `None` — Deactivates the given camera rig prefab in the visual layer.
  - `find_evaluation_context_owner_actor(actor_class)` -> `Actor` — A utility function that tries to find if an actor owns the evaluation context. Handles the situation where the evaluatio...
  - `get_conditional_context_result(condition)` -> `BlueprintCameraEvaluationDataRef` — Gets the evaluation context data for a sub-set of camera rigs.
  - `get_initial_context_result()` -> `BlueprintCameraEvaluationDataRef` — Gets the shared evaluation context data.
  - `remove_child_evaluation_context(child_evaluation_context_owner, child_slot_name)` -> `bool` — Remove Child Evaluation Context
  - `run_camera_director(delta_time, evaluation_context_owner, params)` -> `None`
  - `run_child_camera_director(delta_time, child_slot_name)` -> `bool` — Run Child Camera Director

### `unreal.BlueprintCameraEvaluationDataFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlueprintCameraEvaluationDataRef.h`

Blueprint function library for camera evaluation data references.

**Methods** (5):
  - `blend_camera_evaluation_data(from_camera_data, to_camera_data, factor)` -> `None` [classmethod] — Interpolates one camera data towards another.
  - `get_camera_pose(camera_data)` -> `BlueprintCameraPose` [classmethod] — Gets the camera pose.
  - `make_camera_evaluation_data()` -> `BlueprintCameraEvaluationDataRef` [classmethod] — Creates a camera evaluation data.
  - `set_camera_pose(camera_data, camera_pose)` -> `None` [classmethod] — Sets the camera pose.
  - `set_default_camera_rig_parameters(camera_data, camera_rig)` -> `None` [classmethod] — Sets the default values for all parameters in the given camera rig.

### `unreal.BlueprintCameraNodeEvaluator`
Inherits: `Object` | Header: `BlueprintCameraNode.h`

The base class for Blueprint camera node evaluators.

**Methods** (6):
  - `find_evaluation_context_owner_actor(actor_class)` -> `Actor` — A utility function that tries to find if an actor owns the evaluation context. Handles the situation where the evaluatio...
  - `get_current_camera_pose()` -> `BlueprintCameraPose` — A utility function to get the current camera pose from this nodeâs camera data.
  - `initialize_camera_node()` -> `None` — Initialize Camera Node
  - `set_current_camera_pose(camera_pose)` -> `None` — A utility function to set the current camera pose on this nodeâs camera data.
  - `set_default_owning_camera_rig_parameters(target_camera_data)` -> `None` — Assigns the default parameter values of the owning camera rig to the given camera evaluation data.
  - `tick_camera_node(delta_time)` -> `None` — The main execution callback for the camera node. Call SetCameraPose to affect the result.

**Properties** (3):
  - `camera_data`: `BlueprintCameraEvaluationDataRef` [Read-Only] — [Read-Only] The input/output camera data for this frame. (BlueprintCameraEvaluationDataRef)
  - `evaluation_context_owner`: `Object` [Read-Only] — [Read-Only] The owner object of this camera nodeâs evaluation context. (Object)
  - `is_first_frame`: `bool` [Read-Only] — [Read-Only] Whether this is the first frame of this camera nodeâs lifetime. (bool)

### `unreal.BlueprintCameraPoseFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlueprintCameraPose.h`

Utility Blueprint functions for camera poses.

**Methods** (10):
  - `get_aim_dir(camera_pose)` -> `Vector` [classmethod] — Gets the facing direction of the camera pose.
  - `get_aim_ray(camera_pose)` -> `Ray` [classmethod] — Gets the aim ray of the camera pose.
  - `get_effective_field_of_view(camera_pose)` -> `double` [classmethod] — Gets the effective field of view of the camera pose, possibly computed from focal length.
  - `get_sensor_aspect_ratio(camera_pose)` -> `double` [classmethod] — Gets the effective aspect ratio of the camera pose, computed from the sensor size.
  - `get_target(camera_pose)` -> `Vector` [classmethod] — Gets the target of the camera pose.
  - `get_target_at_distance(camera_pose, target_distance)` -> `Vector` [classmethod] — Gets the target of the camera pose given a specific target distance.
  - `get_transform(camera_pose)` -> `Transform` [classmethod] — Gets the transform matrix of the camera pose.
  - `make_camera_pose_from_camera_component(camera_component)` -> `BlueprintCameraPose` [classmethod] — Creates a new camera pose given a camera component.
  - `make_camera_pose_from_cine_camera_component(camera_component)` -> `BlueprintCameraPose` [classmethod] — Creates a new camera pose given a cine-camera component.
  - `set_transform(camera_pose, transform)` -> `BlueprintCameraPose` [classmethod] — Creates a copy of the given camera pose with the given location and rotation.

### `unreal.BlueprintCameraVariableTableFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlueprintCameraEvaluationDataRef.h`

Blueprint function library for camera variable tables.

**Methods** (18):
  - `get_boolean_camera_variable(camera_data, variable)` -> `bool` [classmethod] — Gets a camera variableâs value from the given table.
  - `get_double_camera_variable(camera_data, variable)` -> `double` [classmethod] — Gets a camera variableâs value from the given table.
  - `get_float_camera_variable(camera_data, variable)` -> `float` [classmethod] — Gets a camera variableâs value from the given table.
  - `get_integer32_camera_variable(camera_data, variable)` -> `int32` [classmethod] — Gets a camera variableâs value from the given table.
  - `get_rotator_camera_variable(camera_data, variable)` -> `Rotator` [classmethod] — Gets a camera variableâs value from the given table.
  - `get_transform_camera_variable(camera_data, variable)` -> `Transform` [classmethod] — Gets a camera variableâs value from the given table.
  - `get_vector2_camera_variable(camera_data, variable)` -> `Vector2D` [classmethod] — Gets a camera variableâs value from the given table.
  - `get_vector3_camera_variable(camera_data, variable)` -> `Vector` [classmethod] — Gets a camera variableâs value from the given table.
  - `get_vector4_camera_variable(camera_data, variable)` -> `Vector4` [classmethod] — Gets a camera variableâs value from the given table.
  - `set_boolean_camera_variable(camera_data, variable, value)` -> `None` [classmethod] — Sets a camera variableâs value in the given table.
  - `set_double_camera_variable(camera_data, variable, value)` -> `None` [classmethod] — Sets a camera variableâs value in the given table.
  - `set_float_camera_variable(camera_data, variable, value)` -> `None` [classmethod] — Sets a camera variableâs value in the given table.
  - `set_integer32_camera_variable(camera_data, variable, value)` -> `None` [classmethod] — Sets a camera variableâs value in the given table.
  - `set_rotator_camera_variable(camera_data, variable, value)` -> `None` [classmethod] — Sets a camera variableâs value in the given table.
  - `set_transform_camera_variable(camera_data, variable, value)` -> `None` [classmethod] — Sets a camera variableâs value in the given table.
  - `set_vector2_camera_variable(camera_data, variable, value)` -> `None` [classmethod] — Sets a camera variableâs value in the given table.
  - `set_vector3_camera_variable(camera_data, variable, value)` -> `None` [classmethod] — Sets a camera variableâs value in the given table.
  - `set_vector4_camera_variable(camera_data, variable, value)` -> `None` [classmethod] — Sets a camera variableâs value in the given table.

### `unreal.BooleanCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Boolean camera variable.

### `unreal.CameraAsset`
Inherits: `Object` | Header: `CameraAsset.h`

A complete camera asset.

### `unreal.CameraDirectorStateTreeSchema`
Inherits: `StateTreeSchema` | Header: `CameraDirectorStateTreeSchema.h`

The schema of the StateTree for a StateTree camera director.

### `unreal.CameraRigAsset`
Inherits: `BaseCameraObject` | Header: `CameraRigAsset.h`

A camera rig asset, which runs a hierarchy of camera nodes to drive the behavior of a camera.

**Methods** (3):
  - `has_all_matching_gameplay_tags(tag_container)` -> `bool` — Check if the asset has gameplay tags that matches against all of the specified tags (expands to include parents of asset...
  - `has_any_matching_gameplay_tags(tag_container)` -> `bool` — Check if the asset has gameplay tags that matches against any of the specified tags (expands to include parents of asset...
  - `has_matching_gameplay_tag(tag_to_check)` -> `bool` — Check if the asset has a gameplay tag that matches against the specified tag (expands to include parents of asset tags)

### `unreal.CameraRigInstanceFunctions`
Inherits: `BlueprintFunctionLibrary` | Header: `CameraRigInstanceID.h`

Blueprint functions for camera rig instance IDs.

**Methods** (1):
  - `is_valid(instance_id)` -> `bool` [classmethod] — Whether the given camera rig instance ID is valid. A valid ID doesnât necessarily correspond to a camera rig instance ...

### `unreal.CameraRigProxyAsset`
Inherits: `Object` | Header: `CameraRigProxyAsset.h`

A proxy for a camera rig asset.

### `unreal.CameraShakeAsset`
Inherits: `BaseCameraObject` | Header: `CameraShakeAsset.h`

Camera Shake Asset

### `unreal.CameraVariableAsset`
Inherits: `Object` | Header: `CameraVariableAssets.h`

The base asset class for all camera variables.

### `unreal.ControllerGameplayCameraEvaluationComponent`
Inherits: `ActorComponent` | Header: `ControllerGameplayCameraEvaluationComponent.h`

A component, attached to a player controller, that can run camera rigs activated from a global place like the Blueprint functions inside UActivateCameraRigFunctions.

### `unreal.DoubleCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Double camera variable.

### `unreal.FloatCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Float camera variable.

### `unreal.GameplayCameraActor`
Inherits: `GameplayCameraActorBase` | Header: `GameplayCameraActor.h`

An actor that can run a camera asset.

**Properties** (1):
  - `camera_component`: `GameplayCameraComponent` [Read-Only] — [Read-Only] (GameplayCameraComponent)

### `unreal.GameplayCameraActorBase`
Inherits: `Actor` | Header: `GameplayCameraActorBase.h`

A base class for actors that can run a camera object.

### `unreal.GameplayCameraComponent`
Inherits: `GameplayCameraComponentBase` | Header: `GameplayCameraComponent.h`

A component that can run a camera asset inside its own camera evaluation context.

**Properties** (1):
  - `camera_reference`: `CameraAssetReference` — [Read-Write] The camera asset to run. (CameraAssetReference)

### `unreal.GameplayCameraComponentBase`
Inherits: `SceneComponent` | Header: `GameplayCameraComponentBase.h`

A component that can run a camera asset inside its own camera evaluation context.

**Methods** (5):
  - `activate_camera_for_player_controller(player_controller, set_as_view_target = True, activation_mode = GameplayCameraComponentActivationMode.PUSH)` -> `None` — Activates the camera for the given player.
  - `activate_camera_for_player_index(player_index, set_as_view_target = True, activation_mode = GameplayCameraComponentActivationMode.PUSH)` -> `None` — Activates the camera for the given player.
  - `deactivate_camera(immediately = False)` -> `None` — Deactivates the camera.
  - `get_conditional_result(condition)` -> `BlueprintCameraEvaluationDataRef` — Gets the camera evaluation data for a given sub-set of camera rigs in this componentâs evaluation context.
  - `get_initial_result()` -> `BlueprintCameraEvaluationDataRef` — Gets the shared camera evaluation data for this componentâs evaluation context.

**Properties** (2):
  - `auto_activate_for_player`: `AutoReceiveInput` — [Read-Write] If AutoActivate is set, auto-activates this componentâs camera for the given player.
...
  - `set_control_rotation_when_view_target`: `bool` — [Read-Write] Specifies whether this component should set the player controllerâs control rotation
...

### `unreal.GameplayCameraParameterSetterComponent`
Inherits: `ActorComponent` | Header: `GameplayCameraParameterSetterComponent.h`

Gameplay Camera Parameter Setter Component

**Methods** (2):
  - `start_parameter_setters()` -> `None` — Start setting parameters.
  - `stop_parameter_setters(immediately = False)` -> `None` — Stop setting parameters.

**Properties** (4):
  - `blend_in_time`: `float` — [Read-Write] The blend-in time. (float)
  - `blend_out_time`: `float` — [Read-Write] The blend-out time. (float)
  - `blend_type`: `CameraVariableSetterBlendType` — [Read-Write] The blend type. (CameraVariableSetterBlendType)
  - `camera_rig_reference`: `CameraRigAssetReference` — [Read-Write] The camera asset whose parameters to override. (CameraRigAssetReference)

### `unreal.GameplayCameraRigActor`
Inherits: `GameplayCameraActorBase` | Header: `GameplayCameraRigActor.h`

An actor that can run a camera asset.

**Properties** (1):
  - `camera_rig_component`: `GameplayCameraRigComponent` [Read-Only] — [Read-Only] (GameplayCameraRigComponent)

### `unreal.GameplayCameraRigComponent`
Inherits: `GameplayCameraComponentBase` | Header: `GameplayCameraRigComponent.h`

A component that can run a camera rig asset inside its own camera evaluation context.

**Properties** (1):
  - `camera_rig_reference`: `CameraRigAssetReference` — [Read-Write] The camera rig asset to run. (CameraRigAssetReference)

### `unreal.GameplayCamerasPlayerCameraManager`
Inherits: `PlayerCameraManager` | Header: `GameplayCamerasPlayerCameraManager.h`

A player camera manager that runs the GameplayCameras camera system.

**Methods** (5):
  - `release_player_controller()` -> `None` — Restore an originally stolen camera manager (see StealPlayerController).
  - `start_global_camera_modifier_rig(camera_rig, order_key = 0)` -> `CameraRigInstanceID` — Start Global Camera Modifier Rig
  - `start_visual_camera_modifier_rig(camera_rig, order_key = 0)` -> `CameraRigInstanceID` — Start Visual Camera Modifier Rig
  - `steal_player_controller(player_controller)` -> `None` — Replace the camera manager currently set on the provided controller with this camera manager.
  - `stop_camera_modifier_rig(instance_id, immediately = False)` -> `None` — Stop Camera Modifier Rig

### `unreal.GameplayCameraSystemActor`
Inherits: `Actor` | Header: `GameplayCameraSystemActor.h`

An actor that hosts a camera system.

**Properties** (1):
  - `camera_system_component`: `GameplayCameraSystemComponent` [Read-Only] — [Read-Only] (GameplayCameraSystemComponent)

### `unreal.GameplayCameraSystemComponent`
Inherits: `SceneComponent` | Header: `GameplayCameraSystemComponent.h`

A component that hosts a camera system.

**Methods** (7):
  - `activate_camera_system_for_player_controller(player_controller)` -> `None` — Sets this componentâs actor as the view target for the given player.
  - `activate_camera_system_for_player_index(player_index)` -> `None` — Sets this componentâs actor as the view target for the given player.
  - `deactivate_camera_system(next_view_target = None)` -> `None` — Removes this componentâs actor from being the view target.
  - `is_camera_system_active_for_play_controller(player_controller)` -> `bool` — Returns whether this componentâs actor is set as the view target for the given player.
  - `start_global_camera_modifier_rig(camera_rig, order_key = 0)` -> `CameraRigInstanceID` — Start Global Camera Modifier Rig
  - `start_visual_camera_modifier_rig(camera_rig, order_key = 0)` -> `CameraRigInstanceID` — Start Visual Camera Modifier Rig
  - `stop_camera_modifier_rig(instance_id, immediately = False)` -> `None` — Stop Camera Modifier Rig

**Properties** (2):
  - `auto_activate_for_player`: `AutoReceiveInput` — [Read-Write] If AutoActivate is set, auto-activates the camera system for the given player.
This set...
  - `set_player_controller_rotation`: `bool` — [Read-Write] If enabled, sets the evaluated camera orientation as the player controller rotation eve...

### `unreal.GameplayControlRotationComponent`
Inherits: `ActorComponent` | Header: `GameplayControlRotationComponent.h`

An example component that works with the GameplayCameraComponent to manage a playerâs control rotation when the camera changes or moves in a way that was not initiated by the player themselves.

**Methods** (3):
  - `activate_control_rotation_management_for_player_controller(player_controller)` -> `None` — Activates management of a player controllerâs control rotation. The component will set the control rotation every fram...
  - `activate_control_rotation_management_for_player_index(player_index)` -> `None` — Activates management of a player controllerâs control rotation. The component will set the control rotation every fram...
  - `deactivate_control_rotation_management()` -> `None` — Deactivates management of a player controllerâs control rotation.

**Properties** (1):
  - `auto_activate_for_player`: `AutoReceiveInput` — [Read-Write] If AutoActivate is set, auto-activates control rotation management for the given player...

### `unreal.Integer32CameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Integer camera variable.

### `unreal.MovieSceneCameraFramingZoneSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneCameraFramingZoneSection.h`

Movie Scene Camera Framing Zone Section

### `unreal.MovieSceneCameraFramingZoneTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneCameraFramingZoneTrack.h`

Movie Scene Camera Framing Zone Track

### `unreal.Rotator3dCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Rotator3d camera variable.

### `unreal.Rotator3fCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Rotator3f camera variable.

### `unreal.Transform3dCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Transform3d camera variable.

### `unreal.Transform3fCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Transform3f camera variable.

### `unreal.Vector2dCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Vector2d camera variable.

### `unreal.Vector2fCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Vector2f camera variable.

### `unreal.Vector3dCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Vector3d camera variable.

### `unreal.Vector3fCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Vector3f camera variable.

### `unreal.Vector4dCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Vector4d camera variable.

### `unreal.Vector4fCameraVariable`
Inherits: `CameraVariableAsset` | Header: `CameraVariableAssets.h`

Vector4f camera variable.

### `unreal.CameraEvaluationDataCondition`
Inherits: `EnumBase` | Header: `CameraEvaluationContext.h`

ECamera Evaluation Data Condition

**Properties** (1):
  - `ACTIVE_CAMERA_RIG`: `CameraEvaluationDataCondition = Ellipsis` — 0

### `unreal.CameraRigInitialOrientation`
Inherits: `EnumBase` | Header: `CameraRigTransition.h`

Determines how a camera rigâs initial orientation should be initialized.

**Properties** (5):
  - `CONTEXT_YAW_PITCH`: `CameraRigInitialOrientation = Ellipsis` — Orient the camera rig in the same direction as its contextâs initial transform. 1
  - `NONE`: `CameraRigInitialOrientation = Ellipsis` — Leave the camera rig to its default orientation. 0
  - `PREVIOUS_ABSOLUTE_TARGET`: `CameraRigInitialOrientation = Ellipsis` — Make the camera rig point at the same target as the previously active camera rigâs
last frame targ...
  - `PREVIOUS_RELATIVE_TARGET`: `CameraRigInitialOrientation = Ellipsis` — Make the camera rig point at the same target as the previously active camera rig.
Last frameâs tar...
  - `PREVIOUS_YAW_PITCH`: `CameraRigInitialOrientation = Ellipsis` — Orient the camera rig in the same direction as the previously active camera rig. 2

### `unreal.CameraRigLayer`
Inherits: `EnumBase` | Header: `CameraRigInstanceID.h`

Defines evaluation layers for camera rigs.

**Properties** (4):
  - `BASE`: `CameraRigLayer = Ellipsis` — 1
  - `GLOBAL`: `CameraRigLayer = Ellipsis` — 3
  - `MAIN`: `CameraRigLayer = Ellipsis` — 2
  - `VISUAL`: `CameraRigLayer = Ellipsis` — 4

### `unreal.CameraShakeEvaluationMode`
Inherits: `EnumBase` | Header: `CameraShakeCameraNode.h`

ECamera Shake Evaluation Mode

**Properties** (2):
  - `INLINE`: `CameraShakeEvaluationMode = Ellipsis` — 0
  - `VISUAL_LAYER`: `CameraShakeEvaluationMode = Ellipsis` — 1

### `unreal.CameraTargetShape`
Inherits: `EnumBase` | Header: `CameraActorTargetInfo.h`

ECamera Target Shape

**Properties** (3):
  - `AUTOMATIC_BOUNDS`: `CameraTargetShape = Ellipsis` — Use the targetâs computed bounds. 1
  - `MANUAL_BOUNDS`: `CameraTargetShape = Ellipsis` — Use custom bounds. 2
  - `POINT`: `CameraTargetShape = Ellipsis` — Use a single-point target. 0

### `unreal.CameraVariableSetterBlendType`
Inherits: `EnumBase` | Header: `CameraVariableSetter.h`

The blend type for a camera variable setter.

**Properties** (4):
  - `LINEAR`: `CameraVariableSetterBlendType = Ellipsis` — 1
  - `NONE`: `CameraVariableSetterBlendType = Ellipsis` — 0
  - `SMOOTHER_STEP`: `CameraVariableSetterBlendType = Ellipsis` — 3
  - `SMOOTH_STEP`: `CameraVariableSetterBlendType = Ellipsis` — 2

### `unreal.GameplayCameraComponentActivationMode`
Inherits: `EnumBase` | Header: `GameplayCameraComponentBase.h`

Defines how to activate a gameplay camera component.

**Properties** (3):
  - `INSERT_OR_PUSH`: `GameplayCameraComponentActivationMode = Ellipsis` — Inserts the camera director as a child of the active one, or push it if there is no active one. 2
  - `PUSH`: `GameplayCameraComponentActivationMode = Ellipsis` — Push the camera director over any existing ones. 0
  - `PUSH_AND_INSERT`: `GameplayCameraComponentActivationMode = Ellipsis` — Push the camera director and try to insert any active one as a child. 1

### `unreal.GameplayCamerasViewRotationMode`
Inherits: `EnumBase` | Header: `GameplayCamerasPlayerCameraManager.h`

Defines how the GameplayCamerasPlayerCameraManager should handle the playerâs view rotation.

**Properties** (2):
  - `NONE`: `GameplayCamerasViewRotationMode = Ellipsis` — Donât do anything with the view rotation. This is suitable if the player camera input
and control ...
  - `PREVIEW_UPDATE`: `GameplayCamerasViewRotationMode = Ellipsis` — Runs a âlightâ update of the whole camera system and comes up with a good approximation of
the r...
