# UE Python API — ChaosFleshGenerator Module

**4 types** from the `ChaosFleshGenerator` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FleshGeneratorSolverTimingGroup`, `FleshGeneratorComponent`, `FleshGeneratorProperties`, `SkeletalGeneratorComponent`

---

## Classes

### `unreal.FleshGeneratorSolverTimingGroup`
Inherits: `StructBase` | Header: `FleshGeneratorProperties.h`

Flesh Generator Solver Timing Group

### `unreal.FleshGeneratorComponent`
Inherits: `FleshComponent` | Header: `FleshGeneratorComponent.h`

Flesh data generation component.

### `unreal.FleshGeneratorProperties`
Inherits: `Object` | Header: `FleshGeneratorProperties.h`

Flesh Generator Properties

**Properties** (6):
  - `solver_collisions`: `SolverCollisionsGroup` [Read-Only] — [Read-Only] (SolverCollisionsGroup)
  - `solver_constraints`: `SolverConstraintsGroup` [Read-Only] — [Read-Only] (SolverConstraintsGroup)
  - `solver_debugging`: `SolverDebuggingGroup` [Read-Only] — [Read-Only] (SolverDebuggingGroup)
  - `solver_evolution`: `SolverEvolutionGroup` [Read-Only] — [Read-Only] (SolverEvolutionGroup)
  - `solver_forces`: `SolverForcesGroup` [Read-Only] — [Read-Only] (SolverForcesGroup)
  - `solver_timing`: `FleshGeneratorSolverTimingGroup` [Read-Only] — [Read-Only] (FleshGeneratorSolverTimingGroup)

### `unreal.SkeletalGeneratorComponent`
Inherits: `SkeletalMeshComponent` | Header: `FleshGeneratorComponent.h`

USkeletalGeneratorComponent data generation component.
