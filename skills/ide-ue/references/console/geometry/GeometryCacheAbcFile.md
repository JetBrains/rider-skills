# UE Python API — GeometryCacheAbcFile Module

**3 types** from the `GeometryCacheAbcFile` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GeometryCacheAbcFileActor`, `GeometryCacheAbcFileComponent`, `GeometryCacheTrackAbcFile`

---

## Classes

### `unreal.GeometryCacheAbcFileActor`
Inherits: `Actor` | Header: `GeometryCacheAbcFileActor.h`

GeometryCacheAbcFile actor serves as a placeable actor for GeometryCache loading from an Alembic file

### `unreal.GeometryCacheAbcFileComponent`
Inherits: `GeometryCacheComponent` | Header: `GeometryCacheAbcFileComponent.h`

GeometryCacheAbcFileComponent, encapsulates a transient GeometryCache asset instance that fetches its data from an Alembic file and implements functionality for rendering and playback

**Properties** (5):
  - `conversion_settings`: `AbcConversionSettings` — [Read-Write] (AbcConversionSettings)
  - `geometry_cache_settings`: `AbcGeometryCacheSettings` — [Read-Write] (AbcGeometryCacheSettings)
  - `material_settings`: `AbcMaterialSettings` — [Read-Write] (AbcMaterialSettings)
  - `normal_generation_settings`: `AbcNormalGenerationSettings` — [Read-Write] (AbcNormalGenerationSettings)
  - `sampling_settings`: `AbcSamplingSettings` — [Read-Write] (AbcSamplingSettings)

### `unreal.GeometryCacheTrackAbcFile`
Inherits: `GeometryCacheTrack` | Header: `GeometryCacheTrackAbcFile.h`

GeometryCacheTrack for Alembic file querying
