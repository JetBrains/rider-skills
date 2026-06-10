# UE Python API — PhysicsControl Module

**41 types** from the `PhysicsControl` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_RigidBodyWithControl`, `InitialBodyModifier`, `InitialCharacterControls`, `InitialPhysicsControl`, `PhysicsBodyModifier`, `PhysicsBodyModifierCreationData`, `PhysicsControl`, `PhysicsControlAndBodyModifierCreationDatas`, `PhysicsControlCharacterSetupData`, `PhysicsControlControlAndModifierParameters`, `PhysicsControlControlAndModifierUpdates`, `PhysicsControlCreationData`, `PhysicsControlData`, `PhysicsControlLimbBones`, `PhysicsControlLimbSetupData`, `PhysicsControlModifierData`, `PhysicsControlModifierSparseData`, `PhysicsControlMultiplier`, `PhysicsControlNamedControlMultiplierParameters`, `PhysicsControlNamedControlParameters`, ... (41 total)

---

## Classes

### `unreal.AnimNode_RigidBodyWithControl`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_RigidBodyWithControl.h`

Controller that simulates physics based on the physics asset of the skeletal mesh component

### `unreal.InitialBodyModifier`
Inherits: `StructBase` | Header: `PhysicsControlActor.h`

Structure that determines a Body Modifier used during initialization of the physics control actor

