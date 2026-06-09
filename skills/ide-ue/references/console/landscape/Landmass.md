# UE Python API — Landmass Module

**11 types** from the `Landmass` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BrushEffectBlurring`, `BrushEffectCurlNoise`, `BrushEffectCurves`, `BrushEffectDisplacement`, `BrushEffectSmoothBlending`, `BrushEffectTerracing`, `LandmassBrushEffectsList`, `LandmassFalloffSettings`, `LandmassTerrainCarvingSettings`, `BrushBlendType`, `BrushFalloffMode`

---

## Classes

### `unreal.BrushEffectBlurring`
Inherits: `StructBase` | Header: `BrushEffectsList.h`

Brush Effect Blurring

**Properties** (2):
  - `blur_shape`: `bool` — [Read-Write] (bool)
  - `radius`: `int` — [Read-Write] (int32)

### `unreal.BrushEffectCurlNoise`
Inherits: `StructBase` | Header: `BrushEffectsList.h`

Brush Effect Curl Noise

**Properties** (4):
  - `curl1_amount`: `float` — [Read-Write] (float)
  - `curl1_tiling`: `float` — [Read-Write] (float)
  - `curl2_amount`: `float` — [Read-Write] (float)
  - `curl2_tiling`: `float` — [Read-Write] (float)

### `unreal.BrushEffectCurves`
Inherits: `StructBase` | Header: `BrushEffectsList.h`

Brush Effect Curves

**Properties** (5):
  - `channel_depth`: `float` — [Read-Write] (float)
  - `channel_edge_offset`: `float` — [Read-Write] (float)
  - `curve_ramp_width`: `float` — [Read-Write] (float)
  - `elevation_curve_asset`: `CurveFloat` — [Read-Write] (CurveFloat)
  - `use_curve_channel`: `bool` — [Read-Write] (bool)

### `unreal.BrushEffectDisplacement`
Inherits: `StructBase` | Header: `BrushEffectsList.h`

Brush Effect Displacement

**Properties** (6):
  - `channel`: `LinearColor` — [Read-Write] (LinearColor)
  - `displacement_height`: `float` — [Read-Write] (float)
  - `displacement_tiling`: `float` — [Read-Write] (float)
  - `midpoint`: `float` — [Read-Write] (float)
  - `texture`: `Texture2D` — [Read-Write] (Texture2D)
  - `weightmap_influence`: `float` — [Read-Write] (float)

### `unreal.BrushEffectSmoothBlending`
Inherits: `StructBase` | Header: `BrushEffectsList.h`

Brush Effect Smooth Blending

**Properties** (2):
  - `inner_smooth_distance`: `float` — [Read-Write] (float)
  - `outer_smooth_distance`: `float` — [Read-Write] (float)

### `unreal.BrushEffectTerracing`
Inherits: `StructBase` | Header: `BrushEffectsList.h`

Brush Effect Terracing

**Properties** (5):
  - `mask_length`: `float` — [Read-Write] (float)
  - `mask_start_offset`: `float` — [Read-Write] (float)
  - `terrace_alpha`: `float` — [Read-Write] (float)
  - `terrace_smoothness`: `float` — [Read-Write] (float)
  - `terrace_spacing`: `float` — [Read-Write] (float)

### `unreal.LandmassBrushEffectsList`
Inherits: `StructBase` | Header: `BrushEffectsList.h`

Landmass Brush Effects List

**Properties** (5):
  - `blurring`: `BrushEffectBlurring` — [Read-Write] (BrushEffectBlurring)
  - `curl_noise`: `BrushEffectCurlNoise` — [Read-Write] (BrushEffectCurlNoise)
  - `displacement`: `BrushEffectDisplacement` — [Read-Write] (BrushEffectDisplacement)
  - `smooth_blending`: `BrushEffectSmoothBlending` — [Read-Write] (BrushEffectSmoothBlending)
  - `terracing`: `BrushEffectTerracing` — [Read-Write] (BrushEffectTerracing)

### `unreal.LandmassFalloffSettings`
Inherits: `StructBase` | Header: `FalloffSettings.h`

Landmass Falloff Settings

**Properties** (5):
  - `edge_offset`: `float` — [Read-Write] (float)
  - `falloff_angle`: `float` — [Read-Write] (float)
  - `falloff_mode`: `BrushFalloffMode` — [Read-Write] (BrushFalloffMode)
  - `falloff_width`: `float` — [Read-Write] (float)
  - `z_offset`: `float` — [Read-Write] (float)

### `unreal.LandmassTerrainCarvingSettings`
Inherits: `StructBase` | Header: `TerrainCarvingSettings.h`

Landmass Terrain Carving Settings

**Properties** (5):
  - `blend_mode`: `BrushBlendType` — [Read-Write] (BrushBlendType)
  - `effects`: `LandmassBrushEffectsList` — [Read-Write] (LandmassBrushEffectsList)
  - `falloff_settings`: `LandmassFalloffSettings` — [Read-Write] (LandmassFalloffSettings)
  - `invert_shape`: `bool` — [Read-Write] (bool)
  - `priority`: `int` — [Read-Write] (int32)

### `unreal.BrushBlendType`
Inherits: `EnumBase` | Header: `TerrainCarvingSettings.h`

The blend mode changes how the brush material is applied to the terrain.

**Properties** (4):
  - `ADDITIVE`: `BrushBlendType = Ellipsis` — Performs an additive blend, using a flat Z=0 terrain as the input. Useful when you want to preserve ...
  - `ALPHA_BLEND`: `BrushBlendType = Ellipsis` — Alpha Blend will affect the heightmap both upwards and downwards. 0
  - `MAX`: `BrushBlendType = Ellipsis` — Limits the brush to only raising the terrain. 2
  - `MIN`: `BrushBlendType = Ellipsis` — Limits the brush to only lowering the terrain. 1

### `unreal.BrushFalloffMode`
Inherits: `EnumBase` | Header: `FalloffSettings.h`

EBrush Falloff Mode

**Properties** (2):
  - `ANGLE`: `BrushFalloffMode = Ellipsis` — 0
  - `WIDTH`: `BrushFalloffMode = Ellipsis` — 1
