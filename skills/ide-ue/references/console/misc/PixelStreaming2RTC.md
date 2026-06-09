# UE Python API — PixelStreaming2RTC Module

**2 types** from the `PixelStreaming2RTC` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PixelStreaming2Peer`, `PixelStreamingStreamerList`

---

## Classes

### `unreal.PixelStreaming2Peer`
Inherits: `SynthComponent` | Header: `PixelStreaming2Peer.h`

UCLASS(Blueprintable, ClassGroup = (PixelStreaming2), meta = (BlueprintSpawnableComponent))

**Methods** (3):
  - `connect(url)` -> `bool` — Attempt to connect to a specified signalling server.
  - `disconnect()` -> `bool` — Disconnect from the signalling server. No action if no connection exists.
  - `subscribe(streamer_id)` -> `bool` — Subscribe this peer to the streams provided by the specified streamer.

**Properties** (1):
  - `on_streamer_list`: `PixelStreamingStreamerList` — [Read-Write] Fired when the connection the list of available streams from the server. (PixelStreamin...

### `unreal.PixelStreamingStreamerList`
Inherits: `MulticastDelegateBase` | Header: `PixelStreaming2Peer.h`

Pixel Streaming Streamer List Delegate Signature
