# UE Python API — Fab Module

**7 types** from the `Fab` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MegascanMaterialPair`, `InterchangeInstancedFoliageTypeFactory`, `InterchangeInstancedFoliageTypeFactoryNode`, `InterchangeMegascansPipeline`, `MegascansMaterialParentSettings`, `MegascanImportType`, `MegascanMaterialType`

---

## Classes

### `unreal.MegascanMaterialPair`
Inherits: `StructBase` | Header: `InterchangeMegascansPipeline.h`

Megascan Material Pair

### `unreal.InterchangeInstancedFoliageTypeFactory`
Inherits: `InterchangeFactoryBase` | Header: `InterchangeInstancedFoliageTypeFactory.h`

Interchange Instanced Foliage Type Factory

### `unreal.InterchangeInstancedFoliageTypeFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeInstancedFoliageTypeFactoryNode.h`

Interchange Instanced Foliage Type Factory Node

**Methods** (20):
  - `get_custom_affect_distance_field_lighting()` -> `bool or None` — Get Custom Affect Distance Field Lighting
  - `get_custom_align_to_normal()` -> `bool or None` — Get Custom Align to Normal
  - `get_custom_random_pitch_angle()` -> `float or None` — Get Custom Random Pitch Angle
  - `get_custom_random_yaw()` -> `bool or None` — Get Custom Random Yaw
  - `get_custom_scale_x()` -> `Vector2f or None` — Get Custom Scale X
  - `get_custom_scale_y()` -> `Vector2f or None` — Get Custom Scale Y
  - `get_custom_scale_z()` -> `Vector2f or None` — Get Custom Scale Z
  - `get_custom_scaling()` -> `FoliageScaling or None` — Get Custom Scaling
  - `get_custom_static_mesh()` -> `str or None` — Get Custom Static Mesh
  - `get_custom_world_position_offset_disable_distance()` -> `int32 or None` — Get Custom World Position Offset Disable Distance
  - `set_custom_affect_distance_field_lighting(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Affect Distance Field Lighting
  - `set_custom_align_to_normal(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Align to Normal
  - `set_custom_random_pitch_angle(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Random Pitch Angle
  - `set_custom_random_yaw(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Random Yaw
  - `set_custom_scale_x(attribute_value)` -> `bool` — Set Custom Scale X
  - `set_custom_scale_y(attribute_value)` -> `bool` — Set Custom Scale Y
  - `set_custom_scale_z(attribute_value)` -> `bool` — Set Custom Scale Z
  - `set_custom_scaling(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Scaling
  - `set_custom_static_mesh(attribute_value)` -> `bool` — Set Custom Static Mesh
  - `set_custom_world_position_offset_disable_distance(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom World Position Offset Disable Distance

### `unreal.InterchangeMegascansPipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeMegascansPipeline.h`

Interchange Megascans Pipeline

**Properties** (2):
  - `megascan_import_type`: `MegascanImportType` — [Read-Write] (MegascanImportType)
  - `megascans_material_parent_settings`: `MegascansMaterialParentSettings` [Read-Only] — [Read-Only] (MegascansMaterialParentSettings)

### `unreal.MegascansMaterialParentSettings`
Inherits: `DeveloperSettings` | Header: `InterchangeMegascansPipeline.h`

Megascans Material Parent Settings

### `unreal.MegascanImportType`
Inherits: `EnumBase` | Header: `InterchangeMegascansPipeline.h`

EMegascan Import Type

**Properties** (5):
  - `DECAL`: `MegascanImportType = Ellipsis` — 2
  - `IMPERFECTION`: `MegascanImportType = Ellipsis` — 3
  - `MODEL3D`: `MegascanImportType = Ellipsis` — 0
  - `PLANT`: `MegascanImportType = Ellipsis` — 4
  - `SURFACE`: `MegascanImportType = Ellipsis` — 1

### `unreal.MegascanMaterialType`
Inherits: `EnumBase` | Header: `InterchangeMegascansPipeline.h`

EMegascan Material Type

**Properties** (14):
  - `BASE`: `MegascanMaterialType = Ellipsis` — 1
  - `BASE_FUZZ`: `MegascanMaterialType = Ellipsis` — 3
  - `BASE_MASKED`: `MegascanMaterialType = Ellipsis` — 2
  - `BASE_TRANSMISSION`: `MegascanMaterialType = Ellipsis` — 4
  - `DECAL`: `MegascanMaterialType = Ellipsis` — 12
  - `FABRIC`: `MegascanMaterialType = Ellipsis` — 10
  - `FABRIC_MASKED`: `MegascanMaterialType = Ellipsis` — 11
  - `GLASS`: `MegascanMaterialType = Ellipsis` — 5
  - `PLANT`: `MegascanMaterialType = Ellipsis` — 13
  - `PLANT_BILLBOARD`: `MegascanMaterialType = Ellipsis` — 14
  - `SURFACE`: `MegascanMaterialType = Ellipsis` — 6
  - `SURFACE_FUZZ`: `MegascanMaterialType = Ellipsis` — 8
  - `SURFACE_MASKED`: `MegascanMaterialType = Ellipsis` — 7
  - `SURFACE_TRANSMISSION`: `MegascanMaterialType = Ellipsis` — 9
