# UE Python API — ZoneGraphAnnotations Module

**6 types** from the `ZoneGraphAnnotations` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ZoneGraphAnnotationComponent`, `ZoneGraphAnnotationTest`, `ZoneGraphAnnotationTestingActor`, `ZoneGraphAnnotationTestingComponent`, `ZoneGraphDisturbanceAnnotation`, `ZoneGraphDisturbanceAnnotationBPLibrary`

---

## Classes

### `unreal.ZoneGraphAnnotationComponent`
Inherits: `DebugDrawComponent` | Header: `ZoneGraphAnnotationComponent.h`

Zone Graph Annotation Component

### `unreal.ZoneGraphAnnotationTest`
Inherits: `Object` | Header: `ZoneGraphAnnotationTestingActor.h`

Base class for ZoneGraph Annotation tests.

### `unreal.ZoneGraphAnnotationTestingActor`
Inherits: `Actor` | Header: `ZoneGraphAnnotationTestingActor.h`

Debug actor to test Mass ZoneGraph Annotations.

**Methods** (1):
  - `trigger()` -> `None` — Simple trigger function to trigger something on the tests. Ideally this would be part of each test, but it does not work...

### `unreal.ZoneGraphAnnotationTestingComponent`
Inherits: `DebugDrawComponent` | Header: `ZoneGraphAnnotationTestingActor.h`

Debug component to test Mass ZoneGraph Annotations. Handles tests and rendering.

### `unreal.ZoneGraphDisturbanceAnnotation`
Inherits: `ZoneGraphAnnotationComponent` | Header: `ZoneGraphDisturbanceAnnotation.h`

ZoneGraph Disturbance Annotation

### `unreal.ZoneGraphDisturbanceAnnotationBPLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ZoneGraphDisturbanceAnnotationBPLibrary.h`

Set of utilities for dealing with Disturbance Annotation.

**Methods** (1):
  - `trigger_danger(world_context_object, instigator, position, radius, duration)` -> `None` [classmethod]
