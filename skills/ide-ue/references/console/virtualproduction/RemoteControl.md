# UE Python API — RemoteControl Module

**27 types** from the `RemoteControl` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ColorGradingWheelColor`, `ColorWheelColor`, `ColorWheelColorBase`, `RemoteControlActor`, `RemoteControlDeltaAPITestStruct`, `RemoteControlEntity`, `RemoteControlField`, `RemoteControlFunction`, `RemoteControlInstanceMaterial`, `RemoteControlInterceptionFunctionParamStruct`, `RemoteControlInterceptionTestStruct`, `RemoteControlOptionalExposeArgs`, `RemoteControlProperty`, `RemoteControlTestStruct`, `RCVirtualPropertyBase`, `RCVirtualPropertyContainerBase`, `RCVirtualPropertyInContainer`, `RCVirtualPropertySelfContainer`, `RemoteControlBinding`, `RemoteControlDeltaAPITestObject`, ... (27 total)

---

## Classes

### `unreal.ColorGradingWheelColor`
Inherits: `ColorWheelColorBase` | Header: `RemoteControlFunctionLibrary.h`

A color value as represented by a position on a color grading wheel.

### `unreal.ColorWheelColor`
Inherits: `ColorWheelColorBase` | Header: `RemoteControlFunctionLibrary.h`

A color as represented by a position on a color wheel.

### `unreal.ColorWheelColorBase`
Inherits: `StructBase` | Header: `RemoteControlFunctionLibrary.h`

Base data for a color represented as its position on a color wheel.

### `unreal.RemoteControlActor`
Inherits: `RemoteControlEntity` | Header: `RemoteControlActor.h`

Represents an actor exposed in the panel.

**Properties** (1):
  - `path`: `SoftObjectPath` [Read-Only] — [Read-Only] Path to the exposed object. (SoftObjectPath)

### `unreal.RemoteControlDeltaAPITestStruct`
Inherits: `StructBase` | Header: `RemoteControlDeltaAPITestData.h`

Remote Control Delta APITest Struct

### `unreal.RemoteControlEntity`
Inherits: `StructBase` | Header: `RemoteControlEntity.h`

Base class for exposed objects, properties, functions etcâ¦

**Properties** (3):
  - `id`: `Guid` [Read-Only] — [Read-Only] Unique identifier for this entity (Guid)
  - `label`: `Name` [Read-Only] — [Read-Only] This exposed entityâs alias. (Name)
  - `owner`: `RemoteControlPreset` [Read-Only] — [Read-Only] The preset that owns this entity. (RemoteControlPreset)

### `unreal.RemoteControlField`
Inherits: `RemoteControlEntity` | Header: `RemoteControlField.h`

Represents a property or function that has been exposed to remote control.

**Properties** (3):
  - `field_name`: `Name` [Read-Only] — [Read-Only] The exposed fieldâs name. (Name)
  - `field_type`: `ExposedFieldType` [Read-Only] — [Read-Only] The fieldâs type. (ExposedFieldType)
  - `property_id`: `Name` [Read-Only] — [Read-Only] The exposed fieldâs identifier. (Name)

### `unreal.RemoteControlFunction`
Inherits: `RemoteControlField` | Header: `RemoteControlField.h`

Represents a function exposed to remote control.

### `unreal.RemoteControlInstanceMaterial`
Inherits: `RemoteControlProperty` | Header: `RemoteControlInstanceMaterial.h`

Represents a material instance property that has been exposed to remote control.

### `unreal.RemoteControlInterceptionFunctionParamStruct`
Inherits: `StructBase` | Header: `RemoteControlInterceptionTestData.h`

Remote Control Interception Function Param Struct

### `unreal.RemoteControlInterceptionTestStruct`
Inherits: `StructBase` | Header: `RemoteControlInterceptionTestData.h`

Remote Control Interception Test Struct

### `unreal.RemoteControlOptionalExposeArgs`
Inherits: `StructBase` | Header: `RemoteControlFunctionLibrary.h`

Remote Control Optional Expose Args

**Properties** (2):
  - `display_name`: `str` — [Read-Write] The display name of the exposed entity in the panel. (str)
  - `group_name`: `str` — [Read-Write] The name of the group to expose the entity in.
If it does not exist, a group with that ...

### `unreal.RemoteControlProperty`
Inherits: `RemoteControlField` | Header: `RemoteControlField.h`

Represents a property exposed to remote control.

### `unreal.RemoteControlTestStruct`
Inherits: `StructBase` | Header: `RemoteControlTestData.h`

Remote Control Test Struct

### `unreal.RCVirtualPropertyBase`
Inherits: `Object` | Header: `RCVirtualProperty.h`

Base class for dynamic virtual properties Remote Control Virtual Properties using Property Bag and FInstancedPropertyBag to serialize FProperties values and UStruct

**Methods** (33):
  - `get_display_value_as_string()` -> `str` — Infers correct type internally, fetches value from memory and returns the value as a string that can be immediately used...
  - `get_property_name()` -> `Name` — Get FProperty Name
  - `get_value_bool()` -> `bool or None` — Get Bool value from Virtual Property
  - `get_value_byte()` -> `uint8 or None` — Get Byte value from Virtual Property
  - `get_value_color()` -> `Color or None` — Get Color value from Virtual Property
  - `get_value_double()` -> `double or None` — Get Double value from Virtual Property
  - `get_value_float()` -> `float or None` — Get Float value from Virtual Property
  - `get_value_int32()` -> `int32 or None` — Get Int32 value from Virtual Property
  - `get_value_int64()` -> `int64 or None` — Get Int64 value from Virtual Property
  - `get_value_linear_color()` -> `LinearColor or None` — Get LinearColor value from Virtual Property
  - `get_value_name()` -> `Name or None` — Get Name value from Virtual Property
  - `get_value_numeric_integer()` -> `int64 or None` — Get Numeric value from Virtual Property
  - `get_value_object()` -> `Object` — Get Object value from Virtual Property
  - `get_value_rotator()` -> `Rotator or None` — Get Rotator value from Virtual Property
  - `get_value_string()` -> `str or None` — Get String value from Virtual Property
  - `get_value_text()` -> `Text or None` — Get Text value from Virtual Property
  - `get_value_vector()` -> `Vector or None` — Get Vector value from Virtual Property
  - `get_value_vector2d()` -> `Vector2D or None` — Get Vector2D value from Virtual Property
  - `set_value_bool(bool_value)` -> `bool` — Set Bool value from Virtual Property
  - `set_value_byte(byte)` -> `bool` — Set Byte value from Virtual Property
  - `set_value_color(color)` -> `bool` — Set Color value from Virtual Property
  - `set_value_double(double)` -> `bool` — Set Double value from Virtual Property
  - `set_value_float(float)` -> `bool` — Set Float value from Virtual Property
  - `set_value_int32(int32)` -> `bool` — Set Int32 value from Virtual Property
  - `set_value_int64(int64)` -> `bool` — Set Int64 value from Virtual Property
  - `set_value_linear_color(linear_color)` -> `bool` — Set LinearColor value from Virtual Property
  - `set_value_name(name_value)` -> `bool` — Set Name value from Virtual Property
  - `set_value_numeric_integer(int64_value)` -> `bool` — Set Numeric value from Virtual Property
  - `set_value_rotator(rotator)` -> `bool` — Set Rotator value from Virtual Property
  - `set_value_string(string_value)` -> `bool` — Set String value from Virtual Property
  - `set_value_text(text_value)` -> `bool` — Set Text value from Virtual Property
  - `set_value_vector(vector)` -> `bool` — Set Vector value from Virtual Property
  - `set_value_vector2d(vector2d)` -> `bool` — Set Vector2D value from Virtual Property

### `unreal.RCVirtualPropertyContainerBase`
Inherits: `Object` | Header: `RCVirtualPropertyContainer.h`

Container for more then one Virtual Property

### `unreal.RCVirtualPropertyInContainer`
Inherits: `RCVirtualPropertyBase` | Header: `RCVirtualProperty.h`

Remote Control Virtual Property which is stores in container with many properties Where Property Bag has more then one Property

### `unreal.RCVirtualPropertySelfContainer`
Inherits: `RCVirtualPropertyBase` | Header: `RCVirtualProperty.h`

Remote Control Virtual Property which is stores in self defined Property Bag In this case SelfContainer holds only single property in the Property Bag

### `unreal.RemoteControlBinding`
Inherits: `Object` | Header: `RemoteControlBinding.h`

Acts as a bridge between an exposed property/function and an object to act on.

### `unreal.RemoteControlDeltaAPITestObject`
Inherits: `Object` | Header: `RemoteControlDeltaAPITestData.h`

Remote Control Delta APITest Object

**Properties** (1):
  - `int32_with_setter_value`: `int` — [Read-Write] (int32)

### `unreal.RemoteControlFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `RemoteControlFunctionLibrary.h`

