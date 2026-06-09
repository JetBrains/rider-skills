# UE Python API — MetaHumanCaptureSource Module

**13 types** from the `MetaHumanCaptureSource` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DeviceAddress`, `MetaHumanCapturePerTakeVoidResult`, `MetaHumanCaptureVoidResult`, `MetaHumanTake`, `MetaHumanTakeInfo`, `MetaHumanTakeView`, `MetaHumanCaptureSource`, `MetaHumanCaptureSourceFactoryNew`, `MetaHumanCaptureSourceSync`, `MetaHumanCaptureSourceSyncFactoryNew`, `MetaHumanCaptureDepthPrecisionType`, `MetaHumanCaptureDepthResolutionType`, `MetaHumanCaptureSourceType`

---

## Classes

### `unreal.DeviceAddress`
Inherits: `StructBase` | Header: `IpAddressDetailsCustomization.h`

Device Address

### `unreal.MetaHumanCapturePerTakeVoidResult`
Inherits: `StructBase` | Header: `MetaHumanCaptureSource.h`

MetaHuman Capture Per Take Void Result

### `unreal.MetaHumanCaptureVoidResult`
Inherits: `StructBase` | Header: `MetaHumanCaptureSource.h`

MetaHuman Capture Void Result

### `unreal.MetaHumanTake`
Inherits: `StructBase` | Header: `MetaHumanTakeData.h`

MetaHuman Take

**Properties** (8):
  - `audio`: `SoundWave` [Read-Only] — [Read-Only] (SoundWave)
  - `audio_timecode`: `Timecode` [Read-Only] — [Read-Only] (Timecode)
  - `audio_timecode_present`: `bool` [Read-Only] — [Read-Only] (bool)
  - `audio_timecode_rate`: `FrameRate` [Read-Only] — [Read-Only] (FrameRate)
  - `camera_calibration`: `CameraCalibration` [Read-Only] — [Read-Only] (CameraCalibration)
  - `capture_excluded_frames`: `None` [Read-Only] — [Read-Only] (Array[FrameRange])
  - `take_id`: `int` [Read-Only] — [Read-Only] (int32)
  - `views`: `None` [Read-Only] — [Read-Only] (Array[MetaHumanTakeView])

### `unreal.MetaHumanTakeInfo`
Inherits: `StructBase` | Header: `MetaHumanTakeData.h`

MetaHuman Take Info

**Properties** (15):
  - `date`: `DateTime` [Read-Only] — [Read-Only] (DateTime)
  - `depth_resolution`: `IntPoint` [Read-Only] — [Read-Only] (IntPoint)
  - `device_model`: `str` [Read-Only] — [Read-Only] (str)
  - `frame_rate`: `float` [Read-Only] — [Read-Only] (double)
  - `id`: `int` [Read-Only] — [Read-Only] (int32)
  - `issues`: `None` [Read-Only] — [Read-Only] (Array[Text])
  - `metadata`: `None` [Read-Only] — [Read-Only] Any data we want to have on a per-take basis (Map[str,str])
  - `name`: `str` [Read-Only] — [Read-Only] (str)
  - `num_frames`: `int` [Read-Only] — [Read-Only] (int32)
  - `num_streams`: `int` [Read-Only] — [Read-Only] (int32)
  - `output_directory`: `str` [Read-Only] — [Read-Only] (str)
  - `raw_thumbnail_data`: `None` [Read-Only] — [Read-Only] (Array[uint8])
  - `resolution`: `IntPoint` [Read-Only] — [Read-Only] (IntPoint)
  - `tags`: `None` [Read-Only] — [Read-Only] A list of tags that describe this take, if any (Set[str])
  - `take_number`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.MetaHumanTakeView`
Inherits: `StructBase` | Header: `MetaHumanTakeData.h`

MetaHuman Take View

**Properties** (8):
  - `depth`: `ImgMediaSource` [Read-Only] — [Read-Only] (ImgMediaSource)
  - `depth_timecode`: `Timecode` [Read-Only] — [Read-Only] (Timecode)
  - `depth_timecode_present`: `bool` [Read-Only] — [Read-Only] (bool)
  - `depth_timecode_rate`: `FrameRate` [Read-Only] — [Read-Only] (FrameRate)
  - `video`: `ImgMediaSource` [Read-Only] — [Read-Only] (ImgMediaSource)
  - `video_timecode`: `Timecode` [Read-Only] — [Read-Only] (Timecode)
  - `video_timecode_present`: `bool` [Read-Only] — [Read-Only] (bool)
  - `video_timecode_rate`: `FrameRate` [Read-Only] — [Read-Only] (FrameRate)

