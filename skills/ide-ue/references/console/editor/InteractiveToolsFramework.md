# UE Python API — InteractiveToolsFramework Module

**25 types** from the `InteractiveToolsFramework` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DeviceButtonState`, `InputDeviceRay`, `InputDeviceState`, `InputRayHit`, `KeyboardInputDeviceState`, `MouseInputDeviceState`, `CombinedTransformGizmoActor`, `GizmoActor`, `GizmoArrowComponent`, `GizmoBaseComponent`, `GizmoBoxComponent`, `GizmoCircleComponent`, `GizmoLineHandleComponent`, `GizmoRectangleComponent`, `InteractiveTool`, `InteractiveToolBuilder`, `InteractiveToolPropertySet`, `InternalToolFrameworkActor`, `IntervalGizmoActor`, `ToolTarget`, ... (25 total)

---

## Classes

### `unreal.DeviceButtonState`
Inherits: `StructBase` | Header: `InputState.h`

Current State of a physical device button (mouse, key, etc) at a point in time. Each âclickâ of a button should involve at minimum two separate state events, one where bPressed=true and one where ...

**Properties** (5):
  - `button`: `Key` — [Read-Write] Button identifier (Key)
  - `double_clicked`: `bool` — [Read-Write] Was the button double clicked this frame. This should happen only once per âdouble cl...
  - `down`: `bool` — [Read-Write] Is the button currently pressed down. This should be true every frame the button is pre...
  - `pressed`: `bool` — [Read-Write] Was the button pressed down this frame. This should happen once per âclickâ (bool)
  - `released`: `bool` — [Read-Write] Was the button released this frame. This should happen once per âclickâ (bool)

### `unreal.InputDeviceRay`
Inherits: `StructBase` | Header: `InputState.h`

FInputDeviceRay represents a 3D ray created based on an input device. If the device is a 2D input device like a mouse, then the ray may have an associated 2D screen position.

**Properties** (3):
  - `has2d`: `bool` — [Read-Write] If true, WorldRay has 2D device position coordinates (bool)
  - `screen_position`: `Vector2D` — [Read-Write] 2D device position coordinates associated with the ray (Vector2D)
  - `world_ray`: `Ray` — [Read-Write] 3D ray in 3D scene, in world coordinates (Ray)

### `unreal.InputDeviceState`
Inherits: `StructBase` | Header: `InputState.h`

Current state of physical input devices at a point in time. Assumption is that the state refers to a single physical input device, ie InputDevice field is a single value of EInputDevices and not a com...

**Properties** (7):
  - `alt_key_down`: `bool` — [Read-Write] Is they keyboard ALT modifier key currently pressed down (bool)
  - `cmd_key_down`: `bool` — [Read-Write] Is they keyboard CMD modifier key currently pressed down (only on Apple devices) (bool)
  - `ctrl_key_down`: `bool` — [Read-Write] Is they keyboard CTRL modifier key currently pressed down (bool)
  - `input_device`: `InputDevices` — [Read-Write] Which InputDevice member is valid in this state (InputDevices)
  - `keyboard`: `KeyboardInputDeviceState` — [Read-Write] Current state of Keyboard device, if InputDevice == EInputDevices::Keyboard (KeyboardIn...
  - `mouse`: `MouseInputDeviceState` — [Read-Write] Current state of Mouse device, if InputDevice == EInputDevices::Mouse (MouseInputDevice...
  - `shift_key_down`: `bool` — [Read-Write] Is they keyboard SHIFT modifier key currently pressed down (bool)

### `unreal.InputRayHit`
Inherits: `StructBase` | Header: `InputState.h`

FInputRayHit is returned by various hit-test interface functions. Generally this is intended to be returned as the result of a hit-test with a FInputDeviceRay

**Properties** (6):
  - `has_hit_normal`: `bool` — [Read-Write] True if HitNormal was set (bool)
  - `hit`: `bool` — [Read-Write] true if ray hit something, false otherwise (bool)
  - `hit_depth`: `float` — [Read-Write] distance along ray at which intersection occurred (double)
  - `hit_identifier`: `int` — [Read-Write] Client-defined integer identifier for hit object/element/target/etc (int32)
  - `hit_normal`: `Vector` — [Read-Write] Normal at hit point, if available (Vector)
  - `hit_object`: `Object` — [Read-Write] Client-defined pointer for UObject-derived hit owners.
HitOwner and HitObject should be...

### `unreal.KeyboardInputDeviceState`
Inherits: `StructBase` | Header: `InputState.h`

Current state of active keyboard key at a point in time todo: would be useful to track set of active keys

**Properties** (1):
  - `active_key`: `DeviceButtonState` — [Read-Write] state of active key that was modified (ie press or release) (DeviceButtonState)

### `unreal.MouseInputDeviceState`
Inherits: `StructBase` | Header: `InputState.h`

Current State of a physical Mouse device at a point in time.

**Properties** (7):
  - `delta2d`: `Vector2D` — [Read-Write] Change in 2D mouse position from last state event (Vector2D)
  - `left`: `DeviceButtonState` — [Read-Write] State of the left mouse button (DeviceButtonState)
  - `middle`: `DeviceButtonState` — [Read-Write] State of the middle mouse button (DeviceButtonState)
  - `position2d`: `Vector2D` — [Read-Write] Current 2D position of the mouse, in application-defined coordinate system (Vector2D)
  - `right`: `DeviceButtonState` — [Read-Write] State of the right mouse button (DeviceButtonState)
  - `wheel_delta`: `float` — [Read-Write] Change in âticksâ of the mouse wheel since last state event (float)
  - `world_ray`: `Ray` — [Read-Write] Ray into current 3D scene at current 2D mouse position (Ray)

### `unreal.CombinedTransformGizmoActor`
Inherits: `GizmoActor` | Header: `CombinedTransformGizmo.h`

ACombinedTransformGizmoActor is an Actor type intended to be used with UCombinedTransformGizmo, as the in-scene visual representation of the Gizmo.

### `unreal.GizmoActor`
Inherits: `InternalToolFrameworkActor` | Header: `GizmoActor.h`

AGizmoActor is a base class for Actors that would be created to represent Gizmos in the scene. Currently this does not involve any special functionality, but a set of static functions are provided to ...

### `unreal.GizmoArrowComponent`
Inherits: `GizmoBaseComponent` | Header: `GizmoArrowComponent.h`

Simple Component intended to be used as part of 3D Gizmos. Currently draws the âarrowâ as a single 3D line.

### `unreal.GizmoBaseComponent`
Inherits: `PrimitiveComponent` | Header: `GizmoBaseComponent.h`

Base class for simple Components intended to be used as part of 3D Gizmos. Contains common properties and utility functions. This class does nothing by itself, use subclasses like UGizmoCircleComponen...

### `unreal.GizmoBoxComponent`
Inherits: `GizmoBaseComponent` | Header: `GizmoBoxComponent.h`

Simple Component intended to be used as part of 3D Gizmos. Draws outline of 3D Box based on parameters.

### `unreal.GizmoCircleComponent`
Inherits: `GizmoBaseComponent` | Header: `GizmoCircleComponent.h`

Simple Component intended to be used as part of 3D Gizmos. Draws a 3D circle based on parameters.

### `unreal.GizmoLineHandleComponent`
Inherits: `GizmoBaseComponent` | Header: `GizmoLineHandleComponent.h`

Simple Component intended to be used as part of 3D Gizmos. Draws line terminated by a short perpendicular handle line based on parameters.

### `unreal.GizmoRectangleComponent`
Inherits: `GizmoBaseComponent` | Header: `GizmoRectangleComponent.h`

Simple Component intended to be used as part of 3D Gizmos. Draws outline of 3D rectangle based on parameters.

### `unreal.InteractiveTool`
Inherits: `Object` | Header: `InteractiveTool.h`

UInteractiveTool is the base class for all Tools in the InteractiveToolsFramework. A Tool is is a âlightweight modeâ that may âownâ one or more Actors/Components/etc in the current scene, may ...

### `unreal.InteractiveToolBuilder`
Inherits: `Object` | Header: `InteractiveToolBuilder.h`

A UInteractiveToolBuilder creates a new instance of an InteractiveTool (basically this is a Factory). These are registered with the InteractiveToolManager, which calls BuildTool() if CanBuildTool() re...

### `unreal.InteractiveToolPropertySet`
Inherits: `Object` | Header: `InteractiveTool.h`

A UInteractiveTool contains a set of UObjects that contain âpropertiesâ of the Tool, ie the configuration flags, parameters, etc that control the Tool. Currently any UObject can be added as a prop...

### `unreal.InternalToolFrameworkActor`
Inherits: `Actor` | Header: `InteractiveToolObjects.h`

AInternalToolFrameworkActor is a base class for internal Actors that the ToolsFramework may spawn (for gizmos, mesh previews, etc). These Actors may need special-case handling, for example to prevent ...

### `unreal.IntervalGizmoActor`
Inherits: `GizmoActor` | Header: `IntervalGizmo.h`

AIntervalGizmoActor is an Actor type intended to be used with UIntervalGizmo, as the in-scene visual representation of the Gizmo.

### `unreal.ToolTarget`
Inherits: `Object` | Header: `ToolTarget.h`

A tool target is a stand-in object that a tool can operate on. It exposes the necessary interfaces to the tool.

### `unreal.ViewAdjustedStaticMeshGizmoComponent`
Inherits: `StaticMeshComponent` | Header: `ViewAdjustedStaticMeshGizmoComponent.h`

Version of a static mesh component that only takes the dynamic draw path and has the ability to adjust the transform based on view information.

### `unreal.InputDevices`
Inherits: `EnumBase` | Header: `InputState.h`

Input event data can be applicable to many possible input devices. These flags are used to indicate specific or sets of device types.

**Properties** (8):
  - `ANY_SPATIAL_DEVICE`: `InputDevices = Ellipsis` — 24
  - `GAMEPAD`: `InputDevices = Ellipsis` — 4
  - `HTC_VIVE_WANDS`: `InputDevices = Ellipsis` — 16
  - `KEYBOARD`: `InputDevices = Ellipsis` — 1
  - `MOUSE`: `InputDevices = Ellipsis` — 2
  - `NONE`: `InputDevices = Ellipsis` — 0
  - `OCULUS_TOUCH`: `InputDevices = Ellipsis` — 8
  - `TABLET_FINGERS`: `InputDevices = Ellipsis` — 1024

### `unreal.ToolContextCoordinateSystem`
Inherits: `EnumBase` | Header: `ToolContextInterfaces.h`

Types of coordinate systems that a Tool/Gizmo might use

**Properties** (3):
  - `LOCAL`: `ToolContextCoordinateSystem = Ellipsis` — Local coordinate system 1
  - `SCREEN`: `ToolContextCoordinateSystem = Ellipsis` — Screen space coordinate system 2
  - `WORLD`: `ToolContextCoordinateSystem = Ellipsis` — World space coordinate system 0

### `unreal.ToolContextTransformGizmoMode`
Inherits: `EnumBase` | Header: `ToolContextInterfaces.h`

High-level configuration options for a standard 3D translate/rotate/scale Gizmo, like is commonly used in 3D DCC tools, game editors, etc This is meant to be used to convey UI-level settings to Tools/...

**Properties** (5):
  - `COMBINED`: `ToolContextTransformGizmoMode = Ellipsis` — Show all available Gizmo sub-elements 8
  - `NO_GIZMO`: `ToolContextTransformGizmoMode = Ellipsis` — Hide all Gizmo sub-elements 0
  - `ROTATION`: `ToolContextTransformGizmoMode = Ellipsis` — Only Show Rotation sub-elements 2
  - `SCALE`: `ToolContextTransformGizmoMode = Ellipsis` — Only Show Scale sub-elements 3
  - `TRANSLATION`: `ToolContextTransformGizmoMode = Ellipsis` — Only Show Translation sub-elements 1

### `unreal.ToolShutdownType`
Inherits: `EnumBase` | Header: `InteractiveTool.h`

Passed to UInteractiveTool::Shutdown to indicate how Tool should shut itself down

**Properties** (3):
  - `ACCEPT`: `ToolShutdownType = Ellipsis` — Tool commits current preview to scene 1
  - `CANCEL`: `ToolShutdownType = Ellipsis` — Tool discards current preview without modifying scene 2
  - `COMPLETED`: `ToolShutdownType = Ellipsis` — Tool cleans up and exits. Pass this to tools that do not have Accept/Cancel options. 0
