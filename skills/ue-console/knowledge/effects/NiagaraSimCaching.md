# UE Python API — NiagaraSimCaching Module

**5 types** from the `NiagaraSimCaching` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MovieSceneNiagaraCacheParams`, `MovieSceneNiagaraCacheSection`, `MovieSceneNiagaraCacheTrack`, `NiagaraSimCacheSectionPlayMode`, `NiagaraSimCacheSectionStretchMode`

---

## Classes

### `unreal.MovieSceneNiagaraCacheParams`
Inherits: `MovieSceneBaseCacheParams` | Header: `MovieSceneNiagaraCacheSection.h`

Movie Scene Niagara Cache Params

### `unreal.MovieSceneNiagaraCacheSection`
Inherits: `MovieSceneBaseCacheSection` | Header: `MovieSceneNiagaraCacheSection.h`

Movie scene section that control NiagaraCache playback

### `unreal.MovieSceneNiagaraCacheTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneNiagaraCacheTrack.h`

Handles animation of NiagaraCache

### `unreal.NiagaraSimCacheSectionPlayMode`
Inherits: `EnumBase` | Header: `MovieSceneNiagaraCacheSection.h`

ENiagara Sim Cache Section Play Mode

**Properties** (2):
  - `DISPLAY_CACHE_ONLY`: `NiagaraSimCacheSectionPlayMode = Ellipsis` — When the sequence has no cached data to display, the Niagara component is disabled 1
  - `SIM_WITHOUT_CACHE`: `NiagaraSimCacheSectionPlayMode = Ellipsis` — When the sequence has no cached data to display, the Niagara component runs the simulation normally ...

### `unreal.NiagaraSimCacheSectionStretchMode`
Inherits: `EnumBase` | Header: `MovieSceneNiagaraCacheSection.h`

ENiagara Sim Cache Section Stretch Mode

**Properties** (2):
  - `REPEAT`: `NiagaraSimCacheSectionStretchMode = Ellipsis` — When the cache section is stretched in the track it will repeat the cached data 0
  - `TIME_DILATE`: `NiagaraSimCacheSectionStretchMode = Ellipsis` — When the cache section is stretched in the track it will dilate the input time so the cached data is...
