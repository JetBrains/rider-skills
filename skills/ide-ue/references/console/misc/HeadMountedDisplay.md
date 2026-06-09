# UE Python API — HeadMountedDisplay Module

**18 types** from the `HeadMountedDisplay` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `XRDeviceId`, `XRHandTrackingState`, `XRHMDData`, `XRMotionControllerData`, `XRMotionControllerState`, `MotionControllerComponent`, `HandKeypoint`, `HMDTrackingOrigin`, `HMDWornState`, `OrientPositionSelector`, `SpectatorScreenMode`, `TrackingStatus`, `XRControllerPoseType`, `XRDeviceConnectionResult`, `XRSpaceType`, `XRSystemFlags`, `XRTrackedDeviceType`, `XRVisualType`

---

## Classes

### `unreal.XRDeviceId`
Inherits: `StructBase` | Header: `IIdentifiableXRDevice.h`

XRDevice Id

**Properties** (2):
  - `device_id`: `int` [Read-Only] — [Read-Only] (int32)
  - `system_name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.XRHandTrackingState`
Inherits: `StructBase` | Header: `HeadMountedDisplayTypes.h`

XRHand Tracking State

**Properties** (9):
  - `application_instance_id`: `Guid` [Read-Only] — [Read-Only] (Guid)
  - `device_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `hand`: `ControllerHand` [Read-Only] — [Read-Only] (ControllerHand)
  - `hand_key_locations`: `None` [Read-Only] — [Read-Only] The indices of this array are the values of EHandKeypoint (Palm, Wrist, ThumbMetacarpal,...
  - `hand_key_radii`: `None` [Read-Only] — [Read-Only] The indices of this array are the values of EHandKeypoint (Palm, Wrist, ThumbMetacarpal,...
  - `hand_key_rotations`: `None` [Read-Only] — [Read-Only] The indices of this array are the values of EHandKeypoint (Palm, Wrist, ThumbMetacarpal,...
  - `tracking_status`: `TrackingStatus` [Read-Only] — [Read-Only] (TrackingStatus)
  - `valid`: `bool` [Read-Only] — [Read-Only] The state is valid if poses have ever been provided. (bool)
  - `xr_space_type`: `XRSpaceType` [Read-Only] — [Read-Only] (XRSpaceType)

### `unreal.XRHMDData`
Inherits: `StructBase` | Header: `HeadMountedDisplayTypes.h`

**Properties** (6):
  - `application_instance_id`: `Guid` [Read-Only] — [Read-Only] (Guid)
  - `device_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `rotation`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `tracking_status`: `TrackingStatus` [Read-Only] — [Read-Only] (TrackingStatus)
  - `valid`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.XRMotionControllerData`
Inherits: `StructBase` | Header: `HeadMountedDisplayTypes.h`

XRMotion Controller Data

**Properties** (16):
  - `aim_position`: `Vector` [Read-Only] — [Read-Only] For handheld controllers, gives a vector for pointing at objects (Vector)
  - `aim_rotation`: `Quat` [Read-Only] — [Read-Only] For handheld controllers, gives a quaternion for pointing at objects (Quat)
  - `application_instance_id`: `Guid` [Read-Only] — [Read-Only] (Guid)
  - `device_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `device_visual_type`: `XRVisualType` [Read-Only] — [Read-Only] (XRVisualType)
  - `grip_position`: `Vector` [Read-Only] — [Read-Only] Vector representing an object being held in the playerâs hand (Vector)
  - `grip_rotation`: `Quat` [Read-Only] — [Read-Only] Quaternion representing an object being held in the playerâs hand (Quat)
  - `hand_index`: `ControllerHand` [Read-Only] — [Read-Only] (ControllerHand)
  - `hand_key_positions`: `None` [Read-Only] — [Read-Only] The indices of this array are the values of EHandKeypoint (Palm, Wrist, ThumbMetacarpal,...
  - `hand_key_radii`: `None` [Read-Only] — [Read-Only] The indices of this array are the values of EHandKeypoint (Palm, Wrist, ThumbMetacarpal,...
  - `hand_key_rotations`: `None` [Read-Only] — [Read-Only] The indices of this array are the values of EHandKeypoint (Palm, Wrist, ThumbMetacarpal,...
  - `is_grasped`: `bool` [Read-Only] — [Read-Only] (bool)
  - `palm_position`: `Vector` [Read-Only] — [Read-Only] For handheld controllers, gives a vector for representing the hand (Vector)
  - `palm_rotation`: `Quat` [Read-Only] — [Read-Only] For handheld controllers, gives a quaternion for representing the hand (Quat)
  - `tracking_status`: `TrackingStatus` [Read-Only] — [Read-Only] (TrackingStatus)
  - `valid`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.XRMotionControllerState`
Inherits: `StructBase` | Header: `HeadMountedDisplayTypes.h`

XRMotion Controller State

**Properties** (9):
  - `application_instance_id`: `Guid` [Read-Only] — [Read-Only] (Guid)
  - `controller_location`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `controller_rotation`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `device_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `hand`: `ControllerHand` [Read-Only] — [Read-Only] (ControllerHand)
  - `tracking_status`: `TrackingStatus` [Read-Only] — [Read-Only] If a controller pose has been provided this frame the TrackingStatus will be Tracked. (T...
  - `valid`: `bool` [Read-Only] — [Read-Only] The state is valid if a pose has ever been provided. (bool)
  - `xr_controller_pose_type`: `XRControllerPoseType` [Read-Only] — [Read-Only] (XRControllerPoseType)
  - `xr_space_type`: `XRSpaceType` [Read-Only] — [Read-Only] (XRSpaceType)

### `unreal.MotionControllerComponent`
Inherits: `PrimitiveComponent` | Header: `MotionControllerComponent.h`

Motion Controller Component

**Methods** (7):
  - `get_angular_velocity()` -> `Rotator or None` — If the motion tracking system provides angular velocity at this time OutAngularVelocity will be that velocity in deg/s i...
  - `get_hand_joint_position(value_found=bool)` — Get Hand Joint Position
  - `get_linear_acceleration()` -> `Vector or None` — If the motion tracking system provides linear acceleration at this time the vector will be that acceleration in cm/(s^2)...
  - `get_linear_velocity()` -> `Vector or None` — If the motion tracking system provides linear velocity at this time the vector will be that velocity in cm/s in unreal w...
  - `get_parameter_value(value_found=bool)` — Returns the value of a custom parameter on the current in use Motion Controller (see member InUseMotionController). Only...
  - `is_tracked()` -> `bool` — Whether or not this component had a valid tracked device this frame
  - `on_motion_controller_updated()` -> `None` — Blueprint Implementable function for responding to updated data from a motion controller (so we can use custom parameter...

**Properties** (4):
  - `current_tracking_status`: `TrackingStatus` [Read-Only] — [Read-Only] The tracking status for the device (e.g. full tracking, inertial tracking only, no track...
  - `disable_low_latency_update`: `bool` — [Read-Write] If false, render transforms within the motion controller hierarchy will be updated a se...
  - `motion_source`: `Name` — [Read-Write] Defines which pose this component should receive from the OpenXR Runtime. Left/Right Mo...
  - `player_index`: `int` — [Read-Write] Which player index this motion controller should automatically follow (int32)

### `unreal.HandKeypoint`
Inherits: `EnumBase` | Header: `HeadMountedDisplayTypes.h`

Transforms that are tracked on the hand. Matches the enums from WMR to make it a direct mapping

**Properties** (26):
  - `INDEX_DISTAL`: `HandKeypoint = Ellipsis` — 9
  - `INDEX_INTERMEDIATE`: `HandKeypoint = Ellipsis` — 8
  - `INDEX_METACARPAL`: `HandKeypoint = Ellipsis` — 6
  - `INDEX_PROXIMAL`: `HandKeypoint = Ellipsis` — 7
  - `INDEX_TIP`: `HandKeypoint = Ellipsis` — 10
  - `LITTLE_DISTAL`: `HandKeypoint = Ellipsis` — 24
  - `LITTLE_INTERMEDIATE`: `HandKeypoint = Ellipsis` — 23
  - `LITTLE_METACARPAL`: `HandKeypoint = Ellipsis` — 21
  - `LITTLE_PROXIMAL`: `HandKeypoint = Ellipsis` — 22
  - `LITTLE_TIP`: `HandKeypoint = Ellipsis` — 25
  - `MIDDLE_DISTAL`: `HandKeypoint = Ellipsis` — 14
  - `MIDDLE_INTERMEDIATE`: `HandKeypoint = Ellipsis` — 13
  - `MIDDLE_METACARPAL`: `HandKeypoint = Ellipsis` — 11
  - `MIDDLE_PROXIMAL`: `HandKeypoint = Ellipsis` — 12
  - `MIDDLE_TIP`: `HandKeypoint = Ellipsis` — 15
  - `PALM`: `HandKeypoint = Ellipsis` — 0
  - `RING_DISTAL`: `HandKeypoint = Ellipsis` — 19
  - `RING_INTERMEDIATE`: `HandKeypoint = Ellipsis` — 18
  - `RING_METACARPAL`: `HandKeypoint = Ellipsis` — 16
  - `RING_PROXIMAL`: `HandKeypoint = Ellipsis` — 17
  - `RING_TIP`: `HandKeypoint = Ellipsis` — 20
  - `THUMB_DISTAL`: `HandKeypoint = Ellipsis` — 4
  - `THUMB_METACARPAL`: `HandKeypoint = Ellipsis` — 2
  - `THUMB_PROXIMAL`: `HandKeypoint = Ellipsis` — 3
  - `THUMB_TIP`: `HandKeypoint = Ellipsis` — 5
  - `WRIST`: `HandKeypoint = Ellipsis` — 1

### `unreal.HMDTrackingOrigin`
Inherits: `EnumBase` | Header: `HeadMountedDisplayTypes.h`

Specifies the type of tracking space origin we should use. Be aware that not all devices support all Tracking Origin types. https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#reference-spa...

**Properties** (5):
  - `CUSTOM_OPEN_XR`: `HMDTrackingOrigin = Ellipsis` — Custom OpenXR tracking space of some kind. You cannot set this space explictly, it is automatically ...
  - `LOCAL`: `HMDTrackingOrigin = Ellipsis` — For seated experiences. Always Supported. Typically centered around the HMDs initial position either...
  - `LOCAL_FLOOR`: `HMDTrackingOrigin = Ellipsis` — For standing stationary experiences. Typically centered around HMDs initial position either at app s...
  - `STAGE`: `HMDTrackingOrigin = Ellipsis` — For walking-around experiences.  The origin will be at floor level and typically within a defined pl...
  - `VIEW`: `HMDTrackingOrigin = Ellipsis` — Previously sometimes used Eye space to query for the view transform, this space is fixed to the HMD,...

### `unreal.HMDWornState`
Inherits: `EnumBase` | Header: `HeadMountedDisplayTypes.h`

Stores if the user is wearing the HMD or not. For HMDs without a sensor to detect the user wearing it, the state defaults to Unknown.

**Properties** (3):
  - `NOT_WORN`: `HMDWornState = Ellipsis` — 2
  - `UNKNOWN`: `HMDWornState = Ellipsis` — 0
  - `WORN`: `HMDWornState = Ellipsis` — 1

### `unreal.OrientPositionSelector`
Inherits: `EnumBase` | Header: `HeadMountedDisplayTypes.h`

EOrient Position Selector

**Properties** (3):
  - `ORIENTATION`: `OrientPositionSelector = Ellipsis` — 0
  - `ORIENTATION_AND_POSITION`: `OrientPositionSelector = Ellipsis` — 2
  - `POSITION`: `OrientPositionSelector = Ellipsis` — 1

### `unreal.SpectatorScreenMode`
Inherits: `EnumBase` | Header: `HeadMountedDisplayTypes.h`

The Spectator Screen Mode controls what the non-vr video device displays on platforms that support one. Not all modes are universal. Modes SingleEyeCroppedToFill, Texture, and MirrorPlusTexture are su...

**Properties** (8):
  - `DISABLED`: `SpectatorScreenMode = Ellipsis` — 0
  - `DISTORTED`: `SpectatorScreenMode = Ellipsis` — 3
  - `SINGLE_EYE`: `SpectatorScreenMode = Ellipsis` — 4
  - `SINGLE_EYE_CROPPED_TO_FILL`: `SpectatorScreenMode = Ellipsis` — 5
  - `SINGLE_EYE_LETTERBOXED`: `SpectatorScreenMode = Ellipsis` — 1
  - `TEXTURE`: `SpectatorScreenMode = Ellipsis` — 6
  - `TEXTURE_PLUS_EYE`: `SpectatorScreenMode = Ellipsis` — 7
  - `UNDISTORTED`: `SpectatorScreenMode = Ellipsis` — 2

### `unreal.TrackingStatus`
Inherits: `EnumBase` | Header: `IMotionController.h`

ETracking Status

**Properties** (3):
  - `INERTIAL_ONLY`: `TrackingStatus = Ellipsis` — 1
  - `NOT_TRACKED`: `TrackingStatus = Ellipsis` — 0
  - `TRACKED`: `TrackingStatus = Ellipsis` — Note This value of the enum is deprecated and only used by legacy platforms.  Please do not introduc...

### `unreal.XRControllerPoseType`
Inherits: `EnumBase` | Header: `HeadMountedDisplayTypes.h`

Controllers, due to their various shapes, might have different natural usages.

**Properties** (3):
  - `AIM`: `XRControllerPoseType = Ellipsis` — A pose meant to represent pointing. 0
  - `GRIP`: `XRControllerPoseType = Ellipsis` — A poose meant to represent holding a stick. 1
  - `PALM`: `XRControllerPoseType = Ellipsis` — A pose meant to represent holding an item in the palm of the hand. 2

### `unreal.XRDeviceConnectionResult`
Inherits: `EnumBase` | Header: `HeadMountedDisplayTypes.h`

Enumeration of results from Connecting to Remote XR device

**Properties** (5):
  - `FEATURE_NOT_SUPPORTED`: `XRDeviceConnectionResult = Ellipsis` — 1
  - `MISC_FAILURE`: `XRDeviceConnectionResult = Ellipsis` — 3
  - `NO_TRACKING_SYSTEM`: `XRDeviceConnectionResult = Ellipsis` — 0
  - `NO_VALID_VIEWPORT`: `XRDeviceConnectionResult = Ellipsis` — 2
  - `SUCCESS`: `XRDeviceConnectionResult = Ellipsis` — 4

### `unreal.XRSpaceType`
Inherits: `EnumBase` | Header: `HeadMountedDisplayTypes.h`

Used to get unreal world space or tracking space positions in XR. Working only with unreal world space coordinates is almost always simpler and should be generally preferred. There are specific cases ...

**Properties** (2):
  - `UNREAL_WORLD_SPACE`: `XRSpaceType = Ellipsis` — The unreal coordinate system.  Affected by world scaling and the TrackingToWorldTransform. 0
  - `XR_TRACKING_SPACE`: `XRSpaceType = Ellipsis` — The coordinate system the XR Device is tracking itself in.  Should be fixed relative to the real wor...

### `unreal.XRSystemFlags`
Inherits: `EnumBase` | Header: `HeadMountedDisplayTypes.h`

Flags to better inform the user about specifics of the underlying XR system

**Properties** (4):
  - `IS_AR`: `XRSystemFlags = Ellipsis` — 1
  - `IS_HEAD_MOUNTED`: `XRSystemFlags = Ellipsis` — 4
  - `IS_TABLET`: `XRSystemFlags = Ellipsis` — 2
  - `SUPPORTS_HAND_TRACKING`: `XRSystemFlags = Ellipsis` — 8

### `unreal.XRTrackedDeviceType`
Inherits: `EnumBase` | Header: `HeadMountedDisplayTypes.h`

EXRTracked Device Type

**Properties** (6):
  - `ANY`: `XRTrackedDeviceType = Ellipsis` — Pass to EnumerateTrackedDevices to get all devices regardless of type 255
  - `CONTROLLER`: `XRTrackedDeviceType = Ellipsis` — Represents a controller 1
  - `HEAD_MOUNTED_DISPLAY`: `XRTrackedDeviceType = Ellipsis` — Represents a head mounted display 0
  - `OTHER`: `XRTrackedDeviceType = Ellipsis` — Misc. device types, for future expansion 4
  - `TRACKER`: `XRTrackedDeviceType = Ellipsis` — Represents trackers, such as a Vive tracker 3
  - `TRACKING_REFERENCE`: `XRTrackedDeviceType = Ellipsis` — Represents a static tracking reference device, such as a Lighthouse or tracking camera 2

### `unreal.XRVisualType`
Inherits: `EnumBase` | Header: `HeadMountedDisplayTypes.h`

EXRVisual Type

**Properties** (2):
  - `CONTROLLER`: `XRVisualType = Ellipsis` — 0
  - `HAND`: `XRVisualType = Ellipsis` — 1