Remote Control Function Library

**Methods** (5):
  - `apply_color_grading_wheel_delta(target_object, property_name, delta_value, reference_color, is_interactive, min_value = 0.000000, max_value = 2.000000)` -> `bool` [classmethod] — Add/subtract from the value of an FVector4 property interpreted as RGBV using a delta value based on color wheel coordin...
  - `apply_color_wheel_delta(target_object, property_name, delta_value, reference_color, is_interactive)` -> `bool` [classmethod] — Add/subtract from the value of an FLinearColor property using a delta value based on color wheel coordinates.
  - `expose_actor(preset, actor, args)` -> `bool` [classmethod] — Expose an actor in a remote control preset.
  - `expose_function(preset, source_object, function, args)` -> `bool` [classmethod] — Expose a function in a remote control preset.
  - `expose_property(preset, source_object, property_, args)` -> `bool` [classmethod] — Expose a property in a remote control preset.

### `unreal.RemoteControlInterceptionTestObject`
Inherits: `Object` | Header: `RemoteControlInterceptionTestData.h`

Remote Control Interception Test Object

**Methods** (1):
  - `test_function(struct, test_factor)` -> `RemoteControlInterceptionFunctionParamStruct` — Test Function

### `unreal.RemoteControlLevelDependantBinding`
Inherits: `RemoteControlBinding` | Header: `RemoteControlBinding.h`

