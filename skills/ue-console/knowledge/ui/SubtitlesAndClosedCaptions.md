# UE Python API — SubtitlesAndClosedCaptions Module

**4 types** from the `SubtitlesAndClosedCaptions` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MovieSceneSubtitleSection`, `MovieSceneSubtitlesTrack`, `SubtitlesLibrary`, `SubtitleTextBlock`

---

## Classes

### `unreal.MovieSceneSubtitleSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneSubtitleSection.h`

Movie Scene Subtitle Section

### `unreal.MovieSceneSubtitlesTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneSubtitlesTrack.h`

Movie Scene Subtitles Track

### `unreal.SubtitlesLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SubtitlesBlueprintFunctionLibrary.h`

Subtitles Blueprint Function Library

**Methods** (4):
  - `is_subtitle_active(subtitle)` -> `bool` [classmethod] — Is Subtitle Active
  - `queue_subtitle(subtitle, timing = SubtitleTiming.INTERNALLY_TIMED)` -> `None` [classmethod] — Queue Subtitle
  - `stop_all_subtitles()` -> `None` [classmethod] — Stop All Subtitles
  - `stop_subtitle(subtitle)` -> `None` [classmethod] — Stop Subtitle

### `unreal.SubtitleTextBlock`
Inherits: `UserWidget` | Header: `SubtitleTextBlock.h`

Subtitle Text Block
