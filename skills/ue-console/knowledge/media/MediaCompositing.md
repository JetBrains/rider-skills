# UE Python API — MediaCompositing Module

**4 types** from the `MediaCompositing` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MovieSceneMediaPlayerPropertySection`, `MovieSceneMediaPlayerPropertyTrack`, `MovieSceneMediaSection`, `MovieSceneMediaTrack`

---

## Classes

### `unreal.MovieSceneMediaPlayerPropertySection`
Inherits: `MovieSceneSection` | Header: `MovieSceneMediaPlayerPropertySection.h`

Implements a movie scene section for media playback on a UMediaPlayer.

**Properties** (2):
  - `loop`: `bool` — [Read-Write] Whether to loop this video. (bool)
  - `media_source`: `MediaSource` — [Read-Write] The source to play with this video track. (MediaSource)

### `unreal.MovieSceneMediaPlayerPropertyTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneMediaPlayerPropertyTrack.h`

Movie Scene Media Player Property Track

### `unreal.MovieSceneMediaSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneMediaSection.h`

Implements a movie scene section for media playback.

**Properties** (10):
  - `cache_settings`: `MediaSourceCacheSettings` — [Read-Write] Override the default cache settings. Not used if we have a player proxy as the settings...
  - `external_media_player`: `MediaPlayer` — [Read-Write] The external media player this track should control. (MediaPlayer)
  - `looping`: `bool` — [Read-Write] Should the media player be set to loop? This can be helpful for media formats that can ...
  - `media_sound_component`: `MediaSoundComponent` — [Read-Write] The media sound component that receives the trackâs audio output. (MediaSoundComponen...
  - `media_source`: `MediaSource` — [Read-Write] The source to play with this video track if MediaSourceProxy is not available. (MediaSo...
  - `media_source_proxy_index`: `int` — [Read-Write] The index to pass to MediaSourceProxy to get the media source. (int32)
  - `media_texture`: `MediaTexture` — [Read-Write] The media texture that receives the trackâs video output. (MediaTexture)
  - `start_frame_offset`: `FrameNumber` — [Read-Write] Offset into the source media. (FrameNumber)
  - `texture_index`: `int` — [Read-Write] If using an object like a MediaPlate, then this determines which texture to use for cro...
  - `use_external_media_player`: `bool` — [Read-Write] If true, this track will control a previously created media player instead of automatic...

### `unreal.MovieSceneMediaTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneMediaTrack.h`

Implements a movie scene track for media playback.
