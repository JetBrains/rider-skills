# UE Python API — MediaStream Module

**18 types** from the `MediaStream` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MediaStreamObjectHandlerCreatePlayerParams`, `MediaStreamPlayerConfig`, `MediaStreamSchemeHandlerCreatePlayerParams`, `MediaStreamSource`, `MediaStreamTextureConfig`, `MediaStream`, `MediaStreamActor`, `MediaStreamComponent`, `MediaStreamLocalPlayer`, `MediaStreamObjectHandlerSubsystem`, `MediaStreamPlayer`, `MediaStreamProxyPlayer`, `MediaStreamSchemeHandlerSubsystem`, `MediaStreamSourceBlueprintLibrary`, `MediaStreamPlaybackDirection`, `MediaStreamPlaybackSeek`, `MediaStreamPlaybackState`, `MediaStream_OnSourceChanged`

---

## Classes

### `unreal.MediaStreamObjectHandlerCreatePlayerParams`
Inherits: `StructBase` | Header: `IMediaStreamObjectHandler.h`

Media Stream Object Handler Create Player Params

**Properties** (4):
  - `can_open_source`: `bool` — [Read-Write] Whether the new player can open the source or not.
If this is false, it may mean that a...
  - `current_player`: `MediaPlayer` — [Read-Write] The current player to update or null.
If a player is provided, it will be re-used to op...
  - `media_stream`: `MediaStream` — [Read-Write] The container for the player. (MediaStream)
  - `source`: `Object` — [Read-Write] The media source for the player. (Object)

### `unreal.MediaStreamPlayerConfig`
Inherits: `StructBase` | Header: `MediaStreamPlayerConfig.h`

Media Stream Player Config

**Properties** (11):
  - `cache_ahead`: `float` — [Read-Write] (float)
  - `cache_behind`: `float` — [Read-Write] (float)
  - `cache_behind_game`: `float` — [Read-Write] (float)
  - `looping`: `bool` — [Read-Write] (bool)
  - `play_on_open`: `bool` — [Read-Write] (bool)
  - `playback_time_range`: `type` — [Read-Write] (âundefinedâ)
  - `rate`: `float` — [Read-Write] (float)
  - `shuffle`: `bool` — [Read-Write] Only applicable to play lists. (bool)
  - `time_delay`: `float` — [Read-Write] (float)
  - `track_options`: `MediaPlayerTrackOptions` — [Read-Write] (MediaPlayerTrackOptions)
  - `volume`: `float` — [Read-Write] (float)

### `unreal.MediaStreamSchemeHandlerCreatePlayerParams`
Inherits: `StructBase` | Header: `IMediaStreamSchemeHandler.h`

Media Stream Scheme Handler Create Player Params

**Properties** (3):
  - `can_open_source`: `bool` — [Read-Write] Whether the new player can open the source or not.
If this is false, it may mean that a...
  - `current_player`: `MediaPlayer` — [Read-Write] The current player to update or null.
If a player is provided, it will be re-used to op...
  - `media_stream`: `MediaStream` — [Read-Write] The container for the player. (MediaStream)

### `unreal.MediaStreamSource`
Inherits: `StructBase` | Header: `MediaStreamSource.h`

Represents the source of a Media Stream.

**Properties** (3):
  - `object`: `Object` [Read-Only] — [Read-Only] Source of the Media. Either a UMediaStream, UMediaSource or a UMediaPlaylist (Object)
  - `path`: `str` [Read-Only] — [Read-Only] Path to the referenced source, such as a file/asset path or a managed source name.
A pat...
  - `scheme`: `Name` [Read-Only] — [Read-Only] Used by the handler subsystem to identifer the scheme used.
A value of NAME_None identif...

### `unreal.MediaStreamTextureConfig`
Inherits: `StructBase` | Header: `MediaStreamTextureConfig.h`

Media Stream Texture Config

**Properties** (1):
  - `enable_mip_gen`: `bool` — [Read-Write] (bool)

### `unreal.MediaStream`
Inherits: `Object` | Header: `MediaStream.h`

Media Stream. Provides an agnostic interface between controllers and players.

**Methods** (6):
  - `ensure_player(force_recreate_player = False)` -> `bool` — Creates a player if it doesnât exist.
  - `get_player()` -> `MediaStreamPlayer`
  - `get_source()` -> `MediaStreamSource`
  - `has_valid_source()` -> `bool`
  - `resolve_source()` -> `MediaStreamSource`
  - `set_source(source)` -> `bool` — Sets a new Media Stream Source and inits the Player. It should be ready to use if this returns true.

**Properties** (3):
  - `on_source_changed`: `OnSourceChanged` — [Read-Write] (OnSourceChanged)
  - `player_object`: `Object` [Read-Only] — [Read-Only] The player instance is automatically created based on the type of source.
Where possible...
  - `source`: `MediaStreamSource` — [Read-Write] (MediaStreamSource)

### `unreal.MediaStreamActor`
Inherits: `Actor` | Header: `MediaStreamActor.h`

Media Stream Actor

**Properties** (1):
  - `media_stream_component`: `MediaStreamComponent` [Read-Only] — [Read-Only] (MediaStreamComponent)

### `unreal.MediaStreamComponent`
Inherits: `StaticMeshComponent` | Header: `MediaStreamComponent.h`

Media Stream Component

**Properties** (2):
  - `material_instance`: `MaterialInstanceDynamic` [Read-Only] — [Read-Only] (MaterialInstanceDynamic)
  - `media_stream`: `MediaStream` [Read-Only] — [Read-Only] (MediaStream)

### `unreal.MediaStreamLocalPlayer`
Inherits: `Object` | Header: `MediaStreamLocalPlayer.h`

Media Stream Local Player. Plays a media source using a UMediaPlayer.

**Methods** (34):
  - `apply_player_config()` -> `None` — Applies the current player config to the current media player. This is generally automatic.
  - `apply_texture_config()` -> `None` — Applies the current texture config to the current media texture. This is generally automatic.
  - `bp_set_playback_state(state)` -> `None` — BP Set Playback State
  - `bp_set_playlist_index(index)` -> `None` — BP Set Playlist Index
  - `bp_set_requested_seek_frame(seek_frame)` -> `None` — BP Set Requested Seek Frame
  - `bp_set_requested_seek_time(seek_time)` -> `None` — BP Set Requested Seek Time
  - `close()` -> `bool` — Closes the current media player.
  - `fast_forward()` -> `bool` — Seeks to the end of the current media.
  - `get_media_stream()` -> `MediaStream` — Get Media Stream
  - `get_media_texture()` -> `MediaTexture`
  - `get_playback_state()` -> `MediaStreamPlaybackState`
  - `get_player()` -> `MediaPlayer`
  - `get_player_config()` -> `MediaStreamPlayerConfig`
  - `get_playlist_index()` -> `int32`
  - `get_playlist_num()` -> `int32`
  - `get_requested_seek_frame()` -> `int32`
  - `get_requested_seek_time()` -> `float`
  - `get_source_stream()` -> `MediaStream`
  - `get_texture_config()` -> `MediaStreamTextureConfig`
  - `has_valid_player()` -> `bool`
  - `is_read_only()` -> `bool` — Returns whether this playerâs controls can do anything.
  - `next()` -> `bool` — Goes to the next item in the playlist. Only possible with playlist sources.
  - `on_created()` -> `None` — On Created
  - `open_source()` -> `bool` — Opens the source if it is not already opened.
  - `pause()` -> `bool` — Pauses playback of the current media.
  - `play()` -> `bool` — Continues play of the current media.
  - `previous()` -> `bool` — Goes to the previous item in the playlist. Only possible with playlist sources.
  - `rewind()` -> `bool` — Seeks to the start of the current media.
  - `set_playback_state(state)` -> `bool` — Sets the media player playback state.
  - `set_player_config(player_config)` -> `None` — Update the current playerâs (and any newly set playerâs) config.
  - `set_playlist_index(index)` -> `bool` — Setter for events.
  - `set_requested_seek_frame(frame)` -> `bool` — Sets the frame in the currently playing player, if possible.
  - `set_requested_seek_time(time)` -> `bool` — Sets the time in the currently playing player, if possible.
  - `set_texture_config(texture_config)` -> `None` — Update the current textureâs (and any newly set textureâs) config.

**Properties** (7):
  - `media_texture`: `MediaTexture` [Read-Only] — [Read-Only] (MediaTexture)
  - `playback_state`: `MediaStreamPlaybackState` — [Read-Write] (MediaStreamPlaybackState)
  - `player`: `MediaPlayer` [Read-Only] — [Read-Only] (MediaPlayer)
  - `player_config`: `MediaStreamPlayerConfig` — [Read-Write] (MediaStreamPlayerConfig)
  - `playlist_index`: `int` — [Read-Write] The index playing in the playlist. -1 to ignore. (int32)
  - `requested_seek_frame`: `int` — [Read-Write] Attempts to seek to this frame. Any value below 0 is ignored. (int32)
  - `texture_config`: `MediaStreamTextureConfig` — [Read-Write] (MediaStreamTextureConfig)

### `unreal.MediaStreamObjectHandlerSubsystem`
Inherits: `EngineSubsystem` | Header: `MediaStreamObjectHandlerSubsystem.h`

Subsystem for blueprint-style interaction with the Object Handler Manager.

**Methods** (4):
  - `can_handle_object(class_)` -> `bool` — Checks whether the given class has a class handler. Checks each super class too.
  - `create_media_player(params)` -> `MediaPlayer` — Create or update a UMediaPlayer for the provided source. Note: This usually means loading the media source. see: bCanLoa...
  - `get()` -> `MediaStreamObjectHandlerSubsystem` [classmethod]
  - `has_object_handler(class_)` -> `bool` — Checks whether a class has a handler registered.

### `unreal.MediaStreamPlayer`
Inherits: `Interface` | Header: `IMediaStreamPlayer.h`

Media Stream Player

**Methods** (30):
  - `apply_player_config()` -> `None` — Applies the current player config to the current media player. This is generally automatic.
  - `apply_texture_config()` -> `None` — Applies the current texture config to the current media texture. This is generally automatic.
  - `close()` -> `bool` — Closes the current media player.
  - `fast_forward()` -> `bool` — Seeks to the end of the current media.
  - `get_media_stream()` -> `MediaStream` — Get Media Stream
  - `get_media_texture()` -> `MediaTexture`
  - `get_playback_state()` -> `MediaStreamPlaybackState`
  - `get_player()` -> `MediaPlayer`
  - `get_player_config()` -> `MediaStreamPlayerConfig`
  - `get_playlist_index()` -> `int32`
  - `get_playlist_num()` -> `int32`
  - `get_requested_seek_frame()` -> `int32`
  - `get_requested_seek_time()` -> `float`
  - `get_source_stream()` -> `MediaStream`
  - `get_texture_config()` -> `MediaStreamTextureConfig`
  - `has_valid_player()` -> `bool`
  - `is_read_only()` -> `bool` — Returns whether this playerâs controls can do anything.
  - `next()` -> `bool` — Goes to the next item in the playlist. Only possible with playlist sources.
  - `on_created()` -> `None` — On Created
  - `open_source()` -> `bool` — Opens the source if it is not already opened.
  - `pause()` -> `bool` — Pauses playback of the current media.
  - `play()` -> `bool` — Continues play of the current media.
  - `previous()` -> `bool` — Goes to the previous item in the playlist. Only possible with playlist sources.
  - `rewind()` -> `bool` — Seeks to the start of the current media.
  - `set_playback_state(state)` -> `bool` — Sets the media player playback state.
  - `set_player_config(player_config)` -> `None` — Update the current playerâs (and any newly set playerâs) config.
  - `set_playlist_index(index)` -> `bool` — Setter for events.
  - `set_requested_seek_frame(frame)` -> `bool` — Sets the frame in the currently playing player, if possible.
  - `set_requested_seek_time(time)` -> `bool` — Sets the time in the currently playing player, if possible.
  - `set_texture_config(texture_config)` -> `None` — Update the current textureâs (and any newly set textureâs) config.

### `unreal.MediaStreamProxyPlayer`
Inherits: `Object` | Header: `MediaStreamProxyPlayer.h`

Media Stream Proxy Player. Forwards the player and texture from another Media Stream.

**Methods** (32):
  - `apply_player_config()` -> `None` — Applies the current player config to the current media player. This is generally automatic.
  - `apply_texture_config()` -> `None` — Applies the current texture config to the current media texture. This is generally automatic.
  - `close()` -> `bool` — Closes the current media player.
  - `fast_forward()` -> `bool` — Seeks to the end of the current media.
  - `get_media_stream()` -> `MediaStream` — Get Media Stream
  - `get_media_texture()` -> `MediaTexture`
  - `get_playback_state()` -> `MediaStreamPlaybackState`
  - `get_player()` -> `MediaPlayer`
  - `get_player_config()` -> `MediaStreamPlayerConfig`
  - `get_playlist_index()` -> `int32`
  - `get_playlist_num()` -> `int32`
  - `get_proxy_stream_soft()` -> `MediaStream` — Get Proxy Stream Soft
  - `get_requested_seek_frame()` -> `int32`
  - `get_requested_seek_time()` -> `float`
  - `get_source_stream()` -> `MediaStream`
  - `get_texture_config()` -> `MediaStreamTextureConfig`
  - `has_valid_player()` -> `bool`
  - `is_read_only()` -> `bool` — Returns whether this playerâs controls can do anything.
  - `next()` -> `bool` — Goes to the next item in the playlist. Only possible with playlist sources.
  - `on_created()` -> `None` — On Created
  - `open_source()` -> `bool` — Opens the source if it is not already opened.
  - `pause()` -> `bool` — Pauses playback of the current media.
  - `play()` -> `bool` — Continues play of the current media.
  - `previous()` -> `bool` — Goes to the previous item in the playlist. Only possible with playlist sources.
  - `rewind()` -> `bool` — Seeks to the start of the current media.
  - `set_playback_state(state)` -> `bool` — Sets the media player playback state.
  - `set_player_config(player_config)` -> `None` — Update the current playerâs (and any newly set playerâs) config.
  - `set_playlist_index(index)` -> `bool` — Setter for events.
  - `set_read_only(read_only)` -> `None` — Set Read Only
  - `set_requested_seek_frame(frame)` -> `bool` — Sets the frame in the currently playing player, if possible.
  - `set_requested_seek_time(time)` -> `bool` — Sets the time in the currently playing player, if possible.
  - `set_texture_config(texture_config)` -> `None` — Update the current textureâs (and any newly set textureâs) config.

**Properties** (1):
  - `read_only`: `bool` — [Read-Write] If true, the proxied stream wonât receive set calls. (bool)

### `unreal.MediaStreamSchemeHandlerSubsystem`
Inherits: `EngineSubsystem` | Header: `MediaStreamSchemeHandlerSubsystem.h`

Subsystem for blueprint-style interaction with the Scheme Handler Manager.

**Methods** (5):
  - `create_or_update_player(params)` -> `MediaPlayer` — Create or update a UMediaPlayer for the provided source. Note: This usually means loading the media source. see: bCanLoa...
  - `create_source(outer, scheme, path)` -> `MediaStreamSource` — Create a Media Stream Source from a scheme and path. Must have a registered handler.
  - `get()` -> `MediaStreamSchemeHandlerSubsystem` [classmethod]
  - `get_scheme_handler_names()` -> `Array [ Name ]`
  - `has_scheme_handler(scheme)` -> `bool` — Checks whether a scheme has a handler registered.

### `unreal.MediaStreamSourceBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MediaStreamSourceBlueprintLibrary.h`

Deals with creating new Media Stream Sources.

**Methods** (10):
  - `is_asset_path_valid(path)` -> `bool` [classmethod] — Checks the Asset path to see if itâs a valid asset for a Media Stream Source.
  - `is_asset_soft_path_valid(path)` -> `bool` [classmethod] — Checks the Asset soft path to see if itâs a valid asset for a Media Stream Source.
  - `is_asset_valid(asset)` -> `bool` [classmethod] — Checks the Asset pointer to see if itâs a valid asset for a Media Stream Source.
  - `is_valid_media_source(source)` -> `bool` [classmethod] — Checks the media stream to see if its source type is none or set to something valid. And that the path is not empty.
  - `make_media_source_from_asset(media_stream, asset)` -> `MediaStreamSource` [classmethod] — Create a Media Stream Source from an Asset. Must have a registered handler.
  - `make_media_source_from_file(media_stream, file_name)` -> `MediaStreamSource` [classmethod] — Create a Media Stream Source from a file name.
  - `make_media_source_from_scheme_path(media_stream, scheme, path)` -> `MediaStreamSource` [classmethod] — Create a Media Stream Source from an Asset. Must have a registered handler.
  - `make_media_source_from_stream_name(media_stream, stream_name)` -> `MediaStreamSource` [classmethod] — Create a Media Stream Source from a stream name. Must be set up via the Media Source Manager.
  - `make_media_source_from_subobject(media_stream, object)` -> `MediaStreamSource` [classmethod] — Create a Media Stream Source from an object.
  - `make_media_source_from_subobject_class(media_stream, class_)` -> `MediaStreamSource` [classmethod] — Create a Media Stream Source by instantiating the given class.

### `unreal.MediaStreamPlaybackDirection`
Inherits: `EnumBase` | Header: `MediaStreamEnums.h`

EMedia Stream Playback Direction

**Properties** (2):
  - `BACKWARD`: `MediaStreamPlaybackDirection = Ellipsis` — 1
  - `FORWARD`: `MediaStreamPlaybackDirection = Ellipsis` — 0

### `unreal.MediaStreamPlaybackSeek`
Inherits: `EnumBase` | Header: `MediaStreamEnums.h`

EMedia Stream Playback Seek

**Properties** (4):
  - `END`: `MediaStreamPlaybackSeek = Ellipsis` — 2
  - `NEXT`: `MediaStreamPlaybackSeek = Ellipsis` — 3
  - `PREVIOUS`: `MediaStreamPlaybackSeek = Ellipsis` — 0
  - `START`: `MediaStreamPlaybackSeek = Ellipsis` — 1

### `unreal.MediaStreamPlaybackState`
Inherits: `EnumBase` | Header: `MediaStreamEnums.h`

EMedia Stream Playback State

**Properties** (2):
  - `PAUSE`: `MediaStreamPlaybackState = Ellipsis` — 1
  - `PLAY`: `MediaStreamPlaybackState = Ellipsis` — 0

### `unreal.MediaStream_OnSourceChanged`
Inherits: `MulticastDelegateBase` | Header: `MediaStream.h`

Called when the Media Stream Player changes.
