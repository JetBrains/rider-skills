# UE Python API — PixelStreaming2 Module

**21 types** from the `PixelStreaming2` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PixelStreaming2AudioComponent`, `PixelStreaming2Blueprints`, `PixelStreaming2Delegates`, `PixelStreaming2Input`, `PixelStreaming2MediaIOCapture`, `PixelStreaming2MediaIOOutput`, `PixelStreaming2MediaTexture`, `PixelStreaming2StreamerComponent`, `PixelStreaming2VideoComponent`, `PixelStreaming2VideoProducerBase`, `PixelStreaming2VideoProducerRenderTarget`, `PixelStreaming2Delegates_AllConnectionsClosed`, `PixelStreaming2Delegates_ClosedConnection`, `PixelStreaming2Delegates_ConnectedToSignallingServer`, `PixelStreaming2Delegates_DataTrackClosed`, `PixelStreaming2Delegates_DataTrackOpen`, `PixelStreaming2Delegates_DisconnectedFromSignallingServer`, `PixelStreaming2Delegates_FallbackToSoftwareEncoding`, `PixelStreaming2Delegates_NewConnection`, `PixelStreaming2Delegates_StatsChanged`, ... (21 total)

---

## Classes

### `unreal.PixelStreaming2AudioComponent`
Inherits: `SynthComponent` | Header: `PixelStreaming2AudioComponent.h`

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

### `unreal.PixelStreaming2Blueprints`
Inherits: `BlueprintFunctionLibrary` | Header: `PixelStreaming2Blueprints.h`

Pixel Streaming 2Blueprints

**Methods** (20):
  - `add_json_string_value(descriptor, field_name, success=bool)` [classmethod] — Helper function to add a string field to a JSON descriptor. This produces a new descriptor which may then be chained to ...
  - `force_key_frame()` -> `None` [classmethod] — Force a key frame to be sent to the default streamer (if there is one).
  - `freeze_frame(texture)` -> `None` [classmethod] — Freeze the video stream of the default streamer (if there is one).
  - `get_connected_players()` -> `Array [ str ]` [classmethod] — brief: Get the connected players
  - `get_default_streamer_id()` -> `str` [classmethod] — Get the default Streamer ID
  - `get_delegates()` -> `PixelStreaming2Delegates` [classmethod] — Get the singleton. This allows application-specific blueprints to bind to delegates of interest.
  - `get_json_string_value(descriptor, success=bool)` [classmethod] — Helper function to extract a string field from a JSON descriptor of a UI interaction given its field name. The field nam...
  - `kick_player(player_id)` -> `None` [classmethod] — Kick a player that is connected to the default streamer (if there is a default streamer).
  - `send_file(filepath, mime_type, file_extension)` -> `None` [classmethod] — Send a specified file over the WebRTC peer connection data channel. The extension and mime type are used for file recons...
  - `send_file_as_byte_array(byte_array, mime_type, file_extension)` -> `None` [classmethod] — Send a specified byte array over the WebRTC peer connection data channel. The extension and mime type are used for file ...
  - `send_response(descriptor)` -> `None` [classmethod] — Send Response
  - `streamer_force_key_frame(streamer_id)` -> `None` [classmethod] — Force a key frame to be sent to the specified streamer.
  - `streamer_freeze_stream(streamer_id, texture)` -> `None` [classmethod] — Freeze the video stream of the specified video stream.
  - `streamer_get_connected_players(streamer_id)` -> `Array [ str ]` [classmethod] — brief: Get the connected players
  - `streamer_kick_player(streamer_id, player_id)` -> `None` [classmethod] — Kick a player connected to the specified streamer.
  - `streamer_send_file(streamer_id, filepath, mime_type, file_extension)` -> `None` [classmethod] — Send a specified file over the WebRTC peer connection data channel. The extension and mime type are used for file recons...
  - `streamer_send_file_as_byte_array(streamer_id, byte_array, mime_type, file_extension)` -> `None` [classmethod] — Send a specified byte array over the WebRTC peer connection data channel. The extension and mime type are used for file ...
  - `streamer_send_response(streamer_id, descriptor)` -> `None` [classmethod] — Streamer Send Response
  - `streamer_unfreeze_stream(streamer_id)` -> `None` [classmethod] — Unfreeze the video stream of the specified streamer.
  - `unfreeze_frame()` -> `None` [classmethod] — Unfreeze the video stream of the default streamer (if there is one).

### `unreal.PixelStreaming2Delegates`
Inherits: `Object` | Header: `PixelStreaming2Delegates.h`

Pixel Streaming Delegates that can be invoked when pixel streaming events take place. Includes blueprint and native c++ delegates.

**Properties** (9):
  - `on_all_connections_closed`: `AllConnectionsClosed` — [Read-Write] Invoked when all connections have closed and nobody is viewing or interacting with the ...
  - `on_closed_connection`: `ClosedConnection` — [Read-Write] Invoked when a connection to a player was lost. (ClosedConnection)
  - `on_connected_to_signalling_server`: `ConnectedToSignallingServer` — [Read-Write] Invoked when a connection to the signalling server was made. (ConnectedToSignallingServ...
  - `on_data_track_closed`: `DataTrackClosed` — [Read-Write] Invoked when an existing data track has been closed. (DataTrackClosed)
  - `on_data_track_open`: `DataTrackOpen` — [Read-Write] Invoked when a new data track has been opened. (DataTrackOpen)
  - `on_disconnected_from_signalling_server`: `DisconnectedFromSignallingServer` — [Read-Write] Invoked when a connection to the signalling server was lost. (DisconnectedFromSignallin...
  - `on_fallback_to_software_encoding`: `FallbackToSoftwareEncoding` — [Read-Write] Invoked when the GPU ran out of available hardware encoders and fell back to software e...
  - `on_new_connection`: `NewConnection` — [Read-Write] Invoked when a new connection has been made to the session. (NewConnection)
  - `on_stat_changed`: `StatsChanged` — [Read-Write] Invoked when a pixel streaming stat has changed. (StatsChanged)

### `unreal.PixelStreaming2Input`
Inherits: `ActorComponent` | Header: `PixelStreaming2InputComponent.h`

This component may be attached to an actor to allow UI interactions to be handled as the delegate will be notified about the interaction and will be supplied with a generic descriptor string containin...

**Methods** (3):
  - `add_json_string_value(descriptor, field_name, success=bool)` — Helper function to add a string field to a JSON descriptor. This produces a new descriptor which may then be chained to ...
  - `get_json_string_value(descriptor, success=bool)` — Helper function to extract a string field from a JSON descriptor of a UI interaction given its field name. The field nam...
  - `send_pixel_streaming2_response(descriptor)` -> `None` — Send a response back to the source of the UI interactions.

**Properties** (1):
  - `on_input_event`: `OnInput` — [Read-Write] (OnInput)

### `unreal.PixelStreaming2MediaIOCapture`
Inherits: `MediaCapture` | Header: `PixelStreaming2MediaIOCapture.h`

Pixel Streaming 2Media IOCapture

### `unreal.PixelStreaming2MediaIOOutput`
Inherits: `MediaOutput` | Header: `VideoProducerMediaCapture.h`

Pixel Streaming 2Media IOOutput

### `unreal.PixelStreaming2MediaTexture`
Inherits: `Texture2DDynamic` | Header: `PixelStreaming2MediaTexture.h`

A Texture Object that can be used in materials etc. that takes updates from webrtc frames.

### `unreal.PixelStreaming2StreamerComponent`
Inherits: `ActorComponent` | Header: `PixelStreaming2StreamerComponent.h`

Pixel Streaming 2Streamer Component

**Methods** (9):
  - `force_key_frame()` -> `None` — Force Key Frame
  - `freeze_stream(texture)` -> `None` — Freeze Stream
  - `get_id()` -> `str` — Get Id
  - `is_streaming()` -> `bool` — Is Streaming
  - `send_all_players_message(message_type, descriptor)` -> `None` — Send All Players Message
  - `send_player_message(player_id, message_type, descriptor)` -> `None` — Send Player Message
  - `start_streaming()` -> `None` — Start Streaming
  - `stop_streaming()` -> `None` — Stop Streaming
  - `unfreeze_stream()` -> `None` — Unfreeze Stream

### `unreal.PixelStreaming2VideoComponent`
Inherits: `SceneComponent` | Header: `PixelStreaming2VideoComponent.h`

Allows in-engine playback of incoming WebRTC video from a particular Pixel Streaming player/peer using their camera in the browser. Note: Each video component associates itself with a particular Pixel...

**Methods** (4):
  - `is_watching_player()` -> `bool` — True if watching a connected WebRTC peer through Pixel Streaming.
  - `reset()` -> `None` — Stops watching any connected player/peer and resets internal state so component is ready to watch again.
  - `streamer_watch(streamer_id, player_id)` -> `bool` — Watch a specific player. If the player is not found this component wonât produce video.
  - `watch(player_id)` -> `bool` — Watch a specific player on the default streamer. If the player is not found this component wonât produce video.

**Properties** (3):
  - `auto_find_peer`: `bool` — [Read-Write] If not already watching a player/peer will try to attach for watching the âPlayerToWa...
  - `player_to_watch`: `str` — [Read-Write] The Pixel Streaming player/peer whose video we wish to watch.
If this is left blank thi...
  - `streamer_to_watch`: `str` — [Read-Write] The Pixel Streaming streamer of the player that we wish to watch.
If this is left blank...

### `unreal.PixelStreaming2VideoProducerBase`
Inherits: `Object` | Header: `PixelStreaming2VideoProducer.h`

The base video producer blueprint class

### `unreal.PixelStreaming2VideoProducerRenderTarget`
Inherits: `PixelStreaming2VideoProducerBase` | Header: `PixelStreaming2VideoProducer.h`

A video producer that streams the specified render target

**Properties** (1):
  - `target`: `TextureRenderTarget2D` — [Read-Write] (TextureRenderTarget2D)

### `unreal.PixelStreaming2Delegates_AllConnectionsClosed`
Inherits: `MulticastDelegateBase` | Header: `PixelStreaming2Delegates.h`

Blueprint delegate type for when all connections have closed and nobody is viewing or interacting with the app. This is an opportunity to reset the app.

### `unreal.PixelStreaming2Delegates_ClosedConnection`
Inherits: `MulticastDelegateBase` | Header: `PixelStreaming2Delegates.h`

Blueprint delegate type for when a connection to a player was lost.

### `unreal.PixelStreaming2Delegates_ConnectedToSignallingServer`
Inherits: `MulticastDelegateBase` | Header: `PixelStreaming2Delegates.h`

Blueprint delegate type for when a connection to the signalling server was made.

### `unreal.PixelStreaming2Delegates_DataTrackClosed`
Inherits: `MulticastDelegateBase` | Header: `PixelStreaming2Delegates.h`

Blueprint delegate type for when an existing data track has been closed.

### `unreal.PixelStreaming2Delegates_DataTrackOpen`
Inherits: `MulticastDelegateBase` | Header: `PixelStreaming2Delegates.h`

Blueprint delegate type for when a new data track has been opened.

### `unreal.PixelStreaming2Delegates_DisconnectedFromSignallingServer`
Inherits: `MulticastDelegateBase` | Header: `PixelStreaming2Delegates.h`

Blueprint delegate type for when a connection to the signalling server was lost.

### `unreal.PixelStreaming2Delegates_FallbackToSoftwareEncoding`
Inherits: `MulticastDelegateBase` | Header: `PixelStreaming2Delegates.h`

Blueprint delegate type for when the GPU ran out of available hardware encoders and fell back to software encoders.

### `unreal.PixelStreaming2Delegates_NewConnection`
Inherits: `MulticastDelegateBase` | Header: `PixelStreaming2Delegates.h`

Blueprint delegate type for when a new connection has been made to the session.

### `unreal.PixelStreaming2Delegates_StatsChanged`
Inherits: `MulticastDelegateBase` | Header: `PixelStreaming2Delegates.h`

Blueprint delegate type for when a pixel streaming stat has changed.

### `unreal.PixelStreaming2Input_OnInput`
Inherits: `MulticastDelegateBase` | Header: `PixelStreaming2InputComponent.h`

The delegate which will be notified about a UI interaction.
