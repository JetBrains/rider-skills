# UE Python API — ChaosModularVehicleEngine Module

**26 types** from the `ChaosModularVehicleEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_ModularVehicleController`, `ModularVehicleSocket`, `ClusterUnionVehicleComponent`, `ModularVehicleAnimationInstance`, `ModularVehicleBaseComponent`, `ModularVehicleClusterActor`, `ModularVehicleClusterPawn`, `SimModuleActor`, `VehicleDefaultInputProducer`, `VehiclePlaybackInputProducer`, `VehicleRandomInputProducer`, `VehicleSimAerofoilComponent`, `VehicleSimBaseComponent`, `VehicleSimBaseComponentInterface`, `VehicleSimBaseSceneComponent`, `VehicleSimChassisComponent`, `VehicleSimClutchComponent`, `VehicleSimEngineComponent`, `VehicleSimSuspensionComponent`, `VehicleSimThrusterComponent`, ... (26 total)

---

## Classes

### `unreal.AnimNode_ModularVehicleController`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_ModularVehicleController.h`

Simple controller that replaces or adds to the translation/rotation of a single bone.

### `unreal.ModularVehicleSocket`
Inherits: `StructBase` | Header: `ModularVehicleSocket.h`

Modular Vehicle Socket

**Properties** (3):
  - `relative_location`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `relative_rotation`: `Rotator` [Read-Only] — [Read-Only] (Rotator)
  - `socket_name`: `Name` [Read-Only] — [Read-Only] Defines a named attachment location on the Modular vehicle. (Name)

### `unreal.ClusterUnionVehicleComponent`
Inherits: `ClusterUnionComponent` | Header: `ClusterUnionVehicleComponent.h`

Cluster Union Vehicle Component

### `unreal.ModularVehicleAnimationInstance`
Inherits: `AnimInstance` | Header: `ModularVehicleAnimationInstance.h`

Modular Vehicle Animation Instance

**Methods** (1):
  - `get_vehicle()` -> `ModularVehicleClusterPawn` — Makes a montage jump to the end of a named section.

### `unreal.ModularVehicleBaseComponent`
Inherits: `PawnMovementComponent` | Header: `ModularVehicleBaseComponent.h`

Modular Vehicle Base Component

**Methods** (12):
  - `add_actors_to_ignore()` -> `Array [ Actor ]` — Add Actors to Ignore
  - `get_current_gear()` -> `int32` — Get Current Gear
  - `is_reversing()` -> `bool` — Is Reversing
  - `remove_actors_to_ignore()` -> `Array [ Actor ]` — Remove Actors to Ignore
  - `set_gear_input(gear)` -> `None` — Set the gear directly
  - `set_input_axis1d(name, value)` -> `None` — Set Input Axis 1D
  - `set_input_axis2d(name, value)` -> `None` — Set Input Axis 2D
  - `set_input_axis3d(name, value)` -> `None` — Set Input Axis 3D
  - `set_input_bool(name, value)` -> `None` — Set Input Bool
  - `set_input_integer(name, value)` -> `None` — Set Input Integer
  - `set_input_producer_class(input_producer_class)` -> `None` — Sets the input producer class and creates an input producer if one doesnât exist.
  - `set_locally_controlled(locally_controlled_in)` -> `None` — Set Locally Controlled

### `unreal.ModularVehicleClusterActor`
Inherits: `Actor` | Header: `ModularVehicleClusterActor.h`

Modular Vehicle Cluster Actor

**Properties** (2):
  - `cluster_union_vehicle_component`: `ClusterUnionVehicleComponent` [Read-Only] — [Read-Only] VehicleSpecificClusterComponent (ClusterUnionVehicleComponent)
  - `vehicle_sim_component`: `ModularVehicleBaseComponent` [Read-Only] — [Read-Only] ModularVehicleComponent (ModularVehicleBaseComponent)

### `unreal.ModularVehicleClusterPawn`
Inherits: `Pawn` | Header: `ModularVehicleClusterPawn.h`

Modular Vehicle Cluster Pawn

**Properties** (2):
  - `cluster_union_vehicle_component`: `ClusterUnionVehicleComponent` [Read-Only] — [Read-Only] VehicleSpecificClusterComponent (ClusterUnionVehicleComponent)
  - `vehicle_sim_component`: `ModularVehicleBaseComponent` [Read-Only] — [Read-Only] ModularVehicleComponent (ModularVehicleBaseComponent)

### `unreal.SimModuleActor`
Inherits: `Actor` | Header: `SimModuleActor.h`

Sim Module Actor

**Properties** (2):
  - `mesh_comp`: `StaticMeshComponent` — [Read-Write] (StaticMeshComponent)
  - `sim_component`: `VehicleSimBaseComponent` — [Read-Write] Simulation Component (VehicleSimBaseComponent)

### `unreal.VehicleDefaultInputProducer`
Inherits: `VehicleInputProducerBase` | Header: `InputProducer.h`

