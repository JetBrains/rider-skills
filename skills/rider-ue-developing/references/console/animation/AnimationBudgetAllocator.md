# UE Python API — AnimationBudgetAllocator Module

**3 types** from the `AnimationBudgetAllocator` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimationBudgetAllocatorParameters`, `AnimationBudget`, `SkeletalMeshComponentBudgeted`

---

## Classes

### `unreal.AnimationBudgetAllocatorParameters`
Inherits: `StructBase` | Header: `AnimationBudgetAllocatorParameters.h`

Parameter block used to control the behavior of the budget allocator

**Properties** (21):
  - `always_tick_falloff_aggression`: `float` — [Read-Write] Range [0.1, 0.9].
Controls the rate at which âalways tickedâ components falloff und...
  - `auto_calculated_significance_max_distance`: `float` — [Read-Write] Range > 1.0.
Controls the distance at which auto-calculated significance for budgeted c...
  - `budget_factor_before_aggressive_reduced_work`: `float` — [Read-Write] Range > 1.
Reduced work will be applied more rapidly when budget pressure goes over thi...
  - `budget_factor_before_reduced_work`: `float` — [Read-Write] Range > 1
Reduced work will be delayed until budget pressure goes over this amount. (fl...
  - `budget_factor_before_reduced_work_epsilon`: `float` — [Read-Write] Range > 0.0.
Increased work will be delayed until budget pressure goes under BudgetFact...
  - `budget_in_ms`: `float` — [Read-Write] Values > 0.1.
The time in milliseconds that we allocate for skeletal mesh work to be pe...
  - `budget_pressure_before_emergency_reduced_work`: `float` — [Read-Write] Range > 0.0.
Controls the budget pressure where emergency reduced work (applied to all ...
  - `budget_pressure_smoothing_speed`: `float` — [Read-Write] Range > 0.0.
How much to smooth the budget pressure value used to throttle reduced work...
  - `initial_estimated_work_unit_time_ms`: `float` — [Read-Write] Values > 0.0.
Controls the time in milliseconds we expect, on average, for a skeletal m...
  - `interpolation_falloff_aggression`: `float` — [Read-Write] Range [0.1, 0.9].
Controls the rate at which interpolated components falloff under load...
  - `interpolation_max_rate`: `int` — [Read-Write] Values > 1.
Controls the rate at which ticks happen when interpolating. (int32)
  - `interpolation_tick_multiplier`: `float` — [Read-Write] Range [0.1, 0.9].
Controls the expected value an amortized interpolated tick will take ...
  - `max_interpolated_components`: `int` — [Read-Write] Range >= 0.
Max number of components to interpolate before we start throttling. (int32)
  - `max_tick_rate`: `int` — [Read-Write] Values >= 1.
The maximum tick rate we allow. If this is set then we can potentially go ...
  - `max_ticked_offsreen_components`: `int` — [Read-Write] Values >= 1
The maximum number of offscreen components we tick (most significant first)...
  - `min_quality`: `float` — [Read-Write] Values [0.0, 1.0].
The minimum quality metric allowed. Quality is determined simply by ...
  - `reduced_work_throttle_max_in_frames`: `int` — [Read-Write] Range [1, 255].
Prevents reduced work from changing too often due to system and load no...
  - `reduced_work_throttle_max_per_frame`: `int` — [Read-Write] Range [1, 255].
Controls the max number of components that are switched to/from reduced...
  - `reduced_work_throttle_min_in_frames`: `int` — [Read-Write] Range [1, 255].
Prevents reduced work from changing too often due to system and load no...
  - `state_change_throttle_in_frames`: `int` — [Read-Write] Range [1, 128]
Prevents throttle values from changing too often due to system and load ...
  - `work_unit_smoothing_speed`: `float` — [Read-Write] Values > 0.1.
The speed at which the average work unit converges on the measured amount...

### `unreal.AnimationBudget`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimationBudgetBlueprintLibrary.h`

Function library to expose the budget allocator to Blueprints

**Methods** (2):
  - `enable_animation_budget(world_context_object, enabled)` -> `None` [classmethod] — Enable/disable the animation budgeting system. Note that the system can also be disabled globally via CVar, which overri...
  - `set_animation_budget_parameters(world_context_object, parameters)` -> `None` [classmethod] — Set the parameters of the animation budgeting system. Note that the parameters can also be set globally via CVar.

### `unreal.SkeletalMeshComponentBudgeted`
Inherits: `SkeletalMeshComponent` | Header: `SkeletalMeshComponentBudgeted.h`

A skeletal mesh component that has its tick rate governed by a global animation budget

**Properties** (1):
  - `auto_register_with_budget_allocator`: `bool` — [Read-Write] Whether this component should automatically register with the budget allocator in OnReg...
