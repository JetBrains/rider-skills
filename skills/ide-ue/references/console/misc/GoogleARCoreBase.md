# UE Python API — GoogleARCoreBase Module

**23 types** from the `GoogleARCoreBase` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GoogleARCoreAugmentedImageDatabaseEntry`, `GoogleARCoreCameraConfig`, `ARCoreCameraTexture`, `ARCoreDepthTexture`, `GoogleARCoreAugmentedFace`, `GoogleARCoreAugmentedImage`, `GoogleARCoreAugmentedImageDatabase`, `GoogleARCoreCameraImage`, `GoogleARCoreCameraIntrinsics`, `GoogleARCoreDependencyHandler`, `GoogleARCoreEventManager`, `GoogleARCorePointCloud`, `GoogleARCoreSessionConfig`, `GoogleARCoreSessionFunctionLibrary`, `GoogleARCoreAugmentedFaceMode`, `GoogleARCoreAugmentedFaceRegion`, `GoogleARCoreCameraDepthSensorUsage`, `GoogleARCoreCameraFacing`, `GoogleARCoreCameraFPS`, `GoogleARCoreFunctionStatus`, ... (23 total)

---

## Classes

### `unreal.GoogleARCoreAugmentedImageDatabaseEntry`
Inherits: `StructBase` | Header: `GoogleARCoreAugmentedImageDatabase.h`

A single entry in a UGoogleARCoreAugmentedImageDatabase.

**Properties** (3):
  - `image_asset`: `Texture2D` [Read-Only] — [Read-Only] Texture to use for this image. Valid formats are RGBA8 and
BGRA8. (Texture2D)
  - `name`: `Name` [Read-Only] — [Read-Only] Name of the image. This can be retrieved from an active
UGoogleARCoreAugmentedImage with...
  - `width`: `float` [Read-Only] — [Read-Only] Width of the image in meters. (float)

### `unreal.GoogleARCoreCameraConfig`
Inherits: `StructBase` | Header: `GoogleARCoreTypes.h`

Camera configuration from ARCore.

**Properties** (5):
  - `camera_id`: `str` [Read-Only] — [Read-Only] The id of the camera will be used in this CameraConfig. (str)
  - `camera_image_resolution`: `IntPoint` [Read-Only] — [Read-Only] CPU-accessible camera image resolution. (IntPoint)
  - `camera_texture_resolution`: `IntPoint` [Read-Only] — [Read-Only] Texture resolution for the camera image accessible to the
graphics API and shaders. (Int...
  - `depth_sensor_usage`: `int` [Read-Only] — [Read-Only] The desired depth sensor usage of the camera. (int32)
  - `target_fps`: `int` [Read-Only] — [Read-Only] The target FPS of the camera. (int32)

### `unreal.ARCoreCameraTexture`
Inherits: `ARTexture` | Header: `GoogleARCoreTexture.h`

ARCore Camera Texture

### `unreal.ARCoreDepthTexture`
Inherits: `ARTexture` | Header: `GoogleARCoreTexture.h`

ARCore Depth Texture

### `unreal.GoogleARCoreAugmentedFace`
Inherits: `ARFaceGeometry` | Header: `GoogleARCoreAugmentedFace.h`

An UObject representing a face detected by ARCore.

**Methods** (2):
  - `get_local_to_tracking_transform_of_region(region)` -> `Transform` — Returns the latest known local-to-tracking transform of the given face region.
  - `get_local_to_world_transform_of_region(region)` -> `Transform` — Returns the latest known local-to-world transform of the given face region.

### `unreal.GoogleARCoreAugmentedImage`
Inherits: `ARTrackedImage` | Header: `GoogleARCoreAugmentedImage.h`

An object representing an augmented image currently in the scene.

### `unreal.GoogleARCoreAugmentedImageDatabase`
Inherits: `DataAsset` | Header: `GoogleARCoreAugmentedImageDatabase.h`

A collection of processed images for ARCore to track.

**Properties** (1):
  - `entries`: `None` [Read-Only] — [Read-Only] The individual instances of
FGoogleARCoreAugmentedImageDatabaseEntry objects. (Array[Goo...

### `unreal.GoogleARCoreCameraImage`
Inherits: `Object` | Header: `GoogleARCoreCameraImage.h`

An object that represents an acquired CPU-accessible camera image.

**Methods** (4):
  - `get_height()` -> `int32` — Get the height of the image in pixels.
  - `get_plane_count()` -> `int32` — Get the number of data planes in the image.
  - `get_width()` -> `int32` — Get the width of the image in pixels.
  - `release()` -> `None` — Explicitly release the ARCore resources owned by this object.

### `unreal.GoogleARCoreCameraIntrinsics`
Inherits: `Object` | Header: `GoogleARCoreCameraIntrinsics.h`

An object wrapping the ArCameraIntrinsics data from the ARCore SDK.

**Methods** (3):
  - `get_focal_length(out_fy=float)` — Get the focal length in pixels.
  - `get_image_dimensions(out_height=int32)` — Get the imageâs width and height in pixels.
  - `get_principal_point(out_cy=float)` — Get the principal point in pixels.

### `unreal.GoogleARCoreDependencyHandler`
Inherits: `ARDependencyHandler` | Header: `GoogleARCoreDependencyHandler.h`

Google ARCore Dependency Handler

### `unreal.GoogleARCoreEventManager`
Inherits: `Object` | Header: `GoogleARCoreTypes.h`

Manager for ARCore delegates.

**Properties** (1):
  - `on_config_camera`: `GoogleARCoreOnConfigCameraDynamicDelegate` — [Read-Write] A dynamic delegate can be assigned through blueprint. Will be called before ARSession s...

### `unreal.GoogleARCorePointCloud`
Inherits: `Object` | Header: `GoogleARCoreTypes.h`

A UObject that contains a set of observed 3D points and confidence values.

**Methods** (6):
  - `get_point(out_confidence=float)` — Returns the point position in Unreal world space and itâs confidence value from 0 ~ 1.
  - `get_point_id(index)` -> `int32` — Returns the point Id of the point at the given index. Each point has a unique identifier (within a session) that is pers...
  - `get_point_in_tracking_space(out_confidence=float)` — Returns the point position in Unreal AR Tracking space.
  - `get_point_num()` -> `int32` — Returns the number of point inside this point cloud.
  - `is_updated()` -> `bool` — Checks if this point cloud has been updated in this frame.
  - `release_point_cloud()` -> `None` — Release PointCloudâs resources back to ArCore. Data will not be available after releasePointCloud is called.

### `unreal.GoogleARCoreSessionConfig`
Inherits: `ARSessionConfig` | Header: `GoogleARCoreSessionConfig.h`

A UDataAsset that can be used to configure ARCore specific settings on top of UARSessionConfig.

**Methods** (2):
  - `get_augmented_image_database()` -> `GoogleARCoreAugmentedImageDatabase` — Get the augmented image database being used.
  - `set_augmented_image_database(new_image_database)` -> `None` — Set the augmented image database to use.

### `unreal.GoogleARCoreSessionFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `GoogleARCoreFunctionLibrary.h`

