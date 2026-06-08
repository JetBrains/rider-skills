# UE Python API — ControlRigPhysics Module

**55 types** from the `ControlRigPhysics` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RigPhysicsBodyComponent`, `RigPhysicsBodySolverSettings`, `RigPhysicsCollision`, `RigPhysicsCollisionBox`, `RigPhysicsCollisionCapsule`, `RigPhysicsCollisionShape`, `RigPhysicsCollisionSphere`, `RigPhysicsControlComponent`, `RigPhysicsDriveData`, `RigPhysicsDynamics`, `RigPhysicsJointComponent`, `RigPhysicsJointData`, `RigPhysicsMaterial`, `RigPhysicsSimulationSpaceSettings`, `RigPhysicsSolverComponent`, `RigPhysicsSolverSettings`, `RigPhysicsVisualizationSettings`, `RigUnit_AddPhysicsBody`, `RigUnit_AddPhysicsComponents`, `RigUnit_AddPhysicsControl`, ... (55 total)

---

## Classes

### `unreal.RigPhysicsBodyComponent`
Inherits: `RigBaseComponent` | Header: `RigPhysicsBodyComponent.h`

A component that can be added to a joint/element that defines how a physical body can be âattachedâ to it. The body supports dynamic movement, collision, and a physics joint with this bodyâs par...

**Properties** (7):
  - `body_data`: `PhysicsControlModifierData` [Read-Only] — [Read-Only] (PhysicsControlModifierData)
  - `body_solver_settings`: `RigPhysicsBodySolverSettings` [Read-Only] — [Read-Only] (RigPhysicsBodySolverSettings)
  - `collision`: `RigPhysicsCollision` [Read-Only] — [Read-Only] (RigPhysicsCollision)
  - `dynamics`: `RigPhysicsDynamics` [Read-Only] — [Read-Only] (RigPhysicsDynamics)
  - `kinematic_target`: `Transform` [Read-Only] — [Read-Only] The target for when this body is kinematic (Transform)
  - `kinematic_target_space`: `RigPhysicsKinematicTargetSpace` [Read-Only] — [Read-Only] (RigPhysicsKinematicTargetSpace)
  - `no_collision_bodies`: `None` [Read-Only] — [Read-Only] A list of body components with which we should not collide. The solver component can als...

### `unreal.RigPhysicsBodySolverSettings`
Inherits: `StructBase` | Header: `RigPhysicsData.h`

Basic settings of the body in relation to the solver that are not covered elsewhere

### `unreal.RigPhysicsCollision`
Inherits: `StructBase` | Header: `RigPhysicsData.h`

Collection of shapes that define the collision and (optionally) mass distribution of the body

### `unreal.RigPhysicsCollisionBox`
Inherits: `RigPhysicsCollisionShape` | Header: `RigPhysicsData.h`

Box collision

### `unreal.RigPhysicsCollisionCapsule`
Inherits: `RigPhysicsCollisionShape` | Header: `RigPhysicsData.h`

Capsule collision

### `unreal.RigPhysicsCollisionShape`
Inherits: `StructBase` | Header: `RigPhysicsData.h`

Properties common to all collision shape types

### `unreal.RigPhysicsCollisionSphere`
Inherits: `RigPhysicsCollisionShape` | Header: `RigPhysicsData.h`

Sphere collision

### `unreal.RigPhysicsControlComponent`
Inherits: `RigBaseComponent` | Header: `RigPhysicsControlComponent.h`

A component that can be added to hierarchy elements (joints) to add the data required to control the simulation of them

**Properties** (6):
  - `child_body_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] The body being controlled (RigComponentKey)
  - `control_data`: `PhysicsControlData` — [Read-Write] Describes the initial strength etc of the new control (PhysicsControlData)
  - `control_multiplier`: `PhysicsControlMultiplier` — [Read-Write] This is the currently active control multiplier. (PhysicsControlMultiplier)
  - `control_target`: `PhysicsControlTarget` — [Read-Write] Describes the initial target for the new control (PhysicsControlTarget)
  - `parent_body_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] The body that controls the body being controlled. If this is dynamic, it will be affecte...
  - `use_parent_body_as_default`: `bool` [Read-Only] — [Read-Only] If true, then if the parent body component key is not set, the the default parent body c...

### `unreal.RigPhysicsDriveData`
Inherits: `StructBase` | Header: `RigPhysicsData.h`

This represents the motor drive associated with a physics joint, that can drive the bodies towards a target pose.

### `unreal.RigPhysicsDynamics`
Inherits: `StructBase` | Header: `RigPhysicsData.h`

Properties of a body affecting its dynamics (movement without regard to collision).

### `unreal.RigPhysicsJointComponent`
Inherits: `RigBaseComponent` | Header: `RigPhysicsJointComponent.h`

Rig Physics Joint Component

**Properties** (4):
  - `child_body_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] The child body of the joint. If unset, then the system will try to find a suitable body ...
  - `drive_data`: `RigPhysicsDriveData` — [Read-Write] Optional motor/drive associated with the physics joint (RigPhysicsDriveData)
  - `joint_data`: `RigPhysicsJointData` [Read-Only] — [Read-Only] The properties of the joint (RigPhysicsJointData)
  - `parent_body_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] The parent body of the joint. If unset, then the system will try to find a suitable body...

### `unreal.RigPhysicsJointData`
Inherits: `StructBase` | Header: `RigPhysicsData.h`

### `unreal.RigPhysicsMaterial`
Inherits: `StructBase` | Header: `RigPhysicsData.h`

Material properties of a collision shapes.

### `unreal.RigPhysicsSimulationSpaceSettings`
Inherits: `StructBase` | Header: `RigPhysicsData.h`

These settings are used when the simulation is not done in world space. They allow the movement of the simulation space (e.g. the component) to be added to the local simulation in a controlled way.

### `unreal.RigPhysicsSolverComponent`
Inherits: `RigBaseComponent` | Header: `RigPhysicsSolverComponent.h`

A solver coordinates the physical movement of bodies

**Properties** (2):
  - `simulation_space_settings`: `RigPhysicsSimulationSpaceSettings` [Read-Only] — [Read-Only] (RigPhysicsSimulationSpaceSettings)
  - `solver_settings`: `RigPhysicsSolverSettings` [Read-Only] — [Read-Only] (RigPhysicsSolverSettings)

### `unreal.RigPhysicsSolverSettings`
Inherits: `StructBase` | Header: `RigPhysicsData.h`

Configuration/settings for the physics solver

**Properties** (4):
  - `collision`: `RigPhysicsCollision` [Read-Only] — [Read-Only] The collision shapes defined in the collision space - e.g. for representing a ground etc...
  - `collision_space`: `RigPhysicsSimulationSpace` [Read-Only] — [Read-Only] The space in which collision shapes are defined (RigPhysicsSimulationSpace)
  - `simulation_space`: `RigPhysicsSimulationSpace` [Read-Only] — [Read-Only] (RigPhysicsSimulationSpace)
  - `space_bone`: `RigElementKey` [Read-Only] — [Read-Only] The bone to use for the collision or simulation space (only relevant if one is set to Bo...

### `unreal.RigPhysicsVisualizationSettings`
Inherits: `StructBase` | Header: `RigPhysicsData.h`

Rig Physics Visualization Settings

### `unreal.RigUnit_AddPhysicsBody`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Adds a new physics body as a component on the owner element. Note: This node only runs as part of the construction event.

**Properties** (6):
  - `body_data`: `PhysicsControlModifierData` — [Read-Write] The runtime modifiable data (PhysicsControlModifierData)
  - `collision`: `RigPhysicsCollision` — [Read-Write] The collision properties of the new physics element (RigPhysicsCollision)
  - `dynamics`: `RigPhysicsDynamics` — [Read-Write] The dynamics properties of the new physics element (RigPhysicsDynamics)
  - `owner`: `RigElementKey` — [Read-Write] The owner of the newly created component (must be set/valid) (RigElementKey)
  - `physics_body_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] (RigComponentKey)
  - `solver`: `RigPhysicsBodySolverSettings` — [Read-Write] * The solver to relate this new physics element to (RigPhysicsBodySolverSettings)

