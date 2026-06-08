# UE Python API — RenderCore Module

**2 types** from the `RenderCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VTInvalidatePriority`, `VTProducerPriority`

---

## Classes

### `unreal.VTInvalidatePriority`
Inherits: `EnumBase` | Header: `VirtualTextureEnum.h`

Describes whether an invalidated VT area should be prioritized against others. Allows to improve reactiveness when invalidating a large number of pages

**Properties** (2):
  - `HIGH`: `VTInvalidatePriority = Ellipsis` — 1
  - `NORMAL`: `VTInvalidatePriority = Ellipsis` — 0

### `unreal.VTProducerPriority`
Inherits: `EnumBase` | Header: `VirtualTextureEnum.h`

Enumeration of the priority assigned to a given virtual texture producer. Must match EVTProducerPriority in RenderCore (they are duplicate because RenderCore cannot declare UENUMs)

**Properties** (8):
  - `ABOVE_NORMAL`: `VTProducerPriority = Ellipsis` — 5
  - `BELOW_NORMAL`: `VTProducerPriority = Ellipsis` — 3
  - `HIGH`: `VTProducerPriority = Ellipsis` — 6
  - `HIGHEST`: `VTProducerPriority = Ellipsis` — 7
  - `LOW`: `VTProducerPriority = Ellipsis` — 2
  - `LOWER`: `VTProducerPriority = Ellipsis` — 1
  - `LOWEST`: `VTProducerPriority = Ellipsis` — 0
  - `NORMAL`: `VTProducerPriority = Ellipsis` — 4
