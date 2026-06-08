# UE Python API — ChaosSolverEngine Module

**11 types** from the `ChaosSolverEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ChaosDebugSubstepControl`, `ChaosPhysicsCollisionInfo`, `DataflowRigidSolverProxy`, `ChaosDebugDrawComponent`, `ChaosEventListenerComponent`, `ChaosGameplayEventDispatcher`, `ChaosNotifyHandlerInterface`, `ChaosSolverActor`, `ChaosSolverEngineBlueprintLibrary`, `ClusterConnectionTypeEnum`, `OnChaosPhysicsCollision`

---

## Classes

### `unreal.ChaosDebugSubstepControl`
Inherits: `StructBase` | Header: `ChaosSolverActor.h`

Chaos Debug Substep Control

### `unreal.ChaosPhysicsCollisionInfo`
Inherits: `StructBase` | Header: `ChaosNotifyHandlerInterface.h`

Chaos Physics Collision Info

**Properties** (11):
  - `accumulated_impulse`: `Vector` — [Read-Write] (Vector)
  - `angular_velocity`: `Vector` — [Read-Write] (Vector)
  - `component`: `PrimitiveComponent` — [Read-Write] (PrimitiveComponent)
  - `location`: `Vector` — [Read-Write] Location of the impact (Vector)
  - `mass`: `float` — [Read-Write] (float)
  - `normal`: `Vector` — [Read-Write] Normal at the impact (Vector)
  - `other_angular_velocity`: `Vector` — [Read-Write] (Vector)
  - `other_component`: `PrimitiveComponent` — [Read-Write] (PrimitiveComponent)
  - `other_mass`: `float` — [Read-Write] (float)
  - `other_velocity`: `Vector` — [Read-Write] (Vector)
  - `velocity`: `Vector` — [Read-Write] (Vector)

### `unreal.DataflowRigidSolverProxy`
Inherits: `DataflowPhysicsSolverProxy` | Header: `ChaosSolverActor.h`

Dataflow Rigid Solver Proxy

### `unreal.ChaosDebugDrawComponent`
Inherits: `ActorComponent` | Header: `ChaosDebugDrawComponent.h`

Chaos Debug Draw Component

### `unreal.ChaosEventListenerComponent`
Inherits: `ActorComponent` | Header: `ChaosEventListenerComponent.h`

Base class for listeners that query and respond to a frameâs physics data (collision events, break events, etc).

### `unreal.ChaosGameplayEventDispatcher`
Inherits: `ChaosEventListenerComponent` | Header: `ChaosGameplayEventDispatcher.h`

Chaos Gameplay Event Dispatcher

### `unreal.ChaosNotifyHandlerInterface`
Inherits: `Interface` | Header: `ChaosNotifyHandlerInterface.h`

Chaos Notify Handler Interface

### `unreal.ChaosSolverActor`
Inherits: `Actor` | Header: `ChaosSolverActor.h`

Chaos Solver Actor

**Methods** (2):
  - `set_as_current_world_solver()` -> `None` — Makes this solver the current world solver. Dynamically spawned objects will have their physics state created in this so...
  - `set_solver_active(active)` -> `None` — Controls whether the solver is able to simulate particles it controls

### `unreal.ChaosSolverEngineBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ChaosNotifyHandlerInterface.h`

Chaos Solver Engine Blueprint Library

**Methods** (1):
  - `convert_physics_collision_to_hit_result(physics_collision)` -> `HitResult` [classmethod] — Convert Physics Collision to Hit Result

### `unreal.ClusterConnectionTypeEnum`
Inherits: `EnumBase` | Header: `ChaosSolverActor.h`

Legacy enum for old deprecated configuration properties. To be removed when those properties are

**Properties** (4):
  - `CHAOS_BOUNDS_OVERLAP_FILTERED_DELAUNAY_TRIANGULATION`: `ClusterConnectionTypeEnum = Ellipsis` — 4
  - `CHAOS_MINIMAL_SPANNING_SUBSET_DELAUNAY_TRIANGULATION`: `ClusterConnectionTypeEnum = Ellipsis` — 2
  - `CHAOS_POINT_IMPLICIT`: `ClusterConnectionTypeEnum = Ellipsis` — 0
  - `CHAOS_POINT_IMPLICIT_AUGMENTED_WITH_MINIMAL_DELAUNAY`: `ClusterConnectionTypeEnum = Ellipsis` — 3

### `unreal.OnChaosPhysicsCollision`
Inherits: `MulticastDelegateBase` | Header: `ChaosNotifyHandlerInterface.h`

On Chaos Physics Collision Delegate Signature
