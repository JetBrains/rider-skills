# UE Python API — MetaHumanCharacterMigrationEditor Module

**3 types** from the `MetaHumanCharacterMigrationEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaHumanMigrationAssetCollection`, `MetaHumanMigrationDatabase`, `MetaHumanMigrationDataAssetType`

---

## Classes

### `unreal.MetaHumanMigrationAssetCollection`
Inherits: `DataAsset` | Header: `MetaHumanMigrationDatabase.h`

Contains assets that are available for migration.

**Properties** (1):
  - `groom_asset_mapping`: `Map [ Name , MetaHumanWardrobeItem ]` — [Read-Write] Maps original MHC identifier against the wardrobe item. (Map[Name, MetaHumanWardrobeIte...

### `unreal.MetaHumanMigrationDatabase`
Inherits: `DataAsset` | Header: `MetaHumanMigrationDatabase.h`

Contains all assets collections that will be used for migration.

**Properties** (1):
  - `assets`: `None` — [Read-Write] Maps migration asset type against the collection object (Map[MetaHumanMigrationDataAsse...

### `unreal.MetaHumanMigrationDataAssetType`
Inherits: `EnumBase` | Header: `MetaHumanMigrationDatabase.h`

EMeta Human Migration Data Asset Type

**Properties** (6):
  - `BEARD`: `MetaHumanMigrationDataAssetType = Ellipsis` — 3
  - `EYEBROWS`: `MetaHumanMigrationDataAssetType = Ellipsis` — 1
  - `EYELASHES`: `MetaHumanMigrationDataAssetType = Ellipsis` — 2
  - `HAIR`: `MetaHumanMigrationDataAssetType = Ellipsis` — 0
  - `MUSTACHE`: `MetaHumanMigrationDataAssetType = Ellipsis` — 4
  - `PEACHFUZZ`: `MetaHumanMigrationDataAssetType = Ellipsis` — 5
