# UE Python API — LiveLinkControlRig Module

**7 types** from the `LiveLinkControlRig` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RigUnit_LiveLinkBase`, `RigUnit_LiveLinkEvaluateBasicValue`, `RigUnit_LiveLinkEvaluateInputDeviceValue`, `RigUnit_LiveLinkEvaluteFrameAnimation`, `RigUnit_LiveLinkEvaluteFrameTransform`, `RigUnit_LiveLinkGetParameterValueByName`, `RigUnit_LiveLinkGetTransformByName`

---

## Classes

### `unreal.RigUnit_LiveLinkBase`
Inherits: `RigUnit` | Header: `LiveLinkRigUnits.h`

Rig Unit Live Link Base

### `unreal.RigUnit_LiveLinkEvaluateBasicValue`
Inherits: `RigUnit_LiveLinkBase` | Header: `LiveLinkRigUnits.h`

Evaluate current Live Link Basic float property data associated with supplied subject

**Properties** (3):
  - `property_name`: `Name` — [Read-Write] (Name)
  - `subject_name`: `Name` — [Read-Write] (Name)
  - `value`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigUnit_LiveLinkEvaluateInputDeviceValue`
Inherits: `RigUnit` | Header: `LiveLinkInputDeviceRigUnits.h`

Rig Unit Live Link Evaluate Input Device Value

**Properties** (2):
  - `input_device_data`: `LiveLinkGamepadInputDeviceFrameData` [Read-Only] — [Read-Only] Gampad device data for the current frame. (LiveLinkGamepadInputDeviceFrameData)
  - `subject_name`: `Name` — [Read-Write] Name of the subject we would like to get Live Link device data. This should be the subj...

### `unreal.RigUnit_LiveLinkEvaluteFrameAnimation`
Inherits: `RigUnit_LiveLinkBase` | Header: `LiveLinkRigUnits.h`

Evaluate current Live Link Animation associated with supplied subject

**Properties** (5):
  - `debug_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `debug_draw_offset`: `Transform` — [Read-Write] (Transform)
  - `draw_debug`: `bool` — [Read-Write] (bool)
  - `subject_frame`: `SubjectFrameHandle` [Read-Only] — [Read-Only] (SubjectFrameHandle)
  - `subject_name`: `Name` — [Read-Write] (Name)

### `unreal.RigUnit_LiveLinkEvaluteFrameTransform`
Inherits: `RigUnit_LiveLinkBase` | Header: `LiveLinkRigUnits.h`

Evaluate current Live Link Transform associated with supplied subject

**Properties** (5):
  - `debug_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `debug_draw_offset`: `Transform` — [Read-Write] (Transform)
  - `draw_debug`: `bool` — [Read-Write] (bool)
  - `subject_name`: `Name` — [Read-Write] (Name)
  - `transform`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.RigUnit_LiveLinkGetParameterValueByName`
Inherits: `RigUnit_LiveLinkBase` | Header: `LiveLinkRigUnits.h`

Get the parameter value with supplied subject frame

**Properties** (3):
  - `parameter_name`: `Name` — [Read-Write] (Name)
  - `subject_frame`: `SubjectFrameHandle` — [Read-Write] (SubjectFrameHandle)
  - `value`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigUnit_LiveLinkGetTransformByName`
Inherits: `RigUnit_LiveLinkBase` | Header: `LiveLinkRigUnits.h`

Get the transform value with supplied subject frame

**Properties** (4):
  - `space`: `RigVMTransformSpace` — [Read-Write] (RigVMTransformSpace)
  - `subject_frame`: `SubjectFrameHandle` — [Read-Write] (SubjectFrameHandle)
  - `transform`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `transform_name`: `Name` — [Read-Write] (Name)
