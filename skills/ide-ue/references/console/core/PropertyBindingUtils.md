# UE Python API — PropertyBindingUtils Module

**7 types** from the `PropertyBindingUtils` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PropertyBindingBindableStructDescriptor`, `PropertyBindingBinding`, `PropertyBindingBindingCollection`, `PropertyBindingIndex16`, `PropertyBindingPath`, `PropertyBindingPathSegment`, `PropertyBindingPropertyAccessType`

---

## Classes

### `unreal.PropertyBindingBindableStructDescriptor`
Inherits: `StructBase` | Header: `PropertyBindingBindableStructDescriptor.h`

Descriptor for a struct or class that can be a binding source or target. Each struct has unique identifier, which is used to distinguish them, and name that is mostly for debugging and UI.

### `unreal.PropertyBindingBinding`
Inherits: `StructBase` | Header: `PropertyBindingBinding.h`

Representation of a property binding

### `unreal.PropertyBindingBindingCollection`
Inherits: `StructBase` | Header: `PropertyBindingBindingCollection.h`

Base structure to inherit from to facilitate operations on property bindings. see: FPropertyBindingExtension, IPropertyBindingBindingCollectionOwner

### `unreal.PropertyBindingIndex16`
Inherits: `StructBase` | Header: `PropertyBindingTypes.h`

uint16 index that can be invalid.

### `unreal.PropertyBindingPath`
Inherits: `StructBase` | Header: `PropertyBindingPath.h`

Representation of a property path that can be used for property access and binding.

### `unreal.PropertyBindingPathSegment`
Inherits: `StructBase` | Header: `PropertyBindingPath.h`

Struct describing a path segment in FPropertyBindingPath.

### `unreal.PropertyBindingPropertyAccessType`
Inherits: `EnumBase` | Header: `PropertyBindingTypes.h`

EProperty Binding Property Access Type

**Properties** (10):
  - `INDEX_ARRAY`: `PropertyBindingPropertyAccessType = Ellipsis` — Access node needs to dereference an instanced struct of specific type at its current address 6
  - `OBJECT`: `PropertyBindingPropertyAccessType = Ellipsis` — Access node is a simple basePtr + offset 1
  - `OBJECT_INSTANCE`: `PropertyBindingPropertyAccessType = Ellipsis` — Access is a soft object 4
  - `OFFSET`: `PropertyBindingPropertyAccessType = Ellipsis` — 0
  - `SHARED_STRUCT`: `PropertyBindingPropertyAccessType = Ellipsis` — Access node indexes a dynamic array 7
  - `SOFT_OBJECT`: `PropertyBindingPropertyAccessType = Ellipsis` — Access is a weak object 3
  - `STRUCT_INSTANCE`: `PropertyBindingPropertyAccessType = Ellipsis` — Access node needs to dereference an object of specific type at its current address 5
  - `STRUCT_INSTANCE_CONTAINER`: `PropertyBindingPropertyAccessType = Ellipsis` — Access node needs to dereference a shared struct of specific type at its current address 8
  - `UNSET`: `PropertyBindingPropertyAccessType = Ellipsis` — Access node needs to dereference an instanced struct container at its current address 9
  - `WEAK_OBJECT`: `PropertyBindingPropertyAccessType = Ellipsis` — Access node needs to dereference an object at its current address 2
