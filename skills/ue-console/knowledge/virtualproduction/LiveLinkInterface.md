# UE Python API — LiveLinkInterface Module

**55 types** from the `LiveLinkInterface` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LiveLinkAnimationFrameData`, `LiveLinkBaseBlueprintData`, `LiveLinkBaseFrameData`, `LiveLinkBaseStaticData`, `LiveLinkBasicBlueprintData`, `LiveLinkCameraBlueprintData`, `LiveLinkCameraFrameData`, `LiveLinkCameraStaticData`, `LiveLinkCurveConversionSettings`, `LiveLinkFloatAnimationFrameData`, `LiveLinkFrameRate`, `LiveLinkGamepadInputDeviceBlueprintData`, `LiveLinkGamepadInputDeviceFrameData`, `LiveLinkGamepadInputDeviceStaticData`, `LiveLinkLightBlueprintData`, `LiveLinkLightFrameData`, `LiveLinkLightStaticData`, `LiveLinkLocatorBlueprintData`, `LiveLinkLocatorFrameData`, `LiveLinkLocatorStaticData`, ... (55 total)

---

## Classes

### `unreal.LiveLinkAnimationFrameData`
Inherits: `LiveLinkBaseFrameData` | Header: `LiveLinkAnimationTypes.h`

Dynamic data for Animation purposes.

**Properties** (1):
  - `transforms`: `None` — [Read-Write] Array of transforms for each bone of the skeleton (Array[Transform])

### `unreal.LiveLinkBaseBlueprintData`
Inherits: `StructBase` | Header: `LiveLinkTypes.h`

Base blueprint data structure for a subject frame Can be used to do blueprint facilitator per role

### `unreal.LiveLinkBaseFrameData`
Inherits: `StructBase` | Header: `LiveLinkTypes.h`

Base data structure for each frame coming in for a subject note: subclass canât contains reference to UObject

**Properties** (2):
  - `meta_data`: `LiveLinkMetaData` — [Read-Write] Frameâs metadata. (LiveLinkMetaData)
  - `property_values`: `None` — [Read-Write] Values of the properties defined in the static structure. Use FLiveLinkBaseStaticData.F...

### `unreal.LiveLinkBaseStaticData`
Inherits: `StructBase` | Header: `LiveLinkTypes.h`

Base static data structure for a subject Use to store information that is common to every frame note: subclass canât contains reference to UObject

**Properties** (1):
  - `property_names`: `None` — [Read-Write] Names for each curve values that will be sent for each frame (Array[Name])

### `unreal.LiveLinkBasicBlueprintData`
Inherits: `LiveLinkBaseBlueprintData` | Header: `LiveLinkBasicTypes.h`

Facility structure to handle base data in blueprint

**Properties** (2):
  - `frame_data`: `LiveLinkBaseFrameData` — [Read-Write] Dynamic data that can change every frame (LiveLinkBaseFrameData)
  - `static_data`: `LiveLinkBaseStaticData` — [Read-Write] Static data that should not change every frame (LiveLinkBaseStaticData)

### `unreal.LiveLinkCameraBlueprintData`
Inherits: `LiveLinkBaseBlueprintData` | Header: `LiveLinkCameraTypes.h`

Facility structure to handle camera data in blueprint

**Properties** (2):
  - `frame_data`: `LiveLinkCameraFrameData` — [Read-Write] Dynamic data that can change every frame (LiveLinkCameraFrameData)
  - `static_data`: `LiveLinkCameraStaticData` — [Read-Write] Static data that should not change every frame (LiveLinkCameraStaticData)

### `unreal.LiveLinkCameraFrameData`
Inherits: `LiveLinkTransformFrameData` | Header: `LiveLinkCameraTypes.h`

Dynamic data for camera

**Properties** (8):
  - `aperture`: `float` — [Read-Write] Aperture of the camera in terms of f-stop (float)
  - `aspect_ratio`: `float` — [Read-Write] Aspect Ratio of the camera (Width / Heigth) (float)
  - `field_of_view`: `float` — [Read-Write] Field of View of the camera in degrees (float)
  - `film_back_height`: `float` — [Read-Write] Used with CinematicCamera. Values greater than 0 will be applied if bIsDynamicFilmbackS...
  - `film_back_width`: `float` — [Read-Write] Used with CinematicCamera. Values greater than 0 will be applied if bIsDynamicFilmbackS...
  - `focal_length`: `float` — [Read-Write] Focal length of the camera (float)
  - `focus_distance`: `float` — [Read-Write] Focus distance of the camera in cm. Works only in manual focus method (float)
  - `projection_mode`: `LiveLinkCameraProjectionMode` — [Read-Write] ProjectionMode of the camera (Perspective, Orthographic, etcâ¦) (LiveLinkCameraProject...

### `unreal.LiveLinkCameraStaticData`
Inherits: `LiveLinkTransformStaticData` | Header: `LiveLinkCameraTypes.h`

Static data for Camera data.

**Properties** (10):
  - `film_back_height`: `float` — [Read-Write] Used with CinematicCamera. Values greater than 0 will be applied (float)
  - `film_back_width`: `float` — [Read-Write] Used with CinematicCamera. Values greater than 0 will be applied (float)
  - `is_aperture_supported`: `bool` — [Read-Write] Whether Aperture in frame data can be used (bool)
  - `is_aspect_ratio_supported`: `bool` — [Read-Write] Whether AspectRatio in frame data can be used (bool)
  - `is_depth_of_field_supported`: `bool` — [Read-Write] Set to false to force the camera to disable depth of field (bool)
  - `is_dynamic_filmback_supported`: `bool` — [Read-Write] Specifies if the live link subject will send dynamic changes to the film back. (bool)
  - `is_field_of_view_supported`: `bool` — [Read-Write] Whether FieldOfView in frame data can be used (bool)
  - `is_focal_length_supported`: `bool` — [Read-Write] Whether FocalLength in frame data can be used (bool)
  - `is_focus_distance_supported`: `bool` — [Read-Write] Whether FocusDistance in frame data can be used (bool)
  - `is_projection_mode_supported`: `bool` — [Read-Write] Whether ProjectionMode in frame data can be used (bool)

### `unreal.LiveLinkCurveConversionSettings`
Inherits: `StructBase` | Header: `LiveLinkCurveRemapSettings.h`

Live Link Curve Conversion Settings

### `unreal.LiveLinkFloatAnimationFrameData`
Inherits: `LiveLinkBaseFrameData` | Header: `LiveLinkAnimationTypes.h`

Single-precision floating point equivalent of FLiveLinkAnimationFrameData.

### `unreal.LiveLinkFrameRate`
Inherits: `FrameRate` | Header: `LiveLinkTypes.h`

Live Link Frame Rate

### `unreal.LiveLinkGamepadInputDeviceBlueprintData`
Inherits: `LiveLinkBaseBlueprintData` | Header: `LiveLinkInputDeviceTypes.h`

Facility structure to handle Preston MDR data in blueprint

**Properties** (2):
  - `frame_data`: `LiveLinkGamepadInputDeviceFrameData` — [Read-Write] Dynamic data that can change every frame (LiveLinkGamepadInputDeviceFrameData)
  - `static_data`: `LiveLinkGamepadInputDeviceStaticData` — [Read-Write] Static data that should not change every frame (LiveLinkGamepadInputDeviceStaticData)

### `unreal.LiveLinkGamepadInputDeviceFrameData`
Inherits: `LiveLinkBaseFrameData` | Header: `LiveLinkInputDeviceTypes.h`

Struct for dynamic (per-frame) Gampead Input Device data

**Properties** (32):
  - `d_pad_down`: `float` — [Read-Write] (float)
  - `d_pad_left`: `float` — [Read-Write] (float)
  - `d_pad_right`: `float` — [Read-Write] (float)
  - `d_pad_up`: `float` — [Read-Write] (float)
  - `face_button_bottom`: `float` — [Read-Write] (float)
  - `face_button_left`: `float` — [Read-Write] (float)
  - `face_button_right`: `float` — [Read-Write] (float)
  - `face_button_top`: `float` — [Read-Write] (float)
  - `left_analog_x`: `float` — [Read-Write] (float)
  - `left_analog_y`: `float` — [Read-Write] (float)
  - `left_shoulder`: `float` — [Read-Write] (float)
  - `left_stick_down`: `float` — [Read-Write] (float)
  - `left_stick_left`: `float` — [Read-Write] (float)
  - `left_stick_right`: `float` — [Read-Write] (float)
  - `left_stick_up`: `float` — [Read-Write] (float)
  - `left_thumb`: `float` — [Read-Write] (float)
  - `left_trigger_analog`: `float` — [Read-Write] (float)
  - `left_trigger_threshold`: `float` — [Read-Write] (float)
  - `right_analog_x`: `float` — [Read-Write] (float)
  - `right_analog_y`: `float` — [Read-Write] (float)
  - `right_shoulder`: `float` — [Read-Write] (float)
  - `right_stick_down`: `float` — [Read-Write] (float)
  - `right_stick_left`: `float` — [Read-Write] (float)
  - `right_stick_right`: `float` — [Read-Write] (float)
  - `right_stick_up`: `float` — [Read-Write] (float)
  - `right_thumb`: `float` — [Read-Write] (float)
  - `right_trigger_analog`: `float` — [Read-Write] (float)
  - `right_trigger_threshold`: `float` — [Read-Write] (float)
  - `special_left`: `float` — [Read-Write] (float)
  - `special_left_x`: `float` — [Read-Write] (float)
  - `special_left_y`: `float` — [Read-Write] (float)
  - `special_right`: `float` — [Read-Write] (float)

### `unreal.LiveLinkGamepadInputDeviceStaticData`
Inherits: `LiveLinkBaseStaticData` | Header: `LiveLinkInputDeviceTypes.h`

Struct for static Gamepad Input Device data

### `unreal.LiveLinkLightBlueprintData`
Inherits: `LiveLinkBaseBlueprintData` | Header: `LiveLinkLightTypes.h`

Facility structure to handle light data in blueprint

**Properties** (2):
  - `frame_data`: `LiveLinkLightFrameData` — [Read-Write] Dynamic data that can change every frame (LiveLinkLightFrameData)
  - `static_data`: `LiveLinkLightStaticData` — [Read-Write] Static data that should not change every frame (LiveLinkLightStaticData)

### `unreal.LiveLinkLightFrameData`
Inherits: `LiveLinkTransformFrameData` | Header: `LiveLinkLightTypes.h`

Dynamic data for light.

**Properties** (9):
  - `attenuation_radius`: `float` — [Read-Write] Light visible influence. Works for Pointlight and Spotlight. (float)
  - `inner_cone_angle`: `float` — [Read-Write] Inner cone angle in degrees for a Spotlight. (float)
  - `intensity`: `float` — [Read-Write] Total energy that the light emits in lux. (float)
  - `light_color`: `Color` — [Read-Write] Filter color of the light. (Color)
  - `outer_cone_angle`: `float` — [Read-Write] Outer cone angle in degrees for a Spotlight. (float)
  - `soft_source_radius`: `float` — [Read-Write] Soft radius of light source shape. Works for Pointlight and Spotlight. (float)
  - `source_length`: `float` — [Read-Write] Length of light source shape. Works for Pointlight and Spotlight. (float)
  - `source_radius`: `float` — [Read-Write] Radius of light source shape. Works for Pointlight and Spotlight. (float)
  - `temperature`: `float` — [Read-Write] Color temperature in Kelvin of the blackbody illuminant (float)

### `unreal.LiveLinkLightStaticData`
Inherits: `LiveLinkTransformStaticData` | Header: `LiveLinkLightTypes.h`

Static data for Light data.

**Properties** (9):
  - `is_attenuation_radius_supported`: `bool` — [Read-Write] Whether AttenuationRadius can be used in the frame data. Only used for spot lights (boo...
  - `is_inner_cone_angle_supported`: `bool` — [Read-Write] Whether InnerConeAngle can be used in the frame data. Only used for spot lights (bool)
  - `is_intensity_supported`: `bool` — [Read-Write] Whether Intensity can be used in the frame data (bool)
  - `is_light_color_supported`: `bool` — [Read-Write] Whether LightColor can be used in the frame data (bool)
  - `is_outer_cone_angle_supported`: `bool` — [Read-Write] Whether OuterConeAngle can be used in the frame data. Only used for spot lights (bool)
  - `is_soft_source_radius_supported`: `bool` — [Read-Write] Whether SoftSourceRadius can be used in the frame data. Only used for spot lights (bool...
  - `is_source_lenght_supported`: `bool` — [Read-Write] Whether SourceLength can be used in the frame data. Only used for spot lights (bool)
  - `is_source_radius_supported`: `bool` — [Read-Write] Whether SourceRadius can be used in the frame data. Only used for spot lights (bool)
  - `is_temperature_supported`: `bool` — [Read-Write] Whether Temperature can be used in the frame data (bool)

### `unreal.LiveLinkLocatorBlueprintData`
Inherits: `LiveLinkBaseBlueprintData` | Header: `LiveLinkLocatorTypes.h`

Facility structure to handle data access in Blueprint

**Properties** (2):
  - `frame_data`: `LiveLinkLocatorFrameData` — [Read-Write] (LiveLinkLocatorFrameData)
  - `static_data`: `LiveLinkLocatorStaticData` — [Read-Write] Static data should not change every frame (LiveLinkLocatorStaticData)

### `unreal.LiveLinkLocatorFrameData`
Inherits: `LiveLinkBaseFrameData` | Header: `LiveLinkLocatorTypes.h`

Dynamic data for Animation purposes.

**Properties** (1):
  - `locators`: `None` — [Read-Write] Array of locations for each locator/marker (Array[Vector])

### `unreal.LiveLinkLocatorStaticData`
Inherits: `LiveLinkBaseStaticData` | Header: `LiveLinkLocatorTypes.h`

Static data for Locator purposes. Contains data about locators that should not change every frame. If data is unlabelled markers, Locator names array must be empty.

**Properties** (2):
  - `locator_names`: `None` — [Read-Write] (Array[Name])
  - `unlabelled_data`: `bool` — [Read-Write] * Set this to true if you wish to send an unstructured number of locators that can vary...

### `unreal.LiveLinkMetaData`
Inherits: `StructBase` | Header: `LiveLinkTypes.h`

Live Link Meta Data

**Properties** (2):
  - `scene_time`: `QualifiedTime` — [Read-Write] (QualifiedTime)
  - `string_meta_data`: `None` — [Read-Write] (Map[Name,str])

### `unreal.LiveLinkSkeletonStaticData`
Inherits: `LiveLinkBaseStaticData` | Header: `LiveLinkAnimationTypes.h`

Static data for Animation purposes. Contains data about bones that shouldnât change every frame.

**Properties** (2):
  - `bone_names`: `None` — [Read-Write] Names of each bone in the skeleton (Array[Name])
  - `bone_parents`: `None` — For each bone it specifies the index of its parent (Array[int32]) [Read-Write] Parent Indices

### `unreal.LiveLinkSourceBufferManagementSettings`
Inherits: `StructBase` | Header: `LiveLinkSourceSettings.h`

Live Link Source Buffer Management Settings

### `unreal.LiveLinkSourceHandle`
Inherits: `StructBase` | Header: `ILiveLinkSource.h`

A Blueprint handle to a specific LiveLink Source

### `unreal.LiveLinkSourcePreset`
Inherits: `StructBase` | Header: `LiveLinkPresetTypes.h`

Live Link Source Preset

### `unreal.LiveLinkSubjectKey`
Inherits: `StructBase` | Header: `LiveLinkTypes.h`

Structure that identifies an individual subject

**Properties** (2):
  - `source`: `Guid` [Read-Only] — [Read-Only] The guid for this subjects source (Guid)
  - `subject_name`: `LiveLinkSubjectName` [Read-Only] — [Read-Only] The Name of this subject (LiveLinkSubjectName)

### `unreal.LiveLinkSubjectName`
Inherits: `StructBase` | Header: `LiveLinkTypes.h`

Live Link Subject Name

**Properties** (1):
  - `name`: `Name` — [Read-Write] Name of the subject (Name)

### `unreal.LiveLinkSubjectPreset`
Inherits: `StructBase` | Header: `LiveLinkPresetTypes.h`

Live Link Subject Preset

### `unreal.LiveLinkSubjectRepresentation`
Inherits: `StructBase` | Header: `LiveLinkRole.h`

Live Link Subject Representation

**Properties** (2):
  - `role`: `Class` — [Read-Write] (type(Class))
  - `subject`: `LiveLinkSubjectName` — [Read-Write] (LiveLinkSubjectName)

### `unreal.LiveLinkTime`
Inherits: `StructBase` | Header: `LiveLinkTypes.h`

Live Link Time

### `unreal.LiveLinkTransform`
Inherits: `StructBase` | Header: `LiveLinkAnimationBlueprintStructs.h`

Live Link Transform

### `unreal.LiveLinkTransformBlueprintData`
Inherits: `LiveLinkBaseBlueprintData` | Header: `LiveLinkTransformTypes.h`

Facility structure to handle transform data in blueprint

**Properties** (2):
  - `frame_data`: `LiveLinkTransformFrameData` — [Read-Write] Dynamic data that can change every frame (LiveLinkTransformFrameData)
  - `static_data`: `LiveLinkTransformStaticData` — [Read-Write] Static data that should not change every frame (LiveLinkTransformStaticData)

### `unreal.LiveLinkTransformFrameData`
Inherits: `LiveLinkBaseFrameData` | Header: `LiveLinkTransformTypes.h`

Dynamic data for Transform

**Properties** (1):
  - `transform`: `Transform` — [Read-Write] Transform of the frame (Transform)

### `unreal.LiveLinkTransformStaticData`
Inherits: `LiveLinkBaseStaticData` | Header: `LiveLinkTransformTypes.h`

Static data for Transform data.

**Properties** (3):
  - `is_location_supported`: `bool` — [Read-Write] Whether location in frame data should be used (bool)
  - `is_rotation_supported`: `bool` — [Read-Write] Whether rotation in frame data should be used (bool)
  - `is_scale_supported`: `bool` — [Read-Write] Whether scale in frame data should be used (bool)

### `unreal.LiveLinkWorldTime`
Inherits: `StructBase` | Header: `LiveLinkTypes.h`

Live Link World Time

### `unreal.SubjectFrameHandle`
Inherits: `LiveLinkBaseBlueprintData` | Header: `LiveLinkAnimationBlueprintStructs.h`

Subject Frame Handle

### `unreal.SubjectMetadata`
Inherits: `StructBase` | Header: `LiveLinkAnimationBlueprintStructs.h`

Subject Metadata

**Properties** (3):
  - `scene_framerate`: `FrameRate` — [Read-Write] (FrameRate)
  - `scene_timecode`: `Timecode` — [Read-Write] (Timecode)
  - `string_metadata`: `None` — [Read-Write] (Map[Name,str])

### `unreal.LiveLinkAnimationRole`
Inherits: `LiveLinkBasicRole` | Header: `LiveLinkAnimationRole.h`

Role associated for Animation / Skeleton data.

### `unreal.LiveLinkBasicRole`
Inherits: `LiveLinkRole` | Header: `LiveLinkBasicRole.h`

Role associated for no specific role data.

### `unreal.LiveLinkCameraRole`
Inherits: `LiveLinkTransformRole` | Header: `LiveLinkCameraRole.h`

Role associated for Camera data.

### `unreal.LiveLinkFrameInterpolationProcessor`
Inherits: `Object` | Header: `LiveLinkFrameInterpolationProcessor.h`

Basic object to interpolate live link frames Inherit from it to do custom blending for your data type note: It can only be used on the Game Thread. See ILiveLinkFrameInterpolationProcessorWorker for t...

### `unreal.LiveLinkFramePreProcessor`
Inherits: `Object` | Header: `LiveLinkFramePreProcessor.h`

Basic object to apply preprocessing to a live link frame. Inherit from it to add specific operations / options for a certain type of data note: It can only be used on the Game Thread. See ILiveLinkFra...

### `unreal.LiveLinkFrameTranslator`
Inherits: `Object` | Header: `LiveLinkFrameTranslator.h`

Basic object to translate data from one role to another note: It can only be used on the Game Thread. See ILiveLinkFrameTranslatorWorker for the any thread implementation.

### `unreal.LiveLinkInputDeviceRole`
Inherits: `LiveLinkBasicRole` | Header: `LiveLinkInputDeviceRole.h`

Role associated with Input Device data.

### `unreal.LiveLinkLightRole`
Inherits: `LiveLinkTransformRole` | Header: `LiveLinkLightRole.h`

Role associated for Light data.

### `unreal.LiveLinkLocatorRole`
Inherits: `LiveLinkBasicRole` | Header: `LiveLinkLocatorRole.h`

Role associated with Locator / Marker data. This is intended for optical motion capture marker clouds.

### `unreal.LiveLinkRole`
Inherits: `Object` | Header: `LiveLinkRole.h`

Basic object to extend the meaning of incoming live link frames.

### `unreal.LiveLinkSourceSettings`
Inherits: `Object` | Header: `LiveLinkSourceSettings.h`

Base class for live link source settings (can be replaced by sources themselves)

### `unreal.LiveLinkSubjectRemapper`
Inherits: `Object` | Header: `LiveLinkSubjectRemapper.h`

Class used to remap livelink subjects without having to rely on animation blueprints.

### `unreal.LiveLinkSubjectSettings`
Inherits: `Object` | Header: `LiveLinkSubjectSettings.h`

Base class for live link subject settings

### `unreal.LiveLinkTransformRole`
Inherits: `LiveLinkBasicRole` | Header: `LiveLinkTransformRole.h`

Role associated for Camera data.

### `unreal.LiveLinkVirtualSubject`
Inherits: `Object` | Header: `LiveLinkVirtualSubject.h`

A Virtual subject is made up of one or more real subjects from a source

### `unreal.LiveLinkCameraProjectionMode`
Inherits: `EnumBase` | Header: `LiveLinkCameraTypes.h`

ELive Link Camera Projection Mode

**Properties** (2):
  - `ORTHOGRAPHIC`: `LiveLinkCameraProjectionMode = Ellipsis` — 1
  - `PERSPECTIVE`: `LiveLinkCameraProjectionMode = Ellipsis` — 0

### `unreal.LiveLinkSourceMode`
Inherits: `EnumBase` | Header: `LiveLinkSourceSettings.h`

ELive Link Source Mode

**Properties** (3):
  - `ENGINE_TIME`: `LiveLinkSourceMode = Ellipsis` — The source will use the engineâs time to evaluate its subjects.
This mode is most useful when smoo...
  - `LATEST`: `LiveLinkSourceMode = Ellipsis` — The source will the latest frame available to evaluate its subjects.
This mode will not attempt any ...
  - `TIMECODE`: `LiveLinkSourceMode = Ellipsis` — The source will use the engineâs timecode to evaluate its subjects.
This mode is most useful when ...

### `unreal.LiveLinkSubjectState`
Inherits: `EnumBase` | Header: `ILiveLinkClient.h`

Describes the state of a live link subject

**Properties** (6):
  - `CONNECTED`: `LiveLinkSubjectState = Ellipsis` — The input is connected. 0
  - `DISCONNECTED`: `LiveLinkSubjectState = Ellipsis` — The input is not connected. 2
  - `INVALID_OR_DISABLED`: `LiveLinkSubjectState = Ellipsis` — The subject is invalid or disabled 3
  - `PAUSED`: `LiveLinkSubjectState = Ellipsis` — The subject is currently paused. 4
  - `UNKNOWN`: `LiveLinkSubjectState = Ellipsis` — The state of the subject is unknown. e.g. It cannot be queried 5
  - `UNRESPONSIVE`: `LiveLinkSubjectState = Ellipsis` — The input is connected but no data is available. 1
