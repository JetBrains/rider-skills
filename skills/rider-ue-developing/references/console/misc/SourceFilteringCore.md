# UE Python API — SourceFilteringCore Module

**3 types** from the `SourceFilteringCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataSourceFilterConfiguration`, `DataSourceFilterInterface`, `DataSourceFilterSetInterface`

---

## Classes

### `unreal.DataSourceFilterConfiguration`
Inherits: `StructBase` | Header: `IDataSourceFilterInterface.h`

Data Source Filter Configuration

**Properties** (3):
  - `can_run_asynchronously`: `bool` [Read-Only] — [Read-Only] Flag whether or not this filter does not rely on gamethread only data, and therefore can...
  - `filter_applying_tick_interval`: `int` [Read-Only] — [Read-Only] Interval, in frames, between applying the filter. The resulting value is cached for inte...
  - `only_apply_during_actor_spawn`: `bool` [Read-Only] — [Read-Only] Flag whether or not this filter should only applied once, whenever an actor is spawned (...

### `unreal.DataSourceFilterInterface`
Inherits: `Interface` | Header: `IDataSourceFilterInterface.h`

Data Source Filter Interface

**Methods** (2):
  - `get_display_text()` -> `Text` — Get Display Text
  - `get_tool_tip_text()` -> `Text` — Get Tool Tip Text

### `unreal.DataSourceFilterSetInterface`
Inherits: `Interface` | Header: `IDataSourceFilterSetInterface.h`

Data Source Filter Set Interface