A function library that provides static/Blueprint functions associated with GoogleARCore session.

**Methods** (1):
  - `add_runtime_candidate_image_from_rawbytes(session_config, image_grayscale_pixels, image_width, image_height, friendly_name, physical_width, candidate_texture = None)` -> `ARCandidateImage` [classmethod] — Create an ARCandidateImage object from the raw pixel data and add it to the ARCandidateImageList of the given c UARSessi...

### `unreal.GoogleARCoreAugmentedFaceMode`
Inherits: `EnumBase` | Header: `GoogleARCoreTypes.h`

ingroup: GoogleARCoreBase Describes the possible modes for Augmented Face detection.

**Properties** (2):
  - `DISABLED`: `GoogleARCoreAugmentedFaceMode = Ellipsis` — A mode where AugmentedFace detection is disabled. 0
  - `POSE_AND_MESH`: `GoogleARCoreAugmentedFaceMode = Ellipsis` — A mode where AugmentedFace detection performs face pose, region pose and face mesh estimation. 2

### `unreal.GoogleARCoreAugmentedFaceRegion`
Inherits: `EnumBase` | Header: `GoogleARCoreAugmentedFace.h`

ingroup: GoogleARCoreBase Describes the face regions for which the pose can be queried. Left and right are defined relative to the actor (the person that the mesh belongs to).

**Properties** (3):
  - `FOREHEAD_LEFT`: `GoogleARCoreAugmentedFaceRegion = Ellipsis` — A region around the left forehead of the AugmentedFace. 1
  - `FOREHEAD_RIGHT`: `GoogleARCoreAugmentedFaceRegion = Ellipsis` — A region around the right forehead of the AugmentedFace. 2
  - `NOSE_TIP`: `GoogleARCoreAugmentedFaceRegion = Ellipsis` — A region around the nose of the AugmentedFace. 0

### `unreal.GoogleARCoreCameraDepthSensorUsage`
Inherits: `EnumBase` | Header: `GoogleARCoreTypes.h`

ingroup: GoogleARCoreBase Describes the usage of the depth sensor of the ARCore camera.

**Properties** (3):
  - `DEPTH_SENSOR_ANY`: `GoogleARCoreCameraDepthSensorUsage = Ellipsis` — Do not specify the depth sensor usage. 0
  - `DEPTH_SENSOR_DO_NOT_USE`: `GoogleARCoreCameraDepthSensorUsage = Ellipsis` — Do not use the depth sensor. 2
  - `DEPTH_SENSOR_REQUIRE_AND_USE`: `GoogleARCoreCameraDepthSensorUsage = Ellipsis` — Require and use the depth sensor. 1

### `unreal.GoogleARCoreCameraFacing`
Inherits: `EnumBase` | Header: `GoogleARCoreTypes.h`

ingroup: GoogleARCoreBase Describes the orientation of the selected camera relative to the device display.

