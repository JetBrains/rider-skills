# UE Python API — MassGameplayDebug Module

**6 types** from the `MassGameplayDebug` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AgentDebugVisualization`, `SimDebugDataRow`, `MassDebugVisualizationComponent`, `MassDebugVisualizationTrait`, `MassDebugVisualizer`, `MassEntityDebugShape`

---

## Classes

### `unreal.AgentDebugVisualization`
Inherits: `TableRowBase` | Header: `MassGameplayDebugTypes.h`

Agent Debug Visualization

### `unreal.SimDebugDataRow`
Inherits: `TableRowBase` | Header: `MassGameplayDebugTypes.h`

Sim Debug Data Row

### `unreal.MassDebugVisualizationComponent`
Inherits: `ActorComponent` | Header: `MassDebugVisualizationComponent.h`

meant to be created procedurally and owned by an AMassDebugVisualizer instance. Will ensure if placed on a different type of actor

### `unreal.MassDebugVisualizationTrait`
Inherits: `MassEntityTraitBase` | Header: `MassDebugVisualizationTrait.h`

Mass Debug Visualization Trait

### `unreal.MassDebugVisualizer`
Inherits: `Actor` | Header: `MassDebugVisualizer.h`

Mass Debug Visualizer

### `unreal.MassEntityDebugShape`
Inherits: `EnumBase` | Header: `MassGameplayDebugTypes.h`

EMass Entity Debug Shape

**Properties** (4):
  - `BOX`: `MassEntityDebugShape = Ellipsis` — 0
  - `CAPSULE`: `MassEntityDebugShape = Ellipsis` — 3
  - `CONE`: `MassEntityDebugShape = Ellipsis` — 1
  - `CYLINDER`: `MassEntityDebugShape = Ellipsis` — 2
