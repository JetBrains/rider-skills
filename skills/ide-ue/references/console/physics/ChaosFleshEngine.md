# UE Python API — ChaosFleshEngine Module

**37 types** from the `ChaosFleshEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BodyForcesGroup`, `ConnectedObjectsGroup`, `ConstraintObject`, `DataflowFleshSolverProxy`, `DeformableConstraintParameters`, `FleshSimulationSpaceGroup`, `GameplayColllisions`, `InComponentSpringCollisionGroup`, `RigBoundRayCasts`, `SolverCollisionsGroup`, `SolverConstraintsGroup`, `SolverCorotatedConstraintsGroup`, `SolverDebuggingGroup`, `SolverEvolutionGroup`, `SolverForcesGroup`, `SolverGaussSeidelConstraintsGroup`, `SolverGridBasedCollisionsGroup`, `SolverMuscleActivationGroup`, `SolverQuasistaticsGroup`, `SolverTimingGroup`, ... (37 total)

---

## Classes

### `unreal.BodyForcesGroup`
Inherits: `StructBase` | Header: `ChaosDeformableTetrahedralComponent.h`

Body Forces Group

**Properties** (5):
  - `apply_gravity`: `bool` — [Read-Write] (bool)
  - `damping_multiplier`: `float` — [Read-Write] (float)
  - `incompressibility_multiplier`: `float` — [Read-Write] (float)
  - `inflation_multiplier`: `float` — [Read-Write] (float)
  - `stiffness_multiplier`: `float` — [Read-Write] (float)

### `unreal.ConnectedObjectsGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverComponent.h`

Connected Objects Group

**Properties** (1):
  - `deformable_components`: `None` [Read-Only] — [Read-Only] (Array[DeformablePhysicsComponent])

### `unreal.ConstraintObject`
Inherits: `StructBase` | Header: `ChaosDeformableConstraintsComponent.h`

Constraint Object

### `unreal.DataflowFleshSolverProxy`
Inherits: `DataflowPhysicsSolverProxy` | Header: `ChaosDeformableSolverComponent.h`

Dataflow Flesh Solver Proxy

### `unreal.DeformableConstraintParameters`
Inherits: `StructBase` | Header: `ChaosDeformableConstraintsComponent.h`

Deformable Constraint Parameters

### `unreal.FleshSimulationSpaceGroup`
Inherits: `StructBase` | Header: `ChaosDeformableTetrahedralComponent.h`

Flesh Simulation Space Group

### `unreal.GameplayColllisions`
Inherits: `StructBase` | Header: `ChaosDeformableGameplayComponent.h`

Gameplay Colllisions

**Properties** (1):
  - `rig_bound_ray_casts`: `RigBoundRayCasts` — [Read-Write] (RigBoundRayCasts)

### `unreal.InComponentSpringCollisionGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

In Component Spring Collision Group

### `unreal.RigBoundRayCasts`
Inherits: `StructBase` | Header: `ChaosDeformableGameplayComponent.h`

Rig Bound Ray Casts

**Properties** (5):
  - `collision_channel`: `CollisionChannel` — [Read-Write] (CollisionChannel)
  - `enable_rig_bound_raycasts`: `bool` — [Read-Write] (bool)
  - `max_num_tests`: `int` — [Read-Write] (int32)
  - `test_down_only`: `bool` — [Read-Write] (bool)
  - `test_range`: `float` — [Read-Write] (float)

### `unreal.SolverCollisionsGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Solver Collisions Group

### `unreal.SolverConstraintsGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Solver Constraints Group

**Properties** (1):
  - `gauss_seidel_constraints`: `SolverGaussSeidelConstraintsGroup` [Read-Only] — [Read-Only] These are options for another solver. (SolverGaussSeidelConstraintsGroup)

### `unreal.SolverCorotatedConstraintsGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Solver Corotated Constraints Group

### `unreal.SolverDebuggingGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Solver Debugging Group

### `unreal.SolverEvolutionGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Solver Evolution Group

### `unreal.SolverForcesGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Solver Forces Group

**Properties** (2):
  - `damping`: `float` — [Read-Write]
deprecated: Please use SetFleshDefaultProperties dataflow node to set up vertex damping...
  - `young_modulus`: `float` — [Read-Write]
deprecated: Please use SetFleshDefaultProperties dataflow node to set up vertex stiffne...

### `unreal.SolverGaussSeidelConstraintsGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Solver Gauss Seidel Constraints Group

**Properties** (2):
  - `sphere_repulsion`: `SphereRepulsionGroup` [Read-Only] — [Read-Only] Sphere repulsion parameters (SphereRepulsionGroup)
  - `spring_collision`: `SpringCollisionGroup` [Read-Only] — [Read-Only] Component-component collision detection radius and stiffness (SpringCollisionGroup)

### `unreal.SolverGridBasedCollisionsGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Solver Grid Based Collisions Group

### `unreal.SolverMuscleActivationGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Solver Muscle Activation Group

### `unreal.SolverQuasistaticsGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Solver Quasistatics Group

