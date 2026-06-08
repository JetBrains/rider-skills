# UE Python API — MetaHumanCoreTech Module

**5 types** from the `MetaHumanCoreTech` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DepthMapDiagnosticsResult`, `FrameAnimationData`, `MetaHumanRealtimeSmoothingParam`, `MetaHumanRealtimeSmoothingParams`, `MetaHumanRealtimeSmoothingParamMethod`

---

## Classes

### `unreal.DepthMapDiagnosticsResult`
Inherits: `StructBase` | Header: `DepthMapDiagnosticsResult.h`

Depth Map Diagnostics Result

### `unreal.FrameAnimationData`
Inherits: `StructBase` | Header: `FrameAnimationData.h`

Frame Animation Data

**Properties** (1):
  - `animation_data`: `None` [Read-Only] — [Read-Only] (Map[str,float])

### `unreal.MetaHumanRealtimeSmoothingParam`
Inherits: `StructBase` | Header: `MetaHumanRealtimeSmoothing.h`

MetaHuman Realtime Smoothing Param

### `unreal.MetaHumanRealtimeSmoothingParams`
Inherits: `DataAsset` | Header: `MetaHumanRealtimeSmoothing.h`

MetaHuman Realtime Smoothing Params

### `unreal.MetaHumanRealtimeSmoothingParamMethod`
Inherits: `EnumBase` | Header: `MetaHumanRealtimeSmoothing.h`

EMeta Human Realtime Smoothing Param Method

**Properties** (2):
  - `ONE_EURO`: `MetaHumanRealtimeSmoothingParamMethod = Ellipsis` — 1
  - `ROLLING_AVERAGE`: `MetaHumanRealtimeSmoothingParamMethod = Ellipsis` — 0
