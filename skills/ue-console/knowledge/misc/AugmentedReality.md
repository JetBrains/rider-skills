# UE Python API — AugmentedReality Module

**125 types** from the `AugmentedReality` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ARCameraIntrinsics`, `AREnvironmentProbeUpdatePayload`, `ARFaceUpdatePayload`, `ARGeoAnchorUpdatePayload`, `ARImageUpdatePayload`, `ARMeshUpdatePayload`, `ARObjectUpdatePayload`, `ARPlaneUpdatePayload`, `ARPointUpdatePayload`, `ARPose2D`, `ARPose3D`, `ARPoseUpdatePayload`, `ARQRCodeUpdatePayload`, `ARSessionPayload`, `ARSessionStatus`, `ARSharedWorldReplicationState`, `ARSkeletonDefinition`, `ARTraceResult`, `ARVideoFormat`, `ARActor`, ... (125 total)

---

## Classes

### `unreal.ARCameraIntrinsics`
Inherits: `StructBase` | Header: `ARTypes.h`

AR camera intrinsics

**Properties** (3):
  - `focal_length`: `Vector2D` [Read-Only] — [Read-Only] Camera focal length in pixels (Vector2D)
  - `image_resolution`: `IntPoint` [Read-Only] — [Read-Only] Camera image resolution in pixels (IntPoint)
  - `principal_point`: `Vector2D` [Read-Only] — [Read-Only] Camera principal point in pixels (Vector2D)

### `unreal.AREnvironmentProbeUpdatePayload`
Inherits: `StructBase` | Header: `ARComponent.h`

AREnvironment Probe Update Payload

**Properties** (1):
  - `world_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ARFaceUpdatePayload`
Inherits: `StructBase` | Header: `ARComponent.h`

ARFace Update Payload

**Properties** (4):
  - `left_eye_position`: `Vector` — [Read-Write] (Vector)
  - `look_at_target`: `Vector` — [Read-Write] (Vector)
  - `right_eye_position`: `Vector` — [Read-Write] (Vector)
  - `session_payload`: `ARSessionPayload` [Read-Only] — [Read-Only] (ARSessionPayload)

### `unreal.ARGeoAnchorUpdatePayload`
Inherits: `StructBase` | Header: `ARComponent.h`

ARGeo Anchor Update Payload

**Properties** (7):
  - `altitude_meters`: `float` [Read-Only] — [Read-Only] (float)
  - `altitude_source`: `ARAltitudeSource` [Read-Only] — [Read-Only] (ARAltitudeSource)
  - `anchor_name`: `str` [Read-Only] — [Read-Only] (str)
  - `latitude`: `float` [Read-Only] — [Read-Only] (float)
  - `longitude`: `float` [Read-Only] — [Read-Only] (float)
  - `session_payload`: `ARSessionPayload` [Read-Only] — [Read-Only] (ARSessionPayload)
  - `world_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ARImageUpdatePayload`
Inherits: `StructBase` | Header: `ARComponent.h`

ARImage Update Payload

**Properties** (4):
  - `detected_image`: `ARCandidateImage` [Read-Only] — [Read-Only] (ARCandidateImage)
  - `estimated_size`: `Vector2D` [Read-Only] — [Read-Only] (Vector2D)
  - `session_payload`: `ARSessionPayload` [Read-Only] — [Read-Only] (ARSessionPayload)
  - `world_transform`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.ARMeshUpdatePayload`
Inherits: `StructBase` | Header: `ARComponent.h`

ARMesh Update Payload

**Properties** (3):
  - `object_classification`: `ARObjectClassification` [Read-Only] — [Read-Only] (ARObjectClassification)
  - `session_payload`: `ARSessionPayload` [Read-Only] — [Read-Only] (ARSessionPayload)
  - `world_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ARObjectUpdatePayload`
Inherits: `StructBase` | Header: `ARComponent.h`

ARObject Update Payload

**Properties** (1):
  - `world_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ARPlaneUpdatePayload`
Inherits: `StructBase` | Header: `ARComponent.h`

ARPlane Update Payload

**Properties** (6):
  - `boundary_vertices`: `None` — [Read-Write] (Array[Vector])
  - `center`: `Vector` — [Read-Write] (Vector)
  - `extents`: `Vector` — [Read-Write] (Vector)
  - `object_classification`: `ARObjectClassification` [Read-Only] — [Read-Only] (ARObjectClassification)
  - `session_payload`: `ARSessionPayload` [Read-Only] — [Read-Only] (ARSessionPayload)
  - `world_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ARPointUpdatePayload`
Inherits: `StructBase` | Header: `ARComponent.h`

ARPoint Update Payload

### `unreal.ARPose2D`
Inherits: `StructBase` | Header: `ARTypes.h`

Represents a human pose tracked in the 2D space

**Properties** (3):
  - `is_joint_tracked`: `None` [Read-Only] — [Read-Only] Flags indicating if each joint is tracked (Array[bool])
  - `joint_locations`: `None` [Read-Only] — [Read-Only] The location of each joint in 2D normalized space (Array[Vector2D])
  - `skeleton_definition`: `ARSkeletonDefinition` [Read-Only] — [Read-Only] The definition of this skeleton (ARSkeletonDefinition)

### `unreal.ARPose3D`
Inherits: `StructBase` | Header: `ARTypes.h`

Represents a human pose tracked in the 3D space

**Properties** (4):
  - `is_joint_tracked`: `None` [Read-Only] — [Read-Only] Flags indicating if each joint is tracked (Array[bool])
  - `joint_transform_space`: `ARJointTransformSpace` [Read-Only] — [Read-Only] (ARJointTransformSpace)
  - `joint_transforms`: `None` [Read-Only] — [Read-Only] The transform of each join in the model space (Array[Transform])
  - `skeleton_definition`: `ARSkeletonDefinition` [Read-Only] — [Read-Only] The definition of this skeleton (ARSkeletonDefinition)

### `unreal.ARPoseUpdatePayload`
Inherits: `StructBase` | Header: `ARComponent.h`

ARPose Update Payload

**Properties** (2):
  - `joint_transforms`: `None` — [Read-Write] (Array[Transform])
  - `world_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ARQRCodeUpdatePayload`
Inherits: `StructBase` | Header: `ARComponent.h`

ARQRCode Update Payload

**Properties** (4):
  - `extents`: `Vector` — [Read-Write] (Vector)
  - `qr_code`: `str` — [Read-Write] (str)
  - `session_payload`: `ARSessionPayload` [Read-Only] — [Read-Only] (ARSessionPayload)
  - `world_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.ARSessionPayload`
Inherits: `StructBase` | Header: `ARComponent.h`

ARSession Payload

**Properties** (3):
  - `config_flags`: `int` [Read-Only] — [Read-Only] (int32)
  - `default_mesh_material`: `MaterialInterface` [Read-Only] — [Read-Only] (MaterialInterface)
  - `default_wireframe_mesh_material`: `MaterialInterface` [Read-Only] — [Read-Only] (MaterialInterface)

### `unreal.ARSessionStatus`
Inherits: `StructBase` | Header: `ARTypes.h`

The current state of the AR subsystem including an optional explanation string.

**Properties** (2):
  - `additional_info`: `str` [Read-Only] — [Read-Only] Optional information about the current status of the system. (str)
  - `status`: `ARSessionStatusType` [Read-Only] — [Read-Only] The current status of the AR subsystem. (ARSessionStatusType)

### `unreal.ARSharedWorldReplicationState`
Inherits: `StructBase` | Header: `ARSharedWorldGameMode.h`

Per player information about what data has been sent to them

**Properties** (2):
  - `ar_world_offset`: `int` [Read-Only] — [Read-Only] The offset in the overall ARWorld data buffer (int32)
  - `preview_image_offset`: `int` [Read-Only] — [Read-Only] The offset in the overall image data buffer (int32)

### `unreal.ARSkeletonDefinition`
Inherits: `StructBase` | Header: `ARTypes.h`

Represents a hierarchy of a human pose skeleton tracked by the AR system

**Properties** (3):
  - `joint_names`: `None` [Read-Only] — [Read-Only] The name of each joint in this skeleton (Array[Name])
  - `num_joints`: `int` [Read-Only] — [Read-Only] How many joints this skeleton has (int32)
  - `parent_indices`: `None` [Read-Only] — [Read-Only] The parent index of each joint in this skeleton (Array[int32])

### `unreal.ARTraceResult`
Inherits: `StructBase` | Header: `ARTraceResult.h`

A result of an intersection found during a hit-test.

### `unreal.ARVideoFormat`
Inherits: `StructBase` | Header: `ARTypes.h`

A specific AR video format

**Properties** (3):
  - `fps`: `int` [Read-Only] — [Read-Only] The desired or supported number of frames per second for this video format (int32)
  - `height`: `int` [Read-Only] — [Read-Only] The desired or supported height in pixels for this video format (int32)
  - `width`: `int` [Read-Only] — [Read-Only] The desired or supported width in pixels for this video format (int32)

### `unreal.ARActor`
Inherits: `Actor` | Header: `ARActor.h`

**Methods** (1):
  - `add_ar_component(component_class, native_id)` -> `ARComponent` — Add ARComponent

### `unreal.ARBaseAsyncTaskBlueprintProxy`
Inherits: `BlueprintAsyncActionBase` | Header: `ARBlueprintProxy.h`

ARBase Async Task Blueprint Proxy

### `unreal.ARBasicLightEstimate`
Inherits: `ARLightEstimate` | Header: `ARLightEstimate.h`

ARBasic Light Estimate

**Methods** (3):
  - `get_ambient_color()` -> `LinearColor` — Get Ambient Color
  - `get_ambient_color_temperature_kelvin()` -> `float` — Get Ambient Color Temperature Kelvin
  - `get_ambient_intensity_lumens()` -> `float` — Get Ambient Intensity Lumens

### `unreal.ARCandidateImage`
Inherits: `DataAsset` | Header: `ARTypes.h`

An asset that points to an image to be detected in a scene and provides the size of the object in real life

**Methods** (5):
  - `get_candidate_texture()` -> `Texture2D` — see: CandidateTexture
  - `get_friendly_name()` -> `str` — see: FriendlyName
  - `get_orientation()` -> `ARCandidateImageOrientation` — see: Orientation
  - `get_physical_height()` -> `float` — see: Height
  - `get_physical_width()` -> `float` — see: Width

### `unreal.ARCandidateObject`
Inherits: `DataAsset` | Header: `ARTypes.h`

An asset that points to an object to be detected in a scene

**Methods** (6):
  - `get_bounding_box()` -> `Box` — see: BoundingBox
  - `get_candidate_object_data()` -> `Array [ uint8 ]` — see: CandidateObjectData
  - `get_friendly_name()` -> `str` — see: FriendlyName
  - `set_bounding_box(bounding_box)` -> `None` — Set Bounding Box
  - `set_candidate_object_data(candidate_object)` -> `None` — Set Candidate Object Data
  - `set_friendly_name(new_name)` -> `None` — Set Friendly Name

### `unreal.ARComponent`
Inherits: `SceneComponent` | Header: `ARComponent.h`