### `unreal.RigUnit_AddPhysicsComponents`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsExecution.h`

Adds a set of physics components including the body, joint and controls

**Properties** (16):
  - `add_joint`: `bool` — [Read-Write] (bool)
  - `add_parent_space_control`: `bool` — [Read-Write] (bool)
  - `add_sim_space_control`: `bool` — [Read-Write] (bool)
  - `body_data`: `PhysicsControlModifierData` — [Read-Write] The runtime modifiable data of the new physics body (PhysicsControlModifierData)
  - `collision`: `RigPhysicsCollision` — [Read-Write] The collision properties of the new physics body (RigPhysicsCollision)
  - `drive_data`: `RigPhysicsDriveData` — [Read-Write] Optional motor/drive associated with the physics joint (RigPhysicsDriveData)
  - `dynamics`: `RigPhysicsDynamics` — [Read-Write] The dynamics properties of the new physics body (RigPhysicsDynamics)
  - `joint_data`: `RigPhysicsJointData` — [Read-Write] The properties of the joint (RigPhysicsJointData)
  - `owner`: `RigElementKey` — [Read-Write] The owner of the newly created component (must be set/valid) (RigElementKey)
  - `parent_space_control_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] (RigComponentKey)
  - `parent_space_control_data`: `PhysicsControlData` — [Read-Write] Data for the parent space control (PhysicsControlData)
  - `physics_body_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] (RigComponentKey)
  - `physics_joint_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] (RigComponentKey)
  - `sim_space_control_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] (RigComponentKey)
  - `sim_space_control_data`: `PhysicsControlData` — [Read-Write] Data for the simulation space control (PhysicsControlData)
  - `solver`: `RigPhysicsBodySolverSettings` — [Read-Write] The solver to relate this new physics element to (RigPhysicsBodySolverSettings)

