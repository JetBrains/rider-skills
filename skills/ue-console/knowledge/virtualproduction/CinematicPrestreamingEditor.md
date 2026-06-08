# UE Python API — CinematicPrestreamingEditor Module

**7 types** from the `CinematicPrestreamingEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CinePrestreamingGenerateAssetArgs`, `MoviePipelineCinePrestreamingGeneratedData`, `CinePrestreamingDebugRender`, `CinePrestreamingEditorSubsystem`, `CinePrestreamingRecorderSetting`, `OnCinePrestreamingGenerateAsset`, `OnCinePrestreamingGenerateData`

---

## Classes

### `unreal.CinePrestreamingGenerateAssetArgs`
Inherits: `StructBase` | Header: `CinePrestreamingEditorSubsystem.h`

Cine Prestreaming Generate Asset Args

**Properties** (4):
  - `map`: `SoftObjectPath` — [Read-Write] (SoftObjectPath)
  - `output_directory_override`: `DirectoryPath` — [Read-Write] (DirectoryPath)
  - `resolution`: `IntPoint` — [Read-Write] (IntPoint)
  - `sequence`: `SoftObjectPath` — [Read-Write] (SoftObjectPath)

### `unreal.MoviePipelineCinePrestreamingGeneratedData`
Inherits: `StructBase` | Header: `CinePrestreamingRecorderSetting.h`

Movie Pipeline Cine Prestreaming Generated Data

**Properties** (4):
  - `asset_name`: `str` — [Read-Write] (str)
  - `movie_scene`: `MovieScene` — [Read-Write] (MovieScene)
  - `package_path`: `str` — [Read-Write] (str)
  - `streaming_data`: `CinePrestreamingData` — [Read-Write] (CinePrestreamingData)

### `unreal.CinePrestreamingDebugRender`
Inherits: `MoviePipelineDeferredPassBase` | Header: `CinePrestreamingDebugRender.h`

Cine Prestreaming Debug Render

### `unreal.CinePrestreamingEditorSubsystem`
Inherits: `EditorSubsystem` | Header: `CinePrestreamingEditorSubsystem.h`

Cine Prestreaming Editor Subsystem

**Methods** (3):
  - `create_packages_from_generated_data()` -> `Array [ MoviePipelineCinePrestreamingGeneratedData ]` — Create Packages from Generated Data
  - `generate_prestreaming_asset(args)` -> `None` — Generate Prestreaming Asset
  - `is_rendering()` -> `bool` — Is Rendering

**Properties** (1):
  - `on_asset_generated`: `OnCinePrestreamingGenerateAsset` — [Read-Write] (OnCinePrestreamingGenerateAsset)

### `unreal.CinePrestreamingRecorderSetting`
Inherits: `MoviePipelineOutputBase` | Header: `CinePrestreamingRecorderSetting.h`

Cine Prestreaming Recorder Setting

**Properties** (8):
  - `disable_advance_render_features`: `bool` — [Read-Write] By default we disable any render features that arenât needed to generate the prestrea...
  - `end_frame`: `int` — [Read-Write] Last frame to capture in each recorded asset. Frames after this are dropped. (Set to 0 ...
  - `modify_target_sequence`: `bool` — [Read-Write] Automatically add the generated tracks to the target sequence (bool)
  - `nanite`: `bool` — [Read-Write] Enable capture of nanite requests. (bool)
  - `on_generate_data`: `OnCinePrestreamingGenerateData` — [Read-Write] (OnCinePrestreamingGenerateData)
  - `package_directory`: `DirectoryPath` — [Read-Write] * Specifies which directory the generated assets be placed in. Assumed to be relative t...
  - `start_frame`: `int` — [Read-Write] First frame to output in each recorded asset. Frames before this are dropped. (int32)
  - `virtual_textures`: `bool` — [Read-Write] Enable capture of virtual texture page requests. (bool)

### `unreal.OnCinePrestreamingGenerateAsset`
Inherits: `MulticastDelegateBase` | Header: `CinePrestreamingEditorSubsystem.h`

On Cine Prestreaming Generate Asset Delegate Signature

### `unreal.OnCinePrestreamingGenerateData`
Inherits: `MulticastDelegateBase` | Header: `CinePrestreamingRecorderSetting.h`

On Cine Prestreaming Generate Data Delegate Signature
