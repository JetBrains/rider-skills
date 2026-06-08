# UE Python API — PixelStreaming Module

**14 types** from the `PixelStreaming` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PixelStreamingAudioComponent`, `PixelStreamingBlueprints`, `PixelStreamingDelegates`, `PixelStreamingInput`, `PixelStreamingMediaIOCapture`, `PixelStreamingMediaIOOutput`, `PixelStreamingDelegates_AllConnectionsClosed`, `PixelStreamingDelegates_ClosedConnection`, `PixelStreamingDelegates_ConnectedToSignallingServer`, `PixelStreamingDelegates_DisconnectedFromSignallingServer`, `PixelStreamingDelegates_FallbackToSoftwareEncodering`, `PixelStreamingDelegates_NewConnection`, `PixelStreamingDelegates_StatsChanged`, `PixelStreamingInput_OnInput`

---

## Classes

### `unreal.PixelStreamingAudioComponent`
Inherits: `SynthComponent` | Header: `PixelStreamingAudioComponent.h`

Allows in-engine playback of incoming WebRTC audio from a particular Pixel Streaming player/peer using their mic in the browser. Note: Each audio component associates itself with a particular Pixel St...

**Methods** (4):
  - `is_listening_to_player()` -> `bool` — True if listening to a connected WebRTC peer through Pixel Streaming.
  - `listen_to(player_to_listen_to)` -> `bool` — Listen to a specific player on the default streamer. If the player is not found this component will be silent.
  - `reset()` -> `None` — Stops listening to any connected player/peer and resets internal state so component is ready to listen again.
  - `streamer_listen_to(streamer_id, player_to_listen_to)` -> `bool` — Listen to a specific player. If the player is not found this component will be silent.

**Properties** (3):
  - `auto_find_peer`: `bool` — [Read-Write] If not already listening to a player/peer will try to attach for listening to the âPl...
  - `player_to_hear`: `str` — [Read-Write] The Pixel Streaming player/peer whose audio we wish to listen to.
If this is left blank...
  - `streamer_to_hear`: `str` — [Read-Write] The Pixel Streaming streamer of the player that we wish to listen to.
If this is left b...

### `unreal.PixelStreamingBlueprints`
Inherits: `BlueprintFunctionLibrary` | Header: `PixelStreamingBlueprints.h`

Pixel Streaming Blueprints

**Methods** (17):
  - `force_key_frame()` -> `None` [classmethod] — Force a key frame to be sent.
  - `freeze_frame(texture)` -> `None` [classmethod] — Freeze Pixel Streaming.
  - `get_connected_players()` -> `Array [ str ]` [classmethod] — brief: Get the connected players
  - `get_default_streamer_id()` -> `str` [classmethod] — Get the default Streamer ID
  - `get_pixel_streaming_delegates()` -> `PixelStreamingDelegates` [classmethod] — Get the singleton. This allows application-specific blueprints to bind to delegates of interest.
  - `kick_player(player_id)` -> `None` [classmethod] — Kick a player.
  - `send_file(filepath, mime_type, file_extension)` -> `None` [classmethod] — Send a specified file over the WebRTC peer connection data channel. The extension and mime type are used for file recons...
  - `send_file_as_byte_array(byte_array, mime_type, file_extension)` -> `None` [classmethod] — Send a specified byte array over the WebRTC peer connection data channel. The extension and mime type are used for file ...
  - `set_player_layer_preference(player_id, spatial_layer_id, temporal_layer_id)` -> `None` [classmethod] — Set the layer preference for a specific player
  - `streamer_freeze_stream(streamer_id, texture)` -> `None` [classmethod] — Freeze Pixel Streaming.
  - `streamer_get_connected_players(streamer_id)` -> `Array [ str ]` [classmethod] — brief: Get the connected players
  - `streamer_kick_player(streamer_id, player_id)` -> `None` [classmethod] — Kick a player.
  - `streamer_send_file(streamer_id, filepath, mime_type, file_extension)` -> `None` [classmethod] — Send a specified file over the WebRTC peer connection data channel. The extension and mime type are used for file recons...
  - `streamer_send_file_as_byte_array(streamer_id, byte_array, mime_type, file_extension)` -> `None` [classmethod] — Send a specified byte array over the WebRTC peer connection data channel. The extension and mime type are used for file ...
  - `streamer_set_player_layer_preference(streamer_id, player_id, spatial_layer_id, temporal_layer_id)` -> `None` [classmethod] — Set the layer preference for a specific player
  - `streamer_unfreeze_stream(streamer_id)` -> `None` [classmethod] — Unfreeze Pixel Streaming.
  - `unfreeze_frame()` -> `None` [classmethod] — Unfreeze Pixel Streaming.

### `unreal.PixelStreamingDelegates`
Inherits: `Object` | Header: `PixelStreamingDelegates.h`

Pixel Streaming Delegates

**Properties** (7):
  - `on_all_connections_closed`: `AllConnectionsClosed` — [Read-Write] (AllConnectionsClosed)
  - `on_closed_connection`: `ClosedConnection` — [Read-Write] (ClosedConnection)
  - `on_connected_to_signalling_server`: `ConnectedToSignallingServer` — [Read-Write] (ConnectedToSignallingServer)
  - `on_disconnected_from_signalling_server`: `DisconnectedFromSignallingServer` — [Read-Write] (DisconnectedFromSignallingServer)
  - `on_fallback_to_software_encodering`: `FallbackToSoftwareEncodering` — [Read-Write] (FallbackToSoftwareEncodering)
  - `on_new_connection`: `NewConnection` — [Read-Write] (NewConnection)
  - `on_stat_changed`: `StatsChanged` — [Read-Write] (StatsChanged)

### `unreal.PixelStreamingInput`
Inherits: `ActorComponent` | Header: `PixelStreamingInputComponent.h`

This component may be attached to an actor to allow UI interactions to be handled as the delegate will be notified about the interaction and will be supplied with a generic descriptor string containin...

**Methods** (3):
  - `add_json_string_value(descriptor, field_name, success=bool)` — Helper function to add a string field to a JSON descriptor. This produces a new descriptor which may then be chained to ...
  - `get_json_string_value(descriptor, success=bool)` — Helper function to extract a string field from a JSON descriptor of a UI interaction given its field name. The field nam...
  - `send_pixel_streaming_response(descriptor)` -> `None` — Send a response back to the source of the UI interactions.

**Properties** (1):
  - `on_input_event`: `OnInput` — [Read-Write] (OnInput)

### `unreal.PixelStreamingMediaIOCapture`
Inherits: `MediaCapture` | Header: `PixelStreamingMediaIOCapture.h`

Pixel Streaming Media IOCapture

### `unreal.PixelStreamingMediaIOOutput`
Inherits: `MediaOutput` | Header: `PixelStreamingVideoInputMediaCapture.h`

Pixel Streaming Media IOOutput

### `unreal.PixelStreamingDelegates_AllConnectionsClosed`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingDelegates.h`

All connections have closed and nobody is viewing or interacting with the app. This is an opportunity to reset the app.

### `unreal.PixelStreamingDelegates_ClosedConnection`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingDelegates.h`

### `unreal.PixelStreamingDelegates_ConnectedToSignallingServer`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingDelegates.h`

### `unreal.PixelStreamingDelegates_DisconnectedFromSignallingServer`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingDelegates.h`

### `unreal.PixelStreamingDelegates_FallbackToSoftwareEncodering`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingDelegates.h`

### `unreal.PixelStreamingDelegates_NewConnection`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingDelegates.h`

### `unreal.PixelStreamingDelegates_StatsChanged`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingDelegates.h`

### `unreal.PixelStreamingInput_OnInput`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingInputComponent.h`

The delegate which will be notified about a UI interaction.
