# UE Python API — Chaos Module

**33 types** from the `Chaos` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ChaosSolverConfiguration`, `ChaosSolverDestructionSettings`, `ClosestPhysicsObjectResult`, `SolverBreakingFilterSettings`, `SolverCollisionFilterSettings`, `SolverRemovalFilterSettings`, `SolverTrailingFilterSettings`, `ChaosBufferMode`, `ChaosDeformableSimSpace`, `ChaosSolverTickMode`, `ChaosThreadingMode`, `ClusterUnionMethod`, `CollisionTypeEnum`, `DamageModelTypeEnum`, `EmissionPatternTypeEnum`, `FieldCullingOperationType`, `FieldFalloffType`, `FieldFilterType`, `FieldIntegerType`, `FieldObjectType`, ... (33 total)

---

## Classes

### `unreal.ChaosSolverConfiguration`
Inherits: `StructBase` | Header: `ChaosSolverConfiguration.h`

Chaos Solver Configuration

### `unreal.ChaosSolverDestructionSettings`
Inherits: `StructBase` | Header: `ChaosSolverConfiguration.h`

Chaos Solver Destruction Settings

### `unreal.ClosestPhysicsObjectResult`
Inherits: `StructBase` | Header: `PhysicsObjectInterface.h`

Closest Physics Object Result

### `unreal.SolverBreakingFilterSettings`
Inherits: `StructBase` | Header: `SolverEventFilters.h`

Solver Breaking Filter Settings

**Properties** (4):
  - `filter_enabled`: `bool` — [Read-Write] Filter is enabled. (bool)
  - `min_mass`: `float` — [Read-Write] The minimum mass threshold for the results (compared with min of particle 1 mass and pa...
  - `min_speed`: `float` — [Read-Write] The min velocity threshold for the results (compared with min of particle 1 speed and p...
  - `min_volume`: `float` — [Read-Write] (float)

### `unreal.SolverCollisionFilterSettings`
Inherits: `StructBase` | Header: `SolverEventFilters.h`

Solver Collision Filter Settings

**Properties** (4):
  - `filter_enabled`: `bool` — [Read-Write] Filter is enabled. (bool)
  - `min_impulse`: `float` — [Read-Write] The minimum impulse threshold for the results. (float)
  - `min_mass`: `float` — [Read-Write] The minimum mass threshold for the results (compared with min of particle 1 mass and pa...
  - `min_speed`: `float` — [Read-Write] The min velocity threshold for the results (compared with min of particle 1 speed and p...

### `unreal.SolverRemovalFilterSettings`
Inherits: `StructBase` | Header: `SolverEventFilters.h`

Solver Removal Filter Settings

**Properties** (3):
  - `filter_enabled`: `bool` — [Read-Write] Filter is enabled. (bool)
  - `min_mass`: `float` — [Read-Write] The minimum mass threshold for the results (compared with min of particle 1 mass and pa...
  - `min_volume`: `float` — [Read-Write] (float)

### `unreal.SolverTrailingFilterSettings`
Inherits: `StructBase` | Header: `SolverEventFilters.h`

Solver Trailing Filter Settings

**Properties** (4):
  - `filter_enabled`: `bool` — [Read-Write] Filter is enabled. (bool)
  - `min_mass`: `float` — [Read-Write] The minimum mass threshold for the results (compared with min of particle 1 mass and pa...
  - `min_speed`: `float` — [Read-Write] (float)
  - `min_volume`: `float` — [Read-Write] (float)

### `unreal.ChaosBufferMode`
Inherits: `EnumBase` | Header: `PhysicsCoreTypes.h`

EChaos Buffer Mode

**Properties** (2):
  - `DOUBLE`: `ChaosBufferMode = Ellipsis` — 0
  - `TRIPLE`: `ChaosBufferMode = Ellipsis` — 1

### `unreal.ChaosDeformableSimSpace`
Inherits: `EnumBase` | Header: `ChaosDeformableSolverProxy.h`

Supported simulation spaces for the ChaosDeformable solver.

**Properties** (3):
  - `BONE`: `ChaosDeformableSimSpace = Ellipsis` — Component fails on Mac 2
  - `COMPONENT_XF`: `ChaosDeformableSimSpace = Ellipsis` — 1
  - `WORLD`: `ChaosDeformableSimSpace = Ellipsis` — 0

### `unreal.ChaosSolverTickMode`
Inherits: `EnumBase` | Header: `PhysicsCoreTypes.h`

EChaos Solver Tick Mode

**Properties** (4):
  - `FIXED`: `ChaosSolverTickMode = Ellipsis` — 0
  - `VARIABLE`: `ChaosSolverTickMode = Ellipsis` — 1
  - `VARIABLE_CAPPED`: `ChaosSolverTickMode = Ellipsis` — 2
  - `VARIABLE_CAPPED_WITH_TARGET`: `ChaosSolverTickMode = Ellipsis` — 3

### `unreal.ChaosThreadingMode`
Inherits: `EnumBase` | Header: `PhysicsCoreTypes.h`

EChaos Threading Mode

**Properties** (2):
  - `SINGLE_THREAD`: `ChaosThreadingMode = Ellipsis` — 2
  - `TASK_GRAPH`: `ChaosThreadingMode = Ellipsis` — 1

### `unreal.ClusterUnionMethod`
Inherits: `EnumBase` | Header: `ChaosSolverConfiguration.h`

ECluster Union Method

**Properties** (6):
  - `BOUNDS_OVERLAP_FILTERED_DELAUNAY_TRIANGULATION`: `ClusterUnionMethod = Ellipsis` — 4
  - `DELAUNAY_TRIANGULATION`: `ClusterUnionMethod = Ellipsis` — 1
  - `MINIMAL_SPANNING_SUBSET_DELAUNAY_TRIANGULATION`: `ClusterUnionMethod = Ellipsis` — 2
  - `NONE`: `ClusterUnionMethod = Ellipsis` — 5
  - `POINT_IMPLICIT`: `ClusterUnionMethod = Ellipsis` — 0
  - `POINT_IMPLICIT_AUGMENTED_WITH_MINIMAL_DELAUNAY`: `ClusterUnionMethod = Ellipsis` — 3

### `unreal.CollisionTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionSimulationTypes.h`

ECollision Type Enum

**Properties** (2):
  - `CHAOS_SURFACE_VOLUMETRIC`: `CollisionTypeEnum = Ellipsis` — 1
  - `CHAOS_VOLUMETRIC`: `CollisionTypeEnum = Ellipsis` — 0

### `unreal.DamageModelTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionSimulationTypes.h`

EDamage Model Type Enum

**Properties** (2):
  - `CHAOS_DAMAGE_MODEL_MATERIAL_STRENGTH_AND_CONNECTIVITY_DAMAGE_THRESHOLD`: `DamageModelTypeEnum = Ellipsis` — Using damage threshold set using the physical material strength and how connected a cluster is 1
  - `CHAOS_DAMAGE_MODEL_USER_DEFINED_DAMAGE_THRESHOLD`: `DamageModelTypeEnum = Ellipsis` — Using damage threshold set based on level of the cluster 0

### `unreal.EmissionPatternTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionSimulationTypes.h`

EEmission Pattern Type Enum

**Properties** (2):
  - `CHAOS_EMISSION_PATTERN_FIRST_FRAME`: `EmissionPatternTypeEnum = Ellipsis` — 0
  - `CHAOS_EMISSION_PATTERN_ON_DEMAND`: `EmissionPatternTypeEnum = Ellipsis` — 1

### `unreal.FieldCullingOperationType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EField Culling Operation Type

