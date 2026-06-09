# UE Python API — DMXPixelMappingCore Module

**3 types** from the `DMXPixelMappingCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMXCellFormat`, `DMXColorMode`, `DMXPixelMappingRendererType`

---

## Classes

### `unreal.DMXCellFormat`
Inherits: `EnumBase` | Header: `DMXPixelMappingTypes.h`

EDMXCell Format

**Properties** (17):
  - `PF_B`: `DMXCellFormat = Ellipsis` — 2
  - `PF_BG`: `DMXCellFormat = Ellipsis` — 8
  - `PF_BR`: `DMXCellFormat = Ellipsis` — 7
  - `PF_BRG`: `DMXCellFormat = Ellipsis` — 10
  - `PF_BRGA`: `DMXCellFormat = Ellipsis` — 15
  - `PF_G`: `DMXCellFormat = Ellipsis` — 1
  - `PF_GB`: `DMXCellFormat = Ellipsis` — 5
  - `PF_GBR`: `DMXCellFormat = Ellipsis` — 12
  - `PF_GBRA`: `DMXCellFormat = Ellipsis` — 14
  - `PF_GR`: `DMXCellFormat = Ellipsis` — 6
  - `PF_GRB`: `DMXCellFormat = Ellipsis` — 11
  - `PF_GRBA`: `DMXCellFormat = Ellipsis` — 16
  - `PF_R`: `DMXCellFormat = Ellipsis` — 0
  - `PF_RB`: `DMXCellFormat = Ellipsis` — 4
  - `PF_RG`: `DMXCellFormat = Ellipsis` — 3
  - `PF_RGB`: `DMXCellFormat = Ellipsis` — 9
  - `PF_RGBA`: `DMXCellFormat = Ellipsis` — 13

### `unreal.DMXColorMode`
Inherits: `EnumBase` | Header: `DMXPixelMappingTypes.h`

EDMXColor Mode

**Properties** (2):
  - `CM_MONOCHROME`: `DMXColorMode = Ellipsis` — 1
  - `CM_RGB`: `DMXColorMode = Ellipsis` — 0

### `unreal.DMXPixelMappingRendererType`
Inherits: `EnumBase` | Header: `DMXPixelMappingTypes.h`

EDMXPixel Mapping Renderer Type

**Properties** (3):
  - `MATERIAL`: `DMXPixelMappingRendererType = Ellipsis` — 1
  - `TEXTURE`: `DMXPixelMappingRendererType = Ellipsis` — 0
  - `UMG`: `DMXPixelMappingRendererType = Ellipsis` — 2
