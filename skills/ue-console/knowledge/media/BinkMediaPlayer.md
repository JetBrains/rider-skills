# UE Python API — BinkMediaPlayer Module

**10 types** from the `BinkMediaPlayer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BinkFunctionLibrary`, `BinkMediaPlayer`, `BinkMediaTexture`, `BinkMediaPlayerBinkBufferModes`, `BinkMediaPlayerBinkDrawStyle`, `BinkMediaPlayerBinkSoundTrack`, `OnBinkMediaPlayerMediaClosed`, `OnBinkMediaPlayerMediaEvent`, `OnBinkMediaPlayerMediaOpened`, `OnBinkMediaPlayerMediaReachedEnd`

---

## Classes

### `unreal.BinkFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BinkFunctionLibrary.h`

Bink Function Library

**Methods** (3):
  - `bink_draw_overlays()` -> `None` [classmethod] — Bink Draw Overlays
  - `bink_loading_movie_get_duration()` -> `Timespan` [classmethod] — Bink Loading Movie Get Duration
  - `bink_loading_movie_get_time()` -> `Timespan` [classmethod] — Bink Loading Movie Get Time

### `unreal.BinkMediaPlayer`
Inherits: `Object` | Header: `BinkMediaPlayer.h`

Implements a media player asset that can play movies and other media.

**Methods** (26):
  - `can_pause()` -> `bool` — Checks whether media playback can be paused right now. Playback can be paused if the media supports pausing and if it is...
  - `can_play()` -> `bool` — Checks whether media playback can be started right now. see: CanPause, Play
  - `close_url()` -> `None` — Closes the specified media URL. see: GetUrl
  - `draw(texture, tonemap = False, out_nits = 10000, alpha = 1.000000, srgb_decode = False, hdr = False)` -> `None` — Draws this bink to the specified texture
  - `get_duration()` -> `Timespan` — Gets the mediaâs duration. see: GetTime, Seek
  - `get_rate()` -> `float` — Gets the mediaâs current playback rate. see: SetRate, SupportsRate
  - `get_time()` -> `Timespan` — Gets the mediaâs current playback time. see: GetDuration, Seek
  - `get_url()` -> `str` — Gets the URL of the currently loaded media, if any. see: OpenUrl
  - `is_gotoing()` -> `bool` — Checks whether playback is âGoToâingâ. see: IsPaused, IsPlaying, Stop
  - `is_initialized()` -> `bool` — Checks whether this player has been initialized with a media source. see: OpenUrl
  - `is_looping()` -> `bool` — Checks whether playback is looping. see: SetLooping
  - `is_paused()` -> `bool` — Checks whether playback is currently paused. see: CanPause, IsPlaying, IsStopped, Pause
  - `is_playing()` -> `bool` — Checks whether playback has started. see: CanPlay, IsPaused, IsStopped, Play
  - `is_stopped()` -> `bool` — Checks whether playback has stopped. see: IsPaused, IsPlaying, Stop
  - `open_url(new_url)` -> `bool` — Opens the specified media URL. see: GetUrl
  - `pause()` -> `bool` — Pauses media playback. This is the same as setting the playback rate to 0.0. see: CanPause, Play, Rewind, Seek, SetRate
  - `play()` -> `bool` — Starts media playback. This is the same as setting the playback rate to 1.0. see: CanPlay, Pause, Rewind, Seek, SetRate
  - `rewind()` -> `bool` — Rewinds the media to the beginning. This is the same as seeking to zero time. see: GetTime, Pause, Play, Seek
  - `seek(time)` -> `bool` — Seeks to the specified playback time. see: GetTime, Rewind
  - `set_looping(looping)` -> `bool` — Enables or disables playback looping. see: IsLooping
  - `set_rate(rate)` -> `bool` — Changes the mediaâs playback rate. see: GetRate, SupportsRate
  - `set_volume(rate)` -> `None` — Changes the mediaâs volume
  - `stop()` -> `None` — Stops playback and unloads the video from memory. If you want to start the video again youâll need to call InitializeP...
  - `supports_rate(rate, unthinned)` -> `bool` — Checks whether the specified playback rate is supported. see: SupportsScrubbing, SupportsSeeking
  - `supports_scrubbing()` -> `bool` — Checks whether the currently loaded media supports scrubbing. see: SupportsRate, SupportsSeeking
  - `supports_seeking()` -> `bool` — Checks whether the currently loaded media can jump to a certain position. see: SupportsRate, SupportsScrubbing

