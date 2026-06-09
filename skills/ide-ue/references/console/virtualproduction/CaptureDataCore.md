# UE Python API — CaptureDataCore Module

**11 types** from the `CaptureDataCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ExtendedLensFile`, `FootageCaptureMetadata`, `FootageCaptureView`, `FrameRange`, `StereoPair`, `CameraCalibration`, `CaptureData`, `FootageCaptureData`, `MeshCaptureData`, `FootageDeviceClass`, `TimecodeAlignment`

---

## Classes

### `unreal.ExtendedLensFile`
Inherits: `StructBase` | Header: `CameraCalibration.h`

Extended Lens File

### `unreal.FootageCaptureMetadata`
Inherits: `StructBase` | Header: `CaptureData.h`

Footage Capture Metadata

**Properties** (6):
  - `device_class`: `FootageDeviceClass` — [Read-Write] (FootageDeviceClass)
  - `device_model`: `FootageDeviceClass` — [Read-Write]
deprecated: Property has been renamed to Device Class (FootageDeviceClass)
  - `device_model_name`: `str` — [Read-Write] (str)
  - `frame_rate`: `float` — [Read-Write] (double)
  - `height`: `int` — [Read-Write]
deprecated: Redundant property (int32)
  - `width`: `int` — [Read-Write]
deprecated: Redundant property (int32)

### `unreal.FootageCaptureView`
Inherits: `StructBase` | Header: `CaptureData.h`

Footage Capture View

**Properties** (8):
  - `depth_sequence`: `ImgMediaSource` — [Read-Write] (ImgMediaSource)
  - `depth_timecode`: `Timecode` — [Read-Write] (Timecode)
  - `depth_timecode_present`: `bool` — [Read-Write] (bool)
  - `depth_timecode_rate`: `FrameRate` — [Read-Write] (FrameRate)
  - `image_sequence`: `ImgMediaSource` — [Read-Write] (ImgMediaSource)
  - `image_timecode`: `Timecode` — [Read-Write] (Timecode)
  - `image_timecode_present`: `bool` — [Read-Write] (bool)
  - `image_timecode_rate`: `FrameRate` — [Read-Write] (FrameRate)

### `unreal.FrameRange`
Inherits: `StructBase` | Header: `FrameRange.h`

Frame Range

### `unreal.StereoPair`
Inherits: `StructBase` | Header: `CameraCalibration.h`

Stereo Pair

### `unreal.CameraCalibration`
Inherits: `Object` | Header: `CameraCalibration.h`

Camera Calibration Asset

### `unreal.CaptureData`
Inherits: `Object` | Header: `CaptureData.h`

Capture Data

### `unreal.FootageCaptureData`
Inherits: `CaptureData` | Header: `CaptureData.h`

Capture Data (Footage) Asset

**Properties** (13):
  - `audio`: `SoundWave` — [Read-Write]
deprecated: Audio is deprecated. Please use AudioTracks instead. (SoundWave)
  - `audio_timecode`: `Timecode` — [Read-Write]
deprecated: AudioTimecode is deprecated. (Timecode)
  - `audio_timecode_present`: `bool` — [Read-Write]
deprecated: AudioTimecodePresent is deprecated. (bool)
  - `audio_timecode_rate`: `FrameRate` — [Read-Write]
deprecated: AudioTimecodeRate is deprecated. (FrameRate)
  - `audio_tracks`: `None` — [Read-Write] (Array[SoundWave])
  - `audios`: `None` — [Read-Write]
deprecated: Audios is deprecated. Please use AudioTracks instead. (Array[SoundWave])
  - `camera_calibration`: `CameraCalibration` — [Read-Write]
deprecated: CameraCalibration is deprecated. Please use CameraCalibrations instead. (Ca...
  - `camera_calibrations`: `None` — [Read-Write] (Array[CameraCalibration])
  - `capture_excluded_frames`: `None` — [Read-Write] (Array[FrameRange])
  - `depth_sequences`: `None` — [Read-Write] (Array[ImgMediaSource])
  - `image_sequences`: `None` — [Read-Write] (Array[ImgMediaSource])
  - `metadata`: `FootageCaptureMetadata` — [Read-Write] (FootageCaptureMetadata)
  - `views`: `None` — [Read-Write]
deprecated: Views are deprecated. Please use Image and Depth sequences instead. (Array[...

### `unreal.MeshCaptureData`
Inherits: `CaptureData` | Header: `CaptureData.h`

Capture Data (Mesh) Asset

### `unreal.FootageDeviceClass`
Inherits: `EnumBase` | Header: `CaptureData.h`

UFootageCaptureData

**Properties** (7):
  - `I_PHONE11_OR_EARLIER`: `FootageDeviceClass = Ellipsis` — 1
  - `I_PHONE12`: `FootageDeviceClass = Ellipsis` — 2
  - `I_PHONE13`: `FootageDeviceClass = Ellipsis` — 3
  - `I_PHONE14_OR_LATER`: `FootageDeviceClass = Ellipsis` — 4
  - `OTHERI_OS_DEVICE`: `FootageDeviceClass = Ellipsis` — 5
  - `STEREO_HMC`: `FootageDeviceClass = Ellipsis` — 6
  - `UNSPECIFIED`: `FootageDeviceClass = Ellipsis` — 0

### `unreal.TimecodeAlignment`
Inherits: `EnumBase` | Header: `CaptureData.h`

ETimecode Alignment

**Properties** (3):
  - `ABSOLUTE`: `TimecodeAlignment = Ellipsis` — 1
  - `NONE`: `TimecodeAlignment = Ellipsis` — 0
  - `RELATIVE`: `TimecodeAlignment = Ellipsis` — 2