Remote Control Level Dependant Binding

**Properties** (2):
  - `bound_object_map`: `None` — [Read-Write]
deprecated: BoundObjectMap is deprecated, please use BoundObjectMapByPath instead. (Map...
  - `sub_level_selection_map`: `None` — [Read-Write]
deprecated: SubLevelSelectionMap is deprecated, please use SubLevelSelectionMapByPath i...

### `unreal.RemoteControlLevelIndependantBinding`
Inherits: `RemoteControlBinding` | Header: `RemoteControlBinding.h`

Remote Control Level Independant Binding

### `unreal.RemoteControlPreset`
Inherits: `Object` | Header: `RemoteControlPreset.h`

Holds exposed functions and properties.

### `unreal.RemoteControlPresetActor`
Inherits: `Actor` | Header: `RemoteControlPresetActor.h`

Actor that wraps a remote control preset, allows linking a specific preset to a level.

### `unreal.ExposedFieldType`
Inherits: `EnumBase` | Header: `RemoteControlField.h`

The type of the exposed field.

**Properties** (3):
  - `FUNCTION`: `ExposedFieldType = Ellipsis` — 2
  - `INVALID`: `ExposedFieldType = Ellipsis` — 0
  - `PROPERTY`: `ExposedFieldType = Ellipsis` — 1
