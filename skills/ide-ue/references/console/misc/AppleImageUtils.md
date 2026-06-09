# UE Python API — AppleImageUtils Module

**5 types** from the `AppleImageUtils` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AppleImageUtilsImageConversionResult`, `AppleImageUtilsBaseAsyncTaskBlueprintProxy`, `AppleTextureType`, `TextureRotationDirection`, `AppleImageConversionDelegate`

---

## Classes

### `unreal.AppleImageUtilsImageConversionResult`
Inherits: `StructBase` | Header: `AppleImageUtilsBlueprintProxy.h`

Apple Image Utils Image Conversion Result

**Properties** (2):
  - `error`: `str` [Read-Only] — [Read-Only] (str)
  - `image_data`: `None` [Read-Only] — [Read-Only] (Array[uint8])

### `unreal.AppleImageUtilsBaseAsyncTaskBlueprintProxy`
Inherits: `Object` | Header: `AppleImageUtilsBlueprintProxy.h`

Apple Image Utils Base Async Task Blueprint Proxy

**Properties** (3):
  - `conversion_result`: `AppleImageUtilsImageConversionResult` [Read-Only] — [Read-Only] (AppleImageUtilsImageConversionResult)
  - `on_failure`: `AppleImageConversionDelegate` — [Read-Write] (AppleImageConversionDelegate)
  - `on_success`: `AppleImageConversionDelegate` — [Read-Write] (AppleImageConversionDelegate)

### `unreal.AppleTextureType`
Inherits: `EnumBase` | Header: `AppleImageUtilsTypes.h`

EApple Texture Type

**Properties** (5):
  - `IMAGE`: `AppleTextureType = Ellipsis` — 1
  - `METAL_TEXTURE`: `AppleTextureType = Ellipsis` — 4
  - `PIXEL_BUFFER`: `AppleTextureType = Ellipsis` — 2
  - `SURFACE`: `AppleTextureType = Ellipsis` — 3
  - `UNKNOWN`: `AppleTextureType = Ellipsis` — 0

### `unreal.TextureRotationDirection`
Inherits: `EnumBase` | Header: `AppleImageUtilsTypes.h`

ETexture Rotation Direction

**Properties** (8):
  - `DOWN`: `TextureRotationDirection = Ellipsis` — 3
  - `DOWN_MIRRORED`: `TextureRotationDirection = Ellipsis` — 6
  - `LEFT`: `TextureRotationDirection = Ellipsis` — 1
  - `LEFT_MIRRORED`: `TextureRotationDirection = Ellipsis` — 4
  - `NONE`: `TextureRotationDirection = Ellipsis` — 0
  - `RIGHT`: `TextureRotationDirection = Ellipsis` — 2
  - `RIGHT_MIRRORED`: `TextureRotationDirection = Ellipsis` — 5
  - `UP_MIRRORED`: `TextureRotationDirection = Ellipsis` — 7

### `unreal.AppleImageConversionDelegate`
Inherits: `MulticastDelegateBase` | Header: `AppleImageUtilsBlueprintProxy.h`

Apple Image Conversion Delegate Delegate Signature
