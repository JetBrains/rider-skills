# UE Python API — ZoneGraphDebug Module

**3 types** from the `ZoneGraphDebug` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ZoneGraphTestingActor`, `ZoneGraphTestingComponent`, `ZoneLaneTest`

---

## Classes

### `unreal.ZoneGraphTestingActor`
Inherits: `Actor` | Header: `ZoneGraphTestingActor.h`

Debug actor to visually test zone graph.

**Methods** (2):
  - `disable_custom_tests()` -> `None` — Prevent custom tests to be notified when lane location is updated. Currently active tests will get notified with an inva...
  - `enable_custom_tests()` -> `None` — Allow custom tests to be notified when lane location is updated.

### `unreal.ZoneGraphTestingComponent`
Inherits: `PrimitiveComponent` | Header: `ZoneGraphTestingActor.h`

Actor for testing ZoneGraph functionality.

**Methods** (2):
  - `disable_custom_tests()` -> `None` — Prevent custom tests to be notified when lane location is updated. Currently active tests will get notified with an inva...
  - `enable_custom_tests()` -> `None` — Allow custom tests to be notified when lane location is updated.

### `unreal.ZoneLaneTest`
Inherits: `Object` | Header: `ZoneGraphTestingActor.h`

Base class to inherit from to be able to perform custom actions on lane detected by the testing actor.
