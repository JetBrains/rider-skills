# UE Python API — HairStrandsSolver Module

**3 types** from the `HairStrandsSolver` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataflowGroomSolverProxy`, `GroomSolverSettings`, `GroomSolverComponent`

---

## Classes

### `unreal.DataflowGroomSolverProxy`
Inherits: `DataflowPhysicsSolverProxy` | Header: `GroomSolverComponent.h`

Dataflow groom solver proxy used in dataflow simulation

### `unreal.GroomSolverSettings`
Inherits: `StructBase` | Header: `GroomSolverComponent.h`

Solver settings that will be used in dataflow/deformergraph

### `unreal.GroomSolverComponent`
Inherits: `MeshComponent` | Header: `GroomSolverComponent.h`

Groom solver component in which groom component could be added to be solver together

**Methods** (4):
  - `add_groom_component(groom_component)` -> `None` — Add a groom component to the solver
  - `remove_groom_component(groom_component)` -> `None` — Add a groom component to the solver
  - `reset_groom_components()` -> `None` — Reset the groom physics components
  - `set_deformer_solver(deformer_solver)` -> `None` — Change the MeshDeformer solver that is used for this Component.
