# UE Python API — XRBase Module

**11 types** from the `XRBase` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AsyncTask_LoadXRDeviceVisComponent`, `HeadMountedDisplayFunctionLibrary`, `MotionTrackedDeviceFunctionLibrary`, `VRNotificationsComponent`, `XRAssetFunctionLibrary`, `XRDeviceVisualizationComponent`, `XRLoadingScreenFunctionLibrary`, `DeviceModelLoadedDelegate`, `VRNotificationsComponent_VRNotificationsDelegate`, `XRDeviceOnDisconnectDelegate`, `XRTimedInputActionDelegate`

---

## Classes

### `unreal.AsyncTask_LoadXRDeviceVisComponent`
Inherits: `BlueprintAsyncActionBase` | Header: `XRAssetFunctionLibrary.h`

Async Task Load XRDevice Vis Component

**Properties** (2):
  - `on_load_failure`: `DeviceModelLoadedDelegate` — [Read-Write] (DeviceModelLoadedDelegate)
  - `on_model_loaded`: `DeviceModelLoadedDelegate` — [Read-Write] (DeviceModelLoadedDelegate)

### `unreal.HeadMountedDisplayFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `HeadMountedDisplayFunctionLibrary.h`

Head Mounted Display Function Library

**Methods** (46):
  - `calibrate_external_tracking_to_hmd(external_tracking_transform)` -> `None` [classmethod] — Called to calibrate the offset transform between an external tracking source and the internal tracking source (e.g. moca...
  - `clear_xr_timed_input_action_delegate(action_path)` -> `None` [classmethod] — / Clear a delegate to get an OpenXR action event with action time.
  - `connect_remote_xr_device(ip_address, bit_rate)` -> `XRDeviceConnectionResult` [classmethod] — Connect to a remote device
  - `disconnect_remote_xr_device()` -> `None` [classmethod] — Disconnect remote AR Device
  - `enable_hmd(enable)` -> `bool` [classmethod] — Switches to/from using HMD and stereo rendering.
  - `enumerate_tracked_devices(system_id = 'None', device_type = XRTrackedDeviceType.ANY)` -> `Array [ XRDeviceId ]` [classmethod] — Cross XR-System query that will list all XR devices currently being tracked.
  - `get_controller_transform_for_time2(world_context, controller_index, motion_source, time)` -> `(time_was_used=bool, orientation=Rotator, position=Vector, provided_linear_velocity=bool, linear_velocity=Vector, provided_angular_velocity=bool, angular_velocity=Rotator, provided_linear_acceleration=bool, linear_acceleration=Vector) or None` [classmethod] — Get the transform and potentially velocity data at a specified time near the current frame in unreal world space. This i...
  - `get_current_interaction_profile(hand)` -> `str or None` [classmethod] — Get the openXR interaction profile name for the given controller. Returns true if the openxr call is successfully made. ...
  - `get_device_pose(orientation=Rotator, has_positional_tracking=bool, position=Vector)` [classmethod] — Cross XR-System query that returns a specific deviceâs tracked position and orientation (in tracking space).
  - `get_device_world_pose(world_context=None, orientation=Rotator, has_positional_tracking=bool, position=Vector)` [classmethod] — Cross XR-System query that returns a specific deviceâs position and orientation in world space.
  - `get_hand_tracking_state(world_context, xr_space_type, hand)` -> `XRHandTrackingState` [classmethod] — Cross XR-System query that returns critical information about the motion controller (position, orientation, hand/finger ...
  - `get_hmd_data(world_context)` -> `XRHMDData` [classmethod] — Cross XR-System query that returns critical information about the HMD display (position, orientation, device name)
  - `get_hmd_device_name()` -> `Name` [classmethod] — Returns the name of the device, so scripts can modify their behaviour appropriately
  - `get_hmd_worn_state()` -> `HMDWornState` [classmethod] — Returns the worn state of the device.
  - `get_motion_controller_data(world_context, hand)` -> `XRMotionControllerData` [classmethod] — Cross XR-System query that returns critical information about the motion controller (position, orientation, hand/finger ...
  - `get_motion_controller_state(world_context, xr_space_type, hand, controller_pose_type)` -> `XRMotionControllerState` [classmethod] — Cross XR-System query that returns critical information about the motion controller (position, orientation)
  - `get_num_of_tracking_sensors()` -> `int32` [classmethod] — If the HMD has multiple positional tracking sensors, return a total number of them currently connected.
  - `get_orientation_and_position(device_position=Vector)` [classmethod] — Grabs the current orientation and position for the HMD. If positional tracking is not available, DevicePosition will be ...
  - `get_pixel_density()` -> `float` [classmethod] — Returns the current XR pixel density. This sets the final render target size as a factor of the recommended texture size...
  - `get_play_area_bounds(origin = HMDTrackingOrigin.STAGE)` -> `Vector2D` [classmethod] — Get the bounds of the area where the user can freely move while remaining tracked centered around the specified origin
  - `get_play_area_rect()` -> `(out_transform=Transform, out_rect=Vector2D) or None` [classmethod] — Get the transform and dimensions of the playable area rectangle. Returns false if none currently specified/available.
  - `get_tracking_origin()` -> `HMDTrackingOrigin` [classmethod] — Returns current tracking origin type (eye level or floor level).
  - `get_tracking_origin_transform(origin)` -> `Transform or None` [classmethod] — Get the transform of the specified tracking origin, if available.
  - `get_tracking_sensor_parameters(rotation=Rotator, left_fov=float, right_fov=float, top_fov=float, bottom_fov=float, distance=float, near_plane=float, far_plane=float, is_active=bool)` [classmethod] — If the HMD has a positional sensor, this will return the game-world location of it, as well as the parameters for the bo...
  - `get_tracking_to_world_transform(world_context = None)` -> `Transform` [classmethod] — Returns a transform that can be used to convert points from tracking space to world space. Does NOT include the set Worl...
  - `get_version_string()` -> `str` [classmethod] — Returns name of tracking system specific version string.
  - `get_vr_focus_state(has_focus=bool)` [classmethod] — Returns current state of VR focus.
  - `get_world_to_meters_scale(world_context = None)` -> `float` [classmethod] — Returns the World to Meters scale, which corresponds to the scale of the world as perceived by the player
  - `get_xr_secondary_screen_percentage()` -> `float` [classmethod] — Returns the current XR secondary screen precentage. This sets the final render target size as a percentage of the recomm...
  - `get_xr_system_flags()` -> `int32` [classmethod] — Returns the flags for the device, so scripts can modify their behaviour appropriately
  - `has_valid_tracking_position()` -> `bool` [classmethod] — If the HMD supports positional tracking, whether or not we are currently being tracked
  - `is_device_tracking(xr_device_id)` -> `bool` [classmethod] — Cross XR-System query that returns whether the specified device is tracked or not.
  - `is_head_mounted_display_connected()` -> `bool` [classmethod] — Returns whether or not the HMD hardware is connected and ready to use. It may or may not actually be in use.
  - `is_head_mounted_display_enabled()` -> `bool` [classmethod] — Returns whether or not we are currently using the head mounted display.
  - `is_spectator_screen_mode_controllable()` -> `bool` [classmethod] — Return true if spectator screen mode control is available.
  - `reset_orientation_and_position(yaw = 0.000000, options = OrientPositionSelector.ORIENTATION_AND_POSITION)` -> `None` [classmethod] — Resets orientation by setting roll and pitch to 0, assuming that current yaw is forward direction and assuming current p...
  - `set_clipping_planes(near, far)` -> `None` [classmethod] — Sets near and far clipping planes (NCP and FCP) for stereo rendering. Similar to âstereo ncp= fcpâ console command, ...
  - `set_hmd_color_scale_and_bias(color_scale, color_bias)` -> `bool` [classmethod] — Multiply the post-compositor frame by a color and add a bias. LayerColor = LayerColor * ColorScale + ColorBias
  - `set_spectator_screen_mode(mode)` -> `None` [classmethod] — Sets the social screen mode.
  - `set_spectator_screen_mode_texture_plus_eye_layout(eye_rect_min, eye_rect_max, texture_rect_min, texture_rect_max, draw_eye_first = True, clear_black = False, use_alpha = False)` -> `None` [classmethod] — Setup the layout for ESpectatorScreenMode::TexturePlusEye.
  - `set_spectator_screen_texture(texture)` -> `None` [classmethod] — Change the texture displayed on the social screen
  - `set_tracking_origin(origin)` -> `None` [classmethod] — Sets current tracking origin type (eye level or floor level).
  - `set_world_to_meters_scale(world_context = None, new_scale = 100.000000)` -> `None` [classmethod] — Sets the World to Meters scale, which changes the scale of the world as perceived by the player
  - `set_xr_disconnect_delegate(disconnected_delegate)` -> `None` [classmethod] — Set XRDisconnect Delegate
  - `set_xr_timed_input_action_delegate(action_name, delegate)` -> `None` [classmethod] — Hook up a delegate to get an OpenXR action event with action time. For a boolean input the the âvalueâ parameter of ...
  - `update_external_tracking_hmd_position(external_tracking_transform)` -> `None` [classmethod] — Called after calibration to attempt to pull the internal tracker (e.g. HMD tracking) in line with the external tracker (...

### `unreal.MotionTrackedDeviceFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MotionTrackedDeviceFunctionLibrary.h`

Motion Tracked Device Function Library

**Methods** (18):
  - `disable_motion_tracking_for_component(motion_controller_component)` -> `None` [classmethod] — Disable tracking of the specified controller, by player index and tracked device type.
  - `disable_motion_tracking_of_all_controllers()` -> `None` [classmethod] — Disable tracking for all controllers.
  - `disable_motion_tracking_of_controllers_for_player(player_index)` -> `None` [classmethod] — Disable tracking for all controllers associated with the specified player.
  - `disable_motion_tracking_of_device(player_index, hand)` -> `None` [classmethod] — Disable tracking of the specified controller, by player index and tracked device type. deprecated: EControllerHand has b...
  - `disable_motion_tracking_of_source(player_index, source_name)` -> `None` [classmethod] — Disable tracking of the specified controller, by player index and tracked device type.
  - `enable_motion_tracking_for_component(motion_controller_component)` -> `bool` [classmethod] — Enable tracking of the specified controller, by player index and tracked device type.
  - `enable_motion_tracking_of_device(player_index, hand)` -> `bool` [classmethod] — Enable tracking of the specified controller, by player index and tracked device type. deprecated: EControllerHand has be...
  - `enable_motion_tracking_of_source(player_index, source_name)` -> `bool` [classmethod] — Enable tracking of the specified controller, by player index and tracked device type.
  - `enumerate_motion_sources()` -> `Array [ Name ]` [classmethod] — Returns a list of all available motion sources (FNames associated with discrete tracking data that can be used to drive ...
  - `get_active_tracking_system_name()` -> `Name` [classmethod] — Returns the system name used to distinguish the current tracking system. If no XR tracking system is active, then the na...
  - `get_maximum_motion_tracked_controller_count()` -> `int32` [classmethod] — Get the maximum number of controllers that can be tracked.
  - `get_motion_tracking_enabled_controller_count()` -> `int32` [classmethod] — Get the number of controllers for which tracking is enabled.
  - `is_motion_source_tracking(player_index, source_name)` -> `bool` [classmethod] — Queries the specified sourceâs tracking status and returns true if it has tracking.
  - `is_motion_tracked_device_count_management_necessary()` -> `bool` [classmethod] — Returns true if it is necessary for the game to manage how many motion tracked devices it is asking to be tracked simult...
  - `is_motion_tracking_enabled_for_component(motion_controller_component)` -> `bool` [classmethod] — Returns true if tracking is enabled for the specified device.
  - `is_motion_tracking_enabled_for_device(player_index, hand)` -> `bool` [classmethod] — Returns true if tracking is enabled for the specified device. deprecated: EControllerHand has been deprecated, please us...
  - `is_motion_tracking_enabled_for_source(player_index, source_name)` -> `bool` [classmethod] — Returns true if tracking is enabled for the specified device.
  - `set_is_controller_motion_tracking_enabled_by_default(enable)` -> `None` [classmethod] — Set whether motion tracked controllers activate on creation by default, or do not and must be explicitly activated.

### `unreal.VRNotificationsComponent`
Inherits: `ActorComponent` | Header: `VRNotificationsComponent.h`

VRNotifications Component

**Properties** (12):
  - `hmd_connect_canceled_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called when the user declines to connect the HMD when prompted to do so by...
  - `hmd_lost_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called when connection to HMD is lost. (VRNotificationsDelegate)
  - `hmd_put_on_head_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called when the HMD detects that it has been put on by a player. (VRNotifi...
  - `hmd_recentered_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called when the XR runtime requests a recenter (such as when a system rece...
  - `hmd_reconnected_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called when connection to HMD is restored. (VRNotificationsDelegate)
  - `hmd_removed_from_head_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called when the HMD detects that it has been taken off by a player (discon...
  - `hmd_tracking_initialized_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called on Morpheus when the HMD is done initializing and therefore
reproje...
  - `hmd_tracking_initializing_and_needs_hmd_to_be_tracked_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called on Morpheus if the HMD starts up and is not fully initialized (in N...
  - `vr_controller_recentered_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called when the VR system recenters a controller. (VRNotificationsDelegate...
  - `xr_interaction_profile_changed_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called whenever the interaction profile is altered. (VRNotificationsDelega...
  - `xr_play_area_changed_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called whenever the play area is altered. (VRNotificationsDelegate)
  - `xr_tracking_origin_changed_delegate`: `VRNotificationsDelegate` — [Read-Write] This will be called whenever the tracking origin is altered. (VRNotificationsDelegate)

### `unreal.XRAssetFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `XRAssetFunctionLibrary.h`

UXRAssetFunctionLibrary

**Methods** (2):
  - `add_device_visualization_component_blocking(target, xr_device_id, manual_attachment, relative_transform)` -> `PrimitiveComponent` [classmethod] — Spawns a render component for the specified XR device.
  - `add_named_device_visualization_component_blocking(target, system_name, device_name, manual_attachment, xr_device_id=XRDeviceId)` [classmethod] — Spawns a render component for the specified XR device.

### `unreal.XRDeviceVisualizationComponent`
Inherits: `StaticMeshComponent` | Header: `XRDeviceVisualizationComponent.h`

XRDevice Visualization Component

**Properties** (4):
  - `custom_display_mesh`: `StaticMesh` — [Read-Write] A mesh override thatâll be displayed attached to this MotionController. (StaticMesh)
  - `display_mesh_material_overrides`: `None` [Read-Only] — [Read-Only] Material overrides for the specified display mesh. (Array[MaterialInterface])
  - `display_model_source`: `Name` — this may fail if thereâs no default model; use âCustomâ to specify your own. (Name) [Read-Writ...
  - `is_visualization_active`: `bool` — [Read-Write] Whether the visualization offered by this component is being used. (bool)

### `unreal.XRLoadingScreenFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `XRLoadingScreenFunctionLibrary.h`

XR Loading Screen Function Library

**Methods** (5):
  - `add_loading_screen_splash(texture, translation, rotation, size = [1.000000,1.000000], delta_rotation = [0.000000,0.000000,0.000000], clear_before_add = False)` -> `None` [classmethod] — Adds a splash element to the loading screen.
  - `clear_loading_screen_splashes()` -> `None` [classmethod] — Clear Loading Screen Splashes
  - `hide_loading_screen()` -> `None` [classmethod] — Hide the splash screen and return to normal display.
  - `set_loading_screen(texture, scale = [1.000000,1.000000], offset = [0.000000,0.000000,0.000000], show_loading_movie = False, show_on_set = False)` -> `None` [classmethod] — Sets the loading screen texture for VR displays.
  - `show_loading_screen()` -> `None` [classmethod] — Show the loading screen and override the VR display

### `unreal.DeviceModelLoadedDelegate`
Inherits: `MulticastDelegateBase` | Header: `XRAssetFunctionLibrary.h`

UAsyncTask_LoadXRDeviceVisComponent

### `unreal.VRNotificationsComponent_VRNotificationsDelegate`
Inherits: `MulticastDelegateBase` | Header: `VRNotificationsComponent.h`

VRNotifications Delegate Delegate Signature

### `unreal.XRDeviceOnDisconnectDelegate`
Inherits: `DelegateBase` | Header: `HeadMountedDisplayFunctionLibrary.h`

XRDevice on Disconnect Delegate Delegate Signature

### `unreal.XRTimedInputActionDelegate`
Inherits: `DelegateBase` | Header: `HeadMountedDisplayFunctionLibrary.h`

XRTimed Input Action Delegate Delegate Signature