### `unreal.RigUnit_AddPhysicsControl`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsControlExecution.h`

Adds a new physics control as a component on the owner element. Note: This node only runs as part of the construction event.

**Properties** (7):
  - `child_body_component_key`: `RigComponentKey` — [Read-Write] The body that is controlled (RigComponentKey)
  - `control_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] (RigComponentKey)
  - `control_data`: `PhysicsControlData` — [Read-Write] Describes the initial strength etc of the new control (PhysicsControlData)
  - `control_multiplier`: `PhysicsControlMultiplier` — [Read-Write] Fine control over the control strengths etc (PhysicsControlMultiplier)
  - `control_target`: `PhysicsControlTarget` — [Read-Write] Describes the initial target for the new control (PhysicsControlTarget)
  - `owner`: `RigElementKey` — [Read-Write] The owner of the newly created component (must be set/valid) (RigElementKey)
  - `parent_body_component_key`: `RigComponentKey` — [Read-Write] The optional body that âdoesâ the controlling - though if it is dynamic then it can...

### `unreal.RigUnit_AddPhysicsJoint`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsJointExecution.h`

Adds a new physics body as a component on the owner element. Note: This node only runs as part of the construction event.

**Properties** (6):
  - `child_body_component_key`: `RigComponentKey` — [Read-Write] The child body of the joint. If unset, then the system will try to find a suitable body...
  - `drive_data`: `RigPhysicsDriveData` — [Read-Write] Optional motor/drive associated with the physics joint (RigPhysicsDriveData)
  - `joint_data`: `RigPhysicsJointData` — [Read-Write] The properties of the joint (RigPhysicsJointData)
  - `owner`: `RigElementKey` — [Read-Write] The owner of the newly created component (must be set/valid) (RigElementKey)
  - `parent_body_component_key`: `RigComponentKey` — [Read-Write] The parent body of the joint. If unset, then the system will try to find a suitable bod...
  - `physics_joint_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] (RigComponentKey)

### `unreal.RigUnit_AddPhysicsSolver`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsExecution.h`

Adds a new physics solver as a component on the owner element. Note: This node only runs as part of the construction event.

