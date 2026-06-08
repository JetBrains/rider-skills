# UE Python API — AudioMotorSimStandardComponents Module

**16 types** from the `AudioMotorSimStandardComponents` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MotorPhysicsSimConfigData`, `MotorSimGearCurve`, `BoostMotorSimComponent`, `MotorPhysicsSimComponent`, `ResistanceMotorSimComponent`, `ReverseMotorSimComponent`, `RevLimiterMotorSimComponent`, `RpmCurveMotorSimComponent`, `ThrottleStateMotorSimComponent`, `VelocitySyncMotorSimComponent`, `OnEngineBlowoff`, `OnGearChanged`, `OnGearChangedEvent`, `OnRevLimiterHit`, `OnRevLimiterStateChanged`, `OnThrottleChanged`

---

## Classes

### `unreal.MotorPhysicsSimConfigData`
Inherits: `AudioMotorSimConfigData` | Header: `StandardAudioMotorSimConfigDataTypes.h`

Motor Physics Sim Config Data

**Properties** (3):
  - `braking_horse_power`: `float` [Read-Only] — [Read-Only] (float)
  - `engine_torque`: `float` [Read-Only] — [Read-Only] (float)
  - `weight`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.MotorSimGearCurve`
Inherits: `StructBase` | Header: `RpmCurveMotorSimComponent.h`

Motor Sim Gear Curve

### `unreal.BoostMotorSimComponent`
Inherits: `AudioMotorSimComponent` | Header: `BoostMotorSimComponent.h`

Uses Boost input to momentarily scale throttle input and pitch output

### `unreal.MotorPhysicsSimComponent`
Inherits: `AudioMotorSimComponent` | Header: `MotorPhysicsSimComponent.h`

Uses throttle input to run a physics simulation to drive RPM and shift gears when needed

**Properties** (19):
  - `always_downshift_to_zeroth_gear`: `bool` — [Read-Write] (bool)
  - `braking_horse_power`: `float` — [Read-Write] (float)
  - `clutched_decel_scale`: `float` — [Read-Write] how much more quickly the engine decelerates off-throttle while clutched (float)
  - `clutched_force_modifier`: `float` — [Read-Write] (float)
  - `clutched_gear_ratio`: `float` — [Read-Write] (float)
  - `down_shift_start_rpm`: `float` — [Read-Write] (float)
  - `engine_friction`: `float` — [Read-Write] How much of the torque is loss due to engine friction (float)
  - `engine_gear_ratio`: `float` — [Read-Write] (float)
  - `engine_torque`: `float` — [Read-Write] (float)
  - `gear_ratios`: `None` — [Read-Write] (Array[float])
  - `ground_friction`: `float` — [Read-Write] Coefficient of Rolling Resistance (float)
  - `infinite_gear_ratio`: `float` — [Read-Write] how much to scale gear ratio per gear past the max gear (float)
  - `on_gear_changed_event`: `OnGearChanged` — [Read-Write] (OnGearChanged)
  - `rpm_interp_speed`: `float` — [Read-Write] (float)
  - `throttle_interpolation_time`: `float` — [Read-Write] (float)
  - `up_shift_max_rpm`: `float` — [Read-Write] (float)
  - `use_infinite_gears`: `bool` — [Read-Write] (bool)
  - `weight`: `float` — [Read-Write] (float)
  - `wind_resistance_per_velocity`: `float` — [Read-Write] (float)

### `unreal.ResistanceMotorSimComponent`
Inherits: `AudioMotorSimComponent` | Header: `ResistanceMotorSimComponent.h`

Applys additional surface friction based on the angle of the vehicleâs velocity

**Properties** (3):
  - `min_speed`: `float` — [Read-Write] Minimum speed to apply this extra resistance (float)
  - `side_speed_friction_curve`: `RuntimeFloatCurve` — [Read-Write] Additional friction to add based on lateral speed (RuntimeFloatCurve)
  - `up_speed_max_friction`: `float` — [Read-Write] How much to increase surface friction when driving straight up. Scales linearly based o...

### `unreal.ReverseMotorSimComponent`
Inherits: `AudioMotorSimComponent` | Header: `ReverseMotorSimComponent.h`

Scales engine friction when reversing

