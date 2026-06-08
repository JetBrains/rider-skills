# UE Python API — GeoReferencing Module

**7 types** from the `GeoReferencing` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `Ellipsoid`, `GeographicCoordinates`, `GeographicCoordinatesFunctionLibrary`, `GeoReferencingBFL`, `GeoReferencingSystem`, `RoundPlanetPawn`, `PlanetShape`

---

## Classes

### `unreal.Ellipsoid`
Inherits: `StructBase` | Header: `Ellipsoid.h`

### `unreal.GeographicCoordinates`
Inherits: `StructBase` | Header: `GeographicCoordinates.h`

Geographic Coordinates

**Properties** (3):
  - `altitude`: `float` — [Read-Write] (double)
  - `latitude`: `float` — [Read-Write] (double)
  - `longitude`: `float` — [Read-Write] FVector where X = Latitude, Y = Longitude, Z = Altitude (double)

### `unreal.GeographicCoordinatesFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `GeographicCoordinates.h`

Geographic Coordinates Function Library

**Methods** (5):
  - `make_geographic_coordinates(lat_long_alt_vector)` -> `GeographicCoordinates` [classmethod] — Make Geographic Coordinates from a FVector where X=Latitude, Y=Longitude, Z=Altitude
  - `to_compact_text(geographic_coordinates, integral_digits_lat_lon=8, integral_digits_alti=2, geographic_coordinates=GeographicCoordinates)` [classmethod] — Converts a GeographicCoordinates value to formatted text, in the form â(X, Y, Z)â
  - `to_full_text(geographic_coordinates, integral_digits_lat_lon=8, integral_digits_alti=2, geographic_coordinates=GeographicCoordinates)` [classmethod] — Converts a GeographicCoordinates value to localized formatted text, in the form âX= Y= Z=â
  - `to_lat_long_alt_vector(out_lat_long_alt_vector=Vector)` [classmethod] — Express the Geographic coordinates as a FVector where where X=Latitude, Y=Longitude, Z=Altitude deprecated: BP now suppo...
  - `to_separate_texts(geographic_coordinates, integral_digits_lat_lon=8, integral_digits_alti=2, out_latitude=Text, out_longitude=Text, out_altitude=Text)` [classmethod] — Converts a GeographicCoordinates value to 3 separate text values

### `unreal.GeoReferencingBFL`
Inherits: `BlueprintFunctionLibrary` | Header: `GeoReferencingBFL.h`

Blueprint function library to convert geospatial coordinates to text

**Methods** (3):
  - `to_compact_text(cartesian_coordinates, cartesian_coordinates=Vector)` [classmethod] — Converts a LargeCoordinates value to formatted text, in the form â(X, Y, Z)â
  - `to_full_text(cartesian_coordinates, cartesian_coordinates=Vector)` [classmethod] — Converts a LargeCoordinates value to localized formatted text, in the form âX= Y= Z=â
  - `to_separate_texts(cartesian_coordinates, out_x=Text, out_y=Text, out_z=Text)` [classmethod] — Converts a LargeCoordinates value to 3 separate text values

### `unreal.GeoReferencingSystem`
Inherits: `Info` | Header: `GeoReferencingSystem.h`

This AInfos enable you to define a correspondance between the UE origin and an actual geographic location on a planet Once done it offers different functions to convert coordinates between UE and Geog...

