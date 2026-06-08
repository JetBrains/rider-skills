# UE Python API — MovieSceneTools Module

**11 types** from the `MovieSceneTools` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BakingAnimationKeySettings`, `ControlFindReplaceString`, `ControlToTransformMappings`, `AutomatedLevelSequenceCapture`, `MovieSceneUserExportFBXControlRigSettings`, `MovieSceneUserImportFBXControlRigSettings`, `MovieSceneUserImportFBXSettings`, `SequencerExportTask`, `BakingKeySettings`, `FControlRigChannelEnum`, `FTransformChannelEnum`

---

## Classes

### `unreal.BakingAnimationKeySettings`
Inherits: `StructBase` | Header: `BakingAnimationKeySettings.h`

Baking Animation Key Settings

**Properties** (6):
  - `baking_key_settings`: `BakingKeySettings` — [Read-Write] (BakingKeySettings)
  - `end_frame`: `FrameNumber` — [Read-Write] (FrameNumber)
  - `frame_increment`: `int` — [Read-Write] (int32)
  - `reduce_keys`: `bool` — [Read-Write] (bool)
  - `start_frame`: `FrameNumber` — [Read-Write] (FrameNumber)
  - `tolerance`: `float` — [Read-Write] (float)

### `unreal.ControlFindReplaceString`
Inherits: `StructBase` | Header: `MovieSceneToolsUserSettings.h`

Control Find Replace String

### `unreal.ControlToTransformMappings`
Inherits: `StructBase` | Header: `MovieSceneToolsUserSettings.h`

Control to Transform Mappings

### `unreal.AutomatedLevelSequenceCapture`
Inherits: `MovieSceneCapture` | Header: `AutomatedLevelSequenceCapture.h`

Automated Level Sequence Capture

**Properties** (13):
  - `burn_in_options`: `LevelSequenceBurnInOptions` — [Read-Write] (LevelSequenceBurnInOptions)
  - `custom_end_frame`: `FrameNumber` — [Read-Write] Frame number to end capturing. (FrameNumber)
  - `custom_start_frame`: `FrameNumber` — [Read-Write] Frame number to start capturing. (FrameNumber)
  - `delay_before_shot_warm_up`: `float` — [Read-Write] The number of seconds to wait (in real-time) at shot boundaries.  Useful for allowing p...
  - `delay_before_warm_up`: `float` — [Read-Write] The number of seconds to wait (in real-time) before we start playing back the warm up f...
  - `delay_every_frame`: `float` — [Read-Write] The number of seconds to wait (in real-time) at every frame.  Useful for allowing post ...
  - `level_sequence_asset`: `SoftObjectPath` — [Read-Write] A level sequence asset to playback at runtime - used where the level sequence does not ...
  - `shot_name`: `str` — [Read-Write] Optional shot name to render. The frame range to render will be set to the shot frame r...
  - `use_custom_end_frame`: `bool` — [Read-Write] When enabled, the EndFrame setting will override the default ending frame number (bool)
  - `use_custom_start_frame`: `bool` — [Read-Write] When enabled, the StartFrame setting will override the default starting frame number (b...
  - `warm_up_frame_count`: `int` — [Read-Write] The number of extra frames to play before the sequenceâs start frame, to âwarm upâ...
  - `write_edit_decision_list`: `bool` — [Read-Write] Whether to write edit decision lists (EDLs) if the sequence contains shots (bool)
  - `write_final_cut_pro_xml`: `bool` — [Read-Write] Whether to write Final Cut Pro XML files (XMLs) if the sequence contains shots (bool)

### `unreal.MovieSceneUserExportFBXControlRigSettings`
Inherits: `Object` | Header: `MovieSceneToolsUserSettings.h`

Movie Scene User Export FBXControl Rig Settings

**Methods** (1):
  - `load_control_mappings_from_preset(meta_human_preset)` -> `None` — Load the default or metahuman preset into the current mappings

**Properties** (3):
  - `ascii`: `bool` — [Read-Write] If enabled, save as ascii instead of binary (bool)
  - `export_local_time`: `bool` — [Read-Write] If enabled, export sequencer animation in its local time, relative to its sequence. (bo...
  - `fbx_export_compatibility`: `FbxExportCompatibility` — [Read-Write] This will set the fbx sdk compatibility when exporting to fbx file. The default value i...

### `unreal.MovieSceneUserImportFBXControlRigSettings`
Inherits: `Object` | Header: `MovieSceneToolsUserSettings.h`

Movie Scene User Import FBXControl Rig Settings

**Methods** (1):
  - `load_control_mappings_from_preset(meta_human_preset)` -> `None` — Load the default or metahuman preset into the current mappings

### `unreal.MovieSceneUserImportFBXSettings`
Inherits: `Object` | Header: `MovieSceneToolsUserSettings.h`

Movie Scene User Import FBXSettings

### `unreal.SequencerExportTask`
Inherits: `AssetExportTask` | Header: `SequencerExportTask.h`

Contains data for a group of assets to import

**Properties** (1):
  - `sequencer_context`: `Object` — [Read-Write] A UWorld for LevelSequences, UUserWidget for WidgetAnimations, or AActor for Actor Sequ...

### `unreal.BakingKeySettings`
Inherits: `EnumBase` | Header: `BakingAnimationKeySettings.h`

EBaking Key Settings

**Properties** (2):
  - `ALL_FRAMES`: `BakingKeySettings = Ellipsis` — 1
  - `KEYS_ONLY`: `BakingKeySettings = Ellipsis` — 0

### `unreal.FControlRigChannelEnum`
Inherits: `EnumBase` | Header: `MovieSceneToolsUserSettings.h`

Enumeration specifying the control type and channel

**Properties** (15):
  - `BOOL`: `FControlRigChannelEnum = Ellipsis` — Bool 0
  - `ENUM`: `FControlRigChannelEnum = Ellipsis` — Enum 1
  - `FLOAT`: `FControlRigChannelEnum = Ellipsis` — Float 3
  - `INTEGER`: `FControlRigChannelEnum = Ellipsis` — Integer 2
  - `POSITION_X`: `FControlRigChannelEnum = Ellipsis` — Position.X 6
  - `POSITION_Y`: `FControlRigChannelEnum = Ellipsis` — Position.Y 7
  - `POSITION_Z`: `FControlRigChannelEnum = Ellipsis` — Position.Z 8
  - `ROTATOR_X`: `FControlRigChannelEnum = Ellipsis` — Rotator.X 9
  - `ROTATOR_Y`: `FControlRigChannelEnum = Ellipsis` — Rotator.Y 10
  - `ROTATOR_Z`: `FControlRigChannelEnum = Ellipsis` — Rotator.Z 11
  - `SCALE_X`: `FControlRigChannelEnum = Ellipsis` — Scale.X 12
  - `SCALE_Y`: `FControlRigChannelEnum = Ellipsis` — Scale.Y 13
  - `SCALE_Z`: `FControlRigChannelEnum = Ellipsis` — Scale.Z 14
  - `VECTOR2DX`: `FControlRigChannelEnum = Ellipsis` — Vector2D.X 4
  - `VECTOR2DY`: `FControlRigChannelEnum = Ellipsis` — Vector2D.Y 5

### `unreal.FTransformChannelEnum`
Inherits: `EnumBase` | Header: `MovieSceneToolsUserSettings.h`

Enumeration specifying the transfrom channel

**Properties** (9):
  - `ROTATE_X`: `FTransformChannelEnum = Ellipsis` — 3
  - `ROTATE_Y`: `FTransformChannelEnum = Ellipsis` — 4
  - `ROTATE_Z`: `FTransformChannelEnum = Ellipsis` — 5
  - `SCALE_X`: `FTransformChannelEnum = Ellipsis` — 6
  - `SCALE_Y`: `FTransformChannelEnum = Ellipsis` — 7
  - `SCALE_Z`: `FTransformChannelEnum = Ellipsis` — 8
  - `TRANSLATE_X`: `FTransformChannelEnum = Ellipsis` — 0
  - `TRANSLATE_Y`: `FTransformChannelEnum = Ellipsis` — 1
  - `TRANSLATE_Z`: `FTransformChannelEnum = Ellipsis` — 2