**Properties** (2):
  - `FIELD_CULLING_INSIDE`: `FieldCullingOperationType = Ellipsis` — Evaluate the input field if the result of the culling field is equal to 0 0
  - `FIELD_CULLING_OUTSIDE`: `FieldCullingOperationType = Ellipsis` — Evaluate the input field if the result of the culling field is different from 0 1

### `unreal.FieldFalloffType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EField Falloff Type

**Properties** (5):
  - `FIELD_FALLOFF_INVERSE`: `FieldFalloffType = Ellipsis` — The falloff function will be proportional to 1.0/x 2
  - `FIELD_FALLOFF_LINEAR`: `FieldFalloffType = Ellipsis` — The falloff function will be proportional to x 1
  - `FIELD_FALLOFF_LOGARITHMIC`: `FieldFalloffType = Ellipsis` — The falloff function will be proportional to log(x) 4
  - `FIELD_FALLOFF_SQUARED`: `FieldFalloffType = Ellipsis` — The falloff function will be proportional to x*x 3
  - `FIELD_FALL_OFF_NONE`: `FieldFalloffType = Ellipsis` — No falloff function is used 0

### `unreal.FieldFilterType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EField Filter Type

**Properties** (6):
  - `FIELD_FILTER_ALL`: `FieldFilterType = Ellipsis` — Apply the field to all the solver particles 3
  - `FIELD_FILTER_DISABLED`: `FieldFilterType = Ellipsis` — Apply the field to all the disabled particles 5
  - `FIELD_FILTER_DYNAMIC`: `FieldFilterType = Ellipsis` — Apply the field to all the dynamic particles 0
  - `FIELD_FILTER_KINEMATIC`: `FieldFilterType = Ellipsis` — Apply the field to all the kinematic particles 1
  - `FIELD_FILTER_SLEEPING`: `FieldFilterType = Ellipsis` — Apply the field to all the sleeping particles 4
  - `FIELD_FILTER_STATIC`: `FieldFilterType = Ellipsis` — Apply the field to all the static particles 2

