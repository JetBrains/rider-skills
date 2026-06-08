# UE Python API — FractureEditor Module

**4 types** from the `FractureEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DynamicStateOverrideEnum`, `InspectedAttributeEnum`, `OutlinerColumnMode`, `OutlinerItemNameEnum`

---

## Classes

### `unreal.DynamicStateOverrideEnum`
Inherits: `EnumBase` | Header: `FractureToolProperties.h`

EDynamic State Override Enum

**Properties** (3):
  - `KINEMATIC`: `DynamicStateOverrideEnum = Ellipsis` — 2
  - `NO_OVERRIDE`: `DynamicStateOverrideEnum = Ellipsis` — 0
  - `STATIC`: `DynamicStateOverrideEnum = Ellipsis` — 3

### `unreal.InspectedAttributeEnum`
Inherits: `EnumBase` | Header: `SGeometryCollectionHistogram.h`

EInspected Attribute Enum

**Properties** (4):
  - `INITIAL_DYNAMIC_STATE`: `InspectedAttributeEnum = Ellipsis` — 3
  - `LEVEL`: `InspectedAttributeEnum = Ellipsis` — 1
  - `SIZE`: `InspectedAttributeEnum = Ellipsis` — 4
  - `VOLUME`: `InspectedAttributeEnum = Ellipsis` — 0

### `unreal.OutlinerColumnMode`
Inherits: `EnumBase` | Header: `FractureEditorModeToolkit.h`

EOutliner Column Mode

**Properties** (6):
  - `COLLISION`: `OutlinerColumnMode = Ellipsis` — 3
  - `DAMAGE`: `OutlinerColumnMode = Ellipsis` — 1
  - `GEOMETRY`: `OutlinerColumnMode = Ellipsis` — 5
  - `REMOVAL`: `OutlinerColumnMode = Ellipsis` — 2
  - `SIZE`: `OutlinerColumnMode = Ellipsis` — 4
  - `STATE`: `OutlinerColumnMode = Ellipsis` — 0

### `unreal.OutlinerItemNameEnum`
Inherits: `EnumBase` | Header: `SGeometryCollectionOutliner.h`

EOutliner Item Name Enum

**Properties** (2):
  - `BONE_INDEX`: `OutlinerItemNameEnum = Ellipsis` — 1
  - `BONE_NAME`: `OutlinerItemNameEnum = Ellipsis` — 0
