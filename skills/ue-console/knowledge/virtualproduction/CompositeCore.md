# UE Python API — CompositeCore Module

**2 types** from the `CompositeCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CompositeCoreSubsystem`, `HoldoutCompositeComponent`

---

## Classes

### `unreal.CompositeCoreSubsystem`
Inherits: `TickableWorldSubsystem` | Header: `CompositeCoreSubsystem.h`

Composite subsytem used as an interface to the (private) scene view extension.

**Methods** (2):
  - `register_primitive(primitive_component)` -> `None` — Register a single primitive for compositing.
  - `unregister_primitive(primitive_component)` -> `None` — Unregister a single primitive from compositing.

### `unreal.HoldoutCompositeComponent`
Inherits: `SceneComponent` | Header: `HoldoutCompositeComponent.h`

Holdout Composite Component

**Properties** (1):
  - `is_enabled`: `bool` — [Read-Write] Whether or not the component activates the composite. (bool)
