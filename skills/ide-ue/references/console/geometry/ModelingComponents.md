# UE Python API — ModelingComponents Module

**23 types** from the `ModelingComponents` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CreateActorParams`, `CreateActorResult`, `CreateComponentParams`, `CreateComponentResult`, `CreateMaterialObjectParams`, `CreateMaterialObjectResult`, `CreateMeshObjectParams`, `CreateMeshObjectResult`, `CreateTextureObjectParams`, `CreateTextureObjectResult`, `ModelingToolsAxisFilter`, `ModelingToolsColorChannelFilter`, `LineSetComponent`, `MeshWireframeComponent`, `ModelingObjectsCreationAPI`, `OctreeDynamicMeshComponent`, `PointSetComponent`, `PreviewGeometryActor`, `PreviewMeshActor`, `TriangleSetComponent`, ... (23 total)

---

## Classes

### `unreal.CreateActorParams`
Inherits: `StructBase` | Header: `ModelingObjectsCreationAPI.h`

FCreateActorParams is a collection of input data intended to be passed to UModelingObjectsCreationAPI::CreateNewActor().

**Properties** (1):
  - `template_actor`: `Actor` — [Read-Write] input data
deprecated: TemplateActor is being deprecated. Please use TemplateAsset inst...

### `unreal.CreateActorResult`
Inherits: `StructBase` | Header: `ModelingObjectsCreationAPI.h`

FCreateActorResult is returned by UModelingObjectsCreationAPI::FCreateActorParams() to indicate success/failure and provide information about created actors

### `unreal.CreateComponentParams`
Inherits: `StructBase` | Header: `ModelingObjectsCreationAPI.h`

FCreateComponentParams is a collection of input data intended to be passed to UModelingObjectsCreationAPI::CreateNewComponentOnActor().

### `unreal.CreateComponentResult`
Inherits: `StructBase` | Header: `ModelingObjectsCreationAPI.h`

FCreateComponentResult is returned by UModelingObjectsCreationAPI::CreateNewComponentOnActor() to indicate success/failure and provide information about created components

### `unreal.CreateMaterialObjectParams`
Inherits: `StructBase` | Header: `ModelingObjectsCreationAPI.h`

FCreateMaterialObjectParams is a collection of input data intended to be passed to UModelingObjectsCreationAPI::CreateMaterialObject().

### `unreal.CreateMaterialObjectResult`
Inherits: `StructBase` | Header: `ModelingObjectsCreationAPI.h`

FCreateMaterialObjectResult is returned by UModelingObjectsCreationAPI::CreateMaterialObject() to indicate success/failure and provide information about created texture objects

### `unreal.CreateMeshObjectParams`
Inherits: `StructBase` | Header: `ModelingObjectsCreationAPI.h`

FCreateMeshObjectParams is a collection of input data intended to be passed to UModelingObjectsCreationAPI::CreateMeshObject(). Not all data necessarily needs to be specified, this will depend on the ...

**Properties** (1):
  - `nanite_proxy_triangle_percent`: `float` — [Read-Write] Specify the Nanite proxy triangle percentage for this new mesh object
deprecated: Repla...

### `unreal.CreateMeshObjectResult`
Inherits: `StructBase` | Header: `ModelingObjectsCreationAPI.h`

FCreateMeshObjectResult is returned by UModelingObjectsCreationAPI::CreateMeshObject() to indicate success/failure and provide information about created mesh objects

### `unreal.CreateTextureObjectParams`
Inherits: `StructBase` | Header: `ModelingObjectsCreationAPI.h`

FCreateTextureObjectParams is a collection of input data intended to be passed to UModelingObjectsCreationAPI::CreateTextureObject(). Not all data necessarily needs to be specified, this will depend o...

### `unreal.CreateTextureObjectResult`
Inherits: `StructBase` | Header: `ModelingObjectsCreationAPI.h`

FCreateTextureObjectResult is returned by UModelingObjectsCreationAPI::CreateTextureObject() to indicate success/failure and provide information about created texture objects

### `unreal.ModelingToolsAxisFilter`
Inherits: `StructBase` | Header: `AxisFilterPropertyType.h`

Modeling Tools Axis Filter

### `unreal.ModelingToolsColorChannelFilter`
Inherits: `StructBase` | Header: `ColorChannelFilterPropertyType.h`

Modeling Tools Color Channel Filter

### `unreal.LineSetComponent`
Inherits: `MeshComponent` | Header: `LineSetComponent.h`

Line Set Component

**Methods** (3):
  - `add_lines(start, end, color = [0,0,0,255], thickness = 1.000000, depth_bias = 0.000000)` -> `int32` — Add lines to be rendered using the component.
  - `clear()` -> `None` — Clear the line set
  - `set_line_material(line_material)` -> `None` — Specify material which handles lines

### `unreal.MeshWireframeComponent`
Inherits: `MeshComponent` | Header: `MeshWireframeComponent.h`

UMeshWireframeComponent draws a mesh wireframe as lines, with line color/thickness varying depending on line type and the configuration settings. Currently can draw:

### `unreal.ModelingObjectsCreationAPI`
Inherits: `Object` | Header: `ModelingObjectsCreationAPI.h`

UModelingObjectsCreationAPI is a base interface for functions that can be used to create various types of objects from Modeling Tools, or other sources. The âtypeâ is very generic here - âMeshâ...

**Methods** (5):
  - `create_material_object(create_material_params)` -> `CreateMaterialObjectResult` — Create a new material object based on the data in CreateMaterialParams
  - `create_mesh_object(create_mesh_params)` -> `CreateMeshObjectResult` — Create a new mesh object based on the data in CreateMeshParams
  - `create_new_actor(create_actor_params)` -> `CreateActorResult` — Create a new material object based on the data in CreateMaterialParams
  - `create_new_component_on_actor(create_component_params)` -> `CreateComponentResult` — Create a new component on the specified actor of the requested class.
  - `create_texture_object(create_tex_params)` -> `CreateTextureObjectResult` — Create a new texture object based on the data in CreateTexParams

### `unreal.OctreeDynamicMeshComponent`
Inherits: `BaseDynamicMeshComponent` | Header: `OctreeDynamicMeshComponent.h`

UOctreeDynamicMeshComponent is a mesh component similar to UProceduralMeshComponent, except it bases the renderable geometry off an internal FDynamicMesh3 instance. The class generally has the same ca...

**Methods** (1):
  - `set_dynamic_mesh(new_mesh)` -> `None` — Set Dynamic Mesh

### `unreal.PointSetComponent`
Inherits: `MeshComponent` | Header: `PointSetComponent.h`

UPointSetComponent is a Component that draws a set of points, as small squares. Per-point Color and (view-space) Size is supported. Normals are not supported.

**Methods** (3):
  - `add_points(positions, color = [0,0,0,255], size = 2.000000, depth_bias = 0.000000)` -> `int32` — Add points to be rendered using the component.
  - `clear()` -> `None` — Clear all primitives
  - `set_point_material(point_material)` -> `None` — Specify material which handles points

### `unreal.PreviewGeometryActor`
Inherits: `InternalToolFrameworkActor` | Header: `PreviewGeometryActor.h`

An actor suitable for attaching components used to draw preview elements, such as LineSetComponent and TriangleSetComponent.

### `unreal.PreviewMeshActor`
Inherits: `InternalToolFrameworkActor` | Header: `PreviewMesh.h`

UPreviewMesh internally spawns a APreviewMeshActor to hold the preview mesh object. We use this AInternalToolFrameworkActor subclass so that we can identify such objects at higher levels (for example ...

### `unreal.TriangleSetComponent`
Inherits: `MeshComponent` | Header: `TriangleSetComponent.h`

A component for rendering an arbitrary assortment of triangles. Suitable, for instance, for rendering highlighted faces.

### `unreal.CreateMeshObjectSourceMeshType`
Inherits: `EnumBase` | Header: `ModelingObjectsCreationAPI.h`

Types of possible source meshes stored in FCreateMeshObjectParams

**Properties** (2):
  - `DYNAMIC_MESH`: `CreateMeshObjectSourceMeshType = Ellipsis` — 1
  - `MESH_DESCRIPTION`: `CreateMeshObjectSourceMeshType = Ellipsis` — 0

### `unreal.CreateModelingObjectResult`
Inherits: `EnumBase` | Header: `ModelingObjectsCreationAPI.h`

Result code returned by UModelingObjectsCreationAPI functions

**Properties** (11):
  - `CANCELLED`: `CreateModelingObjectResult = Ellipsis` — 1
  - `FAILED_ACTOR_CREATION_FAILED`: `CreateModelingObjectResult = Ellipsis` — 8
  - `FAILED_ASSET_CREATION_FAILED`: `CreateModelingObjectResult = Ellipsis` — 7
  - `FAILED_INVALID_ACTOR`: `CreateModelingObjectResult = Ellipsis` — 10
  - `FAILED_INVALID_MATERIAL`: `CreateModelingObjectResult = Ellipsis` — 9
  - `FAILED_INVALID_MESH`: `CreateModelingObjectResult = Ellipsis` — 5
  - `FAILED_INVALID_TEXTURE`: `CreateModelingObjectResult = Ellipsis` — 6
  - `FAILED_INVALID_WORLD`: `CreateModelingObjectResult = Ellipsis` — 4
  - `FAILED_NO_API_FOUND`: `CreateModelingObjectResult = Ellipsis` — 3
  - `FAILED_UNKNOWN`: `CreateModelingObjectResult = Ellipsis` — 2
  - `OK`: `CreateModelingObjectResult = Ellipsis` — 0

### `unreal.CreateObjectTypeHint`
Inherits: `EnumBase` | Header: `ModelingObjectsCreationAPI.h`

Hint for the type of mesh object a UModelingObjectsCreationAPI might create based on FCreateMeshObjectParams data. This can be used by clients to try to specify the type of object to emit, however the...

**Properties** (4):
  - `DYNAMIC_MESH_ACTOR`: `CreateObjectTypeHint = Ellipsis` — 3
  - `STATIC_MESH`: `CreateObjectTypeHint = Ellipsis` — 1
  - `UNDEFINED`: `CreateObjectTypeHint = Ellipsis` — 0
  - `VOLUME`: `CreateObjectTypeHint = Ellipsis` — 2
