# UE Python API — MeshDescription Module

**9 types** from the `MeshDescription` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `EdgeID`, `ElementID`, `PolygonGroupID`, `PolygonID`, `TriangleID`, `UVID`, `VertexID`, `VertexInstanceID`, `MeshDescriptionBase`

---

## Classes

### `unreal.EdgeID`
Inherits: `ElementID` | Header: `MeshTypes.h`

Edge ID

### `unreal.ElementID`
Inherits: `StructBase` | Header: `MeshTypes.h`

todo: mesheditor: Need comments todo: mesheditor script: BP doesnât have name spaces, so we might need a more specific display name, or just rename our various types

**Properties** (1):
  - `id_value`: `int` [Read-Only] — [Read-Only] The actual mesh element index this ID represents.  Read-only. (int32)

### `unreal.PolygonGroupID`
Inherits: `ElementID` | Header: `MeshTypes.h`

Polygon Group ID

### `unreal.PolygonID`
Inherits: `ElementID` | Header: `MeshTypes.h`

Polygon ID

### `unreal.TriangleID`
Inherits: `ElementID` | Header: `MeshTypes.h`

Triangle ID

### `unreal.UVID`
Inherits: `ElementID` | Header: `MeshTypes.h`

### `unreal.VertexID`
Inherits: `ElementID` | Header: `MeshTypes.h`

Vertex ID

### `unreal.VertexInstanceID`
Inherits: `ElementID` | Header: `MeshTypes.h`

Vertex Instance ID

### `unreal.MeshDescriptionBase`
Inherits: `Object` | Header: `MeshDescriptionBase.h`

Mesh Description Base

