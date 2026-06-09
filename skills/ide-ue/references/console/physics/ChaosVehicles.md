# UE Python API — ChaosVehicles Module

**31 types** from the `ChaosVehicles` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_StageCoachWheelController`, `AnimNode_WheelController`, `BaseSnapshotData`, `ChaosWheelSetup`, `VehicleAerofoilConfig`, `VehicleDifferentialConfig`, `VehicleEngineConfig`, `VehicleInputRateConfig`, `VehicleStabilizeControlConfig`, `VehicleSteeringConfig`, `VehicleTargetRotationControlConfig`, `VehicleThrustConfig`, `VehicleTorqueControlConfig`, `VehicleTransmissionConfig`, `WheeledSnaphotData`, `WheelSnapshot`, `WheelStatus`, `ChaosVehicleMovementComponent`, `ChaosVehicleWheel`, `ChaosWheeledVehicleMovementComponent`, ... (31 total)

---

## Classes

### `unreal.AnimNode_StageCoachWheelController`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_StageCoachWheelController.h`

Simple controller that replaces or adds to the translation/rotation of a single bone.

**Properties** (4):
  - `max_angular_velocity`: `float` — [Read-Write] Wheel max rotation speed in degrees/second (float)
  - `shutter_speed`: `float` — [Read-Write] Camera shutter speed in frames/second (float)
  - `stage_coach_blend`: `float` — [Read-Write] Blend effect degrees/second (float)
  - `wheel_spoke_count`: `int` — [Read-Write] Number of spokes visible on wheel (int32)

### `unreal.AnimNode_WheelController`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_WheelController.h`

Simple controller that replaces or adds to the translation/rotation of a single bone.

### `unreal.BaseSnapshotData`
Inherits: `StructBase` | Header: `SnapshotData.h`

: public UObject

### `unreal.ChaosWheelSetup`
Inherits: `StructBase` | Header: `ChaosWheeledVehicleMovementComponent.h`

Chaos Wheel Setup

### `unreal.VehicleAerofoilConfig`
Inherits: `StructBase` | Header: `ChaosVehicleMovementComponent.h`

Vehicle Aerofoil Config

### `unreal.VehicleDifferentialConfig`
Inherits: `StructBase` | Header: `ChaosWheeledVehicleMovementComponent.h`

Vehicle Differential Config

### `unreal.VehicleEngineConfig`
Inherits: `StructBase` | Header: `ChaosWheeledVehicleMovementComponent.h`

Vehicle Engine Config

### `unreal.VehicleInputRateConfig`
Inherits: `StructBase` | Header: `ChaosVehicleMovementComponent.h`

Vehicle Input Rate Config

### `unreal.VehicleStabilizeControlConfig`
Inherits: `StructBase` | Header: `ChaosVehicleMovementComponent.h`

Vehicle Stabilize Control Config

### `unreal.VehicleSteeringConfig`
Inherits: `StructBase` | Header: `ChaosWheeledVehicleMovementComponent.h`

Vehicle Steering Config

### `unreal.VehicleTargetRotationControlConfig`
Inherits: `StructBase` | Header: `ChaosVehicleMovementComponent.h`

Vehicle Target Rotation Control Config

### `unreal.VehicleThrustConfig`
Inherits: `StructBase` | Header: `ChaosVehicleMovementComponent.h`

Vehicle Thrust Config

### `unreal.VehicleTorqueControlConfig`
Inherits: `StructBase` | Header: `ChaosVehicleMovementComponent.h`

Vehicle Torque Control Config

### `unreal.VehicleTransmissionConfig`
Inherits: `StructBase` | Header: `ChaosWheeledVehicleMovementComponent.h`

Vehicle Transmission Config

### `unreal.WheeledSnaphotData`
Inherits: `BaseSnapshotData` | Header: `SnapshotData.h`

Wheeled Snaphot Data

### `unreal.WheelSnapshot`
Inherits: `StructBase` | Header: `SnapshotData.h`

Wheel Snapshot

### `unreal.WheelStatus`
Inherits: `StructBase` | Header: `ChaosWheeledVehicleMovementComponent.h`

Structure containing information about the status of a single wheel of the vehicle.

### `unreal.ChaosVehicleMovementComponent`
Inherits: `PawnMovementComponent` | Header: `ChaosVehicleMovementComponent.h`

Base component to handle the vehicle simulation for an actor.

