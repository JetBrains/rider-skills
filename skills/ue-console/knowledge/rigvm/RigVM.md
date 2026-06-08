# UE Python API — RigVM Module

**489 types** from the `RigVM` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MathRBFInterpolateQuatColor_Target`, `MathRBFInterpolateQuatFloat_Target`, `MathRBFInterpolateQuatQuat_Target`, `MathRBFInterpolateQuatVector_Target`, `MathRBFInterpolateQuatXform_Target`, `MathRBFInterpolateVectorColor_Target`, `MathRBFInterpolateVectorFloat_Target`, `MathRBFInterpolateVectorQuat_Target`, `MathRBFInterpolateVectorVector_Target`, `MathRBFInterpolateVectorXform_Target`, `RigVMByteCodeStatistics`, `RigVMDebugDrawSettings`, `RigVMDispatchFactory`, `RigVMDrawContainer`, `RigVMDrawInstruction`, `RigVMExecuteContext`, `RigVMExecutePin`, `RigVMExtendedExecuteContext`, `RigVMExternalVariable`, `RigVMExternalVariableDef`, ... (489 total)

---

## Classes

### `unreal.MathRBFInterpolateQuatColor_Target`
Inherits: `StructBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Math RBFInterpolate Quat Color Target

**Properties** (2):
  - `target`: `Quat` — [Read-Write] (Quat)
  - `value`: `LinearColor` — [Read-Write] (LinearColor)

### `unreal.MathRBFInterpolateQuatFloat_Target`
Inherits: `StructBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Quat -> T

**Properties** (2):
  - `target`: `Quat` — [Read-Write] (Quat)
  - `value`: `float` — [Read-Write] (float)

### `unreal.MathRBFInterpolateQuatQuat_Target`
Inherits: `StructBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Math RBFInterpolate Quat Quat Target

**Properties** (2):
  - `target`: `Quat` — [Read-Write] (Quat)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.MathRBFInterpolateQuatVector_Target`
Inherits: `StructBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Math RBFInterpolate Quat Vector Target

**Properties** (2):
  - `target`: `Quat` — [Read-Write] (Quat)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.MathRBFInterpolateQuatXform_Target`
Inherits: `StructBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Math RBFInterpolate Quat Xform Target

**Properties** (2):
  - `target`: `Quat` — [Read-Write] (Quat)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.MathRBFInterpolateVectorColor_Target`
Inherits: `StructBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Math RBFInterpolate Vector Color Target

**Properties** (2):
  - `target`: `Vector` — [Read-Write] (Vector)
  - `value`: `LinearColor` — [Read-Write] (LinearColor)

### `unreal.MathRBFInterpolateVectorFloat_Target`
Inherits: `StructBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Vector->T

**Properties** (2):
  - `target`: `Vector` — [Read-Write] (Vector)
  - `value`: `float` — [Read-Write] (float)

### `unreal.MathRBFInterpolateVectorQuat_Target`
Inherits: `StructBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Math RBFInterpolate Vector Quat Target

**Properties** (2):
  - `target`: `Vector` — [Read-Write] (Vector)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.MathRBFInterpolateVectorVector_Target`
Inherits: `StructBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Math RBFInterpolate Vector Vector Target

**Properties** (2):
  - `target`: `Vector` — [Read-Write] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.MathRBFInterpolateVectorXform_Target`
Inherits: `StructBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Math RBFInterpolate Vector Xform Target

**Properties** (2):
  - `target`: `Vector` — [Read-Write] (Vector)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMByteCodeStatistics`
Inherits: `StructBase` | Header: `RigVMStatistics.h`

Rig VMByte Code Statistics

**Properties** (2):
  - `data_bytes`: `int` [Read-Only] — [Read-Only] (int32)
  - `instruction_count`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.RigVMDebugDrawSettings`
Inherits: `StructBase` | Header: `RigVMDebugDrawSettings.h`

Rig VMDebug Draw Settings

**Properties** (2):
  - `depth_priority`: `SceneDepthPriorityGroup` — [Read-Write] (SceneDepthPriorityGroup)
  - `lifetime`: `float` — [Read-Write] (float)

### `unreal.RigVMDispatchFactory`
Inherits: `StructBase` | Header: `RigVMDispatchFactory.h`

A factory to generate a template and its dispatch functions

### `unreal.RigVMDrawContainer`
Inherits: `StructBase` | Header: `RigVMDrawContainer.h`

Rig VMDraw Container

### `unreal.RigVMDrawInstruction`
Inherits: `StructBase` | Header: `RigVMDrawInstruction.h`

Rig VMDraw Instruction

### `unreal.RigVMExecuteContext`
Inherits: `RigVMExecutePin` | Header: `RigVMExecuteContext.h`

The execute context is used for mutable nodes to indicate execution order.

### `unreal.RigVMExecutePin`
Inherits: `StructBase` | Header: `RigVMExecuteContext.h`

This structure is used for semantically describing a pin on a RigVMStruct - but without any content. So rather than adding an actual FRigVMExecuteContext this can be added as the type for a pin and it...

### `unreal.RigVMExtendedExecuteContext`
Inherits: `StructBase` | Header: `RigVMExecuteContext.h`

The execute context is used for mutable nodes to indicate execution order.

**Properties** (2):
  - `debug_memory_storage_object`: `RigVMMemoryStorage` — [Read-Write] Deprecated 5.4
deprecated: Please, use DebugMemoryStorage (RigVMMemoryStorage)
  - `work_memory_storage_object`: `RigVMMemoryStorage` — [Read-Write] Deprecated 5.4
deprecated: Please, use WorkMemoryStorage (RigVMMemoryStorage)

### `unreal.RigVMExternalVariable`
Inherits: `RigVMExternalVariableDef` | Header: `RigVMExternalVariable.h`

Rig VMExternal Variable

### `unreal.RigVMExternalVariableDef`
Inherits: `StructBase` | Header: `RigVMExternalVariable.h`

The external variable can be used to map external / unowned memory into the VM and back out

### `unreal.RigVMFourPointBezier`
Inherits: `StructBase` | Header: `RigVMMathLibrary.h`

Rig VMFour Point Bezier

### `unreal.RigVMFunction_AccumulateBase`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_Accumulate.h`

Rig VMFunction Accumulate Base

### `unreal.RigVMFunction_AccumulateFloatAdd`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Adds a value over time over and over again

**Properties** (4):
  - `increment`: `float` — [Read-Write] (float)
  - `initial_value`: `float` — [Read-Write] (float)
  - `integrate_delta_time`: `bool` — [Read-Write] (bool)
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_AccumulateFloatLerp`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Interpolates two values over time over and over again

**Properties** (5):
  - `blend`: `float` — [Read-Write] (float)
  - `initial_value`: `float` — [Read-Write] (float)
  - `integrate_delta_time`: `bool` — [Read-Write] (bool)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `target_value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_AccumulateFloatMul`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Multiplies a value over time over and over again

**Properties** (4):
  - `initial_value`: `float` — [Read-Write] (float)
  - `integrate_delta_time`: `bool` — [Read-Write] (bool)
  - `multiplier`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_AccumulateFloatRange`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Accumulates the min and max values over time

**Properties** (3):
  - `maximum`: `float` [Read-Only] — [Read-Only] (float)
  - `minimum`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_AccumulateQuatLerp`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Interpolates two quaternions over time over and over again

**Properties** (5):
  - `blend`: `float` — [Read-Write] (float)
  - `initial_value`: `Quat` — [Read-Write] (Quat)
  - `integrate_delta_time`: `bool` — [Read-Write] (bool)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `target_value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_AccumulateQuatMul`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Multiplies a quaternion over time over and over again

**Properties** (5):
  - `flip_order`: `bool` — [Read-Write] (bool)
  - `initial_value`: `Quat` — [Read-Write] (Quat)
  - `integrate_delta_time`: `bool` — [Read-Write] (bool)
  - `multiplier`: `Quat` — [Read-Write] (Quat)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)

### `unreal.RigVMFunction_AccumulateTransformLerp`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Interpolates two transforms over time over and over again

**Properties** (5):
  - `blend`: `float` — [Read-Write] (float)
  - `initial_value`: `Transform` — [Read-Write] (Transform)
  - `integrate_delta_time`: `bool` — [Read-Write] (bool)
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `target_value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_AccumulateTransformMul`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Multiplies a transform over time over and over again

**Properties** (5):
  - `flip_order`: `bool` — [Read-Write] (bool)
  - `initial_value`: `Transform` — [Read-Write] (Transform)
  - `integrate_delta_time`: `bool` — [Read-Write] (bool)
  - `multiplier`: `Transform` — [Read-Write] (Transform)
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.RigVMFunction_AccumulateVectorAdd`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Adds a vector over time over and over again

**Properties** (4):
  - `increment`: `Vector` — [Read-Write] (Vector)
  - `initial_value`: `Vector` — [Read-Write] (Vector)
  - `integrate_delta_time`: `bool` — [Read-Write] (bool)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_AccumulateVectorLerp`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Interpolates two vectors over time over and over again

**Properties** (5):
  - `blend`: `float` — [Read-Write] (float)
  - `initial_value`: `Vector` — [Read-Write] (Vector)
  - `integrate_delta_time`: `bool` — [Read-Write] (bool)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `target_value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_AccumulateVectorMul`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Multiplies a vector over time over and over again

**Properties** (4):
  - `initial_value`: `Vector` — [Read-Write] (Vector)
  - `integrate_delta_time`: `bool` — [Read-Write] (bool)
  - `multiplier`: `Vector` — [Read-Write] (Vector)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_AccumulateVectorRange`
Inherits: `RigVMFunction_AccumulateBase` | Header: `RigVMFunction_Accumulate.h`

Accumulates the min and max values over time

**Properties** (3):
  - `maximum`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `minimum`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_AlphaInterp`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_AlphaInterp.h`

Takes in a float value and outputs an accumulated value with a customized scale and clamp

**Properties** (13):
  - `bias`: `float` — [Read-Write] (float)
  - `clamp_max`: `float` — [Read-Write] (float)
  - `clamp_min`: `float` — [Read-Write] (float)
  - `clamp_result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `interp_result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `interp_speed_decreasing`: `float` — [Read-Write] (float)
  - `interp_speed_increasing`: `float` — [Read-Write] (float)
  - `map_range`: `bool` [Read-Only] — [Read-Only] (bool)
  - `out_range`: `InputRange` — [Read-Write] (InputRange)
  - `range`: `InputRange` — [Read-Write] (InputRange)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `scale`: `float` — [Read-Write] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_AlphaInterpQuat`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_AlphaInterp.h`

Takes in a vector value and outputs an accumulated value with a customized scale and clamp

**Properties** (13):
  - `bias`: `float` — [Read-Write] (float)
  - `clamp_max`: `float` — [Read-Write] (float)
  - `clamp_min`: `float` — [Read-Write] (float)
  - `clamp_result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `interp_result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `interp_speed_decreasing`: `float` — [Read-Write] (float)
  - `interp_speed_increasing`: `float` — [Read-Write] (float)
  - `map_range`: `bool` [Read-Only] — [Read-Only] (bool)
  - `out_range`: `InputRange` — [Read-Write] (InputRange)
  - `range`: `InputRange` — [Read-Write] (InputRange)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `scale`: `float` — [Read-Write] (float)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_AlphaInterpVector`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_AlphaInterp.h`

Takes in a vector value and outputs an accumulated value with a customized scale and clamp

**Properties** (13):
  - `bias`: `float` — [Read-Write] (float)
  - `clamp_max`: `float` — [Read-Write] (float)
  - `clamp_min`: `float` — [Read-Write] (float)
  - `clamp_result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `interp_result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `interp_speed_decreasing`: `float` — [Read-Write] (float)
  - `interp_speed_increasing`: `float` — [Read-Write] (float)
  - `map_range`: `bool` [Read-Only] — [Read-Only] (bool)
  - `out_range`: `InputRange` — [Read-Write] (InputRange)
  - `range`: `InputRange` — [Read-Write] (InputRange)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `scale`: `float` — [Read-Write] (float)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_AnimBase`
Inherits: `RigVMStruct` | Header: `RigVMFunction_AnimBase.h`

Rig VMFunction Anim Base

### `unreal.RigVMFunction_AnimEasing`
Inherits: `RigVMFunction_AnimBase` | Header: `RigVMFunction_AnimEasing.h`

Returns the eased version of the input value

**Properties** (7):
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `source_maximum`: `float` — [Read-Write] (float)
  - `source_minimum`: `float` — [Read-Write] (float)
  - `target_maximum`: `float` — [Read-Write] (float)
  - `target_minimum`: `float` — [Read-Write] (float)
  - `type`: `RigVMAnimEasingType` — [Read-Write] (RigVMAnimEasingType)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_AnimEasingType`
Inherits: `RigVMFunction_AnimBase` | Header: `RigVMFunction_AnimEasing.h`

A constant value of an easing type

**Properties** (1):
  - `type`: `RigVMAnimEasingType` — [Read-Write] (RigVMAnimEasingType)

### `unreal.RigVMFunction_AnimEvalRichCurve`
Inherits: `RigVMFunction_AnimBase` | Header: `RigVMFunction_AnimEvalRichCurve.h`

Evaluates the provided curve. Values are normalized between 0 and 1

**Properties** (7):
  - `curve`: `RuntimeFloatCurve` — [Read-Write] (RuntimeFloatCurve)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `source_maximum`: `float` — [Read-Write] (float)
  - `source_minimum`: `float` — [Read-Write] (float)
  - `target_maximum`: `float` — [Read-Write] (float)
  - `target_minimum`: `float` — [Read-Write] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_AnimRichCurve`
Inherits: `RigVMFunction_AnimBase` | Header: `RigVMFunction_AnimRichCurve.h`

Provides a constant curve to be used for multiple curve evaluations

**Properties** (1):
  - `curve`: `RuntimeFloatCurve` [Read-Only] — [Read-Only] (RuntimeFloatCurve)

### `unreal.RigVMFunction_Contains`
Inherits: `RigVMFunction_NameBase` | Header: `RigVMFunction_Name.h`

Returns true or false if a given name exists in another given name

**Properties** (3):
  - `name`: `Name` — [Read-Write] (Name)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `search`: `Name` — [Read-Write] (Name)

### `unreal.RigVMFunction_ControlFlowBase`
Inherits: `RigVMStruct` | Header: `RigVMFunction_ControlFlow.h`

Rig VMFunction Control Flow Base

### `unreal.RigVMFunction_ControlFlowBranch`
Inherits: `RigVMFunction_ControlFlowBase` | Header: `RigVMFunction_ControlFlow.h`

Executes either the True or False branch based on the condition

**Properties** (5):
  - `completed`: `RigVMExecuteContext` [Read-Only] — [Read-Only] (RigVMExecuteContext)
  - `condition`: `bool` — [Read-Write] (bool)
  - `execute_context`: `RigVMExecuteContext` — [Read-Write] (RigVMExecuteContext)
  - `false`: `RigVMExecuteContext` [Read-Only] — [Read-Only] (RigVMExecuteContext)
  - `true`: `RigVMExecuteContext` [Read-Only] — [Read-Only] (RigVMExecuteContext)

### `unreal.RigVMFunction_DebugArc`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigVMFunction_DebugPrimitives.h`

Rig VMFunction Debug Arc

**Properties** (10):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `detail`: `int` — [Read-Write] (int32)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `maximum_degrees`: `float` — [Read-Write] (float)
  - `minimum_degrees`: `float` — [Read-Write] (float)
  - `radius`: `float` — [Read-Write] (float)
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DebugArcNoSpace`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigVMFunction_DebugPrimitives.h`

Draws an arc in the viewport, can take in different min and max degrees

**Properties** (9):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `detail`: `int` — [Read-Write] (int32)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `maximum_degrees`: `float` — [Read-Write] (float)
  - `minimum_degrees`: `float` — [Read-Write] (float)
  - `radius`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DebugBase`
Inherits: `RigVMStruct` | Header: `RigVMFunction_DebugBase.h`

Rig VMFunction Debug Base

**Properties** (1):
  - `debug_draw_settings`: `RigVMDebugDrawSettings` — [Read-Write] (RigVMDebugDrawSettings)

### `unreal.RigVMFunction_DebugBaseMutable`
Inherits: `RigVMStructMutable` | Header: `RigVMFunction_DebugBase.h`

Rig VMFunction Debug Base Mutable

**Properties** (1):
  - `debug_draw_settings`: `RigVMDebugDrawSettings` — [Read-Write] (RigVMDebugDrawSettings)

### `unreal.RigVMFunction_DebugBoxNoSpace`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigVMFunction_DebugPrimitives.h`

Draws a box in the viewport

**Properties** (5):
  - `box`: `Box` — [Read-Write] (Box)
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `thickness`: `float` — [Read-Write] (float)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DebugLineNoSpace`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigVMFunction_DebugLine.h`

Draws a line in the viewport given a start and end vector

**Properties** (6):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `thickness`: `float` — [Read-Write] (float)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DebugLineStripNoSpace`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigVMFunction_DebugLineStrip.h`

Draws a line strip in the viewport given any number of points

**Properties** (5):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `points`: `None` — [Read-Write] (Array[Vector])
  - `thickness`: `float` — [Read-Write] (float)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DebugPoint`
Inherits: `RigVMFunction_DebugBase` | Header: `RigVMFunction_DebugPoint.h`

Rig VMFunction Debug Point

**Properties** (8):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `mode`: `RigUnitDebugPointMode` — [Read-Write] (RigUnitDebugPointMode)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `vector`: `Vector` — [Read-Write] (Vector)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DebugPointMutable`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigVMFunction_DebugPoint.h`

Rig VMFunction Debug Point Mutable

**Properties** (8):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `mode`: `RigUnitDebugPointMode` — [Read-Write] (RigUnitDebugPointMode)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `vector`: `Vector` — [Read-Write] (Vector)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DebugRectangle`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigVMFunction_DebugPrimitives.h`

Rig VMFunction Debug Rectangle

**Properties** (7):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DebugRectangleNoSpace`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigVMFunction_DebugPrimitives.h`

Draws a rectangle in the viewport given a transform

**Properties** (6):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DebugTransformArrayMutableNoSpace`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigVMFunction_DebugTransform.h`

Given a transform array, will draw a point, axis, or a box in the viewport

**Properties** (8):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `mode`: `RigUnitDebugTransformMode` — [Read-Write] (RigUnitDebugTransformMode)
  - `parent_indices`: `None` — [Read-Write] (Array[int32])
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `transforms`: `None` — [Read-Write] (Array[Transform])
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DebugTransformMutableNoSpace`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigVMFunction_DebugTransform.h`

Given a transform, will draw a point, axis, or a box in the viewport

**Properties** (7):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `mode`: `RigUnitDebugTransformMode` — [Read-Write] (RigUnitDebugTransformMode)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DeltaFromPreviousFloat`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_DeltaFromPrevious.h`

Computes the difference from the previous value going through the node

**Properties** (3):
  - `delta`: `float` [Read-Only] — [Read-Only] (float)
  - `previous_value`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_DeltaFromPreviousQuat`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_DeltaFromPrevious.h`

Computes the difference from the previous value going through the node

**Properties** (3):
  - `delta`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `previous_value`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_DeltaFromPreviousTransform`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_DeltaFromPrevious.h`

Computes the difference from the previous value going through the node

**Properties** (3):
  - `delta`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `previous_value`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_DeltaFromPreviousVector`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_DeltaFromPrevious.h`

Computes the difference from the previous value going through the node

**Properties** (3):
  - `delta`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `previous_value`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_EndsWith`
