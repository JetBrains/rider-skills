# UE Python API — ModelViewViewModelEditor Module

**11 types** from the `ModelViewViewModelEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MVVMBindingExecTextCounter`, `MVVMLinkedPinValue`, `MVVMStructFieldPathHelperTest`, `MVVMEditorSubsystem`, `MVVMFieldValueChangedTest`, `MVVMObjectFieldPathHelperTest`, `MVVMViewModelBindingExecTest`, `MVVMViewModelBindingHelperTest`, `MVVMViewModelFieldPathHelperTest`, `MVVMViewModelFieldPathHelperTestBase`, `MVVMWidgetFieldPathHelperTest`

---

## Classes

### `unreal.MVVMBindingExecTextCounter`
Inherits: `StructBase` | Header: `MVVMBindingExecuteTest.h`

MVVMBinding Exec Text Counter

### `unreal.MVVMLinkedPinValue`
Inherits: `StructBase` | Header: `MVVMLinkedPinValue.h`

MVVMLinked Pin Value

**Properties** (3):
  - `conversion_function`: `Function` — [Read-Write] (Function)
  - `conversion_node`: `Class` — [Read-Write] (type(Class))
  - `property_path`: `MVVMBlueprintPropertyPath` — [Read-Write] (MVVMBlueprintPropertyPath)

### `unreal.MVVMStructFieldPathHelperTest`
Inherits: `StructBase` | Header: `MVVMFieldPathHelperTest.h`

MVVMStruct Field Path Helper Test

### `unreal.MVVMEditorSubsystem`
Inherits: `EditorSubsystem` | Header: `MVVMEditorSubsystem.h`

MVVMEditor Subsystem

**Methods** (21):
  - `add_binding(widget_blueprint)` -> `MVVMBlueprintViewBinding` — Add Binding
  - `add_condition(widget_blueprint)` -> `MVVMBlueprintViewCondition` — Add Condition
  - `add_event(widget_blueprint)` -> `MVVMBlueprintViewEvent` — Add Event
  - `add_instanced_view_model(widget_blueprint)` -> `Guid` — Add Instanced View Model
  - `add_view_model(widget_blueprint, view_model)` -> `Guid` — Add View Model
  - `get_available_conversion_functions(widget_blueprint, source, destination)` -> `Array [ Function ]` — Get Available Conversion Functions
  - `get_child_view_models(class_, accessor)` -> `Array [ MVVMAvailableBinding ]` — Get Child View Models
  - `get_conversion_function(widget_blueprint, binding, source_to_destination)` -> `Function` — Get Conversion Function
  - `get_conversion_function_graph(widget_blueprint, binding, source_to_destination)` -> `EdGraph` — Get Conversion Function Graph
  - `get_conversion_function_node(widget_blueprint, binding, source_to_destination)` -> `K2Node_CallFunction` — Get Conversion Function Node
  - `get_view(widget_blueprint)` -> `MVVMBlueprintView` — Get View
  - `is_simple_conversion_function(function)` -> `bool` — Is Simple Conversion Function
  - `is_valid_conversion_function(widget_blueprint, function, source, destination)` -> `bool` — Is Valid Conversion Function
  - `remove_binding(widget_blueprint, binding)` -> `None` — Remove Binding
  - `remove_condition(widget_blueprint, condition)` -> `None` — Remove Condition
  - `remove_event(widget_blueprint, event)` -> `None` — Remove Event
  - `remove_view_model(widget_blueprint, view_model)` -> `None` — Remove View Model
  - `rename_view_model(widget_blueprint, view_model, new_view_model)` -> `Text or None` — Rename View Model
  - `reparent_view_model(widget_blueprint, view_model, new_view_model)` -> `Text or None` — Reparent View Model
  - `request_view(widget_blueprint)` -> `MVVMBlueprintView` — Request View
  - `verify_view_model_rename(widget_blueprint, view_model, new_view_model)` -> `Text or None` — Verify View Model Rename

