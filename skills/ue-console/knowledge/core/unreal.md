# UE Python API — unreal Module

**943 types** from the `unreal` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `unreal`, `_EnumEntry`, `_Logger`, `_ObjectBase`, `_WrapperBase`, `ActorIterator`, `Array`, `AutomationScheduler`, `ClassIterator`, `DelegateBase`, `EnumBase`, `FieldPath`, `FixedArray`, `FunctionDef`, `Map`, `MulticastDelegateBase`, `Name`, `ObjectIterator`, `PropertyDef`, `ScopedEditorTransaction`, ... (943 total)

---

## Classes

### `unreal.unreal`

**Methods** (48):
  - `_redirect_warning(message, category, filename, lineno, file = None, line = None)`
  - `collect_garbage()` -> `None` — run Unreal garbage collection
  - `create_python_object_handle(obj: Any | None)` -> `Optional[PythonObjectHandle]` — create a PythonObjectHandle from the given PyObject
  - `destroy_python_object_handle(handle:Optional[PythonObjectHandle])--destroyaPythonObjectHandle(clearingitsPyObjectreference: Optional[PythonObjectHandle]) -- destroy a PythonObjectHandle (clearing its PyObject reference)`
  - `find_asset(name: str, type: Class | type = Object.static_class(), follow_redirectors: bool = True)` -> `Any` — find an already loaded Unreal asset with the given name, optionally validating its type
  - `find_object(outer: Object | None, name: str, type: Class | type = Object.static_class(), follow_redirectors: bool = True)` -> `Any` — find an already loaded Unreal object with the given outer and name, optionally validating its type
  - `find_package(name: str)` -> `Optional[Package]` — find an already loaded Unreal package with the given name
  - `flush_generated_type_reinstancing()` -> `None` — flush any pending reinstancing requests for Python generated types
  - `generate_class(class_type: type)` -> `None` — generate an Unreal class for the given Python type
  - `generate_enum(enum_type: type)` -> `None` — generate an Unreal enum for the given Python type
  - `generate_struct(struct_type: type)` -> `None` — generate an Unreal struct for the given Python type
  - `get_blueprint_generated_types(Tuple[type, ...]]]--getthePythontypes(willreturnatupleformultipletypes)forthegivensetofBlueprintassetpaths(maybeasequencetypeorsetofarguments)`
  - `get_default_object(type: Class | type)` -> `Any` — get the Unreal class default object (CDO) of the given type
  - `get_editor_subsystem(subsystem: Class | type [ _EditorSubsystemTypeVar ])` -> `Optional[_EditorSubsystemTypeVar]` — returns the requested Editor subsystem or None
  - `get_engine_subsystem(subsystem: Class | type [ _EngineSubsystemTypeVar ])` -> `Optional[_EngineSubsystemTypeVar]` — returns the requested Engine subsystem or None
  - `get_interpreter_executable_path()` -> `str` — get the path to the Python interpreter executable of the Python SDK this plugin was compiled against
  - `get_type_from_class(class_: Class)` -> `type` — get the best matching Python type for the given Unreal class
  - `get_type_from_enum(enum: Enum)` -> `type` — get the best matching Python type for the given Unreal enum
  - `get_type_from_struct(struct: Struct)` -> `type` — get the best matching Python type for the given Unreal struct
  - `is_editor()` -> `bool` — tells if the editor is running or not
  - `load_asset(name: str, type: Class | type = Object.static_class(), follow_redirectors: bool = True)` -> `Any` — load an Unreal asset with the given name, optionally validating its type
  - `load_class(outer: Object | None, name: str, type: Class | type = Object.static_class())` -> `Optional[Class]` — load an Unreal class with the given outer and name, optionally validating its base type
  - `load_module(module: str)` -> `None` — load the given Unreal module and generate any Python code for its reflected types
  - `load_object(outer: Object | None, name: str, type: Class | type = Object.static_class(), follow_redirectors: bool = True)` -> `Any` — load an Unreal object with the given outer and name, optionally validating its type
  - `load_package(name: str)` -> `Optional[Package]` — load an Unreal package with the given name
  - `LOCTABLE(id: Name | str, key: str)` -> `Text` — get a localized Text from the given string table id and key
  - `log(arg: Any)` -> `None` — log the given argument as information in the LogPython category
  - `log_error(arg: Any)` -> `None` — log the given argument as an error in the LogPython category
  - `log_flush()` -> `None` — flush the log to disk.
  - `log_warning(arg: Any)` -> `None` — log the given argument as a warning in the LogPython category
  - `new_object(type: Class | type, outer: Object | None = None, name: Name | str = '', base_type: Object | None = None)` -> `Any` — create an Unreal object of the given class (and optional outer and name), optionally validating its type
  - `NSLOCTEXT(ns: str, key: str, source: str)` -> `Text` — create a localized Text from the given namespace, key, and source string
  - `parent_external_window_to_slate(external_window_handle: object, parent_search_method: SlateParentWindowSearchMethod = SlateParentWindowSearchMethod.ACTIVE_WINDOW)` -> `None` — parent the given OS specific external window handle to a suitable Slate window
  - `purge_object_references(obj: Object, include_inners: bool = True)` -> `None` — purge all references to the given Unreal object from any living Python objects
  - `register_python_shutdown_callback(callable: Callable [ [ ] , None ])` -> `object` — register the given callable (with no input arguments) as a callback to execute immediately before Python shutdown
  - `register_slate_post_tick_callback(callable: Callable [ [ float ] , None ] | DelegateBase)` -> `object` — register the given callable (taking a single float) as a pre-tick callback in Slate
  - `register_slate_pre_tick_callback(callable: Callable [ [ float ] , None ] | DelegateBase)` -> `object` — register the given callable (taking a single float) as a pre-tick callback in Slate
  - `reload(module: str)` -> `None` — reload the given Unreal Python module.
  - `resolve_python_object_handle(handle: PythonObjectHandle | None)` -> `Optional[Any]` — resolve a PythonObjectHandle to its PyObject, or None
  - `uclass()` — decorator used to define UClass types from Python
  - `uenum()` — decorator used to define UEnum types from Python
  - `ufunction(meta = None, ret = None, params = None, override = None, static = None, pure = None, getter = None, setter = None)` — decorator used to define UFunction fields from Python
  - `unregister_python_shutdown_callback(handle: object)` -> `None` — unregister the given handle from a previous call to register_python_shutdown_callback
  - `unregister_slate_post_tick_callback(handle: object)` -> `None` — unregister the given handle from a previous call to register_slate_post_tick_callback
  - `unregister_slate_pre_tick_callback(handle: object)` -> `None` — unregister the given handle from a previous call to register_slate_pre_tick_callback
  - `uproperty(type, meta = None, getter = None, setter = None)` — function used to define UProperty fields from Python
  - `ustruct()` — decorator used to define UStruct types from Python
  - `uvalue(val, meta = None)` — function used to define constant values from Python

### `unreal._EnumEntry`
Inherits: `object`

### `unreal._Logger`
Inherits: `BufferedIOBase`

**Methods** (5):
  - `close()` — Flush and close the IO object. This method has no effect if the file is already closed.
  - `detach()` — Disconnect this buffer from its underlying raw stream and return it. After the raw stream has been detached, the buffer ...
  - `flush()` — Flush write buffers, if applicable. This is not implemented for read-only and non-blocking streams.
  - `writable()` — Return whether object was opened for writing. If False, write() will raise OSError.
  - `write(b)` — Write the given buffer to the IO stream. Returns the number of bytes written, which is always the length of b in bytes. ...

### `unreal._ObjectBase`
Inherits: `_WrapperBase`

Type for all Unreal exposed object instances