**Properties** (4):
  - `owner`: `RigElementKey` — [Read-Write] The owner of the newly created component (must be set/valid) (RigElementKey)
  - `physics_solver_component_key`: `RigComponentKey` [Read-Only] — [Read-Only] (RigComponentKey)
  - `simulation_space_settings`: `RigPhysicsSimulationSpaceSettings` — [Read-Write] (RigPhysicsSimulationSpaceSettings)
  - `solver_settings`: `RigPhysicsSolverSettings` — [Read-Write] (RigPhysicsSolverSettings)

### `unreal.RigUnit_GetPhysicsSolverSpaceData`
Inherits: `RigUnit_PhysicsBase` | Header: `RigPhysicsExecution.h`

Retrieves the simulation space data. Note that this will have been generated during the simulation step, so the values returned will relate to the previous update if the solver has not yet been steppe...

**Properties** (6):
  - `angular_acceleration`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `angular_velocity`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `gravity`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `linear_acceleration`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `linear_velocity`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `physics_solver_component_key`: `RigComponentKey` — [Read-Write] The solver to relate this new physics element to (RigComponentKey)

### `unreal.RigUnit_HierarchyAutoCalculateCollision`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Discards any existing collision data and replaces it with a box based on the joint positions. Note that this must be called before the physics solver is instantiated/stepped.

**Properties** (3):
  - `min_aspect_ratio`: `float` — The minimum box extent, as a proportion of the maximum box extent.
For capsules: The minimum radius,...
  - `min_size`: `float` — The minimum side length.
For capsules: The minimum radius (float) [Read-Write] For boxes
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchyDisableCollisionBetween`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Disables collision between two bodies

**Properties** (2):
  - `physics_body_component_key1`: `RigComponentKey` — [Read-Write] (RigComponentKey)
  - `physics_body_component_key2`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchyInstantiateFromPhysicsAsset`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsExecution.h`

Creates multiple physics components based on the supplied physics asset. Note that the resulting simulation bodies may not precisely match the physics asset.

**Properties** (14):
  - `add_parent_space_control`: `bool` — [Read-Write] (bool)
  - `add_sim_space_control`: `bool` — [Read-Write] (bool)
  - `bones_to_use`: `None` — [Read-Write] If this is empty, then all bodies in the physics asset that match a bone in the hierarc...
  - `constraint_profile_name`: `Name` — [Read-Write] Name of the constraint profile to use. If empty (or invalid), the default profile will ...
  - `enable_drives`: `bool` — [Read-Write] Whether to enable the drives authored in the physics asset. Note that if you are creati...
  - `enable_joints`: `bool` — [Read-Write] Whether to enable the joints authored in the physics asset. Note that you canât have ...
  - `parent_space_control_component_keys`: `None` [Read-Only] — [Read-Only] (Array[RigComponentKey])
  - `parent_space_control_data`: `PhysicsControlData` — [Read-Write] Data for the parent space control (PhysicsControlData)
  - `physics_asset`: `PhysicsAsset` — [Read-Write] (PhysicsAsset)
  - `physics_body_component_keys`: `None` [Read-Only] — [Read-Only] (Array[RigComponentKey])
  - `physics_joint_component_keys`: `None` [Read-Only] — [Read-Only] (Array[RigComponentKey])
  - `sim_space_control_component_keys`: `None` [Read-Only] — [Read-Only] (Array[RigComponentKey])
  - `sim_space_control_data`: `PhysicsControlData` — [Read-Write] Data for the simulation space control (PhysicsControlData)
  - `solver`: `RigPhysicsBodySolverSettings` — [Read-Write] (RigPhysicsBodySolverSettings)

### `unreal.RigUnit_HierarchySetCollision`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Sets the collision for a physics component body

**Properties** (2):
  - `collision`: `RigPhysicsCollision` — [Read-Write] (RigPhysicsCollision)
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetControlData`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsControlExecution.h`

Sets the control data for a physics control

**Properties** (2):
  - `control_data`: `PhysicsControlData` — [Read-Write] (PhysicsControlData)
  - `physics_control_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetControlMultiplier`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsControlExecution.h`

Sets the multipliers for a physics control

