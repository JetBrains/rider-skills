# UE Python API — ClothingSystemRuntimeCommon Module

**2 types** from the `ClothingSystemRuntimeCommon` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ClothingAssetCommon`, `ClothingAssetCustomData`

---

## Classes

### `unreal.ClothingAssetCommon`
Inherits: `ClothingAssetBase` | Header: `ClothingAsset.h`

Implementation of non-solver specific, but common Engine related functionality.

**Properties** (2):
  - `cloth_configs`: `None` [Read-Only] — [Read-Only] Simulation specific cloth parameters.
Use GetClothConfig() to retrieve the correct param...
  - `custom_data`: `ClothingAssetCustomData` — [Read-Write]
deprecated: This property is obsolete. (ClothingAssetCustomData)

### `unreal.ClothingAssetCustomData`
Inherits: `Object` | Header: `ClothingAsset.h`

Clothing Asset Custom Data
