# UE Python API — AudioMotorSim Module

**7 types** from the `AudioMotorSim` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AudioMotorSimConfigData`, `AudioMotorSimInputContext`, `AudioMotorSimRuntimeContext`, `MotorSimEntry`, `AudioMotorModelComponent`, `AudioMotorSim`, `AudioMotorSimComponent`

---

## Classes

### `unreal.AudioMotorSimConfigData`
Inherits: `StructBase` | Header: `AudioMotorSimConfigData.h`

Base struct containing configuration data for motor sim components

### `unreal.AudioMotorSimInputContext`
Inherits: `StructBase` | Header: `AudioMotorSimTypes.h`

collection of properties to be filled out by the vehicle in order to update the motor sim

**Properties** (14):
  - `boost`: `float` — [Read-Write] normalized input representing additional thrust beyond normal driving behaviors (float)
  - `brake`: `float` — [Read-Write] normalized input representing the player wanting to slow down [0, 1] (float)
  - `can_shift`: `bool` — [Read-Write] whether the motor can freely shift gears (bool)
  - `clutch_engaged`: `bool` — [Read-Write] when true, signals that the gears are temporarily disconnected from the motor (bool)
  - `delta_time`: `float` — [Read-Write] Time in Seonds (float)
  - `driving`: `bool` — [Read-Write] whether a player can drive the vehicle right now (bool)
  - `forward_speed`: `float` — [Read-Write] Current speed of the vehicle relative to its forward direction (float)
  - `grounded`: `bool` — [Read-Write] whether the vehicle is firmly on the ground (bool)
  - `motor_friction_modifier`: `float` — [Read-Write] scaling to apply to any behaviors that model internal motor friction (float)
  - `side_speed`: `float` — [Read-Write] absolute value of the speed of the vehicle relative to its right direction (float)
  - `speed`: `float` — [Read-Write] Current speed of the vehicle in any direction (float)
  - `surface_friction_modifier`: `float` — [Read-Write] scaling to apply to any behaviors that model surface friction (float)
  - `throttle`: `float` — [Read-Write] normalized input representing the player wanting to accelerate [-1, 1] (float)
  - `up_speed`: `float` — [Read-Write] Current speed of the vehicle along the z-axis (float)

### `unreal.AudioMotorSimRuntimeContext`
Inherits: `StructBase` | Header: `AudioMotorSimTypes.h`

properties that represent the current state of the motor sim, and persist between updates

**Properties** (5):
  - `gear`: `int` — [Read-Write] which gear the motor is in, if it uses gears (int32)
  - `pitch`: `float` — [Read-Write] pitch to set on the output component (float)
  - `rpm`: `float` — [Read-Write] normalized RPM [0-1] of the motor (float)
  - `shifting`: `bool` — [Read-Write] true while the motor is performing a gear shift (bool)
  - `volume`: `float` — [Read-Write] volume to set on the output component (float)

### `unreal.MotorSimEntry`
Inherits: `StructBase` | Header: `AudioMotorModelComponent.h`

Motor Sim Entry

**Properties** (2):
  - `sim`: `AudioMotorSim` [Read-Only] — [Read-Only] (AudioMotorSim)
  - `sort_order`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.AudioMotorModelComponent`
Inherits: `ActorComponent` | Header: `AudioMotorModelComponent.h`

Audio Motor Model Component

**Methods** (14):
  - `add_motor_audio_component(component)` -> `None` — Add Motor Audio Component
  - `add_motor_sim_component(component, sort_order = 0)` -> `None` — Add Motor Sim Component
  - `configure_motor_sim_components(config_data)` -> `None` — Configure Motor Sim Components
  - `get_cached_input_data()` -> `AudioMotorSimInputContext` — Get Cached Input Data
  - `get_gear()` -> `int32` — Get Gear
  - `get_rpm()` -> `float` — Get Rpm
  - `get_runtime_info()` -> `AudioMotorSimRuntimeContext` — Get Runtime Info
  - `remove_all_motor_sim_components()` -> `None` — Remove All Motor Sim Components
  - `remove_motor_audio_component(component)` -> `None` — Remove Motor Audio Component
  - `remove_motor_sim_component(component)` -> `None` — Remove Motor Sim Component
  - `reset()` -> `None` — Reset
  - `start_output()` -> `None` — Start Output
  - `stop_output()` -> `None` — Stop Output
  - `update(input)` -> `None` — Update

**Properties** (1):
  - `sim_components`: `None` [Read-Only] — [Read-Only] (Array[MotorSimEntry])

### `unreal.AudioMotorSim`
Inherits: `Interface` | Header: `IAudioMotorSim.h`

Audio Motor Sim

**Methods** (3):
  - `config_motor_sim(config_data)` -> `None` — Config Motor Sim
  - `get_enabled()` -> `bool` — Get Enabled
  - `reset()` -> `None` — Use to reset any state that might be desired. Will be called automatically if the entire MotorSim is Reset, or call it m...

### `unreal.AudioMotorSimComponent`
Inherits: `ActorComponent` | Header: `IAudioMotorSim.h`

Audio Motor Sim Component

**Methods** (6):
  - `bp_reset()` -> `None` — Called when something Resets this component
  - `bp_update(input, runtime_info)` -> `(input=AudioMotorSimInputContext, runtime_info=AudioMotorSimRuntimeContext) or None`
  - `config_motor_sim(config_data)` -> `None` — Config Motor Sim
  - `get_enabled()` -> `bool` — Get Enabled
  - `reset()` -> `None` — Use to reset any state that might be desired. Will be called automatically if the entire MotorSim is Reset, or call it m...
  - `set_enabled(new_enabled)` -> `None` — controls whether this will run its update function

**Properties** (3):
  - `cached_input`: `AudioMotorSimInputContext` [Read-Only] — [Read-Only] Input data after running this component (AudioMotorSimInputContext)
  - `cached_runtime_info`: `AudioMotorSimRuntimeContext` [Read-Only] — [Read-Only] runtime info after running this component (AudioMotorSimRuntimeContext)
  - `enabled`: `bool` [Read-Only] — [Read-Only] will only update if enabled (bool)
