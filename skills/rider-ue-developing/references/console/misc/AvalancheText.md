# UE Python API — AvalancheText Module

**5 types** from the `AvalancheText` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaLinearGradientSettings`, `AvaFontObject`, `AvaText3DComponent`, `AvaTextActor`, `AvaGradientDirection`

---

## Classes

### `unreal.AvaLinearGradientSettings`
Inherits: `StructBase` | Header: `AvaTextDefs.h`

Ava Linear Gradient Settings

**Properties** (6):
  - `color_a`: `LinearColor` — [Read-Write] (LinearColor)
  - `color_b`: `LinearColor` — [Read-Write] (LinearColor)
  - `direction`: `AvaGradientDirection` — [Read-Write] (AvaGradientDirection)
  - `offset`: `float` — [Read-Write] (float)
  - `rotation`: `float` — [Read-Write] (float)
  - `smoothness`: `float` — [Read-Write] (float)

### `unreal.AvaFontObject`
Inherits: `Object` | Header: `AvaFontObject.h`

Ava Font Object

**Properties** (1):
  - `font`: `Font` [Read-Only] — [Read-Only] (Font)

### `unreal.AvaText3DComponent`
Inherits: `Text3DComponent` | Header: `AvaText3DComponent.h`

Ava Text 3DComponent

### `unreal.AvaTextActor`
Inherits: `Actor` | Header: `AvaTextActor.h`

This actor is getting replaced by AText3DActor, do not use anymore

**Properties** (1):
  - `text3d_component`: `Text3DComponent` [Read-Only] — [Read-Only] (Text3DComponent)

### `unreal.AvaGradientDirection`
Inherits: `EnumBase` | Header: `AvaTextDefs.h`

EAva Gradient Direction

**Properties** (3):
  - `CUSTOM`: `AvaGradientDirection = Ellipsis` — 3
  - `HORIZONTAL`: `AvaGradientDirection = Ellipsis` — 2
  - `VERTICAL`: `AvaGradientDirection = Ellipsis` — 1