Inherits: `RigVMFunction_NameBase` | Header: `RigVMFunction_Name.h`

Tests whether this string ends with given string

**Properties** (3):
  - `ending`: `Name` — [Read-Write] (Name)
  - `name`: `Name` — [Read-Write] (Name)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_ForLoopCount`
Inherits: `RigVMStructMutable` | Header: `RigVMFunction_ForLoop.h`

Given a count, execute iteratively until the count is up

**Properties** (4):
  - `completed`: `RigVMExecuteContext` [Read-Only] — [Read-Only] (RigVMExecuteContext)
  - `count`: `int` — [Read-Write] (int32)
  - `index`: `int` [Read-Only] — [Read-Only] (int32)
  - `ratio`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_FramesToSeconds`
Inherits: `RigVMFunction_AnimBase` | Header: `RigVMFunction_TimeConversion.h`

Converts frames to seconds based on the current frame rate

**Properties** (2):
  - `frames`: `float` — [Read-Write] (float)
  - `seconds`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_GetDeltaTime`
Inherits: `RigVMFunction_AnimBase` | Header: `RigVMFunction_GetDeltaTime.h`

Returns the time gone by from the previous evaluation

**Properties** (1):
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_GetWorldTime`
Inherits: `RigVMFunction_AnimBase` | Header: `RigVMFunction_GetWorldTime.h`

Returns the current time (year, month, day, hour, minute)

**Properties** (8):
  - `day`: `float` [Read-Only] — [Read-Only] (float)
  - `hours`: `float` [Read-Only] — [Read-Only] (float)
  - `minutes`: `float` [Read-Only] — [Read-Only] (float)
  - `month`: `float` [Read-Only] — [Read-Only] (float)
  - `overall_seconds`: `float` [Read-Only] — [Read-Only] (float)
  - `seconds`: `float` [Read-Only] — [Read-Only] (float)
  - `week_day`: `float` [Read-Only] — [Read-Only] (float)
  - `year`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_IsHostBeingDebugged`
Inherits: `RigVMStruct` | Header: `RigVMFunction_Context.h`

Returns true if a graph is run with its asset editor open. This is editor only - in shipping it always returns false.

**Properties** (1):
  - `result`: `bool` [Read-Only] — [Read-Only] True if the graph is currently open in the asset editor (bool)

### `unreal.RigVMFunction_KalmanFloat`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_Kalman.h`

Averages a value over time. This uses a Kalman Filter internally.

**Properties** (3):
  - `buffer_size`: `int` [Read-Only] — [Read-Only] (int32)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_KalmanTransform`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_Kalman.h`

Averages a transform over time. This uses a Kalman Filter internally.

**Properties** (3):
  - `buffer_size`: `int` [Read-Only] — [Read-Only] (int32)
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_KalmanVector`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_Kalman.h`

Averages a value over time. This uses a Kalman Filter internally.

**Properties** (3):
  - `buffer_size`: `int` [Read-Only] — [Read-Only] (int32)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathBase`
Inherits: `RigVMStruct` | Header: `RigVMFunction_MathBase.h`

Rig VMFunction Math Base

### `unreal.RigVMFunction_MathBoolAnd`
Inherits: `RigVMFunction_MathBoolBinaryAggregateOp` | Header: `RigVMFunction_MathBool.h`

Returns true if both conditions are true

### `unreal.RigVMFunction_MathBoolBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathBool.h`

Rig VMFunction Math Bool Base

### `unreal.RigVMFunction_MathBoolBinaryAggregateOp`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

Rig VMFunction Math Bool Binary Aggregate Op

**Properties** (3):
  - `a`: `bool` — [Read-Write] (bool)
  - `b`: `bool` — [Read-Write] (bool)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathBoolBinaryOp`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

Rig VMFunction Math Bool Binary Op

**Properties** (3):
  - `a`: `bool` — [Read-Write] (bool)
  - `b`: `bool` — [Read-Write] (bool)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathBoolConstant`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

Rig VMFunction Math Bool Constant

**Properties** (1):
  - `value`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathBoolConstFalse`
Inherits: `RigVMFunction_MathBoolConstant` | Header: `RigVMFunction_MathBool.h`

Returns false

### `unreal.RigVMFunction_MathBoolConstTrue`
Inherits: `RigVMFunction_MathBoolConstant` | Header: `RigVMFunction_MathBool.h`

Returns true

### `unreal.RigVMFunction_MathBoolEquals`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

Returns true if the value A equals B

**Properties** (3):
  - `a`: `bool` — [Read-Write] (bool)
  - `b`: `bool` — [Read-Write] (bool)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathBoolFlipFlop`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

Returns true and false as a sequence.

**Properties** (3):
  - `duration`: `float` — [Read-Write] The duration in seconds at which the result wonât change.
Use 0 for a different resul...
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `start_value`: `bool` — [Read-Write] The initial value to use for the flag (bool)

### `unreal.RigVMFunction_MathBoolMake`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

A boolean constant

**Properties** (1):
  - `value`: `bool` — [Read-Write] (bool)

### `unreal.RigVMFunction_MathBoolNand`
Inherits: `RigVMFunction_MathBoolBinaryOp` | Header: `RigVMFunction_MathBool.h`

Returns true if both conditions are false

### `unreal.RigVMFunction_MathBoolNand2`
Inherits: `RigVMFunction_MathBoolBinaryOp` | Header: `RigVMFunction_MathBool.h`

Returns false if both conditions are true

### `unreal.RigVMFunction_MathBoolNot`
Inherits: `RigVMFunction_MathBoolUnaryOp` | Header: `RigVMFunction_MathBool.h`

Returns true if the condition is false

### `unreal.RigVMFunction_MathBoolNotEquals`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

Returns true if the value A does not equal B

**Properties** (3):
  - `a`: `bool` — [Read-Write] (bool)
  - `b`: `bool` — [Read-Write] (bool)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathBoolOnce`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

Returns true once the first time this node is hit

**Properties** (2):
  - `duration`: `float` — [Read-Write] The duration in seconds at which the result is true
Use 0 for a different result every ...
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathBoolOr`
Inherits: `RigVMFunction_MathBoolBinaryAggregateOp` | Header: `RigVMFunction_MathBool.h`

Returns true if one of the conditions is true

### `unreal.RigVMFunction_MathBoolToFloat`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

Turns the given bool into a float value

**Properties** (2):
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `bool` — [Read-Write] (bool)

### `unreal.RigVMFunction_MathBoolToggled`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

Returns true if the value has changed from the last run

**Properties** (2):
  - `toggled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `value`: `bool` — [Read-Write] (bool)

### `unreal.RigVMFunction_MathBoolToInteger`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

Turns the given bool into an integer value

**Properties** (2):
  - `result`: `int` [Read-Only] — [Read-Only] (int32)
  - `value`: `bool` — [Read-Write] (bool)

### `unreal.RigVMFunction_MathBoolUnaryOp`
Inherits: `RigVMFunction_MathBoolBase` | Header: `RigVMFunction_MathBool.h`

Rig VMFunction Math Bool Unary Op

**Properties** (2):
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `value`: `bool` — [Read-Write] (bool)

### `unreal.RigVMFunction_MathBoxBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathBox.h`

Rig VMFunction Math Box Base

### `unreal.RigVMFunction_MathBoxExpand`
Inherits: `RigVMFunction_MathBoxBase` | Header: `RigVMFunction_MathBox.h`

Expands the size of the box by a given amount

**Properties** (3):
  - `amount`: `Vector` — [Read-Write] the amount to grow / shrink the box by (Vector)
  - `box`: `Box` — [Read-Write] (Box)
  - `result`: `Box` [Read-Only] — [Read-Only] (Box)

### `unreal.RigVMFunction_MathBoxFromArray`
Inherits: `RigVMFunction_MathBoxBase` | Header: `RigVMFunction_MathBox.h`

Returns bounding box of the given array of positions

**Properties** (6):
  - `array`: `None` — [Read-Write] (Array[Vector])
  - `box`: `Box` [Read-Only] — [Read-Only] (Box)
  - `center`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `maximum`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `minimum`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `size`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathBoxGetCenter`
Inherits: `RigVMFunction_MathBoxBase` | Header: `RigVMFunction_MathBox.h`

Returns the center of a bounding box

**Properties** (2):
  - `box`: `Box` — [Read-Write] (Box)
  - `center`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathBoxGetDistance`
Inherits: `RigVMFunction_MathBoxBase` | Header: `RigVMFunction_MathBox.h`

Returns the distance to a given box

**Properties** (5):
  - `box`: `Box` — [Read-Write] (Box)
  - `distance`: `float` [Read-Only] — [Read-Only] (float)
  - `position`: `Vector` — [Read-Write] (Vector)
  - `square`: `bool` — [Read-Write] if true the distance will be returned square (bool)
  - `valid`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathBoxGetSize`
Inherits: `RigVMFunction_MathBoxBase` | Header: `RigVMFunction_MathBox.h`

Returns the size of a bounding box

**Properties** (3):
  - `box`: `Box` — [Read-Write] (Box)
  - `extent`: `Vector` [Read-Only] — [Read-Only] the half size of the box (Vector)
  - `size`: `Vector` [Read-Only] — [Read-Only] the overall size of the box (Vector)

### `unreal.RigVMFunction_MathBoxGetVolume`
Inherits: `RigVMFunction_MathBoxBase` | Header: `RigVMFunction_MathBox.h`

Returns the volume of a given box

**Properties** (2):
  - `box`: `Box` — [Read-Write] (Box)
  - `volume`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathBoxIsInside`
Inherits: `RigVMFunction_MathBoxBase` | Header: `RigVMFunction_MathBox.h`

Returns true if a point is inside a given box

**Properties** (3):
  - `box`: `Box` — [Read-Write] (Box)
  - `position`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathBoxIsValid`
Inherits: `RigVMFunction_MathBoxBase` | Header: `RigVMFunction_MathBox.h`

Returns true if the box has any content / is valid

**Properties** (2):
  - `box`: `Box` — [Read-Write] (Box)
  - `valid`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathBoxMoveTo`
Inherits: `RigVMFunction_MathBoxBase` | Header: `RigVMFunction_MathBox.h`

Moves the center of the box to a new location

**Properties** (3):
  - `box`: `Box` — [Read-Write] (Box)
  - `center`: `Vector` — [Read-Write] the new center for the box (Vector)
  - `result`: `Box` [Read-Only] — [Read-Only] (Box)

### `unreal.RigVMFunction_MathBoxShift`
Inherits: `RigVMFunction_MathBoxBase` | Header: `RigVMFunction_MathBox.h`

Move the box by a certain amount

**Properties** (3):
  - `amount`: `Vector` — [Read-Write] the amount / vector to shift the box by (Vector)
  - `box`: `Box` — [Read-Write] (Box)
  - `result`: `Box` [Read-Only] — [Read-Only] (Box)

### `unreal.RigVMFunction_MathBoxTransform`
Inherits: `RigVMFunction_MathBoxBase` | Header: `RigVMFunction_MathBox.h`

Transforms the box by a given transform

**Properties** (3):
  - `box`: `Box` — [Read-Write] (Box)
  - `result`: `Box` [Read-Only] — [Read-Only] (Box)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathColorAdd`
Inherits: `RigVMFunction_MathColorBinaryAggregateOp` | Header: `RigVMFunction_MathColor.h`

Returns the sum of the two values

### `unreal.RigVMFunction_MathColorBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathColor.h`

Rig VMFunction Math Color Base

### `unreal.RigVMFunction_MathColorBinaryAggregateOp`
Inherits: `RigVMFunction_MathColorBase` | Header: `RigVMFunction_MathColor.h`

Rig VMFunction Math Color Binary Aggregate Op

**Properties** (3):
  - `a`: `LinearColor` — [Read-Write] (LinearColor)
  - `b`: `LinearColor` — [Read-Write] (LinearColor)
  - `result`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)

### `unreal.RigVMFunction_MathColorBinaryOp`
Inherits: `RigVMFunction_MathColorBase` | Header: `RigVMFunction_MathColor.h`

Rig VMFunction Math Color Binary Op

**Properties** (3):
  - `a`: `LinearColor` — [Read-Write] (LinearColor)
  - `b`: `LinearColor` — [Read-Write] (LinearColor)
  - `result`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)

### `unreal.RigVMFunction_MathColorFromDouble`
Inherits: `RigVMFunction_MathColorBase` | Header: `RigVMFunction_MathColor.h`

Makes a vector from a single double

**Properties** (2):
  - `result`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathColorFromFloat`
Inherits: `RigVMFunction_MathColorBase` | Header: `RigVMFunction_MathColor.h`

Makes a vector from a single float

**Properties** (2):
  - `result`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathColorLerp`
Inherits: `RigVMFunction_MathColorBase` | Header: `RigVMFunction_MathColor.h`

Linearly interpolates between A and B using the ratio T

**Properties** (4):
  - `a`: `LinearColor` — [Read-Write] (LinearColor)
  - `b`: `LinearColor` — [Read-Write] (LinearColor)
  - `result`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)
  - `t`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathColorMake`
Inherits: `RigVMFunction_MathColorBase` | Header: `RigVMFunction_MathColor.h`

Makes a color from its components

**Properties** (5):
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `g`: `float` — [Read-Write] (float)
  - `r`: `float` — [Read-Write] (float)
  - `result`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)

### `unreal.RigVMFunction_MathColorMul`
Inherits: `RigVMFunction_MathColorBinaryAggregateOp` | Header: `RigVMFunction_MathColor.h`

Returns the product of the two values

### `unreal.RigVMFunction_MathColorSub`
Inherits: `RigVMFunction_MathColorBinaryOp` | Header: `RigVMFunction_MathColor.h`

Returns the difference of the two values

### `unreal.RigVMFunction_MathDistanceToPlane`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Find the point on the plane that is closest to the given point and the distance between them.

**Properties** (5):
  - `closest_point_on_plane`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `plane_normal`: `Vector` — [Read-Write] (Vector)
  - `plane_point`: `Vector` — [Read-Write] (Vector)
  - `point`: `Vector` — [Read-Write] (Vector)
  - `signed_distance`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathDoubleAbs`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the absolute (positive) value

### `unreal.RigVMFunction_MathDoubleAcos`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the inverse cosinus value (in radians) of the given value

### `unreal.RigVMFunction_MathDoubleAdd`
Inherits: `RigVMFunction_MathDoubleBinaryAggregateOp` | Header: `RigVMFunction_MathDouble.h`

Returns the sum of the two values

### `unreal.RigVMFunction_MathDoubleArrayAverage`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns the average of the given array

**Properties** (2):
  - `array`: `None` — [Read-Write] (Array[double])
  - `average`: `float` [Read-Only] — [Read-Only] (double)

### `unreal.RigVMFunction_MathDoubleArraySum`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns the sum of the given array

**Properties** (2):
  - `array`: `None` — [Read-Write] (Array[double])
  - `sum`: `float` [Read-Only] — [Read-Only] (double)

### `unreal.RigVMFunction_MathDoubleAsin`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the inverse sinus value (in radians) of the given value

### `unreal.RigVMFunction_MathDoubleAtan`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the inverse tangens value (in radians) of the given value

### `unreal.RigVMFunction_MathDoubleAtan2`
Inherits: `RigVMFunction_MathDoubleBinaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the arctangent of the specified A and B coordinates.

### `unreal.RigVMFunction_MathDoubleBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathDouble.h`

Rig VMFunction Math Double Base

### `unreal.RigVMFunction_MathDoubleBinaryAggregateOp`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Rig VMFunction Math Double Binary Aggregate Op

**Properties** (3):
  - `a`: `float` — [Read-Write] (double)
  - `b`: `float` — [Read-Write] (double)
  - `result`: `float` [Read-Only] — [Read-Only] (double)

### `unreal.RigVMFunction_MathDoubleBinaryOp`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Rig VMFunction Math Double Binary Op

**Properties** (3):
  - `a`: `float` — [Read-Write] (double)
  - `b`: `float` — [Read-Write] (double)
  - `result`: `float` [Read-Only] — [Read-Only] (double)

### `unreal.RigVMFunction_MathDoubleCeil`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns the closest higher full number (integer) of the value

**Properties** (3):
  - `int`: `int` [Read-Only] — [Read-Only] (int32)
  - `result`: `float` [Read-Only] — [Read-Only] (double)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathDoubleClamp`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Clamps the given value within the range provided by minimum and maximum

**Properties** (4):
  - `maximum`: `float` — [Read-Write] (double)
  - `minimum`: `float` — [Read-Write] (double)
  - `result`: `float` [Read-Only] — [Read-Only] (double)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathDoubleConstant`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Rig VMFunction Math Double Constant

**Properties** (1):
  - `value`: `float` [Read-Only] — [Read-Only] (double)

### `unreal.RigVMFunction_MathDoubleConstE`
Inherits: `RigVMFunction_MathDoubleConstant` | Header: `RigVMFunction_MathDouble.h`

Returns E

### `unreal.RigVMFunction_MathDoubleConstHalfPi`
Inherits: `RigVMFunction_MathDoubleConstant` | Header: `RigVMFunction_MathDouble.h`

Returns PI * 0.5

### `unreal.RigVMFunction_MathDoubleConstPi`
Inherits: `RigVMFunction_MathDoubleConstant` | Header: `RigVMFunction_MathDouble.h`

Returns PI

### `unreal.RigVMFunction_MathDoubleConstTwoPi`
Inherits: `RigVMFunction_MathDoubleConstant` | Header: `RigVMFunction_MathDouble.h`

