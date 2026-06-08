# UE Python API — SourceFilteringTrace Module

**3 types** from the `SourceFilteringTrace` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataSourceFilter`, `DataSourceFilterSet`, `EmptySourceFilter`

---

## Classes

### `unreal.DataSourceFilter`
Inherits: `Object` | Header: `DataSourceFilter.h`

Data Source Filter

**Methods** (3):
  - `does_actor_pass_filter(actor)` -> `bool` — Does Actor Pass Filter
  - `get_display_text()` -> `Text` — Get Display Text
  - `get_tool_tip_text()` -> `Text` — Get Tool Tip Text

**Properties** (1):
  - `configuration`: `DataSourceFilterConfiguration` [Read-Only] — [Read-Only] Filter specific settings (DataSourceFilterConfiguration)

### `unreal.DataSourceFilterSet`
Inherits: `DataSourceFilter` | Header: `DataSourceFilterSet.h`

Engine implementation of IDataSourceFilterSetInterface

### `unreal.EmptySourceFilter`
Inherits: `DataSourceFilter` | Header: `EmptySourceFilter.h`

Source filter implementation used to replace filter instance whoâs UClass is not loaded and or does not exist, primarily used by Filter Preset loading
