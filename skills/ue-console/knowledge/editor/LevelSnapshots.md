# UE Python API — LevelSnapshots Module

**18 types** from the `LevelSnapshots` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ExternalReferenceDummy`, `LevelSnapshotEvent_Blueprint`, `PostApplySnapshotEventData_Blueprint`, `PostTakeSnapshotEventData_Blueprint`, `PreApplySnapshotEventData_Blueprint`, `PreTakeSnapshotEventData_Blueprint`, `ActorWithReferencesInCDO`, `LevelSnapshot`, `LevelSnapshotsEngineSubsystem`, `LevelSnapshotsFunctionLibrary`, `SnapshotTestActor`, `SnapshotTestComponent`, `Subobject`, `SubSubobject`, `LevelSnapshotsEngineSubsystem_PostApplySnapshotEvent`, `LevelSnapshotsEngineSubsystem_PostTakeSnapshotEvent`, `LevelSnapshotsEngineSubsystem_PreApplySnapshotEvent`, `LevelSnapshotsEngineSubsystem_PreTakeSnapshotEvent`

---

## Classes

### `unreal.ExternalReferenceDummy`
Inherits: `StructBase` | Header: `ActorWithReferencesInCDO.h`

External Reference Dummy

### `unreal.LevelSnapshotEvent_Blueprint`
Inherits: `StructBase` | Header: `LevelSnapshotsEngineSubsystem.h`

Event data is extracted to structs so event delegate signature does not need to be modified in the future. Please follow this pattern when you add new events.

**Properties** (1):
  - `snapshot`: `LevelSnapshot` [Read-Only] — [Read-Only] The affected snapshot (LevelSnapshot)

### `unreal.PostApplySnapshotEventData_Blueprint`
Inherits: `LevelSnapshotEvent_Blueprint` | Header: `LevelSnapshotsEngineSubsystem.h`

Post Apply Snapshot Event Data Blueprint

### `unreal.PostTakeSnapshotEventData_Blueprint`
Inherits: `LevelSnapshotEvent_Blueprint` | Header: `LevelSnapshotsEngineSubsystem.h`

Post Take Snapshot Event Data Blueprint

### `unreal.PreApplySnapshotEventData_Blueprint`
Inherits: `LevelSnapshotEvent_Blueprint` | Header: `LevelSnapshotsEngineSubsystem.h`

Pre Apply Snapshot Event Data Blueprint

### `unreal.PreTakeSnapshotEventData_Blueprint`
Inherits: `LevelSnapshotEvent_Blueprint` | Header: `LevelSnapshotsEngineSubsystem.h`

Pre Take Snapshot Event Data Blueprint

### `unreal.ActorWithReferencesInCDO`
Inherits: `Actor` | Header: `ActorWithReferencesInCDO.h`

Actor with References in CDO

### `unreal.LevelSnapshot`
Inherits: `Object` | Header: `LevelSnapshot.h`

Holds the state of a world at a given time. This asset can be used to rollback certain properties in a UWorld.

**Methods** (6):
  - `get_capture_time()` -> `DateTime` — Get Capture Time
  - `get_map_path()` -> `SoftObjectPath` — Get Map Path
  - `get_snapshot_description()` -> `str` — Get Snapshot Description
  - `get_snapshot_name()` -> `Name` — Get Snapshot Name
  - `set_snapshot_description(snapshot_description)` -> `None` — Set Snapshot Description
  - `set_snapshot_name(snapshot_name)` -> `None` — Sets the name of this snapshot.

**Properties** (4):
  - `capture_time`: `DateTime` [Read-Only] — [Read-Only] UTC Time that the snapshot was taken (DateTime)
  - `map_path`: `SoftObjectPath` [Read-Only] — [Read-Only] Path of the map that the snapshot was taken in (SoftObjectPath)
  - `snapshot_description`: `str` [Read-Only] — [Read-Only] User defined description of the snapshot (str)
  - `snapshot_name`: `Name` [Read-Only] — [Read-Only] User defined name for the snapshot, can differ from the actual asset name. (Name)

### `unreal.LevelSnapshotsEngineSubsystem`
Inherits: `EngineSubsystem` | Header: `LevelSnapshotsEngineSubsystem.h`

Exposes some native Level Snapshots events to Blueprint scripting.

**Properties** (4):
  - `on_post_apply_snapshot`: `PostApplySnapshotEvent` — [Read-Write] Called after a level snapshot was applied to a world. (PostApplySnapshotEvent)
  - `on_post_take_snapshot`: `PostTakeSnapshotEvent` — [Read-Write] Called after a level snapshot captures the worldâs data. (PostTakeSnapshotEvent)
  - `on_pre_apply_snapshot`: `PreApplySnapshotEvent` — [Read-Write] Called before a level snapshot is applied to a world. (PreApplySnapshotEvent)
  - `on_pre_take_snapshot`: `PreTakeSnapshotEvent` — [Read-Write] Called before a level snapshot captures the worldâs data. (PreTakeSnapshotEvent)

### `unreal.LevelSnapshotsFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LevelSnapshotsFunctionLibrary.h`

Level Snapshots Function Library

**Methods** (2):
  - `apply_snapshot_to_world(world_context_object, snapshot, optional_filter)` -> `None` [classmethod] — Applies the snapshot to the world. If no filter is specified, the entire snapshot is applied.
  - `take_level_snapshot(world_context_object, new_snapshot_name = 'NewLevelSnapshot', description = '')` -> `LevelSnapshot` [classmethod] — Take Level Snapshot

### `unreal.SnapshotTestActor`
Inherits: `Character` | Header: `SnapshotTestActor.h`

Snapshot Test Actor

### `unreal.SnapshotTestComponent`
Inherits: `ActorComponent` | Header: `SnapshotTestActor.h`

Snapshot Test Component

### `unreal.Subobject`
Inherits: `Object` | Header: `SnapshotTestActor.h`

### `unreal.SubSubobject`
Inherits: `Object` | Header: `SnapshotTestActor.h`

Sub Subobject

### `unreal.LevelSnapshotsEngineSubsystem_PostApplySnapshotEvent`
Inherits: `MulticastDelegateBase` | Header: `LevelSnapshotsEngineSubsystem.h`

Post Apply Snapshot Event Delegate Signature

### `unreal.LevelSnapshotsEngineSubsystem_PostTakeSnapshotEvent`
Inherits: `MulticastDelegateBase` | Header: `LevelSnapshotsEngineSubsystem.h`

Post Take Snapshot Event Delegate Signature

### `unreal.LevelSnapshotsEngineSubsystem_PreApplySnapshotEvent`
Inherits: `MulticastDelegateBase` | Header: `LevelSnapshotsEngineSubsystem.h`

Pre Apply Snapshot Event Delegate Signature

### `unreal.LevelSnapshotsEngineSubsystem_PreTakeSnapshotEvent`
Inherits: `MulticastDelegateBase` | Header: `LevelSnapshotsEngineSubsystem.h`

Pre Take Snapshot Event Delegate Signature
