# UE Python API — NNEDenoiser Module

**12 types** from the `NNEDenoiser` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `NNEDenoiserBaseMappingData`, `NNEDenoiserInputMappingData`, `NNEDenoiserOutputMappingData`, `NNEDenoiserTemporalInputMappingData`, `NNEDenoiserTemporalOutputMappingData`, `TilingConfig`, `NNEDenoiserAsset`, `NNEDenoiserTemporalAsset`, `InputResourceName`, `OutputResourceName`, `TemporalInputResourceName`, `TemporalOutputResourceName`

---

## Classes

### `unreal.NNEDenoiserBaseMappingData`
Inherits: `TableRowBase` | Header: `NNEDenoiserIOMappingData.h`

Table row base for denoiser basic input and output mapping

**Properties** (3):
  - `resource_channel`: `int` — [Read-Write] Resource channel (int32)
  - `tensor_channel`: `int` — [Read-Write] Input/output tensor channel (int32)
  - `tensor_index`: `int` — [Read-Write] Input/output tensor index (int32)

### `unreal.NNEDenoiserInputMappingData`
Inherits: `NNEDenoiserBaseMappingData` | Header: `NNEDenoiserIOMappingData.h`

Table row base for denoiser input mapping

**Properties** (1):
  - `resource`: `InputResourceName` — [Read-Write] Mapped resource name (InputResourceName)

### `unreal.NNEDenoiserOutputMappingData`
Inherits: `NNEDenoiserBaseMappingData` | Header: `NNEDenoiserIOMappingData.h`

Table row base for denoiser output mapping

**Properties** (1):
  - `resource`: `OutputResourceName` — [Read-Write] Mapped resource name (OutputResourceName)

### `unreal.NNEDenoiserTemporalInputMappingData`
Inherits: `NNEDenoiserBaseMappingData` | Header: `NNEDenoiserIOMappingData.h`

Table row base for temporal denoiser input mapping

**Properties** (2):
  - `frame_index`: `int` — [Read-Write] Resource frame index (int32)
  - `resource`: `TemporalInputResourceName` — [Read-Write] Mapped resource name (TemporalInputResourceName)

### `unreal.NNEDenoiserTemporalOutputMappingData`
Inherits: `NNEDenoiserBaseMappingData` | Header: `NNEDenoiserIOMappingData.h`

Table row base for temporal denoiser output mapping

**Properties** (1):
  - `resource`: `TemporalOutputResourceName` — [Read-Write] Mapped resource name (TemporalOutputResourceName)

### `unreal.TilingConfig`
Inherits: `StructBase` | Header: `NNEDenoiserTilingConfig.h`

Tiling configuration for fixed and dynamic size models

**Properties** (4):
  - `alignment`: `int` — [Read-Write] Tile size alignment (applies only to dynamic size models) (int32)
  - `max_size`: `int` — [Read-Write] Maximum tile size (applies only to dynamic size models) (int32)
  - `min_size`: `int` — [Read-Write] Minimum tile size (applies only to dynamic size models) (int32)
  - `overlap`: `int` — [Read-Write] Tile overlap (int32)

### `unreal.NNEDenoiserAsset`
Inherits: `DataAsset` | Header: `NNEDenoiserAsset.h`

Denoiser model data asset

**Properties** (4):
  - `input_mapping`: `DataTable` — [Read-Write] Input mapping table (DataTable)
  - `model_data`: `NNEModelData` — [Read-Write] NNE model data (NNEModelData)
  - `output_mapping`: `DataTable` — [Read-Write] Output mapping table (DataTable)
  - `tiling_config`: `TilingConfig` — [Read-Write] Tiling configuration (TilingConfig)

### `unreal.NNEDenoiserTemporalAsset`
Inherits: `DataAsset` | Header: `NNEDenoiserTemporalAsset.h`

Denoiser model data asset

**Properties** (4):
  - `input_mapping`: `DataTable` — [Read-Write] Input mapping table (DataTable)
  - `model_data`: `NNEModelData` — [Read-Write] NNE model data (NNEModelData)
  - `output_mapping`: `DataTable` — [Read-Write] Output mapping table (DataTable)
  - `tiling_config`: `TilingConfig` — [Read-Write] Tiling configuration (TilingConfig)

### `unreal.InputResourceName`
Inherits: `EnumBase` | Header: `NNEDenoiserIOMappingData.h`

An enum to represent resource names used for denoiser input mapping

**Properties** (4):
  - `ALBEDO`: `InputResourceName = Ellipsis` — 1
  - `COLOR`: `InputResourceName = Ellipsis` — 0
  - `NORMAL`: `InputResourceName = Ellipsis` — 2
  - `OUTPUT`: `InputResourceName = Ellipsis` — 3

### `unreal.OutputResourceName`
Inherits: `EnumBase` | Header: `NNEDenoiserIOMappingData.h`

An enum to represent resource names used for denoiser output mapping

**Properties** (1):
  - `OUTPUT`: `OutputResourceName = Ellipsis` — 0

### `unreal.TemporalInputResourceName`
Inherits: `EnumBase` | Header: `NNEDenoiserIOMappingData.h`

An enum to represent resource names used for temporal denoiser input mapping

**Properties** (5):
  - `ALBEDO`: `TemporalInputResourceName = Ellipsis` — 1
  - `COLOR`: `TemporalInputResourceName = Ellipsis` — 0
  - `FLOW`: `TemporalInputResourceName = Ellipsis` — 3
  - `NORMAL`: `TemporalInputResourceName = Ellipsis` — 2
  - `OUTPUT`: `TemporalInputResourceName = Ellipsis` — 4

### `unreal.TemporalOutputResourceName`
Inherits: `EnumBase` | Header: `NNEDenoiserIOMappingData.h`

An enum to represent resource names used for temporal denoiser output mapping

**Properties** (1):
  - `OUTPUT`: `TemporalOutputResourceName = Ellipsis` — 0
