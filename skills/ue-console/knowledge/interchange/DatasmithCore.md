# UE Python API — DatasmithCore Module

**7 types** from the `DatasmithCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DatasmithActorAttachmentRule`, `DatasmithActorRemovalRule`, `DatasmithColorSpace`, `DatasmithKeyValuePropertyType`, `DatasmithLightShape`, `DatasmithPropertyCategory`, `DatasmithTextureMode`

---

## Classes

### `unreal.DatasmithActorAttachmentRule`
Inherits: `EnumBase` | Header: `DatasmithDefinitions.h`

EDatasmith Actor Attachment Rule

**Properties** (2):
  - `KEEP_RELATIVE_TRANSFORM`: `DatasmithActorAttachmentRule = Ellipsis` — Keeps current relative transform as the relative transform to the new parent. 0
  - `KEEP_WORLD_TRANSFORM`: `DatasmithActorAttachmentRule = Ellipsis` — The attached actor or component will maintain the same world transform. 1

### `unreal.DatasmithActorRemovalRule`
Inherits: `EnumBase` | Header: `DatasmithDefinitions.h`

EDatasmith Actor Removal Rule

**Properties** (2):
  - `KEEP_CHILDREN_AND_KEEP_RELATIVE_TRANSFORM`: `DatasmithActorRemovalRule = Ellipsis` — Keeps current relative transform as the relative transform to the new parent. 1
  - `REMOVE_CHILDREN`: `DatasmithActorRemovalRule = Ellipsis` — Remove also the actors children 0

### `unreal.DatasmithColorSpace`
Inherits: `EnumBase` | Header: `DatasmithDefinitions.h`

Texture color space. Default: Leave at whatever is default for the texture mode sRGB: Enable the sRGB boolean regardless of texture mode Linear: Disable the sRGB boolean regardless of texture mode

**Properties** (3):
  - `DEFAULT`: `DatasmithColorSpace = Ellipsis` — 0
  - `LINEAR`: `DatasmithColorSpace = Ellipsis` — 2
  - `S_RGB`: `DatasmithColorSpace = Ellipsis` — 1

### `unreal.DatasmithKeyValuePropertyType`
Inherits: `EnumBase` | Header: `DatasmithDefinitions.h`

Key-value property

**Properties** (7):
  - `BOOL`: `DatasmithKeyValuePropertyType = Ellipsis` — 3
  - `COLOR`: `DatasmithKeyValuePropertyType = Ellipsis` — 1
  - `FLOAT`: `DatasmithKeyValuePropertyType = Ellipsis` — 2
  - `INTEGER`: `DatasmithKeyValuePropertyType = Ellipsis` — 6
  - `STRING`: `DatasmithKeyValuePropertyType = Ellipsis` — 0
  - `TEXTURE`: `DatasmithKeyValuePropertyType = Ellipsis` — 4
  - `VECTOR`: `DatasmithKeyValuePropertyType = Ellipsis` — 5

### `unreal.DatasmithLightShape`
Inherits: `EnumBase` | Header: `DatasmithDefinitions.h`

Different supported light shapes

**Properties** (5):
  - `CYLINDER`: `DatasmithLightShape = Ellipsis` — 3
  - `DISC`: `DatasmithLightShape = Ellipsis` — 1
  - `NONE`: `DatasmithLightShape = Ellipsis` — 4
  - `RECTANGLE`: `DatasmithLightShape = Ellipsis` — 0
  - `SPHERE`: `DatasmithLightShape = Ellipsis` — 2

### `unreal.DatasmithPropertyCategory`
Inherits: `EnumBase` | Header: `DatasmithDefinitions.h`

Describes a category of an UPropertyValue asset, indicating types of properties that require special handling for any reason. Mirrors EPropertyValueCategory

**Properties** (9):
  - `COLOR`: `DatasmithPropertyCategory = Ellipsis` — 64
  - `GENERIC`: `DatasmithPropertyCategory = Ellipsis` — 1
  - `MATERIAL`: `DatasmithPropertyCategory = Ellipsis` — 32
  - `OPTION`: `DatasmithPropertyCategory = Ellipsis` — 128
  - `RELATIVE_LOCATION`: `DatasmithPropertyCategory = Ellipsis` — 2
  - `RELATIVE_ROTATION`: `DatasmithPropertyCategory = Ellipsis` — 4
  - `RELATIVE_SCALE3D`: `DatasmithPropertyCategory = Ellipsis` — 8
  - `UNDEFINED`: `DatasmithPropertyCategory = Ellipsis` — 0
  - `VISIBILITY`: `DatasmithPropertyCategory = Ellipsis` — 16

### `unreal.DatasmithTextureMode`
Inherits: `EnumBase` | Header: `DatasmithDefinitions.h`

Different usage for textures. Note: Preserve enum order.

**Properties** (8):
  - `BUMP`: `DatasmithTextureMode = Ellipsis` — 6
  - `DIFFUSE`: `DatasmithTextureMode = Ellipsis` — 0
  - `IES`: `DatasmithTextureMode = Ellipsis` — 7
  - `NORMAL`: `DatasmithTextureMode = Ellipsis` — 2
  - `NORMAL_GREEN_INV`: `DatasmithTextureMode = Ellipsis` — 3
  - `OTHER`: `DatasmithTextureMode = Ellipsis` — 5
  - `SPECULAR`: `DatasmithTextureMode = Ellipsis` — 1
  - `UNUSED_DISPLACE`: `DatasmithTextureMode = Ellipsis` — 4
