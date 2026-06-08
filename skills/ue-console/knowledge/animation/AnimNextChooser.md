# UE Python API — AnimNextChooser Module

**4 types** from the `AnimNextChooser` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RigUnit_EvaluateChooser`, `RigUnit_EvaluateChooser_AnimNext`, `RigUnit_EvaluateChooser_ControlRig`, `RigUnit_OwningObject`

---

## Classes

### `unreal.RigUnit_EvaluateChooser`
Inherits: `RigVMStruct` | Header: `RigUnit_EvaluateChooser.h`

Evaluates a Chooser Table and outputs the selected UObject

**Properties** (3):
  - `chooser`: `ChooserTable` — [Read-Write] (ChooserTable)
  - `context_object`: `Object` — [Read-Write] (Object)
  - `result`: `Object` [Read-Only] — [Read-Only] (Object)

### `unreal.RigUnit_EvaluateChooser_AnimNext`
Inherits: `RigUnit_EvaluateChooser` | Header: `RigUnit_EvaluateChooser.h`

Evaluates a Chooser Table in the context of AnimNext deprecated in favor of RigVMDispatch_EvaluateChooser

### `unreal.RigUnit_EvaluateChooser_ControlRig`
Inherits: `RigUnit_EvaluateChooser` | Header: `RigUnit_EvaluateChooser.h`

Evaluates a Chooser Table in the context of ControlRig deprecated in favor of RigVMDispatch_EvaluateChooser

### `unreal.RigUnit_OwningObject`
Inherits: `RigVMStruct` | Header: `RigUnit_OwningObject.h`

Rig Unit Owning Object

**Properties** (1):
  - `result`: `Object` [Read-Only] — [Read-Only] (Object)