### `unreal.MVVMFieldValueChangedTest`
Inherits: `MVVMViewModelBase` | Header: `MVVMFieldValueChangedTest.h`

MVVMField Value Changed Test

**Methods** (2):
  - `function_float()` -> `float` — Function Float
  - `function_int()` -> `int32` — Function Int

**Properties** (2):
  - `property_float`: `float` [Read-Only] — [Read-Only] (float)
  - `property_int`: `int` — [Read-Write] (int32)

### `unreal.MVVMObjectFieldPathHelperTest`
Inherits: `Object` | Header: `MVVMFieldPathHelperTest.h`

MVVMObject Field Path Helper Test

**Methods** (20):
  - `get_property_int_with_bp_getter_setter()` -> `int32` — Get Property Int with BPGetter Setter
  - `get_property_int_with_getter_setter_and_bp()` -> `int32` — Get Property Int with Getter Setter and BP
  - `get_property_object_with_bp_getter_setter()` -> `MVVMObjectFieldPathHelperTest` — Get Property Object with BPGetter Setter
  - `get_property_object_with_getter_setter_and_bp()` -> `MVVMObjectFieldPathHelperTest` — Get Property Object with Getter Setter and BP
  - `get_property_struct_with_bp_getter_setter()` -> `MVVMStructFieldPathHelperTest` — Get Property Struct with BPGetter Setter
  - `get_property_struct_with_getter_setter_and_bp()` -> `MVVMStructFieldPathHelperTest` — Get Property Struct with Getter Setter and BP
  - `get_property_vector_with_bp_getter_setter()` -> `Vector` — Get Property Vector with BPGetter Setter
  - `get_property_vector_with_getter_setter_and_bp()` -> `Vector` — Get Property Vector with Getter Setter and BP
  - `get_property_view_model_with_bp_getter_setter()` -> `MVVMViewModelFieldPathHelperTest` — Get Property View Model with BPGetter Setter
  - `get_property_view_model_with_getter_setter_and_bp()` -> `MVVMViewModelFieldPathHelperTest` — Get Property View Model with Getter Setter and BP
  - `set_property_int_with_bp_getter_setter(value)` -> `None` — Set Property Int with BPGetter Setter
  - `set_property_int_with_getter_setter_and_bp(value)` -> `None` — Set Property Int with Getter Setter and BP
  - `set_property_object_with_bp_getter_setter(value)` -> `None` — Set Property Object with BPGetter Setter
  - `set_property_object_with_getter_setter_and_bp(value)` -> `None` — Set Property Object with Getter Setter and BP
  - `set_property_struct_with_bp_getter_setter(value)` -> `None` — Set Property Struct with BPGetter Setter
  - `set_property_struct_with_getter_setter_and_bp(value)` -> `None` — Set Property Struct with Getter Setter and BP
  - `set_property_vector_with_bp_getter_setter(value)` -> `None` — Set Property Vector with BPGetter Setter
  - `set_property_vector_with_getter_setter_and_bp(value)` -> `None` — Set Property Vector with Getter Setter and BP
  - `set_property_view_model_with_bp_getter_setter(value)` -> `None` — Set Property View Model with BPGetter Setter
  - `set_property_view_model_with_getter_setter_and_bp(value)` -> `None` — Set Property View Model with Getter Setter and BP

**Properties** (10):
  - `property_int_with_bp_getter_setter`: `int` — [Read-Write] (int32)
  - `property_int_with_getter_setter_and_bp`: `int` — [Read-Write] (int32)
  - `property_object_with_bp_getter_setter`: `MVVMObjectFieldPathHelperTest` — [Read-Write] (MVVMObjectFieldPathHelperTest)
  - `property_object_with_getter_setter_and_bp`: `MVVMObjectFieldPathHelperTest` — [Read-Write] (MVVMObjectFieldPathHelperTest)
  - `property_struct_with_bp_getter_setter`: `MVVMStructFieldPathHelperTest` — [Read-Write] (MVVMStructFieldPathHelperTest)
  - `property_struct_with_getter_setter_and_bp`: `MVVMStructFieldPathHelperTest` — [Read-Write] (MVVMStructFieldPathHelperTest)
  - `property_vector_with_bp_getter_setter`: `Vector` — [Read-Write] (Vector)
  - `property_vector_with_getter_setter_and_bp`: `Vector` — [Read-Write] (Vector)
  - `property_view_model_with_bp_getter_setter`: `MVVMViewModelFieldPathHelperTest` — [Read-Write] (MVVMViewModelFieldPathHelperTest)
  - `property_view_model_with_getter_setter_and_bp`: `MVVMViewModelFieldPathHelperTest` — [Read-Write] (MVVMViewModelFieldPathHelperTest)

