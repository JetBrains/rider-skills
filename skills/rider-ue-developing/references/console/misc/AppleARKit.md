# UE Python API — AppleARKit Module

**14 types** from the `AppleARKit` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AppleARKitCameraVideoTexture`, `AppleARKitEnvironmentCaptureProbe`, `AppleARKitEnvironmentCaptureProbeTexture`, `AppleARKitOcclusionTexture`, `AppleARKitSettings`, `AppleARKitTextureCameraDepth`, `AppleARKitTextureCameraImage`, `AppleARKitTimecodeProvider`, `ARKitGeoTrackingSupport`, `ARKitMeshGeometry`, `MaterialExpressionARKitPassthroughCamera`, `ARFaceTrackingFileWriterType`, `ARKitTextureType`, `LivelinkTrackingType`

---

## Classes

### `unreal.AppleARKitCameraVideoTexture`
Inherits: `ARTextureCameraImage` | Header: `AppleARKitTextures.h`

Apple ARKit Camera Video Texture

### `unreal.AppleARKitEnvironmentCaptureProbe`
Inherits: `AREnvironmentCaptureProbe` | Header: `AppleARKitTrackable.h`

Apple ARKit Environment Capture Probe

### `unreal.AppleARKitEnvironmentCaptureProbeTexture`
Inherits: `AREnvironmentCaptureProbeTexture` | Header: `AppleARKitTextures.h`

Apple ARKit Environment Capture Probe Texture

### `unreal.AppleARKitOcclusionTexture`
Inherits: `ARTexture` | Header: `AppleARKitTextures.h`

Apple ARKit Occlusion Texture

### `unreal.AppleARKitSettings`
Inherits: `Object` | Header: `AppleARKitSettings.h`

Apple ARKit Settings

**Properties** (18):
  - `adjust_thread_priorities_during_ar_session`: `bool` [Read-Only] — [Read-Only] Whether to adjust thread priorities during an AR session or not (bool)
  - `ar_kit_timecode_provider`: `str` [Read-Only] — [Read-Only] Used to specify the timecode provider to use when identifying when an update occurred.
U...
  - `default_face_tracking_direction`: `ARFaceTrackingDirection` [Read-Only] — [Read-Only] The default tracking to use when tracking face blend shapes (face relative or mirrored)....
  - `default_face_tracking_live_link_subject_name`: `Name` [Read-Only] — [Read-Only] The default name to use when publishing face tracking name
If multiple faces are tracked...
  - `default_pose_tracking_live_link_subject_name`: `Name` [Read-Only] — [Read-Only] The default name to use when publishing pose tracking name (Name)
  - `face_tracking_file_writer_type`: `ARFaceTrackingFileWriterType` [Read-Only] — [Read-Only] The type of face AR publisher that writes to disk to create (ARFaceTrackingFileWriterTyp...
  - `face_tracking_log_data`: `bool` [Read-Only] — [Read-Only] Whether file writing is enabled at all or not (bool)
  - `face_tracking_log_dir`: `str` [Read-Only] — [Read-Only] (str)
  - `face_tracking_write_each_frame`: `bool` [Read-Only] — [Read-Only] Whether to publish each frame or when the âFaceAR WriteCurveFile (bool)
  - `game_thread_priority_override`: `int` [Read-Only] — [Read-Only] The game thread priority to change to when an AR session is running, default is 47 (int3...
  - `live_link_publishing_port`: `int` [Read-Only] — [Read-Only] The port to use when listening/sending LiveLink face blend shapes via the network (int32...
  - `livelink_tracking_types`: `None` [Read-Only] — [Read-Only] Livelink tracking type. To publish face blend shapes, or body pose data to LiveLink, or ...
  - `render_thread_priority_override`: `int` [Read-Only] — [Read-Only] The render thread priority to change to when an AR session is running, default is 45 (in...
  - `require_ar_kit_support`: `bool` [Read-Only] — [Read-Only] When True the project can only be installed on devices that support ARKit. (bool)
  - `should_write_camera_image_per_frame`: `bool` [Read-Only] — [Read-Only] Whether to publish the camera image each frame (bool)
  - `written_camera_image_quality`: `int` [Read-Only] — [Read-Only] The quality setting to generate the jpeg images at. Defaults to 85, which is âhigh qua...
  - `written_camera_image_rotation`: `TextureRotationDirection` [Read-Only] — [Read-Only] Defaults to none. Use Right when in portrait mode (TextureRotationDirection)
  - `written_camera_image_scale`: `float` [Read-Only] — [Read-Only] The scale to write the images at. Used to reduce data footprint (float)

### `unreal.AppleARKitTextureCameraDepth`
Inherits: `ARTextureCameraDepth` | Header: `AppleARKitTextures.h`

Apple ARKit Texture Camera Depth

### `unreal.AppleARKitTextureCameraImage`
Inherits: `ARTextureCameraImage` | Header: `AppleARKitTextures.h`

Apple ARKit Texture Camera Image

### `unreal.AppleARKitTimecodeProvider`
Inherits: `TimecodeProvider` | Header: `AppleARKitTimecodeProvider.h`

This class is an implementation of the ITimecodeProvider and is used to abstract out the calculation of the frame & time for an update

### `unreal.ARKitGeoTrackingSupport`
Inherits: `ARGeoTrackingSupport` | Header: `ARKitGeoTrackingSupport.h`

ARKit Geo Tracking Support

### `unreal.ARKitMeshGeometry`
Inherits: `ARMeshGeometry` | Header: `ARKitTrackables.h`

ARKit Mesh Geometry

### `unreal.MaterialExpressionARKitPassthroughCamera`
Inherits: `MaterialExpression` | Header: `ExternalTextureMaterialExpression.h`

Implements a node sampling from the ARKit Passthrough external textures.

### `unreal.ARFaceTrackingFileWriterType`
Inherits: `EnumBase` | Header: `AppleARKitSettings.h`

EARFace Tracking File Writer Type

**Properties** (3):
  - `CSV`: `ARFaceTrackingFileWriterType = Ellipsis` — Comma delimited file, one row per captured frame 1
  - `JSON`: `ARFaceTrackingFileWriterType = Ellipsis` — JSON object array, one frame object per captured frame 2
  - `NONE`: `ARFaceTrackingFileWriterType = Ellipsis` — Disables creation of a file writer 0

### `unreal.ARKitTextureType`
Inherits: `EnumBase` | Header: `ExternalTextureMaterialExpression.h`

EARKit Texture Type

**Properties** (2):
  - `TEXTURE_CB_CR`: `ARKitTextureType = Ellipsis` — 1
  - `TEXTURE_Y`: `ARKitTextureType = Ellipsis` — 0

### `unreal.LivelinkTrackingType`
Inherits: `EnumBase` | Header: `AppleARKitSettings.h`

ELivelink Tracking Type

**Properties** (2):
  - `FACE_TRACKING`: `LivelinkTrackingType = Ellipsis` — 0
  - `POSE_TRACKING`: `LivelinkTrackingType = Ellipsis` — 1
