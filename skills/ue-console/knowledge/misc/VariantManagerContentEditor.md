# UE Python API — VariantManagerContentEditor Module

**3 types** from the `VariantManagerContentEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VariantManagerFactoryNew`, `VariantManagerTestActor`, `VariantManagerTestEnum`

---

## Classes

### `unreal.VariantManagerFactoryNew`
Inherits: `Factory` | Header: `VariantManagerFactoryNew.h`

Variant Manager Factory New

### `unreal.VariantManagerTestActor`
Inherits: `Actor` | Header: `VariantManagerTestActor.h`

Variant Manager Test Actor

**Properties** (21):
  - `captured_bool_property`: `bool` — [Read-Write] Captured boolean property (bool)
  - `captured_byte_property`: `int` — [Read-Write] Captured byte property (uint8)
  - `captured_color_property`: `Color` — [Read-Write] Captured FColor property (Color)
  - `captured_float_property`: `float` — [Read-Write] Captured float property (float)
  - `captured_int_point_property`: `IntPoint` — [Read-Write] Captured FIntPoint property (IntPoint)
  - `captured_int_property`: `int` — [Read-Write] Captured int32 property (int32)
  - `captured_interface_property`: `Interface` — [Read-Write] Captured UInterface property (Interface)
  - `captured_linear_color_property`: `LinearColor` — [Read-Write] Captured FLinearColor property (LinearColor)
  - `captured_name_property`: `Name` — [Read-Write] Captured FName property (Name)
  - `captured_object_property`: `Object` — [Read-Write] Captured UObject property (Object)
  - `captured_quat_property`: `Quat` — [Read-Write] Captured FQuat property (Quat)
  - `captured_rotator_property`: `Rotator` — [Read-Write] Captured FRotator property (Rotator)
  - `captured_str_property`: `str` — [Read-Write] Captured FString property (str)
  - `captured_text_property`: `Text` — [Read-Write] Captured FText property (Text)
  - `captured_u_object_array_property`: `None` — [Read-Write] Captured UObject array property (Array[Object])
  - `captured_vector2d_property`: `Vector2D` — [Read-Write] Captured FVector2D property (Vector2D)
  - `captured_vector4_property`: `Vector4` — [Read-Write] Captured FVector4 property (Vector4)
  - `captured_vector_array_property`: `None` — [Read-Write] Captured FVector array property (Array[Vector])
  - `captured_vector_property`: `Vector` — [Read-Write] Captured FVector property (Vector)
  - `enum_with_no_default`: `VariantManagerTestEnum` — [Read-Write] Captured byte property (VariantManagerTestEnum)
  - `enum_with_second_default`: `VariantManagerTestEnum` — [Read-Write] Captured byte property (VariantManagerTestEnum)

### `unreal.VariantManagerTestEnum`
Inherits: `EnumBase` | Header: `VariantManagerTestActor.h`

EVariant Manager Test Enum

**Properties** (3):
  - `FIRST_OPTION`: `VariantManagerTestEnum = Ellipsis` — 1
  - `SECOND_OPTION`: `VariantManagerTestEnum = Ellipsis` — 3
  - `THIRD_OPTION`: `VariantManagerTestEnum = Ellipsis` — 45
