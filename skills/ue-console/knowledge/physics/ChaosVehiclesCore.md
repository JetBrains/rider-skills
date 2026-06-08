# UE Python API — ChaosVehiclesCore Module

**7 types** from the `ChaosVehiclesCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ModuleInputSetup`, `ModuleInputValue`, `DefaultModularVehicleInputModifier`, `VehicleInputProducerBase`, `FunctionType`, `ModuleInputValueType`, `SimTreeProcessingOrder`

---

## Classes

### `unreal.ModuleInputSetup`
Inherits: `StructBase` | Header: `ModuleInput.h`

Module Input Setup

### `unreal.ModuleInputValue`
Inherits: `StructBase` | Header: `ModuleInput.h`

Module Input Value

### `unreal.DefaultModularVehicleInputModifier`
Inherits: `Object` | Header: `ModuleInput.h`

Default Modular Vehicle Input Modifier

### `unreal.VehicleInputProducerBase`
Inherits: `Object` | Header: `ModuleInput.h`

Vehicle Input Producer Base

### `unreal.FunctionType`
Inherits: `EnumBase` | Header: `ModuleInput.h`

Input Options

**Properties** (3):
  - `CUSTOM_CURVE`: `FunctionType = Ellipsis` — 2
  - `LINEAR_FUNCTION`: `FunctionType = Ellipsis` — 0
  - `SQUARED_FUNCTION`: `FunctionType = Ellipsis` — 1

### `unreal.ModuleInputValueType`
Inherits: `EnumBase` | Header: `ModuleInput.h`

EModule Input Value Type

**Properties** (5):
  - `M_AXIS1D`: `ModuleInputValueType = Ellipsis` — 1
  - `M_AXIS2D`: `ModuleInputValueType = Ellipsis` — 2
  - `M_AXIS3D`: `ModuleInputValueType = Ellipsis` — 3
  - `M_BOOLEAN`: `ModuleInputValueType = Ellipsis` — 0
  - `M_INTEGER`: `ModuleInputValueType = Ellipsis` — 4

### `unreal.SimTreeProcessingOrder`
Inherits: `EnumBase` | Header: `SimModuleTree.h`

ESim Tree Processing Order

**Properties** (4):
  - `LEAF_FIRST`: `SimTreeProcessingOrder = Ellipsis` — User calls simulate on the child modules 1
  - `LEAF_FIRST_BFS`: `SimTreeProcessingOrder = Ellipsis` — modules simulate from the root first 3
  - `MANUAL_OVERRIDE`: `SimTreeProcessingOrder = Ellipsis` — 0
  - `ROOT_FIRST`: `SimTreeProcessingOrder = Ellipsis` — modules simulation from the leaf first 2
