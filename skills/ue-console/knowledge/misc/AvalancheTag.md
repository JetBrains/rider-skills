# UE Python API — AvalancheTag Module

**8 types** from the `AvalancheTag` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaTag`, `AvaTagAlias`, `AvaTagHandle`, `AvaTagHandleContainer`, `AvaTagId`, `AvaTagSoftHandle`, `AvaTagCollection`, `MotionDesignTagLibrary`

---

## Classes

### `unreal.AvaTag`
Inherits: `StructBase` | Header: `AvaTag.h`

Struct for a Tag NOTE: Do not use as storage type. Prefer using FAvaTagHandle to then retrieve the FAvaTag it references

### `unreal.AvaTagAlias`
Inherits: `StructBase` | Header: `AvaTagAlias.h`

An alias represents multiple other Tag Ids.

### `unreal.AvaTagHandle`
Inherits: `StructBase` | Header: `AvaTagHandle.h`

Handle to a Tag or Alias (set of Tags) in a particular Source. This should be used by the UStructs/UObjects to properly reference a Tag or Alias (set of Tags).

### `unreal.AvaTagHandleContainer`
Inherits: `StructBase` | Header: `AvaTagHandleContainer.h`

Handle to a multiple tags in a particular Source. This should be used by the UStructs/UObjects to properly reference a multiple FAvaTags.

### `unreal.AvaTagId`
Inherits: `StructBase` | Header: `AvaTagId.h`

Struct to identify a Tag. This is used by FAvaTagHandle to reference an FAvaTag

### `unreal.AvaTagSoftHandle`
Inherits: `StructBase` | Header: `AvaTagSoftHandle.h`

Soft reference handle to a Tag in a particular Source Tag Collection This should be used when needing to soft reference a particular FAvaTag.

### `unreal.AvaTagCollection`
Inherits: `Object` | Header: `AvaTagCollection.h`

Tag Collection that identifies a tag with an underlying Tag Id Guid and provides Tag reference capabilities

### `unreal.MotionDesignTagLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AvaTagLibrary.h`

Ava Tag Library

**Methods** (3):
  - `resolve_tag_handle(tag_handle)` -> `Array [ AvaTag ]` [classmethod] — Resolve Tag Handle
  - `resolve_tag_handles(tag_handle_container)` -> `Array [ AvaTag ]` [classmethod] — Resolve Tag Handles
  - `resolve_tag_soft_handle(tag_soft_handle)` -> `AvaTagHandle` [classmethod] — Resolve Tag Soft Handle
