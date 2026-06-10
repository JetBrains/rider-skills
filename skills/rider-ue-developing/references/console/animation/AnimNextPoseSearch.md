# UE Python API — AnimNextPoseSearch Module

**5 types** from the `AnimNextPoseSearch` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RigUnit_DebugDrawTrajectory`, `RigUnit_MultiAnimGetAnimationAsset`, `RigUnit_PoseSearchDatabaseGetTags`, `RigUnit_PoseSearchResultGetSelectedDatabase`, `PoseSearchFeatureChannel_DistanceFromAnimNextVar`

---

## Classes

### `unreal.RigUnit_DebugDrawTrajectory`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_DebugDrawTrajectory.h`

Rig Unit Debug Draw Trajectory

**Properties** (4):
  - `debug_offset`: `float` — [Read-Write] (float)
  - `debug_thickness`: `float` — [Read-Write] (float)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `trajectory`: `TransformTrajectory` — [Read-Write] (TransformTrajectory)

### `unreal.RigUnit_MultiAnimGetAnimationAsset`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_MultiAnimGetAnimationAsset.h`

Gets anim asset for a particular role from a MultiAnimAsset

**Properties** (3):
  - `multi_anim_asset`: `MultiAnimAsset` — [Read-Write] MultiAnim Asset to search for role on (MultiAnimAsset)
  - `result`: `AnimationAsset` [Read-Only] — [Read-Only] Result of the role search in the MultiAnimAsset (AnimationAsset)
  - `role`: `Name` — [Read-Write] Role to search for within the MultiAnimAsset (Name)

### `unreal.RigUnit_PoseSearchDatabaseGetTags`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_PoseSearchDatabaseGetTags.h`

Get metadata tags for a specified pose search database

**Properties** (2):
  - `database`: `PoseSearchDatabase` — [Read-Write] (PoseSearchDatabase)
  - `out_tags`: `None` [Read-Only] — [Read-Only] (Array[Name])

### `unreal.RigUnit_PoseSearchResultGetSelectedDatabase`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_PoseSearchResultGetSelectedDatabase.h`

Gets selected database from a pose search result

**Properties** (2):
  - `out_database`: `PoseSearchDatabase` [Read-Only] — [Read-Only] Result of the role search in the MultiAnimAsset (PoseSearchDatabase)
  - `pose_search_result`: `PoseSearchBlueprintResult` — [Read-Write] Role to search for within the MultiAnimAsset (PoseSearchBlueprintResult)

### `unreal.PoseSearchFeatureChannel_DistanceFromAnimNextVar`
Inherits: `PoseSearchFeatureChannel_Distance` | Header: `PoseSearchFeatureChannel_DistanceFromAnimNextVar.h`

Pose Search Feature Channel Distance from Anim Next Var