### `unreal.SolverTimingGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Solver Timing Group

**Properties** (1):
  - `execution_model`: `DeformableExecutionModel` [Read-Only] — [Read-Only] ObjectType defines how to initialize the rigid objects state, Kinematic, Sleeping, Dynam...

### `unreal.SphereRepulsionGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Sphere Repulsion Group

### `unreal.SpringCollisionGroup`
Inherits: `StructBase` | Header: `ChaosDeformableSolverGroups.h`

Spring Collision Group

**Properties** (1):
  - `component_spring_collision`: `InComponentSpringCollisionGroup` [Read-Only] — [Read-Only] In-component spring self collision detection parameters (InComponentSpringCollisionGroup...

### `unreal.DeformableCollisionsActor`
Inherits: `Actor` | Header: `ChaosDeformableCollisionsActor.h`

Deformable Collisions Actor

**Methods** (1):
  - `enable_simulation(actor)` -> `None` — Enable Simulation

**Properties** (3):
  - `deformable_collisions_component`: `DeformableCollisionsComponent` [Read-Only] — [Read-Only] (DeformableCollisionsComponent)
  - `primary_solver`: `DeformableSolverActor` — [Read-Write] (DeformableSolverActor)
  - `static_collisions`: `None` — [Read-Write] (Array[StaticMeshActor])

### `unreal.DeformableCollisionsComponent`
Inherits: `DeformablePhysicsComponent` | Header: `ChaosDeformableCollisionsComponent.h`

UDeformableCollisionsComponent

**Methods** (2):
  - `add_static_mesh_component(static_mesh_component)` -> `None` — Add Static Mesh Component
  - `remove_static_mesh_component(static_mesh_component)` -> `None` — Remove Static Mesh Component

**Properties** (1):
  - `collision_bodies`: `None` [Read-Only] — [Read-Only] (Array[StaticMeshComponent])

### `unreal.DeformableConstraintsActor`
Inherits: `Actor` | Header: `ChaosDeformableConstraintsActor.h`

Deformable Constraints Actor

**Methods** (1):
  - `enable_simulation(actor)` -> `None` — Enable Simulation

**Properties** (4):
  - `deformable_constraints_component`: `DeformableConstraintsComponent` [Read-Only] — [Read-Only] (DeformableConstraintsComponent)
  - `primary_solver`: `DeformableSolverActor` — [Read-Write] (DeformableSolverActor)
  - `source_bodies`: `None` — [Read-Write] (Array[FleshActor])
  - `target_bodies`: `None` — [Read-Write] (Array[FleshActor])

### `unreal.DeformableConstraintsComponent`
Inherits: `DeformablePhysicsComponent` | Header: `ChaosDeformableConstraintsComponent.h`

UDeformableConstraintsComponent

**Methods** (2):
  - `add_constrained_bodies(source_component, target_component, parameters)` -> `None` — Add Constrained Bodies
  - `remove_constrained_bodies(source_component, target_component, parameters)` -> `None` — Remove Constrained Bodies

**Properties** (1):
  - `constraints`: `None` [Read-Only] — [Read-Only] (Array[ConstraintObject])

### `unreal.DeformableGameplayComponent`
Inherits: `DeformableTetrahedralComponent` | Header: `ChaosDeformableGameplayComponent.h`

UDeformableGameplayComponent

**Properties** (1):
  - `gameplay_colllisions`: `GameplayColllisions` — [Read-Write] (GameplayColllisions)

### `unreal.DeformablePhysicsComponent`
Inherits: `PrimitiveComponent` | Header: `ChaosDeformablePhysicsComponent.h`

UDeformablePhysicsComponent

**Methods** (3):
  - `disable_simulation()` -> `None` — Disable Simulation
  - `enable_simulation(deformable_solver_component)` -> `None` — Enable Simulation
  - `enable_simulation_from_actor(deformable_solver_actor)` -> `None` — Enable Simulation from Actor

**Properties** (1):
  - `primary_solver_component`: `DeformableSolverComponent` — [Read-Write] Primary solver component in which this flesh component has been registered.
Soft object...

### `unreal.DeformableSolverActor`
Inherits: `Actor` | Header: `ChaosDeformableSolverActor.h`

Deformable Solver Actor

**Properties** (1):
  - `solver_component`: `DeformableSolverComponent` [Read-Only] — [Read-Only] (DeformableSolverComponent)

### `unreal.DeformableSolverComponent`
Inherits: `SceneComponent` | Header: `ChaosDeformableSolverComponent.h`

UDeformableSolverComponent

**Methods** (1):
  - `reset_simulation_properties(timing_group, evolution_group, collisions_group, constraints_group, forces_group, debugging_group, muscle_activation_group)` -> `None` — Stop the simulation, and keep the cloth in its last pose.

**Properties** (9):
  - `connected_objects`: `ConnectedObjectsGroup` [Read-Only] — Do NOT place ungrouped properties in this class (ConnectedObjectsGroup) [Read-Only] Properties
  - `simulation_asset`: `DataflowSimulationAsset` — [Read-Write] Solver dataflow asset used to advance in time (DataflowSimulationAsset)
  - `solver_collisions`: `SolverCollisionsGroup` [Read-Only] — [Read-Only] (SolverCollisionsGroup)
  - `solver_constraints`: `SolverConstraintsGroup` [Read-Only] — [Read-Only] (SolverConstraintsGroup)
  - `solver_debugging`: `SolverDebuggingGroup` [Read-Only] — [Read-Only] (SolverDebuggingGroup)
  - `solver_evolution`: `SolverEvolutionGroup` [Read-Only] — [Read-Only] (SolverEvolutionGroup)
  - `solver_forces`: `SolverForcesGroup` [Read-Only] — [Read-Only] (SolverForcesGroup)
  - `solver_muscle_activation`: `SolverMuscleActivationGroup` [Read-Only] — [Read-Only] (SolverMuscleActivationGroup)
  - `solver_timing`: `SolverTimingGroup` [Read-Only] — [Read-Only] (SolverTimingGroup)

### `unreal.DeformableTetrahedralComponent`
Inherits: `DeformablePhysicsComponent` | Header: `ChaosDeformableTetrahedralComponent.h`

UDeformableTetrahedralComponent

**Methods** (4):
  - `get_rest_collection()` -> `FleshAsset` — Get Rest Collection
  - `get_skeletal_mesh_binding_positions(skeletal_mesh)` -> `Array [ Vector ]` — deprecated: Use GetSkeletalMeshEmbeddedPositions() instead. deprecated: Use GetSkeletalMeshEmbeddedPositions() instead.
  - `get_skeletal_mesh_embedded_positions(format, target_deformation_skeleton_offset, target_bone = 'None', simulation_blend_weight = 1.000000)` -> `Array [ Vector ]` — Get the current positions of the transformation hierarchy from c TargetDeformationSkeleton, deformed by the tetrahedral ...
  - `set_rest_collection(rest_collection)` -> `None` — RestCollection

**Properties** (3):
  - `body_forces`: `BodyForcesGroup` — [Read-Write] (BodyForcesGroup)
  - `mass_multiplier`: `float` — [Read-Write] (float)
  - `material`: `MaterialInterface` — [Read-Write] (MaterialInterface)

### `unreal.DIFleshDeformerDataProvider`
Inherits: `ComputeDataProvider` | Header: `DIFleshDeformer.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (3):
  - `flesh_mesh`: `DeformableTetrahedralComponent` — [Read-Write] (DeformableTetrahedralComponent)
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)
  - `static_mesh`: `StaticMeshComponent` — [Read-Write] (StaticMeshComponent)

### `unreal.FleshActor`
Inherits: `Actor` | Header: `FleshActor.h`

Flesh Actor

**Methods** (1):
  - `enable_simulation(actor)` -> `None` — Enable Simulation

**Properties** (2):
  - `flesh_component`: `FleshComponent` [Read-Only] — [Read-Only] (FleshComponent)
  - `primary_solver`: `DeformableSolverActor` — [Read-Write] (DeformableSolverActor)

### `unreal.FleshAsset`
Inherits: `Object` | Header: `FleshAsset.h`

UFleshAsset (UObject)

**Properties** (3):
  - `skeletal_mesh`: `SkeletalMesh` — [Read-Write] SkeletalMesh (SkeletalMesh)
  - `skeleton`: `Skeleton` — [Read-Write] (Skeleton)
  - `target_deformation_skeleton`: `SkeletalMesh` — [Read-Write] Skeleton to use with the flesh deformer or c GetSkeletalMeshEmbeddedPositions() on the ...

### `unreal.FleshComponent`
Inherits: `DeformableGameplayComponent` | Header: `FleshComponent.h`

### `unreal.ChaosDeformableBindingOption`
Inherits: `EnumBase` | Header: `ChaosDeformableTetrahedralComponent.h`

Options for binding positions query.

**Properties** (6):
  - `BONE_DELTA`: `ChaosDeformableBindingOption = Ellipsis` — 5
  - `BONE_POS`: `ChaosDeformableBindingOption = Ellipsis` — 4
  - `COMPONENT_DELTA`: `ChaosDeformableBindingOption = Ellipsis` — 3
  - `COMPONENT_POS`: `ChaosDeformableBindingOption = Ellipsis` — 2
  - `WORLD_DELTA`: `ChaosDeformableBindingOption = Ellipsis` — 1
  - `WORLD_POS`: `ChaosDeformableBindingOption = Ellipsis` — 0

### `unreal.DeformableExecutionModel`
Inherits: `EnumBase` | Header: `ChaosDeformableTypes.h`

EDeformable Execution Model

**Properties** (3):
  - `CHAOS_DEFORMABLE_DURING_PHYSICS`: `DeformableExecutionModel = Ellipsis` — 1
  - `CHAOS_DEFORMABLE_POST_PHYSICS`: `DeformableExecutionModel = Ellipsis` — 2
  - `CHAOS_DEFORMABLE_PRE_PHYSICS`: `DeformableExecutionModel = Ellipsis` — 0
