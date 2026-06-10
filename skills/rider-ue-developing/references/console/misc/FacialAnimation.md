# UE Python API — FacialAnimation Module

**1 types** from the `FacialAnimation` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AudioCurveSourceComponent`

---

## Classes

### `unreal.AudioCurveSourceComponent`
Inherits: `AudioComponent` | Header: `AudioCurveSourceComponent.h`

An audio component that also provides curves to drive animation

**Methods** (3):
  - `get_binding_name()` -> `Name` — Get the name that this curve source can be bound to by. Clients of this curve source will use this name to identify this...
  - `get_curve_value(curve_name)` -> `float` — Get the value for a specified curve
  - `get_curves()` -> `Array [ NamedCurveValue ]` — Evaluate all curves that this source provides

**Properties** (2):
  - `curve_source_binding_name`: `Name` — [Read-Write] Get the name that this curve source can be bound to by.
Clients of this curve source wi...
  - `curve_sync_offset`: `float` — [Read-Write] Offset in time applied to audio position when evaluating curves (float)
