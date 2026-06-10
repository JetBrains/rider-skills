# UE Python API — NavCorridor Module

**3 types** from the `NavCorridor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `NavCorridorParams`, `NavCorridorTestingActor`, `NavCorridorTestingComponent`

---

## Classes

### `unreal.NavCorridorParams`
Inherits: `StructBase` | Header: `NavCorridor.h`

Nav Corridor Params

### `unreal.NavCorridorTestingActor`
Inherits: `Actor` | Header: `NavCorridorTestingComponent.h`

Debug actor to visually test zone graph.

### `unreal.NavCorridorTestingComponent`
Inherits: `DebugDrawComponent` | Header: `NavCorridorTestingComponent.h`

Component for testing AI Locomotion functionality.

**Properties** (2):
  - `corridor_time_us`: `float` [Read-Only] — [Read-Only] (float)
  - `pathfinding_time_us`: `float` [Read-Only] — [Read-Only] (float)