The default input producer that takes real input from the player and provides it to the simulation

### `unreal.VehiclePlaybackInputProducer`
Inherits: `VehicleInputProducerBase` | Header: `InputProducer.h`

Example input generator, generates random input inot a per frame buffer then replays from the buffer, looping back to the start when the bugger is exhausted

### `unreal.VehicleRandomInputProducer`
Inherits: `VehicleInputProducerBase` | Header: `InputProducer.h`

Example input generator, generates random input on the fly for the PT

### `unreal.VehicleSimAerofoilComponent`
Inherits: `VehicleSimBaseComponent` | Header: `VehicleSimAerofoilComponent.h`

Vehicle Sim Aerofoil Component

**Properties** (11):
  - `animation_magnitude_multiplier`: `float` — [Read-Write] (float)
  - `area`: `float` — [Read-Write] (float)
  - `camber`: `float` — [Read-Write] (float)
  - `control_rotation_axis`: `Vector` — [Read-Write] (Vector)
  - `drag_multiplier`: `float` — [Read-Write] (float)
  - `force_axis`: `Vector` — [Read-Write] (Vector)
  - `lift_multiplier`: `float` — [Read-Write] (float)
  - `max_control_angle`: `float` — [Read-Write] (float)
  - `offset`: `Vector` — [Read-Write] (Vector)
  - `stall_angle`: `float` — [Read-Write] (float)
  - `type`: `ModuleAerofoilType` — [Read-Write] (ModuleAerofoilType)

### `unreal.VehicleSimBaseComponent`
Inherits: `PrimitiveComponent` | Header: `VehicleSimBaseComponent.h`

This if for sim components that need scene component properties along with rendering and collision.

**Properties** (3):
  - `animation_enabled`: `bool` — [Read-Write] (bool)
  - `animation_offset`: `Vector` — [Read-Write] (Vector)
  - `bone_name`: `Name` — [Read-Write] (Name)

### `unreal.VehicleSimBaseComponentInterface`
Inherits: `Interface` | Header: `VehicleSimBaseComponent.h`

Vehicle Sim Base Component Interface

### `unreal.VehicleSimBaseSceneComponent`
Inherits: `SceneComponent` | Header: `VehicleSimBaseComponent.h`

This if for sim components that need transform and attachment, no rendering, no collision.

### `unreal.VehicleSimChassisComponent`
Inherits: `VehicleSimBaseComponent` | Header: `VehicleSimChassisComponent.h`

Vehicle Sim Chassis Component

**Properties** (6):
  - `angular_damping`: `float` — [Read-Write] (float)
  - `area_metres_squared`: `float` — [Read-Write] (float)
  - `density_of_medium`: `float` — [Read-Write] (float)
  - `drag_coefficient`: `float` — [Read-Write] (float)
  - `x_axis_multiplier`: `float` — [Read-Write] (float)
  - `y_axis_multiplier`: `float` — [Read-Write] (float)

### `unreal.VehicleSimClutchComponent`
Inherits: `VehicleSimBaseComponent` | Header: `VehicleSimClutchComponent.h`

Vehicle Sim Clutch Component

**Properties** (1):
  - `clutch_strength`: `float` — [Read-Write] (float)

### `unreal.VehicleSimEngineComponent`
Inherits: `VehicleSimBaseComponent` | Header: `VehicleSimEngineComponent.h`

Vehicle Sim Engine Component

