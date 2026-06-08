# UE Python API — LocationServicesBPLibrary Module

**5 types** from the `LocationServicesBPLibrary` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LocationServicesData`, `LocationServices`, `LocationServicesImpl`, `LocationAccuracy`, `LocationServicesData_OnLocationChanged`

---

## Classes

### `unreal.LocationServicesData`
Inherits: `StructBase` | Header: `LocationServicesBPLibrary.h`

Struct to hold relevant location data retrieved from the mobile implementationâs Location Service

**Properties** (6):
  - `altitude`: `float` — [Read-Write] In meters, if provided with the result (float)
  - `horizontal_accuracy`: `float` — overall) accuracy of the result, in meters (float) [Read-Write] Estimated horizontal (Android
  - `latitude`: `float` — [Read-Write] (float)
  - `longitude`: `float` — [Read-Write] (float)
  - `timestamp`: `float` — [Read-Write] Timestamp from when this location data was taken (UTC time in milliseconds since 1 Janu...
  - `vertical_accuracy`: `float` — [Read-Write] Estimated accuracy of the result, in meters (iOS only) (float)

### `unreal.LocationServices`
Inherits: `BlueprintFunctionLibrary` | Header: `LocationServicesBPLibrary.h`

Location Services

**Methods** (7):
  - `are_location_services_enabled()` -> `bool` [classmethod] — Checks if the Location Services on the mobile device are enabled for this application
  - `get_last_known_location()` -> `LocationServicesData` [classmethod] — Returns the last location information returned by the location service. If no location update has been made, will return...
  - `get_location_services_impl()` -> `LocationServicesImpl` [classmethod]
  - `init_location_services(accuracy, update_frequency, min_distance_filter)` -> `bool` [classmethod] — Called to set up the Location Service before use
  - `is_location_accuracy_available(accuracy)` -> `bool` [classmethod] — Checks if the supplied Accuracy is available on the current device.
  - `start_location_services()` -> `bool` [classmethod] — Starts requesting location updates from the appropriate Location Service
  - `stop_location_services()` -> `bool` [classmethod] — Stops the updates of location from the Location Service that was started with StartLocationService

### `unreal.LocationServicesImpl`
Inherits: `Object` | Header: `LocationServicesImpl.h`

Location Services Impl

**Properties** (1):
  - `on_location_changed`: `LocationServicesData_OnLocationChanged` — [Read-Write] (LocationServicesData_OnLocationChanged)

### `unreal.LocationAccuracy`
Inherits: `EnumBase` | Header: `LocationServicesBPLibrary.h`

Enum used to determine what accuracy the Location Services should be run with. Based off the iOS kCLLocationAccuracy enums since those were the most restrictive (but convienently also had descriptive ...

**Properties** (6):
  - `LA_BEST`: `LocationAccuracy = Ellipsis` — 4
  - `LA_HUNDRED_METERS`: `LocationAccuracy = Ellipsis` — 2
  - `LA_NAVIGATION`: `LocationAccuracy = Ellipsis` — 5
  - `LA_ONE_KILOMETER`: `LocationAccuracy = Ellipsis` — 1
  - `LA_TEN_METERS`: `LocationAccuracy = Ellipsis` — 3
  - `LA_THREE_KILOMETERS`: `LocationAccuracy = Ellipsis` — 0

### `unreal.LocationServicesData_OnLocationChanged`
Inherits: `MulticastDelegateBase` | Header: `LocationServicesBPLibrary.h`

Location Services Data on Location Changed Delegate Signature
