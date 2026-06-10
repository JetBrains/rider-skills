# UE Python API — AvalancheShapes Module

**33 types** from the `AvalancheShapes` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaShapeMaterialUVParameters`, `AvaShapeMeshData`, `AvaShapeParametricMaterial`, `AvaShapeRectangleCornerSettings`, `AvaShapeRoundedCorner`, `AvaShapeRoundedCornerSettings`, `AvaShape2DArrowDynamicMesh`, `AvaShape2DDynMeshBase`, `AvaShape3DDynMeshBase`, `AvaShapeActor`, `AvaShapeChevronDynamicMesh`, `AvaShapeConeDynamicMesh`, `AvaShapeCubeDynamicMesh`, `AvaShapeDynamicMeshBase`, `AvaShapeEllipseDynamicMesh`, `AvaShapeIrregularPolygonDynamicMesh`, `AvaShapeLineDynamicMesh`, `AvaShapeMeshFunctions`, `AvaShapeNGonDynamicMesh`, `AvaShapeRectangleDynamicMesh`, ... (33 total)

---

## Classes

### `unreal.AvaShapeMaterialUVParameters`
Inherits: `StructBase` | Header: `AvaShapeUVParameters.h`

Ava Shape Material UVParameters

**Properties** (8):
  - `anchor`: `Vector2D` — [Read-Write] (Vector2D)
  - `anchor_preset`: `AvaAnchors` — [Read-Write] (AvaAnchors)
  - `flip_horizontal`: `bool` — [Read-Write] (bool)
  - `flip_vertical`: `bool` — [Read-Write] (bool)
  - `mode`: `AvaShapeUVMode` — [Read-Write] (AvaShapeUVMode)
  - `offset`: `Vector2D` — [Read-Write] (Vector2D)
  - `rotation`: `float` — [Read-Write] (float)
  - `scale`: `Vector2D` — [Read-Write] (Vector2D)

### `unreal.AvaShapeMeshData`
Inherits: `StructBase` | Header: `AvaShapeMesh.h`

Represents a mesh section with its material, uv data

**Properties** (6):
  - `material`: `MaterialInterface` — [Read-Write] mesh material (MaterialInterface)
  - `material_type`: `MaterialType` — [Read-Write] mesh material type (MaterialType)
  - `material_uv_params`: `AvaShapeMaterialUVParameters` — [Read-Write] mesh material UV params (AvaShapeMaterialUVParameters)
  - `mesh_visible`: `bool` [Read-Only] — [Read-Only] whether the mesh is currently visible or not and should be editable (bool)
  - `override_primary_uv_params`: `bool` — [Read-Write] mesh uses same uv params as primary (bool)
  - `parametric_material`: `AvaShapeParametricMaterial` — [Read-Write] parametric material settings (AvaShapeParametricMaterial)

### `unreal.AvaShapeParametricMaterial`
Inherits: `StructBase` | Header: `AvaShapeParametricMaterial.h`

Ava Shape Parametric Material

**Properties** (9):
  - `color_a`: `LinearColor` — [Read-Write] Primary colour for the material (LinearColor)
  - `color_b`: `LinearColor` — [Read-Write] Secondary colour for the material (LinearColor)
  - `gradient_offset`: `float` — [Read-Write] Offset for gradient style material (float)
  - `gradient_rotation`: `float` — [Read-Write] Rotation for gradient style material (float)
  - `style`: `AvaShapeParametricMaterialStyle` — [Read-Write] Default style for the material (AvaShapeParametricMaterialStyle)
  - `texture`: `Texture` — [Read-Write] Simple texture for the material (Texture)
  - `translucency`: `AvaShapeParametricMaterialTranslucency` — [Read-Write] How to handle translucency for the underlying material (AvaShapeParametricMaterialTrans...
  - `use_two_sided_material`: `bool` — [Read-Write] whether the material is one sided or two sided (bool)
  - `use_unlit_material`: `bool` — [Read-Write] whether the material is unlit or default lit (bool)

### `unreal.AvaShapeRectangleCornerSettings`
Inherits: `StructBase` | Header: `AvaShapeRectangleDynMesh.h`

Ava Shape Rectangle Corner Settings

**Properties** (3):
  - `bevel_size`: `float` — [Read-Write] (float)
  - `bevel_subdivisions`: `int` — [Read-Write] (uint8)
  - `type`: `AvaShapeCornerType` — [Read-Write] (AvaShapeCornerType)

### `unreal.AvaShapeRoundedCorner`
Inherits: `StructBase` | Header: `AvaShapeIrregularPolygonDynMesh.h`

Ava Shape Rounded Corner

**Properties** (2):
  - `location`: `Vector2D` — [Read-Write] (Vector2D)
  - `settings`: `AvaShapeRoundedCornerSettings` — [Read-Write] (AvaShapeRoundedCornerSettings)

### `unreal.AvaShapeRoundedCornerSettings`
Inherits: `StructBase` | Header: `AvaShapeIrregularPolygonDynMesh.h`

Ava Shape Rounded Corner Settings

**Properties** (2):
  - `bevel_size`: `float` — [Read-Write] (float)
  - `bevel_subdivisions`: `int` — [Read-Write] (uint8)

### `unreal.AvaShape2DArrowDynamicMesh`
Inherits: `AvaShape2DDynMeshBase` | Header: `AvaShape2DArrowDynMesh.h`

Ava Shape 2DArrow Dynamic Mesh

**Properties** (5):
  - `both_side_arrows`: `bool` — [Read-Write] whether there should be an arrow on both side, arrows will have same ratio (bool)
  - `ratio_arrow_line`: `float` — [Read-Write] represents the ratio for the arrow and the line, 0.6 means 60% arrow and 40% line (floa...
  - `ratio_arrow_y`: `float` — [Read-Write] represents the ratio for the arrow end, 0 means arrow point will be at bottom, 1 means ...
  - `ratio_line_height`: `float` — [Read-Write] represents the ratio for the line height, 1 means 100% of the height available (float)
  - `ratio_line_y`: `float` — [Read-Write] represents the ratio for the arrow end, 0 means arrow point will be at bottom, 1 means ...

### `unreal.AvaShape2DDynMeshBase`
Inherits: `AvaShapeDynamicMeshBase` | Header: `AvaShape2DDynMeshBase.h`

Ava Shape 2DDyn Mesh Base

**Properties** (2):
  - `pixel_size2d`: `Vector2D` — [Read-Write] pixel size of the mesh, will only be available in editor (Vector2D)
  - `size2d`: `Vector2D` — [Read-Write] total size in 2D from 0 to mesh size and not origin (Vector2D)

### `unreal.AvaShape3DDynMeshBase`
Inherits: `AvaShapeDynamicMeshBase` | Header: `AvaShape3DDynMeshBase.h`

Ava Shape 3DDyn Mesh Base

**Properties** (2):
  - `pixel_size3d`: `Vector` — [Read-Write] pixel size of the mesh, will only be available in editor (Vector)
  - `size3d`: `Vector` — [Read-Write] * Corresponds to the total size from 0 to mesh size (Vector)

### `unreal.AvaShapeActor`
Inherits: `Actor` | Header: `AvaShapeActor.h`

Ava Shape Actor

**Methods** (2):
  - `get_mode_details_object()` -> `Object` — Get Mode Details Object
  - `set_rectangle(size, transform)` -> `AvaShapeRectangleDynamicMesh` — Sets the Shape Actor mesh to Rectangle.

**Properties** (2):
  - `dynamic_mesh`: `AvaShapeDynamicMeshBase` [Read-Only] — [Read-Only] (AvaShapeDynamicMeshBase)
  - `shape_mesh_component`: `DynamicMeshComponent` [Read-Only] — [Read-Only] (DynamicMeshComponent)

### `unreal.AvaShapeChevronDynamicMesh`
Inherits: `AvaShape2DDynMeshBase` | Header: `AvaShapeChevronDynMesh.h`

Ava Shape Chevron Dynamic Mesh

**Properties** (1):
  - `ratio_chevron`: `float` — [Read-Write] represents the ratio for the chevron size (float)

### `unreal.AvaShapeConeDynamicMesh`
Inherits: `AvaShape3DDynMeshBase` | Header: `AvaShapeConeDynMesh.h`

Ava Shape Cone Dynamic Mesh

**Properties** (4):
  - `angle_degree`: `float` — [Read-Write] represents the base angle in degree for the cone (float)
  - `num_sides`: `int` — [Read-Write] The number of sides around the base of the cone (uint8)
  - `start_degree`: `float` — [Read-Write] represents the starting angle in degree for the cone (float)
  - `top_radius`: `float` — [Read-Write] the ratio for the radius of the cone top (float)

### `unreal.AvaShapeCubeDynamicMesh`
Inherits: `AvaShape3DDynMeshBase` | Header: `AvaShapeCubeDynMesh.h`

Ava Shape Cube Dynamic Mesh

**Properties** (2):
  - `bevel_num`: `int` — [Read-Write] represents the bevel number of division, only valid when bevel size is greater than zer...
  - `bevel_size_ratio`: `float` — [Read-Write] represents the bevel size applied on each face of the cube, 0 means no bevels (float)

### `unreal.AvaShapeDynamicMeshBase`
Inherits: `ActorComponent` | Header: `AvaShapeDynMeshBase.h`

Ava Shape Dynamic Mesh Base

**Methods** (1):
  - `toggle_gizmo(gizmo_component, show_as_gizmo = True)` -> `None` — Whether to show the callee as a gizmo or not

**Properties** (6):
  - `allow_edit_size`: `bool` [Read-Only] — [Read-Only] enable mesh size property editing (bool)
  - `mesh_datas`: `None` [Read-Only] — [Read-Only] Meshes used for the current shape sections (Map[int32,AvaShapeMeshData])
  - `size_type`: `SizeType` — [Read-Write] the type of size you want to handle (SizeType)
  - `uniform_scaled_size`: `float` — [Read-Write] Uniform scaled size of the mesh (float)
  - `use_primary_material_everywhere`: `bool` — [Read-Write] use primary material for every slot available (bool)
  - `vertex_color`: `LinearColor` — [Read-Write] (LinearColor)

### `unreal.AvaShapeEllipseDynamicMesh`
Inherits: `AvaShape2DDynMeshBase` | Header: `AvaShapeEllipseDynMesh.h`

Ava Shape Ellipse Dynamic Mesh

**Properties** (3):
  - `angle_degree`: `float` — [Read-Write] represents the angle in degree for the ellipse (float)
  - `num_sides`: `int` — [Read-Write] The number of sides for the shape (uint8)
  - `start_degree`: `float` — [Read-Write] represents the starting angle in degree for the ellipse (float)

### `unreal.AvaShapeIrregularPolygonDynamicMesh`
Inherits: `AvaShape2DDynMeshBase` | Header: `AvaShapeIrregularPolygonDynMesh.h`

Ava Shape Irregular Polygon Dynamic Mesh

**Properties** (3):
  - `global_bevel_size`: `float` — [Read-Write] (float)
  - `global_bevel_subdivisions`: `int` — [Read-Write] (uint8)
  - `points`: `None` — [Read-Write] (Array[AvaShapeRoundedCorner])

### `unreal.AvaShapeLineDynamicMesh`
Inherits: `AvaShapeRoundedPolygonDynamicMesh` | Header: `AvaShapeLineDynMesh.h`

Ava Shape Line Dynamic Mesh

**Properties** (2):
  - `line_width`: `float` — [Read-Write] (float)
  - `vector`: `Vector2D` — [Read-Write] (Vector2D)

### `unreal.AvaShapeMeshFunctions`
Inherits: `BlueprintFunctionLibrary` | Header: `AvaShapePrimitiveFunctions.h`

FunctionLibrary to Create Ava Shape Meshes and apply them to a Shape Actor.

**Methods** (1):
  - `set_rectangle(shape_actor, size, transform)` -> `AvaShapeRectangleDynamicMesh` [classmethod] — Sets the Shape Actor mesh to Rectangle.

### `unreal.AvaShapeNGonDynamicMesh`
Inherits: `AvaShapeRoundedPolygonDynamicMesh` | Header: `AvaShapeNGonDynMesh.h`

Ava Shape NGon Dynamic Mesh

**Properties** (1):
  - `num_sides`: `int` — [Read-Write] (uint8)

### `unreal.AvaShapeRectangleDynamicMesh`
Inherits: `AvaShape2DDynMeshBase` | Header: `AvaShapeRectangleDynMesh.h`

Ava Shape Rectangle Dynamic Mesh

**Properties** (10):
  - `bottom_left`: `AvaShapeRectangleCornerSettings` — [Read-Write] (AvaShapeRectangleCornerSettings)
  - `bottom_right`: `AvaShapeRectangleCornerSettings` — [Read-Write] (AvaShapeRectangleCornerSettings)
  - `global_bevel_size`: `float` — [Read-Write] (float)
  - `global_bevel_subdivisions`: `int` — [Read-Write] (uint8)
  - `horizontal_alignment`: `AvaHorizontalAlignment` — [Read-Write] (AvaHorizontalAlignment)
  - `left_slant`: `float` — [Read-Write] Angle in degrees for the left slant of the rectangle (float)
  - `right_slant`: `float` — [Read-Write] Angle in degrees for the right slant of the rectangle (float)
  - `top_left`: `AvaShapeRectangleCornerSettings` — [Read-Write] (AvaShapeRectangleCornerSettings)
  - `top_right`: `AvaShapeRectangleCornerSettings` — [Read-Write] (AvaShapeRectangleCornerSettings)
  - `vertical_alignment`: `AvaVerticalAlignment` — [Read-Write] (AvaVerticalAlignment)

### `unreal.AvaShapeRingDynamicMesh`
Inherits: `AvaShape2DDynMeshBase` | Header: `AvaShapeRingDynMesh.h`

Ava Shape Ring Dynamic Mesh

**Properties** (4):
  - `angle_degree`: `float` — [Read-Write] represents the angle in degree for the ring (float)
  - `inner_size`: `float` — [Read-Write] (float)
  - `num_sides`: `int` — [Read-Write] (uint8)
  - `start_degree`: `float` — [Read-Write] represents the starting angle in degree for the ring (float)

### `unreal.AvaShapeRoundedPolygonDynamicMesh`
Inherits: `AvaShape2DDynMeshBase` | Header: `AvaShapeRoundedPolygonDynMesh.h`

Ava Shape Rounded Polygon Dynamic Mesh

**Properties** (2):
  - `bevel_size`: `float` — [Read-Write] (float)
  - `bevel_subdivisions`: `int` — [Read-Write] (uint8)

### `unreal.AvaShapeSphereDynamicMesh`
Inherits: `AvaShape3DDynMeshBase` | Header: `AvaShapeSphereDynMesh.h`

Ava Shape Sphere Dynamic Mesh

**Properties** (5):
  - `end_longitude`: `float` — [Read-Write] represents the longitude (Z) angle in degree for the sphere at the end (float)
  - `latitude_degree`: `float` — [Read-Write] represents the total latitude (Y) angle in degree for the sphere (float)
  - `num_sides`: `int` — [Read-Write] represents the precision of the sphere mesh (uint8)
  - `start_latitude`: `float` — [Read-Write] represents the latitude (Y) angle in degree for the sphere at the start (float)
  - `start_longitude`: `float` — [Read-Write] represents the longitude (Z) angle in degree for the sphere at the start (float)

### `unreal.AvaShapeStarDynamicMesh`
Inherits: `AvaShapeRoundedPolygonDynamicMesh` | Header: `AvaShapeStarDynMesh.h`

Ava Shape Star Dynamic Mesh

**Properties** (2):
  - `inner_size`: `float` — [Read-Write] (float)
  - `num_points`: `int` — [Read-Write] (uint8)

### `unreal.AvaShapeTorusDynamicMesh`
Inherits: `AvaShape3DDynMeshBase` | Header: `AvaShapeTorusDynMesh.h`

Ava Shape Torus Dynamic Mesh

**Properties** (5):
  - `angle_degree`: `float` — [Read-Write] represents the tube angle in degree for the torus (float)
  - `inner_size`: `float` — [Read-Write] represents the size ratio available inside the torus (float)
  - `num_sides`: `int` — [Read-Write] represents the precision of each circle composing a slice (uint8)
  - `num_slices`: `int` — [Read-Write] represents the number of slices composing the tube (uint8)
  - `start_degree`: `float` — [Read-Write] represents the starting angle in degree for the torus (float)

### `unreal.MovieSceneAvaShapeRectCornerSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneAvaShapeRectCornerSection.h`

Movie Scene Ava Shape Rect Corner Section

### `unreal.MovieSceneAvaShapeRectCornerTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneAvaShapeRectCornerTrack.h`

Track for animating FAvaShapeRectangleCornerSettings properties

### `unreal.AvaShapeCornerType`
Inherits: `EnumBase` | Header: `AvaShapesDefs.h`

EAva Shape Corner Type

**Properties** (3):
  - `CURVE_IN`: `AvaShapeCornerType = Ellipsis` — 1
  - `CURVE_OUT`: `AvaShapeCornerType = Ellipsis` — 2
  - `POINT`: `AvaShapeCornerType = Ellipsis` — 0

### `unreal.AvaShapeParametricMaterialStyle`
Inherits: `EnumBase` | Header: `AvaShapesDefs.h`

EAva Shape Parametric Material Style

**Properties** (3):
  - `LINEAR_GRADIENT`: `AvaShapeParametricMaterialStyle = Ellipsis` — 1
  - `SOLID`: `AvaShapeParametricMaterialStyle = Ellipsis` — 0
  - `TEXTURE`: `AvaShapeParametricMaterialStyle = Ellipsis` — 2

### `unreal.AvaShapeParametricMaterialTranslucency`
Inherits: `EnumBase` | Header: `AvaShapeParametricMaterial.h`

EAva Shape Parametric Material Translucency

**Properties** (3):
  - `AUTO`: `AvaShapeParametricMaterialTranslucency = Ellipsis` — Switches when parameters have opacity < 1 0
  - `DISABLED`: `AvaShapeParametricMaterialTranslucency = Ellipsis` — Uses opaque material regardless of opacity parameters 1
  - `ENABLED`: `AvaShapeParametricMaterialTranslucency = Ellipsis` — Uses translucent material regardless of opacity parameters 2

### `unreal.AvaShapeUVMode`
Inherits: `EnumBase` | Header: `AvaShapesDefs.h`

EAva Shape UVMode

**Properties** (2):
  - `STRETCH`: `AvaShapeUVMode = Ellipsis` — 0
  - `UNIFORM`: `AvaShapeUVMode = Ellipsis` — uvs are stretched and fill the shape size 1

### `unreal.MaterialType`
Inherits: `EnumBase` | Header: `AvaShapesDefs.h`

EMaterial Type

**Properties** (3):
  - `ASSET`: `MaterialType = Ellipsis` — 0
  - `MATERIAL_DESIGNER`: `MaterialType = Ellipsis` — 2
  - `PARAMETRIC`: `MaterialType = Ellipsis` — 1

### `unreal.SizeType`
Inherits: `EnumBase` | Header: `AvaShapesDefs.h`

ESize Type

**Properties** (2):
  - `PIXEL`: `SizeType = Ellipsis` — cm 1
  - `UNREAL_UNIT`: `SizeType = Ellipsis` — 0
