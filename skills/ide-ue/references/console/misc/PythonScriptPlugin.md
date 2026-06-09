# UE Python API — PythonScriptPlugin Module

**27 types** from the `PythonScriptPlugin` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PyTestChildStruct`, `PyTestClassSparseData`, `PyTestStruct`, `PythonLogOutputEntry`, `EditorPythonScripting`, `LegacyPyTestObject`, `PyTestChildInterface`, `PyTestChildObject`, `PyTestInterface`, `PyTestObject`, `PyTestObjectLibrary`, `PyTestOtherInterface`, `PyTestStructDelegate`, `PyTestStructLibrary`, `PyTestTypeHint`, `PyTestVectorDelegate`, `PythonObjectHandle`, `PythonScriptLibrary`, `PyTestEnum`, `PythonCommandExecutionMode`, ... (27 total)

---

## Classes

### `unreal.PyTestChildStruct`
Inherits: `PyTestStruct` | Header: `PyTest.h`

Struct to allow testing of inheritance on Python wrapped types.

### `unreal.PyTestClassSparseData`
Inherits: `StructBase` | Header: `PyTest.h`

Struct to allow testing of class sparse data on a Python exposed type.

**Properties** (1):
  - `int_from_sparse_data`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.PyTestStruct`
Inherits: `StructBase` | Header: `PyTest.h`

Struct to allow testing of the various UStruct features that are exposed to Python wrapped types.

**Methods** (12):
  - `__add__(other: PyTestStruct)` -> `None` — Overloads:
  - `__iadd__(other: PyTestStruct)` -> `None` — Overloads:
  - `add_float(value)` -> `None` — Add Float
  - `add_int(value)` -> `None` — Add Int
  - `add_str(value)` -> `None` — Add Str
  - `clear_bool_mutable()` -> `None` — Clear Bool Mutable
  - `clear_bool_mutable_via_ref()` -> `None` — Clear Bool Mutable Via Ref
  - `is_bool_set()` -> `bool` — Is Bool Set
  - `is_bool_set_old()` -> `bool` — deprecated: âis_bool_set_oldâ was renamed to âis_bool_setâ.
  - `legacy_is_bool_set()` -> `bool` — Legacy Is Bool Set deprecated: LegacyIsBoolSet is deprecated. Please use IsBoolSet instead.
  - `set_bool_mutable()` -> `None` — Set Bool Mutable
  - `set_bool_mutable_via_ref()` -> `None` — Set Bool Mutable Via Ref

**Properties** (15):
  - `CONSTANT_VALUE`: `int` — Get Constant Value (int32)
  - `bool`: `bool` — [Read-Write] (bool)
  - `bool_mutable`: `bool` [Read-Only] — [Read-Only] (bool)
  - `enum`: `PyTestEnum` — [Read-Write] (PyTestEnum)
  - `field_path`: `FieldPath` — [Read-Write] (FieldPath)
  - `float`: `float` — [Read-Write] (float)
  - `int`: `int` — [Read-Write] (int32)
  - `legacy_int`: `int` — [Read-Write]
deprecated: LegacyInt is deprecated. Please use Int instead. (int32)
  - `name`: `Name` — [Read-Write] (Name)
  - `string`: `str` — [Read-Write] (str)
  - `string_array`: `None` — [Read-Write] (Array[str])
  - `string_int_map`: `None` — [Read-Write] (Map[str, int32])
  - `string_set`: `None` — [Read-Write] (Set[str])
  - `struct_field_path`: `FieldPath` — [Read-Write] (FieldPath)
  - `text`: `Text` — [Read-Write] (Text)

### `unreal.PythonLogOutputEntry`
Inherits: `StructBase` | Header: `PythonScriptTypes.h`

Log output entry captured from Python.

**Properties** (2):
  - `output`: `str` [Read-Only] — [Read-Only] The log output string. (str)
  - `type`: `PythonLogOutputType` [Read-Only] — [Read-Only] The type of the log output. (PythonLogOutputType)

### `unreal.EditorPythonScripting`
Inherits: `BlueprintFunctionLibrary` | Header: `EditorPythonScriptingLibrary.h`