ARComponent handles replication and visualization update for AR tracked geometries ARComponent is created in either multiplayer or local only environment

**Methods** (4):
  - `get_mr_mesh()` -> `MRMeshComponent` — Get MRMesh
  - `receive_remove()` -> `None` — Event when native representation is removed, called on server and clients.
  - `set_native_id(native_id)` -> `None` — Set Native ID
  - `update_visualization()` -> `None` — Update Visualization

### `unreal.ARDependencyHandler`
Inherits: `Object` | Header: `ARDependencyHandler.h`

Helper class that allows the user to explicitly request AR service installation and permission granting. Recommended flow for explicit management: 1. Call âGetARDependencyHandlerâ to get a handler...

**Methods** (5):
  - `check_ar_service_availability(world_context_object, latent_info)` -> `ARServiceAvailability` — Latent action to check AR availability on the current platform.
  - `get_ar_dependency_handler()` -> `ARDependencyHandler` [classmethod]
  - `install_ar_service(world_context_object, latent_info)` -> `ARServiceInstallRequestResult` — Latent action to install AR service on the current platform.
  - `request_ar_session_permission(world_context_object, session_config, latent_info)` -> `ARServicePermissionRequestResult` — Latent action to request permission to run the supplied session configuration.
  - `start_ar_session_latent(world_context_object, session_config, latent_info)` -> `None` — Latent action to start AR session. Will make sure dependency and permission issues are resolved internally, only returns...

### `unreal.AREnvironmentCaptureProbe`
Inherits: `ARTrackedGeometry` | Header: `ARTrackable.h`

A tracked environment texture probe that gives you a cube map for reflections

**Methods** (2):
  - `get_environment_capture_texture()` -> `AREnvironmentCaptureProbeTexture` — see: EnvironmentCaptureTexture
  - `get_extent()` -> `Vector` — see: Extent

### `unreal.AREnvironmentCaptureProbeTexture`
Inherits: `TextureCube` | Header: `ARTextures.h`

Base class for all AR textures that represent the environment for lighting and reflection

**Properties** (4):
  - `external_texture_guid`: `Guid` [Read-Only] — [Read-Only] The guid of texture that gets registered as an external texture (Guid)
  - `size`: `Vector2f` [Read-Only] — [Read-Only] The width and height of the texture (Vector2f)
  - `texture_type`: `ARTextureType` [Read-Only] — [Read-Only] The type of texture this is (ARTextureType)
  - `timestamp`: `float` [Read-Only] — [Read-Only] The timestamp this texture was captured at (float)

### `unreal.AREnvironmentProbeComponent`
Inherits: `ARComponent` | Header: `ARComponent.h`

AREnvironment Probe Component

**Methods** (2):
  - `receive_add(payload)` -> `None` — Event when native representation is first added, called on server and clients.
  - `receive_update(payload)` -> `None` — Event when native representation is updated, called on server and clients.

**Properties** (1):
  - `replicated_payload`: `AREnvironmentProbeUpdatePayload` [Read-Only] — [Read-Only] (AREnvironmentProbeUpdatePayload)

### `unreal.ARFaceComponent`
Inherits: `ARComponent` | Header: `ARComponent.h`

ARFace Component

**Methods** (3):
  - `receive_add(payload)` -> `None` — Event when native representation is first added, called on server and clients.
  - `receive_update(payload)` -> `None` — Event when native representation is updated, called on server and clients.
  - `set_face_component_debug_mode(new_debug_mode)` -> `None` [classmethod] — Set Face Component Debug Mode

**Properties** (4):
  - `face_out_of_screen`: `bool` [Read-Only] — [Read-Only] Whether the mesh should be rotated so that itâs facing out of the screen. (bool)
  - `replicated_payload`: `ARFaceUpdatePayload` [Read-Only] — [Read-Only] (ARFaceUpdatePayload)
  - `transform_setting`: `ARFaceTransformMixing` [Read-Only] — [Read-Only] Determines how the transform from tracking data and the componentâs transform are mixe...
  - `update_vertex_normal`: `bool` [Read-Only] — [Read-Only] Whether to automatically update the vertex normal when the mesh is updated. (bool)

### `unreal.ARFaceGeometry`
Inherits: `ARTrackedGeometry` | Header: `ARTrackable.h`

ARFace Geometry

**Methods** (4):
  - `get_blend_shape_value(blend_shape)` -> `float` — Get Blend Shape Value
  - `get_blend_shapes()` -> `Map [ ARFaceBlendShape , float ]` — Get Blend Shapes
  - `get_local_space_eye_transform(eye)` -> `Transform` — Get Local Space Eye Transform
  - `get_world_space_eye_transform(eye)` -> `Transform` — Get World Space Eye Transform

**Properties** (2):
  - `is_tracked`: `bool` [Read-Only] — [Read-Only] Whether the face is currently being tracked by the AR system (bool)
  - `look_at_target`: `Vector` [Read-Only] — [Read-Only] The target the eyes are looking at (Vector)

### `unreal.ARGeoAnchor`
Inherits: `ARTrackedGeometry` | Header: `ARTrackable.h`

ARGeo Anchor

**Methods** (4):
  - `get_altitude_meters()` -> `float` — Get Altitude Meters
  - `get_altitude_source()` -> `ARAltitudeSource` — Get Altitude Source
  - `get_latitude()` -> `float` — Get Latitude
  - `get_longitude()` -> `float` — Get Longitude

### `unreal.ARGeoAnchorComponent`
Inherits: `ARComponent` | Header: `ARComponent.h`

ARGeo Anchor Component

**Methods** (3):
  - `receive_add(payload)` -> `None` — Event when native representation is first added, called on server and clients.
  - `receive_update(payload)` -> `None` — Event when native representation is updated, called on server and clients.
  - `set_geo_anchor_component_debug_mode(new_debug_mode)` -> `None` [classmethod] — Set Geo Anchor Component Debug Mode

**Properties** (1):
  - `replicated_payload`: `ARGeoAnchorUpdatePayload` [Read-Only] — [Read-Only] (ARGeoAnchorUpdatePayload)

### `unreal.ARGeoTrackingSupport`
Inherits: `Object` | Header: `ARGeoTrackingSupport.h`

Interface class for Geo tracking related features.

**Methods** (6):
  - `add_geo_anchor_at_location(longitude, latitude, optional_anchor_name)` -> `bool`
  - `add_geo_anchor_at_location_with_altitude(longitude, latitude, altitude_meters, optional_anchor_name)` -> `bool`
  - `get_geo_tracking_accuracy()` -> `ARGeoTrackingAccuracy`
  - `get_geo_tracking_state()` -> `ARGeoTrackingState`
  - `get_geo_tracking_state_reason()` -> `ARGeoTrackingStateReason`
  - `get_geo_tracking_support()` -> `ARGeoTrackingSupport` [classmethod]

### `unreal.ARGetCandidateObjectAsyncTaskBlueprintProxy`
Inherits: `ARBaseAsyncTaskBlueprintProxy` | Header: `ARBlueprintProxy.h`

ARGet Candidate Object Async Task Blueprint Proxy

**Properties** (2):
  - `on_failed`: `ARGetCandidateObjectPin` — [Read-Write] (ARGetCandidateObjectPin)
  - `on_success`: `ARGetCandidateObjectPin` — [Read-Write] (ARGetCandidateObjectPin)

### `unreal.ARImageComponent`
Inherits: `ARComponent` | Header: `ARComponent.h`

ARImage Component

**Methods** (3):
  - `receive_add(payload)` -> `None` — Event when native representation is first added, called on server and clients.
  - `receive_update(payload)` -> `None` — Event when native representation is updated, called on server and clients.
  - `set_image_component_debug_mode(new_debug_mode)` -> `None` [classmethod] — Set Image Component Debug Mode

**Properties** (1):
  - `replicated_payload`: `ARImageUpdatePayload` [Read-Only] — [Read-Only] (ARImageUpdatePayload)

### `unreal.ARLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ARBlueprintLibrary.h`

ARBlueprint Library

