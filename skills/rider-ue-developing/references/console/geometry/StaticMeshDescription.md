# UE Python API — StaticMeshDescription Module

**2 types** from the `StaticMeshDescription` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `UVMapSettings`, `StaticMeshDescription`

---

## Classes

### `unreal.UVMapSettings`
Inherits: `StructBase` | Header: `UVMapSettings.h`

UV map generation settings that are exposed to the user for scripting and through the editor

**Properties** (5):
  - `position`: `Vector` — [Read-Write] Position of the UV mapping gizmo (Vector)
  - `rotation`: `Rotator` — [Read-Write] Rotation of the UV mapping gizmo (angles in degrees) (Rotator)
  - `scale`: `Vector` — [Read-Write] Scale of the UV mapping gizmo (Vector)
  - `size`: `Vector` — [Read-Write] Length, width, height of the UV mapping gizmo (Vector)
  - `uv_tile`: `Vector2D` — [Read-Write] Tiling of the UV mapping (Vector2D)

### `unreal.StaticMeshDescription`
Inherits: `MeshDescriptionBase` | Header: `StaticMeshDescription.h`

A wrapper for MeshDescription, customized for static meshes

**Methods** (4):
  - `create_cube(center, half_extents, polygon_id_minus_x=PolygonID, polygon_id_plus_y=PolygonID, polygon_id_minus_y=PolygonID, polygon_id_plus_z=PolygonID, polygon_id_minus_z=PolygonID)` — Create Cube
  - `get_vertex_instance_uv(vertex_instance_id, uv_index = 0)` -> `Vector2D` — Get Vertex Instance UV
  - `set_polygon_group_material_slot_name(polygon_group_id, slot_name)` -> `None` — Set Polygon Group Material Slot Name
  - `set_vertex_instance_uv(vertex_instance_id, uv, uv_index = 0)` -> `None` — Set Vertex Instance UV