### `unreal.MVVMViewModelBindingExecTest`
Inherits: `Object` | Header: `MVVMBindingExecuteTest.h`

MVVMView Model Binding Exec Test

**Methods** (20):
  - `conversion_array_int_to_array_struct(values)` -> `Array [ MVVMBindingExecTextCounter ]` [classmethod] — Conversion Array Int to Array Struct
  - `conversion_array_struct_to_array_int(values)` -> `Array [ int32 ]` [classmethod] — Conversion Array Struct to Array Int
  - `conversion_const_int_to_struct(value)` -> `MVVMBindingExecTextCounter` [classmethod] — Conversion Const Int to Struct
  - `conversion_const_struct_to_int(value)` -> `int32` [classmethod] — Conversion Const Struct to Int
  - `conversion_inc_double(value)` -> `float` [classmethod] — Conversion Inc Double
  - `conversion_inc_float(value)` -> `float` [classmethod] — Conversion Inc Float
  - `conversion_int_to_struct(value)` -> `MVVMBindingExecTextCounter` [classmethod] — Conversion Int to Struct
  - `conversion_struct_to_int(value)` -> `int32` [classmethod] — Conversion Struct to Int
  - `getter_a()` -> `MVVMBindingExecTextCounter` — Getter A
  - `getter_b()` -> `Array [ MVVMBindingExecTextCounter ]` — Getter B
  - `getter_c()` -> `int32` — Getter C
  - `getter_d()` -> `Array [ int32 ]` — Getter D
  - `getter_double()` -> `double` — Getter Double
  - `getter_float()` -> `float` — Getter Float
  - `setter_a(value)` -> `None` — Setter A
  - `setter_b(value)` -> `None` — Setter B
  - `setter_c(value)` -> `None` — Setter C
  - `setter_d(value)` -> `None` — Setter D
  - `setter_double(value)` -> `None` — Setter Double
  - `setter_float(value)` -> `None` — Setter Float

**Properties** (7):
  - `property_a`: `MVVMBindingExecTextCounter` — [Read-Write] (MVVMBindingExecTextCounter)
  - `property_b`: `None` — [Read-Write] (Array[MVVMBindingExecTextCounter])
  - `property_c`: `int` — [Read-Write] (int32)
  - `property_d`: `None` — [Read-Write] (Array[int32])
  - `property_double`: `float` — [Read-Write] (double)
  - `property_float`: `float` — [Read-Write] (float)
  - `property_float_accessor`: `float` — [Read-Write] (float)

### `unreal.MVVMViewModelBindingHelperTest`
Inherits: `MVVMViewModelBase` | Header: `MVVMBindingHelperTest.h`

MVVMView Model Binding Helper Test