**Methods** (54):
  - `add_manual_environment_capture_probe(location, extent)` -> `bool` [classmethod] — Adds an environment capture probe to the ar world
  - `add_runtime_candidate_image(session_config, candidate_texture, friendly_name, physical_width)` -> `ARCandidateImage` [classmethod] — Create an ARCandidateImage object and add it to the ARCandidateImageList of the given c UARSessionConfig object. Note th...
  - `add_tracked_point_with_name(world_transform, point_name, delete_points_with_same_name = True)` -> `bool` [classmethod] — Manually add a tracked point with name and world transform. WorldTransform:: transform in the world space where the poin...
  - `calculate_alignment_transform(transform_in_first_coordinate_system, transform_in_second_coordinate_system)` -> `Transform` [classmethod] — Computes a transform that aligns two coordinate systems. Requires the transform of the same known point in each coordina...
  - `calculate_closest_intersection(start_points, end_points)` -> `Vector` [classmethod] — Alignment helpers
  - `debug_draw_pin(ar_pin, world_context_object, color = [1.000000,1.000000,0.000000,0.750000], scale = 5.000000, persist_for_seconds = 0.000000)` -> `None` [classmethod] — Given a c UARPin, draw it for debugging purposes.
  - `debug_draw_tracked_geometry(tracked_geometry, world_context_object, color = [1.000000,1.000000,0.000000,0.750000], outline_thickness = 5.000000, persist_for_seconds = 0.000000)` -> `None` [classmethod] — Given some real-world geometry being tracked by the Augmented Reality system, draw it on the screen for debugging purpos...
  - `find_tracked_points_by_name(point_name)` -> `Array [ ARTrackedPoint ]` [classmethod]
  - `get_alignment_transform()` -> `Transform` [classmethod]
  - `get_all_geometries()` -> `Array [ ARTrackedGeometry ]` [classmethod]
  - `get_all_geometries_by_class(geometry_class)` -> `Array [ ARTrackedGeometry ]` [classmethod]
  - `get_all_pins()` -> `Array [ ARPin ]` [classmethod] — Get a list of all the c UARPin objects that the Augmented Reality session is currently using to connect virtual objects ...
  - `get_all_tracked2d_poses()` -> `Array [ ARPose2D ]` [classmethod]
  - `get_ar_session_status()` -> `ARSessionStatus` [classmethod] — It is intended that you check the status of the Augmented Reality session on every frame and take action accordingly. e....
  - `get_ar_texture(texture_type)` -> `ARTexture` [classmethod]
  - `get_ar_world_scale()` -> `float` [classmethod]
  - `get_camera_intrinsics()` -> `ARCameraIntrinsics or None` [classmethod]
  - `get_current_light_estimate()` -> `ARLightEstimate` [classmethod] — An AugmentedReality session can be configured to provide light estimates. The specific approach to light estimation can ...
  - `get_number_of_tracked_faces_supported()` -> `int32` [classmethod]
  - `get_object_classification_at_location(world_location, max_location_diff = 10.000000)` -> `(out_classification=ARObjectClassification, out_classification_location=Vector) or None` [classmethod] — Try to determine the classification of the object at a world space location InWorldLocation:: the world location where t...
  - `get_point_cloud()` -> `Array [ Vector ]` [classmethod]
  - `get_session_config()` -> `ARSessionConfig` [classmethod]
  - `get_supported_video_formats(session_type)` -> `Array [ ARVideoFormat ]` [classmethod]
  - `get_tracking_quality()` -> `ARTrackingQuality` [classmethod]
  - `get_tracking_quality_reason()` -> `ARTrackingQualityReason` [classmethod]
  - `get_world_mapping_status()` -> `ARWorldMappingState` [classmethod]
  - `is_ar_pin_local_store_ready()` -> `bool` [classmethod] — Is ARPin Local Store Ready
  - `is_ar_pin_local_store_supported()` -> `bool` [classmethod] — Is ARPin Local Store Supported
  - `is_ar_supported()` -> `bool` [classmethod] — Checks if the current device can support AR
  - `is_scene_reconstruction_supported(session_type, scene_reconstruction_method)` -> `bool` [classmethod]
  - `is_session_tracking_feature_supported(session_type, session_tracking_feature)` -> `bool` [classmethod]
  - `is_session_type_supported(session_type)` -> `bool` [classmethod] — Test whether this type of session is supported by the current Augmented Reality platform. e.g. is your device capable of...
  - `is_wmr_anchor_store_ready()` -> `bool` [classmethod] — deprecated: âis_wmr_anchor_store_readyâ was renamed to âis_ar_pin_local_store_readyâ.
  - `line_trace_tracked_objects(screen_coord, test_feature_points = True, test_ground_plane = True, test_plane_extents = True, test_plane_boundary_polygon = True)` -> `Array [ ARTraceResult ]` [classmethod] — Perform a line trace against any real-world geometry as tracked by the AR system.
  - `line_trace_tracked_objects3d(start, end, test_feature_points = True, test_ground_plane = True, test_plane_extents = True, test_plane_boundary_polygon = True)` -> `Array [ ARTraceResult ]` [classmethod] — Perform a line trace against any real-world geometry as tracked by the AR system.
  - `load_ar_pins_from_local_store()` -> `Map [ Name , ARPin ]` [classmethod] — Load all ARPins from local save Note: Multiple loads of a saved pin may result in duplicate pins OR overwritten pins. It...
  - `pause_ar_session()` -> `None` [classmethod] — Pause a running Augmented Reality session without clearing existing state.
  - `pin_component(component_to_pin, pin_to_world_transform, tracked_geometry = None, debug_name = 'None')` -> `ARPin` [classmethod] — Pin an Unreal Component to a location in tracking spce (i.e. the real world).
  - `pin_component_to_ar_pin(component_to_pin, pin)` -> `bool` [classmethod] — Associate a component with an ARPin, so that its transform will be updated by the pin. Any previously associated compone...
  - `pin_component_to_trace_result(component_to_pin, trace_result, debug_name = 'None')` -> `ARPin` [classmethod] — A convenient version of c PinComponent() that can be used in conjunction with a result of a c LineTraceTrackedObjects ca...
  - `remove_all_ar_pins_from_local_store()` -> `None` [classmethod] — Remove all ARPins from the local store
  - `remove_all_ar_pins_from_wmr_anchor_store()` -> `None` [classmethod] — deprecated: âremove_all_ar_pins_from_wmr_anchor_storeâ was renamed to âremove_all_ar_pins_from_local_storeâ.
  - `remove_ar_pin_from_local_store(save_name)` -> `None` [classmethod] — Remove an ARPin from the local store
  - `remove_pin(pin_to_remove)` -> `None` [classmethod] — Remove a pin such that it no longer updates the associated component.
  - `resize_xr_camera(size)` -> `IntPoint` [classmethod] — Change screen size of Mixed Reality Capture camera.
  - `save_ar_pin_to_local_store(save_name, pin)` -> `bool` [classmethod] — Save an ARPin to local store
  - `set_alignment_transform(alignment_transform)` -> `None` [classmethod] — Set a transform that will be applied to the tracking space. This effectively moves any camera possessed by the Augmented...
  - `set_ar_world_origin_location_and_rotation(origin_location, origin_rotation, is_transform_in_world_space = True, maintain_up_direction = True)` -> `None` [classmethod] — For a point P in the AR local space, whose location and rotation are âOriginLocationâ and âOriginRotationâ in th...
  - `set_ar_world_scale(world_scale)` -> `None` [classmethod] — Helper function that modifies the alignment transform scale so that virtual content in the world space appears to be â...
  - `set_enabled_xr_camera(on_off)` -> `None` [classmethod] — Enable or disable Mixed Reality Capture camera.
  - `start_ar_session(session_config)` -> `None` [classmethod] — Begin a new Augmented Reality session. Subsequently, use the c GetARSessionStatus() function to figure out the status of...
  - `stop_ar_session()` -> `None` [classmethod] — Stop a running Augmented Reality session and clear any state.
  - `toggle_ar_capture(on_off, capture_type)` -> `bool` [classmethod] — Starts or stops a battery intensive service on device.
  - `unpin_component(component_to_unpin)` -> `None` [classmethod] — Given a pinned c ComponentToUnpin, remove its attachment to the real world.

### `unreal.ARLifeCycleComponent`
Inherits: `SceneComponent` | Header: `ARLifeCycleComponent.h`

ARLife Cycle Component

**Properties** (2):
  - `on_ar_actor_spawned_delegate`: `InstanceARActorSpawnedDelegate` — [Read-Write] (InstanceARActorSpawnedDelegate)
  - `on_ar_actor_to_be_destroyed_delegate`: `InstanceARActorToBeDestroyedDelegate` — [Read-Write] (InstanceARActorToBeDestroyedDelegate)

### `unreal.ARLightEstimate`
Inherits: `Object` | Header: `ARLightEstimate.h`

ARLight Estimate

### `unreal.ARMeshComponent`
Inherits: `ARComponent` | Header: `ARComponent.h`

ARMesh Component

**Methods** (2):
  - `receive_add(payload)` -> `None` — Event when native representation is first added, called on server and clients.
  - `receive_update(payload)` -> `None` — Event when native representation is updated, called on server and clients.

**Properties** (1):
  - `replicated_payload`: `ARMeshUpdatePayload` [Read-Only] — [Read-Only] (ARMeshUpdatePayload)

### `unreal.ARMeshGeometry`
Inherits: `ARTrackedGeometry` | Header: `ARTrackable.h`

ARMesh Geometry

**Methods** (1):
  - `get_object_classification_at_location(world_location, max_location_diff = 10.000000)` -> `(out_classification=ARObjectClassification, out_classification_location=Vector) or None` — Try to determine the classification of the object at a world space location InWorldLocation:: the world location where t...

### `unreal.ARObjectComponent`
Inherits: `ARComponent` | Header: `ARComponent.h`

ARObject Component

**Methods** (2):
  - `receive_add(payload)` -> `None` — Event when native representation is first added, called on server and clients.
  - `receive_update(payload)` -> `None` — Event when native representation is updated, called on server and clients.

**Properties** (1):
  - `replicated_payload`: `ARObjectUpdatePayload` [Read-Only] — [Read-Only] (ARObjectUpdatePayload)

### `unreal.AROriginActor`
Inherits: `Actor` | Header: `AROriginActor.h`

Simple actor that is spawned at the origin for AR systems that want to hang components on an actor Spawned as a custom class for easier TObjectIterator use

### `unreal.ARPin`
Inherits: `Object` | Header: `ARPin.h`

**Methods** (6):
  - `get_debug_name()` -> `Name` — Get Debug Name
  - `get_local_to_tracking_transform()` -> `Transform` — Maps from a Pinâs Local Space to the Tracking Space. Mapping the origin from the Pinâs Local Space to Tracking Space...
  - `get_local_to_world_transform()` -> `Transform` — Convenience function. Same as LocalToTrackingTransform, but appends the TrackingToWorld Transform.
  - `get_pinned_component()` -> `SceneComponent`
  - `get_tracked_geometry()` -> `ARTrackedGeometry` — The TrackedGeometry (if any) that this this pin is being âstuckâ into.
  - `get_tracking_state()` -> `ARTrackingState` — Return the current tracking state of this Pin.

**Properties** (2):
  - `on_ar_tracking_state_changed`: `OnARTrackingStateChanged` — [Read-Write] (OnARTrackingStateChanged)
  - `on_ar_transform_updated`: `OnARTransformUpdated` — [Read-Write] (OnARTransformUpdated)

### `unreal.ARPlaneComponent`
Inherits: `ARComponent` | Header: `ARComponent.h`

ARPlane Component

**Methods** (5):
  - `get_object_classification_debug_colors()` -> `Map [ ARObjectClassification , LinearColor ]` [classmethod] — Get Object Classification Debug Colors
  - `receive_add(payload)` -> `None` — Event when native representation is first added, called on server and clients.
  - `receive_update(payload)` -> `None` — Event when native representation is updated, called on server and clients.
  - `set_object_classification_debug_colors(colors)` -> `None` [classmethod] — Set Object Classification Debug Colors
  - `set_plane_component_debug_mode(new_debug_mode)` -> `None` [classmethod] — Set Plane Component Debug Mode

**Properties** (1):
  - `replicated_payload`: `ARPlaneUpdatePayload` [Read-Only] — [Read-Only] (ARPlaneUpdatePayload)

### `unreal.ARPlaneGeometry`
Inherits: `ARTrackedGeometry` | Header: `ARTrackable.h`

ARPlane Geometry

**Methods** (5):
  - `get_boundary_polygon_in_local_space()` -> `Array [ Vector ]` — Get Boundary Polygon in Local Space
  - `get_center()` -> `Vector` — Get Center
  - `get_extent()` -> `Vector` — Get Extent
  - `get_orientation()` -> `ARPlaneOrientation` — Get Orientation
  - `get_subsumed_by()` -> `ARPlaneGeometry` — Get Subsumed By

### `unreal.ARPointComponent`
Inherits: `ARComponent` | Header: `ARComponent.h`

ARPoint Component

**Methods** (2):
  - `receive_add(payload)` -> `None` — Event when native representation is first added, called on server and clients.
  - `receive_update(payload)` -> `None` — Event when native representation is updated, called on server and clients.

**Properties** (1):
  - `replicated_payload`: `ARPointUpdatePayload` [Read-Only] — [Read-Only] (ARPointUpdatePayload)

### `unreal.ARPoseComponent`
Inherits: `ARComponent` | Header: `ARComponent.h`

ARPose Component

**Methods** (3):
  - `receive_add(payload)` -> `None` — Event when native representation is first added, called on server and clients.
  - `receive_update(payload)` -> `None` — Event when native representation is updated, called on server and clients.
  - `set_pose_component_debug_mode(new_debug_mode)` -> `None` [classmethod] — Set Pose Component Debug Mode

**Properties** (1):
  - `replicated_payload`: `ARPoseUpdatePayload` [Read-Only] — [Read-Only] (ARPoseUpdatePayload)

### `unreal.ARQRCodeComponent`
Inherits: `ARComponent` | Header: `ARComponent.h`