Returns PI * 2.0

### `unreal.RigVMFunction_MathDoubleCos`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the cosinus value of the given value (in radians)

### `unreal.RigVMFunction_MathDoubleDeg`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the degrees of a given value in radians

### `unreal.RigVMFunction_MathDoubleDiv`
Inherits: `RigVMFunction_MathDoubleBinaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the division of the two values

### `unreal.RigVMFunction_MathDoubleEquals`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns true if the value A equals B

**Properties** (3):
  - `a`: `float` — [Read-Write] (double)
  - `b`: `float` — [Read-Write] (double)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathDoubleExponential`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Computes the base-e exponential of the given value

### `unreal.RigVMFunction_MathDoubleFloor`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns the closest lower full number (integer) of the value

**Properties** (3):
  - `int`: `int` [Read-Only] — [Read-Only] (int32)
  - `result`: `float` [Read-Only] — [Read-Only] (double)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathDoubleGreater`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns true if the value A is greater than B

**Properties** (3):
  - `a`: `float` — [Read-Write] (double)
  - `b`: `float` — [Read-Write] (double)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathDoubleGreaterEqual`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns true if the value A is greater than or equal to B

**Properties** (3):
  - `a`: `float` — [Read-Write] (double)
  - `b`: `float` — [Read-Write] (double)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathDoubleIsNearlyEqual`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns true if the value A is almost equal to B

**Properties** (4):
  - `a`: `float` — [Read-Write] (double)
  - `b`: `float` — [Read-Write] (double)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `tolerance`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathDoubleIsNearlyZero`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns true if the value is nearly zero

**Properties** (3):
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `tolerance`: `float` — [Read-Write] (double)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathDoubleLawOfCosine`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Computes the angles alpha, beta and gamma (in radians) between the three sides A, B and C

**Properties** (7):
  - `a`: `float` — [Read-Write] (double)
  - `alpha_angle`: `float` [Read-Only] — [Read-Only] (double)
  - `b`: `float` — [Read-Write] (double)
  - `beta_angle`: `float` [Read-Only] — [Read-Only] (double)
  - `c`: `float` — [Read-Write] (double)
  - `gamma_angle`: `float` [Read-Only] — [Read-Only] (double)
  - `valid`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathDoubleLerp`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Linearly interpolates between A and B using the ratio T

**Properties** (4):
  - `a`: `float` — [Read-Write] (double)
  - `b`: `float` — [Read-Write] (double)
  - `result`: `float` [Read-Only] — [Read-Only] (double)
  - `t`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathDoubleLess`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns true if the value A is less than B

**Properties** (3):
  - `a`: `float` — [Read-Write] (double)
  - `b`: `float` — [Read-Write] (double)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathDoubleLessEqual`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns true if the value A is less than or equal to B

**Properties** (3):
  - `a`: `float` — [Read-Write] (double)
  - `b`: `float` — [Read-Write] (double)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathDoubleMake`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

A double constant

**Properties** (1):
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathDoubleMax`
Inherits: `RigVMFunction_MathDoubleBinaryAggregateOp` | Header: `RigVMFunction_MathDouble.h`

Returns the larger of the two values

### `unreal.RigVMFunction_MathDoubleMin`
Inherits: `RigVMFunction_MathDoubleBinaryAggregateOp` | Header: `RigVMFunction_MathDouble.h`

Returns the smaller of the two values

### `unreal.RigVMFunction_MathDoubleMod`
Inherits: `RigVMFunction_MathDoubleBinaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the modulo of the two values

### `unreal.RigVMFunction_MathDoubleMul`
Inherits: `RigVMFunction_MathDoubleBinaryAggregateOp` | Header: `RigVMFunction_MathDouble.h`

Returns the product of the two values

### `unreal.RigVMFunction_MathDoubleNegate`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the negative value

### `unreal.RigVMFunction_MathDoubleNotEquals`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns true if the value A does not equal B

**Properties** (3):
  - `a`: `float` — [Read-Write] (double)
  - `b`: `float` — [Read-Write] (double)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathDoublePow`
Inherits: `RigVMFunction_MathDoubleBinaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the value of A raised to the power of B.

### `unreal.RigVMFunction_MathDoubleRad`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the radians of a given value in degrees

### `unreal.RigVMFunction_MathDoubleRemap`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Remaps the given value from a source range to a target range.

**Properties** (7):
  - `clamp`: `bool` — [Read-Write] If set to true the result is clamped to the target range (bool)
  - `result`: `float` [Read-Only] — [Read-Only] (double)
  - `source_maximum`: `float` — [Read-Write] (double)
  - `source_minimum`: `float` — [Read-Write] (double)
  - `target_maximum`: `float` — [Read-Write] (double)
  - `target_minimum`: `float` — [Read-Write] (double)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathDoubleRound`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns the closest higher full number (integer) of the value

**Properties** (3):
  - `int`: `int` [Read-Only] — [Read-Only] (int32)
  - `result`: `float` [Read-Only] — [Read-Only] (double)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathDoubleSign`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the sign of the value (+1 for >= 0.0, -1 for < 0.0)

### `unreal.RigVMFunction_MathDoubleSin`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the sinus value of the given value (in radians)

### `unreal.RigVMFunction_MathDoubleSqrt`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the square root of the given value

### `unreal.RigVMFunction_MathDoubleSub`
Inherits: `RigVMFunction_MathDoubleBinaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the difference of the two values

### `unreal.RigVMFunction_MathDoubleTan`
Inherits: `RigVMFunction_MathDoubleUnaryOp` | Header: `RigVMFunction_MathDouble.h`

Returns the tangens value of the given value (in radians)

### `unreal.RigVMFunction_MathDoubleToFloat`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns the double cast to a float

**Properties** (2):
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathDoubleToInt`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Returns the double cast to an int (this uses floor)

**Properties** (2):
  - `result`: `int` [Read-Only] — [Read-Only] (int32)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathDoubleUnaryOp`
Inherits: `RigVMFunction_MathDoubleBase` | Header: `RigVMFunction_MathDouble.h`

Rig VMFunction Math Double Unary Op

**Properties** (2):
  - `result`: `float` [Read-Only] — [Read-Only] (double)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathFloatAbs`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the absolute (positive) value

### `unreal.RigVMFunction_MathFloatAcos`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the inverse cosinus value (in radians) of the given value

### `unreal.RigVMFunction_MathFloatAdd`
Inherits: `RigVMFunction_MathFloatBinaryAggregateOp` | Header: `RigVMFunction_MathFloat.h`

Returns the sum of the two values

### `unreal.RigVMFunction_MathFloatArrayAverage`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns the average of the given array

**Properties** (2):
  - `array`: `None` — [Read-Write] (Array[float])
  - `average`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathFloatArraySum`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns the sum of the given array

**Properties** (2):
  - `array`: `None` — [Read-Write] (Array[float])
  - `sum`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathFloatAsin`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the inverse sinus value (in radians) of the given value

### `unreal.RigVMFunction_MathFloatAtan`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the inverse tangens value (in radians) of the given value

### `unreal.RigVMFunction_MathFloatAtan2`
Inherits: `RigVMFunction_MathFloatBinaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the arctangent of the specified A and B coordinates.

### `unreal.RigVMFunction_MathFloatBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathFloat.h`

Rig VMFunction Math Float Base

### `unreal.RigVMFunction_MathFloatBinaryAggregateOp`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Rig VMFunction Math Float Binary Aggregate Op

**Properties** (3):
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathFloatBinaryOp`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Rig VMFunction Math Float Binary Op

**Properties** (3):
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathFloatCeil`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns the closest higher full number (integer) of the value

**Properties** (3):
  - `int`: `int` [Read-Only] — [Read-Only] (int32)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathFloatClamp`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Clamps the given value within the range provided by minimum and maximum

**Properties** (4):
  - `maximum`: `float` — [Read-Write] (float)
  - `minimum`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathFloatConstant`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Rig VMFunction Math Float Constant

**Properties** (1):
  - `value`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathFloatConstE`
Inherits: `RigVMFunction_MathFloatConstant` | Header: `RigVMFunction_MathFloat.h`

Returns E

### `unreal.RigVMFunction_MathFloatConstHalfPi`
Inherits: `RigVMFunction_MathFloatConstant` | Header: `RigVMFunction_MathFloat.h`

Returns PI * 0.5

### `unreal.RigVMFunction_MathFloatConstPi`
Inherits: `RigVMFunction_MathFloatConstant` | Header: `RigVMFunction_MathFloat.h`

Returns PI

### `unreal.RigVMFunction_MathFloatConstTwoPi`
Inherits: `RigVMFunction_MathFloatConstant` | Header: `RigVMFunction_MathFloat.h`

Returns PI * 2.0

### `unreal.RigVMFunction_MathFloatCos`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the cosinus value of the given value (in radians)

### `unreal.RigVMFunction_MathFloatDeg`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the degrees of a given value in radians

### `unreal.RigVMFunction_MathFloatDiv`
Inherits: `RigVMFunction_MathFloatBinaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the division of the two values

### `unreal.RigVMFunction_MathFloatEquals`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns true if the value A equals B

**Properties** (3):
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathFloatExponential`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Computes the base-e exponential of the given value

### `unreal.RigVMFunction_MathFloatGreater`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns true if the value A is greater than B

**Properties** (3):
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathFloatGreaterEqual`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns true if the value A is greater than or equal to B

**Properties** (3):
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathFloatIsNearlyEqual`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns true if the value A is almost equal to B

**Properties** (4):
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `tolerance`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathFloatIsNearlyZero`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns true if the value is nearly zero

**Properties** (3):
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `tolerance`: `float` — [Read-Write] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathFloatLawOfCosine`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Computes the angles alpha, beta and gamma (in radians) between the three sides A, B and C

**Properties** (7):
  - `a`: `float` — [Read-Write] (float)
  - `alpha_angle`: `float` [Read-Only] — [Read-Only] (float)
  - `b`: `float` — [Read-Write] (float)
  - `beta_angle`: `float` [Read-Only] — [Read-Only] (float)
  - `c`: `float` — [Read-Write] (float)
  - `gamma_angle`: `float` [Read-Only] — [Read-Only] (float)
  - `valid`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathFloatLerp`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Linearly interpolates between A and B using the ratio T

**Properties** (4):
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `t`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathFloatLess`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns true if the value A is less than B

**Properties** (3):
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathFloatLessEqual`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns true if the value A is less than or equal to B

**Properties** (3):
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathFloatMake`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

A float constant

**Properties** (1):
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathFloatMax`
Inherits: `RigVMFunction_MathFloatBinaryAggregateOp` | Header: `RigVMFunction_MathFloat.h`

Returns the larger of the two values

### `unreal.RigVMFunction_MathFloatMin`
Inherits: `RigVMFunction_MathFloatBinaryAggregateOp` | Header: `RigVMFunction_MathFloat.h`

Returns the smaller of the two values

### `unreal.RigVMFunction_MathFloatMod`
Inherits: `RigVMFunction_MathFloatBinaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the modulo of the two values

### `unreal.RigVMFunction_MathFloatMul`
Inherits: `RigVMFunction_MathFloatBinaryAggregateOp` | Header: `RigVMFunction_MathFloat.h`

Returns the product of the two values

### `unreal.RigVMFunction_MathFloatNegate`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the negative value

### `unreal.RigVMFunction_MathFloatNotEquals`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns true if the value A does not equal B

**Properties** (3):
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathFloatPow`
Inherits: `RigVMFunction_MathFloatBinaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the value of A raised to the power of B.

### `unreal.RigVMFunction_MathFloatRad`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the radians of a given value in degrees

### `unreal.RigVMFunction_MathFloatRemap`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Remaps the given value from a source range to a target range.

**Properties** (7):
  - `clamp`: `bool` — [Read-Write] If set to true the result is clamped to the target range (bool)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `source_maximum`: `float` — [Read-Write] (float)
  - `source_minimum`: `float` — [Read-Write] (float)
  - `target_maximum`: `float` — [Read-Write] (float)
  - `target_minimum`: `float` — [Read-Write] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathFloatRound`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns the closest higher full number (integer) of the value

**Properties** (3):
  - `int`: `int` [Read-Only] — [Read-Only] (int32)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathFloatSelectBool`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Return one of the two values based on the condition

**Properties** (4):
  - `condition`: `bool` — [Read-Write] (bool)
  - `if_false`: `float` — [Read-Write] (float)
  - `if_true`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathFloatSign`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the sign of the value (+1 for >= 0.f, -1 for < 0.f)

### `unreal.RigVMFunction_MathFloatSin`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the sinus value of the given value (in radians)

### `unreal.RigVMFunction_MathFloatSqrt`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the square root of the given value

### `unreal.RigVMFunction_MathFloatSub`
Inherits: `RigVMFunction_MathFloatBinaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the difference of the two values

### `unreal.RigVMFunction_MathFloatTan`
Inherits: `RigVMFunction_MathFloatUnaryOp` | Header: `RigVMFunction_MathFloat.h`

Returns the tangens value of the given value (in radians)

### `unreal.RigVMFunction_MathFloatToDouble`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns the float cast to a double

**Properties** (2):
  - `result`: `float` [Read-Only] — [Read-Only] (double)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathFloatToInt`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Returns the float cast to an int (this uses floor)

**Properties** (2):
  - `result`: `int` [Read-Only] — [Read-Only] (int32)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathFloatUnaryOp`
Inherits: `RigVMFunction_MathFloatBase` | Header: `RigVMFunction_MathFloat.h`

Rig VMFunction Math Float Unary Op

**Properties** (2):
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathIntAbs`
Inherits: `RigVMFunction_MathIntUnaryOp` | Header: `RigVMFunction_MathInt.h`

Returns the absolute (positive) value

### `unreal.RigVMFunction_MathIntAdd`
Inherits: `RigVMFunction_MathIntBinaryAggregateOp` | Header: `RigVMFunction_MathInt.h`

Returns the sum of the two values

### `unreal.RigVMFunction_MathIntArrayAverage`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Returns the average of the given array

**Properties** (2):
  - `array`: `None` — [Read-Write] (Array[int32])
  - `average`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.RigVMFunction_MathIntArraySum`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Returns the sum of the given array

**Properties** (2):
  - `array`: `None` — [Read-Write] (Array[int32])
  - `sum`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.RigVMFunction_MathIntBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathInt.h`

Rig VMFunction Math Int Base

### `unreal.RigVMFunction_MathIntBinaryAggregateOp`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Rig VMFunction Math Int Binary Aggregate Op

**Properties** (3):
  - `a`: `int` — [Read-Write] (int32)
  - `b`: `int` — [Read-Write] (int32)
  - `result`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.RigVMFunction_MathIntBinaryOp`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Rig VMFunction Math Int Binary Op

**Properties** (3):
  - `a`: `int` — [Read-Write] (int32)
  - `b`: `int` — [Read-Write] (int32)
  - `result`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.RigVMFunction_MathIntClamp`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Clamps the given value within the range provided by minimum and maximum

**Properties** (4):
  - `maximum`: `int` — [Read-Write] (int32)
  - `minimum`: `int` — [Read-Write] (int32)
  - `result`: `int` [Read-Only] — [Read-Only] (int32)
  - `value`: `int` — [Read-Write] (int32)

### `unreal.RigVMFunction_MathIntDiv`
Inherits: `RigVMFunction_MathIntBinaryOp` | Header: `RigVMFunction_MathInt.h`

Returns the division of the two values

### `unreal.RigVMFunction_MathIntEquals`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Returns true if the value A equals B

**Properties** (3):
  - `a`: `int` — [Read-Write] (int32)
  - `b`: `int` — [Read-Write] (int32)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathIntersectPlane`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Intersects a plane with a vector given a start and direction

**Properties** (6):
  - `direction`: `Vector` — [Read-Write] (Vector)
  - `distance`: `float` [Read-Only] — [Read-Only] (float)
  - `plane_normal`: `Vector` — [Read-Write] (Vector)
  - `plane_point`: `Vector` — [Read-Write] (Vector)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `start`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathIntGreater`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Returns true if the value A is greater than B

**Properties** (3):
  - `a`: `int` — [Read-Write] (int32)
  - `b`: `int` — [Read-Write] (int32)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathIntGreaterEqual`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Returns true if the value A is greater than or equal to B

**Properties** (3):
  - `a`: `int` — [Read-Write] (int32)
  - `b`: `int` — [Read-Write] (int32)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathIntLess`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Returns true if the value A is less than B

**Properties** (3):
  - `a`: `int` — [Read-Write] (int32)
  - `b`: `int` — [Read-Write] (int32)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathIntLessEqual`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Returns true if the value A is less than or equal to B

**Properties** (3):
  - `a`: `int` — [Read-Write] (int32)
  - `b`: `int` — [Read-Write] (int32)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathIntMake`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

A integer constant

**Properties** (1):
  - `value`: `int` — [Read-Write] (int32)

### `unreal.RigVMFunction_MathIntMax`
Inherits: `RigVMFunction_MathIntBinaryAggregateOp` | Header: `RigVMFunction_MathInt.h`

Returns the larger of the two values

### `unreal.RigVMFunction_MathIntMin`
Inherits: `RigVMFunction_MathIntBinaryAggregateOp` | Header: `RigVMFunction_MathInt.h`

Returns the smaller of the two values

### `unreal.RigVMFunction_MathIntMod`
Inherits: `RigVMFunction_MathIntBinaryOp` | Header: `RigVMFunction_MathInt.h`

Returns the modulo of the two values

### `unreal.RigVMFunction_MathIntMul`
Inherits: `RigVMFunction_MathIntBinaryAggregateOp` | Header: `RigVMFunction_MathInt.h`

Returns the product of the two values

### `unreal.RigVMFunction_MathIntNegate`
Inherits: `RigVMFunction_MathIntUnaryOp` | Header: `RigVMFunction_MathInt.h`

Returns the negative value

### `unreal.RigVMFunction_MathIntNotEquals`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Returns true if the value A does not equal B

