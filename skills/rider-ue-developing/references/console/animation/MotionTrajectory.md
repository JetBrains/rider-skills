# UE Python API — MotionTrajectory Module

**4 types** from the `MotionTrajectory` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CharacterTrajectoryData`, `MotionTrajectorySettings`, `TrajectorySamplingData`, `CharacterTrajectoryComponent`

---

## Classes

### `unreal.CharacterTrajectoryData`
Inherits: `StructBase` | Header: `MotionTrajectoryLibrary.h`

Character Trajectory Data

### `unreal.MotionTrajectorySettings`
Inherits: `StructBase` | Header: `MotionTrajectory.h`

Specifies the chosen domain parameters for trajectory sample retention and creation

**Properties** (1):
  - `seconds`: `float` — [Read-Write] Sample time horizon (float)

### `unreal.TrajectorySamplingData`
Inherits: `StructBase` | Header: `MotionTrajectoryLibrary.h`

Trajectory Sampling Data

**Properties** (4):
  - `history_length_seconds`: `float` [Read-Only] — [Read-Only] This should generally match the longest history required by a Motion Matching Database i...
  - `history_samples_per_second`: `int` [Read-Only] — [Read-Only] Higher values will cost more storage and processing time, but give higher accuracy. (int...
  - `prediction_length_seconds`: `float` [Read-Only] — [Read-Only] This should match the longest trajectory prediction required by a Motion Matching Databa...
  - `prediction_samples_per_second`: `int` [Read-Only] — [Read-Only] Higher values will cost more storage and processing time, but give higher accuracy. (int...

### `unreal.CharacterTrajectoryComponent`
Inherits: `ActorComponent` | Header: `CharacterTrajectoryComponent.h`

Component for generating trajectories usable by Motion Matching. This component generates trajectories from ACharacter. This is intended to provide an example and starting point for using Motion Match...

**Properties** (3):
  - `character_trajectory_data`: `CharacterTrajectoryData` [Read-Only] — [Read-Only] (CharacterTrajectoryData)
  - `sampling_data`: `TrajectorySamplingData` [Read-Only] — [Read-Only] (TrajectorySamplingData)
  - `trajectory`: `TransformTrajectory` [Read-Only] — [Read-Only] Trajectory stored in world space so it can be directly passed to Motion Matching. (Trans...
