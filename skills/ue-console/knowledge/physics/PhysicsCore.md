# UE Python API — PhysicsCore Module

**19 types** from the `PhysicsCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BodyInstanceCore`, `PhysicalMaterialDamageModifier`, `PhysicalMaterialStrength`, `BodySetupCore`, `ChaosPhysicalMaterial`, `PhysicalMaterial`, `PhysicsSettingsCore`, `AngularConstraintMotion`, `BodyCollisionResponse`, `CollisionTraceFlag`, `ConstraintFrame`, `ConstraintPlasticityType`, `FrictionCombineMode`, `LinearConstraintMotion`, `PhysicalMaterialSoftCollisionMode`, `PhysicalSurface`, `PhysicsType`, `RadialImpulseFalloff`, `SleepFamily`

---

## Classes

### `unreal.BodyInstanceCore`
Inherits: `StructBase` | Header: `BodyInstanceCore.h`

Body Instance Core

**Properties** (8):
  - `auto_weld`: `bool` — [Read-Write] If true and is attached to a parent, the two bodies will be joined into a single rigid ...
  - `enable_gravity`: `bool` [Read-Only] — [Read-Only] If object should have the force of gravity applied (bool)
  - `generate_wake_events`: `bool` [Read-Only] — [Read-Only] Should âwake/sleepâ events fire when this object is woken up or put to sleep by the ...
  - `gyroscopic_torque_enabled`: `bool` [Read-Only] — [Read-Only] Enabled/disables whether this body is affected by gyroscopic torque, mainly useful for l...
  - `simulate_physics`: `bool` — [Read-Write] If true, this body will use simulation. If false, will be âfixedâ (ie kinematic) an...
  - `start_awake`: `bool` [Read-Only] — [Read-Only] If object should start awake, or if it should initially be sleeping (bool)
  - `update_kinematic_from_simulation`: `bool` [Read-Only] — [Read-Only] When kinematic, whether the actor transform should be updated as a result of movement in...
  - `update_mass_when_scale_changes`: `bool` — [Read-Write] If true, it will update mass when scale change * (bool)

### `unreal.PhysicalMaterialDamageModifier`
Inherits: `StructBase` | Header: `PhysicalMaterial.h`

Damage threshold modifiers, used by the Chaos destruction system

**Properties** (1):
  - `damage_threshold_multiplier`: `float` [Read-Only] — [Read-Only] Multiplier for the geometry collection damage thresholds/ internal strain
this allows fo...

### `unreal.PhysicalMaterialStrength`
Inherits: `StructBase` | Header: `PhysicalMaterial.h`

Defines the directional strengths of a physical material in term of force per surface area

**Properties** (3):
  - `compression_strength`: `float` [Read-Only] — [Read-Only] Compression strength of the material in MegaPascal ( 10^6 N/m2 )
This amount of compress...
  - `shear_strength`: `float` [Read-Only] — [Read-Only] Shear strength of the material in MegaPascal ( 10^6 N/m2 )
This amount of shear force pe...
  - `tensile_strength`: `float` [Read-Only] — [Read-Only] Tensile strength of the material in MegaPascal ( 10^6 N/m2 )
This amount of tension forc...

### `unreal.BodySetupCore`
Inherits: `Object` | Header: `BodySetupCore.h`

Body Setup Core

### `unreal.ChaosPhysicalMaterial`
Inherits: `Object` | Header: `ChaosPhysicalMaterial.h`

Physical materials are used to define the response of a physical object when interacting dynamically with the world.

