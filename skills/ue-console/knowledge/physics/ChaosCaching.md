# UE Python API — ChaosCaching Module

**14 types** from the `ChaosCaching` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CacheSpawnableTemplate`, `MovieSceneChaosCacheParams`, `ObservedComponent`, `ChaosCache`, `ChaosCacheCollection`, `ChaosCacheData`, `ChaosCacheManager`, `ChaosCachePlayer`, `MovieSceneChaosCacheSection`, `MovieSceneChaosCacheTrack`, `MovieSceneSpawnableChaosCacheBinding`, `CacheMode`, `ChaosCacheInterpolationMode`, `StartMode`

---

## Classes

### `unreal.CacheSpawnableTemplate`
Inherits: `StructBase` | Header: `ChaosCache.h`

Cache Spawnable Template

### `unreal.MovieSceneChaosCacheParams`
Inherits: `MovieSceneBaseCacheParams` | Header: `MovieSceneChaosCacheSection.h`

Movie Scene Chaos Cache Params

### `unreal.ObservedComponent`
Inherits: `StructBase` | Header: `CacheManagerActor.h`

Observed Component

**Properties** (5):
  - `cache_name`: `Name` — [Read-Write] Unique name for the cache, used as a key into the cache collection (Name)
  - `is_simulating`: `bool` [Read-Only] — [Read-Only] Capture of the initial state of the component before cache manager takes control. (bool)
  - `playback_enabled`: `bool` — [Read-Write] Whether this component is enabled for playback, this allow a cache to hold many compone...
  - `soft_component_ref`: `SoftComponentReference` — [Read-Write] The component observed by this object for either playback or recording (SoftComponentRe...
  - `usd_cache_directory`: `DirectoryPath` — [Read-Write] USD cache directory, if supported for this simulated structure type. (DirectoryPath)

### `unreal.ChaosCache`
Inherits: `Object` | Header: `ChaosCache.h`

Chaos Cache

### `unreal.ChaosCacheCollection`
Inherits: `Object` | Header: `CacheCollection.h`

Chaos Cache Collection

### `unreal.ChaosCacheData`
Inherits: `Interface` | Header: `ChaosCache.h`

Chaos Cache Data

### `unreal.ChaosCacheManager`
Inherits: `Actor` | Header: `CacheManagerActor.h`

Chaos Cache Manager

**Methods** (9):
  - `enable_playback(index, enable)` -> `None` — Enable playback for a specific component using its index in the list of observed component
  - `enable_playback_by_cache(cache_name, enable)` -> `None` — Enable playback for a specific component using its cache name
  - `reset_all_component_transforms()` -> `None` — Resets all components back to the world space transform they had when the cache for them was originally recorded if one ...
  - `reset_single_transform(index)` -> `None` — Resets the component at the specified index in the observed list back to the world space transform it had when the cache...
  - `set_cache_collection(cache_collection)` -> `None` — change the cache collection for this player if the cache is playing or recording this will have no effect
  - `set_current_time(current_time)` -> `None` — Set Current Time
  - `trigger_all()` -> `None` — Triggers the recording or playback of all observed components
  - `trigger_component(component)` -> `None` — Triggers a component to play or record. If the cache manager has an observed component entry for InComponent and it is a...
  - `trigger_component_by_cache(cache_name)` -> `None` — Triggers a component to play or record. Searches the observed component list for an entry matching InCacheName and trigg...

**Properties** (1):
  - `start_time`: `float` — [Read-Write] Defines the (random access) time that represents the rest pose of the components manage...

### `unreal.ChaosCachePlayer`
Inherits: `ChaosCacheManager` | Header: `CacheManagerActor.h`

Chaos Cache Player

### `unreal.MovieSceneChaosCacheSection`
Inherits: `MovieSceneBaseCacheSection` | Header: `MovieSceneChaosCacheSection.h`

Movie scene section that control ChaosCache playback

### `unreal.MovieSceneChaosCacheTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneChaosCacheTrack.h`

Handles animation of ChaosCache

### `unreal.MovieSceneSpawnableChaosCacheBinding`
Inherits: `MovieSceneSpawnableActorBinding` | Header: `MovieSceneSpawnableChaosCacheBinding.h`

An override of UMovieSceneSpawnableActorBinding that adds some custom behavior on Spawn

### `unreal.CacheMode`
Inherits: `EnumBase` | Header: `CacheManagerActor.h`

ECache Mode

**Properties** (3):
  - `NONE`: `CacheMode = Ellipsis` — 0
  - `PLAY`: `CacheMode = Ellipsis` — 1
  - `RECORD`: `CacheMode = Ellipsis` — 2

### `unreal.ChaosCacheInterpolationMode`
Inherits: `EnumBase` | Header: `ChaosCacheInterpolationMode.h`

EChaos Cache Interpolation Mode

**Properties** (3):
  - `DUAL_QUAT_INTERP`: `ChaosCacheInterpolationMode = Ellipsis` — Dual quaternion interpolation, follows helix or screw-motion path between keyframes. 2
  - `EULER_INTERP`: `ChaosCacheInterpolationMode = Ellipsis` — Rotor or Euler Angle interpolation. 1
  - `QUAT_INTERP`: `ChaosCacheInterpolationMode = Ellipsis` — Shortest Path or Quaternion interpolation for the rotation. 0

### `unreal.StartMode`
Inherits: `EnumBase` | Header: `CacheManagerActor.h`

EStart Mode

**Properties** (2):
  - `TIMED`: `StartMode = Ellipsis` — 0
  - `TRIGGERED`: `StartMode = Ellipsis` — 1
