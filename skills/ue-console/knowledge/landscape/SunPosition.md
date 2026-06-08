# UE Python API — SunPosition Module

**2 types** from the `SunPosition` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SunPositionData`, `SunPositionFunctionLibrary`

---

## Classes

### `unreal.SunPositionData`
Inherits: `StructBase` | Header: `SunPosition.h`

Sun Position Data

**Properties** (6):
  - `azimuth`: `float` — [Read-Write] Sun azimuth (float)
  - `corrected_elevation`: `float` — [Read-Write] Sun Elevation, corrected for atmospheric diffraction (float)
  - `elevation`: `float` — [Read-Write] Sun Elevation (float)
  - `solar_noon`: `Timespan` — [Read-Write] Solar noon (Timespan)
  - `sunrise_time`: `Timespan` — [Read-Write] Sunrise time (Timespan)
  - `sunset_time`: `Timespan` — [Read-Write] Sunset time (Timespan)

### `unreal.SunPositionFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SunPosition.h`

Sun Position Function Library

**Methods** (1):
  - `get_sun_position(latitude, longitude, time_zone, is_daylight_saving_time, year, month, day, hours, minutes, seconds)` -> `SunPositionData` [classmethod] — Get the sunâs position data based on position, date and time
