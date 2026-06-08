# UE Python API — ChaosVD Module

**15 types** from the `ChaosVD` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ChaosVDAdditionalGTDataRouterComponent`, `ChaosVDConstraintDataComponent`, `ChaosVDDataContainerBaseActor`, `ChaosVDGameFrameInfoActor`, `ChaosVDGeometryContainer`, `ChaosVDInstancedStaticMeshComponent`, `ChaosVDParticleDataComponent`, `ChaosVDSceneQueryDataComponent`, `ChaosVDSkySphereInterface`, `ChaosVDSolverCharacterGroundConstraintDataComponent`, `ChaosVDSolverCollisionDataComponent`, `ChaosVDSolverDataComponent`, `ChaosVDSolverInfoActor`, `ChaosVDSolverJointConstraintDataComponent`, `ChaosVDStaticMeshComponent`

---

## Classes

### `unreal.ChaosVDAdditionalGTDataRouterComponent`
Inherits: `ChaosVDSolverDataComponent` | Header: `ChaosVDAdditionalGTDataRouterComponent.h`

Helper component used to re-route GT data loaded as a Solver Frame. This is part of a compatibility layer to support GT data from multiple files Until we refactor CVD to either support multiple GT Tra...

### `unreal.ChaosVDConstraintDataComponent`
Inherits: `ChaosVDSolverDataComponent` | Header: `ChaosVDConstraintDataComponent.h`

Chaos VDConstraint Data Component

### `unreal.ChaosVDDataContainerBaseActor`
Inherits: `Actor` | Header: `ChaosVDDataContainerBaseActor.h`

Base class for any CVD actor that will contain frame related data (either solver frame or game frame)

### `unreal.ChaosVDGameFrameInfoActor`
Inherits: `ChaosVDDataContainerBaseActor` | Header: `ChaosVDGameFrameInfoActor.h`

Actor that contains game frame related data

### `unreal.ChaosVDGeometryContainer`
Inherits: `Actor` | Header: `ChaosVDGeometryContainer.h`

Actor that contains Static Mesh Components used to visualize the geometry we generated from the recorded data

### `unreal.ChaosVDInstancedStaticMeshComponent`
Inherits: `InstancedStaticMeshComponent` | Header: `ChaosVDInstancedStaticMeshComponent.h`

CVD version of an Instance Static Mesh Component that holds additional CVD data

### `unreal.ChaosVDParticleDataComponent`
Inherits: `ChaosVDSolverDataComponent` | Header: `ChaosVDParticleDataComponent.h`

Component that references all particle data for a specific solver for the current frame, and handles how the visualization is updated based on that data

### `unreal.ChaosVDSceneQueryDataComponent`
Inherits: `ChaosVDSolverDataComponent` | Header: `ChaosVDSceneQueryDataComponent.h`

Actor Component that contains all the scene queries recorded at the current loaded frame

### `unreal.ChaosVDSkySphereInterface`
Inherits: `Interface` | Header: `ChaosVDSkySphereInterface.h`

Chaos VDSky Sphere Interface

**Methods** (2):
  - `refresh()` -> `None` — Refresh
  - `set_directional_light_source(new_light_source)` -> `None` — Set Directional Light Source

### `unreal.ChaosVDSolverCharacterGroundConstraintDataComponent`
Inherits: `ChaosVDConstraintDataComponent` | Header: `ChaosVDSolverCharacterGroundConstraintDataComponent.h`

Chaos VDSolver Character Ground Constraint Data Component

### `unreal.ChaosVDSolverCollisionDataComponent`
Inherits: `ChaosVDSolverDataComponent` | Header: `ChaosVDSolverCollisionDataComponent.h`

Chaos VDSolver Collision Data Component

### `unreal.ChaosVDSolverDataComponent`
Inherits: `ActorComponent` | Header: `ChaosVDSolverDataComponent.h`

Base class for all components that stores recorded solver data

### `unreal.ChaosVDSolverInfoActor`
Inherits: `ChaosVDDataContainerBaseActor` | Header: `ChaosVDSolverInfoActor.h`

Actor that contains all relevant data for the current visualized solver frame

### `unreal.ChaosVDSolverJointConstraintDataComponent`
Inherits: `ChaosVDConstraintDataComponent` | Header: `ChaosVDSolverJointConstraintDataComponent.h`

Chaos VDSolver Joint Constraint Data Component

### `unreal.ChaosVDStaticMeshComponent`
Inherits: `StaticMeshComponent` | Header: `ChaosVDStaticMeshComponent.h`

CVD version of a Static Mesh Component that holds additional CVD data