**Methods** (91):
  - `compute_polygon_triangulation(polygon_id)` -> `None` — Generates triangles and internal edges for the given polygon
  - `create_edge(vertex_id0, vertex_id1)` -> `EdgeID` — Adds a new edge to the mesh and returns its ID
  - `create_edge_with_id(edge_id, vertex_id0, vertex_id1)` -> `None` — Adds a new edge to the mesh with the given ID
  - `create_polygon()` — Adds a new polygon to the mesh and returns its ID. This will also make any missing edges, and all constituent triangles.
  - `create_polygon_group()` -> `PolygonGroupID` — Adds a new polygon group to the mesh and returns its ID
  - `create_polygon_group_with_id(polygon_group_id)` -> `None` — Adds a new polygon group to the mesh with the given ID
  - `create_polygon_with_id()` — Adds a new polygon to the mesh with the given ID. This will also make any missing edges, and all constituent triangles.
  - `create_triangle()` — Adds a new triangle to the mesh and returns its ID. This will also make an encapsulating polygon, and any missing edges.
  - `create_triangle_with_id(triangle_id, polygon_group_id, vertex_instance_i_ds)` -> `Array [ EdgeID ]` — Adds a new triangle to the mesh with the given ID. This will also make an encapsulating polygon, and any missing edges.
  - `create_vertex()` -> `VertexID` — Adds a new vertex to the mesh and returns its ID
  - `create_vertex_instance(vertex_id)` -> `VertexInstanceID` — Adds a new vertex instance to the mesh and returns its ID
  - `create_vertex_instance_with_id(vertex_instance_id, vertex_id)` -> `None` — Adds a new vertex instance to the mesh with the given ID
  - `create_vertex_with_id(vertex_id)` -> `None` — Adds a new vertex to the mesh with the given ID
  - `delete_edge(edge_id)` -> `Array [ VertexID ]` — Deletes an edge from a mesh
  - `delete_polygon()` — Deletes a polygon from the mesh
  - `delete_polygon_group(polygon_group_id)` -> `None` — Deletes a polygon group from the mesh
  - `delete_triangle()` — Deletes a triangle from the mesh
  - `delete_vertex(vertex_id)` -> `None` — Deletes a vertex from the mesh
  - `delete_vertex_instance(vertex_instance_id)` -> `Array [ VertexID ]` — Deletes a vertex instance from a mesh
  - `empty()` -> `None` — Empty the mesh description
  - `get_edge_connected_polygons(edge_id)` -> `Array [ PolygonID ]` — Returns the polygons connected to this edge
  - `get_edge_connected_triangles(edge_id)` -> `Array [ TriangleID ]` — Returns reference to an array of triangle IDs connected to this edge
  - `get_edge_count()` -> `int32` — Returns the number of edges
  - `get_edge_vertex(edge_id, vertex_number)` -> `VertexID` — Returns the vertex ID corresponding to one of the edge endpoints
  - `get_edge_vertices(edge_id)` -> `Array [ VertexID ]` — Returns a pair of vertex IDs defining the edge
  - `get_num_edge_connected_polygons(edge_id)` -> `int32` — Returns the number of polygons connected to this edge
  - `get_num_edge_connected_triangles(edge_id)` -> `int32` — Returns the number of triangles connected to this edge
  - `get_num_polygon_group_polygons(polygon_group_id)` -> `int32` — Returns the number of polygons in this polygon group
  - `get_num_polygon_internal_edges(polygon_id)` -> `int32` — Return the number of internal edges in this polygon
  - `get_num_polygon_triangles(polygon_id)` -> `int32` — Return the number of triangles which comprise this polygon
  - `get_num_polygon_vertices(polygon_id)` -> `int32` — Returns the number of vertices this polygon has
  - `get_num_vertex_connected_edges(vertex_id)` -> `int32` — Returns number of edges connected to this vertex
  - `get_num_vertex_connected_polygons(vertex_id)` -> `int32` — Returns the number of polygons connected to this vertex
  - `get_num_vertex_connected_triangles(vertex_id)` -> `int32` — Returns number of triangles connected to this vertex
  - `get_num_vertex_instance_connected_polygons(vertex_instance_id)` -> `int32` — Returns the number of polygons connected to this vertex instance.
  - `get_num_vertex_instance_connected_triangles(vertex_instance_id)` -> `int32` — Returns the number of triangles connected to this vertex instance
  - `get_num_vertex_vertex_instances(vertex_id)` -> `int32` — Returns number of vertex instances created from this vertex
  - `get_polygon_adjacent_polygons(polygon_id)` -> `Array [ PolygonID ]` — Populates the passed array with adjacent polygons
  - `get_polygon_count()` -> `int32` — Returns the number of polygons
  - `get_polygon_group_count()` -> `int32` — Returns the number of polygon groups
  - `get_polygon_group_polygons(polygon_group_id)` -> `Array [ PolygonID ]` — Returns the polygons associated with the given polygon group
  - `get_polygon_internal_edges(polygon_id)` -> `Array [ EdgeID ]`
  - `get_polygon_perimeter_edges(polygon_id)` -> `Array [ EdgeID ]` — Returns the edges which form the polygon perimeter
  - `get_polygon_polygon_group(polygon_id)` -> `PolygonGroupID` — Return the polygon group associated with a polygon
  - `get_polygon_triangles(polygon_id)` -> `Array [ TriangleID ]` — Return reference to an array of triangle IDs which comprise this polygon
  - `get_polygon_vertex_instances(polygon_id)` -> `Array [ VertexInstanceID ]` — Returns reference to an array of VertexInstance IDs forming the perimeter of this polygon
  - `get_polygon_vertices(polygon_id)` -> `Array [ VertexID ]` — Returns the vertices which form the polygon perimeter
  - `get_triangle_adjacent_triangles(triangle_id)` -> `Array [ TriangleID ]` — Returns the adjacent triangles to this triangle
  - `get_triangle_count()` -> `int32` — Returns the number of triangles
  - `get_triangle_edges(triangle_id)` -> `Array [ EdgeID ]` — Returns the edges which define this triangle
  - `get_triangle_polygon(triangle_id)` -> `PolygonID` — Get the polygon which contains this triangle
  - `get_triangle_polygon_group(triangle_id)` -> `PolygonGroupID` — Get the polygon group which contains this triangle
  - `get_triangle_vertex_instance(triangle_id, index)` -> `VertexInstanceID` — Get the specified vertex instance by index
  - `get_triangle_vertex_instances(triangle_id)` -> `Array [ VertexInstanceID ]` — Get the vertex instances which define this triangle
  - `get_triangle_vertices(triangle_id)` -> `Array [ VertexID ]` — Returns the vertices which define this triangle
  - `get_vertex_adjacent_vertices(vertex_id)` -> `Array [ VertexID ]` — Returns the vertices adjacent to this vertex
  - `get_vertex_connected_edges(vertex_id)` -> `Array [ EdgeID ]` — Returns reference to an array of Edge IDs connected to this vertex
  - `get_vertex_connected_polygons(vertex_id)` -> `Array [ PolygonID ]` — Returns the polygons connected to this vertex
  - `get_vertex_connected_triangles(vertex_id)` -> `Array [ TriangleID ]` — Returns the triangles connected to this vertex
  - `get_vertex_count()` -> `int32` — Returns the number of vertices
  - `get_vertex_instance_connected_polygons(vertex_instance_id)` -> `Array [ PolygonID ]` — Returns the polygons connected to this vertex instance
  - `get_vertex_instance_connected_triangles(vertex_instance_id)` -> `Array [ TriangleID ]` — Returns reference to an array of Triangle IDs connected to this vertex instance
  - `get_vertex_instance_count()` -> `int32` — Returns the number of vertex instances
  - `get_vertex_instance_for_polygon_vertex(polygon_id, vertex_id)` -> `VertexInstanceID` — Return the vertex instance which corresponds to the given vertex on the given polygon, or INDEX_NONE
  - `get_vertex_instance_for_triangle_vertex(triangle_id, vertex_id)` -> `VertexInstanceID` — Return the vertex instance which corresponds to the given vertex on the given triangle, or INDEX_NONE
  - `get_vertex_instance_pair_edge(vertex_instance_id0, vertex_instance_id1)` -> `EdgeID` — Returns the edge ID defined by the two given vertex instance IDs, if there is one; otherwise INDEX_NONE
  - `get_vertex_instance_vertex(vertex_instance_id)` -> `VertexID` — Returns the vertex ID associated with the given vertex instance
  - `get_vertex_pair_edge(vertex_id0, vertex_id1)` -> `EdgeID` — Returns the edge ID defined by the two given vertex IDs, if there is one; otherwise INDEX_NONE
  - `get_vertex_position(vertex_id)` -> `Vector` — Gets a vertex position
  - `get_vertex_vertex_instances(vertex_id)` -> `Array [ VertexInstanceID ]` — Returns reference to an array of VertexInstance IDs instanced from this vertex
  - `is_edge_internal(edge_id)` -> `bool` — Determine whether a given edge is an internal edge between triangles of a polygon
  - `is_edge_internal_to_polygon(edge_id, polygon_id)` -> `bool` — Determine whether a given edge is an internal edge between triangles of a specific polygon
  - `is_edge_valid(edge_id)` -> `bool` — Returns whether the passed edge ID is valid
  - `is_empty()` -> `bool` — Return whether the mesh description is empty
  - `is_polygon_group_valid(polygon_group_id)` -> `bool` — Returns whether the passed polygon group ID is valid
  - `is_polygon_valid(polygon_id)` -> `bool` — Returns whether the passed polygon ID is valid
  - `is_triangle_part_of_ngon(triangle_id)` -> `bool` — Determines if this triangle is part of an n-gon
  - `is_triangle_valid(triangle_id)` -> `bool` — Returns whether the passed triangle ID is valid
  - `is_vertex_instance_valid(vertex_instance_id)` -> `bool` — Returns whether the passed vertex instance ID is valid
  - `is_vertex_orphaned(vertex_id)` -> `bool` — Returns whether a given vertex is orphaned, i.e. it doesnât form part of any polygon
  - `is_vertex_valid(vertex_id)` -> `bool` — Returns whether the passed vertex ID is valid
  - `reserve_new_edges(number_of_new_edges)` -> `None` — Reserves space for this number of new edges
  - `reserve_new_polygon_groups(number_of_new_polygon_groups)` -> `None` — Reserves space for this number of new polygon groups
  - `reserve_new_polygons(number_of_new_polygons)` -> `None` — Reserves space for this number of new polygons
  - `reserve_new_triangles(number_of_new_triangles)` -> `None` — Reserves space for this number of new triangles
  - `reserve_new_vertex_instances(number_of_new_vertex_instances)` -> `None` — Reserves space for this number of new vertex instances
  - `reserve_new_vertices(number_of_new_vertices)` -> `None` — Reserves space for this number of new vertices
  - `reverse_polygon_facing(polygon_id)` -> `None` — Reverse the winding order of the vertices of this polygon
  - `set_polygon_polygon_group(polygon_id, polygon_group_id)` -> `None` — Sets the polygon group associated with a polygon
  - `set_polygon_vertex_instances(polygon_id, vertex_instance_i_ds)` -> `None` — Set the vertex instance at the given index around the polygon to the new value
  - `set_vertex_position(vertex_id, position)` -> `None` — Sets a vertex position