**Methods** (28):
  - `decrease_throttle_input(throttle_delta)` -> `None` — Decrease the vehicle throttle position [throttle range normalized 0 to 1]
  - `enable_self_righting(state)` -> `None` — Enable Self Righting
  - `get_brake_input()` -> `float` — Get the user input for the vehicle brake - can use this to feed control to a connected trailer
  - `get_current_gear()` -> `int32` — Get current gear
  - `get_forward_speed()` -> `float` — How fast the vehicle is moving forward
  - `get_forward_speed_mph()` -> `float` — How fast the vehicle is moving forward
  - `get_handbrake_input()` -> `bool` — Get the user input for the vehicle handbrake - can use this to feed control to a connected trailer
  - `get_steering_input()` -> `float` — Get the user input for the vehicle steering - can use this to feed control to a connected trailer
  - `get_target_gear()` -> `int32` — Get target gear
  - `get_throttle_input()` -> `float` — Get the user input for the vehicle throttle - can use this to feed control to a connected trailer
  - `get_use_auto_gears()` -> `bool` — Are gears being changed automatically?
  - `increase_throttle_input(throttle_delta)` -> `None` — Increase the vehicle throttle position [throttle range normalized 0 to 1]
  - `is_parked()` -> `bool` — Is the vehicle in park mode
  - `reset_vehicle()` -> `None` — Reset some vehicle state - call this if you are say creating pool of vehicles that get reused and you donât want to ca...
  - `set_brake_input(brake)` -> `None` — Set the user input for the vehicle Brake [range 0 to 1]
  - `set_change_down_input(new_gear_down)` -> `None` — Set the user input for gear down
  - `set_change_up_input(new_gear_up)` -> `None` — Set the user input for gear up
  - `set_handbrake_input(new_handbrake)` -> `None` — Set the user input for handbrake
  - `set_parked(parked)` -> `None` — Set the vehicle in park mode
  - `set_pitch_input(pitch)` -> `None` — Set the user input for the vehicle pitch [range -1 to 1]
  - `set_requires_controller_for_inputs(requires_controller)` -> `None` — Set the flag that determines whether a controller is required to set control inputs
  - `set_roll_input(roll)` -> `None` — Set the user input for the vehicle roll [range -1 to 1]
  - `set_sleeping(enable_sleep)` -> `None` — Set the vehicle sleeping (bEnableSleep=true) or wake it up (bEnableSleep=false)
  - `set_steering_input(steering)` -> `None` — Set the user input for the vehicle steering [range -1 to 1]
  - `set_target_gear(gear_num, immediate)` -> `None` — Set the user input for gear (-1 reverse, 0 neutral, 1+ forward)
  - `set_throttle_input(throttle)` -> `None` — Set the user input for the vehicle throttle [range 0 to 1]
  - `set_use_automatic_gears(use_auto)` -> `None` — Set the flag that will be used to select auto-gears
  - `set_yaw_input(yaw)` -> `None` — Set the user input for the vehicle yaw [range -1 to 1]

### `unreal.ChaosVehicleWheel`
Inherits: `Object` | Header: `ChaosVehicleWheel.h`

Chaos Vehicle Wheel

**Methods** (9):
  - `get_axle_type()` -> `AxleType` — Get Axle Type
  - `get_rotation_angle()` -> `float` — Get Rotation Angle
  - `get_rotation_angular_velocity()` -> `float` — Get Rotation Angular Velocity
  - `get_steer_angle()` -> `float` — Get Steer Angle
  - `get_suspension_axis()` -> `Vector` — Get Suspension Axis
  - `get_suspension_offset()` -> `float` — Get Suspension Offset
  - `get_wheel_angular_velocity()` -> `float` — Get Wheel Angular Velocity
  - `get_wheel_radius()` -> `float` — Get Wheel Radius
  - `is_in_air()` -> `bool` — Is in Air

### `unreal.ChaosWheeledVehicleMovementComponent`
Inherits: `ChaosVehicleMovementComponent` | Header: `ChaosWheeledVehicleMovementComponent.h`

Chaos Wheeled Vehicle Movement Component

