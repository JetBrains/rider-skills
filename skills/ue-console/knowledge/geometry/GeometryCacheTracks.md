# UE Python API — GeometryCacheTracks Module

**4 types** from the `GeometryCacheTracks` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MovieSceneGeometryCacheParams`, `MovieSceneGeometryCacheSectionTemplateParameters`, `MovieSceneGeometryCacheSection`, `MovieSceneGeometryCacheTrack`

---

## Classes

### `unreal.MovieSceneGeometryCacheParams`
Inherits: `StructBase` | Header: `MovieSceneGeometryCacheSection.h`

Movie Scene Geometry Cache Params

**Properties** (6):
  - `end_frame_offset`: `FrameNumber` — [Read-Write] The offset into the end of the animation clip (FrameNumber)
  - `first_loop_start_frame_offset`: `FrameNumber` — [Read-Write] The offset for the first loop of the animation clip (FrameNumber)
  - `geometry_cache_asset`: `GeometryCache` — [Read-Write] The animation this section plays (GeometryCache)
  - `play_rate`: `float` — [Read-Write] The playback rate of the animation clip (float)
  - `reverse`: `bool` — [Read-Write] Reverse the playback of the animation clip (bool)
  - `start_frame_offset`: `FrameNumber` — [Read-Write] The offset into the beginning of the animation clip (FrameNumber)

### `unreal.MovieSceneGeometryCacheSectionTemplateParameters`
Inherits: `MovieSceneGeometryCacheParams` | Header: `MovieSceneGeometryCacheTemplate.h`

Movie Scene Geometry Cache Section Template Parameters

### `unreal.MovieSceneGeometryCacheSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneGeometryCacheSection.h`

Movie scene section that control geometry cache playback

**Properties** (1):
  - `params`: `MovieSceneGeometryCacheParams` — [Read-Write] (MovieSceneGeometryCacheParams)

### `unreal.MovieSceneGeometryCacheTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneGeometryCacheTrack.h`

Movie Scene Geometry Cache Track
