# UE Python API — SharedMemoryMedia Module

**4 types** from the `SharedMemoryMedia` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SharedMemoryMediaCapture`, `SharedMemoryMediaOutput`, `SharedMemoryMediaSource`, `SharedMemoryMediaSourceMode`

---

## Classes

### `unreal.SharedMemoryMediaCapture`
Inherits: `MediaCapture` | Header: `SharedMemoryMediaCapture.h`

Output Media for SharedMemory.

### `unreal.SharedMemoryMediaOutput`
Inherits: `MediaOutput` | Header: `SharedMemoryMediaOutput.h`

Output information for a SharedMemory media capture.

**Properties** (3):
  - `cross_gpu`: `bool` — [Read-Write] If checked, the texture will be shared across different GPUs. Disable if not needed for...
  - `invert_alpha`: `bool` — [Read-Write] If checked, the alpha channel of the texture will be inverted (bool)
  - `unique_name`: `str` — [Read-Write] Shared memory will be opened by using this name. Should be unique per media output. (st...

### `unreal.SharedMemoryMediaSource`
Inherits: `MediaSource` | Header: `SharedMemoryMediaSource.h`

Media source for SharedMemory streams.

**Properties** (3):
  - `mode`: `SharedMemoryMediaSourceMode` — [Read-Write] Mode of operation when receiving data.
Framelocked - Matches source and local frame num...
  - `unique_name`: `str` — [Read-Write] Shared memory will be found by using this name. Should match the media output setting. ...
  - `zero_latency`: `bool` — [Read-Write] Zero latency option to wait for the cross gpu texture rendered on the same frame. May a...

### `unreal.SharedMemoryMediaSourceMode`
Inherits: `EnumBase` | Header: `SharedMemoryMediaSource.h`

Mode of operation when receiving data. Framelocked - Matches source and local frame numbers. Always use this mode in nDisplay. Genlocked - It doesnât match frame numbers, but it also doesnât skip ...

**Properties** (3):
  - `FRAMELOCKED`: `SharedMemoryMediaSourceMode = Ellipsis` — 0
  - `FREERUN`: `SharedMemoryMediaSourceMode = Ellipsis` — It doesnât match frame numbers, but it also doesnât skip frames, so will hold back the sender if...
  - `GENLOCKED`: `SharedMemoryMediaSourceMode = Ellipsis` — Matches source and local frame numbers. Always use this mode in nDisplay. 1
