# UE Python API — ModelViewViewModel Module

**21 types** from the `ModelViewViewModel` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MVVMAvailableBinding`, `MVVMBindingName`, `MVVMEventField`, `MVVMView_Source`, `MVVMViewClass_ConditionKey`, `MVVMViewClass_EventKey`, `MVVMViewClass_SourceKey`, `MVVMViewModelContext`, `MVVMConversionLibrary`, `MVVMGameSubsystem`, `MVVMPanelWidgetViewExtension`, `MVVMSlateBrushConversionLibrary`, `MVVMSubsystem`, `MVVMView`, `MVVMViewExtension`, `MVVMViewModelBase`, `MVVMViewModelCollectionObject`, `MVVMViewModelContextResolver`, `MVVMBindingMode`, `MVVMConditionOperation`, ... (21 total)

---

## Classes

### `unreal.MVVMAvailableBinding`
Inherits: `StructBase` | Header: `MVVMAvailableBinding.h`

MVVMAvailable Binding

### `unreal.MVVMBindingName`
Inherits: `StructBase` | Header: `MVVMBindingName.h`

MVVMBinding Name

### `unreal.MVVMEventField`
Inherits: `StructBase` | Header: `MVVMEventField.h`

Generic structure to notify when an event occurs.

### `unreal.MVVMView_Source`
Inherits: `StructBase` | Header: `MVVMView.h`

Instance FMVVMViewClass_Source for the UUserWdiget

### `unreal.MVVMViewClass_ConditionKey`
Inherits: `StructBase` | Header: `MVVMViewTypes.h`

Key that identify the FMVVMViewClass_Condition.

### `unreal.MVVMViewClass_EventKey`
Inherits: `StructBase` | Header: `MVVMViewTypes.h`

Key that identify the FMVVMViewClass_Event.

### `unreal.MVVMViewClass_SourceKey`
Inherits: `StructBase` | Header: `MVVMViewTypes.h`

Key that identify the FMVVMViewClass_Source.

### `unreal.MVVMViewModelContext`
Inherits: `StructBase` | Header: `MVVMViewModelContext.h`

MVVMView Model Context

**Properties** (2):
  - `context_class`: `Class` — [Read-Write] (type(Class))
  - `context_name`: `Name` — [Read-Write] (Name)

### `unreal.MVVMConversionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MVVMConversionLibrary.h`

MVVMConversion Library

**Methods** (1):
  - `conv_bool_to_slate_visibility(is_visible, true_visibility = SlateVisibility.VISIBLE, false_visibility = SlateVisibility.COLLAPSED)` -> `SlateVisibility` [classmethod] — Converts a bool to a slate visibility.

### `unreal.MVVMGameSubsystem`
Inherits: `GameInstanceSubsystem` | Header: `MVVMGameSubsystem.h`

MVVMGame Subsystem

**Methods** (1):
  - `get_view_model_collection()` -> `MVVMViewModelCollectionObject` — Get View Model Collection

### `unreal.MVVMPanelWidgetViewExtension`
Inherits: `MVVMViewExtension` | Header: `MVVMViewPanelWidgetExtension.h`

MVVMPanel Widget View Extension

**Methods** (1):
  - `bp_set_items(items)` -> `None` — BP Set Items

### `unreal.MVVMSlateBrushConversionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MVVMSlateBrushConversionLibrary.h`

Conversion library that contains methods for FSlateBrush

**Methods** (6):
  - `conv_set_scalar_parameter(brush, parameter_name, value)` -> `SlateBrush` [classmethod] — Sets a scalar value on a brush material assuming it exists, handles MID existance appropriately
  - `conv_set_scalar_parameter_mid(brush, material, parameter_name, value)` -> `SlateBrush` [classmethod] — Sets a scalar value on a brush material assuming it exists, handles MID existance appropriately
  - `conv_set_texture_parameter(brush, parameter_name, value)` -> `SlateBrush` [classmethod] — Sets a texture value on a brush material assuming it exists, handles MID existance appropriately
  - `conv_set_texture_parameter_mid(brush, material, parameter_name, value)` -> `SlateBrush` [classmethod] — Sets a texture value on a brush material assuming it exists, handles MID existance appropriately
  - `conv_set_vector_parameter(brush, parameter_name, value)` -> `SlateBrush` [classmethod] — Sets a vector value on a brush material assuming it exists, handles MID existance appropriately
  - `conv_set_vector_parameter_mid(brush, material, parameter_name, value)` -> `SlateBrush` [classmethod] — Sets a vector value on a brush material assuming it exists, handles MID existance appropriately

### `unreal.MVVMSubsystem`
Inherits: `EngineSubsystem` | Header: `MVVMSubsystem.h`

**Methods** (9):
  - `does_widget_tree_contained_widget(widget_tree, view_widget)` -> `bool` — Does Widget Tree Contained Widget
  - `get_available_binding(class_: Class, binding_name: MVVMBindingName, accessor: Class)` -> `MVVMAvailableBinding` — deprecated: âget_available_bindingâ was renamed to âk2_get_available_bindingâ.
  - `get_available_bindings(class_: Class, accessor: Class)` -> `None` — deprecated: âget_available_bindingsâ was renamed to âk2_get_available_bindingsâ.
  - `get_global_view_model_collection()` -> `MVVMViewModelCollectionObject` — Get Global View Model Collection deprecated: Function âGetGlobalViewModelCollectionâ is deprecated.
  - `get_view_from_user_widget(user_widget: UserWidget)` -> `MVVMView` — deprecated: âget_view_from_user_widgetâ was renamed to âk2_get_view_from_user_widgetâ.
  - `k2_compare_float_values(operation, value, compare_value, compare_max_value = 0.000000)` -> `bool` — K2 Compare Float Values
  - `k2_get_available_binding(class_, binding_name, accessor)` -> `MVVMAvailableBinding`
  - `k2_get_available_bindings(class_, accessor)` -> `Array [ MVVMAvailableBinding ]`
  - `k2_get_view_from_user_widget(user_widget)` -> `MVVMView` — K2 Get View from User Widget

### `unreal.MVVMView`
Inherits: `UserWidgetExtension` | Header: `MVVMView.h`

Instance UMVVMClassExtension_View for the UUserWdiget

**Methods** (13):
  - `are_bindings_initialized()` -> `bool` — The bindings were initialized, manually or automatically.
  - `are_events_initialized()` -> `bool` — The events were initialized, manually or automatically.
  - `are_sources_initialized()` -> `bool` — The sources were initialized, manually or automatically.
  - `execute_view_model_bindings(view_model_name)` -> `bool` — Execute all the bindings that use the viewmodel.
  - `get_view_model(view_model_name)` -> `NotifyFieldValueChanged` — Find and return the viewmodel with the specified name.
  - `initialize_bindings()` -> `None` — Initialize the bindings if they are not already initialized. Initializing the bindings will execute them.
  - `initialize_events()` -> `None` — Initialize the events if they are not already initialized.
  - `initialize_sources()` -> `None` — Initialize the sources if they are not already initialized. Initializing the sources will also initialize the bindings i...
  - `set_view_model(view_model_name, view_model)` -> `bool` — Set the viewmodel of the specified name. The viewmodel needs to be settable and the type should match (child of the defi...
  - `set_view_model_by_class(new_value)` -> `bool` — Set the first viewmodel matching the exact specified type. If none is found, set the first viewmodel matching a child of...
  - `uninitialize_bindings()` -> `None` — Uninitialize the bindings if they are already initialized.
  - `uninitialize_events()` -> `None` — Uninitialize the events if they are already initialized.
  - `uninitialize_sources()` -> `None` — Uninitialize the sources if they are already initialized. It will uninitialized the bindings.

### `unreal.MVVMViewExtension`
Inherits: `Object` | Header: `MVVMViewClassExtension.h`

A runtime extension class instance. This information is per instance of a UMVVMViewClassExtension

### `unreal.MVVMViewModelBase`
Inherits: `Object` | Header: `MVVMViewModelBase.h`

Base class for MVVM viewmodel.

**Methods** (3):
  - `add_field_value_changed_delegate(field_id, delegate)` -> `None` — K2 Add Field Value Changed Delegate
  - `broadcast_field_value_changed(field_id)` -> `None` — K2 Broadcast Field Value Changed deprecated: Function âK2_BroadcastFieldValueChangedâ is deprecated.
  - `remove_field_value_changed_delegate(field_id, delegate)` -> `None` — K2 Remove Field Value Changed Delegate

### `unreal.MVVMViewModelCollectionObject`
Inherits: `Object` | Header: `MVVMViewModelCollection.h`

MVVMView Model Collection Object

**Methods** (5):
  - `add_view_model_instance(context, view_model)` -> `bool` — Add View Model Instance
  - `find_first_view_model_instance_of_type(view_model_class)` -> `MVVMViewModelBase` — Finds a View Model of the given type. If the collection contains multiple instances of the same type then this will retu...
  - `find_view_model_instance(context)` -> `MVVMViewModelBase` — Find View Model Instance
  - `remove_all_view_model_instance(view_model)` -> `int32` — Remove All View Model Instance
  - `remove_view_model(context)` -> `bool` — Remove View Model

### `unreal.MVVMViewModelContextResolver`
Inherits: `Object` | Header: `MVVMViewModelContextResolver.h`

Shared data to find or create a ViewModel at runtime.

**Methods** (2):
  - `k2_create_instance(expected_type, user_widget)` -> `NotifyFieldValueChanged` — K2 Create Instance
  - `k2_destroy_instance(view_model, view)` -> `None` — K2 Destroy Instance

### `unreal.MVVMBindingMode`
Inherits: `EnumBase` | Header: `MVVMBindingMode.h`

EMVVMBinding Mode

**Properties** (4):
  - `ONE_TIME_TO_DESTINATION`: `MVVMBindingMode = Ellipsis` — 0
  - `ONE_WAY_TO_DESTINATION`: `MVVMBindingMode = Ellipsis` — 1
  - `ONE_WAY_TO_SOURCE`: `MVVMBindingMode = Ellipsis` — 4
  - `TWO_WAY`: `MVVMBindingMode = Ellipsis` — 2

### `unreal.MVVMConditionOperation`
Inherits: `EnumBase` | Header: `MVVMConditionOperation.h`

EMVVMCondition Operation

**Properties** (8):
  - `BETWEEN_EXCLUSIVE`: `MVVMConditionOperation = Ellipsis` — 7
  - `BETWEEN_INCLUSIVE`: `MVVMConditionOperation = Ellipsis` — 6
  - `EQUAL`: `MVVMConditionOperation = Ellipsis` — 0
  - `LESS_THAN`: `MVVMConditionOperation = Ellipsis` — 4
  - `LESS_THAN_OR_EQUAL`: `MVVMConditionOperation = Ellipsis` — 5
  - `MORE_THAN`: `MVVMConditionOperation = Ellipsis` — 2
  - `MORE_THAN_OR_EQUAL`: `MVVMConditionOperation = Ellipsis` — 3
  - `NOT_EQUAL`: `MVVMConditionOperation = Ellipsis` — 1

### `unreal.MVVMExecutionMode`
Inherits: `EnumBase` | Header: `MVVMExecutionMode.h`

EMVVMExecution Mode

**Properties** (4):
  - `DELAYED`: `MVVMExecutionMode = Ellipsis` — Execute the binding at the end of the frame before drawing when the source value changes. 1
  - `DELAYED_WHEN_SHARED_ELSE_IMMEDIATE`: `MVVMExecutionMode = Ellipsis` — When the binding can be triggered from multiple fields, use Delayed. Else, uses Immediate. 3
  - `IMMEDIATE`: `MVVMExecutionMode = Ellipsis` — Execute the binding as soon as the source value changes. 0
  - `TICK`: `MVVMExecutionMode = Ellipsis` — Always execute the binding at the end of the frame. 2
