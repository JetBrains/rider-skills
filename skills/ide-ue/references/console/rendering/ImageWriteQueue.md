# UE Python API — ImageWriteQueue Module

**4 types** from the `ImageWriteQueue` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ImageWriteOptions`, `ImageWriteBlueprintLibrary`, `DesiredImageFormat`, `OnImageWriteComplete`

---

## Classes

### `unreal.ImageWriteOptions`
Inherits: `StructBase` | Header: `ImageWriteBlueprintLibrary.h`

Options specific to writing image files to disk

**Properties** (5):
  - `async_`: `bool` — [Read-Write] Whether to perform the writing asynchronously, or to block the game thread until it is ...
  - `compression_quality`: `int` — [Read-Write] An image format specific compression setting. Either 0 (Default) or 1 (Uncompressed) fo...
  - `format`: `DesiredImageFormat` — [Read-Write] The desired output image format to write to disk (DesiredImageFormat)
  - `on_complete`: `OnImageWriteComplete` — [Read-Write] A callback to invoke when the image has been written, or there was an error (OnImageWri...
  - `overwrite_file`: `bool` — [Read-Write] Whether to overwrite the image if it already exists (bool)

### `unreal.ImageWriteBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ImageWriteBlueprintLibrary.h`

Function library containing utility methods for writing images on a global async queue

**Methods** (1):
  - `export_to_disk(texture, filename, options)` -> `None` [classmethod] — Export the specified texture to disk

### `unreal.DesiredImageFormat`
Inherits: `EnumBase` | Header: `ImageWriteTypes.h`

EDesired Image Format

**Properties** (4):
  - `BMP`: `DesiredImageFormat = Ellipsis` — 2
  - `EXR`: `DesiredImageFormat = Ellipsis` — 3
  - `JPG`: `DesiredImageFormat = Ellipsis` — 1
  - `PNG`: `DesiredImageFormat = Ellipsis` — 0

### `unreal.OnImageWriteComplete`
Inherits: `DelegateBase` | Header: `ImageWriteBlueprintLibrary.h`

On Image Write Complete Delegate Signature
