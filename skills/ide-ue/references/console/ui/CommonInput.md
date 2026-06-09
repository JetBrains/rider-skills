# UE Python API — CommonInput Module

**14 types** from the `CommonInput` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CommonInputKeyBrushConfiguration`, `CommonInputKeySetBrushConfiguration`, `InputDeviceIdentifierPair`, `InputHoldData`, `CommonInputActionDomain`, `CommonInputActionDomainTable`, `CommonInputBaseControllerData`, `CommonInputSubsystem`, `CommonUIHoldData`, `CommonUIInputData`, `CommonInputEventFlowBehavior`, `CommonInputMode`, `CommonInputType`, `InputMethodChangedDelegate`

---

## Classes

### `unreal.CommonInputKeyBrushConfiguration`
Inherits: `StructBase` | Header: `CommonInputBaseTypes.h`

Common Input Key Brush Configuration

### `unreal.CommonInputKeySetBrushConfiguration`
Inherits: `StructBase` | Header: `CommonInputBaseTypes.h`

Common Input Key Set Brush Configuration

### `unreal.InputDeviceIdentifierPair`
Inherits: `StructBase` | Header: `CommonInputBaseTypes.h`

Input Device Identifier Pair

### `unreal.InputHoldData`
Inherits: `StructBase` | Header: `CommonInputBaseTypes.h`

Data values needed for Hold interaction per input type.

### `unreal.CommonInputActionDomain`
Inherits: `DataAsset` | Header: `CommonInputActionDomain.h`

Describes an input-event handling domain. Itâs InnerBehavior determines how events flow between widgets within the domain and Behavior determines how events will flow to other Domains in the DomainT...

### `unreal.CommonInputActionDomainTable`
Inherits: `DataAsset` | Header: `CommonInputActionDomain.h`

An ordered array of ActionDomains.

**Properties** (1):
  - `action_domains`: `None` [Read-Only] — [Read-Only] Domains will receive events in ascending index order (Array[CommonInputActionDomain])

### `unreal.CommonInputBaseControllerData`
Inherits: `Object` | Header: `CommonInputBaseTypes.h`

Derive from this class to store the Input data. It is referenced in the Common Input Settings, found in the project settings UI.

### `unreal.CommonInputSubsystem`
Inherits: `LocalPlayerSubsystem` | Header: `CommonInputSubsystem.h`

Common Input Subsystem

**Methods** (8):
  - `get_current_gamepad_name()` -> `Name` — Get Current Gamepad Name
  - `get_current_input_type()` -> `CommonInputType` — The current input type based on the last input received on the device.
  - `get_default_input_type()` -> `CommonInputType` — The default input type for the current platform.
  - `is_input_method_active(input_method)` -> `bool` — Is Input Method Active
  - `is_using_pointer_input()` -> `bool` — Is Using Pointer Input
  - `set_current_input_type(new_input_type)` -> `None` — Set Current Input Type
  - `set_gamepad_input_type(gamepad_input_type)` -> `None` — Set Gamepad Input Type
  - `should_show_input_keys()` -> `bool` — Should display indicators for the current input device on screen. This is needed when capturing videos, but we donât w...

**Properties** (1):
  - `on_input_method_changed`: `InputMethodChangedDelegate` — [Read-Write] (InputMethodChangedDelegate)

### `unreal.CommonUIHoldData`
Inherits: `Object` | Header: `CommonInputBaseTypes.h`

Defines values for hold behavior per input type: for mouse Press and Hold, for gamepad focused Press and Hold, for touch Press and Hold.

### `unreal.CommonUIInputData`
Inherits: `Object` | Header: `CommonInputBaseTypes.h`

Derive from this class to store the Input data. It is referenced in the Common Input Settings, found in the project settings UI.

### `unreal.CommonInputEventFlowBehavior`
Inherits: `EnumBase` | Header: `CommonInputActionDomain.h`

ECommon Input Event Flow Behavior

**Properties** (3):
  - `BLOCK_IF_ACTIVE`: `CommonInputEventFlowBehavior = Ellipsis` — 0
  - `BLOCK_IF_HANDLED`: `CommonInputEventFlowBehavior = Ellipsis` — 1
  - `NEVER_BLOCK`: `CommonInputEventFlowBehavior = Ellipsis` — 2

### `unreal.CommonInputMode`
Inherits: `EnumBase` | Header: `CommonInputModeTypes.h`

ECommon Input Mode

**Properties** (3):
  - `ALL`: `CommonInputMode = Ellipsis` — Input is received by UI and the Game 2
  - `GAME`: `CommonInputMode = Ellipsis` — Input is received by the Game only 1
  - `MENU`: `CommonInputMode = Ellipsis` — Input is received by the UI only 0

### `unreal.CommonInputType`
Inherits: `EnumBase` | Header: `CommonInputTypeEnum.h`

ECommon Input Type

**Properties** (4):
  - `COUNT`: `CommonInputType = Ellipsis` — 3
  - `GAMEPAD`: `CommonInputType = Ellipsis` — 1
  - `MOUSE_AND_KEYBOARD`: `CommonInputType = Ellipsis` — 0
  - `TOUCH`: `CommonInputType = Ellipsis` — 2

### `unreal.InputMethodChangedDelegate`
Inherits: `MulticastDelegateBase` | Header: `CommonInputSubsystem.h`

Input Method Changed Delegate Delegate Signature
