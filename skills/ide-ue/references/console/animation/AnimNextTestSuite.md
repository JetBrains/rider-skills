# UE Python API — AnimNextTestSuite Module

**3 types** from the `AnimNextTestSuite` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNextTests_PrintResult`, `AnimNextTests_TestOperation`, `AnimNextTestFuncLib`

---

## Classes

### `unreal.AnimNextTests_PrintResult`
Inherits: `RigVMStructMutable` | Header: `AnimNextVariablesTest.h`

Anim Next Tests Print Result

**Properties** (1):
  - `result`: `int` — [Read-Write] (int32)

### `unreal.AnimNextTests_TestOperation`
Inherits: `RigVMStructMutable` | Header: `AnimNextVariablesTest.h`

Anim Next Tests Test Operation

**Properties** (3):
  - `a`: `int` — [Read-Write] (int32)
  - `b`: `int` — [Read-Write] (int32)
  - `result`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.AnimNextTestFuncLib`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimNextVariablesTest.h`

Anim Next Test Func Lib

**Methods** (3):
  - `get_obj(obj)` -> `AnimNextTestFuncLib` [classmethod] — Get Obj
  - `get_value_b()` -> `int32` — Get Value B
  - `get_value_c(obj)` -> `int32` [classmethod] — Get Value C