**Properties** (6):
  - `engine_brake_effect`: `float` — [Read-Write] [RPM] The RPM at which the throttle sits when the car is not moving (float)
  - `engine_idle_rpm`: `int` — [Read-Write] [RPM] The absolute maximum RPM the engine can theoretically reach (last X value in the ...
  - `engine_inertia`: `float` — [Read-Write] [0..1] How much the engine slows the vehicle when the throttle is released (float)
  - `max_rpm`: `int` — [Read-Write] [N.m] The peak torque Y value in the normalized torque graph (int32)
  - `max_torque`: `float` — [Read-Write] (float)
  - `torque_curve`: `RuntimeFloatCurve` — [Read-Write] (RuntimeFloatCurve)

### `unreal.VehicleSimSuspensionComponent`
Inherits: `VehicleSimBaseComponent` | Header: `VehicleSimSuspensionComponent.h`

Vehicle Sim Suspension Component

**Properties** (7):
  - `spring_damping`: `float` — [Read-Write] (float)
  - `spring_preload`: `float` — [Read-Write] (float)
  - `spring_rate`: `float` — [Read-Write] (float)
  - `suspension_axis`: `Vector` — [Read-Write] (Vector)
  - `suspension_force_effect`: `float` — [Read-Write] (float)
  - `suspension_max_drop`: `float` — [Read-Write] (float)
  - `suspension_max_raise`: `float` — [Read-Write] (float)

### `unreal.VehicleSimThrusterComponent`
Inherits: `VehicleSimBaseComponent` | Header: `VehicleSimThrusterComponent.h`

Vehicle Sim Thruster Component

**Properties** (8):
  - `boost_multiplier_effect`: `float` — [Read-Write] (float)
  - `force_axis`: `Vector` — [Read-Write] (Vector)
  - `force_offset`: `Vector` — [Read-Write] (Vector)
  - `max_steering_angle`: `float` — [Read-Write] (float)
  - `max_thrust_force`: `float` — [Read-Write] (float)
  - `steering_axis`: `Vector` — [Read-Write] (Vector)
  - `steering_enabled`: `bool` — [Read-Write] (bool)
  - `steering_force_effect`: `float` — [Read-Write] (float)

### `unreal.VehicleSimTransmissionComponent`
Inherits: `VehicleSimBaseComponent` | Header: `VehicleSimTransmissionComponent.h`

Vehicle Sim Transmission Component

**Properties** (10):
  - `auto_reverse`: `bool` — [Read-Write] (bool)
  - `change_down_rpm`: `int` — [Read-Write] (int32)
  - `change_up_rpm`: `int` — [Read-Write] (int32)
  - `final_drive_ratio`: `float` — [Read-Write] (float)
  - `forward_ratios`: `None` — [Read-Write] (Array[float])
  - `gear_change_time`: `float` — [Read-Write] (float)
  - `gear_hysteresis_time`: `float` — [Read-Write] (float)
  - `reverse_ratios`: `None` — [Read-Write] (Array[float])
  - `transmission_efficiency`: `float` — [Read-Write] (float)
  - `transmission_type`: `ModuleTransType` — [Read-Write] (ModuleTransType)

### `unreal.VehicleSimWheelComponent`
Inherits: `VehicleSimBaseComponent` | Header: `VehicleSimWheelComponent.h`

Vehicle Sim Wheel Component

**Properties** (16):
  - `abs_enabled`: `bool` — [Read-Write] - Other âââââââââââââââââââ (bool)
  - `axis_type`: `WheelAxisType` — [Read-Write] (WheelAxisType)
  - `cornering_stiffness`: `float` — [Read-Write] (float)
  - `force_offset`: `Vector` — [Read-Write] (Vector)
  - `friction_multiplier`: `float` — [Read-Write] grip and turning related (float)
  - `handbrake_enabled`: `bool` — [Read-Write] Handbrake (bool)
  - `handbrake_torque`: `float` — [Read-Write] (float)
  - `max_brake_torque`: `float` — [Read-Write] - Braking ââââââââââââââââââ (float)
  - `max_steering_angle`: `float` — [Read-Write] (float)
  - `reverse_direction`: `bool` — [Read-Write] (bool)
  - `slip_angle_limit`: `float` — [Read-Write] (float)
  - `steering_enabled`: `bool` — [Read-Write] - Steering ââââââââââââââââââ (bool)
  - `traction_control_enabled`: `bool` — [Read-Write] (bool)
  - `wheel_inertia`: `float` — [Read-Write] [cm] (float)
  - `wheel_radius`: `float` — [Read-Write] - Wheel âââââââââââââââââââ
UPROPERTY(EditAnywher...
  - `wheel_width`: `float` — [Read-Write] [cm] (float)

### `unreal.ModuleAerofoilType`
Inherits: `EnumBase` | Header: `VehicleSimAerofoilComponent.h`

EModule Aerofoil Type

**Properties** (4):
  - `ELEVATOR`: `ModuleAerofoilType = Ellipsis` — affected by steering/yaw input 3
  - `FIXED`: `ModuleAerofoilType = Ellipsis` — 0
  - `RUDDER`: `ModuleAerofoilType = Ellipsis` — affected by Roll input 2
  - `WING`: `ModuleAerofoilType = Ellipsis` — 1

### `unreal.ModuleTransType`
Inherits: `EnumBase` | Header: `VehicleSimTransmissionComponent.h`

EModule Trans Type

**Properties** (2):
  - `AUTOMATIC`: `ModuleTransType = Ellipsis` — 1
  - `MANUAL`: `ModuleTransType = Ellipsis` — 0

### `unreal.TraceType`
Inherits: `EnumBase` | Header: `ChaosSimModuleManagerAsyncCallback.h`

ETrace Type

**Properties** (2):
  - `RAYCAST`: `TraceType = Ellipsis` — Use ray to determine suspension length to ground 0
  - `SPHERECAST`: `TraceType = Ellipsis` — Use sphere to determine suspension length to ground 1

### `unreal.WheelAxisType`
Inherits: `EnumBase` | Header: `VehicleSimWheelComponent.h`

EWheel Axis Type

**Properties** (2):
  - `X`: `WheelAxisType = Ellipsis` — 0
  - `Y`: `WheelAxisType = Ellipsis` — X forwards 1
