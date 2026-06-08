# UE Python API — TakeTrackRecorders Module

**13 types** from the `TakeTrackRecorders` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TakeRecorderPropertyTrackSettings`, `TakeRecorderTrackSettings`, `MovieScene3DAttachTrackRecorder`, `MovieScene3DTransformTrackRecorder`, `MovieSceneAnimationTrackRecorder`, `MovieSceneAnimationTrackRecorderEditorSettings`, `MovieSceneAnimationTrackRecorderSettings`, `MovieSceneParticleTrackRecorder`, `MovieScenePropertyTrackRecorder`, `MovieSceneSpawnTrackRecorder`, `MovieSceneTrackRecorder`, `MovieSceneTrackRecorderSettings`, `MovieSceneVisibilityTrackRecorder`

---

## Classes

### `unreal.TakeRecorderPropertyTrackSettings`
Inherits: `StructBase` | Header: `IMovieSceneTrackRecorderHost.h`

Take Recorder Property Track Settings

### `unreal.TakeRecorderTrackSettings`
Inherits: `StructBase` | Header: `IMovieSceneTrackRecorderHost.h`

Take Recorder Track Settings

### `unreal.MovieScene3DAttachTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieScene3DAttachTrackRecorder.h`

Movie Scene 3DAttach Track Recorder

### `unreal.MovieScene3DTransformTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieScene3DTransformTrackRecorder.h`

namespace UE::TrackRecorders

### `unreal.MovieSceneAnimationTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieSceneAnimationTrackRecorder.h`

Movie Scene Animation Track Recorder

### `unreal.MovieSceneAnimationTrackRecorderEditorSettings`
Inherits: `MovieSceneTrackRecorderSettings` | Header: `MovieSceneAnimationTrackRecorderSettings.h`

Movie Scene Animation Track Recorder Editor Settings

**Properties** (5):
  - `animation_asset_name`: `str` — [Read-Write] The name of the animation asset.
Supports any of the following format specifiers that w...
  - `animation_sub_directory`: `str` — [Read-Write] The name of the subdirectory animations will be placed in. Leave this empty to place in...
  - `animation_track_name`: `Text` — [Read-Write] Name of the recorded animation track. (Text)
  - `remove_root_animation`: `bool` — [Read-Write] If true we remove the root animation and move it to a transform track, if false we leav...
  - `timecode_bone_method`: `TimecodeBoneMethod` — [Read-Write] The method to record timecode values onto bones (TimecodeBoneMethod)

### `unreal.MovieSceneAnimationTrackRecorderSettings`
Inherits: `MovieSceneAnimationTrackRecorderEditorSettings` | Header: `MovieSceneAnimationTrackRecorderSettings.h`

Movie Scene Animation Track Recorder Settings

### `unreal.MovieSceneParticleTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieSceneParticleTrackRecorder.h`

Movie Scene Particle Track Recorder

### `unreal.MovieScenePropertyTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieScenePropertyTrackRecorder.h`

Movie Scene Property Track Recorder

### `unreal.MovieSceneSpawnTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieSceneSpawnTrackRecorder.h`

Movie Scene Spawn Track Recorder

### `unreal.MovieSceneTrackRecorder`
Inherits: `Object` | Header: `MovieSceneTrackRecorder.h`

Movie Scene Track Recorder

### `unreal.MovieSceneTrackRecorderSettings`
Inherits: `Object` | Header: `MovieSceneTrackRecorderSettings.h`

Movie Scene Track Recorder Settings

### `unreal.MovieSceneVisibilityTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieSceneVisibilityTrackRecorder.h`

Movie Scene Visibility Track Recorder