**Properties** (3):
  - `a`: `int` — [Read-Write] (int32)
  - `b`: `int` — [Read-Write] (int32)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathIntPow`
Inherits: `RigVMFunction_MathIntBinaryOp` | Header: `RigVMFunction_MathInt.h`

Returns the value of A raised to the power of B.

### `unreal.RigVMFunction_MathIntSign`
Inherits: `RigVMFunction_MathIntUnaryOp` | Header: `RigVMFunction_MathInt.h`

Returns the sign of the value (+1 for >= 0, -1 for < 0)

### `unreal.RigVMFunction_MathIntSub`
Inherits: `RigVMFunction_MathIntBinaryOp` | Header: `RigVMFunction_MathInt.h`

Returns the difference of the two values

### `unreal.RigVMFunction_MathIntToDouble`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Returns the int cast to a float

**Properties** (2):
  - `result`: `float` [Read-Only] — [Read-Only] (double)
  - `value`: `int` — [Read-Write] (int32)

### `unreal.RigVMFunction_MathIntToFloat`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Returns the int cast to a float

**Properties** (2):
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `int` — [Read-Write] (int32)

### `unreal.RigVMFunction_MathIntToName`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Converts an integer to a name

**Properties** (3):
  - `number`: `int` — [Read-Write] (int32)
  - `padded_size`: `int` — [Read-Write] * For positive numbers you can pad the result to a required with
* so rather than â13...
  - `result`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.RigVMFunction_MathIntToString`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Converts an integer to a string

**Properties** (3):
  - `number`: `int` — [Read-Write] (int32)
  - `padded_size`: `int` — [Read-Write] * For positive numbers you can pad the result to a required with
* so rather than â13...
  - `result`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.RigVMFunction_MathIntUnaryOp`
Inherits: `RigVMFunction_MathIntBase` | Header: `RigVMFunction_MathInt.h`

Rig VMFunction Math Int Unary Op

**Properties** (2):
  - `result`: `int` [Read-Only] — [Read-Only] (int32)
  - `value`: `int` — [Read-Write] (int32)

### `unreal.RigVMFunction_MathMatrixBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathMatrix.h`

Rig VMFunction Math Matrix Base

### `unreal.RigVMFunction_MathMatrixBinaryAggregateOp`
Inherits: `RigVMFunction_MathMatrixBase` | Header: `RigVMFunction_MathMatrix.h`

Rig VMFunction Math Matrix Binary Aggregate Op

**Properties** (3):
  - `a`: `Matrix` — [Read-Write] (Matrix)
  - `b`: `Matrix` — [Read-Write] (Matrix)
  - `result`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.RigVMFunction_MathMatrixBinaryOp`
Inherits: `RigVMFunction_MathMatrixBase` | Header: `RigVMFunction_MathMatrix.h`

Rig VMFunction Math Matrix Binary Op

**Properties** (3):
  - `a`: `Matrix` — [Read-Write] (Matrix)
  - `b`: `Matrix` — [Read-Write] (Matrix)
  - `result`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.RigVMFunction_MathMatrixFromTransform`
Inherits: `RigVMFunction_MathMatrixBase` | Header: `RigVMFunction_MathMatrix.h`

Makes a matrix from a transform

**Properties** (2):
  - `result`: `Matrix` [Read-Only] — [Read-Only] (Matrix)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathMatrixFromTransformV2`
Inherits: `RigVMFunction_MathMatrixBase` | Header: `RigVMFunction_MathMatrix.h`

Makes a matrix from a transform

**Properties** (2):
  - `result`: `Matrix` [Read-Only] — [Read-Only] (Matrix)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathMatrixFromVectors`
Inherits: `RigVMFunction_MathMatrixBase` | Header: `RigVMFunction_MathMatrix.h`

Makes a matrix from its vectors

**Properties** (5):
  - `origin`: `Vector` — [Read-Write] (Vector)
  - `result`: `Matrix` [Read-Only] — [Read-Only] (Matrix)
  - `x`: `Vector` — [Read-Write] (Vector)
  - `y`: `Vector` — [Read-Write] (Vector)
  - `z`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathMatrixInverse`
Inherits: `RigVMFunction_MathMatrixUnaryOp` | Header: `RigVMFunction_MathMatrix.h`

Returns the inverse value

### `unreal.RigVMFunction_MathMatrixMul`
Inherits: `RigVMFunction_MathMatrixBinaryAggregateOp` | Header: `RigVMFunction_MathMatrix.h`

Returns the product of the two values

### `unreal.RigVMFunction_MathMatrixToTransform`
Inherits: `RigVMFunction_MathMatrixBase` | Header: `RigVMFunction_MathMatrix.h`

Makes a transform from a matrix

**Properties** (2):
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `value`: `Matrix` — [Read-Write] (Matrix)

### `unreal.RigVMFunction_MathMatrixToVectors`
Inherits: `RigVMFunction_MathMatrixBase` | Header: `RigVMFunction_MathMatrix.h`

Converts the matrix to its vectors

**Properties** (5):
  - `origin`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Matrix` — [Read-Write] (Matrix)
  - `x`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `y`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `z`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathMatrixUnaryOp`
Inherits: `RigVMFunction_MathMatrixBase` | Header: `RigVMFunction_MathMatrix.h`

Rig VMFunction Math Matrix Unary Op

**Properties** (2):
  - `result`: `Matrix` [Read-Only] — [Read-Only] (Matrix)
  - `value`: `Matrix` — [Read-Write] (Matrix)

### `unreal.RigVMFunction_MathMutableBase`
Inherits: `RigVMStructMutable` | Header: `RigVMFunction_MathBase.h`

Rig VMFunction Math Mutable Base

### `unreal.RigVMFunction_MathQuaternionBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathQuaternion.h`

Rig VMFunction Math Quaternion Base

### `unreal.RigVMFunction_MathQuaternionBinaryAggregateOp`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Rig VMFunction Math Quaternion Binary Aggregate Op

**Properties** (3):
  - `a`: `Quat` — [Read-Write] (Quat)
  - `b`: `Quat` — [Read-Write] (Quat)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)

### `unreal.RigVMFunction_MathQuaternionBinaryOp`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Rig VMFunction Math Quaternion Binary Op

**Properties** (3):
  - `a`: `Quat` — [Read-Write] (Quat)
  - `b`: `Quat` — [Read-Write] (Quat)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)

### `unreal.RigVMFunction_MathQuaternionDot`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Returns the dot product between two quaternions

**Properties** (3):
  - `a`: `Quat` — [Read-Write] (Quat)
  - `b`: `Quat` — [Read-Write] (Quat)
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathQuaternionEquals`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Returns true if the value A equals B

**Properties** (3):
  - `a`: `Quat` — [Read-Write] (Quat)
  - `b`: `Quat` — [Read-Write] (Quat)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathQuaternionFromAxisAndAngle`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Makes a quaternion from an axis and an angle in radians

**Properties** (3):
  - `angle`: `float` — [Read-Write] (float)
  - `axis`: `Vector` — [Read-Write] (Vector)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)

### `unreal.RigVMFunction_MathQuaternionFromEuler`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Makes a quaternion from euler values in degrees

**Properties** (3):
  - `euler`: `Vector` — [Read-Write] (Vector)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `rotation_order`: `EulerRotationOrder` — [Read-Write] (EulerRotationOrder)

### `unreal.RigVMFunction_MathQuaternionFromRotator`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Makes a quaternion from a rotator

**Properties** (2):
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `rotator`: `Rotator` — [Read-Write] (Rotator)

### `unreal.RigVMFunction_MathQuaternionFromRotatorV2`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Makes a quaternion from a rotator

**Properties** (2):
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `value`: `Rotator` — [Read-Write] (Rotator)

### `unreal.RigVMFunction_MathQuaternionFromTwoVectors`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Makes a quaternion from two vectors, representing the shortest rotation between the two vectors.

**Properties** (3):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)

### `unreal.RigVMFunction_MathQuaternionGetAxis`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Rotates a given vector by the quaternion

**Properties** (3):
  - `axis`: `AxisType` — [Read-Write] (AxisType)
  - `quaternion`: `Quat` — [Read-Write] (Quat)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathQuaternionInverse`
Inherits: `RigVMFunction_MathQuaternionUnaryOp` | Header: `RigVMFunction_MathQuaternion.h`

Returns the negative value

### `unreal.RigVMFunction_MathQuaternionMake`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Makes a quaternion from its components

**Properties** (5):
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `w`: `float` — [Read-Write] (float)
  - `x`: `float` — [Read-Write] (float)
  - `y`: `float` — [Read-Write] (float)
  - `z`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathQuaternionMakeAbsolute`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Returns the absolute global transform within a parentâs transform

**Properties** (3):
  - `global_`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `local`: `Quat` — [Read-Write] (Quat)
  - `parent`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_MathQuaternionMakeRelative`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Returns the relative local transform within a parentâs transform

**Properties** (3):
  - `global_`: `Quat` — [Read-Write] (Quat)
  - `local`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `parent`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_MathQuaternionMirrorTransform`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Mirror a rotation about a central transform.

**Properties** (5):
  - `axis_to_flip`: `AxisType` — [Read-Write] the axis to flip for rotations (AxisType)
  - `central_transform`: `Transform` — [Read-Write] The transform about which to mirror (Transform)
  - `mirror_axis`: `AxisType` — [Read-Write] the axis to mirror against (AxisType)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_MathQuaternionMul`
Inherits: `RigVMFunction_MathQuaternionBinaryAggregateOp` | Header: `RigVMFunction_MathQuaternion.h`

Returns the product of the two values

### `unreal.RigVMFunction_MathQuaternionNotEquals`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Returns true if the value A does not equal B

**Properties** (3):
  - `a`: `Quat` — [Read-Write] (Quat)
  - `b`: `Quat` — [Read-Write] (Quat)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathQuaternionRotateVector`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Rotates a given vector by the quaternion

**Properties** (4):
  - `quaternion`: `Quat` — âquaternionâ was renamed to âtransformâ. deprecated
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `transform`: `Quat` — [Read-Write] (Quat)
  - `vector`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathQuaternionRotationOrder`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathQuaternion.h`

Enum of possible rotation orders

**Properties** (1):
  - `rotation_order`: `EulerRotationOrder` — [Read-Write] (EulerRotationOrder)

### `unreal.RigVMFunction_MathQuaternionScale`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Scales a quaternionâs angle

**Properties** (2):
  - `scale`: `float` — [Read-Write] (float)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_MathQuaternionScaleV2`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Scales a quaternionâs angle

**Properties** (3):
  - `factor`: `float` — [Read-Write] (float)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_MathQuaternionSelectBool`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Return one of the two values based on the condition

**Properties** (4):
  - `condition`: `bool` — [Read-Write] (bool)
  - `if_false`: `Quat` — [Read-Write] (Quat)
  - `if_true`: `Quat` — [Read-Write] (Quat)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)

### `unreal.RigVMFunction_MathQuaternionSlerp`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Linearly interpolates between A and B using the ratio T

**Properties** (4):
  - `a`: `Quat` — [Read-Write] (Quat)
  - `b`: `Quat` — [Read-Write] (Quat)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `t`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathQuaternionSwingTwist`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Computes the swing and twist components of a quaternion

**Properties** (4):
  - `input`: `Quat` — [Read-Write] (Quat)
  - `swing`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `twist`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `twist_axis`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathQuaternionToAxisAndAngle`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Retrieves the axis and angle of a quaternion in radians

**Properties** (3):
  - `angle`: `float` [Read-Only] — [Read-Only] (float)
  - `axis`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_MathQuaternionToEuler`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Retrieves the euler angles in degrees

**Properties** (3):
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `rotation_order`: `EulerRotationOrder` — [Read-Write] (EulerRotationOrder)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_MathQuaternionToRotator`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Retrieves the rotator

**Properties** (2):
  - `result`: `Rotator` [Read-Only] — [Read-Only] (Rotator)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_MathQuaternionToVectors`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Retrieves the forward, right and up vectors of a quaternion

**Properties** (4):
  - `forward`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `right`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `up`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_MathQuaternionUnaryOp`
Inherits: `RigVMFunction_MathQuaternionBase` | Header: `RigVMFunction_MathQuaternion.h`

Rig VMFunction Math Quaternion Unary Op

**Properties** (2):
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_MathQuaternionUnit`
Inherits: `RigVMFunction_MathQuaternionUnaryOp` | Header: `RigVMFunction_MathQuaternion.h`

Returns the normalized quaternion

### `unreal.RigVMFunction_MathRayBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathRay.h`

Rig VMFunction Math Ray Base

### `unreal.RigVMFunction_MathRayGetAt`
Inherits: `RigVMFunction_MathRayBase` | Header: `RigVMFunction_MathRay.h`

Returns the position on a ray

**Properties** (3):
  - `ratio`: `float` — [Read-Write] (float)
  - `ray`: `Ray` — [Read-Write] (Ray)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathRayIntersectPlane`
Inherits: `RigVMFunction_MathRayBase` | Header: `RigVMFunction_MathRay.h`

Returns the closest point intersection of a ray with a plane

**Properties** (6):
  - `distance`: `float` [Read-Only] — [Read-Only] (float)
  - `plane_normal`: `Vector` — [Read-Write] (Vector)
  - `plane_point`: `Vector` — [Read-Write] (Vector)
  - `ratio`: `float` [Read-Only] — [Read-Only] (float)
  - `ray`: `Ray` — [Read-Write] (Ray)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathRayIntersectRay`
Inherits: `RigVMFunction_MathRayBase` | Header: `RigVMFunction_MathRay.h`

Returns the closest point intersection of a ray with another ray

**Properties** (6):
  - `a`: `Ray` — [Read-Write] (Ray)
  - `b`: `Ray` — [Read-Write] (Ray)
  - `distance`: `float` [Read-Only] — [Read-Only] (float)
  - `ratio_a`: `float` [Read-Only] — [Read-Only] (float)
  - `ratio_b`: `float` [Read-Only] — [Read-Only] (float)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathRayTransform`
Inherits: `RigVMFunction_MathRayBase` | Header: `RigVMFunction_MathRay.h`

Returns the division of the two values

**Properties** (3):
  - `ray`: `Ray` — [Read-Write] (Ray)
  - `result`: `Ray` [Read-Only] — [Read-Only] (Ray)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathRBFInterpolateBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Base

### `unreal.RigVMFunction_MathRBFInterpolateQuatBase`
Inherits: `RigVMFunction_MathRBFInterpolateBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Quat Base

**Properties** (6):
  - `distance_function`: `RBFQuatDistanceType` [Read-Only] — [Read-Only] (RBFQuatDistanceType)
  - `input`: `Quat` — [Read-Write] (Quat)
  - `normalize_output`: `bool` [Read-Only] — [Read-Only] (bool)
  - `smoothing_angle`: `float` [Read-Only] — [Read-Only] (float)
  - `smoothing_function`: `RBFKernelType` [Read-Only] — [Read-Only] (RBFKernelType)
  - `twist_axis`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathRBFInterpolateQuatColor`
Inherits: `RigVMFunction_MathRBFInterpolateQuatBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Quat Color

**Properties** (2):
  - `output`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)
  - `targets`: `None` — [Read-Write] (Array[MathRBFInterpolateQuatColor_Target])

### `unreal.RigVMFunction_MathRBFInterpolateQuatFloat`
Inherits: `RigVMFunction_MathRBFInterpolateQuatBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Quat Float

**Properties** (2):
  - `output`: `float` [Read-Only] — [Read-Only] (float)
  - `targets`: `None` — [Read-Write] (Array[MathRBFInterpolateQuatFloat_Target])

### `unreal.RigVMFunction_MathRBFInterpolateQuatQuat`
Inherits: `RigVMFunction_MathRBFInterpolateQuatBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Quat Quat

**Properties** (2):
  - `output`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `targets`: `None` — [Read-Write] (Array[MathRBFInterpolateQuatQuat_Target])

### `unreal.RigVMFunction_MathRBFInterpolateQuatVector`
Inherits: `RigVMFunction_MathRBFInterpolateQuatBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Quat Vector

**Properties** (2):
  - `output`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `targets`: `None` — [Read-Write] (Array[MathRBFInterpolateQuatVector_Target])

### `unreal.RigVMFunction_MathRBFInterpolateQuatXform`
Inherits: `RigVMFunction_MathRBFInterpolateQuatBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Quat Xform

**Properties** (2):
  - `output`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `targets`: `None` — [Read-Write] (Array[MathRBFInterpolateQuatXform_Target])

### `unreal.RigVMFunction_MathRBFInterpolateVectorBase`
Inherits: `RigVMFunction_MathRBFInterpolateBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Vector Base

**Properties** (5):
  - `distance_function`: `RBFVectorDistanceType` [Read-Only] — [Read-Only] (RBFVectorDistanceType)
  - `input`: `Vector` — [Read-Write] (Vector)
  - `normalize_output`: `bool` [Read-Only] — [Read-Only] (bool)
  - `smoothing_function`: `RBFKernelType` [Read-Only] — [Read-Only] (RBFKernelType)
  - `smoothing_radius`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathRBFInterpolateVectorColor`
Inherits: `RigVMFunction_MathRBFInterpolateVectorBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Vector Color

**Properties** (2):
  - `output`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)
  - `targets`: `None` — [Read-Write] (Array[MathRBFInterpolateVectorColor_Target])

### `unreal.RigVMFunction_MathRBFInterpolateVectorFloat`
Inherits: `RigVMFunction_MathRBFInterpolateVectorBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Vector Float

**Properties** (2):
  - `output`: `float` [Read-Only] — [Read-Only] (float)
  - `targets`: `None` — [Read-Write] (Array[MathRBFInterpolateVectorFloat_Target])

### `unreal.RigVMFunction_MathRBFInterpolateVectorQuat`
Inherits: `RigVMFunction_MathRBFInterpolateVectorBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Vector Quat

**Properties** (2):
  - `output`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `targets`: `None` — [Read-Write] (Array[MathRBFInterpolateVectorQuat_Target])

### `unreal.RigVMFunction_MathRBFInterpolateVectorVector`
Inherits: `RigVMFunction_MathRBFInterpolateVectorBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Vector Vector

**Properties** (2):
  - `output`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `targets`: `None` — [Read-Write] (Array[MathRBFInterpolateVectorVector_Target])

### `unreal.RigVMFunction_MathRBFInterpolateVectorXform`
Inherits: `RigVMFunction_MathRBFInterpolateVectorBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Rig VMFunction Math RBFInterpolate Vector Xform

**Properties** (2):
  - `output`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `targets`: `None` — [Read-Write] (Array[MathRBFInterpolateVectorXform_Target])

### `unreal.RigVMFunction_MathTransformAccumulateArray`
Inherits: `RigVMFunction_MathTransformMutableBase` | Header: `RigVMFunction_MathTransform.h`

Treats the provided transforms as a chain with global / local transforms, and projects each transform into the target space. Optionally you can provide a custom parent indices array, with which you ca...

**Properties** (4):
  - `parent_indices`: `None` — [Read-Write] If this array is the same size as the transforms array the indices will be used
