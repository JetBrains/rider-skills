# UE Python API — ChaosVDBlueprint Module

**1 types** from the `ChaosVDBlueprint` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ChaosVDRuntimeBlueprintLibrary`

---

## Classes

### `unreal.ChaosVDRuntimeBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ChaosVDRuntimeBlueprintLibrary.h`

Library function to record debug draw shapes that will be played back when a CVD recording is loaded

**Methods** (4):
  - `record_debug_draw_box(world_context = None, box, tag="None", color=[0.000000, 0.000000, 1.000000, 1.000000])` -> `None` [classmethod] — Record Debug Draw Box
  - `record_debug_draw_line(world_context = None, start_location, end_location, tag="None", color=[0.000000, 0.000000, 1.000000, 1.000000])` -> `None` [classmethod] — Record Debug Draw Line
  - `record_debug_draw_sphere(world_context = None, center, radius, tag="None", color=[0.000000, 0.000000, 1.000000, 1.000000])` -> `None` [classmethod] — Record Debug Draw Sphere
  - `record_debug_draw_vector(world_context = None, start_location, vector, tag="None", color=[0.000000, 0.000000, 1.000000, 1.000000])` -> `None` [classmethod] — Record Debug Draw Vector
