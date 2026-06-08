# UE Python API — DataflowSimulation Module

**5 types** from the `DataflowSimulation` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataflowPhysicsSolverProxy`, `DataflowSimulationAsset`, `DataflowSimulationProperty`, `DataflowSimulationProxy`, `DataflowSimulationActor`

---

## Classes

### `unreal.DataflowPhysicsSolverProxy`
Inherits: `DataflowSimulationProxy` | Header: `DataflowPhysicsSolver.h`

Dataflow simulation physics solver proxy (PT)

### `unreal.DataflowSimulationAsset`
Inherits: `StructBase` | Header: `DataflowSimulationInterface.h`

Dataflow simulation asset (should be in the interface children)

**Properties** (2):
  - `dataflow_asset`: `Dataflow` — [Read-Write] Simulation dataflow asset used to advance in time on Pt (Dataflow)
  - `simulation_groups`: `None` — [Read-Write] Simulation groups used to filter within the simulation nodes (Set[str])

### `unreal.DataflowSimulationProperty`
Inherits: `StructBase` | Header: `DataflowSimulationNodes.h`

Dataflow simulation property

### `unreal.DataflowSimulationProxy`
Inherits: `StructBase` | Header: `DataflowSimulationProxy.h`

Dataflow simulation proxy used for simulation (PT)

### `unreal.DataflowSimulationActor`
Inherits: `Interface` | Header: `DataflowSimulationManager.h`

Dataflow Simulation Actor

**Methods** (2):
  - `post_dataflow_simulation_tick(simulation_time, delta_time)` -> `None` — Post simulation callback function that can be implemented in C++ or Blueprint.
  - `pre_dataflow_simulation_tick(simulation_time, delta_time)` -> `None` — Pre simulation callback function that can be implemented in C++ or Blueprint.
