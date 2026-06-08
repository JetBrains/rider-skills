# UE Python API — MoverAnimNext Module

**4 types** from the `MoverAnimNext` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RigUnit_GenerateMoverTrajectory`, `RigUnit_GetTrajectoryAngularVelocity`, `RigUnit_GetTrajectorySampleAtTime`, `RigUnit_GetTrajectoryVelocity`

---

## Classes

### `unreal.RigUnit_GenerateMoverTrajectory`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_GenerateMoverTrajectory.h`

Rig Unit Generate Mover Trajectory

**Properties** (7):
  - `delta_time`: `float` — [Read-Write] This should be the most recent simulation time that was used to get us to our current s...
  - `history_sampling_interval`: `float` — [Read-Write] (float)
  - `mover_component`: `MoverComponent` — [Read-Write] (MoverComponent)
  - `num_history_samples`: `int` — [Read-Write] (int32)
  - `num_prediction_samples`: `int` — [Read-Write] (int32)
  - `out_trajectory`: `TransformTrajectory` — [Read-Write] (TransformTrajectory)
  - `prediction_sampling_interval`: `float` — [Read-Write] (float)

### `unreal.RigUnit_GetTrajectoryAngularVelocity`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_TrajectoryAnalysis.h`

Rig Unit Get Trajectory Angular Velocity

**Properties** (5):
  - `extrapolate`: `bool` — [Read-Write] (bool)
  - `out_angular_velocity`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `time1`: `float` — [Read-Write] (float)
  - `time2`: `float` — [Read-Write] (float)
  - `trajectory`: `TransformTrajectory` — [Read-Write] (TransformTrajectory)

### `unreal.RigUnit_GetTrajectorySampleAtTime`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_TrajectoryAnalysis.h`

Rig Unit Get Trajectory Sample at Time

**Properties** (4):
  - `extrapolate`: `bool` — [Read-Write] (bool)
  - `out_trajectory_sample`: `TransformTrajectorySample` [Read-Only] — [Read-Only] (TransformTrajectorySample)
  - `time`: `float` — [Read-Write] (float)
  - `trajectory`: `TransformTrajectory` — [Read-Write] (TransformTrajectory)

### `unreal.RigUnit_GetTrajectoryVelocity`
Inherits: `RigUnit_AnimNextBase` | Header: `RigUnit_TrajectoryAnalysis.h`

Rig Unit Get Trajectory Velocity

**Properties** (5):
  - `extrapolate`: `bool` — [Read-Write] (bool)
  - `out_velocity`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `time1`: `float` — [Read-Write] (float)
  - `time2`: `float` — [Read-Write] (float)
  - `trajectory`: `TransformTrajectory` — [Read-Write] (TransformTrajectory)