to look...
  - `root`: `Transform` — [Read-Write] Provides the parent transform for the root (Transform)
  - `target_space`: `RigVMTransformSpace` — [Read-Write] Defines the space to project to (RigVMTransformSpace)
  - `transforms`: `None` — [Read-Write] (Array[Transform])

### `unreal.RigVMFunction_MathTransformArrayToSRT`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Decomposes a Transform Array to its components.

**Properties** (4):
  - `rotations`: `None` [Read-Only] — [Read-Only] (Array[Quat])
  - `scales`: `None` [Read-Only] — [Read-Only] (Array[Vector])
  - `transforms`: `None` — [Read-Write] (Array[Transform])
  - `translations`: `None` [Read-Only] — [Read-Only] (Array[Vector])

### `unreal.RigVMFunction_MathTransformBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathTransform.h`

Rig VMFunction Math Transform Base

### `unreal.RigVMFunction_MathTransformBinaryAggregateOp`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Rig VMFunction Math Transform Binary Aggregate Op

**Properties** (3):
  - `a`: `Transform` — [Read-Write] (Transform)
  - `b`: `Transform` — [Read-Write] (Transform)
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.RigVMFunction_MathTransformBinaryOp`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Rig VMFunction Math Transform Binary Op

**Properties** (3):
  - `a`: `Transform` — [Read-Write] (Transform)
  - `b`: `Transform` — [Read-Write] (Transform)
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.RigVMFunction_MathTransformClampSpatially`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Clamps a position using a plane collision, cylindric collision or spherical collision.

**Properties** (10):
  - `axis`: `AxisType` — [Read-Write] (AxisType)
  - `debug_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `debug_thickness`: `float` — [Read-Write] (float)
  - `draw_debug`: `bool` — [Read-Write] (bool)
  - `maximum`: `float` — [Read-Write] This maximum allowed distance.
A collision will occur towards the center at this wall.
...
  - `minimum`: `float` — [Read-Write] The minimum allowed distance at which a collision occurs.
Note: For capsule this repres...
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `space`: `Transform` — [Read-Write] The space this spatial clamp happens within.
The input position will be projected into ...
  - `type`: `RigVMClampSpatialMode` — [Read-Write] (RigVMClampSpatialMode)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathTransformFromEulerTransform`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Makes a quaternion based transform from a euler based transform

**Properties** (2):
  - `euler_transform`: `EulerTransform` — [Read-Write] (EulerTransform)
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.RigVMFunction_MathTransformFromEulerTransformV2`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Makes a quaternion based transform from a euler based transform

**Properties** (2):
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `value`: `EulerTransform` — [Read-Write] (EulerTransform)

### `unreal.RigVMFunction_MathTransformFromSRT`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Composes a Transform (and Euler Transform) from its components.

**Properties** (6):
  - `euler_transform`: `EulerTransform` [Read-Only] — [Read-Only] (EulerTransform)
  - `location`: `Vector` — [Read-Write] (Vector)
  - `rotation`: `Vector` — [Read-Write] (Vector)
  - `rotation_order`: `EulerRotationOrder` — [Read-Write] (EulerRotationOrder)
  - `scale`: `Vector` — [Read-Write] (Vector)
  - `transform`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.RigVMFunction_MathTransformInverse`
Inherits: `RigVMFunction_MathTransformUnaryOp` | Header: `RigVMFunction_MathTransform.h`

Returns the negative value

### `unreal.RigVMFunction_MathTransformLerp`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Linearly interpolates between A and B using the ratio T

**Properties** (4):
  - `a`: `Transform` — [Read-Write] (Transform)
  - `b`: `Transform` — [Read-Write] (Transform)
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `t`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathTransformMake`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Makes a transform from its components

**Properties** (4):
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `rotation`: `Quat` — [Read-Write] (Quat)
  - `scale`: `Vector` — [Read-Write] (Vector)
  - `translation`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathTransformMakeAbsolute`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Returns the absolute global transform within a parentâs transform

**Properties** (3):
  - `global_`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `local`: `Transform` — [Read-Write] (Transform)
  - `parent`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathTransformMakeRelative`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Returns the relative local transform within a parentâs transform

**Properties** (3):
  - `global_`: `Transform` — [Read-Write] (Transform)
  - `local`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `parent`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathTransformMirrorTransform`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Mirror a transform about a central transform.

**Properties** (5):
  - `axis_to_flip`: `AxisType` — [Read-Write] the axis to flip for rotations (AxisType)
  - `central_transform`: `Transform` — [Read-Write] The transform about which to mirror (Transform)
  - `mirror_axis`: `AxisType` — [Read-Write] the axis to mirror against (AxisType)
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathTransformMul`
Inherits: `RigVMFunction_MathTransformBinaryAggregateOp` | Header: `RigVMFunction_MathTransform.h`

Returns the product of the two values

### `unreal.RigVMFunction_MathTransformMutableBase`
Inherits: `RigVMFunction_MathMutableBase` | Header: `RigVMFunction_MathTransform.h`

Rig VMFunction Math Transform Mutable Base

### `unreal.RigVMFunction_MathTransformRotateVector`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Rotates a given vector (direction) by the transform

**Properties** (4):
  - `direction`: `Vector` — âdirectionâ was renamed to âvectorâ. deprecated
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `vector`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathTransformSelectBool`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Return one of the two values based on the condition

**Properties** (4):
  - `condition`: `bool` — [Read-Write] (bool)
  - `if_false`: `Transform` — [Read-Write] (Transform)
  - `if_true`: `Transform` — [Read-Write] (Transform)
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.RigVMFunction_MathTransformToEulerTransform`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Retrieves a euler based transform from a quaternion based transform

**Properties** (2):
  - `result`: `EulerTransform` [Read-Only] — [Read-Only] (EulerTransform)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathTransformToVectors`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Retrieves the forward, right and up vectors of a transformâs quaternion

**Properties** (4):
  - `forward`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `right`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `up`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathTransformTransformVector`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Multiplies a given vector (location) by the transform

**Properties** (3):
  - `location`: `Vector` — [Read-Write] (Vector)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathTransformUnaryOp`
Inherits: `RigVMFunction_MathTransformBase` | Header: `RigVMFunction_MathTransform.h`

Rig VMFunction Math Transform Unary Op

**Properties** (2):
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_MathVectorAbs`
Inherits: `RigVMFunction_MathVectorUnaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the absolute (positive) value

### `unreal.RigVMFunction_MathVectorAdd`
Inherits: `RigVMFunction_MathVectorBinaryAggregateOp` | Header: `RigVMFunction_MathVector.h`

Returns the sum of the two values

### `unreal.RigVMFunction_MathVectorAngle`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns the angle between two vectors in radians

**Properties** (3):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathVectorArrayAverage`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns the average of the given array

**Properties** (2):
  - `array`: `None` — [Read-Write] (Array[Vector])
  - `average`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathVectorArraySum`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns the sum of the given array

**Properties** (2):
  - `array`: `None` — [Read-Write] (Array[Vector])
  - `sum`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathVectorBase`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_MathVector.h`

Rig VMFunction Math Vector Base

### `unreal.RigVMFunction_MathVectorBezierFourPoint`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns the 4 point bezier interpolation

**Properties** (4):
  - `bezier`: `RigVMFourPointBezier` — [Read-Write] (RigVMFourPointBezier)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `t`: `float` — [Read-Write] (float)
  - `tangent`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathVectorBinaryAggregateOp`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Rig VMFunction Math Vector Binary Aggregate Op

**Properties** (3):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathVectorBinaryOp`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Rig VMFunction Math Vector Binary Op

**Properties** (3):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathVectorCeil`
Inherits: `RigVMFunction_MathVectorUnaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the closest higher full number (integer) of the value for each component

### `unreal.RigVMFunction_MathVectorClamp`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Clamps the given value within the range provided by minimum and maximum for each component

**Properties** (4):
  - `maximum`: `Vector` — [Read-Write] (Vector)
  - `minimum`: `Vector` — [Read-Write] (Vector)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorClampLength`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Clamps the length of a given vector between a minimum and maximum

**Properties** (4):
  - `maximum_length`: `float` — [Read-Write] (float)
  - `minimum_length`: `float` — [Read-Write] (float)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorClampSpatially`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Clamps a position using a plane collision, cylindric collision or spherical collision. The collision happens both towards an inner envelope (minimum) and towards an outer envelope (maximum). You can d...

**Properties** (10):
  - `axis`: `AxisType` — [Read-Write] (AxisType)
  - `debug_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `debug_thickness`: `float` — [Read-Write] (float)
  - `draw_debug`: `bool` — [Read-Write] (bool)
  - `maximum`: `float` — [Read-Write] This maximum allowed distance.
A collision will occur towards the center at this wall.
...
  - `minimum`: `float` — [Read-Write] The minimum allowed distance at which a collision occurs.
Note: For capsule this repres...
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `space`: `Transform` — [Read-Write] The space this spatial clamp happens within.
The input position will be projected into ...
  - `type`: `RigVMClampSpatialMode` — [Read-Write] (RigVMClampSpatialMode)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorCross`
Inherits: `RigVMFunction_MathVectorBinaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the cross product between two vectors

### `unreal.RigVMFunction_MathVectorDeg`
Inherits: `RigVMFunction_MathVectorUnaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the degrees of a given value in radians

### `unreal.RigVMFunction_MathVectorDistance`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns the distance from A to B

**Properties** (3):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathVectorDiv`
Inherits: `RigVMFunction_MathVectorBinaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the division of the two values

### `unreal.RigVMFunction_MathVectorDot`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns the dot product between two vectors

**Properties** (3):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_MathVectorEquals`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns true if the value A equals B

**Properties** (3):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathVectorFloor`
Inherits: `RigVMFunction_MathVectorUnaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the closest lower full number (integer) of the value for each component

### `unreal.RigVMFunction_MathVectorFromDouble`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Makes a vector from a single double

**Properties** (2):
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_MathVectorFromFloat`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Makes a vector from a single float

**Properties** (2):
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathVectorIsNearlyEqual`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns true if the value A is almost equal to B

**Properties** (4):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `tolerance`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathVectorIsNearlyZero`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns true if the value is nearly zero

**Properties** (3):
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `tolerance`: `float` — [Read-Write] (float)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorLength`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns the length of the vector

**Properties** (2):
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorLengthSquared`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns the squared length of the vector

**Properties** (2):
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorLerp`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Linearly interpolates between A and B using the ratio T

**Properties** (4):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `t`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathVectorMake`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Makes a vector from its components

**Properties** (4):
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `x`: `float` — [Read-Write] (float)
  - `y`: `float` — [Read-Write] (float)
  - `z`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_MathVectorMakeAbsolute`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns the absolute global vector within a parentâs vector

**Properties** (3):
  - `global_`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `local`: `Vector` — [Read-Write] (Vector)
  - `parent`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorMakeBezierFourPoint`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Creates a bezier four point

**Properties** (1):
  - `bezier`: `RigVMFourPointBezier` — [Read-Write] (RigVMFourPointBezier)

### `unreal.RigVMFunction_MathVectorMakeRelative`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns the relative local vector within a parentâs vector

**Properties** (3):
  - `global_`: `Vector` — [Read-Write] (Vector)
  - `local`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `parent`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorMax`
Inherits: `RigVMFunction_MathVectorBinaryAggregateOp` | Header: `RigVMFunction_MathVector.h`

Returns the larger of the two values each component

### `unreal.RigVMFunction_MathVectorMin`
Inherits: `RigVMFunction_MathVectorBinaryAggregateOp` | Header: `RigVMFunction_MathVector.h`

Returns the smaller of the two values for each component

### `unreal.RigVMFunction_MathVectorMirror`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Mirror a vector about a normal vector.

**Properties** (3):
  - `normal`: `Vector` — [Read-Write] (Vector)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorMirrorTransform`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Mirror a vector about a central transform.

**Properties** (5):
  - `axis_to_flip`: `AxisType` — [Read-Write] the axis to flip for rotations (AxisType)
  - `central_transform`: `Transform` — [Read-Write] The transform about which to mirror (Transform)
  - `mirror_axis`: `AxisType` — [Read-Write] the axis to mirror against (AxisType)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorMod`
Inherits: `RigVMFunction_MathVectorBinaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the modulo of the two values

### `unreal.RigVMFunction_MathVectorMul`
Inherits: `RigVMFunction_MathVectorBinaryAggregateOp` | Header: `RigVMFunction_MathVector.h`

Returns the product of the two values

### `unreal.RigVMFunction_MathVectorNegate`
Inherits: `RigVMFunction_MathVectorUnaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the negative value

### `unreal.RigVMFunction_MathVectorNotEquals`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns true if the value A does not equal B

**Properties** (3):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathVectorOrthogonal`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns true if the two vectors are orthogonal

**Properties** (3):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathVectorParallel`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns true if the two vectors are parallel

**Properties** (3):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_MathVectorRad`
Inherits: `RigVMFunction_MathVectorUnaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the radians of a given value in degrees

### `unreal.RigVMFunction_MathVectorRemap`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Remaps the given value from a source range to a target range for each component

**Properties** (7):
  - `clamp`: `bool` — [Read-Write] If set to true the result is clamped to the target range (bool)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `source_maximum`: `Vector` — [Read-Write] (Vector)
  - `source_minimum`: `Vector` — [Read-Write] (Vector)
  - `target_maximum`: `Vector` — [Read-Write] (Vector)
  - `target_minimum`: `Vector` — [Read-Write] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorRound`
Inherits: `RigVMFunction_MathVectorUnaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the closest higher full number (integer) of the value for each component

### `unreal.RigVMFunction_MathVectorScale`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Returns the product of the the vector and the float value

**Properties** (3):
  - `factor`: `float` — [Read-Write] (float)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorSelectBool`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Return one of the two values based on the condition

**Properties** (4):
  - `condition`: `bool` — [Read-Write] (bool)
  - `if_false`: `Vector` — [Read-Write] (Vector)
  - `if_true`: `Vector` — [Read-Write] (Vector)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_MathVectorSetLength`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Sets the length of a given vector

**Properties** (3):
  - `length`: `float` — [Read-Write] (float)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorSign`
Inherits: `RigVMFunction_MathVectorUnaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the sign of the value (+1 for >= FVector(0.f, 0.f, 0.f), -1 for < 0.f) for each component

### `unreal.RigVMFunction_MathVectorSub`
Inherits: `RigVMFunction_MathVectorBinaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the difference of the two values

### `unreal.RigVMFunction_MathVectorUnaryOp`
Inherits: `RigVMFunction_MathVectorBase` | Header: `RigVMFunction_MathVector.h`

Rig VMFunction Math Vector Unary Op

**Properties** (2):
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_MathVectorUnit`
Inherits: `RigVMFunction_MathVectorUnaryOp` | Header: `RigVMFunction_MathVector.h`

Returns the normalized value

### `unreal.RigVMFunction_NameBase`
Inherits: `RigVMStruct` | Header: `RigVMFunction_Name.h`

Rig VMFunction Name Base

### `unreal.RigVMFunction_NameConcat`
Inherits: `RigVMFunction_NameBase` | Header: `RigVMFunction_Name.h`

Concatenates two strings together to make a new string

**Properties** (3):
  - `a`: `Name` — [Read-Write] (Name)
  - `b`: `Name` — [Read-Write] (Name)
  - `result`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.RigVMFunction_NameReplace`
Inherits: `RigVMFunction_NameBase` | Header: `RigVMFunction_Name.h`

Replace all occurrences of a substring in this string

**Properties** (4):
  - `name`: `Name` — [Read-Write] (Name)
  - `new`: `Name` — [Read-Write] (Name)
  - `old`: `Name` — [Read-Write] (Name)
  - `result`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.RigVMFunction_NameTruncate`
Inherits: `RigVMFunction_NameBase` | Header: `RigVMFunction_Name.h`

Returns the left or right most characters from the string chopping the given number of characters from the start or the end

**Properties** (5):
  - `chopped`: `Name` [Read-Only] — [Read-Only] the part of the name that has been chopped off (Name)
  - `count`: `int` — [Read-Write] Number of characters to remove from left or right (int32)
  - `from_end`: `bool` — [Read-Write] if set to true the characters will be removed from the end (bool)
  - `name`: `Name` — [Read-Write] (Name)
  - `remainder`: `Name` [Read-Only] — [Read-Only] the part of the string without the chopped characters (Name)

### `unreal.RigVMFunction_NoiseDouble`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_Noise.h`

Generates a float through a noise fluctuation process between a min and a max through speed

**Properties** (6):
  - `frequency`: `float` — [Read-Write] (double)
  - `maximum`: `float` — [Read-Write] (double)
  - `minimum`: `float` — [Read-Write] (double)
  - `result`: `float` [Read-Only] — [Read-Only] (double)
  - `speed`: `float` — [Read-Write] (double)
  - `value`: `float` — [Read-Write] (double)

### `unreal.RigVMFunction_NoiseFloat`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_Noise.h`

Generates a float through a noise fluctuation process between a min and a max through speed

**Properties** (6):
  - `frequency`: `float` — [Read-Write] (float)
  - `maximum`: `float` — [Read-Write] (float)
  - `minimum`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `speed`: `float` — [Read-Write] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_NoiseVector`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_Noise.h`

Generates a vector through a noise fluctuation process between a min and a max through speed

**Properties** (6):
  - `frequency`: `Vector` — [Read-Write] (Vector)
  - `maximum`: `float` — [Read-Write] (float)
  - `minimum`: `float` — [Read-Write] (float)
  - `position`: `Vector` — [Read-Write] (Vector)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `speed`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_NoiseVector2`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_Noise.h`

Generates a vector through a noise fluctuation process between a min and a max through speed

**Properties** (6):
  - `frequency`: `Vector` — [Read-Write] (Vector)
  - `maximum`: `float` — [Read-Write] (double)
  - `minimum`: `float` — [Read-Write] (double)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `speed`: `Vector` — [Read-Write] (Vector)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_RandomFloat`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_Random.h`

Generates a random float between a min and a max

**Properties** (5):
  - `duration`: `float` — [Read-Write] The duration at which the number wonât change.
Use 0 for a different number every tim...
  - `maximum`: `float` — [Read-Write] (float)
  - `minimum`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `seed`: `int` — [Read-Write] (int32)

### `unreal.RigVMFunction_RandomVector`
Inherits: `RigVMFunction_MathBase` | Header: `RigVMFunction_Random.h`

Generates a random vector between a min and a max

**Properties** (5):
  - `duration`: `float` — [Read-Write] The duration at which the number wonât change.