**Methods** (29):
  - `apply_settings()` -> `None` — In case you want to change the Origin or CRS definition properties during application execution, you need to call this f...
  - `engine_to_geographic(engine_coordinates)` -> `GeographicCoordinates` — Convert a Vector expressed in ENGINE space to the GEOGRAPHIC CRS
  - `geographic_to_engine(geographic_coordinates)` -> `Vector` — Convert a Vector expressed in GEOGRAPHIC CRS to ENGINE space
  - `get_enu_vectors_at_engine_location(north=Vector, up=Vector)` — Get the East North Up vectors at a specific location
  - `get_enu_vectors_at_geographic_location(north=Vector, up=Vector)` — Get the East North Up vectors at a specific location
  - `get_geo_referencing_system(world_context_object)` -> `GeoReferencingSystem` [classmethod] — Get Geo Referencing System
  - `get_geographic_ellipsoid_max_radius()` -> `double` — Find the underlying Geographic CRS Ellipsoid and return its maximum radius
  - `get_geographic_ellipsoid_min_radius()` -> `double` — Find the underlying Geographic CRS Ellipsoid and return its minimum radius
  - `get_planet_center_transform()` -> `Transform` — Set this transform to an Ellipsoid to have it positioned tangent to the origin.
  - `get_projected_ellipsoid_max_radius()` -> `double` — Find the underlying Projected CRS Ellipsoid and return its maximum radius
  - `get_projected_ellipsoid_min_radius()` -> `double` — Find the underlying Projected CRS Ellipsoid and return its minimum radius
  - `get_tangent_transform_at_engine_location(engine_coordinates)` -> `Transform` — Get the the transform to locate an object tangent to Ellipsoid at a specific location
  - `get_tangent_transform_at_geographic_location(geographic_coordinates)` -> `Transform` — Get the the transform to locate an object tangent to Ellipsoid at a specific location
  - `is_crs_string_valid(crs_string)` -> `str or None` — Check if the string corresponds to a valid CRS descriptor
  - `k2_ecef_to_engine(ecef_coordinates)` -> `Vector` — Convert a Vector expressed in ECEF CRS to ENGINE space
  - `k2_ecef_to_geographic(ecef_coordinates)` -> `GeographicCoordinates` — Convert a Coordinate expressed in ECEF CRS to GEOGRAPHIC CRS
  - `k2_ecef_to_projected(ecef_coordinates)` -> `Vector` — Convert a Coordinate expressed in ECEF CRS to PROJECTED CRS
  - `k2_engine_to_ecef(engine_coordinates)` -> `Vector` — Convert a Vector expressed in ENGINE space to the ECEF CRS
  - `k2_engine_to_projected(engine_coordinates)` -> `Vector` — Convert a Vector expressed in ENGINE space to the PROJECTED CRS
  - `k2_geographic_to_ecef(geographic_coordinates)` -> `Vector` — Convert a Coordinate expressed in GEOGRAPHIC CRS to ECEF CRS
  - `k2_geographic_to_projected(geographic_coordinates)` -> `Vector` — Convert a Coordinate expressed in GEOGRAPHIC CRS to PROJECTED CRS
  - `k2_get_ecefenu_vectors_at_ecef_location(ecef_north=Vector, ecef_up=Vector)` — Get the East North Up vectors at a specific location - Not in engine frame, but in pure ECEF Frame !
  - `k2_get_enu_vectors_at_ecef_location(north=Vector, up=Vector)` — Get the East North Up vectors at a specific location
  - `k2_get_enu_vectors_at_projected_location(north=Vector, up=Vector)` — Get the East North Up vectors at a specific location
  - `k2_get_tangent_transform_at_ecef_location(ecef_coordinates)` -> `Transform` — Get the the transform to locate an object tangent to Ellipsoid at a specific location
  - `k2_get_tangent_transform_at_projected_location(projected_coordinates)` -> `Transform` — Get the the transform to locate an object tangent to Ellipsoid at a specific location
  - `k2_projected_to_ecef(projected_coordinates)` -> `Vector` — Convert a Coordinate expressed in PROJECTED CRS to ECEF CRS
  - `k2_projected_to_engine(projected_coordinates)` -> `Vector` — Convert a Vector expressed in PROJECTED CRS to ENGINE space
  - `k2_projected_to_geographic(projected_coordinates)` -> `GeographicCoordinates` — Convert a Coordinate expressed in PROJECTED CRS to GEOGRAPHIC CRS

**Properties** (11):
  - `geographic_crs`: `str` — [Read-Write] String that describes the GEOGRAPHIC CRS of choice.
CRS can be identified by their code...
  - `origin_altitude`: `float` — [Read-Write] Altitude of UE Origin on planet (double)
  - `origin_at_planet_center`: `bool` — [Read-Write] if true, the UE origin is located at the Planet Center, otherwise,
