# UE Python API — WorldPartitionHLODUtilities Module

**5 types** from the `WorldPartitionHLODUtilities` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `HLODBuilderInstancingSettings`, `HLODBuilderMeshApproximateSettings`, `HLODBuilderMeshMergeSettings`, `HLODBuilderMeshSimplifySettings`, `InstanceFilteringType`

---

## Classes

### `unreal.HLODBuilderInstancingSettings`
Inherits: `HLODBuilderSettings` | Header: `HLODBuilderInstancing.h`

HLODBuilder Instancing Settings

**Properties** (5):
  - `disallow_nanite`: `bool` — [Read-Write] If enabled, the components created for the HLODs will not use Nanite.
Necessary if you ...
  - `instance_filtering_type`: `InstanceFilteringType` — [Read-Write] Type of filtering to apply to instances. Instances that do not pass the filter will be ...
  - `minimum_area`: `float` — [Read-Write] Minimum area in square Unreal Units (double)
  - `minimum_extent`: `float` — [Read-Write] Minimum Extent in Unreal Units (double)
  - `minimum_volume`: `float` — [Read-Write] Minimum volume in cubic Unreal Units (double)

### `unreal.HLODBuilderMeshApproximateSettings`
Inherits: `HLODBuilderSettings` | Header: `HLODBuilderMeshApproximate.h`

HLODBuilder Mesh Approximate Settings

### `unreal.HLODBuilderMeshMergeSettings`
Inherits: `HLODBuilderSettings` | Header: `HLODBuilderMeshMerge.h`

HLODBuilder Mesh Merge Settings

### `unreal.HLODBuilderMeshSimplifySettings`
Inherits: `HLODBuilderSettings` | Header: `HLODBuilderMeshSimplify.h`

HLODBuilder Mesh Simplify Settings

### `unreal.InstanceFilteringType`
Inherits: `EnumBase` | Header: `HLODBuilderInstancing.h`

EInstance Filtering Type

**Properties** (4):
  - `FILTER_MINIMUM_AREA`: `InstanceFilteringType = Ellipsis` — 2
  - `FILTER_MINIMUM_EXTENT`: `InstanceFilteringType = Ellipsis` — 1
  - `FILTER_MINIMUM_VOLUME`: `InstanceFilteringType = Ellipsis` — 3
  - `FILTER_NONE`: `InstanceFilteringType = Ellipsis` — 0
