# UE Python API — PropertyPath Module

**5 types** from the `PropertyPath` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PropertyPathTestBaseStruct`, `PropertyPathTestInnerStruct`, `PropertyPathTestStruct`, `PropertyPathTestObject`, `PropertyPathTestEnum`

---

## Classes

### `unreal.PropertyPathTestBaseStruct`
Inherits: `StructBase` | Header: `PropertyPathHelpersTest.h`

Property Path Test Base Struct

### `unreal.PropertyPathTestInnerStruct`
Inherits: `PropertyPathTestBaseStruct` | Header: `PropertyPathHelpersTest.h`

Property Path Test Inner Struct

### `unreal.PropertyPathTestStruct`
Inherits: `PropertyPathTestBaseStruct` | Header: `PropertyPathHelpersTest.h`

Property Path Test Struct

### `unreal.PropertyPathTestObject`
Inherits: `Object` | Header: `PropertyPathHelpersTest.h`

Property Path Test Object

**Properties** (8):
  - `bool`: `bool` — [Read-Write] (bool)
  - `float`: `float` — [Read-Write] (float)
  - `inner_object`: `PropertyPathTestObject` [Read-Only] — [Read-Only] (PropertyPathTestObject)
  - `integer`: `int` — [Read-Write] (int32)
  - `string`: `str` — [Read-Write] (str)
  - `struct`: `PropertyPathTestStruct` — [Read-Write] (PropertyPathTestStruct)
  - `struct_const_ref`: `PropertyPathTestStruct` — [Read-Write] (PropertyPathTestStruct)
  - `struct_ref`: `PropertyPathTestStruct` — [Read-Write] (PropertyPathTestStruct)

### `unreal.PropertyPathTestEnum`
Inherits: `EnumBase` | Header: `PropertyPathHelpersTest.h`

EProperty Path Test Enum

**Properties** (4):
  - `FOUR`: `PropertyPathTestEnum = Ellipsis` — 3
  - `ONE`: `PropertyPathTestEnum = Ellipsis` — 0
  - `THREE`: `PropertyPathTestEnum = Ellipsis` — 2
  - `TWO`: `PropertyPathTestEnum = Ellipsis` — 1