the UE origin is ass...
  - `origin_latitude`: `float` — [Read-Write] Latitude of UE Origin on planet (double)
  - `origin_location_in_projected_crs`: `bool` — (NOT in ECEF ! - Projected worlds are the most frequent use caseâ¦) if false, the origin is located...
  - `origin_longitude`: `float` — [Read-Write] Longitude of UE Origin on planet (double)
  - `origin_projected_coordinates_easting`: `float` — [Read-Write] Easting position of UE Origin on planet, express in the Projected CRS Frame (double)
  - `origin_projected_coordinates_northing`: `float` — [Read-Write] Northing position of UE Origin on planet, express in the Projected CRS Frame (double)
  - `origin_projected_coordinates_up`: `float` — [Read-Write] Up position of UE Origin on planet, express in the Projected CRS Frame (double)
  - `planet_shape`: `PlanetShape` — [Read-Write] This mode has to be set consistently with the way you authored your ground geometry.
- ...
  - `projected_crs`: `str` — [Read-Write] String that describes the PROJECTED CRS of choice.
CRS can be identified by their code ...

### `unreal.RoundPlanetPawn`
Inherits: `DefaultPawn` | Header: `RoundPlanetPawn.h`

This pawn can be used to easily move around the globe while maintaining a sensible orientation. As the pawn moves across the horizon, it automatically changes its own up direction such that the world ...

**Methods** (7):
  - `decrease_speed_scalar()` -> `None` — Decrease the Speed Scalar - MouseWheel Down equivalent
  - `fly_to_location_ecef(ecef_destination, yaw_at_destination, pitch_at_destination, can_interrupt_by_moving)` -> `None` — Begin a smooth camera flight to the given ECEF destination such that the camera ends at the specified yaw and pitch. The...
  - `fly_to_location_geographic(geographic_destination, yaw_at_destination, pitch_at_destination, can_interrupt_by_moving)` -> `None` — Begin a smooth camera flight to the given Latitude/Longitude destination such that the camera ends at the specified yaw ...
  - `fly_to_location_latitude_longitude_altitude(latitude, longitude, altitude, yaw_at_destination, pitch_at_destination, can_interrupt_by_moving)` -> `None` — Begin a smooth camera flight to the given Latitude/Longitude destination such that the camera ends at the specified yaw ...
  - `increase_speed_scalar()` -> `None` — Increase the Speed Scalar - MouseWheel Up equivalent
  - `interrupt_fly_to_location()` -> `None` — Stop the current Fly To Location motion
  - `reset_speed_scalar()` -> `None` — Reset the Speed Scalar to its default value - Middle-mouse button click equivalent

**Properties** (6):
  - `altitude`: `float` [Read-Only] — [Read-Only] The distance between the geographic ellipsoid surface and the pawn (float)
  - `base_speed_kmh`: `float` — [Read-Write] The Reference maximum speed for the pawn, before being altered by any Scalar modifier o...
  - `hat`: `float` [Read-Only] — [Read-Only] Height Above Terrain. The distance between the ground and the pawn (float)
  - `orbital_motion`: `bool` — [Read-Write] if True, the motion Forward/Right motion of the pawn are relative to Planet tangent,
me...
  - `speed_scalar`: `float` — [Read-Write] Scalar modifier for the base speed
ActualMaxSpeed = BaseSpeedKmh * SpeedScalar * Altitu...
  - `speed_scalar_increment`: `float` — [Read-Write] Multiplier/Divider for increasing/decreasing the speed scalar (float)

### `unreal.PlanetShape`
Inherits: `EnumBase` | Header: `GeoReferencingSystem.h`

EPlanet Shape

**Properties** (2):
  - `FLAT_PLANET`: `PlanetShape = Ellipsis` — The world geometry coordinates are expressed in a projected space such as a Mercator projection.
In ...
  - `ROUND_PLANET`: `PlanetShape = Ellipsis` — The world geometry coordinates are expressed in a planet wide Cartesian frame,
placed on a specific ...
