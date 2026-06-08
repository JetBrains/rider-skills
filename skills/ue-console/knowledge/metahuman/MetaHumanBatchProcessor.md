# UE Python API — MetaHumanBatchProcessor Module

**9 types** from the `MetaHumanBatchProcessor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ExportAnimSequenceSettings`, `ExportLevelSequenceSettings`, `MetaHumanSpeechProcessingSettings`, `MetaHumanExportAnimSequenceSettings`, `MetaHumanExportLevelSequenceSettings`, `MetaHumanSpeechToAnimSequenceProcessingSettings`, `MetaHumanSpeechToLevelSequenceSettings`, `MetaHumanSpeechToPerformance`, `BatchOperationStepsFlags`

---

## Classes

### `unreal.ExportAnimSequenceSettings`
Inherits: `StructBase` | Header: `MetaHumanSpeechProcessingSettings.h`

Export Anim Sequence Settings

**Properties** (3):
  - `curve_interpolation`: `RichCurveInterpMode` — [Read-Write] This defines how values between keys are calculated for curves (RichCurveInterpMode)
  - `overwrite_assets`: `bool` — [Read-Write] Option to override existing output assets. Otherwise, a unique asset name is generated ...
  - `target_skeleton_or_skeletal_mesh`: `Object` — [Read-Write] The Skeleton or Skeletal Mesh to be used when recording the Animation Sequence (Object)

### `unreal.ExportLevelSequenceSettings`
Inherits: `StructBase` | Header: `MetaHumanSpeechProcessingSettings.h`

Export Level Sequence Settings

**Properties** (5):
  - `curve_interpolation`: `RichCurveInterpMode` — [Read-Write] This defines how values between keys are calculated for curves (RichCurveInterpMode)
  - `export_audio_track`: `bool` — [Read-Write] Option to export the audio track in the level sequence (bool)
  - `export_camera`: `bool` — [Read-Write] Option to export the camera track in the level sequence (bool)
  - `overwrite_assets`: `bool` — [Read-Write] Option to override existing output assets. Otherwise, a unique asset name is generated ...
  - `target_meta_human_class`: `Blueprint` — [Read-Write] Target actor to be spawned in the exported level sequence (Blueprint)

### `unreal.MetaHumanSpeechProcessingSettings`
Inherits: `StructBase` | Header: `MetaHumanSpeechProcessingSettings.h`

MetaHuman Speech Processing Settings

**Properties** (5):
  - `audio_channel_index`: `int` — [Read-Write] Audio channel used for processing (int32)
  - `enable_head_movement`: `bool` — [Read-Write] (bool)
  - `generate_blinks`: `bool` — [Read-Write] Option to generate blinks (bool)
  - `mix_audio_channels`: `bool` — [Read-Write] Option to down mix audio channels into single channel before processing (bool)
  - `solve_overrides`: `AudioDrivenAnimationSolveOverrides` — [Read-Write] Overrides for the solve. (AudioDrivenAnimationSolveOverrides)

### `unreal.MetaHumanExportAnimSequenceSettings`
Inherits: `Object` | Header: `MetaHumanSpeechProcessingSettings.h`

MetaHuman Export Anim Sequence Settings

**Properties** (1):
  - `export_settings`: `ExportAnimSequenceSettings` — [Read-Write] (ExportAnimSequenceSettings)

### `unreal.MetaHumanExportLevelSequenceSettings`
Inherits: `Object` | Header: `MetaHumanSpeechProcessingSettings.h`

MetaHuman Export Level Sequence Settings

**Properties** (1):
  - `export_settings`: `ExportLevelSequenceSettings` — [Read-Write] (ExportLevelSequenceSettings)

### `unreal.MetaHumanSpeechToAnimSequenceProcessingSettings`
Inherits: `Object` | Header: `MetaHumanSpeechProcessingSettings.h`

MetaHuman Speech to Anim Sequence Processing Settings

**Properties** (2):
  - `export_settings`: `ExportAnimSequenceSettings` — [Read-Write] (ExportAnimSequenceSettings)
  - `processing_settings`: `MetaHumanSpeechProcessingSettings` — [Read-Write] (MetaHumanSpeechProcessingSettings)

### `unreal.MetaHumanSpeechToLevelSequenceSettings`
Inherits: `Object` | Header: `MetaHumanSpeechProcessingSettings.h`

MetaHuman Speech to Level Sequence Settings

**Properties** (2):
  - `export_settings`: `ExportLevelSequenceSettings` — [Read-Write] (ExportLevelSequenceSettings)
  - `processing_settings`: `MetaHumanSpeechProcessingSettings` — [Read-Write] (MetaHumanSpeechProcessingSettings)

### `unreal.MetaHumanSpeechToPerformance`
Inherits: `Object` | Header: `MetaHumanSpeechProcessingSettings.h`

MetaHuman Speech to Performance

**Properties** (3):
  - `overwrite_assets`: `bool` — [Read-Write] Option to override existing output assets. Otherwise, a unique asset name is generated ...
  - `processing_settings`: `MetaHumanSpeechProcessingSettings` — [Read-Write] (MetaHumanSpeechProcessingSettings)
  - `visualization_mesh`: `Object` — [Read-Write] The visualization mesh to be set in the MetaHuman performances (Object)

### `unreal.BatchOperationStepsFlags`
Inherits: `EnumBase` | Header: `MetaHumanBatchOperation.h`

EBatch Operation Steps Flags

**Properties** (5):
  - `EXPORT_ANIM_SEQUENCE`: `BatchOperationStepsFlags = Ellipsis` — Process the MetaHuman performance 4
  - `EXPORT_LEVEL_SEQUENCE`: `BatchOperationStepsFlags = Ellipsis` — Export Anim Sequence from processed performance. 8
  - `NONE`: `BatchOperationStepsFlags = Ellipsis` — 0
  - `PROCESS_PERFORMANCE`: `BatchOperationStepsFlags = Ellipsis` — Create a MetaHuman performance from sound wave asset and set up ready for processing 2
  - `SOUND_WAVE_TO_PERFORMANCE`: `BatchOperationStepsFlags = Ellipsis` — 1