**Properties** (1):
  - `reverse_engine_resistance_modifier`: `float` — [Read-Write] How much to scale engine friction by when reversing (float)

### `unreal.RevLimiterMotorSimComponent`
Inherits: `AudioMotorSimComponent` | Header: `RevLimiterMotorSimComponent.h`

Temporarily cuts throttle and reduces RPM when drifting or in the air

**Properties** (9):
  - `air_max_throttle_time`: `float` — [Read-Write] (float)
  - `decel_scale`: `float` — [Read-Write] (float)
  - `limit_time`: `float` — [Read-Write] (float)
  - `limiter_max_rpm`: `float` — [Read-Write] (float)
  - `on_rev_limiter_hit`: `OnRevLimiterHit` — [Read-Write] (OnRevLimiterHit)
  - `on_rev_limiter_state_changed`: `OnRevLimiterStateChanged` — [Read-Write] (OnRevLimiterStateChanged)
  - `recover_rpm`: `float` — [Read-Write] (float)
  - `rev_limit_on_clutch_engaged`: `bool` — [Read-Write] (bool)
  - `side_speed_threshold`: `float` — [Read-Write] (float)

### `unreal.RpmCurveMotorSimComponent`
Inherits: `AudioMotorSimComponent` | Header: `RpmCurveMotorSimComponent.h`

Derives Gear and RPM directly from speed using hand drawn curves and gear thresholds

**Properties** (3):
  - `interp_speed`: `float` — [Read-Write] (float)
  - `on_down_shift`: `OnGearChangedEvent` — [Read-Write] (OnGearChangedEvent)
  - `on_up_shift`: `OnGearChangedEvent` — [Read-Write] (OnGearChangedEvent)

### `unreal.ThrottleStateMotorSimComponent`
Inherits: `AudioMotorSimComponent` | Header: `ThrottleStateMotorSimComponent.h`

Provides events for when the throttle changes state

**Properties** (4):
  - `blowoff_min_throttle_time`: `float` — [Read-Write] (float)
  - `on_engine_blowoff`: `OnEngineBlowoff` — [Read-Write] Fires when the throttle is released, keeping track of how long the throttle was held fo...
  - `on_throttle_engaged`: `OnThrottleChanged` — [Read-Write] (OnThrottleChanged)
  - `on_throttle_released`: `OnThrottleChanged` — [Read-Write] (OnThrottleChanged)

### `unreal.VelocitySyncMotorSimComponent`
Inherits: `AudioMotorSimComponent` | Header: `VelocitySyncMotorSimComponent.h`

Sets Rpm directly from speed using a curve, if under a speed threshold or if the throttle is released for a period of time

**Properties** (6):
  - `first_gear_throttle_threshold`: `float` — [Read-Write] (float)
  - `interp_speed`: `float` — [Read-Write] (float)
  - `interp_time`: `float` — [Read-Write] (float)
  - `no_throttle_time`: `float` — [Read-Write] (float)
  - `speed_threshold`: `float` — [Read-Write] Speed below which gears will be ignored, and RPM will sync directly to velocity (float)
  - `speed_to_rpm_curve`: `RuntimeFloatCurve` — [Read-Write] (RuntimeFloatCurve)

### `unreal.OnEngineBlowoff`
Inherits: `MulticastDelegateBase` | Header: `ThrottleStateMotorSimComponent.h`

On Engine Blowoff Delegate Signature

### `unreal.OnGearChanged`
Inherits: `MulticastDelegateBase` | Header: `MotorPhysicsSimComponent.h`

On Gear Changed Delegate Signature

### `unreal.OnGearChangedEvent`
Inherits: `MulticastDelegateBase` | Header: `RpmCurveMotorSimComponent.h`

On Gear Changed Event Delegate Signature

### `unreal.OnRevLimiterHit`
Inherits: `MulticastDelegateBase` | Header: `RevLimiterMotorSimComponent.h`

On Rev Limiter Hit Delegate Signature

### `unreal.OnRevLimiterStateChanged`
Inherits: `MulticastDelegateBase` | Header: `RevLimiterMotorSimComponent.h`

On Rev Limiter State Changed Delegate Signature

### `unreal.OnThrottleChanged`
Inherits: `MulticastDelegateBase` | Header: `ThrottleStateMotorSimComponent.h`

On Throttle Changed Delegate Signature
