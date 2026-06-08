# UE Python API — MetaHumanPerformance Module

**19 types** from the `MetaHumanPerformance` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ContourDataComparisonHelper`, `MetaHumanPerformance`, `MetaHumanPerformanceControlRigComponent`, `MetaHumanPerformanceExportAnimationSettings`, `MetaHumanPerformanceExportLevelSequenceSettings`, `MetaHumanPerformanceExportUtils`, `MetaHumanPerformanceFactoryNew`, `MetaHumanPerformanceMovieSceneAudioSection`, `MetaHumanPerformanceMovieSceneAudioTrack`, `MetaHumanPerformanceMovieSceneMediaSection`, `MetaHumanPerformanceMovieSceneMediaTrack`, `MetaHumanPerformanceSequence`, `MetaHumanPerformanceViewportSettings`, `DataInputType`, `PerformanceExportRange`, `PerformanceHeadMovementMode`, `SolveType`, `StartPipelineErrorType`, `MetaHumanPerformance_OnProcessingFinishedDynamic`

---

## Classes

### `unreal.ContourDataComparisonHelper`
Inherits: `Object` | Header: `ContourDataComparisonHelper.h`

Contour Data Comparison Helper

**Methods** (1):
  - `compare_performance_contour_data(original, new)` -> `bool` [classmethod] — Compare Performance Contour Data

### `unreal.MetaHumanPerformance`
Inherits: `Object` | Header: `MetaHumanPerformance.h`

MetaHuman Performance Asset

**Methods** (11):
  - `can_export_animation()` -> `bool` — Can Export Animation
  - `can_process()` -> `bool` — Can Process
  - `cancel_pipeline()` -> `None` — Cancel Pipeline
  - `contains_animation_data()` -> `bool` — Returns true if there is at least one animation frame with valid data, false otherwise
  - `diagnostics_indicates_processing_issue()` -> `Text or None` — Diagnostics Indicates Processing Issue
  - `export_animation(export_range)` -> `None` — (DEPRECATED: use UMetaHumanPerformanceExportUtils::ExportAnimation instead) Export an animation sequence targeting the f...
  - `get_animation_data(start_frame_number = 0, end_frame_number = -1)` -> `Array [ FrameAnimationData ]` — Caller is responsible to ensure data will fit into 32bit TArray
  - `get_number_of_processed_frames()` -> `int32` — Get Number Of Processed Frames
  - `is_processing()` -> `bool` — Is Processing
  - `set_blocking_processing(blocking_processing)` -> `None` — Set Blocking Processing
  - `start_pipeline(is_scripted_processing = True)` -> `StartPipelineErrorType` — Export options

**Properties** (2):
  - `on_processing_finished_dynamic`: `OnProcessingFinishedDynamic` — [Read-Write] Dynamic delegate called when the pipeline finishes running (OnProcessingFinishedDynamic...
  - `skip_diagnostics`: `bool` — [Read-Write] Flag indicating whether processing diagnostics should be calculated during processing (...

### `unreal.MetaHumanPerformanceControlRigComponent`
Inherits: `PrimitiveComponent` | Header: `MetaHumanPerformanceControlRigComponent.h`

Component capable of rendering ControlRigShape actors. It uses the same mechanism as a ChildActorComponent where upon being registered will spawn all control rig shape actors in the world

### `unreal.MetaHumanPerformanceExportAnimationSettings`
Inherits: `Object` | Header: `MetaHumanPerformanceExportUtils.h`

UMetaHumanPerformanceExportAnimationSettings

**Methods** (2):
  - `get_target_skeleton()` -> `Skeleton` — Returns the target Skeleton derived from TargetSkeletonOrSkeletalMesh
  - `is_target_skeleton_compatible(curves)` -> `Array[str] or None` — Checks if the Target Skeleton set in TargetSkeletonOrSkeletalMesh may have compatibility issues. The compatibility test ...

**Properties** (8):
  - `asset_name`: `str` — [Read-Write] The name of the level sequence. If bShowExportDialog is true the user will be able to s...
  - `auto_save_anim_sequence`: `bool` — [Read-Write] Whether or not to auto save the generated animation sequence, default to true (bool)
  - `curve_interpolation`: `RichCurveInterpMode` — [Read-Write] This defines how values between keys are calculated for curves (RichCurveInterpMode)
  - `enable_head_movement`: `bool` — [Read-Write] Whether or not to enable the Head Movement in the exported Animation Sequence, default ...
  - `export_range`: `PerformanceExportRange` — [Read-Write] The export range that will be used to generate the animation sequence, defaults to EPer...
  - `package_path`: `str` — [Read-Write] The package path where the animation sequence will be placed, if bShowExportDialog is t...
  - `show_export_dialog`: `bool` — [Read-Write] Whether or not to show the export dialog allowing the user to select where to place the...
  - `target_skeleton_or_skeletal_mesh`: `Object` — [Read-Write] The Skeleton or Skeletal Mesh to be used when recording the Animation Sequence (Object)

### `unreal.MetaHumanPerformanceExportLevelSequenceSettings`
Inherits: `Object` | Header: `MetaHumanPerformanceExportUtils.h`

UMetaHumanPerformanceExportLevelSequenceSettings

**Properties** (19):
  - `apply_lens_distortion`: `bool` — [Read-Write] Whether or not camera lens distortion should be applied to exported camera (bool)
  - `asset_name`: `str` — [Read-Write] The name of the level sequence. If bShowExportDialog is true the user will be able to s...
  - `curve_interpolation`: `RichCurveInterpMode` — [Read-Write] This defines how values between keys are calculated for curves (RichCurveInterpMode)
  - `enable_control_rig_head_movement`: `bool` — [Read-Write] Whether or not to enable Head Movement using Control Rig. (bool)
  - `enable_meta_human_head_movement`: `bool` — [Read-Write] Whether or not to enable the head movement switch in the Target MetaHuman (bool)
  - `export_audio_track`: `bool` — [Read-Write] Whether or not to export the audio track, default to true (bool)
  - `export_camera`: `bool` — [Read-Write] Whether or not to export a camera that matches the one used in the Performance. Default...
  - `export_control_rig_track`: `bool` — [Read-Write] Whether or not to export the Control Rig track with baked data. Default to true (bool)
  - `export_depth_mesh`: `bool` — [Read-Write] Whether or not to export the depth mesh. Ignored if bExportDepthTrack is false. Default...
  - `export_depth_track`: `bool` — [Read-Write] Whether or not to export the depth track, default to false (bool)
  - `export_identity`: `bool` — [Read-Write] Whether or not export the Identity mesh. Default to true (bool)
  - `export_image_plane`: `bool` — [Read-Write] Whether or not to export the image plane. Ignored if bExportVideoTrack is false. Defaul...
  - `export_range`: `PerformanceExportRange` — [Read-Write] The export range that will be used to generate the Level Sequence, defaults to EPerform...
  - `export_transform_track`: `bool` — [Read-Write] Whether or not to bake the animation data into the rigid transform track for the Identi...
  - `export_video_track`: `bool` — [Read-Write] Whether or not to export the video track. Default to true (bool)
  - `keep_frame_range`: `bool` — [Read-Write] Whether or not to keep the frame range defined by the Processing Range. Disabling this ...
  - `package_path`: `str` — [Read-Write] The package path where the level sequence will be placed. If bShowExportDialog is true ...
  - `show_export_dialog`: `bool` — [Read-Write] Whether or not to display to display a dialog to the user where the export options and ...
  - `target_meta_human_class`: `Blueprint` — [Read-Write] Optional MetaHuman created as a spawnable in the exported Level Sequence (Blueprint)

### `unreal.MetaHumanPerformanceExportUtils`
Inherits: `Object` | Header: `MetaHumanPerformanceExportUtils.h`

Utility functions to export data from a Performance

**Methods** (4):
  - `export_animation_sequence(performance, export_settings = None)` -> `AnimSequence` [classmethod] — Exports an animation sequence from a Performance using the given settings
  - `export_level_sequence(performance, export_settings = None)` -> `LevelSequence` [classmethod] — Exports a Level Sequence from a Performance using the given settings object
  - `get_export_animation_sequence_settings(performance)` -> `MetaHumanPerformanceExportAnimationSettings` [classmethod] — Returns a UMetaHumanPerformanceExportAnimationSettings configured based on the given Performance
  - `get_export_level_sequence_settings(performance)` -> `MetaHumanPerformanceExportLevelSequenceSettings` [classmethod] — Returns a UMetaHumanPerformanceExportLevelSequenceSettings configured based on the given Performance

### `unreal.MetaHumanPerformanceFactoryNew`
Inherits: `Factory` | Header: `MetaHumanPerformanceFactoryNew.h`

UMetaHumanPerformanceFactoryNew

### `unreal.MetaHumanPerformanceMovieSceneAudioSection`
Inherits: `MovieSceneAudioSection` | Header: `MetaHumanPerformanceMovieSceneAudioSection.h`

Implements a MovieSceneAudioSection that holds a reference to a PerformanceShot asset allowing customization of how to display it in Sequencer

### `unreal.MetaHumanPerformanceMovieSceneAudioTrack`
Inherits: `MovieSceneAudioTrack` | Header: `MetaHumanPerformanceMovieSceneAudioTrack.h`

Implements a UMovieSceneAudioTrack customized for the MetaHumanPerformance plugin

### `unreal.MetaHumanPerformanceMovieSceneMediaSection`
Inherits: `MetaHumanMovieSceneMediaSection` | Header: `MetaHumanPerformanceMovieSceneMediaSection.h`

Implements a MovieSceneMediaSection that holds a reference to a PerformanceShot asset allowing customization of how to display it in Sequencer

### `unreal.MetaHumanPerformanceMovieSceneMediaTrack`
Inherits: `MetaHumanMovieSceneMediaTrack` | Header: `MetaHumanPerformanceMovieSceneMediaTrack.h`

Implements a MovieSceneMediaTrack customized for the MetaHumanPerformance plugin

### `unreal.MetaHumanPerformanceSequence`
Inherits: `MovieSceneSequence` | Header: `MetaHumanPerformanceSequence.h`

Movie scene used by the MetaHumanPerformance system

### `unreal.MetaHumanPerformanceViewportSettings`
Inherits: `MetaHumanViewportSettings` | Header: `MetaHumanPerformanceViewportSettings.h`

MetaHuman Performance Viewport Settings

**Methods** (2):
  - `is_control_rig_visible(view)` -> `bool` — Is Control Rig Visible
  - `toggle_control_rig_visibility(view)` -> `None` — Toggle Control Rig Visibility

### `unreal.DataInputType`
Inherits: `EnumBase` | Header: `MetaHumanPerformance.h`

EData Input Type

**Properties** (3):
  - `AUDIO`: `DataInputType = Ellipsis` — Process audio into animation 1
  - `DEPTH_FOOTAGE`: `DataInputType = Ellipsis` — Process depth enabled footage and an identity into animation 0
  - `MONO_FOOTAGE`: `DataInputType = Ellipsis` — Process single view footage into animation 2

### `unreal.PerformanceExportRange`
Inherits: `EnumBase` | Header: `MetaHumanPerformanceExportUtils.h`

EPerformance Export Range

**Properties** (2):
  - `PROCESSING_RANGE`: `PerformanceExportRange = Ellipsis` — 0
  - `WHOLE_SEQUENCE`: `PerformanceExportRange = Ellipsis` — 1

### `unreal.PerformanceHeadMovementMode`
Inherits: `EnumBase` | Header: `MetaHumanPerformance.h`

EPerformance Head Movement Mode

**Properties** (3):
  - `CONTROL_RIG`: `PerformanceHeadMovementMode = Ellipsis` — Enables the Head Control Switch in the Control Rig to use control rig for the Head Movement 1
  - `DISABLED`: `PerformanceHeadMovementMode = Ellipsis` — No head movement 2
  - `TRANSFORM_TRACK`: `PerformanceHeadMovementMode = Ellipsis` — Use a transform track to move the Skeletal Mesh based on its pivot point (root bone) 0

### `unreal.SolveType`
Inherits: `EnumBase` | Header: `MetaHumanPerformance.h`

ESolve Type

**Properties** (3):
  - `ADDITIONAL_TWEAKERS`: `SolveType = Ellipsis` — 2
  - `PREVIEW`: `SolveType = Ellipsis` — 0
  - `STANDARD`: `SolveType = Ellipsis` — 1

### `unreal.StartPipelineErrorType`
Inherits: `EnumBase` | Header: `MetaHumanPerformance.h`

EStart Pipeline Error Type

**Properties** (3):
  - `DISABLED`: `StartPipelineErrorType = Ellipsis` — 2
  - `NONE`: `StartPipelineErrorType = Ellipsis` — 0
  - `NO_FRAMES`: `StartPipelineErrorType = Ellipsis` — 1

### `unreal.MetaHumanPerformance_OnProcessingFinishedDynamic`
Inherits: `MulticastDelegateBase` | Header: `MetaHumanPerformance.h`

On Processing Finished Dynamic Delegate Signature