**Properties** (7):
  - `angular_ether_drag`: `float` [Read-Only] — [Read-Only] Uniform angular ether drag, the resistance a body experiences to its rotation. (float)
  - `friction`: `float` [Read-Only] — [Read-Only] Friction value of a surface in motion, controls how easily things can slide on this surf...
  - `linear_ether_drag`: `float` [Read-Only] — [Read-Only] Uniform linear ether drag, the resistance a body experiences to its translation. (float)
  - `restitution`: `float` [Read-Only] — [Read-Only] Restitution or âbouncinessâ of this surface, between 0 (no bounce) and 1 (outgoing v...
  - `sleeping_angular_velocity_threshold`: `float` [Read-Only] — [Read-Only] How much to scale the damage threshold by on any destructible we are applied to (float)
  - `sleeping_linear_velocity_threshold`: `float` [Read-Only] — [Read-Only] How much to scale the damage threshold by on any destructible we are applied to (float)
  - `static_friction`: `float` [Read-Only] — [Read-Only] Friction value of surface at rest, controls how easily things can slide on this surface ...

### `unreal.PhysicalMaterial`
Inherits: `Object` | Header: `PhysicalMaterial.h`

Physical materials are used to define the response of a physical object when interacting dynamically with the world.

**Properties** (16):
  - `damage_modifier`: `PhysicalMaterialDamageModifier` [Read-Only] — [Read-Only] (PhysicalMaterialDamageModifier)
  - `debug_color`: `LinearColor` [Read-Only] — [Read-Only] Color used to represent this material in certain debug views (e.g. landscape collision) ...
  - `density`: `float` [Read-Only] — [Read-Only] Used with the shape of the object to calculate its mass properties. The higher the numbe...
  - `friction`: `float` [Read-Only] — [Read-Only] Friction value of surface, controls how easily things can slide on this surface (0 is fr...
  - `friction_combine_mode`: `FrictionCombineMode` [Read-Only] — [Read-Only] Friction combine mode, controls how friction is computed for multiple materials. (Fricti...
  - `override_friction_combine_mode`: `bool` — [Read-Write] If set we will use the FrictionCombineMode of this material, instead of the FrictionCom...
  - `override_restitution_combine_mode`: `bool` — [Read-Write] If set we will use the RestitutionCombineMode of this material, instead of the Restitut...
  - `raise_mass_to_power`: `float` [Read-Only] — [Read-Only] Used to adjust the way that mass increases as objects get larger. This is applied to the...
  - `restitution`: `float` [Read-Only] — [Read-Only] Restitution or âbouncinessâ of this surface, between 0 (no bounce) and 1 (outgoing v...
  - `restitution_combine_mode`: `FrictionCombineMode` [Read-Only] — [Read-Only] Restitution combine mode, controls how restitution is computed for multiple materials. (...
  - `sleep_angular_velocity_threshold`: `float` [Read-Only] — [Read-Only] How low the angular velocity can be before solver puts body to sleep. (float)
  - `sleep_counter_threshold`: `int` [Read-Only] — [Read-Only] How many ticks we can be under thresholds for before solver puts body to sleep. (int32)
  - `sleep_linear_velocity_threshold`: `float` [Read-Only] — [Read-Only] How low the linear velocity can be before solver puts body to sleep. (float)
  - `static_friction`: `float` [Read-Only] — [Read-Only] Static Friction value of surface, controls how easily things can slide on this surface (...
  - `strength`: `PhysicalMaterialStrength` [Read-Only] — [Read-Only] (PhysicalMaterialStrength)
  - `surface_type`: `PhysicalSurface` [Read-Only] — [Read-Only] To edit surface type for your project, use ProjectSettings/Physics/PhysicalSurface secti...

### `unreal.PhysicsSettingsCore`
Inherits: `DeveloperSettings` | Header: `PhysicsSettingsCore.h`

Default physics settings.

### `unreal.AngularConstraintMotion`
Inherits: `EnumBase` | Header: `ChaosEngineInterface.h`

Specifies angular degrees of freedom

**Properties** (3):
  - `ACM_FREE`: `AngularConstraintMotion = Ellipsis` — No constraint against this axis. 0
  - `ACM_LIMITED`: `AngularConstraintMotion = Ellipsis` — Limited freedom along this axis. 1
  - `ACM_LOCKED`: `AngularConstraintMotion = Ellipsis` — Fully constraint against this axis. 2

### `unreal.BodyCollisionResponse`
Inherits: `EnumBase` | Header: `BodySetupEnums.h`

EBody Collision Response

**Properties** (2):
  - `BODY_COLLISION_DISABLED`: `BodyCollisionResponse = Ellipsis` — 1
  - `BODY_COLLISION_ENABLED`: `BodyCollisionResponse = Ellipsis` — 0

### `unreal.CollisionTraceFlag`
Inherits: `EnumBase` | Header: `BodySetupEnums.h`

ECollision Trace Flag

**Properties** (4):
  - `CTF_USE_COMPLEX_AS_SIMPLE`: `CollisionTraceFlag = Ellipsis` — Create only complex shapes (per poly). Use complex shapes for all scene queries and collision tests....
  - `CTF_USE_DEFAULT`: `CollisionTraceFlag = Ellipsis` — Use project physics settings (DefaultShapeComplexity) 0
  - `CTF_USE_SIMPLE_AND_COMPLEX`: `CollisionTraceFlag = Ellipsis` — Create both simple and complex shapes. Simple shapes are used for regular scene queries and collisio...
  - `CTF_USE_SIMPLE_AS_COMPLEX`: `CollisionTraceFlag = Ellipsis` — Create only simple shapes. Use simple shapes for all scene queries and collision tests. 2

### `unreal.ConstraintFrame`
Inherits: `EnumBase` | Header: `ChaosEngineInterface.h`

Enum to indicate which context frame we use for physical constraints

**Properties** (2):
  - `FRAME1`: `ConstraintFrame = Ellipsis` — 0
  - `FRAME2`: `ConstraintFrame = Ellipsis` — 1

### `unreal.ConstraintPlasticityType`
Inherits: `EnumBase` | Header: `ChaosEngineInterface.h`

LINEAR CCPT

**Properties** (3):
  - `CCPT_FREE`: `ConstraintPlasticityType = Ellipsis` — 0
  - `CCPT_GROW`: `ConstraintPlasticityType = Ellipsis` — 2
  - `CCPT_SHRINK`: `ConstraintPlasticityType = Ellipsis` — 1

### `unreal.FrictionCombineMode`
Inherits: `EnumBase` | Header: `PhysicsSettingsEnums.h`

EFriction Combine Mode

**Properties** (4):
  - `AVERAGE`: `FrictionCombineMode = Ellipsis` — (a+b)/2 0 Uses the average value of the materials touching
  - `MAX`: `FrictionCombineMode = Ellipsis` — max(a,b) 3 Uses the maximum value of materials touching
  - `MIN`: `FrictionCombineMode = Ellipsis` — min(a,b) 1 Uses the minimum value of the materials touching
  - `MULTIPLY`: `FrictionCombineMode = Ellipsis` — a*b 2 Uses the product of the values of the materials touching

### `unreal.LinearConstraintMotion`
Inherits: `EnumBase` | Header: `ChaosEngineInterface.h`

LINEAR DOF

**Properties** (3):
  - `LCM_FREE`: `LinearConstraintMotion = Ellipsis` — No constraint against this axis. 0
  - `LCM_LIMITED`: `LinearConstraintMotion = Ellipsis` — Limited freedom along this axis. 1
  - `LCM_LOCKED`: `LinearConstraintMotion = Ellipsis` — Fully constraint against this axis. 2

### `unreal.PhysicalMaterialSoftCollisionMode`
Inherits: `EnumBase` | Header: `PhysicalMaterial.h`

Soft collision mode for a physical material.

**Properties** (3):
  - `ABSOLUTE_THICKESS`: `PhysicalMaterialSoftCollisionMode = Ellipsis` — SoftCollisionThickess is an absolute value in cm 2
  - `NONE`: `PhysicalMaterialSoftCollisionMode = Ellipsis` — No soft collisionss 0
  - `RELATIVE_THICKNESS`: `PhysicalMaterialSoftCollisionMode = Ellipsis` — SoftCollisionThickess is a fraction of the bounds (minimum axis). Should be less than 0.5 1

### `unreal.PhysicalSurface`
Inherits: `EnumBase` | Header: `ChaosEngineInterface.h`

Types of surfaces in the game, used by Physical Materials

**Properties** (1):
  - `SURFACE_TYPE_DEFAULT`: `PhysicalSurface = Ellipsis` — 0

### `unreal.PhysicsType`
Inherits: `EnumBase` | Header: `BodySetupEnums.h`

EPhysics Type

**Properties** (3):
  - `PHYS_TYPE_DEFAULT`: `PhysicsType = Ellipsis` — Follow owner. 0
  - `PHYS_TYPE_KINEMATIC`: `PhysicsType = Ellipsis` — Do not follow owner, but make kinematic. 1
  - `PHYS_TYPE_SIMULATED`: `PhysicsType = Ellipsis` — Do not follow owner, but simulate. 2

### `unreal.RadialImpulseFalloff`
Inherits: `EnumBase` | Header: `ChaosEngineInterface.h`

Enum for controlling the falloff of strength of a radial impulse as a function of distance from Origin.

**Properties** (2):
  - `RIF_CONSTANT`: `RadialImpulseFalloff = Ellipsis` — Impulse is a constant strength, up to the limit of its range. 0
  - `RIF_LINEAR`: `RadialImpulseFalloff = Ellipsis` — Impulse should get linearly weaker the further from origin. 1

### `unreal.SleepFamily`
Inherits: `EnumBase` | Header: `ChaosEngineInterface.h`

Presets of values used in considering when put this body to sleep.

**Properties** (3):
  - `CUSTOM`: `SleepFamily = Ellipsis` — Specify your own sleep threshold multiplier 2
  - `NORMAL`: `SleepFamily = Ellipsis` — Engine defaults. 0
  - `SENSITIVE`: `SleepFamily = Ellipsis` — A family of values with a lower sleep threshold; good for slower pendulum-like physics. 1
