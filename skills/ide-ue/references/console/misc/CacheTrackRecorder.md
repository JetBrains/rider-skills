# UE Python API — CacheTrackRecorder Module

**2 types** from the `CacheTrackRecorder` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CacheTrackRecorder`, `CacheTrackRecorderState`

---

## Classes

### `unreal.CacheTrackRecorder`
Inherits: `Object` | Header: `CacheTrackRecorder.h`

Cache Track Recorder

**Methods** (2):
  - `get_sequence()` -> `LevelSequence` — Access the sequence asset that this recorder is recording into
  - `get_state()` -> `CacheTrackRecorderState` — Get the current state of this recorder

### `unreal.CacheTrackRecorderState`
Inherits: `EnumBase` | Header: `CacheTrackRecorder.h`

ECache Track Recorder State

**Properties** (6):
  - `CANCELLED`: `CacheTrackRecorderState = Ellipsis` — 5
  - `PRE_RECORD`: `CacheTrackRecorderState = Ellipsis` — 1
  - `STARTED`: `CacheTrackRecorderState = Ellipsis` — 3
  - `STARTING`: `CacheTrackRecorderState = Ellipsis` — 0
  - `STOPPED`: `CacheTrackRecorderState = Ellipsis` — 4
  - `TICKING_AFTER_PRE`: `CacheTrackRecorderState = Ellipsis` — 2
