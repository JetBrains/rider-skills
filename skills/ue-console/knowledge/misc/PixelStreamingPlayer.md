# UE Python API — PixelStreamingPlayer Module

**19 types** from the `PixelStreamingPlayer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PixelStreamingIceCandidateWrapper`, `PixelStreamingRTCConfigWrapper`, `PixelStreamingSessionDescriptionWrapper`, `AsyncAction_GetStreamers`, `PixelStreamingMediaTexture`, `PixelStreamingPeerComponent`, `PixelStreamingSignallingComponent`, `OnStreamerListCompleted`, `PixelStreamingOnIceCandidate`, `PixelStreamingOnIceConnection`, `PixelStreamingOnIceDisconnection`, `PixelStreamingSignallingComponentAnswer`, `PixelStreamingSignallingComponentConfig`, `PixelStreamingSignallingComponentConnected`, `PixelStreamingSignallingComponentConnectionError`, `PixelStreamingSignallingComponentDataChannels`, `PixelStreamingSignallingComponentDisconnected`, `PixelStreamingSignallingComponentIceCandidate`, `PixelStreamingSignallingComponentOffer`

---

## Classes

### `unreal.PixelStreamingIceCandidateWrapper`
Inherits: `StructBase` | Header: `PixelStreamingWebRTCWrappers.h`

A blueprint wrapper for an IceCandidateInterface from webrtc so it can be passed around in blueprints.

### `unreal.PixelStreamingRTCConfigWrapper`
Inherits: `StructBase` | Header: `PixelStreamingWebRTCWrappers.h`

A blueprint wrapper for an RTCConfiguration from webrtc so it can be passed around in blueprints.

### `unreal.PixelStreamingSessionDescriptionWrapper`
Inherits: `StructBase` | Header: `PixelStreamingWebRTCWrappers.h`

A blueprint wrapper for an SessionDescriptionInterface from webrtc so it can be passed around in blueprints.

### `unreal.AsyncAction_GetStreamers`
Inherits: `BlueprintAsyncActionBase` | Header: `AsyncActionGetStreamers.h`

Async Action Get Streamers

**Properties** (1):
  - `completed`: `OnStreamerListCompleted` — [Read-Write] (OnStreamerListCompleted)

### `unreal.PixelStreamingMediaTexture`
Inherits: `Texture2DDynamic` | Header: `PixelStreamingMediaTexture.h`

A Texture Object that can be used in materials etc. that takes updates from webrtc frames.

### `unreal.PixelStreamingPeerComponent`
Inherits: `ActorComponent` | Header: `PixelStreamingPeerComponent.h`

A blueprint representation of a Pixel Streaming Peer Connection. Should communicate with a Pixel Streaming Signalling Connection and will accept video sinks to receive video data.

**Methods** (5):
  - `create_answer(offer)` -> `PixelStreamingSessionDescriptionWrapper` — Creates an answer to the given offer objet that was provided.
  - `create_offer()` -> `PixelStreamingSessionDescriptionWrapper` — Creates an offer.
  - `receive_answer(offer)` -> `None` — Receives an answer from a streamer after weâve sent an offer to receive.
  - `receive_ice_candidate(candidate)` -> `None` — Notify the peer connection of an ICE candidate sent by the singalling connection.
  - `set_config(config)` -> `None` — Sets the RTC Configuration for this Peer Connection.