### `unreal.MetaHumanCaptureSource`
Inherits: `Object` | Header: `MetaHumanCaptureSource.h`

Capture Source Asset

**Properties** (2):
  - `device_address`: `str` — [Read-Write]
deprecated: This property has changed its type (str)
  - `export_listening_port`: `int` — [Read-Write]
deprecated: This property isnât used anymore as the port is being provided automatica...

### `unreal.MetaHumanCaptureSourceFactoryNew`
Inherits: `Factory` | Header: `MetaHumanCaptureSourceFactoryNew.h`

MetaHuman Capture Source Factory New

### `unreal.MetaHumanCaptureSourceSync`
Inherits: `Object` | Header: `MetaHumanCaptureSourceSync.h`

MetaHuman Capture Source Sync

**Methods** (14):
  - `can_cancel()` -> `bool` — Can Cancel
  - `can_ingest_takes()` -> `bool` — Can Ingest Takes
  - `can_startup()` -> `bool` — Can Startup
  - `cancel_processing(take_id_list)` -> `None` — Cancel Processing
  - `get_num_takes()` -> `int32` — Get Num Takes
  - `get_take_ids()` -> `Array [ int32 ]` — Get Take Ids
  - `get_take_info(take_id)` -> `MetaHumanTakeInfo or None` — Get Take Info
  - `get_takes(take_id_list)` -> `Array [ MetaHumanTake ]` — Get Takes
  - `is_cancelling()` -> `bool` — Is Cancelling
  - `is_processing()` -> `bool` — Is Processing
  - `refresh()` -> `Array [ MetaHumanTakeInfo ]` — Refresh
  - `set_target_path(target_ingest_directory, target_folder_asset_path)` -> `None` — Set Target Path
  - `shutdown()` -> `None` — Shutdown
  - `startup()` -> `None` — brief: Startup the MetaHuman|Footage Ingest API. Get information on the available takes based on the type of this Captur...

**Properties** (2):
  - `device_address`: `str` — [Read-Write]
deprecated: This property has changed its type (str)
  - `export_listening_port`: `int` — [Read-Write]
deprecated: This property isnât used anymore as the port is being provided automatica...

### `unreal.MetaHumanCaptureSourceSyncFactoryNew`
Inherits: `Factory` | Header: `MetaHumanCaptureSourceFactoryNew.h`

MetaHuman Capture Source Sync Factory New

### `unreal.MetaHumanCaptureDepthPrecisionType`
Inherits: `EnumBase` | Header: `MetaHumanCaptureSource.h`

EMeta Human Capture Depth Precision Type

**Properties** (2):
  - `EIGHTIETH`: `MetaHumanCaptureDepthPrecisionType = Ellipsis` — 0
  - `FULL`: `MetaHumanCaptureDepthPrecisionType = Ellipsis` — Fraction of a cm 1

### `unreal.MetaHumanCaptureDepthResolutionType`
Inherits: `EnumBase` | Header: `MetaHumanCaptureSource.h`

EMeta Human Capture Depth Resolution Type

**Properties** (3):
  - `FULL`: `MetaHumanCaptureDepthResolutionType = Ellipsis` — 0
  - `HALF`: `MetaHumanCaptureDepthResolutionType = Ellipsis` — 1
  - `QUARTER`: `MetaHumanCaptureDepthResolutionType = Ellipsis` — 2

### `unreal.MetaHumanCaptureSourceType`
Inherits: `EnumBase` | Header: `MetaHumanCaptureSource.h`

Capture Source Asset Type // TODO: This name will be changed to ECaptureSourceType at some point

**Properties** (4):
  - `HMC_ARCHIVES`: `MetaHumanCaptureSourceType = Ellipsis` — 3
  - `LIVE_LINK_FACE_ARCHIVES`: `MetaHumanCaptureSourceType = Ellipsis` — 2
  - `LIVE_LINK_FACE_CONNECTION`: `MetaHumanCaptureSourceType = Ellipsis` — 1
  - `UNDEFINED`: `MetaHumanCaptureSourceType = Ellipsis` — 0