**Methods** (30):
  - `function_conversion_a()` -> `None` [classmethod] — Function Conversion A
  - `function_conversion_b()` -> `int32` [classmethod] — Function Conversion B
  - `function_conversion_c(param1)` -> `int32` [classmethod] — Function Conversion C
  - `function_conversion_d(param1, param2)` -> `int32` [classmethod] — Function Conversion D
  - `function_conversion_e(param1)` -> `None` [classmethod] — Function Conversion E
  - `function_conversion_f(param1, param2)` -> `None` [classmethod] — Function Conversion F
  - `function_conversion_g(param2)` -> `Array [ int32 ]` [classmethod] — Function Conversion G
  - `function_conversion_h(param1)` -> `Array [ int32 ]` [classmethod] — Function Conversion H
  - `function_conversion_i()` [classmethod] — Function Conversion I
  - `function_conversion_j()` [classmethod] — Function Conversion J
  - `function_get_b()` -> `int32` — Function Get B
  - `function_get_c()` -> `int32` — Function Get C
  - `function_get_d(param1)` -> `int32` — Function Get D
  - `function_get_e(param1, param2)` -> `int32` — Function Get E
  - `function_get_f()` -> `Array [ int32 ]` — Function Get F
  - `function_get_g()` -> `Array [ int32 ]` — Function Get G
  - `function_get_h(result)` -> `None` — Function Get H
  - `function_get_i()` — Function Get I
  - `function_get_j(value)` -> `Array [ int32 ]` — Function Get J
  - `function_get_protected()` -> `int32` — Function Get Protected
  - `function_getter()` -> `int32` — Function Getter
  - `function_set_b(value)` -> `None` — Function Set B
  - `function_set_c(param1)` -> `int32` — Function Set C
  - `function_set_d(param1)` -> `None` — Function Set D
  - `function_set_e(param1, param2)` -> `None` — Function Set E
  - `function_set_f()` -> `Array [ int32 ]` — Function Set F
  - `function_set_g(param1)` -> `None` — Function Set G
  - `function_set_h(param2)` -> `Array [ int32 ]` — Function Set H
  - `function_set_protected(value)` -> `None` — Function Set Protected
  - `function_setter(value)` -> `None` — Function Setter