Use 0 for a different number every tim...
  - `maximum`: `float` — [Read-Write] (float)
  - `minimum`: `float` — [Read-Write] (float)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `seed`: `int` — [Read-Write] (int32)

### `unreal.RigVMFunction_SecondsToFrames`
Inherits: `RigVMFunction_AnimBase` | Header: `RigVMFunction_TimeConversion.h`

Converts seconds to frames based on the current frame rate

**Properties** (2):
  - `frames`: `float` [Read-Only] — [Read-Only] (float)
  - `seconds`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_Sequence`
Inherits: `RigVMStruct` | Header: `RigVMFunction_Sequence.h`

Allows for a single execution pulse to trigger a series of events in order.

**Properties** (3):
  - `a`: `RigVMExecuteContext` [Read-Only] — [Read-Only] The execution result A (RigVMExecuteContext)
  - `b`: `RigVMExecuteContext` [Read-Only] — [Read-Only] The execution result B (RigVMExecuteContext)
  - `execute_context`: `RigVMExecuteContext` — [Read-Write] The execution input (RigVMExecuteContext)

### `unreal.RigVMFunction_SimBase`
Inherits: `RigVMStruct` | Header: `RigVMFunction_SimBase.h`

Rig VMFunction Sim Base

### `unreal.RigVMFunction_SimBaseMutable`
Inherits: `RigVMStructMutable` | Header: `RigVMFunction_SimBase.h`

Rig VMFunction Sim Base Mutable

### `unreal.RigVMFunction_StartsWith`
Inherits: `RigVMFunction_NameBase` | Header: `RigVMFunction_Name.h`

Tests whether this string starts with given string

**Properties** (3):
  - `name`: `Name` — [Read-Write] (Name)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `start`: `Name` — [Read-Write] (Name)

### `unreal.RigVMFunction_StringBase`
Inherits: `RigVMStruct` | Header: `RigVMFunction_String.h`

Rig VMFunction String Base

### `unreal.RigVMFunction_StringConcat`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Concatenates two strings together to make a new string

**Properties** (3):
  - `a`: `str` — [Read-Write] (str)
  - `b`: `str` — [Read-Write] (str)
  - `result`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.RigVMFunction_StringContains`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Returns true or false if a given name exists in another given name

**Properties** (3):
  - `name`: `str` — [Read-Write] (str)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `search`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringEndsWith`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Tests whether this string ends with given string

**Properties** (3):
  - `ending`: `str` — [Read-Write] (str)
  - `name`: `str` — [Read-Write] (str)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigVMFunction_StringFind`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Finds a string within another string

**Properties** (4):
  - `found`: `bool` [Read-Only] — [Read-Only] (bool)
  - `index`: `int` [Read-Only] — [Read-Only] (int32)
  - `search`: `str` — [Read-Write] (str)
  - `value`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringJoin`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Joins a string into multiple sections given a separator

**Properties** (3):
  - `result`: `str` [Read-Only] — [Read-Only] (str)
  - `separator`: `str` — [Read-Write] (str)
  - `values`: `None` — [Read-Write] (Array[str])

### `unreal.RigVMFunction_StringLeft`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Returns the left most characters of a string

**Properties** (3):
  - `count`: `int` — [Read-Write] (int32)
  - `result`: `str` [Read-Only] — [Read-Only] (str)
  - `value`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringLength`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Returns the length of a string

**Properties** (2):
  - `length`: `int` [Read-Only] — [Read-Only] (int32)
  - `value`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringMiddle`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Returns the middle section of a string

**Properties** (4):
  - `count`: `int` — [Read-Write] if count is set to -1 all character from Start will be returned (int32)
  - `result`: `str` [Read-Only] — [Read-Only] (str)
  - `start`: `int` — [Read-Write] the index of the first character (int32)
  - `value`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringPadInteger`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Converts an integer number to a string with padding

**Properties** (3):
  - `digits`: `int` — [Read-Write] (int32)
  - `result`: `str` [Read-Only] — [Read-Only] (str)
  - `value`: `int` — [Read-Write] (int32)

### `unreal.RigVMFunction_StringReplace`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Replace all occurrences of a substring in this string

**Properties** (4):
  - `name`: `str` — [Read-Write] (str)
  - `new`: `str` — [Read-Write] (str)
  - `old`: `str` — [Read-Write] (str)
  - `result`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.RigVMFunction_StringReverse`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Returns the reverse of the input string

**Properties** (2):
  - `reverse`: `str` [Read-Only] — [Read-Only] (str)
  - `value`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringRight`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Returns the right most characters of a string

**Properties** (3):
  - `count`: `int` — [Read-Write] (int32)
  - `result`: `str` [Read-Only] — [Read-Only] (str)
  - `value`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringSplit`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Splits a string into multiple sections given a separator

**Properties** (3):
  - `result`: `None` [Read-Only] — [Read-Only] (Array[str])
  - `separator`: `str` — [Read-Write] (str)
  - `value`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringStartsWith`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Tests whether this string starts with given string

**Properties** (3):
  - `name`: `str` — [Read-Write] (str)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)
  - `start`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringToLowercase`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Converts the string to lower case

**Properties** (2):
  - `result`: `str` [Read-Only] — [Read-Only] (str)
  - `value`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringToUppercase`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Converts the string to upper case

**Properties** (2):
  - `result`: `str` [Read-Only] — [Read-Only] (str)
  - `value`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringTrimWhitespace`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Trims the whitespace from a string (start and end)

**Properties** (2):
  - `result`: `str` [Read-Only] — [Read-Only] (str)
  - `value`: `str` — [Read-Write] (str)

### `unreal.RigVMFunction_StringTruncate`
Inherits: `RigVMFunction_StringBase` | Header: `RigVMFunction_String.h`

Returns the left or right most characters from the string chopping the given number of characters from the start or the end

**Properties** (5):
  - `chopped`: `str` [Read-Only] — [Read-Only] the part of the name that has been chopped off (str)
  - `count`: `int` — [Read-Write] Number of characters to remove from left or right (int32)
  - `from_end`: `bool` — [Read-Write] if set to true the characters will be removed from the end (bool)
  - `name`: `str` — [Read-Write] (str)
  - `remainder`: `str` [Read-Only] — [Read-Only] the part of the string without the chopped characters (str)

### `unreal.RigVMFunction_Timeline`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_Timeline.h`

Simulates a time value - can act as a timeline playing back

**Properties** (2):
  - `speed`: `float` — [Read-Write] (float)
  - `time`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigVMFunction_TimeLoop`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_Timeline.h`

Simulates a time value - and outputs loop information

**Properties** (7):
  - `absolute`: `float` [Read-Only] — [Read-Only] the overall time in seconds (float)
  - `duration`: `float` — [Read-Write] the duration of a single loop in seconds (float)
  - `even`: `bool` [Read-Only] — [Read-Only] true if the iteration of the loop is even (bool)
  - `flip_flop`: `float` [Read-Only] — [Read-Only] the relative time in seconds (within the loop),
going from 0 to duration and then back f...
  - `normalize`: `bool` — [Read-Write] if set to true the output relative and flipflop