**Properties** (9):
  - `bink_buffer_mode`: `BinkMediaPlayerBinkBufferModes` [Read-Only] — [Read-Only] Used to specify the how the video should be buffered. (BinkMediaPlayerBinkBufferModes)
  - `bink_draw_style`: `BinkMediaPlayerBinkDrawStyle` [Read-Only] — [Read-Only] Used to specify how the movie is drawn. (BinkMediaPlayerBinkDrawStyle)
  - `bink_layer_depth`: `int` [Read-Only] — [Read-Only] Used to specify the render order. (int32)
  - `bink_sound_track`: `BinkMediaPlayerBinkSoundTrack` [Read-Only] — [Read-Only] Used to specify the sounds to open at playback. (BinkMediaPlayerBinkSoundTrack)
  - `bink_sound_track_start`: `int` [Read-Only] — [Read-Only] Used to specify the sounds to open at playback. (int32)
  - `on_media_closed`: `OnBinkMediaPlayerMediaClosed` — [Read-Write] Holds a delegate that is invoked when a media source has been closed. (OnBinkMediaPlaye...
  - `on_media_opened`: `OnBinkMediaPlayerMediaOpened` — [Read-Write] Holds a delegate that is invoked when a media source has been opened. (OnBinkMediaPlaye...
  - `on_media_reached_end`: `OnBinkMediaPlayerMediaReachedEnd` — [Read-Write] Holds a delegate that is invoked when a media source has been opened. (OnBinkMediaPlaye...
  - `on_playback_suspended`: `OnBinkMediaPlayerMediaEvent` — [Read-Write] A delegate that is invoked when media playback has been suspended. (OnBinkMediaPlayerMe...

### `unreal.BinkMediaTexture`
Inherits: `Texture` | Header: `BinkMediaTexture.h`

Implements a texture asset for rendering video tracks from UBinkMediaPlayer assets.

**Methods** (2):
  - `clear()` -> `None` — Clears this texture to transparent-black.
  - `set_media_player(media_player)` -> `None` — Sets the media player asset to be used for this texture.

**Properties** (8):
  - `address_x`: `TextureAddress` — [Read-Write] The addressing mode to use for the X axis. (TextureAddress)
  - `address_y`: `TextureAddress` — [Read-Write] The addressing mode to use for the Y axis. (TextureAddress)
  - `alpha`: `float` [Read-Only] — [Read-Only] alpha_value is just a constant blend value for entire video frame. 1 (default) opaque, 0...
  - `decode_srgb`: `bool` [Read-Only] — [Read-Only] Enable decoding of sRGB to Linear inside Bink when drawing to this texture. You could us...
  - `media_player`: `BinkMediaPlayer` [Read-Only] — [Read-Only] The MediaPlayer asset to stream video from. (BinkMediaPlayer)
  - `output_nits`: `float` [Read-Only] — [Read-Only] When tonemapping, set this for to desired output nits capability for the current display...
  - `pixel_format`: `PixelFormat` [Read-Only] — [Read-Only] The Pixel Format for the texture. (PixelFormat)
  - `tonemap`: `bool` [Read-Only] — [Read-Only] Whether to enable tonemaping for the video. (bool)

### `unreal.BinkMediaPlayerBinkBufferModes`
Inherits: `EnumBase` | Header: `BinkMediaPlayer.h`

Enumerates available bink buffering modes.

**Properties** (3):
  - `BMASM_BINK_PRELOAD_ALL`: `BinkMediaPlayerBinkBufferModes = Ellipsis` — Loads the whole movie into memory at Open time (will block). 1
  - `BMASM_BINK_STREAM`: `BinkMediaPlayerBinkBufferModes = Ellipsis` — Stream the movie off the media during playback (caches about 1 second of video). 0
  - `BMASM_BINK_STREAM_UNTIL_RESIDENT`: `BinkMediaPlayerBinkBufferModes = Ellipsis` — Streams the movie into a memory buffer as big as the movie, so it will be preloaded eventually). 2

### `unreal.BinkMediaPlayerBinkDrawStyle`
Inherits: `EnumBase` | Header: `BinkMediaPlayer.h`

Enumerates available bink buffering modes.

**Properties** (5):
  - `BMASM_BINK_DS_OVERLAY_FILL_SCREEN`: `BinkMediaPlayerBinkDrawStyle = Ellipsis` — Renders movie in an overlay (UE4 bypass), filling the entire destination rectangle 3
  - `BMASM_BINK_DS_OVERLAY_FILL_SCREEN_WITH_ASPECT_RATIO`: `BinkMediaPlayerBinkDrawStyle = Ellipsis` — Renders movie in an overlay (UE4 bypass) and corrects for movie aspect ratio. 1
  - `BMASM_BINK_DS_OVERLAY_ORIGINAL_MOVIE_SIZE`: `BinkMediaPlayerBinkDrawStyle = Ellipsis` — Renders movie in an overlay (UE4 bypass), displaying the original movie size and not stretching to f...
  - `BMASM_BINK_DS_OVERLAY_SPECIFIC_DESTINATION_RECTANGLE`: `BinkMediaPlayerBinkDrawStyle = Ellipsis` — Renders movie in an overlay (UE4 bypass), rendering to the specific rectangle specified (same as Fil...
  - `BMASM_BINK_DS_RENDER_TO_TEXTURE`: `BinkMediaPlayerBinkDrawStyle = Ellipsis` — Renders movie to the destination texture (default UE4 functionality) 0

### `unreal.BinkMediaPlayerBinkSoundTrack`
Inherits: `EnumBase` | Header: `BinkMediaPlayer.h`

Enumerates available used to specify the sounds to open at playback w/ bink movies.

**Properties** (7):
  - `BMASM_BINK_SOUND_51`: `BinkMediaPlayerBinkSoundTrack = Ellipsis` — 6 mono tracks in tracks snd_track_start[0..5] 3
  - `BMASM_BINK_SOUND_51_LANGUAGE_OVERRIDE`: `BinkMediaPlayerBinkSoundTrack = Ellipsis` — 6 mono tracks in tracks 0..5, center language track at snd_track_start 4
  - `BMASM_BINK_SOUND_71`: `BinkMediaPlayerBinkSoundTrack = Ellipsis` — 8 mono tracks in tracks snd_track_start[0..7] 5
  - `BMASM_BINK_SOUND_71_LANGUAGE_OVERRIDE`: `BinkMediaPlayerBinkSoundTrack = Ellipsis` — 8 mono tracks in tracks 0..7, center language track at snd_track_start 6
  - `BMASM_BINK_SOUND_LANGUAGE_OVERRIDE`: `BinkMediaPlayerBinkSoundTrack = Ellipsis` — Mono or stereo sound in track 0, language track at snd_track_start. 2
  - `BMASM_BINK_SOUND_NONE`: `BinkMediaPlayerBinkSoundTrack = Ellipsis` — Donât open any sound tracks snd_track_start not used. 0
  - `BMASM_BINK_SOUND_SIMPLE`: `BinkMediaPlayerBinkSoundTrack = Ellipsis` — Based on filename, OR simply mono or stereo sound in track snd_track_start (default speaker spread)....

### `unreal.OnBinkMediaPlayerMediaClosed`
Inherits: `MulticastDelegateBase` | Header: `BinkMediaPlayer.h`

Multicast delegate that is invoked when a media playerâs media has been closed.

### `unreal.OnBinkMediaPlayerMediaEvent`
Inherits: `MulticastDelegateBase` | Header: `BinkMediaPlayer.h`

Multicast delegate that is invoked when a media event occurred in the player.

### `unreal.OnBinkMediaPlayerMediaOpened`
Inherits: `MulticastDelegateBase` | Header: `BinkMediaPlayer.h`

Multicast delegate that is invoked when a media playerâs media has been opened.

### `unreal.OnBinkMediaPlayerMediaReachedEnd`
Inherits: `MulticastDelegateBase` | Header: `BinkMediaPlayer.h`

Multicast delegate that is invoked when a media playerâs media has finished playing.
