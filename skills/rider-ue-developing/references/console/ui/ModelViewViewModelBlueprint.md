# UE Python API — ModelViewViewModelBlueprint Module

**19 types** from the `ModelViewViewModelBlueprint` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MVVMBlueprintFieldPath`, `MVVMBlueprintFunctionReference`, `MVVMBlueprintPin`, `MVVMBlueprintPinId`, `MVVMBlueprintPropertyPath`, `MVVMBlueprintViewBinding`, `MVVMBlueprintViewConversionPath`, `MVVMBlueprintViewModelContext`, `MVVMBlueprintInstancedViewModelBase`, `MVVMBlueprintView`, `MVVMBlueprintViewCondition`, `MVVMBlueprintViewConversionFunction`, `MVVMBlueprintViewEvent`, `MVVMBlueprintViewExtension`, `MVVMBlueprintViewExtension_PanelWidget`, `MVVMBlueprintFieldPathSource`, `MVVMBlueprintFunctionReferenceType`, `MVVMBlueprintPinStatus`, `MVVMBlueprintViewModelContextCreationType`

---

## Classes

### `unreal.MVVMBlueprintFieldPath`
Inherits: `StructBase` | Header: `MVVMPropertyPath.h`

A single item in a Property Path

### `unreal.MVVMBlueprintFunctionReference`
Inherits: `StructBase` | Header: `MVVMBlueprintFunctionReference.h`

A type that point to a function or a node that can be used to create a conversion function.

### `unreal.MVVMBlueprintPin`
Inherits: `StructBase` | Header: `MVVMBlueprintPin.h`

MVVMBlueprint Pin

### `unreal.MVVMBlueprintPinId`
Inherits: `StructBase` | Header: `MVVMBlueprintPin.h`

Pin name type to help with compare operation and moving it around.

### `unreal.MVVMBlueprintPropertyPath`
Inherits: `StructBase` | Header: `MVVMPropertyPath.h`

Base path to properties for MVVM view models and widgets.

### `unreal.MVVMBlueprintViewBinding`
Inherits: `StructBase` | Header: `MVVMBlueprintViewBinding.h`

MVVMBlueprint View Binding

### `unreal.MVVMBlueprintViewConversionPath`
Inherits: `StructBase` | Header: `MVVMBlueprintViewBinding.h`

MVVMBlueprint View Conversion Path

### `unreal.MVVMBlueprintViewModelContext`
Inherits: `StructBase` | Header: `MVVMBlueprintViewModelContext.h`

MVVMBlueprint View Model Context

### `unreal.MVVMBlueprintInstancedViewModelBase`
Inherits: `Object` | Header: `MVVMBlueprintInstancedViewModel.h`

MVVMBlueprint Instanced View Model Base

### `unreal.MVVMBlueprintView`
Inherits: `Object` | Header: `MVVMBlueprintView.h`

MVVMBlueprint View

### `unreal.MVVMBlueprintViewCondition`
Inherits: `Object` | Header: `MVVMBlueprintViewCondition.h`

Binding for an event that MVVM will listen too. Does not imply the MVVM graph itself will use events.

### `unreal.MVVMBlueprintViewConversionFunction`
Inherits: `Object` | Header: `MVVMBlueprintViewConversionFunction.h`

A conversion function converts between the source and destiation of a binding.

### `unreal.MVVMBlueprintViewEvent`
Inherits: `Object` | Header: `MVVMBlueprintViewEvent.h`

Binding for an event that MVVM will listen too. Does not imply the MVVM graph itself will use events.

### `unreal.MVVMBlueprintViewExtension`
Inherits: `Object` | Header: `MVVMBlueprintViewExtension.h`

An extension class to define MVVM-related properties and behaviour. When WBP compiled, this information is copied into UMVVMViewClassExtension. This class provides a hook into the MVVM compiler and pa...

### `unreal.MVVMBlueprintViewExtension_PanelWidget`
Inherits: `MVVMBlueprintViewExtension` | Header: `MVVMViewBlueprintPanelWidgetExtension.h`

MVVMBlueprint View Extension Panel Widget

**Properties** (3):
  - `entry_widget_class`: `Class` — [Read-Write] (type(Class))
  - `num_designer_preview_entries`: `int` — [Read-Write] (int32)
  - `slot_obj`: `PanelSlot` — [Read-Write] (PanelSlot)

### `unreal.MVVMBlueprintFieldPathSource`
Inherits: `EnumBase` | Header: `MVVMPropertyPath.h`

EMVVMBlueprint Field Path Source

**Properties** (4):
  - `NONE`: `MVVMBlueprintFieldPathSource = Ellipsis` — 0
  - `SELF_CONTEXT`: `MVVMBlueprintFieldPathSource = Ellipsis` — 3
  - `VIEW_MODEL`: `MVVMBlueprintFieldPathSource = Ellipsis` — 2
  - `WIDGET`: `MVVMBlueprintFieldPathSource = Ellipsis` — 1

### `unreal.MVVMBlueprintFunctionReferenceType`
Inherits: `EnumBase` | Header: `MVVMBlueprintFunctionReference.h`

EMVVMBlueprint Function Reference Type

**Properties** (3):
  - `FUNCTION`: `MVVMBlueprintFunctionReferenceType = Ellipsis` — 1
  - `NODE`: `MVVMBlueprintFunctionReferenceType = Ellipsis` — 2
  - `NONE`: `MVVMBlueprintFunctionReferenceType = Ellipsis` — 0

### `unreal.MVVMBlueprintPinStatus`
Inherits: `EnumBase` | Header: `MVVMBlueprintPin.h`

EMVVMBlueprint Pin Status

**Properties** (2):
  - `ORPHANED`: `MVVMBlueprintPinStatus = Ellipsis` — 1
  - `VALID`: `MVVMBlueprintPinStatus = Ellipsis` — 0

### `unreal.MVVMBlueprintViewModelContextCreationType`
Inherits: `EnumBase` | Header: `MVVMBlueprintViewModelContext.h`

EMVVMBlueprint View Model Context Creation Type

**Properties** (5):
  - `CREATE_INSTANCE`: `MVVMBlueprintViewModelContextCreationType = Ellipsis` — A new instance of the viewmodel will be created when the widget is created. 1
  - `GLOBAL_VIEW_MODEL_COLLECTION`: `MVVMBlueprintViewModelContextCreationType = Ellipsis` — The viewmodel exists and is added to the MVVMSubsystem. It will be fetched there. 2
  - `MANUAL`: `MVVMBlueprintViewModelContextCreationType = Ellipsis` — // The viewmodel will be assigned later. 0
  - `PROPERTY_PATH`: `MVVMBlueprintViewModelContextCreationType = Ellipsis` — The viewmodel will be fetched by evaluating a function or a property path. 3
  - `RESOLVER`: `MVVMBlueprintViewModelContextCreationType = Ellipsis` — The viewmodel will be fetched by evaluating the resolver object. 4