ARQRCode Component

**Methods** (3):
  - `receive_add(payload)` -> `None` — Event when native representation is first added, called on server and clients.
  - `receive_update(payload)` -> `None` — Event when native representation is updated, called on server and clients.
  - `set_qr_code_component_debug_mode(new_debug_mode)` -> `None` [classmethod] — Set QRCode Component Debug Mode

**Properties** (1):
  - `replicated_payload`: `ARQRCodeUpdatePayload` [Read-Only] — [Read-Only] (ARQRCodeUpdatePayload)

### `unreal.ARSaveWorldAsyncTaskBlueprintProxy`
Inherits: `ARBaseAsyncTaskBlueprintProxy` | Header: `ARBlueprintProxy.h`

ARSave World Async Task Blueprint Proxy

**Properties** (2):
  - `on_failed`: `ARSaveWorldPin` — [Read-Write] (ARSaveWorldPin)
  - `on_success`: `ARSaveWorldPin` — [Read-Write] (ARSaveWorldPin)

### `unreal.ARSessionConfig`
Inherits: `DataAsset` | Header: `ARSessionConfig.h`

An Unreal Data Asset that defines what features are used in the AR session.

**Methods** (35):
  - `add_candidate_image(new_candidate_image)` -> `None` — Add a new CandidateImage to the ARSessionConfig.
  - `add_candidate_object(candidate_object)` -> `None` — see: CandidateObjects
  - `clear_candidate_images()` -> `None` — Remove all candidate images from the ARSessionConfig
  - `get_candidate_image_list()` -> `Array [ ARCandidateImage ]` — see: CandidateImages
  - `get_candidate_object_list()` -> `Array [ ARCandidateObject ]` — see: CandidateObjects
  - `get_desired_video_format()` -> `ARVideoFormat` — see: DesiredVideoFormat
  - `get_enabled_session_tracking_feature()` -> `ARSessionTrackingFeature` — see: EnabledSessionTrackingFeatures
  - `get_environment_capture_probe_type()` -> `AREnvironmentCaptureProbeType` — see: EnvironmentCaptureProbeType
  - `get_face_tracking_direction()` -> `ARFaceTrackingDirection` — see: FaceTrackingDirection
  - `get_face_tracking_update()` -> `ARFaceTrackingUpdate` — see: FaceTrackingUpdate
  - `get_frame_sync_mode()` -> `ARFrameSyncMode` — see: FrameSyncMode
  - `get_light_estimation_mode()` -> `ARLightEstimationMode` — see: LightEstimationMode
  - `get_max_num_simultaneous_images_tracked()` -> `int32` — see: MaxNumSimultaneousImagesTracked
  - `get_plane_detection_mode()` -> `ARPlaneDetectionMode` — see: PlaneDetectionMode
  - `get_scene_reconstruction_method()` -> `ARSceneReconstruction` — see: SceneReconstructionMethod
  - `get_session_type()` -> `ARSessionType` — see: SessionType
  - `get_world_alignment()` -> `ARWorldAlignment` — see: EARWorldAlignment
  - `get_world_map_data()` -> `Array [ uint8 ]` — see: WorldMapData
  - `remove_candidate_image(candidate_image)` -> `None` — Remove a candidate image from the ARSessionConfig, by pointer, note the image object must match, not the content of the ...
  - `remove_candidate_image_at_index(index)` -> `None` — Remove a candidate image from the ARSessionConfig, by index.
  - `set_candidate_object_list(candidate_objects)` -> `None` — see: CandidateObjects
  - `set_desired_video_format(new_format)` -> `None` — see: DesiredVideoFormat
  - `set_enable_auto_focus(new_value)` -> `None` — see: bEnableAutoFocus
  - `set_face_tracking_direction(direction)` -> `None` — see: FaceTrackingDirection
  - `set_face_tracking_update(update)` -> `None` — see: FaceTrackingUpdate
  - `set_reset_camera_tracking(new_value)` -> `None` — see: bResetCameraTracking
  - `set_reset_tracked_objects(new_value)` -> `None` — see: bResetTrackedObjects
  - `set_scene_reconstruction_method(scene_reconstruction_method)` -> `None` — see: SceneReconstructionMethod
  - `set_session_tracking_feature_to_enable(session_tracking_feature)` -> `None` — see: EnabledSessionTrackingFeatures
  - `set_world_map_data(world_map_data)` -> `None` — see: WorldMapData
  - `should_enable_auto_focus()` -> `bool` — see: bEnableAutoFocus
  - `should_enable_camera_tracking()` -> `bool` — see: bEnableAutomaticCameraTracking
  - `should_render_camera_overlay()` -> `bool` — see: bEnableAutomaticCameraOverlay
  - `should_reset_camera_tracking()` -> `bool` — see: bResetCameraTracking
  - `should_reset_tracked_objects()` -> `bool` — see: bResetTrackedObjects

### `unreal.ARSharedWorldGameMode`
Inherits: `GameMode` | Header: `ARSharedWorldGameMode.h`

ARShared World Game Mode

**Methods** (4):
  - `get_ar_shared_world_game_state()` -> `ARSharedWorldGameState`
  - `set_ar_shared_world_data(ar_world_data)` -> `None` — Sets the image data for the shared world game session
  - `set_ar_world_sharing_is_ready()` -> `None` — Tells the game mode that the AR data is ready and should be replicated to all connected clients
  - `set_preview_image_data(image_data)` -> `None` — Sets the image data for the shared world game session

**Properties** (1):
  - `buffer_size_per_chunk`: `int` — [Read-Write] The size of the buffer to use per send request. Must be between 1 and 65535, though sho...

### `unreal.ARSharedWorldGameState`
Inherits: `GameState` | Header: `ARSharedWorldGameState.h`

ARShared World Game State

**Methods** (1):
  - `on_ar_world_map_is_ready()` -> `None` — K2 on ARWorld Map Is Ready