**Methods** (36):
  - `break_wheel_snapshot(wheel_rotation_angle=float, steering_angle=float, wheel_radius=float, wheel_angular_velocity=float)` [classmethod] — Break Wheel Snapshot
  - `break_wheel_status(contact_point=Vector, phys_material=PhysicalMaterial, normalized_suspension_length=float, spring_force=float, slip_angle=float, is_slipping=bool, slip_magnitude=float, is_skidding=bool, skid_magnitude=float, skid_normal=Vector, drive_torque=float, brake_torque=float, abs_activated=bool)` [classmethod] — Break Wheel Status
  - `break_wheeled_snapshot()` [classmethod] — Break Wheeled Snapshot
  - `enable_mechanical_sim(state)` -> `None` — Enable or completely bypass the ProcessMechanicalSimulation call
  - `enable_suspension(state)` -> `None` — Enable or completely bypass the ApplySuspensionForces call
  - `enable_wheel_friction(state)` -> `None` — Enable or completely bypass the ApplyWheelFrictionForces call
  - `get_engine_max_rotation_speed()` -> `float` — Get current engineâs max rotation speed
  - `get_engine_rotation_speed()` -> `float` — Get current engineâs rotation speed
  - `get_num_wheels()` -> `int32` — Get Num Wheels
  - `get_snapshot()` -> `WheeledSnaphotData` — Grab a snapshot of the vehicle instance dynamic state
  - `get_wheel_state(wheel_index)` -> `WheelStatus` — Get a wheels current simulation state
  - `make_wheel_snapshot(suspension_offset, wheel_rotation_angle, steering_angle, wheel_radius, wheel_angular_velocity)` -> `WheelSnapshot` [classmethod] — Make Wheel Snapshot
  - `make_wheel_status(contact, phys_material, normalized_suspension_length, spring_force, slip_angle, is_slipping, slip_magnitude, is_skidding, skid_magnitude, drive_torque, brake_torque, contact_point=Vector, skid_normal=Vector)` [classmethod] — Make Wheel Status
  - `make_wheeled_snapshot(transform, linear_velocity, angular_velocity, selected_gear, engine_rpm, wheel_snapshots)` -> `WheeledSnaphotData` [classmethod] — Make Wheeled Snapshot
  - `set_abs_enabled(wheel_index, enabled)` -> `None` — Set ABSEnabled
  - `set_affected_by_brake(wheel_index, enabled)` -> `None` — Set Affected by Brake
  - `set_affected_by_engine(wheel_index, enabled)` -> `None` — Set Affected by Engine
  - `set_affected_by_handbrake(wheel_index, enabled)` -> `None` — Set Affected by Handbrake
  - `set_affected_by_steering(wheel_index, enabled)` -> `None` — Set Affected by Steering
  - `set_brake_torque(brake_torque, wheel_index)` -> `None` — Set Brake Torque
  - `set_differential_front_rear_split(front_rear_slpit)` -> `None` — Set Differential Front Rear Split
  - `set_downforce_coefficient(downforce_coeff)` -> `None` — Set Downforce Coefficient
  - `set_drag_coefficient(drag_coeff)` -> `None` — Set Drag Coefficient
  - `set_drive_torque(drive_torque, wheel_index)` -> `None` — Set Drive Torque
  - `set_max_engine_torque(torque)` -> `None` — change handling via blueprint at runtime
  - `set_snapshot(snapshot_in)` -> `None` — Set snapshot of vehicle instance dynamic state
  - `set_suspension_params(rate, damping, preload, max_raise, max_drop, wheel_index)` -> `None` — Set Suspension Params
  - `set_torque_combine_method(combine_method, wheel_index)` -> `None` — Set Torque Combine Method
  - `set_traction_control_enabled(wheel_index, enabled)` -> `None` — Set Traction Control Enabled
  - `set_wheel_class(wheel_index, wheel_class)` -> `None` — Set Wheel Class
  - `set_wheel_friction_multiplier(wheel_index, friction)` -> `None` — Set Wheel Friction Multiplier
  - `set_wheel_handbrake_torque(wheel_index, torque)` -> `None` — Set Wheel Handbrake Torque
  - `set_wheel_max_brake_torque(wheel_index, torque)` -> `None` — Set Wheel Max Brake Torque
  - `set_wheel_max_steer_angle(wheel_index, angle_degrees)` -> `None` — Set Wheel Max Steer Angle
  - `set_wheel_radius(wheel_index, radius)` -> `None` — Set Wheel Radius
  - `set_wheel_slip_graph_multiplier(wheel_index, multiplier)` -> `None` — Set Wheel Slip Graph Multiplier

**Properties** (1):
  - `wheels`: `None` [Read-Only] — [Read-Only] Our instanced wheels (Array[ChaosVehicleWheel])

### `unreal.VehicleAnimationInstance`
Inherits: `AnimInstance` | Header: `VehicleAnimationInstance.h`

Vehicle Animation Instance

**Methods** (1):
  - `get_vehicle()` -> `WheeledVehiclePawn` — Makes a montage jump to the end of a named section.

### `unreal.WheeledVehiclePawn`
Inherits: `Pawn` | Header: `WheeledVehiclePawn.h`

ChaosWheeledVehicle is the base wheeled vehicle pawn actor. By default it uses UChaosWheeledVehicleMovementComponent for its simulation, but this can be overridden by inheriting from the class and mod...