**Properties** (6):
  - `actor`: `Actor` — [Read-Write] The owner of the mesh that that we will modify (Actor)
  - `body_modifier_data`: `PhysicsControlModifierData` — [Read-Write] How the body should move etc (PhysicsControlModifierData)
  - `bone_name`: `Name` — [Read-Write] If the mesh component is skeletal, then the name of the skeletal mesh bone to modify (N...
  - `kinematic_target_orientation`: `Rotator` — [Read-Write] The target orientation when kinematic. Note that this is applied on top of any animatio...
  - `kinematic_target_position`: `Vector` — [Read-Write] The target position when kinematic. Note that this is applied on top of any animation
t...
  - `mesh_component_name`: `Name` — [Read-Write] The mesh that will be modify. If this is blank but there is an actor, then weâll atte...

### `unreal.InitialCharacterControls`
Inherits: `StructBase` | Header: `PhysicsControlActor.h`

Structure that holds the data necessary to set up a default set of limb controls for a character

**Properties** (6):
  - `body_modifier_data`: `PhysicsControlModifierData` — [Read-Write] (PhysicsControlModifierData)
  - `character_actor`: `Actor` — [Read-Write] The owner of the character skeletal mesh (Actor)
  - `limb_setup_data`: `None` — [Read-Write] (Array[PhysicsControlLimbSetupData])
  - `parent_space_control_data`: `PhysicsControlData` — [Read-Write] (PhysicsControlData)
  - `skeletal_mesh_component_name`: `Name` — [Read-Write] The skeletal mesh that will have controls set up. If this is blank but there is an acto...
  - `world_space_control_data`: `PhysicsControlData` — [Read-Write] (PhysicsControlData)

### `unreal.InitialPhysicsControl`
Inherits: `StructBase` | Header: `PhysicsControlActor.h`

Structure that determines a Physics Control used during initialization of the physics control actor

**Properties** (9):
  - `child_actor`: `Actor` — [Read-Write] The owner of the mesh that the control will be driving (Actor)
  - `child_bone_name`: `Name` — [Read-Write] If the child mesh component is skeletal, then the name of the skeletal mesh bone that t...
  - `child_mesh_component_name`: `Name` — [Read-Write] The mesh that the control will be driving. If this is blank but there is an actor, then...
  - `control_data`: `PhysicsControlData` — [Read-Write] Strength and damping parameters. Can be modified at any time, but will sometimes have
b...
  - `control_multiplier`: `PhysicsControlMultiplier` — [Read-Write] Multiplier for the ControlData. This will typically be modified dynamically, and also e...
  - `control_target`: `PhysicsControlTarget` — [Read-Write] The position/orientation etc targets for the controls. These are procedural/explicit co...
  - `parent_actor`: `Actor` — [Read-Write] The owner of the mesh that will be doing the driving. Blank/non-existent means it will ...
  - `parent_bone_name`: `Name` — [Read-Write] If the parent mesh component is skeletal, then the name of the skeletal mesh bone that ...
  - `parent_mesh_component_name`: `Name` — [Read-Write] The mesh that will be doing the driving. If this is blank but there is an actor, then w...

### `unreal.PhysicsBodyModifier`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Represents a single/individual body modifier, with the modifier data

**Properties** (2):
  - `bone_name`: `Name` — [Read-Write] (Name)
  - `modifier_data`: `PhysicsControlModifierData` — [Read-Write] (PhysicsControlModifierData)

### `unreal.PhysicsBodyModifierCreationData`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Used on creation, to allow requesting the modifier to be in certain sets

**Properties** (2):
  - `modifier`: `PhysicsBodyModifier` — [Read-Write] (PhysicsBodyModifier)
  - `sets`: `None` — [Read-Write] (Array[Name])

### `unreal.PhysicsControl`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Structure that determines a âcontrolâ - this contains all the information needed to drive (with spring-dampers) a child body relative to a parent body. These bodies will be associated with either ...

**Properties** (4):
  - `child_bone_name`: `Name` — [Read-Write] The name of the skeletal mesh bone or the name of the static mesh body that the control...
  - `control_data`: `PhysicsControlData` — [Read-Write] Strength and damping parameters. Can be modified at any time, but will sometimes have
b...
  - `control_multiplier`: `PhysicsControlMultiplier` — [Read-Write] Multiplier for the ControlData. This will typically be modified dynamically, and also e...
  - `parent_bone_name`: `Name` — [Read-Write] The name of the skeletal mesh bone or the name of the static mesh body that will be doi...

### `unreal.PhysicsControlAndBodyModifierCreationDatas`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Collection of controls and body modifiers, used for creation

**Properties** (2):
  - `controls`: `None` — [Read-Write] (Map[Name,PhysicsControlCreationData])
  - `modifiers`: `None` — [Read-Write] (Map[Name,PhysicsBodyModifierCreationData])

### `unreal.PhysicsControlCharacterSetupData`
Inherits: `StructBase` | Header: `PhysicsControlLimbData.h`

Physics Control Character Setup Data

### `unreal.PhysicsControlControlAndModifierParameters`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

These apply temporary/ephemeral changes to the controls that only persist for one tick.

**Properties** (3):
  - `control_multiplier_parameters`: `None` — [Read-Write] Multipliers for existing controls. Each name can be the name of a control, or the name ...
  - `control_parameters`: `None` — [Read-Write] Parameters for existing controls. Each name can be the name of a control, or the name o...
  - `modifier_parameters`: `None` — [Read-Write] Parameters for existing modifiers. Each name can be the name of a modifier, or the name...

### `unreal.PhysicsControlControlAndModifierUpdates`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

These apply permanent changes to the controls and modifiers, allowing all the settings to be changed (apart from the actual bodies that are being controlled/affected)

**Properties** (3):
  - `control_multiplier_updates`: `None` — [Read-Write] Modifications to the underlying control multipliers (Array[PhysicsControlNamedControlMu...
  - `control_updates`: `None` — [Read-Write] Modifications to the underlying controls (Array[PhysicsControlNamedControlParameters])
  - `modifier_updates`: `None` — [Read-Write] Modifications to the underlying modifiers (Array[PhysicsControlNamedModifierParameters]...

### `unreal.PhysicsControlCreationData`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Used on creation, to allow requesting the control to be in certain sets

**Properties** (2):
  - `control`: `PhysicsControl` — [Read-Write] (PhysicsControl)
  - `sets`: `None` — [Read-Write] (Array[Name])

### `unreal.PhysicsControlData`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Contains data associated with how physical bodies should be controlled/directed towards their targets. The underlying control is done through damped springs, so the parameters here relate to that.

**Properties** (17):
  - `angular_damping_ratio`: `float` — [Read-Write] The amount of damping associated with the angular strength. A value of 1 Results in cri...
  - `angular_extra_damping`: `float` — [Read-Write] The amount of additional angular damping. This is added to the damping that comes from ...
  - `angular_strength`: `float` — [Read-Write] The strength used to drive angular motion (float)
  - `angular_target_velocity_multiplier`: `float` — [Read-Write] Multiplier on the angular velocity, which gets applied to the damping. A value of 1 mea...
  - `custom_control_point`: `Vector` — [Read-Write] The position of the control point relative to the child mesh, when using a custom contr...
  - `disable_collision`: `bool` — [Read-Write] Whether or not this control should disable collision between the parent and child bodie...
  - `enabled`: `bool` — [Read-Write] Whether this control should be enabled (bool)
  - `linear_damping_ratio`: `float` — [Read-Write] The amount of damping associated with the linear strength. A value of 1 Results in crit...
  - `linear_extra_damping`: `float` — [Read-Write] The amount of additional linear damping. This is added to the damping that comes from L...
  - `linear_strength`: `float` — [Read-Write] The strength used to drive linear motion (float)
  - `linear_target_velocity_multiplier`: `float` — [Read-Write] Multiplier on the velocity, which gets applied to the damping. A value of 1 means the a...
  - `max_force`: `float` — [Read-Write] The maximum force used to drive the linear motion. Zero indicates no limit. (float)
  - `max_torque`: `float` — [Read-Write] The maximum torque used to drive the angular motion. Zero indicates no limit. (float)
  - `only_control_child_object`: `bool` — [Read-Write] If true then the control will only affect the child object, not the parent (bool)
  - `skeletal_animation_velocity_multiplier`: `float` — [Read-Write] The amount of skeletal animation velocity to use in the targets
NOTE This is currently ...
  - `use_custom_control_point`: `bool` — [Read-Write] Whether or not to use the custom control point position (bool)
  - `use_skeletal_animation`: `bool` — [Read-Write] If true then the target will be applied on top of the skeletal animation (if there is a...

### `unreal.PhysicsControlLimbBones`
Inherits: `StructBase` | Header: `PhysicsControlLimbData.h`

Wrapper for the array of bone names, so that the limbs can we can work with a map of arrays of names.

### `unreal.PhysicsControlLimbSetupData`
Inherits: `StructBase` | Header: `PhysicsControlLimbData.h`

Setup data that are used to create the representation of a single limb. A limb is an array of contiguous bones (e.g. left arm, or the spine etc). We can define it has the set of bones that are childre...

**Properties** (6):
  - `create_body_modifiers`: `bool` — [Read-Write] Whether to create body modifiers for this limb (bool)
  - `create_parent_space_controls`: `bool` — [Read-Write] Whether to create parent-space controls for this limb (bool)
  - `create_world_space_controls`: `bool` — [Read-Write] Whether to create-world space controls for this limb (bool)
  - `include_parent_bone`: `bool` — [Read-Write] * Whether or not to include the parent of the start bone. This is intended to be used f...
  - `limb_name`: `Name` — [Read-Write] The name of the limb that this will be used to create (Name)
  - `start_bone`: `Name` — [Read-Write] * Normally the root-most bone of the limb (e.g. left clavicle when defining the left ar...

### `unreal.PhysicsControlModifierData`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Analogous to the ControlData, this indicates how an individual controlled body should move

**Properties** (6):
  - `collision_type`: `CollisionEnabled` — [Read-Write] The collision type. Note that PhysicsControlComponent uses the full filtering, but
Rigi...
  - `gravity_multiplier`: `float` — [Read-Write] How much gravity to use when simulating - typically between 0 and 1 (float)
  - `movement_type`: `PhysicsMovementType` — [Read-Write] How the body should move. (PhysicsMovementType)
  - `physics_blend_weight`: `float` — [Read-Write] When converting back from simulation to animation, how much to use the simulation outpu...
  - `update_kinematic_from_simulation`: `bool` — [Read-Write] If true then the associated actorâs transform will be updated from the simulation whe...
  - `use_skeletal_animation`: `bool` — [Read-Write] If true then the target will be applied on top of the skeletal animation (if there is a...

### `unreal.PhysicsControlModifierSparseData`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Analogous to the ControlData, this indicates how an individual controlled body should move, with flags indicating whether each element should get used.

**Properties** (6):
  - `collision_type`: `CollisionEnabled` — [Read-Write] The collision type. Note that PhysicsControlComponent uses the full filtering, but
Rigi...
  - `gravity_multiplier`: `float` — [Read-Write] How much gravity to use when simulating - typically between 0 and 1 (float)
  - `movement_type`: `PhysicsMovementType` — [Read-Write] How the body should move. (PhysicsMovementType)
  - `physics_blend_weight`: `float` — [Read-Write] When converting back from simulation to animation, how much to use the simulation outpu...
  - `update_kinematic_from_simulation`: `bool` — [Read-Write] If true then the associated actorâs transform will be updated from the simulation whe...
  - `use_skeletal_animation`: `bool` — [Read-Write] If true then the target will be applied on top of the skeletal animation (if there is a...

### `unreal.PhysicsControlMultiplier`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

These parameters allow modification of the parameters in FPhysicsControlData for two reasons: 1. They allow per-axis settings for the linear components (e.g. so you can drive an object

**Properties** (8):
  - `angular_damping_ratio_multiplier`: `float` — [Read-Write] Multiplier on the angular damping ratio. (float)
  - `angular_extra_damping_multiplier`: `float` — [Read-Write] Multiplier on the angular extra damping. (float)
  - `angular_strength_multiplier`: `float` — [Read-Write] Multiplier on the angular strength. (float)
  - `linear_damping_ratio_multiplier`: `Vector` — [Read-Write] Per-direction multiplier on the linear damping ratio. (Vector)
  - `linear_extra_damping_multiplier`: `Vector` — [Read-Write] Per-direction multiplier on the linear extra damping. (Vector)
  - `linear_strength_multiplier`: `Vector` — [Read-Write] Per-direction multiplier on the linear strength. (Vector)
  - `max_force_multiplier`: `Vector` — [Read-Write] Per-direction multiplier on the maximum force that can be applied. Note that zero means...
  - `max_torque_multiplier`: `float` — [Read-Write] Per-direction multiplier on the maximum torque that can be applied. Note that zero mean...

### `unreal.PhysicsControlNamedControlMultiplierParameters`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Data that can be used to parameterize (modify/update) a control multiplier

**Properties** (2):
  - `data`: `PhysicsControlSparseMultiplier` — [Read-Write] (PhysicsControlSparseMultiplier)
  - `name`: `Name` — [Read-Write] The name of the control (or set of controls) to update (Name)

### `unreal.PhysicsControlNamedControlParameters`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Data that can be used to parameterize (modify/update) a control

**Properties** (2):
  - `data`: `PhysicsControlSparseData` — [Read-Write] (PhysicsControlSparseData)
  - `name`: `Name` — [Read-Write] The name of the control (or set of controls) to update (Name)

### `unreal.PhysicsControlNamedModifierParameters`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Data that can be used to parameterize(modify / update) a modifier

**Properties** (2):
  - `data`: `PhysicsControlModifierSparseData` — [Read-Write] (PhysicsControlModifierSparseData)
  - `name`: `Name` — [Read-Write] The name of the modifier (or set of modifiers) to update (Name)

### `unreal.PhysicsControlNames`
Inherits: `StructBase` | Header: `PhysicsControlLimbData.h`

Wrapper for the array of names, so that the control/modifier sets can we work with a map of arrays of names. Note that in practice, the names will be of either controls or body modifiers.

**Properties** (1):
  - `names`: `None` — [Read-Write] The names of either controls of body modifiers (depending on context) (Array[Name])

### `unreal.PhysicsControlSetUpdate`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Update an existing set, or add to it

**Properties** (2):
  - `names`: `None` — [Read-Write] The names of either controls or body modifiers (depending on context), or sets of contr...
  - `set_name`: `Name` — [Read-Write] (Name)

### `unreal.PhysicsControlSetUpdates`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Combines updates for control and modifier sets

**Properties** (2):
  - `control_set_updates`: `None` — [Read-Write] (Array[PhysicsControlSetUpdate])
  - `modifier_set_updates`: `None` — [Read-Write] (Array[PhysicsControlSetUpdate])

### `unreal.PhysicsControlSparseData`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Strength and damping etc parameters that will affect a control, with flags indicating whether each element should get used.

**Properties** (17):
  - `angular_damping_ratio`: `float` — [Read-Write] The amount of damping associated with the angular strength. A value of 1 Results in cri...
  - `angular_extra_damping`: `float` — [Read-Write] The amount of additional angular damping. This is added to the damping that comes from ...
  - `angular_strength`: `float` — [Read-Write] The strength used to drive angular motion (float)
  - `angular_target_velocity_multiplier`: `float` — [Read-Write] Multiplier on the angular velocity, which gets applied to the damping. A value of 1 mea...
  - `custom_control_point`: `Vector` — [Read-Write] The position of the control point relative to the child mesh, when using a custom contr...
  - `disable_collision`: `bool` — [Read-Write] Whether or not this control should disable collision between the parent and child bodie...
  - `enabled`: `bool` — [Read-Write] Whether this control should be enabled (bool)
  - `linear_damping_ratio`: `float` — [Read-Write] The amount of damping associated with the linear strength. A value of 1 Results in crit...
  - `linear_extra_damping`: `float` — [Read-Write] The amount of additional linear damping. This is added to the damping that comes from L...
  - `linear_strength`: `float` — [Read-Write] The strength used to drive linear motion (float)
  - `linear_target_velocity_multiplier`: `float` — [Read-Write] Multiplier on the velocity, which gets applied to the damping. A value of 1 means the a...
  - `max_force`: `float` — [Read-Write] The maximum force used to drive the linear motion. Zero indicates no limit.
Note - not ...
  - `max_torque`: `float` — [Read-Write] The maximum torque used to drive the angular motion. Zero indicates no limit.
Note - no...
  - `only_control_child_object`: `bool` — [Read-Write] If true then the control will only affect the child object, not the parent (bool)
  - `skeletal_animation_velocity_multiplier`: `float` — [Read-Write] The amount of skeletal animation velocity to use in the targets
NOTE This is currently ...
  - `use_custom_control_point`: `bool` — [Read-Write] Whether or not to use the custom control point position (bool)
  - `use_skeletal_animation`: `bool` — [Read-Write] If true then the target will be applied on top of the skeletal animation (if there is a...

### `unreal.PhysicsControlSparseMultiplier`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

These parameters allow modification of the parameters in FPhysicsControlData for two reasons: 1. They allow per-axis settings for the linear components (e.g. so you can drive an object

**Properties** (8):
  - `angular_damping_ratio_multiplier`: `float` — [Read-Write] Multiplier on the angular damping ratio. (float)
  - `angular_extra_damping_multiplier`: `float` — [Read-Write] Multiplier on the angular extra damping. (float)
  - `angular_strength_multiplier`: `float` — [Read-Write] Multiplier on the angular strength. (float)
  - `linear_damping_ratio_multiplier`: `Vector` — [Read-Write] Per-direction multiplier on the linear damping ratio. (Vector)
  - `linear_extra_damping_multiplier`: `Vector` — [Read-Write] Per-direction multiplier on the linear extra damping. (Vector)
  - `linear_strength_multiplier`: `Vector` — [Read-Write] Per-direction multiplier on the linear strength. (Vector)
  - `max_force_multiplier`: `Vector` — [Read-Write] Per-direction multiplier on the maximum force that can be applied. Note that zero means...
  - `max_torque_multiplier`: `float` — [Read-Write] Per-direction multiplier on the maximum torque that can be applied. Note that zero mean...

### `unreal.PhysicsControlTarget`
Inherits: `StructBase` | Header: `PhysicsControlData.h`

Defines a target position and orientation, and also the target velocity and angular velocity. In many cases the velocities will be calculated automatically (e.g. when setting the target position, the ...

**Properties** (5):
  - `apply_control_point_to_target`: `bool` — [Read-Write] Whether to use the ControlPoint as an offset for the target transform, as well as the
p...
  - `target_angular_velocity`: `Vector` — [Read-Write] The target angular velocity (revolutions per second) of the child body, relative to the...
  - `target_orientation`: `Rotator` — [Read-Write] The target orientation of the child body, relative to the parent body (Rotator)
  - `target_position`: `Vector` — [Read-Write] The target position of the child body, relative to the parent body (Vector)
  - `target_velocity`: `Vector` — [Read-Write] The target velocity of the child body, relative to the parent body (Vector)

### `unreal.RigidBodyControlTarget`
Inherits: `StructBase` | Header: `RigidBodyControlData.h`

A single target for a control, which may be defined as an offset from the (implicit) animation target.

**Properties** (2):
  - `target_orientation`: `Rotator` — [Read-Write] The target orientation of the child body, relative to the parent body (Rotator)
  - `target_position`: `Vector` — [Read-Write] The target position of the child body, relative to the parent body (Vector)

### `unreal.RigidBodyControlTargets`
Inherits: `StructBase` | Header: `RigidBodyControlData.h`

A set of targets for controls

**Properties** (1):
  - `targets`: `None` — [Read-Write] Targets to apply to the named control (Map[Name,RigidBodyControlTarget])

### `unreal.RigidBodyKinematicTarget`
Inherits: `StructBase` | Header: `RigidBodyControlData.h`

A single kinematic target, which may be defined as an offset from the (implicit) animation target.

**Properties** (3):
  - `target_orientation`: `Rotator` — [Read-Write] The target orientation of the body (Rotator)
  - `target_position`: `Vector` — [Read-Write] The target position of the body (Vector)
  - `use_skeletal_animation`: `bool` — [Read-Write] If true then the target will be applied on top of the skeletal animation (bool)

### `unreal.RigidBodyKinematicTargets`
Inherits: `StructBase` | Header: `RigidBodyControlData.h`

A set of kinematic targets

**Properties** (1):
  - `targets`: `None` — [Read-Write] Targets to apply to the named body modifier (Map[Name,RigidBodyKinematicTarget])

### `unreal.RigidBodyWithControlReference`
Inherits: `AnimNodeReference` | Header: `PhysicsControlBPLibrary.h`

Rigid Body with Control Reference

### `unreal.PhysicsControlActor`
Inherits: `Actor` | Header: `PhysicsControlActor.h`

Actor that holds a PhysicsControlComponent which is then used to apply controls/body modifiers to other actors from âoutsideâ, and a PhysicsControlInitializerComponent which provides the ability t...

**Properties** (2):
  - `control_component`: `PhysicsControlComponent` [Read-Only] — [Read-Only] (PhysicsControlComponent)
  - `control_initializer_component`: `PhysicsControlInitializerComponent` [Read-Only] — [Read-Only] (PhysicsControlInitializerComponent)

### `unreal.PhysicsControlAsset`
Inherits: `Object` | Header: `PhysicsControlAsset.h`

Asset for storing Physics Control Profiles. The asset will contain data that define: - Controls and body modifiers to be created on a mesh - Sets referencing those controls and body modifiers - Full p...

### `unreal.PhysicsControlBPLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PhysicsControlBPLibrary.h`

Physics Control BPLibrary

**Methods** (12):
  - `add_control_parameters(parameters, name, out_parameters=PhysicsControlControlAndModifierParameters)` [classmethod] — Add a single control parameter to a container of parameters.
  - `add_modifier_parameters(parameters, name, out_parameters=PhysicsControlControlAndModifierParameters)` [classmethod] — Add a single body modifier parameter to a container of parameters.
  - `add_multiple_control_parameters(parameters, names, out_parameters=PhysicsControlControlAndModifierParameters)` [classmethod] — Add an array of control parameters (all with the same data) to a container of parameters.
  - `add_multiple_modifier_parameters(parameters, names, out_parameters=PhysicsControlControlAndModifierParameters)` [classmethod] — Add an array of body modifier parameters to a container of parameter.
  - `blend_control_parameters_through_set(parameters, start_control_parameters, end_control_parameters, out_parameters=PhysicsControlControlAndModifierParameters)` [classmethod] — Adds control parameters to the output parameters for each control name in the supplied array. The values in each control...
  - `blend_modifier_parameters_through_set(parameters, start_modifier_parameters, end_modifier_parameters, out_parameters=PhysicsControlControlAndModifierParameters)` [classmethod] — Adds body modifier parameters to the output parameters for each modifier name in the supplied array. The values in each ...
  - `blend_parameters(parameters_a, parameters_b, parameters_b=PhysicsControlControlAndModifierParameters, out_parameters=PhysicsControlControlAndModifierParameters)` [classmethod] — Returns the linear interpolation of two sets of parameters. Any parameters that exist in one of the input sets but not t...
  - `convert_to_rigid_body_with_control(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a Rigid Body With Control node reference from an anim node reference
  - `convert_to_rigid_body_with_control_pure(result=bool)` [classmethod] — Get a Rigid Body With Control node from an anim node (pure)
  - `get_body_modifier_names_in_set(rigid_body_with_control, set_name)` -> `Array [ Name ]` [classmethod] — Get the names of all the body modifiers in a specified set managed by this Rigid Body With Control node.
  - `get_control_names_in_set(rigid_body_with_control, set_name)` -> `Array [ Name ]` [classmethod] — Get the names of all the controls in a specified set managed by this Rigid Body With Control node.
  - `set_override_physics_asset(node, physics_asset)` -> `RigidBodyWithControlReference` [classmethod] — Set the physics asset on the Rigid Body With Control anim graph node.

### `unreal.PhysicsControlComponent`
Inherits: `SceneComponent` | Header: `PhysicsControlComponent.h`

This is the main Physics Control Component class which manages Controls and Body Modifiers associated with one or more static or skeletal meshes. You can add this as a component to an actor containing...

**Methods** (122):
  - `add_body_modifier_to_set(body_modifier, set)` -> `PhysicsControlNames` — Adds a BodyModifier to a Set. This will add a new set if necessary. For example, you might make a set of body modifiers ...
  - `add_body_modifiers_to_set(body_modifiers, set)` -> `PhysicsControlNames` — Adds BodyModifiers to a Set. This will add a new set if necessary. For example, you might make a set of Arm body modifie...
  - `add_control_to_set(control, set)` -> `PhysicsControlNames` — Adds a Control to a Set. This will add a new set if necessary. For example, you might make a set of Controls called âP...
  - `add_controls_to_set(controls, set)` -> `PhysicsControlNames` — Adds Controls to a Set. This will add a new set if necessary. For example, you might make a set of ParentSpace Arm contr...
  - `create_body_modifier(component, bone_name, set, body_modifier_data)` -> `Name` — Creates a new body modifier for mesh components
  - `create_body_modifiers_from_limb_bones()` — Creates a collection of controls controlling a skeletal mesh, grouped together in limbs
  - `create_body_modifiers_from_skeletal_mesh_below(skeletal_mesh_component, bone_name, include_self, set, body_modifier_data)` -> `Array [ Name ]` — Creates new body modifiers for skeletal mesh components
  - `create_control(parent_component, parent_bone_name, child_component, child_bone_name, control_data, control_target, set, name_prefix = '')` -> `Name` — Creates a new control for mesh components
  - `create_controls_and_body_modifiers_from_control_profile_asset(skeletal_mesh_component: SkeletalMeshComponent, world_component: PrimitiveComponent, world_bone_name: Name)` -> `bool` — deprecated: âcreate_controls_and_body_modifiers_from_control_profile_assetâ was renamed to âcreate_controls_and_bo...
  - `create_controls_and_body_modifiers_from_limb_bones(skeletal_mesh_component, limb_setup_data, world_space_control_data, parent_space_control_data, body_modifier_data, world_component = None, world_bone_name = 'None')` -> `(all_world_space_controls=PhysicsControlNames, limb_world_space_controls=Map[Name, PhysicsControlNames], all_parent_space_controls=PhysicsControlNames, limb_parent_space_controls=Map[Name, PhysicsControlNames], all_body_modifiers=PhysicsControlNames, limb_body_modifiers=Map[Name, PhysicsControlNames]) or None` — Creates a collections of controls and body modifiers for a character, based on the description passed in. This makes: - ...
  - `create_controls_and_body_modifiers_from_physics_control_asset(skeletal_mesh_component, world_component, world_bone_name)` -> `bool` — This uses the control profile asset (that should have already been assigned in our data) to create controls and body mod...
  - `create_controls_from_limb_bones()` — Creates a collection of controls controlling a skeletal mesh, grouped together in limbs
  - `create_controls_from_limb_bones_and_constraint_profile()` — Creates a collection of ParentSpace controls controlling a skeletal mesh, grouped together in limbs, initializing them w...
  - `create_controls_from_skeletal_mesh(skeletal_mesh_component, bone_names, control_type, control_data, set)` -> `Array [ Name ]` — Creates a collection of controls controlling a skeletal mesh
  - `create_controls_from_skeletal_mesh_and_constraint_profile(skeletal_mesh_component, bone_names, constraint_profile, set, enabled = True)` -> `Array [ Name ]` — Creates a collection of ParentSpace controls controlling a skeletal mesh, initializing them with a constraint profile
  - `create_controls_from_skeletal_mesh_and_constraint_profile_below(skeletal_mesh_component, bone_name, include_self, constraint_profile, set, enabled = True)` -> `Array [ Name ]` — Creates a collection of ParentSpace controls controlling a skeletal mesh, initializing them with a constraint profile
  - `create_controls_from_skeletal_mesh_below(skeletal_mesh_component, bone_name, include_self, control_type, control_data, set)` -> `Array [ Name ]` — Creates a collection of controls controlling a skeletal mesh
  - `create_named_body_modifier(name, component, bone_name, set, body_modifier_data)` -> `bool` — Creates a new body modifier for mesh components
  - `create_named_control(name, parent_component, parent_bone_name, child_component, child_bone_name, control_data, control_target, set)` -> `bool` — Creates a new control for mesh components
  - `destroy_all_controls_and_body_modifiers()` -> `None` — Destroys all controls and body modifiers
  - `destroy_body_modifier(name)` -> `bool` — Destroys a BodyModifier
  - `destroy_body_modifiers(names)` -> `None` — Destroys BodyModifiers
  - `destroy_body_modifiers_in_set(set)` -> `None` — Destroys BodyModifiers
  - `destroy_control(name)` -> `bool` — Destroys a control
  - `destroy_controls(names)` -> `None` — Destroys all controls
  - `destroy_controls_in_set(set)` -> `None` — Destroys all controls in a set
  - `get_all_body_modifier_names()` -> `Array [ Name ]` — Returns a reference to all the body modifier names that have been created.
  - `get_all_control_names()` -> `Array [ Name ]` — Returns a reference to all the control names that have been created.
  - `get_body_modifier_exists(name)` -> `bool` — Indicates if a body modifier with the name exists (doesnât produce a warning if it doesnât)
  - `get_body_modifier_names_in_set(set)` -> `Array [ Name ]` — Returns a reference to all the body modifier names that have been created and are in the specified set, which could be a...
  - `get_cached_bone_orientation(skeletal_mesh_component, bone_name)` -> `Rotator` — Gets the orientation of the requested bone that will be used as a target (in world space). Targets for bones that are no...
  - `get_cached_bone_orientations(skeletal_mesh_component, bone_names)` -> `Array [ Rotator ]` — Gets the orientations of the requested bones that will be used as targets (in world space). Targets for bones that are n...
  - `get_cached_bone_position(skeletal_mesh_component, bone_name)` -> `Vector` — Gets the position of the requested bone that will be used as a target (in world space). Targets for bones that are not f...
  - `get_cached_bone_positions(skeletal_mesh_component, bone_names)` -> `Array [ Vector ]` — Gets the positions of the requested bones that will be used as targets (in world space). Targets for bones that are not ...
  - `get_cached_bone_transform(skeletal_mesh_component, bone_name)` -> `Transform` — Gets the transforms of the requested bone that will be used as a target (in world space). Targets for bones that are not...
  - `get_cached_bone_transforms(skeletal_mesh_component, bone_names)` -> `Array [ Transform ]` — Gets the transforms of the requested bones that will be used as targets (in world space). Targets for bones that are not...
  - `get_control_data(name)` -> `PhysicsControlData or None`
  - `get_control_enabled(name)` -> `bool`
  - `get_control_exists(name)` -> `bool` — Indicates if a control with the name exists (doesnât produce a warning if it doesnât)
  - `get_control_multiplier(name)` -> `PhysicsControlMultiplier or None`
  - `get_control_names_in_set(set)` -> `Array [ Name ]` — Returns a reference to all the control names that have been created and are in the specified set, which could be a limb,...
  - `get_control_target(name)` -> `PhysicsControlTarget or None`
  - `get_limb_bones_from_skeletal_mesh(skeletal_mesh_component, limb_setup_data)` -> `Map [ Name , PhysicsControlLimbBones ]` — Calculates which bones belong to which limb in a skeletal mesh
  - `get_sets_containing_body_modifier(control)` -> `Array [ Name ]` — Returns the names of all sets containing the body modifier (may be empty - e.g. if it doesnât exist)
  - `get_sets_containing_control(control)` -> `Array [ Name ]` — Returns the names of all sets containing the control (may be empty - e.g. if it doesnât exist)
  - `invoke_control_profile(profile_name)` -> `bool` — Looks up the profile which should exist in the registered control profile asset, and invokes it.
  - `reset_body_modifier_to_cached_bone_transform(name, behavior = ResetToCachedTargetBehavior.RESET_IMMEDIATELY)` -> `bool` — This flags the body associated with the modifier to set (using teleport) its position and velocity to the cached animati...
  - `reset_body_modifiers_in_set_to_cached_bone_transforms(set_name, behavior = ResetToCachedTargetBehavior.RESET_IMMEDIATELY)` -> `None` — Calls ResetBodyModifierToCachedTarget for each of the body modifiers in the set
  - `reset_body_modifiers_to_cached_bone_transforms(names, behavior = ResetToCachedTargetBehavior.RESET_IMMEDIATELY)` -> `None` — Calls ResetBodyModifierToCachedTarget for each of the body modifiers
  - `reset_control_point(name)` -> `bool` — Resets the control point to the center of mass of the mesh
  - `set_body_modifier_collision_type(name, collision_type = CollisionEnabled.QUERY_AND_PHYSICS)` -> `bool` — Sets the collision type for a body modifier
  - `set_body_modifier_data(name, modifier_data)` -> `bool` — Modifies an existing Body Modifier Data
  - `set_body_modifier_datas(names, modifier_data)` -> `None` — Modifies existing Body Modifier Data
  - `set_body_modifier_datas_in_set(set, modifier_data)` -> `None` — Modifies existing Body Modifier Data
  - `set_body_modifier_gravity_multiplier(name, gravity_multiplier = 1.000000)` -> `bool` — Sets the gravity multiplier for a body modifier
  - `set_body_modifier_kinematic_target(name, kinematic_target_position, kinematic_target_orienation, make_kinematic)` -> `bool` — Sets the kinematic target transform for a body modifier.
  - `set_body_modifier_movement_type(name, movement_type = PhysicsMovementType.SIMULATED)` -> `bool` — Sets the movement type for a body modifier
  - `set_body_modifier_physics_blend_weight(name, physics_blend_weight = 1.000000)` -> `bool` — Sets the physics blend weight for a body modifier
  - `set_body_modifier_sparse_data(name, modifier_data)` -> `bool` — Modifies an existing Body Modifier Data
  - `set_body_modifier_sparse_datas(names, modifier_data)` -> `None` — Modifies existing Body Modifier Data
  - `set_body_modifier_sparse_datas_in_set(set, modifier_data)` -> `None` — Modifies existing Body Modifier Data
  - `set_body_modifier_update_kinematic_from_simulation(name, update_kinematic_from_simulation)` -> `bool` — Sets whether a body modifier should update kinematics from the simulation results
  - `set_body_modifier_use_skeletal_animation(name, use_skeletal_animation)` -> `bool` — Sets whether a body modifier should use skeletal animation for its kinematic targets
  - `set_body_modifiers_collision_type(names, collision_type = CollisionEnabled.QUERY_AND_PHYSICS)` -> `None` — Sets the collision type for body modifiers
  - `set_body_modifiers_gravity_multiplier(names, gravity_multiplier = 1.000000)` -> `None` — Sets the gravity multiplier for body modifiers
  - `set_body_modifiers_in_set_collision_type(set, collision_type = CollisionEnabled.QUERY_AND_PHYSICS)` -> `None` — Sets the collision type for body modifiers
  - `set_body_modifiers_in_set_gravity_multiplier(set, gravity_multiplier = 1.000000)` -> `None` — Sets the gravity multiplier for body modifiers
  - `set_body_modifiers_in_set_movement_type(set, movement_type = PhysicsMovementType.SIMULATED)` -> `None` — Sets the movement type for body modifiers
  - `set_body_modifiers_in_set_physics_blend_weight(set, physics_blend_weight = 1.000000)` -> `None` — Sets the physics blend weight for body modifiers
  - `set_body_modifiers_in_set_update_kinematic_from_simulation(set, update_kinematic_from_simulation)` -> `None` — Sets whether body modifiers should update kinematics from the simulation results
  - `set_body_modifiers_in_set_use_skeletal_animation(set, use_skeletal_animation)` -> `None` — Sets whether body modifiers should use skeletal animation for their kinematic targets
  - `set_body_modifiers_movement_type(names, movement_type = PhysicsMovementType.SIMULATED)` -> `None` — Sets the movement type for body modifiers
  - `set_body_modifiers_physics_blend_weight(names, physics_blend_weight = 1.000000)` -> `None` — Sets the physics blend weight for body modifiers
  - `set_body_modifiers_update_kinematic_from_simulation(names, update_kinematic_from_simulation)` -> `None` — Sets whether body modifiers should update kinematics from the simulation results
  - `set_body_modifiers_use_skeletal_animation(names, use_skeletal_animation)` -> `None` — Sets whether body modifiers should use skeletal animation for their kinematic targets
  - `set_cached_bone_data(skeletal_mesh_component, bone_name, tm)` -> `bool` — This allows the caller to override the target that will have been calculated and cached at the start of the Physics Cont...
  - `set_cached_bone_velocities_to_zero()` -> `None` — This sets cached bone velocities to zero, by forgetting any previously used transform. This may be useful if the pose is...
  - `set_control_angular_data(name, strength = 1.000000, damping_ratio = 1.000000, extra_damping = 0.000000, max_torque = 0.000000, enable_control = True)` -> `bool` — Modifies an existing controlâs angular data - i.e. the strengths etc of the control driving towards the target
  - `set_control_data(name, control_data)` -> `bool` — Modifies an existing control data - i.e. the strengths etc of the control driving towards the target
  - `set_control_datas(names, control_data)` -> `None` — Modifies existing control data - i.e. the strengths etc of the controls driving towards the targets
  - `set_control_datas_in_set(set, control_data)` -> `None` — Modifies existing control data - i.e. the strengths etc of the controls driving towards the targets
  - `set_control_disable_collision(name, disable_collision)` -> `bool`
  - `set_control_enabled(name, enable = True)` -> `bool` — Activates or deactivates a control
  - `set_control_linear_data(name, strength = 1.000000, damping_ratio = 1.000000, extra_damping = 0.000000, max_force = 0.000000, enable_control = True)` -> `bool` — Modifies an existing controlâs linear data - i.e. the strengths etc of the control driving towards the target
  - `set_control_multiplier(name, control_multiplier, enable_control = True)` -> `bool` — Modifies an existing control data using the multipliers
  - `set_control_multipliers(names, control_multiplier, enable_control = True)` -> `None` — Modifies existing control data using the multipliers
  - `set_control_multipliers_in_set(set, control_multiplier, enable_control = True)` -> `None` — Modifies existing control data using the multipliers
  - `set_control_parent(name, parent_component, parent_bone_name)` -> `bool` — Updates the parent object part of a control. Note that this wonât change the name of the control (which may subsequent...
  - `set_control_parents(names, parent_component, parent_bone_name)` -> `None` — Updates the parent object part of controls. Note that this wonât change the name of the controls (which may subsequent...
  - `set_control_parents_in_set(set, parent_component, parent_bone_name)` -> `None` — Set Control Parents in Set
  - `set_control_point(name, position)` -> `bool` — Sets the point at which controls will âpushâ the child object.
  - `set_control_sparse_data(name, control_data)` -> `bool` — Modifies an existing control data - i.e. the strengths etc of the control driving towards the target
  - `set_control_sparse_datas(names, control_data)` -> `None` — Modifies existing control data - i.e. the strengths etc of the controls driving towards the targets
  - `set_control_sparse_datas_in_set(set, control_data)` -> `None` — Modifies existing control data - i.e. the strengths etc of the controls driving towards the targets
  - `set_control_sparse_multiplier(name, control_multiplier, enable_control = True)` -> `bool` — Modifies an existing control data using the multipliers
  - `set_control_sparse_multipliers(names, control_multiplier, enable_control = True)` -> `None` — Modifies existing control data using the multipliers
  - `set_control_sparse_multipliers_in_set(set, control_multiplier, enable_control = True)` -> `None` — Modifies existing control data using the multipliers
  - `set_control_target(name, control_target, enable_control = True)` -> `bool` — Modifies an existing control target - i.e. what it is driving towards, relative to the parent object
  - `set_control_target_orientation(name, orientation, angular_velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `bool` — Modifies an existing control target - i.e. what it is driving towards, relative to the parent object
  - `set_control_target_orientations(names, orientation, angular_velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `None` — Calls SetControlTargetOrientation for each of the control names
  - `set_control_target_orientations_from_array(names, orientations, velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `bool` — Calls SetControlTargetPosition for each element of the control names and positions. These array should match in size.
  - `set_control_target_orientations_in_set(set_name, orientation, angular_velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `None` — Calls SetControlTargetOrientation for each of the controls in the set
  - `set_control_target_poses(name, parent_position, parent_orientation, child_position, child_orientation, velocity_delta_time, enable_control = True)` -> `bool` — Calculates and sets an existing control target. This takes the âvirtualâ position/orientation of the parent and chil...
  - `set_control_target_position(name, position, velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `bool` — Modifies an existing control target - i.e. what it is driving towards, relative to the parent object
  - `set_control_target_position_and_orientation(name, position, orientation, velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `bool` — Modifies an existing control target - i.e. what it is driving towards, relative to the parent object
  - `set_control_target_positions(names, position, velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `None` — Calls SetControlTargetPosition for each of the control names
  - `set_control_target_positions_and_orientations(names, position, orientation, velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `None` — Calls SetControlTargetPositionAndOrientation for each of the control names
  - `set_control_target_positions_and_orientations_from_array(names, positions, orientations, velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `bool` — Calls SetControlTargetPositionAndOrientation for each element of the control names, positions and orientations. These ar...
  - `set_control_target_positions_and_orientations_in_set(set_name, position, orientation, velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `None` — Calls SetControlTargetPositionAndOrientation for each control in the set
  - `set_control_target_positions_from_array(names, positions, velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `bool` — Calls SetControlTargetPosition for each element of the control names and positions. These array should match in size.
  - `set_control_target_positions_in_set(set_name, position, velocity_delta_time, enable_control = True, apply_control_point_to_target = False)` -> `None` — Calls SetControlTargetPosition for each of the controls in the set
  - `set_control_targets(names, control_target, enable_control = True)` -> `None` — Modifies existing control targets - i.e. what they are driving towards, relative to the parent objects
  - `set_control_targets_in_set(set, control_target, enable_control = True)` -> `None` — Modifies existing control targets - i.e. what they are driving towards, relative to the parent objects
  - `set_control_use_skeletal_animation(name, use_skeletal_animation = True, skeletal_animation_velocity_multiplier = 1.000000)` -> `bool` — Sets whether or not the control should use skeletal animation for the targets
  - `set_controls_disable_collision(names, disable_collision)` -> `None`
  - `set_controls_enabled(names, enable = True)` -> `None` — Activates or deactivates controls
  - `set_controls_in_set_disable_collision(set, disable_collision)` -> `None`
  - `set_controls_in_set_enabled(set, enable = True)` -> `None` — Activates or deactivates controls
  - `set_controls_in_set_use_skeletal_animation(set, use_skeletal_animation = True, skeletal_animation_velocity_multiplier = 1.000000)` -> `None` — Sets whether or not the controls should use skeletal animation for the targets
  - `set_controls_use_skeletal_animation(names, use_skeletal_animation = True, skeletal_animation_velocity_multiplier = 1.000000)` -> `None` — Sets whether or not the controls should use skeletal animation for the targets
  - `update_controls(delta_time)` -> `None` — Allows manual ticking so that your code can run in between updating the target caches and updating the controls and body...
  - `update_target_caches(delta_time)` -> `None` — Allows manual ticking so that your code can run in between updating the target caches and updating the controls. This al...

**Properties** (13):
  - `debug_body_modifier_detail_filter`: `str` — [Read-Write] Display detailed info for body modifiers containing this string (if non-empty) when thi...
  - `debug_control_detail_filter`: `str` — [Read-Write] Display detailed info for controls containing this string (if non-empty) when this comp...
  - `max_num_controls_or_modifiers_per_name`: `int` — [Read-Write] Upper limit on the number of controls or modifiers that will be created using the same ...
  - `physics_control_asset`: `PhysicsControlAsset` — [Read-Write] Optional PhysicsControlAsset to use. If this is set, then controls can be instantiated ...
  - `physics_control_profile_asset`: `PhysicsControlAsset` — âphysics_control_profile_assetâ was renamed to âphysics_control_assetâ. deprecated
  - `show_debug_body_modifier_list`: `bool` — [Read-Write] Display all the body modifiers and their basic properties when this component is select...
  - `show_debug_control_list`: `bool` — [Read-Write] Display all the controls and their basic properties when this component is selected (bo...
  - `show_debug_visualization`: `bool` — [Read-Write] Visualize the controls when this component is selected (bool)
  - `teleport_distance_threshold`: `float` — [Read-Write] If the component moves by more than this distance then it is treated as a teleport,
whi...
  - `teleport_rotation_threshold`: `float` — [Read-Write] If the component rotates by more than this angle (in degrees) then it is treated as a t...
  - `velocity_prediction_time`: `float` — [Read-Write] The time used when âpredictingâ the target position/orientation. Zero will disable ...
  - `visualization_size_scale`: `float` — [Read-Write] Size of the gizmos etc used during visualization (float)
  - `warn_about_invalid_names`: `bool` — [Read-Write] Warn if an an invalid control or body modifier name is used. This can happen quite easi...

### `unreal.PhysicsControlInitializerComponent`
Inherits: `SceneComponent` | Header: `PhysicsControlActor.h`

Physics Control Initializer Component

**Methods** (1):
  - `create_controls(physics_control_component)` -> `None` — This creates all the controls specified in the Initial properties. You can call it explicitly, or you can opt to have it...

**Properties** (4):
  - `create_controls_at_begin_play`: `bool` — [Read-Write] If set, then CreateControls will be called in our BeginPlay event, attempting to find a...
  - `initial_body_modifiers`: `None` — [Read-Write] This can be filled in to automatically create body modifiers during the BeginPlay event...
  - `initial_character_controls`: `InitialCharacterControls` — [Read-Write] This can be filled in to automatically create whole-character controls (by specifying l...
  - `initial_controls`: `None` — [Read-Write] This can be filled in to automatically create controls during the BeginPlay event. If a...

### `unreal.MapConstraintsBehaviorType`
Inherits: `EnumBase` | Header: `AnimNode_RigidBodyWithControl.h`

Map Constraints Behavior Type

**Properties** (3):
  - `AUTHORED_SKELETON`: `MapConstraintsBehaviorType = Ellipsis` — Apply any difference in the relative transform of the constraintâs parent and child bones between ...
  - `DEFAULT_TRANSFORM`: `MapConstraintsBehaviorType = Ellipsis` — Set constraints transform relative to the parent bone to match the child bone in the current skeleto...
  - `NONE`: `MapConstraintsBehaviorType = Ellipsis` — Nothing 2

### `unreal.PhysicsControlType`
Inherits: `EnumBase` | Header: `PhysicsControlData.h`

Specifies the type of control that is created when making controls from a skeleton or a set of limbs. Note that if controls are made individually then other options are available - i.e. in a character...

**Properties** (2):
  - `PARENT_SPACE`: `PhysicsControlType = Ellipsis` — Control is done in the space of the parent of each object 1
  - `WORLD_SPACE`: `PhysicsControlType = Ellipsis` — Control is done in world space, so each object/part is driven independently 0

### `unreal.PhysicsMovementType`
Inherits: `EnumBase` | Header: `PhysicsControlData.h`

Used by Body Modifiers to specify how the physical bodies should move.

**Properties** (4):
  - `DEFAULT`: `PhysicsMovementType = Ellipsis` — Default means that the movement type shouldnât be changed - for example, it will use the
value in ...
  - `KINEMATIC`: `PhysicsMovementType = Ellipsis` — Kinematic means that the object wonât be simulated, but will be moved according to the
kinematic t...
  - `SIMULATED`: `PhysicsMovementType = Ellipsis` — Simulated means that the object will be controlled by the physics solver 2
  - `STATIC`: `PhysicsMovementType = Ellipsis` — Static means that the object wonât be simulated, and it wonât be moved according to the
kinemati...

### `unreal.ResetToCachedTargetBehavior`
Inherits: `EnumBase` | Header: `PhysicsControlComponent.h`

Specifies how any reset to cached target should work.

**Properties** (2):
  - `RESET_DURING_UPDATE_CONTROLS`: `ResetToCachedTargetBehavior = Ellipsis` — Reset of the associated physics bodies will be done during the next Tick (or UpdateControls). Note t...
  - `RESET_IMMEDIATELY`: `ResetToCachedTargetBehavior = Ellipsis` — Reset of the associated physics bodies is done immediately, to whatever transforms are in the cache....
