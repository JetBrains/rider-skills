# UE Python API — ChaosCachingEditor Module

**3 types** from the `ChaosCachingEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CacheCollectionFactory`, `MovieSceneChaosCacheTrackRecorder`, `TakeRecorderChaosCacheSource`

---

## Classes

### `unreal.CacheCollectionFactory`
Inherits: `Factory` | Header: `CacheCollectionFactory.h`

Cache Collection Factory

### `unreal.MovieSceneChaosCacheTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieSceneChaosCacheTrackRecorder.h`

Track recorder implementation for the chaos cache

### `unreal.TakeRecorderChaosCacheSource`
Inherits: `TakeRecorderSource` | Header: `TakeRecorderChaosCacheSource.h`

A recording source selector for the chaos integration into take recorder

**Properties** (1):
  - `chaos_cache_manager`: `ChaosCacheManager` — [Read-Write] Chaos Cache manager to be used as take recorder source (ChaosCacheManager)
