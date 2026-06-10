# UE Python API — LiveLinkEditor Module

**3 types** from the `LiveLinkEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LiveLinkInnerTestInternal`, `LiveLinkTestFrameDataInternal`, `LiveLinkBlueprintVirtualSubjectFactory`

---

## Classes

### `unreal.LiveLinkInnerTestInternal`
Inherits: `StructBase` | Header: `LiveLinkTest.h`

Live Link Inner Test Internal

### `unreal.LiveLinkTestFrameDataInternal`
Inherits: `LiveLinkBaseFrameData` | Header: `LiveLinkTest.h`

Live Link Test Frame Data Internal

**Properties** (8):
  - `float_array`: `None` [Read-Only] — [Read-Only] (Array[float])
  - `int_array`: `None` [Read-Only] — [Read-Only] (Array[int32])
  - `single_float`: `float` [Read-Only] — [Read-Only] (float)
  - `single_int`: `int` [Read-Only] — [Read-Only] (int32)
  - `single_struct`: `LiveLinkInnerTestInternal` [Read-Only] — [Read-Only] (LiveLinkInnerTestInternal)
  - `single_vector`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `struct_array`: `None` [Read-Only] — [Read-Only] (Array[LiveLinkInnerTestInternal])
  - `vector_array`: `None` [Read-Only] — [Read-Only] (Array[Vector])

### `unreal.LiveLinkBlueprintVirtualSubjectFactory`
Inherits: `BlueprintFactory` | Header: `LiveLinkBlueprintVirtualSubjectFactory.h`

Live Link Blueprint Virtual Subject Factory

**Properties** (1):
  - `role`: `Class` — [Read-Write] (type(Class))
