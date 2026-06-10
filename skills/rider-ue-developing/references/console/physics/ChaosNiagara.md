# UE Python API — ChaosNiagara Module

**8 types** from the `ChaosNiagara` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataSortTypeEnum`, `DataSourceTypeEnum`, `DebugTypeEnum`, `LocationFilteringModeEnum`, `LocationXToSpawnEnum`, `LocationYToSpawnEnum`, `LocationZToSpawnEnum`, `RandomVelocityGenerationTypeEnum`

---

## Classes

### `unreal.DataSortTypeEnum`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceChaosDestruction.h`

EData Sort Type Enum

**Properties** (4):
  - `CHAOS_NIAGARA_DATA_SORT_TYPE_NO_SORTING`: `DataSortTypeEnum = Ellipsis` — 0
  - `CHAOS_NIAGARA_DATA_SORT_TYPE_RANDOM_SHUFFLE`: `DataSortTypeEnum = Ellipsis` — 1
  - `CHAOS_NIAGARA_DATA_SORT_TYPE_SORT_BY_MASS_MAX_TO_MIN`: `DataSortTypeEnum = Ellipsis` — 2
  - `CHAOS_NIAGARA_DATA_SORT_TYPE_SORT_BY_MASS_MIN_TO_MAX`: `DataSortTypeEnum = Ellipsis` — 3

### `unreal.DataSourceTypeEnum`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceChaosDestruction.h`

EData Source Type Enum

**Properties** (3):
  - `CHAOS_NIAGARA_DATA_SOURCE_TYPE_BREAKING`: `DataSourceTypeEnum = Ellipsis` — 1
  - `CHAOS_NIAGARA_DATA_SOURCE_TYPE_COLLISION`: `DataSourceTypeEnum = Ellipsis` — 0
  - `CHAOS_NIAGARA_DATA_SOURCE_TYPE_TRAILING`: `DataSourceTypeEnum = Ellipsis` — 2

### `unreal.DebugTypeEnum`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceChaosDestruction.h`

EDebug Type Enum

**Properties** (3):
  - `CHAOS_NIAGARA_DEBUG_TYPE_COLOR_BY_PARTICLE_INDEX`: `DebugTypeEnum = Ellipsis` — 2
  - `CHAOS_NIAGARA_DEBUG_TYPE_COLOR_BY_SOLVER`: `DebugTypeEnum = Ellipsis` — 1
  - `CHAOS_NIAGARA_DEBUG_TYPE_NO_DEBUG`: `DebugTypeEnum = Ellipsis` — 0

### `unreal.LocationFilteringModeEnum`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceChaosDestruction.h`

ELocation Filtering Mode Enum

**Properties** (2):
  - `CHAOS_NIAGARA_LOCATION_FILTERING_MODE_EXCLUSIVE`: `LocationFilteringModeEnum = Ellipsis` — 1
  - `CHAOS_NIAGARA_LOCATION_FILTERING_MODE_INCLUSIVE`: `LocationFilteringModeEnum = Ellipsis` — 0

### `unreal.LocationXToSpawnEnum`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceChaosDestruction.h`

ELocation XTo Spawn Enum

**Properties** (4):
  - `CHAOS_NIAGARA_LOCATION_X_TO_SPAWN_MAX`: `LocationXToSpawnEnum = Ellipsis` — 2
  - `CHAOS_NIAGARA_LOCATION_X_TO_SPAWN_MIN`: `LocationXToSpawnEnum = Ellipsis` — 1
  - `CHAOS_NIAGARA_LOCATION_X_TO_SPAWN_MIN_MAX`: `LocationXToSpawnEnum = Ellipsis` — 3
  - `CHAOS_NIAGARA_LOCATION_X_TO_SPAWN_NONE`: `LocationXToSpawnEnum = Ellipsis` — 0

### `unreal.LocationYToSpawnEnum`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceChaosDestruction.h`

ELocation YTo Spawn Enum

**Properties** (4):
  - `CHAOS_NIAGARA_LOCATION_Y_TO_SPAWN_MAX`: `LocationYToSpawnEnum = Ellipsis` — 2
  - `CHAOS_NIAGARA_LOCATION_Y_TO_SPAWN_MIN`: `LocationYToSpawnEnum = Ellipsis` — 1
  - `CHAOS_NIAGARA_LOCATION_Y_TO_SPAWN_MIN_MAX`: `LocationYToSpawnEnum = Ellipsis` — 3
  - `CHAOS_NIAGARA_LOCATION_Y_TO_SPAWN_NONE`: `LocationYToSpawnEnum = Ellipsis` — 0

### `unreal.LocationZToSpawnEnum`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceChaosDestruction.h`

ELocation ZTo Spawn Enum

**Properties** (4):
  - `CHAOS_NIAGARA_LOCATION_Z_TO_SPAWN_MAX`: `LocationZToSpawnEnum = Ellipsis` — 2
  - `CHAOS_NIAGARA_LOCATION_Z_TO_SPAWN_MIN`: `LocationZToSpawnEnum = Ellipsis` — 1
  - `CHAOS_NIAGARA_LOCATION_Z_TO_SPAWN_MIN_MAX`: `LocationZToSpawnEnum = Ellipsis` — 3
  - `CHAOS_NIAGARA_LOCATION_Z_TO_SPAWN_NONE`: `LocationZToSpawnEnum = Ellipsis` — 0

### `unreal.RandomVelocityGenerationTypeEnum`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceChaosDestruction.h`

ERandom Velocity Generation Type Enum

**Properties** (3):
  - `CHAOS_NIAGARA_RANDOM_VELOCITY_GENERATION_TYPE_COLLISION_NORMAL_BASED`: `RandomVelocityGenerationTypeEnum = Ellipsis` — 2
  - `CHAOS_NIAGARA_RANDOM_VELOCITY_GENERATION_TYPE_RANDOM_DISTRIBUTION`: `RandomVelocityGenerationTypeEnum = Ellipsis` — 0
  - `CHAOS_NIAGARA_RANDOM_VELOCITY_GENERATION_TYPE_RANDOM_DISTRIBUTION_WITH_STREAMERS`: `RandomVelocityGenerationTypeEnum = Ellipsis` — 1
