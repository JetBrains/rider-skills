# UE Python API — RuntimeTests Module

**1 types** from the `RuntimeTests` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `EngineTestTickActor`

---

## Classes

### `unreal.EngineTestTickActor`
Inherits: `Actor` | Header: `EngineRuntimeTests.h`

A simple actor class that can be manually ticked to test for correctness and performance

**Properties** (7):
  - `math_counter`: `float` [Read-Only] — [Read-Only] Used for bShouldDoMath (float)
  - `math_increment`: `float` [Read-Only] — [Read-Only] Used for bShouldDoMath (float)
  - `math_limit`: `float` [Read-Only] — [Read-Only] Used for bShouldDoMath (float)
  - `should_do_math`: `bool` [Read-Only] — [Read-Only] If it should perform other busy work (bool)
  - `should_increment_tick_count`: `bool` [Read-Only] — [Read-Only] If it should actually increase tick count (bool)
  - `tick_count`: `int` [Read-Only] — [Read-Only] Number of times this has ticked since reset (int32)
  - `tick_order`: `int` [Read-Only] — [Read-Only] Indicates when this was ticked in a frame, with 1 being first (int32)
