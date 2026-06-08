# UE Python API — CelestialVault Module

**9 types** from the `CelestialVault` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CelestialStarInputData`, `PlanetaryBodyInfo`, `PlanetaryBodyInputData`, `StarInfo`, `StarInputData`, `SunInfo`, `CelestialMaths`, `CelestialVaultDaySequenceActor`, `OrbitType`

---

## Classes

### `unreal.CelestialStarInputData`
Inherits: `StarInputData` | Header: `CelestialDataTypes.h`

TableRow Base type to describe the Creation parameters of a Catalog-based Star Will only be used at creation time, from a proper Data Table This Struct extends the FStarInputData class with additional...

**Properties** (4):
  - `color_index`: `float` — [Read-Write] Star Color Index, also named B-V (double)
  - `henry_draper_id`: `int` — [Read-Write] Star Henry Draper ID (int32)
  - `hipparcos_id`: `int` — [Read-Write] Star Hipparcos ID (int32)
  - `yale_bright_star_id`: `int` — [Read-Write] Star YaleBrightStar ID (int32)

### `unreal.PlanetaryBodyInfo`
Inherits: `StructBase` | Header: `CelestialDataTypes.h`

Runtime structure to store the computed properties of a Planetary Body, for any Query.

**Properties** (14):
  - `age`: `float` — [Read-Write] indication of the lunar age. 0 = New Moon, 0.25 = First quarter, 0.5 = Full Moon, 1 = N...
  - `apparent_diameter_degrees`: `float` — [Read-Write] The True apparent diameter of the body seen from Earth (Angular size, in degrees) (doub...
  - `apparent_magnitude`: `float` — [Read-Write] The Magnitude of the body seen from Earth (double)
  - `dec`: `float` — [Read-Write] The Body Declination in the Celestial Frame - In Degrees (double)
  - `direction_toward_earth`: `Vector` — [Read-Write] Keep track of the location toward the Earth (Vector)
  - `distance_in_au`: `float` — [Read-Write] The Body distance to Earth - In Astronomical Units! (double)
  - `illumination_percentage`: `float` — [Read-Write] indication of percentage of a full moon illumination (double)
  - `ism_instance_index`: `int` — [Read-Write] Internal value of the ISM Instance corresponding to this planet (int32)
  - `name`: `str` — [Read-Write] The body Name (str)
  - `orbit_type`: `OrbitType` — [Read-Write] One of the predefined body types (Solar system planets), any custom one for fantasy pla...
  - `ra`: `float` — [Read-Write] The Body Right Ascension in the Celestial Frame - In hours! (double)
  - `radius`: `float` — [Read-Write] The Body Radius in Kilometers (double)
  - `scaled_apparent_diameter_degrees`: `float` — [Read-Write] The Scaled apparent diameter of the body seen from Earth (Angular size, in degrees)
Tak...
  - `ue_transform`: `Transform` — [Read-Write] Keep track of the Vault-relative transform, at ToD = 0 for animated bodies (Moon) (Tran...

### `unreal.PlanetaryBodyInputData`
Inherits: `TableRowBase` | Header: `CelestialDataTypes.h`

TableRow Base type to describe the Creation parameters of a planetary body (Planet, Moon) Will only be used at creation time, from a proper Data Table

**Properties** (4):
  - `name`: `str` — [Read-Write] The body Name (str)
  - `orbit_type`: `OrbitType` — [Read-Write] One of the predefined Orbit types (Solar system planets), any custom Elliptic ones for ...
  - `radius`: `float` — [Read-Write] The Body Radius in Kilometers (double)
  - `texture_column_index`: `int` — [Read-Write] The planetary body Material expects Bodies textures in a single row - This is the 0-bas...

### `unreal.StarInfo`
Inherits: `StructBase` | Header: `CelestialDataTypes.h`

Runtime structure to store the computed properties of a Star, for any Query.

**Properties** (11):
  - `color`: `LinearColor` — [Read-Write] Star RGB Color - Can be computed from the B-V value if the star is from an official Cat...
  - `color_index`: `float` — [Read-Write] Star Color Index, also named B-V (double)
  - `dec`: `float` — [Read-Write] The Star Declination in the Celestial Frame - In Degrees (double)
  - `distance_in_pc`: `float` — [Read-Write] Earth to Star distance (in Parsecs) (double)
  - `henry_draper_id`: `int` — [Read-Write] Star Henry Draper ID if present in the Henry Draper Catalog (int32)
  - `hipparcos_id`: `int` — [Read-Write] Star Hipparcos ID if present in the Hipparcos Catalog (int32)
  - `ism_instance_index`: `int` — [Read-Write] Internal value of the ISM Instance corresponding to this Star (int32)
  - `magnitude`: `float` — [Read-Write] Star Magnitude (double)
  - `name`: `str` — [Read-Write] Star Name (str)
  - `ra`: `float` — [Read-Write] The Star Right Ascension in the Celestial Frame - In hours! (double)
  - `yale_bright_star_id`: `int` — [Read-Write] Star YaleBrightStar ID if present in the Yale Bright Star Catalog (int32)

### `unreal.StarInputData`
Inherits: `TableRowBase` | Header: `CelestialDataTypes.h`

TableRow Base type to describe the Creation parameters of a Basic Star Will only be used at creation time, from a proper Data Table This Struct contains the minimal needed data for a Fictional Star

**Properties** (6):
  - `color`: `LinearColor` — [Read-Write] Star RGB Color - Useless if computed from the B-V (LinearColor)
  - `dec`: `float` — [Read-Write] The Star Declination in the Celestial Frame - In Degrees (double)
  - `distance_in_pc`: `float` — [Read-Write] Earth to Star distance (in Parsecs) (double)
  - `magnitude`: `float` — [Read-Write] Star Magnitude (double)
  - `name`: `str` — [Read-Write] Star Name (str)
  - `ra`: `float` — [Read-Write] The Star Right Ascension in the Celestial Frame - In hours! (double)

### `unreal.SunInfo`
Inherits: `StructBase` | Header: `CelestialDataTypes.h`

Runtime structure to store the computed properties of the Sun, for any Query.

**Properties** (4):
  - `dec`: `float` — [Read-Write] The Sun Declination in the Celestial Frame - In Degrees (double)
  - `direction_toward_earth`: `Vector` — [Read-Write] Keep track of the location toward the Earth (Vector)
  - `ra`: `float` — [Read-Write] The Sun Right Ascension in the Celestial Frame - In hours! (double)
  - `ue_transform`: `Transform` — [Read-Write] Keep track of the Vault-relative transform, at ToD = 0 for the Sun (Transform)

### `unreal.CelestialMaths`
Inherits: `BlueprintFunctionLibrary` | Header: `CelestialMaths.h`

**Methods** (47):
  - `arcseconds_to_degrees(arcseconds)` -> `double` [classmethod] — Convert Arcseconds to Degrees 1 Degree = 3600 Arcseconds
  - `arcseconds_to_radians(arcseconds)` -> `double` [classmethod] — Convert Arcseconds to Radians 2 PI Rad = 360 Degrees = 360 * 3600 Arcseconds
  - `astronomical_units_to_meters(au)` -> `double` [classmethod] — Convert Astronomical Unit (UA) to meters 1 AU = 149 597 870 700 m
  - `b_vto_linear_color(bv)` -> `LinearColor` [classmethod] — Returns the RGB normalized components [0..1] from the Color Index (B-V) Value *
  - `conv_declination_to_string(dec_degrees)` -> `str` [classmethod] — Declination String Builder
  - `conv_dms_to_string(sign, degrees, minutes, seconds)` -> `str` [classmethod] — DMS String Builder
  - `conv_hms_to_string(hours, minutes, seconds)` -> `str` [classmethod] — HMS String Builder
  - `conv_planetary_body_info_to_string(planetary_body_info)` -> `str` [classmethod] — PlanetaryBodyInfo String Builder
  - `conv_right_ascension_to_string(right_ascension_hours)` -> `str` [classmethod] — Right Ascension String Builder
  - `conv_star_info_to_string(star_info)` -> `str` [classmethod] — StarInfo String Builder
  - `conv_sun_info_to_string(sun_info)` -> `str` [classmethod] — SunInfo ToString String Builder
  - `date_time_to_greenwich_mean_sidereal_time(utc_date_time)` -> `double` [classmethod] — Return the Greenwich Mean Sidereal Time (GMST) for a specific DateTime, in Degrees By definition, the provided DateTime ...
  - `days_to_seconds(days)` -> `double` [classmethod] — Days to Seconds
  - `degrees_to_arcseconds(degrees)` -> `double` [classmethod] — Convert Degrees to Arcseconds 1 Degree = 3600 Arcseconds
  - `degrees_to_dms(degrees=int32, minutes=int32, seconds=double)` [classmethod] — Convert decimal degrees to Degrees, Minutes, Seconds, with the appropriate Sign (True if Positive) *
  - `degrees_to_hms(minutes=int32, seconds=double)` [classmethod] — Convert Decimal degrees to Hours, Minutes, Seconds ( One Hour equals 15 degrees)
  - `equation_of_the_equinoxes(julian_date)` -> `double` [classmethod] — Return the nutation in right ascension ( aka the equation of the equinoxes) in Degrees This correction term is used when...
  - `geodetic_lat_lon_to_ecefxyzau(latitude, longitude, altitude)` -> `Vector` [classmethod] — Convert Geodetic Lat Lon to Geocentric XYZ position vector in ECEF coordinates, for the WGS84 Ellipsoid.
  - `get_body_celestial_coordinates_au(julian_date, planetary_body, observer_latitude, dec_degrees=double, distance_body_to_earth_au=double, distance_body_to_sun_au=double, distance_earth_to_sun_au=double)` [classmethod] — Return the location of a Planetary Body relative to the Earth, expressed in Celestial Coordinates (RA, DEC, Distance) It...
  - `get_body_location_fk5j2000_au(planetary_body, julian_date)` -> `Vector` [classmethod] — Returns the location of a specific Planetary body, in the FK5 J2000 Coordinate System
  - `get_body_location_fk5j2000_au_relativistic(observer_body_fk5j2000_location_au, planetary_body, julian_date)` -> `Vector` [classmethod] — Returns the location of a specific Planetary body, in the FK5 J2000 Coordinate System The returned Location and the Obse...
  - `get_earth_rotation_angle(julian_date)` -> `double` [classmethod] — Retrurn the Earth Rotation Angle (In Degrees) as measured by GMST (Greenwich Mean Sidereal Time) It refers to the angle ...
  - `get_illumination_percentage(normalized_age)` -> `double` [classmethod] — return the illumination factor (0..1) of a Body, considering his normalized age and the crescent effects
  - `get_leap_seconds(julian_date)` -> `double` [classmethod] — Returns the Leap Seconds for a specific Julian Date A leap second is a one-second adjustment that is occasionally applie...
  - `get_moon_normalized_age_simple(julian_date)` -> `double` [classmethod] — Returns the Moon Phase for a specific Date This is an approximate computation using a number of lunar cycles with a syno...
  - `get_observer_geocentric_location_au(latitude, longitude, altitude, julian_date)` -> `Vector` [classmethod] — Return the Geocentric position of an observer located at the Earth surface, considering the rotation at this specific Ju...
  - `get_planet_center_transform(latitude, longitude, altitude)` -> `Transform` [classmethod] — Return the Transformation to apply to a WGS84 Ellipsoid model so that its location in Lat,long,Altitude is tangent to th...
  - `get_planetary_body_magnitude(planetary_body, distance_to_sun_au, distance_to_earth_au, phase_angle=double)` [classmethod] — Return the Magnitude of a Planetary Body as seen from the Earth *
  - `get_precise_vector_string(vector, minimum_fractional_digits = 10)` -> `str` [classmethod] — Returns a String displaying a vector with a large number of digits
  - `get_speed_of_light()` -> `double` [classmethod] — Returns the Speed of Light 299 792 458 (m/s) *
  - `get_sun_information(julian_date, observer_latitude, observer_longitude)` -> `SunInfo` [classmethod] — Compute all Sun Properties for a speficic JulianDate
  - `international_atomic_time_to_terrestrial_time(tai)` -> `double` [classmethod] — Returns the Terrestrial Time in SI seconds TT = TAI + 32.184 seconds;
  - `julian_date_to_greenwich_apparent_sidereal_time(julian_date)` -> `double` [classmethod] — Return the Greenwich Apparent Sidereal Time (GAST) for a specific UTC DateTime, in Degrees. The Greenwich apparent sider...
  - `julian_date_to_greenwich_mean_sidereal_time(julian_date)` -> `double` [classmethod] — Return the Greenwich Mean Sidereal Time (GMST) for a specific Julian Date, In Degrees
  - `julian_date_to_international_atomic_time(julian_date)` -> `double` [classmethod] — Returns the International Atomic Time in SI seconds TAI = GetLeapSeconds(JulianDate) + DaysToSeconds(JulianDate);
  - `julian_date_to_julian_centuries(julian_date)` -> `double` [classmethod] — Returns the Julien Centuries Julian Centuries = (JulianDate - 2451545.0) / 36525.0
  - `julian_date_to_utc_date_time(julian_date)` -> `DateTime` [classmethod] — Return the UTC Time for a specific Julian Date *
  - `local_sideral_time(longitude_degrees, greenwich_mean_sideral_time)` -> `double` [classmethod] — Return the Sidereal Time for a specific Longitude and GMST *
  - `local_time_to_utc_time(local_time, time_zone_offset, is_dst)` -> `DateTime` [classmethod] — Return the UTC for a specific Local Time, using the TimeZone and Daylight Saving Information *
  - `meters_to_astronomical_units(meters)` -> `double` [classmethod] — Convert meters to Astronomical Unit (UA) 1 AU = 149 597 870 700 m
  - `mod_positive(value, modulo)` -> `double` [classmethod] — Special Mod function that makes sure to always return positive values
  - `nutation2000b_truncated(delta_epsilon=double)` [classmethod] — Approximation of the IAU2000A/B nutation model used in the Equation Of The Equinoxes, accurate enough for VSOP87 computa...
  - `radec_to_xyz_rh(ra_degrees, dec_degrees, radius)` -> `Vector` [classmethod] — Convert Polar Coordinates to Cartesian Coordinates, using a Righ-Handed Frame
  - `seconds_to_day(seconds)` -> `double` [classmethod] — Seconds to Day
  - `utc_date_time_to_julian_date(utc_date_time)` -> `double` [classmethod] — Return the Julian Date for a specific UTC Time *
  - `utc_time_to_local_time(utc_time, time_zone_offset, is_dst)` -> `DateTime` [classmethod] — Return the UTC for a specific Time, using the TimeZone and Daylight Saving Information *
  - `xyz_to_radec_rh(dec_degrees=double, radius=double)` [classmethod] — Convert Cartesian Coordinates to Polar Coordinates, using a Righ-Handed Frame

### `unreal.CelestialVaultDaySequenceActor`
Inherits: `DaySequenceActor` | Header: `CelestialVaultDaySequenceActor.h`

Celestial Vault Day Sequence Actor

**Methods** (8):
  - `get_closest_planetary_body(start_position, lookup_direction, threshold_angle_degree)` -> `(found_planetary_body_info=PlanetaryBodyInfo, body_transform=Transform) or None` — Return the Celestial Information of the Planetary Body (moon, planet) closest to a specific direction, within an angle t...
  - `get_closest_star_info(observer_location, lookup_direction, threshold_angle_degree)` -> `(found_star_info=StarInfo, star_transform=Transform) or None` — Return the Celestial Information of the Star closest to a specific direction, within an angle threshold
  - `get_date()` -> `DateTime` — Returns the current defined day, without any Time, because the Time will be controlled by the DaySequence Time of day - ...
  - `get_moon_info(julian_date)` -> `PlanetaryBodyInfo` — Returns the Celestial Info for the Moon, at a specific Julian Date
  - `get_planetary_body_by_orbit_type(orbit_type)` -> `(found_planetary_body_info=PlanetaryBodyInfo, body_transform=Transform) or None` — Return the Celestial Information of a specific Planetary Body (by its orbit type)
  - `get_sun_info(julian_date)` -> `SunInfo` — Returns the Celestial Info for the Sun, at a specific Julian Date
  - `rebuild_all()` -> `None` — Rebuild All
  - `set_moon_disc_age(moon_age)` -> `None` — Manually set the Moon Age (Phase)

**Properties** (39):
  - `celestial_star_catalog`: `DataTable` — [Read-Write] A Datatable containing a Celestial Star Catalog data (DataTable)
  - `celestial_vault_component`: `SceneComponent` [Read-Only] — [Read-Only] (SceneComponent)
  - `celestial_vault_distance`: `float` — [Read-Write] We generate the sky elements the âPlatonâ way, using a sphere surrounding the Earth...
  - `day`: `int` — [Read-Write] Current Day (int32)
  - `deep_sky_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] (StaticMeshComponent)
  - `fictional_star_catalog`: `DataTable` — [Read-Write] A Datatable containing a Fictional Star Catalog data (DataTable)
  - `gmst_at_tod_0`: `float` [Read-Only] — [Read-Only] Greenwich Mean Sidereal Time at corresponding to a 0 Time of Day (midnight in the mornin...
  - `gmt_time_zone`: `float` — [Read-Write] Current Time Zone (double)
  - `is_daylight_savings`: `bool` — [Read-Write] Set to true if your current date is during the DST period (bool)
  - `keep_planets_infos`: `bool` — [Read-Write] If true, the Stars information will be kept in memory and queryable at runtime (bool)
  - `keep_stars_info`: `bool` — [Read-Write] If true, the Stars information will be kept in memory and queryable at runtime (bool)
  - `latitude`: `float` — [Read-Write] Latitude of Level Origin on planet (double)
  - `longitude`: `float` — [Read-Write] Longitude of Level Origin on planet (double)
  - `max_visible_magnitude`: `float` — [Read-Write] All stars from the catalog with a Magnitude dimmer than this threshold wonât be gener...
  - `month`: `int` — [Read-Write] Current Month (int32)
  - `moon_body_info`: `PlanetaryBodyInfo` [Read-Only] — [Read-Only] Celestial Info for the Moon, at the beginning of the Day (PlanetaryBodyInfo)
  - `moon_disc_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] (StaticMeshComponent)
  - `moon_light_component`: `DirectionalLightComponent` [Read-Only] — [Read-Only] (DirectionalLightComponent)
  - `moon_light_intensity`: `float` — [Read-Write] Base Moonlight Intensity (for Full Moon)
Typically 0.1 Lux, up to 0.32 Lux when the moo...
  - `moon_scale`: `float` — [Read-Write] Factor to artificially increase the Moon size (float)
  - `moon_vault_percentage`: `float` — [Read-Write] Percentage of the CelestialVaultDistance at which the Moons are created (double)
  - `planet_center_component`: `SceneComponent` [Read-Only] — [Read-Only] (SceneComponent)
  - `planet_center_transform`: `Transform` [Read-Only] — [Read-Only] Transform to apply to the planet to have it located tangent to the Origin (Transform)
  - `planets_catalog`: `DataTable` — [Read-Write] The Data Catalog containing all Planets data (DataTable)
  - `planets_component`: `InstancedStaticMeshComponent` [Read-Only] — [Read-Only] (InstancedStaticMeshComponent)
  - `planets_infos`: `None` [Read-Only] — [Read-Only] Array of the created planetary bodies, with all their computed information - Only popula...
  - `planets_scale`: `float` — [Read-Write] Factor to artificially increase the Planetary bodies size (float)
  - `planets_vault_percentage`: `float` — [Read-Write] Percentage of the CelestialVaultDistance at which the Planets are created (double)
  - `sky_atmosphere_component`: `SkyAtmosphereComponent` [Read-Only] — [Read-Only] (SkyAtmosphereComponent)
  - `sky_light_component`: `SkyLightComponent` [Read-Only] — [Read-Only] (SkyLightComponent)
  - `stars_component`: `InstancedStaticMeshComponent` [Read-Only] — [Read-Only] (InstancedStaticMeshComponent)
  - `stars_info`: `None` [Read-Only] — [Read-Only] Array of the created Stars information - Only populated if KeepStarsInfo is true (Array[...
  - `stars_vault_percentage`: `float` — [Read-Write] Percentage of the CelestialVaultDistance at which the Stars are created (double)
  - `sun_info`: `SunInfo` [Read-Only] — [Read-Only] Celestial Info for the Sun, at the beginning of the Day (SunInfo)
  - `sun_light_component`: `DirectionalLightComponent` [Read-Only] — [Read-Only] (DirectionalLightComponent)
  - `sun_light_intensity`: `float` — [Read-Write] Base Sun Intensity
Typically 120000 Lux (float)
  - `use_current_date`: `bool` — [Read-Write] If true, ignore the Year Month Day value and use the current system Date (bool)
  - `volumetric_cloud_component`: `VolumetricCloudComponent` [Read-Only] — [Read-Only] TODO - Should HeightFog be optional because it doesnât work round earth when far from ...
  - `year`: `int` — [Read-Write] Current Year (int32)

### `unreal.OrbitType`
Inherits: `EnumBase` | Header: `CelestialDataTypes.h`

Any celestial body with an Elliptic Orbit type will have to provide the elliptic parameters Other will use the solar system VSOP87 computations for their location

**Properties** (10):
  - `EARTH`: `OrbitType = Ellipsis` — 3
  - `ELLIPTIC`: `OrbitType = Ellipsis` — 0
  - `JUPITER`: `OrbitType = Ellipsis` — 5
  - `MARS`: `OrbitType = Ellipsis` — 4
  - `MERCURY`: `OrbitType = Ellipsis` — 1
  - `MOON`: `OrbitType = Ellipsis` — 9
  - `NEPTUNE`: `OrbitType = Ellipsis` — 8
  - `SATURN`: `OrbitType = Ellipsis` — 6
  - `URANUS`: `OrbitType = Ellipsis` — 7
  - `VENUS`: `OrbitType = Ellipsis` — 2
