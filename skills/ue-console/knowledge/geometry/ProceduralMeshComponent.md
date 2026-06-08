# UE Python API — ProceduralMeshComponent Module

**5 types** from the `ProceduralMeshComponent` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ProcMeshTangent`, `ProcMeshVertex`, `ProceduralMeshComponent`, `ProceduralMeshLibrary`, `ProcMeshSliceCapOption`

---

## Classes

### `unreal.ProcMeshTangent`
Inherits: `StructBase` | Header: `ProceduralMeshComponent.h`

Struct used to specify a tangent vector for a vertex The Y tangent is computed from the cross product of the vertex normal (Tangent Z) and the TangentX member.

**Properties** (2):
  - `flip_tangent_y`: `bool` — [Read-Write] Bool that indicates whether we should flip the Y tangent when we compute it using cross...
  - `tangent_x`: `Vector` — [Read-Write] Direction of X tangent for this vertex (Vector)

### `unreal.ProcMeshVertex`
Inherits: `StructBase` | Header: `ProceduralMeshComponent.h`

One vertex for the procedural mesh, used for storing data internally

**Properties** (8):
  - `color`: `Color` — [Read-Write] Vertex color (Color)
  - `normal`: `Vector` — [Read-Write] Vertex normal (Vector)
  - `position`: `Vector` — [Read-Write] Vertex position (Vector)
  - `tangent`: `ProcMeshTangent` — [Read-Write] Vertex tangent (ProcMeshTangent)
  - `uv0`: `Vector2D` — [Read-Write] Vertex texture co-ordinate (Vector2D)
  - `uv1`: `Vector2D` — [Read-Write] Vertex texture co-ordinate (Vector2D)
  - `uv2`: `Vector2D` — [Read-Write] Vertex texture co-ordinate (Vector2D)
  - `uv3`: `Vector2D` — [Read-Write] Vertex texture co-ordinate (Vector2D)

### `unreal.ProceduralMeshComponent`
Inherits: `MeshComponent` | Header: `ProceduralMeshComponent.h`

Component that allows you to specify custom triangle mesh geometry Beware! This feature is experimental and may be substantially changed in future releases.

**Methods** (11):
  - `add_collision_convex_mesh(convex_verts)` -> `None` — Add simple collision convex to this component
  - `clear_all_mesh_sections()` -> `None` — Clear all mesh sections and reset to empty state
  - `clear_collision_convex_meshes()` -> `None` — Remove collision meshes from this component
  - `clear_mesh_section(section_index)` -> `None` — Clear a section of the procedural mesh. Other sections do not change index.
  - `create_mesh_section(section_index, vertices, triangles, normals, uv0, vertex_colors, tangents, create_collision)` -> `None` — Create/replace a section for this procedural mesh component. This function is deprecated for Blueprints because it uses ...
  - `create_mesh_section_linear_color(section_index, vertices, triangles, normals, uv0, uv1, uv2, uv3, vertex_colors, tangents, create_collision, srgb_conversion = False)` -> `None` — Create/replace a section for this procedural mesh component.
  - `get_num_sections()` -> `int32` — Returns number of sections currently created for this component
  - `is_mesh_section_visible(section_index)` -> `bool` — Returns whether a particular section is currently visible
  - `set_mesh_section_visible(section_index, new_visibility)` -> `None` — Control visibility of a particular section
  - `update_mesh_section(section_index, vertices, normals, uv0, vertex_colors, tangents)` -> `None` — Updates a section of this procedural mesh component. This is faster than CreateMeshSection, but does not let you change ...
  - `update_mesh_section_linear_color(section_index, vertices, normals, uv0, uv1, uv2, uv3, vertex_colors, tangents, srgb_conversion = True)` -> `None` — Updates a section of this procedural mesh component. This is faster than CreateMeshSection, but does not let you change ...

**Properties** (2):
  - `use_async_cooking`: `bool` [Read-Only] — [Read-Only] Controls whether the physics cooking should be done off the game thread. This should be ...
  - `use_complex_as_simple_collision`: `bool` [Read-Only] — [Read-Only] Controls whether the complex (Per poly) geometry should be treated as âsimpleâ colli...

### `unreal.ProceduralMeshLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `KismetProceduralMeshLibrary.h`

Kismet Procedural Mesh Library

**Methods** (10):
  - `calculate_tangents_for_mesh()` [classmethod] — Automatically generate normals and tangent vectors for a mesh UVs are required for correct tangent generation.
  - `convert_quad_to_triangles(triangles, vert0, vert1, vert2, vert3)` -> `Array [ int32 ]` [classmethod] — Add a quad, specified by four indices, to a triangle index buffer as two triangles.
  - `copy_procedural_mesh_from_static_mesh_component(static_mesh_component, lod_index, proc_mesh_component, create_collision)` -> `None` [classmethod] — Copy materials from StaticMeshComponent to ProceduralMeshComponent.
  - `create_grid_mesh_split()` [classmethod] — Generate a vertex buffer, index buffer and UVs for a grid mesh where each quad is split, with standard 0-1 UVs on UV0 an...
  - `create_grid_mesh_triangles(num_x, num_y, winding)` -> `Array [ int32 ]` [classmethod] — Generate an index buffer for a grid of quads. out: Triangles Output index buffer
  - `create_grid_mesh_welded()` [classmethod] — Generate a vertex buffer, index buffer and UVs for a tessellated grid mesh. out: Triangles Output index buffer out: Vert...
  - `generate_box_mesh()` [classmethod] — Generate vertex and index buffer for a simple box, given the supplied dimensions. Normals, UVs and tangents are also gen...
  - `get_section_from_procedural_mesh()` [classmethod] — Grab geometry data from a ProceduralMeshComponent.
  - `get_section_from_static_mesh()` [classmethod] — Grab geometry data from a StaticMesh asset.
  - `slice_procedural_mesh(proc_mesh, plane_position, plane_normal, create_other_half, cap_option, cap_material)` -> `ProceduralMeshComponent` [classmethod] — Slice the ProceduralMeshComponent (including simple convex collision) using a plane. Optionally create âcapâ geometr...

### `unreal.ProcMeshSliceCapOption`
Inherits: `EnumBase` | Header: `KismetProceduralMeshLibrary.h`

Options for creating cap geometry when slicing

**Properties** (3):
  - `CREATE_NEW_SECTION_FOR_CAP`: `ProcMeshSliceCapOption = Ellipsis` — Add a new section to ProceduralMesh for cap 1
  - `NO_CAP`: `ProcMeshSliceCapOption = Ellipsis` — Do not create cap geometry 0
  - `USE_LAST_SECTION_FOR_CAP`: `ProcMeshSliceCapOption = Ellipsis` — Add cap geometry to existing last section 2
