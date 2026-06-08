# UE Python API — ColorCorrectRegions Module

**10 types** from the `ColorCorrectRegions` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ColorCorrectionInvisibleComponent`, `ColorCorrectionRegion`, `ColorCorrectionWindow`, `ColorCorrectRegion`, `ColorCorrectRegionsSubsystem`, `ColorCorrectWindow`, `ColorCorrectRegionStencilType`, `ColorCorrectRegionsType`, `ColorCorrectRegionTemperatureType`, `ColorCorrectWindowType`

---

## Classes

### `unreal.ColorCorrectionInvisibleComponent`
Inherits: `PrimitiveComponent` | Header: `ColorCorrectRegion.h`

This component class is used to determine if Color Correction Window/Region is hidden via HiddenPrimitives/ShowOnlyPrimitivesShowOnlyPrimitives

### `unreal.ColorCorrectionRegion`
Inherits: `ColorCorrectRegion` | Header: `ColorCorrectRegion.h`

A placeable Color Correction Regions actor that replaces previous implementation (blueprint). Color Correction Regions allow users to adjust color of anything that is within it (or outside, if Invert ...

### `unreal.ColorCorrectionWindow`
Inherits: `ColorCorrectRegion` | Header: `ColorCorrectWindow.h`

A Color Correction Window that functions the same way as Color Correction Regions except it modifies anything that is behind it. Color Correction Windows do not have Priority property and instead are ...

**Properties** (1):
  - `window_type`: `ColorCorrectWindowType` — [Read-Write] Region type. (ColorCorrectWindowType)

### `unreal.ColorCorrectRegion`
Inherits: `Actor` | Header: `ColorCorrectRegion.h`

An instance of Color Correction Region. Used to aggregate all active regions. This actor is aggregated by ColorCorrectRegionsSubsystem on Tick. AActor class itself is not aware of when it is added/rem...

**Methods** (18):
  - `get_distance_from_center()` -> `double` — Get Distance from Center
  - `get_latitude()` -> `double` — Get Latitude
  - `get_longitude()` -> `double` — Get Longitude
  - `get_pitch()` -> `double` — Get Pitch
  - `get_positional_params()` -> `DisplayClusterPositionalParams` — Get Positional Params
  - `get_radial_offset()` -> `double` — Get Radial Offset
  - `get_scale()` -> `Vector2D` — Get Scale
  - `get_spin()` -> `double` — Get Spin
  - `get_yaw()` -> `double` — Get Yaw
  - `set_distance_from_center(value)` -> `None` — Set Distance from Center
  - `set_latitude(value)` -> `None` — Set Latitude
  - `set_longitude(value)` -> `None` — ~Begin IDisplayClusterStageActor interface
  - `set_pitch(value)` -> `None` — Set Pitch
  - `set_positional_params(params)` -> `None` — Set Positional Params
  - `set_radial_offset(value)` -> `None` — Set Radial Offset
  - `set_scale(scale)` -> `None` — Set Scale
  - `set_spin(value)` -> `None` — Set Spin
  - `set_yaw(value)` -> `None` — Set Yaw

**Properties** (16):
  - `affected_actors`: `None` — [Read-Write] List of actors that get affected or ignored by Per actor CC. Effect depends on the abov...
  - `color_grading_settings`: `ColorGradingSettings` — [Read-Write] Color correction settings. (ColorGradingSettings)
  - `enable_per_actor_cc`: `bool` — [Read-Write] Enables or disabled per actor color correction. (bool)
  - `enabled`: `bool` — [Read-Write] Enable/Disable color correction provided by this region. (bool)
  - `falloff`: `float` — [Read-Write] Falloff. Softening the region. (float)
  - `inner`: `float` — [Read-Write] Inner of the region. Swapped with Outer in case it is higher than Outer. (float)
  - `intensity`: `float` — [Read-Write] Color correction intensity. Clamped to 0-1 range. (float)
  - `invert`: `bool` — [Read-Write] Invert region. (bool)
  - `origin`: `Transform` [Read-Only] — [Read-Only] The origin when used in the ICVFX panel. (Transform)
  - `outer`: `float` — [Read-Write] Outer of the region. (float)
  - `per_actor_color_correction`: `ColorCorrectRegionStencilType` — [Read-Write] Controls in which way the below targets will be affected by color correction. (ColorCor...
  - `priority`: `int` — [Read-Write] Render priority/order. The higher the number the later region will be applied.
A region...
  - `temperature`: `float` — [Read-Write] Color correction temperature. (float)
  - `temperature_type`: `ColorCorrectRegionTemperatureType` — [Read-Write] Type of algorithm to be used to control color temperature or white balance. (ColorCorre...
  - `tint`: `float` — [Read-Write] Color temperature tint. (float)
  - `type`: `ColorCorrectRegionsType` — [Read-Write] Region type. (ColorCorrectRegionsType)

### `unreal.ColorCorrectRegionsSubsystem`
Inherits: `TickableWorldSubsystem` | Header: `ColorCorrectRegionsSubsystem.h`

World Subsystem responsible for managing AColorCorrectRegion classes in level. This subsystem handles:

**Methods** (1):
  - `refresh_stenci_id_assignment_for_all_ccr()` -> `None` — Refresh Stenci Id Assignment for All CCR

### `unreal.ColorCorrectWindow`
Inherits: `ColorCorrectionWindow` | Header: `ColorCorrectWindow.h`

Color Correct Window

### `unreal.ColorCorrectRegionStencilType`
Inherits: `EnumBase` | Header: `ColorCorrectRegion.h`

EColor Correct Region Stencil Type

**Properties** (2):
  - `EXCLUDE_STENCIL`: `ColorCorrectRegionStencilType = Ellipsis` — 0
  - `INCLUDE_STENCIL`: `ColorCorrectRegionStencilType = Ellipsis` — 1

### `unreal.ColorCorrectRegionsType`
Inherits: `EnumBase` | Header: `ColorCorrectRegion.h`

EColor Correct Regions Type

**Properties** (4):
  - `BOX`: `ColorCorrectRegionsType = Ellipsis` — 1
  - `CONE`: `ColorCorrectRegionsType = Ellipsis` — 3
  - `CYLINDER`: `ColorCorrectRegionsType = Ellipsis` — 2
  - `SPHERE`: `ColorCorrectRegionsType = Ellipsis` — 0

### `unreal.ColorCorrectRegionTemperatureType`
Inherits: `EnumBase` | Header: `ColorCorrectRegion.h`

EColor Correct Region Temperature Type

**Properties** (3):
  - `COLOR_TEMPERATURE`: `ColorCorrectRegionTemperatureType = Ellipsis` — 2
  - `LEGACY_TEMPERATURE`: `ColorCorrectRegionTemperatureType = Ellipsis` — 0
  - `WHITE_BALANCE`: `ColorCorrectRegionTemperatureType = Ellipsis` — 1

### `unreal.ColorCorrectWindowType`
Inherits: `EnumBase` | Header: `ColorCorrectRegion.h`

EColor Correct Window Type

**Properties** (2):
  - `CIRCLE`: `ColorCorrectWindowType = Ellipsis` — 1
  - `SQUARE`: `ColorCorrectWindowType = Ellipsis` — 0
