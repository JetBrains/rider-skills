# UE Python API — CinematicPrestreaming Module

**5 types** from the `CinematicPrestreaming` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CinePrestreamingNaniteData`, `CinePrestreamingVTData`, `CinePrestreamingData`, `MovieSceneCinePrestreamingSection`, `MovieSceneCinePrestreamingTrack`

---

## Classes

### `unreal.CinePrestreamingNaniteData`
Inherits: `StructBase` | Header: `CinePrestreamingData.h`

Cine Prestreaming Nanite Data

### `unreal.CinePrestreamingVTData`
Inherits: `StructBase` | Header: `CinePrestreamingData.h`

Cine Prestreaming VTData

### `unreal.CinePrestreamingData`
Inherits: `Object` | Header: `CinePrestreamingData.h`

Cine Prestreaming Data

### `unreal.MovieSceneCinePrestreamingSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneCinePrestreamingSection.h`

Movie Scene Section representing a Prestreaming asset.

**Methods** (5):
  - `get_prestreaming_asset()` -> `CinePrestreamingData` — Get the prestreaming asset soft pointer. Use for async loading.
  - `get_quality_level()` -> `int32` — If MovieScene.PreStream.QualityLevel is less than this then discard this section at runtime.
  - `set_prestreaming_asset(data)` -> `None` — Set Prestreaming Asset
  - `set_quality_level(level)` -> `None` — Set Quality Level
  - `set_start_frame_offset(offset)` -> `None` — Set Start Frame Offset

**Properties** (3):
  - `prestreaming_asset`: `CinePrestreamingData` — [Read-Write] The asset containing cinematic prestreaming data to use for this section. (CinePrestrea...
  - `quality_level`: `int` — [Read-Write] If If MovieScene.PreStream.QualityLevel is less than this then discard this section at ...
  - `start_frame_offset`: `int` — [Read-Write] Number of frames by which to offset the evaluation. Larger values cause prestreaming to...

### `unreal.MovieSceneCinePrestreamingTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneCinePrestreamingTrack.h`

A track that controls playback of streaming triggers for some rendering systems. This is to ensure that data is available before use where by default for systems like virtual texture and nanite stream...
