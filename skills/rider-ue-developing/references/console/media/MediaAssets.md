# UE Python API — MediaAssets Module

**30 types** from the `MediaAssets` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MediaCaptureDevice`, `MediaMetadataItemBPT`, `MediaMetadataItemsBPT`, `MediaSoundComponentSpectralData`, `MediaSourceCacheSettings`, `BaseMediaSource`, `FileMediaSource`, `MediaComponent`, `MediaLibrary`, `MediaPlayer`, `MediaPlaylist`, `MediaSoundComponent`, `MediaSource`, `MediaTexture`, `MediaTimeStampInfo`, `PlatformMediaSource`, `StreamMediaSource`, `TimeSynchronizableMediaSource`, `MediaAudioCaptureDeviceFilter`, `MediaPlayerTrack`, ... (30 total)

---

## Classes

### `unreal.MediaCaptureDevice`
Inherits: `StructBase` | Header: `MediaBlueprintFunctionLibrary.h`

Information about a capture device.

**Properties** (2):
  - `display_name`: `Text` [Read-Only] — [Read-Only] Human readable display name. (Text)
  - `url`: `str` [Read-Only] — [Read-Only] Media URL string for use with media players. (str)

### `unreal.MediaMetadataItemBPT`
Inherits: `StructBase` | Header: `MediaPlayer.h`

Media Metadata Item BPT

**Properties** (4):
  - `binary_data`: `None` [Read-Only] — [Read-Only] (Array[uint8])
  - `language_code`: `str` [Read-Only] — [Read-Only] (str)
  - `mime_type`: `str` [Read-Only] — [Read-Only] (str)
  - `string_data`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.MediaMetadataItemsBPT`
Inherits: `StructBase` | Header: `MediaPlayer.h`

Media Metadata Items BPT

**Properties** (1):
  - `items`: `None` [Read-Only] — [Read-Only] (Array[MediaMetadataItemBPT])

### `unreal.MediaSoundComponentSpectralData`
Inherits: `StructBase` | Header: `MediaSoundComponent.h`

Media Sound Component Spectral Data

**Properties** (2):
  - `frequency_hz`: `float` — [Read-Write] The frequency hz of the spectrum value (float)
  - `magnitude`: `float` — [Read-Write] The magnitude of the spectrum at this frequency (float)

### `unreal.MediaSourceCacheSettings`
Inherits: `StructBase` | Header: `MediaSourceOptions.h`

Cache settings to pass to the player.

### `unreal.BaseMediaSource`
Inherits: `MediaSource` | Header: `BaseMediaSource.h`

Base class for concrete media sources.