will be normalized over the duration. (...
  - `relative`: `float` [Read-Only] — [Read-Only] the relative time in seconds (within the loop) (float)
  - `speed`: `float` — [Read-Write] (float)

### `unreal.RigVMFunction_TimeOffsetFloat`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_TimeOffset.h`

Records a value over time and can access the value from the past

**Properties** (5):
  - `buffer_size`: `int` [Read-Only] — [Read-Only] The sampling precision of the buffer. The higher the more precise - the more memory usag...
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `seconds_ago`: `float` — [Read-Write] Seconds of time in the past you want to query the value for (float)
  - `time_range`: `float` [Read-Only] — [Read-Only] The maximum time required for offsetting in seconds. (float)
  - `value`: `float` — [Read-Write] The value to record (float)

### `unreal.RigVMFunction_TimeOffsetTransform`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_TimeOffset.h`

Records a value over time and can access the value from the past

**Properties** (5):
  - `buffer_size`: `int` [Read-Only] — [Read-Only] The sampling precision of the buffer. The higher the more precise - the more memory usag...
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `seconds_ago`: `float` — [Read-Write] Seconds of time in the past you want to query the value for (float)
  - `time_range`: `float` [Read-Only] — [Read-Only] The maximum time required for offsetting in seconds. (float)
  - `value`: `Transform` — [Read-Write] The value to record (Transform)

### `unreal.RigVMFunction_TimeOffsetVector`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_TimeOffset.h`

Records a value over time and can access the value from the past

**Properties** (5):
  - `buffer_size`: `int` [Read-Only] — [Read-Only] The sampling precision of the buffer. The higher the more precise - the more memory usag...
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `seconds_ago`: `float` — [Read-Write] Seconds of time in the past you want to query the value for (float)
  - `time_range`: `float` [Read-Only] — [Read-Only] The maximum time required for offsetting in seconds. (float)
  - `value`: `Vector` — [Read-Write] The value to record (Vector)

### `unreal.RigVMFunction_UserDefinedEvent`
Inherits: `RigVMStruct` | Header: `RigVMFunction_UserDefinedEvent.h`

User Defined Event for running custom logic

**Properties** (2):
  - `event_name`: `Name` [Read-Only] — [Read-Only] True if the current interaction is a rotation (Name)
  - `execute_pin`: `RigVMExecutePin` [Read-Only] — [Read-Only] The execution result (RigVMExecutePin)

### `unreal.RigVMFunction_VerletIntegrateVector`
Inherits: `RigVMFunction_SimBase` | Header: `RigVMFunction_Verlet.h`

Simulates a single position over time using Verlet integration. It is recommended to use SpringInterp instead as it is more accurate and stable, and has more meaningful parameters.

**Properties** (8):
  - `acceleration`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `blend`: `float` — [Read-Write] The amount of blending to apply per second (float)
  - `damp`: `float` — [Read-Write] The amount of damping to apply ( 0.0 to 1.0, but usually really low like 0.005 ) (float...
  - `force`: `Vector` — [Read-Write] The force feeding into the solver. Can be used for gravity. (Vector)
  - `position`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `strength`: `float` — [Read-Write] The strength of the verlet spring (float)
  - `target`: `Vector` — [Read-Write] (Vector)
  - `velocity`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigVMFunction_VisualDebugQuat`
Inherits: `RigVMFunction_DebugBase` | Header: `RigVMFunction_VisualDebug.h`

Rig VMFunction Visual Debug Quat

**Properties** (5):
  - `bone_space`: `Name` — [Read-Write] (Name)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_VisualDebugQuatNoSpace`
Inherits: `RigVMFunction_DebugBase` | Header: `RigVMFunction_VisualDebug.h`

Debug draw parameters for an Axis given a quaternion

**Properties** (4):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigVMFunction_VisualDebugTransform`
Inherits: `RigVMFunction_DebugBase` | Header: `RigVMFunction_VisualDebug.h`

Rig VMFunction Visual Debug Transform

**Properties** (5):
  - `bone_space`: `Name` — [Read-Write] (Name)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_VisualDebugTransformNoSpace`
Inherits: `RigVMFunction_DebugBase` | Header: `RigVMFunction_VisualDebug.h`

Debug draw parameters for an Axis given a transform

**Properties** (4):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigVMFunction_VisualDebugVector`
Inherits: `RigVMFunction_DebugBase` | Header: `RigVMFunction_VisualDebug.h`

Rig VMFunction Visual Debug Vector

**Properties** (7):
  - `bone_space`: `Name` — [Read-Write] (Name)
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `mode`: `RigUnitVisualDebugPointMode` — [Read-Write] (RigUnitVisualDebugPointMode)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_VisualDebugVectorNoSpace`
Inherits: `RigVMFunction_DebugBase` | Header: `RigVMFunction_VisualDebug.h`

Debug draw parameters for a Point or Vector given a vector

**Properties** (6):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `mode`: `RigUnitVisualDebugPointMode` — [Read-Write] (RigUnitVisualDebugPointMode)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigVMFunction_VisualLogArrow`
Inherits: `RigVMFunction_VisualLogObject` | Header: `RigVMFunction_VisualLog.h`

Logs arrow - recording for Visual Logs has to be enabled to record this data

**Properties** (3):
  - `arrow_head_size`: `float` — [Read-Write] The size of the arrow head (float)
  - `segment_end`: `Vector` — [Read-Write] The end of the arrow (Vector)
  - `segment_start`: `Vector` — [Read-Write] The start of the arrow (Vector)

### `unreal.RigVMFunction_VisualLogBase`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigVMFunction_VisualLog.h`

Base RigVMFunction used for Visual Logger output

**Properties** (2):
  - `category`: `Name` — [Read-Write] The category of the logged text (Name)
  - `text`: `str` — [Read-Write] The text to log (str)

### `unreal.RigVMFunction_VisualLogBox`
Inherits: `RigVMFunction_VisualLogWireframeOptional` | Header: `RigVMFunction_VisualLog.h`

Logs box shape - recording for Visual Logs has to be enabled to record this data

**Properties** (1):
  - `box`: `Box` — [Read-Write] The box to draw (Box)

### `unreal.RigVMFunction_VisualLogCapsule`
Inherits: `RigVMFunction_VisualLogWireframeOptional` | Header: `RigVMFunction_VisualLog.h`

Logs capsule shape - recording for Visual Logs has to be enabled to record this data

**Properties** (4):
  - `base`: `Vector` — [Read-Write] The base or origin of the capsule (Vector)
  - `half_height`: `float` — [Read-Write] Half the height of the capsule (float)
  - `radius`: `float` — [Read-Write] The radius of the capsule (float)
  - `rotation`: `Quat` — [Read-Write] The orientation of the capsule (Quat)

### `unreal.RigVMFunction_VisualLogCircle`
Inherits: `RigVMFunction_VisualLogWireframeOptional` | Header: `RigVMFunction_VisualLog.h`

Logs circle - recording for Visual Logs has to be enabled to record this data

**Properties** (4):
  - `center`: `Vector` — [Read-Write] The center of the circle (Vector)
  - `radius`: `float` — [Read-Write] The radius of the circle (float)
  - `thickness`: `float` — [Read-Write] The thickness the circle (float)
  - `up_axis`: `Vector` — [Read-Write] The up axis/normal of the circleâs plane (Vector)

### `unreal.RigVMFunction_VisualLogCone`
Inherits: `RigVMFunction_VisualLogWireframeOptional` | Header: `RigVMFunction_VisualLog.h`

Logs cone shape - recording for Visual Logs has to be enabled to record this data

**Properties** (4):
  - `angle`: `float` — [Read-Write] The angle of the cone (float)
  - `direction`: `Vector` — [Read-Write] The direction of the cone (Vector)
  - `length`: `float` — [Read-Write] The length of the cone (float)
  - `origin`: `Vector` — [Read-Write] The origin of the cone (Vector)

### `unreal.RigVMFunction_VisualLogCylinder`
Inherits: `RigVMFunction_VisualLogWireframeOptional` | Header: `RigVMFunction_VisualLog.h`

Logs cylinder shape - recording for Visual Logs has to be enabled to record this data

**Properties** (3):
  - `end`: `Vector` — [Read-Write] The end of the line segment forming the cylinder (Vector)
  - `radius`: `float` — [Read-Write] The radius of the cylinder (float)
  - `start`: `Vector` — [Read-Write] The start of the line segment forming the cylinder (Vector)

### `unreal.RigVMFunction_VisualLogLocation`
Inherits: `RigVMFunction_VisualLogObject` | Header: `RigVMFunction_VisualLog.h`

Logs location as sphere with given radius - recording for Visual Logs has to be enabled to record this data

**Properties** (2):
  - `location`: `Vector` — [Read-Write] The location to log (Vector)
  - `radius`: `float` — [Read-Write] The radius of the sphere to log the location with (float)

### `unreal.RigVMFunction_VisualLogObject`
Inherits: `RigVMFunction_VisualLogBase` | Header: `RigVMFunction_VisualLog.h`

Base RigVMFunction for visual logging of objects

**Properties** (1):
  - `object_color`: `LinearColor` — [Read-Write] The color of the logged object (LinearColor)

### `unreal.RigVMFunction_VisualLogOrientedBox`
Inherits: `RigVMFunction_VisualLogWireframeOptional` | Header: `RigVMFunction_VisualLog.h`

Logs oriented box shape - recording for Visual Logs has to be enabled to record this data

**Properties** (2):
  - `box`: `Box` — [Read-Write] The box to draw (Box)
  - `transform`: `Transform` — [Read-Write] The transform of the box (Transform)

### `unreal.RigVMFunction_VisualLogSegment`
Inherits: `RigVMFunction_VisualLogObject` | Header: `RigVMFunction_VisualLog.h`

Logs segment - recording for Visual Logs has to be enabled to record this data

**Properties** (3):
  - `segment_end`: `Vector` — [Read-Write] The end of the line segment (Vector)
  - `segment_start`: `Vector` — [Read-Write] The start of the line segment (Vector)
  - `thickness`: `float` — [Read-Write] The thickness the circle (float)

### `unreal.RigVMFunction_VisualLogSphere`
Inherits: `RigVMFunction_VisualLogWireframeOptional` | Header: `RigVMFunction_VisualLog.h`

Logs sphere shape - recording for Visual Logs has to be enabled to record this data

**Properties** (2):
  - `center`: `Vector` — [Read-Write] The centre of the sphere (Vector)
  - `radius`: `float` — [Read-Write] The radius of the sphere (float)

### `unreal.RigVMFunction_VisualLogText`
Inherits: `RigVMFunction_VisualLogBase` | Header: `RigVMFunction_VisualLog.h`

Logs simple text string with Visual Logger - recording for Visual Logs has to be enabled to record this data

### `unreal.RigVMFunction_VisualLogWireframeOptional`
Inherits: `RigVMFunction_VisualLogObject` | Header: `RigVMFunction_VisualLog.h`

Base RigVMFunction for visual logging of objects that can be wirefame

**Properties** (1):
  - `wireframe`: `bool` — [Read-Write] Whether to display as wireframe (bool)

### `unreal.RigVMFunctionCompilationData`
Inherits: `StructBase` | Header: `RigVMGraphFunctionDefinition.h`

Rig VMFunction Compilation Data

### `unreal.RigVMGraphFunctionArgument`
Inherits: `StructBase` | Header: `RigVMGraphFunctionDefinition.h`

Rig VMGraph Function Argument

**Properties** (8):
  - `cpp_type`: `Name` [Read-Only] — [Read-Only] (Name)
  - `cpp_type_object`: `Object` [Read-Only] — [Read-Only] (Object)
  - `default_value`: `str` [Read-Only] — [Read-Only] (str)
  - `direction`: `RigVMPinDirection` [Read-Only] — [Read-Only] (RigVMPinDirection)
  - `display_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `is_array`: `bool` [Read-Only] — [Read-Only] (bool)
  - `is_const`: `bool` [Read-Only] — [Read-Only] (bool)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.RigVMGraphFunctionData`
Inherits: `StructBase` | Header: `RigVMGraphFunctionDefinition.h`

Rig VMGraph Function Data

### `unreal.RigVMGraphFunctionHeader`
Inherits: `StructBase` | Header: `RigVMGraphFunctionDefinition.h`

Rig VMGraph Function Header

**Properties** (10):
  - `arguments`: `None` [Read-Only] — [Read-Only] (Array[RigVMGraphFunctionArgument])
  - `category`: `str` [Read-Only] — [Read-Only] (str)
  - `description`: `str` [Read-Only] — [Read-Only] (str)
  - `keywords`: `str` [Read-Only] — [Read-Only] (str)
  - `library_pointer`: `RigVMGraphFunctionIdentifier` [Read-Only] — [Read-Only] (RigVMGraphFunctionIdentifier)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `node_color`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)
  - `node_title`: `str` [Read-Only] — [Read-Only] (str)
  - `tooltip`: `Text` — [Read-Write]
deprecated: Property âTooltipâ is deprecated. (Text)
  - `variant`: `RigVMVariant` [Read-Only] — [Read-Only] (RigVMVariant)

### `unreal.RigVMGraphFunctionIdentifier`
Inherits: `StructBase` | Header: `RigVMGraphFunctionDefinition.h`

Rig VMGraph Function Identifier

**Properties** (2):
  - `host_object`: `SoftObjectPath` [Read-Only] — [Read-Only] A path to the IRigVMGraphFunctionHost that stores the function information, and compilat...
  - `library_node`: `SoftObjectPath` — [Read-Write]
deprecated: Property âLibraryNodeâ is deprecated. (SoftObjectPath)

### `unreal.RigVMInstructionSetExecuteState`
Inherits: `StructBase` | Header: `RigVMMemoryCommon.h`

A runtime cache for determining if a set of instruction has to run for this execution of the VM

### `unreal.RigVMMemoryStatistics`
Inherits: `StructBase` | Header: `RigVMStatistics.h`

Rig VMMemory Statistics

**Properties** (3):
  - `data_bytes`: `int` [Read-Only] — [Read-Only] (int32)
  - `register_count`: `int` [Read-Only] — [Read-Only] (int32)
  - `total_bytes`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.RigVMMirrorSettings`
Inherits: `StructBase` | Header: `RigVMMathLibrary.h`

Rig VMMirror Settings

**Properties** (4):
  - `axis_to_flip`: `AxisType` — [Read-Write] the axis to flip for rotations (AxisType)
  - `mirror_axis`: `AxisType` — [Read-Write] the axis to mirror against (AxisType)
  - `replace_string`: `str` — [Read-Write] the string to replace the search occurrences with (str)
  - `search_string`: `str` — [Read-Write] the string to search for (str)

### `unreal.RigVMNodeLayout`
Inherits: `StructBase` | Header: `RigVMNodeLayout.h`

Rig VMNode Layout

**Properties** (3):
  - `categories`: `None` [Read-Only] — [Read-Only] (Array[RigVMPinCategory])
  - `display_names`: `None` [Read-Only] — [Read-Only] (Map[str,str])
  - `pin_index_in_category`: `None` [Read-Only] — [Read-Only] (Map[str, int32])

### `unreal.RigVMParameter`
Inherits: `StructBase` | Header: `RigVM.h`

The RigVMParameter define an input or output of the RigVM. Parameters are mapped to work state memory registers and can be used to set input parameters as well as retrieve output parameters.

### `unreal.RigVMPinCategory`
Inherits: `StructBase` | Header: `RigVMNodeLayout.h`

Rig VMPin Category

**Properties** (3):
  - `elements`: `None` [Read-Only] — [Read-Only] (Array[str])
  - `expanded_by_default`: `bool` [Read-Only] — [Read-Only] (bool)
  - `path`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.RigVMRuntimeSettings`
Inherits: `StructBase` | Header: `RigVMExecuteContext.h`

Rig VMRuntime Settings

### `unreal.RigVMSimPoint`
Inherits: `StructBase` | Header: `RigVMMathLibrary.h`

Rig VMSim Point

### `unreal.RigVMStatistics`
Inherits: `StructBase` | Header: `RigVMStatistics.h`

Rig VMStatistics

**Properties** (7):
  - `byte_code`: `RigVMByteCodeStatistics` [Read-Only] — [Read-Only] (RigVMByteCodeStatistics)
  - `bytes_for_caching`: `int` [Read-Only] — [Read-Only] (int32)
  - `bytes_for_cdo`: `int` [Read-Only] — [Read-Only] (int32)
  - `bytes_per_instance`: `int` [Read-Only] — [Read-Only] (int32)
  - `debug_memory`: `RigVMMemoryStatistics` [Read-Only] — [Read-Only] (RigVMMemoryStatistics)
  - `literal_memory`: `RigVMMemoryStatistics` [Read-Only] — [Read-Only] (RigVMMemoryStatistics)
  - `work_memory`: `RigVMMemoryStatistics` [Read-Only] — [Read-Only] (RigVMMemoryStatistics)

### `unreal.RigVMStruct`
Inherits: `StructBase` | Header: `RigVMStruct.h`

The base class for all RigVM enabled structs.

### `unreal.RigVMStructMutable`
Inherits: `RigVMStruct` | Header: `RigVMStruct.h`

The base mutable class for all RigVM enabled structs.

**Properties** (1):
  - `execute_pin`: `RigVMExecutePin` — [Read-Write] * This property is used to chain multiple mutable nodes together (RigVMExecutePin)

### `unreal.RigVMTag`
Inherits: `StructBase` | Header: `RigVMVariant.h`

User applied tag

**Properties** (6):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `label`: `str` — [Read-Write] (str)
  - `marks_subject_as_invalid`: `bool` — [Read-Write] Enabling this will mark the subject (asset, function etc) as (soft) deprecated.
The con...
  - `name`: `Name` — [Read-Write] (Name)
  - `show_in_user_interface`: `bool` — [Read-Write] Enabling this will show tags in the user interface within
the variant widgets and other...
  - `tool_tip`: `Text` — [Read-Write] (Text)

### `unreal.RigVMTrait`
Inherits: `RigVMStruct` | Header: `RigVMTrait.h`

The base class for all RigVM traits.

### `unreal.RigVMUserWorkflow`
Inherits: `StructBase` | Header: `RigVMUserWorkflow.h`

Rig VMUser Workflow

**Properties** (5):
  - `on_perform_workflow`: `RigVMPeformUserWorkflowDynamicDelegate` — [Read-Write] (RigVMPeformUserWorkflowDynamicDelegate)
  - `options_class`: `Class` — [Read-Write] (type(Class))
  - `title`: `str` — [Read-Write] (str)
  - `tooltip`: `str` — [Read-Write] (str)
  - `type`: `RigVMUserWorkflowType` — [Read-Write] (RigVMUserWorkflowType)

### `unreal.RigVMVariant`
Inherits: `StructBase` | Header: `RigVMVariant.h`

Rig VMVariant

**Properties** (2):
  - `guid`: `Guid` [Read-Only] — [Read-Only] Guid which is shared by all variants of the same element (Guid)
  - `tags`: `None` [Read-Only] — [Read-Only] Tags applied to this variant (Array[RigVMTag])

### `unreal.RigVMVariantRef`
Inherits: `StructBase` | Header: `RigVMVariant.h`

This struct should not be serialized. It is generated on demand.

**Properties** (2):
  - `object_path`: `SoftObjectPath` [Read-Only] — [Read-Only] (SoftObjectPath)
  - `variant`: `RigVMVariant` [Read-Only] — [Read-Only] (RigVMVariant)

### `unreal.DataAssetLink`
Inherits: `NameSpacedUserData` | Header: `RigVMAssetUserData.h`

Namespaced user data which provides access to a linked data asset

**Properties** (1):
  - `data_asset`: `DataAsset` — [Read-Write] If assigned, the data asset link will provide access to the data assetâs content. (Da...

### `unreal.NameSpacedUserData`
Inherits: `AssetUserData` | Header: `RigVMAssetUserData.h`

User data that can be attached to assets to provide namespaced data access.

### `unreal.RigVM`
Inherits: `Object` | Header: `RigVM.h`

The RigVM is the main object for evaluating FRigVMByteCode instructions. It combines the byte code, a list of required function pointers for execute instructions and required memory in one class.

**Methods** (22):
  - `execute(entry_name = 'None')` -> `RigVMExtendedExecuteContext or None` — Execute deprecated: This function has been deprecated and it is no longer supported.
  - `get_parameter_value_bool(parameter_name, array_index = 0)` -> `bool` — Get Parameter Value Bool deprecated: This function has been deprecated and it is no longer supported, please, update you...
  - `get_parameter_value_double(parameter_name, array_index = 0)` -> `double` — Get Parameter Value Double deprecated: This function has been deprecated and it is no longer supported, please, update y...
  - `get_parameter_value_float(parameter_name, array_index = 0)` -> `float` — Get Parameter Value Float deprecated: This function has been deprecated and it is no longer supported, please, update yo...
  - `get_parameter_value_int(parameter_name, array_index = 0)` -> `int32` — Get Parameter Value Int deprecated: This function has been deprecated and it is no longer supported, please, update your...
  - `get_parameter_value_name(parameter_name, array_index = 0)` -> `Name` — Get Parameter Value Name deprecated: This function has been deprecated and it is no longer supported, please, update you...
  - `get_parameter_value_quat(parameter_name, array_index = 0)` -> `Quat` — Get Parameter Value Quat deprecated: This function has been deprecated and it is no longer supported, please, update you...
  - `get_parameter_value_string(parameter_name, array_index = 0)` -> `str` — Get Parameter Value String deprecated: This function has been deprecated and it is no longer supported, please, update y...
  - `get_parameter_value_transform(parameter_name, array_index = 0)` -> `Transform` — Get Parameter Value Transform deprecated: This function has been deprecated and it is no longer supported, please, updat...
  - `get_parameter_value_vector(parameter_name, array_index = 0)` -> `Vector` — Get Parameter Value Vector deprecated: This function has been deprecated and it is no longer supported, please, update y...
  - `get_parameter_value_vector2d(parameter_name, array_index = 0)` -> `Vector2D` — Get Parameter Value Vector 2D deprecated: This function has been deprecated and it is no longer supported, please, updat...
  - `get_statistics()` -> `RigVMStatistics` — returns the statistics information deprecated: Function âGetStatisticsâ is deprecated.
  - `set_parameter_value_bool(parameter_name, value, array_index = 0)` -> `None` — Set Parameter Value Bool deprecated: This function has been deprecated and it is no longer supported, please, update you...
  - `set_parameter_value_double(parameter_name, value, array_index = 0)` -> `None` — Set Parameter Value Double deprecated: This function has been deprecated and it is no longer supported, please, update y...
  - `set_parameter_value_float(parameter_name, value, array_index = 0)` -> `None` — Set Parameter Value Float deprecated: This function has been deprecated and it is no longer supported, please, update yo...
  - `set_parameter_value_int(parameter_name, value, array_index = 0)` -> `None` — Set Parameter Value Int deprecated: This function has been deprecated and it is no longer supported, please, update your...
  - `set_parameter_value_name(parameter_name, value, array_index = 0)` -> `None` — Set Parameter Value Name deprecated: This function has been deprecated and it is no longer supported, please, update you...
  - `set_parameter_value_quat(parameter_name, value, array_index = 0)` -> `None` — Set Parameter Value Quat deprecated: This function has been deprecated and it is no longer supported, please, update you...
  - `set_parameter_value_string(parameter_name, value, array_index = 0)` -> `None` — Set Parameter Value String deprecated: This function has been deprecated and it is no longer supported, please, update y...
  - `set_parameter_value_transform(parameter_name, value, array_index = 0)` -> `None` — Set Parameter Value Transform deprecated: This function has been deprecated and it is no longer supported, please, updat...
  - `set_parameter_value_vector(parameter_name, value, array_index = 0)` -> `None` — Set Parameter Value Vector deprecated: This function has been deprecated and it is no longer supported, please, update y...
  - `set_parameter_value_vector2d(parameter_name, value, array_index = 0)` -> `None` — Set Parameter Value Vector 2D deprecated: This function has been deprecated and it is no longer supported, please, updat...

**Properties** (3):
  - `debug_memory_storage_object`: `RigVMMemoryStorage` — [Read-Write] Deprecated 5.4,
deprecated: Please use DefaultDebugMemoryStorage for compiling and Debu...
  - `literal_memory_storage_object`: `RigVMMemoryStorage` — [Read-Write] Deprecated 5.4
deprecated: Please, use LiteralMemoryStorage (RigVMMemoryStorage)
  - `work_memory_storage_object`: `RigVMMemoryStorage` — [Read-Write] Deprecated 5.4
deprecated: Please, use DefaultWorkMemoryStorage for compiling and WorkM...

### `unreal.RigVMHost`
Inherits: `Object` | Header: `RigVMHost.h`

set this to something larger than 0 to profile N runs

**Methods** (26):
  - `add_asset_user_data_of_class(user_data_class)` -> `bool` — Creates and adds an instance of the provided AssetUserData class to the target asset.
  - `can_execute()` -> `bool` — Is valid for execution
  - `execute(event_name)` -> `bool` — Execute
  - `execute_event(event_name)` -> `bool` — Execute a user defined event
  - `find_rig_vm_hosts(outer, optional_class)` -> `Array [ RigVMHost ]` [classmethod] — Find Rig VMHosts
  - `get_absolute_time()` -> `float` — Gets the current absolute time
  - `get_asset_user_data_of_class(user_data_class)` -> `AssetUserData` — Returns an instance of the provided AssetUserData class if itâs contained in the target asset.
  - `get_current_frames_per_second()` -> `float` — Returns the current frames per second (this may change over time)
  - `get_delta_time()` -> `float` — Gets the current delta time
  - `get_extended_execute_context()` -> `RigVMExtendedExecuteContext` — Get Extended Execute Context deprecated: This function has been deprecated and it is no longer supported.
  - `get_script_accessible_variables()` -> `Array [ Name ]` — Returns the names of variables accessible in scripting
  - `get_supported_events()` -> `Array [ Name ]` — Get Supported Events
  - `get_variable_as_string(variable_name)` -> `str` — Returns the value of a given variable as a string
  - `get_variable_type(variable_name)` -> `Name` — Returns the type of a given variable
  - `get_vm()` -> `RigVM` — Get VM
  - `has_asset_user_data_of_class(user_data_class)` -> `bool` — Checks whether or not an instance of the provided AssetUserData class is contained.
  - `is_init_required()` -> `bool` — Returns true if this host requires the VM memory to be initialized
  - `remove_run_once_event(event_name)` -> `bool` — Removes an event running once
  - `request_init()` -> `None` — Requests to perform an init during the next execution
  - `request_run_once_event(event_name, event_index = -1)` -> `None` — Requests to run an event once
  - `set_absolute_and_delta_time(absolute_time, delta_time)` -> `None` — Set the current absolute and delta times
  - `set_absolute_time(absolute_time, set_delta_time_zero = False)` -> `None` — Set the current absolute time
  - `set_delta_time(delta_time)` -> `None` — Set the current delta time
  - `set_frames_per_second(frames_per_second)` -> `None` — Set the current fps
  - `set_variable_from_string(variable_name, value)` -> `bool` — Returns the value of a given variable as a string
  - `supports_event(event_name)` -> `bool` — Supports Event

### `unreal.RigVMMemoryStorage`
Inherits: `Object` | Header: `RigVMMemoryStorage.h`

The URigVMMemoryStorage represents an instance of heterogeneous memory. The memory layout is defined by the URigVMMemoryStorageGeneratorClass.

### `unreal.RigVMNativized`
Inherits: `RigVM` | Header: `RigVMNativized.h`

Rig VMNativized

### `unreal.RigVMProjectSettings`
Inherits: `DeveloperSettings` | Header: `RigVMSettings.h`

Rig VMProject Settings

**Methods** (1):
  - `get_tag(tag_name)` -> `RigVMTag` — Get Tag

### `unreal.RigVMUserWorkflowOptions`
Inherits: `Object` | Header: `RigVMUserWorkflow.h`

Rig VMUser Workflow Options

**Methods** (5):
  - `is_valid()` -> `bool` — Is Valid
  - `report_error(message)` -> `None` — Report Error
  - `report_info(message)` -> `None` — Report Info
  - `report_warning(message)` -> `None` — Report Warning
  - `requires_dialog()` -> `bool` — Requires Dialog

**Properties** (2):
  - `subject`: `Object` [Read-Only] — [Read-Only] (Object)
  - `workflow`: `RigVMUserWorkflow` [Read-Only] — [Read-Only] (RigVMUserWorkflow)

### `unreal.RBFKernelType`
Inherits: `EnumBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

Function to use for each target falloff

**Properties** (5):
  - `CUBIC`: `RBFKernelType = Ellipsis` — 3
  - `EXPONENTIAL`: `RBFKernelType = Ellipsis` — 1
  - `GAUSSIAN`: `RBFKernelType = Ellipsis` — 0
  - `LINEAR`: `RBFKernelType = Ellipsis` — 2
  - `QUINTIC`: `RBFKernelType = Ellipsis` — 4

### `unreal.RBFQuatDistanceType`
Inherits: `EnumBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

**Properties** (4):
  - `ARC_LENGTH`: `RBFQuatDistanceType = Ellipsis` — 1
  - `EUCLIDEAN`: `RBFQuatDistanceType = Ellipsis` — 0
  - `SWING_ANGLE`: `RBFQuatDistanceType = Ellipsis` — 2
  - `TWIST_ANGLE`: `RBFQuatDistanceType = Ellipsis` — 3

### `unreal.RBFVectorDistanceType`
Inherits: `EnumBase` | Header: `RigVMFunction_MathRBFInterpolate.h`

**Properties** (3):
  - `ARC_LENGTH`: `RBFVectorDistanceType = Ellipsis` — 2
  - `EUCLIDEAN`: `RBFVectorDistanceType = Ellipsis` — 0
  - `MANHATTAN`: `RBFVectorDistanceType = Ellipsis` — 1

### `unreal.RigUnitDebugPointMode`
Inherits: `EnumBase` | Header: `RigVMFunction_DebugPoint.h`

ERig Unit Debug Point Mode

**Properties** (2):
  - `POINT`: `RigUnitDebugPointMode = Ellipsis` — Draw as point 0
  - `VECTOR`: `RigUnitDebugPointMode = Ellipsis` — Draw as vector 1

### `unreal.RigUnitDebugTransformMode`
Inherits: `EnumBase` | Header: `RigVMFunction_DebugTransform.h`

ERig Unit Debug Transform Mode

**Properties** (3):
  - `AXES`: `RigUnitDebugTransformMode = Ellipsis` — Draw as axes 1
  - `BOX`: `RigUnitDebugTransformMode = Ellipsis` — Draw as box 2
  - `POINT`: `RigUnitDebugTransformMode = Ellipsis` — Draw as point 0

### `unreal.RigUnitVisualDebugPointMode`
Inherits: `EnumBase` | Header: `RigVMFunction_VisualDebug.h`

ERig Unit Visual Debug Point Mode

**Properties** (2):
  - `POINT`: `RigUnitVisualDebugPointMode = Ellipsis` — Draw as point 0
  - `VECTOR`: `RigUnitVisualDebugPointMode = Ellipsis` — Draw as vector 1

### `unreal.RigVMAnimEasingType`
Inherits: `EnumBase` | Header: `RigVMMathLibrary.h`

ERig VMAnim Easing Type

**Properties** (31):
  - `BACK_EASE_IN`: `RigVMAnimEasingType = Ellipsis` — 25
  - `BACK_EASE_IN_OUT`: `RigVMAnimEasingType = Ellipsis` — 27
  - `BACK_EASE_OUT`: `RigVMAnimEasingType = Ellipsis` — 26
  - `BOUNCE_EASE_IN`: `RigVMAnimEasingType = Ellipsis` — 28
  - `BOUNCE_EASE_IN_OUT`: `RigVMAnimEasingType = Ellipsis` — 30
  - `BOUNCE_EASE_OUT`: `RigVMAnimEasingType = Ellipsis` — 29
  - `CIRCULAR_EASE_IN`: `RigVMAnimEasingType = Ellipsis` — 16
  - `CIRCULAR_EASE_IN_OUT`: `RigVMAnimEasingType = Ellipsis` — 18
  - `CIRCULAR_EASE_OUT`: `RigVMAnimEasingType = Ellipsis` — 17
  - `CUBIC_EASE_IN`: `RigVMAnimEasingType = Ellipsis` — 4
  - `CUBIC_EASE_IN_OUT`: `RigVMAnimEasingType = Ellipsis` — 6
  - `CUBIC_EASE_OUT`: `RigVMAnimEasingType = Ellipsis` — 5
  - `ELASTIC_EASE_IN`: `RigVMAnimEasingType = Ellipsis` — 22
  - `ELASTIC_EASE_IN_OUT`: `RigVMAnimEasingType = Ellipsis` — 24
  - `ELASTIC_EASE_OUT`: `RigVMAnimEasingType = Ellipsis` — 23
  - `EXPONENTIAL_EASE_IN`: `RigVMAnimEasingType = Ellipsis` — 19
  - `EXPONENTIAL_EASE_IN_OUT`: `RigVMAnimEasingType = Ellipsis` — 21
  - `EXPONENTIAL_EASE_OUT`: `RigVMAnimEasingType = Ellipsis` — 20
  - `LINEAR`: `RigVMAnimEasingType = Ellipsis` — 0
  - `QUADRATIC_EASE_IN`: `RigVMAnimEasingType = Ellipsis` — 1
  - `QUADRATIC_EASE_IN_OUT`: `RigVMAnimEasingType = Ellipsis` — 3
  - `QUADRATIC_EASE_OUT`: `RigVMAnimEasingType = Ellipsis` — 2
  - `QUARTIC_EASE_IN`: `RigVMAnimEasingType = Ellipsis` — 7
  - `QUARTIC_EASE_IN_OUT`: `RigVMAnimEasingType = Ellipsis` — 9
  - `QUARTIC_EASE_OUT`: `RigVMAnimEasingType = Ellipsis` — 8
  - `QUINTIC_EASE_IN`: `RigVMAnimEasingType = Ellipsis` — 10
  - `QUINTIC_EASE_IN_OUT`: `RigVMAnimEasingType = Ellipsis` — 12
  - `QUINTIC_EASE_OUT`: `RigVMAnimEasingType = Ellipsis` — 11
  - `SINE_EASE_IN`: `RigVMAnimEasingType = Ellipsis` — 13
  - `SINE_EASE_IN_OUT`: `RigVMAnimEasingType = Ellipsis` — 15
  - `SINE_EASE_OUT`: `RigVMAnimEasingType = Ellipsis` — 14

### `unreal.RigVMClampSpatialMode`
Inherits: `EnumBase` | Header: `RigVMFunctionDefines.h`

ERig VMClamp Spatial Mode

**Properties** (4):
  - `CAPSULE`: `RigVMClampSpatialMode = Ellipsis` — 3
  - `CYLINDER`: `RigVMClampSpatialMode = Ellipsis` — 1
  - `PLANE`: `RigVMClampSpatialMode = Ellipsis` — 0
  - `SPHERE`: `RigVMClampSpatialMode = Ellipsis` — 2

### `unreal.RigVMDrawSettings`
Inherits: `EnumBase` | Header: `RigVMDrawInstruction.h`

ERig VMDraw Settings

**Properties** (4):
  - `DYNAMIC_MESH`: `RigVMDrawSettings = Ellipsis` — 3
  - `LINES`: `RigVMDrawSettings = Ellipsis` — 1
  - `LINE_STRIP`: `RigVMDrawSettings = Ellipsis` — 2
  - `POINTS`: `RigVMDrawSettings = Ellipsis` — 0

### `unreal.RigVMFunctionArgumentDirection`
Inherits: `EnumBase` | Header: `RigVMFunction.h`

The Function Argument is used to differentiate different kinds of pins in the data flow graph - inputs or outputs

**Properties** (3):
  - `INPUT`: `RigVMFunctionArgumentDirection = Ellipsis` — 0
  - `INVALID`: `RigVMFunctionArgumentDirection = Ellipsis` — A mutable output value 2
  - `OUTPUT`: `RigVMFunctionArgumentDirection = Ellipsis` — A const input value 1

### `unreal.RigVMOpCode`
Inherits: `EnumBase` | Header: `RigVMByteCode.h`

The code for a single operation within the RigVM

**Properties** (107):
  - `ARRAY_ADD`: `RigVMOpCode = Ellipsis` — (DEPRECATED) sets an array element by index (ternary op, in out array, in int32, in element) 88
  - `ARRAY_APPEND`: `RigVMOpCode = Ellipsis` — (DEPRECATED) finds and returns the index of an element (quaternery op, in array, in element, out int...
  - `ARRAY_CLONE`: `RigVMOpCode = Ellipsis` — (DEPRECATED) appends an array to another (binary op, in out array, in array) 93
  - `ARRAY_DIFFERENCE`: `RigVMOpCode = Ellipsis` — (DEPRECATED) merges two arrays while avoiding duplicates (binary op, in out array, in other array) 9...
  - `ARRAY_FIND`: `RigVMOpCode = Ellipsis` — (DEPRECATED) removes an element from an array (binary op, in out array, in inindex) 91
  - `ARRAY_GET_AT_INDEX`: `RigVMOpCode = Ellipsis` — (DEPRECATED) resizes an array (binary op, in out array, in int32) 86
  - `ARRAY_GET_NUM`: `RigVMOpCode = Ellipsis` — (DEPRECATED) clears an array and resets its content 84
  - `ARRAY_INSERT`: `RigVMOpCode = Ellipsis` — (DEPRECATED) adds an element to an array (ternary op, in out array, in element, out int32 index) 89
  - `ARRAY_INTERSECTION`: `RigVMOpCode = Ellipsis` — (DEPRECATED) returns a new array containing elements only found in one array (ternary op, in array, ...
  - `ARRAY_ITERATOR`: `RigVMOpCode = Ellipsis` — (DEPRECATED) clones an array (binary op, in array, out array) 94
  - `ARRAY_REMOVE`: `RigVMOpCode = Ellipsis` — (DEPRECATED) inserts an element to an array (ternary op, in out array, in int32, in element) 90
  - `ARRAY_RESET`: `RigVMOpCode = Ellipsis` — ends the last memory slice / block 83
  - `ARRAY_REVERSE`: `RigVMOpCode = Ellipsis` — (DEPRECATED) returns a new array containing elements found in both of the input arrays (ternary op, ...
  - `ARRAY_SET_AT_INDEX`: `RigVMOpCode = Ellipsis` — (DEPRECATED) returns an array element by index (ternary op, in array, in int32, out element) 87
  - `ARRAY_SET_NUM`: `RigVMOpCode = Ellipsis` — (DEPRECATED) reads and returns the size of an array (binary op, in array, out int32) 85
  - `ARRAY_UNION`: `RigVMOpCode = Ellipsis` — (DEPRECATED) iterates over an array (senary op, in array, out element, out index, out count, out rat...
  - `BEGIN_BLOCK`: `RigVMOpCode = Ellipsis` — exit the execution loop 81
  - `BOOL_FALSE`: `RigVMOpCode = Ellipsis` — zero the memory of a given register 66
  - `BOOL_TRUE`: `RigVMOpCode = Ellipsis` — set a given register to false 67
  - `CHANGE_TYPE`: `RigVMOpCode = Ellipsis` — jump backwards given a relative instruction index offset based on a condition register 79
  - `COPY`: `RigVMOpCode = Ellipsis` — set a given register to true 68
  - `DECREMENT`: `RigVMOpCode = Ellipsis` — increment a int32 register 70
  - `END_BLOCK`: `RigVMOpCode = Ellipsis` — begins a new memory slice / block 82
  - `EQUALS`: `RigVMOpCode = Ellipsis` — decrement a int32 register 71
  - `EXECUTE`: `RigVMOpCode = Ellipsis` — jumps to a branch based on a name operand 101
  - `EXECUTE_0_OPERANDS`: `RigVMOpCode = Ellipsis` — 0
  - `EXECUTE_10_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 9 operands 10
  - `EXECUTE_11_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 10 operands 11
  - `EXECUTE_12_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 11 operands 12
  - `EXECUTE_13_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 12 operands 13
  - `EXECUTE_14_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 13 operands 14
  - `EXECUTE_15_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 14 operands 15
  - `EXECUTE_16_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 15 operands 16
  - `EXECUTE_17_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 16 operands 17
  - `EXECUTE_18_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 17 operands 18
  - `EXECUTE_19_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 18 operands 19
  - `EXECUTE_1_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 0 operands 1
  - `EXECUTE_20_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 19 operands 20
  - `EXECUTE_21_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 20 operands 21
  - `EXECUTE_22_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 21 operands 22
  - `EXECUTE_23_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 22 operands 23
  - `EXECUTE_24_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 23 operands 24
  - `EXECUTE_25_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 24 operands 25
  - `EXECUTE_26_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 25 operands 26
  - `EXECUTE_27_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 26 operands 27
  - `EXECUTE_28_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 27 operands 28
  - `EXECUTE_29_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 28 operands 29
  - `EXECUTE_2_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 1 operands 2
  - `EXECUTE_30_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 29 operands 30
  - `EXECUTE_31_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 30 operands 31
  - `EXECUTE_32_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 31 operands 32
  - `EXECUTE_33_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 32 operands 33
  - `EXECUTE_34_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 33 operands 34
  - `EXECUTE_35_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 34 operands 35
  - `EXECUTE_36_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 35 operands 36
  - `EXECUTE_37_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 36 operands 37
  - `EXECUTE_38_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 37 operands 38
  - `EXECUTE_39_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 38 operands 39
  - `EXECUTE_3_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 2 operands 3
  - `EXECUTE_40_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 39 operands 40
  - `EXECUTE_41_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 40 operands 41
  - `EXECUTE_42_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 41 operands 42
  - `EXECUTE_43_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 42 operands 43
  - `EXECUTE_44_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 43 operands 44
  - `EXECUTE_45_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 44 operands 45
  - `EXECUTE_46_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 45 operands 46
  - `EXECUTE_47_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 46 operands 47
  - `EXECUTE_48_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 47 operands 48
  - `EXECUTE_49_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 48 operands 49
  - `EXECUTE_4_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 3 operands 4
  - `EXECUTE_50_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 49 operands 50
  - `EXECUTE_51_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 50 operands 51
  - `EXECUTE_52_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 51 operands 52
  - `EXECUTE_53_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 52 operands 53
  - `EXECUTE_54_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 53 operands 54
  - `EXECUTE_55_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 54 operands 55
  - `EXECUTE_56_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 55 operands 56
  - `EXECUTE_57_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 56 operands 57
  - `EXECUTE_58_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 57 operands 58
  - `EXECUTE_59_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 58 operands 59
  - `EXECUTE_5_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 4 operands 5
  - `EXECUTE_60_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 59 operands 60
  - `EXECUTE_61_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 60 operands 61
  - `EXECUTE_62_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 61 operands 62
  - `EXECUTE_63_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 62 operands 63
  - `EXECUTE_64_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 63 operands 64
  - `EXECUTE_6_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 5 operands 6
  - `EXECUTE_7_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 6 operands 7
  - `EXECUTE_8_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 7 operands 8
  - `EXECUTE_9_OPERANDS`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 8 operands 9
  - `EXIT`: `RigVMOpCode = Ellipsis` — change the type of a register (deprecated) 80
  - `FIRST_ARRAY_OP_CODE`: `RigVMOpCode = Ellipsis` — 83
  - `INCREMENT`: `RigVMOpCode = Ellipsis` — copy the content of one register to another 69
  - `INVALID`: `RigVMOpCode = Ellipsis` — sets up a list of traits on executecontext 104
  - `INVOKE_ENTRY`: `RigVMOpCode = Ellipsis` — (DEPRECATED) returns the reverse of the input array (unary op, in out array) 99
  - `JUMP_ABSOLUTE`: `RigVMOpCode = Ellipsis` — fill a bool register with the result of (A != B) 73
  - `JUMP_ABSOLUTE_IF`: `RigVMOpCode = Ellipsis` — jump backwards given a relative instruction index offset 76
  - `JUMP_BACKWARD`: `RigVMOpCode = Ellipsis` — jump forwards given a relative instruction index offset 75
  - `JUMP_BACKWARD_IF`: `RigVMOpCode = Ellipsis` — jump forwards given a relative instruction index offset based on a condition register 78
  - `JUMP_FORWARD`: `RigVMOpCode = Ellipsis` — jump to an absolute instruction index 74
  - `JUMP_FORWARD_IF`: `RigVMOpCode = Ellipsis` — jump to an absolute instruction index based on a condition register 77
  - `JUMP_TO_BRANCH`: `RigVMOpCode = Ellipsis` — invokes an entry from the entry list 100
  - `LAST_ARRAY_OP_CODE`: `RigVMOpCode = Ellipsis` — 98
  - `NOT_EQUALS`: `RigVMOpCode = Ellipsis` — fill a bool register with the result of (A == B) 72
  - `RUN_INSTRUCTIONS`: `RigVMOpCode = Ellipsis` — single execute op (formerly Execute_0_Operands to Execute_64_Operands) 102
  - `SETUP_TRAITS`: `RigVMOpCode = Ellipsis` — runs a set of instructions lazily 103
  - `ZERO`: `RigVMOpCode = Ellipsis` — (DEPRECATED) execute a rig function with 64 operands 65

### `unreal.RigVMParameterType`
Inherits: `EnumBase` | Header: `RigVM.h`

The type of parameter for a VM

**Properties** (3):
  - `INPUT`: `RigVMParameterType = Ellipsis` — 0
  - `INVALID`: `RigVMParameterType = Ellipsis` — 2
  - `OUTPUT`: `RigVMParameterType = Ellipsis` — 1

### `unreal.RigVMPinDirection`
Inherits: `EnumBase` | Header: `RigVMFunction.h`

The Pin Direction is used to differentiate different kinds of pins in the data flow graph - inputs, outputs etc.

**Properties** (6):
  - `HIDDEN`: `RigVMPinDirection = Ellipsis` — A const value that cannot be connected to 4
  - `INPUT`: `RigVMPinDirection = Ellipsis` — 0
  - `INVALID`: `RigVMPinDirection = Ellipsis` — A mutable hidden value (used for interal state) 5
  - `IO`: `RigVMPinDirection = Ellipsis` — A mutable output value 2
  - `OUTPUT`: `RigVMPinDirection = Ellipsis` — A const input value 1
  - `VISIBLE`: `RigVMPinDirection = Ellipsis` — A mutable input and output value 3

### `unreal.RigVMSimPointIntegrateType`
Inherits: `EnumBase` | Header: `RigVMMathLibrary.h`

ERig VMSim Point Integrate Type

**Properties** (2):
  - `SEMI_EXPLICIT_EULER`: `RigVMSimPointIntegrateType = Ellipsis` — 1
  - `VERLET`: `RigVMSimPointIntegrateType = Ellipsis` — 0

### `unreal.RigVMTransformSpace`
Inherits: `EnumBase` | Header: `RigVMFunctionDefines.h`

ERig VMTransform Space

**Properties** (2):
  - `GLOBAL_SPACE`: `RigVMTransformSpace = Ellipsis` — Apply in rig space 1
  - `LOCAL_SPACE`: `RigVMTransformSpace = Ellipsis` — Apply in parent space 0

### `unreal.RigVMUserWorkflowType`
Inherits: `EnumBase` | Header: `RigVMUserWorkflow.h`

Types of workflows offered by a rigvm struct node

**Properties** (5):
  - `ALL`: `RigVMUserWorkflowType = Ellipsis` — 15
  - `NODE_CONTEXT`: `RigVMUserWorkflowType = Ellipsis` — 1
  - `NODE_CONTEXT_BUTTON`: `RigVMUserWorkflowType = Ellipsis` — 8
  - `ON_PIN_DEFAULT_CHANGED`: `RigVMUserWorkflowType = Ellipsis` — 4
  - `PIN_CONTEXT`: `RigVMUserWorkflowType = Ellipsis` — 2

### `unreal.RigVMPeformUserWorkflowDynamicDelegate`
Inherits: `DelegateBase` | Header: `RigVMUserWorkflow.h`

Rig VMPeform User Workflow Dynamic Delegate Delegate Signature
