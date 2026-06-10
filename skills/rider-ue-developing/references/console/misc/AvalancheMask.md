# UE Python API — AvalancheMask Module

**5 types** from the `AvalancheMask` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaMask2DBaseModifier`, `AvaMask2DReadModifier`, `AvaMask2DWriteModifier`, `AvaMaskSettings`, `AvaMask2DMode`

---

## Classes

### `unreal.AvaMask2DBaseModifier`
Inherits: `ActorModifierArrangeBaseModifier` | Header: `AvaMask2DBaseModifier.h`

Uses scene actors to create a mask texture and applies it to attached actors

**Properties** (8):
  - `blur_strength`: `float` — [Read-Write] (float)
  - `channel`: `Name` — [Read-Write] Channel to read to or write from (Name)
  - `inner_feather_radius`: `int` — [Read-Write] (int32)
  - `inverted`: `bool` — [Read-Write] Whether to apply the mask as inverted (visible becomes invisible and vice versa) (bool)
  - `outer_feather_radius`: `int` — [Read-Write] (int32)
  - `use_blur`: `bool` — [Read-Write] (bool)
  - `use_feathering`: `bool` — [Read-Write] (bool)
  - `use_parent_channel`: `bool` — [Read-Write] Whether to get the channel from the parent (first one that specifies a mask channel) (b...

### `unreal.AvaMask2DReadModifier`
Inherits: `AvaMask2DBaseModifier` | Header: `AvaMask2DReadModifier.h`

Uses scene actors to create a mask texture and applies it to attached actors

**Properties** (1):
  - `base_opacity`: `float` — [Read-Write] Base opacity/alpha to use in Read mode (float)

### `unreal.AvaMask2DWriteModifier`
Inherits: `AvaMask2DBaseModifier` | Header: `AvaMask2DWriteModifier.h`

Uses scene actors to create a mask texture and applies it to attached actors

**Properties** (1):
  - `write_operation`: `GeometryMaskCompositeOperation` — [Read-Write] How to write to the chosen mask channel (GeometryMaskCompositeOperation)

### `unreal.AvaMaskSettings`
Inherits: `DeveloperSettings` | Header: `AvaMaskSettings.h`

Settings for Motion Design Mask

**Properties** (1):
  - `material_function`: `MaterialFunctionInterface` [Read-Only] — [Read-Only] Material Function to use to expect or add to a material. (MaterialFunctionInterface)

### `unreal.AvaMask2DMode`
Inherits: `EnumBase` | Header: `AvaMask2DBaseModifier.h`

EAva Mask 2DMode

**Properties** (2):
  - `READ`: `AvaMask2DMode = Ellipsis` — Use the specified Mask Channel to apply to this geometry 0
  - `WRITE`: `AvaMask2DMode = Ellipsis` — Use the specified Mask Channel to render this geometry to 1