**Methods** (20):
  - `call_method(name: str, args, kwargs)` -> `Any` — call a method on this object via Unreal reflection using the given ordered (a tuple passed as args) or named (a dict pas...
  - `cast(cls: Type [ _T ], object: object)` -> `_T` [classmethod] — cast the given object to this Unreal object type or raise an exception if the cast is not possible
  - `get_class()` -> `Class` — get the Unreal class of this instance
  - `get_default_object(cls: Type [ _T ])` -> `_T` [classmethod] — get the Unreal class default object (CDO) of this type
  - `get_editor_property(name: str)` -> `object` — get the value of any property visible to the editor
  - `get_fname()` -> `Name` — get the name of this instance
  - `get_full_name()` -> `str` — get the full name (class name + full path) of this instance
  - `get_name()` -> `str` — get the name of this instance
  - `get_outer()`
  - `get_outermost()` -> `Package` — get the outermost object (the package) from this instance
  - `get_package()` -> `Package` — get the package directly associated with this instance
  - `get_path_name()` -> `str` — get the path name of this instance
  - `get_typed_outer(type:Union[Class: Union[Class)`
  - `get_world()`
  - `is_package_external()` -> `bool` — returns true if this instance has a different package than its outer's package
  - `modify()`
  - `rename(name: Name | str = 'None', outer: Object | None = None)` -> `bool` — rename this instance and/or change its outer
  - `set_editor_properties(properties: Mapping [ str , object ])` -> `None` — set the value of any properties visible to the editor (from a name->value dict), ensuring that the pre/post change notif...
  - `set_editor_property(name: str, value: object, notify_mode: PropertyAccessChangeNotifyMode = PropertyAccessChangeNotifyMode.DEFAULT)` -> `None` — set the value of any property visible to the editor, ensuring that the pre/post change notifications are called
  - `static_class()` -> `Class` [classmethod] — get the Unreal class of this type

### `unreal._WrapperBase`
Inherits: `object`

Base type for all Unreal exposed types

### `unreal.ActorIterator`
Inherits: `object`

Type for iterating Unreal actor instances

### `unreal.Array`
Inherits: `_WrapperBase`

Type for all Unreal exposed array instances

**Methods** (15):
  - `__class_getitem__(args)` [classmethod] — __class_getitem__(cls, item: _ElemType) â implemented for type hinting purpose only
  - `__copy__()` -> `Array[_ElemType]` — copy this Unreal array
  - `append()`
  - `cast(type: Type [ _ElemType ], obj: object)` -> `Array[_ElemType]` [classmethod] — cast the given object to this Unreal array type
  - `clear()` -> `None` — remove all values from this Unreal array
  - `copy()` -> `Array[_ElemType]` — copy this Unreal array
  - `count(value: _ElemType)` -> `int` — return the number of times that value appears in this this Unreal array
  - `extend()`
  - `index(value:_ElemType: _ElemType, start:int=0: int, orraiseValueErrorifmissing(equivalenttoTArray::IndexOfByKeyinC++)`
  - `insert(index: int, value: _ElemType)` -> `None` — insert the given value at the given index in this Unreal array
  - `pop(index: int = -1)` -> `_ElemType` — remove and return the value at the given index in this Unreal array, or raise IndexError if the index is out-of-bounds
  - `remove(value: _ElemType)` -> `None` — remove the first matching value in this Unreal array, or raise ValueError if missing
  - `resize(len: int)` -> `None` — resize this Unreal array to hold the given number of elements
  - `reverse()` -> `None` — reverse this Unreal array in-place
  - `sort(key: Callable [ [ _ElemType ] , object ] | None = None, reverse: bool = False)` -> `None` — stable sort this Unreal array in-place

### `unreal.AutomationScheduler`
Inherits: `object`

Used to schedule python functions and generators to be run between editor ticks. One iteration of a generator is done per tick. It means that each yield statement will call for an editor tick. If a fu...

**Methods** (3):
  - `add_latent_command(task)` [classmethod] — Add a function or a generator to the AutomationScheduler schedule. Can be used as a decorator to add a function. Note th...
  - `cleanup()` [classmethod] — Force a shutdown of the singleton instance if any is running
  - `set_latent_command_timeout(seconds)` [classmethod] — Set the Python Automation Test latent command timeout in second

**Properties** (1):
  - `schedule` — Scheduled tasks as a priority list. It is None if the scheduler was not initiated.

### `unreal.ClassIterator`
Inherits: `object`

Type for iterating Unreal class types

### `unreal.DelegateBase`
Inherits: `_WrapperBase`

Type for all Unreal exposed delegate instances

**Methods** (10):
  - `__copy__()` -> `Any` — copy this Unreal delegate
  - `bind_callable(callable: Callable [ ... , Any ])` -> `None` — bind this Unreal delegate to a Python callable
  - `bind_delegate(delegate: DelegateBase)` -> `None` — bind this Unreal delegate to the same object and function as another delegate
  - `bind_function(obj: Object, name: Name | str)` -> `None` — bind this Unreal delegate to a named Unreal function on the given object instance
  - `cast(cls: Type [ _T ], object: object)` -> `_T` [classmethod] — cast the given object to this Unreal delegate type
  - `copy()` -> `Any` — copy this Unreal delegate
  - `execute(args)` -> `Any` — call this Unreal delegate, but error if it's unbound
  - `execute_if_bound(args)` -> `Any` — call this Unreal delegate, but only if it's bound to something
  - `is_bound()` -> `bool` — is this Unreal delegate bound to something?
  - `unbind()` -> `None` — unbind this Unreal delegate

### `unreal.EnumBase`
Inherits: `_WrapperBase`

Type for all Unreal exposed enum instances

**Methods** (3):
  - `cast(cls: Type [ _T ], object: object)` -> `_T` [classmethod] — cast the given object to this Unreal enum type
  - `get_display_name()` -> `Text` — get the UMETA display name of this type in the current culture
  - `static_enum()` -> `Enum` [classmethod] — get the Unreal enum of this type

### `unreal.FieldPath`
Inherits: `_WrapperBase`

Type for all Unreal exposed FieldPath instances

**Methods** (4):
  - `__copy__()` -> `FieldPath` — copy this Unreal field path
  - `cast(obj: object)` -> `FieldPath` [classmethod] — cast the given object to this Unreal field path type
  - `copy()` -> `FieldPath` — copy this Unreal field path
  - `is_valid()` -> `bool` — whether this Unreal field path refers to an existing Unreal field

### `unreal.FixedArray`
Inherits: `_WrapperBase`

Type for all Unreal exposed fixed-array instances

**Methods** (4):
  - `__class_getitem__(args)` [classmethod] — __class_getitem__(cls, item: _ElemType) â implemented for type hinting purpose only
  - `__copy__()` -> `FixedArray[_ElemType]` — copy this Unreal fixed-array
  - `cast(type: Type [ _ElemType ], obj: object)` -> `FixedArray[_ElemType]` [classmethod] — cast the given object to this Unreal fixed-array type
  - `copy()` -> `FixedArray[_ElemType]` — copy this Unreal fixed-array

### `unreal.FunctionDef`
Inherits: `object`

Type used to define UFunction fields from Python

### `unreal.Map`
Inherits: `_WrapperBase`

Type for all Unreal exposed map instances

**Methods** (14):
  - `__class_getitem__(args)` [classmethod] — __class_getitem__(cls, item) â implemented for type hinting purpose only
  - `__copy__()` -> `Map[_KeyType, _ValueType]` — copy this Unreal map
  - `cast(key: Type [ _KeyType ], value: Type [ _ValueType ], obj: object)` -> `Map[_KeyType, _ValueType]` [classmethod] — cast the given object to this Unreal map type
  - `clear()` -> `None` — remove all items from this Unreal map
  - `copy()` -> `Map[_KeyType, _ValueType]` — copy this Unreal map
  - `fromkeys()` [classmethod]
  - `get(key: _KeyType, default: _ValueType = ...)` -> `_ValueType` — x[key] if key in x, otherwise default
  - `items()` -> `ItemsView[_KeyType, _ValueType]` — a set-like view of the key->value pairs of this Unreal map
  - `keys()` -> `KeysView[_KeyType]` — a set-like view of the keys of this Unreal map
  - `pop(key: _KeyType, default: _ValueType = ...)` -> `_ValueType` — remove key and return its value, or default if key not present, or raise KeyError if no default
  - `popitem()` -> `Tuple[_KeyType, _ValueType]` — remove and return an arbitrary pair from this Unreal map, or raise KeyError if the map is empty
  - `setdefault(key: _KeyType, default: _ValueType = ...)` -> `_ValueType` — set key to default if key not in x and return the value of key
  - `update(pairs: Mapping [ _KeyType , _ValueType ] | Iterable [ Tuple [ _KeyType , _ValueType ] ] | Iterable [ List [ _KeyType | _ValueType ] ])` -> `None` — update this Unreal map from the given mapping or sequence pairs type or key->value arguments
  - `values()` -> `ValuesView[_ValueType]` — a view of the values of this Unreal map

### `unreal.MulticastDelegateBase`
Inherits: `_WrapperBase`

Type for all Unreal exposed multicast delegate instances

**Methods** (15):
  - `__copy__()` -> `Any` — copy this Unreal delegate
  - `add_callable(callable: Callable [ ... , Any ])` -> `None` — add a binding to a Python callable to the invocation list of this Unreal delegate
  - `add_callable_unique(callable: Callable [ ... , Any ])` -> `None` — add a unique binding to a Python callable to the invocation list of this Unreal delegate
  - `add_function(obj: Object, name: Name | str)` -> `None` — add a binding to a named Unreal function on the given object instance to the invocation list of this Unreal delegate
  - `add_function_unique(obj: Object, name: Name | str)` -> `None` — add a unique binding to a named Unreal function on the given object instance to the invocation list of this Unreal deleg...
  - `broadcast(args)` -> `None` — invoke this Unreal multicast delegate
  - `cast(cls: Type [ _T ], object: object)` -> `_T` [classmethod] — cast the given object to this Unreal delegate type
  - `clear()` -> `None` — clear the invocation list of this Unreal delegate
  - `contains_callable(callable: Callable [ ... , Any ])` -> `bool` — does the invocation list of this Unreal delegate contain a binding to a Python callable
  - `contains_function(obj: Object, name: Name | str)` -> `bool` — does the invocation list of this Unreal delegate contain a binding to a named Unreal function on the given object instan...
  - `copy()` -> `Any` — copy this Unreal delegate
  - `is_bound()` -> `bool` — is this Unreal delegate bound to something?
  - `remove_callable(callable: Callable [ ... , Any ])` -> `None` — remove a binding to a Python callable from the invocation list of this Unreal delegate
  - `remove_function(obj: Object, name: Name | str)` -> `None` — remove a binding to a named Unreal function on the given object instance from the invocation list of this Unreal delegat...
  - `remove_object(obj: Object)` -> `None` — remove all bindings for the given object instance from the invocation list of this Unreal delegate

### `unreal.Name`
Inherits: `_WrapperBase`

Type for all Unreal exposed name instances

**Methods** (3):
  - `cast(object: object)` -> `Name` [classmethod] — cast the given object to this Unreal name type
  - `is_none()` -> `bool` — is this Unreal name set to NAME_None?
  - `is_valid()` -> `bool` — is this Unreal name valid?

### `unreal.ObjectIterator`
Inherits: `object`

Type for iterating Unreal Object instances

### `unreal.PropertyDef`
Inherits: `object`

Type used to define FProperty fields from Python

### `unreal.ScopedEditorTransaction`
Inherits: `object`

Type used to create and managed a scoped editor transaction in Python

**Methods** (3):
  - `__enter__()` -> `ScopedEditorTransaction` — begin this transaction
  - `__exit__(type: Type [ BaseException ] | None, value: BaseException | None, traceback: TracebackType | None)` -> `bool` — end this transaction
  - `cancel()` -> `None` — cancel this transaction

### `unreal.ScopedSlowTask`
Inherits: `object`

Type used to create and managed a scoped slow task in Python

**Methods** (6):
  - `__enter__()` -> `ScopedSlowTask` — begin this slow task
  - `__exit__(type: Type [ BaseException ] | None, value: BaseException | None, traceback: TracebackType | None)` -> `bool` — end this slow task
  - `enter_progress_frame(work:float=1.0: float, desc:Union[Text: Union[Text)`
  - `make_dialog(can_cancel: bool = False, allow_in_pie: bool = False)` -> `None` — creates a new dialog for this slow task, if there is currently not one open
  - `make_dialog_delayed(delay: float, can_cancel: bool = False, allow_in_pie: bool = False)` -> `None` — creates a new dialog for this slow task after the given time delay (in seconds). If the task completes before this time,...
  - `should_cancel()` -> `bool` — True if the user has requested that the slow task be canceled

### `unreal.SelectedActorIterator`
Inherits: `object`

Type for iterating selected Unreal actor instances

### `unreal.Set`
Inherits: `_WrapperBase`

Type for all Unreal exposed set instances

**Methods** (20):
  - `__class_getitem__(args)` [classmethod] — __class_getitem__(cls, item: _ElemType) â implemented for type hinting purpose only
  - `__copy__()` -> `Set[_ElemType]` — copy this Unreal set
  - `add(value: _ElemType)` -> `None` — add the given value to this Unreal set if not already present
  - `cast(type: Type [ _ElemType ], obj: object)` -> `Set[_ElemType]` [classmethod] — cast the given object to this Unreal set type
  - `clear()` -> `None` — remove all values from this Unreal set
  - `copy()` -> `Set[_ElemType]` — copy this Unreal set
  - `difference(allvaluesthatareinthissetbutnottheothers)`
  - `difference_update(allvaluesthatareinthissetbutnottheothers)`
  - `discard(value: _ElemType)` -> `None` — remove the given value from this Unreal set, or do nothing if not present
  - `intersection(valuesthatarecommontoallofthesets)`
  - `intersection_update(valuesthatarecommontoallofthesets)`
  - `isdisjoint(other: Iterable [ _ElemType ])` -> `bool` — return True if there is a null intersection between this Unreal set and another
  - `issubset(other: Iterable [ _ElemType ])` -> `bool` — return True if another set contains this Unreal set
  - `issuperset(other: Iterable [ _ElemType ])` -> `bool` — return True if this Unreal set contains another
  - `pop()` -> `_ElemType` — remove and return an arbitrary value from this Unreal set, or raise KeyError if the set is empty
  - `remove(value: _ElemType)` -> `None` — remove the given value from this Unreal set, or raise KeyError if not present
  - `symmetric_difference(valuesthatareinexactlyoneofthesets)`
  - `symmetric_difference_update(valuesthatareinexactlyoneofthesets)`
  - `union(valuesthatareinanyset)`
  - `update(valuesthatareinanyset)`

### `unreal.StructBase`
Inherits: `_WrapperBase`

Type for all Unreal exposed struct instances

**Methods** (11):
  - `__copy__()` -> `Any` — copy this Unreal struct
  - `assign(other: object)` -> `None` — assign the value of this Unreal struct to value of the given object
  - `cast(cls: Type [ _T ], object: object | Mapping [ str , object ] | Iterable [ object ])` -> `_T` [classmethod] — cast the given object to this Unreal struct type. Can be partial Mapping[fieldName, fiedValue] or a sequence of field va...
  - `copy()` -> `Any` — copy this Unreal struct
  - `export_text()` -> `str` — exports the content of the Unreal struct of this type
  - `get_editor_property(name: Name | str)` -> `object` — get the value of any property visible to the editor
  - `import_text(content: str)` -> `bool` — imports the provided string into the Unreal struct
  - `set_editor_properties(properties: Mapping [ str , object ])` -> `None` — set the value of any properties visible to the editor (from a name->value dict), ensuring that the pre/post change notif...
  - `set_editor_property(name: Name | str, value: object, notify_mode: PropertyAccessChangeNotifyMode = PropertyAccessChangeNotifyMode.DEFAULT)` -> `None` — set the value of any property visible to the editor, ensuring that the pre/post change notifications are called
  - `static_struct()` -> `ScriptStruct` [classmethod] — get the Unreal struct of this type
  - `to_tuple()` -> `Tuple[object, ...]` — break this Unreal struct into a tuple of its properties

### `unreal.StructIterator`
Inherits: `object`

Type for iterating Unreal struct types

### `unreal.Text`
Inherits: `_WrapperBase`

Type for all Unreal exposed text instances

**Methods** (12):
  - `as_currency(val: int, code: str)` -> `Text` [classmethod] — convert the given number (specified in the smallest unit for the given currency i.e. 650 for $6.50) to a culture correct...
  - `as_number(num: float)` -> `Text` [classmethod] — convert the given number to a culture correct Unreal text representation
  - `as_percent(num: float)` -> `Text` [classmethod] — convert the given number to a culture correct Unreal text percentgage representation
  - `cast(object: object)` -> `Text` [classmethod] — cast the given object to this Unreal text type
  - `format()`
  - `is_culture_invariant()` -> `bool` — is this Unreal text culture invariant?
  - `is_empty()` -> `bool` — is this Unreal text empty?
  - `is_empty_or_whitespace()` -> `bool` — is this Unreal text empty or only whitespace?
  - `is_from_string_table()` -> `bool` — is this Unreal text referencing a string table entry?
  - `is_transient()` -> `bool` — is this Unreal text transient?
  - `to_lower()` -> `Text` — convert this Unreal text to lowercase in a culture correct way
  - `to_upper()` -> `Text` — convert this Unreal text to uppercase in a culture correct way

### `unreal.TypeIterator`
Inherits: `object`

Type for iterating Python types

### `unreal.ValueDef`
Inherits: `object`

Type used to define constant values from Python

### `unreal.AnimationNode_TwoWayBlend`
Inherits: `AnimNode_TwoWayBlend`

deprecated: âAnimationNode_TwoWayBlendâ was renamed to âAnimNode_TwoWayBlendâ.

### `unreal.AnimInfo`
Inherits: `AnimToTextureAnimInfo`

deprecated: âAnimInfoâ was renamed to âAnimToTextureAnimInfoâ.

### `unreal.AnimNextGraphInstancePtr`
Inherits: `AnimNextAnimGraph`

deprecated: âAnimNextGraphInstancePtrâ was renamed to âAnimNextAnimGraphâ.

### `unreal.AnimNextPlayAnimBlendSettings`
Inherits: `AnimNextInjectionBlendSettings`

deprecated: âAnimNextPlayAnimBlendSettingsâ was renamed to âAnimNextInjectionBlendSettingsâ.

### `unreal.AnimNode_BlendSpace`
Inherits: `AnimNode_BlendSpacePlayer`

deprecated: âAnimNode_BlendSpaceâ was renamed to âAnimNode_BlendSpacePlayerâ.

### `unreal.AnimNode_Layer`
Inherits: `AnimNode_LinkedAnimLayer`

deprecated: âAnimNode_Layerâ was renamed to âAnimNode_LinkedAnimLayerâ.

### `unreal.AnimNode_OrientationDriver`
Inherits: `AnimNode_PoseDriver`

deprecated: âAnimNode_OrientationDriverâ was renamed to âAnimNode_PoseDriverâ.

### `unreal.AnimNode_Ragdoll`
Inherits: `AnimNode_RigidBody`

deprecated: âAnimNode_Ragdollâ was renamed to âAnimNode_RigidBodyâ.

### `unreal.AnimNode_SubInput`
Inherits: `AnimNode_LinkedInputPose`

deprecated: âAnimNode_SubInputâ was renamed to âAnimNode_LinkedInputPoseâ.

### `unreal.AnimNode_SubInstance`
Inherits: `AnimNode_LinkedAnimGraph`

deprecated: âAnimNode_SubInstanceâ was renamed to âAnimNode_LinkedAnimGraphâ.

### `unreal.AnimSequenceInfo`
Inherits: `AnimToTextureAnimSequenceInfo`

deprecated: âAnimSequenceInfoâ was renamed to âAnimToTextureAnimSequenceInfoâ.

### `unreal.AttenuationSettings`
Inherits: `SoundAttenuationSettings`

deprecated: âAttenuationSettingsâ was renamed to âSoundAttenuationSettingsâ.

### `unreal.AvaAlignBetweenWeightedActor`
Inherits: `ActorModifierAlignBetweenWeightedActor`

deprecated: âAvaAlignBetweenWeightedActorâ was renamed to âActorModifierAlignBetweenWeightedActorâ.

### `unreal.AvaAnchorAlignment`
Inherits: `ActorModifierAnchorAlignment`

deprecated: âAvaAnchorAlignmentâ was renamed to âActorModifierAnchorAlignmentâ.

### `unreal.AvaAnimPlayParams`
Inherits: `AvaSequencePlayParams`

deprecated: âAvaAnimPlayParamsâ was renamed to âAvaSequencePlayParamsâ.

### `unreal.AvaCloneModifierCircleLayoutOptions`
Inherits: `AvaPatternModifierCircleLayoutOptions`

deprecated: âAvaCloneModifierCircleLayoutOptionsâ was renamed to âAvaPatternModifierCircleLayoutOptionsâ.

### `unreal.AvaCloneModifierGridLayoutOptions`
Inherits: `AvaPatternModifierGridLayoutOptions`

deprecated: âAvaCloneModifierGridLayoutOptionsâ was renamed to âAvaPatternModifierGridLayoutOptionsâ.

### `unreal.AvaCloneModifierLineLayoutOptions`
Inherits: `AvaPatternModifierLineLayoutOptions`

deprecated: âAvaCloneModifierLineLayoutOptionsâ was renamed to âAvaPatternModifierLineLayoutOptionsâ.

### `unreal.AvaClonerGridConstraintCylinder`
Inherits: `CEClonerGridConstraintCylinder`

deprecated: âAvaClonerGridConstraintCylinderâ was renamed to âCEClonerGridConstraintCylinderâ.

### `unreal.AvaClonerGridConstraintSphere`
Inherits: `CEClonerGridConstraintSphere`

deprecated: âAvaClonerGridConstraintSphereâ was renamed to âCEClonerGridConstraintSphereâ.

### `unreal.AvaClonerGridConstraintTexture`
Inherits: `CEClonerGridConstraintTexture`

deprecated: âAvaClonerGridConstraintTextureâ was renamed to âCEClonerGridConstraintTextureâ.

### `unreal.AvalanchePage`
Inherits: `AvaRundownPage`

deprecated: âAvalanchePageâ was renamed to âAvaRundownPageâ.

### `unreal.AvalancheRemoteControlValues`
Inherits: `AvaPlayableRemoteControlValues`

deprecated: âAvalancheRemoteControlValuesâ was renamed to âAvaPlayableRemoteControlValuesâ.

### `unreal.AvaPageListReference`
Inherits: `AvaRundownPageListReference`

deprecated: âAvaPageListReferenceâ was renamed to âAvaRundownPageListReferenceâ.

### `unreal.AvaSceneTreeActor`
Inherits: `ActorModifierSceneTreeActor`

deprecated: âAvaSceneTreeActorâ was renamed to âActorModifierSceneTreeActorâ.

### `unreal.AvaToolboxMaterialUVParameters`
Inherits: `AvaShapeMaterialUVParameters`

deprecated: âAvaToolboxMaterialUVParametersâ was renamed to âAvaShapeMaterialUVParametersâ.

### `unreal.AvaToolboxMeshData`
Inherits: `AvaShapeMeshData`

deprecated: âAvaToolboxMeshDataâ was renamed to âAvaShapeMeshDataâ.

### `unreal.AvaToolboxParametricMaterial`
Inherits: `AvaShapeParametricMaterial`

deprecated: âAvaToolboxParametricMaterialâ was renamed to âAvaShapeParametricMaterialâ.

### `unreal.AvaToolboxRectangleCornerSettings`
Inherits: `AvaShapeRectangleCornerSettings`

deprecated: âAvaToolboxRectangleCornerSettingsâ was renamed to âAvaShapeRectangleCornerSettingsâ.

### `unreal.AvaToolboxRoundedCorner`
Inherits: `AvaShapeRoundedCorner`

deprecated: âAvaToolboxRoundedCornerâ was renamed to âAvaShapeRoundedCornerâ.

### `unreal.AvaToolboxRoundedCornerSettings`
Inherits: `AvaShapeRoundedCornerSettings`

deprecated: âAvaToolboxRoundedCornerSettingsâ was renamed to âAvaShapeRoundedCornerSettingsâ.

### `unreal.BindableStructDesc`
Inherits: `PropertyBindingBindableStructDescriptor`

deprecated: âBindableStructDescâ was renamed to âPropertyBindingBindableStructDescriptorâ.

### `unreal.BlueprintCameraNodeEvaluationResult`
Inherits: `BlueprintCameraEvaluationDataRef`

deprecated: âBlueprintCameraNodeEvaluationResultâ was renamed to âBlueprintCameraEvaluationDataRefâ.

### `unreal.CameraShakeScrubParams`
Inherits: `CameraShakePatternScrubParams`

deprecated: âCameraShakeScrubParamsâ was renamed to âCameraShakePatternScrubParamsâ.

### `unreal.CameraShakeStartParams`
Inherits: `CameraShakePatternStartParams`

deprecated: âCameraShakeStartParamsâ was renamed to âCameraShakePatternStartParamsâ.

### `unreal.CameraShakeStopParams`
Inherits: `CameraShakePatternStopParams`

deprecated: âCameraShakeStopParamsâ was renamed to âCameraShakePatternStopParamsâ.

### `unreal.CameraShakeUpdateParams`
Inherits: `CameraShakePatternUpdateParams`

deprecated: âCameraShakeUpdateParamsâ was renamed to âCameraShakePatternUpdateParamsâ.

### `unreal.CameraShakeUpdateResult`
Inherits: `CameraShakePatternUpdateResult`

deprecated: âCameraShakeUpdateResultâ was renamed to âCameraShakePatternUpdateResultâ.

### `unreal.CameraTargetInfo`
Inherits: `CameraActorTargetInfo`

deprecated: âCameraTargetInfoâ was renamed to âCameraActorTargetInfoâ.

### `unreal.ConcertSyncClientInfo`
Inherits: `MultiUserClientInfo`

deprecated: âConcertSyncClientInfoâ was renamed to âMultiUserClientInfoâ.

### `unreal.ControlRigDrawContainer`
Inherits: `RigVMDrawContainer`

deprecated: âControlRigDrawContainerâ was renamed to âRigVMDrawContainerâ.

### `unreal.ControlRigDrawInstruction`
Inherits: `RigVMDrawInstruction`

deprecated: âControlRigDrawInstructionâ was renamed to âRigVMDrawInstructionâ.

### `unreal.ControlRigGizmoDefinition`
Inherits: `ControlRigShapeDefinition`

deprecated: âControlRigGizmoDefinitionâ was renamed to âControlRigShapeDefinitionâ.

### `unreal.ControlRigPythonSettings`
Inherits: `RigVMPythonSettings`

deprecated: âControlRigPythonSettingsâ was renamed to âRigVMPythonSettingsâ.

### `unreal.ControlRigTestDataVariable`
Inherits: `ControlRigReplayVariable`

deprecated: âControlRigTestDataVariableâ was renamed to âControlRigReplayVariableâ.

### `unreal.CoreTechSceneParameters`
Inherits: `ParametricSceneParameters`

deprecated: âCoreTechSceneParametersâ was renamed to âParametricSceneParametersâ.

### `unreal.CRFourPointBezier`
Inherits: `RigVMFourPointBezier`

deprecated: âCRFourPointBezierâ was renamed to âRigVMFourPointBezierâ.

### `unreal.CRSimPoint`
Inherits: `RigVMSimPoint`

deprecated: âCRSimPointâ was renamed to âRigVMSimPointâ.

### `unreal.CustomPropertyControlData`
Inherits: `PropertyAnimatorCoreData`

deprecated: âCustomPropertyControlDataâ was renamed to âPropertyAnimatorCoreDataâ.

### `unreal.DisplayClusterConfigurationMasterNode`
Inherits: `DisplayClusterConfigurationPrimaryNode`

deprecated: âDisplayClusterConfigurationMasterNodeâ was renamed to âDisplayClusterConfigurationPrimaryNodeâ.

### `unreal.DisplayClusterConfigurationMasterNodePorts`
Inherits: `DisplayClusterConfigurationPrimaryNodePorts`

deprecated: âDisplayClusterConfigurationMasterNodePortsâ was renamed to âDisplayClusterConfigurationPrimaryNodePortsâ.

### `unreal.DisplayClusterConfigurationMedia`
Inherits: `DisplayClusterConfigurationMediaViewport`

deprecated: âDisplayClusterConfigurationMediaâ was renamed to âDisplayClusterConfigurationMediaViewportâ.

### `unreal.DMXColorCIE1931xyY`
Inherits: `DMXGDTFColorCIE1931xyY`

deprecated: âDMXColorCIE1931xyYâ was renamed to âDMXGDTFColorCIE1931xyYâ.

### `unreal.EditorScriptingCreateProxyMeshActorOptions`
Inherits: `CreateProxyMeshActorOptions`

deprecated: âEditorScriptingCreateProxyMeshActorOptionsâ was renamed to âCreateProxyMeshActorOptionsâ.

### `unreal.EditorScriptingJoinStaticMeshActorsOptions`
Inherits: `JoinStaticMeshActorsOptions`

deprecated: âEditorScriptingJoinStaticMeshActorsOptionsâ was renamed to âJoinStaticMeshActorsOptionsâ.

### `unreal.EditorScriptingMergeStaticMeshActorsOptions`
Inherits: `MergeStaticMeshActorsOptions`

deprecated: âEditorScriptingMergeStaticMeshActorsOptionsâ was renamed to âMergeStaticMeshActorsOptionsâ.

### `unreal.EditorScriptingMeshReductionOptions`
Inherits: `StaticMeshReductionOptions`

deprecated: âEditorScriptingMeshReductionOptionsâ was renamed to âStaticMeshReductionOptionsâ.

### `unreal.EditorScriptingMeshReductionSettings`
Inherits: `StaticMeshReductionSettings`

deprecated: âEditorScriptingMeshReductionSettingsâ was renamed to âStaticMeshReductionSettingsâ.

### `unreal.FormatTextArgument`
Inherits: `FormatArgumentData`

deprecated: âFormatTextArgumentâ was renamed to âFormatArgumentDataâ.

### `unreal.HapticFeedbackDetails`
Inherits: `HapticFeedbackDetails_Curve`

deprecated: âHapticFeedbackDetailsâ was renamed to âHapticFeedbackDetails_Curveâ.

### `unreal.InteractiveToolPresetDefintion`
Inherits: `InteractiveToolPresetDefinition`

deprecated: âInteractiveToolPresetDefintionâ was renamed to âInteractiveToolPresetDefinitionâ.

### `unreal.KeyboardEvent`
Inherits: `KeyEvent`

deprecated: âKeyboardEventâ was renamed to âKeyEventâ.

### `unreal.KeyboardFocusEvent`
Inherits: `FocusEvent`

deprecated: âKeyboardFocusEventâ was renamed to âFocusEventâ.

### `unreal.KinematicDefaultInputs`
Inherits: `CharacterDefaultInputs`

deprecated: âKinematicDefaultInputsâ was renamed to âCharacterDefaultInputsâ.

### `unreal.KinematicMoverAuxStateContext`
Inherits: `MoverAuxStateContext`

deprecated: âKinematicMoverAuxStateContextâ was renamed to âMoverAuxStateContextâ.

### `unreal.KinematicMoverInputCmdContext`
Inherits: `MoverInputCmdContext`

deprecated: âKinematicMoverInputCmdContextâ was renamed to âMoverInputCmdContextâ.

### `unreal.KinematicMoverSyncState`
Inherits: `MoverSyncState`

deprecated: âKinematicMoverSyncStateâ was renamed to âMoverSyncStateâ.

### `unreal.KinematicMoverTickEndData`
Inherits: `MoverTickEndData`

deprecated: âKinematicMoverTickEndDataâ was renamed to âMoverTickEndDataâ.

### `unreal.KinematicMoverTickStartData`
Inherits: `MoverTickStartData`

deprecated: âKinematicMoverTickStartDataâ was renamed to âMoverTickStartDataâ.

### `unreal.LayeredMove_JumpImpulse`
Inherits: `LayeredMove_JumpImpulseOverDuration`

deprecated: âLayeredMove_JumpImpulseâ was renamed to âLayeredMove_JumpImpulseOverDurationâ.

### `unreal.LevelSequencePlaybackSettings`
Inherits: `MovieSceneSequencePlaybackSettings`

deprecated: âLevelSequencePlaybackSettingsâ was renamed to âMovieSceneSequencePlaybackSettingsâ.

### `unreal.MassProcessingContext`
Inherits: `MassProcessingContext_DEPRECATED`

deprecated: âMassProcessingContextâ was renamed to âMassProcessingContext_DEPRECATEDâ.

### `unreal.MetasoundEditorGraphInputBoolRef`
Inherits: `MetasoundEditorGraphMemberDefaultBoolRef`

deprecated: âMetasoundEditorGraphInputBoolRefâ was renamed to âMetasoundEditorGraphMemberDefaultBoolRefâ.

### `unreal.MetasoundEditorGraphInputIntRef`
Inherits: `MetasoundEditorGraphMemberDefaultIntRef`

deprecated: âMetasoundEditorGraphInputIntRefâ was renamed to âMetasoundEditorGraphMemberDefaultIntRefâ.

### `unreal.MetasoundEditorGraphInputObjectRef`
Inherits: `MetasoundEditorGraphMemberDefaultObjectRef`

deprecated: âMetasoundEditorGraphInputObjectRefâ was renamed to âMetasoundEditorGraphMemberDefaultObjectRefâ.

### `unreal.MovieSceneObjectBindingPtr`
Inherits: `MovieSceneObjectBindingID`

deprecated: âMovieSceneObjectBindingPtrâ was renamed to âMovieSceneObjectBindingIDâ.

### `unreal.MrcLensDistortion`
Inherits: `OpenCVLensDistortionParameters`

deprecated: âMrcLensDistortionâ was renamed to âOpenCVLensDistortionParametersâ.

### `unreal.MVVMViewModelPropertyPath`
Inherits: `MVVMBlueprintPropertyPath`

deprecated: âMVVMViewModelPropertyPathâ was renamed to âMVVMBlueprintPropertyPathâ.

### `unreal.MVVMWidgetPropertyPath`
Inherits: `MVVMBlueprintPropertyPath`

deprecated: âMVVMWidgetPropertyPathâ was renamed to âMVVMBlueprintPropertyPathâ.

### `unreal.NiagaraScalabilityOverrides`
Inherits: `NiagaraSystemScalabilityOverride`

deprecated: âNiagaraScalabilityOverridesâ was renamed to âNiagaraSystemScalabilityOverrideâ.

### `unreal.NiagaraScalabilitySettings`
Inherits: `NiagaraSystemScalabilitySettings`

deprecated: âNiagaraScalabilitySettingsâ was renamed to âNiagaraSystemScalabilitySettingsâ.

### `unreal.OptimusMultiLevelDataDomain`
Inherits: `OptimusDataDomain`

deprecated: âOptimusMultiLevelDataDomainâ was renamed to âOptimusDataDomainâ.

### `unreal.PCGActorPropertyOverrideDescription`
Inherits: `PCGObjectPropertyOverrideDescription`

deprecated: âPCGActorPropertyOverrideDescriptionâ was renamed to âPCGObjectPropertyOverrideDescriptionâ.

### `unreal.PCGPointFilterThresholdSettings`
Inherits: `PCGAttributeFilterThresholdSettings`

deprecated: âPCGPointFilterThresholdSettingsâ was renamed to âPCGAttributeFilterThresholdSettingsâ.

### `unreal.ProceduralFoliageTypeData`
Inherits: `FoliageTypeObject`

deprecated: âProceduralFoliageTypeDataâ was renamed to âFoliageTypeObjectâ.

### `unreal.RigGraphDisplaySettings`
Inherits: `RigVMEdGraphDisplaySettings`

deprecated: âRigGraphDisplaySettingsâ was renamed to âRigVMEdGraphDisplaySettingsâ.

### `unreal.RigJoint`
Inherits: `RigBone`

deprecated: âRigJointâ was renamed to âRigBoneâ.

### `unreal.RigMirrorSettings`
Inherits: `RigVMMirrorSettings`

deprecated: âRigMirrorSettingsâ was renamed to âRigVMMirrorSettingsâ.

### `unreal.RigUnit_AccumulateBase`
Inherits: `RigVMFunction_AccumulateBase`

deprecated: âRigUnit_AccumulateBaseâ was renamed to âRigVMFunction_AccumulateBaseâ.

### `unreal.RigUnit_AccumulateFloatAdd`
Inherits: `RigVMFunction_AccumulateFloatAdd`

deprecated: âRigUnit_AccumulateFloatAddâ was renamed to âRigVMFunction_AccumulateFloatAddâ.

### `unreal.RigUnit_AccumulateFloatLerp`
Inherits: `RigVMFunction_AccumulateFloatLerp`

deprecated: âRigUnit_AccumulateFloatLerpâ was renamed to âRigVMFunction_AccumulateFloatLerpâ.

### `unreal.RigUnit_AccumulateFloatMul`
Inherits: `RigVMFunction_AccumulateFloatMul`

deprecated: âRigUnit_AccumulateFloatMulâ was renamed to âRigVMFunction_AccumulateFloatMulâ.

### `unreal.RigUnit_AccumulateFloatRange`
Inherits: `RigVMFunction_AccumulateFloatRange`

deprecated: âRigUnit_AccumulateFloatRangeâ was renamed to âRigVMFunction_AccumulateFloatRangeâ.

### `unreal.RigUnit_AccumulateQuatLerp`
Inherits: `RigVMFunction_AccumulateQuatLerp`

deprecated: âRigUnit_AccumulateQuatLerpâ was renamed to âRigVMFunction_AccumulateQuatLerpâ.

### `unreal.RigUnit_AccumulateQuatMul`
Inherits: `RigVMFunction_AccumulateQuatMul`

deprecated: âRigUnit_AccumulateQuatMulâ was renamed to âRigVMFunction_AccumulateQuatMulâ.

### `unreal.RigUnit_AccumulateTransformLerp`
Inherits: `RigVMFunction_AccumulateTransformLerp`

deprecated: âRigUnit_AccumulateTransformLerpâ was renamed to âRigVMFunction_AccumulateTransformLerpâ.

### `unreal.RigUnit_AccumulateTransformMul`
Inherits: `RigVMFunction_AccumulateTransformMul`

deprecated: âRigUnit_AccumulateTransformMulâ was renamed to âRigVMFunction_AccumulateTransformMulâ.

### `unreal.RigUnit_AccumulateVectorAdd`
Inherits: `RigVMFunction_AccumulateVectorAdd`

deprecated: âRigUnit_AccumulateVectorAddâ was renamed to âRigVMFunction_AccumulateVectorAddâ.

### `unreal.RigUnit_AccumulateVectorLerp`
Inherits: `RigVMFunction_AccumulateVectorLerp`

deprecated: âRigUnit_AccumulateVectorLerpâ was renamed to âRigVMFunction_AccumulateVectorLerpâ.

### `unreal.RigUnit_AccumulateVectorMul`
Inherits: `RigVMFunction_AccumulateVectorMul`

deprecated: âRigUnit_AccumulateVectorMulâ was renamed to âRigVMFunction_AccumulateVectorMulâ.

### `unreal.RigUnit_AccumulateVectorRange`
Inherits: `RigVMFunction_AccumulateVectorRange`

deprecated: âRigUnit_AccumulateVectorRangeâ was renamed to âRigVMFunction_AccumulateVectorRangeâ.

### `unreal.RigUnit_AlphaInterp`
Inherits: `RigVMFunction_AlphaInterp`

deprecated: âRigUnit_AlphaInterpâ was renamed to âRigVMFunction_AlphaInterpâ.

### `unreal.RigUnit_AlphaInterpQuat`
Inherits: `RigVMFunction_AlphaInterpQuat`

deprecated: âRigUnit_AlphaInterpQuatâ was renamed to âRigVMFunction_AlphaInterpQuatâ.

### `unreal.RigUnit_AlphaInterpVector`
Inherits: `RigVMFunction_AlphaInterpVector`

deprecated: âRigUnit_AlphaInterpVectorâ was renamed to âRigVMFunction_AlphaInterpVectorâ.

### `unreal.RigUnit_AnimBase`
Inherits: `RigVMFunction_AnimBase`

deprecated: âRigUnit_AnimBaseâ was renamed to âRigVMFunction_AnimBaseâ.

### `unreal.RigUnit_AnimEasing`
Inherits: `RigVMFunction_AnimEasing`

deprecated: âRigUnit_AnimEasingâ was renamed to âRigVMFunction_AnimEasingâ.

### `unreal.RigUnit_AnimEasingType`
Inherits: `RigVMFunction_AnimEasingType`

deprecated: âRigUnit_AnimEasingTypeâ was renamed to âRigVMFunction_AnimEasingTypeâ.

### `unreal.RigUnit_AnimEvalRichCurve`
Inherits: `RigVMFunction_AnimEvalRichCurve`

deprecated: âRigUnit_AnimEvalRichCurveâ was renamed to âRigVMFunction_AnimEvalRichCurveâ.

### `unreal.RigUnit_AnimNextRunAnimationGraph`
Inherits: `RigUnit_AnimNextRunAnimationGraph_v1`

deprecated: âRigUnit_AnimNextRunAnimationGraphâ was renamed to âRigUnit_AnimNextRunAnimationGraph_v1â.

### `unreal.RigUnit_AnimRichCurve`
Inherits: `RigVMFunction_AnimRichCurve`

deprecated: âRigUnit_AnimRichCurveâ was renamed to âRigVMFunction_AnimRichCurveâ.

### `unreal.RigUnit_Contains`
Inherits: `RigVMFunction_Contains`

deprecated: âRigUnit_Containsâ was renamed to âRigVMFunction_Containsâ.

### `unreal.RigUnit_DebugPoint`
Inherits: `RigVMFunction_DebugPoint`

deprecated: âRigUnit_DebugPointâ was renamed to âRigVMFunction_DebugPointâ.

### `unreal.RigUnit_DebugPointMutable`
Inherits: `RigVMFunction_DebugPointMutable`

deprecated: âRigUnit_DebugPointMutableâ was renamed to âRigVMFunction_DebugPointMutableâ.

### `unreal.RigUnit_DeltaFromPreviousFloat`
Inherits: `RigVMFunction_DeltaFromPreviousFloat`

deprecated: âRigUnit_DeltaFromPreviousFloatâ was renamed to âRigVMFunction_DeltaFromPreviousFloatâ.

### `unreal.RigUnit_DeltaFromPreviousQuat`
Inherits: `RigVMFunction_DeltaFromPreviousQuat`

deprecated: âRigUnit_DeltaFromPreviousQuatâ was renamed to âRigVMFunction_DeltaFromPreviousQuatâ.

### `unreal.RigUnit_DeltaFromPreviousTransform`
Inherits: `RigVMFunction_DeltaFromPreviousTransform`

deprecated: âRigUnit_DeltaFromPreviousTransformâ was renamed to âRigVMFunction_DeltaFromPreviousTransformâ.

### `unreal.RigUnit_DeltaFromPreviousVector`
Inherits: `RigVMFunction_DeltaFromPreviousVector`

deprecated: âRigUnit_DeltaFromPreviousVectorâ was renamed to âRigVMFunction_DeltaFromPreviousVectorâ.

### `unreal.RigUnit_EndsWith`
Inherits: `RigVMFunction_EndsWith`

deprecated: âRigUnit_EndsWithâ was renamed to âRigVMFunction_EndsWithâ.

### `unreal.RigUnit_ForLoopCount`
Inherits: `RigVMFunction_ForLoopCount`

deprecated: âRigUnit_ForLoopCountâ was renamed to âRigVMFunction_ForLoopCountâ.

### `unreal.RigUnit_FramesToSeconds`
Inherits: `RigVMFunction_FramesToSeconds`

deprecated: âRigUnit_FramesToSecondsâ was renamed to âRigVMFunction_FramesToSecondsâ.

### `unreal.RigUnit_GetDeltaTime`
Inherits: `RigVMFunction_GetDeltaTime`

deprecated: âRigUnit_GetDeltaTimeâ was renamed to âRigVMFunction_GetDeltaTimeâ.

### `unreal.RigUnit_GetWorldTime`
Inherits: `RigVMFunction_GetWorldTime`

deprecated: âRigUnit_GetWorldTimeâ was renamed to âRigVMFunction_GetWorldTimeâ.

### `unreal.RigUnit_KalmanFloat`
Inherits: `RigVMFunction_KalmanFloat`

deprecated: âRigUnit_KalmanFloatâ was renamed to âRigVMFunction_KalmanFloatâ.

### `unreal.RigUnit_KalmanTransform`
Inherits: `RigVMFunction_KalmanTransform`

deprecated: âRigUnit_KalmanTransformâ was renamed to âRigVMFunction_KalmanTransformâ.

### `unreal.RigUnit_KalmanVector`
Inherits: `RigVMFunction_KalmanVector`

deprecated: âRigUnit_KalmanVectorâ was renamed to âRigVMFunction_KalmanVectorâ.

### `unreal.RigUnit_MathBase`
Inherits: `RigVMFunction_MathBase`

deprecated: âRigUnit_MathBaseâ was renamed to âRigVMFunction_MathBaseâ.

### `unreal.RigUnit_MathBoolAnd`
Inherits: `RigVMFunction_MathBoolAnd`

deprecated: âRigUnit_MathBoolAndâ was renamed to âRigVMFunction_MathBoolAndâ.

### `unreal.RigUnit_MathBoolBase`
Inherits: `RigVMFunction_MathBoolBase`

deprecated: âRigUnit_MathBoolBaseâ was renamed to âRigVMFunction_MathBoolBaseâ.

### `unreal.RigUnit_MathBoolBinaryAggregateOp`
Inherits: `RigVMFunction_MathBoolBinaryAggregateOp`

deprecated: âRigUnit_MathBoolBinaryAggregateOpâ was renamed to âRigVMFunction_MathBoolBinaryAggregateOpâ.

### `unreal.RigUnit_MathBoolBinaryOp`
Inherits: `RigVMFunction_MathBoolBinaryOp`

deprecated: âRigUnit_MathBoolBinaryOpâ was renamed to âRigVMFunction_MathBoolBinaryOpâ.

### `unreal.RigUnit_MathBoolConstant`
Inherits: `RigVMFunction_MathBoolConstant`

deprecated: âRigUnit_MathBoolConstantâ was renamed to âRigVMFunction_MathBoolConstantâ.

### `unreal.RigUnit_MathBoolConstFalse`
Inherits: `RigVMFunction_MathBoolConstFalse`

deprecated: âRigUnit_MathBoolConstFalseâ was renamed to âRigVMFunction_MathBoolConstFalseâ.

### `unreal.RigUnit_MathBoolConstTrue`
Inherits: `RigVMFunction_MathBoolConstTrue`

deprecated: âRigUnit_MathBoolConstTrueâ was renamed to âRigVMFunction_MathBoolConstTrueâ.

### `unreal.RigUnit_MathBoolEquals`
Inherits: `RigVMFunction_MathBoolEquals`

deprecated: âRigUnit_MathBoolEqualsâ was renamed to âRigVMFunction_MathBoolEqualsâ.

### `unreal.RigUnit_MathBoolFlipFlop`
Inherits: `RigVMFunction_MathBoolFlipFlop`

deprecated: âRigUnit_MathBoolFlipFlopâ was renamed to âRigVMFunction_MathBoolFlipFlopâ.

### `unreal.RigUnit_MathBoolMake`
Inherits: `RigVMFunction_MathBoolMake`

deprecated: âRigUnit_MathBoolMakeâ was renamed to âRigVMFunction_MathBoolMakeâ.

### `unreal.RigUnit_MathBoolNand`
Inherits: `RigVMFunction_MathBoolNand`

deprecated: âRigUnit_MathBoolNandâ was renamed to âRigVMFunction_MathBoolNandâ.

### `unreal.RigUnit_MathBoolNand2`
Inherits: `RigVMFunction_MathBoolNand2`

deprecated: âRigUnit_MathBoolNand2â was renamed to âRigVMFunction_MathBoolNand2â.

### `unreal.RigUnit_MathBoolNot`
Inherits: `RigVMFunction_MathBoolNot`

deprecated: âRigUnit_MathBoolNotâ was renamed to âRigVMFunction_MathBoolNotâ.

### `unreal.RigUnit_MathBoolNotEquals`
Inherits: `RigVMFunction_MathBoolNotEquals`

deprecated: âRigUnit_MathBoolNotEqualsâ was renamed to âRigVMFunction_MathBoolNotEqualsâ.

### `unreal.RigUnit_MathBoolOnce`
Inherits: `RigVMFunction_MathBoolOnce`

deprecated: âRigUnit_MathBoolOnceâ was renamed to âRigVMFunction_MathBoolOnceâ.

### `unreal.RigUnit_MathBoolOr`
Inherits: `RigVMFunction_MathBoolOr`

deprecated: âRigUnit_MathBoolOrâ was renamed to âRigVMFunction_MathBoolOrâ.

### `unreal.RigUnit_MathBoolToFloat`
Inherits: `RigVMFunction_MathBoolToFloat`

deprecated: âRigUnit_MathBoolToFloatâ was renamed to âRigVMFunction_MathBoolToFloatâ.

### `unreal.RigUnit_MathBoolToggled`
Inherits: `RigVMFunction_MathBoolToggled`

deprecated: âRigUnit_MathBoolToggledâ was renamed to âRigVMFunction_MathBoolToggledâ.

### `unreal.RigUnit_MathBoolToInteger`
Inherits: `RigVMFunction_MathBoolToInteger`

deprecated: âRigUnit_MathBoolToIntegerâ was renamed to âRigVMFunction_MathBoolToIntegerâ.

### `unreal.RigUnit_MathBoolUnaryOp`
Inherits: `RigVMFunction_MathBoolUnaryOp`

deprecated: âRigUnit_MathBoolUnaryOpâ was renamed to âRigVMFunction_MathBoolUnaryOpâ.

### `unreal.RigUnit_MathColorAdd`
Inherits: `RigVMFunction_MathColorAdd`

deprecated: âRigUnit_MathColorAddâ was renamed to âRigVMFunction_MathColorAddâ.

### `unreal.RigUnit_MathColorBase`
Inherits: `RigVMFunction_MathColorBase`

deprecated: âRigUnit_MathColorBaseâ was renamed to âRigVMFunction_MathColorBaseâ.

### `unreal.RigUnit_MathColorBinaryAggregateOp`
Inherits: `RigVMFunction_MathColorBinaryAggregateOp`

deprecated: âRigUnit_MathColorBinaryAggregateOpâ was renamed to âRigVMFunction_MathColorBinaryAggregateOpâ.

### `unreal.RigUnit_MathColorBinaryOp`
Inherits: `RigVMFunction_MathColorBinaryOp`

deprecated: âRigUnit_MathColorBinaryOpâ was renamed to âRigVMFunction_MathColorBinaryOpâ.

### `unreal.RigUnit_MathColorFromDouble`
Inherits: `RigVMFunction_MathColorFromDouble`

deprecated: âRigUnit_MathColorFromDoubleâ was renamed to âRigVMFunction_MathColorFromDoubleâ.

### `unreal.RigUnit_MathColorFromFloat`
Inherits: `RigVMFunction_MathColorFromFloat`

deprecated: âRigUnit_MathColorFromFloatâ was renamed to âRigVMFunction_MathColorFromFloatâ.

### `unreal.RigUnit_MathColorLerp`
Inherits: `RigVMFunction_MathColorLerp`

deprecated: âRigUnit_MathColorLerpâ was renamed to âRigVMFunction_MathColorLerpâ.

### `unreal.RigUnit_MathColorMake`
Inherits: `RigVMFunction_MathColorMake`

deprecated: âRigUnit_MathColorMakeâ was renamed to âRigVMFunction_MathColorMakeâ.

### `unreal.RigUnit_MathColorMul`
Inherits: `RigVMFunction_MathColorMul`

deprecated: âRigUnit_MathColorMulâ was renamed to âRigVMFunction_MathColorMulâ.

### `unreal.RigUnit_MathColorSub`
Inherits: `RigVMFunction_MathColorSub`

deprecated: âRigUnit_MathColorSubâ was renamed to âRigVMFunction_MathColorSubâ.

### `unreal.RigUnit_MathDistanceToPlane`
Inherits: `RigVMFunction_MathDistanceToPlane`

deprecated: âRigUnit_MathDistanceToPlaneâ was renamed to âRigVMFunction_MathDistanceToPlaneâ.

### `unreal.RigUnit_MathDoubleAbs`
Inherits: `RigVMFunction_MathDoubleAbs`

deprecated: âRigUnit_MathDoubleAbsâ was renamed to âRigVMFunction_MathDoubleAbsâ.

### `unreal.RigUnit_MathDoubleAcos`
Inherits: `RigVMFunction_MathDoubleAcos`

deprecated: âRigUnit_MathDoubleAcosâ was renamed to âRigVMFunction_MathDoubleAcosâ.

### `unreal.RigUnit_MathDoubleAdd`
Inherits: `RigVMFunction_MathDoubleAdd`

deprecated: âRigUnit_MathDoubleAddâ was renamed to âRigVMFunction_MathDoubleAddâ.

### `unreal.RigUnit_MathDoubleAsin`
Inherits: `RigVMFunction_MathDoubleAsin`

deprecated: âRigUnit_MathDoubleAsinâ was renamed to âRigVMFunction_MathDoubleAsinâ.

### `unreal.RigUnit_MathDoubleAtan`
Inherits: `RigVMFunction_MathDoubleAtan`

deprecated: âRigUnit_MathDoubleAtanâ was renamed to âRigVMFunction_MathDoubleAtanâ.

### `unreal.RigUnit_MathDoubleBase`
Inherits: `RigVMFunction_MathDoubleBase`

deprecated: âRigUnit_MathDoubleBaseâ was renamed to âRigVMFunction_MathDoubleBaseâ.

### `unreal.RigUnit_MathDoubleBinaryAggregateOp`
Inherits: `RigVMFunction_MathDoubleBinaryAggregateOp`

deprecated: âRigUnit_MathDoubleBinaryAggregateOpâ was renamed to âRigVMFunction_MathDoubleBinaryAggregateOpâ.

### `unreal.RigUnit_MathDoubleBinaryOp`
Inherits: `RigVMFunction_MathDoubleBinaryOp`

deprecated: âRigUnit_MathDoubleBinaryOpâ was renamed to âRigVMFunction_MathDoubleBinaryOpâ.

### `unreal.RigUnit_MathDoubleCeil`
Inherits: `RigVMFunction_MathDoubleCeil`

deprecated: âRigUnit_MathDoubleCeilâ was renamed to âRigVMFunction_MathDoubleCeilâ.

### `unreal.RigUnit_MathDoubleClamp`
Inherits: `RigVMFunction_MathDoubleClamp`

deprecated: âRigUnit_MathDoubleClampâ was renamed to âRigVMFunction_MathDoubleClampâ.

### `unreal.RigUnit_MathDoubleConstant`
Inherits: `RigVMFunction_MathDoubleConstant`

deprecated: âRigUnit_MathDoubleConstantâ was renamed to âRigVMFunction_MathDoubleConstantâ.

### `unreal.RigUnit_MathDoubleConstE`
Inherits: `RigVMFunction_MathDoubleConstE`

deprecated: âRigUnit_MathDoubleConstEâ was renamed to âRigVMFunction_MathDoubleConstEâ.

### `unreal.RigUnit_MathDoubleConstHalfPi`
Inherits: `RigVMFunction_MathDoubleConstHalfPi`

deprecated: âRigUnit_MathDoubleConstHalfPiâ was renamed to âRigVMFunction_MathDoubleConstHalfPiâ.

### `unreal.RigUnit_MathDoubleConstPi`
Inherits: `RigVMFunction_MathDoubleConstPi`

deprecated: âRigUnit_MathDoubleConstPiâ was renamed to âRigVMFunction_MathDoubleConstPiâ.

### `unreal.RigUnit_MathDoubleConstTwoPi`
Inherits: `RigVMFunction_MathDoubleConstTwoPi`

deprecated: âRigUnit_MathDoubleConstTwoPiâ was renamed to âRigVMFunction_MathDoubleConstTwoPiâ.

### `unreal.RigUnit_MathDoubleCos`
Inherits: `RigVMFunction_MathDoubleCos`

deprecated: âRigUnit_MathDoubleCosâ was renamed to âRigVMFunction_MathDoubleCosâ.

### `unreal.RigUnit_MathDoubleDeg`
Inherits: `RigVMFunction_MathDoubleDeg`

deprecated: âRigUnit_MathDoubleDegâ was renamed to âRigVMFunction_MathDoubleDegâ.

### `unreal.RigUnit_MathDoubleDiv`
Inherits: `RigVMFunction_MathDoubleDiv`

deprecated: âRigUnit_MathDoubleDivâ was renamed to âRigVMFunction_MathDoubleDivâ.

### `unreal.RigUnit_MathDoubleEquals`
Inherits: `RigVMFunction_MathDoubleEquals`

deprecated: âRigUnit_MathDoubleEqualsâ was renamed to âRigVMFunction_MathDoubleEqualsâ.

### `unreal.RigUnit_MathDoubleExponential`
Inherits: `RigVMFunction_MathDoubleExponential`

deprecated: âRigUnit_MathDoubleExponentialâ was renamed to âRigVMFunction_MathDoubleExponentialâ.

### `unreal.RigUnit_MathDoubleFloor`
Inherits: `RigVMFunction_MathDoubleFloor`

deprecated: âRigUnit_MathDoubleFloorâ was renamed to âRigVMFunction_MathDoubleFloorâ.

### `unreal.RigUnit_MathDoubleGreater`
Inherits: `RigVMFunction_MathDoubleGreater`

deprecated: âRigUnit_MathDoubleGreaterâ was renamed to âRigVMFunction_MathDoubleGreaterâ.

### `unreal.RigUnit_MathDoubleGreaterEqual`
Inherits: `RigVMFunction_MathDoubleGreaterEqual`

deprecated: âRigUnit_MathDoubleGreaterEqualâ was renamed to âRigVMFunction_MathDoubleGreaterEqualâ.

### `unreal.RigUnit_MathDoubleIsNearlyEqual`
Inherits: `RigVMFunction_MathDoubleIsNearlyEqual`

deprecated: âRigUnit_MathDoubleIsNearlyEqualâ was renamed to âRigVMFunction_MathDoubleIsNearlyEqualâ.

### `unreal.RigUnit_MathDoubleIsNearlyZero`
Inherits: `RigVMFunction_MathDoubleIsNearlyZero`

deprecated: âRigUnit_MathDoubleIsNearlyZeroâ was renamed to âRigVMFunction_MathDoubleIsNearlyZeroâ.

### `unreal.RigUnit_MathDoubleLawOfCosine`
Inherits: `RigVMFunction_MathDoubleLawOfCosine`

deprecated: âRigUnit_MathDoubleLawOfCosineâ was renamed to âRigVMFunction_MathDoubleLawOfCosineâ.

### `unreal.RigUnit_MathDoubleLerp`
Inherits: `RigVMFunction_MathDoubleLerp`

deprecated: âRigUnit_MathDoubleLerpâ was renamed to âRigVMFunction_MathDoubleLerpâ.

### `unreal.RigUnit_MathDoubleLess`
Inherits: `RigVMFunction_MathDoubleLess`

deprecated: âRigUnit_MathDoubleLessâ was renamed to âRigVMFunction_MathDoubleLessâ.

### `unreal.RigUnit_MathDoubleLessEqual`
Inherits: `RigVMFunction_MathDoubleLessEqual`

deprecated: âRigUnit_MathDoubleLessEqualâ was renamed to âRigVMFunction_MathDoubleLessEqualâ.

### `unreal.RigUnit_MathDoubleMake`
Inherits: `RigVMFunction_MathDoubleMake`

deprecated: âRigUnit_MathDoubleMakeâ was renamed to âRigVMFunction_MathDoubleMakeâ.

### `unreal.RigUnit_MathDoubleMax`
Inherits: `RigVMFunction_MathDoubleMax`

deprecated: âRigUnit_MathDoubleMaxâ was renamed to âRigVMFunction_MathDoubleMaxâ.

### `unreal.RigUnit_MathDoubleMin`
Inherits: `RigVMFunction_MathDoubleMin`

deprecated: âRigUnit_MathDoubleMinâ was renamed to âRigVMFunction_MathDoubleMinâ.

### `unreal.RigUnit_MathDoubleMod`
Inherits: `RigVMFunction_MathDoubleMod`

deprecated: âRigUnit_MathDoubleModâ was renamed to âRigVMFunction_MathDoubleModâ.

### `unreal.RigUnit_MathDoubleMul`
Inherits: `RigVMFunction_MathDoubleMul`

deprecated: âRigUnit_MathDoubleMulâ was renamed to âRigVMFunction_MathDoubleMulâ.

### `unreal.RigUnit_MathDoubleNegate`
Inherits: `RigVMFunction_MathDoubleNegate`

deprecated: âRigUnit_MathDoubleNegateâ was renamed to âRigVMFunction_MathDoubleNegateâ.

### `unreal.RigUnit_MathDoubleNotEquals`
Inherits: `RigVMFunction_MathDoubleNotEquals`

deprecated: âRigUnit_MathDoubleNotEqualsâ was renamed to âRigVMFunction_MathDoubleNotEqualsâ.

### `unreal.RigUnit_MathDoublePow`
Inherits: `RigVMFunction_MathDoublePow`

deprecated: âRigUnit_MathDoublePowâ was renamed to âRigVMFunction_MathDoublePowâ.

### `unreal.RigUnit_MathDoubleRad`
Inherits: `RigVMFunction_MathDoubleRad`

deprecated: âRigUnit_MathDoubleRadâ was renamed to âRigVMFunction_MathDoubleRadâ.

### `unreal.RigUnit_MathDoubleRemap`
Inherits: `RigVMFunction_MathDoubleRemap`

deprecated: âRigUnit_MathDoubleRemapâ was renamed to âRigVMFunction_MathDoubleRemapâ.

### `unreal.RigUnit_MathDoubleRound`
Inherits: `RigVMFunction_MathDoubleRound`

deprecated: âRigUnit_MathDoubleRoundâ was renamed to âRigVMFunction_MathDoubleRoundâ.

### `unreal.RigUnit_MathDoubleSign`
Inherits: `RigVMFunction_MathDoubleSign`

deprecated: âRigUnit_MathDoubleSignâ was renamed to âRigVMFunction_MathDoubleSignâ.

### `unreal.RigUnit_MathDoubleSin`
Inherits: `RigVMFunction_MathDoubleSin`

deprecated: âRigUnit_MathDoubleSinâ was renamed to âRigVMFunction_MathDoubleSinâ.

### `unreal.RigUnit_MathDoubleSqrt`
Inherits: `RigVMFunction_MathDoubleSqrt`

deprecated: âRigUnit_MathDoubleSqrtâ was renamed to âRigVMFunction_MathDoubleSqrtâ.

### `unreal.RigUnit_MathDoubleSub`
Inherits: `RigVMFunction_MathDoubleSub`

deprecated: âRigUnit_MathDoubleSubâ was renamed to âRigVMFunction_MathDoubleSubâ.

### `unreal.RigUnit_MathDoubleTan`
Inherits: `RigVMFunction_MathDoubleTan`

deprecated: âRigUnit_MathDoubleTanâ was renamed to âRigVMFunction_MathDoubleTanâ.

### `unreal.RigUnit_MathDoubleToInt`
Inherits: `RigVMFunction_MathDoubleToInt`

deprecated: âRigUnit_MathDoubleToIntâ was renamed to âRigVMFunction_MathDoubleToIntâ.

### `unreal.RigUnit_MathDoubleUnaryOp`
Inherits: `RigVMFunction_MathDoubleUnaryOp`

deprecated: âRigUnit_MathDoubleUnaryOpâ was renamed to âRigVMFunction_MathDoubleUnaryOpâ.

### `unreal.RigUnit_MathFloatAbs`
Inherits: `RigVMFunction_MathFloatAbs`

deprecated: âRigUnit_MathFloatAbsâ was renamed to âRigVMFunction_MathFloatAbsâ.

### `unreal.RigUnit_MathFloatAcos`
Inherits: `RigVMFunction_MathFloatAcos`

deprecated: âRigUnit_MathFloatAcosâ was renamed to âRigVMFunction_MathFloatAcosâ.

### `unreal.RigUnit_MathFloatAdd`
Inherits: `RigVMFunction_MathFloatAdd`

deprecated: âRigUnit_MathFloatAddâ was renamed to âRigVMFunction_MathFloatAddâ.

### `unreal.RigUnit_MathFloatAsin`
Inherits: `RigVMFunction_MathFloatAsin`

deprecated: âRigUnit_MathFloatAsinâ was renamed to âRigVMFunction_MathFloatAsinâ.

### `unreal.RigUnit_MathFloatAtan`
Inherits: `RigVMFunction_MathFloatAtan`

deprecated: âRigUnit_MathFloatAtanâ was renamed to âRigVMFunction_MathFloatAtanâ.

### `unreal.RigUnit_MathFloatBase`
Inherits: `RigVMFunction_MathFloatBase`

deprecated: âRigUnit_MathFloatBaseâ was renamed to âRigVMFunction_MathFloatBaseâ.

### `unreal.RigUnit_MathFloatBinaryAggregateOp`
Inherits: `RigVMFunction_MathFloatBinaryAggregateOp`

deprecated: âRigUnit_MathFloatBinaryAggregateOpâ was renamed to âRigVMFunction_MathFloatBinaryAggregateOpâ.

### `unreal.RigUnit_MathFloatBinaryOp`
Inherits: `RigVMFunction_MathFloatBinaryOp`

deprecated: âRigUnit_MathFloatBinaryOpâ was renamed to âRigVMFunction_MathFloatBinaryOpâ.

### `unreal.RigUnit_MathFloatCeil`
Inherits: `RigVMFunction_MathFloatCeil`

deprecated: âRigUnit_MathFloatCeilâ was renamed to âRigVMFunction_MathFloatCeilâ.

### `unreal.RigUnit_MathFloatClamp`
Inherits: `RigVMFunction_MathFloatClamp`

deprecated: âRigUnit_MathFloatClampâ was renamed to âRigVMFunction_MathFloatClampâ.

### `unreal.RigUnit_MathFloatConstant`
Inherits: `RigVMFunction_MathFloatConstant`

deprecated: âRigUnit_MathFloatConstantâ was renamed to âRigVMFunction_MathFloatConstantâ.

### `unreal.RigUnit_MathFloatConstE`
Inherits: `RigVMFunction_MathFloatConstE`

deprecated: âRigUnit_MathFloatConstEâ was renamed to âRigVMFunction_MathFloatConstEâ.

### `unreal.RigUnit_MathFloatConstHalfPi`
Inherits: `RigVMFunction_MathFloatConstHalfPi`

deprecated: âRigUnit_MathFloatConstHalfPiâ was renamed to âRigVMFunction_MathFloatConstHalfPiâ.

### `unreal.RigUnit_MathFloatConstPi`
Inherits: `RigVMFunction_MathFloatConstPi`

deprecated: âRigUnit_MathFloatConstPiâ was renamed to âRigVMFunction_MathFloatConstPiâ.

### `unreal.RigUnit_MathFloatConstTwoPi`
Inherits: `RigVMFunction_MathFloatConstTwoPi`

deprecated: âRigUnit_MathFloatConstTwoPiâ was renamed to âRigVMFunction_MathFloatConstTwoPiâ.

### `unreal.RigUnit_MathFloatCos`
Inherits: `RigVMFunction_MathFloatCos`

deprecated: âRigUnit_MathFloatCosâ was renamed to âRigVMFunction_MathFloatCosâ.

### `unreal.RigUnit_MathFloatDeg`
Inherits: `RigVMFunction_MathFloatDeg`

deprecated: âRigUnit_MathFloatDegâ was renamed to âRigVMFunction_MathFloatDegâ.

### `unreal.RigUnit_MathFloatDiv`
Inherits: `RigVMFunction_MathFloatDiv`

deprecated: âRigUnit_MathFloatDivâ was renamed to âRigVMFunction_MathFloatDivâ.

### `unreal.RigUnit_MathFloatEquals`
Inherits: `RigVMFunction_MathFloatEquals`

deprecated: âRigUnit_MathFloatEqualsâ was renamed to âRigVMFunction_MathFloatEqualsâ.

### `unreal.RigUnit_MathFloatExponential`
Inherits: `RigVMFunction_MathFloatExponential`

deprecated: âRigUnit_MathFloatExponentialâ was renamed to âRigVMFunction_MathFloatExponentialâ.

### `unreal.RigUnit_MathFloatFloor`
Inherits: `RigVMFunction_MathFloatFloor`

deprecated: âRigUnit_MathFloatFloorâ was renamed to âRigVMFunction_MathFloatFloorâ.

### `unreal.RigUnit_MathFloatGreater`
Inherits: `RigVMFunction_MathFloatGreater`

deprecated: âRigUnit_MathFloatGreaterâ was renamed to âRigVMFunction_MathFloatGreaterâ.

### `unreal.RigUnit_MathFloatGreaterEqual`
Inherits: `RigVMFunction_MathFloatGreaterEqual`

deprecated: âRigUnit_MathFloatGreaterEqualâ was renamed to âRigVMFunction_MathFloatGreaterEqualâ.

### `unreal.RigUnit_MathFloatIsNearlyEqual`
Inherits: `RigVMFunction_MathFloatIsNearlyEqual`

deprecated: âRigUnit_MathFloatIsNearlyEqualâ was renamed to âRigVMFunction_MathFloatIsNearlyEqualâ.

### `unreal.RigUnit_MathFloatIsNearlyZero`
Inherits: `RigVMFunction_MathFloatIsNearlyZero`

deprecated: âRigUnit_MathFloatIsNearlyZeroâ was renamed to âRigVMFunction_MathFloatIsNearlyZeroâ.

### `unreal.RigUnit_MathFloatLawOfCosine`
Inherits: `RigVMFunction_MathFloatLawOfCosine`

deprecated: âRigUnit_MathFloatLawOfCosineâ was renamed to âRigVMFunction_MathFloatLawOfCosineâ.

### `unreal.RigUnit_MathFloatLerp`
Inherits: `RigVMFunction_MathFloatLerp`

deprecated: âRigUnit_MathFloatLerpâ was renamed to âRigVMFunction_MathFloatLerpâ.

### `unreal.RigUnit_MathFloatLess`
Inherits: `RigVMFunction_MathFloatLess`

deprecated: âRigUnit_MathFloatLessâ was renamed to âRigVMFunction_MathFloatLessâ.

### `unreal.RigUnit_MathFloatLessEqual`
Inherits: `RigVMFunction_MathFloatLessEqual`

deprecated: âRigUnit_MathFloatLessEqualâ was renamed to âRigVMFunction_MathFloatLessEqualâ.

### `unreal.RigUnit_MathFloatMake`
Inherits: `RigVMFunction_MathFloatMake`

deprecated: âRigUnit_MathFloatMakeâ was renamed to âRigVMFunction_MathFloatMakeâ.

### `unreal.RigUnit_MathFloatMax`
Inherits: `RigVMFunction_MathFloatMax`

deprecated: âRigUnit_MathFloatMaxâ was renamed to âRigVMFunction_MathFloatMaxâ.

### `unreal.RigUnit_MathFloatMin`
Inherits: `RigVMFunction_MathFloatMin`

deprecated: âRigUnit_MathFloatMinâ was renamed to âRigVMFunction_MathFloatMinâ.

### `unreal.RigUnit_MathFloatMod`
Inherits: `RigVMFunction_MathFloatMod`

deprecated: âRigUnit_MathFloatModâ was renamed to âRigVMFunction_MathFloatModâ.

### `unreal.RigUnit_MathFloatMul`
Inherits: `RigVMFunction_MathFloatMul`

deprecated: âRigUnit_MathFloatMulâ was renamed to âRigVMFunction_MathFloatMulâ.

### `unreal.RigUnit_MathFloatNegate`
Inherits: `RigVMFunction_MathFloatNegate`

deprecated: âRigUnit_MathFloatNegateâ was renamed to âRigVMFunction_MathFloatNegateâ.

### `unreal.RigUnit_MathFloatNotEquals`
Inherits: `RigVMFunction_MathFloatNotEquals`

deprecated: âRigUnit_MathFloatNotEqualsâ was renamed to âRigVMFunction_MathFloatNotEqualsâ.

### `unreal.RigUnit_MathFloatPow`
Inherits: `RigVMFunction_MathFloatPow`

deprecated: âRigUnit_MathFloatPowâ was renamed to âRigVMFunction_MathFloatPowâ.

### `unreal.RigUnit_MathFloatRad`
Inherits: `RigVMFunction_MathFloatRad`

deprecated: âRigUnit_MathFloatRadâ was renamed to âRigVMFunction_MathFloatRadâ.

### `unreal.RigUnit_MathFloatRemap`
Inherits: `RigVMFunction_MathFloatRemap`

deprecated: âRigUnit_MathFloatRemapâ was renamed to âRigVMFunction_MathFloatRemapâ.

### `unreal.RigUnit_MathFloatRound`
Inherits: `RigVMFunction_MathFloatRound`

deprecated: âRigUnit_MathFloatRoundâ was renamed to âRigVMFunction_MathFloatRoundâ.

### `unreal.RigUnit_MathFloatSelectBool`
Inherits: `RigVMFunction_MathFloatSelectBool`

deprecated: âRigUnit_MathFloatSelectBoolâ was renamed to âRigVMFunction_MathFloatSelectBoolâ.

### `unreal.RigUnit_MathFloatSign`
Inherits: `RigVMFunction_MathFloatSign`

deprecated: âRigUnit_MathFloatSignâ was renamed to âRigVMFunction_MathFloatSignâ.

### `unreal.RigUnit_MathFloatSin`
Inherits: `RigVMFunction_MathFloatSin`

deprecated: âRigUnit_MathFloatSinâ was renamed to âRigVMFunction_MathFloatSinâ.

### `unreal.RigUnit_MathFloatSqrt`
Inherits: `RigVMFunction_MathFloatSqrt`

deprecated: âRigUnit_MathFloatSqrtâ was renamed to âRigVMFunction_MathFloatSqrtâ.

### `unreal.RigUnit_MathFloatSub`
Inherits: `RigVMFunction_MathFloatSub`

deprecated: âRigUnit_MathFloatSubâ was renamed to âRigVMFunction_MathFloatSubâ.

### `unreal.RigUnit_MathFloatTan`
Inherits: `RigVMFunction_MathFloatTan`

deprecated: âRigUnit_MathFloatTanâ was renamed to âRigVMFunction_MathFloatTanâ.

### `unreal.RigUnit_MathFloatToInt`
Inherits: `RigVMFunction_MathFloatToInt`

deprecated: âRigUnit_MathFloatToIntâ was renamed to âRigVMFunction_MathFloatToIntâ.

### `unreal.RigUnit_MathFloatUnaryOp`
Inherits: `RigVMFunction_MathFloatUnaryOp`

deprecated: âRigUnit_MathFloatUnaryOpâ was renamed to âRigVMFunction_MathFloatUnaryOpâ.

### `unreal.RigUnit_MathIntAbs`
Inherits: `RigVMFunction_MathIntAbs`

deprecated: âRigUnit_MathIntAbsâ was renamed to âRigVMFunction_MathIntAbsâ.

### `unreal.RigUnit_MathIntAdd`
Inherits: `RigVMFunction_MathIntAdd`

deprecated: âRigUnit_MathIntAddâ was renamed to âRigVMFunction_MathIntAddâ.

### `unreal.RigUnit_MathIntBase`
Inherits: `RigVMFunction_MathIntBase`

deprecated: âRigUnit_MathIntBaseâ was renamed to âRigVMFunction_MathIntBaseâ.

### `unreal.RigUnit_MathIntBinaryAggregateOp`
Inherits: `RigVMFunction_MathIntBinaryAggregateOp`

deprecated: âRigUnit_MathIntBinaryAggregateOpâ was renamed to âRigVMFunction_MathIntBinaryAggregateOpâ.

### `unreal.RigUnit_MathIntBinaryOp`
Inherits: `RigVMFunction_MathIntBinaryOp`

deprecated: âRigUnit_MathIntBinaryOpâ was renamed to âRigVMFunction_MathIntBinaryOpâ.

### `unreal.RigUnit_MathIntClamp`
Inherits: `RigVMFunction_MathIntClamp`

deprecated: âRigUnit_MathIntClampâ was renamed to âRigVMFunction_MathIntClampâ.

### `unreal.RigUnit_MathIntDiv`
Inherits: `RigVMFunction_MathIntDiv`

deprecated: âRigUnit_MathIntDivâ was renamed to âRigVMFunction_MathIntDivâ.

### `unreal.RigUnit_MathIntEquals`
Inherits: `RigVMFunction_MathIntEquals`

deprecated: âRigUnit_MathIntEqualsâ was renamed to âRigVMFunction_MathIntEqualsâ.

### `unreal.RigUnit_MathIntersectPlane`
Inherits: `RigVMFunction_MathIntersectPlane`

deprecated: âRigUnit_MathIntersectPlaneâ was renamed to âRigVMFunction_MathIntersectPlaneâ.

### `unreal.RigUnit_MathIntGreater`
Inherits: `RigVMFunction_MathIntGreater`

deprecated: âRigUnit_MathIntGreaterâ was renamed to âRigVMFunction_MathIntGreaterâ.

### `unreal.RigUnit_MathIntGreaterEqual`
Inherits: `RigVMFunction_MathIntGreaterEqual`

deprecated: âRigUnit_MathIntGreaterEqualâ was renamed to âRigVMFunction_MathIntGreaterEqualâ.

### `unreal.RigUnit_MathIntLess`
Inherits: `RigVMFunction_MathIntLess`

deprecated: âRigUnit_MathIntLessâ was renamed to âRigVMFunction_MathIntLessâ.

### `unreal.RigUnit_MathIntLessEqual`
Inherits: `RigVMFunction_MathIntLessEqual`

deprecated: âRigUnit_MathIntLessEqualâ was renamed to âRigVMFunction_MathIntLessEqualâ.

### `unreal.RigUnit_MathIntMake`
Inherits: `RigVMFunction_MathIntMake`

deprecated: âRigUnit_MathIntMakeâ was renamed to âRigVMFunction_MathIntMakeâ.

### `unreal.RigUnit_MathIntMax`
Inherits: `RigVMFunction_MathIntMax`

deprecated: âRigUnit_MathIntMaxâ was renamed to âRigVMFunction_MathIntMaxâ.

### `unreal.RigUnit_MathIntMin`
Inherits: `RigVMFunction_MathIntMin`

deprecated: âRigUnit_MathIntMinâ was renamed to âRigVMFunction_MathIntMinâ.

### `unreal.RigUnit_MathIntMod`
Inherits: `RigVMFunction_MathIntMod`

deprecated: âRigUnit_MathIntModâ was renamed to âRigVMFunction_MathIntModâ.

### `unreal.RigUnit_MathIntMul`
Inherits: `RigVMFunction_MathIntMul`

deprecated: âRigUnit_MathIntMulâ was renamed to âRigVMFunction_MathIntMulâ.

### `unreal.RigUnit_MathIntNegate`
Inherits: `RigVMFunction_MathIntNegate`

deprecated: âRigUnit_MathIntNegateâ was renamed to âRigVMFunction_MathIntNegateâ.

### `unreal.RigUnit_MathIntNotEquals`
Inherits: `RigVMFunction_MathIntNotEquals`

deprecated: âRigUnit_MathIntNotEqualsâ was renamed to âRigVMFunction_MathIntNotEqualsâ.

### `unreal.RigUnit_MathIntPow`
Inherits: `RigVMFunction_MathIntPow`

deprecated: âRigUnit_MathIntPowâ was renamed to âRigVMFunction_MathIntPowâ.

### `unreal.RigUnit_MathIntSign`
Inherits: `RigVMFunction_MathIntSign`

deprecated: âRigUnit_MathIntSignâ was renamed to âRigVMFunction_MathIntSignâ.

### `unreal.RigUnit_MathIntSub`
Inherits: `RigVMFunction_MathIntSub`

deprecated: âRigUnit_MathIntSubâ was renamed to âRigVMFunction_MathIntSubâ.

### `unreal.RigUnit_MathIntToDouble`
Inherits: `RigVMFunction_MathIntToDouble`

deprecated: âRigUnit_MathIntToDoubleâ was renamed to âRigVMFunction_MathIntToDoubleâ.

### `unreal.RigUnit_MathIntToFloat`
Inherits: `RigVMFunction_MathIntToFloat`

deprecated: âRigUnit_MathIntToFloatâ was renamed to âRigVMFunction_MathIntToFloatâ.

### `unreal.RigUnit_MathIntUnaryOp`
Inherits: `RigVMFunction_MathIntUnaryOp`

deprecated: âRigUnit_MathIntUnaryOpâ was renamed to âRigVMFunction_MathIntUnaryOpâ.

### `unreal.RigUnit_MathMatrixBase`
Inherits: `RigVMFunction_MathMatrixBase`

deprecated: âRigUnit_MathMatrixBaseâ was renamed to âRigVMFunction_MathMatrixBaseâ.

### `unreal.RigUnit_MathMatrixBinaryAggregateOp`
Inherits: `RigVMFunction_MathMatrixBinaryAggregateOp`

deprecated: âRigUnit_MathMatrixBinaryAggregateOpâ was renamed to âRigVMFunction_MathMatrixBinaryAggregateOpâ.

### `unreal.RigUnit_MathMatrixBinaryOp`
Inherits: `RigVMFunction_MathMatrixBinaryOp`

deprecated: âRigUnit_MathMatrixBinaryOpâ was renamed to âRigVMFunction_MathMatrixBinaryOpâ.

### `unreal.RigUnit_MathMatrixFromTransform`
Inherits: `RigVMFunction_MathMatrixFromTransform`

deprecated: âRigUnit_MathMatrixFromTransformâ was renamed to âRigVMFunction_MathMatrixFromTransformâ.

### `unreal.RigUnit_MathMatrixFromTransformV2`
Inherits: `RigVMFunction_MathMatrixFromTransformV2`

deprecated: âRigUnit_MathMatrixFromTransformV2â was renamed to âRigVMFunction_MathMatrixFromTransformV2â.

### `unreal.RigUnit_MathMatrixFromVectors`
Inherits: `RigVMFunction_MathMatrixFromVectors`

deprecated: âRigUnit_MathMatrixFromVectorsâ was renamed to âRigVMFunction_MathMatrixFromVectorsâ.

### `unreal.RigUnit_MathMatrixInverse`
Inherits: `RigVMFunction_MathMatrixInverse`

deprecated: âRigUnit_MathMatrixInverseâ was renamed to âRigVMFunction_MathMatrixInverseâ.

### `unreal.RigUnit_MathMatrixMul`
Inherits: `RigVMFunction_MathMatrixMul`

deprecated: âRigUnit_MathMatrixMulâ was renamed to âRigVMFunction_MathMatrixMulâ.

### `unreal.RigUnit_MathMatrixToTransform`
Inherits: `RigVMFunction_MathMatrixToTransform`

deprecated: âRigUnit_MathMatrixToTransformâ was renamed to âRigVMFunction_MathMatrixToTransformâ.

### `unreal.RigUnit_MathMatrixToVectors`
Inherits: `RigVMFunction_MathMatrixToVectors`

deprecated: âRigUnit_MathMatrixToVectorsâ was renamed to âRigVMFunction_MathMatrixToVectorsâ.

### `unreal.RigUnit_MathMatrixUnaryOp`
Inherits: `RigVMFunction_MathMatrixUnaryOp`

deprecated: âRigUnit_MathMatrixUnaryOpâ was renamed to âRigVMFunction_MathMatrixUnaryOpâ.

### `unreal.RigUnit_MathMutableBase`
Inherits: `RigVMFunction_MathMutableBase`

deprecated: âRigUnit_MathMutableBaseâ was renamed to âRigVMFunction_MathMutableBaseâ.

### `unreal.RigUnit_MathQuaternionBase`
Inherits: `RigVMFunction_MathQuaternionBase`

deprecated: âRigUnit_MathQuaternionBaseâ was renamed to âRigVMFunction_MathQuaternionBaseâ.

### `unreal.RigUnit_MathQuaternionBinaryAggregateOp`
Inherits: `RigVMFunction_MathQuaternionBinaryAggregateOp`

deprecated: âRigUnit_MathQuaternionBinaryAggregateOpâ was renamed to âRigVMFunction_MathQuaternionBinaryAggregateOpâ.

### `unreal.RigUnit_MathQuaternionBinaryOp`
Inherits: `RigVMFunction_MathQuaternionBinaryOp`

deprecated: âRigUnit_MathQuaternionBinaryOpâ was renamed to âRigVMFunction_MathQuaternionBinaryOpâ.

### `unreal.RigUnit_MathQuaternionDot`
Inherits: `RigVMFunction_MathQuaternionDot`

deprecated: âRigUnit_MathQuaternionDotâ was renamed to âRigVMFunction_MathQuaternionDotâ.

### `unreal.RigUnit_MathQuaternionEquals`
Inherits: `RigVMFunction_MathQuaternionEquals`

deprecated: âRigUnit_MathQuaternionEqualsâ was renamed to âRigVMFunction_MathQuaternionEqualsâ.

### `unreal.RigUnit_MathQuaternionFromAxisAndAngle`
Inherits: `RigVMFunction_MathQuaternionFromAxisAndAngle`

deprecated: âRigUnit_MathQuaternionFromAxisAndAngleâ was renamed to âRigVMFunction_MathQuaternionFromAxisAndAngleâ.

### `unreal.RigUnit_MathQuaternionFromEuler`
Inherits: `RigVMFunction_MathQuaternionFromEuler`

deprecated: âRigUnit_MathQuaternionFromEulerâ was renamed to âRigVMFunction_MathQuaternionFromEulerâ.

### `unreal.RigUnit_MathQuaternionFromRotator`
Inherits: `RigVMFunction_MathQuaternionFromRotator`

deprecated: âRigUnit_MathQuaternionFromRotatorâ was renamed to âRigVMFunction_MathQuaternionFromRotatorâ.

### `unreal.RigUnit_MathQuaternionFromRotatorV2`
Inherits: `RigVMFunction_MathQuaternionFromRotatorV2`

deprecated: âRigUnit_MathQuaternionFromRotatorV2â was renamed to âRigVMFunction_MathQuaternionFromRotatorV2â.

### `unreal.RigUnit_MathQuaternionFromTwoVectors`
Inherits: `RigVMFunction_MathQuaternionFromTwoVectors`

deprecated: âRigUnit_MathQuaternionFromTwoVectorsâ was renamed to âRigVMFunction_MathQuaternionFromTwoVectorsâ.

### `unreal.RigUnit_MathQuaternionGetAxis`
Inherits: `RigVMFunction_MathQuaternionGetAxis`

deprecated: âRigUnit_MathQuaternionGetAxisâ was renamed to âRigVMFunction_MathQuaternionGetAxisâ.

### `unreal.RigUnit_MathQuaternionInverse`
Inherits: `RigVMFunction_MathQuaternionInverse`

deprecated: âRigUnit_MathQuaternionInverseâ was renamed to âRigVMFunction_MathQuaternionInverseâ.

### `unreal.RigUnit_MathQuaternionMake`
Inherits: `RigVMFunction_MathQuaternionMake`

deprecated: âRigUnit_MathQuaternionMakeâ was renamed to âRigVMFunction_MathQuaternionMakeâ.

### `unreal.RigUnit_MathQuaternionMakeAbsolute`
Inherits: `RigVMFunction_MathQuaternionMakeAbsolute`

deprecated: âRigUnit_MathQuaternionMakeAbsoluteâ was renamed to âRigVMFunction_MathQuaternionMakeAbsoluteâ.

### `unreal.RigUnit_MathQuaternionMakeRelative`
Inherits: `RigVMFunction_MathQuaternionMakeRelative`

deprecated: âRigUnit_MathQuaternionMakeRelativeâ was renamed to âRigVMFunction_MathQuaternionMakeRelativeâ.

### `unreal.RigUnit_MathQuaternionMirrorTransform`
Inherits: `RigVMFunction_MathQuaternionMirrorTransform`

deprecated: âRigUnit_MathQuaternionMirrorTransformâ was renamed to âRigVMFunction_MathQuaternionMirrorTransformâ.

### `unreal.RigUnit_MathQuaternionMul`
Inherits: `RigVMFunction_MathQuaternionMul`

deprecated: âRigUnit_MathQuaternionMulâ was renamed to âRigVMFunction_MathQuaternionMulâ.

### `unreal.RigUnit_MathQuaternionNotEquals`
Inherits: `RigVMFunction_MathQuaternionNotEquals`

deprecated: âRigUnit_MathQuaternionNotEqualsâ was renamed to âRigVMFunction_MathQuaternionNotEqualsâ.

### `unreal.RigUnit_MathQuaternionRotateVector`
Inherits: `RigVMFunction_MathQuaternionRotateVector`

deprecated: âRigUnit_MathQuaternionRotateVectorâ was renamed to âRigVMFunction_MathQuaternionRotateVectorâ.

### `unreal.RigUnit_MathQuaternionRotationOrder`
Inherits: `RigVMFunction_MathQuaternionRotationOrder`

deprecated: âRigUnit_MathQuaternionRotationOrderâ was renamed to âRigVMFunction_MathQuaternionRotationOrderâ.

### `unreal.RigUnit_MathQuaternionScale`
Inherits: `RigVMFunction_MathQuaternionScale`

deprecated: âRigUnit_MathQuaternionScaleâ was renamed to âRigVMFunction_MathQuaternionScaleâ.

### `unreal.RigUnit_MathQuaternionScaleV2`
Inherits: `RigVMFunction_MathQuaternionScaleV2`

deprecated: âRigUnit_MathQuaternionScaleV2â was renamed to âRigVMFunction_MathQuaternionScaleV2â.

### `unreal.RigUnit_MathQuaternionSelectBool`
Inherits: `RigVMFunction_MathQuaternionSelectBool`

deprecated: âRigUnit_MathQuaternionSelectBoolâ was renamed to âRigVMFunction_MathQuaternionSelectBoolâ.

### `unreal.RigUnit_MathQuaternionSlerp`
Inherits: `RigVMFunction_MathQuaternionSlerp`

deprecated: âRigUnit_MathQuaternionSlerpâ was renamed to âRigVMFunction_MathQuaternionSlerpâ.

### `unreal.RigUnit_MathQuaternionSwingTwist`
Inherits: `RigVMFunction_MathQuaternionSwingTwist`

deprecated: âRigUnit_MathQuaternionSwingTwistâ was renamed to âRigVMFunction_MathQuaternionSwingTwistâ.

### `unreal.RigUnit_MathQuaternionToAxisAndAngle`
Inherits: `RigVMFunction_MathQuaternionToAxisAndAngle`

deprecated: âRigUnit_MathQuaternionToAxisAndAngleâ was renamed to âRigVMFunction_MathQuaternionToAxisAndAngleâ.

### `unreal.RigUnit_MathQuaternionToEuler`
Inherits: `RigVMFunction_MathQuaternionToEuler`

deprecated: âRigUnit_MathQuaternionToEulerâ was renamed to âRigVMFunction_MathQuaternionToEulerâ.

### `unreal.RigUnit_MathQuaternionToRotator`
Inherits: `RigVMFunction_MathQuaternionToRotator`

deprecated: âRigUnit_MathQuaternionToRotatorâ was renamed to âRigVMFunction_MathQuaternionToRotatorâ.

### `unreal.RigUnit_MathQuaternionUnaryOp`
Inherits: `RigVMFunction_MathQuaternionUnaryOp`

deprecated: âRigUnit_MathQuaternionUnaryOpâ was renamed to âRigVMFunction_MathQuaternionUnaryOpâ.

### `unreal.RigUnit_MathQuaternionUnit`
Inherits: `RigVMFunction_MathQuaternionUnit`

deprecated: âRigUnit_MathQuaternionUnitâ was renamed to âRigVMFunction_MathQuaternionUnitâ.

### `unreal.RigUnit_MathRBFInterpolateBase`
Inherits: `RigVMFunction_MathRBFInterpolateBase`

deprecated: âRigUnit_MathRBFInterpolateBaseâ was renamed to âRigVMFunction_MathRBFInterpolateBaseâ.

### `unreal.RigUnit_MathRBFInterpolateQuatBase`
Inherits: `RigVMFunction_MathRBFInterpolateQuatBase`

deprecated: âRigUnit_MathRBFInterpolateQuatBaseâ was renamed to âRigVMFunction_MathRBFInterpolateQuatBaseâ.

### `unreal.RigUnit_MathRBFInterpolateQuatColor`
Inherits: `RigVMFunction_MathRBFInterpolateQuatColor`

deprecated: âRigUnit_MathRBFInterpolateQuatColorâ was renamed to âRigVMFunction_MathRBFInterpolateQuatColorâ.

### `unreal.RigUnit_MathRBFInterpolateQuatFloat`
Inherits: `RigVMFunction_MathRBFInterpolateQuatFloat`

deprecated: âRigUnit_MathRBFInterpolateQuatFloatâ was renamed to âRigVMFunction_MathRBFInterpolateQuatFloatâ.

### `unreal.RigUnit_MathRBFInterpolateQuatQuat`
Inherits: `RigVMFunction_MathRBFInterpolateQuatQuat`

deprecated: âRigUnit_MathRBFInterpolateQuatQuatâ was renamed to âRigVMFunction_MathRBFInterpolateQuatQuatâ.

### `unreal.RigUnit_MathRBFInterpolateQuatVector`
Inherits: `RigVMFunction_MathRBFInterpolateQuatVector`

deprecated: âRigUnit_MathRBFInterpolateQuatVectorâ was renamed to âRigVMFunction_MathRBFInterpolateQuatVectorâ.

### `unreal.RigUnit_MathRBFInterpolateQuatXform`
Inherits: `RigVMFunction_MathRBFInterpolateQuatXform`

deprecated: âRigUnit_MathRBFInterpolateQuatXformâ was renamed to âRigVMFunction_MathRBFInterpolateQuatXformâ.

### `unreal.RigUnit_MathRBFInterpolateVectorBase`
Inherits: `RigVMFunction_MathRBFInterpolateVectorBase`

deprecated: âRigUnit_MathRBFInterpolateVectorBaseâ was renamed to âRigVMFunction_MathRBFInterpolateVectorBaseâ.

### `unreal.RigUnit_MathRBFInterpolateVectorColor`
Inherits: `RigVMFunction_MathRBFInterpolateVectorColor`

deprecated: âRigUnit_MathRBFInterpolateVectorColorâ was renamed to âRigVMFunction_MathRBFInterpolateVectorColorâ.

### `unreal.RigUnit_MathRBFInterpolateVectorFloat`
Inherits: `RigVMFunction_MathRBFInterpolateVectorFloat`

deprecated: âRigUnit_MathRBFInterpolateVectorFloatâ was renamed to âRigVMFunction_MathRBFInterpolateVectorFloatâ.

### `unreal.RigUnit_MathRBFInterpolateVectorQuat`
Inherits: `RigVMFunction_MathRBFInterpolateVectorQuat`

deprecated: âRigUnit_MathRBFInterpolateVectorQuatâ was renamed to âRigVMFunction_MathRBFInterpolateVectorQuatâ.

### `unreal.RigUnit_MathRBFInterpolateVectorVector`
Inherits: `RigVMFunction_MathRBFInterpolateVectorVector`

deprecated: âRigUnit_MathRBFInterpolateVectorVectorâ was renamed to âRigVMFunction_MathRBFInterpolateVectorVectorâ.

### `unreal.RigUnit_MathRBFInterpolateVectorXform`
Inherits: `RigVMFunction_MathRBFInterpolateVectorXform`

deprecated: âRigUnit_MathRBFInterpolateVectorXformâ was renamed to âRigVMFunction_MathRBFInterpolateVectorXformâ.

### `unreal.RigUnit_MathTransformAccumulateArray`
Inherits: `RigVMFunction_MathTransformAccumulateArray`

deprecated: âRigUnit_MathTransformAccumulateArrayâ was renamed to âRigVMFunction_MathTransformAccumulateArrayâ.

### `unreal.RigUnit_MathTransformArrayToSRT`
Inherits: `RigVMFunction_MathTransformArrayToSRT`

deprecated: âRigUnit_MathTransformArrayToSRTâ was renamed to âRigVMFunction_MathTransformArrayToSRTâ.

### `unreal.RigUnit_MathTransformBase`
Inherits: `RigVMFunction_MathTransformBase`

deprecated: âRigUnit_MathTransformBaseâ was renamed to âRigVMFunction_MathTransformBaseâ.

### `unreal.RigUnit_MathTransformBinaryAggregateOp`
Inherits: `RigVMFunction_MathTransformBinaryAggregateOp`

deprecated: âRigUnit_MathTransformBinaryAggregateOpâ was renamed to âRigVMFunction_MathTransformBinaryAggregateOpâ.

### `unreal.RigUnit_MathTransformBinaryOp`
Inherits: `RigVMFunction_MathTransformBinaryOp`

deprecated: âRigUnit_MathTransformBinaryOpâ was renamed to âRigVMFunction_MathTransformBinaryOpâ.

### `unreal.RigUnit_MathTransformClampSpatially`
Inherits: `RigVMFunction_MathTransformClampSpatially`

deprecated: âRigUnit_MathTransformClampSpatiallyâ was renamed to âRigVMFunction_MathTransformClampSpatiallyâ.

### `unreal.RigUnit_MathTransformFromEulerTransform`
Inherits: `RigVMFunction_MathTransformFromEulerTransform`

deprecated: âRigUnit_MathTransformFromEulerTransformâ was renamed to âRigVMFunction_MathTransformFromEulerTransformâ.

### `unreal.RigUnit_MathTransformFromEulerTransformV2`
Inherits: `RigVMFunction_MathTransformFromEulerTransformV2`

deprecated: âRigUnit_MathTransformFromEulerTransformV2â was renamed to âRigVMFunction_MathTransformFromEulerTransformV2â.

### `unreal.RigUnit_MathTransformFromSRT`
Inherits: `RigVMFunction_MathTransformFromSRT`

deprecated: âRigUnit_MathTransformFromSRTâ was renamed to âRigVMFunction_MathTransformFromSRTâ.

### `unreal.RigUnit_MathTransformInverse`
Inherits: `RigVMFunction_MathTransformInverse`

deprecated: âRigUnit_MathTransformInverseâ was renamed to âRigVMFunction_MathTransformInverseâ.

### `unreal.RigUnit_MathTransformLerp`
Inherits: `RigVMFunction_MathTransformLerp`

deprecated: âRigUnit_MathTransformLerpâ was renamed to âRigVMFunction_MathTransformLerpâ.

### `unreal.RigUnit_MathTransformMake`
Inherits: `RigVMFunction_MathTransformMake`

deprecated: âRigUnit_MathTransformMakeâ was renamed to âRigVMFunction_MathTransformMakeâ.

### `unreal.RigUnit_MathTransformMakeAbsolute`
Inherits: `RigVMFunction_MathTransformMakeAbsolute`

deprecated: âRigUnit_MathTransformMakeAbsoluteâ was renamed to âRigVMFunction_MathTransformMakeAbsoluteâ.

### `unreal.RigUnit_MathTransformMakeRelative`
Inherits: `RigVMFunction_MathTransformMakeRelative`

deprecated: âRigUnit_MathTransformMakeRelativeâ was renamed to âRigVMFunction_MathTransformMakeRelativeâ.

### `unreal.RigUnit_MathTransformMirrorTransform`
Inherits: `RigVMFunction_MathTransformMirrorTransform`

deprecated: âRigUnit_MathTransformMirrorTransformâ was renamed to âRigVMFunction_MathTransformMirrorTransformâ.

### `unreal.RigUnit_MathTransformMul`
Inherits: `RigVMFunction_MathTransformMul`

deprecated: âRigUnit_MathTransformMulâ was renamed to âRigVMFunction_MathTransformMulâ.

### `unreal.RigUnit_MathTransformMutableBase`
Inherits: `RigVMFunction_MathTransformMutableBase`

deprecated: âRigUnit_MathTransformMutableBaseâ was renamed to âRigVMFunction_MathTransformMutableBaseâ.

### `unreal.RigUnit_MathTransformRotateVector`
Inherits: `RigVMFunction_MathTransformRotateVector`

deprecated: âRigUnit_MathTransformRotateVectorâ was renamed to âRigVMFunction_MathTransformRotateVectorâ.

### `unreal.RigUnit_MathTransformSelectBool`
Inherits: `RigVMFunction_MathTransformSelectBool`

deprecated: âRigUnit_MathTransformSelectBoolâ was renamed to âRigVMFunction_MathTransformSelectBoolâ.

### `unreal.RigUnit_MathTransformToEulerTransform`
Inherits: `RigVMFunction_MathTransformToEulerTransform`

deprecated: âRigUnit_MathTransformToEulerTransformâ was renamed to âRigVMFunction_MathTransformToEulerTransformâ.

### `unreal.RigUnit_MathTransformTransformVector`
Inherits: `RigVMFunction_MathTransformTransformVector`

deprecated: âRigUnit_MathTransformTransformVectorâ was renamed to âRigVMFunction_MathTransformTransformVectorâ.

### `unreal.RigUnit_MathTransformUnaryOp`
Inherits: `RigVMFunction_MathTransformUnaryOp`

deprecated: âRigUnit_MathTransformUnaryOpâ was renamed to âRigVMFunction_MathTransformUnaryOpâ.

### `unreal.RigUnit_MathVectorAbs`
Inherits: `RigVMFunction_MathVectorAbs`

deprecated: âRigUnit_MathVectorAbsâ was renamed to âRigVMFunction_MathVectorAbsâ.

### `unreal.RigUnit_MathVectorAdd`
Inherits: `RigVMFunction_MathVectorAdd`

deprecated: âRigUnit_MathVectorAddâ was renamed to âRigVMFunction_MathVectorAddâ.

### `unreal.RigUnit_MathVectorAngle`
Inherits: `RigVMFunction_MathVectorAngle`

deprecated: âRigUnit_MathVectorAngleâ was renamed to âRigVMFunction_MathVectorAngleâ.

### `unreal.RigUnit_MathVectorBase`
Inherits: `RigVMFunction_MathVectorBase`

deprecated: âRigUnit_MathVectorBaseâ was renamed to âRigVMFunction_MathVectorBaseâ.

### `unreal.RigUnit_MathVectorBezierFourPoint`
Inherits: `RigVMFunction_MathVectorBezierFourPoint`

deprecated: âRigUnit_MathVectorBezierFourPointâ was renamed to âRigVMFunction_MathVectorBezierFourPointâ.

### `unreal.RigUnit_MathVectorBinaryAggregateOp`
Inherits: `RigVMFunction_MathVectorBinaryAggregateOp`

deprecated: âRigUnit_MathVectorBinaryAggregateOpâ was renamed to âRigVMFunction_MathVectorBinaryAggregateOpâ.

### `unreal.RigUnit_MathVectorBinaryOp`
Inherits: `RigVMFunction_MathVectorBinaryOp`

deprecated: âRigUnit_MathVectorBinaryOpâ was renamed to âRigVMFunction_MathVectorBinaryOpâ.

### `unreal.RigUnit_MathVectorCeil`
Inherits: `RigVMFunction_MathVectorCeil`

deprecated: âRigUnit_MathVectorCeilâ was renamed to âRigVMFunction_MathVectorCeilâ.

### `unreal.RigUnit_MathVectorClamp`
Inherits: `RigVMFunction_MathVectorClamp`

deprecated: âRigUnit_MathVectorClampâ was renamed to âRigVMFunction_MathVectorClampâ.

### `unreal.RigUnit_MathVectorClampLength`
Inherits: `RigVMFunction_MathVectorClampLength`

deprecated: âRigUnit_MathVectorClampLengthâ was renamed to âRigVMFunction_MathVectorClampLengthâ.

### `unreal.RigUnit_MathVectorClampSpatially`
Inherits: `RigVMFunction_MathVectorClampSpatially`

deprecated: âRigUnit_MathVectorClampSpatiallyâ was renamed to âRigVMFunction_MathVectorClampSpatiallyâ.

### `unreal.RigUnit_MathVectorCross`
Inherits: `RigVMFunction_MathVectorCross`

deprecated: âRigUnit_MathVectorCrossâ was renamed to âRigVMFunction_MathVectorCrossâ.

### `unreal.RigUnit_MathVectorDeg`
Inherits: `RigVMFunction_MathVectorDeg`

deprecated: âRigUnit_MathVectorDegâ was renamed to âRigVMFunction_MathVectorDegâ.

### `unreal.RigUnit_MathVectorDistance`
Inherits: `RigVMFunction_MathVectorDistance`

deprecated: âRigUnit_MathVectorDistanceâ was renamed to âRigVMFunction_MathVectorDistanceâ.

### `unreal.RigUnit_MathVectorDiv`
Inherits: `RigVMFunction_MathVectorDiv`

deprecated: âRigUnit_MathVectorDivâ was renamed to âRigVMFunction_MathVectorDivâ.

### `unreal.RigUnit_MathVectorDot`
Inherits: `RigVMFunction_MathVectorDot`

deprecated: âRigUnit_MathVectorDotâ was renamed to âRigVMFunction_MathVectorDotâ.

### `unreal.RigUnit_MathVectorEquals`
Inherits: `RigVMFunction_MathVectorEquals`

deprecated: âRigUnit_MathVectorEqualsâ was renamed to âRigVMFunction_MathVectorEqualsâ.

### `unreal.RigUnit_MathVectorFloor`
Inherits: `RigVMFunction_MathVectorFloor`

deprecated: âRigUnit_MathVectorFloorâ was renamed to âRigVMFunction_MathVectorFloorâ.

### `unreal.RigUnit_MathVectorFromDouble`
Inherits: `RigVMFunction_MathVectorFromDouble`

deprecated: âRigUnit_MathVectorFromDoubleâ was renamed to âRigVMFunction_MathVectorFromDoubleâ.

### `unreal.RigUnit_MathVectorFromFloat`
Inherits: `RigVMFunction_MathVectorFromFloat`

deprecated: âRigUnit_MathVectorFromFloatâ was renamed to âRigVMFunction_MathVectorFromFloatâ.

### `unreal.RigUnit_MathVectorIsNearlyEqual`
Inherits: `RigVMFunction_MathVectorIsNearlyEqual`

deprecated: âRigUnit_MathVectorIsNearlyEqualâ was renamed to âRigVMFunction_MathVectorIsNearlyEqualâ.

### `unreal.RigUnit_MathVectorIsNearlyZero`
Inherits: `RigVMFunction_MathVectorIsNearlyZero`

deprecated: âRigUnit_MathVectorIsNearlyZeroâ was renamed to âRigVMFunction_MathVectorIsNearlyZeroâ.

### `unreal.RigUnit_MathVectorLength`
Inherits: `RigVMFunction_MathVectorLength`

deprecated: âRigUnit_MathVectorLengthâ was renamed to âRigVMFunction_MathVectorLengthâ.

### `unreal.RigUnit_MathVectorLengthSquared`
Inherits: `RigVMFunction_MathVectorLengthSquared`

deprecated: âRigUnit_MathVectorLengthSquaredâ was renamed to âRigVMFunction_MathVectorLengthSquaredâ.

### `unreal.RigUnit_MathVectorLerp`
Inherits: `RigVMFunction_MathVectorLerp`

deprecated: âRigUnit_MathVectorLerpâ was renamed to âRigVMFunction_MathVectorLerpâ.

### `unreal.RigUnit_MathVectorMake`
Inherits: `RigVMFunction_MathVectorMake`

deprecated: âRigUnit_MathVectorMakeâ was renamed to âRigVMFunction_MathVectorMakeâ.

### `unreal.RigUnit_MathVectorMakeAbsolute`
Inherits: `RigVMFunction_MathVectorMakeAbsolute`

deprecated: âRigUnit_MathVectorMakeAbsoluteâ was renamed to âRigVMFunction_MathVectorMakeAbsoluteâ.

### `unreal.RigUnit_MathVectorMakeBezierFourPoint`
Inherits: `RigVMFunction_MathVectorMakeBezierFourPoint`

deprecated: âRigUnit_MathVectorMakeBezierFourPointâ was renamed to âRigVMFunction_MathVectorMakeBezierFourPointâ.

### `unreal.RigUnit_MathVectorMakeRelative`
Inherits: `RigVMFunction_MathVectorMakeRelative`

deprecated: âRigUnit_MathVectorMakeRelativeâ was renamed to âRigVMFunction_MathVectorMakeRelativeâ.

### `unreal.RigUnit_MathVectorMax`
Inherits: `RigVMFunction_MathVectorMax`

deprecated: âRigUnit_MathVectorMaxâ was renamed to âRigVMFunction_MathVectorMaxâ.

### `unreal.RigUnit_MathVectorMin`
Inherits: `RigVMFunction_MathVectorMin`

deprecated: âRigUnit_MathVectorMinâ was renamed to âRigVMFunction_MathVectorMinâ.

### `unreal.RigUnit_MathVectorMirror`
Inherits: `RigVMFunction_MathVectorMirror`

deprecated: âRigUnit_MathVectorMirrorâ was renamed to âRigVMFunction_MathVectorMirrorâ.

### `unreal.RigUnit_MathVectorMirrorTransform`
Inherits: `RigVMFunction_MathVectorMirrorTransform`

deprecated: âRigUnit_MathVectorMirrorTransformâ was renamed to âRigVMFunction_MathVectorMirrorTransformâ.

### `unreal.RigUnit_MathVectorMod`
Inherits: `RigVMFunction_MathVectorMod`

deprecated: âRigUnit_MathVectorModâ was renamed to âRigVMFunction_MathVectorModâ.

### `unreal.RigUnit_MathVectorMul`
Inherits: `RigVMFunction_MathVectorMul`

deprecated: âRigUnit_MathVectorMulâ was renamed to âRigVMFunction_MathVectorMulâ.

### `unreal.RigUnit_MathVectorNegate`
Inherits: `RigVMFunction_MathVectorNegate`

deprecated: âRigUnit_MathVectorNegateâ was renamed to âRigVMFunction_MathVectorNegateâ.

### `unreal.RigUnit_MathVectorNotEquals`
Inherits: `RigVMFunction_MathVectorNotEquals`

deprecated: âRigUnit_MathVectorNotEqualsâ was renamed to âRigVMFunction_MathVectorNotEqualsâ.

### `unreal.RigUnit_MathVectorOrthogonal`
Inherits: `RigVMFunction_MathVectorOrthogonal`

deprecated: âRigUnit_MathVectorOrthogonalâ was renamed to âRigVMFunction_MathVectorOrthogonalâ.

### `unreal.RigUnit_MathVectorParallel`
Inherits: `RigVMFunction_MathVectorParallel`

deprecated: âRigUnit_MathVectorParallelâ was renamed to âRigVMFunction_MathVectorParallelâ.

### `unreal.RigUnit_MathVectorRad`
Inherits: `RigVMFunction_MathVectorRad`

deprecated: âRigUnit_MathVectorRadâ was renamed to âRigVMFunction_MathVectorRadâ.

### `unreal.RigUnit_MathVectorRemap`
Inherits: `RigVMFunction_MathVectorRemap`

deprecated: âRigUnit_MathVectorRemapâ was renamed to âRigVMFunction_MathVectorRemapâ.

### `unreal.RigUnit_MathVectorRound`
Inherits: `RigVMFunction_MathVectorRound`

deprecated: âRigUnit_MathVectorRoundâ was renamed to âRigVMFunction_MathVectorRoundâ.

### `unreal.RigUnit_MathVectorScale`
Inherits: `RigVMFunction_MathVectorScale`

deprecated: âRigUnit_MathVectorScaleâ was renamed to âRigVMFunction_MathVectorScaleâ.

### `unreal.RigUnit_MathVectorSelectBool`
Inherits: `RigVMFunction_MathVectorSelectBool`

deprecated: âRigUnit_MathVectorSelectBoolâ was renamed to âRigVMFunction_MathVectorSelectBoolâ.

### `unreal.RigUnit_MathVectorSetLength`
Inherits: `RigVMFunction_MathVectorSetLength`

deprecated: âRigUnit_MathVectorSetLengthâ was renamed to âRigVMFunction_MathVectorSetLengthâ.

### `unreal.RigUnit_MathVectorSign`
Inherits: `RigVMFunction_MathVectorSign`

deprecated: âRigUnit_MathVectorSignâ was renamed to âRigVMFunction_MathVectorSignâ.

### `unreal.RigUnit_MathVectorSub`
Inherits: `RigVMFunction_MathVectorSub`

deprecated: âRigUnit_MathVectorSubâ was renamed to âRigVMFunction_MathVectorSubâ.

### `unreal.RigUnit_MathVectorUnaryOp`
Inherits: `RigVMFunction_MathVectorUnaryOp`

deprecated: âRigUnit_MathVectorUnaryOpâ was renamed to âRigVMFunction_MathVectorUnaryOpâ.

### `unreal.RigUnit_MathVectorUnit`
Inherits: `RigVMFunction_MathVectorUnit`

deprecated: âRigUnit_MathVectorUnitâ was renamed to âRigVMFunction_MathVectorUnitâ.

### `unreal.RigUnit_NameBase`
Inherits: `RigVMFunction_NameBase`

deprecated: âRigUnit_NameBaseâ was renamed to âRigVMFunction_NameBaseâ.

### `unreal.RigUnit_NameConcat`
Inherits: `RigVMFunction_NameConcat`

deprecated: âRigUnit_NameConcatâ was renamed to âRigVMFunction_NameConcatâ.

### `unreal.RigUnit_NameReplace`
Inherits: `RigVMFunction_NameReplace`

deprecated: âRigUnit_NameReplaceâ was renamed to âRigVMFunction_NameReplaceâ.

### `unreal.RigUnit_NameTruncate`
Inherits: `RigVMFunction_NameTruncate`

deprecated: âRigUnit_NameTruncateâ was renamed to âRigVMFunction_NameTruncateâ.

### `unreal.RigUnit_NoiseDouble`
Inherits: `RigVMFunction_NoiseDouble`

deprecated: âRigUnit_NoiseDoubleâ was renamed to âRigVMFunction_NoiseDoubleâ.

### `unreal.RigUnit_NoiseFloat`
Inherits: `RigVMFunction_NoiseFloat`

deprecated: âRigUnit_NoiseFloatâ was renamed to âRigVMFunction_NoiseFloatâ.

### `unreal.RigUnit_NoiseVector`
Inherits: `RigVMFunction_NoiseVector`

deprecated: âRigUnit_NoiseVectorâ was renamed to âRigVMFunction_NoiseVectorâ.

### `unreal.RigUnit_NoiseVector2`
Inherits: `RigVMFunction_NoiseVector2`

deprecated: âRigUnit_NoiseVector2â was renamed to âRigVMFunction_NoiseVector2â.

### `unreal.RigUnit_RandomFloat`
Inherits: `RigVMFunction_RandomFloat`

deprecated: âRigUnit_RandomFloatâ was renamed to âRigVMFunction_RandomFloatâ.

### `unreal.RigUnit_RandomVector`
Inherits: `RigVMFunction_RandomVector`

deprecated: âRigUnit_RandomVectorâ was renamed to âRigVMFunction_RandomVectorâ.

### `unreal.RigUnit_SecondsToFrames`
Inherits: `RigVMFunction_SecondsToFrames`

deprecated: âRigUnit_SecondsToFramesâ was renamed to âRigVMFunction_SecondsToFramesâ.

### `unreal.RigUnit_SequenceAggregate`
Inherits: `RigVMFunction_Sequence`

deprecated: âRigUnit_SequenceAggregateâ was renamed to âRigVMFunction_Sequenceâ.

### `unreal.RigUnit_SimBase`
Inherits: `RigVMFunction_SimBase`

deprecated: âRigUnit_SimBaseâ was renamed to âRigVMFunction_SimBaseâ.

### `unreal.RigUnit_SimBaseMutable`
Inherits: `RigVMFunction_SimBaseMutable`

deprecated: âRigUnit_SimBaseMutableâ was renamed to âRigVMFunction_SimBaseMutableâ.

### `unreal.RigUnit_SpringInterpQuaternion`
Inherits: `RigUnit_SpringInterpQuaternionV2`

deprecated: âRigUnit_SpringInterpQuaternionâ was renamed to âRigUnit_SpringInterpQuaternionV2â.

### `unreal.RigUnit_StartsWith`
Inherits: `RigVMFunction_StartsWith`

deprecated: âRigUnit_StartsWithâ was renamed to âRigVMFunction_StartsWithâ.

### `unreal.RigUnit_StringBase`
Inherits: `RigVMFunction_StringBase`

deprecated: âRigUnit_StringBaseâ was renamed to âRigVMFunction_StringBaseâ.

### `unreal.RigUnit_StringConcat`
Inherits: `RigVMFunction_StringConcat`

deprecated: âRigUnit_StringConcatâ was renamed to âRigVMFunction_StringConcatâ.

### `unreal.RigUnit_StringContains`
Inherits: `RigVMFunction_StringContains`

deprecated: âRigUnit_StringContainsâ was renamed to âRigVMFunction_StringContainsâ.

### `unreal.RigUnit_StringEndsWith`
Inherits: `RigVMFunction_StringEndsWith`

deprecated: âRigUnit_StringEndsWithâ was renamed to âRigVMFunction_StringEndsWithâ.

### `unreal.RigUnit_StringFind`
Inherits: `RigVMFunction_StringFind`

deprecated: âRigUnit_StringFindâ was renamed to âRigVMFunction_StringFindâ.

### `unreal.RigUnit_StringJoin`
Inherits: `RigVMFunction_StringJoin`

deprecated: âRigUnit_StringJoinâ was renamed to âRigVMFunction_StringJoinâ.

### `unreal.RigUnit_StringLeft`
Inherits: `RigVMFunction_StringLeft`

deprecated: âRigUnit_StringLeftâ was renamed to âRigVMFunction_StringLeftâ.

### `unreal.RigUnit_StringLength`
Inherits: `RigVMFunction_StringLength`

deprecated: âRigUnit_StringLengthâ was renamed to âRigVMFunction_StringLengthâ.

### `unreal.RigUnit_StringMiddle`
Inherits: `RigVMFunction_StringMiddle`

deprecated: âRigUnit_StringMiddleâ was renamed to âRigVMFunction_StringMiddleâ.

### `unreal.RigUnit_StringPadInteger`
Inherits: `RigVMFunction_StringPadInteger`

deprecated: âRigUnit_StringPadIntegerâ was renamed to âRigVMFunction_StringPadIntegerâ.

### `unreal.RigUnit_StringReplace`
Inherits: `RigVMFunction_StringReplace`

deprecated: âRigUnit_StringReplaceâ was renamed to âRigVMFunction_StringReplaceâ.

### `unreal.RigUnit_StringReverse`
Inherits: `RigVMFunction_StringReverse`

deprecated: âRigUnit_StringReverseâ was renamed to âRigVMFunction_StringReverseâ.

### `unreal.RigUnit_StringRight`
Inherits: `RigVMFunction_StringRight`

deprecated: âRigUnit_StringRightâ was renamed to âRigVMFunction_StringRightâ.

### `unreal.RigUnit_StringSplit`
Inherits: `RigVMFunction_StringSplit`

deprecated: âRigUnit_StringSplitâ was renamed to âRigVMFunction_StringSplitâ.

### `unreal.RigUnit_StringStartsWith`
Inherits: `RigVMFunction_StringStartsWith`

deprecated: âRigUnit_StringStartsWithâ was renamed to âRigVMFunction_StringStartsWithâ.

### `unreal.RigUnit_StringToLowercase`
Inherits: `RigVMFunction_StringToLowercase`

deprecated: âRigUnit_StringToLowercaseâ was renamed to âRigVMFunction_StringToLowercaseâ.

### `unreal.RigUnit_StringToUppercase`
Inherits: `RigVMFunction_StringToUppercase`

deprecated: âRigUnit_StringToUppercaseâ was renamed to âRigVMFunction_StringToUppercaseâ.

### `unreal.RigUnit_StringTrimWhitespace`
Inherits: `RigVMFunction_StringTrimWhitespace`

deprecated: âRigUnit_StringTrimWhitespaceâ was renamed to âRigVMFunction_StringTrimWhitespaceâ.

### `unreal.RigUnit_StringTruncate`
Inherits: `RigVMFunction_StringTruncate`

deprecated: âRigUnit_StringTruncateâ was renamed to âRigVMFunction_StringTruncateâ.

### `unreal.RigUnit_Timeline`
Inherits: `RigVMFunction_Timeline`

deprecated: âRigUnit_Timelineâ was renamed to âRigVMFunction_Timelineâ.

### `unreal.RigUnit_TimeLoop`
Inherits: `RigVMFunction_TimeLoop`

deprecated: âRigUnit_TimeLoopâ was renamed to âRigVMFunction_TimeLoopâ.

### `unreal.RigUnit_TimeOffsetFloat`
Inherits: `RigVMFunction_TimeOffsetFloat`

deprecated: âRigUnit_TimeOffsetFloatâ was renamed to âRigVMFunction_TimeOffsetFloatâ.

### `unreal.RigUnit_TimeOffsetTransform`
Inherits: `RigVMFunction_TimeOffsetTransform`

deprecated: âRigUnit_TimeOffsetTransformâ was renamed to âRigVMFunction_TimeOffsetTransformâ.

### `unreal.RigUnit_TimeOffsetVector`
Inherits: `RigVMFunction_TimeOffsetVector`

deprecated: âRigUnit_TimeOffsetVectorâ was renamed to âRigVMFunction_TimeOffsetVectorâ.

### `unreal.RigUnit_UserDefinedEvent`
Inherits: `RigVMFunction_UserDefinedEvent`

deprecated: âRigUnit_UserDefinedEventâ was renamed to âRigVMFunction_UserDefinedEventâ.

### `unreal.RigUnit_VerletIntegrateVector`
Inherits: `RigVMFunction_VerletIntegrateVector`

deprecated: âRigUnit_VerletIntegrateVectorâ was renamed to âRigVMFunction_VerletIntegrateVectorâ.

### `unreal.RigVMDecorator`
Inherits: `RigVMTrait`

deprecated: âRigVMDecoratorâ was renamed to âRigVMTraitâ.

### `unreal.RigVMFunction_MathFloatFloor`

### `unreal.RigVMGraphFunctionCategory`
Inherits: `RigVMPinCategory`

deprecated: âRigVMGraphFunctionCategoryâ was renamed to âRigVMPinCategoryâ.

### `unreal.RigVMGraphFunctionLayout`
Inherits: `RigVMNodeLayout`

deprecated: âRigVMGraphFunctionLayoutâ was renamed to âRigVMNodeLayoutâ.

### `unreal.SequencerBindingProxy`
Inherits: `MovieSceneBindingProxy`

deprecated: âSequencerBindingProxyâ was renamed to âMovieSceneBindingProxyâ.

### `unreal.SetDevicePropertyParams`
Inherits: `ActivateDevicePropertyParams`

deprecated: âSetDevicePropertyParamsâ was renamed to âActivateDevicePropertyParamsâ.

### `unreal.SmartObjectID`
Inherits: `SmartObjectHandle`

deprecated: âSmartObjectIDâ was renamed to âSmartObjectHandleâ.

### `unreal.SmartObjectSlot`
Inherits: `SmartObjectSlotDefinition`

deprecated: âSmartObjectSlotâ was renamed to âSmartObjectSlotDefinitionâ.

### `unreal.SmartObjectSlotDefinitionDataProxy`
Inherits: `SmartObjectDefinitionDataProxy`

deprecated: âSmartObjectSlotDefinitionDataProxyâ was renamed to âSmartObjectDefinitionDataProxyâ.

### `unreal.SpritePolygon`
Inherits: `SpriteGeometryShape`

deprecated: âSpritePolygonâ was renamed to âSpriteGeometryShapeâ.

### `unreal.SpritePolygonCollection`
Inherits: `SpriteGeometryCollection`

deprecated: âSpritePolygonCollectionâ was renamed to âSpriteGeometryCollectionâ.

### `unreal.SReply`
Inherits: `EventReply`

deprecated: âSReplyâ was renamed to âEventReplyâ.

### `unreal.StateTreeConditionItem`
Inherits: `StateTreeEditorNode`

deprecated: âStateTreeConditionItemâ was renamed to âStateTreeEditorNodeâ.

### `unreal.StateTreeEvaluatorItem`
Inherits: `StateTreeEditorNode`

deprecated: âStateTreeEvaluatorItemâ was renamed to âStateTreeEditorNodeâ.

### `unreal.StateTreeHandle`
Inherits: `StateTreeStateHandle`

deprecated: âStateTreeHandleâ was renamed to âStateTreeStateHandleâ.

### `unreal.StateTreeItem`
Inherits: `StateTreeEditorNode`

deprecated: âStateTreeItemâ was renamed to âStateTreeEditorNodeâ.

### `unreal.StateTreeTaskItem`
Inherits: `StateTreeEditorNode`

deprecated: âStateTreeTaskItemâ was renamed to âStateTreeEditorNodeâ.

### `unreal.StateTreeTransition2`
Inherits: `StateTreeTransition`

deprecated: âStateTreeTransition2â was renamed to âStateTreeTransitionâ.

### `unreal.StaticMeshInstanceVisualizationMeshDesc`
Inherits: `MassStaticMeshInstanceVisualizationMeshDesc`

deprecated: âStaticMeshInstanceVisualizationMeshDescâ was renamed to âMassStaticMeshInstanceVisualizationMeshDescâ.

### `unreal.StringAssetReference`
Inherits: `SoftObjectPath`

deprecated: âStringAssetReferenceâ was renamed to âSoftObjectPathâ.

### `unreal.StringClassReference`
Inherits: `SoftClassPath`

deprecated: âStringClassReferenceâ was renamed to âSoftClassPathâ.

### `unreal.SubmixEffectReverbFastSettings`
Inherits: `SubmixEffectReverbSettings`

deprecated: âSubmixEffectReverbFastSettingsâ was renamed to âSubmixEffectReverbSettingsâ.

### `unreal.TargetReference`
Inherits: `BoneSocketTarget`

deprecated: âTargetReferenceâ was renamed to âBoneSocketTargetâ.

### `unreal.UniqueScriptStructPtr`
Inherits: `InstancedStruct`

deprecated: âUniqueScriptStructPtrâ was renamed to âInstancedStructâ.

### `unreal.ZoneLaneTemplateRef`
Inherits: `ZoneLaneProfileRef`

deprecated: âZoneLaneTemplateRefâ was renamed to âZoneLaneProfileRefâ.

### `unreal.ActorModifierLayoutSplinePathModifier`
Inherits: `ActorModifierSplinePathModifier`

deprecated: âActorModifierLayoutSplinePathModifierâ was renamed to âActorModifierSplinePathModifierâ.

### `unreal.AITask_UseSmartObject`
Inherits: `AITask_UseGameplayBehaviorSmartObject`

deprecated: âAITask_UseSmartObjectâ was renamed to âAITask_UseGameplayBehaviorSmartObjectâ.

### `unreal.AnimGraphNode_BlendSpace`
Inherits: `AnimGraphNode_BlendSpacePlayer`

deprecated: âAnimGraphNode_BlendSpaceâ was renamed to âAnimGraphNode_BlendSpacePlayerâ.

### `unreal.AnimGraphNode_Layer`
Inherits: `AnimGraphNode_LinkedAnimLayer`

deprecated: âAnimGraphNode_Layerâ was renamed to âAnimGraphNode_LinkedAnimLayerâ.

### `unreal.AnimGraphNode_OrientationDriver`
Inherits: `AnimGraphNode_PoseDriver`

deprecated: âAnimGraphNode_OrientationDriverâ was renamed to âAnimGraphNode_PoseDriverâ.

### `unreal.AnimGraphNode_Ragdoll`
Inherits: `AnimGraphNode_RigidBody`

deprecated: âAnimGraphNode_Ragdollâ was renamed to âAnimGraphNode_RigidBodyâ.

### `unreal.AnimGraphNode_SubInput`
Inherits: `AnimGraphNode_LinkedInputPose`

deprecated: âAnimGraphNode_SubInputâ was renamed to âAnimGraphNode_LinkedInputPoseâ.

### `unreal.AnimGraphNode_SubInstance`
Inherits: `AnimGraphNode_LinkedAnimGraph`

deprecated: âAnimGraphNode_SubInstanceâ was renamed to âAnimGraphNode_LinkedAnimGraphâ.

### `unreal.AnimGraphNode_SubInstanceBase`
Inherits: `AnimGraphNode_LinkedAnimGraphBase`

deprecated: âAnimGraphNode_SubInstanceBaseâ was renamed to âAnimGraphNode_LinkedAnimGraphBaseâ.

### `unreal.AnimNextGraph`
Inherits: `AnimNextModule`

deprecated: âAnimNextGraphâ was renamed to âAnimNextModuleâ.

### `unreal.AnimNextGraph_EditorData`
Inherits: `AnimNextModule_EditorData`

deprecated: âAnimNextGraph_EditorDataâ was renamed to âAnimNextModule_EditorDataâ.

### `unreal.AnimNextGraph_EventGraph`
Inherits: `AnimNextEventGraphEntry`

deprecated: âAnimNextGraph_EventGraphâ was renamed to âAnimNextEventGraphEntryâ.

### `unreal.AnimNextGraph_Parameter`
Inherits: `AnimNextVariableEntry`

deprecated: âAnimNextGraph_Parameterâ was renamed to âAnimNextVariableEntryâ.

### `unreal.AnimNextGraph_UnitNode`
Inherits: `AnimNextUnitNode`

deprecated: âAnimNextGraph_UnitNodeâ was renamed to âAnimNextUnitNodeâ.

### `unreal.AnimNextMeshComponent`
Inherits: `SkeletalMeshComponent`

deprecated: âAnimNextMeshComponentâ was renamed to âSkeletalMeshComponentâ.

### `unreal.AnimNextModule_EventGraph`
Inherits: `AnimNextEventGraphEntry`

deprecated: âAnimNextModule_EventGraphâ was renamed to âAnimNextEventGraphEntryâ.

### `unreal.AnimNextModule_Parameter`
Inherits: `AnimNextVariableEntry`

deprecated: âAnimNextModule_Parameterâ was renamed to âAnimNextVariableEntryâ.

### `unreal.AnimNextWorkspace`
Inherits: `Workspace`

deprecated: âAnimNextWorkspaceâ was renamed to âWorkspaceâ.

### `unreal.AnimNotify_PlayParticleEffect_C`
Inherits: `AnimNotify_PlayParticleEffect`

deprecated: âAnimNotify_PlayParticleEffect_Câ was renamed to âAnimNotify_PlayParticleEffectâ.

### `unreal.AnimNotify_PlaySound_C`
Inherits: `AnimNotify_PlaySound`

deprecated: âAnimNotify_PlaySound_Câ was renamed to âAnimNotify_PlaySoundâ.

### `unreal.AudioGameplayVolumeProxyComponent`
Inherits: `AudioGameplayVolumeComponent`

deprecated: âAudioGameplayVolumeProxyComponentâ was renamed to âAudioGameplayVolumeComponentâ.

### `unreal.AudioParameterInterface`
Inherits: `AudioParameterControllerInterface`

deprecated: âAudioParameterInterfaceâ was renamed to âAudioParameterControllerInterfaceâ.

### `unreal.AvaAlignBetweenModifier`
Inherits: `ActorModifierAlignBetweenModifier`

deprecated: âAvaAlignBetweenModifierâ was renamed to âActorModifierAlignBetweenModifierâ.

### `unreal.AvaAnimation`
Inherits: `AvaSequence`

deprecated: âAvaAnimationâ was renamed to âAvaSequenceâ.

### `unreal.AvaAnimationActor`
Inherits: `AvaSequencePlaybackActor`

deprecated: âAvaAnimationActorâ was renamed to âAvaSequencePlaybackActorâ.

### `unreal.AvaArrangeBaseModifier`
Inherits: `ActorModifierArrangeBaseModifier`

deprecated: âAvaArrangeBaseModifierâ was renamed to âActorModifierArrangeBaseModifierâ.

### `unreal.AvaAttachmentBaseModifier`
Inherits: `ActorModifierAttachmentBaseModifier`

deprecated: âAvaAttachmentBaseModifierâ was renamed to âActorModifierAttachmentBaseModifierâ.

### `unreal.AvaAutoFollowModifier`
Inherits: `ActorModifierAutoFollowModifier`

deprecated: âAvaAutoFollowModifierâ was renamed to âActorModifierAutoFollowModifierâ.

### `unreal.AvaCloneModifier`
Inherits: `AvaPatternModifier`

deprecated: âAvaCloneModifierâ was renamed to âAvaPatternModifierâ.

### `unreal.AvaClonerActor`
Inherits: `CEClonerActor`

deprecated: âAvaClonerActorâ was renamed to âCEClonerActorâ.

### `unreal.AvaClonerCircleLayout`
Inherits: `CEClonerCircleLayout`

deprecated: âAvaClonerCircleLayoutâ was renamed to âCEClonerCircleLayoutâ.

### `unreal.AvaClonerComponent`
Inherits: `CEClonerComponent`

deprecated: âAvaClonerComponentâ was renamed to âCEClonerComponentâ.

### `unreal.AvaClonerCylinderLayout`
Inherits: `CEClonerCylinderLayout`

deprecated: âAvaClonerCylinderLayoutâ was renamed to âCEClonerCylinderLayoutâ.

### `unreal.AvaClonerGridLayout`
Inherits: `CEClonerGridLayout`

deprecated: âAvaClonerGridLayoutâ was renamed to âCEClonerGridLayoutâ.

### `unreal.AvaClonerHoneycombLayout`
Inherits: `CEClonerHoneycombLayout`

deprecated: âAvaClonerHoneycombLayoutâ was renamed to âCEClonerHoneycombLayoutâ.

### `unreal.AvaClonerLayoutBase`
Inherits: `CEClonerLayoutBase`

deprecated: âAvaClonerLayoutBaseâ was renamed to âCEClonerLayoutBaseâ.

### `unreal.AvaClonerLineLayout`
Inherits: `CEClonerLineLayout`

deprecated: âAvaClonerLineLayoutâ was renamed to âCEClonerLineLayoutâ.

### `unreal.AvaClonerMeshLayout`
Inherits: `CEClonerMeshLayout`

deprecated: âAvaClonerMeshLayoutâ was renamed to âCEClonerMeshLayoutâ.

### `unreal.AvaClonerSphereLayout`
Inherits: `CEClonerSphereUniformLayout`

deprecated: âAvaClonerSphereLayoutâ was renamed to âCEClonerSphereUniformLayoutâ.

### `unreal.AvaClonerSphereRandomLayout`
Inherits: `CEClonerSphereRandomLayout`

deprecated: âAvaClonerSphereRandomLayoutâ was renamed to âCEClonerSphereRandomLayoutâ.

### `unreal.AvaClonerSphereUniformLayout`
Inherits: `CEClonerSphereUniformLayout`

deprecated: âAvaClonerSphereUniformLayoutâ was renamed to âCEClonerSphereUniformLayoutâ.

### `unreal.AvaClonerSplineLayout`
Inherits: `CEClonerSplineLayout`

deprecated: âAvaClonerSplineLayoutâ was renamed to âCEClonerSplineLayoutâ.

### `unreal.AvaContentBackgroundModifier`
Inherits: `AvaAutoSizeModifier`

deprecated: âAvaContentBackgroundModifierâ was renamed to âAvaAutoSizeModifierâ.

### `unreal.AvaDisplayMediaCapture`
Inherits: `AvaBroadcastDisplayMediaCapture`

deprecated: âAvaDisplayMediaCaptureâ was renamed to âAvaBroadcastDisplayMediaCaptureâ.

### `unreal.AvaDisplayMediaOutput`
Inherits: `AvaBroadcastDisplayMediaOutput`

deprecated: âAvaDisplayMediaOutputâ was renamed to âAvaBroadcastDisplayMediaOutputâ.

### `unreal.AvaEffectorActor`
Inherits: `CEEffectorActor`

deprecated: âAvaEffectorActorâ was renamed to âCEEffectorActorâ.

### `unreal.AvaEffectorComponent`
Inherits: `CEEffectorComponent`

deprecated: âAvaEffectorComponentâ was renamed to âCEEffectorComponentâ.

### `unreal.AvaGridArrangeModifier`
Inherits: `ActorModifierGridArrangeModifier`

deprecated: âAvaGridArrangeModifierâ was renamed to âActorModifierGridArrangeModifierâ.

### `unreal.AvaJustifyModifier`
Inherits: `ActorModifierJustifyModifier`

deprecated: âAvaJustifyModifierâ was renamed to âActorModifierJustifyModifierâ.

### `unreal.AvalancheBroadcast`
Inherits: `AvaBroadcast`

deprecated: âAvalancheBroadcastâ was renamed to âAvaBroadcastâ.

### `unreal.AvalancheBroadcastComponent`
Inherits: `AvaBroadcastComponent`

deprecated: âAvalancheBroadcastComponentâ was renamed to âAvaBroadcastComponentâ.

### `unreal.AvalancheEditorSettings`
Inherits: `AvaEditorSettings`

deprecated: âAvalancheEditorSettingsâ was renamed to âAvaEditorSettingsâ.

### `unreal.AvalancheFontObject`
Inherits: `AvaFontObject`

deprecated: âAvalancheFontObjectâ was renamed to âAvaFontObjectâ.

### `unreal.AvalancheLevelStreamingPlayable`
Inherits: `AvaPlayableLevelStreaming`

deprecated: âAvalancheLevelStreamingPlayableâ was renamed to âAvaPlayableLevelStreamingâ.

### `unreal.AvalancheMaskSettings`
Inherits: `AvaMaskSettings`

deprecated: âAvalancheMaskSettingsâ was renamed to âAvaMaskSettingsâ.

### `unreal.AvalanchePlayable`
Inherits: `AvaPlayable`

deprecated: âAvalanchePlayableâ was renamed to âAvaPlayableâ.

### `unreal.AvalanchePlayback`
Inherits: `AvaPlaybackGraph`

deprecated: âAvalanchePlaybackâ was renamed to âAvaPlaybackGraphâ.

### `unreal.AvalanchePlaylist`
Inherits: `AvaRundown`

deprecated: âAvalanchePlaylistâ was renamed to âAvaRundownâ.

### `unreal.AvalanchePlaylistComponent`
Inherits: `AvaRundownComponent`

deprecated: âAvalanchePlaylistComponentâ was renamed to âAvaRundownComponentâ.

### `unreal.AvalancheRemoteProxyPlayable`
Inherits: `AvaPlayableRemoteProxy`

deprecated: âAvalancheRemoteProxyPlayableâ was renamed to âAvaPlayableRemoteProxyâ.

### `unreal.AvalancheText3DActor`
Inherits: `AvaTextActor`

deprecated: âAvalancheText3DActorâ was renamed to âAvaTextActorâ.

### `unreal.AvaLookAtModifier`
Inherits: `ActorModifierLookAtModifier`

deprecated: âAvaLookAtModifierâ was renamed to âActorModifierLookAtModifierâ.

### `unreal.AvaMaskModifier`
Inherits: `AvaBooleanModifier`

deprecated: âAvaMaskModifierâ was renamed to âAvaBooleanModifierâ.

### `unreal.AvaRadialArrangeModifier`
Inherits: `ActorModifierRadialArrangeModifier`

deprecated: âAvaRadialArrangeModifierâ was renamed to âActorModifierRadialArrangeModifierâ.

### `unreal.AvaRenderTargetMediaCapture`
Inherits: `AvaBroadcastRenderTargetMediaCapture`

deprecated: âAvaRenderTargetMediaCaptureâ was renamed to âAvaBroadcastRenderTargetMediaCaptureâ.

### `unreal.AvaRenderTargetMediaOutput`
Inherits: `AvaBroadcastRenderTargetMediaOutput`

deprecated: âAvaRenderTargetMediaOutputâ was renamed to âAvaBroadcastRenderTargetMediaOutputâ.

### `unreal.AvaSphereComponent`
Inherits: `SphereComponent`

deprecated: âAvaSphereComponentâ was renamed to âSphereComponentâ.

### `unreal.AvaToolbox2DArrowDynamicMesh`
Inherits: `AvaShape2DArrowDynamicMesh`

deprecated: âAvaToolbox2DArrowDynamicMeshâ was renamed to âAvaShape2DArrowDynamicMeshâ.

### `unreal.AvaToolbox2DDynMeshBase`
Inherits: `AvaShape2DDynMeshBase`

deprecated: âAvaToolbox2DDynMeshBaseâ was renamed to âAvaShape2DDynMeshBaseâ.

### `unreal.AvaToolbox3DDynMeshBase`
Inherits: `AvaShape3DDynMeshBase`

deprecated: âAvaToolbox3DDynMeshBaseâ was renamed to âAvaShape3DDynMeshBaseâ.

### `unreal.AvaToolboxChevronDynamicMesh`
Inherits: `AvaShapeChevronDynamicMesh`

deprecated: âAvaToolboxChevronDynamicMeshâ was renamed to âAvaShapeChevronDynamicMeshâ.

### `unreal.AvaToolboxConeDynamicMesh`
Inherits: `AvaShapeConeDynamicMesh`

deprecated: âAvaToolboxConeDynamicMeshâ was renamed to âAvaShapeConeDynamicMeshâ.

### `unreal.AvaToolboxCubeDynamicMesh`
Inherits: `AvaShapeCubeDynamicMesh`

deprecated: âAvaToolboxCubeDynamicMeshâ was renamed to âAvaShapeCubeDynamicMeshâ.

### `unreal.AvaToolboxDynamicMeshBase`
Inherits: `AvaShapeDynamicMeshBase`

deprecated: âAvaToolboxDynamicMeshBaseâ was renamed to âAvaShapeDynamicMeshBaseâ.

### `unreal.AvaToolboxEllipseDynamicMesh`
Inherits: `AvaShapeEllipseDynamicMesh`

deprecated: âAvaToolboxEllipseDynamicMeshâ was renamed to âAvaShapeEllipseDynamicMeshâ.

### `unreal.AvaToolboxIrregularPolygonDynamicMesh`
Inherits: `AvaShapeIrregularPolygonDynamicMesh`

deprecated: âAvaToolboxIrregularPolygonDynamicMeshâ was renamed to âAvaShapeIrregularPolygonDynamicMeshâ.

### `unreal.AvaToolboxLineDynamicMesh`
Inherits: `AvaShapeLineDynamicMesh`

deprecated: âAvaToolboxLineDynamicMeshâ was renamed to âAvaShapeLineDynamicMeshâ.

### `unreal.AvaToolboxNGonDynamicMesh`
Inherits: `AvaShapeNGonDynamicMesh`

deprecated: âAvaToolboxNGonDynamicMeshâ was renamed to âAvaShapeNGonDynamicMeshâ.

### `unreal.AvaToolboxRectangleDynamicMesh`
Inherits: `AvaShapeRectangleDynamicMesh`

deprecated: âAvaToolboxRectangleDynamicMeshâ was renamed to âAvaShapeRectangleDynamicMeshâ.

### `unreal.AvaToolboxRingDynamicMesh`
Inherits: `AvaShapeRingDynamicMesh`

deprecated: âAvaToolboxRingDynamicMeshâ was renamed to âAvaShapeRingDynamicMeshâ.

### `unreal.AvaToolboxRoundedPolygonDynamicMesh`
Inherits: `AvaShapeRoundedPolygonDynamicMesh`

deprecated: âAvaToolboxRoundedPolygonDynamicMeshâ was renamed to âAvaShapeRoundedPolygonDynamicMeshâ.

### `unreal.AvaToolboxShapeActor`
Inherits: `AvaShapeActor`

deprecated: âAvaToolboxShapeActorâ was renamed to âAvaShapeActorâ.

### `unreal.AvaToolboxSphereDynamicMesh`
Inherits: `AvaShapeSphereDynamicMesh`

deprecated: âAvaToolboxSphereDynamicMeshâ was renamed to âAvaShapeSphereDynamicMeshâ.

### `unreal.AvaToolboxStarDynamicMesh`
Inherits: `AvaShapeStarDynamicMesh`

deprecated: âAvaToolboxStarDynamicMeshâ was renamed to âAvaShapeStarDynamicMeshâ.

### `unreal.AvaToolboxTorusDynamicMesh`
Inherits: `AvaShapeTorusDynamicMesh`

deprecated: âAvaToolboxTorusDynamicMeshâ was renamed to âAvaShapeTorusDynamicMeshâ.

### `unreal.AvaViewportCameraActor`
Inherits: `CameraActor`

deprecated: âAvaViewportCameraActorâ was renamed to âCameraActorâ.

### `unreal.BackgroundBlurWidget`
Inherits: `BackgroundBlur`

deprecated: âBackgroundBlurWidgetâ was renamed to âBackgroundBlurâ.

### `unreal.BlendSpaceBase`
Inherits: `BlendSpace`

deprecated: âBlendSpaceBaseâ was renamed to âBlendSpaceâ.

### `unreal.BlutilityActor`
Inherits: `PlacedEditorUtilityBase`

deprecated: âBlutilityActorâ was renamed to âPlacedEditorUtilityBaseâ.

### `unreal.BrainComponentStateTreeSchema`
Inherits: `StateTreeComponentSchema`

deprecated: âBrainComponentStateTreeSchemaâ was renamed to âStateTreeComponentSchemaâ.

### `unreal.CameraShake`
Inherits: `LegacyCameraShake`

deprecated: âCameraShakeâ was renamed to âLegacyCameraShakeâ.

### `unreal.CEEffectorDelayExtension`
Inherits: `CEEffectorDelayEffect`

deprecated: âCEEffectorDelayExtensionâ was renamed to âCEEffectorDelayEffectâ.

### `unreal.CEEffectorForceExtension`
Inherits: `CEEffectorForceEffect`

deprecated: âCEEffectorForceExtensionâ was renamed to âCEEffectorForceEffectâ.

### `unreal.CEEffectorNoiseMode`
Inherits: `CEEffectorProceduralMode`

deprecated: âCEEffectorNoiseModeâ was renamed to âCEEffectorProceduralModeâ.

### `unreal.ClothDataProvider`
Inherits: `OptimusClothDataProvider`

deprecated: âClothDataProviderâ was renamed to âOptimusClothDataProviderâ.

### `unreal.ClothingAsset`
Inherits: `ClothingAssetCommon`

deprecated: âClothingAssetâ was renamed to âClothingAssetCommonâ.

### `unreal.ClothingAssetNv`
Inherits: `ClothingAssetCommon`

deprecated: âClothingAssetNvâ was renamed to âClothingAssetCommonâ.

### `unreal.ColorCorrectRegion_C`
Inherits: `ColorCorrectionRegion`

deprecated: âColorCorrectRegion_Câ was renamed to âColorCorrectionRegionâ.

### `unreal.CommonInputControllerData`
Inherits: `CommonInputBaseControllerData`

deprecated: âCommonInputControllerDataâ was renamed to âCommonInputBaseControllerDataâ.

### `unreal.CommonUIKeyBrushDisplayData`
Inherits: `CommonInputBaseControllerData`

deprecated: âCommonUIKeyBrushDisplayDataâ was renamed to âCommonInputBaseControllerDataâ.

### `unreal.ComposureCompShotElement`
Inherits: `CompositingElement`

deprecated: âComposureCompShotElementâ was renamed to âCompositingElementâ.

### `unreal.ConcertSyncClientStatics`
Inherits: `MultiUserClientStatics`

deprecated: âConcertSyncClientStaticsâ was renamed to âMultiUserClientStaticsâ.

### `unreal.ControlRigGizmoActor`
Inherits: `ControlRigShapeActor`

deprecated: âControlRigGizmoActorâ was renamed to âControlRigShapeActorâ.

### `unreal.ControlRigGizmoLibrary`
Inherits: `ControlRigShapeLibrary`

deprecated: âControlRigGizmoLibraryâ was renamed to âControlRigShapeLibraryâ.

### `unreal.ConvolutionReverbPreset`
Inherits: `SubmixEffectConvolutionReverbPreset`

deprecated: âConvolutionReverbPresetâ was renamed to âSubmixEffectConvolutionReverbPresetâ.

### `unreal.CoreTechBlueprintLibrary`
Inherits: `ParametricSurfaceBlueprintLibrary`

deprecated: âCoreTechBlueprintLibraryâ was renamed to âParametricSurfaceBlueprintLibraryâ.

### `unreal.CoreTechRetessellateActionOptions`
Inherits: `ParametricRetessellateActionOptions`

deprecated: âCoreTechRetessellateActionOptionsâ was renamed to âParametricRetessellateActionOptionsâ.

### `unreal.CustomizableObjectNodeEditLayoutBlocks`
Inherits: `CustomizableObjectNodeModifierEditLayoutBlocks`

deprecated: âCustomizableObjectNodeEditLayoutBlocksâ was renamed to âCustomizableObjectNodeModifierEditLayoutBlocksâ.

### `unreal.CustomizableObjectNodeEditMaterial`
Inherits: `CustomizableObjectNodeModifierEditMeshSection`

deprecated: âCustomizableObjectNodeEditMaterialâ was renamed to âCustomizableObjectNodeModifierEditMeshSectionâ.

### `unreal.CustomizableObjectNodeEditMaterialBase`
Inherits: `CustomizableObjectNodeModifierEditMeshSectionBase`

deprecated: âCustomizableObjectNodeEditMaterialBaseâ was renamed to âCustomizableObjectNodeModifierEditMeshSectionBaseâ.

### `unreal.CustomizableObjectNodeExtendMaterial`
Inherits: `CustomizableObjectNodeModifierExtendMeshSection`

deprecated: âCustomizableObjectNodeExtendMaterialâ was renamed to âCustomizableObjectNodeModifierExtendMeshSectionâ.

### `unreal.CustomizableObjectNodeMeshClipDeform`
Inherits: `CustomizableObjectNodeModifierClipDeform`

deprecated: âCustomizableObjectNodeMeshClipDeformâ was renamed to âCustomizableObjectNodeModifierClipDeformâ.

### `unreal.CustomizableObjectNodeMeshClipMorph`
Inherits: `CustomizableObjectNodeModifierClipMorph`

deprecated: âCustomizableObjectNodeMeshClipMorphâ was renamed to âCustomizableObjectNodeModifierClipMorphâ.

### `unreal.CustomizableObjectNodeMeshClipWithMesh`
Inherits: `CustomizableObjectNodeModifierClipWithMesh`

deprecated: âCustomizableObjectNodeMeshClipWithMeshâ was renamed to âCustomizableObjectNodeModifierClipWithMeshâ.

### `unreal.CustomizableObjectNodeMorphMaterial`
Inherits: `CustomizableObjectNodeModifierMorphMeshSection`

deprecated: âCustomizableObjectNodeMorphMaterialâ was renamed to âCustomizableObjectNodeModifierMorphMeshSectionâ.

### `unreal.CustomizableObjectNodeRemoveMesh`
Inherits: `CustomizableObjectNodeModifierRemoveMesh`

deprecated: âCustomizableObjectNodeRemoveMeshâ was renamed to âCustomizableObjectNodeModifierRemoveMeshâ.

### `unreal.CustomizableObjectNodeRemoveMeshBlocks`
Inherits: `CustomizableObjectNodeModifierRemoveMeshBlocks`

deprecated: âCustomizableObjectNodeRemoveMeshBlocksâ was renamed to âCustomizableObjectNodeModifierRemoveMeshBlocksâ.

### `unreal.CustomPropertyControlComponent`
Inherits: `PropertyAnimatorCoreComponent`

deprecated: âCustomPropertyControlComponentâ was renamed to âPropertyAnimatorCoreComponentâ.

### `unreal.CustomPropertyControlControllerBase`
Inherits: `PropertyAnimatorCoreBase`

deprecated: âCustomPropertyControlControllerBaseâ was renamed to âPropertyAnimatorCoreBaseâ.

### `unreal.CustomPropertyControlResolver`
Inherits: `PropertyAnimatorCoreResolver`

deprecated: âCustomPropertyControlResolverâ was renamed to âPropertyAnimatorCoreResolverâ.

### `unreal.DataprepRemoveObjectsOperation`
Inherits: `DataprepDeleteObjectsOperation`

deprecated: âDataprepRemoveObjectsOperationâ was renamed to âDataprepDeleteObjectsOperationâ.

### `unreal.DatasmithBlutilityActor`
Inherits: `PlacedEditorUtilityBase`

deprecated: âDatasmithBlutilityActorâ was renamed to âPlacedEditorUtilityBaseâ.

### `unreal.DefaultPawnMovement`
Inherits: `FloatingPawnMovement`

deprecated: âDefaultPawnMovementâ was renamed to âFloatingPawnMovementâ.

### `unreal.DirectionalLightMovable`
Inherits: `DirectionalLight`

deprecated: âDirectionalLightMovableâ was renamed to âDirectionalLightâ.

### `unreal.DirectionalLightStatic`
Inherits: `DirectionalLight`

deprecated: âDirectionalLightStaticâ was renamed to âDirectionalLightâ.

### `unreal.DirectionalLightStationary`
Inherits: `DirectionalLight`

deprecated: âDirectionalLightStationaryâ was renamed to âDirectionalLightâ.

### `unreal.DisjunctiveNormalFormFilter`
Inherits: `LevelSnapshotsFilterPreset`

deprecated: âDisjunctiveNormalFormFilterâ was renamed to âLevelSnapshotsFilterPresetâ.

### `unreal.DMMaterialValueTexture2D`
Inherits: `DMMaterialValueTexture`

deprecated: âDMMaterialValueTexture2Dâ was renamed to âDMMaterialValueTextureâ.

### `unreal.DMMaterialValueTextureCube`
Inherits: `DMMaterialValueTexture`

deprecated: âDMMaterialValueTextureCubeâ was renamed to âDMMaterialValueTextureâ.

### `unreal.DMMaterialValueVolumeTexture`
Inherits: `DMMaterialValueTexture`

deprecated: âDMMaterialValueVolumeTextureâ was renamed to âDMMaterialValueTextureâ.

### `unreal.DMXPixelMappingMatrixPixelComponent`
Inherits: `DMXPixelMappingMatrixCellComponent`

deprecated: âDMXPixelMappingMatrixPixelComponentâ was renamed to âDMXPixelMappingMatrixCellComponentâ.

### `unreal.DynamicBlockingVolume`
Inherits: `BlockingVolume`

deprecated: âDynamicBlockingVolumeâ was renamed to âBlockingVolumeâ.

### `unreal.DynamicPhysicsVolume`
Inherits: `PhysicsVolume`

deprecated: âDynamicPhysicsVolumeâ was renamed to âPhysicsVolumeâ.

### `unreal.DynamicTriggerVolume`
Inherits: `TriggerVolume`

deprecated: âDynamicTriggerVolumeâ was renamed to âTriggerVolumeâ.

### `unreal.EditorAutomationActor`
Inherits: `EditorUtilityActor`

deprecated: âEditorAutomationActorâ was renamed to âEditorUtilityActorâ.

### `unreal.EditorAutomationActorComponent`
Inherits: `EditorUtilityActorComponent`

deprecated: âEditorAutomationActorComponentâ was renamed to âEditorUtilityActorComponentâ.

### `unreal.EditorAutomationObject`
Inherits: `EditorUtilityObject`

deprecated: âEditorAutomationObjectâ was renamed to âEditorUtilityObjectâ.

### `unreal.EditorUserSettings`
Inherits: `EditorPerProjectUserSettings`

deprecated: âEditorUserSettingsâ was renamed to âEditorPerProjectUserSettingsâ.

### `unreal.EmitterSpawnable`
Inherits: `Emitter`

deprecated: âEmitterSpawnableâ was renamed to âEmitterâ.

### `unreal.GameplayAbilityBlueprintGeneratedClass`
Inherits: `BlueprintGeneratedClass`

deprecated: âGameplayAbilityBlueprintGeneratedClassâ was renamed to âBlueprintGeneratedClassâ.

### `unreal.GameplayCamerasFunctionLibrary`
Inherits: `EngineCameraAnimationFunctionLibrary`

deprecated: âGameplayCamerasFunctionLibraryâ was renamed to âEngineCameraAnimationFunctionLibraryâ.

### `unreal.GameplayCamerasSubsystem`
Inherits: `EngineCamerasSubsystem`

deprecated: âGameplayCamerasSubsystemâ was renamed to âEngineCamerasSubsystemâ.

### `unreal.GraphDataProvider`
Inherits: `OptimusGraphDataProvider`

deprecated: âGraphDataProviderâ was renamed to âOptimusGraphDataProviderâ.

### `unreal.HairStrandsActor`
Inherits: `GroomActor`

deprecated: âHairStrandsActorâ was renamed to âGroomActorâ.

### `unreal.HairStrandsAsset`
Inherits: `GroomAsset`

deprecated: âHairStrandsAssetâ was renamed to âGroomAssetâ.

### `unreal.HairStrandsComponent`
Inherits: `GroomComponent`

deprecated: âHairStrandsComponentâ was renamed to âGroomComponentâ.

### `unreal.HapticFeedbackEffect`
Inherits: `HapticFeedbackEffect_Curve`

deprecated: âHapticFeedbackEffectâ was renamed to âHapticFeedbackEffect_Curveâ.

### `unreal.HoldoutCompositeSubsystem`
Inherits: `CompositeCoreSubsystem`

deprecated: âHoldoutCompositeSubsystemâ was renamed to âCompositeCoreSubsystemâ.

### `unreal.ImpulseResponse`
Inherits: `AudioImpulseResponse`

deprecated: âImpulseResponseâ was renamed to âAudioImpulseResponseâ.

### `unreal.InstancedFoliageSettings`
Inherits: `FoliageType_InstancedStaticMesh`

deprecated: âInstancedFoliageSettingsâ was renamed to âFoliageType_InstancedStaticMeshâ.

### `unreal.InterchangeAnimationTrackSetFactory`
Inherits: `InterchangeLevelSequenceFactory`

deprecated: âInterchangeAnimationTrackSetFactoryâ was renamed to âInterchangeLevelSequenceFactoryâ.

### `unreal.InterchangeAnimationTrackSetFactoryNode`
Inherits: `InterchangeLevelSequenceFactoryNode`

deprecated: âInterchangeAnimationTrackSetFactoryNodeâ was renamed to âInterchangeLevelSequenceFactoryNodeâ.

### `unreal.InterchangeCineCameraFactoryNode`
Inherits: `InterchangePhysicalCameraFactoryNode`

deprecated: âInterchangeCineCameraFactoryNodeâ was renamed to âInterchangePhysicalCameraFactoryNodeâ.

### `unreal.InterpActor`
Inherits: `StaticMeshActor`

deprecated: âInterpActorâ was renamed to âStaticMeshActorâ.

### `unreal.KinematicMoverComponent`
Inherits: `MoverComponent`

deprecated: âKinematicMoverComponentâ was renamed to âMoverComponentâ.

### `unreal.KismetAIAsyncTaskProxy`
Inherits: `AIAsyncTaskBlueprintProxy`

deprecated: âKismetAIAsyncTaskProxyâ was renamed to âAIAsyncTaskBlueprintProxyâ.

### `unreal.LandscapeBlueprintCustomBrush`
Inherits: `LandscapeBlueprintBrush`

deprecated: âLandscapeBlueprintCustomBrushâ was renamed to âLandscapeBlueprintBrushâ.

### `unreal.LevelSequenceDirectorGeneratedClass`
Inherits: `BlueprintGeneratedClass`

deprecated: âLevelSequenceDirectorGeneratedClassâ was renamed to âBlueprintGeneratedClassâ.

### `unreal.LevelSnapshotsEditorDataManagementSettings`
Inherits: `LevelSnapshotsEditorSettings`

deprecated: âLevelSnapshotsEditorDataManagementSettingsâ was renamed to âLevelSnapshotsEditorSettingsâ.

### `unreal.LevelStreamingKismet`
Inherits: `LevelStreamingDynamic`

deprecated: âLevelStreamingKismetâ was renamed to âLevelStreamingDynamicâ.

### `unreal.LiveLinkAxisSwitchPreProcessor`
Inherits: `LiveLinkTransformAxisSwitchPreProcessor`

deprecated: âLiveLinkAxisSwitchPreProcessorâ was renamed to âLiveLinkTransformAxisSwitchPreProcessorâ.

### `unreal.MaterialExpressionAppend3Vector`
Inherits: `MaterialExpressionMaterialXAppend3Vector`

deprecated: âMaterialExpressionAppend3Vectorâ was renamed to âMaterialExpressionMaterialXAppend3Vectorâ.

### `unreal.MaterialExpressionAppend4Vector`
Inherits: `MaterialExpressionMaterialXAppend4Vector`

deprecated: âMaterialExpressionAppend4Vectorâ was renamed to âMaterialExpressionMaterialXAppend4Vectorâ.

### `unreal.MaterialExpressionBurn`
Inherits: `MaterialExpressionMaterialXBurn`

deprecated: âMaterialExpressionBurnâ was renamed to âMaterialExpressionMaterialXBurnâ.

### `unreal.MaterialExpressionDifference`
Inherits: `MaterialExpressionMaterialXDifference`

deprecated: âMaterialExpressionDifferenceâ was renamed to âMaterialExpressionMaterialXDifferenceâ.

### `unreal.MaterialExpressionDisjointOver`
Inherits: `MaterialExpressionMaterialXDisjointOver`

deprecated: âMaterialExpressionDisjointOverâ was renamed to âMaterialExpressionMaterialXDisjointOverâ.

### `unreal.MaterialExpressionDodge`
Inherits: `MaterialExpressionMaterialXDodge`

deprecated: âMaterialExpressionDodgeâ was renamed to âMaterialExpressionMaterialXDodgeâ.

### `unreal.MaterialExpressionFractal3D`
Inherits: `MaterialExpressionMaterialXFractal3D`

deprecated: âMaterialExpressionFractal3Dâ was renamed to âMaterialExpressionMaterialXFractal3Dâ.

### `unreal.MaterialExpressionIn`
Inherits: `MaterialExpressionMaterialXIn`

deprecated: âMaterialExpressionInâ was renamed to âMaterialExpressionMaterialXInâ.

### `unreal.MaterialExpressionLuminance`
Inherits: `MaterialExpressionMaterialXLuminance`

deprecated: âMaterialExpressionLuminanceâ was renamed to âMaterialExpressionMaterialXLuminanceâ.

### `unreal.MaterialExpressionMask`
Inherits: `MaterialExpressionMaterialXMask`

deprecated: âMaterialExpressionMaskâ was renamed to âMaterialExpressionMaterialXMaskâ.

### `unreal.MaterialExpressionMaterialXExponential`
Inherits: `MaterialExpressionExponential`

deprecated: âMaterialExpressionMaterialXExponentialâ was renamed to âMaterialExpressionExponentialâ.

### `unreal.MaterialExpressionMaterialXHsvToRgb`
Inherits: `MaterialExpressionHsvToRgb`

deprecated: âMaterialExpressionMaterialXHsvToRgbâ was renamed to âMaterialExpressionHsvToRgbâ.

### `unreal.MaterialExpressionMaterialXLength`
Inherits: `MaterialExpressionLength`

deprecated: âMaterialExpressionMaterialXLengthâ was renamed to âMaterialExpressionLengthâ.

### `unreal.MaterialExpressionMaterialXLogarithm`
Inherits: `MaterialExpressionLogarithm`

deprecated: âMaterialExpressionMaterialXLogarithmâ was renamed to âMaterialExpressionLogarithmâ.

### `unreal.MaterialExpressionMaterialXRgbToHsv`
Inherits: `MaterialExpressionRgbToHsv`

deprecated: âMaterialExpressionMaterialXRgbToHsvâ was renamed to âMaterialExpressionRgbToHsvâ.

### `unreal.MaterialExpressionMatte`
Inherits: `MaterialExpressionMaterialXMatte`

deprecated: âMaterialExpressionMatteâ was renamed to âMaterialExpressionMaterialXMatteâ.

### `unreal.MaterialExpressionMinus`
Inherits: `MaterialExpressionMaterialXMinus`

deprecated: âMaterialExpressionMinusâ was renamed to âMaterialExpressionMaterialXMinusâ.

### `unreal.MaterialExpressionOut`
Inherits: `MaterialExpressionMaterialXOut`

deprecated: âMaterialExpressionOutâ was renamed to âMaterialExpressionMaterialXOutâ.

### `unreal.MaterialExpressionOver`
Inherits: `MaterialExpressionMaterialXOver`

deprecated: âMaterialExpressionOverâ was renamed to âMaterialExpressionMaterialXOverâ.

### `unreal.MaterialExpressionOverlay`
Inherits: `MaterialExpressionMaterialXOverlay`

deprecated: âMaterialExpressionOverlayâ was renamed to âMaterialExpressionMaterialXOverlayâ.

### `unreal.MaterialExpressionPlace2D`
Inherits: `MaterialExpressionMaterialXPlace2D`

deprecated: âMaterialExpressionPlace2Dâ was renamed to âMaterialExpressionMaterialXPlace2Dâ.

### `unreal.MaterialExpressionPlus`
Inherits: `MaterialExpressionMaterialXPlus`

deprecated: âMaterialExpressionPlusâ was renamed to âMaterialExpressionMaterialXPlusâ.

### `unreal.MaterialExpressionPremult`
Inherits: `MaterialExpressionMaterialXPremult`

deprecated: âMaterialExpressionPremultâ was renamed to âMaterialExpressionMaterialXPremultâ.

### `unreal.MaterialExpressionRamp4`
Inherits: `MaterialExpressionMaterialXRamp4`

deprecated: âMaterialExpressionRamp4â was renamed to âMaterialExpressionMaterialXRamp4â.

### `unreal.MaterialExpressionRampLeftRight`
Inherits: `MaterialExpressionMaterialXRampLeftRight`

deprecated: âMaterialExpressionRampLeftRightâ was renamed to âMaterialExpressionMaterialXRampLeftRightâ.

### `unreal.MaterialExpressionRampTopBottom`
Inherits: `MaterialExpressionMaterialXRampTopBottom`

deprecated: âMaterialExpressionRampTopBottomâ was renamed to âMaterialExpressionMaterialXRampTopBottomâ.

### `unreal.MaterialExpressionRemap`
Inherits: `MaterialExpressionMaterialXRemap`

deprecated: âMaterialExpressionRemapâ was renamed to âMaterialExpressionMaterialXRemapâ.

### `unreal.MaterialExpressionRotate2D`
Inherits: `MaterialExpressionMaterialXRotate2D`

deprecated: âMaterialExpressionRotate2Dâ was renamed to âMaterialExpressionMaterialXRotate2Dâ.

### `unreal.MaterialExpressionScreen`
Inherits: `MaterialExpressionMaterialXScreen`

deprecated: âMaterialExpressionScreenâ was renamed to âMaterialExpressionMaterialXScreenâ.

### `unreal.MaterialExpressionSplitLeftRight`
Inherits: `MaterialExpressionMaterialXSplitLeftRight`

deprecated: âMaterialExpressionSplitLeftRightâ was renamed to âMaterialExpressionMaterialXSplitLeftRightâ.

### `unreal.MaterialExpressionSplitTopBottom`
Inherits: `MaterialExpressionMaterialXSplitTopBottom`

deprecated: âMaterialExpressionSplitTopBottomâ was renamed to âMaterialExpressionMaterialXSplitTopBottomâ.

### `unreal.MaterialExpressionStrataAdd`
Inherits: `MaterialExpressionSubstrateAdd`

deprecated: âMaterialExpressionStrataAddâ was renamed to âMaterialExpressionSubstrateAddâ.

### `unreal.MaterialExpressionStrataBSDF`
Inherits: `MaterialExpressionSubstrateBSDF`

deprecated: âMaterialExpressionStrataBSDFâ was renamed to âMaterialExpressionSubstrateBSDFâ.

### `unreal.MaterialExpressionStrataConvertToDecal`
Inherits: `MaterialExpressionSubstrateConvertToDecal`

deprecated: âMaterialExpressionStrataConvertToDecalâ was renamed to âMaterialExpressionSubstrateConvertToDecalâ.

### `unreal.MaterialExpressionStrataEyeBSDF`
Inherits: `MaterialExpressionSubstrateEyeBSDF`

deprecated: âMaterialExpressionStrataEyeBSDFâ was renamed to âMaterialExpressionSubstrateEyeBSDFâ.

### `unreal.MaterialExpressionStrataHairBSDF`
Inherits: `MaterialExpressionSubstrateHairBSDF`

deprecated: âMaterialExpressionStrataHairBSDFâ was renamed to âMaterialExpressionSubstrateHairBSDFâ.

### `unreal.MaterialExpressionStrataHazinessToSecondaryRoughness`
Inherits: `MaterialExpressionSubstrateHazinessToSecondaryRoughness`

deprecated: âMaterialExpressionStrataHazinessToSecondaryRoughnessâ was renamed to âMaterialExpressionSubstrateHazinessToSecondaryRoughnessâ.

### `unreal.MaterialExpressionStrataHorizontalMixing`
Inherits: `MaterialExpressionSubstrateHorizontalMixing`

deprecated: âMaterialExpressionStrataHorizontalMixingâ was renamed to âMaterialExpressionSubstrateHorizontalMixingâ.

### `unreal.MaterialExpressionStrataLegacyConversion`
Inherits: `MaterialExpressionSubstrateShadingModels`

deprecated: âMaterialExpressionStrataLegacyConversionâ was renamed to âMaterialExpressionSubstrateShadingModelsâ.

### `unreal.MaterialExpressionStrataLightFunction`
Inherits: `MaterialExpressionSubstrateLightFunction`

deprecated: âMaterialExpressionStrataLightFunctionâ was renamed to âMaterialExpressionSubstrateLightFunctionâ.

### `unreal.MaterialExpressionStrataMetalnessToDiffuseAlbedoF0`
Inherits: `MaterialExpressionSubstrateMetalnessToDiffuseAlbedoF0`

deprecated: âMaterialExpressionStrataMetalnessToDiffuseAlbedoF0â was renamed to âMaterialExpressionSubstrateMetalnessToDiffuseAlbedoF0â.

### `unreal.MaterialExpressionStrataPostProcess`
Inherits: `MaterialExpressionSubstratePostProcess`

deprecated: âMaterialExpressionStrataPostProcessâ was renamed to âMaterialExpressionSubstratePostProcessâ.

### `unreal.MaterialExpressionStrataSimpleClearCoatBSDF`
Inherits: `MaterialExpressionSubstrateSimpleClearCoatBSDF`

deprecated: âMaterialExpressionStrataSimpleClearCoatBSDFâ was renamed to âMaterialExpressionSubstrateSimpleClearCoatBSDFâ.

### `unreal.MaterialExpressionStrataSingleLayerWaterBSDF`
Inherits: `MaterialExpressionSubstrateSingleLayerWaterBSDF`

deprecated: âMaterialExpressionStrataSingleLayerWaterBSDFâ was renamed to âMaterialExpressionSubstrateSingleLayerWaterBSDFâ.

### `unreal.MaterialExpressionStrataSlabBSDF`
Inherits: `MaterialExpressionSubstrateSlabBSDF`

deprecated: âMaterialExpressionStrataSlabBSDFâ was renamed to âMaterialExpressionSubstrateSlabBSDFâ.

### `unreal.MaterialExpressionStrataThinFilm`
Inherits: `MaterialExpressionSubstrateThinFilm`

deprecated: âMaterialExpressionStrataThinFilmâ was renamed to âMaterialExpressionSubstrateThinFilmâ.

### `unreal.MaterialExpressionStrataTransmittanceToMFP`
Inherits: `MaterialExpressionSubstrateTransmittanceToMFP`

deprecated: âMaterialExpressionStrataTransmittanceToMFPâ was renamed to âMaterialExpressionSubstrateTransmittanceToMFPâ.

### `unreal.MaterialExpressionStrataUI`
Inherits: `MaterialExpressionSubstrateUI`

deprecated: âMaterialExpressionStrataUIâ was renamed to âMaterialExpressionSubstrateUIâ.

### `unreal.MaterialExpressionStrataUnlitBSDF`
Inherits: `MaterialExpressionSubstrateUnlitBSDF`

deprecated: âMaterialExpressionStrataUnlitBSDFâ was renamed to âMaterialExpressionSubstrateUnlitBSDFâ.

### `unreal.MaterialExpressionStrataUtilityBase`
Inherits: `MaterialExpressionSubstrateUtilityBase`

deprecated: âMaterialExpressionStrataUtilityBaseâ was renamed to âMaterialExpressionSubstrateUtilityBaseâ.

### `unreal.MaterialExpressionStrataVerticalLayering`
Inherits: `MaterialExpressionSubstrateVerticalLayering`

deprecated: âMaterialExpressionStrataVerticalLayeringâ was renamed to âMaterialExpressionSubstrateVerticalLayeringâ.

### `unreal.MaterialExpressionStrataVolumetricFogCloudBSDF`
Inherits: `MaterialExpressionSubstrateVolumetricFogCloudBSDF`

deprecated: âMaterialExpressionStrataVolumetricFogCloudBSDFâ was renamed to âMaterialExpressionSubstrateVolumetricFogCloudBSDFâ.

### `unreal.MaterialExpressionStrataWeight`
Inherits: `MaterialExpressionSubstrateWeight`

deprecated: âMaterialExpressionStrataWeightâ was renamed to âMaterialExpressionSubstrateWeightâ.

### `unreal.MaterialExpressionTerrainLayerCoords`
Inherits: `MaterialExpressionLandscapeLayerCoords`

deprecated: âMaterialExpressionTerrainLayerCoordsâ was renamed to âMaterialExpressionLandscapeLayerCoordsâ.

### `unreal.MaterialExpressionTerrainLayerSwitch`
Inherits: `MaterialExpressionLandscapeLayerSwitch`

deprecated: âMaterialExpressionTerrainLayerSwitchâ was renamed to âMaterialExpressionLandscapeLayerSwitchâ.

### `unreal.MaterialExpressionTerrainLayerWeight`
Inherits: `MaterialExpressionLandscapeLayerWeight`

deprecated: âMaterialExpressionTerrainLayerWeightâ was renamed to âMaterialExpressionLandscapeLayerWeightâ.

### `unreal.MaterialExpressionTextureSampleParameterBlur`
Inherits: `MaterialExpressionMaterialXTextureSampleParameterBlur`

deprecated: âMaterialExpressionTextureSampleParameterBlurâ was renamed to âMaterialExpressionMaterialXTextureSampleParameterBlurâ.

### `unreal.MaterialExpressionUnpremult`
Inherits: `MaterialExpressionMaterialXUnpremult`

deprecated: âMaterialExpressionUnpremultâ was renamed to âMaterialExpressionMaterialXUnpremultâ.

### `unreal.MaterialSpriteComponent`
Inherits: `MaterialBillboardComponent`

deprecated: âMaterialSpriteComponentâ was renamed to âMaterialBillboardComponentâ.

### `unreal.MatineeCameraShake`
Inherits: `LegacyCameraShake`

deprecated: âMatineeCameraShakeâ was renamed to âLegacyCameraShakeâ.

### `unreal.MatineeCameraShakeFunctionLibrary`
Inherits: `LegacyCameraShakeFunctionLibrary`

deprecated: âMatineeCameraShakeFunctionLibraryâ was renamed to âLegacyCameraShakeFunctionLibraryâ.

### `unreal.MetaHumanCameraCalibration`
Inherits: `CameraCalibration`

deprecated: âMetaHumanCameraCalibrationâ was renamed to âCameraCalibrationâ.

### `unreal.MetaSound`
Inherits: `MetaSoundPatch`

deprecated: âMetaSoundâ was renamed to âMetaSoundPatchâ.

### `unreal.MetasoundEditorGraphInputBool`
Inherits: `MetasoundEditorGraphMemberDefaultBool`

deprecated: âMetasoundEditorGraphInputBoolâ was renamed to âMetasoundEditorGraphMemberDefaultBoolâ.

### `unreal.MetasoundEditorGraphInputBoolArray`
Inherits: `MetasoundEditorGraphMemberDefaultBoolArray`

deprecated: âMetasoundEditorGraphInputBoolArrayâ was renamed to âMetasoundEditorGraphMemberDefaultBoolArrayâ.

### `unreal.MetasoundEditorGraphInputFloat`
Inherits: `MetasoundEditorGraphMemberDefaultFloat`

deprecated: âMetasoundEditorGraphInputFloatâ was renamed to âMetasoundEditorGraphMemberDefaultFloatâ.

### `unreal.MetasoundEditorGraphInputFloatArray`
Inherits: `MetasoundEditorGraphMemberDefaultFloatArray`

deprecated: âMetasoundEditorGraphInputFloatArrayâ was renamed to âMetasoundEditorGraphMemberDefaultFloatArrayâ.

### `unreal.MetasoundEditorGraphInputInt`
Inherits: `MetasoundEditorGraphMemberDefaultInt`

deprecated: âMetasoundEditorGraphInputIntâ was renamed to âMetasoundEditorGraphMemberDefaultIntâ.

### `unreal.MetasoundEditorGraphInputIntArray`
Inherits: `MetasoundEditorGraphMemberDefaultIntArray`

deprecated: âMetasoundEditorGraphInputIntArrayâ was renamed to âMetasoundEditorGraphMemberDefaultIntArrayâ.

### `unreal.MetasoundEditorGraphInputLiteral`
Inherits: `MetasoundEditorGraphMemberDefaultLiteral`

deprecated: âMetasoundEditorGraphInputLiteralâ was renamed to âMetasoundEditorGraphMemberDefaultLiteralâ.

### `unreal.MetasoundEditorGraphInputObject`
Inherits: `MetasoundEditorGraphMemberDefaultObject`

deprecated: âMetasoundEditorGraphInputObjectâ was renamed to âMetasoundEditorGraphMemberDefaultObjectâ.

### `unreal.MetasoundEditorGraphInputObjectArray`
Inherits: `MetasoundEditorGraphMemberDefaultObjectArray`

deprecated: âMetasoundEditorGraphInputObjectArrayâ was renamed to âMetasoundEditorGraphMemberDefaultObjectArrayâ.

### `unreal.MetasoundEditorGraphInputString`
Inherits: `MetasoundEditorGraphMemberDefaultString`

deprecated: âMetasoundEditorGraphInputStringâ was renamed to âMetasoundEditorGraphMemberDefaultStringâ.

### `unreal.MetasoundEditorGraphInputStringArray`
Inherits: `MetasoundEditorGraphMemberDefaultStringArray`

deprecated: âMetasoundEditorGraphInputStringArrayâ was renamed to âMetasoundEditorGraphMemberDefaultStringArrayâ.

### `unreal.MorphTargetDataProvider`
Inherits: `OptimusMorphTargetDataProvider`

deprecated: âMorphTargetDataProviderâ was renamed to âOptimusMorphTargetDataProviderâ.

### `unreal.MovementComp_Character`
Inherits: `CharacterMovementComponent`

deprecated: âMovementComp_Characterâ was renamed to âCharacterMovementComponentâ.

### `unreal.MovementComp_Projectile`
Inherits: `ProjectileMovementComponent`

deprecated: âMovementComp_Projectileâ was renamed to âProjectileMovementComponentâ.

### `unreal.MovementComp_Rotating`
Inherits: `RotatingMovementComponent`

deprecated: âMovementComp_Rotatingâ was renamed to âRotatingMovementComponentâ.

### `unreal.MovieGraphOutputSettingNode`
Inherits: `MovieGraphGlobalOutputSettingNode`

deprecated: âMovieGraphOutputSettingNodeâ was renamed to âMovieGraphGlobalOutputSettingNodeâ.

### `unreal.MovieGraphPathTracedRenderPassNode`
Inherits: `MovieGraphPathTracerRenderPassNode`

deprecated: âMovieGraphPathTracedRenderPassNodeâ was renamed to âMovieGraphPathTracerRenderPassNodeâ.

### `unreal.MoviePipelineCollection`
Inherits: `MovieGraphCollection`

deprecated: âMoviePipelineCollectionâ was renamed to âMovieGraphCollectionâ.

### `unreal.MoviePipelineCollectionModifier`
Inherits: `MovieGraphCollectionModifier`

deprecated: âMoviePipelineCollectionModifierâ was renamed to âMovieGraphCollectionModifierâ.

### `unreal.MoviePipelineMasterConfig`
Inherits: `MoviePipelinePrimaryConfig`

deprecated: âMoviePipelineMasterConfigâ was renamed to âMoviePipelinePrimaryConfigâ.

### `unreal.MoviePipelineMaterialModifier`
Inherits: `MovieGraphMaterialModifier`

deprecated: âMoviePipelineMaterialModifierâ was renamed to âMovieGraphMaterialModifierâ.

### `unreal.MoviePipelineVisibilityModifier`
Inherits: `MovieGraphRenderPropertyModifier`

deprecated: âMoviePipelineVisibilityModifierâ was renamed to âMovieGraphRenderPropertyModifierâ.

### `unreal.MovieSceneAvaToolboxRectCornerSection`
Inherits: `MovieSceneAvaShapeRectCornerSection`

deprecated: âMovieSceneAvaToolboxRectCornerSectionâ was renamed to âMovieSceneAvaShapeRectCornerSectionâ.

### `unreal.MovieSceneAvaToolboxRectCornerTrack`
Inherits: `MovieSceneAvaShapeRectCornerTrack`

deprecated: âMovieSceneAvaToolboxRectCornerTrackâ was renamed to âMovieSceneAvaShapeRectCornerTrackâ.

### `unreal.MovieSceneMaterialParameterSection`
Inherits: `MovieSceneParameterSection`

deprecated: âMovieSceneMaterialParameterSectionâ was renamed to âMovieSceneParameterSectionâ.

### `unreal.MovieSceneShotSection`
Inherits: `MovieSceneCameraCutSection`

deprecated: âMovieSceneShotSectionâ was renamed to âMovieSceneCameraCutSectionâ.

### `unreal.MovieSceneShotTrack`
Inherits: `MovieSceneCameraCutTrack`

deprecated: âMovieSceneShotTrackâ was renamed to âMovieSceneCameraCutTrackâ.

### `unreal.MovieSceneVectorSection`
Inherits: `MovieSceneFloatVectorSection`

deprecated: âMovieSceneVectorSectionâ was renamed to âMovieSceneFloatVectorSectionâ.

### `unreal.MovieSceneVectorTrack`
Inherits: `MovieSceneFloatVectorTrack`

deprecated: âMovieSceneVectorTrackâ was renamed to âMovieSceneFloatVectorTrackâ.

### `unreal.MovieSceneVectorTrackExtensions`
Inherits: `MovieSceneFloatVectorTrackExtensions`

deprecated: âMovieSceneVectorTrackExtensionsâ was renamed to âMovieSceneFloatVectorTrackExtensionsâ.

### `unreal.MrcOpenCVCalibrator`
Inherits: `OpenCVLensCalibrator`

deprecated: âMrcOpenCVCalibratorâ was renamed to âOpenCVLensCalibratorâ.

### `unreal.NavAreaDefault`
Inherits: `NavArea_Default`

deprecated: âNavAreaDefaultâ was renamed to âNavArea_Defaultâ.

### `unreal.NavAreaDefinition`
Inherits: `NavArea`

deprecated: âNavAreaDefinitionâ was renamed to âNavAreaâ.

### `unreal.NavAreaNull`
Inherits: `NavArea_Null`

deprecated: âNavAreaNullâ was renamed to âNavArea_Nullâ.

### `unreal.NavigationSystem`
Inherits: `NavigationSystemV1`

deprecated: âNavigationSystemâ was renamed to âNavigationSystemV1â.

### `unreal.NiagaraEffect`
Inherits: `NiagaraSystem`

deprecated: âNiagaraEffectâ was renamed to âNiagaraSystemâ.

### `unreal.NiagaraEffectRendererProperties`
Inherits: `NiagaraRendererProperties`

deprecated: âNiagaraEffectRendererPropertiesâ was renamed to âNiagaraRendererPropertiesâ.

### `unreal.NiagaraEmitterProperties`
Inherits: `NiagaraEmitter`

deprecated: âNiagaraEmitterPropertiesâ was renamed to âNiagaraEmitterâ.

### `unreal.PackedLevelInstance`
Inherits: `PackedLevelActor`

deprecated: âPackedLevelInstanceâ was renamed to âPackedLevelActorâ.

### `unreal.PaperAnimatedRenderComponent`
Inherits: `PaperFlipbookComponent`

deprecated: âPaperAnimatedRenderComponentâ was renamed to âPaperFlipbookComponentâ.

### `unreal.PaperRenderActor`
Inherits: `PaperSpriteActor`

deprecated: âPaperRenderActorâ was renamed to âPaperSpriteActorâ.

### `unreal.PaperRenderComponent`
Inherits: `PaperSpriteComponent`

deprecated: âPaperRenderComponentâ was renamed to âPaperSpriteComponentâ.

### `unreal.PaperTileMapRenderComponent`
Inherits: `PaperTileMapComponent`

deprecated: âPaperTileMapRenderComponentâ was renamed to âPaperTileMapComponentâ.

### `unreal.PCap_CharacterDataAsset`
Inherits: `PCapCharacterDataAsset`

deprecated: âPCap_CharacterDataAssetâ was renamed to âPCapCharacterDataAssetâ.

### `unreal.PCap_DataAsset`
Inherits: `PCapDataAsset`

deprecated: âPCap_DataAssetâ was renamed to âPCapDataAssetâ.

### `unreal.PCap_PerformerDataAsset`
Inherits: `PCapPerformerDataAsset`

deprecated: âPCap_PerformerDataAssetâ was renamed to âPCapPerformerDataAssetâ.

### `unreal.PCap_PropDataAsset`
Inherits: `PCapPropDataAsset`

deprecated: âPCap_PropDataAssetâ was renamed to âPCapPropDataAssetâ.

### `unreal.PCGAttributeFilterNamesSettings`
Inherits: `PCGDeleteAttributesSettings`

deprecated: âPCGAttributeFilterNamesSettingsâ was renamed to âPCGDeleteAttributesSettingsâ.

### `unreal.PCGAttributeFilterSettings`
Inherits: `PCGDeleteAttributesSettings`

deprecated: âPCGAttributeFilterSettingsâ was renamed to âPCGDeleteAttributesSettingsâ.

### `unreal.PCGCreateAttributeSettings`
Inherits: `PCGAddAttributeSettings`

deprecated: âPCGCreateAttributeSettingsâ was renamed to âPCGAddAttributeSettingsâ.

### `unreal.PCGCreateSplineMeshSettings`
Inherits: `PCGSpawnSplineMeshSettings`

deprecated: âPCGCreateSplineMeshSettingsâ was renamed to âPCGSpawnSplineMeshSettingsâ.

### `unreal.PCGDensityNoiseSettings`
Inherits: `PCGAttributeNoiseSettings`

deprecated: âPCGDensityNoiseSettingsâ was renamed to âPCGAttributeNoiseSettingsâ.

### `unreal.PCGInstancePackerBase`
Inherits: `PCGInstanceDataPackerBase`

deprecated: âPCGInstancePackerBaseâ was renamed to âPCGInstanceDataPackerBaseâ.

### `unreal.PCGInstancePackerByAttribute`
Inherits: `PCGInstanceDataPackerByAttribute`

deprecated: âPCGInstancePackerByAttributeâ was renamed to âPCGInstanceDataPackerByAttributeâ.

### `unreal.PCGInstancePackerByRegex`
Inherits: `PCGInstanceDataPackerByRegex`

deprecated: âPCGInstancePackerByRegexâ was renamed to âPCGInstanceDataPackerByRegexâ.

### `unreal.PCGIntersectionSettings`
Inherits: `PCGInnerIntersectionSettings`

deprecated: âPCGIntersectionSettingsâ was renamed to âPCGInnerIntersectionSettingsâ.

### `unreal.PCGPointFilterRangeSettings`
Inherits: `PCGAttributeFilteringRangeSettings`

deprecated: âPCGPointFilterRangeSettingsâ was renamed to âPCGAttributeFilteringRangeSettingsâ.

### `unreal.PCGPointFilterSettings`
Inherits: `PCGAttributeFilteringSettings`

deprecated: âPCGPointFilterSettingsâ was renamed to âPCGAttributeFilteringSettingsâ.

### `unreal.PCGPointSamplerSettings`
Inherits: `PCGSelectPointsSettings`

deprecated: âPCGPointSamplerSettingsâ was renamed to âPCGSelectPointsSettingsâ.

### `unreal.PCGPropertyToParamDataSettings`
Inherits: `PCGGetActorPropertySettings`

deprecated: âPCGPropertyToParamDataSettingsâ was renamed to âPCGGetActorPropertySettingsâ.

### `unreal.PCGSortPointsSettings`
Inherits: `PCGSortAttributesSettings`

deprecated: âPCGSortPointsSettingsâ was renamed to âPCGSortAttributesSettingsâ.

### `unreal.PCGSplineCrossSectionGeneratorSettings`
Inherits: `PCGPrimitiveCrossSectionSettings`

deprecated: âPCGSplineCrossSectionGeneratorSettingsâ was renamed to âPCGPrimitiveCrossSectionSettingsâ.

### `unreal.PersistentBufferDataProvider`
Inherits: `OptimusPersistentBufferDataProvider`

deprecated: âPersistentBufferDataProviderâ was renamed to âOptimusPersistentBufferDataProviderâ.

### `unreal.PhysicsActor`
Inherits: `StaticMeshActor`

deprecated: âPhysicsActorâ was renamed to âStaticMeshActorâ.

### `unreal.PhysicsBSJointActor`
Inherits: `PhysicsConstraintActor`

deprecated: âPhysicsBSJointActorâ was renamed to âPhysicsConstraintActorâ.

### `unreal.PhysicsControlProfileAsset`
Inherits: `PhysicsControlAsset`

deprecated: âPhysicsControlProfileAssetâ was renamed to âPhysicsControlAssetâ.

### `unreal.PhysicsHingeActor`
Inherits: `PhysicsConstraintActor`

deprecated: âPhysicsHingeActorâ was renamed to âPhysicsConstraintActorâ.

### `unreal.PhysicsPrismaticActor`
Inherits: `PhysicsConstraintActor`

deprecated: âPhysicsPrismaticActorâ was renamed to âPhysicsConstraintActorâ.

### `unreal.PixelStreamerInputComponent`
Inherits: `PixelStreamingInput`

deprecated: âPixelStreamerInputComponentâ was renamed to âPixelStreamingInputâ.

### `unreal.PixelStreamingInputComponent`
Inherits: `PixelStreamingInput`

deprecated: âPixelStreamingInputComponentâ was renamed to âPixelStreamingInputâ.

### `unreal.PlatformInputDeviceMapperLibrary`
Inherits: `InputDeviceLibrary`

deprecated: âPlatformInputDeviceMapperLibraryâ was renamed to âInputDeviceLibraryâ.

### `unreal.PointLightMovable`
Inherits: `PointLight`

deprecated: âPointLightMovableâ was renamed to âPointLightâ.

### `unreal.PointLightStatic`
Inherits: `PointLight`

deprecated: âPointLightStaticâ was renamed to âPointLightâ.

### `unreal.PointLightStationary`
Inherits: `PointLight`

deprecated: âPointLightStationaryâ was renamed to âPointLightâ.

### `unreal.ProceduralFoliage`
Inherits: `ProceduralFoliageSpawner`

deprecated: âProceduralFoliageâ was renamed to âProceduralFoliageSpawnerâ.

### `unreal.ProceduralFoliageActor`
Inherits: `ProceduralFoliageVolume`

deprecated: âProceduralFoliageActorâ was renamed to âProceduralFoliageVolumeâ.

### `unreal.PropertyAnimatorBlink`
Inherits: `PropertyAnimatorPulse`

deprecated: âPropertyAnimatorBlinkâ was renamed to âPropertyAnimatorPulseâ.

### `unreal.PropertyAnimatorFloatBase`
Inherits: `PropertyAnimatorNumericBase`

deprecated: âPropertyAnimatorFloatBaseâ was renamed to âPropertyAnimatorNumericBaseâ.

### `unreal.PropertyAnimatorTimeSourceBase`
Inherits: `PropertyAnimatorCoreTimeSourceBase`

deprecated: âPropertyAnimatorTimeSourceBaseâ was renamed to âPropertyAnimatorCoreTimeSourceBaseâ.

### `unreal.PropertyControllerBlink`
Inherits: `PropertyAnimatorPulse`

deprecated: âPropertyControllerBlinkâ was renamed to âPropertyAnimatorPulseâ.

### `unreal.PropertyControllerBounce`
Inherits: `PropertyAnimatorBounce`

deprecated: âPropertyControllerBounceâ was renamed to âPropertyAnimatorBounceâ.

### `unreal.PropertyControllerFloatBase`
Inherits: `PropertyAnimatorNumericBase`

deprecated: âPropertyControllerFloatBaseâ was renamed to âPropertyAnimatorNumericBaseâ.

### `unreal.PropertyControllerOscillate`
Inherits: `PropertyAnimatorOscillate`

deprecated: âPropertyControllerOscillateâ was renamed to âPropertyAnimatorOscillateâ.

### `unreal.RB_BodySetup`
Inherits: `BodySetup`

deprecated: âRB_BodySetupâ was renamed to âBodySetupâ.

### `unreal.RB_ConstraintActor`
Inherits: `PhysicsConstraintActor`

deprecated: âRB_ConstraintActorâ was renamed to âPhysicsConstraintActorâ.

### `unreal.RB_ConstraintComponent`
Inherits: `PhysicsConstraintComponent`

deprecated: âRB_ConstraintComponentâ was renamed to âPhysicsConstraintComponentâ.

### `unreal.RB_Handle`
Inherits: `PhysicsHandleComponent`

deprecated: âRB_Handleâ was renamed to âPhysicsHandleComponentâ.

### `unreal.RB_RadialForceComponent`
Inherits: `RadialForceComponent`

deprecated: âRB_RadialForceComponentâ was renamed to âRadialForceComponentâ.

### `unreal.RB_Thruster`
Inherits: `PhysicsThruster`

deprecated: âRB_Thrusterâ was renamed to âPhysicsThrusterâ.

### `unreal.RB_ThrusterComponent`
Inherits: `PhysicsThrusterComponent`

deprecated: âRB_ThrusterComponentâ was renamed to âPhysicsThrusterComponentâ.

### `unreal.ReverbVolume`
Inherits: `AudioVolume`

deprecated: âReverbVolumeâ was renamed to âAudioVolumeâ.

### `unreal.ReverbVolumeToggleable`
Inherits: `AudioVolume`

deprecated: âReverbVolumeToggleableâ was renamed to âAudioVolumeâ.

### `unreal.RigVMStructNode`
Inherits: `RigVMUnitNode`

deprecated: âRigVMStructNodeâ was renamed to âRigVMUnitNodeâ.

### `unreal.SceneDataProvider`
Inherits: `OptimusSceneDataProvider`

deprecated: âSceneDataProviderâ was renamed to âOptimusSceneDataProviderâ.

### `unreal.SceneStateTask`
Inherits: `SceneStateBlueprintableTask`

deprecated: âSceneStateTaskâ was renamed to âSceneStateBlueprintableTaskâ.

### `unreal.SensingComponent`
Inherits: `PawnSensingComponent`

deprecated: âSensingComponentâ was renamed to âPawnSensingComponentâ.

### `unreal.ShotgunEngine`
Inherits: `ShotgridEngine`

deprecated: âShotgunEngineâ was renamed to âShotgridEngineâ.

### `unreal.SingleAnimSkeletalActor`
Inherits: `SkeletalMeshActor`

deprecated: âSingleAnimSkeletalActorâ was renamed to âSkeletalMeshActorâ.

### `unreal.SingleAnimSkeletalComponent`
Inherits: `SkeletalMeshComponent`

deprecated: âSingleAnimSkeletalComponentâ was renamed to âSkeletalMeshComponentâ.

### `unreal.SkeletalMeshReadDataProvider`
Inherits: `OptimusSkinnedMeshDataProvider`

deprecated: âSkeletalMeshReadDataProviderâ was renamed to âOptimusSkinnedMeshDataProviderâ.

### `unreal.SkeletalMeshReplicatedComponent`
Inherits: `SkeletalMeshComponent`

deprecated: âSkeletalMeshReplicatedComponentâ was renamed to âSkeletalMeshComponentâ.

### `unreal.SkeletalMeshUtilitiesLibrary`
Inherits: `EditorSkeletalMeshLibrary`

deprecated: âSkeletalMeshUtilitiesLibraryâ was renamed to âEditorSkeletalMeshLibraryâ.

### `unreal.SkeletalPhysicsActor`
Inherits: `SkeletalMeshActor`

deprecated: âSkeletalPhysicsActorâ was renamed to âSkeletalMeshActorâ.

### `unreal.SkeletonDataProvider`
Inherits: `OptimusSkeletonDataProvider`

deprecated: âSkeletonDataProviderâ was renamed to âOptimusSkeletonDataProviderâ.

### `unreal.SkinnedMeshDataProvider`
Inherits: `OptimusSkinnedMeshDataProvider`

deprecated: âSkinnedMeshDataProviderâ was renamed to âOptimusSkinnedMeshDataProviderâ.

### `unreal.SkinnedMeshWriteDataProvider`
Inherits: `OptimusSkinnedMeshWriteDataProvider`

deprecated: âSkinnedMeshWriteDataProviderâ was renamed to âOptimusSkinnedMeshWriteDataProviderâ.

### `unreal.SmartNavLinkComponent`
Inherits: `NavLinkCustomComponent`

deprecated: âSmartNavLinkComponentâ was renamed to âNavLinkCustomComponentâ.

### `unreal.SmartObjectBehaviorConfigBase`
Inherits: `SmartObjectBehaviorDefinition`

deprecated: âSmartObjectBehaviorConfigBaseâ was renamed to âSmartObjectBehaviorDefinitionâ.

### `unreal.SoundMode`
Inherits: `SoundMix`

deprecated: âSoundModeâ was renamed to âSoundMixâ.

### `unreal.SoundModulationWatcher`
Inherits: `AudioModulationDestination`

deprecated: âSoundModulationWatcherâ was renamed to âAudioModulationDestinationâ.

### `unreal.SpotLightMovable`
Inherits: `SpotLight`

deprecated: âSpotLightMovableâ was renamed to âSpotLightâ.

### `unreal.SpotLightStatic`
Inherits: `SpotLight`

deprecated: âSpotLightStaticâ was renamed to âSpotLightâ.

### `unreal.SpotLightStationary`
Inherits: `SpotLight`

deprecated: âSpotLightStationaryâ was renamed to âSpotLightâ.

### `unreal.SpriteComponent`
Inherits: `BillboardComponent`

deprecated: âSpriteComponentâ was renamed to âBillboardComponentâ.

### `unreal.StateTreeBrainComponent`
Inherits: `StateTreeComponent`

deprecated: âStateTreeBrainComponentâ was renamed to âStateTreeComponentâ.

### `unreal.StateTreeItemBlueprintBase`
Inherits: `StateTreeNodeBlueprintBase`

deprecated: âStateTreeItemBlueprintBaseâ was renamed to âStateTreeNodeBlueprintBaseâ.

### `unreal.StaticMeshReplicatedComponent`
Inherits: `StaticMeshComponent`

deprecated: âStaticMeshReplicatedComponentâ was renamed to âStaticMeshComponentâ.

### `unreal.StaticMeshUtilitiesLibrary`
Inherits: `EditorStaticMeshLibrary`

deprecated: âStaticMeshUtilitiesLibraryâ was renamed to âEditorStaticMeshLibraryâ.

### `unreal.StructUtilsFunctionLibrary`
Inherits: `BlueprintInstancedStructLibrary`

deprecated: âStructUtilsFunctionLibraryâ was renamed to âBlueprintInstancedStructLibraryâ.

### `unreal.SubmixEffectReverbFastPreset`
Inherits: `SubmixEffectReverbPreset`

deprecated: âSubmixEffectReverbFastPresetâ was renamed to âSubmixEffectReverbPresetâ.

### `unreal.TagCollectionModifierBase`
Inherits: `ActorModifierCoreBase`

deprecated: âTagCollectionModifierBaseâ was renamed to âActorModifierCoreBaseâ.

### `unreal.TagCollectionModifierComponent`
Inherits: `ActorModifierCoreComponent`

deprecated: âTagCollectionModifierComponentâ was renamed to âActorModifierCoreComponentâ.

### `unreal.TagCollectionModifierSharedActor`
Inherits: `ActorModifierCoreSharedActor`

deprecated: âTagCollectionModifierSharedActorâ was renamed to âActorModifierCoreSharedActorâ.

### `unreal.TagCollectionModifierStack`
Inherits: `ActorModifierCoreStack`

deprecated: âTagCollectionModifierStackâ was renamed to âActorModifierCoreStackâ.

### `unreal.TimeOfDayActor`
Inherits: `DaySequenceActor`

deprecated: âTimeOfDayActorâ was renamed to âDaySequenceActorâ.

### `unreal.TimeOfDaySequence`
Inherits: `DaySequence`

deprecated: âTimeOfDaySequenceâ was renamed to âDaySequenceâ.

### `unreal.TimeOfDaySequenceDirector`
Inherits: `DaySequenceDirector`

deprecated: âTimeOfDaySequenceDirectorâ was renamed to âDaySequenceDirectorâ.

### `unreal.TimeOfDaySequencePlayer`
Inherits: `DaySequencePlayer`

deprecated: âTimeOfDaySequencePlayerâ was renamed to âDaySequencePlayerâ.

### `unreal.TimeOfDaySequenceTrack`
Inherits: `DaySequenceTrack`

deprecated: âTimeOfDaySequenceTrackâ was renamed to âDaySequenceTrackâ.

### `unreal.TransientBufferDataProvider`
Inherits: `OptimusTransientBufferDataProvider`

deprecated: âTransientBufferDataProviderâ was renamed to âOptimusTransientBufferDataProviderâ.

### `unreal.USkeletalMeshReductionSettings`
Inherits: `SkeletalMeshLODSettings`

deprecated: âUSkeletalMeshReductionSettingsâ was renamed to âSkeletalMeshLODSettingsâ.

### `unreal.VimBlueprint`
Inherits: `AnimBlueprint`

deprecated: âVimBlueprintâ was renamed to âAnimBlueprintâ.

### `unreal.VimBlueprintFactory`
Inherits: `AnimBlueprintFactory`

deprecated: âVimBlueprintFactoryâ was renamed to âAnimBlueprintFactoryâ.

### `unreal.VimGeneratedClass`
Inherits: `AnimBlueprintGeneratedClass`

deprecated: âVimGeneratedClassâ was renamed to âAnimBlueprintGeneratedClassâ.

### `unreal.VimInstance`
Inherits: `AnimInstance`

deprecated: âVimInstanceâ was renamed to âAnimInstanceâ.

### `unreal.WaterMeshActor`
Inherits: `WaterZone`

deprecated: âWaterMeshActorâ was renamed to âWaterZoneâ.

### `unreal.WorldInfo`
Inherits: `WorldSettings`

deprecated: âWorldInfoâ was renamed to âWorldSettingsâ.

### `unreal.ZoneGraphBehaviorTest`
Inherits: `ZoneGraphAnnotationTest`

deprecated: âZoneGraphBehaviorTestâ was renamed to âZoneGraphAnnotationTestâ.

### `unreal.ZoneGraphBehaviorTestingActor`
Inherits: `ZoneGraphAnnotationTestingActor`

deprecated: âZoneGraphBehaviorTestingActorâ was renamed to âZoneGraphAnnotationTestingActorâ.

### `unreal.ZoneGraphBehaviorTestingComponent`
Inherits: `ZoneGraphAnnotationTestingComponent`

deprecated: âZoneGraphBehaviorTestingComponentâ was renamed to âZoneGraphAnnotationTestingComponentâ.

### `unreal.ZoneGraphFleeBehavior`
Inherits: `ZoneGraphDisturbanceAnnotation`

deprecated: âZoneGraphFleeBehaviorâ was renamed to âZoneGraphDisturbanceAnnotationâ.

### `unreal.ZoneGraphFleeBehaviorBPLibrary`
Inherits: `ZoneGraphDisturbanceAnnotationBPLibrary`

deprecated: âZoneGraphFleeBehaviorBPLibraryâ was renamed to âZoneGraphDisturbanceAnnotationBPLibraryâ.

### `unreal.AnimNextPlayAnimBlendMode`
Inherits: `EnumBase`

deprecated: âAnimNextPlayAnimBlendModeâ was renamed to âAnimNextInjectionBlendModeâ.

**Properties** (2):
  - `INERTIALIZATION`: `AnimNextPlayAnimBlendMode = Ellipsis` — Uses inertialization. Requires an inertialization trait somewhere earlier in the graph. 1
  - `STANDARD`: `AnimNextPlayAnimBlendMode = Ellipsis` — Uses standard weight based blend 0

### `unreal.AnimPhysAxisType`
Inherits: `EnumBase`

deprecated: âAnimPhysAxisTypeâ was renamed to âAnimPhysLinearConstraintTypeâ.

**Properties** (2):
  - `FREE`: `AnimPhysAxisType = Ellipsis` — 0
  - `LIMITED`: `AnimPhysAxisType = Ellipsis` — 1

### `unreal.AnimPhysConstraintType`
Inherits: `EnumBase`

deprecated: âAnimPhysConstraintTypeâ was renamed to âAnimPhysAngularConstraintTypeâ.

**Properties** (2):
  - `ANGULAR`: `AnimPhysConstraintType = Ellipsis` — 0
  - `CONE`: `AnimPhysConstraintType = Ellipsis` — 1

### `unreal.AttachLocationType`
Inherits: `EnumBase`

deprecated: âAttachLocationTypeâ was renamed to âAttachLocationâ.

**Properties** (4):
  - `KEEP_RELATIVE_OFFSET`: `AttachLocationType = Ellipsis` — Keeps current relative transform as the relative transform to the new parent. 0
  - `KEEP_WORLD_POSITION`: `AttachLocationType = Ellipsis` — Automatically calculates the relative transform such that the attached component maintains the same ...
  - `SNAP_TO_TARGET`: `AttachLocationType = Ellipsis` — Snaps location and rotation to the attach point. Calculates the relative scale so that the final wor...
  - `SNAP_TO_TARGET_INCLUDING_SCALE`: `AttachLocationType = Ellipsis` — Snaps entire transform to target, including scale. 3

### `unreal.AvaAnimationPlayMode`
Inherits: `EnumBase`

deprecated: âAvaAnimationPlayModeâ was renamed to âAvaSequencePlayModeâ.

**Properties** (2):
  - `FORWARD`: `AvaAnimationPlayMode = Ellipsis` — Sequence plays and loops from the beginning to the end. 0
  - `REVERSE`: `AvaAnimationPlayMode = Ellipsis` — Sequence plays and loops from the end to the beginning. 1

### `unreal.AvaAxis`
Inherits: `EnumBase`

deprecated: âAvaAxisâ was renamed to âActorModifierAlignmentâ.

**Properties** (3):
  - `DEPTH`: `AvaAxis = Ellipsis` — 2
  - `HORIZONTAL`: `AvaAxis = Ellipsis` — 0
  - `VERTICAL`: `AvaAxis = Ellipsis` — 1

### `unreal.AvaChannelState`
Inherits: `EnumBase`

deprecated: âAvaChannelStateâ was renamed to âAvaBroadcastChannelStateâ.

**Properties** (3):
  - `IDLE`: `AvaChannelState = Ellipsis` — Indicates that at least some of the channel outputs are idle (but none are live). 1
  - `LIVE`: `AvaChannelState = Ellipsis` — Indicates that at least some of the channel outputs are live. 2
  - `OFFLINE`: `AvaChannelState = Ellipsis` — Indicates that all channel outputs are offline. 0

### `unreal.AvaCloneModifierAxis`
Inherits: `EnumBase`

deprecated: âAvaCloneModifierAxisâ was renamed to âAvaPatternModifierAxisâ.

**Properties** (3):
  - `X`: `AvaCloneModifierAxis = Ellipsis` — 0
  - `Y`: `AvaCloneModifierAxis = Ellipsis` — 1
  - `Z`: `AvaCloneModifierAxis = Ellipsis` — 2

### `unreal.AvaCloneModifierLayout`
Inherits: `EnumBase`

deprecated: âAvaCloneModifierLayoutâ was renamed to âAvaPatternModifierLayoutâ.

**Properties** (3):
  - `CIRCLE`: `AvaCloneModifierLayout = Ellipsis` — 2
  - `GRID`: `AvaCloneModifierLayout = Ellipsis` — 1
  - `LINE`: `AvaCloneModifierLayout = Ellipsis` — 0

### `unreal.AvaCloneModifierPlane`
Inherits: `EnumBase`

deprecated: âAvaCloneModifierPlaneâ was renamed to âAvaPatternModifierPlaneâ.

**Properties** (3):
  - `XY`: `AvaCloneModifierPlane = Ellipsis` — 0
  - `YZ`: `AvaCloneModifierPlane = Ellipsis` — 2
  - `ZX`: `AvaCloneModifierPlane = Ellipsis` — 1

### `unreal.AvaClonerAxis`
Inherits: `EnumBase`

deprecated: âAvaClonerAxisâ was renamed to âCEClonerAxisâ.

**Properties** (4):
  - `CUSTOM`: `AvaClonerAxis = Ellipsis` — 3
  - `X`: `AvaClonerAxis = Ellipsis` — 0
  - `Y`: `AvaClonerAxis = Ellipsis` — 1
  - `Z`: `AvaClonerAxis = Ellipsis` — 2

### `unreal.AvaClonerCompareMode`
Inherits: `EnumBase`

deprecated: âAvaClonerCompareModeâ was renamed to âCEClonerCompareModeâ.

**Properties** (6):
  - `EQUAL`: `AvaClonerCompareMode = Ellipsis` — 2
  - `GREATER`: `AvaClonerCompareMode = Ellipsis` — 0
  - `GREATER_EQUAL`: `AvaClonerCompareMode = Ellipsis` — 1
  - `LESS`: `AvaClonerCompareMode = Ellipsis` — 4
  - `LESS_EQUAL`: `AvaClonerCompareMode = Ellipsis` — 5
  - `NOT_EQUAL`: `AvaClonerCompareMode = Ellipsis` — 3

### `unreal.AvaClonerEasing`
Inherits: `EnumBase`

deprecated: âAvaClonerEasingâ was renamed to âCEClonerEasingâ.

**Properties** (32):
  - `IN_BACK`: `AvaClonerEasing = Ellipsis` — 22
  - `IN_BOUNCE`: `AvaClonerEasing = Ellipsis` — 28
  - `IN_CIRC`: `AvaClonerEasing = Ellipsis` — 19
  - `IN_CUBIC`: `AvaClonerEasing = Ellipsis` — 7
  - `IN_ELASTIC`: `AvaClonerEasing = Ellipsis` — 25
  - `IN_EXPO`: `AvaClonerEasing = Ellipsis` — 16
  - `IN_OUT_BACK`: `AvaClonerEasing = Ellipsis` — 24
  - `IN_OUT_BOUNCE`: `AvaClonerEasing = Ellipsis` — 30
  - `IN_OUT_CIRC`: `AvaClonerEasing = Ellipsis` — 21
  - `IN_OUT_CUBIC`: `AvaClonerEasing = Ellipsis` — 9
  - `IN_OUT_ELASTIC`: `AvaClonerEasing = Ellipsis` — 27
  - `IN_OUT_EXPO`: `AvaClonerEasing = Ellipsis` — 18
  - `IN_OUT_QUAD`: `AvaClonerEasing = Ellipsis` — 6
  - `IN_OUT_QUART`: `AvaClonerEasing = Ellipsis` — 12
  - `IN_OUT_QUINT`: `AvaClonerEasing = Ellipsis` — 15
  - `IN_OUT_SINE`: `AvaClonerEasing = Ellipsis` — 3
  - `IN_QUAD`: `AvaClonerEasing = Ellipsis` — 4
  - `IN_QUART`: `AvaClonerEasing = Ellipsis` — 10
  - `IN_QUINT`: `AvaClonerEasing = Ellipsis` — 13
  - `IN_SINE`: `AvaClonerEasing = Ellipsis` — 1
  - `LINEAR`: `AvaClonerEasing = Ellipsis` — 0
  - `OUT_BACK`: `AvaClonerEasing = Ellipsis` — 23
  - `OUT_BOUNCE`: `AvaClonerEasing = Ellipsis` — 29
  - `OUT_CIRC`: `AvaClonerEasing = Ellipsis` — 20
  - `OUT_CUBIC`: `AvaClonerEasing = Ellipsis` — 8
  - `OUT_ELASTIC`: `AvaClonerEasing = Ellipsis` — 26
  - `OUT_EXPO`: `AvaClonerEasing = Ellipsis` — 17
  - `OUT_QUAD`: `AvaClonerEasing = Ellipsis` — 5
  - `OUT_QUART`: `AvaClonerEasing = Ellipsis` — 11
  - `OUT_QUINT`: `AvaClonerEasing = Ellipsis` — 14
  - `OUT_SINE`: `AvaClonerEasing = Ellipsis` — 2
  - `RANDOM`: `AvaClonerEasing = Ellipsis` — 31

### `unreal.AvaClonerEffectorMode`
Inherits: `EnumBase`

deprecated: âAvaClonerEffectorModeâ was renamed to âCEClonerEffectorModeâ.

**Properties** (7):
  - `CANCEL`: `AvaClonerEffectorMode = Ellipsis` — Cancels/reverses all effects 6
  - `CULL`: `AvaClonerEffectorMode = Ellipsis` — Culls clones based on a zone 5
  - `DEFAULT`: `AvaClonerEffectorMode = Ellipsis` — Control clones offset, rotation, scale manually 0
  - `PROCEDURAL`: `AvaClonerEffectorMode = Ellipsis` — Procedural pattern applied across the field zone 2
  - `PUSH`: `AvaClonerEffectorMode = Ellipsis` — Pushes clones apart based on a strength and direction 3
  - `STEP`: `AvaClonerEffectorMode = Ellipsis` — Accumulate transform on clones based on their index 4
  - `TARGET`: `AvaClonerEffectorMode = Ellipsis` — Rotates clones towards a target actor 1

### `unreal.AvaClonerEffectorType`
Inherits: `EnumBase`

deprecated: âAvaClonerEffectorTypeâ was renamed to âCEClonerEffectorTypeâ.

**Properties** (6):
  - `BOX`: `AvaClonerEffectorType = Ellipsis` — Clones inside the box extent will be affected by the effector 2
  - `PLANE`: `AvaClonerEffectorType = Ellipsis` — Clones between two planes will be affected by the effector 1
  - `RADIAL`: `AvaClonerEffectorType = Ellipsis` — All clones within the angle range will be affected 4
  - `SPHERE`: `AvaClonerEffectorType = Ellipsis` — Clones inside the sphere radius will be affected by the effector 0
  - `TORUS`: `AvaClonerEffectorType = Ellipsis` — All clones inside the torus radius will be affected by the effector 5
  - `UNBOUND`: `AvaClonerEffectorType = Ellipsis` — All clones will be affected by the effector with the same max weight 3

### `unreal.AvaClonerGridConstraint`
Inherits: `EnumBase`

deprecated: âAvaClonerGridConstraintâ was renamed to âCEClonerGridConstraintâ.

**Properties** (4):
  - `CYLINDER`: `AvaClonerGridConstraint = Ellipsis` — 2
  - `NONE`: `AvaClonerGridConstraint = Ellipsis` — 0
  - `SPHERE`: `AvaClonerGridConstraint = Ellipsis` — 1
  - `TEXTURE`: `AvaClonerGridConstraint = Ellipsis` — 3

### `unreal.AvaClonerMeshAsset`
Inherits: `EnumBase`

deprecated: âAvaClonerMeshAssetâ was renamed to âCEClonerMeshAssetâ.

**Properties** (2):
  - `SKELETAL_MESH`: `AvaClonerMeshAsset = Ellipsis` — 1
  - `STATIC_MESH`: `AvaClonerMeshAsset = Ellipsis` — 0

### `unreal.AvaClonerMeshRenderMode`
Inherits: `EnumBase`

deprecated: âAvaClonerMeshRenderModeâ was renamed to âCEClonerMeshRenderModeâ.

**Properties** (3):
  - `BLEND`: `AvaClonerMeshRenderMode = Ellipsis` — Blend based on the total cloner instances and attachment mesh available 2
  - `ITERATE`: `AvaClonerMeshRenderMode = Ellipsis` — Iterate through each attachment mesh available 0
  - `RANDOM`: `AvaClonerMeshRenderMode = Ellipsis` — Pick randomly through each attachment mesh available, update cloner seed for variations 1

### `unreal.AvaClonerMeshSampleData`
Inherits: `EnumBase`

deprecated: âAvaClonerMeshSampleDataâ was renamed to âCEClonerMeshSampleDataâ.

**Properties** (5):
  - `BONES`: `AvaClonerMeshSampleData = Ellipsis` — 3
  - `SECTIONS`: `AvaClonerMeshSampleData = Ellipsis` — 4
  - `SOCKETS`: `AvaClonerMeshSampleData = Ellipsis` — 2
  - `TRIANGLES`: `AvaClonerMeshSampleData = Ellipsis` — 1
  - `VERTICES`: `AvaClonerMeshSampleData = Ellipsis` — 0

### `unreal.AvaClonerPlane`
Inherits: `EnumBase`

deprecated: âAvaClonerPlaneâ was renamed to âCEClonerPlaneâ.

**Properties** (4):
  - `CUSTOM`: `AvaClonerPlane = Ellipsis` — 3
  - `XY`: `AvaClonerPlane = Ellipsis` — 0
  - `XZ`: `AvaClonerPlane = Ellipsis` — 2
  - `YZ`: `AvaClonerPlane = Ellipsis` — 1

### `unreal.AvaClonerSpawnBehaviorMode`
Inherits: `EnumBase`

deprecated: âAvaClonerSpawnBehaviorModeâ was renamed to âCEClonerSpawnBehaviorModeâ.

**Properties** (2):
  - `INSTANT`: `AvaClonerSpawnBehaviorMode = Ellipsis` — Spawns instantly the number of clones needed for the layout at a specific interval 0
  - `RATE`: `AvaClonerSpawnBehaviorMode = Ellipsis` — Spawns clones at a specific rate per second and fills the layout 1

### `unreal.AvaClonerSpawnLoopMode`
Inherits: `EnumBase`

deprecated: âAvaClonerSpawnLoopModeâ was renamed to âCEClonerSpawnLoopModeâ.

**Properties** (3):
  - `INFINITE`: `AvaClonerSpawnLoopMode = Ellipsis` — Cloner spawns infinitely and never enters idle mode 2
  - `MULTIPLE`: `AvaClonerSpawnLoopMode = Ellipsis` — Cloner spawns multiple times and then enters idle mode 1
  - `ONCE`: `AvaClonerSpawnLoopMode = Ellipsis` — Cloner spawns once and then enters idle mode 0

### `unreal.AvaClonerTextureSampleChannel`
Inherits: `EnumBase`

deprecated: âAvaClonerTextureSampleChannelâ was renamed to âCEClonerTextureSampleChannelâ.

**Properties** (7):
  - `A`: `AvaClonerTextureSampleChannel = Ellipsis` — 6
  - `B`: `AvaClonerTextureSampleChannel = Ellipsis` — 5
  - `G`: `AvaClonerTextureSampleChannel = Ellipsis` — 4
  - `R`: `AvaClonerTextureSampleChannel = Ellipsis` — 3
  - `RGB_AVERAGE`: `AvaClonerTextureSampleChannel = Ellipsis` — 1
  - `RGB_LUMINANCE`: `AvaClonerTextureSampleChannel = Ellipsis` — 0
  - `RGB_MAX`: `AvaClonerTextureSampleChannel = Ellipsis` — 2

### `unreal.AvaCorner2D`
Inherits: `EnumBase`

deprecated: âAvaCorner2Dâ was renamed to âActorModifierGridArrangeCorner2Dâ.

**Properties** (4):
  - `BOTTOM_LEFT`: `AvaCorner2D = Ellipsis` — 2
  - `BOTTOM_RIGHT`: `AvaCorner2D = Ellipsis` — 3
  - `TOP_LEFT`: `AvaCorner2D = Ellipsis` — 0
  - `TOP_RIGHT`: `AvaCorner2D = Ellipsis` — 1

### `unreal.AvaGridArrangeDirection`
Inherits: `EnumBase`

deprecated: âAvaGridArrangeDirectionâ was renamed to âActorModifierGridArrangeDirectionâ.

**Properties** (2):
  - `HORIZONTAL`: `AvaGridArrangeDirection = Ellipsis` — 0
  - `VERTICAL`: `AvaGridArrangeDirection = Ellipsis` — 1

### `unreal.AvaJustifyDepth`
Inherits: `EnumBase`

deprecated: âAvaJustifyDepthâ was renamed to âActorModifierJustifyDepthâ.

**Properties** (4):
  - `BACK`: `AvaJustifyDepth = Ellipsis` — 3
  - `CENTER`: `AvaJustifyDepth = Ellipsis` — 2
  - `FRONT`: `AvaJustifyDepth = Ellipsis` — 1
  - `NONE`: `AvaJustifyDepth = Ellipsis` — 0

### `unreal.AvaJustifyHorizontal`
Inherits: `EnumBase`

deprecated: âAvaJustifyHorizontalâ was renamed to âActorModifierJustifyHorizontalâ.

**Properties** (4):
  - `CENTER`: `AvaJustifyHorizontal = Ellipsis` — 2
  - `LEFT`: `AvaJustifyHorizontal = Ellipsis` — 1
  - `NONE`: `AvaJustifyHorizontal = Ellipsis` — 0
  - `RIGHT`: `AvaJustifyHorizontal = Ellipsis` — 3

### `unreal.AvaJustifyVertical`
Inherits: `EnumBase`

deprecated: âAvaJustifyVerticalâ was renamed to âActorModifierJustifyVerticalâ.

**Properties** (4):
  - `BOTTOM`: `AvaJustifyVertical = Ellipsis` — 3
  - `CENTER`: `AvaJustifyVertical = Ellipsis` — 2
  - `NONE`: `AvaJustifyVertical = Ellipsis` — 0
  - `TOP`: `AvaJustifyVertical = Ellipsis` — 1

### `unreal.AvaModifiersAxis`
Inherits: `EnumBase`

deprecated: âAvaModifiersAxisâ was renamed to âActorModifierAxisâ.

**Properties** (3):
  - `X`: `AvaModifiersAxis = Ellipsis` — 1
  - `Y`: `AvaModifiersAxis = Ellipsis` — 2
  - `Z`: `AvaModifiersAxis = Ellipsis` — 4

### `unreal.AvaPageListType`
Inherits: `EnumBase`

deprecated: âAvaPageListTypeâ was renamed to âAvaRundownPageListTypeâ.

**Properties** (3):
  - `INSTANCE`: `AvaPageListType = Ellipsis` — 1
  - `TEMPLATE`: `AvaPageListType = Ellipsis` — 0
  - `VIEW`: `AvaPageListType = Ellipsis` — 2

### `unreal.AvaPlayType`
Inherits: `EnumBase`

deprecated: âAvaPlayTypeâ was renamed to âAvaRundownPagePlayTypeâ.

**Properties** (3):
  - `PLAY_FROM_START`: `AvaPlayType = Ellipsis` — 0
  - `PREVIEW_FROM_FRAME`: `AvaPlayType = Ellipsis` — 2
  - `PREVIEW_FROM_START`: `AvaPlayType = Ellipsis` — 1

### `unreal.AvaRadialArrangement`
Inherits: `EnumBase`

deprecated: âAvaRadialArrangementâ was renamed to âActorModifierRadialArrangeModeâ.

**Properties** (2):
  - `EQUAL`: `AvaRadialArrangement = Ellipsis` — All elements in all radial rings have the same spacing between them.
The number of elements in the i...
  - `MONOSPACE`: `AvaRadialArrangement = Ellipsis` — Each radial ring will contain the same number of elements.
The space between elements in the outer r...

### `unreal.AvaRadialArrangePlane`
Inherits: `EnumBase`

deprecated: âAvaRadialArrangePlaneâ was renamed to âActorModifierRadialArrangePlaneâ.

**Properties** (3):
  - `XY`: `AvaRadialArrangePlane = Ellipsis` — 0
  - `XZ`: `AvaRadialArrangePlane = Ellipsis` — 2
  - `YZ`: `AvaRadialArrangePlane = Ellipsis` — 1

### `unreal.AvaReferenceContainer`
Inherits: `EnumBase`

deprecated: âAvaReferenceContainerâ was renamed to âActorModifierReferenceContainerâ.

**Properties** (5):
  - `FIRST`: `AvaReferenceContainer = Ellipsis` — Uses the first actor in the parentâs hierarchy. 2
  - `LAST`: `AvaReferenceContainer = Ellipsis` — Uses the last actor in the parentâs hierarchy. 3
  - `NEXT`: `AvaReferenceContainer = Ellipsis` — Uses the next actor in the parentâs hierarchy. 1
  - `OTHER`: `AvaReferenceContainer = Ellipsis` — Uses a specified reference actor set by the user. 4
  - `PREVIOUS`: `AvaReferenceContainer = Ellipsis` — Uses the previous actor in the parentâs hierarchy. 0

### `unreal.AvaToolboxCornerType`
Inherits: `EnumBase`

deprecated: âAvaToolboxCornerTypeâ was renamed to âAvaShapeCornerTypeâ.

**Properties** (3):
  - `CURVE_IN`: `AvaToolboxCornerType = Ellipsis` — 1
  - `CURVE_OUT`: `AvaToolboxCornerType = Ellipsis` — 2
  - `POINT`: `AvaToolboxCornerType = Ellipsis` — 0

### `unreal.AvaToolboxUVMode`
Inherits: `EnumBase`

deprecated: âAvaToolboxUVModeâ was renamed to âAvaShapeUVModeâ.

**Properties** (2):
  - `STRETCH`: `AvaToolboxUVMode = Ellipsis` — 0
  - `UNIFORM`: `AvaToolboxUVMode = Ellipsis` — uvs are stretched and fill the shape size 1

### `unreal.BoneGetterSetterMode`
Inherits: `EnumBase`

deprecated: âBoneGetterSetterModeâ was renamed to âRigVMTransformSpaceâ.

**Properties** (2):
  - `GLOBAL_SPACE`: `BoneGetterSetterMode = Ellipsis` — Apply in rig space 1
  - `LOCAL_SPACE`: `BoneGetterSetterMode = Ellipsis` — Apply in parent space 0

### `unreal.CameraAnimPlaySpace`
Inherits: `EnumBase`

deprecated: âCameraAnimPlaySpaceâ was renamed to âCameraShakePlaySpaceâ.

**Properties** (3):
  - `CAMERA_LOCAL`: `CameraAnimPlaySpace = Ellipsis` — This anim is applied in camera space. 0
  - `USER_DEFINED`: `CameraAnimPlaySpace = Ellipsis` — This anim is applied in a user-specified space (defined by UserPlaySpaceMatrix). 2
  - `WORLD`: `CameraAnimPlaySpace = Ellipsis` — This anim is applied in world space. 1

### `unreal.ControlRigAnimEasingType`
Inherits: `EnumBase`

deprecated: âControlRigAnimEasingTypeâ was renamed to âRigVMAnimEasingTypeâ.

**Properties** (31):
  - `BACK_EASE_IN`: `ControlRigAnimEasingType = Ellipsis` — 25
  - `BACK_EASE_IN_OUT`: `ControlRigAnimEasingType = Ellipsis` — 27
  - `BACK_EASE_OUT`: `ControlRigAnimEasingType = Ellipsis` — 26
  - `BOUNCE_EASE_IN`: `ControlRigAnimEasingType = Ellipsis` — 28
  - `BOUNCE_EASE_IN_OUT`: `ControlRigAnimEasingType = Ellipsis` — 30
  - `BOUNCE_EASE_OUT`: `ControlRigAnimEasingType = Ellipsis` — 29
  - `CIRCULAR_EASE_IN`: `ControlRigAnimEasingType = Ellipsis` — 16
  - `CIRCULAR_EASE_IN_OUT`: `ControlRigAnimEasingType = Ellipsis` — 18
  - `CIRCULAR_EASE_OUT`: `ControlRigAnimEasingType = Ellipsis` — 17
  - `CUBIC_EASE_IN`: `ControlRigAnimEasingType = Ellipsis` — 4
  - `CUBIC_EASE_IN_OUT`: `ControlRigAnimEasingType = Ellipsis` — 6
  - `CUBIC_EASE_OUT`: `ControlRigAnimEasingType = Ellipsis` — 5
  - `ELASTIC_EASE_IN`: `ControlRigAnimEasingType = Ellipsis` — 22
  - `ELASTIC_EASE_IN_OUT`: `ControlRigAnimEasingType = Ellipsis` — 24
  - `ELASTIC_EASE_OUT`: `ControlRigAnimEasingType = Ellipsis` — 23
  - `EXPONENTIAL_EASE_IN`: `ControlRigAnimEasingType = Ellipsis` — 19
  - `EXPONENTIAL_EASE_IN_OUT`: `ControlRigAnimEasingType = Ellipsis` — 21
  - `EXPONENTIAL_EASE_OUT`: `ControlRigAnimEasingType = Ellipsis` — 20
  - `LINEAR`: `ControlRigAnimEasingType = Ellipsis` — 0
  - `QUADRATIC_EASE_IN`: `ControlRigAnimEasingType = Ellipsis` — 1
  - `QUADRATIC_EASE_IN_OUT`: `ControlRigAnimEasingType = Ellipsis` — 3
  - `QUADRATIC_EASE_OUT`: `ControlRigAnimEasingType = Ellipsis` — 2
  - `QUARTIC_EASE_IN`: `ControlRigAnimEasingType = Ellipsis` — 7
  - `QUARTIC_EASE_IN_OUT`: `ControlRigAnimEasingType = Ellipsis` — 9
  - `QUARTIC_EASE_OUT`: `ControlRigAnimEasingType = Ellipsis` — 8
  - `QUINTIC_EASE_IN`: `ControlRigAnimEasingType = Ellipsis` — 10
  - `QUINTIC_EASE_IN_OUT`: `ControlRigAnimEasingType = Ellipsis` — 12
  - `QUINTIC_EASE_OUT`: `ControlRigAnimEasingType = Ellipsis` — 11
  - `SINE_EASE_IN`: `ControlRigAnimEasingType = Ellipsis` — 13
  - `SINE_EASE_IN_OUT`: `ControlRigAnimEasingType = Ellipsis` — 15
  - `SINE_EASE_OUT`: `ControlRigAnimEasingType = Ellipsis` — 14

### `unreal.ControlRigClampSpatialMode`
Inherits: `EnumBase`

deprecated: âControlRigClampSpatialModeâ was renamed to âRigVMClampSpatialModeâ.

**Properties** (4):
  - `CAPSULE`: `ControlRigClampSpatialMode = Ellipsis` — 3
  - `CYLINDER`: `ControlRigClampSpatialMode = Ellipsis` — 1
  - `PLANE`: `ControlRigClampSpatialMode = Ellipsis` — 0
  - `SPHERE`: `ControlRigClampSpatialMode = Ellipsis` — 2

### `unreal.ControlRigRotationOrder`
Inherits: `EnumBase`

deprecated: âControlRigRotationOrderâ was renamed to âEulerRotationOrderâ.

**Properties** (6):
  - `XYZ`: `ControlRigRotationOrder = Ellipsis` — 0
  - `XZY`: `ControlRigRotationOrder = Ellipsis` — 1
  - `YXZ`: `ControlRigRotationOrder = Ellipsis` — 2
  - `YZX`: `ControlRigRotationOrder = Ellipsis` — 3
  - `ZXY`: `ControlRigRotationOrder = Ellipsis` — 4
  - `ZYX`: `ControlRigRotationOrder = Ellipsis` — 5

### `unreal.ControlRigTestDataPlaybackMode`
Inherits: `EnumBase`

deprecated: âControlRigTestDataPlaybackModeâ was renamed to âControlRigReplayPlaybackModeâ.

**Properties** (3):
  - `GROUND_TRUTH`: `ControlRigTestDataPlaybackMode = Ellipsis` — 2
  - `LIVE`: `ControlRigTestDataPlaybackMode = Ellipsis` — 0
  - `REPLAY_INPUTS`: `ControlRigTestDataPlaybackMode = Ellipsis` — 1

### `unreal.CRSimPointIntegrateType`
Inherits: `EnumBase`

deprecated: âCRSimPointIntegrateTypeâ was renamed to âRigVMSimPointIntegrateTypeâ.

**Properties** (2):
  - `SEMI_EXPLICIT_EULER`: `CRSimPointIntegrateType = Ellipsis` — 1
  - `VERLET`: `CRSimPointIntegrateType = Ellipsis` — 0

### `unreal.DaySequenceModifierBlendMode`
Inherits: `EnumBase`

deprecated: âDaySequenceModifierBlendModeâ was renamed to âDaySequenceModifierModeâ.

**Properties** (3):
  - `GLOBAL`: `DaySequenceModifierBlendMode = Ellipsis` — Blend weight is always 1.0. 0
  - `TIME`: `DaySequenceModifierBlendMode = Ellipsis` — Blend weight smoothly moves between 0.0 and 1.0 at a fixed rate according to when the blend target l...
  - `VOLUME`: `DaySequenceModifierBlendMode = Ellipsis` — Blend weight smoothly moves between 0.0 and 1.0 according to how far the blend target is from the vo...

### `unreal.DMXCommunicationTypes`
Inherits: `EnumBase`

deprecated: âDMXCommunicationTypesâ was renamed to âDMXCommunicationTypeâ.

**Properties** (4):
  - `BROADCAST`: `DMXCommunicationTypes = Ellipsis` — 0
  - `INTERNAL_ONLY`: `DMXCommunicationTypes = Ellipsis` — 3
  - `MULTICAST`: `DMXCommunicationTypes = Ellipsis` — 2
  - `UNICAST`: `DMXCommunicationTypes = Ellipsis` — 1

### `unreal.FSoundModulationLFOShape`
Inherits: `EnumBase`

deprecated: âFSoundModulationLFOShapeâ was renamed to âSoundModulationLFOShapeâ.

**Properties** (7):
  - `DOWN_SAW`: `FSoundModulationLFOShape = Ellipsis` — 2
  - `EXPONENTIAL`: `FSoundModulationLFOShape = Ellipsis` — 5
  - `RANDOM_SAMPLE_HOLD`: `FSoundModulationLFOShape = Ellipsis` — 6
  - `SINE`: `FSoundModulationLFOShape = Ellipsis` — 0
  - `SQUARE`: `FSoundModulationLFOShape = Ellipsis` — 3
  - `TRIANGLE`: `FSoundModulationLFOShape = Ellipsis` — 4
  - `UP_SAW`: `FSoundModulationLFOShape = Ellipsis` — 1

### `unreal.LockedAxis`
Inherits: `EnumBase`

deprecated: âLockedAxisâ was renamed to âDOFModeâ.

**Properties** (7):
  - `CUSTOM_PLANE`: `LockedAxis = Ellipsis` — Allows 2D movement along the plane of a given normal 5
  - `DEFAULT`: `LockedAxis = Ellipsis` — Inherits the degrees of freedom from the project settings. 0
  - `NONE`: `LockedAxis = Ellipsis` — No constraints. 6
  - `SIX_DOF`: `LockedAxis = Ellipsis` — Specifies which axis to freeze rotation and movement along. 1
  - `XY_PLANE`: `LockedAxis = Ellipsis` — Allows 2D movement along the X-Y plane. 4
  - `XZ_PLANE`: `LockedAxis = Ellipsis` — Allows 2D movement along the X-Z plane. 3
  - `YZ_PLANE`: `LockedAxis = Ellipsis` — Allows 2D movement along the Y-Z plane. 2

### `unreal.LuminanceMode`
Inherits: `EnumBase`

deprecated: âLuminanceModeâ was renamed to âMaterialXLuminanceModeâ.

**Properties** (5):
  - `ACE_SCG`: `LuminanceMode = Ellipsis` — 0
  - `CUSTOM`: `LuminanceMode = Ellipsis` — 3
  - `REC2020`: `LuminanceMode = Ellipsis` — 2
  - `REC2100`: `LuminanceMode = Ellipsis` — 2
  - `REC709`: `LuminanceMode = Ellipsis` — 1

### `unreal.MaterialLightingModel`
Inherits: `EnumBase`

deprecated: âMaterialLightingModelâ was renamed to âMaterialShadingModelâ.

**Properties** (13):
  - `MSM_CLEAR_COAT`: `MaterialLightingModel = Ellipsis` — 4
  - `MSM_CLOTH`: `MaterialLightingModel = Ellipsis` — 8
  - `MSM_DEFAULT_LIT`: `MaterialLightingModel = Ellipsis` — 1
  - `MSM_EYE`: `MaterialLightingModel = Ellipsis` — 9
  - `MSM_FROM_MATERIAL_EXPRESSION`: `MaterialLightingModel = Ellipsis` — Shading model will be determined by the Material Expression Graph,
by utilizing the âShading Model...
  - `MSM_HAIR`: `MaterialLightingModel = Ellipsis` — 7
  - `MSM_PREINTEGRATED_SKIN`: `MaterialLightingModel = Ellipsis` — 3
  - `MSM_SINGLE_LAYER_WATER`: `MaterialLightingModel = Ellipsis` — 10
  - `MSM_SUBSURFACE`: `MaterialLightingModel = Ellipsis` — 2
  - `MSM_SUBSURFACE_PROFILE`: `MaterialLightingModel = Ellipsis` — 5
  - `MSM_THIN_TRANSLUCENT`: `MaterialLightingModel = Ellipsis` — 11
  - `MSM_TWO_SIDED_FOLIAGE`: `MaterialLightingModel = Ellipsis` — 6
  - `MSM_UNLIT`: `MaterialLightingModel = Ellipsis` — 0

### `unreal.MediaIOSDITransportType`
Inherits: `EnumBase`

deprecated: âMediaIOSDITransportTypeâ was renamed to âMediaIOTransportTypeâ.

**Properties** (4):
  - `DUAL_LINK`: `MediaIOSDITransportType = Ellipsis` — 1
  - `HDMI`: `MediaIOSDITransportType = Ellipsis` — 3
  - `QUAD_LINK`: `MediaIOSDITransportType = Ellipsis` — 2
  - `SINGLE_LINK`: `MediaIOSDITransportType = Ellipsis` — 0

### `unreal.MeshComponentUpdateFlag`
Inherits: `EnumBase`

deprecated: âMeshComponentUpdateFlagâ was renamed to âVisibilityBasedAnimTickOptionâ.

**Properties** (5):
  - `ALWAYS_TICK_POSE`: `MeshComponentUpdateFlag = Ellipsis` — Always Tick, but Refresh BoneTransforms only when rendered. 1
  - `ALWAYS_TICK_POSE_AND_REFRESH_BONES`: `MeshComponentUpdateFlag = Ellipsis` — Always Tick and Refresh BoneTransforms whether rendered or not. 0
  - `ONLY_TICK_MONTAGES_AND_REFRESH_BONES_WHEN_PLAYING_MONTAGES`: `MeshComponentUpdateFlag = Ellipsis` — When rendered Tick Pose and Refresh Bone Transforms,
otherwise, just update montages alongside BoneT...
  - `ONLY_TICK_MONTAGES_WHEN_NOT_RENDERED`: `MeshComponentUpdateFlag = Ellipsis` — When rendered Tick Pose and Refresh Bone Transforms,
otherwise, just update montages and skip everyt...
  - `ONLY_TICK_POSE_WHEN_RENDERED`: `MeshComponentUpdateFlag = Ellipsis` — Tick only when rendered, and it will only RefreshBoneTransforms when rendered. 4

### `unreal.ModifyFrequency`
Inherits: `EnumBase`

deprecated: âModifyFrequencyâ was renamed to âComponentMobilityâ.

**Properties** (3):
  - `MOVABLE`: `ModifyFrequency = Ellipsis` — Movable objects can be moved and changed in game.
- Totally dynamic
- Can cast dynamic shadows
- Slo...
  - `STATIC`: `ModifyFrequency = Ellipsis` — Static objects cannot be moved or changed in game.
- Allows baked lighting
- Fastest rendering 0
  - `STATIONARY`: `ModifyFrequency = Ellipsis` — A stationary light will only have its shadowing and bounced lighting from static geometry baked by L...

### `unreal.ParametricMaterialStyle`
Inherits: `EnumBase`

deprecated: âParametricMaterialStyleâ was renamed to âAvaShapeParametricMaterialStyleâ.

**Properties** (3):
  - `LINEAR_GRADIENT`: `ParametricMaterialStyle = Ellipsis` — 1
  - `SOLID`: `ParametricMaterialStyle = Ellipsis` — 0
  - `TEXTURE`: `ParametricMaterialStyle = Ellipsis` — 2

### `unreal.PCGDensityNoiseMode`
Inherits: `EnumBase`

deprecated: âPCGDensityNoiseModeâ was renamed to âPCGAttributeNoiseModeâ.

**Properties** (5):
  - `ADD`: `PCGDensityNoiseMode = Ellipsis` — 3
  - `MAXIMUM`: `PCGDensityNoiseMode = Ellipsis` — 2
  - `MINIMUM`: `PCGDensityNoiseMode = Ellipsis` — 1
  - `MULTIPLY`: `PCGDensityNoiseMode = Ellipsis` — 4
  - `SET`: `PCGDensityNoiseMode = Ellipsis` — 0

### `unreal.PCGMedadataBitwiseOperation`
Inherits: `EnumBase`

deprecated: âPCGMedadataBitwiseOperationâ was renamed to âPCGMetadataBitwiseOperationâ.

**Properties** (4):
  - `AND`: `PCGMedadataBitwiseOperation = Ellipsis` — 0
  - `NOT`: `PCGMedadataBitwiseOperation = Ellipsis` — 1
  - `OR`: `PCGMedadataBitwiseOperation = Ellipsis` — 2
  - `XOR`: `PCGMedadataBitwiseOperation = Ellipsis` — 3

### `unreal.PCGMedadataBooleanOperation`
Inherits: `EnumBase`

deprecated: âPCGMedadataBooleanOperationâ was renamed to âPCGMetadataBooleanOperationâ.

**Properties** (4):
  - `AND`: `PCGMedadataBooleanOperation = Ellipsis` — 0
  - `NOT`: `PCGMedadataBooleanOperation = Ellipsis` — 1
  - `OR`: `PCGMedadataBooleanOperation = Ellipsis` — 2
  - `XOR`: `PCGMedadataBooleanOperation = Ellipsis` — 3

### `unreal.PCGMedadataCompareOperation`
Inherits: `EnumBase`

deprecated: âPCGMedadataCompareOperationâ was renamed to âPCGMetadataCompareOperationâ.

**Properties** (6):
  - `EQUAL`: `PCGMedadataCompareOperation = Ellipsis` — 0
  - `GREATER`: `PCGMedadataCompareOperation = Ellipsis` — 2
  - `GREATER_OR_EQUAL`: `PCGMedadataCompareOperation = Ellipsis` — 3
  - `LESS`: `PCGMedadataCompareOperation = Ellipsis` — 4
  - `LESS_OR_EQUAL`: `PCGMedadataCompareOperation = Ellipsis` — 5
  - `NOT_EQUAL`: `PCGMedadataCompareOperation = Ellipsis` — 1

### `unreal.PCGMedadataMathsOperation`
Inherits: `EnumBase`

deprecated: âPCGMedadataMathsOperationâ was renamed to âPCGMetadataMathsOperationâ.

**Properties** (24):
  - `ABS`: `PCGMedadataMathsOperation = Ellipsis` — 1030
  - `ADD`: `PCGMedadataMathsOperation = Ellipsis` — 2049
  - `CEIL`: `PCGMedadataMathsOperation = Ellipsis` — 1032
  - `CLAMP`: `PCGMedadataMathsOperation = Ellipsis` — 4097
  - `DEC`: `PCGMedadataMathsOperation = Ellipsis` — X - 1 operation 1035
  - `DIVIDE`: `PCGMedadataMathsOperation = Ellipsis` — 2052
  - `FLOOR`: `PCGMedadataMathsOperation = Ellipsis` — 1031
  - `FRAC`: `PCGMedadataMathsOperation = Ellipsis` — 1026
  - `INC`: `PCGMedadataMathsOperation = Ellipsis` — X + 1 operation 1034
  - `LERP`: `PCGMedadataMathsOperation = Ellipsis` — 4098
  - `MAX`: `PCGMedadataMathsOperation = Ellipsis` — 2053
  - `MIN`: `PCGMedadataMathsOperation = Ellipsis` — 2054
  - `MODULO`: `PCGMedadataMathsOperation = Ellipsis` — 2058
  - `MULTIPLY`: `PCGMedadataMathsOperation = Ellipsis` — 2051
  - `MUL_ADD`: `PCGMedadataMathsOperation = Ellipsis` — Multiply Add (A + B * C) 4099
  - `NEGATE`: `PCGMedadataMathsOperation = Ellipsis` — -X operation 1036
  - `ONE_MINUS`: `PCGMedadataMathsOperation = Ellipsis` — 1 - X operation 1033
  - `POW`: `PCGMedadataMathsOperation = Ellipsis` — 2055
  - `ROUND`: `PCGMedadataMathsOperation = Ellipsis` — 1028
  - `SET`: `PCGMedadataMathsOperation = Ellipsis` — 2059
  - `SIGN`: `PCGMedadataMathsOperation = Ellipsis` — 1025
  - `SQRT`: `PCGMedadataMathsOperation = Ellipsis` — 1029
  - `SUBTRACT`: `PCGMedadataMathsOperation = Ellipsis` — 2050
  - `TRUNCATE`: `PCGMedadataMathsOperation = Ellipsis` — 1027

### `unreal.PCGMedadataRotatorOperation`
Inherits: `EnumBase`

deprecated: âPCGMedadataRotatorOperationâ was renamed to âPCGMetadataRotatorOperationâ.

**Properties** (6):
  - `COMBINE`: `PCGMedadataRotatorOperation = Ellipsis` — 1
  - `INVERSE_TRANSFORM_ROTATION`: `PCGMedadataRotatorOperation = Ellipsis` — 102
  - `INVERT`: `PCGMedadataRotatorOperation = Ellipsis` — 2
  - `LERP`: `PCGMedadataRotatorOperation = Ellipsis` — 3
  - `NORMALIZE`: `PCGMedadataRotatorOperation = Ellipsis` — 4
  - `TRANSFORM_ROTATION`: `PCGMedadataRotatorOperation = Ellipsis` — 101

### `unreal.PCGMedadataTransformOperation`
Inherits: `EnumBase`

deprecated: âPCGMedadataTransformOperationâ was renamed to âPCGMetadataTransformOperationâ.

**Properties** (3):
  - `COMPOSE`: `PCGMedadataTransformOperation = Ellipsis` — 0
  - `INVERT`: `PCGMedadataTransformOperation = Ellipsis` — 1
  - `LERP`: `PCGMedadataTransformOperation = Ellipsis` — 2

### `unreal.PCGMedadataTrigOperation`
Inherits: `EnumBase`

deprecated: âPCGMedadataTrigOperationâ was renamed to âPCGMetadataTrigOperationâ.

**Properties** (9):
  - `ACOS`: `PCGMedadataTrigOperation = Ellipsis` — 0
  - `ASIN`: `PCGMedadataTrigOperation = Ellipsis` — 1
  - `ATAN`: `PCGMedadataTrigOperation = Ellipsis` — 2
  - `ATAN2`: `PCGMedadataTrigOperation = Ellipsis` — 3
  - `COS`: `PCGMedadataTrigOperation = Ellipsis` — 4
  - `DEG_TO_RAD`: `PCGMedadataTrigOperation = Ellipsis` — 7
  - `RAD_TO_DEG`: `PCGMedadataTrigOperation = Ellipsis` — 8
  - `SIN`: `PCGMedadataTrigOperation = Ellipsis` — 5
  - `TAN`: `PCGMedadataTrigOperation = Ellipsis` — 6

### `unreal.PCGMedadataVectorOperation`
Inherits: `EnumBase`

deprecated: âPCGMedadataVectorOperationâ was renamed to âPCGMetadataVectorOperationâ.

**Properties** (10):
  - `CROSS`: `PCGMedadataVectorOperation = Ellipsis` — 1
  - `DISTANCE`: `PCGMedadataVectorOperation = Ellipsis` — 3
  - `DOT`: `PCGMedadataVectorOperation = Ellipsis` — 2
  - `INVERSE_TRANSFORM_DIRECTION`: `PCGMedadataVectorOperation = Ellipsis` — 103
  - `INVERSE_TRANSFORM_LOCATION`: `PCGMedadataVectorOperation = Ellipsis` — 104
  - `LENGTH`: `PCGMedadataVectorOperation = Ellipsis` — 5
  - `NORMALIZE`: `PCGMedadataVectorOperation = Ellipsis` — 4
  - `ROTATE_AROUND_AXIS`: `PCGMedadataVectorOperation = Ellipsis` — 6
  - `TRANSFORM_DIRECTION`: `PCGMedadataVectorOperation = Ellipsis` — 101
  - `TRANSFORM_LOCATION`: `PCGMedadataVectorOperation = Ellipsis` — 102

### `unreal.PCGPointFilterOperator`
Inherits: `EnumBase`

deprecated: âPCGPointFilterOperatorâ was renamed to âPCGAttributeFilterOperatorâ.

**Properties** (8):
  - `EQUAL`: `PCGPointFilterOperator = Ellipsis` — 4
  - `GREATER`: `PCGPointFilterOperator = Ellipsis` — 0
  - `GREATER_OR_EQUAL`: `PCGPointFilterOperator = Ellipsis` — 1
  - `LESSER`: `PCGPointFilterOperator = Ellipsis` — 2
  - `LESSER_OR_EQUAL`: `PCGPointFilterOperator = Ellipsis` — 3
  - `MATCHES`: `PCGPointFilterOperator = Ellipsis` — 8
  - `NOT_EQUAL`: `PCGPointFilterOperator = Ellipsis` — 5
  - `SUBSTRING`: `PCGPointFilterOperator = Ellipsis` — 7

### `unreal.PropertyAnimatorCoreMachineClockMode`
Inherits: `EnumBase`

deprecated: âPropertyAnimatorCoreMachineClockModeâ was renamed to âPropertyAnimatorCoreSystemModeâ.

**Properties** (3):
  - `COUNTDOWN`: `PropertyAnimatorCoreMachineClockMode = Ellipsis` — Specified duration elapsing until it reaches 0 1
  - `LOCAL_TIME`: `PropertyAnimatorCoreMachineClockMode = Ellipsis` — Local time of the machine 0
  - `STOPWATCH`: `PropertyAnimatorCoreMachineClockMode = Ellipsis` — Current time elapsed since the time source is active 2

### `unreal.PropertyControllerEasingFunction`
Inherits: `EnumBase`

deprecated: âPropertyControllerEasingFunctionâ was renamed to âPropertyAnimatorEasingFunctionâ.

**Properties** (11):
  - `BACK`: `PropertyControllerEasingFunction = Ellipsis` — 8
  - `BOUNCE`: `PropertyControllerEasingFunction = Ellipsis` — 10
  - `CIRC`: `PropertyControllerEasingFunction = Ellipsis` — 7
  - `CUBIC`: `PropertyControllerEasingFunction = Ellipsis` — 3
  - `ELASTIC`: `PropertyControllerEasingFunction = Ellipsis` — 9
  - `EXPO`: `PropertyControllerEasingFunction = Ellipsis` — 6
  - `LINEAR`: `PropertyControllerEasingFunction = Ellipsis` — 0
  - `QUAD`: `PropertyControllerEasingFunction = Ellipsis` — 2
  - `QUART`: `PropertyControllerEasingFunction = Ellipsis` — 4
  - `QUINT`: `PropertyControllerEasingFunction = Ellipsis` — 5
  - `SINE`: `PropertyControllerEasingFunction = Ellipsis` — 1

### `unreal.PropertyControllerEasingType`
Inherits: `EnumBase`

deprecated: âPropertyControllerEasingTypeâ was renamed to âPropertyAnimatorEasingTypeâ.

**Properties** (3):
  - `IN`: `PropertyControllerEasingType = Ellipsis` — 0
  - `IN_OUT`: `PropertyControllerEasingType = Ellipsis` — 2
  - `OUT`: `PropertyControllerEasingType = Ellipsis` — 1

### `unreal.PropertyControllerWaveFunction`
Inherits: `EnumBase`

deprecated: âPropertyControllerWaveFunctionâ was renamed to âPropertyAnimatorWaveFunctionâ.

**Properties** (9):
  - `BOUNCE`: `PropertyControllerWaveFunction = Ellipsis` — 6
  - `COSINE`: `PropertyControllerWaveFunction = Ellipsis` — 1
  - `INVERTED_SQUARE`: `PropertyControllerWaveFunction = Ellipsis` — 3
  - `PERLIN`: `PropertyControllerWaveFunction = Ellipsis` — 8
  - `PULSE`: `PropertyControllerWaveFunction = Ellipsis` — 7
  - `SAWTOOTH`: `PropertyControllerWaveFunction = Ellipsis` — 4
  - `SINE`: `PropertyControllerWaveFunction = Ellipsis` — 0
  - `SQUARE`: `PropertyControllerWaveFunction = Ellipsis` — 2
  - `TRIANGLE`: `PropertyControllerWaveFunction = Ellipsis` — 5

### `unreal.ScriptingCollisionShapeType`
Inherits: `EnumBase`

deprecated: âScriptingCollisionShapeTypeâ was renamed to âScriptCollisionShapeTypeâ.

**Properties** (8):
  - `BOX`: `ScriptingCollisionShapeType = Ellipsis` — 0
  - `CAPSULE`: `ScriptingCollisionShapeType = Ellipsis` — 2
  - `NDOP10_X`: `ScriptingCollisionShapeType = Ellipsis` — 3
  - `NDOP10_Y`: `ScriptingCollisionShapeType = Ellipsis` — 4
  - `NDOP10_Z`: `ScriptingCollisionShapeType = Ellipsis` — 5
  - `NDOP18`: `ScriptingCollisionShapeType = Ellipsis` — 6
  - `NDOP26`: `ScriptingCollisionShapeType = Ellipsis` — 7
  - `SPHERE`: `ScriptingCollisionShapeType = Ellipsis` — 1

### `unreal.SlateCheckBoxState`
Inherits: `EnumBase`

deprecated: âSlateCheckBoxStateâ was renamed to âCheckBoxStateâ.

**Properties** (3):
  - `CHECKED`: `SlateCheckBoxState = Ellipsis` — Checked 1
  - `UNCHECKED`: `SlateCheckBoxState = Ellipsis` — Unchecked 0
  - `UNDETERMINED`: `SlateCheckBoxState = Ellipsis` — Neither checked nor unchecked 2

### `unreal.SmartNavLinkDir`
Inherits: `EnumBase`

deprecated: âSmartNavLinkDirâ was renamed to âNavLinkDirectionâ.

**Properties** (3):
  - `BOTH_WAYS`: `SmartNavLinkDir = Ellipsis` — 0
  - `LEFT_TO_RIGHT`: `SmartNavLinkDir = Ellipsis` — 1
  - `RIGHT_TO_LEFT`: `SmartNavLinkDir = Ellipsis` — 2

### `unreal.SocialScreenModes`
Inherits: `EnumBase`

deprecated: âSocialScreenModesâ was renamed to âSpectatorScreenModeâ.

**Properties** (8):
  - `DISABLED`: `SocialScreenModes = Ellipsis` — 0
  - `DISTORTED`: `SocialScreenModes = Ellipsis` — 3
  - `SINGLE_EYE`: `SocialScreenModes = Ellipsis` — 4
  - `SINGLE_EYE_CROPPED_TO_FILL`: `SocialScreenModes = Ellipsis` — 5
  - `SINGLE_EYE_LETTERBOXED`: `SocialScreenModes = Ellipsis` — 1
  - `TEXTURE`: `SocialScreenModes = Ellipsis` — 6
  - `TEXTURE_PLUS_EYE`: `SocialScreenModes = Ellipsis` — 7
  - `UNDISTORTED`: `SocialScreenModes = Ellipsis` — 2

### `unreal.SoundDistanceModel`
Inherits: `EnumBase`

deprecated: âSoundDistanceModelâ was renamed to âAttenuationDistanceModelâ.

**Properties** (6):
  - `CUSTOM`: `SoundDistanceModel = Ellipsis` — 5
  - `INVERSE`: `SoundDistanceModel = Ellipsis` — 2
  - `LINEAR`: `SoundDistanceModel = Ellipsis` — 0
  - `LOGARITHMIC`: `SoundDistanceModel = Ellipsis` — 1
  - `LOG_REVERSE`: `SoundDistanceModel = Ellipsis` — 3
  - `NATURAL_SOUND`: `SoundDistanceModel = Ellipsis` — 4

### `unreal.SoundModulationCurve`
Inherits: `EnumBase`

deprecated: âSoundModulationCurveâ was renamed to âWaveTableCurveâ.

**Properties** (11):
  - `CUSTOM`: `SoundModulationCurve = Ellipsis` — Design a custom curve unique to the owning transform 9
  - `EXP`: `SoundModulationCurve = Ellipsis` — 2
  - `EXP_INVERSE`: `SoundModulationCurve = Ellipsis` — 3
  - `FILE`: `SoundModulationCurve = Ellipsis` — Generate WaveTable from audio file 10
  - `LINEAR`: `SoundModulationCurve = Ellipsis` — 0
  - `LINEAR_INV`: `SoundModulationCurve = Ellipsis` — 1
  - `LOG`: `SoundModulationCurve = Ellipsis` — 4
  - `SHARED`: `SoundModulationCurve = Ellipsis` — Reference a shared curve asset 8
  - `SIN`: `SoundModulationCurve = Ellipsis` — 5
  - `SIN_FULL`: `SoundModulationCurve = Ellipsis` — 6
  - `S_CURVE`: `SoundModulationCurve = Ellipsis` — 7

### `unreal.StateTreeConditionOperand`
Inherits: `EnumBase`

deprecated: âStateTreeConditionOperandâ was renamed to âStateTreeExpressionOperandâ.

**Properties** (2):
  - `AND`: `StateTreeConditionOperand = Ellipsis` — Combine results with AND. 1
  - `OR`: `StateTreeConditionOperand = Ellipsis` — Combine results with OR. 2

### `unreal.StateTreeTransitionEvent`
Inherits: `EnumBase`

deprecated: âStateTreeTransitionEventâ was renamed to âStateTreeTransitionTriggerâ.

**Properties** (6):
  - `ON_DELEGATE`: `StateTreeTransitionEvent = Ellipsis` — Try trigger transition on specific State Tree delegate. 16
  - `ON_EVENT`: `StateTreeTransitionEvent = Ellipsis` — Try trigger transition on specific State Tree event. 8
  - `ON_STATE_COMPLETED`: `StateTreeTransitionEvent = Ellipsis` — Try trigger transition when a state succeeded or failed. 3
  - `ON_STATE_FAILED`: `StateTreeTransitionEvent = Ellipsis` — Try trigger transition when a state failed. 2
  - `ON_STATE_SUCCEEDED`: `StateTreeTransitionEvent = Ellipsis` — Try trigger transition when a state succeeded. 1
  - `ON_TICK`: `StateTreeTransitionEvent = Ellipsis` — Try trigger transition each State Tree tick. 4

### `unreal.SteamVRTrackingSpace`
Inherits: `EnumBase`

deprecated: âSteamVRTrackingSpaceâ was renamed to âHMDTrackingOriginâ.

**Properties** (5):
  - `CUSTOM_OPEN_XR`: `SteamVRTrackingSpace = Ellipsis` — Custom OpenXR tracking space of some kind. You cannot set this space explictly, it is automatically ...
  - `LOCAL`: `SteamVRTrackingSpace = Ellipsis` — For seated experiences. Always Supported. Typically centered around the HMDs initial position either...
  - `LOCAL_FLOOR`: `SteamVRTrackingSpace = Ellipsis` — For standing stationary experiences. Typically centered around HMDs initial position either at app s...
  - `STAGE`: `SteamVRTrackingSpace = Ellipsis` — For walking-around experiences.  The origin will be at floor level and typically within a defined pl...
  - `VIEW`: `SteamVRTrackingSpace = Ellipsis` — Previously sometimes used Eye space to query for the view transform, this space is fixed to the HMD,...

### `unreal.SubmixSendMethod`
Inherits: `EnumBase`

deprecated: âSubmixSendMethodâ was renamed to âSendLevelControlMethodâ.

**Properties** (3):
  - `CUSTOM_CURVE`: `SubmixSendMethod = Ellipsis` — A send based on a supplied curve 1
  - `LINEAR`: `SubmixSendMethod = Ellipsis` — A send based on linear interpolation between a distance range and send-level range 0
  - `MANUAL`: `SubmixSendMethod = Ellipsis` — A manual send level (Uses the specified constant send level value. Useful for 2D sounds.) 2

### `unreal.TextureSampleBlurFilter`
Inherits: `EnumBase`

deprecated: âTextureSampleBlurFilterâ was renamed to âMaterialXTextureSampleBlurFilterâ.

**Properties** (2):
  - `BOX`: `TextureSampleBlurFilter = Ellipsis` — 0
  - `GAUSSIAN`: `TextureSampleBlurFilter = Ellipsis` — 1