### `unreal.FieldIntegerType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EField Integer Type

**Properties** (3):
  - `INTEGER_ACTIVATE_DISABLED`: `FieldIntegerType = Ellipsis` — Activate all the disabled particles for which the field value will be 0 1
  - `INTEGER_COLLISION_GROUP`: `FieldIntegerType = Ellipsis` — Set the particles collision group. 2
  - `INTEGER_DYNAMIC_STATE`: `FieldIntegerType = Ellipsis` — Set the dynamic state of a particle (static, dynamic, kinematicâ¦) 0

### `unreal.FieldObjectType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EField Object Type

**Properties** (5):
  - `FIELD_OBJECT_ALL`: `FieldObjectType = Ellipsis` — Apply the field to all the objects particles 4
  - `FIELD_OBJECT_CHARACTER`: `FieldObjectType = Ellipsis` — Apply the field to all the character particles 3
  - `FIELD_OBJECT_CLOTH`: `FieldObjectType = Ellipsis` — Apply the field to all the cloth particles 1
  - `FIELD_OBJECT_DESTRUCTION`: `FieldObjectType = Ellipsis` — Apply the field to all the destruction particles 2
  - `FIELD_OBJECT_RIGID`: `FieldObjectType = Ellipsis` — Apply the field to all the rigid particles 0

### `unreal.FieldOperationType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EField Operation Type

**Properties** (4):
  - `FIELD_ADD`: `FieldOperationType = Ellipsis` — Output = Left + Right 2 Add the fields output values
  - `FIELD_DIVIDE`: `FieldOperationType = Ellipsis` — Output = Left / Right 1 Divide the fields output values
  - `FIELD_MULTIPLY`: `FieldOperationType = Ellipsis` — Output = Left * Right 0 Multiply the fields output values
  - `FIELD_SUBSTRACT`: `FieldOperationType = Ellipsis` — Output = Left - Right 3 Subtract the fields output

### `unreal.FieldPhysicsDefaultFields`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EField Physics Default Fields

**Properties** (5):
  - `FIELD_RADIAL_FALLOFF`: `FieldPhysicsDefaultFields = Ellipsis` — 1
  - `FIELD_RADIAL_INT_MASK`: `FieldPhysicsDefaultFields = Ellipsis` — 0
  - `FIELD_RADIAL_VECTOR`: `FieldPhysicsDefaultFields = Ellipsis` — 3
  - `FIELD_RADIAL_VECTOR_FALLOFF`: `FieldPhysicsDefaultFields = Ellipsis` — 4
  - `FIELD_UNIFORM_VECTOR`: `FieldPhysicsDefaultFields = Ellipsis` — 2

### `unreal.FieldPhysicsType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EField Physics Type