**Properties** (1):
  - `platform_player_names`: `None` — [Read-Write] Override native media player plug-ins per platform (Empty = find one automatically). (M...

### `unreal.FileMediaSource`
Inherits: `BaseMediaSource` | Header: `FileMediaSource.h`

File Media Source

**Methods** (1):
  - `set_file_path(path)` -> `None` — Set the path to the media file that this source represents. Automatically converts full paths to media sources that resi...

**Properties** (2):
  - `file_path`: `str` — [Read-Write] The path to the media file to be played.
see: SetFilePath (str)
  - `precache_file`: `bool` — [Read-Write] Load entire media file into memory and play from there (if possible). (bool)

### `unreal.MediaComponent`
Inherits: `ActorComponent` | Header: `MediaComponent.h`

Media Component

**Methods** (2):
  - `get_media_player()` -> `MediaPlayer` — Get the media player that this component owns
  - `get_media_texture()` -> `MediaTexture` — Get the media texture that this component owns, bound to its media player.

**Properties** (2):
  - `media_player`: `MediaPlayer` [Read-Only] — [Read-Only] This componentâs media player (MediaPlayer)
  - `media_texture`: `MediaTexture` [Read-Only] — [Read-Only] This componentâs media texture (MediaTexture)

### `unreal.MediaLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MediaBlueprintFunctionLibrary.h`

Blueprint library for Media related functions.

**Methods** (3):
  - `enumerate_audio_capture_devices(filter = -1)` -> `Array [ MediaCaptureDevice ]` [classmethod] — Enumerate available audio capture devices. To filter for a specific subset of devices, use the MakeBitmask node with EMe...
  - `enumerate_video_capture_devices(filter = -1)` -> `Array [ MediaCaptureDevice ]` [classmethod] — Enumerate available audio capture devices. To filter for a specific subset of devices, use the MakeBitmask node with EMe...
  - `enumerate_webcam_capture_devices(filter = -1)` -> `Array [ MediaCaptureDevice ]` [classmethod] — Enumerate available audio capture devices. To filter for a specific subset of devices, use the MakeBitmask node with EMe...

### `unreal.MediaPlayer`
Inherits: `Object` | Header: `MediaPlayer.h`

Implements a media player asset that can play movies and other media sources.

**Methods** (79):
  - `can_pause()` -> `bool` — Check whether media playback can be paused right now. Playback can be paused if the media supports pausing and if it is ...
  - `can_play_source(media_source)` -> `bool` — Check whether the specified media source can be played by this player. If a desired player name is set for this player, ...
  - `can_play_url(url)` -> `bool` — Check whether the specified URL can be played by this player. If a desired player name is set for this player, it will o...
  - `close()` -> `None` — Close the currently open media, if any. see: OnMediaClosed, OpenPlaylist, OpenPlaylistIndex, OpenSource, OpenUrl, Pause,...
  - `get_audio_track_channels(track_index, format_index)` -> `int32` — Get the number of channels in the specified audio track. see: GetAudioTrackSampleRate, GetAudioTrackType
  - `get_audio_track_sample_rate(track_index, format_index)` -> `int32` — Get the sample rate of the specified audio track. see: GetAudioTrackChannels, GetAudioTrackType
  - `get_audio_track_type(track_index, format_index)` -> `str` — Get the type of the specified audio track format. see: GetAudioTrackSampleRate, GetAudioTrackSampleRate
  - `get_desired_player_name()` -> `Name` — Get the name of the current desired native player. see: SetDesiredPlayerName
  - `get_display_time()` -> `Timespan` — Get the mediaâs current playback time as appropriate for display. see: GetDuration, Seek
  - `get_display_time_stamp()` -> `MediaTimeStampInfo` — Get the mediaâs current playback timestamp as appropriate for display. see: GetDuration, Seek
  - `get_duration()` -> `Timespan` — Get the mediaâs duration. see: GetTime, Seek
  - `get_horizontal_field_of_view()` -> `float` — Get the current horizontal field of view (only for 360 videos). see: GetVerticalFieldOfView, GetViewRotation, SetHorizon...
  - `get_media_metadata_items()` -> `Map [ str , MediaMetadataItemsBPT ]` — This is the blueprint accessible version of the GetMediaMetadata. note: Listen to EMediaEvent::MetadataChanged to catch ...
  - `get_media_name()` -> `Text` — Get the human readable name of the currently loaded media source. see: GetPlayerName, GetUrl
  - `get_num_track_formats(track_type, track_index)` -> `int32` — Get the number of formats of the specified track. see: GetNumTracks, GetSelectedTrack, SelectTrack
  - `get_num_tracks(track_type)` -> `int32` — Get the number of tracks of the given type. see: GetNumTrackFormats, GetSelectedTrack, SelectTrack
  - `get_playback_time_range(range_to_get)` -> `FloatInterval` — Blueprint accessible version of GetPlaybackTimeRange. This returns the range truncated into a blueprint usable float int...
  - `get_player_name()` -> `Name` — Get the name of the current native media player. see: GetMediaName
  - `get_playlist()` -> `MediaPlaylist` — Get the current play list. Media players always have a valid play list. In C++ code you can use the GetPlaylistRef to ge...
  - `get_playlist_index()` -> `int32` — Get the current play list index. see: GetPlaylist
  - `get_rate()` -> `float` — Get the mediaâs current playback rate. see: SetRate, SupportsRate
  - `get_selected_track(track_type)` -> `int32` — Get the index of the currently selected track of the given type. see: GetNumTracks, GetTrackFormat, SelectTrack
  - `get_supported_rates(unthinned)` -> `Array [ FloatRange ]` — Get the supported playback rates. see: SetRate, SupportsRate
  - `get_time()` -> `Timespan` — Get the mediaâs current playback time. see: GetDuration, Seek
  - `get_time_delay()` -> `Timespan` — Delay of the playerâs time. see: SetTimeDelay
  - `get_time_stamp()` -> `MediaTimeStampInfo` — Get the mediaâs current playback timestamp. see: GetDuration, Seek
  - `get_track_display_name(track_type, track_index)` -> `Text` — Get the human readable name of the specified track. see: GetNumTracks, GetTrackLanguage
  - `get_track_format(track_type, track_index)` -> `int32` — Get the index of the active format of the specified track type. see: GetNumTrackFormats, GetSelectedTrack, SetTrackForma...
  - `get_track_language(track_type, track_index)` -> `str` — Get the language tag of the specified track. see: GetNumTracks, GetTrackDisplayName
  - `get_url()` -> `str` — Get the URL of the currently loaded media, if any. see: OpenUrl
  - `get_vertical_field_of_view()` -> `float` — Get the current vertical field of view (only for 360 videos). see: GetHorizontalFieldOfView, GetViewRotation, SetVertica...
  - `get_video_track_aspect_ratio(track_index, format_index)` -> `float` — Get the aspect ratio of the specified video track. see: GetVideoTrackDimensions, GetVideoTrackFrameRate, GetVideoTrackFr...
  - `get_video_track_dimensions(track_index, format_index)` -> `IntPoint` — Get the current dimensions of the specified video track. see: GetVideoTrackAspectRatio, GetVideoTrackFrameRate, GetVideo...
  - `get_video_track_frame_rate(track_index, format_index)` -> `float` — Get the frame rate of the specified video track. see: GetVideoTrackAspectRatio, GetVideoTrackDimensions, GetVideoTrackFr...
  - `get_video_track_frame_rates(track_index, format_index)` -> `FloatRange` — Get the supported range of frame rates of the specified video track. see: GetVideoTrackAspectRatio, GetVideoTrackDimensi...
  - `get_video_track_type(track_index, format_index)` -> `str` — Get the type of the specified video track format. see: GetVideoTrackAspectRatio, GetVideoTrackDimensions, GetVideoTrackF...
  - `get_view_rotation()` -> `Rotator` — Get the current view rotation (only for 360 videos). see: GetHorizontalFieldOfView, GetVerticalFieldOfView, SetViewRotat...
  - `has_error()` -> `bool` — Check whether the player is in an error state. When the player is in an error state, no further operations are possible....
  - `is_buffering()` -> `bool` — Check whether playback is buffering data. see: IsConnecting, IsLooping, IsPaused, IsPlaying, IsPreparing, IsReady
  - `is_closed()` -> `bool` — Whether media is currently closed.
  - `is_connecting()` -> `bool` — Check whether the player is currently connecting to a media source. see: IsBuffering, IsLooping, IsPaused, IsPlaying, Is...
  - `is_looping()` -> `bool` — Check whether playback is looping. see: IsBuffering, IsConnecting, IsPaused, IsPlaying, IsPreparing, IsReady, SetLooping
  - `is_paused()` -> `bool` — Check whether playback is currently paused. see: CanPause, IsBuffering, IsConnecting, IsLooping, IsPaused, IsPlaying, Is...
  - `is_playing()` -> `bool` — Check whether playback has started. see: CanPlay, IsBuffering, IsConnecting, IsLooping, IsPaused, IsPlaying, IsPreparing...
  - `is_preparing()` -> `bool` — Check whether the media is currently opening or buffering. see: CanPlay, IsBuffering, IsConnecting, IsLooping, IsPaused,...
  - `is_ready()` -> `bool` — Check whether media is ready for playback. A player is ready for playback if it has a media source opened that finished ...
  - `next()` -> `bool` — Open the next item in the current play list. The player will start playing the new media source if it was playing someth...
  - `open_file(file_path)` -> `bool` — Opens the specified media file path. A return value of true indicates that the player will attempt to open the media, bu...
  - `open_playlist(playlist)` -> `bool` — Open the first media source in the specified play list. see: Close, OpenFile, OpenPlaylistIndex, OpenSource, OpenUrl, Re...
  - `open_playlist_index(playlist, index)` -> `bool` — Open a particular media source in the specified play list. see: Close, OpenFile, OpenPlaylist, OpenSource, OpenUrl, Reop...
  - `open_source(media_source)` -> `bool` — Open the specified media source. A return value of true indicates that the player will attempt to open the media, but it...
  - `open_source_latent(world_context_object, latent_info, media_source, options)` -> `bool` — Open the specified media source with options using a latent action. A result of true indicates that the player successfu...
  - `open_source_with_options(media_source, options)` -> `bool` — Open the specified media source with supplied options applied. A return value of true indicates that the player will att...
  - `open_url(url)` -> `bool` — Opens the specified media URL. A return value of true indicates that the player will attempt to open the media, but it m...
  - `pause()` -> `bool` — Pauses media playback. This is the same as setting the playback rate to 0.0. see: CanPause, Close, Next, Play, Previous,...
  - `play()` -> `bool` — Starts media playback. This is the same as setting the playback rate to 1.0. see: CanPlay, GetRate, Next, Pause, Previou...
  - `play_and_seek()` -> `None` — Starts playback from the media opened event, but can be used elsewhere.
  - `previous()` -> `bool` — Open the previous item in the current play list. The player will start playing the new media source if it was playing so...
  - `reopen()` -> `bool` — Reopens the currently opened media or play list. see: Close, Open, OpenFile, OpenPlaylist, OpenPlaylistIndex, OpenSource...
  - `rewind()` -> `bool` — Rewinds the media to the beginning. This is the same as seeking to zero time. see: GetTime, Seek
  - `scrub(time)` -> `bool` — Seeks to the specified playback time as soon as possible. If the player is currently seeking, the new seek request will ...
  - `seek(time)` -> `bool` — Seeks to the specified playback time. see: GetTime, Rewind
  - `select_track(track_type, track_index)` -> `bool` — Select the active track of the given type. The selected track will use its currently active format. Active formats will ...
  - `set_block_on_time(time)` -> `None` — Set the time on which to block. If set, this player will block in TickInput or TickFetch until the video sample for the ...
  - `set_desired_player_name(player_name)` -> `None` — Set the name of the desired native player. see: GetDesiredPlayerName
  - `set_looping(looping)` -> `bool` — Enables or disables playback looping. see: IsLooping
  - `set_media_options(options)` -> `None` — Sets the media options used by the player.
  - `set_native_volume(volume)` -> `bool` — Set the volume on the native player if not mixing with Sound Wave asset. The SetNativeVolume can be used to change the a...
  - `set_playback_time_range(time_range)` -> `bool` — Blueprint accessible version of SetPlaybackTimeRange(). The range is set through a blueprint usable float interval which...
  - `set_rate(rate)` -> `bool` — Changes the mediaâs playback rate. see: GetRate, SupportsRate
  - `set_time_delay(time_delay)` -> `None` — Delay of the playerâs time. This setting can be used to manually sync multiple sources. Set to 1 seconds, if you would...
  - `set_track_format(track_type, track_index, format_index)` -> `bool` — Set the format on the specified track. Selecting the format will not switch to the specified track. To switch tracks, us...
  - `set_video_track_frame_rate(track_index, format_index, frame_rate)` -> `bool` — Set the frame rate of the specified video track. see: GetVideoTrackAspectRatio, GetVideoTrackDimensions, GetVideoTrackFr...
  - `set_view_field(horizontal, vertical, absolute)` -> `bool` — Set the field of view (only for 360 videos). see: GetHorizontalFieldOfView, GetVerticalFieldOfView, SetViewRotation
  - `set_view_rotation(rotation, absolute)` -> `bool` — Set the viewâs rotation (only for 360 videos). see: GetViewRotation, SetViewField
  - `supports_playback_time_range()` -> `bool` — Check whether the player supports playing back of range within the media. see: GetPlaybackTimeRange, SetPlaybackTimeRang...
  - `supports_rate(rate, unthinned)` -> `bool` — Check whether the specified playback rate is supported. see: SupportsScrubbing, SupportsSeeking
  - `supports_scrubbing()` -> `bool` — Check whether the currently loaded media supports scrubbing. see: SupportsRate, SupportsSeeking
  - `supports_seeking()` -> `bool` — Check whether the currently loaded media can jump to a certain position. see: SupportsRate, SupportsScrubbing

**Properties** (22):
  - `affected_by_pie_handling`: `bool` — [Read-Write] Whether this player should stop when entering or exiting PIE. (bool)
  - `cache_ahead`: `Timespan` — [Read-Write] Duration of samples to cache ahead of the play head.
see: CacheBehind, CacheBehindGame ...
  - `cache_behind`: `Timespan` — [Read-Write] Duration of samples to cache behind the play head (when not running as game).
see: Cach...
  - `cache_behind_game`: `Timespan` — [Read-Write] Duration of samples to cache behind the play head (when running as game).
see: CacheAhe...
  - `loop`: `bool` [Read-Only] — [Read-Only] Whether the player should loop when media playback reaches the end. Use the SetLooping f...
  - `native_audio_out`: `bool` — [Read-Write] Output any audio via the operating systemâs sound mixer instead of a Sound Wave asset...
  - `on_buffering_completed`: `OnMediaPlayerMediaEvent` — [Read-Write] A delegate that may be invoked when the player completes buffering data.
This event sho...
  - `on_buffering_start`: `OnMediaPlayerMediaEvent` — [Read-Write] A delegate that is invoked when the player starts buffering data.
This event is not sen...
  - `on_end_reached`: `OnMediaPlayerMediaEvent` — [Read-Write] A delegate that is invoked when playback has reached the end of the media. (OnMediaPlay...
  - `on_media_closed`: `OnMediaPlayerMediaEvent` — [Read-Write] A delegate that is invoked when a media source has been closed. (OnMediaPlayerMediaEven...
  - `on_media_open_failed`: `OnMediaPlayerMediaOpenFailed` — [Read-Write] A delegate that is invoked when a media source has failed to open. This delegate is onl...
  - `on_media_opened`: `OnMediaPlayerMediaOpened` — [Read-Write] A delegate that is invoked when a media source has been opened. Depending on whether th...
  - `on_metadata_changed`: `OnMediaPlayerMediaEvent` — [Read-Write] A delegate that is invoked when the media metadata changed.
see: OnMediaOpened (OnMedia...
  - `on_playback_resumed`: `OnMediaPlayerMediaEvent` — [Read-Write] A delegate that is invoked when media playback has been resumed.
see: OnPlaybackSuspend...
  - `on_playback_suspended`: `OnMediaPlayerMediaEvent` — [Read-Write] A delegate that is invoked when media playback has been suspended.
see: OnPlaybackResum...
  - `on_seek_completed`: `OnMediaPlayerMediaEvent` — [Read-Write] A delegate that is invoked when a seek operation completed successfully. Depending on w...
  - `on_tracks_changed`: `OnMediaPlayerMediaEvent` — [Read-Write] A delegate that is invoked when the media track collection changed.
see: OnMediaOpened ...
  - `play_on_open`: `bool` — [Read-Write] Automatically start playback after media opened successfully. If disabled, listen to th...
  - `playlist`: `MediaPlaylist` [Read-Only] — [Read-Only] The play list to use, if any. Use the OpenPlaylist or OpenPlaylistIndex function to chan...
  - `playlist_index`: `int` [Read-Only] — [Read-Only] The current index of the source in the play list being played. Use the Previous and Next...
  - `shuffle`: `bool` — [Read-Write] Whether playback should shuffle media sources in the play list.
see: OpenPlaylist, Open...
  - `time_delay`: `Timespan` [Read-Only] — [Read-Only] Delay of the playerâs time.
see: SetTimeDelay, GetTimeDelay (Timespan)

### `unreal.MediaPlaylist`
Inherits: `Object` | Header: `MediaPlaylist.h`

Implements a media play list.

**Methods** (12):
  - `add(media_source)` -> `bool` — Add a media source to the play list. see: AddFile, AddUrl, Insert, RemoveAll, Remove, Replace
  - `add_file(file_path)` -> `bool` — Add a media file path to the play list. see: Add, AddUrl, Insert, RemoveAll, Remove, Replace
  - `add_url(url)` -> `bool` — Add a media URL to the play list. see: Add, AddFile, Insert, RemoveAll, Remove, Replace
  - `get(index)` -> `MediaSource` — Get the media source at the specified index. see: GetNext, GetRandom
  - `get_next(out_index=int32)` — Get the next media source in the play list. see: , GetPrevious, GetRandom
  - `get_previous(out_index=int32)` — Get the previous media source in the play list. see: , GetNext, GetRandom
  - `get_random(out_index=int32)` — Get a random media source in the play list. see: Get, GetNext, GetPrevious
  - `insert(media_source, index)` -> `None` — Insert a media source into the play list at the given position. see: Add, Remove, RemoveAll, Replace
  - `num()` -> `int32` — Get the number of media sources in the play list.
  - `remove(media_source)` -> `bool` — Remove all occurrences of the given media source in the play list. see: Add, Insert, Remove, Replace
  - `remove_at(index)` -> `bool` — Remove the media source at the specified position. see: Add, Insert, RemoveAll, Replace
  - `replace(index, replacement)` -> `bool` — Replace the media source at the specified position. see: Add, Insert, RemoveAll, RemoveAt

### `unreal.MediaSoundComponent`
Inherits: `SynthComponent` | Header: `MediaSoundComponent.h`

Implements a sound component for playing a media playerâs audio output.

**Methods** (10):
  - `get_attenuation_settings_to_apply()` -> `SoundAttenuationSettings or None` — Get the attenuation settings based on the current component settings.
  - `get_envelope_value()` -> `float` — Retrieves the current amplitude envelope.
  - `get_media_player()` -> `MediaPlayer` — Get the media player that provides the audio samples. see: SetMediaPlayer
  - `get_normalized_spectral_data()` -> `Array [ MediaSoundComponentSpectralData ]` — Retrieves and normalizes the spectral data if spectral analysis is enabled.
  - `get_spectral_data()` -> `Array [ MediaSoundComponentSpectralData ]` — Retrieves the spectral data if spectral analysis is enabled.
  - `set_enable_envelope_following(envelope_following)` -> `None` — Turns on amplitude envelope following the audio in the media sound component.
  - `set_enable_spectral_analysis(spectral_analysis_enabled)` -> `None` — Turns on spectral analysis of the audio generated in the media sound component.
  - `set_envelope_followingsettings(attack_time_msec, release_time_msec)` -> `None` — Sets the envelope attack and release times (in ms).
  - `set_media_player(new_media_player)` -> `None` — Set the media player that provides the audio samples. see: GetMediaPlayer
  - `set_spectral_analysis_settings(frequencies_to_analyze, fft_size = MediaSoundComponentFFTSize.MEDIUM_512)` -> `None` — Sets the settings to use for spectral analysis.

### `unreal.MediaSource`
Inherits: `Object` | Header: `MediaSource.h`

Abstract base class for media sources.

**Methods** (6):
  - `get_url()` -> `str` — Get the media sourceâs URL string (must be implemented in child classes). see: GetProxies
  - `set_media_option_bool(key, value)` -> `None` — Set a boolean parameter to pass to the player.
  - `set_media_option_float(key, value)` -> `None` — Set a float parameter to pass to the player.
  - `set_media_option_int64(key, value)` -> `None` — Set an integer64 parameter to pass to the player.
  - `set_media_option_string(key, value)` -> `None` — Set a string parameter to pass to the player.
  - `validate()` -> `bool` — Validate the media source settings (must be implemented in child classes).

### `unreal.MediaTexture`
Inherits: `Texture` | Header: `MediaTexture.h`

Implements a texture asset for rendering video tracks from UMediaPlayer assets.

**Methods** (7):
  - `get_aspect_ratio()` -> `float` — Gets the current aspect ratio of the texture. see: GetHeight, GetWidth
  - `get_height()` -> `int32` — Gets the current height of the texture. see: GetAspectRatio, GetWidth
  - `get_media_player()` -> `MediaPlayer` — Get the media player that provides the video samples. see: SetMediaPlayer
  - `get_texture_num_mips()` -> `int32` — Gets the current numbe of mips of the texture.
  - `get_width()` -> `int32` — Gets the current width of the texture. see: GetAspectRatio, GetHeight
  - `set_media_player(new_media_player)` -> `None` — Set the media player that provides the video samples. see: GetMediaPlayer
  - `update_resource()` -> `None` — Creates a new resource for the texture, and updates any cached references to the resource. This obviously is just an ove...

**Properties** (9):
  - `address_x`: `TextureAddress` — [Read-Write] The addressing mode to use for the X axis. (TextureAddress)
  - `address_y`: `TextureAddress` — [Read-Write] The addressing mode to use for the Y axis. (TextureAddress)
  - `auto_clear`: `bool` — [Read-Write] Whether to clear the texture when no media is being played (default = enabled). (bool)
  - `clear_color`: `LinearColor` — [Read-Write] The color used to clear the texture if AutoClear is enabled (default = black). (LinearC...
  - `current_aspect_ratio`: `float` [Read-Only] — [Read-Only] Current aspect ratio (float)
  - `current_orientation`: `MediaTextureOrientation` [Read-Only] — [Read-Only] Current media orientation (MediaTextureOrientation)
  - `enable_gen_mips`: `bool` [Read-Only] — [Read-Only] Basic enablement for mip generation (default = false). (bool)
  - `new_style_output`: `bool` — [Read-Write] Allows the media texture to be used as a regular 2D texture in materials, with Color or...
  - `num_mips`: `int` — [Read-Write]
deprecated: Only âEnable Mipmap Generationâ is needed now. When true, the full mip ...

### `unreal.MediaTimeStampInfo`
Inherits: `Object` | Header: `MediaPlayer.h`

Media Time Stamp Info

**Properties** (2):
  - `sequence_index`: `int` [Read-Only] — [Read-Only] (int64)
  - `time`: `Timespan` [Read-Only] — [Read-Only] (Timespan)

### `unreal.PlatformMediaSource`
Inherits: `MediaSource` | Header: `PlatformMediaSource.h`

A media source that selects other media sources based on target platform.

### `unreal.StreamMediaSource`
Inherits: `BaseMediaSource` | Header: `StreamMediaSource.h`

Stream Media Source

**Properties** (1):
  - `stream_url`: `str` — [Read-Write] The URL to the media stream to be played. (str)

### `unreal.TimeSynchronizableMediaSource`
Inherits: `BaseMediaSource` | Header: `TimeSynchronizableMediaSource.h`

Base class for media sources that can be synchronized with the engineâs timecode.

**Properties** (1):
  - `use_time_synchronization`: `bool` — [Read-Write] Synchronize the media with the engineâs timecode.
The media player has be able to rea...

### `unreal.MediaAudioCaptureDeviceFilter`
Inherits: `EnumBase` | Header: `MediaBlueprintFunctionLibrary.h`

Filter flags for the EnumerateAudioCaptureDevices BP function.

**Properties** (4):
  - `CARD`: `MediaAudioCaptureDeviceFilter = Ellipsis` — Audio capture cards. 1
  - `MICROPHONE`: `MediaAudioCaptureDeviceFilter = Ellipsis` — Microphone. 2
  - `SOFTWARE`: `MediaAudioCaptureDeviceFilter = Ellipsis` — Software device. 4
  - `UNKNOWN`: `MediaAudioCaptureDeviceFilter = Ellipsis` — Unknown audio capture device types. 8

### `unreal.MediaPlayerTrack`
Inherits: `EnumBase` | Header: `MediaPlayer.h`

Media track types.

**Properties** (7):
  - `AUDIO`: `MediaPlayerTrack = Ellipsis` — Audio track. 0
  - `CAPTION`: `MediaPlayerTrack = Ellipsis` — Caption track. 1
  - `METADATA`: `MediaPlayerTrack = Ellipsis` — Metadata track. 2
  - `SCRIPT`: `MediaPlayerTrack = Ellipsis` — Script track. 3
  - `SUBTITLE`: `MediaPlayerTrack = Ellipsis` — Subtitle track. 4
  - `TEXT`: `MediaPlayerTrack = Ellipsis` — Text track. 5
  - `VIDEO`: `MediaPlayerTrack = Ellipsis` — Video track. 6

### `unreal.MediaSoundChannels`
Inherits: `EnumBase` | Header: `MediaSoundComponent.h`

Available media sound channel types.

**Properties** (3):
  - `MONO`: `MediaSoundChannels = Ellipsis` — Mono (1 channel). 0
  - `STEREO`: `MediaSoundChannels = Ellipsis` — Stereo (2 channels). 1
  - `SURROUND`: `MediaSoundChannels = Ellipsis` — Surround sound (7.1 channels; for UI). 2

### `unreal.MediaSoundComponentFFTSize`
Inherits: `EnumBase` | Header: `MediaSoundComponent.h`

EMedia Sound Component FFTSize

**Properties** (4):
  - `LARGE_1024`: `MediaSoundComponentFFTSize = Ellipsis` — 3
  - `MEDIUM_512`: `MediaSoundComponentFFTSize = Ellipsis` — 2
  - `MIN_64`: `MediaSoundComponentFFTSize = Ellipsis` — 0
  - `SMALL_256`: `MediaSoundComponentFFTSize = Ellipsis` — 1

### `unreal.MediaTextureOrientation`
Inherits: `EnumBase` | Header: `MediaTexture.h`

Media Texture Orientation

**Properties** (4):
  - `MTORI_CW180`: `MediaTextureOrientation = Ellipsis` — 2
  - `MTORI_CW270`: `MediaTextureOrientation = Ellipsis` — 3
  - `MTORI_CW90`: `MediaTextureOrientation = Ellipsis` — 1
  - `MTORI_ORIGINAL`: `MediaTextureOrientation = Ellipsis` — 0

### `unreal.MediaTextureVisibleMipsTiles`
Inherits: `EnumBase` | Header: `MediaTextureTracker.h`

EMedia Texture Visible Mips Tiles

**Properties** (3):
  - `NONE`: `MediaTextureVisibleMipsTiles = Ellipsis` — 0
  - `PLANE`: `MediaTextureVisibleMipsTiles = Ellipsis` — 1
  - `SPHERE`: `MediaTextureVisibleMipsTiles = Ellipsis` — 2

### `unreal.MediaTimeRangeBPType`
Inherits: `EnumBase` | Header: `MediaPlayer.h`

Blueprint usable enum of EMediaTimeRangeType

**Properties** (2):
  - `ABSOLUTE`: `MediaTimeRangeBPType = Ellipsis` — Total absolute time range as defined by the media. 0
  - `CURRENT`: `MediaTimeRangeBPType = Ellipsis` — Current time range of the media, set by media internal means or through API calls. 1

### `unreal.MediaVideoCaptureDeviceFilter`
Inherits: `EnumBase` | Header: `MediaBlueprintFunctionLibrary.h`

Filter flags for the EnumerateVideoCaptureDevices BP function.

**Properties** (4):
  - `CARD`: `MediaVideoCaptureDeviceFilter = Ellipsis` — Video capture card. 1
  - `SOFTWARE`: `MediaVideoCaptureDeviceFilter = Ellipsis` — Software video capture device. 2
  - `UNKNOWN`: `MediaVideoCaptureDeviceFilter = Ellipsis` — Unknown video capture device types. 4
  - `WEBCAM`: `MediaVideoCaptureDeviceFilter = Ellipsis` — Web cam. 8

### `unreal.MediaWebcamCaptureDeviceFilter`
Inherits: `EnumBase` | Header: `MediaBlueprintFunctionLibrary.h`

Filter flags for the EnumerateWebcamCaptureDevices BP function.

**Properties** (4):
  - `DEPTH_SENSOR`: `MediaWebcamCaptureDeviceFilter = Ellipsis` — Depth sensor. 1
  - `FRONT`: `MediaWebcamCaptureDeviceFilter = Ellipsis` — Front facing web cam. 2
  - `REAR`: `MediaWebcamCaptureDeviceFilter = Ellipsis` — Rear facing web cam. 4
  - `UNKNOWN`: `MediaWebcamCaptureDeviceFilter = Ellipsis` — Unknown web cam types. 8

### `unreal.OnMediaPlayerMediaEvent`
Inherits: `MulticastDelegateBase` | Header: `MediaPlayer.h`

Multicast delegate that is invoked when a media event occurred in the player.

### `unreal.OnMediaPlayerMediaOpened`
Inherits: `MulticastDelegateBase` | Header: `MediaPlayer.h`

Multicast delegate that is invoked when a media playerâs media has been opened.

### `unreal.OnMediaPlayerMediaOpenFailed`
Inherits: `MulticastDelegateBase` | Header: `MediaPlayer.h`

Multicast delegate that is invoked when a media playerâs media has failed to open.
