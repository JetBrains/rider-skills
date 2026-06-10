# UE Python API — PixelStreamingBlueprint Module

**3 types** from the `PixelStreamingBlueprint` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PixelStreamingStreamerComponent`, `PixelStreamingStreamerVideoInput`, `PixelStreamingStreamerVideoInputRenderTarget`

---

## Classes

### `unreal.PixelStreamingStreamerComponent`
Inherits: `ActorComponent` | Header: `PixelStreamingStreamerComponent.h`

Pixel Streaming Streamer Component

**Methods** (9):
  - `force_key_frame()` -> `None` — Force Key Frame
  - `freeze_stream(texture)` -> `None` — Freeze Stream
  - `get_id()` -> `str` — Get Id
  - `is_signalling_connected()` -> `bool` — Is Signalling Connected
  - `is_streaming()` -> `bool` — Is Streaming
  - `send_player_message(type, descriptor)` -> `None` — Send Player Message
  - `start_streaming()` -> `None` — Start Streaming
  - `stop_streaming()` -> `None` — Stop Streaming
  - `unfreeze_stream()` -> `None` — Unfreeze Stream

### `unreal.PixelStreamingStreamerVideoInput`
Inherits: `Object` | Header: `PixelStreamingStreamerVideoInput.h`

Pixel Streaming Streamer Video Input

### `unreal.PixelStreamingStreamerVideoInputRenderTarget`
Inherits: `PixelStreamingStreamerVideoInput` | Header: `PixelStreamingStreamerVideoInputRenderTarget.h`

Pixel Streaming Streamer Video Input Render Target

**Properties** (1):
  - `target`: `TextureRenderTarget2D` — [Read-Write] (TextureRenderTarget2D)