**Properties** (2):
  - `BACK`: `GoogleARCoreCameraFacing = Ellipsis` — Camera facing away from user. 1
  - `FRONT`: `GoogleARCoreCameraFacing = Ellipsis` — Camera facing towards user. 2

### `unreal.GoogleARCoreCameraFPS`
Inherits: `EnumBase` | Header: `GoogleARCoreTypes.h`

ingroup: GoogleARCoreBase Describes the target FPS of the ARCore camera.

**Properties** (3):
  - `FPS_30`: `GoogleARCoreCameraFPS = Ellipsis` — Targeting 30 FPS. 1
  - `FPS_60`: `GoogleARCoreCameraFPS = Ellipsis` — Targeting 60 FPS. 2
  - `FPS_ANY`: `GoogleARCoreCameraFPS = Ellipsis` — Targeting any FPS. 0

### `unreal.GoogleARCoreFunctionStatus`
Inherits: `EnumBase` | Header: `GoogleARCoreTypes.h`

ingroup: GoogleARCoreBase Describes the status of most ARCore functions.

**Properties** (9):
  - `FATAL`: `GoogleARCoreFunctionStatus = Ellipsis` — Function failed due to Fatal error. 1
  - `ILLEGAL_STATE`: `GoogleARCoreFunctionStatus = Ellipsis` — Function failed due to it is invoked at an illegal or inappropriate time. 7
  - `INVALID_TYPE`: `GoogleARCoreFunctionStatus = Ellipsis` — Function failed due to the function augment has invalid type. 6
  - `NOT_AVAILABLE`: `GoogleARCoreFunctionStatus = Ellipsis` — Function failed due to ARCore session hasnât started or the requested resource isnât available y...
  - `NOT_TRACKING`: `GoogleARCoreFunctionStatus = Ellipsis` — Function failed due to ARCore session isnât in tracking state. 3
  - `RESOURCE_EXHAUSTED`: `GoogleARCoreFunctionStatus = Ellipsis` — Function failed due to the requested resource is exhausted. 4
  - `SESSION_PAUSED`: `GoogleARCoreFunctionStatus = Ellipsis` — Function failed due to the session isnât running. 2
  - `SUCCESS`: `GoogleARCoreFunctionStatus = Ellipsis` — Function returned successfully. 0
  - `UNKNOWN`: `GoogleARCoreFunctionStatus = Ellipsis` — Function failed with unknown reason. 8

### `unreal.GoogleARCoreLineTraceChannel`
Inherits: `EnumBase` | Header: `GoogleARCoreTypes.h`

ingroup: GoogleARCoreBase Describes which channel ARLineTrace will be performed on.

**Properties** (7):
  - `AUGMENTED_IMAGE`: `GoogleARCoreLineTraceChannel = Ellipsis` — Trace against augmented images. 32
  - `FEATURE_POINT`: `GoogleARCoreLineTraceChannel = Ellipsis` — Trace against feature point cloud. 1
  - `FEATURE_POINT_WITH_SURFACE_NORMAL`: `GoogleARCoreLineTraceChannel = Ellipsis` — Trace against feature point and attempt to estimate the normal of the surface centered around the tr...
  - `INFINITE_PLANE`: `GoogleARCoreLineTraceChannel = Ellipsis` — Trace against the infinite plane. 2
  - `NONE`: `GoogleARCoreLineTraceChannel = Ellipsis` — 0
  - `PLANE_USING_BOUNDARY_POLYGON`: `GoogleARCoreLineTraceChannel = Ellipsis` — Trace against the plane using its boundary polygon. 8
  - `PLANE_USING_EXTENT`: `GoogleARCoreLineTraceChannel = Ellipsis` — Trace against the plane using its extent. 4

### `unreal.GoogleARCoreTrackingFailureReason`
Inherits: `EnumBase` | Header: `GoogleARCoreTypes.h`

ingroup: GoogleARCoreBase Describes the possible tracking failure reasons in ARCore.

**Properties** (5):
  - `BAD_STATE`: `GoogleARCoreTrackingFailureReason = Ellipsis` — Tracking lost due to bad internal state. Please try restarting the AR experience.
This should be see...
  - `EXCESSIVE_MOTION`: `GoogleARCoreTrackingFailureReason = Ellipsis` — Tracking lost due to excessive motion. Please  move device more slowly. 3
  - `INSUFFICIENT_FEATURES`: `GoogleARCoreTrackingFailureReason = Ellipsis` — Tracking lost due to insufficient trackable features. Please move to area with more features,
such a...
  - `INSUFFICIENT_LIGHT`: `GoogleARCoreTrackingFailureReason = Ellipsis` — Tracking lost due to poor lighting conditions. Please move to a more brightly lit area 2
  - `NONE`: `GoogleARCoreTrackingFailureReason = Ellipsis` — Tracking is working normally, or ARCore session is not currently running. 0

### `unreal.GoogleARCoreEventManager_GoogleARCoreOnConfigCameraDynamicDelegate`
Inherits: `MulticastDelegateBase` | Header: `GoogleARCoreTypes.h`

cond: EXCLUDE_FROM_DOXYGEN
