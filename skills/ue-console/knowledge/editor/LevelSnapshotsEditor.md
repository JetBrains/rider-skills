# UE Python API — LevelSnapshotsEditor Module

**8 types** from the `LevelSnapshotsEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ConjunctionFilter`, `LevelSnapshotBlueprintFilterFactory`, `LevelSnapshotEditorFactory`, `LevelSnapshotsEditorFunctionLibrary`, `LevelSnapshotsEditorSettings`, `LevelSnapshotsFilterPreset`, `NegatableFilter`, `FilterBehavior`

---

## Classes

### `unreal.ConjunctionFilter`
Inherits: `LevelSnapshotFilter` | Header: `ConjunctionFilter.h`

Returns the result of and-ing all child filters. It is valid to have no children: in this case, this filter return false.

### `unreal.LevelSnapshotBlueprintFilterFactory`
Inherits: `Factory` | Header: `LevelSnapshotFilterFactory.h`

Level Snapshot Blueprint Filter Factory

### `unreal.LevelSnapshotEditorFactory`
Inherits: `Factory` | Header: `LevelSnapshotEditorFactory.h`

Level Snapshot Editor Factory

### `unreal.LevelSnapshotsEditorFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LevelSnapshotsEditorFunctionLibrary.h`

Level Snapshots Editor Function Library

**Methods** (3):
  - `generate_thumbnail_for_snapshot_asset(snapshot_package)` -> `None` [classmethod] — If the snapshot is saved in the registry, takes a screenshot of the editor scene and sets it as thumnail for the snapsho...
  - `take_and_save_level_snapshot_editor_world(file_name, folder_path, description)` -> `None` [classmethod] — Uses TakeLevelSnapshotAndSaveToDisk() and assumes Editor World
  - `take_level_snapshot_and_save_to_disk(world_context_object, file_name, folder_path, description, should_create_unique_file_name = True)` -> `LevelSnapshot` [classmethod] — brief: Creates a new Level Snapshot asset in the content browser and then captures the target world

### `unreal.LevelSnapshotsEditorSettings`
Inherits: `Object` | Header: `LevelSnapshotsEditorSettings.h`

Level Snapshots Editor Settings

**Methods** (1):
  - `parse_level_snapshots_tokens_in_text(text_to_parse, world_name)` -> `Text` [classmethod] — Parse Level Snapshots Tokens in Text

### `unreal.LevelSnapshotsFilterPreset`
Inherits: `LevelSnapshotFilter` | Header: `LevelSnapshotsFilterPreset.h`

Manages logic for combining filters in the editor. This filter may have no children: in this case, the filter returns true. Disjunctive normal form = ORs of ANDs. Example: (a && !b) || (c && d) || e

### `unreal.NegatableFilter`
Inherits: `LevelSnapshotFilter` | Header: `NegatableFilter.h`

Calls a child filter and possibly negates its results.

### `unreal.FilterBehavior`
Inherits: `EnumBase` | Header: `NegatableFilter.h`

EFilter Behavior

**Properties** (2):
  - `DO_NOT_NEGATE`: `FilterBehavior = Ellipsis` — Pass on same result 0
  - `NEGATE`: `FilterBehavior = Ellipsis` — Invert the result 1
