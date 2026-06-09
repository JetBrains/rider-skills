# UE Python API — SpeedTreeImporter Module

**5 types** from the `SpeedTreeImporter` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ReimportSpeedTreeFactory`, `SpeedTreeImportData`, `SpeedTreeImportFactory`, `ImportGeometryType`, `ImportLODType`

---

## Classes

### `unreal.ReimportSpeedTreeFactory`
Inherits: `SpeedTreeImportFactory` | Header: `ReimportSpeedTreeFactory.h`

Reimport Speed Tree Factory

### `unreal.SpeedTreeImportData`
Inherits: `AssetImportData` | Header: `SpeedTreeImportData.h`

Speed Tree Import Data

### `unreal.SpeedTreeImportFactory`
Inherits: `Factory` | Header: `SpeedTreeImportFactory.h`

Speed Tree Import Factory

### `unreal.ImportGeometryType`
Inherits: `EnumBase` | Header: `SpeedTreeImportData.h`

Geometry import type

**Properties** (3):
  - `IGT_3D`: `ImportGeometryType = Ellipsis` — 0
  - `IGT_BILLBOARDS`: `ImportGeometryType = Ellipsis` — 1
  - `IGT_BOTH`: `ImportGeometryType = Ellipsis` — 2

### `unreal.ImportLODType`
Inherits: `EnumBase` | Header: `SpeedTreeImportData.h`

LOD type *

**Properties** (2):
  - `ILT_INDIVIDUAL_ACTORS`: `ImportLODType = Ellipsis` — 1
  - `ILT_PAINTED_FOLIAGE`: `ImportLODType = Ellipsis` — 0