Utility class for Python scripting functionality.

**Methods** (2):
  - `get_keep_python_script_alive()` -> `bool` [classmethod] — Returns the value of the bKeepPythonScriptAlive flag. If this is false (default), it will close the editor during the ne...
  - `set_keep_python_script_alive(new_keep_alive)` -> `None` [classmethod] — Sets the bKeepPythonScriptAlive flag. If this is false (default), it will close the editor during the next tick (when ex...

### `unreal.LegacyPyTestObject`
Inherits: `PyTestObject` | Header: `PyTest.h`

Object to test deprecation of Python wrapped types.

### `unreal.PyTestChildInterface`
Inherits: `PyTestInterface` | Header: `PyTestInterface.h`

Py Test Child Interface

**Methods** (1):
  - `func_interface_child(value)` -> `int32` — Func Interface Child

### `unreal.PyTestChildObject`
Inherits: `PyTestObject` | Header: `PyTest.h`

Object to allow testing of inheritance on Python wrapped types.

### `unreal.PyTestInterface`
Inherits: `Interface` | Header: `PyTestInterface.h`

Py Test Interface

**Methods** (1):
  - `func_interface(value)` -> `int32` — Func Interface

### `unreal.PyTestObject`
Inherits: `Object` | Header: `PyTest.h`

Object to allow testing of the various UObject features that are exposed to Python wrapped types.

**Methods** (26):
  - `call_func_blueprint_implementable(value)` -> `int32` — Call Func Blueprint Implementable
  - `call_func_blueprint_implementable_packed_getter()` -> `int32 or None` — Call Func Blueprint Implementable Packed Getter
  - `call_func_blueprint_native(value)` -> `int32` — Call Func Blueprint Native
  - `call_func_blueprint_native_ref(out_struct)` -> `PyTestStruct` — Call Func Blueprint Native Ref
  - `delegate_property_callback(value)` -> `int32` — UHT couldnât parse any default value for the FieldPath.
  - `emit_script_error()` -> `None` [classmethod] — Emit Script Error
  - `emit_script_warning()` -> `None` [classmethod] — Emit Script Warning
  - `func_blueprint_implementable(value)` -> `int32` — Func Blueprint Implementable
  - `func_blueprint_implementable_packed_getter()` -> `int32 or None` — Func Blueprint Implementable Packed Getter
  - `func_blueprint_native(value)` -> `int32` — Func Blueprint Native
  - `func_blueprint_native_ref(out_struct)` -> `PyTestStruct` — Func Blueprint Native Ref
  - `func_interface(value)` -> `int32` — Func Interface
  - `func_interface_child(value)` -> `int32` — Func Interface Child
  - `func_interface_other(value)` -> `int32` — Func Interface Other
  - `func_taking_field_path(field_path)` -> `None` — Func Taking Field Path
  - `func_taking_py_test_child_struct(struct)` -> `None` — Func Taking Py Test Child Struct
  - `func_taking_py_test_delegate(delegate, value)` -> `int32` — Func Taking Py Test Delegate
  - `func_taking_py_test_struct(struct)` -> `None` — Func Taking Py Test Struct
  - `func_taking_py_test_struct_default(struct = [False,0,0.000000,PyTestEnum.ONE,'','None','',FieldPath(),FieldPath(),[],[],{},False])` -> `None` — Func Taking Py Test Struct Default
  - `is_bool_set()` -> `bool` — Is Bool Set
  - `legacy_func_taking_py_test_struct(struct)` -> `None` — Legacy Func Taking Py Test Struct deprecated: LegacyFuncTakingPyTestStruct is deprecated. Please use FuncTakingPyTestStr...
  - `multicast_delegate_property_callback(str)` -> `None` — Multicast Delegate Property Callback
  - `return_array()` -> `Array [ int32 ]` [classmethod] — Return Array
  - `return_field_path()` -> `FieldPath` [classmethod] — Return Field Path
  - `return_map()` -> `Map [ int32 , bool ]` [classmethod] — Return Map
  - `return_set()` -> `Set [ int32 ]` [classmethod] — Return Set

**Properties** (19):
  - `CONSTANT_VALUE`: `int` — Get Constant Value (int32)
  - `OTHER_CONSTANT_VALUE`: `int` — Get Other Constant Value (int32)
  - `bool`: `bool` — [Read-Write] (bool)
  - `child_struct`: `PyTestChildStruct` — [Read-Write] (PyTestChildStruct)
  - `delegate`: `PyTestDelegate` — [Read-Write] (PyTestDelegate)
  - `enum`: `PyTestEnum` — [Read-Write] (PyTestEnum)
  - `field_path`: `FieldPath` — [Read-Write] (FieldPath)
  - `float`: `float` — [Read-Write] (float)
  - `int`: `int` — [Read-Write] (int32)
  - `multicast_delegate`: `PyTestMulticastDelegate` — [Read-Write] (PyTestMulticastDelegate)
  - `name`: `Name` — [Read-Write] (Name)
  - `string`: `str` — [Read-Write] (str)
  - `string_array`: `None` — [Read-Write] (Array[str])
  - `string_int_map`: `None` — [Read-Write] (Map[str, int32])
  - `string_set`: `None` — [Read-Write] (Set[str])
  - `struct`: `PyTestStruct` — [Read-Write] (PyTestStruct)
  - `struct_array`: `None` — [Read-Write] (Array[PyTestStruct])
  - `struct_field_path`: `FieldPath` — [Read-Write] (FieldPath)
  - `text`: `Text` — [Read-Write] (Text)

### `unreal.PyTestObjectLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PyTest.h`

Function library containing methods that should be hoisted onto the test object in Python.

**Methods** (1):
  - `is_bool_set(obj)` -> `bool` [classmethod] — Is Bool Set

### `unreal.PyTestOtherInterface`
Inherits: `Interface` | Header: `PyTestInterface.h`

Py Test Other Interface

**Methods** (1):
  - `func_interface_other(value)` -> `int32` — Func Interface Other

### `unreal.PyTestStructDelegate`
Inherits: `Object` | Header: `PyTest.h`

This class along with UPyTestVectorDelegate verify that 2 UObjects with the same delegate name/type, do not collide.

**Properties** (1):
  - `on_name_collision_test_delegate`: `OnNameCollisionDelegate` — [Read-Write] Called when a new item is selected in the combobox. (OnNameCollisionDelegate)

### `unreal.PyTestStructLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PyTest.h`

Function library containing methods that should be hoisted onto the test struct in Python.

**Methods** (9):
  - `add_float(struct, value)` -> `PyTestStruct` [classmethod] — Add Float
  - `add_int(struct, value)` -> `PyTestStruct` [classmethod] — Add Int
  - `add_str(struct, value)` -> `PyTestStruct` [classmethod] — Add Str
  - `clear_bool_mutable(struct)` -> `None` [classmethod] — Clear Bool Mutable
  - `clear_bool_mutable_via_ref(struct)` -> `PyTestStruct` [classmethod] — Clear Bool Mutable Via Ref
  - `is_bool_set(struct)` -> `bool` [classmethod] — Is Bool Set
  - `legacy_is_bool_set(struct)` -> `bool` [classmethod] — Legacy Is Bool Set deprecated: LegacyIsBoolSet is deprecated. Please use IsBoolSet instead.
  - `set_bool_mutable(struct)` -> `None` [classmethod] — Set Bool Mutable
  - `set_bool_mutable_via_ref(struct)` -> `PyTestStruct` [classmethod] — Set Bool Mutable Via Ref

### `unreal.PyTestTypeHint`
Inherits: `Object` | Header: `PyTest.h`

Used to verify if the generated Python stub is correctly type-hinted (if type hint is enabled). The stub is generated * in the project intermediate folder when the Python developer mode is enabled (Ed...

**Methods** (16):
  - `check_array_type_hints(param1, param2, param3, param4)` -> `Array [ Text ]` — Check Array Type Hints
  - `check_bool_type_hints(param1, param2 = True, param3 = False)` -> `bool` — Check type hinted methods.
  - `check_delegate_type_hints(param1)` -> `PyTestDelegate` — Check Delegate Type Hints
  - `check_enum_type_hints(param1, param2 = PyTestEnum.ONE)` -> `PyTestEnum` — Check Enum Type Hints
  - `check_field_path_type_hints(param1)` -> `FieldPath` — Check Field Path Type Hints
  - `check_float_type_hints(param1, param2, param3 = -3.300000, param4 = 4.400000)` -> `double` — Check Float Type Hints
  - `check_integer_type_hints(param1, param2 = 4, param3 = 5)` -> `int32` — Check Integer Type Hints
  - `check_map_type_hints(param1, param2, param3, param4)` -> `Map [ str , Object ]` — Check Map Type Hints
  - `check_name_type_hints(param1, param2 = 'Hi')` -> `Name` — Check Name Type Hints
  - `check_object_type_hints(param1, param4 = None)` -> `PyTestObject` — Check Object Type Hints
  - `check_set_type_hints(param1, param2, param3)` -> `Set [ Name ]` — Check Set Type Hints
  - `check_static_function(param1, param2, param3, param4)` -> `bool` [classmethod] — Check Static Function
  - `check_string_type_hints(param1, param2 = 'Hi')` -> `str` — Check String Type Hints
  - `check_struct_type_hints(param1, param2 = [False,0,0.000000,PyTestEnum.ONE,'','None','',FieldPath(),FieldPath(),[],[],{},False])` -> `PyTestStruct` — Check Struct Type Hints
  - `check_text_type_hints(param1, param2 = 'Hi')` -> `Text` — Check Text Type Hints
  - `check_tuple_return_type(out_string=str)` [classmethod] — Check Tuple Return Type

**Properties** (21):
  - `INT_CONST`: `int` — Get Int Const (int32)
  - `STR_CONST`: `str` — Check type hinted constants (str)
  - `bool_prop`: `bool` — [Read-Write] Check type hinted properties (setter/getter) (bool)
  - `delegate_prop`: `PyTestDelegate` — [Read-Write] (PyTestDelegate)
  - `enum_prop`: `PyTestEnum` — [Read-Write] (PyTestEnum)
  - `field_path_prop`: `FieldPath` — [Read-Write] (FieldPath)
  - `float_prop`: `float` — [Read-Write] (float)
  - `int_prop`: `int` — [Read-Write] (int32)
  - `map_prop`: `None` — [Read-Write] (Map[int32,str])
  - `multicast_delegate_prop`: `PyTestMulticastDelegate` — [Read-Write] (PyTestMulticastDelegate)
  - `name_array_prop`: `None` — [Read-Write] (Array[Name])
  - `name_prop`: `Name` — [Read-Write] (Name)
  - `object_array_prop`: `None` — [Read-Write] (Array[Object])
  - `object_prop`: `PyTestObject` — [Read-Write] (PyTestObject)
  - `set_prop`: `None` — [Read-Write] (Set[str])
  - `slate_tick_delegate`: `PyTestSlateTickDelegate` — [Read-Write] Members to facilitate testing particular Python API. (PyTestSlateTickDelegate)
  - `str_array_prop`: `None` — [Read-Write] (Array[str])
  - `string_prop`: `str` — [Read-Write] (str)
  - `struct_prop`: `PyTestStruct` — [Read-Write] (PyTestStruct)
  - `text_array_prop`: `None` — [Read-Write] (Array[Text])
  - `text_prop`: `Text` — [Read-Write] (Text)

### `unreal.PyTestVectorDelegate`
Inherits: `Object` | Header: `PyTest.h`

This class along with UPyTestStructDelegate verify that 2 UObjects with the same delegate name/type, do not collide.

**Properties** (1):
  - `on_name_collision_test_delegate`: `OnNameCollisionDelegate` — [Read-Write] Called when a new item is selected in the combobox. (OnNameCollisionDelegate)

### `unreal.PythonObjectHandle`
Inherits: `Object` | Header: `PyWrapperBase.h`

Handle object to wrap a Python object for use as a UPROPERTY on a UCLASS or USTRUCT. This allows Python generated types to store arbitrary Python objects as native properties, rather than rely on the ...

### `unreal.PythonScriptLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PythonScriptLibrary.h`

Python Script Library

**Methods** (6):
  - `execute_python_command(python_command)` -> `bool` [classmethod] — Execute the given Python command.
  - `execute_python_command_ex(python_command, execution_mode = PythonCommandExecutionMode.EXECUTE_FILE, file_execution_scope = PythonFileExecutionScope.PRIVATE)` -> `(command_result=str, log_output=Array[PythonLogOutputEntry]) or None` [classmethod] — Execute the given Python command.
  - `force_enable_python_at_runtime()` -> `bool` [classmethod] — Force Python to be enabled and initialized, regardless of the settings that control its default enabled state.
  - `is_python_available()` -> `bool` [classmethod] — Check to see whether Python support is available in the current environment. note: This may return false until IsPythonC...
  - `is_python_configured()` -> `bool` [classmethod] — Check to see whether Python has been configured. note: Python may be configured but not yet be initialized ( see: IsPyth...
  - `is_python_initialized()` -> `bool` [classmethod] — Check to see whether Python has been initialized and is ready to use.

### `unreal.PyTestEnum`
Inherits: `EnumBase` | Header: `PyTest.h`

Enum to allow testing of the various UEnum features that are exposed to Python wrapped types.

**Properties** (2):
  - `ONE`: `PyTestEnum = Ellipsis` — 0
  - `TWO`: `PyTestEnum = Ellipsis` — 1

### `unreal.PythonCommandExecutionMode`
Inherits: `EnumBase` | Header: `PythonScriptTypes.h`

Controls the execution mode used for the Python command.

**Properties** (3):
  - `EVALUATE_STATEMENT`: `PythonCommandExecutionMode = Ellipsis` — Evaluate the Python command as a single statement. This will evaluate a single statement and return ...
  - `EXECUTE_FILE`: `PythonCommandExecutionMode = Ellipsis` — Execute the Python command as a file. This allows you to execute either a literal Python script cont...
  - `EXECUTE_STATEMENT`: `PythonCommandExecutionMode = Ellipsis` — Execute the Python command as a single statement. This will execute a single statement and print the...

### `unreal.PythonFileExecutionScope`
Inherits: `EnumBase` | Header: `PythonScriptTypes.h`

Controls the scope used when executing Python files.

**Properties** (2):
  - `PRIVATE`: `PythonFileExecutionScope = Ellipsis` — Execute the Python file with its own unique locals and globals dict to isolate any changes it makes ...
  - `PUBLIC`: `PythonFileExecutionScope = Ellipsis` — Execute the Python file with the shared locals and globals dict as used by the console, so that exec...

### `unreal.PythonLogOutputType`
Inherits: `EnumBase` | Header: `PythonScriptTypes.h`

Types of log output that Python can give.

**Properties** (3):
  - `ERROR`: `PythonLogOutputType = Ellipsis` — This log was an error. 2
  - `INFO`: `PythonLogOutputType = Ellipsis` — This log was informative. 0
  - `WARNING`: `PythonLogOutputType = Ellipsis` — This log was a warning. 1

### `unreal.PyTestDelegate`
Inherits: `DelegateBase` | Header: `PyTest.h`

Delegate to allow testing of the various script delegate features that are exposed to Python wrapped types.

### `unreal.PyTestMulticastDelegate`
Inherits: `MulticastDelegateBase` | Header: `PyTest.h`

Multicast delegate to allow testing of the various script delegate features that are exposed to Python wrapped types.

### `unreal.PyTestSlateTickDelegate`
Inherits: `DelegateBase` | Header: `PyTest.h`

Delegate for slate pre/post tick event.

### `unreal.PyTestStructDelegate_OnNameCollisionDelegate`
Inherits: `MulticastDelegateBase` | Header: `PyTest.h`

On Name Collision Delegate Delegate Signature

### `unreal.PyTestVectorDelegate_OnNameCollisionDelegate`
Inherits: `MulticastDelegateBase` | Header: `PyTest.h`

On Name Collision Delegate Delegate Signature