**Properties** (2):
  - `control_multiplier`: `PhysicsControlMultiplier` — [Read-Write] (PhysicsControlMultiplier)
  - `physics_control_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetControlTarget`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsControlExecution.h`

Sets the target for a physics control

**Properties** (2):
  - `control_target`: `PhysicsControlTarget` — [Read-Write] (PhysicsControlTarget)
  - `physics_control_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetDynamics`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Sets the mass etc for a physics component body

**Properties** (2):
  - `dynamics`: `RigPhysicsDynamics` — [Read-Write] (RigPhysicsDynamics)
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetJointData`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsJointExecution.h`

Sets the joint for a physics component body

**Properties** (2):
  - `joint_data`: `RigPhysicsJointData` — [Read-Write] (RigPhysicsJointData)
  - `physics_joint_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetJointDriveData`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsJointExecution.h`

Sets the joint drive for a physics component body

**Properties** (2):
  - `drive_data`: `RigPhysicsDriveData` — [Read-Write] (RigPhysicsDriveData)
  - `physics_joint_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetPhysicsBodyCollisionType`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Sets what collision mode is used for this body

**Properties** (2):
  - `collision_type`: `CollisionEnabled` — [Read-Write] (CollisionEnabled)
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetPhysicsBodyDamping`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

If true, then kinematic objects will be written back from simulation to the bones. This only necessary when either kinematic targets are being used, or when the target bone differs from the source bon...

**Properties** (3):
  - `angular_damping`: `float` — [Read-Write] (float)
  - `linear_damping`: `float` — [Read-Write] (float)
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetPhysicsBodyGravityMultiplier`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Sets the multiplier on gravity that should be applied to the body.

**Properties** (2):
  - `gravity_multiplier`: `float` — [Read-Write] (float)
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetPhysicsBodyKinematicTarget`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Sets the kinematic target for a body - note that this wonât actually make the body kinematic

**Properties** (3):
  - `kinematic_target`: `Transform` — [Read-Write] (Transform)
  - `kinematic_target_space`: `RigPhysicsKinematicTargetSpace` — [Read-Write] (RigPhysicsKinematicTargetSpace)
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetPhysicsBodyMovementType`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Sets the movement mode for this body. Danny TODO explain the different between kinematic and static

**Properties** (2):
  - `movement_type`: `PhysicsMovementType` — [Read-Write] (PhysicsMovementType)
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetPhysicsBodyPhysicsBlendWeight`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Controls the amount that the simulation is blended back into the target bones. Danny TODO implement

**Properties** (2):
  - `physics_blend_weight`: `float` — [Read-Write] (float)
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetPhysicsBodySourceBone`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Sets what bone is used as a source transform for the physics body. This is used as a kinematic target, and when initializing the simulation.

**Properties** (2):
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)
  - `source_bone`: `RigElementKey` — [Read-Write] (RigElementKey)

### `unreal.RigUnit_HierarchySetPhysicsBodySparseData`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Sets all the data on a body - but in a sparse way so you can decide which parameters get applied. Danny TODO - Note that the sparse data does not get displayed correctly, so this is largely unusable -...

**Properties** (2):
  - `data`: `PhysicsControlModifierSparseData` — [Read-Write] (PhysicsControlModifierSparseData)
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)

### `unreal.RigUnit_HierarchySetPhysicsBodyTargetBone`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Sets what bone is targeted by the simulation - i.e. where the simulation output is written to.

**Properties** (2):
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)
  - `target_bone`: `RigElementKey` — [Read-Write] (RigElementKey)

### `unreal.RigUnit_HierarchySetPhysicsBodyUpdateKinematicFromSimulation`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

If true, then kinematic objects will be written back from simulation to the bones. This only necessary when either kinematic targets are being used, or when the target bone differs from the source bon...

**Properties** (2):
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)
  - `update_kinematic_from_simulation`: `bool` — [Read-Write] (bool)

### `unreal.RigUnit_HierarchySetPhysicsBodyUseSkeletalAnimation`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsBodyExecution.h`

Danny TODO I think this is redundant given the ability to specify the space when kinematic targets are set. Investigate propagating that into the rest of Physics Control.

