# UE Python API — DMXPixelMappingRenderer Module

**3 types** from the `DMXPixelMappingRenderer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMXPixelMappingPreprocessRenderer`, `DMXPixelBlendingQuality`, `DMXPixelMappingRenderingPreprocessorSizeMode`

---

## Classes

### `unreal.DMXPixelMappingPreprocessRenderer`
Inherits: `Object` | Header: `DMXPixelMappingPreprocessRenderer.h`

Renders the texture that is used to pixel map

**Properties** (1):
  - `filter_material`: `MaterialInterface` [Read-Only] — [Read-Only] Filter material applied to the rendered input (MaterialInterface)

### `unreal.DMXPixelBlendingQuality`
Inherits: `EnumBase` | Header: `DMXPixelMappingRenderElement.h`

Enum that defines the quality of how pixels are rendered

**Properties** (3):
  - `HIGH`: `DMXPixelBlendingQuality = Ellipsis` — 9 samples ( 3 x 3 ) 2
  - `LOW`: `DMXPixelBlendingQuality = Ellipsis` — 1 sample 0
  - `MEDIUM`: `DMXPixelBlendingQuality = Ellipsis` — 5 samples ( 2 x 2 with center) 1

### `unreal.DMXPixelMappingRenderingPreprocessorSizeMode`
Inherits: `EnumBase` | Header: `DMXPixelMappingPreprocessRenderer.h`

EDMXPixel Mapping Rendering Preprocessor Size Mode

**Properties** (3):
  - `CUSTOM_SIZE`: `DMXPixelMappingRenderingPreprocessorSizeMode = Ellipsis` — 2
  - `DOWNSAMPLED`: `DMXPixelMappingRenderingPreprocessorSizeMode = Ellipsis` — 1
  - `SAME_AS_INPUT`: `DMXPixelMappingRenderingPreprocessorSizeMode = Ellipsis` — 0