**Properties** (12):
  - `FIELD_ACTIVATE_DISABLED`: `FieldPhysicsType = Ellipsis` — Activate all the disabled particles for which the field value will be 0 16
  - `FIELD_ANGULAR_TORQUE`: `FieldPhysicsType = Ellipsis` — Add a vector field to the particles angular torque. 7
  - `FIELD_ANGULAR_VELOCIY`: `FieldPhysicsType = Ellipsis` — Add a vector field to the particles angular velocity. 6
  - `FIELD_COLLISION_GROUP`: `FieldPhysicsType = Ellipsis` — Set the particles collision group. 15
  - `FIELD_DISABLE_THRESHOLD`: `FieldPhysicsType = Ellipsis` — Disable the particles if their linear and angular velocity are less than the threshold. 9
  - `FIELD_DYNAMIC_STATE`: `FieldPhysicsType = Ellipsis` — Set the dynamic state of a particle (static, dynamic, kinematicâ¦) 1
  - `FIELD_EXTERNAL_CLUSTER_STRAIN`: `FieldPhysicsType = Ellipsis` — Apply an external strain over the particles. If this strain is over the internal one, the cluster wi...
  - `FIELD_INTERNAL_CLUSTER_STRAIN`: `FieldPhysicsType = Ellipsis` — Add a strain field to the particles internal one. 8
  - `FIELD_KILL`: `FieldPhysicsType = Ellipsis` — Disable the particles for which the field will be higher than 0. 4
  - `FIELD_LINEAR_FORCE`: `FieldPhysicsType = Ellipsis` — Add a vector field to the particles linear force. 2
  - `FIELD_LINEAR_VELOCITY`: `FieldPhysicsType = Ellipsis` — Add a vector field to the particles linear velocity. 5
  - `FIELD_SLEEPING_THRESHOLD`: `FieldPhysicsType = Ellipsis` — Set particles in sleeping mode if their linear and angular velocity are less than the threshold. 10

### `unreal.FieldPositionType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EField Position Type

**Properties** (2):
  - `FIELD_POSITION_CENTER_OF_MASS`: `FieldPositionType = Ellipsis` — Apply the field to the particles center of mass position 0
  - `FIELD_POSITION_PIVOT_POINT`: `FieldPositionType = Ellipsis` — Apply the field to the particles pivot point position 1

### `unreal.FieldResolutionType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EField Resolution Type

**Properties** (3):
  - `FIELD_RESOLUTION_DISABLED_PARENTS`: `FieldResolutionType = Ellipsis` — Apply the field to all the parent particles 1
  - `FIELD_RESOLUTION_MAXIMUM`: `FieldResolutionType = Ellipsis` — Apply the field to all the solver particles 2
  - `FIELD_RESOLUTION_MINIMAL`: `FieldResolutionType = Ellipsis` — Apply the field to all the active particles 0

### `unreal.FieldScalarType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EField Scalar Type

**Properties** (5):
  - `SCALAR_DISABLE_THRESHOLD`: `FieldScalarType = Ellipsis` — Disable the particles if their linear and angular velocity are less than the threshold. 2
  - `SCALAR_EXTERNAL_CLUSTER_STRAIN`: `FieldScalarType = Ellipsis` — Apply an external strain over the particles. If this strain is over the internal one, the cluster wi...
  - `SCALAR_INTERNAL_CLUSTER_STRAIN`: `FieldScalarType = Ellipsis` — Add a strain field to the particles internal one. 4
  - `SCALAR_KILL`: `FieldScalarType = Ellipsis` — Disable the particles for which the field will be higher than 0. 1
  - `SCALAR_SLEEPING_THRESHOLD`: `FieldScalarType = Ellipsis` — Set particles in sleeping mode if their linear and angular velocity are less than the threshold. 3

### `unreal.FieldVectorType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

TODO : Refactor these 3 enums to be in sync with the GetFieldTargetTypes

**Properties** (4):
  - `VECTOR_ANGULAR_TORQUE`: `FieldVectorType = Ellipsis` — Add a vector field to the particles angular torque. 3
  - `VECTOR_ANGULAR_VELOCITY`: `FieldVectorType = Ellipsis` — Add a vector field to the particles angular velocity. 2
  - `VECTOR_LINEAR_FORCE`: `FieldVectorType = Ellipsis` — Add a vector field to the particles linear force. 0
  - `VECTOR_LINEAR_VELOCITY`: `FieldVectorType = Ellipsis` — Add a vector field to the particles linear velocity. 1

### `unreal.GeometryCollectionPhysicsTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionSimulationTypes.h`

EGeometry Collection Physics Type Enum