**Properties** (2):
  - `physics_body_component_key`: `RigComponentKey` — [Read-Write] (RigComponentKey)
  - `use_skeletal_animation`: `bool` — [Read-Write] (bool)

### `unreal.RigUnit_InstantiatePhysics`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsExecution.h`

Instantiates all the objects in the physics world. Some properties canât be modified after this happens. Note that it will happen automatically during the first simulation step if it hasnât been e...

**Properties** (1):
  - `physics_solver_component_key`: `RigComponentKey` — [Read-Write] * The solver to relate this new physics element to (RigComponentKey)

### `unreal.RigUnit_MakeArticulationDriveData`
Inherits: `RigUnit_PhysicsBase` | Header: `RigPhysicsJointExecution.h`

Helper to simplify creation of articulation drive data

**Properties** (7):
  - `angular_damping_ratio`: `float` — [Read-Write] The amount of damping associated with the angular strength. A value of 1 Results in cri...
  - `angular_drive_mode`: `AngularDriveMode` — [Read-Write] The type of drive. Note that SLERP drives donât work if any axis is locked (AngularDr...
  - `angular_extra_damping`: `float` — [Read-Write] The amount of additional angular damping. This is added to the damping that comes from ...
  - `angular_strength`: `float` — [Read-Write] The strength used to drive angular motion (float)
  - `drive_data`: `RigPhysicsDriveData` [Read-Only] — [Read-Only] (RigPhysicsDriveData)
  - `enable_angular_drive`: `bool` — [Read-Write] Whether to enable the angular drive (bool)
  - `skeletal_animation_velocity_multiplier`: `float` — [Read-Write] The amount of skeletal animation velocity to use in the targets (float)

### `unreal.RigUnit_MakeArticulationJointData`
Inherits: `RigUnit_PhysicsBase` | Header: `RigPhysicsJointExecution.h`

Helper to simplify creation of joint data

**Properties** (4):
  - `angular_limit`: `Vector` — [Read-Write] Degrees, twist, swing1, swing2
-ve indicates the limit range is free (Vector)
  - `joint_data`: `RigPhysicsJointData` [Read-Only] — [Read-Only] (RigPhysicsJointData)
  - `soft_damping_ratio`: `Vector` — [Read-Write] (Vector)
  - `soft_strength`: `Vector` — [Read-Write] If limited, then this will be used to control the softness
-ve indicates the limit is h...

### `unreal.RigUnit_MakeDriveData`
Inherits: `RigUnit_PhysicsBase` | Header: `RigPhysicsJointExecution.h`

Helper to simplify creation of drive data

**Properties** (11):
  - `angular_damping_ratio`: `float` — [Read-Write] The amount of damping associated with the angular strength. A value of 1 Results in cri...
  - `angular_drive_mode`: `AngularDriveMode` — [Read-Write] The type of drive. Note that SLERP drives donât work if any axis is locked (AngularDr...
  - `angular_extra_damping`: `float` — [Read-Write] The amount of additional angular damping. This is added to the damping that comes from ...
  - `angular_strength`: `float` — [Read-Write] The strength used to drive angular motion (float)
  - `drive_data`: `RigPhysicsDriveData` [Read-Only] — [Read-Only] (RigPhysicsDriveData)
  - `enable_angular_drive`: `bool` — [Read-Write] Whether to enable the angular drive (bool)
  - `enable_linear_drive`: `bool` — [Read-Write] Whether to enable the linear drive (not normally used for character joints) (bool)
  - `linear_damping_ratio`: `float` — [Read-Write] The amount of damping associated with the linear strength. A value of 1 Results in crit...
  - `linear_extra_damping`: `float` — [Read-Write] The amount of additional linear damping. This is added to the damping that comes from L...
  - `linear_strength`: `float` — [Read-Write] The strength used to drive linear motion (float)
  - `skeletal_animation_velocity_multiplier`: `float` — [Read-Write] The amount of skeletal animation velocity to use in the targets (float)

### `unreal.RigUnit_PhysicsBase`
Inherits: `RigUnit` | Header: `RigPhysicsExecution.h`

Base struct for all other non-mutable physics nodes

### `unreal.RigUnit_PhysicsBaseMutable`
Inherits: `RigUnitMutable` | Header: `RigPhysicsExecution.h`

Base struct for all other mutable physics nodes

### `unreal.RigUnit_StepPhysicsSolver`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsExecution.h`

Steps the specified physics solver

**Properties** (5):
  - `alpha`: `float` — [Read-Write] How much of the simulation is combined with the input bone. This currently happens in
c...
  - `delta_time_override`: `float` — [Read-Write] If this is zero, then the execute context time will be used. If this is positive then i...
  - `physics_solver_component_key`: `RigComponentKey` — [Read-Write] The solver to relate this new physics element to (RigComponentKey)
  - `simulation_space_delta_time_override`: `float` — [Read-Write] If this is zero, then the simulation delta time will be used for evaluating movement of...
  - `visualization_settings`: `RigPhysicsVisualizationSettings` — [Read-Write] (RigPhysicsVisualizationSettings)

### `unreal.RigUnit_TrackInputPose`
Inherits: `RigUnit_PhysicsBaseMutable` | Header: `RigPhysicsExecution.h`

Forces tracking of the input animation (on all physics bodies) for the next N frames

**Properties** (3):
  - `force_number_of_frames`: `bool` — [Read-Write] If true, then the number will be forced, potentially reducing the number. If false, the...
  - `number_of_frames`: `int` — [Read-Write] The number of frames to track the input pose for (int32)
  - `physics_solver_component_key`: `RigComponentKey` — [Read-Write] The solver to relate this new physics element to (RigComponentKey)

### `unreal.RigPhysicsCombineMode`
Inherits: `EnumBase` | Header: `RigPhysicsData.h`

How to combine friction/restitution values.

**Properties** (4):
  - `AVG`: `RigPhysicsCombineMode = Ellipsis` — 0
  - `MAX`: `RigPhysicsCombineMode = Ellipsis` — 3
  - `MIN`: `RigPhysicsCombineMode = Ellipsis` — 1
  - `MULTIPLY`: `RigPhysicsCombineMode = Ellipsis` — 2

### `unreal.RigPhysicsKinematicTargetSpace`
Inherits: `EnumBase` | Header: `RigPhysicsData.h`

Specifies what space a kinematic target is defined in Danny TODO this is much better than the similar mechanism in PCC and RBWC (which has a bUseSkeletalAnimation) - switch them to use this.

**Properties** (6):
  - `COMPONENT`: `RigPhysicsKinematicTargetSpace = Ellipsis` — Target is in the space of the component 1
  - `IGNORE_TARGET`: `RigPhysicsKinematicTargetSpace = Ellipsis` — Ignore the specified target, and just track the bone 5
  - `OFFSET_IN_BONE_SPACE`: `RigPhysicsKinematicTargetSpace = Ellipsis` — Target is specified relative to the bone that controls the (kinematic) body, with the offset
applied...
  - `OFFSET_IN_COMPONENT_SPACE`: `RigPhysicsKinematicTargetSpace = Ellipsis` — Target is specified relative to the bone that controls the (kinematic) body, with the offset
applied...
  - `OFFSET_IN_WORLD_SPACE`: `RigPhysicsKinematicTargetSpace = Ellipsis` — Target is specified relative to the bone that controls the (kinematic) body, with the offset
applied...
  - `WORLD`: `RigPhysicsKinematicTargetSpace = Ellipsis` — Target is in world space 0

### `unreal.RigPhysicsSimulationSpace`
Inherits: `EnumBase` | Header: `RigPhysicsData.h`

Specifies what space the simulation should run in

**Properties** (3):
  - `COMPONENT`: `RigPhysicsSimulationSpace = Ellipsis` — Simulate in component space. Moving the entire skeletal mesh will have no affect on velocities
unles...
  - `SPACE_BONE`: `RigPhysicsSimulationSpace = Ellipsis` — Simulate in the space of the specified bone. Moving the entire skeletal mesh and/or the Bone
will ha...
  - `WORLD`: `RigPhysicsSimulationSpace = Ellipsis` — Simulate in world space. Moving the skeletal mesh will generate velocity changes 0
