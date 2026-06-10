# UE Python API — LiveLinkOpenTrackIO Module

**33 types** from the `LiveLinkOpenTrackIO` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LiveLinkOpenTrackIO_PTP`, `LiveLinkOpenTrackIO_PTPLeaderPriorities`, `LiveLinkOpenTrackIO_Rotator`, `LiveLinkOpenTrackIO_XYZ`, `LiveLinkOpenTrackIOAnamorphicSqueeze`, `LiveLinkOpenTrackIOCustomData`, `LiveLinkOpenTrackIOCustomDataField`, `LiveLinkOpenTrackIOData`, `LiveLinkOpenTrackIOFrameRate`, `LiveLinkOpenTrackIOGlobalStage`, `LiveLinkOpenTrackIOLens`, `LiveLinkOpenTrackIOLens_DistortionCoeff`, `LiveLinkOpenTrackIOLens_DistortionOffset`, `LiveLinkOpenTrackIOLens_Encoders`, `LiveLinkOpenTrackIOLens_ExposureFalloff`, `LiveLinkOpenTrackIOLens_RawEncoders`, `LiveLinkOpenTrackIOProtocol`, `LiveLinkOpenTrackIOSensorDimensions`, `LiveLinkOpenTrackIOSensorResolution`, `LiveLinkOpenTrackIOStaticCamera`, ... (33 total)

---

## Classes

### `unreal.LiveLinkOpenTrackIO_PTP`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IO PTP

**Properties** (7):
  - `leader_accuracy`: `float` — [Read-Write] (double)
  - `leader_identity`: `str` — [Read-Write] PTP Leader identity follows the pattern: (?:^[0-9a-f]{2}(?::[0-9a-f]{2}){5}$)|(?:^[0-9a...
  - `leader_priorities`: `LiveLinkOpenTrackIO_PTPLeaderPriorities` — [Read-Write] Data structure for PTP synchronization priorities (LiveLinkOpenTrackIO_PTPLeaderPriorit...
  - `leader_time_source`: `str` — [Read-Write] Enum string property [GNSS, Atomic clock, NTP] (str)
  - `mean_path_delay`: `float` — [Read-Write] (double)
  - `profile`: `str` — Can be one the following values [IEEE Std 1588-2019, IEEE Std 802.1AS-2020, SMPTE ST2059-2:2021] (st...
  - `vlan`: `int` — [Read-Write] (int32)

### `unreal.LiveLinkOpenTrackIO_PTPLeaderPriorities`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IO PTPLeader Priorities

**Properties** (2):
  - `priority1`: `int` — [Read-Write] (uint8)
  - `priority2`: `int` — [Read-Write] (uint8)

### `unreal.LiveLinkOpenTrackIO_Rotator`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IO Rotator

**Properties** (3):
  - `pan`: `float` — [Read-Write] (double)
  - `roll`: `float` — [Read-Write] (double)
  - `tilt`: `float` — [Read-Write] (double)

### `unreal.LiveLinkOpenTrackIO_XYZ`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IO XYZ

**Properties** (3):
  - `x`: `float` — [Read-Write] (double)
  - `y`: `float` — [Read-Write] (double)
  - `z`: `float` — [Read-Write] (double)

### `unreal.LiveLinkOpenTrackIOAnamorphicSqueeze`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Nominal ratio of height to width of the image of an axis-aligned square captured by the camera sensor. It can be used to de-squeeze images but is not however an exact number over the entire captured a...

**Properties** (2):
  - `denom`: `int` — [Read-Write] (int32)
  - `num`: `int` — [Read-Write] (int32)

### `unreal.LiveLinkOpenTrackIOCustomData`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOCustom Data

**Properties** (1):
  - `live_link_meta_data`: `None` — [Read-Write] A list of string based key/value pairs that can be read and applied to the Live Link da...

### `unreal.LiveLinkOpenTrackIOCustomDataField`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOCustom Data Field

**Properties** (2):
  - `key`: `str` — [Read-Write] Meta data is inserted into Live Link Frame data using a Key, Value pair. This is the ke...
  - `value`: `str` — [Read-Write] Meta data is inserted into Live Link Frame data using a Key, Value pair. This is the va...

### `unreal.LiveLinkOpenTrackIOData`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Data from a parsed header that was read by other CBOR or JSON format.

**Properties** (12):
  - `custom`: `LiveLinkOpenTrackIOCustomData` — [Read-Write] Typed property to allow users to add custom data to the incoming OpenTrackIO data. Our ...
  - `global_stage`: `LiveLinkOpenTrackIOGlobalStage` — [Read-Write] Position of stage origin in global ENU and geodetic coordinates (LiveLinkOpenTrackIOGlo...
  - `lens`: `LiveLinkOpenTrackIOLens` — [Read-Write] (LiveLinkOpenTrackIOLens)
  - `protocol`: `LiveLinkOpenTrackIOProtocol` — [Read-Write] (LiveLinkOpenTrackIOProtocol)
  - `related_sample_ids`: `None` — [Read-Write] List of sampleId properties of samples related to this sample. The
existence of a sampl...
  - `sample_id`: `str` — [Read-Write] URN serving as unique identifier of the sample in which data is being transported.
Patt...
  - `source_id`: `str` — [Read-Write] URN serving as unique identifier of the source from which data is being transported.
Pa...
  - `source_number`: `int` — [Read-Write] Number that identifies the index of the stream from a source from which
data is being t...
  - `static`: `LiveLinkOpenTrackIOStaticData` — [Read-Write] (LiveLinkOpenTrackIOStaticData)
  - `timing`: `LiveLinkOpenTrackIOTiming` — [Read-Write] (LiveLinkOpenTrackIOTiming)
  - `tracker`: `LiveLinkOpenTrackIOTracker` — [Read-Write] (LiveLinkOpenTrackIOTracker)
  - `transforms`: `None` — [Read-Write] A list of transforms. Transforms are composed in order with the last in the list repres...

### `unreal.LiveLinkOpenTrackIOFrameRate`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Represents frame rate type from OpenTrack I/O. Value is represented in hertz using an fractional representation Numerator / Denominator. The default value is 24 / 1 or 24 cycles per second.

**Properties** (2):
  - `denom`: `int` — [Read-Write] Denominator of the frame rate value. (int32)
  - `num`: `int` — [Read-Write] Numerator of the frame rate value. (int32)

### `unreal.LiveLinkOpenTrackIOGlobalStage`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Position of stage origin in global ENU and geodetic coordinates (E, N, U, lat0, lon0, h0). Note this may be dynamic if the stage is inside a moving vehicle. Units represented in meters.

**Properties** (6):
  - `e`: `float` — [Read-Write] (double)
  - `h0`: `float` — [Read-Write] (double)
  - `lat0`: `float` — [Read-Write] (double)
  - `lon0`: `float` — [Read-Write] (double)
  - `n`: `float` — [Read-Write] (double)
  - `u`: `float` — [Read-Write] (double)

### `unreal.LiveLinkOpenTrackIOLens`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOLens

**Properties** (12):
  - `custom`: `None` — [Read-Write] This list provides optional additional custom coefficients that can extend the existing...
  - `distortion`: `None` — [Read-Write] A list of Distortion objects that each define the coefficients for calculating the dist...
  - `distortion_offset`: `LiveLinkOpenTrackIOLens_DistortionOffset` — [Read-Write] Offset in x and y of the centre of distortion of the virtual camera in millimeter (Live...
  - `encoders`: `LiveLinkOpenTrackIOLens_Encoders` — [Read-Write] Normalised real numbers (0-1) for focus, iris and zoom (LiveLinkOpenTrackIOLens_Encoder...
  - `entrance_pupil_offset`: `type` — [Read-Write] Offset of the entrance pupil relative to the nominal imaging plane
(positive if the ent...
  - `exposure_falloff`: `LiveLinkOpenTrackIOLens_ExposureFalloff` — [Read-Write] Coefficients for calculating the exposure fall-off (vignetting) of a lens (LiveLinkOpen...
  - `f_stop`: `type` — [Read-Write] The linear f-number of the lens, equal to the focal length divided by the diameter of t...
  - `focus_distance`: `type` — [Read-Write] Focus distance/position of the lens in meters. (âundefinedâ)
  - `pinhole_focal_length`: `type` — [Read-Write] Distance between the pinhole and the image plane in the simple CGI pinhole camera model...
  - `projection_offset`: `LiveLinkOpenTrackIOLens_DistortionOffset` — [Read-Write] Offset in x and y of the centre of perspective projection of the virtual camera (LiveLi...
  - `raw_encoders`: `LiveLinkOpenTrackIOLens_RawEncoders` — [Read-Write] Raw encoder values. (LiveLinkOpenTrackIOLens_RawEncoders)
  - `t_stop`: `float` — Linear t-number of the lens, equal to the F-number of the lens divided by the square root of the tra...

### `unreal.LiveLinkOpenTrackIOLens_DistortionCoeff`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOLens Distortion Coeff

**Properties** (5):
  - `custom`: `None` — [Read-Write] This is not currently in the spec but it would simplify sending any set of unnamed para...
  - `model`: `Name` — [Read-Write] (Name)
  - `overscan`: `float` — [Read-Write] (float)
  - `radial`: `None` — [Read-Write] (Array[float])
  - `tangential`: `None` — [Read-Write] (Array[float])

### `unreal.LiveLinkOpenTrackIOLens_DistortionOffset`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOLens Distortion Offset

**Properties** (2):
  - `x`: `float` — [Read-Write] (float)
  - `y`: `float` — [Read-Write] (float)

### `unreal.LiveLinkOpenTrackIOLens_Encoders`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Encoders are represented in this way (as opposed to raw integer values) to ensure values remain independent of encoder resolution, minimum and maximum (at an acceptable loss of precision). These value...

**Properties** (3):
  - `focus`: `float` — [Read-Write] (float)
  - `iris`: `float` — [Read-Write] (float)
  - `zoom`: `float` — [Read-Write] (float)

### `unreal.LiveLinkOpenTrackIOLens_ExposureFalloff`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Coefficients for calculating the exposure fall-off (vignetting) of a lens.

**Properties** (3):
  - `a1`: `float` — [Read-Write] (float)
  - `a2`: `float` — [Read-Write] (float)
  - `a3`: `float` — [Read-Write] (float)

### `unreal.LiveLinkOpenTrackIOLens_RawEncoders`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Raw encoder values for focus, iris and zoom. These values are dependent on encoder resolution and before any homing / ranging has taken place.

**Properties** (3):
  - `focus`: `int` — [Read-Write] (int32)
  - `iris`: `int` — [Read-Write] (int32)
  - `zoom`: `int` — [Read-Write] (int32)

### `unreal.LiveLinkOpenTrackIOProtocol`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Name of the protocol in which the sample is being employed, and version of that protocol

**Properties** (1):
  - `name`: `str` [Read-Only] — [Read-Only] The name of the protocol. If you want to extract the full version string then use GetVer...

### `unreal.LiveLinkOpenTrackIOSensorDimensions`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Height and width of the active area of the camera sensor in millimeters

**Properties** (2):
  - `height`: `type` — [Read-Write] (âundefinedâ)
  - `width`: `type` — [Read-Write] (âundefinedâ)

### `unreal.LiveLinkOpenTrackIOSensorResolution`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Photosite resolution of the active area of the camera sensor in pixels

**Properties** (2):
  - `height`: `int` — [Read-Write] (int32)
  - `width`: `int` — [Read-Write] (int32)

### `unreal.LiveLinkOpenTrackIOStaticCamera`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOStatic Camera

**Properties** (11):
  - `active_sensor_physical_dimensions`: `LiveLinkOpenTrackIOSensorDimensions` — [Read-Write] Object representing the sensor dimensions. (LiveLinkOpenTrackIOSensorDimensions)
  - `active_sensor_resolution`: `LiveLinkOpenTrackIOSensorResolution` — [Read-Write] Object representing the sensor resolution. (LiveLinkOpenTrackIOSensorResolution)
  - `anamorphic_squeeze`: `LiveLinkOpenTrackIOAnamorphicSqueeze` — [Read-Write] Anamorphic squeeze ratio (LiveLinkOpenTrackIOAnamorphicSqueeze)
  - `capture_frame_rate`: `LiveLinkOpenTrackIOFrameRate` — [Read-Write] Object representing the capture rate. (LiveLinkOpenTrackIOFrameRate)
  - `fdl_link`: `str` — [Read-Write] URN identifying the ASC Framing Decision List used by the camera.
Pattern:  ^urn:uuid:[...
  - `firmware_version`: `str` — [Read-Write] Non-blank string identifying camera firmware version (str)
  - `iso_speed`: `int` — [Read-Write] Arithmetic ISO scale as defined in ISO 12232 (int32)
  - `label`: `str` — [Read-Write] Non-blank string containing user-determined camera identifier (str)
  - `make`: `str` — [Read-Write] Non-blank string naming camera manufacturer. (str)
  - `model`: `str` — [Read-Write] Non-blank string naming camera model. (str)
  - `serial_number`: `str` — [Read-Write] Non-blank string for camera serial number. (str)

### `unreal.LiveLinkOpenTrackIOStaticData`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Static data from a parsed OpenTrackIO datagram. Per the spec this will be sent periodically from the source.

**Properties** (4):
  - `camera`: `LiveLinkOpenTrackIOStaticCamera` — [Read-Write] (LiveLinkOpenTrackIOStaticCamera)
  - `duration`: `LiveLinkOpenTrackIOStaticDuration` — [Read-Write] (LiveLinkOpenTrackIOStaticDuration)
  - `lens`: `LiveLinkOpenTrackIOStaticLens` — [Read-Write] (LiveLinkOpenTrackIOStaticLens)
  - `tracker`: `LiveLinkOpenTrackIOStaticTracker` — [Read-Write] (LiveLinkOpenTrackIOStaticTracker)

### `unreal.LiveLinkOpenTrackIOStaticDuration`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOStatic Duration

**Properties** (2):
  - `denom`: `int` — [Read-Write] (int32)
  - `num`: `int` — [Read-Write] (int32)

### `unreal.LiveLinkOpenTrackIOStaticLens`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOStatic Lens

**Properties** (8):
  - `calibration_history`: `None` — [Read-Write] List of free strings that describe the history of calibrations of the lens. (Array[str]...
  - `distortion_overscan_max`: `float` — [Read-Write] Static maximum overscan factor on lens distortion. This is an alternative to
providing ...
  - `firmware_version`: `str` — [Read-Write] Non-blank string identifying lens firmware version (str)
  - `make`: `str` — [Read-Write] Non-blank string naming lens manufacturer (str)
  - `model`: `str` — [Read-Write] Non-blank string identifying lens model (str)
  - `nominal_focal_length`: `float` — [Read-Write] Nominal focal length of the lens. The number printed on the side of a prime lens, e.g. ...
  - `serial_number`: `str` — [Read-Write] Non-blank string uniquely identifying the lens (str)
  - `undistortion_overscan_max`: `float` — [Read-Write] Static maximum overscan factor on lens undistortion. This is an alternative
to providin...

### `unreal.LiveLinkOpenTrackIOStaticTracker`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOStatic Tracker

**Properties** (4):
  - `firmware_version`: `str` — [Read-Write] Non-blank string identifying tracking device firmware version (str)
  - `make`: `str` — [Read-Write] Non-blank string naming tracking device manufacturer (str)
  - `model`: `str` — [Read-Write] Non-blank string identifying tracking device model (str)
  - `serial_number`: `str` — [Read-Write] Non-blank string uniquely identifying the tracking device (str)

### `unreal.LiveLinkOpenTrackIOSynchronization`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Object describing how the tracking device is synchronized for this sample.

**Properties** (6):
  - `frequency`: `LiveLinkOpenTrackIOFrameRate` — [Read-Write] Synchonization rate. (LiveLinkOpenTrackIOFrameRate)
  - `locked`: `bool` — [Read-Write] (bool)
  - `offsets`: `LiveLinkOpenTrackIOSynchronizationOffsets` — [Read-Write] (LiveLinkOpenTrackIOSynchronizationOffsets)
  - `present`: `bool` — [Read-Write] (bool)
  - `ptp`: `LiveLinkOpenTrackIO_PTP` — [Read-Write] (LiveLinkOpenTrackIO_PTP)
  - `source`: `str` — [Read-Write] Enum as string value can be âgenlockâ, âvideoInâ, âptpâ, â¦ (str)

### `unreal.LiveLinkOpenTrackIOSynchronizationOffsets`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOSynchronization Offsets

**Properties** (3):
  - `lens_encoders`: `float` — [Read-Write] (double)
  - `rotation`: `float` — [Read-Write] (double)
  - `translation`: `float` — [Read-Write] (double)

### `unreal.LiveLinkOpenTrackIOTimecode`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

SMPTE timecode of the sample. Timecode is a standard for labeling individual frames of data in media systems and is useful for inter-frame synchronization. Frame rate is a rational number, allowing dr...

**Properties** (7):
  - `frame_rate`: `LiveLinkOpenTrackIOFrameRate` — [Read-Write] (LiveLinkOpenTrackIOFrameRate)
  - `frames`: `int` — [Read-Write] (int32)
  - `hours`: `int` — [Read-Write] (int32)
  - `minutes`: `int` — [Read-Write] (int32)
  - `seconds`: `int` — [Read-Write] (int32)
  - `sub_frame`: `int` — [Read-Write] (int32)
  - `subframes_per_frame`: `int` — [Read-Write] Number of subframes per frame. 1 is the minimum (int32)

### `unreal.LiveLinkOpenTrackIOTimestamp`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Representation of a OpenTrackIO Timestamp.

**Properties** (2):
  - `nanoseconds`: `int` — [Read-Write] A 32-bit unsigned number for nanoseconds (int32)
  - `seconds`: `int` — [Read-Write] Although the schema specifies a 48 bit number. We allocate a full 64 bit integer here t...

### `unreal.LiveLinkOpenTrackIOTiming`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOTiming

**Properties** (7):
  - `mode`: `str` — [Read-Write] Enumerated value indicating whether the sample transport mechanism provides
inherent (â...
  - `recorded_timestamp`: `LiveLinkOpenTrackIOTimestamp` — [Read-Write] PTP timestamp of the data recording instant, provided for convenience during playback o...
  - `sample_rate`: `LiveLinkOpenTrackIOFrameRate` — [Read-Write] Sample frame rate as a rational number. Drop frame rates such as 29.97 should be
repres...
  - `sample_timestamp`: `LiveLinkOpenTrackIOTimestamp` — [Read-Write] PTP timestamp of the data recording instant, provided for convenience during playback o...
  - `sequence_number`: `int` — [Read-Write] Integer incrementing with each sample. (int32)
  - `synchronization`: `LiveLinkOpenTrackIOSynchronization` — [Read-Write] Synchronization object for the timing. (LiveLinkOpenTrackIOSynchronization)
  - `timecode`: `LiveLinkOpenTrackIOTimecode` — [Read-Write] SMTPE timecode of the sample. (LiveLinkOpenTrackIOTimecode)

### `unreal.LiveLinkOpenTrackIOTracker`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOTracker

**Properties** (4):
  - `notes`: `str` — [Read-Write] Non-blank string containing notes about tracking system (str)
  - `recording`: `bool` — [Read-Write] Boolean indicating whether tracking system is recording data. (bool)
  - `slate`: `str` — [Read-Write] Non-blank string describing the recording slate (str)
  - `status`: `str` — [Read-Write] Non-blank string describing status of tracking system (str)

### `unreal.LiveLinkOpenTrackIOTransform`
Inherits: `StructBase` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOTransform

**Properties** (4):
  - `id`: `str` — [Read-Write] OpenTrackIO identifier (can be empty) (str)
  - `rotation`: `LiveLinkOpenTrackIO_Rotator` — [Read-Write] Rotation part of a OpenTrackIO xform (LiveLinkOpenTrackIO_Rotator)
  - `scale`: `LiveLinkOpenTrackIO_XYZ` — [Read-Write] Scale part of a OpenTrackIO xform (LiveLinkOpenTrackIO_XYZ)
  - `translation`: `LiveLinkOpenTrackIO_XYZ` — [Read-Write] Translation part of a OpenTrackIO xform (LiveLinkOpenTrackIO_XYZ)

### `unreal.OpenTrackIO`
Inherits: `BlueprintFunctionLibrary` | Header: `LiveLinkOpenTrackIOTypes.h`

Live Link Open Track IOLibrary

**Methods** (1):
  - `get_version_string(protocol)` -> `str` [classmethod] — A string representing the protocol name plus version.

### `unreal.LiveLinkOpenTrackIONetworkProtocol`
Inherits: `EnumBase` | Header: `LiveLinkOpenTrackIOConnectionSettings.h`

Pick between Multicast or Unicast for this connection

**Properties** (2):
  - `MULTICAST`: `LiveLinkOpenTrackIONetworkProtocol = Ellipsis` — 0
  - `UNICAST`: `LiveLinkOpenTrackIONetworkProtocol = Ellipsis` — 1