**Properties** (13):
  - `CHAOS_ANGULAR_TORQUE`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Add a vector field to the particles angular torque. 7
  - `CHAOS_ANGULAR_VELOCITY`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Add a vector field to the particles angular velocity. 0
  - `CHAOS_COLLISION_GROUP`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Set the particles collision group. 5
  - `CHAOS_DISABLE_THRESHOLD`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Disable the particles if their linear and angular velocity are less than the threshold. 8
  - `CHAOS_DYNAMIC_STATE`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Set the dynamic state of a particle (static, dynamic, kinematicâ¦) 1
  - `CHAOS_EXTERNAL_CLUSTER_STRAIN`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Apply an external strain over the particles. If this strain is over the internal one, the cluster wi...
  - `CHAOS_INITIAL_ANGULAR_VELOCITY`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Initial particles angular velocity. 3
  - `CHAOS_INITIAL_LINEAR_VELOCITY`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Initial particles linear velocity. 4
  - `CHAOS_INTERNAL_CLUSTER_STRAIN`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Add a strain field to the particles internal one. 11
  - `CHAOS_LINEAR_FORCE`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Add a vector field to the particles linear force. 6
  - `CHAOS_LINEAR_IMPULSE`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Add a vector field to apply an impulse to the particles. 12
  - `CHAOS_LINEAR_VELOCITY`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Add a vector field to the particles linear velocity. 2
  - `CHAOS_SLEEPING_THRESHOLD`: `GeometryCollectionPhysicsTypeEnum = Ellipsis` — Set particles in sleeping mode if their linear and angular velocity are less than the threshold. 9

### `unreal.ImplicitTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionSimulationTypes.h`

EImplicit Type Enum

**Properties** (6):
  - `CHAOS_IMPLICIT_BOX`: `ImplicitTypeEnum = Ellipsis` — 0
  - `CHAOS_IMPLICIT_CAPSULE`: `ImplicitTypeEnum = Ellipsis` — 2
  - `CHAOS_IMPLICIT_CONVEX`: `ImplicitTypeEnum = Ellipsis` — 5
  - `CHAOS_IMPLICIT_LEVEL_SET`: `ImplicitTypeEnum = Ellipsis` — 3
  - `CHAOS_IMPLICIT_NONE`: `ImplicitTypeEnum = Ellipsis` — 4
  - `CHAOS_IMPLICIT_SPHERE`: `ImplicitTypeEnum = Ellipsis` — 1

### `unreal.InitialVelocityTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionSimulationTypes.h`

EInitial Velocity Type Enum

**Properties** (2):
  - `CHAOS_INITIAL_VELOCITY_NONE`: `InitialVelocityTypeEnum = Ellipsis` — Chaos_Initial_Velocity_Field UMETA(DisplayName = âFieldâ), 1
  - `CHAOS_INITIAL_VELOCITY_USER_DEFINED`: `InitialVelocityTypeEnum = Ellipsis` — Chaos_Initial_Velocity_Animation UMETA(DisplayName = âAnimationâ), 0

### `unreal.ObjectStateTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionSimulationTypes.h`

EObject State Type Enum

**Properties** (5):
  - `CHAOS_OBJECT_DYNAMIC`: `ObjectStateTypeEnum = Ellipsis` — 4
  - `CHAOS_OBJECT_KINEMATIC`: `ObjectStateTypeEnum = Ellipsis` — 2
  - `CHAOS_OBJECT_SLEEPING`: `ObjectStateTypeEnum = Ellipsis` — 1
  - `CHAOS_OBJECT_STATIC`: `ObjectStateTypeEnum = Ellipsis` — 3
  - `CHAOS_OBJECT_USER_DEFINED`: `ObjectStateTypeEnum = Ellipsis` — 100

### `unreal.SetMaskConditionType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

ESet Mask Condition Type

**Properties** (3):
  - `FIELD_SET_ALWAYS`: `SetMaskConditionType = Ellipsis` — The particle output value will be equal to Interior-value if the particle position is inside a spher...
  - `FIELD_SET_IFF_NOT_EXTERIOR`: `SetMaskConditionType = Ellipsis` — The particle output value will be equal to Exterior-value if the particle position is outside the sp...
  - `FIELD_SET_IFF_NOT_INTERIOR`: `SetMaskConditionType = Ellipsis` — The particle output value will be equal to Interior-value if the particle position is inside the sph...

### `unreal.WaveFunctionType`
Inherits: `EnumBase` | Header: `FieldSystemTypes.h`

EWave Function Type

**Properties** (4):
  - `FIELD_WAVE_COSINE`: `WaveFunctionType = Ellipsis` — Cosine wave that will move in time. 0
  - `FIELD_WAVE_DECAY`: `WaveFunctionType = Ellipsis` — The magnitude of the field will decay in time. 3
  - `FIELD_WAVE_FALLOFF`: `WaveFunctionType = Ellipsis` — The radial falloff radius will move along temporal wave. 2
  - `FIELD_WAVE_GAUSSIAN`: `WaveFunctionType = Ellipsis` — Gaussian wave that will move in time. 1
