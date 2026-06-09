# UE Python API — TextureGraphEditor Module

**5 types** from the `TextureGraphEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TG_Factory`, `TG_InstanceFactory`, `TextureHistogramLayout`, `TextureHistogramStyle`, `TG_HistogramCurves`

---

## Classes

### `unreal.TG_Factory`
Inherits: `Factory` | Header: `TG_Factory.h`

TG Factory

### `unreal.TG_InstanceFactory`
Inherits: `Factory` | Header: `TG_InstanceFactory.h`

TG Instance Factory

### `unreal.TextureHistogramLayout`
Inherits: `EnumBase` | Header: `STextureHistogram.h`

ETexture Histogram Layout

**Properties** (2):
  - `COMBINED`: `TextureHistogramLayout = Ellipsis` — Draw RGBA curves in histogram in one graph 0
  - `SPLIT`: `TextureHistogramLayout = Ellipsis` — Draw RGBA curves in histogram in vertically seperated graphs 1

### `unreal.TextureHistogramStyle`
Inherits: `EnumBase` | Header: `STextureHistogram.h`

ETexture Histogram Style

**Properties** (2):
  - `BAR`: `TextureHistogramStyle = Ellipsis` — Draw the histogram in descrete bar shape 0
  - `CURVE`: `TextureHistogramStyle = Ellipsis` — Draw the histogram in continous line curve shader 1

### `unreal.TG_HistogramCurves`
Inherits: `EnumBase` | Header: `STG_HistogramBlob.h`

ETG Histogram Curves

**Properties** (5):
  - `B`: `TG_HistogramCurves = Ellipsis` — 2
  - `G`: `TG_HistogramCurves = Ellipsis` — 1
  - `LUMA`: `TG_HistogramCurves = Ellipsis` — 3
  - `R`: `TG_HistogramCurves = Ellipsis` — 0
  - `RGB`: `TG_HistogramCurves = Ellipsis` — 4
