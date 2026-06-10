# UE Python API — DMXEditor Module

**7 types** from the `DMXEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AddAllPatchesButton`, `DMXEditorFactoryNew`, `DMXGDTFFactory`, `DMXLibraryFactory`, `DMXLibraryFromMVRFactory`, `MovieSceneDMXLibraryTrackRecorder`, `TakeRecorderDMXLibrarySource`

---

## Classes

### `unreal.AddAllPatchesButton`
Inherits: `StructBase` | Header: `TakeRecorderDMXLibrarySource.h`

Empty struct to have it customized in DetailsView to display a button on the DMX Take Recorder properties. This is a required hack to customize the properties in the TakeRecorder DetailsView because i...

### `unreal.DMXEditorFactoryNew`
Inherits: `Factory` | Header: `DMXEditorFactoryNew.h`

DMXEditor Factory New

### `unreal.DMXGDTFFactory`
Inherits: `Factory` | Header: `DMXGDTFFactory.h`

### `unreal.DMXLibraryFactory`
Inherits: `Factory` | Header: `DMXLibraryFactory.h`

DMXLibrary Factory

### `unreal.DMXLibraryFromMVRFactory`
Inherits: `Factory` | Header: `DMXLibraryFromMVRFactory.h`

DMXLibrary from MVRFactory

### `unreal.MovieSceneDMXLibraryTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieSceneDMXLibraryTrackRecorder.h`

Track recorder implementation for DMX libraries Reuses logic of Animation/LiveLink Plugin in many areas.

### `unreal.TakeRecorderDMXLibrarySource`
Inherits: `TakeRecorderSource` | Header: `TakeRecorderDMXLibrarySource.h`

A recording source for DMX data related to a DMX Library

**Methods** (1):
  - `add_all_patches()` -> `None` — Adds all Patches from the active DMX Library as recording sources

**Properties** (3):
  - `dmx_library`: `DMXLibrary` — [Read-Write] DMX Library to record Patchesâ Fixture Functions from (DMXLibrary)
  - `fixture_patch_refs`: `None` — [Read-Write] The Fixture Patches to record from the selected Library (Array[DMXEntityFixturePatchRef...
  - `record_normalized_values`: `bool` — [Read-Write] If true, all values are recorded as normalized values (0.0 to 1.0). If false, values ar...