**Properties** (8):
  - `property_b`: `int` — [Read-Write] (int32)
  - `property_c`: `int` [Read-Only] — [Read-Only] (int32)
  - `property_d`: `int` — [Read-Write] (int32)
  - `property_e`: `int` [Read-Only] — [Read-Only] (int32)
  - `property_j`: `int` — [Read-Write] (int32)
  - `property_k`: `int` [Read-Only] — [Read-Only] (int32)
  - `property_l`: `int` — [Read-Write] (int32)
  - `property_m`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.MVVMViewModelFieldPathHelperTest`
Inherits: `MVVMViewModelFieldPathHelperTestBase` | Header: `MVVMFieldPathHelperTest.h`

MVVMView Model Field Path Helper Test

**Properties** (5):
  - `property_int_notify`: `int` — [Read-Write] (int32)
  - `property_object_notify`: `MVVMObjectFieldPathHelperTest` — [Read-Write] (MVVMObjectFieldPathHelperTest)
  - `property_struct_notify`: `MVVMStructFieldPathHelperTest` — [Read-Write] (MVVMStructFieldPathHelperTest)
  - `property_vector_notify`: `Vector` — [Read-Write] (Vector)
  - `property_view_model_notify`: `MVVMViewModelFieldPathHelperTest` — [Read-Write] (MVVMViewModelFieldPathHelperTest)

### `unreal.MVVMViewModelFieldPathHelperTestBase`
Inherits: `MVVMObjectFieldPathHelperTest` | Header: `MVVMFieldPathHelperTest.h`

MVVMView Model Field Path Helper Test Base

### `unreal.MVVMWidgetFieldPathHelperTest`
Inherits: `UserWidget` | Header: `MVVMFieldPathHelperTest.h`

MVVMWidget Field Path Helper Test

**Methods** (20):
  - `get_property_int_with_bp_getter_setter()` -> `int32` — Get Property Int with BPGetter Setter
  - `get_property_int_with_getter_setter_and_bp()` -> `int32` — Get Property Int with Getter Setter and BP
  - `get_property_object_with_bp_getter_setter()` -> `MVVMObjectFieldPathHelperTest` — Get Property Object with BPGetter Setter
  - `get_property_object_with_getter_setter_and_bp()` -> `MVVMObjectFieldPathHelperTest` — Get Property Object with Getter Setter and BP
  - `get_property_struct_with_bp_getter_setter()` -> `MVVMStructFieldPathHelperTest` — Get Property Struct with BPGetter Setter
  - `get_property_struct_with_getter_setter_and_bp()` -> `MVVMStructFieldPathHelperTest` — Get Property Struct with Getter Setter and BP
  - `get_property_vector_with_bp_getter_setter()` -> `Vector` — Get Property Vector with BPGetter Setter
  - `get_property_vector_with_getter_setter_and_bp()` -> `Vector` — Get Property Vector with Getter Setter and BP
  - `get_property_view_model_with_bp_getter_setter()` -> `MVVMViewModelFieldPathHelperTest` — Get Property View Model with BPGetter Setter
  - `get_property_view_model_with_getter_setter_and_bp()` -> `MVVMViewModelFieldPathHelperTest` — Get Property View Model with Getter Setter and BP
  - `set_property_int_with_bp_getter_setter(value)` -> `None` — Set Property Int with BPGetter Setter
  - `set_property_int_with_getter_setter_and_bp(value)` -> `None` — Set Property Int with Getter Setter and BP
  - `set_property_object_with_bp_getter_setter(value)` -> `None` — Set Property Object with BPGetter Setter
  - `set_property_object_with_getter_setter_and_bp(value)` -> `None` — Set Property Object with Getter Setter and BP
  - `set_property_struct_with_bp_getter_setter(value)` -> `None` — Set Property Struct with BPGetter Setter
  - `set_property_struct_with_getter_setter_and_bp(value)` -> `None` — Set Property Struct with Getter Setter and BP
  - `set_property_vector_with_bp_getter_setter(value)` -> `None` — Set Property Vector with BPGetter Setter
  - `set_property_vector_with_getter_setter_and_bp(value)` -> `None` — Set Property Vector with Getter Setter and BP
  - `set_property_view_model_with_bp_getter_setter(value)` -> `None` — Set Property View Model with BPGetter Setter
  - `set_property_view_model_with_getter_setter_and_bp(value)` -> `None` — Set Property View Model with Getter Setter and BP

**Properties** (15):
  - `property_int_notify`: `int` — [Read-Write] (int32)
  - `property_int_with_bp_getter_setter`: `int` — [Read-Write] (int32)
  - `property_int_with_getter_setter_and_bp`: `int` — [Read-Write] (int32)
  - `property_object_notify`: `MVVMObjectFieldPathHelperTest` — [Read-Write] (MVVMObjectFieldPathHelperTest)
  - `property_object_with_bp_getter_setter`: `MVVMObjectFieldPathHelperTest` — [Read-Write] (MVVMObjectFieldPathHelperTest)
  - `property_object_with_getter_setter_and_bp`: `MVVMObjectFieldPathHelperTest` — [Read-Write] (MVVMObjectFieldPathHelperTest)
  - `property_struct_notify`: `MVVMStructFieldPathHelperTest` — [Read-Write] (MVVMStructFieldPathHelperTest)
  - `property_struct_with_bp_getter_setter`: `MVVMStructFieldPathHelperTest` — [Read-Write] (MVVMStructFieldPathHelperTest)
  - `property_struct_with_getter_setter_and_bp`: `MVVMStructFieldPathHelperTest` — [Read-Write] (MVVMStructFieldPathHelperTest)
  - `property_vector_notify`: `Vector` — [Read-Write] (Vector)
  - `property_vector_with_bp_getter_setter`: `Vector` — [Read-Write] (Vector)
  - `property_vector_with_getter_setter_and_bp`: `Vector` — [Read-Write] (Vector)
  - `property_view_model_notify`: `MVVMViewModelFieldPathHelperTest` — [Read-Write] (MVVMViewModelFieldPathHelperTest)
  - `property_view_model_with_bp_getter_setter`: `MVVMViewModelFieldPathHelperTest` — [Read-Write] (MVVMViewModelFieldPathHelperTest)
  - `property_view_model_with_getter_setter_and_bp`: `MVVMViewModelFieldPathHelperTest` — [Read-Write] (MVVMViewModelFieldPathHelperTest)