**Properties** (3):
  - `on_ice_candidate`: `PixelStreamingOnIceCandidate` — [Read-Write] Once negotiation is completed the Peer Connection can generate Ice Candidate objects. T...
  - `on_ice_connection`: `PixelStreamingOnIceConnection` — [Read-Write] Once a connection has been connected and streaming should be available. (PixelStreaming...
  - `on_ice_disconnection`: `PixelStreamingOnIceDisconnection` — [Read-Write] When an ice connection is lost. (PixelStreamingOnIceDisconnection)

### `unreal.PixelStreamingSignallingComponent`
Inherits: `ActorComponent` | Header: `PixelStreamingSignallingComponent.h`

A blueprint class representing a Pixel Streaming Signalling connection. Used to communicate with the signalling server and should route information to the peer connection.

**Methods** (7):
  - `connect(url)` -> `None` — Attempt to connect to a specified signalling server.
  - `disconnect()` -> `None` — Disconnect from the signalling server. No action if no connection exists.
  - `send_answer(answer)` -> `None` — Send an answer created from a Peer Connection to the signalling server.
  - `send_ice_candidate(candidate_wrapper)` -> `None` — Send an Ice Candidate to the signalling server that is generated from a Peer Connection.
  - `send_offer(offer)` -> `None` — Send an offer created from a Peer Connection to the signalling server.
  - `subscribe(streamer_id)` -> `None` — Send a subscribe message to the signalling server to subscribe to a specific streamer.
  - `unsubscribe()` -> `None` — Send an unsubscribe message to the signalling server to unsubscribe from a streamer.

**Properties** (7):
  - `on_answer`: `PixelStreamingSignallingComponentAnswer` — [Read-Write] Fired when the connection receives an answer from the server. The streamer is answering...
  - `on_config`: `PixelStreamingSignallingComponentConfig` — [Read-Write] Fired when the connection receives a config message from the server. This is the earlie...
  - `on_connected`: `PixelStreamingSignallingComponentConnected` — [Read-Write] Fired when the signalling connection is successfully established. (PixelStreamingSignal...
  - `on_connection_error`: `PixelStreamingSignallingComponentConnectionError` — [Read-Write] Fired if the connection failed or an error occurs during the connection. If this is fir...
  - `on_disconnected`: `PixelStreamingSignallingComponentDisconnected` — [Read-Write] Fired when the connection successfully closes. (PixelStreamingSignallingComponentDiscon...
  - `on_ice_candidate`: `PixelStreamingSignallingComponentIceCandidate` — [Read-Write] Fired when the server sends through an ice candidate. Forward this information on to th...
  - `on_offer`: `PixelStreamingSignallingComponentOffer` — [Read-Write] Fired when the connection receives an offer from the server. This means there is media ...

### `unreal.OnStreamerListCompleted`
Inherits: `MulticastDelegateBase` | Header: `AsyncActionGetStreamers.h`

On Streamer List Completed Delegate Signature

### `unreal.PixelStreamingOnIceCandidate`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingPeerComponent.h`

Pixel Streaming on Ice Candidate Delegate Signature

### `unreal.PixelStreamingOnIceConnection`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingPeerComponent.h`

Pixel Streaming on Ice Connection Delegate Signature

### `unreal.PixelStreamingOnIceDisconnection`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingPeerComponent.h`

Pixel Streaming on Ice Disconnection Delegate Signature

### `unreal.PixelStreamingSignallingComponentAnswer`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingSignallingComponent.h`

Pixel Streaming Signalling Component Answer Delegate Signature

### `unreal.PixelStreamingSignallingComponentConfig`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingSignallingComponent.h`

Pixel Streaming Signalling Component Config Delegate Signature

### `unreal.PixelStreamingSignallingComponentConnected`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingSignallingComponent.h`

Pixel Streaming Signalling Component Connected Delegate Signature

### `unreal.PixelStreamingSignallingComponentConnectionError`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingSignallingComponent.h`

Pixel Streaming Signalling Component Connection Error Delegate Signature

### `unreal.PixelStreamingSignallingComponentDataChannels`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingSignallingComponent.h`

Pixel Streaming Signalling Component Data Channels Delegate Signature

### `unreal.PixelStreamingSignallingComponentDisconnected`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingSignallingComponent.h`

Pixel Streaming Signalling Component Disconnected Delegate Signature

### `unreal.PixelStreamingSignallingComponentIceCandidate`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingSignallingComponent.h`

Pixel Streaming Signalling Component Ice Candidate Delegate Signature

### `unreal.PixelStreamingSignallingComponentOffer`
Inherits: `MulticastDelegateBase` | Header: `PixelStreamingSignallingComponent.h`

Pixel Streaming Signalling Component Offer Delegate Signature
