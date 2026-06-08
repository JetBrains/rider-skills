# UE Python API — Sequencer Module

**12 types** from the `Sequencer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ColumnVisibilitySetting`, `MovieScenePasteBindingsParams`, `MovieScenePasteFoldersParams`, `MovieScenePasteSectionsParams`, `MovieScenePasteTracksParams`, `SequencerKeyActor`, `SequencerMeshTrail`, `SequencerModuleOutlinerScriptingObject`, `SequencerModuleScriptingLayer`, `MotionTrailTrailStyle`, `NavigationToolItemViewMode`, `SequencerLoopMode`

---

## Classes

### `unreal.ColumnVisibilitySetting`
Inherits: `StructBase` | Header: `SequencerSettings.h`

Struct for storing reorderable and hidden/visible outliner columns

### `unreal.MovieScenePasteBindingsParams`
Inherits: `StructBase` | Header: `SequencerUtilities.h`

Paste bindings params

**Properties** (5):
  - `bindings`: `None` — [Read-Write] (Array[MovieSceneBindingProxy])
  - `duplicate_existing_actors`: `bool` — [Read-Write] (bool)
  - `folders`: `None` — [Read-Write] (Array[MovieSceneFolder])
  - `parent_folder`: `MovieSceneFolder` — [Read-Write] (MovieSceneFolder)
  - `pasted_actors`: `None` — [Read-Write] (Map[Name,Actor])

### `unreal.MovieScenePasteFoldersParams`
Inherits: `StructBase` | Header: `SequencerUtilities.h`

Paste folders params

**Properties** (2):
  - `parent_folder`: `MovieSceneFolder` — [Read-Write] (MovieSceneFolder)
  - `sequence`: `MovieSceneSequence` — [Read-Write] (MovieSceneSequence)

### `unreal.MovieScenePasteSectionsParams`
Inherits: `StructBase` | Header: `SequencerUtilities.h`

Paste sections params

**Properties** (3):
  - `time`: `FrameTime` — [Read-Write] (FrameTime)
  - `track_row_indices`: `None` — [Read-Write] (Array[int32])
  - `tracks`: `None` — [Read-Write] (Array[MovieSceneTrack])

### `unreal.MovieScenePasteTracksParams`
Inherits: `StructBase` | Header: `SequencerUtilities.h`

Paste tracks params

**Properties** (4):
  - `bindings`: `None` — [Read-Write] (Array[MovieSceneBindingProxy])
  - `folders`: `None` — [Read-Write] (Array[MovieSceneFolder])
  - `parent_folder`: `MovieSceneFolder` — [Read-Write] (MovieSceneFolder)
  - `sequence`: `MovieSceneSequence` — [Read-Write] (MovieSceneSequence)

### `unreal.SequencerKeyActor`
Inherits: `Actor` | Header: `SequencerKeyActor.h`

Sequencer Key Actor

### `unreal.SequencerMeshTrail`
Inherits: `Actor` | Header: `SequencerMeshTrail.h`

Sequencer Mesh Trail

### `unreal.SequencerModuleOutlinerScriptingObject`
Inherits: `SequencerOutlinerScriptingObject` | Header: `SequencerModuleOutlinerScriptingObject.h`

Sequencer Module Outliner Scripting Object

**Methods** (3):
  - `get_next_key(nodes, frame_number, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameNumber` — Get Next Key
  - `get_previous_key(nodes, frame_number, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `FrameNumber` — Get Previous Key
  - `get_sections(nodes)` -> `Array [ MovieSceneSection ]` — Get Sections

### `unreal.SequencerModuleScriptingLayer`
Inherits: `SequencerScriptingLayer` | Header: `SequencerModuleScriptingLayer.h`

Sequencer Module Scripting Layer

**Methods** (1):
  - `get_outliner()` -> `SequencerModuleOutlinerScriptingObject` — Retrieve the outliner

### `unreal.MotionTrailTrailStyle`
Inherits: `EnumBase` | Header: `MotionTrailOptions.h`

EMotion Trail Trail Style

**Properties** (4):
  - `DASHED`: `MotionTrailTrailStyle = Ellipsis` — 1
  - `DEFAULT`: `MotionTrailTrailStyle = Ellipsis` — 0
  - `HEAT_MAP`: `MotionTrailTrailStyle = Ellipsis` — 3
  - `TIME`: `MotionTrailTrailStyle = Ellipsis` — 2

### `unreal.NavigationToolItemViewMode`
Inherits: `EnumBase` | Header: `NavigationToolSettings.h`

The type of visualization being done to the item

**Properties** (3):
  - `ALL`: `NavigationToolItemViewMode = Ellipsis` — All the Views 3
  - `HORIZONTAL_ITEM_LIST`: `NavigationToolItemViewMode = Ellipsis` — Flattened Horizontal List of Nested Items shown in the âItemsâ column 2
  - `ITEM_TREE`: `NavigationToolItemViewMode = Ellipsis` — Navigation Tool Tree Hierarchy View of the Items 1

### `unreal.SequencerLoopMode`
Inherits: `EnumBase` | Header: `SequencerSettings.h`

ESequencer Loop Mode

**Properties** (3):
  - `SLM_LOOP`: `SequencerLoopMode = Ellipsis` — Loop Playback Range. 1
  - `SLM_LOOP_SELECTION_RANGE`: `SequencerLoopMode = Ellipsis` — Loop Selection Range. 2
  - `SLM_NO_LOOP`: `SequencerLoopMode = Ellipsis` — No Looping. 0