**Properties** (6):
  - `ar_world_bytes_delivered`: `int` [Read-Only] — [Read-Only] The amount of the AR world data that has been replicated to this client so far (int32)
  - `ar_world_bytes_total`: `int` [Read-Only] — [Read-Only] The size of the AR world data that will be replicated to each client (int32)
  - `ar_world_data`: `None` [Read-Only] — [Read-Only] Each client and the host have a copy of the shared world data (Array[uint8])
  - `preview_image_bytes_delivered`: `int` [Read-Only] — [Read-Only] The amount of the preview image data that has been replicated to this client so far (int...
  - `preview_image_bytes_total`: `int` [Read-Only] — [Read-Only] The size of the image that will be replicated to each client (int32)
  - `preview_image_data`: `None` [Read-Only] — [Read-Only] The image taken at the time of world saving for use when aligning the AR world later in ...

### `unreal.ARSharedWorldPlayerController`
Inherits: `PlayerController` | Header: `ARSharedWorldPlayerController.h`

ARShared World Player Controller

### `unreal.ARSkyLight`
Inherits: `SkyLight` | Header: `ARSkyLight.h`

This sky light class forces a refresh of the cube map data when an AR environment probe changes

**Methods** (1):
  - `set_environment_capture_probe(capture_probe)` -> `None` — Sets the environment capture probe that this sky light is driven by

### `unreal.ARTexture`
Inherits: `Texture` | Header: `ARTextures.h`

Base class for all AR texture types. Derived from UTexture instead of UTexture2D because UTexture2D is all about streaming and source art ? probably should have been UTexture2DDynamic

**Properties** (4):
  - `external_texture_guid`: `Guid` [Read-Only] — [Read-Only] The guid of texture that gets registered as an external texture (Guid)
  - `size`: `Vector2f` [Read-Only] — [Read-Only] The width and height of the texture (Vector2f)
  - `texture_type`: `ARTextureType` [Read-Only] — [Read-Only] The type of texture this is (ARTextureType)
  - `timestamp`: `float` [Read-Only] — [Read-Only] The timestamp this texture was captured at (float)

### `unreal.ARTextureCameraDepth`
Inherits: `ARTexture` | Header: `ARTextures.h`

Base class for all AR textures that represent the camera depth data

**Properties** (3):
  - `depth_accuracy`: `ARDepthAccuracy` [Read-Only] — [Read-Only] The accuracy of the depth information captured this frame (ARDepthAccuracy)
  - `depth_quality`: `ARDepthQuality` [Read-Only] — [Read-Only] The quality of the depth information captured this frame (ARDepthQuality)
  - `is_temporally_smoothed`: `bool` [Read-Only] — [Read-Only] Whether or not the depth information is temporally smoothed (bool)

### `unreal.ARTextureCameraImage`
Inherits: `ARTexture` | Header: `ARTextures.h`

Base class for all AR textures that represent the camera image data

### `unreal.ARTraceResultLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ARBlueprintLibrary.h`

ARTrace Result Library

**Methods** (6):
  - `get_distance_from_camera(trace_result)` -> `float` [classmethod]
  - `get_local_to_tracking_transform(trace_result)` -> `Transform` [classmethod]
  - `get_local_to_world_transform(trace_result)` -> `Transform` [classmethod]
  - `get_local_transform(trace_result)` -> `Transform` [classmethod]
  - `get_trace_channel(trace_result)` -> `ARLineTraceChannels` [classmethod]
  - `get_tracked_geometry(trace_result)` -> `ARTrackedGeometry` [classmethod]

### `unreal.ARTrackableNotifyComponent`
Inherits: `ActorComponent` | Header: `ARTrackableNotifyComponent.h`

Component used to listen to ar trackable object changes

**Properties** (21):
  - `on_add_tracked_env_probe`: `TrackableEnvProbeDelegate` — [Read-Write] Event that happens when any new ar environment capture probe item is added (TrackableEn...
  - `on_add_tracked_face`: `TrackableFaceDelegate` — [Read-Write] Event that happens when any new ar Face item is added (TrackableFaceDelegate)
  - `on_add_tracked_geometry`: `TrackableDelegate` — [Read-Write] Event that happens when any new trackable ar item is added (TrackableDelegate)
  - `on_add_tracked_image`: `TrackableImageDelegate` — [Read-Write] Event that happens when any new ar Image item is added (TrackableImageDelegate)
  - `on_add_tracked_object`: `TrackableObjectDelegate` — [Read-Write] Event that happens when any new ar detected object item is added (TrackableObjectDelega...
  - `on_add_tracked_plane`: `TrackablePlaneDelegate` — [Read-Write] Event that happens when any new ar plane item is added (TrackablePlaneDelegate)
  - `on_add_tracked_point`: `TrackablePointDelegate` — [Read-Write] Event that happens when any new ar Point item is added (TrackablePointDelegate)
  - `on_remove_tracked_env_probe`: `TrackableEnvProbeDelegate` — [Read-Write] Event that happens when any ar environment capture probe item is removed from the scene...
  - `on_remove_tracked_face`: `TrackableFaceDelegate` — [Read-Write] Event that happens when any ar Face item is removed from the scene (TrackableFaceDelega...
  - `on_remove_tracked_geometry`: `TrackableDelegate` — [Read-Write] Event that happens when any trackable ar item is removed from the scene (TrackableDeleg...
  - `on_remove_tracked_image`: `TrackableImageDelegate` — [Read-Write] Event that happens when any ar Image item is removed from the scene (TrackableImageDele...
  - `on_remove_tracked_object`: `TrackableObjectDelegate` — [Read-Write] Event that happens when any ar detected object item is removed from the scene (Trackabl...
  - `on_remove_tracked_plane`: `TrackablePlaneDelegate` — [Read-Write] Event that happens when any ar plane item is removed from the scene (TrackablePlaneDele...
  - `on_remove_tracked_point`: `TrackablePointDelegate` — [Read-Write] Event that happens when any ar Point item is removed from the scene (TrackablePointDele...
  - `on_update_tracked_env_probe`: `TrackableEnvProbeDelegate` — [Read-Write] Event that happens when any ar environment capture probe item is updated (TrackableEnvP...
  - `on_update_tracked_face`: `TrackableFaceDelegate` — [Read-Write] Event that happens when any ar Face item is updated (TrackableFaceDelegate)
  - `on_update_tracked_geometry`: `TrackableDelegate` — [Read-Write] Event that happens when any trackable ar item is updated (TrackableDelegate)
  - `on_update_tracked_image`: `TrackableImageDelegate` — [Read-Write] Event that happens when any ar Image item is updated (TrackableImageDelegate)
  - `on_update_tracked_object`: `TrackableObjectDelegate` — [Read-Write] Event that happens when any ar detected object item is updated (TrackableObjectDelegate...
  - `on_update_tracked_plane`: `TrackablePlaneDelegate` — [Read-Write] Event that happens when any ar plane item is updated (TrackablePlaneDelegate)
  - `on_update_tracked_point`: `TrackablePointDelegate` — [Read-Write] Event that happens when any ar Point item is updated (TrackablePointDelegate)

### `unreal.ARTrackedGeometry`
Inherits: `Object` | Header: `ARTrackable.h`

ARTracked Geometry

**Methods** (11):
  - `get_debug_name()` -> `Name` — Get Debug Name
  - `get_last_update_frame_number()` -> `int32` — Get Last Update Frame Number
  - `get_last_update_timestamp()` -> `float` — Get Last Update Timestamp
  - `get_local_to_tracking_transform()` -> `Transform` — Get Local to Tracking Transform
  - `get_local_to_world_transform()` -> `Transform` — Get Local to World Transform
  - `get_name()` -> `str` — Get Name
  - `get_object_classification()` -> `ARObjectClassification` — Get Object Classification
  - `get_tracking_state()` -> `ARTrackingState` — Get Tracking State
  - `get_underlying_mesh()` -> `MRMeshComponent` — Get Underlying Mesh
  - `has_spatial_mesh_usage_flag(flag)` -> `bool` — Has Spatial Mesh Usage Flag
  - `is_tracked()` -> `bool` — Is Tracked

**Properties** (1):
  - `unique_id`: `Guid` [Read-Only] — [Read-Only] (Guid)

### `unreal.ARTrackedImage`
Inherits: `ARTrackedGeometry` | Header: `ARTrackable.h`

ARTracked Image

**Methods** (2):
  - `get_detected_image()` -> `ARCandidateImage` — see: DetectedImage
  - `get_estimate_size()` -> `Vector2D`

### `unreal.ARTrackedObject`
Inherits: `ARTrackedGeometry` | Header: `ARTrackable.h`

ARTracked Object

**Methods** (1):
  - `get_detected_object()` -> `ARCandidateObject` — see: DetectedObject

### `unreal.ARTrackedPoint`
Inherits: `ARTrackedGeometry` | Header: `ARTrackable.h`

ARTracked Point

### `unreal.ARTrackedPose`
Inherits: `ARTrackedGeometry` | Header: `ARTrackable.h`

ARTracked Pose

**Methods** (1):
  - `get_tracked_pose_data()` -> `ARPose3D` — Get Tracked Pose Data

### `unreal.ARTrackedQRCode`
Inherits: `ARTrackedImage` | Header: `ARTrackable.h`

ARTracked QRCode

**Properties** (2):
  - `qr_code`: `str` [Read-Only] — [Read-Only] The encoded information in the qr code (str)
  - `version`: `int` [Read-Only] — [Read-Only] The version of the qr code (int32)

### `unreal.CheckGeoTrackingAvailabilityAsyncTaskBlueprintProxy`
Inherits: `ARBaseAsyncTaskBlueprintProxy` | Header: `ARGeoTrackingSupport.h`

Blueprint async task to check Geo tracking availability.

**Properties** (2):
  - `on_failed`: `GeoTrackingAvailabilityDelegate` — [Read-Write] (GeoTrackingAvailabilityDelegate)
  - `on_success`: `GeoTrackingAvailabilityDelegate` — [Read-Write] (GeoTrackingAvailabilityDelegate)

### `unreal.GetGeoLocationAsyncTaskBlueprintProxy`
Inherits: `ARBaseAsyncTaskBlueprintProxy` | Header: `ARGeoTrackingSupport.h`

Blueprint async task to convert Geo location.

**Properties** (2):
  - `on_failed`: `GetGeoLocationDelegate` — [Read-Write] (GetGeoLocationDelegate)
  - `on_success`: `GetGeoLocationDelegate` — [Read-Write] (GetGeoLocationDelegate)

### `unreal.ARAltitudeSource`
Inherits: `EnumBase` | Header: `ARTypes.h`

EARAltitude Source

**Properties** (4):
  - `COARSE`: `ARAltitudeSource = Ellipsis` — The framework sets the altitude using a coarse digital-elevation model. 1
  - `PRECISE`: `ARAltitudeSource = Ellipsis` — The framework sets the altitude using a high-resolution digital-elevation model. 0
  - `UNKNOWN`: `ARAltitudeSource = Ellipsis` — Altitude is not yet set. 3
  - `USER_DEFINED`: `ARAltitudeSource = Ellipsis` — The app defines the alitude. 2

### `unreal.ARCandidateImageOrientation`
Inherits: `EnumBase` | Header: `ARTypes.h`

Tells the image detection code how to assume the image is oriented

**Properties** (2):
  - `LANDSCAPE`: `ARCandidateImageOrientation = Ellipsis` — 0
  - `PORTRAIT`: `ARCandidateImageOrientation = Ellipsis` — 1

### `unreal.ARCaptureType`
Inherits: `EnumBase` | Header: `ARTypes.h`

EARCapture Type

**Properties** (5):
  - `CAMERA`: `ARCaptureType = Ellipsis` — Camera Capture 0
  - `HAND_MESH`: `ARCaptureType = Ellipsis` — Capture a mesh around the playerâs hands 4
  - `QR_CODE`: `ARCaptureType = Ellipsis` — QR Code Capture. 1
  - `SCENE_UNDERSTANDING`: `ARCaptureType = Ellipsis` — Capture detailed information about the scene with all surfaces like walls, floors and so on 3
  - `SPATIAL_MAPPING`: `ARCaptureType = Ellipsis` — Spatial mapping so the app can selectively turn off discovering surfaces 2

### `unreal.ARDepthAccuracy`
Inherits: `EnumBase` | Header: `ARTextures.h`

EARDepth Accuracy

**Properties** (3):
  - `ACCURATE`: `ARDepthAccuracy = Ellipsis` — Accurate depth values that match the physical world 2
  - `APPROXIMATE`: `ARDepthAccuracy = Ellipsis` — Suitable for gross sorting of depths 1
  - `UNKOWN`: `ARDepthAccuracy = Ellipsis` — 0

### `unreal.ARDepthQuality`
Inherits: `EnumBase` | Header: `ARTextures.h`

EARDepth Quality

**Properties** (3):
  - `HIGH`: `ARDepthQuality = Ellipsis` — Suitable for rendering against or for use in scene reconstruction 2
  - `LOW`: `ARDepthQuality = Ellipsis` — Not suitable to use as part of a rendering pass or for scene reconstruction 1
  - `UNKOWN`: `ARDepthQuality = Ellipsis` — 0

### `unreal.AREnvironmentCaptureProbeType`
Inherits: `EnumBase` | Header: `ARSessionConfig.h`

Options for how environment textures are generated. This feature is used by ARKit.

**Properties** (3):
  - `AUTOMATIC`: `AREnvironmentCaptureProbeType = Ellipsis` — The AR system automatically creates and places the environment capture probes. 2
  - `MANUAL`: `AREnvironmentCaptureProbeType = Ellipsis` — The app specifies where the environment capture probes are located and their size. 1
  - `NONE`: `AREnvironmentCaptureProbeType = Ellipsis` — Disables environment texture generation. 0

### `unreal.AREye`
Inherits: `EnumBase` | Header: `ARTrackable.h`

EAREye

**Properties** (2):
  - `LEFT_EYE`: `AREye = Ellipsis` — 0
  - `RIGHT_EYE`: `AREye = Ellipsis` — 1

### `unreal.ARFaceBlendShape`
Inherits: `EnumBase` | Header: `ARTrackable.h`

EARFace Blend Shape

**Properties** (61):
  - `BROW_DOWN_LEFT`: `ARFaceBlendShape = Ellipsis` — Brow blend shapes 41
  - `BROW_DOWN_RIGHT`: `ARFaceBlendShape = Ellipsis` — 42
  - `BROW_INNER_UP`: `ARFaceBlendShape = Ellipsis` — 43
  - `BROW_OUTER_UP_LEFT`: `ARFaceBlendShape = Ellipsis` — 44
  - `BROW_OUTER_UP_RIGHT`: `ARFaceBlendShape = Ellipsis` — 45
  - `CHEEK_PUFF`: `ARFaceBlendShape = Ellipsis` — Cheek blend shapes 46
  - `CHEEK_SQUINT_LEFT`: `ARFaceBlendShape = Ellipsis` — 47
  - `CHEEK_SQUINT_RIGHT`: `ARFaceBlendShape = Ellipsis` — 48
  - `EYE_BLINK_LEFT`: `ARFaceBlendShape = Ellipsis` — Left eye blend shapes 0
  - `EYE_BLINK_RIGHT`: `ARFaceBlendShape = Ellipsis` — Right eye blend shapes 7
  - `EYE_LOOK_DOWN_LEFT`: `ARFaceBlendShape = Ellipsis` — 1
  - `EYE_LOOK_DOWN_RIGHT`: `ARFaceBlendShape = Ellipsis` — 8
  - `EYE_LOOK_IN_LEFT`: `ARFaceBlendShape = Ellipsis` — 2
  - `EYE_LOOK_IN_RIGHT`: `ARFaceBlendShape = Ellipsis` — 9
  - `EYE_LOOK_OUT_LEFT`: `ARFaceBlendShape = Ellipsis` — 3
  - `EYE_LOOK_OUT_RIGHT`: `ARFaceBlendShape = Ellipsis` — 10
  - `EYE_LOOK_UP_LEFT`: `ARFaceBlendShape = Ellipsis` — 4
  - `EYE_LOOK_UP_RIGHT`: `ARFaceBlendShape = Ellipsis` — 11
  - `EYE_SQUINT_LEFT`: `ARFaceBlendShape = Ellipsis` — 5
  - `EYE_SQUINT_RIGHT`: `ARFaceBlendShape = Ellipsis` — 12
  - `EYE_WIDE_LEFT`: `ARFaceBlendShape = Ellipsis` — 6
  - `EYE_WIDE_RIGHT`: `ARFaceBlendShape = Ellipsis` — 13
  - `HEAD_PITCH`: `ARFaceBlendShape = Ellipsis` — 53
  - `HEAD_ROLL`: `ARFaceBlendShape = Ellipsis` — 54
  - `HEAD_YAW`: `ARFaceBlendShape = Ellipsis` — Treat the head rotation as curves for LiveLink support 52
  - `JAW_FORWARD`: `ARFaceBlendShape = Ellipsis` — Jaw blend shapes 14
  - `JAW_LEFT`: `ARFaceBlendShape = Ellipsis` — 15
  - `JAW_OPEN`: `ARFaceBlendShape = Ellipsis` — 17
  - `JAW_RIGHT`: `ARFaceBlendShape = Ellipsis` — 16
  - `LEFT_EYE_PITCH`: `ARFaceBlendShape = Ellipsis` — 56
  - `LEFT_EYE_ROLL`: `ARFaceBlendShape = Ellipsis` — 57
  - `LEFT_EYE_YAW`: `ARFaceBlendShape = Ellipsis` — Treat eye rotation as curves for LiveLink support 55
  - `MOUTH_CLOSE`: `ARFaceBlendShape = Ellipsis` — Mouth blend shapes 18
  - `MOUTH_DIMPLE_LEFT`: `ARFaceBlendShape = Ellipsis` — 27
  - `MOUTH_DIMPLE_RIGHT`: `ARFaceBlendShape = Ellipsis` — 28
  - `MOUTH_FROWN_LEFT`: `ARFaceBlendShape = Ellipsis` — 25
  - `MOUTH_FROWN_RIGHT`: `ARFaceBlendShape = Ellipsis` — 26
  - `MOUTH_FUNNEL`: `ARFaceBlendShape = Ellipsis` — 19
  - `MOUTH_LEFT`: `ARFaceBlendShape = Ellipsis` — 21
  - `MOUTH_LOWER_DOWN_LEFT`: `ARFaceBlendShape = Ellipsis` — 37
  - `MOUTH_LOWER_DOWN_RIGHT`: `ARFaceBlendShape = Ellipsis` — 38
  - `MOUTH_PRESS_LEFT`: `ARFaceBlendShape = Ellipsis` — 35
  - `MOUTH_PRESS_RIGHT`: `ARFaceBlendShape = Ellipsis` — 36
  - `MOUTH_PUCKER`: `ARFaceBlendShape = Ellipsis` — 20
  - `MOUTH_RIGHT`: `ARFaceBlendShape = Ellipsis` — 22
  - `MOUTH_ROLL_LOWER`: `ARFaceBlendShape = Ellipsis` — 31
  - `MOUTH_ROLL_UPPER`: `ARFaceBlendShape = Ellipsis` — 32
  - `MOUTH_SHRUG_LOWER`: `ARFaceBlendShape = Ellipsis` — 33
  - `MOUTH_SHRUG_UPPER`: `ARFaceBlendShape = Ellipsis` — 34
  - `MOUTH_SMILE_LEFT`: `ARFaceBlendShape = Ellipsis` — 23
  - `MOUTH_SMILE_RIGHT`: `ARFaceBlendShape = Ellipsis` — 24
  - `MOUTH_STRETCH_LEFT`: `ARFaceBlendShape = Ellipsis` — 29
  - `MOUTH_STRETCH_RIGHT`: `ARFaceBlendShape = Ellipsis` — 30
  - `MOUTH_UPPER_UP_LEFT`: `ARFaceBlendShape = Ellipsis` — 39
  - `MOUTH_UPPER_UP_RIGHT`: `ARFaceBlendShape = Ellipsis` — 40
  - `NOSE_SNEER_LEFT`: `ARFaceBlendShape = Ellipsis` — Nose blend shapes 49
  - `NOSE_SNEER_RIGHT`: `ARFaceBlendShape = Ellipsis` — 50
  - `RIGHT_EYE_PITCH`: `ARFaceBlendShape = Ellipsis` — 59
  - `RIGHT_EYE_ROLL`: `ARFaceBlendShape = Ellipsis` — 60
  - `RIGHT_EYE_YAW`: `ARFaceBlendShape = Ellipsis` — 58
  - `TONGUE_OUT`: `ARFaceBlendShape = Ellipsis` — 51

### `unreal.ARFaceTrackingDirection`
Inherits: `EnumBase` | Header: `ARTrackable.h`

EARFace Tracking Direction

**Properties** (2):
  - `FACE_MIRRORED`: `ARFaceTrackingDirection = Ellipsis` — Blend shapes are tracked as if looking at the face, e.g. right eye is the meshâs left eye and righ...
  - `FACE_RELATIVE`: `ARFaceTrackingDirection = Ellipsis` — Blend shapes are tracked as if looking out of the face, e.g. right eye is the meshâs right eye and...

### `unreal.ARFaceTrackingUpdate`
Inherits: `EnumBase` | Header: `ARSessionConfig.h`

Options for the kind of data to update during Face Tracking. This feature is used by ARKit.

**Properties** (2):
  - `CURVES_AND_GEO`: `ARFaceTrackingUpdate = Ellipsis` — Both curves and geometry are updated. This is useful for mesh visualization. 0
  - `CURVES_ONLY`: `ARFaceTrackingUpdate = Ellipsis` — Only the curve data is updated. 1

### `unreal.ARFaceTransformMixing`
Inherits: `EnumBase` | Header: `ARComponent.h`

EARFace Transform Mixing

**Properties** (4):
  - `COMPONENT_LOCATION_TRACKED_ROTATION`: `ARFaceTransformMixing = Ellipsis` — Use the componentâs location and apply the rotation from the tracked mesh 1
  - `COMPONENT_ONLY`: `ARFaceTransformMixing = Ellipsis` — Uses the componentâs transform exclusively. Only setting for non-tracked meshes 0
  - `COMPONENT_WITH_TRACKED`: `ARFaceTransformMixing = Ellipsis` — Concatenate the component and the tracked face transforms 2
  - `TRACKING_ONLY`: `ARFaceTransformMixing = Ellipsis` — Use only the tracked face transform 3

### `unreal.ARFrameSyncMode`
Inherits: `EnumBase` | Header: `ARSessionConfig.h`

Options for how the Unreal frame synchronizes with camera image updates. This feature is used by ARCore.

**Properties** (2):
  - `SYNC_TICK_WITHOUT_CAMERA_IMAGE`: `ARFrameSyncMode = Ellipsis` — Unreal tick will not related to the camera image update rate. 1
  - `SYNC_TICK_WITH_CAMERA_IMAGE`: `ARFrameSyncMode = Ellipsis` — Unreal tick will be synced with the camera image update rate. 0

### `unreal.ARGeoTrackingAccuracy`
Inherits: `EnumBase` | Header: `ARGeoTrackingSupport.h`

EARGeo Tracking Accuracy

**Properties** (4):
  - `HIGH`: `ARGeoTrackingAccuracy = Ellipsis` — Geo-tracking accuracy is high. 3
  - `LOW`: `ARGeoTrackingAccuracy = Ellipsis` — Geo-tracking accuracy is low. 1
  - `MEDIUM`: `ARGeoTrackingAccuracy = Ellipsis` — Geo-tracking accuracy is average. 2
  - `UNDETERMINED`: `ARGeoTrackingAccuracy = Ellipsis` — Geo-tracking accuracy is undetermined. 0

### `unreal.ARGeoTrackingState`
Inherits: `EnumBase` | Header: `ARGeoTrackingSupport.h`

EARGeo Tracking State

**Properties** (4):
  - `INITIALIZING`: `ARGeoTrackingState = Ellipsis` — The session is initializing geo tracking. 0
  - `LOCALIZED`: `ARGeoTrackingState = Ellipsis` — Geo tracking is localized. 1
  - `LOCALIZING`: `ARGeoTrackingState = Ellipsis` — Geo tracking is attempting to localize against a map. 2
  - `NOT_AVAILABLE`: `ARGeoTrackingState = Ellipsis` — Geo tracking is not available. 3

### `unreal.ARGeoTrackingStateReason`
Inherits: `EnumBase` | Header: `ARGeoTrackingSupport.h`

EARGeo Tracking State Reason

**Properties** (9):
  - `DEVICE_POINTED_TOO_LOW`: `ARGeoTrackingStateReason = Ellipsis` — The user is pointing the device too low to use geo tracking. 3
  - `GEO_DATA_NOT_LOADED`: `ARGeoTrackingStateReason = Ellipsis` — The framework is actively attempting to download localization imagery. 6
  - `NEED_LOCATION_PERMISSIONS`: `ARGeoTrackingStateReason = Ellipsis` — Geo tracking needs location permissions from the user. 2
  - `NONE`: `ARGeoTrackingStateReason = Ellipsis` — No issues reported. 0
  - `NOT_AVAILABLE_AT_LOCATION`: `ARGeoTrackingStateReason = Ellipsis` — Geo tracking is not available at the location. 1
  - `VISUAL_LOCALIZATION_FAILED`: `ARGeoTrackingStateReason = Ellipsis` — The framework failed to match its localization imagery with the deviceâs camera captures. 7
  - `WAITING_FOR_AVAILABILITY_CHECK`: `ARGeoTrackingStateReason = Ellipsis` — The framework is waiting for the availability check. 8
  - `WAITING_FOR_LOCATION`: `ARGeoTrackingStateReason = Ellipsis` — The framework is waiting for a position for the user. 5
  - `WORLD_TRACKING_UNSTABLE`: `ARGeoTrackingStateReason = Ellipsis` — The session is unsure of the deviceâs pose in the physical environment. 4

### `unreal.ARJointTransformSpace`
Inherits: `EnumBase` | Header: `ARTypes.h`

Describes the potential spaces in which the join transform can be defined with AR pose tracking

**Properties** (2):
  - `MODEL`: `ARJointTransformSpace = Ellipsis` — Joint transform is relative to the origin of the model space
which is usually attached to a particul...
  - `PARENT_JOINT`: `ARJointTransformSpace = Ellipsis` — Joint transform is relative to its parent 1

### `unreal.ARLightEstimationMode`
Inherits: `EnumBase` | Header: `ARSessionConfig.h`

Options for how light is estimated based on the camera capture. This feature is used by ARCore and ARKit.

**Properties** (3):
  - `AMBIENT_LIGHT_ESTIMATE`: `ARLightEstimationMode = Ellipsis` — Estimates an ambient light. 1
  - `DIRECTIONAL_LIGHT_ESTIMATE`: `ARLightEstimationMode = Ellipsis` — Estimates a directional light of the environment with an additional key light.
Currently not support...
  - `NONE`: `ARLightEstimationMode = Ellipsis` — Disables light estimation. 0

### `unreal.ARLineTraceChannels`
Inherits: `EnumBase` | Header: `ARTypes.h`

Channels that let users select which kind of tracked geometry to trace against.

**Properties** (5):
  - `FEATURE_POINT`: `ARLineTraceChannels = Ellipsis` — Trace against points that the AR system considers significant . 1
  - `GROUND_PLANE`: `ARLineTraceChannels = Ellipsis` — Trace against estimated plane that does not have an associated tracked geometry. 2
  - `NONE`: `ARLineTraceChannels = Ellipsis` — 0
  - `PLANE_USING_BOUNDARY_POLYGON`: `ARLineTraceChannels = Ellipsis` — Trace against any plane tracked geometries using the boundary polygon. 8
  - `PLANE_USING_EXTENT`: `ARLineTraceChannels = Ellipsis` — Trace against any plane tracked geometries using Center and Extent. 4

### `unreal.ARObjectClassification`
Inherits: `EnumBase` | Header: `ARTypes.h`

Indicates what type of object the scene understanding system thinks it is

**Properties** (14):
  - `CEILING`: `ARObjectClassification = Ellipsis` — A horizontal plane that is the ceiling 3
  - `DOOR`: `ARObjectClassification = Ellipsis` — A door 12
  - `FACE`: `ARObjectClassification = Ellipsis` — A human face 7
  - `FLOOR`: `ARObjectClassification = Ellipsis` — A horizontal plane that is the floor 4
  - `HAND_MESH`: `ARObjectClassification = Ellipsis` — A userâs hand 11
  - `IMAGE`: `ARObjectClassification = Ellipsis` — A recognized image in the scene 8
  - `NOT_APPLICABLE`: `ARObjectClassification = Ellipsis` — Not applicable to scene understanding 0
  - `SCENE_OBJECT`: `ARObjectClassification = Ellipsis` — A closed mesh that was identified in the scene 10
  - `SEAT`: `ARObjectClassification = Ellipsis` — A horizontal plane that is a seat 6
  - `TABLE`: `ARObjectClassification = Ellipsis` — A horizontal plane that is a table 5
  - `UNKNOWN`: `ARObjectClassification = Ellipsis` — Scene understanding doesnât know what this is 1
  - `WALL`: `ARObjectClassification = Ellipsis` — A vertical plane that is a wall 2
  - `WINDOW`: `ARObjectClassification = Ellipsis` — A window 13
  - `WORLD`: `ARObjectClassification = Ellipsis` — A chunk of mesh that does not map to a specific object type but is seen by the AR system 9

### `unreal.ARPlaneDetectionMode`
Inherits: `EnumBase` | Header: `ARSessionConfig.h`

Options for how flat surfaces are detected. This feature is used by ARCore and ARKit.

**Properties** (3):
  - `HORIZONTAL_PLANE_DETECTION`: `ARPlaneDetectionMode = Ellipsis` — Detects horizontal, flat surfaces. 1
  - `NONE`: `ARPlaneDetectionMode = Ellipsis` — Disables plane detection. 0
  - `VERTICAL_PLANE_DETECTION`: `ARPlaneDetectionMode = Ellipsis` — Detects vertical, flat surfaces. 2

### `unreal.ARPlaneOrientation`
Inherits: `EnumBase` | Header: `ARTypes.h`

Describes the tracked plane orientation

**Properties** (3):
  - `DIAGONAL`: `ARPlaneOrientation = Ellipsis` — For AR systems that can match planes to slopes 2
  - `HORIZONTAL`: `ARPlaneOrientation = Ellipsis` — 0
  - `VERTICAL`: `ARPlaneOrientation = Ellipsis` — 1

### `unreal.ARSceneReconstruction`
Inherits: `EnumBase` | Header: `ARSessionConfig.h`

Options for how the scene should be reconstructed. This feature is used by ARKit.

**Properties** (3):
  - `MESH_ONLY`: `ARSceneReconstruction = Ellipsis` — Creates a mesh approximation of the environment. 1
  - `MESH_WITH_CLASSIFICATION`: `ARSceneReconstruction = Ellipsis` — Creates a mesh approximation of the environment and classifies the objects constructed. 2
  - `NONE`: `ARSceneReconstruction = Ellipsis` — Disables scene reconstruction 0

### `unreal.ARServiceAvailability`
Inherits: `EnumBase` | Header: `ARDependencyHandler.h`

EARService Availability

**Properties** (7):
  - `SUPPORTED_INSTALLED`: `ARServiceAvailability = Ellipsis` — AR service is supported and installed 6
  - `SUPPORTED_NOT_INSTALLED`: `ARServiceAvailability = Ellipsis` — AR service is not installed 4
  - `SUPPORTED_VERSION_TOO_OLD`: `ARServiceAvailability = Ellipsis` — AR service is installed but the version is too old 5
  - `UNKNOWN_CHECKING`: `ARServiceAvailability = Ellipsis` — Availability is being checked 1
  - `UNKNOWN_ERROR`: `ARServiceAvailability = Ellipsis` — Availability is unknown due to an error during checking 0
  - `UNKNOWN_TIMED_OUT`: `ARServiceAvailability = Ellipsis` — Availability is unknown due to timeout during checking 2
  - `UNSUPPORTED_DEVICE_NOT_CAPABLE`: `ARServiceAvailability = Ellipsis` — The device is not capable of running the AR service 3

### `unreal.ARServiceInstallRequestResult`
Inherits: `EnumBase` | Header: `ARDependencyHandler.h`

EARService Install Request Result

**Properties** (4):
  - `DEVICE_NOT_COMPATIBLE`: `ARServiceInstallRequestResult = Ellipsis` — The device is not capable of running the AR service 1
  - `FATAL_ERROR`: `ARServiceInstallRequestResult = Ellipsis` — Other error while installing the AR service 3
  - `INSTALLED`: `ARServiceInstallRequestResult = Ellipsis` — AR service is installed 0
  - `USER_DECLINED_INSTALLATION`: `ARServiceInstallRequestResult = Ellipsis` — The user declined the request to install the AR service 2

### `unreal.ARServicePermissionRequestResult`
Inherits: `EnumBase` | Header: `ARDependencyHandler.h`

EARService Permission Request Result

**Properties** (2):
  - `DENIED`: `ARServicePermissionRequestResult = Ellipsis` — The permission is denied by the user 1
  - `GRANTED`: `ARServicePermissionRequestResult = Ellipsis` — The permission is granted by the user 0

### `unreal.ARSessionConfigFlags`
Inherits: `EnumBase` | Header: `ARComponent.h`

EARSession Config Flags

**Properties** (6):
  - `GENERATE_COLLISION_FOR_MESH_DATA`: `ARSessionConfigFlags = Ellipsis` — 4
  - `GENERATE_MESH_DATA`: `ARSessionConfigFlags = Ellipsis` — 1
  - `GENERATE_NAV_MESH_FOR_MESH_DATA`: `ARSessionConfigFlags = Ellipsis` — 8
  - `NONE`: `ARSessionConfigFlags = Ellipsis` — 0
  - `RENDER_MESH_DATA_IN_WIREFRAME`: `ARSessionConfigFlags = Ellipsis` — 2
  - `USE_MESH_DATA_FOR_OCCLUSION`: `ARSessionConfigFlags = Ellipsis` — 16

### `unreal.ARSessionStatusType`
Inherits: `EnumBase` | Header: `ARTypes.h`

Describes the current status of the AR session.

**Properties** (7):
  - `FATAL_ERROR`: `ARSessionStatusType = Ellipsis` — The AR session encountered fatal error; the developer should callStartARSession()to re-start the AR ...
  - `NOT_STARTED`: `ARSessionStatusType = Ellipsis` — Unreal AR session has not started yet. 0
  - `NOT_SUPPORTED`: `ARSessionStatusType = Ellipsis` — Unreal AR session failed to start due to the AR subsystem not being supported by the device. 2
  - `OTHER`: `ARSessionStatusType = Ellipsis` — Session isnât running due to unknown reason;
see: FARSessionStatus::AdditionalInfo for more inform...
  - `PERMISSION_NOT_GRANTED`: `ARSessionStatusType = Ellipsis` — AR session failed to start because it lacks the necessary permission (likely access to the camera or...
  - `RUNNING`: `ARSessionStatusType = Ellipsis` — Unreal AR session is running. 1
  - `UNSUPPORTED_CONFIGURATION`: `ARSessionStatusType = Ellipsis` — AR session failed to start because the configuration isnât supported. 5

### `unreal.ARSessionTrackingFeature`
Inherits: `EnumBase` | Header: `ARSessionConfig.h`

Options for more tracking features to be enabled for the session, in addition to what is already defined in the projectâs EARSessionType.:

**Properties** (6):
  - `NONE`: `ARSessionTrackingFeature = Ellipsis` — No additional features are enabled. 0
  - `PERSON_SEGMENTATION`: `ARSessionTrackingFeature = Ellipsis` — Uses person segmentation for occlusion in the session. This feature is used by ARKit. 2
  - `PERSON_SEGMENTATION_WITH_DEPTH`: `ARSessionTrackingFeature = Ellipsis` — Uses person segmentation with depth information for occlusion in the session. This feature is used b...
  - `POSE_DETECTION2D`: `ARSessionTrackingFeature = Ellipsis` — Adds tracking for 2D human poses to the session. This feature is used by ARKit. 1
  - `SCENE_DEPTH`: `ARSessionTrackingFeature = Ellipsis` — Uses scene depth for occlusion while tracking in the session. This feature is used by ARCore and ARK...
  - `SMOOTHED_SCENE_DEPTH`: `ARSessionTrackingFeature = Ellipsis` — Uses smoothed scene depth for occlusion while tracking in the session. This feature is used by ARKit...

### `unreal.ARSessionType`
Inherits: `EnumBase` | Header: `ARSessionConfig.h`

Options for the tracking type of the session. All AR platforms use this structure but only some session tracking are supported on each platform. The options are mutually exclusive.

**Properties** (8):
  - `FACE`: `ARSessionType = Ellipsis` — A session where only faces are tracked. ARKit and ARCore support this type of tracking using the fro...
  - `GEO_TRACKING`: `ARSessionType = Ellipsis` — A session where geographic locations are tracked. ARKit supports this type of tracking. 7
  - `IMAGE`: `ARSessionType = Ellipsis` — A session where only images supplied by the app are tracked. There is no world tracking. ARKit suppo...
  - `NONE`: `ARSessionType = Ellipsis` — No tracking in the session. 0
  - `OBJECT_SCANNING`: `ARSessionType = Ellipsis` — A session where objects are scanned for object detection in a later World Tracking session. ARKit su...
  - `ORIENTATION`: `ARSessionType = Ellipsis` — A session where only the orientation of the device is tracked. ARKit supports this type of tracking....
  - `POSE_TRACKING`: `ARSessionType = Ellipsis` — A session where human poses in 3D are tracked. ARKit supports this type of tracking using the rear-f...
  - `WORLD`: `ARSessionType = Ellipsis` — A session where the position and orientation of the device is tracked relative to objects in the env...

### `unreal.ARSpatialMeshUsageFlags`
Inherits: `EnumBase` | Header: `ARTypes.h`

Indicates how the spatial mesh should be visualized

**Properties** (3):
  - `COLLISION`: `ARSpatialMeshUsageFlags = Ellipsis` — This mesh should be used when placing objects on real world surfaces.  This must be set to use physi...
  - `NOT_APPLICABLE`: `ARSpatialMeshUsageFlags = Ellipsis` — Not applicable to scene understanding. 0
  - `VISIBLE`: `ARSpatialMeshUsageFlags = Ellipsis` — This mesh should have a visible material applied to it. 1

### `unreal.ARTextureType`
Inherits: `EnumBase` | Header: `ARTextures.h`

EARTexture Type

**Properties** (8):
  - `CAMERA_DEPTH`: `ARTextureType = Ellipsis` — 2
  - `CAMERA_IMAGE`: `ARTextureType = Ellipsis` — 1
  - `ENVIRONMENT_CAPTURE`: `ARTextureType = Ellipsis` — 3
  - `PERSON_SEGMENTATION_DEPTH`: `ARTextureType = Ellipsis` — 5
  - `PERSON_SEGMENTATION_IMAGE`: `ARTextureType = Ellipsis` — 4
  - `SCENE_DEPTH_CONFIDENCE_MAP`: `ARTextureType = Ellipsis` — 7
  - `SCENE_DEPTH_MAP`: `ARTextureType = Ellipsis` — 6
  - `UNKNOWN`: `ARTextureType = Ellipsis` — 0

### `unreal.ARTrackingQuality`
Inherits: `EnumBase` | Header: `ARTypes.h`

EARTracking Quality

**Properties** (3):
  - `NOT_TRACKING`: `ARTrackingQuality = Ellipsis` — The tracking quality is not available. 0
  - `ORIENTATION_AND_POSITION`: `ARTrackingQuality = Ellipsis` — The tracking quality is good. 2
  - `ORIENTATION_ONLY`: `ARTrackingQuality = Ellipsis` — The tracking quality is limited, relying only on the deviceâs motion. 1

### `unreal.ARTrackingQualityReason`
Inherits: `EnumBase` | Header: `ARTypes.h`

EARTracking Quality Reason

**Properties** (7):
  - `BAD_STATE`: `ARTrackingQualityReason = Ellipsis` — Tracking lost due to bad internal state. Please try restarting the AR experience. 6
  - `EXCESSIVE_MOTION`: `ARTrackingQualityReason = Ellipsis` — The device is moving too fast for accurate image-based position tracking. 3
  - `INITIALIZING`: `ARTrackingQualityReason = Ellipsis` — The AR session has not yet gathered enough camera or motion data to provide tracking information. 1
  - `INSUFFICIENT_FEATURES`: `ARTrackingQualityReason = Ellipsis` — The scene visible to the camera does not contain enough distinguishable features for image-based pos...
  - `INSUFFICIENT_LIGHT`: `ARTrackingQualityReason = Ellipsis` — Tracking lost due to poor lighting conditions. Please move to a more brightly lit area 5
  - `NONE`: `ARTrackingQualityReason = Ellipsis` — Current Tracking is not limited 0
  - `RELOCALIZING`: `ARTrackingQualityReason = Ellipsis` — The AR session is attempting to resume after an interruption. 2

### `unreal.ARTrackingState`
Inherits: `EnumBase` | Header: `ARTypes.h`

EARTracking State

**Properties** (4):
  - `NOT_TRACKING`: `ARTrackingState = Ellipsis` — Currently not tracking, but may resume tracking later. 2
  - `STOPPED_TRACKING`: `ARTrackingState = Ellipsis` — Stopped tracking forever. 3
  - `TRACKING`: `ARTrackingState = Ellipsis` — Currently tracking. 1
  - `UNKNOWN`: `ARTrackingState = Ellipsis` — Unknown tracking state 0

### `unreal.ARWorldAlignment`
Inherits: `EnumBase` | Header: `ARSessionConfig.h`

Options for how the sceneâs coordinate system is constructed. This feature is used by ARKit.

**Properties** (3):
  - `CAMERA`: `ARWorldAlignment = Ellipsis` — The coordinate system matches the cameraâs orientation. This option is recommended for Face AR. 2
  - `GRAVITY`: `ARWorldAlignment = Ellipsis` — The coordinate system is aligned with gravity, defined by the vector (0, -1, 0). Origin is the initi...
  - `GRAVITY_AND_HEADING`: `ARWorldAlignment = Ellipsis` — The coordinate system is aligned with gravity, defined by the vector (0, -1, 0),
and compass heading...

### `unreal.ARWorldMappingState`
Inherits: `EnumBase` | Header: `ARTypes.h`

Gives feedback as to whether the AR data can be saved and relocalized or not

**Properties** (4):
  - `MAPPED`: `ARWorldMappingState = Ellipsis` — World mapping has mapped the area and is fully relocalizable 3
  - `NOT_AVAILABLE`: `ARWorldMappingState = Ellipsis` — World mapping is not available 0
  - `STILL_MAPPING_NOT_RELOCALIZABLE`: `ARWorldMappingState = Ellipsis` — World mapping is still in progress but without enough data for relocalization 1
  - `STILL_MAPPING_RELOCALIZABLE`: `ARWorldMappingState = Ellipsis` — World mapping is still in progress but there is enough data captured for relocalization 2

### `unreal.FaceComponentDebugMode`
Inherits: `EnumBase` | Header: `ARComponent.h`

EFace Component Debug Mode

**Properties** (3):
  - `NONE`: `FaceComponentDebugMode = Ellipsis` — The debug mode is disabled 0
  - `SHOW_EYE_VECTORS`: `FaceComponentDebugMode = Ellipsis` — Display vectors for both eyes 1
  - `SHOW_FACE_MESH`: `FaceComponentDebugMode = Ellipsis` — Display the face mesh in wireframe 2

### `unreal.GeoAnchorComponentDebugMode`
Inherits: `EnumBase` | Header: `ARComponent.h`

EGeo Anchor Component Debug Mode

**Properties** (2):
  - `NONE`: `GeoAnchorComponentDebugMode = Ellipsis` — The debug mode is disabled 0
  - `SHOW_GEO_DATA`: `GeoAnchorComponentDebugMode = Ellipsis` — Display Geo related data 1

### `unreal.ImageComponentDebugMode`
Inherits: `EnumBase` | Header: `ARComponent.h`

EImage Component Debug Mode

**Properties** (2):
  - `NONE`: `ImageComponentDebugMode = Ellipsis` — The debug mode is disabled 0
  - `SHOW_DETECTED_IMAGE`: `ImageComponentDebugMode = Ellipsis` — Display info about the detected image 1

### `unreal.PlaneComponentDebugMode`
Inherits: `EnumBase` | Header: `ARComponent.h`

EPlane Component Debug Mode

**Properties** (3):
  - `NONE`: `PlaneComponentDebugMode = Ellipsis` — The debug mode is disabled 0
  - `SHOW_CLASSIFICATION`: `PlaneComponentDebugMode = Ellipsis` — Use different coloration to indicate the classification of this plane 2
  - `SHOW_NETWORK_ROLE`: `PlaneComponentDebugMode = Ellipsis` — Use different coloration to indicate if the plane belongs to the local or remote client 1

### `unreal.PoseComponentDebugMode`
Inherits: `EnumBase` | Header: `ARComponent.h`

EPose Component Debug Mode

**Properties** (2):
  - `NONE`: `PoseComponentDebugMode = Ellipsis` — The debug mode is disabled 0
  - `SHOW_SKELETON`: `PoseComponentDebugMode = Ellipsis` — Show the skeleton with debug draw 1

### `unreal.QRCodeComponentDebugMode`
Inherits: `EnumBase` | Header: `ARComponent.h`

EQRCode Component Debug Mode

**Properties** (2):
  - `NONE`: `QRCodeComponentDebugMode = Ellipsis` — The debug mode is disabled 0
  - `SHOW_QR_CODE`: `QRCodeComponentDebugMode = Ellipsis` — Show info about the detected QR code 1

### `unreal.ARGetCandidateObjectPin`
Inherits: `MulticastDelegateBase` | Header: `ARBlueprintProxy.h`

ARGet Candidate Object Pin Delegate Signature

### `unreal.ARLifeCycleComponent_InstanceARActorSpawnedDelegate`
Inherits: `MulticastDelegateBase` | Header: `ARLifeCycleComponent.h`

Called when an AR actor is spawned on the server

### `unreal.ARLifeCycleComponent_InstanceARActorToBeDestroyedDelegate`
Inherits: `MulticastDelegateBase` | Header: `ARLifeCycleComponent.h`

Called just before the AR actor is destroyed on the server

### `unreal.ARSaveWorldPin`
Inherits: `MulticastDelegateBase` | Header: `ARBlueprintProxy.h`

ARSave World Pin Delegate Signature

### `unreal.CheckGeoTrackingAvailabilityAsyncTaskBlueprintProxy_GeoTrackingAvailabilityDelegate`
Inherits: `MulticastDelegateBase` | Header: `ARGeoTrackingSupport.h`

Geo Tracking Availability Delegate Delegate Signature

### `unreal.GetGeoLocationAsyncTaskBlueprintProxy_GetGeoLocationDelegate`
Inherits: `MulticastDelegateBase` | Header: `ARGeoTrackingSupport.h`

Get Geo Location Delegate Delegate Signature

### `unreal.OnARTrackingStateChanged`
Inherits: `MulticastDelegateBase` | Header: `ARTypes.h`

On ARTracking State Changed Delegate Signature

### `unreal.OnARTransformUpdated`
Inherits: `MulticastDelegateBase` | Header: `ARTypes.h`

On ARTransform Updated Delegate Signature

### `unreal.TrackableDelegate`
Inherits: `MulticastDelegateBase` | Header: `ARTrackableNotifyComponent.h`

Trackable Delegate Delegate Signature

### `unreal.TrackableEnvProbeDelegate`
Inherits: `MulticastDelegateBase` | Header: `ARTrackableNotifyComponent.h`

Trackable Env Probe Delegate Delegate Signature

### `unreal.TrackableFaceDelegate`
Inherits: `MulticastDelegateBase` | Header: `ARTrackableNotifyComponent.h`

Trackable Face Delegate Delegate Signature

### `unreal.TrackableImageDelegate`
Inherits: `MulticastDelegateBase` | Header: `ARTrackableNotifyComponent.h`

Trackable Image Delegate Delegate Signature

### `unreal.TrackableObjectDelegate`
Inherits: `MulticastDelegateBase` | Header: `ARTrackableNotifyComponent.h`

Trackable Object Delegate Delegate Signature

### `unreal.TrackablePlaneDelegate`
Inherits: `MulticastDelegateBase` | Header: `ARTrackableNotifyComponent.h`

Trackable Plane Delegate Delegate Signature

### `unreal.TrackablePointDelegate`
Inherits: `MulticastDelegateBase` | Header: `ARTrackableNotifyComponent.h`

Trackable Point Delegate Delegate Signature