**Properties** (2):
  - `mesh`: `SkeletalMeshComponent` [Read-Only] — [Read-Only] The main skeletal mesh associated with this Vehicle (SkeletalMeshComponent)
  - `vehicle_movement_component`: `ChaosVehicleMovementComponent` [Read-Only] — [Read-Only] vehicle simulation component (ChaosVehicleMovementComponent)

### `unreal.AxleType`
Inherits: `EnumBase` | Header: `ChaosVehicleWheel.h`

EAxle Type

**Properties** (3):
  - `FRONT`: `AxleType = Ellipsis` — 1
  - `REAR`: `AxleType = Ellipsis` — 2
  - `UNDEFINED`: `AxleType = Ellipsis` — 0

### `unreal.InputFunctionType`
Inherits: `EnumBase` | Header: `ChaosVehicleMovementComponent.h`

Input Options

**Properties** (3):
  - `CUSTOM_CURVE`: `InputFunctionType = Ellipsis` — 2
  - `LINEAR_FUNCTION`: `InputFunctionType = Ellipsis` — 0
  - `SQUARED_FUNCTION`: `InputFunctionType = Ellipsis` — 1

### `unreal.SteeringType`
Inherits: `EnumBase` | Header: `ChaosWheeledVehicleMovementComponent.h`

Single angle : both wheels steer by the same amount AngleRatio : outer wheels on corner steer less than the inner ones by set ratio Ackermann : Ackermann steering principle is applied

**Properties** (3):
  - `ACKERMANN`: `SteeringType = Ellipsis` — 2
  - `ANGLE_RATIO`: `SteeringType = Ellipsis` — 1
  - `SINGLE_ANGLE`: `SteeringType = Ellipsis` — 0

### `unreal.SweepShape`
Inherits: `EnumBase` | Header: `ChaosVehicleWheel.h`

ESweep Shape

**Properties** (3):
  - `RAYCAST`: `SweepShape = Ellipsis` — Use ray to determine suspension length to ground - fastest 0
  - `SHAPECAST`: `SweepShape = Ellipsis` — Use wheel collision shape to determine suspension length to ground - Slowest 2
  - `SPHERECAST`: `SweepShape = Ellipsis` — Use sphere to determine suspension length to ground 1

### `unreal.SweepType`
Inherits: `EnumBase` | Header: `ChaosVehicleWheel.h`

ESweep Type

**Properties** (2):
  - `COMPLEX_SWEEP`: `SweepType = Ellipsis` — Sweeps against complex geometry only 1
  - `SIMPLE_SWEEP`: `SweepType = Ellipsis` — Sweeps against simple geometry only 0

### `unreal.TorqueCombineMethod`
Inherits: `EnumBase` | Header: `ChaosVehicleWheel.h`

ETorque Combine Method

**Properties** (3):
  - `ADDITIVE`: `TorqueCombineMethod = Ellipsis` — Combine external torque with existing torques, must set external torque every frame 2
  - `NONE`: `TorqueCombineMethod = Ellipsis` — External torque value has no effect - default * 0
  - `OVERRIDE`: `TorqueCombineMethod = Ellipsis` — completely replace existing torques, can set and forget will apply same torque every frame until zer...

### `unreal.VehicleAerofoilType`
Inherits: `EnumBase` | Header: `ChaosVehicleMovementComponent.h`

EVehicle Aerofoil Type

**Properties** (4):
  - `ELEVATOR`: `VehicleAerofoilType = Ellipsis` — affected by steering/yaw input 3
  - `FIXED`: `VehicleAerofoilType = Ellipsis` — 0
  - `RUDDER`: `VehicleAerofoilType = Ellipsis` — affected by Roll input 2
  - `WING`: `VehicleAerofoilType = Ellipsis` — 1

### `unreal.VehicleDifferential`
Inherits: `EnumBase` | Header: `ChaosWheeledVehicleMovementComponent.h`

EVehicle Differential

**Properties** (4):
  - `ALL_WHEEL_DRIVE`: `VehicleDifferential = Ellipsis` — 1
  - `FRONT_WHEEL_DRIVE`: `VehicleDifferential = Ellipsis` — 2
  - `REAR_WHEEL_DRIVE`: `VehicleDifferential = Ellipsis` — 3
  - `UNDEFINED`: `VehicleDifferential = Ellipsis` — 0

### `unreal.VehicleThrustType`
Inherits: `EnumBase` | Header: `ChaosVehicleMovementComponent.h`

EVehicle Thrust Type

**Properties** (4):
  - `ELEVATOR`: `VehicleThrustType = Ellipsis` — affected by steering/yaw input 3
  - `FIXED`: `VehicleThrustType = Ellipsis` — 0
  - `RUDDER`: `VehicleThrustType = Ellipsis` — affected by Roll input 2
  - `WING`: `VehicleThrustType = Ellipsis` — 1
